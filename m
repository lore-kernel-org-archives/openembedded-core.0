Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id DB660747B6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 07:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id B15D7182C9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 09:42:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id L3Usy9VtjfUB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 09:42:39 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id BBDF018414
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 09:42:39 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A2B1B1E079
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 09:42:39 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8CB1F1E077
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 09:42:39 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 09:42:39 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 7F2B722EA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 09:42:39 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w4V7gUEp031048
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 09:42:30 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w4V7gUvB031047
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2018 09:42:30 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 May 2018 09:42:28 +0200
Message-Id: <8c62cb38b58ec1836d7c3c042533affd1fccd9e8.1527752449.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1527752449.git.pkj@axis.com>
References: <cover.1527752449.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCHv2 2/2] rpm: Restore performance in Docker containers
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
X-List-Received-Date: Thu, 31 May 2018 07:42:41 -0000

If the maximum number of open file descriptors is much greater than the
usual 1024 (for example inside a Docker container), the performance
drops significantly.

This was reported upstream in:
https://bugzilla.redhat.com/show_bug.cgi?id=1537564
which resulted in:
https://github.com/rpm-software-management/rpm/pull/444

The pull request above has now been integrated and this commit contains
a backport of its three patches, which together change the behavior of
rpm so that its performance is now independent of the maximum number of
open file descriptors.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...0001-Factor-out-and-unify-setting-CLOEXEC.patch | 148 +++++++++++++++++++++
 .../files/0002-Optimize-rpmSetCloseOnExec.patch    | 100 ++++++++++++++
 .../0003-rpmSetCloseOnExec-use-getrlimit.patch     |  53 ++++++++
 meta/recipes-devtools/rpm/rpm_4.14.1.bb            |   3 +
 4 files changed, 304 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Factor-out-and-unify-setting-CLOEXEC.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0002-Optimize-rpmSetCloseOnExec.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0003-rpmSetCloseOnExec-use-getrlimit.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-Factor-out-and-unify-setting-CLOEXEC.patch b/meta/recipes-devtools/rpm/files/0001-Factor-out-and-unify-setting-CLOEXEC.patch
