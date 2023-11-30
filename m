Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CB2CC10DC1
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 20:58:00 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.5146.1701377880186697758
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 12:58:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nYpm/Waq;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6cdd214bce1so1399768b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 12:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701377879; x=1701982679; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rxDWKdpAQmaUK1OoFnL2xEF3rteHWdKdyFnp/baJ5wM=;
        b=nYpm/WaqAK/24IVdTWOxlX0T0xF2zzZAzt8ACTuwId7J1sptpcqUZvUjttpAyBmhuk
         oQ8lMSPuGnv1kC5AV245K8nBZovDdsbiOT27SgWBYZtd8kKKYz6b7aemKdiQ45YI0OyI
         TKAPMJCZxpeFhm8JlqCEsaD3ptHKASTNXSHqPiE33sYyrz/zj/T590abUWh64IlIFVP2
         J7zU07MaegA427k6EWLxv4UTHTQ6zXeyNb1R6hUGvaZBIBmeYRIFzTFCIBISzjzxg6Gr
         JhQpe612+EUznyq8xdbRO6eqTLiDLgj3uJ3mOU/xWshcSeboRCMRj6nXjWqFgZEJwYk8
         mIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701377879; x=1701982679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rxDWKdpAQmaUK1OoFnL2xEF3rteHWdKdyFnp/baJ5wM=;
        b=QahBIz0dC96FZ9aU7j3xAVSsgQaaWj+9Ws4T8IqR6ROLKd9rxXHa3WBLypKqwiDXoo
         gxn5kncAqFk4S+uOUVU+VWdKOrppMAzI8ZkFYugu50olIj9pSOfDo5e0tF7wj3OhkYS3
         SSYM3Tgf2EOERjWIJ14y8mT2OjnVqTFrmV+OZAqWlE3Gp5symaojiR3UzUOihcn9FNqY
         2jDzfY2v5u6hbRB3QdVhrHETk8vz/4jghZfl/0kUuevkf5ulzSjNxT0OAVaxoR3VqfUa
         vYUVGpcXYYF5N8CJjYsryis8v7facYQzRycSFivG3O4Lw2sEREzWXy1qJclFiI6Qr8oN
         fuUw==
X-Gm-Message-State: AOJu0Yx9FW2bQGKFgcRvn5HxzAmEGZDBJbfJbBX8xKyO4nc6f0pvFHWO
	lsZDbH+s+ZFZT9mF+xP8KhqyVaTJRWrZgsWGG1D4WA==
X-Google-Smtp-Source: AGHT+IEaIF53eQSxelRC+eGPnGdy7FDWYosVyEywm0fCK8pAsoYcNSfCtK1OF1wbeeCaDHpSUYh6Bg==
X-Received: by 2002:a05:6a20:8f1a:b0:18c:4b78:37a8 with SMTP id b26-20020a056a208f1a00b0018c4b7837a8mr22946969pzk.45.1701377879235;
        Thu, 30 Nov 2023 12:57:59 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id f18-20020aa79d92000000b006cbbc07a1c0sm1635418pfq.156.2023.11.30.12.57.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:57:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 11/25] linux-firmware: upgrade 20230804 -> 20231030
Date: Thu, 30 Nov 2023 10:57:19 -1000
Message-Id: <4027a2961d023c3788ec6d08b8f55b2b64bbc005.1701377676.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701377676.git.steve@sakoman.com>
References: <cover.1701377676.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 20:58:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191529

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

License-Update: additional firmwares

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 7c725d1f2ed9a271d39d899ac2534558c2d103fc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20230804.bb => linux-firmware_20231030.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230804.bb => linux-firmware_20231030.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index 33be741a0a..fd38253dfd 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
@@ -151,7 +151,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "41f9a48bf27971b126a36f9344594dcd"
+WHENCE_CHKSUM  = "ceb5248746d24d165b603e71b288cf75"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -237,7 +237,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "88d46c543847ee3b03404d4941d91c92974690ee1f6fdcbee9cef3e5f97db688"
+SRC_URI[sha256sum] = "c98d200fc4a3120de1a594713ce34e135819dff23e883a4ed387863ba25679c7"
 
 inherit allarch
 
-- 
2.34.1


