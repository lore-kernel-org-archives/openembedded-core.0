Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB522EB64DB
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 10:32:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.4527.1687170725237978199
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jun 2023 03:32:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A62D0150C;
	Mon, 19 Jun 2023 03:32:48 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 682393F64C;
	Mon, 19 Jun 2023 03:32:04 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/3] erofs-utils: backport fixes for CVE-2023-33551 and CVE-2023-33552
Date: Mon, 19 Jun 2023 11:32:00 +0100
Message-Id: <20230619103200.516550-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619103200.516550-1-ross.burton@arm.com>
References: <20230619103200.516550-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 10:32:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183099

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../erofs-utils/erofs-utils_1.6.bb            |   5 +-
 ...-don-t-allocate-read-too-large-exten.patch | 126 ++++++++++++++++++
 ...-block-insane-long-paths-when-extrac.patch |  80 +++++++++++
 3 files changed, 210 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/erofs-utils/files/0001-erofs-ut=
ils-fsck-don-t-allocate-read-too-large-exten.patch
 create mode 100644 meta/recipes-devtools/erofs-utils/files/0002-erofs-ut=
ils-fsck-block-insane-long-paths-when-extrac.patch

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.6.bb b/meta/=
recipes-devtools/erofs-utils/erofs-utils_1.6.bb
index 43643e07bbc..5a89e4b8ee6 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.6.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.6.bb
@@ -6,7 +6,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D73001d804ea1e=
3d84365f652242cca20"
 HOMEPAGE =3D "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erof=
s-utils.git/tree/README"
=20
 SRCREV =3D "21710612d35cd952490959bfa6ea9fe87aaa52dd"
-SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-u=
tils.git;branch=3Dmaster;protocol=3Dhttps"
+SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-u=
tils.git;branch=3Dmaster;protocol=3Dhttps \
+           file://0001-erofs-utils-fsck-don-t-allocate-read-too-large-ex=
ten.patch \
+           file://0002-erofs-utils-fsck-block-insane-long-paths-when-ext=
rac.patch \
+"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>(\d+(\.\d+)+))"
=20
diff --git a/meta/recipes-devtools/erofs-utils/files/0001-erofs-utils-fsc=
k-don-t-allocate-read-too-large-exten.patch b/meta/recipes-devtools/erofs=
-utils/files/0001-erofs-utils-fsck-don-t-allocate-read-too-large-exten.pa=
tch
new file mode 100644
index 00000000000..52f475dc424
--- /dev/null
+++ b/meta/recipes-devtools/erofs-utils/files/0001-erofs-utils-fsck-don-t=
-allocate-read-too-large-exten.patch
@@ -0,0 +1,126 @@
+From c769805c79d5acede65d96e5786aa5ebb46c01e0 Mon Sep 17 00:00:00 2001
+From: Gao Xiang <hsiangkao@linux.alibaba.com>
+Date: Fri, 2 Jun 2023 11:05:19 +0800
+Subject: [PATCH 1/2] erofs-utils: fsck: don't allocate/read too large ex=
tents
+
+Since some crafted EROFS filesystem images could have insane large
+extents, which causes unexpected bahaviors when extracting data.
+
+Fix it by extracting large extents with a buffer of a reasonable
+maximum size limit and reading multiple times instead.
+
+Note that only `--extract` option is impacted.
+
+CVE: CVE-2023-33552
+Closes: https://nvd.nist.gov/vuln/detail/CVE-2023-33552
+Reported-by: Chaoming Yang <lometsj@live.com>
+Fixes: 412c8f908132 ("erofs-utils: fsck: add --extract=3DX support to ex=
tract to path X")
+Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
+Link: https://lore.kernel.org/r/20230602030519.117071-1-hsiangkao@linux.=
alibaba.com
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ fsck/main.c | 63 +++++++++++++++++++++++++++++++++++++++++------------
+ 1 file changed, 49 insertions(+), 14 deletions(-)
+
+diff --git a/fsck/main.c b/fsck/main.c
+index 6b42252..6689ad8 100644
+--- a/fsck/main.c
++++ b/fsck/main.c
+@@ -392,6 +392,8 @@ static int erofs_verify_inode_data(struct erofs_inod=
e *inode, int outfd)
+ 	}
+=20
+ 	while (pos < inode->i_size) {
++		unsigned int alloc_rawsize;
++
+ 		map.m_la =3D pos;
+ 		if (compressed)
+ 			ret =3D z_erofs_map_blocks_iter(inode, &map,
+@@ -420,10 +422,28 @@ static int erofs_verify_inode_data(struct erofs_in=
ode *inode, int outfd)
+ 		if (!(map.m_flags & EROFS_MAP_MAPPED) || !fsckcfg.check_decomp)
+ 			continue;
+=20
+-		if (map.m_plen > raw_size) {
+-			raw_size =3D map.m_plen;
+-			raw =3D realloc(raw, raw_size);
+-			BUG_ON(!raw);
++		if (map.m_plen > Z_EROFS_PCLUSTER_MAX_SIZE) {
++			if (compressed) {
++				erofs_err("invalid pcluster size %" PRIu64 " @ offset %" PRIu64 " o=
f nid %" PRIu64,
++					  map.m_plen, map.m_la,
++					  inode->nid | 0ULL);
++				ret =3D -EFSCORRUPTED;
++				goto out;
++			}
++			alloc_rawsize =3D Z_EROFS_PCLUSTER_MAX_SIZE;
++		} else {
++			alloc_rawsize =3D map.m_plen;
++		}
++
++		if (alloc_rawsize > raw_size) {
++			char *newraw =3D realloc(raw, alloc_rawsize);
++
++			if (!newraw) {
++				ret =3D -ENOMEM;
++				goto out;
++			}
++			raw =3D newraw;
++			raw_size =3D alloc_rawsize;
+ 		}
+=20
+ 		if (compressed) {
+@@ -434,18 +454,27 @@ static int erofs_verify_inode_data(struct erofs_in=
ode *inode, int outfd)
+ 			}
+ 			ret =3D z_erofs_read_one_data(inode, &map, raw, buffer,
+ 						    0, map.m_llen, false);
++			if (ret)
++				goto out;
++
++			if (outfd >=3D 0 && write(outfd, buffer, map.m_llen) < 0)
++				goto fail_eio;
+ 		} else {
+-			ret =3D erofs_read_one_data(&map, raw, 0, map.m_plen);
+-		}
+-		if (ret)
+-			goto out;
++			u64 p =3D 0;
+=20
+-		if (outfd >=3D 0 && write(outfd, compressed ? buffer : raw,
+-					map.m_llen) < 0) {
+-			erofs_err("I/O error occurred when verifying data chunk @ nid %llu",
+-				  inode->nid | 0ULL);
+-			ret =3D -EIO;
+-			goto out;
++			do {
++				u64 count =3D min_t(u64, alloc_rawsize,
++						  map.m_llen);
++
++				ret =3D erofs_read_one_data(&map, raw, p, count);
++				if (ret)
++					goto out;
++
++				if (outfd >=3D 0 && write(outfd, raw, count) < 0)
++					goto fail_eio;
++				map.m_llen -=3D count;
++				p +=3D count;
++			} while (map.m_llen);
+ 		}
+ 	}
+=20
+@@ -460,6 +489,12 @@ out:
+ 	if (buffer)
+ 		free(buffer);
+ 	return ret < 0 ? ret : 0;
++
++fail_eio:
++	erofs_err("I/O error occurred when verifying data chunk @ nid %llu",
++		  inode->nid | 0ULL);
++	ret =3D -EIO;
++	goto out;
+ }
+=20
+ static inline int erofs_extract_dir(struct erofs_inode *inode)
+--=20
+2.34.1
+
diff --git a/meta/recipes-devtools/erofs-utils/files/0002-erofs-utils-fsc=
k-block-insane-long-paths-when-extrac.patch b/meta/recipes-devtools/erofs=
-utils/files/0002-erofs-utils-fsck-block-insane-long-paths-when-extrac.pa=
tch
new file mode 100644
index 00000000000..f2f1e343686
--- /dev/null
+++ b/meta/recipes-devtools/erofs-utils/files/0002-erofs-utils-fsck-block=
-insane-long-paths-when-extrac.patch
@@ -0,0 +1,80 @@
+From 6cebfbb79b1d5d8feb48801e1008eea5bfa8b599 Mon Sep 17 00:00:00 2001
+From: Gao Xiang <hsiangkao@linux.alibaba.com>
+Date: Fri, 2 Jun 2023 13:52:56 +0800
+Subject: [PATCH 2/2] erofs-utils: fsck: block insane long paths when
+ extracting images
+
+Since some crafted EROFS filesystem images could have insane deep
+hierarchy (or may form directory loops) which triggers the
+PATH_MAX-sized path buffer OR stack overflow.
+
+Actually some crafted images cannot be deemed as real corrupted
+images but over-PATH_MAX paths are not something that we'd like to
+support for now.
+
+CVE: CVE-2023-33551
+Closes: https://nvd.nist.gov/vuln/detail/CVE-2023-33551
+Reported-by: Chaoming Yang <lometsj@live.com>
+Fixes: f44043561491 ("erofs-utils: introduce fsck.erofs")
+Fixes: b11f84f593f9 ("erofs-utils: fsck: convert to use erofs_iterate_di=
r()")
+Fixes: 412c8f908132 ("erofs-utils: fsck: add --extract=3DX support to ex=
tract to path X")
+Signeo-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
+Link: https://lore.kernel.org/r/20230602055256.18061-1-hsiangkao@linux.a=
libaba.com
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ fsck/main.c | 23 +++++++++++++++--------
+ 1 file changed, 15 insertions(+), 8 deletions(-)
+
+diff --git a/fsck/main.c b/fsck/main.c
+index 6689ad8..28d95ec 100644
+--- a/fsck/main.c
++++ b/fsck/main.c
+@@ -680,28 +680,35 @@ again:
+ static int erofsfsck_dirent_iter(struct erofs_dir_context *ctx)
+ {
+ 	int ret;
+-	size_t prev_pos =3D fsckcfg.extract_pos;
++	size_t prev_pos, curr_pos;
+=20
+ 	if (ctx->dot_dotdot)
+ 		return 0;
+=20
+-	if (fsckcfg.extract_path) {
+-		size_t curr_pos =3D prev_pos;
++	prev_pos =3D fsckcfg.extract_pos;
++	curr_pos =3D prev_pos;
++
++	if (prev_pos + ctx->de_namelen >=3D PATH_MAX) {
++		erofs_err("unable to fsck since the path is too long (%u)",
++			  curr_pos + ctx->de_namelen);
++		return -EOPNOTSUPP;
++	}
+=20
++	if (fsckcfg.extract_path) {
+ 		fsckcfg.extract_path[curr_pos++] =3D '/';
+ 		strncpy(fsckcfg.extract_path + curr_pos, ctx->dname,
+ 			ctx->de_namelen);
+ 		curr_pos +=3D ctx->de_namelen;
+ 		fsckcfg.extract_path[curr_pos] =3D '\0';
+-		fsckcfg.extract_pos =3D curr_pos;
++	} else {
++		curr_pos +=3D ctx->de_namelen;
+ 	}
+-
++	fsckcfg.extract_pos =3D curr_pos;
+ 	ret =3D erofsfsck_check_inode(ctx->dir->nid, ctx->de_nid);
+=20
+-	if (fsckcfg.extract_path) {
++	if (fsckcfg.extract_path)
+ 		fsckcfg.extract_path[prev_pos] =3D '\0';
+-		fsckcfg.extract_pos =3D prev_pos;
+-	}
++	fsckcfg.extract_pos =3D prev_pos;
+ 	return ret;
+ }
+=20
+--=20
+2.34.1
+
--=20
2.34.1


