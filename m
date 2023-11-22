Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 550D1C61DB1
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 12:45:18 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.18521.1700657115290314365
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 04:45:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cDrTCf6+;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5441ba3e53cso9218861a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 04:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700657114; x=1701261914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GEs5GP4sUVL6h/dzzIfbpFERW0EoyKNfbGoR4IsCx0k=;
        b=cDrTCf6+kmSTgZ0xAx/ljTXqSLOOMofiJhup4QTPKVe48kfDe0krwXaVQDO0lhBfgq
         dF9I63WskSw2iz0ijudKM7HONlA1yNRqUw9sLdOaipiuAqWd0Vw/qu9JiXcm6txB3NWy
         qmC7ysXKm5GtFdfSjv3kvAvFrgbfkAazqXSJwUnaJghVjI8jeo5NxxblsHC5M1laeCVe
         //SHgM28g8l14A5oYt/vtEhDNDRAWPfOj/kOtDhp7GsrUXQCveXSVbTx61hGK3D8iXdI
         vJmTOHq74/OosTOfMf7mtoJI/UjOJKR8an/O9/K4hYs5cZopEVm3yqhOYCIrFDuzmv5S
         GCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700657114; x=1701261914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GEs5GP4sUVL6h/dzzIfbpFERW0EoyKNfbGoR4IsCx0k=;
        b=oORCwScv3SHlCdchLRyBqckmmUp3appU5I+Ec9OIyKqQxp1hpvNp8fAnBKg/+3QdxC
         FgB37ADKtM9ExvJ6rQ/UbF1A7QY2wq4nth1MPzyLCW/ZKe9UoU9gYRo2Q5yffcZpTD7G
         PLB0ssO5eIGysVVPaM6ncNAcrUZkIIfa5/guLsSJnHDmRZr/7SHf5gucAKykE6uN+ANE
         BSduncOfQnKzwyxcGvOfNNBli2NNUpVcRvFNVsDw2slh8YYAfW8kD4oqBRHRx3TTwMNL
         lSmQc4crs6Le9DCCEWjTh78PZTQXC9b6qSJHgNZMdhq3GhwKo5P9uIsT9gItAxbfMMnC
         SHig==
X-Gm-Message-State: AOJu0Yz9hFB6S61ypFklbKAyF2AQslzceEgvkHGktuhXP1HcUlESZru7
	clo2ZTkQq0K0zQEIXrSu/lXI8jTAAZI=
X-Google-Smtp-Source: AGHT+IGlN5NBdOkuKtDHYKB++9iEXs/sk4F+n5zXt5424m+pIi9qj+izKFN/AZXIDGXssUeDprQ2bA==
X-Received: by 2002:aa7:d30e:0:b0:543:6e4f:37b with SMTP id p14-20020aa7d30e000000b005436e4f037bmr1533932edq.36.1700657113605;
        Wed, 22 Nov 2023 04:45:13 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id s16-20020aa7cb10000000b00544f8271b5fsm6010044edt.8.2023.11.22.04.45.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 04:45:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/21] uboot: use ${IMAGE_MACHINE_SUFFIX} instead of -${MACHINE} and use hardlinks
Date: Wed, 22 Nov 2023 13:44:37 +0100
Message-ID: <750bddbb2afb8d1e4d7260189d2db81dc5382f0d.1700600804.git.martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1700600804.git.martin.jansa@gmail.com>
References: <cover.1700600804.git.martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 12:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191084

* rename variables to match the conventions used in kernel and image recipes
* use versioned hardlinks as kernel and image recipes, but don't split
  the do_deploy_links task (can be split later).

[YOCTO #12937]

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/classes-recipe/uboot-config.bbclass |  22 ++-
 meta/classes-recipe/uboot-sign.bbclass   |  68 ++++-----
 meta/recipes-bsp/u-boot/u-boot.inc       | 177 +++++++++++------------
 3 files changed, 129 insertions(+), 138 deletions(-)

diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe/uboot-config.bbclass
index 9be1d64d3e..a3c875e762 100644
--- a/meta/classes-recipe/uboot-config.bbclass
+++ b/meta/classes-recipe/uboot-config.bbclass
@@ -19,6 +19,12 @@ def removesuffix(s, suffix):
         return s[:-len(suffix)]
     return s
 
+inherit kernel-artifact-names
+
+UBOOT_VERSION_SUFFIX ?= "${IMAGE_VERSION_SUFFIX}"
+UBOOT_ARTIFACT_NAME ?= "${IMAGE_MACHINE_SUFFIX}"
+UBOOT_ARTIFACT_LINK_NAME ?= "${UBOOT_ARTIFACT_NAME}${UBOOT_VERSION_SUFFIX}"
+
 UBOOT_ENTRYPOINT ?= "20008000"
 UBOOT_LOADADDRESS ?= "${UBOOT_ENTRYPOINT}"
 
@@ -27,8 +33,8 @@ UBOOT_LOADADDRESS ?= "${UBOOT_ENTRYPOINT}"
 UBOOT_SUFFIX ??= "bin"
 UBOOT_BINARY ?= "u-boot.${UBOOT_SUFFIX}"
 UBOOT_BINARYNAME ?= "${@os.path.splitext(d.getVar("UBOOT_BINARY"))[0]}"
-UBOOT_IMAGE ?= "${UBOOT_BINARYNAME}-${MACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
-UBOOT_SYMLINK ?= "${UBOOT_BINARYNAME}-${MACHINE}.${UBOOT_SUFFIX}"
+UBOOT_IMAGE ?= "${UBOOT_BINARYNAME}${UBOOT_ARTIFACT_NAME}.${UBOOT_SUFFIX}"
+UBOOT_LINK ?= "${UBOOT_BINARYNAME}${UBOOT_ARTIFACT_LINK_NAME}.${UBOOT_SUFFIX}"
 UBOOT_MAKE_TARGET ?= "all"
 
 # Output the ELF generated. Some platforms can use the ELF file and directly
@@ -38,7 +44,7 @@ UBOOT_ELF ?= ""
 UBOOT_ELF_SUFFIX ?= "elf"
 UBOOT_ELF_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}"
 UBOOT_ELF_BINARY ?= "u-boot.${UBOOT_ELF_SUFFIX}"
