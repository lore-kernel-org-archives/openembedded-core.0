Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF9CC5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 05:31:16 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6912.1786685466807137557
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 22:31:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=jdXn9/W7;
 spf=pass (domain: est.tech, ip: 52.101.84.21, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bNYU/2su2thEH0N3Fc6Nf8KIaO39RphkyPXvTgIrvLa4hAS12QoJtqR62xVLO48/izWEEEgxuT+CC/yv9TsRTadM9P+CFd96MoAp5Cof3d3XX1uomrpYQpGwgsoymoZOxtyVYPndXlN4qB9fpS1LYRKSmZP2PrJKpRSzgAZcs8jmUMsjDQN0F+CAD+DsPxYDDiPEjP324Bm8Z7tlUYm5dTePX9Dwx+3j5xtxq/yQ8p5PHiHSd6f1FZIvL2RHta5R2HOXcq/y5r3aXg82SOJbtFUztyce+4J8HKyPUsxKUQ8RgIQDKHtj32p+G1I8TQ8RF1CFz4ZQE9aFfJ6AA1FjXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q6H0lfBpnMS01eZK08cM5j6vIUNTK/4NsMndPyMJw8A=;
 b=KxoqjQ65Va46MGXw1ZaLW+WoNS/hieqRFzoR6VhEWsBuQ9j+d47zIJ5ozKENCr/k1YMTZE+qnUtARS6yWeCDCKCJhywoWrFLBYzdSDB/w+q2GYonqp6w5q/zUjPbVLuUrrZoJFTB8QVgDwe6LL6M8j7KRUJsZrhAj09Pu1cwqu0hhspGP1bE9NHdGmUv3kC43gBBbK68WqMPwmXXCXH5ojzELqSPZvZRolv36VW0yEsfHrvmF4xj3y2J8bs24Q8GXi18chZBmRUSXhVDs14v8I+5YXZC3+eJapRH9AS9c3uFj4FisNvYaetVPAVeu5JEy2vPTEb5Bhp5BOP8yurnYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6H0lfBpnMS01eZK08cM5j6vIUNTK/4NsMndPyMJw8A=;
 b=jdXn9/W7Uj9C2lbZrA2QnBcUXuVpdNcXL36BdEKJfIaohgoQs200XY0RGLzYnJ/dKUdLcik+knUM8AgowL1qpJ3WtK2jRYHgK1ADxH1uCb6wvEaCQxUBZyDvaQzAiWRzTmgFUcFesana+53D+NFVAK9s3S/NrB2wA3Is840p/AtqCZHozVQVaZ5u8HgLL9xPILO0VuaKE6rfCFhvym81ot/0ZWsIcHo+kuhDbEcC6tXJDUq/yXmQx9LPAPrCrDM7mJuUqroNjrmFLjB812ZUz0JiSo7TEr6DGeujUf++Qt/reBaBD641tlCBBobF5mAa9kXsAX4FjryrD6CVU1SPTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PA1P189MB3145.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4e8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.3; Fri, 14 Aug
 2026 05:31:02 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.004; Fri, 14 Aug 2026
 05:31:02 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH] rsync: upgrade 3.4.4 -> 3.5.0
