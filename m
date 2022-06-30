Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BADACCA47B
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 16:23:32 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.27161.1656606204037309604
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 09:23:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=HWgsL5ZA;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id q18so17422962pld.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 09:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=supYjEM6N26WUHzj7upwTAWQf21VUl1w0mgTvEfjXkg=;
        b=HWgsL5ZAygCaAm8PjC/K2F/JKJVsTZ3Z6bhmeNhLmdgqglq0WD/ukIAL6T74AqGfeA
         KU9fTP/1nVzAUXUNsB5i1wnxr/EIS7vgpagkOu5O2RLAh37nKRKuBuwVgGti7wB9UiBZ
         KCnlnoOxVVHtKZfwRYBtS586oVKuNzb+l0R0VSwfCBoAZNVUqU+hX85tdhwZDAWIBcAw
         YRPr9gumgw03SpIUcQQ/yLwTZGb7gGqm50TGehEuADAu2OsLodRYfi1yyqaeKCYgZvVX
         BkB/QNWmcysanUX/0gOwy3UB1V5ZwKj3c3hGfnl4B9ocvCQHIxgFcC4pT4aIldMJ7fAm
         rZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=supYjEM6N26WUHzj7upwTAWQf21VUl1w0mgTvEfjXkg=;
        b=EngRmOie5W2HOZdyIRGfl7irooBwchjXvBCKefp0rCouCzjfsszEpDAqTWjn/AX0WY
         X5EOehup358OdAWhCVdQw7rt6N0KVNCXl6NRbhKolcdPZQm3h6ZXu22QJTT2OAtXfb9v
         icoNUzXTfeDW5SwkPvWJN1qt9Uv1i51278bY2tP4GjQ6Yjb5kZ74vQhn7ldUKoeaa3AR
         tQku0lqDlIcSCHw0Sg8Yvo3nAJKNXajw7DTDlehWLENdm7P2gWaKJYx9VvkxBZOmm+Z4
         28z9j7flrtcFkSORzmP2PVpvx5iao9OAJG4uAZlHuF9fqBZeVfaww3nxIaJMfSK3o4vR
         G0fg==
X-Gm-Message-State: AJIora8Wc2SYWAtSLbvC28VdAvy/jS5QhPer5cQZU+I9oPVtB9jAXC3a
	uM61dRedyt2AoXFpxpp9XwH7t+uiaSKeNpWA
X-Google-Smtp-Source: 
 AGRyM1vKZVxjBswsGqAlowDUsrj+dupeCVAqhDL3l/8jLhTtx1QmpITEKbZN0C6to07CO5hjmoXAMg==
X-Received: by 2002:a17:90a:4f0f:b0:1ee:f746:eca7 with SMTP id
 p15-20020a17090a4f0f00b001eef746eca7mr12791136pjh.122.1656606202657;
        Thu, 30 Jun 2022 09:23:22 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 t129-20020a625f87000000b005259578e8fcsm10517611pfb.181.2022.06.30.09.23.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 09:23:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/12] Patch review
Date: Thu, 30 Jun 2022 06:23:00 -1000
Message-Id: <cover.1656605800.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 16:23:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167416

Please review this set of patches for dunfell and have comments back by end
of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3844

With the exception of a known autobuilder intermittent issue:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=14788

which passed on subsequent retest:

https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/5413

The following changes since commit c6f5fb5e7545636ef7948ad1562548b7b64dac35:

  linux-firmware: upgrade 20220509 -> 20220610 (2022-06-20 07:32:00 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Ahmed Hossam (1):
  insane.bbclass: host-user-contaminated: Correct per package home path

Alexander Kanavin (1):
  wireless-regdb: upgrade 2022.04.08 -> 2022.06.06

Hitendra Prajapati (3):
  golang: CVE-2022-24675 encoding/pem: fix stack overflow in Decode
  golang: CVE-2021-31525 net/http: panic in ReadRequest and ReadResponse
    when reading a very large header
  grub2: CVE-2021-3981 Incorrect permission in grub.cfg allow
    unprivileged user to read the file content

Joe Slater (1):
  unzip: fix CVE-2021-4217

Marek Vasut (1):
  lttng-modules: Backport Linux 5.18+, 5.15.44+, 5.10.119+ fixes

Marta Rybczynska (2):
  cve-check: add support for Ignored CVEs
  oeqa/selftest/cve_check: add tests for Ignored and partial reports

Martin Jansa (1):
  wic: fix WicError message

Muhammad Hamza (1):
  initramfs-framework: move storage mounts to actual rootfs

Richard Purdie (1):
  unzip: Port debian fixes for two CVEs

 meta/classes/cve-check.bbclass                |  41 ++-
 meta/classes/insane.bbclass                   |   2 +-
 meta/lib/oeqa/selftest/cases/cve_check.py     |  82 ++++++
 .../grub/files/CVE-2021-3981.patch            |  32 +++
 meta/recipes-bsp/grub/grub2.inc               |   1 +
 .../initrdscripts/initramfs-framework/finish  |   9 +
 meta/recipes-devtools/go/go-1.14.inc          |   2 +
 .../go/go-1.14/CVE-2021-31525.patch           |  38 +++
 .../go/go-1.14/CVE-2022-24675.patch           | 271 ++++++++++++++++++
 .../unzip/unzip/CVE-2021-4217.patch           |  67 +++++
 .../unzip/unzip/CVE-2022-0529.patch           |  39 +++
 .../unzip/unzip/CVE-2022-0530.patch           |  33 +++
 meta/recipes-extended/unzip/unzip_6.0.bb      |   3 +
 ...ndom-remove-unused-tracepoints-v5.18.patch |  46 +++
 ...emove-unused-tracepoints-v5.10-v5.15.patch |  45 +++
 ...racepoints-removed-in-stable-kernels.patch |  51 ++++
 .../lttng/lttng-modules_2.11.6.bb             |   3 +
 ....04.08.bb => wireless-regdb_2022.06.06.bb} |   2 +-
 scripts/wic                                   |   2 +-
 19 files changed, 754 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-3981.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-31525.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-24675.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2021-4217.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2022-0529.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2022-0530.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0017-fix-random-remove-unused-tracepoints-v5.18.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0018-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0019-fix-random-tracepoints-removed-in-stable-kernels.patch
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2022.04.08.bb => wireless-regdb_2022.06.06.bb} (94%)

-- 
2.25.1


