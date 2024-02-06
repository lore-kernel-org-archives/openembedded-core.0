Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B07C4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 20:53:45 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.4381.1707252817613169382
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 12:53:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EX06wfGE;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-783f27300b1so311696185a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 12:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707252816; x=1707857616; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E86CS2hfOke1rANJorxV5gQAmneB40QeG0hzZLnYnqY=;
        b=EX06wfGEVWRV7wmYYmqruLhGGPYRq8lNn/BGilYpJYSnvzIkkmrAeXa1WIItyUB0PH
         xQhgVaupITDA8s1xEqyQZPQt1qi2Dg6X8VVcxU/lYepRkziFj2p0Pftd+UbvAw7s9Qqq
         C6NiwKPIM4Dw0SXaSxWKNCFX2ZvtbQZZAG5njQQ4I2BbGjRgmTwrGcLcYs6+aLaVsroh
         wlzHtWmy0sYcwqDCSFlr0r/sgs4UiQcQVf39BbpQe+C/YuVgpHv1RpNM+BYym8UuTUzw
         /i++jHvYM0qMZOCqWrgdNZ6CJEzJYYZsXiZelE6/kwp2Fg4eiwP+0LeJd68iu884/UTz
         iSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707252816; x=1707857616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E86CS2hfOke1rANJorxV5gQAmneB40QeG0hzZLnYnqY=;
        b=VAyAuF/Il1ZVxDpM8GjwE21/dHlkpjyxeH7BomG3Anr7x487oJdmxJrgOVX/i5SCv+
         YiTqXqhP0SkT2W9WAtKCl5gXAd44ZC7K3VyapSzRkv9w2Ls2eVIsOFHvG89QqaHknw3s
         kGSf4mBtRGz7SjXNp0Qn2Ra4obBMZzTPNG6NHNAb6SFLyxLDCUTCwXU7vJqvP/hBajOK
         NJC+9lmzTCF9v1VAH2y7owtkPBdE3uetowMrk8wPh1JJLqMQUBptMuQ54QgMFFCFDrAb
         cuRZr3dBK+lwqdotRmrC4CZSF8e1MTG7y1qPStPWXy40k4m7NZGwqgTRyjT6n4dlePjx
         9m7w==
X-Gm-Message-State: AOJu0YxuJRb/lXgfcK68w/jYuEe4/o2h8c7iZFpqjExnYd9CRPEOwp+k
	EV4C3WhM9JiECkEERfpO6NYfYDYXYLtt6QDu/MFKncSAfXyvpUMi
X-Google-Smtp-Source: AGHT+IECdKvxrhk8kLZKJntE0rp5x2ocnKsK9YTvfu/c1LoyjoL9NJhxkYgSBpA85pyVrXdDhfg6wg==
X-Received: by 2002:a05:620a:4728:b0:785:8c37:3996 with SMTP id bs40-20020a05620a472800b007858c373996mr4021851qkb.36.1707252816509;
        Tue, 06 Feb 2024 12:53:36 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id y13-20020a05620a0e0d00b00783de6b5ccfsm1253506qkm.88.2024.02.06.12.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 12:53:36 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7] linux-yocto/6.6: -stable and config updates
Date: Tue,  6 Feb 2024 15:53:27 -0500
Message-Id: <cover.1707252636.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 20:53:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195026

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here are my tested -stable updates and configuration changes for 6.6

I'll send a similar patch for the reference BSPs momentarily.

Bruce

The following changes since commit 9c1d226fadf7f88ed4e1c0a8d21b3f97bc877eb2:

  patchtest.README: update mailing list (2024-02-06 15:01:16 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (7):
  linux-yocto/6.6: features/qat/qat.cfg: enable CONFIG_PCIEAER
  linux-yocto/6.6: beaglebone: drop nonassignable kernel options
  linux-yocto/6.6: update to v6.6.13
  linux-yocto/6.6: update CVE exclusions
  linux-yocto/6.6:  can: drop obsolete CONFIG_PCH_CAN
  linux-yocto/6.6: update to v6.6.15
  linux-yocto/6.6: update CVE exclusions

 .../linux/cve-exclusion_6.6.inc               | 70 +++++++++++++++++--
 .../linux/linux-yocto-rt_6.6.bb               |  6 +-
 .../linux/linux-yocto-tiny_6.6.bb             |  6 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 ++++----
 4 files changed, 84 insertions(+), 26 deletions(-)

-- 
2.39.2


