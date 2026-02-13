Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 402C6EDF160
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 13:23:13 +0000 (UTC)
Received: from smtp-1909.mail.infomaniak.ch (smtp-1909.mail.infomaniak.ch [185.125.25.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71254.1770988986190309704
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 05:23:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=UilJ3DQ5;
 spf=pass (domain: 0leil.net, ip: 185.125.25.9, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fCCXS0nqdz4Pm;
	Fri, 13 Feb 2026 14:23:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1770988984;
	bh=8Hd2bMj61P9ufKrFGjSB0MRgMZVWlJT+6OyurEuxBXk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UilJ3DQ5Kx9F5SSLR7ZIFLfU47Y9HC0Y8kqL6zPSLICa/a3Dt1UugCdUdHnWeX8Cw
	 dNnb9HX9n6ztoiRbvwLFW8fE/OfXARGu2VljM9fvMA0R4Dx6llc8Xy0rrJGfEmNnty
	 ZS7sdz0BAFmkmFFnp6w2u9YYZWJVuaDtwPsLEZzf0gQVHKlrBZGorvklH3O/DfwGoH
	 /8vugxlW488/OKDstKo3gEpwyD7C8eog4zJDW7hNGgs5fdkLPIf0nYmHsZtnqkl7V7
	 0YwI7E8rHtWudzlQ/vOqhe+dwO3xPECsm2mY1SRZ+B04KZ940Zs0Zo20OPtXNTEYcW
	 kBMpwos8pRY8w==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4fCCXR53XVzqft;
	Fri, 13 Feb 2026 14:23:03 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 13 Feb 2026 14:22:54 +0100
Subject: [PATCH 1/2] mesa: fix missing llvm dependency for i915
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-mesa-26-v1-1-9e925e474091@cherry.de>
References: <20260213-mesa-26-v1-0-9e925e474091@cherry.de>
In-Reply-To: <20260213-mesa-26-v1-0-9e925e474091@cherry.de>
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 13:23:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231116

From: Quentin Schulz <quentin.schulz@cherry.de>

i915 requires llvm at least explicitly since commit b8b38d38b1c1
("meson: reinstate LLVM requirement for r300 and enforce it for i915
too") in mesa (available since 25.3.0).

By default, Intel machines are built with gallium-llvm (see the various
PACKAGECONFIG:append: in mesa.bb), so the dependencies would be met.

It seems like Intel Arc discrete GPU may be supported by i915, so I'm
assuming it could be possible to have a non-Intel machine have the need
for the i915 driver.

In any case, this is highlighting the actual dependencies so let's add
gallium-llvm as a dependency for i915, as it should.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 3788f0d3b2..0ee4dd926f 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -182,7 +182,7 @@ GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',crocus', '',
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'ethosu', ',ethosu', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
-GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',i915', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel gallium-llvm', ',i915', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc gallium-llvm', ',iris', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${GALLIUMDRIVERS_LLVMPIPE}', '', d)}"

-- 
2.53.0


