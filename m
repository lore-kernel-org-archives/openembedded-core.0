Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E8AE7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 21:06:27 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.4144.1733864781912566100
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 13:06:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k0uXBXRM;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4677230a9ccso19323721cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 13:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733864781; x=1734469581; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7eUAUodbv+9vSFWD9OlXVaMhNK7A1AeZLLDXUqdxTjs=;
        b=k0uXBXRMBrtzIKr+8TmTeCtG0LcGbSAlcvrR26rP0ak9qFbi9AXAyLCyG0a10to9Fb
         8AoABCyxvfnwilCsEL/DWeV5hciBq+3P4xmgb6RT2BIclM6zpUyjdWw5a16ZpfdCEzub
         ePpWM/iYurFRbopMv/54DnzECmAkFAMCjrJXJtc8Bz0nMe2+LAiq7fBW2LW7J705lRCH
         sJQuHibWVIZEsd6yDPaolmx3qs5JkdVBFsvsWlQXZEOzRefNcjV/EcdkKCUJyBfDfz88
         IKdfNFGbKADIpaQIIYcHFsxW9Lv7J2xzSAircutda/TgjxErQy/tSllQdpSyyffsu/k4
         shcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733864781; x=1734469581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7eUAUodbv+9vSFWD9OlXVaMhNK7A1AeZLLDXUqdxTjs=;
        b=WHy9VmyCLLmPZ+BxKOMvh1nn9BKIwiyA1pPxc0XoRsYRnZehPz54qlK3Byo/crprTj
         6hoXcJjnk4WKTNVuymfb8FDnM08kg//Xt9NfI1MT2Ak9hy0t65jtnj/0rrTlYBRWkeGA
         tNXf+tPia9p4+OVMIeBkbJMRKp1aBu89bbIrE2ufM1ftd1Iy70MErQCvQtCMwTPU4A4S
         HtaRDrKS3YY8Sa7Kl2cINosBTWPs2OFNqzBJEXzaOR9p2gwRPKwx0OtiLn67W6ovN9QV
         vkb94LByHMgSg73nArMk4xmioq62xkSim0ytNQMSzWCiGWAGvHaR0v8UdD0tySxCCbif
         tWvw==
X-Gm-Message-State: AOJu0YzWIGOJAA9wgJHxd2lk0tyMrTmnyXBpgiHznksEgz3LZKB6wOPc
	+vZKOLMsg9QO3k0LqyOYE/wJqAspAbIZGdu5iLUEc7UCroPivxuX
X-Gm-Gg: ASbGnctB/V6Sfan82AKy29+FGAmDYUFaA0ABfJ4kOtXSHemUmtf6ZpmHr8a6drxhi94
	aq84lmCFp0UxiZkQVNpLneeo6adB1IFRWbrQqMkn5Vj+qqKkDsMj+XULfrYEPIjJ2C1Pl9bioKK
	hLxoF0elPGVEynA4zMvehVBqtztmU7DpJLyAXdhXEVywTa2MP/Ol4Ff6vOzAuAHjGMGjqC7cfpt
	gKgehd9FPFkkEM6ViLmN4m7VOGa7IbsFWeA+YVKMcPRMXVV5p3nB7HeVX0gpb2+8rzs8+PJ1k1s
	mIugcLLQWukVN1gs+71cE6yiHZOmUNj0IYSKdT3xaU67sTMhiO+low4=
X-Google-Smtp-Source: AGHT+IETbeq7uXewBpLytxnr41eAb8Lpn309NWby5r3eS72rXggqztXQ9B94OUTEVnXb4RJdpnEDhA==
X-Received: by 2002:ac8:58cf:0:b0:467:8703:a740 with SMTP id d75a77b69052e-467892b58d6mr8490541cf.18.1733864780863;
        Tue, 10 Dec 2024 13:06:20 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4676e091d95sm18415301cf.12.2024.12.10.13.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 13:06:20 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] kernel-yocto: consolidated pull request
Date: Tue, 10 Dec 2024 16:06:12 -0500
Message-Id: <cover.1733864271.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 21:06:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208556

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's my latest collection of changes. A couple of -stable's for 6.6
and obviously the most signficant is the introduction of 6.12 as the
primary reference kernel for the upcoming spring release.

I've combined the oe-core and poky distro changes into one series for
ease of testing and viewing.

Obviously, we can merge the 6.12 kernel and not make it the default,
but at this point I've tested -rt, -tiny, -standard across all architectures
and images types that are in oe-core. glibc and musl have also been
tested.

Even with that, I'm sure something will be found on the AB!

There may still be issues in meta-openembedded (zfs, etc), but I'll have
a look at those shortly .. I just didn't want to hold this up any longer.

Cheers,

Bruce

The following changes since commit 3de3bda4c4b72ca21ad91c81db57bf07760e0a3b:

  bitbake: parse: add support for 'addfragments' directive (2024-12-08 22:36:11 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (6):
  linux-yocto/6.6: update to v6.6.63
  linux-yocto/6.6: update to v6.6.64
  linux-yocto/6.12: introduce v6.12 reference kernel
  linux-yocto: drop 6.10
  poky/poky-tiny: update default to v6.12
  yocto-bsp: drop 6.10 bbappend

 meta-poky/conf/distro/poky-tiny.conf          |  2 +-
 meta-poky/conf/distro/poky.conf               |  4 +-
 .../linux/linux-yocto_6.10.bbappend           | 19 -------
 ...octo-rt_6.10.bb => linux-yocto-rt_6.12.bb} | 12 ++---
 .../linux/linux-yocto-rt_6.6.bb               |  6 +--
 ...-tiny_6.10.bb => linux-yocto-tiny_6.12.bb} | 14 ++---
 .../linux/linux-yocto-tiny_6.6.bb             |  6 +--
 ...inux-yocto_6.10.bb => linux-yocto_6.12.bb} | 54 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++-----
 9 files changed, 63 insertions(+), 82 deletions(-)
 delete mode 100644 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.10.bbappend
 rename meta/recipes-kernel/linux/{linux-yocto-rt_6.10.bb => linux-yocto-rt_6.12.bb} (85%)
 rename meta/recipes-kernel/linux/{linux-yocto-tiny_6.10.bb => linux-yocto-tiny_6.12.bb} (66%)
 rename meta/recipes-kernel/linux/{linux-yocto_6.10.bb => linux-yocto_6.12.bb} (62%)

-- 
2.39.2


