Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CAC6C636D7
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 14:41:17 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.43524.1676990472865455919
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 06:41:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=NKtJ5NoT;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id cb13so2586028pfb.5
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 06:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rLITJ/3Kfz7DqaSUmkjoEcK9E9MoTdskssOZcJMenA4=;
        b=NKtJ5NoT6m6GOYRFt3bjDdpYwnFGe4bkI/6nX1mUVPZbycz/BLoZvJdP1EHzmzksOG
         qFHx5r7QwQIXQkKDwLrwyf6Gz6SxYhdAl6iDUUGWhPsHsgo6RbZqBuL7SifiguKBO3pf
         YuUb6k6B0ENM045kqnsn/lZa2D/G2jPl9h2aL5e0sZ2ABZnghzCb7VlcvT3/UfxYxR/o
         /LGM3HRH82jmSiZl7IghpMaksPklR6A4HvmAVYksjV9rNYcoq9pRxh/FgJzG4jHcY6TD
         QzmyqHPSTBkhs9BUTMzt03J8nrD74SKMiqUK/MH1NsG7Ws+0ZlubmimBBKNH6FIh233d
         4aeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rLITJ/3Kfz7DqaSUmkjoEcK9E9MoTdskssOZcJMenA4=;
        b=LhPUPtd6xHDKgMWZewbaSX8Z2kbAdqZrrENNNsmfxdObWtXZpjSpcXyZ+14Av04fXD
         E4UbnSnsOGHFnQ63GMN2kvPkQeE/zM+ilqD7nXujSb0l9cCIzB5ffBQi16CnpQFnt2XB
         iq8JH9K39bK8e8kGfBwgDCEB0ukdPaS9esiv2U2Z7zc3fHAMTHU5BdyhHRpJuDoSwjv5
         lHl2tnXwzPMs/NhIjd6142W5dAAouA+CP2vevZWE0uubCXIPUR6tLXFBKTq4hPx0N7ZR
         9G9A+8jQD+FxqvGZwt4rgF+PnO8oCnZZZdXh2J6omf0RLZxgHzb/1d8uGEA2oi/MDhz8
         xKiw==
X-Gm-Message-State: AO0yUKU0Cpb2AYAWxkg6Y6AYF/dRblfLgh62Lx2MmCeJ78ieP7+7qOXq
	0FTXBkPd4LLbp7CbRBd/7nnVUBqGfDOnvh30Plk=
X-Google-Smtp-Source: AK7set+d4+q9pCqKB4enyquAfNXRYpomZzQDKkC9G0fQp6VJT7ahxo/OwNFmnYIoHvZHn3AX6cSEmg==
X-Received: by 2002:a62:38d3:0:b0:5a8:d987:d012 with SMTP id f202-20020a6238d3000000b005a8d987d012mr4246720pfa.11.1676990471337;
        Tue, 21 Feb 2023 06:41:11 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h5-20020a62b405000000b005ae8e94b0d5sm6151140pfn.107.2023.02.21.06.41.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 06:41:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/23] Patch review
Date: Tue, 21 Feb 2023 04:40:43 -1000
Message-Id: <cover.1676990336.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 14:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177500

Please review this set of patches for kirkstone and have comments back by
end of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4951

The following changes since commit 54c30e509074073b99a7a8890482ba1af2abbab9:

  oeqa context.py: fix --target-ip comment to include ssh port number (2023-02-11 04:06:51 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexander Kanavin (8):
  diffutils: update 3.8 -> 3.9
  lttng-tools: update 2.13.8 -> 2.13.9
  apr: update 1.7.0 -> 1.7.2
  apr-util: update 1.6.1 -> 1.6.3
  bind: upgrade 9.18.10 -> 9.18.11
  libjpeg-turbo: upgrade 2.1.4 -> 2.1.5
  linux-firmware: upgrade 20221214 -> 20230117
  sudo: upgrade 1.9.12p1 -> 1.9.12p2

Alexandre Belloni (1):
  oeqa/selftest/bbtests: Update message lookup for
    test_git_unpack_nonetwork_fail

Kai Kang (1):
  qemu: fix compile error

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
  git: upgrade 2.35.6 -> 2.35.7

Steve Sakoman (2):
  libgit2: uprade 1.4.3 -> 1.4.4
  libgit2: upgrade 1.4.4 -> 1.4.5

Ulrich Ölmann (1):
  update-alternatives: fix typos

 meta/classes/devshell.bbclass                 |   2 -
 meta/classes/image.bbclass                    |   2 +-
 meta/classes/update-alternatives.bbclass      |   6 +-
 meta/lib/oeqa/core/target/ssh.py              |   8 +-
 meta/lib/oeqa/selftest/cases/bbtests.py       |   2 +-
 meta/lib/oeqa/utils/dump.py                   |  23 +-
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
 .../git/{git_2.35.6.bb => git_2.35.7.bb}      |   2 +-
 meta/recipes-devtools/qemu/qemu.inc           |   2 +
 ...ave-qxl_log_command-Return-early-if-.patch |  57 +++++
 ...ass-requested-buffer-size-to-qxl_phy.patch | 217 ++++++++++++++++++
 ...001-Skip-strip-trailing-cr-test-case.patch |  11 +-
 ...a-standard-layout-so-glibc-and-musl-.patch |  33 ---
 .../{diffutils_3.8.bb => diffutils_3.9.bb}    |   3 +-
 .../{sudo_1.9.12p1.bb => sudo_1.9.12p2.bb}    |   2 +-
 .../tar/tar/CVE-2022-48303.patch              |  43 ++++
 meta/recipes-extended/tar/tar_1.34.bb         |   4 +-
 ...-turbo_2.1.4.bb => libjpeg-turbo_2.1.5.bb} |   2 +-
 ...20221214.bb => linux-firmware_20230117.bb} |   6 +-
 .../lttng/lttng-tools/determinism.patch       |  64 ------
 ...-tools_2.13.8.bb => lttng-tools_2.13.9.bb} |   3 +-
 .../0001-Fix-error-handling-in-gdbm.patch     | 134 -----------
 .../{apr-util_1.6.1.bb => apr-util_1.6.3.bb}  |   6 +-
 ...ion-to-disable-timed-dependant-tests.patch |  20 +-
 ...CHE_CHECK-for-strerror_r-return-type.patch |  52 -----
 ...-runtime-test-for-mmap-that-can-map-.patch |  26 +--
 ...ir-path-references-from-installed-ap.patch |  25 +-
 ...configure.in-support-cross-compiling.patch |  63 -----
 ...ze-doesn-t-match-in-glibc-when-cross.patch |  76 ------
 .../apr/apr/CVE-2021-35940.patch              |  58 -----
 .../recipes-support/apr/apr/autoconf270.patch |  22 --
 .../apr/apr/libtoolize_check.patch            |  21 +-
 .../apr/{apr_1.7.0.bb => apr_1.7.2.bb}        |   8 +-
 .../{libgit2_1.4.3.bb => libgit2_1.4.5.bb}    |   2 +-
 44 files changed, 430 insertions(+), 588 deletions(-)
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
 rename meta/recipes-devtools/git/{git_2.35.6.bb => git_2.35.7.bb} (98%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Have-qxl_log_command-Return-early-if-.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch
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
 rename meta/recipes-support/libgit2/{libgit2_1.4.3.bb => libgit2_1.4.5.bb} (91%)

-- 
2.34.1


