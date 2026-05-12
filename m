Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A42C4CD4855
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 09:11:33 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71572.1778577083773239953
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 02:11:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2m+j7AqP;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso46011645e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 02:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778577082; x=1779181882; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=suAfkyJnSjoZ4C6M6rEfHXNXLk0nM2wMbCgGqGp5yhY=;
        b=2m+j7AqPNMlXJvuhVrx9GFtDJrNfZvWypzVNe3+ayUePajoYe7G51U+6xe2XkV0Mja
         y9GTXD27DEPQgk4heWeiUvewEx4MapOOGT+Wr1uRMmQ9ZjGH9akScu04Udk6zXdkK4Kx
         KNa67nngaq1jQWknLQi9suZqYL1XL3uFDsOJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778577082; x=1779181882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=suAfkyJnSjoZ4C6M6rEfHXNXLk0nM2wMbCgGqGp5yhY=;
        b=V+ERFitcaskLqKAEY/iK3IwduiqaiYL7NZBh2dP0XcsrxpEvvJWJ/IGXPI6uXJeu3K
         4ZmDjN7kvCvYTab23g/LEzLtRhWOXWfWqo78PG+XB3Gfr6jvk9DFVzupJkS1bXPNa3Rc
         kTl7FP1/8dLRbJ1QCJTFIYq163aQZsTP40xsPwFjlyXaY08oBWzafJjm3P4+ZcYTPlmC
         INdHUU95D5bnqd+daLMEpjxo8QTpbRVQjcmTJq24vvqLfBh8Kil3LPJU+ffHx466sikk
         KcVzoOg2N175AXuSQ65qtasYJbjOa6xrzGyQcFhAS0NY8V/u3MNg6WC7Il23xIARYuJy
         BW9g==
X-Gm-Message-State: AOJu0Ywp87lf0/ESSKgT5RlllJ5VM2+5Sp/OPngi1a6nk4tdXNnXNLON
	z6IUeyS9Hd8WK1f6eGHl3rn6MkJg1ZqxC7aOSWRGp4CEl41rlGMypOb+vuWps7bPRVBSSa6xSOa
	1pvXXV3A=
X-Gm-Gg: Acq92OFNkyfuLDJ+4U8i6V+k96mp0tfRor7smrNXX7vpw95NAR8Sp3W28kOoVXpsmv3
	IFHOSiX7aUMKw5iokRMqlapASJGW9S03QBvmV44WLTApoVq1/n3HIhU4xTyYO87j2x0y22EhPde
	97jo7wX42wywxA4EEnhJ8zHoE3e3dsKJAPbg8DoT9MloRjYzB2UDzqlTVUHqVBKPFj1AcUllRxO
	VogY0QAogmxegHliLP2BwUFa5y3EAu6isXfggHk7E9H07GhFqa7Vc/hg3ooEYa3zeaTgnrbIGwJ
	GecMCcTa5yydFXT2Wi9UHEH9VARwMR4Gnb5opHAyIF9xX+n2QwoXcmMB6594dMy++BkX3DaFjM3
	t3g28c8vyBJFvtFLb+56cAp8LrCDxXF9K1zvQoR5oJBsra/z4+Dqzv7bzH/1ZUoqopnYZa6q4K/
	6/SjUsIdYTKGRsMIZGpuf7lKQ0FBKAYXkbEhqz8/RZlnX4XJ7t19fdhnT9Te5ixpitjaO1Odkt2
	Jdt1qKDWXAHn3qeRmKbs3AeJew=
X-Received: by 2002:a05:600c:46ca:b0:486:fa35:aef2 with SMTP id 5b1f17b1804b1-48e70687eb6mr214160445e9.4.1778577081818;
        Tue, 12 May 2026 02:11:21 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e908d890fsm30547005e9.15.2026.05.12.02.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 02:11:21 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][wrynose 00/52] Pull request (cover letter only)
Date: Tue, 12 May 2026 11:11:17 +0200
Message-ID: <cover.1778576964.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 09:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236870

Those are the patches from the last patch review:
https://lore.kernel.org/openembedded-core/cover.1778198557.git.yoann.congal@smile.fr/T/#t

Passed a-full on autobuilder with 3 AB-INT issues:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3795
* qemuarm-tc: 15698 – AB-INT: runqemu.QemuTest.test_qemu_can_shutdown hangs with "Data received serial thread"
  Retried in https://autobuilder.yoctoproject.org/valkyrie/#/builders/42/builds/3689
* qemuriscv64-ptest: https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1562
  This is a ptest failure in procps: 'pgrep_match_against_full_process_name'
  This particular ptest later passed in https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1564
  (I have yet to properly report this one)
