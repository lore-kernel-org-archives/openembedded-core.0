Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web12.11121.1590669659452069183
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 05:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sLL/cJKW;
 spf=pass (domain: gmail.com, ip: 209.85.208.196, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f196.google.com with SMTP id v16so33211288ljc.8
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2020 05:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A8LVW4FtKuBEPsDx0EFsSeClYxM4MjTvHJ+3QXU+3lA=;
        b=sLL/cJKW/AjoiI8UIpq76Xjwvg8KoTAAdWuY4uFYzCGJU6P/T/rTYS+MUF4YVVuJtK
         86/pnZfnXSMcaS5K9o70MwX0NXg9dEARTDo5SHkEAuf0SA2ipmd+elWFLzDj2lGinssu
         uWDfAmnJezPq8RdnHKkgdTQ2jbEaCowrmI5Y3j/s/PTMiyUlBaW401fYavpLXS+D2sil
         fXrE1UcPnVY2rrgMiJr5ka+FMnZbUeEyk7W/EWMPsHvCKmY3AUzKFcoNhrvJVImlqbsY
         rxDDrpbiAb3l8sgfO3HaCKrfZ4xwdf9KV71kW5qlqLXBNDoBbqsMBVgXF2UeL3tjuKN/
         fMZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A8LVW4FtKuBEPsDx0EFsSeClYxM4MjTvHJ+3QXU+3lA=;
        b=HPtKpkdpDRSPDryofzz4g6bW9IOFhSjK5Wmyv/4Ci5bvT1XChCYaIPyyHjAsRmUV4T
         PO5ZJ7msRE6N3ywZg4obcZlVb36ozZx7d5Wlnb9QF/FWuygkA5Gz76acbJUOgUQ2V1Mk
         zNpcLuroLkCkBZU/OFyi4RgOOmoAufgZtkUplYB9GObQsS8fkFDsiASISUmhWTtU3ouT
         kkJlpuYwd8RRw9ZQ9jxa7fE2UC6kbY+H5a7t+PAUHZzboqg5b0noPOaZxpMPfx/ffh55
         3q8+ewiqnxp+mWbj+tOjFOMf+z4Bb7aWb3/4okY9lGnCAyNJVY+X1reoP9mt6ZCAN2Bu
         1/wA==
X-Gm-Message-State: AOAM532poIxxSdrxRCjWRVgeCEbvB4PW0/mzv9KvlCY5AuMx4eOMLQ4p
	jQirBNvyOrgZcJY++qdVVpws65Gl
X-Google-Smtp-Source: ABdhPJzNM3g1fnC+8Lqv1x7PkNf2kudcIDVajEryyuVDvCc/GtEmlcxcefbmCOannXviDSvCKnYPSA==
X-Received: by 2002:a2e:7d17:: with SMTP id y23mr1425278ljc.105.1590669657563;
        Thu, 28 May 2020 05:40:57 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from localhost.localdomain (m83-185-47-112.cust.tele2.se. [83.185.47.112])
        by smtp.gmail.com with ESMTPSA id f14sm1412061ljp.118.2020.05.28.05.40.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 May 2020 05:40:56 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefan.agner@toradex.com,
	max.krummenacher@toradex.com,
	denys@ti.com,
	Ming Liu <ming.liu@toradex.com>
Subject: [OE-core] [PATCH V3 1/3] u-boot: support merging .cfg files for UBOOT_CONFIG
Date: Thu, 28 May 2020 14:41:27 +0200
Message-Id: <20200528124129.15100-2-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200528124129.15100-1-liu.ming50@gmail.com>
References: <20200528124129.15100-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <ming.liu@toradex.com>

U-boot recipe supports .cfg files in SRC_URI, but they would be merged
to .config during do_configure only when UBOOT_MACHINE is set, we
should also support merging .cfg files for UBOOT_CONFIG.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
Signed-off-by: Ming Liu <ming.liu@toradex.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 80f828df52..8cfd25020c 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -77,7 +77,23 @@ def find_cfgs(d):
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
@@ -85,8 +101,6 @@ do_configure () {
         fi
         merge_config.sh -m .config ${@" ".join(find_cfgs(d))}
         cml1_do_configure
-    else
-        DEVTOOL_DISABLE_MENUCONFIG=true
     fi
 }
 
@@ -114,7 +128,6 @@ do_compile () {
                 j=$(expr $j + 1);
                 if [ $j -eq $i ]
                 then
-                    oe_runmake -C ${S} O=${B}/${config} ${config}
                     oe_runmake -C ${S} O=${B}/${config} ${UBOOT_MAKE_TARGET}
                     for binary in ${UBOOT_BINARIES}; do
                         k=$(expr $k + 1);
-- 
2.26.2

