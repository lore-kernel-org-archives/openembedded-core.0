Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89761C636CC
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 14:18:40 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.13835.1676902717955663234
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 06:18:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=o66T6Mjx;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id s17so750836pgv.4
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 06:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5dt3nDi4Rmc5uFru1Z1WhCoxeQA5XoXuQQ3DXzFTO4I=;
        b=o66T6Mjxbb0ouQLJFydWp3EKSlyfkw0c+GK9s9iu2kfXB6PYDYgeeJzALbgqUyiq6R
         uH7EiDh20O2Sw7rjSNRPg0xUyKXxUbaRO3/ZIJTbKfx3rwVPTN3ZZQQrJvnYugjkh3oD
         K9S8tgCbc5B7S9Zr0jQxUSLay+/yEGAJBMG4wPeoTk18fAor0X6CEomUbYhUSzc8NO76
         I/7SKUhSI2EErnBjptBb/PKPazOui386mTY1oyQ9/0Un4RC4nZxNCxStPpbFssUBxTH9
         l9oDuPeYKDaGxyR8W/xKUquaqWkp2iiij3fwFJ5LJmFp/cWj06o7Ab+2GyBa+mDvRpyH
         WhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5dt3nDi4Rmc5uFru1Z1WhCoxeQA5XoXuQQ3DXzFTO4I=;
        b=zd95xM5Q6HZLhK7Pqvjvj0N806xRWdeWHjrWkeuJAFk/r9qn04KJBAnB4WvnYoWnz/
         hoDCgCetJOQSz+IwMl4psj17zVSi5sZJWzotBpkjtkqq21ej5ixRwi+vCR60kngxcgWE
         RGqE4oPKk/gDmk78tGw0rXFWJPxXGQvJu0U7HFlfPw/rWx20/90Y0KdgPJb7/fUKZvaD
         KigbJ1duUTTUWyLUk/4Up3vW/ICS3mSeWHh+shQQrJn6uAgjd4tVHBYqXA2GGE1EAyqS
         aeFGJKJIA+UmvmYE5ikpjEGBQtr/p6gIkEH7BM3irX12O76LQx66FWzqrMkgOqLhL8Fp
         1t5A==
X-Gm-Message-State: AO0yUKWffUcoTPMxB6OrCeQFam8XEEnZmnmdfvi+bzjSfDUro2ycAu9Y
	LHhi2fKHs+V646z5OGfSeJM0lWrHiEi6BjAmFpU=
X-Google-Smtp-Source: AK7set9dsk5OEEmpszhDQLf49Ls1AuLD7dLqLYsZqkDdMEEHSq1TD43dKZNjYNiVpB1SEOhXDz/zFg==
X-Received: by 2002:a05:6a00:368d:b0:5a8:1866:7cfe with SMTP id dw13-20020a056a00368d00b005a818667cfemr269605pfb.17.1676902716535;
        Mon, 20 Feb 2023 06:18:36 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id q19-20020a62e113000000b0058baf8694e1sm7789297pfh.71.2023.02.20.06.18.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 06:18:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 00/22] Patch review
Date: Mon, 20 Feb 2023 04:18:07 -1000
Message-Id: <cover.1676902605.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:18:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177406

Please review this set of patches for langdale and have comments bcak by
end of day Wednesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4944

