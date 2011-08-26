Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qx2Kh-0006Xu-CT
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 21:44:51 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Aug 2011 12:39:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,286,1312182000"; d="scan'208";a="45450558"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.251])
	by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2011 12:39:57 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2011 12:39:50 -0700
Message-Id: <ac92a573dd38270a28967c76472435cfd7f9bdfe.1314387279.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1314387279.git.sgw@linux.intel.com>
References: <cover.1314387279.git.sgw@linux.intel.com>
In-Reply-To: <cover.1314387279.git.sgw@linux.intel.com>
References: <cover.1314387279.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 20/21] pango: make x11 support conditional on DISTRO_FEATURES
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
X-List-Received-Date: Fri, 26 Aug 2011 19:44:52 -0000

From: Phil Blundell <philb@gnu.org>

This allows pango to build on DISTROs which don't enable x11.
Also adjust the SECTION since pango isn't really an X library.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-graphics/pango/pango.inc       |   10 ++++++----
 meta/recipes-graphics/pango/pango_1.28.4.bb |    2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index 5a8a5ae..a8e99e2 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -6,14 +6,15 @@ been done in the context of the GTK+ widget toolkit. Pango forms the \
 core of text and font handling for GTK+-2.x."
 HOMEPAGE = "http://www.pango.org/"
 BUGTRACKER = "http://bugzilla.gnome.org"
-SECTION = "x11/libs"
+SECTION = "libs"
 LICENSE = "LGPL"
 
-DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv virtual/libx11 libxft gtk-doc-native cairo"
+X11DEPENDS = "virtual/libx11 libxft"
+DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv gtk-doc-native cairo ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
 
 PACKAGES_DYNAMIC = "pango-module-*"
 
-RRECOMMENDS_${PN} = "pango-module-basic-x pango-module-basic-fc" 
+RRECOMMENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'x11', 'pango-module-basic-x', '', d)} pango-module-basic-fc" 
 
 inherit gnome
 
@@ -24,7 +25,8 @@ FULL_OPTIMIZATION_arm = "-O2"
 
 EXTRA_OECONF = "--disable-glibtest \
 		--enable-explicit-deps=no \
-	        --disable-debug"
+	        --disable-debug \
+		${@base_contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
 
 LEAD_SONAME = "libpango-1.0*"
 LIBV = "1.6.0"
diff --git a/meta/recipes-graphics/pango/pango_1.28.4.bb b/meta/recipes-graphics/pango/pango_1.28.4.bb
index 600f00b..68ab700 100644
--- a/meta/recipes-graphics/pango/pango_1.28.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.28.4.bb
@@ -2,7 +2,7 @@ require pango.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI += "file://no-tests.patch"
 
-- 
1.7.6



