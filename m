Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AEDEC4332F
	for <webhook@archiver.kernel.org>; Mon, 26 Dec 2022 04:45:28 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.131381.1672029924743529602
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Dec 2022 20:45:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dWTexmsK;
 spf=pass (domain: mvista.com, ip: 209.85.214.179, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f179.google.com with SMTP id m4so9883042pls.4
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Dec 2022 20:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ktdEVze47iuwiqOfGixqj0BBAzc/Qnir25I5mDkmrw=;
        b=dWTexmsK2aOD7ejVRv8UHBQpGBVcx2KoZllkN90XwQMRzL2h/gpwU7NsrBp2wH79e0
         5Wer0vIVIl+FiPboNTw+F3yoUy6YkemTEYDbn8zZ0QYDTwcUZJ2BT24TKf2nWMD6ND+I
         8CyDYuAFlwkhzoT/s2bl6PDFLl3vJ3agpHPkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ktdEVze47iuwiqOfGixqj0BBAzc/Qnir25I5mDkmrw=;
        b=v2A5msDA0U70EXFflESm9kZNboPgpRrx//DhiPABoGU8rcrpaRV0bEoyzhQc8h2pUB
         INaXHNXZ/8Kz0x1GAA6yklHEJTkvDovIg1UXS/gAZy/YUpGrUHsu4m31OWFMEgRFN+x6
         nAmgmv7vl4ip7GTh4ka5V+w+wFrO3fUMbqmL9jCejKiJVKUufdSvibyY30+eGHgCQ7s8
         JBTE6fsc/XYg41L5MWzBya0GWIFxnpKU9WHyGGGBFri+KwANDcBMJpPHZf2fyZWDy93b
         mazEiy4ZZWHqCu59spZDnoP92XcXzLow8TKNQzmRM2wtqPvsGh1Z0qi0pxgWLhzg/0/m
         4/jw==
X-Gm-Message-State: AFqh2krM3cIE7f2Go8e1+DZ1K4tqLmwNNFoLEIC2mg2MzzOGm05QF8gz
	p0zRu9uLriBO95hfAZGddQcuMimxuIJsX9sz
X-Google-Smtp-Source: AMrXdXsMfSRQ14yBWhX5dJaWWmnaVjgrGZRsA4/Ib+SJknuaRWSvlAa2/g5aXYYfOu5RVHxvxsCKYg==
X-Received: by 2002:a17:902:b588:b0:189:dfb0:d380 with SMTP id a8-20020a170902b58800b00189dfb0d380mr20527710pls.33.1672029923908;
        Sun, 25 Dec 2022 20:45:23 -0800 (PST)
Received: from MVIN00024 ([27.121.101.116])
        by smtp.gmail.com with ESMTPSA id bf4-20020a170902b90400b00186b7443082sm6049902plb.195.2022.12.25.20.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 20:45:23 -0800 (PST)
Received: by MVIN00024 (sSMTP sendmail emulation); Mon, 26 Dec 2022 10:15:17 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH v2] libX11: CVE-2022-3554 & CVE-2022-3555 Fix memory leak
Date: Mon, 26 Dec 2022 10:15:16 +0530
Message-Id: <20221226044516.6012-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Dec 2022 04:45:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175010

Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/1d11822601fd24a396b354fa616b04ed3df8b4ef && https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/8a368d808fec166b5fb3dfe6312aab22c7ee20af

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../xorg-lib/libx11/CVE-2022-3554.patch       | 58 +++++++++++++++++++
 .../xorg-lib/libx11/CVE-2022-3555.patch       | 40 +++++++++++++
 .../xorg-lib/libx11_1.7.3.1.bb                |  2 +
 3 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3554.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3555.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3554.patch b/meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3554.patch
