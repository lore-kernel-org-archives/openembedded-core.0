Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A57FC369AB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 19:54:53 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web10.4271.1745006089792549294
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Apr 2025 12:54:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bbA1XAGZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-47698757053so24141111cf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 12:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745006089; x=1745610889; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uzYb/LhhdENqkjBLctTNbDJNBrMLF6+qchbOyQ4ivdo=;
        b=bbA1XAGZsKQ1AU5fIzp3DCVdUXbdpfzdkJaVL4DlwUT/bJ/LIBAd3c11f+biTdQZvF
         5s4qscswNf01wcLKERBuxtSTDMqTrkRHPQrZf4bXNPSMBwBW9YjUauCkO6GjVnbloW8I
         FV+Y8BXROoyHlvM2TQ8SjT9r2o6zr44xK9iFmthpI69LyscANVJqm8mswa+biuDSNQ97
         dfCL/aNPPkDBqVRYp97xBnRqmwikvMQ85iFODJ1966D0O+6r8I07LLw+FgMdEMKSjjYe
         ko1Dt5iOWtW2yrZHOfnpdJMK/THXWP5yB8OSY3Ge2EAopiwbOeicY/M8CJGodwDprVrh
         q0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745006089; x=1745610889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uzYb/LhhdENqkjBLctTNbDJNBrMLF6+qchbOyQ4ivdo=;
        b=vIeBSL5wNTeJVMH0Dmx3amfDcAeSU2+6V+5ttSI0W8ryh/gQSe558l/6e99e5NTUB4
         gskKpID5+pARLSbza4bxNQAmr+73pYL/RQJI3jwd+mZESbr5mIc5++I30/ELhbVPO27z
         NPTOx8OuZ7jREwq6as0bs9JHYNJNA2WbzLMQwUyxl9z8ZB72Y7j7qy5qcUJnFQAYrO23
         uFUQ2Mk0s0SD6KitCkPKBRhwwsOG5su91HdbpjMpt4tquOJO1Kom/wGD6H4us2Vo16Ih
         cewL9iv48PU0JicJMqw4bgNKMHmZDhGoBMmoipVaVPckyy296LUpPp9UgcjSuq8i+bd9
         jfGQ==
X-Gm-Message-State: AOJu0YxddrffUYUl+3Kt1vbhA4fwHinffTzBxSePOuOlHrhtdGSdql8b
	VwebQJ3nMcmeE2/gZTZoNS2tKk3CbHe05bICc7eOZ4NVCZLLkB8/
X-Gm-Gg: ASbGncu1fGj/jXKtSwjZxb4TGQzTk3rtkfzTgyn75Sv2XLsTqDnQN+ai2NXAenm9Sfa
	zCWGheBYCRt/4GNTrjnZ8OTuq3rpC2XWZamVvD32VtNL5/Sk6V0CXo4+GXgMsS4jKuOdtynzPmT
	kXvpLfMY1vMK3efHi65paEGqmwmNAg2IS9tnQQvR/fA+AI0yLKiiivysco++ckYheS4Gcq7enVA
	HJTO7h6R2qNSJSz0hcaMhXZkeva2h0TC6KJpbR8CpxNC9uN6sssNVWBnbtHGaFbF6q2fuUV08rK
	BL5nK6gec0s4JMqLfUlu4AJOyuL3KdRhJ3HOQ8UK3mgNEsPboqrMAIHsZURsHvpyNzz4qtFhsRi
	sWutRgTZ8PMHnXpwbSQO95IQ26cQO4dxuwz6lHCgiZQ==
X-Google-Smtp-Source: AGHT+IEG30G51VCHlwkE0DxDOegGkGzYxLaRk3PLWLirP9/6yRFZ+++jS1x06mY9DkXq9fs4D/hVlQ==
X-Received: by 2002:a05:622a:180c:b0:477:13b7:8336 with SMTP id d75a77b69052e-47aec394c93mr49109911cf.17.1745006088752;
        Fri, 18 Apr 2025 12:54:48 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9ce085asm13774061cf.51.2025.04.18.12.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 12:54:48 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core] 0/2] linux-yocto: -stable and config changes (for current release)
Date: Fri, 18 Apr 2025 15:54:44 -0400
Message-Id: <20250418195446.1914594-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 19:54:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215141

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

This is the iommu configuration change you were waiting for, but I had already
updated to 6.12.23, so that -stable change is coming along with the meta/cfg
update to pickup the configuration.

If there are any issues with the -stable update, I can attempt to jiggle the
patches such that the cfg: iommu patch brings along the 6.12.23 kver bump, but
not the actual -stable update itself. The -stable would then follow later without
an associated meta data update.

But since that is a manual operation, I wanted to send the patches as-is and
let's see how they do on the AB.

Bruce

Bruce Ashfield (2):
  linux-yocto/6.12: update to v6.12.23
  linux-yocto/6.12: cfg: Include iommu.scc for Arrowlake boot support

 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

-- 
2.39.2


