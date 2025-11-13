Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03EDCCD98F2
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 21:47:44 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4371.1763070460664846622
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 13:47:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=20JnoCdx;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29555415c5fso15486465ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 13:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763070460; x=1763675260; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sD36x95qP8m5p7ahqkabrLmteQiJhfbj8Ab5Ystoj/w=;
        b=20JnoCdxhrum3NjEQKLTRqYiBKro7bglpzChZ6wRu3otxVy/O2dYXZLa/07pD1gHFF
         7gqHEbx529BhnRDtXGSacS4ROy/PgxAdTuKaDSUh8uJvCnKmo/0ESkWu5cxbItbyaSdp
         kYKgeBiE2nN02JXManOqlkWvG61/KzdHgWFN8vY7Ek8CjGW5PScb/S1wKP0DwbPTLXPD
         DokR608DJP0janWP4rnvrN2Oe26GrgNzmIfrwNG8YBFfwFyLElsNU4A7M4Sc7xVy6q1P
         e5VdvwOHJjxKwH64CLZg1kmPcPEdjbU76YO3uju9ta1czk7LBOqC4jR0GiLUt36y9FtZ
         U2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763070460; x=1763675260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sD36x95qP8m5p7ahqkabrLmteQiJhfbj8Ab5Ystoj/w=;
        b=W/MMzsjtfjz4WLlhsZMdKASdOXLGy6Gwv36k93O58gdMdJOvNIdh7wP529FTS/bce8
         xn7Rg8q3emFSNC4VMZA335JaSj3w+ZTUlTm64vBnjdQegvJo87+2eMI/pbsgmde/uExG
         aXDBcLi7I4XGmTtnWsaxCg8RyCELtk0SLdxDZWiFXE4BFGH0/frV6XKlZvIrEbHomSlz
         5KWOGhtbuTsuPFs6yWKsnIuVs3e057PFcUeSnGVejjEwbWd8iU0DooKuprW7KGwvkUKM
         VccNHDzHkCb75xtS39NqJ8QrN5mfTBlmbAm0bPYk1mCnKX6wEDpgQ1Pk7HQf37PVk+6p
         fbog==
X-Gm-Message-State: AOJu0YxMF8Om5VJhryvUUNOkRa1TUqXvzQho8wCM+EK+V4yCSxzocrCY
	d8GTgbaVRl0pQNEkZoYML6XaC8QHyOqb37lvklNPRCDxmYSQi6e9WZkMX/QfWz4oMfRAeao1Hzr
	2drQ4
X-Gm-Gg: ASbGncvTa6SQxicM47xlr4Uk17Lsg37bKMVzxPYrvD6Zai6ofp/LFTDDvLPvllnPuxT
	LBY0TWOn7Et+MOuzwMRcB+/fc96x3mOY6hLBbjSzTOVYZrH5uDVh7tVaB0j4VM4mxDrL4EjUPH4
	aJUZ4OWQpDTziyK8iFYyQCxPUNJ8+i4TnUAwG7eZGB2AIWOZjaPUhc6KcbUvR6EOU9PpafNAfKd
	e3fMGdHWGjN8MNFisQtRGNM0DBWnvdztZKyZHnuJmiYPpYKRZm5eHgMV3NegZAVMq3cuD346Kty
	vxXT8C9hJartl7JRg7LiWKML7IbmgagQBKR9cbuSeMGVF31+NINnvdaCeEjtJWc1bcOwXMr8yCo
	92gLxDV4oB1I1Apdfarg7PNKDw66qDbrhrD8IEjaaIgeAASiqPnKh1751Kec4YgtU4g==
X-Google-Smtp-Source: AGHT+IFah1T8hx5Ur4RwqL5JQvZ2fyJlrHJufY7jdembxFuLfDDzdIJoXiWHCstVbeLQGc0yvHMyhg==
X-Received: by 2002:a17:903:2349:b0:298:5abe:4b1 with SMTP id d9443c01a7336-2986a76bc5fmr4826305ad.52.1763070459750;
        Thu, 13 Nov 2025 13:47:39 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:70b:f91f:acd9:f6d9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0d68sm34639815ad.61.2025.11.13.13.47.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 13:47:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/10] xserver-xorg: Fix for CVE-2025-62229
