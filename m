Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 49F617FA29
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 07:09:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 00H795fC014617
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2020 23:09:06 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Thu, 16 Jan 2020 23:09:05 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Jan 2020 15:09:04 +0800
Message-ID: <1579244944-404720-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] sysklogd: fix parallel build problem
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
X-List-Received-Date: Fri, 17 Jan 2020 07:09:05 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Parallel compile maybe failed with error:
error: ../lib/strlcat.o: No such file or directory
Makefile:619: recipe for target 'syslogd' failed

remove previous patch, and backport lastest fix
for this problem

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...pat-to-simplify-build-deps-and-really-fix.patch | 127 +++++++++++++++++++++
 ...arallel-build-problem-reported-by-Gentoo-.patch |  47 --------
 meta/recipes-extended/sysklogd/sysklogd.inc        |   2 +-
 3 files changed, 128 insertions(+), 48 deletions(-)
 create mode 100644 meta/recipes-extended/sysklogd/files/0001-Drop-libcompat-to-simplify-build-deps-and-really-fix.patch
 delete mode 100644 meta/recipes-extended/sysklogd/files/0001-Fix-nasty-parallel-build-problem-reported-by-Gentoo-.patch

diff --git a/meta/recipes-extended/sysklogd/files/0001-Drop-libcompat-to-simplify-build-deps-and-really-fix.patch b/meta/recipes-extended/sysklogd/files/0001-Drop-libcompat-to-simplify-build-deps-and-really-fix.patch
new file mode 100644
index 0000000..9ba7ecc
--- /dev/null
+++ b/meta/recipes-extended/sysklogd/files/0001-Drop-libcompat-to-simplify-build-deps-and-really-fix.patch
@@ -0,0 +1,127 @@
+From 84d70e63fc105e3713943ed8c0bdd4e31a698226 Mon Sep 17
+00:00:00 2001 From: Joachim Nilsson <troglobit@gmail.com> Date: Thu, 16 Jan
+2020 22:16:51 +0100 Subject: [PATCH] Drop libcompat to simplify build deps
+and really fix
+
+The original idea with libcompat was to keep as few objects as
+possible for linking with libsyslog.  That in turn to prevent
+a user of libsyslog from suddenly also getting strong binding
+to symbols like strlcpy() from libsyslog, rather than their C
+library of choice.
+
+However, this caused strlcpy.c to be built as both .o and .lo
+files, which in turn caused really bizarre build problems due
+to bad DAG dependency.
+
+This patch drops libcompat and instead marks all replacement APIs
+as weak symbols, which a C library can override.
+
+Signed-off-by: Joachim Nilsson <troglobit@gmail.com>
+
+Upstream-Status: Backport
+[https://github.com/troglobit/sysklogd/commit/84d70e63fc105e3713943ed8c0bdd4e31a698226]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ lib/pidfile.c   |  8 +++++++-
+ lib/utimensat.c | 10 ++++++++--
+ src/Makefile.am |  7 +------
+ 3 files changed, 16 insertions(+), 9 deletions(-)
+
+diff --git a/lib/pidfile.c b/lib/pidfile.c
+index 81f2315..25b1c04 100644
+--- a/lib/pidfile.c
++++ b/lib/pidfile.c
+@@ -31,6 +31,9 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
++#include <config.h>
++#ifndef HAVE_PIDFILE
++
+ #define _GNU_SOURCE		/* Needed with GLIBC to get asprintf() */
+ #include <sys/stat.h>		/* utimensat() */
+ #include <sys/time.h>		/* utimensat() on *BSD */
+@@ -54,7 +57,7 @@ const  char *__pidfile_path = RUNSTATEDIR;
+ const  char *__pidfile_name = NULL;
+ 
+ int
+-pidfile(const char *basename)
++__pidfile(const char *basename)
+ {
+ 	int save_errno;
+ 	int atexit_already;
+@@ -127,6 +130,9 @@ pidfile(const char *basename)
+ 	return (0);
+ }
+ 
++weak_alias(__pidfile, pidfile);
++#endif /* HAVE_PIDFILE */
++
+ static void
+ pidfile_cleanup(void)
+ {
+diff --git a/lib/utimensat.c b/lib/utimensat.c
+index edf7e10..b68ce0e 100644
+--- a/lib/utimensat.c
++++ b/lib/utimensat.c
+@@ -15,7 +15,8 @@
+  * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+  */
+ 
+-#include "config.h"
++#include <config.h>
++#ifndef HAVE_UTIMENSAT
+ 
+ #include <errno.h>
+ #ifdef HAVE_FCNTL_H
+@@ -23,7 +24,8 @@
+ #endif
+ #include <sys/time.h>		/* lutimes(), utimes(), utimensat() */
+ 
+-int utimensat(int dirfd, const char *pathname, const struct timespec ts[2], int flags)
++int
++__utimensat(int dirfd, const char *pathname, const struct timespec ts[2], int flags)
+ {
+ 	int ret = -1;
+ 	struct timeval tv[2];
+@@ -45,3 +47,7 @@ int utimensat(int dirfd, const char *pathname, const struct timespec ts[2], int
+ 
+ 	return ret;
+ }
++
++weak_alias(__utimensat, utimensat);
++
++#endif /* HAVE_UTIMENSAT */
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 6e2a51c..1db88d3 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -19,7 +19,6 @@
+ bin_PROGRAMS          =
+ sbin_PROGRAMS         = syslogd
+ lib_LTLIBRARIES       = libsyslog.la
+-noinst_LTLIBRARIES    = libcompat.la
+ 
+ if ENABLE_KLOGD
+ sbin_PROGRAMS        += klogd
+@@ -48,10 +47,6 @@ logger_CPPFLAGS       = $(AM_CPPFLAGS) -D_XOPEN_SOURCE=600
+ logger_LDADD          = $(LIBS) $(LIBOBJS)
+ logger_LDADD         += libsyslog.la
+ 
+-# Convenience library for libsyslog instead of linking with $(LTLIBOBJS),
+-# which would pull in pidfile() and other (strong) symbols as well.
+-libcompat_la_SOURCES  = ../lib/strlcpy.c ../lib/strlcat.c
+-
+ pkgconfigdir          = $(libdir)/pkgconfig
+ pkgincludedir         = $(includedir)/syslog
+ pkgconfig_DATA        = libsyslog.pc
+@@ -59,4 +54,4 @@ pkginclude_HEADERS    = syslog.h
+ libsyslog_la_SOURCES  = syslog.c syslog.h compat.h
+ libsyslog_la_CPPFLAGS = $(AM_CPPFLAGS) -D_XOPEN_SOURCE=600
+ libsyslog_la_LDFLAGS  = $(AM_LDFLAGS) -version-info 0:0:0
+-libsyslog_la_LIBADD   = libcompat.la
++libsyslog_la_LIBADD   = $(LTLIBOJBS)
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/sysklogd/files/0001-Fix-nasty-parallel-build-problem-reported-by-Gentoo-.patch b/meta/recipes-extended/sysklogd/files/0001-Fix-nasty-parallel-build-problem-reported-by-Gentoo-.patch
deleted file mode 100644
index bf43fc6..0000000
--- a/meta/recipes-extended/sysklogd/files/0001-Fix-nasty-parallel-build-problem-reported-by-Gentoo-.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 50c66de8a9b64d6fa71329ea7d4fe981f3b4ef23 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 26 Dec 2019 10:03:35 +0800
-Subject: [PATCH] Fix nasty parallel build problem reported by Gentoo and
- Westermo
-
-Independently of each other both the Gentoo project and Westermo found
-an issue with massively parallel builds on monster-core-machines.  At
-Westermo there are 40 core Xeon monsters that stumble when building
-sysklogd.
-
-The Gentoo bug report is here:
-
-    https://bugs.gentoo.org/701894
-
-The problem stems from strlcat.c and strlcpy.c being used for both
-the libcompat convenience library built for libsyslog and als for
-syslogd when the system does not have either of the APIs in libc,
-i.e. most Linux systems with GLIBC or musl libc.
-
-I can either rewrite the Makefile.am files to handle dependencies
-better, or we just disable parallel build like this patch. There's
-too few source files to gain anything from parallel build anyway.
-
-Signed-off-by: Joachim Nilsson <troglobit@gmail.com>
-
-Upstream-Status: Backport [https://github.com/troglobit/sysklogd/commit/9cf1f97cef04fed81c2407f7207795d7592ccb96]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- Makefile.am | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/Makefile.am b/Makefile.am
-index c4cc80f..d7a7dd5 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -46,3 +46,6 @@ release: distcheck
- # Workaround for systemd unit file duing distcheck
- DISTCHECK_CONFIGURE_FLAGS = --with-systemd=$$dc_install_base/$(systemd) --with-klogd
- 
-+# Disable parallel build in top Makefile, we might otherwise get a very
-+# # bizarre build problem with strlcpy.o in libcompat and for syslogd.
-+.NOTPARALLEL:
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index 774d23b..8618c9f 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -16,7 +16,7 @@ inherit update-rc.d update-alternatives systemd autotools
 SRC_URI = "git://github.com/troglobit/sysklogd.git;nobranch=1 \
            file://0001-Remove-__BEGIN_DECLS-__END_DECLS.patch \
            file://0002-include-sys-types.h-for-off_t.patch \
-           file://0001-Fix-nasty-parallel-build-problem-reported-by-Gentoo-.patch \
+           file://0001-Drop-libcompat-to-simplify-build-deps-and-really-fix.patch \
            file://sysklogd \
            "
 S = "${WORKDIR}/git"
-- 
2.7.4


