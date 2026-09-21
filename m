Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85777C982E1
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 10:45:36 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46445.1789987530237440297
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 03:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Bsxq092m;
 spf=pass (domain: est.tech, ip: 40.107.130.30, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f2IC3eDnbpaXrHA8iWyUKGESwjXi7zdhQpaj1CZDjb8RAh1iX5C6Kgt/OyI4lgR0sv9EgzJDrDCReRUl3bmt9wH9VhnDOxNzKpXUekZBUxE30JrPVzPJfXPa1zmQOxvgfm76FMnnFXDqEYWYdC3BBPbsj8vSkDz6v2pcN3s1ftpBR+4mZmXuHqabYtX3Po+s2BfRAtCSiLIudgOKlISHLGQkSS35dtBH15va8QCy/1xruNxEOIbDf5I3xJE1awjeVsmsfbzDK9ZsOZauiUJoyEu0IYskIpi164r5RK9m8iPSZDJvsuJvHUV06vz5kLOdUjc2/UkqoSnaLwxwTb2u7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSdR2HBPbFNUddJbs3OWO1ZDvigWR0Pm7rvH3h6v3nc=;
 b=BL0wxDaVcM+a2jyRw48fM7CMo5k+aU6OM+BjK4S3xE0btibkVimbWVmLHSRlHhq+ivVlUfe7iP/Yy/+uA1tuplSgba227y/CQuVNvnnMbyEfMlXbijd1Po5hWqN444oH13o3TUoPTXG7hA4mjb/cQzOeWBX2sJQudsCF3FASwiN+7skrk3P2s2FiBHhyHQTJTTJV1f+BEHHTIUcekTcGwdNRdYMDZ4k1QP66JPgHC4PMTPbsoWdFUZMcEyLHL0PLVR7eepFHUbpqDaEwNrqOYgy+HEk+EwV6JjxzFZSTOWiU4jzZYjl8nQMRIr6SPo1qmHKsNPR9gcHbuIXFH/EEMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSdR2HBPbFNUddJbs3OWO1ZDvigWR0Pm7rvH3h6v3nc=;
 b=Bsxq092mFbB84jWanaMNN5VUIhuBO6GkxHdJHI4iQtHbm+AWBAMQUtOPfO6Av3lCvw2HQDCaeDQmsKDRcG6fuXw6ayvdFHSBPSJ9H5LquxvUIIh+0gdeP1ZdMTy6rwpW81RtgppAvtCp7CrWex8U0TW4hKiLnbJxgnzCndfZymNEUgAQwTyTXgVNTgR4bmtXap2iFj6AHUmkUHzTlmzof28giByxmiaM4wNnbdPtmEDAgHfEwFxGJAlYJZqaYNETNaEgi3TDfbqM32LuEuNVKFaBLuV1KuEYq4EfxknCGElXGr6OUeHTaYvoKCAK0EY5UGtmXG+t1d7aRogCcDBEhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA1P189MB3532.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:506::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 10:45:27 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0428.014; Mon, 21 Sep 2026
 10:45:27 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] nfs-utils: upgrade 2.9.2 -> 3.1.1
