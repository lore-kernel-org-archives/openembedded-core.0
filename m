Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF5DFC83F09
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 15:30:44 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.web10.21718.1751988636152427429
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 08:30:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=MLA/bGJU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5683DTwk023304
	for <openembedded-core@lists.openembedded.org>; Tue, 8 Jul 2025 15:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=S-DKIM-20210427; bh=9/YmS
	W7vInFGgVGAfSZTGBB93UTrA+J8Sv1BhVt+YZ8=; b=MLA/bGJURMuWClvpqoHpQ
	Dt4YY/Po7udF2gOuxvxQLClL0O+D4Heb5nK/ANpAtkXGLByso0qkGPeBblrrBiA2
	428Kmg6rX4lrc8Cw0G1QFyYNFsk/9MOWpivqCe1Nc7WZjW00hYeIVeysAPXAtGat
	qXyQp57qH2YyQNAmF5lOBzy/0Vk+q58qk1YX0pytKVUzDKXIZ2uECd3xaQDLnnpR
	PrnITAO44qx+Wd2CCjBasSIkMNBWPdFQS78dQBuUfamyTQBBI6RMC7hrAghMha3I
	p6iHBr+swm6hXqwYjHDC8x62LCPYEIRi/VqqJB85gfPunNbzGWIEaP0tsbpH14HU
	g==
Received: from tut-ex22-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 47ptygsa7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 15:30:34 +0000 (GMT)
Received: from TUT-EX22-PV.KSTG.corp (10.0.10.226) by TUT-EX22-PV.KSTG.corp
 (10.0.10.226) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.27; Tue, 8 Jul
 2025 17:30:33 +0200
Received: from tutn-bpfb5m3.fritz.box (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.226) with Microsoft SMTP Server id
 15.2.1544.27 via Frontend Transport; Tue, 8 Jul 2025 17:30:33 +0200
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [PATCH v3 0/1] systemd: add rdepends on libnss-resolve to nss-resolve PACKAGECONFIG
Date: Tue, 8 Jul 2025 17:30:29 +0200
Message-ID: <20250708153030.3324742-1-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: vjUe5yUQ0ShAJRjLPx1IhbTL-KhogfSK
X-Authority-Analysis: v=2.4 cv=VbH3PEp9 c=1 sm=1 tr=0 ts=686d399a cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=Wb1JkmetP80A:10 a=5shIuoPJFnzS0fhVv8wA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDEzMCBTYWx0ZWRfX8D3i5XJUaHj/
 CvA/QJ90NzeCYDdlIpuj505gzmUAQA+2ann10iIuO8Mx2IeSI3S37bm/+0mVzmIiwROTXbsQ/FH
 nUpBY2Sh39LNmrxxmma3qcTcJYFEP1guIyXHMAZmrCKOBdQ+kS3uwUc0gRknt+ajSn/LCOFJd7e
 8Xs3UM0luhqGzTCUxvv4bjpYsJYAL1Dpwy8jyavnItP6+ExJAbPw3gNQU0UiBVb1rCQtRKRatDB
 5yPF/xf4QvJidsDaT2AvyO/PZRj7l4e6wNIZRs9g4vPgOeQMAPMejz7VTT2yGX+71qZEzmmIXwk
 fZFa3qO6KOPnE0LrJhwZUxvY+ASfmIkUnNOdtHx5RJKWbgBe4b9G7f6ONF6t8uckTgpWhLhv5Pb
 k/whA6ZUNK2eUGkbIhNTmR20XERncf3sy+1IxtWfplV6ZOUsafREYHbZTicgo/URVZnniEKQ
X-Proofpoint-ORIG-GUID: vjUe5yUQ0ShAJRjLPx1IhbTL-KhogfSK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_04,2025-07-07_01,2025-03-28_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 15:30:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220048


Weisser, Pascal (1):
  systemd: add rdepends on libnss-resolve to nss-resolve PACKAGECONFIG

 meta/recipes-core/systemd/systemd_257.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.49.0


