Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B04F433FE
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 05:54:20 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7106.1776318857187826463
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 22:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jSNbU/Ij;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2d868d014a5so4319838eec.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 22:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776318856; x=1776923656; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8th4kogYjMcfWvStJxlxaxglYrG7Bi9h+64h36bnQ0g=;
        b=jSNbU/IjL33qFvdqdQBzx3LdKdJRzPRE223vSJ0zOhm10QLTPVuvFQakC45jOzw0b6
         0RiEDEUg9Fa5JpaUr1x5AKMc75ADOLJpKMEN2u73BmWFQmez0i13zPXpT9/2JRY1kebD
         0mfNiX9dnSdNxRIdRE8mAfCBSaInYbuvIjerWbJ+by0RtjwmqAeUiMRkR9tHJUXfl8ko
         2mGMw5XreJNFvMyAK7Qez8DPs6mDg30NNS5TBLI1/s2Y+0tnuZ6eTWpTI5qY5TalDdjJ
         A8MBdCkH8Xouv+/nX9FPQ+FC/aXCPzP1E1JpqcrZHk1qgaX8ikUnVnqnJhpET/bWtbF2
         9qkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776318856; x=1776923656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8th4kogYjMcfWvStJxlxaxglYrG7Bi9h+64h36bnQ0g=;
        b=kb+QQsgqP8rTTCsjvVwUN9XVsbilN6PjePe9hIzjpxYwakhnQKBv+Gr2XlE6udXHzS
         isO5ka9acR5g7J7PB8Hkj79HlDxfvmO9Tfy7oarfNX+qPvUszT70qs33qm7KsRwl9U2o
         mvx57JEWH/M1fo7w8XBrBVnhE0tGseaJgGRN6k4xGH7M4cJiwg41r1FfLZPWRmQXux0A
         cOFj+WWeA1CtQ1qRiGWSdX+WbX8uLyggOb9b44b4LvrzJBBDOq3j0mrEDg94/V2hvaw8
         By8jGSokSZLHvHHtoanQG0GKJHLpyAZEEQdQAD7NqK8/Y7TMn30ZrguSrx8H8iMxRxGN
         YwIg==
X-Gm-Message-State: AOJu0YyJHZrRV75nasCEAcKUhh/r4XTBquq/Ejp3u9pLSBcI+dzlq6Cm
	hofj426YU76fGuiLQ3O+1p5TtlvjYM+EU/xWsfs1/EnlY/E8KusMAVaGg+5briIF
X-Gm-Gg: AeBDieupK/gxdhS15OeGNuDfHRi0HOR/ww0oRoeAJX+tUZegFoOQCajn5+BIlKeHRW9
	m1YP0brdKQp+BeCB5zfdwsM0lMviXkn2ufBbiQHzHOD5cVe5YK80No+HixptIyQyHRHmdp+dg9d
	v1vFBZ+1ln8bnBT8/aYVNNToVXyVSKRwJA3nKlgQsORPBqUIWRxnul6SXVOwXvmo29pZoBdR+ZM
	ydUCzKM7Dj5FUJvHgurCIXko/pMLKPTxiGPBb75oQTayE7rQpdXzJSnkMnGlU4eLyMIReAWCQNz
	deqHNgJtY3rHi9dP6/eqHbcffVXLAjJnbRQ8uEoYkJ4xcGHOP71ShDfts6tWngasK4gD3dMOfEz
	x4ql16Tct9Hh3HqArPZ6KLgPQfKTGc1NIU3HC5sbZAHbiLcW0JLLzPURBZraPSiJpambme6eDbx
	dOjizUMNw4XrNd1CX+whDbYyjZP7iyYj+t1ziVgWydcexhUQSKVAbNJgMZMyzXoBShO7o5e2s1z
	qcEI1w1z8CFK+XPmtg85VhH6DhMJZM/Fz5cByts/f+tdHSi+kdnH6/5habOYuwnRi2oDrbuqDdb
	gBieuPmXA5gGMJRMIilxRxZ2FmTFguvIky5WVsuNtglxFypt7UA=
X-Received: by 2002:a05:7300:fb88:b0:2ca:9b08:e7d2 with SMTP id 5a478bee46e88-2d58945e0b8mr13292656eec.22.1776318856255;
        Wed, 15 Apr 2026 22:54:16 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8eb8443csm6060212eec.14.2026.04.15.22.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 22:54:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 6/7] re2c: upgrade 4.4 -> 4.5.1
Date: Wed, 15 Apr 2026 22:54:06 -0700
Message-ID: <20260416055407.795016-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416055407.795016-1-khem.raj@oss.qualcomm.com>
References: <20260416055407.795016-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 05:54:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235338

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../re2c/re2c/CVE-2026-2903.patch             | 68 -------------------
 .../re2c/{re2c_4.4.bb => re2c_4.5.1.bb}       |  5 +-
 2 files changed, 2 insertions(+), 71 deletions(-)
 delete mode 100644 meta/recipes-support/re2c/re2c/CVE-2026-2903.patch
 rename meta/recipes-support/re2c/{re2c_4.4.bb => re2c_4.5.1.bb} (86%)

