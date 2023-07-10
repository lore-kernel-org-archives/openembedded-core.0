Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A685EB64D9
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 23:42:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.430.1689032552324977406
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 16:42:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=LwouIDED;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=65550850b4=joe.slater@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36ACP3HT026291
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 16:42:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=z8cZP
	hc/lZ5YHMSQtVSMQxlPvJKXqSay7ESbQFuMkLw=; b=LwouIDED+nOZ+yEyCmw5p
	5yJEtkfFI0IafKUbMruXbxWrgRcNL4PrrZPD2CXWNP1v1HZxhxqJ3wq1wFuPWZVj
	eesDPWBSsfWNuDjjrrOMP7cL8SHgWIk554MP/WTVNk9o+roQ1J3isfeNsGDOQQLc
	sjZXLBlT0oLwdhoxRicX42oQm0D9+KzdsvCsv04BCWk7HL+nfsRxH22220sdJPP4
	GUivL/5O/TNfv2zTUvggMw66a5Dh7lcqvo3Q/1zioPXUftJBLE5wd95AJ0vxrr+Y
	8LqCLGe7UVwQyT47sYg+ewm7g8Xrz8eHgw2iI/WShnGSNuT5++Xg8QelqvIsqFVC
	A==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rq7af9svr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 16:42:31 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 10 Jul 2023 16:42:31 -0700
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Mon, 10 Jul 2023 16:42:31 -0700
From: <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [mickledore][oe-core][PATCH 1/1] ghostscript: fix CVE-2023-36664
Date: Mon, 10 Jul 2023 16:42:31 -0700
Message-ID: <20230710234231.1399105-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: gB2EauCj6Z81a-pCCI5nvUcOuZ7ggA8a
X-Proofpoint-GUID: gB2EauCj6Z81a-pCCI5nvUcOuZ7ggA8a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-10_17,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 clxscore=1015 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=973 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2305260000 definitions=main-2307100214
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 23:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184108

From: Joe Slater <joe.slater@windriver.com>

Combine two commits from git.ghostscript.com/ghostpdl.
The first incompletely addresses the CVE.  The second
addresses defects in the first.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../ghostscript/cve-2023-36664.patch          | 163 ++++++++++++++++++
 .../ghostscript/ghostscript_10.0.0.bb         |   1 +
 2 files changed, 164 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/cve-2023-36664.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/cve-2023-36664.patch b/meta/recipes-extended/ghostscript/ghostscript/cve-2023-36664.patch
