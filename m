Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA549E748E0
	for <webhook@archiver.kernel.org>; Sat, 30 Sep 2023 19:40:34 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.47632.1696102828850556909
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Sep 2023 12:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GHiYAmsE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-692779f583fso11427019b3a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 12:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696102828; x=1696707628; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FKZMgCSy7gZq0kkgvx51piRCC0rswginlnQ89fmC8eU=;
        b=GHiYAmsEA0xvNz2Ppx+JazR2rl0S+vH60kDk60I689dvfXVLOK0Lp1XfqCGUWBFJ5x
         kro66LW2vnPHf85SREARP+U3YkOZf+pvowmKDui9ykGvW4HvqHhxsFXwCeT9XXl5z38k
         job0rVE02f3lXUlO19JUsBl5xhuMBOQJBGOHxgF6Tv7Ye6CVtvi6U9Y12DueKMUUsIsM
         FBnsP84+hA7Dem7v3GPcMwBKhKMKv5LgrWIC+7S2kp7odPkp3ou6YAs4h9PDfPbH/srk
         mpYrGdnbNawJxCUVwUEmscS2jDpYAqSNG9AoUnHnn0a4VjC0G3J2I9Uy1/9uTx6HnLCa
         VjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696102828; x=1696707628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FKZMgCSy7gZq0kkgvx51piRCC0rswginlnQ89fmC8eU=;
        b=RKWjuJVhgYEwobPzcZ1j0k6DkRQ3b6h+6aMmxkPoQMxzhJI8kLfheFAv/nmQd+XKKe
         rPIT3f9QIdpBS3CMwh2L1L5L5gcEOKQsb5+dLO2NbVwijxa1uc29SYEBAgoYc9OZHSuj
         /jaWpTLQx9BC4gXa9MBn677FDUehQdVV2lnNF5KkknacqZQQwwmRPW1BwblBc+KXKZ32
         XkZaxibdKgXLm7AHcrWD3MSEDKjMPzgnTjIu/WsoXzHLgeqb47GUodjqOmVC8rSNxspO
         IaZeLAioblRhz/Lf+hJdsbi8akiHUp6rzj0qEPMUKYciizp3/QjPQU/aUeix/9mPtYqr
         7vHg==
X-Gm-Message-State: AOJu0Yx3vv5KpX8Nsne3xiUqiO1FB7nmzI6nCWaVo6NFVprC+AxllvaJ
	r4lu+yJUpdK/HprHODSxu8NftasiJFXo9JJnVJs=
X-Google-Smtp-Source: AGHT+IGTQync4HxS8X5dp8M3ciijjxVEeWTLATwf/1YPSfINY3JyzubsXTMhGYfH+fkTPKmNtUhlpA==
X-Received: by 2002:a05:6a00:2e10:b0:691:1eb:7dda with SMTP id fc16-20020a056a002e1000b0069101eb7ddamr8766047pfb.7.1696102827756;
        Sat, 30 Sep 2023 12:40:27 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id p2-20020a62ab02000000b006936d053677sm2880011pff.133.2023.09.30.12.40.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Sep 2023 12:40:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/13] ghostscript: fix CVE-2023-36664
Date: Sat, 30 Sep 2023 09:40:02 -1000
Message-Id: <13534218ec37706d9decca5b5bd0453e312d72b0.1696102675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696102675.git.steve@sakoman.com>
References: <cover.1696102675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 19:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188470

From: Vijay Anusuri <vanusuri@mvista.com>

Artifex Ghostscript through 10.01.2 mishandles permission validation for
pipe devices (with the %pipe% prefix or the | pipe character prefix).

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2023-36664

Upstream commits:
https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=4ceaf92815302863a8c86fcfcf2347e0118dd3a5
https://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=5e65eeae225c7d02d447de5abaf4a8e6d234fcea
https://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=fb342fdb60391073a69147cb71af1ac416a81099

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/CVE-2023-36664-1.patch        | 145 ++++++++++++++++++
 .../ghostscript/CVE-2023-36664-2.patch        |  60 ++++++++
 .../ghostscript/CVE-2023-36664-pre1.patch     |  62 ++++++++
 .../ghostscript/ghostscript_9.52.bb           |   3 +
 4 files changed, 270 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-1.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-2.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-pre1.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-1.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-1.patch
