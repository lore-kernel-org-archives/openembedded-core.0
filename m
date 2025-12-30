Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 311F1EE499F
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 20:12:15 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71726.1767125530673793483
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 12:12:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DeV0ADZm;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a0b4320665so156957115ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 12:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767125530; x=1767730330; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3iVxcIOZOtHxGuYUITNgD8uwVohzs/xzi1u6FyhiUaM=;
        b=DeV0ADZm/cSDvSQbPEvNApWB9LWrPrzWYR6lGphaNwEYCq66up9ULIcCQCMbYPBDn2
         lrJSyO4niJ3H/z5o99/9FTuv0jmZbjVeLaMY/2cHeRTymCmCQa/8Qqi0yRWwAKGzt/mr
         lVsiNFLi4n+K5renHY3vb7qctI7QvjfphAp+cAH2CX0WnVM05xectKcf23EKjQFekiSP
         eNr41cJ/QYQb2W5A1cehlbB4CP/xp9AdtH9CLKzgc/TuuAr7Xz8pY/j6tBdIZGh8EbZ0
         5SwT0vOXsxrdas2MPWx6i2MXZv7UxuAtChrZviEVPKFLq1LPMoRhshJrWAmjCMr9JJ8M
         wNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767125530; x=1767730330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3iVxcIOZOtHxGuYUITNgD8uwVohzs/xzi1u6FyhiUaM=;
        b=O9hsjQpOg7UDhgGPAjk93N6vYEg5Hsdcr/UuO/C+QDiAuvbfI4Unxi/x9FzvgZCA2J
         pKPZy+uBQG5/X4CmoJmXmG9LNybkv4pPdbtIgsQ3UaCmI/yT2leBdh+FJXzDbPfiJobd
         VGq8P+7KdNS2WAG9R4EIo+HuDB/u9GQp/cilvF8LVRFRPTUjrGd7nSkDteWKiB/4y5+g
         vW3rahtt0sRKSEphrWbY9vy1JvJQm6n7LRcm8R74T3sOAbSxeJHwYfWGg0ifTg+DTIUT
         jIUD/GDYLH4sAjyCCJnB3ew4MWV3yre1ZGLgkIx2F6JZ2JtcJGCllnCu3PUpoOoduSbw
         FDZw==
X-Gm-Message-State: AOJu0YxxZzJ5+hOISecZ0mk+hydCXeCf8PUQaUPXCXE8JayzSGb+c2Vv
	5RftjuvhNOUGagyJR82Xdl9MFZVFM+kJv86/HAR7gNoqO44T4qG55aEg+9KFJA2cj+lsG66uMky
	5zL7h
X-Gm-Gg: AY/fxX4K4hz9CRdbd6GnKslUbytDWq0mNjDyKjeB94mJZhEzW8nhAv7DLPk1SxBIiEc
	cv7p8LUkhjx31SNw3Qh5JtssuzQuHTm1TmNAsG94P97WzQh4MexcKy53eAqZVtIcoO1KLYZDTi3
	U8Z/UoZ8pCtSEbL/U6TjYFX43rI2KEYv0XozyG/d5NZyH4xVzg33Yu0BBa5smF1p3Wi6lIX1n7r
	z7rDiyeHa8hTEeBITDqVI/YlV9wCkpa2Jysg26ohWDEFOzC3cWPNlxl3IUhOFVr7/l0tcLhvOV5
	EtxS5hH3rli9W94joZoyZRx9MJfN0NdtGJV3qW9Tv+u5veYf02PeuL35ZGp8yLFe5rytBolqhh0
	/XbBeLVZV3ZANsEpNopB6tx9svirMEERrp+nLsIZo+Sib+dUgcVMxngB/s/Hly7mNQ8P6DigAfM
	16Sw==
