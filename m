Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 529A0CF58F9
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 20:42:41 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17210.1763584947507586515
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 12:42:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HjAjXAbg;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-297e982506fso2255535ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 12:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763584947; x=1764189747; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B0RPyu6MjkbsiOmby6gUX+y357/fU/tyYdWpbYHVa3Y=;
        b=HjAjXAbg2Gy6344kqkLVC/zUNJnX5zqAHZbUAQDb1VeyRK5qObRQy/s7uegs7v45nP
         vuhRRDow3Kw+L8AT8jL65S3yXU0jul39peuYE2TNLhiBg2a+qEx9QPnLJgy5UTzoPUyt
         0uIv1WwYjA0fLjnxrlJTb3QW2WZaIYs4IdlfOctyLqwIBv4O81cHz+u0HSCSN7fYuS5u
         uHEgm1dpn5tzTedh82OieqeuCjxoKSxfnqqkdVnU8OQ+uFbJC9IgN9phQK5fGjqHs+8f
         LeqLhZeJb3UaAjtzoydW5zhEV6ZcdtWOYNVjCHeZrjtEsMVKpOGOIKo0QoKdnu7/rYLW
         syaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763584947; x=1764189747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B0RPyu6MjkbsiOmby6gUX+y357/fU/tyYdWpbYHVa3Y=;
        b=rgex5zZxfZ4rwM+VJCUik6QRnwunsHTZiRG8QbUEST384tYlHdSSwLQYQnPbYmNNIf
         LrLvpE8va9Ov2ARAoWPxpxVAjy8Ey8OawZ3sc2b0LzBX6t5WLKQakHp7WiWzLmlh6bQQ
         OKAeWoPG/uWyDgHyOkEZf0ogGkJJjy5kP5IakuaAOx/4IrnFzs6GapV/zcQXSG4HzHM8
         LCnTUn+ed/4h5yBGKhSJRh8uqhZ/IXhoIVPymYyE9KO8XtFi6NwLZFp3EBr0QKADNeBI
         mXhDS6A9T6eIPY5uPGGFhYySGvyGxq39iJPvefFg8vkI01XfGJeQFfmerxNJ7VVI7uEv
         ZZCg==
X-Gm-Message-State: AOJu0Yz8MXoOJGzZ3SzW6TgBFq2IPbbJxMofd0DSAM5ZOWoeCNINBAK2
	uas5dcBkhxZBvRA/NPA/kcdGF7yx5jlhiZ6b+2plTET5OBI4qu3yl3M2Zg5IdG3gNshCZtwbbPL
	XyLVG
X-Gm-Gg: ASbGnctUGlZowc829VxlKqNpYkNNe+Etm4elpB2Ai3YZYBXM1VFKYDB5s/IiZV5acuF
	9orE8lN2IybXD72ExW1SsF38+sGbmyC9fN/rw4UMB6lvp2G3pmqrJWRKP5V8/Rr85EqvVPpNLeR
	yPzGCIlPXv7nXMONAMPwGEv7lVs5pVt+U+rGExBb87srxq+jEbSM455M/03mruVMYzZpkkwLxWG
	j0cAlhGCit7S5h9JSSB6XLEnHhq6hgiKxzxGqBh+cIR65yjJtw0T2+/S73/4rFbF7PuNBep4kLZ
	VWJPmMd1Xes3g9/ke/P6evbfqw8GuBCGP+4VUGkjlt5taO60ZD84VdYLYNRGGrziYgThxINR3kn
	hIEjSw77Hq+Yo2/yYTUlFIenaSe9z/1bEXS3+SwUCbUrR3zkWqJ2yW23cxnQZRU6fuweWoADUpM
	e1xA==
X-Google-Smtp-Source: AGHT+IEYfJCLfnXS7gJXpv4RAiVHkNILjJtJh9jTUqSiclANyUis+ClQ1JIqw2br6/HiHQ878YwsGg==
X-Received: by 2002:a17:903:40c5:b0:295:6d30:e263 with SMTP id d9443c01a7336-29b5cd904edmr2511545ad.40.1763584946686;
        Wed, 19 Nov 2025 12:42:26 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:95e8:2651:d6f9:404e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ecf7d5adsm269866b3a.11.2025.11.19.12.42.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 12:42:26 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/7] xwayland: Fix for CVE-2025-62229
Date: Wed, 19 Nov 2025 12:42:11 -0800
Message-ID: <5c6a07f215e00392b1831ed89ac0f8180823e124.1763584791.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763584791.git.steve@sakoman.com>
References: <cover.1763584791.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 20:42:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226593

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/5a4286b13f631b66c20f5bc8db7b68211dcbd1d0

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/xwayland/CVE-2025-62229.patch    | 89 +++++++++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-62229.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62229.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62229.patch
new file mode 100644
index 0000000000..634e8d44f1
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62229.patch
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
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index 73f5a05ce7..ba0ed6048e 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -50,6 +50,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-49178.patch \
            file://CVE-2025-49179.patch \
            file://CVE-2025-49180.patch \
+           file://CVE-2025-62229.patch \
 "
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
-- 
2.43.0


