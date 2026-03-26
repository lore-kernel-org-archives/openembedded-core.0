Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A5E910A1E77
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:06:11 +0000 (UTC)
Received: from smtp-42aa.mail.infomaniak.ch (smtp-42aa.mail.infomaniak.ch [84.16.66.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45538.1774523165759363677
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:06:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=Qsxn9sFE;
 spf=pass (domain: 0leil.net, ip: 84.16.66.170, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fhLYR4h9bzNjJ;
	Thu, 26 Mar 2026 12:06:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1774523163;
	bh=uz4aVya9uKtTDpdLNQfKYHMg17h9CORrGc6DQ3Qouhc=;
	h=From:Subject:Date:To:Cc:From;
	b=Qsxn9sFE5BnCidoSlI1XjTdKY5VnizmxU5KCcrUcdPqa7UnPStuPvDHV77Eyw/1ju
	 8WZNn8+66RZhkS1pTSyrgAiEBN/YRWNg/Gf58iSoH324m/oj0kUwRp5M8Chx/OTBxr
	 hI1dOF5MefuUwCKhAFW7vVIYJ085U+LA/BgAldEBQ8SA3sdin7c1tTBwKTCaYDqPqI
	 7a1zW2xPMvzj1wzVFma/ZyhR4oLeCoTmErCkL90kITcGUBKktrdoZG0AehbYepxuVY
	 ee/ebCKnp3tj87z/vCjwlM8SYXHs6R1aSVejbk7YCgrLHNJ07oOcczHEPwrvTp1INb
	 gMnZw+9Sb6tIA==
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4fhLYM6nWGzV4r;
	Thu, 26 Mar 2026 12:05:59 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 0/3] mesa: fix build for panfrost tools, imagination Vulkan
 driver and Vulkan-only build
Date: Thu, 26 Mar 2026 12:05:48 +0100
Message-Id: <20260326-mesa-libdrm-imagination-v1-0-fe018f03be6a@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrDsQY/3BqxQXiRl1SpOWjIog3
 r1Rl9/ivR2EIpNAm+0QaWXhb0jIHxn0kwkjIbtk0EpXqtAVehKDH7YuemRvRg5mTg02rqyb4Vn
 WZBWk+hdp4O06v7rbstg39fO5g+P4A6z6HNJ7AAAA
X-Change-ID: 20260326-mesa-libdrm-imagination-8d578f457eb0
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 Khem Raj <raj.khem@gmail.com>, Changqing Li <changqing.li@windriver.com>, 
 Ernest Van Hoecke <ernestvanhoecke@gmail.com>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 11:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233972

This fixes a couple of issues reported on the ML.

mesa-tools-native doesn't build if wayland isn't selected in
PACKAGECONFIG (which is the case if it's missing from DISTRO_FEATURES)
because of a missing dependency on libdrm for panfrost tools.

The move for mesa from building libclc for the target to using
mesa-tools-native as precomp-compiler provider broke building the
imagination vulkan driver.

While reviewing the patch for fixing mesa-tools-native I identified a
missing libdrm dependency for the vulkan drivers that we could hit if
the gallium and wayland PACKAGECONFIG aren't selected but vulkan is.
Considering gallium is unconditionally added to PACKAGECONFIG, only
bbappend which override it or :remove from it would be affected, but it
doesn't hurt to fix the potential build issue.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (3):
      mesa: fix missing dependency for libdrm for panfrost tools
      mesa: fix building imagination Vulkan driver
      mesa: add missing libdrm dependency for vulkan drivers

 meta/recipes-graphics/mesa/mesa-tools-native.bb | 2 +-
 meta/recipes-graphics/mesa/mesa.inc             | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)
---
base-commit: acf86cc2af1d08fdf191209f1462b2eafb53d3bb
change-id: 20260326-mesa-libdrm-imagination-8d578f457eb0

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>


