Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1T4Ry4-0000Nh-5G
	for Openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 09:36:40 +0200
Received: from puchatek.dom (84-10-244-25.dynamic.chello.pl [84.10.244.25])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 94221D22DE;
	Thu, 23 Aug 2012 09:24:36 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: Openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2012 09:24:28 +0200
Message-Id: <1345706669-28914-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] subversion: update to 1.7.6
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
X-List-Received-Date: Thu, 23 Aug 2012 07:36:40 -0000

Dropped --without-apache option as it does not exists.

Added patch from subversion-users ML to not build mod_dontdothat.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../subversion-1.7.6/fix-install-depends.patch     |   48 +++++++++
 .../libtool2.patch                                 |    0
 ...ersion-1.7.6_mod_dontdothat_svnserve_only.patch |  108 ++++++++++++++++++++
 .../{subversion_1.7.2.bb => subversion_1.7.6.bb}   |    9 +-
 4 files changed, 160 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.6/fix-install-depends.patch
 rename meta/recipes-devtools/subversion/{subversion-1.7.2 => subversion-1.7.6}/libtool2.patch (100%)
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.6/subversion-1.7.6_mod_dontdothat_svnserve_only.patch
 rename meta/recipes-devtools/subversion/{subversion_1.7.2.bb => subversion_1.7.6.bb} (79%)

