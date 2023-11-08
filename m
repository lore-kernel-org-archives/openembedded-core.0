Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE702C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 03:14:33 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.6265.1699413268645976623
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 19:14:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=R3JJEo6o;
 spf=pass (domain: mvista.com, ip: 209.85.214.173, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1cc921a4632so53808085ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 19:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1699413267; x=1700018067; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aBQGISCpSy3IjAdYmTV8/PAQQuBH/65cvJmEF99a02o=;
        b=R3JJEo6oSLXnp7ZUtAWrB3C1/lLKKtq7qVsFbNUJX8pVYJbaGKAjTdZ+rfkXTWDTxQ
         E7eVozdgFBz6gVQ39Tw7+frBFW3vQ91EOnuExMKXsPoq+i3OudleuPMgaGqejHlKKuf6
         /kdRZLPnX/EFGm5SeFpS8Zj2yTZUId6NZxOEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699413267; x=1700018067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aBQGISCpSy3IjAdYmTV8/PAQQuBH/65cvJmEF99a02o=;
        b=C5oLv+nD61P/56wf0tZ67IrJJ1LWTm3DQq34YIThOGLCkcBPM+p5/3jNHAwIEWik4N
         yOKYU9BNi5r+WTilTy224JvkJoNcXq5wxLKEF4wWUz6YvMxfZ3pLUnfAk/Ahoz6/eypD
         hcKRNjZ6tnx68/HsxMa5PIpGfebDzdfZf/bmq5N1+LPd8C9Ir1piZdmXg2Ypxd19zX0+
         O8p147SonSuWgHCiRDvPE8AV2c+PA+yHbc+6SCmwxMIDJe6LnvRyoFnXLP4pDvc1SWb4
         dxHfRAhBpGrWV0dCQHc4u3J8hpnW954ZrBZpFkV2CojJ/WI+jyEFGSCIgpvYG8JELSo7
         vkmQ==
X-Gm-Message-State: AOJu0Yxym3BimFbNDeIR/iienn8gsyCJu6WPjzJl22oxqk8DpmnUpev3
	j8/kijMWywV0CjePYIAJp6w23U2X2+eN4kmFOSU=
X-Google-Smtp-Source: AGHT+IH3HwNC3V9a5mKaoi6yTJwO5ENiiZ++haOWz4Zg8IT1Y/OJ+4MMDIQWlUyjBoeUPMktx3O69Q==
X-Received: by 2002:a17:903:2cf:b0:1c9:dfb8:a5a0 with SMTP id s15-20020a17090302cf00b001c9dfb8a5a0mr1125133plk.10.1699413267013;
        Tue, 07 Nov 2023 19:14:27 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.37.147.93])
        by smtp.gmail.com with ESMTPSA id e8-20020a170902744800b001cc50f67fbasm518175plt.281.2023.11.07.19.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 19:14:26 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH v2] xserver-xorg: Fix for CVE-2023-5367 and CVE-2023-5380
Date: Wed,  8 Nov 2023 08:42:11 +0530
Message-Id: <20231108031211.12669-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 03:14:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190302

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.freedesktop.org/xorg/xserver/-/commit/541ab2ecd41d4d8689e71855d93e492bc554719a
&
https://gitlab.freedesktop.org/xorg/xserver/-/commit/564ccf2ce9616620456102727acb8b0256b7bbd7]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.25.1


