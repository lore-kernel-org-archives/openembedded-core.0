Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D120AC3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 16:35:40 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.38048.1723048539120588032
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 09:35:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rR9jPyiv;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 477GZcaF054231
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Aug 2024 11:35:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723048538;
	bh=aC/y7YDolSyCSXN6QrBeA+gIx+4apGhSg+J1Dwu8rdo=;
	h=From:To:Subject:Date;
	b=rR9jPyivbWXWn6bSmQs8Ec7IMGxvWLH0Lvxx1cuoP4TiUpwU2qtJCMzAThARS0z1Q
	 kxgVi/IUMmCfh8PCfn6ntEo5LNpQrzLwzf6JD6XXZdfJ736q8Bi/XaG4PBM/44ChyJ
	 h1Bd+RVRLC9EHn8DrIwGOTzXAKoiP3h1ho2hWVwo=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 477GZcRD124682
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Aug 2024 11:35:38 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Aug 2024 11:35:38 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Aug 2024 11:35:37 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 477GZcga082405
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Aug 2024 11:35:38 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sbjdR-0001wp-TP
	for openembedded-core@lists.openembedded.org; Wed, 07 Aug 2024 11:35:37 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH v2] u-boot.inc: Refactor do_* steps into functions that can be overridden
Date: Wed, 7 Aug 2024 11:35:37 -0500
Message-ID: <20240807163537.7448-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 16:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203091

The looping logic for handling (and not handling) UBOOT_CONFIG has led
to the various do_* functions to be large and unwieldy.  In order to
modify one of the functional blocks inside of a loop (or in the else
condition) means you either have to replace the function entirely, or
append the function and undo something it did and then do what you need
for your change.

This refactor breaks out all of the inner loops and else clauses into
new functions that themselves can be overridden without needing to
worry about the bulk of the looping logic.

It should not break any existing recipes doing prepends, appends, or
overrides.  None of the functional blocks were changed, just refactored
out into new functions.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Shortened shortlog message per Patchtest request, but I would like
this for both master and scarthgap.

 meta/recipes-bsp/u-boot/u-boot-configure.inc |  36 ++-
 meta/recipes-bsp/u-boot/u-boot.inc           | 281 ++++++++++++-------
 2 files changed, 208 insertions(+), 109 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-configure.inc b/meta/recipes-bsp/u-boot/u-boot-configure.inc
index 378d675364..a15511f8b2 100644
--- a/meta/recipes-bsp/u-boot/u-boot-configure.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-configure.inc
@@ -18,23 +18,35 @@ do_configure () {
             for type in ${UBOOT_CONFIG}; do
                 j=$(expr $j + 1);
                 if [ $j -eq $i ]; then
-                    oe_runmake -C ${S} O=${B}/${config} ${config}
-                    if [ -n "${@' '.join(find_cfgs(d))}" ]; then
-                        merge_config.sh -m -O ${B}/${config} ${B}/${config}/.config ${@" ".join(find_cfgs(d))}
-                        oe_runmake -C ${S} O=${B}/${config} oldconfig
-                    fi
+                    uboot_configure_config $config $type
                 fi
             done
             unset j
         done
         unset i
     else
-        if [ -n "${UBOOT_MACHINE}" ]; then
-            oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE}
-        else
-            oe_runmake -C ${S} O=${B} oldconfig
-        fi
-        merge_config.sh -m .config ${@" ".join(find_cfgs(d))}
-        cml1_do_configure
+        uboot_configure
     fi
 }
