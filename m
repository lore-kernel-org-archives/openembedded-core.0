Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48756E7719A
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 13:31:38 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.20164.1736256695443541104
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 05:31:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=axPYMGdn;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2163dc5155fso224173415ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 05:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736256695; x=1736861495; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MycMAMGYJ93DJks3VlAWm2hExqFnat9AzH/mzta/4Gs=;
        b=axPYMGdnG3UX+Oiclx43wQkVnWZUP5RXsErNk6Je7JcOCs+4eih+Lm0LJ4usqAiZlY
         HTtvhwEnyjv0t0DHz0q6W2bTeMLvff2M45aCD1J0QhncyrPfm1ihBSI/E/uGE5N6OXPX
         OtVVXDtj1QT1a+32YG/hR27T17MCJ3v02kXHslWNoM+EoUZYy3r2M9+UBiBsG4zqVT0y
         X/nBcQJn1H/wtF5y3xjKLSKGcPKc9B5N9aMSN4Fjaq3V7hSDTcOi2Z7DetVLAQO0MTah
         0nbte8thH9MedgNOqiJT0F0HV243pBjnXFR/ICJJfKBVG3/+axPz0vUzyljc4On9R0F3
         z1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736256695; x=1736861495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MycMAMGYJ93DJks3VlAWm2hExqFnat9AzH/mzta/4Gs=;
        b=dhUnKhLQpEMC2pNLJC7WvrkSGjxyF01xVQD3PA8pmcUiMP2y9ZV2KBE2gGZ9L7WPAC
         2lZH0P6M82JPYLdu6ykGVYDOZpDQiZlAR0xfKmzpAZgr1BK+3ulIXJcPQF+1X1zFPjIL
         SvMmAGzl3TPMuStervWt1sigGCxuasgksOEGSscI1gOAiqa5qCDpXCPqRyfIuv4PxJU/
         hPFQErMaA5pExYHzoxOBbwvDlmieWTmS8emSnJ905LRiQzBSGNs/09GIq4RVAm97KqF5
         0nkKpirllO43JmPzrGPbq35hhGmWR0Jj4XIVFv9H16CkFYpkBGNDwDjReiXTYpdqETqD
         VxdQ==
X-Gm-Message-State: AOJu0YzhgL0fFaRDKeMlnNLuUy4qVuT2ugI9PyzYpUBEm2dvOyPiN3qn
	VeTcpFVGjs2XCO8SB7zqY4bGdwjbNJG8Q0S6ktLzrTca5n0kM710PsycI4KOoClO2QIvwrvEuXx
	p
X-Gm-Gg: ASbGnctXelxjzAYHxsnFVfxdQ8VKqvZAIt52zKTDvvW/9tGJpjJvd6cS1rq1KzyyBlU
	hKiNY8sz2+438KBnozjMGjPsgiGy5G9xunaKNAarMZo2dtotYau1kwQj4nqm1glgRIODts6muqJ
	Eeopplqs/Pksmx+n8BViFe6NovCwY4hIlPDfLUOrMl6rEzY6qRvXdXJObrVsz8uJW0/Y2d81EGZ
	MIP7+M3AFFSt1I97LHfqjTbOKnBP18byA2YpVxvFbxt3Q==
X-Google-Smtp-Source: AGHT+IHJbNPs2EhpxR6Egz45cg+LFu/N0AdcLW6ulPcxySBdXDFDfsW5Ump57CApv3kAjR8HJhTJ3Q==
X-Received: by 2002:a05:6a21:108f:b0:1e1:ce4d:a144 with SMTP id adf61e73a8af0-1e5dfb4e030mr86253337637.0.1736256694352;
        Tue, 07 Jan 2025 05:31:34 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbae4sm33340197b3a.96.2025.01.07.05.31.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 05:31:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/13] xwayland: patch CVE-2023-5380 CVE-2024-0229
Date: Tue,  7 Jan 2025 05:31:10 -0800
Message-ID: <cdcb9957a6fe1629dc3230fcdfd09322877d4038.1736256495.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736256495.git.steve@sakoman.com>
References: <cover.1736256495.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 13:31:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209459

From: Peter Marko <peter.marko@siemens.com>

