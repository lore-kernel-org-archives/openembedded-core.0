Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5A81579313
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 09:11:48 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id j8-v6so1732656wrw.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 02:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=rcWVhrinRR1L7Jk94xnbURUDv30xq6PI/ny/8EktSA0=;
	b=lZISYgSzFKiRU0so8v3N0iHNC2BrEphyWFw1hXvHL3Zxaw4tfqIJ5Vpcg/oABUjWLX
	I2aNvFr+X4P4ADErKSFJuGRoDxMjvXd7cmbJQZ6GCDQrz5Snvs6s3B9zm/DMGRtZiwPi
	BVe33mnRx7g0O3z0BiHcIl4JPOS2fNeBEuz3aFeS85g/2qttiAkBrV2tM4vYlERu/w4D
	hTF6hsXip/MIaZJ5RLf0i/vGG7YznkrHI0ifRNgQLUFhMj49hMDMUZRYj5LxWJ3YysaF
	/2qRqo87bZfWdsGL4LnO1HHrJd9mu8o3Pe8OjFOmNejP9dzlI05SUUshvpDPyu3mS6x6
	/q5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rcWVhrinRR1L7Jk94xnbURUDv30xq6PI/ny/8EktSA0=;
	b=S+o7I+78EQFNoHoPhcN1IY4Yp0nJtWhfJT+TKHmxWzt38IE5nupSjetz7qpl3LVyHY
	BTyEOscxpYRoAqEHBy4MVY0hSyHrb8h5yFvSLBu9HL6/rzFfKnFGtVGqqUbjXvoGCnUI
	eyG//AUOmdsDD/vOR6Zbezpg+nkQa/9DK7GBMuaG9ibK37ddVQH63PHIomZ1gFsiST8J
	oNgTgDIGv9cS0pAXqUaT6EO7hN2EjGWugUD+VvlbBJzkBUKBetDPw4er2N2ozAJmL/mf
	OtN2tmQ5vPCbdgDldhfx0V3repqGWigvSy3KFhSwi5jlC1X3l218ulzBV0KvDeTWUt12
	TLpg==
X-Gm-Message-State: ABuFfohFA5HFYl0P1ehx+RRc3yAWe++vb+J0/Lm9mARwG96T8nhvyuzA
	rieyCAMCbUqhoy/Ukw11TJXG7j30
X-Google-Smtp-Source: ACcGV63GwLjVspxTq84u/6Sa0oS8ApiDFRDhtwpIJlzNpH8Pfm8IRVa6BOXRoRDMyLRusYTA8oalKQ==
X-Received: by 2002:adf:fdca:: with SMTP id
	i10-v6mr8414087wrs.276.1538039508549; 
	Thu, 27 Sep 2018 02:11:48 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	z89-v6sm3644425wrb.3.2018.09.27.02.11.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 27 Sep 2018 02:11:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Sep 2018 09:11:47 +0000
Message-Id: <20180927091147.12414-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [RFC][PATCH] bitbake.conf, kernel*.bbclass: include IMAGE_VERSION_SUFFIX only in the _LINK_NAME variables and change it to hard link
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
X-List-Received-Date: Thu, 27 Sep 2018 09:11:48 -0000

* just RFC, the part for images isn't finished yet and there is
  still some issue with DATETIME when kernel artifacts are used
  from sstate, this is just to validate the idea behind
  [YOCTO #12937] before finishing the implementation (it's already
  finished and used by various LGE builds, but having simpler
  way of doing it directly in oe-core mighe be useful for others).

* move IMAGE_VERSION_SUFFIX from _NAME variables to _LINK_NAME
  that way e.g. kernel.do_deploy can be reused from sstate to
  provide "version-less" artifacts and then very fast
  do_deploy_links task just adds links with consistent suffixes
* create hard links instead of symlinks, so that whatever version
  the filename says is really there
* some IMAGE_FSTYPES might need the "version-less" IMAGE_NAME file
  to be removed first or they might either append or update the
  content of the image instead of creating new image file from
  scratch - I have seen this only with one proprietary format we
  generate with our own tool, so hopefully this isn't very common
* this is basically the mechanism are using in webOS with
  WEBOS_IMAGE_NAME_SUFFIX which is for official builds set from
  jenkins job and then all artifacts (images as well as corresponding
  kernel files) have the same version string, the implementation
  "from outside" is a bit tricky as shown in webOS OSE, the variable
  modifications:
  https://github.com/webosose/meta-webosose/blob/a35e81622aae1066591e44a132d01297ff478248/meta-webos/conf/distro/include/webos.inc#L65
  and then various bbclasses to hook do_webos_deploy_fixup task creating
  the hardlinks for possible artifacts:
  https://github.com/webosose/meta-webosose/blob/a35e81622aae1066591e44a132d01297ff478248/meta-webos/classes/webos_deploy.bbclass
  https://github.com/webosose/meta-webosose/blob/a35e81622aae1066591e44a132d01297ff478248/meta-webos/classes/kernel.bbclass
  https://github.com/webosose/meta-webosose/blob/a35e81622aae1066591e44a132d01297ff478248/meta-webos/classes/image.bbclass
  so hopefully with all these changes in oe-core other project can
  achieve the same just by setting one variable IMAGE_VERSION_SUFFIX

