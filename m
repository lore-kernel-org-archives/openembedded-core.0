Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F820C0219B
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 17:44:06 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.web11.42524.1738852059474798823
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 06:27:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=NnJXzPWL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: daniel.mueller@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516EOvoq016171
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Feb 2025 14:27:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=S-DKIM-20210427; bh=0isbM
	hD1np8yERgaiWymyB8sbCVzcSB9Qoa182zUTts=; b=NnJXzPWLdDoMx2xViic4/
	OjiXMhvtVZ7a+rAHHB936bKWpb5LBe3XOovntfHOG59dN8CoQRh301Au0zw2AaCP
	H+IhoDnPDtp1YLrfODus8Fmilx53AF0EO3BFruUwHNqqdwC9mPKJlglM4uLazx+X
	9T/aioXntJEiL+eBnkccX2NCm/Ta8/YIkZ8/jBYNTTSSpD+fL3V8ohkQtB/n8F94
	9hAdhyiXHpL96O1G3COMN0pbOLZl33ro7Hyb14/mNSIF8UBUJcs6ZcQxRFvfoGDq
	CZH13pYF+YMlNGZrz47y/dA4pJh0R8hE/nsmjMOa3VyxMHnB9hXLqYUOy554a/YW
	w==
Received: from tut-ex22-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 44mv18sb6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 14:27:37 +0000 (GMT)
Received: from TUT-EX20-PV.KSTG.corp (10.0.10.224) by TUT-EX22-PV.KSTG.corp
 (10.0.10.226) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 6 Feb
 2025 15:27:36 +0100
Received: from TUT-EX23-PV.KSTG.corp (10.0.10.227) by TUT-EX20-PV.KSTG.corp
 (10.0.10.224) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 6 Feb
 2025 15:27:36 +0100
Received: from tutn-2ybjpn3.fritz.box (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.227) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Thu, 6 Feb 2025 15:27:36 +0100
From: "Mueller, Daniel" <Daniel.Mueller@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: "Mueller, Daniel" <daniel.mueller@karlstorz.com>
Subject: [PATCH 0/3] Fix incorrect dependencies between multiconfigs
Date: Thu, 6 Feb 2025 15:22:06 +0100
Message-ID: <20250206142603.3870360-2-daniel.mueller@karlstorz.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Proofpoint-GUID: oevui_QqB2ztq4wrXcRE7iDWeYKbfD5F
X-Proofpoint-ORIG-GUID: oevui_QqB2ztq4wrXcRE7iDWeYKbfD5F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 17:44:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210956

This branch fixes some incorrect initramfs dependency handling between
multiconfigs in case the current multiconfig isn't the default.

It also removes the dependency between fitImage and initramfs in case
the initramfs is already bundled within the kernel.

Sebastian Zenker (1):
  kernel.bbclass: Handle possible multiconfig.

Weisser, Pascal (2):
  kernel-fitImage.bbclass: Handle possible multiconfig.
  kernel-fitImage.bbclass: Remove dependeny on initramfs image when
    bundled.

 meta/classes-recipe/kernel-fitimage.bbclass | 12 +++++++++---
 meta/classes-recipe/kernel.bbclass          |  5 ++++-
 2 files changed, 13 insertions(+), 4 deletions(-)


