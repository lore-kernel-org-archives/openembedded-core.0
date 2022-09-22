Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C41C6FA8B
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 08:26:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4790.1663835159700710540
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 01:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=CDLOoe+w;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=6264950063=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28M813fx007019;
	Thu, 22 Sep 2022 01:25:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=Ow9Gm0+CwB1XLAob6U8xAidh/6Xc+rNUq3JkbtG0TfA=;
 b=CDLOoe+wEbt1duoNhdbh2K/PcKJpYgcmtkKeOaRUweDh65KPCN7Nb9JE+96eHi2loHe1
 NVeSV/1T3gbJzShYNvUhY//ada9aJ5TXUwxTI5RtHb4+m+A5ZjOApIVY5TmqhtsW46uW
 pf+HBtv5XqtWZuGG2tsQ00Rppqsrxwdfsz0n7P0kM4AuKxZPGRZurP1q2J4vKua4+6RK
 bA5tNLucUCX4Ejz1/lZxtF4tDPE9c04RWkpxlytpk91tTasdKwW7fbozKueYzMkwoUpB
 DNdzVEgXKr+yw0UdNZjOfZEIPwzEbunkI+gwluL4rUBKPneblxC6wcs/bLH7yNTlsc06 Kg==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jn9h3v2g3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 22 Sep 2022 01:25:53 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 22 Sep 2022 01:25:52 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 22 Sep 2022 01:25:52 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 22 Sep 2022 01:25:51 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
CC: <alexandre.belloni@bootlin.com>,
        <openembedded-core@lists.openembedded.org>
Subject: [PATCH v3] binutils: handle symlink files for gprofng
Date: Thu, 22 Sep 2022 16:25:45 +0800
Message-ID: <20220922082545.40540-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: MWEb4YLK89CA4_4zU1f9LXyWxlHmuhyX
X-Proofpoint-ORIG-GUID: MWEb4YLK89CA4_4zU1f9LXyWxlHmuhyX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-22_04,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxlogscore=904 spamscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1011
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209220055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Sep 2022 08:26:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170965

From: Kai Kang <kai.kang@windriver.com>

It provides gprofng by binutils 2.39 for x86, x86_64 and aarch64
according to configure.ac:

https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=configure.ac;h=a5555a9c91b42214afc46a0ab8b629e4c6fedcc0;hb=HEAD#l401

Add them to USE_ALTERNATIVES_FOR the same as others to handle symlink
files via update-alternative mechanism. And it disables gprofng for
clang and musl in .bb file, so clear GPROFNG_ALTS for them too.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
v3:
* clear GPROFNG_ALTS for clang and musl

 meta/recipes-devtools/binutils/binutils.inc | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 789c8bec21..4dde387a8a 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -36,6 +36,23 @@ FILES:${PN}-dev = " \
 # Rather than duplicating multiple entries for these, make one
 # list and reuse it.
 
+GPROFNGS = " \
+	gp-archive \
+	gp-collect-app \
+	gp-display-html \
+	gp-display-src \
+	gp-display-text \
+	gprofng \
+"
+GPROFNG_ALTS ?= ""
+GPROFNG_ALTS:x86 = "${GPROFNGS}"
+GPROFNG_ALTS:x86-64 = "${GPROFNGS}"
+GPROFNG_ALTS:aarch64 = "${GPROFNGS}"
+
+# it disables gprofng for clang and musl in the bb file
+GPROFNG_ALTS:toolchain-clang = ""
+GPROFNG_ALTS:libc-musl = ""
+
 LDGOLD_ALTS ?= "ld.gold dwp"
 LDGOLD_ALTS:riscv64 = ""
 LDGOLD_ALTS:riscv32 = ""
@@ -48,6 +65,7 @@ USE_ALTERNATIVES_FOR = " \
 	c++filt \
 	elfedit \
 	gprof \
+	${GPROFNG_ALTS} \
 	ld \
 	ld.bfd \
 	${LDGOLD_ALTS} \
-- 
2.17.1


