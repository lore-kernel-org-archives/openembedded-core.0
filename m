Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69377C433EF
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 18:19:52 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web09.381.1652293190422670093
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 11:19:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=0kIMwxXQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id s16so2500148pgs.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 11:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mKPSoTGOxVHnNhAGlMJQkYjQ8V3Bo7cXrjvVKfy6EGA=;
        b=0kIMwxXQrqs9jzNn2nzcKy8C9AthunbhhNPCQu/QVDv+bFvbvr+KTlrgwnp/TA1RB4
         uCWYUkYr0zxwIR6ESXskoKrgo9Z3qxy5r3W38hlH518HDaUYH2kCGV+7b5WOsoOG+FGD
         LmRGEAlTwxwJWltF7JXaewtscRwJx3bbmayrax8V8nRJTPL08TL95X10DB5K83j3I3UB
         fbDnnL54GoOunRIe+MP7KvtkSS81+WKDux2TmrygmugYZF/r1S6kiyqCMuKuZlvVGuht
         wLAxKqyendPQfj7hphxS79V/gRBPZOf9qIKs8FYo4F/cd2MgbvaBhz7Zk3OyE7CgI+6w
         3xiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mKPSoTGOxVHnNhAGlMJQkYjQ8V3Bo7cXrjvVKfy6EGA=;
        b=AtSi1baLL4XjNTOwZBnuiy2z152bBuX2QW4fpAyfJKgAjosbsl49YMXLwuAdIdZYAp
         W8eWbq2hB9OGwW0cmHGAMKvnbEbFtYfrH642yhiuG40kFo9WySE4DbCUpSHuBg4eDWh6
         /McvAX4WM/v0C46cLhveZ+Ix0zIwkX5nVmPhDvyoFO8ipmI7G9XAkLvRhl+F3auwdSJz
         vdmy9tl4vQeVyjh6CSBQvCSkCyzLFEdfWkrG6zpfZc0M2Qm1i3T2tBP8Uhvp/aOAYojc
         fh6RmQpNS3TIocANwoEbXC6VASKBMP/B2dq8B+g6dBVynvYtr57kYmSN9LNztpqW9w9J
         fzLw==
X-Gm-Message-State: AOAM532wMRm03QTsbWQb3ZQk2sGR4Pg8f7wGdUtDuurbSEY5plMKvof+
	uBEnOL27CeKbjjkitAUEOCe2A1SPm/qb8MNy
X-Google-Smtp-Source: 
 ABdhPJyySio8vmUdT3K3+/ZRzArNGHE8n4XaW+2he4ZfsV56EdfnnQIUTssfXBqLU08uBNEox1ImDQ==
X-Received: by 2002:a05:6a00:10cc:b0:4fe:3f1c:2d1 with SMTP id
 d12-20020a056a0010cc00b004fe3f1c02d1mr26792405pfu.0.1652293188920;
        Wed, 11 May 2022 11:19:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i14-20020aa787ce000000b0050dc76281bbsm2126132pfo.149.2022.05.11.11.19.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 11:19:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/14] Patch review
Date: Wed, 11 May 2022 08:19:19 -1000
Message-Id: <cover.1652292852.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 18:19:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165506

Please review this set of patches for dunfell and have comments back by end
of day Friday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3648

with the exception of the newly added meta-virt test (which has never
worked with dunfell)

The following changes since commit 7c0345ab1058a7e29d37f110923ecd368e102ed7:

  uninative: Upgrade to 3.6 with gcc 12 support (2022-05-09 11:51:55 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Bruce Ashfield (1):
  linux-yocto/5.4: update to v5.4.192

Davide Gardenal (3):
  cve-check: add JSON format to summary output
  cve-check: fix symlinks where link and output path are equal
  rootfs-postcommands: fix symlinks where link and output path are equal

Marta Rybczynska (2):
  cve-update-db-native: update the CVE database once a day only
  cve-update-db-native: let the user to drive the update interval

Pawan Badganchi (2):
  fribidi: Add fix for CVE-2022-25308, CVE-2022-25309 and CVE-2022-25310
  libinput: Add fix for CVE-2022-1215

Portia (1):
  volatile-binds: Change DefaultDependencies from false to no

Richard Purdie (3):
  base: Avoid circular references to our own scripts
  scripts: Make git intercept global
  scripts/git: Ensure we don't have circular references

Ross Burton (1):
  cve-check: no need to depend on the fetch task

Steve Sakoman (1):
  busybox: fix CVE-2022-28391

 meta/classes/base.bbclass                     |   4 +
 meta/classes/cve-check.bbclass                |  72 ++--
 meta/classes/rootfs-postcommands.bbclass      |  14 +-
 ...tr-ensure-only-printable-characters-.patch |  38 ++
 ...e-all-printed-strings-with-printable.patch |  64 ++++
 meta/recipes-core/busybox/busybox_1.31.1.bb   |   2 +
 .../recipes-core/meta/cve-update-db-native.bb |  13 +-
 .../files/volatile-binds.service.in           |   2 +-
 .../wayland/libinput/CVE-2022-1215.patch      | 360 ++++++++++++++++++
 .../wayland/libinput_1.15.2.bb                |   1 +
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 .../fribidi/fribidi/CVE-2022-25308.patch      |  50 +++
 .../fribidi/fribidi/CVE-2022-25309.patch      |  31 ++
 .../fribidi/fribidi/CVE-2022-25310.patch      |  30 ++
 meta/recipes-support/fribidi/fribidi_1.0.9.bb |   3 +
 scripts/{git-intercept => }/git               |   9 +-
 18 files changed, 674 insertions(+), 55 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0002-nslookup-sanitize-all-printed-strings-with-printable.patch
 create mode 100644 meta/recipes-graphics/wayland/libinput/CVE-2022-1215.patch
 create mode 100644 meta/recipes-support/fribidi/fribidi/CVE-2022-25308.patch
 create mode 100644 meta/recipes-support/fribidi/fribidi/CVE-2022-25309.patch
 create mode 100644 meta/recipes-support/fribidi/fribidi/CVE-2022-25310.patch
 rename scripts/{git-intercept => }/git (52%)

-- 
2.25.1


