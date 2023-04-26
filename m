Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D093EC7EE23
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 09:50:47 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.3966.1682502646903328560
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 02:50:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=hqFqYyVx;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3f19323259dso57182715e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 02:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682502645; x=1685094645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6k6bsi/KuGbDbZ+itrwFEFr+6A0llxvLUhZHyWH41yI=;
        b=hqFqYyVx5rXFAjK1yV8HrEUp7zxX1nTxJWAVhXuNy/Z7669d/ZGlNGEMhUUB83EQYX
         jm/hEPIBegpvXQQ1KQqf6eyfTFQOo9HsIOXznX3XTwzrpIXZXinEVDKoIOLQ7iysh2fJ
         8XPwtCQzcnOPT9TtXmNnZsTqhTcssCaN7gpTQ5JDwDJbZK93Dh/0g/kl70KAXGC1stP3
         xG6FFmoF7mrYsUtgP4WkTQP6rMSSNbN6jHoUrqEsRBjdIQ2Mm/7+cfIgcbUVM/mwk/lA
         5c/3f8req/GmJ5FFF1XaKeIWMnGD79rvzNnijzPNsEEQEPEGz/cJ8NF0T9ZMhi/I8MOf
         YNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682502645; x=1685094645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6k6bsi/KuGbDbZ+itrwFEFr+6A0llxvLUhZHyWH41yI=;
        b=i3kc1s3uGgcbeu6R7FOLeOPGeVyAnyexE11t5IdQS0/lMbFq3my8SgF17UHB6iU407
         4XT20RV7N9R3TgN9hcBRr6vGNOvLwxF6LBbwIIo7J+QuheVlxjXotXLzFOVtDsB6mQhC
         RDxjqCnO/bjC7Nc0WX3GI3Wx2zDFRw8sxnsEBmzaslpgWRMDkSjXxSVeSMFFFyzvziXK
         bKvUZY7CSjsoC2HEKa6xk8EczYiEDANTp0gTPwXcPmtA0vKAmHA9QQQl11dDUA2iWsZQ
         Lt1q7pY1VLgih84H8gdJ8Boz2ekNeU+iZDgXZzskDPmKd7nZg2kICMZ96NauFcToukCL
         o/hA==
X-Gm-Message-State: AAQBX9difedrjcNpoUnxqRoSyrBIljr+xzWYMsPrhJlAFy8xKmIE9nBN
	d/t/Dg3utUGgosPzh082QoIm/T76w3k=
X-Google-Smtp-Source: AKy350YBvocIm6kzb1N5X9w/ADZ+ofhTIUZDBSHSUAxaA2bwvmksCiCc+fDDoQP0EVUipAnS3pFphw==
X-Received: by 2002:a7b:c7d4:0:b0:3f1:9527:8e8a with SMTP id z20-20020a7bc7d4000000b003f195278e8amr11501822wmk.21.1682502645195;
        Wed, 26 Apr 2023 02:50:45 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id o22-20020a1c7516000000b003f18372d540sm17242867wmc.14.2023.04.26.02.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 02:50:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/11] bitbake.conf: set minimum required kernel to 5.15
Date: Wed, 26 Apr 2023 11:50:30 +0200
Message-Id: <20230426095036.2632847-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230426095036.2632847-1-alex@linutronix.de>
References: <20230426095036.2632847-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 09:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180423

In particular this enables a number of useful features in glibc, such
as actually using 64 bit time_t versions of kernel syscalls:

https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/unix/sysv/linux/kernel-features.h;h=07b440f4eea364b05fa49bf71ceebf78f80efe13;hb=HEAD#l164

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/bitbake.conf | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index afd9e2f5527..2db84a46eed 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -469,12 +469,7 @@ SDKPATHINSTALL = "/usr/local/${SDK_NAME_PREFIX}-${SDK_ARCH}"
 # Kernel info.
 ##################################################################
 
-OLDEST_KERNEL = "3.2.0"
-OLDEST_KERNEL:aarch64 = "3.14"
-OLDEST_KERNEL:nios2 = "3.19"
-OLDEST_KERNEL:powerpc64le = "3.10.0"
-OLDEST_KERNEL:riscv32 = "5.4"
-OLDEST_KERNEL:riscv64 = "4.15"
+OLDEST_KERNEL = "5.15"
 
 # SDK_OLDEST_KERNEL can't be set using overrides since there are
 # none for the SDK architecture. Best to set it from a machine-sdk
-- 
2.30.2


