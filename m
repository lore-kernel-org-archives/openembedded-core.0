Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A32C36010
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 14:43:40 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.51529.1743086619925977892
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 07:43:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=oGESFoNr;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2240b4de12bso30741835ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 07:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1743086619; x=1743691419; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VEn5zMwKIePrA2lhTiXhEMd9UMW3DQsYFGeKTBcKskI=;
        b=oGESFoNrUfoavVnlLnWGBgAYFc0LUt0utN5RrnpBxaDKFtMpe/5z3NYdDh4JeuuY1o
         eKszbGPUf6OsiPnSqqaAu6JtHG8oZkSWRRzeCU6qp+igLiUMMsAESrp+sxCTziuD863c
         5Gjaejk78qVt56K55GxIc3kyZRaT0Squ1zlJtv727LRO/CrFGIJjGvvZa6jrA0OUcQgu
         XPHAIZ8RPJp5u0d8htPa1+QCEzvPgHqvQ9GXp/PLx6Wqz6U15uh72qMM6KFmbJ4he3oK
         /IY/t9U63sDd0P82h/Cuv4CaxB+9XnLNSoadNTv9W0snJzsfEt8tkvHnc07SoPlLlLbe
         9fwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743086619; x=1743691419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VEn5zMwKIePrA2lhTiXhEMd9UMW3DQsYFGeKTBcKskI=;
        b=d0vNwflKSpiVPf886YTPfyOBECcLix8ntqpNgE1htBH4bT26SH3Q5zeLWcduWQPxoU
         7dfnphgqjT10U3d0tlJ1OErUH38qVrn0GIZog9uCScpq5o1qEdBkuPHd/7WdqbwKZL3K
         FS2dBxJ0k68BnabJOEfHQnWoG5GxgDaTCkiDcHBfYjeuFY5hos+YGujeSlPmcag9zD0/
         yETl7/xGTOM8h1aIiI4HjLNlJ4b3lzF3Mjdatz0RUMvsdnWn/gzNHUyhUZ/Zg6SKHnf2
         biGPUrxjEGY35+1imCl3SQzSNMyC05rNWysXMk+3UsustQxPIby2vQsIwuVgMtAW6UNx
         lurw==
X-Gm-Message-State: AOJu0Yy2Y4p7SEjIpCId7GHnecH9ujGXTRJNEEh/PDfwDHdB+QHcc7vZ
	kcpZUwQJyd5J9Y/7/Q/IwmB7kBy74xi7mOHqB80Fc7iNMoFzZNTfFW6Z8dEJ+f64vP1qE9mivx1
	f
X-Gm-Gg: ASbGncsdbNKKero3g9x4lUgycjyGmIqIb6eq7PwQut1Q4Za15Htd23nwB03GDZGr+Hn
	AzYTymBHq5hx47YeYCaBKfuGO+MCn9uHhCBYq30XH/uBohxAl7mNHC4GP8g1aw1YeYa8DXnG4Oe
	2nXBkwZTyoWNIaRQB9GJvs1JJYou4j0SM51Lk4dWBWAstI6shg0kOxxnEzDYqbed8QwnpMDQshg
	KYkI9ub5ydTKbWFmE7Nv/3gf6hvSbqkywZwZE5Lt+IDC8wbTnO9FEEdMarzUrbn/oWZy1jD6Txp
	9WQxxY55THDv33Ry+pvicbAXT+6KR8lJi8AS+qTaH65Qwg==
X-Google-Smtp-Source: AGHT+IE6sG1QD4OGI9NKrx00wf6g/UULi7PiiftOJ3BaYZ9NvvPYViF8d+x9obHoQX/WT/kIYHZ6Og==
X-Received: by 2002:a17:903:11d2:b0:224:1609:a74a with SMTP id d9443c01a7336-22804931e4dmr63620205ad.34.1743086618953;
        Thu, 27 Mar 2025 07:43:38 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:811c:968e:2c1:6363])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390618e5absm14819074b3a.175.2025.03.27.07.43.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 07:43:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/4] Patch review
Date: Thu, 27 Mar 2025 07:43:26 -0700
Message-ID: <cover.1743086467.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 14:43:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213753

Please review this set of changes for kirktone and have comments back by
end of day Monday, March 31

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1277

The following changes since commit 1172a71f2104454a13e64886adbdb381aa8d6e0e:

  libxcrypt-compat: Remove libcrypt.so to fix conflict with libcrypt (2025-03-21 06:48:11 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Bruce Ashfield (2):
  linux-yocto/5.15: update to v5.15.179
  linux-yocto/5.10: update to v5.10.234

Peter Marko (1):
  python3: patch CVE-2025-0938

Vijay Anusuri (1):
  vim: Upgrade 9.1.1115 -> 9.1.1198

 .../python/python3/CVE-2025-0938.patch        | 131 ++++++++++++++++++
 .../python/python3_3.10.16.bb                 |   1 +
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 ++--
 meta/recipes-support/vim/vim.inc              |   4 +-
 9 files changed, 172 insertions(+), 40 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-0938.patch

-- 
2.43.0


