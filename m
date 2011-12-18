Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RcDDX-00088x-RH
	for openembedded-core@lists.openembedded.org;
	Sun, 18 Dec 2011 10:39:39 +0100
Received: by werm13 with SMTP id m13so888580wer.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2011 01:32:38 -0800 (PST)
Received: by 10.216.134.91 with SMTP id r69mr2852272wei.1.1324200757234;
	Sun, 18 Dec 2011 01:32:37 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id
	fy13sm21317767wbb.18.2011.12.18.01.32.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Dec 2011 01:32:36 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Dec 2011 10:32:11 +0100
Message-Id: <1324200731-10753-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] libsdl 1.2.14: fix packaging
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 18 Dec 2011 09:39:40 -0000

For some reason the -config script was shipped in ${PN} leading to shlibs renaming issues:

What we want, and how meta-oe used to do it:
	libsdl-1.2-0_1.2.14-r0.0_armv7a.ipk

Current OE-core status:
	libsdl_1.2.14-r2_armv7a.ipk

With this commit we get both proper shlib renaming and the -dev package now has all the dev files

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-graphics/libsdl/libsdl_1.2.14.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
index a28a88a..761995e 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
@@ -15,7 +15,7 @@ PROVIDES = "virtual/libsdl"
 DEPENDS = "${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} virtual/libx11 libxext libxrandr libxrender tslib"
 DEPENDS_virtclass-nativesdk = "libx11-nativesdk libxrandr-nativesdk libxrender-nativesdk libxext-nativesdk"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
            file://configure_tweak.patch \
@@ -57,4 +57,6 @@ do_configure_prepend() {
         export SYSROOT=$PKG_CONFIG_SYSROOT_DIR
 }
 
+FILES_${PN}-dev += "${bindir}/sdl-config""
+
 BBCLASSEXTEND = "nativesdk"
-- 
1.7.2.5



