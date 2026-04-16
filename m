Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F67CF88075
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:32 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7719.1776322109461407253
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=J1fIq/bn;
 spf=pass (domain: smile.fr, ip: 209.85.221.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-43cff5dafc3so5430717f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322108; x=1776926908; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9xfxOUvyf5rP0+FcG6K0whv60DNj4BWFYvbItdKejKA=;
        b=J1fIq/bnxLP4UjJ4zxewAC6iC3ySfrsmjrrlzu2mhGdw8CZJZfbstH0xMLh+D5Dv8M
         cGDKsLl5O1uFWRtNOqYIcQiB1wyEvP9nn4bxvYQmcbc44yyOqrBcjKQqnBKvxJjZFyHl
         71Vg90eAkXkgQWHSQsb2fiSjkrATVF+2+JjpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322108; x=1776926908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9xfxOUvyf5rP0+FcG6K0whv60DNj4BWFYvbItdKejKA=;
        b=ITgSgNY8kVYOtdC0A0gSYfYi8qz9k2QuNHyCqDG0A/WLfppKAb0LB/+BdEUEh6xUON
         a92zj8gxyrspavmZgbXtg9jBTYHJ02kfKvyo1pNQCJdSbjN5qGJZQ4JjIcpCFJBY8ME1
         lTEn5+qjObM5t+HzmRIVp/el5eQFfgofXkI8b+UczTubXTr/BQAxpQoX0KW6m/jr0iWW
         8w7buv6n8SnEL1DVl4DkQHjke2V8lTZ+ZTcmaSw+2miFgVTs5GRKVfCC+H4wCqzKkvqD
         H/veURbiOUOa9gRwT8zH0YOsyM3pLqzq8K3r2oPatyyJtUkNlsBzPDRDAt1Zg8zsc7z+
         e84Q==
X-Gm-Message-State: AOJu0Yxuw6Tm23ageU3IHWjVIY65BfWvUx9dCWu+GHxw2vA9Q/odhJ2u
	Kc5DxodE1AT/pyzccs5Q1HsPNQLqlfEykWlUfHYJNIQFBAdGnaBmhRfgVC4DBX1LI5K/r9SYInq
	+tLCmx9GmerpH
X-Gm-Gg: AeBDieuSjlRlzulcEtBKCIKCJOalk2+/UZlVTMhx1Ca7USpBYXDrBJLDaptARbyPtha
	rVG6QrzMvJ7mpmuLcuVEJGuxruhnKfPvQH+Q4ffBgc5wnv0lzooPVD33BJ8+pg+/SWwdUkAJ00h
	JVKGUuxKa2xB0G+GnCDiENjqPksOv2OerZEfVA+rpEtqXWatf+/39GWGSBhpVi3hNy6RK2I6I0d
	aEyCLU28ksrkRCWglJSw6DDAkTYHz5iWoyi+t7jQxrKPd26iUDsGGaOiEvjWb1R9/lSeLIJA6B7
	cMixXOdqHesreeBl9ESY5tNWmIokhE8BNBw7Tgru/ZrqZxLwHor1BAGdhvpmgmpTWANiS6a2eGf
	prMyMSXwPgkWL3oS5NYKQySHjYlDZLGC5gcyaXlmXi6SXSSEz9wm02L6O25liaP9trWN79zIkfB
	XCihP/P+jwyyHWRro5tunlrCH7b22fSqy2f6Knq0IKBBCGXYKAbSL0D/TXLbnRm8LrjFIrQXcdg
	U1wfHElY26bfbELln4qzdlSAhXb3aeKgfVH0jwc9uhghTQ4
X-Received: by 2002:a05:6000:2305:b0:43d:7c6c:a0dd with SMTP id ffacd0b85a97d-43d7c6ca2c1mr19799040f8f.35.1776322107536;
        Wed, 15 Apr 2026 23:48:27 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 15/47] barebox/barebox-tools: upgrade 2025.09.0 -> 2025.09.3
Date: Thu, 16 Apr 2026 08:47:16 +0200
Message-ID: <c113fff232b77e2fd03762e0c694e876933a101b.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235357

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

2025.09.3
---------
Fixed FIT image vulnerability
https://lore.barebox.org/barebox/abljJRMecNdejSD0@pengutronix.de/

Changelog:
https://github.com/barebox/barebox/compare/v2025.09.2...v2025.09.3

2025.09.2
---------
Changelog:
https://github.com/barebox/barebox/compare/v2025.09.1...v2025.09.2

2025.09.1
---------
This stable release is specifically targeted at whinlatter which is
currently at v2025.09.0
https://lore.barebox.org/barebox/aUkaSKDePHF8__LB@pengutronix.de/

Changelog:
https://github.com/barebox/barebox/compare/v2025.09.0...v2025.09.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index e41d0858fd9..91865b4d44c 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2025.09.0"
+PV = "2025.09.3"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "7df1aa47bb7bf1763a729137ac773e69a4052812af094475d739fc63a9295f0d"
+SRC_URI[sha256sum] = "e87eb863cbe45e4f5af8930825c8f6e20c02b82451e9e1125ea1c73c1fb49a87"

