Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web09.3132.1617774191221533635
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Apr 2021 22:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: khairul.rohaizzat.jamaluddin@intel.com)
IronPort-SDR: N+XsUB67J80RJfrdN1VZ4E/ukzf870D+8cgSKJ+4+yrHz/0Qi3TuRLrzn1li/w8hqJG8oA1aPz
 kVyzevq7Ku1g==
X-IronPort-AV: E=McAfee;i="6000,8403,9946"; a="180773111"
X-IronPort-AV: E=Sophos;i="5.82,201,1613462400"; 
   d="scan'208";a="180773111"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2021 22:43:10 -0700
IronPort-SDR: 9EvpaF88TOSSpJDA3pmLwRMTjFEj6aRvXcL3pLq+SfPvbqxbpg/cvjK17P9ePyI5e2GjadfiLG
 me8uUJijUOUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,201,1613462400"; 
   d="scan'208";a="448105376"
Received: from unknown (HELO ip-10-114-160-175.us-west-2.compute.internal) ([10.114.160.175])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Apr 2021 22:43:09 -0700
From: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: khairul.rohaizzat.jamaluddin@intel.com
Subject: [PATCH] qemu: Fix CVE-2020-35517
Date: Wed,  7 Apr 2021 05:42:35 +0000
Message-Id: <20210407054235.19093-1-khairul.rohaizzat.jamaluddin@intel.com>
X-Mailer: git-send-email 2.17.1

From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>

CVE:
CVE-2020-35517

Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   3 +
 .../qemu/qemu/CVE-2020-35517_1.patch          | 153 +++++++++
 .../qemu/qemu/CVE-2020-35517_2.patch          | 117 +++++++
 .../qemu/qemu/CVE-2020-35517_3.patch          | 303 ++++++++++++++++++
 4 files changed, 576 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-35517_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-35517_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-35517_3.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index a625809597..f0416b0379 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -31,6 +31,9 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://determinism.patch \
            file://0001-tests-meson.build-use-relative-path-to-refer-to-file.patch \
 	   file://CVE-2021-20203.patch \
