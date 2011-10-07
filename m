Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RCADX-0006tb-Eh for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 15:11:59 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p97DCsjh006523 for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Oct 2011 14:12:54 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VJLpBZzjLMF3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Oct 2011 14:12:54 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p97DCofT006512
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Oct 2011 14:12:51 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 07 Oct 2011 14:06:11 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317992779.2405.6.camel@ted>
Mime-Version: 1.0
Subject: [PATCH] qt-demo-init/linux-firmware/adt-installer: Convert to Use allarch class file
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
X-List-Received-Date: Fri, 07 Oct 2011 13:11:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/installer/adt-installer_1.0.bb b/meta/recipes-devtools/installer/adt-installer_1.0.bb
index 74e1b9f..53911b8 100644
--- a/meta/recipes-devtools/installer/adt-installer_1.0.bb
+++ b/meta/recipes-devtools/installer/adt-installer_1.0.bb
@@ -29,7 +29,6 @@ LICENSE = "MIT"
 ALLOW_EMPTY = "1"
 
 PACKAGES = ""
-PACKAGE_ARCH = "all"
 
 PR = "r4"
 
@@ -38,7 +37,7 @@ ADT_DIR = "${WORKDIR}/adt-installer/"
 YOCTOADT_VERSION = "${SDK_VERSION}"
 S = "${WORKDIR}/trunk"
 
-inherit deploy
+inherit deploy allarch
 
 SRCREV = "596"
 PV = "0.1.8+svnr${SRCPV}"
diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 660877e..86d60b4 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -30,6 +30,8 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/dwmw2/linux-firmware.gi
 
 S = "${WORKDIR}/git"
 
+inherit allarch
+
 do_compile() {
 	:
 }
@@ -78,4 +80,3 @@ FILES_${PN}-rtl8192su = " \
 "
 RPROVIDES_${PN}-rtl8192su = "${PN}-rtl8192su"
 
-PACKAGE_ARCH = "all"
diff --git a/meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb b/meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb
index 0f089ad..6cd3e17 100644
--- a/meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb
+++ b/meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb
@@ -6,14 +6,12 @@ PR = "r3"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PACKAGE_ARCH = "all"
-
 do_install() {
 	install -d ${D}${sysconfdir}/init.d/
 	install -m 0755 ${WORKDIR}/qtdemo-init ${D}${sysconfdir}/init.d/qtdemo
 }
 
-inherit update-rc.d
+inherit update-rc.d allarch
 
 INITSCRIPT_NAME = "qtdemo"
 INITSCRIPT_PARAMS = "start 99 5 2 . stop 19 0 1 6 ."




