Return-Path: <Daniel.Mueller@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90CAAC02198
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 14:07:01 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.web10.20176.1739887612472090517
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 06:06:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=mZpCF2LO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: daniel.mueller@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51IE26lC023008;
	Tue, 18 Feb 2025 14:06:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=lpk6Ne4lqzGghiGL4k/9qFqRznAS5w8gek495THBBNg=; b=
	mZpCF2LOkuH6dBRU7v6s/gmpnaes4zZf7n8GqUuSnRAKR+/+ixP0Kpj7PBCJbiF2
	WNC5wNAzm0/08xvHeoMhKF4UpBUV/8NSj+wSzTEt/NB1f4hnETzV6HySXDXGEO5I
	57vaN4GSZIOaIQqsxkKvQKA4nn+omWIXPVYCR50vQupjwIyINzsTvKQnXhkUGf+c
	vRHHfiFddYO5DM/g7bGtUOu7hhcQKifsgkgEWwq5ZdgcMLBLkgPcipHWnZ2cmg+f
	TdKkdyTRebqmiyC3YCqssVDMwGVhsUvyq9xM5uS1WIwaYLB5lbS9ktSnwjwDkZ7O
	k3wBwOid/25gaGKAeFKnvg==
Received: from tut-ex23-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 44tkq1veeg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 14:06:49 +0000 (GMT)
Received: from TUT-EX21-PV.KSTG.corp (10.0.10.225) by TUT-EX23-PV.KSTG.corp
 (10.0.10.227) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 18 Feb
 2025 15:06:48 +0100
Received: from TUT-EX23-PV.KSTG.corp (10.0.10.227) by TUT-EX21-PV.KSTG.corp
 (10.0.10.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 18 Feb
 2025 15:06:48 +0100
Received: from tutn-2ybjpn3.KSTG.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.227) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 15:06:48 +0100
From: "Mueller, Daniel" <daniel.mueller@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: Sebastian Zenker <sebastian.zenker@gmx.de>,
        "Mueller, Daniel"
	<daniel.mueller@karlstorz.com>
Subject: [PATCH v2] kernel.bbclass: Handle possible multiconfig.
Date: Tue, 18 Feb 2025 14:54:23 +0100
Message-ID: <20250218140605.3954876-1-daniel.mueller@karlstorz.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <211554>
References: <211554>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: CuRr_3H9XsxA85FS7F6I2diKNGdMtTeQ
X-Proofpoint-GUID: CuRr_3H9XsxA85FS7F6I2diKNGdMtTeQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_06,2025-02-18_01,2024-11-22_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 14:07:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211623

From: Sebastian Zenker <sebastian.zenker@gmx.de>

When specifying the dependencies of do_bundle_initramfs the current
multiconfig might not be the default. This fixes the dependencies between
the multiconfigs if the current differs to default.

Signed-off-by: Mueller, Daniel <daniel.mueller@karlstorz.com>
---
Your right, handling 'default' isn't required anymore, my apologies. I've
reworked the changes and tested them against the master branch.

Please also ignore the other 2 patches of the original patchset, those
have been been integrated into master already.

Regards, Daniel
 meta/classes-recipe/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 617727a989..6fe7c60e17 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -146,7 +146,7 @@ set -e
     # standalone for use by wic and other tools.
     if image:
         if d.getVar('INITRAMFS_MULTICONFIG'):
-            d.appendVarFlag('do_bundle_initramfs', 'mcdepends', ' mc::${INITRAMFS_MULTICONFIG}:${INITRAMFS_IMAGE}:do_image_complete')
+            d.appendVarFlag('do_bundle_initramfs', 'mcdepends', ' mc:${BB_CURRENT_MC}:${INITRAMFS_MULTICONFIG}:${INITRAMFS_IMAGE}:do_image_complete')
         else:
             d.appendVarFlag('do_bundle_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
     if image and bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE')):

