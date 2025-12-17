Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A14EBD65C66
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 15:24:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17079.1765985067904822336
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 07:24:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jVuGddbr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4446d33a3f=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH4KiQX3917019;
	Wed, 17 Dec 2025 15:24:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=uR7Zm8m+re9eTFkpGE2KddjE+kj2DupGor+3h0DEAXk=; b=jVuGddbrfCVy
	57zDj15JhnP+oNw7BX8efYtYM4Vvv8Dlw4VARql9rlX2pX1KaNy6nzcxfeSHB7vm
	Z+KAVxdg0tXuOJjUTysLpD6yjyD0KNXJLtSGbu2KKOlClUjO9RytVkTCMOxkIgap
	dsU7TMU8uKDXaoTbrlMVncXQvDJe/cJQBmihi3+P9rKvFE7i8PsgDQEELlO6lWwK
	cE1H6vaKjlrJck71W+kiMhcx13pUBqyHG4+mOFj/ebONb/G2WA3fI5dxHKR63bxC
	lgUhvXeIEnLO/6hECQZlOAtL4CTR702h9ewodGmLTjhf0j/jU7InBGoTgMwFxFGC
	6uli6xhnJQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k68rr20-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 17 Dec 2025 15:24:25 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 17 Dec 2025 07:24:25 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 17 Dec 2025 07:24:24 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>
Subject: [PATCH v6 3/8] {cross,native}.bbclass: drop DEBUG_BUILD
Date: Wed, 17 Dec 2025 23:24:16 +0800
Message-ID: <20251217152421.1181080-3-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251217152421.1181080-1-hongxu.jia@windriver.com>
References: <20251217152421.1181080-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEyMCBTYWx0ZWRfX6w3j+k9+kTFy
 ljixQcWkr/sJ/VySzy3q2koVkUeAMGIw93LU+3KQq8/+3EHWK1zYMDaGfXWazxVclvSwkZTWuY0
 7kywouZ/elVE/m+YhIHtZYehHcbZvoEeTQ5ATCk/zIzpFEsJFH7aMV6aVo1pO3+1TmUoBgeYTsj
 EPw7Wkv7ZY818K7KHUYZvSFZE01p9NvZhnWp2beqZW8VpV81f7A+BV1U+wV2zmlIiq1tLR2r0OX
 LAXM7WoJLWs9VtECgNAxiUG91hjwhKqPBi+E6R2awe8plfd6Fg6oYaU4+93MYOhLX6Ar+NMxRqg
 cqAcdBUV2D/LZgSUjQTB4h7jS0XO68v0p2ZSpCfYGELvhErv0pf7d48J7ingH9rBBBMZLd4C6Sm
 m6O4UZvPRnRzdAtMI4GC4z7FzMtapA==
X-Proofpoint-ORIG-GUID: igAtOUoQpUkaC04qrtmL6zQnT4oRqPZO
X-Proofpoint-GUID: igAtOUoQpUkaC04qrtmL6zQnT4oRqPZO
X-Authority-Analysis: v=2.4 cv=EpLfbCcA c=1 sm=1 tr=0 ts=6942cb29 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8
 a=zWkU3xHhtq9XyjW21gUA:9 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_02,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 15:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228057

In most cases you want to debug target binaries, or native, or cross
but it would be unusual to want to do all at the same time.

Drop DEBUG_BUILD, and set INHIBIT_SYSROOT_STRIP ??= "" by default,
user could use ?= to override in local.conf if needed

Suggested-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes-recipe/cross.bbclass  | 3 +--
 meta/classes-recipe/native.bbclass | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/cross.bbclass b/meta/classes-recipe/cross.bbclass
index c3eeade67b..574ce6988d 100644
--- a/meta/classes-recipe/cross.bbclass
+++ b/meta/classes-recipe/cross.bbclass
@@ -23,8 +23,7 @@ HOST_CC_ARCH = "${BUILD_CC_ARCH}"
 HOST_LD_ARCH = "${BUILD_LD_ARCH}"
 HOST_AS_ARCH = "${BUILD_AS_ARCH}"
 
-# No strip sysroot when DEBUG_BUILD is enabled
-INHIBIT_SYSROOT_STRIP ?= "${@oe.utils.vartrue('DEBUG_BUILD', '1', '', d)}"
+INHIBIT_SYSROOT_STRIP ??= ""
 
 export lt_cv_sys_lib_dlsearch_path_spec = "${libdir} ${base_libdir} /lib /lib64 /usr/lib /usr/lib64"
 
diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/native.bbclass
index 7d1fe343fa..b3411d20ca 100644
--- a/meta/classes-recipe/native.bbclass
+++ b/meta/classes-recipe/native.bbclass
@@ -118,8 +118,7 @@ PATH:prepend = "${COREBASE}/scripts/native-intercept:"
 # reused if we manipulate the paths.
 SSTATE_SCAN_CMD ?= "${SSTATE_SCAN_CMD_NATIVE}"
 
-# No strip sysroot when DEBUG_BUILD is enabled
-INHIBIT_SYSROOT_STRIP ?= "${@oe.utils.vartrue('DEBUG_BUILD', '1', '', d)}"
+INHIBIT_SYSROOT_STRIP ??= ""
 
 python native_virtclass_handler () {
     import re
-- 
2.34.1


