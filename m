Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66CCBC28B28
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 10:50:04 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.web10.8888.1742294996146339123
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 03:49:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=IGOVIhBB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IAHlu2031389
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 10:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=S-DKIM-20210427; bh=GxoLo
	vTdW627OF+c6P4z5n6dmaG8yKqp15o4PwNaEYk=; b=IGOVIhBBjFxNIgVLCpeXs
	ffvePhaVF3a9XOIIAZY1ZQaiO/88WTUfbC6PZpzGTUpZfijxh1gPz9TPhvWz5pv3
	G3/BtyEWA1qdRd7FXBFVNGMZin/dh+7PIDcqO52Igds+MjLezYurLwPeuFHEDISm
	QWjt/93ZrOZnp+2+L9gIyJg+Arg+fhLNRUIrxLB+OzqjRT3ZlHjvHkzym0c0bmVU
	T++F0O5MVS31pTFEgqnv10EyzVYXogQzSlGCQdjv9wXJLKlwvhXU27/3nabWJMlJ
	DIfHcZP8Np91gKHD56/+qyxXnIYenW9ELtsQ+ctoq6oosZ8J9zf2APRJt0u/lezX
	Q==
Received: from tut-ex22-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 45ev42bj3k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 10:49:54 +0000 (GMT)
Received: from TUT-EX21-PV.KSTG.corp (10.0.10.225) by TUT-EX22-PV.KSTG.corp
 (10.0.10.226) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 18 Mar
 2025 11:49:53 +0100
Received: from TUT-EX22-PV.KSTG.corp (10.0.10.226) by TUT-EX21-PV.KSTG.corp
 (10.0.10.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 18 Mar
 2025 11:49:53 +0100
Received: from tutn-bpfb5m3.fritz.box (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.226) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Tue, 18 Mar 2025 11:49:53 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [PATCH 0/3] Resolve YOCTO #14520 and YOCTO #15525.
Date: Tue, 18 Mar 2025 11:48:50 +0100
Message-ID: <20250318104853.1442703-1-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ywx7eHzQ8egxn1KjOtiaeEBheb3RTqSF
X-Authority-Analysis: v=2.4 cv=O+s5vA9W c=1 sm=1 tr=0 ts=67d94fd2 cx=c_pps a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17 a=Vs1iUdzkB0EA:10 a=fBH9Nxk1o1j9_tSq3lUA:9
X-Proofpoint-GUID: ywx7eHzQ8egxn1KjOtiaeEBheb3RTqSF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_05,2025-03-17_03,2024-11-22_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 10:50:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213199

This patch series resolves the issues YOCTO #14520 and YOCTO #15525.

Weisser, Pascal (3):
  Revert "qemuboot: Trigger write_qemuboot_conf task on changes of
    kernel image realpath"
  qemuboot: Trigger do_write_qemuboot_conf task on bundled initramfs
    changes
  qemuboot: Provide default value for INITRAMFS_LINK_NAME

 meta/classes-recipe/qemuboot.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.48.1


