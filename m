Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B74E4CA0FE7
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 12:52:58 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.13712.1725022372355731962
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Aug 2024 05:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GC/DBhnR;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2053525bd90so2549265ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 05:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1725022371; x=1725627171; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=apz3gvitBe8DVlxrH38IGFfiao5yMDHBYB0SRJT34Yo=;
        b=GC/DBhnRXIdHXJEendWobGtu+7dsY3T/jszLBWFJlN8QZYQ47V1C2csRwWMtuGLAxb
         whgQjXyv53lzvsbVZqE7IL5sPa+48sFQs5oEZgjCN1ebMCHpc1mua833cPvzTxapEqT1
         KlyHN7kELdWWVf1omhbvfYcrCuz7EKjat+Il3hB7p4gPBM6JZom7oc2Q+hx4elqfLQTi
         MeDZ6SpbZrRrRRBOU6X72s9WLYuRyjV1jBlvmz32kSHEWAir0apCHR76ECYy/6EmuUvn
         TrukCpdKHkmwXDfeSLCbn8TEEgJLJKMbMrUVgI2bpZxmKGeCyXx7oybKbfeL2eo6oTcI
         Fysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725022371; x=1725627171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=apz3gvitBe8DVlxrH38IGFfiao5yMDHBYB0SRJT34Yo=;
        b=SvUvxSOtLNKD4UWX2bLxNayAZvuqQKg8phJgyzSEaDZlVPhy8tvC705FzxJi++eo4m
         nRsamilBWa1HXp3OYU/y/xTV78+NWLhtiRB1UCbaiT5c9X4aXZzkdSfC7PJtLqrgGfy4
         atf0jFx3nCp0UGAlupUOlpzKLouuzP65GT4P+S0CYPQSpE+ZFrSb7vVtXF6PhrOeHH5q
         xqZWwIkDQ8iqXR5UWsSd+gkt38dvzIJGhPRg2QiW0zZpC13uIuLiMy9Txws+HvLNw5Z8
         bc2iIv4LHDS3G+G4SZT8/2B83UV/aNO6ljuYlUgexMyuMCl/1OZB4KKhk0CTQdmlJFuR
         Qh0w==
X-Gm-Message-State: AOJu0YyXBBxmDS+uH8Jcu80gFdNxkPR5gbVEo9bar5emmFaS6xdEZlHH
	rrd4VENOgHx8915sN+RektuDC9rijKCvVhRSXVZmoItWoapKduRK2ml4tng1SxCz0xjZI7E0eWw
	OQ4g=
X-Google-Smtp-Source: AGHT+IFihgWhlIg01A5BXwT2J0UaRbDpQhP6VQOayxAyOde0eWSJ2pP5yQCx5fhZMlpxmq8vN0F9zw==
X-Received: by 2002:a17:902:d4c7:b0:205:3ae0:a573 with SMTP id d9443c01a7336-2053ae0a890mr5343675ad.25.1725022371195;
        Fri, 30 Aug 2024 05:52:51 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2051554235bsm26295975ad.214.2024.08.30.05.52.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 05:52:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/7] Patch review
Date: Fri, 30 Aug 2024 05:52:40 -0700
Message-Id: <cover.1725022186.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 12:52:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203959

Please review this set of changes for kirkstone and have comments back by
end of day Tuesday, September 3

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7295

The following changes since commit 963085afced737863cf4ff8515a1cf08365d5d87:

  libsoup: fix compile error on centos7 (2024-08-23 14:34:03 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Divya Chellam (1):
  bind: Upgrade 9.18.24 -> 9.18.28

Hitendra Prajapati (1):
  vim: upgrade from 9.0.2190 -> 9.1.0114

Hugo SIMELIERE (1):
  cryptodev-module: Fix build for linux 5.10.220

Ming Liu (1):
  grub: fs/fat: Don't error when mtime is 0

Peter Marko (2):
  libyaml: Ignore CVE-2024-35325
  curl: Ignore CVE-2024-32928

Siddharth Doshi (1):
  vim: Upgrade 9.1.0114 -> 9.1.0682

 ...1-fs-fat-Don-t-error-when-mtime-is-0.patch | 70 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 .../bind/{bind_9.18.24.bb => bind_9.18.28.bb} |  2 +-
 .../cryptodev/cryptodev-module_1.12.bb        |  1 +
 .../0001-Fix-build-for-linux-5.10.220.patch   | 32 +++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  2 +
 meta/recipes-support/libyaml/libyaml_0.2.5.bb |  2 +
 ...m-add-knob-whether-elf.h-are-checked.patch | 39 -----------
 .../vim/{vim-tiny_9.0.bb => vim-tiny_9.1.bb}  |  0
 meta/recipes-support/vim/vim.inc              |  5 +-
 .../vim/{vim_9.0.bb => vim_9.1.bb}            |  0
 11 files changed, 111 insertions(+), 43 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/0001-fs-fat-Don-t-error-when-mtime-is-0.patch
 rename meta/recipes-connectivity/bind/{bind_9.18.24.bb => bind_9.18.28.bb} (97%)
 create mode 100644 meta/recipes-kernel/cryptodev/files/0001-Fix-build-for-linux-5.10.220.patch
 delete mode 100644 meta/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch
 rename meta/recipes-support/vim/{vim-tiny_9.0.bb => vim-tiny_9.1.bb} (100%)
 rename meta/recipes-support/vim/{vim_9.0.bb => vim_9.1.bb} (100%)

-- 
2.34.1


