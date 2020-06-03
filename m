Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web11.12138.1591185318494791486
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 04:55:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eJAFEPOZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.68, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f68.google.com with SMTP id c21so1133066lfb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2020 04:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A8LVW4FtKuBEPsDx0EFsSeClYxM4MjTvHJ+3QXU+3lA=;
        b=eJAFEPOZQikuC44ISM5vFc9u1si0/T9HqIESbanubZ39i2rvsFDTzeL12GTg0PX4DJ
         xAhPWmXGdNkmt01r6AGzJJwQrZHlUQ941ukiZ6ZVPy77DUK0oPenn5fUX8BqtpBSsoGY
         U0fk1dSOoNzxr29ccpz+BuWsvRwhX0yQjXMn0w9ex6uhQkk6NcqmGqNAOcfuD5eyoZL0
         +KmzoohJw41fB9RLjXzkZedLPg4iYBq+0+TJ7HG9ezWchl17NZkSgLdgnVosvrhhruXt
         a098mUuNmSXMtHZQmV9/rvjquNejzxKMNwpwvSb68OgXRsD7GRkiWr9TwgmiRGnADMF8
         zIBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A8LVW4FtKuBEPsDx0EFsSeClYxM4MjTvHJ+3QXU+3lA=;
        b=FsD5DyNiGtz92O4RXlvEMJmCGZB1SF9/pS7hLVylVCYtlA/OvYnAEXZcVGM5Pgpg2k
         bkWQKX5CcaXptnLmH7upUG6ie3RDbN8yiKA7gXm2A4Ogdc1nTrdsbwnlnegr/vQwbO6R
         sn1tFjqTV5GAUeJ+I6zCkVe2rdQggIHQEPZxI/fos6HejpldD2mUe4U1PleJaDfcRjrk
         cbeMudONZ5fCMiADzZowRCeYHv1VI3A4V32DErbRSFAkvbHK8t4CHKSQ47Cncxyyt2Xv
         D4HOm8eBrP3wpnsn995T4S06siHxj+joAymm2DVYbQywnXkQpVgExAE3vqvaXWVOUWNb
         4nKA==
X-Gm-Message-State: AOAM530qJA/pbBqb4Hsb9prJ6ltfG93jh8pnLHCFv93vxu2f6FsUKSeZ
	5Cvgq9rS2m3x7KEho4VOquxZtxR9
X-Google-Smtp-Source: ABdhPJxH2DSbFm6BXQ20MMkcSpfjz0KuN085gitlI3/pwUV0Rd3lZXpB9IAUsz3vgpnHIf6oJdDZYw==
X-Received: by 2002:a19:f017:: with SMTP id p23mr2263442lfc.79.1591185316069;
        Wed, 03 Jun 2020 04:55:16 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from localhost.localdomain ([2a00:801:3fb:ebd4:e18d:d2e7:773:e410])
        by smtp.gmail.com with ESMTPSA id p68sm551652lfa.71.2020.06.03.04.55.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jun 2020 04:55:14 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefan.agner@toradex.com,
	max.krummenacher@toradex.com,
	Ming Liu <ming.liu@toradex.com>
Subject: [OE-core] [PATCH V2] u-boot: support merging .cfg files for UBOOT_CONFIG
Date: Wed,  3 Jun 2020 13:56:01 +0200
Message-Id: <20200603115601.13841-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.26.2
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

