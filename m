Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6572BC04A94
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 16:24:43 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.138745.1692116674708655417
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 09:24:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=qW19txO8;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1bc5acc627dso37104485ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 09:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692116673; x=1692721473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cjt4zwcK5ZoGoR99aBoa1JuYHfm/EqAmPG42UTeA9pI=;
        b=qW19txO8skC1SxvDhu+q3Wgy0pbbBCD0d34wlR5t+FUlFRYPKCq7XCYdbaHwM5Piaw
         GVnUuZmgJ8mMf/zrDu0pi6E1OKp7piMTPt3Yl7diVS4LBY62Y96o/hx9ko+zdMQI0G81
         bUsN4o45Rpp8YKjH6m+/BF80I5Us8XGappj/MD9L/Lr3tt/UJasZRfFAE9zYKFXCgbnp
         8UPxrJIZfWunB4f9DodbL8XeLnBxLKafK+1RNwYH8MtysfPUKqaqd31e/H6PN1GJ4Cyq
         PMriXPAimj+kQH0xamjzyeXbw15hR9ZoxgPArZKUnNecux9lpePcHDnQ5Zql9SJMPmau
         Cb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692116673; x=1692721473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cjt4zwcK5ZoGoR99aBoa1JuYHfm/EqAmPG42UTeA9pI=;
        b=NPwAsRRoqpW7pqI6YmYePi8pZE3EYNlpvGho9xadLDgFF7JHkkfDQUjbHqBkKY+eIl
         O5UfCT1W0wiLu9BxMjIekUWSRwpoFY53jKhMMqu+Eg/OwXaJeMiklslXX9UziV1ruZW/
         kloRZSMsBPHWiaH7n53YUlaOPda0VYN6Y59lKkSbuEHvRI3pRtg6+TIy6dRNkN2phQG0
         H4k69f0Fdv63FroadvURBaHMM4ZOhPTXXjNQ77zK80JiiuO7Jpo0cE9H7zgIg6x5J2IE
         2ide7sDCGJXMj/HN/nnFCjZVlsb+Q5ZIu8ceUWXUWkESNTyYRYsHLferBOpSgb9ah5RG
         Kbkw==
X-Gm-Message-State: AOJu0Yy1s06ZgP2NI1WGb1bDf7k+7CVFHyQncbYbaS/vAfSCqO5fUHAA
	7ah4sIv+QQw9Y46ciCIusT559H1RxQ9H0Ghy4Zo=
X-Google-Smtp-Source: AGHT+IFqMkg7QJu9A9YzeSg6+83Upwldd8DOz1TR8mrrLJXIBNC9t1bPO2PjCQegbBe0QAi3qr7YfA==
X-Received: by 2002:a17:902:da81:b0:1b6:79e3:636d with SMTP id j1-20020a170902da8100b001b679e3636dmr13328349plx.58.1692116673545;
        Tue, 15 Aug 2023 09:24:33 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id ij13-20020a170902ab4d00b001b02bd00c61sm11414623plb.237.2023.08.15.09.24.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 09:24:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 00/18] Patch review
Date: Tue, 15 Aug 2023 06:24:09 -1000
Message-Id: <cover.1692116535.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 16:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186079

Please review this set of changes for mickledore and have comments back by
end of day Thursday, August 17.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5739

The following changes since commit 6bd6b7110ea2029fc736a40760536adfaf28eec0:

  target/ssh: Ensure exit code set for commands (2023-08-09 16:17:50 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/mickledore-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/mickledore-nut

Alexander Kanavin (3):
  glibc-locale: use stricter matching for metapackages' runtime
    dependencies
  devtool/upgrade: raise an error if extracting source produces more
    than one directory
  curl: ensure all ptest failures are caught

Andrej Valek (1):
  maintainers.inc: Modify email address

BELOUARGA Mohamed (1):
  linux-firmware : Add firmware of RTL8822 serie

Bruce Ashfield (2):
  linux-yocto/6.1: update to v6.1.41
  linux-yocto/6.1: update to v6.1.43

Dmitry Baryshkov (1):
  linux-firmware: split platform-specific Adreno shaders to separate
    packages

Joel Stanley (1):
  kernel: don't fail if Modules.symvers doesn't exist

Marek Vasut (1):
  linux-firmware: Fix mediatek mt7601u firmware path

Mark Hatle (1):
  tcf-agent: Update to 1.8.0 release

Richard Purdie (1):
  oeqa/ssh: Further improve process exit handling

Ross Burton (1):
  openssh: upgrade to 9.3p2

Sudip Mukherjee (1):
  bind: upgrade to v9.18.17

Yogita Urade (3):
  qemu: fix CVE-2023-3301
  qemu: fix CVE-2023-3255
  qemu: fix CVE-2023-2861

sanjana (1):
  binutils: stable 2.40 branch updates

 meta/classes-recipe/kernel.bbclass            |   4 +-
 meta/conf/distro/include/maintainers.inc      |   2 +-
 meta/lib/oeqa/core/target/ssh.py              |   5 +-
 ...1-avoid-start-failure-with-bind-user.patch |   0
 ...d-V-and-start-log-hide-build-options.patch |   0
 ...ching-for-json-headers-searches-sysr.patch |   0
 .../bind/{bind-9.18.16 => bind}/bind9         |   0
 .../bind/{bind-9.18.16 => bind}/conf.patch    |   0
 .../generate-rndc-key.sh                      |   0
 ...t.d-add-support-for-read-only-rootfs.patch |   0
 .../make-etc-initd-bind-stop-work.patch       |   0
 .../bind/{bind-9.18.16 => bind}/named.service |   0
 .../bind/{bind_9.18.16.bb => bind_9.18.17.bb} |   4 +-
 .../{openssh_9.3p1.bb => openssh_9.3p2.bb}    |   2 +-
 meta/recipes-core/glibc/glibc-locale.inc      |   8 +-
 .../binutils/binutils-2.40.inc                |   2 +-
 meta/recipes-devtools/qemu/qemu.inc           |   3 +
 .../qemu/qemu/CVE-2023-2861.patch             | 171 ++++++++++++++++++
 .../qemu/qemu/CVE-2023-3255.patch             |  65 +++++++
 .../qemu/qemu/CVE-2023-3301.patch             |  65 +++++++
 .../tcf-agent/tcf-agent_git.bb                |   4 +-
 .../linux-firmware/linux-firmware_20230625.bb |  28 ++-
 .../linux/linux-yocto-rt_6.1.bb               |   6 +-
 .../linux/linux-yocto-tiny_6.1.bb             |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  |  28 +--
 meta/recipes-support/curl/curl/disable-tests  |   2 +
 meta/recipes-support/curl/curl/run-ptest      |   2 +-
 scripts/lib/devtool/upgrade.py                |   2 +
 28 files changed, 366 insertions(+), 43 deletions(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.16.bb => bind_9.18.17.bb} (96%)
 rename meta/recipes-connectivity/openssh/{openssh_9.3p1.bb => openssh_9.3p2.bb} (98%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-2861.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3255.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3301.patch

-- 
2.34.1


