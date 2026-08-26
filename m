Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4414DC61DD2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 23:35:18 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25443.1787787313349253827
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 16:35:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oy1/4OjR;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47fde295992so342212f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 16:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787787311; x=1788392111; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SycdilbJAN0QSRln7pWd2ADGndojs1lgRNgfweubH1A=;
        b=oy1/4OjR0y7UXtGcZOlD9rjFjVW3vSKl0jYc/yd5ptXW9UT4Szf80xmm9DDF9i0lN6
         b7/s05N7Rq1SaWiTWxgivjaILyXbPILLpq6n/0J18TusYhe+5rwowUpisbYmIrr2xP/m
         Ryi0oDOkOKm/2m2+7Gjtw79CoGKzXftjX0V3sbu3Reyf5AY3XXT3HwWJaFeGR5rq/gXe
         eJIWgEIMFnTxQRz37aJx9hNsOAEkqRWAuxYWAvo58jDQmbdk/PTWScmOq9xlMToOmy3k
         Cndal9zqNVWBLfTGON958gioU0pzLP+pivhnD7VkvMD/t7Pt7AqKKe6aAhMF6JbxzKLW
         CyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787787311; x=1788392111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SycdilbJAN0QSRln7pWd2ADGndojs1lgRNgfweubH1A=;
        b=kniikAyhpvGh0YJH/YfetIu3srwqx//XDYdHGPOhEN2ILd0K1oh6hsSPZyY4TBweI2
         XMuXhdIBJ17sTTPCf5Q0Qjjx6KwBYpGSudhoRTsGm05U0q8m0HC31n5OuIbj5tJSO+ON
         uebCW7v17+Q8snnuKG/wE97J32mYzG8jgdSx9MB422K1vIVhOfOovJCvqbSYhjJFRvPi
         tBhlXpPivOh1yKzKC0/l9Q6aM3YMy8ToSzWgD1H+2mfcMdB3Yux6BVx1iPEmHwakFmoN
         R0LyBpe5PwF+LzQVWLNE5VAgt7kGO7cct+zqDOfNsZX43LbMQMxc/o8jid9k0xJWmqdW
         Op/g==
X-Gm-Message-State: AFuF++mkMVSDzjfM+lYl31cBuwSjlXkDydVKaJNgutyjng1OIBM11+l7
	AfSSPGymL5VGalZYuBFnfzky8x/+hI1QBqdJSjNr9U0zpi/1RJejrbICIW9aV5Eqs6I=
X-Gm-Gg: AR+sD100nceQA0Mi/x91vnPCCBVz3prSFAlqmYix6Fy+mVVQWvt1XWxCl/JYWOSkILL
	e8ByGwirT2LMQHJpLE2L7FEO7a1Gf/sI9SzawmYGdLcIln4rpbhfhMTXtGlmwTbzYnpwr5PmVT1
	Wits43MjUkCYgDRgzwGMbBiipewU3zkclL6dnIS/qpXy+nzQHyL9BhCkZB4LE1JZrHozHv2q1I/
	3bZtNaYHUsCmQzgGWm7AI4S9W58VQYLqhAb2adujkfjqAoANYPIHjDW2Pz273KX7kWcTzzqHe4E
	QuiXSx8x3pQC2z+7c//YUMMatbve3LKWMqmmL+J/9clYd2QWgjpBvHW6HNAKP5qg7kjzISuEFam
	3fV/kocY2+tvy26GdfaPUpHU4a2J3S1Y8C/jomCHBB3TiND1j+2HRS1Cj+hfEmV0prnchUYlRZ+
	9F+AL2VaB8Ne/UwI+I3Uo+Cj2lbqC1G9F5eX6MmdKkt2ZkWDh51UfMP0J/MB8mh9LgoIqzJ8xvC
	IwcLBts4iCgq9CRtwlmG4ZZwpeBHVIedMz9Z3RMjwSAN75vA3Mtl0YY7UqX7PJboSwshSm83tlF
	obYCuz5mkPw=
X-Received: by 2002:a05:6000:2608:b0:482:b823:cc3a with SMTP id ffacd0b85a97d-482eaba7efamr2869162f8f.12.1787787311546;
        Wed, 26 Aug 2026 16:35:11 -0700 (PDT)
