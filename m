Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E107C0015E
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 01:55:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9294.1689299693959333392
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jul 2023 18:54:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Jy2QrIm+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6559aa8e82=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36E1Z1GA023800
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Jul 2023 18:54:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=8/38u
	wAw6Ukby3AlB0+udeufwzXGm0apGa5OcucM1Uo=; b=Jy2QrIm+uGEx4kDSUHHwi
	uwgA0U0KDAhDCqS3BwSFi97koCzoSC7g9z1KiqjdBdw72rXxPf8j8fNdVm/sbzjp
	bD+WArNvksXL/BqzZHMmp0WXzozAdASLubrZrq26mNpw3+RZCsLsOCEUTRlg63DS
	G1665RnJYFL5AjaMGj5xeR49ewUW/+/D+pFBMzkw3Wmu0jiMlqsOabe7F0UcYYvF
	SANZOiUxDqAXbm7tGn6tfahZPkaidfi0NPApZ9m664v91ZT7G2cIiyc2xcCiRSFl
	kDFxgOp0w3E0p5dabCmxPW2DPCY9X7NEJIPverzLBPTPIun/HQePZx3rDaOe96YB
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rtpuc8apn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Jul 2023 18:54:53 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 18:54:52 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Thu, 13 Jul 2023 18:54:52 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [mickledore][PATCH] erofs-utils: fix CVE-2023-33551/CVE-2023-33552
Date: Fri, 14 Jul 2023 09:54:51 +0800
Message-ID: <20230714015451.3485009-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: skDUj2YrvlCtv3jjqw8YBdDskRBMZPZP
X-Proofpoint-ORIG-GUID: skDUj2YrvlCtv3jjqw8YBdDskRBMZPZP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-13_12,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 mlxscore=0 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307140015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 01:55:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184248

From: Changqing Li <changqing.li@windriver.com>

