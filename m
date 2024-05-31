Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF450C25B75
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 11:55:15 +0000 (UTC)
Received: from smtp-190c.mail.infomaniak.ch (smtp-190c.mail.infomaniak.ch [185.125.25.12])
 by mx.groups.io with SMTP id smtpd.web10.9680.1717156513824305998
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 May 2024 04:55:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.12, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4VrM4b5Sk9z5MF;
	Fri, 31 May 2024 13:55:11 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4VrM4b0RDBztYh;
	Fri, 31 May 2024 13:55:10 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 0/3] prepare Panthor (open-source) support for Arm GPU
Date: Fri, 31 May 2024 13:53:55 +0200
Message-Id: <20240531-panthor-v1-0-1a76fd752c1b@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFO6WWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDUyNL3YLEvJKM/CJdMwMg18DAwjjJLEkJqLqgKDUtswJsUnRsbS0AhgN
 3w1kAAAA=
To: Quentin Schulz <quentin.schulz@cherry.de>, 
 openembedded-core@lists.openembedded.org
X-Mailer: b4 0.13.0
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 11:55:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200064

Panthor is the open-source implementation for the Arm GPU Valhall series
both in the Linux kernel and Mesa userspace. In the latter, the panfrost
"driver" is actually handling this version of the Arm GPU. One therefore
needs to enable kmsro and panfrost in PACKAGECONFIG to be able to use
this open-source implementation.

The open-source implementation still requires a proprietary blob which
is running on the GPU: mali_csffw.bin. Note that the closed-source
implementation (libmali and vendor kernel drivers) also require this
blob.

Right now, we're still missing a linux-yocto v6.10+ to be able to test
this with everything upstream in Yocto/OE, but I was able to
successfully test this with kmscube on a downstream kernel (6.6 +
backported patches for GPU and custom patches for DSI support) on an
RK3588 Tiger.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (3):
      linux-firmware: update to 20240513
      mesa: upgrade 24.0.7 -> 24.1.0
      mesa: add new package for Mali CSFFW Valhall firmware

 .../files/0001-drisw-fix-build-without-dri3.patch  | 58 ----------------------
 ...ext-don-t-try-zink-if-not-enabled-in-mesa.patch | 42 ----------------
 .../mesa/{mesa-gl_24.0.7.bb => mesa-gl_24.1.0.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc                |  4 +-
 .../mesa/{mesa_24.0.7.bb => mesa_24.1.0.bb}        |  0
 ...ware_20240312.bb => linux-firmware_20240513.bb} | 33 ++++++++----
 6 files changed, 25 insertions(+), 112 deletions(-)
---
base-commit: 99ff46cc9bb12619af55c892452cee3b90a545f0
change-id: 20240529-panthor-600520083b6b

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


