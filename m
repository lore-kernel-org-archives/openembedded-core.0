Return-Path: <nayakksanjay@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B9FDC67861
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 08:39:59 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.131892.1712651997251475459
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 01:39:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CZ+KOpO5;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: nayakksanjay@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1e3cf5b171eso26510325ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 01:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712651996; x=1713256796; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2XksLX9KFHZJqK2SMbJ6sfWg5Qlv/yEhz8uJdMJpotU=;
        b=CZ+KOpO5qLE0067xQ0/pMcCEdF/r74aSlGJpL3ozEhnNNdWla+4sGMA43GyIpO6Tgd
         PMMjlUl9ge0rWBArIBFlM899k12TS2nsghdOreCfOPypqGoMzO6sqHH53V3WwyzfGkZr
         sITf5Lmo2AKX5YR9bgTWAC2mPRciAynFNOsgDveWaaEMjWfqOufc9zjNiMFF67KWeEPD
         HKRsxOz/ZPBWFjf3WmTF9vE7Yrf3CazBNJwenhRmSGhpdKQyCVxoHjFuqxIMq3IAfEit
         FbpnmIZtORd6G+8eCj9tAlBWAuh47UQ43hSOchrAvo4kWOgRm+r0y0EwV5WibzvTpEiw
         t4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712651996; x=1713256796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2XksLX9KFHZJqK2SMbJ6sfWg5Qlv/yEhz8uJdMJpotU=;
        b=F1t+02ZAPxiJSkBXB9Sc6Mc6XaclCf+Kzt1cJ2aBAaSTsDKYZgOzSSy5HSl7DYdF7x
         WWwBkbrtHN7kxKAjAH0nXGXChtCLfkrJttBB44oKcfEcaIPpJBfElohTvECoDP35+Jgb
         z6l4DLb+obCvxngqMQqIvVw0UT0oCtJHRCtg0oWngKrgu1+IjHd9mG8n3oWFKbzt/aks
         o0iq1jhsSINLsgocpwoSgVtKE3cFfaQmAh/InCqxjGLs6D6klSzhPK8FKPfx/FhgLVXk
         IfwoKnLvpIVuHExulLqbtLOc7TCbXAxKXr9FEaENpxFApKx2RKehqMzeg38TkquWPbrM
         I+qg==
X-Gm-Message-State: AOJu0YxHMNhX9FaWtG0NdIlwEo61LHKXofzZl249tIRlXLcr6kAPvkYu
	oKuf2SQ6JeuMvsVGF1uKhWVrpn5L3VR+lv4GDDSBjHQSFQtQzUxJaNpvk1on/PI=
X-Google-Smtp-Source: AGHT+IEMydiOJMz+Y/1vPeKEcbMS3bhCFMFH31jBoXSYlUWgU5Uvpn7E1UsKUj1yMH5UKqeAPdzwjQ==
X-Received: by 2002:a17:903:1d2:b0:1e3:cf18:7335 with SMTP id e18-20020a17090301d200b001e3cf187335mr11238509plh.6.1712651996298;
        Tue, 09 Apr 2024 01:39:56 -0700 (PDT)
Received: from ubuntu.. ([122.186.157.254])
        by smtp.gmail.com with ESMTPSA id q12-20020a170902dacc00b001e0fcf995easm8267037plx.202.2024.04.09.01.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 01:39:56 -0700 (PDT)
From: K Sanjay Nayak <nayakksanjay@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: K Sanjay Nayak <nayakksanjay@gmail.com>
Subject: [PATCH] xorg-xserver : Disabled BlankTime, StandbyTime, SuspendTime and OffTime in X default for QEMU images
Date: Tue,  9 Apr 2024 14:09:49 +0530
Message-Id: <20240409083949.3891-1-nayakksanjay@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 08:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198056

Fixes [YOCTO #15436]

This fix addresses the issue of Xserver screensaver blanking being enabled on QEMU images by
disabling BlankTime, StandbyTime, SuspendTime, and OffTime in the Xorg default settings for QEMU images.

Reference : https://www.x.org/archive/X11R6.8.0/doc/xorg.conf.5.html

Reported-by   : Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: K Sanjay Nayak <nayakksanjay@gmail.com>
---
 .../xorg-xserver/xserver-xf86-config/qemuarm/xorg.conf        | 4 ++++
 .../xorg-xserver/xserver-xf86-config/qemuppc/xorg.conf        | 4 ++++
 .../xorg-xserver/xserver-xf86-config/qemush4/xorg.conf        | 4 ++++
 .../xorg-xserver/xserver-xf86-config/qemux86-64/xorg.conf     | 4 ++++
 .../xorg-xserver/xserver-xf86-config/qemux86/xorg.conf        | 4 ++++
 5 files changed, 20 insertions(+)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuarm/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuarm/xorg.conf
index f4cd139e8d..3eb380a0a4 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuarm/xorg.conf
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuarm/xorg.conf
@@ -35,4 +35,8 @@ Section "ServerLayout"
     Identifier    "Default Layout"
     Screen        "Default Screen"
     Option         "AllowEmptyInput" "no"
+    Option        "BlankTime" "0"
+    Option        "StandbyTime" "0"
+    Option        "SuspendTime" "0"
+    Option        "OffTime" "0"
 EndSection
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuppc/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuppc/xorg.conf
index f4cd139e8d..3eb380a0a4 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuppc/xorg.conf
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuppc/xorg.conf
@@ -35,4 +35,8 @@ Section "ServerLayout"
     Identifier    "Default Layout"
     Screen        "Default Screen"
     Option         "AllowEmptyInput" "no"
+    Option        "BlankTime" "0"
+    Option        "StandbyTime" "0"
+    Option        "SuspendTime" "0"
+    Option        "OffTime" "0"
 EndSection
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemush4/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemush4/xorg.conf
index f4cd139e8d..3eb380a0a4 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemush4/xorg.conf
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemush4/xorg.conf
@@ -35,4 +35,8 @@ Section "ServerLayout"
     Identifier    "Default Layout"
     Screen        "Default Screen"
     Option         "AllowEmptyInput" "no"
+    Option        "BlankTime" "0"
+    Option        "StandbyTime" "0"
+    Option        "SuspendTime" "0"
+    Option        "OffTime" "0"
 EndSection
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86-64/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86-64/xorg.conf
index c12d92c201..c01c3331c5 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86-64/xorg.conf
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86-64/xorg.conf
@@ -30,4 +30,8 @@ Section "ServerLayout"
     Identifier    "Default Layout"
     Screen        "Default Screen"
     Option         "AllowEmptyInput" "no"
+    Option        "BlankTime" "0"
+    Option        "StandbyTime" "0"
+    Option        "SuspendTime" "0"
+    Option        "OffTime" "0"
 EndSection
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86/xorg.conf
index c12d92c201..c01c3331c5 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86/xorg.conf
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86/xorg.conf
@@ -30,4 +30,8 @@ Section "ServerLayout"
     Identifier    "Default Layout"
     Screen        "Default Screen"
     Option         "AllowEmptyInput" "no"
+    Option        "BlankTime" "0"
+    Option        "StandbyTime" "0"
+    Option        "SuspendTime" "0"
+    Option        "OffTime" "0"
 EndSection
-- 
2.34.1


