Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0016561144
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 11:51:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48SDff5WcRz4M
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 12:51:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582717898;
	bh=5MU0uZriFnqogYJOQdwIvvhoWuGDlJ9Tuzx/NzvkYMM=;
	h=From:To:Subject:Date:From;
	b=pDTxalKooGnfRxkzwvNc3domvrYaKIKk9JRqJux5CK13nQwiIAKlERKKP9hIuV0I+
	rWVINKBfWsFH9IwIwZonIbNzd4BBYL94NtW64Y8TFJjE+ux33/7XGjvf1szZKc1mSU
	FEv7A08qujpc2UqdZfs3SSzt/A+fzSbYFlW86wlCZF/i0P4nPgA9Vt2faSmF4A+C/t
	5+2gYD1SEEwlADaLazW1mnyJvAAxPLCx04hwP0cd7EBEy55VaMeJJLIeBaoo0uUerq
	o9ihZ8Soga8wlg7GHXqWS8yD8DfAPLDwTkOJ+xS+pypMg+NiBoUu+8Zn7KhkwDL2aI
	ljBab6usFHH0ISrVUQaGqcjhf2A1BugpMAef5GXDnN7srN57bQ33azs9iEplXPxyfV
	heuGeKq+1zvHd6l8iONURMsNPpufu+gOX59meX7IXVVF8xGKHUqPBjG47u4J7YCyoe
	SYq0u4Tw3R0LLCSH1KCQJDlQrBoby0FJOT80tqDPySd0ooaoOVUI9/bB7CTjWqXjzY
	4nsL96x3xEElx1VgnBJNDCI2CCzVhQdymQAi6RMY0D6BXt8wAU9uHUka4qeYcqcnJj
	eqz1N9okcu2permIyJIJzR6uSCppFqmAY03yEvZT6Z6dfyd4qgnVUqercS2fU6H3hC
	8AFzN7ODbmS0mVKYTmg7VGz8=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Feb 2020 13:51:36 +0200
Message-Id: <20200226115137.23733-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v3 1/2] webkitgtk: Move X library DEPENDS to the x11 PACKAGECONFIG
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
X-List-Received-Date: Wed, 26 Feb 2020 11:51:39 -0000

Also adjust them to what OptionsGTK currently checks.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-sato/webkit/webkitgtk_2.26.4.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
index 2e923991e9..1a0b504a51 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
@@ -30,10 +30,10 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 CVE_PRODUCT = "webkitgtk webkitgtk\+"
 
-DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libgcrypt \
+DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libgcrypt \
            gtk+3 gstreamer1.0 gstreamer1.0-plugins-base flex-native gperf-native sqlite3 \
 	   pango icu bison-native gawk intltool-native libwebp \
-	   atk udev harfbuzz jpeg libpng librsvg libtheora libvorbis libxcomposite libxtst \
+	   atk udev harfbuzz jpeg libpng librsvg libtheora libvorbis \
 	   ruby-native libnotify gstreamer1.0-plugins-bad \
 	   gettext-native glib-2.0 glib-2.0-native libtasn1 \
           "
@@ -45,7 +45,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)} \
                   "
 
 PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland libwpe wpebackend-fdo wayland-native"
-PACKAGECONFIG[x11] = "-DENABLE_X11_TARGET=ON,-DENABLE_X11_TARGET=OFF,virtual/libx11"
+PACKAGECONFIG[x11] = "-DENABLE_X11_TARGET=ON,-DENABLE_X11_TARGET=OFF,virtual/libx11 libxcomposite libxdamage libxrender libxt"
 PACKAGECONFIG[geoclue] = "-DENABLE_GEOLOCATION=ON,-DENABLE_GEOLOCATION=OFF,geoclue"
 PACKAGECONFIG[enchant] = "-DENABLE_SPELLCHECK=ON,-DENABLE_SPELLCHECK=OFF,enchant2"
 PACKAGECONFIG[gles2] = "-DENABLE_GLES2=ON,-DENABLE_GLES2=OFF,virtual/libgles2"
-- 
2.17.1


