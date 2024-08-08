Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28D4EC3DA7F
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 02:28:54 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.51038.1723084132852157047
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 19:28:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OyooGZ1P;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2cb6662ba3aso333150a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 19:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1723084132; x=1723688932; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jmrE7+HFT2Sk7s7FXRKjiynWMCtw9mzp+PDCoUovEyM=;
        b=OyooGZ1PqLJ2tj3ksBfHS9jwKGvUqPuWvqQWBqcBhqsEQG3A8svNMmcH8v3kYoiuQO
         jik5VYr5lYSQVHcBSdQTiLUEU0cP5edzmNGvte6HFowGvofPzeo1nybfeF9y87v/RK+9
         pqhQbUaaQ3BKG4Qog5tO9x4dUcOAiZnMUzOXfxnUE2sdH0vmbT3ggf73Du/jm4vm0CEs
         BwoH33bd9/oggPjWTgSjZWhmz07S+1IQPovcuz64y0UUmDrHmd4ypT+3lKgQNt0deeKF
         RzPvVvow6vKqyts/uouGErTUBiiZj4DJe8V4U7SGkMbKf4BV85kMGZ0AREsr5wAsOsRy
         yuaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723084132; x=1723688932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jmrE7+HFT2Sk7s7FXRKjiynWMCtw9mzp+PDCoUovEyM=;
        b=HN79qcZUcg0NoYNbLKUPx33oykHE6fRA8ZOlPmtBGLsaHENTUfRSW/oDtKAWjEJlL/
         ug6h8GRcYg0N7LPE6ibOsId+4zE0IFrbpATvwyaDgE2x25SRLBxNNzTiI/LQeYT666Uz
         fN/49ZbPWeP8eeRBcdwVxI0xH/GWPYzU2e1ItiGqFBAZVECFuaNMGM6SBniodTyuoJtF
         w0KClDn8fb7opKfbWme+fFZDNa6fAV14luMEUj05RbWbIb/6SPQ6EbTYSTs7W9TeT6ov
         u0Js7MePdBy5vtTNKDmYPccfuxwG20UD920h6ybaigVE4uc1WYfmi17VpRkRDCBbi6p7
         yGDw==
X-Gm-Message-State: AOJu0YwXIaakATIJ5zJEI7OO9jRhFAF7AICZY4ebEhejFVk2hO1rghYY
	rP6XSdEXuFMFxM/aePUXAmhczgxfe2nNOjKA9tc7lfRtMK7PA4Zkv/B7UVgwZ1sn/o7w/uHOcuE
	w88c=
X-Google-Smtp-Source: AGHT+IFF/rVQcV5W71FZ4D6U+BXZyQ/sQI1Xaz4G5tgh9SCSBELxvjBVO7BSM23RDtzVlcJNkAze5A==
X-Received: by 2002:a17:90a:f2ce:b0:2c7:d24b:57f with SMTP id 98e67ed59e1d1-2d1c4c48b07mr445364a91.19.1723084131723;
        Wed, 07 Aug 2024 19:28:51 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1b3b0c796sm2269198a91.33.2024.08.07.19.28.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 19:28:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/10] Patch review
Date: Wed,  7 Aug 2024 19:28:36 -0700
Message-Id: <cover.1723083840.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 02:28:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203100

Please review this set of changes for scarthgap and have comments back by
end of day Friday, August 9

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7220

with the exception of a load related parsing failure on qemuarm64-armhost
which passed on subsequent re-test:

https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/8717

The following changes since commit 136a25567499191b23a4d000a06bf83a473224ca:

  rust: Add new varaible RUST_ENABLE_EXTRA_TOOLS (2024-08-03 11:45:57 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Archana Polampalli (1):
  ffmpeg: fix CVE-2024-31582

Ashish Sharma (1):
  bind: Upgrade 9.18.25 -> 9.18.28

Changqing Li (2):
  curl: correct the PACKAGECONFIG for native/nativesdk
  libpng: update SRC_URI

Peter Marko (4):
  curl: Patch CVE-2024-6197
  glibc: cleanup old cve status
  qemu: set cve status for CVE-2023-6683
  libmnl: explicitly disable doxygen

Richard Purdie (1):
  nasm: Upgrade 2.16.01 -> 2.16.03

Wang Mingyu (1):
  orc: upgrade 0.4.38 -> 0.4.39

 .../bind/{bind_9.18.25.bb => bind_9.18.28.bb} |  2 +-
 meta/recipes-core/glibc/glibc-version.inc     |  2 --
 .../nasm/{nasm_2.16.01.bb => nasm_2.16.03.bb} |  2 +-
 .../orc/{orc_0.4.38.bb => orc_0.4.39.bb}      |  2 +-
 meta/recipes-devtools/qemu/qemu.inc           |  2 ++
 meta/recipes-extended/libmnl/libmnl_1.0.5.bb  |  2 ++
 .../ffmpeg/ffmpeg/CVE-2024-31582.patch        | 34 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 .../libpng/libpng_1.6.42.bb                   |  2 +-
 .../curl/curl/CVE-2024-6197.patch             | 24 +++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  5 +--
 11 files changed, 70 insertions(+), 8 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.25.bb => bind_9.18.28.bb} (97%)
 rename meta/recipes-devtools/nasm/{nasm_2.16.01.bb => nasm_2.16.03.bb} (88%)
 rename meta/recipes-devtools/orc/{orc_0.4.38.bb => orc_0.4.39.bb} (92%)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31582.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-6197.patch

-- 
2.34.1


