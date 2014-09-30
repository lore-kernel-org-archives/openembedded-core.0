Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BB0C17170E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 17:17:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 30 Sep 2014 10:17:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,628,1406617200"; d="scan'208";a="607677684"
Received: from gmacartn-mobl.ger.corp.intel.com (HELO
	swold-linux.amr.corp.intel.com) ([10.255.13.44])
	by fmsmga002.fm.intel.com with ESMTP; 30 Sep 2014 10:16:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Sep 2014 10:16:54 -0700
Message-Id: <8674e28cf623b902845220a7bdef8e4ace9de54b.1412095567.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1412095567.git.sgw@linux.intel.com>
References: <cover.1412095567.git.sgw@linux.intel.com>
In-Reply-To: <cover.1412095567.git.sgw@linux.intel.com>
References: <cover.1412095567.git.sgw@linux.intel.com>
Subject: [PATCH 4/5] rpm: add version 4.11.2
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
X-List-Received-Date: Tue, 30 Sep 2014 17:17:09 -0000

add patch to remove db3 from configure.ac
add inherit pkgconfig

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../add_RPMSENSE_MISSINGOK_to_rpmmodule.patch      |  20 ++
 .../rpm/rpm-4.11.2/disable_shortcircuited.patch    |  23 ++
 .../rpm/rpm-4.11.2/fix_libdir.patch                |  19 +
 meta/recipes-devtools/rpm/rpm-4.11.2/pythondeps.sh |  16 +
 .../rpm/rpm-4.11.2/remove-db3-from-configure.patch |  26 ++
 .../rpm/rpm-4.11.2/remove-dir-check.patch          |  23 ++
 .../rpm/rpm-4.11.2/rpm-scriptetexechelp.patch      | 194 +++++++++++
 .../rpm/rpm-4.11.2/support-suggests-tag.patch      | 384 +++++++++++++++++++++
 .../rpm/rpm-4.11.2/use-pkgconfig-for-python.patch  |  38 ++
 meta/recipes-devtools/rpm/rpm_4.11.2.bb            | 133 +++++++
 10 files changed, 876 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm-4.11.2/add_RPMSENSE_MISSINGOK_to_rpmmodule.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm-4.11.2/disable_shortcircuited.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm-4.11.2/fix_libdir.patch
 create mode 100755 meta/recipes-devtools/rpm/rpm-4.11.2/pythondeps.sh
 create mode 100644 meta/recipes-devtools/rpm/rpm-4.11.2/remove-db3-from-configure.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm-4.11.2/remove-dir-check.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm-4.11.2/rpm-scriptetexechelp.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm-4.11.2/support-suggests-tag.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm-4.11.2/use-pkgconfig-for-python.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm_4.11.2.bb

