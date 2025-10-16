Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9311FCCD199
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 13:58:03 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.9343.1760623079512928097
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 06:57:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RmWG/72A;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59GDvwNP2117021
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 08:57:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760623078;
	bh=NBPIK+hzYAjXN2LMlDhZOvVw8kOZsYD8ExSb1zgyTZ8=;
	h=From:To:Subject:Date;
	b=RmWG/72ATs+i/Qo8LK7Z9XVJOYA4Z8ZpPBG1MRAU4+NoqpC6WtwoJgu7PqoLpGg+O
	 OTIGbthIJJHc794e+48MKdcF1dSo+jagtzrzxwAND1mbR6JhYKhf0dcHDMnq2DP234
	 kYBo/Yga1PSsxNYJVQKqegM0LOKX3tZ/+2Ji6mLM=
Received: from DFLE211.ent.ti.com (dfle211.ent.ti.com [10.64.6.69])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59GDvw5H1654226
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 08:57:58 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Oct
 2025 08:57:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 16 Oct 2025 08:57:58 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59GDvw0S3829436
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 08:57:58 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1v9OUQ-00005H-Cg
	for openembedded-core@lists.openembedded.org; Thu, 16 Oct 2025 08:57:58 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] kernel-fit-image: Split signing variables
Date: Thu, 16 Oct 2025 08:57:58 -0500
Message-ID: <20251016135758.32738-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 13:58:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224965

Right now all signing is done with a single variable: UBOOT_SIGN_ENABLE.
This has the side effect of not allowing for signing the fitImage while
not signing the uboot files.

This patch creates three new variables specific to KERNEL_FITIMAGE and
defaults them to the corresponding UBOOT variables.  That way all
existing code will remain the same, but we can selectively control just
signing the fitImage without also signing the uboot files.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta/classes-recipe/kernel-fit-image.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index f04aee1807..29f4098ccc 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -35,6 +35,10 @@ do_configure[noexec] = "1"
 UBOOT_MKIMAGE_KERNEL_TYPE ?= "kernel"
 KERNEL_IMAGEDEST ?= "/boot"
 
+KERNEL_FITIMAGE_SIGN_ENABLE ?= "${UBOOT_SIGN_ENABLE}"
+KERNEL_FITIMAGE_SIGN_KEYNAME ?= "${UBOOT_SIGN_KEYNAME}"
+KERNEL_FITIMAGE_SIGN_KEYDIR ?= "${UBOOT_SIGN_KEYDIR}"
+
 python do_compile() {
     import shutil
     import oe.fitimage
@@ -50,11 +54,11 @@ python do_compile() {
     root_node = oe.fitimage.ItsNodeRootKernel(
         d.getVar("FIT_DESC"), d.getVar("FIT_ADDRESS_CELLS"),
         d.getVar('HOST_PREFIX'), d.getVar('UBOOT_ARCH'),  d.getVar("FIT_CONF_PREFIX"),
-        oe.types.boolean(d.getVar('UBOOT_SIGN_ENABLE')), d.getVar("UBOOT_SIGN_KEYDIR"),
+        oe.types.boolean(d.getVar('KERNEL_FITIMAGE_SIGN_ENABLE')), d.getVar("KERNEL_FITIMAGE_SIGN_KEYDIR"),
         d.getVar("UBOOT_MKIMAGE"), d.getVar("UBOOT_MKIMAGE_DTCOPTS"),
         d.getVar("UBOOT_MKIMAGE_SIGN"), d.getVar("UBOOT_MKIMAGE_SIGN_ARGS"),
         d.getVar('FIT_HASH_ALG'), d.getVar('FIT_SIGN_ALG'), d.getVar('FIT_PAD_ALG'),
-        d.getVar('UBOOT_SIGN_KEYNAME'),
+        d.getVar('KERNEL_FITIMAGE_SIGN_KEYNAME'),
         oe.types.boolean(d.getVar('FIT_SIGN_INDIVIDUAL')), d.getVar('UBOOT_SIGN_IMG_KEYNAME')
     )
 
-- 
2.17.1


