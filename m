Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD279C001B0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 10:24:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.14061.1691663050377801189
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 03:24:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fcZTShP0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7586d6bc71=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37A9f2fN016387
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 10:24:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=fvDbr
	nxzItf/qZBwYPz4EbBNZrDkupQVUfP1P8lE96I=; b=fcZTShP0lqMQi1J8FJ2vf
	tlWRLBnuek04t1DCXeZytQUFmFQeL01DY/liQSWBzIOhhNc8QWRL3YmyA0oXzBnv
	Y14Ujl+pKG2sqERLHJTUmD6BiIKdt82elehk0HBx0jYk076v2ymLEraKbvtmr6FJ
	yEIo7bYV0XeWf7LTncKgwK2c4m44VfYOT3Y6w84X//vksnm39K3ybNp62DvJNPRA
	0hcn+eS4KDFS4lFvATyIXFmK74J8IATlVZGqDu9u9u/Zoc8Sm0cb4xJ6iNPAPATp
	tK5ef4ptS0ZKLTHBUGVFR8/a9/mDZOKwV2RyenavrJjW8KYmPipqKJ8VP/mfQhz6
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s9dd64rd4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 10:24:09 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 03:24:07 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] ghostscript: fix CVE-2023-38559
Date: Thu, 10 Aug 2023 10:23:53 +0000
Message-ID: <20230810102353.1495509-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: IAszIrsd1SWKiY8P6T9kYpRkO8VyBo7H
X-Proofpoint-ORIG-GUID: IAszIrsd1SWKiY8P6T9kYpRkO8VyBo7H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_10,2023-08-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=912 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308100087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 10:24:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185733

A buffer overflow flaw was found in base/gdevdevn.c:1973 in devn_pcx_write_rle()
in ghostscript. This issue may allow a local attacker to cause a denial of service
via outputting a crafted PDF file for a DEVN device with gs.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2023-38559

Upstream patch:
https://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=d81b82c70bc1fb9991bb95f1201abb5dea55f57f

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ghostscript/CVE-2023-38559.patch          | 32 +++++++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2023-38559.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-38559.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-38559.patch
new file mode 100644
index 0000000000..60e2fa7ee3
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-38559.patch
@@ -0,0 +1,32 @@
+From 34b0eec257c3a597e0515946f17fb973a33a7b5b Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Mon, 17 Jul 2023 14:06:37 +0100
+Subject: [PATCH] Bug 706897: Copy pcx buffer overrun fix from
+ devices/gdevpcx.c
+
+Bounds check the buffer, before dereferencing the pointer.
+
+Upstream-Status: Backport [https://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=d81b82c70bc1fb9991bb95f1201abb5dea55f57f]
+
+CVE: CVE-2023-38559
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ base/gdevdevn.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/base/gdevdevn.c b/base/gdevdevn.c
+index f679127..66c771b 100644
+--- a/base/gdevdevn.c
++++ b/base/gdevdevn.c
+@@ -1950,7 +1950,7 @@ devn_pcx_write_rle(const byte * from, const byte * end, int step, gp_file * file
+         byte data = *from;
+
+         from += step;
+-        if (data != *from || from == end) {
++        if (from >= end || data != *from) {
+             if (data >= 0xc0)
+                 gp_fputc(0xc1, file);
+         } else {
+--
+2.40.0
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index 48508fd6a2..ad0b008cab 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -37,6 +37,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://cve-2023-28879.patch \
                 file://CVE-2023-36664-0001.patch \
                 file://CVE-2023-36664-0002.patch \
+                file://CVE-2023-38559.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.40.0


