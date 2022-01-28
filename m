Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56943C433F5
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 08:39:06 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.4688.1643359144783345010
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 00:39:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OVp58vnx;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: flowergom@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id d10so13507877eje.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 00:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=/gr7LWbhVj/ovtOQIFKNhRXu5O5CTAinZly1IAM+wRI=;
        b=OVp58vnxGP7kZYEjPDa0Fe9RNi80KtErWRUz/hhC19W74CL+gjM4iMPkH77g7EHb+p
         d1aSuO6QhrmEnwUwfotPd7Bhags8ZTpWST3DQyxSg69Ub2in0MlFuoFSEnZPgJJPqsAv
         HU2i9Hyom3/NTisM6sq6oewFgxJL1VIiLry6t4Tt2fS0IQTRl85FnlpFVhy0EgX2i31A
         cSsEvS06l6mDhmQw1sKjEU+5hfrfHwIi9dt3s6CzzQjRmHej1Hs1f4O5rFnvwiq4xGIq
         fcBZxd9bQgOVfLvWz5ETRuR9MuSnXh8HcR0kQ8voDjklE1VDP7+L4XY2CQMUZCDg1QfQ
         Ydxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/gr7LWbhVj/ovtOQIFKNhRXu5O5CTAinZly1IAM+wRI=;
        b=gmWh214jMwrnETDE3Kphx2Xvib2PvKLqtkHzB38B7arZnIG0+2c7pPZCE5F4xC03+M
         9Rbswi0QgIwIGLWLfbu/UaCwPubfr80FoE+gp4zA0yzcBON09I+VxnwwuiZXquDZFQ2y
         BbaghhpNNEIYhDbk93BkSLWMqJ6eQJKWOcC7VdL5L0KO4VcrnTPqyJlIGwydoM2kuV4v
         6Y9FIbQpGPR2S9Fr928/UbXbmcVPteUegE+2g75vKyPQriXs6gqcpKN+UipqaGEiDNhw
         ieBp2YV3p1cbni1Wn5i5WMlJoOZ/5hxYPPdn6W5B8VVJCI+bsC1qClIe8M4g3LouWY3y
         xC6Q==
X-Gm-Message-State: AOAM533DSduNL+sMWqvEE1V+S7Tmb09WSqRQdKSIupIW+einahjzFqxM
	m/7ABgk8BIwCr5DKnSOzJdSqn43oazNV/dql
X-Google-Smtp-Source: 
 ABdhPJxkaoszCdeBPAPqgK4MWL5TC+Ijh3D9LuxLAGwRNhjxKfywsMfBeU76WLNO/LafUFv+NFpW6w==
X-Received: by 2002:a17:907:7ea5:: with SMTP id
 qb37mr5874145ejc.573.1643359142847;
        Fri, 28 Jan 2022 00:39:02 -0800 (PST)
Received: from localhost.localdomain (p54b54585.dip0.t-ipconnect.de.
 [84.181.69.133])
        by smtp.gmail.com with ESMTPSA id
 cf24sm9606146ejb.133.2022.01.28.00.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 00:39:02 -0800 (PST)
From: Minjae Kim <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <mj.kim@daimler.com>,
	Minjae Kim <flowergom@gmail.com>
Subject: [dunfell][PATCH v3] ghostscript: fix CVE-2021-45949
Date: Fri, 28 Jan 2022 08:38:55 +0000
Message-Id: <20220128083855.87640-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jan 2022 08:39:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161071

From: Minjae Kim <mj.kim@daimler.com>

Ghostscript GhostPDL 9.50 through 9.54.0 has a heap-based buffer overflow in sampled_data_finish
(called from sampled_data_continue and interp).

To apply this CVE-2021-45959 patch,
the check-stack-limits-after-function-evalution.patch should be applied first.

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-45949

Signed-off-by: Minjae Kim <flowergom@gmail.com>
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
2.17.1


