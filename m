Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C00BAC77B7C
	for <webhook@archiver.kernel.org>; Sat, 29 Apr 2023 17:20:56 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.51323.1682788849441526229
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Apr 2023 10:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=0qJgP9a/;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-24b9e5a9a68so691730a91.3
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 10:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682788848; x=1685380848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=D1PaoXkkn9IZiLWVVL/AlkILmGskuCQ9KBsHQj9PTOA=;
        b=0qJgP9a/KFa/sjBoBFwYjtJNOpUTRligLCIXHgIIx3MXERv7mApcIrmtcALWf8dUbB
         HisdZPc4m/cTLuC+q1ZhUXB68em9fQgf0gE3GnJ/vi9k42uXN6vG+oKBXGZefsJIMKs+
         5cunqNDz7Q0c3dMwBv3z7wYEIw2aEdbLozVVCgBdVN4gF78iztvFhgz9xZ8uTgFMCNwe
         8yO69j3MF3sUQRUhcG0l3EyeoXaiTAewXfRABYoRmfVCTAXkCA8+JtagLbSobM+kvOPN
         3EymhSZLEcCvqou1Q88MwlswWtkLeqvcQ7EscxfuALrjVCAasYxReZ9hlDOSFOCp4Njx
         wqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682788848; x=1685380848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D1PaoXkkn9IZiLWVVL/AlkILmGskuCQ9KBsHQj9PTOA=;
        b=PdOftAh9MCyaXov9QEUMy0/VMyTAN0B0Kla3RNUP4Gt5X9mpOsC6dgOoMAX3W04Gct
         Fxw/hlG7i0ZnAeibJT0b00BpG3/8itWxHaczTLBU4hHYcg2dwobRA6WG3O1Uh/5XJoTF
         zaOWoHKkFCZc8pwANA9RnrZ53EwSPXJU5qhYEP0f8pLoNeL5y0qObnDDmn+g2Gz2mCVW
         iR4Bukeu1mPr3vFINq17/8C66fBHEHqEIcoQbmoSvM39LIYrpbixwB/Wkqx6Ox78Hc1+
         WC/n1AbHmV2ZHRt1M2z5EBnZhCU1Vbc1pCFXzHB7mcFV4tBU2dANRsbsGYefnI0Jr8T+
         ynJw==
X-Gm-Message-State: AC+VfDzXUM3Yu19eZgGcahv+LSIA3ajWJgBxZxzolf2psw/yestlO83c
	xCJZXBsKLNwijUgsXqYgTDcGaeZlvve/6jrIk0M=
X-Google-Smtp-Source: ACHHUZ4aBW5lo+jhtu9btxrKLFNC4QnSUMabodjXHzl2LrQD4ACLG5nQrDNAcBXXnXDjlNtpgehp6g==
X-Received: by 2002:a17:902:b786:b0:1a6:ebc1:c54d with SMTP id e6-20020a170902b78600b001a6ebc1c54dmr8501643pls.30.1682788848023;
        Sat, 29 Apr 2023 10:20:48 -0700 (PDT)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id c3-20020a170902d90300b001a6b9c42dbasm15156041plz.88.2023.04.29.10.20.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 10:20:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/13] Patch review
Date: Sat, 29 Apr 2023 07:20:20 -1000
Message-Id: <cover.1682788726.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 17:20:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180543

Please review this set of patches for kirkstone and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5234

The following changes since commit 15c07dff384ce4fb0e90f4f32c182a82101a1c82:

  go: fix CVE-2023-24537 Infinite loop in parsing (2023-04-21 03:57:50 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Archana Polampalli (1):
  nasm: fix CVE-2022-44370

Bruce Ashfield (3):
  linux-yocto/5.15: update to v5.15.106
  linux-yocto/5.15: update to v5.15.107
  linux-yocto/5.15: update to v5.15.108

Christoph Lauer (1):
  populate_sdk_base: add zip options

Deepthi Hemraj (1):
  glibc: stable 2.35 branch updates.

Joe Slater (1):
  ghostscript: fix CVE-2023-29979

Mingli Yu (1):
  ruby: Fix CVE-2023-28755

Pascal Bach (1):
  cmake: add CMAKE_SYSROOT to generated toolchain file

Ross Burton (1):
  xserver-xorg: backport fix for CVE-2023-1393

Virendra Thakur (1):
  qemu: Whitelist CVE-2023-0664

Yogita Urade (2):
  xorg-lib-common: Add variable to set tarball type
  libxpm: upgrade 3.5.13 -> 3.5.15

 meta/classes/cmake.bbclass                    |   5 +
 meta/classes/populate_sdk_base.bbclass        |   4 +-
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 .../nasm/nasm/CVE-2022-44370.patch            | 104 ++++++++++++++++++
 meta/recipes-devtools/nasm/nasm_2.15.05.bb    |   1 +
 meta/recipes-devtools/qemu/qemu.inc           |   5 +
 .../ruby/ruby/CVE-2023-28755.patch            |  68 ++++++++++++
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |   1 +
 .../ghostscript/cve-2023-28879.patch          |  60 ++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |   1 +
 .../{libxpm_3.5.13.bb => libxpm_3.5.15.bb}    |   8 +-
 .../xorg-lib/xorg-lib-common.inc              |   3 +-
 ...posite-Fix-use-after-free-of-the-COW.patch |  46 ++++++++
 .../xorg-xserver/xserver-xorg_21.1.7.bb       |   3 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 ++---
 17 files changed, 323 insertions(+), 26 deletions(-)
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2022-44370.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-28755.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/cve-2023-28879.patch
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.13.bb => libxpm_3.5.15.bb} (67%)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-composite-Fix-use-after-free-of-the-COW.patch

-- 
2.34.1


