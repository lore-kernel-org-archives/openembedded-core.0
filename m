Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80480C677C4
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 14:28:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.34874.1749220114351193490
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 07:28:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36FD6152B
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Jun 2025 07:28:16 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A406F3F673
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Jun 2025 07:28:33 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 13/16] unfs3: upgrade to 0.11
Date: Fri,  6 Jun 2025 15:28:18 +0100
Message-ID: <20250606142822.3387675-13-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606142822.3387675-1-ross.burton@arm.com>
References: <20250606142822.3387675-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 14:28:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218154

Drop all of the patches that have been merged upstream.

The build no longer needs the flex runtime library so remove flex from
DEPENDS.

License-Update: contributor list updated.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...4_t-to-off_t-on-linux-if-not-defined.patch | 28 ------
 .../0001-attr-fix-utime-for-symlink.patch     | 88 -------------------
 ...e-window-for-writing-of-the-pid-file.patch | 68 --------------
 .../unfs3/0001-fix-building-on-macOS.patch    | 27 ------
 .../unfs3/0001-locate.c-Include-attr.h.patch  | 28 ------
 .../{unfs3_0.10.0.bb =3D> unfs3_0.11.0.bb}      | 19 ++--
 6 files changed, 7 insertions(+), 251 deletions(-)
 delete mode 100644 meta/recipes-devtools/unfs3/unfs3/0001-Alias-off64_t-=
to-off_t-on-linux-if-not-defined.patch
 delete mode 100644 meta/recipes-devtools/unfs3/unfs3/0001-attr-fix-utime=
-for-symlink.patch
 delete mode 100644 meta/recipes-devtools/unfs3/unfs3/0001-daemon.c-Fix-r=
ace-window-for-writing-of-the-pid-file.patch
 delete mode 100644 meta/recipes-devtools/unfs3/unfs3/0001-fix-building-o=
n-macOS.patch
 delete mode 100644 meta/recipes-devtools/unfs3/unfs3/0001-locate.c-Inclu=
de-attr.h.patch
 rename meta/recipes-devtools/unfs3/{unfs3_0.10.0.bb =3D> unfs3_0.11.0.bb=
} (54%)

