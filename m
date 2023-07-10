Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA859EB64D9
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 11:15:59 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.37020.1688987752922552993
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 04:15:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=JmpiGMqT;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ppjadhav456@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1b8baa836a5so32775085ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 04:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688987752; x=1691579752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=piMsy7HzVaWzi0oMVKbaGmHdBV5Vf9ozR8BEKHsdS5M=;
        b=JmpiGMqTA+d1z68yNnNgMOL5YbzjXqfVl4xEgfbR+SBiNSRiRJJ3SIe1ukvI2tsc7e
         YpyO+hFwP5xIjyPXtnWhSyIAnr/gXPdQE4luzCagWurSWikvLIDoJYcPw7FMfoJ9rSsf
         XuGNI7fhOgPdC0Sj2n+QQCo1Y+BAvl89hwydbWGg8teVj/m9RDABkNV7HsMGldAjF7TF
         VP8uhrpXUyMdB/Kvq0kfj5D65DmEnbVkzczKrdUlL3ESvFaFBxrJMN1ZXmihK3Sf1OF1
         H0e6Kmj/QW75o0ml/Qc5DvbNmbAed53c0chVrtyvFOFaEim38EhhWej6QkclI5QQn5jk
         1zeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688987752; x=1691579752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=piMsy7HzVaWzi0oMVKbaGmHdBV5Vf9ozR8BEKHsdS5M=;
        b=S8jxR5vv7jgbqAnC9eLAJeGfn1SONK6iMxR+t44ah/irXWTEkcBHc4V/HpH5+IPlF1
         8kLItdF8jRIu/IibRGQHpZjIsobGRVzbQxp9iaa3pFTNJN6FXhh+yJh9MexP4Q6eWjEf
         kM/1VIY5raBFR2AwLOTXzBRTVLWwZtzCiJf7/fiBXtsqN1psrJkSM01dBFIdkZ939lcj
         Qm7ke5F6/YUcOxl5tFUzGfTVaUUTPqjlBJwhPj6/vIhQdgwZLuck4MpcCD4WdCF4FKrd
         4T3V8T36WivLCVK9Co1/x4wuZbDIX22dOxmKE1SRVzT/U28us0lSBcCOBlaqSFMkfchy
         FQqg==
X-Gm-Message-State: ABy/qLbNhjK6GJEcu2/7vTB0z3F8O5fl/wmcu5mKgWqfdDarcHj6HIGm
	TDR3OyeQKDz8J06rHvra6NzFtvIiTp9s4qWb
X-Google-Smtp-Source: APBJJlF90o0LKgJfcPq5C4vqMPYbThBUvwkJZAGeUeSS4KeQHa0v0LCdJDwnkPdODzPERB2KrhSyEw==
X-Received: by 2002:a17:903:41c7:b0:1ac:aba5:7885 with SMTP id u7-20020a17090341c700b001acaba57885mr14467965ple.47.1688987751967;
        Mon, 10 Jul 2023 04:15:51 -0700 (PDT)
Received: from localhost.localdomain ([43.231.237.241])
        by smtp.gmail.com with ESMTPSA id o15-20020a170902d4cf00b001b03842ab78sm8025256plg.89.2023.07.10.04.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 04:15:51 -0700 (PDT)
From: Poonam Jadhav <ppjadhav456@gmail.com>
To: openembedded-core@lists.openembedded.org,
	ppjadhav456@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Poonam Jadhav <poonam.jadhav@kpit.com>
Subject: [OE-core][kirkstone][PATCH] libx11: Fix CVE-2023-3138 for kirkstone branch
Date: Mon, 10 Jul 2023 16:45:33 +0530
Message-Id: <20230710111533.4188014-1-ppjadhav456@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 11:15:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184069

From: Poonam Jadhav <poonam.jadhav@kpit.com>

Add patch to fix CVE-2023-3138 for kirkstone branch

Link: https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/304a654a0d57bf0f00d8998185f0360332cfa36c.patch

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
---
 .../xorg-lib/libx11/CVE-2023-3138.patch       | 111 ++++++++++++++++++
 .../xorg-lib/libx11_1.7.3.1.bb                |   1 +
 2 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2023-3138.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-3138.patch b/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-3138.patch
