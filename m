Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C75BC25B7E
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 05:41:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6803.1716961297188154703
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 May 2024 22:41:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6879d90fcd=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T5ChRd029161
	for <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 22:41:36 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ybfggbft7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 22:41:36 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 22:41:34 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 2/5] ghostscript: fix CVE-2024-33869
Date: Wed, 29 May 2024 05:41:17 +0000
Message-ID: <20240529054120.2288334-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240529054120.2288334-1-archana.polampalli@windriver.com>
References: <20240529054120.2288334-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: GvSSJQv-ETb2jG1iZ-QVnBw_wIBTSELS
X-Proofpoint-ORIG-GUID: GvSSJQv-ETb2jG1iZ-QVnBw_wIBTSELS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_14,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 adultscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 05:41:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199984

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ghostscript/CVE-2024-33869-0001.patch     | 39 ++++++++++++++
 .../ghostscript/CVE-2024-33869-0002.patch     | 52 +++++++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  2 +
 3 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0001.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0002.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0001.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0001.patch
new file mode 100644
index 0000000000..2e60ae6048
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0001.patch
@@ -0,0 +1,39 @@
+From 5ae2e320d69a7d0973011796bd388cd5befa1a43 Mon Sep 17 00:00:00 2001
+From: Ken Sharp <Ken.Sharp@artifex.com>
+Date: Tue, 26 Mar 2024 12:02:57 +0000
+Subject: [PATCH 2/5] Bug #707691
+
+Part 1; when stripping a potential Current Working Dirctory specifier
+from a path, make certain it really is a CWD, and not simply large
+ebough to be a CWD.
+
+Reasons are in the bug thread, this is not (IMO) serious.
+
+This is part of the fix for CVE-2024-33869
+
+CVE: CVE-2024-33869
+
+Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=5ae2e320d69a7d0973]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ base/gpmisc.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/base/gpmisc.c b/base/gpmisc.c
+index 3b6fffa..a0b58c8 100644
+--- a/base/gpmisc.c
++++ b/base/gpmisc.c
+@@ -1162,8 +1162,8 @@ gp_validate_path_len(const gs_memory_t *mem,
+
+             continue;
+         }
+-        else if (code < 0 && cdirstrl > 0 && prefix_len == 0 && buffer == bufferfull) {
+-            buffer = bufferfull + cdirstrl + dirsepstrl;
++        else if (code < 0 && cdirstrl > 0 && prefix_len == 0 && buffer == bufferfull
++            && memcmp(buffer, cdirstr, cdirstrl) && !memcmp(buffer + cdirstrl, dirsepstr, dirsepstrl)) {
+             continue;
+         }
+         break;
+--
+2.40.0
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0002.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0002.patch
new file mode 100644
index 0000000000..5ba038a0e7
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0002.patch
@@ -0,0 +1,52 @@
+From f5336e5b4154f515ac83bc5b9eba94302e6618d4 Mon Sep 17 00:00:00 2001
+From: Ken Sharp <Ken.Sharp@artifex.com>
+Date: Tue, 26 Mar 2024 12:07:18 +0000
+Subject: [PATCH 3/5] Bug 707691 part 2
+
+See bug thread for details
+
+This is the second part of the fix for CVE-2024-33869
+
+CVE: CVE-2024-33869
+
+Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=f5336e5b4154f515ac83]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ base/gpmisc.c | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/base/gpmisc.c b/base/gpmisc.c
+index a0b58c8..69bee47 100644
+--- a/base/gpmisc.c
++++ b/base/gpmisc.c
+@@ -1089,6 +1089,27 @@ gp_validate_path_len(const gs_memory_t *mem,
+         rlen = len;
+     }
+     else {
++        char *test = (char *)path, *test1;
++        uint tlen = len, slen;
++
++        /* Look for any pipe (%pipe% or '|' specifications between path separators
++         * Reject any path spec which has a %pipe% or '|' anywhere except at the start.
++         */
++        while (tlen > 0) {
++            if (test[0] == '|' || (tlen > 5 && memcmp(test, "%pipe", 5) == 0)) {
++                code = gs_note_error(gs_error_invalidfileaccess);
++                goto exit;
++            }
++            test1 = test;
++            slen = search_separator((const char **)&test, path + len, test1, 1);
++            if(slen == 0)
++                break;
++            test += slen;
++            tlen -= test - test1;
++            if (test >= path + len)
++                break;
++        }
++
+         rlen = len+1;
+         bufferfull = (char *)gs_alloc_bytes(mem->thread_safe_memory, rlen + prefix_len, "gp_validate_path");
+         if (bufferfull == NULL)
+--
+2.40.0
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index 5fa4da0fb8..083ee4b337 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -44,6 +44,8 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2023-43115.patch \
                 file://CVE-2023-46751.patch \
                 file://CVE-2024-33870.patch \
+                file://CVE-2024-33869-0001.patch \
+                file://CVE-2024-33869-0002.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.40.0


