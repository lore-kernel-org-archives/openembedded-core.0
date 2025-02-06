Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F34AC02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 22:57:18 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.55901.1738882635672184778
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 14:57:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dfcWKnYi;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43690d4605dso10081155e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 14:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738882634; x=1739487434; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f797Uxc6n10Y1qKEYnq/gYF6atDk3sSNZx9ecNlBxaY=;
        b=dfcWKnYilouWc6DXprC8DrnYxMf9w7rGUMKmD7Mk0KmDucURlvv6p90U1h5XdDsCS8
         w5hZsfRsl7NSm90laxK1+tnCWHrzzRbIYTqj+8VrOsOpdC+dh9xBN6UUhQihxMbYtBcC
         MyZoywtmqXVWihEUClzZjFS/YNKcF0k+tC4Tx7q1x+gLD8ouyEvRX/LkyjTfDxs95IdH
         0sslqjRK1z5IZJu9YeS2StTP9qDIxfxkraUWwUeW6GoZg1AInsJUOkVwI9YjrrNgJCye
         DkkCGxTJgO6UcuDnJQenRD0olo+u5SVIrVGafNKj/+wV5rlsznkoUQWWVro2whNc30Ls
         A+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738882634; x=1739487434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f797Uxc6n10Y1qKEYnq/gYF6atDk3sSNZx9ecNlBxaY=;
        b=iji/gwoVD6HnZ5EevrMAuYkp1ayIgDN22RIoe319PXtJ0Zn5L03M9zqxI1F2XkCpCO
         CFfv5BVE183MggbSAd9RtPWAmfkFT7uFb5JtSKozzK0SPdJmdt5KGgDkZ+iTuj5XQrky
         lG6tkIyY4mRIOckgoFCLApvU8RzRm00SyMvu85pmD87VVXpIoUWipOH8VYw8S+f3ddR7
         Xc4Bw9elYaGaDnvbZ9Lv8tFtUrjLlEMtsRetqTshBahG7L386FldGUmUECjajeD6R++G
         ANs7HnJk9J9VYGFbMn093rQT25eiSoq2jf1AYhHyYOTRMZVUlPhKFiMHmIQLijIkfKQN
         WQ5A==
X-Gm-Message-State: AOJu0YyrxZGeLJhO2/XMsYLNcGex9n+bnhUN7JeL5lTBXY5a4w7R2ovw
	OZt8ofWE/cPaGGitgZQMqbhHP8Hc5cWh2kD0kD30IOmrRVzk+ayFax+raQ==
X-Gm-Gg: ASbGncstdTyTLpBNqH8I6/zMx+AjXZ/HMClxAiKsKsUw1uN+Gwdrmu7rZoSZaL14+w5
	NHQ4/3JdGjs2apPerjZQn1U6Y89iDgzj9bbUkwogyHuqUOatiaMvzfXOsu3tQ12bgMVaLFqvxgE
	V2htbbvQgEp4v8UOpiU1GViUoU2DIGvt5hi++5BnWbKAdJnqZekUeZMrAxG3yneKWKnYZVYVWUn
	XddRqb1ebfBXGmCVSOQsv3jlkQ5+NZd6FEY/q7MhUCSTH0MbqZ4S28Nh0lZejxykRAavkyL42QV
	PEe2hbziFMCQWrkvsBo0o4g0FJEdSDOmDiHzOw==
X-Google-Smtp-Source: AGHT+IHtrz2vilC7F2QYFy2D2y8k6ZJ3udRhNQ3wuEPxgEJZXf0I3N2KOeZ5eyGoOovHnV+6c7pesg==
X-Received: by 2002:a05:6000:bcc:b0:38c:3f12:64a7 with SMTP id ffacd0b85a97d-38dc9351ccfmr414930f8f.50.1738882633476;
        Thu, 06 Feb 2025 14:57:13 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d896d70sm68737535e9.0.2025.02.06.14.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 14:57:12 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 0/4] decouple UBOOT_ENV from kernel-fitimage
Date: Thu,  6 Feb 2025 23:56:03 +0100
Message-ID: <20250206225654.1660760-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 22:57:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210962

The original goal was actually just to write a test for a u-boot
script in the fitImage and to document the various UBOOT_ENV
variables. I realized that the implementation is complicated and
hard to describe which also means hard to use.

To simplify things, this patch series introduces a new variable
FIT_UBOOT_ENV. It is only used by the kernel-fitimage.bbclass.
As a result, UBOOT_ENV is no longer used by u-boot and the
kernel-fitimage.bbclass, but only by u-boot.
This makes both the usage and the implementation simpler and solves
issues like getting the u-boot script installed into /boot and into
the fitImage.

Documentation patches are prepared here:
https://git.yoctoproject.org/poky-contrib/log/?h=adrianf/fitimage-test-uboot-env

Adrian Freihofer (4):
  kernel-fitimage.bbclass: introduce FIT_UBOOT_ENV
  kernel-fitimage.bbclass: do not use the UBOOT_ENV variable
  oe-selftest: fitimage split run_dumpimage function
  oe-selftest: fitimage add u-boot env script

 meta/classes-recipe/kernel-fitimage.bbclass | 16 +---
 meta/conf/image-fitimage.conf               |  7 ++
 meta/lib/oeqa/selftest/cases/fitimage.py    | 88 +++++++++++++++------
 3 files changed, 76 insertions(+), 35 deletions(-)

-- 
2.47.1


