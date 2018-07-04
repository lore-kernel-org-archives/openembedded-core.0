Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 75EB578AC6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2018 07:59:33 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id q10-v6so4304066wrd.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jul 2018 00:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mTeoLX5SWe+KTyh1jRQ6gXQiBnKm+o9EBSZEc6X2kNU=;
	b=ISuNrCoCUYh+KUaQM67YDqd1sdGuFe6r1sKIneVib200MFXJR11igYNGNjjgZI++7S
	DCwNJU4uLYvM0wtcBg3rUGs3XMRphd9CWAaflaqyREdBALYXbbZH05gK1rQ43GtVsqgd
	gyriiGAQsAv3d9zyRWVQQKJo16j8KWN21TAzdOMBXKrCygbg5qcNh/wveTHX+0ay83rH
	bGd0zFwxOoO9ueANGAPYnppVF2vgFVD24eoAzop1tS2fV52dwOZWP4Qv521i+pQA3cRT
	Fj0xre5XzJ8Tq4cvN1bRoeFnvpwt76jKQFmzhickxg5wVAQ4nj6LARI+rVhS67nKSDZr
	bMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mTeoLX5SWe+KTyh1jRQ6gXQiBnKm+o9EBSZEc6X2kNU=;
	b=IlwxC9qzzHFNXavXvxe3Vij32kQYjjValfORpkRp/nS6r3VCt2efTBesqdTmR01Is/
	iesOQz0atY6d2XE30RpXJ2hzidjIRBsa3P9wWYeUSsJhx7apft9K6anJK+eRxWNeTVBL
	XElaZCkRwUKHlkUUugMTxGTaL/y5FH0F4Ny4BHyrpz5UD1hrFep5O76iXv18JxzfWVd4
	lcdNJ3VRihs9GEwuZJfShlZs7coubx9HlU4YUJTX7YpYm/L9ykACZ2G+lMYN+vrqJx8/
	9pWi+UmK7HcBmPhBVoGVXcJWKXI2MRMJvTrM5RrS+ezw4MiV8RS8moh8Or+Qv6vlXueF
	PcPA==
X-Gm-Message-State: APt69E0O66EW3D2H8F6BWJSzr1+jmKkq/jFy0nI4IIzTFwh0bzQXx40e
	+1VOYXktVkw4WzzLDHh7PUrxZA==
X-Google-Smtp-Source: AAOMgpeLGm61Ecvi5Cuw9k+m+SB3Zimz7208/CtGTOf2Tg+GBEe+5P1J5wclpMgsjW/kFAUglRJlCw==
X-Received: by 2002:adf:8b01:: with SMTP id n1-v6mr781873wra.282.1530691173990;
	Wed, 04 Jul 2018 00:59:33 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	130-v6sm8239574wmr.1.2018.07.04.00.59.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 04 Jul 2018 00:59:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jul 2018 07:59:24 +0000
Message-Id: <20180704075924.24065-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180704075924.24065-1-Martin.Jansa@gmail.com>
References: <CA+chaQd9otpzozM5DrifBUVdODogBsVdy2U8czAAd+Ys_6TBtA@mail.gmail.com>
	<20180704075924.24065-1-Martin.Jansa@gmail.com>
Subject: [PATCHv3 4/4] kernel.bbclass: move variables for kernel artifacts names to separate bbclass
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
X-List-Received-Date: Wed, 04 Jul 2018 07:59:33 -0000

* this makes it easier to access these variables from some other bbclass
  e.g. sdcard_image-rpi.bbclass in meta-raspberry where we need to know
  how some files in deploy are named, but we cannot inherit kernel.bbclass
  as it's used in image recipe not kernel recipe
* alternatively we can move these to bitbake.conf like similar image variables are:
  meta/conf/bitbake.conf:IMAGE_BASENAME = "${PN}"
  meta/conf/bitbake.conf:IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}-${DATETIME}"
  meta/conf/bitbake.conf:IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${MACHINE}"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel-artifact-names.bbclass | 19 +++++++++++++++++++
 meta/classes/kernel.bbclass                | 18 +-----------------
 2 files changed, 20 insertions(+), 17 deletions(-)
 create mode 100644 meta/classes/kernel-artifact-names.bbclass

diff --git a/meta/classes/kernel-artifact-names.bbclass b/meta/classes/kernel-artifact-names.bbclass
new file mode 100644
index 0000000000..d696888322
--- /dev/null
+++ b/meta/classes/kernel-artifact-names.bbclass
@@ -0,0 +1,19 @@
+KERNEL_IMAGE_BASE_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
+# Don't include the DATETIME variable in the sstate package signatures
+KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
+KERNEL_IMAGE_SYMLINK_NAME ?= "${MACHINE}"
+
+KERNEL_DTB_BASE_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
+KERNEL_DTB_BASE_NAME[vardepsexclude] = "DATETIME"
+KERNEL_DTB_SYMLINK_NAME ?= "${MACHINE}"
+
+MODULE_IMAGE_BASE_NAME ?= "modules-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
+MODULE_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
+
+MODULE_TARBALL_BASE_NAME ?= "${MODULE_IMAGE_BASE_NAME}.tgz"
+MODULE_TARBALL_SYMLINK_NAME ?= "modules-${MACHINE}.tgz"
+MODULE_TARBALL_DEPLOY ?= "1"
+
+INITRAMFS_BASE_NAME ?= "initramfs-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
+INITRAMFS_BASE_NAME[vardepsexclude] = "DATETIME"
+INITRAMFS_SYMLINK_NAME ?= "initramfs-${MACHINE}"
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 0045cec819..42efa382ad 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -657,23 +657,7 @@ do_sizecheck[dirs] = "${B}"
 
 addtask sizecheck before do_install after do_strip
 
-KERNEL_IMAGE_BASE_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
-# Don't include the DATETIME variable in the sstate package signatures
-KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
-KERNEL_IMAGE_SYMLINK_NAME ?= "${MACHINE}"
-KERNEL_DTB_BASE_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
-KERNEL_DTB_BASE_NAME[vardepsexclude] = "DATETIME"
-KERNEL_DTB_SYMLINK_NAME ?= "${MACHINE}"
-MODULE_IMAGE_BASE_NAME ?= "modules-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
-MODULE_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
-MODULE_TARBALL_BASE_NAME ?= "${MODULE_IMAGE_BASE_NAME}.tgz"
-# Don't include the DATETIME variable in the sstate package signatures
-MODULE_TARBALL_SYMLINK_NAME ?= "modules-${MACHINE}.tgz"
-MODULE_TARBALL_DEPLOY ?= "1"
-
-INITRAMFS_BASE_NAME ?= "initramfs-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
-INITRAMFS_BASE_NAME[vardepsexclude] = "DATETIME"
-INITRAMFS_SYMLINK_NAME ?= "initramfs-${MACHINE}"
+inherit kernel-artifact-names
 
 kernel_do_deploy() {
 	deployDir="${DEPLOYDIR}"
-- 
2.17.1


