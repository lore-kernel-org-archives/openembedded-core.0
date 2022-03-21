Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D06D2C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 13:40:38 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web08.30466.1647870036256317774
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 06:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=jgkdkAmb;
 spf=pass (domain: intel.com, ip: 134.134.136.126,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647870037; x=1679406037;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=+HDwbzP/eHDL2aGUo3WL98994oGSMIsv6vCYMnhk8sg=;
  b=jgkdkAmbWW9e2cU/JNwoH5S+JmzbBB9nT8eHjgCqsRxk3YWc41/wD73s
   Yk3p64WCMG6nk+j04il3pbyobGi/EVBqeICiQPcqzOAaVASKxsCALtMyO
   y163XFgQxbgo+PGZQJIxEceGqKhWfFSQSi8qGX28mAIF/jhtGsv/slJQU
   6hrbJTu4PNKzTrA3DcrxWN1lmIRpSgo1N50M7c1f4vKcx/vQmODp/javd
   Kib3uBUXUBYhTITv9BBHbxqt7Mc9+3Wb9XRKMS2J7y0g0na5bZc5vucV1
   P57vqDgzWnM5TIv79/XlbxLYEl25/03vlbvT7JnJHVDBS/FuACQ6s6zQo
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="239711179"
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400";
   d="scan'208";a="239711179"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 06:40:37 -0700
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400";
   d="scan'208";a="648567808"
Received: from ttan5-mobl2.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.237.38])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 06:40:35 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 1/3] ghostscript: fix CVE-2021-3781
Date: Mon, 21 Mar 2022 21:40:24 +0800
Message-Id: 
 <c9c5254345249b8a2c53e80cec3c469ca6fc1099.1647869680.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647869680.git.anuj.mittal@intel.com>
References: <cover.1647869680.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Mar 2022 13:40:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163504

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../ghostscript/CVE-2021-3781.patch           | 236 ++++++++++++++++++
 .../ghostscript/ghostscript_9.54.0.bb         |   1 +
 2 files changed, 237 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2021-3781.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2021-3781.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2021-3781.patch
