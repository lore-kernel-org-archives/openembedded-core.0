Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id 9D59D619C6
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Mar 2020 13:14:30 +0000 (UTC)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr
	[193.250.66.88]) by koncepto.io (Postfix) with ESMTPSA id C2A1560156;
	Sun,  1 Mar 2020 14:14:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1583068470;
	bh=BX1QBMMviuRy/J1RjHfwiVXGcqwllLJpX06P8lpp9mQ=;
	h=From:To:Cc:Subject:Date:From;
	b=WmDH2PfDsK1H6YGoxMHjOFjAdTTPp2/3BOWKRLAnkPRA318GFKy+OJ1b4VLDyP4m/
	DCMMczKgx3JamnFCRStt1JBg5qwJ39hOALA/ik9PxlkA78T6AoJ4py26NgD+1ZVcZx
	gglDon9RnaYa1NF55PLu6SG8IWCW0wLSEhQAHqmCDtqzk4vxlwWZ+YxYhKdOuG0QJ1
	uofR3yc2KOtgYRAKamvqkzNxU5iEnJ2HyTKkSCfs70HqwXgoB+8EptOSujd9GaBKpg
	Hjan87GjBJVPuwhCW0qx1nyjx+zTuUS/AJTe9EGbFQQwyUrd7PC3tIWIAjLHQSwStv
	kXjfjn/6a5IyQ==
From: Pierre-Jean Texier <pjtexier@koncepto.io>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Mar 2020 14:14:28 +0100
Message-Id: <1583068468-12550-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] sysklogd: upgrade 2.0.3 -> 2.1.1
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
X-List-Received-Date: Sun, 01 Mar 2020 13:14:31 -0000

License-Update: Relicensed under the BSD-3-Clause license since v2.1

Remove patches applied upstream.

Since version v2.1, klogd was removed from the sysklogd project since
syslogd performs logging of kernel messages.

So, this patch remove klogd support.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 ...pat-to-simplify-build-deps-and-really-fix.patch | 127 ---------------------
 .../0001-Remove-__BEGIN_DECLS-__END_DECLS.patch    |  44 -------
 .../files/0002-include-sys-types.h-for-off_t.patch |  29 -----
 meta/recipes-extended/sysklogd/files/sysklogd      |  22 ----
 meta/recipes-extended/sysklogd/sysklogd.inc        |  16 +--
 meta/recipes-extended/sysklogd/sysklogd_2.0.3.bb   |   3 -
 meta/recipes-extended/sysklogd/sysklogd_2.1.1.bb   |   3 +
 7 files changed, 8 insertions(+), 236 deletions(-)
 delete mode 100644 meta/recipes-extended/sysklogd/files/0001-Drop-libcompat-to-simplify-build-deps-and-really-fix.patch
 delete mode 100644 meta/recipes-extended/sysklogd/files/0001-Remove-__BEGIN_DECLS-__END_DECLS.patch
 delete mode 100644 meta/recipes-extended/sysklogd/files/0002-include-sys-types.h-for-off_t.patch
 delete mode 100644 meta/recipes-extended/sysklogd/sysklogd_2.0.3.bb
 create mode 100644 meta/recipes-extended/sysklogd/sysklogd_2.1.1.bb

