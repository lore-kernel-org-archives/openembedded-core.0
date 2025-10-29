Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C69F8CCF9EE
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 20:12:10 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web01.13555.1761768727822602521
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 13:12:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LKvWfuh9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-781997d195aso245076b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 13:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1761768727; x=1762373527; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=weGtkzxf6CshgPCvpZHK0oW3FiG7DnH3gnaTV+blgRQ=;
        b=LKvWfuh91546+nEMq30z5qYU4e3fqAf1QrWcX1gsuDsXuEIb+xKtRR1qHGc93xNmgc
         iuTLq7niNLZ84P8eiFIq642oARZvLpvFkIlpYhxJRG0ZriHJA7kniwdOMiGtHkcnUfX0
         0Qsv/xTup6fJYbT3n0j4BEL9XC9faGGVImJvvDTglIiEx6UZYd0HBGX0Gy2v3RK2/eQu
         i2h+83Lm8F6PNcxQnKlmGRwO3lNbHBlQETWxBuCQQ1uhQJr6dsELc39DV2qf+2G5u3Nj
         scvAoYrET2Hoo0EXJmRFlT6mXuaNfDwYr6K1crcVILSByjagJcCGTBa047eMiZsXX1SL
         hMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761768727; x=1762373527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=weGtkzxf6CshgPCvpZHK0oW3FiG7DnH3gnaTV+blgRQ=;
        b=Z4pVgDhS+yNSqxsh135U0sY6/tIKwcjtDHL+vQHbq8h+zWmHr1Q3bFEcxxeNPVstRS
         4FlesOZkzWOV8KwOWNRrB0YmImErnQ82sOiTjwM2v3GUs5Bgbbq0zapdurmDDjeHVaYr
         Eni8liKiYGmGy18ifVOG6LEyuE4PCeBT7fhd4kTiMzwClShMML88ihpKFyEF6JRAgGh9
         7qyqYl1pGmdOdtmXjg+QcZS4JhDk7Z2PJbcEncjHCD6XY4xCVc25vnowXhg/gA/Evpc9
         UHJAqKTxkxUas1yUzhY2WTA0XZ42Qh8dBa+f+cmTM8mt0ql+cScCUH5UBZJWBwjx3LtC
         XZLA==
X-Gm-Message-State: AOJu0Yw81k/oyEgXcJeaqYLKZIsL8fEuHq22IW4cMlT7amp4IG1KKGAd
	vIbki9I3zHFrBIA/ysrAJNth3pCcQdkCWaFsN6SyvS3HkxsHN4ZsOiCAQLt/l2XguZpbDUIXyoP
	kqBeAbUg=
X-Gm-Gg: ASbGncv+pXGNEim0wShQ4aHjv+JAJ6KOe55Fa/3rSHbHdJmSJPFtSyxAj5uC1H9oZDZ
	6JX/g+wmxjmPiI9OQy4K45u0uNXePdNkx1x4IEPiBY+rEW2LUEWRktLhV15mf6hxiDZVIfxt8Lw
	xbByugaD/i1dfsNqd5h1uB+W5ty3kskscemgk/Y6zFTckc6Px0tgkqCqeuKLl6QcR0JFktXoJfU
	/YroojTc8lYNfX1rpR40yWqmwyRKmbcC34DbeqcTsCGxfqjTP3GdQcWUcQqGpbex03QTtIJ2/MC
	Sl0VrkoAZE0S3cnxQrrZtb03cULuxkuHgHb05VgNOAJbzSW3Jh9uRvCcoNBHi8R5qkdbnNd9Y01
	A3tSsRMz/Aj6Q5DgK9w2BBfzuHlQViPk4ovXi9QEPzxQV3AeFwwPKae3OemZX0LgU+VI=
X-Google-Smtp-Source: AGHT+IEpClgW2KS7d1NshVrVGUHBrUTQQ1Yt8MN0wDBeNyo/sXt1/GMfZI/5YZip//PXSBDeLisnRw==
X-Received: by 2002:a05:6a20:7488:b0:341:5677:9d3a with SMTP id adf61e73a8af0-346553ffcd8mr5669605637.49.1761768726735;
        Wed, 29 Oct 2025 13:12:06 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414087d2asm16522100b3a.63.2025.10.29.13.12.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 13:12:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 0/6] Patch review
Date: Wed, 29 Oct 2025 13:11:49 -0700
Message-ID: <cover.1761768602.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 20:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225464

Please review this set of changes for scarthgap and have comments back by
end of day Friday, October 31

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2655

The following changes since commit 0f98fecda8a0436f760e6fd9f3b7eb510e5258b8:

  curl: only set CA bundle in target build (2025-10-24 06:41:43 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

David Nyström (1):
  lz4: fix CVE-2025-62813

Hongxu Jia (1):
  u-boot: fix CVE-2024-42040

Praveen Kumar (1):
  bind: upgrade 9.18.33 -> 9.18.41

Yash Shinde (2):
  binutils: fix CVE-2025-11081
  binutils: fix CVE-2025-8225

Yogita Urade (1):
  tiff: ignore CVE-2025-8961

 .../u-boot/files/CVE-2024-42040.patch         | 56 +++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  1 +
 .../bind/{bind_9.18.33.bb => bind_9.18.41.bb} |  2 +-
 .../binutils/binutils-2.42.inc                |  2 +
 .../binutils/0026-CVE-2025-11081.patch        | 84 +++++++++++++++++++
 .../binutils/0027-CVE-2025-8225.patch         | 47 +++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.6.0.bb |  2 +-
 .../lz4/files/CVE-2025-62813.patch            | 73 ++++++++++++++++
 meta/recipes-support/lz4/lz4_1.9.4.bb         |  5 +-
 9 files changed, 268 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-42040.patch
 rename meta/recipes-connectivity/bind/{bind_9.18.33.bb => bind_9.18.41.bb} (97%)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0026-CVE-2025-11081.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0027-CVE-2025-8225.patch
 create mode 100644 meta/recipes-support/lz4/files/CVE-2025-62813.patch

-- 
2.43.0


