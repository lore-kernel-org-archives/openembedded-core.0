Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.6865.1604633899695272258
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 19:38:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qFrgOA0D;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id e6so4067851wro.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2020 19:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8v8hj7oMBwfbuILp4evhqwqSWWRnzE4VAAyE+vwSauQ=;
        b=qFrgOA0DnD4N+nNrE6PDVgWudsBXqXVEyaIfosq8twvCzT6XXAUY3pOClLcVMudCoJ
         zRZdmjEz6ISEn02YLFYuoIw4gyhITEOq3BtjMK638mrpwujGJbbYUmzX3qQSkw2HTAAc
         8CKc0QJLmNL0FPLnFth9nyOptwTbbfBl9+Qb3pxdVb3r7j2xYsFCS2vq4KJWZJ5CoXm4
         pGCVO4wN9wdaMX2dnN6H7ug+sVfoaNl+vAYlOfeA61IDMOBHZaZZsDKKTrQ5oH51Tq7U
         Nq8PCcX/I43Oez8wpZWhZr8yWeQUF1L0FT/Eu6n9BCKt4/DQQNC114pPqLzRDUMN/UhF
         FQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8v8hj7oMBwfbuILp4evhqwqSWWRnzE4VAAyE+vwSauQ=;
        b=UU5hMP/wnqJZoBgVp3rg3lk2QGqkMCsJKMw5wl5mucBYi+e5X4mb9B26uQ5i8Yk2VX
         K/Ib1vUSA9NswxhUET7aNVO4WGa2iSKg78Qy4QS8nAvNei5ymk88JnlMZV9s/XCjDPku
         DY8HKRdQOhr8rqAyjb9YmDLxyhsl6jqThzF246WBUbNcvN5NOU9BmZifu3vDy1DNKQ/5
         ryMqqZhbbTfMf9pbDW/9mJcMWU1Z+UZ2pu3tyQFUWoBsMmFX4mvhJT3QrupnYMwatLjX
         m3ILcCS5F2iSk3/YVZ6j64Q9W30nQOBuZ1WOZiyg1qHoFNOXSaXrvlMqQ/X3ETQqkzFT
         NYMg==
X-Gm-Message-State: AOAM530TXppIEWJAQy5WJIU+2qEzZCDjnh4PPLiYQidE6YEFCZvOgxej
	F3PTMVMn1SbKuU7cZs9efBx4iQcRwRo=
X-Google-Smtp-Source: ABdhPJxczNrb5EI7cmZScyHBbJ9jMGkMwCpIlH5Ujkj1hN2mD0iAf1NAOFhNRML8sjaNqCYXFEFD/Q==
X-Received: by 2002:adf:fdc7:: with SMTP id i7mr245504wrs.198.1604633897759;
        Thu, 05 Nov 2020 19:38:17 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id z2sm101118wmf.45.2020.11.05.19.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 19:38:16 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] webkitgtk: fix build with x11 enabled
Date: Fri,  6 Nov 2020 04:38:13 +0100
Message-Id: <20201106033813.527636-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201028210558.21070-20-alex.kanavin@gmail.com>
References: <20201028210558.21070-20-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../webkit/webkitgtk/include_xutil.patch      | 24 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.30.2.bb  |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/include_xutil.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/include_xutil.patch b/meta/recipes-sato/webkit/webkitgtk/include_xutil.patch
new file mode 100644
index 0000000000..f770b381ce
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/include_xutil.patch
@@ -0,0 +1,24 @@
+Since
+https://github.com/WebKit/webkit/commit/acd3f32cd43c363be032f93ede3aa10c4ee97fa4
+it uses XVisualInfo which is defined in Xutil.h
+
+Without this the build fails with:
+webkitgtk-2.30.2/Source/WebCore/platform/graphics/x11/PlatformDisplayX11.cpp:132:5: error: 'XVisualInfo' was not declared in this scope; did you mean 'VisualID'?
+  132 |     XVisualInfo visualTemplate;
+      |     ^~~~~~~~~~~
+      |     VisualID
+
+Upstream-Status: Pending
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+diff -uNr webkitgtk-2.30.2.orig/Source/WebCore/platform/graphics/x11/PlatformDisplayX11.cpp webkitgtk-2.30.2/Source/WebCore/platform/graphics/x11/PlatformDisplayX11.cpp
+--- webkitgtk-2.30.2.orig/Source/WebCore/platform/graphics/x11/PlatformDisplayX11.cpp	2020-08-12 09:17:55.000000000 +0000
++++ webkitgtk-2.30.2/Source/WebCore/platform/graphics/x11/PlatformDisplayX11.cpp	2020-11-06 03:11:40.379913528 +0000
+@@ -30,6 +30,7 @@
+ 
+ #if PLATFORM(X11)
+ #include <X11/Xlib.h>
++#include <X11/Xutil.h>
+ #include <X11/extensions/Xcomposite.h>
+ #if PLATFORM(GTK)
+ #include <X11/extensions/Xdamage.h>
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
index 56cd1eb9d4..94fcbd8abe 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch \
            file://0001-Fix-build-with-musl.patch \
            file://include_array.patch \
+           file://include_xutil.patch \
            "
 SRC_URI[sha256sum] = "c467e0bc2bc610c2570928e3fd63cedaadc4719cbf9b04aa99f79dd71ad5682a"
 
-- 
2.27.0

