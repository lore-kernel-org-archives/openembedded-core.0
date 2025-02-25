Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD71C021BC
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 14:30:12 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.9015.1740493803861537739
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 06:30:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UerVbF89;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-220e6028214so123792315ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 06:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740493803; x=1741098603; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QcKLWVk6DB8ZD91aSwlRSQW/Cy6AAuTUlBWtjMQF6M4=;
        b=UerVbF89Ecn0RMAOCCKr/NroHMp+KqsjddCsaF37jEjTPsGyruh2QU+fWKnMukLYfr
         Fo86g4FleoBNqPiJvls+7Dom80axMNbGdOTLj8RWNh+cWs+a4N8LJlAb82pTaxbzr5Rm
         0/WBmpSUp6Lsho78owhynNydiSqRGef63odqLTSjVMsuCNPRMJnVoWOfQjDM72ScFpax
         1Ks7ymcY8XAnLWL0FjI1OzIVf62LBIea+28Jv3ve1q/Gg/XvkFN5b3+FoZZYiao1mBpt
         n90chVhV/ps5uV37+TcXLFRyvYVxmiL8M+d8vgy3h0yFM7Jm3Oepv8jFKKbo+TiHiumd
         sqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740493803; x=1741098603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QcKLWVk6DB8ZD91aSwlRSQW/Cy6AAuTUlBWtjMQF6M4=;
        b=PCqqqqE1gMBAlbDfKYQUAeuLAWIcoU4xISwsDA1CFzQ7v6a56pYVGUaYtcXS6EOnNg
         v+TYQAIa5ZRpIt3hTfaV+YgR1XXOUkXcu5Tz/Ed2UQvmV4bsXaAaOPSy+Z9AGl9LSG5z
         SkhfZzNL7l/bRHuN3FOpzy5tP6XJAv8UN9p2sGKeQ21JqfQchlNL01jAqh5bSShMVnPg
         bSsGsFiCdPGtHdahOHs6ZQzmMa4vhqBMk/QDvBPvqko68DhESvM8ioamtzbjmx4NtjsN
         3U/slumD6ZzfI1LewPZzUZ/qAuls1P8V6MRohgM9rIREHi2z8I3njtsXeSXu4gBlikEZ
         M0Kw==
X-Gm-Message-State: AOJu0Yx5Vq7ktto4Y6cZ2EPICIu2r0JlTqRizMF2t5wWCXwzKeXw95jc
	JwcpoumpfjL3ArfFoqgoWmsGBRRyAcwR0gve2Dz4sbbleGj/uiKhUb4ozKD7YjP6me3ssJjYa1+
	J
X-Gm-Gg: ASbGnctbMOFp5BFavQbUOvrcP0zhEAedb2PL7lbxlDczeHP4VLFteff1c6OCdv8iz45
	RVCZxT9wPOZVzcte6N/9QNZtWT2ZB6Sm+r9qtIqnZ9jJd2LORBK1tlbLQArxsx0kPUleaYZ4OxU
	RrmchvaIiRXRvSVJU28csaCc5ZSvQL4EjNah1SnSnUEa5T6o+oJzuYYHu8AUVdJuUyySSv+cMto
	jAJTXeFv1y5o26EODc3CdKiWwcdQ5/vp+z3sP8RjnPP5UzdqOejOIWTJDy36WPsb/7ARt2jW7lv
	5Oe36W1iplGbeuv9rw==
X-Google-Smtp-Source: AGHT+IHu5Msk1aV/GvAsmSyTIjXHpa0FzpWFhfP/CtU5cY1l6hUx49VF2PkrjTlVy9mxZvp9Y2rnyw==
X-Received: by 2002:a05:6a00:1810:b0:727:3fd5:b530 with SMTP id d2e1a72fcca58-73426d77f98mr24371244b3a.15.1740493802980;
        Tue, 25 Feb 2025 06:30:02 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c473:2777:3793:104c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81ed10sm1535650b3a.129.2025.02.25.06.30.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:30:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/22] Patch review
Date: Tue, 25 Feb 2025 06:29:35 -0800
Message-ID: <cover.1740493685.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 14:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211885

Please review this set of hcanges for kirkstone and have comments back by
end of day Thursday, February 27

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1076

