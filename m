Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 504ECC433FE
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 16:04:12 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.17771.1667750647610177340
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 08:04:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=4WJ5o30n;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 78so8409551pgb.13
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 08:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ICLTZ5nuihrMT4rNxb0FXkJWhjj5eihvwL7MvjD0Tc=;
        b=4WJ5o30nj8szMLE9OHGJoW/IbjEaen7/e+Hs8ZRlE1aZOmDZr0nMiMCmyu/bizmTwB
         6XFnWFPe/MNldgeCzHWyZshYds/oEUPL9BvhWrztu23Up6bJcqn8a1jacDIsTsdypKew
         8C+82OkWUYnN3CO+2XtN7W8ezegK9DdfAQkreu7JrUIZ1Z0guaoRbR3hgtAwxJco8+CA
         Slh6mEPq1lbFuUPiIJ1HHv2fMPk0fVMsrOXxWJwe1e8v1X36KsYVDWk3KRlShy8ZAMQb
         ZOUs1etZ+jfZrjutqNx5BLC7g5vplNwkznXe66PaxdCkZRAdkjjrp1AQlruM4o4OvyQm
         Fz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ICLTZ5nuihrMT4rNxb0FXkJWhjj5eihvwL7MvjD0Tc=;
        b=obqJwCf+FFhft5GRJxXT26cpfUFyYCNaZuJCm7nUyFjYdTdooq1LqADt9jutki0LYV
         m9A991w4EKE1jX/IuP50nhbUz5C220sxfiHY8iPd9fcLWdUpLACSthPVUPm8VEgXQf/F
         hlcOnNC7W/d/dngsYOrOxLlEWArcaEyMM+9XOItoZeeQWY0pyAMJX+ulL0qhOFNDJWkr
         IQ9mAzhylYMsTYy2RZ06qmRkz1nevSvd5Vdsy0lCNeIEYahMxd5zzE6YiKcmW6VNzhbW
         NVY1fP0V4P6AwxkMlS76rzoapczD2IcZYY7Mj8laQUxY0sEzkVX7j7NVQNlyAK9ZsfLD
         XdJA==
X-Gm-Message-State: ACrzQf18x+hxlzEUa9yi67eIEaQ7BU5t6cgXThZ5qKsxEctccGP6ftVg
	Aye1pCcLX5EbEZ/MyvRGyvGP66tnPEKPZyu7
X-Google-Smtp-Source: AMsMyM6lmNlrbezsksTI+K2IU2WsyhSZHKCcGMQOqV3w/Q4IMRTfT2tWa5PGM8u5sEM8Bl3+GSa1FA==
X-Received: by 2002:a63:e53:0:b0:46e:c7be:16fc with SMTP id 19-20020a630e53000000b0046ec7be16fcmr647160pgo.462.1667750646612;
        Sun, 06 Nov 2022 08:04:06 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s11-20020a170902ea0b00b0018700ba9090sm3294683plg.185.2022.11.06.08.04.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 08:04:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/8] libX11: CVE-2022-3554 Fix memory leak
Date: Sun,  6 Nov 2022 06:03:47 -1000
Message-Id: <1d36df9c9ec0ea13c4e0c3794b0d97305e2c6ac1.1667750511.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667750511.git.steve@sakoman.com>
References: <cover.1667750511.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 16:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172808

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/1d11822601fd24a396b354fa616b04ed3df8b4ef

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xorg-lib/libx11/CVE-2022-3554.patch       | 58 +++++++++++++++++++
 .../recipes-graphics/xorg-lib/libx11_1.6.9.bb |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3554.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3554.patch b/meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3554.patch
new file mode 100644
index 0000000000..fb61195225
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3554.patch
@@ -0,0 +1,58 @@
+From 8b51d1375a4dd6a7cf3a919da83d8e87e57e7333 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Wed, 2 Nov 2022 17:04:15 +0530
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
+index 961aaba..0a8a874 100644
+--- a/modules/im/ximcp/imInsClbk.c
++++ b/modules/im/ximcp/imInsClbk.c
+@@ -204,6 +204,9 @@ _XimRegisterIMInstantiateCallback(
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
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
index ff2a6f7265..72ab1d4150 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
@@ -16,6 +16,7 @@ SRC_URI += "file://Fix-hanging-issue-in-_XReply.patch \
             file://CVE-2020-14344.patch \
             file://CVE-2020-14363.patch \
             file://CVE-2021-31535.patch \
+            file://CVE-2022-3554.patch \
 "
 
 SRC_URI[md5sum] = "55adbfb6d4370ecac5e70598c4e7eed2"
-- 
2.25.1


