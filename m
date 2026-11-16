Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19082.1794791918950540670
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 17:18:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=HuVRDwqn;
 spf=pass (domain: mailbox.org, ip: 80.241.56.151, mailfrom: marek.vasut@mailbox.org)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4jSVP763RKz8vRd;
	Mon, 16 Nov 2026 02:18:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1794791915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Zx2bJRuQkWV7/SxLi734Oj48jwBxMZsurhO9BRl+VAQ=;
	b=HuVRDwqn7qEn5+BmQhEnwgu7bzTmdDedhziN8N07LGldwE77edMxPfA0P2UK5HeLMQwzWS
	8kK0+3HDXBM2A+Na4PXC8suIOVTfabyjAIiQGMrdHtMXg6x37hh2iHzVU2o8BXHtf5he61
	dCMdE9qweEc60D0nQJnSRKK/l58QrCk1TmGcFCWMgCB6pY4AKkmCwpRpUGEA/ozfYiNhl1
	itEQ7bBq3uE1MMx5o89yTMrDxY3f6NnYIRR+QgJMFo0sMvyWDJGfM3HTYDhL8xxnQ3Ijat
	9BUcigteiXGoJBKrA7CNb41FBD/BIHLDCFqU7aJl+l/zzjiflwWOGF8uJPFsUA==
From: Marek Vasut <marek.vasut@mailbox.org>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] u-boot: Add U-Boot ELF SREC install and deploy
Date: Mon, 16 Nov 2026 02:17:57 +0100
Message-ID: <20261116011833.2775540-1-marek.vasut@mailbox.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-MBO-RS-ID: 14832e4f8b465d6b820
X-MBO-RS-META: cfncz7d8u6p49od9zajiw8qiyz4cgzzc
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 01:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250303
Content-Type: text/plain; charset="utf-8"

Add support for U-Boot recipes to install and deploy the generated ELF
converted into SREC files for each config. The U-Boot ELF converted to
SREC are useful for SCIF loader booting.

This additional feature is disabled by default, machines/etc that want
to use it need to set UBOOT_ELF_SREC to the corresponding ELF SREC file
(generally u-boot-elf.srec).

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Fabio Estevam <festevam@gmail.com>
---
 meta/classes-recipe/uboot-config.bbclass |  8 +++
 meta/recipes-bsp/u-boot/u-boot.inc       | 77 ++++++++++++++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-reci=
pe/uboot-config.bbclass
index 5459430dee5..5a60f835468 100644
--- a/meta/classes-recipe/uboot-config.bbclass
+++ b/meta/classes-recipe/uboot-config.bbclass
@@ -73,6 +73,14 @@ UBOOT_ELF_IMAGE ?=3D "u-boot-${MACHINE}-${UBOOT_VERSIO=
N}.${UBOOT_ELF_SUFFIX}"
 UBOOT_ELF_BINARY ?=3D "u-boot.${UBOOT_ELF_SUFFIX}"
 UBOOT_ELF_SYMLINK ?=3D "u-boot-${MACHINE}.${UBOOT_ELF_SUFFIX}"
=20
+# Output the ELF converted into SREC generated. Some platforms can use t=
he ELF
+# converted into SREC file and directly load it (SCIF loader).
+UBOOT_ELF_SREC ?=3D ""
+UBOOT_ELF_SREC_SUFFIX ?=3D "srec"
+UBOOT_ELF_SREC_IMAGE ?=3D "u-boot-elf-${MACHINE}-${UBOOT_VERSION}.${UBOO=
T_ELF_SREC_SUFFIX}"
+UBOOT_ELF_SREC_BINARY ?=3D "u-boot-elf.${UBOOT_ELF_SREC_SUFFIX}"
+UBOOT_ELF_SREC_SYMLINK ?=3D "u-boot-elf-${MACHINE}.${UBOOT_ELF_SREC_SUFF=
IX}"
+
 # Some versions of u-boot build an SPL (Second Program Loader) image tha=
t
 # should be packaged along with the u-boot binary as well as placed in t=
he
 # deploy directory.  For those versions they can set the following varia=
