Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BDECC5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 18:10:37 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.15])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156.1787249436068673416
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 11:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=GNcgps+V;
 spf=pass (domain: est.tech, ip: 40.107.159.15, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XppmqcSI7bX1nb7YNrSI3mBp2RmAiSwRBN5VUCJdGG/NV5EN5WpKySdaHpqiOn0xmmGZ9HqsfIkLEts++xkjvuh2kSVLvG5r3I1rrdA2qJnm7jQ/niT8IqVLsrHN6HSvI2SfWQcY7CJCvxe4qmYWGspxMAU7TTzShyl9TejQc/j5GOXs2CWGmYkCWh/GciV0pE571kRZX4p9hBKbFC8+XLINmxjo2mXq4r+F1a+22f1uWGSQ3fuiKtKZQnFJ6uOSsuV+G/rKIYriXkGMUKfgmDvrUoQqvHRbkc31h7bCRbHevZpVfyxYhoRiqYLOy8/8ofYc7ZPVfGfKNTTx0sHGwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnpQqhiTijQD2viIb0eklZ9CPeDOsOv5Wm0kLohqvzY=;
 b=LnevE/sxCnjcmsff9oSN0jBtIvuhkEvZNvdHRlv2oD1tYoRTxAPQeapp0Yryy1YRCyVoxhrnG39pv29naFG7yCJxE5Yb/Y1RVdyHQ10zZqEMmrN9+6jjvKoqM0Teu4QeqVaLIZBDoR1InRe+cA8zyl4U+Hbkid0ZD96UssZ8fCjPZMIHkwi68yrrppfLGpMTfeQAFG882loORErM1BPbiQoP33vTdPksTB9HGFAa6wP2MKzKnp1lnGVw8D0Z6Jd6n/tPFBF0NH22CP0vr5fk/DPt7ediosKUnWL3mwGrsbBy6+ZDGo3j7TQ5jEkzgjGNaSPD0XfseFJZ9tHjYOF6sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VnpQqhiTijQD2viIb0eklZ9CPeDOsOv5Wm0kLohqvzY=;
 b=GNcgps+V58zwWXug71+VJ9h+C6wVeIv/XVIv+72slfFXVLnxR2iHkx8UNLalGT+bX5VGWv1azOuJ9Wj1J1W6Tv6EbIEK5eJaIZwElxIg508Z42cjlwJjpwUbehM30hNteH6wZgTfeTrmiYjSdqoXLNTQGGy8OWnvka0vD0TW1r2uO0s6qEmbx5Lad9h8uQIFJG8EP/ncUrFkXJ2OKGRyu/a+osWMmAuyzJlTMP/bkTWkSqv8ABdWCAJun8EaUemEXSolSDjXIN56gDPZY2bfSAMrzDL0LwpGrH5As8bUuMI7uhf5CMryW8U2wOkdtAE1mwKCOM8SMY0O19KMPzuNvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV1P189MB2954.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:263::18)
 by PA1P189MB2702.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:452::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 18:10:33 +0000
Received: from GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
 ([fe80::a7e4:7d5b:ab4a:4b96]) by GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
 ([fe80::a7e4:7d5b:ab4a:4b96%4]) with mapi id 15.21.0360.003; Thu, 20 Aug 2026
 18:10:33 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [RFC v2 4/6] serf: fix build with OpenSSL 4.0
Date: Thu, 20 Aug 2026 20:10:20 +0200
Message-ID: <20260820181022.44434-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260820181022.44434-1-jaipaul.cheernam@est.tech>
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
 <20260820181022.44434-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0019.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::24) To GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:263::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1P189MB2954:EE_|PA1P189MB2702:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a150a20-f4df-496c-315b-08defee653c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|10070799003|23010399003|1800799024|376014|10067099003|56012099006|6133799003|11063799006|22082099003|18002099003|13003099007|4143699003;