[YOCTO #12937]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel-artifact-names.bbclass |  4 +--
 meta/classes/kernel.bbclass                | 40 ++++++++++++++++------
 meta/conf/bitbake.conf                     |  4 +--
 3 files changed, 33 insertions(+), 15 deletions(-)

diff --git a/meta/classes/kernel-artifact-names.bbclass b/meta/classes/kernel-artifact-names.bbclass
index bbeecba7bd..84ec193b5a 100644
--- a/meta/classes/kernel-artifact-names.bbclass
+++ b/meta/classes/kernel-artifact-names.bbclass
@@ -1,5 +1,5 @@
-KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
-KERNEL_ARTIFACT_LINK_NAME ?= "${MACHINE}"
+KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}"
+KERNEL_ARTIFACT_LINK_NAME ?= "${KERNEL_ARTIFACT_NAME}${IMAGE_VERSION_SUFFIX}"
 
 KERNEL_IMAGE_NAME ?= "${KERNEL_ARTIFACT_NAME}"
 KERNEL_IMAGE_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index d0fbbd1989..7aaebb56b4 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -667,25 +667,18 @@ kernel_do_deploy() {
 	fi
 
 	for imageType in ${KERNEL_IMAGETYPES} ; do
-		base_name=${imageType}-${KERNEL_IMAGE_NAME}
-		install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} $deployDir/${base_name}.bin
-		symlink_name=${imageType}-${KERNEL_IMAGE_LINK_NAME}
-		ln -sf ${base_name}.bin $deployDir/${symlink_name}.bin
-		ln -sf ${base_name}.bin $deployDir/${imageType}
+		install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} $deployDir/${imageType}-${KERNEL_IMAGE_NAME}.bin
+		ln -sf ${imageType}-${KERNEL_IMAGE_NAME}.bin $deployDir/${imageType}
 	done
 
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		mkdir -p ${D}${root_prefix}/lib
 		tar -cvzf $deployDir/modules-${MODULE_TARBALL_NAME}.tgz -C ${D}${root_prefix} lib
-		ln -sf modules-${MODULE_TARBALL_NAME}.tgz $deployDir/modules-${MODULE_TARBALL_LINK_NAME}.tgz
 	fi
 
 	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
 		for imageType in ${KERNEL_IMAGETYPES} ; do
-			initramfs_base_name=${imageType}-${INITRAMFS_NAME}
-			initramfs_symlink_name=${imageType}-${INITRAMFS_LINK_NAME}
-			install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}.initramfs $deployDir/${initramfs_base_name}.bin
-			ln -sf ${initramfs_base_name}.bin $deployDir/${initramfs_symlink_name}.bin
+			install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}.initramfs $deployDir/${imageType}-${INITRAMFS_NAME}.bin
 		done
 	fi
 }
@@ -695,7 +688,32 @@ do_deploy[prefuncs] += "package_get_auto_pr"
 
 addtask deploy after do_populate_sysroot do_packagedata
 
-EXPORT_FUNCTIONS do_deploy
+kernel_do_deploy_links() {
+	deployDir="${DEPLOY_DIR_IMAGE}"
+	if [ -n "${KERNEL_DEPLOYSUBDIR}" ]; then
+		deployDir="${DEPLOY_DIR_IMAGE}/${KERNEL_DEPLOYSUBDIR}"
+		mkdir "$deployDir"
+	fi
+
+	for imageType in ${KERNEL_IMAGETYPES} ; do
+		ln -vf $deployDir/${imageType}-${KERNEL_IMAGE_NAME}.bin $deployDir/${imageType}-${KERNEL_IMAGE_LINK_NAME}.bin
+	done
+
+	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
+		ln -vf $deployDir/modules-${MODULE_TARBALL_NAME}.tgz $deployDir/modules-${MODULE_TARBALL_LINK_NAME}.tgz
+	fi
+
+	if [ ! -z "${INITRAMFS_IMAGE}" -a "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
+		for imageType in ${KERNEL_IMAGETYPES} ; do
+			ln -vf ${imageType}-${INITRAMFS_NAME}.bin ${imageType}-${INITRAMFS_LINK_NAME}.bin
+		done
+	fi
+}
+do_deploy_links[prefuncs] += "package_get_auto_pr"
+
+addtask deploy_links after do_deploy before do_build
+
+EXPORT_FUNCTIONS do_deploy do_deploy_links
 
 # Add using Device Tree support
 inherit kernel-devicetree
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 93aee1ae46..017cb163ba 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -447,8 +447,8 @@ IMAGE_ROOTFS = "${WORKDIR}/rootfs"
 IMAGE_BASENAME = "${PN}"
 IMAGE_VERSION_SUFFIX = "-${DATETIME}"
 IMAGE_VERSION_SUFFIX[vardepsexclude] += "DATETIME"
-IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
-IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${MACHINE}"
+IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}"
+IMAGE_LINK_NAME = "${IMAGE_NAME}${IMAGE_VERSION_SUFFIX}"
 
 # This option allows for a percentage overage of the actual image size rather than a
 # fixed extra space, this is space needed for initial startup and basic operations.
-- 
2.17.1


