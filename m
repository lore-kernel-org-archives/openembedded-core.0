Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D875D5C0C5
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 13:09:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12268.1731071355661164892
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Nov 2024 05:09:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=10420ab255=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A89hx1a030046
	for <openembedded-core@lists.openembedded.org>; Fri, 8 Nov 2024 05:09:15 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42s6gf0kfw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 05:09:15 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 05:09:14 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 05:09:13 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/1] ghostscript: fix CVE-2023-46361
Date: Fri, 8 Nov 2024 13:09:12 +0000
Message-ID: <20241108130912.2971543-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Fk-YzLYhI1LgjA_tNSd7u0ZFIUQZyt36
X-Proofpoint-GUID: Fk-YzLYhI1LgjA_tNSd7u0ZFIUQZyt36
X-Authority-Analysis: v=2.4 cv=CL54XgrD c=1 sm=1 tr=0 ts=672e0d7b cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VlfZXiiP6vEA:10 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=gDkh9niWAAAA:8 a=NEAV23lmAAAA:8 a=vqJTJNHzF2mXrJ4xFAQA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=lGOMK5oLEwUwZHJ1FuQB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-08_09,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 mlxlogscore=996 spamscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411080110
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 13:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206870

From: Archana Polampalli <archana.polampalli@windriver.com>

Artifex Software jbig2dec v0.20 was discovered to contain a SEGV vulnerability
via jbig2_error at /jbig2dec/jbig2.c.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ghostscript/CVE-2023-46361.patch          | 32 +++++++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2023-46361.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-46361.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-46361.patch
new file mode 100644
index 0000000000..d91a94e9d0
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-46361.patch
@@ -0,0 +1,32 @@
+From 44ca5b9d023e1de33fcb8984c85bb29619c4db7e Mon Sep 17 00:00:00 2001
+From: Sebastian Rasmussen <sebras@gmail.com>
+Date: Sun, 5 Nov 2023 12:21:52 +0100
+Subject: [PATCH] Bug 705041: jbig2dec: Avoid uninitialized allocator in
+ command-line tool.
+
+This fixes CVE-2023-46361.
+
+CVE: CVE-2023-46361
+
+Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=44ca5b9d023e1de33fcb8984c85bb29619c4db7e]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ jbig2dec/jbig2dec.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/jbig2dec/jbig2dec.c b/jbig2dec/jbig2dec.c
+index dc1fd56..78c8e89 100644
+--- a/jbig2dec/jbig2dec.c
++++ b/jbig2dec/jbig2dec.c
+@@ -567,7 +567,7 @@ main(int argc, char **argv)
+ {
+     jbig2dec_params_t params;
+     jbig2dec_error_callback_state_t error_callback_state;
+-    jbig2dec_allocator_t allocator_;
++    jbig2dec_allocator_t allocator_ = { 0 };
+     jbig2dec_allocator_t *allocator = &allocator_;
+     Jbig2Ctx *ctx = NULL;
+     FILE *f = NULL, *f_page = NULL;
+--
+2.40.0
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index 969e637f5e..9f368a291f 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -56,6 +56,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2024-29506.patch \
                 file://CVE-2024-29508-1.patch \
                 file://CVE-2024-29508-2.patch \
+                file://CVE-2023-46361.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.40.0


