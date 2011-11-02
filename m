Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RLi86-0007iF-PN
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 22:13:51 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pA2L7gYL017574
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Nov 2011 14:07:42 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 2 Nov 2011 14:07:42 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Nov 2011 16:11:58 -0500
Message-ID: <c4f20cb057c3fceca0543322f87e220fcfd2f69d.1320268188.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1320268188.git.mark.hatle@windriver.com>
References: <cover.1320268188.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/1] pseudo: Uprev pseudo to version 1.2
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
X-List-Received-Date: Wed, 02 Nov 2011 21:13:51 -0000
Content-Type: text/plain

This adds a new feature, PSEUDO_UNLOAD, which can be used to eliminate
overhead of LD_PRELOAD when no longer necessary.

Also the, clone(2), support on Linux has been updated to resolve some
potential defects in the previous implementation.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    6 +-
 .../pseudo/pseudo/realpath_fix.patch               |  165 --------------------
 .../pseudo/{pseudo_1.1.1.bb => pseudo_1.2.bb}      |    7 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb         |    6 +-
 4 files changed, 9 insertions(+), 175 deletions(-)
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo/realpath_fix.patch
 rename meta/recipes-devtools/pseudo/{pseudo_1.1.1.bb => pseudo_1.2.bb} (48%)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 998eabf..6995abb 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5944,11 +5944,11 @@ RECIPE_LAST_UPDATE_pn-gettext = "May 24, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-gettext = "Sep 29, 2011" 
 
 RECIPE_STATUS_pn-pseudo = "green"
-RECIPE_LATEST_VERSION_pn-pseudo = "1.1.1"
-RECIPE_LAST_UPDATE_pn-pseudo = "Jun 06, 2011"
+RECIPE_LATEST_VERSION_pn-pseudo = "1.2"
+RECIPE_LAST_UPDATE_pn-pseudo = "Nov 02, 2011"
 RECIPE_MAINTAINER_pn-pseudo = "Mark Hatle <mark.hatle@windriver.com>"
 RECIPE_COMMENTS_pn-pseudo = "Yocto Project maintained"
-RECIPE_MANUAL_CHECK_DATE_pn-pseudo = "Jun 06, 2011" 
+RECIPE_MANUAL_CHECK_DATE_pn-pseudo = "Nov 02, 2011" 
 DISTRO_PN_ALIAS_pn-pseudo = "Windriver"
 
 DISTRO_PN_ALIAS_pn-rt-tests = "Debian=rt-tests Ubuntu=rt-tests"
