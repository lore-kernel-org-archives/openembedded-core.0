Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D969C433F5
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 02:33:12 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web09.1960.1639103590464975944
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 18:33:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=XTGQJAPs;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.177, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f177.google.com with SMTP id i63so11822964lji.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 18:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6Nlj7XnaqL7JhoQP2kW9R2VaCJgXI82etWm+Q6c8nO8=;
        b=XTGQJAPswU9zJdKO/3eZiaNJ4a/z05teq7yYdJRMRh1k4IR9KEI+Y8N1NyetEHBQM0
         wKpHmyqjprfvWoWMaUfnpgnfiQPa3G5MuPrZL+JeQ4/xLel/7sZDBeGwW8KuYsSzumuS
         WIEtFB9v9UQkoFBh2i6HvukOzxdFLhQXSbCPW5+Of9mcN7BM4mzjDD01ppeRSzHg2ekB
         NuR2/S8wiA8nD6tF+1tg8d7P8n8bFpNph3HWpeTRFDWQdZs759NwQqlKfWQropSKg0ev
         wy6O046faPB4IXCKDcse9JofLknU3NIsBLIXYN07Um+N1Awx/MLFM8+voJG9GfjzEJM+
         guiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6Nlj7XnaqL7JhoQP2kW9R2VaCJgXI82etWm+Q6c8nO8=;
        b=GoNthYu71LAcSrC/rJz+hOekZ48DL6YwdNp+w/MT+qUYGOFEJvKXu0cPbrA8wqLeLy
         yZTjarl0pxhWMqPd1vq9EBtpF/3LDn++5jM7iPZpWNG7DfHrX3ODcLviawzJpaLSYg2+
         T8OdxiVWLbBPE3INrRqHXAWc6LAv4nHzHGr4Z+p7x+RnPsqX40aSc41gQywmI4R1Yt15
         BPjvjSJEAiiR/p5TflyNj4+iHW+j6+n6YAa+8s+dwxwGhHrQvQK0N8AOzdnGmJkvJJgB
         j6Wr8PPc9imIdX/P9gSzBLptB8uT9rNDpFdAdeTPoeTH1RZrGu/ZKvGr8EFcl5PIB4sL
         n8RQ==
X-Gm-Message-State: AOAM530v8rFzuCY4nEwkGbw4pcz76Okzae+YXvq6gFnezDXJeF5Y/DPm
	R45tdg2QAWX55NW2JE0o+v3ExxDLf9MMfT7k
X-Google-Smtp-Source: 
 ABdhPJzlvR16h4+BR9rwzC6AEjRSPEchZ3Vx7EibIXqbnM2tIg/cLsXvStYeW1AHyZztEt5WRK7H6g==
X-Received: by 2002:a2e:5d6:: with SMTP id 205mr9590888ljf.270.1639103587926;
        Thu, 09 Dec 2021 18:33:07 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 x17sm170308ljp.95.2021.12.09.18.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 18:33:07 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libx11: update to 1.7.3
Date: Fri, 10 Dec 2021 03:33:05 +0100
Message-Id: <20211210023305.4029614-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 02:33:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159490

