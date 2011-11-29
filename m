Received: from mail-out.m-online.net ([212.18.0.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agust@denx.de>) id 1RVNjz-0003Fe-6i
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 14:28:55 +0100
Received: from frontend1.mail.m-online.net (frontend1.mail.intern.m-online.net
	[192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 6EB991853B80;
	Tue, 29 Nov 2011 14:16:13 +0100 (CET)
X-Auth-Info: BasGlOMBMiwth3i4KMFPwoQ9Nik05KBZrfpRkOkeBDs=
Received: from localhost (p4FC4623D.dip.t-dialin.net [79.196.98.61])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA id 94CFC1C000E8;
	Tue, 29 Nov 2011 14:12:47 +0100 (CET)
From: Anatolij Gustschin <agust@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 14:12:47 +0100
Message-Id: <1322572367-4246-1-git-send-email-agust@denx.de>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] qt4: qt-mobility: fix QML video player crash
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Nov 2011 13:28:55 -0000

Fix QML video player crash which happens when attempting
to play OGG video files.

Signed-off-by: Anatolij Gustschin <agust@denx.de>
---
 ...stvideoconnector-fixed-buffers-allocation.patch |   32 ++++++++++++++++++++
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |    3 +-
 2 files changed, 34 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/files/0001-gstvideoconnector-fixed-buffers-allocation.patch

diff --git a/meta/recipes-qt/qt4/files/0001-gstvideoconnector-fixed-buffers-allocation.patch b/meta/recipes-qt/qt4/files/0001-gstvideoconnector-fixed-buffers-allocation.patch
new file mode 100644
index 0000000..cea07c9
--- /dev/null
+++ b/meta/recipes-qt/qt4/files/0001-gstvideoconnector-fixed-buffers-allocation.patch
@@ -0,0 +1,32 @@
+From b308508b49afa9a129b4e4589c57cd107d1320b8 Mon Sep 17 00:00:00 2001
+From: Dmytro Poplavskiy <dmytro.poplavskiy@nokia.com>
+Date: Fri, 6 May 2011 10:35:11 +1000
+Subject: [PATCH] gstvideoconnector: fixed buffers allocation
+
+It should not be necessary, but at least theora video decoder doesn't
+iniatilize *buf, while gst_pad_alloc_buffer relies on buf being NULL.
+
+Task-number: QTMOBILITY-1611
+Reviewed-by: Michael Goddard
+---
+ plugins/multimedia/gstreamer/gstvideoconnector.c |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/plugins/multimedia/gstreamer/gstvideoconnector.c b/plugins/multimedia/gstreamer/gstvideoconnector.c
+index ddf68e0..9f8ceae 100644
+--- a/plugins/multimedia/gstreamer/gstvideoconnector.c
++++ b/plugins/multimedia/gstreamer/gstvideoconnector.c
+@@ -186,6 +186,10 @@ gst_video_connector_buffer_alloc (GstPad * pad, guint64 offset, guint size,
+     GstFlowReturn res = GST_FLOW_OK;
+     element = GST_VIDEO_CONNECTOR (GST_PAD_PARENT (pad));
+ 
++    if (!buf)
++        return GST_FLOW_ERROR;
++    *buf = NULL;
++
+     GST_OBJECT_LOCK (element);
+     gst_object_ref(element->srcpad);
+     GST_OBJECT_UNLOCK (element);
+-- 
+1.7.4.1
+
diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
index f665e64..bff6e61 100644
--- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
+++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
@@ -5,7 +5,8 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
 		    file://LGPL_EXCEPTION.txt;md5=411080a56ff917a5a1aa08c98acae354"
 
-SRC_URI = "http://get.qt.nokia.com/qt/add-ons/qt-mobility-opensource-src-${PV}.tar.gz "
+SRC_URI = "http://get.qt.nokia.com/qt/add-ons/qt-mobility-opensource-src-${PV}.tar.gz \
+           file://0001-gstvideoconnector-fixed-buffers-allocation.patch"
 
 SRC_URI[md5sum]="ea5db5a8d3dd4709c2926dceda646bd8"
 SRC_URI[sha256sum]="ee3c88975e04139ac9589f76d4be646d44fcbc4c8c1cf2db621abc154cf0ba44"
-- 
1.7.6.4



