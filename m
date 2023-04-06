Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47EB6C761A6
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 16:02:06 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.162485.1680796920610777600
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 09:02:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=TlJWtCKW;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id u38so26061763pfg.10
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 09:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680796919; x=1683388919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iJ/7tjJYQnkEKPgNfNV0tx9uNB6tNOaj/O08jdMjbHM=;
        b=TlJWtCKWnfc0zPApl3WkC0r0vCuhgcuUzwo3ADvAygo9pvBDsUynjEH85grw2VW1UW
         ejPYFKhu01sIeokoWHWFJ2z14VbMtOtW+ECZPlR7BVHM29jYzamDvkwVVpyi513YPpIA
         h5GAZGAsc1/iqIQasrnfKQboIRtXk6Nrh+9HFB1ht/LQJE4n4psWUuO88vIuNMbU4SH2
         uPWb2VyWcPQvYf+vmCkD5awMxGIe7CynPRhkyZNtm9F3ZfAljXNigkP+bi2vTEQsYQW9
         WTaJAj3k9K1bAEADXrLvgG4EsVoZwCkwHNFezVJKx/FTbkA7r07QNV/7DdcK6ZpQ5wA2
         Nf1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680796919; x=1683388919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iJ/7tjJYQnkEKPgNfNV0tx9uNB6tNOaj/O08jdMjbHM=;
        b=H64we2yfaFxEw1hMLkoJ9ntr/+oGvkBdHMDw2bySepxJwat3H/GTLXF8CUbG2SSky3
         0Gt8BoW+LhmDqk0CakWa/ghDUrVMNi2oiQ6B4ZuI30y8JBKMTtIenc0iH/nketmUNC8/
         NmGHPphkA07Sxkgwxu3t3zOqJAoG+4asowkzFGa4GB72eJ/A4sEisxwIElfXJVNquKC2
         Es+lD9jSshla5UCjTlZjLv0lmvCTiDQciJJt6svI23cKhHsiD6XLbE7JfVE6LMKl17v1
         TD6YzcYWCq9B9xdHuukWI4sgD9ruzciCdadYGQIQ9Cxdx6+KNd1AWu7g2GbJOxGqz5SI
         BviQ==
X-Gm-Message-State: AAQBX9fuJeaGNQGmm8olLHPfo+qpug/8ui/fT5wakXeHuGrc8Xm1wtG4
	3e8jjB7eXPlxSoGjSGUumY78wOTheJ1HePqqQWg=
X-Google-Smtp-Source: AKy350aj6d90J1/uVtN/8yuqk6MWFj46Y0RB8VwjXncQMBCDlAOZV5sdFb2QQGPCtqZol6VRaNTnfQ==
X-Received: by 2002:a62:1b0b:0:b0:627:ede2:89ee with SMTP id b11-20020a621b0b000000b00627ede289eemr9124411pfb.25.1680796919257;
        Thu, 06 Apr 2023 09:01:59 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7870d000000b0062e26487e7esm1532588pfo.155.2023.04.06.09.01.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 09:01:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 00/26] Patch review
Date: Thu,  6 Apr 2023 06:01:27 -1000
Message-Id: <cover.1680796770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 16:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179778

Please review this set of patches for langdale and have comments back by
end of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5152

