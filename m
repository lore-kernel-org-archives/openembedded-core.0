Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F9F4C5DF7D
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 09:23:48 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3784.1787304224476888161
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 02:23:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=KETrCyxQ;
 spf=pass (domain: est.tech, ip: 52.101.65.16, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bwkHL8JRq5j7F13VaZWnoKSTJHukAfsZ7WiL6mqjE6w0ja118ap/gx/DWkk+P2DmNpFoIItVD1nYhNBltUnwf8s8Fz6YI48uL/ZPuvFsaQXKMTWHYIaZfNaaURn2tivgBmEU2+nZlzMbc2GZlG7kB05U2BvU4BzI7F4VTgC2XjRAaU+rlF/+9jKSjZ8ryLOrZZyrr4qohSmbmpTG8mOJvn2ArYRK9W6LrsiavyVsQfqH/xEOii59+3h8kSDDJApV5kSeO88igpgc8wpWzxy15MQbiNCKHVKL865rgz7aJm8106+uG/VcWhqo6gAdffNzyESX4ORlnEHsbCZq/eQg4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JiMVEQWWMPHBCB7CYjGm2Kzlvuk6Gxf7z22LgzMZFbU=;
 b=kLBT5QRkdWTRKjqwKPMLZMlzykQ/plY6xH7KQunjsQemaOqpvOEjLzlZNr+1bGT8ByZVPx3Qypy+6U/XTK4PS8opB8ao+8lVU75nfXPEEvEjP1Byjx5CXgTZN5YbwGvRgRrs7E15pbu6w4HA4AX0b02wpwvIbW85N1+UExZrob2BNvEQ6D3SfMgLuoCEAuplmvF+lTtgSciZwDa9jNVwYWiMnGFbgskonLOYdV3E0D0WbsHoOvYGwPR+hE+98n76nnXnkeDHY90UFQXorPwUvenOvbqjRfYq355sKEuxPF6zqhoJpv0Z93bAz9YPZyre4UsgmVdbbWs7n9Ej3Smc2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JiMVEQWWMPHBCB7CYjGm2Kzlvuk6Gxf7z22LgzMZFbU=;
 b=KETrCyxQS2j6ID8WG2gvWixY4FcgFFW4rupabwsesRwQalixi4ilgttv14YEpNqqdsirTcVW2eFC74CZ0yQvZxjaCVg1/98ApXGorKY+eF7+JlnScBg9Yk3xdURtbRhnr/VaGM3SQt4MbpSjrIER2Zb+3C6xhXqMobh6F76AIhC3T1loSkc0o7kx/BrcfZsi4rBMok5Ykv83B2SddylKxJHh/TyW8bFAy85i4r2+Lssi2jB/dY0WMZIxbmqaxfzNFEnImAhUzURTpxt8egZhTP69ob4pOJev51T2lrmNnijBIzzgZ7c0F1knDn3Xp/HI2mnDsQRPyg4Mb6ON/m1lng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB8P189MB0901.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:16e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.2; Fri, 21 Aug
 2026 09:23:40 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.003; Fri, 21 Aug 2026
 09:23:40 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] systemd: Fix CVE-2026-29111
