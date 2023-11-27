Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C16C46CA0
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 10:18:07 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.91591.1701080285687841192
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 02:18:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KJi+F5uo;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-543456dbd7bso9582210a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 02:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701080284; x=1701685084; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gJlueXq5VqrFZhFt9sgwzU71HBPte7xqwH7fi/AkBDM=;
        b=KJi+F5uo114UogkbNnJD72hz7i82jVfAQPHboWnuZNVjBWgALHM4p6yv0pWAx7AEsY
         9pSo6ZYhvC55U1dZsbWmDs+JaTI2DyK1P1R8lzNO7xxwt0y+2b+XOto+h8LrDIfCL1Pq
         ctrR192WI1KssIxXy0ibHTrz7DKDxsRDTg8YyljlxBJUJlN011G1561Ke7sk0KnxGPzt
         7sC/Lkg/yN11Ly0gn/gxc6Kyr2fGNPACfEGioK1tHKZ+y4R6b1Nc5bl5a74X1BFwv6yC
         mWGkLizDC2WwV2S9YourYXkbB2fxAWWPAEpZhRc0aJqddtjw5G1m1ZrUACn3pIu/2R9/
         Eg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701080284; x=1701685084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gJlueXq5VqrFZhFt9sgwzU71HBPte7xqwH7fi/AkBDM=;
        b=A7yCfzgSNKjFKo5LfqKK1lucnIvApNp9k8OOK8TocEGgczfrIO/d+YqsWief0+HtKQ
         OCtUntWNDa4cwVDA6aPPb085zNQlmT+OB6Nj9+stb8seqJzmo/aZygiKBCNEYHcO/G2Z
         OZpm/0eBNdPd0Kmvj/8bH1DvK7qwJklkOFikKhuSBmg60ivHboHBvmyaPIqJbC6LCGT2
         L+SNflgJ6BZH2fKslyYUP8wKabqOeST+035SYdLYijdBPt2z0SON/v+QEstf8fN8VSwY
         8ZNeDBoZs+DVdqN7CKApsJ/LtKzQ9t1PCmA7Q+3YX2TmUvQAlwsXGb1MYzxEeW/wf+Pe
         ZeKQ==
X-Gm-Message-State: AOJu0YzWoKHq7KxSELwMUlKFHqVu4jGfKW0Y5t3k9I9cj2xj6wT0+vB0
	M3PsAD4msgG/jMCtemnqZQs3WPuWvLw=
X-Google-Smtp-Source: AGHT+IGTDw5vZ7OmE2mi1e6Wm0BGLesnF4K3s1sL+4LomTAQK+FOsZMRuaa3iXXoblCoeqOWkNT7dA==
X-Received: by 2002:a17:906:5308:b0:a01:bd67:d2fb with SMTP id h8-20020a170906530800b00a01bd67d2fbmr12697220ejo.0.1701080283887;
        Mon, 27 Nov 2023 02:18:03 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906585a00b00a0bf09c9483sm2757203ejs.35.2023.11.27.02.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 02:18:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/19] erofs-utils: upgrade 1.6 -> 1.7.1
Date: Mon, 27 Nov 2023 11:17:40 +0100
Message-Id: <20231127101751.3187950-8-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127101751.3187950-1-alex@linutronix.de>
References: <20231127101751.3187950-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 10:18:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191275

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...rofs-utils_1.6.bb => erofs-utils_1.7.1.bb} |  10 +-
 ...-don-t-allocate-read-too-large-exten.patch | 126 ------------------
 ...-block-insane-long-paths-when-extrac.patch |  80 -----------
 3 files changed, 4 insertions(+), 212 deletions(-)
 rename meta/recipes-devtools/erofs-utils/{erofs-utils_1.6.bb => erofs-utils_1.7.1.bb} (70%)
 delete mode 100644 meta/recipes-devtools/erofs-utils/files/0001-erofs-utils-fsck-don-t-allocate-read-too-large-exten.patch
 delete mode 100644 meta/recipes-devtools/erofs-utils/files/0002-erofs-utils-fsck-block-insane-long-paths-when-extrac.patch

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.6.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb
similarity index 70%
rename from meta/recipes-devtools/erofs-utils/erofs-utils_1.6.bb
rename to meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb
index 5a89e4b8ee6..a23cb330ea2 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.6.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb
@@ -5,11 +5,8 @@ SECTION = "base"
 LIC_FILES_CHKSUM = "file://COPYING;md5=73001d804ea1e3d84365f652242cca20"
 HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/README"
 
-SRCREV = "21710612d35cd952490959bfa6ea9fe87aaa52dd"
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master;protocol=https \
-           file://0001-erofs-utils-fsck-don-t-allocate-read-too-large-exten.patch \
-           file://0002-erofs-utils-fsck-block-insane-long-paths-when-extrac.patch \
-"
+SRCREV = "83d94dc619075e71ca4d0f42941cfc18d269a2af"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master;protocol=https"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
 