The following changes since commit 62b894d75fb3361ed4d5473ae69188bce390980a:

  oeqa context.py: fix --target-ip comment to include ssh port number (2023-02-11 04:03:34 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/langdale-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/langdale-nut

Alexander Kanavin (10):
  diffutils: update 3.8 -> 3.9
  lttng-tools: update 2.13.8 -> 2.13.9
  apr: update 1.7.0 -> 1.7.2
  apr-util: update 1.6.1 -> 1.6.3
  bind: upgrade 9.18.10 -> 9.18.11
  libjpeg-turbo: upgrade 2.1.4 -> 2.1.5
  pkgconf: upgrade 1.9.3 -> 1.9.4
  linux-firmware: upgrade 20221214 -> 20230117
  sudo: upgrade 1.9.12p1 -> 1.9.12p2
  libgit2: upgrade 1.5.0 -> 1.5.1

Chen Qi (1):
  ffmpeg: fix configure failure on noexec /tmp host

Mauro Queiros (1):
  image.bbclass: print all QA functions exceptions

Mikko Rapeli (6):
  oeqa ssh.py: move output prints to new line
  oeqa ssh.py: add connection keep alive options to ssh client
  oeqa dump.py: add error counter and stop after 5 failures
  oeqa qemurunner: read more data at a time from serial
  oeqa qemurunner.py: add timeout to QMP calls
  oeqa qemurunner.py: try to avoid reading one character at a time

Peter Kjellerstedt (1):
  devshell: Do not add scripts/git-intercept to PATH

Rodolfo Quesada Zumbado (1):
  tar: CVE-2022-48303

Sakib Sajal (1):
  git: upgrade 2.37.5 -> 2.37.6

Ulrich Ölmann (1):
  update-alternatives: fix typos

 meta/classes-global/devshell.bbclass          |   2 -
 meta/classes-recipe/image.bbclass             |   2 +-
 .../update-alternatives.bbclass               |   6 +-
 meta/lib/oeqa/core/target/ssh.py              |   8 +-
 meta/lib/oeqa/utils/dump.py                   |  23 ++-
 meta/lib/oeqa/utils/qemurunner.py             |   9 +-
 ...1-avoid-start-failure-with-bind-user.patch |   0
 ...d-V-and-start-log-hide-build-options.patch |   0
 ...ching-for-json-headers-searches-sysr.patch |   0
 .../bind/{bind-9.18.10 => bind-9.18.11}/bind9 |   0
 .../{bind-9.18.10 => bind-9.18.11}/conf.patch |   0
 .../generate-rndc-key.sh                      |   0
 ...t.d-add-support-for-read-only-rootfs.patch |   0
 .../make-etc-initd-bind-stop-work.patch       |   0
 .../named.service                             |   0
 .../bind/{bind_9.18.10.bb => bind_9.18.11.bb} |   4 +-
 .../git/{git_2.37.5.bb => git_2.37.6.bb}      |   2 +-
 .../{pkgconf_1.9.3.bb => pkgconf_1.9.4.bb}    |   2 +-
 ...001-Skip-strip-trailing-cr-test-case.patch |  11 +-
 ...a-standard-layout-so-glibc-and-musl-.patch |  33 -----
 .../{diffutils_3.8.bb => diffutils_3.9.bb}    |   3 +-
 .../{sudo_1.9.12p1.bb => sudo_1.9.12p2.bb}    |   2 +-
 .../tar/tar/CVE-2022-48303.patch              |  43 ++++++
 meta/recipes-extended/tar/tar_1.34.bb         |   4 +-
 ...-turbo_2.1.4.bb => libjpeg-turbo_2.1.5.bb} |   2 +-
 ...20221214.bb => linux-firmware_20230117.bb} |   6 +-
 .../lttng/lttng-tools/determinism.patch       |  64 ---------
 ...-tools_2.13.8.bb => lttng-tools_2.13.9.bb} |   3 +-
 .../recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb |   2 +
 .../0001-Fix-error-handling-in-gdbm.patch     | 134 ------------------
 .../{apr-util_1.6.1.bb => apr-util_1.6.3.bb}  |   6 +-
 ...ion-to-disable-timed-dependant-tests.patch |  20 +--
 ...CHE_CHECK-for-strerror_r-return-type.patch |  52 -------
 ...-runtime-test-for-mmap-that-can-map-.patch |  26 ++--
 ...ir-path-references-from-installed-ap.patch |  25 ++--
 ...configure.in-support-cross-compiling.patch |  63 --------
 ...ze-doesn-t-match-in-glibc-when-cross.patch |  76 ----------
 .../apr/apr/CVE-2021-35940.patch              |  58 --------
 .../recipes-support/apr/apr/autoconf270.patch |  22 ---
 .../apr/apr/libtoolize_check.patch            |  21 ++-
 .../apr/{apr_1.7.0.bb => apr_1.7.2.bb}        |   8 +-
 .../{libgit2_1.5.0.bb => libgit2_1.5.1.bb}    |   4 +-
 42 files changed, 157 insertions(+), 589 deletions(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.10.bb => bind_9.18.11.bb} (96%)
 rename meta/recipes-devtools/git/{git_2.37.5.bb => git_2.37.6.bb} (98%)
 rename meta/recipes-devtools/pkgconf/{pkgconf_1.9.3.bb => pkgconf_1.9.4.bb} (96%)
 delete mode 100644 meta/recipes-extended/diffutils/diffutils/0001-mcontext-is-not-a-standard-layout-so-glibc-and-musl-.patch
 rename meta/recipes-extended/diffutils/{diffutils_3.8.bb => diffutils_3.9.bb} (88%)
 rename meta/recipes-extended/sudo/{sudo_1.9.12p1.bb => sudo_1.9.12p2.bb} (96%)
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2022-48303.patch
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_2.1.4.bb => libjpeg-turbo_2.1.5.bb} (97%)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20221214.bb => linux-firmware_20230117.bb} (99%)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/determinism.patch
 rename meta/recipes-kernel/lttng/{lttng-tools_2.13.8.bb => lttng-tools_2.13.9.bb} (98%)
 delete mode 100644 meta/recipes-support/apr/apr-util/0001-Fix-error-handling-in-gdbm.patch
 rename meta/recipes-support/apr/{apr-util_1.6.1.bb => apr-util_1.6.3.bb} (94%)
 delete mode 100644 meta/recipes-support/apr/apr/0001-add-AC_CACHE_CHECK-for-strerror_r-return-type.patch
 delete mode 100644 meta/recipes-support/apr/apr/0003-Makefile.in-configure.in-support-cross-compiling.patch
 delete mode 100644 meta/recipes-support/apr/apr/0006-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
 delete mode 100644 meta/recipes-support/apr/apr/CVE-2021-35940.patch
 delete mode 100644 meta/recipes-support/apr/apr/autoconf270.patch
 rename meta/recipes-support/apr/{apr_1.7.0.bb => apr_1.7.2.bb} (91%)
 rename meta/recipes-support/libgit2/{libgit2_1.5.0.bb => libgit2_1.5.1.bb} (78%)

-- 
2.34.1


