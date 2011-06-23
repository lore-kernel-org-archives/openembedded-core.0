Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QZj49-0007Th-R3
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 14:31:26 +0200
Received: by rex (Postfix, from userid 1000)
	id 2951520F11; Thu, 23 Jun 2011 13:27:50 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jun 2011 13:27:29 +0100
Message-Id: <e294582e4b02e5f1ca7f2a83ec79498676a20bc2.1308831847.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1308831847.git.richard.purdie@linuxfoundation.org>
References: <cover.1308831847.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1308831847.git.richard.purdie@linuxfoundation.org>
References: <cover.1308831847.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/4] base/glib-2.0: Simplify USE_NLS handling for glib-2.0
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
X-List-Received-Date: Thu, 23 Jun 2011 12:31:26 -0000

Currently the only way to get anything to build is to set USE_NLS="yes"
for glib-2.0. We might as well do this in the recipe by default for
now and simpllify the code.

The magic handling of USE_NLS_<recipename> is also removed since this
can be done in the form USE_NLS_pn-<recipename> using overrides these
days.

Signed-off-by: Richard  Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass                  |    4 ----
 meta/conf/distro/include/tclibc-uclibc.inc |    1 -
 meta/recipes-core/glib-2.0/glib-2.0.inc    |    6 ------
 meta/recipes-core/glib-2.0/glib.inc        |    3 +--
 4 files changed, 1 insertions(+), 13 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0.inc

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 0bea639..575352d 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -303,10 +303,6 @@ python () {
                     bb.note("SKIPPING %s because it's %s" % (pn, this_license))
                     raise bb.parse.SkipPackage("incompatible with license %s" % this_license)
 
-    use_nls = bb.data.getVar('USE_NLS_%s' % pn, d, 1)
-    if use_nls != None:
-        bb.data.setVar('USE_NLS', use_nls, d)
-
     # Git packages should DEPEND on git-native
     srcuri = bb.data.getVar('SRC_URI', d, 1)
     if "git://" in srcuri:
diff --git a/meta/conf/distro/include/tclibc-uclibc.inc b/meta/conf/distro/include/tclibc-uclibc.inc
index 83418d6..65693a9 100644
--- a/meta/conf/distro/include/tclibc-uclibc.inc
+++ b/meta/conf/distro/include/tclibc-uclibc.inc
@@ -14,7 +14,6 @@ PREFERRED_PROVIDER_virtual/libiconv ?= "libiconv"
 PREFERRED_PROVIDER_virtual/libintl ?= "gettext"
 
 USE_NLS ?= "no"
-USE_NLS_glib-2.0 = "yes"
 
 CXXFLAGS += "-fvisibility-inlines-hidden"
 
diff --git a/meta/recipes-core/glib-2.0/glib-2.0.inc b/meta/recipes-core/glib-2.0/glib-2.0.inc
deleted file mode 100644
index ccbbd2b..0000000
--- a/meta/recipes-core/glib-2.0/glib-2.0.inc
+++ /dev/null
@@ -1,6 +0,0 @@
-
-python () {
-    import bb
-    if bb.data.getVar("USE_NLS", d, 1) == "no":
-        raise bb.parse.SkipPackage("${PN} requires native language support.")
-}
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 0800c85..e25db3d 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -13,8 +13,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
 BUGTRACKER = "http://bugzilla.gnome.org"
 SECTION = "libs"
 
-require glib-2.0.inc
-
 DEPENDS = "glib-2.0-native gtk-doc-native zip dbus"
 DEPENDS_virtclass-native = "gtk-doc-native pkgconfig-native gettext-native dbus-native"
 DEPENDS_virtclass-nativesdk = "libtool-nativesdk"
@@ -36,3 +34,4 @@ FILES_${PN}-dev += "${libdir}/glib-2.0/include"
 FILES_${PN}-dbg += "${datadir}/glib-2.0/gdb ${datadir}/gdb"
 
 ARM_INSTRUCTION_SET = "arm"
+USE_NLS = "yes"
-- 
1.7.4.1



