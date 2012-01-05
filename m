Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RirGY-0007x7-JR
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 18:38:14 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jan 2012 09:30:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="92761368"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 05 Jan 2012 09:30:50 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 09:30:46 -0800
Message-Id: <bdaa325cc44c1ee106e88e2e900e63c161876c08.1325784550.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <b34432a20f8269f81bc541aa4ca06aa4425f4a76.1325784550.git.nitin.a.kamble@intel.com>
References: <b34432a20f8269f81bc541aa4ca06aa4425f4a76.1325784550.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1325784550.git.nitin.a.kamble@intel.com>
References: <cover.1325784550.git.nitin.a.kamble@intel.com>
Subject: [PATCH 6/7] mc: remove not needed fix for automake 1.11.2
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
X-List-Received-Date: Thu, 05 Jan 2012 17:38:14 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The pkglibexec_SCRIPTS pair is valid. the 1.11.2 introduced an bug
to make it invalid. Now the automake 1.11.2 recipe is fixed, so
no need for this fix for mc recipe.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../mc/files/fix_for_automake_1.11.2.patch         |   69 --------------------
 meta/recipes-extended/mc/mc_4.8.1.bb               |    3 +-
 2 files changed, 1 insertions(+), 71 deletions(-)
 delete mode 100644 meta/recipes-extended/mc/files/fix_for_automake_1.11.2.patch

diff --git a/meta/recipes-extended/mc/files/fix_for_automake_1.11.2.patch b/meta/recipes-extended/mc/files/fix_for_automake_1.11.2.patch
deleted file mode 100644
index 9b610ca..0000000
--- a/meta/recipes-extended/mc/files/fix_for_automake_1.11.2.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-Upstream-Status: Pending
-
-As Nitin said, "automake version 1.11.2 has made use of dir variables
-more strict, the pkglibexec var can not have SCRIPTS suffix. Using pkgdata
-instead."
-
-Fixes this error:
-| contrib/Makefile.am:10: `pkglibexecdir' is not a legitimate directory for `SCRIPTS'
-| autoreconf: automake failed with exit status: 1
-NOTE: package mc-4.8.1-r0: task do_configure: Failed
-
-Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
-Wed Jan  4 17:04:47 CST 2012
-
-diff -Nru mc-4.8.1.orig//contrib/Makefile.am mc-4.8.1/contrib/Makefile.am
---- mc-4.8.1.orig//contrib/Makefile.am	2011-11-30 15:44:40.000000000 +0800
-+++ mc-4.8.1/contrib/Makefile.am	2012-01-04 17:03:16.926911680 +0800
-@@ -7,7 +7,7 @@
- SCRIPTS_IN = mc.csh.in mc.sh.in mc-wrapper.csh.in mc-wrapper.sh.in
- SCRIPTS_OUT = mc.csh mc.sh mc-wrapper.csh mc-wrapper.sh
- 
--pkglibexec_SCRIPTS = $(SCRIPTS_OUT)
-+pkgdata_SCRIPTS = $(SCRIPTS_OUT)
- pkglibexecdir =		$(libexecdir)/@PACKAGE@
- 
- cfgdir = $(sysconfdir)/@PACKAGE@
-diff -Nru mc-4.8.1.orig//contrib/Makefile.in mc-4.8.1/contrib/Makefile.in
---- mc-4.8.1.orig//contrib/Makefile.in	2011-12-13 18:10:52.000000000 +0800
-+++ mc-4.8.1/contrib/Makefile.in	2012-01-04 17:03:16.926911680 +0800
-@@ -112,7 +112,7 @@
-   sed '$$!N;$$!N;$$!N;$$!N;$$!N;$$!N;$$!N;s/\n/ /g' | \
-   sed '$$!N;$$!N;$$!N;$$!N;s/\n/ /g'
- am__installdirs = "$(DESTDIR)$(pkglibexecdir)" "$(DESTDIR)$(cfgdir)"
--SCRIPTS = $(pkglibexec_SCRIPTS)
-+SCRIPTS = $(pkgdata_SCRIPTS)
- AM_V_GEN = $(am__v_GEN_$(V))
- am__v_GEN_ = $(am__v_GEN_$(AM_DEFAULT_VERBOSITY))
- am__v_GEN_0 = @echo "  GEN   " $@;
-@@ -372,7 +372,7 @@
- noinst_DATA = README.xterm
- SCRIPTS_IN = mc.csh.in mc.sh.in mc-wrapper.csh.in mc-wrapper.sh.in
- SCRIPTS_OUT = mc.csh mc.sh mc-wrapper.csh mc-wrapper.sh
--pkglibexec_SCRIPTS = $(SCRIPTS_OUT)
-+pkgdata_SCRIPTS = $(SCRIPTS_OUT)
- cfgdir = $(sysconfdir)/@PACKAGE@
- cfg_DATA = \
- 	$(LIBFILES_ADD)
-@@ -417,10 +417,10 @@
- $(ACLOCAL_M4): @MAINTAINER_MODE_TRUE@ $(am__aclocal_m4_deps)
- 	cd $(top_builddir) && $(MAKE) $(AM_MAKEFLAGS) am--refresh
- $(am__aclocal_m4_deps):
--install-pkglibexecSCRIPTS: $(pkglibexec_SCRIPTS)
-+install-pkglibexecSCRIPTS: $(pkgdata_SCRIPTS)
- 	@$(NORMAL_INSTALL)
- 	test -z "$(pkglibexecdir)" || $(MKDIR_P) "$(DESTDIR)$(pkglibexecdir)"
--	@list='$(pkglibexec_SCRIPTS)'; test -n "$(pkglibexecdir)" || list=; \
-+	@list='$(pkgdata_SCRIPTS)'; test -n "$(pkglibexecdir)" || list=; \
- 	for p in $$list; do \
- 	  if test -f "$$p"; then d=; else d="$(srcdir)/"; fi; \
- 	  if test -f "$$d$$p"; then echo "$$d$$p"; echo "$$p"; else :; fi; \
-@@ -445,7 +445,7 @@
- 
- uninstall-pkglibexecSCRIPTS:
- 	@$(NORMAL_UNINSTALL)
--	@list='$(pkglibexec_SCRIPTS)'; test -n "$(pkglibexecdir)" || exit 0; \
-+	@list='$(pkgdata_SCRIPTS)'; test -n "$(pkglibexecdir)" || exit 0; \
- 	files=`for p in $$list; do echo "$$p"; done | \
- 	       sed -e 's,.*/,,;$(transform)'`; \
- 	test -n "$$list" || exit 0; \
diff --git a/meta/recipes-extended/mc/mc_4.8.1.bb b/meta/recipes-extended/mc/mc_4.8.1.bb
index b66c170..78bbc9d 100644
--- a/meta/recipes-extended/mc/mc_4.8.1.bb
+++ b/meta/recipes-extended/mc/mc_4.8.1.bb
@@ -6,10 +6,9 @@ SECTION = "console/utils"
 DEPENDS = "ncurses glib-2.0"
 RDEPENDS_${PN} = "ncurses-terminfo"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2"
-SRC_URI += "file://fix_for_automake_1.11.2.patch"
 
 SRC_URI[md5sum] = "7d60c87d87b359831d976fa28034935e"
 SRC_URI[sha256sum] = "8f9bd09750c65a7786197a8f7e5a10a6dabf8c8737c564079ca393d8ecaf944d"
-- 
1.7.6.4



