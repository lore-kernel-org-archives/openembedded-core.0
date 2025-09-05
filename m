Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E0DCCA1010
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 16:09:39 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.546.1757088570512552145
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 09:09:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kNEaiV8R;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-80b7a6b2b47so219842985a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 09:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757088569; x=1757693369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VREO3cpGvhJ4gF3Emzj1Y626iklNBkjfLepTKyS79tY=;
        b=kNEaiV8RdK8M7IqT79vNwmiJq8Hwg+t10sfFLoGWhlZz1sSYxx3Y+HM3+VoAP9b4H+
         9xgdMY5mtUbxW6dW/9wtM8ECpdLfkQ+vn7G4H/mBcEzjCh22HxjhleJIBLaSUKYKN9zU
         pU449p24s+095cIYVB1iRhi9kOV8O9agf+qqS7xjdDTJOlF2B3MESsTa2OTfvmJ95j7u
         CCapS5Dc7ouflhmvhTYXhQoiQ/+atpeTRIPOStkU7kxOgORvK/Ff8S1zfIJ6Cu44X9Sr
         QpmYVJWoVk32f+EsCEdgdo6uoIHJIp3gS+xWY7AA6dnZjsfi9MoQFB2JBEAx1XUnTsUB
         WJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757088569; x=1757693369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VREO3cpGvhJ4gF3Emzj1Y626iklNBkjfLepTKyS79tY=;
        b=j84BjsNX3s6Y1u/JxRsCxOfolUHkRRjUKUNTrIXanEhTujrm9OpoHaw3/MPKJav1TF
         euWHvPn/23VvmAXhA3Zy7iGOONS2hxMs4ZdR49EFEHod0kdPqMk0l1hVg9b4ahyoeYpC
         C7rm+K7K5G6h8kxmZCm7JGD1Ic9xF68QvH4FSd0T3izv+IXOnOZWshnfG1I7zhnNbdrx
         RcK1+0fv7Y6fnmWKC4KfIz9CWTr4exHVRU3xswYYFlrgH3R9vC8vPEBJ6ulDwd1wf0PU
         lqEJow+vfBsvOfoyRdGbLQ/lqkbLbcP50YSjLRXnDCDq6NH6FzgScv/KE/RGEq7Bxua6
         IN5w==
X-Gm-Message-State: AOJu0Yxo+CLhOwCgkr0BX6Ksaxye8sUdVCfU0Y2WZYa3iL7dcA1mvLCT
	uefD8tXqOOpffv6OvxzG0HeqLiWLvlWWpN+CQkIdwgAOU80v6QBRA5b3
X-Gm-Gg: ASbGncuuqLPM7W0y1hUeU72Z/wyeWncSBlj3nxK2mHR2mf3nqHOgqdgaj5HQ7zBLZAf
	sz5VSv1oWjfFl3fP+subk7Ev/KR5FA1mgJ8rrlFe1J7yh3+rY4lAL7Ie526wkKnxSsjiEQBZWEr
	ZdfFp7CR606LJSZBXkWZ+tLUbMzHvih4Z+p1cL5kbFMus3XCY3Aw3uiak23kKqbSHnviJRTW5vA
	0gt1lvKVYDsKQ0kaiK4A99KcI5/UNZSklsG4K0PTS9rBsMBu7xLvfSOwRBXmDXLk9dmMXJNVwfB
	orZ3yl4f7Ysaz8Tqv5iY8aVVxUf9tYq0LnF0oXMpAhUUis1XsZB/cNaDjnXdbrW0QoY3M4rCXYx
	ipirpboT3+7GE0htvQD9orQZkQFgt2W9UFspq67B4H4Py1FR2vq5Fiwrenxr7q8L1oKRm8qIhAE
	ObIGuS5JrOr8a1fiPkLixfvZZAMaaq8MmRAmtWp5SGSFgCWUPDNDOhVln68CtvPwkH3g==
X-Google-Smtp-Source: AGHT+IEF8QFLGbLHePmTCJr/JMzNr7elXQ1SoKLd5lkV6jxNm9+Kkj1g03+dNBK+DwOZCcsD8R25Hw==
X-Received: by 2002:a05:620a:f0b:b0:7ee:4a7e:e9a3 with SMTP id af79cd13be357-7ff2b97ba97mr2523699085a.48.1757088569310;
        Fri, 05 Sep 2025 09:09:29 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720ac16de30sm69127446d6.7.2025.09.05.09.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 09:09:28 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] kernel-yocto: default bump and -stable updates
Date: Fri,  5 Sep 2025 12:09:22 -0400
Message-Id: <cover.1757088383.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 16:09:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223010

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

Yes, this is a combined meta-poky and oe-core pull request, since
it is simpler to coordinate.

There's a known build error with vboxguestdrivers in meta-oe that
I'll look at shortly, but otherwise, I've been able to build and
boot all the architectures with 6.16.

The warning reported with the introduction of the version should
be fixed as well via my SRCREV bumps from last week.

We aren't removing 6.12 as it is a LTS, so the mad rush to update
all hardware reference platforms doesn't have to happen, but it is
appreciated by those that do those bumps.

Cheers,

Bruce

The following changes since commit 4ad510a63fd88b7907b2a1b8feceace9758397d0:

  vte: upgrade 0.78.2 -> 0.80.3 (2025-09-01 23:07:06 +0100)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (5):
  poky: bump default kernel reference to 6.16
  linux-yocto/6.16: update to v6.16.4
  linux-yocto/6.16: update CVE exclusions (6.16.4)
  linux-yocto/6.12: update to v6.12.44
  linux-yocto/6.12: update CVE exclusions (6.12.44)

 meta-poky/conf/distro/poky-tiny.conf          |   2 +-
 meta-poky/conf/distro/poky.conf               |   4 +-
 .../linux/cve-exclusion_6.12.inc              | 140 +++++++++++++++++-
 .../linux/cve-exclusion_6.16.inc              | 136 ++++++++++++++++-
 .../linux/linux-yocto-rt_6.12.bb              |   6 +-
 .../linux/linux-yocto-rt_6.16.bb              |   6 +-
 .../linux/linux-yocto-tiny_6.12.bb            |   6 +-
 .../linux/linux-yocto-tiny_6.16.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb |  28 ++--
 meta/recipes-kernel/linux/linux-yocto_6.16.bb |  28 ++--
 10 files changed, 309 insertions(+), 53 deletions(-)

-- 
2.39.2


