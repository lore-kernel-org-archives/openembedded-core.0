Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5968C61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:57:02 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.12381.1678895820366457066
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=tNCuFgM7;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id h12-20020a17090aea8c00b0023d1311fab3so2528031pjz.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 08:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678895819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qmlVbPWRVVOgFU+Up5N7v7h1th1Or2kKB59tmqL+3ws=;
        b=tNCuFgM78qx/a2qYV5SZEjVH+EWBxHx8xMrHTNtbI5hhyD9+7t6PHGaw4510cuHgxD
         cLOHW2hMcRE3hUq899NqL2KHyZhUE3avz13EyN96a4hf1llU+lyT11o8bs/FomCiCGQr
         OPEsFvH8IFKd4m769JlAYCvDsK1RzhBfeI77Y1kYTqCRjX6iwanMES4kJIKx3KFfJoPV
         N31DVMl21kIyC1lUuKv9DCNsKVktzhC2qDgqM2Fh340PAR/3MK5BPlwO+eIXdtUYIh4E
         W+wJy7sdJchOgqQYO3+jBxsPdc21U1iKw4ZH3mY4m+X7uGksbDKDFL5b7Y/FKf405MLJ
         N+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678895819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qmlVbPWRVVOgFU+Up5N7v7h1th1Or2kKB59tmqL+3ws=;
        b=BnmPTUTKrGFqwE5L166EiCh/xolLeRpWh8f/qqwSSIVrvo4vHAxKyo2zIBq9pDqqsg
         o8Rv0euiKTJcl/1xQcHzmbUrh3Oh0GxeNtXaDJe+rvlxc93fTGZNGJqSI+J1EGKsSTb/
         4nSP63jL4MVgc0TFX+8Q0PENnA0iaIC5r3Cs0UzKdX1JwEgiGtI5nOlVUfSnRI8pcn2c
         3qcAJd2fcYTEZbUq/PJQL988IlfssAyhxfnipqaOcJewoI7NCtCuPPpX4iaoBS3vRP/3
         sW93m0ZVtqJmlguLtP1GhMiM1CRMP4E4J3icf1rNb6VC6gry5Tq/PCV53IgdKqg554bm
         o/nQ==
X-Gm-Message-State: AO0yUKWIBlTEld/pyMOJ2qDCqpoNVQSQl4iT3IVqaGxP4TKxCtPAtK3r
	eF6qP8HuvA5n/SqbQv8C7/l9UBs3uU3S530doEk=
X-Google-Smtp-Source: AK7set9yy2IpR3DaOAoXd5onL8Jm+wqsdTGBjDcUlJo9zBgjQyRt51Kt5Bu2sGyEfNasvb6tBB2yPg==
X-Received: by 2002:a17:90b:4f48:b0:23d:1852:d3b7 with SMTP id pj8-20020a17090b4f4800b0023d1852d3b7mr245532pjb.25.1678895819306;
        Wed, 15 Mar 2023 08:56:59 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ce8-20020a17090aff0800b002339491ead6sm1584102pjb.5.2023.03.15.08.56.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 08:56:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/6] Pull request (cover letter only)
Date: Wed, 15 Mar 2023 05:56:54 -1000
Message-Id: <cover.1678895717.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178646

This is the final pull request for the dunfell 3.1.24 release.

The following changes since commit 51424b9955374196307aaf73cf4b6c184ce4fb6d:

  devshell: Do not add scripts/git-intercept to PATH (2023-03-06 04:54:35 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Ming Liu (1):
  linux: inherit pkgconfig in kernel.bbclass

Richard Purdie (1):
  oeqa/selftest/prservice: Improve debug output for failure

Ross Burton (2):
  shadow: ignore CVE-2016-15024
  vim: add missing pkgconfig inherit

Siddharth Doshi (1):
  harfbuzz: Security fix for CVE-2023-25193

Vivek Kumbhar (1):
  gnutls: fix CVE-2023-0361 timing side-channel in the TLS RSA key
    exchange code

 meta/classes/kernel.bbclass                   |   2 +-
 meta/lib/oeqa/selftest/cases/prservice.py     |   2 +-
 meta/recipes-extended/shadow/shadow_4.8.1.bb  |   4 +
 .../harfbuzz/CVE-2023-25193-pre0.patch        | 335 ++++++++++++++++++
 .../harfbuzz/CVE-2023-25193-pre1.patch        | 135 +++++++
 .../harfbuzz/harfbuzz/CVE-2023-25193.patch    | 179 ++++++++++
 .../harfbuzz/harfbuzz_2.6.4.bb                |   5 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb  |   2 -
 .../gnutls/gnutls/CVE-2023-0361.patch         |  85 +++++
 meta/recipes-support/gnutls/gnutls_3.6.14.bb  |   1 +
 meta/recipes-support/vim/vim.inc              |   2 +-
 11 files changed, 746 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193-pre0.patch
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193-pre1.patch
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2023-0361.patch

-- 
2.34.1


