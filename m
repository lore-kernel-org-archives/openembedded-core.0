Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C091CA0FFE
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 07:19:36 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.71431.1756797570213180513
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 00:19:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WOfABcyY;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45a1b065d59so34356475e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 00:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756797568; x=1757402368; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g+s/Dp9hgld+jfY2AKSnlXD7bPA6zdVYJL0rtMUnXEk=;
        b=WOfABcyYlB9JJZhsJXGp8Zbllmqh/R9S7wIYwWZSJpo+XqG68tVMAUzx2SZdnrthEJ
         LP/vx0anQbBJcM3hUNLOgiXNE0hUC/C1hdhmVrPxsQ4QQkJ/hm2RlJpj4HUCkEVpw4LN
         wHTLJk5GC3eeaKRgO21Xc11ScxeRBAYgTdYEnh4LJFKNJsW0UC4+NZe0jsQe4fsHGXHo
         XTUBOM0QmTsb2wKCGByZSZblzwBHMA2dx6TyR2MpdiKOe5FdNAd1wYsYAzS3a+xI9bGG
         olp2WZh2FAvJW85gLjzBMvXxS/KaL8hC8g06P49OnNMoWMPaFCaxmX7kpq844yeVQwkJ
         h25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756797568; x=1757402368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g+s/Dp9hgld+jfY2AKSnlXD7bPA6zdVYJL0rtMUnXEk=;
        b=aSAEnuq4FU/FeJlb2rWYpQnpIFXO7n5K8TSRRXgeX0T7Y5HJDDYGIr3PUCGR5hIGsF
         VM4JwiKnhqDocevsQJLoP+ZVeb8Fppxoshy48Yd1Ivgki1VtOt8A6/47W00BlS271gJD
         AIwYFzK1Gh3NSlrX9jdDqI04BvwDCC6QlqnRrE6GC7nJLGid+J3PdJkUUKCu6+QfIk0i
         ONwqGOKgt3OvkRKM21oN/ntz7EJ04h9Ncacs5eO/yeo5+3TPYpn4OwWJMpme75lz4ELq
         RYAeWnc3SnS/hyupf4Ou6Z1QWY7CI0KT/8lyLUObMxOZuHAdB9zaZZPgSnDOnzSyiUcS
         CSlA==
X-Gm-Message-State: AOJu0YxqvO8pEV6f/uVlnckTFdODX9DrTqfBh1vqDpnGcNTsiK7+1VXP
	nY9d7D0gHeKvNsP+1KKhVEyAryLbByKQmIIzA1+c2o1L9cKpMNayAuNZy6h7Ug==
X-Gm-Gg: ASbGncvbO94EDJTjVxA+/wdAerljzM22geGzPQkikryPA5t1PYREFs2UuG1a7FM42MB
	KWkzj3U2YP0iF/4FyWQ50tqHqTfDGC54oONhmnxT/DAlpK35aJUDPxRVh091BY8KoaA0npvHgNC
	Se4wiPZn97PBlA87XKc9XnEJf/VAx4l+za+APopcLwfGVvoTav0TN01O8YMozPbFs+IQs8hRS8j
	aUCTogolE7Dli10VfHx7K9ozNDW/3tg1UgkSypxy6a3NlgeyzVUw8fADAHzFvpSXtJLQ9n93G5D
	3aLsdgSYTVRXGKALzFZDUYd+yDqo65hlKIr95RtGSZ/MrmOTZ6TJnEhzRi6n1XQREKWw2zUCjK2
	d4WhWZowjF+a42aLXjOQn1FIZz9sV0tAMbQbwdTlUH0hPhPhIRsq4bsA=
X-Google-Smtp-Source: AGHT+IEUyaT+4cy70ZlBnm0V2oJCR5FAU4CEbVNsc5YZdJIygkZgmtXkudDdsLRMeJn1DXreyXSRJg==
X-Received: by 2002:a05:600c:5490:b0:45b:8db2:336e with SMTP id 5b1f17b1804b1-45b8e2e64b1mr36062475e9.23.1756797568107;
        Tue, 02 Sep 2025 00:19:28 -0700 (PDT)
Received: from fedora (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d0a1f807f9sm17608422f8f.38.2025.09.02.00.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 00:19:27 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Signed-off-by : Alexander Kanavin" <alex@linutronix.de>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] tiff: Add PACKAGECONFIG for liblerc
Date: Tue,  2 Sep 2025 09:19:13 +0200
Message-ID: <20250902071913.2350691-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 07:19:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222711

tiff-native may pick up liblerc from the host using the .so
symlink, in which case it's added as a private requirement
in libtiff-4.pc. That in turn causes a build error in
gtk4-native in Yocto because Lerc.pc does not exist.

This was observed on Fedora 42 with gdk-pixbuf2-devel installed
on the host where libtiff is a dependency of gdk-pixbuf2 and
libtiff 4.7.0 is built with liblerc enabled.

Add a new PACKAGECONFIG setting for liblerc but keep it disabled
since liblerc does not exist in Yocto at the moment.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
Backport-to: walnascar
---
 meta/recipes-multimedia/libtiff/tiff_4.7.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
index 26e3811ff8..d1638f1b61 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
@@ -38,6 +38,7 @@ PACKAGECONFIG ?= "cxx jpeg zlib lzma \
 PACKAGECONFIG[cxx] = "--enable-cxx,--disable-cxx,,"
 PACKAGECONFIG[jbig] = "--enable-jbig,--disable-jbig,jbig,"
 PACKAGECONFIG[jpeg] = "--enable-jpeg,--disable-jpeg,jpeg,"
+PACKAGECONFIG[lerc] = "--enable-lerc,--disable-lerc,liblerc,"
 PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib,"
 PACKAGECONFIG[lzma] = "--enable-lzma,--disable-lzma,xz,"
 PACKAGECONFIG[webp] = "--enable-webp,--disable-webp,libwebp,"
-- 
2.51.0


