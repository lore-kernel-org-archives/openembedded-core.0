Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73FBEC3DA7C
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 17:56:05 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.25706.1671645357563007509
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 09:55:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QTHY6xGH;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id 17so16323810pll.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 09:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eod0oeRvWvSVTtcw0q/ftnVPZEa0U470x2V4ByPOWBY=;
        b=QTHY6xGHuGSlUkLHvM4d2Y80iupYF8q/2v30aTRFdfI3gFT6RRCt+ekjoY8K65N7gZ
         VoH24e6SQ+yMi06ixHwQTUlUAom8R05dItskhbA9ey6DnRWI51VzdHZdS/tLqp6vWAKt
         9yPeD4VNxS4MWtXIV8lCuLyHjbqWAQNxiVR7AQLEaBlexTAr7r/lLlE7K4mF6DHrop0d
         i0bfEMoBhqQqzTfiVh7PgjW3LrHk5+1/WSGSrM6qlrVN50hY67vmykJylj6oqGBPSPfz
         8I2aNI1y/ZUMJ6hxGIJIq2Cj3fpUk85LaWnspsZttfmrxG11j8ReyKfva2sz0pDJkPUO
         sOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eod0oeRvWvSVTtcw0q/ftnVPZEa0U470x2V4ByPOWBY=;
        b=H4MIXbqsnbv6hnuV4gkqP7nMZwpTLBxZIrXfijBtF8tOHAkCpdCNEuW8RAp1lG7gCy
         gqjF9x98w3bYKPEgTLeVBC1GRUwQoDXiZRSi7mKfKTjqVq3b/UH1rBKPnFDJNqlWWDKA
         Sxi9Sgv8PNMj8eEzDPz6K4JP+6ykhoPZ12ipPK8vmfCnJ46sh3DzqrFpp/xwxpQi6QAq
         bzIGYG55muciaUjDFDlHj8sBwQJ/fMm70t8FJhDfy9hTht7UbGcqJyMbv6G8QpgzfwBK
         S0cHMjfgaHlJ31s08U5AHFrwKVDlpY5qPi1MIUMbug6uAkrH7gRAZET5aycuoH8psojX
         VDxQ==
X-Gm-Message-State: AFqh2kq/DQaX+qEEl25SRTu9pVrsZhBuvcqApIDspL9OvyEKqIm58uH3
	niAEPucfmw5f84HTG9iQqnIzhIlVxeI=
X-Google-Smtp-Source: AMrXdXu21AZ4X9EYTp3DNYuBJ6QpWsSYIPt0sDx/8lyKrFkVcs6zkzJ48MzMqWV0/StYLdtV23s8/g==
X-Received: by 2002:a17:90b:1091:b0:21e:1c03:3908 with SMTP id gj17-20020a17090b109100b0021e1c033908mr2596477pjb.15.1671645356688;
        Wed, 21 Dec 2022 09:55:56 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::41f2])
        by smtp.gmail.com with ESMTPSA id x11-20020a17090a294b00b00225a127b2a2sm1548943pjf.5.2022.12.21.09.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 09:55:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/9] nfs-utils: Replace statfs64 with statfs
Date: Wed, 21 Dec 2022 09:55:46 -0800
Message-Id: <20221221175551.1940464-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221175551.1940464-1-raj.khem@gmail.com>
References: <20221221175551.1940464-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 17:56:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174929

Fixes LFS64 builds

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Replace-statfs64-with-statfs.patch   | 171 ++++++++++++++++++
 .../nfs-utils/nfs-utils_2.6.2.bb              |   1 +
 2 files changed, 172 insertions(+)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Replace-statfs64-with-statfs.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Replace-statfs64-with-statfs.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Replace-statfs64-with-statfs.patch