new file mode 100644
index 0000000000..c724cf8fdd
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-3138.patch
@@ -0,0 +1,111 @@
+From 304a654a0d57bf0f00d8998185f0360332cfa36c Mon Sep 17 00:00:00 2001
+From: Alan Coopersmith <alan.coopersmith@oracle.com>
+Date: Sat, 10 Jun 2023 16:30:07 -0700
+Subject: [PATCH] InitExt.c: Add bounds checks for extension request, event, &
+ error codes
+
+Fixes CVE-2023-3138: X servers could return values from XQueryExtension
+that would cause Xlib to write entries out-of-bounds of the arrays to
+store them, though this would only overwrite other parts of the Display
+struct, not outside the bounds allocated for that structure.
+
+Reported-by: Gregory James DUCK <gjduck@gmail.com>
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+
+CVE: CVE-2023-3138
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/304a654a0d57bf0f00d8998185f0360332cfa36c.patch]
+Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
+---
+ src/InitExt.c | 42 ++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 42 insertions(+)
+
+diff --git a/src/InitExt.c b/src/InitExt.c
+index 4de46f15..afc00a6b 100644
+--- a/src/InitExt.c
++++ b/src/InitExt.c
+@@ -33,6 +33,18 @@ from The Open Group.
+ #include <X11/Xos.h>
+ #include <stdio.h>
+ 
++/* The X11 protocol spec reserves events 64 through 127 for extensions */
++#ifndef LastExtensionEvent
++#define LastExtensionEvent 127
++#endif
++
++/* The X11 protocol spec reserves requests 128 through 255 for extensions */
++#ifndef LastExtensionRequest
++#define FirstExtensionRequest 128
++#define LastExtensionRequest 255
++#endif
++
++
+ /*
+  * This routine is used to link a extension in so it will be called
+  * at appropriate times.
+@@ -242,6 +254,12 @@ WireToEventType XESetWireToEvent(
+ 	WireToEventType proc)	/* routine to call when converting event */
+ {
+ 	register WireToEventType oldproc;
++	if (event_number < 0 ||
++	    event_number > LastExtensionEvent) {
++	    fprintf(stderr, "Xlib: ignoring invalid extension event %d\n",
++		    event_number);
++	    return (WireToEventType)_XUnknownWireEvent;
++	}
+ 	if (proc == NULL) proc = (WireToEventType)_XUnknownWireEvent;
+ 	LockDisplay (dpy);
+ 	oldproc = dpy->event_vec[event_number];
+@@ -263,6 +281,12 @@ WireToEventCookieType XESetWireToEventCookie(
+     )
+ {
+ 	WireToEventCookieType oldproc;
++	if (extension < FirstExtensionRequest ||
++	    extension > LastExtensionRequest) {
++	    fprintf(stderr, "Xlib: ignoring invalid extension opcode %d\n",
++		    extension);
++	    return (WireToEventCookieType)_XUnknownWireEventCookie;
++	}
+ 	if (proc == NULL) proc = (WireToEventCookieType)_XUnknownWireEventCookie;
+ 	LockDisplay (dpy);
+ 	oldproc = dpy->generic_event_vec[extension & 0x7F];
+@@ -284,6 +308,12 @@ CopyEventCookieType XESetCopyEventCookie(
+     )
+ {
+ 	CopyEventCookieType oldproc;
++	if (extension < FirstExtensionRequest ||
++	    extension > LastExtensionRequest) {
++	    fprintf(stderr, "Xlib: ignoring invalid extension opcode %d\n",
++		    extension);
++	    return (CopyEventCookieType)_XUnknownCopyEventCookie;
++	}
+ 	if (proc == NULL) proc = (CopyEventCookieType)_XUnknownCopyEventCookie;
+ 	LockDisplay (dpy);
+ 	oldproc = dpy->generic_event_copy_vec[extension & 0x7F];
+@@ -305,6 +335,12 @@ EventToWireType XESetEventToWire(
+ 	EventToWireType proc)	/* routine to call when converting event */
+ {
+ 	register EventToWireType oldproc;
++	if (event_number < 0 ||
++	    event_number > LastExtensionEvent) {
++	    fprintf(stderr, "Xlib: ignoring invalid extension event %d\n",
++		    event_number);
++	    return (EventToWireType)_XUnknownNativeEvent;
++	}
+ 	if (proc == NULL) proc = (EventToWireType) _XUnknownNativeEvent;
+ 	LockDisplay (dpy);
+ 	oldproc = dpy->wire_vec[event_number];
+@@ -325,6 +361,12 @@ WireToErrorType XESetWireToError(
+ 	WireToErrorType proc)	/* routine to call when converting error */
+ {
+ 	register WireToErrorType oldproc = NULL;
++	if (error_number < 0 ||
++	    error_number > LastExtensionError) {
++	   fprintf(stderr, "Xlib: ignoring invalid extension error %d\n",
++		    error_number);
++	   return (WireToErrorType)_XDefaultWireError;
++	}
+ 	if (proc == NULL) proc = (WireToErrorType)_XDefaultWireError;
+ 	LockDisplay (dpy);
+ 	if (!dpy->error_vec) {
+-- 
+GitLab
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb b/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb
index 3e6b50c0a3..19687d546b 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb
@@ -17,6 +17,7 @@ SRC_URI = "${XORG_MIRROR}/individual/lib/${XORG_PN}-${PV}.tar.xz"
 SRC_URI += "file://disable_tests.patch \
             file://CVE-2022-3554.patch \
             file://CVE-2022-3555.patch \
+            file://CVE-2023-3138.patch \
            "
 SRC_URI[sha256sum] = "2ffd417266fb875028fdc0ef349694f63dbcd76d0b0cfacfb52e6151f4b60989"
 
-- 
2.25.1


