Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E99CFC433EF
	for <webhook@archiver.kernel.org>; Sun, 23 Jan 2022 18:27:49 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.12675.1642962468879103272
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jan 2022 10:27:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VUGesCkx;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: flowergom@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id k25so15197155ejp.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jan 2022 10:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=ir9yJDTr+IfSS6dIQr+mPOjapCO3mqlGPDix8LwpElw=;
        b=VUGesCkxq5bQJFSntZC3YOlIpKp454faWhfzBr4wA+DRXMlCHSNk9l3MPqJGXe2h6+
         Q5VG+o5msSk2GTj+PguH66TLA6UPoJFPTIvEONuy/DhitS/6hApHrWImyzCBALC4z3U1
         THE0mufUgJLIm1mf5UFRcMMTszYoxpkgjegLAqJM8Jidc0O0+HYrBWrWs6sW4XSgzaaC
         9A/1N5Vjrt1MW8SsoFJsG+Uk8FBFA4xZQVW2AiZ/96rjfAz7kCQfHXVNU+KdzTwJ3eFK
         yDo7KK/3c8kvb6Gp7OnUbRKg5qDxld1ZrCs4MoO7TS4JtLxnuZ3Notz++7C5I9aFvoTE
         Jaew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ir9yJDTr+IfSS6dIQr+mPOjapCO3mqlGPDix8LwpElw=;
        b=VVSAJhywdI70JzTEB1QXcyWCVRLybWmiLWe/ZGWESXqpZVM9RChVp5UgPpCoVcc7dY
         yZZE9Afnk8f91nVgCFIqq3Y/1Uh/kUgE9bq/291K18yKtTEuqn1HaDqy9SGlrc1yMVuB
         SjIAgBhj0qAIv7Q09gWEXc8UOPYhTXjsXxz6w8YCSZxYJRxe7ndLBZYqmPX1Fz3/uO35
         cOoZmdHYrN9OUr6MH6wMFtekvgHT1JLd24pnoz3mUL1BVAHST/ydof5+x2FkQ9x3WWDk
         8t2mXvgkHaNpmU+mu+4EFYhQY2IEpLuKvSikYk4IbCqq+GtBd4GRne8K9NE/RPOuCz0v
         XqGQ==
X-Gm-Message-State: AOAM530LUrbDYc2FF24ToI37iau7n8IduY+Rcziq72Oanwk5/0HqGf+n
	HczP8IHHWfNjQPhYtcG2oBoaN4bpVhnKR1u3ox/oJAhs
X-Google-Smtp-Source: 
 ABdhPJwN2EFHeb5d5U1KEHcP8cJyHQj+oqkbe3ZsNJb3yQ//Bey7bO0eQqD125p9Bsx0XpA/XyWR1Q==
X-Received: by 2002:a17:906:36d8:: with SMTP id
 b24mr9795877ejc.342.1642962466980;
        Sun, 23 Jan 2022 10:27:46 -0800 (PST)
Received: from localhost.localdomain (p54b54585.dip0.t-ipconnect.de.
 [84.181.69.133])
        by smtp.gmail.com with ESMTPSA id
 e19sm2999106ejl.225.2022.01.23.10.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 10:27:46 -0800 (PST)
From: Minjae Kim <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [dunfell][PATCH] ghostscript: fix CVE-2021-45949
Date: Sun, 23 Jan 2022 18:27:40 +0000
Message-Id: <20220123182740.3951-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Jan 2022 18:27:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160868

Ghostscript GhostPDL 9.50 through 9.54.0 has a heap-based buffer overflow in sampled_data_finish
(called from sampled_data_continue and interp).

To apply the CVE-2021-45849 patch,
check-stack-limits-after-function-evalution.patch should be applied first.

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-45949

Signed-off-by: Minjae Kim <flowergom@gmail.com>
---
 .../ghostscript/CVE-2021-45949.patch          | 68 +++++++++++++++++++
 ...tack-limits-after-function-evalution.patch | 51 ++++++++++++++
 .../ghostscript/ghostscript_9.52.bb           |  2 +
 3 files changed, 121 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2021-45949.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/check-stack-limits-after-function-evalution.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2021-45949.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2021-45949.patch
