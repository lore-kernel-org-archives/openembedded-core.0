Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id CEFF060C14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 09:25:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,693,1389740400"; d="scan'208";a="42999275"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 20 Mar 2014 10:25:53 +0100
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	(TLS) id 14.2.318.1; Thu, 20 Mar 2014 10:25:53 +0100
Received: from u85.usr.ingenico.loc (10.23.7.85) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Thu, 20 Mar 2014 10:25:53 +0100
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Mar 2014 10:18:38 +0100
Message-ID: <1395307118-5007-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.8.5.4
In-Reply-To: <1395248880-1075-1-git-send-email-Matthieu.Crapet@ingenico.com>
References: <1395248880-1075-1-git-send-email-Matthieu.Crapet@ingenico.com>
MIME-Version: 1.0
Subject: [RFC][PATCH v2] fontcache.bbclass: add fontconfig-utils runtime dependency
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
X-List-Received-Date: Thu, 20 Mar 2014 09:25:55 -0000
Content-Type: text/plain

In an image recipe, you can get a warning, for example:
WARNING: The postinstall intercept hook 'update_font_cache' failed (exit code: 1)! See log for details!
WARNING: The postinstalls for the following packages will be postponed for first boot: ttf-dejavu-sans-mono

(because /usr/bin/fc-cache is missing)

In OE-core, rdepend is correctly done in each recipe:
- ttf-fonts/liberation-fonts
- ttf-fonts/ttf-bitstream-vera

In meta-OE, rdepend is not done but packagegroup-fonts-truetype.bb includes fontconfig-utils:
- ttf-fonts/ttf-arphic-uming
- ttf-fonts/ttf-dejavu
- ttf-fonts/ttf-droid
- ttf-fonts/ttf-gentium
- ttf-fonts/ttf-hunkyfonts
- ttf-fonts/ttf-inconsolata
- ttf-fonts/ttf-liberation
- ttf-fonts/ttf-mplus
- ttf-fonts/ttf-sazanami
- ttf-fonts/ttf-ubuntu-font-family
- ttf-fonts/ttf-wqy-zenhei

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta/classes/fontcache.bbclass                             | 4 ++++
 meta/conf/documentation.conf                               | 1 +
 meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb   | 1 -
 meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb | 1 -
 4 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/fontcache.bbclass b/meta/classes/fontcache.bbclass
index 325bcae..afd3fd2 100644
--- a/meta/classes/fontcache.bbclass
+++ b/meta/classes/fontcache.bbclass
@@ -7,6 +7,7 @@ DEPENDS += "qemu-native"
 inherit qemu
 
 FONT_PACKAGES ??= "${PN}"
+FONT_EXTRA_RDEPENDS ?= "fontconfig-utils"
 
 fontcache_common() {
 if [ "x$D" != "x" ] ; then
@@ -19,8 +20,11 @@ fi
 
 python populate_packages_append() {
     font_pkgs = d.getVar('FONT_PACKAGES', True).split()
+    deps = d.getVar("FONT_EXTRA_RDEPENDS", True)
 
     for pkg in font_pkgs:
+        if deps: d.appendVar('RDEPENDS_' + pkg, ' '+deps)
+
         bb.note("adding fonts postinst and postrm scripts to %s" % pkg)
         postinst = d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)
         if not postinst:
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 53c3da2..4d49a02 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -173,6 +173,7 @@ FILESEXTRAPATHS[doc] = "Extends the search path the OpenEmbedded build system us
 FILESOVERRIDES[doc] = "A subset of OVERRIDES used by the OpenEmbedded build system for creating FILESPATH."
 FILESPATH[doc] = "The default set of directories the OpenEmbedded build system uses when searching for patches and files. It is defined in the base.bbclass class found in meta/classes in the Source Directory. Do not hand-edit the FILESPATH variable."
 FILESYSTEM_PERMS_TABLES[doc] = "Allows you to define your own file permissions settings table as part of your configuration for the packaging process."
+FONT_EXTRA_RDEPENDS[doc] = "When a recipe inherits the fontcache class, this variable specifies runtime dependencies for font packages. This variable defaults to 'fontconfig-utils'."
 FONT_PACKAGES[doc] = "When a recipe inherits the fontcache class, this variable identifies packages containing font files that need to be cached by Fontconfig."
 FULL_OPTIMIZATION[doc]= "The options to pass in TARGET_CFLAGS and CFLAGS when compiling an optimized system. This variable defaults to '-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2'."
 
diff --git a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
index c99521f..89fa4b2 100644
--- a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
+++ b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
@@ -8,7 +8,6 @@ BUGTRACKER = "https://bugzilla.redhat.com/"
 SECTION = "x11/fonts"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-RDEPENDS_${PN} = "fontconfig-utils"
 PR = "r4"
 PE = "1"
 
diff --git a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
index 75f78a2..b2e4cef 100644
--- a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
+++ b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
@@ -8,7 +8,6 @@ SECTION = "x11/fonts"
 LICENSE = "BitstreamVera"
 LIC_FILES_CHKSUM = "file://COPYRIGHT.TXT;md5=27d7484b1e18d0ee4ce538644a3f04be"
 PR = "r7"
-RDEPENDS_${PN} = "fontconfig-utils"
 
 inherit fontcache
 
-- 
1.8.5.4


