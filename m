Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4307ACAC59F
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 04:09:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11303.1757995779275474360
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 21:09:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=G48DxmMX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=135445e4e1=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58G3YO3k1273795;
	Tue, 16 Sep 2025 04:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=rsDilw3juBkf275cmWCnSa0vZq7dZdBAxDpmrUNdRxE=; b=
	G48DxmMX8bMgrqF9apn1f9TOwigBy415NjxkvNRyAgYxOOuJDhKAj+drU1hOejky
	sYGZNj6A0A+cVM/aKmMIH7fE7ZVjWntoDcWfZNcb6y8jif489A0FLH1ZA+S/294w
	jGrkN+bos9dxVNO+ADHBm45VZVmk10K1LH+eCjj5reSY2f3zJzuh0/c5eIGGA7AH
	OV3XktznCAZMrJ4hSoMaQ8ICzC2mSkm5hGRHwbeObeRQRmsbqfA1E4P5frT9sOOb
	hHtUs4OHhYkl/7SDRV21EYmTUkNpAIPcOqPYY4j2MEagNNOZSuC9syvCjvUyxZ6U
	8UfT3AKXTkvCW9a1ECxZeA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 496pekrha4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 16 Sep 2025 04:09:36 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 15 Sep 2025 21:09:35 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 15 Sep 2025 21:09:34 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>, <peter.kjellerstedt@axis.com>
Subject: [PATCH v3 5/8] debug_build.inc: allow other layers to add their own debug build configurations
Date: Tue, 16 Sep 2025 12:09:24 +0800
Message-ID: <20250916040927.103722-5-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250916040927.103722-1-hongxu.jia@windriver.com>
References: <20250916040927.103722-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDAzOCBTYWx0ZWRfXza6vNUJWeVTx
 /vTsXCtg2hpXQGd64ov+tJALaoeyRLAG0L9czsxSSkMjhs1xoW+RvitLiSX8n+8hPEv4g2s7QQb
 fMR57RryLYlZ44EPd4Ai2A/EtBc53KWPP3UIWkSb5UFglAuXtW9SvR+s+apNL8G2eS5zfdS6FD2
 h/TYAO5OTjvo7Hkx4B0p7jchHzRwvS0crz1zfT3a41PHy9RcFUuSqHNL9/rTe6jJTUoJIvEiZ4r
 iiVfUSsohaW4WlANy9cbSsa9UufF1gvHd8LN4BTmYRdRKl+b3UB//ZdJlAUV3090q2HZjxT5x+c
 y8cE16EbojRvTR6esh9pEm/aRHVacOYPKzjnPxOi/KFMobkWwI9UfCblgaq55c=
X-Authority-Analysis: v=2.4 cv=DYAXqutW c=1 sm=1 tr=0 ts=68c8e300 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8 a=3-RhneuVAAAA:8 a=t7CeM3EgAAAA:8
 a=HIj-B1EuxZTcql07inMA:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=VLVLkjT_5ZicWzSuYqSo:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: hKvUl2lBXAjF2hxgTcZNE6fdnZlqPiDE
X-Proofpoint-GUID: hKvUl2lBXAjF2hxgTcZNE6fdnZlqPiDE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 04:09:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223520

When DEBUG_BUILD is enabled, allow other layers to add their own
debug build configurations

NOTE: this patch depends on bitbake commit [parse: Make include_all
support empty variable expansions] [1]

[1] https://lists.openembedded.org/g/bitbake-devel/message/18037?p=%2C%2C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2C%2C20%2C2%2C0%2C115265193%2Cd%253D3&d=3
Suggested-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/conf/bitbake.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 0e614c6b21..c21bda8cce 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -830,7 +830,8 @@ include conf/licenses.conf
 require conf/sanity.conf
 include conf/bblock.conf
 
-require ${@oe.utils.vartrue('DEBUG_BUILD', 'conf/distro/include/debug_build.inc', '', d)}
+# Allow other layers to add their own debug build configurations
+include_all ${@oe.utils.vartrue('DEBUG_BUILD', 'conf/distro/include/debug_build.inc', '', d)}
 
 ##################################################################
 # Weak variables (usually to retain backwards compatibility)
-- 
2.34.1


