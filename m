Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0FACC35FF3
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:13:12 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.31824.1742141589872645833
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gHP5Ymxg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso15235285e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141588; x=1742746388; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=esVxOVUeec2xNh+LfSYf9DB/s1m+nXwSvSX/oIzeMto=;
        b=gHP5YmxgnWRXHataHg7jBP/jzo4hjJSwG9nJY/LGGnN7k9gAbIvQsJA85j1vtpCRN4
         mKLbFol6pg2vbdcLmrTZlXVgt6UI7VledUk344Gd+NND2q1aBbNLAB6E9ZyprvAiBJuR
         v6VvD6qgBkMN4Y6WUGf0dhq4yfUc5fFGN6nfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141588; x=1742746388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=esVxOVUeec2xNh+LfSYf9DB/s1m+nXwSvSX/oIzeMto=;
        b=Ex7d5z5AOEYY1I/7c/a1PfCXFYF2MTYFz2Ct+QdnkjlSXAseY6ThdPenqHboQxO+46
         XRiOc65kUF3uryytQTpxp0p6yLSMp91+sF9utPFqdBDm3Azn/GIJTfraQHnIi63K1nSG
         EQvqJp7aSDnVrP8Gr6ikdAwmLxMN2pnfTAxNzvljv69NgZUzcE0AkjzR5O+BvSMtEztL
         xRgpISRIsvG3Bx8EivbH/DyPWYMlJ1W0UjohNmmM6eUBtJcVuM9ztbi0g6bajQDSI/zF
         dgx74eVuJPZGRby63anhj9L5NmOFNH36Dcq6o/csRYhZ7/gSZwKIO1oXJRdxHaY5lm85
         eWUQ==
X-Gm-Message-State: AOJu0YyqdfksTcGQ4AbydZJThdrV18hY3ZWM8rjd8pUvDrBNkzJB1msA
	LljiBNVpb9fwmRpBCU2F66ahzT4VT32xxJRzV31kAJ0ixzx+apep+/a8m7p+sE7ZtzDv+O/1vX/
	k
X-Gm-Gg: ASbGncucLn2gh6iBOhI/lxxbdlBcZM91leIt7GRfW+BA6RMJn6ep4hNuPc/IhPW6Pdj
	wP1VDmjw3Fb+eD9vCqCdEtA3DJjQgGYpnJ1UmOD53k8EYpIdlrhEQLuOR/eBQUMUlPT9flfwUTj
	LPyQkqIkWMNqWkHiPxYcTCds1AVSTesRazJr4ejuJupKlCzjvrwFpJCdbA7rDjVjcYabQJ2jTy4
	srGD3Jnd7jr/oT9ZSUaqZvMdmMD4FZlXVxEMx7XIlprojaU1aSZDW149iyjdGCBQoRue29ZTM9/
	wNi0St/YfAriCVvfoX3q2iPJwemiR/gcFMSwdWZ9YS6h4+rIrmmp2JR8Bjw1TN92wSwNsQJxcg=
	=
X-Google-Smtp-Source: AGHT+IFxG8qlO0Snd0r3VOzpgsrX33z8VHVL/WR9Vgek8DTLnvA3nB63DLViUKOm2kdOgytHL1Xs7A==
X-Received: by 2002:a05:600c:1c9a:b0:43c:f332:7038 with SMTP id 5b1f17b1804b1-43d1ecd0ec2mr88951655e9.21.1742141587682;
        Sun, 16 Mar 2025 09:13:07 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.13.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:13:06 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 39/43] xtrans: Upgrade 1.5.2 -> 1.6.0
Date: Sun, 16 Mar 2025 16:12:05 +0000
Message-ID: <20250316161209.3629986-39-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:13:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213042

License-Update: Update copyright years

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../xorg-lib/xtrans/multilibfix.patch            | 16 ++++++++++++----
 .../{xtrans_1.5.2.bb => xtrans_1.6.0.bb}         |  4 ++--
 2 files changed, 14 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xtrans_1.5.2.bb => xtrans_1.6.0.bb} (79%)

diff --git a/meta/recipes-graphics/xorg-lib/xtrans/multilibfix.patch b/meta/recipes-graphics/xorg-lib/xtrans/multilibfix.patch
index c513bad20e6..21872fe8fe3 100644
--- a/meta/recipes-graphics/xorg-lib/xtrans/multilibfix.patch
+++ b/meta/recipes-graphics/xorg-lib/xtrans/multilibfix.patch
@@ -1,14 +1,22 @@
+From 721886265be1fa505f55a7797e089d426459339c Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Fri, 29 Jun 2018 08:02:16 +0000
+Subject: [PATCH] xtrans: Fix multilib .pc file conflict
+
 The xtrans.pc file is installed into a non-arch directory yet contains libdir
 which can vary depending on which multilib is configured. The .pc file does
 not require libdir so remove this to fix multilib builds.
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Upstream-Status: Pending
+---
+ xtrans.pc.in | 1 -
+ 1 file changed, 1 deletion(-)
 
-Index: xtrans-1.3.5/xtrans.pc.in
-===================================================================
---- xtrans-1.3.5.orig/xtrans.pc.in
-+++ xtrans-1.3.5/xtrans.pc.in
+diff --git a/xtrans.pc.in b/xtrans.pc.in
+index cf3e44f..7752996 100644
+--- a/xtrans.pc.in
++++ b/xtrans.pc.in
 @@ -1,6 +1,5 @@
  prefix=@prefix@
  exec_prefix=@exec_prefix@
diff --git a/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb b/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb
similarity index 79%
rename from meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb
rename to meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb
index e391bf8a2b5..75ebd5c6151 100644
--- a/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb
+++ b/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb
@@ -10,7 +10,7 @@ except in the X Transport Interface code."
 require xorg-lib-common.inc
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=bc875e1c864f4f62b29f7d8651f627fa"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d6091702432f176651d4bf09e61bbe2d"
 
 SRC_URI += "file://multilibfix.patch"
 
@@ -22,4 +22,4 @@ inherit gettext
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "5c5cbfe34764a9131d048f03c31c19e57fb4c682d67713eab6a65541b4dff86c"
+SRC_URI[sha256sum] = "faafea166bf2451a173d9d593352940ec6404145c5d1da5c213423ce4d359e92"

