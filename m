Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BFEBC47DDB
	for <webhook@archiver.kernel.org>; Sun, 21 Jan 2024 18:58:15 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.54149.1705863492329885648
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jan 2024 10:58:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WZyOxxwf;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6dbb26ec1deso2643066b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Jan 2024 10:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1705863491; x=1706468291; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/zhi6EvUHuzQEgjWF+vASCg53RcE8R5erR5bkKaxsp4=;
        b=WZyOxxwfdN5ko0YgJzykNO2Wzkf7jFmfn5UsUh2YoRTfuFUfHDTtAoA9MuPHSt20yL
         wg0bJ+1ncOoPq4Rx+zeYMUY1cceQYabmCMPvV0t0WfKFLtMPLfvOaDWz+7GdkRpNHQTh
         y5zdMw2KKym2FYm8CPXR15RQcjNmk1SMWc7XgGmGp0hoZ4xekMo/yCMtWeHvur7dAytJ
         0BooL5kjXSKktnElk9Xw3QsGJ/QMChcDmOg2wzz8t+NoNou0K4tA0LkZMJk47eeplCNM
         6iAyH6UlCCl4AQCQ4VR+EVdoXZhiWex7hFGks3tynP1Wzvyd4BfOmCoL/+8hZyXK3QY9
         aifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705863491; x=1706468291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/zhi6EvUHuzQEgjWF+vASCg53RcE8R5erR5bkKaxsp4=;
        b=nw5eyK/2Xt/RLsh1w/BTmGN6PFXFvMbRSeXesKvYXkFG8gTCXZq3/iaJvLdknrkkyT
         BC/Hew7Hao3SYtV+wGA8zlahgEkT+lVpJMnUmdqofkpHyMM6gyXZoMsaQy0b1JEHDm0I
         8MzBqfCSekq47iRy1Gv5Mas5MpwPMSXwCUHa8Y1WagU4JAGWMielzW6SzLUZSsqA75hT
         595Jnl73U2l7VoAqkuwE9jVEAHfJdY0Mnzqse8ZQg72/i8Gmcp6NJwJU5bCl4kLL2t4s
         cAPW+sO9SQVdpe3Ab52y9+WN8Ho1xzzm91K8/HzdsYCGyYoSc0bTaZgBFXFjSrQhGP+F
         K1EQ==
X-Gm-Message-State: AOJu0Yw0dz4bdHObh71dLLTXybaqoAJsAyT5+8QeuNF4arNTu9hZufBk
	NI91TyAKoyN2SYUBx4sCkatpkIbnaFoqWRkpGbI5xstz06qPHj8VYSjjyFOFSTligWcEq0eLWT+
	bN9gOJg==
X-Google-Smtp-Source: AGHT+IHJvVnGHWbCVjdYWxTtyEmHnjTNDP7Bm5dploXKVkBBIU1pQHwE6Iy/zwkTNMGl6ELDYbHbxA==
X-Received: by 2002:a05:6a00:290c:b0:6d9:b320:94c9 with SMTP id cg12-20020a056a00290c00b006d9b32094c9mr4814564pfb.33.1705863490620;
        Sun, 21 Jan 2024 10:58:10 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id t187-20020a6281c4000000b006d99125b114sm8675277pfd.65.2024.01.21.10.58.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jan 2024 10:58:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/6] xserver-xorg: Multiple CVE fixes
Date: Sun, 21 Jan 2024 08:57:55 -1000
Message-Id: <ad696a0067e11c332a4542ccacd76455f5fbd984.1705863274.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705863274.git.steve@sakoman.com>
References: <cover.1705863274.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Jan 2024 18:58:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194100

From: Vijay Anusuri <vanusuri@mvista.com>

Fix below CVE's
CVE-2023-6816
CVE-2024-0229
CVE-2024-21885
CVE-2024-21886
CVE-2024-0408
CVE-2024-0409

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xserver-xorg/CVE-2023-6816.patch          |  55 +++++
 .../xserver-xorg/CVE-2024-0229-1.patch        |  87 +++++++
 .../xserver-xorg/CVE-2024-0229-2.patch        | 221 ++++++++++++++++++
 .../xserver-xorg/CVE-2024-0229-3.patch        |  41 ++++
 .../xserver-xorg/CVE-2024-0229-4.patch        |  45 ++++
 .../xserver-xorg/CVE-2024-0408.patch          |  64 +++++
 .../xserver-xorg/CVE-2024-0409.patch          |  46 ++++
 .../xserver-xorg/CVE-2024-21885.patch         | 113 +++++++++
 .../xserver-xorg/CVE-2024-21886-1.patch       |  74 ++++++
 .../xserver-xorg/CVE-2024-21886-2.patch       |  57 +++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |  10 +
 11 files changed, 813 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-6816.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-0229-1.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-0229-2.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-0229-3.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-0229-4.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-0408.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-0409.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-21885.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-21886-1.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-21886-2.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-6816.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-6816.patch
