Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B613EE6431
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 07:37:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.15724.1694763452264442590
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 00:37:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VKBBAE5q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=76224675e8=yogita.urade@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38F6pR8q020495
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 00:37:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=qKOwc
	y/bTC4FBYgw3vhQk/mmBiHD+A1QmhbH+MJGBhE=; b=VKBBAE5qZFwm7K3R0ndLC
	FbdSmXwCrpVyhfNRSY7A2fPhK7+bJtGMx7YN85vVxHtwHWJPciqUn22JRqIdYXXW
	RmLnjawcEqTwdwVlmqU4Q8wYs/PKcHGY8i9FHYK6x9mHkuoo0EMqKBu7+64Kj2Ti
	YHTmmn4YLCx3q/YjTXD0rTYRzsy5tqZmXhqNCHPYZ7cK/fTDnt9N0Df0tlKMPKiB
	xQxyuZXxPacd42rbNFziPI3ejvC1UMt7ilQfTO7UWjM2cxFqskwDXy3PKfYitb4z
	UGJGTuyvGam24pf4BQr+esduHURqbA8w79MVe2iQx2toNmTe6OrzCNgO4wftSlFS
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t2yafjmxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 00:37:31 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 15 Sep 2023 00:37:28 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] cups: fix CVE-2023-32360
Date: Fri, 15 Sep 2023 07:37:04 +0000
Message-ID: <20230915073704.2960698-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: G25crIjZaTYN-2fuv9FDsQ9i6EUZ2eT8
X-Proofpoint-ORIG-GUID: G25crIjZaTYN-2fuv9FDsQ9i6EUZ2eT8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_05,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0
 mlxlogscore=735 priorityscore=1501 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309150066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 07:37:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187659

From: Yogita Urade <yogita.urade@windriver.com>

An authentication issue was addressed with improved state management.
This issue is fixed in macOS Big Sur 11.7.7, macOS Monterey 12.6.6,
macOS Ventura 13.4. An unauthenticated user may be able to access
recently printed documents.

References:
https://ubuntu.com/security/CVE-2023-32360
https://security-tracker.debian.org/tracker/CVE-2023-32360

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2023-32360.patch            | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-32360.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 87f220590f..4d0c52eab8 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -17,6 +17,7 @@ SRC_URI = "https://github.com/OpenPrinting/cups/releases/download/v${PV}/cups-${
            file://cups-volatiles.conf \
            file://CVE-2023-32324.patch \
            file://CVE-2023-34241.patch \
+	   file://CVE-2023-32360.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2023-32360.patch b/meta/recipes-extended/cups/cups/CVE-2023-32360.patch
new file mode 100644
index 0000000000..f1b0f9f918
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2023-32360.patch
@@ -0,0 +1,35 @@
+From a0c8b9c9556882f00c68b9727a95a1b6d1452913 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <michael.r.sweet@gmail.com>
+Date: Thu, 14 Sep 2023 09:16:45 +0000
+Subject: [PATCH] Require authentication for CUPS-Get-Document.
+
+CVE: CVE-2023-32360
+
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/a0c8b9c9556882f00c68b9727a95a1b6d1452913]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ conf/cupsd.conf.in | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/conf/cupsd.conf.in b/conf/cupsd.conf.in
+index b258849..08f5070 100644
+--- a/conf/cupsd.conf.in
++++ b/conf/cupsd.conf.in
+@@ -68,7 +68,13 @@ IdleExitTimeout @EXIT_TIMEOUT@
+     Order deny,allow
+   </Limit>
+
+-  <Limit Send-Document Send-URI Hold-Job Release-Job Restart-Job Purge-Jobs Set-Job-Attributes Create-Job-Subscription Renew-Subscription Cancel-Subscription Get-Notifications Reprocess-Job Cancel-Current-Job Suspend-Current-Job Resume-Job Cancel-My-Jobs Close-Job CUPS-Move-Job CUPS-Get-Document>
++  <Limit Send-Document Send-URI Hold-Job Release-Job Restart-Job Purge-Jobs Set-Job-Attributes Create-Job-Subscription Renew-Subscription Cancel-Subscription Get-Notifications Reprocess-Job Cancel-Current-Job Suspend-Current-Job Resume-Job Cancel-My-Jobs Close-Job CUPS-Move-Job>
++    Require user @OWNER @SYSTEM
++    Order deny,allow
++  </Limit>
++
++  <Limit CUPS-Get-Document>
++    AuthType Defaul
+     Require user @OWNER @SYSTEM
+     Order deny,allow
+   </Limit>
+--
+2.35.5
-- 
2.35.5