-UBOOT_ELF_SYMLINK ?= "u-boot-${MACHINE}.${UBOOT_ELF_SUFFIX}"
+UBOOT_ELF_LINK ?= "u-boot${UBOOT_ARTIFACT_LINK_NAME}.${UBOOT_ELF_SUFFIX}"
 
 # Some versions of u-boot build an SPL (Second Program Loader) image that
 # should be packaged along with the u-boot binary as well as placed in the
@@ -49,8 +55,8 @@ SPL_BINARY ?= ""
 SPL_DELIMITER  ?= "${@'.' if d.getVar("SPL_SUFFIX") else ''}"
 SPL_BINARYFILE ?= "${@os.path.basename(d.getVar("SPL_BINARY"))}"
 SPL_BINARYNAME ?= "${@removesuffix(d.getVar("SPL_BINARYFILE"), "." + d.getVar("SPL_SUFFIX"))}"
-SPL_IMAGE ?= "${SPL_BINARYNAME}-${MACHINE}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX}"
-SPL_SYMLINK ?= "${SPL_BINARYNAME}-${MACHINE}${SPL_DELIMITER}${SPL_SUFFIX}"
+SPL_IMAGE ?= "${SPL_BINARYNAME}${UBOOT_ARTIFACT_NAME}${SPL_DELIMITER}${SPL_SUFFIX}"
+SPL_LINK ?= "${SPL_BINARYNAME}${UBOOT_ARTIFACT_LINK_NAME}${SPL_DELIMITER}${SPL_SUFFIX}"
 
 # Additional environment variables or a script can be installed alongside
 # u-boot to be used automatically on boot.  This file, typically 'uEnv.txt'
@@ -62,8 +68,8 @@ UBOOT_ENV ?= ""
 UBOOT_ENV_SRC_SUFFIX ?= "cmd"
 UBOOT_ENV_SRC ?= "${UBOOT_ENV}.${UBOOT_ENV_SRC_SUFFIX}"
 UBOOT_ENV_BINARY ?= "${UBOOT_ENV}.${UBOOT_ENV_SUFFIX}"
-UBOOT_ENV_IMAGE ?= "${UBOOT_ENV}-${MACHINE}-${PV}-${PR}.${UBOOT_ENV_SUFFIX}"
-UBOOT_ENV_SYMLINK ?= "${UBOOT_ENV}-${MACHINE}.${UBOOT_ENV_SUFFIX}"
+UBOOT_ENV_IMAGE ?= "${UBOOT_ENV}${UBOOT_ARTIFACT_NAME}.${UBOOT_ENV_SUFFIX}"
+UBOOT_ENV_LINK ?= "${UBOOT_ENV}${UBOOT_ARTIFACT_LINK_NAME}.${UBOOT_ENV_SUFFIX}"
 
 # Default name of u-boot initial env, but enable individual recipes to change
 # this value.
@@ -73,7 +79,7 @@ UBOOT_INITIAL_ENV ?= "${PN}-initial-env"
 # to find EXTLINUX conf file.
 UBOOT_EXTLINUX_INSTALL_DIR ?= "/boot/extlinux"
 UBOOT_EXTLINUX_CONF_NAME ?= "extlinux.conf"
-UBOOT_EXTLINUX_SYMLINK ?= "${UBOOT_EXTLINUX_CONF_NAME}-${MACHINE}-${PR}"
+UBOOT_EXTLINUX_CONF_LINK ?= "${UBOOT_EXTLINUX_CONF_NAME}${UBOOT_ARTIFACT_LINK_NAME}"
 
 # Options for the device tree compiler passed to mkimage '-D' feature:
 UBOOT_MKIMAGE_DTCOPTS ??= ""
diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index ad04c82378..e89c8214d3 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -34,27 +34,27 @@ UBOOT_FITIMAGE_ENABLE ?= "0"
 SPL_SIGN_ENABLE ?= "0"
 
 # Default value for deployment filenames.
-UBOOT_DTB_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.dtb"
+UBOOT_DTB_IMAGE ?= "u-boot${UBOOT_ARTIFACT_NAME}.dtb"
 UBOOT_DTB_BINARY ?= "u-boot.dtb"
 UBOOT_DTB_SIGNED ?= "${UBOOT_DTB_BINARY}-signed"
