Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA586C4332F
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 14:17:31 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web08.16525.1667744251055015160
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 06:17:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=InwhEPdu;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id z5-20020a17090a8b8500b00210a3a2364fso11020850pjn.0
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 06:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+fthq7gS+EHPpSvFpK7WZRo4x67EVcSyxsFgQy4Zyec=;
        b=InwhEPdurIkhlRsV0VH9fQpUCY8oJ0kzpToIMxAQmVdZLnWwTXmRtz29DxrmXUEsgy
         VJ2pImWyhc8WvPiUo0NtsDgF4kpiWYg8z27nDWHAT105VNVTbrz3eRmGaHBK6zlFz0AU
         7Pj/vKyVoNittH0QhUj6FUjWwqHz52+QFNGomvdrw1tZkROSCn0ZNfieqJKEJA+UUEjv
         BRR+PAKbVXDo57a9L/tnNUWKDAxIrv0F1V7nOqKZWubgHwr7DHarhCEhUhXYOkSleaJB
         2a35UmoIryPGHXbG9YYi3YPzXrz51pOGvIXAVLMcJ5Dc7wpkmxYcrp4c6ZVt3e38rNJn
         6Fpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+fthq7gS+EHPpSvFpK7WZRo4x67EVcSyxsFgQy4Zyec=;
        b=z1yXPcDjYjnKh8Ky5je6QQklBo+xj20rs5yxooB+vJ3BB8iggJylPDN7b4Co331H0j
         EEHT1lef5Mw2x6unTkVtExv1zywfeKAUkY9vK6ausTdycyFDsVLWpHwBRUoFjl0q+D6P
         PQsgux5Dgx5FyDdGQg7o0sNuTZsTbld00Tw8JOZzJmGs2sGLWcKd1DpE6L6kgFVsUTp3
         Z4RlN4bZC1jvBH/rORoB3+KJ/AGe4sT1Z2SVP4Ml6GNWQvAEPBifUnPcFusXmL4jHheq
         jzPTsBxzSqD/xBAXYFniUakFWbxVLXF5Hmr3fZZmfd335W8HMID7e3/5b0lr33HD54UJ
         7VyA==
X-Gm-Message-State: ACrzQf3L4I+MRzk5wUbOjsLNxJNQBA2FMBqn8vG0kNNqC/4djxIsRq33
	EueZ6DVh/viJ3XGICClCNRj+BV8r0GR01FN2
X-Google-Smtp-Source: AMsMyM7peDZp9Yx4ufDP5/mo7ufAzHZQeh+vXSzknmSgD3TcscssL6Zl9mfDwtmzGBEGjDQi76qmmQ==
X-Received: by 2002:a17:90b:33c7:b0:214:1ddc:c6bd with SMTP id lk7-20020a17090b33c700b002141ddcc6bdmr27794105pjb.151.1667744249726;
        Sun, 06 Nov 2022 06:17:29 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0017534ffd491sm3224907pll.163.2022.11.06.06.17.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 06:17:29 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 00/34] Patch review
Date: Sun,  6 Nov 2022 04:16:43 -1000
Message-Id: <cover.1667744095.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 14:17:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172768

Please review this set of patches for langdale and have changes back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4428