Received: from device-137.home ([2a01:cb15:80cf:2100:f9af:e499:eded:1124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab569sm4586872f8f.16.2026.08.26.16.35.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 26 Aug 2026 16:35:11 -0700 (PDT)
From: Anis Bougrine <anis.bougrine10@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Anis Bougrine <anis.bougrine10@gmail.com>
Subject: [OE-core][PATCH v7 4/5] kernel: centralize kernel module installation path in one variable
Date: Thu, 27 Aug 2026 01:34:15 +0200
Message-ID: <20260826233416.37047-5-anis.bougrine10@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260826233416.37047-1-anis.bougrine10@gmail.com>
References: <20260826233416.37047-1-anis.bougrine10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 23:35:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244439

The kernel module installation path is currently defined in multiple
places, although it is used 10 times throughout the code. This
increases the risk of bugs due to inconsistencies or desynchronization.

Centralizing the path in a single variable makes the code more
reliable and easier to maintain.

This commit introduce KERNEL_MODULE_INSTALL_PREFIX to resolve this issue.

Signed-off-by: Anis Bougrine <anis.bougrine10@gmail.com>
---
 meta/classes-recipe/kernel-arch.bbclass         |  1 +
 meta/classes-recipe/kernel-module-split.bbclass |  2 +-
 meta/classes-recipe/kernel.bbclass              | 12 ++++++------
 meta/classes-recipe/module.bbclass              |  2 +-
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index 26b8a1a67f..91cceb8dc1 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -10,6 +10,7 @@ TARGET_CC_KERNEL_ARCH ?= ""
 TARGET_LD_KERNEL_ARCH ?= ""
 TARGET_AR_KERNEL_ARCH ?= ""
 TARGET_OBJCOPY_KERNEL_ARCH ?= ""
+KERNEL_MODULE_INSTALL_PREFIX ?= "${nonarch_base_libdir}/modules/${KERNEL_VERSION}"
 
 KERNEL_CC:toolchain-gcc = "${CCACHE}${HOST_PREFIX}gcc ${TARGET_CC_KERNEL_ARCH} \
  -fuse-ld=bfd ${DEBUG_PREFIX_MAP} \
diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index 2b40437cc2..413f39d641 100644
--- a/meta/classes-recipe/kernel-module-split.bbclass
+++ b/meta/classes-recipe/kernel-module-split.bbclass
@@ -61,7 +61,7 @@ post_strip_kernel_modules_signing(){
         # be invoked manually after retrieving M= variable from package source code Makefile.
         oe_runmake \
             -C ${KBUILD_OUTPUT}  \
-            MODLIB=${PKGD}${nonarch_base_libdir}/modules/${KERNEL_VERSION} \
+            MODLIB=${PKGD}${KERNEL_MODULE_INSTALL_PREFIX} \
             ${@'M=%s' % oe.kernel_module.get_ext_mod(d) if not "virtual/kernel" in d.getVar('PROVIDES') else ''} \
             modules_sign
     fi
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index a82bdf7ecb..0a6d754108 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -453,11 +453,11 @@ kernel_do_install() {
 	#
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
-		oe_runmake DEPMOD=echo MODLIB=${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=${D}${firmwaredir} modules_install
-		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
-		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
+		oe_runmake DEPMOD=echo MODLIB=${D}${KERNEL_MODULE_INSTALL_PREFIX} INSTALL_FW_PATH=${D}${firmwaredir} modules_install
+		rm -f "${D}${KERNEL_MODULE_INSTALL_PREFIX}/build"
+		rm -f "${D}${KERNEL_MODULE_INSTALL_PREFIX}/source"
 		# Remove empty module directories to prevent QA issues
-		[ -d "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel" ] && find "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel" -type d -empty -delete
+		[ -d "${D}${KERNEL_MODULE_INSTALL_PREFIX}/kernel" ] && find "${D}${KERNEL_MODULE_INSTALL_PREFIX}/kernel" -type d -empty -delete
 	else
 		bbnote "no modules to install"
 	fi
@@ -680,9 +680,9 @@ EXPORT_FUNCTIONS do_compile do_transform_kernel do_transform_bundled_initramfs d
 # kernel-image becomes kernel-image-${KERNEL_VERSION}
 PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules ${KERNEL_PACKAGE_NAME}-dbg"
 FILES:${PN} = ""
-FILES:${KERNEL_PACKAGE_NAME}-base = "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin.modinfo"
+FILES:${KERNEL_PACKAGE_NAME}-base = "${KERNEL_MODULE_INSTALL_PREFIX}/modules.order ${KERNEL_MODULE_INSTALL_PREFIX}/modules.builtin ${KERNEL_MODULE_INSTALL_PREFIX}/modules.builtin.modinfo"
 FILES:${KERNEL_PACKAGE_NAME}-image = ""
-FILES:${KERNEL_PACKAGE_NAME}-dev = "/${KERNEL_IMAGEDEST}/System.map* /${KERNEL_IMAGEDEST}/Module.symvers* /${KERNEL_IMAGEDEST}/config* ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
+FILES:${KERNEL_PACKAGE_NAME}-dev = "/${KERNEL_IMAGEDEST}/System.map* /${KERNEL_IMAGEDEST}/Module.symvers* /${KERNEL_IMAGEDEST}/config* ${KERNEL_SRC_PATH} ${KERNEL_MODULE_INSTALL_PREFIX}/build"
 FILES:${KERNEL_PACKAGE_NAME}-vmlinux = "/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSION_NAME}"
 FILES:${KERNEL_PACKAGE_NAME}-modules = ""
 FILES:${KERNEL_PACKAGE_NAME}-dbg = "/usr/lib/debug /usr/src/debug"
diff --git a/meta/classes-recipe/module.bbclass b/meta/classes-recipe/module.bbclass
index ce5898125b..985c24bed5 100644
--- a/meta/classes-recipe/module.bbclass
+++ b/meta/classes-recipe/module.bbclass
@@ -46,7 +46,7 @@ module_do_compile() {
 
 module_do_install() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
-	oe_runmake DEPMOD=echo MODLIB="${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}" \
+	oe_runmake DEPMOD=echo MODLIB="${D}${KERNEL_MODULE_INSTALL_PREFIX}" \
 	           INSTALL_FW_PATH="${D}${firmwaredir}" \
 	           CC="${KERNEL_CC}" LD="${KERNEL_LD}" OBJCOPY="${KERNEL_OBJCOPY}" \
 	           STRIP="${KERNEL_STRIP}" \
-- 
2.50.1 (Apple Git-155)


