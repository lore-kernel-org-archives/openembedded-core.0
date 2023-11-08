Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A970C4167D
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 22:53:30 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.107063.1699484000337398393
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 14:53:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VcOU3JYT;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6bd73395bceso203677b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 14:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699483999; x=1700088799; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JCAGLWNebGmpwzCbzU32fS/l0qlQQFSzqyJjWHg+j14=;
        b=VcOU3JYTwfuK4dxcealSwPaPdl41uyiiUabLsOMGn/4qBxDJz/SZRSXIyO3PdG8s7A
         zWmKueyAQ2fc4xQIoql9I6lC7VgZOY2pAsSEUp0Vnt7YBaFKUKnVXDGIKDVPV3hMVjfW
         ZBz+tlIizwEMmPsXkJHrcHQF6BgSHv34+cLbYPHvxpec7X87hQm5MA7srjBFkVjqX6CK
         Cvll2JijPLW/QNHvx1UWUvQHZBltwRPujYhP6TO7IvGXTzyfueC0K1QA8+Aph5WUIlom
         QKuszFdQxaQ30BEEJxPVynK3WJ3qWvCR8O9EwFeOjTb0SKeIOeH7vDwYT++6+8qoqTKM
         WpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699483999; x=1700088799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JCAGLWNebGmpwzCbzU32fS/l0qlQQFSzqyJjWHg+j14=;
        b=thSonAsed9Ho4bnXzyGdtSiuUGQWfv2EmB64gahladKB8xWcr6EMK325vuDmtoXNSp
         q73kzT51qOC7tTThXzmcCsBS9mbLNIJ/jsH1LBVBWvLxYeEll5PZHFXGRTwNlxljywat
         llo0vCB97d8Jpj3nj77zoLa5LWFArVUwzQ1Dugp5WZyGY1iWyDiU5FcZHrkB7YwDSyU0
         ROx40XulBgzjwyMvB5gNPiHPhzoJMsRLA3e7KvvRi5aLabhTbJaVT1mo9joLXkn2tmrS
         UK9xwLpVAIuADFeLXmbZuB/8ZHmBlCRP3sHX7hy5VhRwAmwesRHwAfkFnu0rr6RnGg2z
         gz8A==
X-Gm-Message-State: AOJu0Yyob1lAvX0kUNXEBdmVDyXUckjQhXypkzGSNwC54ghTUTH9hqIi
	jHUpi9RC8r5CNsvH5VDUNdkZaMZa2MZRHb17n0TNsQ==
X-Google-Smtp-Source: AGHT+IGUsuInJZ99yXYmMrY2BINN/ra1H4bFw+6fZeTXXsrUX90Tt6uOL5YiWcNNjeOqbSzrWXA9ag==
X-Received: by 2002:a05:6a00:890f:b0:691:27b:15b4 with SMTP id hw15-20020a056a00890f00b00691027b15b4mr4077780pfb.5.1699483998803;
        Wed, 08 Nov 2023 14:53:18 -0800 (PST)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id du4-20020a056a002b4400b006884844dfcdsm9467883pfb.55.2023.11.08.14.53.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 14:53:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/7] xserver-xorg: Fix for CVE-2023-5367 and CVE-2023-5380
Date: Wed,  8 Nov 2023 12:53:02 -1000
Message-Id: <afc30fc07d806c3f0d2192454344995f19e68575.1699483825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699483825.git.steve@sakoman.com>
References: <cover.1699483825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 22:53:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190361

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
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |   2 +
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
index 0000000000..57e2a5abdf
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
+index 4b833d8a3b..e8af924c68 100644
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
+index 93308f9b24..a9926eaeef 100644
+--- a/include/eventstr.h
++++ b/include/eventstr.h
+@@ -335,4 +335,7 @@ union _InternalEvent {
+     GestureEvent gesture_event;
+ };
+ 
++extern void
++LeaveWindow(DeviceIntPtr dev);
++
+ #endif
+diff --git a/mi/mipointer.c b/mi/mipointer.c
+index a638f25d4a..8cf0035140 100644
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
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index 19db7ea434..63932b4e79 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -2,6 +2,8 @@ require xserver-xorg.inc
 
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
+           file://CVE-2023-5367.patch \
+           file://CVE-2023-5380.patch \
            "
 SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
-- 
2.34.1


