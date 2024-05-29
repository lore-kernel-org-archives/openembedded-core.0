Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C351C25B75
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 05:41:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6810.1716961309417200890
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 May 2024 22:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6879d90fcd=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T4sqoB017810
	for <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 22:41:49 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ybb90bn35-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 22:41:49 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 22:41:47 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 5/5] ghostscript: fix CVE-2023-52722
Date: Wed, 29 May 2024 05:41:20 +0000
Message-ID: <20240529054120.2288334-5-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240529054120.2288334-1-archana.polampalli@windriver.com>
References: <20240529054120.2288334-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: a5hfOBPoBe0dfk3rz7sXfYQbAy412mly
X-Proofpoint-GUID: a5hfOBPoBe0dfk3rz7sXfYQbAy412mly
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_14,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 suspectscore=0 mlxlogscore=916 mlxscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 05:41:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199987

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ghostscript/CVE-2023-52722.patch          | 43 +++++++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2023-52722.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-52722.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-52722.patch
new file mode 100644
index 0000000000..8fbfc9ef09
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-52722.patch
@@ -0,0 +1,43 @@
+From 1ff9a695947967d2d327c45bf5145dd381fc1745 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Tue, 12 Sep 2023 10:46:10 +0100
+Subject: [PATCH 5/5] In SAFER (default) don't allow eexec seeds other than the
+ Type 1 standard
+
+CVE: CVE-2023-52722
+
+Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=1ff9a695947967d2d327]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ psi/zmisc1.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/psi/zmisc1.c b/psi/zmisc1.c
+index 3c47e99..81556ac 100644
+--- a/psi/zmisc1.c
++++ b/psi/zmisc1.c
+@@ -93,6 +93,9 @@ zexE(i_ctx_t *i_ctx_p)
+
+     if (code < 0)
+         return code;
++    if (gs_is_path_control_active(imemory) != 0 && state.cstate != 55665) {
++        return_error(gs_error_rangecheck);
++    }
+     return filter_write(i_ctx_p, code, &s_exE_template, (stream_state *)&state, 0);
+ }
+
+@@ -130,6 +133,11 @@ zexD(i_ctx_t *i_ctx_p)
+     }
+     if (code < 0)
+         return code;
++
++    if (gs_is_path_control_active(imemory) != 0 && state.cstate != 55665) {
++        return_error(gs_error_rangecheck);
++    }
++
+     /*
+      * If we're reading a .PFB file, let the filter know about it,
+      * so it can read recklessly to the end of the binary section.
+--
+2.40.0
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index 1fd08d1cfe..2e332b1589 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -49,6 +49,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2024-33871-0001.patch \
                 file://CVE-2024-33871-0002.patch \
                 file://CVE-2024-29510.patch \
+                file://CVE-2023-52722.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.40.0


