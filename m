Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RcDnK-0000yN-1S
	for openembedded-core@lists.openembedded.org;
	Sun, 18 Dec 2011 11:16:38 +0100
Received: by wgbds11 with SMTP id ds11so7602523wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2011 02:09:37 -0800 (PST)
Received: by 10.216.133.29 with SMTP id p29mr5431165wei.49.1324202976774;
	Sun, 18 Dec 2011 02:09:36 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id
	fy13sm21412101wbb.18.2011.12.18.02.09.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Dec 2011 02:09:35 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Dec 2011 11:09:27 +0100
Message-Id: <1324202967-25143-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH v2] libsdl 1.2.14: fix packaging
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
X-List-Received-Date: Sun, 18 Dec 2011 10:16:38 -0000

For some reason the -config script was shipped in ${PN} leading to shlibs renaming issues:

What we want, and how meta-oe used to do it:
	libsdl-1.2-0_1.2.14-r0.0_armv7a.ipk

Current OE-core status:
	libsdl_1.2.14-r2_armv7a.ipk

With this commit we get both proper shlib renaming and the -dev package now has all the dev files

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-graphics/libsdl/libsdl_1.2.14.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
index a28a88a..f587291 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
@@ -15,7 +15,7 @@ PROVIDES = "virtual/libsdl"
 DEPENDS = "${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} virtual/libx11 libxext libxrandr libxrender tslib"
 DEPENDS_virtclass-nativesdk = "libx11-nativesdk libxrandr-nativesdk libxrender-nativesdk libxext-nativesdk"
 
-PR = "r2"
+PR = "r4"
 
 SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
            file://configure_tweak.patch \
@@ -26,7 +26,7 @@ S = "${WORKDIR}/SDL-${PV}"
 SRC_URI[md5sum] = "e52086d1b508fa0b76c52ee30b55bec4"
 SRC_URI[sha256sum] = "5d927e287034cb6bb0ebccfa382cb1d185cb113c8ab5115a0759798642eed9b6"
 
-inherit autotools binconfig pkgconfig
+inherit autotools lib_package binconfig pkgconfig
 
 EXTRA_OECONF = "--disable-static --disable-debug --enable-cdrom --enable-threads --enable-timers --enable-endian \
                 --enable-file --disable-oss --disable-esd --disable-arts \
-- 
1.7.2.5



