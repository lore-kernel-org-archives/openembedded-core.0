Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB65C83F33
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 10:53:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.18494.1693911173510207284
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 03:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=McMhALQL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=76124f3b34=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 385Acafs001634
	for <openembedded-core@lists.openembedded.org>; Tue, 5 Sep 2023 03:52:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=pTNNL
	P/Pep29j7RncMSzxE2IZke1fOWEKIWhYl6LCGQ=; b=McMhALQLlw9y7wrHtZBKw
	sW12zejfkvrSHeyWJFWcgrQpO2gaTXz3/ZXlqGmzgbYcJbY5+58RcTE7/E+X2p1Y
	SJ3fsPHjO1+AcopjnhC4K1YcWGu9N2GsV8g0li0ScXyrn2vuMtmxFWtj3IgpnWoJ
	VIP591LwRJDcwrV3vIE3PbflWmViXGJ0P931FTWBvBp+iD5RJrLo130F7v+bEuBD
	dYn8WJYkj09ATUaKk4yxspPLenXWQif5zWnclnAV5qXAwp3sJBmEE+ZEZaFo3Zhe
	oB3mC8aeHL1LDI04b9vZgvukl5FZli1Zt2HcUY9wREPHkYUwt0PVPTRisWNq/KXm
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sv0b027tt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 03:52:53 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 03:52:50 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/1] nasm: fix CVE-2020-21528
Date: Tue, 5 Sep 2023 10:52:39 +0000
Message-ID: <20230905105239.487063-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: nK4n1HBXg7P0lwGdDWZ54jZaWRzW0cH1
X-Proofpoint-GUID: nK4n1HBXg7P0lwGdDWZ54jZaWRzW0cH1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-05_08,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=917
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309050097
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 10:53:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187203

A Segmentation Fault issue discovered in in ieee_segment function in outieee.c
in nasm 2.14.03 and 2.15 allows remote attackers to cause a denial of service
via crafted assembly file.

References:
https://nvd.nist.gov/vuln/detail/CVE-2020-21528

Upstream patches:
https://github.com/netwide-assembler/nasm/commit/93c774d482694643cafbc82578ac8b729fb5bc8b

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../nasm/nasm/CVE-2020-21528.patch            | 47 +++++++++++++++++++
 meta/recipes-devtools/nasm/nasm_2.15.05.bb    |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2020-21528.patch

diff --git a/meta/recipes-devtools/nasm/nasm/CVE-2020-21528.patch b/meta/recipes-devtools/nasm/nasm/CVE-2020-21528.patch
new file mode 100644
index 0000000000..2303744540
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/CVE-2020-21528.patch
@@ -0,0 +1,47 @@
+From 93c774d482694643cafbc82578ac8b729fb5bc8b Mon Sep 17 00:00:00 2001
+From: Cyrill Gorcunov <gorcunov@gmail.com>
+Date: Wed, 4 Nov 2020 13:08:06 +0300
+Subject: [PATCH] BR3392637: output/outieee: Fix nil dereference
+
+The handling been broken in commit 98578071.
+
+Upstream-Status: Backport [https://github.com/netwide-assembler/nasm/commit/93c774d482694643cafbc82578ac8b729fb5bc8b]
+
+CVE: CVE-2020-21528
+
+Signed-off-by: Cyrill Gorcunov <gorcunov@gmail.com>
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ output/outieee.c | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+
+diff --git a/output/outieee.c b/output/outieee.c
+index bff2f085..b3ccc5f6 100644
+--- a/output/outieee.c
++++ b/output/outieee.c
+@@ -795,6 +795,23 @@ static int32_t ieee_segment(char *name, int *bits)
+             define_label(name, seg->index + 1, 0L, false);
+         ieee_seg_needs_update = NULL;
+
++        /*
++         * In commit 98578071b9d71ecaa2344dd9c185237c1765041e
++         * we reworked labels significantly which in turn lead
++         * to the case where seg->name = NULL here and we get
++         * nil dereference in next segments definitions.
++         *
++         * Lets placate this case with explicit name setting
++         * if labels engine didn't set it yet.
++         *
++         * FIXME: Need to revisit this moment if such fix doesn't
++         * break anything but since IEEE 695 format is veeery
++         * old I don't expect there are many users left. In worst
++         * case this should only lead to a memory leak.
++         */
++        if (!seg->name)
++            seg->name = nasm_strdup(name);
++
+         if (seg->use32)
+             *bits = 32;
+         else
+--
+2.40.0
diff --git a/meta/recipes-devtools/nasm/nasm_2.15.05.bb b/meta/recipes-devtools/nasm/nasm_2.15.05.bb
index bcb7e071d6..aba061f56f 100644
--- a/meta/recipes-devtools/nasm/nasm_2.15.05.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.15.05.bb
@@ -10,6 +10,7 @@ SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://0002-Add-debug-prefix-map-option.patch \
            file://CVE-2022-44370.patch \
            file://CVE-2022-46457.patch \
+           file://CVE-2020-21528.patch \
            "
 
 SRC_URI[sha256sum] = "3c4b8339e5ab54b1bcb2316101f8985a5da50a3f9e504d43fa6f35668bee2fd0"
-- 
2.40.0


