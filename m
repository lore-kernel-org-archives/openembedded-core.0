Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.4534.1588176694541885306
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 09:11:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=eLY7INYd;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id e6so933893pjt.4
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 09:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=XaNQX/5Ej4jXkbHwdnPxWuFLXTpSJqIUZMMYOirQr7g=;
        b=eLY7INYdQ6WeWesSkzUzzR2ZgHUEk9poXpaRBku44WXllpmihUXN5IGZTwTQyOovaq
         bImB8xwMrUv3lwMmzSL5al6etmn7LE9hnYnk7c/5nJU3xRav7NY5PY/jM04V2SzW92wA
         cHFm5nvKYxRhDCnRpUqdf9YXXgz7q8H/SUF0Jl66egfnPPbqDUBlgNFuX54G4yk0PP+c
         5JA0iaANVLAgP6R6F8gn+TfznaCodepqhB4feHnhZikCZCMua8bd5XcbgtQ2tRPCQifu
         HiMUyo7wdAZMNUElKay0wvCllWds6ARV/sTlet0e2Fc4d1cX6hYHwbETk7rg+s5Df/93
         /lTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=XaNQX/5Ej4jXkbHwdnPxWuFLXTpSJqIUZMMYOirQr7g=;
        b=FQL/Px/9YOTCIpYJAJnC9Jbe0mjqH/vuzt2yqfxvdzPVeidOBKT9agg+vOE68sL29A
         3pbfmocwqHtwvi9D5r2J9RkNSrmH+ac76ed5yng9yAJvMDoxXNBmA1LPWF69t/6La9nj
         U8nOb9YZJoy8a+1uJcPA+6/gVDgXZP64BYogLFamYgX6r9SGWILeZI4711O2XH+UBirF
         AAcqzRTd8qR0v5aLcrHWd8aa+W81lfypbpI+ybdAGdpm/gPw/rsWz9PerLNuWa1FBbdX
         S3J0RAm3FeWEXi83xN4zVqNLcAxRlgOsZMuwk/FlNYSTxwflZF5RJaE24BCoSiF7xA7B
         ZkTw==
X-Gm-Message-State: AGi0PuaFG1i4GEeBiHN3JQUMZ8mlQ6Hsjeo+F8nOtrwgra6iWr9I82l7
	W3j7GHr4iKnE2uGVQW5IWbqhHu96/Dufjg==
X-Google-Smtp-Source: APiQypIIfsfH+y8MNWaz1upr0xJeiJDFPrkbRXpwZEWkNKp+z2wO52QxtepS/6r/DI5FYG9il+Ku8w==
X-Received: by 2002:a17:90a:d709:: with SMTP id y9mr4140065pju.50.1588176693364;
        Wed, 29 Apr 2020 09:11:33 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o1sm4833062pjs.39.2020.04.29.09.11.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 09:11:32 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/16] u-boot.inc: install u-boot-initial-env as ${PN}-initial-env in $D and $DEPLOYDIR
Date: Wed, 29 Apr 2020 06:10:46 -1000
Message-Id: <78c55eac69dc4b6ae28d7e7911adb59430376b23.1588175775.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588175775.git.steve@sakoman.com>
References: <cover.1588175775.git.steve@sakoman.com>

From: Denys Dmytriyenko <denys@ti.com>

The common u-boot.inc can be used by multiple recipes in the same build for
different cores and/or multiple stages of the bootloader. Naming initial-env
with ${PN} prefix avoids clashes in deploy and rootfs between those recipes.

This fixes 69b3b093079c2ca2744d6c02747c5d1b5d3e7ecf that unconditionally
builds, installs and deploys u-boot-initial-env in the common u-boot.inc.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 188e5295cf..80f828df52 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -156,10 +156,10 @@ do_install () {
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}
 
                     # Install the uboot-initial-env
-                    install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${D}/${sysconfdir}/u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR}
-                    ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env-${MACHINE}-${type}
-                    ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env-${type}
-                    ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env
+                    install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${D}/${sysconfdir}/${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR}
+                    ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/${PN}-initial-env-${MACHINE}-${type}
+                    ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/${PN}-initial-env-${type}
+                    ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/${PN}-initial-env
                 fi
             done
             unset  j
@@ -170,9 +170,9 @@ do_install () {
         ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
 
         # Install the uboot-initial-env
-        install -D -m 644 ${B}/u-boot-initial-env ${D}/${sysconfdir}/u-boot-initial-env-${MACHINE}-${PV}-${PR}
-        ln -sf u-boot-initial-env-${MACHINE}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env-${MACHINE}
-        ln -sf u-boot-initial-env-${MACHINE}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env
+        install -D -m 644 ${B}/u-boot-initial-env ${D}/${sysconfdir}/${PN}-initial-env-${MACHINE}-${PV}-${PR}
+        ln -sf ${PN}-initial-env-${MACHINE}-${PV}-${PR} ${D}/${sysconfdir}/${PN}-initial-env-${MACHINE}
+        ln -sf ${PN}-initial-env-${MACHINE}-${PV}-${PR} ${D}/${sysconfdir}/${PN}-initial-env
     fi
 
     if [ -n "${UBOOT_ELF}" ]
@@ -245,7 +245,7 @@ PACKAGE_BEFORE_PN += "${PN}-env"
 
 RPROVIDES_${PN}-env += "u-boot-default-env"
 FILES_${PN}-env = " \
-    ${sysconfdir}/u-boot-initial-env* \
+    ${sysconfdir}/${PN}-initial-env* \
     ${sysconfdir}/fw_env.config \
 "
 
@@ -269,10 +269,10 @@ do_deploy () {
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_BINARY}
 
                     # Deploy the uboot-initial-env
-                    install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${DEPLOYDIR}/u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR}
+                    install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR}
                     cd ${DEPLOYDIR}
-                    ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} u-boot-initial-env-${MACHINE}-${type}
-                    ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} u-boot-initial-env-${type}
+                    ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${PN}-initial-env-${MACHINE}-${type}
+                    ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${PN}-initial-env-${type}
                 fi
             done
             unset  j
@@ -287,10 +287,10 @@ do_deploy () {
         ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
 
         # Deploy the uboot-initial-env
-        install -D -m 644 ${B}/u-boot-initial-env ${DEPLOYDIR}/u-boot-initial-env-${MACHINE}-${PV}-${PR}
+        install -D -m 644 ${B}/u-boot-initial-env ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}-${PV}-${PR}
         cd ${DEPLOYDIR}
-        ln -sf u-boot-initial-env-${MACHINE}-${PV}-${PR} u-boot-initial-env-${MACHINE}
-        ln -sf u-boot-initial-env-${MACHINE}-${PV}-${PR} u-boot-initial-env
+        ln -sf ${PN}-initial-env-${MACHINE}-${PV}-${PR} ${PN}-initial-env-${MACHINE}
+        ln -sf ${PN}-initial-env-${MACHINE}-${PV}-${PR} ${PN}-initial-env
     fi
 
     if [ -e ${WORKDIR}/fw_env.config ] ; then
-- 
2.17.1

