Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CCE0CCD185
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 03:08:54 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.4549.1760584127389765645
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 20:08:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gn7FMedD;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-87c167c0389so2390546d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 20:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760584126; x=1761188926; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VPlJZvANjI4grExFJ2Rqz7uAFTHJ74HRU4TP1wEArHI=;
        b=gn7FMedD6UhJIxX0DhjcdotI6cdSYgdRGpsBfnZOxeUX8iIpXEJ+ti183bhRwKNWk0
         Aam+yvZ/BaYJHTN4Yai+JvvM9J289osGpJqR3gzl9fxGjoeyx6+19Yn0MBzlvmuPpN7q
         z2VM7R/On+2f6dyZ8QYJEbTE6tCazOwXl9FY2RzwsC0uOQhRuMDpfLlA8nDFPfGkOGRR
         DMxkn+vp3Ahv7ivKZiFcuQKCTVadczPfpHRwUsix4gkNBf3/8CQy9l1Kqak1pJs87y8o
         VOm7jJlHC23ejLcpq7k1JNpXkm8JjVSnU8b5rTTRT4PmIahHAVfltf9Mf5IvW7MTpo4q
         E7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760584126; x=1761188926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VPlJZvANjI4grExFJ2Rqz7uAFTHJ74HRU4TP1wEArHI=;
        b=XGz/79B3ArrQHoEQD/8++iEcNwm1oh3oRN4OIfGLRArLDzg01inYug0XSQrQFVEaKw
         iAUKFo0S0kOFwNKWeSwmUkx6uMLZGoclqVTYAxgRRu2AQQOhxJhTehjWObyjGdtvxiCM
         QYDI7yS3BbnG9aptU6PXMGXPe0BVyd98YYozCUdpr6btSSAdtMLT753S2PDkSqSp3zL0
         +J+eLupGMUdUv13T9Uq+SGCZ9Vrj+Oxn/L8/tqlyKq4xCWKezTDO0kXWJrHhzjcvyQKg
         qVACFxSFjNmgwNGRCg8vnY//pd5J1iPvEbX64hb97SQY11l6LRj/HjklqC2pjH2XfoNn
         Yvjw==
X-Gm-Message-State: AOJu0Ywc2LG7uQr0hJeAyW6gDH40GYTdP4hawgVw5M/YZuGZb7qTvGpu
	XAO8o5sgt6MCmjpSKgh6oh6hUbfddiN7VGCBdobXbm8AHF04afBBm2lAgYVxgLlW5JA=
X-Gm-Gg: ASbGncuBmjsdFaYG/k7W64/1HkGbpohpJPNrDDMx0W4nDlAUABbB8pZgqW1zfVuITcP
	LFV7H9ZgbOa6zsB7gzJyLCMuNhTuKXPY8Sxn/U+760VXF33T07cb8aQc/Qoc53bXIiNOifAG3S4
	83gPP2v9dJJjq+I1IWjV2cDuh1T2gA3J74og6hWPeqF01rhzVr+GK4TiJgIqeYDFOslhemg4rxy
	SUfFPIjWBrJbJ/E61OakORjHMKE3ylQW6CXfNq7QlqjEPwN1J/Ye7KcuM8lm9Xhj4NuSpPSeikX
	u3UNzTE+HmaROHvKwwEoyoiA8bV3jrGHn/vuwSoH/XvHkIJlyI+BuutfkhvVOgWsauuQExJZT4h
	Zoaq6d0a5fsiKHhX3WqRHXh5JTW10LcZr8Ok0XZ/hbMJajFzdoIMMLVNvPxN7ThdMn7+rwVN/VE
	moOYTt08mfMkQC1QL/pv/bheygD0+H4SANgZpwbHH5Z3N/Fi+ZfzFqe3MGvXfMzOqrxxcxMN9D6
	XHel4XpO8bW8TxUkY+/r9ar8g==
X-Google-Smtp-Source: AGHT+IEY1PAh7YpQApeanuEVXHR6dSWUBsL8PobkAmgg1Pg9xNSxU7KdnwQ/E0SuEMvCN2+nA4Q7zA==
X-Received: by 2002:ad4:594b:0:b0:7e3:cc6e:3c89 with SMTP id 6a1803df08f44-87b2efdb9ecmr390679526d6.56.1760584126184;
        Wed, 15 Oct 2025 20:08:46 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012a39d9sm30824986d6.44.2025.10.15.20.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 20:08:45 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/11] kernel-yocto: -stable, -dev and tools
Date: Wed, 15 Oct 2025 23:08:33 -0400
Message-Id: <cover.1760583881.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 03:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224915

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

I realize we are still fighting the perf reproducibility issues, but
I wanted to send these out since there have been some questions about
-stable, 6.18+ and configuration issues.

Plus I was able to get these patches off my machine with hardware issues,
so I wanted to get them sent.

Feel free to disregard any of the patches that we don't want, they'll
be on the list for anyone looking for them.

The -stable updates are routine, 6.18+ won't impact existing release
kernels, and the configuration updates for genericarm64 are additive.
So the risk is low for the series as a whole.

Cheers,

Bruce

The following changes since commit 64a879e9b61b56e8bd8070b3f906d9d35fc4153d:

  perf: Bump versions to resolve hashequiv/reproducibility issues (2025-10-15 17:15:46 +0100)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (11):
  linux-yocto/6.16: update to v6.16.11
  linux-yocto/6.16: update CVE exclusions (6.16.11)
  linux-yocto/6.12: update to v6.12.50
  linux-yocto/6.12: update CVE exclusions (6.12.50)
  linux-yocto/6.12: update to v6.12.51
  linux-yocto/6.12: update CVE exclusions (6.12.51)
  linux-yocto/6.12: update to v6.12.52
  linux-yocto/6.12: update CVE exclusions (6.12.52)
  linux-yocto/6.16: genericarm64: feature splits and enablement
  kern-tools: fix symbol_why for v6.18-rc1+
  linux-yocto-dev: update to v6.18

 .../kern-tools/kern-tools-native_git.bb       |   2 +-
 .../linux/cve-exclusion_6.12.inc              | 966 +++++++++++++++++-
 .../linux/cve-exclusion_6.16.inc              | 658 +++++++++++-
 meta/recipes-kernel/linux/linux-yocto-dev.bb  |   4 +-
 .../linux/linux-yocto-rt_6.12.bb              |   6 +-
 .../linux/linux-yocto-rt_6.16.bb              |   6 +-
 .../linux/linux-yocto-tiny_6.12.bb            |   6 +-
 .../linux/linux-yocto-tiny_6.16.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb |  28 +-
 meta/recipes-kernel/linux/linux-yocto_6.16.bb |  28 +-
 10 files changed, 1607 insertions(+), 103 deletions(-)

-- 
2.39.2


