Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04904CFA755
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 08:49:35 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7567.1763714969012995942
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 00:49:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=h36tAeO5;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-429c4c65485so1429840f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 00:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1763714967; x=1764319767; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ye3qPc/9eYme0pPDRwTQtEMugQo2GbPNSYwYLKJRvZ4=;
        b=h36tAeO5QxrN/dZZq7iT0SUYELjik2xCNBsgKWwQMy4xv2I5z6U2nzwh79fouXCqXl
         mq+EZABpNrssL6i4HNUoHAfe/oMRD1FAE9xzDBBduK8oLEtbcCb9tkaCTa3srxn8YWSZ
         /y/Mwe1SaLPc3n+LpoiIY0xhbX74fQjdrQjUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763714967; x=1764319767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ye3qPc/9eYme0pPDRwTQtEMugQo2GbPNSYwYLKJRvZ4=;
        b=o0zgLlB62Tkf27NtZcmD5UCoSL0vjvo4EEMeUc+WSfrOiUl345+s0iqpHQ9MubgGYD
         Uuzwabpp+RAsM4UkyVyXB27YYVp4DnpmAkB7ZFepibRtv9i1EzGSvyXoq2cWY6Dm3cNu
         sJWnys1wyyrFgMNe2vfL7S0H3RC7dTJ6dDjVvQtyG8BX8moZIS7stzePaCPVcxWWHkY4
         TzeICGvcUz0RjJywI0GwQYsXOxZIIkV282fERNGp14Q+gyLD/UG0x30H2BXb50xvqv8t
         nK9HcSe7hqttMhwMP8BH5e0FXEu+ZlmH71MkTeLYKZ/GTq/aOHCJzUOnUUBHHsWGbku4
         FUOw==
X-Gm-Message-State: AOJu0YwF+rsTlcE/+JIzizjY9MWbyRfCWKJtHn4JrznbXf2J2X9NzwXL
	EAhsH+7B0cWK6d7B1mF2KRRTi/gy2IxBaNiLD/Xfz0fEA+Z+m6uBQp5lKY8EbC1QsuuoYNxEh8q
	CpN5G
X-Gm-Gg: ASbGncsH6QEU2S9Gd6sPDbYbW6KjNFEPb+uB6WKKNdoK1g8LetXzLt6VYzW32EXhhUf
	vMn8IOwoPGniuYElY7lqDWxwGLMZ6KTVYq3+V7JFDXVdRsQfwQZC35PCAzTxoqMtML6urgoeNaP
	BNQ8ZTN1JV6JwZs89MUID1fuCwNH+oR8WB+8W0J8M4k20l9wJLJ8paWZEFslkIcmY0zvmyqBC38
	IwoTZv4EkZFk5znUNL14W58cXphRuVXOj7l8AqQ9I6wvqC2HVcRtLGsYg++aj2ej8Ssrp5OMK/k
	K43mlTsO3SM7NAv3+jdSJRoSwwuipiWNxpkWPGa/OQNACL7a4R3jn7sYnmYKBqILY4k4+27/TOu
	TPsSS0mDB5+wBbjHyTwOBR/c5HdSNlgiKqdl5mr2Ks66kVYoSEyWU+jbQUM8VM91XitKRN/ZI/f
	Z80P0bxUVt+QON2WrARj0Wu4OCpz4NjPlxWwD4sRVyr2y+68oyD+gEp/wlCTrbfac1ka7RFm5Dh
	ltn09M8QCYQEFm+d123oMYLeCEC
X-Google-Smtp-Source: AGHT+IGsWVzomQ1iGiEanCTtosURUeVG/7Ao58u/FqnwKbmQiSt0yX1kL2279baxpGN2yNcT0Ji2Vw==
X-Received: by 2002:a05:6000:310d:b0:42b:2e39:6d58 with SMTP id ffacd0b85a97d-42cc1d51a80mr1163743f8f.51.1763714967167;
        Fri, 21 Nov 2025 00:49:27 -0800 (PST)
