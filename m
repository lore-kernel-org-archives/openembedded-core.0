Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 301FDC433FE
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 19:51:14 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web08.2929.1643917873119465618
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=IStBR0R2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id y17so3112339plg.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=c+Oxx+xLd4XWfizkWCZNk71JkfG9VEchmY+85IBvilY=;
        b=IStBR0R2Qz7AKK9qOwsaKfzZe1nNAaDsGIo4B69ghdjhqIA6NqMCr5yoFKmBunkgPV
         SJrso+z0X7Q2c7hJNvhdUXyGGwuhf7p5pImAxssJKooyVCLOT8kZWgDvd+aC/ewC6IKn
         VfQ9sPr+P4zRjWbdAsHbXSRzoWsF0M9Item/FnKLimW8Em3KFKGwMDOw4PyUuXFDmPxe
         nTEKSejWUNzFvAqqTSLKpHB+xzQtM7TZp8rPEBPPzgqRf2ylhc917pWGv9n8wW3jzDg4
         8W/8oZHiwe4/I0I1I7ULbFvPXBvryNlbEhgRMZiNenm38l9uTzxuKx0yytvnjWuyJQB3
         muug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c+Oxx+xLd4XWfizkWCZNk71JkfG9VEchmY+85IBvilY=;
        b=zUR6U0Dts+UuGmN6UVNzUrQ8aydsxv9CRM75VPsxhpP17HhE+fkqF3Q7/DNQy+mQDw
         vaiZIBislbqefryAh0ldkKNgbX3VSDlymCDLW7raeNHgNOKUM1jsYo8mz48cuxtF6/kj
         RTdy0y1pPbl0zPEUCwg+qIiUm6QkHzCpdnD+GCpkrF3S0K6y4LYZzcNbJ/JHvMmfXb+v
         194mjyU7tH27+e1V2wKwG23CtSMW7DhBR3FthXsmLCJNQdLK59i2S2hzkAT7rwI0KYTT
         CMm8CZsQuAZpeKOseKrn4xrXE3Dka8yY5XQ3Zgb0aQg5RZeo44EQmbwkZMRA9/JFP8WH
         U/wA==
X-Gm-Message-State: AOAM530PM7CgVbcfHPrUA7OmMbm/sY9e9OKxJamCv+dti4Gl/KPqxMMx
	65zrMFvkhkRp05QxiQW80o5FM/NJBtsbb4/o
X-Google-Smtp-Source: 
 ABdhPJxJj8/A3B+MKNmADp2LU1mbTrMDzDWJCcIAqhsiRd1MTh76J1zQKNAkaQlhpPbeYK8rD4eC+Q==
X-Received: by 2002:a17:903:2309:: with SMTP id
 d9mr36529014plh.32.1643917871974;
        Thu, 03 Feb 2022 11:51:11 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s4sm27762216pgg.80.2022.02.03.11.51.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 11:51:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/20] ghostscript: fix CVE-2021-45949
Date: Thu,  3 Feb 2022 09:50:29 -1000
Message-Id: 
 <ec4794647202035e46384327b7ef34b4b99826bc.1643917717.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1643917717.git.steve@sakoman.com>
References: <cover.1643917717.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 19:51:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161300

From: Minjae Kim <flowergom@gmail.com>

Ghostscript GhostPDL 9.50 through 9.54.0 has a heap-based buffer overflow in sampled_data_finish
(called from sampled_data_continue and interp).

To apply this CVE-2021-45959 patch,
the check-stack-limits-after-function-evalution.patch should be applied first.

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-45949

Signed-off-by: Minjae Kim <flowergom@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/CVE-2021-45949.patch          | 65 +++++++++++++++++++
 ...tack-limits-after-function-evalution.patch | 51 +++++++++++++++
 .../ghostscript/ghostscript_9.52.bb           |  2 +
 3 files changed, 118 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2021-45949.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/check-stack-limits-after-function-evalution.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2021-45949.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2021-45949.patch
new file mode 100644
index 0000000000..f312f89e04
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2021-45949.patch
@@ -0,0 +1,65 @@
+From 6643ff0cb837db3eade489ffff21e3e92eee2ae0 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Fri, 28 Jan 2022 08:21:19 +0000
+Subject: [PATCH] [PATCH] Bug 703902: Fix op stack management in
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
+ psi/zfsample.c | 13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/psi/zfsample.c b/psi/zfsample.c
+index 0023fa4..f84671f 100644
+--- a/psi/zfsample.c
++++ b/psi/zfsample.c
+@@ -534,14 +534,17 @@ sampled_data_continue(i_ctx_t *i_ctx_p)
+             data_ptr[bps * i + j] = (byte)(cv >> ((bps - 1 - j) * 8));	/* MSB first */
+     }
+     pop(num_out);		    /* Move op to base of result values */
+-
++    /* From here on, we have to use ref_stack_pop() rather than pop()
++       so that it handles stack extension blocks properly, before calling
++       sampled_data_sample() which also uses the op stack.
++    */
+     /* Check if we are done collecting data. */
+ 
+     if (increment_cube_indexes(params, penum->indexes)) {
+         if (stack_depth_adjust == 0)
+-            pop(O_STACK_PAD);	    /* Remove spare stack space */
++	    ref_stack_pop(&o_stack, O_STACK_PAD);         /* Remove spare stack space */
+         else
+-            pop(stack_depth_adjust - num_out);
++            ref_stack_pop(&o_stack, stack_depth_adjust - num_out);
+         /* Execute the closing procedure, if given */
+         code = 0;
+         if (esp_finish_proc != 0)
+@@ -554,11 +557,11 @@ sampled_data_continue(i_ctx_t *i_ctx_p)
+             if ((O_STACK_PAD - stack_depth_adjust) < 0) {
+                 stack_depth_adjust = -(O_STACK_PAD - stack_depth_adjust);
+                 check_op(stack_depth_adjust);
+-                pop(stack_depth_adjust);
++		ref_stack_pop(&o_stack, stack_depth_adjust);
+             }
+             else {
+                 check_ostack(O_STACK_PAD - stack_depth_adjust);
+-                push(O_STACK_PAD - stack_depth_adjust);
++		ref_stack_push(&o_stack, O_STACK_PAD - stack_depth_adjust);
+                 for (i=0;i<O_STACK_PAD - stack_depth_adjust;i++)
+                     make_null(op - i);
+             }
+-- 
+2.17.1
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
2.25.1


