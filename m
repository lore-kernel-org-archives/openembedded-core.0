Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web11.492.1588286312484203721
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 15:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=xqUOidJl;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.66, mailfrom: steve@sakoman.com)
Received: by mail-qv1-f66.google.com with SMTP id 59so3904555qva.13
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 15:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=XaNQX/5Ej4jXkbHwdnPxWuFLXTpSJqIUZMMYOirQr7g=;
        b=xqUOidJl4on64VMqlNgWqcyS5u1FU5QlZS1hwIW88JnddWItBkFJH2XrPIlnnmVtic
         Y0NV07nceK1zEA4sa6kKpWzH+Apy968CkyLZjXNuQKMiBzUHHFqW3vPuhooU9plFu9n6
         lOHcCG28rHK7Q+OqcuwvbTAIFRWzzyYsTKU8OO4kmGeCuvmgdY0M+2DSrXy6DzCQHknS
         lFb5xCrDvwQXH3hluBhtdGf9YOkGhmrgjNoZ8VPW27WPeT1eRLQ4GEL08Zt+pcacE7df
         E434chA/Sg9fsK5Obt4HIw8QHtOqbc07FFLyKczx8wKqq0MRc/g1v4Lu0Swa1FCR3q69
         k4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=XaNQX/5Ej4jXkbHwdnPxWuFLXTpSJqIUZMMYOirQr7g=;
        b=OpKzFcvkQkUpqw5jpbCV0W5+eJZ22PpJFXmLzJqienqmcQr+rEQ8ifcz6+j5waTV92
         R2C6vnCxCT4zlI13N443yRzRgUI1y6Arc9g4j5kl+cjFBAzAbw+SxNx78vX/X1v/vl1T
         HMUT97rQ1GefB9sbtoL618id+ns6PV/I4uuKOlkhLxUOxketEZBq31OWT8bKh+wpXO78
         6cCIgBqZJZd0YxNCBX5b3qF36/s9rei6ELPB86NC188vkaAw0JAZ2fPcMVoksE2oDqLg
         cgxL13qZrT6M3gBT4a99DUU+++YOvjtJzFWXh0vuEJplJ9YSTRbOHDeVWKOAEplKLG0C
         /o8A==
X-Gm-Message-State: AGi0PuaPg8hNbl2AguHB709e3EilLJELYzHcF1ao1WS5ko6xbO5FzWVm
	SydydAqdtWPpQtGT8OLftSEogpIL8lW6OQ==
X-Google-Smtp-Source: APiQypLl7C+FQKWei6pMs+80jGCxUmCNyIUjscdzaqOYUmFKIiianDlEqxS0UvAk/qepywuHVHGjqQ==
X-Received: by 2002:a62:c1c1:: with SMTP id i184mr1131010pfg.18.1588285841802;
        Thu, 30 Apr 2020 15:30:41 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d124sm646011pfa.98.2020.04.30.15.30.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 15:30:41 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell v2 01/14] u-boot.inc: install u-boot-initial-env as ${PN}-initial-env in $D and $DEPLOYDIR
Date: Thu, 30 Apr 2020 12:30:06 -1000
Message-Id: <78c55eac69dc4b6ae28d7e7911adb59430376b23.1588285073.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588285073.git.steve@sakoman.com>
References: <cover.1588285073.git.steve@sakoman.com>

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