-UBOOT_DTB_SYMLINK ?= "u-boot-${MACHINE}.dtb"
-UBOOT_NODTB_IMAGE ?= "u-boot-nodtb-${MACHINE}-${PV}-${PR}.bin"
+UBOOT_DTB_LINK ?= "u-boot${UBOOT_ARTIFACT_LINK_NAME}.dtb"
+UBOOT_NODTB_IMAGE ?= "u-boot-nodtb${UBOOT_ARTIFACT_NAME}.bin"
 UBOOT_NODTB_BINARY ?= "u-boot-nodtb.bin"
-UBOOT_NODTB_SYMLINK ?= "u-boot-nodtb-${MACHINE}.bin"
-UBOOT_ITS_IMAGE ?= "u-boot-its-${MACHINE}-${PV}-${PR}"
+UBOOT_NODTB_LINK ?= "u-boot-nodtb${UBOOT_ARTIFACT_LINK_NAME}.bin"
+UBOOT_ITS_IMAGE ?= "u-boot-its${UBOOT_ARTIFACT_NAME}"
 UBOOT_ITS ?= "u-boot.its"
-UBOOT_ITS_SYMLINK ?= "u-boot-its-${MACHINE}"
-UBOOT_FITIMAGE_IMAGE ?= "u-boot-fitImage-${MACHINE}-${PV}-${PR}"
+UBOOT_ITS_LINK ?= "u-boot-its${UBOOT_ARTIFACT_LINK_NAME}"
+UBOOT_FITIMAGE_IMAGE ?= "u-boot-fitImage${UBOOT_ARTIFACT_NAME}"
 UBOOT_FITIMAGE_BINARY ?= "u-boot-fitImage"
-UBOOT_FITIMAGE_SYMLINK ?= "u-boot-fitImage-${MACHINE}"
+UBOOT_FITIMAGE_LINK ?= "u-boot-fitImage${UBOOT_ARTIFACT_LINK_NAME}"
 SPL_DIR ?= "spl"
-SPL_DTB_IMAGE ?= "u-boot-spl-${MACHINE}-${PV}-${PR}.dtb"
+SPL_DTB_IMAGE ?= "u-boot-spl${UBOOT_ARTIFACT_NAME}.dtb"
 SPL_DTB_BINARY ?= "u-boot-spl.dtb"
 SPL_DTB_SIGNED ?= "${SPL_DTB_BINARY}-signed"
-SPL_DTB_SYMLINK ?= "u-boot-spl-${MACHINE}.dtb"
-SPL_NODTB_IMAGE ?= "u-boot-spl-nodtb-${MACHINE}-${PV}-${PR}.bin"
+SPL_DTB_LINK ?= "u-boot-spl${UBOOT_ARTIFACT_LINK_NAME}.dtb"
+SPL_NODTB_IMAGE ?= "u-boot-spl-nodtb${UBOOT_ARTIFACT_NAME}.bin"
 SPL_NODTB_BINARY ?= "u-boot-spl-nodtb.bin"
-SPL_NODTB_SYMLINK ?= "u-boot-spl-nodtb-${MACHINE}.bin"
+SPL_NODTB_LINK ?= "u-boot-spl-nodtb${UBOOT_ARTIFACT_LINK_NAME}.bin"
 
 # U-Boot fitImage description
 UBOOT_FIT_DESC ?= "U-Boot fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}"
@@ -148,14 +148,14 @@ deploy_dtb() {
 	if [ -e "${UBOOT_DTB_SIGNED}" ]; then
 		install -Dm644 ${UBOOT_DTB_SIGNED} ${DEPLOYDIR}/${uboot_dtb_binary}
 		if [ -n "${type}" ]; then
-			ln -sf ${uboot_dtb_binary} ${DEPLOYDIR}/${UBOOT_DTB_IMAGE}
+			ln -vf ${DEPLOYDIR}/${uboot_dtb_binary} ${DEPLOYDIR}/${UBOOT_DTB_IMAGE}
 		fi
 	fi
 
 	if [ -f "${UBOOT_NODTB_BINARY}" ]; then
 		install -Dm644 ${UBOOT_NODTB_BINARY} ${DEPLOYDIR}/${uboot_nodtb_binary}
 		if [ -n "${type}" ]; then
-			ln -sf ${uboot_nodtb_binary} ${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}
+			ln -vf ${DEPLOYDIR}/${uboot_nodtb_binary} ${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}
 		fi
 	fi
 }