Date: Mon, 21 Sep 2026 12:45:20 +0200
Message-ID: <20260921104520.47933-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260921104520.47933-1-jaipaul.cheernam@est.tech>
References: <20260921104520.47933-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0032.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::7) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA1P189MB3532:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e4bc9c2-d561-4e95-1ba9-08df17cd72b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	tMQPtY6+azYRKDQD6Yq2/HyvfthXCw7p7rtaQ5cahbJBtv6Pj/trSo+r4wrAtNCSt8t3qKLRovPQR/BpfZ/ND715lPstdGSY49BT3pFXWd8ArybkX62bWOYyLizs8kQ8Iu/hJWAIkUXXr+167XP7EWbszRVuKHsSXn0KQ+CznzC0JEuKffVkumR5KOrRYPELfdcsgbjBYjzvvopxbw2/anrstBHfCnE6pIgdNR2UjrYNWItRE7/ZQkQLRQmVYha2i12BBHsK7RIXBgZI8ucFG2T1TjVJwGXy1v6OGWvZ+iK+M3YUflFdIJ06C2YRdwehDbevcBiHiLmjNVLjCC+5MlkX850Ekzwkf/0JH6xRFnj+jL8lbhIASQyRKXNEy6mnr0rrxCBQpgx4J0wDv1OkGMnv1/ul3ZDZSvTJGwPb2scfKpGBXOTRX0kxHmvA9jv/V4GyigIHTjxaP6nJKTPg5SRTPYIJWohsmG+8YxvCkVzV2wXl/FwX6u7D8xqBaYe35IiOBmHaizkXmBRsE3yDZwJhiyoh7e4WPii7S1qbwJpF99tqinUmQx98SUQJCK0prQ8hnGZXokm11l+zLyNpCbUft0PzNcQcIRs4MnTSlejmeUEmTG2zynlLr4xUy1rz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tp+JlPRgDfrqPG9N+TSDKY+Pqgyg0OirqSWFp0fjS7ieHKuvTbTA3kx8dORn?=
 =?us-ascii?Q?lS3Kn+OcXpgwmeDKr7jEICm+6bklywtCHgNw9E7LWGlP5VRPiZ8HQvBpBkAv?=
 =?us-ascii?Q?P7cv59NsErKMK83vzr5rWbQprHb5Y79uKbVwVOxxV09b2IxO6dV2K30Yo9/o?=
 =?us-ascii?Q?nV/aFaJe4F0mx6eWqi5MyQuLh8dfATbeh0//wNmoAPB1CUKypp2ciwfOw/XF?=
 =?us-ascii?Q?/R6O19t/uxsLp/BwQaQJRWqLPjxud8nuJFVyeHfmWDeG03DfB/FLH66aAADW?=
 =?us-ascii?Q?oJRYHDEW7Tajmh65fhfE5a0cNDIHV9eotKbznGzSmrWY3/OSgNa128VxUaPu?=
 =?us-ascii?Q?ZtkgmkA8VuZtzA2L/9/6qvorkwgNhB5SwqDiMxcNXqsUVRMqZbogMZSm4uF7?=
 =?us-ascii?Q?cpv15eq/cx3rc9AMuAEvQYTbM+pm0NdznHkVZvDp3YsWNhJ7l1q5UxFNeG1X?=
 =?us-ascii?Q?UuQ50qLzQMbHN82ab0f9yupN0hXh/yREWx8+rkm7PPFWTLq/nKe5vbPgBwLK?=
 =?us-ascii?Q?6VzqdWI7uW8/TLl1atTRVe28PAOPTJSNCjTr82gYXjEswqLaDa8oLwiH/w+N?=
 =?us-ascii?Q?+B32hrJJk59eprWZ2/1rP2kZJVeBQcOfX9c0/ZiLm+6IkoJ/Cf2FQOfqBg4D?=
 =?us-ascii?Q?rOZdV8gnwq/ZhNxWelCg8DFZaUgkp5dJvHx35W/dFDXe751IN93kEfnM3a15?=
 =?us-ascii?Q?vzU2W2IW6xbUY1/sacKU1GA4P8EhEq79I/DSlemGdvbtaYC540U8U7YaCOAq?=
 =?us-ascii?Q?l1XSQ1LhlCN8Ikjxtswm5FH0kGHnuXeaykmC+/uqagV9bwXnbrvCLUGfV0bc?=
 =?us-ascii?Q?gD4k0fhreTCazpHm4mU6IM3ZQhlGTAWR/6G5ZbCG6cogO9XCCI9PAoZ+c5Cu?=
 =?us-ascii?Q?SFK47q6ROo7wG3gGaKuvhIQTvml7hLUs9CXSEnd+3BDqpeywkhFqkH564JqB?=
 =?us-ascii?Q?JU1t3tUHjU/jCc0L5Qvqa2VMfCaxVK/gIjCHjiOgoK80NZdajlqdkT86eOqb?=
 =?us-ascii?Q?YcS7mG5YyZvI1YbHIzPHxumLV03cdBng53iDdL9yjcVSEVbfNN1nzCX4K0pt?=
 =?us-ascii?Q?pG3PTMmApTGCHA2zytecwzQT1jEAwFUhWPpjZywci7cJFsUaLenfFRgRvhLN?=
 =?us-ascii?Q?g2F4MdgXvuav4R02eAljfooJCHyxUU/eEaSUWBp5ZRIIbeDoVBl6COoLFicD?=
 =?us-ascii?Q?re6Un97nmyXS2X6qUTiax1MmfOu9xcp1nUmavlrJGhqduLusViH5PIt3vvG0?=
 =?us-ascii?Q?XUJYhVxaKk/f3qSzCgGZCTVqEPL9kb36rCQVdkD9oP5AkIZqhPQQ/mX3weLH?=
 =?us-ascii?Q?qG/8bsvoS78yaq9Y0QUEqOVaCTXwp5/b/tcG7kXhgBQ6AEEmx+6IXQMwYyy9?=
 =?us-ascii?Q?VBIqy70WqSm5oDCvkR1ulswaJNHBMn0ev+/Ql+hvEj4Xexln/KGhZ8fMDm/i?=
 =?us-ascii?Q?oTNvT8mU0WpHDq/Gs6JMQkgeAPpzOQjUf71dH49GF1TkLn9J5+U++OvqAfSB?=
 =?us-ascii?Q?z6stXKZrDcy4uZTh+UiQr2pN5W2rxya0n6idy2ZDsdk2mHNFQCJDSZ+1xwVM?=
 =?us-ascii?Q?fnl+jvA3KpmQ4eeSsZRYooV7eRtWjxNF7e0fg76wl0R2/s1dS5ElklZ9zB0v?=
 =?us-ascii?Q?cqnvKeqbd/GBoNgDh7X32EWA7xJVoz9tsON3qy5LkoO7ne6tbkkZx9kXDfH1?=
 =?us-ascii?Q?mM4rmlnBuR93OspHZgbwOGx4SyjXhwihHnoJwdpLk2tk6VmE1v155hf7QdE9?=
 =?us-ascii?Q?RnVUM/GDJQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e4bc9c2-d561-4e95-1ba9-08df17cd72b4
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:45:27.1311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9zA6BL60OQXjJjsahFamuE1c+UYAWNK3CvRe9Ior5ZIhUspOMu9BeRpeGvHM6DZO5XYhctgqR4TFjpqYc4b7saINhMqong964KscLbFSUKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3532
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 10:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246324

