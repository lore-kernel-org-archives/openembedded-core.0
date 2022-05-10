Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A3BC433EF
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:37:35 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web08.10720.1652193453519451649
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:37:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=7vAAEp6g;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id e24so16054192pjt.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DLxHzmy8mosGOBN08UI5n04hAXXUBOuptYYOBnJMKXM=;
        b=7vAAEp6gdW2JdpFw7JbWSJKxsWoBZVOoJfl0Svm82TLpUjeVdcRJtCpwkZ2wzALMD/
         W90d1P2MDR9GvkRxnKHWT1smQJ4jg0lMw2t8OlgutbLXke0/482ygz0WYTh0avqYm+5g
         by/UmvTLqLGq0w11dKUBQLIAA3pL0WpEXqeLMCGmiiN5Sp2K32nRt51YLBHpyIGx++VF
         8xYnrPvUxTuBj+NyD8tFhCc+PdOyPEZoH6QciDGE43ThEzDTAAuLO1EMPECgjJaBYf2w
         e++SKmy42RVEuoy2BfbsKpicRC6/Dcfj1LoawCa8iNEreAJfGr3pI68VuY5HoLtJZEiG
         WaZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DLxHzmy8mosGOBN08UI5n04hAXXUBOuptYYOBnJMKXM=;
        b=M+fgkdgVyX3aYiS/8QY0pE+IlhL8e4LJdqjJ80SOoRoepuFJuQeyVJn/gadm9xpWIx
         VeXo7oN0Sw+GeTMs1FVTXF4ZT5Q8OWdhsJWHLnin/kjs7xizxatCTY9n50FrcBzkQ4xD
         FO1IV9wDNEuF0QiZXlGX5FbR9bUS2Euv5+BtnREPjWyW+ZVhacstChUelSJzOXqdr0ey
         vyqaaF/cQN7EM/qxR2L6cZpweH2fVO3SaKS0SSKTol/2ILgoFU+Y53jD2fwuUydpqp3b
         zMH8x+h+iNUkhbx/qayVVzKyAnApYKABc7QwquSUpxKm0M3mzlyeSNKZ3LNQwvE/bIEX
         R69w==
X-Gm-Message-State: AOAM533CIBhNlel4QZkUKGZSdbiEU9tWn5W151hsfgazGndkiqIH1/Nq
	3Pp2XR+l7A0JIC3Rr+9Mh4eNoUX4YeA4TVxO
X-Google-Smtp-Source: 
 ABdhPJzfvsfPBYrTuwEl7nD0tGjQ2eIbJy9CbU+ARQd6pibKQmvUFnRpuNgCPXeA5QlphNX3pDegaw==
X-Received: by 2002:a17:90a:a384:b0:1dc:a407:b5ac with SMTP id
 x4-20020a17090aa38400b001dca407b5acmr303508pjp.11.1652193451994;
        Tue, 10 May 2022 07:37:31 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.37.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:37:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/40] Patch review
Date: Tue, 10 May 2022 04:36:39 -1000
Message-Id: <cover.1652192957.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 14:37:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165417

Please review this set of patches for kirkstone and have comments back by
end of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3642

except for a known intermittent issue on the qemumips-alt test, which
passed on subsequent retest:

https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/3028

