Return-Path: <matthias.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22580C4828F
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 10:26:41 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web10.17568.1707301590121068504
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 02:26:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=hzr3ieZu;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: matthias.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1707301590; x=1738837590;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=83+JSRJfXgwMguJoTyZn5zsEIu8TjY+Xc+pmQecIdRM=;
  b=hzr3ieZuiLB5mH688YMUDLmdoYhflh3elKSLgh1WWKF0hVv359kyL79M
   Jj2Ef0KZT+jnecQoPgHD0OJKR/TnUjDsWPNwmX/1+KnH6QYFAqVLiRktm
   YxCODvwjuw1DhYQHEIosykDsnXd46428dyXBxgpdzKUhDBEYfz2AWugeg
   YhEPOkk3dGBh/iLjK5LBHwX62wTK+WBx2SeVzq+cWzQRFPXOzrw2vwb6t
   eCnwqCMzSUEF9mOH9btSampRLvLjNvnAWdwuA/+xUqeESBAT6TPPuM0cB
   vLERw3z3lodGZRmyZ9Xyngp0Vm5kefKjLsDrxoay3w78s/YqRwxtvHCVe
   A==;
X-IronPort-AV: E=Sophos;i="6.05,250,1701126000"; 
   d="scan'208";a="35291019"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 07 Feb 2024 11:26:27 +0100
Received: from schifferm-ubuntu.tq-net.de (SCHIFFERM-M3.tq-net.de [10.121.49.135])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 396DC280075;
	Wed,  7 Feb 2024 11:26:27 +0100 (CET)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Cc: oss@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH] kernel.bbclass: install .config to deploy dir
Date: Wed,  7 Feb 2024 11:25:29 +0100
Message-ID: <20240207102529.128369-1-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 10:26:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195047

Deploy the kernel configuration with the built images, so it is easy to
check its contents, or rebuild the same configuration outside of the
Yocto build system.

This can be particularly convenient when running a Yocto build as a CI
job, and only the deploy dir is made available for download.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 meta/classes-recipe/kernel-artifact-names.bbclass | 3 +++
 meta/classes-recipe/kernel.bbclass                | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/meta/classes-recipe/kernel-artifact-names.bbclass b/meta/classes-recipe/kernel-artifact-names.bbclass
index 1a7611a15e..8e2ef0d627 100644
--- a/meta/classes-recipe/kernel-artifact-names.bbclass
+++ b/meta/classes-recipe/kernel-artifact-names.bbclass
@@ -16,6 +16,9 @@ KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}${IMAGE_MACHINE_SUFFIX}${IMAGE_V
 KERNEL_ARTIFACT_LINK_NAME ?= "${MACHINE}"
 KERNEL_ARTIFACT_BIN_EXT ?= ".bin"
 
+KERNEL_CONFIG_NAME ?= "${KERNEL_ARTIFACT_NAME}"
+KERNEL_CONFIG_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"
+
 KERNEL_IMAGE_NAME ?= "${KERNEL_ARTIFACT_NAME}"
 KERNEL_IMAGE_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"
 KERNEL_IMAGE_BIN_EXT ?= "${KERNEL_ARTIFACT_BIN_EXT}"
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index a76aaee5ba..8a98899e04 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -812,6 +812,13 @@ kernel_do_deploy() {
 		mkdir "$deployDir"
 	fi
 
+	if [ -n "${KERNEL_CONFIG_NAME}" ]; then
+		install -m 0644 .config $deployDir/config-${KERNEL_CONFIG_NAME}
+		if [ -n "${KERNEL_CONFIG_LINK_NAME}" ]; then
+			ln -sf config-${KERNEL_CONFIG_NAME} $deployDir/config-${KERNEL_CONFIG_LINK_NAME}
+		fi
+	fi
+
 	for imageType in ${KERNEL_IMAGETYPES} ; do
 		baseName=$imageType-${KERNEL_IMAGE_NAME}
 
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