Date: Fri, 21 Aug 2026 11:23:39 +0200
Message-ID: <20260821092339.81341-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU6P191CA0012.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::12) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB8P189MB0901:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d20e7e6-c93b-463f-db80-08deff65e353
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|56012099006|13003099007|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	Lv1875R7JtLiMeJFEyLneR1wtugXBuoqjx9IsMNblUcBxvxrwo/lF/EKWZuqdyJxYAqK2TuKr+b3CihG7eBm9UyAslBFOA2nNfRhXd/XV52yqCnD3KGC6TaNWI7tziXWPkd/SvSMFAsblPoF72OrnPz+CbXjdImuuX5+OgsB8Bs6TDstK5S1JEmJ1bXLZVh94vMyQWKcxQ0WoUaaflIDi/RXioK6g6Zx/rOz7xgLWZevKy9UEtIr4zfEFdcW1gfmRm88wTtXrviL1eKc63yk/yZmWIxqrNPqxN0PzZHjQR9zCTmGKeTWOiclw0zuAd5zPz4Kbtw/ZlW1wDV2YPRGJRmosyoe2f9ak9Bab2X1/4U+NGGuIJFq4LCOW/2uOLPd52xCVLl9WoBoQGVWy4fplOgyVnmEXhaY+LRDBrbjVi6XLwX4RZTgsLoXjQ5LXJlSCL8VBpSG5+Ka1uOkmglN+tUKl9/QPHYr8KwhjqOQx2epIUZO5c+PpbERWHBVGozjfvqp8yjtj0yjPWsubkJKAixutwlDQNMnAYfaMmemSXflnKbih/6vu2nDojGKhmBXMCpNnDuf4Frkkbxhn1dpmgVMtwQ29VemohsTDvqnDgJxHdnSUANRBzbgq2svd0YuzgkiXkTWkG3XVXZTlgfhQbA3d3xG16KUW0yowav63iQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(56012099006)(13003099007)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?t4K1UXlvVD7k3m18wgvFbySM9E3Ql0EoAlvQ+dSFEy/rkVQ7pbmVuUwKDt69?=
 =?us-ascii?Q?rm3+QKiF7esREKN068rerLVOnEwC+/Ls9r567K3tF2+Hxj49WgOHB3L4E7wM?=
 =?us-ascii?Q?Zsz97mmzqoDg+7W+RlF/FLIvPM4sP5nx8bP4PNv+JPjDFzFhrDWahshxervZ?=
 =?us-ascii?Q?K/cs5UOXkYXwRgcgQd7ihVxbeMnllvTy75YPBhJ2hgGgbOxwMhtZEbXay/UI?=
 =?us-ascii?Q?hXflsNUz9mZbu9ZJuzOFMwnGhqmIHRSislHfuj/7/YabSuxcrLjImi/w3Mex?=
 =?us-ascii?Q?V07XDfBm+0rcQ8KAPRNAEcgrsXM+dfbgYuzllmTgC1HEi0iF5MsCF3Oxt4dN?=
 =?us-ascii?Q?bU3pp+x/aVAFLHNA8pxyBAAMM7p2csHZ/nLOP2eEzmYP4rM7/EkT2E1yKQ+H?=
 =?us-ascii?Q?6GtBPYr1zKBXOYXedsN5L/M+BSI3/b7fbyQmIAd/YmhG+O30eyTdrRbjL5Xq?=
 =?us-ascii?Q?gditMT0xVGgMILWU08H4ATNRrKu1rpFmz7U/bUVK5ATc0qrENFKuDKFVMeOi?=
 =?us-ascii?Q?BMf87fd3zUNZutK/is8UHV+ahlbY23zz7hARH5b+HBqCs3kOkhaEOZ0OSTtl?=
 =?us-ascii?Q?P3v+FwNLKSSnBePiPeunn46OfdAI+Uw/0Sj6cR3XIALN5i5iLdcx095EJkeU?=
 =?us-ascii?Q?NCNAi+9Zhum+2b1xIaxMiJfbhdYUxmbInYpij0DI4CvO0F/e5P+rThwtOuyy?=
 =?us-ascii?Q?FYpa/SoYVX7b0FSxX9noWwFmuBNcRpdM8yMCZb+Pj+cQu7AJViGfqnCs4raF?=
 =?us-ascii?Q?dBlSJj4GH56Z2+FX36eplcbc1MRvZWmcUff2VheAsE+COCgoDG857ah8wO/h?=
 =?us-ascii?Q?f33CXwFJZZxZ3fIUEhcCV7HAEfF0zv6Q4mE4W+2iw1ccN/D/Yp/OrbdWqLP4?=
 =?us-ascii?Q?YpYgGlD/6SmwXJH0sioUZMfZwMBNwzc8F+IiHPUIBGfklH17HOFoVc6TdmiT?=
 =?us-ascii?Q?iGA3lPNs8I9xgAE/hug098UdF1wZq/tpDW6EpOlSE81ncuo26FevjTst/hNN?=
 =?us-ascii?Q?ln3+LDFeWLmlQx4eU+lnKPJR9QwimlfJPrk6AoKZimtn9Yamql1PJAvA9APi?=
 =?us-ascii?Q?8OMTsvC+oAtgUuG7zOMzqFP0qTa+bBWFfaGIMMn2bBhfa+iEaB3Npk8u8urI?=
 =?us-ascii?Q?QuIi7lmHwYBowQKxmOpChs+aneugGfKHL23kggdbJL5WLf5DmQ15nQtalOLm?=
 =?us-ascii?Q?eHk7pyMwkKdrgy+u3DoL64YK5IzB4JBxw252iLwjAKQI64VZt1I5tVd06nFq?=
 =?us-ascii?Q?aZFV/UzFpCv4FkrVxq/OOiK+6mgl0Minsd4ANRsBzKS50nZplJXYEXfRvMCE?=
 =?us-ascii?Q?6mByjllqlimErTntG29KqDRnCtP7dxamGuBAYLiD/j8NI0qv/EFnWTwavcze?=
 =?us-ascii?Q?y8IGPaw2AvE1bAO1toHTPAQtQ7ks3KqrCzEte8oXC3tg6CPoI8Ew1bGTzdPR?=
 =?us-ascii?Q?q/l0c4zDInzAMTmbkZY0KEB1Mngrd/Wzoc3GxeJMwPjQlSZHdm5q551ROO4F?=
 =?us-ascii?Q?D56AHdERKO+LJzwWkPhTeahltgttXLNTsPIsW2SAn4dC0kqNvE/lyS7a+FMh?=
 =?us-ascii?Q?Hmg3VaYTmggKZCDy4LM1x5i5Mi7i3zLXcq/PKEjoGy7KmDGZdgesSPyVYNLy?=
 =?us-ascii?Q?T+vmiKcaJk2ztOtEPXVfrx3nIFDBqdxqx/30Hc8Ng1pphe38GF1r5ezy5Tq7?=
 =?us-ascii?Q?ISaDJ+hJQ5srxylvH4DgVeFGFl2f5k0h8enKleGIcVO8sg2Usn06qTsS1aAy?=
 =?us-ascii?Q?hGAONTF//nvtY1cU6AQ39CZ9DZyUOpQ=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d20e7e6-c93b-463f-db80-08deff65e353
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 09:23:40.5579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MiZm9MhFNJaLBcU7Csj7m5V5T8jRbKUzA0l0VVDC7nwpXNaq3YocFSNNR3yR7F2UVXAKSANTTw+LeEri/yge9DnxRoogGHFezFprsCj3M3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0901
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 09:23:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243916

