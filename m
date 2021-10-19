Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50918C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:54:09 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web08.15290.1634673246957298577
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=F+KIYTTm;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id f5so20343855pgc.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bkG1cK7hJlM1XoUVQL/OrGlJrl45sg89wqFTOiY6DiY=;
        b=F+KIYTTmjapUfWfjo1gkrFYv4pEbWy5ChrZUnZiovBLQ7xID2+2uoS6xf/HmD/WiDb
         kPaNPp9+3XTRvoxJYgsly2sP7foqXa4axwB05E/y1fZy0OefJyeZPX0Flv8YeegUZIdS
         A8wWagbNwBJ5Q/h+//ZgkAavBFOpsMV/yKOiE74xvmURT0jOdfEfwMRGtKYFw2vnRgsq
         vdjTYsyffkkxJmXMeppn/pkFN8E62ZbAmfAO/8Yl00VGds7O/yNKNX7oMU9Bz/l/DTUZ
         pRQuonN0v49KIRsRb45xLH2l3WM9Tibb7OH6PdgVHJD6xkOwnycfTFtkiQrLG2DGaq6x
         vYqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bkG1cK7hJlM1XoUVQL/OrGlJrl45sg89wqFTOiY6DiY=;
        b=ZTo9027rTTA7j54gLGPoZIqcmNXlChbPGDXoqqCDOlEA5t7ntNqSdZzp0zaUSc3t0T
         w/cF0sNosKTSJOQ0MCQp/xgm72/Uu4UO8VoKOoidDJ3BFfvlRtJb7gRcC2g7KYwVnwJ8
         Ew2bs33kV1z9HEXX82EvxVD6LLOeH4vp4f9RNLK6Agubw6k1MIjMq8Tql/+zcksft0hq
         3Pr8YjK6a40foHqfQpGUhd5UQX8a7PontRret8yF2Q+HWJv+LZJ+uvWN0ZAcrl1PZOQB
         hvwSk8/E4rFC8VknLs/Z3qZVCN0vC3S0QLnPg6VO9mezviPdKbyfNJo1gnm0l4/aXJ5p
         G3iA==
X-Gm-Message-State: AOAM532bUTvyLDp6qeGR2l55zmnUMDy77eQJxXbmlioDXN9nOb+S12Kj
	51cCeZwnXmJi9VGccHdiZsyvEoBiFl+rQXco+Mk=
X-Google-Smtp-Source: 
 ABdhPJyAxP5kZjw03t8XrhtOq7yd7MhZJE3ludHjBtZSyTDe4jLd1QZHyYLy043TBh6q5JychsO7Mw==
X-Received: by 2002:a62:1c52:0:b0:44c:f1c3:9cb5 with SMTP id
 c79-20020a621c52000000b0044cf1c39cb5mr1949706pfc.14.1634673245091;
        Tue, 19 Oct 2021 12:54:05 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.54.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:54:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/38] Patch review
Date: Tue, 19 Oct 2021 09:53:11 -1000
Message-Id: <cover.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:54:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157205

Please review this next set of changes for dunfell and have comments back by
end of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2772

A few additional notes since this is a large patch set.

There are three groups of patches in this set:

 1. the normal bug fix patches from the mailing list and cherry-picks from master:
 
 gcc: fix missing dependencies for selftests
 libpsl: Add config knobs for runtime/builtin conversion choices
 patch.bbclass: when the patch fails show more info on the fatal error
 oeqa/selftest/sstatetests: fix typo ware -> were
 tar: filter CVEs using vendor name
 rng-tools: add systemd-udev-settle wants to service
 scriptutils.py: Add check before deleting path
 binutils: Fix a missing break in case statement
 oeqa/manual: Fix no longer valid URLs
 multilib: Avoid sysroot race issues when multilib enabled
 weston: Use systemd notify,
 e2fsprogs: upgrade 1.45.6 -> 1.45.7
 e2fsprogs: update to 1.45.6
 linux-yocto/5.4: update to v5.4.153
 linux-yocto/5.4: update to v5.4.150
 linux-yocto/5.4: update to v5.4.149
 ffmpeg: Add fix for CVEs

 2. Patches to enable dunfell on recent distros that have moved to glibc 2.34
 
 uninative: Upgrade to 3.3, support glibc 2.34
 uninative: Improve glob to handle glibc 2.34
 nativesdk-pseudo: Fix to work with glibc 2.34 systems
 pseudo: Update with fcntl and glibc 2.34 fixes
 pseudo: Fix to work with glibc 2.34 systems
 util-linux: disable raw
 gpgme: Use glibc provided closefrom API when available
 m4: Do not use SIGSTKSZ
 
 3. Patches to improve reproducible builds
 
 target/ssh.py: add HostKeyAlgorithms option to test commands
 python3: Add a fix for a make install race
 libnewt: Use python3targetconfig to fix reproducibility issue
 libxml2: Use python3targetconfig to fix reproducibility issue
 externalsrc: Fix a source date epoch race in reproducible builds
 externalsrc: Work with reproducible_build
 gobject-introspection: Don't write $HOME into scripts
 libtool: Allow libtool-cross to reproduce
 libtool: Fix lto option passing for reproducible builds
 util-linux: Fix reproducibility
 gnupg: Be deterministic about sendmail
 mesa: Ensure megadrivers runtime mappings are deterministic
 package: Ensure pclist files are deterministic and don't use full paths


