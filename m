Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19757C71153
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 14:22:54 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.49478.1693837368336616093
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Sep 2023 07:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KC8EXCKX;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-68a3f1d8be2so1201420b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 07:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1693837367; x=1694442167; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OZ3ApVRd8hj8fDC8Sq3NAsMMaDJ46119LxyoEwHeLYY=;
        b=KC8EXCKXeLVHOy8HbYBX3OATQ9Zhyw8ajkP7m4s5W/JkSeSkBfFRx1zuSIkNdZgJea
         b1YrsVf8iN5qk0yG00uc0lSrkQh8QYGMr1NOTmsA+2m5G1Cdwe28Xw3oBEKzWM6tOPRE
         K4XYSMYzepdiTLeUDbMVk2Cjxu8X3WW/loy8vJdHd8sXzqI3itlOG3jzzz1MZ7P3PC+y
         DaCohv+RE5Cvdi2Lwk9dJVJtW4GYBXG63aGQxPBtGuWaD2xIXtirRWl+WSaJ7oa70fJY
         IPSninBK2/t1c9YivYqBZzbxbgtYcNMygwL08/RhN466aXTiLEEFrVOJxMYlTQer2IYV
         z+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693837367; x=1694442167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OZ3ApVRd8hj8fDC8Sq3NAsMMaDJ46119LxyoEwHeLYY=;
        b=Jbcz37A42XZo/cyLxQoBzaacnaPqMu1Oz+8uKr0LCZ+l6tP9V+nLPfKijVtE53HgqR
         IA0hP43EOZZwpxg+HM/1Pp+bxrWn5wpdoyvdNS9auisLqUr/hg5o9erKqVBOqmzTZtzD
         Xa5vd5xMjEERsgGRaZZB+IiBscWoTc/KTva2ItinWpfAX5I2gpK5xHEF+PWuU+V6mYDT
         rKxaJbALScQH4relzh5FFr7W0sZzKrtQJBuzEmnM9/FEfDkKaRN4iocfzhLkzZbhIwyU
         DY3IR3Wkz832F+oL9X3j0EIL8+OdfRd17UkMMb/n4ObSHr95M1RXCTeOegZ0bMLUELc1
         djkw==
X-Gm-Message-State: AOJu0YxGDaU4Sq0nt5MmAQVZQGMsKnuObJSI1bRrQAmppwclByB+VpnA
	ckhR1FijvbtuyTFkBMPhJp0wRCJBzkMac6a6Ajg=
X-Google-Smtp-Source: AGHT+IFgHo3A9kZTJYvqpevzLLxefANm01TGj1EdceoI1BJUkBtStQeiSTzTV01MqGIwHNNaTi/fSg==
X-Received: by 2002:a05:6a00:22ce:b0:68b:dbad:7ae0 with SMTP id f14-20020a056a0022ce00b0068bdbad7ae0mr13997928pfj.21.1693837367145;
        Mon, 04 Sep 2023 07:22:47 -0700 (PDT)
Received: from xps13.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id z14-20020aa785ce000000b00689f10adef9sm7443032pfn.67.2023.09.04.07.22.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 07:22:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/5] Patch review
Date: Mon,  4 Sep 2023 04:22:35 -1000
Message-Id: <cover.1693837231.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 14:22:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187182

Please review this set of changes for dunfell and have comments back by
end of day Wednesday, September 6.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5815

The following changes since commit 3575290c4cc937ae2f2c5604a5619ac6de9aa071:

  grub2.inc: remove '-O2' from CFLAGS (2023-08-27 06:30:22 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Ross Burton (3):
  linux-yocto: add script to generate kernel CVE_CHECK_WHITELIST entries
  linux/cve-exclusion: add generated CVE_CHECK_WHITELISTs
  linux/cve-exclusion: remove obsolete manual entries

Vijay Anusuri (2):
  inetutils: Backport fix for CVE-2023-40303
  go: Backport fix for CVE-2023-29409

 ...tpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch |  283 +
 ...03-Indent-changes-in-previous-commit.patch |  254 +
 .../inetutils/inetutils_1.9.4.bb              |    2 +
 meta/recipes-devtools/go/go-1.14.inc          |    1 +
 .../go/go-1.14/CVE-2023-29409.patch           |  175 +
 meta/recipes-kernel/linux/cve-exclusion.inc   | 1827 -----
 .../linux/cve-exclusion_5.4.inc               | 7164 +++++++++++++++++
 .../linux/generate-cve-exclusions.py          |  101 +
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |    1 +
 9 files changed, 7981 insertions(+), 1827 deletions(-)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/0001-CVE-2023-40303-ftpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/0002-CVE-2023-40303-Indent-changes-in-previous-commit.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-29409.patch
 create mode 100644 meta/recipes-kernel/linux/cve-exclusion_5.4.inc
 create mode 100755 meta/recipes-kernel/linux/generate-cve-exclusions.py

-- 
2.34.1