The following changes since commit 6c9ca2f2de98c84d11beccbfde7c1e26cb25dfb6:

  scripts/lib/buildstats: handle top-level build_stats not being complete (2023-03-30 04:10:26 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/langdale-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/langdale-nut

Andrew Geissler (1):
  filemap.py: enforce maximum of 4kb block size

Arturo Buzarra (1):
  run-postinsts: Set dependency for ldconfig to avoid boot issues

Enrico Jörns (7):
  oeqa/selftest/cases/runqemu: update imports
  oeqa/targetcontrol: fix misspelled RuntimeError
  oeqa/targetcontrol: do not set dump_host_cmds redundantly
  oeqa/targetcontrol: remove unused imports
  oeqa/utils/commands: fix usage of undefined EPIPE
  oeqa/utils/commands: remove unused imports
  oeqa/utils/qemurunner: replace hard-coded user 'root' in debug output

Fawzi KHABER (2):
  package.bbclass: check packages name conflict in do_package
  oeqa/selftest/cases/package.py: adding unittest for package rename
    conflicts

Jose Quaresma (3):
  oeqs/selftest: OESelftestTestContext: replace the os.environ after
    subprocess.check_output
  oeqa/selftest: OESelftestTestContext: convert relative to full path
    when newbuilddir is provided
  oeqa/selftest/reproducible: Split different packages from missing
    packages output

Khem Raj (1):
  Revert "runqemu: Add workaround for APIC hang on pre 4.15 kernels on
    qemux86"

Martin Jansa (3):
  selftest: runqemu: better check for ROOTFS: in the log
  selftest: runqemu: use better error message when asserts fail
  runqemu: respect IMAGE_LINK_NAME

Michael Halstead (1):
  uninative: Upgrade to 3.9 to include glibc 2.37

Mingli Yu (1):
  report-error: catch Nothing PROVIDES error

Richard Purdie (2):
  xdg-utils: Add a patch for CVE-2020-27748
  xdg-utils: Fix CVE number

Ross Burton (2):
  tzdata: upgrade to 2023c
  oeqa/runtime: clean up deprecated backslash expansion

Soumya (1):
  shadow: Fix can not print full login timeout message

Tobias Hagelborn (1):
  lib/oe/gpg_sign.py: Avoid race when creating .sig files in detach_sign

 .../packagenameconflict.bb                    |  10 +
 meta/classes-global/package.bbclass           |   9 +
 meta/classes-recipe/testimage.bbclass         |   2 +-
 meta/classes/report-error.bbclass             |  27 +-
 meta/conf/distro/include/yocto-uninative.inc  |  10 +-
 meta/lib/oe/gpg_sign.py                       |  27 +-
 meta/lib/oeqa/runtime/cases/apt.py            |   4 +-
 meta/lib/oeqa/runtime/cases/buildcpio.py      |   7 +-
 meta/lib/oeqa/runtime/cases/systemd.py        |   2 +-
 meta/lib/oeqa/selftest/cases/package.py       |   7 +
 meta/lib/oeqa/selftest/cases/reproducible.py  |  10 +-
 meta/lib/oeqa/selftest/cases/runqemu.py       |  16 +-
 meta/lib/oeqa/selftest/context.py             |  20 +-
 meta/lib/oeqa/targetcontrol.py                |   8 +-
 meta/lib/oeqa/utils/commands.py               |   6 +-
 meta/lib/oeqa/utils/qemurunner.py             |   4 +-
 .../run-postinsts/run-postinsts.service       |   2 +-
 .../0001-Fix-can-not-print-full-login.patch   |  41 +++
 meta/recipes-extended/shadow/shadow.inc       |   1 +
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 .../timezone/tzcode-native.bb                 |   2 -
 ...0001-Fix-C23-related-conformance-bug.patch | 301 ------------------
 .../xdg-utils/xdg-utils/CVE-2022-4055.patch   | 145 +++++++++
 .../xdg-utils/xdg-utils_1.1.3.bb              |   1 +
 scripts/lib/wic/filemap.py                    |   7 +
 scripts/runqemu                               |  74 +++--
 26 files changed, 371 insertions(+), 378 deletions(-)
 create mode 100644 meta-selftest/recipes-test/packagenameconflict/packagenameconflict.bb
 create mode 100644 meta/recipes-extended/shadow/files/0001-Fix-can-not-print-full-login.patch
 delete mode 100644 meta/recipes-extended/timezone/tzcode/0001-Fix-C23-related-conformance-bug.patch
 create mode 100644 meta/recipes-extended/xdg-utils/xdg-utils/CVE-2022-4055.patch

-- 
2.34.1


