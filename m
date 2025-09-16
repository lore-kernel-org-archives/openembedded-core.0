Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35178CAC59B
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 04:09:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11302.1757995777022790568
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 21:09:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GW1369nN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=135445e4e1=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58G2nKAW1619279;
	Tue, 16 Sep 2025 04:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=fPm1hriaU5hFWLuLUcs12UnKymSUf8bGuWncl9MKt3Q=; b=
	GW1369nNm1QkRe2auovYzN8piDYa9EtX2MtfSgCJ5LMrD++Bsq8FmxG+p8VoJsSs
	1SCUcyIGPpgymIYVd8G2D9WORNi9WsTQ9fXrpR/78iLmlOUTHGzLkJbpuUJQti2r
	e4+IeZTR5ECTPCZHSES9AA9mZyuzkB6/WEGQ/X//V3NYmesU42/pGYGx4ozuH09v
	03wvYCMv99w1Um5OjQLlQDpAtU+IVhmZksdJu0Gn2TC3IkgW0m04s4yuy/RMCTMd
	QJwcGFNvKUUH4P7OfJ0t6AYOlsJhfmcFak8qrPFzpsecDL8voeX5RtRf65Ql3fGn
	Apo3rE+h/bkvlH74DYZYHw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 494wu130yr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 16 Sep 2025 04:09:33 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 15 Sep 2025 21:09:32 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 15 Sep 2025 21:09:31 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>, <peter.kjellerstedt@axis.com>
Subject: [PATCH 3/8] harfbuzz: set FULL_OPTLEVEL for FULL_OPTIMIZATION
Date: Tue, 16 Sep 2025 12:09:22 +0800
Message-ID: <20250916040927.103722-3-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250916040927.103722-1-hongxu.jia@windriver.com>
References: <20250916040927.103722-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: IU1BVwG4tK9MQFmzZeKfiE0wvEEZUQDz
X-Authority-Analysis: v=2.4 cv=EP8G00ZC c=1 sm=1 tr=0 ts=68c8e2fe cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=3-RhneuVAAAA:8 a=t7CeM3EgAAAA:8 a=cQB7R35s4zw8nPZc72UA:9
 a=VLVLkjT_5ZicWzSuYqSo:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: IU1BVwG4tK9MQFmzZeKfiE0wvEEZUQDz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDAzOCBTYWx0ZWRfX7rP7H8qDP8u/
 r9M2q8UezqsHtJK/CNfU/19yqlmY+DmpG7uwmlMCR9eghat8ITciwjU4T+reuXq0dFK1HxUuVtH
 yagFrAn8OyRknhkRNZICw446AvvEVhDhdh25JaxjfgHLvo43cTpdow/Ag7b/V47PusmQNrVUaPB
 MQWbK+cmALX0GsVtLGTxto8QOnG5Z6iog6ffW7vO0jd0HjMQ7rzwEe9g9njQA0g1XzamI6YQ0tZ
 VzYRsY1yQV+8BD7XCyLDYESjC2k2/zj2xDSlWEaLWIMzpl+WdORtJnFhpvlIXR7u2YfWSJIEfd8
 ksfGLOb7RhY1IiH+70swAhsDSD2m305uDh6MBUIOwMJ0hoo1xwvaotoU5TE47w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 04:09:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223518

Due to commit [distro/include: Add debug_build.inc when DEBUG_BUILD is
enabled] applied, it adds a new variable FULL_OPTLEVEL for optimization level
of FULL_OPTIMIZATION.

Use FULL_OPTLEVEL to instead of FULL_OPTIMIZATION

Suggested-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb
index 9e0e42b717..9934ddcc5d 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb
@@ -21,7 +21,7 @@ GTKDOC_MESON_ENABLE_FLAG = 'enabled'
 GTKDOC_MESON_DISABLE_FLAG = 'disabled'
 
 # As per upstream CONFIG.md, it is recommended to always build with -Os.
-FULL_OPTIMIZATION = "-Os ${DEBUG_LEVELFLAG}"
+FULL_OPTLEVEL = "-Os"
 
 EXTRA_OEMESON = "-Dtests=disabled"
 
-- 
2.34.1


