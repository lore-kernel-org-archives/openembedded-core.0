Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35926CA1012
	for <webhook@archiver.kernel.org>; Sat,  6 Sep 2025 13:03:39 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.557.1757095776428449081
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 11:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lD+qHDkr;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: rmmuniz@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4b48eabaef3so27603351cf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 11:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757095775; x=1757700575; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sPYtidlTrQT1VkdbZHVNSL0vh6JBxus5SCwXNeVJw3A=;
        b=lD+qHDkrgKKMAbieu9wBy5eDJznYaiU+0fJwk0/KeNz7k3zix+PHrmoAaUxCCy8y4F
         FlC0pAQJjlTChoXk8yb2x0fAyPSNCrvmfVkYbxb8qNX15dafqWCThM8BQ4ahaJ9LWEx9
         spG6KdUwxXNSQ6PTSdrOlW6dO7P8Fw8p6ZwOA7Vm+yYuqgob0pYjeWdH5qebxuAD0tNt
         UepLSF8LOXD+JNp7ytOdq3XnjN0G5Tb4rUVbzvVMn1LJTlqjqdL1gX6rXB0hc1lezC8A
         f70P/4LCAqpgbPeN9Oioxz67mE1tH5dkJXeeILXLk+0h1HaJIGThr5G1EqIvqHDabsZe
         fFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757095775; x=1757700575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sPYtidlTrQT1VkdbZHVNSL0vh6JBxus5SCwXNeVJw3A=;
        b=p6rQ1AHewtpkVP0QAuRyzgzgkpI4XSllVOBrz+8DHUk4k0th7R75KXA4V3qBeIuS4N
         cqvVhg01NfASAwYOWLRWbPoxzHR3SXhxjxTzAQXdE4PxrukMyANWntxM59BjinUyGu2G
         snk328HkPZ8N9GB8F4PYuEKWanRnSgP79nW8zH5A7ryGexI4FEZ02xfLrM2uw5lt9LF6
         /5MviD1TPXyzUkQvozXqYGsZ039nfHPMAPLs27CaCvnFH/tjcTUbvrBBavnO9iKwtdeD
         VloAWsxY+N9KxHJ7M+xOkYGAo6bY49o0bnO0YcZpMO++IGuswnV4nz49WrZbj2Vd5tQZ
         0xGQ==
X-Gm-Message-State: AOJu0YzIbJkhi0DS+uz3ok448xkonjVr2NVwwr2WUNH5vqJYx9ejA5Q9
	ngle4ACvP0C60Mp/SH/to4QZEcJtDYR9wcQAvZwl8a5Z+FFJIlvLmiYwhwe3yw==
X-Gm-Gg: ASbGncuIFhkR9L3CMVwx6gXsRujZqZWXCbLJFKWeDUZuLSuh0L4lyLweFc2dInVSH6+
	N4Gsy5/zF/40llyFJPrV2+r3xgdwh4R58ljCILpm6G6OH2y0+eAuMFtZjaQuvlxjDn21wc0fkbv
	dsPu3259nPCQfWlodATkEXi8CumRqc5gOXAZ1Xmai1EMWpiZ1DAHG7jjzGC6bXUKB7ybg0enZ0g
	a1nzyKk8veCIu53x6MW662zqiNCFv84Ui5//PJ00wxRanjarbLahZkjNvqHUvU6cIOX4ycknfZE
	L9Fl/cju4jod3t4mYUxuyZDnN2cWYARl6p2ALvTYQ63H6ZhQWdNOdWQd7h3cm/XJAyoCQT9RMjX
	hZoHTWlOuJ04fcsH9h+bUwet0qxtIb4qgqtxvG7wAEtGUOiSDojNkyHrIyff7I2YtwNg7XviGFX
	9YJjInEZ1m8g==
X-Google-Smtp-Source: AGHT+IHeqd4cyqzYqx3QRzj9YBvOPSz1QTic1Jtc5xGMrZhvWn9nSZnvTQoEsQ7MnXAOmVXApEcuAA==
X-Received: by 2002:ad4:5fce:0:b0:72d:de5a:fe98 with SMTP id 6a1803df08f44-72dde7984f5mr32614576d6.56.1757095311823;
        Fri, 05 Sep 2025 11:01:51 -0700 (PDT)
Received: from rmuniz-SER5.home (bras-base-qubcpq0974w-grc-17-64-228-161-9.dsl.bell.ca. [64.228.161.9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7243de51ad4sm50816226d6.53.2025.09.05.11.01.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 11:01:51 -0700 (PDT)
From: Rene Muniz <rmmuniz@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH 2/3] python3-evdev: add missing uinput header
Date: Fri,  5 Sep 2025 14:01:48 -0400
Message-Id: <20250905180149.2497823-2-rmmuniz@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905180149.2497823-1-rmmuniz@gmail.com>
References: <20250905180149.2497823-1-rmmuniz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Sep 2025 13:03:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223044

From: Yoann Congal <yoann.congal@smile.fr>

Without uinput.h header, the evdev module can't be imported because it
lacks the UI_FF* constants.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb b/meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb
index 28c8ea4bc1..dc777cb987 100644
--- a/meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb
@@ -12,7 +12,7 @@ do_compile:prepend() {
 }
 
 PEP517_BUILD_OPTS = "--config-setting=--build-option='build_ecodes \
-    --evdev-headers ${STAGING_DIR_TARGET}/usr/include/linux/input.h:${STAGING_DIR_TARGET}/usr/include/linux/input-event-codes.h \
+    --evdev-headers ${STAGING_DIR_TARGET}/usr/include/linux/input.h:${STAGING_DIR_TARGET}/usr/include/linux/input-event-codes.h:${STAGING_DIR_TARGET}/usr/include/linux/uinput.h \
     --reproducible'"
 
 RDEPENDS:${PN} += "\
-- 
2.34.1


