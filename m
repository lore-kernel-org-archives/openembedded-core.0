Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8900BC83F11
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 20:52:44 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.128.1693169556794371081
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 13:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=0QJyPCUT;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5654051b27fso1467210a12.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 13:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1693169556; x=1693774356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GMGBcLwDVNqfdz/v2zP2hRMcjycar4OZ9yBj5xojagU=;
        b=0QJyPCUTNz5GfXrURcbHEE2ePFgJagGTcLkDruFtdKL/bwFvoCu4TUreO5v27lKCOg
         wEv43WuPfzPyRdejIX0BdmZhr4wrQUrNNbDEPWJts6QMgdpqf1Kq/cTPgmLDPu5S8pxh
         /4i7EokZu/r7dbb4siW8HHQB6ZxWQi3lw8YIxiE+pB1YRFdrpC5HvBWB78Vgc7fCd6s4
         qn6d25bqtaRHI0C2pgTNfgRigRyXnty/J7IaWlDHVvWD+q2ZYXmrNyG8pnRtkjx7eyyu
         l2cnPZbIu6No8GK59FD24O1Z2oWthHGDEC+vlYF1alwKwaZBdxnGS5bKbyguOvBFhJk4
         uUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693169556; x=1693774356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GMGBcLwDVNqfdz/v2zP2hRMcjycar4OZ9yBj5xojagU=;
        b=VUA2orRuXbFN8xUFUHK0EwxW3oY5If70ZVC088asDUr0O5LJzeOBlCazUZsTF0gJol
         RpDDQqUuw7sXA27VPYT6yZlZY2XtlTxMFgtBHpKJ9RIoSlAO0ov3P4IdVjVo7M1wF5nn
         73q9QNm2WafmpscoR75UUc2du5s0gSsuEUcAusP5yUPT1zqCO3Shd071F/ohktfp6RUj
         CLNArek/BUAHcuV5vJlHxdoEi2LwUFqOpN+83IrbcTcZYn9dF24E3GFYEC9NyPC2k642
         oskPGKVjJpachVpIUi5GbmAJclZNTUdRg948dKdLgy74nZyWmD6Lf+uPipio3dAlzMTH
         TdFg==
X-Gm-Message-State: AOJu0Yw+x1//gapdg0Ylw8xvNIyRz4CQhRfIAFhWgtyjapIgAcqbIDBQ
	EhgszMNNfKUPgCSE5013DuVfpDZcOJprR96C62d7VA==
X-Google-Smtp-Source: AGHT+IHHQC79/dJ+AM85XVOaJPu4md9px5hjTq3jPKoXyDsA2XAwA9w8TVl9kDBKGnL4c0o5nWL3Vg==
X-Received: by 2002:a05:6a21:6d8c:b0:14c:4deb:3dc4 with SMTP id wl12-20020a056a216d8c00b0014c4deb3dc4mr10662110pzb.31.1693169555665;
        Sun, 27 Aug 2023 13:52:35 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id p2-20020a63c142000000b00565dd935938sm1220684pgi.85.2023.08.27.13.52.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 13:52:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/8] Patch review
Date: Sun, 27 Aug 2023 10:52:21 -1000
Message-Id: <cover.1693169420.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 20:52:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186796

Please review this set of changes for kirkstone and have comments back by
end of day Tuesday, August 29.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5789

The following changes since commit ea920e3c8075f3a1b79039341f8c889f6197a07f:

  glibc-locale: use stricter matching for metapackages' runtime dependencies (2023-08-22 07:07:13 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Narpat Mali (2):
  ffmpeg: add CVE_CHECK_IGNORE for CVE-2023-39018
  python3-git: upgrade 3.1.27 -> 3.1.32

Ross Burton (3):
  linux-yocto: add script to generate kernel CVE_CHECK_IGNORE entries
  linux/cve-exclusion: add generated CVE_CHECK_IGNORES.
  linux/cve-exclusion: remove obsolete manual entries

Siddharth (1):
  Qemu: Resolve undefined reference issue in CVE-2023-2861

Soumya Sambu (1):
  go: Fix CVE-2023-29409

Yogita Urade (1):
  nghttp2: fix CVE-2023-35945

 meta/recipes-devtools/go/go-1.17.13.inc       |    1 +
 .../go/go-1.19/CVE-2023-29409.patch           |  175 +
 ...-git-CVE-2022-24439-fix-from-PR-1518.patch |   97 -
 ...-git-CVE-2022-24439-fix-from-PR-1521.patch |  488 --
 ...n3-git_3.1.27.bb => python3-git_3.1.32.bb} |    6 +-
 .../qemu/qemu/CVE-2023-2861.patch             |   66 +-
 meta/recipes-kernel/linux/cve-exclusion.inc   |  869 --
 .../linux/cve-exclusion_5.15.inc              | 7193 +++++++++++++++++
 .../linux/generate-cve-exclusions.py          |  101 +
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |    1 +
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |    6 +
 .../nghttp2/nghttp2/CVE-2023-35945.patch      |  151 +
 .../recipes-support/nghttp2/nghttp2_1.47.0.bb |    1 +
 13 files changed, 7667 insertions(+), 1488 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.19/CVE-2023-29409.patch
 delete mode 100644 meta/recipes-devtools/python/python3-git/0001-python3-git-CVE-2022-24439-fix-from-PR-1518.patch
 delete mode 100644 meta/recipes-devtools/python/python3-git/0001-python3-git-CVE-2022-24439-fix-from-PR-1521.patch
 rename meta/recipes-devtools/python/{python3-git_3.1.27.bb => python3-git_3.1.32.bb} (80%)
 create mode 100644 meta/recipes-kernel/linux/cve-exclusion_5.15.inc
 create mode 100755 meta/recipes-kernel/linux/generate-cve-exclusions.py
 create mode 100644 meta/recipes-support/nghttp2/nghttp2/CVE-2023-35945.patch

-- 
2.34.1