The patches are copied from xserver-xorg recipe.
The CVES are reported for both and patched apply on both.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/xwayland/CVE-2023-5380.patch     | 103 ++++++++
 .../xwayland/xwayland/CVE-2024-0229-1.patch   |  88 +++++++
 .../xwayland/xwayland/CVE-2024-0229-2.patch   | 222 ++++++++++++++++++
 .../xwayland/xwayland/CVE-2024-0229-3.patch   |  42 ++++
 .../xwayland/xwayland/CVE-2024-0229-4.patch   |  46 ++++
 .../xwayland/xwayland_22.1.8.bb               |   5 +
 6 files changed, 506 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2023-5380.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-0229-1.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-0229-2.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-0229-3.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-0229-4.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2023-5380.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2023-5380.patch
new file mode 100644
index 0000000000..ee2aa01b0e
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2023-5380.patch
@@ -0,0 +1,103 @@
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
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
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
diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2024-0229-1.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-0229-1.patch
new file mode 100644
index 0000000000..03ee6978ca
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-0229-1.patch
@@ -0,0 +1,88 @@
+From ece23be888a93b741aa1209d1dbf64636109d6a5 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Mon, 18 Dec 2023 14:27:50 +1000
+Subject: [PATCH] dix: Allocate sufficient xEvents for our DeviceStateNotify
+
+If a device has both a button class and a key class and numButtons is
+zero, we can get an OOB write due to event under-allocation.
+
+This function seems to assume a device has either keys or buttons, not
+both. It has two virtually identical code paths, both of which assume
+they're applying to the first event in the sequence.
+
+A device with both a key and button class triggered a logic bug - only
+one xEvent was allocated but the deviceStateNotify pointer was pushed on
+once per type. So effectively this logic code:
+
+   int count = 1;
+   if (button && nbuttons > 32) count++;
+   if (key && nbuttons > 0) count++;
+   if (key && nkeys > 32) count++; // this is basically always true
+   // count is at 2 for our keys + zero button device
+
+   ev = alloc(count * sizeof(xEvent));
+   FixDeviceStateNotify(ev);
+   if (button)
+     FixDeviceStateNotify(ev++);
+   if (key)
+     FixDeviceStateNotify(ev++);   // santa drops into the wrong chimney here
+
+If the device has more than 3 valuators, the OOB is pushed back - we're
+off by one so it will happen when the last deviceValuator event is
+written instead.
+
+Fix this by allocating the maximum number of events we may allocate.
+Note that the current behavior is not protocol-correct anyway, this
+patch fixes only the allocation issue.
+
+Note that this issue does not trigger if the device has at least one
+button. While the server does not prevent a button class with zero
+buttons, it is very unlikely.
+
+CVE-2024-0229, ZDI-CAN-22678
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/ece23be888a93b741aa1209d1dbf64636109d6a5]
+CVE: CVE-2024-0229
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ dix/enterleave.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/dix/enterleave.c b/dix/enterleave.c
+index ded8679d76..17964b00a4 100644
+--- a/dix/enterleave.c
++++ b/dix/enterleave.c
+@@ -675,7 +675,8 @@ static void
+ DeliverStateNotifyEvent(DeviceIntPtr dev, WindowPtr win)
+ {
+     int evcount = 1;
+-    deviceStateNotify *ev, *sev;
++    deviceStateNotify sev[6 + (MAX_VALUATORS + 2)/3];
++    deviceStateNotify *ev;
+     deviceKeyStateNotify *kev;
+     deviceButtonStateNotify *bev;
+ 
+@@ -714,7 +715,7 @@ DeliverStateNotifyEvent(DeviceIntPtr dev, WindowPtr win)
+         }
+     }
+ 
+-    sev = ev = xallocarray(evcount, sizeof(xEvent));
++    ev = sev;
+     FixDeviceStateNotify(dev, ev, NULL, NULL, NULL, first);
+ 
+     if (b != NULL) {
+@@ -770,7 +771,6 @@ DeliverStateNotifyEvent(DeviceIntPtr dev, WindowPtr win)
+ 
+     DeliverEventsToWindow(dev, win, (xEvent *) sev, evcount,
+                           DeviceStateNotifyMask, NullGrab);
+-    free(sev);
+ }
+ 
+ void
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2024-0229-2.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-0229-2.patch
new file mode 100644
index 0000000000..098b263332
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-0229-2.patch
@@ -0,0 +1,222 @@
+From 219c54b8a3337456ce5270ded6a67bcde53553d5 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Mon, 18 Dec 2023 12:26:20 +1000
+Subject: [PATCH] dix: fix DeviceStateNotify event calculation
+
+The previous code only made sense if one considers buttons and keys to
+be mutually exclusive on a device. That is not necessarily true, causing
+a number of issues.
+
+This function allocates and fills in the number of xEvents we need to
+send the device state down the wire.  This is split across multiple
+32-byte devices including one deviceStateNotify event and optional
+deviceKeyStateNotify, deviceButtonStateNotify and (possibly multiple)
+deviceValuator events.
+
+The previous behavior would instead compose a sequence
+of [state, buttonstate, state, keystate, valuator...]. This is not
+protocol correct, and on top of that made the code extremely convoluted.
+
+Fix this by streamlining: add both button and key into the deviceStateNotify
+and then append the key state and button state, followed by the
+valuators. Finally, the deviceValuator events contain up to 6 valuators
+per event but we only ever sent through 3 at a time. Let's double that
+troughput.
+
+CVE-2024-0229, ZDI-CAN-22678
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/219c54b8a3337456ce5270ded6a67bcde53553d5]
+CVE: CVE-2024-0229
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ dix/enterleave.c | 121 ++++++++++++++++++++---------------------------
+ 1 file changed, 52 insertions(+), 69 deletions(-)
+
+diff --git a/dix/enterleave.c b/dix/enterleave.c
+index 17964b00a4..7b7ba1098b 100644
+--- a/dix/enterleave.c
++++ b/dix/enterleave.c
+@@ -615,9 +615,15 @@ FixDeviceValuator(DeviceIntPtr dev, deviceValuator * ev, ValuatorClassPtr v,
+ 
+     ev->type = DeviceValuator;
+     ev->deviceid = dev->id;
+-    ev->num_valuators = nval < 3 ? nval : 3;
++    ev->num_valuators = nval < 6 ? nval : 6;
+     ev->first_valuator = first;
+     switch (ev->num_valuators) {
++    case 6:
++        ev->valuator2 = v->axisVal[first + 5];
++    case 5:
++        ev->valuator2 = v->axisVal[first + 4];
++    case 4:
++        ev->valuator2 = v->axisVal[first + 3];
+     case 3:
+         ev->valuator2 = v->axisVal[first + 2];
+     case 2:
+@@ -626,7 +632,6 @@ FixDeviceValuator(DeviceIntPtr dev, deviceValuator * ev, ValuatorClassPtr v,
+         ev->valuator0 = v->axisVal[first];
+         break;
+     }
+-    first += ev->num_valuators;
+ }
+ 
+ static void
+@@ -646,7 +651,7 @@ FixDeviceStateNotify(DeviceIntPtr dev, deviceStateNotify * ev, KeyClassPtr k,
+         ev->num_buttons = b->numButtons;
+         memcpy((char *) ev->buttons, (char *) b->down, 4);
+     }
+-    else if (k) {
++    if (k) {
+         ev->classes_reported |= (1 << KeyClass);
+         ev->num_keys = k->xkbInfo->desc->max_key_code -
+             k->xkbInfo->desc->min_key_code;
+@@ -670,15 +675,26 @@ FixDeviceStateNotify(DeviceIntPtr dev, deviceStateNotify * ev, KeyClassPtr k,
+     }
+ }
+ 
+-
++/**
++ * The device state notify event is split across multiple 32-byte events.
++ * The first one contains the first 32 button state bits, the first 32
++ * key state bits, and the first 3 valuator values.
++ *
++ * If a device has more than that, the server sends out:
++ * - one deviceButtonStateNotify for buttons 32 and above
++ * - one deviceKeyStateNotify for keys 32 and above
++ * - one deviceValuator event per 6 valuators above valuator 4
++ *
++ * All events but the last one have the deviceid binary ORed with MORE_EVENTS,
++ */
+ static void
+ DeliverStateNotifyEvent(DeviceIntPtr dev, WindowPtr win)
+ {
++    /* deviceStateNotify, deviceKeyStateNotify, deviceButtonStateNotify
++     * and one deviceValuator for each 6 valuators */
++    deviceStateNotify sev[3 + (MAX_VALUATORS + 6)/6];
+     int evcount = 1;
+-    deviceStateNotify sev[6 + (MAX_VALUATORS + 2)/3];
+-    deviceStateNotify *ev;
+-    deviceKeyStateNotify *kev;
+-    deviceButtonStateNotify *bev;
++    deviceStateNotify *ev = sev;
+ 
+     KeyClassPtr k;
+     ButtonClassPtr b;
+@@ -691,82 +707,49 @@ DeliverStateNotifyEvent(DeviceIntPtr dev, WindowPtr win)
+ 
+     if ((b = dev->button) != NULL) {
+         nbuttons = b->numButtons;
+-        if (nbuttons > 32)
++        if (nbuttons > 32) /* first 32 are encoded in deviceStateNotify */
+             evcount++;
+     }
+     if ((k = dev->key) != NULL) {
+         nkeys = k->xkbInfo->desc->max_key_code - k->xkbInfo->desc->min_key_code;
+-        if (nkeys > 32)
++        if (nkeys > 32) /* first 32 are encoded in deviceStateNotify */
+             evcount++;
+-        if (nbuttons > 0) {
+-            evcount++;
+-        }
+     }
+     if ((v = dev->valuator) != NULL) {
+         nval = v->numAxes;
+-
+-        if (nval > 3)
+-            evcount++;
+-        if (nval > 6) {
+-            if (!(k && b))
+-                evcount++;
+-            if (nval > 9)
+-                evcount += ((nval - 7) / 3);
+-        }
++        /* first three are encoded in deviceStateNotify, then
++         * it's 6 per deviceValuator event */
++        evcount += ((nval - 3) + 6)/6;
+     }
+ 
+-    ev = sev;
+-    FixDeviceStateNotify(dev, ev, NULL, NULL, NULL, first);
+-
+-    if (b != NULL) {
+-        FixDeviceStateNotify(dev, ev++, NULL, b, v, first);
+-        first += 3;
+-        nval -= 3;
+-        if (nbuttons > 32) {
+-            (ev - 1)->deviceid |= MORE_EVENTS;
+-            bev = (deviceButtonStateNotify *) ev++;
+-            bev->type = DeviceButtonStateNotify;
+-            bev->deviceid = dev->id;
+-            memcpy((char *) &bev->buttons[4], (char *) &b->down[4],
+-                   DOWN_LENGTH - 4);
+-        }
+-        if (nval > 0) {
+-            (ev - 1)->deviceid |= MORE_EVENTS;
+-            FixDeviceValuator(dev, (deviceValuator *) ev++, v, first);
+-            first += 3;
+-            nval -= 3;
+-        }
++    BUG_RETURN(evcount <= ARRAY_SIZE(sev));
++
++    FixDeviceStateNotify(dev, ev, k, b, v, first);
++
++    if (b != NULL && nbuttons > 32) {
++        deviceButtonStateNotify *bev = (deviceButtonStateNotify *) ++ev;
++        (ev - 1)->deviceid |= MORE_EVENTS;
++        bev->type = DeviceButtonStateNotify;
++        bev->deviceid = dev->id;
++        memcpy((char *) &bev->buttons[4], (char *) &b->down[4],
++               DOWN_LENGTH - 4);
+     }
+ 
+-    if (k != NULL) {
+-        FixDeviceStateNotify(dev, ev++, k, NULL, v, first);
+-        first += 3;
+-        nval -= 3;
+-        if (nkeys > 32) {
+-            (ev - 1)->deviceid |= MORE_EVENTS;
+-            kev = (deviceKeyStateNotify *) ev++;
+-            kev->type = DeviceKeyStateNotify;
+-            kev->deviceid = dev->id;
+-            memmove((char *) &kev->keys[0], (char *) &k->down[4], 28);
+-        }
+-        if (nval > 0) {
+-            (ev - 1)->deviceid |= MORE_EVENTS;
+-            FixDeviceValuator(dev, (deviceValuator *) ev++, v, first);
+-            first += 3;
+-            nval -= 3;
+-        }
++    if (k != NULL && nkeys > 32) {
++        deviceKeyStateNotify *kev = (deviceKeyStateNotify *) ++ev;
++        (ev - 1)->deviceid |= MORE_EVENTS;
++        kev->type = DeviceKeyStateNotify;
++        kev->deviceid = dev->id;
++        memmove((char *) &kev->keys[0], (char *) &k->down[4], 28);
+     }
+ 
++    first = 3;
++    nval -= 3;
+     while (nval > 0) {
+-        FixDeviceStateNotify(dev, ev++, NULL, NULL, v, first);
+-        first += 3;
+-        nval -= 3;
+-        if (nval > 0) {
+-            (ev - 1)->deviceid |= MORE_EVENTS;
+-            FixDeviceValuator(dev, (deviceValuator *) ev++, v, first);
+-            first += 3;
+-            nval -= 3;
+-        }
++        ev->deviceid |= MORE_EVENTS;
++        FixDeviceValuator(dev, (deviceValuator *) ++ev, v, first);
++        first += 6;
++        nval -= 6;
+     }
+ 
+     DeliverEventsToWindow(dev, win, (xEvent *) sev, evcount,
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2024-0229-3.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-0229-3.patch
new file mode 100644
index 0000000000..915da00c6f
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-0229-3.patch
@@ -0,0 +1,42 @@
+From df3c65706eb169d5938df0052059f3e0d5981b74 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Thu, 21 Dec 2023 13:48:10 +1000
+Subject: [PATCH] Xi: when creating a new ButtonClass, set the number of
+ buttons
+
+There's a racy sequence where a master device may copy the button class
+from the slave, without ever initializing numButtons. This leads to a
+device with zero buttons but a button class which is invalid.
+
+Let's copy the numButtons value from the source - by definition if we
+don't have a button class yet we do not have any other slave devices
+with more than this number of buttons anyway.
+
+CVE-2024-0229, ZDI-CAN-22678
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/df3c65706eb169d5938df0052059f3e0d5981b74]
+CVE: CVE-2024-0229
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ Xi/exevents.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Xi/exevents.c b/Xi/exevents.c
+index 54ea11a938..e161714682 100644
+--- a/Xi/exevents.c
++++ b/Xi/exevents.c
+@@ -605,6 +605,7 @@ DeepCopyPointerClasses(DeviceIntPtr from, DeviceIntPtr to)
+                 to->button = calloc(1, sizeof(ButtonClassRec));
+                 if (!to->button)
+                     FatalError("[Xi] no memory for class shift.\n");
++                to->button->numButtons = from->button->numButtons;
+             }
+             else
+                 classes->button = NULL;
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2024-0229-4.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-0229-4.patch
new file mode 100644
index 0000000000..35a853ad6f
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-0229-4.patch
@@ -0,0 +1,46 @@
+From 37539cb0bfe4ed96d4499bf371e6b1a474a740fe Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Thu, 21 Dec 2023 14:10:11 +1000
+Subject: [PATCH] Xi: require a pointer and keyboard device for
+ XIAttachToMaster
+
+If we remove a master device and specify which other master devices
+attached slaves should be returned to, enforce that those two are
+indeeed a pointer and a keyboard.
+
+Otherwise we can try to attach the keyboards to pointers and vice versa,
+leading to possible crashes later.
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/37539cb0bfe4ed96d4499bf371e6b1a474a740fe]
+CVE: CVE-2024-0229
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ Xi/xichangehierarchy.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Xi/xichangehierarchy.c b/Xi/xichangehierarchy.c
+index 504defe566..d2d985848d 100644
+--- a/Xi/xichangehierarchy.c
++++ b/Xi/xichangehierarchy.c
+@@ -270,7 +270,7 @@ remove_master(ClientPtr client, xXIRemoveMasterInfo * r, int flags[MAXDEVICES])
+         if (rc != Success)
+             goto unwind;
+ 
+-        if (!IsMaster(newptr)) {
++        if (!IsMaster(newptr) || !IsPointerDevice(newptr)) {
+             client->errorValue = r->return_pointer;
+             rc = BadDevice;
+             goto unwind;
+@@ -281,7 +281,7 @@ remove_master(ClientPtr client, xXIRemoveMasterInfo * r, int flags[MAXDEVICES])
+         if (rc != Success)
+             goto unwind;
+ 
+-        if (!IsMaster(newkeybd)) {
++        if (!IsMaster(newkeybd) || !IsKeyboardDevice(newkeybd)) {
+             client->errorValue = r->return_keyboard;
+             rc = BadDevice;
+             goto unwind;
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index 133c65fbc3..f639088b25 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -16,6 +16,11 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2023-6816.patch \
            file://CVE-2024-0408.patch \
            file://CVE-2024-0409.patch \
+           file://CVE-2023-5380.patch \
+           file://CVE-2024-0229-1.patch \
+           file://CVE-2024-0229-2.patch \
+           file://CVE-2024-0229-3.patch \
+           file://CVE-2024-0229-4.patch \
 "
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
-- 
2.43.0


