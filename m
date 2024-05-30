Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED3AC25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 21:44:43 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
 by mx.groups.io with SMTP id smtpd.web10.3686.1717105475362452341
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 May 2024 14:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C1JMLif2;
 spf=pass (domain: gmail.com, ip: 209.85.222.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-80ac4f4be36so423448241.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 14:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717105474; x=1717710274; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gwW80sOJaROi5SfrHA3pUjQnBohshdJ4Vmha9u+CuYo=;
        b=C1JMLif2mgObQAk2UnhsX5t43GgVJhuYiTOILAkVC73ixSYGTeM57wr6HPD/cViDWX
         c8k3ZNUbBCmrSnI6+pHuHmmWFLscvDI6RJRjAmqGU6XqMN/ixiLa3ENMeKzW8XHlOpdZ
         DFm0Iwxn1/TKJMpPC4lScgvUk5307Rk7OO3oCiQcSuV56cC6Vimgno4OFmcuNUd7wGWE
         xlf6tZ9zbNeD0zUjLISZL+e2TwuGgQ73WzaiLMixVhfCFblexVR64yPoHoS3/Vq/nqGe
         +0N12TxzF106N2z8gnYKkK8yrqhULEUn78NF7WXUTz5ermCN4XuWHcqn5p1QYF6FZUdt
         sYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717105474; x=1717710274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gwW80sOJaROi5SfrHA3pUjQnBohshdJ4Vmha9u+CuYo=;
        b=hW/mmcVD8emkwC9R8PKANzIPnm/7JvTOcZLJnVxOfBOkWLnQDPjrzKAuOfwWAqTUzc
         8r2ozaJar6VtDwgAJXt+r1E9j82w48Zmier21Ypn6Zut6WYUeiFGRTzeGalK5wmBbGhN
         mIi62BFqp6MfEg8qDhNnXekvY7O667XvEkThZZb3cfqKXBUtSrX7Ra4+cvVZlYliEJYv
         xaLv5jYXSxnz5MnkTMNymVfkve9MicxhINejtdTlRfufwa8dm0B3GW2nZo2TVhTufJUs
         IdSpTYsNk6nLwzUIbEK5CtLGoZYw0ThZhqtx5dF2AHxD9RwB/Rpr6DUOTMRRfsQK8lAe
         xQtw==
X-Gm-Message-State: AOJu0YzLwAY5MLoMkzPA31sd8RksCrkt6vgaDqqNOSIOiB7Dq/8q9s/f
	IelQzYlfdH7QvZTkMzt+Thlr9Qh6ZuLGSUhxobtKRGrhRF6ZiisQ
X-Google-Smtp-Source: AGHT+IHO3vE3aCIDtkOvifCPoiLFao+b5hhvDvs5lft6IdSzy1yL/RvnFKK/um8T9RgFP4567rR/Xg==
X-Received: by 2002:a05:6102:4611:b0:48b:bee2:51b7 with SMTP id ada2fe7eead31-48bc21fdcf2mr111671137.20.1717105474195;
        Thu, 30 May 2024 14:44:34 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794f2f120f5sm14642185a.36.2024.05.30.14.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 14:44:33 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] kernel-yocto: consolidated pull request
Date: Thu, 30 May 2024 17:44:27 -0400
Message-Id: <cover.1717105222.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 21:44:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200046

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

A dev kernel bump to 6.10 will follow this, but I still have it under
test.

I've built core-image-kernel-dev and minimal for multiple architectures
against both musl and glibc for the kernel headers and I didn't find
any issues. Fingers crossed the AB doesn't find something I missed.

-stable updates for the LTS branches will follow in a few more days.

Cheers,

Bruce

The following changes since commit f66f8fa9f605d5dc39acb10226198b3ab40dcaa3:

  oe-build-perf-report: Add commit hash link to chart tooltip (2024-05-24 16:59:31 +0100)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (5):
  linux-yocto/6.6: update to v6.6.30
  linux-yocto/6.6: intel configuration changes
  linux-libc-headers: bump to v6.9
  linux-yocto/6.6: update to v6.6.32
  linux-yocto/6.6: cfg: introduce Intel NPU fragment

 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 ...aders_6.6.bb => linux-libc-headers_6.9.bb} |  2 +-
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 5 files changed, 22 insertions(+), 22 deletions(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_6.6.bb => linux-libc-headers_6.9.bb} (83%)

-- 
2.39.2