new file mode 100644
index 0000000000..a3bbe958eb
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-1.patch
@@ -0,0 +1,145 @@
+From 5e65eeae225c7d02d447de5abaf4a8e6d234fcea Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Wed, 7 Jun 2023 10:23:06 +0100
+Subject: [PATCH] Bug 706761: Don't "reduce" %pipe% file names for permission validation
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
+Upstream-Status: Backport [https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=505eab7782b429017eb434b2b95120855f2b0e3c]
+CVE: CVE-2023-36664
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ base/gpmisc.c   | 31 +++++++++++++++++++--------
+ base/gslibctx.c | 56 ++++++++++++++++++++++++++++++++++++-------------
+ 2 files changed, 64 insertions(+), 23 deletions(-)
+
+diff --git a/base/gpmisc.c b/base/gpmisc.c
+index c4fffae..09ac6b3 100644
+--- a/base/gpmisc.c
++++ b/base/gpmisc.c
+@@ -1046,16 +1046,29 @@ gp_validate_path_len(const gs_memory_t *mem,
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
++	bufferfull = buffer = (char *)gs_alloc_bytes(mem->thread_safe_memory, len + 1, "gp_validate_path");
++	if (buffer == NULL)
++	    return gs_error_VMerror;
++	memcpy(buffer, path, len);
++	buffer[len] = 0;
++	rlen = len;
++    }
++    else {
++	rlen = len+1;
++	bufferfull = (char *)gs_alloc_bytes(mem->thread_safe_memory, rlen + prefix_len, "gp_validate_path");
++	if (bufferfull == NULL)
++	    return gs_error_VMerror;
++
++	buffer = bufferfull + prefix_len;
++	if (gp_file_name_reduce(path, (uint)len, buffer, &rlen) != gp_combine_success)
++	    return gs_error_invalidfileaccess;
++	buffer[rlen] = 0;
++    }
+     while (1) {
+         switch (mode[0])
+         {
+diff --git a/base/gslibctx.c b/base/gslibctx.c
+index 20c5eee..355c0e3 100644
+--- a/base/gslibctx.c
++++ b/base/gslibctx.c
+@@ -719,14 +719,28 @@ gs_add_control_path_len(const gs_memory_t *mem, gs_path_control_t type, const ch
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
++	buffer = (char *)gs_alloc_bytes(core->memory, len + 1, "gs_add_control_path_len");
++	if (buffer == NULL)
++	    return gs_error_VMerror;
++	memcpy(buffer, path, len);
++	buffer[len] = 0;
++	rlen = len;
++    }
++    else {
++	rlen = len + 1;
+ 
+-    if (gp_file_name_reduce(path, (uint)len, buffer, &rlen) != gp_combine_success)
+-        return gs_error_invalidfileaccess;
+-    buffer[rlen] = 0;
++	buffer = (char *)gs_alloc_bytes(core->memory, rlen, "gs_add_control_path_len");
++	if (buffer == NULL)
++	    return gs_error_VMerror;
++
++	if (gp_file_name_reduce(path, (uint)len, buffer, &rlen) != gp_combine_success)
++	    return gs_error_invalidfileaccess;
++	buffer[rlen] = 0;
++    }
+ 
+     n = control->num;
+     for (i = 0; i < n; i++)
+@@ -802,14 +816,28 @@ gs_remove_control_path_len(const gs_memory_t *mem, gs_path_control_t type, const
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
++	buffer = (char *)gs_alloc_bytes(core->memory, len + 1, "gs_remove_control_path_len");
++	if (buffer == NULL)
++	    return gs_error_VMerror;
++	memcpy(buffer, path, len);
++	buffer[len] = 0;
++	rlen = len;
++    }
++    else {
++	rlen = len+1;
+ 
+-    if (gp_file_name_reduce(path, (uint)len, buffer, &rlen) != gp_combine_success)
+-        return gs_error_invalidfileaccess;
+-    buffer[rlen] = 0;
++	buffer = (char *)gs_alloc_bytes(core->memory, rlen, "gs_remove_control_path_len");
++	if (buffer == NULL)
++	    return gs_error_VMerror;
++
++	if (gp_file_name_reduce(path, (uint)len, buffer, &rlen) != gp_combine_success)
++	    return gs_error_invalidfileaccess;
++	buffer[rlen] = 0;
++    }
+ 
+     n = control->num;
+     for (i = 0; i < n; i++) {
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-2.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-2.patch
new file mode 100644
index 0000000000..e8c42f1deb
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-2.patch
@@ -0,0 +1,60 @@
+From fb342fdb60391073a69147cb71af1ac416a81099 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Wed, 14 Jun 2023 09:08:12 +0100
+Subject: [PATCH] Bug 706778: 706761 revisit
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
+Upstream-Status: Backport [https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=fb342fdb60391073a69147cb71af1ac416a81099]
+CVE: CVE-2023-36664
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ base/gpmisc.c   | 2 +-
+ base/gslibctx.c | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/base/gpmisc.c b/base/gpmisc.c
+index 09ac6b3..01d449f 100644
+--- a/base/gpmisc.c
++++ b/base/gpmisc.c
+@@ -1050,7 +1050,7 @@ gp_validate_path_len(const gs_memory_t *mem,
+     /* "%pipe%" do not follow the normal rules for path definitions, so we
+        don't "reduce" them to avoid unexpected results
+      */
+-    if (len > 5 && memcmp(path, "%pipe", 5) != 0) {
++    if (path[0] == '|' || (len > 5 && memcmp(path, "%pipe", 5) == 0)) {
+ 	bufferfull = buffer = (char *)gs_alloc_bytes(mem->thread_safe_memory, len + 1, "gp_validate_path");
+ 	if (buffer == NULL)
+ 	    return gs_error_VMerror;
+diff --git a/base/gslibctx.c b/base/gslibctx.c
+index 355c0e3..d8f74a3 100644
+--- a/base/gslibctx.c
++++ b/base/gslibctx.c
+@@ -722,7 +722,7 @@ gs_add_control_path_len(const gs_memory_t *mem, gs_path_control_t type, const ch
+     /* "%pipe%" do not follow the normal rules for path definitions, so we
+        don't "reduce" them to avoid unexpected results
+      */
+-    if (len > 5 && memcmp(path, "%pipe", 5) != 0) {
++    if (path[0] == '|' || (len > 5 && memcmp(path, "%pipe", 5) == 0)) {
+ 	buffer = (char *)gs_alloc_bytes(core->memory, len + 1, "gs_add_control_path_len");
+ 	if (buffer == NULL)
+ 	    return gs_error_VMerror;
+@@ -819,7 +819,7 @@ gs_remove_control_path_len(const gs_memory_t *mem, gs_path_control_t type, const
+     /* "%pipe%" do not follow the normal rules for path definitions, so we
+        don't "reduce" them to avoid unexpected results
+      */
+-    if (len > 5 && memcmp(path, "%pipe", 5) != 0) {
++    if (path[0] == '|' || (len > 5 && memcmp(path, "%pipe", 5) == 0)) {
+ 	buffer = (char *)gs_alloc_bytes(core->memory, len + 1, "gs_remove_control_path_len");
+ 	if (buffer == NULL)
+ 	    return gs_error_VMerror;
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-pre1.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-pre1.patch
new file mode 100644
index 0000000000..662736bb3d
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-pre1.patch
@@ -0,0 +1,62 @@
+From 4ceaf92815302863a8c86fcfcf2347e0118dd3a5 Mon Sep 17 00:00:00 2001
+From: Ray Johnston <ray.johnston@artifex.com>
+Date: Tue, 22 Sep 2020 13:10:04 -0700
+Subject: [PATCH] Fix gp_file allocations to use thread_safe_memory.
+
+The gpmisc.c does allocations for gp_file objects and buffers used by
+gp_fprintf, as well as gp_validate_path_len. The helgrind run with
+-dBGPrint -dNumRenderingThreads=4 and PCL input showed up the gp_fprintf
+problem since the clist rendering would call gp_fprintf using the same
+allocator (PCL's chunk allocator which is non_gc_memory). The chunk
+allocator is intentionally not thread safe (for performance).
+
+Upstream-Status: Backport [https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=4ceaf92815302863a8c86fcfcf2347e0118dd3a5]
+CVE: CVE-2023-36664 #Dependency Patch1
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ base/gpmisc.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/base/gpmisc.c b/base/gpmisc.c
+index 34cd71f..c4fffae 100644
+--- a/base/gpmisc.c
++++ b/base/gpmisc.c
+@@ -435,7 +435,7 @@ generic_pwrite(gp_file *f, size_t count, gs_offset_t offset, const void *buf)
+ 
+ gp_file *gp_file_alloc(gs_memory_t *mem, const gp_file_ops_t *prototype, size_t size, const char *cname)
+ {
+-    gp_file *file = (gp_file *)gs_alloc_bytes(mem->non_gc_memory, size, cname ? cname : "gp_file");
++    gp_file *file = (gp_file *)gs_alloc_bytes(mem->thread_safe_memory, size, cname ? cname : "gp_file");
+     if (file == NULL)
+         return NULL;
+ 
+@@ -449,7 +449,7 @@ gp_file *gp_file_alloc(gs_memory_t *mem, const gp_file_ops_t *prototype, size_t
+         memset(((char *)file)+sizeof(*prototype),
+                0,
+                size - sizeof(*prototype));
+-    file->memory = mem->non_gc_memory;
++    file->memory = mem->thread_safe_memory;
+ 
+     return file;
+ }
+@@ -1047,7 +1047,7 @@ gp_validate_path_len(const gs_memory_t *mem,
+           prefix_len = 0;
+     }
+     rlen = len+1;
+-    bufferfull = (char *)gs_alloc_bytes(mem->non_gc_memory, rlen + prefix_len, "gp_validate_path");
++    bufferfull = (char *)gs_alloc_bytes(mem->thread_safe_memory, rlen + prefix_len, "gp_validate_path");
+     if (bufferfull == NULL)
+         return gs_error_VMerror;
+ 
+@@ -1093,7 +1093,7 @@ gp_validate_path_len(const gs_memory_t *mem,
+         break;
+     }
+ 
+-    gs_free_object(mem->non_gc_memory, bufferfull, "gp_validate_path");
++    gs_free_object(mem->thread_safe_memory, bufferfull, "gp_validate_path");
+ #ifdef EACCES
+     if (code == gs_error_invalidfileaccess)
+         errno = EACCES;
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.52.bb b/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
index 37e9ed8e84..0a2f9f5046 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
@@ -41,6 +41,9 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2021-3781_3.patch \
                 file://CVE-2023-28879.patch \
                 file://0001-Bug-706897-Copy-pcx-buffer-overrun-fix-from-devices-.patch \
+                file://CVE-2023-36664-pre1.patch \
+                file://CVE-2023-36664-1.patch \
+                file://CVE-2023-36664-2.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.34.1


