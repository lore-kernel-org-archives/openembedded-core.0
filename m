Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71666C001E0
	for <webhook@archiver.kernel.org>; Sat, 21 Oct 2023 15:28:47 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web11.81412.1697902119996006877
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Oct 2023 08:28:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QjxJbME4;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.178, mailfrom: steve@sakoman.com)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-357ca97e628so1162475ab.1
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Oct 2023 08:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697902119; x=1698506919; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yF9VLmehuWn0dEmkHkcxge45YPUSEBmAIe8SY9CNJ1c=;
        b=QjxJbME4D8fOrRCXicXJmTxAu2su6hhqSzCtPiuZhnf2hdI4KIaWgdxuxcHQ1B9DlU
         Mb8hvYBOhVxZZtoagLEhqoo0WqyZDeLDV9rCau+Os8MQsPmlXn8tNtKgftLC7Wpz+7Rv
         KeFBNzQabxbJzULd9GEb2a4AkqkhCTVKkGPeKRWy4peiCy8ZYOrnMxdzPvUD+u7/lBCm
         JnzEPQQ9/VYZgcX1TrfqwuPceHRdV6bkEHlfZ5JEAOti7ce5duXlMc+rAOPfSeEU0kMf
         B2RyOJ7vJYwcPAXlZOb0r87KegvythOe/e3fXTHraZYdr/Nrl2V/GgBQL8twgwqCtCVe
         oIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697902119; x=1698506919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yF9VLmehuWn0dEmkHkcxge45YPUSEBmAIe8SY9CNJ1c=;
        b=VI8thBbcKpDzuEwK85s+IE2W6WfLSL45MWAMoZTPt5Pc0hBwREWc7ked4vIF2B3fOq
         3biXxo49xQhen9naXTmLZ6kIZYmv5OsT8woDq9btMwVIVe+OtjGQ2zfL55iC4bQWsNfI
         reNY4WR3oYUhLmLHb0TxM8wNnD04y39aot5BaovDewN31HdCH8HFd+TQVqypH9RhaOFN
         S4Hce6fev6Kk6zC3XHGUlJsay73VaZsNo9a+yGnCijt5Oj4DgvJmgA3B6IupjbQa9cjd
         owjqDz/KG+LWmA7JmEILZOYtpGLaGVX9Vo+O+/Hr+oLndCMn8iwnycXhK8ErSYQ3/G/v
         Cbdw==
X-Gm-Message-State: AOJu0Ywn+Zasom4/fZWqAcXaabqWCl/vJR3RN4ToWiObaxtqjlWbW+YG
	vijX4v3tS817Pw3I/jaGqt/2rTe12Ph8+kfDSw4=
X-Google-Smtp-Source: AGHT+IE7tPE4z9slU5FEJVfEsuThu+nthbFZUDb7phtF40xheYnpdeGFmM2ZtPQlRmTw6tSPsEQhQQ==
X-Received: by 2002:a05:6e02:1a44:b0:34f:ef7:53d0 with SMTP id u4-20020a056e021a4400b0034f0ef753d0mr5514452ilv.26.1697902118615;
        Sat, 21 Oct 2023 08:28:38 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id by2-20020a056a02058200b0058c1383fa8bsm2876515pgb.0.2023.10.21.08.28.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 08:28:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/6] Patch review
Date: Sat, 21 Oct 2023 05:28:26 -1000
Message-Id: <cover.1697901991.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Oct 2023 15:28:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189587

Please review this set of changes for kirkstone and have comments back by
end of day Tuesday, October 24

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6084

The following changes since commit 5570e49791b770271f176a4deeb5f6f1a028cb4a:

  uboot-extlinux-config.bbclass: fix missed override syntax migration (2023-10-17 12:19:37 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Lee Chee Yang (1):
  qemu: ignore RHEL specific CVE-2023-2680

Meenali Gupta (1):
  linux-firmware: upgrade 20230625 -> 20230804

Peter Marko (1):
  zlib: patch CVE-2023-45853

Siddharth Doshi (2):
  libx11: Security Fix for CVE-2023-43785, CVE-2023-43786 and
    CVE-2023-43787
  vim: Upgrade 9.0.2009 -> 9.0.2048

Vijay Anusuri (1):
  gawk: backport Debian patch to fix CVE-2023-4156

 .../zlib/zlib/CVE-2023-45853.patch            | 42 +++++++++++++
 meta/recipes-core/zlib/zlib_1.2.11.bb         |  1 +
 meta/recipes-devtools/qemu/qemu.inc           |  4 ++
 .../gawk/gawk/CVE-2023-4156.patch             | 28 +++++++++
 meta/recipes-extended/gawk/gawk_5.1.1.bb      |  1 +
 .../xorg-lib/libx11/CVE-2023-43785.patch      | 62 ++++++++++++++++++
 .../xorg-lib/libx11/CVE-2023-43786-0001.patch | 41 ++++++++++++
 .../xorg-lib/libx11/CVE-2023-43786-0002.patch | 45 +++++++++++++
 .../xorg-lib/libx11/CVE-2023-43786-0003.patch | 51 +++++++++++++++
 .../xorg-lib/libx11/CVE-2023-43787.patch      | 63 +++++++++++++++++++
 .../xorg-lib/libx11_1.7.3.1.bb                |  5 ++
 ...20230625.bb => linux-firmware_20230804.bb} |  4 +-
 meta/recipes-support/vim/vim.inc              |  4 +-
 13 files changed, 347 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2023-45853.patch
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2023-4156.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43785.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43786-0001.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43786-0002.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43786-0003.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43787.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230625.bb => linux-firmware_20230804.bb} (99%)

-- 
2.34.1


