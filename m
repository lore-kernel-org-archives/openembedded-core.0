Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1Qwm9a-0006j1-PW
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 04:28:19 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7Q2NU9W009405
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 19:23:30 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 25 Aug 2011 19:23:29 -0700
Message-ID: <c6f961b7fa75da18714607f5846f1a6b216cc4ff.1314325071.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1314325071.git.xiaofeng.yan@windriver.com>
References: <cover.1314325071.git.xiaofeng.yan@windriver.com>
Old-Date: Fri, 26 Aug 2011 10:13:11 +0800
Date: Fri, 26 Aug 2011 10:24:14 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [OC-core][PATCH 1/1] qt4e-demo-image: Fix bug 999
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
X-List-Received-Date: Fri, 26 Aug 2011 02:28:19 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

[YOCTO #999]
Copy metadata of qt4e-demo-image from OE for easy testing qt4embeded on embedded platform.
This image was tested on qemuarm and can run program "qtdemoE".

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-qt/images/qt4e-demo-image.bb |   19 ++++++++++
 meta/recipes-qt/tasks/task-qt4e.bb        |   56 +++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-qt/images/qt4e-demo-image.bb
 create mode 100644 meta/recipes-qt/tasks/task-qt4e.bb

diff --git a/meta/recipes-qt/images/qt4e-demo-image.bb b/meta/recipes-qt/images/qt4e-demo-image.bb
new file mode 100644
index 0000000..f2150ca
--- /dev/null
+++ b/meta/recipes-qt/images/qt4e-demo-image.bb
@@ -0,0 +1,19 @@
+LICENSE = "MIT"
+PR="r1"
+
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+DEPENDS += "task-qt4e"
+
+RDEPENDS_${PN} += " \
+	task-qt4e-base \
+	"
+
+IMAGE_INSTALL += "\
+	module-init-tools \
+	task-qt4e-base \
+"
+
+inherit core-image
+
diff --git a/meta/recipes-qt/tasks/task-qt4e.bb b/meta/recipes-qt/tasks/task-qt4e.bb
new file mode 100644
index 0000000..c95c898
--- /dev/null
+++ b/meta/recipes-qt/tasks/task-qt4e.bb
@@ -0,0 +1,56 @@
+DESCRIPTION = "QT4 Embedded base Image Feed"
+PR = "r1"
+LICENSE = "MIT"
+
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+inherit task
+
+TOUCH = ' ${@base_contains("MACHINE_FEATURES", "touchscreen", "tslib tslib-calibrate tslib-tests", "",d)}'
+
+PACKAGES += " \
+	${PN}-base \
+"
+
+RDEPENDS_${PN}-base = " \
+	qt4-embedded \
+	libqt-embedded3support4 \
+	libqt-embeddedclucene4 \
+	libqt-embeddedcore4 \
+	libqt-embeddeddbus4 \
+	libqt-embeddedgui4 \
+	libqt-embeddedhelp4 \
+	libqt-embeddedmultimedia4 \
+	libqt-embeddednetwork4 \
+	libqt-embeddedscript4 \
+	libqt-embeddedscripttools4 \
+	libqt-embeddedsql4 \
+	libqt-embeddedsvg4 \
+	libqt-embeddedtest4 \
+	libqt-embeddedwebkit4 \
+	libqt-embeddedxml4 \
+	qt4-embedded-fonts-ttf-dejavu \
+	qt4-embedded-fonts-ttf-vera \
+	qt4-embedded-plugin-iconengine-svgicon \
+	qt4-embedded-plugin-imageformat-gif \
+	qt4-embedded-plugin-imageformat-ico \
+	qt4-embedded-plugin-imageformat-jpeg \
+	qt4-embedded-plugin-imageformat-mng \
+	qt4-embedded-plugin-imageformat-svg \
+	qt4-embedded-plugin-imageformat-tiff \
+	qt4-embedded-plugin-mousedriver-tslib \
+	qt4-embedded-plugin-phonon-backend-gstreamer \
+	qt4-embedded-plugin-script-dbus \
+	qt4-embedded-plugin-sqldriver-sqlite \
+	${TOUCH} \
+        qt4-embedded-demos \
+        qt4-embedded-examples \
+        qt-demo-init \
+        qt4-embedded-assistant \
+"
+
+RRECOMMENDS_${PN}-base = " \
+	libqt-embeddedxmlpatterns4 \
+"
+
-- 
1.7.0.4



