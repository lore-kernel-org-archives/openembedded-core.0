Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C6B8C55ABF
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 11:40:35 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17780.1786016430699659577
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 04:40:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=EK349hHz;
 spf=pass (domain: est.tech, ip: 52.101.70.28, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wmtlMxQhB7XyNr3QG5DiQumZyc0y0E68Guzpw+ydYVD0RD6hsDm6NffRLXRcpN+5M7NgmIPMJmL4yP1ag3SxDGXSXd1sdQfbvHZU35a6H1n/eCcvJEf9iax8tQbXzMs3+X6ChJoqmYPCl08iqpJ0QWEawCuvCSJoTaVsguah9rU+oXBPQS6uhKplPaWYspgoqvlzbFFtb7FoNyEioDbI/kRP2avebvIyrJxw3Euq61bsIl+FuOsuzlMgZiZWdIeuKOCRh4F65/EsjWMShUloohrIA071FDoo81Oj4sElR0zqLSOu9Q0dFlwvcw3U4vxJF3akfDhEiLqgzhj9HhNegg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCCvQTfvUCo10gZCZPuMyBCopCImGfTZ4uil8pKo0KY=;
 b=dalUcQGEuR+hWpC9OoIFAD6Xf9uHYX47cM6/mr7BuJj2jW9SOf51x2P303g3y7DlU9Xkzr2ltDqKQ6DBbGQe+mZZ3sJpy6auEdq84bihoCCrDvIvRiu5QB8ZqpzqEEaayi7GLBbXcsPQUqSbfwu90QM8BU1PaSLkDY2CYQmAI4EnT+wznPsnJLqPvL9h6l9wn0kifx1e15PSZ5yQPvHP6SeO0q4/p1xgWYsQkSpJYvqON4uSou6gwXnATIaGFV55djK1i+sfT+6G0mH2jXgtU/5QmRhFBR5xFYjLh/7Pz37/TbOK9lYk8kEnKn1yGn7KZOM84kM4TzpYEHaL9yxOFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCCvQTfvUCo10gZCZPuMyBCopCImGfTZ4uil8pKo0KY=;
 b=EK349hHzDqq3rxwpYvxZGzDHnbGHB6q8iUgsaapEJ0zbdlXXyLZ31iqRoC4ffzTYZnUHKmsDj9cy4+BUCNeD0tH7p7GoXmuVCyXefGDDE2YBibwqpwr8mK17e9LgJLKVYWQLZBeBLBj2z4zZpinoYTrwpabz92X48d30hM+CQk4MdnwOUsyA9Jv4V1m7ITGWTQEarRjAauASH9YJT0H7MiUXBLhepgLk04Gqw5VczZsIbvmy7L872aCM3UwvZEWPqIrHgyCjbdLmF8sxSg+8cUJWJM+Xcv9Q4qMNVtl5o8yibyX1akTgEtyJtUldlBnsgAjoXy2MmXRVX8LIRSbYLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB9P189MB1809.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:332::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.7; Thu, 6 Aug 2026
 11:40:24 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 11:40:23 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH v2] nfs-utils: upgrade 2.9.1 -> 2.9.2