diff --git a/meta/recipes-devtools/pseudo/pseudo/realpath_fix.patch b/meta/recipes-devtools/pseudo/pseudo/realpath_fix.patch
deleted file mode 100644
index 4a107e0..0000000
--- a/meta/recipes-devtools/pseudo/pseudo/realpath_fix.patch
+++ /dev/null
@@ -1,165 +0,0 @@
-commit c2f7c5ad8ef0f9c94a2a8382c109c8c6e16c8b18
-Author: Peter Seebach <peter.seebach@windriver.com>
-Date:   Thu Jun 9 10:53:32 2011 -0500
-
-    Fix realpath(name, NULL) when PSEUDO_DISABLED=1
-    
-    On some Linux systems, dlsym("realpath", RTLD_NEXT) prefers
-    for reasons of its own to give a symbol that is also known
-    as old_realpath, which fails and yields EINVAL when called
-    with a null pointer as the second argument.  This can be
-    avoided, on some systems, by using dlvsym() to request
-    the GLIBC_2.3 version of the symbol.
-    
-    The wrapper logic is enhanced to allow for specifying
-    versions, although this currently only works for Linux
-    (Darwin has no dlvsym, apparently?).  The test case is
-    a trivial program which calls realpath(name, NULL) run
-    with PSEUDO_DISABLED=1.
-
-diff --git a/ChangeLog.txt b/ChangeLog.txt
-index 7ffb74a..a2bbb61 100644
---- a/ChangeLog.txt
-+++ b/ChangeLog.txt
-@@ -1,3 +1,8 @@
-+2011-06-08:
-+	* (seebs) Get the modern realpath from glibc instead of the old
-+	  one inexplicably proferred by RTLD_NEXT.  Fixes realpath(path, NULL)
-+	  when PSEUDO_DISABLED=1.
-+
- 2011-06-06:
- 	* (seebs) revise system() handler substantially.  It now
- 	  pollutes the environment but works.
-diff --git a/makewrappers b/makewrappers
-index 6dcf889..20bbf2b 100755
---- a/makewrappers
-+++ b/makewrappers
-@@ -211,6 +211,7 @@ class Function:
-         self.flags = '0'
-         self.port = port
-         self.directory = ''
-+	self.version = 'NULL'
-         # On Darwin, some functions are SECRETLY converted to foo$INODE64
-         # when called.  So we have to look those up for real_*
-         self.inode64 = None
-diff --git a/ports/unix/wrapfuncs.in b/ports/unix/wrapfuncs.in
-index 74bad89..e06e404 100644
---- a/ports/unix/wrapfuncs.in
-+++ b/ports/unix/wrapfuncs.in
-@@ -18,7 +18,7 @@ int lutimes(const char *path, const struct timeval *tv);
- char *mkdtemp(char *template);
- char *mktemp(char *template);
- long pathconf(const char *path, int name);
--char *realpath(const char *name, char *resolved_name);
-+char *realpath(const char *name, char *resolved_name); /* version="GLIBC_2.3" */
- int remove(const char *path); /* flags=AT_SYMLINK_NOFOLLOW */
- DIR *opendir(const char *path);
- char *tempnam(const char *template, const char *pfx);
-diff --git a/pseudo_wrappers.c b/pseudo_wrappers.c
-index 600a918..07a4429 100644
---- a/pseudo_wrappers.c
-+++ b/pseudo_wrappers.c
-@@ -90,6 +90,42 @@ pseudo_reinit_libpseudo(void) {
- 	_libpseudo_init();
- }
- 
-+static void
-+pseudo_init_one_wrapper(pseudo_function *func) {
-+	int (*f)(void) = (int (*)(void)) NULL;
-+	char *e;
-+	if (*func->real != NULL) {
-+		/* already initialized */
-+		return;
-+	}
-+	dlerror();
-+
-+#if PSEUDO_PORT_LINUX
-+	if (func->version)
-+		f = dlvsym(RTLD_NEXT, func->name, func->version);
-+	/* fall through to the general case, if that failed */
-+	if (!f)
-+#endif
-+	f = dlsym(RTLD_NEXT, func->name);
-+	if (f) {
-+		*func->real = f;
-+	} else {
-+		e = dlerror();
-+#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
-+		char *s = func->name;
-+		s += strlen(s) - 2;
-+		/* *at() don't have to exist */
-+		if (!strcmp(s, "at")) {
-+			continue;
-+		}
-+#else
-+		if (e != NULL) {
-+			pseudo_diag("No real function for %s: %s\n", func->name, e);
-+		}
-+#endif
-+	}
-+}
-+
- void
- pseudo_init_wrappers(void) {
- 	int i;
-@@ -103,29 +139,7 @@ pseudo_init_wrappers(void) {
- 	 */
- 	if (!done) {
- 		for (i = 0; pseudo_functions[i].name; ++i) {
--			if (*pseudo_functions[i].real == NULL) {
--				int (*f)(void);
--				char *e;
--				dlerror();
--				f = dlsym(RTLD_NEXT, pseudo_functions[i].name);
--				if (f) {
--					*pseudo_functions[i].real = f;
--				} else {
--					e = dlerror();
--#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
--					char *s = pseudo_functions[i].name;
--					s += strlen(s) - 2;
--					/* *at() don't have to exist */
--					if (!strcmp(s, "at")) {
--						continue;
--					}
--#else
--					if (e != NULL) {
--						pseudo_diag("No real function for %s: %s\n", pseudo_functions[i].name, e);
--					}
--#endif
--				}
--			}
-+			pseudo_init_one_wrapper(&pseudo_functions[i]);
- 		}
- 		done = 1;
- 	}
-diff --git a/templates/wrapper_table b/templates/wrapper_table
-index 2e79fcd..bb30530 100644
---- a/templates/wrapper_table
-+++ b/templates/wrapper_table
-@@ -4,17 +4,21 @@
- 
- /* This file is generated and should not be modified.  See the makewrappers
-  * script if you want to modify this. */
--static struct {
-+typedef struct {
- 	char *name;		/* the name */
- 	int (**real)(void);	/* the underlying syscall */
- 	int (*wrapper)(void);	/* the wrapper from guts/name.c */
--} pseudo_functions[] = {
-+	char *version;		/* the version, if we know and care */
-+} pseudo_function;
-+
-+static pseudo_function pseudo_functions[] = {
- @body
- 	{ /* ${comment}; */
- 		"${name}${maybe_inode64}",
- 		(int (**)(void)) &real_${name},
--		(int (*)(void)) wrap_${name}
-+		(int (*)(void)) wrap_${name},
-+		${version}
- 	},
- @footer
--	{ NULL, NULL, NULL },
-+	{ NULL, NULL, NULL, NULL },
- };
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.1.1.bb b/meta/recipes-devtools/pseudo/pseudo_1.2.bb
similarity index 48%
rename from meta/recipes-devtools/pseudo/pseudo_1.1.1.bb
rename to meta/recipes-devtools/pseudo/pseudo_1.2.bb
index 0a61aec..1d5fe1a 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.1.1.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.2.bb
@@ -1,11 +1,10 @@
 require pseudo.inc
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://oe-config.patch \
-           file://realpath_fix.patch \
            file://static_sqlite.patch"
 
-SRC_URI[md5sum] = "dd59766c17e199fe6144fce8a2c67802"
-SRC_URI[sha256sum] = "c697f643577d661c3ce826504b9dcd11fa98e78a5d10e3c83931da8942f6bfad"
+SRC_URI[md5sum] = "a2819084bab7e991f06626d02cf55048"
+SRC_URI[sha256sum] = "4749a22df687f44d24c26e97170d4781a1bd52d5ee092364a40877e4d96ff058"
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index c1f0432..5ed8cf7 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,8 +1,8 @@
 require pseudo.inc
 
-SRCREV = "c2f7c5ad8ef0f9c94a2a8382c109c8c6e16c8b18"
-PV = "1.1.1+git${SRCPV}"
-PR = "r19"
+SRCREV = "17c2233f93692f79684792750001ee6d13e03925"
+PV = "1.2+git${SRCPV}"
+PR = "r20"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.7.3.4



