Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1177DE77199
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 21:17:24 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.31957.1736371036524520820
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 13:17:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2l/nDpIK;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-216401de828so2790785ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 13:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736371036; x=1736975836; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lsSZzldYOtDTi0H0HuDdxl6oYIlmKX4c3Oadk7434wU=;
        b=2l/nDpIKBRNRmQHDSFMf5N1/VDSRniIKcHjm7EDU689VI6XaxX5g3bJQFVjzOAVclV
         1JU75QoYOf/aAJXUlTYHXCf7CYAbkGtEea8U8mpr2mG2/t394zgjxbXtIpybBCte+5VS
         1w4rmsoVC5PaGaGsAvCPfqMEkSXlEPgqxO6/wi/V+FUySBGIMZm1MsWRqKTPdfwQQjDQ
         zVCEiCdzyK6qDIAynMbtyDF1h0fmoLhXmprO/rPhQb4rjYL6P5Qky03kesqHdzxESVdB
         CJFLETncQJXnops5AfiILTJ+2ArwOmXqx4wp8cqpC07umTa/Dp2YEMMR9xVPlXMNFgbL
         7YWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736371036; x=1736975836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lsSZzldYOtDTi0H0HuDdxl6oYIlmKX4c3Oadk7434wU=;
        b=t4fdN0sHTWHYWXBv2Lp8RbfWDgmAAlTQ4zr6usZlmBXVkZgah7erPjzCp4A88LCIfH
         Kr84e5/m6Cva8usZjxjXkC6StDfdWoIOpNKP4p/nF0glAT+TA1X6kHu0oeCyoWmyITrX
         dM0DTd+Ty+mSCes7xrSK+DhAWUAI7+4r4IFkKUxU2F0SG8RFKnoCP7hT7guL575aDq1/
         e7mkAX8WQuS26oucv6xeaOsRBcgJEQ4ridt8PchpgqqUzXgCnhYoY0omKeFY5w/Nlrkk
         yGqQ3d76BZ5F5zBM1o3RGpA+lqRo3DWsxZpgdhwzmCGEUhbLby32Levrzuye/G8+F1Sr
         tuyA==
X-Gm-Message-State: AOJu0Yzs+8yjAlTjlqmcf/M+PPlb4xc8drULX5AUUkt9SF/nP3LLVsfe
	GyCpE5mrt0/gq1m3KPSAJ0QbgbxTOgkw+ehUvcHDkQ3QxBf2HTdJvec/fy0MAkRxZcXz+qtcJRe
	3jxo=
X-Gm-Gg: ASbGncvW0FOa0V3tVTAQwgGKkYiwP3jRaFAc4C4jsRZOJmULjhaL+G3yn1cK8gtoj3J
	gVbTzfPOuU+QVCAkEzwUDoxDpXuTq7Un/1ns37V7Tg/UseDIbegrC37fujnM7BCwASy2Ysg+Kev
	4rn8aM+cxcQqrgyXBn7gv+2JJztOYVQ/9dDpVQoFZNz7wIZmsQxtigxcRjzttRr8TUFdtndPioj
	ov2ml0gJV2Lq/1Jc87hCShwR+WT9buEvARAly9qUbLWkA==
X-Google-Smtp-Source: AGHT+IFpHx6hiaRErI49kb73jhH1yclS5oFezbt9qq89yJxMUIX62kcpjM0ZsnGUCGuOb+dPwaU5dQ==
X-Received: by 2002:a17:902:f54d:b0:216:1543:1962 with SMTP id d9443c01a7336-21a83f5fbd5mr54446325ad.23.1736371035369;
        Wed, 08 Jan 2025 13:17:15 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cdd9bsm331403495ad.132.2025.01.08.13.17.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 13:17:14 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 00/18] Patch review
Date: Wed,  8 Jan 2025 13:16:50 -0800
Message-ID: <cover.1736370890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 21:17:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209590

Please review this set of changes for styhead and have comments back by
end of day Friday, January 10

Passed a-full on autobuilder:

https://valkyrie.yoctoproject.org/#/builders/29/builds/767

The following changes since commit 8c4ed59f681118a72356de51b0dd33cd6edcf78f:

  gcc: Fix c++: tweak for Wrange-loop-construct (2025-01-03 05:51:46 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/styhead-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/styhead-nut

Bruce Ashfield (11):
  linux-yocto/6.6: update to v6.6.56
  linux-yocto/6.6: update to v6.6.58
  linux-yocto/6.6: genericarm64.cfg: enable CONFIG_DMA_CMA
  linux-yocto/6.6: update to v6.6.59
  linux-yocto/6.6: update to v6.6.60
  linux-yocto/6.6: update to v6.6.62
  linux-yocto/6.6: bsp/genericarm64: disable ARM64_SME
  linux-yocto/6.6: update to v6.6.63
  linux-yocto/6.6: update to v6.6.64
  linux-yocto/6.6: update to v6.6.66
  linux-yocto/6.6: update to v6.6.69

Deepthi Hemraj (1):
  binutils: stable 2.43.1 branch update

Mark Hatle (1):
  cve-update-nvd2-native: Handle BB_NO_NETWORK and missing db

Michael Nazzareno Trimarchi (1):
  connman: Fix restart script

Peter Marko (1):
  expat: upgrade 2.6.3 -> 2.6.4

Richard Purdie (1):
  oeqa/ssh: Improve performance and log sizes

Robert Yang (1):
  groff: Fix race issues for parallel build

Xiangyu Chen (1):
  lttng-modules: fix sched_stat_runtime changed in Linux 6.6.66

 meta/lib/oeqa/core/target/ssh.py              | 44 +++++++++++-----
 .../connman/connman/connman                   |  2 +-
 .../expat/{expat_2.6.3.bb => expat_2.6.4.bb}  |  2 +-
 .../meta/cve-update-nvd2-native.bb            |  5 ++
 .../binutils/binutils-2.43.1.inc              |  2 +-
 ...-system-directories-when-cross-linki.patch | 16 +++---
 ...tbl.am-Fix-race-issues-for-parallel-.patch | 31 +++++++++++
 meta/recipes-extended/groff/groff_1.23.0.bb   |  1 +
 .../linux/linux-yocto-rt_6.6.bb               |  6 +--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 +--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++-----
 ...stat_runtime-changed-in-Linux-6.6.66.patch | 51 +++++++++++++++++++
 .../lttng/lttng-modules_2.13.14.bb            |  4 +-
 13 files changed, 154 insertions(+), 44 deletions(-)
 rename meta/recipes-core/expat/{expat_2.6.3.bb => expat_2.6.4.bb} (92%)
 create mode 100644 meta/recipes-extended/groff/files/0001-contrib-hdtbl-hdtbl.am-Fix-race-issues-for-parallel-.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-sched_stat_runtime-changed-in-Linux-6.6.66.patch

-- 
2.43.0


