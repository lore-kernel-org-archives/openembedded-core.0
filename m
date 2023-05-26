Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F46C77B7A
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 23:36:37 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.1589.1685144186748755908
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 May 2023 16:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vo7xqqeE;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34QNaJ62081727;
	Fri, 26 May 2023 18:36:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685144179;
	bh=Vnb9KOYlK+6LSgHR7Phs7zRvgcusa9MKyQWSqWSmEts=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=vo7xqqeErJgQl7ODP+WLUAeKVy80gUl9p2DPcG5t06/2bv9O14N4265k/qkPkwCdu
	 P/5E3pMP2NrsDqM+osvOPOVT4v2+Akg+g2a9grqOUfJG4FVfQJY4EE4anDgMFlbkJB
	 C9vGCteOp/K7K3Bt8R5UZZn3lA8hqhJC9u+8dOaM=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34QNaJnA023330
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 May 2023 18:36:19 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 May 2023 18:36:19 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 May 2023 18:36:19 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34QNaJ4J013670;
	Fri, 26 May 2023 18:36:19 -0500
From: <rs@ti.com>
To: <steve@sakoman.com>, <reatmon@ti.com>, <denis@denix.org>
CC: <openembedded-core@lists.openembedded.org>,
        Martin Jansa
	<Martin.Jansa@gmail.com>, Randolph Sapp <rs@ti.com>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>
Subject: [OE-core][kirkstone][PATCH 2/4] kernel-devicetree: make shell scripts posix compliant
Date: Fri, 26 May 2023 18:36:14 -0500
Message-ID: <20230526233616.3623368-3-rs@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526233616.3623368-1-rs@ti.com>
References: <20230526233616.3623368-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 23:36:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181782

From: Martin Jansa <Martin.Jansa@gmail.com>

Use the notation suggested by Martin Jansa to avoid a bashism. Also
switch KERNEL_DTBVENDORED to the more common 0/1 notation instead of
true/false.

Fixes: 04ab57d200 (kernel-devicetree: allow specification of dtb
directory, 2023-05-02)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 meta/classes/kernel-devicetree.bbclass | 4 ++--
 meta/classes/kernel.bbclass            | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index 11b57adc92c..e1e67cbc56c 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -76,7 +76,7 @@ do_install:append() {
 	for dtbf in ${KERNEL_DEVICETREE}; do
 		dtb=`normalize_dtb "$dtbf"`
 		dtb_path=`get_real_dtb_path_in_kernel "$dtb"`
-		if [ ${KERNEL_DTBVENDORED} == "false" ]; then
+		if "${@'false' if oe.types.boolean(d.getVar('KERNEL_DTBVENDORED')) else 'true'}"; then
 			dtb_ext=${dtb##*.}
 			dtb_base_name=`basename $dtb .$dtb_ext`
 			dtb=$dtb_base_name.$dtb_ext
@@ -91,7 +91,7 @@ do_deploy:append() {
 		dtb_ext=${dtb##*.}
 		dtb_base_name=`basename $dtb .$dtb_ext`
 		install -d $deployDir
-		if [ ${KERNEL_DTBVENDORED} == "false" ]; then
+		if "${@'false' if oe.types.boolean(d.getVar('KERNEL_DTBVENDORED')) else 'true'}"; then
 			dtb=$dtb_base_name.$dtb_ext
 		fi
 		install -m 0644 ${D}/${KERNEL_DTBDEST}/$dtb $deployDir/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 87dd46e6fa3..3d5422b09ed 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -211,7 +211,7 @@ KERNEL_RELEASE ?= "${KERNEL_VERSION}"
 KERNEL_OUTPUT_DIR ?= "arch/${ARCH}/boot"
 KERNEL_IMAGEDEST ?= "boot"
 KERNEL_DTBDEST ?= "${KERNEL_IMAGEDEST}"
-KERNEL_DTBVENDORED ?= "false"
+KERNEL_DTBVENDORED ?= "0"
 
 #
 # configuration
-- 
2.40.1


