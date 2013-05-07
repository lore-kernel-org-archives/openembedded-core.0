Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UZeZY-0001oh-Kj
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 11:52:41 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 May 2013 02:34:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,627,1363158000"; d="scan'208";a="309461984"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 07 May 2013 02:34:33 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2013 12:35:24 +0300
Message-Id: <1367919324-989-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH V2] iptables: upgrade to 1.4.18
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
X-List-Received-Date: Tue, 07 May 2013 09:53:01 -0000

fix-link-failure-ip6t-NETMAP.patch removed;
already included in upstream.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../iptables/fix-link-failure-ip6t-NETMAP.patch    |   86 --------------------
 .../{iptables_1.4.17.bb => iptables_1.4.18.bb}     |    8 +-
 2 files changed, 3 insertions(+), 91 deletions(-)
 delete mode 100644 meta/recipes-extended/iptables/iptables/fix-link-failure-ip6t-NETMAP.patch
 rename meta/recipes-extended/iptables/{iptables_1.4.17.bb => iptables_1.4.18.bb} (90%)

diff --git a/meta/recipes-extended/iptables/iptables/fix-link-failure-ip6t-NETMAP.patch b/meta/recipes-extended/iptables/iptables/fix-link-failure-ip6t-NETMAP.patch
deleted file mode 100644
index aa8efd6..0000000
--- a/meta/recipes-extended/iptables/iptables/fix-link-failure-ip6t-NETMAP.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 68e77a26111ee6b8f10c735a76891a7de6d57ee6 Mon Sep 17 00:00:00 2001
-From: Jan Engelhardt <jengelh@inai.de>
-Date: Tue, 1 Jan 2013 22:47:51 +0000
-Subject: [PATCH] build: resolve link failure for ip6t_NETMAP
-
-Link stage of libip6t_NETMAP failed since recently.
-
-  CCLD     libip6t_NETMAP.so
-/usr/lib64/gcc/x86_64-suse-linux/4.7/../../../../x86_64-suse-linux/bin/ld:
-cannot find -lip6tc
-
-libip6t_NETMAP.c uses the "ipv6_prefix_length" function from
-libip6tc.so; "-lip6tc" is used in the Makefile, but, the directory to
-it is not specified.
-
-Why does the link succeed for some people? Because
-/usr/lib(64)/libip6tc.so satisfies -lip6tc, but not all environments,
-especially those without iptables development files, have that file,
-hence this link error can happen.
-
-By suggestion of Mike Frysinger, this patch uses libtool to produce
-and link the plugins.
-
-Upstream-Status: Backport
-
-Signed-off-by: Jan Engelhardt <jengelh@inai.de>
-Acked-by: Mike Frysinger <vapier@gentoo.org>
-Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
----
- extensions/GNUmakefile.in |   20 ++++++++++++--------
- 1 files changed, 12 insertions(+), 8 deletions(-)
-
-diff --git a/extensions/GNUmakefile.in b/extensions/GNUmakefile.in
-index e71e3ff..adad4d6 100644
---- a/extensions/GNUmakefile.in
-+++ b/extensions/GNUmakefile.in
-@@ -33,6 +33,7 @@ AM_VERBOSE_CXX    = @echo "  CXX     " $@;
- AM_VERBOSE_CXXLD  = @echo "  CXXLD   " $@;
- AM_VERBOSE_AR     = @echo "  AR      " $@;
- AM_VERBOSE_GEN    = @echo "  GEN     " $@;
-+AM_VERBOSE_NULL   = @
- endif
- 
- #
-@@ -75,7 +76,7 @@ install: ${targets_install}
- 	if test -n "${targets_install}"; then install -pm0755 $^ "${DESTDIR}${xtlibdir}/"; fi;
- 
- clean:
--	rm -f *.o *.oo *.so *.a {matches,targets}.man initext.c initext4.c initext6.c;
-+	rm -f *.la *.o *.lo *.so *.a {matches,targets}.man initext.c initext4.c initext6.c;
- 	rm -f .*.d .*.dd;
- 
- distclean: clean
-@@ -89,19 +90,22 @@ init%.o: init%.c
- #
- #	Shared libraries
- #
--lib%.so: lib%.oo
--	${AM_VERBOSE_CCLD} ${CCLD} ${AM_LDFLAGS} -shared ${LDFLAGS} -o $@ $< -L../libxtables/.libs -lxtables ${$*_LIBADD};
-+lib%.so: lib%.la
-+	${AM_VERBOSE_NULL} ln -fs .libs/$@ $@
- 
--lib%.oo: ${srcdir}/lib%.c
--	${AM_VERBOSE_CC} ${CC} ${AM_CPPFLAGS} ${AM_DEPFLAGS} ${AM_CFLAGS} -D_INIT=lib$*_init -DPIC -fPIC ${CFLAGS} -o $@ -c $<;
-+lib%.la: lib%.lo
-+	${AM_VERBOSE_CCLD} ../libtool ${AM_LIBTOOL_SILENT} --tag=CC --mode=link ${CCLD} ${AM_LDFLAGS} -module ${LDFLAGS} -o $@ $< ../libxtables/libxtables.la ${$*_LIBADD} -rpath ${xtlibdir}
-+
-+lib%.lo: ${srcdir}/lib%.c
-+	${AM_VERBOSE_CC} ../libtool ${AM_LIBTOOL_SILENT} --tag=CC --mode=compile ${CC} ${AM_CPPFLAGS} ${AM_DEPFLAGS} ${AM_CFLAGS} -D_INIT=lib$*_init ${CFLAGS} -o $@ -c $<
- 
- libxt_NOTRACK.so: libxt_CT.so
--	ln -fs $< $@
-+	${AM_VERBOSE_GEN} ln -fs $< $@
- libxt_state.so: libxt_conntrack.so
--	ln -fs $< $@
-+	${AM_VERBOSE_GEN} ln -fs $< $@
- 
- # Need the LIBADDs in iptables/Makefile.am too for libxtables_la_LIBADD
--ip6t_NETMAP_LIBADD  = -lip6tc
-+ip6t_NETMAP_LIBADD  = ../libiptc/libip6tc.la
- xt_RATEEST_LIBADD   = -lm
- xt_statistic_LIBADD = -lm
- 
--- 
-1.7.2.5
-
diff --git a/meta/recipes-extended/iptables/iptables_1.4.17.bb b/meta/recipes-extended/iptables/iptables_1.4.18.bb
similarity index 90%
rename from meta/recipes-extended/iptables/iptables_1.4.17.bb
rename to meta/recipes-extended/iptables/iptables_1.4.18.bb
index aa932ce..bb8718f 100644
--- a/meta/recipes-extended/iptables/iptables_1.4.17.bb
+++ b/meta/recipes-extended/iptables/iptables_1.4.18.bb
@@ -7,8 +7,6 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263\
                     file://iptables/iptables.c;beginline=13;endline=25;md5=c5cffd09974558cf27d0f763df2a12dc"
 
-PR = "r1"
-
 RRECOMMENDS_${PN} = "kernel-module-x-tables \
                      kernel-module-ip-tables \
                      kernel-module-iptable-filter \
@@ -23,12 +21,12 @@ FILES_${PN}-dbg =+ "${libdir}/xtables/.debug"
 
 SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
            file://types.h-add-defines-that-are-required-for-if_packet.patch \
-           file://fix-link-failure-ip6t-NETMAP.patch \
            file://fix-iptables-extensions-build-error.patch \
            file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
           "
-SRC_URI[md5sum] = "c3fb2ffd5b39d0d54b06ccc4c8660116"
-SRC_URI[sha256sum] = "51e7a769469383b6ad308a6a19cdd2bd813cf4593e21a156a543a1cd70554925"
+
+SRC_URI[md5sum] = "a819199d5ec013b82da13a8ffbba857e"
+SRC_URI[sha256sum] = "14a99fb8b0ca22027a9ac6eb72fa32c834ceb3073820e0ba79bf251c6a7bcf3c"
 
 inherit autotools
 
-- 
1.7.10.4



