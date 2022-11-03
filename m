Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F29C433FE
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 06:16:10 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web12.16362.1667456161896800863
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 23:16:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=P46HNrxE;
 spf=pass (domain: mvista.com, ip: 209.85.214.169, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f169.google.com with SMTP id 4so1041400pli.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 23:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bAwalcoJF4Up+h0yEaCZ4UF1dxtcKd1BmJX8IG8P1HY=;
        b=P46HNrxExSHwplKvjW6pNq7U/LYLQqWKwLhLcPs1SJjddzK31lRMsNu06kRDg1f5qv
         QwEZPOJNgZE3Qij9s1JFgYWNuE4CC23gAf7lraSw5PSG2igDKwgAf9eunvL3h8QhOrlv
         xNViGfNGsVSJPXVGTXdRwvpqd9VZIDMr8Qg30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bAwalcoJF4Up+h0yEaCZ4UF1dxtcKd1BmJX8IG8P1HY=;
        b=JZKTvv/rWzhrZO28ctVISiUkclP+Q1X8uAXFVXxTp09mGGxUs/y2M+ffQtotTLqt50
         9BAVwVawwWYh/RLBBZ5OLcRx1U1CjyIoi85ooe7z3WH/3SdzMwNB4ucZOD756vpsKmWD
         c+p3vh2Cs7CYC8aidjPw0T4Nr58ac5u6G2Bsxlpp8n/KIxlQlQ6taxXSPA3t/iowszmJ
         8vWISDGXKF6eo8yqWjj3WBW1hjxPa4FmFVhvgkZhfjeqgH/l0aS3VtG+wiMQ0XrFGTdH
         YOTIZEWZICTkHVqrNw3MzYkqxwz7c+OCkrt9pcYLqx/zZoQKjyTorqZEKfeGUL/McLm3
         oyxQ==
X-Gm-Message-State: ACrzQf1D7jRXdyC6jDtxOP6ry4mWKERz9J30+KykzfbenEMa+lB1CUNV
	JfVFYJSiD/SseizexI8rCjEwKW8M9wL+xw==
X-Google-Smtp-Source: AMsMyM4YbecGKXi5a4VSDPTEYgg2cKxx92Q1BMrSi5gi6EvMDj9CmphmWWaqkVCwLeQU/E+ilwqcVA==
X-Received: by 2002:a17:90a:3e85:b0:213:36b6:fa16 with SMTP id k5-20020a17090a3e8500b0021336b6fa16mr29004695pjc.56.1667456160884;
        Wed, 02 Nov 2022 23:16:00 -0700 (PDT)
Received: from MVIN00024 ([150.129.170.149])
        by smtp.gmail.com with ESMTPSA id u16-20020a170902e5d000b001767f6f04efsm9476828plf.242.2022.11.02.23.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 23:16:00 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Thu, 03 Nov 2022 11:45:54 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] libX11: CVE-2022-3554 & CVE-2022-3555 Fix memory leak
Date: Thu,  3 Nov 2022 11:45:53 +0530
Message-Id: <20221103061553.106084-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 06:16:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172611

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
index 0000000000..74e447608d
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3554.patch
@@ -0,0 +1,58 @@
+From 6a72a51768355746b5afb693920394d9727ae6c1 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Thu, 3 Nov 2022 09:27:02 +0530
+Subject: [PATCH] CVE-2022-3554
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
index 0000000000..6ddb86776e
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3555.patch
@@ -0,0 +1,40 @@
+From cb54a4b588b0c315d3e407859ff497c17606649c Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Thu, 3 Nov 2022 09:30:05 +0530
+Subject: [PATCH] CVE-2022-3555
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


