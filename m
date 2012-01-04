Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RiNKr-0006xI-Vl
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 10:40:42 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Jan 2012 01:33:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="92779834"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by orsmga001.jf.intel.com with ESMTP; 04 Jan 2012 01:33:18 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org,
	nitin.a.kamble@intel.com
Date: Wed,  4 Jan 2012 17:33:18 +0800
Message-Id: <338da10abcd744ab75dfb184f8f81370727e5653.1325669461.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1325669461.git.dexuan.cui@intel.com>
References: <cover.1325669461.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1325669461.git.dexuan.cui@intel.com>
References: <cover.1325669461.git.dexuan.cui@intel.com>
Subject: [PATCH 1/1] mc: fix configure with automake 1.11.2
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
X-List-Received-Date: Wed, 04 Jan 2012 09:40:42 -0000

As Nitin said, "automake version 1.11.2 has made use of dir variables
more strict, the pkglibexec var can not have SCRIPTS suffix. Using pkgdata
instead."

Fixes this error:
| contrib/Makefile.am:10: `pkglibexecdir' is not a legitimate directory for `SCRIPTS'
| autoreconf: automake failed with exit status: 1
NOTE: package mc-4.8.1-r0: task do_configure: Failed

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../mc/files/fix_for_automake_1.11.2.patch         |   69 ++++++++++++++++++++
 meta/recipes-extended/mc/mc_4.8.1.bb               |    3 +-
 2 files changed, 71 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-extended/mc/files/fix_for_automake_1.11.2.patch

