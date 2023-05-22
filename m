Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F197C77B75
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 20:46:35 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.3094.1684788388754696546
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 13:46:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=o6E5eNex;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34MKkJEc015678;
	Mon, 22 May 2023 15:46:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684788379;
	bh=7XQiQ/SPzEHoNgCGZK+97oThNC0Fp42uctJ6qldlRBA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=o6E5eNexhf8b80JFgvNvjCapVDdxfuzAEx4TugutywMaq2SxXJ/sl5A6r7gOD28L3
	 BrzgLCxty3k5IKcNHQbyh191BMUWBPXcKiLEdJXGs4a+qk1J/kEWMTo+GKqvRpdB29
	 GF0b3m/jy6Ixpj7CG4DwSsGBiwlNFfjgkbh+PUmg=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34MKkJDA113651
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 22 May 2023 15:46:19 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 May 2023 15:46:19 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 May 2023 15:46:19 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34MKkJ6q078155;
	Mon, 22 May 2023 15:46:19 -0500
From: <rs@ti.com>
To: <luca.ceresoli@bootlin.com>, <richard.purdie@linuxfoundation.org>,
        <reatmon@ti.com>, <afd@ti.com>, <denis@denix.org>,
        <martin.jansa@gmail.com>, <peter.kjellerstedt@axis.com>,
        <alexandre.belloni@bootlin.com>
CC: <openembedded-core@lists.openembedded.org>,
        Martin Jansa
	<Martin.Jansa@gmail.com>, Randolph Sapp <rs@ti.com>
Subject: [OE-core][PATCHv3 1/3] kernel-devicetree: make shell scripts posix compliant
Date: Mon, 22 May 2023 15:46:10 -0500
Message-ID: <20230522204612.3882158-2-rs@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230522204612.3882158-1-rs@ti.com>
References: <20230522204612.3882158-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 20:46:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181615

From: Martin Jansa <Martin.Jansa@gmail.com>

Use the notation suggested by Martin Jansa to avoid a bashism. Also
switch KERNEL_DTBVENDORED to the more common 0/1 notation instead of
true/false.

Fixes: 04ab57d200 (kernel-devicetree: allow specification of dtb
directory, 2023-05-02)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta/classes-recipe/kernel-devicetree.bbclass | 4 ++--
 meta/classes-recipe/kernel.bbclass            | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/kernel-devicetree.bbclass b/meta/classes-recipe/kernel-devicetree.bbclass
index a6c6c5f227..831fdd1527 100644
--- a/meta/classes-recipe/kernel-devicetree.bbclass
+++ b/meta/classes-recipe/kernel-devicetree.bbclass
@@ -82,7 +82,7 @@ do_install:append() {
 	for dtbf in ${KERNEL_DEVICETREE}; do
 		dtb=`normalize_dtb "$dtbf"`
 		dtb_path=`get_real_dtb_path_in_kernel "$dtb"`
-		if [ ${KERNEL_DTBVENDORED} == "false" ]; then
+		if "${@'false' if oe.types.boolean(d.getVar('KERNEL_DTBVENDORED')) else 'true'}"; then
 			dtb_ext=${dtb##*.}
 			dtb_base_name=`basename $dtb .$dtb_ext`
 			dtb=$dtb_base_name.$dtb_ext
@@ -97,7 +97,7 @@ do_deploy:append() {
 		dtb_ext=${dtb##*.}
 		dtb_base_name=`basename $dtb .$dtb_ext`
 		install -d $deployDir
-		if [ ${KERNEL_DTBVENDORED} == "false" ]; then
+		if "${@'false' if oe.types.boolean(d.getVar('KERNEL_DTBVENDORED')) else 'true'}"; then
 			dtb=$dtb_base_name.$dtb_ext
 		fi
 		install -m 0644 ${D}/${KERNEL_DTBDEST}/$dtb $deployDir/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 8f022b234d..4bce64cf6a 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -216,7 +216,7 @@ KERNEL_RELEASE ?= "${KERNEL_VERSION}"
 KERNEL_OUTPUT_DIR ?= "arch/${ARCH}/boot"
 KERNEL_IMAGEDEST ?= "boot"
 KERNEL_DTBDEST ?= "${KERNEL_IMAGEDEST}"
-KERNEL_DTBVENDORED ?= "false"
+KERNEL_DTBVENDORED ?= "0"
 
 #
 # configuration
-- 
2.40.1


