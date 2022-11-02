Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27781C4167B
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 02:42:32 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web09.1955.1667356949082934658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 19:42:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=E54IQzfd;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id l6so14990431pjj.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 19:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xZEHOQFbsB0dfJokELpO+ERnsDScGGknmyXG0417CDg=;
        b=E54IQzfdP/g9Tq1c03itQhnuKYXmYXnlK9mdTJ8ai6/XK8bB/nev96SdV2xh96TTvN
         thZdprftnoBjqBduQaY5F1HK9kCk185B7Yy1uUc6KaER0Qwd98XJBZhsM2O1tjCKDz+F
         MgTeBs/zy6Fs8HbqeRnN/j5Q9P8+/N6NqPgZ02JjCIJvRdQJw+F4efvkisH9DSYXvXqN
         nEFDFPwdwiaSwFfmLRrGmxatORM/9dIpLnWPC8IrNfrnGMdFOcWf/iqV2qk8AUT3kF7w
         yJ8oT1xQ6wvPUYyFv1Yz+qbVWbgkSObihh2lMl8MNh+g/GvEhHY5Uo93oxF+dKhaZJ6Z
         yBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZEHOQFbsB0dfJokELpO+ERnsDScGGknmyXG0417CDg=;
        b=WMuOVgQLiYdpmX1tmiG047h/3SFrYZyAaCiqvV4ZgafQq0puKB8Z5wstpODxn53Dcm
         l3p+OS5pzUXsghDP1P6qOJnGKP6disv9oxucec7dbe33XNMjMtaTXKN++QAbYy2wNOxG
         o9c57fXPPRu4P9FlCU7Gf2LDx5Wg4g66w+6tHNL4BMeufS2lnODMOWsbj8qVI4Eh5mBI
         8ofRKWMadBcZDlqQTjjdaZS298XLtR8WrMPpNPTl67EVvQjnpDY4vyqgvAq5ZI89SQry
         G3Po5sy6kGGnXrpqnirZjUS6wkwbmnjCQnkmcuCGMcQ01ZvzkHuZX5X3kvO8B7+BiOeV
         GvZQ==
X-Gm-Message-State: ACrzQf34YJ1ksLlnzX/1/ygo5zvc3iscv8bx2eYgMKA7t71NCuh9tiF5
	1VI0MSoFIQmBDjjS2Wh4yg2fHWAk67Yay/3P
X-Google-Smtp-Source: AMsMyM43spwX1rHKpqHTagHPiID49k8C5hyN8vfItmmC3kCBFZzysWYwIWY3PLJCyvRko40Orv86xA==
X-Received: by 2002:a17:902:b117:b0:186:a1fd:c3df with SMTP id q23-20020a170902b11700b00186a1fdc3dfmr22191457plr.23.1667356948081;
        Tue, 01 Nov 2022 19:42:28 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id d18-20020a170902e15200b00186da904da0sm1462846pla.154.2022.11.01.19.42.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 19:42:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 02/20] libx11: apply the fix for CVE-2022-3554
Date: Tue,  1 Nov 2022 16:41:52 -1000
Message-Id: <3a65a787d1b53f57cd0eedbf7a70ce6dcde0d148.1667356805.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667356805.git.steve@sakoman.com>
References: <cover.1667356805.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 02:42:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172542

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 5d30f124274d2822d72b56f84eb8c8ae64e31e0d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ak-in-XRegisterIMInstantiateCallback.patch | 57 +++++++++++++++++++
 .../recipes-graphics/xorg-lib/libx11_1.8.1.bb |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/0001-fix-a-memory-leak-in-XRegisterIMInstantiateCallback.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11/0001-fix-a-memory-leak-in-XRegisterIMInstantiateCallback.patch b/meta/recipes-graphics/xorg-lib/libx11/0001-fix-a-memory-leak-in-XRegisterIMInstantiateCallback.patch
new file mode 100644
index 0000000000..722116c07e
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/0001-fix-a-memory-leak-in-XRegisterIMInstantiateCallback.patch
@@ -0,0 +1,57 @@
+CVE: CVE-2022-3554
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 1d11822601fd24a396b354fa616b04ed3df8b4ef Mon Sep 17 00:00:00 2001
+From: "Thomas E. Dickey" <dickey@invisible-island.net>
+Date: Tue, 4 Oct 2022 18:26:17 -0400
+Subject: [PATCH] fix a memory leak in XRegisterIMInstantiateCallback
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
+
+    and XMODIFIERS is:
+
+        @im=ibus
+
+Signed-off-by: Thomas E. Dickey <dickey@invisible-island.net>
+---
+ modules/im/ximcp/imInsClbk.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/modules/im/ximcp/imInsClbk.c b/modules/im/ximcp/imInsClbk.c
+index 95b379cb..c10e347f 100644
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
+2.34.1
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb b/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb
index 1dcc3abee9..9ff196c897 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb
@@ -15,6 +15,7 @@ PE = "1"
 SRC_URI = "${XORG_MIRROR}/individual/lib/${XORG_PN}-${PV}.tar.xz"
 
 SRC_URI += "file://disable_tests.patch \
+            file://0001-fix-a-memory-leak-in-XRegisterIMInstantiateCallback.patch \
            "
 SRC_URI[sha256sum] = "1bc41aa1bbe01401f330d76dfa19f386b79c51881c7bbfee9eb4e27f22f2d9f7"
 
-- 
2.25.1


