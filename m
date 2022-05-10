Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA18EC433FE
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 15:43:31 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web08.505.1652197410866640099
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 08:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=eUFjaaWB;
 spf=pass (domain: linaro.org, ip: 209.85.208.180,
 mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f180.google.com with SMTP id b32so13091547ljf.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 08:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IvYoX9J0hj/BgkTcmljBRzWS/zZFWQuZUDMhWDmBnts=;
        b=eUFjaaWBAQbe3HwuCwuWRojGOL4tkYwQn7C14b0CdnRu3kgC0ds4jsvWkx3AO0KZFh
         Zwj805F8trvU8u/MapU6ETtKyY+iMTxjHEtwgpGsnmo16y7OSzmDqC9Vi/cPLUXRU+/0
         HfwrFprhsrtLeETYjS3Y7A8zD5pv+QOibEORViXKIXJS4Er1VtAvnjoi3J+i7AHBTr5v
         SKOUZ008u2MLMbl4GX/7UPUu7AfIvBEwX5dQNWCfCkCGeBscEFYBgnp4v41BWKA/8GRB
         a25VgDhrBRRNgW4d2s7QZ1NWDngDa6Xq2O9C7TVf+Hblk7WYeeZm5RPqqHFAjmq13v7N
         6r2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IvYoX9J0hj/BgkTcmljBRzWS/zZFWQuZUDMhWDmBnts=;
        b=ewMhkxQN3cf3/rDEOviksmmijYj6oQY6B+rhT3tZ1wUXpUcjk0V4d6MbJV+nGlODES
         f9Sf3A6+dKNacBnkBGRCvAdwqtxFFi8MY8x13F3Wp/RuNk2GXf5sK6yU/StqI+vIXm7h
         EEwv66HT0Rkb9xqcI8iurpjOqd3unjt9fJIY4h220mszKrEjtsJJvFGA/0jeni9WHOMm
         JaQoSXRV+Dpq+xev9R+We7tTdPLNv4SnnhDNpT5z+TUGr1pJTcI0IoOHP5WuMT0bGPX4
         xlDOo9cBMP8X0aW/VpMFABqLD2zVXK2WRwTydV9ZV4J8MxMRALPgXajCV+UVN4SOix8m
         4AVA==
X-Gm-Message-State: AOAM530x/xThp/gsU3xDblIDS6edcB01bauxjVDA8Lh1IRrIgSQE5Rc4
	FwVgiTCX4VVP3g8bszeWgnYTJ7aug0bsHQ==
X-Google-Smtp-Source: 
 ABdhPJy2gAYQj7GPFdJevydI9nqhtpdyOk4Dg+rLWO8lDaZl3WeeQIYOOBt+mWgJ9R+ObQmgAJ+CRQ==
X-Received: by 2002:a2e:5cc8:0:b0:24f:1616:7d67 with SMTP id
 q191-20020a2e5cc8000000b0024f16167d67mr14176027ljb.368.1652197408476;
        Tue, 10 May 2022 08:43:28 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id
 d14-20020a05651233ce00b0047255d21136sm2325964lfg.101.2022.05.10.08.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 08:43:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>
Subject: [PATCH v2] image.bbclass: allow overriding dependency on
 virtual/kernel:do_deploy
Date: Tue, 10 May 2022 18:43:27 +0300
Message-Id: <20220510154327.2436624-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 15:43:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165463

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Since the commit fe26b2379ecd ("image.bbclass: Depend on
virtual/kernel:do_deploy"), the image.bbclass made building images
depend on virtual/kernel. For some images, including small initramfs,
this is not the case. Allow overriding this dependency in case
developers knows what they are doing.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
 - Use the same variable in both lines
 - Change the var name to KERNEL_DEPLOY_DEPEND as suggested in the
   revert message.

---
 meta/classes/image.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 7f1f6f80a464..c4051961c030 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -132,7 +132,12 @@ def rootfs_variables(d):
 
 do_rootfs[vardeps] += "${@rootfs_variables(d)}"
 
-do_build[depends] += "virtual/kernel:do_deploy"
+# This is needed to have kernel image in DEPLOY_DIR.
+# This follow many common usecases and user expectations.
+# But if you are building an image which doesn't need the kernel image at all,
+# you can unset this variable manually.
+KERNEL_DEPLOY_DEPEND ?= "virtual/kernel:do_deploy"
+do_build[depends] += "${KERNEL_DEPLOY_DEPEND}"
 
 
 python () {
-- 
2.30.2


