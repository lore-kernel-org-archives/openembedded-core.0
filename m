Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A4CC4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 18:36:05 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.130519.1712648079878055137
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:34:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K8y8chUO;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: nayakksanjay@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6ecf8ebff50so3192091b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 00:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712648079; x=1713252879; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2XksLX9KFHZJqK2SMbJ6sfWg5Qlv/yEhz8uJdMJpotU=;
        b=K8y8chUOWu7FUoymM0mtP1fobr/5htEG0M+sJXzhmPtMpsQft/y6hFjf6T3RrR2hqd
         Crx1cDw4K+znwYphCrtem5gC1RAZP1ogZ/8UGHw1mbDBA0yv57PGSRwJOXgvfJQDwB2O
         QnECpXgyZgI3e+B3Z64jMGDjJlfkAB4Tj0OkSF+dL0WiZjlCHm4bZCYvq/ZQgfJk99lJ
         OyZv/DdIcY30m04Rx62jpHz1hmKzkXYDKI2zWB4xKzK13veBk/8f/raIG+64x341PWSx
         ybHOL+BKsqN4RgdZjYQ/eEHO6uRhpR+NLViOZPt8NBWwOc5+IN4JsDhlrdh4AksnPT5f
         cvqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712648079; x=1713252879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2XksLX9KFHZJqK2SMbJ6sfWg5Qlv/yEhz8uJdMJpotU=;
        b=ucfU6tE1rBGLUrQzd2zGybgZF4DkvvTF+fkuW6RXALltOGiD3/IoRkrTusYFAmU61W
         E7MaltL112rXceO7wvuXlEFnmeB0nzVmyDX9iFsyTQ8wWJkn8UCewRGhz5Gu2tlIALkV
         ID/AVCn0EhKMYmESY2vHglchEiOPhGWdnUmiWWo16ecEpcGv0xSR+QRmtOYGq2CqADvM
         QOwnYkaUejdjM2MXAYJe+h/iN/zQP0ctoKx3ki0bTZIg7Vzn++a6Mr5LXrjioiSsJMyh
         7T98TAWZG/QZZYoWAamb8I/img8+76VxnGKGLTjB1Igi5mDf8mZRomtbKlcqN2kNBVgX
         EOhA==
X-Gm-Message-State: AOJu0YwyUHgQFSL/1oCZWIIIwwPBCmU1HVyi6eI5LFXopub27K6lMHQv
	ihx0Ztm1sUAQMv1QYViY8I/gOnTapluY/Nz7dKSuvOGxNHL+lZSJ//nX2LrJplY=
X-Google-Smtp-Source: AGHT+IEjpHihp5YJAUovRKfZsAQCVyR3hnAwoF4FMB5gK04n3uBZIDhS2/hAt1jsZIuHMaNeuFrVCg==
X-Received: by 2002:a05:6a00:189d:b0:6ea:c767:4699 with SMTP id x29-20020a056a00189d00b006eac7674699mr2721027pfh.13.1712648078972;
        Tue, 09 Apr 2024 00:34:38 -0700 (PDT)
Received: from ubuntu.. ([122.186.157.254])
        by smtp.gmail.com with ESMTPSA id r3-20020aa78443000000b006e647059cccsm7739040pfn.33.2024.04.09.00.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 00:34:38 -0700 (PDT)
From: nayakksanjay@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: K Sanjay Nayak <nayakksanjay@gmail.com>
Subject: [PATCH] xorg-xserver : Disabled BlankTime, StandbyTime, SuspendTime and OffTime in X default for QEMU images
Date: Tue,  9 Apr 2024 13:04:33 +0530
Message-Id: <20240409073433.15660-1-nayakksanjay@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 18:36:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198184

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


