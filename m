Return-Path: <george.mccollister@gmail.com>
Received: from mail-yw1-f65.google.com (mail-yw1-f65.google.com
	[209.85.161.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9BD407CAC5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 16:38:15 +0000 (UTC)
Received: by mail-yw1-f65.google.com with SMTP id n12so3867302ywn.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 08:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=e2NU6lgigluXopIqZWFeXpGZgu7jGAv4FBBlAKV1eS0=;
	b=pHJY+2VstSMuItcfZkFWTtRqMfJpGP3Jp/hDoYvWnBF5hwyc3CwF0ksey3XST18EyD
	dOmF1bpr9YyJa4E4gNXsvXgegb4YOuIckAUxANPA2PhlDVJKr9DT30aOK4zdpCbOa5ue
	lQ9lRPE5DgQ4wf+zce7sLV3Gi6Ji86lP+atr71Y2kx1fSNphOYic9z7/OIIu6aBF/os2
	tfdVc6DAVGo+q6z2iwvTRYdTkVESsYMXSXxgXBtNXeiNeiksOpI3AkOYCot+xdW8vtcj
	2okA3kDJAqKVi/RCEHzY06fs6Bp7xNA3Od1nYu3MxJ+sGCplsiSvacCgJVbvqhxhZgbg
	sknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=e2NU6lgigluXopIqZWFeXpGZgu7jGAv4FBBlAKV1eS0=;
	b=cAjmt3oSLE/QOCr8NpbxtpJgn3ni7T/mWgd5SZyheXM5YlmGsklTePdwpF8kGXbNvS
	D7w3yqPQPpu0nzXicIiOQUI5TOToc8yJrzLGQWuz3tKSX0cqIFHkcGMCJg/yLZDxjGkK
	bG3Ecs8e0V/JjuCQEK4PMfSmwHrmqJofpF3P5rwmAGf7xY6y9YOQxNVcZTAGD9BrEAZl
	ow+xkZOt1IgSY/HBmbynlGDjt/mwsy13nt1ddTNjQfHqeEyl9kOIULJxDgPTJDsvoPxf
	CM9myAGsIakGV2WsqKpNJLEABeLVTX71t03nQpeCC6GSZoKJH2Iaheef9JgSiv1z7GAI
	T/UA==
X-Gm-Message-State: AHQUAubCQGwrfKj84K14d0aFNfWoMRHST2HdfQnxXgD0WBSgX1YTVes0
	vAeog4+jG56rXFGYITFNZ946dk8=
X-Google-Smtp-Source: AHgI3Ib2ll9K6E2vgMD+W0SEFDi0DN2LtqHf3vdYtoiBXJXP28NtYUoqco0r8xvxEH/jcyrbjAFqxA==
X-Received: by 2002:a81:9854:: with SMTP id p81mr14779693ywg.130.1551112694810;
	Mon, 25 Feb 2019 08:38:14 -0800 (PST)
Received: from threadripper.novatech-llc.local ([216.21.169.52])
	by smtp.gmail.com with ESMTPSA id
	z23sm6293654ywj.36.2019.02.25.08.38.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Feb 2019 08:38:13 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Feb 2019 10:37:12 -0600
Message-Id: <6bb5a0025dca7ad80502f585465da16c228fc8fc.1551111341.git.george.mccollister@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1551111341.git.george.mccollister@gmail.com>
References: <cover.1551111341.git.george.mccollister@gmail.com>
Subject: [sumo][PATCH 7/8] systemd: fix CVE-2018-6954
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
X-List-Received-Date: Mon, 25 Feb 2019 16:38:16 -0000

Apply patches to fix CVE-2018-6954

NVD description from https://nvd.nist.gov/vuln/detail/CVE-2018-6954

systemd-tmpfiles in systemd through 237 mishandles symlinks present in
non-terminal path components, which allows local users to obtain
ownership of arbitrary files via vectors involving creation of a
directory and a file under that directory, and later replacing that
directory with a symlink. This occurs even if the fs.protected_symlinks
sysctl is turned on.

Patches from systemd_237-3ubuntu10.13.debian.

These patches shouldn't be required on newer OE releases since they use
systemd v239 or higher.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 ...n-t-resolve-pathnames-when-traversing-rec.patch |  643 +++++++
 .../systemd/systemd/0002-Make-tmpfiles-safe.patch  | 1828 ++++++++++++++++++++
 meta/recipes-core/systemd/systemd_237.bb           |    2 +
 3 files changed, 2473 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-tmpfiles-don-t-resolve-pathnames-when-traversing-rec.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0002-Make-tmpfiles-safe.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-tmpfiles-don-t-resolve-pathnames-when-traversing-rec.patch b/meta/recipes-core/systemd/systemd/0001-tmpfiles-don-t-resolve-pathnames-when-traversing-rec.patch
new file mode 100644
index 0000000000..108e4ad8b8
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-tmpfiles-don-t-resolve-pathnames-when-traversing-rec.patch
@@ -0,0 +1,643 @@
+From 33dc9a280f952f503e5493ee29f6815bef29d551 Mon Sep 17 00:00:00 2001
+From: Franck Bui <fbui@suse.com>
+Date: Fri, 2 Mar 2018 17:19:32 +0100
+Subject: [PATCH] tmpfiles: don't resolve pathnames when traversing recursively
+ through directory trees
+
+Otherwise we can be fooled if one path component is replaced underneath us.
+
+The patch achieves that by always operating at file descriptor level (by using
+*at() helpers) and by making sure we do not any path resolution when traversing
+direcotry trees.
+
+However this is not always possible, for instance when listing the content of a
+directory or some operations don't provide the *at() helpers or others (such as
+fchmodat()) don't have the AT_EMPTY_PATH flag. In such cases we operate on
+/proc/self/fd/%i pseudo-symlink instead, which works the same for all kinds of
+objects and requires no checking of type beforehand.
+
+Also O_PATH flag is used when opening file objects in order to prevent
+undesired behaviors: device nodes from reacting, automounts from
+triggering, etc...
+
+Fixes: CVE-2018-6954
+
+Origin: upstream, https://github.com/systemd/systemd/commit/936f6bdb803c432578e2cdcc5f93f3bfff93aff0
+Bug: https://github.com/systemd/systemd/issues/7986
+
+Patch from:
+systemd_237-3ubuntu10.13.debian CVE-2018-6954.patch
+
+https://usn.ubuntu.com/3816-1/ states that CVE-2018-6954 doesn't
+affect Ubuntu 18.10 which uses the same version of systemd as thud
+(239).
+
+CVE: CVE-2018-6954
+Upstream-Status: Backport
+
+Signed-off-by: George McCollister <george.mccollister@gmail.com>
+---
+ src/tmpfiles/tmpfiles.c | 363 +++++++++++++++++++++++++++++++-----------------
+ 1 file changed, 239 insertions(+), 124 deletions(-)
+
+diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
+index 88cc543f09..613d418eb3 100644
+--- a/src/tmpfiles/tmpfiles.c
++++ b/src/tmpfiles/tmpfiles.c
+@@ -792,94 +792,105 @@ static bool hardlink_vulnerable(struct stat *st) {
+         return !S_ISDIR(st->st_mode) && st->st_nlink > 1 && dangerous_hardlinks();
+ }
+ 
+-static int path_set_perms(Item *i, const char *path) {
+-        char fn[STRLEN("/proc/self/fd/") + DECIMAL_STR_MAX(int)];
+-        _cleanup_close_ int fd = -1;
+-        struct stat st;
++static int fd_set_perms(Item *i, int fd, const struct stat *st) {
++        _cleanup_free_ char *path = NULL;
++        int r;
+ 
+         assert(i);
+-        assert(path);
+-
+-        if (!i->mode_set && !i->uid_set && !i->gid_set)
+-                goto shortcut;
+-
+-        /* We open the file with O_PATH here, to make the operation
+-         * somewhat atomic. Also there's unfortunately no fchmodat()
+-         * with AT_SYMLINK_NOFOLLOW, hence we emulate it here via
+-         * O_PATH. */
+-
+-        fd = open(path, O_NOFOLLOW|O_CLOEXEC|O_PATH);
+-        if (fd < 0) {
+-                int level = LOG_ERR, r = -errno;
++        assert(fd);
+ 
+-                /* Option "e" operates only on existing objects. Do not
+-                 * print errors about non-existent files or directories */
+-                if (i->type == EMPTY_DIRECTORY && errno == ENOENT) {
+-                        level = LOG_DEBUG;
+-                        r = 0;
+-                }
+-
+-                log_full_errno(level, errno, "Adjusting owner and mode for %s failed: %m", path);
++        r = fd_get_path(fd, &path);
++        if (r < 0)
+                 return r;
+-        }
+ 
+-        if (fstatat(fd, "", &st, AT_EMPTY_PATH) < 0)
+-                return log_error_errno(errno, "Failed to fstat() file %s: %m", path);
++        if (!i->mode_set && !i->uid_set && !i->gid_set)
++                goto shortcut;
+ 
+-        if (hardlink_vulnerable(&st)) {
++        if (hardlink_vulnerable(st)) {
+                 log_error("Refusing to set permissions on hardlinked file %s while the fs.protected_hardlinks sysctl is turned off.", path);
+                 return -EPERM;
+         }
+ 
+-        xsprintf(fn, "/proc/self/fd/%i", fd);
+-
+         if (i->mode_set) {
+-                if (S_ISLNK(st.st_mode))
++                if (S_ISLNK(st->st_mode))
+                         log_debug("Skipping mode fix for symlink %s.", path);
+                 else {
+                         mode_t m = i->mode;
+ 
+                         if (i->mask_perms) {
+-                                if (!(st.st_mode & 0111))
++                                if (!(st->st_mode & 0111))
+                                         m &= ~0111;
+-                                if (!(st.st_mode & 0222))
++                                if (!(st->st_mode & 0222))
+                                         m &= ~0222;
+-                                if (!(st.st_mode & 0444))
++                                if (!(st->st_mode & 0444))
+                                         m &= ~0444;
+-                                if (!S_ISDIR(st.st_mode))
++                                if (!S_ISDIR(st->st_mode))
+                                         m &= ~07000; /* remove sticky/sgid/suid bit, unless directory */
+                         }
+ 
+-                        if (m == (st.st_mode & 07777))
+-                                log_debug("\"%s\" has correct mode %o already.", path, st.st_mode);
++                        if (m == (st->st_mode & 07777))
++                                log_debug("\"%s\" has correct mode %o already.", path, st->st_mode);
+                         else {
++                                char procfs_path[strlen("/proc/self/fd/") + DECIMAL_STR_MAX(int)];
++
+                                 log_debug("Changing \"%s\" to mode %o.", path, m);
+ 
+-                                if (chmod(fn, m) < 0)
+-                                        return log_error_errno(errno, "chmod() of %s via %s failed: %m", path, fn);
++                                /* fchmodat() still doesn't have AT_EMPTY_PATH flag. */
++                                xsprintf(procfs_path, "/proc/self/fd/%i", fd);
++
++                                if (chmod(procfs_path, m) < 0)
++                                        return log_error_errno(errno, "chmod() of %s via %s failed: %m", path, procfs_path);
+                         }
+                 }
+         }
+ 
+-        if ((i->uid_set && i->uid != st.st_uid) ||
+-            (i->gid_set && i->gid != st.st_gid)) {
++        if ((i->uid_set && i->uid != st->st_uid) ||
++            (i->gid_set && i->gid != st->st_gid)) {
+                 log_debug("Changing \"%s\" to owner "UID_FMT":"GID_FMT,
+                           path,
+                           i->uid_set ? i->uid : UID_INVALID,
+                           i->gid_set ? i->gid : GID_INVALID);
+ 
+-                if (chown(fn,
+-                          i->uid_set ? i->uid : UID_INVALID,
+-                          i->gid_set ? i->gid : GID_INVALID) < 0)
+-                        return log_error_errno(errno, "chown() of %s via %s failed: %m", path, fn);
++                if (fchownat(fd,
++                             "",
++                             i->uid_set ? i->uid : UID_INVALID,
++                             i->gid_set ? i->gid : GID_INVALID,
++                             AT_EMPTY_PATH) < 0)
++                        return log_error_errno(errno, "fchownat() of %s failed: %m", path);
+         }
+ 
+-        fd = safe_close(fd);
+-
+ shortcut:
+         return label_fix(path, false, false);
+ }
+ 
++static int path_set_perms(Item *i, const char *path) {
++        _cleanup_close_ int fd = -1;
++        struct stat st;
++
++        assert(i);
++        assert(path);
++
++        fd = open(path, O_NOFOLLOW|O_CLOEXEC|O_PATH);
++        if (fd < 0) {
++                int level = LOG_ERR, r = -errno;
++
++                /* Option "e" operates only on existing objects. Do not
++                 * print errors about non-existent files or directories */
++                if (i->type == EMPTY_DIRECTORY && errno == ENOENT) {
++                        level = LOG_DEBUG;
++                        r = 0;
++                }
++
++                log_full_errno(level, errno, "Adjusting owner and mode for %s failed: %m", path);
++                return r;
++        }
++
++        if (fstat(fd, &st) < 0)
++                return log_error_errno(errno, "Failed to fstat() file %s: %m", path);
++
++        return fd_set_perms(i, fd, &st);
++}
++
+ static int parse_xattrs_from_arg(Item *i) {
+         const char *p;
+         int r;
+@@ -918,21 +929,43 @@ static int parse_xattrs_from_arg(Item *i) {
+         return 0;
+ }
+ 
+-static int path_set_xattrs(Item *i, const char *path) {
++static int fd_set_xattrs(Item *i, int fd, const struct stat *st) {
++        char procfs_path[strlen("/proc/self/fd/") + DECIMAL_STR_MAX(int)];
++        _cleanup_free_ char *path = NULL;
+         char **name, **value;
++        int r;
+ 
+         assert(i);
+-        assert(path);
++        assert(fd);
++
++        r = fd_get_path(fd, &path);
++        if (r < 0)
++                return r;
++
++        xsprintf(procfs_path, "/proc/self/fd/%i", fd);
+ 
+         STRV_FOREACH_PAIR(name, value, i->xattrs) {
+                 log_debug("Setting extended attribute '%s=%s' on %s.", *name, *value, path);
+-                if (lsetxattr(path, *name, *value, strlen(*value), 0) < 0)
++                if (setxattr(procfs_path, *name, *value, strlen(*value), 0) < 0)
+                         return log_error_errno(errno, "Setting extended attribute %s=%s on %s failed: %m",
+                                                *name, *value, path);
+         }
+         return 0;
+ }
+ 
++static int path_set_xattrs(Item *i, const char *path) {
++        _cleanup_close_ int fd = -1;
++
++        assert(i);
++        assert(path);
++
++        fd = open(path, O_CLOEXEC|O_NOFOLLOW|O_PATH);
++        if (fd < 0)
++                return log_error_errno(errno, "Cannot open '%s': %m", path);
++
++        return fd_set_xattrs(i, fd, NULL);
++}
++
+ static int parse_acls_from_arg(Item *item) {
+ #if HAVE_ACL
+         int r;
+@@ -998,52 +1031,71 @@ static int path_set_acl(const char *path, const char *pretty, acl_type_t type, a
+ }
+ #endif
+ 
+-static int path_set_acls(Item *item, const char *path) {
++static int fd_set_acls(Item *item, int fd, const struct stat *st) {
+         int r = 0;
+ #if HAVE_ACL
+-        char fn[STRLEN("/proc/self/fd/") + DECIMAL_STR_MAX(int)];
+-        _cleanup_close_ int fd = -1;
+-        struct stat st;
++        char procfs_path[strlen("/proc/self/fd/") + DECIMAL_STR_MAX(int)];
++        _cleanup_free_ char *path = NULL;
+ 
+         assert(item);
+-        assert(path);
+-
+-        fd = open(path, O_NOFOLLOW|O_CLOEXEC|O_PATH);
+-        if (fd < 0)
+-                return log_error_errno(errno, "Adjusting ACL of %s failed: %m", path);
++        assert(fd);
++        assert(st);
+ 
+-        if (fstatat(fd, "", &st, AT_EMPTY_PATH) < 0)
+-                return log_error_errno(errno, "Failed to fstat() file %s: %m", path);
++        r = fd_get_path(fd, &path);
++        if (r < 0)
++                return r;
+ 
+-        if (hardlink_vulnerable(&st)) {
++        if (hardlink_vulnerable(st)) {
+                 log_error("Refusing to set ACLs on hardlinked file %s while the fs.protected_hardlinks sysctl is turned off.", path);
+                 return -EPERM;
+         }
+ 
+-        if (S_ISLNK(st.st_mode)) {
++        if (S_ISLNK(st->st_mode)) {
+                 log_debug("Skipping ACL fix for symlink %s.", path);
+                 return 0;
+         }
+ 
+-        xsprintf(fn, "/proc/self/fd/%i", fd);
++        xsprintf(procfs_path, "/proc/self/fd/%i", fd);
+ 
+         if (item->acl_access)
+-                r = path_set_acl(fn, path, ACL_TYPE_ACCESS, item->acl_access, item->force);
++                r = path_set_acl(procfs_path, path, ACL_TYPE_ACCESS, item->acl_access, item->force);
+ 
+         if (r == 0 && item->acl_default)
+-                r = path_set_acl(fn, path, ACL_TYPE_DEFAULT, item->acl_default, item->force);
++                r = path_set_acl(procfs_path, path, ACL_TYPE_DEFAULT, item->acl_default, item->force);
+ 
+         if (r > 0)
+                 return -r; /* already warned */
+-        else if (r == -EOPNOTSUPP) {
++        if (r == -EOPNOTSUPP) {
+                 log_debug_errno(r, "ACLs not supported by file system at %s", path);
+                 return 0;
+-        } else if (r < 0)
+-                log_error_errno(r, "ACL operation on \"%s\" failed: %m", path);
++        }
++        if (r < 0)
++                return log_error_errno(r, "ACL operation on \"%s\" failed: %m", path);
+ #endif
+         return r;
+ }
+ 
++static int path_set_acls(Item *item, const char *path) {
++        int r = 0;
++#ifdef HAVE_ACL
++        _cleanup_close_ int fd = -1;
++        struct stat st;
++
++        assert(item);
++        assert(path);
++
++        fd = open(path, O_NOFOLLOW|O_CLOEXEC|O_PATH);
++        if (fd < 0)
++                return log_error_errno(errno, "Adjusting ACL of %s failed: %m", path);
++
++        if (fstat(fd, &st) < 0)
++                return log_error_errno(errno, "Failed to fstat() file %s: %m", path);
++
++        r = fd_set_acls(item, fd, &st);
++ #endif
++         return r;
++ }
++
+ #define ATTRIBUTES_ALL                          \
+         (FS_NOATIME_FL      |                   \
+          FS_SYNC_FL         |                   \
+@@ -1143,30 +1195,24 @@ static int parse_attribute_from_arg(Item *item) {
+         return 0;
+ }
+ 
+-static int path_set_attribute(Item *item, const char *path) {
+-        _cleanup_close_ int fd = -1;
+-        struct stat st;
++static int fd_set_attribute(Item *item, int fd, const struct stat *st) {
++        char procfs_path[strlen("/proc/self/fd/") + DECIMAL_STR_MAX(int)];
++        _cleanup_close_ int procfs_fd = -1;
++        _cleanup_free_ char *path = NULL;
+         unsigned f;
+         int r;
+ 
+         if (!item->attribute_set || item->attribute_mask == 0)
+                 return 0;
+ 
+-        fd = open(path, O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_NOATIME|O_NOFOLLOW);
+-        if (fd < 0) {
+-                if (errno == ELOOP)
+-                        return log_error_errno(errno, "Skipping file attributes adjustment on symlink %s.", path);
+-
+-                return log_error_errno(errno, "Cannot open '%s': %m", path);
+-        }
+-
+-        if (fstat(fd, &st) < 0)
+-                return log_error_errno(errno, "Cannot stat '%s': %m", path);
++        r = fd_get_path(fd, &path);
++        if (r < 0)
++                return r;
+ 
+         /* Issuing the file attribute ioctls on device nodes is not
+          * safe, as that will be delivered to the drivers, not the
+          * file system containing the device node. */
+-        if (!S_ISREG(st.st_mode) && !S_ISDIR(st.st_mode)) {
++        if (!S_ISREG(st->st_mode) && !S_ISDIR(st->st_mode)) {
+                 log_error("Setting file flags is only supported on regular files and directories, cannot set on '%s'.", path);
+                 return -EINVAL;
+         }
+@@ -1174,10 +1220,16 @@ static int path_set_attribute(Item *item, const char *path) {
+         f = item->attribute_value & item->attribute_mask;
+ 
+         /* Mask away directory-specific flags */
+-        if (!S_ISDIR(st.st_mode))
++        if (!S_ISDIR(st->st_mode))
+                 f &= ~FS_DIRSYNC_FL;
+ 
+-        r = chattr_fd(fd, f, item->attribute_mask);
++        xsprintf(procfs_path, "/proc/self/fd/%i", fd);
++
++        procfs_fd = open(procfs_path, O_RDONLY|O_CLOEXEC|O_NOATIME);
++        if (procfs_fd < 0)
++                return -errno;
++
++        r = chattr_fd(procfs_fd, f, item->attribute_mask);
+         if (r < 0)
+                 log_full_errno(IN_SET(r, -ENOTTY, -EOPNOTSUPP) ? LOG_DEBUG : LOG_WARNING,
+                                r,
+@@ -1187,6 +1239,23 @@ static int path_set_attribute(Item *item, const char *path) {
+         return 0;
+ }
+ 
++static int path_set_attribute(Item *item, const char *path) {
++        _cleanup_close_ int fd = -1;
++        struct stat st;
++
++        if (!item->attribute_set || item->attribute_mask == 0)
++                return 0;
++
++        fd = open(path, O_CLOEXEC|O_NOFOLLOW|O_PATH);
++        if (fd < 0)
++                return log_error_errno(errno, "Cannot open '%s': %m", path);
++
++        if (fstat(fd, &st) < 0)
++                return log_error_errno(errno, "Cannot stat '%s': %m", path);
++
++        return fd_set_attribute(item, fd, &st);
++}
++
+ static int write_one_file(Item *i, const char *path) {
+         _cleanup_close_ int fd = -1;
+         int flags, r = 0;
+@@ -1251,48 +1320,58 @@ done:
+ }
+ 
+ typedef int (*action_t)(Item *, const char *);
++typedef int (*fdaction_t)(Item *, int fd, const struct stat *st);
+ 
+-static int item_do_children(Item *i, const char *path, action_t action) {
+-        _cleanup_closedir_ DIR *d;
+-        struct dirent *de;
+-        int r = 0;
++static int item_do(Item *i, int fd, const struct stat *st, fdaction_t action) {
++        int r = 0, q;
+ 
+         assert(i);
+-        assert(path);
++        assert(fd >= 0);
++        assert(st);
+ 
+         /* This returns the first error we run into, but nevertheless
+          * tries to go on */
++        r = action(i, fd, st);
+ 
+-        d = opendir_nomod(path);
+-        if (!d)
+-                return IN_SET(errno, ENOENT, ENOTDIR, ELOOP) ? 0 : -errno;
++        if (S_ISDIR(st->st_mode)) {
++                char procfs_path[strlen("/proc/self/fd/") + DECIMAL_STR_MAX(int)];
++                _cleanup_closedir_ DIR *d = NULL;
++                struct dirent *de;
+ 
+-        FOREACH_DIRENT_ALL(de, d, r = -errno) {
+-                _cleanup_free_ char *p = NULL;
+-                int q;
++                /* The passed 'fd' was opened with O_PATH. We need to convert
++                 * it into a 'regular' fd before reading the directory content. */
++                xsprintf(procfs_path, "/proc/self/fd/%i", fd);
+ 
+-                if (dot_or_dot_dot(de->d_name))
+-                        continue;
++                d = opendir(procfs_path);
++                if (!d) {
++                        r = r ?: -errno;
++                        goto finish;
++                }
+ 
+-                p = strjoin(path, "/", de->d_name);
+-                if (!p)
+-                        return -ENOMEM;
++                FOREACH_DIRENT_ALL(de, d, q = -errno; goto finish) {
++                        struct stat de_st;
++                        int de_fd;
++
++                        if (dot_or_dot_dot(de->d_name))
++                                continue;
+ 
+-                q = action(i, p);
+-                if (q < 0 && q != -ENOENT && r == 0)
+-                        r = q;
++                        de_fd = openat(fd, de->d_name, O_NOFOLLOW|O_CLOEXEC|O_PATH);
++                        if (de_fd >= 0 && fstat(de_fd, &de_st) >= 0)
++                                /* pass ownership of dirent fd over  */
++                                q = item_do(i, de_fd, &de_st, action);
++                        else
++                                q = -errno;
+ 
+-                if (IN_SET(de->d_type, DT_UNKNOWN, DT_DIR)) {
+-                        q = item_do_children(i, p, action);
+                         if (q < 0 && r == 0)
+                                 r = q;
+                 }
+         }
+-
++finish:
++        safe_close(fd);
+         return r;
+ }
+ 
+-static int glob_item(Item *i, action_t action, bool recursive) {
++static int glob_item(Item *i, action_t action) {
+         _cleanup_globfree_ glob_t g = {
+ #ifdef GLOB_ALTDIRFUNC
+                 .gl_opendir = (void *(*)(const char *)) opendir_nomod,
+@@ -1309,12 +1388,48 @@ static int glob_item(Item *i, action_t action, bool recursive) {
+                 k = action(i, *fn);
+                 if (k < 0 && r == 0)
+                         r = k;
++        }
+ 
+-                if (recursive) {
+-                        k = item_do_children(i, *fn, action);
+-                        if (k < 0 && r == 0)
+-                                r = k;
++        return r;
++}
++
++static int glob_item_recursively(Item *i, fdaction_t action) {
++        _cleanup_globfree_ glob_t g = {
++                .gl_opendir = (void *(*)(const char *)) opendir_nomod,
++        };
++        int r = 0, k;
++        char **fn;
++
++        k = safe_glob(i->path, GLOB_NOSORT|GLOB_BRACE, &g);
++        if (k < 0 && k != -ENOENT)
++                return log_error_errno(k, "glob(%s) failed: %m", i->path);
++
++        STRV_FOREACH(fn, g.gl_pathv) {
++                _cleanup_close_ int fd = -1;
++                struct stat st;
++
++                /* Make sure we won't trigger/follow file object (such as
++                 * device nodes, automounts, ...) pointed out by 'fn' with
++                 * O_PATH. Note, when O_PATH is used, flags other than
++                 * O_CLOEXEC, O_DIRECTORY, and O_NOFOLLOW are ignored. */
++
++                fd = open(*fn, O_CLOEXEC|O_NOFOLLOW|O_PATH);
++                if (fd < 0) {
++                        r = r ?: -errno;
++                        continue;
++                }
++
++                if (fstat(fd, &st) < 0) {
++                        r = r ?: -errno;
++                        continue;
+                 }
++
++                k = item_do(i, fd, &st, action);
++                if (k < 0 && r == 0)
++                        r = k;
++
++                /* we passed fd ownership to the previous call */
++                fd = -1;
+         }
+ 
+         return r;
+@@ -1403,7 +1518,7 @@ static int create_item(Item *i) {
+                 break;
+ 
+         case WRITE_FILE:
+-                r = glob_item(i, write_one_file, false);
++                r = glob_item(i, write_one_file);
+                 if (r < 0)
+                         return r;
+ 
+@@ -1662,49 +1777,49 @@ static int create_item(Item *i) {
+ 
+         case ADJUST_MODE:
+         case RELABEL_PATH:
+-                r = glob_item(i, path_set_perms, false);
++                r = glob_item(i, path_set_perms);
+                 if (r < 0)
+                         return r;
+                 break;
+ 
+         case RECURSIVE_RELABEL_PATH:
+-                r = glob_item(i, path_set_perms, true);
++                r = glob_item_recursively(i, fd_set_perms);
+                 if (r < 0)
+                         return r;
+                 break;
+ 
+         case SET_XATTR:
+-                r = glob_item(i, path_set_xattrs, false);
++                r = glob_item(i, path_set_xattrs);
+                 if (r < 0)
+                         return r;
+                 break;
+ 
+         case RECURSIVE_SET_XATTR:
+-                r = glob_item(i, path_set_xattrs, true);
++                r = glob_item_recursively(i, fd_set_xattrs);
+                 if (r < 0)
+                         return r;
+                 break;
+ 
+         case SET_ACL:
+-                r = glob_item(i, path_set_acls, false);
++                r = glob_item(i, path_set_acls);
+                 if (r < 0)
+                         return r;
+                 break;
+ 
+         case RECURSIVE_SET_ACL:
+-                r = glob_item(i, path_set_acls, true);
++                r = glob_item_recursively(i, fd_set_acls);
+                 if (r < 0)
+                         return r;
+                 break;
+ 
+         case SET_ATTRIBUTE:
+-                r = glob_item(i, path_set_attribute, false);
++                r = glob_item(i, path_set_attribute);
+                 if (r < 0)
+                         return r;
+                 break;
+ 
+         case RECURSIVE_SET_ATTRIBUTE:
+-                r = glob_item(i, path_set_attribute, true);
++                r = glob_item_recursively(i, fd_set_attribute);
+                 if (r < 0)
+                         return r;
+                 break;
+@@ -1754,7 +1869,7 @@ static int remove_item(Item *i) {
+         case REMOVE_PATH:
+         case TRUNCATE_DIRECTORY:
+         case RECURSIVE_REMOVE_PATH:
+-                return glob_item(i, remove_item_instance, false);
++                return glob_item(i, remove_item_instance);
+ 
+         default:
+                 return 0;
+@@ -1828,7 +1943,7 @@ static int clean_item(Item *i) {
+                 return 0;
+         case EMPTY_DIRECTORY:
+         case IGNORE_DIRECTORY_PATH:
+-                return glob_item(i, clean_item_instance, false);
++                return glob_item(i, clean_item_instance);
+         default:
+                 return 0;
+         }
+-- 
+2.11.0
+
diff --git a/meta/recipes-core/systemd/systemd/0002-Make-tmpfiles-safe.patch b/meta/recipes-core/systemd/systemd/0002-Make-tmpfiles-safe.patch
new file mode 100644
index 0000000000..80d27c141b
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0002-Make-tmpfiles-safe.patch
@@ -0,0 +1,1828 @@
+From fb95c890cf5116e698347c6a7bb3daeeb2d28cf9 Mon Sep 17 00:00:00 2001
+From: George McCollister <george.mccollister@gmail.com>
+Date: Thu, 21 Feb 2019 18:04:37 -0600
+Subject: [PATCH] Make tmpfiles safe
+
+In addition to backporting the changesets in #8822, this also backports
+e04fc13 (test: add tests for systemd-tmpfiles), as well as empty_to_root()
+from v239.
+
+Origin: upstream, https://github.com/systemd/systemd/pull/8822/commits
+Bug: https://github.com/systemd/systemd/issues/7986
+
+Patch from:
+systemd_237-3ubuntu10.13.debian CVE-2018-6954_2.patch
+
+https://usn.ubuntu.com/3816-1/ states that CVE-2018-6954 doesn't
+affect Ubuntu 18.10 which uses the same version of systemd as thud
+(239).
+
+CVE: CVE-2018-6954
+Upstream-Status: Backport
+
+Signed-off-by: George McCollister <george.mccollister@gmail.com>
+---
+ src/basic/btrfs-util.c   |  26 +-
+ src/basic/btrfs-util.h   |   1 +
+ src/basic/fileio.c       |   5 +-
+ src/basic/fs-util.c      |  27 +-
+ src/basic/fs-util.h      |   2 +
+ src/basic/label.h        |   1 +
+ src/basic/mkdir-label.c  |  17 +
+ src/basic/mkdir.c        |   6 +
+ src/basic/mkdir.h        |   1 +
+ src/basic/path-util.c    |   5 +-
+ src/basic/path-util.h    |   4 +
+ src/basic/selinux-util.c |  84 +++--
+ src/basic/selinux-util.h |   1 +
+ src/basic/smack-util.c   | 119 +++++--
+ src/basic/smack-util.h   |   1 +
+ src/basic/stat-util.c    |  11 +
+ src/basic/stat-util.h    |   1 +
+ src/test/test-fs-util.c  |  25 ++
+ src/tmpfiles/tmpfiles.c  | 902 ++++++++++++++++++++++++++++++++---------------
+ 19 files changed, 882 insertions(+), 357 deletions(-)
+
+diff --git a/src/basic/btrfs-util.c b/src/basic/btrfs-util.c
+index 19d385ab7c..26b088f52b 100644
+--- a/src/basic/btrfs-util.c
++++ b/src/basic/btrfs-util.c
+@@ -150,8 +150,25 @@ int btrfs_is_subvol(const char *path) {
+         return btrfs_is_subvol_fd(fd);
+ }
+ 
+-int btrfs_subvol_make(const char *path) {
++int btrfs_subvol_make_fd(int fd, const char *subvolume) {
+         struct btrfs_ioctl_vol_args args = {};
++        int r;
++
++        assert(subvolume);
++
++        r = validate_subvolume_name(subvolume);
++        if (r < 0)
++                return r;
++
++        strncpy(args.name, subvolume, sizeof(args.name)-1);
++
++        if (ioctl(fd, BTRFS_IOC_SUBVOL_CREATE, &args) < 0)
++                return -errno;
++
++        return 0;
++}
++
++int btrfs_subvol_make(const char *path) {
+         _cleanup_close_ int fd = -1;
+         const char *subvolume;
+         int r;
+@@ -166,12 +183,7 @@ int btrfs_subvol_make(const char *path) {
+         if (fd < 0)
+                 return fd;
+ 
+-        strncpy(args.name, subvolume, sizeof(args.name)-1);
+-
+-        if (ioctl(fd, BTRFS_IOC_SUBVOL_CREATE, &args) < 0)
+-                return -errno;
+-
+-        return 0;
++        return btrfs_subvol_make_fd(fd, subvolume);
+ }
+ 
+ int btrfs_subvol_set_read_only_fd(int fd, bool b) {
+diff --git a/src/basic/btrfs-util.h b/src/basic/btrfs-util.h
+index 952b3c26da..e92687bc57 100644
+--- a/src/basic/btrfs-util.h
++++ b/src/basic/btrfs-util.h
+@@ -84,6 +84,7 @@ int btrfs_resize_loopback_fd(int fd, uint64_t size, bool grow_only);
+ int btrfs_resize_loopback(const char *path, uint64_t size, bool grow_only);
+ 
+ int btrfs_subvol_make(const char *path);
++int btrfs_subvol_make_fd(int fd, const char *subvolume);
+ 
+ int btrfs_subvol_snapshot_fd(int old_fd, const char *new_path, BtrfsSnapshotFlags flags);
+ int btrfs_subvol_snapshot(const char *old_path, const char *new_path, BtrfsSnapshotFlags flags);
+diff --git a/src/basic/fileio.c b/src/basic/fileio.c
+index 26d6174664..1c7e23332f 100644
+--- a/src/basic/fileio.c
++++ b/src/basic/fileio.c
+@@ -1304,7 +1304,10 @@ int tempfn_random_child(const char *p, const char *extra, char **ret) {
+         if (!t)
+                 return -ENOMEM;
+ 
+-        x = stpcpy(stpcpy(stpcpy(t, p), "/.#"), extra);
++        if (isempty(p))
++                x = stpcpy(stpcpy(t, ".#"), extra);
++        else
++                x = stpcpy(stpcpy(stpcpy(t, p), "/.#"), extra);
+ 
+         u = random_u64();
+         for (i = 0; i < 16; i++) {
+diff --git a/src/basic/fs-util.c b/src/basic/fs-util.c
+index a8e50d4c78..c96a8813ea 100644
+--- a/src/basic/fs-util.c
++++ b/src/basic/fs-util.c
+@@ -465,6 +465,31 @@ int mkfifo_atomic(const char *path, mode_t mode) {
+         return 0;
+ }
+ 
++int mkfifoat_atomic(int dirfd, const char *path, mode_t mode) {
++        _cleanup_free_ char *t = NULL;
++        int r;
++
++        assert(path);
++
++        if (path_is_absolute(path))
++                return mkfifo_atomic(path, mode);
++
++        /* We're only interested in the (random) filename.  */
++        r = tempfn_random_child("", NULL, &t);
++        if (r < 0)
++                return r;
++
++        if (mkfifoat(dirfd, t, mode) < 0)
++                return -errno;
++
++        if (renameat(dirfd, t, dirfd, path) < 0) {
++                unlink_noerrno(t);
++                return -errno;
++        }
++
++        return 0;
++}
++
+ int get_files_in_directory(const char *path, char ***list) {
+         _cleanup_closedir_ DIR *d = NULL;
+         struct dirent *de;
+@@ -808,7 +833,7 @@ int chase_symlinks(const char *path, const char *original_root, unsigned flags,
+                     fd_is_fs_type(child, AUTOFS_SUPER_MAGIC) > 0)
+                         return -EREMOTE;
+ 
+-                if (S_ISLNK(st.st_mode)) {
++                if (S_ISLNK(st.st_mode) && !((flags & CHASE_NOFOLLOW) && isempty(todo))) {
+                         char *joined;
+ 
+                         _cleanup_free_ char *destination = NULL;
+diff --git a/src/basic/fs-util.h b/src/basic/fs-util.h
+index 9c4b02eccd..121345e74d 100644
+--- a/src/basic/fs-util.h
++++ b/src/basic/fs-util.h
+@@ -80,6 +80,7 @@ int symlink_idempotent(const char *from, const char *to);
+ int symlink_atomic(const char *from, const char *to);
+ int mknod_atomic(const char *path, mode_t mode, dev_t dev);
+ int mkfifo_atomic(const char *path, mode_t mode);
++int mkfifoat_atomic(int dir_fd, const char *path, mode_t mode);
+ 
+ int get_files_in_directory(const char *path, char ***list);
+ 
+@@ -106,6 +107,7 @@ enum {
+         CHASE_NO_AUTOFS   = 1U << 2,   /* If set, return -EREMOTE if autofs mount point found */
+         CHASE_SAFE        = 1U << 3,   /* If set, return EPERM if we ever traverse from unprivileged to privileged files or directories */
+         CHASE_OPEN        = 1U << 4,   /* If set, return an O_PATH object to the final component */
++        CHASE_NOFOLLOW    = 1U << 7, /* Only valid with CHASE_OPEN: when the path's right-most component refers to symlink return O_PATH fd of the symlink, rather than following it. */
+ };
+ 
+ int chase_symlinks(const char *path_with_prefix, const char *root, unsigned flags, char **ret);
+diff --git a/src/basic/label.h b/src/basic/label.h
+index d73dacec4f..3ecfed72c6 100644
+--- a/src/basic/label.h
++++ b/src/basic/label.h
+@@ -26,6 +26,7 @@
+ int label_fix(const char *path, bool ignore_enoent, bool ignore_erofs);
+ 
+ int mkdir_label(const char *path, mode_t mode);
++int mkdirat_label(int dirfd, const char *path, mode_t mode);
+ int symlink_label(const char *old_path, const char *new_path);
+ 
+ int btrfs_subvol_make_label(const char *path);
+diff --git a/src/basic/mkdir-label.c b/src/basic/mkdir-label.c
+index 6f3a46f467..3c1a227bfa 100644
+--- a/src/basic/mkdir-label.c
++++ b/src/basic/mkdir-label.c
+@@ -47,6 +47,23 @@ int mkdir_label(const char *path, mode_t mode) {
+         return mac_smack_fix(path, false, false);
+ }
+ 
++int mkdirat_label(int dirfd, const char *path, mode_t mode) {
++        int r;
++
++        assert(path);
++
++        r = mac_selinux_create_file_prepare_at(dirfd, path, S_IFDIR);
++        if (r < 0)
++                return r;
++
++        r = mkdirat_errno_wrapper(dirfd, path, mode);
++        mac_selinux_create_file_clear();
++        if (r < 0)
++                return r;
++
++        return mac_smack_fix_at(dirfd, path, false, false);
++}
++
+ int mkdir_safe_label(const char *path, mode_t mode, uid_t uid, gid_t gid, bool follow_symlink) {
+         return mkdir_safe_internal(path, mode, uid, gid, follow_symlink, mkdir_label);
+ }
+diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
+index d51518a5a7..418945ad4a 100644
+--- a/src/basic/mkdir.c
++++ b/src/basic/mkdir.c
+@@ -77,6 +77,12 @@ int mkdir_errno_wrapper(const char *pathname, mode_t mode) {
+         return 0;
+ }
+ 
++int mkdirat_errno_wrapper(int dirfd, const char *pathname, mode_t mode) {
++        if (mkdirat(dirfd, pathname, mode) < 0)
++                return -errno;
++        return 0;
++}
++
+ int mkdir_safe(const char *path, mode_t mode, uid_t uid, gid_t gid, bool follow_symlink) {
+         return mkdir_safe_internal(path, mode, uid, gid, follow_symlink, mkdir_errno_wrapper);
+ }
+diff --git a/src/basic/mkdir.h b/src/basic/mkdir.h
+index d6c2d579a3..3ec6f3ed2d 100644
+--- a/src/basic/mkdir.h
++++ b/src/basic/mkdir.h
+@@ -24,6 +24,7 @@
+ #include <sys/types.h>
+ 
+ int mkdir_errno_wrapper(const char *pathname, mode_t mode);
++int mkdirat_errno_wrapper(int dirfd, const char *pathname, mode_t mode);
+ int mkdir_safe(const char *path, mode_t mode, uid_t uid, gid_t gid, bool follow_symlink);
+ int mkdir_parents(const char *path, mode_t mode);
+ int mkdir_p(const char *path, mode_t mode);
+diff --git a/src/basic/path-util.c b/src/basic/path-util.c
+index df94629385..84404f7ee1 100644
+--- a/src/basic/path-util.c
++++ b/src/basic/path-util.c
+@@ -127,10 +127,7 @@ int path_make_absolute_cwd(const char *p, char **ret) {
+                 if (r < 0)
+                         return r;
+ 
+-                if (endswith(cwd, "/"))
+-                        c = strjoin(cwd, p);
+-                else
+-                        c = strjoin(cwd, "/", p);
++                c = path_join(NULL, cwd, p);
+         }
+         if (!c)
+                 return -ENOMEM;
+diff --git a/src/basic/path-util.h b/src/basic/path-util.h
+index 89c285e076..1094baca12 100644
+--- a/src/basic/path-util.h
++++ b/src/basic/path-util.h
+@@ -156,3 +156,7 @@ static inline const char *skip_dev_prefix(const char *p) {
+ 
+         return e ?: p;
+ }
++static inline const char *empty_to_root(const char *path) {
++        return isempty(path) ? "/" : path;
++}
++
+diff --git a/src/basic/selinux-util.c b/src/basic/selinux-util.c
+index 0c6e99b1d7..bdef7d148b 100644
+--- a/src/basic/selinux-util.c
++++ b/src/basic/selinux-util.c
+@@ -34,6 +34,7 @@
+ #endif
+ 
+ #include "alloc-util.h"
++#include "fd-util.h"
+ #include "log.h"
+ #include "macro.h"
+ #include "path-util.h"
+@@ -311,48 +312,89 @@ char* mac_selinux_free(char *label) {
+         return NULL;
+ }
+ 
+-int mac_selinux_create_file_prepare(const char *path, mode_t mode) {
+-
+ #if HAVE_SELINUX
++static int selinux_create_file_prepare_abspath(const char *abspath, mode_t mode) {
+         _cleanup_freecon_ char *filecon = NULL;
++        _cleanup_free_ char *path = NULL;
+         int r;
+ 
+-        assert(path);
+-
+-        if (!label_hnd)
+-                return 0;
+-
+-        if (path_is_absolute(path))
+-                r = selabel_lookup_raw(label_hnd, &filecon, path, mode);
+-        else {
+-                _cleanup_free_ char *newpath = NULL;
+-
+-                r = path_make_absolute_cwd(path, &newpath);
+-                if (r < 0)
+-                        return r;
+-
+-                r = selabel_lookup_raw(label_hnd, &filecon, newpath, mode);
+-        }
++        assert(abspath);
++        assert(path_is_absolute(abspath));
+ 
++        r = selabel_lookup_raw(label_hnd, &filecon, abspath, mode);
+         if (r < 0) {
+                 /* No context specified by the policy? Proceed without setting it. */
+                 if (errno == ENOENT)
+                         return 0;
+ 
+-                log_enforcing("Failed to determine SELinux security context for %s: %m", path);
++                log_enforcing("Failed to determine SELinux security context for %s: %m", abspath);
+         } else {
+                 if (setfscreatecon_raw(filecon) >= 0)
+                         return 0; /* Success! */
+ 
+-                log_enforcing("Failed to set SELinux security context %s for %s: %m", filecon, path);
++                log_enforcing("Failed to set SELinux security context %s for %s: %m", filecon, abspath);
+         }
+ 
+         if (security_getenforce() > 0)
+                 return -errno;
+ 
+-#endif
+         return 0;
+ }
++#endif
++
++int mac_selinux_create_file_prepare_at(int dirfd, const char *path, mode_t mode) {
++        int r = 0;
++
++#if HAVE_SELINUX
++        _cleanup_free_ char *abspath = NULL;
++        _cleanup_close_ int fd = -1;
++
++        assert(path);
++
++        if (!label_hnd)
++                return 0;
++
++        if (!path_is_absolute(path)) {
++                _cleanup_free_ char *p = NULL;
++
++                if (dirfd == AT_FDCWD)
++                        r = safe_getcwd(&p);
++                else
++                        r = fd_get_path(dirfd, &p);
++                if (r < 0)
++                        return r;
++
++                abspath = path_join(NULL, p, path);
++                if (!abspath)
++                        return -ENOMEM;
++
++                path = abspath;
++        }
++
++        r = selinux_create_file_prepare_abspath(path, mode);
++#endif
++        return r;
++}
++
++int mac_selinux_create_file_prepare(const char *path, mode_t mode) {
++        int r = 0;
++
++#if HAVE_SELINUX
++        _cleanup_free_ char *abspath = NULL;
++
++        assert(path);
++
++        if (!label_hnd)
++                return 0;
++
++        r = path_make_absolute_cwd(path, &abspath);
++        if (r < 0)
++                return r;
++
++        r = selinux_create_file_prepare_abspath(abspath, mode);
++#endif
++        return r;
++}
+ 
+ void mac_selinux_create_file_clear(void) {
+ 
+diff --git a/src/basic/selinux-util.h b/src/basic/selinux-util.h
+index 9780dca81e..84a8bf9729 100644
+--- a/src/basic/selinux-util.h
++++ b/src/basic/selinux-util.h
+@@ -41,6 +41,7 @@ int mac_selinux_get_child_mls_label(int socket_fd, const char *exe, const char *
+ char* mac_selinux_free(char *label);
+ 
+ int mac_selinux_create_file_prepare(const char *path, mode_t mode);
++int mac_selinux_create_file_prepare_at(int dirfd, const char *path, mode_t mode);
+ void mac_selinux_create_file_clear(void);
+ 
+ int mac_selinux_create_socket_prepare(const char *label);
+diff --git a/src/basic/smack-util.c b/src/basic/smack-util.c
+index f0018f013f..ea0af3e45f 100644
+--- a/src/basic/smack-util.c
++++ b/src/basic/smack-util.c
+@@ -21,18 +21,21 @@
+ ***/
+ 
+ #include <errno.h>
++#include <fcntl.h>
+ #include <string.h>
+ #include <sys/stat.h>
+ #include <sys/xattr.h>
+ #include <unistd.h>
+ 
+ #include "alloc-util.h"
++#include "fd-util.h"
+ #include "fileio.h"
+ #include "log.h"
+ #include "macro.h"
+ #include "path-util.h"
+ #include "process-util.h"
+ #include "smack-util.h"
++#include "stdio-util.h"
+ #include "string-table.h"
+ #include "xattr-util.h"
+ 
+@@ -134,59 +137,111 @@ int mac_smack_apply_pid(pid_t pid, const char *label) {
+         return r;
+ }
+ 
+-int mac_smack_fix(const char *path, bool ignore_enoent, bool ignore_erofs) {
++static int smack_fix_fd(int fd , const char *abspath, bool ignore_erofs) {
++        char procfs_path[STRLEN("/proc/self/fd/") + DECIMAL_STR_MAX(int)];
++        const char *label;
+         struct stat st;
+         int r;
+ 
+-        assert(path);
++        /* The caller should have done the sanity checks. */
++        assert(abspath);
++        assert(path_is_absolute(abspath));
+ 
+-        if (!mac_smack_use())
++        /* Path must be in /dev. */
++        if (!path_startswith(abspath, "/dev"))
+                 return 0;
+ 
++        if (fstat(fd, &st) < 0)
++                return -errno;
++
+         /*
+-         * Path must be in /dev and must exist
++         * Label directories and character devices "*".
++         * Label symlinks "_".
++         * Don't change anything else.
+          */
+-        if (!path_startswith(path, "/dev"))
++
++        if (S_ISDIR(st.st_mode))
++                label = SMACK_STAR_LABEL;
++        else if (S_ISLNK(st.st_mode))
++                label = SMACK_FLOOR_LABEL;
++        else if (S_ISCHR(st.st_mode))
++                label = SMACK_STAR_LABEL;
++        else
+                 return 0;
+ 
+-        r = lstat(path, &st);
+-        if (r >= 0) {
+-                const char *label;
+-
+-                /*
+-                 * Label directories and character devices "*".
+-                 * Label symlinks "_".
+-                 * Don't change anything else.
+-                 */
+-
+-                if (S_ISDIR(st.st_mode))
+-                        label = SMACK_STAR_LABEL;
+-                else if (S_ISLNK(st.st_mode))
+-                        label = SMACK_FLOOR_LABEL;
+-                else if (S_ISCHR(st.st_mode))
+-                        label = SMACK_STAR_LABEL;
+-                else
+-                        return 0;
++        xsprintf(procfs_path, "/proc/self/fd/%i", fd);
++        if (setxattr(procfs_path, "security.SMACK64", label, strlen(label), 0) < 0) {
++                _cleanup_free_ char *old_label = NULL;
+ 
+-                r = lsetxattr(path, "security.SMACK64", label, strlen(label), 0);
++                r = -errno;
+ 
+                 /* If the FS doesn't support labels, then exit without warning */
+-                if (r < 0 && errno == EOPNOTSUPP)
++                if (r == -EOPNOTSUPP)
++                        return 0;
++
++                /* It the FS is read-only and we were told to ignore failures caused by that, suppress error */
++                if (r == -EROFS && ignore_erofs)
++                        return 0;
++
++                /* If the old label is identical to the new one, suppress any kind of error */
++                if (getxattr_malloc(procfs_path, "security.SMACK64", &old_label, false) >= 0 &&
++                    streq(old_label, label))
+                         return 0;
++
++                return log_debug_errno(r, "Unable to fix SMACK label of %s: %m", abspath);
+         }
+ 
+-        if (r < 0) {
+-                /* Ignore ENOENT in some cases */
++        return r;
++}
++
++int mac_smack_fix_at(int dirfd, const char *path, bool ignore_enoent, bool ignore_erofs) {
++        _cleanup_free_ char *p = NULL;
++        _cleanup_close_ int fd = -1;
++        int r;
++
++        assert(path);
++
++        if (!mac_smack_use())
++                return 0;
++
++        fd = openat(dirfd, path, O_NOFOLLOW|O_CLOEXEC|O_PATH);
++        if (fd < 0) {
+                 if (ignore_enoent && errno == ENOENT)
+                         return 0;
+ 
+-                if (ignore_erofs && errno == EROFS)
++                return -errno;
++        }
++
++        r = fd_get_path(fd, &p);
++        if (r < 0)
++                return r;
++
++        return smack_fix_fd(fd, p, ignore_erofs);
++}
++
++int mac_smack_fix(const char *path, bool ignore_enoent, bool ignore_erofs) {
++        _cleanup_free_ char *abspath = NULL;
++        _cleanup_close_ int fd = -1;
++        int r;
++
++        assert(path);
++
++        if (!mac_smack_use())
++                return 0;
++
++        r = path_make_absolute_cwd(path, &abspath);
++        if (r < 0)
++                return r;
++
++        fd = open(abspath, O_NOFOLLOW|O_CLOEXEC|O_PATH);
++        if (fd < 0) {
++                if (ignore_enoent && errno == ENOENT)
+                         return 0;
+ 
+-                r = log_debug_errno(errno, "Unable to fix SMACK label of %s: %m", path);
++                return -errno;
+         }
+ 
+-        return r;
++        return smack_fix_fd(fd, abspath, ignore_erofs);
+ }
+ 
+ int mac_smack_copy(const char *dest, const char *src) {
+@@ -236,6 +291,10 @@ int mac_smack_fix(const char *path, bool ignore_enoent, bool ignore_erofs) {
+         return 0;
+ }
+ 
++int mac_smack_fix_at(int dirfd, const char *path, bool ignore_enoent, bool ignore_erofs) {
++        return 0;
++}
++
+ int mac_smack_copy(const char *dest, const char *src) {
+         return 0;
+ }
+diff --git a/src/basic/smack-util.h b/src/basic/smack-util.h
+index e4d46d7736..0c214bbbc0 100644
+--- a/src/basic/smack-util.h
++++ b/src/basic/smack-util.h
+@@ -44,6 +44,7 @@ typedef enum SmackAttr {
+ bool mac_smack_use(void);
+ 
+ int mac_smack_fix(const char *path, bool ignore_enoent, bool ignore_erofs);
++int mac_smack_fix_at(int dirfd, const char *path, bool ignore_enoent, bool ignore_erofs);
+ 
+ const char* smack_attr_to_string(SmackAttr i) _const_;
+ SmackAttr smack_attr_from_string(const char *s) _pure_;
+diff --git a/src/basic/stat-util.c b/src/basic/stat-util.c
+index 3a54103f1b..801889ae5b 100644
+--- a/src/basic/stat-util.c
++++ b/src/basic/stat-util.c
+@@ -63,6 +63,17 @@ int is_dir(const char* path, bool follow) {
+         return !!S_ISDIR(st.st_mode);
+ }
+ 
++int is_dir_fd(int fd) {
++        struct stat st;
++        int r;
++
++        r = fstat(fd, &st);
++        if (r < 0)
++                return -errno;
++
++        return !!S_ISDIR(st.st_mode);
++}
++
+ int is_device_node(const char *path) {
+         struct stat info;
+ 
+diff --git a/src/basic/stat-util.h b/src/basic/stat-util.h
+index d8d3c20496..7ea68abfa3 100644
+--- a/src/basic/stat-util.h
++++ b/src/basic/stat-util.h
+@@ -31,6 +31,7 @@
+ 
+ int is_symlink(const char *path);
+ int is_dir(const char *path, bool follow);
++int is_dir_fd(int fd);
+ int is_device_node(const char *path);
+ 
+ int dir_is_empty(const char *path);
+diff --git a/src/test/test-fs-util.c b/src/test/test-fs-util.c
+index 9f3a500080..a76d6d0f8b 100644
+--- a/src/test/test-fs-util.c
++++ b/src/test/test-fs-util.c
+@@ -40,6 +40,7 @@ static void test_chase_symlinks(void) {
+         _cleanup_free_ char *result = NULL;
+         char temp[] = "/tmp/test-chase.XXXXXX";
+         const char *top, *p, *pslash, *q, *qslash;
++        struct stat st;
+         int r, pfd;
+ 
+         assert_se(mkdtemp(temp));
+@@ -288,6 +289,30 @@ static void test_chase_symlinks(void) {
+                 assert_se(sd_id128_equal(a, b));
+         }
+ 
++        /* Test CHASE_NOFOLLOW */
++
++        p = strjoina(temp, "/target");
++        q = strjoina(temp, "/symlink");
++        assert_se(symlink(p, q) >= 0);
++        pfd = chase_symlinks(q, NULL, CHASE_OPEN|CHASE_NOFOLLOW, &result);
++        assert_se(pfd > 0);
++        assert_se(path_equal(result, q));
++        assert_se(fstat(pfd, &st) >= 0);
++        assert_se(S_ISLNK(st.st_mode));
++        result = mfree(result);
++
++        /* s1 -> s2 -> nonexistent */
++        q = strjoina(temp, "/s1");
++        assert_se(symlink("s2", q) >= 0);
++        p = strjoina(temp, "/s2");
++        assert_se(symlink("nonexistent", p) >= 0);
++        pfd = chase_symlinks(q, NULL, CHASE_OPEN|CHASE_NOFOLLOW, &result);
++        assert_se(pfd > 0);
++        assert_se(path_equal(result, q));
++        assert_se(fstat(pfd, &st) >= 0);
++        assert_se(S_ISLNK(st.st_mode));
++        result = mfree(result);
++
+         assert_se(rm_rf(temp, REMOVE_ROOT|REMOVE_PHYSICAL) >= 0);
+ }
+ 
+diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
+index 613d418eb3..d59ccbaa39 100644
+--- a/src/tmpfiles/tmpfiles.c
++++ b/src/tmpfiles/tmpfiles.c
+@@ -794,6 +794,7 @@ static bool hardlink_vulnerable(struct stat *st) {
+ 
+ static int fd_set_perms(Item *i, int fd, const struct stat *st) {
+         _cleanup_free_ char *path = NULL;
++        struct stat stbuf;
+         int r;
+ 
+         assert(i);
+@@ -806,6 +807,12 @@ static int fd_set_perms(Item *i, int fd, const struct stat *st) {
+         if (!i->mode_set && !i->uid_set && !i->gid_set)
+                 goto shortcut;
+ 
++        if (!st) {
++                if (fstat(fd, &stbuf) < 0)
++                        return log_error_errno(errno, "fstat(%s) failed: %m", path);
++                st = &stbuf;
++        }
++
+         if (hardlink_vulnerable(st)) {
+                 log_error("Refusing to set permissions on hardlinked file %s while the fs.protected_hardlinks sysctl is turned off.", path);
+                 return -EPERM;
+@@ -863,32 +870,62 @@ shortcut:
+         return label_fix(path, false, false);
+ }
+ 
+-static int path_set_perms(Item *i, const char *path) {
+-        _cleanup_close_ int fd = -1;
+-        struct stat st;
++static int path_open_parent_safe(const char *path) {
++        _cleanup_free_ char *dn = NULL;
++        int fd;
+ 
+-        assert(i);
+-        assert(path);
++        if (path_equal(path, "/") || !path_is_normalized(path)) {
++                log_error("Failed to open parent of '%s': invalid path.", path);
++                return -EINVAL;
++        }
+ 
+-        fd = open(path, O_NOFOLLOW|O_CLOEXEC|O_PATH);
+-        if (fd < 0) {
+-                int level = LOG_ERR, r = -errno;
++        dn = dirname_malloc(path);
++        if (!dn)
++                return log_oom();
+ 
+-                /* Option "e" operates only on existing objects. Do not
+-                 * print errors about non-existent files or directories */
+-                if (i->type == EMPTY_DIRECTORY && errno == ENOENT) {
+-                        level = LOG_DEBUG;
+-                        r = 0;
+-                }
++        fd = chase_symlinks(dn, NULL, CHASE_OPEN|CHASE_SAFE, NULL);
++        if (fd == -EPERM)
++                return log_error_errno(fd, "Unsafe symlinks encountered in %s, refusing.", path);
++        if (fd < 0)
++                return log_error_errno(fd, "Failed to validate path %s: %m", path);
+ 
+-                log_full_errno(level, errno, "Adjusting owner and mode for %s failed: %m", path);
+-                return r;
++        return fd;
++}
++
++static int path_open_safe(const char *path) {
++        int fd;
++
++        /* path_open_safe() returns a file descriptor opened with O_PATH after
++         * verifying that the path doesn't contain unsafe transitions, except
++         * for its final component as the function does not follow symlink. */
++
++        assert(path);
++
++        if (!path_is_normalized(path)) {
++                log_error("Failed to open invalid path '%s'.", path);
++                return -EINVAL;
+         }
+ 
+-        if (fstat(fd, &st) < 0)
+-                return log_error_errno(errno, "Failed to fstat() file %s: %m", path);
++        fd = chase_symlinks(path, NULL, CHASE_OPEN|CHASE_SAFE|CHASE_NOFOLLOW, NULL);
++        if (fd == -EPERM)
++                return log_error_errno(fd, "Unsafe symlinks encountered in %s, refusing.", path);
++        if (fd < 0)
++                return log_error_errno(fd, "Failed to validate path %s: %m", path);
++
++        return fd;
++}
++
++static int path_set_perms(Item *i, const char *path) {
++        _cleanup_close_ int fd = -1;
++
++        assert(i);
++        assert(path);
+ 
+-        return fd_set_perms(i, fd, &st);
++        fd = path_open_safe(path);
++        if (fd < 0)
++                return fd;
++
++        return fd_set_perms(i, fd, NULL);
+ }
+ 
+ static int parse_xattrs_from_arg(Item *i) {
+@@ -959,9 +996,9 @@ static int path_set_xattrs(Item *i, const char *path) {
+         assert(i);
+         assert(path);
+ 
+-        fd = open(path, O_CLOEXEC|O_NOFOLLOW|O_PATH);
++        fd = path_open_safe(path);
+         if (fd < 0)
+-                return log_error_errno(errno, "Cannot open '%s': %m", path);
++                return fd;
+ 
+         return fd_set_xattrs(i, fd, NULL);
+ }
+@@ -1036,15 +1073,21 @@ static int fd_set_acls(Item *item, int fd, const struct stat *st) {
+ #if HAVE_ACL
+         char procfs_path[strlen("/proc/self/fd/") + DECIMAL_STR_MAX(int)];
+         _cleanup_free_ char *path = NULL;
++        struct stat stbuf;
+ 
+         assert(item);
+         assert(fd);
+-        assert(st);
+ 
+         r = fd_get_path(fd, &path);
+         if (r < 0)
+                 return r;
+ 
++        if (!st) {
++                if (fstat(fd, &stbuf) < 0)
++                        return log_error_errno(errno, "fstat(%s) failed: %m", path);
++                st = &stbuf;
++        }
++
+         if (hardlink_vulnerable(st)) {
+                 log_error("Refusing to set ACLs on hardlinked file %s while the fs.protected_hardlinks sysctl is turned off.", path);
+                 return -EPERM;
+@@ -1079,19 +1122,15 @@ static int path_set_acls(Item *item, const char *path) {
+         int r = 0;
+ #ifdef HAVE_ACL
+         _cleanup_close_ int fd = -1;
+-        struct stat st;
+ 
+         assert(item);
+         assert(path);
+ 
+-        fd = open(path, O_NOFOLLOW|O_CLOEXEC|O_PATH);
++        fd = path_open_safe(path);
+         if (fd < 0)
+-                return log_error_errno(errno, "Adjusting ACL of %s failed: %m", path);
++                return fd;
+ 
+-        if (fstat(fd, &st) < 0)
+-                return log_error_errno(errno, "Failed to fstat() file %s: %m", path);
+-
+-        r = fd_set_acls(item, fd, &st);
++        r = fd_set_acls(item, fd, NULL);
+  #endif
+          return r;
+  }
+@@ -1199,6 +1238,7 @@ static int fd_set_attribute(Item *item, int fd, const struct stat *st) {
+         char procfs_path[strlen("/proc/self/fd/") + DECIMAL_STR_MAX(int)];
+         _cleanup_close_ int procfs_fd = -1;
+         _cleanup_free_ char *path = NULL;
++        struct stat stbuf;
+         unsigned f;
+         int r;
+ 
+@@ -1209,6 +1249,12 @@ static int fd_set_attribute(Item *item, int fd, const struct stat *st) {
+         if (r < 0)
+                 return r;
+ 
++        if (!st) {
++                if (fstat(fd, &stbuf) < 0)
++                        return log_error_errno(errno, "fstat(%s) failed: %m", path);
++                st = &stbuf;
++        }
++
+         /* Issuing the file attribute ioctls on device nodes is not
+          * safe, as that will be delivered to the drivers, not the
+          * file system containing the device node. */
+@@ -1241,99 +1287,558 @@ static int fd_set_attribute(Item *item, int fd, const struct stat *st) {
+ 
+ static int path_set_attribute(Item *item, const char *path) {
+         _cleanup_close_ int fd = -1;
+-        struct stat st;
+ 
+         if (!item->attribute_set || item->attribute_mask == 0)
+                 return 0;
+ 
+-        fd = open(path, O_CLOEXEC|O_NOFOLLOW|O_PATH);
++        fd = path_open_safe(path);
+         if (fd < 0)
+-                return log_error_errno(errno, "Cannot open '%s': %m", path);
+-
+-        if (fstat(fd, &st) < 0)
+-                return log_error_errno(errno, "Cannot stat '%s': %m", path);
++                return fd;
+ 
+-        return fd_set_attribute(item, fd, &st);
++        return fd_set_attribute(item, fd, NULL);
+ }
+ 
+ static int write_one_file(Item *i, const char *path) {
+-        _cleanup_close_ int fd = -1;
+-        int flags, r = 0;
+-        struct stat st;
++        _cleanup_close_ int fd = -1, dir_fd = -1;
++        char *bn;
++        int r;
++
++        assert(i);
++        assert(path);
++        assert(i->argument);
++        assert(i->type == WRITE_FILE);
++
++        /* Validate the path and keep the fd on the directory for opening the
++         * file so we're sure that it can't be changed behind our back. */
++        dir_fd = path_open_parent_safe(path);
++        if (dir_fd < 0)
++                return dir_fd;
++
++        bn = basename(path);
++
++        /* Follows symlinks */
++        fd = openat(dir_fd, bn, O_NONBLOCK|O_CLOEXEC|O_WRONLY|O_NOCTTY, i->mode);
++        if (fd < 0) {
++                if (errno == ENOENT) {
++                        log_debug_errno(errno, "Not writing missing file \"%s\": %m", path);
++                        return 0;
++                }
++                return log_error_errno(errno, "Failed to open file \"%s\": %m", path);
++        }
++
++        /* 'w' is allowed to write into any kind of files. */
++        log_debug("Writing to \"%s\".", path);
++
++        r = loop_write(fd, i->argument, strlen(i->argument), false);
++        if (r < 0)
++                return log_error_errno(r, "Failed to write file \"%s\": %m", path);
++
++        return fd_set_perms(i, fd, NULL);
++}
++
++static int create_file(Item *i, const char *path) {
++        _cleanup_close_ int fd = -1, dir_fd = -1;
++        struct stat stbuf, *st = NULL;
++        int r = 0;
++        char *bn;
+ 
+         assert(i);
+         assert(path);
++        assert(i->type == CREATE_FILE);
++
++        /* 'f' operates on regular files exclusively. */
+ 
+-        flags = i->type == CREATE_FILE ? O_CREAT|O_EXCL|O_NOFOLLOW :
+-                i->type == TRUNCATE_FILE ? O_CREAT|O_TRUNC|O_NOFOLLOW : 0;
++        /* Validate the path and keep the fd on the directory for opening the
++         * file so we're sure that it can't be changed behind our back. */
++        dir_fd = path_open_parent_safe(path);
++        if (dir_fd < 0)
++                return dir_fd;
++
++        bn = basename(path);
+ 
+         RUN_WITH_UMASK(0000) {
+                 mac_selinux_create_file_prepare(path, S_IFREG);
+-                fd = open(path, flags|O_NDELAY|O_CLOEXEC|O_WRONLY|O_NOCTTY, i->mode);
++                fd = openat(dir_fd, bn, O_CREAT|O_EXCL|O_NOFOLLOW|O_NONBLOCK|O_CLOEXEC|O_WRONLY|O_NOCTTY, i->mode);
+                 mac_selinux_create_file_clear();
+         }
+ 
+         if (fd < 0) {
+-                if (i->type == WRITE_FILE && errno == ENOENT) {
+-                        log_debug_errno(errno, "Not writing missing file \"%s\": %m", path);
+-                        return 0;
++                /* Even on a read-only filesystem, open(2) returns EEXIST if the
++                 * file already exists. It returns EROFS only if it needs to
++                 * create the file. */
++                if (errno != EEXIST)
++                        return log_error_errno(errno, "Failed to create file %s: %m", path);
++
++                /* Re-open the file. At that point it must exist since open(2)
++                 * failed with EEXIST. We still need to check if the perms/mode
++                 * need to be changed. For read-only filesystems, we let
++                 * fd_set_perms() report the error if the perms need to be
++                 * modified. */
++                fd = openat(dir_fd, bn, O_NOFOLLOW|O_CLOEXEC|O_PATH, i->mode);
++                if (fd < 0)
++                        return log_error_errno(errno, "Failed to re-open file %s: %m", path);
++
++                if (fstat(fd, &stbuf) < 0)
++                        return log_error_errno(errno, "stat(%s) failed: %m", path);
++
++                if (!S_ISREG(stbuf.st_mode)) {
++                        log_error("%s exists and is not a regular file.", path);
++                        return -EEXIST;
+                 }
+-                if (i->type == CREATE_FILE && errno == EEXIST) {
+-                        log_debug_errno(errno, "Not writing to pre-existing file \"%s\": %m", path);
+-                        goto done;
++
++                st = &stbuf;
++        } else {
++
++                log_debug("\"%s\" has been created.", path);
++
++                if (i->argument) {
++                        log_debug("Writing to \"%s\".", path);
++
++                        r = loop_write(fd, i->argument, strlen(i->argument), false);
++                        if (r < 0)
++                                return log_error_errno(r, "Failed to write file \"%s\": %m", path);
+                 }
++        }
+ 
+-                r = -errno;
+-                if (!i->argument && errno == EROFS && stat(path, &st) == 0 &&
+-                    (i->type == CREATE_FILE || st.st_size == 0))
+-                        goto check_mode;
++        return fd_set_perms(i, fd, st);
++}
+ 
+-                return log_error_errno(r, "Failed to create file %s: %m", path);
++static int truncate_file(Item *i, const char *path) {
++        _cleanup_close_ int fd = -1, dir_fd = -1;
++        struct stat stbuf, *st = NULL;
++        bool erofs = false;
++        int r = 0;
++        char *bn;
++
++        assert(i);
++        assert(path);
++        assert(i->type == TRUNCATE_FILE);
++
++        /* We want to operate on regular file exclusively especially since
++         * O_TRUNC is unspecified if the file is neither a regular file nor a
++         * fifo nor a terminal device. Therefore we first open the file and make
++         * sure it's a regular one before truncating it. */
++
++        /* Validate the path and keep the fd on the directory for opening the
++         * file so we're sure that it can't be changed behind our back. */
++        dir_fd = path_open_parent_safe(path);
++        if (dir_fd < 0)
++                return dir_fd;
++
++        bn = basename(path);
++
++        RUN_WITH_UMASK(0000) {
++                mac_selinux_create_file_prepare(path, S_IFREG);
++                fd = openat(dir_fd, bn, O_CREAT|O_NOFOLLOW|O_NONBLOCK|O_CLOEXEC|O_WRONLY|O_NOCTTY, i->mode);
++                mac_selinux_create_file_clear();
+         }
+ 
+-        if (i->argument) {
+-                log_debug("%s to \"%s\".", i->type == CREATE_FILE ? "Appending" : "Writing", path);
++        if (fd < 0) {
++                if (errno != EROFS)
++                        return log_error_errno(errno, "Failed to open/create file %s: %m", path);
+ 
+-                r = loop_write(fd, i->argument, strlen(i->argument), false);
+-                if (r < 0)
+-                        return log_error_errno(r, "Failed to write file \"%s\": %m", path);
+-        } else
+-                log_debug("\"%s\" has been created.", path);
++                /* On a read-only filesystem, we don't want to fail if the
++                 * target is already empty and the perms are set. So we still
++                 * proceed with the sanity checks and let the remaining
++                 * operations fail with EROFS if they try to modify the target
++                 * file. */
++
++                fd = openat(dir_fd, bn, O_NOFOLLOW|O_CLOEXEC|O_PATH, i->mode);
++                if (fd < 0) {
++                        if (errno == ENOENT) {
++                                log_error("Cannot create file %s on a read-only file system.", path);
++                                return -EROFS;
++                        }
+ 
+-        fd = safe_close(fd);
++                        return log_error_errno(errno, "Failed to re-open file %s: %m", path);
++                }
+ 
+-done:
+-        if (stat(path, &st) < 0)
++                erofs = true;
++        }
++
++        if (fstat(fd, &stbuf) < 0)
+                 return log_error_errno(errno, "stat(%s) failed: %m", path);
+ 
+- check_mode:
+-        if (!S_ISREG(st.st_mode)) {
+-                log_error("%s is not a file.", path);
++        if (!S_ISREG(stbuf.st_mode)) {
++                log_error("%s exists and is not a regular file.", path);
+                 return -EEXIST;
+         }
+ 
+-        r = path_set_perms(i, path);
++        if (stbuf.st_size > 0) {
++                if (ftruncate(fd, 0) < 0) {
++                        r = erofs ? -EROFS : -errno;
++                        return log_error_errno(r, "Failed to truncate file %s: %m", path);
++                }
++        } else
++                st = &stbuf;
++
++        log_debug("\"%s\" has been created.", path);
++
++        if (i->argument) {
++                log_debug("Writing to \"%s\".", path);
++
++                r = loop_write(fd, i->argument, strlen(i->argument), false);
++                if (r < 0) {
++                        r = erofs ? -EROFS : r;
++                        return log_error_errno(r, "Failed to write file %s: %m", path);
++                }
++        }
++
++        return fd_set_perms(i, fd, st);
++}
++
++static int copy_files(Item *i) {
++        _cleanup_close_ int dfd = -1, fd = -1;
++        char *bn;
++        int r;
++
++        log_debug("Copying tree \"%s\" to \"%s\".", i->argument, i->path);
++
++        bn = basename(i->path);
++
++        /* Validate the path and use the returned directory fd for copying the
++         * target so we're sure that the path can't be changed behind our
++         * back. */
++        dfd = path_open_parent_safe(i->path);
++        if (dfd < 0)
++                return dfd;
++
++        r = copy_tree_at(AT_FDCWD, i->argument,
++                         dfd, bn,
++                         i->uid_set ? i->uid : UID_INVALID,
++                         i->gid_set ? i->gid : GID_INVALID,
++                         COPY_REFLINK);
++        if (r < 0) {
++                struct stat a, b;
++
++                /* If the target already exists on read-only filesystems, trying
++                 * to create the target will not fail with EEXIST but with
++                 * EROFS. */
++                if (r == -EROFS && faccessat(dfd, bn, F_OK, AT_SYMLINK_NOFOLLOW) == 0)
++                        r = -EEXIST;
++
++                if (r != -EEXIST)
++                        return log_error_errno(r, "Failed to copy files to %s: %m", i->path);
++
++                if (stat(i->argument, &a) < 0)
++                        return log_error_errno(errno, "stat(%s) failed: %m", i->argument);
++
++                if (fstatat(dfd, bn, &b, AT_SYMLINK_NOFOLLOW) < 0)
++                        return log_error_errno(errno, "stat(%s) failed: %m", i->path);
++
++                if ((a.st_mode ^ b.st_mode) & S_IFMT) {
++                        log_debug("Can't copy to %s, file exists already and is of different type", i->path);
++                        return 0;
++                }
++        }
++
++        fd = openat(dfd, bn, O_NOFOLLOW|O_CLOEXEC|O_PATH);
++        if (fd < 0)
++                return log_error_errno(errno, "Failed to openat(%s): %m", i->path);
++
++        return fd_set_perms(i, fd, NULL);
++}
++
++typedef enum {
++        CREATION_NORMAL,
++        CREATION_EXISTING,
++        CREATION_FORCE,
++        _CREATION_MODE_MAX,
++        _CREATION_MODE_INVALID = -1
++} CreationMode;
++
++static const char *creation_mode_verb_table[_CREATION_MODE_MAX] = {
++        [CREATION_NORMAL] = "Created",
++        [CREATION_EXISTING] = "Found existing",
++        [CREATION_FORCE] = "Created replacement",
++};
++
++DEFINE_PRIVATE_STRING_TABLE_LOOKUP_TO_STRING(creation_mode_verb, CreationMode);
++
++static int create_directory_or_subvolume(const char *path, mode_t mode, bool subvol) {
++        _cleanup_close_ int pfd = -1;
++        CreationMode creation;
++        int r;
++
++        assert(path);
++
++        pfd = path_open_parent_safe(path);
++        if (pfd < 0)
++                return pfd;
++
++        if (subvol) {
++                if (btrfs_is_subvol(empty_to_root(arg_root)) <= 0)
++
++                        /* Don't create a subvolume unless the root directory is
++                         * one, too. We do this under the assumption that if the
++                         * root directory is just a plain directory (i.e. very
++                         * light-weight), we shouldn't try to split it up into
++                         * subvolumes (i.e. more heavy-weight). Thus, chroot()
++                         * environments and suchlike will get a full brtfs
++                         * subvolume set up below their tree only if they
++                         * specifically set up a btrfs subvolume for the root
++                         * dir too. */
++
++                        subvol = false;
++                else {
++                        RUN_WITH_UMASK((~mode) & 0777)
++                                r = btrfs_subvol_make_fd(pfd, basename(path));
++                }
++        } else
++                r = 0;
++
++        if (!subvol || r == -ENOTTY)
++                RUN_WITH_UMASK(0000)
++                        r = mkdirat_label(pfd, basename(path), mode);
++
++        if (r < 0) {
++                int k;
++
++                if (!IN_SET(r, -EEXIST, -EROFS))
++                        return log_error_errno(r, "Failed to create directory or subvolume \"%s\": %m", path);
++
++                k = is_dir_fd(pfd);
++                if (k == -ENOENT && r == -EROFS)
++                        return log_error_errno(r, "%s does not exist and cannot be created as the file system is read-only.", path);
++                if (k < 0)
++                        return log_error_errno(k, "Failed to check if %s exists: %m", path);
++                if (!k) {
++                        log_warning("\"%s\" already exists and is not a directory.", path);
++                        return -EEXIST;
++                }
++
++                creation = CREATION_EXISTING;
++        } else
++                creation = CREATION_NORMAL;
++
++        log_debug("%s directory \"%s\".", creation_mode_verb_to_string(creation), path);
++
++        r = openat(pfd, basename(path), O_NOCTTY|O_CLOEXEC|O_DIRECTORY);
+         if (r < 0)
+-                return r;
++                return -errno;
++        return r;
++}
+ 
+-        return 0;
++static int create_directory(Item *i, const char *path) {
++        _cleanup_close_ int fd = -1;
++
++        assert(i);
++        assert(IN_SET(i->type, CREATE_DIRECTORY, TRUNCATE_DIRECTORY));
++
++        fd = create_directory_or_subvolume(path, i->mode, false);
++        if (fd == -EEXIST)
++                return 0;
++        if (fd < 0)
++                return fd;
++
++        return fd_set_perms(i, fd, NULL);
++}
++
++static int create_subvolume(Item *i, const char *path) {
++        _cleanup_close_ int fd = -1;
++        int r, q = 0;
++
++        assert(i);
++        assert(IN_SET(i->type, CREATE_SUBVOLUME, CREATE_SUBVOLUME_NEW_QUOTA, CREATE_SUBVOLUME_INHERIT_QUOTA));
++
++        fd = create_directory_or_subvolume(path, i->mode, true);
++        if (fd == -EEXIST)
++                return 0;
++        if (fd < 0)
++                return fd;
++
++        if (IN_SET(i->type, CREATE_SUBVOLUME_NEW_QUOTA, CREATE_SUBVOLUME_INHERIT_QUOTA)) {
++                r = btrfs_subvol_auto_qgroup_fd(fd, 0, i->type == CREATE_SUBVOLUME_NEW_QUOTA);
++                if (r == -ENOTTY)
++                        log_debug_errno(r, "Couldn't adjust quota for subvolume \"%s\" (unsupported fs or dir not a subvolume): %m", i->path);
++                else if (r == -EROFS)
++                        log_debug_errno(r, "Couldn't adjust quota for subvolume \"%s\" (fs is read-only).", i->path);
++                else if (r == -ENOPROTOOPT)
++                        log_debug_errno(r, "Couldn't adjust quota for subvolume \"%s\" (quota support is disabled).", i->path);
++                else if (r < 0)
++                        q = log_error_errno(r, "Failed to adjust quota for subvolume \"%s\": %m", i->path);
++                else if (r > 0)
++                        log_debug("Adjusted quota for subvolume \"%s\".", i->path);
++                else if (r == 0)
++                        log_debug("Quota for subvolume \"%s\" already in place, no change made.", i->path);
++        }
++
++        r = fd_set_perms(i, fd, NULL);
++        if (q < 0)
++                return q;
++
++        return r;
++}
++
++static int empty_directory(Item *i, const char *path) {
++        int r;
++
++        assert(i);
++        assert(i->type == EMPTY_DIRECTORY);
++
++        r = is_dir(path, false);
++        if (r == -ENOENT) {
++                /* Option "e" operates only on existing objects. Do not
++                 * print errors about non-existent files or directories */
++                log_debug("Skipping missing directory: %s", path);
++                return 0;
++        }
++        if (r < 0)
++                return log_error_errno(r, "is_dir() failed on path %s: %m", path);
++
++        return path_set_perms(i, path);
++}
++
++static int create_device(Item *i, mode_t file_type) {
++        _cleanup_close_ int dfd = -1, fd = -1;
++        CreationMode creation;
++        char *bn;
++        int r;
++
++        assert(i);
++        assert(IN_SET(file_type, S_IFBLK, S_IFCHR));
++
++        bn = basename(i->path);
++
++        /* Validate the path and use the returned directory fd for copying the
++         * target so we're sure that the path can't be changed behind our
++         * back. */
++        dfd = path_open_parent_safe(i->path);
++        if (dfd < 0)
++                return dfd;
++
++        RUN_WITH_UMASK(0000) {
++                mac_selinux_create_file_prepare(i->path, file_type);
++                r = mknodat(dfd, bn, i->mode | file_type, i->major_minor);
++                mac_selinux_create_file_clear();
++        }
++
++        if (r < 0) {
++                struct stat st;
++
++                if (errno == EPERM) {
++                        log_debug("We lack permissions, possibly because of cgroup configuration; "
++                                  "skipping creation of device node %s.", i->path);
++                        return 0;
++                }
++
++                if (errno != EEXIST)
++                        return log_error_errno(errno, "Failed to create device node %s: %m", i->path);
++
++                if (fstatat(dfd, bn, &st, 0) < 0)
++                        return log_error_errno(errno, "stat(%s) failed: %m", i->path);
++
++                if ((st.st_mode & S_IFMT) != file_type) {
++
++                        if (i->force) {
++
++                                RUN_WITH_UMASK(0000) {
++                                        mac_selinux_create_file_prepare(i->path, file_type);
++                                        /* FIXME: need to introduce mknodat_atomic() */
++                                        r = mknod_atomic(i->path, i->mode | file_type, i->major_minor);
++                                        mac_selinux_create_file_clear();
++                                }
++
++                                if (r < 0)
++                                        return log_error_errno(r, "Failed to create device node \"%s\": %m", i->path);
++                                creation = CREATION_FORCE;
++                        } else {
++                                log_debug("%s is not a device node.", i->path);
++                                return 0;
++                        }
++                } else
++                        creation = CREATION_EXISTING;
++        } else
++                creation = CREATION_NORMAL;
++
++        log_debug("%s %s device node \"%s\" %u:%u.",
++                  creation_mode_verb_to_string(creation),
++                  i->type == CREATE_BLOCK_DEVICE ? "block" : "char",
++                  i->path, major(i->mode), minor(i->mode));
++
++        fd = openat(dfd, bn, O_NOFOLLOW|O_CLOEXEC|O_PATH);
++        if (fd < 0)
++                return log_error_errno(errno, "Failed to openat(%s): %m", i->path);
++
++        return fd_set_perms(i, fd, NULL);
++}
++
++static int create_fifo(Item *i, const char *path) {
++        _cleanup_close_ int pfd = -1, fd = -1;
++        CreationMode creation;
++        struct stat st;
++        char *bn;
++        int r;
++
++        pfd = path_open_parent_safe(path);
++        if (pfd < 0)
++                return pfd;
++
++        bn = basename(path);
++
++        RUN_WITH_UMASK(0000) {
++                mac_selinux_create_file_prepare(path, S_IFIFO);
++                r = mkfifoat(pfd, bn, i->mode);
++                mac_selinux_create_file_clear();
++        }
++
++        if (r < 0) {
++                if (errno != EEXIST)
++                        return log_error_errno(errno, "Failed to create fifo %s: %m", path);
++
++                if (fstatat(pfd, bn, &st, AT_SYMLINK_NOFOLLOW) < 0)
++                        return log_error_errno(errno, "stat(%s) failed: %m", path);
++
++                if (!S_ISFIFO(st.st_mode)) {
++
++                        if (i->force) {
++                                RUN_WITH_UMASK(0000) {
++                                        mac_selinux_create_file_prepare(path, S_IFIFO);
++                                        r = mkfifoat_atomic(pfd, bn, i->mode);
++                                        mac_selinux_create_file_clear();
++                                }
++
++                                if (r < 0)
++                                        return log_error_errno(r, "Failed to create fifo %s: %m", path);
++                                creation = CREATION_FORCE;
++                        } else {
++                                log_warning("\"%s\" already exists and is not a fifo.", path);
++                                return 0;
++                        }
++                } else
++                        creation = CREATION_EXISTING;
++        } else
++                creation = CREATION_NORMAL;
++
++        log_debug("%s fifo \"%s\".", creation_mode_verb_to_string(creation), path);
++
++        fd = openat(pfd, bn, O_NOFOLLOW|O_CLOEXEC|O_PATH);
++        if (fd < 0)
++                return log_error_errno(fd, "Failed to openat(%s): %m", path);
++
++        return fd_set_perms(i, fd, NULL);
+ }
+ 
+ typedef int (*action_t)(Item *, const char *);
+ typedef int (*fdaction_t)(Item *, int fd, const struct stat *st);
+ 
+-static int item_do(Item *i, int fd, const struct stat *st, fdaction_t action) {
++static int item_do(Item *i, int fd, fdaction_t action) {
++        struct stat st;
+         int r = 0, q;
+ 
+         assert(i);
+         assert(fd >= 0);
+-        assert(st);
++
++        if (fstat(fd, &st) < 0) {
++                r = -errno;
++                goto finish;
++        }
+ 
+         /* This returns the first error we run into, but nevertheless
+          * tries to go on */
+-        r = action(i, fd, st);
++        r = action(i, fd, &st);
+ 
+-        if (S_ISDIR(st->st_mode)) {
++        if (S_ISDIR(st.st_mode)) {
+                 char procfs_path[strlen("/proc/self/fd/") + DECIMAL_STR_MAX(int)];
+                 _cleanup_closedir_ DIR *d = NULL;
+                 struct dirent *de;
+@@ -1349,16 +1854,15 @@ static int item_do(Item *i, int fd, const struct stat *st, fdaction_t action) {
+                 }
+ 
+                 FOREACH_DIRENT_ALL(de, d, q = -errno; goto finish) {
+-                        struct stat de_st;
+                         int de_fd;
+ 
+                         if (dot_or_dot_dot(de->d_name))
+                                 continue;
+ 
+                         de_fd = openat(fd, de->d_name, O_NOFOLLOW|O_CLOEXEC|O_PATH);
+-                        if (de_fd >= 0 && fstat(de_fd, &de_st) >= 0)
++                        if (de_fd >= 0)
+                                 /* pass ownership of dirent fd over  */
+-                                q = item_do(i, de_fd, &de_st, action);
++                                q = item_do(i, de_fd, action);
+                         else
+                                 q = -errno;
+ 
+@@ -1406,7 +1910,6 @@ static int glob_item_recursively(Item *i, fdaction_t action) {
+ 
+         STRV_FOREACH(fn, g.gl_pathv) {
+                 _cleanup_close_ int fd = -1;
+-                struct stat st;
+ 
+                 /* Make sure we won't trigger/follow file object (such as
+                  * device nodes, automounts, ...) pointed out by 'fn' with
+@@ -1419,12 +1922,7 @@ static int glob_item_recursively(Item *i, fdaction_t action) {
+                         continue;
+                 }
+ 
+-                if (fstat(fd, &st) < 0) {
+-                        r = r ?: -errno;
+-                        continue;
+-                }
+-
+-                k = item_do(i, fd, &st, action);
++                k = item_do(i, fd, action);
+                 if (k < 0 && r == 0)
+                         r = k;
+ 
+@@ -1435,27 +1933,9 @@ static int glob_item_recursively(Item *i, fdaction_t action) {
+         return r;
+ }
+ 
+-typedef enum {
+-        CREATION_NORMAL,
+-        CREATION_EXISTING,
+-        CREATION_FORCE,
+-        _CREATION_MODE_MAX,
+-        _CREATION_MODE_INVALID = -1
+-} CreationMode;
+-
+-static const char *creation_mode_verb_table[_CREATION_MODE_MAX] = {
+-        [CREATION_NORMAL] = "Created",
+-        [CREATION_EXISTING] = "Found existing",
+-        [CREATION_FORCE] = "Created replacement",
+-};
+-
+-DEFINE_PRIVATE_STRING_TABLE_LOOKUP_TO_STRING(creation_mode_verb, CreationMode);
+-
+ static int create_item(Item *i) {
+-        struct stat st;
+-        int r = 0;
+-        int q = 0;
+         CreationMode creation;
++        int r = 0;
+ 
+         assert(i);
+ 
+@@ -1470,51 +1950,31 @@ static int create_item(Item *i) {
+                 return 0;
+ 
+         case CREATE_FILE:
+-        case TRUNCATE_FILE:
+                 RUN_WITH_UMASK(0000)
+                         (void) mkdir_parents_label(i->path, 0755);
+ 
+-                r = write_one_file(i, i->path);
++                r = create_file(i, i->path);
+                 if (r < 0)
+                         return r;
+                 break;
+ 
+-        case COPY_FILES: {
+-
++        case TRUNCATE_FILE:
+                 RUN_WITH_UMASK(0000)
+                         (void) mkdir_parents_label(i->path, 0755);
+ 
+-                log_debug("Copying tree \"%s\" to \"%s\".", i->argument, i->path);
+-                r = copy_tree(i->argument, i->path,
+-                              i->uid_set ? i->uid : UID_INVALID,
+-                              i->gid_set ? i->gid : GID_INVALID,
+-                              COPY_REFLINK);
+-
+-                if (r == -EROFS && stat(i->path, &st) == 0)
+-                        r = -EEXIST;
+-
+-                if (r < 0) {
+-                        struct stat a, b;
+-
+-                        if (r != -EEXIST)
+-                                return log_error_errno(r, "Failed to copy files to %s: %m", i->path);
+-
+-                        if (stat(i->argument, &a) < 0)
+-                                return log_error_errno(errno, "stat(%s) failed: %m", i->argument);
++                r = truncate_file(i, i->path);
++                if (r < 0)
++                        return r;
++                break;
+ 
+-                        if (stat(i->path, &b) < 0)
+-                                return log_error_errno(errno, "stat(%s) failed: %m", i->path);
++        case COPY_FILES: {
+ 
+-                        if ((a.st_mode ^ b.st_mode) & S_IFMT) {
+-                                log_debug("Can't copy to %s, file exists already and is of different type", i->path);
+-                                return 0;
+-                        }
+-                }
++                RUN_WITH_UMASK(0000)
++                        (void) mkdir_parents_label(i->path, 0755);
+ 
+-                r = path_set_perms(i, i->path);
++                r = copy_files(i);
+                 if (r < 0)
+                         return r;
+-
+                 break;
+ 
+         case WRITE_FILE:
+@@ -1526,132 +1986,39 @@ static int create_item(Item *i) {
+ 
+         case CREATE_DIRECTORY:
+         case TRUNCATE_DIRECTORY:
++                RUN_WITH_UMASK(0000)
++                        (void) mkdir_parents_label(i->path, 0755);
++
++                r = create_directory(i, i->path);
++                if (r < 0)
++                        return r;
++                break;
++
+         case CREATE_SUBVOLUME:
+         case CREATE_SUBVOLUME_INHERIT_QUOTA:
+         case CREATE_SUBVOLUME_NEW_QUOTA:
+                 RUN_WITH_UMASK(0000)
+                         (void) mkdir_parents_label(i->path, 0755);
+ 
+-                if (IN_SET(i->type, CREATE_SUBVOLUME, CREATE_SUBVOLUME_INHERIT_QUOTA, CREATE_SUBVOLUME_NEW_QUOTA)) {
+-
+-                        if (btrfs_is_subvol(isempty(arg_root) ? "/" : arg_root) <= 0)
+-
+-                                /* Don't create a subvolume unless the
+-                                 * root directory is one, too. We do
+-                                 * this under the assumption that if
+-                                 * the root directory is just a plain
+-                                 * directory (i.e. very light-weight),
+-                                 * we shouldn't try to split it up
+-                                 * into subvolumes (i.e. more
+-                                 * heavy-weight). Thus, chroot()
+-                                 * environments and suchlike will get
+-                                 * a full brtfs subvolume set up below
+-                                 * their tree only if they
+-                                 * specifically set up a btrfs
+-                                 * subvolume for the root dir too. */
+-
+-                                r = -ENOTTY;
+-                        else {
+-                                RUN_WITH_UMASK((~i->mode) & 0777)
+-                                        r = btrfs_subvol_make(i->path);
+-                        }
+-                } else
+-                        r = 0;
+-
+-                if (IN_SET(i->type, CREATE_DIRECTORY, TRUNCATE_DIRECTORY) || r == -ENOTTY)
+-                        RUN_WITH_UMASK(0000)
+-                                r = mkdir_label(i->path, i->mode);
+-
+-                if (r < 0) {
+-                        int k;
+-
+-                        if (!IN_SET(r, -EEXIST, -EROFS))
+-                                return log_error_errno(r, "Failed to create directory or subvolume \"%s\": %m", i->path);
+-
+-                        k = is_dir(i->path, false);
+-                        if (k == -ENOENT && r == -EROFS)
+-                                return log_error_errno(r, "%s does not exist and cannot be created as the file system is read-only.", i->path);
+-                        if (k < 0)
+-                                return log_error_errno(k, "Failed to check if %s exists: %m", i->path);
+-                        if (!k) {
+-                                log_warning("\"%s\" already exists and is not a directory.", i->path);
+-                                return 0;
+-                        }
+-
+-                        creation = CREATION_EXISTING;
+-                } else
+-                        creation = CREATION_NORMAL;
+-
+-                log_debug("%s directory \"%s\".", creation_mode_verb_to_string(creation), i->path);
+-
+-                if (IN_SET(i->type, CREATE_SUBVOLUME_NEW_QUOTA, CREATE_SUBVOLUME_INHERIT_QUOTA)) {
+-                        r = btrfs_subvol_auto_qgroup(i->path, 0, i->type == CREATE_SUBVOLUME_NEW_QUOTA);
+-                        if (r == -ENOTTY)
+-                                log_debug_errno(r, "Couldn't adjust quota for subvolume \"%s\" (unsupported fs or dir not a subvolume): %m", i->path);
+-                        else if (r == -EROFS)
+-                                log_debug_errno(r, "Couldn't adjust quota for subvolume \"%s\" (fs is read-only).", i->path);
+-                        else if (r == -ENOPROTOOPT)
+-                                log_debug_errno(r, "Couldn't adjust quota for subvolume \"%s\" (quota support is disabled).", i->path);
+-                        else if (r < 0)
+-                                q = log_error_errno(r, "Failed to adjust quota for subvolume \"%s\": %m", i->path);
+-                        else if (r > 0)
+-                                log_debug("Adjusted quota for subvolume \"%s\".", i->path);
+-                        else if (r == 0)
+-                                log_debug("Quota for subvolume \"%s\" already in place, no change made.", i->path);
+-                }
++                r = create_subvolume(i, i->path);
++                if (r < 0)
++                        return r;
++                break;
+ 
+-                _fallthrough_;
+         case EMPTY_DIRECTORY:
+-                r = path_set_perms(i, i->path);
+-                if (q < 0)
+-                        return q;
++                r = empty_directory(i, i->path);
+                 if (r < 0)
+                         return r;
+ 
+                 break;
+ 
+         case CREATE_FIFO:
+-                RUN_WITH_UMASK(0000) {
++                RUN_WITH_UMASK(0000)
+                         (void) mkdir_parents_label(i->path, 0755);
+ 
+-                        mac_selinux_create_file_prepare(i->path, S_IFIFO);
+-                        r = mkfifo(i->path, i->mode);
+-                        mac_selinux_create_file_clear();
+-                }
+-
+-                if (r < 0) {
+-                        if (errno != EEXIST)
+-                                return log_error_errno(errno, "Failed to create fifo %s: %m", i->path);
+-
+-                        if (lstat(i->path, &st) < 0)
+-                                return log_error_errno(errno, "stat(%s) failed: %m", i->path);
+-
+-                        if (!S_ISFIFO(st.st_mode)) {
+-
+-                                if (i->force) {
+-                                        RUN_WITH_UMASK(0000) {
+-                                                mac_selinux_create_file_prepare(i->path, S_IFIFO);
+-                                                r = mkfifo_atomic(i->path, i->mode);
+-                                                mac_selinux_create_file_clear();
+-                                        }
+-
+-                                        if (r < 0)
+-                                                return log_error_errno(r, "Failed to create fifo %s: %m", i->path);
+-                                        creation = CREATION_FORCE;
+-                                } else {
+-                                        log_warning("\"%s\" already exists and is not a fifo.", i->path);
+-                                        return 0;
+-                                }
+-                        } else
+-                                creation = CREATION_EXISTING;
+-                } else
+-                        creation = CREATION_NORMAL;
+-                log_debug("%s fifo \"%s\".", creation_mode_verb_to_string(creation), i->path);
+-
+-                r = path_set_perms(i, i->path);
++                r = create_fifo(i, i->path);
+                 if (r < 0)
+                         return r;
+-
+                 break;
+         }
+ 
+@@ -1704,9 +2071,7 @@ static int create_item(Item *i) {
+         }
+ 
+         case CREATE_BLOCK_DEVICE:
+-        case CREATE_CHAR_DEVICE: {
+-                mode_t file_type;
+-
++        case CREATE_CHAR_DEVICE:
+                 if (have_effective_cap(CAP_MKNOD) == 0) {
+                         /* In a container we lack CAP_MKNOD. We
+                         shouldn't attempt to create the device node in
+@@ -1720,60 +2085,11 @@ static int create_item(Item *i) {
+                 RUN_WITH_UMASK(0000)
+                         (void) mkdir_parents_label(i->path, 0755);
+ 
+-                file_type = i->type == CREATE_BLOCK_DEVICE ? S_IFBLK : S_IFCHR;
+-
+-                RUN_WITH_UMASK(0000) {
+-                        mac_selinux_create_file_prepare(i->path, file_type);
+-                        r = mknod(i->path, i->mode | file_type, i->major_minor);
+-                        mac_selinux_create_file_clear();
+-                }
+-
+-                if (r < 0) {
+-                        if (errno == EPERM) {
+-                                log_debug("We lack permissions, possibly because of cgroup configuration; "
+-                                          "skipping creation of device node %s.", i->path);
+-                                return 0;
+-                        }
+-
+-                        if (errno != EEXIST)
+-                                return log_error_errno(errno, "Failed to create device node %s: %m", i->path);
+-
+-                        if (lstat(i->path, &st) < 0)
+-                                return log_error_errno(errno, "stat(%s) failed: %m", i->path);
+-
+-                        if ((st.st_mode & S_IFMT) != file_type) {
+-
+-                                if (i->force) {
+-
+-                                        RUN_WITH_UMASK(0000) {
+-                                                mac_selinux_create_file_prepare(i->path, file_type);
+-                                                r = mknod_atomic(i->path, i->mode | file_type, i->major_minor);
+-                                                mac_selinux_create_file_clear();
+-                                        }
+-
+-                                        if (r < 0)
+-                                                return log_error_errno(r, "Failed to create device node \"%s\": %m", i->path);
+-                                        creation = CREATION_FORCE;
+-                                } else {
+-                                        log_debug("%s is not a device node.", i->path);
+-                                        return 0;
+-                                }
+-                        } else
+-                                creation = CREATION_EXISTING;
+-                } else
+-                        creation = CREATION_NORMAL;
+-
+-                log_debug("%s %s device node \"%s\" %u:%u.",
+-                          creation_mode_verb_to_string(creation),
+-                          i->type == CREATE_BLOCK_DEVICE ? "block" : "char",
+-                          i->path, major(i->mode), minor(i->mode));
+-
+-                r = path_set_perms(i, i->path);
++                r = create_device(i, i->type == CREATE_BLOCK_DEVICE ? S_IFBLK : S_IFCHR);
+                 if (r < 0)
+                         return r;
+ 
+                 break;
+-        }
+ 
+         case ADJUST_MODE:
+         case RELABEL_PATH:
+-- 
+2.11.0
+
diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
index b53221896f..1d9fcf0bd7 100644
--- a/meta/recipes-core/systemd/systemd_237.bb
+++ b/meta/recipes-core/systemd/systemd_237.bb
@@ -61,6 +61,8 @@ SRC_URI += "file://touchscreen.rules \
            file://0025-journald-set-a-limit-on-the-number-of-fields-1k.patch \
            file://0026-journal-remote-set-a-limit-on-the-number-of-fields-i.patch \
            file://0027-journal-fix-out-of-bounds-read-CVE-2018-16866.patch \
+           file://0001-tmpfiles-don-t-resolve-pathnames-when-traversing-rec.patch \
+           file://0002-Make-tmpfiles-safe.patch \
            "
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
-- 
2.11.0


