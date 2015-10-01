Return-Path: <clopez@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id C2F1B77088
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 13:49:55 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2BMBQCYOQ1W/5tjdVteHAGDCiMxbrlMhC+BUSAGhX0CgTE5EwEBAQEBAQGBCoQlAQEESwE9UVcZiDIBvRkBjlkBK4ZzihIXghcMQYExBZV5hRaHfokGkk0jAT+EBDwzAYl3AQEB
X-IPAS-Result: A2BMBQCYOQ1W/5tjdVteHAGDCiMxbrlMhC+BUSAGhX0CgTE5EwEBAQEBAQGBCoQlAQEESwE9UVcZiDIBvRkBjlkBK4ZzihIXghcMQYExBZV5hRaHfokGkk0jAT+EBDwzAYl3AQEB
X-IronPort-AV: E=Sophos;i="5.17,617,1437429600"; d="scan'208";a="28843001"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 01 Oct 2015 15:49:50 +0200
Received: from [192.168.10.149] (helo=trinity.local.igalia.com)
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim)
	id 1ZheF4-0007Uf-SV; Thu, 01 Oct 2015 15:49:50 +0200
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Oct 2015 15:49:50 +0200
Message-Id: <1443707390-26567-3-git-send-email-clopez@igalia.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1443707390-26567-1-git-send-email-clopez@igalia.com>
References: <1443707390-26567-1-git-send-email-clopez@igalia.com>
Subject: [PATCH 2/2] webkitgtk: Add some PACKAGECONFIG options.
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
X-List-Received-Date: Thu, 01 Oct 2015 13:49:56 -0000

 * Also default to enable X11/Wayland support or WebGL according
   to enabled DISTRO_FEATURES.

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.8.5.bb | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
index e92c6b1..f14c868 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
@@ -29,14 +29,25 @@ DEPENDS = "zlib enchant libsoup-2.4 curl libxml2 cairo libxslt libxt libidn gnut
 	   atk udev harfbuzz jpeg libpng pulseaudio librsvg libtheora libvorbis libxcomposite libxtst \
 	   ruby-native libsecret libnotify gstreamer1.0-plugins-bad \
           "
-DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)}"
+
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', 'wayland' ,d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'opengl', 'webgl', '' ,d)}"
+
+PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland"
+PACKAGECONFIG[x11] = "-DENABLE_X11_TARGET=ON,-DENABLE_X11_TARGET=OFF,virtual/libx11"
+PACKAGECONFIG[geoclue] = "-DENABLE_GEOLOCATION=ON,-DENABLE_GEOLOCATION=OFF,geoclue"
+PACKAGECONFIG[enchant] = "-DENABLE_SPELLCHECK=ON,-DENABLE_SPELLCHECK=OFF,enchant"
+PACKAGECONFIG[gtk2] = "-DENABLE_PLUGIN_PROCESS_GTK2=ON,-DENABLE_PLUGIN_PROCESS_GTK2=OFF,gtk+"
+PACKAGECONFIG[gles2] = "-DENABLE_GLES2=ON,-DENABLE_GLES2=OFF,virtual/libgles2"
+PACKAGECONFIG[webgl] = "-DENABLE_WEBGL=ON,-DENABLE_WEBGL=OFF,virtual/libgl"
+PACKAGECONFIG[libsecret] = "-DENABLE_CREDENTIAL_STORAGE=ON,-DENABLE_CREDENTIAL_STORAGE=OFF,libsecret"
 
 EXTRA_OECMAKE = " \
 		-DPORT=GTK \
 		-DCMAKE_BUILD_TYPE=Release \
 		-DENABLE_INTROSPECTION=OFF \
+		-DENABLE_GTKDOC=OFF \
 		-DENABLE_MINIBROWSER=ON \
-	        ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '-DENABLE_WEBGL=ON', '-DENABLE_WEBGL=OFF', d)} \
 		"
 
 # Javascript JIT is not supported on powerpc
-- 
2.1.4