Date: Thu,  6 Aug 2026 13:40:19 +0200
Message-ID: <20260806114019.25253-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260805162550.13442-1-jaipaul.cheernam@est.tech>
References: <20260805162550.13442-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0259.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::24) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB9P189MB1809:EE_
X-MS-Office365-Filtering-Correlation-Id: 944562ce-499d-45e7-7261-08def3af80bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	pRCnVLoxneAlsfa9ErmWUfRzKzADN9a/OkV5tF06XH49jrzFwWloLmkj3lVK87ow4/cgq3MUZElOIGpl3AIQuc41+WPQImxX5DGX+hRJy/+wU+e/dXrxPA0yqIU2LX3oOf6O7h6Bd0lMFfLeCJBK2RlCH7hV1I9/8qbYDz1dAH9Jqg0IqScy8T3y17YN55scqwGOc1Px8t0v38igXQPXUgvivDjrpnBAk9zjSCVGCoRwrbBzgGxkw4u2upvf4+CvNv8rCkOApzvt3v7dqncfhM72nf7b3FN6/YdQsSCsYa0GJjxkyDtAH77GzeDmeXOsb6ADwGKpq7WflmbqHckuD2y1NcqraKSHTaHa5JfV4nS82uHfVhuWrNPAO+WEj6eRTkuAjb2Lrn+K2CgGzsNJWLLH1V0nyB/lCBLWuF5ZnrhyGOXRPzmvLMxVnKx6SJoOZtNDi21XC/P57l+/t5uadubm41tsRDQvDPJlnxV+FQqP9UMiXdMKrMMoNu6RYLNeGxrBGDscVsDDFn2aJXuczYcTuFw2TqrcusNpxZdekIq5uyFrHSO+onyhpwDGacMZrQyImAGGTD5mm04Kftrw67yECCS68JPFlsrLfNhGP2lFn335m3HZx8DIoHEgy9Q8
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SuInIsZFcEguQi2Ll09o2HwuE2Z506dEB70WX67u7YnqL404s/9G5a0CcI0p?=
 =?us-ascii?Q?zkNq3q75oZEspz4rFVyQSTHPRDKFj8AbokAfiHkRGRmkAVPW5KOB+b/gxJa6?=
 =?us-ascii?Q?msvAKlK05N6aHy4sE1kcsDTouB0VBxp/Zlm/EQiDZDH2VgNVuDAMrq02j8lG?=
 =?us-ascii?Q?r1ztc9bj+OsZznYEsPnjD5FR5aHE+7yZCYmn9pZhscJu8vYHmegKoyvSMVda?=
 =?us-ascii?Q?pm2TXVcEqrxi1O7OBZZmouOFHOfhPbx8KIM86IbdoaCsbhzYCOHQXxHJ7fss?=
 =?us-ascii?Q?XHmx8eQqFhVxxQ9fdgTkqHGbxEGq+Fco0IoZmXzR3s+tcUPfQ/1317vjPUAU?=
 =?us-ascii?Q?+Hy0dRjsv8IThqwCYMQOEF88JZXxRrN0EoRzdnwRYclIa8psN1gNUWHPee8M?=
 =?us-ascii?Q?SnfxLo71vgXf3z+7TI+/+J2h+/nmSJBHzNfmZGTnbR8n1JDUW3YLV8N0Vstj?=
 =?us-ascii?Q?oThId5a5dwRZD/ckfH7aF9XGIaYkYBEzTsrJXN9Q2MDmiyddWISpxulZVZX1?=
 =?us-ascii?Q?FEo+3NkogKprUBGAbXVrEKeWvjPWIDKZVf6DNs6Y6guSnrZpXrCtUUT/1BDn?=
 =?us-ascii?Q?cO6unEFqKot/9rF9+1psWHE6W6vFA3Shid/3ckDRr1m18K2hVn4x5kl0E/RE?=
 =?us-ascii?Q?aCuT9mM2RK4cSQ5CkWHAAm4wkZ6AMvN9uPqiZct5jGS3FDQrsGtb9ManGhyA?=
 =?us-ascii?Q?iNh/V0zUv1hVJL0Ss5auEjrWabbMeuMsRTF0fxflzOo5ZZETzC7e3D4BdBDr?=
 =?us-ascii?Q?+e/kPjfcSDSW+qPn2rUDC7CCRe1NZ18iEKQ1JWm366tNSlQ+IVAf4TXB59z1?=
 =?us-ascii?Q?ODRhKXxTjosmU6vjb2lihudvzti5ewTnjMsuax3QMGVGwE8li+bM42zw5l4y?=
 =?us-ascii?Q?diyYa7IVLDZfb/GH4cCNBKzt4QeiRXUyXHNSBPAakVeViSmdp4UyfqAMb0po?=
 =?us-ascii?Q?Xl7KlfPpMVZP0uC3rXjw9g3xCqDML+1HT7q+ClqUTQC97ykUCUGXt32kqyHJ?=
 =?us-ascii?Q?9NKO3O+3DeCLKE07AXBOzyVNEI9T8w2gNYbOiFHU+BGsVLrxT4iXvZ8QL1hr?=
 =?us-ascii?Q?boSs8xPgNL7mubSQMMZ+owELBmyl706C6j1Ai9SohbrVMcUxnvc9cGWJ8mXj?=
 =?us-ascii?Q?u7J663elA7Dvilg44SzNcbNYpN27Y2m+3xzollANOhOucefxFrX7uFF6ilY0?=
 =?us-ascii?Q?ofP/INiK8ySczGyfVK0i+VFJWGNMTE2OTT1YKrX7hO9diVO16AQQyAk6ZZ0F?=
 =?us-ascii?Q?XxFAKwvmBlGdzDbeowekNVdeK66RZf2z7hNCQragxBrYVLDaHH/WdRkj54Sd?=
 =?us-ascii?Q?5idO8nf7BeFgaJEQ1ll5GYByg4dwvFnIRbahN9ZPMjXmCwzSivf1K1+n8Hwt?=
 =?us-ascii?Q?JosqagpAiw9HVhTqgBU8zJGkV8e+72PCNAyNWkzEGrAO5ME3HdGi9t2laOGg?=
 =?us-ascii?Q?QcyeW3cFMNBGOTSSl5h3UxV6EuxeOqlcocW+zGwPpUs/y2SY9nZ9pH2JBk2r?=
 =?us-ascii?Q?IQ+/S3g2aQb+e0BVMDO9pM5AhzOinu2KTN6x4g4k70BCHGUzlaRxICkdGMeM?=
 =?us-ascii?Q?a2O6yYbRrZHT3eOwlwzsrp+hD/1Cwjh3+iB60iuIKeec2Wj8x0nGC8YnzJrp?=
 =?us-ascii?Q?/hx7eh0GGS9H7xgnk9pW2iekEH4Pm1dWD26EnCmhvmBts4ge2nV+be6MUouj?=
 =?us-ascii?Q?GS0wTnSAVBiF9dhTLCQwRhZ0hAPNdp56jrejlUnMrcanRCVGLAvkEj0DMegV?=
 =?us-ascii?Q?x1NT8hS+yQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 944562ce-499d-45e7-7261-08def3af80bc
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 11:40:23.8987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zLoFnf/OaB0XkM2xhwiOppa7GK8cb0pRmyYtnzQw3dD+BadJdutIpuRr4xBKNdTi11S6Blo4BnsP+yUawyTR9u77RAuAD3EoYxFmc4sfg0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB1809
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 11:40:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242933