Backport patches from upstream systemd to fix CVE-2026-29111, where
systemd (as PID 1) hits an assert and freezes execution when an
unprivileged IPC API call is made with spurious data.

Pick patches from [1], [2], [3] and [4] as referenced in [5].

Note: As scarthgap is using 255 version picked fixes from 257

[1] https://github.com/systemd/systemd/commit/20021e7686426052e3a7505425d7e=
12085feb2a6
[2] https://github.com/systemd/systemd/commit/7ac3220213690e8a8d6d2a6e81e43=
bd1dce01d69
[3] https://github.com/systemd/systemd/commit/21167006574d6b83813c7596759b4=
74f56562412
[4] https://github.com/systemd/systemd/commit/54588d2dedff54bfb603667082065=
0e4ea74628f
[5] https://security-tracker.debian.org/tracker/CVE-2026-29111

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../systemd/systemd/CVE-2026-29111-01.patch   | 170 ++++++++++++++++++
 .../systemd/systemd/CVE-2026-29111-02.patch   |  85 +++++++++
 .../systemd/systemd/CVE-2026-29111-03.patch   | 106 +++++++++++
 .../systemd/systemd/CVE-2026-29111-04.patch   |  35 ++++
 meta/recipes-core/systemd/systemd_255.21.bb   |   4 +
 5 files changed, 400 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-29111-01.pat=
ch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-29111-02.pat=
ch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-29111-03.pat=
ch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-29111-04.pat=
ch

