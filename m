Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ACC9CCA470
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 16:23:05 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.23243.1759854177912358040
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 09:22:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=mbIFNrjo;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 597GMv1F116923
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Oct 2025 11:22:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759854177;
	bh=X9V9jncuk5qbpl/Yp++gCQ/Hj8Xhaemc3RRzJ5B/zGM=;
	h=From:To:Subject:Date;
	b=mbIFNrjo8hTraoy52Qi4auTduvhAIJfqtra7eDknIkbZgfhvFQvRrmzSwJoUF6/F/
	 pOaVY7GaRCOnjnqZa9doOr6sq/dD7LNkcuORHLuEKSskpCUcBmdo43vfvvGS0ZuXaU
	 cmdi4vy54gy4HDRGcyAI5OWUlp5mX6NsTwlm7rl0=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 597GMvaB001134
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Oct 2025 11:22:57 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 7
 Oct 2025 11:22:56 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 7 Oct 2025 11:22:56 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 597GMu761398337
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Oct 2025 11:22:56 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1v6ASm-0000MB-On
	for openembedded-core@lists.openembedded.org; Tue, 07 Oct 2025 11:22:56 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] u-boot: Add specifying make options as part the config looping
Date: Tue, 7 Oct 2025 11:22:56 -0500
Message-ID: <20251007162256.696-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 16:23:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224543

There is a need to generate alternative versions of the uboot files
using the existing config looping system, but we need to add additional
settings to the make call rather simply specifying a different config.
Specifically we have two use cases:

1) We want to sign the same uboot files with two different keys where
   the key will be passed on the make call.
2) We want to include the alternative defconfigs from a different
   repository and need to add the path to this new location on the make
   command line.

This introduces a fourth value for the UBOOT_CONFIG settings:

  config,images,binary,make_opts

The values are placed into a new generated variable
UBOOT_CONFIG_MAKE_OPTS which is a '?' separated list since space can be
present if you need to specify multiple options.  This is handled by
changing IFS in the shell code when looping over the variable.

Additionally, add in a new variable UBOOT_MAKE_OPTS which is added to
the make calls in the various do_compile functions that do the actual
compiling.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta/classes-recipe/uboot-config.bbclass     | 15 +++++++++++++--
 meta/recipes-bsp/u-boot/u-boot-configure.inc | 18 +++++++++++++++---
 meta/recipes-bsp/u-boot/u-boot.inc           | 16 ++++++++++++++--
 3 files changed, 42 insertions(+), 7 deletions(-)

diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe/uboot-config.bbclass
index bc20913f73..eb82dd3583 100644
--- a/meta/classes-recipe/uboot-config.bbclass
+++ b/meta/classes-recipe/uboot-config.bbclass
@@ -35,6 +35,7 @@ UBOOT_BINARYNAME ?= "${@os.path.splitext(d.getVar("UBOOT_BINARY"))[0]}"
 UBOOT_IMAGE ?= "${UBOOT_BINARYNAME}-${MACHINE}-${UBOOT_VERSION}.${UBOOT_SUFFIX}"
 UBOOT_SYMLINK ?= "${UBOOT_BINARYNAME}-${MACHINE}.${UBOOT_SUFFIX}"
 UBOOT_MAKE_TARGET ?= "all"
+UBOOT_MAKE_OPTS ?= ""
 
 # Output the ELF generated. Some platforms can use the ELF file and directly
 # load it (JTAG booting, QEMU) additionally the ELF can be used for debugging
