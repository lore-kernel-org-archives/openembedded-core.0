Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 09EED6011C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 05:44:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3M5iZFw004588
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 22:44:36 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 21 Apr 2016 22:44:35 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Apr 2016 22:44:32 -0700
Message-ID: <6a9c5646d388722ebf9579c152c42516112ba46d.1461303847.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1461303847.git.liezhi.yang@windriver.com>
References: <cover.1461303847.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] directfb/pango/webkit: base_contains -> bb.utils.contains
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
X-List-Received-Date: Fri, 22 Apr 2016 05:44:38 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-graphics/directfb/directfb.inc  | 2 +-
 meta/recipes-graphics/pango/pango_1.38.1.bb  | 2 +-
 meta/recipes-sato/webkit/webkitgtk_2.10.7.bb | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
index f6b7cbe..46748988 100644
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ b/meta/recipes-graphics/directfb/directfb.inc
@@ -26,7 +26,7 @@ S = "${WORKDIR}/DirectFB-${PV}"
 LDFLAGS_append =" -lts -lm"
 
 # Workaround for linking issues seen with armv7a + gold
-LDFLAGS_append_arm = "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
+LDFLAGS_append_arm = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
 BINCONFIG = "${bindir}/directfb-config"
 
diff --git a/meta/recipes-graphics/pango/pango_1.38.1.bb b/meta/recipes-graphics/pango/pango_1.38.1.bb
index 7fc65fd..756dac4 100644
--- a/meta/recipes-graphics/pango/pango_1.38.1.bb
+++ b/meta/recipes-graphics/pango/pango_1.38.1.bb
@@ -36,7 +36,7 @@ LIBV = "1.8.0"
 
 # This binary needs to be compiled for the host architecture.  This isn't pretty!
 do_compile_prepend_class-target () {
-	if ${@base_contains('DISTRO_FEATURES', 'ptest', 'true', 'false', d)}; then
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'true', 'false', d)}; then
 		make CC="${BUILD_CC}" CFLAGS="" LDFLAGS="" AM_CPPFLAGS="$(pkg-config-native --cflags glib-2.0)" gen_all_unicode_LDADD="$(pkg-config-native --libs glib-2.0)" -C ${B}/tests gen-all-unicode
 	fi
 }
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.10.7.bb b/meta/recipes-sato/webkit/webkitgtk_2.10.7.bb
index 8eb6b9f..d4f1d3b 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.10.7.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.10.7.bb
@@ -34,8 +34,8 @@ DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libidn gnutls \
 	   ruby-native libnotify gstreamer1.0-plugins-bad \
           "
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', 'wayland' ,d)} \
-                   ${@base_contains('DISTRO_FEATURES', 'opengl', 'webgl', '' ,d)} \
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'wayland' ,d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'webgl', '' ,d)} \
                    enchant \
                    gtk2 \
                    libsecret \
-- 
2.8.0


