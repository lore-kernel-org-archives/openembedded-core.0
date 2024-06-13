Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F621C41513
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 14:21:24 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.9706.1718288476585058485
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 07:21:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2RNerm0V;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-70417a6c328so881297b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 07:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718288476; x=1718893276; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xjiWhluOvWAqlLsAbKxB60qHE2syiyCerpPvjVaMgCc=;
        b=2RNerm0V3OEC4S/E5LrjPO3J0v/aZq3bJuaN8TUU9cuw6OVhgbPU2DzCowxxx5m6cv
         sv3ReTDgD/L2yr2m72bQUA6W17H3LVf1VQQvcgRGz0zl8bXBpcoBGPzjzinMr3NThESN
         BVu8OyQX1vjpw3o+FDL1cOU9AD1o8ymlTPISjWaQsJdESdr2Nfx4uLJPIUHjKFUJX2h3
         56noWUnGSYmsxEEOehzfdPHXFBpxahaSiWT6afSgRh4SVBb6AQFvPB3pdq/54GPSLiiE
         oJNVVanXeVTyoM+Evnef/dahstzqRKbTRZItQoI7lxXxO8LcdRz1bHyburDptPMc3cB/
         WnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718288476; x=1718893276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xjiWhluOvWAqlLsAbKxB60qHE2syiyCerpPvjVaMgCc=;
        b=CMrajNfo13R6Rn+gDla/ak2EUQF1Uxq/yz7Fj1BHTLPJ3iXF3Yxj5aHC+1iD3Qv1XE
         SEdmM/TTmIilx8HpkDFe7FRNHjjCthZBBXpEEO75WiIzk6k2HOD68B+sqG6N6qDVZJ+4
         /0FOIv83SzBwZpX9BlIhHhCyRNHXOqllrlMlwIg7MtpmSPhTCIb28AMb/MfNXdsiPSOP
         HSCBXYu69J4OqbQd0hQgna0WPl3v7TKzztLwFJdnq0Fdul37w6N0uFnl/Vb0+OlC0f5/
         Z3h3WkbkULXpBIo3yagFuJs55ol3c3nW+Kx5XIii9OUO9b3VSeZk7EqE6S4RcffqjpJ7
         pbDg==
X-Gm-Message-State: AOJu0Yz6ulgGACwvP6SEbQQ2MUvSwmbNJMqoxcBoVucU0+p62vtndNx1
	/wRVaN+R4SfLcfceQ7RnMQq/wdyMM2f1nLvi+oc7TKRUIfhIt8oxgLUGsyShW2XnAIfsjUN/q6i
	r
X-Google-Smtp-Source: AGHT+IGcUwdpRJj4ubbl7jhaKS+wFm+hULE6znZRtbv/JmV1BbvhHh1e/yyR1g88ZPlG0uZjx5eYPw==
X-Received: by 2002:a05:6a20:7350:b0:1b7:29c:50ec with SMTP id adf61e73a8af0-1b8a9c467bbmr5418192637.33.1718288475880;
        Thu, 13 Jun 2024 07:21:15 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5b0dfsm14414665ad.29.2024.06.13.07.21.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:21:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 26/29] libinput: fix building with debug-gui option
Date: Thu, 13 Jun 2024 07:20:31 -0700
Message-Id: <71e49dcac0be026d12140598850e2cd38d702317.1718288230.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718288230.git.steve@sakoman.com>
References: <cover.1718288230.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 14:21:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200629

From: Marc Ferland <marc.ferland@sonatest.com>

When building libinput with the 'gui' PACKAGECONFIG option, it fails
with:

| Run-time dependency x11 found: YES 1.8.9
| Run-time dependency wayland-client found: YES 1.22.0
| Run-time dependency wayland-protocols found: YES 1.34
| Program wayland-scanner found: NO
|
| ../git/meson.build:578:20: ERROR: Program 'wayland-scanner' not found or not executable
|
| A full log can be found at /home/marc/mnt/yocto-latest/build/tmp/work/core2-64-poky-linux/libinput/1.25.0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: exit code 1 from a shell command.

Adding a build dependency on wayland-native fixes the issue.

Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0e2d18e6267d26870ccbe45734bfccbc02744357)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/wayland/libinput_1.25.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/libinput_1.25.0.bb b/meta/recipes-graphics/wayland/libinput_1.25.0.bb
index 517b247fed..894858e361 100644
--- a/meta/recipes-graphics/wayland/libinput_1.25.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.25.0.bb
@@ -32,7 +32,7 @@ do_configure:append() {
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[libwacom] = "-Dlibwacom=true,-Dlibwacom=false,libwacom"
-PACKAGECONFIG[gui] = "-Ddebug-gui=true,-Ddebug-gui=false,cairo gtk+3"
+PACKAGECONFIG[gui] = "-Ddebug-gui=true,-Ddebug-gui=false,cairo gtk+3 wayland-native"
 PACKAGECONFIG[tests] = "-Dtests=true -Dinstall-tests=true,-Dtests=false -Dinstall-tests=false,libcheck"
 
 UDEVDIR = "`pkg-config --variable=udevdir udev`"
-- 
2.34.1


