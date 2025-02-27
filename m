Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB5CC021BE
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 12:32:49 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.9477.1740659568318732454
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 04:32:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=XWrNCwSK;
 spf=pass (domain: mvista.com, ip: 209.85.214.178, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-220d132f16dso10886415ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 04:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1740659567; x=1741264367; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OEMsgJ1OBs5xQquTcFjIwo5Swkt3Pvc9RSSpvkNuOBQ=;
        b=XWrNCwSKbiH9BVYgBLQvdoIjQlEtsiiGVgQFU3V6yJ2rcMvr/KMP8VelPVxEzGJPVP
         +Je0MTXbRF+XuAbgWf4tE7dLQE3UZqJWpxRbgEZblE3K9ITY3lrNHALMNx5/lz2Sbnbs
         WC9ZEBHqd1/DMCQ0yHg6csmUa8z4H4ZyOGORY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740659567; x=1741264367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OEMsgJ1OBs5xQquTcFjIwo5Swkt3Pvc9RSSpvkNuOBQ=;
        b=rrc6t7Ljll5JvbVRK/9QKYFDH2/0ZSq9KXlur9xf9J55p5k+JX2dhMHmDzfkYW7tiG
         huNKDcshuV6SkhW4JWEXzLy4GjHEuaPPX/NyMH1+BW/Z1BW0+Y9UYEOLICE4IE+ybPOS
         t2ViDrPlBi8nxc+nVWxItUYtp/yMUGRb2wVtfrJSFq1FLCGL+4/+trC1MV120qlUAXtm
         ImVZfVs7//XTpJhbfECOAuRmlau7zHUPSlYsM3McfI2K7s9JHETYMYlpmZrKHJDzBpAc
         CaRvuOFAU8k7gu9W4PCtT18u5BnpBpd8FN8bdao6IJw/2d4yR7b9CIZ7zm4rSFEra85a
         JyGw==
X-Gm-Message-State: AOJu0YwbL4PAUP+vxFPa6ScG5XSgkuv5QqVfcxsgFUAuIGMDpCuP2YTP
	ovHbygPMU8vKFAANZVv/wfhACIV72l+LsEXZDlvH7UAVJI0k9zTK5vLrnlwHiVpqxBKj8zw57fQ
	DJqw=
X-Gm-Gg: ASbGncvHAwD3vs1wv75IUKw3JTxnrpVqrrWTDwA268fVVcVA4FkSSMPX4zTL+rSsdZK
	wwuqrCWsziqM5930KCDmDxv1Hu9MYqIdw+ZdVjnS9TqDPfyyC37RlPESYO7G+x6ugH5QM0vdTfW
	gCH4FOdsSqXtqUyREyAWPSyHp2baHGgPGc/Ec78GnfjkVXIOv58I8nhajEzlhkjv+2jkHEsehI2
	lpMVWIbaHQN2NgljEGRJ/jWCWRgrZiUCFHGFpSrYA31KlBmN8n6Ot+WGD+g+IadphwcNXotEh3G
	ksBN43nJyzNQUGPoD4v+8Uy4byGt/2VKX7I=
X-Google-Smtp-Source: AGHT+IHAldCmyxmNJ0Bb81a/+4ofDWUkvG2hNcVEIB46RnZW/1HuaXkh2MIZBGqV5JJ1B0hIiaLt+A==
X-Received: by 2002:a17:903:1c4:b0:20d:cb6:11e with SMTP id d9443c01a7336-22320094a39mr115321275ad.26.1740659567337;
        Thu, 27 Feb 2025 04:32:47 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.225.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c7ce2sm13082805ad.128.2025.02.27.04.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:32:46 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 7/9] xserver-xorg: Fix for CVE-2025-26600
Date: Thu, 27 Feb 2025 18:02:05 +0530
Message-Id: <20250227123207.270978-7-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250227123207.270978-1-vanusuri@mvista.com>
References: <20250227123207.270978-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 12:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211998

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
2.25.1


