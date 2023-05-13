Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DF41C77B7D
	for <webhook@archiver.kernel.org>; Sat, 13 May 2023 16:05:20 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.50266.1683993918435888019
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 May 2023 09:05:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=N/ra2fAL;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4ec8149907aso12994802e87.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 May 2023 09:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683993916; x=1686585916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6+QrotBC21rP0AmWNQvkshcUsyZTUcZzeLK/ZlsyRBE=;
        b=N/ra2fALniX2ZXB+w62niFFBHUvZODWevHDSKVY2ngA+Ju3e4IA5dK6GjN0pSypKYo
         MCscnJlFRdL8EctIO3ySQVwEfdaBx2ULZ3Z8otpDZfgyytnvGtDUt13vnXJnQDwY3SmP
         GxprmDk0JpF5fIgYkCvrGw/6h7lw472idak1Dkbfv/YyhH1zhlvN4jWKmG0snOI3Gg01
         7bgtdOZaMMAexf+S1y7YG/W3821kdth2BH3n85QlHKJLEzJyOTpy8iN7nA1XBz+pqHtm
         387UrmVwnOTD9YFXKSLEk05p+uH2Vx12tbkklQIH1ljkg0TcDurpIFhe1sESEv6bykJU
         YPHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683993916; x=1686585916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6+QrotBC21rP0AmWNQvkshcUsyZTUcZzeLK/ZlsyRBE=;
        b=QK6FJENGHUDxjVbm/SmrkcvnOAeGgltFl90r+9C5xcpnBXA7RJwf/frbbNR4N37PFT
         XSAb13vQ06pAPVfTNgvf1NsB4yEZWXfuXG+CBAib61T9z7aV4MmiL3I90/oh1bB+gCf8
         +Xsava8y5i/WOAYwE0kZKHhMtOQWLmblIw7uIcLs9F+SYTypULtOAtRWonWNz0SeIPaz
         jn04LZlfY8FtimFI3RNSYBpb3skGhn0mcjUSWB6NTwi+5MIkhLTlqzneJjCUGAodwLpP
         KC8OdGbCfqGfyAULYFQWhea/8mOfWaEfwvyt2aAI2xOOREX9iX0iYyfilQdCXejboZaZ
         AWew==
X-Gm-Message-State: AC+VfDwf9yjmCjVvLWdnuDe04Gt9TUl6Z3LPE9EpX2Ay6zEXaAyrG1MH
	HPbF2SiPvyD4fbi62c+tdltfiFnUG50=
X-Google-Smtp-Source: ACHHUZ53OeS+v9q9mrBAc0K5QoxTjyFh6xFU13xPh6nR0zGnA8ap11egj+jnXEmSqA1nUrEwiqQE0w==
X-Received: by 2002:ac2:5330:0:b0:4ef:2bf:10e3 with SMTP id f16-20020ac25330000000b004ef02bf10e3mr3520423lfh.62.1683993916019;
        Sat, 13 May 2023 09:05:16 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id q22-20020ac24a76000000b004f2509b87cesm1878758lfp.107.2023.05.13.09.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 09:05:14 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] meta: introduce KCONFIG_CONFIG_ENABLE_MENUCONFIG
Date: Sat, 13 May 2023 18:05:09 +0200
Message-Id: <20230513160509.17634-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 May 2023 16:05:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181196

From: Ming Liu <liu.ming50@gmail.com>

Currently, uboot do_menuconfig task is breaking when UBOOT_CONFIG is
chosen rather than UBOOT_MACHINE, it simply fails with the following
errors:
| make: *** No rule to make target 'menuconfig'. Stio.
| Command failed.
| Press any key to continue...

this is due to the work directory of do_menuconfig is set to ${B} but
not ${B}/$config.

We should distinguish two situations:
1) When there is only one config item in UBOOT_CONFIG, do_menuconfig
   should work just like how it works for UBOOT_MACHINE.
2) When there are multiple config items in UBOOT_CONFIG, do_menuconfig
   should print out some information saying it's not supported other
   than just failing.

This patch mainly aims to fix that by introducing a extra variable
KCONFIG_CONFIG_ENABLE_MENUCONFIG, it would be set to 'false' for
situation 2), and when it's set to 'true', then set
KCONFIG_CONFIG_ROOTDIR correctly in uboot-config.bbclass to let
do_menuconfig task work.

