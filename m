Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TvZRL-0004iV-8z
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 21:18:28 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jan 2013 12:03:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,480,1355126400"; d="scan'208";a="274626847"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.30])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jan 2013 12:03:02 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2013 22:03:12 +0200
Message-Id: <1358366592-13400-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] iptables: upgrade to 1.4.17
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Jan 2013 20:18:28 -0000

patch added to fix cross-compilation issues

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../fix-iptables-extensions-build-error.patch      |   44 ++++++++++
 .../iptables/fix-link-failure-ip6t-NETMAP.patch    |   86 ++++++++++++++++++++
 .../{iptables_1.4.16.3.bb => iptables_1.4.17.bb}   |    9 +-
 3 files changed, 135 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-extended/iptables/iptables/fix-iptables-extensions-build-error.patch
 create mode 100644 meta/recipes-extended/iptables/iptables/fix-link-failure-ip6t-NETMAP.patch
 rename meta/recipes-extended/iptables/{iptables_1.4.16.3.bb => iptables_1.4.17.bb} (85%)

diff --git a/meta/recipes-extended/iptables/iptables/fix-iptables-extensions-build-error.patch b/meta/recipes-extended/iptables/iptables/fix-iptables-extensions-build-error.patch
new file mode 100644
index 0000000..4cd919d
--- /dev/null
+++ b/meta/recipes-extended/iptables/iptables/fix-iptables-extensions-build-error.patch
@@ -0,0 +1,44 @@
+From 0a43f156e23edf616859ac5a8c90e41ccc5cb1cd Mon Sep 17 00:00:00 2001
+From: Cristian Iorga <cristian.iorga@intel.com>
+Date: Wed, 16 Jan 2013 20:14:43 +0200
+Subject: [PATCH] extensions: fix iptables extensions build error            
+ in cross-compilation environments
+
+libtool is properly declared and used for cross-platform
+build environments
+
+Upstream-Status: Pending
+
+Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
+---
+ extensions/GNUmakefile.in |    5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/extensions/GNUmakefile.in b/extensions/GNUmakefile.in
+index adad4d6..befb1fb 100644
+--- a/extensions/GNUmakefile.in
++++ b/extensions/GNUmakefile.in
+@@ -13,6 +13,7 @@ xtlibdir     = @xtlibdir@
+ 
+ CC                 = @CC@
+ CCLD               = ${CC}
++LIBTOOL            = @LIBTOOL@
+ CFLAGS             = @CFLAGS@
+ CPPFLAGS           = @CPPFLAGS@
+ LDFLAGS            = @LDFLAGS@
+@@ -94,10 +95,10 @@ lib%.so: lib%.la
+ 	${AM_VERBOSE_NULL} ln -fs .libs/$@ $@
+ 
+ lib%.la: lib%.lo
+-	${AM_VERBOSE_CCLD} ../libtool ${AM_LIBTOOL_SILENT} --tag=CC --mode=link ${CCLD} ${AM_LDFLAGS} -module ${LDFLAGS} -o $@ $< ../libxtables/libxtables.la ${$*_LIBADD} -rpath ${xtlibdir}
++	${AM_VERBOSE_CCLD} ${LIBTOOL} ${AM_LIBTOOL_SILENT} --tag=CC --mode=link ${CCLD} ${AM_LDFLAGS} -module ${LDFLAGS} -o $@ $< ../libxtables/libxtables.la ${$*_LIBADD} -rpath ${xtlibdir}
+ 
+ lib%.lo: ${srcdir}/lib%.c
+-	${AM_VERBOSE_CC} ../libtool ${AM_LIBTOOL_SILENT} --tag=CC --mode=compile ${CC} ${AM_CPPFLAGS} ${AM_DEPFLAGS} ${AM_CFLAGS} -D_INIT=lib$*_init ${CFLAGS} -o $@ -c $<
++	${AM_VERBOSE_CC} ${LIBTOOL} ${AM_LIBTOOL_SILENT} --tag=CC --mode=compile ${CC} ${AM_CPPFLAGS} ${AM_DEPFLAGS} ${AM_CFLAGS} -D_INIT=lib$*_init ${CFLAGS} -o $@ -c $<
+ 
+ libxt_NOTRACK.so: libxt_CT.so
+ 	${AM_VERBOSE_GEN} ln -fs $< $@
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-extended/iptables/iptables/fix-link-failure-ip6t-NETMAP.patch b/meta/recipes-extended/iptables/iptables/fix-link-failure-ip6t-NETMAP.patch
new file mode 100644
index 0000000..aa8efd6
--- /dev/null
+++ b/meta/recipes-extended/iptables/iptables/fix-link-failure-ip6t-NETMAP.patch
@@ -0,0 +1,86 @@
+From 68e77a26111ee6b8f10c735a76891a7de6d57ee6 Mon Sep 17 00:00:00 2001
+From: Jan Engelhardt <jengelh@inai.de>
+Date: Tue, 1 Jan 2013 22:47:51 +0000
+Subject: [PATCH] build: resolve link failure for ip6t_NETMAP
+
+Link stage of libip6t_NETMAP failed since recently.
+
+  CCLD     libip6t_NETMAP.so
+/usr/lib64/gcc/x86_64-suse-linux/4.7/../../../../x86_64-suse-linux/bin/ld:
+cannot find -lip6tc
+
+libip6t_NETMAP.c uses the "ipv6_prefix_length" function from
+libip6tc.so; "-lip6tc" is used in the Makefile, but, the directory to
+it is not specified.
+
+Why does the link succeed for some people? Because
+/usr/lib(64)/libip6tc.so satisfies -lip6tc, but not all environments,
+especially those without iptables development files, have that file,
+hence this link error can happen.
+
+By suggestion of Mike Frysinger, this patch uses libtool to produce
+and link the plugins.
+
+Upstream-Status: Backport
+
+Signed-off-by: Jan Engelhardt <jengelh@inai.de>
+Acked-by: Mike Frysinger <vapier@gentoo.org>
+Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
+---
+ extensions/GNUmakefile.in |   20 ++++++++++++--------
+ 1 files changed, 12 insertions(+), 8 deletions(-)
+
+diff --git a/extensions/GNUmakefile.in b/extensions/GNUmakefile.in
+index e71e3ff..adad4d6 100644
+--- a/extensions/GNUmakefile.in
++++ b/extensions/GNUmakefile.in
+@@ -33,6 +33,7 @@ AM_VERBOSE_CXX    = @echo "  CXX     " $@;
+ AM_VERBOSE_CXXLD  = @echo "  CXXLD   " $@;
+ AM_VERBOSE_AR     = @echo "  AR      " $@;
+ AM_VERBOSE_GEN    = @echo "  GEN     " $@;
++AM_VERBOSE_NULL   = @
+ endif
+ 
+ #
+@@ -75,7 +76,7 @@ install: ${targets_install}
+ 	if test -n "${targets_install}"; then install -pm0755 $^ "${DESTDIR}${xtlibdir}/"; fi;
+ 
+ clean:
+-	rm -f *.o *.oo *.so *.a {matches,targets}.man initext.c initext4.c initext6.c;
++	rm -f *.la *.o *.lo *.so *.a {matches,targets}.man initext.c initext4.c initext6.c;
+ 	rm -f .*.d .*.dd;
+ 
+ distclean: clean
+@@ -89,19 +90,22 @@ init%.o: init%.c
+ #
+ #	Shared libraries
+ #
+-lib%.so: lib%.oo
+-	${AM_VERBOSE_CCLD} ${CCLD} ${AM_LDFLAGS} -shared ${LDFLAGS} -o $@ $< -L../libxtables/.libs -lxtables ${$*_LIBADD};
++lib%.so: lib%.la
++	${AM_VERBOSE_NULL} ln -fs .libs/$@ $@
+ 
+-lib%.oo: ${srcdir}/lib%.c
+-	${AM_VERBOSE_CC} ${CC} ${AM_CPPFLAGS} ${AM_DEPFLAGS} ${AM_CFLAGS} -D_INIT=lib$*_init -DPIC -fPIC ${CFLAGS} -o $@ -c $<;
++lib%.la: lib%.lo
++	${AM_VERBOSE_CCLD} ../libtool ${AM_LIBTOOL_SILENT} --tag=CC --mode=link ${CCLD} ${AM_LDFLAGS} -module ${LDFLAGS} -o $@ $< ../libxtables/libxtables.la ${$*_LIBADD} -rpath ${xtlibdir}
++
++lib%.lo: ${srcdir}/lib%.c
++	${AM_VERBOSE_CC} ../libtool ${AM_LIBTOOL_SILENT} --tag=CC --mode=compile ${CC} ${AM_CPPFLAGS} ${AM_DEPFLAGS} ${AM_CFLAGS} -D_INIT=lib$*_init ${CFLAGS} -o $@ -c $<
+ 
+ libxt_NOTRACK.so: libxt_CT.so
+-	ln -fs $< $@
++	${AM_VERBOSE_GEN} ln -fs $< $@
+ libxt_state.so: libxt_conntrack.so
+-	ln -fs $< $@
++	${AM_VERBOSE_GEN} ln -fs $< $@
+ 
+ # Need the LIBADDs in iptables/Makefile.am too for libxtables_la_LIBADD
+-ip6t_NETMAP_LIBADD  = -lip6tc
++ip6t_NETMAP_LIBADD  = ../libiptc/libip6tc.la
+ xt_RATEEST_LIBADD   = -lm
+ xt_statistic_LIBADD = -lm
+ 
+-- 
+1.7.2.5
+
diff --git a/meta/recipes-extended/iptables/iptables_1.4.16.3.bb b/meta/recipes-extended/iptables/iptables_1.4.17.bb
similarity index 85%
rename from meta/recipes-extended/iptables/iptables_1.4.16.3.bb
rename to meta/recipes-extended/iptables/iptables_1.4.17.bb
index 448748b..f8ef7b6 100644
--- a/meta/recipes-extended/iptables/iptables_1.4.16.3.bb
+++ b/meta/recipes-extended/iptables/iptables_1.4.17.bb
@@ -22,10 +22,11 @@ FILES_${PN} =+ "${libdir}/xtables/ ${datadir}/xtables"
 FILES_${PN}-dbg =+ "${libdir}/xtables/.debug"
 
 SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
-           file://types.h-add-defines-that-are-required-for-if_packet.patch"
-
-SRC_URI[md5sum] = "6dd40c12fb8f4c4312a0f8434369fbcd"
-SRC_URI[sha256sum] = "643ccf34099d53d5b839e1d889c05627745a51ec122648e76a9fcec3a8a9ec79"
+           file://types.h-add-defines-that-are-required-for-if_packet.patch \
+           file://fix-link-failure-ip6t-NETMAP.patch \
+           file://fix-iptables-extensions-build-error.patch"
+SRC_URI[md5sum] = "c3fb2ffd5b39d0d54b06ccc4c8660116"
+SRC_URI[sha256sum] = "51e7a769469383b6ad308a6a19cdd2bd813cf4593e21a156a543a1cd70554925"
 
 inherit autotools
 
-- 
1.7.10.4



