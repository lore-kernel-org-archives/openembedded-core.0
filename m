Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74E0DEB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 11:35:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5378.1689680101916209421
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 04:35:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ibVgcDyt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=65634f9655=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36IAX57A001282
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 11:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=CSFKf
	CgaCKYTOrueQ8jQwBNxvOCfHS9tPCLRdTlY2lI=; b=ibVgcDytoXXsU/d/xK1NY
	KP3PqMCuYENs2vp8PmypiTNpfGBtj28M6/8yGEOHdFza+Udia2XlkFOkNXY1OCEr
	YqRqYu/bm5WOAdx0LxKRN7TA8QYbpM+zNeZ14OYOUw8xLkL1GdhfPaa67+nWriAL
	PBFuN4Z4NyrzBo6nXriY9vchctniPUxbNTl7rb8zJmnfIHYhTV0/tgcH7DtpcZqC
	xgOgrAkyaiGsJjSQa4LHwvah0dcT9GTrLXhJFJSw46/0SFHkHXxinKFQTssoG5RC
	5UQ99f2+IJk9RBJxXZtgj6C7edImiR/JudhLt42I0YNSanII37c7iXSlZ4o6Bpv9
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3run8aagwd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 11:35:00 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 04:34:57 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] ghostscript: fix CVE-2023-36664
Date: Tue, 18 Jul 2023 11:34:43 +0000
Message-ID: <20230718113443.2940609-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: lz0oSOSUZzZbdqE9YC5vhzFXGVtWFI0W
X-Proofpoint-ORIG-GUID: lz0oSOSUZzZbdqE9YC5vhzFXGVtWFI0W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-18_08,2023-07-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=987 clxscore=1011 adultscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307180105
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 11:35:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184500

Artifex Ghostscript through 10.01.2 mishandles permission validation for
pipe devices (with the %pipe% prefix or the | pipe character prefix).

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2023-36664

Upstream patches:
https://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=5e65eeae225c7d02d447de5abaf4a8e6d234fcea
https://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=fb342fdb60391073a69147cb71af1ac416a81099

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ghostscript/CVE-2023-36664-0001.patch     | 146 ++++++++++++++++++
 .../ghostscript/CVE-2023-36664-0002.patch     |  60 +++++++
 .../ghostscript/ghostscript_9.55.0.bb         |   2 +
 3 files changed, 208 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-0001.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-0002.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-0001.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-0001.patch
new file mode 100644
index 0000000000..99fcc61b9b
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-0001.patch
@@ -0,0 +1,146 @@
+From ed607fedbcd41f4a0e71df6af4ba5b07dd630209 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Wed, 7 Jun 2023 10:23:06 +0100
+Subject: [PATCH 1/2] Bug 706761: Don't "reduce" %pipe% file names for
+ permission validation
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
+Upstream-Status: Backport [https://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=5e65eeae225c7d02d447de5abaf4a8e6d234fcea]
+CVE: CVE-2023-36664
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ base/gpmisc.c   | 31 +++++++++++++++++++--------
+ base/gslibctx.c | 56 ++++++++++++++++++++++++++++++++++++-------------
+ 2 files changed, 64 insertions(+), 23 deletions(-)
+
+diff --git a/base/gpmisc.c b/base/gpmisc.c
+index 8b6458a..c61ab3f 100644
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
++    if (len > 5 && memcmp(path, "%pipe", 5) != 0) {
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
+index 5bf497b..5fdfe25 100644
+--- a/base/gslibctx.c
++++ b/base/gslibctx.c
+@@ -734,14 +734,28 @@ gs_add_control_path_len_flags(const gs_memory_t *mem, gs_path_control_t type, co
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
++    if (len > 5 && memcmp(path, "%pipe", 5) != 0) {
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
+@@ -827,14 +841,28 @@ gs_remove_control_path_len_flags(const gs_memory_t *mem, gs_path_control_t type,
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
++    if (len > 5 && memcmp(path, "%pipe", 5) != 0) {
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
+2.40.1
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-0002.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-0002.patch
new file mode 100644
index 0000000000..7d78e6b1b1
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-0002.patch
@@ -0,0 +1,60 @@
+From f96350aeb7f8c2e3f7129866c694a24f241db18c Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Wed, 14 Jun 2023 09:08:12 +0100
+Subject: [PATCH 2/2] Bug 706778: 706761 revisit
+
+Two problems with the original commit. The first a silly typo inverting the
+logic of a test.
+
+The second was forgetting that we actually actually validate two candidate
+strings for pipe devices. One with the expected "%pipe%" prefix, the other
+using the pipe character prefix: "|".
+
+This addresses both those.
+
+Upstream-Status: Backport [https://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=fb342fdb60391073a69147cb71af1ac416a81099]
+CVE: CVE-2023-36664
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ base/gpmisc.c   | 2 +-
+ base/gslibctx.c | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/base/gpmisc.c b/base/gpmisc.c
+index c61ab3f..e459f6a 100644
+--- a/base/gpmisc.c
++++ b/base/gpmisc.c
+@@ -1080,7 +1080,7 @@ gp_validate_path_len(const gs_memory_t *mem,
+     /* "%pipe%" do not follow the normal rules for path definitions, so we
+        don't "reduce" them to avoid unexpected results
+      */
+-    if (len > 5 && memcmp(path, "%pipe", 5) != 0) {
++    if (path[0] == '|' || (len > 5 && memcmp(path, "%pipe", 5) == 0)) {
+         bufferfull = buffer = (char *)gs_alloc_bytes(mem->thread_safe_memory, len + 1, "gp_validate_path");
+         if (buffer == NULL)
+             return gs_error_VMerror;
+diff --git a/base/gslibctx.c b/base/gslibctx.c
+index 5fdfe25..2a1addf 100644
+--- a/base/gslibctx.c
++++ b/base/gslibctx.c
+@@ -737,7 +737,7 @@ gs_add_control_path_len_flags(const gs_memory_t *mem, gs_path_control_t type, co
+     /* "%pipe%" do not follow the normal rules for path definitions, so we
+        don't "reduce" them to avoid unexpected results
+      */
+-    if (len > 5 && memcmp(path, "%pipe", 5) != 0) {
++    if (path[0] == '|' || (len > 5 && memcmp(path, "%pipe", 5) == 0)) {
+         buffer = (char *)gs_alloc_bytes(core->memory, len + 1, "gs_add_control_path_len");
+         if (buffer == NULL)
+             return gs_error_VMerror;
+@@ -844,7 +844,7 @@ gs_remove_control_path_len_flags(const gs_memory_t *mem, gs_path_control_t type,
+     /* "%pipe%" do not follow the normal rules for path definitions, so we
+        don't "reduce" them to avoid unexpected results
+      */
+-    if (len > 5 && memcmp(path, "%pipe", 5) != 0) {
++    if (path[0] == '|' || (len > 5 && memcmp(path, "%pipe", 5) == 0)) {
+         buffer = (char *)gs_alloc_bytes(core->memory, len + 1, "gs_remove_control_path_len");
+         if (buffer == NULL)
+             return gs_error_VMerror;
+--
+2.40.1
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index f29c57beea..48508fd6a2 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -35,6 +35,8 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://mkdir-p.patch \
                 file://CVE-2022-2085.patch \
                 file://cve-2023-28879.patch \
+                file://CVE-2023-36664-0001.patch \
+                file://CVE-2023-36664-0002.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.40.0


