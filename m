Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E274DEEB58C
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 03:45:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4182.1694576723564255357
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 20:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=r85UxbUz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7620fdf48a=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38D3ireH000723
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 20:45:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=fHFKR
	wFBqfrVLeoiTEfGHuIPxyoMkk7FneWt98aDGkY=; b=r85UxbUzqXny1qGUJMfQs
	17i3ppKLAyz2H5y+fq6TJASOpNSilNVKMnPsVrCOaV3JX8csTZhNqDQ2V+BWtJ0y
	kiwxwAhuW5pCiHx4tWWpIlsXYgsWs4FzwPh12Zve2BF9SKtk1+B/YU6Fjj31o5be
	ZogenW0WUQoAWWngjAWdSvecOidlip7++dMPnye+NDRAdaI9SMqYL2qQ2kRZjHyU
	63l6T1Wurwltp/izlp0uss4cPSNxakdbQ3/pMe/yJ+maJ2NKHCo6tXp6RFAmt8qr
	0ZDZNkMX2dqZBXjXZE0Wg2k3/yFMu0jipHaQenE+X4MVWFN5Z+5U5nAdOPAd1oko
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t2yafg8ck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 20:45:23 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 20:45:21 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.32 via Frontend Transport; Tue, 12 Sep 2023 20:45:21 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] goarch.bbclass: not compatible with riscv32
Date: Wed, 13 Sep 2023 11:45:19 +0800
Message-ID: <20230913034519.2849352-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: rd_GSlE2GM3k6JwMprxY7jUzwbW6wo4-
X-Proofpoint-ORIG-GUID: rd_GSlE2GM3k6JwMprxY7jUzwbW6wo4-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_24,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0
 mlxlogscore=611 priorityscore=1501 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309130029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 03:45:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187549

From: Kai Kang <kai.kang@windriver.com>

It fails to build recipes which inherit goarch.bbclass for qemuriscv32:

| ERROR: Nothing PROVIDES 'docker-moby'
| docker-moby was skipped: Unsupported CPU architecture: riscv32

So empty COMPATIBLE_HOST for riscv32.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes-recipe/goarch.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/goarch.bbclass b/meta/classes-recipe/goarch.bbclass
index e3555e1e46..5fb6051bde 100644
--- a/meta/classes-recipe/goarch.bbclass
+++ b/meta/classes-recipe/goarch.bbclass
@@ -54,6 +54,7 @@ COMPATIBLE_HOST:linux-muslx32 = "null"
 COMPATIBLE_HOST:powerpc = "null"
 COMPATIBLE_HOST:powerpc64 = "null"
 COMPATIBLE_HOST:mipsarchn32 = "null"
+COMPATIBLE_HOST:riscv32 = "null"
 
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"
-- 
2.34.1


