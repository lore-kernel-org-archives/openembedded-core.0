Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BBF2C4828E
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 20:47:13 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.6775.1706820428558599057
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 12:47:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net ([70.99.78.136])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 411Kk16n007767;
	Thu, 1 Feb 2024 14:46:01 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Cc: mark.hatle@amd.com, raj.khem@gmail.com, jon.mason@arm.com
Subject: [PATCH v2 0/4] Updates for ARM tunings
Date: Thu,  1 Feb 2024 14:45:49 -0600
Message-Id: <1706820353-6967-1-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 20:47:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194748

From: Mark Hatle <mark.hatle@amd.com>

cortexa78 missing seems to be an oversight.  It (according to wikipedia) is a
successor to the cortexa77 which already exists.  This was created by
copying the cortexa77 and changing it to be a78.  A test system was build to
verify no obvious issues with the toolchain.

The remaining three changes are related.  I've got a need for a cortex-r5 and
cortex-r52 that enables the hard-float calling convention (this might also
be useful to others with other cortex-r and maybe even cortex-m processors,
but I'm not in a position to know this outside of my specific need.)

tune-cortexr5 simply adds an hf variant that adds the callconvention-hard.
Since there is no armv7r-vfp3d16 w/ this, the package_arch list is more
limited then the regular r5.

tune-cortexr52 requires the change to feature-arm-vfp to allow the setting
when 'simd' is enabled (since we don't specify vfp or neon).  Otherwise
this follows the same convention as the r5 change.

v2:
Rebase cortex-a78 tune based on current master-next branch.  THis addresses
Khem's comment.

Mark Hatle (4):
  tune-cortexa78.inc: Add cortexa78 tune, based on cortexa77
  feature-arm-vfp.inc: Allow hard-float on newer simd targets
  tune-cortexr5: Add hard-float variant
  tune-cortexr52: Add hard-float variant

 .../include/arm/armv7r/tune-cortexr5.inc        |  5 +++++
 .../include/arm/armv8-2a/tune-cortexa78.inc     | 17 +++++++++++++++++
 .../include/arm/armv8r/tune-cortexr52.inc       |  5 +++++
 .../machine/include/arm/feature-arm-vfp.inc     |  3 ++-
 4 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa78.inc

-- 
2.34.1


