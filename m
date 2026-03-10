Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5BABEB104E
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 11:05:51 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37306.1773140741871814218
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 04:05:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tgW+1wPM;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48538c5956bso22770715e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 04:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773140740; x=1773745540; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=toP48+UOeB5MMekbFAB0KqcQmkP0o7LgexEuTQsErso=;
        b=tgW+1wPM/15UFQtAoZsmGmoEa6o5q+8fG+DP/qUKfedBWCtN68VBggKQ0non/tl6nI
         dXywZ6yyYnvVKG5Z0s341mywDY4rTUgZpRn14scfe70sNT0KnEiLxOTp1EZD/GdTbzFd
         tOsKQpWWxmMi+vWJCbe/LLo7XT9u6iyThBLC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773140740; x=1773745540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=toP48+UOeB5MMekbFAB0KqcQmkP0o7LgexEuTQsErso=;
        b=jKrbBlvQVX0IIRthW8WwZUREi8EtMB9Thz/SEg8AC7eOvOTkHDVytZHotPEK4qhzr1
         gsnbAeT/MNIeo/TSUFsr0MQAN26ReVGM2/KqAcrcjFf72PPOjSmiedqtObEQ1XefoTYC
         69tV9sz/v87G16qbVcxbwgZuUCZeNFWCwdrrC/w1IK4SxvVFNS0RQWbZ4USWxyGVbhZF
         V3+ymSMnrFaQitTrJUpcIjBRysJrbKGHZrWbsyROutD62bN3qY2wOh7UlUhhayyOrr0w
         XrqYFNEpEh3vwpoCbnS86rCx8ONZrICjEsBOvR7OL4V0zUr4aDFxh+jK6U5jrfplyIZY
         46RA==
X-Gm-Message-State: AOJu0Yx2jKTdYI8k46+w+tUzMUrOnMB3IYhST0n2CwXfKwyGnVVvb1LD
	b+PmDgX5v6J2wEfntwExwcien3GjJlI8+JSlLpdupXCq70IP+GXoelbclkBzeBYHAOZaJPGOa1V
	GGKzO
X-Gm-Gg: ATEYQzxdJFqeCeiBGPL1SLYhxdIdTMJPGI2okXO4tP0tzE5MvNfB9f0FzB5I7k3GBws
	+JcjazbQrE3hmxDM3GcHoSnBm0mtozjfmVz7T8gUeioPaksR8JrODqU3kDMLSJIoYL7PSmJ/tbu
	5u3rPyyVzD84xcGUNF58KF5/5zF6gYkznymIReH4NoKhXiAmRze/2nQ1qUrbSQyyg4fUhiAURuf
	zbxDBVlxFWkwYAyY9QGcQpeEDdVar3hxycPkYqnrp0TlMNjethftQ6mRk5H3XtUKOan4li11Evd
	NVzquCbqETFo6YpAa2M6mco29wUQtJTLVH1SSneM60rHvnxU6RNJB70DM+FgtPXwZweAjPbFnQK
	4NlJ90GjPlJZM8MXVQ4FSFd9W2BGIciq9h0tUFM+u7JoLI6bkfPSqMHXmm7s2l7H4z5826YUHBk
	pDNU5pA1BxHfQNTU1WQAKNwjujvD07QTwY8PdketsX3Mj3G0ZjKyIyQR0Hv8b6wFPXGO9cNTBVq
	GfMYsbl8Hg5NF3Nn0MCI1Ss4vQjs2ZvXOksfw==
X-Received: by 2002:a05:600c:5894:b0:47e:e48f:43b5 with SMTP id 5b1f17b1804b1-48541a7f3f5mr33648615e9.18.1773140739837;
        Tue, 10 Mar 2026 04:05:39 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2ba66sm30811407f8f.20.2026.03.10.04.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 04:05:39 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][whinlatter 00/16] Pull request (cover letter only)
Date: Tue, 10 Mar 2026 12:05:25 +0100
Message-ID: <cover.1773140572.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 11:05:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232769

Those are the patches from the last patch review:
https://lore.kernel.org/openembedded-core/cover.1772780989.git.yoann.congal@smile.fr/#r

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3341

