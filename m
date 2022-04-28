Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B751C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 21:47:11 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.2981.1651182429706181534
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 14:47:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=twsjbtbY;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id x12so5018940pgj.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 14:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+HZ7x8QcJ0dLVYwrbAzPDmmhggV3sMOnRrpnfnTLqWg=;
        b=twsjbtbYqWEVsolhfilV6J0JCJ7x8/3h1XX4JaneFz2R5NAYXzrdmwT+KpCYfgC1dp
         E+vj0TcBypArRCRcg2qZ5/Ys4jiCJ+3Hh+pluT682xZQMFigxlGEs089GXrJP0A0/hac
         xlfN6ZChnEyzgPgbNDo9Yk+gRXM0lEg8NUaYb2ewlvc3wzaU30uj63SzGwIHo81ckGUB
         CjgzDrZMEdVDc3W2uZX9byZbSFYpWnJLRS5/K3wUbPbZ3Y4ukQAKKrAwI/dHEPv7F+CJ
         u5Un07FvvBzkdWqHXMMZDIXdpblZ+c1OXD4K1NiKmHyAfO4HuCdNGtyNjcNpkBLw8Txg
         7QEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+HZ7x8QcJ0dLVYwrbAzPDmmhggV3sMOnRrpnfnTLqWg=;
        b=aGsd+eXe1CKiMnEPCFwtbJrA1YFnGErtxNgi1zhQ+SXUoxXvfeDA1HzdP/5Ujxlo3i
         m+lMzoBUWB76g7Xh/FQh2iJiU1PgMLA6jwZTPuRjRPXP/MzkgSyKmZbizrRsF6oyV5p/
         DXPowX3dT2RMuUn3KW1DVEi6wjvx1FYBodmJacyGE4df289TSPysyvziW0aBmC8w3w7t
         Hc2afp7z7Mr1jqhM6/JQ+dMhLWTuT4kMfXm7jPnE7c6GA+Le2hC/LvJo9wX8INSpAxE8
         82e+Ppl+XcNpkRJh5wN1/LuQM3ZwBvFA+6tJEzwUH4EPqesVPvh2VY2+fI2EZq3dbCzF
         FoLA==
X-Gm-Message-State: AOAM533sdXtdIh7PELEKisdIYr3t+cDi7u3+ppevk0R4040H9d+Y2p7U
	581FPt6fXXIodYG2Q5Z8YQqXnh+5KZ0/ri0D29k=
X-Google-Smtp-Source: 
 ABdhPJx0+J09eS/o7flo5gswbyOFhKRcPTEgOz1AsuUoq2YM1X7Ml47nmcGuOdKgsg5wkjkr4hVpHg==
X-Received: by 2002:a65:5b84:0:b0:398:fd62:6497 with SMTP id
 i4-20020a655b84000000b00398fd626497mr29306165pgr.179.1651182428243;
        Thu, 28 Apr 2022 14:47:08 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 c138-20020a624e90000000b005081f92826dsm749742pfb.99.2022.04.28.14.47.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 14:47:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/6] Patch review
Date: Thu, 28 Apr 2022 11:46:30 -1000
Message-Id: <cover.1651182153.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 21:47:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164978

Please review this set of patches for dunfell and have comments back by end of
day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3587

The following changes since commit 8e81d38048c953d0823abf04d5b2506cd988f0bb:

  build-appliance-image: Update to dunfell head revision (2022-04-25 15:58:54 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Dmitry Baryshkov (1):
  linux-firmware: correct license for ar3k firmware

Marta Rybczynska (1):
  cve-check: add json format

Richard Purdie (1):
  perf-build-test/report: Drop phantomjs and html email reports support

Ross Burton (1):
  boost: don't specify gcc version

Steve Sakoman (1):
  scripts/contrib/oe-build-perf-report-email.py: remove obsolete check
    for phantomjs and optipng

sana kazi (1):
  tiff: Fix CVE-2022-0891

 meta/classes/cve-check.bbclass                | 144 +++++++++++-
 meta/lib/oe/cve_check.py                      |  16 ++
 .../linux-firmware/linux-firmware_20220411.bb |   4 +-
 .../libtiff/files/CVE-2022-0891.patch         | 217 ++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |   1 +
 meta/recipes-support/boost/boost.inc          |   2 +-
 scripts/contrib/build-perf-test-wrapper.sh    |  15 +-
 scripts/contrib/oe-build-perf-report-email.py | 167 +-------------
 8 files changed, 388 insertions(+), 178 deletions(-)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-0891.patch

-- 
2.25.1