ChangeLog: https://www.kernel.org/pub/linux/utils/nfs-utils/2.9.2/2.9.2-Cha=
ngelog

Drop 0001-fh_key_file.c-Fix-build-error-for-musl.patch (fixed upstream).

Add patches to fix build failures:
- Fix link error with --disable-nfsdctl (undefined reference to
  nfsd_nl_cmd_str)
- Fix musl build (missing stddef.h for offsetof in getport.c)

Both reported to linux-nfs@vger.kernel.org.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes in v2:
- Drop 0001-fh_key_file.c patch (fixed upstream in 2.9.2)
- Add patch to fix musl build (missing stddef.h for offsetof in getport.c)

 ..._key_file.c-Fix-build-error-for-musl.patch | 31 ------------
 ...tport-fix-missing-stddef.h-inclusion.patch | 27 +++++++++++
 .../0004-Use-nogroup-for-nobody-group.patch   |  6 +--
 .../0005-find-OE-provided-Kerberos.patch      |  4 +-
 ...e-HAVE_NFSD_NETLINK-on-enable-nfsdct.patch | 47 +++++++++++++++++++
 ...{nfs-utils_2.9.1.bb =3D> nfs-utils_2.9.2.bb} |  5 +-
 6 files changed, 82 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-fh_k=
