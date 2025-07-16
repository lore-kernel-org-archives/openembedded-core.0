Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E53C83F34
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 13:49:06 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.22786.1752673736385935569
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 06:48:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S6LmLVZ/;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7e346ab52e9so64346185a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 06:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752673735; x=1753278535; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XDZ2TjMyDFBbmaZg6TGNID2OyNCzc6hbF/+Ozl5iMow=;
        b=S6LmLVZ/cBlW7sD2yFGZQm1WL6Vzch9subh7NGAyPtwpGuv5vIpNKaZSLHaGEmJlgC
         9jziX73A9ErGC/SzNTsUmXRRiOtXn13Mi8b7yA7Pfn6oigSZ9M2qKAOTOSqhb7NcxFWF
         Iuc4RZawsVT6MuFciZaZlcZnaBAde8CYT5I1ZQMB9bEeN4od7jdbYiVAWpjM3iJaH06G
         buYZ9j+0SoDbtRIIwQEV2SpSq6Xo1y/8g3K/tyYjbuK46KBPiO5ayso2Os8jnmv8n+B6
         sE5h5TGFkjdjqvKiglfSAXNydxxtUZqHUuIGxln0PXFBEU7OZd36Wiv77LQimp7vOjPV
         tU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752673735; x=1753278535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDZ2TjMyDFBbmaZg6TGNID2OyNCzc6hbF/+Ozl5iMow=;
        b=wvhsbdnRwo6Mtfvu2fUnjZp4f6mbYLsd5uuRLwDsrHc+9V2v/AOtC+t0F/lX0UuQcb
         IO7To9zJph55LWsD8j2yA34FXuRArUXRMAzEx9c1mkh7khkVOfoV6QvKllhNGN66Ehdu
         SR4jupvv/GzmTdchrDjyUls+TlMov341Wn+bOTyHc0yOHDoc531YaiKQPg+EVXk+OEBw
         WOz5WQ+5NRkTrC0uIJng4RXIRycrMTlJ5iqOeOcdo6HFx0XVanAqxW3EegFV5lheSX3j
         bTqMRbBCsrXINXFH4efFee5ElOr1VDg3/XGzIuBhEZdoOzLJxAor/NLs7S+IT7x9Uwzc
         izxQ==
X-Gm-Message-State: AOJu0YwSLy25P4dksuPhKoIO5/uEbYZWgiz0K2TRyBff6bGcJfeh7eO1
	h8tnmbBeRfTIYexgCvzpjfWEBgnYr11w96BIwt1yJ9eLvLzdHJm6wCTg
X-Gm-Gg: ASbGnctQmb9xzuLuHe9sffTJOUNPoTOtnTtWgjVvsbhzDsjnXahPoUWefiRwVcsTI/Z
	SwDsghvm1AxWeFZl5eO5k+XGQoRqGcblqqJ50ydTWp0z74AgtydeFSPrcRIB39969RX79y2NqVl
	O4/s2kUClFWxm1L1tkD/UzPcjNEtUWuTDj61gDFnTP/euEdfc1Z8IdNKcaUDushaE4NJRt4d/ez
	a9ac+lkb13wRiSba490v3IleJNnAIAxNdsqIGNFldYTPT8ZnWKc/RIA22ODp5muw4pqF2bWQwRb
	YmDOVRGuID4WyieQoYC/ADBi2SpTV/GosWL3F+pSQoDD0Ag3q9BVkIoxkzDaOy+fBLuaHCYS2/v
	3iSeWN/klCM5kVBhUnfoknK8mb1tWi1mLyN4JKC+3jr5vilhgrN3qgWBngv3iwJ9vIocbhwjkJZ
	55vpji9+0MudOOyrp5Jq1+5do=
X-Google-Smtp-Source: AGHT+IHCC3Hn1gsXek5UNaKLLtDDdrQ7+W6RD18oP48zE8dCtzBfJ2gd3PWUM89JzUusJX6NewOEDw==
X-Received: by 2002:a05:620a:2b4c:b0:7e3:33af:c465 with SMTP id af79cd13be357-7e3435ea505mr348859185a.29.1752673735070;
        Wed, 16 Jul 2025 06:48:55 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e3443d830bsm84245085a.25.2025.07.16.06.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 06:48:54 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] kernel-yocto: -dev and -stable updates
Date: Wed, 16 Jul 2025 09:48:49 -0400
Message-Id: <cover.1752673419.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 13:49:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220455

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the next set of kernel updates.

Some things of note:

  - 6.16 is my target refernce kernel for the upcoming release, and as it
    turned out, it took a bit longer to do some porting of features to the
    new base, but everything looks now. Even the -rt branches are updated
    with the latest. So some extra soak time on this -dev kernel is a good
    thing

  - I've also updated my release process to update the CVE tracking for the
    kernel, and you can see that commit here. If something is wrong, let
    me know and I'll fix how I'm doing it.

Cheers,

Bruce


The following changes since commit 853f8bfbb85af4437e35983ca7ab91d111bb9b75:

  dev-manual/start.rst: remove shared PERSISTENT_DIR mentions (2025-07-15 13:57:32 +0100)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto-dev: bump to v6.16
  kernel-devsrc/x86: add v6.16+ build requirements
  linux-yocto/6.12: update to v6.12.38
  linux-yocto/6.12: update CVE exclusions (6.12.38)

 .../linux/cve-exclusion_6.12.inc              | 228 +++++++++++++++++-
 meta/recipes-kernel/linux/kernel-devsrc.bb    |   1 +
 meta/recipes-kernel/linux/linux-yocto-dev.bb  |   4 +-
 .../linux/linux-yocto-rt_6.12.bb              |   6 +-
 .../linux/linux-yocto-tiny_6.12.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb |  28 +--
 6 files changed, 247 insertions(+), 26 deletions(-)

-- 
2.39.2


