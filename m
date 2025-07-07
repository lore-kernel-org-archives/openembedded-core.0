Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B96BBC83F07
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 08:29:26 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.web10.55085.1751876959755695562
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jul 2025 01:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=SCzUAUqS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5672M9Tt015129
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Jul 2025 08:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=wo04x7VxjazqVmesd8TReRXa951StpT/pbzwtYYH+bI=; b=
	SCzUAUqSxRCmpivP/AwaSl9gi5qeElHgocfu/N9rdhMCV6Bp2ffQe8/fskRpRFgk
	Dkx9uQ6ogwoFad9J3rz9KBVxCs2pHPlzYL2VAMFvfbfDinjmjAZZ15SiiKGRkICf
	aYkhjdXnHESWraBvJTfh6wjP/TT5BdIFdNe92TIi+m+UMRMY+eqX324TW9BBOBjl
	pu8TsfX9EgBj3VDYc5OD4HHnDfnwIVwgfL8K5KU8/Craxv1EF5OonuQqeDSEhZSz
	XNH7iVYFZkxDeszhYklo28eLfmYZC2F2wrcCG/JRYXrYs9RMGcLFfrX40m8oIZY9
	sEPqh1GjoRcKxoGS5fX+0Q==
Received: from tut-ex22-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 47ptygkhr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 08:29:17 +0000 (GMT)
Received: from TUT-EX23-PV.KSTG.corp (10.0.10.227) by TUT-EX22-PV.KSTG.corp
 (10.0.10.226) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.27; Mon, 7 Jul
 2025 10:29:17 +0200
Received: from tutn-bpfb5m3.fritz.box (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.227) with Microsoft SMTP Server id
 15.2.1544.27 via Frontend Transport; Mon, 7 Jul 2025 10:29:16 +0200
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [PATCH 1/1] systemd: add rdepends on libnss-resolve to nss-resolve PACKAGECONFIG
Date: Mon, 7 Jul 2025 10:28:50 +0200
Message-ID: <20250707082850.600964-2-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707082850.600964-1-pascal.weisser.ext@karlstorz.com>
References: <20250707082850.600964-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: EhpOOA4ng0NrYwRnUpMo7aR41l40Z0jN
X-Authority-Analysis: v=2.4 cv=VbH3PEp9 c=1 sm=1 tr=0 ts=686b855d cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=Wb1JkmetP80A:10 a=n9SCklZpAAAA:8 a=wbpVGVEKAXn_3VAFGL8A:9
 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA0OCBTYWx0ZWRfX0AedB4WtrgEO
 lVmzT2ieypKY5K2A/9GNlxkwVdu9hPFaaqFdf7GMclN3+ii7cmCgVULqt/nxKf9DumS5YVcLG3U
 NYY8Wb78hqpAjMoKL/KI4jDVLKjOxpyrGJQ0bau16BPn0f4etL7d8NpGOvlyd1LBipEOrsppvHT
 W2gxHutFNFP8Kp0ZKrdJ+IFwPnk6c2rNCacrzOfSBWThw3eRZ9saAO0lSNKrv9Cu1PqTG6Rgps9
 qs8jizhqaVeZ+1TqZRAqHKt8/VavfE9Wy4L6AMXrUoozMq4Y+JjSighoDsFp6cH2V3kFb6WXctG
 T2/6m+Ks6CrvlimZjZSp/jeS4LlVAGEumZqU149V4MfzjZ6izVB2cSTicH2HMePn8/MIi8bES7B
 TNW/k6lEtXxQ3Dm/M6si77fwDZoaPQExUMyyUxT02q20/CcxHccB/IXHVMSsnQ67Ep4Hmk05
X-Proofpoint-ORIG-GUID: EhpOOA4ng0NrYwRnUpMo7aR41l40Z0jN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 08:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219982

Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
---
 meta/recipes-core/systemd/systemd_257.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_257.6.bb b/meta/recipes-core/systemd/systemd_257.6.bb
index 5f7f20c434..9092d02c51 100644
--- a/meta/recipes-core/systemd/systemd_257.6.bb
+++ b/meta/recipes-core/systemd/systemd_257.6.bb
@@ -189,7 +189,7 @@ PACKAGECONFIG[no-dns-fallback] = "-Ddns-servers="
 PACKAGECONFIG[no-ntp-fallback] = "-Dntp-servers="
 PACKAGECONFIG[nss] = "-Dnss-systemd=true,-Dnss-systemd=false,,libnss-systemd"
 PACKAGECONFIG[nss-mymachines] = "-Dnss-mymachines=enabled,-Dnss-mymachines=disabled"
-PACKAGECONFIG[nss-resolve] = "-Dnss-resolve=enabled,-Dnss-resolve=disabled"
+PACKAGECONFIG[nss-resolve] = "-Dnss-resolve=enabled,-Dnss-resolve=disabled,,libnss-resolve"
 PACKAGECONFIG[oomd] = "-Doomd=true,-Doomd=false"
 PACKAGECONFIG[openssl] = "-Dopenssl=enabled,-Dopenssl=disabled,openssl"
 PACKAGECONFIG[p11kit] = "-Dp11kit=enabled,-Dp11kit=disabled,p11-kit"
-- 
2.49.0


