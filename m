Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2ADAEB64DA
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 20:07:16 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web11.412.1689883628634050353
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 13:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=GwMivVyU;
 spf=pass (domain: baylibre.com, ip: 209.85.217.47, mailfrom: tgamblin@baylibre.com)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-443571eda4dso550279137.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 13:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689883627; x=1690488427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5EL+1MVQ1EfwYBU6q4p3QWXPTcdH6ZXSNTWbvPxkRrM=;
        b=GwMivVyU29+YnQz9sxVycPYEzuIjt8OVejhjonX0DDFuRcHc/4OMuGyC5bnzcgeYwt
         8sD7L/4RMDveP5kZB1MljtrUEhuhbmQfZLT65S27cMWc8plN7Mzmb3cd8B1JWY8Wi63O
         rt7/S37y3pOGtgxVTwLnW0XEZuKu4hmVcsP1e6XGSmMiq1or90rbMGAJoKgUYOghd8CV
         SJevtAwdHL2r0/PXGwl+KejL26rTYJy0KhLAYJ04K+vsJs26kCU+T1UzmFjb383IhueQ
         M4Me/YrqiQhxpJq949NXhIFq22yTT5efaUrOlyKob2td0ecLWiSKcCNJjS8/J/IQcR7K
         WVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689883627; x=1690488427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5EL+1MVQ1EfwYBU6q4p3QWXPTcdH6ZXSNTWbvPxkRrM=;
        b=V0jimOVu5GNSuOcix4BUNhHItXOHp/CjLkHFWm8+Ai2OSz/NejZon9C9CiLKEGQh3W
         VAywDEx1piVOSufmufCaLGOmwfs+2Q3LMsGKblSIQaWs8tqmIi6p0ybj9mRsN7Bfz3X3
         ZEglzXd7bqIbDPHELI+2wnQhgMQyTh9oAtLIvggN0sYFEwclqXgYM4oqrKqFXrQtgPDg
         w1zQGEqBwPIYZybsyHD84kHvI6aVg2ZAputnV4i7bJi/k/SvFbvWOtNn6yj0YGHQAoi4
         U98oxM2EV2TlM7HiaTReOKkwqsTGpPOWAFUMVutSkYpRUlmfVzNb2WMmuF+5BimbTXFk
         MtgA==
X-Gm-Message-State: ABy/qLZLkw+ZTlP/9hU5sHVOHGBRuAcMlCAgbgcH3E8HfElpdlTWlBgt
	TkQWwlvL7c59U0JvPtdR5zLgJKWmgmAjtXhLxbE=
X-Google-Smtp-Source: APBJJlGvh5LGSeZ7j96HSxWJTqGRFZAzZ/AcUwwQcPSHVspW6O8TzpVk/tJlMt5fe9bZIgwxayRDiw==
X-Received: by 2002:a67:f051:0:b0:444:5e9c:f5d4 with SMTP id q17-20020a67f051000000b004445e9cf5d4mr13279097vsm.16.1689883627289;
        Thu, 20 Jul 2023 13:07:07 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id j3-20020a0cf503000000b006262de12a8csm696071qvm.65.2023.07.20.13.07.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 13:07:07 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] nfs-utils: upgrade 2.6.2 -> 2.6.3
Date: Thu, 20 Jul 2023 16:07:05 -0400
Message-ID: <20230720200705.2314636-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 20:07:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184660

Changelog: http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=shortlog

Three patches were removed as they're now upstream:

2c0b5249 Replace statfs64 with statfs
167f2336 Fix function prototypes
896946e3 mountd: Check for return of stat function

