Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 132B8C5479D
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:38:16 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.16446.1672594689110446248
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:38:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ezwe+nsn;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id k19so9734362pfg.11
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9lVorAtnDG8JQ8y3InnADrhB8X0ePAy9IN/wDA0jF3w=;
        b=ezwe+nsnTZbvKX4wFfaLnByJDCyEK/wTbuCa4CkskrAxY8qKPwz6Ox2B+yax+sZVsU
         XUHSZoCHH9Ws8D9Bl1NYWEfUZQnBC5niJjAVp1PijjO3Uhjh7Otrq6AvWk1usSoJUo7B
         Qg/hL1ye/SyGQrkvZrB9AMAxzHvlrNKGrUUR6Dn96IJAtq2F4iW82WE7ybLsGljWLf+x
         683Ip7K1mGiA+FD7hyNe4QJBm3Agk3aLPp5Yy5nsk1W2FG1wDU8i4ckMH/4w0TAHC9FH
         3P2Nf5GkL68VtZubnkNLauF7Bh3ZgnDysiE1i9PeeSsn5ZwFD+dHQCkpSNylvTk+oB0c
         I25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9lVorAtnDG8JQ8y3InnADrhB8X0ePAy9IN/wDA0jF3w=;
        b=Gv94P75r7N57vBzDx2Vlb4HNWde0z7GeehJGi5nX2PDGxFPrRW5DMmm+ugNoiqbd8f
         dJQDGTestigARPqDCc7Co+PlGxSW2Nv/vYcdtmK0ZrJpXGagCm4C1lPXuuL5f/w9pe0w
         rETJa+3FNJRDG/TCGiR0eV4mNjvDFPMei44AQmoKZM4nZEQrzg6YZP74NP8o3uUWX+CN
         y+2sX+wNt7qYG5Y4d58/sUufrHlgiZDyMYKICCsee8hMjYmkmftnyQXk5dc8MFMWFxGa
         29M5zw2tm1vSHV/Q/qalzYvbtYc/376+fvLsO41oVElw2Uivb9/gQyDkRAPv1eOwYb7o
         Q4pQ==
X-Gm-Message-State: AFqh2kpSR48T6makE4LCUVXlqoRvOyXhLznY7dsmLHWmSCC8f5cuk8mo
	4ORxulf5xVNP00yWPM/fQiujGy6C4pgA4bc38Ns=
X-Google-Smtp-Source: AMrXdXstC6s0TwYZY5NTixw3ud/hRecLBz0bcY+IBys1ynZSQnXwtC0iJV0Y3i1XRh8r6grr7Uogrg==
X-Received: by 2002:a62:ed08:0:b0:577:272f:fdb with SMTP id u8-20020a62ed08000000b00577272f0fdbmr32307585pfh.29.1672594688113;
        Sun, 01 Jan 2023 09:38:08 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id v63-20020a626142000000b005828071bf7asm102299pfb.22.2023.01.01.09.38.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:38:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/29] libX11: CVE-2022-3554 & CVE-2022-3555 Fix memory leak
Date: Sun,  1 Jan 2023 07:37:28 -1000
Message-Id: <3c092f7af89e98758d0cfecdee3c594e18e8d21e.1672594521.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594521.git.steve@sakoman.com>
References: <cover.1672594521.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175194

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/1d11822601fd24a396b354fa616b04ed3df8b4ef && https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/8a368d808fec166b5fb3dfe6312aab22c7ee20af

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