ChangeLog: https://www.kernel.org/pub/linux/utils/nfs-utils/3.1.1/3.1.1-Cha=
ngelog

Drop two local patches now merged upstream:
 - 0001-getport-fix-missing-stddef.h-inclusion.patch
 - 0006-configure.ac-gate-HAVE_NFSD_NETLINK-on-enable-nfsdct.patch
   (upstream now gates HAVE_NFSD_NETLINK on --enable-nfsdctl)

Refresh the remaining local patches (0004, 0005) against the new source.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...tport-fix-missing-stddef.h-inclusion.patch | 27 -----------
 .../0004-Use-nogroup-for-nobody-group.patch   |  4 +-
 .../0005-find-OE-provided-Kerberos.patch      |  2 +-
 ...e-HAVE_NFSD_NETLINK-on-enable-nfsdct.patch | 47 -------------------
 ...{nfs-utils_2.9.2.bb =3D> nfs-utils_3.1.1.bb} |  4 +-
 5 files changed, 4 insertions(+), 80 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-getp=
ort-fix-missing-stddef.h-inclusion.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0006-conf=
igure.ac-gate-HAVE_NFSD_NETLINK-on-enable-nfsdct.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.9.2.bb =3D> nfs-ut=
ils_3.1.1.bb} (96%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-getport-fix=
-missing-stddef.h-inclusion.patch b/meta/recipes-connectivity/nfs-utils/nfs=
-utils/0001-getport-fix-missing-stddef.h-inclusion.patch
deleted file mode 100644
index 1683e9692b5..00000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-getport-fix-missin=
g-stddef.h-inclusion.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-Date: Thu, 6 Aug 2026 10:55:00 +0000
-Subject: [PATCH] getport: fix missing stddef.h inclusion
-
-getport.c uses offsetof() but does not include <stddef.h>. On glibc
-this works because offsetof is pulled in transitively, but on musl it
-is not available without the explicit include, causing:
-
-  getport.c:459:41: error: implicit declaration of function 'offsetof'
-
-Upstream-Status: Submitted [https://lore.kernel.org/linux-nfs/202608061120=
23.25090-1-jaipaul.cheernam@est.tech/]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- support/nfs/getport.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/support/nfs/getport.c b/support/nfs/getport.c
---- a/support/nfs/getport.c
-+++ b/support/nfs/getport.c
-@@ -27,6 +27,7 @@
- #include <config.h>
- #endif
-=20
-+#include <stddef.h>
- #include <sys/types.h>
- #include <sys/time.h>
- #include <unistd.h>
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup=
-for-nobody-group.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/000=
4-Use-nogroup-for-nobody-group.patch
index 7e63cb62826..1bc3fc832be 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-no=
body-group.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-no=
body-group.patch
@@ -1,4 +1,4 @@
-From 5f4739475f3c01145174734ed8a3b31b3da99b77 Mon Sep 17 00:00:00 2001
+From f8407c33b26641c08ad76422ba2ff78214364b19 Mon Sep 17 00:00:00 2001
 From: Daniel McGregor <daniel.mcgregor@vecima.com>
 Date: Tue, 6 Jun 2023 16:07:53 -0600
 Subject: [PATCH] Use "nogroup" for nobody group
@@ -24,7 +24,7 @@ index 2a2f79a..e6f3724 100644
  [Translation]
 =20
 diff --git a/utils/idmapd/idmapd.c b/utils/idmapd/idmapd.c
-index 5231f56..e1aa8a5 100644
+index c41ae1f..7339a88 100644
 --- a/utils/idmapd/idmapd.c
 +++ b/utils/idmapd/idmapd.c
 @@ -89,7 +89,7 @@
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-pro=
vided-Kerberos.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-f=
ind-OE-provided-Kerberos.patch
index bb152c2754b..e88608bd376 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-K=
erberos.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-K=
erberos.patch
@@ -1,4 +1,4 @@
-From a1759d9079a436096be5ce44622a3a5a85ec9faa Mon Sep 17 00:00:00 2001
+From 43a992e7bb491fd6e7e50861c9eaf0c549e98293 Mon Sep 17 00:00:00 2001
 From: Daniel McGregor <daniel.mcgregor@vecima.com>
 Date: Wed, 8 Nov 2023 16:24:20 -0600
 Subject: [PATCH] find OE provided Kerberos
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0006-configure.a=
c-gate-HAVE_NFSD_NETLINK-on-enable-nfsdct.patch b/meta/recipes-connectivity=
/nfs-utils/nfs-utils/0006-configure.ac-gate-HAVE_NFSD_NETLINK-on-enable-nfs=
dct.patch
deleted file mode 100644
index d15ea1ac5dd..00000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0006-configure.ac-gate-=
HAVE_NFSD_NETLINK-on-enable-nfsdct.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-Date: Wed, 5 Aug 2026 06:55:00 +0000
-Subject: [PATCH] configure.ac: gate HAVE_NFSD_NETLINK on --enable-nfsdctl
-
-HAVE_NFSD_NETLINK is currently defined unconditionally, but the
-implementation of nfsd_nl_cmd_str() in support/nfs/nfsdnl.c is only
-compiled into libnfs when CONFIG_NFSDCTL is true (--enable-nfsdctl).
-
-This causes a link failure when building with --disable-nfsdctl:
-
-  ld: exportfs-exportfs.o: in function `unexportfs_parsed':
-  exportfs.c:491: undefined reference to `nfsd_nl_cmd_str'
-
-The callers (exportfs.c) guard their usage with #ifdef HAVE_NFSD_NETLINK,
-and nfsdnl.h provides a static inline stub returning -ENOSYS when the
-macro is not defined.  So the correct fix is to only define
-HAVE_NFSD_NETLINK when --enable-nfsdctl is in effect, keeping netlink
-support as an opt-in feature consistent with the CONFIG_NFSDCTL guard
-on nfsdnl.c.
-
-Upstream-Status: Submitted [https://lore.kernel.org/linux-nfs/9fec9f1b-1c1=
0-4a20-8282-dfc9addb4ee8@est.tech/T/#u]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
---- a/configure.ac
-+++ b/configure.ac
-@@ -256,8 +256,6 @@
- PKG_CHECK_MODULES(LIBNLGENL3, libnl-genl-3.0 >=3D 3.1)
-=20
- AC_CHECK_HEADERS(linux/nfsd_netlink.h)
--AC_DEFINE([HAVE_NFSD_NETLINK], 1,
--	  [Define to 1 if nfsd generic netlink support is available])
-=20
- # ensure the system netlink headers have the latest features
- AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[#include <linux/nfsd_netlink.h>]],
-@@ -279,6 +277,8 @@
- 	enable_nfsdctl=3D"yes")
- 	AM_CONDITIONAL(CONFIG_NFSDCTL, [test "$enable_nfsdctl" =3D "yes" ])
- 	if test "$enable_nfsdctl" =3D yes; then
-+		AC_DEFINE([HAVE_NFSD_NETLINK], 1,
-+			  [Define to 1 if nfsd generic netlink support is available])
- 		PKG_CHECK_MODULES(LIBREADLINE, readline)
- 	fi
-=20
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.2.bb b/meta/=
recipes-connectivity/nfs-utils/nfs-utils_3.1.1.bb
similarity index 96%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.2.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_3.1.1.bb
index c2017a14ef3..89a69ca72c1 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.2.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_3.1.1.bb
@@ -23,11 +23,9 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/nfs-utils/$=
{PV}/nfs-utils-${PV}.tar.x
            file://nfscommon \
            file://0004-Use-nogroup-for-nobody-group.patch \
            file://0005-find-OE-provided-Kerberos.patch \
-           file://0006-configure.ac-gate-HAVE_NFSD_NETLINK-on-enable-nfsdc=
t.patch \
-           file://0001-getport-fix-missing-stddef.h-inclusion.patch \
            "
=20
-SRC_URI[sha256sum] =3D "e1dd8a9c95af15492065942cc3b52b1339ffd586baa2280ed8=
6c9d3dc4097e8c"
+SRC_URI[sha256sum] =3D "7dbc05eb8b32828b322872b759a62cb3979cb4118f344dd861=
6813d1390e84e0"
=20
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nf=
sd module will
 # pull in the remainder of the dependencies.

