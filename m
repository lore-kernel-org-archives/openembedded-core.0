Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E89A8EB597E
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 08:39:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15038.1770799182619258517
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 00:39:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pn0RNoaI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6502e0d1f2=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B4hBba1785976
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 08:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=WN1bxGWEX+1WhC7Vq/e4
	Imo70J6BucNgHkJlgrjQxaw=; b=pn0RNoaIdqnB50zhGCZgGuxIEdM339P8J8je
	TAOed55JZmr2b+qg8L752aLqt+DaKgcBgqceuxxiLaAbTbBL2/OmLCOs0rUZIO8V
	PYkK1cvjjEeDnClCMtThk+kMmA7Tkq7/BbmVgkX0cHg4X9NWLPQr91JrT+RJw0KF
	oQPVHyBN+yYqvNFfJc1/LOfHEJMcLZoGEOODco6XEGKQ9FrTpyTsHSw1F4Tp9SM5
	ZBaLocCqZbrOX5kwvSGnJvIvD43NmhAIK+TyDhy+Dy6tEB8m6pmVCFryeB1c2NqN
	oTk1zPQdAYsFQ0Hm2GTpYs3n4gl3gjt/AeQdnVyfx96FYnfl+Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5vc5cdfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 08:39:41 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 11 Feb 2026 00:39:40 -0800
Received: from oak-lpgbuild14.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 11 Feb 2026 00:39:40 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] icu: upgrade from 78.1 to 78.2
Date: Wed, 11 Feb 2026 08:39:40 +0000
Message-ID: <20260211083940.1457912-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=dPyrWeZb c=1 sm=1 tr=0 ts=698c404d cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=xop0H2TDAAAA:20 a=t7CeM3EgAAAA:8
 a=Sv0UJnv_ttXsxKqCa1AA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA2OSBTYWx0ZWRfX1xSlPrkaYoyG
 LMvTgnznoS8YZIeqOETxOkLnBm8wa0Or8+pDje0aG2ei7GJRkRDCmDorjKxM5xpMjiQfHqB137y
 uBXkDb3MDc+mS2Dp4uDKuoVKCbwo0ACml99BmIj8DrtSJzVz2+GtsvsshDvKzdlztKyzBFi15BP
 w9STBP3GOR+J10CVvq8shKyFPX+FO77nU3wCNkwhk+33a48XloZINdAnr2OY9+1OV3GZSaCIyq2
 +Y5hSOY0NwXnN9meUe7i/X5X6h1+ZHCPFXHkCal5jvhFgc11Riogx775/Ib1OlNuSxB61G1mIRs
 pnqTWahCEBdpBgpv/wc1+svj6tWYQB/8q1qchvjVpDW/0ud8DpB9gHZQjtj3B7SR5Tfob6NTgoo
 nN/TN9QFT9BXpwSdN2LeeoD7rJSM9NHbH32xUs1pulZAL9xVKVX3XStYFc0H+JOIoW6VJbFo+HU
 IlZbwAE51GRqzWCLA4w==
X-Proofpoint-GUID: YlRfdTD2eBvCgBw8NawC4fRYJy7rQdoE
X-Proofpoint-ORIG-GUID: YlRfdTD2eBvCgBw8NawC4fRYJy7rQdoE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 08:39:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230971

From: Chen Qi <Qi.Chen@windriver.com>

icu 78.2 changes:
https://github.com/unicode-org/icu/releases/tag/release-78.2

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-support/icu/{icu_78.1.bb => icu_78.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/icu/{icu_78.1.bb => icu_78.2.bb} (97%)

diff --git a/meta/recipes-support/icu/icu_78.1.bb b/meta/recipes-support/icu/icu_78.2.bb
similarity index 97%
rename from meta/recipes-support/icu/icu_78.1.bb
rename to meta/recipes-support/icu/icu_78.2.bb
index ee7245c27b..1e99803105 100644
--- a/meta/recipes-support/icu/icu_78.1.bb
+++ b/meta/recipes-support/icu/icu_78.2.bb
@@ -116,8 +116,8 @@ SRC_URI = "${BASE_SRC_URI};name=code \
 SRC_URI:append:class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[code.sha256sum] = "6217f58ca39b23127605cfc6c7e0d3475fe4b0d63157011383d716cb41617886"
-SRC_URI[data.sha256sum] = "e7b652244f27194e0ea46a0d21cfc714ee8a818e1fd82d51a93bc91516fdcf65"
+SRC_URI[code.sha256sum] = "3e99687b5c435d4b209630e2d2ebb79906c984685e78635078b672e03c89df35"
+SRC_URI[data.sha256sum] = "582968cf174c9498b2046b4f4e7f786def5f18222bd8d98432d7a29399c38c70"
 
 UPSTREAM_CHECK_REGEX = "releases/tag/release-(?P<pver>(?!.+rc).+)"
 GITHUB_BASE_URI = "https://github.com/unicode-org/icu/releases"
-- 
2.43.0


