Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5F6086AC48
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 02:16:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r622GNpZ007836
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Jul 2013 19:16:23 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 1 Jul 2013 19:16:21 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Jul 2013 10:16:14 +0800
Message-ID: <4fe4ce970df0fa607fb3325b88b247be1ebbb93a.1372483117.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1372483117.git.hongxu.jia@windriver.com>
References: <cover.1372483117.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] qt-mobility: fix build in the absence of xvideo
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
X-List-Received-Date: Tue, 02 Jul 2013 02:16:20 -0000
Content-Type: text/plain

QMake pro files don't explicitly define QT_NO_XVIDEO if the
configuration lacks xvideo, but plugins code relies on this define.

[YOCTO #4775]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../qt-mobility-1.2.0/qt-mobility-no-xvideo.patch  | 26 ++++++++++++++++++++++
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |  3 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-qt/qt4/qt-mobility-1.2.0/qt-mobility-no-xvideo.patch

diff --git a/meta/recipes-qt/qt4/qt-mobility-1.2.0/qt-mobility-no-xvideo.patch b/meta/recipes-qt/qt4/qt-mobility-1.2.0/qt-mobility-no-xvideo.patch
new file mode 100644
index 0000000..6046752
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-mobility-1.2.0/qt-mobility-no-xvideo.patch
@@ -0,0 +1,26 @@
+QMake pro files don't explicitly define QT_NO_XVIDEO if the
+configuration lacks xvideo, but plugins code relies on this define.
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Upstream-Status: Inappropriate [configuration]
+---
+ plugins/multimedia/gstreamer/gstreamer.pro | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/plugins/multimedia/gstreamer/gstreamer.pro b/plugins/multimedia/gstreamer/gstreamer.pro
+--- a/plugins/multimedia/gstreamer/gstreamer.pro
++++ b/plugins/multimedia/gstreamer/gstreamer.pro
+@@ -19,6 +19,10 @@ LIBS += \
+     -lasound
+ }
+ 
++unix:!contains(QT_CONFIG, xvideo) {
++    DEFINES += QT_NO_XVIDEO
++}
++
+ CONFIG += link_pkgconfig
+ 
+ PKGCONFIG += \
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
index aba84ab..2ce9ca2 100644
--- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
+++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
@@ -12,7 +12,8 @@ SRC_URI = "http://get.qt.nokia.com/qt/add-ons/qt-mobility-opensource-src-${PV}.t
            file://0001-gstvideoconnector-fixed-buffers-allocation.patch \
            file://0002-Remove-unnecessary-rpaths-from-qml_device-example.patch \
            file://qt-mobility-no-opengl.patch \
-	   file://gcc-scope.patch \
+           file://gcc-scope.patch \
+           file://qt-mobility-no-xvideo.patch \
 	   "
 
 SRC_URI[md5sum]="ea5db5a8d3dd4709c2926dceda646bd8"
-- 
1.8.1.2


