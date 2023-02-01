Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 183ABC38142
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 16:28:33 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.28039.1675268907694816054
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 08:28:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZBQ4F1vC;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id cr22so5329889qtb.10
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 08:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TJzdBwdjuS/YkZ5KpUcKzeyCuyJ7QYPrTHEzaoqlEaM=;
        b=ZBQ4F1vC1Dc+CiOxfpVTLEFAkEW+1lJSnT+ARH1GS7Phd9pet7VlV3HZ5JgWMaaAeH
         l7jioYXc327ks4NmgXWSWS2tcnTTMn2Nwt9C7d4DElzEbluD7zUuzwUaggd2j/DQhsQD
         IjP8mkDFQAGnDt0feHyub8GcvJ8fn/+XSH54EWpzMOl0HDF1MoB8nFb66NgJoqwKyvxB
         ygGoAnjdoPPNryAgfOC0phXuEGWIcmExkXCVjX/U099EN8kgVT7v3646T9vLnzYz/agx
         X31llkVz0D4BqoYAlt49C2pmibWtFPbZm+ePkQW5KEaXzJKzelUEroPV+u39JaGFqG3q
         k7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TJzdBwdjuS/YkZ5KpUcKzeyCuyJ7QYPrTHEzaoqlEaM=;
        b=Za7qB5H0pz/QaZw1SstxFv2REF2F8HB2ib5Necm40P3up6w6k8XEsPbn+PwHGBiZ6+
         zaM9CjbKWV5gCT1n8vpFKaoWQxe1l2gRPuef5UhnmQ12Rsf6AX4fFjq5y0QTFJO+hpMU
         KOGxZkJSxHaqZiQfF6NwdNllfnoHIqDxdkbuaLomhEjaHutqIZfpTFwsaWOjSCHXaXDF
         z1LAR1MTeSIB7U0WRt8k0JO4mgRmxn9z2ctiOiseSMsP8JRxMdM0GZvyEC8KkKN10FIK
         n/cYXwlKOhJxuEXaN/Od8YVM4k77cQ1Onz3P0qcT/19AM4y0ywnfICDOcP4IMp8HBZBC
         sxsg==
X-Gm-Message-State: AO0yUKVj56HC4U85YccGXPTtT391vbyFdM2f/Jtejo4KsYtDag+vRi4N
	2nmEwI+LzgFpsd8f+4DzH0A=
X-Google-Smtp-Source: AK7set8st6vnuodmZ7naoMKkN0xNavQndXb/9agFn6JPCS/yk2W5t/sI9mTaf77kjoR7x/rgXdQMWg==
X-Received: by 2002:a05:622a:1a83:b0:3ab:6a9a:aa8b with SMTP id s3-20020a05622a1a8300b003ab6a9aaa8bmr5113998qtc.60.1675268906640;
        Wed, 01 Feb 2023 08:28:26 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id d29-20020ac8615d000000b003b856b73e8bsm7528157qtm.16.2023.02.01.08.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 08:28:26 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] linux-yocto: consolidated pull request
Date: Wed,  1 Feb 2023 11:28:19 -0500
Message-Id: <cover.1675268720.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 16:28:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176559

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the latest round of configuration and -stable udpates that
I've collected.

Nothing major, but hopefully the virtio patches will help some of
the AB issues.

Bruce

The following changes since commit da95831d91b1265ecaee5bbfaeb1caaa2c290838:

  scons: Pass MAXLINELENGTH to scons invocation (2023-01-31 17:11:07 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (5):
  linux-yocto/6.1: update to v6.1.7
  linux-yocto/5.15: update to v5.15.89
  linux-yocto/6.1: cfg: remove depreciated configs
  linux-yocto/6.1: update to v6.1.9
  linux-yocto/5.15: update to v5.15.91

 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 26 +++++++++----------
 6 files changed, 38 insertions(+), 38 deletions(-)

-- 
2.34.1


