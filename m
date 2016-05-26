Return-Path: <andrew.shadura@collabora.co.uk>
X-Greylist: delayed 383 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 26 May 2016 15:19:46 UTC
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id F403462136
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 15:19:46 +0000 (UTC)
Received: from localhost (unknown [IPv6:2001:470:6f:49f:74d5:4f06:493c:15a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested) (Authenticated sender: andrewsh)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A0842261447;
	Thu, 26 May 2016 16:13:22 +0100 (BST)
From: Andrew Shadura <andrew.shadura@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2016 17:13:10 +0200
Message-Id: <1464275590-6623-1-git-send-email-andrew.shadura@collabora.co.uk>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] u-boot: replace old-style shell syntax with the modern one
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 May 2016 15:19:47 -0000

Use "-n" operation instead of comparing with an "x"-ed empty string,
use $(...) notation instead of the deprecated backticks.

Signed-off-by: Andrew Shadura <andrew.shadura@collabora.co.uk>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 60 +++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 037f35c..1071d1f 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -79,13 +79,13 @@ do_compile () {
 		echo ${UBOOT_LOCALVERSION} > ${B}/.scmversion
 		echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
 	fi
-    
-    if [ "x${UBOOT_CONFIG}" != "x" ]
+
+    if [ -n "${UBOOT_CONFIG}" ]
     then
         for config in ${UBOOT_MACHINE}; do
-            i=`expr $i + 1`;
+            i=$(expr $i + 1);
             for type  in ${UBOOT_CONFIG}; do
-                j=`expr $j + 1`;
+                j=$(expr $j + 1);
                 if [ $j -eq $i ]
                 then
                     oe_runmake O=${config} ${config}
@@ -104,12 +104,12 @@ do_compile () {
 }
 
 do_install () {
-    if [ "x${UBOOT_CONFIG}" != "x" ]
+    if [ -n "${UBOOT_CONFIG}" ]
     then
         for config in ${UBOOT_MACHINE}; do
-            i=`expr $i + 1`;
+            i=$(expr $i + 1);
             for type in ${UBOOT_CONFIG}; do
-                j=`expr $j + 1`;
+                j=$(expr $j + 1);
                 if [ $j -eq $i ]
                 then
                     install -d ${D}/boot
@@ -127,14 +127,14 @@ do_install () {
         ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
     fi
 
-    if [ "x${UBOOT_ELF}" != "x" ]
+    if [ -n "${UBOOT_ELF}" ]
     then
-        if [ "x${UBOOT_CONFIG}" != "x" ]
+        if [ -n "${UBOOT_CONFIG}" ]
         then
             for config in ${UBOOT_MACHINE}; do
-                i=`expr $i + 1`;
+                i=$(expr $i + 1);
                 for type in ${UBOOT_CONFIG}; do
-                    j=`expr $j + 1`;
+                    j=$(expr $j + 1);
                     if [ $j -eq $i ]
                     then
                         install ${S}/${config}/${UBOOT_ELF} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}
@@ -156,14 +156,14 @@ do_install () {
         install -m 644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config
     fi
 
-    if [ "x${SPL_BINARY}" != "x" ]
+    if [ -n "${SPL_BINARY}" ]
     then
-        if [ "x${UBOOT_CONFIG}" != "x" ]   
+        if [ -n "${UBOOT_CONFIG}" ]
         then
             for config in ${UBOOT_MACHINE}; do
-                i=`expr $i + 1`;
+                i=$(expr $i + 1);
                 for type in ${UBOOT_CONFIG}; do
-                    j=`expr $j + 1`;
+                    j=$(expr $j + 1);
                     if [ $j -eq $i ]
                     then
                          install ${S}/${config}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}-${type}-${PV}-${PR}
@@ -180,7 +180,7 @@ do_install () {
         fi
     fi
 
-    if [ "x${UBOOT_ENV}" != "x" ]
+    if [ -n "${UBOOT_ENV}" ]
     then
         install ${WORKDIR}/${UBOOT_ENV_BINARY} ${D}/boot/${UBOOT_ENV_IMAGE}
         ln -sf ${UBOOT_ENV_IMAGE} ${D}/boot/${UBOOT_ENV_BINARY}
@@ -190,12 +190,12 @@ do_install () {
 FILES_${PN} = "/boot ${sysconfdir}"
 
 do_deploy () {
-    if [ "x${UBOOT_CONFIG}" != "x" ]
+    if [ -n "${UBOOT_CONFIG}" ]
     then
         for config in ${UBOOT_MACHINE}; do
-            i=`expr $i + 1`;
+            i=$(expr $i + 1);
             for type in ${UBOOT_CONFIG}; do
-                j=`expr $j + 1`;
+                j=$(expr $j + 1);
                 if [ $j -eq $i ]
                 then
                     install -d ${DEPLOYDIR}
@@ -205,8 +205,8 @@ do_deploy () {
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_BINARY}-${type}
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_BINARY}
-                fi 
-            done 
+                fi
+            done
             unset  j
         done
         unset  i
@@ -219,14 +219,14 @@ do_deploy () {
         ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
    fi
 
-    if [ "x${UBOOT_ELF}" != "x" ]
+    if [ -n "${UBOOT_ELF}" ]
     then
-        if [ "x${UBOOT_CONFIG}" != "x" ]
+        if [ -n "${UBOOT_CONFIG}" ]
         then
             for config in ${UBOOT_MACHINE}; do
-                i=`expr $i + 1`;
+                i=$(expr $i + 1);
                 for type in ${UBOOT_CONFIG}; do
-                    j=`expr $j + 1`;
+                    j=$(expr $j + 1);
                     if [ $j -eq $i ]
                     then
                         install ${S}/${config}/${UBOOT_ELF} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}
@@ -247,14 +247,14 @@ do_deploy () {
     fi
 
 
-     if [ "x${SPL_BINARY}" != "x" ]
+     if [ -n "${SPL_BINARY}" ]
      then
-         if [ "x${UBOOT_CONFIG}" != "x" ]   
+         if [ -n "${UBOOT_CONFIG}" ]
          then
              for config in ${UBOOT_MACHINE}; do
-                 i=`expr $i + 1`;
+                 i=$(expr $i + 1);
                  for type in ${UBOOT_CONFIG}; do
-                     j=`expr $j + 1`;
+                     j=$(expr $j + 1);
                      if [ $j -eq $i ]
                      then
                          install ${S}/${config}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}-${type}-${PV}-${PR}
@@ -277,7 +277,7 @@ do_deploy () {
      fi
 
 
-    if [ "x${UBOOT_ENV}" != "x" ]
+    if [ -n "${UBOOT_ENV}" ]
     then
         install ${WORKDIR}/${UBOOT_ENV_BINARY} ${DEPLOYDIR}/${UBOOT_ENV_IMAGE}
         rm -f ${DEPLOYDIR}/${UBOOT_ENV_BINARY} ${DEPLOYDIR}/${UBOOT_ENV_SYMLINK}
-- 
2.7.4


