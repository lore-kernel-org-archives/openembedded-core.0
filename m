Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29B14C5516F
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 05:18:47 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36914.1785734319715544514
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 22:18:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Ho9C5bMi;
 spf=pass (domain: est.tech, ip: 40.107.162.22, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ARW2uILLLzHUPqEzn6wDK8uPvDFSwh14cSj0qG0sznTt/rT8T3TUIOrdXNRCkI4ecPBNulNMjzXcbhNErUxMUXMxSGVxOTtCMAW504K6KeWfE8Nd3WQuLcN80nMF6T8t5UH4RZ+4CZQKEg5ezsq80zljTcVq1raq+ie+bsOZQbHN7TvM3EbJFjvT3cEJx/XJzPoUROY9BRmmJqe8b6kBkCatco3Hm0AL9rCSmXLVzyjt/i0LNbbmG95PLUVn4U4A7fUMtIXjd2J18Fa7nNGIfA2wlp8s0DuHVYhbyI1LsX7nkiPIYYIb0WUtQdGSoV1a9zEQeglEyZn0u0RiP/6A0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shDw+nppYvBCYKvS1v6HvDhqbHFMKFQo9nAoVsoaiuk=;
 b=EEbEusuNUwsuclpJgHAE/bS7xdSfkCeJpeqaDw/oMXOeCJGmClyV3XOxHNFygKbC/MZJjv6maGOfDLygZfVibdgIz1MjKh3UjvNhXEVZx2W7ZhT4wvt+VX7670P8BX3fjE0RuXhIu8Wygjbq/nF1veQiDiFo3fHOs+LBgqrqnx5M5Absjh6Dxwcgg+k9OkibF4MF6cI2Ll+LHHK2HCTaIGqvy/J5/0l8fRu4pQxl/TlqtP7ahkKYVmjqkU7jENStkGqAPKG8pzFFit/JdZ7gIERtx0ULJ1un+QNQcsInuZduGqQ2nWdMyrGIdiXt3SxUIMWg/W4uLHobdW5wgynC1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=shDw+nppYvBCYKvS1v6HvDhqbHFMKFQo9nAoVsoaiuk=;
 b=Ho9C5bMi9gzeIJgntvTs6xsb9a4UFKYiIqmtso1+ObxSAMat6fCU1Ns0v+6DdewxUqf63WKk2L3CYy8RwsWLiaV6opIA3P5MOJurfdyIIvKgCpZx24MAZP2TMTIwFjEtSRYdxo+TcEzJkrmLsklBRohhs3vaaEsj4/TaoflG7zC/qIRwdc1mQNNMoEzsDZ6hE3omODQFRxk89q2QY2qlwYXJShXdc2wYHx1j46b+7Lt12iOhIIAwACvyR4z0E1I1S1dWB2xb4A5oVNvnp0Zbwu8SG5jebJOa6GJhjqqvmwQBuEj6i0BZGoSZWJ7LwWjr4++enXDDk8dx9yzcSyLZXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM7P189MB0947.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:178::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.13; Mon, 3 Aug
 2026 05:18:37 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.012; Mon, 3 Aug 2026
 05:18:37 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 1/2] shadow: upgrade 4.19.4 -> 4.20.0