@@ -182,14 +182,14 @@ deploy_spl_dtb() {
 	if [ -e "${SPL_DIR}/${SPL_DTB_SIGNED}" ] ; then
 		install -Dm644 ${SPL_DIR}/${SPL_DTB_SIGNED} ${DEPLOYDIR}/${spl_dtb_binary}
 		if [ -n "${type}" ]; then
-			ln -sf ${spl_dtb_binary} ${DEPLOYDIR}/${SPL_DTB_IMAGE}
+			ln -vf ${DEPLOYDIR}/${spl_dtb_binary} ${DEPLOYDIR}/${SPL_DTB_IMAGE}
 		fi
 	fi
 
 	if [ -f "${SPL_DIR}/${SPL_NODTB_BINARY}" ] ; then
 		install -Dm644 ${SPL_DIR}/${SPL_NODTB_BINARY} ${DEPLOYDIR}/${spl_nodtb_binary}
 		if [ -n "${type}" ]; then
-			ln -sf ${spl_nodtb_binary} ${DEPLOYDIR}/${SPL_NODTB_IMAGE}
+			ln -vf ${DEPLOYDIR}/${spl_nodtb_binary} ${DEPLOYDIR}/${SPL_NODTB_IMAGE}
 		fi
 	fi
 
@@ -378,8 +378,8 @@ deploy_helper() {
 
 	if [ "${UBOOT_FITIMAGE_ENABLE}" = "1" -a -n "${SPL_DTB_BINARY}" ]; then
 		if [ -n "${type}" ]; then
-			uboot_its_image="u-boot-its-${type}-${PV}-${PR}"
-			uboot_fitimage_image="u-boot-fitImage-${type}-${PV}-${PR}"
+			uboot_its_image="u-boot-its-${type}${UBOOT_ARTIFACT_NAME}"
+			uboot_fitimage_image="u-boot-fitImage-${type}${UBOOT_ARTIFACT_NAME}"
 		else
 			uboot_its_image="${UBOOT_ITS_IMAGE}"
 			uboot_fitimage_image="${UBOOT_FITIMAGE_IMAGE}"
@@ -389,8 +389,8 @@ deploy_helper() {
 		install -Dm644 ${UBOOT_ITS} ${DEPLOYDIR}/$uboot_its_image
 
 		if [ -n "${type}" ]; then
-			ln -sf $uboot_its_image ${DEPLOYDIR}/${UBOOT_ITS_IMAGE}
-			ln -sf $uboot_fitimage_image ${DEPLOYDIR}/${UBOOT_FITIMAGE_IMAGE}
+			ln -vf ${DEPLOYDIR}/$uboot_its_image ${DEPLOYDIR}/${UBOOT_ITS_IMAGE}
+			ln -vf ${DEPLOYDIR}/$uboot_fitimage_image ${DEPLOYDIR}/${UBOOT_FITIMAGE_IMAGE}
 		fi
 	fi
 
@@ -420,24 +420,24 @@ do_deploy:prepend() {
 	fi
 
 	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a -n "${UBOOT_DTB_BINARY}" ] ; then
-		ln -sf ${UBOOT_DTB_IMAGE} ${DEPLOYDIR}/${UBOOT_DTB_BINARY}
-		ln -sf ${UBOOT_DTB_IMAGE} ${DEPLOYDIR}/${UBOOT_DTB_SYMLINK}
-		ln -sf ${UBOOT_NODTB_IMAGE} ${DEPLOYDIR}/${UBOOT_NODTB_SYMLINK}
-		ln -sf ${UBOOT_NODTB_IMAGE} ${DEPLOYDIR}/${UBOOT_NODTB_BINARY}
+		ln -vf ${DEPLOYDIR}/${UBOOT_DTB_IMAGE} ${DEPLOYDIR}/${UBOOT_DTB_BINARY}
+		ln -vf ${DEPLOYDIR}/${UBOOT_DTB_IMAGE} ${DEPLOYDIR}/${UBOOT_DTB_LINK}
+		ln -vf ${DEPLOYDIR}/${UBOOT_NODTB_IMAGE} ${DEPLOYDIR}/${UBOOT_NODTB_LINK}
+		ln -vf ${DEPLOYDIR}/${UBOOT_NODTB_IMAGE} ${DEPLOYDIR}/${UBOOT_NODTB_BINARY}
 	fi
 
 	if [ "${UBOOT_FITIMAGE_ENABLE}" = "1" ] ; then
-		ln -sf ${UBOOT_ITS_IMAGE} ${DEPLOYDIR}/${UBOOT_ITS}
-		ln -sf ${UBOOT_ITS_IMAGE} ${DEPLOYDIR}/${UBOOT_ITS_SYMLINK}
-		ln -sf ${UBOOT_FITIMAGE_IMAGE} ${DEPLOYDIR}/${UBOOT_FITIMAGE_BINARY}
-		ln -sf ${UBOOT_FITIMAGE_IMAGE} ${DEPLOYDIR}/${UBOOT_FITIMAGE_SYMLINK}
+		ln -vf ${DEPLOYDIR}/${UBOOT_ITS_IMAGE} ${DEPLOYDIR}/${UBOOT_ITS}
+		ln -vf ${DEPLOYDIR}/${UBOOT_ITS_IMAGE} ${DEPLOYDIR}/${UBOOT_ITS_LINK}
+		ln -vf ${DEPLOYDIR}/${UBOOT_FITIMAGE_IMAGE} ${DEPLOYDIR}/${UBOOT_FITIMAGE_BINARY}
+		ln -vf ${DEPLOYDIR}/${UBOOT_FITIMAGE_IMAGE} ${DEPLOYDIR}/${UBOOT_FITIMAGE_LINK}
 	fi
 
 	if [ "${SPL_SIGN_ENABLE}" = "1" -a -n "${SPL_DTB_BINARY}" ] ; then
-		ln -sf ${SPL_DTB_IMAGE} ${DEPLOYDIR}/${SPL_DTB_SYMLINK}
-		ln -sf ${SPL_DTB_IMAGE} ${DEPLOYDIR}/${SPL_DTB_BINARY}
-		ln -sf ${SPL_NODTB_IMAGE} ${DEPLOYDIR}/${SPL_NODTB_SYMLINK}
-		ln -sf ${SPL_NODTB_IMAGE} ${DEPLOYDIR}/${SPL_NODTB_BINARY}
+		ln -vf ${DEPLOYDIR}/${SPL_DTB_IMAGE} ${DEPLOYDIR}/${SPL_DTB_LINK}
+		ln -vf ${DEPLOYDIR}/${SPL_DTB_IMAGE} ${DEPLOYDIR}/${SPL_DTB_BINARY}
+		ln -vf ${DEPLOYDIR}/${SPL_NODTB_IMAGE} ${DEPLOYDIR}/${SPL_NODTB_LINK}
+		ln -vf ${DEPLOYDIR}/${SPL_NODTB_IMAGE} ${DEPLOYDIR}/${SPL_NODTB_BINARY}
 	fi
 }
 
@@ -445,7 +445,7 @@ do_deploy:append() {
 	# If we're creating a u-boot fitImage, point u-boot.bin
 	# symlink since it might get used by image recipes
 	if [ "${UBOOT_FITIMAGE_ENABLE}" = "1" ] ; then
-		ln -sf ${UBOOT_FITIMAGE_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
-		ln -sf ${UBOOT_FITIMAGE_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
+		ln -vf ${DEPLOYDIR}/${UBOOT_FITIMAGE_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
+		ln -vf ${DEPLOYDIR}/${UBOOT_FITIMAGE_IMAGE} ${DEPLOYDIR}/${UBOOT_LINK}
 	fi
 }
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index b3482dcef3..4ea0ed3cf4 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -42,21 +42,18 @@ do_compile () {
     unset CFLAGS
     unset CPPFLAGS
 
-    if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
-    then
+    if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]; then
         echo ${UBOOT_LOCALVERSION} > ${B}/.scmversion
         echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
     fi
 
-    if [ -n "${UBOOT_CONFIG}" -o -n "${UBOOT_DELTA_CONFIG}" ]
-    then
+    if [ -n "${UBOOT_CONFIG}" -o -n "${UBOOT_DELTA_CONFIG}" ]; then
         unset i j k
         for config in ${UBOOT_MACHINE}; do
             i=$(expr $i + 1);
             for type in ${UBOOT_CONFIG}; do
                 j=$(expr $j + 1);
-                if [ $j -eq $i ]
-                then
+                if [ $j -eq $i ]; then
                     oe_runmake -C ${S} O=${B}/${config} ${UBOOT_MAKE_TARGET}
                     for binary in ${UBOOT_BINARIES}; do
                         k=$(expr $k + 1);
@@ -86,21 +83,18 @@ do_compile () {
         fi
     fi
 
-    if [ -n "${UBOOT_ENV}" ] && [ "${UBOOT_ENV_SUFFIX}" = "scr" ]
-    then
+    if [ -n "${UBOOT_ENV}" ] && [ "${UBOOT_ENV_SUFFIX}" = "scr" ]; then
         ${UBOOT_MKIMAGE} -C none -A ${UBOOT_ARCH} -T script -d ${WORKDIR}/${UBOOT_ENV_SRC} ${WORKDIR}/${UBOOT_ENV_BINARY}
     fi
 }
 
 do_install () {
-    if [ -n "${UBOOT_CONFIG}" ]
-    then
+    if [ -n "${UBOOT_CONFIG}" ]; then
         for config in ${UBOOT_MACHINE}; do
             i=$(expr $i + 1);
             for type in ${UBOOT_CONFIG}; do
                 j=$(expr $j + 1);
-                if [ $j -eq $i ]
-                then
+                if [ $j -eq $i ]; then
                     install -D -m 644 ${B}/${config}/${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
                     ln -sf ${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}-${type}
                     ln -sf ${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}
@@ -129,16 +123,13 @@ do_install () {
         fi
     fi
 
-    if [ -n "${UBOOT_ELF}" ]
-    then
-        if [ -n "${UBOOT_CONFIG}" ]
-        then
+    if [ -n "${UBOOT_ELF}" ]; then
+        if [ -n "${UBOOT_CONFIG}" ]; then
             for config in ${UBOOT_MACHINE}; do
                 i=$(expr $i + 1);
                 for type in ${UBOOT_CONFIG}; do
                     j=$(expr $j + 1);
-                    if [ $j -eq $i ]
-                    then
+                    if [ $j -eq $i ]; then
                         install -m 644 ${B}/${config}/${UBOOT_ELF} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}
                         ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${D}/boot/${UBOOT_BINARY}-${type}
                         ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${D}/boot/${UBOOT_BINARY}
@@ -153,21 +144,18 @@ do_install () {
         fi
     fi
 
-    if [ -e ${WORKDIR}/fw_env.config ] ; then
+    if [ -e ${WORKDIR}/fw_env.config ]; then
         install -d ${D}${sysconfdir}
         install -m 644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config
     fi
 
-    if [ -n "${SPL_BINARY}" ]
-    then
-        if [ -n "${UBOOT_CONFIG}" ]
-        then
+    if [ -n "${SPL_BINARY}" ]; then
+        if [ -n "${UBOOT_CONFIG}" ]; then
             for config in ${UBOOT_MACHINE}; do
                 i=$(expr $i + 1);
                 for type in ${UBOOT_CONFIG}; do
                     j=$(expr $j + 1);
-                    if [ $j -eq $i ]
-                    then
+                    if [ $j -eq $i ]; then
                          install -m 644 ${B}/${config}/${SPL_BINARY} ${D}/boot/${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX}
                          ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX} ${D}/boot/${SPL_BINARYFILE}-${type}
                          ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX} ${D}/boot/${SPL_BINARYFILE}
@@ -182,14 +170,12 @@ do_install () {
         fi
     fi
 
-    if [ -n "${UBOOT_ENV}" ]
-    then
+    if [ -n "${UBOOT_ENV}" ]; then
         install -m 644 ${WORKDIR}/${UBOOT_ENV_BINARY} ${D}/boot/${UBOOT_ENV_IMAGE}
         ln -sf ${UBOOT_ENV_IMAGE} ${D}/boot/${UBOOT_ENV_BINARY}
     fi
 
-    if [ "${UBOOT_EXTLINUX}" = "1" ]
-    then
+    if [ "${UBOOT_EXTLINUX}" = "1" ]; then
         install -Dm 0644 ${UBOOT_EXTLINUX_CONFIG} ${D}/${UBOOT_EXTLINUX_INSTALL_DIR}/${UBOOT_EXTLINUX_CONF_NAME}
     fi
 }
@@ -211,27 +197,26 @@ FILES:${PN} = "/boot ${datadir}"
 RDEPENDS:${PN} += "${PN}-env"
 
 do_deploy () {
-    if [ -n "${UBOOT_CONFIG}" ]
-    then
+    if [ -n "${UBOOT_CONFIG}" ]; then
         for config in ${UBOOT_MACHINE}; do
             i=$(expr $i + 1);
             for type in ${UBOOT_CONFIG}; do
                 j=$(expr $j + 1);
-                if [ $j -eq $i ]
-                then
-                    install -D -m 644 ${B}/${config}/${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
-                    cd ${DEPLOYDIR}
-                    ln -sf ${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}-${type}
-                    ln -sf ${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}
-                    ln -sf ${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_BINARY}-${type}
-                    ln -sf ${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_BINARY}
+                if [ $j -eq $i ]; then
+                    install -D -m 644 ${B}/${config}/${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/${UBOOT_BINARYNAME}-${type}${UBOOT_ARTIFACT_NAME}.${UBOOT_SUFFIX}
+                    ln -vf ${DEPLOYDIR}/${UBOOT_BINARYNAME}-${type}${UBOOT_ARTIFACT_NAME}.${UBOOT_SUFFIX} ${DEPLOYDIR}/${UBOOT_BINARY}-${type}
+                    ln -vf ${DEPLOYDIR}/${UBOOT_BINARYNAME}-${type}${UBOOT_ARTIFACT_NAME}.${UBOOT_SUFFIX} ${DEPLOYDIR}/${UBOOT_BINARY}
+                    if [ -n "${UBOOT_LINK}" -a "${UBOOT_ARTIFACT_NAME}" != "${UBOOT_ARTIFACT_LINK_NAME}" ]; then
+                        ln -vf ${DEPLOYDIR}/${UBOOT_BINARYNAME}-${type}${UBOOT_ARTIFACT_NAME}.${UBOOT_SUFFIX} ${DEPLOYDIR}/${UBOOT_LINK}-${type}
+                        ln -vf ${DEPLOYDIR}/${UBOOT_BINARYNAME}-${type}${UBOOT_ARTIFACT_NAME}.${UBOOT_SUFFIX} ${DEPLOYDIR}/${UBOOT_LINK}
+                    fi
 
                     # Deploy the uboot-initial-env
                     if [ -n "${UBOOT_INITIAL_ENV}" ]; then
-                        install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${DEPLOYDIR}/${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${PV}-${PR}
-                        cd ${DEPLOYDIR}
-                        ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${PV}-${PR} ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}
-                        ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${PV}-${PR} ${UBOOT_INITIAL_ENV}-${type}
+                        install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${DEPLOYDIR}/${UBOOT_INITIAL_ENV}-${type}${UBOOT_ARTIFACT_NAME}
+                        if [ "${UBOOT_ARTIFACT_NAME}" != "${UBOOT_ARTIFACT_LINK_NAME}" ]; then
+                            ln -vf ${DEPLOYDIR}/${UBOOT_INITIAL_ENV}-${type}${UBOOT_ARTIFACT_NAME} ${DEPLOYDIR}/${UBOOT_INITIAL_ENV}-${type}${UBOOT_ARTIFACT_LINK_NAME}
+                        fi
                     fi
                 fi
             done
@@ -240,43 +225,42 @@ do_deploy () {
         unset i
     else
         install -D -m 644 ${B}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
+        ln -vf ${DEPLOYDIR}/${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
 
-        cd ${DEPLOYDIR}
-        rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
-        ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
-        ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
+        if [ -n "${UBOOT_LINK}" -a "${UBOOT_ARTIFACT_NAME}" != "${UBOOT_ARTIFACT_LINK_NAME}" ]; then
+            ln -vf ${DEPLOYDIR}/${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_LINK}
+        fi
 
         # Deploy the uboot-initial-env
         if [ -n "${UBOOT_INITIAL_ENV}" ]; then
-            install -D -m 644 ${B}/u-boot-initial-env ${DEPLOYDIR}/${UBOOT_INITIAL_ENV}-${MACHINE}-${PV}-${PR}
-            cd ${DEPLOYDIR}
-            ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${PV}-${PR} ${UBOOT_INITIAL_ENV}-${MACHINE}
-            ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${PV}-${PR} ${UBOOT_INITIAL_ENV}
+            install -D -m 644 ${B}/u-boot-initial-env ${DEPLOYDIR}/${UBOOT_INITIAL_ENV}${UBOOT_ARTIFACT_NAME}
+            if [ "${UBOOT_ARTIFACT_NAME}" != "${UBOOT_ARTIFACT_LINK_NAME}" ]; then
+                ln -vf ${DEPLOYDIR}/${UBOOT_INITIAL_ENV}${UBOOT_ARTIFACT_NAME} ${DEPLOYDIR}/${UBOOT_INITIAL_ENV}${UBOOT_ARTIFACT_LINK_NAME}
+            fi
         fi
     fi
 
-    if [ -e ${WORKDIR}/fw_env.config ] ; then
-        install -D -m 644 ${WORKDIR}/fw_env.config ${DEPLOYDIR}/fw_env.config-${MACHINE}-${PV}-${PR}
-        cd ${DEPLOYDIR}
-        ln -sf fw_env.config-${MACHINE}-${PV}-${PR} fw_env.config-${MACHINE}
-        ln -sf fw_env.config-${MACHINE}-${PV}-${PR} fw_env.config
+    if [ -e ${WORKDIR}/fw_env.config ]; then
+        install -D -m 644 ${WORKDIR}/fw_env.config ${DEPLOYDIR}/fw_env.config${UBOOT_ARTIFACT_NAME}
+        if [ "${UBOOT_ARTIFACT_NAME}" != "${UBOOT_ARTIFACT_LINK_NAME}" ]; then
+            ln -vf ${DEPLOYDIR}/fw_env.config${UBOOT_ARTIFACT_NAME} ${DEPLOYDIR}/fw_env.config${UBOOT_ARTIFACT_LINK_NAME}
+        fi
     fi
 
-    if [ -n "${UBOOT_ELF}" ]
-    then
-        if [ -n "${UBOOT_CONFIG}" ]
-        then
+    if [ -n "${UBOOT_ELF}" ]; then
+        if [ -n "${UBOOT_CONFIG}" ]; then
             for config in ${UBOOT_MACHINE}; do
                 i=$(expr $i + 1);
                 for type in ${UBOOT_CONFIG}; do
                     j=$(expr $j + 1);
-                    if [ $j -eq $i ]
-                    then
-                        install -m 644 ${B}/${config}/${UBOOT_ELF} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}
-                        ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}-${type}
-                        ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}
-                        ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_SYMLINK}-${type}
-                        ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_SYMLINK}
+                    if [ $j -eq $i ]; then
+                        install -m 644 ${B}/${config}/${UBOOT_ELF} ${DEPLOYDIR}/u-boot-${type}${UBOOT_ARTIFACT_NAME}.${UBOOT_ELF_SUFFIX}
+                        ln -vf ${DEPLOYDIR}/u-boot-${type}${UBOOT_ARTIFACT_NAME}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}-${type}
+                        ln -vf ${DEPLOYDIR}/u-boot-${type}${UBOOT_ARTIFACT_NAME}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}
+                        if [ -n "${UBOOT_ELF_LINK}" -a "${UBOOT_ARTIFACT_NAME}" != "${UBOOT_ARTIFACT_LINK_NAME}" ]; then
+                            ln -vf ${DEPLOYDIR}/u-boot-${type}${UBOOT_ARTIFACT_NAME}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_LINK}-${type}
+                            ln -vf ${DEPLOYDIR}/u-boot-${type}${UBOOT_ARTIFACT_NAME}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_LINK}
+                        fi
                     fi
                 done
                 unset j
@@ -284,28 +268,27 @@ do_deploy () {
             unset i
         else
             install -m 644 ${B}/${UBOOT_ELF} ${DEPLOYDIR}/${UBOOT_ELF_IMAGE}
-            ln -sf ${UBOOT_ELF_IMAGE} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}
-            ln -sf ${UBOOT_ELF_IMAGE} ${DEPLOYDIR}/${UBOOT_ELF_SYMLINK}
+            ln -vf ${DEPLOYDIR}/${UBOOT_ELF_IMAGE} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}
+            if [ -n "${UBOOT_ELF_LINK}" -a "${UBOOT_ARTIFACT_NAME}" != "${UBOOT_ARTIFACT_LINK_NAME}" ]; then
+                ln -vf ${DEPLOYDIR}/${UBOOT_ELF_IMAGE} ${DEPLOYDIR}/${UBOOT_ELF_LINK}
+            fi
         fi
     fi
 
-
-     if [ -n "${SPL_BINARY}" ]
-     then
-        if [ -n "${UBOOT_CONFIG}" ]
-        then
+    if [ -n "${SPL_BINARY}" ]; then
+        if [ -n "${UBOOT_CONFIG}" ]; then
             for config in ${UBOOT_MACHINE}; do
                 i=$(expr $i + 1);
                 for type in ${UBOOT_CONFIG}; do
                     j=$(expr $j + 1);
-                    if [ $j -eq $i ]
-                    then
-                        install -m 644 ${B}/${config}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX}
-                        rm -f ${DEPLOYDIR}/${SPL_BINARYFILE} ${DEPLOYDIR}/${SPL_SYMLINK}
-                        ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX} ${DEPLOYDIR}/${SPL_BINARYFILE}-${type}
-                        ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX} ${DEPLOYDIR}/${SPL_BINARYFILE}
-                        ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX} ${DEPLOYDIR}/${SPL_SYMLINK}-${type}
-                        ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX} ${DEPLOYDIR}/${SPL_SYMLINK}
+                    if [ $j -eq $i ]; then
+                        install -m 644 ${B}/${config}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_BINARYNAME}-${type}${UBOOT_ARTIFACT_NAME}${SPL_DELIMITER}${SPL_SUFFIX}
+                        ln -vf ${DEPLOYDIR}/${SPL_BINARYNAME}-${type}${UBOOT_ARTIFACT_NAME}${SPL_DELIMITER}${SPL_SUFFIX} ${DEPLOYDIR}/${SPL_BINARYFILE}-${type}
+                        ln -vf ${DEPLOYDIR}/${SPL_BINARYNAME}-${type}${UBOOT_ARTIFACT_NAME}${SPL_DELIMITER}${SPL_SUFFIX} ${DEPLOYDIR}/${SPL_BINARYFILE}
+                        if [ -n "${SPL_LINK}" -a "${UBOOT_ARTIFACT_NAME}" != "${UBOOT_ARTIFACT_LINK_NAME}" ]; then
+                            ln -vf ${DEPLOYDIR}/${SPL_BINARYNAME}-${type}${UBOOT_ARTIFACT_NAME}${SPL_DELIMITER}${SPL_SUFFIX} ${DEPLOYDIR}/${SPL_LINK}-${type}
+                            ln -vf ${DEPLOYDIR}/${SPL_BINARYNAME}-${type}${UBOOT_ARTIFACT_NAME}${SPL_DELIMITER}${SPL_SUFFIX} ${DEPLOYDIR}/${SPL_LINK}
+                        fi
                     fi
                 done
                 unset j
