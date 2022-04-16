Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD1A3C636FD
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:58 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.22058.1650136489450570582
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 12:14:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=UyyWJ7pr;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 125so11928904pgc.11
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 12:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=72/Bt93g8muINNtGlc3IsQKJtwLul1dTiN6IMH49DaU=;
        b=UyyWJ7prgO3JzBeq4kCSmbEOuXMu9TJOm33XLUxkvPQCvOFwHmQTSiSb5q9CkWjc3c
         UFZSmUyrbxa/jF97SJbqmCWwo4xlYw42ejm5Njprt1aTu6VbmRr9r7Wc8rrzMlOIwGPK
         UJkdIjTNHSj35e5Y2Pue8Y06mgsYT75V/IPgHzWkoxJkHArKMRvc9t0qQvXhV1551o3B
         XytdS4Cx9a1d0XneLUUPlx4OzsQnSeCyMau7iotqlhjxz5XpruhIzJyVFmu0sYpffHeC
         j/QIvSDUYJXFu34BKzfhvxeVej9GOFW9KgHa8WdP/CMFxuaZ8ADgDgzVI97axjqu94Vs
         P3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=72/Bt93g8muINNtGlc3IsQKJtwLul1dTiN6IMH49DaU=;
        b=gvPuZVmZ+O69P0Qb5lO0nZwObyFsH4V1JopzO3LGflg/BhWoKG/qYcnWHrx7E4lJRt
         CLQ65NByldUZAiabrflJxVubWX3r5f7tHOxJcap/RcMlUiG+2pqYyzlg2khOCU8RoXP1
         EFS651VWqo83+nPDF43AAFnAX2Tr/IYqHlzgQySiGYA/QLnJOnwieisVZF5riJygZgZ3
         b0eceLyid7GFqf/vbFjDgcqf4JxcKbp1xtg5FpqFHIerU39RZG34xM8nnJLI5d/Dad2m
         kVY+4xaKH4Zk5Lp1AKY4tjIK0qLnfxcP9cF+zm+rP2Ht5QYSUMNUAfV5+w504Zdk1MBP
         +SKg==
X-Gm-Message-State: AOAM531WZComwzStwu/SQqLonI1XZPexCxOhGbj+37CMXRQ8YR6H+8Zd
	qqkm1L0UQNQCX4dyRLE8WoA0ZwzsZfYIW9oLPHA=
X-Google-Smtp-Source: 
 ABdhPJxGUaE+QkeNgreN5zAl8E+jfYC7OkyDa1cad2k9GGEcC7XlBQmw+aIehCMK1z217KO/0AwLQQ==
X-Received: by 2002:a63:5710:0:b0:399:365e:5dde with SMTP id
 l16-20020a635710000000b00399365e5ddemr4051793pgb.192.1650136488244;
        Sat, 16 Apr 2022 12:14:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h2-20020a62b402000000b0050a62e582e5sm430004pfn.37.2022.04.16.12.14.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 12:14:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/11] Patch review
Date: Sat, 16 Apr 2022 09:14:18 -1000
Message-Id: <cover.1650131192.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164546

Please review this set of patches for dunfell and have comments back by end
of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3537

with the exception of a known issue with meta-intel due to the zlib CVE fix, see:

https://lists.openembedded.org/g/openembedded-core/message/163793

The intent is to fix meta-intel after this patch set is merged to dunfell.

The following changes since commit aa762b7ca2417b80dd114a4ab263d69074912f82:

  tzdata: update to 2022a (2022-04-04 04:22:32 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexandre Belloni (1):
  pseudo: Fix handling of absolute links

Martin Jansa (1):
  license_image.bbclass: close package.manifest file

Peter Kjellerstedt (1):
  metadata_scm.bbclass: Use immediate expansion for the METADATA_*
    variables

Ralph Siemsen (3):
  gzip: fix CVE-2022-1271
  xz: fix CVE-2022-1271
  apt: add -fno-strict-aliasing to CXXFLAGS to fix SHA256 bug

Richard Purdie (4):
  vim: Upgrade 8.2.4524 -> 8.2.4681
  git: Ignore CVE-2022-24975
  pseudo: Add patch to workaround paths with crazy lengths
  libxshmfence: Correct LICENSE to HPND

Ross Burton (1):
  zlib: backport the fix for CVE-2018-25032

 .../recipeutils/recipeutils-test_1.2.bb       |   2 +-
 meta/classes/license_image.bbclass            |   4 +-
 meta/classes/metadata_scm.bbclass             |  10 +-
 .../zlib/zlib/CVE-2018-25032.patch            | 347 ++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.2.11.bb         |   1 +
 meta/recipes-devtools/apt/apt.inc             |   4 +
 meta/recipes-devtools/git/git.inc             |   5 +
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   2 +-
 .../gzip/gzip-1.10/CVE-2022-1271.patch        |  45 +++
 meta/recipes-extended/gzip/gzip_1.10.bb       |   1 +
 .../xz/xz/CVE-2022-1271.patch                 |  96 +++++
 meta/recipes-extended/xz/xz_5.2.4.bb          |   4 +-
 .../xorg-lib/libxshmfence_1.3.bb              |   2 +-
 meta/recipes-support/vim/vim.inc              |   6 +-
 14 files changed, 515 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2018-25032.patch
 create mode 100644 meta/recipes-extended/gzip/gzip-1.10/CVE-2022-1271.patch
 create mode 100644 meta/recipes-extended/xz/xz/CVE-2022-1271.patch

-- 
2.25.1


