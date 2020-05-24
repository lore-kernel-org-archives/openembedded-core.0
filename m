Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web11.16141.1590337051773994209
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 May 2020 09:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oNYU7j/P;
 spf=pass (domain: gmail.com, ip: 209.85.208.194, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f194.google.com with SMTP id z18so18206005lji.12
        for <openembedded-core@lists.openembedded.org>; Sun, 24 May 2020 09:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yITJSqBvQLC7ko0/1ZJY8d/zVjRZcbrOd/w0VkIAO1E=;
        b=oNYU7j/Pspmho8Hk4Bz378aTSUiBseZ5qQBD6w3qZrC41+EPVFKCWLi2NaxQHGUT3a
         TLhjfMJNRYa8hi7VcmLCwCJTpO+m9h5vCGRz13mXOtos7Kwtv6U+VKJT0rb8jSsorZEn
         owlCyTw2xEri7vD4yuKDIR3OxDDrCSUBY73nk8I6vsUeeu29sfdM98GmCtjTTkcWrhRS
         VYR7wh2iLMPIcIVYL3TPzc3ylGHE5nT8vtHbr3LNquAlcdGoPvlQpBlaK/pYLMOrBpkG
         PBVxt3OViCmtcRGcxUbkFg6JGzUtGjy2g4kZeWj4iV0qKC4FOT/00VSPYbJWuyDmQfgQ
         5TzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yITJSqBvQLC7ko0/1ZJY8d/zVjRZcbrOd/w0VkIAO1E=;
        b=aX5I+Pghxm+/j4JeZCHJoNa8CNzhcQaPc+6gPom9YvneQ2WB//WgC4PVXmjGLbxjsQ
         Jmn296f/cTJuuROLXVU9PEo+whCxvZCtkFxQ9X4CdAp4lx1ZgMxqonbsrhJiMFgllJKd
         0T/75FCj0K//53INVVJHxrmZ6+xcIY5JObpkM3sPtlNkGj/Oxhz+EbvBa/5AQvY6jI9d
         PepeZBnZw8YiqIc0SDSW9s2uosMz/q/y1CPBRAUYL7obQxb/hH0HyYkCLBHGFV5+gmfY
         sOSPiY3fOAI0Bo6Tj4YnwcZXBHwISioFasPWHEopkpTGAbmy/cq0vZ6gjV4Eb28qaOtg
         HM8A==
X-Gm-Message-State: AOAM533fFKNAU82XD25F0nKgfOf/gHJGkgyfbu31f8uGKHs83rlCqqxv
	obZyxhGnwOPSGa1jUgGMj4+iAN9E
X-Google-Smtp-Source: ABdhPJwcmdXsSBEj/e2g/KDM4BV2wwOKMDf7LRfoc6M+61s/DJzLoeBAtroAqadafpYOiDfjS0zwvQ==
X-Received: by 2002:a2e:150f:: with SMTP id s15mr11641756ljd.102.1590337049570;
        Sun, 24 May 2020 09:17:29 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.lan (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id y8sm3758405ljh.83.2020.05.24.09.17.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 24 May 2020 09:17:29 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefan.agner@toradex.com,
	max.krummenacher@toradex.com,
	Ming Liu <ming.liu@toradex.com>
Subject: [OE-core] [PATCH] u-boot: change ${PN} to u-boot when install/deploy u-boot-init-env
Date: Sun, 24 May 2020 18:17:51 +0200
Message-Id: <20200524161751.22577-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <ming.liu@toradex.com>

It's really inconvenient to have ${PN} as part of the name of
u-boot-init-env, for instance, in BSP layers, it could be u-boot-fslc,
u-boot-qoriq, u-boot-toradex, and so on.

Considerring there is only one virtual/bootloader for a build, we could
replace ${PN} with u-boot to not have to distinguish different names
when accessing it.

Signed-off-by: Ming Liu <ming.liu@toradex.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 80f828df52..188e5295cf 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -156,10 +156,10 @@ do_install () {
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}
 
                     # Install the uboot-initial-env
-                    install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${D}/${sysconfdir}/${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR}
-                    ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/${PN}-initial-env-${MACHINE}-${type}
-                    ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/${PN}-initial-env-${type}
-                    ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/${PN}-initial-env
+                    install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${D}/${sysconfdir}/u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR}
+                    ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env-${MACHINE}-${type}
+                    ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env-${type}
+                    ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env
                 fi
             done
             unset  j
@@ -170,9 +170,9 @@ do_install () {
         ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
 
         # Install the uboot-initial-env
-        install -D -m 644 ${B}/u-boot-initial-env ${D}/${sysconfdir}/${PN}-initial-env-${MACHINE}-${PV}-${PR}
-        ln -sf ${PN}-initial-env-${MACHINE}-${PV}-${PR} ${D}/${sysconfdir}/${PN}-initial-env-${MACHINE}
-        ln -sf ${PN}-initial-env-${MACHINE}-${PV}-${PR} ${D}/${sysconfdir}/${PN}-initial-env
+        install -D -m 644 ${B}/u-boot-initial-env ${D}/${sysconfdir}/u-boot-initial-env-${MACHINE}-${PV}-${PR}
+        ln -sf u-boot-initial-env-${MACHINE}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env-${MACHINE}
+        ln -sf u-boot-initial-env-${MACHINE}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env
     fi
 
     if [ -n "${UBOOT_ELF}" ]
@@ -245,7 +245,7 @@ PACKAGE_BEFORE_PN += "${PN}-env"
 
 RPROVIDES_${PN}-env += "u-boot-default-env"
 FILES_${PN}-env = " \
-    ${sysconfdir}/${PN}-initial-env* \
+    ${sysconfdir}/u-boot-initial-env* \
     ${sysconfdir}/fw_env.config \
 "
 
@@ -269,10 +269,10 @@ do_deploy () {
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_BINARY}
 
                     # Deploy the uboot-initial-env
-                    install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR}
+                    install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${DEPLOYDIR}/u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR}
                     cd ${DEPLOYDIR}
-                    ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${PN}-initial-env-${MACHINE}-${type}
-                    ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${PN}-initial-env-${type}
+                    ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} u-boot-initial-env-${MACHINE}-${type}
+                    ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} u-boot-initial-env-${type}
                 fi
             done
             unset  j
@@ -287,10 +287,10 @@ do_deploy () {
         ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
 
         # Deploy the uboot-initial-env
-        install -D -m 644 ${B}/u-boot-initial-env ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}-${PV}-${PR}
+        install -D -m 644 ${B}/u-boot-initial-env ${DEPLOYDIR}/u-boot-initial-env-${MACHINE}-${PV}-${PR}
         cd ${DEPLOYDIR}
-        ln -sf ${PN}-initial-env-${MACHINE}-${PV}-${PR} ${PN}-initial-env-${MACHINE}
-        ln -sf ${PN}-initial-env-${MACHINE}-${PV}-${PR} ${PN}-initial-env
+        ln -sf u-boot-initial-env-${MACHINE}-${PV}-${PR} u-boot-initial-env-${MACHINE}
+        ln -sf u-boot-initial-env-${MACHINE}-${PV}-${PR} u-boot-initial-env
     fi
 
     if [ -e ${WORKDIR}/fw_env.config ] ; then
-- 
2.26.2