Date: Mon,  3 Aug 2026 07:18:31 +0200
Message-ID: <20260803051832.25488-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260803051832.25488-1-jaipaul.cheernam@est.tech>
References: <20260803051832.25488-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P195CA0004.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::34) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM7P189MB0947:EE_
X-MS-Office365-Filtering-Correlation-Id: 29424ccc-2dae-4da0-1273-08def11eac41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|10070799003|366016|23010399003|376014|11063799006|56012099006|10067099003|6133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ggxQPr9DBMzIFo0mSzldgibZ1xF30wFTUswY7jwITtf2jYNrLh/yWFfkDxgY0o3/yWyOYnmI3j4FyVK/u/KTW0CRRnHrgr8CJYYgltBNR8ULJ1O5374Abq+Jxp1nibE/DKOgqZLB77UCYIEeWcNmHKumDQ0/ErVgwgTqqeuwWG152I9wneL+x9VSuQGKXjTjPxcuXJlBOe+AJgF2Khx/OlhM4krZ7B5P7gYFAgjXKCxZX9WxLHis2odWXiN7EslPF0lfvL3/5c4kHoOeCNGx8X1T7cZwnck5WttgUD6lSICPrfFxdbytZrkj3JVREp4KhOi+v15nUAVk8RJ0R+6vs2QNifmnBYKOIWd0jqCroqIaxhHDqGJEhnZiy1ROViYASO9C6voLXpEaAY3TulGO+QKO0R3l2PzTW4jZqr7PRn9YH43A1WwQQSL3WxNGLp0+XtHf6v3S5XNjsppc9stftJx+4UqnW/mxKWRQmU9kTUpb4MBL/wIxSJ39S3tcWHRKgmowqgC/op+w9BIKNEeOJqyvfkWoL3TEw+RJxpk4RLuVZcdwwtvVb1OhY7sJJzkAhrJ88TPSdHZDrrvu6tnvEu0d40/9Q4ia0r2DRif5a/m4A1n4sRPmdeSruXkTcSA9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(23010399003)(376014)(11063799006)(56012099006)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xUgIBjkJaQIyFJlHle5MK+8zlT+GUqiyMUNCvcfu0quvIGOWQC8hZ2USpTy+?=
 =?us-ascii?Q?aP9B0MAgFjfeZZfDDCADkt7LoYMvUowVto5dgDzs9gXP8Gvu5KjGQm+Asa5O?=
 =?us-ascii?Q?zGaglGazoLqZ/8/FHcDtgWBOL9Izva4bLOw4YvGEMlkaBcPf8TFezZ74HHrh?=
 =?us-ascii?Q?ZpqDMVshVlaMtHceTkj8ADGmDXkP+fS+8zNxYIUB/8MzM2smqFo/p+YpQNFx?=
 =?us-ascii?Q?nSFyFceQo7+/kXKnsyxu32z+/APD2/26CVV+oAv/fKGfC+rCAK7dBAS7RLNU?=
 =?us-ascii?Q?+kKQrcBIiH0Tayav46K722O1yv/y4Emlw9Mz1acpL7tn5LfE0pqPr9PB1/GA?=
 =?us-ascii?Q?ioRAiyczmaj8aDlD/NNqP+jsg9WY0cYAElTjgzWGZC6FLOdgU4OSLvlMdHSL?=
 =?us-ascii?Q?4Pg/HQb1qiqW2MvFUne82h+7D7aygqAr6rqxcewRxRYsB6iM96sB2t71RKnU?=
 =?us-ascii?Q?2/FVdjPcmK2rrQlFdzlx3ws8+ac7Hx8h5/op2LkMKuaG4GljDjbkdx8/G6lV?=
 =?us-ascii?Q?5oHAKSPV7jKBT0ymE3JqWiSCo9bD8U+7TA1+U/UnECHjiDyAg9KVne/zxtSo?=
 =?us-ascii?Q?dGCdudPFg7EzglyWOxJdi4UE8ynSnX04yx2u3aMpKExyuJg3DHc2eiHta9BM?=
 =?us-ascii?Q?bDVPv+YgwzKj5/nzqHuv6Jogg4EVLiXEUxr88fDHR/7sfMoC6bajPo0XFH55?=
 =?us-ascii?Q?8tnoUAcjtwrDlD5dWtzF8G4Y0w60lyGKQdTMxtaq2qOMQdMqztL+DtguDtbf?=
 =?us-ascii?Q?vW0prF4thUu4nbTIUO6KH2BKOA3vy1UM8TBp+DKQbbK5z8W4QdX/wd1l0oOg?=
 =?us-ascii?Q?ERbqlbrNx36/kGgKgvoqvtJr/np+f8K+z07D2Vv0/iD4yqXoqUMiayv1YN8N?=
 =?us-ascii?Q?M3HMIjyAfjXL4FmmvEKNV3vGjz0YtqXHJQK1PVnCRk7vaSUjrCr6ysTvO5so?=
 =?us-ascii?Q?V74fl2X7xaEPghTl3U/RV9RfcKAbTQtVHtvh/tfc/Ur25hqeR9zVo0BvOc8W?=
 =?us-ascii?Q?ZCFhekQVHNBnTlnvODQ3fH4BBUV6BZ5RMfE+xnqdIsW5LCBhIrzpkCmDtm43?=
 =?us-ascii?Q?9p5/4fkAHJvUeM6mMX3hvFArlTUxmdusV1FiH6eMJ+skGtlguL3swiEZ2cMY?=
 =?us-ascii?Q?zd/FvcyTIXeHvhR0/vo7NUQo/qFOdmvuZrG7WyGD1np/RfdqqSvz+9uujjkU?=
 =?us-ascii?Q?I47Rtb2racbSgZD7GNzn97ZkMblVpHUzdHF8xS7x1JsFD8kbxrnfgiv3KTYV?=
 =?us-ascii?Q?mIhbpHPvIC26WW9r9xs0/MIn+2nnhPUuC2nOP0ibvjy+2pbkjochaVn1axd3?=
 =?us-ascii?Q?Smo245IOGlccrzZbaPHP7qVN1YcsMAGCKdMz+fM4+wQqZ1eoE+tQRfv3+Q/T?=
 =?us-ascii?Q?Ak2FdHbTmfo2wEmpklqoQxBezMzZDt8gFaCU89sjubKqHA6v4QsLVZOsQANq?=
 =?us-ascii?Q?CyH+WpB4Dy1wzxDudqE3TIgO92u1fGHz7H685Lh4/dW2l+HYE/xGHMnWIT2k?=
 =?us-ascii?Q?J9Kw1CMRr9Zz67//efhu8lBWVSkz+fdU8SF+PhJ4gED+UPcrCYyqUif+Chpt?=
 =?us-ascii?Q?VlVnK/omH4R3u5Q6ifD+EPek7JYfzGLMHJGQrrxMPWiY7AlVJlb1rMpJdWsD?=
 =?us-ascii?Q?v+CAhTUd5seQSNcWtakMnBotzRKfidYqPKtjmgnHomQR9B5Mm5E60MSdafLs?=
 =?us-ascii?Q?IzQNsr4LznXCLo5nmYyMFngR3rVo7TfQt8SyXBmzfGKg3w8QltrBLW8SsWtg?=
 =?us-ascii?Q?jRPpanMcCjLwA17RJNC5kCBp2QFe6OLvOdT41t0E9c1Vb9gg1IJ7DmBT1TYq?=
