Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA15C48260
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 21:04:12 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.142.1706216649656417698
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jan 2024 13:04:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net ([70.99.78.136])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 40PL44R5030454;
	Thu, 25 Jan 2024 15:04:04 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Cc: mark.hatle@amd.com
Subject: [PATCH 0/1] Support running qemu on kernel older then 4.17
Date: Thu, 25 Jan 2024 15:03:53 -0600
Message-Id: <1706216634-8340-1-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 21:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194332

We were attempting to build qemu on an Ubuntu 18.04 system and ran into
an issue where certain (newer) MMAP flags were not defined.  After further
tracking it was determined that QEMU 8.1 moved forward and only supports
usage on kernel 4.17 or newer.

Using the patch included with this, you can build for an older host, but
more importantly you can build an SDK that includes QEMU that will execute
on the 'SDK_OLDEST_KERNEL'.  While I've not gone back and verified things
work on 3.2.0 system, I have verified that Ubuntu 18.04 is working for me.

(Ubuntu 18.04 is kernel 4.15)

Mark Hatle (1):
  qemu: Allow native and nativesdk versions on Linux older then 4.17

 meta/recipes-devtools/qemu/qemu.inc           |  12 +
 ...round-for-missing-MAP_FIXED_NOREPLAC.patch | 286 ++++++++++++++++++
 ...round-for-missing-MAP_SHARED_VALIDAT.patch |  51 ++++
 3 files changed, 349 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0011-linux-user-workaround-for-missing-MAP_FIXED_NOREPLAC.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0012-linux-user-workaround-for-missing-MAP_SHARED_VALIDAT.patch

-- 
2.34.1


