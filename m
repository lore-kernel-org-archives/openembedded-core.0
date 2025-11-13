Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C44CD4F52
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 08:07:56 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18874.1763021270501360498
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 00:07:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=JcQfEfvT;
 spf=pass (domain: mvista.com, ip: 209.85.215.179, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b99bfb451e5so341363a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 00:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1763021269; x=1763626069; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s09TNzoL7LSbFBNksTXOg2zH8LbZ54sJ0F8zEiTHrj4=;
        b=JcQfEfvTQ/xIHfgEIB0fdBh1Lkks0JQuJFYEarQlJxA4zc0hfu3Nd7qZ319csq8bsg
         yZVDPPlu4VgK1elJlxD3742Dj/sfnMxEG3a4HPSdqYGpkWk/TRa9t8OnWLYVtTYm6cVN
         VUx+zuQHKGkEM5Byy33UI13lxV4LMzpafrInA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763021269; x=1763626069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s09TNzoL7LSbFBNksTXOg2zH8LbZ54sJ0F8zEiTHrj4=;
        b=F4HqiLTE14o6IXzR7Y8wwVW2LNtCHAj2P8o4q0PNIU+1hGHHlWElaal/AIJA1jhr01
         7RwUvraK6pwUoggFsBTn144AJ9JhYDiKJs4v86aefLudn0daf407Q9ikh2iDEmK7srtR
         9ZhcXjDF8CH4wy/8t5x8AAiLkjs6t3rJ7ObtIsUuc6DW0bQh86VAb2gchS4gRrDfrt8a
         AJ4w3dBYPIsOfZLtuSm8fVGVli2uqYfz4VzpFSx1Iluw9gW9a2hpQQdjm/Vdz/hZ6wbh
         rz+OohMt6AH9PaWRH6jXttraUGzSDW6bYHof3zSFFiB478RSqoCtz6JUvXN0qf8eFx7R
         U/UQ==
X-Gm-Message-State: AOJu0Yw3YnhitphfCq80jHeuGTxzt8QiII/FN4UiKL0Lgio1Q/mjt8AT
	Lcj1HIaGVgvjzDCKgFHGNsvFv1q0s1kf1gbzmLdxoVofUjaT+2PLVKWByOtezTeHk1oyXH8plk9
	XWRzu
X-Gm-Gg: ASbGnct7BYt7ueA+afhFWpspNNI1lxwUNceG/JT4KnutSYSUd7eaTLnAPVRYOdbGKOI
	IjYj+mPDdQnDUJhNU59qb4D0KXKnwoB5yXLzmYwFgEzXjxYBAgqWum4yDC08nW7IklQ/mvmeTP7
	RTbl0FnwRmfU5ZUYPiizj298Drq7Lzavoc3BTT8Hx/466kC+yrqr/Y7bkOQ5hIdxPXcgIsEmuHk
	zf5h9fNd+NYdtcDPETfrJzATYUxHbyJbgq4IF4s3rJzFjcWdddCemJ2kw1SPCihnjwMnci/MmTh
	7m2sc2lk8izk2qNzxyBSVIy4bH1Aq+ViEEjnrk/mHRUUaX6GDQkFwT4WywJEwuMTNOQXZomFRac
	UVgmDNbjHZ9YOW/RDZG4hau0bS4BaOCrV4g7UqnRLUnNvdRiJafK5cD0+lykXxy76Iav7xMfQir
	4MW51P0Xfdv1wm
X-Google-Smtp-Source: AGHT+IGN7jANbHj/yrUrj4nTrjV6Ydtwi71TyYb6KMM3YPUHaVRJt+OIIx3v5A3My/EmXdjfwwTmlA==
X-Received: by 2002:a17:902:cccf:b0:297:f8d9:aad7 with SMTP id d9443c01a7336-2984ede5755mr72385575ad.50.1763021269295;
        Thu, 13 Nov 2025 00:07:49 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:8fcc:9fc0:90f5:815:6543:22e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2568c1sm15950635ad.47.2025.11.13.00.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 00:07:48 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 1/3] xserver-xorg: Fix for CVE-2025-62229
Date: Thu, 13 Nov 2025 13:37:38 +0530
Message-Id: <20251113080740.2285064-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 08:07:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226228

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
2.25.1


