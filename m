Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9764EC5AE59
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 18:28:30 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.2761.1748456903166594402
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 11:28:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jXW+nzrC;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4774193fdffso1115971cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 11:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748456902; x=1749061702; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l+2BrL4SVdKLKUNuEDr+M2nv8n0ehRmuiQ4ovXfvqaQ=;
        b=jXW+nzrCaalhcOnHUOkAoYWltSNSv8lbCatxCr6e0cQnC+ltzy/RC80zFacyqCwNS1
         YOEaiW4cyvoxoELvzyYGnwR63azeQCtKV6yUV30ptdjB+3+gQQipJpzECfpsz3tbj2fC
         b6FoHNHTuXfjiXaxChzJeQaXxKVxlmdyrSKg8Gd9VHfZiy7Ewap+dPVEOg6RSRFj1J8a
         7EBqAKmpjLt43aton++ojgL8172jsGU00gfoNE49kD+J/3Q6iEhq8QorHd+4bLWTwtB6
         Fk8ZhtFTpqbLsunqX+cwCju6MYcOxgDComtxTniLptZAB+VhUclaDbbUCL77pURNb6ag
         d/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748456902; x=1749061702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l+2BrL4SVdKLKUNuEDr+M2nv8n0ehRmuiQ4ovXfvqaQ=;
        b=OmNeTxewKAELqxKsVG/rOgK0JHE+JVXOwtjYIOYBzspHhySAaGhK5A70LvwPRXz4KF
         t1lpp9WNRutmEtKe0zW3oyanV14rUqHiVYWOwYHmwjUjfOPtfC/GeeGOAazqA7xssbn8
         HiWEOb0bUHQXFuefU/nMByNtWhEwmGSJpQcHEHAX2kYygekQN1Djigjn8R5VXK6EhRAy
         Cti8n5rnTClubENKwIKKupmnZhgEOxAKjXgqfyBM+85dg/ovEI82zd1vVTnhrEqfOROo
         pdMdnUaYffRzVWPYyfschmloRm7s4EIal1P5QawXwPVhg1wHartHzVoTDEEFKLtw0ka6
         TCuA==
X-Gm-Message-State: AOJu0Yw0ms0oNSiFr8L/p8YQoNzYjWjncs4bXYKWhmjZuDwNkHr5aGNY
	qUoX3oYA3i8+1wFk2LP+BgrmDY0UaJ37czp7/ZvV0IprXilN3y3wWT8k
X-Gm-Gg: ASbGncvi4CA6R3BUFPAZb6y4AhuXnASWeLcivrY0yPtqzPpesYBy96e58yDRMWgOKFf
	VZd8VLYjRUP9zxNiPPDA92H00LLLoMPM/ZlQzLgb7pvUeU0bo/QvR1pHELTq/Q5pi7MM+TOtdQI
	ld2TUVKz4r+dpdiCyg600EPhp+5dllbTzwSadwdS5z1XsHF7RrJ0GJ3do8BqJTdv/gf1qb16Z1T
	FqvpcsngK9i+amiye5cD/jl89sx0XQkSX1X5f3C+hbVo9f5Oi9AkN7B62HMORE+6I6NvZnYL9OY
	369iYpCtcM1jPIGtVVOiP1raWwe5bhWPa50BfrycGodtwZ105ZiYfwrWc7OOsHpqGRs8rZT4Fuu
	VelwACXGEFTfuyihJHR7fY2ohUZjWeK+qAmsustq761NUtSzI3eH5
X-Google-Smtp-Source: AGHT+IFf9Q98HHs+OD8DoO4mKpboL9A7TkqkK8PZml5ps7rtKTXudTP4p/B7vIXmzmGngO/EJiRa1g==
X-Received: by 2002:a05:622a:199b:b0:4a1:59f3:938d with SMTP id d75a77b69052e-4a159f39494mr192131911cf.1.1748456902037;
        Wed, 28 May 2025 11:28:22 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a3c80d4dd3sm8992151cf.54.2025.05.28.11.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 11:28:21 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] linux-yocto: pull request (-stable and config)
Date: Wed, 28 May 2025 14:28:15 -0400
Message-Id: <cover.1748456757.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 18:28:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217379

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the latest round of linux-yocot stable updates.

I've been sort of following the kernel CVE update series that
have been floating around.

If that format has solidified, if someone reaches out to me,
I can start updating the CVE exclusions at the same time I do
the -stable merges.

Otherwise, this is pretty basic stuff.

I plan on doing an intermediate linux-libc-headers bump until
I can better predict the version we'll use for the fall release.

Bruce


The following changes since commit d8b0adfaac9118777d099f76c428e088da519ff0:

  bitbake: tests/fetch: Add test case to check shallow cloning using `PREMIRRORS` (2025-05-28 12:37:02 +0100)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto/6.12: update to v6.12.28
  linux-yocto/6.12: update to v6.12.29
  linux-yocto/6.12: riscv config sync
  linux-yocto/6.12: update to v6.12.30

 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

-- 
2.39.2


