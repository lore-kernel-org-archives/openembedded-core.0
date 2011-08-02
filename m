Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX19a0okdQSx/ksBa1d49Fb79vGqoH7a5zps=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QoABv-0005qB-Kp
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 10:19:08 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p728EfAe002486
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Aug 2011 03:14:42 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Aug 2011 03:14:41 -0500
Message-Id: <1312272881-15695-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH] automake: Fix issue with tar configure failing with large UID/GIDs
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
X-List-Received-Date: Tue, 02 Aug 2011 08:19:08 -0000

Add a fixup for trying to create ustar archives when the users
UID or GID is larger than the format allows.

Based on a patch from Tom Rini

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/recipes-devtools/automake/automake.inc        |    2 +-
 .../prefer-cpio-over-pax-for-ustar-archives.patch  |   26 ++++++++++++++++++++
 meta/recipes-devtools/automake/automake_1.11.1.bb  |    8 +++++-
 3 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/automake/automake/prefer-cpio-over-pax-for-ustar-archives.patch

diff --git a/meta/recipes-devtools/automake/automake.inc b/meta/recipes-devtools/automake/automake.inc
index beeec7b..96d797f 100644
--- a/meta/recipes-devtools/automake/automake.inc
+++ b/meta/recipes-devtools/automake/automake.inc
@@ -4,7 +4,7 @@ Standards. Automake requires the use of Autoconf."
 LICENSE = "GPLv2"
 HOMEPAGE = "http://www.gnu.org/software/automake/"
 SECTION = "devel"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${GNU_MIRROR}/automake/automake-${PV}.tar.bz2 "
 
diff --git a/meta/recipes-devtools/automake/automake/prefer-cpio-over-pax-for-ustar-archives.patch b/meta/recipes-devtools/automake/automake/prefer-cpio-over-pax-for-ustar-archives.patch
new file mode 100644
index 0000000..3fda937
--- /dev/null
+++ b/meta/recipes-devtools/automake/automake/prefer-cpio-over-pax-for-ustar-archives.patch
@@ -0,0 +1,26 @@
+Index: automake-1.11.1/m4/tar.m4
+===================================================================
+--- automake-1.11.1.orig/m4/tar.m4
++++ automake-1.11.1/m4/tar.m4
+@@ -30,7 +30,7 @@ m4_if([$1], [v7],
+               [m4_fatal([Unknown tar format])])
+ AC_MSG_CHECKING([how to create a $1 tar archive])
+ # Loop over all known methods to create a tar archive until one works.
+-_am_tools='gnutar m4_if([$1], [ustar], [plaintar]) pax cpio none'
++_am_tools='gnutar m4_if([$1], [ustar], [plaintar]) cpio pax none'
+ _am_tools=${am_cv_prog_tar_$1-$_am_tools}
+ # Do not fold the above two line into one, because Tru64 sh and
+ # Solaris sh will not grok spaces in the rhs of `-'.
+Index: automake-1.11.1/Makefile.in
+===================================================================
+--- automake-1.11.1.orig/Makefile.in
++++ automake-1.11.1/Makefile.in
+@@ -44,7 +44,7 @@ am__aclocal_m4_deps = $(top_srcdir)/m4/a
+ 	$(top_srcdir)/m4/missing.m4 $(top_srcdir)/m4/mkdirp.m4 \
+ 	$(top_srcdir)/m4/options.m4 $(top_srcdir)/m4/runlog.m4 \
+ 	$(top_srcdir)/m4/sanity.m4 $(top_srcdir)/m4/strip.m4 \
+-	$(top_srcdir)/m4/substnot.m4 $(top_srcdir)/m4/tar.m4 \
++	$(top_srcdir)/m4/substnot.m4 \
+ 	$(top_srcdir)/configure.ac
+ am__configure_deps = $(am__aclocal_m4_deps) $(CONFIGURE_DEPENDENCIES) \
+ 	$(ACLOCAL_M4)
diff --git a/meta/recipes-devtools/automake/automake_1.11.1.bb b/meta/recipes-devtools/automake/automake_1.11.1.bb
index b231a94..764b6fc 100644
--- a/meta/recipes-devtools/automake/automake_1.11.1.bb
+++ b/meta/recipes-devtools/automake/automake_1.11.1.bb
@@ -32,11 +32,17 @@ RDEPENDS_automake-native = "autoconf-native perl-native-runtime"
 PATHFIXPATCH = "file://path_prog_fixes.patch;patch=1"
 PATHFIXPATCH_virtclass-native = ""
 
-SRC_URI += "${PATHFIXPATCH}"
+SRC_URI += "${PATHFIXPATCH} \
+	    file://prefer-cpio-over-pax-for-ustar-archives.patch;patch=1"
 
 SRC_URI[md5sum] = "c2972c4d9b3e29c03d5f2af86249876f"
 SRC_URI[sha256sum] = "5b159d3c0e0a1f87de71b68bcb9f1a1c49e9e71749c9b723f17e2e1e0295c7ae"
 
+do_configure () {
+	touch ${S}/Makefile.in
+	autotools_do_configure
+}
+
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install
 	install -d ${D}${datadir}
-- 
1.7.3.4



