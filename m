Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CBD5C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 14:13:43 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.26505.1646662420742202043
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 06:13:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=mUexs8L9;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646662422; x=1678198422;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=nvkp3c2XrhobJ/PX/Uw8epa3sLDvIDiO94QMD/EIG+c=;
  b=mUexs8L9hrxbgD85QKYXy0yfzd0h+DOYZY0cEcU5HrFuOAU3IGrUvGnU
   EphTZyfUi5/IB9U5moss85cXFjwLtfCwUs6GizyNlcYUHSImd+a1Zywb/
   76jY5fFk4gcLtDirL79umTfTTw6luqeCrzW2GlokoX7DY2flZliUKR7SY
   5Olh0GxGt8Q0oXmG4EjV9+mcDGzQC+FvasA9hj9DmiEG4JIVDbfPOyM8v
   NxL3vSEf1WJW6FopBCw9Wv6RntbgSHJVQRw8nm7S8dcCLK6YPvDbkdE+w
   y62tM/ax0e85ptPMVfSojAIyGYoWNATLw3brlCH1y4dgNw17tNJhVsqiS
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="315112451"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="315112451"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:15 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="495070793"
Received: from hmohdnox-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.227.91])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:14 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 05/25] ghostscript: fix CVE-2021-45949
Date: Mon,  7 Mar 2022 22:09:41 +0800
Message-Id: 
 <aebdb079eba5426253c5709e1ea20b97a302b556.1646661615.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646661615.git.anuj.mittal@intel.com>
References: <cover.1646661615.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 14:13:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162826

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../ghostscript/CVE-2021-45949.patch          | 68 +++++++++++++++++++
 .../ghostscript/ghostscript_9.54.0.bb         |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2021-45949.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2021-45949.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2021-45949.patch
new file mode 100644
index 0000000000..8e4fd40932
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
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
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
+             data_ptr[bps * i + j] = (byte)(cv >> ((bps - 1 - j) * 8));	/* MSB first */
+     }
+-    pop(num_out);		    /* Move op to base of result values */
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
+-            pop(O_STACK_PAD);	    /* Remove spare stack space */
++            ref_stack_pop(&o_stack, O_STACK_PAD);	    /* Remove spare stack space */
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
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.54.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.54.0.bb
index 59cc560cf8..d4442a4908 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.54.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.54.0.bb
@@ -33,6 +33,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://do-not-check-local-libpng-source.patch \
                 file://avoid-host-contamination.patch \
                 file://mkdir-p.patch \
+                file://CVE-2021-45949.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.35.1