diff --git a/meta/recipes-devtools/unfs3/unfs3/0001-Alias-off64_t-to-off_=
t-on-linux-if-not-defined.patch b/meta/recipes-devtools/unfs3/unfs3/0001-=
Alias-off64_t-to-off_t-on-linux-if-not-defined.patch
deleted file mode 100644
index 91909fa2369..00000000000
--- a/meta/recipes-devtools/unfs3/unfs3/0001-Alias-off64_t-to-off_t-on-li=
nux-if-not-defined.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 949db882e487d728c44bb68139682b38396dd275 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 14 Dec 2022 14:50:10 -0800
-Subject: [PATCH] Alias off64_t to off_t on linux if not defined
-
-Musl C library does not define off64_t and has 64-bit default off_t
-therefore define off64_t as an alias on linux as well when configure
-detects that off64_t is not provided by a linux system
-
-Upstream-Status: Submitted [https://github.com/unfs3/unfs3/pull/29]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- nfs.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/nfs.h b/nfs.h
-index aded011..7996c67 100644
---- a/nfs.h
-+++ b/nfs.h
-@@ -62,7 +62,7 @@ typedef int32_t int32;
- #endif
-=20
- #ifndef HAVE_OFF64_T
--#ifdef __APPLE__
-+#if defined(__APPLE__) || defined(__linux__)
- typedef off_t off64_t;
- #endif
- #endif
diff --git a/meta/recipes-devtools/unfs3/unfs3/0001-attr-fix-utime-for-sy=
mlink.patch b/meta/recipes-devtools/unfs3/unfs3/0001-attr-fix-utime-for-s=
ymlink.patch
deleted file mode 100644
index a0f3740d6a6..00000000000
--- a/meta/recipes-devtools/unfs3/unfs3/0001-attr-fix-utime-for-symlink.p=
atch
+++ /dev/null
@@ -1,88 +0,0 @@
-From 7e789895919d57d573ebb8faa147d1286104cd01 Mon Sep 17 00:00:00 2001
-From: Rui Wang <rui.wang@windriver.com>
-Date: Mon, 24 Apr 2023 02:57:57 -0700
-Subject: [PATCH] attr: fix utime for symlink
-
-unfs3 has an old defect that it can not change the timestamps of a
-symlink file because it only uses utime(), which will follow the
-symlink. This will not cause an error if the symlink points to an
-existent file. But under some special situation, such as installing
-a rpm package, rpm tool will create the symlink first and try to
-modify the timestamps of it, when the target file is non-existent.
-This will cause an ESTALE error. Making rpm tool ignore this error
-is a solution, but not the best one. An acceptable approach is
-Making unfs3 support lutimes(), which can modify the symlink file
-itself. Considering not every system support this function, so a
-function checking is necessary.
-
-Upstream-Status: Submitted [https://github.com/unfs3/unfs3/pull/35]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- attr.c         | 15 +++++++++++----
- backend_unix.h |  2 ++
- configure.ac   |  1 +
- 3 files changed, 14 insertions(+), 4 deletions(-)
-
-diff --git a/attr.c b/attr.c
-index 0ce9375..930ce6e 100644
---- a/attr.c
-+++ b/attr.c
-@@ -285,7 +285,7 @@ post_op_attr get_post_cached(struct svc_req * req)
- static nfsstat3 set_time(const char *path, backend_statstruct buf, satt=
r3 new)
- {
-     time_t new_atime, new_mtime;
--    struct utimbuf utim;
-+    struct timeval stamps[2];
-     int res;
-=20
-     /* set atime and mtime */
-@@ -307,10 +307,17 @@ static nfsstat3 set_time(const char *path, backend=
_statstruct buf, sattr3 new)
- 	else			       /* DONT_CHANGE */
- 	    new_mtime =3D buf.st_mtime;
-=20
--	utim.actime =3D new_atime;
--	utim.modtime =3D new_mtime;
-+	stamps[0].tv_sec =3D new_atime;
-+	stamps[0].tv_usec =3D 0;
-+	stamps[1].tv_sec =3D new_mtime;
-+	stamps[1].tv_usec =3D 0;
-+
-+#if HAVE_LUTIMES
-+	res =3D backend_lutimes(path, stamps);
-+#else
-+	res =3D backend_utimes(path, stamps);
-+#endif
-=20
--	res =3D backend_utime(path, &utim);
- 	if (res =3D=3D -1)
- 	    return setattr_err();
-     }
-diff --git a/backend_unix.h b/backend_unix.h
-index 4db72ae..9cce9ab 100644
---- a/backend_unix.h
-+++ b/backend_unix.h
-@@ -61,6 +61,8 @@
- #define backend_symlink symlink
- #define backend_truncate truncate
- #define backend_utime utime
-+#define backend_utimes utimes
-+#define backend_lutimes lutimes
- #define backend_statstruct struct stat
- #define backend_dirstream DIR
- #define backend_statvfsstruct struct statvfs
-diff --git a/configure.ac b/configure.ac
-index d46c905..c21afe3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -32,6 +32,7 @@ AC_CHECK_FUNCS(setresuid setresgid)
- AC_CHECK_FUNCS(vsyslog)
- AC_CHECK_FUNCS(lchown)
- AC_CHECK_FUNCS(setgroups)
-+AC_CHECK_FUNCS(lutimes)
- UNFS3_COMPILE_WARNINGS
-=20
- PKG_CHECK_MODULES([TIRPC], [libtirpc])
---=20
-2.40.0
-
diff --git a/meta/recipes-devtools/unfs3/unfs3/0001-daemon.c-Fix-race-win=
dow-for-writing-of-the-pid-file.patch b/meta/recipes-devtools/unfs3/unfs3=
/0001-daemon.c-Fix-race-window-for-writing-of-the-pid-file.patch
deleted file mode 100644
index 20bbee90a08..00000000000
--- a/meta/recipes-devtools/unfs3/unfs3/0001-daemon.c-Fix-race-window-for=
-writing-of-the-pid-file.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 212a947e776e7a25c1f2259615f461179bcb3663 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Wed, 23 Nov 2022 21:38:38 +0100
-Subject: [PATCH] daemon.c: Fix race window for writing of the pid file
-
-The parent process should write the pid file such that the pid file
-will can be checked immediately following exit of the fork from the
-parent.
-
-This allows external monitoring applications to watch the daemon
-without having to add sleep calls to wait for the pid file be written
-on a busy system.
-
-Upstream-Status: Submitted [https://github.com/unfs3/unfs3/pull/28]
-Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- daemon.c | 12 +++++++++---
- 1 file changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/daemon.c b/daemon.c
-index ff53b7a..13b06a4 100644
---- a/daemon.c
-+++ b/daemon.c
-@@ -166,7 +166,7 @@ int get_socket_type(struct svc_req *rqstp)
- /*
-  * write current pid to a file
-  */
--static void create_pid_file(void)
-+static void create_pid_file(int pid)
- {
-     char buf[16];
-     int fd, res, len;
-@@ -188,7 +188,7 @@ static void create_pid_file(void)
-     }
- #endif
-=20
--    sprintf(buf, "%i\n", backend_getpid());
-+    sprintf(buf, "%i\n", pid);
-     len =3D strlen(buf);
-=20
-     res =3D backend_pwrite(fd, buf, len, 0);
-@@ -1122,6 +1122,10 @@ int main(int argc, char **argv)
- 	    fprintf(stderr, "could not fork into background\n");
- 	    daemon_exit(0);
- 	}
-+	if (pid)
-+	    create_pid_file(pid);
-+    } else {
-+	create_pid_file(backend_getpid());
-     }
- #endif				       /* WIN32 */
-=20
-@@ -1161,8 +1165,10 @@ int main(int argc, char **argv)
- 	/* no umask to not screw up create modes */
- 	umask(0);
-=20
-+#ifdef WIN32
- 	/* create pid file if wanted */
--	create_pid_file();
-+	create_pid_file(backend_getpid());
-+#endif
-=20
- 	/* initialize internal stuff */
- 	fh_cache_init();
---=20
-2.30.2
-
diff --git a/meta/recipes-devtools/unfs3/unfs3/0001-fix-building-on-macOS=
.patch b/meta/recipes-devtools/unfs3/unfs3/0001-fix-building-on-macOS.pat=
ch
deleted file mode 100644
index f18ffd37110..00000000000
--- a/meta/recipes-devtools/unfs3/unfs3/0001-fix-building-on-macOS.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 989b87ae46b3183a742031373fbb3e912ab9b666 Mon Sep 17 00:00:00 2001
-From: Andrey Filipenkov <decapitator@ukr.net>
-Date: Wed, 2 Nov 2022 13:38:40 +0300
-Subject: [PATCH] fix building on macOS
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Backport [https://github.com/unfs3/unfs3/commit/989b87a=
e46b3183a742031373fbb3e912ab9b666]
----
- attr.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/attr.c b/attr.c
-index 6253e84..0ce9375 100644
---- a/attr.c
-+++ b/attr.c
-@@ -18,6 +18,8 @@
- #include <utime.h>
- #include <errno.h>
- #include <dirent.h>
-+#include <stdlib.h>
-+#include <string.h>
-=20
- #include "backend.h"
- #include "nfs.h"
---=20
-2.39.1
-
diff --git a/meta/recipes-devtools/unfs3/unfs3/0001-locate.c-Include-attr=
.h.patch b/meta/recipes-devtools/unfs3/unfs3/0001-locate.c-Include-attr.h=
.patch
deleted file mode 100644
index 076e08fadc7..00000000000
--- a/meta/recipes-devtools/unfs3/unfs3/0001-locate.c-Include-attr.h.patc=
h
+++ /dev/null
@@ -1,28 +0,0 @@
-From 63e0785bb379a8f2c41f34f5cd938ca38555e605 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 13 Jan 2023 23:41:01 -0800
-Subject: [PATCH] locate.c: Include attr.h
-
-Its needed for fix_dir_times() API declarations
-
-Upstream-Status: Submitted [https://github.com/unfs3/unfs3/pull/32]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- locate.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/locate.c b/locate.c
-index 6bbe71f..84e0fe5 100644
---- a/locate.c
-+++ b/locate.c
-@@ -27,6 +27,7 @@
- #include "nfs.h"
- #include "fh.h"
- #include "daemon.h"
-+#include "attr.h"
-=20
- /*
-  * these are the brute-force file searching routines that are used
---=20
-2.39.0
-
diff --git a/meta/recipes-devtools/unfs3/unfs3_0.10.0.bb b/meta/recipes-d=
evtools/unfs3/unfs3_0.11.0.bb
similarity index 54%
rename from meta/recipes-devtools/unfs3/unfs3_0.10.0.bb
rename to meta/recipes-devtools/unfs3/unfs3_0.11.0.bb
index d5c2a03371c..da5ca45277d 100644
--- a/meta/recipes-devtools/unfs3/unfs3_0.10.0.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_0.11.0.bb
@@ -5,22 +5,17 @@ are used by NFS clients for accessing files on the serv=
er."
 HOMEPAGE =3D "https://github.com/unfs3/unfs3"
 SECTION =3D "console/network"
 LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9475885294e17c0cc0067820d0427=
92e"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc1c621cd2786a3a1344a60a0d608c=
910"
=20
-DEPENDS =3D "flex-native bison-native flex libtirpc"
+DEPENDS =3D "bison-native flex-native libtirpc"
=20
 S =3D "${WORKDIR}/git"
-SRC_URI =3D "git://github.com/unfs3/unfs3.git;protocol=3Dhttps;branch=3D=
master \
-           file://0001-daemon.c-Fix-race-window-for-writing-of-the-pid-f=
ile.patch \
-           file://0001-Alias-off64_t-to-off_t-on-linux-if-not-defined.pa=
tch \
-           file://0001-locate.c-Include-attr.h.patch \
-           file://0001-fix-building-on-macOS.patch \
-           file://0001-attr-fix-utime-for-symlink.patch \
-           "
-SRCREV =3D "c8f2d2cd4529955419bad0e163f88d47ff176b8d"
+SRC_URI =3D "git://github.com/unfs3/unfs3.git;protocol=3Dhttps;branch=3D=
master;tag=3D${BP}"
+SRCREV =3D "ec1660ba33c80d5c67131e163e68834c1a10e243"
 UPSTREAM_CHECK_GITTAGREGEX =3D "unfs3\-(?P<pver>\d+(\.\d+)+)"
=20
-BBCLASSEXTEND =3D "native nativesdk"
-
 inherit autotools pkgconfig
+
 EXTRA_OECONF:append:class-native =3D " --sbindir=3D${bindir}"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