@@ -313,28 +296,30 @@ do_deploy () {
             unset i
         else
             install -m 644 ${B}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
-            ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_BINARYNAME}
-            ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}
+            ln -vf ${DEPLOYDIR}/${SPL_IMAGE} ${DEPLOYDIR}/${SPL_BINARYNAME}
+            if [ -n "${SPL_LINK}" -a "${UBOOT_ARTIFACT_NAME}" != "${UBOOT_ARTIFACT_LINK_NAME}" ]; then
+                ln -vf ${DEPLOYDIR}/${SPL_IMAGE} ${DEPLOYDIR}/${SPL_LINK}
+            fi
         fi
     fi
 
-    if [ -n "${UBOOT_ENV}" ]
-    then
+    if [ -n "${UBOOT_ENV}" ]; then
         install -m 644 ${WORKDIR}/${UBOOT_ENV_BINARY} ${DEPLOYDIR}/${UBOOT_ENV_IMAGE}
-        ln -sf ${UBOOT_ENV_IMAGE} ${DEPLOYDIR}/${UBOOT_ENV_BINARY}
-        ln -sf ${UBOOT_ENV_IMAGE} ${DEPLOYDIR}/${UBOOT_ENV_SYMLINK}
+        ln -vf ${DEPLOYDIR}${UBOOT_ENV_IMAGE} ${DEPLOYDIR}/${UBOOT_ENV_BINARY}
+        if [ -n "${UBOOT_ENV_LINK}" -a "${UBOOT_ARTIFACT_NAME}" != "${UBOOT_ARTIFACT_LINK_NAME}" ]; then
+            ln -vf ${DEPLOYDIR}${UBOOT_ENV_IMAGE} ${DEPLOYDIR}/${UBOOT_ENV_LINK}
+        fi
     fi
 
