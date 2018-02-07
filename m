Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id F10EC65D00
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Feb 2018 09:03:04 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id y9so66207pfl.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Feb 2018 01:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=fUIUyz31QwVCyUYgg2EMrrCoe6R0CBmgJAJod7Dz95g=;
	b=NbVIr0ZKd0AXFNlIvLBLkRafNgSoK+vO6WTm/x/jA0Vxcm1nOBBn0CYG5Sv281kQsy
	Cm960oXvlE5M8CbuYqvJdj9atkpwMxU5X07u+p/a1AXsfEx2BC12CilXWYncKkaDtLt4
	5cZG5kgrKKgmORnw9mP9+H08NIFqdT1bEVSA2oq3noa3hgnJZ+DfqTQyDoUllUokogt5
	8+NAGLOGb9MW7KHCy4UC5jdCTZT8N7rokGOKD/4k3qRrfPKZr7GoGVWgdjQJc2deMuwc
	oXyLrrsW5Z0ia+kQhQIBeaIknTn665NhTI9Z4KmrDaY2uN2999JQL8doxgnN8Sk35Pbc
	e9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fUIUyz31QwVCyUYgg2EMrrCoe6R0CBmgJAJod7Dz95g=;
	b=luN/nZOKqUQ5KMPJFmdnQo5LcPOAJQmuG2tKa3sitbEgnm1q2S25JVjkwCNoLuzAXS
	2yU11NW5v2oaGN3xy8Il86dHIZFVKQHF+s+pCZeiNJQO6uaKiIodW6rZOQkQiinGodo0
	4DrxCqwxk0ZU3v/MJvozxxKeB3s3IudTgaahS+e+SSuYyRwrXJ4xKLzsnekGKVHoChjJ
	ObghbGJkkhrNG9sUBqYff6L0JH4PwZ10G9uvgd0xKKAEMqUN/YhhShiWCGY9jZNtxvq5
	n6mHcIQxwslZ+RIW8cE8WRb6ByQ3ts86B5sAi+6up48UMic8LIIk8gqW6V8btQ3k8oJ7
	zJSw==
X-Gm-Message-State: APf1xPDiD5uKT1rhzNZ2EkvCzQVUkF7uADa9eepzBPq/NIf9+fWhX9tP
	p1Zt0HxzuJKsviDIwNTwYqpvBg==
X-Google-Smtp-Source: AH8x225gOVNLxoLKBfPZAHXjYu4yaHcRsmpeGPNakoxu/zrFXBhkD4XkHJDi8ptccT7ObWgwHWYmbw==
X-Received: by 10.101.70.12 with SMTP id v12mr4324944pgq.327.1517994184581;
	Wed, 07 Feb 2018 01:03:04 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::5193])
	by smtp.gmail.com with ESMTPSA id
	g15sm2182519pgu.52.2018.02.07.01.03.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Feb 2018 01:03:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Feb 2018 01:02:46 -0800
Message-Id: <20180207090246.36346-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.1
Subject: [PATCH] libepoxy: Define MESA_EGL_NO_X11_HEADERS when GLX is disabled
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Feb 2018 09:03:05 -0000

This helps when libepoxy is compiled with egl but glx is disabled
it also depends on GL implementation provided eglplatform.h to be
using MESA_EGL_NO_X11_HEADERS to exclude X11 headers, e.g. mesa,
mali-userland implementations use this define to exclude x11
headers

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ..._EGL_NO_X11_HEADERS-before-including-eglp.patch | 30 ++++++++++++++++++++++
 meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb   |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-graphics/libepoxy/libepoxy/0001-Define-MESA_EGL_NO_X11_HEADERS-before-including-eglp.patch

diff --git a/meta/recipes-graphics/libepoxy/libepoxy/0001-Define-MESA_EGL_NO_X11_HEADERS-before-including-eglp.patch b/meta/recipes-graphics/libepoxy/libepoxy/0001-Define-MESA_EGL_NO_X11_HEADERS-before-including-eglp.patch
new file mode 100644
index 0000000000..ebe5754a7a
--- /dev/null
+++ b/meta/recipes-graphics/libepoxy/libepoxy/0001-Define-MESA_EGL_NO_X11_HEADERS-before-including-eglp.patch
@@ -0,0 +1,30 @@
+From 62e178ddae24c7633d2a03b129dc52261e0a15bf Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 7 Feb 2018 00:48:03 -0800
+Subject: [PATCH] Define MESA_EGL_NO_X11_HEADERS before including eglplatform.h
+ when X11 is disabled
+
+This helps in compiling when GL implementations e.g. mesa use
+this define to exclude X11 headers
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted [https://github.com/anholt/libepoxy/pull/153]
+
+ src/dispatch_common.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+Index: libepoxy-1.4.3/src/dispatch_common.h
+===================================================================
+--- libepoxy-1.4.3.orig/src/dispatch_common.h
++++ libepoxy-1.4.3/src/dispatch_common.h
+@@ -46,6 +46,9 @@
+ #include "epoxy/glx.h"
+ #endif
+ #if PLATFORM_HAS_EGL
++#if !PLATFORM_HAS_GLX
++#define MESA_EGL_NO_X11_HEADERS 1
++#endif
+ #include "epoxy/egl.h"
+ #endif
+ #if PLATFORM_HAS_WGL
diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
index 72167a2fb8..8a5cb8f49f 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
 SRC_URI = "https://github.com/anholt/${BPN}/releases/download/${PV}/${BP}.tar.xz \
            file://Add-fallback-definition-for-EGL-CAST.patch \
            file://0001-Make-it-possible-to-disable-the-use-of-dlvsym-needed.patch \
+           file://0001-Define-MESA_EGL_NO_X11_HEADERS-before-including-eglp.patch \
            "
 SRC_URI[md5sum] = "af4c3ce0fb1143bdc4e43f85695a9bed"
 SRC_URI[sha256sum] = "0b808a06c9685a62fca34b680abb8bc7fb2fda074478e329b063c1f872b826f6"
-- 
2.16.1


