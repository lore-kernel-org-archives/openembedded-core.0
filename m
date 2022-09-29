Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3622CC07E9D
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 03:32:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.6481.1664422350986745512
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 20:32:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=fOdWwIdo;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=727166c06f=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28T3La3O003361;
	Thu, 29 Sep 2022 03:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=3vEUQahLARPXtmCISj3BKRSIzDcugRawi4vpksLFXKQ=;
 b=fOdWwIdoAmF5SM85xCDEVr6EwBxQnFmbeIRtSyFqmzVhIDHHVUK+icRXag/glcmkZS7A
 hxCOIq2NFpW2VVId8Xi9L/D6qiwp1Jr15JZd/wJaDG6i6Lg13+3wzSrnOdmof1YP5tOc
 snMrp8eftiOZonjxL8s2EZ+wBCT0ryNHbWVFlr6CcZMY64Z4h9TLM662y1TJ1Dw6WylI
 Cn01JfDK2gwcixeM+1R6lYHPykoCaNXAO2nQmWkiD0m86UhYv0vc1Q71Q0vSYKPdeTVL
 9VvxEowxJH6wSX8JAZ+Q3o+L/cFQ4vjGhnevQ6gpkgJd1CuanFC+3w56/duFJz4bu1s3 rQ==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jsq4245ef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 29 Sep 2022 03:32:26 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 28 Sep 2022 20:32:25 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 28 Sep 2022 20:32:24 -0700
From: <kai.kang@windriver.com>
To: <Ross.Burton@arm.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] binutils: apply override toolchain-clang last
Date: Thu, 29 Sep 2022 11:32:10 +0800
Message-ID: <20220929033210.13292-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 8s2Lmj5qTHpaPVrkjjX_zoQoWVdDf1zb
X-Proofpoint-GUID: 8s2Lmj5qTHpaPVrkjjX_zoQoWVdDf1zb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-29_02,2022-09-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=758
 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209290020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 03:32:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171165

From: Kai Kang <kai.kang@windriver.com>

It disables gprofng for toolchain clang, so it should clear GPROFNG_ALTS
when clang is used. But override 'toolchain-clang' is applied before
overrides 'TRANSLATED_TARGET_ARCH' such as x86-64, then GPROFNG_ALTS is
still set and not cleared. Append 'forcevariable' to apply it last then
make it work as expected.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/binutils/binutils.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 4dde387a8a..c7113f8a1f 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -50,7 +50,7 @@ GPROFNG_ALTS:x86-64 = "${GPROFNGS}"
 GPROFNG_ALTS:aarch64 = "${GPROFNGS}"
 
 # it disables gprofng for clang and musl in the bb file
-GPROFNG_ALTS:toolchain-clang = ""
+GPROFNG_ALTS:toolchain-clang:forcevariable = ""
 GPROFNG_ALTS:libc-musl = ""
 
 LDGOLD_ALTS ?= "ld.gold dwp"
-- 
2.17.1


