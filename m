Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 901ABD1CDD2
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 04:30:32 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35374.1764822631432309141
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 20:30:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MAxJ3lI2;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8826b83e405so6217546d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 20:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764822630; x=1765427430; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2K4OKDKWw50UjF1sYcuxuqLC/6oKDB/wNBOrjO5bAAg=;
        b=MAxJ3lI2ulVpkUXbL14lOX7CTRdm1+d8bc0hKoP5m9MXGdye4xyi0OaG+Lj1HqmjLQ
         0soWSxgAnVoOLedpLunkGTG+tlHNh0dQOulWONLlcebgduuPpOSSwpd7FRaeMAYWD0Kd
         2/HwnZHbzycXO7ywCKQvyGWHAI2qRBTv6qdOBdy9WNtE15qcNjIdVckOnR8fCbv0FJKJ
         8dV0SO1TJlllZCtaJkZ+cSYSTJWzfd9GGm+8VuwSnoOb8mgHG7FBqS1umh/Uawh8jGKU
         Si6m0Fq2idcVh89zxAfDNe6LD7BMok0naoXVYZGWrsRUbb1qlHKjx76X49OU8FxASVSW
         yl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764822630; x=1765427430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2K4OKDKWw50UjF1sYcuxuqLC/6oKDB/wNBOrjO5bAAg=;
        b=JWgZTy5bPaoWMN7wAtQ3FDF7g+lzR6F58Q68ZYYaJm7k9jZMbn9y5vV9v2oKbQwYAs
         Alzet9k6CpthA8VohgFQweIQUonrUKyVLclUF/3J/7Tf/jp561TbVYO5ycQf1e1qYUlr
         5ulUKRMs6pFzAfSczVwZty+Tx2g8WW0hwtIT+WWvz/Qs+K9VIMSwT8CwblpOC5YBfDbR
         hk+dSq7rEoa8aYm259zk9+RCHEF7LsOtS/44NfXN6g4AK2XcMFE+t76e/G4j76U74x1v
         AfRTWg5Xi46CHhcDo/pfmUZOSU5lQn87isQAk2d1uuvZ1W0z/pnay4mZYRz/DBP91VRh
         gKew==
X-Gm-Message-State: AOJu0Yw3+ysCy3OBqVrgB5/QjW6jqvuumQN7eJVAu0nX6MVExHibpMjs
	jrYVbqJLcPtZiLEKAq5iFbVrfmI1KVFbofbb+NNYzuDUXm3n+2K9N6mq
X-Gm-Gg: ASbGnctWMUROyGk5B8/e2G280mMowC7KVqM1X3FENiMjFU7AcKu78qjzZruzqQW05Ck
	yBgguD2S0jCw7LWBAntoqNukq/oJWRn7D2BBUn0w9/V5CpzECKqR6XTuv+opdyRYHi+QGSwmu/w
	+xagDpDl1m+/gInNdSxgguMy/frV/Sl/GSJbMR4VKGJ25CYY0663PpZjxGbpWAK6evbLzncx45n
	GQXVW8LFMDXVeiqPcN1wnI144BfXZxcJSisxkAPMXjTPDmWDaW7LGrlpIbU2S+AMlU87L4xvb6R
	1LGjGhj2Z02m3REQrZ4oJdu+yKtuvmwYhsHxBScmv3RVUkOqmN6YYi+qTiJjhk2n3Zp9SlWnFs2
	90WcVXU9BGa/EsAoHrQiE1iAzwu2hM8WMRGrQH7cjkk3Ncw/V6Ax4JQTnd8PnuQBgNL/fsZzNsF
	x6qNf/5cTsbkYO/FRVp9nh0jFVmSDPzGtSUjd21zfsFyF35QHuec9YK5lOkRWjr9o3CTaCKup42
	Rd0WeCkHBfNCKAOLuv+wroLSg==
X-Google-Smtp-Source: AGHT+IHyyASbXeE2fzqLPgIvjmMeLuPQnzinVeVwhQhEW1IEORqnJ0cOUoREq4Gz18Cem9NSGH5Hjw==
X-Received: by 2002:a05:6214:2f88:b0:87d:f666:3bc8 with SMTP id 6a1803df08f44-888194cb153mr77796106d6.10.1764822630326;
        Wed, 03 Dec 2025 20:30:30 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88827f3347asm3191476d6.6.2025.12.03.20.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:30:29 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/16] linux-yocto: consolidated pull request
Date: Wed,  3 Dec 2025 23:30:12 -0500
Message-Id: <cover.1764822465.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 04:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227251

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the -stable updates that I've been gathering while waiting
for things to stablize (or release). I see that 6.17 is still in
master, but feel free to ignore those -stable versions. I just
wanted to send them in case someone is using those kernels and
wants the security fixes.

I've moved my attention to 6.18, since it should be the next LTS
kernel.

This is my first pull using my infrastructure switched over
to oe-core and the split repos, so let me know if anything looks
wrong.

Bruce


The following changes since commit ac7327583aef83fd400190506f3147623de38b68:

  libdrm: upgrade 2.4.125 -> 2.4.128 (2025-11-27 11:03:37 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib zedd/kernel
  https://git.openembedded.org/openembedded-core-contrib/log/?h=zedd/kernel

Bruce Ashfield (16):
  linux-yocto/6.17: fix -tiny kernel boot
  linux-yocto/6.17: update to v6.17.7
  linux-yocto/6.17: update CVE exclusions (6.17.7)
  linux-yocto/6.17: generic64arm configuration updates
  linux-yocto/6.17: update to v6.17.8
  linux-yocto/6.17: update CVE exclusions (6.17.8)
  linux-yocto/6.17: update to v6.17.10
  linux-yocto/6.17: update CVE exclusions (6.17.10)
  linux-yocto/6.12: update to v6.12.57
  linux-yocto/6.12: update CVE exclusions (6.12.57)
  linux-yocto/6.12: update to v6.12.58
  linux-yocto/6.12: update CVE exclusions (6.12.58)
  linux-yocto/6.12: update to v6.12.59
  linux-yocto/6.12: update CVE exclusions (6.12.59)
  linux-yocto/6.12: update to v6.12.60
  linux-yocto/6.12: update CVE exclusions (6.12.60)

 .../linux/cve-exclusion_6.12.inc              | 412 +++++++++++++++++-
 .../linux/cve-exclusion_6.17.inc              | 220 +++++++++-
 .../linux/linux-yocto-rt_6.12.bb              |   6 +-
 .../linux/linux-yocto-rt_6.17.bb              |   6 +-
 .../linux/linux-yocto-tiny_6.12.bb            |   6 +-
 .../linux/linux-yocto-tiny_6.17.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb |  28 +-
 meta/recipes-kernel/linux/linux-yocto_6.17.bb |  24 +-
 8 files changed, 644 insertions(+), 64 deletions(-)

-- 
2.39.2


