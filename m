Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 52B86776DB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 11:25:31 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 10 Mar 2017 03:25:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,140,1486454400"; d="scan'208";a="1106988139"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 10 Mar 2017 03:25:32 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Mar 2017 13:23:45 +0200
Message-Id: <7997fe8a63d46369f423c8a990f2e1b4678dfec1.1489144807.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 06/44] rpm: add a 4.x recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Mar 2017 11:25:31 -0000

The dnf stack is written and tested against rpm 4.x. So if we want to use dnf for packaging,
we should also use rpm 4 - there's simply too much work involved in making rpm 5 work with it due
to significant API differences, and supporting that going forward.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...d-a-color-setting-for-mips64_n32-binaries.patch |  40 ++++++++
 ...an-unsatisfiable-dependency-when-building.patch |  33 +++++++
 ...code-lib-rpm-as-the-installation-path-for.patch |  61 ++++++++++++
 .../0001-Do-not-read-config-files-from-HOME.patch  |  38 ++++++++
 ...t-the-PATH-environment-variable-before-ru.patch |  30 ++++++
 .../files/0001-Fix-build-with-musl-C-library.patch |  74 ++++++++++++++
 ...installing-execute-package-scriptlets-wit.patch |  37 +++++++
 ...alue-cannot-be-reset-issue-a-notice-inste.patch |  31 ++++++
 ...-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch |  72 ++++++++++++++
 meta/recipes-devtools/rpm/rpm_git.bb               | 108 +++++++++++++++++++++
 10 files changed, 524 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-HOME.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Fix-build-with-musl-C-library.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-When-nice-value-cannot-be-reset-issue-a-notice-inste.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm_git.bb

