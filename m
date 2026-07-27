Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 094FBC53219
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:42 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43814.1785192998282517170
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1PMxfyDJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-495437bb891so3379155e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785192996; x=1785797796; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GvrBTGmXy6XQ8FqeUMYmnCfN5hi8y4eRAgYv9rbFIf8=;
        b=1PMxfyDJgYYATxMIVwgFy9ITdsAAGgqx4XnBN6FUJ/LZA52XSGah2zo1jNRYFmtNex
         xmtFCBNXTK0dImBoTLfgx4MSI8L+J+kPeFLQAz/Th5Qx6ur9sRW5Fi7Nwdh0g0GR6IPc
         gNMAx34AN3sTsRD5MYDehRMcoYZiU5PiPPYRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785192996; x=1785797796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GvrBTGmXy6XQ8FqeUMYmnCfN5hi8y4eRAgYv9rbFIf8=;
        b=Dbq58a85fI8pWz4VEU03dufoxhN61IwAgmnvnPnIWWzfRVgF9k+FQbgHO4MOycHa+h
         DUyd5ouf4JmDevPhW6MS4sED0lu7zI4vK3nX2CaEx02KL9dk6nmwlpHz2380aoIKeUeB
         nmuXEyK/jLTBgd5fZYOUXonVfwjr7Jf4gBcU/4rIeIMUi0RckNxD72wZ4GxfziYho0zD
         gwL8c30sbmjbFE/r/cLYSsO75YK7ImKqrI/WTtzwE9zI2SKiOGN9un7LdwPQMVkviwuk
         6gat0yQ2V4rNf9W66vc6k3zINxqZlBbXTwTJuTjFe0facI4/ULMcfCKcWLxZFoppuKsm
         7DiA==
X-Gm-Message-State: AOJu0YxAs8Oub0R1BC+VwiAxKShYfeGIkw0cMrENXYYIMo0/cY9wDRTG
	QrXC3QT9XVFJ+ajEWhHoxN5FUBEMZSETT0DbPCKvYNDDd+eJlrvp+v42E/xaqvrNx2tsW3kxSrN
	CUvGJSQM=
X-Gm-Gg: AR+sD1150zzup2z/xSO1nJKxqL++EOoPD2Qp2weYiM+GZqbcVgClx5sAu337AiHItzt
	xkvEyzObZ7CizF2lYaiU5X2Mf5Hfp4r/MO80/sqj9I9JYigZbDGN9yVfK3kkAxDC6OQrg3IMLHN
	77ZARSGrAZ/SOhTKwj7kJkJFCCzmgMCXfFrNESYM2JabuS66KXbe4SdLNgIOzCvhZ7aqg3RvRbC
	uU5SBj2FJGTIx1P/+DdPWLuPkuT7k02lcnR72aRX4DvPokeGsanS/JqIj9VHFcvHWt2MiwVdL6c
	kMoNYpXhw6KjHokPa107m/U6qkcUxYhihz2qyB4ZznnNc+goahyM0GKvn5ssSPsBq8KY8fhS29v
	SHRkdoLfHP5w9V2MCPuy+VRBOMq7cQAFgsfiJ/8/1ISIdnOwp+kq8L/9v66yO3feNOPR1mc+Frg
	TCLtniZLMgkmHgIITrhjJCtDoW1YEHyghXS+P1fLyMTEOjfjKJhHLH0P9pRnS3EkYOgxn7Vi9o0
	jU3mg==
X-Received: by 2002:a05:600c:4585:b0:495:6934:4146 with SMTP id 5b1f17b1804b1-496c567ab59mr5100145e9.11.1785192996358;
        Mon, 27 Jul 2026 15:56:36 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45de1a3sm31513055e9.11.2026.07.27.15.56.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:56:35 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 25/36] util-linux: upgrade 2.41.3 -> 2.41.5
Date: Tue, 28 Jul 2026 00:55:39 +0200
Message-ID: <140bc60bc02a8eb24ddd3b7199e1d8175c7884bd.1785190123.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785190123.git.yoann.congal@smile.fr>
References: <cover.1785190123.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242142