X-Microsoft-Antispam-Message-Info: 
	jPp9VjBaPX1b1ccm8mx0zKDauB6BeiiXlwgRRPZlOY3mhuK72KV6LDxXBRKLCP1zybaWWHXDoD+6rEy+6mIgV+qp0GI6cleO0tBpw/CwzdcafJMD6pRmibtDVWvN2v2h1xh1itsY9yJ56rrQuLgUNQ0VdCH4uvou9r0fEPvVOHK3wBFaD/X4JsZ21QqyE5eZsbR5YZJ0JrsEVlxjK7v+qfSWJtGY4y3Ou0ZcTIDQKCk5TZXGLyYjOR3590+RyOXCCJvG7CDC+EBp3U/yAfd8xWq10RzSgv6HBV0PmpzRUOQtKuGIEOJZwAwXelZu11jlVqvHnh5CpSSDOx4slBiQFKThbZUZ8dI20nhyNJLxrX65QSzYfI9K9ndGFNK5Yes823jCZfR00qlN8pKXx8D5q1NeM4KpsY5sVawy5Pd+XPhAUKaoUt6tLqob74Cx5l14lcQhFfbjsy5QJxIiqiw0WlmdRLziFvRcs3CvFSCHJRB1ufPup3QPHBxLDUMPrXC6aVOp5WBuFxHUkUxRBZVbFm9RDSoTWR1pNm7XRiXKV5+2cTEE6IkSxektZ9PrP5rjYS1kWWDtgdxHG62NwEvvAz8T6nzR0N9101e3WomG8ueudkfC3C6LfTYRPvqDnDB81RZ2D9VQNCcTxO3G+VN5qwo7N2eCDo2WUseJ+F5Ow7c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1P189MB2954.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(6133799003)(11063799006)(22082099003)(18002099003)(13003099007)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?USljKbNMetNWpoAWUayBs+7hxVAc2xOV0ftLRvXVoypgUy6JazVAZY+yv3bd?=
 =?us-ascii?Q?SXTWoD/RNQgmMzIEUwdfSXZoGBgJrLAFu8djMBq3oTWUS4XcY8VpdwOkg4Db?=
 =?us-ascii?Q?PdvoBLAI4Sbua9YULt255i0BLCBXhNhsJpDuTo8CZzKLNt+tX2wjHYVtieiR?=
 =?us-ascii?Q?GUP35aqo+nQyzjJIVe7jECbHueGeU4Qbd63AJI4s/PMzbonIOoU2SyeADnLb?=
 =?us-ascii?Q?gvESrwZWyzUv4EMdOK1OBY5gr8J0htoZ+jkZhXrv6IRg53wIOuH1hJjGQbr5?=
 =?us-ascii?Q?BF6x4kqGlgMJoC8a8cqkCWeKs32epPclTxZmrK6WcRwavbx24MmNbLWwOQzd?=
 =?us-ascii?Q?Kq6dxTZ1aZtYkQPH3NMJS3O+IyrV4EXbBEPuusRvyVpZwUJgBgcddD6BTC5x?=
 =?us-ascii?Q?v8QqeySBDqAtUrUJr4vtVs/NmUu7hFCE8lmpILCuQnPXOOoGCZB8y14ecb5t?=
 =?us-ascii?Q?45wu99rtSMUgn7WF1tOHedABOpSVTZ86e7nZgK1uEXaNs4GvgXv+ccRAvetV?=
 =?us-ascii?Q?lp17lttJER2s0TJfMMbcLh5rE9mKezGPDH5ekISPIvcDxdoE1Dc/+I9PTJOl?=
 =?us-ascii?Q?u1necfVReq9yrGVrMvbpcoIEwD9YJGoFK+ArbzcYSk6R/RqTQ07aevtGHu7f?=
 =?us-ascii?Q?+wwtwBPIi2bIM+cEOUTaMQPTkyIojeW9FNsS3guOCnspKlm1pRFcoO8JD4AW?=
 =?us-ascii?Q?BC6ZtT4TK/kJHjIQvqH5KLjXzptgTmkCujBS0gg4+vUOUrsF8ch2HT+Gmt6Q?=
 =?us-ascii?Q?5FaEkN/Vas+XaEdky8XSBW0x82sP/JkcT9Dr5P1vewVfEY+BWJPo15hGbkMX?=
 =?us-ascii?Q?Az2JHN5HwQPcVYIBR/ctSmE6iDqFBgko8wov9VklFfR0am47cupPtZ8izOZk?=
 =?us-ascii?Q?Zc5MmHNgvt34eYo2vJDAOtpx2cf0FD5S2YRXA0PVXmGOtWEsI8ulpVdJW1uY?=
 =?us-ascii?Q?tfCvlJ0ytpKXsob0PaIL85M3WhljkxXnKm7Z6P47onS9/fnL7KSdrebOac0L?=
 =?us-ascii?Q?ltw8vBpQ60woukjj26cTlqG8aS7t4wH/zZf5biD28D0uJHd5Ex7q2h/EIq7G?=
 =?us-ascii?Q?n9n3IZa4J24u8qg3REZfBKXu2GuL32XK8f+l7UxBJsSiu+qCbwxfrOt0hvDo?=
 =?us-ascii?Q?IrUGWT+6ektiL77XxCknL5dRBI4EXc08V+Qtf5oEIF18jV+yDhjkT5ro7Ig2?=
 =?us-ascii?Q?DGGswvC1pRgKRYkaYBf+DRintQLd2+JI8IWOJZ+v4aAH/myXLgGqSrl5NfOi?=
 =?us-ascii?Q?CiQhHAe6d2zkL3uSUr0XyYb5UIdS8nZ7h3TW9clRum3wbiGmGdjFw60arqAB?=
 =?us-ascii?Q?+PQ5jzU/K1ax6fLw5EmQDZiAXf932F0y9mpbktCx9vSX61EqgE3O9zVUo358?=
 =?us-ascii?Q?ddrHpHET1OaYDkoBqGx0f930ttgNVfXySZW1DhRp5YellHPt1YB+aur9TaZO?=
 =?us-ascii?Q?xKqNlAeNL+kpiOrdvtvBHLEi06qLv/B4VUunGf6ney2P0J8FrXSeYWpPgNBp?=
 =?us-ascii?Q?AxIUUIhUeJwYnal/MJjmrj0KC/tDkdNF3N2gnuxlMt2HUCOqIO17NFqjIDxw?=
 =?us-ascii?Q?aBMDF8zoqDnHPW7quzflDIZKlPSnnqss093FIGXiKGJYLShDjArji2GdR0SM?=
 =?us-ascii?Q?zZ5n7xHdAFly2Wd38bfHJ+2+YA1Yf48HCXi7FwhmBDZnRgMMKimAXfVLspmK?=
 =?us-ascii?Q?AtCyYLPjgXVpweY2kUqmHZRCh5rRhQSQBGz6EJuuDtqMdj+flAK95FvdX13y?=
 =?us-ascii?Q?+RjYs/WTU/OVEMCEaZ7qWg8Sy47gfqFGlwuF9LAG/Epgb5tCKOTIDSexNS12?=