X-MS-Exchange-AntiSpam-MessageData-1: X8trkG1bbbUHEQTDB8sWFlXIxc7S56t5Cic=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 29424ccc-2dae-4da0-1273-08def11eac41
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 05:18:37.5569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bA0cp9gIXAYo+ziyITXwtFTOUKGj47XqoDrT+qdvIH1oQvvVoc9YtPhw0rKiDiS1SosXyBQhhVjKmpKyPRRrLqLFdk7qv0A9Naer3lApgAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0947
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 05:18:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242604

Changelog: https://github.com/shadow-maint/shadow/releases/tag/4.20.0

Notable upstream changes:
- expiry(1): removed (deprecated in 4.19)
- groupmems(8): removed, use usermod(8) instead (deprecated in 4.19)
- logoutd(8): removed (deprecated in 4.19)
- PAM configs for setuid account tools removed (08f27babeb2c)
- login.defs(5): ENCRYPT_METHOD now defaults to SHA512
- Removed unused dependency on libattr
- New --disable-syslog configure option

Patches removed:
- prototypes.patch: patched src/expiry.c and src/logoutd.c which were
  removed upstream in commits 2bb1b984 and eec97ce4.
- disable_syslog.patch: shadow now supports --disable-syslog configure
  option natively. Added to EXTRA_OECONF for class-native instead.
- shadow-update-pam-conf.patch: the files it patched (chgpasswd,
  groupadd, groupdel, groupmod, useradd, userdel, usermod) were removed
  upstream in commit 08f27babeb2c. The remaining pam.d files in the
  tarball are all overridden by the recipe's own PAM files.

Patches added:
- 0001-subid-Add-stdint.h-for-uintmax_t.patch: backport of upstream
  commit ba4419c57b22 fixing missing <stdint.h> include causing build
  failure in find_new_sub_uids.c and find_new_sub_gids.c.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...001-subid-Add-stdint.h-for-uintmax_t.patch |  43 +++++++
 .../shadow/files/disable_syslog.patch         |  23 ----
 .../shadow/files/prototypes.patch             |  38 ------
 .../shadow/files/shadow-update-pam-conf.patch | 110 ------------------
 .../{shadow_4.19.4.bb =3D> shadow_4.20.0.bb}    |   8 +-
 5 files changed, 46 insertions(+), 176 deletions(-)
 create mode 100644 meta/recipes-extended/shadow/files/0001-subid-Add-stdin=
