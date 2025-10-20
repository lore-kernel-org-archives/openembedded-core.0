Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A57CCD193
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 14:49:37 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.20673.1760971773447626818
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 07:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Myzmy7k7;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59KEnWC32914236
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 09:49:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760971772;
	bh=3vx1T54svVpggtl3kqjVe1QgsK1xytja9LOxdVNssNQ=;
	h=From:To:Subject:Date;
	b=Myzmy7k7We/bBKI03+Qak9wy8faBK8/kLZBOAhJMqlqkkRZXxAan7jBUMognQKYu1
	 S+fhX2DbmjdOXSNomoZSQBlMzQVdwiQ2XM1Wl6Da+eGoMB4YAY529vjSnJ3A78QSix
	 sRgUs8zMyO7qbUMq9k5q/Xx65V4KTCkg3E0NFVrs=
Received: from DLEE211.ent.ti.com (dlee211.ent.ti.com [157.170.170.113])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59KEnW5F868520
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 09:49:32 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Oct
 2025 09:49:32 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 20 Oct 2025 09:49:32 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59KEnWH32123838
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 09:49:32 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1vArCW-0002Mb-Fo
	for openembedded-core@lists.openembedded.org; Mon, 20 Oct 2025 09:49:32 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH v2] kernel-fit-image: Split signing variables
Date: Mon, 20 Oct 2025 09:49:32 -0500
Message-ID: <20251020144932.9045-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 14:49:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225123

Right now all signing is done with a single variable: UBOOT_SIGN_ENABLE.
This has the side effect of not allowing for signing the fitImage while
not signing the uboot files.

This patch creates three new variables specific to FIT_KERNEL and
defaults them to the corresponding UBOOT variables.  That way all
existing code will remain the same, but we can selectively control just
signing the fitImage without also signing the uboot files.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Change the variable naming from KERNEL_FITIMAGE_* to FIT_KERNEL_*.

 meta/classes-recipe/kernel-fit-image.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index f04aee1807..29f4098ccc 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -35,6 +35,10 @@ do_configure[noexec] = "1"
 UBOOT_MKIMAGE_KERNEL_TYPE ?= "kernel"
 KERNEL_IMAGEDEST ?= "/boot"
 
+FIT_KERNEL_SIGN_ENABLE ?= "${UBOOT_SIGN_ENABLE}"
+FIT_KERNEL_SIGN_KEYNAME ?= "${UBOOT_SIGN_KEYNAME}"
+FIT_KERNEL_SIGN_KEYDIR ?= "${UBOOT_SIGN_KEYDIR}"
+
 python do_compile() {
     import shutil
     import oe.fitimage
@@ -50,11 +54,11 @@ python do_compile() {
     root_node = oe.fitimage.ItsNodeRootKernel(
         d.getVar("FIT_DESC"), d.getVar("FIT_ADDRESS_CELLS"),
         d.getVar('HOST_PREFIX'), d.getVar('UBOOT_ARCH'),  d.getVar("FIT_CONF_PREFIX"),
-        oe.types.boolean(d.getVar('UBOOT_SIGN_ENABLE')), d.getVar("UBOOT_SIGN_KEYDIR"),
+        oe.types.boolean(d.getVar('FIT_KERNEL_SIGN_ENABLE')), d.getVar("FIT_KERNEL_SIGN_KEYDIR"),
         d.getVar("UBOOT_MKIMAGE"), d.getVar("UBOOT_MKIMAGE_DTCOPTS"),
         d.getVar("UBOOT_MKIMAGE_SIGN"), d.getVar("UBOOT_MKIMAGE_SIGN_ARGS"),
         d.getVar('FIT_HASH_ALG'), d.getVar('FIT_SIGN_ALG'), d.getVar('FIT_PAD_ALG'),
-        d.getVar('UBOOT_SIGN_KEYNAME'),
+        d.getVar('FIT_KERNEL_SIGN_KEYNAME'),
         oe.types.boolean(d.getVar('FIT_SIGN_INDIVIDUAL')), d.getVar('UBOOT_SIGN_IMG_KEYNAME')
     )
 
-- 
2.17.1