new file mode 100644
index 0000000000..605155342e
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2021-45949.patch
@@ -0,0 +1,68 @@
+From 2a3129365d3bc0d4a41f107ef175920d1505d1f7 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Tue, 1 Jun 2021 19:57:16 +0100
+Subject: [PATCH] Bug 703902: Fix op stack management in
+ sampled_data_continue()
+
+Replace pop() (which does no checking, and doesn't handle stack extension
+blocks) with ref_stack_pop() which does do all that.
+
+We still use pop() in one case (it's faster), but we have to later use
+ref_stack_pop() before calling sampled_data_sample() which also accesses the
+op stack.
+
+Fixes:
+https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=34675
+
+Upstream-Status: Backported [https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=2a3129365d3bc0d4a41f107ef175920d1505d1f7]
+CVE: CVE-2021-45949
+Signed-off-by: Minjae Kim <flowergom@gmail.com>
+---
+ psi/zfsample.c | 16 ++++++++++------
+ 1 file changed, 10 insertions(+), 6 deletions(-)
+
+diff --git a/psi/zfsample.c b/psi/zfsample.c
+index 0e8e4bc8d..00cd0cfdd 100644
+--- a/psi/zfsample.c
++++ b/psi/zfsample.c
+@@ -533,15 +533,19 @@ sampled_data_continue(i_ctx_t *i_ctx_p)
+         for (j = 0; j < bps; j++)
+             data_ptr[bps * i + j] = (byte)(cv >> ((bps - 1 - j) * 8));        /* MSB first */
+     }
+-    pop(num_out);                 /* Move op to base of result values */
+
+-    /* Check if we are done collecting data. */
++    pop(num_out); /* Move op to base of result values */
+
++    /* From here on, we have to use ref_stack_pop() rather than pop()
++       so that it handles stack extension blocks properly, before calling
++       sampled_data_sample() which also uses the op stack.
++     */
++    /* Check if we are done collecting data. */
+     if (increment_cube_indexes(params, penum->indexes)) {
+         if (stack_depth_adjust == 0)
+-            pop(O_STACK_PAD);     /* Remove spare stack space */
++            ref_stack_pop(&o_stack, O_STACK_PAD);         /* Remove spare stack space */
+         else
+-            pop(stack_depth_adjust - num_out);
++            ref_stack_pop(&o_stack, stack_depth_adjust - num_out);
+         /* Execute the closing procedure, if given */
+         code = 0;
+         if (esp_finish_proc != 0)
+@@ -554,11 +558,11 @@ sampled_data_continue(i_ctx_t *i_ctx_p)
+             if ((O_STACK_PAD - stack_depth_adjust) < 0) {
+                 stack_depth_adjust = -(O_STACK_PAD - stack_depth_adjust);
+                 check_op(stack_depth_adjust);
+-                pop(stack_depth_adjust);
++                ref_stack_pop(&o_stack, stack_depth_adjust);
+             }
+             else {
+                 check_ostack(O_STACK_PAD - stack_depth_adjust);
+-                push(O_STACK_PAD - stack_depth_adjust);
++                ref_stack_push(&o_stack, O_STACK_PAD - stack_depth_adjust);
+                 for (i=0;i<O_STACK_PAD - stack_depth_adjust;i++)
+                     make_null(op - i);
+             }
+--
+2.25.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/check-stack-limits-after-function-evalution.patch b/meta/recipes-extended/ghostscript/ghostscript/check-stack-limits-after-function-evalution.patch
new file mode 100644
index 0000000000..722bab4ddb
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/check-stack-limits-after-function-evalution.patch
@@ -0,0 +1,51 @@
+From 7861fcad13c497728189feafb41cd57b5b50ea25 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Fri, 12 Feb 2021 10:34:23 +0000
+Subject: [PATCH] oss-fuzz 30715: Check stack limits after function evaluation.
+
+During function result sampling, after the callout to the Postscript
+interpreter, make sure there is enough stack space available before pushing
+or popping entries.
+
+In thise case, the Postscript procedure for the "function" is totally invalid
+(as a function), and leaves the op stack in an unrecoverable state (as far as
+function evaluation is concerned). We end up popping more entries off the
+stack than are available.
+
+To cope, add in stack limit checking to throw an appropriate error when this
+happens.
+
+Upstream-Status: Backported [https://git.ghostscript.com/?p=ghostpdl.git;a=patch;h=7861fcad13c497728189feafb41cd57b5b50ea25]
+Signed-off-by: Minjae Kim <flowergom@gmail.com>
+---
+ psi/zfsample.c | 14 +++++++++++---
+ 1 file changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/psi/zfsample.c b/psi/zfsample.c
+index 290809405..652ae02c6 100644
+--- a/psi/zfsample.c
++++ b/psi/zfsample.c
+@@ -551,9 +551,17 @@ sampled_data_continue(i_ctx_t *i_ctx_p)
+     } else {
+         if (stack_depth_adjust) {
+             stack_depth_adjust -= num_out;
+-            push(O_STACK_PAD - stack_depth_adjust);
+-            for (i=0;i<O_STACK_PAD - stack_depth_adjust;i++)
+-                make_null(op - i);
++            if ((O_STACK_PAD - stack_depth_adjust) < 0) {
++                stack_depth_adjust = -(O_STACK_PAD - stack_depth_adjust);
++                check_op(stack_depth_adjust);
++                pop(stack_depth_adjust);
++            }
++            else {
++                check_ostack(O_STACK_PAD - stack_depth_adjust);
++                push(O_STACK_PAD - stack_depth_adjust);
++                for (i=0;i<O_STACK_PAD - stack_depth_adjust;i++)
++                    make_null(op - i);
++            }
+         }
+     }
+
+--
+2.25.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.52.bb b/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
index 32346e6811..ac3d0dca43 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
@@ -39,6 +39,8 @@ SRC_URI = "${SRC_URI_BASE} \
            file://ghostscript-9.21-prevent_recompiling.patch \
            file://cups-no-gcrypt.patch \
            file://CVE-2020-15900.patch \
+           file://check-stack-limits-after-function-evalution.patch \
+           file://CVE-2021-45949.patch \
            "
 
 SRC_URI_class-native = "${SRC_URI_BASE} \
-- 
2.17.1


