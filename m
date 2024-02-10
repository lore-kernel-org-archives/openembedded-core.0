Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 344DEC4829A
	for <webhook@archiver.kernel.org>; Sat, 10 Feb 2024 14:24:32 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.14381.1707575064812674017
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Feb 2024 06:24:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Tee+uQ1D;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4105a6be071so10589165e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 06:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1707575063; x=1708179863; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XjVDJ0ejb9xXdwRWEHvJ8F+3zBp2LGrHouAIi2VKE2M=;
        b=Tee+uQ1DSz7TLw6OOYlMdt+084GB+bcWJ8Y9d6hjfZmrQgJPiSvrpThIagcXwBlRPj
         u2j39VcI8/vS7sdNZVnBO2QtEDT/BzGEd9JGe3Ppo/qdzn5T4naLYoZAeIJUwND3dv+C
         OtnDCtGSzOoLiiAvUJWDi8Lk4w7vSD7eszAFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707575063; x=1708179863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XjVDJ0ejb9xXdwRWEHvJ8F+3zBp2LGrHouAIi2VKE2M=;
        b=RmssQ1XzOzCeRZogc0akF+jxjL/54dGTWr1CpoRx+fqznKEgJ7GSD0a+YEL9+60RZv
         6Of8yIvzT7yTLnCs+fpzLQOwdmF95R4ysVQSqKxcBE52kESAeGj61odystaGrKI1Zjmi
         8FYNRqWmg1JmVspmprsX6HMey8T5WOcC7WR1TBzg1OVucam41zagFtm2rGcSRCbGOaJh
         gbWhdVJgwg8SejGInqvwoiMFDy92A6nnlD0xmZC+g7VAOv1gYxdtI2TWnGah2DVKNgXr
         MayqXkDfiUKMBP7kDbw5wN8BLmjezjHnulD8CzgyHpt7xsl/pnS6JMndNE5t55VbyQ+t
         fj4g==
X-Gm-Message-State: AOJu0Yz9hBAgSjqz2/ubpOiEeE0KWRdY6JVofx9XJlCGYhNqsD/697IU
	+In592KOD6ZAft0Dzxkng8T1byVdX36aeE5idQZ/CywsyB6duB37zzdKlnbmT27KBDF0KwDYeTj
	O
X-Google-Smtp-Source: AGHT+IFPoynSXXOT6+7IgHJ2/yz8/+oB2JMVB9qPvxOY1VSG9ecyPz0qR2yqa0xXQCnZ6mJLsCErmg==
X-Received: by 2002:a05:600c:4f09:b0:40f:bbdb:4f2b with SMTP id l9-20020a05600c4f0900b0040fbbdb4f2bmr3290501wmq.19.1707575062820;
        Sat, 10 Feb 2024 06:24:22 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c350:b3c8:3bca:cef1])
        by smtp.gmail.com with ESMTPSA id s21-20020a05600c45d500b0040fd1629443sm3542569wmo.18.2024.02.10.06.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Feb 2024 06:24:22 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: paul.gortmaker@windriver.com
Subject: [PATCH] kernel-arch: Simplify strip support
Date: Sat, 10 Feb 2024 14:24:21 +0000
Message-Id: <20240210142421.3518161-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 14:24:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195274

I think these options to strip were added to mirror the other kernel commandline
options. In the strip case, it breaks code such as runstrip() in package.py
since only a single command with no options is supported.

For that reason I find it unlikely anyone is using this. Drop the problematic
variables.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/kernel-arch.bbclass | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index 404f2e70612..b32f6137a2f 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -70,12 +70,11 @@ TARGET_AR_KERNEL_ARCH ?= ""
 HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
 TARGET_OBJCOPY_KERNEL_ARCH ?= ""
 HOST_OBJCOPY_KERNEL_ARCH ?= "${TARGET_OBJCOPY_KERNEL_ARCH}"
-TARGET_STRIP_KERNEL_ARCH ?= ""
-HOST_STRIP_KERNEL_ARCH ?= "${TARGET_STRIP_KERNEL_ARCH}"
 
 KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} -fdebug-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH}"
 KERNEL_LD = "${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
 KERNEL_AR = "${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
 KERNEL_OBJCOPY = "${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
-KERNEL_STRIP = "${HOST_PREFIX}strip ${HOST_STRIP_KERNEL_ARCH}"
+# Code in package.py can't handle options on KERNEL_STRIP
+KERNEL_STRIP = "${HOST_PREFIX}strip"
 TOOLCHAIN ?= "gcc"
-- 
2.40.1


