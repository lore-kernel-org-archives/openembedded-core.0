Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A014BE77174
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 06:49:51 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.8180.1733294988588251230
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 22:49:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i0Bt2P3r;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-434a2f3bae4so59296755e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733294987; x=1733899787; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzchOotB9g3/oGpH16j8Cu8DCZRxWGOAhR5jp0lLYDo=;
        b=i0Bt2P3rTDZ6MkAtw4SEAsZBVTqOhcZj/8JyENuiQxHf5c1ZbPGbJSAaShMmCt+e9Q
         RbT4V8pRNbYQU2mGw51X04gbvTfHbmuMofFBoqsebfPKk3Oz0868pMjmUuGT8QnzvLFj
         O/79GgxyYrakIcyfYSbpp8bM+HV5iGx+w7Wg7MDLRO7OlnrXEIcgIsPHs+UimcBy7EJY
         InJY+oLDg2PiwoTBnx71d3w2JteNPsHISgmwrW+USnJ+zaeLCQxghUrktLa9EzHOP3r9
         1aQ2rgLFed967R839NsiWLqNyoOhK612REE72jJs6QaxWNdyy+PeRsWaqUkd44yucT4W
         xXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733294987; x=1733899787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vzchOotB9g3/oGpH16j8Cu8DCZRxWGOAhR5jp0lLYDo=;
        b=PzzwzQGloTLxeM7ZhNpvjXtqWRbg7CvJqBEnqbDfDpme3UUjSJgnZYSlstwMl/pxqU
         KqForQakarH+srdEecxA/ThIQcFtM8L7UokZe1LZd0RBvta3qjUKqjZOV1MEIegDE1WI
         sK+PiQ5NcZ6qMbKoFxvm/j0gOG+pEwZkDhq/H3IkLx3QUSFwdA4siiVWHS8b0Oh/ezpV
         HOMqPeKqz3qT2sGpqmObbAxIj/m0+Rknlz+O5nqot2iG6D6MITPecu6YosY5DrwoEt4f
         E1iVxuyTC/IalQHuowqk41DdDLtdHWlBZ7Q682HLpmyH7kLxh448FeY3fsOLOHNQj434
         6tLw==
X-Gm-Message-State: AOJu0Ywbpy03A2KDw++mkY4KJhCE6b3pgbS2fmrIQmDnSjdDW9MrCXV5
	dxST9eNWBKZ1m5mntr3j55kpSUFPR3s1QPzNnNwqGb07OT82WdS+NOhnuQ==
X-Gm-Gg: ASbGncsojwArjgUffCDx2PpZZqNkwYxsDKGXeJ+Brjg4oiUI7AN8KCakYSDpm5Kct36
	OaqMsqZ88gwXBd+dkvmKCy0VW8q7IPMZ/UBmlWf24JMl04rYPVuFIQr6BucGRXBYOg4IqUUYqbi
	qzX7/mwx7nmqMfKF8itcI7WOZMY/QOJbFWxZCS2Xq6XHaLPI1yrC6m8oISqFzsdCP8SiBOUo5vh
	1SggRoPI3GgERIYh0pMplNhrWCQzlebcobM4EMcC0P9tz9KaDcwcJ3tHwR1bnsWC4DdFRH74m8C
	jimLzbDqzdc=
X-Google-Smtp-Source: AGHT+IHgL37W9RSrJUyIbPzFI33lt8hg0QIrsXASH2pJNH5CPrIWLa21IUV/gZ7ppTqNKakdIJGnUQ==
X-Received: by 2002:a05:600c:4ec7:b0:432:cbe5:4f09 with SMTP id 5b1f17b1804b1-434d09acfe3mr47904345e9.4.1733294986936;
        Tue, 03 Dec 2024 22:49:46 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f343f293sm7435757f8f.36.2024.12.03.22.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 22:49:45 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/37] xf86-video-fbdev: update 0.5.0 -> 0.5.1
Date: Wed,  4 Dec 2024 07:49:00 +0100
Message-Id: <20241204064920.817016-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204064920.817016-1-alex.kanavin@gmail.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 06:49:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208246

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{xf86-video-fbdev_0.5.0.bb => xf86-video-fbdev_0.5.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-fbdev_0.5.0.bb => xf86-video-fbdev_0.5.1.bb} (64%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.5.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.5.1.bb
similarity index 64%
rename from meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.5.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.5.1.bb
index 7b4ac88a4c1..17786d606dc 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.5.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.5.1.bb
@@ -5,5 +5,5 @@ DESCRIPTION = "fbdev is an Xorg driver for framebuffer devices. This is a non-ac
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8cbd99fff773f92e844948f74ef0df8"
 
-SRC_URI[md5sum] = "f07475655376be5a124d8187aacd87b6"
-SRC_URI[sha256sum] = "dcc3d85f378022180e437a9ec00a59b6cb7680ff79c40394d695060af2374699"
+SRC_URI[sha256sum] = "9c2bc0fb9af092804138e8d5cb5627cabf2919ef60f0d1544a95c4ac2047f387"
+XORG_DRIVER_COMPRESSOR = ".tar.xz"
-- 
2.39.5


