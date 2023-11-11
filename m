Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29567C072AB
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 15:03:34 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.53366.1699715007426633164
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Nov 2023 07:03:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Vk8x2665;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1cc3388621cso30567405ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 07:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699715006; x=1700319806; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=21gGbJWd0Lovjp8ezUVuuKPIEtQXFSqOb+Huh5281Tk=;
        b=Vk8x2665qqNx3f2NK5IxUf304rTw72t9NJqT7jxpU1DQv/Z3qfk1Fm6t1L/CjVCDFb
         4JwW0GVPKz0bUydY5Ha9sdetyMzeAXDaYuqPTrBZsO48E/Y1HzsWmj97kRHQi4iar5ll
         OPcrVz8vKZnt48rXoN2RZNDP2w24bPk4IB3WvRwsZBqDrFZ6hKXO8/4F4h45HkUwLfWQ
         ziw8qCJuXOJZ5WvnqIFzw7Wnu3Ram5Z02ctK/oDTLhqh8zKmCdJ95C8Gi3SuWpNYj6j1
         IzwUUK5CC2nA1KfR3vsVyvZAVpOpcmuJWBJwiCP2hNSqBcQAwOtCEvetbqDL8XzD2/kw
         ibRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699715006; x=1700319806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=21gGbJWd0Lovjp8ezUVuuKPIEtQXFSqOb+Huh5281Tk=;
        b=DXrUHVORY42nW2qan95GSpESPse6AgSmfUgTK3ylXPLa/hXiH0nh2pAsG+l1Wptcby
         e10MY2HSLArfpIrWI5suRQo5tpBJWOoq64DonGc57oUbJtHanqyuwDqYT8yr8SoemVwa
         Kd8/2t1acFQdG2STM8PlprURVW116ORtw25zJMIziAgv9OXQoQCNqhH4x6605YuJPBuv
         g/KFNh/peExdJ5nBUUaLCjP4Rl0uDOLTVTIRZamVEgiWydocdYq5bfFBMk+9GcSh2qrB
         mAa+DqR2LqUeaqd3K0ZtvUuxiIQez6tX+EQaUqqDpWpSUFt8e+GSN7UjmsYMzp77jSzr
         oN0g==
X-Gm-Message-State: AOJu0YxpUneqWVwoXUEeJ1S2byqhI5qGQtpKqz55HltGTLQNyUqg9Xwh
	29MLszdeONfaivST/177NFAzHu1NHAH/YHtkxAXBBA==
X-Google-Smtp-Source: AGHT+IHGQh49jox8eGZP79OS7ePcly2tJBgwz/3gcY1YBKfZOchrVUrvzL08VWjmX7cAIptlBZLMOQ==
X-Received: by 2002:a17:902:e810:b0:1cc:2be7:c0f2 with SMTP id u16-20020a170902e81000b001cc2be7c0f2mr8473005plg.13.1699715006205;
        Sat, 11 Nov 2023 07:03:26 -0800 (PST)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y18-20020a1709027c9200b001b53c8659fesm1379200pll.30.2023.11.11.07.03.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 07:03:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/15] xserver-xorg: Fix for CVE-2023-5367 and CVE-2023-5380
Date: Sat, 11 Nov 2023 05:02:57 -1000
Message-Id: <4aa05deec3b2925d458655df7084e7ea2ed3f3ba.1699714834.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699714834.git.steve@sakoman.com>
References: <cover.1699714834.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 15:03:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190423

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.freedesktop.org/xorg/xserver/-/commit/541ab2ecd41d4d8689e71855d93e492bc554719a
&
https://gitlab.freedesktop.org/xorg/xserver/-/commit/564ccf2ce9616620456102727acb8b0256b7bbd7]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xserver-xorg/CVE-2023-5367.patch          |  84 +++++++++++++++
 .../xserver-xorg/CVE-2023-5380.patch          | 102 ++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.14.bb      |   2 +
 3 files changed, 188 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5367.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5380.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5367.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5367.patch