diff --git a/meta/recipes-core/systemd/systemd/CVE-2026-29111-01.patch b/me=
ta/recipes-core/systemd/systemd/CVE-2026-29111-01.patch
new file mode 100644
index 0000000000..4f6ef76aa9
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2026-29111-01.patch
@@ -0,0 +1,170 @@
+From 284fd279f9e9c199982aea51aee59a02e90a2eda Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Mon, 19 May 2025 12:58:52 +0200
+Subject: [PATCH 1/4] path-util: add flavour of path_startswith() that leav=
es a
+ leading slash in place
+
+(cherry picked from commit ee19edbb9f3455db3f750089082f3e5a925e3a0c)
+
+Note: The test uses assert_se(streq_ptr()) instead of the upstream
+ASSERT_STREQ() macro because ASSERT_STREQ was introduced in systemd v256
+and is not available in v255.
+
+CVE: CVE-2026-29111
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/20021=
e7686426052e3a7505425d7e12085feb2a6]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/basic/fs-util.c       |  2 +-
+ src/basic/mkdir.c         |  2 +-
+ src/basic/path-util.c     | 39 ++++++++++++++++++++++++++++-----------
+ src/basic/path-util.h     | 10 ++++++++--
+ src/test/test-path-util.c | 16 ++++++++++++++++
+ 5 files changed, 54 insertions(+), 15 deletions(-)
+
+diff --git a/src/basic/fs-util.c b/src/basic/fs-util.c
+index 5bc7d2f95b..4633a5cd72 100644
+--- a/src/basic/fs-util.c
++++ b/src/basic/fs-util.c
+@@ -65,7 +65,7 @@ int rmdir_parents(const char *path, const char *stop) {
+                 assert(*slash =3D=3D '/');
+                 *slash =3D '\0';
+=20
+-                if (path_startswith_full(stop, p, /* accept_dot_dot=3D */=
 false))
++                if (path_startswith_full(stop, p, /* flags=3D */ 0))
+                         return 0;
+=20
+                 if (rmdir(p) < 0 && errno !=3D ENOENT)
+diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
+index c770e5ed32..7bc73361a5 100644
+--- a/src/basic/mkdir.c
++++ b/src/basic/mkdir.c
+@@ -155,7 +155,7 @@ int mkdir_parents_internal(const char *prefix, const c=
har *path, mode_t mode, ui
+         assert(_mkdirat !=3D mkdirat);
+=20
+         if (prefix) {
+-                p =3D path_startswith_full(path, prefix, /* accept_dot_do=
t=3D */ false);
++                p =3D path_startswith_full(path, prefix, /* flags=3D */ 0=
);
+                 if (!p)
+                         return -ENOTDIR;
+         } else
+diff --git a/src/basic/path-util.c b/src/basic/path-util.c
+index 6810bf66aa..e73f5d708e 100644
+--- a/src/basic/path-util.c
++++ b/src/basic/path-util.c
+@@ -403,8 +403,8 @@ char* path_simplify_full(char *path, PathSimplifyFlags=
 flags) {
+         return path;
+ }
+=20
+-char* path_startswith_full(const char *path, const char *prefix, bool acc=
ept_dot_dot) {
+-        assert(path);
++char* path_startswith_full(const char *original_path, const char *prefix,=
 PathStartWithFlags flags) {
++        assert(original_path);
+         assert(prefix);
+=20
+         /* Returns a pointer to the start of the first component after th=
e parts matched by
+@@ -417,28 +417,45 @@ char* path_startswith_full(const char *path, const c=
har *prefix, bool accept_dot
+          * Returns NULL otherwise.
+          */
+=20
++        const char *path =3D original_path;
++
+         if ((path[0] =3D=3D '/') !=3D (prefix[0] =3D=3D '/'))
+                 return NULL;
+=20
+         for (;;) {
+                 const char *p, *q;
+-                int r, k;
++                int m, n;
+=20
+-                r =3D path_find_first_component(&path, accept_dot_dot, &p=
);
+-                if (r < 0)
++                m =3D path_find_first_component(&path, FLAGS_SET(flags, P=
ATH_STARTSWITH_ACCEPT_DOT_DOT), &p);
++                if (m < 0)
+                         return NULL;
+=20
+-                k =3D path_find_first_component(&prefix, accept_dot_dot, =
&q);
+-                if (k < 0)
++                n =3D path_find_first_component(&prefix, FLAGS_SET(flags,=
 PATH_STARTSWITH_ACCEPT_DOT_DOT), &q);
++                if (n < 0)
+                         return NULL;
+=20
+-                if (k =3D=3D 0)
+-                        return (char*) (p ?: path);
++                if (n =3D=3D 0) {
++                        if (!p)
++                                p =3D path;
++
++                        if (FLAGS_SET(flags, PATH_STARTSWITH_RETURN_LEADI=
NG_SLASH)) {
++
++                                if (p <=3D original_path)
++                                        return NULL;
++
++                                p--;
++
++                                if (*p !=3D '/')
++                                        return NULL;
++                        }
++
++                        return (char*) p;
++                }
+=20
+-                if (r !=3D k)
++                if (m !=3D n)
+                         return NULL;
+=20
+-                if (!strneq(p, q, r))
++                if (!strneq(p, q, m))
+                         return NULL;
+         }
+ }
+diff --git a/src/basic/path-util.h b/src/basic/path-util.h
+index 6d943e967f..e0ec05f4db 100644
+--- a/src/basic/path-util.h
++++ b/src/basic/path-util.h
+@@ -53,9 +53,15 @@ int safe_getcwd(char **ret);
+ int path_make_absolute_cwd(const char *p, char **ret);
+ int path_make_relative(const char *from, const char *to, char **ret);
+ int path_make_relative_parent(const char *from_child, const char *to, cha=
r **ret);
+-char* path_startswith_full(const char *path, const char *prefix, bool acc=
ept_dot_dot) _pure_;
++
++typedef enum PathStartWithFlags {
++        PATH_STARTSWITH_ACCEPT_DOT_DOT       =3D 1U << 0,
++        PATH_STARTSWITH_RETURN_LEADING_SLASH =3D 1U << 1,
++} PathStartWithFlags;
++
++char* path_startswith_full(const char *path, const char *prefix, PathStar=
tWithFlags flags) _pure_;
+ static inline char* path_startswith(const char *path, const char *prefix)=
 {
+-        return path_startswith_full(path, prefix, true);
++        return path_startswith_full(path, prefix, PATH_STARTSWITH_ACCEPT_=
DOT_DOT);
+ }
+=20
+ int path_compare(const char *a, const char *b) _pure_;
+diff --git a/src/test/test-path-util.c b/src/test/test-path-util.c
+index f5a425689a..71056b08c1 100644
+--- a/src/test/test-path-util.c
++++ b/src/test/test-path-util.c
+@@ -754,6 +754,22 @@ TEST(path_startswith) {
+         test_path_startswith_one("/foo/bar/barfoo/", "/fo", NULL, NULL);
+ }
+=20
++static void test_path_startswith_return_leading_slash_one(const char *pat=
h, const char *prefix, const char *expected) {
++        const char *p;
++
++        log_debug("/* %s(%s, %s) */", __func__, path, prefix);
++
++        p =3D path_startswith_full(path, prefix, PATH_STARTSWITH_RETURN_L=
EADING_SLASH);
++        assert_se(streq_ptr(p, expected));
++}
++
++TEST(path_startswith_return_leading_slash) {
++        test_path_startswith_return_leading_slash_one("/foo/bar", "/", "/=
foo/bar");
++        test_path_startswith_return_leading_slash_one("/foo/bar", "/foo",=
 "/bar");
++        test_path_startswith_return_leading_slash_one("/foo/bar", "/foo/b=
ar", NULL);
++        test_path_startswith_return_leading_slash_one("/foo/bar/", "/foo/=
bar", "/");
++}
++
+ static void test_prefix_root_one(const char *r, const char *p, const char=
 *expected) {
+         _cleanup_free_ char *s =3D NULL;
+         const char *t;
+--=20
+2.43.0
diff --git a/meta/recipes-core/systemd/systemd/CVE-2026-29111-02.patch b/me=
ta/recipes-core/systemd/systemd/CVE-2026-29111-02.patch
new file mode 100644
index 0000000000..9ab94000e6
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2026-29111-02.patch
@@ -0,0 +1,85 @@
+From ed86ee8a7cc82fe1c68e3fb17be71c9c8e62ca87 Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Fri, 23 May 2025 06:45:40 +0200
+Subject: [PATCH 2/4] path-util: invert PATH_STARTSWITH_ACCEPT_DOT_DOT flag
+
+As requested: https://github.com/systemd/systemd/pull/37572#pullrequestrev=
iew-2861928094
+
+(cherry picked from commit ceed11e465f1c8efff1931412a85924d9de7c08d)
+
+CVE: CVE-2026-29111
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/7ac32=
20213690e8a8d6d2a6e81e43bd1dce01d69]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/basic/fs-util.c   | 2 +-
+ src/basic/mkdir.c     | 2 +-
+ src/basic/path-util.c | 4 ++--
+ src/basic/path-util.h | 4 ++--
+ 4 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/basic/fs-util.c b/src/basic/fs-util.c
+index 4633a5cd72..21cd6ddcde 100644
+--- a/src/basic/fs-util.c
++++ b/src/basic/fs-util.c
+@@ -65,7 +65,7 @@ int rmdir_parents(const char *path, const char *stop) {
+                 assert(*slash =3D=3D '/');
+                 *slash =3D '\0';
+=20
+-                if (path_startswith_full(stop, p, /* flags=3D */ 0))
++                if (path_startswith_full(stop, p, PATH_STARTSWITH_REFUSE_=
DOT_DOT))
+                         return 0;
+=20
+                 if (rmdir(p) < 0 && errno !=3D ENOENT)
+diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
+index 7bc73361a5..8f14c47214 100644
+--- a/src/basic/mkdir.c
++++ b/src/basic/mkdir.c
+@@ -155,7 +155,7 @@ int mkdir_parents_internal(const char *prefix, const c=
har *path, mode_t mode, ui
+         assert(_mkdirat !=3D mkdirat);
+=20
+         if (prefix) {
+-                p =3D path_startswith_full(path, prefix, /* flags=3D */ 0=
);
++                p =3D path_startswith_full(path, prefix, PATH_STARTSWITH_=
REFUSE_DOT_DOT);
+                 if (!p)
+                         return -ENOTDIR;
+         } else
+diff --git a/src/basic/path-util.c b/src/basic/path-util.c
+index e73f5d708e..a65a5c32f6 100644
+--- a/src/basic/path-util.c
++++ b/src/basic/path-util.c
+@@ -426,11 +426,11 @@ char* path_startswith_full(const char *original_path=
, const char *prefix, PathSt
+                 const char *p, *q;
+                 int m, n;
+=20
+-                m =3D path_find_first_component(&path, FLAGS_SET(flags, P=
ATH_STARTSWITH_ACCEPT_DOT_DOT), &p);
++                m =3D path_find_first_component(&path, !FLAGS_SET(flags, =
PATH_STARTSWITH_REFUSE_DOT_DOT), &p);
+                 if (m < 0)
+                         return NULL;
+=20
+-                n =3D path_find_first_component(&prefix, FLAGS_SET(flags,=
 PATH_STARTSWITH_ACCEPT_DOT_DOT), &q);
++                n =3D path_find_first_component(&prefix, !FLAGS_SET(flags=
, PATH_STARTSWITH_REFUSE_DOT_DOT), &q);
+                 if (n < 0)
+                         return NULL;
+=20
+diff --git a/src/basic/path-util.h b/src/basic/path-util.h
+index e0ec05f4db..11a1078df9 100644
+--- a/src/basic/path-util.h
++++ b/src/basic/path-util.h
+@@ -55,13 +55,13 @@ int path_make_relative(const char *from, const char *t=
o, char **ret);
+ int path_make_relative_parent(const char *from_child, const char *to, cha=
r **ret);
+=20
+ typedef enum PathStartWithFlags {
+-        PATH_STARTSWITH_ACCEPT_DOT_DOT       =3D 1U << 0,
++        PATH_STARTSWITH_REFUSE_DOT_DOT       =3D 1U << 0,
+         PATH_STARTSWITH_RETURN_LEADING_SLASH =3D 1U << 1,
+ } PathStartWithFlags;
+=20
+ char* path_startswith_full(const char *path, const char *prefix, PathStar=
tWithFlags flags) _pure_;
+ static inline char* path_startswith(const char *path, const char *prefix)=
 {
+-        return path_startswith_full(path, prefix, PATH_STARTSWITH_ACCEPT_=
DOT_DOT);
++        return path_startswith_full(path, prefix, 0);
+ }
+=20
+ int path_compare(const char *a, const char *b) _pure_;
+--=20
+2.43.0
diff --git a/meta/recipes-core/systemd/systemd/CVE-2026-29111-03.patch b/me=
ta/recipes-core/systemd/systemd/CVE-2026-29111-03.patch
new file mode 100644
index 0000000000..8b9b4d4075
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2026-29111-03.patch
@@ -0,0 +1,106 @@
+From 7a1749753b4853866f90ef25d48192e4d1563543 Mon Sep 17 00:00:00 2001
+From: Mike Yuan <me@yhndnzj.com>
+Date: Thu, 26 Feb 2026 11:06:00 +0100
+Subject: [PATCH 3/4] core/cgroup: avoid one unnecessary strjoina()
+
+(cherry picked from commit 42aee39107fbdd7db1ccd402a2151822b2805e9f)
+(cherry picked from commit 80acea4ef80a4bb78560ed970c34952299b890d6)
+(cherry picked from commit b5fd14693057e5f2c9b4a49603be64ec3608ff6c)
+
+Note: This backport uses u->cgroup_path directly instead of the upstream
+CGroupRuntime *crt / crt->cgroup_path pattern because the CGroupRuntime
+struct was introduced in systemd v256 (commit 1d9cc876). In v255, the
+cgroup_path is still a direct member of the Unit struct.
+
+CVE: CVE-2026-29111
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/21167=
006574d6b83813c7596759b474f56562412]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/core/cgroup.c | 27 +++++++++++++--------------
+ 1 file changed, 13 insertions(+), 14 deletions(-)
+
+diff --git a/src/core/cgroup.c b/src/core/cgroup.c
+index d398655b0a..e5e7f032c2 100644
+--- a/src/core/cgroup.c
++++ b/src/core/cgroup.c
+@@ -2568,12 +2568,13 @@ static int unit_update_cgroup(
+         return 0;
+ }
+=20
+-static int unit_attach_pid_to_cgroup_via_bus(Unit *u, pid_t pid, const ch=
ar *suffix_path) {
++static int unit_attach_pid_to_cgroup_via_bus(Unit *u, const char *cgroup_=
path, pid_t pid) {
+         _cleanup_(sd_bus_error_free) sd_bus_error error =3D SD_BUS_ERROR_=
NULL;
+-        char *pp;
+         int r;
+=20
+         assert(u);
++        assert(cgroup_path);
++        assert(pid_is_valid(pid));
+=20
+         if (MANAGER_IS_SYSTEM(u->manager))
+                 return -EINVAL;
+@@ -2581,17 +2582,13 @@ static int unit_attach_pid_to_cgroup_via_bus(Unit =
*u, pid_t pid, const char *suf
+         if (!u->manager->system_bus)
+                 return -EIO;
+=20
+-        if (!u->cgroup_path)
+-                return -EINVAL;
+-
+         /* Determine this unit's cgroup path relative to our cgroup root =
*/
+-        pp =3D path_startswith(u->cgroup_path, u->manager->cgroup_root);
++        const char *pp =3D path_startswith_full(cgroup_path,
++                                              u->manager->cgroup_root,
++                                              PATH_STARTSWITH_RETURN_LEAD=
ING_SLASH|PATH_STARTSWITH_REFUSE_DOT_DOT);
+         if (!pp)
+                 return -EINVAL;
+=20
+-        pp =3D strjoina("/", pp, suffix_path);
+-        path_simplify(pp);
+-
+         r =3D bus_call_method(u->manager->system_bus,
+                             bus_systemd_mgr,
+                             "AttachProcessesToUnit",
+@@ -2630,8 +2627,10 @@ int unit_attach_pids_to_cgroup(Unit *u, Set *pids, =
const char *suffix_path) {
+                 return r;
+=20
+         if (isempty(suffix_path))
+-                p =3D u->cgroup_path;
++                p =3D empty_to_root(u->cgroup_path);
+         else {
++                assert(path_is_absolute(suffix_path));
++
+                 joined =3D path_join(u->cgroup_path, suffix_path);
+                 if (!joined)
+                         return -ENOMEM;
+@@ -2649,7 +2648,7 @@ int unit_attach_pids_to_cgroup(Unit *u, Set *pids, c=
onst char *suffix_path) {
+                  * before we use it */
+                 r =3D pidref_verify(pid);
+                 if (r < 0) {
+-                        log_unit_info_errno(u, r, "PID " PID_FMT " vanish=
ed before we could move it to target cgroup '%s', skipping: %m", pid->pid, =
empty_to_root(p));
++                        log_unit_info_errno(u, r, "PID " PID_FMT " vanish=
ed before we could move it to target cgroup '%s', skipping: %m", pid->pid, =
p);
+                         continue;
+                 }
+=20
+@@ -2660,7 +2659,7 @@ int unit_attach_pids_to_cgroup(Unit *u, Set *pids, c=
onst char *suffix_path) {
+=20
+                         log_unit_full_errno(u, again ? LOG_DEBUG : LOG_IN=
FO,  r,
+                                             "Couldn't move process "PID_F=
MT" to%s requested cgroup '%s': %m",
+-                                            pid->pid, again ? " directly"=
 : "", empty_to_root(p));
++                                            pid->pid, again ? " directly"=
 : "", p);
+=20
+                         if (again) {
+                                 int z;
+@@ -2670,9 +2669,9 @@ int unit_attach_pids_to_cgroup(Unit *u, Set *pids, c=
onst char *suffix_path) {
+                                  * Since it's more privileged it might be=
 able to move the process across the
+                                  * leaves of a subtree whose top node is =
not owned by us. */
+=20
+-                                z =3D unit_attach_pid_to_cgroup_via_bus(u=
, pid->pid, suffix_path);
++                                z =3D unit_attach_pid_to_cgroup_via_bus(u=
, p, pid->pid);
+                                 if (z < 0)
+-                                        log_unit_info_errno(u, z, "Couldn=
't move process "PID_FMT" to requested cgroup '%s' (directly or via the sys=
tem bus): %m", pid->pid, empty_to_root(p));
++                                        log_unit_info_errno(u, z, "Couldn=
't move process "PID_FMT" to requested cgroup '%s' (directly or via the sys=
tem bus): %m", pid->pid, p);
+                                 else {
+                                         if (ret >=3D 0)
+                                                 ret++; /* Count successfu=
l additions */
+--=20
+2.43.0
diff --git a/meta/recipes-core/systemd/systemd/CVE-2026-29111-04.patch b/me=
ta/recipes-core/systemd/systemd/CVE-2026-29111-04.patch
new file mode 100644
index 0000000000..ebf2ba9d5b
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2026-29111-04.patch
@@ -0,0 +1,35 @@
+From 0d2c41d0f024088a275ac0c02d50205c800dec8a Mon Sep 17 00:00:00 2001
+From: Mike Yuan <me@yhndnzj.com>
+Date: Thu, 26 Feb 2026 11:06:34 +0100
+Subject: [PATCH 4/4] core: validate input cgroup path more prudently
+
+(cherry picked from commit efa6ba2ab625aaa160ac435a09e6482fc63bdbe8)
+(cherry picked from commit 3cee294fe8cf4fa0eff933ab21416d099942cabd)
+(cherry picked from commit 1d22f706bd04f45f8422e17fbde3f56ece17758a)
+
+CVE: CVE-2026-29111
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/54588=
d2dedff54bfb6036670820650e4ea74628f]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/core/dbus-manager.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/core/dbus-manager.c b/src/core/dbus-manager.c
+index c7372ca033..cb84ba9866 100644
+--- a/src/core/dbus-manager.c
++++ b/src/core/dbus-manager.c
+@@ -646,6 +646,12 @@ static int method_get_unit_by_control_group(sd_bus_me=
ssage *message, void *userd
+         if (r < 0)
+                 return r;
+=20
++        if (!path_is_absolute(cgroup))
++                return sd_bus_error_setf(error, SD_BUS_ERROR_INVALID_ARGS=
, "Control group path is not absolute: %s", cgroup);
++
++        if (!path_is_normalized(cgroup))
++                return sd_bus_error_setf(error, SD_BUS_ERROR_INVALID_ARGS=
, "Control group path is not normalized: %s", cgroup);
++
+         u =3D manager_get_unit_by_cgroup(m, cgroup);
+         if (!u)
+                 return sd_bus_error_setf(error, BUS_ERROR_NO_SUCH_UNIT,
+--=20
+2.43.0
diff --git a/meta/recipes-core/systemd/systemd_255.21.bb b/meta/recipes-cor=
e/systemd/systemd_255.21.bb
index 9c5f8af240..e5a0fd9170 100644
--- a/meta/recipes-core/systemd/systemd_255.21.bb
+++ b/meta/recipes-core/systemd/systemd_255.21.bb
@@ -33,6 +33,10 @@ SRC_URI +=3D " \
            file://CVE-2026-40225-02.patch \
            file://CVE-2026-40226-01.patch \
            file://CVE-2026-40226-02.patch \
+           file://CVE-2026-29111-01.patch \
+           file://CVE-2026-29111-02.patch \
+           file://CVE-2026-29111-03.patch \
+           file://CVE-2026-29111-04.patch \
            "
=20
 # patches needed by musl

