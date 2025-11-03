Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF78ECCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 20:59:27 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2242.1762203566997663759
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 12:59:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eE4lVn2O;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-340ba29d518so2150819a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 12:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762203566; x=1762808366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1l31qsQwE7AgO3BHx+MsH9VUg0iPFyQy9pEFnZVZG68=;
        b=eE4lVn2OhjcckLVT0QBetdBzc1zXKf9nc/VnQcit621tzNHVXtUM2TLNgShngSngNM
         6fAfdmeCge+oYUilPX0TOnUEZTlUmmEOWEbRWe/HCnYRvlbtI37lwsuTwN2iqyJSSVEU
         8NXwQwVKvJCXu+jBxXUGRF0J7pTiJ2bRerT1xUUhvHVwR1nOzCch6KugLU4cOhZFE79v
         KFtj/FS8gR8eCGr6IhSQ++NDgYTk1ZnkP3uU3NpwzJtjWQrAlXDR0bDV7crSWpN1vz9T
         eN8jl6J8FQMpau6oUBV005Cfw2A63D9xwFfY95j3dOmPIK7Ljq7tOr/mcAL8fPwxbo2t
         XBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762203566; x=1762808366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1l31qsQwE7AgO3BHx+MsH9VUg0iPFyQy9pEFnZVZG68=;
        b=tCAlVTMh99IfWM4zPKdJglYOlH3eLf7/Rje/Y36yQ7ru+4S9E4wjSY+Tdv+YTZuoXK
         7T4M+zdvhUUYy6IqaWujjxC1P9ynBdhJgbOmu0CZhoPteXoVFMvNrO+twdY8oS7ALx8O
         l2rQLZcYa1xQqhG3I/r5wdPWUQ59rPo/avWxEHE7VZNe6GNajBK/h+FvibHhZo0xY20a
         V2LGrQVVEr8nhYun2y1MWHHM7nc/xac8AYaI7uYiknIMnl+LRKqdTJqp767SPu6LZIRI
         xZJhghGUWdIzjqLplN/lJjsGbPEc2utP/TAqUbspSfDCIVcqG3nH+ZSuHfXHZTflrsNn
         o21Q==
X-Gm-Message-State: AOJu0Yy2ZLGzxnA6VPLyqJhIYSl3eWzMtS0kJ9l7COvkU5BPf+zq4At6
	eo6zy1gxCsApgl2zMT4qzzJ4kZNprF/360h3s7qfjKxpeu4Cg/IinIA3szklGIDUOzTCneMXcQ5
	uhqLTKa0=
X-Gm-Gg: ASbGncu5bd/Ij9BXOGluDNjluqdflysldFY9LFyauKzNH48ILDa7xTxQOCipjSBEMi+
	XUWuvcRbYT58up693SymOsfvaTQZ8ujERPAv7UZhDACnPVApJ478OEdZcoyT1RxumPqUkA1bbkD
	YnU3FEJ7zJEivWJA1W8IxJFOLofQau3ZWB3i6auKgIb/sQ2lbMrOufICbTK/U7yNi6EWTa72nCK
	JdctiM1wssQXBXHGi+UqMJWuhTKGqjKgeNMvQYh/te5r1HiM/5XDTzDX5obZxnci8gRFXRAD5E6
	wNnGi3FtQ5Jg0iW25cJ5HFhgQkIA+wQgSmZsJaOjpF1tgwS5iu3kDig+5Raehks+P35Ag6dZoDv
	N5wjIrSDmnIiu824lKuJxya1qdriZQcx1J/lgchBPdjRO7O0Tvwo1eO0NUQPcw2FmAcM=
X-Google-Smtp-Source: AGHT+IHWxTTG/odayWs8938HPLZ3JXZriTycxfQEC3Xvvwk0zMq7o3X2nmD4Qa28HY/PqyKRzjYx+A==
X-Received: by 2002:a17:90a:dfcc:b0:32e:8931:b59c with SMTP id 98e67ed59e1d1-3408308a9b4mr15544828a91.27.1762203566005;
        Mon, 03 Nov 2025 12:59:26 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:6a2d:a521:f4d2:20a3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3415b02891asm2024911a91.9.2025.11.03.12.59.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 12:59:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/8] Patch review
Date: Mon,  3 Nov 2025 12:59:07 -0800
Message-ID: <cover.1762203396.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 20:59:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225696

Please review this set of changes for kirkstone and have comments back by
end of day Wednesday, November 5

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2677

The following changes since commit 99204008786f659ab03538cd2ae2fd23ed4164c5:

  build-appliance-image: Update to kirkstone head revision (2025-10-31 06:30:23 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Archana Polampalli (1):
  openssh: fix CVE-2025-61985

Hitendra Prajapati (1):
  go: fix CVE-2024-24783

Hongxu Jia (1):
  u-boot: fix CVE-2024-42040

Jason Schonberg (1):
  Don't use ftp.gnome.org

Peter Marko (3):
  wpa-supplicant: patch CVE-2025-24912
  binutils: patch CVE-2025-11412
  binutils: patch CVE-2025-11413

Praveen Kumar (1):
  bind: upgrade 9.18.33 -> 9.18.41

 .../u-boot/files/CVE-2024-42040.patch         | 56 +++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  4 +-
 .../bind/{bind_9.18.33.bb => bind_9.18.41.bb} |  2 +-
 .../openssh/openssh/CVE-2025-61985.patch      | 35 ++++++++
 .../openssh/openssh_8.9p1.bb                  |  1 +
 .../wpa-supplicant/CVE-2025-24912-01.patch    | 79 ++++++++++++++++++
 .../wpa-supplicant/CVE-2025-24912-02.patch    | 70 ++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.10.bb     |  2 +
 .../binutils/binutils-2.38.inc                |  2 +
 .../binutils/binutils/CVE-2025-11412.patch    | 35 ++++++++
 .../binutils/binutils/CVE-2025-11413.patch    | 38 +++++++++
 meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
 .../go/go-1.21/CVE-2024-24783.patch           | 83 +++++++++++++++++++
 .../python/python3-pygobject_3.42.0.bb        |  2 +-
 meta/recipes-devtools/vala/vala.inc           |  2 +-
 meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb      |  2 +-
 meta/recipes-gnome/libgudev/libgudev_237.bb   |  2 +-
 .../recipes-support/libxslt/libxslt_1.1.35.bb |  2 +-
 18 files changed, 411 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-42040.patch
 rename meta/recipes-connectivity/bind/{bind_9.18.33.bb => bind_9.18.41.bb} (97%)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2025-61985.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2025-24912-01.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2025-24912-02.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-11412.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-11413.patch
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2024-24783.patch

-- 
2.43.0