X-MS-Exchange-AntiSpam-MessageData-1: chXSuRbGWwObUOixzilITaorLvyP0GzHgVE=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a150a20-f4df-496c-315b-08defee653c3
X-MS-Exchange-CrossTenant-AuthSource: GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 18:10:33.5792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iyAjQHUztvkkdWVH1XndXXTQrVwWd1z4XE0iavQR6bKKB44fqAMBB679g1wGfPRSQg4a/X09HPYf3/ItS0jbWGJDdM7ldlxu7rbJ6H+erfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB2702
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 18:10:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243878

OpenSSL 4.0 made ASN1_STRING opaque. serf directly accesses
nm->d.ia5->data and nm->d.ia5->length which is no longer allowed.

Use ASN1_STRING_get0_data() and ASN1_STRING_length() accessor
functions instead. These have been available since OpenSSL 1.1.0
so this is backward compatible.

The fix is already in serf trunk (r1935023) but no new release
has been made.

Upstream-Status: Backport [https://svn.apache.org/repos/asf/serf/trunk r193=
5023]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...penSSL-4.0-use-ASN1_STRING-accessors.patch | 35 +++++++++++++++++++
 meta/recipes-support/serf/serf_1.3.10.bb      |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/serf/serf/0001-Fix-build-with-Open=
SSL-4.0-use-ASN1_STRING-accessors.patch

diff --git a/meta/recipes-support/serf/serf/0001-Fix-build-with-OpenSSL-4.0=
-use-ASN1_STRING-accessors.patch b/meta/recipes-support/serf/serf/0001-Fix-=
build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch
new file mode 100644
index 0000000000..2392cf1dca
--- /dev/null
+++ b/meta/recipes-support/serf/serf/0001-Fix-build-with-OpenSSL-4.0-use-AS=
N1_STRING-accessors.patch
@@ -0,0 +1,35 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 13 Aug 2026 11:52:00 +0000
+Subject: [PATCH] Fix build with OpenSSL 4.0: use ASN1_STRING accessors
+
+OpenSSL 4.0 made ASN1_STRING opaque. Direct access to struct members
+(->data, ->length) is no longer possible. Use the accessor functions
+ASN1_STRING_get0_data() and ASN1_STRING_length() instead.
+
+These accessors have been available since OpenSSL 1.1.0, so this change
+is backward compatible.
+
+Upstream-Status: Backport [https://svn.apache.org/repos/asf/serf/trunk r19=
35023]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ buckets/ssl_buckets.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+--- a/buckets/ssl_buckets.c
++++ b/buckets/ssl_buckets.c
+@@ -567,11 +567,11 @@
+             switch (nm->type) {
+                 case GEN_DNS:
+                     if (copy_action =3D=3D ErrorOnNul &&
+-                        strlen(nm->d.ia5->data) !=3D nm->d.ia5->length)
++                        strlen((const char *)ASN1_STRING_get0_data(nm->d.=
ia5)) !=3D (size_t)ASN1_STRING_length(nm->d.ia5))
+                         return SERF_ERROR_SSL_CERT_FAILED;
+                     if (san_arr && *san_arr)
+-                        p =3D pstrdup_escape_nul_bytes((const char *)nm->=
d.ia5->data,
+-                                                     nm->d.ia5->length,
++                        p =3D pstrdup_escape_nul_bytes((const char *)ASN1=
_STRING_get0_data(nm->d.ia5),
++                                                     ASN1_STRING_length(n=
m->d.ia5),
+                                                      pool);
+                     break;
+                 default:
diff --git a/meta/recipes-support/serf/serf_1.3.10.bb b/meta/recipes-suppor=
t/serf/serf_1.3.10.bb
index c6b51452aa..fd3560876b 100644
--- a/meta/recipes-support/serf/serf_1.3.10.bb
+++ b/meta/recipes-support/serf/serf_1.3.10.bb
@@ -10,6 +10,7 @@ SRC_URI =3D "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2=
 \
            file://0002-SConstruct-Fix-path-quoting-for-.def-generator.patc=
h \
            file://0003-gen_def.patch \
            file://SConstruct.stop.creating.directories.without.sandbox-ins=
tall.prefix.patch \
+           file://0001-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessor=
s.patch \
            "
=20
 SRC_URI[sha256sum] =3D "be81ef08baa2516ecda76a77adf7def7bc3227eeb578b9a33b=
45f7b41dc064e6"

