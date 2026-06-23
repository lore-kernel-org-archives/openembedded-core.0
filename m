Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18CF4CDB470
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 21:39:03 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31941.1782250739280658740
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 14:38:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3oG16iCs;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b64c8311so4130125e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 14:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782250737; x=1782855537; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=syRlA1roKghZ/eEc0C4NMNS0o+pqZZE7ENq6IOWJBPg=;
        b=3oG16iCs6fsi562hryRRGRNoD5T7FIHiDQeOpAUG+Rl74pf7NkADrkUFvnAWp7aWOk
         DxuI2aLMv0tEA29pMXRcGemxkGKq+m3vvXob6PTl7C1yVLTnIjsYbHx0dD/wpDO+Wci9
         5qVIP8aHJQ5h5dwcwEXrq4oVuK+VAqO1vZbU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782250737; x=1782855537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syRlA1roKghZ/eEc0C4NMNS0o+pqZZE7ENq6IOWJBPg=;
        b=b9Cp5JUuqOIW841oOvc/AxE24O1bTB4lxuZgcjUqhVlqTzy0vwHzKNTpea7gj9RIDb
         HEnMKPB0dV3hoBXtgy6nxH8YgaXIgeqKei8njORq4w52vgtfYr35EfTWZPk9iFcLIssL
         o9FBf61DzMC2rQj5BirkjZVzhDEiQ8WzYwltD1O7NaTOpq9UWTt/o2KlGNAxIYyFiVoE
         q+Jtm1yPkXMORcYgi9+MiVa8k+R9Qks1EqtqOqc+KW1ZV2D7suvGAvLMqWSAycRu5ZhU
         nc1Ue0M7UDoJnJ9gVQ4Hbq9mW54DbXo139Mb185I/epNyQj6DGOqpWkeBsshVHrGbe2B
         AqJA==
X-Gm-Message-State: AOJu0YwZtGAxTg054pMC9KqZUtb8ao+NzgWbgxQVj84cM2a8HE7xyORW
	8FNVTJvS0/i6j0Q9lZPVdldqrRO+Y6CXNt2aHj8sl5x8s7NxcIU3HWT+vBCXZUIe7g14Ayxgy89
	zw2Aw
X-Gm-Gg: AfdE7clT6UpjrWx8kswjWvQ8C1AVYzt8/rco04AX/Awyrr3UrChI8X7AuNvMa5wtD7J
	iBfT2rJ8Rexs3+omAMaTuylrlPVYrQxP6IPLJHBN+8jiAh0Eo8us2InSa7PeAJOBZY2YJyipxuc
	4fFIHEpyPOYYYEy+lTvF3ZxvGI6xflko3+FvImF6rr7sLsym/SrKM3w1NFEDICnZZKh7odgfKb0
	cUTJUVcLrlOqUsf57Mbab62wDorAsX+UQ15vyueB/cceMbaWgrxMsEHVJbS1BhmNCHOdiWRuUys
	Qfgvx9MaobkJvirbD/odmnk4T/w2d35SODX8rRS0M0Cl2YurVZqHODGqYa9e42UU+QmIoeAHU42
	bf42fEHfpqIoXyaljYUGrhiAcfOPho7j4/609tgmhQSc8XK+Brdq233aATjF8OuB5DvOMa/Oq8k
	fDmjcdcCnxBpqKEnRZLUMf3jEJhN9S6w8Ua/tspP1JnCfxcp02QrbJpcS0yvjpb1UDIDar39UyM
	sWV3IennOAX6XuY
X-Received: by 2002:a05:600c:e547:20b0:490:e19b:bd99 with SMTP id 5b1f17b1804b1-49260875a6emr3663575e9.30.1782250737282;
        Tue, 23 Jun 2026 14:38:57 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0055dd0cae868d89dd.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:55dd:cae:868d:89dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492609389f0sm3174675e9.2.2026.06.23.14.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 14:38:56 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][wrynose 00/36] Pull request (cover letter only)
Date: Tue, 23 Jun 2026 23:38:44 +0200
Message-ID: <cover.1782250290.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 21:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239421

