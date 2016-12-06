Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wj0-f196.google.com (mail-wj0-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 81C34719DC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 00:19:41 +0000 (UTC)
Received: by mail-wj0-f196.google.com with SMTP id he10so27336886wjc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2016 16:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=2QRxe+nvSYRq8i92OG0SrEIY9j+apQTh/E55hiSCaso=;
	b=z84eqc5wkBbnxnm4iw5M4f9LkzxvYEHEAtDKGvMFHGDVZdT3jrl2lVYOxWovjL1FzD
	0aWYgzVnsNCPIyhYBGt7QhqFoAbt5m9A7fC/FEARAzMY3nkmoRHk1gecW7ZBGy0CA78R
	jlahRer4HrKuZHvuARNVATl13nEvXG7urYSIpNFblBagUPyZKyGRFELD/ZYITPPA04sG
	mbyO717F8HXZBd+xdBf7d6abWdTaANT5vbrbiVs/LQEfROgIFm0BZqywOo7iG3czPFMi
	IjHzQcm5kSu3GdH7ay1zgWPPMLpswIM5GpQmGAEN6z783com2w0gsBW8QgerpWasVipS
	zSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2QRxe+nvSYRq8i92OG0SrEIY9j+apQTh/E55hiSCaso=;
	b=JIiUdVpftqu0QaCBbsu8xkdB6f5Zq3Lnn4JTZf8iZGURryh35kAH7Pv1o5S2J9nmq9
	NTXfeQTKZusyw37RIh9ounihlO0Oap/auyOYO7rE6n5QLPp1rZFJD2ihEHDEYm3/uVs0
	lgaJlfNg1B6rugxkyxb+onbYXgLFuV8uln6n7x64Qq0h0arnC3hfLt0cnoPldI9gt6+T
	9U2ZVh5JJ8zHQD6wZ2CQw5JNBYuqGsiFux/Yn9HTR6vxHoMF46KXds/xh4hdNF1zCQGc
	woF+HSnm5BgSVBKXJEGSQLEr3CyWfQcQB9y+4SMnWodwh9rnbeCFibzQb/x8vA1tVkaj
	y1PQ==
X-Gm-Message-State: AKaTC02ku+SfdrkzzAIUbwiGmggb6F53afiSMslXEZFMUKFqpbRISz2OYXAMNrLwecCcAA==
X-Received: by 10.194.205.225 with SMTP id lj1mr59375047wjc.122.1480983581810; 
	Mon, 05 Dec 2016 16:19:41 -0800 (PST)
Received: from localhost.localdomain (p579F7D52.dip0.t-ipconnect.de.
	[87.159.125.82]) by smtp.googlemail.com with ESMTPSA id
	u18sm1150972wmd.1.2016.12.05.16.19.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Dec 2016 16:19:41 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 01:19:21 +0100
Message-Id: <1480983561-11437-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1480983561-11437-1-git-send-email-schnitzeltony@googlemail.com>
References: <1480983561-11437-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] libsdl2: fix build on wayland(-dev)less hosts
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
X-List-Received-Date: Tue, 06 Dec 2016 00:19:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* add sysroot prefix to wayland core protocols
* do not use pkg-config to find wayland-scanner

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...-sysroot-path-so-that-make-finds-our-wayl.patch |  8 +++---
 ...void-finding-build-host-s-wayland-scanner.patch | 31 ++++++++++++++++++++++
 meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb     |  1 +
 3 files changed, 37 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0002-Avoid-finding-build-host-s-wayland-scanner.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-prepend-our-sysroot-path-so-that-make-finds-our-wayl.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-prepend-our-sysroot-path-so-that-make-finds-our-wayl.patch
index d042430..efc8418 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2/0001-prepend-our-sysroot-path-so-that-make-finds-our-wayl.patch
+++ b/meta/recipes-graphics/libsdl2/libsdl2/0001-prepend-our-sysroot-path-so-that-make-finds-our-wayl.patch
@@ -11,18 +11,20 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
- configure.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ configure.in | 4 +-
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure.in b/configure.in
 index 726ded3..3376600 100644
 --- a/configure.in
 +++ b/configure.in
 @@ -1206,7 +1206,7 @@ AC_HELP_STRING([--enable-video-wayland-qt-touch], [QtWayland server support for
+                 WAYLAND_CFLAGS=`$PKG_CONFIG --cflags wayland-client wayland-egl wayland-cursor xkbcommon`
                  WAYLAND_LIBS=`$PKG_CONFIG --libs wayland-client wayland-egl wayland-cursor xkbcommon`
                  WAYLAND_SCANNER=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`
-                 WAYLAND_CORE_PROTOCOL_DIR=`$PKG_CONFIG --variable=pkgdatadir wayland-client`
+-                WAYLAND_CORE_PROTOCOL_DIR=`$PKG_CONFIG --variable=pkgdatadir wayland-client`
 -                WAYLAND_PROTOCOLS_DIR=`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`
++                WAYLAND_CORE_PROTOCOL_DIR=${WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --variable=pkgdatadir wayland-client`
 +                WAYLAND_PROTOCOLS_DIR=${WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`
                  video_wayland=yes
              fi
diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0002-Avoid-finding-build-host-s-wayland-scanner.patch b/meta/recipes-graphics/libsdl2/libsdl2/0002-Avoid-finding-build-host-s-wayland-scanner.patch
new file mode 100644
index 0000000..7837315
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/0002-Avoid-finding-build-host-s-wayland-scanner.patch
@@ -0,0 +1,31 @@
+From ae879091cf65cb70293b375ec7e61ed12a96d8a7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Fri, 2 Dec 2016 09:39:25 +0100
+Subject: [PATCH] Avoid finding build host's wayland-scanner
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index 3376600..2aa6ed4 100644
+--- a/configure.in
++++ b/configure.in
+@@ -1204,7 +1204,7 @@ AC_HELP_STRING([--enable-video-wayland-qt-touch], [QtWayland server support for
+             if $PKG_CONFIG --exists wayland-client wayland-scanner wayland-protocols wayland-egl wayland-cursor egl xkbcommon ; then
+                 WAYLAND_CFLAGS=`$PKG_CONFIG --cflags wayland-client wayland-egl wayland-cursor xkbcommon`
+                 WAYLAND_LIBS=`$PKG_CONFIG --libs wayland-client wayland-egl wayland-cursor xkbcommon`
+-                WAYLAND_SCANNER=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`
++                AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner])
+                 WAYLAND_CORE_PROTOCOL_DIR=${WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --variable=pkgdatadir wayland-client`
+                 WAYLAND_PROTOCOLS_DIR=${WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`
+                 video_wayland=yes
+-- 
+2.7.4
+
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
index bb75316..606e6fb 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
@@ -18,6 +18,7 @@ SRC_URI = " \
     http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
     file://linkage.patch \
     file://0001-prepend-our-sysroot-path-so-that-make-finds-our-wayl.patch \
+    file://0002-Avoid-finding-build-host-s-wayland-scanner.patch \
 "
 
 S = "${WORKDIR}/SDL2-${PV}"
-- 
2.5.5


