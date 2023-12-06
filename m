Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1EC8C46CA0
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 13:56:07 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.32040.1701870961550188499
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 05:56:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qKlnxraG;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d053c45897so49372205ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 05:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701870960; x=1702475760; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gsgp7r8BxkpAhzlpjBOPxtb0GL2GKW6ZOLPgduTfCKs=;
        b=qKlnxraGKJSwadJw/RCSPoSIstmrbEGZuT2TUJZsEdEIIkpmQH3lcfl9lWWsWqQmf2
         xp1iL9CdLOYxOgeAr13AE09HvI5EEUB27HZ3ky24P5+GGIWsZGw4MC+XciMpH7j3x3wt
         ac7ApJbCZqGrxeHSqmvsCmkdumobVf374emvAfP3KVmKXbJhevpmiZ6c84BajA7K0BAc
         e7iQblJGgWL5mMnQpx2517C81meVlueAGKSmifHlfEKmMsd/qLsAzA5GjSYXyljZKVs6
         DUbF5wxQpbor1JAzyA0iervHWpZ/UDyLiKTtCiSxnDbzniRzj+mQQjrKpXVdC+dNgGXz
         /4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701870960; x=1702475760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gsgp7r8BxkpAhzlpjBOPxtb0GL2GKW6ZOLPgduTfCKs=;
        b=ABff5FpQDr7HQ6mHR43hhX7evq5oW6Vs37iKTeJE7/zpbaYlp4Tj2LZFNND9zAPtEH
         s2ZsUl5POQhi7LesM8SYL1Nvjg07VAwNByxHcBs+OX/0a3QIA0o5K+0oNfYWtlRRTIN6
         N7KywzY0tKMjAT5/g3vB2oi2jVSSd84MFgtzoHLauc14IZtrObCWziuDblsT0W5j9/+H
         eqOaqhKGAZlSGkbB7Qt3syQCj5DIT8UtT8MW2MllEm5hyrKOUU6DV7XwAksmyQoexRLL
         QC/2vF+OroOn79Fqg+SkJ1y/yaORedfrPjzrB0P+Ndp9rG4JYGtJMza+mln+LoDjSHsT
         lKQw==
X-Gm-Message-State: AOJu0Yzza1x5+jV0orV1fgA4hjO0zze2pfa8epp/8Y//D4gKYKN4086t
	R1gQbdLrx9Gnk7WgxYx7p62zhYkMHbPfvf1espM=
X-Google-Smtp-Source: AGHT+IG7hnfwQHFqcUeqkfxJDUfhHuulMaTGO9SVvooOaSCus2+w1YA4I2SqpZxKGfuN7+v21XYDIg==
X-Received: by 2002:a17:902:eb53:b0:1d0:6ffd:9e35 with SMTP id i19-20020a170902eb5300b001d06ffd9e35mr888413pli.135.1701870960036;
        Wed, 06 Dec 2023 05:56:00 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id h14-20020a170902680e00b001d07b659f91sm7887650plk.6.2023.12.06.05.55.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 05:55:59 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/11] Patch review
Date: Wed,  6 Dec 2023 03:55:43 -1000
Message-Id: <cover.1701870718.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 13:56:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191886

Please review this set of changes for dunfell and have comments back by
end of day Friday, December 8

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6293

The following changes since commit 0764da7e3f1d71eb390e5eb8a9aa1323c24d1c19:

  vim: use upstream generated .po files (2023-11-28 12:31:43 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Ashish Sharma (1):
  mdadm: Backport fix for CVE-2023-28938

Bruce Ashfield (3):
  linux-yocto/5.4: update to v5.4.258
  linux-yocto/5.4: update to v5.4.260
  linux-yocto/5.4: update to v5.4.262

Lee Chee Yang (2):
  epiphany: fix CVE-2022-29536
  qemu: ignore CVE-2021-20295 CVE-2023-2680

Steve Sakoman (1):
  cve-exclusion_5.4.inc: update for 5.4.262

Tim Orling (1):
  vim: upgrade 9.0.2068 -> 9.0.2130

Vivek Kumbhar (1):
  libsndfile: fix CVE-2022-33065 Signed integer overflow in src/mat4.c

poojitha adireddy (2):
  binutils 2.34: Fix CVE-2021-46174
  binutils: Mark CVE-2022-47696 as patched

 .../binutils/binutils-2.34.inc                |  1 +
 .../binutils/binutils/CVE-2021-46174.patch    | 35 ++++++++
 .../binutils/binutils/CVE-2023-25588.patch    |  3 +
 meta/recipes-devtools/qemu/qemu.inc           |  7 ++
 .../mdadm/files/CVE-2023-28938.patch          | 80 +++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.1.bb      |  1 +
 .../recipes-gnome/epiphany/epiphany_3.34.4.bb |  1 +
 .../epiphany/files/CVE-2022-29536.patch       | 46 +++++++++++
 .../linux/cve-exclusion_5.4.inc               | 79 ++++++++++++++----
 .../linux/linux-yocto-rt_5.4.bb               |  6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 ++---
 .../libsndfile1/CVE-2022-33065.patch          | 46 +++++++++++
 .../libsndfile/libsndfile1_1.0.28.bb          |  3 +-
 meta/recipes-support/vim/vim.inc              |  4 +-
 15 files changed, 306 insertions(+), 36 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2021-46174.patch
 create mode 100644 meta/recipes-extended/mdadm/files/CVE-2023-28938.patch
 create mode 100644 meta/recipes-gnome/epiphany/files/CVE-2022-29536.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065.patch

-- 
2.34.1


