Received: from mail-wg0-f52.google.com ([74.125.82.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1UPZd7-0003dk-7e
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 16:34:37 +0200
Received: by mail-wg0-f52.google.com with SMTP id n12so7129729wgh.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 07:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=4A/sy4lZNz0vzpawTKXa6EONk5XECqBzfbjd9l2gyFo=;
	b=YBGj7M2mM3zHm3vvkZNfAypAIqqd1GEH1RMSZqMnfIO+Ag+V8ChldS1eWuHSQz7E2d
	dItucuHQBcIKz6LIT1b714bLSespYfhGHKSyzaOgP/QRXMt6KJ8hQaAdKLnfT0PUbsdI
	DauNA8xBclE9TLGMliOtJ6ruXSa/KI9RTRMIIZe5Zoudn63KlT/xwYd86LiSDWmWY7z2
	pC/VX5SlkFNak9lGQoWDUMexk7D3ORtpKnW2qypKPenU5u9+/56dk1+DCNVlPz0l4a9Z
	miFx8z8eojFPGvx8jDPn04qM/Dd5tDUJVUq8CB/brTN1cWebWg/gVevjkh+RRKWOfJye
	CsCQ==
X-Received: by 10.194.89.234 with SMTP id br10mr39007004wjb.43.1365517037233; 
	Tue, 09 Apr 2013 07:17:17 -0700 (PDT)
Received: from quad.modzo.koansoftware.com
	(host56-7-static.30-87-b.business.telecomitalia.it. [87.30.7.56])
	by mx.google.com with ESMTPS id bo1sm29187138wib.0.2013.04.09.07.17.15
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 09 Apr 2013 07:17:16 -0700 (PDT)
From: Marco Cavallini <koansoftware@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Apr 2013 16:19:54 +0200
Message-Id: <1365517194-30916-1-git-send-email-m.cavallini@koansoftware.com>
X-Mailer: git-send-email 1.8.2.1
Cc: Marco Cavallini <m.cavallini@koansoftware.com>
Subject: [oe][meta-oe][PATCH 1/4] xinput-calibrator: calibrate touch screen with xorg
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Apr 2013 14:34:39 -0000

 * Taken from oe-classic
 * This patch includes pointercal-xinput

Signed-off-by: Marco Cavallini <m.cavallini@koansoftware.com>
---
 .../pointercal-xinput/pointercal.xinput            |  1 +
 .../xinput-calibrator/pointercal-xinput_0.0.bb     | 19 +++++++++++++
 .../xinput-calibrator/xinput-calibrator_git.bb     | 31 ++++++++++++++++++++++
 3 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
 create mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb

diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
new file mode 100644
index 0000000..9633fc5
--- /dev/null
+++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
@@ -0,0 +1 @@
+# replace with valid machine specific pointercal.xinput
diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
new file mode 100644
index 0000000..9b68d54
--- /dev/null
+++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Touchscreen calibration data from xinput-calibrator"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+PR = "r4"
+
+SRC_URI = "file://pointercal.xinput"
+S = "${WORKDIR}"
+
+do_install() {
+	# Only install file if it has a contents
+	if [ -s ${S}/pointercal.xinput ]; then
+	        install -d ${D}${sysconfdir}/
+	        install -m 0644 ${S}/pointercal.xinput ${D}${sysconfdir}/
+	fi
+}
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+CONFFILES_${PN} = "${sysconfdir}/pointercal.xinput"
diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
new file mode 100644
index 0000000..97f9343
--- /dev/null
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "A generic touchscreen calibration program for X.Org"
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/xinput_calibrator"
+LICENSE = "MIT-X"
+LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=1bcba08f67cdb56f34021557898e4b5a"
+DEPENDS = "virtual/libx11 libxi"
+
+PV = "0.7.5+git${SRCPV}"
+PR = "r1"
+
+inherit autotools
+
+SRCREV = "c01c5af807cb4b0157b882ab07a893df9a810111"
+SRC_URI = "git://github.com/tias/xinput_calibrator.git;protocol=git"
+
+S = "${WORKDIR}/git"
+
+# force native X11 ui as we don't have gtk+ in DEPENDS
+EXTRA_OECONF += "--with-gui=x11"
+
+do_install_append() {
+        install -d ${D}${bindir}
+        install -m 0755 scripts/xinput_calibrator_pointercal.sh ${D}${bindir}/xinput_calibrator_once.sh
+
+        install -d ${D}${sysconfdir}/xdg/autostart
+        sed -i -e 's,^Exec=.*,Exec=${bindir}/xinput_calibrator_once.sh,' scripts/xinput_calibrator.desktop
+        install -m 0644 scripts/xinput_calibrator.desktop ${D}${sysconfdir}/xdg/autostart
+}
+
+FILES_${PN} += "${sysconfdir}/xdg/autostart"
+RDEPENDS_${PN} = "xinput xterm"
+RRECOMMENDS_${PN} = "pointercal-xinput"
-- 
1.8.2.1



