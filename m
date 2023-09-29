Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6633DE728E5
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 20:05:05 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.27701.1696017897516530027
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 13:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GBPJh8/T;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-65cff6a6878so25731936d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 13:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696017896; x=1696622696; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DlvnKU5m/k0QSRm5LR5m5rctELYt3QvAkWOWAZsJ85c=;
        b=GBPJh8/T9JgyAPZUrn0Oau9mbq8hTjkqPuJJpGUEsih+Rbiap+yx+cL/+Mb4tbQc9r
         wXpH/gH0KbQ9Hji/3H29uzIsC2XDRad6d2Ckvq3s4nSGadvbYWNqcaLUhpDhNH/CcWjF
         CHNmJbXEOPMQS1fEZuwobfpeIGO4d1f1LLAt6y51j07gfHCcBN8GovnJ5ab0a4gJ+IzJ
         0bvmZUkLfX04Y8cL7SBcHeUVVEJlyG+VlnzLjY2BXKKbROMu1AophSGaembT86VSr0Yp
         bqDxuDLtiC08Zhnkt6C3H4TSMbAjEejc6HfpkisdHDvkb8fWOt+qqhYjHi+7GwgjpVBX
         YAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696017896; x=1696622696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DlvnKU5m/k0QSRm5LR5m5rctELYt3QvAkWOWAZsJ85c=;
        b=fvW8JEKJnGvBSxcYykSaUEQIH07OyUiU47BOnyIMeglG5vQMKlU5ESevBKT94BF+QI
         2kR1P/+NO6MMEjnydbE0fCLltd/IE8Q3vvScBKYL5x8FMaFlLEpiBykYz6QAto8OZxdB
         /cJFtcDcpxfJqLG6wIEJMKd6zzmrgyKvZXCbN8vSBNwAbG4SQ0vyMpEkdSPwMM+XjQQU
         eLpdFQscRI9dYNZHvsqNE8A9Mf9s31szxmPdxKIoUSHzG6sxqn14inkW8U+iHnYveljR
         MzbWSwQYD2oOTQJbdDJeKsTTIzoIW13/fLKC+Pv/c5uz4ye3M66o7qetnaLmHPvWzzdK
         vQCw==
X-Gm-Message-State: AOJu0YzXjkSm0y+xqwKFPqgV5DqJvy7yPcVyva8b/MbU0TqDIyxY8aQP
	gghCUstRrDPrdEjakanGYpo=
X-Google-Smtp-Source: AGHT+IGkOeU0PFkq+KuY02Bz9fbyAOu+DavYbHJYspsIwj39NSwa/xCtOY/5PqZE4UmxTIitbSX8cQ==
X-Received: by 2002:a0c:aa0b:0:b0:65d:89f4:d6c6 with SMTP id d11-20020a0caa0b000000b0065d89f4d6c6mr4490214qvb.53.1696017896496;
        Fri, 29 Sep 2023 13:04:56 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id t28-20020a0cb39c000000b0065cffe12ae9sm2115848qve.36.2023.09.29.13.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 13:04:56 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/10] kernel: consolidated pull request
Date: Fri, 29 Sep 2023 16:04:44 -0400
Message-Id: <cover.1696017123.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 20:05:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188419

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Given where we are in the release cycle, this clearly is NOT a typical
consolidated pull request.

I've done what normally takes about three weeks in about 4 days.

With 6.4 going EOL before expected upstream, it really isn't a suitable
reference kernel for the release.

So we've decided to take on the task of getting 6.5 ready and available,
and at the same time moving the -dev kernel to v6.6. The -dev kernel
testing for 6.5 was critical for this, since I already knew the core
was sane.

Also we've never shipped purposely mismatched libc-headers in the release,
so I also took the leap to update the libc-headers to match.

I've already sent fixes to meta-oe, and there's a btrfs update in this
series to fix breakage that I found in the tightly coupled packages.

I've built and booted core-image-kernel-dev, core-image-minimal, core-image-sato
for both glibc and musl for all the supported architectures.
There will be some things that break regardless, but this needs the
better coverage of the AB.

If this causes too much problems, our choices are to ship 6.4 EOLd, or
fall all the way back to 6.1.

I'll remove 6.4 from master once we've figured out the fallout from
this kernel, and which direction we are going.

Cheers,

Bruce

The following changes since commit d4f2f8269cff0e4e9a98ad1ef9c0f7b8a909d563:

  recipetool/devtool: Ensure server knows about changed files (2023-09-18 11:35:38 +0100)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (10):
  linux-yocto/6.4: update to v6.4.15
  linux-yocto/6.1: update to v6.1.52
  linux-yocto/6.4: update to v6.4.16
  linux-yocto/6.1: update to v6.1.53
  linux-yocto/6.1: update to v6.1.55
  linux-yocto-dev: update to v6.6-rcX
  linux-yocto: introduce 6.5 reference kernel recipes
  linux-libc-headers: uprev to v6.5
  linux-libc-headers: default to 6.5
  btrfs-progs: update to version v6.5.1

 meta/conf/distro/include/tcmode-default.inc   |    2 +-
 ...fs-tools_6.3.3.bb => btrfs-tools_6.5.1.bb} |    2 +-
 ...aders_6.4.bb => linux-libc-headers_6.5.bb} |    2 +-
 .../linux/cve-exclusion_6.1.inc               |   54 +-
 .../linux/cve-exclusion_6.4.inc               |   36 +-
 .../linux/cve-exclusion_6.5.inc               | 5072 +++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto-dev.bb  |    4 +-
 .../linux/linux-yocto-rt_6.1.bb               |    6 +-
 .../linux/linux-yocto-rt_6.4.bb               |    6 +-
 .../linux/linux-yocto-rt_6.5.bb               |   48 +
 .../linux/linux-yocto-tiny_6.1.bb             |    6 +-
 .../linux/linux-yocto-tiny_6.4.bb             |    6 +-
 .../linux/linux-yocto-tiny_6.5.bb             |   33 +
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  |   28 +-
 meta/recipes-kernel/linux/linux-yocto_6.4.bb  |   28 +-
 meta/recipes-kernel/linux/linux-yocto_6.5.bb  |   72 +
 16 files changed, 5343 insertions(+), 62 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.3.3.bb => btrfs-tools_6.5.1.bb} (98%)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_6.4.bb => linux-libc-headers_6.5.bb} (83%)
 create mode 100644 meta/recipes-kernel/linux/cve-exclusion_6.5.inc
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_6.5.bb

-- 
2.34.1


