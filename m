Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91300C02199
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 17:44:06 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.web11.38108.1738840002768631750
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 03:06:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=AvuBGqb+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516Ae0R2010141
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Feb 2025 11:06:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=S-DKIM-20210427; bh=tbS29
	HNIjhW4e3wnZvTzAPufq6rR41N/1X/bxlV6cmI=; b=AvuBGqb+Uzn2QgQNuU7IB
	5ow6lav90DkpApILjo5EbLuBJBUFsr6VijZW+C0S/HAuqtyvW2ks+GWcsnnBKim1
	+ga6WopPJ0vr4e97GIetd9l1/qIvWlbNAP8iA/wuDhw51TtbrTziCKXWxSsJ9Qxr
	RJIaRaIieakaygaidAAoYl1/Hux1AIaJmS2KPddvgyANSTRuNzADbaSdc7lhDkqm
	VQhY9WIIB+j/ISL8aiZbRWEnxDUbaAvk3NYyXHNuUTgRYXWc7Uo6W6ufj8jQy/yc
	X+Aa/R7PPSNxlz0b+yhrQloG7+98AN36p/gB4kZLh2RyWZDXZ7E0dKXlWX8I4qJ5
	g==
Received: from tut-ex23-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 44mttkgmt8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 11:06:40 +0000 (GMT)
Received: from TUT-EX21-PV.KSTG.corp (10.0.10.225) by TUT-EX23-PV.KSTG.corp
 (10.0.10.227) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 6 Feb
 2025 12:06:40 +0100
Received: from TUT-EX23-PV.KSTG.corp (10.0.10.227) by TUT-EX21-PV.KSTG.corp
 (10.0.10.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 6 Feb
 2025 12:06:39 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.227) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Thu, 6 Feb 2025 12:06:39 +0100
From: "Weisser, Pascal.ext" <Pascal.Weisser.ext@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [PATCH 0/2] This patch series has two goals.
Date: Thu, 6 Feb 2025 12:06:13 +0100
Message-ID: <20250206110615.291324-1-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: ZY3Ccbq_hChAyNQVbb7JdCPe5Xo04WJz
X-Proofpoint-GUID: ZY3Ccbq_hChAyNQVbb7JdCPe5Xo04WJz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 17:44:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210953

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


