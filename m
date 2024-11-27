Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2677D3B9BD
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 18:50:21 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.78778.1732733411870578411
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 10:50:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=t259o5yM;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7fbce800ee5so5168430a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 10:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732733411; x=1733338211; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tL5ecri/uVm/FvRo+K+2rqee3HMXEA6T0OpyfzZXE0c=;
        b=t259o5yMofAGpQCgxIfcZgJrDWpwzkKje7tNd+rfKuA4Eq0p18VGSJBo4luMl9K5av
         WD/HCmv+6Ec91AgekkwjMDYRICoq8irr0c6xQF1ycSdxqWI0r8npMRkynKNpHfLcY5uM
         Uot0J0m+hy4IoXm8HWx/c1uldTUUKUSAK144YoBFJfzLAQR1nPt/O5D6O09nuOf19h7I
         /D++vh3MfeJ6Tso6wITjq0rEDomShAkkiOGD9wQ/yOcngPy7o3XeaMGd5T+d8AeCclNo
         WR10qr+VgjbhfmqQyHYYLQdRK7SZtojFoeBXnDBAw+HBGEjgEDevko6CC/zEYuUuiDOh
         hZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732733411; x=1733338211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tL5ecri/uVm/FvRo+K+2rqee3HMXEA6T0OpyfzZXE0c=;
        b=r1RWHLI+Q2HGUWo8IzWepOdw+8C61YOh270ibgZZpuh/GrFZK/4n1QD8DktMBosvuq
         AZdONFpE1l33JpqHpAdedkORkhar8/e9ADYafwbCCy36ZSdti45z/EDPkC7hcBm4MOzy
         L61yvwIQ22EcqNWsKsv146LtEv0sMUoFTet0nZk1Fqp6tVjJP1Ai2P45Ijit3FoX42Sp
         wTR/KplbJDHwATb9yfIzX6OK7cgXsO10WfEhE5hK/GRaRD2no1Zk1HGoBLZ5kJsnFh6t
         mdxocrT4ikpkVSyU1Xm6mBzOeZnqpkU01YOv3cdFYmhesU1YFsuu3b7ZwbKns7ZE/4Sy
         WpQg==
X-Gm-Message-State: AOJu0YygsqsZ39Cea/SqlVgNisGUJbdWy5PM9LrtgSVl6iY42a5zSvtI
	iFg+P9yxJvKYhyfH10U/g7ETOCUkaIlBQlZnsysbm4R8D2ZGjVi0JhhqzJ+VGLJZsiXb1Wh4FZM
	1
X-Gm-Gg: ASbGnctviR7cIr688Lpcl52fMS4c2fbtcrYLI6Axn833+rY5nQ57uppOAL2rI+EIVkC
	iWKZaYU3fVzlOas7KiaiHr2hMHfqvlBLhbsM8luuHv8ETxheh7RpAHs2WFu+Kzv1ceQjjq+MyP6
	fTxWgNuCjER89Lq1CPEdVlsFDbf456IoeRAHlz7G/CN0ttr02GAiWZD9SsOqLfLPMvaNcwW4uGf
	JB/zNzQiUkFUpn1qe+SR0kRiJ9ELTe6GpVyR9w=
X-Google-Smtp-Source: AGHT+IE//iAAhyNQY4ImUdv14kyrLTpZV3PaYVl9Wa1YNXLWUQJwgWiIoDuaiaPCSJYwLhSNjPOALw==
X-Received: by 2002:a05:6a21:3989:b0:1e0:d20b:4f80 with SMTP id adf61e73a8af0-1e0e0ab431amr6514239637.9.1732733410920;
        Wed, 27 Nov 2024 10:50:10 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72522e0375asm3403519b3a.94.2024.11.27.10.50.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 10:50:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/14] Patch review
Date: Wed, 27 Nov 2024 10:49:53 -0800
Message-Id: <cover.1732733274.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 18:50:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207942

Please review this set of changes for kirkstone and have comments back by
end of day Friday, November 29

Passed a-full on autobuilder:

https://valkyrie.yoctoproject.org/#/builders/29/builds/537

The following changes since commit 8c10f4a4dc12f65212576e6e568fa4369014aaa0:

  udev-extraconf: fix network.sh script did not configure hotplugged interfaces (2024-11-22 07:09:00 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexander Kanavin (2):
  package_rpm: use zstd's default compression level
  package_rpm: restrict rpm to 4 threads

Archana Polampalli (5):
  ffmpeg: fix CVE-2023-51798
  ffmpeg: fix CVE-2023-47342
  ffmpeg: fix CVE-2023-50007
  ffmpeg: fix CVE-2023-51796
  ffmpeg: fix CVE-2024-7055

Chen Qi (1):
  coreutils: fix CVE-2024-0684

Hitendra Prajapati (1):
  libsndfile: fix CVE-2024-50612

Jiaying Song (1):
  python3-pip: fix CVE-2023-5752

Jinfeng Wang (1):
  tzdata&tzcode-native: upgrade 2024a -> 2024b

Markus Volk (1):
  ninja: fix build with python 3.13

Peter Marko (1):
  builder: set CVE_PRODUCT

Ross Burton (1):
  gstreamer1.0: improve test reliability

 meta/classes/package_rpm.bbclass              |   3 +-
 ...0001-split-do-not-shrink-hold-buffer.patch |  42 ++
 meta/recipes-core/coreutils/coreutils_9.0.bb  |   1 +
 .../glib-2.0/gdatetime-test-fail-0001.patch   |  72 ++++
 .../glib-2.0/gdatetime-test-fail-0002.patch   |  65 +++
 .../glib-2.0/gdatetime-test-fail-0003.patch   |  63 +++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |   3 +
 ...4efb41c039789b81f0dc0d67c1ed0faea17c.patch |  62 +++
 meta/recipes-devtools/ninja/ninja_1.10.2.bb   |   5 +-
 .../python/python3-pip/CVE-2023-5752.patch    |  34 ++
 .../python/python3-pip_22.0.3.bb              |   8 +-
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 meta/recipes-graphics/builder/builder_0.1.bb  |   4 +-
 .../ffmpeg/ffmpeg/CVE-2023-47342.patch        |  39 ++
 .../ffmpeg/ffmpeg/CVE-2023-50007.patch        |  78 ++++
 .../ffmpeg/ffmpeg/CVE-2023-51796.patch        |  39 ++
 .../ffmpeg/ffmpeg/CVE-2023-51798.patch        |  45 ++
 .../ffmpeg/ffmpeg/CVE-2024-7055.patch         |  38 ++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |   5 +
 .../gstreamer/gstreamer1.0/run-ptest          |  16 +-
 .../libsndfile1/CVE-2024-50612.patch          | 402 ++++++++++++++++++
 .../libsndfile/libsndfile1_1.0.31.bb          |   1 +
 22 files changed, 1020 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-core/coreutils/coreutils/0001-split-do-not-shrink-hold-buffer.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/gdatetime-test-fail-0001.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/gdatetime-test-fail-0002.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/gdatetime-test-fail-0003.patch
 create mode 100644 meta/recipes-devtools/ninja/ninja/885b4efb41c039789b81f0dc0d67c1ed0faea17c.patch
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2023-5752.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-47342.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50007.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51796.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51798.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-7055.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2024-50612.patch

-- 
2.34.1


