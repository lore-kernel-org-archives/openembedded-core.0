Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB134EB64D9
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 11:18:49 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.36922.1688987926893073823
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 04:18:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=PmHrATBc;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ppjadhav456@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-66872d4a141so2674837b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 04:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688987926; x=1691579926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Hw0FXW8GT8QlCnZTIpGXxFpgcz9OZr62EJGqpM+wbk=;
        b=PmHrATBc3opG2ESbpl/ws0sHVQoB0p+FqGAnOm4vTp0lXxfKIjpOY+r4T8ctPxcb8M
         n+Pysv4ixS5jDB9dOLzUVZ6HHKmBn8qxgxUKX9St4rnM40wqn0JoPGrk8gqiTar/TJp7
         HANycFcGjqWFR8LbadPlIEBWoYeIuwY9tCEQK+DrK02nw8eqiJBdbbBZchgZYd7CxebR
         QMY15P5/mOvKEeI7Mj/ul4Q+/Mwltli+nYmFi8JZVyiWFzsBQmiYByMGbs0UW/5NudCh
         VDLQZEnNEqbtV/lCdd+3ZscVNdT/JGjbX5Zs1ZY7iZzVDXt9xYOvaeZOv+8qNIpyofsh
         gU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688987926; x=1691579926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Hw0FXW8GT8QlCnZTIpGXxFpgcz9OZr62EJGqpM+wbk=;
        b=RXGru6pqoDhDyBzAq59qYI2e5hu9HT37q0C4i0+i0+rDWf15BcMwnuWrXqxohnGWFp
         O4LVW8lnism7lNUAnsGqNfgzITGjQfM/8HtFtZF84xprPY71F+YM2L/9ibyIg8eG0Bj3
         4WIwaK2aAkSA0D4UrEN1Ye+PVJ5kAiCjKmQkz67y1LhBk8O5EtviV+xs1O7bN31n4yu2
         oWS4hzAHOlKnSykP0DqjVQd9ld3oFJgLdC2alu+uBqtNcx8UK/u+4Z9dYrO+Qpix3sbQ
         PsWeGl2tOpeJIFHHRGmUDgc+IBcQOpgq2Y+w5mW/pGuAAIJHrOGRiYWi9TCMq6XkNXcf
         AWYw==
X-Gm-Message-State: ABy/qLYq0sMi62mf7m5rAcnBSZCe/O8ot4xbS/Jp3CZESpCDSLiOcDvi
	GSk4/+qawt7/JLc7VaATMVjAyj10itaPvg==
X-Google-Smtp-Source: APBJJlFXrHeWwZfSsZ4twq86l09Bfflx+IOi8XTQY0g2JmhVKTnSAQYql8zpnrSPOGl/Av/F8nHNTA==
X-Received: by 2002:a05:6a20:8f11:b0:12e:7c29:a6dd with SMTP id b17-20020a056a208f1100b0012e7c29a6ddmr11042652pzk.43.1688987925817;
        Mon, 10 Jul 2023 04:18:45 -0700 (PDT)
Received: from localhost.localdomain ([43.231.237.241])
        by smtp.gmail.com with ESMTPSA id c1-20020a170902848100b001b9e9f191f2sm384009plo.15.2023.07.10.04.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 04:18:45 -0700 (PDT)
From: Poonam Jadhav <ppjadhav456@gmail.com>
To: openembedded-core@lists.openembedded.org,
	poonam.jadhav@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][dunfell][PATCH] libx11: Fix CVE-2023-3138 for dunfell branch
Date: Mon, 10 Jul 2023 16:48:37 +0530
Message-Id: <20230710111837.25378-1-ppjadhav456@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 11:18:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184070

From: Poonam Jadhav <poonam.jadhav@kpit.com>

Add patch to fix CVE-2023-3138 for dunfell branch

Link: https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/304a654a0d57bf0f00d8998185f0360332cfa36c.patch

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
---
 .../xorg-lib/libx11/CVE-2023-3138.patch       | 111 ++++++++++++++++++
 .../recipes-graphics/xorg-lib/libx11_1.6.9.bb |   1 +
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
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
index ad3fab1204..568162a911 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
@@ -18,6 +18,7 @@ SRC_URI += "file://Fix-hanging-issue-in-_XReply.patch \
             file://CVE-2021-31535.patch \
             file://CVE-2022-3554.patch \
             file://CVE-2022-3555.patch \
+            file://CVE-2023-3138.patch \
 "
 
 SRC_URI[md5sum] = "55adbfb6d4370ecac5e70598c4e7eed2"
-- 
2.25.1


