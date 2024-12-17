Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D658E77184
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 20:55:10 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.91461.1734468907555121404
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 12:55:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XTS6s4nH;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7242f559a9fso7367541b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 12:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734468906; x=1735073706; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=S5HD9KmQzYEZdv9lugDS5okmwbyliLNeu7PcmuABDV4=;
        b=XTS6s4nH257fZ5YyZTfBYcvB2ZU4LfPhltQAkbxbkd61itBaegulZxA5txfr2JwRc5
         BfdsachAw9iTKUK+lnkShjKQxjfXSaw2PD6fNrkX/ujN2HlAuH6AYT/udX7dWAv+/R0R
         lky90tOq4Nya0fKslVK+oGXBUnmFFxXhOHZe2CFk0iRSCZhZB+BI6eTzhlvap9OBAyAs
         qLJe9xXMmt28Y590Sw6+n5Zu74AX00J/yEHTqpDsApwP2z/79Du8+B4/IhL/ZYrVXF6n
         M1JoEuZhzhYA7DQAMo8xo7TST21p/0osQ2FOnjPNMJZxKGXlKVGNsH8XktDWIirS4XTm
         7PUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734468906; x=1735073706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S5HD9KmQzYEZdv9lugDS5okmwbyliLNeu7PcmuABDV4=;
        b=Rd7iXiw1MZHOnf/EO48uKZKuja4lZRF2COKbkVBHUMEkxf5qrgTBcZ2GD9XIzRCpC1
         Md4/pxLujv1YDVQpwCKKuR9o1BoefmK+qawo4V+TGRJZDKCtayIS/mUq5yI/dPagnOD2
         pSDN9FfE03m26bPypOeFJ0anrXDl8REVKn1I1FMF5nQRO9RESCRIAvJ2HzQ/YLmYSkAC
         ImMWeT9k+7cOFZlpeJsC7mwLFIrxDm+ozLtu7GOlT5euC6hIRQnHtnKRLBaXpP5E14Hz
         4LRX4fD4u6R7k45dPyQOI+TgYoehMMZp59RmBlz4hpUUIIK8wwxK79elA+Tsws0yv3OW
         iw/w==
X-Gm-Message-State: AOJu0YzZk4c31Bw7AJqEFBpw7FfZL1zCmxIes92KzjGOPdV3Mp3NOOtm
	maOibHW+drHMlpaYNtH6RT/D3M2ZxWyGjl7KnYw6TkX9e2jGVv6jJvYxe8QKScFUrGG2ZRGxKOw
	z
X-Gm-Gg: ASbGncsiEfS4IoQg9nIf2absdDMBoK3o5nyj9N0OfORTvhg9Hu3mCIDRrEx9Xe3pujT
	Q8aWIOwmSTTL3kIoMpPYER4HpeDf391dfxvfH3ebd4+pIxQL+upL8jITYkOZOkAn+WdK2tPcp1r
	A98JegZGa35HSx2iN9/B7gvqLDK7o6TIAwAwCwLN1bviymiwHbV6SJ/zVQqSdtCYteoYYqwEECC
	2OFNPbG4TuVOyG+Edn1qXrqy4QkctsnEcfRgEslIg1Dog==
X-Google-Smtp-Source: AGHT+IH6w1mqc6rVJfHI17+sLscjtW5s1fAVEFT6T8fkTmKJ5sBkZEXCOZxn9mZSvjtRTg/DlWT1HA==
X-Received: by 2002:a05:6a00:1944:b0:728:ea15:6d68 with SMTP id d2e1a72fcca58-72a8d2a7a5fmr659112b3a.18.1734468906279;
        Tue, 17 Dec 2024 12:55:06 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad5bc5sm7353294b3a.69.2024.12.17.12.55.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 12:55:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/9] Patch review
Date: Tue, 17 Dec 2024 12:54:51 -0800
Message-Id: <cover.1734468756.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 20:55:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208846

Please review this set of changes for kirkstone and have comments back by
end of day Thursday, December 19

Passed a-full on autobuilder:

https://valkyrie.yoctoproject.org/#/builders/29/builds/663

The following changes since commit b132b817f5931b290e5348dd4a17fbfdc5c6e2c4:

  dbus: disable assertions and enable only modular tests (2024-12-10 05:38:29 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alex Kiernan (1):
  base-passwd: Add the sgx group

Alexandre Belloni (1):
  base-passwd: fix patchreview warning

Ernst Persson (1):
  package.bbclass: Use shlex instead of deprecated pipes

Jiaying Song (1):
  subversion: fix CVE-2024-46901

Louis Rannou (1):
  base-passwd: add the wheel group

Peter Kjellerstedt (3):
  base-passwd: Regenerate the patches
  base-passwd: Update to 3.5.52
  base-passwd: Update the status for two patches

Yogita Urade (1):
  xserver-xorg: fix CVE-2024-9632

 meta/classes/package.bbclass                  |   4 +-
 .../0001-Add-a-shutdown-group.patch           |  26 +++
 .../0001-base-passwd-Add-the-sgx-group.patch  |  30 ++++
 ...nstead-of-bin-bash-for-the-root-user.patch |  23 +++
 ...t-since-we-do-not-have-an-etc-shadow.patch |  21 +++
 ...put-group-for-the-dev-input-devices.patch} |  17 +-
 .../{kvm.patch => 0005-Add-kvm-group.patch}   |   2 +-
 ...ble-to-build-without-debconf-support.patch | 129 ++++++++++++++
 ...-to-disable-the-generation-of-the-do.patch |  46 +++++
 .../base-passwd/0008-Add-wheel-group.patch    |  20 +++
 .../base-passwd/add_shutdown.patch            |  19 ---
 .../base-passwd/disable-docs.patch            |  24 ---
 .../base-passwd/disable-shell.patch           |  57 -------
 .../base-passwd/base-passwd/nobash.patch      |  15 --
 .../base-passwd/base-passwd/noshadow.patch    |  14 --
 ...passwd_3.5.29.bb => base-passwd_3.5.52.bb} |  30 ++--
 .../subversion/CVE-2024-46901.patch           | 161 ++++++++++++++++++
 .../subversion/subversion_1.14.2.bb           |   3 +-
 .../xserver-xorg/CVE-2024-9632.patch          |  58 +++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |   1 +
 20 files changed, 547 insertions(+), 153 deletions(-)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch
 rename meta/recipes-core/base-passwd/base-passwd/{input.patch => 0004-Add-an-input-group-for-the-dev-input-devices.patch} (42%)
 rename meta/recipes-core/base-passwd/base-passwd/{kvm.patch => 0005-Add-kvm-group.patch} (88%)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-build-without-debconf-support.patch
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0007-Make-it-possible-to-disable-the-generation-of-the-do.patch
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0008-Add-wheel-group.patch
 delete mode 100644 meta/recipes-core/base-passwd/base-passwd/add_shutdown.patch
 delete mode 100644 meta/recipes-core/base-passwd/base-passwd/disable-docs.patch
 delete mode 100644 meta/recipes-core/base-passwd/base-passwd/disable-shell.patch
 delete mode 100644 meta/recipes-core/base-passwd/base-passwd/nobash.patch
 delete mode 100644 meta/recipes-core/base-passwd/base-passwd/noshadow.patch
 rename meta/recipes-core/base-passwd/{base-passwd_3.5.29.bb => base-passwd_3.5.52.bb} (79%)
 create mode 100644 meta/recipes-devtools/subversion/subversion/CVE-2024-46901.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-9632.patch

-- 
2.34.1


