Return-Path: <purushottamchoudhary29@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E54CC433F5
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 13:08:00 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web08.11419.1642770472436099680
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 05:07:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ns6X+mNO;
 spf=pass (domain: gmail.com, ip: 209.85.216.51,
 mailfrom: purushottamchoudhary29@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id l16so9311302pjl.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 05:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=mYXrbsVLIVS1bc8I/Y8P4F33iOfyCEv2koKzynwHSAg=;
        b=Ns6X+mNO1XL3/G76r0RzOa+qxj/KFbY7VWgnmp4J9C6kH2XT5H+ilJgq8MxyC9UJjq
         NG94vDv+gpFv0TfIz1dyfEu4nssprkYXqJzuahfaU7PGQVGPtorjXSxQp+7DzkPXYNQH
         vi1URBsP1CDKCjDgK+gXkZnIm9fKCsO1KMt8BJOwxhZ02BgErwSWGwre66I8AsRlpgqT
         JLGUwVoO6s/hzXHMyHeCCoJR3+nmLbdyt1BTgNQ9D9d6u9bgUgA0sbeqZ5nU+ilzQ2Mk
         CoqILMYqjGLCYG7Uoe//b7jspb/0Z4I7oASQiL+XnHq/XEmq1Th23qhzLmhtCh74pX4y
         4Zag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mYXrbsVLIVS1bc8I/Y8P4F33iOfyCEv2koKzynwHSAg=;
        b=orjXI8VYEDlXOKU/4f4XCdZzdHsQr4wPVbFz38/fkzBKmIiqltsOpWIAmupZP8HUOq
         XvZkTdz70h956zRuuqrXaD/vL7lG9ln4CJx+jrFE89tGf24KemyWd980GH9DshqmWO6c
         78u4rW/NT8MZWA+ToOdnnr3g3iFwxU2jC+WZyU1k19yEA5FutF9FXbx83zAy+dU3iGLi
         ThqC6MqiPq89w0GSZBzBC6L8p7D7BlnflT+JXn7EZP64VBIEolg9Td5aeptmuYz21lov
         as/SNTzFPyP5TJ4IR4HuHVgHTNkHAgjgnW4Sq/lYX6q6hoV9LzewfJmsZ12J5Z7IqwRv
         nIMw==
X-Gm-Message-State: AOAM530SoYybvvXqUGP2Ntekz4Hlgv3rIc1CLcEVdCJA/IR0uoysr2N0
	/n3JQ3iSHFrOD1rGjZolyf77kzqSZtWHbw==
X-Google-Smtp-Source: 
 ABdhPJzaW0MwLQ+dBnLmhf3cAR2m9t6nWCaaw53xyzxUiPx9e9QD+8VTB5mupyeZIPNG07oD/3Wx0Q==
X-Received: by 2002:a17:902:8693:b0:148:a2e8:278d with SMTP id
 g19-20020a170902869300b00148a2e8278dmr3479964plo.148.1642770471220;
        Fri, 21 Jan 2022 05:07:51 -0800 (PST)
Received: from localhost.localdomain
 ([2405:201:a410:a06c:fcc7:e7a9:a2ac:7bc5])
        by smtp.gmail.com with ESMTPSA id
 189sm6495016pfe.164.2022.01.21.05.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 05:07:50 -0800 (PST)
From: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Purushottam Choudhary <purushottam.choudhary@kpit.com>
Subject: [OE-core][dunfell][PATCH] systemd: Fix CVE-2021-3997
Date: Fri, 21 Jan 2022 18:37:33 +0530
Message-Id: <20220121130733.13839-1-purushottamchoudhary29@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 13:08:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160823

Add patches to fix CVE-2021-3997.

Add additional below mentioned patches which are
required to fix CVE:
1. rm-rf-optionally-fsync-after-removing-directory-tree.patch
2. rm-rf-refactor-rm-rf-children-split-out-body-of-directory.patch
Link: http://archive.ubuntu.com/ubuntu/pool/main/s/systemd/systemd_245.4-4ubuntu3.15.debian.tar.xz

Signed-off-by: Purushottam Choudhary <purushottam.choudhary@kpit.com>
Signed-off-by: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
---
 .../systemd/systemd/CVE-2021-3997-1.patch     |  65 ++++
 .../systemd/systemd/CVE-2021-3997-2.patch     | 101 ++++++
 .../systemd/systemd/CVE-2021-3997-3.patch     | 266 +++++++++++++++
 ...-fsync-after-removing-directory-tree.patch |  35 ++
 ...children-split-out-body-of-directory.patch | 318 ++++++++++++++++++
 meta/recipes-core/systemd/systemd_244.5.bb    |   5 +
 6 files changed, 790 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2021-3997-1.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2021-3997-2.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2021-3997-3.patch
 create mode 100644 meta/recipes-core/systemd/systemd/rm-rf-optionally-fsync-after-removing-directory-tree.patch
 create mode 100644 meta/recipes-core/systemd/systemd/rm-rf-refactor-rm-rf-children-split-out-body-of-directory.patch

diff --git a/meta/recipes-core/systemd/systemd/CVE-2021-3997-1.patch b/meta/recipes-core/systemd/systemd/CVE-2021-3997-1.patch
new file mode 100644
index 0000000000..341976822b
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2021-3997-1.patch
@@ -0,0 +1,65 @@
+Backport of the following upstream commit:
+From fbb77e1e55866633c9f064e2b3bcf2b6402d962d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Tue, 23 Nov 2021 15:55:45 +0100
+Subject: [PATCH 1/3] shared/rm_rf: refactor rm_rf_children_inner() to shorten
+ code a bit
+
+CVE: CVE-2021-3997
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/s/systemd/systemd_245.4-4ubuntu3.15.debian.tar.xz]
+Signed-off-by: Purushottam Choudhary <Purushottam.Choudhary@kpit.com>
+---
+ src/basic/rm-rf.c | 27 +++++++++------------------
+ 1 file changed, 9 insertions(+), 18 deletions(-)
+
+--- a/src/basic/rm-rf.c
++++ b/src/basic/rm-rf.c
+@@ -34,7 +34,7 @@
+                 const struct stat *root_dev) {
+ 
+         struct stat st;
+-        int r;
++        int r, q = 0;
+ 
+         assert(fd >= 0);
+         assert(fname);
+@@ -50,7 +50,6 @@
+ 
+         if (is_dir) {
+                 _cleanup_close_ int subdir_fd = -1;
+-                int q;
+ 
+                 /* if root_dev is set, remove subdirectories only if device is same */
+                 if (root_dev && st.st_dev != root_dev->st_dev)
+@@ -86,23 +85,15 @@
+                  * again for each directory */
+                 q = rm_rf_children(TAKE_FD(subdir_fd), flags | REMOVE_PHYSICAL, root_dev);
+ 
+-                r = unlinkat(fd, fname, AT_REMOVEDIR);
+-                if (r < 0)
+-                        return r;
+-                if (q < 0)
+-                        return q;
+-
+-                return 1;
+-
+-        } else if (!(flags & REMOVE_ONLY_DIRECTORIES)) {
+-                r = unlinkat(fd, fname, 0);
+-                if (r < 0)
+-                        return r;
+-
+-                return 1;
+-        }
++        } else if (flags & REMOVE_ONLY_DIRECTORIES)
++                return 0;
+ 
+-        return 0;
++        r = unlinkat(fd, fname, is_dir ? AT_REMOVEDIR : 0);
++        if (r < 0)
++                return r;
++        if (q < 0)
++                return q;
++        return 1;
+ }
+ 
+ int rm_rf_children(
diff --git a/meta/recipes-core/systemd/systemd/CVE-2021-3997-2.patch b/meta/recipes-core/systemd/systemd/CVE-2021-3997-2.patch
new file mode 100644
index 0000000000..066e10fbbc
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2021-3997-2.patch
@@ -0,0 +1,101 @@
+Backport of the following upstream commit:
+From bd0127daaaae009ade053718f7d2f297aee4acaf Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Tue, 23 Nov 2021 16:56:42 +0100
+Subject: [PATCH 2/3] shared/rm_rf: refactor rm_rf() to shorten code a bit
+
+CVE: CVE-2021-3997
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/s/systemd/systemd_245.4-4ubuntu3.15.debian.tar.xz]
+Signed-off-by: Purushottam Choudhary <Purushottam.Choudhary@kpit.com>
+---
+ src/basic/rm-rf.c | 53 ++++++++++++++++++++--------------------------
+ 1 file changed, 23 insertions(+), 30 deletions(-)
+
+--- a/src/basic/rm-rf.c
++++ b/src/basic/rm-rf.c
+@@ -159,7 +159,7 @@
+ }
+ 
+ int rm_rf(const char *path, RemoveFlags flags) {
+-        int fd, r;
++        int fd, r, q = 0;
+ 
+         assert(path);
+ 
+@@ -191,49 +191,47 @@
+         }
+ 
+         fd = open(path, O_RDONLY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC|O_NOFOLLOW|O_NOATIME);
+-        if (fd < 0) {
++        if (fd >= 0) {
++                /* We have a dir */
++                r = rm_rf_children(fd, flags, NULL);
++
++                if (FLAGS_SET(flags, REMOVE_ROOT)) {
++                        q = rmdir(path);
++                        if (q < 0)
++                                q = -errno;
++                }
++        } else {
+                 if (FLAGS_SET(flags, REMOVE_MISSING_OK) && errno == ENOENT)
+                         return 0;
+ 
+                 if (!IN_SET(errno, ENOTDIR, ELOOP))
+                         return -errno;
+ 
+-                if (FLAGS_SET(flags, REMOVE_ONLY_DIRECTORIES))
++                if (FLAGS_SET(flags, REMOVE_ONLY_DIRECTORIES) || !FLAGS_SET(flags, REMOVE_ROOT))
+                         return 0;
+ 
+-                if (FLAGS_SET(flags, REMOVE_ROOT)) {
+-
+-                        if (!FLAGS_SET(flags, REMOVE_PHYSICAL)) {
+-                                struct statfs s;
+-
+-                                if (statfs(path, &s) < 0)
+-                                        return -errno;
+-                                if (is_physical_fs(&s))
+-                                        return log_error_errno(SYNTHETIC_ERRNO(EPERM),
+-                                                               "Attempted to remove files from a disk file system under \"%s\", refusing.",
+-                                                               path);
+-                        }
+-
+-                        if (unlink(path) < 0) {
+-                                if (FLAGS_SET(flags, REMOVE_MISSING_OK) && errno == ENOENT)
+-                                        return 0;
++                if (!FLAGS_SET(flags, REMOVE_PHYSICAL)) {
++                        struct statfs s;
+ 
++                        if (statfs(path, &s) < 0)
+                                 return -errno;
+-                        }
++                        if (is_physical_fs(&s))
++                                return log_error_errno(SYNTHETIC_ERRNO(EPERM),
++                                                       "Attempted to remove files from a disk file system under \"%s\", refusing.",
++                                                       path);
+                 }
+ 
+-                return 0;
++                r = 0;
++                q = unlink(path);
++                if (q < 0)
++                        q = -errno;
+         }
+ 
+-        r = rm_rf_children(fd, flags, NULL);
+-
+-        if (FLAGS_SET(flags, REMOVE_ROOT) &&
+-            rmdir(path) < 0 &&
+-            r >= 0 &&
+-            (!FLAGS_SET(flags, REMOVE_MISSING_OK) || errno != ENOENT))
+-                r = -errno;
+-
+-        return r;
++        if (r < 0)
++                return r;
++        if (q < 0 && (q != -ENOENT || !FLAGS_SET(flags, REMOVE_MISSING_OK)))
++                return q;
++        return 0;
+ }
+ 
+ int rm_rf_child(int fd, const char *name, RemoveFlags flags) {
diff --git a/meta/recipes-core/systemd/systemd/CVE-2021-3997-3.patch b/meta/recipes-core/systemd/systemd/CVE-2021-3997-3.patch
new file mode 100644
index 0000000000..c96b8d9a6e
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2021-3997-3.patch
@@ -0,0 +1,266 @@
+Backport of the following upstream commit:
+From bef8e8e577368697b2e6f85183b1dbc99e0e520f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Tue, 30 Nov 2021 22:29:05 +0100
+Subject: [PATCH 3/3] shared/rm-rf: loop over nested directories instead of
+ instead of recursing
+
+To remove directory structures, we need to remove the innermost items first,
+and then recursively remove higher-level directories. We would recursively
+descend into directories and invoke rm_rf_children and rm_rm_children_inner.
+This is problematic when too many directories are nested.
+
+Instead, let's create a "TODO" queue. In the the queue, for each level we
+hold the DIR* object we were working on, and the name of the directory. This
+allows us to leave a partially-processed directory, and restart the removal
+loop one level down. When done with the inner directory, we use the name to
+unlinkat() it from the parent, and proceed with the removal of other items.
+
+Because the nesting is increased by one level, it is best to view this patch
+with -b/--ignore-space-change.
+
+This fixes CVE-2021-3997, https://bugzilla.redhat.com/show_bug.cgi?id=2024639.
+The issue was reported and patches reviewed by Qualys Team.
+Mauro Matteo Cascella and Riccardo Schirone from Red Hat handled the disclosure.
+
+CVE: CVE-2021-3997
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/s/systemd/systemd_245.4-4ubuntu3.15.debian.tar.xz]
+Signed-off-by: Purushottam Choudhary <Purushottam.Choudhary@kpit.com>
+---
+ src/basic/rm-rf.c | 161 +++++++++++++++++++++++++++++++--------------
+ 1 file changed, 113 insertions(+), 48 deletions(-)
+
+--- a/src/basic/rm-rf.c
++++ b/src/basic/rm-rf.c
+@@ -26,12 +26,13 @@
+         return !is_temporary_fs(sfs) && !is_cgroup_fs(sfs);
+ }
+ 
+-static int rm_rf_children_inner(
++static int rm_rf_inner_child(
+                 int fd,
+                 const char *fname,
+                 int is_dir,
+                 RemoveFlags flags,
+-                const struct stat *root_dev) {
++                const struct stat *root_dev,
++                bool allow_recursion) {
+ 
+         struct stat st;
+         int r, q = 0;
+@@ -49,9 +50,7 @@
+         }
+ 
+         if (is_dir) {
+-                _cleanup_close_ int subdir_fd = -1;
+-
+-                /* if root_dev is set, remove subdirectories only if device is same */
++                /* If root_dev is set, remove subdirectories only if device is same */
+                 if (root_dev && st.st_dev != root_dev->st_dev)
+                         return 0;
+ 
+@@ -63,7 +62,6 @@
+                         return 0;
+ 
+                 if ((flags & REMOVE_SUBVOLUME) && st.st_ino == 256) {
+-
+                         /* This could be a subvolume, try to remove it */
+ 
+                         r = btrfs_subvol_remove_fd(fd, fname, BTRFS_REMOVE_RECURSIVE|BTRFS_REMOVE_QUOTA);
+@@ -77,13 +75,16 @@
+                                 return 1;
+                 }
+ 
+-                subdir_fd = openat(fd, fname, O_RDONLY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC|O_NOFOLLOW|O_NOATIME);
++                if (!allow_recursion)
++                        return -EISDIR;
++
++                int subdir_fd = openat(fd, fname, O_RDONLY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC|O_NOFOLLOW|O_NOATIME);
+                 if (subdir_fd < 0)
+                         return -errno;
+ 
+                 /* We pass REMOVE_PHYSICAL here, to avoid doing the fstatfs() to check the file system type
+                  * again for each directory */
+-                q = rm_rf_children(TAKE_FD(subdir_fd), flags | REMOVE_PHYSICAL, root_dev);
++                q = rm_rf_children(subdir_fd, flags | REMOVE_PHYSICAL, root_dev);
+ 
+         } else if (flags & REMOVE_ONLY_DIRECTORIES)
+                 return 0;
+@@ -96,64 +97,128 @@
+         return 1;
+ }
+ 
++typedef struct TodoEntry {
++        DIR *dir;         /* A directory that we were operating on. */
++        char *dirname;    /* The filename of that directory itself. */
++} TodoEntry;
++
++static void free_todo_entries(TodoEntry **todos) {
++        for (TodoEntry *x = *todos; x && x->dir; x++) {
++                closedir(x->dir);
++                free(x->dirname);
++        }
++
++        freep(todos);
++}
++
+ int rm_rf_children(
+                 int fd,
+                 RemoveFlags flags,
+                 const struct stat *root_dev) {
+ 
+-        _cleanup_closedir_ DIR *d = NULL;
+-        struct dirent *de;
++        _cleanup_(free_todo_entries) TodoEntry *todos = NULL;
++        size_t n_todo = 0, allocated = 0;
++        _cleanup_free_ char *dirname = NULL; /* Set when we are recursing and want to delete ourselves */
+         int ret = 0, r;
+ 
+-        assert(fd >= 0);
++        /* Return the first error we run into, but nevertheless try to go on.
++         * The passed fd is closed in all cases, including on failure. */
+ 
+-        /* This returns the first error we run into, but nevertheless tries to go on. This closes the passed
+-         * fd, in all cases, including on failure. */
++        for (;;) {  /* This loop corresponds to the directory nesting level. */
++                _cleanup_closedir_ DIR *d = NULL;
++                struct dirent *de;
++
++                if (n_todo > 0) {
++                        /* We know that we are in recursion here, because n_todo is set.
++                         * We need to remove the inner directory we were operating on. */
++                        assert(dirname);
++                        r = unlinkat(dirfd(todos[n_todo-1].dir), dirname, AT_REMOVEDIR);
++                        if (r < 0 && r != -ENOENT && ret == 0)
++                                ret = r;
++                        dirname = mfree(dirname);
++
++                        /* And now let's back out one level up */
++                        n_todo --;
++                        d = TAKE_PTR(todos[n_todo].dir);
++                        dirname = TAKE_PTR(todos[n_todo].dirname);
++
++                        assert(d);
++                        fd = dirfd(d); /* Retrieve the file descriptor from the DIR object */
++                        assert(fd >= 0);
++                } else {
++        next_fd:
++                        assert(fd >= 0);
++                        d = fdopendir(fd);
++                        if (!d) {
++                                safe_close(fd);
++                                return -errno;
++                        }
++                        fd = dirfd(d); /* We donated the fd to fdopendir(). Let's make sure we sure we have
++                                        * the right descriptor even if it were to internally invalidate the
++                                        * one we passed. */
++
++                        if (!(flags & REMOVE_PHYSICAL)) {
++                                struct statfs sfs;
++
++                                if (fstatfs(fd, &sfs) < 0)
++                                        return -errno;
++
++                                if (is_physical_fs(&sfs)) {
++                                        /* We refuse to clean physical file systems with this call, unless
++                                         * explicitly requested. This is extra paranoia just to be sure we
++                                         * never ever remove non-state data. */
++
++                                        _cleanup_free_ char *path = NULL;
++
++                                        (void) fd_get_path(fd, &path);
++                                        return log_error_errno(SYNTHETIC_ERRNO(EPERM),
++                                                               "Attempted to remove disk file system under \"%s\", and we can't allow that.",
++                                                               strna(path));
++                                }
++                        }
++                }
+ 
+-        d = fdopendir(fd);
+-        if (!d) {
+-                safe_close(fd);
+-                return -errno;
+-        }
++                FOREACH_DIRENT_ALL(de, d, return -errno) {
++                        int is_dir;
+ 
+-        if (!(flags & REMOVE_PHYSICAL)) {
+-                struct statfs sfs;
++                        if (dot_or_dot_dot(de->d_name))
++                                continue;
+ 
+-                if (fstatfs(dirfd(d), &sfs) < 0)
+-                        return -errno;
+-                }
++                        is_dir = de->d_type == DT_UNKNOWN ? -1 : de->d_type == DT_DIR;
+ 
+-                if (is_physical_fs(&sfs)) {
+-                        /* We refuse to clean physical file systems with this call, unless explicitly
+-                         * requested. This is extra paranoia just to be sure we never ever remove non-state
+-                         * data. */
+-
+-                        _cleanup_free_ char *path = NULL;
+-
+-                        (void) fd_get_path(fd, &path);
+-                        return log_error_errno(SYNTHETIC_ERRNO(EPERM),
+-                                               "Attempted to remove disk file system under \"%s\", and we can't allow that.",
+-                                               strna(path));
+-                }
+-        }
++                        r = rm_rf_inner_child(fd, de->d_name, is_dir, flags, root_dev, false);
++                        if (r == -EISDIR) {
++                                /* Push the current working state onto the todo list */
+ 
+-        FOREACH_DIRENT_ALL(de, d, return -errno) {
+-                int is_dir;
++                                if (!GREEDY_REALLOC0(todos, allocated, n_todo + 2))
++                                        return log_oom();
+ 
+-                if (dot_or_dot_dot(de->d_name))
+-                        continue;
++                                 _cleanup_free_ char *newdirname = strdup(de->d_name);
++                                 if (!newdirname)
++                                         return log_oom();
+ 
+-                is_dir =
+-                        de->d_type == DT_UNKNOWN ? -1 :
+-                        de->d_type == DT_DIR;
+-
+-                r = rm_rf_children_inner(dirfd(d), de->d_name, is_dir, flags, root_dev);
+-                if (r < 0 && r != -ENOENT && ret == 0)
+-                        ret = r;
+-        }
++                                 int newfd = openat(fd, de->d_name,
++                                                    O_RDONLY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC|O_NOFOLLOW|O_NOATIME);
++                                 if (newfd >= 0) {
++                                         todos[n_todo++] = (TodoEntry) { TAKE_PTR(d), TAKE_PTR(dirname) };
++                                         fd = newfd;
++                                         dirname = TAKE_PTR(newdirname);
++
++                                         goto next_fd;
+ 
+-        if (FLAGS_SET(flags, REMOVE_SYNCFS) && syncfs(dirfd(d)) < 0 && ret >= 0)
+-                ret = -errno;
++                                 } else if (errno != -ENOENT && ret == 0)
++                                         ret = -errno;
++
++                        } else if (r < 0 && r != -ENOENT && ret == 0)
++                                ret = r;
++                }
++
++                if (FLAGS_SET(flags, REMOVE_SYNCFS) && syncfs(fd) < 0 && ret >= 0)
++                        ret = -errno;
++
++                if (n_todo == 0)
++                        break;
++        }
+ 
+         return ret;
+ }
+@@ -250,5 +315,5 @@
+         if (FLAGS_SET(flags, REMOVE_ONLY_DIRECTORIES|REMOVE_SUBVOLUME))
+                 return -EINVAL;
+ 
+-        return rm_rf_children_inner(fd, name, -1, flags, NULL);
++        return rm_rf_inner_child(fd, name, -1, flags, NULL, true);
+ }
diff --git a/meta/recipes-core/systemd/systemd/rm-rf-optionally-fsync-after-removing-directory-tree.patch b/meta/recipes-core/systemd/systemd/rm-rf-optionally-fsync-after-removing-directory-tree.patch
new file mode 100644
index 0000000000..b860da008c
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/rm-rf-optionally-fsync-after-removing-directory-tree.patch
@@ -0,0 +1,35 @@
+Backport of the following upstream commit:
+From bdfe7ada0d4d66e6d6e65f2822acbb1ec230f9c2 Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Tue, 5 Oct 2021 10:32:56 +0200
+Subject: [PATCH] rm-rf: optionally fsync() after removing directory tree
+
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/s/systemd/systemd_245.4-4ubuntu3.15.debian.tar.xz]
+Signed-off-by: Purushottam Choudhary <Purushottam.Choudhary@kpit.com>
+---
+ src/basic/rm-rf.c | 3 +++
+ src/basic/rm-rf.h | 1 +
+ 2 files changed, 4 insertions(+)
+
+--- a/src/basic/rm-rf.c
++++ b/src/basic/rm-rf.c
+@@ -161,6 +161,9 @@
+                         ret = r;
+         }
+ 
++        if (FLAGS_SET(flags, REMOVE_SYNCFS) && syncfs(dirfd(d)) < 0 && ret >= 0)
++                ret = -errno;
++
+         return ret;
+ }
+ 
+--- a/src/basic/rm-rf.h
++++ b/src/basic/rm-rf.h
+@@ -11,6 +11,7 @@
+         REMOVE_PHYSICAL         = 1 << 2, /* If not set, only removes files on tmpfs, never physical file systems */
+         REMOVE_SUBVOLUME        = 1 << 3, /* Drop btrfs subvolumes in the tree too */
+         REMOVE_MISSING_OK       = 1 << 4, /* If the top-level directory is missing, ignore the ENOENT for it */
++        REMOVE_SYNCFS           = 1 << 7, /* syncfs() the root of the specified directory after removing everything in it */
+ } RemoveFlags;
+ 
+ int rm_rf_children(int fd, RemoveFlags flags, const struct stat *root_dev);
diff --git a/meta/recipes-core/systemd/systemd/rm-rf-refactor-rm-rf-children-split-out-body-of-directory.patch b/meta/recipes-core/systemd/systemd/rm-rf-refactor-rm-rf-children-split-out-body-of-directory.patch
new file mode 100644
index 0000000000..f80e6433c6
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/rm-rf-refactor-rm-rf-children-split-out-body-of-directory.patch
@@ -0,0 +1,318 @@
+Backport of the following upstream commit:
+From 96906b22417c65d70933976e0ee920c70c9113a4 Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Tue, 26 Jan 2021 16:30:06 +0100
+Subject: [PATCH] rm-rf: refactor rm_rf_children(), split out body of directory
+ iteration loop
+
+This splits out rm_rf_children_inner() as body of the loop. We can use
+that to implement rm_rf_child() for deleting one specific entry in a
+directory.
+
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/s/systemd/systemd_245.4-4ubuntu3.15.debian.tar.xz]
+Signed-off-by: Purushottam Choudhary <Purushottam.Choudhary@kpit.com>
+---
+ src/basic/rm-rf.c | 223 ++++++++++++++++++++++++++-------------------
+ src/basic/rm-rf.h |   3 +-
+ 2 files changed, 131 insertions(+), 95 deletions(-)
+
+--- a/src/basic/rm-rf.c
++++ b/src/basic/rm-rf.c
+@@ -19,138 +19,153 @@
+ #include "stat-util.h"
+ #include "string-util.h"
+ 
++/* We treat tmpfs/ramfs + cgroupfs as non-physical file sytems. cgroupfs is similar to tmpfs in a way after
++ * all: we can create arbitrary directory hierarchies in it, and hence can also use rm_rf() on it to remove
++ * those again. */
+ static bool is_physical_fs(const struct statfs *sfs) {
+         return !is_temporary_fs(sfs) && !is_cgroup_fs(sfs);
+ }
+ 
+-int rm_rf_children(int fd, RemoveFlags flags, struct stat *root_dev) {
++static int rm_rf_children_inner(
++                int fd,
++                const char *fname,
++                int is_dir,
++                RemoveFlags flags,
++                const struct stat *root_dev) {
++
++        struct stat st;
++        int r;
++
++        assert(fd >= 0);
++        assert(fname);
++
++        if (is_dir < 0 || (is_dir > 0 && (root_dev || (flags & REMOVE_SUBVOLUME)))) {
++
++                r = fstatat(fd, fname, &st, AT_SYMLINK_NOFOLLOW);
++                if (r < 0)
++                        return r;
++
++                is_dir = S_ISDIR(st.st_mode);
++        }
++
++        if (is_dir) {
++                _cleanup_close_ int subdir_fd = -1;
++                int q;
++
++                /* if root_dev is set, remove subdirectories only if device is same */
++                if (root_dev && st.st_dev != root_dev->st_dev)
++                        return 0;
++
++                /* Stop at mount points */
++                r = fd_is_mount_point(fd, fname, 0);
++                if (r < 0)
++                        return r;
++                if (r > 0)
++                        return 0;
++
++                if ((flags & REMOVE_SUBVOLUME) && st.st_ino == 256) {
++
++                        /* This could be a subvolume, try to remove it */
++
++                        r = btrfs_subvol_remove_fd(fd, fname, BTRFS_REMOVE_RECURSIVE|BTRFS_REMOVE_QUOTA);
++                        if (r < 0) {
++                                if (!IN_SET(r, -ENOTTY, -EINVAL))
++                                        return r;
++
++                                /* ENOTTY, then it wasn't a btrfs subvolume, continue below. */
++                        } else
++                                /* It was a subvolume, done. */
++                                return 1;
++                }
++
++                subdir_fd = openat(fd, fname, O_RDONLY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC|O_NOFOLLOW|O_NOATIME);
++                if (subdir_fd < 0)
++                        return -errno;
++
++                /* We pass REMOVE_PHYSICAL here, to avoid doing the fstatfs() to check the file system type
++                 * again for each directory */
++                q = rm_rf_children(TAKE_FD(subdir_fd), flags | REMOVE_PHYSICAL, root_dev);
++
++                r = unlinkat(fd, fname, AT_REMOVEDIR);
++                if (r < 0)
++                        return r;
++                if (q < 0)
++                        return q;
++
++                return 1;
++
++        } else if (!(flags & REMOVE_ONLY_DIRECTORIES)) {
++                r = unlinkat(fd, fname, 0);
++                if (r < 0)
++                        return r;
++
++                return 1;
++        }
++
++        return 0;
++}
++
++int rm_rf_children(
++                int fd,
++                RemoveFlags flags,
++                const struct stat *root_dev) {
++
+         _cleanup_closedir_ DIR *d = NULL;
+         struct dirent *de;
+         int ret = 0, r;
+-        struct statfs sfs;
+ 
+         assert(fd >= 0);
+ 
+         /* This returns the first error we run into, but nevertheless tries to go on. This closes the passed
+-         * fd, in all cases, including on failure.. */
++         * fd, in all cases, including on failure. */
++
++        d = fdopendir(fd);
++        if (!d) {
++                safe_close(fd);
++                return -errno;
++        }
+ 
+         if (!(flags & REMOVE_PHYSICAL)) {
++                struct statfs sfs;
+ 
+-                r = fstatfs(fd, &sfs);
+-                if (r < 0) {
+-                        safe_close(fd);
++                if (fstatfs(dirfd(d), &sfs) < 0)
+                         return -errno;
+                 }
+ 
+                 if (is_physical_fs(&sfs)) {
+-                        /* We refuse to clean physical file systems with this call,
+-                         * unless explicitly requested. This is extra paranoia just
+-                         * to be sure we never ever remove non-state data. */
++                        /* We refuse to clean physical file systems with this call, unless explicitly
++                         * requested. This is extra paranoia just to be sure we never ever remove non-state
++                         * data. */
++
+                         _cleanup_free_ char *path = NULL;
+ 
+                         (void) fd_get_path(fd, &path);
+-                        log_error("Attempted to remove disk file system under \"%s\", and we can't allow that.",
+-                                  strna(path));
+-
+-                        safe_close(fd);
+-                        return -EPERM;
++                        return log_error_errno(SYNTHETIC_ERRNO(EPERM),
++                                               "Attempted to remove disk file system under \"%s\", and we can't allow that.",
++                                               strna(path));
+                 }
+         }
+ 
+-        d = fdopendir(fd);
+-        if (!d) {
+-                safe_close(fd);
+-                return errno == ENOENT ? 0 : -errno;
+-        }
+-
+         FOREACH_DIRENT_ALL(de, d, return -errno) {
+-                bool is_dir;
+-                struct stat st;
++                int is_dir;
+ 
+                 if (dot_or_dot_dot(de->d_name))
+                         continue;
+ 
+-                if (de->d_type == DT_UNKNOWN ||
+-                    (de->d_type == DT_DIR && (root_dev || (flags & REMOVE_SUBVOLUME)))) {
+-                        if (fstatat(fd, de->d_name, &st, AT_SYMLINK_NOFOLLOW) < 0) {
+-                                if (ret == 0 && errno != ENOENT)
+-                                        ret = -errno;
+-                                continue;
+-                        }
+-
+-                        is_dir = S_ISDIR(st.st_mode);
+-                } else
+-                        is_dir = de->d_type == DT_DIR;
+-
+-                if (is_dir) {
+-                        _cleanup_close_ int subdir_fd = -1;
+-
+-                        /* if root_dev is set, remove subdirectories only if device is same */
+-                        if (root_dev && st.st_dev != root_dev->st_dev)
+-                                continue;
+-
+-                        subdir_fd = openat(fd, de->d_name, O_RDONLY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC|O_NOFOLLOW|O_NOATIME);
+-                        if (subdir_fd < 0) {
+-                                if (ret == 0 && errno != ENOENT)
+-                                        ret = -errno;
+-                                continue;
+-                        }
+-
+-                        /* Stop at mount points */
+-                        r = fd_is_mount_point(fd, de->d_name, 0);
+-                        if (r < 0) {
+-                                if (ret == 0 && r != -ENOENT)
+-                                        ret = r;
+-
+-                                continue;
+-                        }
+-                        if (r > 0)
+-                                continue;
+-
+-                        if ((flags & REMOVE_SUBVOLUME) && st.st_ino == 256) {
+-
+-                                /* This could be a subvolume, try to remove it */
+-
+-                                r = btrfs_subvol_remove_fd(fd, de->d_name, BTRFS_REMOVE_RECURSIVE|BTRFS_REMOVE_QUOTA);
+-                                if (r < 0) {
+-                                        if (!IN_SET(r, -ENOTTY, -EINVAL)) {
+-                                                if (ret == 0)
+-                                                        ret = r;
+-
+-                                                continue;
+-                                        }
+-
+-                                        /* ENOTTY, then it wasn't a btrfs subvolume, continue below. */
+-                                } else
+-                                        /* It was a subvolume, continue. */
+-                                        continue;
+-                        }
+-
+-                        /* We pass REMOVE_PHYSICAL here, to avoid doing the fstatfs() to check the file
+-                         * system type again for each directory */
+-                        r = rm_rf_children(TAKE_FD(subdir_fd), flags | REMOVE_PHYSICAL, root_dev);
+-                        if (r < 0 && ret == 0)
+-                                ret = r;
+-
+-                        if (unlinkat(fd, de->d_name, AT_REMOVEDIR) < 0) {
+-                                if (ret == 0 && errno != ENOENT)
+-                                        ret = -errno;
+-                        }
+-
+-                } else if (!(flags & REMOVE_ONLY_DIRECTORIES)) {
+-
+-                        if (unlinkat(fd, de->d_name, 0) < 0) {
+-                                if (ret == 0 && errno != ENOENT)
+-                                        ret = -errno;
+-                        }
+-                }
++                is_dir =
++                        de->d_type == DT_UNKNOWN ? -1 :
++                        de->d_type == DT_DIR;
++
++                r = rm_rf_children_inner(dirfd(d), de->d_name, is_dir, flags, root_dev);
++                if (r < 0 && r != -ENOENT && ret == 0)
++                        ret = r;
+         }
++
+         return ret;
+ }
+ 
+ int rm_rf(const char *path, RemoveFlags flags) {
+         int fd, r;
+-        struct statfs s;
+ 
+         assert(path);
+ 
+@@ -195,9 +210,10 @@
+                 if (FLAGS_SET(flags, REMOVE_ROOT)) {
+ 
+                         if (!FLAGS_SET(flags, REMOVE_PHYSICAL)) {
++                                struct statfs s;
++
+                                 if (statfs(path, &s) < 0)
+                                         return -errno;
+-
+                                 if (is_physical_fs(&s))
+                                         return log_error_errno(SYNTHETIC_ERRNO(EPERM),
+                                                                "Attempted to remove files from a disk file system under \"%s\", refusing.",
+@@ -225,3 +241,22 @@
+ 
+         return r;
+ }
++
++int rm_rf_child(int fd, const char *name, RemoveFlags flags) {
++
++        /* Removes one specific child of the specified directory */
++
++        if (fd < 0)
++                return -EBADF;
++
++        if (!filename_is_valid(name))
++                return -EINVAL;
++
++        if ((flags & (REMOVE_ROOT|REMOVE_MISSING_OK)) != 0) /* Doesn't really make sense here, we are not supposed to remove 'fd' anyway */
++                return -EINVAL;
++
++        if (FLAGS_SET(flags, REMOVE_ONLY_DIRECTORIES|REMOVE_SUBVOLUME))
++                return -EINVAL;
++
++        return rm_rf_children_inner(fd, name, -1, flags, NULL);
++}
+--- a/src/basic/rm-rf.h
++++ b/src/basic/rm-rf.h
+@@ -13,7 +13,8 @@
+         REMOVE_MISSING_OK       = 1 << 4, /* If the top-level directory is missing, ignore the ENOENT for it */
+ } RemoveFlags;
+ 
+-int rm_rf_children(int fd, RemoveFlags flags, struct stat *root_dev);
++int rm_rf_children(int fd, RemoveFlags flags, const struct stat *root_dev);
++int rm_rf_child(int fd, const char *name, RemoveFlags flags);
+ int rm_rf(const char *path, RemoveFlags flags);
+ 
+ /* Useful for usage with _cleanup_(), destroys a directory and frees the pointer */
diff --git a/meta/recipes-core/systemd/systemd_244.5.bb b/meta/recipes-core/systemd/systemd_244.5.bb
index b6f5a47d63..66446e2a7c 100644
--- a/meta/recipes-core/systemd/systemd_244.5.bb
+++ b/meta/recipes-core/systemd/systemd_244.5.bb
@@ -28,6 +28,11 @@ SRC_URI += "file://touchscreen.rules \
            file://network-merge-link_drop-and-link_detach_from_manager.patch \
            file://network-also-drop-requests-when-link-enters-linger-state.patch \
            file://network-fix-Link-reference-counter-issue.patch \
+           file://rm-rf-refactor-rm-rf-children-split-out-body-of-directory.patch \
+           file://rm-rf-optionally-fsync-after-removing-directory-tree.patch \
+           file://CVE-2021-3997-1.patch \
+           file://CVE-2021-3997-2.patch \
+           file://CVE-2021-3997-3.patch \
            "
 
 # patches needed by musl
-- 
2.17.1


