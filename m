Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 020CF61311
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 11:51:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48SDfg2Fjbz4c
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 12:51:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582717899;
	bh=sWDavsJxHoten7XPJkGsrTIajOSYqcDuskxS2/BN9bU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CgA8/j3S/DmsXELxDBm4Ryw0EVGWImJIsxQsV0rNbmTMIfaodjYIygYkENsLvlBMi
	m2+ydQXhZkrrD+CDpzwmLJUc4/aurCFSvBXhKdTzUO/bVGkIFYhoRfI53sj9QWA41i
	V1+PTKVlL7rlVLrwn4nwmGXADH+6ob+H10j1GeiiLV46F7rAKYlCrzJHmPyzo8BZBL
	2Av8PpjU6wQ8q8vt/sZNwoQAOumWLvuckkL7ctoXrk78Qt7UB+iIRHcJjCgz2TVhRn
	IlCl5Q/xiSG0K1nw8DKDelPKB2Y+xPiHjuD6I3C8rgcjwGF/DbY5KHvwAjn60q+8kT
	JfY2PLmF7N/f2NDFeBdI12UXdkPIVhktuTtBpetpXeaVsQTnZOgLBAewfdc51Gnbgb
	DXwmcbFNQTREhmVvB6/Jrkl2x/psem/msXN3X/Z+0EaK0AJ7GtcYc6yotDhgAgPcbL
	ZPY+ZvEvPOZ7S+agmcCRZT3FGYD9WKgPCVyIOU3f6M2oy6u/KQVKKPUCPjn+NuXvmv
	6Qx+G7bopz5S9EMVFakAkb86MiJE3ESNAn7KjCsPqhpoX0QcRuDpVqGXIVJ8mfzpKV
	FURCUykZHS27mbjKIlHAroDzrSfe+1E24RHffor+y8drXX9vFqrvOSLj+tBpbWsoyA
	igrJu2U5wXr3OMZ8UjaG2xMs=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Feb 2020 13:51:37 +0200
Message-Id: <20200226115137.23733-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226115137.23733-1-bunk@stusta.de>
References: <20200226115137.23733-1-bunk@stusta.de>
Subject: [PATCH v3 2/2] webkitgtk: Remove unnecessary REQUIRED_DISTRO_FEATURES requirements
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

x11 can be replaced with wayland.
opengl is mandatory only with wayland.
Without x11, use gles2 for opengl.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-sato/webkit/webkitgtk_2.26.4.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
index 1a0b504a51..0a5ecace02 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
@@ -26,7 +26,8 @@ SRC_URI[sha256sum] = "4386900713dfadf9741177210b32623cab22562a79ffd0d446b6656993
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-REQUIRED_DISTRO_FEATURES = "x11 opengl"
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'opengl', '', d)}"
 
 CVE_PRODUCT = "webkitgtk webkitgtk\+"
 
@@ -39,7 +40,8 @@ DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libgcrypt \
           "
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'webgl opengl', '' ,d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'webgl opengl', '' ,d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'webgl gles2' ,d)} \
                    enchant \
                    libsecret \
                   "
-- 
2.17.1


