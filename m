Return-Path: <zhangjialing@loongson.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA78C77B7A
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 11:33:31 +0000 (UTC)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by mx.groups.io with SMTP id smtpd.web10.7404.1685446405153809131
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 04:33:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: loongson.cn, ip: 114.242.206.163, mailfrom: zhangjialing@loongson.cn)
Received: from loongson.cn (unknown [192.168.100.1])
	by gateway (Coremail) with SMTP id _____8AxBvH_3nVkdJACAA--.5888S3;
	Tue, 30 May 2023 19:33:21 +0800 (CST)
Received: from localhost.localdomain (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxsOT_3nVk8YaAAA--.13378S4;
	Tue, 30 May 2023 19:33:19 +0800 (CST)
From: zhangjialing@loongson.cn
To: openembedded-core@lists.openembedded.org
Cc: JiaLing Zhang <zhangjialing@loongson.cn>
Subject: [PATCH v4] Fixes pseudo build in loongarch64
Date: Tue, 30 May 2023 19:33:03 +0800
Message-Id: <20230530113302.1473632-1-zhangjialing@loongson.cn>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxsOT_3nVk8YaAAA--.13378S4
X-CM-SenderInfo: x2kd0wxmldzxtqj6z05rqj20fqof0/1tbiAQAHB2R0lf8PZQANsc
X-Coremail-Antispam: 1Uk129KBjvAXoW3Kw4DGw17ArW3tF18XryDtrb_yoW8WF1fCo
	WSq3ZrXF4UZr4fAr10kFn8J3yxW34UCF18XFWkGr4kCFWfXF4Y9ry5tw4a934Uur9xGry3
	CayrKF9IvF4fArnxn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
	J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
	UUkKb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s
	0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l84
	ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWxJVW8Jr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4kE6xkIj40Ew7xC0wCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1asjUUUUUU==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 11:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181915

From: JiaLing Zhang <zhangjialing@loongson.cn>

Fixes [YOCTO #15110]

Some functions used in the project have been removed from glibc. After the removal of these functions,
the architecture in glibc will not include the removed functions.
This patch resolves the usage and compilation issues on the loongarch64 architecture

Signed-off-by: JiaLing Zhang <zhangjialing@loongson.cn>
---
 ports/linux/guts/fopen64.c    | 14 +++++--
 ports/linux/guts/freopen64.c  |  8 ++++
 ports/linux/guts/fstat.c      | 11 +++++-
 ports/linux/guts/fstat64.c    | 16 ++++++++
 ports/linux/guts/fstatat.c    |  8 +++-
 ports/linux/guts/fstatat64.c  | 43 +++++++++++++++++++++
 ports/linux/guts/lstat.c      |  5 ++-
 ports/linux/guts/lstat64.c    |  5 ++-
 ports/linux/guts/mknod.c      |  4 ++
 ports/linux/guts/mknodat.c    | 72 +++++++++++++++++++++++++++++++++++
 ports/linux/guts/mkostemp64.c |  4 ++
 ports/linux/guts/openat.c     | 36 ++++++++++++++++++
 ports/linux/guts/stat.c       |  5 ++-
 ports/linux/guts/stat64.c     |  5 ++-
 ports/linux/pseudo_wrappers.c | 32 ++++++++++++++++
 pseudo_client.h               |  8 ++++
 templates/wrapfuncs.c         |  2 +
 17 files changed, 268 insertions(+), 10 deletions(-)

diff --git a/ports/linux/guts/fopen64.c b/ports/linux/guts/fopen64.c
index e76da69..db522a4 100644
--- a/ports/linux/guts/fopen64.c
+++ b/ports/linux/guts/fopen64.c
@@ -8,11 +8,13 @@
  * wrap_fopen64(const char *path, const char *mode) {
  *	FILE * rc = 0;
  */
- 	struct stat64 buf;
-	int save_errno;
-
+        struct stat64 buf;
+        int save_errno;
+#ifdef __loongarch64
+        int existed = (real_stat64(path, &buf) != -1);
+#else
 	int existed = (real___xstat64(_STAT_VER, path, &buf) != -1);
-
+#endif
 	rc = real_fopen64(path, mode);
 	save_errno = errno;
 
@@ -20,7 +22,11 @@
 		int fd = fileno(rc);
 
 		pseudo_debug(PDBGF_FILE, "fopen64 '%s': fd %d <FILE %p>\n", path, fd, (void *) rc);
+#ifdef __loongarch64
+		if (real_fstat64( fd, &buf) != -1) {
+#else
 		if (real___fxstat64(_STAT_VER, fd, &buf) != -1) {
+#endif
 			if (!existed) {
 				real_fchmod(fd, PSEUDO_FS_MODE(0666 & ~pseudo_umask, 0));
 				pseudo_client_op(OP_CREAT, 0, -1, -1, path, &buf);
diff --git a/ports/linux/guts/freopen64.c b/ports/linux/guts/freopen64.c
index 5fc9073..f249682 100644
--- a/ports/linux/guts/freopen64.c
+++ b/ports/linux/guts/freopen64.c
@@ -10,7 +10,11 @@
  */
  	struct stat64 buf;
 	int save_errno;
+#ifdef __loongarch64
+	int existed = (real_stat64(path, &buf) != -1);
+#else
 	int existed = (real___xstat64(_STAT_VER, path, &buf) != -1);
+#endif
 
 	rc = real_freopen64(path, mode, stream);
 	save_errno = errno;
@@ -19,7 +23,11 @@
 		int fd = fileno(rc);
 
 		pseudo_debug(PDBGF_FILE, "freopen64 '%s': fd %d\n", path, fd);
+#ifdef __loongarch64
+		if (real_fstat64(fd, &buf) != -1) {
+#else
 		if (real___fxstat64(_STAT_VER, fd, &buf) != -1) {
+#endif
 			if (!existed) {
 				real_fchmod(fd, PSEUDO_FS_MODE(0666 & ~pseudo_umask, 0));
 				pseudo_client_op(OP_CREAT, 0, -1, -1, path, &buf);
diff --git a/ports/linux/guts/fstat.c b/ports/linux/guts/fstat.c
index b089b15..35ef0ad 100644
--- a/ports/linux/guts/fstat.c
+++ b/ports/linux/guts/fstat.c
@@ -7,8 +7,17 @@
  * int fstat(int fd, struct stat *buf)
  *	int rc = -1;
  */
-
+#ifdef __loongarch64
+	struct stat64 buf64;
+        /* populate buffer with complete data */
+	real_fstat(fd, buf);
+        /* obtain fake data */
+	rc = wrap_fstat64(fd, &buf64);
+        /* overwrite */
+	pseudo_stat32_from64(buf, &buf64);
+#else
 	rc = wrap___fxstat(_STAT_VER, fd, buf);
+#endif
 
 /*	return rc;
  * }
diff --git a/ports/linux/guts/fstat64.c b/ports/linux/guts/fstat64.c
index 6dd97da..77e1a00 100644
--- a/ports/linux/guts/fstat64.c
+++ b/ports/linux/guts/fstat64.c
@@ -7,8 +7,24 @@
  * int fstat64(int fd, struct stat *buf)
  *	int rc = -1;
  */
+#ifdef __loongarch64
+        pseudo_msg_t *msg;
+        int save_errno;
 
+        rc = real_fstat64(fd, buf);
+        save_errno = errno;
+        if (rc == -1) {
+                return rc;
+        }
+        msg = pseudo_client_op(OP_FSTAT, 0, fd, -1, 0, buf);
+        if (msg && msg->result == RESULT_SUCCEED) {
+                pseudo_stat_msg(buf, msg);
+        }
+
+        errno = save_errno;
+#else
 	rc = wrap___fxstat64(_STAT_VER, fd, buf);
+#endif
 
 /*	return rc;
  * }
diff --git a/ports/linux/guts/fstatat.c b/ports/linux/guts/fstatat.c
index 3267641..de69662 100644
--- a/ports/linux/guts/fstatat.c
+++ b/ports/linux/guts/fstatat.c
@@ -7,8 +7,14 @@
  * int fstatat(int dirfd, const char *path, struct stat *buf, int flags)
  *	int rc = -1;
  */
-
+#ifdef __loongarch64
+	struct stat64 buf64;
+	real_fstatat(dirfd,path,buf,flags);
+	rc = wrap_fstatat64(dirfd, path, &buf64, flags);
+	pseudo_stat32_from64(buf, &buf64);
+#else
 	rc = wrap___fxstatat(_STAT_VER, dirfd, path, buf, flags);
+#endif
 
 /*	return rc;
  * }
diff --git a/ports/linux/guts/fstatat64.c b/ports/linux/guts/fstatat64.c
index c981e14..f61d8aa 100644
--- a/ports/linux/guts/fstatat64.c
+++ b/ports/linux/guts/fstatat64.c
@@ -8,7 +8,50 @@
  *	int rc = -1;
  */
 
+#ifdef __loongarch64
+        pseudo_msg_t *msg;
+        int save_errno;
+
+#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
+        if (dirfd != AT_FDCWD) {
+                errno = ENOSYS;
+                return -1;
+        }
+#endif
+        if (flags & AT_SYMLINK_NOFOLLOW) {
+#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
+                rc = real_lstat64(path, buf);
+#else
+                rc = real_fstatat64(dirfd, path, buf, flags);
+#endif
+                if (rc == -1) {
+                        return rc;
+                }
+        } else {
+#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
+                rc = real_stat64( path, buf);
+#else
+                rc = real_fstatat64(dirfd, path, buf, flags);
+#endif
+                if (rc == -1) {
+                        return rc;
+                }
+        }
+        save_errno = errno;
+
+          /* query database
+         * note that symlink canonicalizing is now automatic, so we
+         * don't need to check for a symlink on this end
+         */
+        msg = pseudo_client_op(OP_STAT, 0, -1, dirfd, path, buf);
+        if (msg && msg->result == RESULT_SUCCEED) {
+                pseudo_stat_msg(buf, msg);
+        }
+
+        errno = save_errno;
+#else
 	rc = wrap___fxstatat64(_STAT_VER, dirfd, path, buf, flags);
+#endif
 
 /*	return rc;
  * }
diff --git a/ports/linux/guts/lstat.c b/ports/linux/guts/lstat.c
index d2c4d50..da88a9b 100644
--- a/ports/linux/guts/lstat.c
+++ b/ports/linux/guts/lstat.c
@@ -7,8 +7,11 @@
  * int lstat(const char *path, struct stat *buf)
  *	int rc = -1;
  */
-
+#ifdef __loongarch64
+	rc = wrap_fstatat(AT_FDCWD, path, buf, AT_SYMLINK_NOFOLLOW);
+#else
 	rc = wrap___fxstatat(_STAT_VER, AT_FDCWD, path, buf, AT_SYMLINK_NOFOLLOW);
+#endif
 
 /*	return rc;
  * }
diff --git a/ports/linux/guts/lstat64.c b/ports/linux/guts/lstat64.c
index 43d0ce1..fbbe727 100644
--- a/ports/linux/guts/lstat64.c
+++ b/ports/linux/guts/lstat64.c
@@ -7,8 +7,11 @@
  * int lstat64(const char *path, struct stat *buf)
  *	int rc = -1;
  */
-
+#ifdef __loongarch64
+	rc = wrap_fstatat64( AT_FDCWD, path, buf, AT_SYMLINK_NOFOLLOW);
+#else
 	rc = wrap___fxstatat64(_STAT_VER, AT_FDCWD, path, buf, AT_SYMLINK_NOFOLLOW);
+#endif
 
 /*	return rc;
  * }
diff --git a/ports/linux/guts/mknod.c b/ports/linux/guts/mknod.c
index 61fd320..512e5bb 100644
--- a/ports/linux/guts/mknod.c
+++ b/ports/linux/guts/mknod.c
@@ -8,7 +8,11 @@
  *	int rc = -1;
  */
 
+#ifdef __loongarch64
+	rc = wrap_mknodat(AT_FDCWD, path, mode, dev);
+#else
 	rc = wrap___xmknod(_MKNOD_VER, path, mode, &dev);
+#endif
 
 /*	return rc;
  * }
diff --git a/ports/linux/guts/mknodat.c b/ports/linux/guts/mknodat.c
index a7e4293..fb8c0c0 100644
--- a/ports/linux/guts/mknodat.c
+++ b/ports/linux/guts/mknodat.c
@@ -7,8 +7,80 @@
  * int mknodat(int dirfd, const char *path, mode_t mode, dev_t dev)
  *	int rc = -1;
  */
+#ifdef __loongarch64
+        pseudo_msg_t *msg;
+        struct stat64 buf;
 
+        /* mask out mode bits appropriately */
+        mode = mode & ~pseudo_umask;
+        /* if you don't specify a type, assume regular file */
+        if (!(mode & S_IFMT)) {
+                mode |= S_IFREG;
+        }
+        pseudo_debug(PDBGF_FILE, "mknodat creating '%s', mode 0%o\n",
+                path ? path : "<no name>", (int) mode);
+
+        /* we don't use underlying call, so _ver is irrelevant to us */
+#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
+        if (dirfd != AT_FDCWD) {
+                errno = ENOSYS;
+                return -1;
+        }
+        rc = real_stat64( path, &buf);
+#else
+        rc = real_fstatat64( dirfd, path, &buf, AT_SYMLINK_NOFOLLOW);
+#endif
+        if (rc != -1) {
+                /* if we can stat the file, you can't mknod it */
+                errno = EEXIST;
+                return -1;
+        }
+        if (!dev) {
+                errno = EINVAL;
+                return -1;
+        }
+#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
+        rc = real_open(path, O_CREAT | O_WRONLY | O_EXCL,
+                PSEUDO_FS_MODE(mode, 0));
+#else
+        rc = real_openat(dirfd, path, O_CREAT | O_WRONLY | O_EXCL,
+                PSEUDO_FS_MODE(mode, 0));
+#endif
+        if (rc == -1) {
+                return -1;
+        }
+        real_fchmod(rc, PSEUDO_FS_MODE(mode, 0));
+        real_fstat64( rc, &buf);
+        /* mknod does not really open the file.  We don't have
+         * to use wrap_close because we've never exposed this file
+         * descriptor to the client code.
+         */
+        real_close(rc);
+
+        /* mask in the mode type bits again */
+        buf.st_mode = (PSEUDO_DB_MODE(buf.st_mode, mode) & 07777) |
+                        (mode & ~07777);
+        buf.st_rdev = dev;
+        msg = pseudo_client_op(OP_MKNOD, 0, -1, dirfd, path, &buf);
+        if (msg && msg->result != RESULT_SUCCEED) {
+                errno = EPERM;
+                rc = -1;
+   } else {
+                /* just pretend we worked */
+                rc = 0;
+        }
+        if (rc == -1) {
+                int save_errno = errno;
+#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
+                real_unlink(path);
+#else
+                real_unlinkat(dirfd, path, AT_SYMLINK_NOFOLLOW);
+#endif
+                errno = save_errno;
+        }
+#else
 	rc = wrap___xmknodat(_MKNOD_VER, dirfd, path, mode, &dev);
+#endif
 
 /*	return rc;
  * }
diff --git a/ports/linux/guts/mkostemp64.c b/ports/linux/guts/mkostemp64.c
index 502211b..41052c6 100644
--- a/ports/linux/guts/mkostemp64.c
+++ b/ports/linux/guts/mkostemp64.c
@@ -35,7 +35,11 @@
 	if (rc != -1) {
 		save_errno = errno;
 
+#ifdef __loongarch64
+		if (real_fstat64(rc, &buf) != -1) {
+#else
 		if (real___fxstat64(_STAT_VER, rc, &buf) != -1) {
+#endif
 			real_fchmod(rc, PSEUDO_FS_MODE(0600, 0));
 			pseudo_client_op(OP_CREAT, 0, -1, -1, tmp_template, &buf);
 			pseudo_client_op(OP_OPEN, PSA_READ | PSA_WRITE, rc, -1, tmp_template, &buf);
diff --git a/ports/linux/guts/openat.c b/ports/linux/guts/openat.c
index 656ac2b..86ad5e9 100644
--- a/ports/linux/guts/openat.c
+++ b/ports/linux/guts/openat.c
@@ -56,12 +56,24 @@
 		save_errno = errno;
 #ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
 		if (flags & O_NOFOLLOW) {
+#ifdef __loongarch64
+			rc = real_lstat64(path,&buf);
+#else
 			rc = real___lxstat64(_STAT_VER, path, &buf);
+#endif
 		} else {
+#ifdef __loongarch64
+			rc = real_stat64(path,&buf);
+#else
 			rc = real___xstat64(_STAT_VER, path, &buf);
+#endif
 		}
+#else
+#ifdef __loongarch64
+		rc = real_fstatat64(dirfd, path, &buf, (flags & O_NOFOLLOW) ? AT_SYMLINK_NOFOLLOW : 0);
 #else
 		rc = real___fxstatat64(_STAT_VER, dirfd, path, &buf, (flags & O_NOFOLLOW) ? AT_SYMLINK_NOFOLLOW : 0);
+#endif
 #endif
 		existed = (rc != -1);
 		if (!existed)
@@ -77,12 +89,24 @@
 		save_errno = errno;
 #ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
 		if (flags & O_NOFOLLOW) {
+#ifdef __loongarch64
+			rc = real_lstat64(path, &buf);
+#else
 			rc = real___lxstat64(_STAT_VER, path, &buf);
+#endif
 		} else {
+#ifdef __loongarch64
+			rc = real_stat64(path, &buf);
+#else
 			rc = real___xstat64(_STAT_VER, path, &buf);
+#endif
 		}
+#else
+#ifdef __loongarch64
+		rc = real_fstatat64(dirfd, path, &buf, (flags & O_NOFOLLOW) ? AT_SYMLINK_NOFOLLOW : 0);
 #else
 		rc = real___fxstatat64(_STAT_VER, dirfd, path, &buf, (flags & O_NOFOLLOW) ? AT_SYMLINK_NOFOLLOW : 0);
+#endif
 #endif
 		if (rc != -1 && S_ISFIFO(buf.st_mode)) {
 			overly_magic_nonblocking = 1;
@@ -135,12 +159,24 @@
 #endif
 #ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
 		if (flags & O_NOFOLLOW) {
+#ifdef __loongarch64
+			stat_rc = real_lstat64( path, &buf);
+#else
 			stat_rc = real___lxstat64(_STAT_VER, path, &buf);
+#endif
 		} else {
+#ifdef __loongarch64
+			stat_rc = real_stat64(path, &buf);
+#else
 			stat_rc = real___xstat64(_STAT_VER, path, &buf);
+#endif
 		}
+#else
+#ifdef __loongarch64
+		stat_rc = real_fstatat64(dirfd, path, &buf, (flags & O_NOFOLLOW) ? AT_SYMLINK_NOFOLLOW : 0);
 #else
 		stat_rc = real___fxstatat64(_STAT_VER, dirfd, path, &buf, (flags & O_NOFOLLOW) ? AT_SYMLINK_NOFOLLOW : 0);
+#endif
 #endif
 
 		pseudo_debug(PDBGF_FILE, "openat(path %s), flags %o, stat rc %d, stat mode %o\n",
diff --git a/ports/linux/guts/stat.c b/ports/linux/guts/stat.c
index f8c73f7..5a7b57b 100644
--- a/ports/linux/guts/stat.c
+++ b/ports/linux/guts/stat.c
@@ -7,8 +7,11 @@
  * int stat(const char *path, struct stat *buf)
  *	int rc = -1;
  */
-
+#ifdef __loongarch64
+	rc = wrap_fstatat(AT_FDCWD, path, buf, 0);
+#else
 	rc = wrap___fxstatat(_STAT_VER, AT_FDCWD, path, buf, 0);
+#endif
 
 /*	return rc;
  * }
diff --git a/ports/linux/guts/stat64.c b/ports/linux/guts/stat64.c
index d8b3f36..ee0583c 100644
--- a/ports/linux/guts/stat64.c
+++ b/ports/linux/guts/stat64.c
@@ -7,8 +7,11 @@
  * int stat64(const char *path, struct stat *buf)
  *	int rc = -1;
  */
-
+#ifdef __loongarch64
+	rc = wrap_fstatat64(AT_FDCWD, path, buf, 0);
+#else
 	rc = wrap___fxstatat64(_STAT_VER, AT_FDCWD, path, buf, 0);
+#endif
 
 /*	return rc;
  * }
diff --git a/ports/linux/pseudo_wrappers.c b/ports/linux/pseudo_wrappers.c
index 7659897..c0775b9 100644
--- a/ports/linux/pseudo_wrappers.c
+++ b/ports/linux/pseudo_wrappers.c
@@ -8,43 +8,75 @@
  */
 int
 pseudo_stat(const char *path, struct stat *buf) {
+#ifdef __loongarch64
+	return real_stat( path, buf);
+#else
 	return real___xstat(_STAT_VER, path, buf);
+#endif
 }
 
 int
 pseudo_lstat(const char *path, struct stat *buf) {
+#ifdef __loongarch64
+	return real_lstat(path,buf);
+#else
 	return real___lxstat(_STAT_VER, path, buf);
+#endif
 }
 
 int
 pseudo_fstat(int fd, struct stat *buf) {
+#ifdef __loongarch64
+	return real_fstat(fd,buf);
+#else
 	return real___fxstat(_STAT_VER, fd, buf);
+#endif
 }
 
 int
 pseudo_stat64(const char *path, struct stat64 *buf) {
+#ifdef __loongarch64
+	return real_stat64(path,buf);
+#else
 	return real___xstat64(_STAT_VER, path, buf);
+#endif
 }
 
 int
 pseudo_lstat64(const char *path, struct stat64 *buf) {
+#ifdef __loongarch64
+	return real_lstat64(path,buf);
+#else
 	return real___lxstat64(_STAT_VER, path, buf);
+#endif
 }
 
 int
 pseudo_fstat64(int fd, struct stat64 *buf) {
+#ifdef __loongarch64
+	return	real_fstat64(fd,buf);
+#else
 	return real___fxstat64(_STAT_VER, fd, buf);
+#endif
 }
 
 /* similar thing happens with mknod */
 int
 pseudo_mknod(const char *path, mode_t mode, dev_t dev) {
+#ifdef __loongarch64
+	return real_mknod(path,mode,dev);
+#else
 	return real___xmknod(_MKNOD_VER, path, mode, &dev);
+#endif
 }
 
 int
 pseudo_mknodat(int dirfd, const char *path, mode_t mode, dev_t dev) {
+#ifdef __loongarch64
+	return real_mknodat(dirfd,path,mode,dev);
+#else
 	return real___xmknodat(_MKNOD_VER, dirfd, path, mode, &dev);
+#endif
 }
 
 int pseudo_capset(cap_user_header_t hdrp, const cap_user_data_t datap) {
diff --git a/pseudo_client.h b/pseudo_client.h
index d7944ce..32dfe1a 100644
--- a/pseudo_client.h
+++ b/pseudo_client.h
@@ -14,13 +14,21 @@ extern void pseudo_client_linked_paths(const char *oldpath, const char *newpath)
 #define base_lstat real_lstat64
 #define base_fstat real_fstat64
 #define base_stat real_stat64
+#ifdef __loongarch64
+#define base_fstatat(dirfd, path, buf, flags) real_fstatat64( dirfd, path, buf, flags)
+#else
 #define base_fstatat(dirfd, path, buf, flags) real___fxstatat64(_STAT_VER, dirfd, path, buf, flags)
+#endif
 #else
 #define base_lstat real_lstat
 #define base_fstat real_fstat
 #define base_stat real_stat
+#ifdef __loongarch64
+#define base_fstatat(dirfd, path, buf, flags) real_fstatat( dirfd, path, buf, flags
+#else
 #define base_fstatat(dirfd, path, buf, flags) real___fxstatat(_STAT_VER, dirfd, path, buf, flags)
 #endif
+#endif
 extern void pseudo_antimagic(void);
 extern void pseudo_magic(void);
 extern void pseudo_client_touchuid(void);
diff --git a/templates/wrapfuncs.c b/templates/wrapfuncs.c
index 93bb671..14a42e2 100644
--- a/templates/wrapfuncs.c
+++ b/templates/wrapfuncs.c
@@ -13,7 +13,9 @@
  * script if you want to modify this. */
 @body
 
+#ifndef __loongarch64
 static ${type} (*real_${name})(${decl_args}) = ${real_init};
+#endif
 
 ${maybe_skip}
 
-- 
2.33.0