diff --git a/meta/recipes-extended/sysklogd/files/0001-Drop-libcompat-to-simplify-build-deps-and-really-fix.patch b/meta/recipes-extended/sysklogd/files/0001-Drop-libcompat-to-simplify-build-deps-and-really-fix.patch
deleted file mode 100644
index 9ba7ecc..0000000
--- a/meta/recipes-extended/sysklogd/files/0001-Drop-libcompat-to-simplify-build-deps-and-really-fix.patch
+++ /dev/null
@@ -1,127 +0,0 @@
-From 84d70e63fc105e3713943ed8c0bdd4e31a698226 Mon Sep 17
-00:00:00 2001 From: Joachim Nilsson <troglobit@gmail.com> Date: Thu, 16 Jan
-2020 22:16:51 +0100 Subject: [PATCH] Drop libcompat to simplify build deps
-and really fix
-
-The original idea with libcompat was to keep as few objects as
-possible for linking with libsyslog.  That in turn to prevent
-a user of libsyslog from suddenly also getting strong binding
-to symbols like strlcpy() from libsyslog, rather than their C
-library of choice.
-
-However, this caused strlcpy.c to be built as both .o and .lo
-files, which in turn caused really bizarre build problems due
-to bad DAG dependency.
-
-This patch drops libcompat and instead marks all replacement APIs
-as weak symbols, which a C library can override.
-
-Signed-off-by: Joachim Nilsson <troglobit@gmail.com>
-
-Upstream-Status: Backport
-[https://github.com/troglobit/sysklogd/commit/84d70e63fc105e3713943ed8c0bdd4e31a698226]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- lib/pidfile.c   |  8 +++++++-
- lib/utimensat.c | 10 ++++++++--
- src/Makefile.am |  7 +------
- 3 files changed, 16 insertions(+), 9 deletions(-)
-
-diff --git a/lib/pidfile.c b/lib/pidfile.c
-index 81f2315..25b1c04 100644
---- a/lib/pidfile.c
-+++ b/lib/pidfile.c
-@@ -31,6 +31,9 @@
-  * POSSIBILITY OF SUCH DAMAGE.
-  */
- 
-+#include <config.h>
-+#ifndef HAVE_PIDFILE
-+
- #define _GNU_SOURCE		/* Needed with GLIBC to get asprintf() */
- #include <sys/stat.h>		/* utimensat() */
- #include <sys/time.h>		/* utimensat() on *BSD */
-@@ -54,7 +57,7 @@ const  char *__pidfile_path = RUNSTATEDIR;
- const  char *__pidfile_name = NULL;
- 
- int
--pidfile(const char *basename)
-+__pidfile(const char *basename)
- {
- 	int save_errno;
- 	int atexit_already;
-@@ -127,6 +130,9 @@ pidfile(const char *basename)
- 	return (0);
- }
- 
-+weak_alias(__pidfile, pidfile);
-+#endif /* HAVE_PIDFILE */
-+
- static void
- pidfile_cleanup(void)
- {
-diff --git a/lib/utimensat.c b/lib/utimensat.c
-index edf7e10..b68ce0e 100644
---- a/lib/utimensat.c
-+++ b/lib/utimensat.c
-@@ -15,7 +15,8 @@
-  * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
-  */
- 
--#include "config.h"
-+#include <config.h>
-+#ifndef HAVE_UTIMENSAT
- 
- #include <errno.h>
- #ifdef HAVE_FCNTL_H
-@@ -23,7 +24,8 @@
- #endif
- #include <sys/time.h>		/* lutimes(), utimes(), utimensat() */
- 
--int utimensat(int dirfd, const char *pathname, const struct timespec ts[2], int flags)
-+int
-+__utimensat(int dirfd, const char *pathname, const struct timespec ts[2], int flags)
- {
- 	int ret = -1;
- 	struct timeval tv[2];
-@@ -45,3 +47,7 @@ int utimensat(int dirfd, const char *pathname, const struct timespec ts[2], int
- 
- 	return ret;
- }
-+
-+weak_alias(__utimensat, utimensat);
-+
-+#endif /* HAVE_UTIMENSAT */
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 6e2a51c..1db88d3 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -19,7 +19,6 @@
- bin_PROGRAMS          =
- sbin_PROGRAMS         = syslogd
- lib_LTLIBRARIES       = libsyslog.la
--noinst_LTLIBRARIES    = libcompat.la
- 
- if ENABLE_KLOGD
- sbin_PROGRAMS        += klogd
-@@ -48,10 +47,6 @@ logger_CPPFLAGS       = $(AM_CPPFLAGS) -D_XOPEN_SOURCE=600
- logger_LDADD          = $(LIBS) $(LIBOBJS)
- logger_LDADD         += libsyslog.la
- 
--# Convenience library for libsyslog instead of linking with $(LTLIBOBJS),
--# which would pull in pidfile() and other (strong) symbols as well.
--libcompat_la_SOURCES  = ../lib/strlcpy.c ../lib/strlcat.c
--
- pkgconfigdir          = $(libdir)/pkgconfig
- pkgincludedir         = $(includedir)/syslog
- pkgconfig_DATA        = libsyslog.pc
-@@ -59,4 +54,4 @@ pkginclude_HEADERS    = syslog.h
- libsyslog_la_SOURCES  = syslog.c syslog.h compat.h
- libsyslog_la_CPPFLAGS = $(AM_CPPFLAGS) -D_XOPEN_SOURCE=600
- libsyslog_la_LDFLAGS  = $(AM_LDFLAGS) -version-info 0:0:0
--libsyslog_la_LIBADD   = libcompat.la
-+libsyslog_la_LIBADD   = $(LTLIBOJBS)
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/sysklogd/files/0001-Remove-__BEGIN_DECLS-__END_DECLS.patch b/meta/recipes-extended/sysklogd/files/0001-Remove-__BEGIN_DECLS-__END_DECLS.patch
deleted file mode 100644
index b2d45c0..0000000
--- a/meta/recipes-extended/sysklogd/files/0001-Remove-__BEGIN_DECLS-__END_DECLS.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 8c7995ac8da99eed55bf5410c558b1f0a74998d0 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 7 Dec 2019 10:27:28 -0800
-Subject: [PATCH 1/2] Remove __BEGIN_DECLS/__END_DECLS
-
-The __BEGIN_DECLS and __END_DECLS are internal identifiers in glibc and
-are not defined in any standard. Using them fails build on musl
-libc, its better to avoid them
-
-Upstream-Status: Submitted [https://github.com/troglobit/sysklogd/pull/10]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/syslog.h | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/src/syslog.h b/src/syslog.h
-index 4fb7627..120a18f 100644
---- a/src/syslog.h
-+++ b/src/syslog.h
-@@ -221,7 +221,9 @@ struct syslog_data {
-     .log_mask = 0xff, \
- }
- 
--__BEGIN_DECLS
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
- void	openlog    (const char *, int, int);
- void	closelog   (void);
- 
-@@ -245,7 +247,9 @@ void	syslogp_r  (int, struct syslog_data *, const char *, const char *,
- 		    const char *, ...);
- void	vsyslogp_r (int, struct syslog_data *, const char *, const char *,
- 		    const char *, va_list);
--__END_DECLS
-+#ifdef __cplusplus
-+}
-+#endif
- 
- #else /* !__KERNEL__ */
- 
--- 
-2.24.0
-
diff --git a/meta/recipes-extended/sysklogd/files/0002-include-sys-types.h-for-off_t.patch b/meta/recipes-extended/sysklogd/files/0002-include-sys-types.h-for-off_t.patch
deleted file mode 100644
index 799a7a4..0000000
--- a/meta/recipes-extended/sysklogd/files/0002-include-sys-types.h-for-off_t.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 10cff4ba2d09b30f8f1967f910e8ab08447a8add Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 7 Dec 2019 10:31:04 -0800
-Subject: [PATCH 2/2] include sys/types.h for off_t
-
-Fixes
-error: unknown type name 'off_t'
-
-Upstream-Status: Submitted [https://github.com/troglobit/sysklogd/pull/10]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/compat.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/compat.h b/src/compat.h
-index a867636..1ef1bf0 100644
---- a/src/compat.h
-+++ b/src/compat.h
-@@ -34,6 +34,7 @@
- #include <pthread.h>
- #include <stdlib.h>
- #include <string.h>
-+#include <sys/types.h>
- 
- /*
-  * The following macro is used to remove const cast-away warnings
--- 
-2.24.0
-
diff --git a/meta/recipes-extended/sysklogd/files/sysklogd b/meta/recipes-extended/sysklogd/files/sysklogd
index 4a4ca8a..2a356a6 100755
--- a/meta/recipes-extended/sysklogd/files/sysklogd
+++ b/meta/recipes-extended/sysklogd/files/sysklogd
@@ -18,9 +18,7 @@
 PATH=/bin:/usr/bin:/sbin:/usr/sbin
 
 pidfile_syslogd=/var/run/syslogd.pid
-pidfile_klogd=/var/run/klogd.pid
 binpath_syslogd=/usr/sbin/syslogd
-binpath_klogd=/usr/sbin/klogd
 
 test -x $binpath || exit 0
 
@@ -112,28 +110,16 @@ case "$1" in
     create_xconsole
     start-stop-daemon --start --quiet --pidfile $pidfile_syslogd --name syslogd --startas $binpath_syslogd -- $SYSLOGD
     log_end_msg $?
-    log_begin_msg "Starting kernel log daemon..."
-    start-stop-daemon --start --quiet --pidfile $pidfile_klogd --name klogd --startas $binpath_klogd -- $KLOGD
-    log_end_msg $?
     ;;
   stop)
     log_begin_msg "Stopping system log daemon..."
     start-stop-daemon --stop --quiet --pidfile $pidfile_syslogd --name syslogd
     log_end_msg $?
-    log_begin_msg "Stopping kernel log daemon..."
-    start-stop-daemon --stop --quiet --retry 3 --exec $binpath_klogd --pidfile $pidfile_klogd
-    log_end_msg $?
     ;;
   reload|force-reload)
     log_begin_msg "Reloading system log daemon..."
     start-stop-daemon --stop --quiet --signal 1 --pidfile $pidfile_syslogd --name syslogd
     log_end_msg $?
-    log_begin_msg "Reloading kernel log daemon..."
-    pid=`cat $pidfile_klogd 2> /dev/null`
-    start-stop-daemon --stop --quiet --retry 3 --exec $binpath_klogd --pidfile $pidfile_klogd
-    waitpid $pid
-    start-stop-daemon --start --quiet --pidfile $pidfile_klogd --name klogd --startas $binpath_klogd -- $KLOGD
-    log_end_msg $?
     ;;
   restart)
     log_begin_msg "Restarting system log daemon..."
@@ -142,12 +128,6 @@ case "$1" in
     waitpid $pid
     start-stop-daemon --start --quiet --pidfile $pidfile_syslogd --name syslogd --startas $binpath_syslogd -- $SYSLOGD
     log_end_msg $?
-    log_begin_msg "Reloading kernel log daemon..."
-    pid=`cat $pidfile_klogd 2> /dev/null`
-    start-stop-daemon --stop --quiet --retry 3 --exec $binpath_klogd --pidfile $pidfile_klogd
-    waitpid $pid
-    start-stop-daemon --start --quiet --pidfile $pidfile_klogd --name klogd --startas $binpath_klogd -- $KLOGD
-    log_end_msg $?
     ;;
   reload-or-restart)
     if running
@@ -160,8 +140,6 @@ case "$1" in
   status)
     status syslogd
     RETVAL=$?
-    status klogd
-    rval=$?
     [ $RETVAL -eq 0 ] && exit $rval
     exit $RETVAL
     ;;
diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index 8618c9f..2e3d983 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -1,27 +1,21 @@
 SUMMARY = "System Log Daemons"
-DESCRIPTION = "The sysklogd package implements two system log daemons: syslogd, klogd"
+DESCRIPTION = "The sysklogd package implements system log daemons: syslogd"
 HOMEPAGE = "http://www.infodrom.org/projects/sysklogd/"
 SECTION = "base"
 
-LICENSE = "GPLv2+ & BSD"
-LICENSE_syslogd = "BSD"
-LICENSE_klogd = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5b4be4b2549338526758ef479c040943 \
                     file://src/syslogd.c;beginline=2;endline=15;md5=a880fecbc04503f071c494a9c0dd4f97 \
-                    file://src/klogd.c;beginline=2;endline=19;md5=4f5591d04cccbeb0352758ed4a9d7213 \
                    "
 
 inherit update-rc.d update-alternatives systemd autotools
 
 SRC_URI = "git://github.com/troglobit/sysklogd.git;nobranch=1 \
-           file://0001-Remove-__BEGIN_DECLS-__END_DECLS.patch \
-           file://0002-include-sys-types.h-for-off_t.patch \
-           file://0001-Drop-libcompat-to-simplify-build-deps-and-really-fix.patch \
            file://sysklogd \
            "
 S = "${WORKDIR}/git"
 
-EXTRA_OECONF = "--with-systemd=${systemd_system_unitdir} --with-klogd --without-logger"
+EXTRA_OECONF = "--with-systemd=${systemd_system_unitdir} --without-logger"
 
 do_install_append () {
        install -d ${D}${sysconfdir}
@@ -31,7 +25,7 @@ do_install_append () {
 }
 
 SYSTEMD_PACKAGES = "${PN}"
-SYSTEMD_SERVICE_${PN} = "syslogd.service klogd.service"
+SYSTEMD_SERVICE_${PN} = "syslogd.service"
 SYSTEMD_AUTO_ENABLE = "enable"
 
 INITSCRIPT_NAME = "syslog"
diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.0.3.bb b/meta/recipes-extended/sysklogd/sysklogd_2.0.3.bb
deleted file mode 100644
index 21f750f..0000000
--- a/meta/recipes-extended/sysklogd/sysklogd_2.0.3.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require sysklogd.inc
-
-SRCREV = "ad686ca86d977f9eac4cd0a0d0e9a5964a4621d3"
diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.1.1.bb b/meta/recipes-extended/sysklogd/sysklogd_2.1.1.bb
new file mode 100644
index 0000000..eb6b4ef
--- /dev/null
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.1.1.bb
@@ -0,0 +1,3 @@
+require sysklogd.inc
+
+SRCREV = "24dafe9a27ac959ebeb89acd3ebd3d62cca4b755"
-- 
2.7.4


