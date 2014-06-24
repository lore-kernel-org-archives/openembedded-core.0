Return-Path: <ashcharles@gmail.com>
Received: from mail-pb0-f50.google.com (mail-pb0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9CC9B65CD4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 20:10:44 +0000 (UTC)
Received: by mail-pb0-f50.google.com with SMTP id rp16so682242pbb.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 13:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=aWFJy+ybdNmjHV+HesWd1hVmWUX8ZblA2G7YfMOETnk=;
	b=kR8NNV0NIDJnlEDu8QolT4OzRPJexwAVwewSeeaagnM49H8sQwi9e+2FwIjuPeciQL
	1lV6a87ShJhr7OXv2kK68+YxFnv/4YeI3Oj/hOvtdctYIrDfM8g6zCik3hls5xhTgvow
	HH5/Xe7/UAllAduyQF43v4WcJA7uGcKVHNulvc/Enju0H35vCfQF/92zbhTFTsYVJKkm
	FGdaj4/iivA03tLTVmJLo6VEv2AegiiaGFCXnF7sT/2sxm7C+yydn4OR9j/AsA1dRjBG
	fV9VzsXyIQUH2pyobm8LVHMKLE2gjuL8vOAkwzqhhUZbuiq8otyuPYCCB3AVIjUpGFzc
	saoQ==
X-Received: by 10.67.4.163 with SMTP id cf3mr4750984pad.92.1403640646124;
	Tue, 24 Jun 2014 13:10:46 -0700 (PDT)
Received: from gumstux.bchsia.telus.net (s206-116-3-18.bc.hsia.telus.net.
	[206.116.3.18])
	by mx.google.com with ESMTPSA id bx5sm1723609pbd.69.2014.06.24.13.10.45
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 24 Jun 2014 13:10:45 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jun 2014 13:10:18 -0700
Message-Id: <1403640618-1384-1-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] u-boot: Optionally deploy an environment or script file
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
X-List-Received-Date: Tue, 24 Jun 2014 20:10:50 -0000

Some boards are configured to read a script or environment file as part
of the u-boot boot sequence.  This file, typically called 'uEnv.txt' or
'boot.scr', would be deployed alongside the u-boot binary.  If a recipe
uses this u-boot.inc, such a file can be deployed by setting the optional
UBOOT_ENV parameter and including the file in the SRC_URI.  For example:

    SRC_URI_append_overo = "file://uEnv.txt"
    UBOOT_ENV_overo = "uEnv"

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index d826a40..53c87c2 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -28,6 +28,17 @@ SPL_BINARY ?= ""
 SPL_IMAGE ?= "${SPL_BINARY}-${MACHINE}-${PV}-${PR}"
 SPL_SYMLINK ?= "${SPL_BINARY}-${MACHINE}"
 
+# Additional environment variables or a script can be installed alongside
+# u-boot to be used automatically on boot.  This file, typically 'uEnv.txt'
+# or 'boot.scr', should be packaged along with u-boot as well as placed in the
+# deploy directory.  Machine configurations needing one of these files should
+# include it in the SRC_URI and set the UBOOT_ENV parameter.
+UBOOT_ENV_SUFFIX ?= "txt"
+UBOOT_ENV ?= ""
+UBOOT_ENV_BINARY ?= "${UBOOT_ENV}.${UBOOT_ENV_SUFFIX}"
+UBOOT_ENV_IMAGE ?= "${UBOOT_ENV}-${MACHINE}-${PV}-${PR}.${UBOOT_ENV_SUFFIX}"
+UBOOT_ENV_SYMLINK ?= "${UBOOT_ENV}-${MACHINE}.${UBOOT_ENV_SUFFIX}"
+
 do_compile () {
 	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', 'ld-is-gold', '', d)}" = "ld-is-gold" ] ; then
 		sed -i 's/$(CROSS_COMPILE)ld$/$(CROSS_COMPILE)ld.bfd/g' config.mk
@@ -62,6 +73,12 @@ do_install () {
         install ${S}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
         ln -sf ${SPL_IMAGE} ${D}/boot/${SPL_BINARY}
     fi
+
+    if [ "x${UBOOT_ENV}" != "x" ]
+    then
+        install ${WORKDIR}/${UBOOT_ENV_BINARY} ${D}/boot/${UBOOT_ENV_IMAGE}
+        ln -sf ${UBOOT_ENV_IMAGE} ${D}/boot/${UBOOT_ENV_BINARY}
+    fi
 }
 
 FILES_${PN} = "/boot ${sysconfdir}"
@@ -82,6 +99,14 @@ do_deploy () {
         ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_BINARY}
         ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}
     fi
+
+    if [ "x${UBOOT_ENV}" != "x" ]
+    then
+        install ${WORKDIR}/${UBOOT_ENV_BINARY} ${DEPLOYDIR}/${UBOOT_ENV_IMAGE}
+        rm -f ${DEPLOYDIR}/${UBOOT_ENV_BINARY} ${DEPLOYDIR}/${UBOOT_ENV_SYMLINK}
+        ln -sf ${UBOOT_ENV_IMAGE} ${DEPLOYDIR}/${UBOOT_ENV_BINARY}
+        ln -sf ${UBOOT_ENV_IMAGE} ${DEPLOYDIR}/${UBOOT_ENV_SYMLINK}
+    fi
 }
 
 addtask deploy before do_build after do_compile
-- 
1.8.3.2


