Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1CA2CA1015
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 15:17:54 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.839.1756999070774676915
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 08:17:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MGBaqVR+;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-24cbd9d9f09so15488765ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 08:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756999070; x=1757603870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5RWCcQeUAkgo4gtKpLsc+ttqBaFz4+DUatwv6Ek8DPE=;
        b=MGBaqVR+oOZ6R0Q0jJusBq2CPkM2c0P+6AbE7wJi98vTPIzY5XITG7kERaZ4+ihE1C
         ZuLEqU6HCLR4JKvao9p8IvsazcYFi5heag6PzreA6M0YVrEGNK9WjXul1HMpO/0RYVNw
         1Jt/cAtW65K9Trwlbb8iVoFZxtl40noLzhjYaG6YM8LDFRxS+itUXfAfXAe5QI+UkCTy
         4g24U9M6CnGCvQw/AzwHr0Z9FZBNX8J+9Jl2OzgugPk54LwB9HUWD1DTHD5/iajygPSi
         84L4UYYBml4Vz+TtfLDMOFds9QmOiIeEAYAUivl/MjL+cczl3qwNcwQKRKMDda/3gE2p
         AoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756999070; x=1757603870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5RWCcQeUAkgo4gtKpLsc+ttqBaFz4+DUatwv6Ek8DPE=;
        b=ACFezNzKYeXzdG48tE+ByTzkRQtB3mAqSAZA7pgEJGCZKZX418GslvFewaipSZjZsO
         08ANUHE9LI2VDgc7utM2FCyZ21DR8gxS9V5J1H5MRss5AAK8NqOwIzYjPpfGYElKW76v
         t2YgDXpzP+5eZeCA5CeGftV9BPraWjMXcLJdrdsYCUNWxCrvI3P4QH4Du1uuDCmkAc/Q
         zPUV38kjmZJjXPU1gT8/JKGww8ff8/pNPu8GaJgCbQ9n8Am+N8f2F4CIHDD3e6QGlv+q
         On+vvT1MwL6m7ijQNMO85LrfHq4nhJtA4/w5xBqNtUbgdpD2VSNTsGU1+7kFBq6Uv0Mh
         ZrhA==
X-Gm-Message-State: AOJu0Yxx9Xv9PjgfiRh+RWG5TjFjigfhuIWwu4jiPo9kFGEMtFcwiQcc
	n04FLUayOw8PfGPB1I3XPs6L82+WpQ6efggngYWy4UO7B1cF9+PS7t37lEFDg2hNAYMxBD2+6XX
	/oNCN
X-Gm-Gg: ASbGncsIJKZIb9/DO3GKATSF1q4Jbul7EPMnJKSH0cnoinh+Wa0dSRGqgN4ROZGuTka
	qw289HwuhbsjIaKwmMb7yRQbXnadOnHNi88KcJ4R8lVYuX+fjdswIy8gysEl/O+vb3tVV4rEHST
	0P9+Y9fexbk2mwIEbGdfQil94GOyYBSvb2HxXlFUkD/fgs8E8SXAP1oG+84HsaKH/Y23diaSo8t
	2Hu7GeTY6h6XUEmVgDlMuO8RJ330rXg1u/Jc1ycET8IN48J1jO5t+dp6VgVrYFtfYs37zjrFU8h
	4hLHzLAJumYCTx68JhCpGEJ1urlhK07viOBCcs03Y1GF3INPoUy0rR7wiNVgYPLIkjEDqVXwdBw
	JsSPWGs3E9w0nobnIWcDb6TIT
X-Google-Smtp-Source: AGHT+IHOUqsqhxlnkaM04FX4tsQvcbidafjkneWZo+LEqsoWigAp8jSUpi0iz3gliKA0EARTx5Ov8A==
X-Received: by 2002:a17:903:1b4f:b0:24a:9490:545e with SMTP id d9443c01a7336-24a94907219mr236086155ad.29.1756999069736;
        Thu, 04 Sep 2025 08:17:49 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:89a7:8cc5:2043:ebe6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b0637d948sm84720845ad.30.2025.09.04.08.17.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 08:17:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 0/6] Patch review
Date: Thu,  4 Sep 2025 08:17:38 -0700
Message-ID: <cover.1756998900.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 15:17:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222948

Please review this set of changes for walnascar and have comments back by
end of day Monday, September 9

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2315

The following changes since commit 49f47169953b807d430461ca33f3a2b076119712:

  Revert "linux-yocto/6.12: riscv: Enable TUNE_FEATURES based KERNEL_FEATURES" (2025-09-02 09:42:19 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/walnascar-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/walnascar-nut

Deepak Rathore (1):
  default-distrovars.inc: Fix CONNECTIVITY_CHECK_URIS redirect issue

Kyungjik Min (1):
  pulseaudio: Add audio group explicitly

Per x Johansson (1):
  rust-target-config: Add has-thread-local option

Peter Marko (1):
  binutils: patch CVE-2025-8225

Siddharth Doshi (1):
  tiff: Security fix for CVE-2024-13978, CVE-2025-8176, CVE-2025-8177

Yogita Urade (1):
  tiff: fix CVE-2025-8534

 meta-selftest/files/static-group              |  1 +
 .../classes-recipe/rust-target-config.bbclass |  1 +
 .../distro/include/default-distrovars.inc     |  2 +-
 meta/lib/oeqa/sdk/buildtools-cases/https.py   |  4 +-
 .../binutils/binutils-2.44.inc                |  1 +
 .../binutils/0019-CVE-2025-8225.patch         | 41 ++++++++++
 .../libtiff/tiff/CVE-2024-13978_1.patch       | 77 +++++++++++++++++++
 .../libtiff/tiff/CVE-2024-13978_2.patch       | 45 +++++++++++
 .../libtiff/tiff/CVE-2025-8176_1.patch        | 61 +++++++++++++++
 .../libtiff/tiff/CVE-2025-8176_2.patch        | 31 ++++++++
 .../libtiff/tiff/CVE-2025-8176_3.patch        | 28 +++++++
 .../libtiff/tiff/CVE-2025-8177_1.patch        | 36 +++++++++
 .../libtiff/tiff/CVE-2025-8177_2.patch        | 29 +++++++
 .../libtiff/tiff/CVE-2025-8534.patch          | 62 +++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.7.0.bb | 11 ++-
 .../pulseaudio/pulseaudio.inc                 |  2 +-
 16 files changed, 427 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0019-CVE-2025-8225.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2024-13978_1.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2024-13978_2.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_1.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_2.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_3.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8177_1.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8177_2.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8534.patch

-- 
2.43.0


