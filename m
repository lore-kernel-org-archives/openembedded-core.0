Return-Path: <koen.kooi@linaro.org>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id B2BA46B4F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 09:16:25 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id q59so1506120wes.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 01:16:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zoq6CAlNRo00qd4yQ8BvgspSPm04LjRtJa18zO8rbW8=;
	b=YNUClhBAm4lV8Mttw65fbR3rOfnDdxjTddoE/gYVH5lh6PM4FE41wm1c+sSIy1jhwL
	8y9J3ojRKDfdBon/jz5U89RLKOHtWcidT2ND9rjvROg45E7H//G3TJWIbaA79/9OyUEE
	Esb2v3uz/KZjNqqx3TdzUVFqBC270BCQl2opIdDQQWEvmQE8nWbQrBZ9DLBiiWEFJkpq
	BKwape+/7ko2sHE6WOFwJsTnsD8UKN8+V5EvV2Df6sFO9t+bG45bTWsqprYl0kHmlc7g
	noPm8b+vf7kb51C7WEY08+56LuK8wzjIn5EkekTQxcU0KuroaA2gvCVTO3zGap6jsdOn
	fOLQ==
X-Gm-Message-State: ALoCoQkkQUHZmt5WGZ+y0w17osoKS1s0ILm2KVxOwyPIQyCv9Nk62z+hUKUDhbuz0cLXfu0sEOQx
X-Received: by 10.180.24.134 with SMTP id u6mr1004794wif.53.1389777385646;
	Wed, 15 Jan 2014 01:16:25 -0800 (PST)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id eh7sm27376638wic.2.2014.01.15.01.16.24
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jan 2014 01:16:24 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jan 2014 10:16:22 +0100
Message-Id: <1389777382-24374-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.8.4.2
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [RFC][PATCH] grub-efi: add git version
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
X-List-Received-Date: Wed, 15 Jan 2014 09:16:26 -0000

This allows building both non-EFI (via grub_git.bb) and EFI versions of grub for platforms like i586 and armv7a which are usually non-EFI.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-bsp/grub/grub-efi_git.bb | 58 +++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/grub-efi_git.bb

diff --git a/meta/recipes-bsp/grub/grub-efi_git.bb b/meta/recipes-bsp/grub/grub-efi_git.bb
new file mode 100644
index 0000000..339d5ec
--- /dev/null
+++ b/meta/recipes-bsp/grub/grub-efi_git.bb
@@ -0,0 +1,58 @@
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
+           file://40_custom \
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
+do_install_append () {
+    install -d ${D}${sysconfdir}/grub.d
+    install -m 0755 ${WORKDIR}/40_custom ${D}${sysconfdir}/grub.d/40_custom
+}
+
+RDEPENDS_${PN} = "diffutils freetype"
+FILES_${PN}-dbg += "${libdir}/${BPN}/*/.debug"
+
+INSANE_SKIP_${PN} = "arch"
+INSANE_SKIP_${PN}-dbg = "arch"
-- 
1.8.4.2


