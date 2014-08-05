Return-Path: <Yasir_Khan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 0D28E65CF7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Aug 2014 11:28:38 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1XEcv1-0003kX-U7 from Yasir_Khan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Aug 2014 04:28:39 -0700
Received: from svr-pkl-eng-06.pkl.mentorg.com ([137.202.156.65]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 5 Aug 2014 04:28:39 -0700
From: Yasir Khan <yasir_khan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Aug 2014 16:27:56 +0500
Message-Id: <1407238076-60915-1-git-send-email-yasir_khan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
X-OriginalArrivalTime: 05 Aug 2014 11:28:39.0799 (UTC)
	FILETIME=[67B1B870:01CFB0A0]
Subject: [PATCH] bluez5: Allow method calls over dbus for bluetooth daemon
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Aug 2014 11:28:40 -0000

From: Yasir-Khan <yasir_khan@mentor.com>

This patch changes the dbus policy settings in order to allow
calling methods over dbus. bluez5 and pulseaudio rely on this
mechanism to configure media end points. Previously bluetoothd
was failing to configure the media end points with error
org.freedesktop.DBus.Error.AccessDenied, due to which bluetooth
headset and smartphone were unable to connect in A2DP mode.

Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
---
 .../bluez5/bluez5/bluetooth.conf                   |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5/bluetooth.conf b/meta/recipes-connectivity/bluez5/bluez5/bluetooth.conf
index e21e72e..26845bb 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/bluetooth.conf
+++ b/meta/recipes-connectivity/bluez5/bluez5/bluetooth.conf
@@ -11,6 +11,7 @@
     <allow own="org.bluez"/>
     <allow send_destination="org.bluez"/>
     <allow send_interface="org.bluez.Agent1"/>
+    <allow send_type="method_call"/>
   </policy>
 
 </busconfig>
-- 
1.7.9.5


