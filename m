Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12FEC3DA4A
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:12:56 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.55636.1722258776088088347
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Wc3tVg+f;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2cb63ceff6dso1984806a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258775; x=1722863575; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=13otq6jT+HJLl2qpAqVdP8lbZZTGNBU1cm3O3Mpqzcc=;
        b=Wc3tVg+fBm2T8w+rKpZdazXDxbPfn6PlPeJ4vCce/yF9uZsuMPfFwOnvIuK8OpLLS7
         IyPcDUOBsSq3xmdljaWBMkgy3MBgPkP0CuFRoSAkydUGlYJqzhHz9Y/YMkcyUjhUsMA+
         e1qeglPNIedTkPjh74ZDvFTXa4MHDeEHyuIJkZu9JE50ZBxTbf9c2ID8C3MTHWWPsa8G
         LOhMCVWCpBlWruD8+KXUvshD0soY19uF3971OANbA6V3PAUsH5cthavqbbbyIZPdJtUK
         Jk6UmLnKY99ps6/KL+Bu0aQAkrZUbUB9COHWxnwo6vQ5cwFzLD1JdXrl4aMOzBEsF8+n
         1phQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258775; x=1722863575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=13otq6jT+HJLl2qpAqVdP8lbZZTGNBU1cm3O3Mpqzcc=;
        b=MtP1FHIstXchPKf/eF9vmTtQk/IQDNxSrKNwp2RQ9muxMuDZtX/Euw3tS5mqpqS8t6
         /EheP+h+aI2GCh42Wme4WyX8CBA5QQIfissW/wtquWanp2f4Kk3RqTSx1pPHIO9yqGiR
         46n2axEkVfQBgPRAzNFd9BMOclwI+G2/VMoRlSi2H3QGgwQoiLDjeogO+BdiH7UKfk9+
         tvxM7r/GduBiLAi1z54c/Shm1xHnwiU6qkK8mTHJm+fuXS9rYRKM9mqnu4yIx++yBbeP
         H0YfMEOCYODrmpxoA1xasEO8Ifs6k1ONpJspOO/r5U3SVJZqlwpNJqpDkhKgfN/Noxyx
         04aQ==
X-Gm-Message-State: AOJu0YzIatkQks+aIx+8V5jpggPTVJEZFrD8PRQw4DUx6QzqAgD4TbkN
	XlOgGa8TaBM65VEEXovGY42kDs1ESDypvaLxdratndPrjc3rRnb8u695ylm6ocFSvljLW6oAOky
	AZzdNVQ==
X-Google-Smtp-Source: AGHT+IE7M70W/00nJbRWsq8Vqr0LVwriE7COCsQOEaq+zSTbNsUXTpQ811RHazwQ1QIZ190W97lDbA==
X-Received: by 2002:a17:90a:3006:b0:2cd:3445:f87f with SMTP id 98e67ed59e1d1-2cf7e1a1da5mr5549136a91.4.1722258774410;
        Mon, 29 Jul 2024 06:12:54 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.12.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:12:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/37] Patch review
Date: Mon, 29 Jul 2024 06:12:10 -0700
Message-Id: <cover.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202614

Please review this set of changes for scarthgap and have comments back by
end of day Wednesday, July 31

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7188

with the exception on a failure on the meta-agl-core test due to the
weston version bump (a bug/security fix release):

https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/4544/steps/12/logs/stdio

There is already a fix for this in the meta-agl next branch which will need to
be backported.