diff --git a/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch b/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch
new file mode 100644
index 00000000000..ac6dcaf101d
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch
@@ -0,0 +1,40 @@
+From e3eff024826550aec4a6a5baef7210a29faf299d Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 9 Mar 2017 18:54:02 +0200
+Subject: [PATCH] Add a color setting for mips64_n32 binaries
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ build/rpmfc.c | 1 +
+ rpmrc.in      | 2 ++
+ 2 files changed, 3 insertions(+)
+
+diff --git a/build/rpmfc.c b/build/rpmfc.c
+index d38a10916..c8e2f876a 100644
+--- a/build/rpmfc.c
++++ b/build/rpmfc.c
+@@ -622,6 +622,7 @@ exit:
+ static const struct rpmfcTokens_s rpmfcTokens[] = {
+   { "directory",		RPMFC_INCLUDE },
+ 
++  { "N32 MIPS64",		RPMFC_ELFMIPSN32|RPMFC_INCLUDE },
+   { "ELF 32-bit",		RPMFC_ELF32|RPMFC_INCLUDE },
+   { "ELF 64-bit",		RPMFC_ELF64|RPMFC_INCLUDE },
+ 
+diff --git a/rpmrc.in b/rpmrc.in
+index abc08fc31..f5bc820d8 100644
+--- a/rpmrc.in
++++ b/rpmrc.in
+@@ -133,6 +133,8 @@ archcolor: mipsr6el 1
+ archcolor: mips64r6 2
+ archcolor: mips64r6el 2
+ 
++archcolor: mips64_n32 4
++
+ archcolor: m68k 1
+ 
+ archcolor: m68kmint 1
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch
new file mode 100644
index 00000000000..80e2f0fad70
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch
@@ -0,0 +1,33 @@
+From 87cfc0db1ed6fe381a5ed5f0016d8c3344a31a11 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 9 Jan 2017 18:52:11 +0200
+Subject: [PATCH] Do not add an unsatisfiable dependency when building rpms in
+ a short-circuited way.
+
+Upstream permits short-circuiting only for local testing; Yocto on the other
+hand produces rpms that way by design.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ build/pack.c | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/build/pack.c b/build/pack.c
+index 1261cdbba..bb2d6f4f6 100644
+--- a/build/pack.c
++++ b/build/pack.c
+@@ -595,10 +595,6 @@ rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
+ 	    headerPutBin(pkg->header, RPMTAG_SOURCEPKGID, spec->sourcePkgId,16);
+ 	}
+ 
+-	if (cheating) {
+-	    (void) rpmlibNeedsFeature(pkg, "ShortCircuited", "4.9.0-1");
+-	}
+-	
+ 	{   char *binFormat = rpmGetPath("%{_rpmfilename}", NULL);
+ 	    char *binRpm, *binDir;
+ 	    binRpm = headerFormat(pkg->header, binFormat, &errorString);
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
new file mode 100644
index 00000000000..d99ddeb9ea9
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
@@ -0,0 +1,61 @@
+From d82691b8d58201dd03e30585daacd8ffd1556ae2 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 27 Feb 2017 09:43:30 +0200
+Subject: [PATCH] Do not hardcode "lib/rpm" as the installation path for
+ default configuration and macros.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+---
+ configure.ac | 2 +-
+ macros.in    | 2 +-
+ rpm.am       | 4 ++--
+ 3 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4f3be8770..92ffd3d68 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -875,7 +875,7 @@ else
+     usrprefix=$prefix
+ fi
+ 
+-RPMCONFIGDIR="`echo ${usrprefix}/lib/rpm`"
++RPMCONFIGDIR="`echo ${libdir}/rpm`"
+ AC_SUBST(RPMCONFIGDIR)
+ 
+ AC_SUBST(OBJDUMP)
+diff --git a/macros.in b/macros.in
+index c6d5a6b03..84ae25275 100644
+--- a/macros.in
++++ b/macros.in
+@@ -877,7 +877,7 @@ package or when debugging this package.\
+ %_sharedstatedir	%{_prefix}/com
+ %_localstatedir		%{_prefix}/var
+ %_lib			lib
+-%_libdir		%{_exec_prefix}/%{_lib}
++%_libdir		@libdir@
+ %_includedir		%{_prefix}/include
+ %_infodir		%{_datadir}/info
+ %_mandir		%{_datadir}/man
+diff --git a/rpm.am b/rpm.am
+index 1f43ad8a0..6854ff6ba 100644
+--- a/rpm.am
++++ b/rpm.am
+@@ -1,10 +1,10 @@
+ # Internal binaries
+ ## HACK: It probably should be $(libexecdir)/rpm or $(libdir)/rpm
+-rpmlibexecdir = $(prefix)/lib/rpm
++rpmlibexecdir = $(libdir)/rpm
+ 
+ # Host independent config files
+ ## HACK: it probably should be $(datadir)/rpm
+-rpmconfigdir = $(prefix)/lib/rpm
++rpmconfigdir = $(libdir)/rpm
+ 
+ # Libtool version (current-revision-age) for all our libraries
+ rpm_version_info = 7:0:0
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-HOME.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-HOME.patch
new file mode 100644
index 00000000000..96eb4189520
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-HOME.patch
@@ -0,0 +1,38 @@
+From 35381b6cd6c1b571bf7e6b0640de0f54dbf94386 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 10 Jan 2017 14:11:30 +0200
+Subject: [PATCH] Do not read config files from $HOME
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ lib/rpmrc.c | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/lib/rpmrc.c b/lib/rpmrc.c
+index 4ed991321..19fe80f98 100644
+--- a/lib/rpmrc.c
++++ b/lib/rpmrc.c
+@@ -458,8 +458,7 @@ static void setDefaults(void)
+     if (!defrcfiles) {
+ 	defrcfiles = rstrscat(NULL, confdir, "/rpmrc", ":",
+ 				confdir, "/" RPMCANONVENDOR "/rpmrc", ":",
+-				SYSCONFDIR "/rpmrc", ":",
+-			  	"~/.rpmrc", NULL);
++				SYSCONFDIR "/rpmrc", ":");
+     }
+ 
+ #ifndef MACROFILES
+@@ -471,8 +470,7 @@ static void setDefaults(void)
+   				confdir, "/" RPMCANONVENDOR "/macros", ":",
+ 				SYSCONFDIR "/rpm/macros.*", ":",
+ 				SYSCONFDIR "/rpm/macros", ":",
+-				SYSCONFDIR "/rpm/%{_target}/macros", ":",
+-				"~/.rpmmacros", NULL);
++				SYSCONFDIR "/rpm/%{_target}/macros", ":");
+     }
+ #else
+     macrofiles = MACROFILES;
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch
new file mode 100644
index 00000000000..a38675f89c9
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch
@@ -0,0 +1,30 @@
+From ffb5301a8594140ad7a58bc0f2053be8ca2b2946 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 20 Jan 2017 13:32:06 +0200
+Subject: [PATCH 1/2] Do not reset the PATH environment variable before running
+ scriptlets.
+
+We add lots of native stuff into it and scriptlets rely on that.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ lib/rpmscript.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/rpmscript.c b/lib/rpmscript.c
+index 92f949fa2..7c1aa75a8 100644
+--- a/lib/rpmscript.c
++++ b/lib/rpmscript.c
+@@ -201,7 +201,7 @@ static void doScriptExec(ARGV_const_t argv, ARGV_const_t prefixes,
+ 	if (ipath && ipath[5] != '%')
+ 	    path = ipath;
+ 
+-	xx = setenv("PATH", path, 1);
++	//xx = setenv("PATH", path, 1);
+ 	free(ipath);
+     }
+ 
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/rpm/files/0001-Fix-build-with-musl-C-library.patch b/meta/recipes-devtools/rpm/files/0001-Fix-build-with-musl-C-library.patch
new file mode 100644
index 00000000000..95c70136bd6
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-Fix-build-with-musl-C-library.patch
@@ -0,0 +1,74 @@
+From 211c2d11200e6657132c52e7ac68f8c118231262 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 27 Feb 2017 14:43:21 +0200
+Subject: [PATCH] Fix build with musl C library.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ configure.ac        | 3 ++-
+ misc/Makefile.am    | 3 +--
+ misc/rpmxprogname.c | 3 +--
+ 3 files changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 92ffd3d68..9c58467c1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -229,6 +229,7 @@ AC_SEARCH_LIBS(dlopen, [dl])
+ # Check for libelf library. Prefer external, otherwise none.
+ WITH_LIBELF_LIB=
+ AC_CHECK_HEADER([libelf.h])
++AC_CHECK_HEADERS([error.h], [WITH_ERROR_H=yes])
+ AC_CHECK_HEADERS([gelf.h], [
+ 	AC_CHECK_LIB(elf, gelf_getvernaux, [
+ 	    AC_DEFINE(HAVE_LIBELF, 1, [Define to 1 if you have the 'elf' library (-lelf).])
+@@ -237,7 +238,7 @@ AC_CHECK_HEADERS([gelf.h], [
+ 	])
+ ])
+ AC_SUBST(WITH_LIBELF_LIB)
+-AM_CONDITIONAL(LIBELF,[test "$WITH_LIBELF" = yes])
++AM_CONDITIONAL(LIBELF,[test "$WITH_LIBELF" = yes && test "$WITH_ERROR_H" = yes])
+ 
+ AC_CHECK_HEADERS([dwarf.h], [
+   WITH_LIBDWARF=yes
+diff --git a/misc/Makefile.am b/misc/Makefile.am
+index 8bf0093d9..b9db3d31a 100644
+--- a/misc/Makefile.am
++++ b/misc/Makefile.am
+@@ -5,10 +5,9 @@ AM_CPPFLAGS += -I$(top_srcdir)/misc
+ 
+ EXTRA_DIST = \
+ 	fnmatch.c	fnmatch.h \
+-	rpmxprogname.c	rpmxprogname.h \
+ 	stpcpy.c	stpncpy.c
+ 
+ noinst_LTLIBRARIES = libmisc.la
+ 
+-libmisc_la_SOURCES = fts.c fts.h
++libmisc_la_SOURCES = fts.c fts.h rpmxprogname.c rpmxprogname.h
+ libmisc_la_LIBADD = @LTLIBOBJS@
+diff --git a/misc/rpmxprogname.c b/misc/rpmxprogname.c
+index f89600613..e94625ea8 100644
+--- a/misc/rpmxprogname.c
++++ b/misc/rpmxprogname.c
+@@ -13,7 +13,7 @@ char *_rpmxgetprogname(void)
+ {
+   const char *empty = "";
+ 
+-  if (_rpmxprognam != NULL) /* never return NULL string */
++  if (_rpmxprogname != NULL) /* never return NULL string */
+     return _rpmxprogname;
+   else
+     return empty;
+@@ -30,4 +30,3 @@ void _rpmxsetprogname(const char *pn)
+   }
+ }
+ 
+-#endif /* _RPMXPROGNAME_H */
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
new file mode 100644
index 00000000000..2be3cb5af3c
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
@@ -0,0 +1,37 @@
+From a6f269f879221f2777169c5f7291322afe6b661b Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 17 Jan 2017 14:07:17 +0200
+Subject: [PATCH] When cross-installing, execute package scriptlets without
+ chrooting into destination rootfs
+
+This is triggered only when RPM_NO_CHROOT_FOR_SCRIPTS environment variable is defined.
+Otherwise they will trigger an explosion of failures, obviously.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ lib/rpmscript.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/lib/rpmscript.c b/lib/rpmscript.c
+index 98d3f420d..b95b5d606 100644
+--- a/lib/rpmscript.c
++++ b/lib/rpmscript.c
+@@ -467,7 +467,13 @@ rpmRC rpmScriptRun(rpmScript script, int arg1, int arg2, FD_t scriptFd,
+ 
+     if (rc != RPMRC_FAIL) {
+ 	if (script_type & RPMSCRIPTLET_EXEC) {
+-	    rc = runExtScript(plugins, prefixes, script->descr, lvl, scriptFd, &args, script->body, arg1, arg2, &script->nextFileFunc);
++	    if (getenv("RPM_NO_CHROOT_FOR_SCRIPTS") != NULL) {
++		rpmChrootOut();
++		rc = runExtScript(plugins, prefixes, script->descr, lvl, scriptFd, &args, script->body, arg1, arg2, &script->nextFileFunc);
++		rpmChrootIn();
++	    } else {
++		rc = runExtScript(plugins, prefixes, script->descr, lvl, scriptFd, &args, script->body, arg1, arg2, &script->nextFileFunc);
++	    }
+ 	} else {
+ 	    rc = runLuaScript(plugins, prefixes, script->descr, lvl, scriptFd, &args, script->body, arg1, arg2, &script->nextFileFunc);
+ 	}
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/rpm/files/0001-When-nice-value-cannot-be-reset-issue-a-notice-inste.patch b/meta/recipes-devtools/rpm/files/0001-When-nice-value-cannot-be-reset-issue-a-notice-inste.patch
new file mode 100644
index 00000000000..9648cac7c9b
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-When-nice-value-cannot-be-reset-issue-a-notice-inste.patch
@@ -0,0 +1,31 @@
+From d42ece6fa15b98d7f9221b90b85b78631df2c0a0 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 14 Feb 2017 13:51:19 +0200
+Subject: [PATCH] When nice value cannot be reset, issue a notice instead of a
+ warning
+
+Otherwise build logs on the autobuilder get very clutter, as it
+doesn't allow the nice value to be reset for some reason.
+
+Upstream-Status: Inappropriate [oe specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ lib/rpmscript.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/rpmscript.c b/lib/rpmscript.c
+index 5e1e99906..3975aead8 100644
+--- a/lib/rpmscript.c
++++ b/lib/rpmscript.c
+@@ -347,7 +347,7 @@ static rpmRC runExtScript(rpmPlugins plugins, ARGV_const_t prefixes,
+         int ret;
+         ret = setpriority(PRIO_PROCESS, 0, 0);
+         if (ret == -1) {
+-            rpmlog(RPMLOG_WARNING, _("Unable to reset nice value: %s"),
++            rpmlog(RPMLOG_NOTICE, _("Unable to reset nice value: %s\n"),
+                 strerror(errno));
+         }
+ 
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch b/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch
new file mode 100644
index 00000000000..b3dbc319b6a
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch
@@ -0,0 +1,72 @@
+From 383c0b097b7eba16801a9e3c4b8e36a4b6de74ab Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 20 Jan 2017 13:33:05 +0200
+Subject: [PATCH 2/2] Add support for prefixing /etc from RPM_ETCCONFIGDIR
+ environment variable
+
+This is needed so that rpm can pick up target-specific configuration
+from target rootfs instead of its own native sysroot.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ lib/rpmrc.c | 19 ++++++++++++++-----
+ 1 file changed, 14 insertions(+), 5 deletions(-)
+
+diff --git a/lib/rpmrc.c b/lib/rpmrc.c
+index 19fe80f98..6b27b3941 100644
+--- a/lib/rpmrc.c
++++ b/lib/rpmrc.c
+@@ -455,10 +455,14 @@ const char * lookupInDefaultTable(const char * name,
+ static void setDefaults(void)
+ {
+     const char *confdir = rpmConfigDir();
++    const char *etcconfdir = getenv("RPM_ETCCONFIGDIR");
++    if (etcconfdir == NULL)
++        etcconfdir = "";
++
+     if (!defrcfiles) {
+ 	defrcfiles = rstrscat(NULL, confdir, "/rpmrc", ":",
+ 				confdir, "/" RPMCANONVENDOR "/rpmrc", ":",
+-				SYSCONFDIR "/rpmrc", ":");
++				etcconfdir, SYSCONFDIR "/rpmrc", ":", NULL);
+     }
+ 
+ #ifndef MACROFILES
+@@ -468,9 +472,9 @@ static void setDefaults(void)
+ 				confdir, "/platform/%{_target}/macros", ":",
+ 				confdir, "/fileattrs/*.attr", ":",
+   				confdir, "/" RPMCANONVENDOR "/macros", ":",
+-				SYSCONFDIR "/rpm/macros.*", ":",
+-				SYSCONFDIR "/rpm/macros", ":",
+-				SYSCONFDIR "/rpm/%{_target}/macros", ":");
++				etcconfdir, SYSCONFDIR "/rpm/macros.*", ":",
++				etcconfdir, SYSCONFDIR "/rpm/macros", ":",
++				etcconfdir, SYSCONFDIR "/rpm/%{_target}/macros", ":", NULL);
+     }
+ #else
+     macrofiles = MACROFILES;
+@@ -989,7 +993,11 @@ static void read_auxv(void)
+  */
+ static void defaultMachine(rpmrcCtx ctx, const char ** arch, const char ** os)
+ {
+-    const char * const platform_path = SYSCONFDIR "/rpm/platform";
++    const char *etcconfdir = getenv("RPM_ETCCONFIGDIR");
++    if (etcconfdir == NULL)
++        etcconfdir = "";
++
++    const char * const platform_path = rstrscat(NULL, etcconfdir, SYSCONFDIR "/rpm/platform", NULL);
+     static struct utsname un;
+     char * chptr;
+     canonEntry canon;
+@@ -1286,6 +1294,7 @@ static void defaultMachine(rpmrcCtx ctx, const char ** arch, const char ** os)
+ 
+     if (arch) *arch = un.machine;
+     if (os) *os = un.sysname;
++    free(platform_path);
+ }
+ 
+ static
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/rpm/rpm_git.bb b/meta/recipes-devtools/rpm/rpm_git.bb
new file mode 100644
index 00000000000..22a4e71a806
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm_git.bb
@@ -0,0 +1,108 @@
+SUMMARY = "The RPM package management system"
+DESCRIPTION = "The RPM Package Manager (RPM) is a powerful command line driven \
+package management system capable of installing, uninstalling, \
+verifying, querying, and updating software packages. Each software \
+package consists of an archive of files along with information about \
+the package like its version, a description, etc."
+
+SUMMARY_${PN}-dev = "Development files for manipulating RPM packages"
+DESCRIPTION_${PN}-dev = "This package contains the RPM C library and header files. These \
+development files will simplify the process of writing programs that \
+manipulate RPM packages and databases. These files are intended to \
+simplify the process of creating graphical package managers or any \
+other tools that need an intimate knowledge of RPM packages in order \
+to function."
+
+SUMMARY_python-rpm = "Python bindings for apps which will manupulate RPM packages"
+DESCRIPTION_python-rpm = "The rpm-python package contains a module that permits applications \
+written in the Python programming language to use the interface \
+supplied by the RPM Package Manager libraries."
+
+HOMEPAGE = "http://www.rpm.org"
+
+# libraries are also LGPL - how to express this?
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f5259151d26ff18e78023450a5ac8d96"
+
+SRC_URI = "git://github.com/rpm-software-management/rpm \
+           file://0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch \
+           file://0001-Do-not-read-config-files-from-HOME.patch \
+           file://0001-When-cross-installing-execute-package-scriptlets-wit.patch \
+           file://0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch \
+           file://0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch \
+           file://0001-When-nice-value-cannot-be-reset-issue-a-notice-inste.patch \
+           file://0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch \
+           file://0001-Fix-build-with-musl-C-library.patch \
+           file://0001-Add-a-color-setting-for-mips64_n32-binaries.patch \
+           "
+
+PV = "4.13.90+git${SRCPV}"
+PE = "1"
+SRCREV = "a8e51b3bb05c6acb1d9b2e3d34f859ddda1677be"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "nss libarchive db file popt xz dbus elfutils python"
+DEPENDS_append_class-native = " file-replacement-native"
+
+inherit autotools gettext pkgconfig pythonnative
+
+# OE-core patches autoreconf to additionally run gnu-configize, which fails with this recipe
+EXTRA_AUTORECONF_append = " --exclude=gnu-configize"
+
+EXTRA_OECONF_append = " --without-lua --enable-python"
+EXTRA_OECONF_append_libc-musl = " --disable-nls"
+
+# --sysconfdir prevents rpm from attempting to access machine-specific configuration in sysroot/etc; we need to have it in rootfs
+#
+# --localstatedir prevents rpm from writing its database to native sysroot when building images
+#
+# Also disable plugins, so that rpm doesn't attempt to inhibit shutdown via session dbus
+EXTRA_OECONF_append_class-native = " --sysconfdir=/etc --localstatedir=/var --disable-plugins"
+
+BBCLASSEXTEND = "native"
+
+# Direct rpm-native to read configuration from our sysroot, not the one it was compiled in
+# libmagic also has sysroot path contamination, so override it
+do_install_append_class-native() {
+        create_wrapper ${D}/${bindir}/rpmbuild \
+                RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
+                RPM_ETCCONFIGDIR=${STAGING_DIR_NATIVE} \
+                MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc \
+                RPM_NO_CHROOT_FOR_SCRIPTS=1
+
+        create_wrapper ${D}/${bindir}/rpmsign \
+                RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
+                RPM_ETCCONFIGDIR=${STAGING_DIR_NATIVE} \
+                MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc \
+                RPM_NO_CHROOT_FOR_SCRIPTS=1
+
+        create_wrapper ${D}/${bindir}/rpmkeys \
+                RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
+                RPM_ETCCONFIGDIR=${STAGING_DIR_NATIVE} \
+                MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc \
+                RPM_NO_CHROOT_FOR_SCRIPTS=1
+
+        create_wrapper ${D}/${bindir}/rpm \
+                RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
+                RPM_ETCCONFIGDIR=${STAGING_DIR_NATIVE} \
+                MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc \
+                RPM_NO_CHROOT_FOR_SCRIPTS=1
+}
+
+
+# Rpm's make install creates var/tmp which clashes with base-files packaging
+do_install_append_class-target() {
+    rm -rf ${D}/var
+}
+
+FILES_${PN} += "${libdir}/rpm-plugins/*.so \
+               "
+
+FILES_${PN}-dev += "${libdir}/rpm-plugins/*.la \
+                    "
+
+PACKAGES += "python-rpm"
+PROVIDES += "python-rpm"
+FILES_python-rpm = "${PYTHON_SITEPACKAGES_DIR}/rpm/*"
+
-- 
2.11.0


