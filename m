Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54DF9E77188
	for <webhook@archiver.kernel.org>; Tue, 31 Dec 2024 21:26:31 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web11.3496.1735680386396787023
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Dec 2024 13:26:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=gcy62yqf;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20241231212624c310c7e8de7e649138-5nxihz@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20241231212624c310c7e8de7e649138
        for <openembedded-core@lists.openembedded.org>;
        Tue, 31 Dec 2024 22:26:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=BuUI651WTIGvDFFlMGgzmaG5ukKBD76Nw0THT8tpmXs=;
 b=gcy62yqfq5XNT/VWptHPvvzZ8shTJIFPiq0iJ3D/35r9MjqPmkyFSIEFtzinx+qVECLcBJ
 mVtu2SYGqNRuTWjqCgo+qX+HyRvQo2PFRuoKopFUKcOM8fPpngEUEqJuTXrqZxGrdCsfnvx9
 KwtFqyyf2wlnGHYYYvxzcxDMtG9eOtTcJ+wBNrN8Gow50EWhBLlMMBgm43Jc55i0253VtvGd
 p+xIR5HjXeMXMJ4Jbn28ZzZy/0LD8bzErJbyyCrOR79Q3bpBV9VaoXCa9b4L5CGln8S1wA3b
 GLylnfq0gR/mLBN8dKFaAaBrnyeUFnB+GkJGjIW4omsZX4/oCEnv3ckg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 5/5] xwayland: patch CVE-2023-5380 CVE-2024-0229
Date: Tue, 31 Dec 2024 22:25:11 +0100
Message-Id: <20241231212511.3649711-6-peter.marko@siemens.com>
In-Reply-To: <20241231212511.3649711-1-peter.marko@siemens.com>
References: <20241231212511.3649711-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Dec 2024 21:26:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209190

From: Peter Marko <peter.marko@siemens.com>

The patches are copied from xserver-xorg recipe.
The CVES are reported for both and patched apply on both.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
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
2.30.2


