Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 725AAC433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 15:17:26 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.13168.1635347816645315769
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 08:17:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="230456820"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="230456820"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:25 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="537617193"
Received: from hchai4-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.47])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:24 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 20/36] rng-tools: add systemd-udev-settle wants to
 service
Date: Wed, 27 Oct 2021 23:16:28 +0800
Message-Id: 
 <8d57589389f029fc4df85211254204966a94f007.1635347406.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635347406.git.anuj.mittal@intel.com>
References: <cover.1635347406.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 15:17:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157536

From: Claudius Heine <ch@denx.de>

rngd needs to start after `systemd-udev-settle` in order for the kernel
modules of the random source hardware to be loaded before it is started.

However, since the `rngd.service` does not require or want
`systemd-udev-settle.service` it might not be scheduled for start and
the `After=systemd-udev-settle.service` there has no effect.

Adding `Wants=systemd-udev-settle.service` provides a weak requirement
to it, so that the `rngd` is started after it, if possible.

Signed-off-by: Claudius Heine <ch@denx.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e9715d4234eb7b45dee8b323799014646f0a1b07)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/rng-tools/rng-tools/rngd.service | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service b/meta/recipes-support/rng-tools/rng-tools/rngd.service
index 0559b97991..568686e80e 100644
--- a/meta/recipes-support/rng-tools/rng-tools/rngd.service
+++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service
@@ -3,6 +3,7 @@ Description=Hardware RNG Entropy Gatherer Daemon
 DefaultDependencies=no
 After=systemd-udev-settle.service
 Before=sysinit.target shutdown.target
+Wants=systemd-udev-settle.service
 Conflicts=shutdown.target
 
 [Service]
-- 
2.31.1


