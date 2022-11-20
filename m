Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD6CC43217
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 14:15:40 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.13197.1668953736410795498
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 06:15:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=WsdgcxSd;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso8685272pjt.0
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 06:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=J5mDjnIURDwrlbfudYv0KbvwYrdLZKFZEcjdcsjwTe4=;
        b=WsdgcxSddthpHfyoJ9bV2VL0qc9odgNoN6UCSzc/+5V75wgYS/LPC4Y/PrwKGRIr0x
         ymDgj1d59sBsxcu/KDKIkEYf18CnaZM5M2QTjjQMoZHoOkqjkydCPUICv2yfAkei5gzC
         rSoJtZLxiHTMQgJaooGbKZaMLw8pNtM++4MlxX5bdU1EaOSAFpvdtg7r+2dsQgl9qh9j
         MJfMr/1x5+pwKq2nUajA1E0AdlXS88UnjYqdC6ZWS8KP7ReJnmB7ZuzFm4WnolrqgP0c
         ytNY8leCCOmYYUDHFp1UXXwwBUIqlGS653iNOIva01yOh8ciVCxXZnN6Ldp+pk6ezCiP
         h7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J5mDjnIURDwrlbfudYv0KbvwYrdLZKFZEcjdcsjwTe4=;
        b=tfqUxavXKKdWMn8EpDzl9LB83YrEdFVSllww+BzWEUR274/MIfIwAwHbkLhf0gFrUd
         MX/aoUoIo0fIC1Rb4/s8JIIjOx/47YkaESX3w7yB3eE55Ev7Y+rrxaJ4tIH4upKuRLLs
         Tg3wju7VWEdv2/h2HqOklbA/TW9Gq4UnFVNqa6SFYEV0Y7k+y9M95L9EsF4QUnEgoWMH
         ZpMIrxtd4q395jXdup/FapKrg9eUoZesvgNRnwlS9cPVgUfShgoi7WY+y1050P3lmlZp
         alQw0joPE1qY4/E/dBn+wzfhczbz/6dQnrJQS7gWU3DCU74ToBus9avwilG3WGAdP3sE
         KGyg==
X-Gm-Message-State: ANoB5pnmzJYvQtOT2+ypvKCwfyG6It9Q2mu7i3ifjkPjZ4wHwye+fKBR
	AAMOlWPJGRMzoZttidL8rAg2mhrq+5xvmW9oh2A=
X-Google-Smtp-Source: AA0mqf4sEqdWwOLAJG/bX0SFJotw6oPdZ0Y4Khll5YwCl+cKyWSzlrqKR9t8NkFJVMwzw4BwzCaQMg==
X-Received: by 2002:a17:90b:683:b0:213:cfb4:719 with SMTP id m3-20020a17090b068300b00213cfb40719mr16289432pjz.188.1668953735158;
        Sun, 20 Nov 2022 06:15:35 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm6721379pfr.111.2022.11.20.06.15.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 06:15:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/35] Patch review
Date: Sun, 20 Nov 2022 04:14:49 -1000
Message-Id: <cover.1668952942.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 14:15:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173600

Please review this set of patches for kirkstone and have comments back
by end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4507