new file mode 100644
index 0000000000..40ceff9ae9
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Replace-statfs64-with-statfs.patch
@@ -0,0 +1,171 @@
+From e89652b853ca7de671093ae44305fa3435e13d3d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 15 Dec 2022 13:29:43 -0800
+Subject: [PATCH] Replace statfs64 with statfs
+
+autoconf AC_SYS_LARGEFILE is used by configure to add needed defines
+when needed for enabling 64bit off_t, therefore replacing statfs64 with
+statfs should be functionally same. Additionally this helps compiling
+with latest musl where 64bit LFS functions like statfs64 and friends are
+now moved under _LARGEFILE64_SOURCE feature test macro, this works on
+glibc systems because _GNU_SOURCE macros also enables
+_LARGEFILE64_SOURCE indirectly. This is not case with musl and this
+latest issue is exposed.
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-nfs/20221215213605.4061853-1-raj.khem@gmail.com/T/#u]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ support/export/cache.c      | 14 +++++++-------
+ support/include/nfsd_path.h |  6 +++---
+ support/misc/nfsd_path.c    | 24 ++++++++++++------------
+ utils/exportfs/exportfs.c   |  4 ++--
+ 4 files changed, 24 insertions(+), 24 deletions(-)
+
+diff --git a/support/export/cache.c b/support/export/cache.c
+index a5823e9..2497d4f 100644
+--- a/support/export/cache.c
++++ b/support/export/cache.c
+@@ -346,27 +346,27 @@ static int uuid_by_path(char *path, int type, size_t uuidlen, char *uuid)
+ 
+ 	/* Possible sources of uuid are
+ 	 * - blkid uuid
+-	 * - statfs64 uuid
++	 * - statfs uuid
+ 	 *
+-	 * On some filesystems (e.g. vfat) the statfs64 uuid is simply an
++	 * On some filesystems (e.g. vfat) the statfs uuid is simply an
+ 	 * encoding of the device that the filesystem is mounted from, so
+ 	 * it we be very bad to use that (as device numbers change).  blkid
+ 	 * must be preferred.
+-	 * On other filesystems (e.g. btrfs) the statfs64 uuid contains
++	 * On other filesystems (e.g. btrfs) the statfs uuid contains
+ 	 * important info that the blkid uuid cannot contain:  This happens
+ 	 * when multiple subvolumes are exported (they have the same
+-	 * blkid uuid but different statfs64 uuids).
++	 * blkid uuid but different statfs uuids).
+ 	 * We rely on get_uuid_blkdev *knowing* which is which and not returning
+-	 * a uuid for filesystems where the statfs64 uuid is better.
++	 * a uuid for filesystems where the statfs uuid is better.
+ 	 *
+ 	 */
+-	struct statfs64 st;
++	struct statfs st;
+ 	char fsid_val[17];
+ 	const char *blkid_val = NULL;
+ 	const char *val;
+ 	int rc;
+ 
+-	rc = nfsd_path_statfs64(path, &st);
++	rc = nfsd_path_statfs(path, &st);
+ 
+ 	if (type == 0 && rc == 0) {
+ 		const unsigned long *bad;
+diff --git a/support/include/nfsd_path.h b/support/include/nfsd_path.h
+index 3b73aad..aa1e1dd 100644
+--- a/support/include/nfsd_path.h
++++ b/support/include/nfsd_path.h
+@@ -7,7 +7,7 @@
+ #include <sys/stat.h>
+ 
+ struct file_handle;
+-struct statfs64;
++struct statfs;
+ 
+ void 		nfsd_path_init(void);
+ 
+@@ -18,8 +18,8 @@ char *		nfsd_path_prepend_dir(const char *dir, const char *pathname);
+ int 		nfsd_path_stat(const char *pathname, struct stat *statbuf);
+ int 		nfsd_path_lstat(const char *pathname, struct stat *statbuf);
+ 
+-int		nfsd_path_statfs64(const char *pathname,
+-				   struct statfs64 *statbuf);
++int		nfsd_path_statfs(const char *pathname,
++				   struct statfs *statbuf);
+ 
+ char *		nfsd_realpath(const char *path, char *resolved_path);
+ 
+diff --git a/support/misc/nfsd_path.c b/support/misc/nfsd_path.c
+index 65e53c1..c3dea4f 100644
+--- a/support/misc/nfsd_path.c
++++ b/support/misc/nfsd_path.c
+@@ -184,46 +184,46 @@ nfsd_path_lstat(const char *pathname, struct stat *statbuf)
+ 	return nfsd_run_stat(nfsd_wq, nfsd_lstatfunc, pathname, statbuf);
+ }
+ 
+-struct nfsd_statfs64_data {
++struct nfsd_statfs_data {
+ 	const char *pathname;
+-	struct statfs64 *statbuf;
++	struct statfs *statbuf;
+ 	int ret;
+ 	int err;
+ };
+ 
+ static void
+-nfsd_statfs64func(void *data)
++nfsd_statfsfunc(void *data)
+ {
+-	struct nfsd_statfs64_data *d = data;
++	struct nfsd_statfs_data *d = data;
+ 
+-	d->ret = statfs64(d->pathname, d->statbuf);
++	d->ret = statfs(d->pathname, d->statbuf);
+ 	if (d->ret < 0)
+ 		d->err = errno;
+ }
+ 
+ static int
+-nfsd_run_statfs64(struct xthread_workqueue *wq,
++nfsd_run_statfs(struct xthread_workqueue *wq,
+ 		  const char *pathname,
+-		  struct statfs64 *statbuf)
++		  struct statfs *statbuf)
+ {
+-	struct nfsd_statfs64_data data = {
++	struct nfsd_statfs_data data = {
+ 		pathname,
+ 		statbuf,
+ 		0,
+ 		0
+ 	};
+-	xthread_work_run_sync(wq, nfsd_statfs64func, &data);
++	xthread_work_run_sync(wq, nfsd_statfsfunc, &data);
+ 	if (data.ret < 0)
+ 		errno = data.err;
+ 	return data.ret;
+ }
+ 
+ int
+-nfsd_path_statfs64(const char *pathname, struct statfs64 *statbuf)
++nfsd_path_statfs(const char *pathname, struct statfs *statbuf)
+ {
+ 	if (!nfsd_wq)
+-		return statfs64(pathname, statbuf);
+-	return nfsd_run_statfs64(nfsd_wq, pathname, statbuf);
++		return statfs(pathname, statbuf);
++	return nfsd_run_statfs(nfsd_wq, pathname, statbuf);
+ }
+ 
+ struct nfsd_realpath_data {
+diff --git a/utils/exportfs/exportfs.c b/utils/exportfs/exportfs.c
+index 0897b22..6d79a5b 100644
+--- a/utils/exportfs/exportfs.c
++++ b/utils/exportfs/exportfs.c
+@@ -513,7 +513,7 @@ validate_export(nfs_export *exp)
+ 	 */
+ 	struct stat stb;
+ 	char *path = exportent_realpath(&exp->m_export);
+-	struct statfs64 stf;
++	struct statfs stf;
+ 	int fs_has_fsid = 0;
+ 
+ 	if (stat(path, &stb) < 0) {
+@@ -528,7 +528,7 @@ validate_export(nfs_export *exp)
+ 	if (!can_test())
+ 		return;
+ 
+-	if (!statfs64(path, &stf) &&
++	if (!statfs(path, &stf) &&
+ 	    (stf.f_fsid.__val[0] || stf.f_fsid.__val[1]))
+ 		fs_has_fsid = 1;
+ 
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.2.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.2.bb
index 4b5c28c27b..21df1803c5 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.2.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.2.bb
@@ -32,6 +32,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://clang-warnings.patch \
            file://0005-mountd-Check-for-return-of-stat-function.patch \
            file://0006-Fix-function-prototypes.patch \
+           file://0001-Replace-statfs64-with-statfs.patch \
            "
 SRC_URI[sha256sum] = "5200873e81c4d610e2462fc262fe18135f2dbe78b7979f95accd159ae64d5011"
 
-- 
2.39.0


