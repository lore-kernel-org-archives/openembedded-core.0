Received: from esa3.mentor.iphmx.com (esa3.mentor.iphmx.com [68.232.137.180])
 by mx.groups.io with SMTP id smtpd.web12.14749.1593422206725392482
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2020 02:16:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: mentor.com, ip: 68.232.137.180, mailfrom: ahsan_hussain@mentor.com)
IronPort-SDR: ZrcLBiygcxLq+jUK5gGY/tNi+NTb+c4XdCzRVVk72TDvbwKvYNrzimkb9oQcMb1sx/qCHugcOF
 e77q8Xpb9kBDF9NP4t8G+sFJLC601yX3S6j3cR/d8n2BLOX5FPGrHzN3tKqJSaiJk/q2y5uO7H
 ahsHAUzyrk+OT+CY/3V52uJS5alkVc2GhFVexOOgcfjmMZAZ5vxqBCAE+iUjwMipC7iEoO06so
 2pBuWjg/WyPKRZpCeGl/7upq03hrqBPNXCMERwgrISEgebXpLK2oj082zkQsA1nOIHZnTNnYpA
 ECM=
X-IronPort-AV: E=Sophos;i="5.75,294,1589270400"; 
   d="scan'208";a="50285557"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 29 Jun 2020 01:16:45 -0800
IronPort-SDR: aWWZh4yn/agQ7H1KWYpUOoWM781vJcRQ04EOkUtsc+ny6m078LcX7bcSc5FfiDcNMEI4PSYv4y
 ILHv06mRe7Q3bKiX3PcmAHHrdXbsXy0Gcn6KM0AORRk5VnuIeW9z7RKq6/GwJ5OyjF06BgGhEV
 TRWIUEFThVH57PKeNIv8P33Tc98czkXNqv3qRWiEsvilYiVFVzK4jYOA3Zh3TE1DCi3ezaDU/N
 jL+hKLio2BvvUR7IEnCQTfPiefx1xgpta2o8h1V6c63cJX+0KoJ+R64S3dF9trC1uOoH3ubzDX
 yt0=
From: "ahussain" <ahsan_hussain@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [dunfell][PATCH 1/2] u-boot: support merging .cfg files for UBOOT_CONFIG
Date: Mon, 29 Jun 2020 14:16:18 +0500
Message-ID: <63967d5c25d4235fe0d80ec0399463e26d087faf.1593420599.git.ahsan_hussain@mentor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1593420599.git.ahsan_hussain@mentor.com>
References: <cover.1593420599.git.ahsan_hussain@mentor.com>
MIME-Version: 1.0
Return-Path: ahsan_hussain@mentor.com
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-06.mgc.mentorg.com (139.181.222.6) To
 SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4)
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Ming Liu <ming.liu@toradex.com>

U-boot recipe supports .cfg files in SRC_URI, but they would be merged
to .config during do_configure only when UBOOT_MACHINE is set, we
should also support merging .cfg files for UBOOT_CONFIG.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
Signed-off-by: Ming Liu <ming.liu@toradex.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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
2.25.1

