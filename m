Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 484E9C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 19:49:21 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.41963.1698954558757702920
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 12:49:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=EgyBPwqD;
 spf=pass (domain: linaro.org, ip: 209.85.208.169, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2c523ac38fbso18442061fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 12:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698954557; x=1699559357; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OapmMxzIq4rePK2ywbCDMbL3PSXL/c8UeSDGtPYdMrc=;
        b=EgyBPwqDqCjhNrsmlpedS9GHXmBiCDSFJXYruDrdf6s2O9B3xHwqQ0G+oGUG0uHHJ5
         kLD735/NGduGuH0+qEsGBpS4Emcdhy95qftDH0PEUDTx0EpyAqetZrh3jLGQ7J9KgrAM
         yUxl4aaK5gjiCmLGarIEj5nxo4WLSlkY3PM9Mri5GYTaM4hbmkusFPZhrTRah0CPVgfq
         tqrwrmkW1+I9kLiSmICccNvsUMmLCxxjSI/6x/YJ4GCMgCH6NoXcgmW/I8hXdwiR/jq0
         qOOkcOl/UJqCEG16hcqnbd8HVy1mecdhlGU+utTRBExGNTBvcqiEahU7OuxdA6aGkyYi
         GPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698954557; x=1699559357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OapmMxzIq4rePK2ywbCDMbL3PSXL/c8UeSDGtPYdMrc=;
        b=IrOVz936JN58VkBd25a7V8kpIucfcwADRv6xLU1QvYqrw/+wHWlL/ADWsOMISBFBRp
         i3XWPQzBAYu3Qdyd7iyacLP1494ZLjdmVz3rKXWfu9EcwFsKc7/MPZ/a2c3VUGQH3sRO
         seq82I5XaWzAHI0MK4x2ZBHv4hCslxOnxK3hqBuoTGmk7IqvsFinOvPvuKm69syAouXs
         n1JvxHItRJ9dhEluZeblgNzApfZEgq+/yetRvr02oBnkA4TSD22Uo/ivHFjyryIsPkG9
         xiuLFHRdq12qlmFkF7mEih3h7gIvY8gNunb5sASyqd8F8AJP6TD401Mp68CWQWmPkMcA
         nZsQ==
X-Gm-Message-State: AOJu0Yws0+pRrfdakXTr58QlXVDyJTr1SQs05DnsTQpHlT5/YOH5In5I
	DvrKFrvh0ZBLAZ/3Ge2fD6pLN4kvgB63edIayl8=
X-Google-Smtp-Source: AGHT+IFWzeMVwFMmgwJzqAGJjadE6cNreSqpIKYlR1uamqRPcbocrTu5sgObCoEm5y6mKQwX0dj8hg==
X-Received: by 2002:a05:651c:2122:b0:2c5:a1b0:d95a with SMTP id a34-20020a05651c212200b002c5a1b0d95amr17950371ljq.14.1698954556373;
        Thu, 02 Nov 2023 12:49:16 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u17-20020a2e2e11000000b002c123b976acsm22593lju.76.2023.11.02.12.49.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 12:49:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] kernel-arch: drop CCACHE from KERNEL_STRIP definition
Date: Thu,  2 Nov 2023 22:49:15 +0300
Message-Id: <20231102194915.417080-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 19:49:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190102

Building linux-yocto with ccache enabled results in the 'command not
found' error, because kernel-yocto.bbclass passes the KERNEL_STRIP
as a single value, whic is then interpreted as a command name.

ERROR: Fatal errors occurred in subprocesses:
[Errno 2] No such file or directory: 'ccache aarch64-linaro-linux-strip': Traceback (most recent call last):
  File "/home/lumag/Projects/RPB/build-rpb/conf/../../layers/openembedded-core/meta/lib/oe/utils.py", line 288, in run
    ret = self._target(*self._args, **self._kwargs)
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Fixes: 03973c8c1c93 ("kernel: Add kernel specific STRIP variable")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/classes-recipe/kernel-arch.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index b0db99faa3b2..6a50bbfd4290 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -77,5 +77,5 @@ KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd ${DE
 KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
 KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
 KERNEL_OBJCOPY = "${CCACHE}${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
-KERNEL_STRIP = "${CCACHE}${HOST_PREFIX}strip ${HOST_STRIP_KERNEL_ARCH}"
+KERNEL_STRIP = "${HOST_PREFIX}strip ${HOST_STRIP_KERNEL_ARCH}"
 TOOLCHAIN ?= "gcc"
-- 
2.39.2