t.h-for-uintmax_t.patch
 delete mode 100644 meta/recipes-extended/shadow/files/disable_syslog.patch
 delete mode 100644 meta/recipes-extended/shadow/files/prototypes.patch
 delete mode 100644 meta/recipes-extended/shadow/files/shadow-update-pam-co=
nf.patch
 rename meta/recipes-extended/shadow/{shadow_4.19.4.bb =3D> shadow_4.20.0.b=
b} (97%)

diff --git a/meta/recipes-extended/shadow/files/0001-subid-Add-stdint.h-for=
-uintmax_t.patch b/meta/recipes-extended/shadow/files/0001-subid-Add-stdint=
.h-for-uintmax_t.patch
new file mode 100644
index 0000000000..5679be0e61
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-subid-Add-stdint.h-for-uintma=
x_t.patch
@@ -0,0 +1,43 @@
+From ba4419c57b222b0d34a2b933e7ee92914a51b596 Mon Sep 17 00:00:00 2001
+From: ojab <ojab@ojab.ru>
+Date: Wed, 29 Jul 2026 15:07:43 +0000
+Subject: [PATCH] subid: Add `<stdint.h>` for `uintmax_t`
+
+```
+find_new_sub_uids.c:80:27: error: 'uintmax_t' undeclared (first use in thi=
s function)
+find_new_sub_gids.c:80:27: error: 'uintmax_t' undeclared (first use in thi=
s function)
+```
+
+Fixes: 4d800cf2eb9e (2026-04-09; "subid: Add deterministic subid ranges")
+
+Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/b=
a4419c57b222b0d34a2b933e7ee92914a51b596]
+Signed-off-by: ojab <ojab@ojab.ru>
+---
+ lib/find_new_sub_gids.c | 1 +
+ lib/find_new_sub_uids.c | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/lib/find_new_sub_gids.c b/lib/find_new_sub_gids.c
+index 3971ce922e..de514d6b09 100644
+--- a/lib/find_new_sub_gids.c
++++ b/lib/find_new_sub_gids.c
+@@ -8,6 +8,7 @@
+=20
+ #ifdef ENABLE_SUBIDS
+=20
++#include <stdint.h>
+ #include <stdio.h>
+ #include <errno.h>
+=20
+diff --git a/lib/find_new_sub_uids.c b/lib/find_new_sub_uids.c
+index 65f6815467..f0b4328387 100644
+--- a/lib/find_new_sub_uids.c
++++ b/lib/find_new_sub_uids.c
+@@ -8,6 +8,7 @@
+=20
+ #ifdef ENABLE_SUBIDS
+=20
++#include <stdint.h>
+ #include <stdio.h>
+ #include <errno.h>
+=20
diff --git a/meta/recipes-extended/shadow/files/disable_syslog.patch b/meta=
/recipes-extended/shadow/files/disable_syslog.patch
deleted file mode 100644
index 9f8ffcd379..0000000000
--- a/meta/recipes-extended/shadow/files/disable_syslog.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-When building images using shadow-native, we shouldn't be spamming the hos=
t's
-log with lots of syslog messages which aren't relavent. Disable syslog use
-in the native case.
-
-Upstream-Status: Inappropriate [upstream has accepted a better patch at ht=
tps://github.com/shadow-maint/shadow/pull/1618]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Signed-off-by: Dmitry Sakhonchik <frezidok1@gmail.com>
-
-Index: shadow-4.17.2/lib/defines.h
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- shadow-4.17.2.orig/lib/defines.h
-+++ shadow-4.17.2/lib/defines.h
-@@ -88,7 +88,9 @@
-=20
- /* cleaner than lots of #ifdefs everywhere - use this as follows:
-    SYSLOG((LOG_CRIT, "user %s cracked root", user)); */
--#ifdef ENABLE_NLS
-+#if 1
-+#define SYSLOG(x)
-+#elif ENABLE_NLS
- /* Temporarily set LC_TIME to "C" to avoid strange dates in syslog.
-    This is a workaround for a more general syslog(d) design problem -
-    syslogd should log the current system time for each event, and not
diff --git a/meta/recipes-extended/shadow/files/prototypes.patch b/meta/rec=
ipes-extended/shadow/files/prototypes.patch
deleted file mode 100644
index dfdfc9b47a..0000000000
--- a/meta/recipes-extended/shadow/files/prototypes.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Give unused function arguments names as GCC 10 will fail otherwise.
-
-This is a continuation of a PR that has been merged upstream[1] but
-this merged after expiry.c[2] and logout.c[3] were removed.
-
-[1] shadow cb0ec030 ("Fix build failure on hosts with gcc 10")
-[2] shadow 2bb1b984 ("*/: expiry(1): Remove program")
-[3] shadow eec97ce4 ("Remove unused `logoutd` utility")
-
-Upstream-Status: Inappropriate [code no longer exists upstream]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-diff --git a/src/expiry.c b/src/expiry.c
-index 8da89bd..0abf011 100644
---- a/src/expiry.c
-+++ b/src/expiry.c
-@@ -37,7 +37,7 @@ static void process_flags (int argc, char **argv);
-  * catch_signals - signal catcher
-  */
- static void
--catch_signals(int)
-+catch_signals(MAYBE_UNUSED int _1)
- {
- 	_exit (10);
- }
-diff --git a/src/logoutd.c b/src/logoutd.c
-index c87b75c..09a24b3 100644
---- a/src/logoutd.c
-+++ b/src/logoutd.c
-@@ -116,7 +116,7 @@ static void send_mesg_to_tty (int tty_fd)
-  *	off from the system.
-  */
- int
--main(int argc, char *[])
-+main(int argc, char *argv[])
- {
- 	pid_t  pid;
-=20
diff --git a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patc=
h b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
deleted file mode 100644
index 318e2665c2..0000000000
--- a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From eb17cd91d8e4d76ee95de9c0c9f4938ba2e3e82a Mon Sep 17 00:00:00 2001
-From: Kang Kai <kai.kang@windriver.com>
-Date: Wed, 20 Jul 2011 19:18:14 +0800
-Subject: [PATCH] shadow: update pam related configure files
-
-The system-auth in the configure files is from Fedora which put all the 4 =
pam type rules
-in one file.
-In yocto it obey the way with Debian/Ubuntu, and the names are common-auth=
, common-account,
-common-password and common-session.
-So update them with oe way.
-
-See meta/recipes-extended/pam/libpam/pam.d/common-password
-
-Upstream-Status: Inappropriate [oe-core specific]
-
-Signed-off-by: Kang Kai <kai.kang@windriver.com>
----
- etc/pam.d/chgpasswd | 2 +-
- etc/pam.d/groupadd  | 2 +-
- etc/pam.d/groupdel  | 2 +-
- etc/pam.d/groupmems | 2 +-
- etc/pam.d/groupmod  | 2 +-
- etc/pam.d/useradd   | 2 +-
- etc/pam.d/userdel   | 2 +-
- etc/pam.d/usermod   | 2 +-
- 8 files changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/etc/pam.d/chgpasswd b/etc/pam.d/chgpasswd
-index 8f49f5c..b1f365d 100644
---- a/etc/pam.d/chgpasswd
-+++ b/etc/pam.d/chgpasswd
-@@ -1,4 +1,4 @@
- #%PAM-1.0
- auth		sufficient	pam_rootok.so
- account		required	pam_permit.so
--password	include		system-auth
-+password	include		common-password
-diff --git a/etc/pam.d/groupadd b/etc/pam.d/groupadd
-index 8f49f5c..b1f365d 100644
---- a/etc/pam.d/groupadd
-+++ b/etc/pam.d/groupadd
-@@ -1,4 +1,4 @@
- #%PAM-1.0
- auth		sufficient	pam_rootok.so
- account		required	pam_permit.so
--password	include		system-auth
-+password	include		common-password
-diff --git a/etc/pam.d/groupdel b/etc/pam.d/groupdel
-index 8f49f5c..b1f365d 100644
---- a/etc/pam.d/groupdel
-+++ b/etc/pam.d/groupdel
-@@ -1,4 +1,4 @@
- #%PAM-1.0
- auth		sufficient	pam_rootok.so
- account		required	pam_permit.so
--password	include		system-auth
-+password	include		common-password
-diff --git a/etc/pam.d/groupmems b/etc/pam.d/groupmems
-index 8f49f5c..b1f365d 100644
---- a/etc/pam.d/groupmems
-+++ b/etc/pam.d/groupmems
-@@ -1,4 +1,4 @@
- #%PAM-1.0
- auth		sufficient	pam_rootok.so
- account		required	pam_permit.so
--password	include		system-auth
-+password	include		common-password
-diff --git a/etc/pam.d/groupmod b/etc/pam.d/groupmod
-index 8f49f5c..b1f365d 100644
---- a/etc/pam.d/groupmod
-+++ b/etc/pam.d/groupmod
-@@ -1,4 +1,4 @@
- #%PAM-1.0
- auth		sufficient	pam_rootok.so
- account		required	pam_permit.so
--password	include		system-auth
-+password	include		common-password
-diff --git a/etc/pam.d/useradd b/etc/pam.d/useradd
-index 8f49f5c..b1f365d 100644
---- a/etc/pam.d/useradd
-+++ b/etc/pam.d/useradd
-@@ -1,4 +1,4 @@
- #%PAM-1.0
- auth		sufficient	pam_rootok.so
- account		required	pam_permit.so
--password	include		system-auth
-+password	include		common-password
-diff --git a/etc/pam.d/userdel b/etc/pam.d/userdel
-index 8f49f5c..b1f365d 100644
---- a/etc/pam.d/userdel
-+++ b/etc/pam.d/userdel
-@@ -1,4 +1,4 @@
- #%PAM-1.0
- auth		sufficient	pam_rootok.so
- account		required	pam_permit.so
--password	include		system-auth
-+password	include		common-password
-diff --git a/etc/pam.d/usermod b/etc/pam.d/usermod
-index 8f49f5c..b1f365d 100644
---- a/etc/pam.d/usermod
-+++ b/etc/pam.d/usermod
-@@ -1,4 +1,4 @@
- #%PAM-1.0
- auth		sufficient	pam_rootok.so
- account		required	pam_permit.so
--password	include		system-auth
-+password	include		common-password
---=20
-2.43.0
-
diff --git a/meta/recipes-extended/shadow/shadow_4.19.4.bb b/meta/recipes-e=
xtended/shadow/shadow_4.20.0.bb
similarity index 97%
rename from meta/recipes-extended/shadow/shadow_4.19.4.bb
rename to meta/recipes-extended/shadow/shadow_4.20.0.bb
index d9ff20c22c..bb247cee9d 100644
--- a/meta/recipes-extended/shadow/shadow_4.19.4.bb
+++ b/meta/recipes-extended/shadow/shadow_4.20.0.bb
@@ -14,19 +14,17 @@ GITHUB_BASE_URI =3D "https://github.com/shadow-maint/sh=
adow/releases"
 SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', =
'', d)} \
            file://useradd \
