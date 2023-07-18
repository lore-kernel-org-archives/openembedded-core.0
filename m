Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B87C04A6A
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 14:26:30 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.8998.1689690383808053410
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 07:26:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=vVQvxkXD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-668709767b1so4183982b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 07:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689690383; x=1692282383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LLPaWxGlFRLqKaP27e1awbWP3IA3/ln6sTVDiWXkoQA=;
        b=vVQvxkXDb10StPHVt+PvYjSuy8mdXH1g3BitrzUMgSk9wv+7RRvUJ0NkJ9pM5NbLnB
         w6kkni3B5PHn+dnyHnTKXKs0XaX+8d45iQQVUa9mhDM5GPheO5UzqSuwlyN8UsmPP9KO
         3qouFiGCXpYCfI8vUzcxaTCK0k9pcP8zvEyMK8dn/i2gXNcYIHDVxGCdyeeQckJRzzh3
         0MZ/CWcZt9Lqb/4nYDh0OYl5IUZW0xWAbh37SsVSeKF5b3UDyVV5SFFHLCpVbvUh5KYK
         MR7+OSpgc7QxfPX4PdBLTgs3DyUq8c7WwwkFfRftkJ64KWLSaL74NaJm3UGdyHWC0FCI
         wPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689690383; x=1692282383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LLPaWxGlFRLqKaP27e1awbWP3IA3/ln6sTVDiWXkoQA=;
        b=WTTGHH3jEmOP2lfCHE7QaCHHXjywI19FN8yFWEtc0BeVQrPcDtUoCPRIquOc1EayPo
         ud54BOoonWztf5UFetDKb1fYLBBRbLfpCFLOPbEZFIQQ/qF4zYbfw8vMnnhQD2ix7qdS
         8wH1+KMQeX2imlnXAwnbvpzu+TJve1F5kPW7g9LG2T532EoHR082/pD1q7hY9zxSWDjO
         HMTw8WJw7WFYO0RpiVGN4YECSoUXCmGEGlOAb4RVrt0xlcg+p8jazkn+iVw61fRp2B4Q
         2FLw2FE5CXBbiqaSrBB61k95KLbi/vM/jdBpFhjoC46rtg8aXqYHZWhVf53OWA8b5GVI
         IAPQ==
X-Gm-Message-State: ABy/qLZyvJ8qa+Bqt1yrOR6mLXNcozpcxOGoWV6LTTfF/Yq5qLgztStt
	zM18dlJ5299Clc0ZhS/w/Q8PMCRvsi3G1/WdIDE=
X-Google-Smtp-Source: APBJJlE3v2NTsQs6e0cj0boLlX6AW0JGouawthhp1RwmAhvOBHgQHNEyNHtFdPcolTsttSm7QQGrtQ==
X-Received: by 2002:a05:6a00:2389:b0:66a:4a45:e017 with SMTP id f9-20020a056a00238900b0066a4a45e017mr3266729pfc.20.1689690382784;
        Tue, 18 Jul 2023 07:26:22 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020aa78d18000000b006732786b5f1sm1581732pfe.213.2023.07.18.07.26.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 07:26:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/27] libx11: Fix CVE-2023-3138 for kirkstone branch
Date: Tue, 18 Jul 2023 04:25:38 -1000
Message-Id: <5491531d4681d3df5a34ebc180e29a8bf4e09e67.1689689618.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689689618.git.steve@sakoman.com>
References: <cover.1689689618.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 14:26:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184508

From: Poonam Jadhav <poonam.jadhav@kpit.com>

Add patch to fix CVE-2023-3138 for kirkstone branch

Link: https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/304a654a0d57bf0f00d8998185f0360332cfa36c.patch

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


