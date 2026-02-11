Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13CCFEB595D
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 03:20:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10722.1770780017891432538
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 19:20:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FfPtPbb+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6502e9d17b=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B1U2KR3781698
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 19:20:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=KtFT9gyEJSodtzPY9e7/GNhx62VdNV2KmqnILlKgNP0=; b=FfPtPbb+HjH6
	xV2bEcqE9s3pgmRRiDuHRIf0xY7I+Rsumbjk/T3+X9M69sNSc8Do2Iyr/AROPruG
	dO9g25kas5wT0tdnhde2kbEp23h5u1VhWDT+KlOWOYQ8uq5olENZUIlIHiZe6p98
	BZAW1PvcSLfgarXv6dOodMnZ8WXGscFigwz0OwYW5T/v+sIt61fu0QNfs6uZ/7lX
	ow9lvF0dOez1UpdyZIBMO/zx8e1als32zMbbj+GmWuXXry2Dbd6ZjfqpHHfJPnoy
	jN9LAVQhx8EXvYeqL6YVZRSa4/uoORbBexUzAbo99fxZCgciUD3n4kSnAtzpFJmY
	mJwoDd+hSg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c61j4uyx9-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 19:20:17 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 10 Feb 2026 19:20:15 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 10 Feb 2026 19:20:15 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v5 6/7] target-sdk-provides-dummy: Add pkg-config to DUMMYPROVIDES
Date: Tue, 10 Feb 2026 19:20:13 -0800
Message-ID: <a13b352aa0ce63bce8a60687edd15c11f353c85a.1770779786.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <cover.1770779786.git.liezhi.yang@windriver.com>
References: <cover.1770779786.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Wb0BqkhX c=1 sm=1 tr=0 ts=698bf571 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=t7CeM3EgAAAA:8 a=EPt98Hgs1p76gYlZTCoA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: boeczH9HWu0v2NLwtXxgSi-hIef0w9sl
X-Proofpoint-GUID: boeczH9HWu0v2NLwtXxgSi-hIef0w9sl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDAyNSBTYWx0ZWRfX+yMApadJe8Jf
 6k+0gCjGupo9iekwU9CnXWvXKm1GGoFR1LRTAEzebX5LBo8nRaMmoIU4c0Y+72+IAsf8UcrEg+n
 saCeKaK+ks8bqJLSuYVnbz1i/CIx+xozRfKakbCuBJt3NwqlEBq3yBEfq0uJ6ymYQcCKYi2JNDG
 8j0f5HMrzaGRnWyLXzm5yu/8MPQ1e7oL33CQc43aUNMBpkBUCTC30mYOUT+HM8DIx9rfKKqMQ2v
 a0nAub78L76k5A5Om+660ZDV8nOm6RqcUtvi6nnf31QZlyfKDnpJwgy7soi5Pjxz5MtBinjXvCN
 cqF1HK0h6HTDAfNeITA8plxyq7QWFXCpJRt8pRVyBZi8X28WgNGCsbD0HflVZuzroF7NCxDd716
 6YJqVixecJzPCnLPYUXTZQGYMKR6ebTMnLjxOhJz/s3VMyM57FHKxEP7ysBIFb/LRPiSsQFnMQ6
 SZR7m2iLgA3i5JmpdVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 03:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230956

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