DEVTOOL_DISABLE_MENUCONFIG could be replaced by this new variable
KCONFIG_CONFIG_ENABLE_MENUCONFIG.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes-recipe/cml1.bbclass             | 5 +++++
 meta/classes-recipe/uboot-config.bbclass     | 6 ++++++
 meta/recipes-bsp/u-boot/u-boot-configure.inc | 1 -
 scripts/lib/devtool/standard.py              | 6 +++---
 4 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/cml1.bbclass b/meta/classes-recipe/cml1.bbclass
index a09a042c3f..d87d8204e4 100644
--- a/meta/classes-recipe/cml1.bbclass
+++ b/meta/classes-recipe/cml1.bbclass
@@ -32,10 +32,15 @@ CROSS_CURSES_INC = '-DCURSES_LOC="<curses.h>"'
 TERMINFO = "${STAGING_DATADIR_NATIVE}/terminfo"
 
 KCONFIG_CONFIG_COMMAND ??= "menuconfig"
+KCONFIG_CONFIG_ENABLE_MENUCONFIG ??= "true"
 KCONFIG_CONFIG_ROOTDIR ??= "${B}"
 python do_menuconfig() {
     import shutil
 
+    if not bb.utils.to_boolean(d.getVar("KCONFIG_CONFIG_ENABLE_MENUCONFIG")):
+        bb.fatal("do_menuconfig is disabled, please check KCONFIG_CONFIG_ENABLE_MENUCONFIG variable.")
+        return
+
     config = os.path.join(d.getVar('KCONFIG_CONFIG_ROOTDIR'), ".config")
     configorig = os.path.join(d.getVar('KCONFIG_CONFIG_ROOTDIR'), ".config.orig")
 
diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe/uboot-config.bbclass
index fb7a4bc498..9be1d64d3e 100644
--- a/meta/classes-recipe/uboot-config.bbclass
+++ b/meta/classes-recipe/uboot-config.bbclass
@@ -140,4 +140,10 @@ python () {
 
             if not found:
                 raise bb.parse.SkipRecipe("The selected UBOOT_CONFIG key %s has no match in %s." % (ubootconfig, ubootconfigflags.keys()))
+
+            if len(ubootconfig) == 1:
+                d.setVar('KCONFIG_CONFIG_ROOTDIR', os.path.join(d.getVar("B"), d.getVar("UBOOT_MACHINE").strip()))
+            else:
+                # Disable menuconfig for multiple configs
+                d.setVar('KCONFIG_CONFIG_ENABLE_MENUCONFIG', "false")
 }
diff --git a/meta/recipes-bsp/u-boot/u-boot-configure.inc b/meta/recipes-bsp/u-boot/u-boot-configure.inc
index 04e0894752..235623d25a 100644
--- a/meta/recipes-bsp/u-boot/u-boot-configure.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-configure.inc
@@ -26,7 +26,6 @@ do_configure () {
             unset j
         done
         unset i
-        DEVTOOL_DISABLE_MENUCONFIG=true
     else
         if [ -n "${UBOOT_MACHINE}" ]; then
             oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE}
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 0339d12763..852672810a 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -968,9 +968,9 @@ def modify(args, config, basepath, workspace):
                         '}\n')
             if rd.getVarFlag('do_menuconfig','task'):
                 f.write('\ndo_configure:append() {\n'
-                '    if [ ! ${DEVTOOL_DISABLE_MENUCONFIG} ]; then\n'
-                '        cp ${B}/.config ${S}/.config.baseline\n'
-                '        ln -sfT ${B}/.config ${S}/.config.new\n'
+                '    if [ ${@ oe.types.boolean(\'${KCONFIG_CONFIG_ENABLE_MENUCONFIG}\') } = True ]; then\n'
+                '        cp ${KCONFIG_CONFIG_ROOTDIR}/.config ${S}/.config.baseline\n'
+                '        ln -sfT ${KCONFIG_CONFIG_ROOTDIR}/.config ${S}/.config.new\n'
                 '    fi\n'
                 '}\n')
             if initial_rev:
-- 
2.25.1


