Return-Path: <marc.ferland@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2A5B4719BD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 17:42:51 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id l39so7640809qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 10:42:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IQkziTX2CxfnurNuM8MuToW/OapGTWvUeoo8E9pBRsg=;
	b=REbNGkSPGQimYyUhpMqxH4pao00it6vIebTNBsGrqV4Tdu2D/RUm/sf8ujMICIbWB/
	jZI6N0yWcojtkzUMHUWWJ5IzHlbgyraeghSA6wRoJf2DtH5qSyYpTdIWws+CV0OMLJW/
	txZT5TNXvBgxSYq+PLlqugKkbNwh9gVyCIsm1bZeDdW/TA0pANRNagbSBR3o6zUQQdwB
	BUoUXCtJgqre0HCzTijDIjNhfWavV9XBQimUTJ/SME8ZILE5fuDs4l7ML/1MzYRkPaCc
	bZ7Zj2kuG8mOeSM5LhtggAoEfB7cQJCcT1U5G13Aw0k4cj0WcTpZOkLnXbSf+gU67Xv/
	NpGw==
X-Gm-Message-State: AODbwcASBHtLTma86BXQvCD7tbrkW8KcH+AWBikvcfvsx/JpkBle21+j
	Ng80Uw5nPP/8gQ==
X-Received: by 10.200.46.7 with SMTP id r7mr4733197qta.209.1494610972950;
	Fri, 12 May 2017 10:42:52 -0700 (PDT)
Received: from marc-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.gmail.com with ESMTPSA id 24sm70092qtt.53.2017.05.12.10.42.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 May 2017 10:42:52 -0700 (PDT)
From: Marc Ferland <ferlandm@amotus.ca>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 May 2017 13:42:39 -0400
Message-Id: <1494610960-32690-1-git-send-email-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] pciutils: upgrade 3.5.2 -> 3.5.4
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
X-List-Received-Date: Fri, 12 May 2017 17:42:52 -0000

