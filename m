Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FACCC433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 23:29:18 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web09.1314.1655854157072062659
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:29:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Jvy1+HnX;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d17so5506451pfq.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QQLlvQk6NbtajmSFmnFyvKG4wxVK6ZR2mSzprWjQehg=;
        b=Jvy1+HnXKsiyFxQaGAL1UedwzTqyAznSFOA0ZgSo7x0Oa008Xcx8WArcJPx+eKAaO8
         uV8HUcrT8IHn+kE9NzF9tGTZ8VpBw/8uytHw2Ji4lm7tGpgUwkkFW9/E8etTboh9D8uc
         KTPknWuoCMRJxwK481B9xRrSwsYefsCfizD9SVJ0MgGG5Q2eH0GBmuEunL9KHjUxO+Ul
         LAgQDvlRyu9ch9bwj+RhqxGeyv73R7DMICFCCJxIzNDYo8xYdnyqMjZoDuqFbu+SEsWX
         ZSx+5tJlbG8yTRcdFNRPW6G90g67g4yz9d5V6LJxZPFJQT5JuhfL/3bMnPh0BCdNN+ay
         6XMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QQLlvQk6NbtajmSFmnFyvKG4wxVK6ZR2mSzprWjQehg=;
        b=4YJKOnAWXgkF3o1BkO/riTwqWdxk5ycpLNzrGlR0at9FOYp0doWzpMUFEdC5xS1zI2
         bjZFZfvr9Iim3VCnt39OB6mbcZYsMvbmIJ611/mLC16NqRbp2qOcTg42nwKtSRaUcBNF
         3vhfLmb0kzkV+60DqJwHiGPiG9JHAsl7/TjVXjNzzcV6Yt9sgIJ5ALcecna9yk2KAGT0
         lc4/1+LO3OOky6GAFEElOmrD7QBM2uneMrnOE1auUaB+Y4SjUgJ/v+lioJZx4/r4tCfl
         26OBQRxpfZk+sc+mypRS2V2VDTjGNKQEtO3AhofxiwBix7hp5WBsOC1+hv5dANnQNomt
         mEpA==
X-Gm-Message-State: AJIora92XMYiO60VHg2y+OkJbSHoQZtIBWpylg2i4B1VHi8bKYtfFLNr
	GbNXOaLjt44ENi4BC8OJTLNd/gh7ppyJKRXQ
X-Google-Smtp-Source: 
 AGRyM1uNU61Y2JGzE3TEI2uIElkJTlPGSLVomdRIVWv0pJImZHr8Cie9/OwzZvMBT6j+HOTxYI/5jQ==
X-Received: by 2002:a63:b54d:0:b0:40c:5917:964b with SMTP id
 u13-20020a63b54d000000b0040c5917964bmr356067pgo.241.1655854156049;
        Tue, 21 Jun 2022 16:29:16 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f25-20020a637559000000b0040cf934a1a0sm2041614pgn.28.2022.06.21.16.29.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 16:29:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/6] Patch review
Date: Tue, 21 Jun 2022 13:28:57 -1000
Message-Id: <cover.1655836866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 23:29:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167204

Please review this set of patches for dunfell and have comments back by end
of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3805

The following changes since commit 135adeb82c9303c26193bb6f6bd3bc696793aa62:

  archiver: don't use machine variables in shared recipes (2022-06-15 06:40:10 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Chee Yang Lee (1):
  dpkg: update to 1.19.8

Dmitry Baryshkov (2):
  linux-firmware: add support for building snapshots
  linux-firmware: upgrade 20220509 -> 20220610

Hitendra Prajapati (2):
  python-pip: CVE-2021-3572 Incorrect handling of unicode separators in
    git references
  golang: CVE-2021-44717 syscall: don't close fd 0 on ForkExec error

Nick Potenski (1):
  systemd: systemd-systemctl: Support instance conf files during enable

 .../systemd/systemd-systemctl/systemctl       | 14 +++-
 .../dpkg/{dpkg_1.19.7.bb => dpkg_1.19.8.bb}   |  4 +-
 meta/recipes-devtools/go/go-1.14.inc          |  1 +
 .../go/go-1.14/CVE-2021-44717.patch           | 83 ++++++++++++++++++
 .../python/python3-pip/CVE-2021-3572.patch    | 48 +++++++++++
 .../python/python3-pip_20.0.2.bb              |  1 +
 ...01-Makefile-replace-mkdir-by-install.patch | 84 -------------------
 ...20220509.bb => linux-firmware_20220610.bb} | 11 ++-
 8 files changed, 154 insertions(+), 92 deletions(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.19.7.bb => dpkg_1.19.8.bb} (86%)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-44717.patch
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2021-3572.patch
 delete mode 100644 meta/recipes-kernel/linux-firmware/files/0001-Makefile-replace-mkdir-by-install.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220509.bb => linux-firmware_20220610.bb} (99%)

-- 
2.25.1


