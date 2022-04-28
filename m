Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE8EC433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 13:48:07 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web08.10589.1651153685121137300
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 06:48:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nSSmx//m;
 spf=pass (domain: gmail.com, ip: 209.85.219.51,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id a5so3241858qvx.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 06:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wdgcLh1hcZs1k+1TlDVsOsqE/t4h3zdaR0VQQI+uRPA=;
        b=nSSmx//m9nwYm/la7q5IUaLcffJ3Mdmh5sNIrA3pxiXXCfnhjxKRNnY2FzPGtJD2QI
         VTL9taGnxoCo62/08jZdmnzz5s6kw1/kEc1YEEyw45TwKbp2najGt/gUfddsVoWijqpj
         JFuz/YXtiVP7eFr0dbo4nXxbrHr8OqAuOTh/UqiqtTv8PPb9AXD9tFDuC0c0ou2ab1Hf
         hxgsHUJRUMrO9eObp6L5iZ+2aDW1kGaNty/RxYNTpucBuUQxuTIU3JGkJ3/GQF79D7no
         m41idc8ZoAknEl30ZHr6NJTirp+BFdSLxt/GnHGpSooYGicQHiMpCUHe73yIeyceeqi3
         ollA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wdgcLh1hcZs1k+1TlDVsOsqE/t4h3zdaR0VQQI+uRPA=;
        b=U/3DvgQn9X7QyCN23hcci0l2BvKb5qlbU43HCPq/9MBZr7jq+N/wwh2GHbUQoQf+tn
         RGC32IZOchLQ0Dqov8/lECi0TbZ0m92yI2vO6QPVMk5ntzSV7p8YL976Z7atat4vzNld
         FSC3ErqwGUUaFb11BvSINcVpiRft2GkjJqOOgyT9+1A7CglAq8l3B5gy57lzy9/shYC2
         vop1EIfwti2ZlM/7YE2SgcVW371cwIAPhVE6E+xL6pHX/Wvuj8G3QsTW3Yicl/apia23
         22Vr/VZDO78ejO4kFsP8jI90KrCDcZgBreqMHh3HeFJqfCUkAEciC5pQJwgVzvf6UmFn
         OdVg==
X-Gm-Message-State: AOAM533Ki//CE1A59uW4cwNw8AeH/W/eAlmL02GC0zZloXIH4j0487+T
	ymQoRaRU4ucQ14vW9u5ewbM=
X-Google-Smtp-Source: 
 ABdhPJzXPZ37fpYcrSRlycyYBHxz5YpFzFHZ6vOItypZ0lBJHtodrv4DCXa315+9+1UGFhJCTMfcbQ==
X-Received: by 2002:a05:6214:252b:b0:456:3c29:2d8e with SMTP id
 gg11-20020a056214252b00b004563c292d8emr13302490qvb.89.1651153684080;
        Thu, 28 Apr 2022 06:48:04 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 c20-20020a05622a059400b002e1d59e68f3sm20809qtb.48.2022.04.28.06.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 06:48:03 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com,
	jdmason@kudzu.us
Subject: [PATCH 00/15] kernel-yocto: consolidated pull request
Date: Thu, 28 Apr 2022 09:47:46 -0400
Message-Id: <cover.1651153370.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 13:48:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164948

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

This is mainly a resend of the pull request that I sent just before
the release builds.

At that time, there was a ppc boot issue, which I've fixed. There was
also a ptest warning, which I couldn't reproduce, so let's see if it
pops back up on the AB.

There is also a known issue with some of the arm reorganization done
for the -tiny cleaup. Jon has been working on fixes to that series, and
I've cc'd him here so he can add context. It was some boot issues,
even in the -standard kernel for sato (last I checked).

The issue with the ARM changes is that they've already been pushed
to my repos, so everything stacks on top. If we can't get them fixed
shortly, I can temporarily revert and do a new patch on top.

Khem has also indicated that the 5.15.36 -stable has all of the changes
required for gcc12, so it would be a good bump to get under test.

Cheers,

Bruce

The following changes since commit 5639708757faa00de1bc64b01220a5f7232818fb:

  set_versions: update for 4.0 release (2022-04-26 10:56:47 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (15):
  linux-yocto/5.15: arm: poky-tiny cleanup and fixes
  linux-yocto/5.15: update to v5.15.33
  linux-yocto/5.10: update to v5.10.110
  linux-yocto/5.10: base: enable kernel crypto userspace API
  linux-yocto/5.15: base: enable kernel crypto userspace API
  linux-yocto/5.15: kasan: fix BUG: sleeping function called from
    invalid context
  kernel-yocto: allow patch author date to be commit date
  linux-yocto/5.15: fix ppc boot
  linux-yocto/5.15: netfilter: conntrack: avoid useless indirection
    during conntrack destruction
  linux-yocto/5.10: update to v5.10.112
  linux-yocto/5.15: update to v5.15.35
  linux-yocto/5.15: Fix CVE-2022-28796
  linux-yocto: enable powerpc debug fragment
  linux-yocto/5.15: fix -standard kernel build issue
  linux-yocto/5.15: update to v5.15.36

 meta/classes/kernel-yocto.bbclass             |  6 +++-
 .../kern-tools/kern-tools-native_git.bb       |  2 +-
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++--
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++--
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 26 +++++++++--------
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 28 ++++++++++---------
 8 files changed, 48 insertions(+), 40 deletions(-)

-- 
2.19.1