The following changes since commit 87d7383989a1ef6deaeff85739e622d8175ae9b6:

  libxml2: update patch status (2022-04-29 05:27:54 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Bruce Ashfield (16):
  linux-yocto/5.10: update to v5.10.110
  linux-yocto/5.10: base: enable kernel crypto userspace API
  linux-yocto/5.10: update to v5.10.112
  linux-yocto/5.15: arm: poky-tiny cleanup and fixes
  linux-yocto/5.15: update to v5.15.33
  linux-yocto/5.15: base: enable kernel crypto userspace API
  linux-yocto/5.15: kasan: fix BUG: sleeping function called from
    invalid context
  linux-yocto/5.15: fix ppc boot
  linux-yocto/5.15: netfilter: conntrack: avoid useless indirection
    during conntrack destruction
  linux-yocto/5.15: update to v5.15.35
  linux-yocto/5.15: Fix CVE-2022-28796
  linux-yocto: enable powerpc debug fragment
  linux-yocto/5.15: fix -standard kernel build issue
  linux-yocto/5.15: update to v5.15.36
  linux-yocto/5.15: fix qemuarm graphical boot
  strace: fix ptest failure in landlock

Chen Qi (1):
  go-helloworld: remove unused GO_WORKDIR

Davide Gardenal (3):
  cve-check: add JSON format to summary output
  cve-check: fix symlinks where link and output path are equal
  rootfs-postcommands: fix symlinks where link and output path are equal

Jon Mason (1):
  poky-tiny: enable qemuarmv5/qemuarm64 and cleanups

Justin Bronder (1):
  pulseaudio: conditionally depend on alsa-plugins-pulseaudio-conf

Khem Raj (3):
  kmod: Enable xz support by default
  qemu: Add packageconfig for libbpf support
  linux-yocto: Enable powerpc-debug fragment for ppc64 LE

Marta Rybczynska (2):
  cve-update-db-native: update the CVE database once a day only
  cve-update-db-native: let the user to drive the update interval

Peter Marko (1):
  openssl: extract legacy provider module to a separate package

Portia (1):
  volatile-binds: Change DefaultDependencies from false to no

Richard Purdie (6):
  lib/sstatesig: Fix find_siginfo to match sstate filename generation
  base: Avoid circular references to our own scripts
  scripts: Make git intercept global
  scripts/git: Ensure we don't have circular references
  package: Ensure we track whether PRSERV was active or not
  abi_version/sstate: Bump hashequiv and sstate versions due to git
    changes

Robert Joslyn (1):
  powerpc: Remove invalid GLIBC_EXTRA_OECONF

Ross Burton (3):
  cve-check: no need to depend on the fetch task
  oeqa/selftest: add test for git working correctly inside pseudo
  Revert "bitbake.conf: mark all directories as safe for git to read"

Steve Sakoman (1):
  scripts/contrib/oe-build-perf-report-email.py: remove obsolete check
    for phantomjs and optipng

 .../git-submodule-test/git-submodule-test.bb  | 15 ++++
 meta/classes/base.bbclass                     |  4 ++
 meta/classes/cve-check.bbclass                | 72 ++++++++++++-------
 meta/classes/package.bbclass                  |  3 +
 meta/classes/rootfs-postcommands.bbclass      | 14 ++--
 meta/classes/sstate.bbclass                   |  2 +-
 meta/conf/abi_version.conf                    |  2 +-
 meta/conf/bitbake.conf                        |  8 ---
 .../machine/include/powerpc/tune-ppc603e.inc  |  3 -
 .../machine/include/powerpc/tune-ppc7400.inc  |  3 -
 .../include/powerpc/tune-ppce300c3.inc        |  3 -
 .../include/powerpc/tune-ppce500mc.inc        |  3 -
 .../machine/include/powerpc/tune-ppce5500.inc |  3 -
 .../machine/include/powerpc/tune-ppce6500.inc |  4 --
 meta/lib/oe/sstatesig.py                      |  4 +-
 meta/lib/oeqa/selftest/cases/git.py           | 15 ++++
 .../openssl/openssl_3.0.2.bb                  |  5 +-
 .../recipes-core/meta/cve-update-db-native.bb | 12 +++-
 .../files/volatile-binds.service.in           |  2 +-
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...0001-landlock-update-expected-string.patch | 67 +++++++++++++++++
 meta/recipes-devtools/strace/strace_5.16.bb   |  1 +
 .../go-examples/go-helloworld_0.1.bb          |  2 +-
 meta/recipes-kernel/kmod/kmod_29.bb           |  2 +-
 .../linux/linux-yocto-rt_5.10.bb              |  6 +-
 .../linux/linux-yocto-rt_5.15.bb              |  6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +--
 .../linux/linux-yocto-tiny_5.15.bb            | 10 ++-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 27 +++----
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 29 ++++----
 .../pulseaudio/pulseaudio.inc                 |  2 +-
 scripts/contrib/oe-build-perf-report-email.py | 13 ----
 scripts/{git-intercept => }/git               |  9 ++-
 33 files changed, 233 insertions(+), 127 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/git.py
 create mode 100644 meta/recipes-devtools/strace/strace/0001-landlock-update-expected-string.patch
 rename scripts/{git-intercept => }/git (52%)

-- 
2.25.1


