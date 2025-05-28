Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 425E9C5AD49
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 15:33:41 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.914.1748446413552258122
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 08:33:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NmFefOT9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7398d65476eso810511b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 08:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748446413; x=1749051213; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DvN77d8kL8H5PYw5rQHuw+hcZoVmz7LF+fXaobSEnRQ=;
        b=NmFefOT9OjuQ+rlMO9OoQ3o4yLeCX9PgTJP97Cjo6B17WFn3e1b5dKpR7h3OQR7Uud
         qBPg86/lrxEEdSXpo6C39BeDdgc9Ju2kFcOkvH0cvjkLBiv+/qcRScaqfdjCQs9dopzq
         VOsRD0Q2aaSHLwnsHzCjY9u0FrYsfWz/5r8FlR2rWGkK2gcBJJma96NvO3JD324j7bDt
         zoL4GSFkEB7FiT+p8j92Bx1shGFrJsJylwrfvplFCFm3ypnuSXvCv3lxX9LQaefnDwYD
         bhF34OKzXM/cwXIAgvfcEJ7l8NcIhvahYja1AorMCWnayzdy5sh6yiQrVq8MqnUGdCjU
         fuJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748446413; x=1749051213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DvN77d8kL8H5PYw5rQHuw+hcZoVmz7LF+fXaobSEnRQ=;
        b=b5bJ+VUX9Ru1CY/8DwIiLcydAHczoDxibQeDha8sVLlUTRNkvq92mdn85Zvvm1sq9a
         I7jOCWzIIMyin4N9vOee2yQWD2yYNPUrtXGptKKbMWwVXz7OTuRuMgwyQfQSqJQf2H64
         BRmFrBOGHU2SCJiYmEKYeY33isEMCUsGQuYJy1uT+hM4Ogn/ssX1p0iKi41u9DbojW2R
         Ah77pV1sY1Geq3voK+mEzOelMNlfx7ijFIJU4KgYRJAYB00KBWs1P9MXFKSPY0/Rp38l
         hW1OZ5y7+xxDxEox3l/NeiOJ2p6WK8Xv64jflvgV3/XKKGY4bRFoG1kpT7m2rRTbaJ3W
         QKaw==
X-Gm-Message-State: AOJu0Yx9oVGF2724n0MpJ37lWZCNYMGOMkJVQk3z8m8hVanEbU9WZwiM
	+9GSWnLXlaejO9pXay/02u39HQlNMHVdYUHBjAg1ift2LRmBb1qId0DesKbpqHs2Z8A8UU/yieF
	rwp4T
X-Gm-Gg: ASbGncuqxQUA41ewUOQKhuzipBFL+8nsxvkhp9RiK3aja35oUMwCgzicKeOcau0K+bA
	1Cyn2EDPSMNVnEu0zQopt5uW9hcwSscCwmOF62hiqJcUaj0DKAaKwFVTdu7zoLPKXLFRspxVPdt
	5Ao4MMcOLT6TkDc9b00wvpsYZkhtaFVDDX3RP99QONDDxTjjGQWHOk1qniAk/lv/U3aghdqBhCJ
	aR/u6AyeLQhLYD3YAFn+53ENLLTywr+IgdBMEeEumaFNkCUsoogBtxMzzBEtCvKFsW9ef7NsrQM
	JmcMvAX6dVG4qFxP9juB0+FDFhw5BSOHYEg+4YEi5Q8=
X-Google-Smtp-Source: AGHT+IEGYLNYo2qZ8vUlPeazI7hlaTF88hfUnGh9Us4nz14piF9nocxm2AOjUppxsbBfEQhbZXjlDw==
X-Received: by 2002:a05:6a20:4320:b0:1f3:26ae:7792 with SMTP id adf61e73a8af0-21ac5c78acamr26716637.18.1748446412393;
        Wed, 28 May 2025 08:33:32 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2f2f:1884:f4cc:456c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-746e343c1basm1400268b3a.132.2025.05.28.08.33.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 08:33:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 00/14] Patch review
