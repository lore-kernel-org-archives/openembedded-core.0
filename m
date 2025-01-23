Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF652C02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 03:00:17 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.2977.1737601211101145856
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jan 2025 19:00:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SEExfgZh;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-219f8263ae0so7312055ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 19:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737601210; x=1738206010; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kxz0obSEZPfYM65TBDe/vwLQ9AmqYoYnZi1HcD5Gmdg=;
        b=SEExfgZh2bEK/vgvP6GMOHOTMj3yuPpEUFgg9PFFSRR9viru/QKayULrE6UFoLrlsS
         S3uKwmZjGuRZ+9Yt4Lw2F1UUurI/Bo5D5r49mkBHiSAIhFJRnD71GnIBRIlFmjxyFn0l
         zxDl/PtAWeOUIcP8D30AstbFvl3LOKq61y2AsJzUPToFSc79yVGGVGhVVwqCbYVH8n64
         VvYUZOxZPGgdXeri+diOOCq76vKNBs+n1SR4A3orJQHFPS6PCsyRk/hriW/5o0uEyL9B
         8WMvxjUCWgY1EKpeak/wRB1ZBHmiyVzrcusYYzi8mEpmo4J1ysbnJHqdGgsq3lPRSIoS
         O7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737601210; x=1738206010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kxz0obSEZPfYM65TBDe/vwLQ9AmqYoYnZi1HcD5Gmdg=;
        b=DSi902nSs/ApRVEO8Jr9DQ9R+UQ/em3lK9A2CgnoXT9FlOu9Ty9C7pXVEiaBpaEW+0
         EU0bVxQUzS1zuXOKqOAVcuQN5wMH7NVxILTje9pWD1hiimcZ+MOD1BvMLarUkNNuychP
         dNaw71bDnd0gYy2domFnkXyzV6+ML8u4R6RivnJAyLqr+4PEJSdGQg2oYcqGXAOfcmHJ
         90BprMQi34uH8Y8OalPZA3QOrXAYHRdlEe591/GwEBUzVN6Oj9aeG04SYWD2Sk5jyv4h
         wojX/5FI65gkSJpID2cIaqN2qGVy472JIwwDCrpAt4gExrBUwHCmtDoMI25hf6wcM1Ia
         ffvw==
X-Gm-Message-State: AOJu0YzJ47RqmW4vPgzHK8rh0/ro8eVSTb/1MZY0SN9cKwLH0wFkn98k
	DNrJW7Zy3IcezQb6HP2iGPEj6zcxJ5hdTjlhoI4HcBQD7BfthzH+3jUA56nAo6Pxj2AySW9oFyu
	FM6I=
X-Gm-Gg: ASbGnctcFnH2MPPd6Zau/ROGLw6ZAR2DxfTCELP5Gae6Ou6u0VF3YaqB9C+4cikfyJh
	WjIs/P9s3lcUAtuSkjaAWqA66Q4UN5t2BioAsFl3N8kC0mQdZACxnDFm0hAuOmkGrRTsu8qa3bV
	5HqRfwgozlx+bldw5WNxiPL2A3WG6JGrVa4hTBL60Rl+GgpSFoBw4z3F4FeFJBCMRY9tAIV/trd
	mveHsgdvc1Gjgtjb3FvHO7KC9gT/CFQOub4LbMr7PuuBgagaVM/0/a7q+dhibmSIUmfRw==
X-Google-Smtp-Source: AGHT+IGECJO0MF3LTV8+oOxaOHjAzcK9RIh2y1PMPFZmCBaD24CmacHH9JA+UbcVFH3wPW18+vLhng==
X-Received: by 2002:a05:6a20:7f82:b0:1e1:ae68:d900 with SMTP id adf61e73a8af0-1eb214cb10amr38321756637.22.1737601209934;
        Wed, 22 Jan 2025 19:00:09 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab816accsm12048389b3a.69.2025.01.22.19.00.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 19:00:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 0/8] Patch review
Date: Wed, 22 Jan 2025 18:59:50 -0800
Message-ID: <cover.1737601063.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 03:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210165

Please review this set of changes for scarthgap and have comments back by
end of day Friday, January 24

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/869

The following changes since commit 660e00469f9c99fe733cc8b37f67438a96ff2e97:

  libgfortran: fix buildpath QA issue (2025-01-21 12:33:25 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Archana Polampalli (6):
  rsync: fix CVE-2024-12084
  rsync: fix CVE-2024-12085
  rsync: fix CVE-2024-12086
  rsync: fix CVE-2024-12087
  rsync: fix CVE-2024-12088
  rsync: fix CVE-2024-12747

Harish Sadineni (1):
  rust-target-config: Fix TARGET_C_INT_WIDTH with correct size

Jiaying Song (1):
  boost: fix do_fetch error

 .../classes-recipe/rust-target-config.bbclass |  10 +-
 .../rsync/files/CVE-2024-12084-0001.patch     | 156 ++++++++++++++
 .../rsync/files/CVE-2024-12084-0002.patch     |  43 ++++
 .../rsync/files/CVE-2024-12085.patch          |  32 +++
 .../rsync/files/CVE-2024-12086-0001.patch     |  42 ++++
 .../rsync/files/CVE-2024-12086-0002.patch     | 108 ++++++++++
 .../rsync/files/CVE-2024-12086-0003.patch     | 108 ++++++++++
 .../rsync/files/CVE-2024-12086-0004.patch     |  41 ++++
 .../rsync/files/CVE-2024-12087-0001.patch     |  49 +++++
 .../rsync/files/CVE-2024-12087-0002.patch     |  31 +++
 .../rsync/files/CVE-2024-12087-0003.patch     |  40 ++++
 .../rsync/files/CVE-2024-12088.patch          | 141 +++++++++++++
 .../rsync/files/CVE-2024-12747.patch          | 192 ++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.2.7.bb    |  12 ++
 meta/recipes-support/boost/boost-1.84.0.inc   |   2 +-
 15 files changed, 1001 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12084-0001.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12084-0002.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12085.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12086-0001.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12086-0002.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12086-0003.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12086-0004.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12087-0001.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12087-0002.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12087-0003.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12088.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12747.patch

-- 
2.43.0