Date: Fri, 14 Aug 2026 07:30:55 +0200
Message-ID: <20260814053055.35232-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0118.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::15) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PA1P189MB3145:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ff72992-ea78-488d-298f-08def9c53ab7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|10070799003|366016|1800799024|10067099003|56012099006|11063799006|6133799003|12006099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	It46UAko2cYgUgeZbDnsUYHS7UXwh3tjoALWkM0EEnlqzuLTbCjbKb6h+ZpYKVAYAlkqicYZ6n+y/kVnoa5mDDsPOnac+vprgRBOBZJxaTxgADdOUM7nPTFflj4VbgY3jGc4JqzbxEuL6R+mQHJIcVwDZYsGbYK4rEKvETyfip9QJzg/6mm3pe1QyeLrzC7ViB9tGGTsks1EkFpCzfb3l/7KWUfGhlILI+KWFtUJUguRxcF+LLBSvNoSweEOFdJMuDW2h0DrHPvJSy4zEt6idf9uu2oh0W0fJz7vZmdC62zdIurV2Qqpmz2r7sjwktSoLViBsQFpBkwVkR+K/H1MZ4wsy5Zet9GyRUEFC25PV30hfnDjhMJpPaw+LVi7bAaUGx8fQTHrOAZ9f+wYyPz1QTW3/hbxvBLImI4aWnmA8eitnB8CiN63LjVfJOyXoGXEMYZ6TRnMMcptq0D4VlWJGNNnbvJGB2ZiPF9Qu2uBJwwPnCKhQGD4JR+8Q3FI5rrbuwdotZOgVWzQn46MW749MhkOxiSXbK7By1nh3KrK71RImffw3WxdYDI7z9jU9JPt00cT8savPsn8QIYtt2T9I8K1oHdgOrm0jzPRXWTNy4z64QHTqp66YJn4qHht7JpeVJZ++Rs4R8dC/mvY8NdTKAgmak/0Ds4GMtoMocAhLEY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(10070799003)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(6133799003)(12006099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?R06Vq/deqiCg4hqWT5ogAvfBRW/Zx8QCVzUaniOPRIQDT071w78bzUlFniYF?=
 =?us-ascii?Q?Kvk0igx4QadnZtCRGYBU9BsDNiGJEzqNjVxpWUyZS8bU2w1EJlDrYF3cCN+I?=
 =?us-ascii?Q?AeI95xwihZSkP/HXU+8ptGGZFP2FOkDQJ50SYQvgtSC4My8eBULy4al57EXO?=
 =?us-ascii?Q?7HImJcVIZWRbdRvomrDXRowiEBe6+o9tVccBEoCuvRebvQuEf4P2k1InGD6Z?=
 =?us-ascii?Q?DUO5SSbmGi1GvFTXoF2W+ABBYhjJYYYKHsJEy1Jnz5BkNKzwVG7s/lmO0MOh?=
 =?us-ascii?Q?eLv3JjysApaQa1jg5m0c/osOw5EkQAOWZ3tLu4/p5g5nPvYqoBXAikNfTsdP?=
 =?us-ascii?Q?KcIlPRG8cwQ32Inn8JUz/ULoIcPjV0I/oGIB3Kotp33ELvt8h0u4gY4tO0SV?=
 =?us-ascii?Q?8M4VsgXw9VtDequ4Bax+IAbkzUFzRTx4EQ9DkLiGQY1xoU5Noe+rpJ/8Z4Oy?=
 =?us-ascii?Q?ROg4UiRsvY0jJFyfft5lDRr/UDXVzvpx0TbmSU+y2M4oXgtllTW6ebs9HXUb?=
 =?us-ascii?Q?RS2QnFO7MlYviOW87r2X2KOSdRImNHTRBe+elecsB9qog9obMHGhXT+kGArb?=
 =?us-ascii?Q?EYYR3ByrfGjKWUy7GrAwg1G9w5exJCqWnhTtqgEorQIwFQSPdpcRy+brLgJl?=
 =?us-ascii?Q?1Pu17PiDlUCam8SvhFlUFvJUEw7OdyirKSKtTf6BoEml7EyPWw2ELXaQf+iY?=
 =?us-ascii?Q?1PmIdtQz9pGxBTCBYsNTOU1m6IVluWF5zj05jU8eknz6F8WUPtj9oQ3JjyRv?=
 =?us-ascii?Q?R/7bRqg9fF/llk4KCvdDPh7labkuche6Nt9Q5EpDNGXFaZssN7QkaMSkY/kP?=
 =?us-ascii?Q?YsMeeR1YxMOURWt7arWKhMzwBA3DbRpLsO0jdTon6Cxv24JygHL65rIasXok?=
 =?us-ascii?Q?gaHBaRojk6+dKaCgwXwFolarMBSu4MNxP4aurFOZKcX+DmYK3zo31ZJK30qp?=
 =?us-ascii?Q?DeEAfmyMXydLlCwFLnDQMNq2pVoh0SKVFgtV85iu9ZX8rdhLrxLQRsid/fX5?=
 =?us-ascii?Q?gpZzxeFPOGO8pJUDC+IHj3VFowyFAwbxPzyB0RresMNfvIvsuxDFwVaqJyxx?=
 =?us-ascii?Q?sjN0UcjDx5xI+NpFWSLZozntEGEUilwjJcQp++YyzHTNlaiSYumct2MpbsK4?=
 =?us-ascii?Q?JqPbGb1ZLQyMbnnWrGDILXcQcDNAqIageen72QNXXqT7hD/XHIkSM7bwcuko?=
 =?us-ascii?Q?Y1QCDS2HGBYj2gERyWJXLopF13gBnyCpD6M77YHt+IXj1nA3bCA5xVeIY6LH?=
 =?us-ascii?Q?1ugKsNng1qVi42VkLB+Tgtv/XLEQkZf3xQ+7RX/sqnmYQfmQgSykT6WLSzMl?=
 =?us-ascii?Q?pks98RbupeYFJN11FQvZy8K/rsfKDfXedmw2UYpM111g8jZrxOaItzVxMsbx?=
 =?us-ascii?Q?vdFImxkCbC6brt1p/JhlpGjwaxaOZpfKDoWV48jSNQlsACnUAw6yCBtHrzN4?=
 =?us-ascii?Q?OpoCKeN5nJGtMFvEZNEbO3BxicELLurs3p/QtCSKOZMnHC32kooSYwTbYBCz?=
 =?us-ascii?Q?FuJWnWfhiDZHFlWeK8kleRqKvF3hXyO5ED4QLEuH1hs8pmSoojFKBSzgKskT?=
 =?us-ascii?Q?Iya/ivo8C6za11+teQqQd8q3kyY/nlKeV2AOFwNqoGu4sA/+ZIfxzqiqmW6x?=
 =?us-ascii?Q?KuIE45FVEtLm/YYZ2OR6WW13nbEaQnhtbYGsXd03Qvm/QJBijkClikgBIREn?=
 =?us-ascii?Q?9yN/R4Mc4Qm3dDCj3ckFpwv5Ieefkc6nUVn5qQOyR2b1hBZPJaFdKH4I4r37?=
 =?us-ascii?Q?AOGnE/GBXCbsKLRx4GNw0425OYsiZZcGP1ANNw4tJLn1lLrC8k66r0N5oUB9?=
X-MS-Exchange-AntiSpam-MessageData-1: 5lvDHwGhA89/exnrzDfkJKiDK8e8+IAy8Lk=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff72992-ea78-488d-298f-08def9c53ab7
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 05:31:02.3117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kOnESa86jF/4Q8+M2jnShfy2XVuBsZK/+apCf2P0SZ5LiHEO8WuyBFnHwszeQ7WpYEEgbSRjsvNIaXujAvQMHbpdYtIAj4BchEaQE9euGYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3145
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 05:31:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243404

NEWS: https://download.samba.org/pub/rsync/NEWS#3.5.0

CVE:

CVE-2026-53802
CVE-2026-53803
CVE-2026-53785
CVE-2026-53784
CVE-2026-53793
CVE-2026-53795
CVE-2026-53796
CVE-2026-53797
CVE-2026-53799
CVE-2026-53800
CVE-2026-53801
CVE-2026-53783
CVE-2026-53786
CVE-2026-53798
CVE-2026-53788
CVE-2026-53789
CVE-2026-53791
CVE-2026-53790
CVE-2026-53792
CVE-2026-53794
CVE-2026-70461
CVE-2026-70458
CVE-2026-70456
CVE-2026-70457
CVE-2026-70459
CVE-2026-70464
CVE-2026-70455
CVE-2026-70453
CVE-2026-70452
CVE-2026-70463
CVE-2026-70460
CVE-2026-70462
CVE-2026-70454

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...g-prototypes-to-function-declarations.patch | 18 +++++++++---------
 .../rsync/files/determism.patch                |  4 ++--
 .../rsync/files/makefile-no-rebuild.patch      |  6 +++---
 .../rsync/{rsync_3.4.4.bb =3D> rsync_3.5.0.bb}   |  2 +-
 4 files changed, 15 insertions(+), 15 deletions(-)
 rename meta/recipes-devtools/rsync/{rsync_3.4.4.bb =3D> rsync_3.5.0.bb} (9=
7%)

diff --git a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-=
to-function-declarations.patch b/meta/recipes-devtools/rsync/files/0001-Add=
-missing-prototypes-to-function-declarations.patch
index ede0238b2e..5aed93e458 100644
--- a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-func=
tion-declarations.patch
+++ b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-func=
tion-declarations.patch
@@ -1,4 +1,4 @@
-From c05cc113f925bda645c8e51b83e9dc30b0543bad Mon Sep 17 00:00:00 2001
+From 64e62c659649593239ed39ed40a3ae689bf2d593 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 29 Aug 2022 19:53:28 -0700
 Subject: [PATCH] Add missing prototypes to function declarations
@@ -24,10 +24,10 @@ Signed-off-by: Archana Polampalli <archana.polampalli@w=
indriver.com>
  4 files changed, 4 insertions(+), 4 deletions(-)
=20
 diff --git a/checksum.c b/checksum.c
-index 24e46bf..6ae3178 100644
+index 4c91c2b..b3635a0 100644
 --- a/checksum.c
 +++ b/checksum.c
-@@ -778,7 +778,7 @@ static void verify_digest(struct name_num_item *nni, B=
OOL check_auth_list)
+@@ -796,7 +796,7 @@ static void verify_digest(struct name_num_item *nni, B=
OOL check_auth_list)
  }
  #endif
 =20
