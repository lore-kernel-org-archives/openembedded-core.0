Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0911AC64EDF
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:11 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.13841.1650491490188527786
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 14:51:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=6I3ZDG/d;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id k14so2962972pga.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 14:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SDJ1UF3e+50GVWO+QheHCLcgNr4bKJ3o7Et+vlOJulk=;
        b=6I3ZDG/d87XRy8clYSfkzWMHZuLuRkviwon7BkPfYTEmHOvHDLcdym8gIL3p76ry1r
         VPFJP1Lrn30+Ah9+GpQiquC/raWUoetwMsClIbKTpTOyKKnVriywbvx72Vhra8hUGlX1
         6uryxl6lU9acR6gmvMGYOF9MMZtnMcyG9wIA7C6EyIkAdr9hsTMPqHizcrnGMC5uKRIf
         qdo4Dz2JKiDu8UbuEq1JLbFsrJEAEgDfxYDA4X4R+zfR0ZmmvTsbAd3thdL4MbrwYHes
         5JJmKjDyc5Hcu0Lc76v1UszWyM6DCRmvsZaKr0pPvla3sLIUcSd8Vxc9N3aDZ47S2UX6
         Tdtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SDJ1UF3e+50GVWO+QheHCLcgNr4bKJ3o7Et+vlOJulk=;
        b=DLgu0asX6HFgVefe1bksPI0rBMLWJQWtJHbsEQYV1WTx+yqRmiWye1hNgCCfn46KBZ
         K3YBpJClR/JyRtfenuubS5Wv9HLayB28OP700+A13ETiFLvKlJPVHy/YhIAI+xsNXjtP
         U8U9pEVOdekbRWZoFqzww3Sg4aRkQ38DJ3fvT/Ae1jwzsgRYQIh0I4yIyw6UrVAqxHqk
         i5It4HEcxhU/x357ETM3QDMkuQ80ibOaydlnB8at8dKiLQMjjm6G5/LUvvAykjyCnrZy
         KrlvTwbblcNY421Gg4bPmePayVJ3trIaW1XOomEIMB8qzV/aMBgLXNxHiDghSK4dM7az
         2YPw==
X-Gm-Message-State: AOAM532LZZ7VMgvCjvzx8bqjlITQpuhcTz0BYXnG9CeXOeRIVSkHV5yH
	EsG0OaYI1pKQ6Ed8258neoIGahsaSLj2NqSOJLM=
X-Google-Smtp-Source: 
 ABdhPJwsfYTwfKXqZKEnrjQsxxgceHmPO+ep25LW8MkYsX1oGIKG7Y37occsQ9ZG8V9L561UTZ+ueg==
X-Received: by 2002:a05:6a00:1146:b0:4c9:ede0:725a with SMTP id
 b6-20020a056a00114600b004c9ede0725amr25697819pfm.35.1650491488917;
        Wed, 20 Apr 2022 14:51:28 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 e126-20020a621e84000000b0050567191161sm21102153pfe.210.2022.04.20.14.51.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 14:51:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/9] Patch review
Date: Wed, 20 Apr 2022 11:51:07 -1000
Message-Id: <cover.1650491190.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164727

Please review this set of patches for dunfell and have comments back by end
of day Friday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3552

except for a known intermittent issue (the infamous ping issue), which passed on
subsequent re-test:

https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/5054

The following changes since commit 8fd5133fc7f6bc84193ec6fcbc1746c59bfc8caf:

  libxshmfence: Correct LICENSE to HPND (2022-04-18 12:13:17 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Bruce Ashfield (5):
  linux-yocto/5.4: update to v5.4.182
  linux-yocto/5.4: update to v5.4.183
  linux-yocto/5.4: update to v5.4.186
  linux-yocto/5.4: update to v5.4.188
  linux-yocto/5.4: update to v5.4.190

Peter Kjellerstedt (1):
  u-boot: Correct the SRC_URI

Steve Sakoman (1):
  git update from 2.24.3 to 2.24.4

wangmy (1):
  linux-firmware: upgrade 20220310 -> 20220411

zhengruoqin (1):
  wireless-regdb: upgrade 2022.02.18 -> 2022.04.08

 meta/recipes-bsp/u-boot/u-boot-common.inc     |   4 +-
 .../git/files/CVE-2021-21300.patch            | 305 ------------------
 meta/recipes-devtools/git/git.inc             |   1 -
 .../git/{git_2.24.3.bb => git_2.24.4.bb}      |   4 +-
 ...20220310.bb => linux-firmware_20220411.bb} |   4 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 ....02.18.bb => wireless-regdb_2022.04.08.bb} |   2 +-
 9 files changed, 25 insertions(+), 331 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/files/CVE-2021-21300.patch
 rename meta/recipes-devtools/git/{git_2.24.3.bb => git_2.24.4.bb} (51%)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220310.bb => linux-firmware_20220411.bb} (99%)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2022.02.18.bb => wireless-regdb_2022.04.08.bb} (94%)

-- 
2.25.1


