Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1815DC5320E
	for <webhook@archiver.kernel.org>; Sun, 25 Aug 2024 18:50:05 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.37428.1724611796249451880
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Aug 2024 11:49:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xXV+TloG;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2d3d662631aso2768938a91.1
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Aug 2024 11:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724611795; x=1725216595; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lUu9XZ86/hpBFxw1HyrEZA0/jJDO6CYNDXStweLBw1k=;
        b=xXV+TloG6bq7yZJOb+4qVQVKB+QdX8h4Ns6SK+R+Yg5aNAaHl0xDMRj/SYg7l8KCTW
         dE1kanFdk8lXwC9BOWWx8kS4AheK1JQY+ftSM+57rSydxQzTusL78vUXrR74eedLd3vh
         4tXAMqWFSXm+8Wk0msDYdr+OiR5W7vaOuV1u0yjF5RlwnZJDs0+ITvjOhXzWeyqQ30g4
         OFRVlD6947fS453MY9ntZ6Bh12YTei/Bv0vTmJ3e3gZeJfr6piVy4WS92pD/ThUiGdNL
         1QHMhWyj/b8e+adNV+z7Yo1ulsM7rh4mUwkAD3BJfX6a9DJ1oKRep6uZuXj7cFnz+BLT
         6yAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724611795; x=1725216595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lUu9XZ86/hpBFxw1HyrEZA0/jJDO6CYNDXStweLBw1k=;
        b=Nu2rjVBpN4DK4GujMAv8TpyLThP0BKS2sukmwzlzbRD+MwGnyQt8PL/nfLsP2tQ4Zl
         VQjM9W+zskOkjeut7e3XzbScJNnPyRwFkPppwBOyn8l8DJXpjxh/jb5NG7xHGgoy9sx4
         w4c/UCHu4bRUpaHN9VnLmH9VeqyKSs8qjqU5pFzkvE0kxtSGK3Aj1SlDrlD5/y+qsS+e
         wDsCYSWjGwHvh+M3vS4mNg4jcVq6CZYRBTQFY+RdEcMhe2U4IGCq0I53KBkmXnpwInvs
         jDWB+2c93gsy2OpGR94MON+rDkTasHS1QRcv16SMjJLhGdDOBr68jTBz3/FO0hB0DL3a
         wZ0g==
X-Gm-Message-State: AOJu0Yz4zGhchdVpH9S6KNTPtiW8gJm/vpMATBERY3gt7+NoF4D6juRo
	+xl7pSiQWIbF3NK0vq93bBr9ODWGA7hDKFv6f0Z8jBo7UjYeuglUHZUQyXCk6phJCgJtBY6jw7+
	Zh1GkWA==
X-Google-Smtp-Source: AGHT+IGkSZWE7N15jn9riCnui6Tu4hqg19rLXnCSdpXR65+38/AQqmfEsxYpXwb4soNO8wSJsSQ/1g==
X-Received: by 2002:a17:90b:356:b0:2c9:61f9:a141 with SMTP id 98e67ed59e1d1-2d646bf605amr9281490a91.16.1724611795297;
        Sun, 25 Aug 2024 11:49:55 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d61391fe09sm8294216a91.19.2024.08.25.11.49.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 11:49:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/6] Patch review
Date: Sun, 25 Aug 2024 11:49:45 -0700
Message-Id: <cover.1724611692.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Aug 2024 18:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203725

Please review this set of changes for kirkstone and have comments back by
end of day Tuesday, August 27

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7272

The following changes since commit 6c1000a2bbfe5e618e42bc5be2058332337d4177:

  python3-pycryptodome(x): use python_setuptools_build_meta build class (2024-08-15 05:58:11 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Guocai He (1):
  libsoup: fix compile error on centos7

Leon Anavi (1):
  python3: add PACKAGECONFIG[editline]

Niko Mauno (1):
  image_types.bbclass: Use --force also with lz4,lzop

Peter Marko (1):
  libyaml: ignore CVE-2024-35326

Siddharth Doshi (2):
  Tiff: Security fix for CVE-2024-7006
  curl: Security fix for CVE-2024-7264

 meta/classes/image_types.bbclass              |   4 +-
 .../python/python3_3.10.14.bb                 |   5 +-
 .../libtiff/tiff/CVE-2024-7006.patch          |  64 ++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   1 +
 .../curl/curl/CVE-2024-7264_1.patch           |  66 ++++
 .../curl/curl/CVE-2024-7264_2.patch           | 320 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   2 +
 .../0001-meson.build-set-c_std-to-gnu99.patch |  44 +++
 .../libsoup/libsoup-2.4_2.74.2.bb             |   4 +-
 meta/recipes-support/libyaml/libyaml_0.2.5.bb |   2 +-
 10 files changed, 506 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2024-7006.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-7264_1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-7264_2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/0001-meson.build-set-c_std-to-gnu99.patch

-- 
2.34.1


