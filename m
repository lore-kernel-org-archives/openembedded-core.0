Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1960C54E58
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 18:38:21 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.1158.1709836697392804787
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 10:38:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yHsjSwqV;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1dbae7b8ff2so10403155ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 10:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709836696; x=1710441496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7kZIkofZgMBddQUfytmy72DOdjdWA9Ww0aDAZhiEUvw=;
        b=yHsjSwqVEr59m6zm/qvAKBDA6hyz7m+OVrMT9S7adx1Kr8AksS6pKQmLABdcQKv/Fb
         +noc8AP7d+uP8/HvoKcyc1BubYNlDLqNY+fInsqh7+NNk0Y/qXXGJDJdrJJ5KwmhRtPp
         6JOIv8gxuXAiPRzQLwhcATZ64EIm9BZ8djZLJJ17z9K6GajYKkvORUJMe7U13PFAbw07
         S+KijXCmx1pDDinSYWTzg/wWpF/X6AMdX4BBfeILwWXuDRYfzWHMK5jxRKHMq/YW4Ky/
         8FgrZO5WpUwLX7/n+S8F9KLDMNEGeC3xxpv1BL54Rz3Fw86/pJqV0BRYu/1sgOz781Q0
         tpyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709836696; x=1710441496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7kZIkofZgMBddQUfytmy72DOdjdWA9Ww0aDAZhiEUvw=;
        b=EW87Efpk7WXk8z4BuIBefdmGLbeN/1fJXm5ap+xY61d157MSLhFHAZtog+k8i3VMgI
         9/tUuScPYJpubm8vHWPpVM9d7lCJ0Lg9f9hBsnwcZv/UZftQ/VLN8cWAJP9o+Tq4rttN
         W9KUsbwhs9gSXGGKb9LWDCJhR7hNCL0xg/E0XHoqXCt3WD9B0LcP0bv7qrLtgqZy/bHH
         qqo2OlFctskkN0gKIlD6LMgiKyoO1rL8raYKYSgXTG/1V4cgOz2cAcRUwFhGg6mixDoX
         /zKycTbNIIrJYTvKVE/L3eTBQRFezWjJjhl8x5BffAv9JyS+nUWDfV+1cGao0vKY9NpL
         8ScA==
X-Gm-Message-State: AOJu0Yw4RYNc9+c2WhBY52yCboULZ3BQzWz2yprPR4+MZrXhL539+b6z
	ZA6K9vYzkGQHeIxV9aMbmoqUUbGhPw69OZNdzJcnc2wTSKcRV3tKaz/q8VfSvC6zYSSAybjgyU1
	bVCA=
X-Google-Smtp-Source: AGHT+IFi32v5f/gNaWRy20jYmbZ/ihxQuJzY61wC0eKs2bhEVWEv0nmw6MbTVud6ylf/XLehPLEjiw==
X-Received: by 2002:a17:902:6b06:b0:1dd:33:6efb with SMTP id o6-20020a1709026b0600b001dd00336efbmr8371052plk.30.1709836696498;
        Thu, 07 Mar 2024 10:38:16 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id s5-20020a170902ea0500b001d7057c2fbasm14959026plg.100.2024.03.07.10.38.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 10:38:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/4] Patch review
Date: Thu,  7 Mar 2024 08:38:07 -1000
Message-Id: <cover.1709836581.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 18:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196811

Please review this set of changes for kirkstone and have comments back by
end of day Monday, March 11

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6658

The following changes since commit d63af11e92094487d6e358f27283e5385937e7a8:

  kernel.bbclass: Set pkg-config variables for building modules (2024-03-03 11:56:20 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Chen Qi (1):
  useradd-example: do not use unsupported clear text password

Fabio Estevam (1):
  u-boot: Move UBOOT_INITIAL_ENV back to u-boot.inc

Hitendra Prajapati (1):
  golang: Fix CVE-2023-45289 & CVE-2023-45290

Steve Sakoman (1):
  selftest: skip virgl gtk/sdl test on ubuntu 18.04

 .../useradd/useradd-example.bb                |   4 +-
 meta/classes/uboot-config.bbclass             |   4 -
 meta/lib/oeqa/selftest/cases/runtime_test.py  |   2 +
 meta/recipes-bsp/u-boot/u-boot.inc            |   4 +
 meta/recipes-devtools/go/go-1.17.13.inc       |   2 +
 .../go/go-1.21/CVE-2023-45289.patch           | 121 ++++++++
 .../go/go-1.21/CVE-2023-45290.patch           | 270 ++++++++++++++++++
 7 files changed, 401 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2023-45289.patch
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2023-45290.patch

-- 
2.34.1


