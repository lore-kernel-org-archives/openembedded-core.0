Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F88EA3F1F
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 07:10:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14890.1770707446447475378
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 23:10:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Ko9ox7s+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6501c5c083=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A4uQ2v1403957
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 07:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=KtFT9gyEJSodtzPY9e7/GNhx62VdNV2KmqnILlKgNP0=; b=Ko9ox7s+Eu3s
	qIcpi568bmVm4uxbrz7PLbV3VV9kiBNWjZ7v2JKmwogWn0v8xCdwaFFbM93Alkq0
	NYz+JcnitHnLZmS9IZKWso6NelJAnuJ9iey2fPkiliIdCYU45ADux22ntwafu41+
	Iy0/f9K9ztU3RuD/772v3UmWp6alSlubzyN8hLouMwrb3XnewsmakI2hUqeKZZPh
	BBZAVvTq07kozH6HXIG3AR2RmtHTRgUDsT6L3zPJEGXs2FAbi0kL6GmEpdjv7DSn
	iYTUqCoHZ6MSAEhLNPl7yufJtJev3hAnUGlT9f71i7+aNgaPamTxHf0eva//B3o7
	MrnJoSDGRQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5tkwk0fb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 07:10:45 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 9 Feb 2026 23:10:44 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 9 Feb 2026 23:10:44 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v4 6/7] target-sdk-provides-dummy: Add pkg-config to DUMMYPROVIDES
Date: Mon, 9 Feb 2026 23:10:41 -0800
Message-ID: <08e1b29e8f5c5f664b6f216f35fa17c42731a01d.1770707181.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <cover.1770707181.git.liezhi.yang@windriver.com>
References: <cover.1770707181.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=bvBBxUai c=1 sm=1 tr=0 ts=698ad9f5 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=t7CeM3EgAAAA:8 a=EPt98Hgs1p76gYlZTCoA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 3cVo4OgHZ6bkdIUgmdt8Zx2uxTrCo_LN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA1OSBTYWx0ZWRfX4GvknYBC5EuO
 yzmyiQ3c3wmnGoK7DX5UzIF+pKF4a3WB7JLTGfUMYS0v/9UOdB0XpB2ZpdFjyZS5XnQ+xtI0bdO
 OMuV/CnTvig20BCePF1FtaYlnVAekwoJ8VUNRF0TViN6AeBr/5FcSfHLW6wZI70UBvrAkCm1wEj
 1UUJAVEro1Y3Im13iiTJ67GH+7J56IqDhsc76iIExEknnjugHwRXPqsJENDvkvjn1NswuEfHmPp
 IzUWY4n/osTSb2j3TGQu68KxSoPEiZGFl3enP5NZ/7yN21OBdRjr90M2EjfaCIPfC5akRWqav/W
 m/5XfUxzr+mZ5U3ng4wpCSuvO1zaRyNGJ4Ct3t9lz9VDsI1Zukx1CncPEQz5UB7A657pZ8s64Wb
 aqwxgCOSUwqudj1pgdzvAbTrEzHNBTjBXkNBVamvJ3FTcqPvkoNwZKvhldNVAIFwNzJQgi6XJ3d
 Z/YEafVI9Uuqlpv1qLA==
X-Proofpoint-ORIG-GUID: 3cVo4OgHZ6bkdIUgmdt8Zx2uxTrCo_LN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 07:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230858

From: Robert Yang <liezhi.yang@windriver.com>

The rpm package requires /usr/bin/pkg-config when it has .pc files.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/meta/target-sdk-provides-dummy.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
index 849407cca5..618016b315 100644
--- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
@@ -52,6 +52,7 @@ DUMMYPROVIDES = "\
     /bin/bash \
     /usr/bin/env \
     /usr/bin/perl \
+    /usr/bin/pkg-config \
     libperl.so.5 \
     libperl.so.5()(64bit) \
 "
-- 
2.49.1