Upgrade to 3.5.4 and fix libkmod detection (was missing pkgconfig
bbclass).

Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
---
 meta/recipes-bsp/pciutils/pciutils_3.5.2.bb | 60 -----------------------------
 meta/recipes-bsp/pciutils/pciutils_3.5.4.bb | 60 +++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+), 60 deletions(-)
 delete mode 100644 meta/recipes-bsp/pciutils/pciutils_3.5.2.bb
 create mode 100644 meta/recipes-bsp/pciutils/pciutils_3.5.4.bb

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.5.2.bb b/meta/recipes-bsp/pciutils/pciutils_3.5.2.bb
deleted file mode 100644
index 9a7297e..0000000
--- a/meta/recipes-bsp/pciutils/pciutils_3.5.2.bb
+++ /dev/null
@@ -1,60 +0,0 @@
-SUMMARY = "PCI utilities"
-DESCRIPTION = 'The PCI Utilities package contains a library for portable access \
-to PCI bus configuration space and several utilities based on this library.'
-HOMEPAGE = "http://atrey.karlin.mff.cuni.cz/~mj/pciutils.shtml"
-SECTION = "console/utils"
-
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-DEPENDS = "zlib kmod"
-
-SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz \
-           file://configure.patch \
-           file://guess-fix.patch \
-           file://makefile.patch"
-
-SRC_URI[md5sum] = "1bf5b068bd9f7512e8c68b060b25a1b2"
-SRC_URI[sha256sum] = "3a99141a9f40528d0a0035665a06dc37ddb1ae341658e51b50a76ecf86235efc"
-
-inherit multilib_header
-
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'hwdb', '', d)}"
-PACKAGECONFIG[hwdb] = "HWDB=yes,HWDB=no,udev"
-
-PCI_CONF_FLAG = "ZLIB=yes DNS=yes SHARED=yes"
-
-# see configure.patch
-do_configure () {
-	(
-	  cd lib && \
-	  # PACKAGECONFIG_CONFARGS for this recipe could only possibly contain 'HWDB=yes/no',
-	  # so we put it before ./configure
-	  ${PCI_CONF_FLAG} ${PACKAGECONFIG_CONFARGS} ./configure ${PV} ${datadir} ${TARGET_OS} ${TARGET_ARCH}
-	)
-}
-
-export PREFIX = "${prefix}"
-export SBINDIR = "${sbindir}"
-export SHAREDIR = "${datadir}"
-export MANDIR = "${mandir}"
-
-EXTRA_OEMAKE = "-e MAKEFLAGS= ${PCI_CONF_FLAG}"
-
-# The configure script breaks if the HOST variable is set
-HOST[unexport] = "1"
-
-do_install () {
-	oe_runmake DESTDIR=${D} install install-lib
-
-	install -d ${D}${bindir}
-	ln -s ../sbin/lspci ${D}${bindir}/lspci
-
-	oe_multilib_header pci/config.h
-}
-
-PACKAGES =+ "${PN}-ids libpci"
-FILES_${PN}-ids = "${datadir}/pci.ids*"
-FILES_libpci = "${libdir}/libpci.so.*"
-SUMMARY_${PN}-ids = "PCI utilities - device ID database"
-DESCRIPTION_${PN}-ids = "Package providing the PCI device ID database for pciutils."
-RDEPENDS_${PN} += "${PN}-ids"
diff --git a/meta/recipes-bsp/pciutils/pciutils_3.5.4.bb b/meta/recipes-bsp/pciutils/pciutils_3.5.4.bb
new file mode 100644
index 0000000..0faa501
--- /dev/null
+++ b/meta/recipes-bsp/pciutils/pciutils_3.5.4.bb
@@ -0,0 +1,60 @@
+SUMMARY = "PCI utilities"
+DESCRIPTION = "The PCI Utilities package contains a library for portable access \
+to PCI bus configuration space and several utilities based on this library."
+HOMEPAGE = "http://atrey.karlin.mff.cuni.cz/~mj/pciutils.shtml"
+SECTION = "console/utils"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+DEPENDS = "zlib kmod"
+
+SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz \
+           file://configure.patch \
+           file://guess-fix.patch \
+           file://makefile.patch"
+
+SRC_URI[md5sum] = "e82537cd2194111c45fa7e684b52252e"
+SRC_URI[sha256sum] = "64293c6ab9318c40ef262b76d87bd9097531759752bac556e50979b1e63cfe66"
+
+inherit multilib_header pkgconfig
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'hwdb', '', d)}"
+PACKAGECONFIG[hwdb] = "HWDB=yes,HWDB=no,udev"
+
+PCI_CONF_FLAG = "ZLIB=yes DNS=yes SHARED=yes"
+
+# see configure.patch
+do_configure () {
+	(
+	  cd lib && \
+	  # PACKAGECONFIG_CONFARGS for this recipe could only possibly contain 'HWDB=yes/no',
+	  # so we put it before ./configure
+	  ${PCI_CONF_FLAG} ${PACKAGECONFIG_CONFARGS} ./configure ${PV} ${datadir} ${TARGET_OS} ${TARGET_ARCH}
+	)
+}
+
+export PREFIX = "${prefix}"
+export SBINDIR = "${sbindir}"
+export SHAREDIR = "${datadir}"
+export MANDIR = "${mandir}"
+
+EXTRA_OEMAKE = "-e MAKEFLAGS= ${PCI_CONF_FLAG}"
+
+# The configure script breaks if the HOST variable is set
+HOST[unexport] = "1"
+
+do_install () {
+	oe_runmake DESTDIR=${D} install install-lib
+
+	install -d ${D}${bindir}
+	ln -s ../sbin/lspci ${D}${bindir}/lspci
+
+	oe_multilib_header pci/config.h
+}
+
+PACKAGES =+ "${PN}-ids libpci"
+FILES_${PN}-ids = "${datadir}/pci.ids*"
+FILES_libpci = "${libdir}/libpci.so.*"
+SUMMARY_${PN}-ids = "PCI utilities - device ID database"
+DESCRIPTION_${PN}-ids = "Package providing the PCI device ID database for pciutils."
+RDEPENDS_${PN} += "${PN}-ids"
-- 
2.7.4