@@ -19,8 +16,9 @@ DEPENDS = "util-linux-libuuid"
 
 inherit pkgconfig autotools
 
-PACKAGECONFIG ??= "lz4"
+PACKAGECONFIG ??= "lz4 zlib"
 PACKAGECONFIG[lz4] = "--enable-lz4,--disable-lz4,lz4"
+PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
 
 EXTRA_OECONF = "${PACKAGECONFIG_CONFARGS} --disable-fuse"
 
diff --git a/meta/recipes-devtools/erofs-utils/files/0001-erofs-utils-fsck-don-t-allocate-read-too-large-exten.patch b/meta/recipes-devtools/erofs-utils/files/0001-erofs-utils-fsck-don-t-allocate-read-too-large-exten.patch
deleted file mode 100644
index 52f475dc424..00000000000
--- a/meta/recipes-devtools/erofs-utils/files/0001-erofs-utils-fsck-don-t-allocate-read-too-large-exten.patch
+++ /dev/null
@@ -1,126 +0,0 @@
-From c769805c79d5acede65d96e5786aa5ebb46c01e0 Mon Sep 17 00:00:00 2001
-From: Gao Xiang <hsiangkao@linux.alibaba.com>
-Date: Fri, 2 Jun 2023 11:05:19 +0800
-Subject: [PATCH 1/2] erofs-utils: fsck: don't allocate/read too large extents
-
-Since some crafted EROFS filesystem images could have insane large
-extents, which causes unexpected bahaviors when extracting data.
-
-Fix it by extracting large extents with a buffer of a reasonable
-maximum size limit and reading multiple times instead.
-
-Note that only `--extract` option is impacted.
-
-CVE: CVE-2023-33552
-Closes: https://nvd.nist.gov/vuln/detail/CVE-2023-33552
-Reported-by: Chaoming Yang <lometsj@live.com>
-Fixes: 412c8f908132 ("erofs-utils: fsck: add --extract=X support to extract to path X")
-Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
-Link: https://lore.kernel.org/r/20230602030519.117071-1-hsiangkao@linux.alibaba.com
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- fsck/main.c | 63 +++++++++++++++++++++++++++++++++++++++++------------
- 1 file changed, 49 insertions(+), 14 deletions(-)
-
-diff --git a/fsck/main.c b/fsck/main.c
-index 6b42252..6689ad8 100644
---- a/fsck/main.c
-+++ b/fsck/main.c
-@@ -392,6 +392,8 @@ static int erofs_verify_inode_data(struct erofs_inode *inode, int outfd)
- 	}
- 
- 	while (pos < inode->i_size) {
-+		unsigned int alloc_rawsize;
-+
- 		map.m_la = pos;
- 		if (compressed)
- 			ret = z_erofs_map_blocks_iter(inode, &map,
-@@ -420,10 +422,28 @@ static int erofs_verify_inode_data(struct erofs_inode *inode, int outfd)
- 		if (!(map.m_flags & EROFS_MAP_MAPPED) || !fsckcfg.check_decomp)
- 			continue;
- 
--		if (map.m_plen > raw_size) {
--			raw_size = map.m_plen;
--			raw = realloc(raw, raw_size);
--			BUG_ON(!raw);
-+		if (map.m_plen > Z_EROFS_PCLUSTER_MAX_SIZE) {
-+			if (compressed) {
-+				erofs_err("invalid pcluster size %" PRIu64 " @ offset %" PRIu64 " of nid %" PRIu64,
-+					  map.m_plen, map.m_la,
-+					  inode->nid | 0ULL);
-+				ret = -EFSCORRUPTED;
-+				goto out;
-+			}
-+			alloc_rawsize = Z_EROFS_PCLUSTER_MAX_SIZE;
-+		} else {
-+			alloc_rawsize = map.m_plen;
-+		}
-+
-+		if (alloc_rawsize > raw_size) {
-+			char *newraw = realloc(raw, alloc_rawsize);
-+
-+			if (!newraw) {
-+				ret = -ENOMEM;
-+				goto out;
-+			}
-+			raw = newraw;
-+			raw_size = alloc_rawsize;
- 		}
- 
- 		if (compressed) {
-@@ -434,18 +454,27 @@ static int erofs_verify_inode_data(struct erofs_inode *inode, int outfd)
- 			}
- 			ret = z_erofs_read_one_data(inode, &map, raw, buffer,
- 						    0, map.m_llen, false);
-+			if (ret)
-+				goto out;
-+
-+			if (outfd >= 0 && write(outfd, buffer, map.m_llen) < 0)
-+				goto fail_eio;
- 		} else {
--			ret = erofs_read_one_data(&map, raw, 0, map.m_plen);
--		}
--		if (ret)
--			goto out;
-+			u64 p = 0;
- 
--		if (outfd >= 0 && write(outfd, compressed ? buffer : raw,
--					map.m_llen) < 0) {
--			erofs_err("I/O error occurred when verifying data chunk @ nid %llu",
--				  inode->nid | 0ULL);
--			ret = -EIO;
--			goto out;
-+			do {
-+				u64 count = min_t(u64, alloc_rawsize,
-+						  map.m_llen);
-+
-+				ret = erofs_read_one_data(&map, raw, p, count);
-+				if (ret)
-+					goto out;
-+
-+				if (outfd >= 0 && write(outfd, raw, count) < 0)
-+					goto fail_eio;
-+				map.m_llen -= count;
-+				p += count;
-+			} while (map.m_llen);
- 		}
- 	}
- 
-@@ -460,6 +489,12 @@ out:
- 	if (buffer)
- 		free(buffer);
- 	return ret < 0 ? ret : 0;
-+
-+fail_eio:
-+	erofs_err("I/O error occurred when verifying data chunk @ nid %llu",
-+		  inode->nid | 0ULL);
-+	ret = -EIO;
-+	goto out;
- }
- 
- static inline int erofs_extract_dir(struct erofs_inode *inode)
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/erofs-utils/files/0002-erofs-utils-fsck-block-insane-long-paths-when-extrac.patch b/meta/recipes-devtools/erofs-utils/files/0002-erofs-utils-fsck-block-insane-long-paths-when-extrac.patch
deleted file mode 100644
index f2f1e343686..00000000000
--- a/meta/recipes-devtools/erofs-utils/files/0002-erofs-utils-fsck-block-insane-long-paths-when-extrac.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 6cebfbb79b1d5d8feb48801e1008eea5bfa8b599 Mon Sep 17 00:00:00 2001
-From: Gao Xiang <hsiangkao@linux.alibaba.com>
-Date: Fri, 2 Jun 2023 13:52:56 +0800
-Subject: [PATCH 2/2] erofs-utils: fsck: block insane long paths when
- extracting images
-
-Since some crafted EROFS filesystem images could have insane deep
-hierarchy (or may form directory loops) which triggers the
-PATH_MAX-sized path buffer OR stack overflow.
-
-Actually some crafted images cannot be deemed as real corrupted
-images but over-PATH_MAX paths are not something that we'd like to
-support for now.
-
-CVE: CVE-2023-33551
-Closes: https://nvd.nist.gov/vuln/detail/CVE-2023-33551
-Reported-by: Chaoming Yang <lometsj@live.com>
-Fixes: f44043561491 ("erofs-utils: introduce fsck.erofs")
-Fixes: b11f84f593f9 ("erofs-utils: fsck: convert to use erofs_iterate_dir()")
-Fixes: 412c8f908132 ("erofs-utils: fsck: add --extract=X support to extract to path X")
-Signeo-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
-Link: https://lore.kernel.org/r/20230602055256.18061-1-hsiangkao@linux.alibaba.com
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- fsck/main.c | 23 +++++++++++++++--------
- 1 file changed, 15 insertions(+), 8 deletions(-)
-
-diff --git a/fsck/main.c b/fsck/main.c
-index 6689ad8..28d95ec 100644
---- a/fsck/main.c
-+++ b/fsck/main.c
-@@ -680,28 +680,35 @@ again:
- static int erofsfsck_dirent_iter(struct erofs_dir_context *ctx)
- {
- 	int ret;
--	size_t prev_pos = fsckcfg.extract_pos;
-+	size_t prev_pos, curr_pos;
- 
- 	if (ctx->dot_dotdot)
- 		return 0;
- 
--	if (fsckcfg.extract_path) {
--		size_t curr_pos = prev_pos;
-+	prev_pos = fsckcfg.extract_pos;
-+	curr_pos = prev_pos;
-+
-+	if (prev_pos + ctx->de_namelen >= PATH_MAX) {
-+		erofs_err("unable to fsck since the path is too long (%u)",
-+			  curr_pos + ctx->de_namelen);
-+		return -EOPNOTSUPP;
-+	}
- 
-+	if (fsckcfg.extract_path) {
- 		fsckcfg.extract_path[curr_pos++] = '/';
- 		strncpy(fsckcfg.extract_path + curr_pos, ctx->dname,
- 			ctx->de_namelen);
- 		curr_pos += ctx->de_namelen;
- 		fsckcfg.extract_path[curr_pos] = '\0';
--		fsckcfg.extract_pos = curr_pos;
-+	} else {
-+		curr_pos += ctx->de_namelen;
- 	}
--
-+	fsckcfg.extract_pos = curr_pos;
- 	ret = erofsfsck_check_inode(ctx->dir->nid, ctx->de_nid);
- 
--	if (fsckcfg.extract_path) {
-+	if (fsckcfg.extract_path)
- 		fsckcfg.extract_path[prev_pos] = '\0';
--		fsckcfg.extract_pos = prev_pos;
--	}
-+	fsckcfg.extract_pos = prev_pos;
- 	return ret;
- }
- 
--- 
-2.34.1
-
-- 
2.39.2