Dropped upstreamed patches.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libx11/Fix-hanging-issue-in-_XReply.patch | 49 -------------------
 .../xorg-lib/libx11/keysym.patch              | 46 -----------------
 .../{libx11_1.7.2.bb => libx11_1.7.3.bb}      | 19 ++++---
 3 files changed, 12 insertions(+), 102 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11/Fix-hanging-issue-in-_XReply.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11/keysym.patch
 rename meta/recipes-graphics/xorg-lib/{libx11_1.7.2.bb => libx11_1.7.3.bb} (67%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11/Fix-hanging-issue-in-_XReply.patch b/meta/recipes-graphics/xorg-lib/libx11/Fix-hanging-issue-in-_XReply.patch
deleted file mode 100644
index 660e6968bf..0000000000
--- a/meta/recipes-graphics/xorg-lib/libx11/Fix-hanging-issue-in-_XReply.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 5235a7f3692a4c3c90dd4ac1be3c670388904bbe Mon Sep 17 00:00:00 2001
-From: Tatu Frisk <tatu.frisk@ge.com>
-Date: Tue, 14 Mar 2017 14:41:27 +0200
-Subject: [PATCH] Fix hanging issue in _XReply
-
-Assume event queue is empty if another thread is blocking waiting for event.
-
-If one thread was blocking waiting for an event and another thread sent a
-reply to the X server, both threads got blocked until an event was
-received.
-
-Upstream-Status: Backport [93a050c3ad2d2264d3880db3791387b1a9bf2e9e]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
----
- src/xcb_io.c | 19 +++++++------------
- 1 file changed, 7 insertions(+), 12 deletions(-)
-
-Index: libX11-1.6.7/src/xcb_io.c
-===================================================================
---- libX11-1.6.7.orig/src/xcb_io.c
-+++ libX11-1.6.7/src/xcb_io.c
-@@ -620,18 +620,14 @@ Status _XReply(Display *dpy, xReply *rep
- 		if(dpy->xcb->event_owner == XlibOwnsEventQueue)
- 		{
- 			xcb_generic_reply_t *event;
--			/* If some thread is already waiting for events,
--			 * it will get the first one. That thread must
--			 * process that event before we can continue. */
--			/* FIXME: That event might be after this reply,
--			 * and might never even come--or there might be
--			 * multiple threads trying to get events. */
--			while(dpy->xcb->event_waiter)
--			{ /* need braces around ConditionWait */
--				ConditionWait(dpy, dpy->xcb->event_notify);
--			}
--			while((event = poll_for_event(dpy, True)))
--				handle_response(dpy, event, True);
-+
-+			/* Assume event queue is empty if another thread is blocking
-+			 * waiting for event. */
-+			if(!dpy->xcb->event_waiter)
-+			{
-+				while((event = poll_for_response(dpy)))
-+					handle_response(dpy, event, True);
-+                        }
- 		}
- 
- 		req->reply_waiter = 0;
diff --git a/meta/recipes-graphics/xorg-lib/libx11/keysym.patch b/meta/recipes-graphics/xorg-lib/libx11/keysym.patch
deleted file mode 100644
index f4d7419c02..0000000000
--- a/meta/recipes-graphics/xorg-lib/libx11/keysym.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/xorg/lib/libx11/-/merge_requests/79]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From e92efc63acd7b377faa9e534f4bf52aaa86be2a9 Mon Sep 17 00:00:00 2001
-From: Peter Hutterer <peter.hutterer@who-t.net>
-Date: Tue, 27 Jul 2021 11:46:19 +1000
-Subject: [PATCH] makekeys: handle the new _EVDEVK xorgproto symbols
-
-These keys are all defined through a macro in the form:
-   #define XF86XK_BrightnessAuto		_EVDEVK(0x0F4)
-
-The _EVDEVK macro is simply an offset of 0x10081000.
-Let's parse these lines correctly so those keysyms end up in our
-hashtables.
-
-Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
----
- src/util/makekeys.c | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/src/util/makekeys.c b/src/util/makekeys.c
-index e847ef4c..4896cc53 100644
---- a/src/util/makekeys.c
-+++ b/src/util/makekeys.c
-@@ -78,6 +78,18 @@ parse_line(const char *buf, char *key, KeySym *val, char *prefix)
-         return 1;
-     }
- 
-+    /* See if we can parse one of the _EVDEVK symbols */
-+    i = sscanf(buf, "#define %127s _EVDEVK(0x%lx)", key, val);
-+    if (i == 2 && (tmp = strstr(key, "XK_"))) {
-+        memcpy(prefix, key, (size_t)(tmp - key));
-+        prefix[tmp - key] = '\0';
-+        tmp += 3;
-+        memmove(key, tmp, strlen(tmp) + 1);
-+
-+        *val += 0x10081000;
-+        return 1;
-+    }
-+
-     /* Now try to catch alias (XK_foo XK_bar) definitions, and resolve them
-      * immediately: if the target is in the form XF86XK_foo, we need to
-      * canonicalise this to XF86foo before we do the lookup. */
--- 
-GitLab
-
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb b/meta/recipes-graphics/xorg-lib/libx11_1.7.3.bb
similarity index 67%
rename from meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.7.3.bb
index f429daaf47..f55252b924 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.7.3.bb
@@ -10,12 +10,13 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/libx11:"
 
 PE = "1"
 
-SRC_URI += "file://Fix-hanging-issue-in-_XReply.patch \
-           file://disable_tests.patch \
-           file://keysym.patch \
-           "
+# temporarily override SRC_URI which is hard-coded in xorg-lib-common.inc
+# since new versions of packages use a new compression format - .tar.gz
+SRC_URI = "${XORG_MIRROR}/individual/lib/${XORG_PN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "1cfa35e37aaabbe4792e9bb690468efefbfbf6b147d9c69d6f90d13c3092ea6c"
+SRC_URI += "file://disable_tests.patch \
+           "
+SRC_URI[sha256sum] = "dfd1343db3a0e523f1bb97d5ba71453c79eee78a77e51ca9f8dfef7131c6f0fe"
 
 PROVIDES = "virtual/libx11"
 
@@ -23,8 +24,12 @@ XORG_PN = "libX11"
 LICENSE = "MIT & MIT-style & BSD-1-Clause & HPND & HPND-sell-variant"
 LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
 
-DEPENDS += "xorgproto xtrans libxcb"
-DEPENDS += "xorgproto-native"
+DEPENDS += "xorgproto \
+            xtrans \
+            libxcb \
+            xorgproto-native \
+            autoconf-archive \
+           "
 
 EXTRA_OECONF += "--with-keysymdefdir=${STAGING_INCDIR}/X11/ --disable-xf86bigfont"
 EXTRA_OEMAKE += 'CWARNFLAGS=""'
-- 
2.25.1


