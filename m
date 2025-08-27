Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B471CA0FED
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 21:29:59 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.6622.1756330189657844768
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 14:29:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DY0XAWcF;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b4c5467617dso335853a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 14:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756330189; x=1756934989; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=EY43jGH6xDAN0IyTgevSfhzWHbB6QScc1DIBgPf9ma4=;
        b=DY0XAWcFF4JvHdfPic4mhW+KEeYl5dNBDwfdkYrr7OSdAZT46U6aWvRNYuUEp0RreB
         XHaYzdyQ2rsig1rewK6blR6YNK/575XtAayB2JGKtgRnMdGuA2Pz/XXsJZ8qQcwijGxd
         yBnQfxXuOaYUTFRk3I880zxRm56FLblbg6k0tKDlcchBxlZb/OekWMah+brHVz3Fn1Rn
         9eL6FdtyPfjsG1hXOOt24hplVxtUEp50X7N7v11E9lkP8VtOpAsoUXofVehzkJSAajtl
         52hol9VV7uISNQYw5qJNMaxi2LlK0PjyM6KsZjoGaDs9AKI1NUyUnvI+Sd7s6YyKP2Rm
         dPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756330189; x=1756934989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EY43jGH6xDAN0IyTgevSfhzWHbB6QScc1DIBgPf9ma4=;
        b=cwkEQblcstudD6nRzofTu6eBgYS8Yj2LVQeaSuBMr7/7vtUH2ESR7Ku3ppJ9vPuYi3
         K4eV6jV2qDkJgIz64lr9s0pQH48aWsUXtMLaHIH9XMMcY995osc5gL4SUeUPrOxS7Gvg
         HeTEFw6eU4lqUTB4Byp7V7/no0KtWoVkoVoAeYk+MkhxbjBd/ezN+lDkIF7Svf/oGP9Y
         I7cjNQuCRPZTXsvcB1IdkOLj71tcEET8QOe+PjDYzaBneC68XQ10JbYc6opj28QDkcMi
         FlaYE8GYMII8kylIkiEBg5th6vpiDR0Hmxsg1NYEFfLS7WWjKFeUeTf5RU+mBHVSGK/Q
         705Q==
X-Gm-Message-State: AOJu0Yw+0gVjSnYE83W8kKbF7im3/kiduInVYvEJ5pbunZ4FgJYWWS3Z
	PXhGq3kFW7nJUCs8PXcm+wRv3Bm0eOmr+B+V8fH7bMDjWflt2ZZKNSvFZXi6i24VeHHiDIrt8IB
	lYlDn
X-Gm-Gg: ASbGncse5kUhcMBPxwmEnhE8FDUCPAug3zKQ9uDk0dvTQ0PkQJGp+QL1+cpqbT7n4bv
	F1em9CDm2m80ICbprKh92vKXOuf7hwqDObgyKLY9KkDYJy0z1O3kSHISN4jk8FLr1QIc1LzOMa6
	/TMzyjaZdmmimkR9q5YJQa4bUCvmmj9fvwqRIWrnWtkf3U0YD7VEbkJzaHtcaF0elX7v70cIMJ2
	2vjwMISRGUbBpSIymeLRqcUmYK2ITNdI3ps7Evdf9jThzl6CatlZIT/deSOshHuKA7nqQo9qOmW
	C+XT+GkZUaixiEtnM/N3nZFZmwjQ2qNaQMyQALChoEk8h2Mcgsb0QaTOL8RjniBPBjm0KB3ovgE
	opu5bugIF6GpHkol6nlTmQSSo
X-Google-Smtp-Source: AGHT+IFB3ueOGur75gPGtYw5+XgIx4JwjpC/K0LkCI/nHg8JfJ5FWo9JBPjUhKbKqDxbK/cQxZyjTw==
X-Received: by 2002:a17:90b:3e4c:b0:327:ac8c:10af with SMTP id 98e67ed59e1d1-327ac8c126dmr214556a91.36.1756330188487;
        Wed, 27 Aug 2025 14:29:48 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d0c9:1052:20fd:8423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce1f30sm2905857a91.23.2025.08.27.14.29.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 14:29:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/33] Patch review
Date: Wed, 27 Aug 2025 14:29:07 -0700
Message-ID: <cover.1756329972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 21:29:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222508

Please review this set of changes for scarthgap and have comments back by
end of day Friday, August 29

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/2277

