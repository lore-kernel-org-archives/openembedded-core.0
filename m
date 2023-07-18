Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84156EB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 16:01:20 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.11595.1689696077251409141
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 09:01:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=igHzJs4I;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-666e5f0d60bso3741328b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 09:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689696076; x=1692288076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cg9A+b8gyjN0xuWM5fadZbmouT/jBuhjvLUrZZV/mFk=;
        b=igHzJs4I73UJY0XJKoDnprYJAKtmz0ZLqV+azhd+mK9Are5b85aZz+6/vnigM2DzuF
         nE2M5958CpL+wEvRmbgMC7rpHBpiwR72NpK2s5ytP3pIE/hKOIHyfELj+2IdzV8+2Euy
         QtR1rgCXYmgR7i7R0BYTDvqB7uqidY+CPZjB+ewCVV1gq7uJobMn2LbOZixGxWrisyzz
         3Rfbyks48zAyd53IpcKiUCR78gOmREVo3Xpor11C+Ao83TifLXU3AVgW6jRGv51PJos4
         O4qSjeT+XzaD8tb0o+Gy808N6f91YCgY+2Pi+0j7QIBJHubU1byRV1EpcngTKIqWcWN/
         Nrxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689696076; x=1692288076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cg9A+b8gyjN0xuWM5fadZbmouT/jBuhjvLUrZZV/mFk=;
        b=B980T6tuiDClKisFUxWihcaB9Mgxp5pNByhw5xk0KtgIzXPnscR5r6R/VydERUfVhE
         emR52JRjvG9YIGwDBPY6nrgg60mwPpz3YWBeqCpYNrVXf51Z7GJv66VnJqdLFsv8pwc4
         hzp5fGijCj1i689um0iwKp9KR4K5stAJCghHpbgA/opdFnPQ7sDqFNN7G9L3yuugWtHe
         GDJrIiu7TB92eAF6lEk7SDvoA5+WwC6C6JCSXlcICCMEpsKWiydLTcAoqB3KQVIWKux2
         TXDQcq1Y78XerXJwEGa5yuTPp3HFMRQdw70ZLsTEvUSXOw9ylMlY3G/jfXK+KtiBbqMf
         curg==
X-Gm-Message-State: ABy/qLZfdF5lqd8aYeFslE33PQTROm+ZSnZ5kzWgMORDZD7XIDMnLDWM
	P2uiXCtyRg+BelpwWDrWUH1WFN1f3y9QQ0L8JV4=
X-Google-Smtp-Source: APBJJlEpa0ubYkGBI6pmBS2HSll9VXBeiyZtWUzgDJOP2QvUiM/bU/olFk60vmqRRG3O+YKsZVflgQ==
X-Received: by 2002:a05:6a20:1612:b0:12f:1d09:f1c3 with SMTP id l18-20020a056a20161200b0012f1d09f1c3mr15433708pzj.54.1689696076189;
        Tue, 18 Jul 2023 09:01:16 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q17-20020a62e111000000b0064928cb5f03sm1710089pfh.69.2023.07.18.09.01.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 09:01:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/13] libx11: Fix CVE-2023-3138 for dunfell branch
Date: Tue, 18 Jul 2023 06:00:52 -1000
Message-Id: <aed61452f5c9fc377ce3336b765eb1cb195482a8.1689690585.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689690585.git.steve@sakoman.com>
References: <cover.1689690585.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 16:01:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184538

From: Poonam Jadhav <poonam.jadhav@kpit.com>

Add patch to fix CVE-2023-3138 for dunfell branch

Link: https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/304a654a0d57bf0f00d8998185f0360332cfa36c.patch

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