+
+uboot_configure_config () {
+    config=$1
+    type=$2
+
+    oe_runmake -C ${S} O=${B}/${config} ${config}
+    if [ -n "${@' '.join(find_cfgs(d))}" ]; then
+        merge_config.sh -m -O ${B}/${config} ${B}/${config}/.config ${@" ".join(find_cfgs(d))}
+        oe_runmake -C ${S} O=${B}/${config} oldconfig
+    fi
+}
+
+uboot_configure () {
+    if [ -n "${UBOOT_MACHINE}" ]; then
+        oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE}
+    else
+        oe_runmake -C ${S} O=${B} oldconfig
+    fi
+    merge_config.sh -m .config ${@" ".join(find_cfgs(d))}
+    cml1_do_configure
+}
+
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index f5b43f6e36..3c01720192 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -54,40 +54,21 @@ do_compile () {
 
     if [ -n "${UBOOT_CONFIG}" -o -n "${UBOOT_DELTA_CONFIG}" ]
     then
-        unset i j k
+        unset i j
         for config in ${UBOOT_MACHINE}; do
             i=$(expr $i + 1);
             for type in ${UBOOT_CONFIG}; do
                 j=$(expr $j + 1);
                 if [ $j -eq $i ]
                 then
-                    oe_runmake -C ${S} O=${B}/${config} ${UBOOT_MAKE_TARGET}
-                    for binary in ${UBOOT_BINARIES}; do
-                        k=$(expr $k + 1);
-                        if [ $k -eq $i ]; then
-                            cp ${B}/${config}/${binary} ${B}/${config}/${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX}
-                        fi
-                    done
-
-                    # Generate the uboot-initial-env
-                    if [ -n "${UBOOT_INITIAL_ENV}" ]; then
-                        oe_runmake -C ${S} O=${B}/${config} u-boot-initial-env
-                        cp ${B}/${config}/u-boot-initial-env ${B}/${config}/u-boot-initial-env-${type}
-                    fi
-
-                    unset k
+                    uboot_compile_config $i $config $type
                 fi
             done
             unset j
         done
         unset i
     else
-        oe_runmake -C ${S} O=${B} ${UBOOT_MAKE_TARGET}
-
-        # Generate the uboot-initial-env
-        if [ -n "${UBOOT_INITIAL_ENV}" ]; then
-            oe_runmake -C ${S} O=${B} u-boot-initial-env
-        fi
+        uboot_compile
     fi
 
     if [ -n "${UBOOT_ENV}" ] && [ "${UBOOT_ENV_SUFFIX}" = "scr" ]
@@ -96,6 +77,46 @@ do_compile () {
     fi
 }
 
+uboot_compile_config () {
+    i=$1
+    config=$2
+    type=$3
+
+    oe_runmake -C ${S} O=${B}/${config} ${UBOOT_MAKE_TARGET}
+
+    unset k
+    for binary in ${UBOOT_BINARIES}; do
+        k=$(expr $k + 1);
+        if [ $k -eq $i ]; then
+            uboot_compile_config_copy_binary $config $type $binary
+        fi
+    done
+    unset k
+
+    # Generate the uboot-initial-env
+    if [ -n "${UBOOT_INITIAL_ENV}" ]; then
+        oe_runmake -C ${S} O=${B}/${config} u-boot-initial-env
+        cp ${B}/${config}/u-boot-initial-env ${B}/${config}/u-boot-initial-env-${type}
+    fi
+}
+
+uboot_compile_config_copy_binary () {
+    config=$1
+    type=$2
+    binary=$3
+
+    cp ${B}/${config}/${binary} ${B}/${config}/${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX}
+}
+
+uboot_compile () {
+    oe_runmake -C ${S} O=${B} ${UBOOT_MAKE_TARGET}
+
+    # Generate the uboot-initial-env
+    if [ -n "${UBOOT_INITIAL_ENV}" ]; then
+        oe_runmake -C ${S} O=${B} u-boot-initial-env
+    fi
+}
+
 do_install () {
     if [ -n "${UBOOT_CONFIG}" ]
     then
@@ -105,32 +126,14 @@ do_install () {
                 j=$(expr $j + 1);
                 if [ $j -eq $i ]
                 then
-                    install -D -m 644 ${B}/${config}/${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
-                    ln -sf ${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}-${type}
-                    ln -sf ${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}
-
-                    # Install the uboot-initial-env
-                    if [ -n "${UBOOT_INITIAL_ENV}" ]; then
-                        install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${D}/${sysconfdir}/${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${PV}-${PR}
-                        ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/${UBOOT_INITIAL_ENV}-${MACHINE}-${type}
-                        ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/${UBOOT_INITIAL_ENV}-${type}
-                        ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/${UBOOT_INITIAL_ENV}
-                    fi
+                    uboot_install_config $config $type
                 fi
             done
             unset j
         done
         unset i
     else
-        install -D -m 644 ${B}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
-        ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
-
-        # Install the uboot-initial-env
-        if [ -n "${UBOOT_INITIAL_ENV}" ]; then
-            install -D -m 644 ${B}/u-boot-initial-env ${D}/${sysconfdir}/${UBOOT_INITIAL_ENV}-${MACHINE}-${PV}-${PR}
-            ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${PV}-${PR} ${D}/${sysconfdir}/${UBOOT_INITIAL_ENV}-${MACHINE}
-            ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${PV}-${PR} ${D}/${sysconfdir}/${UBOOT_INITIAL_ENV}
-        fi
+        uboot_install
     fi
 
     if [ -n "${UBOOT_ELF}" ]
@@ -143,17 +146,14 @@ do_install () {
                     j=$(expr $j + 1);
                     if [ $j -eq $i ]
                     then
-                        install -m 644 ${B}/${config}/${UBOOT_ELF} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}
-                        ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${D}/boot/${UBOOT_BINARY}-${type}
-                        ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${D}/boot/${UBOOT_BINARY}
+                        uboot_install_elf_config $config $type
                     fi
                 done
                 unset j
             done
             unset i
         else
-            install -m 644 ${B}/${UBOOT_ELF} ${D}/boot/${UBOOT_ELF_IMAGE}
-            ln -sf ${UBOOT_ELF_IMAGE} ${D}/boot/${UBOOT_ELF_BINARY}
+            uboot_install_elf
         fi
     fi
 
@@ -172,17 +172,14 @@ do_install () {
                     j=$(expr $j + 1);
                     if [ $j -eq $i ]
                     then
-                         install -m 644 ${B}/${config}/${SPL_BINARY} ${D}/boot/${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX}
-                         ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX} ${D}/boot/${SPL_BINARYFILE}-${type}
-                         ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX} ${D}/boot/${SPL_BINARYFILE}
+                        uboot_install_spl_config $config $type
                     fi
                 done
                 unset j
             done
             unset i
         else
-            install -m 644 ${B}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
-            ln -sf ${SPL_IMAGE} ${D}/boot/${SPL_BINARYFILE}
+            uboot_install_spl
         fi
     fi
 
@@ -198,6 +195,63 @@ do_install () {
     fi
 }
 
+uboot_install_config () {
+    config=$1
+    type=$2
+
+    install -D -m 644 ${B}/${config}/${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
+    ln -sf ${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}-${type}
+    ln -sf ${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}
+
+    # Install the uboot-initial-env
+    if [ -n "${UBOOT_INITIAL_ENV}" ]; then
+        install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${D}/${sysconfdir}/${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${PV}-${PR}
+        ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/${UBOOT_INITIAL_ENV}-${MACHINE}-${type}
+        ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/${UBOOT_INITIAL_ENV}-${type}
+        ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/${UBOOT_INITIAL_ENV}
+    fi
+}
+
+uboot_install () {
+    install -D -m 644 ${B}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
+    ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
+
+    # Install the uboot-initial-env
+    if [ -n "${UBOOT_INITIAL_ENV}" ]; then
+        install -D -m 644 ${B}/u-boot-initial-env ${D}/${sysconfdir}/${UBOOT_INITIAL_ENV}-${MACHINE}-${PV}-${PR}
+        ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${PV}-${PR} ${D}/${sysconfdir}/${UBOOT_INITIAL_ENV}-${MACHINE}
+        ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${PV}-${PR} ${D}/${sysconfdir}/${UBOOT_INITIAL_ENV}
+    fi
+}
+
+uboot_install_elf_config () {
+    config=$1
+    type=$2
+
+    install -m 644 ${B}/${config}/${UBOOT_ELF} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}
+    ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${D}/boot/${UBOOT_BINARY}-${type}
+    ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${D}/boot/${UBOOT_BINARY}
+}
+
+uboot_install_elf () {
+    install -m 644 ${B}/${UBOOT_ELF} ${D}/boot/${UBOOT_ELF_IMAGE}
+    ln -sf ${UBOOT_ELF_IMAGE} ${D}/boot/${UBOOT_ELF_BINARY}
+}
+
+uboot_install_spl_config () {
+    config=$1
+    type=$2
+
+    install -m 644 ${B}/${config}/${SPL_BINARY} ${D}/boot/${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX}
+    ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX} ${D}/boot/${SPL_BINARYFILE}-${type}
+    ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX} ${D}/boot/${SPL_BINARYFILE}
+}
+
+uboot_install_spl () {
+    install -m 644 ${B}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
+    ln -sf ${SPL_IMAGE} ${D}/boot/${SPL_BINARYFILE}
+}
+
 PACKAGE_BEFORE_PN += "${PN}-env ${PN}-extlinux"
 
 RPROVIDES:${PN}-env += "u-boot-default-env"
@@ -223,40 +277,14 @@ do_deploy () {
                 j=$(expr $j + 1);
                 if [ $j -eq $i ]
                 then
-                    install -D -m 644 ${B}/${config}/${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
-                    cd ${DEPLOYDIR}
-                    ln -sf ${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}-${type}
-                    ln -sf ${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}
-                    ln -sf ${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_BINARY}-${type}
-                    ln -sf ${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_BINARY}
-
-                    # Deploy the uboot-initial-env
-                    if [ -n "${UBOOT_INITIAL_ENV}" ]; then
-                        install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${DEPLOYDIR}/${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${PV}-${PR}
-                        cd ${DEPLOYDIR}
-                        ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${PV}-${PR} ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}
-                        ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${PV}-${PR} ${UBOOT_INITIAL_ENV}-${type}
-                    fi
+                    uboot_deploy_config $config $type
                 fi
             done
             unset j
         done
         unset i
     else
-        install -D -m 644 ${B}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
-
-        cd ${DEPLOYDIR}
-        rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
-        ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
-        ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
-
-        # Deploy the uboot-initial-env
-        if [ -n "${UBOOT_INITIAL_ENV}" ]; then
-            install -D -m 644 ${B}/u-boot-initial-env ${DEPLOYDIR}/${UBOOT_INITIAL_ENV}-${MACHINE}-${PV}-${PR}
-            cd ${DEPLOYDIR}
-            ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${PV}-${PR} ${UBOOT_INITIAL_ENV}-${MACHINE}
-            ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${PV}-${PR} ${UBOOT_INITIAL_ENV}
-        fi
+        uboot_deploy
     fi
 
     if [ -e ${WORKDIR}/fw_env.config ] ; then
@@ -276,20 +304,14 @@ do_deploy () {
                     j=$(expr $j + 1);
                     if [ $j -eq $i ]
                     then
-                        install -m 644 ${B}/${config}/${UBOOT_ELF} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}
-                        ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}-${type}
-                        ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}
-                        ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_SYMLINK}-${type}
-                        ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_SYMLINK}
+                        uboot_deploy_elf_config $config $type
                     fi
                 done
                 unset j
             done
             unset i
         else
-            install -m 644 ${B}/${UBOOT_ELF} ${DEPLOYDIR}/${UBOOT_ELF_IMAGE}
-            ln -sf ${UBOOT_ELF_IMAGE} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}
-            ln -sf ${UBOOT_ELF_IMAGE} ${DEPLOYDIR}/${UBOOT_ELF_SYMLINK}
+            uboot_deploy_elf
         fi
     fi
 