Date: Thu, 13 Nov 2025 13:47:22 -0800
Message-ID: <d1d0955ad41827f9c75ae726e7c725d2f82b6d18.1763070333.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763070333.git.steve@sakoman.com>
References: <cover.1763070333.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 21:47:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226275

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/5a4286b13f631b66c20f5bc8db7b68211dcbd1d0

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xserver-xorg/CVE-2025-62229.patch         | 89 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-62229.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-62229.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-62229.patch
new file mode 100644
index 0000000000..634e8d44f1
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-62229.patch
@@ -0,0 +1,89 @@
+From 5a4286b13f631b66c20f5bc8db7b68211dcbd1d0 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 2 Jul 2025 09:46:22 +0200
+Subject: [PATCH] present: Fix use-after-free in present_create_notifies()
+
+Using the Present extension, if an error occurs while processing and
+adding the notifications after presenting a pixmap, the function
+present_create_notifies() will clean up and remove the notifications
+it added.
+
+However, there are two different code paths that can lead to an error
+creating the notify, one being before the notify is being added to the
+list, and another one after the notify is added.
+
+When the error occurs before it's been added, it removes the elements up
+to the last added element, instead of the actual number of elements
+which were added.
+
+As a result, in case of error, as with an invalid window for example, it
+leaves a dangling pointer to the last element, leading to a use after
+free case later:
+
+ |  Invalid write of size 8
+ |     at 0x5361D5: present_clear_window_notifies (present_notify.c:42)
+ |     by 0x534A56: present_destroy_window (present_screen.c:107)
+ |     by 0x41E441: xwl_destroy_window (xwayland-window.c:1959)
+ |     by 0x4F9EC9: compDestroyWindow (compwindow.c:622)
+ |     by 0x51EAC4: damageDestroyWindow (damage.c:1592)
+ |     by 0x4FDC29: DbeDestroyWindow (dbe.c:1291)
+ |     by 0x4EAC55: FreeWindowResources (window.c:1023)
+ |     by 0x4EAF59: DeleteWindow (window.c:1091)
+ |     by 0x4DE59A: doFreeResource (resource.c:890)
+ |     by 0x4DEFB2: FreeClientResources (resource.c:1156)
+ |     by 0x4A9AFB: CloseDownClient (dispatch.c:3567)
+ |     by 0x5DCC78: ClientReady (connection.c:603)
+ |   Address 0x16126200 is 16 bytes inside a block of size 2,048 free'd
+ |     at 0x4841E43: free (vg_replace_malloc.c:989)
+ |     by 0x5363DD: present_destroy_notifies (present_notify.c:111)
+ |     by 0x53638D: present_create_notifies (present_notify.c:100)
+ |     by 0x5368E9: proc_present_pixmap_common (present_request.c:164)
+ |     by 0x536A7D: proc_present_pixmap (present_request.c:189)
+ |     by 0x536FA9: proc_present_dispatch (present_request.c:337)
+ |     by 0x4A1E4E: Dispatch (dispatch.c:561)
+ |     by 0x4B00F1: dix_main (main.c:284)
+ |     by 0x42879D: main (stubmain.c:34)
+ |   Block was alloc'd at
+ |     at 0x48463F3: calloc (vg_replace_malloc.c:1675)
+ |     by 0x5362A1: present_create_notifies (present_notify.c:81)
+ |     by 0x5368E9: proc_present_pixmap_common (present_request.c:164)
+ |     by 0x536A7D: proc_present_pixmap (present_request.c:189)
+ |     by 0x536FA9: proc_present_dispatch (present_request.c:337)
+ |     by 0x4A1E4E: Dispatch (dispatch.c:561)
+ |     by 0x4B00F1: dix_main (main.c:284)
+ |     by 0x42879D: main (stubmain.c:34)
+
+To fix the issue, count and remove the actual number of notify elements
+added in case of error.
+
+CVE-2025-62229, ZDI-CAN-27238
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2086>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/5a4286b13f631b66c20f5bc8db7b68211dcbd1d0]
+CVE: CVE-2025-62229
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ present/present_notify.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/present/present_notify.c b/present/present_notify.c
+index 7d19d9cfe1..fe84d1f070 100644
+--- a/present/present_notify.c
++++ b/present/present_notify.c
+@@ -92,7 +92,7 @@ present_create_notifies(ClientPtr client, int num_notifies, xPresentNotify *x_no
+         if (status != Success)
+             goto bail;
+ 
+-        added = i;
++        added++;
+     }
+     return Success;
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index a15669a260..1ec5a195f9 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -44,6 +44,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2025-49179.patch \
            file://CVE-2025-49180-1.patch \
            file://CVE-2025-49180-2.patch \
+           file://CVE-2025-62229.patch \
            "
 SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
-- 
2.43.0


