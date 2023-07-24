Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE45C001DE
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 02:33:48 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.39378.1690166026301713022
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jul 2023 19:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=fdXN0MqZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-67ef5af0ce8so3713848b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 19:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690166025; x=1690770825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CFw4t91agBRnRjxUomKpTtXNqqZOF8+BDEEGN/oi/0s=;
        b=fdXN0MqZvDSYCwfU8SKV6nnwd1c3M/Sjma8l/pGQLdEeAV8GlgBxA8FlcNd4LeG0D7
         OYTXeFf/7Mcecxh9fmvEfWO4vTzWFABm8sLNFa5SPc8Of6WWXQud4Vv/mHEpNuJf7aHJ
         bbdwUF8QsyDZBadUYsI0bG71zuntTpPWY9n2cbvA4EJKD+X7qv/H0uMb0PAolSR0bYaV
         8q3AcRsLw/KLRouSD7otBLUDP0uR4vPTFlPArIRKb2wHYyEMAXkT2MMgVCjLL6f2+7JD
         ICF+rVJL/mcCvRDNMAQbc7qsdvqxOvsokXxZ0VzI5VKJVXhX2Yscwu/ZDPt33sYnxfrH
         1pNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690166025; x=1690770825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CFw4t91agBRnRjxUomKpTtXNqqZOF8+BDEEGN/oi/0s=;
        b=hmWaWF8WzUF7ypGxN9sNcb/ZOwsj8ke5JddGXagTpI+lc8IMcya0HVvfjK2zkgQjJb
         JCL8GGePEI/GeWMc0i3vKgC21Z0UMioYpYKXS/X/DT8BkKFTaugAfFcl6k/2S6QAkFxD
         WbDJXnQnxrlAtttsBvTjNe4RjPxA+yujBYlpXuW5toZcAlhvunjM6ACEngyBjKR9ecPL
         kp4KbFARwm11arTY2Cx2V9qfYodjOKzUuVKRIjApni4kG0NoPh+drI1yny69PBheWaJH
         B9PP55q5iVXT60d0IfRlM7pYOKVVlP8PPuH3SqfqEL4LfG+yOzMplklP3imVhC4PJ9Ha
         bLAg==
X-Gm-Message-State: ABy/qLZ+aGlC02XeW0Ru21EwLpDn7KeE3Oa1K/DeHjCc+HwrYyJbQslC
	fIW66FPO/zZtd1Wyl85dEmAil80BbMpd53b2TwBeJA==
X-Google-Smtp-Source: APBJJlHGu5++vCHqNHSjix9ULtYmmGcjizzth4lgPi53R/0wAMBfLY3BxYIInGC5u5hwDiC8roEG6g==
X-Received: by 2002:a05:6a00:9a3:b0:680:d00c:b164 with SMTP id u35-20020a056a0009a300b00680d00cb164mr9045863pfg.34.1690166025236;
        Sun, 23 Jul 2023 19:33:45 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j1-20020aa783c1000000b0063f00898245sm1024174pfn.146.2023.07.23.19.33.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 19:33:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/8] ghostscript: fix CVE-2023-36664
Date: Sun, 23 Jul 2023 16:33:27 -1000
Message-Id: <cd3921215cb782ecc9aeda5bb3b76863911bcb61.1690165924.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690165924.git.steve@sakoman.com>
References: <cover.1690165924.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 02:33:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184771

From: Archana Polampalli <archana.polampalli@windriver.com>

Artifex Ghostscript through 10.01.2 mishandles permission validation for
pipe devices (with the %pipe% prefix or the | pipe character prefix).

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2023-36664

Upstream patches:
https://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=5e65eeae225c7d02d447de5abaf4a8e6d234fcea
https://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=fb342fdb60391073a69147cb71af1ac416a81099

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


