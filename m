Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F839C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 03:40:35 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.16230.1646019633714561008
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Feb 2022 19:40:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=TcgrH1z7;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646019634; x=1677555634;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=WI0PH5tBcC1+f4iMsOYKWGsuOikQBGPGBdyMDgT8Zic=;
  b=TcgrH1z7JGDraqxaFwxAnlCLb+x1te0933kHO4cQSLn+3Ak59tU7mQM3
   ESpJ4UYLyv+z/CNDff8xO+J1Wys5IMXLQVNCxTm6GVkwGQWGkN+V2qGng
   dn6sa4p+RChAqY/l3rL7wLq1nX7q3LY8t0ikzyKzjuJhFFuTKd0AWlaQB
   05luN0UhasFI7eZoTaNMPgMTKeD7eQpattRybQsVAdI3RP/YrvYGgB0DP
   RA0zhO2nIDNh6pyXdppzZohcgVeLwD9K2pem21XkCKLqExCnzGjQu1GkS
   TBb9+clubUGhX/FB8dH/uNV1WsTng3w/fYaWmHtZY0aI3RFtgDSt6VZ+n
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="252988317"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="252988317"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2022 19:40:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="509942099"
Received: from cheeyang-desk1.png.intel.com ([10.158.87.104])
  by orsmga006.jf.intel.com with ESMTP; 27 Feb 2022 19:40:32 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][hardknott 2/3] ghostscript: fix CVE-2021-45949
Date: Mon, 28 Feb 2022 11:38:38 +0800
Message-Id: <20220228033839.2386940-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228033839.2386940-1-chee.yang.lee@intel.com>
References: <20220228033839.2386940-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 03:40:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162449

From: Minjae Kim <flowergom@gmail.com>

Ghostscript GhostPDL 9.50 through 9.54.0 has a heap-based buffer overflow in sampled_data_finish
(called from sampled_data_continue and interp).

To apply this CVE-2021-45959 patch,
the check-stack-limits-after-function-evalution.patch should be applied first.

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-45949

(From OE-Core rev: 5fb43ed64ae32abe4488f2eb37c1b82f97f83db0)

Signed-off-by: Minjae Kim <flowergom@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../ghostscript/CVE-2021-45949.patch          | 65 +++++++++++++++++++
 ...tack-limits-after-function-evalution.patch | 51 +++++++++++++++
 .../ghostscript/ghostscript_9.53.3.bb         |  2 +
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
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.53.3.bb b/meta/recipes-extended/ghostscript/ghostscript_9.53.3.bb
index 216822478f..958a88e968 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.53.3.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.53.3.bb
@@ -34,6 +34,8 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://avoid-host-contamination.patch \
                 file://mkdir-p.patch \
                 file://0001-Bug-704342-Include-device-specifier-strings-in-acces.patch \
+                file://check-stack-limits-after-function-evalution.patch \
+                file://CVE-2021-45949.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.25.1


