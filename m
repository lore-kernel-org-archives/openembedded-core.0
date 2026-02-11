Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2223EB5955
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 03:04:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10342.1770779073012315710
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 19:04:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jMsWvCCi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6502d38df8=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B0o4bo3464403;
	Wed, 11 Feb 2026 03:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=y51iDzDsU
	iOedljZE5wzFhY1FXAjXh6xI23H6SbZJhk=; b=jMsWvCCisGwTbWX2BzgiroFhj
	TGbwyCEZ02BaG39vqFP2MTfLBOrt5Y6IZkY/AGihg/344cPGUIHZxy2vAKpQgzAP
	VuOJJFM1iGl0+j2Xh9PeBtpsEhwjJRw4wllj6S5mbMhwPXN/+O8dA/Jk0I3mmx9g
	exNz+nmVyUBzLgjBW9UoCYBphDRCJ14ZsVwbdkpd1E3JLdBpQGSB6HXdB9CoeDre
	jZL2GHTVV8iIJ17JHpV1bFjG2d3dGY5ztExfyH97Yi4PSvxyqjDTtdzRWoCFexg3
	vBVvCTP48HT0rr2xQZHSss8pJnQ8gXfaf/PEiarXtd/X+JlGIxKdy6rxdn0Gw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5tkwm7kf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 11 Feb 2026 03:04:30 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 10 Feb 2026 19:04:29 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 10 Feb 2026 19:04:28 -0800
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] lttng-platforms.inc: set LTTNGMODULES with ?=
Date: Wed, 11 Feb 2026 11:04:21 +0800
Message-ID: <20260211030421.2335333-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=bvBBxUai c=1 sm=1 tr=0 ts=698bf1be cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=t7CeM3EgAAAA:8 a=RgY_6RvWWJlUmHxN4lMA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: KPFoOp_vevQF_OpM2Hujhmt8SaD-_jNk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDAyMyBTYWx0ZWRfX5NoTFB5qsiAD
 ghJCIbI0y85tgxy2a3T00gLWyIHeCDHfNjlc4MYCqDruOdkeD/4TkYILOEciEzfmM5r151f0ocu
 ksoAgmpkvBXZgdXqrorslINWSohEmYkFxGSM+KDEuAo+0lIzEEtYgDklGAAkjAGyui+1Eyxu0Co
 q5d5WAC8wMdql9wkbId6Nb5yWU97Khfg8QD/latdjxs+SiRoz3uYeXXY6pSLmAu7ZfC8etxplm/
 Su429uMJeqM87p5xabFekuqcQOpbTKn1yM+EBCDuIqAlzBUbW05FARSDK7bMWK0TgvgZgiKzMw7
 esaMGeCrSMpjXggXVBU6V2dpmcILFk2srS5QQmF3bCDzs0ZcAltYllTSTRm2Ey+sL39LZzhagUM
 rNPQM0EHLhJc/hoDsZ6l2eV77OUsAKvKj9JGnarY7K9dYLbeiWdgBIiju+ric6PaRaxHgtMf708
 sFOWAihxxAP8Yv+YR7w==
X-Proofpoint-ORIG-GUID: KPFoOp_vevQF_OpM2Hujhmt8SaD-_jNk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602110023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 03:04:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230949

From: Kai Kang <kai.kang@windriver.com>

Set LTTNGMODULES with ?= in lttng-platforms.inc, then it could be set in
.conf files to override it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-kernel/lttng/lttng-platforms.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-platforms.inc b/meta/recipes-kernel/lttng/lttng-platforms.inc
index 900e36df82..b7cca582e1 100644
--- a/meta/recipes-kernel/lttng/lttng-platforms.inc
+++ b/meta/recipes-kernel/lttng/lttng-platforms.inc
@@ -1,7 +1,7 @@
 #
 # Whether the platform supports kernel tracing
 #
-LTTNGMODULES = "lttng-modules"
+LTTNGMODULES ?= "lttng-modules"
 LTTNGMODULES:arc = ""
 LTTNGMODULES:riscv64 = ""
 
-- 
2.34.1


