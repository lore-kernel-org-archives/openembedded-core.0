Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1AE0C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 07:11:42 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web11.4169.1645773101680840975
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 23:11:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=nhSK91D5;
 spf=pass (domain: intel.com, ip: 192.55.52.151,
 mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645773101; x=1677309101;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UFnv0Q2Yq30bw63L2JQq2A7/7fN2H9Ix/4asr2dqank=;
  b=nhSK91D5oemEg7yNE/rRouy0htXJNJNCcrnPILZaUZrynbUkrBvmmc5B
   jIDCCO4+2nZgTEVo/hQ6M9vHgxbFzJOkRKexnJePUpdxxG8ipwNwhPpW/
   B3PXtayTz78HGkCbiwW/rhmXePBAU1LDIx7LRxhyyG3rc3t/jgF9eBrBf
   snpxW5aqX5ZnVPaqvt6bogZvYNi56e7adL2CeMp9sBplr4xNmZkiPez4H
   yvhuplHM39mOWU4OwxI0A7K8uw8rr7kxz7uVTVFu/rCiijs6k+im03nYf
   bitqUswhVOfjS1JS5s76ZeIY8pXsVZuAZ/zz6VX2msyk0QFeaxYRwbvte
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="233063172"
X-IronPort-AV: E=Sophos;i="5.90,135,1643702400";
   d="scan'208";a="233063172"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 23:11:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,135,1643702400";
   d="scan'208";a="549142528"
Received: from cheeyang-desk1.png.intel.com ([10.158.87.104])
  by orsmga008.jf.intel.com with ESMTP; 24 Feb 2022 23:11:38 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][honister] ghostscript: fix CVE-2021-45949
Date: Fri, 25 Feb 2022 15:09:52 +0800
Message-Id: <20220225070952.2349050-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 07:11:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162340

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
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
2.25.1


