Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E435C5B54E
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 14:43:28 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.17457.1748443401562071520
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 07:43:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=t32wxBBh;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-234d3261631so5031305ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 07:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748443401; x=1749048201; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=n1fM5NStq28paaeKgxpDAwdxD9Jk5WPEhCtzNKNa/io=;
        b=t32wxBBhr4joO3APBSqj0/AzqB7Ntm09S3zQwflnyH3Jcc58/p6MG6rHknxK7dUPnO
         bOhAuvVP77ik53auWQ68ElHk9IYlfrLB82AyatFMgdIQc/QAkT/dSXtRsfKg1V5+sR42
         y2zTUXHRlSKS32a9YzMYRrWTC883w1q7PtCMH0nlGAkljMDc3h9W7jdcRCEPv9HLzf3P
         kzcpjG83m1XIGBySbZpWG8L3X3OKqNftkXiyCPbNhCgfYyEFwsNmZUmidu0EpPLlEE2B
         YV+eOU6y+IjKWdMZTjmemOIXDT9hSRnJM+f1FQkos8wa3NfJOHr4z5oZC0Sg4SoQ1ZjL
         KB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748443401; x=1749048201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n1fM5NStq28paaeKgxpDAwdxD9Jk5WPEhCtzNKNa/io=;
        b=L0KXwvjEw2RbDtg9PwrIhyBUoTs1b3CyFhXMmyql7NyR6cDNboA+6sTwhjY5u/tF/r
         Ai1wUup9a/cmmohDFAcb0/Ju04KuP7FwAFoI8qogUaeaK4jY8TdPYd6pDzV7G6jH3i2S
         Lbh/Bh2pIQ1oyz4gvF+EN1UUiToz6Sq8ajlmQ4v9yTRUewCx7TA+jjZDpFoBWf/vENis
         FQKz/jxpTyW6/oa9hKeuKRr1pch13m18tOR7fasfQEsk60ckd+9gm14cf3HemIKeL0Je
         Hbsfl4/bs2Y/p2bHRElHDAnaf1ubYZcvaKVzXKg4cC5QnRxSc9hcVRxsy07E4KrIRzZt
         Z1rQ==
X-Gm-Message-State: AOJu0Yzm1lZ//ZjwrURjIAB3ZMw0XZma4mJG4VvorUEs49tbZ9EsVtSC
	MVY/6fh8pcwT8ykPclAhQ9Je55S43bPKjmovqxjalRo+dsZSacCKHTqMBYXDRE5OfVEyrKi0z+X
	QVwtc
X-Gm-Gg: ASbGncu5kJ4wRqTGa8vVQ4hFZaOt/daueqVKXC8I36EP88k9DO+VWXAUjFIl6JEzV5U
	bTzxY+LFrr56261xImjdHt208AY25BHKxsM+xKZQciX7hpgBBRWIDTKNYwHc/FyqV1LhTVnx+U/
	yke+ja5EprcjgQOTRD2wmjyGeAenGie+VNpMFLaasgGUdvhsN5JteUl1Nd+uUyxm5P6P5yQeQWa
	3QItErKm0NsGI4ckRUqrqp29tJU6atJbzdJmfGZ7fZePTZxZ02VwRmN2VURKovxpYWDp6gdwFhO
	stHsJ6LRRyhnG/jM8ZrSFRhfshQiGLpT8zqfuda9k/A=
X-Google-Smtp-Source: AGHT+IGGQI+S5RvVGHM9WoV8VSV2JMdq5JrFh0lIx3gBsttoBEBWP6nfNYSkS/DeJ+PtwArruvyfRQ==
X-Received: by 2002:a17:903:fa4:b0:234:c22:c612 with SMTP id d9443c01a7336-23414fcded7mr303047845ad.43.1748443400494;
        Wed, 28 May 2025 07:43:20 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2f2f:1884:f4cc:456c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d358f1e2sm12626285ad.140.2025.05.28.07.43.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 07:43:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/11] Patch review
Date: Wed, 28 May 2025 07:43:03 -0700
Message-ID: <cover.1748443238.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 14:43:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217352

