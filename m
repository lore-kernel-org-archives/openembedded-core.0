Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23125C7618B
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 15:20:12 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.16014.1678375207798734971
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 07:20:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cZ4p5ULt;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id ay29-20020a05600c1e1d00b003e9f4c2b623so3854779wmb.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 07:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678375206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2Y6jtEtgpdqpQX6cO4ZtlSA0PUn5GZqI7f7almwtso=;
        b=cZ4p5ULtqWza//vPaNtUBFDwwdkF/aKij2ijSglw1ObuXNy6/izm+qtHYX2hc05ITN
         lhLoc+V+yFNrSYv73RCv4+VBQoQADZD4HTH5U83pqSKKrOwOac7PHvb2DeS9RBqohORS
         MgkVWawpiAW7udoV2FmpqoJi6Cz1J47QLMpb4SDdtEu9HxZjlC10YOgw091HnGmX+tU3
         AoCxsob/hyGaxFWKT673BFuvAJTBgs/ao73g30R+IDQmaRjP5K5ox1KUyGcU14/iKfoO
         9bkU8uGJXOGMjQc8jTpk2e1ZLPEiFoEbHWF9gBgExxUxKw4aP+nkVU9KBHIh1z2DdRSp
         eMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678375206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k2Y6jtEtgpdqpQX6cO4ZtlSA0PUn5GZqI7f7almwtso=;
        b=oIwPq3XDccLDz/e0JAXcLvPxGZSJwoP5xRAd74ArwC963OoY22X3I8gxeORoVhX1N/
         HKyU8OgLhc2wxUYKOYSGoTaD2W1sF3CaCb4KMWt0zKp3Hp5/4WZCEz13HwWQBE77Tudb
         mW95jLHD2fpYmFhuGkI3dtNOzkmUIjjlD2TRKKgrDfDHiOaRmNla/Y/OpwTcqzng2qW7
         qn4a9FLmZuoIs5lE/dOq+B1bLJ6uvfPl/Q4xohOl+I5HFFlfAX+j4uqeYlcLKvUTpWzv
         Ar6dZA8aoVGguMBUb99h1VqyT375BphIzBmMDHCHNxOsm1N6HOKD5AOTpt5L7EtcAlXa
         yE+w==
X-Gm-Message-State: AO0yUKXVFDPB8POaezMyj+0IdeLd47SAWIAqkr7EF/lekLBwD8UMEb4H
	Ofqx8DAVZbWJuDx7GYCAnC8w819eVi8=
X-Google-Smtp-Source: AK7set/29vT3LZn6D7sX9IZaC/rgoqb2jpSXopiOqx9CHVCG48VGImqXZoaCrR9o+9kcMeQAItlqDA==
X-Received: by 2002:a1c:7417:0:b0:3eb:2b69:c3c4 with SMTP id p23-20020a1c7417000000b003eb2b69c3c4mr20956305wmc.36.1678375206286;
        Thu, 09 Mar 2023 07:20:06 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s10-20020adfea8a000000b002c7e1a39adcsm18314521wrm.23.2023.03.09.07.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 07:20:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/26] selftest/overlayfs: enable systemd via INIT_MANAGER
Date: Thu,  9 Mar 2023 16:19:36 +0100
Message-Id: <20230309151958.3619193-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230309151958.3619193-1-alex@linutronix.de>
References: <20230309151958.3619193-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 15:20:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178229

Latest systemd version needs the full set of settings enabled
by that (if also r/o rootfs is enabled), and refuses to boot
otherwise.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/overlayfs.py | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
index dfd9f1486d..b4f0663828 100644
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -139,10 +139,10 @@ OVERLAYFS_MOUNT_POINT[usr-share-overlay] = "/usr/share/overlay"
 
         config = """
 IMAGE_INSTALL:append = " overlayfs-user systemd-machine-units"
-DISTRO_FEATURES:append = " systemd overlayfs"
+DISTRO_FEATURES:append = " overlayfs"
 
 # Use systemd as init manager
-VIRTUAL-RUNTIME_init_manager = "systemd"
+INIT_MANAGER = "systemd"
 
 # enable overlayfs in the kernel
 KERNEL_EXTRA_FEATURES:append = " features/overlayfs/overlayfs.scc"
@@ -274,10 +274,8 @@ class OverlayFSEtcRunTimeTests(OESelftestTestCase):
         """
 
         configBase = """
-DISTRO_FEATURES:append = " systemd"
-
 # Use systemd as init manager
-VIRTUAL-RUNTIME_init_manager = "systemd"
+INIT_MANAGER = "systemd"
 
 # enable overlayfs in the kernel
 KERNEL_EXTRA_FEATURES:append = " features/overlayfs/overlayfs.scc"
@@ -316,10 +314,8 @@ OVERLAYFS_ETC_DEVICE = "/dev/mmcblk0p1"
         """
 
         config = """
-DISTRO_FEATURES:append = " systemd"
-
 # Use systemd as init manager
-VIRTUAL-RUNTIME_init_manager = "systemd"
+INIT_MANAGER = "systemd"
 
 # enable overlayfs in the kernel
 KERNEL_EXTRA_FEATURES:append = " features/overlayfs/overlayfs.scc"
@@ -344,10 +340,8 @@ EXTRA_IMAGE_FEATURES += "package-management"
         """
 
         config = """
-DISTRO_FEATURES:append = " systemd"
-
 # Use systemd as init manager
-VIRTUAL-RUNTIME_init_manager = "systemd"
+INIT_MANAGER = "systemd"
 
 # enable overlayfs in the kernel
 KERNEL_EXTRA_FEATURES:append = " features/overlayfs/overlayfs.scc"
@@ -465,10 +459,8 @@ IMAGE_INSTALL:append = " overlayfs-user"
 
     def get_working_config(self):
         return """
-DISTRO_FEATURES:append = " systemd"
-
 # Use systemd as init manager
-VIRTUAL-RUNTIME_init_manager = "systemd"
+INIT_MANAGER = "systemd"
 
 # enable overlayfs in the kernel
 KERNEL_EXTRA_FEATURES:append = " features/overlayfs/overlayfs.scc"
-- 
2.30.2