new file mode 100644
index 0000000000..0bfff268e7
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-6816.patch
@@ -0,0 +1,55 @@
+From 9e2ecb2af8302dedc49cb6a63ebe063c58a9e7e3 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Thu, 14 Dec 2023 11:29:49 +1000
+Subject: [PATCH] dix: allocate enough space for logical button maps
+
+Both DeviceFocusEvent and the XIQueryPointer reply contain a bit for
+each logical button currently down. Since buttons can be arbitrarily mapped
+to anything up to 255 make sure we have enough bits for the maximum mapping.
+
+CVE-2023-6816, ZDI-CAN-22664, ZDI-CAN-22665
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/9e2ecb2af8302dedc49cb6a63ebe063c58a9e7e3]
+CVE: CVE-2023-6816
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ Xi/xiquerypointer.c | 3 +--
+ dix/enterleave.c    | 5 +++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Xi/xiquerypointer.c b/Xi/xiquerypointer.c
+index 5b77b1a444..2b05ac5f39 100644
+--- a/Xi/xiquerypointer.c
++++ b/Xi/xiquerypointer.c
+@@ -149,8 +149,7 @@ ProcXIQueryPointer(ClientPtr client)
+     if (pDev->button) {
+         int i;
+ 
+-        rep.buttons_len =
+-            bytes_to_int32(bits_to_bytes(pDev->button->numButtons));
++        rep.buttons_len = bytes_to_int32(bits_to_bytes(256)); /* button map up to 255 */
+         rep.length += rep.buttons_len;
+         buttons = calloc(rep.buttons_len, 4);
+         if (!buttons)
+diff --git a/dix/enterleave.c b/dix/enterleave.c
+index 867ec74363..ded8679d76 100644
+--- a/dix/enterleave.c
++++ b/dix/enterleave.c
+@@ -784,8 +784,9 @@ DeviceFocusEvent(DeviceIntPtr dev, int type, int mode, int detail,
+ 
+     mouse = IsFloating(dev) ? dev : GetMaster(dev, MASTER_POINTER);
+ 
+-    /* XI 2 event */
+-    btlen = (mouse->button) ? bits_to_bytes(mouse->button->numButtons) : 0;
++    /* XI 2 event contains the logical button map - maps are CARD8
++     * so we need 256 bits for the possibly maximum mapping */
++    btlen = (mouse->button) ? bits_to_bytes(256) : 0;
+     btlen = bytes_to_int32(btlen);
+     len = sizeof(xXIFocusInEvent) + btlen * 4;
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-0229-1.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-0229-1.patch
new file mode 100644
index 0000000000..80ebc64e59
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-0229-1.patch
@@ -0,0 +1,87 @@
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-0229-2.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-0229-2.patch
new file mode 100644
index 0000000000..65df74376b
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-0229-2.patch
@@ -0,0 +1,221 @@
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-0229-3.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-0229-3.patch
new file mode 100644
index 0000000000..742c122fa8
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-0229-3.patch
@@ -0,0 +1,41 @@
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-0229-4.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-0229-4.patch
new file mode 100644
index 0000000000..d1a6214793
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-0229-4.patch
@@ -0,0 +1,45 @@
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-0408.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-0408.patch
new file mode 100644
index 0000000000..c8f75d8a7e
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-0408.patch
@@ -0,0 +1,64 @@
+From e5e8586a12a3ec915673edffa10dc8fe5e15dac3 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 6 Dec 2023 12:09:41 +0100
+Subject: [PATCH] glx: Call XACE hooks on the GLX buffer
+
+The XSELINUX code will label resources at creation by checking the
+access mode. When the access mode is DixCreateAccess, it will call the
+function to label the new resource SELinuxLabelResource().
+
+However, GLX buffers do not go through the XACE hooks when created,
+hence leaving the resource actually unlabeled.
+
+When, later, the client tries to create another resource using that
+drawable (like a GC for example), the XSELINUX code would try to use
+the security ID of that object which has never been labeled, get a NULL
+pointer and crash when checking whether the requested permissions are
+granted for subject security ID.
+
+To avoid the issue, make sure to call the XACE hooks when creating the
+GLX buffers.
+
+Credit goes to Donn Seeley <donn@xmission.com> for providing the patch.
+
+CVE-2024-0408
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Acked-by: Peter Hutterer <peter.hutterer@who-t.net>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/e5e8586a12a3ec915673edffa10dc8fe5e15dac3]
+CVE: CVE-2024-0408
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ glx/glxcmds.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/glx/glxcmds.c b/glx/glxcmds.c
+index fc26a2e345..1e46d0c723 100644
+--- a/glx/glxcmds.c
++++ b/glx/glxcmds.c
+@@ -48,6 +48,7 @@
+ #include "indirect_util.h"
+ #include "protocol-versions.h"
+ #include "glxvndabi.h"
++#include "xace.h"
+ 
+ static char GLXServerVendorName[] = "SGI";
+ 
+@@ -1392,6 +1393,13 @@ DoCreatePbuffer(ClientPtr client, int screenNum, XID fbconfigId,
+     if (!pPixmap)
+         return BadAlloc;
+ 
++    err = XaceHook(XACE_RESOURCE_ACCESS, client, glxDrawableId, RT_PIXMAP,
++                   pPixmap, RT_NONE, NULL, DixCreateAccess);
++    if (err != Success) {
++        (*pGlxScreen->pScreen->DestroyPixmap) (pPixmap);
++        return err;
++    }
++
+     /* Assign the pixmap the same id as the pbuffer and add it as a
+      * resource so it and the DRI2 drawable will be reclaimed when the
+      * pbuffer is destroyed. */
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-0409.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-0409.patch
new file mode 100644
index 0000000000..9763e0b562
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-0409.patch
@@ -0,0 +1,46 @@
+From 2ef0f1116c65d5cb06d7b6d83f8a1aea702c94f7 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 6 Dec 2023 11:51:56 +0100
+Subject: [PATCH] ephyr,xwayland: Use the proper private key for cursor
+
+The cursor in DIX is actually split in two parts, the cursor itself and
+the cursor bits, each with their own devPrivates.
+
+The cursor itself includes the cursor bits, meaning that the cursor bits
+devPrivates in within structure of the cursor.
+
+Both Xephyr and Xwayland were using the private key for the cursor bits
+to store the data for the cursor, and when using XSELINUX which comes
+with its own special devPrivates, the data stored in that cursor bits'
+devPrivates would interfere with the XSELINUX devPrivates data and the
+SELINUX security ID would point to some other unrelated data, causing a
+crash in the XSELINUX code when trying to (re)use the security ID.
+
+CVE-2024-0409
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/2ef0f1116c65d5cb06d7b6d83f8a1aea702c94f7]
+CVE: CVE-2024-0409
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ hw/kdrive/ephyr/ephyrcursor.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/kdrive/ephyr/ephyrcursor.c b/hw/kdrive/ephyr/ephyrcursor.c
+index f991899..3f192d0 100644
+--- a/hw/kdrive/ephyr/ephyrcursor.c
++++ b/hw/kdrive/ephyr/ephyrcursor.c
+@@ -246,7 +246,7 @@ miPointerSpriteFuncRec EphyrPointerSpriteFuncs = {
+ Bool
+ ephyrCursorInit(ScreenPtr screen)
+ {
+-    if (!dixRegisterPrivateKey(&ephyrCursorPrivateKey, PRIVATE_CURSOR_BITS,
++    if (!dixRegisterPrivateKey(&ephyrCursorPrivateKey, PRIVATE_CURSOR,
+                                sizeof(ephyrCursorRec)))
+         return FALSE;
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-21885.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-21885.patch
new file mode 100644
index 0000000000..7c8fbcc3ec
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-21885.patch
@@ -0,0 +1,113 @@
+From 4a5e9b1895627d40d26045bd0b7ef3dce503cbd1 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Thu, 4 Jan 2024 10:01:24 +1000
+Subject: [PATCH] Xi: flush hierarchy events after adding/removing master
+ devices
+
+The `XISendDeviceHierarchyEvent()` function allocates space to store up
+to `MAXDEVICES` (256) `xXIHierarchyInfo` structures in `info`.
+
+If a device with a given ID was removed and a new device with the same
+ID added both in the same operation, the single device ID will lead to
+two info structures being written to `info`.
+
+Since this case can occur for every device ID at once, a total of two
+times `MAXDEVICES` info structures might be written to the allocation.
+
+To avoid it, once one add/remove master is processed, send out the
+device hierarchy event for the current state and continue. That event
+thus only ever has exactly one of either added/removed in it (and
+optionally slave attached/detached).
+
+CVE-2024-21885, ZDI-CAN-22744
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/4a5e9b1895627d40d26045bd0b7ef3dce503cbd1]
+CVE: CVE-2024-21885
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ Xi/xichangehierarchy.c | 27 ++++++++++++++++++++++-----
+ 1 file changed, 22 insertions(+), 5 deletions(-)
+
+diff --git a/Xi/xichangehierarchy.c b/Xi/xichangehierarchy.c
+index d2d985848d..72d00451e3 100644
+--- a/Xi/xichangehierarchy.c
++++ b/Xi/xichangehierarchy.c
+@@ -416,6 +416,11 @@ ProcXIChangeHierarchy(ClientPtr client)
+     size_t len;			/* length of data remaining in request */
+     int rc = Success;
+     int flags[MAXDEVICES] = { 0 };
++    enum {
++        NO_CHANGE,
++        FLUSH,
++        CHANGED,
++    } changes = NO_CHANGE;
+ 
+     REQUEST(xXIChangeHierarchyReq);
+     REQUEST_AT_LEAST_SIZE(xXIChangeHierarchyReq);
+@@ -465,8 +470,9 @@ ProcXIChangeHierarchy(ClientPtr client)
+             rc = add_master(client, c, flags);
+             if (rc != Success)
+                 goto unwind;
+-        }
++            changes = FLUSH;
+             break;
++        }
+         case XIRemoveMaster:
+         {
+             xXIRemoveMasterInfo *r = (xXIRemoveMasterInfo *) any;
+@@ -475,8 +481,9 @@ ProcXIChangeHierarchy(ClientPtr client)
+             rc = remove_master(client, r, flags);
+             if (rc != Success)
+                 goto unwind;
+-        }
++            changes = FLUSH;
+             break;
++        }
+         case XIDetachSlave:
+         {
+             xXIDetachSlaveInfo *c = (xXIDetachSlaveInfo *) any;
+@@ -485,8 +492,9 @@ ProcXIChangeHierarchy(ClientPtr client)
+             rc = detach_slave(client, c, flags);
+             if (rc != Success)
+                 goto unwind;
+-        }
++            changes = CHANGED;
+             break;
++        }
+         case XIAttachSlave:
+         {
+             xXIAttachSlaveInfo *c = (xXIAttachSlaveInfo *) any;
+@@ -495,16 +503,25 @@ ProcXIChangeHierarchy(ClientPtr client)
+             rc = attach_slave(client, c, flags);
+             if (rc != Success)
+                 goto unwind;
++            changes = CHANGED;
++            break;
+         }
++        default:
+             break;
+         }
+ 
++        if (changes == FLUSH) {
++            XISendDeviceHierarchyEvent(flags);
++            memset(flags, 0, sizeof(flags));
++            changes = NO_CHANGE;
++        }
++
+         len -= any->length * 4;
+         any = (xXIAnyHierarchyChangeInfo *) ((char *) any + any->length * 4);
+     }
+ 
+  unwind:
+-
+-    XISendDeviceHierarchyEvent(flags);
++    if (changes != NO_CHANGE)
++        XISendDeviceHierarchyEvent(flags);
+     return rc;
+ }
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-21886-1.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-21886-1.patch
new file mode 100644
index 0000000000..1e1c782963
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-21886-1.patch
@@ -0,0 +1,74 @@
+From bc1fdbe46559dd947674375946bbef54dd0ce36b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jexposit@redhat.com>
+Date: Fri, 22 Dec 2023 18:28:31 +0100
+Subject: [PATCH] Xi: do not keep linked list pointer during recursion
+
+The `DisableDevice()` function is called whenever an enabled device
+is disabled and it moves the device from the `inputInfo.devices` linked
+list to the `inputInfo.off_devices` linked list.
+
+However, its link/unlink operation has an issue during the recursive
+call to `DisableDevice()` due to the `prev` pointer pointing to a
+removed device.
+
+This issue leads to a length mismatch between the total number of
+devices and the number of device in the list, leading to a heap
+overflow and, possibly, to local privilege escalation.
+
+Simplify the code that checked whether the device passed to
+`DisableDevice()` was in `inputInfo.devices` or not and find the
+previous device after the recursion.
+
+CVE-2024-21886, ZDI-CAN-22840
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/bc1fdbe46559dd947674375946bbef54dd0ce36b]
+CVE: CVE-2024-21886
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ dix/devices.c | 15 ++++++++++++---
+ 1 file changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/dix/devices.c b/dix/devices.c
+index dca98c8d1b..389d28a23c 100644
+--- a/dix/devices.c
++++ b/dix/devices.c
+@@ -453,14 +453,20 @@ DisableDevice(DeviceIntPtr dev, BOOL sendevent)
+ {
+     DeviceIntPtr *prev, other;
+     BOOL enabled;
++    BOOL dev_in_devices_list = FALSE;
+     int flags[MAXDEVICES] = { 0 };
+ 
+     if (!dev->enabled)
+         return TRUE;
+ 
+-    for (prev = &inputInfo.devices;
+-         *prev && (*prev != dev); prev = &(*prev)->next);
+-    if (*prev != dev)
++    for (other = inputInfo.devices; other; other = other->next) {
++        if (other == dev) {
++            dev_in_devices_list = TRUE;
++            break;
++        }
++    }
++
++    if (!dev_in_devices_list)
+         return FALSE;
+ 
+     TouchEndPhysicallyActiveTouches(dev);
+@@ -511,6 +517,9 @@ DisableDevice(DeviceIntPtr dev, BOOL sendevent)
+     LeaveWindow(dev);
+     SetFocusOut(dev);
+ 
++    for (prev = &inputInfo.devices;
++         *prev && (*prev != dev); prev = &(*prev)->next);
++
+     *prev = dev->next;
+     dev->next = inputInfo.off_devices;
+     inputInfo.off_devices = dev;
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-21886-2.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-21886-2.patch
new file mode 100644
index 0000000000..af607df4f0
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-21886-2.patch
@@ -0,0 +1,57 @@
+From 26769aa71fcbe0a8403b7fb13b7c9010cc07c3a8 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Fri, 5 Jan 2024 09:40:27 +1000
+Subject: [PATCH] dix: when disabling a master, float disabled slaved devices
+ too
+
+Disabling a master device floats all slave devices but we didn't do this
+to already-disabled slave devices. As a result those devices kept their
+reference to the master device resulting in access to already freed
+memory if the master device was removed before the corresponding slave
+device.
+
+And to match this behavior, also forcibly reset that pointer during
+CloseDownDevices().
+
+Related to CVE-2024-21886, ZDI-CAN-22840
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/26769aa71fcbe0a8403b7fb13b7c9010cc07c3a8]
+CVE: CVE-2024-21886
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ dix/devices.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/dix/devices.c b/dix/devices.c
+index 389d28a23c..84a6406d13 100644
+--- a/dix/devices.c
++++ b/dix/devices.c
+@@ -483,6 +483,13 @@ DisableDevice(DeviceIntPtr dev, BOOL sendevent)
+                 flags[other->id] |= XISlaveDetached;
+             }
+         }
++
++        for (other = inputInfo.off_devices; other; other = other->next) {
++            if (!IsMaster(other) && GetMaster(other, MASTER_ATTACHED) == dev) {
++                AttachDevice(NULL, other, NULL);
++                flags[other->id] |= XISlaveDetached;
++            }
++        }
+     }
+     else {
+         for (other = inputInfo.devices; other; other = other->next) {
+@@ -1088,6 +1095,11 @@ CloseDownDevices(void)
+             dev->master = NULL;
+     }
+ 
++    for (dev = inputInfo.off_devices; dev; dev = dev->next) {
++        if (!IsMaster(dev) && !IsFloating(dev))
++            dev->master = NULL;
++    }
++
+     CloseDeviceList(&inputInfo.devices);
+     CloseDeviceList(&inputInfo.off_devices);
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index 7738085e11..e62babd4cb 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -6,6 +6,16 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2023-5380.patch \
            file://CVE-2023-6377.patch \
            file://CVE-2023-6478.patch \
+           file://CVE-2023-6816.patch \
+           file://CVE-2024-0229-1.patch \
+           file://CVE-2024-0229-2.patch \
+           file://CVE-2024-0229-3.patch \
+           file://CVE-2024-0229-4.patch \
+           file://CVE-2024-21885.patch \
+           file://CVE-2024-21886-1.patch \
+           file://CVE-2024-21886-2.patch \
+           file://CVE-2024-0408.patch \
+           file://CVE-2024-0409.patch \
            "
 SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
-- 
2.34.1


