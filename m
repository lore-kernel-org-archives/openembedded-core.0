Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D13C9832A
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 22:58:30 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10078.1790377105653615981
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2026 15:58:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LrQuWG3z;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so8043455e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 15:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790377104; x=1790981904; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hRoTF8ndEil3nw2UsgqgPi/t8dHrhhs8lRXhJ+hEKzM=;
        b=LrQuWG3zGZzLfz2207dqN73/rOvtK0CxoVQw6KNHAzc2zLgG6TTi0CTtkEROjCS5JO
         foVHR+8RzvjPXLo1iYvlJxC45ZKmFKQdM1kgLW06MaJHBs+AEirzUwj8GvjrjnNPjM/y
         vZSen3eq7LqT6xqrQWfpF/Te46PHT6QfpQBPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790377104; x=1790981904;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hRoTF8ndEil3nw2UsgqgPi/t8dHrhhs8lRXhJ+hEKzM=;
        b=P46b1t8Vg8U6PrL+Y2NR89Bjk4kYtXciFA+cUVoXnBXhxo2U8c4nf0q2hH7NyYCiVb
         GcnKxhVVm6s7R48Hf3q3uihzNP/uSCf/Dc1b1FuXHxAPgw6RVwW8FVTb5QkAVy/Adtav
         CTQX19XjzY8/1lvUi+ljWwxbGC1nnXhwXCK0o8f223bmz38dlFXyFO6Bmv1VeIXtK3MT
         UbYns0ZMNZVCdx5SI+8k4WxbXOFfhvi+fb98DI3qCrDtfilvmQ8uXzBRPuop9lRrVKoR
         XaOoSXF/xEa+Ysm90vRlKZwa07ezujhmHCf4l+4QI765U79+psZAJdziglz1VPrTZqeI
         NuXg==
X-Gm-Message-State: AFuF++lbxe7YlcwmKHOXcFJg1d6zjMJKCxe3AjfZqGzcH6zvgWBPSBZQ
	Jh96lHXr8hQ6uEwE+XsiXD5JvDfx0u7vicg89LcAlxI3Q3urSzCC+m6SpWAqLVdyPsCek8HW/uZ
	/kTnmWSc=
X-Gm-Gg: AYBFou2MqXZFaKv5WnQ0mnZC8xIR02WZkixykzmXPkDDafxfGUdC7Xwj4/bnx/JSrzZ
	ArjDw2V/DKKp8Iuyejfr0c5KLTMQfZCupVSsfkJ6yIJNS5a/D7XOYkH5NvfLAbuiOzQYxg5bhfN
	8FSp3j3/WXySe5gTOohP+wOfpD/phgGR18mS/Lh0n9A04BXJOXVz3h0Ytgidyw9pF/xMtjvcx2G
	sldQvjs8Zg4EffX+j9xBie3/AbIxvRCaY7srrgtEBW1lfscTlPxmuFAHjV2jZiG2JS0cD8lwQmN
	YfY0HUwJV1Sv8txo3rL/Tvfc3G0ZM3aU14uAWgNbVDEyA6FDATOe1ys6izUQufvTsAsABpO0sC8
	5cxbD1RO4IRLxgXY6ktAZWLuGkpkQGHmx1KWHOcCSlOz4fXFFq/CzUIjOrBs00OD9sPNKIuwCja
	fVv9nGmSlMb8vP8+1PbCOVmE16e/W7TfFFBiVEkqC67XD3Mxp4qrwztvyf/Y7NFwoGnymiT9EkQ
	Z2weIYw+D1aL0ABhgKCWH5+7E0SkLFhPkgBND1eoJfPL9Hl96CefJrsfa/SxaRL0rXNfAbN5w==
X-Received: by 2002:a05:600c:468c:b0:49f:bcce:13f5 with SMTP id 5b1f17b1804b1-49fe66f5020mr120642155e9.24.1790377103695;
        Fri, 25 Sep 2026 15:58:23 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd4c8dsm200947705e9.3.2026.09.25.15.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 15:58:23 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 00/47] Pull request (cover letter only)
