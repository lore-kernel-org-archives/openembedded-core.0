Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71126C7618A
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 15:22:42 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.11664.1678807352450783688
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 08:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=2x7W4vMT;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id gp15-20020a17090adf0f00b0023d1bbd9f9eso5281792pjb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 08:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678807351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CHJPBKGoUNjM/8DyyAivAnIVOTS33qeBF6FWjkMy8oc=;
        b=2x7W4vMT3W3pxOzcUL4SERgQbbZIPjGY5cUdo7MbOAULaWBCJPEOyuRDSo86sV6U2r
         iidVg15Kxpnb1fviYYYfJ1e6g0CfCuwqUFvRfiYNGbhqnzO0p7IJowZ9Vdy/gA3nsC9j
         11uy5NXog6vfw+M4xRI4BS8Jdg7vWdB1I/F7GO/5DZVgNE0gysEFPLYcXHy7T00UiC4p
         s3APstmFu0MQrKWR6cs5dnN0gvNwgILDlJt/+xm5hkTYH/W/76Ja1LU1M9M2EzOOgriG
         rqUUPISqvUukuqC9BpJksOyxke+G9az2uBAAXmUOQweP5La8HPRCDCVc6dWgRSfxxWoC
         nCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678807351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CHJPBKGoUNjM/8DyyAivAnIVOTS33qeBF6FWjkMy8oc=;
        b=h5+MfVFN54TJUUqnADuAuzeB20ESob1nc3CUb2LvP9iKU9OlUpH8Wh4GjhaDD2njsv
         kgmbhiFRxCTR5fQoSsYa49rn8MWpKEKTciTO43QkkUcUyZdXUPpTCGNAUbR3K+YO0tVl
         gGDAjEdnQZD4BYEKmgyZpXP6VixfSpdcW0fJiZyGjMlH+/zYaPsDutiDBui0L01DpoKz
         EErCjvhaEe64QX90KpgWCJebkzLomuJ9w/oXUNKipxPLVlECmMgmHt/f2bsOYR36u5bw
         JLwdVO25OSjDNejsKwUFQ6jEuxHQ0TIGB0JNLVYIaRK+68oxR8ZkTzvEYnvFwedJ9kTe
         kYDQ==
X-Gm-Message-State: AO0yUKXaZGQ9Fi5liU87j8eA9n4Icw8zNXDstwJ6tFZYv+A1gbDarEfD
	YGjsHYstxL/clgCBesAiKr069ez9M0hjkr7aHdo=
X-Google-Smtp-Source: AK7set8IXTIw4zaLrFtL5SoS9uOYqnsYZ4yftYF6crxnAtQH2jKxqtlHtpDGUhMLxQ6CUhxQQdAS6g==
X-Received: by 2002:a17:90a:54:b0:23d:4e9d:2eb0 with SMTP id 20-20020a17090a005400b0023d4e9d2eb0mr207235pjb.36.1678807351329;
        Tue, 14 Mar 2023 08:22:31 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id p13-20020a17090a284d00b0023d0e743ff6sm1871977pjf.3.2023.03.14.08.22.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 08:22:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/6] Patch review
Date: Tue, 14 Mar 2023 05:21:49 -1000
Message-Id: <cover.1678807105.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 15:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178501

Please review this final set of patches for the dunfell 3.1.24 release.

We hope to do the release build this Thursday, so please have any comments
back as soon as possible.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5043

The following changes since commit 51424b9955374196307aaf73cf4b6c184ce4fb6d:

  devshell: Do not add scripts/git-intercept to PATH (2023-03-06 04:54:35 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

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


