import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12



Window {
    id: win
    visible: true
    width: 480
    height: 640
    title: "Messenger"

    //Readonly properties used as constants
    readonly property int defMargin: 10
    //Background color for header and footer panels
    readonly property color panelColor: "#17212B"
    //Background color message bubbles
    readonly property color bubbleColor: "#2b5278"
    //Page background color
    readonly property color bgColor: "#0E1621"
    //Color for text elements
    readonly property color textColor: "white"

    Page {
        id: page
        anchors.fill: parent // растянуть на все окно

        header: PageHeader {
            title: "Test messenger"
        }
        footer: MessageEditor {
            onNewMessage: {
                //Append new message
                var newMsg = {};
                newMsg.text = msg;
                newMsg.time = Qt.formatTime(new Date(), "hh:mm");
                listModel.append(newMsg);
            }
        }
        background: Rectangle {
            color: bgColor
        }

        ListView {
            id: listView
            anchors.fill: parent
            spacing: defMargin
            ScrollBar.vertical: ScrollBar {}

            model: listModel
            delegate: MessageItem {
                height: 60
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: defMargin*2
                text: model.text
                time: model.time
            }
        }
        ListModel {
            id: listModel
            ListElement {
                text: "Hi! Where have you been?"
                time: "12:30"
            }
            ListElement {
                text: "Sorry! I was very busy."
                time: "12:31"
            }
            ListElement {
                text: "Ok. Understood."
                time: "12:31"
            }
            ListElement {
                text: "Any plans for the evening?"
                time: "12:32"
            }
        }
    }
}
