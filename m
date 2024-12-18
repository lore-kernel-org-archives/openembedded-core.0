Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 946D8E77188
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 22:02:28 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.116955.1734559345756691196
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Dec 2024 14:02:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=N0UxX1jz;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-728d1a2f180so132540b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 14:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734559345; x=1735164145; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NEb5/vNhozjAtBW1zsK5gdaVrHMcKOdARP1SbTWof0k=;
        b=N0UxX1jzeU7Ft9qa9g1tS+oyvVqy6UCXP2YiKT1lO3DBH3FTkn2OUEZcWYBXnIP2s+
         PB0ZRMDLJbPZWSDCBxW4H7qunfEqME/QdddQBD2qqsM4fu91u+aXCE9MYT8oRlgXpClk
         GN3H2sL8g3+tHBXW8tY0uTPLxgJOZtjmyGpYkLxYgsJUMEcoLJDLmOWCDTGX0XxtU3cP
         y/NTWzX3pcZMeUYIYTalkxTLrZ3ctLh+WotaJqfRM/zzUoNWx5HdjdhxWncxN4GFQKFb
         yctshIE7uOsaIgHbMKhKpNBi29mVvTx/nTEvNNAST6tfnWVL1CUhsh9XnGPejN0qsE/L
         vTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734559345; x=1735164145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NEb5/vNhozjAtBW1zsK5gdaVrHMcKOdARP1SbTWof0k=;
        b=IO1KWbDZiFmc1CLsIANHB7RauXI2fKGDQz9Ch3O2u1FPioKXMW3SoOoxRflxhyS/lR
         AsiTy52Aeie856B/eyM+pUW6P57mMV2I0CfuyCSOJs8aqJTbPmlWggz1N368DgGOaITh
         YavTYRdV+P11nmQFU+8QA3WC2e6gDhBjiFQyjeKaC6kg8WnD6fNOArAT22XlrbJ3UCl+
         6kygDQM9lU85FYDHmrtH6Jh/2TlLXGaTs40VsImi51tqIemfzks5jbPZpv8Bo/YyUElp
         lf54iVlkS0jLhmy8GHvH2oj4wQiwAg1h/BouXwq2iUJuEMhodxDraPFZJ/ql98ieN0T9
         cQbQ==
X-Gm-Message-State: AOJu0Ywz34G3xV2vtImk3dGCcoLafQho2kXeoiIsjjuI1+O/7cfEIWA2
	KoHd1vuwc/VGSZt4YPQjg/eJ6I2cjk7iCrUIS4O/rWB3k2MccCOohAwWCT2uZBmz5t0ns1oOMT1
	g
X-Gm-Gg: ASbGnctgBdzQgK5L4vSCrHk/dFOf7WTttBAUeheaP5wvltLo6lTqrjHY4aNHVXjtNEG
	qRyKNEj76HXFHOlfP7/J8dMt8hQFBuFtAX9hdu1BYFOWkAKk1P9FJEnzVBDCFonfPHea9BBHPIN
	wD/LP657dM5cAqFhBA3nPJFJRoXdd7jqhlbi5UkmEUac8kc29t9liLjTXXwLpA8s2Q+p28Dmq8I
	vXdQq8THP8s1AShRH4JYEfqC6mEb0e5nW/fQQxq3yB/9w==
X-Google-Smtp-Source: AGHT+IFOTvCK5Wb1LwOAE8u5qSS6vwD++MSBIgfQ3+lHykzsXct/A9bnKUCAzW6xNWVvTeCiBorltw==
X-Received: by 2002:a05:6a20:7f8a:b0:1db:822f:36d8 with SMTP id adf61e73a8af0-1e5c70196bemr1431860637.3.1734559344500;
        Wed, 18 Dec 2024 14:02:24 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-801d5aa4b92sm7965116a12.13.2024.12.18.14.02.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 14:02:24 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/10] Patch review
Date: Wed, 18 Dec 2024 14:02:04 -0800
Message-Id: <cover.1734553652.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 22:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208880

Please review this set of changes for scarthgap and have comments back by
end of day Friday, December 20

Passed a-full on autobuilder:

https://valkyrie.yoctoproject.org/#/builders/29/builds/674

The following changes since commit b19b1e905d966443c4e4d17dfaeb299ae2526575:

  cve-update-nvd2-native: Tweak to work better with NFS DL_DIR (2024-12-18 06:41:14 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Alexander Kanavin (1):
  rust: add reproducibility patch to eliminate host leakage

Archana Polampalli (3):
  ffmpeg: fix CVE-2024-35366
  ffmpeg: fix CVE-2024-35367
  ffmpeg: fix CVE-2024-35368

Hongxu Jia (1):
  kern-tools-native: fix SyntaxWarning for RegEx calls on Python 3.12

Jiaying Song (1):
  subversion: fix CVE-2024-46901

Khem Raj (1):
  python3: Drop empty patch

Ross Burton (1):
  python3: add dependency on -compression to -core

Sunil Dora (1):
  gcc: Fix c++: tweak for Wrange-loop-construct

Yash Shinde (1):
  binutils: Fix CVE-2024-53589

 .../binutils/binutils-2.42.inc                |   1 +
 .../binutils/0016-CVE-2024-53589.patch        |  92 ++++++++++
 meta/recipes-devtools/gcc/gcc-13.3.inc        |   1 +
 ...ix-c-tweak-for-Wrange-loop-construct.patch | 113 ++++++++++++
 ...lize-struct-termios-before-calling-t.patch |  26 ---
 .../python/python3/python3-manifest.json      |   2 +-
 .../recipes-devtools/python/python3_3.12.6.bb |   1 -
 ...te-host-information-into-compilation.patch |  51 ++++++
 meta/recipes-devtools/rust/rust-source.inc    |   1 +
 .../subversion/CVE-2024-46901.patch           | 161 ++++++++++++++++++
 .../subversion/subversion_1.14.3.bb           |   3 +-
 ...yntaxWarning-for-RegEx-calls-on-Pyth.patch |  60 +++++++
 .../kern-tools/kern-tools-native_git.bb       |   4 +-
 .../ffmpeg/ffmpeg/CVE-2024-35366.patch        |  35 ++++
 .../ffmpeg/ffmpeg/CVE-2024-35367.patch        |  47 +++++
 .../ffmpeg/ffmpeg/CVE-2024-35368.patch        |  41 +++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |   3 +
 17 files changed, 612 insertions(+), 30 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0016-CVE-2024-53589.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0028-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-gh-114492-Initialize-struct-termios-before-calling-t.patch
 create mode 100644 meta/recipes-devtools/rust/files/0001-cargo-do-not-write-host-information-into-compilation.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion/CVE-2024-46901.patch
 create mode 100644 meta/recipes-kernel/kern-tools/files/0001-symbol_why-fix-SyntaxWarning-for-RegEx-calls-on-Pyth.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35366.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35367.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35368.patch

-- 
2.34.1


