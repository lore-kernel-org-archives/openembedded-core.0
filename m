Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CCEFC48286
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 20:47:13 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.6774.1706820427667032605
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 12:47:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net ([70.99.78.136])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 411Kk16p007767;
	Thu, 1 Feb 2024 14:46:02 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Cc: mark.hatle@amd.com, raj.khem@gmail.com, jon.mason@arm.com
Subject: [PATCH v2 2/4] feature-arm-vfp.inc: Allow hard-float on newer simd targets
Date: Thu,  1 Feb 2024 14:45:51 -0600
Message-Id: <1706820353-6967-3-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1706820353-6967-1-git-send-email-mark.hatle@kernel.crashing.org>
References: <1706820353-6967-1-git-send-email-mark.hatle@kernel.crashing.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 20:47:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194747

From: Mark Hatle <mark.hatle@amd.com>

Currently hard-float is dependency upon the special TUNE_CCARGS_MFPU which
contains custom -mfpu= values.  However, newer 32-bit architectures like
cortex-r52 use 'simd' instead.  There is no 'simd' entry for -mfpu=
according to the GCC manual, it's more or less automatic based on the
cpu settings.

Add this as an exception to the TUNE_CCARGS_FLOAT setting of hard or softfp.

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/conf/machine/include/arm/feature-arm-vfp.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc b/meta/conf/machine/include/arm/feature-arm-vfp.inc
index 678888e638..d020100daa 100644
--- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
+++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
@@ -5,11 +5,12 @@
 TUNEVALID[vfp] = "Enable Vector Floating Point (vfp) unit."
 TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfp', ' vfp', '', d)}"
 
+# simd is special, we don't pass this to the -mfpu, it's implied
 TUNE_CCARGS  .= "${@ (' -mfpu=%s' % d.getVar('TUNE_CCARGS_MFPU').split()[-1]) if (d.getVar('TUNE_CCARGS_MFPU') != '') else ''}"
 # The following deals with both vfpv3-d16 and vfpv4-d16
 ARMPKGSFX_FPU = "${@ ('-%s'       % d.getVar('TUNE_CCARGS_MFPU').split()[-1].replace('-d16', 'd16')) if (d.getVar('TUNE_CCARGS_MFPU') != '') else ''}"
 
 TUNEVALID[callconvention-hard] = "Enable EABI hard float call convention, requires VFP."
-TUNE_CCARGS_MFLOAT = "${@ bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'hard', 'softfp', d) if (d.getVar('TUNE_CCARGS_MFPU') != '') else '' }"
+TUNE_CCARGS_MFLOAT = "${@ bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'hard', 'softfp', d) if (d.getVar('TUNE_CCARGS_MFPU') != '' or bb.utils.contains('TUNE_FEATURES', 'simd', True, False, d)) else '' }"
 TUNE_CCARGS   .= "${@ ' -mfloat-abi=${TUNE_CCARGS_MFLOAT}' if (d.getVar('TUNE_CCARGS_MFLOAT') != '')     else ''}"
 ARMPKGSFX_EABI = "${@ 'hf'                                 if (d.getVar('TUNE_CCARGS_MFLOAT') == 'hard') else ''}"
-- 
2.34.1


