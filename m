Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC80FC3DA4A
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 12:02:20 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.96181.1723636938767154587
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Aug 2024 05:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sF49WeW7;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7126d62667bso244430b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 05:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1723636938; x=1724241738; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XddlatY53gWTkNzxq3G8FGYPvpsw3LvppxUylCBs5Z8=;
        b=sF49WeW7bW6Kgh04nNtKwg41jw/ARCk048c9KfXFc6eOrOjx1DB+WVMr/DduoZhmpi
         RDptd1e4ELHMXs2irJUaCyAjWy9mYTof7NlqixmJFjOVFK2X4UvVm3sHFup9IQJ98SZY
         FK2/ThzGj6yBQ99/0b6Ncl8eUYRqSdfMgSJ7F0Bpyf845cx/gPlILQIPK6NSkEW30zHd
         /xrXAd8ZXyQxLlRYr5JIRMrM5bpvTWVDjlwwXLAGV1b5dM7rxiW/OUazUPNQnfzWjcAu
         MTdZxNDUALqT6E+ZvVlHfFnLlJXUzUDxzrCFjFF6lhX8noPtsN+jja1QQFh15lSMZakD
         4NXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723636938; x=1724241738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XddlatY53gWTkNzxq3G8FGYPvpsw3LvppxUylCBs5Z8=;
        b=PzmIU1dp4P2ip0bOh/ZuwHvUwz6SS7RtgrmDCmXytorTohY1BkWAA/qcjWdtLs0lxX
         mf9pibbiw7FzWNCeJWuHrVYnnlKfKJA4v2znx2oq0NKboQAYiO+Zd/VlFXRR0AaYoO8Q
         UVZMMJzlVzT7XgWaJq2FK4JzXyVD9fXYEXsEHT9+WoCHu4jLmJsOzhkcIQ9VjHbTjYnw
         AvSXRCThYX6vKeDC5ucc8s6Rgqun3t2BLV9v37TNQds25VHtVlZd1gePF9VuWOoKcKZs
         ZbttXzocMWJ+5vfWi5RAsi2RSZo0Ezj1VwsNkovjcZtyfBZakqfDOdnqLB/0/IhaiF9h
         odmQ==
X-Gm-Message-State: AOJu0YwKoYXlapUi4rgNFgHsI3zlRNxKZQ1V1KNt7Ab/BV/3g5UfJUsv
	H3A86dxWl02xJKEnB13A/tNXm7W2gmVKwLjWSjcrtXRR8enz/IFuJnptBAqep9DBy3E4AD0Vd0u
	Jgao=
X-Google-Smtp-Source: AGHT+IF/RUr0nKeTk6sKtWCcddVeuh09OZ9aiXHfqdCuoXdgHJPye0RSeTClD6ii4Q72udnnqO4G+g==
X-Received: by 2002:a17:90a:f98c:b0:2d3:bb9b:ce64 with SMTP id 98e67ed59e1d1-2d3bb9bf30bmr295077a91.30.1723636933420;
        Wed, 14 Aug 2024 05:02:13 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3ac80e0d1sm1512214a91.43.2024.08.14.05.02.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 05:02:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 0/9] Patch review
Date: Wed, 14 Aug 2024 05:02:00 -0700
Message-Id: <cover.1723636705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 12:02:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203311

Please review this set of changes for scarthgap and have comments back by
end of day Friday, August 16

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7241

The following changes since commit 236ac1b43308df722a78d3aa20aef065dfae5b2b:

  build-appliance-image: Update to scarthgap head revision (2024-08-10 06:35:20 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Archana Polampalli (1):
  ffmpeg: fix CVE-2023-50008

Niko Mauno (3):
  systemd: Mitigate /var/log type mismatch issue
  systemd: Mitigate /var/tmp type mismatch issue
  image_types.bbclass: Use --force also with lz4,lzop

Peter Marko (1):
  libyaml: ignore CVE-2024-35326

Richard Purdie (1):
  cve_check: Use a local copy of the database during builds

Ross Burton (1):
  python3-pycryptodome(x): use python_setuptools_build_meta build class

Ryan Eatmon (1):
  u-boot.inc: Refactor do_* steps into functions that can be overridden

Soumya Sambu (1):
  python3-certifi: Fix CVE-2024-39689

 meta/classes-recipe/image_types.bbclass       |   4 +-
 meta/classes/cve-check.bbclass                |   7 +-
 meta/recipes-bsp/u-boot/u-boot-configure.inc  |  36 ++-
 meta/recipes-bsp/u-boot/u-boot.inc            | 281 ++++++++++++------
 .../meta/cve-update-nvd2-native.bb            |  18 +-
 .../systemd/systemd/00-create-volatile.conf   |   1 +
 meta/recipes-core/systemd/systemd_255.4.bb    |   5 +-
 .../python3-certifi/CVE-2024-39689.patch      |  69 +++++
 .../python/python3-certifi_2024.2.2.bb        |   3 +
 .../python/python3-pycryptodome_3.20.0.bb     |   2 +-
 .../python/python3-pycryptodomex_3.20.0.bb    |   2 +-
 .../ffmpeg/ffmpeg/CVE-2023-50008.patch        |  29 ++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |   1 +
 meta/recipes-support/libyaml/libyaml_0.2.5.bb |   1 +
 14 files changed, 336 insertions(+), 123 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-certifi/CVE-2024-39689.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50008.patch

-- 
2.34.1


