Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCCE0CE9D45
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 14:58:40 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.91599.1767711513798197584
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 06:58:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Ua4VXQis;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-430f9ffd4e8so1397383f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 06:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1767711512; x=1768316312; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=S6c15Cgv6InmeyWMEu36YgNzOtU7RQ6dcoBoqW0d2Uc=;
        b=Ua4VXQisp1/5yY6iP8sMTVdsoVQF0WkSmrZBfv4D+jIRkkj5fPbcZVoKFID/duHnGK
         JS7riwQ8d9cMfEPQC+Fb7S0w9N9QrgwrSYe6dSD6W5uGmdfDsnyAzab+URCm2HSQ4uja
         A5TZY2nfF5d4QpwQnbQNJrDSaIhY64PMM2LH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767711512; x=1768316312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S6c15Cgv6InmeyWMEu36YgNzOtU7RQ6dcoBoqW0d2Uc=;
        b=Aabt9+DpUyhj9L9YWwQt1CAM+U/po7BBNnd09cBlrAf2XK8/y662SbM7Q1g7mBZ2gT
         OPipMWX9ixWkqqbyyM+qbdW9WCY8yHTSZw7fmE6oSBGIF3zJnAcpXYjI+cdMn4FmeZcw
         pFxmdR6X6DhpvZyVcl6LBFjXt71TJaAS43NCrv7rEU0P6qFdAvRL5WXvS3gFQvwKxFCB
         9J4J7p2X2OS/mvhXCV1/zJHEuScL8fpGjnJyzSIuGRTpMmCiNkzgcfJnt5C5TP4I0dc5
         szky0caqfriJSqn5nqAQ95ZNcDI92FT64jsveeinxyRTH4vr3MuzoGqCK5ok44jsQHxe
         obVQ==
X-Gm-Message-State: AOJu0YxX7rFRn3pxak5qCwdCF2elpVsfX1kBByGDNqnNIEQusAqWTKFW
	F6Zp1mdsx5yl4omRjJz71Dnq61Mi26NsWFeyne2RV1d2pnfZd4i7aeSoEXq7ZWWnnSLnwZzuwyJ
	TVDL+
X-Gm-Gg: AY/fxX56bK+mi+SYauZxR5ZwrpALxrS4D4guzPcLKoskxOwI8A2tHnYtM5JZcAOa2ny
	lM3vclLP77falh8jOxbxHQtkiLKIsAP9F3jOQvlUmEJp1SKhtEG1EFg79j0IS2m95PTf+JZVA0D
	nPvov5bf/pLSLDzr09Hti2Iaw7bmkTA5ugejq7bAi8Hn4PhglHTeUrh/AqAWqyCZdyQ8iobBHvp
	91tJpKO9NDB5FL90ivse8FoYKxB96HQftNDfCf3LVsvfASv4pxoHJyTjCxaRMoSkqy1I1MJlOeV
	8ckqR9l/DOm6PD4rlhjaL8FBYPI6kIUaUCFjEZnyGhOigh5cKthXuvzW7OA0emskHoRZzQ51PaZ
	IDYCGRP5HTgrk3MQgmMHUGgIWh/sPVtIFTCoNmRrOlxOJv4eAuV37KAq/Lg9+Q4/yXAQtqF5mfe
	+YTE91rsqDDacLpiHMIf1Hl4HdtNmv33PLHPuyXTGNg52JiAjQcDDXqQLFoA4AH67hLRHxy22U8
	wjkZdEd0yQnuzY8
X-Google-Smtp-Source: AGHT+IH/tGelVbiiwIGXUb5/0UrvXebw/SEIur5lKieKbxqevUKvPz6Y1VsUVDcORk5yOxRPW7LPaQ==
X-Received: by 2002:a05:6000:1886:b0:432:c03e:a77e with SMTP id ffacd0b85a97d-432c03ea994mr1884611f8f.16.1767711511728;
        Tue, 06 Jan 2026 06:58:31 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa0051b13b00a50722a9.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:51b1:3b00:a507:22a9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dade5sm4899155f8f.9.2026.01.06.06.58.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 06:58:31 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 00/29] Pull request (cover letter only)
Date: Tue,  6 Jan 2026 15:57:16 +0100
Message-ID: <cover.1767710585.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 14:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228893

Passed a-full on autobuilder(*):
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2997

(*): The builds/tests parts passed, only the "Send QA Email" step
failed. This is a known bug on AB side : https://bugzilla.yoctoproject.org/show_bug.cgi?id=15696.

The following changes since commit 9964fa3da2fa1e7243fba1a826e59f7bb1813706:

  populate_sdk_ext: keep SDK_TARGETS so SPDX/SBOM tasks remain in locked sigs (2025-12-18 13:11:45 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/whinlatter-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/whinlatter-next

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


