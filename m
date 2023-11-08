Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43CD5C4167D
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 14:16:37 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.14675.1699452994003925540
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 06:16:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YPxfsxSL;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-41c157bbd30so43703021cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 06:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699452993; x=1700057793; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LNJzMVOG/ulV9qwhddrThIbBoVrjIDRpv0lioS51FkY=;
        b=YPxfsxSLNXgesoE/mTqKfyMaGuMW1R1y+6puKVc+pSfjQaqanT6jST4WVT/b9LlldQ
         Ye56Ykz0v6PQWhO3pJm3K8rJK5jhf30yqcbkC2hsB7h/daOyq0Lbbnf/gaY7KV3OBUx2
         FwdFPzvsdNP1sQNXwfuynSKbpih6qnZ+IoX2dQhJhreFrj2fJWKUAoZSYNK5NuqHFtPb
         JnORTzaZoeHXRLEP8FBkZKC0WmuTdALe4qs4XbqHLiwK/aFZ3vuhqc+U4WcBGdwDk2yv
         dqatDX7KK69h+JKzyfbzKMTObk/gQc3y/D4yfK7KmMpmMPcN2u1m3KD4ZiY9oh8bENv/
         j33w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699452993; x=1700057793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LNJzMVOG/ulV9qwhddrThIbBoVrjIDRpv0lioS51FkY=;
        b=Wkb38hfXnQpqxPAUXnoNdaFDEmxgj9L8aeoQGe4KSKMbCK2jvNa3df4Q+L9iDCuWvA
         VfCKy4fWy/iW+U96kg7jp1WgGfL/L+Q18dq67bwld4rR+KuukyqcHRa530GnoAeqCb0p
         DGVz0RWBUyk0LzyXYWP8aMaW9eoOIOOBFoZXgTdjPExd1/rGPFDN5Yu0aplqRfalQof1
         Gj2FQp2YIN8peHxIKi9/MFgAKdiCBZvXTi6o770Zc27Xeow3VeCiNjCgZMyCy7JhwWje
         k74n70K8sYPyApq6k7HJj9B3YkmacE+LwgqFpXNOqTfOqjCGJy9avGEbXyE+j+ji/0mZ
         71tA==
X-Gm-Message-State: AOJu0YyD83rJcP39NNTcFfqzTIeLqD4LyZIRbRay06TjS9YxPR9u6CtJ
	z3INrMAPsikDJNL44+DLSmw=
X-Google-Smtp-Source: AGHT+IGsFMgEEwgHBINDyejqt8E3hqFe2ssZ4x/wHrtuj9WDPzQiUbzl38Xkxwrgd0BIMRe4YWXDVg==
X-Received: by 2002:a05:622a:189e:b0:41c:d420:ab1d with SMTP id v30-20020a05622a189e00b0041cd420ab1dmr2146931qtc.40.1699452992951;
        Wed, 08 Nov 2023 06:16:32 -0800 (PST)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id j14-20020ac85c4e000000b004181138e0c0sm921665qtj.31.2023.11.08.06.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 06:16:32 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/12] kernel-yocto: consolidated pull request
Date: Wed,  8 Nov 2023 09:16:18 -0500
Message-Id: <cover.1699452828.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 14:16:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190339

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the latest set of kernel changes. There's more tools changes
than normal, but I don't expect issues.

Otherwise, this is mainly -stable bumps, as I prepare to move the
-dev kernel to the latest.

Bruce


The following changes since commit 832384fdc69bd909183da7572ab8171dc34542c3:

  poky-tiny: fix PACKAGE_EXCLUDE (2023-11-08 11:00:09 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (12):
  linux-yocto/6.5: update to v6.5.8
  linux-yocto/6.1: update to v6.1.59
  linux-yocto/6.5: update to v6.5.9
  linux-yocto/6.1: update to v6.1.60
  kern-tools: make lower context patches reproducible
  kern-tools: bump SRCREV for queue processing changes
  kern-tools: update SRCREV to include SECURITY.md file
  kernel-yocto: improve metadata patching
  linux-yocto/6.1: cfg: restore CONFIG_DEVMEM
  linux-yocto/6.5: cfg: restore CONFIG_DEVMEM
  linux-yocto/6.5: update to v6.5.10
  linux-yocto/6.1: update to v6.1.61

 meta/classes-recipe/kernel-yocto.bbclass      | 30 +++++++++++++++----
 .../kern-tools/kern-tools-native_git.bb       |  2 +-
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-rt_6.5.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 .../linux/linux-yocto-tiny_6.5.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 ++++++++---------
 meta/recipes-kernel/linux/linux-yocto_6.5.bb  | 28 ++++++++---------
 8 files changed, 66 insertions(+), 46 deletions(-)

-- 
2.34.1