do_compile still failed after removing these patches, reporting
undefined references to 'event_base_new', 'sqlite3_open_v2', etc. This
is fixed by backporting
0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch from
upstream.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
v2 replaces the use of LDFLAGS:append with a backport from upstream that
fixes the issue by modifying configure.ac.

 .../0001-Replace-statfs64-with-statfs.patch   | 171 ------------------
 ...event-and-libsqlite3-checked-when-nf.patch |  80 ++++++++
 ...td-Check-for-return-of-stat-function.patch |  34 ----
 .../0006-Fix-function-prototypes.patch        |  93 ----------
 ...{nfs-utils_2.6.2.bb => nfs-utils_2.6.3.bb} |   8 +-
 5 files changed, 84 insertions(+), 302 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Replace-statfs64-with-statfs.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0005-mountd-Check-for-return-of-stat-function.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0006-Fix-function-prototypes.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.6.2.bb => nfs-utils_2.6.3.bb} (95%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Replace-statfs64-with-statfs.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Replace-statfs64-with-statfs.patch
deleted file mode 100644
index 40ceff9ae9..0000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Replace-statfs64-with-statfs.patch
+++ /dev/null
@@ -1,171 +0,0 @@
-From e89652b853ca7de671093ae44305fa3435e13d3d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 15 Dec 2022 13:29:43 -0800
-Subject: [PATCH] Replace statfs64 with statfs
-
-autoconf AC_SYS_LARGEFILE is used by configure to add needed defines
-when needed for enabling 64bit off_t, therefore replacing statfs64 with
-statfs should be functionally same. Additionally this helps compiling
-with latest musl where 64bit LFS functions like statfs64 and friends are
-now moved under _LARGEFILE64_SOURCE feature test macro, this works on
-glibc systems because _GNU_SOURCE macros also enables
-_LARGEFILE64_SOURCE indirectly. This is not case with musl and this
-latest issue is exposed.
-
-Upstream-Status: Submitted [https://lore.kernel.org/linux-nfs/20221215213605.4061853-1-raj.khem@gmail.com/T/#u]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- support/export/cache.c      | 14 +++++++-------
- support/include/nfsd_path.h |  6 +++---
- support/misc/nfsd_path.c    | 24 ++++++++++++------------
- utils/exportfs/exportfs.c   |  4 ++--
- 4 files changed, 24 insertions(+), 24 deletions(-)
-
-diff --git a/support/export/cache.c b/support/export/cache.c
-index a5823e9..2497d4f 100644
---- a/support/export/cache.c
-+++ b/support/export/cache.c
-@@ -346,27 +346,27 @@ static int uuid_by_path(char *path, int type, size_t uuidlen, char *uuid)
- 
- 	/* Possible sources of uuid are
- 	 * - blkid uuid
--	 * - statfs64 uuid
-+	 * - statfs uuid
- 	 *
--	 * On some filesystems (e.g. vfat) the statfs64 uuid is simply an
-+	 * On some filesystems (e.g. vfat) the statfs uuid is simply an
- 	 * encoding of the device that the filesystem is mounted from, so
- 	 * it we be very bad to use that (as device numbers change).  blkid
- 	 * must be preferred.
--	 * On other filesystems (e.g. btrfs) the statfs64 uuid contains
-+	 * On other filesystems (e.g. btrfs) the statfs uuid contains
- 	 * important info that the blkid uuid cannot contain:  This happens
- 	 * when multiple subvolumes are exported (they have the same
--	 * blkid uuid but different statfs64 uuids).
-+	 * blkid uuid but different statfs uuids).
- 	 * We rely on get_uuid_blkdev *knowing* which is which and not returning
--	 * a uuid for filesystems where the statfs64 uuid is better.
-+	 * a uuid for filesystems where the statfs uuid is better.
- 	 *
- 	 */
--	struct statfs64 st;
-+	struct statfs st;
- 	char fsid_val[17];
- 	const char *blkid_val = NULL;
- 	const char *val;
- 	int rc;
- 
--	rc = nfsd_path_statfs64(path, &st);
-+	rc = nfsd_path_statfs(path, &st);
- 
- 	if (type == 0 && rc == 0) {
- 		const unsigned long *bad;
-diff --git a/support/include/nfsd_path.h b/support/include/nfsd_path.h
-index 3b73aad..aa1e1dd 100644
---- a/support/include/nfsd_path.h
-+++ b/support/include/nfsd_path.h
-@@ -7,7 +7,7 @@
- #include <sys/stat.h>
- 
- struct file_handle;
--struct statfs64;
-+struct statfs;
- 
- void 		nfsd_path_init(void);
- 
-@@ -18,8 +18,8 @@ char *		nfsd_path_prepend_dir(const char *dir, const char *pathname);
- int 		nfsd_path_stat(const char *pathname, struct stat *statbuf);
- int 		nfsd_path_lstat(const char *pathname, struct stat *statbuf);
- 
--int		nfsd_path_statfs64(const char *pathname,
--				   struct statfs64 *statbuf);
-+int		nfsd_path_statfs(const char *pathname,
-+				   struct statfs *statbuf);
- 
- char *		nfsd_realpath(const char *path, char *resolved_path);
- 
-diff --git a/support/misc/nfsd_path.c b/support/misc/nfsd_path.c
-index 65e53c1..c3dea4f 100644
---- a/support/misc/nfsd_path.c
-+++ b/support/misc/nfsd_path.c
-@@ -184,46 +184,46 @@ nfsd_path_lstat(const char *pathname, struct stat *statbuf)
- 	return nfsd_run_stat(nfsd_wq, nfsd_lstatfunc, pathname, statbuf);
- }
- 
--struct nfsd_statfs64_data {
-+struct nfsd_statfs_data {
- 	const char *pathname;
--	struct statfs64 *statbuf;
-+	struct statfs *statbuf;
- 	int ret;
- 	int err;
- };
- 
- static void
--nfsd_statfs64func(void *data)
-+nfsd_statfsfunc(void *data)
- {
--	struct nfsd_statfs64_data *d = data;
-+	struct nfsd_statfs_data *d = data;
- 
--	d->ret = statfs64(d->pathname, d->statbuf);
-+	d->ret = statfs(d->pathname, d->statbuf);
- 	if (d->ret < 0)
- 		d->err = errno;
- }
- 
- static int
--nfsd_run_statfs64(struct xthread_workqueue *wq,
-+nfsd_run_statfs(struct xthread_workqueue *wq,
- 		  const char *pathname,
--		  struct statfs64 *statbuf)
-+		  struct statfs *statbuf)
- {
--	struct nfsd_statfs64_data data = {
-+	struct nfsd_statfs_data data = {
- 		pathname,
- 		statbuf,
- 		0,
- 		0
- 	};
--	xthread_work_run_sync(wq, nfsd_statfs64func, &data);
-+	xthread_work_run_sync(wq, nfsd_statfsfunc, &data);
- 	if (data.ret < 0)
- 		errno = data.err;
- 	return data.ret;
- }
- 
- int
--nfsd_path_statfs64(const char *pathname, struct statfs64 *statbuf)
-+nfsd_path_statfs(const char *pathname, struct statfs *statbuf)
- {
- 	if (!nfsd_wq)
--		return statfs64(pathname, statbuf);
--	return nfsd_run_statfs64(nfsd_wq, pathname, statbuf);
-+		return statfs(pathname, statbuf);
-+	return nfsd_run_statfs(nfsd_wq, pathname, statbuf);
- }
- 
- struct nfsd_realpath_data {
-diff --git a/utils/exportfs/exportfs.c b/utils/exportfs/exportfs.c
-index 0897b22..6d79a5b 100644
---- a/utils/exportfs/exportfs.c
-+++ b/utils/exportfs/exportfs.c
-@@ -513,7 +513,7 @@ validate_export(nfs_export *exp)
- 	 */
- 	struct stat stb;
- 	char *path = exportent_realpath(&exp->m_export);
--	struct statfs64 stf;
-+	struct statfs stf;
- 	int fs_has_fsid = 0;
- 
- 	if (stat(path, &stb) < 0) {
-@@ -528,7 +528,7 @@ validate_export(nfs_export *exp)
- 	if (!can_test())
- 		return;
- 
--	if (!statfs64(path, &stf) &&
-+	if (!statfs(path, &stf) &&
- 	    (stf.f_fsid.__val[0] || stf.f_fsid.__val[1]))
- 		fs_has_fsid = 1;
- 
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch
new file mode 100644
index 0000000000..5afc714f19
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch
@@ -0,0 +1,80 @@
+From b62a3fe424026b73ec6b1934483b16863c7dff23 Mon Sep 17 00:00:00 2001
+From: Wiktor Jaskulski <wjaskulski@adva.com>
+Date: Thu, 11 May 2023 15:28:23 -0400
+Subject: [PATCH] configure.ac: libevent and libsqlite3 checked when nfsv4 is
+ disabled
+
+Upstream-Status: Backport
+(http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=bc4a5deef9f820c55fdac3c0070364c17cd91cca)
+
+Signed-off-by: Steve Dickson <steved@redhat.com>
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ configure.ac | 38 +++++++++++++++-----------------------
+ 1 file changed, 15 insertions(+), 23 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4ade528d..519cacbf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -335,42 +335,34 @@ AC_CHECK_HEADER(rpc/rpc.h, ,
+                 AC_MSG_ERROR([Header file rpc/rpc.h not found - maybe try building with --enable-tirpc]))
+ CPPFLAGS="${nfsutils_save_CPPFLAGS}"
+ 
++dnl check for libevent libraries and headers
++AC_LIBEVENT
++
++dnl Check for sqlite3
++AC_SQLITE3_VERS
++
++case $libsqlite3_cv_is_recent in
++yes) ;;
++unknown)
++   dnl do not fail when cross-compiling
++   AC_MSG_WARN([assuming sqlite is at least v3.3]) ;;
++*)
++   AC_MSG_ERROR([nfsdcld requires sqlite-devel]) ;;
++esac
++
+ if test "$enable_nfsv4" = yes; then
+-  dnl check for libevent libraries and headers
+-  AC_LIBEVENT
+ 
+   dnl check for the keyutils libraries and headers
+   AC_KEYUTILS
+ 
+-  dnl Check for sqlite3
+-  AC_SQLITE3_VERS
+-
+   if test "$enable_nfsdcld" = "yes"; then
+ 	AC_CHECK_HEADERS([libgen.h sys/inotify.h], ,
+ 		AC_MSG_ERROR([Cannot find header needed for nfsdcld]))
+-
+-    case $libsqlite3_cv_is_recent in
+-    yes) ;;
+-    unknown)
+-      dnl do not fail when cross-compiling
+-      AC_MSG_WARN([assuming sqlite is at least v3.3]) ;;
+-    *)
+-      AC_MSG_ERROR([nfsdcld requires sqlite-devel]) ;;
+-    esac
+   fi
+ 
+   if test "$enable_nfsdcltrack" = "yes"; then
+ 	AC_CHECK_HEADERS([libgen.h sys/inotify.h], ,
+ 		AC_MSG_ERROR([Cannot find header needed for nfsdcltrack]))
+-
+-    case $libsqlite3_cv_is_recent in
+-    yes) ;;
+-    unknown)
+-      dnl do not fail when cross-compiling
+-      AC_MSG_WARN([assuming sqlite is at least v3.3]) ;;
+-    *)
+-      AC_MSG_ERROR([nfsdcltrack requires sqlite-devel]) ;;
+-    esac
+   fi
+ 
+ else
+-- 
+2.41.0
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-mountd-Check-for-return-of-stat-function.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-mountd-Check-for-return-of-stat-function.patch
deleted file mode 100644
index 13a21e5307..0000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-mountd-Check-for-return-of-stat-function.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 887ecc7837962e9be77a4fea7d9122648f73a84a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 15 Aug 2022 14:47:53 -0700
-Subject: [PATCH] mountd: Check for return of stat function
-
-simplify the check, stat() return 0 on success -1 on failure
-
-Fixes clang reported errors e.g.
-
-| v4clients.c:29:6: error: logical not is only applied to the left hand side of this comparison [-Werror,-Wlogical-not-parentheses]
-|         if (!stat("/proc/fs/nfsd/clients", &sb) == 0 ||
-|             ^                                   ~~
-
-Upstream-Status: Submitted [https://patchwork.kernel.org/project/linux-nfs/patch/20220816024403.2694169-1-raj.khem@gmail.com/]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Cc: Konstantin Khorenko <khorenko@virtuozzo.com>
-Cc: Steve Dickson <steved@redhat.com>
----
- support/export/v4clients.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/support/export/v4clients.c b/support/export/v4clients.c
-index 5f15b61..3230251 100644
---- a/support/export/v4clients.c
-+++ b/support/export/v4clients.c
-@@ -26,7 +26,7 @@ void v4clients_init(void)
- {
- 	struct stat sb;
- 
--	if (!stat("/proc/fs/nfsd/clients", &sb) == 0 ||
-+	if (stat("/proc/fs/nfsd/clients", &sb) != 0 ||
- 	    !S_ISDIR(sb.st_mode))
- 		return;
- 	if (clients_fd >= 0)
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0006-Fix-function-prototypes.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0006-Fix-function-prototypes.patch
deleted file mode 100644
index 793bc4651c..0000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0006-Fix-function-prototypes.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From cf0ffbb5c8fa167376926d12a63613f15aa7602f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 15 Aug 2022 14:50:15 -0700
-Subject: [PATCH] Fix function prototypes
-
-Clang is now erroring out on functions with out parameter types
-
-Fixes errors like
-error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
-
-Upstream-Status: Submitted [https://patchwork.kernel.org/project/linux-nfs/patch/20220816024403.2694169-2-raj.khem@gmail.com/]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- support/export/auth.c     | 2 +-
- support/export/v4root.c   | 2 +-
- support/export/xtab.c     | 2 +-
- utils/exportfs/exportfs.c | 4 ++--
- utils/mount/network.c     | 2 +-
- 5 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/support/export/auth.c b/support/export/auth.c
-index 03ce4b8..2d7960f 100644
---- a/support/export/auth.c
-+++ b/support/export/auth.c
-@@ -82,7 +82,7 @@ check_useipaddr(void)
- }
- 
- unsigned int
--auth_reload()
-+auth_reload(void)
- {
- 	struct stat		stb;
- 	static ino_t		last_inode;
-diff --git a/support/export/v4root.c b/support/export/v4root.c
-index c12a7d8..fbb0ad5 100644
---- a/support/export/v4root.c
-+++ b/support/export/v4root.c
-@@ -198,7 +198,7 @@ static int v4root_add_parents(nfs_export *exp)
-  * looking for components of the v4 mount.
-  */
- void
--v4root_set()
-+v4root_set(void)
- {
- 	nfs_export	*exp;
- 	int	i;
-diff --git a/support/export/xtab.c b/support/export/xtab.c
-index c888a80..e210ca9 100644
---- a/support/export/xtab.c
-+++ b/support/export/xtab.c
-@@ -135,7 +135,7 @@ xtab_write(char *xtab, char *xtabtmp, char *lockfn, int is_export)
- }
- 
- int
--xtab_export_write()
-+xtab_export_write(void)
- {
- 	return xtab_write(etab.statefn, etab.tmpfn, etab.lockfn, 1);
- }
-diff --git a/utils/exportfs/exportfs.c b/utils/exportfs/exportfs.c
-index 6ba615d..0897b22 100644
---- a/utils/exportfs/exportfs.c
-+++ b/utils/exportfs/exportfs.c
-@@ -69,14 +69,14 @@ static int _lockfd = -1;
-  * need these additional lockfile() routines.
-  */
- static void
--grab_lockfile()
-+grab_lockfile(void)
- {
- 	_lockfd = open(lockfile, O_CREAT|O_RDWR, 0666);
- 	if (_lockfd != -1)
- 		lockf(_lockfd, F_LOCK, 0);
- }
- static void
--release_lockfile()
-+release_lockfile(void)
- {
- 	if (_lockfd != -1) {
- 		lockf(_lockfd, F_ULOCK, 0);
-diff --git a/utils/mount/network.c b/utils/mount/network.c
-index ed2f825..01ead49 100644
---- a/utils/mount/network.c
-+++ b/utils/mount/network.c
-@@ -179,7 +179,7 @@ static const unsigned long probe_mnt3_only[] = {
- 
- static const unsigned int *nfs_default_proto(void);
- #ifdef MOUNT_CONFIG
--static const unsigned int *nfs_default_proto()
-+static const unsigned int *nfs_default_proto(void)
- {
- 	extern unsigned long config_default_proto;
- 	/*
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.2.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.3.bb
similarity index 95%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.2.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.3.bb
index 21df1803c5..4454285789 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.2.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.3.bb
@@ -30,11 +30,9 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://bugfix-adjust-statd-service-name.patch \
            file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
            file://clang-warnings.patch \
-           file://0005-mountd-Check-for-return-of-stat-function.patch \
-           file://0006-Fix-function-prototypes.patch \
-           file://0001-Replace-statfs64-with-statfs.patch \
+           file://0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch \
            "
-SRC_URI[sha256sum] = "5200873e81c4d610e2462fc262fe18135f2dbe78b7979f95accd159ae64d5011"
+SRC_URI[sha256sum] = "38d89e853a71d3c560ff026af3d969d75e24f782ff68324e76261fe0344459e1"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
@@ -62,6 +60,8 @@ EXTRA_OECONF = "--with-statduser=rpcuser \
                 --with-rpcgen=${HOSTTOOLS_DIR}/rpcgen \
                "
 
+LDFLAGS:append = " -lsqlite3 -levent"
+
 PACKAGECONFIG ??= "tcp-wrappers \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
 "
-- 
2.41.0


