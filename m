Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7DF4379F11
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 01:47:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wA21lpeL019179
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Nov 2018 18:47:51 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 1 Nov 2018 18:47:50 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Nov 2018 09:53:50 +0800
Message-ID: <8bf47b537f378cb9dc204662a90682a215ddefb4.1541123540.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1541123540.git.Qi.Chen@windriver.com>
References: <cover.1541123540.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] systemd: fix CVE-2018-15687
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
X-List-Received-Date: Fri, 02 Nov 2018 01:47:53 -0000
Content-Type: text/plain

Backport patch to fix the following CVE.

CVE: CVE-2018-15687

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...sive-let-s-rework-the-recursive-logic-to-.patch | 216 +++++++++++++++++++++
 meta/recipes-core/systemd/systemd_239.bb           |   1 +
 2 files changed, 217 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-chown-recursive-let-s-rework-the-recursive-logic-to-.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-chown-recursive-let-s-rework-the-recursive-logic-to-.patch b/meta/recipes-core/systemd/systemd/0001-chown-recursive-let-s-rework-the-recursive-logic-to-.patch
new file mode 100644
index 0000000..4cecda0
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-chown-recursive-let-s-rework-the-recursive-logic-to-.patch
@@ -0,0 +1,216 @@
+From 7735278e9330c1b945862f31b3267827c9592b23 Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Fri, 19 Oct 2018 11:26:59 +0200
+Subject: [PATCH] chown-recursive: let's rework the recursive logic to use
+ O_PATH
+
+That way we can pin a specific inode and analyze it and manipulate it
+without it being swapped out beneath our hands.
+
+Fixes a vulnerability originally found by Jann Horn from Google.
+
+CVE-2018-15687
+LP: #1796692
+https://bugzilla.redhat.com/show_bug.cgi?id=1639076
+
+Upstream-Status: Backport
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/core/chown-recursive.c | 146 ++++++++++++++++++++++-----------------------
+ 1 file changed, 70 insertions(+), 76 deletions(-)
+
+diff --git a/src/core/chown-recursive.c b/src/core/chown-recursive.c
+index c479450..27c6448 100644
+--- a/src/core/chown-recursive.c
++++ b/src/core/chown-recursive.c
+@@ -1,17 +1,19 @@
+ /* SPDX-License-Identifier: LGPL-2.1+ */
+ 
+-#include <sys/types.h>
+-#include <sys/stat.h>
+ #include <fcntl.h>
++#include <sys/stat.h>
++#include <sys/types.h>
+ 
+-#include "user-util.h"
+-#include "macro.h"
+-#include "fd-util.h"
+-#include "dirent-util.h"
+ #include "chown-recursive.h"
++#include "dirent-util.h"
++#include "fd-util.h"
++#include "macro.h"
++#include "stdio-util.h"
++#include "strv.h"
++#include "user-util.h"
+ 
+-static int chown_one(int fd, const char *name, const struct stat *st, uid_t uid, gid_t gid) {
+-        int r;
++static int chown_one(int fd, const struct stat *st, uid_t uid, gid_t gid) {
++        char procfs_path[STRLEN("/proc/self/fd/") + DECIMAL_STR_MAX(int) + 1];
+ 
+         assert(fd >= 0);
+         assert(st);
+@@ -20,90 +22,82 @@ static int chown_one(int fd, const char *name, const struct stat *st, uid_t uid,
+             (!gid_is_valid(gid) || st->st_gid == gid))
+                 return 0;
+ 
+-        if (name)
+-                r = fchownat(fd, name, uid, gid, AT_SYMLINK_NOFOLLOW);
+-        else
+-                r = fchown(fd, uid, gid);
+-        if (r < 0)
+-                return -errno;
++        /* We change ownership through the /proc/self/fd/%i path, so that we have a stable reference that works with
++         * O_PATH. (Note: fchown() and fchmod() do not work with O_PATH, the kernel refuses that. */
++        xsprintf(procfs_path, "/proc/self/fd/%i", fd);
+ 
+-        /* The linux kernel alters the mode in some cases of chown(). Let's undo this. */
+-        if (name) {
+-                if (!S_ISLNK(st->st_mode))
+-                        r = fchmodat(fd, name, st->st_mode, 0);
+-                else /* There's currently no AT_SYMLINK_NOFOLLOW for fchmodat() */
+-                        r = 0;
+-        } else
+-                r = fchmod(fd, st->st_mode);
+-        if (r < 0)
++        if (chown(procfs_path, uid, gid) < 0)
+                 return -errno;
+ 
++        /* The linux kernel alters the mode in some cases of chown(). Let's undo this. We do this only for non-symlinks
++         * however. That's because for symlinks the access mode is ignored anyway and because on some kernels/file
++         * systems trying to change the access mode will succeed but has no effect while on others it actively
++         * fails. */
++        if (!S_ISLNK(st->st_mode))
++                if (chmod(procfs_path, st->st_mode & 07777) < 0)
++                        return -errno;
++
+         return 1;
+ }
+ 
+ static int chown_recursive_internal(int fd, const struct stat *st, uid_t uid, gid_t gid) {
++        _cleanup_closedir_ DIR *d = NULL;
+         bool changed = false;
++        struct dirent *de;
+         int r;
+ 
+         assert(fd >= 0);
+         assert(st);
+ 
+-        if (S_ISDIR(st->st_mode)) {
+-                _cleanup_closedir_ DIR *d = NULL;
+-                struct dirent *de;
+-
+-                d = fdopendir(fd);
+-                if (!d) {
+-                        r = -errno;
+-                        goto finish;
+-                }
+-                fd = -1;
+-
+-                FOREACH_DIRENT_ALL(de, d, r = -errno; goto finish) {
+-                        struct stat fst;
+-
+-                        if (dot_or_dot_dot(de->d_name))
+-                                continue;
+-
+-                        if (fstatat(dirfd(d), de->d_name, &fst, AT_SYMLINK_NOFOLLOW) < 0) {
+-                                r = -errno;
+-                                goto finish;
+-                        }
+-
+-                        if (S_ISDIR(fst.st_mode)) {
+-                                int subdir_fd;
+-
+-                                subdir_fd = openat(dirfd(d), de->d_name, O_RDONLY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC|O_NOFOLLOW|O_NOATIME);
+-                                if (subdir_fd < 0) {
+-                                        r = -errno;
+-                                        goto finish;
+-                                }
+-
+-                                r = chown_recursive_internal(subdir_fd, &fst, uid, gid);
+-                                if (r < 0)
+-                                        goto finish;
+-                                if (r > 0)
+-                                        changed = true;
+-                        } else {
+-                                r = chown_one(dirfd(d), de->d_name, &fst, uid, gid);
+-                                if (r < 0)
+-                                        goto finish;
+-                                if (r > 0)
+-                                        changed = true;
+-                        }
++        d = fdopendir(fd);
++        if (!d) {
++                safe_close(fd);
++                return -errno;
++        }
++
++        FOREACH_DIRENT_ALL(de, d, return -errno) {
++                _cleanup_close_ int path_fd = -1;
++                struct stat fst;
++
++                if (dot_or_dot_dot(de->d_name))
++                        continue;
++
++                /* Let's pin the child inode we want to fix now with an O_PATH fd, so that it cannot be swapped out
++                 * while we manipulate it. */
++                path_fd = openat(dirfd(d), de->d_name, O_PATH|O_CLOEXEC|O_NOFOLLOW);
++                if (path_fd < 0)
++                        return -errno;
++
++                if (fstat(path_fd, &fst) < 0)
++                        return -errno;
++
++                if (S_ISDIR(fst.st_mode)) {
++                        int subdir_fd;
++
++                        /* Convert it to a "real" (i.e. non-O_PATH) fd now */
++                        subdir_fd = fd_reopen(path_fd, O_RDONLY|O_CLOEXEC|O_NOATIME);
++                        if (subdir_fd < 0)
++                                return subdir_fd;
++
++                        r = chown_recursive_internal(subdir_fd, &fst, uid, gid); /* takes possession of subdir_fd even on failure */
++                        if (r < 0)
++                                return r;
++                        if (r > 0)
++                                changed = true;
++                } else {
++                        r = chown_one(path_fd, &fst, uid, gid);
++                        if (r < 0)
++                                return r;
++                        if (r > 0)
++                                changed = true;
+                 }
++        }
+ 
+-                r = chown_one(dirfd(d), NULL, st, uid, gid);
+-        } else
+-                r = chown_one(fd, NULL, st, uid, gid);
++        r = chown_one(dirfd(d), st, uid, gid);
+         if (r < 0)
+-                goto finish;
++                return r;
+ 
+-        r = r > 0 || changed;
+-
+-finish:
+-        safe_close(fd);
+-        return r;
++        return r > 0 || changed;
+ }
+ 
+ int path_chown_recursive(const char *path, uid_t uid, gid_t gid) {
+@@ -111,7 +105,7 @@ int path_chown_recursive(const char *path, uid_t uid, gid_t gid) {
+         struct stat st;
+         int r;
+ 
+-        fd = open(path, O_RDONLY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC|O_NOFOLLOW|O_NOATIME);
++        fd = open(path, O_RDONLY|O_DIRECTORY|O_CLOEXEC|O_NOFOLLOW|O_NOATIME);
+         if (fd < 0)
+                 return -errno;
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index 48b6c3a..47fff40 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -31,6 +31,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0022-build-sys-Detect-whether-struct-statx-is-defined-in-.patch \
            file://0023-resolvconf-fixes-for-the-compatibility-interface.patch \
            file://0001-core-when-deserializing-state-always-use-read_line-L.patch \
+           file://0001-chown-recursive-let-s-rework-the-recursive-logic-to-.patch \
            "
 
 # patches made for musl are only applied on TCLIBC is musl
-- 
1.9.1


