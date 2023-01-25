Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A38EC61D97
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 14:42:27 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.46712.1674657740409012310
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 06:42:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=XVVIjane;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id 200so13552926pfx.7
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 06:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q3nNfs9oM+rdMp0S6N+y7uJXt5LpQJSdF0hTXcO4hRs=;
        b=XVVIjanef/MerFznUEDGIaFRmfbv0dQFYgiLeUmRZqGa0uW05oH/Fp8JuVFHmVFW/g
         WD4wS/m9G9MbEF2JpsShwSM+wfk0ej/ORsJCD8nj6MdhRgxca1+/u/PDM8EZHNv1i9mT
         2QFGmBkIO6+f9SrIAsCGAPZtltg9ORSDVpHCEOIQ3NcDFLAUMIR2qA0eypUlI85k3NhU
         5Oy6xOK/6rVqy1zvqgkq1yAnb/6XSp59YJoXX6bCQJv465KVa97h01FoKRT1SKVFyM2D
         NxnahTZktuUkO/290KfCufVlcIszkprTBoPAkF/Mc1YxHsBZAb/gHQGmE7GDw+XZBoqz
         T85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q3nNfs9oM+rdMp0S6N+y7uJXt5LpQJSdF0hTXcO4hRs=;
        b=bYQv8OkpADcNIrl0H0KYulQHiydh+N4YxmVp/qUwfE+TIGWah2RvBxiZmA9uBWwgkV
         TRjnWJpZdmIXuxnttOJSOopjG0a8ypYN3xn+GhRNaLLPU0O9hs2f3H5oZl8AqPfARS8i
         p9TB2GatScSbIkuJY64YsWcUbtCmXo9c7gpf7gDWtXZUQDDZH10s1NQkG7dX3Yh0P63o
         O+MeSuw2KWwMN1LEORYo/vQc/RRoi59tPu3NqgVpBk6NoibYxyam0ALXDcs8h2w8BLBZ
         eX9M1ilcYvaosEC1GMShVUUKqOGme7hwj4BxaG+UXsxeUsNA0oQmEGGs2X+9zkSBDqIR
         XWZg==
X-Gm-Message-State: AO0yUKVAslTHbyzpvum0P5uqPn7N0F8Cc5V/iu/rK5gA0wIN/MCB7Ixf
	DCxCPKhr2+Y+utx+3u0sqYOJSbjBl1IrA2K3Fec=
X-Google-Smtp-Source: AK7set/qVEU6ZrgapeGNGZIRAo32rWOSwqlb39RsBV8LO327tkwisDakJhugdyHM1qS+DaViocmj9A==
X-Received: by 2002:a05:6a00:3014:b0:590:644c:ed52 with SMTP id ay20-20020a056a00301400b00590644ced52mr1504971pfb.19.1674657743257;
        Wed, 25 Jan 2023 06:42:23 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d2-20020aa78142000000b005810c4286d6sm3723703pfn.0.2023.01.25.06.42.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:42:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/16] xserver-xorg: Fix Multiple CVEs
Date: Wed, 25 Jan 2023 04:41:52 -1000
Message-Id: <41035c7b55200b488b21d062fe05326cd8dde3a3.1674657501.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674657501.git.steve@sakoman.com>
References: <cover.1674657501.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 14:42:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176360

From: Hitendra Prajapati <hprajapati@mvista.com>

CVE-2022-4283: xkb: reset the radio_groups pointer to NULL after freeing it
Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/ccdd431cd8f1cabae9d744f0514b6533c438908c

CVE-2022-46340: Xtest: disallow GenericEvents in XTestSwapFakeInput
Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/b320ca0ffe4c0c872eeb3a93d9bde21f765c7c63

CVE-2022-46341: Xi: disallow passive grabs with a detail > 255
Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/51eb63b0ee1509c6c6b8922b0e4aa037faa6f78b

CVE-2022-46342: Xext: free the XvRTVideoNotify when turning off from the same client
Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/b79f32b57cc0c1186b2899bce7cf89f7b325161b

CVE-2022-46343: Xext: free the screen saver resource when replacing it
Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/842ca3ccef100ce010d1d8f5f6d6cc1915055900

