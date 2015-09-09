Return-Path: <nathan@nathanrossi.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 07B9776E04
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 14:13:36 +0000 (UTC)
Received: by pacfv12 with SMTP id fv12so11816050pac.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 07:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MTLbhqwoYLtIySah0msWojjsbfdKI5eqeXkfhz9L4kg=;
	b=gC1A9/sVoGITyXF6XHl71VpmSowxMj5+gAnsl7mwPq3V+tJ3Nh5fjuq2OtEJvEAB0L
	VnxKWbXeZ1Yl9p/o20d/ZO8pdz60VY6gUZBwADjpLBwFiMdRmNQTPYjynnUU71v0bExi
	/AmVrhwm5dcSUXDIshNnC5piU21vXVBiBQFPDRqRjX+3aF6oRKXK3ewoOVBQz6CbDpOi
	g+p7Ud20plqck3KKYE1XoiK3lDOR+1Qv4hFVuEwxwaFChnT4ujgNFGq003avHB+4QfiR
	0a7xtFZh/fx5oENOPxywJsTtKNu9dk0tvqN+Jo05eduIwLBHpHPQNZ4xBvyvFS2MA1Zm
	lNfg==
X-Gm-Message-State: ALoCoQlbVc3OaZhUpjalKCHE+1PGuyHnyYgiIBAxwLnRn6+WnqCt6rDgy9Xw6nHSXl1zncvu+2HJ
X-Received: by 10.66.193.162 with SMTP id hp2mr36782102pac.108.1441808016435; 
	Wed, 09 Sep 2015 07:13:36 -0700 (PDT)
Received: from nathanbox.home.gateway ([103.26.61.212])
	by smtp.gmail.com with ESMTPSA id
	ev2sm7210189pbb.37.2015.09.09.07.13.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Sep 2015 07:13:35 -0700 (PDT)
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Sep 2015 00:13:19 +1000
Message-Id: <1441807999-21330-1-git-send-email-nathan@nathanrossi.com>
X-Mailer: git-send-email 2.5.1
Subject: [PATCH] u-boot.inc: Add U-Boot ELF install and deploy
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
X-List-Received-Date: Wed, 09 Sep 2015 14:13:39 -0000

Add support for U-Boot recipes to install and deploy the generated ELF
files for each config. The U-Boot ELF's are useful for debugging, and
booting (directly booting, e.g. by JTAG or using QEMU) and complement
the generated binary image.

This additional feature is disabled by default, machines/etc that want
to use it need to set UBOOT_ELF to the corresponding ELF file (generally
u-boot or u-boot.elf depending on the architecture)

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 63 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 62 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 51f5423..81ac471 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -35,6 +35,15 @@ UBOOT_BINARY ?= "u-boot.${UBOOT_SUFFIX}"
 UBOOT_SYMLINK ?= "u-boot-${MACHINE}.${UBOOT_SUFFIX}"
 UBOOT_MAKE_TARGET ?= "all"
 
+# Output the ELF generated. Some platforms can use the ELF file and directly
+# load it (JTAG booting, QEMU) additionally the ELF can be used for debugging
+# purposes.
+UBOOT_ELF ?= ""
+UBOOT_ELF_SUFFIX ?= "elf"
+UBOOT_ELF_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}"
+UBOOT_ELF_BINARY ?= "u-boot.${UBOOT_ELF_SUFFIX}"
+UBOOT_ELF_SYMLINK ?= "u-boot-${MACHINE}.${UBOOT_ELF_SUFFIX}"
+
 # Some versions of u-boot build an SPL (Second Program Loader) image that
 # should be packaged along with the u-boot binary as well as placed in the
 # deploy directory.  For those versions they can set the following variables
@@ -116,6 +125,30 @@ do_install () {
         ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
     fi
 
+    if [ "x${UBOOT_ELF}" != "x" ]
+    then
+        if [ "x${UBOOT_CONFIG}" != "x" ]
+        then
+            for config in ${UBOOT_MACHINE}; do
+                i=`expr $i + 1`;
+                for type in ${UBOOT_CONFIG}; do
+                    j=`expr $j + 1`;
+                    if [ $j -eq $i ]
+                    then
+                        install ${S}/${config}/${UBOOT_ELF} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}
+                        ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${D}/boot/${UBOOT_BINARY}-${type}
+                        ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${D}/boot/${UBOOT_BINARY}
+                    fi
+                done
+                unset j
+            done
+            unset i
+        else
+            install ${S}/${UBOOT_ELF} ${D}/boot/${UBOOT_ELF_IMAGE}
+            ln -sf ${UBOOT_ELF_IMAGE} ${D}/boot/${UBOOT_ELF_BINARY}
+        fi
+    fi
+
     if [ -e ${WORKDIR}/fw_env.config ] ; then
         install -d ${D}${sysconfdir}
         install -m 644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config
@@ -153,6 +186,8 @@ do_install () {
 }
 
 FILES_${PN} = "/boot ${sysconfdir}"
+# Ensure the split debug part of any elf files are put into dbg
+FILES_${PN}-dbg += "/boot/.debug"
 
 do_deploy () {
     if [ "x${UBOOT_CONFIG}" != "x" ]
@@ -183,7 +218,33 @@ do_deploy () {
         ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
         ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
    fi
-    
+
+    if [ "x${UBOOT_ELF}" != "x" ]
+    then
+        if [ "x${UBOOT_CONFIG}" != "x" ]
+        then
+            for config in ${UBOOT_MACHINE}; do
+                i=`expr $i + 1`;
+                for type in ${UBOOT_CONFIG}; do
+                    j=`expr $j + 1`;
+                    if [ $j -eq $i ]
+                    then
+                        install ${S}/${config}/${UBOOT_ELF} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}
+                        ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}-${type}
+                        ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}
+                        ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_SYMLINK}-${type}
+                        ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_SYMLINK}
+                    fi
+                done
+                unset j
+            done
+            unset i
+        else
+            install ${S}/${UBOOT_ELF} ${DEPLOYDIR}/${UBOOT_ELF_IMAGE}
+            ln -sf ${UBOOT_ELF_IMAGE} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}
+            ln -sf ${UBOOT_ELF_IMAGE} ${DEPLOYDIR}/${UBOOT_ELF_SYMLINK}
+        fi
+    fi
 
 
      if [ "x${SPL_BINARY}" != "x" ]
-- 
2.5.1


