Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Khem Raj" <raj.khem@gmail.com>
Subject: [PATCH 6/7] ltp: Fix sys/mount.h and linux/mount.h conflict
Date: Tue, 16 Aug 2022 09:58:56 -0700
Message-Id: <20220816165857.2342796-6-raj.khem@gmail.com>
In-Reply-To: <20220816165857.2342796-1-raj.khem@gmail.com>
References: <20220816165857.2342796-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>

backport needed patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ove-duplicate-include-of-sys-mount.h.patch | 30 --------
 ...olve-conflict-in-different-header-fi.patch | 71 +++++++++++++++++++
 ...-lapi-pidfd-adding-pidfd-header-file.patch | 60 ++++++++++++++++
 meta/recipes-extended/ltp/ltp_20220527.bb     |  3 +-
 4 files changed, 133 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-Remove-duplicate-include-of-sys-mount.h.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-lapi-fsmount-resolve-conflict-in-different-header-fi.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-lapi-pidfd-adding-pidfd-header-file.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-Remove-duplicate-include-of-sys-mount.h.patch b/meta/recipes-extended/ltp/ltp/0001-Remove-duplicate-include-of-sys-mount.h.patch
deleted file mode 100644
index fc7fea02f9b..00000000000
--- a/meta/recipes-extended/ltp/ltp/0001-Remove-duplicate-include-of-sys-mount.h.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 463f3f85e326253feb35015a022ab6d1e03fe1d5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 6 Aug 2022 20:50:27 -0700
-Subject: [PATCH] Remove duplicate include of <sys/mount.h>
-
-<sys/mount.h> is already included by lapi/mount.h.
-
-This fixes build with glibc 2.36+
-
-Upstream-Status: Submitted [https://github.com/linux-test-project/ltp/pull/953]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- testcases/kernel/syscalls/statx/statx09.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/testcases/kernel/syscalls/statx/statx09.c b/testcases/kernel/syscalls/statx/statx09.c
-index aea329e086..34c5f41f87 100644
---- a/testcases/kernel/syscalls/statx/statx09.c
-+++ b/testcases/kernel/syscalls/statx/statx09.c
-@@ -18,7 +18,6 @@
-  */
- 
- #define _GNU_SOURCE
--#include <sys/mount.h>
- #include <stdlib.h>
- #include "tst_test.h"
- #include "lapi/fs.h"
--- 
-2.37.1
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-lapi-fsmount-resolve-conflict-in-different-header-fi.patch b/meta/recipes-extended/ltp/ltp/0001-lapi-fsmount-resolve-conflict-in-different-header-fi.patch
new file mode 100644
index 00000000000..cdbcf6b2888
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-lapi-fsmount-resolve-conflict-in-different-header-fi.patch
@@ -0,0 +1,71 @@
+From b857f8723f30a4b9554bf6b0ff8fa52fd07e8b60 Mon Sep 17 00:00:00 2001
+From: Li Wang <liwang@redhat.com>
+Date: Fri, 5 Aug 2022 14:34:01 +0800
+Subject: [PATCH] lapi/fsmount: resolve conflict in different header files
+
+The latest glibc added new wrappers (e.g. mount_setattr, fsopen) support
+in sys/mount.h, which partly conflicts with linux/mount.h at the same time.
+
+We need to make adjustments to header files to fix compiling error on
+different platforms.
+
+Upstream-Status: Backport [https://github.com/linux-test-project/ltp/commit/b857f8723f30a4b9554bf6b0ff8fa52fd07e8b60]
+Signed-off-by: Li Wang <liwang@redhat.com>
+Reviewed-by: Petr Vorel <pvorel@suse.cz>
+---
+ configure.ac           | 1 +
+ include/lapi/fs.h      | 6 ++++--
+ include/lapi/fsmount.h | 7 +++++--
+ 3 files changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d50ec1ea7..dbd53cab6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -113,6 +113,7 @@ AC_CHECK_FUNCS_ONCE([ \
+     mkdirat \
+     mknodat \
+     modify_ldt \
++    mount_setattr \
+     move_mount \
+     name_to_handle_at \
+     open_tree \
+diff --git a/include/lapi/fs.h b/include/lapi/fs.h
+index 27b3a183c..84a168a67 100644
+--- a/include/lapi/fs.h
++++ b/include/lapi/fs.h
+@@ -6,8 +6,10 @@
+  * Email: code@zilogic.com
+  */
+ 
+-#ifdef HAVE_LINUX_FS_H
+-# include <linux/fs.h>
++#ifndef HAVE_MOUNT_SETATTR
++# ifdef HAVE_LINUX_FS_H
++#  include <linux/fs.h>
++# endif
+ #endif
+ 
+ #include <sys/user.h>
+diff --git a/include/lapi/fsmount.h b/include/lapi/fsmount.h
+index b11e7a7bd..07eb42ffa 100644
+--- a/include/lapi/fsmount.h
++++ b/include/lapi/fsmount.h
+@@ -11,9 +11,12 @@
+ #include "config.h"
+ #include <sys/syscall.h>
+ #include <sys/types.h>
++#include <sys/mount.h>
+ 
+-#ifdef HAVE_LINUX_MOUNT_H
+-# include <linux/mount.h>
++#ifndef HAVE_FSOPEN
++# ifdef HAVE_LINUX_MOUNT_H
++#  include <linux/mount.h>
++# endif
+ #endif
+ 
+ #include "lapi/fcntl.h"
+-- 
+2.37.2
+
diff --git a/meta/recipes-extended/ltp/ltp/0001-lapi-pidfd-adding-pidfd-header-file.patch b/meta/recipes-extended/ltp/ltp/0001-lapi-pidfd-adding-pidfd-header-file.patch
new file mode 100644
index 00000000000..184c42640ae
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-lapi-pidfd-adding-pidfd-header-file.patch
@@ -0,0 +1,60 @@
+From dbc9c14c92a5acf450d07868a735ac8cd6ec5b90 Mon Sep 17 00:00:00 2001
+From: Li Wang <liwang@redhat.com>
+Date: Fri, 5 Aug 2022 14:34:00 +0800
+Subject: [PATCH] lapi/pidfd: adding pidfd header file
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The newer Glibc already provided wrapper for the series pidfd syscall,
+so let's include the header file conditionally.
+
+  # rpm -q glibc-devel
+  glibc-devel-2.35.9000-31.fc37.ppc64le
+  # rpm -ql glibc-devel | grep pidfd
+  /usr/include/sys/pidfd.h
+
+To get rid of compiling error from fedora-rawhide:
+
+  tst_safe_macros.c: In function ‘safe_pidfd_open’:
+  tst_safe_macros.c:135:16: error: implicit declaration of function ‘pidfd_open’ [-Werror=implicit-function-declaration]
+  135 |         rval = pidfd_open(pid, flags);
+      |                ^~~~~~~~~~
+
+Upstream-Status: Backport [https://github.com/linux-test-project/ltp/commit/dbc9c14c92a5acf450d07868a735ac8cd6ec5b90]
+Signed-off-by: Li Wang <liwang@redhat.com>
+Reviewed-by: Petr Vorel <pvorel@suse.cz>
+---
+ configure.ac         | 1 +
+ include/lapi/pidfd.h | 3 +++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 69b145b5f..d50ec1ea7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -71,6 +71,7 @@ AC_CHECK_HEADERS_ONCE([ \
+     sys/epoll.h \
+     sys/fanotify.h \
+     sys/inotify.h \
++    sys/pidfd.h
+     sys/prctl.h \
+     sys/shm.h \
+     sys/timerfd.h \
+diff --git a/include/lapi/pidfd.h b/include/lapi/pidfd.h
+index 244d3acaf..9ca8e5aa2 100644
+--- a/include/lapi/pidfd.h
++++ b/include/lapi/pidfd.h
+@@ -8,6 +8,9 @@
+ #define LAPI_PIDFD_H__
+ 
+ #include <fcntl.h>
++#ifdef HAVE_SYS_PIDFD_H
++# include <sys/pidfd.h>
++#endif
+ #include "config.h"
+ #include "lapi/syscalls.h"
+ 
+-- 
+2.37.2
+
diff --git a/meta/recipes-extended/ltp/ltp_20220527.bb b/meta/recipes-extended/ltp/ltp_20220527.bb
index 6d812958cdd..a547298828b 100644
--- a/meta/recipes-extended/ltp/ltp_20220527.bb
+++ b/meta/recipes-extended/ltp/ltp_20220527.bb
@@ -37,7 +37,8 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=ht
            file://0001-netstress-Restore-runtime-to-5m.patch \
            file://0001-net_stress-Fix-usage-of-variables-from-tst_net.sh.patch \
            file://0001-memcg-functional-Fix-usage-of-PAGESIZE-from-memcg_li.patch \
-           file://0001-Remove-duplicate-include-of-sys-mount.h.patch \
+           file://0001-lapi-pidfd-adding-pidfd-header-file.patch \
+           file://0001-lapi-fsmount-resolve-conflict-in-different-header-fi.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.37.2