diff --git a/meta/recipes-devtools/subversion/subversion-1.7.6/fix-install-depends.patch b/meta/recipes-devtools/subversion/subversion-1.7.6/fix-install-depends.patch
new file mode 100644
index 0000000..fb79b8c
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion-1.7.6/fix-install-depends.patch
@@ -0,0 +1,48 @@
+install-neon-lib should depend on libsvn_delta's installation
+
+install-neon-lib needs libsvn_delta-1.la which will be regenerated
+during libsvn_delta-1.la's installation, if libsvn_delta-1.la is
+in regenerating and at the same time install-neon-lib links it, the
+error willl happen.
+
+Let install-neon-lib run after libsvn_delta-1.la is installed will fix
+the problem.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ build-outputs.mk |    2 +-
+ build.conf       |    2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+--- subversion-1.7.6.orig/build-outputs.mk
++++ subversion-1.7.6/build-outputs.mk
+@@ -983,11 +983,11 @@ install-locale: subversion/po/de.mo subv
+ 	$(MKDIR) $(DESTDIR)$(localedir)/zh_CN/LC_MESSAGES
+ 	cd subversion/po ; $(INSTALL_LOCALE) zh_CN.mo $(DESTDIR)$(localedir)/zh_CN/LC_MESSAGES/$(PACKAGE_NAME).mo
+ 	$(MKDIR) $(DESTDIR)$(localedir)/zh_TW/LC_MESSAGES
+ 	cd subversion/po ; $(INSTALL_LOCALE) zh_TW.mo $(DESTDIR)$(localedir)/zh_TW/LC_MESSAGES/$(PACKAGE_NAME).mo
+ 
+-install-neon-lib: subversion/libsvn_ra_neon/libsvn_ra_neon-1.la 
++install-neon-lib: subversion/libsvn_ra_neon/libsvn_ra_neon-1.la $(SVN_FS_LIB_INSTALL_DEPS)
+ 	$(MKDIR) $(DESTDIR)$(neon_libdir)
+ 	cd subversion/libsvn_ra_neon ; $(INSTALL_NEON_LIB) libsvn_ra_neon-1.la $(DESTDIR)$(neon_libdir)/libsvn_ra_neon-1.la
+ 
+ install-ramod-lib: subversion/libsvn_fs/libsvn_fs-1.la subversion/libsvn_ra_svn/libsvn_ra_svn-1.la subversion/libsvn_repos/libsvn_repos-1.la subversion/libsvn_ra_local/libsvn_ra_local-1.la 
+ 	$(MKDIR) $(DESTDIR)$(ramod_libdir)
+--- subversion-1.7.6.orig/build.conf
++++ subversion-1.7.6/build.conf
+@@ -270,10 +270,12 @@ msvc-export = svn_ra.h private\svn_ra_pr
+ [libsvn_ra_neon]
+ type = ra-module
+ path = subversion/libsvn_ra_neon
+ install = neon-lib
+ libs = libsvn_delta libsvn_subr aprutil apriconv apr neon
++# conditionally add more dependencies
++add-install-deps = $(SVN_FS_LIB_INSTALL_DEPS)
+ msvc-static = yes
+ 
+ # Accessing repositories via DAV through serf
+ [libsvn_ra_serf]
+ type = ra-module
diff --git a/meta/recipes-devtools/subversion/subversion-1.7.2/libtool2.patch b/meta/recipes-devtools/subversion/subversion-1.7.6/libtool2.patch
similarity index 100%
rename from meta/recipes-devtools/subversion/subversion-1.7.2/libtool2.patch
rename to meta/recipes-devtools/subversion/subversion-1.7.6/libtool2.patch
diff --git a/meta/recipes-devtools/subversion/subversion-1.7.6/subversion-1.7.6_mod_dontdothat_svnserve_only.patch b/meta/recipes-devtools/subversion/subversion-1.7.6/subversion-1.7.6_mod_dontdothat_svnserve_only.patch
new file mode 100644
index 0000000..77f9135
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion-1.7.6/subversion-1.7.6_mod_dontdothat_svnserve_only.patch
@@ -0,0 +1,108 @@
+Patch taken from subversion-users ML.
+
+From: Roman Plessl <roman.plessl_at_oetiker.ch> 
+Date: Thu, 16 Aug 2012 09:48:32 +0200 (CEST)
+
+Hi All, 
+I try to compile and installe the new subversion 1.7.6 using my build 
+system. I use svnserve as standalone subversion server so my build 
+is not using the apache bindings. 
+I got the following compile error for the module mod_dontdothat: 
+... 
+/bin/bash /scratch/build/subversion-1.7.6-rp/subversion-1.7.6/libtool 
+--tag=CC --silent --mode=compile gcc 
+-I/usr/pack/subversion-1.7.6-rp/include -DLINUX=2 -D_REENTRANT 
+-D_GNU_SOURCE -g -O2 -g -O2 -pthread 
+-Werror=implicit-function-declaration -I./subversion/include 
+-I./subversion -I/usr/pack/subversion-1.7.6-rp/include/apr-1 
+-I/usr/pack/subversion-1.7.6-rp/include/apr-1 
+-I/usr/pack/subversion-1.7.6-rp/include 
+-I/usr/pack/subversion-1.7.6-rp/include/neon 
+-I/usr/pack/subversion-1.7.6-rp/include/serf-1 -o 
+tools/server-side/mod_dontdothat/mod_dontdothat.lo -c 
+tools/server-side/mod_dontdothat/mod_dontdothat.c 
+tools/server-side/mod_dontdothat/mod_dontdothat.c:25:19: error: httpd.h: 
+No such file or directory 
+tools/server-side/mod_dontdothat/mod_dontdothat.c:26:25: error: 
+http_config.h: No such file or directory 
+tools/server-side/mod_dontdothat/mod_dontdothat.c:27:27: error: 
+http_protocol.h: No such file or directory 
+tools/server-side/mod_dontdothat/mod_dontdothat.c:28:26: error: 
+http_request.h: No such file or directory 
+tools/server-side/mod_dontdothat/mod_dontdothat.c:29:22: error: 
+http_log.h: No such file or directory 
+tools/server-side/mod_dontdothat/mod_dontdothat.c:30:25: error: 
+util_filter.h: No such file or directory 
+tools/server-side/mod_dontdothat/mod_dontdothat.c:31:23: error: 
+ap_config.h: No such file or directory 
+... 
+I suppose the module mod_dontdothat should be only build with activated 
+'apache-mod's . Maybe the build target declaration has been forget when 
+moving the target for subversion 1.7.6. 
+... 
+checking for Apache module support via DSO through APXS... no 
+================================================================== 
+WARNING: skipping the build of mod_dav_svn 
+          try using --with-apxs 
+================================================================== 
+... 
+Could you check that? 
+I have used the attached patch to fix it for myself. 
+Cheers 
+Roman 
+--
+Roman Plessl            phone:        +41 (62) 775 9904
+OETIKER+PARTNER AG      email:        roman.plessl_at_oetiker.ch
+Aarweg 15               web:          http://it.oetiker.ch
+CH-4600 Olten           switch board: +41 (62) 775 9900
+
+
+
+---
+ build-outputs.mk |    4 ++--
+ build.conf       |    2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+--- subversion-1.7.6.orig/build-outputs.mk
++++ subversion-1.7.6/build-outputs.mk
+@@ -823,11 +823,11 @@ subversion/tests/libsvn_delta/window-tes
+ 
+ ########################################
+ # Section 6: Install-Group build targets
+ ########################################
+ 
+-apache-mod: subversion/mod_authz_svn/mod_authz_svn.la subversion/mod_dav_svn/mod_dav_svn.la
++apache-mod: subversion/mod_authz_svn/mod_authz_svn.la subversion/mod_dav_svn/mod_dav_svn.la tools/server-side/mod_dontdothat/mod_dontdothat.la
+ 
+ bdb-lib: subversion/libsvn_fs_base/libsvn_fs_base-1.la
+ 
+ bdb-test: subversion/tests/libsvn_fs_base/changes-test$(EXEEXT) subversion/tests/libsvn_fs_base/fs-base-test$(EXEEXT) subversion/tests/libsvn_fs_base/strings-reps-test$(EXEEXT)
+ 
+@@ -875,11 +875,11 @@ swig-rb: subversion/bindings/swig/ruby/c
+ 
+ swig-rb-lib: subversion/bindings/swig/ruby/libsvn_swig_ruby/libsvn_swig_ruby-1.la
+ 
+ test: subversion/tests/cmdline/atomic-ra-revprop-change$(EXEEXT) subversion/tests/libsvn_subr/auth-test$(EXEEXT) subversion/tests/libsvn_subr/cache-test$(EXEEXT) subversion/tests/libsvn_subr/checksum-test$(EXEEXT) subversion/tests/libsvn_client/client-test$(EXEEXT) subversion/tests/libsvn_subr/compat-test$(EXEEXT) subversion/tests/libsvn_subr/config-test$(EXEEXT) subversion/tests/libsvn_wc/db-test$(EXEEXT) subversion/tests/libsvn_diff/diff-diff3-test$(EXEEXT) subversion/tests/libsvn_subr/dirent_uri-test$(EXEEXT) subversion/tests/libsvn_wc/entries-compat-test$(EXEEXT) subversion/tests/cmdline/entries-dump$(EXEEXT) subversion/tests/libsvn_subr/error-test$(EXEEXT) subversion/tests/libsvn_fs_fs/fs-pack-test$(EXEEXT) subversion/tests/libsvn_fs/fs-test$(EXEEXT) subversion/tests/libsvn_subr/hashdump-test$(EXEEXT) subversion/tests/libsvn_test-1.la subversion/tests/libsvn_fs/locks-test$(EXEEXT) subversion/tests/libsvn_subr/mergeinfo-test$(EXEEXT) subversion/tests/libsvn_wc/op-depth-test$(EX
 EEXT) subversion/tests/libsvn_subr/opt-test$(EXEEXT) subversion/tests/libsvn_diff/parse-diff-test$(EXEEXT) subversion/tests/libsvn_subr/path-test$(EXEEXT) subversion/tests/libsvn_wc/pristine-store-test$(EXEEXT) subversion/tests/libsvn_ra_local/ra-local-test$(EXEEXT) subversion/tests/libsvn_delta/random-test$(EXEEXT) subversion/tests/libsvn_repos/repos-test$(EXEEXT) subversion/tests/libsvn_subr/revision-test$(EXEEXT) subversion/tests/libsvn_subr/skel-test$(EXEEXT) subversion/tests/libsvn_subr/stream-test$(EXEEXT) subversion/tests/libsvn_subr/string-test$(EXEEXT) subversion/tests/libsvn_subr/subst_translate-test$(EXEEXT) subversion/tests/libsvn_delta/svndiff-test$(EXEEXT) subversion/tests/libsvn_subr/target-test$(EXEEXT) subversion/tests/libsvn_subr/time-test$(EXEEXT) subversion/tests/libsvn_subr/translate-test$(EXEEXT) subversion/tests/libsvn_wc/tree-conflict-data-test$(EXEEXT) subversion/tests/libsvn_subr/utf-test$(EXEEXT) subversion/tests/libsvn_delta/vdelta-test$(EXEEXT) subversio
 n/tests/libsvn_wc/wc-incomplete-tester$(EXEEXT) subversion/tests/libsvn_wc/wc-lock-tester$(EXEEXT) subversion/tests/libsvn_delta/window-test$(EXEEXT)
