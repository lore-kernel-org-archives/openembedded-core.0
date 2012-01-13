Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rld8D-0004Mh-J1
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 10:09:05 +0100
Received: by wibhm17 with SMTP id hm17so173528wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2012 01:01:33 -0800 (PST)
Received: by 10.180.104.5 with SMTP id ga5mr6848329wib.21.1326445293798;
	Fri, 13 Jan 2012 01:01:33 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id g11sm10214651wbo.6.2012.01.13.01.01.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jan 2012 01:01:32 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2012 10:01:27 +0100
Message-Id: <1326445287-20422-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] cairo 1.10.2: enable tee backend
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
X-List-Received-Date: Fri, 13 Jan 2012 09:09:06 -0000

This is needed for firefox:

| checking CAIRO_LIBS... -lcairo -lpixman-1 -lfreetype -lfontconfig
| checking for cairo-tee >= 1.10... Package cairo-tee was not found in the pkg-config search path. Perhaps you should add the directory containing `cairo-tee.pc' to the PKG_CONFIG_PATH environment variable No package 'cairo-tee' found
| configure: error: Library requirements (cairo-tee >= 1.10) not met; consider adjusting the PKG_CONFIG_PATH environment variable if your libraries are in a nonstandard prefix so pkg-config can find them.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-graphics/cairo/cairo.inc       |    4 +++-
 meta/recipes-graphics/cairo/cairo_1.10.2.bb |    2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
index 5f8f7b6..31e2ec9 100644
--- a/meta/recipes-graphics/cairo/cairo.inc
+++ b/meta/recipes-graphics/cairo/cairo.inc
@@ -19,7 +19,9 @@ PACKAGECONFIG[gtk-directfb] = "--enable-directfb=yes,,directfb"
 
 #check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points 
 require cairo-fpu.inc
-EXTRA_OECONF += "${@get_cairo_fpu_setting(bb, d)} "
+EXTRA_OECONF += "${@get_cairo_fpu_setting(bb, d)} \
+                 --enable-tee \
+                "
 
 
 inherit autotools pkgconfig
diff --git a/meta/recipes-graphics/cairo/cairo_1.10.2.bb b/meta/recipes-graphics/cairo/cairo_1.10.2.bb
index 8202860..826681f 100644
--- a/meta/recipes-graphics/cairo/cairo_1.10.2.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.10.2.bb
@@ -2,7 +2,7 @@ require cairo.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.gz"
 
-- 
1.7.2.5



