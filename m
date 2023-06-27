Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF44EEB64DD
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:06:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7391.1687849556720398205
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:05:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=my/GMA+f;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=55427ce27d=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35R5T7VX001078
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=BcAiBVWI+PP3l/kiYVn77T1njFFvn9l4NDW6xebv5Q0=; b=
	my/GMA+fC9lHJ+oWQhP/KCYpQyUUFp2Et8wlu70IuW/CrRpQFaAPEwv0WjmATDA4
	icpBE1a4Iy5i+6JC4PptcraS00jdoRBkY8sAmzCyeFFQODaHmYydAq/FVMwULDsG
	w14aPko+actmZAZmRtaEJ2M9NO8rEuAmXj+piS/LntnPkiLrWtliXYToNw3xaizJ
	ZV3/21+HufQND5llTlxXowqZo1csAnj4mysa2+TuV0HnHIOZCzq90y9n0iRrEa2z
	6dALn4g8aSTQzPXYkGKYuSK8z3dGhYHW0CjHKxmKFBJ+2IDO4cLfqZcs70Uou9/o
	lcSLzGcJl6+I92cETHpLBw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdpqb2gwv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:05:55 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 00:05:54 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Tue, 27 Jun 2023 00:05:54 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [mickledore][PATCH 2/2] erofs-utils: backport fixes for CVE-2023-33551 and CVE-2023-33552
Date: Tue, 27 Jun 2023 15:05:52 +0800
Message-ID: <20230627070552.2017915-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230627070552.2017915-1-changqing.li@windriver.com>
References: <20230627070552.2017915-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: JDmOCDAwxOFgo5BbnFJNKjrquf_KfM3K
X-Proofpoint-GUID: JDmOCDAwxOFgo5BbnFJNKjrquf_KfM3K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-27_04,2023-06-26_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 mlxlogscore=762 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306270066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:06:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183441

From: Ross Burton <ross.burton@arm.com>

(From OE-Core rev: fb0e4612b3b54746043205b56b2c3782489c191e)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../erofs-utils/erofs-utils_1.6.bb            |   5 +-
 ...-don-t-allocate-read-too-large-exten.patch | 126 ++++++++++++++++++
 ...-block-insane-long-paths-when-extrac.patch |  80 +++++++++++
 3 files changed, 210 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/erofs-utils/files/0001-erofs-utils-fsck-don-t-allocate-read-too-large-exten.patch
 create mode 100644 meta/recipes-devtools/erofs-utils/files/0002-erofs-utils-fsck-block-insane-long-paths-when-extrac.patch

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.6.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.6.bb
index 43643e07bb..5a89e4b8ee 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.6.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.6.bb
@@ -6,7 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73001d804ea1e3d84365f652242cca20"
 HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/README"
 
 SRCREV = "21710612d35cd952490959bfa6ea9fe87aaa52dd"
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master;protocol=https"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master;protocol=https \
+           file://0001-erofs-utils-fsck-don-t-allocate-read-too-large-exten.patch \
+           file://0002-erofs-utils-fsck-block-insane-long-paths-when-extrac.patch \
+"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
 
