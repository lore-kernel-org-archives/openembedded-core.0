Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C46FC77B7F
	for <webhook@archiver.kernel.org>; Sat,  6 May 2023 15:24:56 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.36170.1683386694965774651
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 May 2023 08:24:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=QIcXMP2e;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-51f6461af24so1997972a12.2
        for <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 08:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683386694; x=1685978694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5a4kD8XCMbrc9bDDpR+BxW9pMCQ85bIZam1dkjeV+b8=;
        b=QIcXMP2ezSoOWFnAWgOq1xpA/2kyqq8UHQxKQZ0bCoMR+PjL3MacTIDNw61S+v70yD
         HfWHVmTYuWc9Kh5YqMxJQj4TRzumyFLt/sVGmI2s4903KE9VoBGB0mkaDhtUP88JnmWV
         nM0q/7vYwsF8GxGpYQnt9QyicnQUHX7uc3MMIl5xb/q2Na8rzMK+KQWryLSvcjwrusEc
         lkpZe6QOvEAwIWxqx6ctchUNVyOsPG9FAs93RrBwIIZ6HJFmLSMxjv3qcuLyZ5qIjppo
         KjDeyxZhDQR/fO6kvFkLgFsF1pYFlsrIIiXeNS7rbmjsO00IuBw+yjVHPmacweeLYmyH
         4n2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683386694; x=1685978694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5a4kD8XCMbrc9bDDpR+BxW9pMCQ85bIZam1dkjeV+b8=;
        b=lt6hnU2H3W1SP9MORrHkLC0cdAGMUt5CeVZKCg3Ws7OZiJ9Y/s2HjDM+EzGy7aIw7y
         NRn6t0fz8YkFo2F4avQ2RP9vfGByjdnlJgWi1L+xhg8seGaSTQXZsVTUF+Qkeb4VCH72
         Kvo/IU+nlpAFDwHGjpdC+XJe9Xe0evqOC77nb6/ga1/bOxh/kh3jfNfbyNsNg35+i5ds
         24H0QqbZ9yXi6ZJ0fkzo8zzrkQra0dtf9L/tBN6o15EJF8WXoiDuRoymp6jTrlrOialq
         DeGiKKGwEfnFT6Dzn9EqLZejc7Bl57SlZd+yeVofpSemqALwo7kOwIukW7WHk/HsNaQ4
         XWjg==
X-Gm-Message-State: AC+VfDykXoM6ehAnT6D2wnq2wVMeRh63arYBpTzYvewimSj4SL6PbIv4
	Atpt9zyrXNvMHwRKOMzKffyh/2+IRKqBJVfQIIM=
X-Google-Smtp-Source: ACHHUZ4AKcHSkqYOZLItGUofMMFqJKQXaT4XDUnfon0l3UUFwRdtkm8foOSdS3ktED3sAHLbZpIZiw==
X-Received: by 2002:a05:6a20:12c7:b0:ef:511:d6fe with SMTP id v7-20020a056a2012c700b000ef0511d6femr6902189pzg.9.1683386693701;
        Sat, 06 May 2023 08:24:53 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c8-20020a62e808000000b0063b1b84d54csm3296718pfi.213.2023.05.06.08.24.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 08:24:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/15] Patch review
Date: Sat,  6 May 2023 05:24:30 -1000
Message-Id: <cover.1683386547.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 15:24:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180983

Please review this set of patches for kirkstone and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5269

The following changes since commit 2d67702bdfc64358d364dd6484ae41842ee7c52f:

  glibc: stable 2.35 branch updates. (2023-04-28 03:55:33 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Arturo Buzarra (1):
  run-postinsts: Set dependency for ldconfig to avoid boot issues

Deepthi Hemraj (4):
  binutils : Fix CVE-2023-25584
  binutils : Fix CVE-2023-25585
  binutils : Fix CVE-2023-1972
  binutils : Fix CVE-2023-25588

Hitendra Prajapati (1):
  connman: fix CVE-2023-28488 DoS in client.c

Kai Kang (1):
  webkitgtk: fix CVE-2022-32888 & CVE-2022-32923

Narpat Mali (2):
  ffmpeg: fix for CVE-2022-48434
  python3-cryptography: fix for CVE-2023-23931

Randolph Sapp (2):
  wic/bootimg-efi: if fixed-size is set then use that for mkdosfs
  kernel-devicetree: allow specification of dtb directory

Ranjitsinh Rathod (1):
  libbsd: Add correct license for all packages

Shubham Kulkarni (1):
  go: Security fix for CVE-2023-24538

Vivek Kumbhar (2):
  freetype: fix CVE-2023-2004 integer overflowin in
    tt_hvadvance_adjust() in src/truetype/ttgxvar.c
  go: fix CVE-2023-24534 denial of service from excessive memory
    allocation

 meta/classes/kernel-devicetree.bbclass        |  22 +-
 meta/classes/kernel.bbclass                   |   2 +
 .../connman/connman/CVE-2023-28488.patch      |  60 ++
 .../connman/connman_1.41.bb                   |   1 +
 .../binutils/binutils-2.38.inc                |   6 +
 .../binutils/0022-CVE-2023-25584-1.patch      |  56 ++
 .../binutils/0022-CVE-2023-25584-2.patch      |  38 ++
 .../binutils/0022-CVE-2023-25584-3.patch      | 534 ++++++++++++++++++
 .../binutils/0023-CVE-2023-25585.patch        |  54 ++
 .../binutils/0025-CVE-2023-25588.patch        | 147 +++++
 .../binutils/0026-CVE-2023-1972.patch         |  41 ++
 meta/recipes-devtools/go/go-1.17.13.inc       |   2 +
 .../go/go-1.18/CVE-2023-24534.patch           | 200 +++++++
 .../go/go-1.18/CVE-2023-24538.patch           | 208 +++++++
 .../python3-cryptography/CVE-2023-23931.patch |  49 ++
 .../python/python3-cryptography_36.0.2.bb     |   1 +
 .../run-postinsts/run-postinsts.service       |   2 +-
 .../freetype/freetype/CVE-2023-2004.patch     |  41 ++
 .../freetype/freetype_2.11.1.bb               |   1 +
 .../ffmpeg/ffmpeg/CVE-2022-48434.patch        | 130 +++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |   3 +-
 .../webkit/webkitgtk/CVE-2022-32888.patch     |  41 ++
 .../webkit/webkitgtk/CVE-2022-32923.patch     | 435 ++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.36.8.bb  |   2 +
 meta/recipes-support/libbsd/libbsd_0.11.5.bb  |   7 +
 scripts/lib/wic/plugins/source/bootimg-efi.py |   7 +
 26 files changed, 2083 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2023-28488.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0022-CVE-2023-25584-1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0022-CVE-2023-25584-2.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0022-CVE-2023-25584-3.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0023-CVE-2023-25585.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0025-CVE-2023-25588.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0026-CVE-2023-1972.patch
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2023-24534.patch
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2023-24538.patch
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/CVE-2023-23931.patch
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2023-2004.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2022-48434.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2022-32888.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2022-32923.patch

-- 
2.34.1


