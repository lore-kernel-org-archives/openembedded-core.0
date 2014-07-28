Return-Path: <freesilicon@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id E1AAB702AB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 09:55:36 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id d1so4079830wiv.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 02:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=c/gy40RgTNiemscW+Dt3HFTaet2SoPtOHUVx+g1Fpso=;
	b=VVqNRGHLnq+ROgZOXDt+OsoneEAGFdN6fsZnxjBO+xStM6w9+D04BbGFGM96GhTFY7
	DJZe6qWHrankboKYADVJZ6SmJmAdsnRDuISgJ/IWFo81DkxV+u6o0K8WHJh/nbmm6Bt3
	jaUieHXkEhux7HV7CzFLTbPuIAiMIFGl2GbhgV2FCVWzxbi0tUmOwqmOed7yf8d/IYGN
	tVZ/c/1dWMvjufCy3aVb/TNyIdZFvnmcKuK9f+oLq43X8Qzzp+bEP7HdqkV1iAkokbZi
	4J2ed0COLs4obgCOZaAxSdUB4XO1v20b9yDkewWSpgWLAgr4pXnA6UlsOSZDcLeiz4m1
	RdNw==
X-Received: by 10.180.207.105 with SMTP id lv9mr11529008wic.23.1406541334336; 
	Mon, 28 Jul 2014 02:55:34 -0700 (PDT)
Received: from crde-port-20.cahors.local ([195.101.177.85])
	by mx.google.com with ESMTPSA id 10sm48269529wjx.26.2014.07.28.02.55.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jul 2014 02:55:33 -0700 (PDT)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jul 2014 11:55:04 +0200
Message-Id: <1406541304-18741-1-git-send-email-freesilicon@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] barebox: Add recipe
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
X-List-Received-Date: Mon, 28 Jul 2014 09:55:38 -0000

barebox (formerly known as u-boot-v2) is a bootloader that inherits the
best of U-Boot and the Linux kernel. This commit adds the possibility to
use it as a virtual/bootloader instead of U-Boot.

Signed-off-by: David Vincent <freesilicon@gmail.com>
---
 meta/recipes-bsp/barebox/barebox.inc          |   73 +++++++++++++++++++++++++
 meta/recipes-bsp/barebox/barebox_2014.07.0.bb |   15 +++++
 2 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-bsp/barebox/barebox.inc
 create mode 100644 meta/recipes-bsp/barebox/barebox_2014.07.0.bb

diff --git a/meta/recipes-bsp/barebox/barebox.inc b/meta/recipes-bsp/barebox/barebox.inc
new file mode 100644
index 0000000..68aeb68
--- /dev/null
+++ b/meta/recipes-bsp/barebox/barebox.inc
@@ -0,0 +1,73 @@
+SUMMARY = "The Barebox Bootloader"
+DESCRIPTION = "Barebox (formerly known as u-boot-v2) is a bootloader that inherits the best of U-Boot and the Linux kernel: The size and look-and-feel of u-boot, with driver model and lots of design concepts from the kernel."
+HOMEPAGE = "http://www.barebox.org"
+SECTION = "bootloaders"
+PROVIDES = "virtual/bootloader"
+
+inherit cml1 deploy kernel-arch
+
+EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
+
+BAREBOX_BINARY ?= "barebox.bin"
+BAREBOX_IMAGE ?= "barebox-${MACHINE}-${PV}-${PR}.bin"
+BAREBOX_SYMLINK ?= "barebox-${MACHINE}.bin"
+
+do_configure () {
+	# Copy defconfig to .config if .config does not exist. This allows
+	# recipes to manage the .config themselves in do_configure_prepend().
+	if [ -f "${WORKDIR}/defconfig" ] && [ ! -f "${B}/.config" ]; then
+		cp "${WORKDIR}/defconfig" "${B}/.config"
+	fi
+
+	# Use board default defconfig if .config does not exist. This allows
+	# recipes to manage the .config themselves in do_configure_prepend().
+	if [ ! -f "${B}/.config" ]; then
+		oe_runmake_call ${BAREBOX_TARGET}
+	fi
+
+	cml1_do_configure
+}
+
+do_compile () {
+	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', 'ld-is-gold', '', d)}" = "ld-is-gold" ] ; then
+		sed -i 's/$(CROSS_COMPILE)ld$/$(CROSS_COMPILE)ld.bfd/g' ${S}/Makefile
+	fi
+
+	unset CFLAGS CPPFLAGS LDFLAGS
+	oe_runmake
+}
+
+do_install () {
+	install -d ${D}/boot
+	install ${S}/barebox-flash-image ${D}/boot/${BAREBOX_IMAGE}
+	ln -sf ${BAREBOX_IMAGE} ${D}/boot/${BAREBOX_BINARY}
+
+	# Install target tools if available
+	install -d ${D}${sbindir}
+
+	if [ -e ${WORKDIR}/scripts/bareboxenv-target ]; then
+		install -m 0755 ${WORKDIR}/scripts/bareboxenv-target ${D}${sbindir}/bareboxenv
+	fi
+
+	if [ -e ${WORKDIR}/scripts/bareboxcrc32-target ]; then
+		install -m 0755 ${WORKDIR}/scripts/bareboxcrc32-target ${D}${sbindir}/bareboxcrc32
+	fi
+
+	if [ -e ${WORKDIR}/scripts/kernel-install-target ]; then
+		install -m 0755 ${WORKDIR}/scripts/kernel-install-target ${D}${sbindir}/kernel-install
+	fi
+}
+
+FILES_${PN} = "/boot ${sbindir}"
+
+do_deploy () {
+	install -d ${DEPLOYDIR}
+	install ${S}/barebox-flash-image ${DEPLOYDIR}/${BAREBOX_IMAGE}
+
+	cd ${DEPLOYDIR}
+	rm -f ${BAREBOX_BINARY} ${BAREBOX_SYMLINK}
+	ln -sf ${BAREBOX_IMAGE} ${BAREBOX_SYMLINK}
+	ln -sf ${BAREBOX_IMAGE} ${BAREBOX_BINARY}
+}
+
+addtask deploy before do_build after do_compile
diff --git a/meta/recipes-bsp/barebox/barebox_2014.07.0.bb b/meta/recipes-bsp/barebox/barebox_2014.07.0.bb
new file mode 100644
index 0000000..6adbff4
--- /dev/null
+++ b/meta/recipes-bsp/barebox/barebox_2014.07.0.bb
@@ -0,0 +1,15 @@
+require barebox.inc
+
+# To build barebox for your machine, provide the following lines in your machine
+# config, replacing the assignments as appropriate for your machine.
+# BAREBOX_MACHINE = "sandbox"
+# BAREBOX_TARGET = "sandbox_defconfig"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=057bf9e50e1ca857d0eb97bfe4ba8e5d"
+
+SRC_URI = "http://www.barebox.org/download/${PN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "f3a93950777916d4b1c2cd366aec8d91"
+SRC_URI[sha256sum] = "6dca5c78de8565a15aaa404edbf1bc4663415f0dc69e094f3b621636876285f2"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.7.10.4