Please review this set of changes for scarthgap and have comments back by
end of day Friday, May 30

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1672

The following changes since commit 29d920f4c2249df7a69f00100924b4525e03c0d9:

  libatomic-ops: Update GITHUB_BASE_URI (2025-05-20 08:59:39 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Ashish Sharma (1):
  libsoup: patch CVE-2025-4476

Divya Chellam (1):
  ruby: fix CVE-2025-27221

Divyanshu Rathore (1):
  ffmpeg: upgrade 6.1.1 -> 6.1.2

Harish Sadineni (2):
  binutils: Fix CVE-2025-1179
  binutils: set CVE_STATUS for CVE-2025-1180

Rogerio Guerra Borin (1):
  u-boot: ensure keys are generated before assembling U-Boot FIT image

Vijay Anusuri (4):
  libsoup-2.4: Fix CVE-2025-32910
  libsoup-2.4: Fix CVE-2025-32911 & CVE-2025-32913
  libsoup-2.4: Fix CVE-2025-32912
  libsoup-2.4: Fix CVE-2025-32914

Virendra Thakur (1):
  util-linux: Add fix to isolate test fstab entries using CUSTOM_FSTAB

 meta/classes-recipe/uboot-sign.bbclass        |    2 +
 meta/recipes-core/util-linux/util-linux.inc   |    1 +
 .../util-linux/fstab-isolation.patch          |  448 +++++++
 .../binutils/binutils-2.42.inc                |    3 +
 .../binutils/binutils/CVE-2025-1179-pre.patch | 1086 +++++++++++++++++
 .../binutils/binutils/CVE-2025-1179.patch     |  269 ++++
 .../ruby/ruby/CVE-2025-27221-0001.patch       |   57 +
 .../ruby/ruby/CVE-2025-27221-0002.patch       |   73 ++
 meta/recipes-devtools/ruby/ruby_3.3.5.bb      |    2 +
 .../ffmpeg/ffmpeg/CVE-2024-32230.patch        |   36 -
 .../ffmpeg/ffmpeg/CVE-2024-35366.patch        |   35 -
 .../ffmpeg/ffmpeg/CVE-2024-36613.patch        |   37 -
 .../ffmpeg/ffmpeg/CVE-2024-36616.patch        |   35 -
 .../ffmpeg/ffmpeg/CVE-2024-36617.patch        |   36 -
 .../ffmpeg/ffmpeg/CVE-2024-36619.patch        |   36 -
 .../ffmpeg/ffmpeg/CVE-2024-7055.patch         |   38 -
 .../ffmpeg/ffmpeg/vulkan_av1_stable_API.patch |   40 +-
 .../{ffmpeg_6.1.1.bb => ffmpeg_6.1.2.bb}      |    9 +-
 .../libsoup-2.4/CVE-2025-32910-1.patch        |   97 ++
 .../libsoup-2.4/CVE-2025-32910-2.patch        |  148 +++
 .../libsoup-2.4/CVE-2025-32910-3.patch        |   26 +
 .../CVE-2025-32911_CVE-2025-32913-1.patch     |   72 ++
 .../CVE-2025-32911_CVE-2025-32913-2.patch     |   44 +
 .../libsoup-2.4/CVE-2025-32912-1.patch        |   41 +
 .../libsoup-2.4/CVE-2025-32912-2.patch        |   30 +
 .../libsoup/libsoup-2.4/CVE-2025-32914.patch  |  137 +++
 .../libsoup/libsoup-2.4_2.74.3.bb             |    8 +
 .../libsoup/libsoup-3.4.4/CVE-2025-4476.patch |   38 +
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |    1 +
 29 files changed, 2604 insertions(+), 281 deletions(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux/fstab-isolation.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1179-pre.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1179.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0001.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0002.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-32230.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35366.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36613.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36616.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36617.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36619.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-7055.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_6.1.1.bb => ffmpeg_6.1.2.bb} (96%)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32911_CVE-2025-32913-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32911_CVE-2025-32913-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4476.patch

-- 
2.43.0