@@ -304,21 +326,14 @@ do_deploy () {
                     j=$(expr $j + 1);
                     if [ $j -eq $i ]
                     then
-                        install -m 644 ${B}/${config}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX}
-                        rm -f ${DEPLOYDIR}/${SPL_BINARYFILE} ${DEPLOYDIR}/${SPL_SYMLINK}
-                        ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX} ${DEPLOYDIR}/${SPL_BINARYFILE}-${type}
-                        ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX} ${DEPLOYDIR}/${SPL_BINARYFILE}
-                        ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX} ${DEPLOYDIR}/${SPL_SYMLINK}-${type}
-                        ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX} ${DEPLOYDIR}/${SPL_SYMLINK}
+                        uboot_deploy_spl_config $config $type
                     fi
                 done
                 unset j
             done
             unset i
         else
-            install -m 644 ${B}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
-            ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_BINARYNAME}
-            ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}
+            uboot_deploy_spl
         fi
     fi
 
@@ -342,4 +357,76 @@ do_deploy () {
     fi
 }
 
+uboot_deploy_config () {
+    config=$1
+    type=$2
+
+    install -D -m 644 ${B}/${config}/${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
+    cd ${DEPLOYDIR}
+    ln -sf ${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}-${type}
+    ln -sf ${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}
+    ln -sf ${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_BINARY}-${type}
+    ln -sf ${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_BINARY}
+
+    # Deploy the uboot-initial-env
+    if [ -n "${UBOOT_INITIAL_ENV}" ]; then
+        install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${DEPLOYDIR}/${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${PV}-${PR}
+        cd ${DEPLOYDIR}
+        ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${PV}-${PR} ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}
+        ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${PV}-${PR} ${UBOOT_INITIAL_ENV}-${type}
+    fi
+}
+
+uboot_deploy () {
+    install -D -m 644 ${B}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
+
+    cd ${DEPLOYDIR}
+    rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
+    ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
+    ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
+
+    # Deploy the uboot-initial-env
+    if [ -n "${UBOOT_INITIAL_ENV}" ]; then
+        install -D -m 644 ${B}/u-boot-initial-env ${DEPLOYDIR}/${UBOOT_INITIAL_ENV}-${MACHINE}-${PV}-${PR}
+        cd ${DEPLOYDIR}
+        ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${PV}-${PR} ${UBOOT_INITIAL_ENV}-${MACHINE}
+        ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${PV}-${PR} ${UBOOT_INITIAL_ENV}
+    fi
+}
+
+uboot_deploy_elf_config () {
+    config=$1
+    type=$2
+
+    install -m 644 ${B}/${config}/${UBOOT_ELF} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}
+    ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}-${type}
+    ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}
+    ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_SYMLINK}-${type}
+    ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_SYMLINK}
+}
+
+uboot_deploy_elf () {
+    install -m 644 ${B}/${UBOOT_ELF} ${DEPLOYDIR}/${UBOOT_ELF_IMAGE}
+    ln -sf ${UBOOT_ELF_IMAGE} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}
+    ln -sf ${UBOOT_ELF_IMAGE} ${DEPLOYDIR}/${UBOOT_ELF_SYMLINK}
+}
+
+uboot_deploy_spl_config () {
+    config=$1
+    type=$2
+
+    install -m 644 ${B}/${config}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX}
+    rm -f ${DEPLOYDIR}/${SPL_BINARYFILE} ${DEPLOYDIR}/${SPL_SYMLINK}
+    ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX} ${DEPLOYDIR}/${SPL_BINARYFILE}-${type}
+    ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX} ${DEPLOYDIR}/${SPL_BINARYFILE}
+    ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX} ${DEPLOYDIR}/${SPL_SYMLINK}-${type}
+    ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX} ${DEPLOYDIR}/${SPL_SYMLINK}
+}
+
+uboot_deploy_spl () {
+    install -m 644 ${B}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
+    ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_BINARYNAME}
+    ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}
+}
+
 addtask deploy before do_build after do_compile
-- 
2.17.1


