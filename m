Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F32C3DA40
	for <webhook@archiver.kernel.org>; Sat,  8 Jul 2023 15:56:07 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.340.1688831759724220277
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Jul 2023 08:55:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=11aN/0e4;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-262e3c597b9so2162888a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Jul 2023 08:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688831759; x=1691423759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=q75v0KuIkNdoilfh7c8JiwIWgLv/GhcLe9gaBoxaFFI=;
        b=11aN/0e41woY+7rHcqgd8L8R2G4/qDuMMFmr4KQom7o2+6vtbFGP2rNzur9KHJAhek
         d5UvfMQc+NdJ2DhdqbIamsbZhKs0PenS5wAgFJQTDe42okhG0HebFQxSAAO57h4M2m97
         VeWoeFqTrRmB07J88c0L/TShTcehxRQ+Ikn0ejXVi719t7ECUUBWu84eVxMNa8oXOtOq
         grHNGBPrUlJ3gXY8n2YfjnPxGpEJKy2aWp7fWb2Z7EHL06Gt7s/Ol9uOMIjEyWHPmM/D
         BG13dBDvq8oc8GZ/hgtclBkzte+UeIlirKPcdf8qJOVzvHJoD/nyW1FjRlIcYN5NLrYg
         egJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688831759; x=1691423759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q75v0KuIkNdoilfh7c8JiwIWgLv/GhcLe9gaBoxaFFI=;
        b=eavDAIn02TE2sC8OH+FWwqGo5UQD7YxsrrevnrEf5XHfOY1jMDoEgLkc1IdGnDtBaG
         BlsfLQj8MzzIUyLREcgUgRVWdGN1IsVICyBffFP335stsiuwa14T7+RxBTxZpgSVS814
         okQpXUy9G6+E7ILkSPo6qN1AG7iMYdwyubqNwi2iGrNWX+O7l6idxaZlrKe8IDlCM51M
         XGm/hBOW9gMDxsvAivA11NNfrIMyGMXFi2+sW+rTFv8awUjemyZZCaiG0fEl4MzXOddA
         vjGvYXJIT7xdVJ9tXtAzsbTfqNREd3AvRVyCXcqE+fbwSZfmDwo5NRyMVBBKlvepyC+V
         QfnQ==
X-Gm-Message-State: ABy/qLZ9oTHqtIVU3f9cbeyIb1W4Q3ij5/GNCsNmG1RD6uaFRqGS+Ff5
	clW0fcyDR7c/5xIraM81+ECVU7mLM1lDpUkGObM=
X-Google-Smtp-Source: APBJJlEJFZvRkQD4biLTVCfQPNAwULNyXnb+9tPZJmdcbgeozw/echcvtwuu7AyL3gd0sp2uJJqvoA==
X-Received: by 2002:a17:90a:ad92:b0:263:e813:ae9a with SMTP id s18-20020a17090aad9200b00263e813ae9amr8174190pjq.12.1688831758497;
        Sat, 08 Jul 2023 08:55:58 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u14-20020a17090a410e00b00263f6687690sm3257801pjf.18.2023.07.08.08.55.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 08:55:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/17] Patch review
Date: Sat,  8 Jul 2023 05:55:34 -1000
Message-Id: <cover.1688831566.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Jul 2023 15:56:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184020

Please review this set of changes for dunfell and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5571

The following changes since commit b7530e5360babbe9321ee4cf1e336412116a98cb:

  linux-yocto/5.4: cfg: fix DECNET configuration warning (2023-06-29 03:55:23 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexander Kanavin (3):
  scripts/runqemu: split lock dir creation into a reusable function
  scripts/runqemu: allocate unfsd ports in a way that doesn't race or
    clash with unrelated processes
  grub: submit determinism.patch upstream

Chee Yang Lee (2):
  sysstat: fix CVE-2023-33204
  python3: upgrade to 3.8.17

Fabien Mahot (1):
  oeqa/selftest/bbtests: add non-existent prefile/postfile tests

Hitendra Prajapati (1):
  grub2: Fix Multiple CVEs

Kai Kang (1):
  pm-utils: fix multilib conflictions

Lorenzo Arena (1):
  conf: add nice level to the hash config ignred variables

Martin Jansa (2):
  go.bbclass: don't use test to check output from ls
  kmod: remove unused ptest.patch

Mikko Rapeli (1):
  useradd-staticids.bbclass: improve error message

Pavel Zhukov (1):
  lib/terminal.py: Add urxvt terminal

Rusty Howell (1):
  oe-depends-dot: Handle new format for task-depends.dot

Thomas Roos (1):
  oeqa/selftest/cases/devtool.py: skip all tests require folder a git
    repo

Vijay Anusuri (1):
  cups: Fix CVE-2023-34241

Wang Mingyu (1):
  mobile-broadband-provider-info: upgrade 20221107 -> 20230416

 meta/classes/go.bbclass                       |   2 +-
 meta/classes/useradd-staticids.bbclass        |   2 +-
 meta/conf/bitbake.conf                        |   2 +-
 meta/lib/oe/terminal.py                       |   4 +
 meta/lib/oeqa/selftest/cases/bbtests.py       |   8 +
 meta/lib/oeqa/selftest/cases/devtool.py       |   8 +
 .../grub/files/CVE-2020-27749.patch           | 609 ++++++++++++++++++
 .../grub/files/CVE-2021-20225.patch           |  58 ++
 .../grub/files/CVE-2021-20233.patch           |  50 ++
 meta/recipes-bsp/grub/files/determinism.patch |   2 +-
 meta/recipes-bsp/grub/grub2.inc               |   3 +
 meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb   |   5 +-
 .../mobile-broadband-provider-info_git.bb     |   4 +-
 .../python/files/CVE-2022-45061.patch         | 100 ---
 .../python/python3/CVE-2022-37454.patch       | 105 ---
 .../{python3_3.8.14.bb => python3_3.8.17.bb}  |   8 +-
 meta/recipes-extended/cups/cups.inc           |   1 +
 .../cups/cups/CVE-2023-34241.patch            |  65 ++
 .../sysstat/sysstat/CVE-2023-33204.patch      |  46 ++
 .../sysstat/sysstat_12.2.1.bb                 |   1 +
 meta/recipes-kernel/kmod/kmod/ptest.patch     |  25 -
 scripts/oe-depends-dot                        |  21 +-
 scripts/runqemu                               |  48 +-
 23 files changed, 907 insertions(+), 270 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-27749.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-20225.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-20233.patch
 delete mode 100644 meta/recipes-devtools/python/files/CVE-2022-45061.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2022-37454.patch
 rename meta/recipes-devtools/python/{python3_3.8.14.bb => python3_3.8.17.bb} (98%)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-34241.patch
 create mode 100644 meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch
 delete mode 100644 meta/recipes-kernel/kmod/kmod/ptest.patch

-- 
2.34.1


