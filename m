Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF514C07E9D
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 08:05:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.7912.1664438743499271798
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 01:05:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=HZDDnF6C;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=727166c06f=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28T5lhEF003458;
	Thu, 29 Sep 2022 01:05:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=v98z6t7uI9pKLWPM6xa6EYx9pP/GcPNlJbTjsbTBsi8=;
 b=HZDDnF6Cwv342BGLls4uKmsj9lHNKc39UKiNy04TFqADnnzBA0wm2z9g/VSYjeLFMI6L
 NBC/RdxdIsYCi/csFnEf+GynDm1PLmxyDOzf5iLdkxQUa1JGYIY5jNRCCtPwTaLdR2Ns
 5Ttm7xlH8IAIhqu1nIz3DDA3m+GJZR4gvHTX24UdfNNM7oyW2bg228pxwMJG4HB4R2Ap
 pSf30U3crSKzpFzyg89teODFiapjx5rLYwzDlAwJeAPdvURxNv9GXJHBTijtiEMv4hLp
 JVKIRvt+lQfE7dp2nbPj4W6m1+yLupOTcVBH3uLiLDWtx+seTimFw1fwBRIP3hmcnhWI wA==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jt1dkc2a0-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 29 Sep 2022 01:05:42 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 29 Sep 2022 01:05:41 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 29 Sep 2022 01:05:41 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] binutils: another way to clear GPROFNG_ALTS for clang and
 musl
Date: Thu, 29 Sep 2022 16:05:36 +0800
Message-ID: <20220929080536.5400-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: S0B8tO1yZc2_Dzq9X4RTODHzeRb3c3Qz
X-Proofpoint-ORIG-GUID: S0B8tO1yZc2_Dzq9X4RTODHzeRb3c3Qz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-29_04,2022-09-29_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=932 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209290047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 08:05:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171173

From: Kai Kang <kai.kang@windriver.com>

It disables gprofng for toolchain clang and libc musl, so GPROFNG_ALTS
should be cleared for them. But override 'toolchain-clang' is applied
before overrides 'TRANSLATED_TARGET_ARCH' such as x86-64, then
GPROFNG_ALTS is still set and not cleared.

Apply overrides 'toolchain-clang' and 'libc-musl' for GPROFNGS rather
than GPROFNG_ALTS to make it work as expected.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/binutils/binutils.inc | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 4dde387a8a..98acf0a222 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -44,15 +44,16 @@ GPROFNGS = " \
 	gp-display-text \
 	gprofng \
 "
+
+# it disables gprofng for clang and musl in the bb file
+GPROFNGS:toolchain-clang = ""
+GPROFNGS:libc-musl = ""
+
 GPROFNG_ALTS ?= ""
 GPROFNG_ALTS:x86 = "${GPROFNGS}"
 GPROFNG_ALTS:x86-64 = "${GPROFNGS}"
 GPROFNG_ALTS:aarch64 = "${GPROFNGS}"
 
-# it disables gprofng for clang and musl in the bb file
-GPROFNG_ALTS:toolchain-clang = ""
-GPROFNG_ALTS:libc-musl = ""
-
 LDGOLD_ALTS ?= "ld.gold dwp"
 LDGOLD_ALTS:riscv64 = ""
 LDGOLD_ALTS:riscv32 = ""
-- 
2.17.1