new file mode 100644
index 0000000000..772dce2d09
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/cve-2023-36664.patch
@@ -0,0 +1,163 @@
+From 6f244ecef4a740b3b2dde15303b13a93a83706c1 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Wed, 7 Jun 2023 10:23:06 +0100
+Subject: [PATCH] Bug 706761: Don't "reduce" %pipe% file names for permission
+ validation
+
+For regular file names, we try to simplfy relative paths before we use them.
+
+Because the %pipe% device can, effectively, accept command line calls, we
+shouldn't be simplifying that string, because the command line syntax can end
+up confusing the path simplifying code. That can result in permitting a pipe
+command which does not match what was originally permitted.
+
+Special case "%pipe" in the validation code so we always deal with the entire
+string.
+
+Bug 706778: 706761 revisit
+
+Two problems with the original commit. The first a silly typo inverting the
+logic of a test.
+
+The second was forgetting that we actually actually validate two candidate
+strings for pipe devices. One with the expected "%pipe%" prefix, the other
+using the pipe character prefix: "|".
+
+This addresses both those.
+---
+CVE: CVE-2023-36664
+
+Upstream-Status: Backport [see text]
+
+From git://git.ghostscript.com/ghostpdl
+  commit 5e65eeae225c7d02d447de5abaf4a8e6d234fcea
+  commit fb342fdb60391073a69147cb71af1ac416a81099
+  
+The second commit fixes errors in the first one, so we combine them.
+---
+ base/gpmisc.c   | 31 +++++++++++++++++++--------
+ base/gslibctx.c | 56 ++++++++++++++++++++++++++++++++++++-------------
+ 2 files changed, 64 insertions(+), 23 deletions(-)
+
+diff --git a/base/gpmisc.c b/base/gpmisc.c
+index 3d878ac..f9a9230 100644
+--- a/base/gpmisc.c
++++ b/base/gpmisc.c
+@@ -1076,16 +1076,29 @@ gp_validate_path_len(const gs_memory_t *mem,
+              && !memcmp(path + cdirstrl, dirsepstr, dirsepstrl)) {
+           prefix_len = 0;
+     }
+-    rlen = len+1;
+-    bufferfull = (char *)gs_alloc_bytes(mem->thread_safe_memory, rlen + prefix_len, "gp_validate_path");
+-    if (bufferfull == NULL)
+-        return gs_error_VMerror;
+-
+-    buffer = bufferfull + prefix_len;
+-    if (gp_file_name_reduce(path, (uint)len, buffer, &rlen) != gp_combine_success)
+-        return gs_error_invalidfileaccess;
+-    buffer[rlen] = 0;
+ 
++    /* "%pipe%" do not follow the normal rules for path definitions, so we
++       don't "reduce" them to avoid unexpected results
++     */
++    if (path[0] == '|' || (len > 5 && memcmp(path, "%pipe", 5) == 0)) {
++        bufferfull = buffer = (char *)gs_alloc_bytes(mem->thread_safe_memory, len + 1, "gp_validate_path");
++        if (buffer == NULL)
++            return gs_error_VMerror;
++        memcpy(buffer, path, len);
++        buffer[len] = 0;
++        rlen = len;
++    }
++    else {
++        rlen = len+1;
++        bufferfull = (char *)gs_alloc_bytes(mem->thread_safe_memory, rlen + prefix_len, "gp_validate_path");
++        if (bufferfull == NULL)
++            return gs_error_VMerror;
++
++        buffer = bufferfull + prefix_len;
++        if (gp_file_name_reduce(path, (uint)len, buffer, &rlen) != gp_combine_success)
++            return gs_error_invalidfileaccess;
++        buffer[rlen] = 0;
++    }
+     while (1) {
+         switch (mode[0])
+         {
+diff --git a/base/gslibctx.c b/base/gslibctx.c
+index 1862482..8bfe4bb 100644
+--- a/base/gslibctx.c
++++ b/base/gslibctx.c
+@@ -740,14 +740,28 @@ gs_add_control_path_len_flags(const gs_memory_t *mem, gs_path_control_t type, co
+             return gs_error_rangecheck;
+     }
+ 
+-    rlen = len+1;
+-    buffer = (char *)gs_alloc_bytes(core->memory, rlen, "gp_validate_path");
+-    if (buffer == NULL)
+-        return gs_error_VMerror;
++    /* "%pipe%" do not follow the normal rules for path definitions, so we
++       don't "reduce" them to avoid unexpected results
++     */
++    if (path[0] == '|' || (len > 5 && memcmp(path, "%pipe", 5) == 0)) {
++        buffer = (char *)gs_alloc_bytes(core->memory, len + 1, "gs_add_control_path_len");
++        if (buffer == NULL)
++            return gs_error_VMerror;
++        memcpy(buffer, path, len);
++        buffer[len] = 0;
++        rlen = len;
++    }
++    else {
++        rlen = len + 1;
+ 
+-    if (gp_file_name_reduce(path, (uint)len, buffer, &rlen) != gp_combine_success)
+-        return gs_error_invalidfileaccess;
+-    buffer[rlen] = 0;
++        buffer = (char *)gs_alloc_bytes(core->memory, rlen, "gs_add_control_path_len");
++        if (buffer == NULL)
++            return gs_error_VMerror;
++
++        if (gp_file_name_reduce(path, (uint)len, buffer, &rlen) != gp_combine_success)
++            return gs_error_invalidfileaccess;
++        buffer[rlen] = 0;
++    }
+ 
+     n = control->num;
+     for (i = 0; i < n; i++)
+@@ -833,14 +847,28 @@ gs_remove_control_path_len_flags(const gs_memory_t *mem, gs_path_control_t type,
+             return gs_error_rangecheck;
+     }
+ 
+-    rlen = len+1;
+-    buffer = (char *)gs_alloc_bytes(core->memory, rlen, "gp_validate_path");
+-    if (buffer == NULL)
+-        return gs_error_VMerror;
++    /* "%pipe%" do not follow the normal rules for path definitions, so we
++       don't "reduce" them to avoid unexpected results
++     */
++    if (path[0] == '|' || (len > 5 && memcmp(path, "%pipe", 5) == 0)) {
++        buffer = (char *)gs_alloc_bytes(core->memory, len + 1, "gs_remove_control_path_len");
++        if (buffer == NULL)
++            return gs_error_VMerror;
++        memcpy(buffer, path, len);
++        buffer[len] = 0;
++        rlen = len;
++    }
++    else {
++        rlen = len+1;
+ 
+-    if (gp_file_name_reduce(path, (uint)len, buffer, &rlen) != gp_combine_success)
+-        return gs_error_invalidfileaccess;
+-    buffer[rlen] = 0;
++        buffer = (char *)gs_alloc_bytes(core->memory, rlen, "gs_remove_control_path_len");
++        if (buffer == NULL)
++            return gs_error_VMerror;
++
++        if (gp_file_name_reduce(path, (uint)len, buffer, &rlen) != gp_combine_success)
++            return gs_error_invalidfileaccess;
++        buffer[rlen] = 0;
++    }
+ 
+     n = control->num;
+     for (i = 0; i < n; i++) {
+-- 
+2.35.5
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb b/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb
index 86ecdbe24a..9a900ee04f 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb
@@ -35,6 +35,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://mkdir-p.patch \
                 file://cross-compile.patch \
                 file://cve-2023-28879.patch \
+                file://cve-2023-36664.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.25.1


