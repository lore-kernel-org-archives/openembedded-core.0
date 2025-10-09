Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6512ACCD18A
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 19:31:19 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.9186.1760038277101758066
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 12:31:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=W5t7x0ll;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-77f5d497692so1719925b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 12:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760038276; x=1760643076; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PGDmaKBR8cKry/zOA/hi+qDJ6f+V2no4FuUgKfgCNbs=;
        b=W5t7x0llPh56n3zn4I0wciVQxKf2UaabE0NDO1xxeLYHOWgROjfV7SqHgxftJc0Qhs
         vcHtZGe4YZXxRqeh6XIM8+H28g9Tam/xjxej4yP24JGDFqEE2ktIZANKOGYP78sCVHoy
         NUfMPjreog7Bwj0xmk+pEUGU7Y0Ge06SwQaVjMG3GqLnLHgIvlNu/KMvy0lCCxoRLO6l
         VkCrk/fTpyfdfMq+jaJQ3bXj8T+G+N/wSgE3t3STp+rF5wye7YF1KSAFV8EtYcBCtO3V
         IbVEyMyUFqzCwsv8x2UyiE4+JRAhB4e8b2Gpphk3dROOOZT9+R9pWJM5zOFXaIB3x0e5
         OovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760038276; x=1760643076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PGDmaKBR8cKry/zOA/hi+qDJ6f+V2no4FuUgKfgCNbs=;
        b=FJ3beQM6dbeb6IlP/bnjGsfJ37xI1QvvL+uLzD9PC/OxLavxZHFRey92RbVxVuT7/i
         EeMDSROKo8i+wxzSVS8e3mvp04m5OnYxKwwit0hSO8ulFJq0P1f9AKXn1SJjAshjG2AH
         DoqHj9MmISfTUkIKrrXrO3wHVwPUPhCKRgo4OP3AHbRlPYgSH9L6UqfptSsZXAUAigts
         Rug1ulitfhOEuFcIIuS99Qnqw8n/fftDGi81L/H2HSlqaxV9+lxEI1JNh3zF2t0kJBLU
         yizemusrUE+3jAAxyfFFeLkcenzgHULlm/FHXL2I8JZYit2dXf13j84C5dTrM1XTAZpd
         mAVQ==
X-Gm-Message-State: AOJu0Ywkk5h68WdVTpEqJM+Q7rkfzeinGbtO8D4MnS2287ZMbzXgUaKf
	MLbDgVBJ456NJW1IeGgyAI6c4ocFp1rTSciPcjZOiIBFucBHnPtG+b4gQIHP+X0KesRMXmiSwp+
	dFZ1a
X-Gm-Gg: ASbGncv+ioMmKJaXh/Gq2tnWnZOU3qy/8CenYyGkf2yamML8LDbTcQBHacn0wJXHp4X
	nXnrOkERYAuSEk9sFk+W2q8dBhtGbX5JVV4KRxuPH9veXaAbktLkCdfiV/gQ0Xx9aSI3/7bHisH
	DnbZcV6O/75FkeMo6T1L66l3cssOZgHFlGclhULgvoYVPRMlzfT5K8lQ5VfuqneHUzedLKIsm6n
	Y2Mny+0NdnbxzQi+jBlZJ7tjb2sd7uw7uLeBNSP7QZs91QLRpK2z8jvAQ8szI6QFnSGF2K5kM+r
	sCGVgfAgZXxmBuc9BFwb8YXIPsq+bdFPnk0ijuZDVQ/LZKN5ReeCjDGPx3ZT77erQD8Ctx/WEGZ
	BPAEVjYerdt7Vxsbmybbm2ZXOE7LXd69zHUmtOQ==
X-Google-Smtp-Source: AGHT+IFm95QPhK18HPTDMghsnuZfY6VXhIZj3aH1FfHafhTVCgnPjFRWoT0AgJFdgKpVMr32YRMTig==
X-Received: by 2002:a05:6a00:234b:b0:781:8680:3175 with SMTP id d2e1a72fcca58-79387146c19mr10816286b3a.21.1760038276197;
        Thu, 09 Oct 2025 12:31:16 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b96e:4301:8642:779c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2d51sm495864b3a.65.2025.10.09.12.31.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 12:31:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/24] Patch review
Date: Thu,  9 Oct 2025 12:30:44 -0700
Message-ID: <cover.1760038088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:31:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224619

