Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40BBC25B75
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 05:42:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6817.1716961362927464485
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 May 2024 22:42:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6879d90fcd=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T4TalA003713
	for <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 22:42:42 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ybfggbfwk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 22:42:42 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 22:42:40 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 1/4] ghostscript: fix CVE-2024-33870
Date: Wed, 29 May 2024 05:42:22 +0000
Message-ID: <20240529054225.2302069-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: lP51bbxcFYJEr5gX_5z_VTFfVMyRECO6
X-Proofpoint-ORIG-GUID: lP51bbxcFYJEr5gX_5z_VTFfVMyRECO6
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
 <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 05:42:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199988

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ghostscript/CVE-2024-33870.patch          | 99 +++++++++++++++++++
 .../ghostscript/ghostscript_10.02.1.bb        |  1 +
 2 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33870.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33870.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33870.patch
new file mode 100644
index 0000000000..9c2b9dcfa2
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33870.patch
@@ -0,0 +1,99 @@
+From 79aef19c685984dc3da2dc090450407d9fbcff80 Mon Sep 17 00:00:00 2001
+From: Ken Sharp <Ken.Sharp@artifex.com>
+Date: Tue, 26 Mar 2024 12:00:14 +0000
+Subject: [PATCH 1/5] Bug #707686
+
+See bug thread for details
+
+In addition to the noted bug; an error path (return from
+gp_file_name_reduce not successful) could elad to a memory leak as we
+did not free 'bufferfull'. Fix that too.
+
+This addresses CVE-2024-33870
+
+CVE: CVE-2024-33870
+
+Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=79aef19c685984dc]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ base/gpmisc.c | 36 ++++++++++++++++++++++++++++++++----
+ 1 file changed, 32 insertions(+), 4 deletions(-)
+
+diff --git a/base/gpmisc.c b/base/gpmisc.c
+index 2b0064b..c4a69b0 100644
+--- a/base/gpmisc.c
++++ b/base/gpmisc.c
+@@ -1,4 +1,4 @@
+-/* Copyright (C) 2001-2023 Artifex Software, Inc.
++/* Copyright (C) 2001-2024 Artifex Software, Inc.
+    All Rights Reserved.
+
+    This software is provided AS-IS with no warranty, either express or
+@@ -1042,7 +1042,7 @@ gp_validate_path_len(const gs_memory_t *mem,
+                      const uint         len,
+                      const char        *mode)
+ {
+-    char *buffer, *bufferfull;
++    char *buffer, *bufferfull = NULL;
+     uint rlen;
+     int code = 0;
+     const char *cdirstr = gp_file_name_current();
+@@ -1096,8 +1096,10 @@ gp_validate_path_len(const gs_memory_t *mem,
+             return gs_error_VMerror;
+
+         buffer = bufferfull + prefix_len;
+-        if (gp_file_name_reduce(path, (uint)len, buffer, &rlen) != gp_combine_success)
+-            return gs_error_invalidfileaccess;
++        if (gp_file_name_reduce(path, (uint)len, buffer, &rlen) != gp_combine_success) {
++            code = gs_note_error(gs_error_invalidfileaccess);
++            goto exit;
++        }
+         buffer[rlen] = 0;
+     }
+     while (1) {
+@@ -1132,9 +1134,34 @@ gp_validate_path_len(const gs_memory_t *mem,
+             code = gs_note_error(gs_error_invalidfileaccess);
+         }
+         if (code < 0 && prefix_len > 0 && buffer > bufferfull) {
++            uint newlen = rlen + cdirstrl + dirsepstrl;
++            char *newbuffer;
++            int code;
++
+             buffer = bufferfull;
+             memcpy(buffer, cdirstr, cdirstrl);
+             memcpy(buffer + cdirstrl, dirsepstr, dirsepstrl);
++
++            /* We've prepended a './' or similar for the current working directory. We need
++             * to execute file_name_reduce on that, to eliminate any '../' or similar from
++             * the (new) full path.
++             */
++            newbuffer = (char *)gs_alloc_bytes(mem->thread_safe_memory, newlen + 1, "gp_validate_path");
++            if (newbuffer == NULL) {
++                code = gs_note_error(gs_error_VMerror);
++                goto exit;
++            }
++
++            memcpy(newbuffer, buffer, rlen + cdirstrl + dirsepstrl);
++            newbuffer[newlen] = 0x00;
++
++            code = gp_file_name_reduce(newbuffer, (uint)newlen, buffer, &newlen);
++            gs_free_object(mem->thread_safe_memory, newbuffer, "gp_validate_path");
++            if (code != gp_combine_success) {
++                code = gs_note_error(gs_error_invalidfileaccess);
++                goto exit;
++            }
++
+             continue;
+         }
+         else if (code < 0 && cdirstrl > 0 && prefix_len == 0 && buffer == bufferfull) {
+@@ -1153,6 +1180,7 @@ gp_validate_path_len(const gs_memory_t *mem,
+                                            gs_path_control_flag_is_scratch_file);
+     }
+
++exit:
+     gs_free_object(mem->thread_safe_memory, bufferfull, "gp_validate_path");
+ #ifdef EACCES
+     if (code == gs_error_invalidfileaccess)
+--
+2.40.0
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
index 3dff16eec2..ca6f628f38 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://ghostscript-9.16-Werror-return-type.patch \
            file://avoid-host-contamination.patch \
            file://configure.ac-add-option-to-explicitly-disable-neon.patch \
+           file://CVE-2024-33870.patch \
            "
 
 SRC_URI[sha256sum] = "e429e4f5b01615a4f0f93a4128e8a1a4d932dff983b1774174c79c0630717ad9"
-- 
2.40.0


