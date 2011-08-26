Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qx2Ke-0006Y4-KD
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 21:44:49 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Aug 2011 12:39:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,286,1312182000"; d="scan'208";a="45450534"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.251])
	by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2011 12:39:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2011 12:39:42 -0700
Message-Id: <612ab0aaf3e693b90bb18234e2517bfc87ee3f7c.1314387279.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1314387279.git.sgw@linux.intel.com>
References: <cover.1314387279.git.sgw@linux.intel.com>
In-Reply-To: <cover.1314387279.git.sgw@linux.intel.com>
References: <cover.1314387279.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 12/21] qt4e-demo-image: Fix bug 999
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
X-List-Received-Date: Fri, 26 Aug 2011 19:44:49 -0000

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
1.7.6



