Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id E4A276BF4E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 09:25:21 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id hi8so410683wib.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 01:25:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FWVsyTzUJwy2cjeYyniysVsI34LfF6Y7HWkTujYjuxo=;
	b=CKscqoiKynCwFTKm8IvLXNdbekRXFrAcmc6haRJXEJxfhwTJSavj82aRdffe7qHBqq
	bmOlj94zbmN74STvhVSmY+4KgATsel5+UricTL9e2lpddzuj/Vq1JntsX1cIzAGsbjnP
	vMwLRO83BS+K8SyoSZrGNCicasryNttzW31ZWq5RztyaEeQe+YKD2PUKSDAsyKmMLJ0N
	Dxbb1xCQLvv2TAupJDLoK1LhBlt/syWF9s5SXDpsIVCTl++2k+9q1E8n+FJTVW+RcXZg
	k60a9jh/CNFaGn7ITP3gRmxbea4n8nKcP4d9L3M/2amvtJu5ssp5g0UyJ/kszHMedGWg
	UjYg==
X-Gm-Message-State: ALoCoQlvHj+lynGJ4nDXdAsQx1kI9xMJ4VLAZZ/1rTCApauVP/5swc5y1FG9nINdhqZsN7byL/0G
X-Received: by 10.194.178.135 with SMTP id cy7mr1096093wjc.21.1389777922581;
	Wed, 15 Jan 2014 01:25:22 -0800 (PST)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id ot9sm2715439wjc.0.2014.01.15.01.25.21
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jan 2014 01:25:22 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jan 2014 10:25:20 +0100
Message-Id: <1389777920-28884-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.8.4.2
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [RFC][PATCHv2] grub-efi: add git version
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
X-List-Received-Date: Wed, 15 Jan 2014 09:25:24 -0000

This allows building both non-EFI (via grub_git.bb) and EFI versions of grub for platforms like i586 and armv7a which are usually non-EFI.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-bsp/grub/grub-efi_git.bb | 72 +++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/grub-efi_git.bb

diff --git a/meta/recipes-bsp/grub/grub-efi_git.bb b/meta/recipes-bsp/grub/grub-efi_git.bb
new file mode 100644
index 0000000..e8f859e
--- /dev/null
+++ b/meta/recipes-bsp/grub/grub-efi_git.bb
@@ -0,0 +1,72 @@
+SUMMARY = "GRUB2 is the next-generation GRand Unified Bootloader"
+
+DESCRIPTION = "GRUB2 is the next generaion of a GPLed bootloader \
+intended to unify bootloading across x86 operating systems. In \
+addition to loading the Linux kernel, it implements the Multiboot \
+standard, which allows for flexible loading of multiple boot images."
+
+HOMEPAGE = "http://www.gnu.org/software/grub/"
+SECTION = "bootloaders"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+DEPENDS = "autogen-native flex-native bison-native xz freetype"
+
+DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE_arm = "1"
+
+PV = "2.00+${SRCPV}"
+SRCREV = "0776112c5311196889a15058a3b1be4c81ba5e05"
+SRC_URI = "git://git.savannah.gnu.org/grub.git \
+          "
+
+S = "${WORKDIR}/git"
+
+COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
+
+inherit autotools
+inherit gettext
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[grub-mount] = "--enable-grub-mount,--disable-grub-mount,fuse"
+PACKAGECONFIG[device-mapper] = "--enable-device-mapper,--disable-device-mapper,lvm2"
+
+# configure.ac has code to set this automagically from the target tuple
+# but the OE freeform one (core2-foo-bar-linux) don't work with that.
+
+GRUBPLATFORM = "efi"
+
+EXTRA_OECONF = "--with-platform=${GRUBPLATFORM} --disable-grub-mkfont --program-prefix="" \
+                --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no"
+
+do_configure_prepend() {
+    ( cd ${S}
+      ${S}/autogen.sh )
+}
+
+do_install_class-native() {
+        install -d ${D}${bindir}
+        install -m 755 grub-mkimage ${D}${bindir}
+}
+
+do_deploy() {
+	# Search for the grub.cfg on the local boot media by using the
+	# built in cfg file provided via this recipe
+	grub-mkimage -c ../cfg -p /EFI/BOOT -d ./grub-core/ \
+	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE} \
+	               boot linux ext2 fat serial part_msdos part_gpt normal efi_gop iso9660 search
+	install -m 644 ${B}/${GRUB_IMAGE} ${DEPLOYDIR}
+}
+
+do_deploy_class-native() {
+	:
+}
+
+addtask deploy after do_install before do_build
+
+RDEPENDS_${PN} = "diffutils freetype"
+FILES_${PN}-dbg += "${libdir}/${BPN}/*/.debug"
+
+INSANE_SKIP_${PN} = "arch"
+INSANE_SKIP_${PN}-dbg = "arch"
-- 
1.8.4.2