CVE-2022-46344: Xi: avoid integer truncation in length check of ProcXIChangeProperty
Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/8f454b793e1f13c99872c15f0eed1d7f3b823fe8

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xserver-xorg/CVE-2022-4283.patch          | 39 +++++++++
 .../xserver-xorg/CVE-2022-46340.patch         | 55 ++++++++++++
 .../xserver-xorg/CVE-2022-46341.patch         | 86 +++++++++++++++++++
 .../xserver-xorg/CVE-2022-46342.patch         | 78 +++++++++++++++++
 .../xserver-xorg/CVE-2022-46343.patch         | 51 +++++++++++
 .../xserver-xorg/CVE-2022-46344.patch         | 75 ++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.14.bb      |  8 +-
 7 files changed, 391 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-4283.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46340.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46341.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46342.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46343.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46344.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-4283.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-4283.patch
new file mode 100644
index 0000000000..3f6b68fea8
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-4283.patch
@@ -0,0 +1,39 @@
+From ccdd431cd8f1cabae9d744f0514b6533c438908c Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Mon, 5 Dec 2022 15:55:54 +1000
+Subject: [PATCH] xkb: reset the radio_groups pointer to NULL after freeing it
+
+Unlike other elements of the keymap, this pointer was freed but not
+reset. On a subsequent XkbGetKbdByName request, the server may access
+already freed memory.
+
+CVE-2022-4283, ZDI-CAN-19530
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+Acked-by: Olivier Fourdan <ofourdan@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/ccdd431cd8f1cabae9d744f0514b6533c438908c]
+CVE: CVE-2022-4283
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ xkb/xkbUtils.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/xkb/xkbUtils.c b/xkb/xkbUtils.c
+index 8975ade..9bc51fc 100644
+--- a/xkb/xkbUtils.c
++++ b/xkb/xkbUtils.c
+@@ -1327,6 +1327,7 @@ _XkbCopyNames(XkbDescPtr src, XkbDescPtr dst)
+         }
+         else {
+             free(dst->names->radio_groups);
++            dst->names->radio_groups = NULL;
+         }
+         dst->names->num_rg = src->names->num_rg;
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46340.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46340.patch
new file mode 100644
index 0000000000..a6c97485cd
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46340.patch
@@ -0,0 +1,55 @@
+From b320ca0ffe4c0c872eeb3a93d9bde21f765c7c63 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Tue, 29 Nov 2022 12:55:45 +1000
+Subject: [PATCH] Xtest: disallow GenericEvents in XTestSwapFakeInput
+
+XTestSwapFakeInput assumes all events in this request are
+sizeof(xEvent) and iterates through these in 32-byte increments.
+However, a GenericEvent may be of arbitrary length longer than 32 bytes,
+so any GenericEvent in this list would result in subsequent events to be
+misparsed.
+
+Additional, the swapped event is written into a stack-allocated struct
+xEvent (size 32 bytes). For any GenericEvent longer than 32 bytes,
+swapping the event may thus smash the stack like an avocado on toast.
+
+Catch this case early and return BadValue for any GenericEvent.
+Which is what would happen in unswapped setups anyway since XTest
+doesn't support GenericEvent.
+
+CVE-2022-46340, ZDI-CAN 19265
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+Acked-by: Olivier Fourdan <ofourdan@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/b320ca0ffe4c0c872eeb3a93d9bde21f765c7c63]
+CVE: CVE-2022-46340
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ Xext/xtest.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/Xext/xtest.c b/Xext/xtest.c
+index 38b8012..bf11789 100644
+--- a/Xext/xtest.c
++++ b/Xext/xtest.c
+@@ -501,10 +501,11 @@ XTestSwapFakeInput(ClientPtr client, xReq * req)
+ 
+     nev = ((req->length << 2) - sizeof(xReq)) / sizeof(xEvent);
+     for (ev = (xEvent *) &req[1]; --nev >= 0; ev++) {
++        int evtype = ev->u.u.type & 0x177;
+         /* Swap event */
+-        proc = EventSwapVector[ev->u.u.type & 0177];
++        proc = EventSwapVector[evtype];
+         /* no swapping proc; invalid event type? */
+-        if (!proc || proc == NotImplemented) {
++        if (!proc || proc == NotImplemented || evtype == GenericEvent) {
+             client->errorValue = ev->u.u.type;
+             return BadValue;
+         }
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46341.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46341.patch
new file mode 100644
index 0000000000..0ef6e5fc9f
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46341.patch
@@ -0,0 +1,86 @@
+From 51eb63b0ee1509c6c6b8922b0e4aa037faa6f78b Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Tue, 29 Nov 2022 13:55:32 +1000
+Subject: [PATCH] Xi: disallow passive grabs with a detail > 255
+
+The XKB protocol effectively prevents us from ever using keycodes above
+255. For buttons it's theoretically possible but realistically too niche
+to worry about. For all other passive grabs, the detail must be zero
+anyway.
+
+This fixes an OOB write:
+
+ProcXIPassiveUngrabDevice() calls DeletePassiveGrabFromList with a
+temporary grab struct which contains tempGrab->detail.exact = stuff->detail.
+For matching existing grabs, DeleteDetailFromMask is called with the
+stuff->detail value. This function creates a new mask with the one bit
+representing stuff->detail cleared.
+
+However, the array size for the new mask is 8 * sizeof(CARD32) bits,
+thus any detail above 255 results in an OOB array write.
+
+CVE-2022-46341, ZDI-CAN 19381
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+Acked-by: Olivier Fourdan <ofourdan@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/51eb63b0ee1509c6c6b8922b0e4aa037faa6f78b]
+CVE: CVE-2022-46341
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ Xi/xipassivegrab.c | 22 ++++++++++++++--------
+ 1 file changed, 14 insertions(+), 8 deletions(-)
+
+diff --git a/Xi/xipassivegrab.c b/Xi/xipassivegrab.c
+index d30f51f..89a5910 100644
+--- a/Xi/xipassivegrab.c
++++ b/Xi/xipassivegrab.c
+@@ -133,6 +133,12 @@ ProcXIPassiveGrabDevice(ClientPtr client)
+         return BadValue;
+     }
+ 
++    /* XI2 allows 32-bit keycodes but thanks to XKB we can never
++     * implement this. Just return an error for all keycodes that
++     * cannot work anyway, same for buttons > 255. */
++    if (stuff->detail > 255)
++        return XIAlreadyGrabbed;
++
+     if (XICheckInvalidMaskBits(client, (unsigned char *) &stuff[1],
+                                stuff->mask_len * 4) != Success)
+         return BadValue;
+@@ -203,14 +209,8 @@ ProcXIPassiveGrabDevice(ClientPtr client)
+                                 &param, XI2, &mask);
+             break;
+         case XIGrabtypeKeycode:
+-            /* XI2 allows 32-bit keycodes but thanks to XKB we can never
+-             * implement this. Just return an error for all keycodes that
+-             * cannot work anyway */
+-            if (stuff->detail > 255)
+-                status = XIAlreadyGrabbed;
+-            else
+-                status = GrabKey(client, dev, mod_dev, stuff->detail,
+-                                 &param, XI2, &mask);
++            status = GrabKey(client, dev, mod_dev, stuff->detail,
++                             &param, XI2, &mask);
+             break;
+         case XIGrabtypeEnter:
+         case XIGrabtypeFocusIn:
+@@ -319,6 +319,12 @@ ProcXIPassiveUngrabDevice(ClientPtr client)
+         return BadValue;
+     }
+ 
++    /* We don't allow passive grabs for details > 255 anyway */
++    if (stuff->detail > 255) {
++        client->errorValue = stuff->detail;
++        return BadValue;
++    }
++
+     rc = dixLookupWindow(&win, stuff->grab_window, client, DixSetAttrAccess);
+     if (rc != Success)
+         return rc;
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46342.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46342.patch
new file mode 100644
index 0000000000..23fef3f321
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46342.patch
@@ -0,0 +1,78 @@
+From b79f32b57cc0c1186b2899bce7cf89f7b325161b Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Wed, 30 Nov 2022 11:20:40 +1000
+Subject: [PATCH] Xext: free the XvRTVideoNotify when turning off from the same
+ client
+
+This fixes a use-after-free bug:
+
+When a client first calls XvdiSelectVideoNotify() on a drawable with a
+TRUE onoff argument, a struct XvVideoNotifyRec is allocated. This struct
+is added twice to the resources:
+  - as the drawable's XvRTVideoNotifyList. This happens only once per
+    drawable, subsequent calls append to this list.
+  - as the client's XvRTVideoNotify. This happens for every client.
+
+The struct keeps the ClientPtr around once it has been added for a
+client. The idea, presumably, is that if the client disconnects we can remove
+all structs from the drawable's list that match the client (by resetting
+the ClientPtr to NULL), but if the drawable is destroyed we can remove
+and free the whole list.
+
+However, if the same client then calls XvdiSelectVideoNotify() on the
+same drawable with a FALSE onoff argument, only the ClientPtr on the
+existing struct was set to NULL. The struct itself remained in the
+client's resources.
+
+If the drawable is now destroyed, the resource system invokes
+XvdiDestroyVideoNotifyList which frees the whole list for this drawable
+- including our struct. This function however does not free the resource
+for the client since our ClientPtr is NULL.
+
+Later, when the client is destroyed and the resource system invokes
+XvdiDestroyVideoNotify, we unconditionally set the ClientPtr to NULL. On
+a struct that has been freed previously. This is generally frowned upon.
+
+Fix this by calling FreeResource() on the second call instead of merely
+setting the ClientPtr to NULL. This removes the struct from the client
+resources (but not from the list), ensuring that it won't be accessed
+again when the client quits.
+
+Note that the assignment tpn->client = NULL; is superfluous since the
+XvdiDestroyVideoNotify function will do this anyway. But it's left for
+clarity and to match a similar invocation in XvdiSelectPortNotify.
+
+CVE-2022-46342, ZDI-CAN 19400
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+Acked-by: Olivier Fourdan <ofourdan@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/b79f32b57cc0c1186b2899bce7cf89f7b325161b]
+CVE: CVE-2022-46342
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ Xext/xvmain.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/Xext/xvmain.c b/Xext/xvmain.c
+index c520c7d..5f4c174 100644
+--- a/Xext/xvmain.c
++++ b/Xext/xvmain.c
+@@ -811,8 +811,10 @@ XvdiSelectVideoNotify(ClientPtr client, DrawablePtr pDraw, BOOL onoff)
+         tpn = pn;
+         while (tpn) {
+             if (tpn->client == client) {
+-                if (!onoff)
++                if (!onoff) {
+                     tpn->client = NULL;
++                    FreeResource(tpn->id, XvRTVideoNotify);
++                }
+                 return Success;
+             }
+             if (!tpn->client)
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46343.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46343.patch
new file mode 100644
index 0000000000..838f7d3726
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46343.patch
@@ -0,0 +1,51 @@
+From 842ca3ccef100ce010d1d8f5f6d6cc1915055900 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Tue, 29 Nov 2022 14:53:07 +1000
+Subject: [PATCH] Xext: free the screen saver resource when replacing it
+
+This fixes a use-after-free bug:
+
+When a client first calls ScreenSaverSetAttributes(), a struct
+ScreenSaverAttrRec is allocated and added to the client's
+resources.
+
+When the same client calls ScreenSaverSetAttributes() again, a new
+struct ScreenSaverAttrRec is allocated, replacing the old struct. The
+old struct was freed but not removed from the clients resources.
+
+Later, when the client is destroyed the resource system invokes
+ScreenSaverFreeAttr and attempts to clean up the already freed struct.
+
+Fix this by letting the resource system free the old attrs instead.
+
+CVE-2022-46343, ZDI-CAN 19404
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+Acked-by: Olivier Fourdan <ofourdan@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/842ca3ccef100ce010d1d8f5f6d6cc1915055900]
+CVE: CVE-2022-46343
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ Xext/saver.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Xext/saver.c b/Xext/saver.c
+index c23907d..05b9ca3 100644
+--- a/Xext/saver.c
++++ b/Xext/saver.c
+@@ -1051,7 +1051,7 @@ ScreenSaverSetAttributes(ClientPtr client)
+         pVlist++;
+     }
+     if (pPriv->attr)
+-        FreeScreenAttr(pPriv->attr);
++        FreeResource(pPriv->attr->resource, AttrType);
+     pPriv->attr = pAttr;
+     pAttr->resource = FakeClientID(client->index);
+     if (!AddResource(pAttr->resource, AttrType, (void *) pAttr))
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46344.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46344.patch
new file mode 100644
index 0000000000..e25afa0d16
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46344.patch
@@ -0,0 +1,75 @@
+From 8f454b793e1f13c99872c15f0eed1d7f3b823fe8 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Tue, 29 Nov 2022 13:26:57 +1000
+Subject: [PATCH] Xi: avoid integer truncation in length check of
+ ProcXIChangeProperty
+
+This fixes an OOB read and the resulting information disclosure.
+
+Length calculation for the request was clipped to a 32-bit integer. With
+the correct stuff->num_items value the expected request size was
+truncated, passing the REQUEST_FIXED_SIZE check.
+
+The server then proceeded with reading at least stuff->num_items bytes
+(depending on stuff->format) from the request and stuffing whatever it
+finds into the property. In the process it would also allocate at least
+stuff->num_items bytes, i.e. 4GB.
+
+The same bug exists in ProcChangeProperty and ProcXChangeDeviceProperty,
+so let's fix that too.
+
+CVE-2022-46344, ZDI-CAN 19405
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+Acked-by: Olivier Fourdan <ofourdan@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/8f454b793e1f13c99872c15f0eed1d7f3b823fe8]
+CVE: CVE-2022-46344
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ Xi/xiproperty.c | 4 ++--
+ dix/property.c  | 3 ++-
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/Xi/xiproperty.c b/Xi/xiproperty.c
+index 6ec419e..0cfa6e3 100644
+--- a/Xi/xiproperty.c
++++ b/Xi/xiproperty.c
+@@ -890,7 +890,7 @@ ProcXChangeDeviceProperty(ClientPtr client)
+     REQUEST(xChangeDevicePropertyReq);
+     DeviceIntPtr dev;
+     unsigned long len;
+-    int totalSize;
++    uint64_t totalSize;
+     int rc;
+ 
+     REQUEST_AT_LEAST_SIZE(xChangeDevicePropertyReq);
+@@ -1128,7 +1128,7 @@ ProcXIChangeProperty(ClientPtr client)
+ {
+     int rc;
+     DeviceIntPtr dev;
+-    int totalSize;
++    uint64_t totalSize;
+     unsigned long len;
+ 
+     REQUEST(xXIChangePropertyReq);
+diff --git a/dix/property.c b/dix/property.c
+index ff1d669..6fdb74a 100644
+--- a/dix/property.c
++++ b/dix/property.c
+@@ -205,7 +205,8 @@ ProcChangeProperty(ClientPtr client)
+     WindowPtr pWin;
+     char format, mode;
+     unsigned long len;
+-    int sizeInBytes, totalSize, err;
++    int sizeInBytes, err;
++    uint64_t totalSize;
+ 
+     REQUEST(xChangePropertyReq);
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
index 4f5528f78b..ab18a87a3d 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
@@ -8,7 +8,13 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2022-3550.patch \
            file://CVE-2022-3551.patch \
            file://CVE-2022-3553.patch \
-           "
+           file://CVE-2022-4283.patch \
+           file://CVE-2022-46340.patch \
+           file://CVE-2022-46341.patch \
+           file://CVE-2022-46342.patch \
+           file://CVE-2022-46343.patch \
+           file://CVE-2022-46344.patch \
+"
 SRC_URI[md5sum] = "453fc86aac8c629b3a5b77e8dcca30bf"
 SRC_URI[sha256sum] = "54b199c9280ff8bf0f73a54a759645bd0eeeda7255d1c99310d5b7595f3ac066"
 
-- 
2.25.1


