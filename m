Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QUij0-00061E-Cj
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 19:08:54 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p59H5Yd4016579
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Jun 2011 10:05:34 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 9 Jun 2011 10:05:33 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Jun 2011 12:15:45 -0500
Message-ID: <f4bf925e5ef24493da42015e1be93d59b85f3a44.1307639649.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307639649.git.mark.hatle@windriver.com>
References: <cover.1307639649.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/1] pseudo: Fix problem related to realpath
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
X-List-Received-Date: Thu, 09 Jun 2011 17:08:54 -0000
Content-Type: text/plain

When pseudo is disabled, certain programs that call realpath may not
work properly.  This was discovered when using the Qt MOC tool when
certain qmake project features are used.

[YOCTO #1150]

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../pseudo/pseudo/realpath_fix.patch               |  165 ++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.1.1.bb       |    3 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb         |    2 +-
 3 files changed, 168 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/pseudo/realpath_fix.patch

diff --git a/meta/recipes-devtools/pseudo/pseudo/realpath_fix.patch b/meta/recipes-devtools/pseudo/pseudo/realpath_fix.patch
new file mode 100644
index 0000000..7beea51
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/pseudo/realpath_fix.patch
@@ -0,0 +1,165 @@
+commit c2f7c5ad8ef0f9c94a2a8382c109c8c6e16c8b18
+Author: Peter Seebach <peter.seebach@windriver.com>
+Date:   Thu Jun 9 10:53:32 2011 -0500
+
+    Fix realpath(name, NULL) when PSEUDO_DISABLED=1
+    
+    On some Linux systems, dlsym("realpath", RTLD_NEXT) prefers
+    for reasons of its own to give a symbol that is also known
+    as old_realpath, which fails and yields EINVAL when called
+    with a null pointer as the second argument.  This can be
+    avoided, on some systems, by using dlvsym() to request
+    the GLIBC_2.3 version of the symbol.
+    
+    The wrapper logic is enhanced to allow for specifying
+    versions, although this currently only works for Linux
+    (Darwin has no dlvsym, apparently?).  The test case is
+    a trivial program which calls realpath(name, NULL) run
+    with PSEUDO_DISABLED=1.
+
+diff --git a/ChangeLog.txt b/ChangeLog.txt
+index 7ffb74a..a2bbb61 100644
+--- a/ChangeLog.txt
++++ b/ChangeLog.txt
+@@ -1,3 +1,8 @@
++2011-06-08:
++	* (seebs) Get the modern realpath from glibc instead of the old
++	  one inexplicably proferred by RTLD_NEXT.  Fixes realpath(path, NULL)
++	  when PSEUDO_DISABLED=1.
++
+ 2011-06-06:
+ 	* (seebs) revise system() handler substantially.  It now
+ 	  pollutes the environment but works.
+diff --git a/makewrappers b/makewrappers
+index 6dcf889..20bbf2b 100755
+--- a/makewrappers
++++ b/makewrappers
+@@ -211,6 +211,7 @@ class Function:
+         self.flags = '0'
+         self.port = port
+         self.directory = ''
++	self.version = 'NULL'
+         # On Darwin, some functions are SECRETLY converted to foo$INODE64
+         # when called.  So we have to look those up for real_*
+         self.inode64 = None
+diff --git a/ports/unix/wrapfuncs.in b/ports/unix/wrapfuncs.in
+index 74bad89..e06e404 100644
+--- a/ports/unix/wrapfuncs.in
++++ b/ports/unix/wrapfuncs.in
+@@ -18,7 +18,7 @@ int lutimes(const char *path, const struct timeval *tv);
+ char *mkdtemp(char *template);
+ char *mktemp(char *template);
+ long pathconf(const char *path, int name);
+-char *realpath(const char *name, char *resolved_name);
++char *realpath(const char *name, char *resolved_name); /* version="GLIBC_2.3" */
+ int remove(const char *path); /* flags=AT_SYMLINK_NOFOLLOW */
+ DIR *opendir(const char *path);
+ char *tempnam(const char *template, const char *pfx);
+diff --git a/pseudo_wrappers.c b/pseudo_wrappers.c
+index 600a918..07a4429 100644
+--- a/pseudo_wrappers.c
++++ b/pseudo_wrappers.c
+@@ -90,6 +90,42 @@ pseudo_reinit_libpseudo(void) {
+ 	_libpseudo_init();
+ }
+ 
++static void
++pseudo_init_one_wrapper(pseudo_function *func) {
++	int (*f)(void);
++	char *e;
++	if (*func->real != NULL) {
++		/* already initialized */
++		return;
++	}
++	dlerror();
++
++#if PSEUDO_PORT_LINUX
++	if (func->version)
++		f = dlvsym(RTLD_NEXT, func->name, func->version);
++	/* fall through to the general case, if that failed */
++	if (!f)
++#endif
++	f = dlsym(RTLD_NEXT, func->name);
++	if (f) {
++		*func->real = f;
++	} else {
++		e = dlerror();
++#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
++		char *s = func->name;
++		s += strlen(s) - 2;
++		/* *at() don't have to exist */
++		if (!strcmp(s, "at")) {
++			continue;
++		}
++#else
++		if (e != NULL) {
++			pseudo_diag("No real function for %s: %s\n", func->name, e);
++		}
++#endif
++	}
++}
++
+ void
+ pseudo_init_wrappers(void) {
+ 	int i;
+@@ -103,29 +139,7 @@ pseudo_init_wrappers(void) {
+ 	 */
+ 	if (!done) {
+ 		for (i = 0; pseudo_functions[i].name; ++i) {
+-			if (*pseudo_functions[i].real == NULL) {
+-				int (*f)(void);
+-				char *e;
+-				dlerror();
+-				f = dlsym(RTLD_NEXT, pseudo_functions[i].name);
+-				if (f) {
+-					*pseudo_functions[i].real = f;
+-				} else {
+-					e = dlerror();
+-#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
+-					char *s = pseudo_functions[i].name;
+-					s += strlen(s) - 2;
+-					/* *at() don't have to exist */
+-					if (!strcmp(s, "at")) {
+-						continue;
+-					}
+-#else
+-					if (e != NULL) {
+-						pseudo_diag("No real function for %s: %s\n", pseudo_functions[i].name, e);
+-					}
+-#endif
+-				}
+-			}
++			pseudo_init_one_wrapper(&pseudo_functions[i]);
+ 		}
+ 		done = 1;
+ 	}
+diff --git a/templates/wrapper_table b/templates/wrapper_table
+index 2e79fcd..bb30530 100644
+--- a/templates/wrapper_table
++++ b/templates/wrapper_table
+@@ -4,17 +4,21 @@
+ 
+ /* This file is generated and should not be modified.  See the makewrappers
+  * script if you want to modify this. */
+-static struct {
++typedef struct {
+ 	char *name;		/* the name */
+ 	int (**real)(void);	/* the underlying syscall */
+ 	int (*wrapper)(void);	/* the wrapper from guts/name.c */
+-} pseudo_functions[] = {
++	char *version;		/* the version, if we know and care */
++} pseudo_function;
++
++static pseudo_function pseudo_functions[] = {
+ @body
+ 	{ /* ${comment}; */
+ 		"${name}${maybe_inode64}",
+ 		(int (**)(void)) &real_${name},
+-		(int (*)(void)) wrap_${name}
++		(int (*)(void)) wrap_${name},
++		${version}
+ 	},
+ @footer
+-	{ NULL, NULL, NULL },
++	{ NULL, NULL, NULL, NULL },
+ };
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.1.1.bb b/meta/recipes-devtools/pseudo/pseudo_1.1.1.bb
index e05fe41..f1c8e63 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.1.1.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.1.1.bb
@@ -1,9 +1,10 @@
 require pseudo.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://oe-config.patch \
+           file://realpath_fix.patch \
            file://static_sqlite.patch"
 
 SRC_URI[md5sum] = "dd59766c17e199fe6144fce8a2c67802"
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 6505958..c1f0432 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,6 +1,6 @@
 require pseudo.inc
 
-SRCREV = "1d3e67cb168c3459e67a0b29f071ca30ed17dadc"
+SRCREV = "c2f7c5ad8ef0f9c94a2a8382c109c8c6e16c8b18"
 PV = "1.1.1+git${SRCPV}"
 PR = "r19"
 
-- 
1.7.3.4