diff --git a/meta/recipes-extended/mc/files/fix_for_automake_1.11.2.patch b/meta/recipes-extended/mc/files/fix_for_automake_1.11.2.patch
new file mode 100644
index 0000000..9b610ca
--- /dev/null
+++ b/meta/recipes-extended/mc/files/fix_for_automake_1.11.2.patch
@@ -0,0 +1,69 @@
+Upstream-Status: Pending
+
+As Nitin said, "automake version 1.11.2 has made use of dir variables
+more strict, the pkglibexec var can not have SCRIPTS suffix. Using pkgdata
+instead."
+
+Fixes this error:
+| contrib/Makefile.am:10: `pkglibexecdir' is not a legitimate directory for `SCRIPTS'
+| autoreconf: automake failed with exit status: 1
+NOTE: package mc-4.8.1-r0: task do_configure: Failed
+
+Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
+Wed Jan  4 17:04:47 CST 2012
+
+diff -Nru mc-4.8.1.orig//contrib/Makefile.am mc-4.8.1/contrib/Makefile.am
+--- mc-4.8.1.orig//contrib/Makefile.am	2011-11-30 15:44:40.000000000 +0800
++++ mc-4.8.1/contrib/Makefile.am	2012-01-04 17:03:16.926911680 +0800
+@@ -7,7 +7,7 @@
+ SCRIPTS_IN = mc.csh.in mc.sh.in mc-wrapper.csh.in mc-wrapper.sh.in
+ SCRIPTS_OUT = mc.csh mc.sh mc-wrapper.csh mc-wrapper.sh
+ 
+-pkglibexec_SCRIPTS = $(SCRIPTS_OUT)
++pkgdata_SCRIPTS = $(SCRIPTS_OUT)
+ pkglibexecdir =		$(libexecdir)/@PACKAGE@
+ 
+ cfgdir = $(sysconfdir)/@PACKAGE@
+diff -Nru mc-4.8.1.orig//contrib/Makefile.in mc-4.8.1/contrib/Makefile.in
+--- mc-4.8.1.orig//contrib/Makefile.in	2011-12-13 18:10:52.000000000 +0800
++++ mc-4.8.1/contrib/Makefile.in	2012-01-04 17:03:16.926911680 +0800
+@@ -112,7 +112,7 @@
+   sed '$$!N;$$!N;$$!N;$$!N;$$!N;$$!N;$$!N;s/\n/ /g' | \
+   sed '$$!N;$$!N;$$!N;$$!N;s/\n/ /g'
+ am__installdirs = "$(DESTDIR)$(pkglibexecdir)" "$(DESTDIR)$(cfgdir)"
+-SCRIPTS = $(pkglibexec_SCRIPTS)
++SCRIPTS = $(pkgdata_SCRIPTS)
+ AM_V_GEN = $(am__v_GEN_$(V))
+ am__v_GEN_ = $(am__v_GEN_$(AM_DEFAULT_VERBOSITY))
+ am__v_GEN_0 = @echo "  GEN   " $@;
+@@ -372,7 +372,7 @@
+ noinst_DATA = README.xterm
+ SCRIPTS_IN = mc.csh.in mc.sh.in mc-wrapper.csh.in mc-wrapper.sh.in
+ SCRIPTS_OUT = mc.csh mc.sh mc-wrapper.csh mc-wrapper.sh
+-pkglibexec_SCRIPTS = $(SCRIPTS_OUT)
++pkgdata_SCRIPTS = $(SCRIPTS_OUT)
+ cfgdir = $(sysconfdir)/@PACKAGE@
+ cfg_DATA = \
+ 	$(LIBFILES_ADD)
+@@ -417,10 +417,10 @@
+ $(ACLOCAL_M4): @MAINTAINER_MODE_TRUE@ $(am__aclocal_m4_deps)
+ 	cd $(top_builddir) && $(MAKE) $(AM_MAKEFLAGS) am--refresh
+ $(am__aclocal_m4_deps):
+-install-pkglibexecSCRIPTS: $(pkglibexec_SCRIPTS)
++install-pkglibexecSCRIPTS: $(pkgdata_SCRIPTS)
+ 	@$(NORMAL_INSTALL)
+ 	test -z "$(pkglibexecdir)" || $(MKDIR_P) "$(DESTDIR)$(pkglibexecdir)"
+-	@list='$(pkglibexec_SCRIPTS)'; test -n "$(pkglibexecdir)" || list=; \
++	@list='$(pkgdata_SCRIPTS)'; test -n "$(pkglibexecdir)" || list=; \
+ 	for p in $$list; do \
+ 	  if test -f "$$p"; then d=; else d="$(srcdir)/"; fi; \
+ 	  if test -f "$$d$$p"; then echo "$$d$$p"; echo "$$p"; else :; fi; \
+@@ -445,7 +445,7 @@
+ 
+ uninstall-pkglibexecSCRIPTS:
+ 	@$(NORMAL_UNINSTALL)
+-	@list='$(pkglibexec_SCRIPTS)'; test -n "$(pkglibexecdir)" || exit 0; \
++	@list='$(pkgdata_SCRIPTS)'; test -n "$(pkglibexecdir)" || exit 0; \
+ 	files=`for p in $$list; do echo "$$p"; done | \
+ 	       sed -e 's,.*/,,;$(transform)'`; \
+ 	test -n "$$list" || exit 0; \
diff --git a/meta/recipes-extended/mc/mc_4.8.1.bb b/meta/recipes-extended/mc/mc_4.8.1.bb
index de7fe7a..b66c170 100644
--- a/meta/recipes-extended/mc/mc_4.8.1.bb
+++ b/meta/recipes-extended/mc/mc_4.8.1.bb
@@ -6,9 +6,10 @@ SECTION = "console/utils"
 DEPENDS = "ncurses glib-2.0"
 RDEPENDS_${PN} = "ncurses-terminfo"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2"
+SRC_URI += "file://fix_for_automake_1.11.2.patch"
 
 SRC_URI[md5sum] = "7d60c87d87b359831d976fa28034935e"
 SRC_URI[sha256sum] = "8f9bd09750c65a7786197a8f7e5a10a6dabf8c8737c564079ca393d8ecaf944d"
-- 
1.7.6



