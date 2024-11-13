Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22692D637B9
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 20:42:34 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.21870.1731530551291994038
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 12:42:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NYHUZY++;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7242f559a9fso4694315b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 12:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1731530550; x=1732135350; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BerFcqh+ajLcvlJQB+KjWJtXuv8pk8Ptmc/IrZ7Rr7I=;
        b=NYHUZY++VitPxotLLaK2n19ReAyron5e+xTDiCeTJefj5QrTZBI9OkhMCIpwyCZSq+
         eZYaB8rb9IOEJkmMqNdRCoPQbM4H0q86YeQHt7WAnN0a/ksZE2MfpYO/Wj/BhxWbt95/
         6Wv8xm9X7ZEUMBCeMXGjHoCjyncWu8ltHo4Tr3U0nWnseNLpQHgpDgK/Cvqh1y3PU7lW
         rGVPh+0dBwMug2SZCVpMeq9DPG8flxexgpZOo+HWHyQ9PWvK3vWq4TxfHK518kOtYlKT
         2ZDq1ivaTtvaqMPcCn/6tnx7nF17WmeXPcXLOkc/xqWMv/6bmdfYFhoiOE92ydqDImkI
         jQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731530550; x=1732135350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BerFcqh+ajLcvlJQB+KjWJtXuv8pk8Ptmc/IrZ7Rr7I=;
        b=bOrZHC+b2+L0ATbMVji0+yfM1wm3cID0fS5qJnHltqURFMbelTaE3UuiX+xHsSiwDI
         JxOB6BGN1jvfabkMDUn9yXtwOJwdEmqT3wlc1YhGE2ksJ0zeYiQkP35uYomt5GpcT9K6
         0wKx3myikmJb1MojetsNiuNgseD0pHSPIyn8pMh+0sgrmZeep+y+m01vsCcXBws3d5Nd
         4P2ULxImleuETuHHZfxNJ6HrHCg1PT3BYDWfoa4dKUYPblCTywrV5gF7CdZD8RKNBC9v
         0c/xcksXlsgAvSyttECVgQhYA3bv0d1ji2gzbfE3GY0rn00F7bU21hROsIhW1NTyGWto
         B+4Q==
X-Gm-Message-State: AOJu0YwVhtSOBTYOPRwA2Bm2uU+wnQdCKKutg5QqXGTEwajByPyw1s6c
	i5IFbFmqIYDCOFpBv1UY4d1Bb0BJou4mwE3MgMLRUOkKzpn7AUy6M3oY+uhyOPrtWm41hz0FTLu
	1
X-Google-Smtp-Source: AGHT+IE73XD0/8flM0dPl50l6rqbe5Ex9roFGdrEXxFQROj2njxIcfiyfocNEFjOqGgkCIl8isWnAg==
X-Received: by 2002:a17:90b:44:b0:2e2:cc47:f1b0 with SMTP id 98e67ed59e1d1-2e9b16ec3d6mr26981660a91.3.1731530549576;
        Wed, 13 Nov 2024 12:42:29 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e84ee2sm114545595ad.274.2024.11.13.12.42.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 12:42:29 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 0/9] Patch review
Date: Wed, 13 Nov 2024 12:42:15 -0800
Message-Id: <cover.1731530398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 20:42:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207124

Please review this set of changes for scarthgap and have comments back by
end of day Friday, November 15

Passed a-full on autobuilder:

https://valkyrie.yoctoproject.org/#/builders/29/builds/431

The following changes since commit a051a066da2874b95680d0353dfa18c1d56b2670:

  build-appliance-image: Update to scarthgap head revision (2024-11-09 05:55:33 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Harish Sadineni (1):
  binutils: Add missing perl modules to RDEPENDS for nativesdk variant

Jiaying Song (2):
  enchant2: fix do_fetch error
  libxml-parser-perl: fix do_fetch error

Peter Marko (4):
  dropbear: backport patch for CVE-2023-48795
  curl: patch CVE-2024-9681
  gstreamer1.0: set status for CVE-2024-0444
  expat: upgrade 2.6.3 -> 2.6.4

Philip Lorenz (1):
  cmake: Fix sporadic issues when determining compiler internals

Richard Purdie (1):
  pseudo: Fix envp bug and add posix_spawn wrapper

 .../dropbear/dropbear/CVE-2023-48795.patch    | 234 ++++++++++++++++++
 .../recipes-core/dropbear/dropbear_2022.83.bb |   1 +
 .../expat/{expat_2.6.3.bb => expat_2.6.4.bb}  |   2 +-
 .../binutils/binutils_2.42.bb                 |   4 +
 meta/recipes-devtools/cmake/cmake.inc         |   3 +-
 ...mpilerABI-Strip-pipe-from-compile-fl.patch |  52 ++++
 .../perl/libxml-parser-perl_2.47.bb           |   2 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   2 +-
 .../gstreamer/gstreamer1.0_1.22.12.bb         |   2 +
 .../curl/curl/CVE-2024-9681.patch             |  85 +++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
 .../recipes-support/enchant/enchant2_2.6.7.bb |   2 +-
 12 files changed, 385 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2023-48795.patch
 rename meta/recipes-core/expat/{expat_2.6.3.bb => expat_2.6.4.bb} (92%)
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-9681.patch

-- 
2.34.1


