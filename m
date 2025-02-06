Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FBA6C0219E
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 17:44:06 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.web11.42528.1738852061918004303
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 06:27:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=nNIbG8U8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: daniel.mueller@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516DCYH6007047;
	Thu, 6 Feb 2025 14:27:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=oTjOfI4sX9GyyjHuGzw/OvkRrAH1Frp7Kr9lcV4X+0E=; b=
	nNIbG8U8ukEXQiC6NY9mojhAo6en3Ur09hpxyk/Ly+LQ7/jRza+KC9Zz0cEOfLdX
	QUQw4p8jODKkb+4p2MY9uczRDjG4gaaqyGt2o4qISD2LsLLckntoTQySpwWzra5E
	DW8/c8nQZ+L8FY0ehZlOMHufXohp/Q1nibM0garbXwZluApEWB3ncgogoOT+O+wK
	T1sW/avs3nn+yTrXaGF8cmeJxgrqG98w1nL4pMEIvw2WCdmNu5SJJD+NF91e7DDU
	CNLCEKdLxG1Td85BfJwwot2P5Q6E2Jr/4e8IpqgK9Et317vI6tCdTdenYIBpMGoP
	eW4uIBPBexIFnDSzjjdllA==
Received: from tut-ex22-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 44mwrugh8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 14:27:39 +0000 (GMT)
Received: from TUT-EX21-PV.KSTG.corp (10.0.10.225) by TUT-EX22-PV.KSTG.corp
 (10.0.10.226) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 6 Feb
 2025 15:27:38 +0100
Received: from TUT-EX23-PV.KSTG.corp (10.0.10.227) by TUT-EX21-PV.KSTG.corp
 (10.0.10.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 6 Feb
 2025 15:27:38 +0100
Received: from tutn-2ybjpn3.fritz.box (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.227) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Thu, 6 Feb 2025 15:27:38 +0100
From: "Mueller, Daniel" <Daniel.Mueller@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: Sebastian Zenker <sebastian.zenker@gmx.de>,
        "Mueller, Daniel"
	<daniel.mueller@karlstorz.com>
Subject: [PATCH 1/3] kernel.bbclass: Handle possible multiconfig.
Date: Thu, 6 Feb 2025 15:22:07 +0100
Message-ID: <20250206142603.3870360-3-daniel.mueller@karlstorz.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206142603.3870360-2-daniel.mueller@karlstorz.com>
References: <20250206142603.3870360-2-daniel.mueller@karlstorz.com>
MIME-Version: 1.0
X-Proofpoint-GUID: m_9COg4QKbUk22tKqhvRQGhPbXpj0vXh
X-Proofpoint-ORIG-GUID: m_9COg4QKbUk22tKqhvRQGhPbXpj0vXh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 17:44:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210957

From: Sebastian Zenker <sebastian.zenker@gmx.de>

When specifying the dependencies of do_bundle_initramfs the current
multiconfig might not be the default. This fixes the dependencies between
the multiconfigs if the current differs to default.

Signed-off-by: Mueller, Daniel <daniel.mueller@karlstorz.com>
---
 meta/classes-recipe/kernel.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 617727a989..9276ddb62a 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -146,7 +146,10 @@ set -e
     # standalone for use by wic and other tools.
     if image:
         if d.getVar('INITRAMFS_MULTICONFIG'):
-            d.appendVarFlag('do_bundle_initramfs', 'mcdepends', ' mc::${INITRAMFS_MULTICONFIG}:${INITRAMFS_IMAGE}:do_image_complete')
+            mc = d.getVar('BB_CURRENT_MC')
+            if mc == 'default':
+                mc = ''
+            d.appendVarFlag('do_bundle_initramfs', 'mcdepends', ' mc:' + mc + ':${INITRAMFS_MULTICONFIG}:${INITRAMFS_IMAGE}:do_image_complete')
         else:
             d.appendVarFlag('do_bundle_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
     if image and bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE')):