* qemuarmv5: 16217 – AB-INT: boot hang in qemu (amba chip errors?)
  Retried in https://autobuilder.yoctoproject.org/valkyrie/#/builders/80/builds/3559

The following changes since commit 42fa856a00ac16b2a7a83d7ecfa60a5be192b16c:

  build-appliance-image: Update to master head revisions (2026-04-23 21:44:21 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-next

for you to fetch changes up to 833809129ca29ea168f68c98468a2c70182a4d66:

  glibc: Fix recipe bug that disabled stack protector (2026-05-08 02:01:48 +0200)

----------------------------------------------------------------

Antonin Godard (1):
  mirrors: remove inactive sources.openembedded.org URLs

Bin Cao (1):
  scripts/cve-json-to-text.py: simplify getopt argument parsing

Himanshu Jadon (2):
  apr: Add CVE_PRODUCT to support product name
  apr-util: Add CVE_PRODUCT to support product name

Ivan Nestlerode (1):
  glibc: Fix recipe bug that disabled stack protector

Leonardo Costa (1):
  bluez5: add patches to fix 8.56 cli issues

Li Wang (1):
  perf: add PACKAGECONFIG for llvm

Moritz Haase (1):
  devtool: Disable gpg signing when setting up source tree repos

Peter Marko (26):
  shadow: set CVE_PRODUCT
  ruby: set status for CVE-2025-0306
  python3-setuptools: set status for CVE-2024-6345
  p11-kit: set status for CVE-2026-2100
  libva: set status for CVE-2023-39929
  harfbuzz: set status for CVE-2024-56732
  gnutls: set status for CVE-2026-1584
  cve-extra-exclusions: ignore CVE-2019-2708
  bind: set status for CVE-2017-3139
  base-files: set status for CVE-2018-6557
  rsync: set status for CVE-2024-12084
  python3-requests: set status for CVE-2024-35195
  python3-requests: set status for CVE-2024-47081
  git: set status of 5 CVEs
  cargo: set status of CVE-2023-40030
  cargo: set CVE_PRODUCT
  ovmf: set status for 7 CVEs
  sed: upgrade 4.9 -> 4.10
  ffmpeg: set status for 4 CVEs
  coreutils: set CVE_PRODUCT
  libsoup: set status for CVE-2026-2436
  libsoup: patch CVE-2026-5119
  sudo: set CVE_PRODUCT
  libarchive: set status for CVE-2026-4426
  sudo: patch CVE-2026-35535
  inetutils: patch CVE-2026-32772

Peter Tatrai (1):
  rust: fix codegen test failure on big-endian targets

Richard Purdie (1):
  pseudo: Update 1.9.5 -> 1.9.6

Ross Burton (6):
  classes/base: add explicit bzip2-native dependency for unpacking .bz2
  wpa-supplicant: remove obsolete explicit debug packaging
  python3-cryptography: remove obsolete explicit debug packaging
  gobject-introspection: remove obsolete explicit debug packaging
  kernel-devsrc: remove obsolete explicit debug packaging
  dhcpcd: remove obsolete explicit debug packaging

Sam Kent (1):
  package.py: fix kernel module file pre-filter and document strip
    asymmetry

Trevor Gamblin (1):
  python3-urllib3: enable setuptools-scm 10.x

Vijay Anusuri (1):
  avahi: Fix CVE-2026-34933

Wang Mingyu (7):
  ccache: upgrade 4.13.2 -> 4.13.3
  dhcpcd: upgrade 10.3.0 -> 10.3.1
  groff: upgrade 1.24.0 -> 1.24.1
  gsettings-desktop-schemas: upgrade 50.0 -> 50.1
  gtk+3: upgrade 3.24.51 -> 3.24.52
  gtk4: upgrade 4.22.1 -> 4.22.2
  hwdata: upgrade 0.405 -> 0.406

 meta/classes-global/base.bbclass              |   4 +
 meta/classes-global/mirrors.bbclass           |   7 -
 .../distro/include/cve-extra-exclusions.inc   |   2 +-
 meta/lib/oe/package.py                        |   5 +-
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   2 +
 .../avahi/files/CVE-2026-34933-1.patch        | 108 +++++++++++++
 .../avahi/files/CVE-2026-34933-2.patch        |  96 ++++++++++++
 .../recipes-connectivity/bind/bind_9.20.22.bb |   2 +
 meta/recipes-connectivity/bluez5/bluez5.inc   |   2 +
 ...ell-Don-t-init-input-for-non-interac.patch |  42 +++++
 ...d-broken-stdin-handling-in-home-made.patch |  36 +++++
 .../{dhcpcd_10.3.0.bb => dhcpcd_10.3.1.bb}    |   4 +-
 .../inetutils/inetutils/CVE-2026-32772.patch  | 138 ++++++++++++++++
 .../inetutils/inetutils_2.7.bb                |   1 +
 .../wpa-supplicant/wpa-supplicant_2.11.bb     |   7 -
 .../base-files/base-files_3.0.14.bb           |   2 +
 meta/recipes-core/coreutils/coreutils_9.10.bb |   2 +
 meta/recipes-core/glibc/glibc.inc             |   3 -
 meta/recipes-core/ovmf/ovmf_git.bb            |   7 +
 .../{ccache_4.13.2.bb => ccache_4.13.3.bb}    |   2 +-
 meta/recipes-devtools/git/git_2.53.0.bb       |   6 +
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   4 +-
 .../python/python3-cryptography.bb            |   4 -
 .../python/python3-requests_2.32.5.bb         |   3 +
 .../python/python3-setuptools_82.0.1.bb       |   2 +
 ...ml-remove-setuptools-scm-upper-limit.patch |  30 ++++
 .../python/python3-urllib3_2.6.3.bb           |   4 +
 meta/recipes-devtools/rsync/rsync_3.4.1.bb    |   2 +
 meta/recipes-devtools/ruby/ruby_4.0.2.bb      |   2 +
 meta/recipes-devtools/rust/cargo_1.94.1.bb    |   4 +
 ...ion-or-permutations-test-for-big-end.patch | 121 ++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |   1 +
 .../{groff_1.24.0.bb => groff_1.24.1.bb}      |   2 +-
 .../libarchive/libarchive_3.8.7.bb            |   1 +
 .../sed/{sed_4.9.bb => sed_4.10.bb}           |   4 +-
 meta/recipes-extended/shadow/shadow_4.19.4.bb |   2 +
 .../sudo/files/CVE-2026-35535.patch           | 147 ++++++++++++++++++
 meta/recipes-extended/sudo/sudo_1.9.17p2.bb   |   3 +
 .../gobject-introspection_1.86.0.bb           |   1 -
 ...0.bb => gsettings-desktop-schemas_50.1.bb} |   2 +-
 .../{gtk+3_3.24.51.bb => gtk+3_3.24.52.bb}    |   2 +-
 .../gtk+/{gtk4_4.22.1.bb => gtk4_4.22.2.bb}   |   2 +-
 .../harfbuzz/harfbuzz_12.3.2.bb               |   2 +
 meta/recipes-graphics/libva/libva_2.23.0.bb   |   2 +
 meta/recipes-kernel/linux/kernel-devsrc.bb    |   1 -
 meta/recipes-kernel/perf/perf.bb              |   1 +
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb |   4 +
 meta/recipes-support/apr/apr-util_1.6.3.bb    |   3 +
 meta/recipes-support/apr/apr_1.7.6.bb         |   3 +
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   1 +
 .../{hwdata_0.405.bb => hwdata_0.406.bb}      |   2 +-
 .../libsoup/libsoup/CVE-2026-5119.patch       | 122 +++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.6.6.bb |   2 +
 .../recipes-support/p11-kit/p11-kit_0.26.2.bb |   2 +
 scripts/cve-json-to-text.py                   |   4 +-
 scripts/lib/devtool/__init__.py               |   2 +-
 56 files changed, 929 insertions(+), 43 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2026-34933-1.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2026-34933-2.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-Revert-shared-shell-Don-t-init-input-for-non-interac.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-tools-Work-around-broken-stdin-handling-in-home-made.patch
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.3.0.bb => dhcpcd_10.3.1.bb} (95%)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32772.patch
 rename meta/recipes-devtools/ccache/{ccache_4.13.2.bb => ccache_4.13.3.bb} (93%)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/0001-pyproject.toml-remove-setuptools-scm-upper-limit.patch
 create mode 100644 meta/recipes-devtools/rust/files/0001-Fix-multiple-option-or-permutations-test-for-big-end.patch
 rename meta/recipes-extended/groff/{groff_1.24.0.bb => groff_1.24.1.bb} (97%)
 rename meta/recipes-extended/sed/{sed_4.9.bb => sed_4.10.bb} (95%)
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2026-35535.patch
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_50.0.bb => gsettings-desktop-schemas_50.1.bb} (84%)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.51.bb => gtk+3_3.24.52.bb} (98%)
 rename meta/recipes-gnome/gtk+/{gtk4_4.22.1.bb => gtk4_4.22.2.bb} (97%)
 rename meta/recipes-support/hwdata/{hwdata_0.405.bb => hwdata_0.406.bb} (93%)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2026-5119.patch