-    if [ "${UBOOT_EXTLINUX}" = "1" ]
-    then
-        install -m 644 ${UBOOT_EXTLINUX_CONFIG} ${DEPLOYDIR}/${UBOOT_EXTLINUX_SYMLINK}
-        ln -sf ${UBOOT_EXTLINUX_SYMLINK} ${DEPLOYDIR}/${UBOOT_EXTLINUX_CONF_NAME}-${MACHINE}
-        ln -sf ${UBOOT_EXTLINUX_SYMLINK} ${DEPLOYDIR}/${UBOOT_EXTLINUX_CONF_NAME}
+    if [ "${UBOOT_EXTLINUX}" = "1" ]; then
+        install -m 644 ${UBOOT_EXTLINUX_CONFIG} ${DEPLOYDIR}/${UBOOT_EXTLINUX_CONF_NAME}${UBOOT_ARTIFACT_NAME}
+        if [ -n "${UBOOT_EXTLINUX_CONF_LINK}" -a "${UBOOT_ARTIFACT_NAME}" != "${UBOOT_ARTIFACT_LINK_NAME}" ]; then
+            ln -vf ${DEPLOYDIR}${UBOOT_EXTLINUX_CONF_NAME}${UBOOT_ARTIFACT_NAME} ${DEPLOYDIR}/${UBOOT_EXTLINUX_CONF_LINK}
+        fi
     fi
 
-    if [ -n "${UBOOT_DTB}" ]
-    then
-        install -m 644 ${B}/arch/${UBOOT_ARCH_DIR}/dts/${UBOOT_DTB_BINARY} ${DEPLOYDIR}/
+    if [ -n "${UBOOT_DTB}" ]; then
+        install -m 644 ${B}/arch/${UBOOT_ARCH_DIR}/dts/${UBOOT_DTB_BINARY} ${DEPLOYDIR}/${UBOOT_DTB_BINARY}${UBOOT_ARTIFACT_NAME}
     fi
 }
 
-- 
2.43.0