* CVE-2023-33551.patch is for fix CVE-2023-33551.
* CVE-2023-33552-3.patch is upstream patch for fix CVE-2023-33552, since
  the patch context is changed, CVE-2023-33552-1.patch and
  CVE-2023-33552-2.patch is backported.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../erofs-utils/CVE-2023-33551.patch          |  80 +++++++
 .../erofs-utils/CVE-2023-33552-1.patch        | 221 ++++++++++++++++++
 .../erofs-utils/CVE-2023-33552-2.patch        |  97 ++++++++
 .../erofs-utils/CVE-2023-33552-3.patch        | 127 ++++++++++
 .../erofs-utils/erofs-utils_1.5.bb            |   4 +
 5 files changed, 529 insertions(+)
 create mode 100644 meta/recipes-devtools/erofs-utils/erofs-utils/CVE-2023-33551.patch
 create mode 100644 meta/recipes-devtools/erofs-utils/erofs-utils/CVE-2023-33552-1.patch
 create mode 100644 meta/recipes-devtools/erofs-utils/erofs-utils/CVE-2023-33552-2.patch
 create mode 100644 meta/recipes-devtools/erofs-utils/erofs-utils/CVE-2023-33552-3.patch

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils/CVE-2023-33551.patch b/meta/recipes-devtools/erofs-utils/erofs-utils/CVE-2023-33551.patch
new file mode 100644
index 0000000000..9ed77d921f
--- /dev/null
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils/CVE-2023-33551.patch
@@ -0,0 +1,80 @@
+From 5782f0d47df99dcfc743aa138361336e9a4ac966 Mon Sep 17 00:00:00 2001
+From: Gao Xiang <hsiangkao@linux.alibaba.com>
+Date: Fri, 2 Jun 2023 13:52:56 +0800
+Subject: [PATCH 1/4] erofs-utils: fsck: block insane long paths when
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
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/patch/?id=27aeef179bf17d5f1d98f827e93d24839a6d4176]
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ fsck/main.c | 23 +++++++++++++++--------
+ 1 file changed, 15 insertions(+), 8 deletions(-)
+
+diff --git a/fsck/main.c b/fsck/main.c
+index 5a2f659..2b6a6dd 100644
+--- a/fsck/main.c
++++ b/fsck/main.c
+@@ -679,28 +679,35 @@ again:
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
+2.25.1
+
diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils/CVE-2023-33552-1.patch b/meta/recipes-devtools/erofs-utils/erofs-utils/CVE-2023-33552-1.patch
new file mode 100644
index 0000000000..011ca1cd5e
--- /dev/null
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils/CVE-2023-33552-1.patch
@@ -0,0 +1,221 @@
+From 8aef6015a03242a7d13467d23ad52b5427bf5247 Mon Sep 17 00:00:00 2001
+From: Yue Hu <huyue2@coolpad.com>
+Date: Wed, 11 Jan 2023 09:49:26 +0800
+Subject: [PATCH] erofs-utils: lib: export parts of erofs_pread()
+
+Export parts of erofs_pread() to avoid duplicated code in
+erofs_verify_inode_data(). Let's make two helpers for this.
+
+Signed-off-by: Yue Hu <huyue2@coolpad.com>
+Link: https://lore.kernel.org/r/ff560da9c798b2ca1f1a663a000501486d865487.1673401718.git.huyue2@coolpad.com
+Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
+
+CVE: CVE-2023-33552
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/?id=4c0fb15a5d85378debe9d10d96cd643d167300ca]
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ include/erofs/internal.h |   5 ++
+ lib/data.c               | 108 ++++++++++++++++++++++++---------------
+ 2 files changed, 71 insertions(+), 42 deletions(-)
+
+diff --git a/include/erofs/internal.h b/include/erofs/internal.h
+index d3b2986..28d0e68 100644
+--- a/include/erofs/internal.h
++++ b/include/erofs/internal.h
+@@ -335,6 +335,11 @@ int erofs_pread(struct erofs_inode *inode, char *buf,
+ int erofs_map_blocks(struct erofs_inode *inode,
+ 		struct erofs_map_blocks *map, int flags);
+ int erofs_map_dev(struct erofs_sb_info *sbi, struct erofs_map_dev *map);
++int erofs_read_one_data(struct erofs_map_blocks *map, char *buffer, u64 offset,
++			size_t len);
++int z_erofs_read_one_data(struct erofs_inode *inode,
++			struct erofs_map_blocks *map, char *raw, char *buffer,
++			erofs_off_t skip, erofs_off_t length, bool trimmed);
+ 
+ static inline int erofs_get_occupied_size(const struct erofs_inode *inode,
+ 					  erofs_off_t *size)
+diff --git a/lib/data.c b/lib/data.c
+index 6bc554d..2a7fdd5 100644
+--- a/lib/data.c
++++ b/lib/data.c
+@@ -158,19 +158,38 @@ int erofs_map_dev(struct erofs_sb_info *sbi, struct erofs_map_dev *map)
+ 	return 0;
+ }
+ 
++int erofs_read_one_data(struct erofs_map_blocks *map, char *buffer, u64 offset,
++			size_t len)
++{
++	struct erofs_map_dev mdev;
++	int ret;
++
++	mdev = (struct erofs_map_dev) {
++		.m_deviceid = map->m_deviceid,
++		.m_pa = map->m_pa,
++	};
++	ret = erofs_map_dev(&sbi, &mdev);
++	if (ret)
++		return ret;
++
++	ret = dev_read(mdev.m_deviceid, buffer, mdev.m_pa + offset, len);
++	if (ret < 0)
++		return -EIO;
++	return 0;
++}
++
+ static int erofs_read_raw_data(struct erofs_inode *inode, char *buffer,
+ 			       erofs_off_t size, erofs_off_t offset)
+ {
+ 	struct erofs_map_blocks map = {
+ 		.index = UINT_MAX,
+ 	};
+-	struct erofs_map_dev mdev;
+ 	int ret;
+ 	erofs_off_t ptr = offset;
+ 
+ 	while (ptr < offset + size) {
+ 		char *const estart = buffer + ptr - offset;
+-		erofs_off_t eend;
++		erofs_off_t eend, moff = 0;
+ 
+ 		map.m_la = ptr;
+ 		ret = erofs_map_blocks(inode, &map, 0);
+@@ -179,14 +198,6 @@ static int erofs_read_raw_data(struct erofs_inode *inode, char *buffer,
+ 
+ 		DBG_BUGON(map.m_plen != map.m_llen);
+ 
+-		mdev = (struct erofs_map_dev) {
+-			.m_deviceid = map.m_deviceid,
+-			.m_pa = map.m_pa,
+-		};
+-		ret = erofs_map_dev(&sbi, &mdev);
+-		if (ret)
+-			return ret;
+-
+ 		/* trim extent */
+ 		eend = min(offset + size, map.m_la + map.m_llen);
+ 		DBG_BUGON(ptr < map.m_la);
+@@ -204,19 +215,54 @@ static int erofs_read_raw_data(struct erofs_inode *inode, char *buffer,
+ 		}
+ 
+ 		if (ptr > map.m_la) {
+-			mdev.m_pa += ptr - map.m_la;
++			moff = ptr - map.m_la;
+ 			map.m_la = ptr;
+ 		}
+ 
+-		ret = dev_read(mdev.m_deviceid, estart, mdev.m_pa,
+-			       eend - map.m_la);
+-		if (ret < 0)
+-			return -EIO;
++		ret = erofs_read_one_data(&map, estart, moff, eend - map.m_la);
++		if (ret)
++			return ret;
+ 		ptr = eend;
+ 	}
+ 	return 0;
+ }
+ 
++int z_erofs_read_one_data(struct erofs_inode *inode,
++			struct erofs_map_blocks *map, char *raw, char *buffer,
++			erofs_off_t skip, erofs_off_t length, bool trimmed)
++{
++	struct erofs_map_dev mdev;
++	int ret = 0;
++
++	/* no device id here, thus it will always succeed */
++	mdev = (struct erofs_map_dev) {
++		.m_pa = map->m_pa,
++	};
++	ret = erofs_map_dev(&sbi, &mdev);
++	if (ret) {
++		DBG_BUGON(1);
++		return ret;
++	}
++
++	ret = dev_read(mdev.m_deviceid, raw, mdev.m_pa, map->m_plen);
++	if (ret < 0)
++		return ret;
++
++	ret = z_erofs_decompress(&(struct z_erofs_decompress_req) {
++			.in = raw,
++			.out = buffer,
++			.decodedskip = skip,
++			.inputsize = map->m_plen,
++			.decodedlength = length,
++			.alg = map->m_algorithmformat,
++			.partial_decoding = trimmed ? true :
++				!(map->m_flags & EROFS_MAP_FULL_MAPPED)
++			 });
++	if (ret < 0)
++		return ret;
++	return 0;
++}
++
+ static int z_erofs_read_data(struct erofs_inode *inode, char *buffer,
+ 			     erofs_off_t size, erofs_off_t offset)
+ {
+@@ -224,8 +270,7 @@ static int z_erofs_read_data(struct erofs_inode *inode, char *buffer,
+ 	struct erofs_map_blocks map = {
+ 		.index = UINT_MAX,
+ 	};
+-	struct erofs_map_dev mdev;
+-	bool partial;
++	bool trimmed;
+ 	unsigned int bufsize = 0;
+ 	char *raw = NULL;
+ 	int ret = 0;
+@@ -238,27 +283,17 @@ static int z_erofs_read_data(struct erofs_inode *inode, char *buffer,
+ 		if (ret)
+ 			break;
+ 
+-		/* no device id here, thus it will always succeed */
+-		mdev = (struct erofs_map_dev) {
+-			.m_pa = map.m_pa,
+-		};
+-		ret = erofs_map_dev(&sbi, &mdev);
+-		if (ret) {
+-			DBG_BUGON(1);
+-			break;
+-		}
+-
+ 		/*
+ 		 * trim to the needed size if the returned extent is quite
+ 		 * larger than requested, and set up partial flag as well.
+ 		 */
+ 		if (end < map.m_la + map.m_llen) {
+ 			length = end - map.m_la;
+-			partial = true;
++			trimmed = true;
+ 		} else {
+ 			DBG_BUGON(end != map.m_la + map.m_llen);
+ 			length = map.m_llen;
+-			partial = !(map.m_flags & EROFS_MAP_FULL_MAPPED);
++			trimmed = false;
+ 		}
+ 
+ 		if (map.m_la < offset) {
+@@ -283,19 +318,8 @@ static int z_erofs_read_data(struct erofs_inode *inode, char *buffer,
+ 				break;
+ 			}
+ 		}
+-		ret = dev_read(mdev.m_deviceid, raw, mdev.m_pa, map.m_plen);
+-		if (ret < 0)
+-			break;
+-
+-		ret = z_erofs_decompress(&(struct z_erofs_decompress_req) {
+-					.in = raw,
+-					.out = buffer + end - offset,
+-					.decodedskip = skip,
+-					.inputsize = map.m_plen,
+-					.decodedlength = length,
+-					.alg = map.m_algorithmformat,
+-					.partial_decoding = partial
+-					 });
++ 		ret = z_erofs_read_one_data(inode, &map, raw,
++				buffer + end - offset, skip, length, trimmed);
+ 		if (ret < 0)
+ 			break;
+ 	}
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils/CVE-2023-33552-2.patch b/meta/recipes-devtools/erofs-utils/erofs-utils/CVE-2023-33552-2.patch
new file mode 100644
index 0000000000..4d190363b9
--- /dev/null
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils/CVE-2023-33552-2.patch
@@ -0,0 +1,97 @@
+From 3a360e01058467573bd7239fa430d8dc5fbd60f4 Mon Sep 17 00:00:00 2001
+From: Yue Hu <huyue2@coolpad.com>
+Date: Wed, 11 Jan 2023 09:49:27 +0800
+Subject: [PATCH 3/4] erofs-utils: fsck: cleanup erofs_verify_inode_data()
+
+Diretly call {z_}erofs_read_one_data() to avoid duplicated code.
+Accordingly, fragment and partial-referenced plusters are also supported
+after this change.
+
+Signed-off-by: Yue Hu <huyue2@coolpad.com>
+Link: https://lore.kernel.org/r/115e61fc9c2d34cab6d3dd78383ac57c94a491fc.1673401718.git.huyue2@coolpad.com
+Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
+
+CVE: CVE-2023-33552
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/?id=87430c69e1d542928c4519e8fabfd6348a741999]
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ fsck/main.c | 53 ++++++++++-------------------------------------------
+ 1 file changed, 10 insertions(+), 43 deletions(-)
+
+diff --git a/fsck/main.c b/fsck/main.c
+index 2b6a6dd..92ef17a 100644
+--- a/fsck/main.c
++++ b/fsck/main.c
+@@ -366,7 +366,6 @@ static int erofs_verify_inode_data(struct erofs_inode *inode, int outfd)
+ 	struct erofs_map_blocks map = {
+ 		.index = UINT_MAX,
+ 	};
+-	struct erofs_map_dev mdev;
+ 	int ret = 0;
+ 	bool compressed;
+ 	erofs_off_t pos = 0;
+@@ -427,51 +426,19 @@ static int erofs_verify_inode_data(struct erofs_inode *inode, int outfd)
+ 			BUG_ON(!raw);
+ 		}
+ 
+-		mdev = (struct erofs_map_dev) {
+-			.m_deviceid = map.m_deviceid,
+-			.m_pa = map.m_pa,
+-		};
+-		ret = erofs_map_dev(&sbi, &mdev);
+-		if (ret) {
+-			erofs_err("failed to map device of m_pa %" PRIu64 ", m_deviceid %u @ nid %llu: %d",
+-				  map.m_pa, map.m_deviceid, inode->nid | 0ULL,
+-				  ret);
+-			goto out;
+-		}
+-
+-		if (compressed && map.m_llen > buffer_size) {
+-			buffer_size = map.m_llen;
+-			buffer = realloc(buffer, buffer_size);
+-			BUG_ON(!buffer);
+-		}
+-
+-		ret = dev_read(mdev.m_deviceid, raw, mdev.m_pa, map.m_plen);
+-		if (ret < 0) {
+-			erofs_err("failed to read data of m_pa %" PRIu64 ", m_plen %" PRIu64 " @ nid %llu: %d",
+-				  mdev.m_pa, map.m_plen, inode->nid | 0ULL,
+-				  ret);
+-			goto out;
+-		}
+-
+ 		if (compressed) {
+-			struct z_erofs_decompress_req rq = {
+-				.in = raw,
+-				.out = buffer,
+-				.decodedskip = 0,
+-				.inputsize = map.m_plen,
+-				.decodedlength = map.m_llen,
+-				.alg = map.m_algorithmformat,
+-				.partial_decoding = 0
+-			};
+-
+-			ret = z_erofs_decompress(&rq);
+-			if (ret < 0) {
+-				erofs_err("failed to decompress data of m_pa %" PRIu64 ", m_plen %" PRIu64 " @ nid %llu: %s",
+-					  mdev.m_pa, map.m_plen,
+-					  inode->nid | 0ULL, strerror(-ret));
+-				goto out;
++			if (map.m_llen > buffer_size) {
++				buffer_size = map.m_llen;
++				buffer = realloc(buffer, buffer_size);
++				BUG_ON(!buffer);
+ 			}
++			ret = z_erofs_read_one_data(inode, &map, raw, buffer,
++						0, map.m_llen, false);
++		} else {
++			ret = erofs_read_one_data(&map, raw, 0, map.m_plen);
+ 		}
++		if (ret)
++			goto out;
+ 
+ 		if (outfd >= 0 && write(outfd, compressed ? buffer : raw,
+ 					map.m_llen) < 0) {
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils/CVE-2023-33552-3.patch b/meta/recipes-devtools/erofs-utils/erofs-utils/CVE-2023-33552-3.patch
new file mode 100644
index 0000000000..c05d62c5dd
--- /dev/null
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils/CVE-2023-33552-3.patch
@@ -0,0 +1,127 @@
+From b4e155ba759ae389c5f71cd13d97eb3bcf2c1adf Mon Sep 17 00:00:00 2001
+From: Gao Xiang <hsiangkao@linux.alibaba.com>
+Date: Fri, 2 Jun 2023 11:05:19 +0800
+Subject: [PATCH] erofs-utils: fsck: don't allocate/read too large extents
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
+CVE: CVE-2023-33552
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/patch/?id=2145dff03dd3f3f74bcda3b52160fbad37f7fcfe]
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ fsck/main.c | 64 ++++++++++++++++++++++++++++++++++++++++-------------
+ 1 file changed, 49 insertions(+), 15 deletions(-)
+
+diff --git a/fsck/main.c b/fsck/main.c
+index 92ef17a..1bd1117 100644
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
+@@ -434,18 +454,26 @@ static int erofs_verify_inode_data(struct erofs_inode *inode, int outfd)
+ 			}
+ 			ret = z_erofs_read_one_data(inode, &map, raw, buffer,
+ 						0, map.m_llen, false);
+-		} else {
+-			ret = erofs_read_one_data(&map, raw, 0, map.m_plen);
+-		}
+-		if (ret)
+-			goto out;
++			if (ret)
++				goto out;
+ 
+-		if (outfd >= 0 && write(outfd, compressed ? buffer : raw,
+-					map.m_llen) < 0) {
+-			erofs_err("I/O error occurred when verifying data chunk @ nid %llu",
+-				  inode->nid | 0ULL);
+-			ret = -EIO;
+-			goto out;
++			if (outfd >= 0 && write(outfd, buffer, map.m_llen) < 0)
++				goto fail_eio;
++		} else {
++			u64 p = 0;
++			do {
++				u64 count = min_t(u64, alloc_rawsize,
++						map.m_llen);
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
+@@ -461,6 +489,12 @@ out:
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
+2.25.1
+
diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.5.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.5.bb
index 2b5861882d..d7e646a66c 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.5.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.5.bb
@@ -10,6 +10,10 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;b
            file://0001-configure-use-AC_SYS_LARGEFILE.patch \
            file://0002-erofs-replace-l-stat64-by-equivalent-l-stat.patch \
            file://0003-internal.h-Make-LFS-mandatory-for-all-usecases.patch \
+           file://CVE-2023-33551.patch \
+           file://CVE-2023-33552-1.patch \
+           file://CVE-2023-33552-2.patch \
+           file://CVE-2023-33552-3.patch \	
            "
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
-- 
2.25.1


