Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E8AEB64DC
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 22:33:18 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.813.1689373996630708531
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 15:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=2/3aYPIk;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1b89e10d356so15645765ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 15:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689373995; x=1691965995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4qeJsUU/8Gm4ACBufKEKZgt/sj3+kxZ7gIfd7BB4yvE=;
        b=2/3aYPIkBXrLlcp0wHOFFx28e9+TDSMYlk3VyXN3GaTcAatbcBEFCSHl20MOqadVpR
         0OkbUl6xwyGzbG1NpT+xCDNyOrLcC1HS4Bdixij62ac04S8IEFQIpEmoZGxAXyBLIGqA
         g314gPAUa/llZrvt9mah3pfPjjpdDgvcV8tnor3GiS5eaQmvhFRnABZyD6Gr0n6O4MrO
         /HJCqB7mq4LTvok8iFYPgnraiS1OmYyJLADyTvfSD4h/7EuRo0RIyMt7Ngq38i2nsTjl
         kov/4F7Z9z1gdQBz5YO/AGdl3Z3fwofP/FG90BZsy6NzCbopqxN8yCg06LGaHR+i3AG+
         Gzgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689373995; x=1691965995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4qeJsUU/8Gm4ACBufKEKZgt/sj3+kxZ7gIfd7BB4yvE=;
        b=HDCdfj8mloxZNEyWpgMLvEwvEd8GRQ68O7/GLBgj8S8/Q9cZH4wKo6Q1ulSGstsgG3
         LYOoI9TVLK6gEkEeraxhj81mrE9r05awXLM4OYexb6FsopppCqMJybTarJgoFwl666pK
         fxMu4oiCc3u7+KsxCzq4vnqfQtoDnUx04MOiCje454RgE5KF3eN6UsKyoOjaJD6BNhK4
         KviwVmAyXvujXBZOaA/CgiSBmxE9+JiyitqwpOgLaDIdxqC3HdGGnKDPrvXFb1V8BfUa
         R+K3KEdSeS1jI5aS6Pvw2nfo0Mcvf/1nPc98GDn2fYEoKl55WVXG5/1HoUvJXYPjjmUS
         gc4A==
X-Gm-Message-State: ABy/qLb/DL6pCrAXl8JR0x5fkMI/rg4Sr2PgoPhrs4GQMObVJt+R0Sqw
	XaFngG7nUlOnxD5EmfCp7Fyi0QF1l4n1ZYn1ruo=
X-Google-Smtp-Source: APBJJlHuv9DFkXDIDAxvkIyFifvOYw+Pu+1g/C0+zpbm6eHhc2K6Jq+2H0hMHf9QM8cYEt5jSbndwg==
X-Received: by 2002:a17:902:e744:b0:1b8:7483:d488 with SMTP id p4-20020a170902e74400b001b87483d488mr5130952plf.57.1689373995457;
        Fri, 14 Jul 2023 15:33:15 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q1-20020a170902788100b001b80760fd04sm8236782pll.112.2023.07.14.15.33.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 15:33:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 03/26] ghostscript: fix CVE-2023-36664
Date: Fri, 14 Jul 2023 12:32:37 -1000
Message-Id: <8173939cfa4d0be8c0ffaa45e371945b1f7a16ae.1689373876.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689373875.git.steve@sakoman.com>
References: <cover.1689373875.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 22:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184285

From: Joe Slater <joe.slater@windriver.com>

Combine two commits from git.ghostscript.com/ghostpdl.
The first incompletely addresses the CVE.  The second
addresses defects in the first.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/cve-2023-36664.patch          | 165 ++++++++++++++++++
 .../ghostscript/ghostscript_10.0.0.bb         |   1 +
 2 files changed, 166 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/cve-2023-36664.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/cve-2023-36664.patch b/meta/recipes-extended/ghostscript/ghostscript/cve-2023-36664.patch
new file mode 100644
index 0000000000..fea0665523
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/cve-2023-36664.patch
@@ -0,0 +1,165 @@
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
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
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
2.34.1