bles
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot=
/u-boot.inc
index b9f61a185c8..af602b7ab01 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -175,6 +175,27 @@ do_install () {
         fi
     fi
=20
+    if [ -n "${UBOOT_ELF_SREC}" ]
+    then
+        if [ -n "${UBOOT_CONFIG}" ]
+        then
+            for config in ${UBOOT_MACHINE}; do
+                i=3D$(expr $i + 1);
+                for type in ${UBOOT_CONFIG}; do
+                    j=3D$(expr $j + 1);
+                    if [ $j -eq $i ]
+                    then
+                        uboot_install_elf_srec_config $config $type
+                    fi
+                done
+                unset j
+            done
+            unset i
+        else
+            uboot_install_elf_srec
+        fi
+    fi
+
     if [ -e ${UNPACKDIR}/fw_env.config ] ; then
         install -d ${D}${sysconfdir}
         install -m 644 ${UNPACKDIR}/fw_env.config ${D}${sysconfdir}/fw_e=
nv.config
@@ -260,6 +281,22 @@ uboot_install_elf () {
     ln -sf ${UBOOT_ELF_IMAGE} ${D}/boot/${UBOOT_ELF_BINARY}
 }
=20
+uboot_install_elf_srec_config () {
+    config=3D$1
+    type=3D$2
+
+    builddir=3D"${config}-${type}"
+
+    install -m 644 ${B}/${builddir}/${UBOOT_ELF_SREC} ${D}/boot/u-boot-e=
lf-${type}-${UBOOT_VERSION}.${UBOOT_ELF_SREC_SUFFIX}
+    ln -sf u-boot-elf-${type}-${UBOOT_VERSION}.${UBOOT_ELF_SREC_SUFFIX} =
${D}/boot/${UBOOT_BINARY}-${type}
+    ln -sf u-boot-elf-${type}-${UBOOT_VERSION}.${UBOOT_ELF_SREC_SUFFIX} =
${D}/boot/${UBOOT_BINARY}
+}
+
+uboot_install_elf_srec () {
+    install -m 644 ${B}/${UBOOT_ELF_SREC} ${D}/boot/${UBOOT_ELF_SREC_IMA=
GE}
+    ln -sf ${UBOOT_ELF_SREC_IMAGE} ${D}/boot/${UBOOT_ELF_SREC_BINARY}
+}
+
 uboot_install_spl_config () {
     config=3D$1
     type=3D$2
@@ -340,6 +377,27 @@ do_deploy () {
         fi
     fi
=20
+    if [ -n "${UBOOT_ELF_SREC}" ]
+    then
+        if [ -n "${UBOOT_CONFIG}" ]
+        then
+            for config in ${UBOOT_MACHINE}; do
+                i=3D$(expr $i + 1);
+                for type in ${UBOOT_CONFIG}; do
+                    j=3D$(expr $j + 1);
+                    if [ $j -eq $i ]
+                    then
+                        uboot_deploy_elf_srec_config $config $type
+                    fi
+                done
+                unset j
+            done
+            unset i
+        else
+            uboot_deploy_elf_srec
+        fi
+    fi
+
     if [ -n "${SPL_BINARY}" ]
     then
         if [ -n "${UBOOT_CONFIG}" ]
@@ -453,6 +511,25 @@ uboot_deploy_elf () {
     ln -sf ${UBOOT_ELF_IMAGE} ${DEPLOYDIR}/${UBOOT_ELF_SYMLINK}
 }
=20
+uboot_deploy_elf_srec_config () {
+    config=3D$1
+    type=3D$2
+
+    builddir=3D"${config}-${type}"
+
+    install -m 644 ${B}/${builddir}/${UBOOT_ELF_SREC} ${DEPLOYDIR}/u-boo=
t-elf-${type}-${UBOOT_VERSION}.${UBOOT_ELF_SREC_SUFFIX}
+    ln -sf u-boot-elf-${type}-${UBOOT_VERSION}.${UBOOT_ELF_SREC_SUFFIX} =
${DEPLOYDIR}/${UBOOT_ELF_SREC_BINARY}-${type}
+    ln -sf u-boot-elf-${type}-${UBOOT_VERSION}.${UBOOT_ELF_SREC_SUFFIX} =
${DEPLOYDIR}/${UBOOT_ELF_SREC_BINARY}
+    ln -sf u-boot-elf-${type}-${UBOOT_VERSION}.${UBOOT_ELF_SREC_SUFFIX} =
${DEPLOYDIR}/${UBOOT_ELF_SREC_SYMLINK}-${type}
+    ln -sf u-boot-elf-${type}-${UBOOT_VERSION}.${UBOOT_ELF_SREC_SUFFIX} =
${DEPLOYDIR}/${UBOOT_ELF_SREC_SYMLINK}
+}
+
+uboot_deploy_elf_srec () {
+    install -m 644 ${B}/${UBOOT_ELF_SREC} ${DEPLOYDIR}/${UBOOT_ELF_SREC_=
IMAGE}
+    ln -sf ${UBOOT_ELF_SREC_IMAGE} ${DEPLOYDIR}/${UBOOT_ELF_SREC_BINARY}
+    ln -sf ${UBOOT_ELF_SREC_IMAGE} ${DEPLOYDIR}/${UBOOT_ELF_SREC_SYMLINK=
}
+}
+
 uboot_deploy_spl_config () {
     config=3D$1
     type=3D$2
--=20
2.53.0