new file mode 100644
index 0000000000..27ef83bb85
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2021-3781.patch
@@ -0,0 +1,236 @@
+From a9bd3dec9fde03327a4a2c69dad1036bf9632e20 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Tue, 7 Sep 2021 20:36:12 +0100
+Subject: [PATCH] Bug 704342: Include device specifier strings in access
+ validation
+
+for the "%pipe%", %handle%" and %printer% io devices.
+
+We previously validated only the part after the "%pipe%" Postscript device
+specifier, but this proved insufficient.
+
+This rebuilds the original file name string, and validates it complete. The
+slight complication for "%pipe%" is it can be reached implicitly using
+"|" so we have to check both prefixes.
+
+Addresses CVE-2021-3781
+
+Upstream-Status: Backport[https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=a9bd3dec9fde03327a4a2c69dad1036bf9632e20]
+CVE: CVE-2021-3781
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ base/gdevpipe.c | 22 +++++++++++++++-
+ base/gp_mshdl.c | 11 +++++++-
+ base/gp_msprn.c | 10 ++++++-
+ base/gp_os2pr.c | 13 +++++++++-
+ base/gslibctx.c | 69 ++++++++++---------------------------------------
+ 5 files changed, 65 insertions(+), 60 deletions(-)
+
+diff --git a/base/gdevpipe.c b/base/gdevpipe.c
+index 96d71f5d8..5bdc485be 100644
+--- a/base/gdevpipe.c
++++ b/base/gdevpipe.c
+@@ -72,8 +72,28 @@ pipe_fopen(gx_io_device * iodev, const char *fname, const char *access,
+ #else
+     gs_lib_ctx_t *ctx = mem->gs_lib_ctx;
+     gs_fs_list_t *fs = ctx->core->fs;
++    /* The pipe device can be reached in two ways, explicltly with %pipe%
++       or implicitly with "|", so we have to check for both
++     */
++    char f[gp_file_name_sizeof];
++    const char *pipestr = "|";
++    const size_t pipestrlen = strlen(pipestr);
++    const size_t preflen = strlen(iodev->dname);
++    const size_t nlen = strlen(fname);
++    int code1;
++
++    if (preflen + nlen >= gp_file_name_sizeof)
++        return_error(gs_error_invalidaccess);
++
++    memcpy(f, iodev->dname, preflen);
++    memcpy(f + preflen, fname, nlen + 1);
++
++    code1 = gp_validate_path(mem, f, access);
++
++    memcpy(f, pipestr, pipestrlen);
++    memcpy(f + pipestrlen, fname, nlen + 1);
+ 
+-    if (gp_validate_path(mem, fname, access) != 0)
++    if (code1 != 0 && gp_validate_path(mem, f, access) != 0 )
+         return gs_error_invalidfileaccess;
+ 
+     /*
+diff --git a/base/gp_mshdl.c b/base/gp_mshdl.c
+index 2b964ed74..8d87ceadc 100644
+--- a/base/gp_mshdl.c
++++ b/base/gp_mshdl.c
+@@ -95,8 +95,17 @@ mswin_handle_fopen(gx_io_device * iodev, const char *fname, const char *access,
+     long hfile;	/* Correct for Win32, may be wrong for Win64 */
+     gs_lib_ctx_t *ctx = mem->gs_lib_ctx;
+     gs_fs_list_t *fs = ctx->core->fs;
++    char f[gp_file_name_sizeof];
++    const size_t preflen = strlen(iodev->dname);
++    const size_t nlen = strlen(fname);
+ 
+-    if (gp_validate_path(mem, fname, access) != 0)
++    if (preflen + nlen >= gp_file_name_sizeof)
++        return_error(gs_error_invalidaccess);
++
++    memcpy(f, iodev->dname, preflen);
++    memcpy(f + preflen, fname, nlen + 1);
++
++    if (gp_validate_path(mem, f, access) != 0)
+         return gs_error_invalidfileaccess;
+ 
+     /* First we try the open_handle method. */
+diff --git a/base/gp_msprn.c b/base/gp_msprn.c
+index ed4827968..746a974f7 100644
+--- a/base/gp_msprn.c
++++ b/base/gp_msprn.c
+@@ -168,8 +168,16 @@ mswin_printer_fopen(gx_io_device * iodev, const char *fname, const char *access,
+     uintptr_t *ptid = &((tid_t *)(iodev->state))->tid;
+     gs_lib_ctx_t *ctx = mem->gs_lib_ctx;
+     gs_fs_list_t *fs = ctx->core->fs;
++    const size_t preflen = strlen(iodev->dname);
++    const size_t nlen = strlen(fname);
+ 
+-    if (gp_validate_path(mem, fname, access) != 0)
++    if (preflen + nlen >= gp_file_name_sizeof)
++        return_error(gs_error_invalidaccess);
++
++    memcpy(pname, iodev->dname, preflen);
++    memcpy(pname + preflen, fname, nlen + 1);
++
++    if (gp_validate_path(mem, pname, access) != 0)
+         return gs_error_invalidfileaccess;
+ 
+     /* First we try the open_printer method. */
+diff --git a/base/gp_os2pr.c b/base/gp_os2pr.c
+index f852c71fc..ba54cde66 100644
+--- a/base/gp_os2pr.c
++++ b/base/gp_os2pr.c
+@@ -107,9 +107,20 @@ os2_printer_fopen(gx_io_device * iodev, const char *fname, const char *access,
+            FILE ** pfile, char *rfname, uint rnamelen)
+ {
+     os2_printer_t *pr = (os2_printer_t *)iodev->state;
+-    char driver_name[256];
++    char driver_name[gp_file_name_sizeof];
+     gs_lib_ctx_t *ctx = mem->gs_lib_ctx;
+     gs_fs_list_t *fs = ctx->core->fs;
++    const size_t preflen = strlen(iodev->dname);
++    const int size_t = strlen(fname);
++
++    if (preflen + nlen >= gp_file_name_sizeof)
++        return_error(gs_error_invalidaccess);
++
++    memcpy(driver_name, iodev->dname, preflen);
++    memcpy(driver_name + preflen, fname, nlen + 1);
++
++    if (gp_validate_path(mem, driver_name, access) != 0)
++        return gs_error_invalidfileaccess;
+ 
+     /* First we try the open_printer method. */
+     /* Note that the loop condition here ensures we don't
+diff --git a/base/gslibctx.c b/base/gslibctx.c
+index 6dfed6cd5..318039fad 100644
+--- a/base/gslibctx.c
++++ b/base/gslibctx.c
+@@ -655,82 +655,39 @@ rewrite_percent_specifiers(char *s)
+ int
+ gs_add_outputfile_control_path(gs_memory_t *mem, const char *fname)
+ {
+-    char *fp, f[gp_file_name_sizeof];
+-    const int pipe = 124; /* ASCII code for '|' */
+-    const int len = strlen(fname);
+-    int i, code;
++    char f[gp_file_name_sizeof];
++    int code;
+ 
+     /* Be sure the string copy will fit */
+-    if (len >= gp_file_name_sizeof)
++    if (strlen(fname) >= gp_file_name_sizeof)
+         return gs_error_rangecheck;
+     strcpy(f, fname);
+-    fp = f;
+     /* Try to rewrite any %d (or similar) in the string */
+     rewrite_percent_specifiers(f);
+-    for (i = 0; i < len; i++) {
+-        if (f[i] == pipe) {
+-           fp = &f[i + 1];
+-           /* Because we potentially have to check file permissions at two levels
+-              for the output file (gx_device_open_output_file and the low level
+-              fopen API, if we're using a pipe, we have to add both the full string,
+-              (including the '|', and just the command to which we pipe - since at
+-              the pipe_fopen(), the leading '|' has been stripped.
+-            */
+-           code = gs_add_control_path(mem, gs_permit_file_writing, f);
+-           if (code < 0)
+-               return code;
+-           code = gs_add_control_path(mem, gs_permit_file_control, f);
+-           if (code < 0)
+-               return code;
+-           break;
+-        }
+-        if (!IS_WHITESPACE(f[i]))
+-            break;
+-    }
+-    code = gs_add_control_path(mem, gs_permit_file_control, fp);
++
++    code = gs_add_control_path(mem, gs_permit_file_control, f);
+     if (code < 0)
+         return code;
+-    return gs_add_control_path(mem, gs_permit_file_writing, fp);
++    return gs_add_control_path(mem, gs_permit_file_writing, f);
+ }
+ 
+ int
+ gs_remove_outputfile_control_path(gs_memory_t *mem, const char *fname)
+ {
+-    char *fp, f[gp_file_name_sizeof];
+-    const int pipe = 124; /* ASCII code for '|' */
+-    const int len = strlen(fname);
+-    int i, code;
++    char f[gp_file_name_sizeof];
++    int code;
+ 
+     /* Be sure the string copy will fit */
+-    if (len >= gp_file_name_sizeof)
++    if (strlen(fname) >= gp_file_name_sizeof)
+         return gs_error_rangecheck;
+     strcpy(f, fname);
+-    fp = f;
+     /* Try to rewrite any %d (or similar) in the string */
+-    for (i = 0; i < len; i++) {
+-        if (f[i] == pipe) {
+-           fp = &f[i + 1];
+-           /* Because we potentially have to check file permissions at two levels
+-              for the output file (gx_device_open_output_file and the low level
+-              fopen API, if we're using a pipe, we have to add both the full string,
+-              (including the '|', and just the command to which we pipe - since at
+-              the pipe_fopen(), the leading '|' has been stripped.
+-            */
+-           code = gs_remove_control_path(mem, gs_permit_file_writing, f);
+-           if (code < 0)
+-               return code;
+-           code = gs_remove_control_path(mem, gs_permit_file_control, f);
+-           if (code < 0)
+-               return code;
+-           break;
+-        }
+-        if (!IS_WHITESPACE(f[i]))
+-            break;
+-    }
+-    code = gs_remove_control_path(mem, gs_permit_file_control, fp);
++    rewrite_percent_specifiers(f);
++
++    code = gs_remove_control_path(mem, gs_permit_file_control, f);
+     if (code < 0)
+         return code;
+-    return gs_remove_control_path(mem, gs_permit_file_writing, fp);
++    return gs_remove_control_path(mem, gs_permit_file_writing, f);
+ }
+ 
+ int
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.54.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.54.0.bb
index d4442a4908..28d064a1a8 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.54.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.54.0.bb
@@ -34,6 +34,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://avoid-host-contamination.patch \
                 file://mkdir-p.patch \
                 file://CVE-2021-45949.patch \
+                file://CVE-2021-3781.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.35.1