new file mode 100644
index 0000000000..973f328304
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3554.patch
@@ -0,0 +1,58 @@
+From 1d11822601fd24a396b354fa616b04ed3df8b4ef Mon Sep 17 00:00:00 2001
+From: "Thomas E. Dickey" <dickey@invisible-island.net>
+Date: Tue, 4 Oct 2022 18:26:17 -0400
+Subject: [PATCH] fix a memory leak in XRegisterIMInstantiateCallback
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/1d11822601fd24a396b354fa616b04ed3df8b4ef]
+CVE: CVE-2022-3554
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+fix a memory leak in XRegisterIMInstantiateCallback
+
+Analysis:
+
+    _XimRegisterIMInstantiateCallback() opens an XIM and closes it using
+    the internal function pointers, but the internal close function does
+    not free the pointer to the XIM (this would be done in XCloseIM()).
+
+Report/patch:
+
+    Date: Mon, 03 Oct 2022 18:47:32 +0800
+    From: Po Lu <luangruo@yahoo.com>
+    To: xorg-devel@lists.x.org
+    Subject: Re: Yet another leak in Xlib
+
+    For reference, here's how I'm calling XRegisterIMInstantiateCallback:
+
+    XSetLocaleModifiers ("");
+    XRegisterIMInstantiateCallback (compositor.display,
+                                    XrmGetDatabase (compositor.display),
+                                    (char *) compositor.resource_name,
+                                    (char *) compositor.app_name,
+                                    IMInstantiateCallback, NULL);
+    and XMODIFIERS is:
+
+        @im=ibus
+
+Signed-off-by: Thomas E. Dickey's avatarThomas E. Dickey <dickey@invisible-island.net>
+---
+ modules/im/ximcp/imInsClbk.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/modules/im/ximcp/imInsClbk.c b/modules/im/ximcp/imInsClbk.c
+index 95b379c..c10e347 100644
+--- a/modules/im/ximcp/imInsClbk.c
++++ b/modules/im/ximcp/imInsClbk.c
+@@ -212,6 +212,9 @@ _XimRegisterIMInstantiateCallback(
+     if( xim ) {
+ 	lock = True;
+ 	xim->methods->close( (XIM)xim );
++	/* XIMs must be freed manually after being opened; close just
++	   does the protocol to deinitialize the IM.  */
++	XFree( xim );
+ 	lock = False;
+ 	icb->call = True;
+ 	callback( display, client_data, NULL );
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3555.patch b/meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3555.patch
new file mode 100644
index 0000000000..919e7a00fb
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3555.patch
@@ -0,0 +1,40 @@
+From 8a368d808fec166b5fb3dfe6312aab22c7ee20af Mon Sep 17 00:00:00 2001
+From: Hodong <hodong@yozmos.com>
+Date: Thu, 20 Jan 2022 00:57:41 +0900
+Subject: [PATCH] Fix two memory leaks in _XFreeX11XCBStructure()
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/8a368d808fec166b5fb3dfe6312aab22c7ee20af]
+CVE: CVE-2022-3555
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+Fix two memory leaks in _XFreeX11XCBStructure()
+
+Even when XCloseDisplay() was called, some memory was leaked.
+
+XCloseDisplay() calls _XFreeDisplayStructure(), which calls
+_XFreeX11XCBStructure().
+
+However, _XFreeX11XCBStructure() did not destroy the condition variables,
+resulting in the leaking of some 40 bytes.
+
+Signed-off-by: default avatarHodong <hodong@yozmos.com>
+---
+ src/xcb_disp.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/xcb_disp.c b/src/xcb_disp.c
+index 70a602f..e9becee 100644
+--- a/src/xcb_disp.c
++++ b/src/xcb_disp.c
+@@ -102,6 +102,8 @@ void _XFreeX11XCBStructure(Display *dpy)
+ 		dpy->xcb->pending_requests = tmp->next;
+ 		free(tmp);
+ 	}
++	xcondition_clear(dpy->xcb->event_notify);
++	xcondition_clear(dpy->xcb->reply_notify);
+ 	xcondition_free(dpy->xcb->event_notify);
+ 	xcondition_free(dpy->xcb->reply_notify);
+ 	Xfree(dpy->xcb);
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb b/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb
index 0c3abcd896..3e6b50c0a3 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb
@@ -15,6 +15,8 @@ PE = "1"
 SRC_URI = "${XORG_MIRROR}/individual/lib/${XORG_PN}-${PV}.tar.xz"
 
 SRC_URI += "file://disable_tests.patch \
+            file://CVE-2022-3554.patch \
+            file://CVE-2022-3555.patch \
            "
 SRC_URI[sha256sum] = "2ffd417266fb875028fdc0ef349694f63dbcd76d0b0cfacfb52e6151f4b60989"
 
-- 
2.25.1


