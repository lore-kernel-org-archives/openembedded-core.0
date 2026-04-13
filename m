Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D6FDEBFD10
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 07:37:30 +0000 (UTC)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.266985.1776065847492473979
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 00:37:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=p7MUK42N;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2c15849aa2cso4705106eec.0
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 00:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065846; x=1776670646; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t243em0iVI/7qJ6kKvhGfHG1GsI+JAWQk8a4oIh5qNE=;
        b=p7MUK42Nkk8NQuXgEbaGsmv/PTwUVca6Ypsobnyd0Dt71JknHfhedt6B26MM6yxKZ7
         0OgKSL5NhoAjRq3Et++QiMjiUSJntqGxod3XI2oYVyJX0a/L1Nryrh2yEKHraUj8GrvO
         oZxlXazJyZZlEMiM7YTKJLio/Qmrv1nGYFXUSX0yc8faBJwfIHOc9HGKUto2oAFIBJBi
         3cK24Te186M8oiRmtso0PndX9L73AKIUWcPvLfdjdHfpAWk2EV0QtIPmaAe90iviJs2f
         CBNYUyUi5zOwCCKBS76GtmBH82XS4CJCkzq3o3nMsJxStRmGNDoYK4ozcaYas/416FwM
         PWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065846; x=1776670646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t243em0iVI/7qJ6kKvhGfHG1GsI+JAWQk8a4oIh5qNE=;
        b=WjVJIbrOOZkAo/bJJhStPSnefGIyE2GlsbbeNV3AJMnNj09YUHjIApH01mCMgH5oHb
         G6Wt243HiZc70jqKdw/6H6G2KxjPJDX9405cPqPgXM89JiUR5nqxrVGBUDH4NNHxP8DQ
         2EgcbPJjN14sWQrCSUyRAEVwMtaLTgZKQaTbGjV6iMaOEKp47Q54aY29YxJTZl+4iLQ+
         41GKgp8f4ytcnCKABwdhk22XxQyIT8r9HeEZnwywiFbdJZ0+tAEbyKn/WKlEQsXzPgF5
         7fMFj4bFfPlT7hlreFpeA0KNEF4lYnBNvIQ8faJ8GHyDVGmW9/kspxP61t2jEkaog0T/
         ry3w==
X-Gm-Message-State: AOJu0YwpeBQmnmzK3nBmrWYE+wdBMksztwVK5RsrtAh7EzJrRewOE6S7
	lD8NP31Kboj1k4qvxNGIeZ7NjM1IGnW7vzr2gFOPl7/23gx6eoI7W61Z172YDrzR
X-Gm-Gg: AeBDievYorHGhH+UycAMcbBvDgL7x6/K8hDERzwggrhp977KHy+73UmfBQyY8UrrorN
	peMo96cFiwuhrjRCvKK+MQoJtHaLPFGd3BUelAMzgABfWtk5bcaGCb5F7UuhTRTIZa6xrsDlUVa
	TssbmF9Dz+5DjLjaxHC9tRufJL16Kv7rRxOZrlKQ3/4jZkVVJ5yAQmNmDCqYd8FNlLmijVm1fz1
	MVbDbvqbD7BDBsIYFPgKs5ZyzCH+GgRJ0V2Ay+8FrFaa5BOm9e9PpykTu+SpjAMdrjvld4cs5Ul
	MXcSy5zaFWA0lzUyuVMPbQSPHPWHdv82RaO27QmrPHJ+O6+Pe+uLgHnwwk2xKNlB4a8Wk21/OlN
	ueKoh0Lg2aUiXQS3fYQOzeZ2PTvzo0uuwzFUqbGHVBafun3LOsgUGtQoYyEfvlNvdHZXXFkKzF0
	D0H1by6pHdQSr2knG+Po3TiweXTMwKW4YDlFRO6HWfMNOqEB51jpvhylcQ1D/Upl4tk4dLzbtcU
	rtRHZxp0WLP2TJoZYsMVH5PWUnO2tSPg0jz44aI2ZSjYtJ5eufXXAn5sx1gIGGhXso0LGhUXkWq
	JUZTf4qCOwSVGlhtB0sq7FtMbJtZXVPpY3bwkqfbFwlBYr9erI4=
X-Received: by 2002:a05:7300:220d:b0:2ba:6b3a:7696 with SMTP id 5a478bee46e88-2d586991502mr7146676eec.8.1776065846084;
        Mon, 13 Apr 2026 00:37:26 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d5629b31f5sm14902952eec.24.2026.04.13.00.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:37:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] pulseaudio: Fix build with LLD linker
Date: Mon, 13 Apr 2026 00:37:22 -0700
Message-ID: <20260413073722.876319-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 07:37:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235089

LLD is stricter with version scripts
This is a classic LLD vs GNU ld compatibility issue with
version scripts. LLD is stricter than GNU ld — by default
it treats unmatched version script symbols as hard
errors, whereas GNU ld silently ignores them.

What's happening is that the version script
e.g. map.pa, declares symbols like pa_glib_mainloop_new
under PULSE_0, but those symbols aren't being compiled
into the current library target.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index b9dc8e236f..a8a5a1e074 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -74,6 +74,12 @@ USE_NLS = "yes"
 # Helps tests for -msse fail on non-SSE architectures which is all non-x86
 TUNE_CCARGS:append:toolchain-clang = " -Werror=unused-command-line-argument"
 
+# Fixes
+# aarch64-yoe-linux-ld.lld: error: version script assignment of 'PULSE_0' to symbol 'pa_glib_mainloop_free' failed: symbol not defined
+# aarch64-yoe-linux-ld.lld: error: version script assignment of 'PULSE_0' to symbol 'pa_glib_mainloop_get_api' failed: symbol not defined
+# aarch64-yoe-linux-ld.lld: error: version script assignment of 'PULSE_0' to symbol 'pa_glib_mainloop_new' failed: symbol not defined
+LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -Wl,--undefined-version', '', d)}"
+
 # mix_neon.c:179:9: error: invalid operand in inline asm: 'vld1.s32 ${0:h}, [$2]
 #      vld1.s32 ${1:h}, [$3] '
 TOOLCHAIN:armv7ve = "gcc"
@@ -209,7 +215,7 @@ ALLOW_EMPTY:${PN} = "1"
 
 CONFFILES:libpulse = "${sysconfdir}/pulse/client.conf"
 
-CONFFILES:pulseaudio-server = "\ 
+CONFFILES:pulseaudio-server = "\
   ${sysconfdir}/pulse/default.pa \
   ${sysconfdir}/pulse/daemon.conf \
   ${sysconfdir}/pulse/system.pa \