The following changes since commit 573f5b2d8fec9f8a4ed17e836ef3feeb6de62e5a:

  procps: replaced one use of fputs(3) with a write(2) call (2025-02-19 06:43:20 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Archana Polampalli (5):
  gstreamer1.0-rtsp-server: fix CVE-2024-44331
  ffmpeg: fix CVE-2024-36618
  ffmpeg: fix CVE-2024-28661
  ffmpeg: fix CVE-2024-35369
  ffmpeg: fix CVE-2025-25473

Carlos Dominguez (1):
  u-boot: Fix CVE-2022-30767

Divya Chellam (1):
  vim: Upgrade 9.1.0764 -> 9.1.1043

Hitendra Prajapati (1):
  libcap: fix CVE-2025-1390

Hongxu Jia (6):
  u-boot: fix CVE-2024-57254
  u-boot: fix CVE-2024-57255
  u-boot: fix CVE-2024-57256
  u-boot: fix CVE-2024-57257
  u-boot: fix CVE-2024-57258
  u-boot: fix CVE-2024-57259

Kai Kang (2):
  Revert "ovmf: Fix CVE-2023-45237"
  Revert "ovmf: Fix CVE-2023-45236"

Peter Marko (5):
  libxml2: fix compilation of explicit child axis in pattern
  libxml2: patch CVE-2024-56171
  libxml2: patch CVE-2025-24928
  ffmpeg: ignore 5 CVEs
  ffmpeg: ignore CVE-2024-7272

Sakib Sajal (1):
  u-boot: fix CVE-2022-2347 and CVE-2022-30790

 .../u-boot/files/0001-CVE-2022-30767.patch    |   44 +
 .../u-boot/files/CVE-2022-2347_1.patch        |  129 ++
 .../u-boot/files/CVE-2022-2347_2.patch        |   66 +
 .../u-boot/files/CVE-2022-30790.patch         |  149 ++
 .../u-boot/files/CVE-2024-57254.patch         |   47 +
 .../u-boot/files/CVE-2024-57255.patch         |   53 +
 .../u-boot/files/CVE-2024-57256.patch         |   51 +
 .../u-boot/files/CVE-2024-57257.patch         |  228 +++
 .../u-boot/files/CVE-2024-57258-1.patch       |   47 +
 .../u-boot/files/CVE-2024-57258-2.patch       |   43 +
 .../u-boot/files/CVE-2024-57258-3.patch       |   40 +
 .../u-boot/files/CVE-2024-57259.patch         |   41 +
 meta/recipes-bsp/u-boot/u-boot_2022.01.bb     |   12 +
 ...x-compilation-of-explicit-child-axis.patch |   31 +
 .../libxml/libxml2/CVE-2024-56171.patch       |   42 +
 .../libxml/libxml2/CVE-2025-24928.patch       |   58 +
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |    3 +
 .../ovmf/ovmf/CVE-2023-45236.patch            |  829 -----------
 .../ovmf/ovmf/CVE-2023-45237-0001.patch       |   78 -
 .../ovmf/ovmf/CVE-2023-45237-0002.patch       | 1288 -----------------
 meta/recipes-core/ovmf/ovmf_git.bb            |    3 -
 .../ffmpeg/ffmpeg/CVE-2024-28661.patch        |   40 +
 .../ffmpeg/ffmpeg/CVE-2024-35369.patch        |   38 +
 .../ffmpeg/ffmpeg/CVE-2024-36618.patch        |   36 +
 .../ffmpeg/ffmpeg/CVE-2025-25473.patch        |   36 +
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |   27 +
 .../CVE-2024-44331.patch                      |   44 +
 .../gstreamer1.0-rtsp-server_1.20.7.bb        |    4 +-
 .../libcap/files/CVE-2025-1390.patch          |   36 +
 meta/recipes-support/libcap/libcap_2.66.bb    |    1 +
 meta/recipes-support/vim/vim.inc              |    4 +-
 31 files changed, 1347 insertions(+), 2201 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-CVE-2022-30767.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2022-2347_1.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2022-2347_2.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2022-30790.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-57254.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-57255.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-57256.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-57257.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-57258-1.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-57258-2.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-57258-3.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-57259.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/0001-pattern-Fix-compilation-of-explicit-child-axis.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2024-56171.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-24928.patch
 delete mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45236.patch
 delete mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0001.patch
 delete mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0002.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-28661.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35369.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36618.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-25473.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/CVE-2024-44331.patch
 create mode 100644 meta/recipes-support/libcap/files/CVE-2025-1390.patch

-- 
2.43.0