X-Google-Smtp-Source: AGHT+IE1sAdtc3BjCVawNf350xQZpbm9ELrXUfNcI0kPz4JVJdNgiW9UGIt56ZB/h2nT717Kw8VZuw==
X-Received: by 2002:a17:903:1105:b0:2a0:cb8d:2ed8 with SMTP id d9443c01a7336-2a2f2a35873mr349971785ad.30.1767125529539;
        Tue, 30 Dec 2025 12:12:09 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:501f:80a7:5971:3e87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83325sm310391365ad.34.2025.12.30.12.12.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:12:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 00/29] Patch review
Date: Tue, 30 Dec 2025 12:11:30 -0800
Message-ID: <cover.1767106395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 20:12:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228692

Please review this set of changes for whinlatter and have comments back by
end of day Monday January 5

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2960

The following changes since commit 9964fa3da2fa1e7243fba1a826e59f7bb1813706:

  populate_sdk_ext: keep SDK_TARGETS so SPDX/SBOM tasks remain in locked sigs (2025-12-18 13:11:45 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/whinlatter-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/whinlatter-nut

Ankur Tyagi (4):
  gnutls: patch CVE-2025-9820
  sqlite3: patch CVE-2025-3277
  sqlite3: patch CVE-2025-6965
  libxmlb: upgrade 0.3.23 -> 0.3.24

Chen Qi (1):
  cups: upgrade from 2.4.14 to 2.4.15

Deepesh Varatharajan (2):
  llvm/clang: Upgrade to 21.1.6 release
  llvm/clang: Upgrade to 21.1.7 release

Dmitry Baryshkov (1):
  mesa: upgrade 25.2.5 -> 25.2.8

Gyorgy Sarvari (1):
  enchant2: upgrade 2.8.12 -> 2.8.14

Jörg Sommer (1):
  glib-2.0: Upgrade 2.86.0 -> 2.86.1

Peter Marko (1):
  libarchive: upgrade 3.8.2 -> 3.8.3

Robert Yang (2):
  e2fsprogs: misc/create_inode.c: Fix for file larger than 2GB
  ccache: 4.12.1 -> 4.12.2

Wang Mingyu (13):
  ell: upgrade 0.79 -> 0.80
  gst-devtools: upgrade 1.26.5 -> 1.26.7
  gst-examples: upgrade 1.26.5 -> 1.26.7
  gstreamer1.0-libav: upgrade 1.26.5 -> 1.26.7
  gstreamer1.0-plugins-bad: upgrade 1.26.5 -> 1.26.7
  gstreamer1.0-plugins-base: upgrade 1.26.5 -> 1.26.7
  gstreamer1.0-plugins-good: upgrade 1.26.5 -> 1.26.7
  gstreamer1.0-plugins-ugly: upgrade 1.26.5 -> 1.26.7
  gstreamer1.0-python: upgrade 1.26.5 -> 1.26.7
  gstreamer1.0-rtsp-server: upgrade 1.26.5 -> 1.26.7
  gstreamer1.0: upgrade 1.26.5 -> 1.26.7
  gstreamer1.0-vaapi: upgrade 1.26.5 -> 1.26.7
  ccache: upgrade 4.12 -> 4.12.1

Yash Shinde (2):
  binutils: fix CVE-2025-11839
  binutils: fix CVE-2025-11840

Zhang Peng (1):
  libpng: upgrade 1.6.50 -> 1.6.51

 meta/conf/distro/include/maintainers.inc      |   4 +-
 .../ell/{ell_0.79.bb => ell_0.80.bb}          |   2 +-
 ...l_2.86.0.bb => glib-2.0-initial_2.86.1.bb} |   0
 ...{glib-2.0_2.86.0.bb => glib-2.0_2.86.1.bb} |   0
 meta/recipes-core/glib-2.0/glib.inc           |   2 +-
 .../binutils/binutils-2.45.inc                |   2 +
 .../binutils/0019-CVE-2025-11839.patch        |  32 +++
 .../binutils/0020-CVE-2025-11840.patch        |  37 +++
 .../{ccache_4.12.bb => ccache_4.12.2.bb}      |   2 +-
 meta/recipes-devtools/clang/common-clang.inc  |   2 +-
 meta/recipes-devtools/clang/common.inc        |   2 +-
 ...inode.c-Fix-for-file-larger-than-2GB.patch |  40 +++
 .../e2fsprogs/e2fsprogs_1.47.3.bb             |   1 +
 .../cups/{cups_2.4.14.bb => cups_2.4.15.bb}   |   2 +-
 ...ibarchive_3.8.2.bb => libarchive_3.8.3.bb} |   2 +-
 .../{libxmlb_0.3.23.bb => libxmlb_0.3.24.bb}  |   2 +-
 meta/recipes-graphics/mesa/mesa.inc           |   4 +-
 ...tools_1.26.5.bb => gst-devtools_1.26.7.bb} |   2 +-
 ...mples_1.26.5.bb => gst-examples_1.26.7.bb} |   2 +-
 ...1.26.5.bb => gstreamer1.0-libav_1.26.7.bb} |   2 +-
 ....bb => gstreamer1.0-plugins-bad_1.26.7.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-base_1.26.7.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-good_1.26.7.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-ugly_1.26.7.bb} |   2 +-
 ....26.5.bb => gstreamer1.0-python_1.26.7.bb} |   2 +-
 ....bb => gstreamer1.0-rtsp-server_1.26.7.bb} |   2 +-
 ...1.26.5.bb => gstreamer1.0-vaapi_1.26.7.bb} |   2 +-
 ...er1.0_1.26.5.bb => gstreamer1.0_1.26.7.bb} |   2 +-
 .../{libpng_1.6.50.bb => libpng_1.6.51.bb}    |   2 +-
 ...{enchant2_2.8.12.bb => enchant2_2.8.14.bb} |   2 +-
 .../gnutls/gnutls/CVE-2025-9820.patch         | 233 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.10.bb  |   1 +
 .../sqlite/files/CVE-2025-3277.patch          |  29 +++
 .../sqlite/files/CVE-2025-6965.patch          | 117 +++++++++
 meta/recipes-support/sqlite/sqlite3_3.48.0.bb |   5 +-
 35 files changed, 521 insertions(+), 26 deletions(-)
 rename meta/recipes-core/ell/{ell_0.79.bb => ell_0.80.bb} (88%)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.86.0.bb => glib-2.0-initial_2.86.1.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.86.0.bb => glib-2.0_2.86.1.bb} (100%)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0019-CVE-2025-11839.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0020-CVE-2025-11840.patch
 rename meta/recipes-devtools/ccache/{ccache_4.12.bb => ccache_4.12.2.bb} (93%)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch
 rename meta/recipes-extended/cups/{cups_2.4.14.bb => cups_2.4.15.bb} (51%)
 rename meta/recipes-extended/libarchive/{libarchive_3.8.2.bb => libarchive_3.8.3.bb} (96%)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.23.bb => libxmlb_0.3.24.bb} (93%)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.26.5.bb => gst-devtools_1.26.7.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.26.5.bb => gst-examples_1.26.7.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.26.5.bb => gstreamer1.0-libav_1.26.7.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.26.5.bb => gstreamer1.0-plugins-bad_1.26.7.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.26.5.bb => gstreamer1.0-plugins-base_1.26.7.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.26.5.bb => gstreamer1.0-plugins-good_1.26.7.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.26.5.bb => gstreamer1.0-plugins-ugly_1.26.7.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.26.5.bb => gstreamer1.0-python_1.26.7.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.26.5.bb => gstreamer1.0-rtsp-server_1.26.7.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.26.5.bb => gstreamer1.0-vaapi_1.26.7.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.26.5.bb => gstreamer1.0_1.26.7.bb} (97%)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.50.bb => libpng_1.6.51.bb} (97%)
 rename meta/recipes-support/enchant/{enchant2_2.8.12.bb => enchant2_2.8.14.bb} (91%)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-9820.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-3277.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-6965.patch

-- 
2.43.0