new file mode 100644
index 0000000000..6f440c6178
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-Factor-out-and-unify-setting-CLOEXEC.patch
@@ -0,0 +1,148 @@
+From 9c3e5de3240554c8ea1b29d52eeadee4840fefac Mon Sep 17 00:00:00 2001
+From: Kir Kolyshkin <kolyshkin@gmail.com>
+Date: Tue, 29 May 2018 17:37:05 -0700
+Subject: [PATCH 1/3] Factor out and unify setting CLOEXEC
+
+Commit 7a7c31f5 ("Set FD_CLOEXEC on opened files before exec from
+lua script is called") copied the code that sets CLOEXEC flag on all
+possible file descriptors from lib/rpmscript.c to luaext/lposix.c,
+essentially creating two copies of the same code (modulo comments
+and the unused assignment).
+
+This commit moves the functionality into its own function, without
+any code modifications, using the version from luaext/lposix.c.
+
+Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>
+Upstream-Status: Accepted [https://github.com/rpm-software-management/rpm/pull/444]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ lib/rpmscript.c        | 18 ++----------------
+ luaext/lposix.c        | 13 ++-----------
+ rpmio/rpmio.c          | 16 ++++++++++++++++
+ rpmio/rpmio_internal.h |  6 ++++++
+ 4 files changed, 26 insertions(+), 27 deletions(-)
+
+diff --git a/lib/rpmscript.c b/lib/rpmscript.c
+index 747385a5b..b4ccd3246 100644
+--- a/lib/rpmscript.c
++++ b/lib/rpmscript.c
+@@ -3,7 +3,6 @@
+ #include <sys/types.h>
+ #include <sys/wait.h>
+ #include <errno.h>
+-#include <unistd.h>
+ 
+ #include <rpm/rpmfileutil.h>
+ #include <rpm/rpmmacro.h>
+@@ -14,6 +13,7 @@
+ 
+ #include "rpmio/rpmlua.h"
+ #include "lib/rpmscript.h"
++#include "rpmio/rpmio_internal.h"
+ 
+ #include "lib/rpmplugins.h"     /* rpm plugins hooks */
+ 
+@@ -170,26 +170,12 @@ static const char * const SCRIPT_PATH = "PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr
+ static void doScriptExec(ARGV_const_t argv, ARGV_const_t prefixes,
+ 			FD_t scriptFd, FD_t out)
+ {
+-    int flag;
+-    int fdno;
+     int xx;
+-    int open_max;
+ 
+     /* SIGPIPE is ignored in rpm, reset to default for the scriptlet */
+     (void) signal(SIGPIPE, SIG_DFL);
+ 
+-    /* XXX Force FD_CLOEXEC on all inherited fdno's. */
+-    open_max = sysconf(_SC_OPEN_MAX);
+-    if (open_max == -1) {
+-	open_max = 1024;
+-    }
+-    for (fdno = 3; fdno < open_max; fdno++) {
+-	flag = fcntl(fdno, F_GETFD);
+-	if (flag == -1 || (flag & FD_CLOEXEC))
+-	    continue;
+-	xx = fcntl(fdno, F_SETFD, FD_CLOEXEC);
+-	/* XXX W2DO? debug msg for inheirited fdno w/o FD_CLOEXEC */
+-    }
++    rpmSetCloseOnExec();
+ 
+     if (scriptFd != NULL) {
+ 	int sfdno = Fileno(scriptFd);
+diff --git a/luaext/lposix.c b/luaext/lposix.c
+index 0a7c26c71..5d7ad3c87 100644
+--- a/luaext/lposix.c
++++ b/luaext/lposix.c
+@@ -27,6 +27,7 @@
+ #include <unistd.h>
+ #include <utime.h>
+ #include <rpm/rpmutil.h>
++#include "rpmio/rpmio_internal.h"
+ 
+ #define MYNAME		"posix"
+ #define MYVERSION	MYNAME " library for " LUA_VERSION " / Nov 2003"
+@@ -335,21 +336,11 @@ static int Pexec(lua_State *L)			/** exec(path,[args]) */
+ 	const char *path = luaL_checkstring(L, 1);
+ 	int i,n=lua_gettop(L);
+ 	char **argv;
+-	int flag, fdno, open_max;
+ 
+ 	if (!have_forked)
+ 	    return luaL_error(L, "exec not permitted in this context");
+ 
+-	open_max = sysconf(_SC_OPEN_MAX);
+-	if (open_max == -1) {
+-	    open_max = 1024;
+-	}
+-	for (fdno = 3; fdno < open_max; fdno++) {
+-	    flag = fcntl(fdno, F_GETFD);
+-	    if (flag == -1 || (flag & FD_CLOEXEC))
+-		continue;
+-	    fcntl(fdno, F_SETFD, FD_CLOEXEC);
+-	}
++	rpmSetCloseOnExec();
+ 
+ 	argv = malloc((n+1)*sizeof(char*));
+ 	if (argv==NULL) return luaL_error(L,"not enough memory");
+diff --git a/rpmio/rpmio.c b/rpmio/rpmio.c
+index c7cbc32aa..ea111d2ec 100644
+--- a/rpmio/rpmio.c
++++ b/rpmio/rpmio.c
+@@ -1759,3 +1759,19 @@ DIGEST_CTX fdDupDigest(FD_t fd, int id)
+ 
+     return ctx;
+ }
++
++void rpmSetCloseOnExec(void)
++{
++	int flag, fdno, open_max;
++
++	open_max = sysconf(_SC_OPEN_MAX);
++	if (open_max == -1) {
++		open_max = 1024;
++	}
++	for (fdno = 3; fdno < open_max; fdno++) {
++		flag = fcntl(fdno, F_GETFD);
++		if (flag == -1 || (flag & FD_CLOEXEC))
++			continue;
++		fcntl(fdno, F_SETFD, FD_CLOEXEC);
++	}
++}
+diff --git a/rpmio/rpmio_internal.h b/rpmio/rpmio_internal.h
+index fbed183b0..370cbdc75 100644
+--- a/rpmio/rpmio_internal.h
++++ b/rpmio/rpmio_internal.h
+@@ -41,6 +41,12 @@ DIGEST_CTX fdDupDigest(FD_t fd, int id);
+ int rpmioSlurp(const char * fn,
+                 uint8_t ** bp, ssize_t * blenp);
+ 
++/**
++ * Set close-on-exec flag for all opened file descriptors, except
++ * stdin/stdout/stderr.
++ */
++void rpmSetCloseOnExec(void);
++
+ #ifdef __cplusplus
+ }
+ #endif
diff --git a/meta/recipes-devtools/rpm/files/0002-Optimize-rpmSetCloseOnExec.patch b/meta/recipes-devtools/rpm/files/0002-Optimize-rpmSetCloseOnExec.patch
new file mode 100644
index 0000000000..a27f8e6237
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0002-Optimize-rpmSetCloseOnExec.patch
@@ -0,0 +1,100 @@
+From 5e6f05cd8dad6c1ee6bd1e6e43f176976c9c3416 Mon Sep 17 00:00:00 2001
+From: Kir Kolyshkin <kolyshkin@gmail.com>
+Date: Tue, 29 May 2018 17:52:56 -0700
+Subject: [PATCH 2/3] Optimize rpmSetCloseOnExec
+
+In case maximum number of open files limit is set too high, both
+luaext/Pexec() and lib/doScriptExec() spend way too much time
+trying to set FD_CLOEXEC flag for all those file descriptors,
+resulting in severe increase of time it takes to execute say
+rpm or dnf.
+
+This becomes increasingly noticeable when running with e.g. under
+Docker, the reason being:
+
+> $ docker run fedora ulimit -n
+> 1048576
+
+One obvious fix is to use procfs to get the actual list of opened fds
+and iterate over it. My quick-n-dirty benchmark shows the /proc approach
+is about 10x faster than iterating through a list of just 1024 fds,
+so it's an improvement even for default ulimit values.
+
+Note that the old method is still used in case /proc is not available.
+
+While at it,
+
+ 1. fix the function by making sure we modify (rather than set)
+    the existing flags. As the only known flag is FD_CLOEXEC,
+    this change is currently purely aesthetical, but in case
+    other flags will appear it will become a real bug fix.
+
+ 2. get rid of magic number 3; use STDERR_FILENO
+
+Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>
+
+Fixes #444
+
+Upstream-Status: Accepted [https://github.com/rpm-software-management/rpm/pull/444]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ rpmio/rpmio.c | 43 ++++++++++++++++++++++++++++++++++---------
+ 1 file changed, 34 insertions(+), 9 deletions(-)
+
+diff --git a/rpmio/rpmio.c b/rpmio/rpmio.c
+index ea111d2ec..55351c221 100644
+--- a/rpmio/rpmio.c
++++ b/rpmio/rpmio.c
+@@ -1760,18 +1760,43 @@ DIGEST_CTX fdDupDigest(FD_t fd, int id)
+     return ctx;
+ }
+ 
++static void set_cloexec(int fd)
++{
++	int flags = fcntl(fd, F_GETFD);
++
++	if (flags == -1 || (flags & FD_CLOEXEC))
++		return;
++
++	fcntl(fd, F_SETFD, flags | FD_CLOEXEC);
++}
++
+ void rpmSetCloseOnExec(void)
+ {
+-	int flag, fdno, open_max;
++	const int min_fd = STDERR_FILENO; /* don't touch stdin/out/err */
++	int fd;
++
++	DIR *dir = opendir("/proc/self/fd");
++	if (dir == NULL) { /* /proc not available */
++		/* iterate over all possible fds, might be slow */
++		int open_max = sysconf(_SC_OPEN_MAX);
++		if (open_max == -1)
++			open_max = 1024;
+ 
+-	open_max = sysconf(_SC_OPEN_MAX);
+-	if (open_max == -1) {
+-		open_max = 1024;
++		for (fd = min_fd + 1; fd < open_max; fd++)
++			set_cloexec(fd);
++
++		return;
+ 	}
+-	for (fdno = 3; fdno < open_max; fdno++) {
+-		flag = fcntl(fdno, F_GETFD);
+-		if (flag == -1 || (flag & FD_CLOEXEC))
+-			continue;
+-		fcntl(fdno, F_SETFD, FD_CLOEXEC);
++
++	/* iterate over fds obtained from /proc */
++	struct dirent *entry;
++	while ((entry = readdir(dir)) != NULL) {
++		fd = atoi(entry->d_name);
++		if (fd > min_fd)
++			set_cloexec(fd);
+ 	}
++
++	closedir(dir);
++
++	return;
+ }
diff --git a/meta/recipes-devtools/rpm/files/0003-rpmSetCloseOnExec-use-getrlimit.patch b/meta/recipes-devtools/rpm/files/0003-rpmSetCloseOnExec-use-getrlimit.patch
new file mode 100644
index 0000000000..389b41b42c
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0003-rpmSetCloseOnExec-use-getrlimit.patch
@@ -0,0 +1,53 @@
+From 307e28b4cb08b05bc044482058eeebc9f59bb9a9 Mon Sep 17 00:00:00 2001
+From: Kir Kolyshkin <kolyshkin@gmail.com>
+Date: Tue, 29 May 2018 18:09:27 -0700
+Subject: [PATCH 3/3] rpmSetCloseOnExec: use getrlimit()
+
+In case /proc is not available to get the actual list of opened fds,
+we fall back to iterating through the list of all possible fds.
+
+It is possible that during the course of the program execution the limit
+on number of open file descriptors might be lowered, so using the
+current limit, as returned by sysconf(_SC_OPEN_MAX), might omit some
+fds. Therefore, it is better to use rlim_max from the structure
+filled in by gertlimit(RLIMIT_NOFILE) to make sure we're checking
+all fds.
+
+This slows down the function, but only in the case /proc is not
+available, which should be rare in practice.
+
+Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>
+Upstream-Status: Accepted [https://github.com/rpm-software-management/rpm/pull/444]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ rpmio/rpmio.c | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/rpmio/rpmio.c b/rpmio/rpmio.c
+index 55351c221..e051c9863 100644
+--- a/rpmio/rpmio.c
++++ b/rpmio/rpmio.c
+@@ -10,6 +10,7 @@
+ #include <sys/personality.h>
+ #endif
+ #include <sys/utsname.h>
++#include <sys/resource.h>
+ 
+ #include <rpm/rpmlog.h>
+ #include <rpm/rpmmacro.h>
+@@ -1778,7 +1779,14 @@ void rpmSetCloseOnExec(void)
+ 	DIR *dir = opendir("/proc/self/fd");
+ 	if (dir == NULL) { /* /proc not available */
+ 		/* iterate over all possible fds, might be slow */
+-		int open_max = sysconf(_SC_OPEN_MAX);
++		struct rlimit rl;
++		int open_max;
++
++		if (getrlimit(RLIMIT_NOFILE, &rl) == 0 && rl.rlim_max != RLIM_INFINITY)
++			open_max = rl.rlim_max;
++		else
++			open_max = sysconf(_SC_OPEN_MAX);
++
+ 		if (open_max == -1)
+ 			open_max = 1024;
+ 
diff --git a/meta/recipes-devtools/rpm/rpm_4.14.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
index ef4b737e9b..e5e87d3903 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
@@ -40,6 +40,9 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
            file://0004-build-pack.c-remove-static-local-variables-from-buil.patch \
            file://0001-perl-disable-auto-reqs.patch \
            file://0001-configure.ac-add-option-for-dbus.patch \
+           file://0001-Factor-out-and-unify-setting-CLOEXEC.patch \
+           file://0002-Optimize-rpmSetCloseOnExec.patch \
+           file://0003-rpmSetCloseOnExec-use-getrlimit.patch \
            "
 
 PE = "1"
-- 
2.12.0