@@ -103,6 +104,7 @@ python () {
     ubootconfigflags = d.getVarFlags('UBOOT_CONFIG')
     ubootbinary = d.getVar('UBOOT_BINARY')
     ubootbinaries = d.getVar('UBOOT_BINARIES')
+    ubootconfigmakeopts = d.getVar('UBOOT_CONFIG_MAKE_OPTS')
     # The "doc" varflag is special, we don't want to see it here
     ubootconfigflags.pop('doc', None)
     ubootconfig = (d.getVar('UBOOT_CONFIG') or "").split()
@@ -120,6 +122,9 @@ python () {
     if ubootconfigflags and ubootbinaries:
         raise bb.parse.SkipRecipe("You cannot use UBOOT_BINARIES as it is internal to uboot_config.bbclass.")
 
+    if ubootconfigflags and ubootconfigmakeopts:
+        raise bb.parse.SkipRecipe("You cannot use UBOOT_CONFIG_MAKE_OPTS as it is internal to uboot_config.bbclass.")
+
     if len(ubootconfig) > 0:
         for config in ubootconfig:
             found = False
@@ -127,8 +132,8 @@ python () {
                 if config == f: 
                     found = True
                     items = v.split(',')
-                    if items[0] and len(items) > 3:
-                        raise bb.parse.SkipRecipe('Only config,images,binary can be specified!')
+                    if items[0] and len(items) > 4:
+                        raise bb.parse.SkipRecipe('Only config,images,binary,make_opts can be specified!')
                     d.appendVar('UBOOT_MACHINE', ' ' + items[0])
                     # IMAGE_FSTYPES appending
                     if len(items) > 1 and items[1]:
@@ -140,6 +145,12 @@ python () {
                     else:
                         bb.debug(1, "Appending '%s' to UBOOT_BINARIES." % ubootbinary)
                         d.appendVar('UBOOT_BINARIES', ' ' + ubootbinary)
+                    if len(items) > 3 and items[3]:
+                        bb.debug(1, "Appending '%s' to UBOOT_CONFIG_MAKE_OPTS." % items[3])
+                        d.appendVar('UBOOT_CONFIG_MAKE_OPTS', items[3] + " ? ")
+                    else:
+                        bb.debug(1, "Appending '%s' to UBOOT_CONFIG_MAKE_OPTS." % "")
+                        d.appendVar('UBOOT_CONFIG_MAKE_OPTS', " ? ")
                     break
 
             if not found:
diff --git a/meta/recipes-bsp/u-boot/u-boot-configure.inc b/meta/recipes-bsp/u-boot/u-boot-configure.inc
index a15511f8b2..bada506b66 100644
--- a/meta/recipes-bsp/u-boot/u-boot-configure.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-configure.inc
@@ -33,7 +33,19 @@ uboot_configure_config () {
     config=$1
     type=$2
 
-    oe_runmake -C ${S} O=${B}/${config} ${config}
+    unset k
+    IFS="?"
+    uboot_config_make_opts="${UBOOT_CONFIG_MAKE_OPTS}"
+    for config_make_opts in $uboot_config_make_opts; do
+        k=$(expr $k + 1);
+        if [ $k -eq $i ]; then
+            break
+        fi
+    done
+    unset IFS
+    unset k
+
+    oe_runmake -C ${S} O=${B}/${config} ${config_make_opts} ${UBOOT_MAKE_OPTS} ${config}
     if [ -n "${@' '.join(find_cfgs(d))}" ]; then
         merge_config.sh -m -O ${B}/${config} ${B}/${config}/.config ${@" ".join(find_cfgs(d))}
         oe_runmake -C ${S} O=${B}/${config} oldconfig
@@ -42,9 +54,9 @@ uboot_configure_config () {
 
 uboot_configure () {
     if [ -n "${UBOOT_MACHINE}" ]; then
-        oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE}
+        oe_runmake -C ${S} O=${B} ${UBOOT_MAKE_OPTS} ${UBOOT_MACHINE}
     else
-        oe_runmake -C ${S} O=${B} oldconfig
+        oe_runmake -C ${S} O=${B} ${UBOOT_MAKE_OPTS} oldconfig
     fi
     merge_config.sh -m .config ${@" ".join(find_cfgs(d))}
     cml1_do_configure
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index b7242de5de..e0a69e740e 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -75,7 +75,19 @@ uboot_compile_config () {
     config=$2
     type=$3
 
-    oe_runmake -C ${S} O=${B}/${config} ${UBOOT_MAKE_TARGET}
+    unset k
+    IFS="?"
+    uboot_config_make_opts="${UBOOT_CONFIG_MAKE_OPTS}"
+    for config_make_opts in $uboot_config_make_opts; do
+        k=$(expr $k + 1);
+        if [ $k -eq $i ]; then
+            break
+        fi
+    done
+    unset IFS
+    unset k
+
+    oe_runmake -C ${S} O=${B}/${config} ${config_make_opts} ${UBOOT_MAKE_OPTS} ${UBOOT_MAKE_TARGET}
 
     unset k
     for binary in ${UBOOT_BINARIES}; do
@@ -102,7 +114,7 @@ uboot_compile_config_copy_binary () {
 }
 
 uboot_compile () {
-    oe_runmake -C ${S} O=${B} ${UBOOT_MAKE_TARGET}
+    oe_runmake -C ${S} O=${B} ${UBOOT_MAKE_OPTS} ${UBOOT_MAKE_TARGET}
 
     # Generate the uboot-initial-env
     if [ -n "${UBOOT_INITIAL_ENV}" ]; then
-- 
2.17.1


