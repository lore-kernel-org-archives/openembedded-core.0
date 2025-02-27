Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86DA7C282C1
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 17:40:21 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.17118.1740678011581107501
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 09:40:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MA+b/K+Q;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22349dc31bcso23355145ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 09:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740678011; x=1741282811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FGyN1+D67SfzG9W56/IuQXAQUDU3z+VDspM+425oHnU=;
        b=MA+b/K+QcO/iM3+ZjEc2hXP7Igwbjbo3lEiounrKFWqpyMXkJ9vSXnk6w3a0TPOozG
         q0Nf3HLK+YpNOiRPccZCv8US54go3O9OWJyjETSXGQZh15dZtVrTtKZ2n7JwZIdwU0ig
         z2BIxIxtMOiZt8Qy9J0WnHvDIb8kIY57UWkJPkFR0QFbUMmM94IzslFXT1aHOsJE//ou
         zi9OlEFTuy4yBCQ4Fezwx2anW9XvxkUcMbCNJ4k5eL3ydlffINGon9/85LUBx5OKkdxZ
         sbny78h3MeMyCxkdVnejmC4FDeV9Cr8r5aAdjz+14z04CMkjmAECMKq5exkRvffnPFDy
         rckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740678011; x=1741282811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FGyN1+D67SfzG9W56/IuQXAQUDU3z+VDspM+425oHnU=;
        b=J5AKaGL/9r1es3ytnBUdCJ0T6JIBr2iis1a4yju2YxW61h2Q6idu0UoEZG91Y0Y4oA
         KYmTftZdRsgh3UFuzWZVCihHS+hi1nez0ZwwzoIolnKszz598efPrYtennVBYLSgwq1w
         PP4whY/cResX6ZDkdrZmeZu9abTvUOB5a0gTM+WIdhyEhGuCPO8Noq82uRETRaieQngZ
         ceO5jkxjhbvgm7X9XuXxQ6UB9U5iombdHUdqBe80uMXWxC6xTdXjyxtHIJnHuNXQjp4P
         3Vv/4I1+9cOqFYAQEJLLKtDBylaiIAQgEriz5FjtgMOMDrmkVNRfvYQeqVfzoe6aE5lA
         pGHg==
X-Gm-Message-State: AOJu0YwziCAZSqoPbGeeZIqZptQBJnNyuxXwNRrdQEASC3nIhiCcuoSm
	PX/vwhzC+yh0TSBADyldk1kmq7drA+huG9Cd0RxUOYcFRWVUgWPgIQVvl++sj9cq+mV+8B2C8S2
	j
X-Gm-Gg: ASbGnctCAiOKct9mP4J3KDL5DuGSy68JC4ZZ5wW1WLE8xjlU/x3W8FR9T89Unrhl8wS
	/bkeTbnlHu0SeDsPT4qmTHtrMoCUx5ZTiEkaUOKw5U5WhZrDDzg4o50IYUzVmUh3H6Oxmycq7vx
	vI3CmpbxQIu9he4isLNFdj8zGTlqWKwcwwGfQ34+Q+IeCOUH86J2biIgZPfr4pfUewNfw/sugh3
	avWv2/ueqjJla80+oKaitfk5pLQlz+emc/D4Inkr3aBNe3zWi0It3oiqV30+CPxNVHCGB5Zfocu
	+CTGDuo6NP+FRr+A/g==
X-Google-Smtp-Source: AGHT+IGL93gdEc5LNFXG2HscCtO2tXz3fEvrNnmbI+zkMmSmwcRWb23OxMqJyNU5/V7phKpG8YqDWg==
X-Received: by 2002:a05:6a21:7a43:b0:1f2:f20f:67ef with SMTP id adf61e73a8af0-1f2f20f6ccdmr1682005637.12.1740678010795;
        Thu, 27 Feb 2025 09:40:10 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:1dd4:58fa:4fa2:f901])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a00249c3sm1914727b3a.85.2025.02.27.09.40.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 09:40:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/15] xserver-xorg: Fix for CVE-2025-26600
Date: Thu, 27 Feb 2025 09:39:42 -0800
Message-ID: <4227ae54a29ca8b454e56ffd27de2bbce00b6b89.1740677838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740677838.git.steve@sakoman.com>
References: <cover.1740677838.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 17:40:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212029

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/6e0f332b

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xserver-xorg/CVE-2025-26600.patch         | 68 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26600.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26600.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26600.patch
new file mode 100644
index 0000000000..43b47b3ca3
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26600.patch
@@ -0,0 +1,68 @@
+From 6e0f332ba4c8b8c9a9945dc9d7989bfe06f80e14 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Mon, 16 Dec 2024 16:18:04 +0100
+Subject: [PATCH] dix: Dequeue pending events on frozen device on removal
+
+When a device is removed while still frozen, the events queued for that
+device remain while the device itself is freed.
+
+As a result, replaying the events will cause a use after free.
+
+To avoid the issue, make sure to dequeue and free any pending events on
+a frozen device when removed.
+
+CVE-2025-26600, ZDI-CAN-25871
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1828>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/6e0f332b]
+CVE: CVE-2025-26600
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ dix/devices.c | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+
+diff --git a/dix/devices.c b/dix/devices.c
+index 1516147..459f1ed 100644
+--- a/dix/devices.c
++++ b/dix/devices.c
+@@ -962,6 +962,23 @@ FreeAllDeviceClasses(ClassesPtr classes)
+ 
+ }
+ 
++static void
++FreePendingFrozenDeviceEvents(DeviceIntPtr dev)
++{
++    QdEventPtr qe, tmp;
++
++    if (!dev->deviceGrab.sync.frozen)
++        return;
++
++    /* Dequeue any frozen pending events */
++    xorg_list_for_each_entry_safe(qe, tmp, &syncEvents.pending, next) {
++        if (qe->device == dev) {
++            xorg_list_del(&qe->next);
++            free(qe);
++        }
++    }
++}
++
+ /**
+  * Close down a device and free all resources.
+  * Once closed down, the driver will probably not expect you that you'll ever
+@@ -1026,6 +1043,7 @@ CloseDevice(DeviceIntPtr dev)
+         free(dev->last.touches[j].valuators);
+     free(dev->last.touches);
+     dev->config_info = NULL;
++    FreePendingFrozenDeviceEvents(dev);
+     dixFreePrivates(dev->devPrivates, PRIVATE_DEVICE);
+     free(dev);
+ }
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index e50d7bfb9e..d7b0e7b589 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -30,6 +30,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2025-26598.patch \
            file://CVE-2025-26599-1.patch \
            file://CVE-2025-26599-2.patch \
+           file://CVE-2025-26600.patch \
            "
 SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
-- 
2.43.0