Date: Wed, 28 May 2025 08:33:09 -0700
Message-ID: <cover.1748446235.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 15:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217364

Please review this set of changes for walnascar and have comments back by
end of day Friday, May 30

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1673

The following changes since commit 17affdaa600896282e07fb4d64cb23195673baa1:

  build-appliance-image: Update to walnascar head revision (2025-05-23 08:43:13 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/walnascar-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/walnascar-nut

Deepesh Varatharajan (1):
  binutils: Fix CVE-2025-1178

Gyorgy Sarvari (1):
  libmatchbox: upgrade 1.13 -> 1.14

Harish Sadineni (1):
  binutils: Fix CVE-2025-1180

Peter Marko (8):
  sqlite3: patch CVE-2025-3277
  sqlite3: patch CVE-2025-29088
  sqlite3: mark CVE-2025-29087 as patched
  ofono: patch CVE-2024-7537
  xz: patch CVE-2025-31115
  binutils: drop obsolete CVE_STATUS
  binutils: mark CVE-2025-1153 as fixed
  libarchive: upgrade 3.7.8 -> 3.7.9

Wang Mingyu (1):
  epiphany: upgrade 48.0 -> 48.3

Yash Shinde (1):
  gcc: fix incorrect preprocessor line numbers in large files

Yi Zhao (1):
  python3-pygobject: RDEPENDS on gobject-introspection

 .../ofono/ofono/CVE-2024-7537.patch           |  59 +++
 meta/recipes-connectivity/ofono/ofono_2.15.bb |   1 +
 .../binutils/binutils-2.44.inc                |   4 +-
 .../binutils/0015-CVE-2025-1178.patch         |  33 ++
 .../binutils/binutils/CVE-2025-1180.patch     | 165 ++++++
 meta/recipes-devtools/gcc/gcc-14.2.inc        |   1 +
 ...-incorrect-preprocessor-line-numbers.patch | 475 ++++++++++++++++++
 .../python/python3-pygobject_3.52.2.bb        |   1 +
 ...ibarchive_3.7.8.bb => libarchive_3.7.9.bb} |   4 +-
 .../xz/xz/CVE-2025-31115-01.patch             |  29 ++
 .../xz/xz/CVE-2025-31115-02.patch             | 152 ++++++
 .../xz/xz/CVE-2025-31115-03.patch             |  98 ++++
 .../xz/xz/CVE-2025-31115-04.patch             |  56 +++
 meta/recipes-extended/xz/xz_5.6.4.bb          |   4 +
 .../{epiphany_48.0.bb => epiphany_48.3.bb}    |   2 +-
 ...ibmatchbox_1.13.bb => libmatchbox_1.14.bb} |   2 +-
 .../sqlite/sqlite3/CVE-2025-29088.patch       | 179 +++++++
 .../sqlite/sqlite3/CVE-2025-3277.patch        |  29 ++
 meta/recipes-support/sqlite/sqlite3_3.48.0.bb |   5 +-
 19 files changed, 1292 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7537.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0015-CVE-2025-1178.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1180.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0028-fix-incorrect-preprocessor-line-numbers.patch
 rename meta/recipes-extended/libarchive/{libarchive_3.7.8.bb => libarchive_3.7.9.bb} (91%)
 create mode 100644 meta/recipes-extended/xz/xz/CVE-2025-31115-01.patch
 create mode 100644 meta/recipes-extended/xz/xz/CVE-2025-31115-02.patch
 create mode 100644 meta/recipes-extended/xz/xz/CVE-2025-31115-03.patch
 create mode 100644 meta/recipes-extended/xz/xz/CVE-2025-31115-04.patch
 rename meta/recipes-gnome/epiphany/{epiphany_48.0.bb => epiphany_48.3.bb} (94%)
 rename meta/recipes-graphics/libmatchbox/{libmatchbox_1.13.bb => libmatchbox_1.14.bb} (95%)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2025-29088.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2025-3277.patch

-- 
2.43.0


