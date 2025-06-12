Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92506C71136
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 12:15:04 +0000 (UTC)
Received: from smtp-42aa.mail.infomaniak.ch (smtp-42aa.mail.infomaniak.ch [84.16.66.170])
 by mx.groups.io with SMTP id smtpd.web11.11313.1749730503685439612
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 05:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.170, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bJ1gT4wfrzbQc;
	Thu, 12 Jun 2025 14:15:01 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4bJ1gT0lHlzY7K;
	Thu, 12 Jun 2025 14:15:00 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 0/2] mesa: disable building nouveau/r300 on non-x86/i686
 machines by default
Date: Thu, 12 Jun 2025 14:14:30 +0200
Message-Id: <20250612-mesa-pkgconfig-no-hardcode-llvm-v1-0-479632e13175@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKbESmgC/x3NQQqDMBBG4avIrDuQpFikVyldTJPfOFQTSUAE8
 e4Gl9/mvYMqiqLSuzuoYNOqOTXYR0d+khTBGprJGdebl3W8oAqv/+hzGjVyyjxJCT4H8DxvCxv
 IgJ810g9PapW1YNT9Pny+53kBYk2Ly3EAAAA=
X-Change-ID: 20250612-mesa-pkgconfig-no-hardcode-llvm-0ea8eb10a583
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 12:15:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218515

Whenever building gallium-llvm drivers on non-x86/i686 machines, we
currently always build r300 and nouveau drivers but they aren't
necessarily needed.

So this makes them optional by either reusing the amd PACKAGECONFIG or
adding the new nouveau PACKAGECONFIG.

This shouldn't change anything for you except if you're building
gallium-llvm drivers for non-x86/i686 machines and want those to be
enabled, then you'll need to add amd or nouveau to your PACKAGECONFIG.

Note: not tested
Note: weirdly enough, the tegra PACKAGECONFIG enables both tegra and
nouveau gallium drivers but not via the gallium-llvm PACKAGECONFIG, so
I'm not sure nouveau is actually an llvm driver or if it is, that tegra
PACKAGECONFIG actually works standalone.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (2):
      mesa: do not build r300 AMD gallium-llvm driver if not requested
      mesa: do not build nouveau NVIDIA gallium-llvm driver if not requested

 meta/recipes-graphics/mesa/mesa.inc | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)
---
base-commit: aad1f72e157cb58b70de5943646de3543d8844da
change-id: 20250612-mesa-pkgconfig-no-hardcode-llvm-0ea8eb10a583

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


