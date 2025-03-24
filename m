Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BDF4C36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 19:37:15 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.48389.1742845026136281783
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 12:37:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FeJd1iWp;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3012a0c8496so6066132a91.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 12:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1742845025; x=1743449825; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cX7fF3I+fMLqXu77EdamZbDuztb6k9ULUTHnPrsF3h4=;
        b=FeJd1iWpBVfHUtsl9Tei7KYM569hiuG+eWv9YwuAtDEfa87YVqID1kts5w4F9cxWvE
         +fbyEkoitlZ17n2ZGQeCkbPPDT8OLZrQswMtMkfkVEcVEeqm+6fW3nQIwXbsg0+3sOKm
         khh+6KR3TNqwkfzB/sLaxkBAPNVgwk4Y+pH/Z3Jr/ZfpQM1fCwYxe3kM/30sLN1Lt0iQ
         n8znYzxNiAIOcXpNb9ISSVCv4pRDfiBYOlCTPWq8zlwXsIMmDeyt7Ui2qVxzlZFW3uL7
         kilFKdCyogYbwemq2hD5Z8oE7Z+XIvWGU8GXCfQZuBUTzJgtSziYW0EdzI6k/cKPyLSw
         ta3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742845025; x=1743449825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cX7fF3I+fMLqXu77EdamZbDuztb6k9ULUTHnPrsF3h4=;
        b=TKfgBSDL51YQ3AFcQBtYQlZiObX+5Z/dzypAfGRjPgza6bnJeSUejbZXLGIMgSurHy
         SkCpjQ8uEgAuqAemlP+urRZoMNT9cAkBxp7n2wNfvdJl/1YttFAksWkaJTyBJQL0shIe
         eHyLNhfRNtnLrUzjn5Rd3IIJdLp8VaITJSs6VO0qY7mE2nXKfby47DIsoIiu1VwVElYb
         NblxkqzKfYSjJe35z2O7dVmWT1o4gnD6/wmGWZNb24D5R3fOAi4ZB8JtBM4BpTW+MABh
         Yj56+yotBDb/2S4Nd1JWTK4jw+A/eXdtcRlSEwJPFbA0qUxkHtDaNg9L/ztNzSbuIwJU
         pXrA==
X-Gm-Message-State: AOJu0Yyqz8fRMo5LV+WlLmYR+2CXyIQ+vVJ/U0JcrAWb42TjIaEhbFoD
	4WoDi17AOI/0pKEBII5TwXA0vK8OJzm1TPgUgNQoB/76letOq8ZlWHno8/PiSq7HdPBYlSMWvpq
	P
X-Gm-Gg: ASbGncsUB0F1jYvVBchBbpfsDMbzxI0yiF1214fUSIF1J/1LwkscTxwalgROgaTIrTA
	nLOrsTog4j6q75daVWbZBbBeA09Rnlt++A6/njAl0C+jL3jSRoJ8PMOZSJT4CBfcpuAP/3XV9wQ
	w9Z3/8EE71Db5vilIq3hFQWfUnN2iWIqhm6worc5PLqVz/sGntgn2ayDajSO6kIA+GPCUM347Xs
	hbNfxEX27bN6bL+C0S4N1u67qMhYXPBaJ/lPsK5qbOVcJmAtK9wPmxfwP5gkmkcB8DqHdG12Rqu
	wAy+7Q8XVYkY7UBBiwF8ylu5ic+j7vmiVCqOLOr+Z7N6Zw8=
X-Google-Smtp-Source: AGHT+IECZzZclhr6zqYw+sO5/seuk/4Q8zOSE1U+TaR+F1ly3DLLceysDC7/ElKr90MMaPUxj5ndcw==
X-Received: by 2002:a17:90b:3948:b0:301:1d9f:4ba2 with SMTP id 98e67ed59e1d1-3030fee95demr23705902a91.28.1742845025073;
        Mon, 24 Mar 2025 12:37:05 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:ee18:96b4:93d3:b88c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3030f806b48sm8640876a91.44.2025.03.24.12.37.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 12:37:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/6] xserver-xorg: fix CVE-2022-49737
Date: Mon, 24 Mar 2025 12:36:51 -0700
Message-ID: <c6a8ad45174a416c4129deb210eab9b7721ce01d.1742844907.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1742844907.git.steve@sakoman.com>
References: <cover.1742844907.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 19:37:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213576

From: Yogita Urade <yogita.urade@windriver.com>

In X.Org X server 20.11 through 21.1.16, when a client application
uses easystroke for mouse gestures, the main thread modifies various
data structures used by the input thread without acquiring a lock,
aka a race condition. In particular, AttachDevice in dix/devices.c
does not acquire an input lock.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-49737