The following changes since commit 45cba1329d541fdc5857d6df2624b34c91133f7a:

  build-appliance-image: Update to whinlatter head revisions (2026-02-27 17:46:44 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/whinlatter-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/whinlatter-next

for you to fetch changes up to cfc0e446a1ad57e710d2c82914211f9bcdc4a752:

  python3-urllib3: patch CVE-2025-66471 (2026-03-06 00:48:43 +0100)

----------------------------------------------------------------

Adarsh Jagadish Kamini (1):
  python3-pip: Backport fix CVE-2026-1703

Ankur Tyagi (1):
  wireless-regdb: upgrade 2025.10.07 -> 2026.02.04

Antonin Godard (1):
  python3: skip flaky test_default_timeout test

Benjamin Robin (Schneider Electric) (2):
  avahi: Remove a reference to the rejected CVE-2021-36217
  lz4: Remove a reference to the rejected CVE-2025-62813

Hugo SIMELIERE (2):
  zlib: Fix CVE-2026-27171
  harfbuzz: Fix CVE-2026-22693

Paul Barker (1):
  create-pull-request: Keep commit hash to be pulled in cover email

Peter Marko (4):
  linux-yocto: apply cve-exclusions also to rt and tiny recipe variants
  cve-exclusions: set status for 5 CVEs
  ffmpeg: set status for CVE-2025-12343
  python3-urllib3: patch CVE-2025-66471

Shaik Moin (1):
  gdk-pixbuf: Fix CVE-2025-6199

Vijay Anusuri (1):
  gnutls: Fix CVE-2025-14831

Yoann Congal (2):
  README: Add whinlatter subject-prefix to git-send-email suggestion
  b4-config: add send-prefixes for whinlatter

 .b4-config                                    |   1 +
 README.OE-Core.md                             |   2 +-
 .../avahi/files/local-ping.patch              |   1 -
 .../zlib/zlib/CVE-2026-27171.patch            |  63 ++
 meta/recipes-core/zlib/zlib_1.3.1.bb          |   1 +
 .../python/python3-pip/CVE-2026-1703.patch    |  41 +
 .../python/python3-pip_25.2.bb                |   4 +-
 .../python3-urllib3/CVE-2025-66471.patch      | 926 ++++++++++++++++++
 .../python/python3-urllib3_2.5.0.bb           |   1 +
 ...kip-flaky-test_default_timeout-tests.patch |  49 +
 .../python/python3_3.13.11.bb                 |   1 +
 .../gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch |  36 +
 .../gdk-pixbuf/gdk-pixbuf_2.42.12.bb          |   1 +
 .../harfbuzz/files/CVE-2026-22693.patch       |  33 +
 .../harfbuzz/harfbuzz_11.4.5.bb               |   4 +-
 meta/recipes-kernel/linux/cve-exclusion.inc   |  16 +
 .../linux/linux-yocto-rt_6.12.bb              |   1 +
 .../linux/linux-yocto-rt_6.16.bb              |   1 +
 .../linux/linux-yocto-tiny_6.12.bb            |   1 +
 .../linux/linux-yocto-tiny_6.16.bb            |   1 +
 ....10.07.bb => wireless-regdb_2026.02.04.bb} |   2 +-
 meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb  |   1 +
 .../gnutls/gnutls/CVE-2025-14831-1.patch      | 119 +++
 .../gnutls/gnutls/CVE-2025-14831-10.patch     | 424 ++++++++
 .../gnutls/gnutls/CVE-2025-14831-2.patch      |  66 ++
 .../gnutls/gnutls/CVE-2025-14831-3.patch      |  30 +
 .../gnutls/gnutls/CVE-2025-14831-4.patch      |  45 +
 .../gnutls/gnutls/CVE-2025-14831-5.patch      | 205 ++++
 .../gnutls/gnutls/CVE-2025-14831-6.patch      | 505 ++++++++++
 .../gnutls/gnutls/CVE-2025-14831-7.patch      | 124 +++
 .../gnutls/gnutls/CVE-2025-14831-8.patch      | 155 +++
 .../gnutls/gnutls/CVE-2025-14831-9.patch      | 110 +++
 meta/recipes-support/gnutls/gnutls_3.8.10.bb  |  10 +
 ...13.patch => fix-null-error-handling.patch} |   1 -
 meta/recipes-support/lz4/lz4_1.10.0.bb        |   2 +-
 scripts/create-pull-request                   |   2 +-
 36 files changed, 2977 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2026-27171.patch
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2025-66471.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-Skip-flaky-test_default_timeout-tests.patch
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch
 create mode 100644 meta/recipes-graphics/harfbuzz/files/CVE-2026-22693.patch
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2025.10.07.bb => wireless-regdb_2026.02.04.bb} (94%)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-10.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-2.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-3.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-4.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-5.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-6.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-7.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-8.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-9.patch
 rename meta/recipes-support/lz4/lz4/{CVE-2025-62813.patch => fix-null-error-handling.patch} (99%)