diff --git a/meta/recipes-devtools/rpm/rpm-4.11.2/add_RPMSENSE_MISSINGOK_to_rpmmodule.patch b/meta/recipes-devtools/rpm/rpm-4.11.2/add_RPMSENSE_MISSINGOK_to_rpmmodule.patch
new file mode 100644
index 0000000..b877870
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm-4.11.2/add_RPMSENSE_MISSINGOK_to_rpmmodule.patch
@@ -0,0 +1,20 @@
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+Signed-off-by: Ronan Le Martret <ronan.lemartret@open.eurogiciel.org> 
+
+diff --git a/python/rpmmodule.c b/python/rpmmodule.c
+index a4fe217..728c66c 100644
+--- a/python/rpmmodule.c
++++ b/python/rpmmodule.c
+@@ -396,6 +396,10 @@ static int initModule(PyObject *m)
+     REGISTER_ENUM(RPMSENSE_STRONG);
+     REGISTER_ENUM(RPMSENSE_CONFIG);
+ 
++#if defined(RPM_VENDOR_OE)
++    REGISTER_ENUM(RPMSENSE_MISSINGOK);
++#endif
++
+     REGISTER_ENUM(RPMTRANS_FLAG_TEST);
+     REGISTER_ENUM(RPMTRANS_FLAG_BUILD_PROBS);
+     REGISTER_ENUM(RPMTRANS_FLAG_NOSCRIPTS);
diff --git a/meta/recipes-devtools/rpm/rpm-4.11.2/disable_shortcircuited.patch b/meta/recipes-devtools/rpm/rpm-4.11.2/disable_shortcircuited.patch
new file mode 100644
index 0000000..7a646de
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm-4.11.2/disable_shortcircuited.patch
@@ -0,0 +1,23 @@
+Upstream-Status: Pending
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+Signed-off-by: Ronan Le Martret <ronan.lemartret@open.eurogiciel.org>
+
+
+Index: rpm-4.11.2/build/pack.c
+===================================================================
+--- rpm-4.11.2.orig/build/pack.c
++++ rpm-4.11.2/build/pack.c
+@@ -571,9 +571,9 @@ rpmRC packageBinaries(rpmSpec spec, cons
+ 	    headerPutBin(pkg->header, RPMTAG_SOURCEPKGID, spec->sourcePkgId,16);
+ 	}
+ 
+-	if (cheating) {
+-	    (void) rpmlibNeedsFeature(pkg, "ShortCircuited", "4.9.0-1");
+-	}
++//	if (cheating) {
++//	    (void) rpmlibNeedsFeature(pkg, "ShortCircuited", "4.9.0-1");
++//	}
+ 	
+ 	{   char *binFormat = rpmGetPath("%{_rpmfilename}", NULL);
+ 	    char *binRpm, *binDir;
diff --git a/meta/recipes-devtools/rpm/rpm-4.11.2/fix_libdir.patch b/meta/recipes-devtools/rpm/rpm-4.11.2/fix_libdir.patch
new file mode 100644
index 0000000..be0626c
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm-4.11.2/fix_libdir.patch
@@ -0,0 +1,19 @@
+Upstream-Status: Inappropriate [OE-Core specific]
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+Signed-off-by: Ronan Le Martret <ronan.lemartret@open.eurogiciel.org>
+
+
+diff --git a/installplatform b/installplatform
+index 8c3eba0..fa15e91 100755
+--- a/installplatform
++++ b/installplatform
+@@ -112,7 +112,7 @@ for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2`; do
+   [ -z "$CANONARCH" ] && continue
+ 
+   if [ "$OS" = "linux" ] && [ "$CANONCOLOR" = 3 ]; then
+-      LIB=${LIB}64
++      LIB=${LIB}
+   fi
+ 
+   PPD="${DESTDIR}/${platformdir}/${ARCH}-${OS}"
diff --git a/meta/recipes-devtools/rpm/rpm-4.11.2/pythondeps.sh b/meta/recipes-devtools/rpm/rpm-4.11.2/pythondeps.sh
new file mode 100755
index 0000000..083b174
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm-4.11.2/pythondeps.sh
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+[ $# -ge 1 ] || {
+    cat > /dev/null
+    exit 0
+}
+
+case $1 in
+-R|--requires)
+    shift
+    grep "/usr/\(lib[^/]*\|share\)/python[^/]*/" >/dev/null && echo "python"
+    exit 0
+    ;;
+esac
+
+exit 0
diff --git a/meta/recipes-devtools/rpm/rpm-4.11.2/remove-db3-from-configure.patch b/meta/recipes-devtools/rpm/rpm-4.11.2/remove-db3-from-configure.patch
new file mode 100644
index 0000000..2640e54
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm-4.11.2/remove-db3-from-configure.patch
@@ -0,0 +1,26 @@
+
+Disable configuring the db3 directory since we will be using the
+external DB provided as part of OE-Core already, no need to have
+duplicate database code.
+
+Upstream-Status: Inappropriate [OE-Core Specific]
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: rpm-4.11.2/configure.ac
+===================================================================
+--- rpm-4.11.2.orig/configure.ac
++++ rpm-4.11.2/configure.ac
+@@ -825,9 +825,9 @@ AC_SUBST(RPMCONFIGDIR)
+ 
+ AC_SUBST(OBJDUMP)
+ 
+-if test "$with_external_db" = no; then
+-    AC_CONFIG_SUBDIRS(db3)
+-fi
++#if test "$with_external_db" = no; then
++#    AC_CONFIG_SUBDIRS(db3)
++#fi
+ 
+ AM_CONDITIONAL([WITH_INTERNAL_DB],[test "$with_external_db" = no])
+ AM_CONDITIONAL([DOXYGEN],[test "$DOXYGEN" != no])
diff --git a/meta/recipes-devtools/rpm/rpm-4.11.2/remove-dir-check.patch b/meta/recipes-devtools/rpm/rpm-4.11.2/remove-dir-check.patch
new file mode 100644
index 0000000..f1ecab7
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm-4.11.2/remove-dir-check.patch
@@ -0,0 +1,23 @@
+Upstream-Status: Pending
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+Signed-off-by: Ronan Le Martret <ronan.lemartret@open.eurogiciel.org>
+
+
+Index: rpm-4.11.2/build/files.c
+===================================================================
+--- rpm-4.11.2.orig/build/files.c
++++ rpm-4.11.2/build/files.c
+@@ -1321,12 +1321,6 @@ static rpmRC addFile(FileList fl, const
+ 	}
+     }
+ 
+-    /* Error out when a non-directory is specified as one in spec */
+-    if (fl->cur.isDir && (statp == &statbuf) && !S_ISDIR(statp->st_mode)) {
+-	rpmlog(RPMLOG_ERR, _("Not a directory: %s\n"), diskPath);
+-	goto exit;
+-    }
+-
+     /* Don't recurse into explicit %dir, don't double-recurse from fts */
+     if ((fl->cur.isDir != 1) && (statp == &statbuf) && S_ISDIR(statp->st_mode)) {
+ 	return recurseDir(fl, diskPath);
diff --git a/meta/recipes-devtools/rpm/rpm-4.11.2/rpm-scriptetexechelp.patch b/meta/recipes-devtools/rpm/rpm-4.11.2/rpm-scriptetexechelp.patch
new file mode 100644
index 0000000..9333dea
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm-4.11.2/rpm-scriptetexechelp.patch
@@ -0,0 +1,194 @@
+Upstream-Status: Inappropriate [OE-Core]
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+Signed-off-by: Ronan Le Martret <ronan.lemartret@open.eurogiciel.org>
+
+
+Index: rpm-4.11.2/lib/psm.c
+===================================================================
+--- rpm-4.11.2.orig/lib/psm.c
++++ rpm-4.11.2/lib/psm.c
+@@ -421,7 +421,8 @@ static rpmRC runScript(rpmpsm psm, ARGV_
+ 
+     rpmswEnter(rpmtsOp(psm->ts, RPMTS_OP_SCRIPTLETS), 0);
+     rc = rpmScriptRun(script, arg1, arg2, sfd,
+-		      prefixes, warn_only, selinux);
++		      prefixes, warn_only, selinux, rpmtsRootDir(psm->ts) );
++
+     rpmswExit(rpmtsOp(psm->ts, RPMTS_OP_SCRIPTLETS), 0);
+ 
+     /* Map warn-only errors to "notfound" for script stop callback */
+@@ -958,15 +959,49 @@ static rpmRC rpmpsmStage(rpmpsm psm, pkg
+     case PSM_DESTROY:
+ 	break;
+     case PSM_SCRIPT:	/* Run current package scriptlets. */
++#ifdef RPM_VENDOR_OE
++        {
++        const char * scriptletWrapper = rpmExpand("%{?_cross_scriptlet_wrapper}", NULL);
++	if (scriptletWrapper && *scriptletWrapper)
++	     (void) rpmChrootOut();
++#endif
++
+ 	rc = runInstScript(psm);
++#ifdef RPM_VENDOR_OE
++	if (scriptletWrapper && *scriptletWrapper)
++	     (void) rpmChrootIn();
++        }
++#endif
+ 	break;
+     case PSM_TRIGGERS:
+ 	/* Run triggers in other package(s) this package sets off. */
++#ifdef RPM_VENDOR_OE
++        {
++        const char * scriptletWrapper = rpmExpand("%{?_cross_scriptlet_wrapper}", NULL);
++	if (scriptletWrapper && *scriptletWrapper)
++	     (void) rpmChrootOut();
++#endif
+ 	rc = runTriggers(psm);
++#ifdef RPM_VENDOR_OE
++	if (scriptletWrapper && *scriptletWrapper)
++	     (void) rpmChrootIn();
++        }
++#endif
+ 	break;
+     case PSM_IMMED_TRIGGERS:
+ 	/* Run triggers in this package other package(s) set off. */
++#ifdef RPM_VENDOR_OE
++	{
++            const char * scriptletWrapper = rpmExpand("%{?_cross_scriptlet_wrapper}", NULL);
++	    if (scriptletWrapper && *scriptletWrapper)
++	     (void) rpmChrootOut();
++#endif
+ 	rc = runImmedTriggers(psm);
++#ifdef RPM_VENDOR_OE
++	    if (scriptletWrapper && *scriptletWrapper)
++	     (void) rpmChrootIn();
++	}
++#endif
+ 	break;
+ 
+     case PSM_RPMDB_ADD: {
+Index: rpm-4.11.2/lib/rpmscript.c
+===================================================================
+--- rpm-4.11.2.orig/lib/rpmscript.c
++++ rpm-4.11.2/lib/rpmscript.c
+@@ -92,7 +92,7 @@ static rpmRC runLuaScript(int selinux, A
+ static const char * const SCRIPT_PATH = "PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/X11R6/bin";
+ 
+ static void doScriptExec(int selinux, ARGV_const_t argv, ARGV_const_t prefixes,
+-			FD_t scriptFd, FD_t out)
++			FD_t scriptFd, FD_t out, char * rootDir )
+ {
+     int pipes[2];
+     int flag;
+@@ -158,13 +158,12 @@ static void doScriptExec(int selinux, AR
+ 	    setenv("RPM_INSTALL_PREFIX", *pf, 1);
+ 	}
+     }
+-	
+-    if (chdir("/") == 0) {
++    if (chdir(rootDir) == 0) {
+ 	/* XXX Don't mtrace into children. */
+ 	unsetenv("MALLOC_CHECK_");
+ 
+ 	/* Permit libselinux to do the scriptlet exec. */
+-	if (selinux == 1) {	
++	if (selinux == 1) {
+ 	    xx = rpm_execcon(0, argv[0], argv, environ);
+ 	}
+ 
+@@ -175,12 +174,12 @@ static void doScriptExec(int selinux, AR
+     _exit(127); /* exit 127 for compatibility with bash(1) */
+ }
+ 
+-static char * writeScript(const char *cmd, const char *script)
++static char * writeScript(const char *cmd, const char *script, char * rootDir)
+ {
+     char *fn = NULL;
+     size_t slen = strlen(script);
+     int ok = 0;
+-    FD_t fd = rpmMkTempFile("/", &fn);
++    FD_t fd = rpmMkTempFile(rootDir, &fn);
+ 
+     if (Ferror(fd))
+ 	goto exit;
+@@ -204,7 +203,7 @@ exit:
+  */
+ static rpmRC runExtScript(int selinux, ARGV_const_t prefixes,
+ 		   const char *sname, rpmlogLvl lvl, FD_t scriptFd,
+-		   ARGV_t * argvp, const char *script, int arg1, int arg2)
++		   ARGV_t * argvp, const char *script, int arg1, int arg2,char * rootDir)
+ {
+     FD_t out = NULL;
+     char * fn = NULL;
+@@ -215,7 +214,7 @@ static rpmRC runExtScript(int selinux, A
+     rpmlog(RPMLOG_DEBUG, "%s: scriptlet start\n", sname);
+ 
+     if (script) {
+-	fn = writeScript(*argvp[0], script);
++	fn = writeScript(*argvp[0], script, rootDir);
+ 	if (fn == NULL) {
+ 	    rpmlog(RPMLOG_ERR,
+ 		   _("Couldn't create temporary file for %s: %s\n"),
+@@ -258,7 +257,7 @@ static rpmRC runExtScript(int selinux, A
+     } else if (pid == 0) {/* Child */
+ 	rpmlog(RPMLOG_DEBUG, "%s: execv(%s) pid %d\n",
+ 	       sname, *argvp[0], (unsigned)getpid());
+-	doScriptExec(selinux, *argvp, prefixes, scriptFd, out);
++	doScriptExec(selinux, *argvp, prefixes, scriptFd, out, rootDir);
+     }
+ 
+     do {
+@@ -297,13 +296,27 @@ exit:
+ }
+ 
+ rpmRC rpmScriptRun(rpmScript script, int arg1, int arg2, FD_t scriptFd,
+-		   ARGV_const_t prefixes, int warn_only, int selinux)
++		   ARGV_const_t prefixes, int warn_only, int selinux, char * rootDir)
+ {
+     ARGV_t args = NULL;
+     rpmlogLvl lvl = warn_only ? RPMLOG_WARNING : RPMLOG_ERR;
+     rpmRC rc;
+-
+-    if (script == NULL) return RPMRC_OK;
++#ifdef RPM_VENDOR_OE
++    const char * scriptletWrapper = rpmExpand("%{?_cross_scriptlet_wrapper}", NULL);
++#endif
++ 
++     if (script == NULL) return RPMRC_OK;
++#ifdef RPM_VENDOR_OE
++    if (scriptletWrapper && *scriptletWrapper) {
++       argvAdd(&args, scriptletWrapper);
++
++       if ( rootDir ) {
++         argvAdd(&args, rootDir);
++       } else {
++         argvAdd(&args, "/");
++       }
++    }
++#endif
+ 
+     /* construct a new argv as we can't modify the one from header */
+     if (script->args) {
+@@ -315,7 +328,7 @@ rpmRC rpmScriptRun(rpmScript script, int
+     if (rstreq(args[0], "<lua>")) {
+ 	rc = runLuaScript(selinux, prefixes, script->descr, lvl, scriptFd, &args, script->body, arg1, arg2);
+     } else {
+-	rc = runExtScript(selinux, prefixes, script->descr, lvl, scriptFd, &args, script->body, arg1, arg2);
++	rc = runExtScript(selinux, prefixes, script->descr, lvl, scriptFd, &args, script->body, arg1, arg2, rootDir);
+     }
+     argvFree(args);
+ 
+Index: rpm-4.11.2/lib/rpmscript.h
+===================================================================
+--- rpm-4.11.2.orig/lib/rpmscript.h
++++ rpm-4.11.2/lib/rpmscript.h
+@@ -29,7 +29,7 @@ rpmScript rpmScriptFree(rpmScript script
+ 
+ RPM_GNUC_INTERNAL
+ rpmRC rpmScriptRun(rpmScript script, int arg1, int arg2, FD_t scriptFd,
+-                   ARGV_const_t prefixes, int warn_only, int selinux);
++                   ARGV_const_t prefixes, int warn_only, int selinux, char * rootDir);
+ 
+ RPM_GNUC_INTERNAL
+ rpmTagVal rpmScriptTag(rpmScript script);
diff --git a/meta/recipes-devtools/rpm/rpm-4.11.2/support-suggests-tag.patch b/meta/recipes-devtools/rpm/rpm-4.11.2/support-suggests-tag.patch
new file mode 100644
index 0000000..3da6085
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm-4.11.2/support-suggests-tag.patch
@@ -0,0 +1,384 @@
+
+Upstream-Status: Pending
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+Signed-off-by: Ronan Le Martret <ronan.lemartret@open.eurogiciel.org>
+
+diff --git a/build/pack.c b/build/pack.c
+index b6b2bea..5c3d8df 100644
+--- a/build/pack.c
++++ b/build/pack.c
+@@ -273,8 +273,10 @@ static rpmTagVal depevrtags[] = {
+     RPMTAG_CONFLICTVERSION,
+     RPMTAG_ORDERVERSION,
+     RPMTAG_TRIGGERVERSION,
+-    RPMTAG_SUGGESTSVERSION,
+-    RPMTAG_ENHANCESVERSION,
++    RPMTAG_SUGGESTVERSION,
++    RPMTAG_ENHANCEVERSION,
++    RPMTAG_RECOMMENDVERSION,
++    RPMTAG_SUPPLEMENTVERSION,
+     0
+ };
+ 
+diff --git a/build/parsePreamble.c b/build/parsePreamble.c
+index 5772bef..cbbbee3 100644
+--- a/build/parsePreamble.c
++++ b/build/parsePreamble.c
+@@ -821,6 +821,10 @@ static rpmRC handlePreambleTag(rpmSpec spec, Package pkg, rpmTagVal tag,
+ 	}
+ 	/* fallthrough */
+     case RPMTAG_PREREQ:
++    case RPMTAG_RECOMMENDFLAGS:
++    case RPMTAG_SUGGESTFLAGS:
++    case RPMTAG_SUPPLEMENTFLAGS:
++    case RPMTAG_ENHANCEFLAGS:
+     case RPMTAG_CONFLICTFLAGS:
+     case RPMTAG_OBSOLETEFLAGS:
+     case RPMTAG_PROVIDEFLAGS:
+@@ -922,6 +926,10 @@ static struct PreambleRec_s const preambleList[] = {
+     {RPMTAG_ICON,		0, 0, LEN_AND_STR("icon")},
+     {RPMTAG_PROVIDEFLAGS,	0, 0, LEN_AND_STR("provides")},
+     {RPMTAG_REQUIREFLAGS,	2, 0, LEN_AND_STR("requires")},
++    {RPMTAG_RECOMMENDFLAGS,	0, 0, LEN_AND_STR("recommends")},
++    {RPMTAG_SUGGESTFLAGS,	0, 0, LEN_AND_STR("suggests")},
++    {RPMTAG_SUPPLEMENTFLAGS,	0, 0, LEN_AND_STR("supplements")},
++    {RPMTAG_ENHANCEFLAGS,	0, 0, LEN_AND_STR("enhances")},
+     {RPMTAG_PREREQ,		2, 1, LEN_AND_STR("prereq")},
+     {RPMTAG_CONFLICTFLAGS,	0, 0, LEN_AND_STR("conflicts")},
+     {RPMTAG_OBSOLETEFLAGS,	0, 0, LEN_AND_STR("obsoletes")},
+diff --git a/build/parseReqs.c b/build/parseReqs.c
+index ba080a1..1427111 100644
+--- a/build/parseReqs.c
++++ b/build/parseReqs.c
+@@ -61,6 +61,18 @@ rpmRC parseRCPOT(rpmSpec spec, Package pkg, const char *field, rpmTagVal tagN,
+ 	nametag = RPMTAG_REQUIRENAME;
+ 	tagflags |= RPMSENSE_ANY;
+ 	break;
++    case RPMTAG_RECOMMENDFLAGS:
++	nametag = RPMTAG_RECOMMENDNAME;
++	break;
++    case RPMTAG_SUGGESTFLAGS:
++	nametag = RPMTAG_SUGGESTNAME;
++	break;
++    case RPMTAG_SUPPLEMENTFLAGS:
++	nametag = RPMTAG_SUPPLEMENTNAME;
++	break;
++    case RPMTAG_ENHANCEFLAGS:
++	nametag = RPMTAG_ENHANCENAME;
++	break;
+     case RPMTAG_PROVIDEFLAGS:
+ 	nametag = RPMTAG_PROVIDENAME;
+ 	break;
+diff --git a/build/reqprov.c b/build/reqprov.c
+index a368f42..c270af6 100644
+--- a/build/reqprov.c
++++ b/build/reqprov.c
+@@ -81,6 +81,30 @@ int addReqProv(Package pkg, rpmTagVal tagN,
+ 	extra = Flags & RPMSENSE_TRIGGER;
+ 	dsp = &pkg->triggers;
+ 	break;
++    case RPMTAG_RECOMMENDNAME:
++	versiontag = RPMTAG_RECOMMENDVERSION;
++	flagtag = RPMTAG_RECOMMENDFLAGS;
++	extra = Flags & _ALL_REQUIRES_MASK;
++	dsp = &pkg->recommends;
++	break;
++    case RPMTAG_SUGGESTNAME:
++	versiontag = RPMTAG_SUGGESTVERSION;
++	flagtag = RPMTAG_SUGGESTFLAGS;
++	extra = Flags & _ALL_REQUIRES_MASK;
++	dsp = &pkg->suggests;
++	break;
++    case RPMTAG_SUPPLEMENTNAME:
++	versiontag = RPMTAG_SUPPLEMENTVERSION;
++	flagtag = RPMTAG_SUPPLEMENTFLAGS;
++	extra = Flags & _ALL_REQUIRES_MASK;
++	dsp = &pkg->supplements;
++	break;
++    case RPMTAG_ENHANCENAME:
++	versiontag = RPMTAG_ENHANCEVERSION;
++	flagtag = RPMTAG_ENHANCEFLAGS;
++	extra = Flags & _ALL_REQUIRES_MASK;
++	dsp = &pkg->enhances;
++	break;
+     case RPMTAG_REQUIRENAME:
+     default:
+ 	tagN = RPMTAG_REQUIRENAME;
+diff --git a/build/rpmbuild_internal.h b/build/rpmbuild_internal.h
+index a9e4c7c..0a1977f 100644
+--- a/build/rpmbuild_internal.h
++++ b/build/rpmbuild_internal.h
+@@ -93,6 +93,10 @@ struct Package_s {
+     rpmds ds;			/*!< Requires: N = EVR */
+     rpmds requires;
+     rpmds provides;
++    rpmds recommends;
++    rpmds suggests;
++    rpmds supplements;
++    rpmds enhances;
+     rpmds conflicts;
+     rpmds obsoletes;
+     rpmds triggers;
+diff --git a/build/spec.c b/build/spec.c
+index 703ec78..7ae2120 100644
+--- a/build/spec.c
++++ b/build/spec.c
+@@ -139,6 +139,11 @@ static Package freePackage(Package pkg)
+     pkg->ds = rpmdsFree(pkg->ds);
+     pkg->requires = rpmdsFree(pkg->requires);
+     pkg->provides = rpmdsFree(pkg->provides);
++    pkg->recommends = rpmdsFree(pkg->recommends);
++    pkg->suggests = rpmdsFree(pkg->suggests);
++    pkg->supplements = rpmdsFree(pkg->supplements);
++    pkg->enhances = rpmdsFree(pkg->enhances);
++
+     pkg->conflicts = rpmdsFree(pkg->conflicts);
+     pkg->obsoletes = rpmdsFree(pkg->obsoletes);
+     pkg->triggers = rpmdsFree(pkg->triggers);
+diff --git a/lib/rpmds.c b/lib/rpmds.c
+index 7a51167..1e5dda0 100644
+--- a/lib/rpmds.c
++++ b/lib/rpmds.c
+@@ -52,6 +52,22 @@ static int dsType(rpmTagVal tag,
+ 	t = "Requires";
+ 	evr = RPMTAG_REQUIREVERSION;
+ 	f = RPMTAG_REQUIREFLAGS;
++    } else if (tag == RPMTAG_SUPPLEMENTNAME) {
++	t = "Supplements";
++	evr = RPMTAG_SUPPLEMENTVERSION;
++	f = RPMTAG_SUPPLEMENTFLAGS;
++    } else if (tag == RPMTAG_ENHANCENAME) {
++	t = "Enhances";
++	evr = RPMTAG_ENHANCEVERSION;
++	f = RPMTAG_ENHANCEFLAGS;
++    } else if (tag == RPMTAG_RECOMMENDNAME) {
++	t = "Recommends";
++	evr = RPMTAG_RECOMMENDVERSION;
++	f = RPMTAG_RECOMMENDFLAGS;
++    } else if (tag == RPMTAG_SUGGESTNAME) {
++	t = "Suggests";
++	evr = RPMTAG_SUGGESTVERSION;
++	f = RPMTAG_SUGGESTFLAGS;
+     } else if (tag == RPMTAG_CONFLICTNAME) {
+ 	t = "Conflicts";
+ 	evr = RPMTAG_CONFLICTVERSION;
+diff --git a/lib/rpmtag.h b/lib/rpmtag.h
+index 64b03f1..b943229 100644
+--- a/lib/rpmtag.h
++++ b/lib/rpmtag.h
+@@ -217,14 +217,14 @@ typedef enum rpmTag_e {
+     RPMTAG_PRETRANSPROG		= 1153,	/* s[] */
+     RPMTAG_POSTTRANSPROG	= 1154,	/* s[] */
+     RPMTAG_DISTTAG		= 1155,	/* s */
+-    RPMTAG_SUGGESTSNAME		= 1156,	/* s[] extension (unimplemented) */
+-#define	RPMTAG_SUGGESTS RPMTAG_SUGGESTSNAME	/* s[] (unimplemented) */
+-    RPMTAG_SUGGESTSVERSION	= 1157,	/* s[] extension (unimplemented) */
+-    RPMTAG_SUGGESTSFLAGS	= 1158,	/* i[] extension (unimplemented) */
+-    RPMTAG_ENHANCESNAME		= 1159,	/* s[] extension placeholder (unimplemented) */
+-#define	RPMTAG_ENHANCES RPMTAG_ENHANCESNAME	/* s[] (unimplemented) */
+-    RPMTAG_ENHANCESVERSION	= 1160,	/* s[] extension placeholder (unimplemented) */
+-    RPMTAG_ENHANCESFLAGS	= 1161,	/* i[] extension placeholder (unimplemented) */
++    RPMTAG_OLDSUGGESTSNAME	= 1156,	/* s[] (unimplemented) */
++#define	RPMTAG_OLDSUGGESTS RPMTAG_OLDSUGGESTSNAME /* s[] (unimplemented) */
++    RPMTAG_OLDSUGGESTSVERSION	= 1157,	/* s[] (unimplemented) */
++    RPMTAG_OLDSUGGESTSFLAGS	= 1158,	/* i[] (unimplemented) */
++    RPMTAG_OLDENHANCESNAME		= 1159,	/* s[] (unimplemented) */
++#define	RPMTAG_OLDENHANCES RPMTAG_OLDENHANCESNAME /* s[] (unimplemented) */
++    RPMTAG_OLDENHANCESVERSION	= 1160,	/* s[] (unimplemented) */
++    RPMTAG_OLDENHANCESFLAGS	= 1161,	/* i[] (unimplemented) */
+     RPMTAG_PRIORITY		= 1162, /* i[] extension placeholder (unimplemented) */
+     RPMTAG_CVSID		= 1163, /* s (unimplemented) */
+ #define	RPMTAG_SVNID	RPMTAG_CVSID	/* s (unimplemented) */
+@@ -261,6 +261,7 @@ typedef enum rpmTag_e {
+     RPMTAG_BUILDOBSOLETES	= 1194, /* internal (unimplemented) */
+     RPMTAG_DBINSTANCE		= 1195, /* i extension */
+     RPMTAG_NVRA			= 1196, /* s extension */
++
+     /* tags 1997-4999 reserved */
+     RPMTAG_FILENAMES		= 5000, /* s[] extension */
+     RPMTAG_FILEPROVIDE		= 5001, /* s[] extension */
+@@ -307,6 +308,26 @@ typedef enum rpmTag_e {
+     RPMTAG_OBSOLETENEVRS	= 5043, /* s[] extension */
+     RPMTAG_CONFLICTNEVRS	= 5044, /* s[] extension */
+     RPMTAG_FILENLINKS		= 5045,	/* i[] extension */
++    RPMTAG_RECOMMENDNAME	= 5046,	/* s[] */
++#define	RPMTAG_RECOMMENDS RPMTAG_RECOMMENDNAME	/* s[] */
++    RPMTAG_RECOMMENDVERSION	= 5047,	/* s[] */
++    RPMTAG_RECOMMENDFLAGS	= 5048,	/* i[] */
++    RPMTAG_SUGGESTNAME		= 5049,	/* s[] */
++#define	RPMTAG_SUGGESTS RPMTAG_SUGGESTNAME	/* s[] */
++    RPMTAG_SUGGESTVERSION	= 5050,	/* s[] extension */
++    RPMTAG_SUGGESTFLAGS		= 5051,	/* i[] extension */
++    RPMTAG_SUPPLEMENTNAME	= 5052,	/* s[] */
++#define	RPMTAG_SUPPLEMENTS RPMTAG_SUPPLEMENTNAME /* s[] */
++    RPMTAG_SUPPLEMENTVERSION	= 5053,	/* s[] */
++    RPMTAG_SUPPLEMENTFLAGS	= 5054,	/* i[] */
++    RPMTAG_ENHANCENAME		= 5055,	/* s[] */
++#define	RPMTAG_ENHANCES RPMTAG_ENHANCENAME	/* s[] */
++    RPMTAG_ENHANCEVERSION	= 5056,	/* s[] */
++    RPMTAG_ENHANCEFLAGS		= 5057,	/* i[] */
++    RPMTAG_RECOMMENDNEVRS	= 5058, /* s[] extension */
++    RPMTAG_SUGGESTNEVRS		= 5059, /* s[] extension */
++    RPMTAG_SUPPLEMENTNEVRS	= 5060, /* s[] extension */
++    RPMTAG_ENHANCENEVRS		= 5061, /* s[] extension */
+ 
+     RPMTAG_FIRSTFREE_TAG	/*!< internal */
+ } rpmTag;
+diff --git a/lib/tagexts.c b/lib/tagexts.c
+index 29b2bae..e940310 100644
+--- a/lib/tagexts.c
++++ b/lib/tagexts.c
+@@ -761,6 +761,26 @@ static int requirenevrsTag(Header h, rpmtd td, headerGetFlags hgflags)
+     return depnevrsTag(h, td, hgflags, RPMTAG_REQUIRENAME);
+ }
+ 
++static int recommendnevrsTag(Header h, rpmtd td, headerGetFlags hgflags)
++{
++    return depnevrsTag(h, td, hgflags, RPMTAG_RECOMMENDNAME);
++}
++
++static int suggestnevrsTag(Header h, rpmtd td, headerGetFlags hgflags)
++{
++    return depnevrsTag(h, td, hgflags, RPMTAG_SUGGESTNAME);
++}
++
++static int supplementnevrsTag(Header h, rpmtd td, headerGetFlags hgflags)
++{
++    return depnevrsTag(h, td, hgflags, RPMTAG_SUPPLEMENTNAME);
++}
++
++static int enhancenevrsTag(Header h, rpmtd td, headerGetFlags hgflags)
++{
++    return depnevrsTag(h, td, hgflags, RPMTAG_ENHANCENAME);
++}
++
+ static int providenevrsTag(Header h, rpmtd td, headerGetFlags hgflags)
+ {
+     return depnevrsTag(h, td, hgflags, RPMTAG_PROVIDENAME);
+@@ -823,6 +843,10 @@ static const struct headerTagFunc_s rpmHeaderTagExtensions[] = {
+     { RPMTAG_EPOCHNUM,		epochnumTag },
+     { RPMTAG_INSTFILENAMES,	instfilenamesTag },
+     { RPMTAG_REQUIRENEVRS,	requirenevrsTag },
++    { RPMTAG_RECOMMENDNEVRS,	recommendnevrsTag},
++    { RPMTAG_SUGGESTNEVRS,	suggestnevrsTag},
++    { RPMTAG_SUPPLEMENTNEVRS,	supplementnevrsTag},
++    { RPMTAG_ENHANCENEVRS,	enhancenevrsTag},
+     { RPMTAG_PROVIDENEVRS,	providenevrsTag },
+     { RPMTAG_OBSOLETENEVRS,	obsoletenevrsTag },
+     { RPMTAG_CONFLICTNEVRS,	conflictnevrsTag },
+diff --git a/rpmpopt.in b/rpmpopt.in
+index 805599e..036ab4e 100644
+--- a/rpmpopt.in
++++ b/rpmpopt.in
+@@ -67,6 +67,19 @@ rpm	alias --requires	--qf \
+ 	--POPTdesc=$"list capabilities required by package(s)"
+ rpm	alias -R --requires
+ 
++rpm	alias --recommends	--qf \
++  "[%|VERBOSE?{%{RECOMMENDFLAGS:deptype}: }:{}|%{RECOMMENDNEVRS}\n]" \
++	--POPTdesc=$"list capabilities recommended by package(s)"
++rpm	alias --suggests	--qf \
++  "[%|VERBOSE?{%{SUGGESTFLAGS:deptype}: }:{}|%{SUGGESTNEVRS}\n]" \
++	--POPTdesc=$"list capabilities suggested by package(s)"
++rpm	alias --supplements	--qf \
++  "[%|VERBOSE?{%{SUPPLEMENTFLAGS:deptype}: }:{}|%{SUPPLEMENTNEVRS}\n]" \
++	--POPTdesc=$"list capabilities supplemented by package(s)"
++rpm	alias --enhances	--qf \
++  "[%|VERBOSE?{%{ENHANCEFLAGS:deptype}: }:{}|%{ENHANCENEVRS}\n]" \
++	--POPTdesc=$"list capabilities enhanced by package(s)"
++
+ rpm	alias --info --qf '\
+ Name        : %{NAME}\n\
+ %|EPOCH?{Epoch       : %{EPOCH}\n}|\
+diff --git a/tests/data/SPECS/deptest.spec b/tests/data/SPECS/deptest.spec
+index cb4cbbd..7c47f6d 100644
+--- a/tests/data/SPECS/deptest.spec
++++ b/tests/data/SPECS/deptest.spec
+@@ -10,6 +10,10 @@ BuildArch:	noarch
+ %{?provs:Provides: %{provs}}
+ %{?cfls:Conflicts: %{cfls}}
+ %{?obs:Obsoletes: %{obs}}
++%{?recs:Recommends: %{recs}}
++%{?sugs:Suggests: %{sugs}}
++%{?sups:Supplements: %{sups}}
++%{?ens:Enhances: %{ens}}
+ 
+ %description
+ %{summary}
+diff --git a/tests/rpmbuild.at b/tests/rpmbuild.at
+index 6230903..c4c954c 100644
+--- a/tests/rpmbuild.at
++++ b/tests/rpmbuild.at
+@@ -185,3 +185,25 @@ lrwxrwxrwx /opt/globtest/linkgood
+ ],
+ [])
+ AT_CLEANUP
++
++# ------------------------------
++# Check if weak and reverse requires can be built
++AT_SETUP([Weak and reverse requires])
++AT_KEYWORDS([build])
++AT_CHECK([
++
++runroot rpmbuild -bb --quiet \
++	--define "pkg weakdeps" \
++	--define "recs foo > 1.2.3" \
++	--define "sugs bar >= 0.1.2" \
++	--define "sups baz" \
++	--define "ens zap = 3" \
++	  /data/SPECS/deptest.spec
++
++runroot rpm -qp --qf "[%{supplementname}\n]" /build/RPMS/noarch/deptest-weakdeps-1.0-1.noarch.rpm
++],
++[0],
++[baz
++],
++[ignore])
++AT_CLEANUP
+diff --git a/tests/rpmgeneral.at b/tests/rpmgeneral.at
+index 13131e2..80cca63 100644
+--- a/tests/rpmgeneral.at
++++ b/tests/rpmgeneral.at
+@@ -79,6 +79,11 @@ DISTTAG
+ DISTURL
+ DSAHEADER
+ E
++ENHANCEFLAGS
++ENHANCENAME
++ENHANCENEVRS
++ENHANCES
++ENHANCEVERSION
+ EPOCH
+ EPOCHNUM
+ EVR
+@@ -199,6 +204,11 @@ PROVIDES
+ PROVIDEVERSION
+ PUBKEYS
+ R
++RECOMMENDFLAGS
++RECOMMENDNAME
++RECOMMENDNEVRS
++RECOMMENDS
++RECOMMENDVERSION
+ RECONTEXTS
+ RELEASE
+ REMOVETID
+@@ -219,7 +229,17 @@ SOURCE
+ SOURCEPACKAGE
+ SOURCEPKGID
+ SOURCERPM
++SUGGESTFLAGS
++SUGGESTNAME
++SUGGESTNEVRS
++SUGGESTS
++SUGGESTVERSION
+ SUMMARY
++SUPPLEMENTFLAGS
++SUPPLEMENTNAME
++SUPPLEMENTNEVRS
++SUPPLEMENTS
++SUPPLEMENTVERSION
+ TRIGGERCONDS
+ TRIGGERFLAGS
+ TRIGGERINDEX
diff --git a/meta/recipes-devtools/rpm/rpm-4.11.2/use-pkgconfig-for-python.patch b/meta/recipes-devtools/rpm/rpm-4.11.2/use-pkgconfig-for-python.patch
new file mode 100644
index 0000000..8d84cf8
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm-4.11.2/use-pkgconfig-for-python.patch
@@ -0,0 +1,38 @@
+
+Use pkgconfig to get the correct include paths
+
+Upstream-Status: Pending
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+Signed-off-by: Ronan Le Martret <ronan.lemartret@open.eurogiciel.org>
+
+diff --git a/configure.ac b/configure.ac
+index e97f727..8179f44 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -540,10 +540,10 @@ esac],
+ 
+ AS_IF([test "$enable_python" = yes],[
+   AM_PATH_PYTHON([2.6],[
+-    WITH_PYTHON_INCLUDE=`${PYTHON} -c 'from distutils.sysconfig import *; import sys; sys.stdout.write(get_python_inc())'`
++    WITH_PYTHON_INCLUDE=$(${PKG_CONFIG} --cflags-only-I  python)
+     WITH_PYTHON_SUBPACKAGE=1
+     save_CPPFLAGS="$CPPFLAGS"
+-    CPPFLAGS="$CPPFLAGS -I$WITH_PYTHON_INCLUDE"
++    CPPFLAGS="$CPPFLAGS $WITH_PYTHON_INCLUDE"
+     AC_CHECK_HEADER([Python.h],[],
+       [AC_MSG_ERROR([missing Python.h])
+       ])
+diff --git a/python/Makefile.am b/python/Makefile.am
+index fff51ae..f37cb9d 100644
+--- a/python/Makefile.am
++++ b/python/Makefile.am
+@@ -4,7 +4,7 @@ EXTRA_DIST = rpm/__init__.py rpm/transaction.py
+ 
+ AM_CPPFLAGS = -I$(top_builddir)/include/
+ AM_CPPFLAGS += -I$(top_srcdir)/python
+-AM_CPPFLAGS += -I@WITH_PYTHON_INCLUDE@
++AM_CPPFLAGS += @WITH_PYTHON_INCLUDE@
+ 
+ pkgpyexec_LTLIBRARIES = _rpmmodule.la _rpmbmodule.la _rpmsmodule.la
+ pkgpyexec_DATA = rpm/__init__.py rpm/transaction.py
diff --git a/meta/recipes-devtools/rpm/rpm_4.11.2.bb b/meta/recipes-devtools/rpm/rpm_4.11.2.bb
new file mode 100644
index 0000000..66f9af6
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm_4.11.2.bb
@@ -0,0 +1,133 @@
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
+LICENSE = "GPL-2.0+"
+LIC_FILES_CHKSUM ??= "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+
+DEPENDS = "db libxml2 xz findutils file popt nss bzip2 elfutils patch attr zlib acl gzip make binutils python"
+
+SRC_URI += "http://rpm.org/releases/rpm-4.11.x/${BP}.tar.bz2 \
+            file://use-pkgconfig-for-python.patch \
+            file://remove-db3-from-configure.patch \
+            file://add_RPMSENSE_MISSINGOK_to_rpmmodule.patch \
+            file://support-suggests-tag.patch \
+            file://remove-dir-check.patch \
+            file://disable_shortcircuited.patch \
+            file://fix_libdir.patch \
+            file://rpm-scriptetexechelp.patch \
+            file://pythondeps.sh \
+           "
+
+SRC_URI[md5sum] = "876ac9948a88367054f8ddb5c0e87173"
+SRC_URI[sha256sum] = "403f8de632b33846ce5746f429c21a60f40dff9dcb56f1b4118f37a0652a48d4"
+
+inherit autotools-brokensep
+inherit pythonnative
+inherit pkgconfig
+inherit gettext
+
+EXTRA_OECONF += "--host=${HOST_SYS} \
+                 --program-prefix= \
+                 --prefix=${prefix} \
+                 --exec-prefix=${prefix} \
+                 --bindir=${prefix}/bin \
+                 --sbindir=${prefix}/sbin \
+                 --sysconfdir=${sysconfdir} \
+                 --datadir=${prefix}/share \
+                 --includedir=${prefix}/include \
+                 --libdir=${prefix}/lib \
+                 --libexecdir=${prefix}/libexec \
+                 --localstatedir=${localstatedir} \
+                 --sharedstatedir=${prefix}/com \
+                 --mandir=${mandir} \
+                 --infodir=${infodir} \
+                 --disable-dependency-tracking \
+                 --with-acl \
+                 --without-lua \
+                 --without-cap \
+                 --enable-shared \
+                 --enable-python \
+                 --with-external-db \
+                "
+
+CPPFLAGS_append = " `pkg-config --cflags nss`"
+LDFLAGS_append = " -Wl,-Bsymbolic-functions -ffunction-sections"
+CCFLAGS_append = " -fPIC "
+CXXFLAGS_append = " -fPIC "
+CFLAGS_append = " -fPIC -DRPM_VENDOR_WINDRIVER -DRPM_VENDOR_POKY -DRPM_VENDOR_OE "
+
+do_configure_prepend() {
+    rm -rf sqlite
+    rm -f m4/libtool.m4
+    rm -f m4/lt*.m4
+    rm -rf db3/configure*
+}
+
+do_install_append() {
+    mv ${D}/${base_bindir}/rpm ${D}/${bindir}/
+    rmdir ${D}/${base_bindir}
+    rm -f ${D}${prefix}/lib/*.la
+    rm -f ${D}${prefix}/lib/rpm-plugins/*.la
+    rm -f ${D}/${libdir}/python%{with_python_version}/site-packages/*.{a,la}
+    rm -f ${D}/${libdir}/python%{with_python_version}/site-packages/rpm/*.{a,la}
+    rm -fr ${D}/var
+    install -d ${D}${prefix}/lib/rpm/bin
+    ln -s ../debugedit ${D}${prefix}/lib/rpm/bin/debugedit
+    ln -s ../rpmdeps ${D}${prefix}/lib/rpm/bin/rpmdeps-oecore
+    install -m 0755 ${WORKDIR}/pythondeps.sh ${D}/${libdir}/rpm/pythondeps.sh
+}
+
+pkg_postinst_${PN}() {
+
+    [ "x\$D" == "x" ] && ldconfig
+    test -f ${localstatedir}/lib/rpm/Packages || rpm --initdb
+    rm -f ${localstatedir}/lib/rpm/Filemd5s \
+          ${localstatedir}/lib/rpm/Filedigests \
+          ${localstatedir}/lib/rpm/Requireversion \
+          ${localstatedir}/lib/rpm/Provideversion
+
+}
+
+pkg_postrm_${PN}() {
+    [ "x\$D" == "x" ] && ldconfig
+
+}
+
+PACKAGES += "python-${PN}"
+PROVIDES += "python-rpm"
+
+FILES_${PN} +=  "${libdir}/rpm \
+                 ${libdir}/rpm-plugins/exec.so \
+                "
+RDEPENDS_${PN} = "base-files run-postinsts"
+RDEPENDS_${PN}_class-native = "base-files run-postinsts"
+
+FILES_${PN}-dbg += "${libdir}/rpm/.debug/* \
+                    ${libdir}/rpm-plugins/.debug/* \
+                    ${libdir}/python2.7/site-packages/rpm/.debug/* \
+                   "
+
+FILES_${PN}-dev += "${libdir}/python2.7/site-packages/rpm/*.la"
+
+FILES_python-${PN} = "${libdir}/python2.7/site-packages/rpm/*"
+RDEPENDS_python-${PN} = "${PN} python"
+
+BBCLASSEXTEND = "native"
-- 
1.8.3.1


