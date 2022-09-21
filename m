Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 628B9C6FA91
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 02:37:49 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.2075.1663727860057996443
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 19:37:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Glj4fbW8;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id q3so5002125pjg.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 19:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=Mx8vx36icE1fd3w881KSDDFHOQ2KITy26waj5RC7q9s=;
        b=Glj4fbW861LvGV+vGoa9mjtp+GfFdCokcm0cmNx33eTzCQQK9u5yTvHGTRafopk3Mb
         q9FiLIWLFGMNKL2xcVyVGefii0xKkF4C2BRZIj7NcDT1kNv2TYSvYYf4cvTRIU/hVUDQ
         RHK4aAzBohH20G+JJsCltb2TovgCYHD6Dn6jLq13OfvU+EqPgOH8f6k16hwjpswoENTh
         NrkI8VDGe6TwfDD05rdcDukhSQh96pviNt2tStpugjJY+WW79kmfNnwQ/pdv2L+YFRZI
         El1GR6fPjW+HCcD2ddu7qbzrIYoyBQcstC4XdEOYdtA5KBkFxhKpAB4y1nNryK4nHb+5
         J7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=Mx8vx36icE1fd3w881KSDDFHOQ2KITy26waj5RC7q9s=;
        b=YVh8o4oO2VyzD3ghxfE++e2D6VprGvDG185nXJTDtUBOrRk3EaJ8lw2jwfvcU4aDKN
         i3wUJ+w9zE7aNkORscOE04tfgiczWoDM4pUoNvgIbtvYSgSb8d2RRuauhgIyDAOyOe1F
         duUHVcxwkxZSouMh89Qs+8HNipOvThpAD9kVWg8Fm41vjKjFtDoSK+d46i2ZwZTqQEEl
         VVCHq+Q1MlWAefy6TUS7whkrDkwcU1oDqqO/7jEbRG9C9xU9aPRafoB/2o1ncOrZsDjS
         bZnfVNBqs1hsPSvehWYba+6oNJF8mX1pYiMqmlLv+rq3PeeSkAaQvnwVsdgIodU67qlw
         ckdg==
X-Gm-Message-State: ACrzQf0+FpjPlyHAWjjZrB7fbnz3VJXXtTG5xvYh6DPRQLjW+vh2fS93
	jtUL7bF1RNaRevWaGRfy1htbHikTdggy7nJd
X-Google-Smtp-Source: 
 AMsMyM6PAr7fLCdo78vUimM2ELDJ35uZ7PPu/RaUNlOO+Iaj77VjtFEVpmEDPEZFOWXM6xWwiKlOgw==
X-Received: by 2002:a17:90a:8906:b0:202:d763:72ab with SMTP id
 u6-20020a17090a890600b00202d76372abmr6989945pjn.56.1663727858813;
        Tue, 20 Sep 2022 19:37:38 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 207-20020a6215d8000000b00537a6b81bb7sm670154pfv.148.2022.09.20.19.37.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 19:37:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/6] Patch review
Date: Tue, 20 Sep 2022 16:37:11 -1000
Message-Id: <cover.1663727733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 02:37:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170920

Please review this set of patches for dunfell and have comments back by
end of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4245

The following changes since commit 46ba253059738dbd4de4bc7a7ac02a2585c498f5:

  vim: Upgrade 9.0.0341 -> 9.0.0453 (2022-09-14 08:08:22 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Andrei Gherzan (1):
  qemu: Define libnfs PACKAGECONFIG

Chee Yang Lee (1):
  qemu: fix and ignore several CVEs

Hitendra Prajapati (1):
  connman: CVE-2022-32293 man-in-the-middle attack against a WISPR HTTP

Richard Purdie (1):
  qemu: Add PACKAGECONFIG for brlapi

Virendra Thakur (2):
  sqlite3: Fix CVE-2020-35525
  sqlite3: Fix CVE-2020-35527

 .../connman/connman/CVE-2022-32293.patch      | 266 ++++++++++++++++++
 .../connman/connman_1.37.bb                   |   1 +
 meta/recipes-devtools/qemu/qemu.inc           |  17 ++
 .../qemu/qemu/CVE-2020-13754-1.patch          |  91 ++++++
 .../qemu/qemu/CVE-2020-13754-2.patch          |  69 +++++
 .../qemu/qemu/CVE-2020-13754-3.patch          |  65 +++++
 .../qemu/qemu/CVE-2020-13754-4.patch          |  39 +++
 .../qemu/qemu/CVE-2021-3713.patch             |  67 +++++
 .../qemu/qemu/CVE-2021-3748.patch             | 124 ++++++++
 .../qemu/qemu/CVE-2021-3930.patch             |  53 ++++
 .../qemu/qemu/CVE-2021-4206.patch             |  89 ++++++
 .../qemu/qemu/CVE-2021-4207.patch             |  43 +++
 .../qemu/qemu/CVE-2022-0216-1.patch           |  42 +++
 .../qemu/qemu/CVE-2022-0216-2.patch           |  52 ++++
 .../sqlite/files/CVE-2020-35525.patch         |  21 ++
 .../sqlite/files/CVE-2020-35527.patch         |  22 ++
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb |   2 +
 17 files changed, 1063 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2022-32293.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13754-1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13754-2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13754-3.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13754-4.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3713.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3748.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3930.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-4206.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-4207.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-0216-1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-0216-2.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-35525.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-35527.patch

-- 
2.25.1