@@ -37,10 +37,10 @@ index 24e46bf..6ae3178 100644
  #if defined SUPPORT_XXH3 || defined USE_OPENSSL
  	struct name_num_item *nni;
 diff --git a/exclude.c b/exclude.c
-index 24de64f..a787488 100644
+index 7476f6a..b939a0c 100644
 --- a/exclude.c
 +++ b/exclude.c
-@@ -363,7 +363,7 @@ void implied_include_partial_string(const char *s_star=
t, const char *s_end)
+@@ -460,7 +460,7 @@ void implied_include_partial_string(const char *s_star=
t, const char *s_end)
  	memcpy(partial_string_buf, s_start, partial_string_len);
  }
 =20
@@ -50,10 +50,10 @@ index 24de64f..a787488 100644
  	if (partial_string_buf) {
  		if (partial_string_len)
 diff --git a/log.c b/log.c
-index b948f16..afca81d 100644
+index 889b57b..19e5e98 100644
 --- a/log.c
 +++ b/log.c
-@@ -131,7 +131,7 @@ static void logit(int priority, const char *buf)
+@@ -140,7 +140,7 @@ static void logit(int priority, const char *buf)
  	}
  }
 =20
@@ -63,10 +63,10 @@ index b948f16..afca81d 100644
  	int options =3D LOG_PID;
 =20
 diff --git a/main.c b/main.c