-		   file://prototypes.patch \
+           file://0001-subid-Add-stdint.h-for-uintmax_t.patch \
            "
=20
 SRC_URI:append:class-target =3D " \
            file://login_defs_pam.sed \
-           file://shadow-update-pam-conf.patch \
            "
=20
 SRC_URI:append:class-native =3D " \
-           file://disable_syslog.patch \
            file://notallylog.patch \
            "
-SRC_URI[sha256sum] =3D "ba7e9aed1c5420203ac549583d6e6f485a819ac7505af9c7cd=
8c13b2013210b8"
+SRC_URI[sha256sum] =3D "5e1eee2709a540ac07e4e5bb0d30f7b97d6ee1e3714ef52704=
7fe2ffb5fdaa5c"
 UPSTREAM_CHECK_REGEX =3D "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
=20
 # Additional Policy files for PAM
@@ -54,7 +52,7 @@ CACHED_CONFIGUREVARS +=3D "ac_cv_lib_econf_econf_readDirs=
=3Dno"
 CFLAGS:append:libc-musl =3D " -DLIBBSD_OVERLAY"
=20
 NSCDOPT =3D ""
-NSCDOPT:class-native =3D "--without-nscd"
+NSCDOPT:class-native =3D "--without-nscd --disable-syslog"
 NSCDOPT:class-nativesdk =3D "--without-nscd"
 NSCDOPT:libc-glibc =3D "--with-nscd"
=20