Those are the patches from the last patch review:
https://lore.kernel.org/openembedded-core/cover.1781960051.git.yoann.congal@smile.fr/
(No changes from the review)

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4043
* qemuarmv5 failed with #16217 – AB-INT: boot hang in qemu (amba chip errors?)
  Retried as https://autobuilder.yoctoproject.org/valkyrie/#/builders/80/builds/3809
* meta-qcom has a known issue: https://github.com/qualcomm-linux/meta-qcom/issues/2457

The following changes since commit 530fb9ea9ba6ffe212566d3b95d17b519c52c769:

  openssl: upgrade 3.5.6 -> 3.5.7 (2026-06-16 23:18:27 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-next

for you to fetch changes up to cfd31f0bce7cb8478dae4a84af81fd7679739d4c:

  sstate: Detect broken sstate paths containing tmpdir (2026-06-19 09:40:22 +0000)

----------------------------------------------------------------

Alexander Kanavin (1):
  python3targetconfig: pull in nativesdk python when building nativesdk
    recipes

Harish Sadineni (1):
  perf: disable BUILD_BPF_SKEL by default

Hemanth Kumar M D (2):
  gcc: Upgrade GCC to 15.3 release
  binutils: Upgrade to 2.46.1 release

Jate Sujjavanich (1):
  udev-extraconf: use -H for unmount tmpfile find

Jesse Van Gavere (1):
  rust: export CARGO_BUILD_TARGET

Joshua Watt (8):
  mobile-broadband-provider-info: Fix license to be CC-PDDC
  gettext-minimal-native: Use SPDX License Identifier
  glib-2.0: Change from Public Domain to Gnome GCR Documentation License
  ttf-bitstream-vera: Use SPDX license identifier
  sqlite3: Use SPDX identifier
  pixman: Change PD license to HPND-sell-variant
  util-macros: Remove redundant MIT license
  python3-pyelftools: Update license to Unlicense

Jörg Sommer (1):
  net-tools: Handle binmerge

Niko Mauno (2):
  sbom-cve-check-common: Fatalize command failure
  sbom-cve-check: Fix breakage with empty IMAGE_LINK_NAME

Omkar Patil (1):
  libinput: fix CVE-2026-50292

Peter Marko (1):
  xserver-xorg: set status for CVE-2026-34000 and CVE-2026-34002

Quentin Schulz (1):
  squashfs-tools: add another CPE

Richard Purdie (10):
  licenses: Update with the pull-sdpx-licenses.py script to 3.28.0
  xserver-xorg/xwayland: 'Clarify' xserver license
  xwayland: upgrade 24.1.9 -> 24.1.11
  xserver-xorg/xwayland: Drop X11-swapped from LICENSE
  dropbear: Clarify LICENSE and drop PD
  ppp: Remove PD license
  python3-pycryptodome: Update LICENSE PD -> Unlicense
  glib-2.0-native: Remove problematic path reference
  sstate: Improve confusing debug message
  sstate: Detect broken sstate paths containing tmpdir

Ross Burton (4):
  linux-yocto: remove CVE exclusion list, sbom-cve-check does this
    itself
  matchbox-panel-2: backport patch to set a constant size for the clock
  classes/gtk-icon-cache: fix libdir passed to the postrm intercept
  oeqa/core/runner: stub addDuration in OETestResult

Tushar Darote (1):
  gstreamer1.0-plugins-bad: handle padded buffers in wl_shm buffer
    creation

Yoann Congal (1):
  scripts/install-buildtools: Update to 6.0.1

 meta/classes-global/sstate.bbclass            |     9 +-
 meta/classes-recipe/gtk-icon-cache.bbclass    |     2 +-
 .../python3targetconfig.bbclass               |     1 +
 meta/classes-recipe/sbom-cve-check.bbclass    |     2 +-
 meta/classes/sbom-cve-check-common.bbclass    |     3 +-
 meta/conf/distro/include/maintainers.inc      |     2 +-
 .../common-licenses/ALGLIB-Documentation      |    17 +
 .../Advanced-Cryptics-Dictionary              |    10 +
 meta/files/common-licenses/BOLA-1.1           |    27 +
 meta/files/common-licenses/BSD-3-Clause-Tso   |    11 +
 .../common-licenses/BSD-Mark-Modifications    |    35 +
 meta/files/common-licenses/Buddy              |    26 +
 meta/files/common-licenses/CAPEC-tou          |     7 +
 .../common-licenses/ESA-PL-permissive-2.4     |   240 +
 .../ESA-PL-strong-copyleft-2.4                |   200 +
 .../common-licenses/ESA-PL-weak-copyleft-2.4  |   193 +
 meta/files/common-licenses/HPND-SMC           |    15 +
 .../HPND-sell-variant-critical-systems        |    20 +
 meta/files/common-licenses/ISO-permission     |     4 +
 meta/files/common-licenses/MIT-STK            |    27 +
 meta/files/common-licenses/MMPL-1.0.1         |    87 +
 meta/files/common-licenses/NIST-PD-TNT        |     3 +
 meta/files/common-licenses/OSC-1.0            |    11 +
 meta/files/common-licenses/OSSP               |    26 +
 meta/files/common-licenses/OpenMDW-1.0        |    49 +
 .../common-licenses/ParaType-Free-Font-1.3    |    24 +
 meta/files/common-licenses/SGMLUG-PM          |    43 +
 meta/files/common-licenses/TekHVC             |    34 +
 meta/files/common-licenses/UnRAR              |    41 +
 meta/files/common-licenses/Vixie-Cron         |     4 +
 meta/files/common-licenses/WTFNMFPL           |    17 +
 meta/files/common-licenses/WordNet            |    12 +
 .../common-licenses/X11-no-permit-persons     |    23 +
 meta/files/common-licenses/hyphen-bulgarian   |     8 +
 meta/files/spdx-licenses.json                 |  1758 +-
 meta/lib/oeqa/core/runner.py                  |     4 +
 ...mobile-broadband-provider-info_20251101.bb |     2 +-
 meta/recipes-connectivity/ppp/ppp_2.5.2.bb    |     2 +-
 .../recipes-core/dropbear/dropbear_2025.89.bb |     3 +-
 .../gettext/gettext-minimal-native_1.0.bb     |     2 +-
 meta/recipes-core/glib-2.0/glib.inc           |     4 +-
 .../recipes-core/udev/udev-extraconf/mount.sh |     2 +-
 .../binutils/binutils-2.46.inc                |     6 +-
 .../gcc/{gcc-15.2.inc => gcc-15.3.inc}        |    11 +-
 ...ian_15.2.bb => gcc-cross-canadian_15.3.bb} |     0
 .../{gcc-cross_15.2.bb => gcc-cross_15.3.bb}  |     0
 ...-crosssdk_15.2.bb => gcc-crosssdk_15.3.bb} |     0
 ...cc-runtime_15.2.bb => gcc-runtime_15.3.bb} |     0
 ...itizers_15.2.bb => gcc-sanitizers_15.3.bb} |     0
 ...{gcc-source_15.2.bb => gcc-source_15.3.bb} |     0
 .../gcc/gcc/0026-fix-pr90579-testcases.patch  |    40 -
 .../gcc/gcc/0027-gcc15-pr122394.patch         |    88 -
 ...dy-Make-it-buildable-by-C-11-to-C-26.patch |   257 -
 .../gcc/{gcc_15.2.bb => gcc_15.3.bb}          |     0
 ...initial_15.2.bb => libgcc-initial_15.3.bb} |     0
 .../gcc/{libgcc_15.2.bb => libgcc_15.3.bb}    |     0
 ...ibgfortran_15.2.bb => libgfortran_15.3.bb} |     0
 .../python/python-pycryptodome.inc            |     2 +-
 .../python/python3-pyelftools_0.32.bb         |     2 +-
 .../rust/rust-cross-canadian.inc              |     1 +
 .../squashfs-tools/squashfs-tools_4.7.5.bb    |     2 +-
 .../net-tools/net-tools_2.10.bb               |     2 +-
 .../ttf-fonts/ttf-bitstream-vera_1.10.bb      |     2 +-
 .../wayland/libinput/CVE-2026-50292.patch     |    79 +
 .../wayland/libinput_1.30.2.bb                |     1 +
 .../xorg-lib/pixman_0.46.4.bb                 |     2 +-
 .../xorg-util/util-macros_1.20.2.bb           |     2 +-
 .../xorg-xserver/xserver-xorg.inc             |     4 +-
 ...xwayland_24.1.9.bb => xwayland_24.1.11.bb} |     6 +-
 .../linux/cve-exclusion_6.18.inc              | 21714 ----------------
 .../linux/generate-cve-exclusions.py          |   156 -
 meta/recipes-kernel/linux/linux-yocto_6.18.bb |     1 -
 meta/recipes-kernel/perf/perf.bb              |     6 +
 ...added-buffers-in-wl_shm-buffer-creat.patch |   238 +
 .../gstreamer1.0-plugins-bad_1.28.2.bb        |     1 +
 ...-clock-fix-clock-widget-width-resize.patch |    51 +
 ...ts-systray-Allow-icons-to-be-smaller.patch |     2 +-
 .../matchbox-panel-2/matchbox-panel-2_2.12.bb |     1 +
 meta/recipes-support/sqlite/sqlite3_3.51.3.bb |     2 +-
 scripts/install-buildtools                    |     4 +-
 80 files changed, 2694 insertions(+), 22999 deletions(-)
 create mode 100644 meta/files/common-licenses/ALGLIB-Documentation
 create mode 100644 meta/files/common-licenses/Advanced-Cryptics-Dictionary
 create mode 100644 meta/files/common-licenses/BOLA-1.1
 create mode 100644 meta/files/common-licenses/BSD-3-Clause-Tso
 create mode 100644 meta/files/common-licenses/BSD-Mark-Modifications
 create mode 100644 meta/files/common-licenses/Buddy
 create mode 100644 meta/files/common-licenses/CAPEC-tou
 create mode 100644 meta/files/common-licenses/ESA-PL-permissive-2.4
 create mode 100644 meta/files/common-licenses/ESA-PL-strong-copyleft-2.4
 create mode 100644 meta/files/common-licenses/ESA-PL-weak-copyleft-2.4
 create mode 100644 meta/files/common-licenses/HPND-SMC
 create mode 100644 meta/files/common-licenses/HPND-sell-variant-critical-systems
 create mode 100644 meta/files/common-licenses/ISO-permission
 create mode 100644 meta/files/common-licenses/MIT-STK
 create mode 100644 meta/files/common-licenses/MMPL-1.0.1
 create mode 100644 meta/files/common-licenses/NIST-PD-TNT
 create mode 100644 meta/files/common-licenses/OSC-1.0
 create mode 100644 meta/files/common-licenses/OSSP
 create mode 100644 meta/files/common-licenses/OpenMDW-1.0
 create mode 100644 meta/files/common-licenses/ParaType-Free-Font-1.3
 create mode 100644 meta/files/common-licenses/SGMLUG-PM
 create mode 100644 meta/files/common-licenses/TekHVC
 create mode 100644 meta/files/common-licenses/UnRAR
 create mode 100644 meta/files/common-licenses/Vixie-Cron
 create mode 100644 meta/files/common-licenses/WTFNMFPL
 create mode 100644 meta/files/common-licenses/WordNet
 create mode 100644 meta/files/common-licenses/X11-no-permit-persons
 create mode 100644 meta/files/common-licenses/hyphen-bulgarian
 rename meta/recipes-devtools/gcc/{gcc-15.2.inc => gcc-15.3.inc} (92%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_15.2.bb => gcc-cross-canadian_15.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_15.2.bb => gcc-cross_15.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_15.2.bb => gcc-crosssdk_15.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_15.2.bb => gcc-runtime_15.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_15.2.bb => gcc-sanitizers_15.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_15.2.bb => gcc-source_15.3.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0027-gcc15-pr122394.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch
 rename meta/recipes-devtools/gcc/{gcc_15.2.bb => gcc_15.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_15.2.bb => libgcc-initial_15.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_15.2.bb => libgcc_15.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_15.2.bb => libgfortran_15.3.bb} (100%)
 create mode 100644 meta/recipes-graphics/wayland/libinput/CVE-2026-50292.patch
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.9.bb => xwayland_24.1.11.bb} (84%)
 delete mode 100644 meta/recipes-kernel/linux/cve-exclusion_6.18.inc
 delete mode 100755 meta/recipes-kernel/linux/generate-cve-exclusions.py
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch
 create mode 100644 meta/recipes-sato/matchbox-panel-2/files/0001-applets-clock-fix-clock-widget-width-resize.patch


