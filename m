Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D875FC77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 12:44:48 +0000 (UTC)
Received: from smtp-1908.mail.infomaniak.ch (smtp-1908.mail.infomaniak.ch [185.125.25.8])
 by mx.groups.io with SMTP id smtpd.web11.7439.1750769082697104658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 05:44:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.8, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bRPm85FR6zGNk;
	Tue, 24 Jun 2025 14:44:40 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4bRPm761zWzmDs;
	Tue, 24 Jun 2025 14:44:39 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH RFC 0/4] mesa: lighten up target's libclc dependencies and
 fix panfrost support
Date: Tue, 24 Jun 2025 14:44:23 +0200
Message-Id: <20250624-mesa-libclc-panfrost-v1-0-9ed8ca980e21@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKedWmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyMT3dzU4kTdnMyk5Jxk3YLEvLSi/OISXUMDixQzo1RDC0vLJCWg1oK
 i1LTMCrCx0UpBbs5KsbW1AJElk91rAAAA
X-Change-ID: 20250624-mesa-libclc-panfrost-108d62e1899b
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Markus Volk <f_l_k@t-online.de>, Trevor Woerner <twoerner@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 12:44:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219261

Panfrost support has been broken for a while already because it now
requires libclc which isn't enforced by default. This fixes this
oversight.

While re-adding support for panfrost, the build time for libclc were a
bit too much to my taste and I tried to figure out if we could lighten
up the dependencies for the target recipe and it seems to be the case.
The libclc and llvm dependencies seem to be only required for panfrost
and asahi when not using precompiled compilers. So this compiles them
for mesa-native, adds a dependency on it for target mesa and makes use
of it. Then we can simply remove the heavy dependencies from the target
mesa's libclc PACKAGECONFIG as well because it's only required when
building rusticl, managed by the opencl PACKAGECONFIG, which is where
the heavy dependencies are then moved (though I couldn't test if it
works properly because it doesn't compile, but that was the case before
the series too as far as I remember).

This comes at the cost of always compiling the precompiled compilers in
mesa-native (and asahi/panfrost drivers), but that is a one-time cost
(as it's not rebuilt depending on the target machine) I believe we can
afford.

This was only tested on an RK3588 (panfrost) board, I'm not sure I'm not
breaking anything else, hence the RFC. I have some patches ready for
meta-rockchip which I'll send in another thread.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (4):
      mesa: add asahi to TOOLS when selected in PACKAGECONFIG
      mesa: use native precompiled compilers instead of compiling them for the target recipe
      mesa: lighten up libclc dependencies for the target
      mesa: fix panfrost driver build

 meta/recipes-graphics/mesa/mesa.inc | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)
---
base-commit: 60e8db85886468d4455c0961d5985b65658d6b68
change-id: 20250624-mesa-libclc-panfrost-108d62e1899b

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


