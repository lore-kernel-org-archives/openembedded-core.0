Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36E99C41513
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 05:41:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6808.1716961296442534959
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 May 2024 22:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6879d90fcd=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T54DVZ025354
	for <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 05:41:35 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yb6y5kt1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 05:41:35 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 22:41:32 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/5] ghostscript: fix CVE-2024-33870
Date: Wed, 29 May 2024 05:41:16 +0000
Message-ID: <20240529054120.2288334-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: kQPegyIW4h9hRGpjGayltQqpIyMk2wMy
X-Proofpoint-GUID: kQPegyIW4h9hRGpjGayltQqpIyMk2wMy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_14,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 clxscore=1011 mlxlogscore=999 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2405290034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 05:41:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199983

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ghostscript/CVE-2024-33870.patch          | 92 +++++++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33870.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33870.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33870.patch
new file mode 100644
index 0000000000..0d289b6d07
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33870.patch
@@ -0,0 +1,92 @@
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
+ base/gpmisc.c | 33 ++++++++++++++++++++++++++++++---
+ 1 file changed, 30 insertions(+), 3 deletions(-)
+
+diff --git a/base/gpmisc.c b/base/gpmisc.c
+index f9a9230..3b6fffa 100644
+--- a/base/gpmisc.c
++++ b/base/gpmisc.c
+@@ -1042,7 +1042,7 @@ gp_validate_path_len(const gs_memory_t *mem,
+                      const uint         len,
+                      const char        *mode)
+ {
+-    char *buffer, *bufferfull;
++    char *buffer, *bufferfull = NULL;
+     uint rlen;
+     int code = 0;
+     const char *cdirstr = gp_file_name_current();
+@@ -1095,8 +1095,10 @@ gp_validate_path_len(const gs_memory_t *mem,
+             return gs_error_VMerror;
+
+         buffer = bufferfull + prefix_len;
+-        if (gp_file_name_reduce(path, (uint)len, buffer, &rlen) != gp_combine_success)
+-            return gs_error_invalidfileaccess;
++	if (gp_file_name_reduce(path, (uint)len, buffer, &rlen) != gp_combine_success) {
++           code = gs_note_error(gs_error_invalidfileaccess);
++            goto exit;
++        }
+         buffer[rlen] = 0;
+     }
+     while (1) {
+@@ -1131,9 +1133,33 @@ gp_validate_path_len(const gs_memory_t *mem,
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
++	    /* We've prepended a './' or similar for the current working directory. We need
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
+@@ -1152,6 +1178,7 @@ gp_validate_path_len(const gs_memory_t *mem,
+                                            gs_path_control_flag_is_scratch_file);
+     }
+
++exit:
+     gs_free_object(mem->thread_safe_memory, bufferfull, "gp_validate_path");
+ #ifdef EACCES
+     if (code == gs_error_invalidfileaccess)
+--
+2.40.0
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index e99c740685..5fa4da0fb8 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -43,6 +43,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2023-38559.patch \
                 file://CVE-2023-43115.patch \
                 file://CVE-2023-46751.patch \
+                file://CVE-2024-33870.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.40.0


