Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA58CCD1A5
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 07:37:58 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.4242.1761291475630304750
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Oct 2025 00:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YAkTNJCp;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4710022571cso18034935e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 00:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1761291474; x=1761896274; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a2V4tuTW7xDQMueKRjdy6ZyLS9cUqwxj1/q3VX6LxpM=;
        b=YAkTNJCpJRtqWZ61QAH2PcEgSq4QWAr95fqQja9Mgp93PdQOC6A9diwuk+btFbcg29
         5roJcS+o5PZapdcw97S/LwRpy8VK1UY84RkqEb4KyuXUGtWvNfO4/X4TyO9iuiCYQ6QT
         aCaioW201VNHVyIScdNB9tR+QbUcrw7isMzZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761291474; x=1761896274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a2V4tuTW7xDQMueKRjdy6ZyLS9cUqwxj1/q3VX6LxpM=;
        b=PX4lBirizfKGjl+CoAuQiZMlNpjrI12Ev/90YUreG0X35BleHKtCgfCtGsf351EATw
         wKdt/tuTU1XoA5PgUtQCSvZuwtPgCl91gvceFn8rfJx2cmVqN/dnU5kC5Ppxbg38/9oW
         YYZtopAzj6tvOUiZ679BwgbhCVE9hdc5aWM1j+qHD/AxFLyTrbYVND1m+nmWv5rxRfej
         jEV3o2V9CeJ9EJ5o+YfVYlhLhKOzzzTx8cZZpRhqw+MUrTgwgfV/Yy7+i78fqhHDt9cZ
         ORn7I8YGqy9/TwduprKh5SQ84fz2GjcUz0Hr7/IQ3xxYh04dgIvJy8cM+yTl7JF/dSej
         joCQ==
X-Gm-Message-State: AOJu0YzlBd+WPEeugE/MVxN7EOgb+7kxx4hhPxA+iG7oyTbgkJDzXI7C
	VdX5PZBSBZrkeBj0n7SmPGdEQ+B/0BF1AAfXhAmBfX5f4OzMuXnW0pXAU8Y9fB8TjlfPtHikuyH
	jTxtA
X-Gm-Gg: ASbGncsNJAR2iVCP0C8Yyj9n3teD8aMQUruLDmhND+PFDK/YVwBD7HkvZUnEgD2ZRwh
	cYMuhlkmZjLcrjQVxWRsD4f+IMr/oZlMkM8KX3a2tPURom+lYZjKWrp7qYPi0xlHJllG95ZprRB
	sNXPgFz/4iwVtUJz30JaMBUYT/uHqYFMU9d26ZXtnvU2X/jTPmlbrw6mxWwkh1aDxdyiw8ShWbd
	242ErSyIJr7z751U4M2uiv1qpDnGuh+fhTN+3uV0KxSwBgV5qKkshhZY4lkdT7cOmBCqSNBhFyw
	GyM/bEajQppaQJ+CUIgQkFaX9UY3q2StBQXdAmGYGI4QDhy5Kxsd6E5boOXU4uczx7KVO0gE3RM
	ez64jaDkQvenuuQtRkJgjoI+vUTfuoCmbo8+Kb9f387T6gnp3kbeljX51xjCXPbsc1HWEjnf+MK
	QMnhhAUReKH7csoQNPgi2iAyBodewWNlS0CRHkButm71pikSBn7uTFcZWthcJ+I48er75Zd21mK
	TDAMT3VY+MU6XGyIQ==
X-Google-Smtp-Source: AGHT+IGaF1nnQbZ9nYEU5VuC5J5J639+CYrqt9KYci1/VcGN9FBcry86BXc14Ps8Q02hgBqY01T30Q==
X-Received: by 2002:a05:600c:4fc1:b0:471:b5d:2db7 with SMTP id 5b1f17b1804b1-4711790697amr176641745e9.24.1761291473831;
        Fri, 24 Oct 2025 00:37:53 -0700 (PDT)
Received: from FRSMI24-BLUE.home (2a01cb000301bd0006147b1ba480ee12.ipv6.abo.wanadoo.fr. [2a01:cb00:301:bd00:614:7b1b:a480:ee12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47494b365adsm79090015e9.6.2025.10.24.00.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 00:37:53 -0700 (PDT)
From: pierre-loup.gosse@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
Subject: [PATCH] u-boot: make initial environment binary image
Date: Fri, 24 Oct 2025 09:37:38 +0200
Message-Id: <20251024073738.1060583-1-pierre-loup.gosse@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 07:37:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225287

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
---
 meta/classes-recipe/uboot-config.bbclass | 11 +++++++++
 meta/recipes-bsp/u-boot/u-boot.inc       | 30 ++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe/uboot-config.bbclass
index eb82dd3583..326c09776e 100644
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
index 16c9836508..3e3c32c08e 100644
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
+            install -D -m 644 ${B}/u-boot-initial-env-${type}.bin ${DEPLOYDIR}/${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${UBOOT_VERSION}.bin
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