Please review this set of changes for kirkstone and have comments back by
end of day Monday, October 13

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2552

The following changes since commit 2285f30e643f52511c328e4f6e1f0c042bea4110:

  libhandy: update git branch name (2025-09-30 06:42:16 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Aleksandar Nikolic (1):
  scripts/install-buildtools: Update to 4.0.30

Archana Polampalli (2):
  go: fix CVE-2025-47906
  openssl: upgrade 3.0.17 -> 3.0.18

AshishKumar Mishra (2):
  systemd: backport fix for handle USE_NLS from master
  p11-kit: backport fix for handle USE_NLS from master

Deepesh Varatharajan (1):
  glibc: stable 2.35 branch updates

Gyorgy Sarvari (1):
  conf/bitbake.conf: use gnu mirror instead of main server

Peter Marko (10):
  busybox: patch CVE-2025-46394
  gstreamer1.0: ignore CVEs fixed in plugins
  gstreamer1.0: ignore CVE-2025-2759
  grub: ignore CVE-2024-2312
  ghostscript: patch CVE-2025-59798
  ghostscript: patch CVE-2025-59799
  ghostscript: patch CVE-2025-59800
  pulseaudio: ignore CVE-2024-11586
  ffmpeg: ignore CVE-2023-6603
  ffmpeg: mark CVE-2023-6601 as patched

Steve Sakoman (2):
  selftest/cases/meta_ide.py: use use gnu mirror instead of main server
  oeqa/sdk/cases/buildcpio.py: use gnu mirror instead of main server

Theo GAIGE (1):
  libxml2: fix CVE-2025-9714

Vijay Anusuri (4):
  gstreamer1.0-plugins-bad: Fix CVE-2025-3887
  libxslt: Patch for CVE-2025-7424
  tiff: Fix CVE-2025-8961
  tiff: Fix CVE-2025-9165

 meta/conf/bitbake.conf                        |   2 +-
 meta/lib/oeqa/sdk/cases/buildcpio.py          |   2 +-
 meta/lib/oeqa/selftest/cases/meta_ide.py      |   2 +-
 meta/recipes-bsp/grub/grub2.inc               |   2 +
 .../{openssl_3.0.17.bb => openssl_3.0.18.bb}  |   2 +-
 .../busybox/busybox/CVE-2025-46394-01.patch   |  57 ++++++
 .../busybox/busybox/CVE-2025-46394-02.patch   |  32 ++++
 meta/recipes-core/busybox/busybox_1.35.0.bb   |   2 +
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 .../libxml/libxml2/CVE-2025-9714.patch        | 117 ++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |   1 +
 meta/recipes-core/systemd/systemd_250.14.bb   |   1 +
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.21/CVE-2025-47906.patch           | 171 ++++++++++++++++++
 .../ghostscript/CVE-2025-59798.patch          | 134 ++++++++++++++
 .../ghostscript/CVE-2025-59799.patch          |  41 +++++
 .../ghostscript/CVE-2025-59800.patch          |  36 ++++
 .../ghostscript/ghostscript_9.55.0.bb         |   3 +
 ...602-CVE-2023-6604-CVE-2023-6605-0002.patch |   2 +-
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb |   4 +
 .../CVE-2025-3887-1.patch                     |  50 +++++
 .../CVE-2025-3887-2.patch                     |  93 ++++++++++
 .../gstreamer1.0-plugins-bad_1.20.7.bb        |   2 +
 .../gstreamer/gstreamer1.0_1.20.7.bb          |  15 +-
 .../libtiff/tiff/CVE-2025-8961.patch          |  74 ++++++++
 .../libtiff/tiff/CVE-2025-9165.patch          |  32 ++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   2 +
 .../pulseaudio/pulseaudio.inc                 |   3 +
 .../libxslt/libxslt/CVE-2025-7424.patch       | 105 +++++++++++
 .../recipes-support/libxslt/libxslt_1.1.35.bb |   1 +
 .../recipes-support/p11-kit/p11-kit_0.24.1.bb |   1 +
 scripts/install-buildtools                    |   4 +-
 32 files changed, 985 insertions(+), 11 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.0.17.bb => openssl_3.0.18.bb} (99%)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2025-46394-01.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2025-46394-02.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-9714.patch
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2025-47906.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59798.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59799.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59800.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2025-3887-1.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2025-3887-2.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8961.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-9165.patch
 create mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2025-7424.patch

-- 
2.43.0