From: Siva Balasubramanian <sivakumar.bs@gmail.com>

2.41.4 and 2.41.5 are point releases in the same 2.41 stable series and
contain only bug fixes and security fixes (no new features, no API/ABI
breaks), so the upgrade complies with the stable branch policy.

Among the fixes pulled in:
 - Several mount(8) TOCTOU / symlink hardening fixes (incl. CVE-2026-27456)
 - libblkid integer overflow in parse_dos_extended() and a use-after-free
   in partition probing
 - pam_lastlog2: fix libpam linking in the autotools build so
   pam_lastlog2.so links against libpam, fixing the runtime "undefined
   symbol: pam_syslog" / dlopen failure [YOCTO #16320]

Drop the loopdev symlink-attack backport that is now part of the release:
 - 0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-a.patch
   (upstream f55f9906, released in 2.41.4)

Full changes: https://github.com/util-linux/util-linux/compare/v2.41.3...v2.41.5

Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
[YC: Also dropped CVE-2026-13595.patch merged 2.41.5:
https://github.com/util-linux/util-linux/commit/132d9c8aa15a8efd0a23d8ca7ed8b98f365e84fa ]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...2.41.3.bb => util-linux-libuuid_2.41.5.bb} |   0
 meta/recipes-core/util-linux/util-linux.inc   |   4 +-
 ...DEV_FL_NOFOLLOW-to-prevent-symlink-a.patch | 114 --------------
 .../util-linux/CVE-2026-13595.patch           | 148 ------------------
 ...l-linux_2.41.3.bb => util-linux_2.41.5.bb} |   0
 5 files changed, 1 insertion(+), 265 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.41.3.bb => util-linux-libuuid_2.41.5.bb} (100%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-a.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-13595.patch
 rename meta/recipes-core/util-linux/{util-linux_2.41.3.bb => util-linux_2.41.5.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.41.5.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.41.5.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 2a994d7a386..aec8721ca32 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -20,10 +20,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch \
            file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch \
            file://0001-tests-script-Disable-size-option-test.patch \
-           file://0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-a.patch \
-           file://CVE-2026-13595.patch \
            "
 
-SRC_URI[sha256sum] = "3330d873f0fceb5560b89a7dc14e4f3288bbd880e96903ed9b50ec2b5799e58b"
+SRC_URI[sha256sum] = "f586e35d320ff537aab3ffeca37e9ecd482ccbe013590db4429a414d8aa6a728"
 
 CVE_PRODUCT = "util-linux"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-a.patch b/meta/recipes-core/util-linux/util-linux/0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-a.patch
deleted file mode 100644
index 0951c9f5fbe..00000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-a.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From f55f9906b4f6eeb2b4a4120317df9de935253c10 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Thu, 19 Feb 2026 13:59:46 +0100
-Subject: [PATCH] loopdev: add LOOPDEV_FL_NOFOLLOW to prevent symlink attacks
-
-Add a new LOOPDEV_FL_NOFOLLOW flag for loop device context that
-prevents symlink following in both path canonicalization and file open.
-
-When set:
-- loopcxt_set_backing_file() uses strdup() instead of
-  ul_canonicalize_path() (which calls realpath() and follows symlinks)
-- loopcxt_setup_device() adds O_NOFOLLOW to open() flags
-
-The flag is set for non-root (restricted) mount operations in
-libmount's loop device hook. This prevents a TOCTOU race condition
-where an attacker could replace the backing file (specified in
-/etc/fstab) with a symlink to an arbitrary root-owned file between
-path resolution and open().
-
-Vulnerable Code Flow:
-
-  mount /mnt/point (non-root, SUID)
-    mount.c: sanitize_paths() on user args (mountpoint only)
-    mnt_context_mount()
-      mnt_context_prepare_mount()
-        mnt_context_apply_fstab()           <-- source path from fstab
-        hooks run at MNT_STAGE_PREP_SOURCE
-          hook_loopdev.c: setup_loopdev()
-            backing_file = fstab source path ("/home/user/disk.img")
-            loopcxt_set_backing_file()       <-- calls realpath() as ROOT
-              ul_canonicalize_path()         <-- follows symlinks!
-            loopcxt_setup_device()
-              open(lc->filename, O_RDWR|O_CLOEXEC)  <-- no O_NOFOLLOW
-
-Two vulnerabilities in the path:
-
-1) loopcxt_set_backing_file() calls ul_canonicalize_path() which uses
-   realpath() -- this follows symlinks as euid=0. If the attacker swaps
-   the file to a symlink before this call, lc->filename becomes the
-   resolved target path (e.g., /root/secret.img).
-
-2) loopcxt_setup_device() opens lc->filename without O_NOFOLLOW. Even
-   if canonicalization happened correctly, the file can be swapped to a
-   symlink between canonicalize and open.
-
-Addresses: https://github.com/util-linux/util-linux/security/advisories/GHSA-qq4x-vfq4-9h9g
-Signed-off-by: Karel Zak <kzak@redhat.com>
-(cherry picked from commit 5e390467b26a3cf3fecc04e1a0d482dff3162fc4)
-
-CVE: CVE-2026-27456
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- include/loopdev.h           | 3 ++-
- lib/loopdev.c               | 7 ++++++-
- libmount/src/hook_loopdev.c | 3 ++-
- 3 files changed, 10 insertions(+), 3 deletions(-)
-
-diff --git a/include/loopdev.h b/include/loopdev.h
-index e5ec1c98a..6bdb1393a 100644
---- a/include/loopdev.h
-+++ b/include/loopdev.h
-@@ -140,7 +140,8 @@ enum {
- 	LOOPDEV_FL_NOIOCTL	= (1 << 6),
- 	LOOPDEV_FL_DEVSUBDIR	= (1 << 7),
- 	LOOPDEV_FL_CONTROL	= (1 << 8),	/* system with /dev/loop-control */
--	LOOPDEV_FL_SIZELIMIT	= (1 << 9)
-+	LOOPDEV_FL_SIZELIMIT	= (1 << 9),
-+	LOOPDEV_FL_NOFOLLOW	= (1 << 10)	/* O_NOFOLLOW, don't follow symlinks */
- };
- 
- /*
-diff --git a/lib/loopdev.c b/lib/loopdev.c
-index 2359bf781..76685be70 100644
---- a/lib/loopdev.c
-+++ b/lib/loopdev.c
-@@ -1267,7 +1267,10 @@ int loopcxt_set_backing_file(struct loopdev_cxt *lc, const char *filename)
- 	if (!lc)
- 		return -EINVAL;
- 
--	lc->filename = canonicalize_path(filename);
-+	if (lc->flags & LOOPDEV_FL_NOFOLLOW)
-+		lc->filename = strdup(filename);
-+	else
-+		lc->filename = canonicalize_path(filename);
- 	if (!lc->filename)
- 		return -errno;
- 
-@@ -1408,6 +1411,8 @@ int loopcxt_setup_device(struct loopdev_cxt *lc)
- 
- 	if (lc->config.info.lo_flags & LO_FLAGS_DIRECT_IO)
- 		flags |= O_DIRECT;
-+	if (lc->flags & LOOPDEV_FL_NOFOLLOW)
-+		flags |= O_NOFOLLOW;
- 
- 	if ((file_fd = open(lc->filename, mode | flags)) < 0) {
- 		if (mode != O_RDONLY && (errno == EROFS || errno == EACCES))
-diff --git a/libmount/src/hook_loopdev.c b/libmount/src/hook_loopdev.c
-index 444d69d6f..34351116c 100644
---- a/libmount/src/hook_loopdev.c
-+++ b/libmount/src/hook_loopdev.c
-@@ -272,7 +272,8 @@ static int setup_loopdev(struct libmnt_context *cxt,
- 	}
- 
- 	DBG(LOOP, ul_debugobj(cxt, "not found; create a new loop device"));
--	rc = loopcxt_init(&lc, 0);
-+	rc = loopcxt_init(&lc,
-+			mnt_context_is_restricted(cxt) ? LOOPDEV_FL_NOFOLLOW : 0);
- 	if (rc)
- 		goto done_no_deinit;
- 	if (mnt_opt_has_value(loopopt)) {
--- 
-2.43.0
-
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2026-13595.patch b/meta/recipes-core/util-linux/util-linux/CVE-2026-13595.patch
deleted file mode 100644
index 894844bc1f4..00000000000
--- a/meta/recipes-core/util-linux/util-linux/CVE-2026-13595.patch
+++ /dev/null
@@ -1,148 +0,0 @@
-From c3844c348f2903d929dd5ded0ea8147394cce607 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Thu, 7 May 2026 12:50:48 +0200
-Subject: [PATCH] libblkid: fix use-after-free in nested partition probing
-
-The partitions list stores partitions in a contiguous array grown by
-reallocarray(). When the array is reallocated to a new address, all
-existing blkid_partition pointers (tab->parent, ls->next_parent, local
-parent variables in nested probers) become dangling.
-
-Fix this by changing the storage from an array of structs to an array
-of pointers, where each partition is individually allocated via
-calloc(). This makes all blkid_partition pointers stable across
-reallocations -- only the pointer array itself may move, which is
-harmless since no code caches pointers into the pointer array.
-
-This eliminates the need for callers to re-fetch parent pointers after
-every blkid_partlist_add_partition() call.
-
-CVE: CVE-2026-13595
-Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/132d9c8aa15a8efd0a23d8ca7ed8b98f365e84fa]
-
-Reported-by: Thai Duong <thaidn@gmail.com>
-Signed-off-by: Karel Zak <kzak@redhat.com>
-(cherry picked from commit c0186f14fbdb02f64c8e0ba701ce727ea764ff4c)
-(cherry picked from commit 132d9c8aa15a8efd0a23d8ca7ed8b98f365e84fa)
-Signed-off-by: Deepak Rathore <deeratho@cisco.com>
----
- libblkid/src/partitions/partitions.c | 34 +++++++++++++++++-----------
- 1 file changed, 21 insertions(+), 13 deletions(-)
-
-diff --git a/libblkid/src/partitions/partitions.c b/libblkid/src/partitions/partitions.c
-index 9df813c92..e600e5e45 100644
---- a/libblkid/src/partitions/partitions.c
-+++ b/libblkid/src/partitions/partitions.c
-@@ -198,7 +198,7 @@ struct blkid_struct_partlist {
- 
- 	int		nparts;		/* number of partitions */
- 	int		nparts_max;	/* max.number of partitions */
--	blkid_partition	parts;		/* array of partitions */
-+	blkid_partition	*parts;		/* array of pointers to partitions */
- 
- 	struct list_head l_tabs;	/* list of partition tables */
- };
-@@ -357,13 +357,16 @@ static void reset_partlist(blkid_partlist ls)
- 	free_parttables(ls);
- 
- 	if (ls->next_partno) {
--		/* already initialized - reset */
--		int tmp_nparts = ls->nparts_max;
--		blkid_partition tmp_parts = ls->parts;
-+		/* already initialized - free individually allocated partitions */
-+		int i, tmp_nparts_max = ls->nparts_max;
-+		blkid_partition *tmp_parts = ls->parts;
-+
-+		for (i = 0; i < ls->nparts; i++)
-+			free(ls->parts[i]);
- 
- 		memset(ls, 0, sizeof(struct blkid_struct_partlist));
- 
--		ls->nparts_max = tmp_nparts;
-+		ls->nparts_max = tmp_nparts_max;
- 		ls->parts = tmp_parts;
- 	}
- 
-@@ -398,6 +401,7 @@ static void partitions_free_data(blkid_probe pr __attribute__((__unused__)),
- 				 void *data)
- {
- 	blkid_partlist ls = (blkid_partlist) data;
-+	int i;
- 
- 	if (!ls)
- 		return;
-@@ -405,6 +409,8 @@ static void partitions_free_data(blkid_probe pr __attribute__((__unused__)),
- 	free_parttables(ls);
- 
- 	/* deallocate partitions and partlist */
-+	for (i = 0; i < ls->nparts; i++)
-+		free(ls->parts[i]);
- 	free(ls->parts);
- 	free(ls);
- }
-@@ -438,15 +444,17 @@ static blkid_partition new_partition(blkid_partlist ls, blkid_parttable tab)
- 		 * generic Linux machine -- let start with 32 partitions.
- 		 */
- 		void *tmp = reallocarray(ls->parts, ls->nparts_max + 32,
--					 sizeof(struct blkid_struct_partition));
-+					 sizeof(blkid_partition));
- 		if (!tmp)
- 			return NULL;
- 		ls->parts = tmp;
- 		ls->nparts_max += 32;
- 	}
- 
--	par = &ls->parts[ls->nparts++];
--	memset(par, 0, sizeof(struct blkid_struct_partition));
-+	par = calloc(1, sizeof(struct blkid_struct_partition));
-+	if (!par)
-+		return NULL;
-+	ls->parts[ls->nparts++] = par;
- 
- 	ref_parttable(tab);
- 	par->tab = tab;
-@@ -851,7 +859,7 @@ int blkid_probe_is_covered_by_pt(blkid_probe pr,
- 
- 	/* check if the partition table fits into the device */
- 	for (i = 0; i < nparts; i++) {
--		blkid_partition par = &ls->parts[i];
-+		blkid_partition par = ls->parts[i];
- 
- 		if (par->start + par->size > (pr->size >> 9)) {
- 			DBG(LOWPROBE, ul_debug("partition #%d overflows "
-@@ -863,7 +871,7 @@ int blkid_probe_is_covered_by_pt(blkid_probe pr,
- 
- 	/* check if the requested area is covered by PT */
- 	for (i = 0; i < nparts; i++) {
--		blkid_partition par = &ls->parts[i];
-+		blkid_partition par = ls->parts[i];
- 
- 		if (start >= par->start && end <= par->start + par->size) {
- 			rc = 1;
-@@ -962,7 +970,7 @@ blkid_partition blkid_partlist_get_partition(blkid_partlist ls, int n)
- 	if (n < 0 || n >= ls->nparts)
- 		return NULL;
- 
--	return &ls->parts[n];
-+	return ls->parts[n];
- }
- 
- blkid_partition blkid_partlist_get_partition_by_start(blkid_partlist ls, uint64_t start)
-@@ -1074,7 +1082,7 @@ blkid_partition blkid_partlist_devno_to_partition(blkid_partlist ls, dev_t devno
- 		 * and an entry in partition table.
- 		 */
- 		 for (i = 0; i < ls->nparts; i++) {
--			 blkid_partition par = &ls->parts[i];
-+			 blkid_partition par = ls->parts[i];
- 
- 			 if (partno != blkid_partition_get_partno(par))
- 				 continue;
-@@ -1090,7 +1098,7 @@ blkid_partition blkid_partlist_devno_to_partition(blkid_partlist ls, dev_t devno
- 	DBG(LOWPROBE, ul_debug("searching by offset/size"));
- 
- 	for (i = 0; i < ls->nparts; i++) {
--		blkid_partition par = &ls->parts[i];
-+		blkid_partition par = ls->parts[i];
- 
- 		if ((uint64_t)blkid_partition_get_start(par) == start &&
- 		    (uint64_t)blkid_partition_get_size(par) == size)
diff --git a/meta/recipes-core/util-linux/util-linux_2.41.3.bb b/meta/recipes-core/util-linux/util-linux_2.41.5.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.41.3.bb
rename to meta/recipes-core/util-linux/util-linux_2.41.5.bb

