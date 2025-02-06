Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F842C02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 12:50:25 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.web11.40002.1738846221646613226
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 04:50:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=f10P8CMG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516BKISA012633
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Feb 2025 12:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=S-DKIM-20210427; bh=tbS29
	HNIjhW4e3wnZvTzAPufq6rR41N/1X/bxlV6cmI=; b=f10P8CMGYdp2uX9YVx42u
	uuoPPBaGoaedfSMDFdkRQmSbQRa1gsDTdScXHGk6zHmtplCeDBrk3ZJ3gWqvdtoG
	eFmJBdjBnRACYngXyqsIIsbnb/PzA176S0Ua3TLkADTe4ebPKYTQrl1e1OtvBw2p
	53WhM1TzRoeGQeKnK+XcXZQtfE8u9aoB1SFAeK3gPMRZSFBPv6CrHDWonEEXtuq+
	RImKe9d/ga6hRqtIo2U6Q6TbdSLvCE/w5GdTXKElf8Y2ZJrCviPRqRB2p9CQ2VIn
	1rL2CqxQI098XeGZ+Kb9Bb/rIbxmo3Pvm+/aWKEh/FDvsARexX6JirE2QuHsrqbx
	A==
Received: from tut-ex22-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 44mttkh9kx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 12:50:19 +0000 (GMT)
Received: from TUT-EX22-PV.KSTG.corp (10.0.10.226) by TUT-EX22-PV.KSTG.corp
 (10.0.10.226) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 6 Feb
 2025 13:50:19 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.226) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Thu, 6 Feb 2025 13:50:19 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [PATCH 0/2] This patch series has two goals.
Date: Thu, 6 Feb 2025 13:49:39 +0100
Message-ID: <20250206124941.342980-1-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ul0WwE7P-dEfiiMPCOJ1vp8QKyhJgXR-
X-Proofpoint-GUID: ul0WwE7P-dEfiiMPCOJ1vp8QKyhJgXR-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 12:50:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210930

First, it sets a weak default value for IMAGE_ROOTFS_MAXSIZE.
This helps the recipe linter oelint-adv from meta-sca to be aware
of the existence of this variable.

See https://github.com/priv-kweihmann/oelint-adv/issues/695 for details.

Note: The chosen weak default value actually imposes no limit on the
size of the images as it equals the empty string.

Second, it adds some documentation for the variable IMAGE_ROOTFS_MAXSIZE.

Weisser, Pascal (2):
  bitbake.conf: Add weak default value for IMAGE_ROOTFS_MAXSIZE
  documentation.conf: Add description for IMAGE_ROOTFS_MAXSIZE variable

 meta/conf/bitbake.conf       | 4 ++++
 meta/conf/documentation.conf | 1 +
 2 files changed, 5 insertions(+)

-- 
2.48.1


