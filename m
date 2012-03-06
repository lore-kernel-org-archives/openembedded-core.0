Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S4xvt-0003ce-5g
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 18:12:17 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Mar 2012 09:03:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="125714863"
Received: from unknown (HELO swold-mobl.verilan.com) ([10.255.15.180])
	by fmsmga001.fm.intel.com with ESMTP; 06 Mar 2012 09:03:32 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2012 09:03:18 -0800
Message-Id: <ba1a7ba9b62798d4e32636fba857591e0b106af3.1331053126.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1331053126.git.sgw@linux.intel.com>
References: <cover.1331053126.git.sgw@linux.intel.com>
In-Reply-To: <cover.1331053126.git.sgw@linux.intel.com>
References: <cover.1331053126.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 15/20] gdk-pixbuf: Pick up ${NM} from the environment.
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
X-List-Received-Date: Tue, 06 Mar 2012 17:12:18 -0000

From: James Limbouris <james@digitalmatter.com.au>

Signed-off-by: James Limbouris <james@digitalmatter.com.au>
---
 .../gdk-pixbuf-2.24.0/configure_nm.patch           |   18 ++++++++++++++++++
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb |    3 ++-
 2 files changed, 20 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/configure_nm.patch

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/configure_nm.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/configure_nm.patch
new file mode 100644
index 0000000..0460824
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/configure_nm.patch
@@ -0,0 +1,18 @@
+Pick up ${NM} from the environment.
+Upstream-Status: Inappropriate [configuration]
+Signed-off-by: James Limbouris <james@digitalmatter.com.au>
+
+Index: gdk-pixbuf-2.24.0/configure.ac
+===================================================================
+diff -uNr gdk-pixbuf-2.24.0/configure.ac gdk-pixbuf-2.24.0.mod/configure.ac
+--- gdk-pixbuf-2.24.0/configure.ac	2011-08-27 11:27:52.000000000 +0800
++++ gdk-pixbuf-2.24.0.mod/configure.ac	2012-02-28 14:48:36.481126410 +0800
+@@ -147,7 +147,7 @@
+ AC_SYS_LARGEFILE
+ 
+ AM_PROG_AS
+-AC_PATH_PROG(NM, nm, nm)
++AC_CHECK_TOOLS(NM, [$NM nm], nm)
+ 
+ AC_MSG_CHECKING([for some Win32 platform])
+ AS_CASE(["$host"],
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb
index 0e2067a..cbeca94 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb
@@ -11,6 +11,7 @@ SECTION = "libs"
 DEPENDS = "libpng glib-2.0 jpeg"
 
 SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.24/gdk-pixbuf-${PV}.tar.bz2 \
+           file://configure_nm.patch \
            file://hardcoded_libtool.patch \
            file://configure_fix.patch \
            "
@@ -18,7 +19,7 @@ SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.24/gdk-pixbuf-${
 SRC_URI[md5sum] = "d8ece3a4ade4a91c768328620e473ab8"
 SRC_URI[sha256sum] = "38d2630314e6d91976bffd833236f84fefa440a9038f86dc422820a39f2e3700"
 
-PR = "r4"
+PR = "r5"
 
 inherit autotools pkgconfig gettext
 
-- 
1.7.7.6