diff --git a/meta/recipes-support/re2c/re2c/CVE-2026-2903.patch b/meta/recipes-support/re2c/re2c/CVE-2026-2903.patch
deleted file mode 100644
index 266891fa49..0000000000
--- a/meta/recipes-support/re2c/re2c/CVE-2026-2903.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From febeb977936f9519a25d9fbd10ff8256358cdb97 Mon Sep 17 00:00:00 2001
-From: Ulya Trofimovich <skvadrik@gmail.com>
-Date: Tue, 3 Feb 2026 21:33:11 +0000
-Subject: [PATCH] Fix null pointer dereference when actions are used without
- rules.
-
-Null pointer dereference happened because the root TNFA state was null:
-there were no rules for a block, but determinization still happened.
-
-In this case re2c should emit an error and never even attempt
-determinization. It was properly handled for blocks with start
-conditions, but not for normal blocks.
-
-This addresses #571 "[Bug] Segmentation Fault (NULL Dereference) in
-re2c::closure_leftmost_dfs during determinization".
-
-CVE: CVE-2026-2903
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- src/parse/ast.cc                | 19 +++++++++++++++----
- test/conditions/cond_error_10.c |  2 +-
- 2 files changed, 16 insertions(+), 5 deletions(-)
-
-diff --git a/src/parse/ast.cc b/src/parse/ast.cc
-index 91865e801..986cfb7da 100644
---- a/src/parse/ast.cc
-+++ b/src/parse/ast.cc
-@@ -332,10 +332,6 @@ Ret check_and_merge_special_rules(AstGrams& grams, const opt_t* opts, Msg& msg,
-                 all_conds_have_it = false; \
-             } else if (g.name == STAR_COND) { \
-                 star_action = g.action[0]; \
--            } else if (g.rules.empty()) { \
--                RET_FAIL(msg.error(g.action[0]->loc, \
--                    "%s action for non-existing condition `%s` found", \
--                    str, g.name.c_str())); \
-             } \
-         } \
-         if (star_action && all_conds_have_it) { \
-@@ -422,6 +418,21 @@ Ret check_and_merge_special_rules(AstGrams& grams, const opt_t* opts, Msg& msg,
-         }
-     }
- 
-+    for (const AstGram& g : grams) {
-+        if (g.rules.empty()) {
-+#define CHECK_ACTION(action, str) do { \
-+            if (!g.action.empty()) { \
-+                RET_FAIL(msg.error(g.action[0]->loc, \
-+                    "%s action %sbut no rules found", str, incond(g.name).c_str())); \
-+            } \
-+} while(0)
-+            CHECK_ACTION(entry, "entry");
-+            CHECK_ACTION(pre_rule, "pre-rule");
-+            CHECK_ACTION(post_rule, "post-rule");
-+#undef CHECK_ACTION
-+        }
-+    }
-+
-     // zero condition must be the first one.
-     auto zero = std::find_if(
-             grams.begin(), grams.end(), [](const AstGram& g) { return g.name == ZERO_COND; });
-diff --git a/test/conditions/cond_error_10.c b/test/conditions/cond_error_10.c
-index 571028a22..3bfde301b 100644
---- a/test/conditions/cond_error_10.c
-+++ b/test/conditions/cond_error_10.c
-@@ -1 +1 @@
--conditions/cond_error_10.re:7:5: error: pre-rule action for non-existing condition `c` found
-+conditions/cond_error_10.re:7:5: error: pre-rule action in condition 'c' but no rules found
diff --git a/meta/recipes-support/re2c/re2c_4.4.bb b/meta/recipes-support/re2c/re2c_4.5.1.bb
similarity index 86%
rename from meta/recipes-support/re2c/re2c_4.4.bb
rename to meta/recipes-support/re2c/re2c_4.5.1.bb
index ea9364c483..ee3774017f 100644
--- a/meta/recipes-support/re2c/re2c_4.4.bb
+++ b/meta/recipes-support/re2c/re2c_4.5.1.bb
@@ -6,10 +6,9 @@ SECTION = "devel"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
 
-SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz \
-           file://CVE-2026-2903.patch"
+SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "6b6b865924447ef992d5db4e52fb9307e5f65f26edd43efa91395da810f4280a"
+SRC_URI[sha256sum] = "ffea067c11aa668bcb42885be6e6cd000302000b7747d2bb213299ec66b7864e"
 GITHUB_BASE_URI = "https://github.com/skvadrik/re2c/releases"
 
 BBCLASSEXTEND = "native nativesdk"

