Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C41CCC25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 18:38:16 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.4939.1717094295793883231
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 May 2024 11:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SV2xW1Xh;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7024003a515so266142b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 11:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1717094295; x=1717699095; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o1BnBFuzm5taNTPyos1rcs1Vs67kN021ZcjjulCNiV8=;
        b=SV2xW1XhN73gKj0znH5Ovc5eO1w/ggI1wyIr5OEC3yGSnrDqw/sgSDG030g40mOylQ
         mWTRFSlDAbuCTgwiF7CmokWuD2TH/89TZS21yygeJGQw8RjD3lFoO3+UYC4Dvh6A9YkS
         TFkHBUYy4izE1ZDi0Y2FP33uKt6lYfSIG3qPvpdhP37RnW/hkya5oo2Y9Sqyydy8+r4P
         XvKwuh0jgDNM0heCd5cKlWia7d5zsvIMPrAmGIE0oTCMv2JXPHOkJ3xKzweei0BjnzY+
         v7U3MjqmjqJD9RJpkWiu6urQuD5fOdaAUNFbyCgI8vltxqElu9dVldIeR1rHT0z2i2OH
         CT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717094295; x=1717699095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o1BnBFuzm5taNTPyos1rcs1Vs67kN021ZcjjulCNiV8=;
        b=J9xo4cYwjve2ZkQUtvlzu1IcXtxlUFV1do1K4VuE8ANvUXz9e4GYvMOk2oqdvoHRWx
         sg6xVH30DkX4RxunGg7vQrGuHsKmGY1YZ5L2UGTgWYk/WZFMXl85Y98Sz+1mC+mh6sXp
         Ev3gu04ZhGlkfKI9nBVRgaUEWmfdsvqSrtkhhygqivS0DbmdnGXFSnt4fQMcq304rZYC
         leKfxkl4e3tMYnNlNn1F+QOTOUN6VD/L0VgXwSH60DEBpP/M+AsZvGm9+PLBJqBnRuOB
         hWk25lt0xOTiTk/XMguOD3tstDGj940Q1fGqIkmCXBra6NJFqgP9leOF1lWzyvqstvBZ
         GBXQ==
X-Gm-Message-State: AOJu0YwbIOO6O2tx8afuqnL3OiApHSHy/+g4zES/UNcmuoH8VhEx1HrL
	b/Gc5+ek+3sDXxNE7J9GzPt6R8M6sarhsIrFXuSm7KxRlEXY8q4XLX1wUjWrm+ltrdghcNZpS0s
	4
X-Google-Smtp-Source: AGHT+IFNa6N/rbAqrsA3f8aWe2V6nqbXJaA7j/hsMd+kEopLLHOfbvtTS+cy5ti0k6l4mDr7tUg87g==
X-Received: by 2002:a05:6a20:3caa:b0:1ad:878:5006 with SMTP id adf61e73a8af0-1b264544e14mr3126358637.14.1717094295009;
        Thu, 30 May 2024 11:38:15 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702423dbfc4sm62005b3a.66.2024.05.30.11.38.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 11:38:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/7] ghostscript: fix CVE-2024-33869
Date: Thu, 30 May 2024 11:38:01 -0700
Message-Id: <fb0271a2d4e847764816b673aa37ea03ee4b3325.1717094145.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717094145.git.steve@sakoman.com>
References: <cover.1717094145.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 18:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200040

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/CVE-2024-33869-0001.patch     | 39 ++++++++++++++
 .../ghostscript/CVE-2024-33869-0002.patch     | 52 +++++++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  2 +
 3 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0001.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0002.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0001.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0001.patch
new file mode 100644
index 0000000000..2e60ae6048
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0001.patch
@@ -0,0 +1,39 @@
+From 5ae2e320d69a7d0973011796bd388cd5befa1a43 Mon Sep 17 00:00:00 2001
+From: Ken Sharp <Ken.Sharp@artifex.com>
+Date: Tue, 26 Mar 2024 12:02:57 +0000
+Subject: [PATCH 2/5] Bug #707691
+
+Part 1; when stripping a potential Current Working Dirctory specifier
+from a path, make certain it really is a CWD, and not simply large
+ebough to be a CWD.
+
+Reasons are in the bug thread, this is not (IMO) serious.
+
+This is part of the fix for CVE-2024-33869
+
+CVE: CVE-2024-33869
+
+Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=5ae2e320d69a7d0973]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ base/gpmisc.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/base/gpmisc.c b/base/gpmisc.c
+index 3b6fffa..a0b58c8 100644
+--- a/base/gpmisc.c
++++ b/base/gpmisc.c
+@@ -1162,8 +1162,8 @@ gp_validate_path_len(const gs_memory_t *mem,
+
+             continue;
+         }
+-        else if (code < 0 && cdirstrl > 0 && prefix_len == 0 && buffer == bufferfull) {
+-            buffer = bufferfull + cdirstrl + dirsepstrl;
++        else if (code < 0 && cdirstrl > 0 && prefix_len == 0 && buffer == bufferfull
++            && memcmp(buffer, cdirstr, cdirstrl) && !memcmp(buffer + cdirstrl, dirsepstr, dirsepstrl)) {
+             continue;
+         }
+         break;
+--
+2.40.0
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0002.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0002.patch
new file mode 100644
index 0000000000..5ba038a0e7
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0002.patch
@@ -0,0 +1,52 @@
+From f5336e5b4154f515ac83bc5b9eba94302e6618d4 Mon Sep 17 00:00:00 2001
+From: Ken Sharp <Ken.Sharp@artifex.com>
+Date: Tue, 26 Mar 2024 12:07:18 +0000
+Subject: [PATCH 3/5] Bug 707691 part 2
+
+See bug thread for details
+
+This is the second part of the fix for CVE-2024-33869
+
+CVE: CVE-2024-33869
+
+Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=f5336e5b4154f515ac83]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ base/gpmisc.c | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/base/gpmisc.c b/base/gpmisc.c
+index a0b58c8..69bee47 100644
+--- a/base/gpmisc.c
++++ b/base/gpmisc.c
+@@ -1089,6 +1089,27 @@ gp_validate_path_len(const gs_memory_t *mem,
+         rlen = len;
+     }
+     else {
++        char *test = (char *)path, *test1;
++        uint tlen = len, slen;
++
++        /* Look for any pipe (%pipe% or '|' specifications between path separators
++         * Reject any path spec which has a %pipe% or '|' anywhere except at the start.
++         */
++        while (tlen > 0) {
++            if (test[0] == '|' || (tlen > 5 && memcmp(test, "%pipe", 5) == 0)) {
++                code = gs_note_error(gs_error_invalidfileaccess);
++                goto exit;
++            }
++            test1 = test;
++            slen = search_separator((const char **)&test, path + len, test1, 1);
++            if(slen == 0)
++                break;
++            test += slen;
++            tlen -= test - test1;
++            if (test >= path + len)
++                break;
++        }
++
+         rlen = len+1;
+         bufferfull = (char *)gs_alloc_bytes(mem->thread_safe_memory, rlen + prefix_len, "gp_validate_path");
+         if (bufferfull == NULL)
+--
+2.40.0
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index 5fa4da0fb8..083ee4b337 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -44,6 +44,8 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2023-43115.patch \
                 file://CVE-2023-46751.patch \
                 file://CVE-2024-33870.patch \
+                file://CVE-2024-33869-0001.patch \
+                file://CVE-2024-33869-0002.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.34.1