Received: from FRSMI24-BLUE.example.com (2a01cb000301bd00856597798efcbb8b.ipv6.abo.wanadoo.fr. [2a01:cb00:301:bd00:8565:9779:8efc:bb8b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa41d2sm9635201f8f.22.2025.11.21.00.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 00:49:26 -0800 (PST)
From: pierre-loup.gosse@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
Subject: [PATCH v3 1/2] u-boot: make initial environment binary image
Date: Fri, 21 Nov 2025 09:49:17 +0100
Message-Id: <20251121084918.875151-1-pierre-loup.gosse@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 08:49:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226653

From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>

Build the U-Boot initial environment binary image if
UBOOT_INITIAL_ENV_BINARY is set to "1". The environment partition size
(in bytes, hexadecimal or decimal) must be defined using
UBOOT_INITIAL_ENV_BINARY_SIZE.

If U-Boot environment redundancy is enabled,
UBOOT_INITIAL_ENV_BINARY_REDUND must be set to "1".

The resulting binary can be flashed using WIC at the environment offset,
overriding any existing environment if present, for example:

  part --source rawcopy --sourceparams="file=u-boot-initial-env-sd.bin" --ondisk sda --no-table --offset 4096

Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
---
Note: Once merged, a patch with the new variables will be submitted to the
      documentation mailing list.

changes in v2:
- fix uboot_deploy_config (builddir was missing)

no changes in v3
---
 meta/classes-recipe/uboot-config.bbclass | 11 +++++++++
 meta/recipes-bsp/u-boot/u-boot.inc       | 30 ++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe/uboot-config.bbclass
index fd6c045142..81057b5cad 100644
--- a/meta/classes-recipe/uboot-config.bbclass
+++ b/meta/classes-recipe/uboot-config.bbclass
@@ -71,6 +71,14 @@ UBOOT_ENV_BINARY ?= "${UBOOT_ENV}.${UBOOT_ENV_SUFFIX}"
 UBOOT_ENV_IMAGE ?= "${UBOOT_ENV}-${MACHINE}-${UBOOT_VERSION}.${UBOOT_ENV_SUFFIX}"
 UBOOT_ENV_SYMLINK ?= "${UBOOT_ENV}-${MACHINE}.${UBOOT_ENV_SUFFIX}"
 
+# Enable the build of the U-Boot initial env binary image. The binary size is
+# required (i.e. the U-Boot partition environment size). Since the environment
+# layout with multiple copies is different, set UBOOT_INITIAL_ENV_BINARY_REDUND
+# to "1" if the U-Boot environment redundancy is enabled.
+UBOOT_INITIAL_ENV_BINARY ?= "0"
+UBOOT_INITIAL_ENV_BINARY_SIZE ?= ""
+UBOOT_INITIAL_ENV_BINARY_REDUND ?= "0"
+
 # U-Boot EXTLINUX variables. U-Boot searches for /boot/extlinux/extlinux.conf
 # to find EXTLINUX conf file.
 UBOOT_EXTLINUX_INSTALL_DIR ?= "/boot/extlinux"
@@ -100,6 +108,9 @@ UBOOT_DTB_BINARY ??= ""
 UBOOT_FIT_CHECK_SIGN ?= "uboot-fit_check_sign"
 
 python () {
+    if bb.utils.to_boolean(d.getVar('UBOOT_INITIAL_ENV_BINARY')) and d.getVar('UBOOT_INITIAL_ENV_BINARY_SIZE') == "":
+        bb.fatal("UBOOT_INITIAL_ENV_BINARY requires setting the U-Boot partition environment size with the UBOOT_INITIAL_ENV_BINARY_SIZE variable")
+
     ubootmachine = d.getVar("UBOOT_MACHINE")
     ubootconfigflags = d.getVarFlags('UBOOT_CONFIG')
     ubootbinary = d.getVar('UBOOT_BINARY')
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 16c9836508..ffa9ef2d59 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -4,6 +4,7 @@ PROVIDES = "virtual/bootloader"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS += "${@bb.utils.contains('UBOOT_ENV_SUFFIX', 'scr', 'u-boot-mkimage-native', '', d)}"
+DEPENDS += "${@ 'u-boot-mkenvimage-native' if bb.utils.to_boolean(d.getVar('UBOOT_INITIAL_ENV_BINARY')) else ''}"
 
 inherit uboot-config uboot-extlinux-config uboot-sign deploy python3native kernel-arch
 
@@ -104,6 +105,10 @@ uboot_compile_config () {
     if [ -n "${UBOOT_INITIAL_ENV}" ]; then
         oe_runmake -C ${S} O=${B}/${builddir} u-boot-initial-env
         cp ${B}/${builddir}/u-boot-initial-env ${B}/${builddir}/u-boot-initial-env-${type}
+        if [ "${UBOOT_INITIAL_ENV_BINARY}" = "1" ] ; then
+            uboot_compile_initial_env_binary
+            cp ${B}/${builddir}/u-boot-initial-env.bin ${B}/${builddir}/u-boot-initial-env-${type}.bin
+        fi
     fi
 }
 
@@ -123,7 +128,18 @@ uboot_compile () {
     # Generate the uboot-initial-env
     if [ -n "${UBOOT_INITIAL_ENV}" ]; then
         oe_runmake -C ${S} O=${B} u-boot-initial-env
+        if [ "${UBOOT_INITIAL_ENV_BINARY}" = "1" ] ; then
+            uboot_compile_initial_env_binary
+        fi
+    fi
+}
+
+uboot_compile_initial_env_binary() {
+    redund=""
+    if [ "${UBOOT_INITIAL_ENV_BINARY_REDUND}" = "1" ] ; then
+        redund="-r"
     fi
+    uboot-mkenvimage -s ${UBOOT_INITIAL_ENV_BINARY_SIZE} ${redund} -o ${B}/${builddir}/u-boot-initial-env.bin ${B}/${builddir}/u-boot-initial-env
 }
 
 do_install () {
@@ -388,9 +404,16 @@ uboot_deploy_config () {
     # Deploy the uboot-initial-env
     if [ -n "${UBOOT_INITIAL_ENV}" ]; then
         install -D -m 644 ${B}/${builddir}/u-boot-initial-env-${type} ${DEPLOYDIR}/${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${UBOOT_VERSION}
+        if [ "${UBOOT_INITIAL_ENV_BINARY}" = "1" ]; then
+            install -D -m 644 ${B}/${builddir}/u-boot-initial-env-${type}.bin ${DEPLOYDIR}/${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${UBOOT_VERSION}.bin
+        fi
         cd ${DEPLOYDIR}
         ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${UBOOT_VERSION} ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}
         ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${UBOOT_VERSION} ${UBOOT_INITIAL_ENV}-${type}
+        if [ "${UBOOT_INITIAL_ENV_BINARY}" = "1" ]; then
+            ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${UBOOT_VERSION}.bin ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}.bin
+            ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${UBOOT_VERSION}.bin ${UBOOT_INITIAL_ENV}-${type}.bin
+        fi
     fi
 }
 
@@ -405,9 +428,16 @@ uboot_deploy () {
     # Deploy the uboot-initial-env
     if [ -n "${UBOOT_INITIAL_ENV}" ]; then
         install -D -m 644 ${B}/u-boot-initial-env ${DEPLOYDIR}/${UBOOT_INITIAL_ENV}-${MACHINE}-${UBOOT_VERSION}
+        if [ "${UBOOT_INITIAL_ENV_BINARY}" = "1" ]; then
+            install -D -m 644 ${B}/u-boot-initial-env.bin ${DEPLOYDIR}/${UBOOT_INITIAL_ENV}-${MACHINE}-${UBOOT_VERSION}.bin
+        fi
         cd ${DEPLOYDIR}
         ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${UBOOT_VERSION} ${UBOOT_INITIAL_ENV}-${MACHINE}
         ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${UBOOT_VERSION} ${UBOOT_INITIAL_ENV}
+        if [ "${UBOOT_INITIAL_ENV_BINARY}" = "1" ]; then
+            ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${UBOOT_VERSION}.bin ${UBOOT_INITIAL_ENV}-${MACHINE}.bin
+            ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${UBOOT_VERSION}.bin ${UBOOT_INITIAL_ENV}.bin
+        fi
     fi
 }
 
-- 
2.34.1


