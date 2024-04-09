Return-Path: <nayakksanjay@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50A0ECD1284
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 09:50:39 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.132121.1712656235565061915
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 02:50:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bV1gsUou;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: nayakksanjay@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1e455b630acso8611625ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 02:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712656235; x=1713261035; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FC2BS1PxXQn3en69HkTv0aUjotYD3zaTWtoC26kfygc=;
        b=bV1gsUouXVpDLTeMLB+qxVPin37AcAAqD5/XN3uiX602n/usDKwxnPIKk8E2lsUrhK
         ejw7PwvakM1Oi35HOb4Vq9gVivimst0tfBcptKE/zsqeD2wHJR3RmyPA7vUEngpmIzdG
         dhRRmxUgUbtAuu7BidwygPj0esPOkfooM0om19wIrVCsEbPsHhvi4uhaaFM7BQi4F8Et
         8hAGV65xuOt85KGjhxNP+r/FJ6G9ZKhA+O1yOcJu0BV3/5dFLAX2g13eFQN67LzwtdWo
         AeqqO0kmFgkOIWGQO4CO3R7z0e4n976sfhO/xRYYrWu4DWLeY65Paa5p/BWE+kk98eqH
         2s5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712656235; x=1713261035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FC2BS1PxXQn3en69HkTv0aUjotYD3zaTWtoC26kfygc=;
        b=HUuRC4j1mKzoK3G6eE5/9E15iJgBaFq73SDstBGbuW2ZsE3cWOS1L30UDhAAnDZkPL
         NpIG2Usb1jO/CJzgluM7cBw2zm78H9WP1qD8/TwVXmdL4DM0eXqb5+AR1oSfDoESRI1d
         fxtNilN8kjws51tpnqyKxFGyOSeTr0w7V+nOmUvfIxUihstrtoFjPK5LnOYU4cl005+C
         pIspSHPctyv/c8cETORoimllQUzmcBqR2twBU1CkQ0vSmNBf5ZkLGLkcEqzD/q1EuGKu
         tJhPoY9BI6fU4OJ8qpBu0ccSzNuGtBzfApEHLs6lGV4FUcFlvPXqHLQJPuvpXilHOX1S
         zwag==
X-Gm-Message-State: AOJu0YytYwtQ9cLahY54geCJLWFEIJGU+j4mSAzcg+MmZYgyo/4PH96J
	+JBnJ82y6cOcbTHtCbR8qsAXLKw9zZgZlD62Fn+OIB+BPUri3MYRGlpxg5zrXsw=
X-Google-Smtp-Source: AGHT+IGWxvaMX3EtRI0OrkcT4Ddpm7IxmLRcAoPFO0WBWXQSiW6Gc80FznRgimf/pGciOz9T3b7D0g==
X-Received: by 2002:a17:903:228f:b0:1e4:48a6:968b with SMTP id b15-20020a170903228f00b001e448a6968bmr4038194plh.13.1712656234731;
        Tue, 09 Apr 2024 02:50:34 -0700 (PDT)
Received: from ubuntu.. ([122.186.157.254])
        by smtp.gmail.com with ESMTPSA id n13-20020a170903110d00b001e3e0a8b32asm5976960plh.45.2024.04.09.02.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 02:50:34 -0700 (PDT)
From: K Sanjay Nayak <nayakksanjay@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: K Sanjay Nayak <nayakksanjay@gmail.com>
Subject: [PATCH] xorg-xserver : Disabling Screensaver blanking for QEMU images
Date: Tue,  9 Apr 2024 15:20:29 +0530
Message-Id: <20240409095029.4851-1-nayakksanjay@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 09:50:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198060

Fixes [YOCTO #15436]

This fix addresses the issue of Xserver screensaver blanking
being enabled on QEMU images by disabling BlankTime, StandbyTime,
SuspendTime, and OffTime in the Xorg default settings for QEMU images.

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