new file mode 100644
index 0000000000..508588481e
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5367.patch
@@ -0,0 +1,84 @@
+From 541ab2ecd41d4d8689e71855d93e492bc554719a Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Tue, 3 Oct 2023 11:53:05 +1000
+Subject: [PATCH] Xi/randr: fix handling of PropModeAppend/Prepend
+
+The handling of appending/prepending properties was incorrect, with at
+least two bugs: the property length was set to the length of the new
+part only, i.e. appending or prepending N elements to a property with P
+existing elements always resulted in the property having N elements
+instead of N + P.
+
+Second, when pre-pending a value to a property, the offset for the old
+values was incorrect, leaving the new property with potentially
+uninitalized values and/or resulting in OOB memory writes.
+For example, prepending a 3 element value to a 5 element property would
+result in this 8 value array:
+  [N, N, N, ?, ?, P, P, P ] P, P
+                            ^OOB write
+
+The XI2 code is a copy/paste of the RandR code, so the bug exists in
+both.
+
+CVE-2023-5367, ZDI-CAN-22153
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/541ab2ecd41d4d8689e71855d93e492bc554719a]
+CVE: CVE-2023-5367
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ Xi/xiproperty.c    | 4 ++--
+ randr/rrproperty.c | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Xi/xiproperty.c b/Xi/xiproperty.c
+index 066ba21fba..d315f04d0e 100644
+--- a/Xi/xiproperty.c
++++ b/Xi/xiproperty.c
+@@ -730,7 +730,7 @@ XIChangeDeviceProperty(DeviceIntPtr dev, Atom property, Atom type,
+                 XIDestroyDeviceProperty(prop);
+             return BadAlloc;
+         }
+-        new_value.size = len;
++        new_value.size = total_len;
+         new_value.type = type;
+         new_value.format = format;
+ 
+@@ -747,7 +747,7 @@ XIChangeDeviceProperty(DeviceIntPtr dev, Atom property, Atom type,
+         case PropModePrepend:
+             new_data = new_value.data;
+             old_data = (void *) (((char *) new_value.data) +
+-                                  (prop_value->size * size_in_bytes));
++                                  (len * size_in_bytes));
+             break;
+         }
+         if (new_data)
+diff --git a/randr/rrproperty.c b/randr/rrproperty.c
+index c2fb9585c6..25469f57b2 100644
+--- a/randr/rrproperty.c
++++ b/randr/rrproperty.c
+@@ -209,7 +209,7 @@ RRChangeOutputProperty(RROutputPtr output, Atom property, Atom type,
+                 RRDestroyOutputProperty(prop);
+             return BadAlloc;
+         }
+-        new_value.size = len;
++        new_value.size = total_len;
+         new_value.type = type;
+         new_value.format = format;
+ 
+@@ -226,7 +226,7 @@ RRChangeOutputProperty(RROutputPtr output, Atom property, Atom type,
+         case PropModePrepend:
+             new_data = new_value.data;
+             old_data = (void *) (((char *) new_value.data) +
+-                                  (prop_value->size * size_in_bytes));
++                                  (len * size_in_bytes));
+             break;
+         }
+         if (new_data)
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5380.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5380.patch
new file mode 100644
index 0000000000..720340d83b
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5380.patch
@@ -0,0 +1,102 @@
+From 564ccf2ce9616620456102727acb8b0256b7bbd7 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Thu, 5 Oct 2023 12:19:45 +1000
+Subject: [PATCH] mi: reset the PointerWindows reference on screen switch
+
+PointerWindows[] keeps a reference to the last window our sprite
+entered - changes are usually handled by CheckMotion().
+
+If we switch between screens via XWarpPointer our
+dev->spriteInfo->sprite->win is set to the new screen's root window.
+If there's another window at the cursor location CheckMotion() will
+trigger the right enter/leave events later. If there is not, it skips
+that process and we never trigger LeaveWindow() - PointerWindows[] for
+the device still refers to the previous window.
+
+If that window is destroyed we have a dangling reference that will
+eventually cause a use-after-free bug when checking the window hierarchy
+later.
+
+To trigger this, we require:
+- two protocol screens
+- XWarpPointer to the other screen's root window
+- XDestroyWindow before entering any other window
+
+This is a niche bug so we hack around it by making sure we reset the
+PointerWindows[] entry so we cannot have a dangling pointer. This
+doesn't handle Enter/Leave events correctly but the previous code didn't
+either.
+
+CVE-2023-5380, ZDI-CAN-21608
+
+This vulnerability was discovered by:
+Sri working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+Reviewed-by: Adam Jackson <ajax@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/564ccf2ce9616620456102727acb8b0256b7bbd7]
+CVE: CVE-2023-5380
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ dix/enterleave.h   |  2 --
+ include/eventstr.h |  3 +++
+ mi/mipointer.c     | 17 +++++++++++++++--
+ 3 files changed, 18 insertions(+), 4 deletions(-)
+
+diff --git a/dix/enterleave.h b/dix/enterleave.h
+index 4b833d8..e8af924 100644
+--- a/dix/enterleave.h
++++ b/dix/enterleave.h
+@@ -58,8 +58,6 @@ extern void DeviceFocusEvent(DeviceIntPtr dev,
+ 
+ extern void EnterWindow(DeviceIntPtr dev, WindowPtr win, int mode);
+ 
+-extern void LeaveWindow(DeviceIntPtr dev);
+-
+ extern void CoreFocusEvent(DeviceIntPtr kbd,
+                            int type, int mode, int detail, WindowPtr pWin);
+ 
+diff --git a/include/eventstr.h b/include/eventstr.h
+index bf3b95f..2bae3b0 100644
+--- a/include/eventstr.h
++++ b/include/eventstr.h
+@@ -296,4 +296,7 @@ union _InternalEvent {
+ #endif
+ };
+ 
++extern void
++LeaveWindow(DeviceIntPtr dev);
++
+ #endif
+diff --git a/mi/mipointer.c b/mi/mipointer.c
+index 75be1ae..b12ae9b 100644
+--- a/mi/mipointer.c
++++ b/mi/mipointer.c
+@@ -397,8 +397,21 @@ miPointerWarpCursor(DeviceIntPtr pDev, ScreenPtr pScreen, int x, int y)
+ #ifdef PANORAMIX
+         && noPanoramiXExtension
+ #endif
+-        )
+-        UpdateSpriteForScreen(pDev, pScreen);
++        ) {
++            DeviceIntPtr master = GetMaster(pDev, MASTER_POINTER);
++            /* Hack for CVE-2023-5380: if we're moving
++             * screens PointerWindows[] keeps referring to the
++             * old window. If that gets destroyed we have a UAF
++             * bug later. Only happens when jumping from a window
++             * to the root window on the other screen.
++             * Enter/Leave events are incorrect for that case but
++             * too niche to fix.
++             */
++            LeaveWindow(pDev);
++            if (master)
++                LeaveWindow(master);
++            UpdateSpriteForScreen(pDev, pScreen);
++    }
+ }
+ 
+ /**
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
index 5c604fa86e..eaff93bd09 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
@@ -16,6 +16,8 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2022-46344.patch \
            file://CVE-2023-0494.patch \
            file://CVE-2023-1393.patch \
+           file://CVE-2023-5367.patch \
+           file://CVE-2023-5380.patch \
 "
 SRC_URI[md5sum] = "453fc86aac8c629b3a5b77e8dcca30bf"
 SRC_URI[sha256sum] = "54b199c9280ff8bf0f73a54a759645bd0eeeda7255d1c99310d5b7595f3ac066"
-- 
2.34.1


