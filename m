Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E2EC02196
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 08:55:33 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.web11.35590.1738830461624174169
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 00:27:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=V/mAtpSN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5168K0YF021548
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Feb 2025 08:27:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=S-DKIM-20210427; bh=eU7R7
	OkSKVi91/wgHfhY2xz6tRAfXRLP6ctna/1Yorw=; b=V/mAtpSNc/gE1Lm764k5U
	snnWur9BpDlUGw757WPLdkWPiKUfWBwo14huTuk9wfNhJ1QtiWZxy5OuJqcq36v6
	Mxa1Lsrex+VNbg7rwOMa3zZHxMxnyvHbtDNCrdfwU9rPPtkmmVeG4xR5Xl6yrnXy
	lHyFiaTR4Tm0IfFe/+5WA6nQ94NbHJ89mUD1UkUfDmOt+vqM5qKBIH4pxBGchmz6
	OF1EagOga4j1/GbU5A1fyqdlImAyMLZpMlpuTrd6QzD0iuYAsyu4mslJUF2h1h03
	Yst0sa/ylJuqIAi/JDJJ1ENZuVQZ3iHEuyWujHS0RnTSfPHbKtHQauxq5DZdVykh
	w==
Received: from tut-ex23-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 44mqcegp3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 08:27:39 +0000 (GMT)
Received: from TUT-EX23-PV.KSTG.corp (10.0.10.227) by TUT-EX23-PV.KSTG.corp
 (10.0.10.227) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 6 Feb
 2025 09:27:38 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.227) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Thu, 6 Feb 2025 09:27:38 +0100
From: "Weisser, Pascal.ext" <Pascal.Weisser.ext@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [PATCH 0/2] This patch series improves the kernel-fitimage.bbclass.
Date: Thu, 6 Feb 2025 09:26:55 +0100
Message-ID: <20250206082657.209052-1-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: GWd2QNVht5wb3hZY0a_MR93WX_iBduwt
X-Proofpoint-GUID: GWd2QNVht5wb3hZY0a_MR93WX_iBduwt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_01,2025-02-05_03,2024-11-22_01
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 08:55:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210908

First, it takes into account that the initramfs might
be built with another multiconfig.

Second, an unnecessary dependency is dropped in case the
initramfs is already bundled into the kernel.

Weisser, Pascal (2):
  kernel-fitImage: Take possible multiconfig into account.
  kernel-fitImage: Remove dependeny on initramfs image when bundled.

 meta/classes-recipe/kernel-fitimage.bbclass | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

-- 
2.48.1