The following changes since commit 3243b069db7629d15e4b8c25b4133f824d18520c:

  qemu: add io_uring PACKAGECONFIG (2022-11-10 07:13:46 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alex Kiernan (1):
  cargo_common.bbclass: Fix typos

Alexander Kanavin (6):
  lttng-tools: submit determinism.patch upstream
  groff: submit patches upstream
  tcl: correct patch status
  kea: submit patch upstream
  ovmf: correct patches status
  libffi: submit patch upstream

Diego Sueiro (1):
  kernel.bbclass: Include randstruct seed assets in
    STAGING_KERNEL_BUILDDIR

Hitendra Prajapati (1):
  systemd: CVE-2022-3821 Fix buffer overrun

Jose Quaresma (1):
  archiver: avoid using machine variable as it breaks multiconfig

Kai Kang (1):
  libuv: fixup SRC_URI

Leon Anavi (1):
  get_module_deps3.py: Check attribute '__file__'

Marek Vasut (1):
  bluez5: Point hciattach bcm43xx firmware search path to /lib/firmware

Nathan Rossi (4):
  oeqa/selftest/lic_checksum: Cleanup changes to emptytest include
  oeqa/selftest/minidebuginfo: Create selftest for minidebuginfo
  glibc-locale: Do not INHIBIT_DEFAULT_DEPS
  package: Fix handling of minidebuginfo with newer binutils

Niko Mauno (1):
  systemd: Consider PACKAGECONFIG in RRECOMMENDS

Richard Purdie (6):
  lttng-modules: upgrade 2.13.5 -> 2.13.7
  bitbake.conf: Drop export of SOURCE_DATE_EPOCH_FALLBACK
  gcc-shared-source: Fix source date epoch handling
  gcc-source: Fix gengtypes race
  gcc-source: Drop gengtype manipulation
  gcc-source: Ensure deploy_source_date_epoch sstate hash doesn't change

Ross Burton (1):
  expat: upgrade to 2.5.0

Sergei Zhmylev (1):
  wic: make ext2/3/4 images reproducible

Steve Sakoman (1):
  Revert "expat: backport the fix for CVE-2022-43680"

Wang Mingyu (3):
  bind: upgrade 9.18.7 -> 9.18.8
  socat: upgrade 1.7.4.3 -> 1.7.4.4
  libxcrypt: upgrade 4.4.28 -> 4.4.30

Xiangyu Chen (5):
  dbus: fix CVE-2022-42010 Check brackets in signature nest correctly
  dbus: fix CVE-2022-42011 dbus-daemon can be crashed by messages with
    array length inconsistent with element type
  dbus: fix CVE-2022-42012 dbus-marshal-byteswap: Byte-swap Unix fd
    indexes if needed
  lttng-tools: Upgrade 2.13.4 -> 2.13.8
  sudo: upgrade 1.9.10 -> sudo 1.9.12p1

 meta/classes/archiver.bbclass                 |   2 +-
 meta/classes/cargo_common.bbclass             |   4 +-
 meta/classes/kernel.bbclass                   |  16 +++
 meta/classes/package.bbclass                  |  21 +++-
 meta/conf/bitbake.conf                        |   2 +-
 meta/lib/oeqa/selftest/cases/lic_checksum.py  |   2 +
 meta/lib/oeqa/selftest/cases/minidebuginfo.py |  49 ++++++++
 ...1-avoid-start-failure-with-bind-user.patch |   0
 ...d-V-and-start-log-hide-build-options.patch |   0
 ...ching-for-json-headers-searches-sysr.patch |   0
 .../bind/{bind-9.18.7 => bind-9.18.8}/bind9   |   0
 .../{bind-9.18.7 => bind-9.18.8}/conf.patch   |   0
 .../generate-rndc-key.sh                      |   0
 ...t.d-add-support-for-read-only-rootfs.patch |   0
 .../make-etc-initd-bind-stop-work.patch       |   0
 .../named.service                             |   0
 .../bind/{bind_9.18.7.bb => bind_9.18.8.bb}   |   2 +-
 meta/recipes-connectivity/bluez5/bluez5.inc   |   2 +
 .../kea/files/fix-multilib-conflict.patch     |   2 +-
 .../libuv/libuv_1.44.2.bb                     |   2 +-
 ...ck-getprotobynumber_r-with-AC_TRY_LI.patch |  35 ------
 .../{socat_1.7.4.3.bb => socat_1.7.4.4.bb}    |   6 +-
 ...eswap-Byte-swap-Unix-fd-indexes-if-n.patch |  76 +++++++++++
 ...idate-Check-brackets-in-signature-ne.patch | 119 ++++++++++++++++++
 ...idate-Validate-length-of-arrays-of-f.patch |  61 +++++++++
 meta/recipes-core/dbus/dbus_1.14.0.bb         |   3 +
 .../expat/expat/CVE-2022-43680.patch          |  33 -----
 .../expat/{expat_2.4.9.bb => expat_2.5.0.bb}  |   3 +-
 meta/recipes-core/glibc/glibc-locale.inc      |  11 +-
 ...t_4.4.28.bb => libxcrypt-compat_4.4.30.bb} |   0
 meta/recipes-core/libxcrypt/libxcrypt.inc     |   2 +-
 ...ibxcrypt_4.4.28.bb => libxcrypt_4.4.30.bb} |   0
 ...ovmf-update-path-to-native-BaseTools.patch |   2 +-
 ...ile-adjust-to-build-in-under-bitbake.patch |   7 +-
 .../systemd/systemd/CVE-2022-3821.patch       |  45 +++++++
 meta/recipes-core/systemd/systemd_250.5.bb    |   5 +-
 .../gcc/gcc-shared-source.inc                 |  10 ++
 meta/recipes-devtools/gcc/gcc-source.inc      |   9 +-
 .../python/python3/get_module_deps3.py        |   2 +-
 .../tcl/fix_non_native_build_issue.patch      |   2 +-
 ...001-Make-manpages-mulitlib-identical.patch |   2 +-
 ...001-replace-perl-w-with-use-warnings.patch |   2 +-
 meta/recipes-extended/sudo/sudo.inc           |   2 +-
 .../sudo/{sudo_1.9.10.bb => sudo_1.9.12p1.bb} |   2 +-
 ...djust-range-v5.10.137-in-block-probe.patch |  92 --------------
 ...4-fix-kernel-crash-caused-by-do_get_.patch |  94 --------------
 ...ules_2.13.5.bb => lttng-modules_2.13.7.bb} |   4 +-
 .../lttng/lttng-tools/determinism.patch       |   2 +-
 ...-tools_2.13.4.bb => lttng-tools_2.13.8.bb} |  11 +-
 ...m-sysv-reverted-clang-VFP-mitigation.patch |   2 +-
 scripts/lib/wic/partition.py                  |  29 ++++-
 51 files changed, 474 insertions(+), 303 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/minidebuginfo.py
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.7.bb => bind_9.18.8.bb} (97%)
 delete mode 100644 meta/recipes-connectivity/socat/socat/0001-configure.ac-check-getprotobynumber_r-with-AC_TRY_LI.patch
 rename meta/recipes-connectivity/socat/{socat_1.7.4.3.bb => socat_1.7.4.4.bb} (89%)
 create mode 100644 meta/recipes-core/dbus/dbus/0001-dbus-marshal-byteswap-Byte-swap-Unix-fd-indexes-if-n.patch
 create mode 100644 meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Check-brackets-in-signature-ne.patch
 create mode 100644 meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Validate-length-of-arrays-of-f.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2022-43680.patch
 rename meta/recipes-core/expat/{expat_2.4.9.bb => expat_2.5.0.bb} (88%)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.28.bb => libxcrypt-compat_4.4.30.bb} (100%)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.28.bb => libxcrypt_4.4.30.bb} (100%)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2022-3821.patch
 rename meta/recipes-extended/sudo/{sudo_1.9.10.bb => sudo_1.9.12p1.bb} (96%)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-adjust-range-v5.10.137-in-block-probe.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-wrapper-powerpc64-fix-kernel-crash-caused-by-do_get_.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.5.bb => lttng-modules_2.13.7.bb} (86%)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.13.4.bb => lttng-tools_2.13.8.bb} (90%)

-- 
2.25.1


