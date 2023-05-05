Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B7C7C77B7C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 20:24:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7721.1683318240086501738
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 13:24:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=XDtYTePD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44896ea759=joe.slater@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 345HTa4j016732
	for <openembedded-core@lists.openembedded.org>; Fri, 5 May 2023 20:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=wNq1y44LlmfRGmwDudEXTpp2vf+CHtUBTxg4Mcbquvg=;
 b=XDtYTePDQ82hGf5Xsxt3I/36G0rsLnxABSsioE533+51DGnp/G4GHFW3V8Q3aUJQgmFD
 dksS0oWjJcazeS5aUvPg31T6GhzlNQuUHO/fhElu1GFRcTpvI8gFVaTcwD66kO2jtrEx
 ZRl/TBZpZHMCVcgOVLHp/NzhQmwh9D8O/nvDNpziX4q41V3xGQ+nTPWq0zvj/G9dZ/b8
 TxULTEdAXxsJO9WrmiLcekFleFp8AUwEfC6+on3V4WKkAqFwP71lTNIbpxH8r79X/0dt
 dMl4QMBH8onzm1Yt24hp0Ps8oGlEvjSmf2Ea+pddxMduWdWc48+o29EKysSLSgR+g3vw xQ== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qaahucgtw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 20:23:59 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 5 May 2023 13:23:57 -0700
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Fri, 5 May 2023 13:23:57 -0700
From: <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [mickledore][oe-core][PATCH 1/1] ghostscript: fix CVE-2023-28879
Date: Fri, 5 May 2023 13:23:57 -0700
Message-ID: <20230505202357.3833797-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: xIAiDr1LGE-Tu0nZ-glH1rjhuvXScORM
X-Proofpoint-GUID: xIAiDr1LGE-Tu0nZ-glH1rjhuvXScORM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-05_26,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=920 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305050165
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 20:24:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180978

From: Joe Slater <joe.slater@windriver.com>

Backport from tag ghostpdl-10.01.1-gse-10174 which is
after 10.01.1.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8a70d6935afa38173dbf012b8e1c3d59228504df)
---
 .../ghostscript/cve-2023-28879.patch          | 60 +++++++++++++++++++
 .../ghostscript/ghostscript_10.0.0.bb         |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/cve-2023-28879.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/cve-2023-28879.patch b/meta/recipes-extended/ghostscript/ghostscript/cve-2023-28879.patch
new file mode 100644
index 0000000000..604b927521
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/cve-2023-28879.patch
@@ -0,0 +1,60 @@
+From 37ed5022cecd584de868933b5b60da2e995b3179 Mon Sep 17 00:00:00 2001
+From: Ken Sharp <ken.sharp@artifex.com>
+Date: Fri, 24 Mar 2023 13:19:57 +0000
+Subject: [PATCH] Graphics library - prevent buffer overrun in (T)BCP encoding
+
+Bug #706494 "Buffer Overflow in s_xBCPE_process"
+
+As described in detail in the bug report, if the write buffer is filled
+to one byte less than full, and we then try to write an escaped
+character, we overrun the buffer because we don't check before
+writing two bytes to it.
+
+This just checks if we have two bytes before starting to write an
+escaped character and exits if we don't (replacing the consumed byte
+of the input).
+
+Up for further discussion; why do we even permit a BCP encoding filter
+anyway ? I think we should remove this, at least when SAFER is true.
+---
+CVE: CVE-2023-28879
+
+Upstream-Status: Backport [see text]
+
+git://git.ghostscript.com/ghostpdl
+cherry-pick
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com.
+
+---
+ base/sbcp.c | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/base/sbcp.c b/base/sbcp.c
+index 979ae0992..47fc233ec 100644
+--- a/base/sbcp.c
++++ b/base/sbcp.c
+@@ -1,4 +1,4 @@
+-/* Copyright (C) 2001-2021 Artifex Software, Inc.
++/* Copyright (C) 2001-2023 Artifex Software, Inc.
+    All Rights Reserved.
+ 
+    This software is provided AS-IS with no warranty, either express or
+@@ -50,6 +50,14 @@ s_xBCPE_process(stream_state * st, stream_cursor_read * pr,
+         byte ch = *++p;
+ 
+         if (ch <= 31 && escaped[ch]) {
++            /* Make sure we have space to store two characters in the write buffer,
++             * if we don't then exit without consuming the input character, we'll process
++             * that on the next time round.
++             */
++            if (pw->limit - q < 2) {
++                p--;
++                break;
++            }
+             if (p == rlimit) {
+                 p--;
+                 break;
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb b/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb
index 56a93632e2..86ecdbe24a 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb
@@ -34,6 +34,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://avoid-host-contamination.patch \
                 file://mkdir-p.patch \
                 file://cross-compile.patch \
+                file://cve-2023-28879.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.25.1