Date: Sat, 26 Sep 2026 00:58:09 +0200
Message-ID: <cover.1790376711.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 22:58:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246627

Those are the patches from the last patch review:
https://lore.kernel.org/all/cover.1790154074.git.yoann.congal@smile.fr/
Changes:
* removed "curl: Security Fix for CVE-2026-18924" following Martin's
  review: https://lore.kernel.org/all/CA+chaQdq4NaDUJN7Zuxnmdv6EH0=z2Ru6HEXqTqk3jR0ei0W9g@mail.gmail.com/
  Thanks!

Passed a-full on autobuilder (before removing the patch):
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4792
oe-selftest-fedora failed with 16206 – [scarthgap] AB-INT: runtime_test.SystemTap.test_crosstap_* failures
retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/48/builds/4720
Note: The patch is isolated and the risk of its removal breaking
something is very low.

The following changes since commit 04f18f976b3809e195433b6b31a6121014bdc37c:

  u-boot, u-boot-tools: Fix CVE-2026-46728 (2026-09-17 16:32:11 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-next

for you to fetch changes up to 07ca97baad7b182849ee50f0bd629b68dc9f53b3:

  time64: enable 64-bit time/file-offset flags for 32-bit nativesdk (2026-09-24 08:54:34 +0200)

----------------------------------------------------------------

Adarsh Jagadish Kamini (1):
  gnutls: fix CVE-2026-33845

Daniel Turull (1):
  improve_kernel_cve_report: validate that cve details field exists

Darsh Kelaiya (1):
  python3-git: fix CVE-2026-42215

Devansh Patel (3):
  python3-mako: correct CVE_PRODUCT mapping
  curl: set CVE_STATUS for CVE-2026-8458
  vim: Fix CVE-2026-52858 regression

Hemanth Kumar M D (1):
  gcc: Upgrade to GCC 13.5

Hetvi Thakar (4):
  python3-pip: set CVE_STATUS for CVE-2018-20225
  python3-ply: set status for CVE-2025-56005
  python3-pip: Fix CVE-2026-13346
  wget: Fix CVE-2026-58470

Hiago De Franco (1):
  improve_kernel_cve_report: fix backported-patch check

Hitendra Prajapati (5):
  vim: Fix for CVE-2026-73072
  vim: Fix for CVE-2026-73073
  vim: Fix for CVE-2026-73074
  vim: Fix for CVE-2026-73077
  vim: Fix for CVE-2026-73078

Jaipaul Cheernam (2):
  ca-certificates: upgrade 20260601 -> 20260816
  perl: Fix CVE-2026-19487

Jakub Szczudlo (Nokia) (1):
  gnutls: fix CVE-2026-5419

Kyungjik Min (1):
  rootfs.py: fix run-postinsts removal on multilib images

Peter Marko (5):
  cpio: patch CVE-2026-66485
  cpio: patch CVE-2026-66484
  golang: fix homepage
  python3-certifi: fix homepage
  libslirp: patch CVE-2026-9539

Peter Tatrai (2):
  testimage: avoid symlinking missing qemu boot log
  time64: enable 64-bit time/file-offset flags for 32-bit nativesdk

Richard Purdie (5):
  wireless-regdb: upgrade 2026.05.30 -> 2026.09.03
  ptest-runner: Upgrade 2.5.0 -> 2.5.1
  pseudo: Add in openat2, exec and linkat fixes
  pseudo: Update to 1.9.10
  pseudo: 1.9.10 -> 1.9.11

Siddharth Doshi (2):
  curl: Security Fix for CVE-2026-13608
  curl: set CVE_STATUS for CVE-2026-82209

Stefano Tondo (1):
  spdx30_tasks: Fix SPDX_CUSTOM_ANNOTATION_VARS implementation

Vijay Anusuri (7):
  kbd: Fix CVE-2026-72693
  libxfont: Fix CVE-2026-56001
  libxfont: Fix CVE-2026-56002
  libxfont: Fix CVE-2026-56003
  python3-cryptography: Fix CVE-2026-34073
  python3-cryptography: Fix CVE-2026-69248
  python3-cryptography: Fix CVE-2026-69249

Wang Mingyu (1):
  ptest-runner: upgrade 2.4.5 -> 2.4.5.1

Yoann Congal (3):
  scripts/install-buildtools: Update to 5.0.20
  python3: skip ptest incompatible with ptest-runner >= 2.5.0
  ptest-runner: Upgrade 2.4.5.1 -> 2.5.0

 meta/classes-recipe/testimage.bbclass         |   5 +-
 meta/conf/distro/include/maintainers.inc      |   2 +-
 meta/conf/distro/include/time64.inc           |  17 +
 meta/lib/oe/rootfs.py                         |   3 +-
 meta/lib/oe/spdx30_tasks.py                   |   4 +-
 meta/lib/oeqa/selftest/cases/spdx.py          |  74 ++++
 .../slirp/libslirp/CVE-2026-9539.patch        | 122 ++++++
 .../slirp/libslirp_git.bb                     |   5 +-
 .../recipes-core/kbd/kbd/CVE-2026-72693.patch | 155 ++++++++
 meta/recipes-core/kbd/kbd_2.6.4.bb            |   1 +
 .../gcc/{gcc-13.4.inc => gcc-13.5.inc}        |   9 +-
 ...ian_13.4.bb => gcc-cross-canadian_13.5.bb} |   0
 .../{gcc-cross_13.4.bb => gcc-cross_13.5.bb}  |   0
 ...-crosssdk_13.4.bb => gcc-crosssdk_13.5.bb} |   0
 ...cc-runtime_13.4.bb => gcc-runtime_13.5.bb} |   0
 ...itizers_13.4.bb => gcc-sanitizers_13.5.bb} |   0
 ...{gcc-source_13.4.bb => gcc-source_13.5.bb} |   0
 ...dy-Make-it-buildable-by-C-11-to-C-26.patch | 257 -------------
 ...build-Remove-INCLUDE_MEMORY-PR117737.patch |  46 ---
 ...am-include-above-safe-ctype.h-PR1177.patch |  54 ---
 .../gcc/{gcc_13.4.bb => gcc_13.5.bb}          |   0
 ...initial_13.4.bb => libgcc-initial_13.5.bb} |   0
 .../gcc/{libgcc_13.4.bb => libgcc_13.5.bb}    |   0
 ...ibgfortran_13.4.bb => libgfortran_13.5.bb} |   0
 .../go/go-binary-native_1.22.12.bb            |   2 +-
 meta/recipes-devtools/go/go-common.inc        |   2 +-
 .../perl/files/CVE-2026-19487.patch           |  66 ++++
 meta/recipes-devtools/perl/perl_5.38.4.bb     |   1 +
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   4 +-
 .../python/python3-certifi_2024.2.2.bb        |   2 +-
 .../python3-cryptography/CVE-2026-34073.patch | 167 +++++++++
 .../python3-cryptography/CVE-2026-69248.patch | 299 +++++++++++++++
 .../python3-cryptography/CVE-2026-69249.patch | 354 ++++++++++++++++++
 .../python/python3-cryptography_42.0.5.bb     |   3 +
 .../python3-git/CVE-2026-42215_p1.patch       |  61 +++
 .../python3-git/CVE-2026-42215_p2.patch       |  47 +++
 .../python/python3-git_3.1.42.bb              |   2 +
 .../python/python3-mako_1.3.2.bb              |   2 +
 .../python/python3-pip/CVE-2026-13346.patch   | 223 +++++++++++
 .../python/python3-pip_24.0.bb                |   2 +
 .../python/python3-ply_3.11.bb                |   1 +
 .../python/python3_3.12.14.bb                 |   6 +
 meta/recipes-extended/cpio/cpio_2.15.bb       |   2 +
 .../cpio/files/CVE-2026-66484.patch           |  28 ++
 .../cpio/files/CVE-2026-66485.patch           | 210 +++++++++++
 .../wget/wget/CVE-2026-58470-regression.patch |  48 +++
 .../wget/wget/CVE-2026-58470.patch            |  79 ++++
 meta/recipes-extended/wget/wget_1.21.4.bb     |   2 +
 .../xorg-lib/libxfont/CVE-2026-56001.patch    |  87 +++++
 .../xorg-lib/libxfont/CVE-2026-56002.patch    | 150 ++++++++
 .../xorg-lib/libxfont/CVE-2026-56003.patch    | 114 ++++++
 .../xorg-lib/libxfont_1.5.4.bb                |   5 +
 ....05.30.bb => wireless-regdb_2026.09.03.bb} |   2 +-
 ...ertdata2pem.py-print-a-warning-for-e.patch |   6 +-
 ...icates-don-t-use-Debianisms-in-run-p.patch |   2 +-
 ...icates-use-relative-symlinks-from-ET.patch |   2 +-
 ...0260601.bb => ca-certificates_20260816.bb} |   2 +-
 .../curl/curl/CVE-2026-13608.patch            |  48 +++
 meta/recipes-support/curl/curl_8.7.1.bb       |   4 +-
 .../gnutls/gnutls/CVE-2026-33845.patch        | 190 ++++++++++
 .../gnutls/gnutls/CVE-2026-5419.patch         | 247 ++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |   2 +
 ...-runner_2.4.5.bb => ptest-runner_2.5.1.bb} |   3 +-
 .../vim/files/CVE-2026-52858-regression.patch |  94 +++++
 .../vim/files/CVE-2026-73072.patch            |  64 ++++
 .../vim/files/CVE-2026-73073.patch            |  89 +++++
 .../vim/files/CVE-2026-73074.patch            | 101 +++++
 .../vim/files/CVE-2026-73077.patch            |  96 +++++
 .../vim/files/CVE-2026-73078.patch            |  94 +++++
 meta/recipes-support/vim/vim.inc              |   6 +
 scripts/contrib/improve_kernel_cve_report.py  |   4 +-
 scripts/install-buildtools                    |   4 +-
 72 files changed, 3394 insertions(+), 389 deletions(-)
 create mode 100644 meta/recipes-connectivity/slirp/libslirp/CVE-2026-9539.patch
 create mode 100644 meta/recipes-core/kbd/kbd/CVE-2026-72693.patch
 rename meta/recipes-devtools/gcc/{gcc-13.4.inc => gcc-13.5.inc} (93%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_13.4.bb => gcc-cross-canadian_13.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_13.4.bb => gcc-cross_13.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_13.4.bb => gcc-crosssdk_13.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_13.4.bb => gcc-runtime_13.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_13.4.bb => gcc-sanitizers_13.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_13.4.bb => gcc-source_13.5.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0029-build-Remove-INCLUDE_MEMORY-PR117737.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0030-build-Move-sstream-include-above-safe-ctype.h-PR1177.patch
 rename meta/recipes-devtools/gcc/{gcc_13.4.bb => gcc_13.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_13.4.bb => libgcc-initial_13.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_13.4.bb => libgcc_13.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_13.4.bb => libgfortran_13.5.bb} (100%)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-19487.patch
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/CVE-2026-34073.patch
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/CVE-2026-69248.patch
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/CVE-2026-69249.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-42215_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-42215_p2.patch
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-13346.patch
 create mode 100644 meta/recipes-extended/cpio/files/CVE-2026-66484.patch
 create mode 100644 meta/recipes-extended/cpio/files/CVE-2026-66485.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58470-regression.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58470.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56001.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56002.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56003.patch
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2026.05.30.bb => wireless-regdb_2026.09.03.bb} (94%)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20260601.bb => ca-certificates_20260816.bb} (97%)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-13608.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-33845.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-5419.patch
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.4.5.bb => ptest-runner_2.5.1.bb} (94%)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-52858-regression.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73072.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73073.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73074.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73077.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73078.patch


