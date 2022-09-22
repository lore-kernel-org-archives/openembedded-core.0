Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E90EBECAAD8
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 21:48:08 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web09.1016.1663883280568151357
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 14:48:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=AJrvYixo;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id a80so10580057pfa.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 14:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=n/hAvNP6IjZnzTr9bbZXajV8XnYxyss34MQchpaVRyI=;
        b=AJrvYixoDeCQw610e6V5miOsQqTDZ0b8ck5bEbVvL0r6kmwPzfx+OfSKIeJYCxNxDV
         Upp+oyV5qVs5nbSCxN7LqT+V0V0MsBY7CzXXnmo+7MguFzOuAkWi83JHcK+9m+zm2dem
         +Aus4dXaU2VlEXcRfo2D+z5fcWT7lhFPw7R7WeBqj1Eue79i1/pOG9s/UHYb1qC2OkOl
         wtLrKm+qfHiMFbnCQVVXEXFWCwX7p4CELVa1hBbRYAuLl6r1/2JnbPn41nlnCB9EUhUT
         thwiHPqGJTI58VQchx6g30txVZodDxbzRpiRUJgpy+lC1KcGaGgMppUpvmuN0W/UPR2e
         WLkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=n/hAvNP6IjZnzTr9bbZXajV8XnYxyss34MQchpaVRyI=;
        b=fDMO2gnoKTekIGS40IZtSkj0Z4P4oURrkHZptjNIFpBv0FHaSKLF6ydwXtwre3nO6O
         LJ27sjeBIoadB2jKV3JlkzAY0qntDRrlP5dHdDlMVa2xZzau4A0tMIJew1/xmmNXY4Dx
         I3z8IcS8QJliV4huSpCnyI/ka1beZjW3Xaewn+13tmH94Sr4pnbPKlv0u9siFlKEhDUM
         80P1wnPIOVweRN6pcaLYSt2082AH7y8fPmBvd7CeVM+ekuDZnvlFT4X1FRPwdo1f665M
         1f3wAR8IWiWwFKU+JrDu9Y/MSY4Hn16ZzujeEZzOGmkAy0OwTahDFBB6LUTo5cu4n35p
         TPvA==
X-Gm-Message-State: ACrzQf3TkhwMMGpNw4+o6GSmOSstFYOM50xlJhdVfSb8R1796ztUAVbT
	73gmNIm3RSYrdkBdYujP8DSs+H3OxHa+nwBn
X-Google-Smtp-Source: 
 AMsMyM44yxgrSiv0Kp1yQCIbXudIwCbWQoouFl4ovopTSkJE4fSAKVsDtIcHMe1GZc98twLXjWrqmg==
X-Received: by 2002:a63:2a82:0:b0:43c:1ef8:4093 with SMTP id
 q124-20020a632a82000000b0043c1ef84093mr3162101pgq.251.1663883279496;
        Thu, 22 Sep 2022 14:47:59 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 u4-20020a170902714400b0016ee4b0bd60sm4574813plm.166.2022.09.22.14.47.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 14:47:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/5] Patch review
Date: Thu, 22 Sep 2022 11:47:45 -1000
Message-Id: <cover.1663883154.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Sep 2022 21:48:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170989

Please review this set of patches for dunfell and have comments back by
end of day Friday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4259

The following changes since commit f547c9610f8c17c3da9ca3f7a79902d2ffbfca49:

  qemu: Add PACKAGECONFIG for brlapi (2022-09-20 11:09:59 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Bruce Ashfield (2):
  linux-yocto/5.4: update to v5.4.212
  linux-yocto/5.4: update to v5.4.213

Lee Chee Yang (1):
  subversion: fix CVE-2021-28544

Sana Kazi (1):
  sqlite3: Fix CVE-2021-20223

Virendra Thakur (1):
  expat: Fix CVE-2022-40674

 .../expat/expat/CVE-2022-40674.patch          |  53 +++++++
 meta/recipes-core/expat/expat_2.2.9.bb        |   1 +
 .../subversion/CVE-2021-28544.patch           | 146 ++++++++++++++++++
 .../subversion/subversion_1.13.0.bb           |   1 +
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +--
 .../sqlite/files/CVE-2021-20223.patch         |  23 +++
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb |   1 +
 9 files changed, 243 insertions(+), 18 deletions(-)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-40674.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion/CVE-2021-28544.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2021-20223.patch

-- 
2.25.1


