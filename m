Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC256D778AC
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 18:20:39 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2035.1769192431522869127
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jan 2026 10:20:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zPV/eLmU;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47ee974e230so22775105e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 10:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769192429; x=1769797229; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BHHd8FfJgNyKtN4I+Q8Qs0XSDbn2M+FLbVOodbT5O5A=;
        b=zPV/eLmULUsmfdEKnMuAGeWt0D6thwFEcIwRSkQhW+XLzmmPEWdNDJ0AE4BY7Y/nvB
         FlkAFe7Rh5pTcuZ2mlnqRkW+bEbBVBbzX51br8rKKQb19oJhJrPG9RfJI3VQio0CoAXK
         omgoXKiSIrNlXdbsNIeM1xl4kipKrhHhOJdnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769192429; x=1769797229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHHd8FfJgNyKtN4I+Q8Qs0XSDbn2M+FLbVOodbT5O5A=;
        b=AQTaKQCbDb61u0bh+30Tjum/EFSI/PuuRvhB94dOE/Od+3vmY+yD9U+qzL0XB0mgh1
         kRW4+ZpRwCW/grjCD3No9GO6X1hcpMR02LY3QFwYpovFmPTo99TrKsnBcOeaon2JLNry
         Fcvh2YLD5YMnx1U4S6TOFndU88NLrodzhJxf62bOHNdcCYBqHJ65OJ81eWp9evsRZ5ap
         gTQ5LdxUweOX6tW6Z8SQxJ60CPZd6WamV8aNmnlA11e/YFAN1qiLhaRItFf+aXduEzlW
         8aubdsykkyfoqOV2WD6SF9zGLMHZpy0Zcxr/zdYka69h5XPP1NQdBF6K0sERdyhSsrc8
         j67w==
X-Gm-Message-State: AOJu0Yz8yEXJhgB5whBlAbGQPYag1E5SHq4eGiXRYSfTHUv5T4hQYm3T
	WgYcBTWBQpuOHCyhhD1rVAN9v38wNiN3xxi8WInm6Jf+5ZcczM8lWICKwfJigCgc9Jnvm2HWIng
	wWZnHxjw=
X-Gm-Gg: AZuq6aJPdoMrvhuVBsu6oY7IqvRY7MpH9X/vu/nFiYG0738Bd0HZ1bjP57KcR+Xx1YH
	LtV3rqWISdbd6rqgbDm2rmhFE3nA7d8gplmAOepromcicoBe9g/RolojRY477pM9SRxfrdwxhg4
	8VYWoDsyqS1xhZGpod7O4vKwbpi8o27eiLTo2c2zeHNCT/YrN7k9uMPrfhbpsq/Yv5JrZTEKwm+
	nDJEdkm8izoP3tu+1Es6FsdChn+lqnWj8BxQBsZOMy3wV+2rrsLWb8Facl+NkC9q9Qf3kXUoaVM
	LMIqTscNinvAC6VEy+t8cujL15Rt5wZvWre/vEGeOU2Pt2WKj/YkDS1xq/eCP7/pP9iYN6Bl+6I
	b+UIA06H0g+d0IIDoWicw+LT+VNZ4GD+qm5Ac9vc9BS+rd44bwvnXc3/ifz34WP66OSlbpL6q+2
	2DBbk+CSrmAy41FkU2B5e7A06TvmGkoEsA6td24JQlxjZTxg5NIVMSwn49PJoeQohek2eY2j5fs
	4pf3BRus35YcSs=
X-Received: by 2002:a05:600c:3b15:b0:47f:8c05:786b with SMTP id 5b1f17b1804b1-4804c9b73b4mr58277025e9.28.1769192429295;
        Fri, 23 Jan 2026 10:20:29 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24bedsm8411523f8f.17.2026.01.23.10.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 10:20:28 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][whinlatter 00/15] Pull request (cover letter only)
Date: Fri, 23 Jan 2026 19:20:09 +0100
Message-ID: <cover.1769192139.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 18:20:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229913

Those are the patches from the last patch review:
https://lore.kernel.org/openembedded-core/cover.1768906687.git.yoann.congal@smile.fr/
... with cherry-pick reference added to "libpng: upgrade 1.6.52 -> 1.6.53"

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3117

The following changes since commit dd10706cfafb5574b7cf316fca2300d166ef71b0:

  build-appliance-image: Update to whinlatter head revisions (2026-01-12 10:58:53 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/whinlatter-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/whinlatter-next

for you to fetch changes up to b4e7819b99d9c1a8995eba87e6f466fd8c77e14a:

  libarchive: upgrade 3.8.4 -> 3.8.5 (2026-01-23 15:27:32 +0100)

----------------------------------------------------------------

Alexander Kanavin (3):
  libpng: upgrade 1.6.52 -> 1.6.53
  ffmpeg: add a (possible) build race fix
  ffmpeg: fix a build race, hopefully for real this time

Paul Barker (1):
  selftest: devtool: Set PATH when running pseudo

Peter Marko (9):
  util-linux: patch CVE-2025-14104
  gnupg: patch CVE-2025-68973
  curl: patch CVE-2025-13034
  curl: patch CVE-2025-14017
  curl: patch CVE-2025-14524
  curl: patch CVE-2025-14819
  curl: patch CVE-2025-15079
  curl: patch CVE-2025-15224
  libarchive: upgrade 3.8.4 -> 3.8.5

Richard Purdie (2):
  pseudo: Update to pull in openat2 and efault return code changes
  pseudo: Update to pull in 'makewrappers: Fix EFAULT implementation'

 meta/lib/oeqa/selftest/cases/devtool.py       |   5 +-
 meta/recipes-core/util-linux/util-linux.inc   |   2 +
 .../util-linux/CVE-2025-14104-01.patch        |  33 +++++
 .../util-linux/CVE-2025-14104-02.patch        |  28 +++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   2 +-
 ...ibarchive_3.8.4.bb => libarchive_3.8.5.bb} |   2 +-
 ...k-Consolidate-pattern-rules-for-comp.patch | 106 ++++++++++++++++
 ...s-Fix-double-build-by-disabling-.d-f.patch |  78 ++++++++++++
 ...ak-ensure-target-directories-are-cre.patch |  43 +++++++
 meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb  |   6 +-
 .../{libpng_1.6.52.bb => libpng_1.6.53.bb}    |   2 +-
 .../curl/curl/CVE-2025-13034.patch            |  37 ++++++
 .../curl/curl/CVE-2025-14017.patch            | 116 ++++++++++++++++++
 .../curl/curl/CVE-2025-14524.patch            |  40 ++++++
 .../curl/curl/CVE-2025-14819.patch            |  73 +++++++++++
 .../curl/curl/CVE-2025-15079.patch            |  32 +++++
 .../curl/curl/CVE-2025-15224.patch            |  31 +++++
 meta/recipes-support/curl/curl_8.17.0.bb      |   6 +
 .../gnupg/gnupg/CVE-2025-68973.patch          | 108 ++++++++++++++++
 meta/recipes-support/gnupg/gnupg_2.5.11.bb    |   1 +
 20 files changed, 745 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2025-14104-01.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2025-14104-02.patch
 rename meta/recipes-extended/libarchive/{libarchive_3.8.4.bb => libarchive_3.8.5.bb} (96%)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-ffbuild-commonmak-Consolidate-pattern-rules-for-comp.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-fftools-resources-Fix-double-build-by-disabling-.d-f.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch
 rename meta/recipes-multimedia/libpng/{libpng_1.6.52.bb => libpng_1.6.53.bb} (97%)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-13034.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14017.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14524.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14819.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-15079.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-15224.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2025-68973.patch