The following changes since commit 48f9f92c547fac35ff398180a32a5b0829cd9fff:

  openssl: Upgrade 3.0.5 -> 3.0.7 (2022-11-03 04:25:37 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/langdale-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/langdale-nut

Adrian Freihofer (1):
  buildconf: compare abspath

Alexander Kanavin (2):
  rust-target-config: match riscv target names with what rust expects
  rust: install rustfmt for riscv32 as well

Bruce Ashfield (3):
  linux-yocto/5.15: update to v5.15.72
  linux-yocto/5.19: update to v5.19.14
  kern-tools: fix relative path processing

Christian Eggers (1):
  linux-firmware: split rtl8761 firmware

Claus Stovgaard (1):
  gstreamer1.0-libav: fix errors with ffmpeg 5.x

Etienne Cordonnier (1):
  mirrors.bbclass: use shallow tarball for binutils-native

Jose Quaresma (1):
  kernel-yocto: improve fatal error messages of symbol_why.py

Keiya Nobuta (1):
  create-spdx: Remove ";name=..." for downloadLocation

Luca Boccassi (1):
  systemd: add systemd-creds and systemd-cryptenroll to
    systemd-extra-utils

Markus Volk (1):
  mesa: update 22.2.0 -> 22.2.2

Martin Jansa (2):
  vulkan-samples: add lfs=0 to SRC_URI to avoid git smudge errors in
    do_unpack
  externalsrc.bbclass: fix git repo detection

Mingli Yu (1):
  grub: disable build on armv7ve/a with hardfp

Peter Kjellerstedt (1):
  externalsrc.bbclass: Remove a trailing slash from ${B}

Ross Burton (2):
  zlib: do out-of-tree builds
  zlib: upgrade 1.2.12 -> 1.2.13

Sean Anderson (3):
  uboot-sign: Fix using wrong KEY_REQ_ARGS
  kernel: Clear SYSROOT_DIRS instead of replacing sysroot_stage_all
  kernel-fitimage: Use KERNEL_OUTPUT_DIR where appropriate

Sergei Zhmylev (1):
  wic: honor the SOURCE_DATE_EPOCH in case of updated fstab

Thomas Perrot (1):
  xserver-xorg: move some recommended dependencies in required

Tim Orling (1):
  vim: upgrade 9.0.0614 -> 9.0.0820

Vincent Davis Jr (1):
  linux-firmware: package amdgpu firmware

wangmy (8):
  libcap: upgrade 2.65 -> 2.66
  libical: upgrade 3.0.14 -> 3.0.15
  numactl: upgrade 2.0.15 -> 2.0.16
  wpebackend-fdo: upgrade 1.12.1 -> 1.14.0
  libksba: upgrade 1.6.0 -> 1.6.2
  libsdl2: upgrade 2.24.0 -> 2.24.1
  lttng-ust: upgrade 2.13.4 -> 2.13.5
  lighttpd: upgrade 1.4.66 -> 1.4.67

 meta/classes-global/mirrors.bbclass           |  1 +
 meta/classes-recipe/kernel-fitimage.bbclass   | 16 ++--
 meta/classes-recipe/kernel-yocto.bbclass      | 10 +--
 meta/classes-recipe/kernel.bbclass            |  4 +-
 .../classes-recipe/rust-target-config.bbclass | 40 ++++++---
 meta/classes-recipe/uboot-sign.bbclass        |  2 +-
 meta/classes/create-spdx.bbclass              |  1 +
 meta/classes/externalsrc.bbclass              |  6 +-
 meta/lib/bblayers/buildconf.py                |  2 +-
 meta/lib/oe/rust.py                           |  2 +
 meta/recipes-bsp/grub/grub2.inc               |  4 +-
 meta/recipes-core/systemd/systemd_251.4.bb    |  2 +
 ...t-inputs-provided-to-the-CRC-functio.patch | 54 ------------
 ...etting-a-gzip-header-extra-field-wit.patch | 38 --------
 ...processing-bug-that-dereferences-NUL.patch | 36 --------
 meta/recipes-core/zlib/zlib/cc.patch          | 27 ------
 .../zlib/zlib/ldflags-tests.patch             | 45 ----------
 .../zlib/{zlib_1.2.12.bb => zlib_1.2.13.bb}   | 12 ++-
 meta/recipes-devtools/rust/rust_1.63.0.bb     |  1 -
 .../lighttpd/lighttpd/CVE-2022-41556.patch    | 31 -------
 ...{lighttpd_1.4.66.bb => lighttpd_1.4.67.bb} |  3 +-
 ...d-in-native-OE-builds-by-not-looking.patch |  6 +-
 .../{libsdl2_2.24.0.bb => libsdl2_2.24.1.bb}  |  2 +-
 .../{mesa-gl_22.2.0.bb => mesa-gl_22.2.2.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc           |  4 +-
 .../mesa/{mesa_22.2.0.bb => mesa_22.2.2.bb}   |  0
 .../vulkan/vulkan-samples_git.bb              |  2 +-
 .../xorg-xserver/xserver-xorg.inc             |  6 +-
 .../kern-tools/kern-tools-native_git.bb       |  2 +-
 .../linux-firmware/linux-firmware_20220913.bb | 18 ++++
 .../linux/linux-yocto-rt_5.15.bb              |  6 +-
 .../linux/linux-yocto-rt_5.19.bb              |  6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |  6 +-
 .../linux/linux-yocto-tiny_5.19.bb            |  6 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++---
 meta/recipes-kernel/linux/linux-yocto_5.19.bb | 26 +++---
 ...ttng-ust_2.13.4.bb => lttng-ust_2.13.5.bb} |  2 +-
 ...r-APNG-encoder-property-registration.patch | 86 +++++++++++++++++++
 .../gstreamer/gstreamer1.0-libav_1.20.3.bb    |  4 +-
 ...fdo_1.12.1.bb => wpebackend-fdo_1.14.0.bb} |  2 +-
 ...-Raise-the-size-of-arrays-containing.patch |  2 +-
 .../libcap/{libcap_2.65.bb => libcap_2.66.bb} |  2 +-
 .../{libical_3.0.14.bb => libical_3.0.15.bb}  |  2 +-
 .../{libksba_1.6.0.bb => libksba_1.6.2.bb}    |  2 +-
 meta/recipes-support/numactl/numactl_git.bb   |  4 +-
 meta/recipes-support/vim/vim.inc              |  4 +-
 scripts/lib/wic/partition.py                  |  7 +-
 scripts/lib/wic/plugins/imager/direct.py      |  3 +
 scripts/lib/wic/plugins/source/rootfs.py      |  2 +-
 49 files changed, 236 insertions(+), 339 deletions(-)
 delete mode 100644 meta/recipes-core/zlib/zlib/0001-Correct-incorrect-inputs-provided-to-the-CRC-functio.patch
 delete mode 100644 meta/recipes-core/zlib/zlib/0001-Fix-a-bug-when-getting-a-gzip-header-extra-field-wit.patch
 delete mode 100644 meta/recipes-core/zlib/zlib/0001-Fix-extra-field-processing-bug-that-dereferences-NUL.patch
 delete mode 100644 meta/recipes-core/zlib/zlib/cc.patch
 delete mode 100644 meta/recipes-core/zlib/zlib/ldflags-tests.patch
 rename meta/recipes-core/zlib/{zlib_1.2.12.bb => zlib_1.2.13.bb} (68%)
 delete mode 100644 meta/recipes-extended/lighttpd/lighttpd/CVE-2022-41556.patch
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.66.bb => lighttpd_1.4.67.bb} (96%)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.24.0.bb => libsdl2_2.24.1.bb} (97%)
 rename meta/recipes-graphics/mesa/{mesa-gl_22.2.0.bb => mesa-gl_22.2.2.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_22.2.0.bb => mesa_22.2.2.bb} (100%)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.13.4.bb => lttng-ust_2.13.5.bb} (95%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-libav-Fix-for-APNG-encoder-property-registration.patch
 rename meta/recipes-sato/webkit/{wpebackend-fdo_1.12.1.bb => wpebackend-fdo_1.14.0.bb} (90%)
 rename meta/recipes-support/libcap/{libcap_2.65.bb => libcap_2.66.bb} (96%)
 rename meta/recipes-support/libical/{libical_3.0.14.bb => libical_3.0.15.bb} (96%)
 rename meta/recipes-support/libksba/{libksba_1.6.0.bb => libksba_1.6.2.bb} (94%)

-- 
2.25.1