The following changes since commit 93c7489d843a0e46fe4fc685b356d0ae885300d7:

  build-appliance-image: Update to scarthgap head revision (2025-08-22 06:02:51 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Archana Polampalli (3):
  go: fix CVE-2025-4674
  ffmpeg: upgrade 6.1.2 -> 6.1.3
  ffmpeg: fix CVE-2025-1594

Hitendra Prajapati (1):
  gstreamer1.0-plugins-base: fix CVE-2025-47807

Jiaying Song (1):
  ruby-ptest : some ptest fixes

Khem Raj (9):
  ncurses: Pin to C17 standard
  unzip: Fix build with GCC-15
  m4: Stick to C17 standard
  gmp: Fix build with GCC15/C23
  gmp: Fix build with older gcc versions
  gdbm: Use C11 standard
  unifdef: Don't use C23 constexpr keyword
  libtirpc: Fix build with gcc-15/C23
  cpio: Pin to use C17 std

Martin Jansa (8):
  cmake: fix build with gcc-15 on host
  git: fix build with gcc-15 on host
  pkgconfig: fix build with gcc-15
  libgpg-error: fix build with gcc-15
  rust-llvm: fix build with gcc-15
  elfutils: fix build with gcc-15
  binutils: fix build with gcc-15
  dbus-glib: fix build with gcc-15

Michael Halstead (2):
  yocto-uninative: Update to 4.8 for GCC 15.1
  yocto-uninative: Update to 4.9 for glibc 2.42

Peter Marko (8):
  qemu: set status of CVE-2024-7730 to fixed
  go-binary-native: ignore CVE-2025-0913
  glib-2.0: patch CVE-2025-7039
  glib-2.0: patch CVE-2025-6052
  dpkg: patch CVE-2025-6297
  libarchive: patch regression of patch for CVE-2025-5918
  vim: upgrade 9.1.1198 -> 9.1.1652
  sudo: remove devtool FIXME comment

Praveen Kumar (1):
  go: fix CVE-2025-47907

 meta/conf/distro/include/yocto-uninative.inc  |  10 +-
 .../dbus-glib/fix-build-with-gcc-15.patch     |  37 +
 meta/recipes-core/dbus/dbus-glib_0.112.bb     |   1 +
 .../glib-2.0/glib-2.0/CVE-2025-6052-01.patch  |  69 ++
 .../glib-2.0/glib-2.0/CVE-2025-6052-02.patch  |  97 +++
 .../glib-2.0/glib-2.0/CVE-2025-6052-03.patch  |  35 +
 .../glib-2.0/glib-2.0/CVE-2025-7039.patch     |  43 +
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |   4 +
 meta/recipes-core/ncurses/ncurses.inc         |   4 +
 .../binutils/binutils-2.42.inc                |   4 +
 ...nu23-compatibility-wrt-static_assert.patch |  89 ++
 ...ngs-when-building-gprofng-with-Clang.patch | 767 ++++++++++++++++++
 ...gnu23-compatibility-wrt-unprototyped.patch | 606 ++++++++++++++
 ...021-gprofng-fix-build-with-std-gnu23.patch | 196 +++++
 meta/recipes-devtools/cmake/cmake.inc         |   1 +
 .../0001-cppdap-fix-build-with-gcc-15.patch   |  30 +
 .../dpkg/dpkg/CVE-2025-6297.patch             | 125 +++
 meta/recipes-devtools/dpkg/dpkg_1.22.0.bb     |   1 +
 .../elfutils/elfutils_0.191.bb                |   1 +
 .../files/0007-Fix-build-with-gcc-15.patch    |  72 ++
 ...ndex-pack-rename-struct-thread_local.patch |  67 ++
 .../git/0001-reflog-rename-unreachable.patch  |  40 +
 meta/recipes-devtools/git/git_2.44.4.bb       |   2 +
 meta/recipes-devtools/go/go-1.22.12.inc       |   3 +
 .../go/go-binary-native_1.22.12.bb            |   1 +
 .../go/go/CVE-2025-4674.patch                 | 332 ++++++++
 .../go/go/CVE-2025-47907-pre.patch            | 233 ++++++
 .../go/go/CVE-2025-47907.patch                | 328 ++++++++
 meta/recipes-devtools/m4/m4-1.4.19.inc        |   3 +
 ...0001-Do-not-use-bool-as-a-field-name.patch |  36 +
 .../pkgconfig/pkgconfig_git.bb                |   1 +
 meta/recipes-devtools/qemu/qemu.inc           |   2 +
 ..._rm_r_no_permissions-test-under-root.patch |  30 +
 meta/recipes-devtools/ruby/ruby/run-ptest     |   2 +-
 meta/recipes-devtools/ruby/ruby_3.3.5.bb      |   7 +-
 ...36-Add-cstdint-to-SmallVector-101761.patch |  28 +
 ...cstdint-in-AMDGPUMCTargetDesc-101766.patch |  23 +
 ...-include-to-X86MCTargetDesc.h-123320.patch |  32 +
 .../recipes-devtools/rust/rust-llvm_1.75.0.bb |   8 +-
 ...0001-Don-t-use-C23-constexpr-keyword.patch |  57 ++
 meta/recipes-devtools/unifdef/unifdef_2.12.bb |   3 +-
 meta/recipes-extended/cpio/cpio_2.15.bb       |   3 +
 .../libarchive/CVE-2025-5918-0003.patch       |  51 ++
 .../libarchive/libarchive_3.7.9.bb            |   1 +
 ...rations-to-allow-compile-with-gcc-15.patch |  64 ++
 ...d-key_call-declarations-to-allow-com.patch |  60 ++
 .../libtirpc/libtirpc_1.3.4.bb                |   2 +
 meta/recipes-extended/sudo/sudo_1.9.17p1.bb   |  52 --
 meta/recipes-extended/unzip/unzip/gcc15.patch |  18 +
 meta/recipes-extended/unzip/unzip_6.0.bb      |   1 +
 .../ffmpeg/ffmpeg/CVE-2023-49501.patch        |  30 -
 .../ffmpeg/ffmpeg/CVE-2023-49502.patch        | 107 ---
 .../ffmpeg/ffmpeg/CVE-2023-50007.patch        |  78 --
 .../ffmpeg/ffmpeg/CVE-2023-50008.patch        |  29 -
 .../ffmpeg/ffmpeg/CVE-2024-31578.patch        |  49 --
 .../ffmpeg/ffmpeg/CVE-2024-31582.patch        |  34 -
 .../ffmpeg/ffmpeg/CVE-2024-35367.patch        |  47 --
 .../ffmpeg/ffmpeg/CVE-2024-35368.patch        |  41 -
 .../ffmpeg/ffmpeg/CVE-2025-0518.patch         |  34 -
 .../ffmpeg/ffmpeg/CVE-2025-1594.patch         | 105 +++
 .../ffmpeg/ffmpeg/CVE-2025-22919.patch        |  39 -
 .../{ffmpeg_6.1.2.bb => ffmpeg_6.1.3.bb}      |  13 +-
 .../CVE-2025-47807.patch                      |  49 ++
 .../gstreamer1.0-plugins-base_1.22.12.bb      |   1 +
 meta/recipes-support/gdbm/gdbm_1.23.bb        |   4 +
 ...n-prototype-in-acinclude.m4-for-C23-.patch |  25 +
 ...d-parameter-names-in-prototype-for-g.patch |  50 ++
 meta/recipes-support/gmp/gmp_6.3.0.bb         |   2 +
 ...oid-use-of-nullptr-for-an-identifier.patch |  52 ++
 .../libgpg-error/libgpg-error_1.48.bb         |   1 +
 ...src-Makefile-improve-reproducibility.patch |  10 +-
 .../vim/files/disable_acl_header_check.patch  |  12 +-
 .../vim/files/no-path-adjust.patch            |   2 +-
 meta/recipes-support/vim/vim.inc              |   7 +-
 74 files changed, 3926 insertions(+), 577 deletions(-)
 create mode 100644 meta/recipes-core/dbus/dbus-glib/fix-build-with-gcc-15.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-6052-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-6052-02.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-6052-03.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-7039.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0018-opcodes-fix-std-gnu23-compatibility-wrt-static_assert.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0019-Fix-32097-Warnings-when-building-gprofng-with-Clang.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0020-gprofng-fix-std-gnu23-compatibility-wrt-unprototyped.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0021-gprofng-fix-build-with-std-gnu23.patch
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-cppdap-fix-build-with-gcc-15.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/CVE-2025-6297.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/0007-Fix-build-with-gcc-15.patch
 create mode 100644 meta/recipes-devtools/git/git/0001-index-pack-rename-struct-thread_local.patch
 create mode 100644 meta/recipes-devtools/git/git/0001-reflog-rename-unreachable.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-4674.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-47907-pre.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-47907.patch
 create mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/0001-Do-not-use-bool-as-a-field-name.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
 create mode 100644 meta/recipes-devtools/rust/rust-llvm/0036-Add-cstdint-to-SmallVector-101761.patch
 create mode 100644 meta/recipes-devtools/rust/rust-llvm/0037-Include-cstdint-in-AMDGPUMCTargetDesc-101766.patch
 create mode 100644 meta/recipes-devtools/rust/rust-llvm/0038-Add-missing-include-to-X86MCTargetDesc.h-123320.patch
 create mode 100644 meta/recipes-devtools/unifdef/unifdef/0001-Don-t-use-C23-constexpr-keyword.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5918-0003.patch
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0001-Update-declarations-to-allow-compile-with-gcc-15.patch
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0002-update-signal-and-key_call-declarations-to-allow-com.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/gcc15.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49501.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49502.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50007.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50008.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31578.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31582.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35367.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35368.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-0518.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-1594.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22919.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_6.1.2.bb => ffmpeg_6.1.3.bb} (95%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2025-47807.patch
 create mode 100644 meta/recipes-support/gmp/gmp/0001-Complete-function-prototype-in-acinclude.m4-for-C23-.patch
 create mode 100644 meta/recipes-support/gmp/gmp/0001-acinclude.m4-Add-parameter-names-in-prototype-for-g.patch
 create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/0001-Avoid-use-of-nullptr-for-an-identifier.patch

-- 
2.43.0