+ 
+-tools: tools/diff/diff$(EXEEXT) tools/diff/diff3$(EXEEXT) tools/diff/diff4$(EXEEXT) tools/server-side/mod_dontdothat/mod_dontdothat.la tools/server-side/svn-populate-node-origins-index$(EXEEXT) tools/server-side/svn-rep-sharing-stats$(EXEEXT) tools/server-side/svnauthz-validate$(EXEEXT) tools/client-side/svnmucc/svnmucc$(EXEEXT) tools/dev/svnraisetreeconflict/svnraisetreeconflict$(EXEEXT)
++tools: tools/diff/diff$(EXEEXT) tools/diff/diff3$(EXEEXT) tools/diff/diff4$(EXEEXT) tools/server-side/svn-populate-node-origins-index$(EXEEXT) tools/server-side/svn-rep-sharing-stats$(EXEEXT) tools/server-side/svnauthz-validate$(EXEEXT) tools/client-side/svnmucc/svnmucc$(EXEEXT) tools/dev/svnraisetreeconflict/svnraisetreeconflict$(EXEEXT)
+ 
+ 
+ ########################################
+ # Section 7: Install-Group install targets
+ ########################################
+--- subversion-1.7.6.orig/build.conf
++++ subversion-1.7.6/build.conf
+@@ -367,11 +367,11 @@ msvc-libs = libhttpd.lib
+ description = Apache Httpd module to block certain kinds of Apache Subversion requests
+ type = apache-mod
+ path = tools/server-side/mod_dontdothat
+ nonlibs = mod_dav_svn apr aprutil
+ libs = libsvn_subr xml
+-install = tools
++install = apache-mod
+ msvc-libs = libhttpd.lib
+ 
+ # ----------------------------------------------------------------------------
+ #
+ # CONSTRUCTED HEADERS
diff --git a/meta/recipes-devtools/subversion/subversion_1.7.2.bb b/meta/recipes-devtools/subversion/subversion_1.7.6.bb
similarity index 79%
rename from meta/recipes-devtools/subversion/subversion_1.7.2.bb
rename to meta/recipes-devtools/subversion/subversion_1.7.6.bb
index c3e6763..b21d5be 100644
--- a/meta/recipes-devtools/subversion/subversion_1.7.2.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.7.6.bb
@@ -7,21 +7,20 @@ HOMEPAGE = "http://subversion.tigris.org"
 
 BBCLASSEXTEND = "native"
 
-PR = "r5"
-
 inherit gettext
 
 SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://libtool2.patch \
            file://fix-install-depends.patch \
+           file://subversion-1.7.6_mod_dontdothat_svnserve_only.patch \
 "
-SRC_URI[md5sum] = "1e5dfffd27be080672e5a042564368a8"
-SRC_URI[sha256sum] = "7eb3e1ae2b0385e1cc20ca9e1839e0ef0ac98a7455dc52ba4cdf567547bfc517"
+SRC_URI[md5sum] = "4baa434db7709bb059b05d02a2547663"
+SRC_URI[sha256sum] = "d1a4f13c5c992a1527a2aeac262c6f54e073963ce1d13abfabb2a90980fa7d05"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a14fd2da3134e40a087eb4326a4ecd4"
 
 EXTRA_OECONF = " \
-                --without-berkeley-db --without-apxs --without-apache \
+                --without-berkeley-db --without-apxs \
                 --without-swig --with-apr=${STAGING_BINDIR_CROSS} \
                 --with-apr-util=${STAGING_BINDIR_CROSS} \
                 ac_cv_path_RUBY=none"
-- 
1.7.10.4