Upstream patch:
https://gitlab.freedesktop.org/xorg/xserver/-/commit/dc7cb45482cea6ccec22d117ca0b489500b4d0a0

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xserver-xorg/CVE-2022-49737.patch         | 90 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-49737.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-49737.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-49737.patch
new file mode 100644
index 0000000000..86c9f59f8c
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-49737.patch
@@ -0,0 +1,90 @@
+From dc7cb45482cea6ccec22d117ca0b489500b4d0a0 Mon Sep 17 00:00:00 2001
+From: tholin <thomas.lindroth@gmail.com>
+Date: Tue, 4 Jan 2022 12:08:11 +0000
+Subject: [PATCH] dix: Hold input lock for AttachDevice()
+
+Fix the following race:
+
+Possible data race during read of size 8 at 0xA112510 by thread #6
+Locks held: 1, at address 0x366B40
+   at 0x14C8B9: GetMaster (devices.c:2691)
+   by 0x15CFC5: IsFloating (events.c:346)
+   by 0x2B9554: miPointerGetScreen (mipointer.c:527)
+   by 0x1A5136: xf86PostButtonEventM (xf86Xinput.c:1379)
+   by 0x1A52BD: xf86PostButtonEvent (xf86Xinput.c:1345)
+   by 0x485F45B: EvdevProcessEvent (in /usr/lib64/xorg/modules/input/evdev_drv.so)
+   by 0x485FDAC: EvdevReadInput (in /usr/lib64/xorg/modules/input/evdev_drv.so)
+   by 0x195427: xf86ReadInput (xf86Events.c:247)
+   by 0x2CC113: InputReady (inputthread.c:180)
+   by 0x2CE4EA: ospoll_wait (ospoll.c:657)
+   by 0x2CC077: InputThreadDoWork (inputthread.c:369)
+   by 0x484A336: mythread_wrapper (hg_intercepts.c:406)
+
+This conflicts with a previous write of size 8 by thread #1
+Locks held: none
+   at 0x14D2C6: AttachDevice (devices.c:2609)
+   by 0x15CF85: ReattachToOldMaster (events.c:1457)
+   by 0x1647DD: DeactivateKeyboardGrab (events.c:1700)
+   by 0x25D7F1: ProcXIUngrabDevice (xigrabdev.c:169)
+   by 0x2552AD: ProcIDispatch (extinit.c:398)
+   by 0x155291: Dispatch (dispatch.c:479)
+   by 0x158CBA: dix_main (main.c:276)
+   by 0x143A3D: main (stubmain.c:34)
+ Address 0xa112510 is 336 bytes inside a block of size 904 alloc'd
+   at 0x4846571: calloc (vg_replace_malloc.c:1328)
+   by 0x14A0B3: AddInputDevice (devices.c:260)
+   by 0x1A31A0: xf86ActivateDevice (xf86Xinput.c:365)
+   by 0x1A4549: xf86NewInputDevice (xf86Xinput.c:948)
+   by 0x1A4B44: NewInputDeviceRequest (xf86Xinput.c:1090)
+   by 0x1B81FE: device_added (udev.c:282)
+   by 0x1B8516: config_udev_init (udev.c:439)
+   by 0x1B7091: config_init (config.c:50)
+   by 0x197970: InitInput (xf86Init.c:814)
+   by 0x158C6B: dix_main (main.c:250)
+   by 0x143A3D: main (stubmain.c:34)
+ Block was alloc'd by thread #1
+
+The steps to trigger the race are:
+1. Main thread does cleanup at mipointer.c:360 setting the slave device's
+   miPointerPtr to null.
+2. Input thread use MIPOINTER in mipointer.c and get the slave's
+   miPointerPtr = null.
+3. Main thread updates dev->master at devices.c:2609.
+4. MIPOINTER would now return the master's miPointerPtr but the input
+   thread already got the slave's miPointerPtr in step 2 and segfaults by
+   null ptr deref.
+
+Closes: https://gitlab.freedesktop.org/xorg/xserver/-/issues/1260
+Signed-off-by: Thomas Lindroth <thomas.lindroth@gmail.com>
+
+CVE: CVE-2022-49737
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/dc7cb45482cea6ccec22d117ca0b489500b4d0a0]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ dix/devices.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/dix/devices.c b/dix/devices.c
+index 459f1ed..e5a6f02 100644
+--- a/dix/devices.c
++++ b/dix/devices.c
+@@ -2671,6 +2671,8 @@ AttachDevice(ClientPtr client, DeviceIntPtr dev, DeviceIntPtr master)
+     if (IsFloating(dev) && !master && dev->enabled)
+         return Success;
+
++    input_lock();
++
+     /* free the existing sprite. */
+     if (IsFloating(dev) && dev->spriteInfo->paired == dev) {
+         screen = miPointerGetScreen(dev);
+@@ -2711,6 +2713,7 @@ AttachDevice(ClientPtr client, DeviceIntPtr dev, DeviceIntPtr master)
+         RecalculateMasterButtons(master);
+     }
+
++    input_unlock();
+     /* XXX: in theory, the MD should change back to its old, original
+      * classes when the last SD is detached. Thanks to the XTEST devices,
+      * we'll always have an SD attached until the MD is removed.
+--
+2.40.0
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index e77b81eed6..6790eb0921 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -35,6 +35,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2025-26601-2.patch \
            file://CVE-2025-26601-3.patch \
            file://CVE-2025-26601-4.patch \
+           file://CVE-2022-49737.patch \
            "
 SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
-- 
2.43.0


