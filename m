Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0B9537918C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 22:16:32 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id b15-v6so11389583wrv.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 15:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rz/GpP89VJFBJ3vJ443gW39Q7VRLP95fmt+jBDEk758=;
	b=eDx7ZlHBdI1KO3RtSLQYruC9T0Rh13MsBKjToO5SRU175Zl2G6F+IujFwA3FOXLq3l
	mC4v9ez8Ml1a9iLlQjg2FQihM1IuVtlhukp53yYvAffqMbujKdCTVdEXlbPLdfjsd02J
	6kBVa39MYQkgeenjrRXLm65n7R6UMbdjdm//R2uqkv/H3DuP3t7g45wGP3QrEmV98GBN
	ttnWaLqIYUKlHlM7WP8hD46ZafcTlinnByGplKFlGRZPldPoTN+EFaPytet9KoxW7NiF
	ZY5M2T4y4OULIWodBuiaqR87PI3bxl3EpDn/jlsm5wQYvaSUmyhzkVji75+uy6M6IwhI
	mTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rz/GpP89VJFBJ3vJ443gW39Q7VRLP95fmt+jBDEk758=;
	b=bnnppQd5bUVwHsSOZw3275MRuN2GpeneHXku5dwM0GgomOiDtSrHAIuUVefu0L2sAa
	O2vk9HTBllpdUxxnAJRM9xrSPoft/b6OivDVzSp655ANqdmbdHccNWwdj6f1KtlTpO5L
	YQS8awEfNMJBTxiUYVNIwhL1ziYHZ0AoxnQfuS88GaS0l83ukROncZXNrX428oeyZEld
	JEn3cr3wvmLqrnXSgiMZpuscMHbBz4JmJ1PwYPn95ByWCKKa33/dDg58UgptMm1wNIxC
	kfFQfSFb+yNguKBAIDNspvWRpfJjTHDkQJkuRu1uebWE0ykgr6biYefHuxUq5UF2atw0
	EOgw==
X-Gm-Message-State: AOUpUlGm3lff26Zt3BedMvilQjEmhIGE+t5kbOxZbxjC7Oy7f7hKi0Ak
	4yAgWXA63HQsNg4NGC5nqhpJht2X
X-Google-Smtp-Source: AA+uWPzhHnbImIBgKMcnwtlmnsqgD+3Ix2kbOXilAujhyjDDg+6EvslJoU4fklpIOekRnAaqZ6m/MQ==
X-Received: by 2002:a5d:6b01:: with SMTP id
	v1-v6mr27702867wrw.208.1534716993673; 
	Sun, 19 Aug 2018 15:16:33 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	e141-v6sm16467340wmd.32.2018.08.19.15.16.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 19 Aug 2018 15:16:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Aug 2018 22:15:58 +0000
Message-Id: <ca2d5b0b4debe5d4cbc98b15aa417bfd490dd9dc.1534716156.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1534716156.git.Martin.Jansa@gmail.com>
References: <cover.1534716156.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/6] bitbake.conf, kernel-artifact-names.bbclass: introduce IMAGE_VERSION_SUFFIX instead of using DATETIME directly
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
X-List-Received-Date: Sun, 19 Aug 2018 22:16:33 -0000

* this makes it easier to use different version string than DATETIME, e.g. set from jenkins job
  while keeping the suffix consistent across all artifacts stored in DEPLOYDIR

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel-artifact-names.bbclass | 13 ++++---------
 meta/conf/bitbake.conf                     |  5 +++--
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/meta/classes/kernel-artifact-names.bbclass b/meta/classes/kernel-artifact-names.bbclass
index d696888322..70b1cb804d 100644
--- a/meta/classes/kernel-artifact-names.bbclass
+++ b/meta/classes/kernel-artifact-names.bbclass
@@ -1,19 +1,14 @@
-KERNEL_IMAGE_BASE_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
-# Don't include the DATETIME variable in the sstate package signatures
-KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
+KERNEL_IMAGE_BASE_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
 KERNEL_IMAGE_SYMLINK_NAME ?= "${MACHINE}"
 
-KERNEL_DTB_BASE_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
-KERNEL_DTB_BASE_NAME[vardepsexclude] = "DATETIME"
+KERNEL_DTB_BASE_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
 KERNEL_DTB_SYMLINK_NAME ?= "${MACHINE}"
 
-MODULE_IMAGE_BASE_NAME ?= "modules-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
-MODULE_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
+MODULE_IMAGE_BASE_NAME ?= "modules-${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
 
 MODULE_TARBALL_BASE_NAME ?= "${MODULE_IMAGE_BASE_NAME}.tgz"
 MODULE_TARBALL_SYMLINK_NAME ?= "modules-${MACHINE}.tgz"
 MODULE_TARBALL_DEPLOY ?= "1"
 
-INITRAMFS_BASE_NAME ?= "initramfs-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
-INITRAMFS_BASE_NAME[vardepsexclude] = "DATETIME"
+INITRAMFS_BASE_NAME ?= "initramfs-${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
 INITRAMFS_SYMLINK_NAME ?= "initramfs-${MACHINE}"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f68954c511..1941633a54 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -445,8 +445,9 @@ STAGING_KERNEL_BUILDDIR = "${TMPDIR}/work-shared/${MACHINE}/kernel-build-artifac
 
 IMAGE_ROOTFS = "${WORKDIR}/rootfs"
 IMAGE_BASENAME = "${PN}"
-IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}-${DATETIME}"
-IMAGE_NAME[vardepsexclude] += "DATETIME"
+IMAGE_VERSION_SUFFIX = "-${DATETIME}"
+IMAGE_VERSION_SUFFIX[vardepsexclude] += "DATETIME"
+IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
 IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${MACHINE}"
 
 # This option allows for a percentage overage of the actual image size rather than a
-- 
2.17.1


