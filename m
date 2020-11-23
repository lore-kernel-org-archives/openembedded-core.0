Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.51])
 by mx.groups.io with SMTP id smtpd.web12.33529.1606130291000578106
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2020 03:18:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=PQwsu2bY;
 spf=pass (domain: windriver.com, ip: 40.107.243.51, mailfrom: zhe.he@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hH6Tbfid1OFASbNlV1OU12gnaGm4NNwhc6bvHVG9pkGE48cL+vTamdqOGwLw2GVH4jKyHoVqNnKL+uah9TSg1vCXgJDrzIbKJK6e4MKejzu7Lp3H0ERBADoBxR85L23TZJdvSUfDm682/lapUWaPGnG1sCu66lmd7naQPooVAftL5ikY44u4ZRRf61u0jdHBmmkhqFIy2snemTYTWdXOy3V9OeL1GocvmXpmJ9cu0kDcuBpggFlErvFcvzMdU0aKdr+20dmGd/PZUh4QFSPlEHyjooOsxWEGA1bB7tYcCnzN52EFXkUj/oGPUjLg9bqLpgB0mmSeLVc863c/jbF2fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OaRffRZjLdPwhj9O+fjrrnteAQCy3K18gMjQCG8kIk0=;
 b=ldzRjASvOSSBm8Z8xw3rk52L8QI6VU8/LAoiq0mX0e3cpC0T6463aZHRoaKxzvNq8wDJjBnd2cFY2twXGck4sfvuF5PRrs2Y39vQxvnQvNJ29Vj9q1RC86yQE6HTfhzhVsWOraJok6cSviOB9rA9yaTXGraJ8hP7TpBsVGJaJsvds2/stBbkRKmZ47xKF20vTRib/3ZTAFaqXy5dGcOEmCModexZKskdxO1N0R+RZoEfnxFu+QuEe7dpMiGQ+7AHX312S/770VEbnLdgZVU64oagpPUhQUgZy4uZ2kRCVbzjQ49EXzARCJN8nS7WB/i7lfkl39ZV1Qo5pZAbeCMCnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OaRffRZjLdPwhj9O+fjrrnteAQCy3K18gMjQCG8kIk0=;
 b=PQwsu2bY+oTQNMuG88lEnwHE+kcb3QFG8+dTlI1YfEHrPfcfEvs4ClBfk7cb60K3QKyBGpgWhxve9/qQ05+Pl9rzuLWtwQGbwWqHmiwthEEw4v8G7hjUyyK3UZ/lznUP6ASL7oU67CUbgMHfpHf0k+XLp8oCqzSBgWFcoEmXh8g=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB3360.namprd11.prod.outlook.com (2603:10b6:805:c8::30)
 by SN6PR11MB3264.namprd11.prod.outlook.com (2603:10b6:805:bd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Mon, 23 Nov
 2020 11:18:09 +0000
Received: from SN6PR11MB3360.namprd11.prod.outlook.com
 ([fe80::f013:6c05:9f97:ca7c]) by SN6PR11MB3360.namprd11.prod.outlook.com
 ([fe80::f013:6c05:9f97:ca7c%6]) with mapi id 15.20.3589.025; Mon, 23 Nov 2020
 11:18:09 +0000
From: "He Zhe" <zhe.he@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: He Zhe <zhe.he@windriver.com>
Subject: [oe-core][PATCH] lttng-modules: Backport a patch to fix btrfs build failure
Date: Mon, 23 Nov 2020 19:17:53 +0800
Message-Id: <20201123111753.38770-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0128.apcprd02.prod.outlook.com
 (2603:1096:202:16::12) To SN6PR11MB3360.namprd11.prod.outlook.com
 (2603:10b6:805:c8::30)
Return-Path: zhe.he@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK2PR02CA0128.apcprd02.prod.outlook.com (2603:1096:202:16::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 11:18:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df2138a3-a92e-46eb-55a5-08d88fa17561
X-MS-TrafficTypeDiagnostic: SN6PR11MB3264:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3264A0EC2DE7D8B3C1D8C5A68FFC0@SN6PR11MB3264.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wHD1dV/S0n7edPriEIwzGDpR5m7fqvRMUlOIIFhLh6n193VYJjc0LVrOftJqr4qTn39rud0QTh0Fxi41+oFUqfZY3QYiT+U2FHrQyj/TYeZRAIDpDz8sZgFd2cOfmMmD3A3D1Nd7yExvBkdGT6YkgljurGjM64nNKdHWWSAJLmCTd8cyybN5pkJzkjUPzTDH8o33GonHDyWmqUpVbbuvbDsxRMaQ9yMDRcpdxTsXowX3ETHIgS3SsaEZg111C794q04DTNBQ7P4B7bxOH/nRqOwl3mCBw90O+YICzQ4K9D1RGAE7/ulAW5gj9oGRsfd/gl9xhAr0HGo2j56aXNACEDDH8fQvVrlc+NmqkNnsstO2S0cadnt9vah1TRji8aNU56tIOQyJToaDeEwaLeBeZw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3360.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(346002)(396003)(136003)(366004)(6512007)(66556008)(6666004)(26005)(186003)(83380400001)(316002)(6506007)(8676002)(8936002)(5660300002)(6486002)(16526019)(86362001)(1076003)(478600001)(956004)(66946007)(4326008)(107886003)(36756003)(52116002)(66476007)(2616005)(30864003)(6916009)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	eCHi6yDHpogPQnyNn1doKyEC/xxVf1DXIWBSnozq7WxBVirtzOEbizuNDVBcNvZnCbJkG2kLo7B3Dnfd1wx093Q1XDkqNYgoy93c9bojgqTn1V+waM/I6zZGv5kajnnAuq3hBYBTBwcU0ZRd8viSGqKoUn1VhCQFxmwmNajm/rm7cqZ4fKPF4HRWahZfnoLt7vNrwBwDXhjOybSvkfbDGfCNZGCwrqeNqGyeeB9dP9mY8b3j9i3zfBWhKhs1cwdY902EYLuePyPw0vNFXWogARIA16E08bdK+XD7THoIdVqFnuICeTMDu27uqV9nSx6ZRi1llHzajzi63rQDrzRcOQDkQXais1+EZVhvnTp6BDaNc8y+BZiCc4u8RKgb/IHGCi5f6A7Vyabng63/uhobAMdPwTPMdl3M6sY6Y7HWqDUhndGsesadDi/YeaiU2waxBz1fl+TeUvs3L5+M+Izql0KvExo/h4zDhnqk6O5KtI2xKp+hdfPLww4JlcDgEP26TYs3NcOF7CimZ+ieiUVFkGK45THmlixNVx2JdVTmeYQ5tKxMuszVGwTw+LqailG54tFX6zhmhm+ljlD6Jqf3DxwZ7xom7/V2Le/jFBmukAqPD640iasnvD1LrP/9r2Tl8GDjZ576ZK7DqGw0Scu7zALRyObpJcElkbJLK8opuq0hn7JC7QyIEP9aLfQIb8+sMjmcQ3e0xzqVRibdpjWa5xiV85z+yboBGLjjYFj/nPZeNxOKUBdAcl+rFGizWsppNI4LMQso/4+3bqa7I0iqijMBBm3Ie3b6ODxhNrj2v+0u6m+JwZYgcv38+4vQm8sQyDwl6v3Pm1WyrXuLXX3uEOs3eETIX4Wx16x6xRR9CD9OqQrURaJrLzt4X0PSGxAbUFrb7Qs2DFYaNLuy+Cf2Og==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df2138a3-a92e-46eb-55a5-08d88fa17561
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 11:18:09.7893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vuYc4UAnlx6dwa0luJbNI43qps19u9RBViwFF2EyXdeAlzetPlwIPcoBhjUKf6bkF4aTOfRrYwHfHozQl8N/UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3264
Content-Type: text/plain

lttng-modules-2.12.3/probes/lttng-probe-btrfs.c:36:
lttng-modules-2.12.3/probes/../probes/lttng-tracepoint-event-impl.h:131:6:
error: conflicting types for 'trace_find_free_extent'

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...oints-output-proper-root-owner-for-t.patch | 318 ++++++++++++++++++
 .../lttng/lttng-modules_2.12.3.bb             |   1 +
 2 files changed, 319 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-btrfs-tracepoints-output-proper-root-owner-for-t.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-btrfs-tracepoints-output-proper-root-owner-for-t.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-btrfs-tracepoints-output-proper-root-owner-for-t.patch
new file mode 100644
index 0000000000..956f53d7b7
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-btrfs-tracepoints-output-proper-root-owner-for-t.patch
@@ -0,0 +1,318 @@
+From e13a7d262928984154fcf89feb14098e0cd1ad31 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Tue, 27 Oct 2020 11:42:23 -0400
+Subject: [PATCH 04/11] fix: btrfs: tracepoints: output proper root owner for
+ trace_find_free_extent() (v5.10)
+
+See upstream commit :
+
+  commit 437490fed3b0c9ae21af8f70e0f338d34560842b
+  Author: Qu Wenruo <wqu@suse.com>
+  Date:   Tue Jul 28 09:42:49 2020 +0800
+
+    btrfs: tracepoints: output proper root owner for trace_find_free_extent()
+
+    The current trace event always output result like this:
+
+     find_free_extent: root=2(EXTENT_TREE) len=16384 empty_size=0 flags=4(METADATA)
+     find_free_extent: root=2(EXTENT_TREE) len=16384 empty_size=0 flags=4(METADATA)
+     find_free_extent: root=2(EXTENT_TREE) len=8192 empty_size=0 flags=1(DATA)
+     find_free_extent: root=2(EXTENT_TREE) len=8192 empty_size=0 flags=1(DATA)
+     find_free_extent: root=2(EXTENT_TREE) len=4096 empty_size=0 flags=1(DATA)
+     find_free_extent: root=2(EXTENT_TREE) len=4096 empty_size=0 flags=1(DATA)
+
+    T's saying we're allocating data extent for EXTENT tree, which is not
+    even possible.
+
+    It's because we always use EXTENT tree as the owner for
+    trace_find_free_extent() without using the @root from
+    btrfs_reserve_extent().
+
+    This patch will change the parameter to use proper @root for
+    trace_find_free_extent():
+
+    Now it looks much better:
+
+     find_free_extent: root=5(FS_TREE) len=16384 empty_size=0 flags=36(METADATA|DUP)
+     find_free_extent: root=5(FS_TREE) len=8192 empty_size=0 flags=1(DATA)
+     find_free_extent: root=5(FS_TREE) len=16384 empty_size=0 flags=1(DATA)
+     find_free_extent: root=5(FS_TREE) len=4096 empty_size=0 flags=1(DATA)
+     find_free_extent: root=5(FS_TREE) len=8192 empty_size=0 flags=1(DATA)
+     find_free_extent: root=5(FS_TREE) len=16384 empty_size=0 flags=36(METADATA|DUP)
+     find_free_extent: root=7(CSUM_TREE) len=16384 empty_size=0 flags=36(METADATA|DUP)
+     find_free_extent: root=2(EXTENT_TREE) len=16384 empty_size=0 flags=36(METADATA|DUP)
+     find_free_extent: root=1(ROOT_TREE) len=16384 empty_size=0 flags=36(METADATA|DUP)
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Change-Id: I1d674064d29b31417e2acffdeb735f5052a87032
+
+Upstream-Status: Backport
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ instrumentation/events/lttng-module/btrfs.h | 206 ++++++++++++--------
+ 1 file changed, 122 insertions(+), 84 deletions(-)
+
+diff --git a/instrumentation/events/lttng-module/btrfs.h b/instrumentation/events/lttng-module/btrfs.h
+index 7b29008..52fcfd0 100644
+--- a/instrumentation/events/lttng-module/btrfs.h
++++ b/instrumentation/events/lttng-module/btrfs.h
+@@ -1856,7 +1856,29 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserved_extent,  btrfs_reserved_extent_f
+ 
+ #endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,10,0)) */
+ 
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,5,0))
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,10,0) || \
++	LTTNG_KERNEL_RANGE(5,9,6, 5,10,0) || \
++	LTTNG_KERNEL_RANGE(5,4,78, 5,5,0))
++LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
++
++	btrfs_find_free_extent,
++
++	TP_PROTO(const struct btrfs_root *root, u64 num_bytes, u64 empty_size,
++		 u64 data),
++
++	TP_ARGS(root, num_bytes, empty_size, data),
++
++	TP_FIELDS(
++		ctf_array(u8, fsid, root->lttng_fs_info_fsid, BTRFS_UUID_SIZE)
++		ctf_integer(u64, root_objectid, root->root_key.objectid)
++		ctf_integer(u64, num_bytes, num_bytes)
++		ctf_integer(u64, empty_size, empty_size)
++		ctf_integer(u64, data, data)
++	)
++)
++
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(5,5,0))
++
+ LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
+ 
+ 	btrfs_find_free_extent,
+@@ -1874,6 +1896,105 @@ LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
+ 	)
+ )
+ 
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,18,0))
++
++LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
++
++	btrfs_find_free_extent,
++
++	TP_PROTO(const struct btrfs_fs_info *fs_info, u64 num_bytes, u64 empty_size,
++		 u64 data),
++
++	TP_ARGS(fs_info, num_bytes, empty_size, data),
++
++	TP_FIELDS(
++		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
++		ctf_integer(u64, num_bytes, num_bytes)
++		ctf_integer(u64, empty_size, empty_size)
++		ctf_integer(u64, data, data)
++	)
++)
++
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,14,0))
++
++LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
++
++	btrfs_find_free_extent,
++
++	TP_PROTO(const struct btrfs_fs_info *fs_info, u64 num_bytes, u64 empty_size,
++		 u64 data),
++
++	TP_ARGS(fs_info, num_bytes, empty_size, data),
++
++	TP_FIELDS(
++		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
++		ctf_integer(u64, num_bytes, num_bytes)
++		ctf_integer(u64, empty_size, empty_size)
++		ctf_integer(u64, data, data)
++	)
++)
++
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,10,0))
++
++LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
++
++	btrfs_find_free_extent,
++
++	TP_PROTO(struct btrfs_fs_info *fs_info, u64 num_bytes, u64 empty_size,
++		 u64 data),
++
++	TP_ARGS(fs_info, num_bytes, empty_size, data),
++
++	TP_FIELDS(
++		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
++		ctf_integer(u64, num_bytes, num_bytes)
++		ctf_integer(u64, empty_size, empty_size)
++		ctf_integer(u64, data, data)
++	)
++)
++
++#elif (LTTNG_SLE_KERNEL_RANGE(4,4,73,5,0,0, 4,4,73,6,0,0) || \
++	LTTNG_SLE_KERNEL_RANGE(4,4,82,6,0,0, 4,4,82,7,0,0) || \
++	LTTNG_SLE_KERNEL_RANGE(4,4,92,6,0,0, 4,4,92,7,0,0) || \
++	LTTNG_SLE_KERNEL_RANGE(4,4,103,6,0,0, 4,5,0,0,0,0))
++
++LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
++
++	btrfs_find_free_extent,
++
++	TP_PROTO(const struct btrfs_root *root, u64 num_bytes, u64 empty_size,
++		 u64 data),
++
++	TP_ARGS(root, num_bytes, empty_size, data),
++
++	TP_FIELDS(
++		ctf_integer(u64, root_objectid, root->root_key.objectid)
++		ctf_integer(u64, num_bytes, num_bytes)
++		ctf_integer(u64, empty_size, empty_size)
++		ctf_integer(u64, data, data)
++	)
++)
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,3,0))
++
++LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
++
++	btrfs_find_free_extent,
++
++	TP_PROTO(struct btrfs_root *root, u64 num_bytes, u64 empty_size,
++		 u64 data),
++
++	TP_ARGS(root, num_bytes, empty_size, data),
++
++	TP_FIELDS(
++		ctf_integer(u64, root_objectid, root->root_key.objectid)
++		ctf_integer(u64, num_bytes, num_bytes)
++		ctf_integer(u64, empty_size, empty_size)
++		ctf_integer(u64, data, data)
++	)
++)
++#endif
++
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,5,0))
+ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
+ 
+ 	TP_PROTO(const struct btrfs_block_group *block_group, u64 start,
+@@ -1907,22 +2028,6 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserve_extent, btrfs_reserve_extent_clus
+ )
+ 
+ #elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,18,0))
+-LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
+-
+-	btrfs_find_free_extent,
+-
+-	TP_PROTO(const struct btrfs_fs_info *fs_info, u64 num_bytes, u64 empty_size,
+-		 u64 data),
+-
+-	TP_ARGS(fs_info, num_bytes, empty_size, data),
+-
+-	TP_FIELDS(
+-		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
+-		ctf_integer(u64, num_bytes, num_bytes)
+-		ctf_integer(u64, empty_size, empty_size)
+-		ctf_integer(u64, data, data)
+-	)
+-)
+ 
+ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
+ 
+@@ -1957,22 +2062,6 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserve_extent, btrfs_reserve_extent_clus
+ )
+ 
+ #elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,14,0))
+-LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
+-
+-	btrfs_find_free_extent,
+-
+-	TP_PROTO(const struct btrfs_fs_info *fs_info, u64 num_bytes, u64 empty_size,
+-		 u64 data),
+-
+-	TP_ARGS(fs_info, num_bytes, empty_size, data),
+-
+-	TP_FIELDS(
+-		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
+-		ctf_integer(u64, num_bytes, num_bytes)
+-		ctf_integer(u64, empty_size, empty_size)
+-		ctf_integer(u64, data, data)
+-	)
+-)
+ 
+ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
+ 
+@@ -2011,23 +2100,6 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserve_extent, btrfs_reserve_extent_clus
+ 
+ #elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,10,0))
+ 
+-LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
+-
+-	btrfs_find_free_extent,
+-
+-	TP_PROTO(struct btrfs_fs_info *fs_info, u64 num_bytes, u64 empty_size,
+-		 u64 data),
+-
+-	TP_ARGS(fs_info, num_bytes, empty_size, data),
+-
+-	TP_FIELDS(
+-		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
+-		ctf_integer(u64, num_bytes, num_bytes)
+-		ctf_integer(u64, empty_size, empty_size)
+-		ctf_integer(u64, data, data)
+-	)
+-)
+-
+ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
+ 
+ 	TP_PROTO(struct btrfs_fs_info *fs_info,
+@@ -2066,23 +2138,6 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserve_extent, btrfs_reserve_extent_clus
+ 	LTTNG_SLE_KERNEL_RANGE(4,4,92,6,0,0, 4,4,92,7,0,0) || \
+ 	LTTNG_SLE_KERNEL_RANGE(4,4,103,6,0,0, 4,5,0,0,0,0))
+ 
+-LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
+-
+-	btrfs_find_free_extent,
+-
+-	TP_PROTO(const struct btrfs_root *root, u64 num_bytes, u64 empty_size,
+-		 u64 data),
+-
+-	TP_ARGS(root, num_bytes, empty_size, data),
+-
+-	TP_FIELDS(
+-		ctf_integer(u64, root_objectid, root->root_key.objectid)
+-		ctf_integer(u64, num_bytes, num_bytes)
+-		ctf_integer(u64, empty_size, empty_size)
+-		ctf_integer(u64, data, data)
+-	)
+-)
+-
+ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
+ 
+ 	TP_PROTO(const struct btrfs_root *root,
+@@ -2120,23 +2175,6 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserve_extent, btrfs_reserve_extent_clus
+ 
+ #elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,3,0))
+ 
+-LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
+-
+-	btrfs_find_free_extent,
+-
+-	TP_PROTO(struct btrfs_root *root, u64 num_bytes, u64 empty_size,
+-		 u64 data),
+-
+-	TP_ARGS(root, num_bytes, empty_size, data),
+-
+-	TP_FIELDS(
+-		ctf_integer(u64, root_objectid, root->root_key.objectid)
+-		ctf_integer(u64, num_bytes, num_bytes)
+-		ctf_integer(u64, empty_size, empty_size)
+-		ctf_integer(u64, data, data)
+-	)
+-)
+-
+ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
+ 
+ 	TP_PROTO(struct btrfs_root *root,
+-- 
+2.17.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.12.3.bb b/meta/recipes-kernel/lttng/lttng-modules_2.12.3.bb
index 0b6a69ff5e..ca79e27df6 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.12.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.12.3.bb
@@ -11,6 +11,7 @@ include lttng-platforms.inc
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
+           file://0001-fix-btrfs-tracepoints-output-proper-root-owner-for-t.patch \
            "
 
 SRC_URI[sha256sum] = "673ef85c9f03e9b8fed10795e09d4e68add39404b70068d08b10f7b85754d7f0"
-- 
2.17.1

