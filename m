Received: from outbound.icp-osb-irony-out9.iinet.net.au ([203.59.1.110])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1S4kFC-00049t-Bt
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 03:35:20 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AvwEAH50VU/LO4Se/2dsb2JhbABDtGeBB4JPAS0ogSmIBgyqfwGNZI0tgyIEiE6Sc4oPgnA
X-IronPort-AV: E=Sophos;i="4.73,537,1325433600"; d="scan'208";a="76240063"
Received: from unknown (HELO gentoo_vm.DMA.local) ([203.59.132.158])
	by outbound.icp-osb-irony-out9.iinet.net.au with ESMTP;
	06 Mar 2012 10:23:35 +0800
From: James Limbouris <james@digitalmatter.com.au>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2012 10:23:43 +0800
Message-Id: <1331000623-10956-1-git-send-email-james@digitalmatter.com.au>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH v2] gdk-pixbuf: Pick up ${NM} from the environment.
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
X-List-Received-Date: Tue, 06 Mar 2012 02:35:20 -0000

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
index 121babd..d75bf2a 100644
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
1.7.3.4



