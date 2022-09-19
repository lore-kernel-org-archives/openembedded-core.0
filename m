Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D23DCECAAD3
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 04:48:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.16492.1663562892784115005
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Sep 2022 21:48:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=URIrVQI4;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=62616aae3c=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28J4WQFo007123;
	Mon, 19 Sep 2022 04:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=hG00HXDxGF/MWiR/wGbIElgQ32Qz3438XYcQT7FQk3Y=;
 b=URIrVQI4OBsNRzb5zWDBqoMhZlS5JT0+wHMs3Ezs/pTApP5AThQ8+5WQfXN6EDYxjLFr
 yx37nYqaX1ZRQMljFmUYqmdHVF44scmsH6G65dolnD8xQZgZoqFExCWQa6j0IMx3qSlc
 uA90L1oko/xDdRN9ww2MOkTwKPUcGanp256scCqfLDpE+DnI+ETAnIwOhTM7X59fXfTd
 /3oQSd1RI1Y5iD6bzGykdHxpJAeq0eJBwHjGcooOfMpF9BLWMbd/eP8R0B+GRUpywaNa
 TwhAJjYuW1RRr70kt0vuXClQ1NNED41GutIxa0uoyv2TxJh7vkj1+uM/bRcRdXInSa9x OQ==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jn57a1axp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 19 Sep 2022 04:48:10 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 18 Sep 2022 21:48:08 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 18 Sep 2022 21:48:08 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] binutils: handle symlink files for gprofng
Date: Mon, 19 Sep 2022 12:48:03 +0800
Message-ID: <20220919044803.15248-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: WqtiY-VfO3eFtNSxZMRUg9SMTkC8s4ZF
X-Proofpoint-GUID: WqtiY-VfO3eFtNSxZMRUg9SMTkC8s4ZF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_03,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 spamscore=0 mlxscore=0 mlxlogscore=993 priorityscore=1501 phishscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209190031
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Sep 2022 04:48:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170855

From: Kai Kang <kai.kang@windriver.com>

It provides gprofng by binutils 2.39 for x86, x86_64 and aarch64
according to configure.ac:

https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=configure.ac;h=a5555a9c91b42214afc46a0ab8b629e4c6fedcc0;hb=HEAD#l401

Add them to USE_ALTERNATIVES_FOR the same as others to handle symlink
files via update-alternative mechanism.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/binutils/binutils.inc | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 789c8bec21..0f56fb3e2e 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -36,6 +36,19 @@ FILES:${PN}-dev = " \
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
 LDGOLD_ALTS ?= "ld.gold dwp"
 LDGOLD_ALTS:riscv64 = ""
 LDGOLD_ALTS:riscv32 = ""
@@ -48,6 +61,7 @@ USE_ALTERNATIVES_FOR = " \
 	c++filt \
 	elfedit \
 	gprof \
+	${GPROFNG_ALTS} \
 	ld \
 	ld.bfd \
 	${LDGOLD_ALTS} \
-- 
2.17.1


