Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C5D5CE8D6B
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 16:13:04 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13368.1763395970410613046
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Nov 2025 08:13:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CInePm3v;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42b32a5494dso2660658f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 08:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1763395969; x=1764000769; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3V2GalqepYVn8DhqAnEPVtpasO54/rCDa4y6ODQykbg=;
        b=CInePm3v+Oyzs930JsWIiJb1eY6xoWj+XYsm+Fv2joXUmH9K0KcBzyCX+sRu2Vczsl
         7Eo2lIs8BbKDdqj9HKrRmb8L3JHl3APBpWbrzsm0xbREl4wh81mVZzY2uJVtHHTwcFwE
         Ys966Qk60W681+LPqWDp8PPSAe8OLfobxHsrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763395969; x=1764000769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3V2GalqepYVn8DhqAnEPVtpasO54/rCDa4y6ODQykbg=;
        b=UjI//5rFpdQ5lpifWbmXs0qAEuL5zkLhJKKNlSlu16Ah3KIxxYBZoLbWhmQRbg5neF
         w4k54BxJGQZ/44CfBCve32Ait8uOKyN3Qh5WSKuCE2Xouk5rXwMdiNZYCjRQ2lRgx0Uq
         raRYOSVkcBmK834/EREkXqcr0xhJF9j2ZhLC/1CGa8rCdW9YESyBXYgIZS+RPVWjjYfj
         PLVFHIHahzbDfUkgmPehVP1OxIU9kCeayP/BMlQxuVxt/qiHs1GwYNBTi2LBf5/KUwHB
         IMZjCq+UC20RkR2oD/DWYBhczlBcfibpzx0qXXWVXaJ+pV1obPq5qc8SH3gMN0gcClCP
         K8pA==
X-Gm-Message-State: AOJu0YzjeKas7d4jd6IZER9k6m18mRe+GeWrRrm8+rzZe3vfXYWqIM/o
	FZd7hXpJYi8FmX0e85jPs9SliMlfMRIDt+Tkq2MPDPaG9ESQGR9QYM1F/H579wbpL+VnYC6i0rx
	dHv0q
X-Gm-Gg: ASbGnctj7rtT70vEddfb5fX+c7uyV9wrjJX7j/SUUSQfr2ifmrod5MjnWHwPiF80aEZ
	Ecpro9gTUj0NRrWZfS9AXT4BYBg+VQmLd1YpshMLgbReTEbaPcBtdlwSSS7zuN5Y00r7biUB7W5
	RWf5ptIl+5x6IKpB5m+CBtEZ1TIDwsDbdH1YzSS6zKH5t7n7em7+TILtWdcsaASh8TcguvKzr9b
	WifILi84KP2vHQZBCHgxSeAemo9wxsWZF76MWsqA4fVi40skqRDY++3ag3bj/g5QtaqkmOg+P7s
	MfwDjnxGtdgHAH/UMVps8yaPFYz4f5tC68h7/ZVqQwzK+FUCkj4AWYNsSfIsMhVHTYZNEEoqy2+
	LXTJ3quHhPNDJUmT2kfS5qLGnYfWDueU0XxMh7fHmWtu+LkGrCygFJPvC9G7CSg3Nb/xLGmN1AS
	LymdJKn6usMPnIDV4DbR6iuumzKZ4FA36xawcxgK/2FDhEaiDi2XKt1CKN
X-Google-Smtp-Source: AGHT+IGZZxPnLnLXYGL4nch/fuydmQrnH0atySXqKJMyMTo2KmJkiGn1EfpPWMDPXDt9e+EJPjWlXw==
X-Received: by 2002:a05:6000:2509:b0:42b:3978:158e with SMTP id ffacd0b85a97d-42b5936c71cmr11204085f8f.30.1763395968214;
        Mon, 17 Nov 2025 08:12:48 -0800 (PST)
Received: from FRSMI24-BLUE.example.com ([195.68.54.115])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f174afsm26431181f8f.33.2025.11.17.08.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 08:12:47 -0800 (PST)
From: pierre-loup.gosse@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH v2 1/2] u-boot: make initial environment binary image
Date: Mon, 17 Nov 2025 17:12:38 +0100
Message-Id: <20251117161239.1227164-1-pierre-loup.gosse@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 16:13:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226503

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
Cc: Ross Burton <ross.burton@arm.com>
---
Note: Once merged, a patch with the new variables will be submitted to the 
      documentation mailing list.

changes in v2:
- fix uboot_deploy_config (builddir was missing)
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


