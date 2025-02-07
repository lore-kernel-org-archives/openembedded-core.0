Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 150A7C0219D
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 22:07:04 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.1165.1738966017911511794
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 14:06:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CBmMxu13;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21f6a47d617so2077405ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 14:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738966017; x=1739570817; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=X0evliIaUysBWKGnucc9sVc4b0+Sc4WA1D+XGLWx67k=;
        b=CBmMxu139N9BbOW94VS3KzsY+Ou9OmdDuQy6PE+DNgDOwsNknECAwR11srarUPD7vl
         Fb40Sbt1oEf9EDTnFNscp7g0ur2aO4vdmFlnAwEym0SFQDTY9mKhVUjipieBCXdySUpr
         POqimgfA3v6yO+MWtkZ/qF/8YAkDrbuuOAhy1y0LHJCeqxVC7wFwZDUmvpvycU2qbYLZ
         JAAzXVlAXYnHM91p5RLDoAxr/8mcNaLIE3WBu80BXOUfdjodAffRkmj0zc21w+oFCCEh
         qMCurLdpOTjQn1JZPG4MKTS2mHJj6U2N4ZMMeXkh6COpmNZ6Aq6608fMYkXb5l5tNHBG
         A0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738966017; x=1739570817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X0evliIaUysBWKGnucc9sVc4b0+Sc4WA1D+XGLWx67k=;
        b=HCetugGiKiDxK46iyIjf8IfX/dSzGBTOmupy7Gb2JERMecTT4I7CLY8FqgfzS5jfhq
         jPv5h3xbNGS2jbVX6SN7HvrqrlgTGYcxcIW9e/SrlcMmIinJxvmjW3wd5MR/B4e4w5dw
         ODgbgwbxc27JpEh0zGqXrZusqLTUI9VvNaYHtVc2KTXNslymCPsfrIXkoCWJ66JIb+6o
         LnxD24nTUJORfDSzH559hISECZ7FBLqTxJaA1ib6ay+X/84zS7yDL/mB0RnEV3gc/9My
         qgPIffqlbXQevgm6hurIy0KNHgTef4pPLqu0uTlF0Q9UpbTU9qcoM0JsBLeaX6aXG4t8
         R8bw==
X-Gm-Message-State: AOJu0YwUPKUMtsA3iIVIqD/+FMBtHmfW28mzx9NYa5/+nybAM35OLIDM
	QpAA9sAG0Kmvb1NTbS8uMHkF9361jEPYscZ/PmLxnSy1v51SsSj49uKnjyGh5/Xnvt8enJ6p2Kd
	x
X-Gm-Gg: ASbGncsaw/DWkBTqN6Aycj+hslAiFn2PIfb4/rXGBdqhSpmfwMZh6tlqYv6jheXg/B/
	BR88npiIM2jwqIotC/wvbb5Waj3DwiCA1eZb8EYyp9WWNXkULZPeTirgk+o9ICS2TCOZOv+wiwS
	O2nwMTCeawxqaMVFTIDRXL7JuQcmKuC9Jd8Qhu0tLopIi19uThiK0Ekd4miuldrMYd3Mib8X8fU
	vQUId9UVpLOOxqo3BTK2RUbDIB7LlFycn+ocoTvE1KQx1cpMhkmGcewg5Y/5d5xeu6ZZ6GeKvuG
	EZ6V
X-Google-Smtp-Source: AGHT+IGuDvDxpJUHiim9YTZHJKv76opoNQLuaJHE+tvmHXleudAq32PRijCQ/MiJjGMBOYoJM3QOaw==
X-Received: by 2002:a17:902:ef51:b0:215:6995:1ef3 with SMTP id d9443c01a7336-21f4e6a1125mr75508635ad.3.1738966016872;
        Fri, 07 Feb 2025 14:06:56 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51af65a31sm3586737a12.53.2025.02.07.14.06.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 14:06:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 00/12] Patch review
Date: Fri,  7 Feb 2025 14:06:41 -0800
Message-ID: <cover.1738965898.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 22:07:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210999

Please review this set of changes for styhead and have comments back by
end of day Tuesday, February 11

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/976

The following changes since commit a5e7ff4424a68335fc768e49a232a58011a5b160:

  devtool: ide-sdk remove the plugin from eSDK installer (2025-01-29 06:42:16 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/styhead-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/styhead-nut

Alexander Kanavin (2):
  enchant2: correct SRC_URI and other uris
  libxml-parser-perl: correct SRC_URI

Bruce Ashfield (3):
  linux-yocto/6.6: update to v6.6.71
  linux-yocto/6.6: update to v6.6.72
  linux-yocto/6.6: update to v6.6.74

Mikko Rapeli (1):
  systemd: set CVE_PRODUCT

Peter Marko (2):
  cve-check: restore CVE_CHECK_SHOW_WARNINGS functionality
  cve-check: fix cvesInRecord

Richard Purdie (2):
  resulttool/store: Fix permissions of logarchive
  oeqa/gitarchive: Fix syntax warning

Ross Burton (2):
  libnsl2: set CVE_PRODUCT
  lrzsz: update SRC_URI to avoid redirect

 meta/classes/cve-check.bbclass                | 16 +++++++----
 meta/lib/oeqa/utils/gitarchive.py             |  2 +-
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb       |  6 ++--
 meta/recipes-core/systemd/systemd.inc         |  2 ++
 .../perl/libxml-parser-perl_2.47.bb           |  2 +-
 meta/recipes-extended/libnsl/libnsl2_git.bb   |  2 ++
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 .../recipes-support/enchant/enchant2_2.8.2.bb |  6 ++--
 scripts/lib/resulttool/store.py               |  1 +
 11 files changed, 44 insertions(+), 33 deletions(-)

-- 
2.43.0