diff --git a/meta/recipes-devtools/erofs-utils/files/0001-erofs-utils-fsck-don-t-allocate-read-too-large-exten.patch b/meta/recipes-devtools/erofs-utils/files/0001-erofs-utils-fsck-don-t-allocate-read-too-large-exten.patch
new file mode 100644
index 0000000000..52f475dc42
--- /dev/null
+++ b/meta/recipes-devtools/erofs-utils/files/0001-erofs-utils-fsck-don-t-allocate-read-too-large-exten.patch
@@ -0,0 +1,126 @@
+From c769805c79d5acede65d96e5786aa5ebb46c01e0 Mon Sep 17 00:00:00 2001
+From: Gao Xiang <hsiangkao@linux.alibaba.com>
+Date: Fri, 2 Jun 2023 11:05:19 +0800
+Subject: [PATCH 1/2] erofs-utils: fsck: don't allocate/read too large extents
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
+Fixes: 412c8f908132 ("erofs-utils: fsck: add --extract=X support to extract to path X")
+Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
+Link: https://lore.kernel.org/r/20230602030519.117071-1-hsiangkao@linux.alibaba.com
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
+@@ -392,6 +392,8 @@ static int erofs_verify_inode_data(struct erofs_inode *inode, int outfd)
+ 	}
+ 
+ 	while (pos < inode->i_size) {
++		unsigned int alloc_rawsize;
++
+ 		map.m_la = pos;
+ 		if (compressed)
+ 			ret = z_erofs_map_blocks_iter(inode, &map,
+@@ -420,10 +422,28 @@ static int erofs_verify_inode_data(struct erofs_inode *inode, int outfd)
+ 		if (!(map.m_flags & EROFS_MAP_MAPPED) || !fsckcfg.check_decomp)
+ 			continue;
+ 
+-		if (map.m_plen > raw_size) {
+-			raw_size = map.m_plen;
+-			raw = realloc(raw, raw_size);
+-			BUG_ON(!raw);
++		if (map.m_plen > Z_EROFS_PCLUSTER_MAX_SIZE) {
++			if (compressed) {
++				erofs_err("invalid pcluster size %" PRIu64 " @ offset %" PRIu64 " of nid %" PRIu64,
++					  map.m_plen, map.m_la,
++					  inode->nid | 0ULL);
++				ret = -EFSCORRUPTED;
++				goto out;
++			}
++			alloc_rawsize = Z_EROFS_PCLUSTER_MAX_SIZE;
++		} else {
++			alloc_rawsize = map.m_plen;
++		}
++
++		if (alloc_rawsize > raw_size) {
++			char *newraw = realloc(raw, alloc_rawsize);
++
++			if (!newraw) {
++				ret = -ENOMEM;
++				goto out;
++			}
++			raw = newraw;
++			raw_size = alloc_rawsize;
+ 		}
+ 
+ 		if (compressed) {
+@@ -434,18 +454,27 @@ static int erofs_verify_inode_data(struct erofs_inode *inode, int outfd)
+ 			}
+ 			ret = z_erofs_read_one_data(inode, &map, raw, buffer,
+ 						    0, map.m_llen, false);
++			if (ret)
++				goto out;
++
++			if (outfd >= 0 && write(outfd, buffer, map.m_llen) < 0)
++				goto fail_eio;
+ 		} else {
+-			ret = erofs_read_one_data(&map, raw, 0, map.m_plen);
+-		}
+-		if (ret)
+-			goto out;
++			u64 p = 0;
+ 
+-		if (outfd >= 0 && write(outfd, compressed ? buffer : raw,
+-					map.m_llen) < 0) {
+-			erofs_err("I/O error occurred when verifying data chunk @ nid %llu",
+-				  inode->nid | 0ULL);
+-			ret = -EIO;
+-			goto out;
++			do {
++				u64 count = min_t(u64, alloc_rawsize,
++						  map.m_llen);
++
++				ret = erofs_read_one_data(&map, raw, p, count);
++				if (ret)
++					goto out;
++
++				if (outfd >= 0 && write(outfd, raw, count) < 0)
++					goto fail_eio;
++				map.m_llen -= count;
++				p += count;
++			} while (map.m_llen);
+ 		}
+ 	}
+ 
+@@ -460,6 +489,12 @@ out:
+ 	if (buffer)
+ 		free(buffer);
+ 	return ret < 0 ? ret : 0;
++
++fail_eio:
++	erofs_err("I/O error occurred when verifying data chunk @ nid %llu",
++		  inode->nid | 0ULL);
++	ret = -EIO;
++	goto out;
+ }
+ 
+ static inline int erofs_extract_dir(struct erofs_inode *inode)
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/erofs-utils/files/0002-erofs-utils-fsck-block-insane-long-paths-when-extrac.patch b/meta/recipes-devtools/erofs-utils/files/0002-erofs-utils-fsck-block-insane-long-paths-when-extrac.patch
new file mode 100644
index 0000000000..f2f1e34368
--- /dev/null
+++ b/meta/recipes-devtools/erofs-utils/files/0002-erofs-utils-fsck-block-insane-long-paths-when-extrac.patch
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
+Fixes: b11f84f593f9 ("erofs-utils: fsck: convert to use erofs_iterate_dir()")
+Fixes: 412c8f908132 ("erofs-utils: fsck: add --extract=X support to extract to path X")
+Signeo-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
+Link: https://lore.kernel.org/r/20230602055256.18061-1-hsiangkao@linux.alibaba.com
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
+-	size_t prev_pos = fsckcfg.extract_pos;
++	size_t prev_pos, curr_pos;
+ 
+ 	if (ctx->dot_dotdot)
+ 		return 0;
+ 
+-	if (fsckcfg.extract_path) {
+-		size_t curr_pos = prev_pos;
++	prev_pos = fsckcfg.extract_pos;
++	curr_pos = prev_pos;
++
++	if (prev_pos + ctx->de_namelen >= PATH_MAX) {
++		erofs_err("unable to fsck since the path is too long (%u)",
++			  curr_pos + ctx->de_namelen);
++		return -EOPNOTSUPP;
++	}
+ 
++	if (fsckcfg.extract_path) {
+ 		fsckcfg.extract_path[curr_pos++] = '/';
+ 		strncpy(fsckcfg.extract_path + curr_pos, ctx->dname,
+ 			ctx->de_namelen);
+ 		curr_pos += ctx->de_namelen;
+ 		fsckcfg.extract_path[curr_pos] = '\0';
+-		fsckcfg.extract_pos = curr_pos;
++	} else {
++		curr_pos += ctx->de_namelen;
+ 	}
+-
++	fsckcfg.extract_pos = curr_pos;
+ 	ret = erofsfsck_check_inode(ctx->dir->nid, ctx->de_nid);
+ 
+-	if (fsckcfg.extract_path) {
++	if (fsckcfg.extract_path)
+ 		fsckcfg.extract_path[prev_pos] = '\0';
+-		fsckcfg.extract_pos = prev_pos;
+-	}
++	fsckcfg.extract_pos = prev_pos;
+ 	return ret;
+ }
+ 
+-- 
+2.34.1
+
-- 
2.25.1