-index 229a889..aa158ad 100644
+index 6050d0e..45722c4 100644
 --- a/main.c
 +++ b/main.c
-@@ -246,7 +246,7 @@ void read_del_stats(int f)
+@@ -250,7 +250,7 @@ void read_del_stats(int f)
  	stats.deleted_files +=3D stats.deleted_specials =3D read_varint_bounded(=
f, 0, MAX_WIRE_DEL_STAT, "deleted_specials");
  }
 =20
diff --git a/meta/recipes-devtools/rsync/files/determism.patch b/meta/recip=
es-devtools/rsync/files/determism.patch
index a8fee5ba0a..2eea267bb2 100644
--- a/meta/recipes-devtools/rsync/files/determism.patch
+++ b/meta/recipes-devtools/rsync/files/determism.patch
@@ -1,4 +1,4 @@
-From 32852028e95cdf78d09f1bd867f3b46b4728f9e3 Mon Sep 17 00:00:00 2001
+From c4c9b52a864c3b9ff67771b9d881a78276448100 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sun, 21 Feb 2021 09:45:48 +0000
 Subject: [PATCH] rsync: Fix a file sorting determinism issue
@@ -25,7 +25,7 @@ https://github.com/WayneD/rsync/commit/d3085f7add38a5cf83=
3a0b31cb0637ff46c80f8d
  1 file changed, 5 insertions(+)
=20
 diff --git a/Makefile.in b/Makefile.in
-index 0ba2d5c..b9c5438 100644
+index 91807d6..c18b4be 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -27,6 +27,11 @@ MKDIR_P=3D@MKDIR_P@
diff --git a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch b/=
meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
index 914b50a7b7..4ff070ea3c 100644
--- a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
+++ b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
@@ -1,4 +1,4 @@
-From 50ef5ccd9149cee27bae29e767ff1c2e76bdc879 Mon Sep 17 00:00:00 2001
+From bab7abb3c7c1c1db8ef6c3084c1ffb5152f5bf1e Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 12 Apr 2016 15:51:54 +0100
 Subject: [PATCH] rsync: remove upstream's rebuild logic
@@ -13,10 +13,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 54 deletions(-)
=20
 diff --git a/Makefile.in b/Makefile.in
-index 79060b3..0ba2d5c 100644
+index 801e864..91807d6 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -200,60 +200,6 @@ conf: configure.sh config.h.in
+@@ -265,60 +265,6 @@ conf: configure.sh config.h.in
  .PHONY: gen
  gen: conf proto.h man git-version.h
 =20
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.4.bb b/meta/recipes-devt=
ools/rsync/rsync_3.5.0.bb
similarity index 97%
rename from meta/recipes-devtools/rsync/rsync_3.4.4.bb
rename to meta/recipes-devtools/rsync/rsync_3.5.0.bb
index fa9a61778f..d9a4884d96 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.4.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.5.0.bb
@@ -16,7 +16,7 @@ SRC_URI =3D "https://download.samba.org/pub/${BPN}/src/${=
BP}.tar.gz \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.pat=
ch \
            "
-SRC_URI[sha256sum] =3D "bd88cf82fa653da32314fb229136407c5c90f80d1758d8f4b0=
91767877d8fa96"
+SRC_URI[sha256sum] =3D "c7ffd1ef653e99540f661e47cb00b7f9cad1ee6b972399b16f=
93d672656e0d33"
=20
 # Out-of-tree builds don't install the documentation currently
 # https://github.com/RsyncProject/rsync/issues/846

