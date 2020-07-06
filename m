Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web10.61192.1594051869815670962
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 09:11:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=GMjaBrNb;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.196, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f196.google.com with SMTP id q17so1088383pls.9
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 09:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=iKjwJmIm4i53dScO2jG0+gXb0bgjkMoaQroWslby0nc=;
        b=GMjaBrNbqvixwa5a6+wDZS88vAvkLajGpeiogJ5vxYBtlvBNIJEW/4MerOCZ5hvl73
         4bk3LTr/3LxcjNde4COxEjiwNXL+U4VzJowFlPMtOcKgG+QAzkZdi8vWamVrt+4FN1bd
         8VcGiI6Zo4gZhhlkHwLkYsRplFDnVEZxwF5/4hBA1hJ8d50WO1Eu56yV1lDWIM1hie/+
         5XRo+YPs/+qddqnj9ZwoKxzx9aRTKdG7MlsxrIOY4MiLuPTObM5D6MYT5ZTUT0oVpHUx
         hCw8EL4n5z2S/aRK8/IIT7gd6J+j1Fwp/UvO8L5oXaf++Gt4zJBJTDtFi9iqsU471Thy
         W33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=iKjwJmIm4i53dScO2jG0+gXb0bgjkMoaQroWslby0nc=;
        b=Q+nR3IAq4pKtzD7kCfYoigDxaqrD4UWYx6d57Fzzi4SzfkOy536U5zz1c3u8zc2qwF
         ixGzkSOzGi3Nr5/zzhnnTwoVjbxVt3Z15MxRgvRBSXdnPm/4/hGOkKD7YIWRCYlD5FbP
         1AeyNEzapRH+iGU1SdTneKqDve9Mdmn1Y9lcu33EdjK+0kkK7kaobAho+EZtFC53IC5S
         06H73DQIYzMH4GDX7mSem9C1jdc/Q6haCn8m6hFLWduNuf6QjqUPL1u7VTAUSrs4idR7
         BN63PnooDwRgb2UDLOMw0d4XYeDVAk2IIj6uZbojEIgJkvqui54qKnQEfxaSPHIJ7zWQ
         puow==
X-Gm-Message-State: AOAM5316fcq/Ewhpe1qqwagQs4CcKOaCp4jIcltHES/cLdNj7Y65p5L9
	PKTCihI174TWxQbyU/d6aG5RMqDwcZhoYA==
X-Google-Smtp-Source: ABdhPJzLuEPCsew+4I8JOMtptkGYBMFObSc+MgDdZRoiIruLTSrh2CkLDJBRNrIWB5Lqmf3qwjadfw==
X-Received: by 2002:a17:90a:ba05:: with SMTP id s5mr4282pjr.132.1594051868787;
        Mon, 06 Jul 2020 09:11:08 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i67sm18225811pfg.13.2020.07.06.09.11.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 09:11:08 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/25] u-boot: support merging .cfg files for UBOOT_CONFIG
Date: Mon,  6 Jul 2020 06:10:04 -1000
Message-Id: <cd7ca887f79f67f2cf0499481a4032825c3077f2.1594050175.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594050175.git.steve@sakoman.com>
References: <cover.1594050175.git.steve@sakoman.com>

From: Ming Liu <ming.liu@toradex.com>

U-boot recipe supports .cfg files in SRC_URI, but they would be merged
to .config during do_configure only when UBOOT_MACHINE is set, we
should also support merging .cfg files for UBOOT_CONFIG.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
Signed-off-by: Ming Liu <ming.liu@toradex.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ce3de00d41791fa5e9557c5e93a99fbe368311f5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index cbe15cb3c8..f905dfed4e 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -81,7 +81,23 @@ def find_cfgs(d):
     return sources_list
 
 do_configure () {
-    if [ -z "${UBOOT_CONFIG}" ]; then
+    if [ -n "${UBOOT_CONFIG}" ]; then
+        unset i j
+        for config in ${UBOOT_MACHINE}; do
+            i=$(expr $i + 1);
+            for type in ${UBOOT_CONFIG}; do
+                j=$(expr $j + 1);
+                if [ $j -eq $i ]; then
+                    oe_runmake -C ${S} O=${B}/${config} ${config}
+                    merge_config.sh -m -O ${B}/${config} ${B}/${config}/.config ${@" ".join(find_cfgs(d))}
+                    oe_runmake -C ${S} O=${B}/${config} oldconfig
+                fi
+            done
+            unset j
+        done
+        unset i
+        DEVTOOL_DISABLE_MENUCONFIG=true
+    else
         if [ -n "${UBOOT_MACHINE}" ]; then
             oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE}
         else
@@ -89,8 +105,6 @@ do_configure () {
         fi
         merge_config.sh -m .config ${@" ".join(find_cfgs(d))}
         cml1_do_configure
-    else
-        DEVTOOL_DISABLE_MENUCONFIG=true
     fi
 }
 
@@ -118,7 +132,6 @@ do_compile () {
                 j=$(expr $j + 1);
                 if [ $j -eq $i ]
                 then
-                    oe_runmake -C ${S} O=${B}/${config} ${config}
                     oe_runmake -C ${S} O=${B}/${config} ${UBOOT_MAKE_TARGET}
                     for binary in ${UBOOT_BINARIES}; do
                         k=$(expr $k + 1);
-- 
2.17.1