The following changes since commit d12c44df66ca065a1526c7d6885e726cf50aab46:

  glew: Stop polluting /tmp during builds (2021-09-30 04:20:38 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexander Kanavin (1):
  e2fsprogs: update to 1.45.6

Alexandre Belloni (1):
  oeqa/selftest/sstatetests: fix typo ware -> were

Andrej Valek (1):
  libpsl: Add config knobs for runtime/builtin conversion choices

Bruce Ashfield (3):
  linux-yocto/5.4: update to v5.4.149
  linux-yocto/5.4: update to v5.4.150
  linux-yocto/5.4: update to v5.4.153

Chandana kalluri (1):
  scriptutils.py: Add check before deleting path

Christian Eggers (1):
  binutils: Fix a missing break in case statement

Claudius Heine (1):
  rng-tools: add systemd-udev-settle wants to service

Hongxu Jia (1):
  nativesdk-pseudo: Fix to work with glibc 2.34 systems

Jon Mason (1):
  oeqa/manual: Fix no longer valid URLs

Jose Quaresma (1):
  patch.bbclass: when the patch fails show more info on the fatal error

Khem Raj (2):
  m4: Do not use SIGSTKSZ
  gpgme: Use glibc provided closefrom API when available

Mark Hatle (1):
  externalsrc: Work with reproducible_build

Markus Volk (1):
  util-linux: disable raw

Michael Halstead (1):
  uninative: Upgrade to 3.3, support glibc 2.34

Pavel Zhukov (1):
  weston: Use systemd notify,

Ralph Siemsen (1):
  tar: filter CVEs using vendor name

Richard Purdie (13):
  multilib: Avoid sysroot race issues when multilib enabled
  pseudo: Fix to work with glibc 2.34 systems
  pseudo: Update with fcntl and glibc 2.34 fixes
  package: Ensure pclist files are deterministic and don't use full
    paths
  mesa: Ensure megadrivers runtime mappings are deterministic
  gnupg: Be deterministic about sendmail
  libtool: Fix lto option passing for reproducible builds
  libtool: Allow libtool-cross to reproduce
  gobject-introspection: Don't write $HOME into scripts
  externalsrc: Fix a source date epoch race in reproducible builds
  libxml2: Use python3targetconfig to fix reproducibility issue
  libnewt: Use python3targetconfig to fix reproducibility issue
  python3: Add a fix for a make install race

Ross Burton (1):
  uninative: Improve glob to handle glibc 2.34

Saloni (1):
  ffmpeg: Add fix for CVEs

Steve Sakoman (3):
  gcc: fix missing dependencies for selftests
  util-linux: Fix reproducibility
  target/ssh.py: add HostKeyAlgorithms option to test commands

Wang Mingyu (1):
  e2fsprogs: upgrade 1.45.6 -> 1.45.7

 meta/classes/externalsrc.bbclass              |  9 ++
 meta/classes/package.bbclass                  |  6 +-
 meta/classes/patch.bbclass                    |  7 +-
 meta/classes/uninative.bbclass                |  2 +-
 meta/conf/distro/include/yocto-uninative.inc  | 10 +--
 meta/conf/multilib.conf                       |  2 +
 meta/lib/oeqa/core/target/ssh.py              |  1 +
 meta/lib/oeqa/manual/eclipse-plugin.json      |  6 +-
 meta/lib/oeqa/selftest/cases/sstatetests.py   | 12 +--
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |  2 +-
 meta/recipes-core/util-linux/util-linux.inc   |  7 +-
 ...-system-directories-when-cross-linki.patch | 26 +++---
 ...-t-try-to-rehash-a-deleted-directory.patch | 49 -----------
 ...ate_inode.c-set-dir-s-mode-correctly.patch | 41 ---------
 .../e2fsprogs/e2fsprogs/CVE-2019-5188.patch   | 57 -------------
 ...fix-use-after-free-in-calculate_tree.patch | 76 -----------------
 ...-missing-check-for-permission-denied.patch |  2 +-
 .../e2fsprogs/e2fsprogs/quiet-debugfs.patch   |  2 +-
 ...2fsprogs_1.45.4.bb => e2fsprogs_1.45.7.bb} |  6 +-
 meta/recipes-devtools/gcc/gcc-9.3.inc         |  1 +
 ...x-missing-dependencies-for-selftests.patch | 45 ++++++++++
 .../libtool/libtool-2.4.6.inc                 |  2 +
 .../libtool/libtool/lto-prefix.patch          | 22 +++++
 .../recipes-devtools/libtool/libtool_2.4.6.bb |  2 +-
 meta/recipes-devtools/m4/m4-1.4.18.inc        |  1 +
 .../m4/0001-c-stack-stop-using-SIGSTKSZ.patch | 84 +++++++++++++++++++
 .../pseudo/files/build-oldlibc                | 20 +++++
 .../pseudo/files/older-glibc-symbols.patch    | 57 +++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  9 +-
 .../python/python3/makerace.patch             | 23 +++++
 .../recipes-devtools/python/python3_3.8.11.bb |  1 +
 meta/recipes-extended/newt/libnewt_0.52.21.bb |  2 +-
 meta/recipes-extended/tar/tar_1.32.bb         |  6 +-
 .../gobject-introspection_1.62.0.bb           |  2 +-
 meta/recipes-graphics/mesa/mesa.inc           |  2 +-
 .../wayland/weston-init/weston-start          | 12 +++
 .../wayland/weston-init/weston@.service       |  6 ++
 .../weston/systemd-notify.weston-start        |  9 ++
 .../wayland/weston/xwayland.weston-start      |  3 +-
 meta/recipes-graphics/wayland/weston_8.0.0.bb |  6 ++
 .../linux/linux-yocto-rt_5.4.bb               |  6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 ++---
 .../ffmpeg/ffmpeg/CVE-2021-3566.patch         | 61 ++++++++++++++
 .../ffmpeg/ffmpeg/CVE-2021-38291.patch        | 53 ++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb |  4 +-
 meta/recipes-support/gnupg/gnupg_2.2.27.bb    |  1 +
 ...se-closefrom-on-linux-and-glibc-2.34.patch | 24 ++++++
 meta/recipes-support/gpgme/gpgme_1.13.1.bb    |  3 +-
 meta/recipes-support/libpsl/libpsl_0.21.0.bb  |  7 +-
 .../rng-tools/rng-tools/rngd.service          |  1 +
 scripts/lib/scriptutils.py                    |  3 +-
 52 files changed, 529 insertions(+), 302 deletions(-)
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsck-don-t-try-to-rehash-a-deleted-directory.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-set-dir-s-mode-correctly.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2019-5188.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsck-fix-use-after-free-in-calculate_tree.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.45.4.bb => e2fsprogs_1.45.7.bb} (94%)
 create mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0040-fix-missing-dependencies-for-selftests.patch
 create mode 100644 meta/recipes-devtools/libtool/libtool/lto-prefix.patch
 create mode 100644 meta/recipes-devtools/m4/m4/0001-c-stack-stop-using-SIGSTKSZ.patch
 create mode 100755 meta/recipes-devtools/pseudo/files/build-oldlibc
 create mode 100644 meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
 create mode 100644 meta/recipes-devtools/python/python3/makerace.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/systemd-notify.weston-start
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2021-3566.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2021-38291.patch
 create mode 100644 meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch

-- 
2.25.1