+           file://CVE-2020-35517_1.patch \
+           file://CVE-2020-35517_2.patch \
+           file://CVE-2020-35517_3.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-35517_1.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-35517_1.patch
new file mode 100644
index 0000000000..73a4cb2064
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-35517_1.patch
@@ -0,0 +1,153 @@
+From 8afaaee976965b7fb90ec225a51d60f35c5f173c Mon Sep 17 00:00:00 2001
+From: Stefan Hajnoczi <stefanha@redhat.com>
+Date: Thu, 4 Feb 2021 15:02:06 +0000
+Subject: [PATCH] virtiofsd: extract lo_do_open() from lo_open()
+
+Both lo_open() and lo_create() have similar code to open a file. Extract
+a common lo_do_open() function from lo_open() that will be used by
+lo_create() in a later commit.
+
+Since lo_do_open() does not otherwise need fuse_req_t req, convert
+lo_add_fd_mapping() to use struct lo_data *lo instead.
+
+Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
+Message-Id: <20210204150208.367837-2-stefanha@redhat.com>
+Reviewed-by: Greg Kurz <groug@kaod.org>
+Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
+
+Upstream-Status: Backport
+[https://github.com/qemu/qemu/commit/8afaaee976965b7fb90ec225a51d60f35c5f173c]
+
+CVE: CVE-2020-35517
+
+Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
+Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
+---
+ tools/virtiofsd/passthrough_ll.c | 73 +++++++++++++++++++++++++---------------
+ 1 file changed, 46 insertions(+), 27 deletions(-)
+
+diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
+index 5fb36d9..f14fa51 100644
+--- a/tools/virtiofsd/passthrough_ll.c
++++ b/tools/virtiofsd/passthrough_ll.c
+@@ -459,17 +459,17 @@ static void lo_map_remove(struct lo_map *map, size_t key)
+ }
+ 
+ /* Assumes lo->mutex is held */
+-static ssize_t lo_add_fd_mapping(fuse_req_t req, int fd)
++static ssize_t lo_add_fd_mapping(struct lo_data *lo, int fd)
+ {
+     struct lo_map_elem *elem;
+ 
+-    elem = lo_map_alloc_elem(&lo_data(req)->fd_map);
++    elem = lo_map_alloc_elem(&lo->fd_map);
+     if (!elem) {
+         return -1;
+     }
+ 
+     elem->fd = fd;
+-    return elem - lo_data(req)->fd_map.elems;
++    return elem - lo->fd_map.elems;
+ }
+ 
+ /* Assumes lo->mutex is held */
+@@ -1651,6 +1651,38 @@ static void update_open_flags(int writeback, int allow_direct_io,
+     }
+ }
+ 
++static int lo_do_open(struct lo_data *lo, struct lo_inode *inode,
++                      struct fuse_file_info *fi)
++{
++    char buf[64];
++    ssize_t fh;
++    int fd;
++
++    update_open_flags(lo->writeback, lo->allow_direct_io, fi);
++
++    sprintf(buf, "%i", inode->fd);
++    fd = openat(lo->proc_self_fd, buf, fi->flags & ~O_NOFOLLOW);
++    if (fd == -1) {
++        return errno;
++    }
++
++    pthread_mutex_lock(&lo->mutex);
++    fh = lo_add_fd_mapping(lo, fd);
++    pthread_mutex_unlock(&lo->mutex);
++    if (fh == -1) {
++        close(fd);
++        return ENOMEM;
++    }
++
++    fi->fh = fh;
++    if (lo->cache == CACHE_NONE) {
++        fi->direct_io = 1;
++    } else if (lo->cache == CACHE_ALWAYS) {
++        fi->keep_cache = 1;
++    }
++    return 0;
++}
++
+ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
+                       mode_t mode, struct fuse_file_info *fi)
+ {
+@@ -1691,7 +1723,7 @@ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
+         ssize_t fh;
+ 
+         pthread_mutex_lock(&lo->mutex);
+-        fh = lo_add_fd_mapping(req, fd);
++        fh = lo_add_fd_mapping(lo, fd);
+         pthread_mutex_unlock(&lo->mutex);
+         if (fh == -1) {
+             close(fd);
+@@ -1892,38 +1924,25 @@ static void lo_fsyncdir(fuse_req_t req, fuse_ino_t ino, int datasync,
+ 
+ static void lo_open(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
+ {
+-    int fd;
+-    ssize_t fh;
+-    char buf[64];
+     struct lo_data *lo = lo_data(req);
++    struct lo_inode *inode = lo_inode(req, ino);
++    int err;
+ 
+     fuse_log(FUSE_LOG_DEBUG, "lo_open(ino=%" PRIu64 ", flags=%d)\n", ino,
+              fi->flags);
+ 
+-    update_open_flags(lo->writeback, lo->allow_direct_io, fi);
+-
+-    sprintf(buf, "%i", lo_fd(req, ino));
+-    fd = openat(lo->proc_self_fd, buf, fi->flags & ~O_NOFOLLOW);
+-    if (fd == -1) {
+-        return (void)fuse_reply_err(req, errno);
+-    }
+-
+-    pthread_mutex_lock(&lo->mutex);
+-    fh = lo_add_fd_mapping(req, fd);
+-    pthread_mutex_unlock(&lo->mutex);
+-    if (fh == -1) {
+-        close(fd);
+-        fuse_reply_err(req, ENOMEM);
++    if (!inode) {
++        fuse_reply_err(req, EBADF);
+         return;
+     }
+ 
+-    fi->fh = fh;
+-    if (lo->cache == CACHE_NONE) {
+-        fi->direct_io = 1;
+-    } else if (lo->cache == CACHE_ALWAYS) {
+-        fi->keep_cache = 1;
++    err = lo_do_open(lo, inode, fi);
++    lo_inode_put(lo, &inode);
++    if (err) {
++        fuse_reply_err(req, err);
++    } else {
++        fuse_reply_open(req, fi);
+     }
+-    fuse_reply_open(req, fi);
+ }
+ 
+ static void lo_release(fuse_req_t req, fuse_ino_t ino,
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-35517_2.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-35517_2.patch
new file mode 100644
index 0000000000..bf11bdb6f8
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-35517_2.patch
@@ -0,0 +1,117 @@
+From 22d2ece71e533310da31f2857ebc4a00d91968b3 Mon Sep 17 00:00:00 2001
+From: Stefan Hajnoczi <stefanha@redhat.com>
+Date: Thu, 4 Feb 2021 15:02:07 +0000
+Subject: [PATCH] virtiofsd: optionally return inode pointer from
+ lo_do_lookup()
+
+lo_do_lookup() finds an existing inode or allocates a new one. It
+increments nlookup so that the inode stays alive until the client
+releases it.
+
+Existing callers don't need the struct lo_inode so the function doesn't
+return it. Extend the function to optionally return the inode. The next
+commit will need it.
+
+Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
+Reviewed-by: Greg Kurz <groug@kaod.org>
+Message-Id: <20210204150208.367837-3-stefanha@redhat.com>
+Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
+
+Upstream-Status: Backport
+[https://github.com/qemu/qemu/commit/22d2ece71e533310da31f2857ebc4a00d91968b3]
+
+CVE: CVE-2020-35517
+
+Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
+Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
+---
+ tools/virtiofsd/passthrough_ll.c | 29 +++++++++++++++++++++--------
+ 1 file changed, 21 insertions(+), 8 deletions(-)
+
+diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
+index f14fa51..aa35fc6 100644
+--- a/tools/virtiofsd/passthrough_ll.c
++++ b/tools/virtiofsd/passthrough_ll.c
+@@ -831,11 +831,13 @@ static int do_statx(struct lo_data *lo, int dirfd, const char *pathname,
+ }
+ 
+ /*
+- * Increments nlookup and caller must release refcount using
+- * lo_inode_put(&parent).
++ * Increments nlookup on the inode on success. unref_inode_lolocked() must be
++ * called eventually to decrement nlookup again. If inodep is non-NULL, the
++ * inode pointer is stored and the caller must call lo_inode_put().
+  */
+ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
+-                        struct fuse_entry_param *e)
++                        struct fuse_entry_param *e,
++                        struct lo_inode **inodep)
+ {
+     int newfd;
+     int res;
+@@ -845,6 +847,10 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
+     struct lo_inode *inode = NULL;
+     struct lo_inode *dir = lo_inode(req, parent);
+ 
++    if (inodep) {
++        *inodep = NULL;
++    }
++
+     /*
+      * name_to_handle_at() and open_by_handle_at() can reach here with fuse
+      * mount point in guest, but we don't have its inode info in the
+@@ -913,7 +919,14 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
+         pthread_mutex_unlock(&lo->mutex);
+     }
+     e->ino = inode->fuse_ino;
+-    lo_inode_put(lo, &inode);
++
++    /* Transfer ownership of inode pointer to caller or drop it */
++    if (inodep) {
++        *inodep = inode;
++    } else {
++        lo_inode_put(lo, &inode);
++    }
++
+     lo_inode_put(lo, &dir);
+ 
+     fuse_log(FUSE_LOG_DEBUG, "  %lli/%s -> %lli\n", (unsigned long long)parent,
+@@ -948,7 +961,7 @@ static void lo_lookup(fuse_req_t req, fuse_ino_t parent, const char *name)
+         return;
+     }
+ 
+-    err = lo_do_lookup(req, parent, name, &e);
++    err = lo_do_lookup(req, parent, name, &e, NULL);
+     if (err) {
+         fuse_reply_err(req, err);
+     } else {
+@@ -1056,7 +1069,7 @@ static void lo_mknod_symlink(fuse_req_t req, fuse_ino_t parent,
+         goto out;
+     }
+ 
+-    saverr = lo_do_lookup(req, parent, name, &e);
++    saverr = lo_do_lookup(req, parent, name, &e, NULL);
+     if (saverr) {
+         goto out;
+     }
+@@ -1534,7 +1547,7 @@ static void lo_do_readdir(fuse_req_t req, fuse_ino_t ino, size_t size,
+ 
+         if (plus) {
+             if (!is_dot_or_dotdot(name)) {
+-                err = lo_do_lookup(req, ino, name, &e);
++                err = lo_do_lookup(req, ino, name, &e, NULL);
+                 if (err) {
+                     goto error;
+                 }
+@@ -1732,7 +1745,7 @@ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
+         }
+ 
+         fi->fh = fh;
+-        err = lo_do_lookup(req, parent, name, &e);
++        err = lo_do_lookup(req, parent, name, &e, NULL);
+     }
+     if (lo->cache == CACHE_NONE) {
+         fi->direct_io = 1;
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-35517_3.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-35517_3.patch
new file mode 100644
index 0000000000..f348f3f2bd
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-35517_3.patch
@@ -0,0 +1,303 @@
+From a3fdbbc7f271bff7d53d0501b29d910ece0b3789 Mon Sep 17 00:00:00 2001
+From: Stefan Hajnoczi <stefanha@redhat.com>
+Date: Thu, 4 Feb 2021 15:02:08 +0000
+Subject: [PATCH] virtiofsd: prevent opening of special files (CVE-2020-35517)
+
+A well-behaved FUSE client does not attempt to open special files with
+FUSE_OPEN because they are handled on the client side (e.g. device nodes
+are handled by client-side device drivers).
+
+The check to prevent virtiofsd from opening special files is missing in
+a few cases, most notably FUSE_OPEN. A malicious client can cause
+virtiofsd to open a device node, potentially allowing the guest to
+escape. This can be exploited by a modified guest device driver. It is
+not exploitable from guest userspace since the guest kernel will handle
+special files inside the guest instead of sending FUSE requests.
+
+This patch fixes this issue by introducing the lo_inode_open() function
+to check the file type before opening it. This is a short-term solution
+because it does not prevent a compromised virtiofsd process from opening
+device nodes on the host.
+
+Restructure lo_create() to try O_CREAT | O_EXCL first. Note that O_CREAT
+| O_EXCL does not follow symlinks, so O_NOFOLLOW masking is not
+necessary here. If the file exists and the user did not specify O_EXCL,
+open it via lo_do_open().
+
+Reported-by: Alex Xu <alex@alxu.ca>
+Fixes: CVE-2020-35517
+Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
+Reviewed-by: Vivek Goyal <vgoyal@redhat.com>
+Reviewed-by: Greg Kurz <groug@kaod.org>
+Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
+Message-Id: <20210204150208.367837-4-stefanha@redhat.com>
+Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
+
+Upstream-Status: Backport
+[https://github.com/qemu/qemu/commit/a3fdbbc7f271bff7d53d0501b29d910ece0b3789]
+
+CVE: CVE-2020-35517
+
+Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
+Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
+---
+ tools/virtiofsd/passthrough_ll.c | 144 ++++++++++++++++++++-----------
+ 1 file changed, 92 insertions(+), 52 deletions(-)
+
+diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
+index aa35fc6ba5a5..147b59338a18 100644
+--- a/tools/virtiofsd/passthrough_ll.c
++++ b/tools/virtiofsd/passthrough_ll.c
+@@ -555,6 +555,38 @@ static int lo_fd(fuse_req_t req, fuse_ino_t ino)
+     return fd;
+ }
+ 
++/*
++ * Open a file descriptor for an inode. Returns -EBADF if the inode is not a
++ * regular file or a directory.
++ *
++ * Use this helper function instead of raw openat(2) to prevent security issues
++ * when a malicious client opens special files such as block device nodes.
++ * Symlink inodes are also rejected since symlinks must already have been
++ * traversed on the client side.
++ */
++static int lo_inode_open(struct lo_data *lo, struct lo_inode *inode,
++                         int open_flags)
++{
++    g_autofree char *fd_str = g_strdup_printf("%d", inode->fd);
++    int fd;
++
++    if (!S_ISREG(inode->filetype) && !S_ISDIR(inode->filetype)) {
++        return -EBADF;
++    }
++
++    /*
++     * The file is a symlink so O_NOFOLLOW must be ignored. We checked earlier
++     * that the inode is not a special file but if an external process races
++     * with us then symlinks are traversed here. It is not possible to escape
++     * the shared directory since it is mounted as "/" though.
++     */
++    fd = openat(lo->proc_self_fd, fd_str, open_flags & ~O_NOFOLLOW);
++    if (fd < 0) {
++        return -errno;
++    }
++    return fd;
++}
++
+ static void lo_init(void *userdata, struct fuse_conn_info *conn)
+ {
+     struct lo_data *lo = (struct lo_data *)userdata;
+@@ -684,9 +716,9 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
+         if (fi) {
+             truncfd = fd;
+         } else {
+-            sprintf(procname, "%i", ifd);
+-            truncfd = openat(lo->proc_self_fd, procname, O_RDWR);
++            truncfd = lo_inode_open(lo, inode, O_RDWR);
+             if (truncfd < 0) {
++                errno = -truncfd;
+                 goto out_err;
+             }
+         }
+@@ -848,7 +880,7 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
+     struct lo_inode *dir = lo_inode(req, parent);
+ 
+     if (inodep) {
+-        *inodep = NULL;
++        *inodep = NULL; /* in case there is an error */
+     }
+ 
+     /*
+@@ -1664,19 +1696,26 @@ static void update_open_flags(int writeback, int allow_direct_io,
+     }
+ }
+ 
++/*
++ * Open a regular file, set up an fd mapping, and fill out the struct
++ * fuse_file_info for it. If existing_fd is not negative, use that fd instead
++ * opening a new one. Takes ownership of existing_fd.
++ *
++ * Returns 0 on success or a positive errno.
++ */
+ static int lo_do_open(struct lo_data *lo, struct lo_inode *inode,
+-                      struct fuse_file_info *fi)
++                      int existing_fd, struct fuse_file_info *fi)
+ {
+-    char buf[64];
+     ssize_t fh;
+-    int fd;
++    int fd = existing_fd;
+ 
+     update_open_flags(lo->writeback, lo->allow_direct_io, fi);
+ 
+-    sprintf(buf, "%i", inode->fd);
+-    fd = openat(lo->proc_self_fd, buf, fi->flags & ~O_NOFOLLOW);
+-    if (fd == -1) {
+-        return errno;
++    if (fd < 0) {
++        fd = lo_inode_open(lo, inode, fi->flags);
++        if (fd < 0) {
++            return -fd;
++        }
+     }
+ 
+     pthread_mutex_lock(&lo->mutex);
+@@ -1699,9 +1738,10 @@ static int lo_do_open(struct lo_data *lo, struct lo_inode *inode,
+ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
+                       mode_t mode, struct fuse_file_info *fi)
+ {
+-    int fd;
++    int fd = -1;
+     struct lo_data *lo = lo_data(req);
+     struct lo_inode *parent_inode;
++    struct lo_inode *inode = NULL;
+     struct fuse_entry_param e;
+     int err;
+     struct lo_cred old = {};
+@@ -1727,36 +1767,38 @@ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
+ 
+     update_open_flags(lo->writeback, lo->allow_direct_io, fi);
+ 
+-    fd = openat(parent_inode->fd, name, (fi->flags | O_CREAT) & ~O_NOFOLLOW,
+-                mode);
++    /* Try to create a new file but don't open existing files */
++    fd = openat(parent_inode->fd, name, fi->flags | O_CREAT | O_EXCL, mode);
+     err = fd == -1 ? errno : 0;
+-    lo_restore_cred(&old);
+ 
+-    if (!err) {
+-        ssize_t fh;
++    lo_restore_cred(&old);
+ 
+-        pthread_mutex_lock(&lo->mutex);
+-        fh = lo_add_fd_mapping(lo, fd);
+-        pthread_mutex_unlock(&lo->mutex);
+-        if (fh == -1) {
+-            close(fd);
+-            err = ENOMEM;
+-            goto out;
+-        }
++    /* Ignore the error if file exists and O_EXCL was not given */
++    if (err && (err != EEXIST || (fi->flags & O_EXCL))) {
++        goto out;
++    }
+ 
+-        fi->fh = fh;
+-        err = lo_do_lookup(req, parent, name, &e, NULL);
++    err = lo_do_lookup(req, parent, name, &e, &inode);
++    if (err) {
++        goto out;
+     }
+-    if (lo->cache == CACHE_NONE) {
+-        fi->direct_io = 1;
+-    } else if (lo->cache == CACHE_ALWAYS) {
+-        fi->keep_cache = 1;
++
++    err = lo_do_open(lo, inode, fd, fi);
++    fd = -1; /* lo_do_open() takes ownership of fd */
++    if (err) {
++        /* Undo lo_do_lookup() nlookup ref */
++        unref_inode_lolocked(lo, inode, 1);
+     }
+ 
+ out:
++    lo_inode_put(lo, &inode);
+     lo_inode_put(lo, &parent_inode);
+ 
+     if (err) {
++        if (fd >= 0) {
++            close(fd);
++        }
++
+         fuse_reply_err(req, err);
+     } else {
+         fuse_reply_create(req, &e, fi);
+@@ -1770,7 +1812,6 @@ static struct lo_inode_plock *lookup_create_plock_ctx(struct lo_data *lo,
+                                                       pid_t pid, int *err)
+ {
+     struct lo_inode_plock *plock;
+-    char procname[64];
+     int fd;
+ 
+     plock =
+@@ -1787,12 +1828,10 @@ static struct lo_inode_plock *lookup_create_plock_ctx(struct lo_data *lo,
+     }
+ 
+     /* Open another instance of file which can be used for ofd locks. */
+-    sprintf(procname, "%i", inode->fd);
+-
+     /* TODO: What if file is not writable? */
+-    fd = openat(lo->proc_self_fd, procname, O_RDWR);
+-    if (fd == -1) {
+-        *err = errno;
++    fd = lo_inode_open(lo, inode, O_RDWR);
++    if (fd < 0) {
++        *err = -fd;
+         free(plock);
+         return NULL;
+     }
+@@ -1949,7 +1988,7 @@ static void lo_open(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
+         return;
+     }
+ 
+-    err = lo_do_open(lo, inode, fi);
++    err = lo_do_open(lo, inode, -1, fi);
+     lo_inode_put(lo, &inode);
+     if (err) {
+         fuse_reply_err(req, err);
+@@ -2014,39 +2053,40 @@ static void lo_flush(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
+ static void lo_fsync(fuse_req_t req, fuse_ino_t ino, int datasync,
+                      struct fuse_file_info *fi)
+ {
++    struct lo_inode *inode = lo_inode(req, ino);
++    struct lo_data *lo = lo_data(req);
+     int res;
+     int fd;
+-    char *buf;
+ 
+     fuse_log(FUSE_LOG_DEBUG, "lo_fsync(ino=%" PRIu64 ", fi=0x%p)\n", ino,
+              (void *)fi);
+ 
+-    if (!fi) {
+-        struct lo_data *lo = lo_data(req);
+-
+-        res = asprintf(&buf, "%i", lo_fd(req, ino));
+-        if (res == -1) {
+-            return (void)fuse_reply_err(req, errno);
+-        }
++    if (!inode) {
++        fuse_reply_err(req, EBADF);
++        return;
++    }
+ 
+-        fd = openat(lo->proc_self_fd, buf, O_RDWR);
+-        free(buf);
+-        if (fd == -1) {
+-            return (void)fuse_reply_err(req, errno);
++    if (!fi) {
++        fd = lo_inode_open(lo, inode, O_RDWR);
++        if (fd < 0) {
++            res = -fd;
++            goto out;
+         }
+     } else {
+         fd = lo_fi_fd(req, fi);
+     }
+ 
+     if (datasync) {
+-        res = fdatasync(fd);
++        res = fdatasync(fd) == -1 ? errno : 0;
+     } else {
+-        res = fsync(fd);
++        res = fsync(fd) == -1 ? errno : 0;
+     }
+     if (!fi) {
+         close(fd);
+     }
+-    fuse_reply_err(req, res == -1 ? errno : 0);
++out:
++    lo_inode_put(lo, &inode);
++    fuse_reply_err(req, res);
+ }
+ 
+ static void lo_read(fuse_req_t req, fuse_ino_t ino, size_t size, off_t offset,
-- 
2.17.1

