Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF37ECA0EDE
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 13:53:38 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.25658.1694526815667945929
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 06:53:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=AuEYMbYc;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1c1e3a4a06fso40551645ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 06:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694526815; x=1695131615; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uPkVnW8mGrOgtCLr7p66HiHL3eTvkQVFUkP8cPMXThA=;
        b=AuEYMbYcp/HvXVQCSyQslTUI3DOTYHPuoOdVcEx5ZF6LfsxdZcmSYu4Fh2LLRvSROs
         ZgB7Ff4SwiaY6dilF+sClIl2SrzmsNA6+AYouJysciYhT0cqNhyo9URwnEC+cq6+RS7M
         ZYoVVIyvKL6hEMURhcAI2g6jDbUpbjC7eZ4/uYP7qnw7k8Dw/K/qUIetx7VkkM59yRjP
         pAqCE0Aw0aGGbucoSn71MY0DCblZHedB7JpFOAJkE6L1VNyu1pXGg5QZwpSdE3I0h1Xx
         NrYrKLmNSOivicoG4QOrPhLJ7l3BcdSmi7l7p11NXkppFzQe2ki7jqT1HVNrAcWgp5qp
         qXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694526815; x=1695131615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uPkVnW8mGrOgtCLr7p66HiHL3eTvkQVFUkP8cPMXThA=;
        b=G2luGwoP6Oz66FMTHTtLYrcs4muM1jegrsS3sxIGGPg+JcILOWKJV4dLx7VPBAz4YR
         7dfCJJ6/ocljFR9jHKDiJygZefqX55mbzWnA81wU1re5s3mgUrPy2NHasyzLz+ij5CbM
         THDGP68Dk7YIngzvR/moxGyFGFbd7vCGkdihJtvyd5crpExxh27hABEgfTAPIttBRo3k
         9O3N3o6neAzYdZ+2eNklXWRTarWysHosmb7PiO8+otS9k8gi3jNeMsF4b7jqREeaV/k2
         FmxwXOgsYVsJVM2ck6/yAgeEkfqJyo2PzA7t6oTr4l7jcnt1/h+/x8BuqatkvfCx3e09
         oKUw==
X-Gm-Message-State: AOJu0Yzdsc8ETn0nsqRDt6hlRiUcOxY+TPybw639X/XiDc1IBzLlNHpr
	mRTgQjmhdYRAQcscFCn/HfcUeubbPE+64+zbEBs=
X-Google-Smtp-Source: AGHT+IF+ZsUNn7BkrPhYtAs53iXJsAKGF0YHERXc1uTfZDu+6gYeTBN+x4D+cVzh+Mdfawd3m9N09Q==
X-Received: by 2002:a17:902:eec6:b0:1c3:a2ea:64d3 with SMTP id h6-20020a170902eec600b001c3a2ea64d3mr6051662plb.41.1694526814523;
        Tue, 12 Sep 2023 06:53:34 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j7-20020a170902da8700b001bdeedd8579sm7635246plx.252.2023.09.12.06.53.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 06:53:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/14] Patch review
Date: Tue, 12 Sep 2023 03:53:09 -1000
Message-Id: <cover.1694526588.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 13:53:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187515

Please review this set of changes for dunfell and have comments back by
end of day Thursday, September 14.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5868

The following changes since commit c953ccba6c2a334cc58a97eee073bdb51a68f1d3:

  linux/cve-exclusion: remove obsolete manual entries (2023-08-31 04:26:32 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Anuj Mittal (4):
  glibc/check-test-wrapper: don't emit warnings from ssh
  selftest/cases/glibc.py: increase the memory for testing
  oeqa/utils/nfs: allow requesting non-udp ports
  selftest/cases/glibc.py: switch to using NFS over TCP

Ashish Sharma (1):
  qemu: Backport fix CVE-2023-3180

Michael Halstead (2):
  yocto-uninative: Update to 4.3
  resulttool/resultutils: allow index generation despite corrupt json

Priyal Doshi (1):
  rootfs-post: remove traling blanks from tasks

Richard Purdie (2):
  oeqa/target/ssh: Ensure EAGAIN doesn't truncate output
  oeqa/runtime/ltp: Increase ltp test output timeout

Shubham Kulkarni (1):
  openssh: Securiry fix for CVE-2023-38408

Staffan Rydén (1):
  kernel: Fix path comparison in kernel staging dir symlinking

Vijay Anusuri (2):
  bind: Backport fix for CVE-2023-2828
  qemu: Backport fix for CVE-2023-0330

 meta/classes/kernel.bbclass                   |   7 +-
 meta/classes/rootfs-postcommands.bbclass      |   6 +-
 meta/classes/rootfsdebugfiles.bbclass         |   2 +-
 meta/conf/distro/include/yocto-uninative.inc  |   8 +-
 meta/lib/oeqa/core/target/ssh.py              |   3 +
 meta/lib/oeqa/runtime/cases/ltp.py            |   2 +-
 meta/lib/oeqa/selftest/cases/glibc.py         |   6 +-
 meta/lib/oeqa/utils/nfs.py                    |   4 +-
 .../bind/bind/CVE-2023-2828.patch             | 166 +++++
 .../recipes-connectivity/bind/bind_9.11.37.bb |   1 +
 .../openssh/openssh/CVE-2023-38408-01.patch   | 189 ++++++
 .../openssh/openssh/CVE-2023-38408-02.patch   | 581 ++++++++++++++++++
 .../openssh/openssh/CVE-2023-38408-03.patch   | 171 ++++++
 .../openssh/openssh/CVE-2023-38408-04.patch   |  34 +
 .../openssh/openssh/CVE-2023-38408-05.patch   | 194 ++++++
 .../openssh/openssh/CVE-2023-38408-06.patch   |  73 +++
 .../openssh/openssh/CVE-2023-38408-07.patch   | 125 ++++
 .../openssh/openssh/CVE-2023-38408-08.patch   | 315 ++++++++++
 .../openssh/openssh/CVE-2023-38408-09.patch   |  38 ++
 .../openssh/openssh/CVE-2023-38408-10.patch   |  39 ++
 .../openssh/openssh/CVE-2023-38408-11.patch   | 307 +++++++++
 .../openssh/openssh/CVE-2023-38408-12.patch   | 120 ++++
 .../openssh/openssh_8.2p1.bb                  |  12 +
 .../glibc/glibc/check-test-wrapper            |   2 +-
 meta/recipes-devtools/qemu/qemu.inc           |   4 +-
 ...-2023-0330.patch => CVE-2023-0330_1.patch} |   0
 .../qemu/qemu/CVE-2023-0330_2.patch           | 135 ++++
 .../qemu/qemu/CVE-2023-3180.patch             |  49 ++
 scripts/lib/resulttool/resultutils.py         |   6 +-
 29 files changed, 2579 insertions(+), 20 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2023-2828.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-01.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-02.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-03.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-04.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-05.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-06.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-07.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-08.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-09.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-10.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-11.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-12.patch
 rename meta/recipes-devtools/qemu/qemu/{CVE-2023-0330.patch => CVE-2023-0330_1.patch} (100%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-0330_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3180.patch

-- 
2.34.1