ey_file.c-Fix-build-error-for-musl.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-getp=
ort-fix-missing-stddef.h-inclusion.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0006-conf=
igure.ac-gate-HAVE_NFSD_NETLINK-on-enable-nfsdct.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.9.1.bb =3D> nfs-ut=
ils_2.9.2.bb} (96%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-fh_key_file=
.c-Fix-build-error-for-musl.patch b/meta/recipes-connectivity/nfs-utils/nfs=
-utils/0001-fh_key_file.c-Fix-build-error-for-musl.patch
deleted file mode 100644
index d6db1fe0c0..0000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-fh_key_file.c-Fix-=
build-error-for-musl.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 98048fd9262b3e4e024248ebd07d5ff66175e4ec Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Thu, 7 May 2026 03:32:57 -0700
-Subject: [PATCH] fh_key_file.c: Fix build error with musl
-
-Fixed:
-error: implicit declaration of function 'strerror'
-
-Upstream-Status: Backport [https://lore.kernel.org/linux-nfs/b2b370b6-8576=
-493a-b124-776e1249c312@redhat.com/]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- support/nfs/fh_key_file.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/support/nfs/fh_key_file.c b/support/nfs/fh_key_file.c
-index 5f5eafc..89555ce 100644
---- a/support/nfs/fh_key_file.c
-+++ b/support/nfs/fh_key_file.c
-@@ -30,6 +30,8 @@
-=20
- #include "nfslib.h"
-=20
-+#include <string.h>
-+
- #define HASH_BLOCKSIZE  256
- int hash_fh_key_file(const char *fh_key_file, uuid_t uuid)
- {
---=20
-2.49.0
-
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-getport-fix=
-missing-stddef.h-inclusion.patch b/meta/recipes-connectivity/nfs-utils/nfs=
-utils/0001-getport-fix-missing-stddef.h-inclusion.patch
new file mode 100644
index 0000000000..1683e9692b
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-getport-fix-missin=
g-stddef.h-inclusion.patch
@@ -0,0 +1,27 @@
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 6 Aug 2026 10:55:00 +0000
+Subject: [PATCH] getport: fix missing stddef.h inclusion
+
+getport.c uses offsetof() but does not include <stddef.h>. On glibc
+this works because offsetof is pulled in transitively, but on musl it
+is not available without the explicit include, causing:
+
+  getport.c:459:41: error: implicit declaration of function 'offsetof'
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-nfs/202608061120=
23.25090-1-jaipaul.cheernam@est.tech/]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ support/nfs/getport.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/support/nfs/getport.c b/support/nfs/getport.c
+--- a/support/nfs/getport.c
++++ b/support/nfs/getport.c
+@@ -27,6 +27,7 @@
+ #include <config.h>
+ #endif
+=20
++#include <stddef.h>
+ #include <sys/types.h>
+ #include <sys/time.h>
+ #include <unistd.h>
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup=
-for-nobody-group.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/000=
4-Use-nogroup-for-nobody-group.patch
index bbf44d5977..7e63cb6282 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-no=
body-group.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-no=
body-group.patch
@@ -1,4 +1,4 @@
-From 001913c5eb0aad933a93ee966252905cd46d776b Mon Sep 17 00:00:00 2001
+From 5f4739475f3c01145174734ed8a3b31b3da99b77 Mon Sep 17 00:00:00 2001
 From: Daniel McGregor <daniel.mcgregor@vecima.com>
 Date: Tue, 6 Jun 2023 16:07:53 -0600
 Subject: [PATCH] Use "nogroup" for nobody group
@@ -11,7 +11,7 @@ Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.co=
m>
  2 files changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/support/nfsidmap/idmapd.conf b/support/nfsidmap/idmapd.conf
-index 2a2f79a1..e6f3724f 100644
+index 2a2f79a..e6f3724 100644
 --- a/support/nfsidmap/idmapd.conf
 +++ b/support/nfsidmap/idmapd.conf
 @@ -41,7 +41,7 @@
@@ -24,7 +24,7 @@ index 2a2f79a1..e6f3724f 100644
  [Translation]
 =20
 diff --git a/utils/idmapd/idmapd.c b/utils/idmapd/idmapd.c
-index cd9a965f..3be805e9 100644
+index 5231f56..e1aa8a5 100644
 --- a/utils/idmapd/idmapd.c
 +++ b/utils/idmapd/idmapd.c
 @@ -89,7 +89,7 @@
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-pro=
vided-Kerberos.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-f=
ind-OE-provided-Kerberos.patch
index 3241e8e859..bb152c2754 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-K=
erberos.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-K=
erberos.patch
@@ -1,4 +1,4 @@
-From a2af266f013722a64c5d04e0fe097cd711393a53 Mon Sep 17 00:00:00 2001
+From a1759d9079a436096be5ce44622a3a5a85ec9faa Mon Sep 17 00:00:00 2001
 From: Daniel McGregor <daniel.mcgregor@vecima.com>
 Date: Wed, 8 Nov 2023 16:24:20 -0600
 Subject: [PATCH] find OE provided Kerberos
@@ -10,7 +10,7 @@ Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.co=
m>
  1 file changed, 4 insertions(+), 2 deletions(-)
=20
 diff --git a/aclocal/kerberos5.m4 b/aclocal/kerberos5.m4
-index f96f0fd4..ad85fdf2 100644
+index f96f0fd..ad85fdf 100644
 --- a/aclocal/kerberos5.m4
 +++ b/aclocal/kerberos5.m4
 @@ -22,8 +22,8 @@ AC_DEFUN([AC_KERBEROS_V5],[
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0006-configure.a=
c-gate-HAVE_NFSD_NETLINK-on-enable-nfsdct.patch b/meta/recipes-connectivity=
/nfs-utils/nfs-utils/0006-configure.ac-gate-HAVE_NFSD_NETLINK-on-enable-nfs=
dct.patch
new file mode 100644
index 0000000000..d15ea1ac5d
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0006-configure.ac-gate-=
HAVE_NFSD_NETLINK-on-enable-nfsdct.patch
@@ -0,0 +1,47 @@
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Wed, 5 Aug 2026 06:55:00 +0000
+Subject: [PATCH] configure.ac: gate HAVE_NFSD_NETLINK on --enable-nfsdctl
+
+HAVE_NFSD_NETLINK is currently defined unconditionally, but the
+implementation of nfsd_nl_cmd_str() in support/nfs/nfsdnl.c is only
+compiled into libnfs when CONFIG_NFSDCTL is true (--enable-nfsdctl).
+
+This causes a link failure when building with --disable-nfsdctl:
+
+  ld: exportfs-exportfs.o: in function `unexportfs_parsed':
+  exportfs.c:491: undefined reference to `nfsd_nl_cmd_str'
+
+The callers (exportfs.c) guard their usage with #ifdef HAVE_NFSD_NETLINK,
+and nfsdnl.h provides a static inline stub returning -ENOSYS when the
+macro is not defined.  So the correct fix is to only define
+HAVE_NFSD_NETLINK when --enable-nfsdctl is in effect, keeping netlink
+support as an opt-in feature consistent with the CONFIG_NFSDCTL guard
+on nfsdnl.c.
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-nfs/9fec9f1b-1c1=
0-4a20-8282-dfc9addb4ee8@est.tech/T/#u]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+--- a/configure.ac
++++ b/configure.ac
+@@ -256,8 +256,6 @@
+ PKG_CHECK_MODULES(LIBNLGENL3, libnl-genl-3.0 >=3D 3.1)
+=20
+ AC_CHECK_HEADERS(linux/nfsd_netlink.h)
+-AC_DEFINE([HAVE_NFSD_NETLINK], 1,
+-	  [Define to 1 if nfsd generic netlink support is available])
+=20
+ # ensure the system netlink headers have the latest features
+ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[#include <linux/nfsd_netlink.h>]],
+@@ -279,6 +277,8 @@
+ 	enable_nfsdctl=3D"yes")
+ 	AM_CONDITIONAL(CONFIG_NFSDCTL, [test "$enable_nfsdctl" =3D "yes" ])
+ 	if test "$enable_nfsdctl" =3D yes; then
++		AC_DEFINE([HAVE_NFSD_NETLINK], 1,
++			  [Define to 1 if nfsd generic netlink support is available])
+ 		PKG_CHECK_MODULES(LIBREADLINE, readline)
+ 	fi
+=20
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb b/meta/=
recipes-connectivity/nfs-utils/nfs-utils_2.9.2.bb
similarity index 96%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.2.bb
index 06e4fcb6e0..e60011ff9f 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.2.bb
@@ -23,10 +23,11 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/nfs-utils/=
${PV}/nfs-utils-${PV}.tar.x
            file://nfscommon \
            file://0004-Use-nogroup-for-nobody-group.patch \
            file://0005-find-OE-provided-Kerberos.patch \
-           file://0001-fh_key_file.c-Fix-build-error-for-musl.patch \
+           file://0006-configure.ac-gate-HAVE_NFSD_NETLINK-on-enable-nfsdc=
t.patch \
+           file://0001-getport-fix-missing-stddef.h-inclusion.patch \
            "
=20
-SRC_URI[sha256sum] =3D "302846343bf509f8f884c23bdbd0fe853b7f7cbb6572060a90=
82279d13b21a2c"
+SRC_URI[sha256sum] =3D "e1dd8a9c95af15492065942cc3b52b1339ffd586baa2280ed8=
6c9d3dc4097e8c"
=20
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nf=
sd module will
 # pull in the remainder of the dependencies.