The following changes since commit c00a9a8f25b0042b0723a5d20b88e92d473d22bf:

  insane.bbclass: remove leftover variables and comment (2024-07-22 08:04:58 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Aleksandar Nikolic (1):
  cve-check: Introduce CVE_CHECK_MANIFEST_JSON_SUFFIX

Alexander Kanavin (8):
  python3: submit deterministic_imports.patch upstream as a ticket
  glib-networking: submit eagain.patch upstream
  glslang: mark 0001-generate-glslang-pkg-config.patch as Inappropriate
  tcp-wrappers: mark all patches as inactive-upstream
  automake: mark new_rt_path_for_test-driver.patch as Inappropriate
  settings-daemon: submit addsoundkeys.patch upstream and update to a
    revision that has it
  dpkg: mark patches adding custom non-debian architectures as
    inappropriate for upstream
  libacpi: mark patches as inactive-upstream

Archana Polampalli (3):
  ofono: fix CVE-2023-2794
  ffmpeg: fix CVE-2023-49502
  ffmpeg: fix CVE-2024-31578

Benjamin Szőke (1):
  archiver.bbclass: Fix work-shared checking for kernel recipes

Denys Dmytriyenko (1):
  weston: upgrade 13.0.0 -> 13.0.1

Enrico Jörns (1):
  wic: bootimg-efi: fix error handling

Etienne Cordonnier (2):
  oeqa/runtime: make minidebuginfo test work with coreutils
  oeqa/runtime: fix race-condition in minidebuginfo test

Guðni Már Gilbert (2):
  pam: Fix for CVE-2024-22365
  python3-attrs: drop python3-ctypes from RDEPENDS

Jose Quaresma (4):
  oeqa/runtime/scp: requires openssh-sftp-server
  openssh: drop rejected patch fixed in 8.6p1 release
  openssh: systemd sd-notify patch was rejected upstream
  openssh: systemd notification was implemented upstream

Jörg Sommer (1):
  classes/kernel: No symlink in postinst without
    KERNEL_IMAGETYPE_SYMLINK

Kai Kang (2):
  multilib.bbclass: replace deprecated e.data with d
  cmake-qemu.bbclass: fix if criterion

Khem Raj (3):
  grub,grub-efi: Remove -mfpmath=sse on x86
  python3: Treat UID/GID overflow as failure
  gawk: Remove References to /usr/local/bin/gawk

Kirill Yatsenko (1):
  iptables: fix save/restore symlinks with libnftnl PACKAGECONFIG
    enabled

Martin Jansa (1):
  selftest: add Upstream-Status to .patch files

Michael Opdenacker (1):
  maintainers.inc: update self e-mail address

Richard Purdie (1):
  oeqa/sdk/case: Ensure DL_DIR is populated with artefacts if used

Ross Burton (1):
  gawk: update patch status

Soumya Sambu (1):
  python3-idna: upgrade 3.6 -> 3.7

Trevor Gamblin (2):
  python3: skip test_concurrent_futures/test_deadlock
  python3: skip test_multiprocessing/test_active_children test

 .../hello-rs/0001-Greet-OE-Core.patch         |   2 +-
 .../devtool-patch-overrides/qemuarm/arm.patch |   2 +
 .../devtool-patch-overrides/qemux86/x86.patch |   2 +
 .../devtool-test-ignored.patch                |   2 +
 .../devtool-test-ignored.patch.expected       |   1 +
 ...nly-if-devtool-lets-me-to-do-it-corr.patch |   2 +
 ...vtool-lets-me-to-do-it-corr.patch.expected |   1 +
 ...d-a-note-line-to-the-quick-reference.patch |   2 +
 .../backported.patch                          |   2 +
 .../gitrepotest/0001-testpatch.patch          |   2 +
 .../man-db/files/0001-Test-patch-here.patch   |   2 +
 .../recipetool/files/add-file.patch           |   2 +
 meta/classes-recipe/cmake-qemu.bbclass        |   2 +-
 meta/classes-recipe/kernel.bbclass            |   6 +-
 meta/classes/archiver.bbclass                 |   3 +-
 meta/classes/cve-check.bbclass                |   6 +-
 meta/classes/multilib.bbclass                 |  87 +++----
 meta/classes/multilib_global.bbclass          |  25 +-
 meta/conf/distro/include/maintainers.inc      |  22 +-
 meta/lib/oeqa/runtime/cases/scp.py            |   2 +-
 meta/lib/oeqa/runtime/cases/systemd.py        |  20 +-
 meta/lib/oeqa/sdk/case.py                     |   9 +-
 meta/recipes-bsp/grub/grub2.inc               |   4 +
 ...1-libacpi-Fix-build-witth-fno-commom.patch |   2 +-
 meta/recipes-bsp/libacpi/files/ldflags.patch  |   3 +-
 .../libacpi/files/libacpi_fix_for_x32.patch   |   2 +-
 .../libacpi/files/makefile-fix.patch          |   2 +-
 ...e_correct_strip_in_cross_environment.patch |   2 +-
 .../ofono/ofono/CVE-2023-2794-0001.patch      |  38 +++
 .../ofono/ofono/CVE-2023-2794-0002.patch      |  33 +++
 .../ofono/ofono/CVE-2023-2794-0003.patch      |  45 ++++
 .../ofono/ofono/CVE-2023-2794-0004.patch      | 128 ++++++++++
 meta/recipes-connectivity/ofono/ofono_2.4.bb  |   4 +
 ...-notify-systemd-on-listen-and-reload.patch | 225 ++++++++++++++++++
 ...tional-support-for-systemd-sd_notify.patch |  99 --------
 ...igned-overflow-in-pointer-arithmatic.patch | 111 ---------
 .../openssh/openssh/sshd.service              |   2 +-
 .../openssh/openssh_9.6p1.bb                  |   5 +-
 .../glib-networking/eagain.patch              |   2 +-
 .../new_rt_path_for_test-driver.patch         |   2 +-
 .../0001-Add-support-for-riscv32-CPU.patch    |   2 +-
 .../0001-dpkg-Support-muslx32-build.patch     |   2 +-
 ...add-musleabi-to-known-target-tripets.patch |   2 +-
 .../dpkg/dpkg/add_armeb_triplet_entry.patch   |   2 +-
 meta/recipes-devtools/dpkg/dpkg/arch_pm.patch |   2 +-
 .../python/python3-attrs_23.2.0.bb            |   1 -
 ...ython3-idna_3.6.bb => python3-idna_3.7.bb} |   4 +-
 ...e-treat-overflow-in-UID-GID-as-failu.patch |  40 ++++
 ...ctive_children-skip-problematic-test.patch |  30 +++
 ...-test_deadlock-skip-problematic-test.patch |  30 +++
 .../python3/deterministic_imports.patch       |   2 +-
 .../recipes-devtools/python/python3_3.12.4.bb |   3 +
 ...001-m4-readline-add-missing-includes.patch |   2 +-
 meta/recipes-extended/gawk/gawk_5.3.0.bb      |   2 +
 .../iptables/iptables_1.8.10.bb               |   2 +
 .../pam/libpam/CVE-2024-22365.patch           |  65 +++++
 meta/recipes-extended/pam/libpam_1.5.3.bb     |   1 +
 .../0001-Fix-build-with-clang.patch           |   2 +-
 ...plicit-function-declaration-warnings.patch |   2 +-
 ...0001-Remove-fgets-extern-declaration.patch |   2 +-
 .../tcp-wrappers-7.6/00_man_quoting.diff      |   2 +-
 .../tcp-wrappers-7.6/01_man_portability.patch |   2 +-
 .../05_wildcard_matching.patch                |   2 +-
 .../06_fix_gethostbyname.patch                |   2 +-
 .../tcp-wrappers-7.6/10_usagi-ipv6.patch      |   2 +-
 .../tcp-wrappers-7.6/11_tcpd_blacklist.patch  |   2 +-
 .../tcp-wrappers-7.6/11_usagi_fix.patch       |   2 +-
 .../tcp-wrappers-7.6/12_makefile_config.patch |   2 +-
 .../tcp-wrappers-7.6/13_shlib_weaksym.patch   |   2 +-
 .../tcp-wrappers-7.6/14_cidr_support.patch    |   2 +-
 .../tcp-wrappers-7.6/15_match_clarify.patch   |   2 +-
 .../tcp-wrappers-7.6/expand_remote_port.patch |   2 +-
 .../tcp-wrappers-7.6/fix_warnings.patch       |   2 +-
 .../tcp-wrappers-7.6/fix_warnings2.patch      |   2 +-
 .../tcp-wrappers-7.6/have_strerror.patch      |   2 +-
 .../tcp-wrappers-7.6/ldflags.patch            |   2 +-
 .../makefile-fix-parallel.patch               |   2 +-
 .../tcp-wrappers-7.6/man_fromhost.patch       |   2 +-
 .../tcp-wrappers-7.6/musl-decls.patch         |   2 +-
 .../rename_strings_variable.patch             |   2 +-
 .../tcp-wrappers-7.6/restore_sigalarm.patch   |   2 +-
 .../tcp-wrappers/tcp-wrappers-7.6/rfc931.diff |   2 +-
 .../tcp-wrappers-7.6/safe_finger.patch        |   2 +-
 .../tcp-wrappers-7.6/sig_fix.patch            |   2 +-
 .../tcp-wrappers-7.6/siglongjmp.patch         |   2 +-
 .../tcp-wrappers-7.6/socklen_t.patch          |   2 +-
 .../tcp-wrappers-7.6/tcpdchk_libwrapped.patch |   2 +-
 .../0001-generate-glslang-pkg-config.patch    |   2 +-
 ...Include-libgen.h-for-basename-signat.patch |  13 +-
 .../{weston_13.0.0.bb => weston_13.0.1.bb}    |   2 +-
 .../ffmpeg/ffmpeg/CVE-2023-49502.patch        | 107 +++++++++
 .../ffmpeg/ffmpeg/CVE-2024-31578.patch        |  49 ++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |   2 +
 .../settings-daemon/files/addsoundkeys.patch  |  49 ----
 .../settings-daemon/settings-daemon_0.0.2.bb  |   8 +-
 scripts/lib/wic/plugins/source/bootimg-efi.py |   4 +-
 96 files changed, 990 insertions(+), 411 deletions(-)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2023-2794-0001.patch
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2023-2794-0002.patch
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2023-2794-0003.patch
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2023-2794-0004.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-notify-systemd-on-listen-and-reload.patch
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch
 rename meta/recipes-devtools/python/{python3-idna_3.6.bb => python3-idna_3.7.bb} (62%)
 create mode 100644 meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch
 create mode 100644 meta/recipes-extended/pam/libpam/CVE-2024-22365.patch
 rename meta/recipes-graphics/wayland/{weston_13.0.0.bb => weston_13.0.1.bb} (98%)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49502.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31578.patch
 delete mode 100644 meta/recipes-sato/settings-daemon/files/addsoundkeys.patch

-- 
2.34.1


