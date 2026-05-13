Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97BDDCD4851
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 08:28:19 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2828.1778660890818167848
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 01:28:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=XIHOlzV9;
 spf=pass (domain: est.tech, ip: 52.101.65.66, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yCZsqmwQcPZ4jf1wyHtw+7GNW/dSqdt8AP5BEHw8zL6Tuu1a22itCzpin+pgvX14eub+wmqyZaZVpBqvaA1NhKXjZc8MKK2hoh41j4gta7O8wmG5ARTFxgWkTzmrhXNSfkko9DnXmq5tPUPKdbpd9MoF1LkBe9TxVJmvEq3yzHnWq544z85A7jG7uG0XVQoaHjBsfnEjAzCGOCrl/SNzGaxwfyyNLc5ZQJ9dCEXJbbBBirzWFdCmMIzVIDzLcjU3cq4WvwhNlht0LpNte8UuCX2p3StNyrEk3OLK8FNyAIzePfGjeKTSIJQf4WUCKXMo/M4l5nfJQqElQtL/RiKjHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTJeZtl9uWfDz0GxJd0s2+Pm0zTBbuelOugISumP1rc=;
 b=WlWIvANLujCzFNoQy/CiMWsDg1YpJk5T2BmfPkXD72rLAgQqoartPNNTstY/WeMc81mn5G/MEgRIdQf612ygTlbgnNSEvMwXkA8el+87NA25+rC2gx/fbwPUi5e7eMDUESo/uYHAOOt0+0JqgBkp/qg86ivgVbfvqRDdGaPiraFO1W5r+WMMDPNDH+/4aOUJ9m6QIOuxpJtEjZj6gLR/6tA4UXFAq6rh+vW6JUL8b1LLQGz/h1YIL4pmqyZVkeQmpLb4kvIyKox9UgPc+uXH+gjuf4RgZY4WWhS8wVODTfEr2xXJ5skJ2Nwvt6NV94G2I0iBG9Gf2qd+0EolEHP5TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTJeZtl9uWfDz0GxJd0s2+Pm0zTBbuelOugISumP1rc=;
 b=XIHOlzV9EZynvQq1xagUwbsZdE1gxslTHcmjkICqMvGFWbPgSp/Z6mfrCYowt422cOwajnvrWOjWEmJ6Ogr4CRIi096lgRq5/1ElrDWPh9uV5twUPm27h29U9h7n6sQOS/w6efiO5aW/4TSsBSK0ff6usebW1LiSjh7yawhMBZFnPDOyztOHrkB0bqJ6fXZ5CUsEUw3KiLNVN08Qy946ObfJhILweLR2vOHmshWNT23F6IVQAudwSyEP1SiVbpcrJVlT9zuhgqIeGaIHGq2ci+B/1jlA7fyieVqyBSlxd6t0a8bEh5M7EmgtLMeNLciFgs3u8WYS2L9BxQFIiSV5YA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by PA2P189MB2635.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:40a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.17; Wed, 13 May
 2026 08:28:06 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%4]) with mapi id 15.20.9891.008; Wed, 13 May 2026
 08:28:06 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] libarchive: fix CVE-2026-5121
Date: Wed, 13 May 2026 10:27:23 +0200
Message-ID: <20260513082757.18831-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0280.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::15) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|PA2P189MB2635:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e8ea725-be0f-478a-9c3f-08deb0c98ecf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|13003099007|12006099003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	tm6R6aGbDBAQ9WTCA9cLcrr+IMYfo+epdpMbR1gs/cc6lJbMRT6wPD41Q5rzCNjrnlTrZqQQawWFsa/joRAOP+4vVP0ElUR/AY8UFq8u5ZcpRORUYBWq8jubcs9EZByMlk8o2ROqm/svDEGRuLnn1YiIadow+Uv3VflrkKbzIp9g5iO563RTG1mTULfjRu60LS7yQJqo0d9jPelqCAmRX7x46ZdAEmmp3nB3i7nKEUYcRiTUezOyWUszQiuAylic7ZN/ZJwcfC+849y+j8Uf68SNDY2lUvXdsMp/wzCYhHI/zxVCcRH3RNdJDRVrAF0on+R4EHzSCAPoH3asNps+Q3K0y09G6qOtr8DcctFQXh4eVWCChz3Jabv5GbztZ6Kas/0zLo8CPmMmJyo5mjQrstlNZKJcgtxcbI3tHLjaGsBaZ5HP2E3K5tKlSOq2tEQHSb639GN6u8+bKGJOtdto48lDP7q847EalnRPJtGPq3eqwROsJ3PfroYyyKmEH525aSe3KYpUKvptXLur1m+9RaOeqK03H+Wa5BWuih2hBxBlrmWqOclIFWz6ubLJp6wkJC7ZlG5tUuF0TrWI12QD2xBt/9qG7LkZFHtEO/G0URibbBj9cgq3JnhypUMkTlJkncc9TmuY7ZYCnvb7ptIHMQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(13003099007)(12006099003)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qTxREe84tOF9zRRmC9y3cVh3sxEQSmKffKZeOoSCWIyf2JKDPqDbBpTIoMox?=
 =?us-ascii?Q?QqsNyWUA+vI8acSmgsH01+0EAuMmOLrJN2q8eKO2ez6lvglxzuuWlfosfTqm?=
 =?us-ascii?Q?XUdpgSPjliLeEpAneOhN8AJi6vr8AjticnhZRKKhdcKosnqfCjJsuxMrvZBw?=
 =?us-ascii?Q?0FFN8VxELf15VY0AaS+KrQq9XTflb7dh2RZ7LjnCZMhC45ENu3Y4spenlxju?=
 =?us-ascii?Q?jbV0PHk1+m3c54D2HOMtJNWuxgA7drSL7t5rLo1UsgWuX0NA9CDoef01rBVK?=
 =?us-ascii?Q?Qb2haxJNfYMSCYIZv+S2au4bhDmo+56H4i1j4uxdW6ABEAzgIQ2yc4F6QvwM?=
 =?us-ascii?Q?usajw2wRKI4nhtdkCmHlj41AFwrBUVHsoAjJPTeMovclC8uqUK1ChR3Gh2dc?=
 =?us-ascii?Q?PQ5KJ+vjlb1WSOO+y36DV4aK1q4rXlxMz44WlYI9Mq5V3zk5JdMz23uaLYAS?=
 =?us-ascii?Q?nQZcE0uLnkwitqwbkPyx8f3IpaF2fuPoP0znSI5HWXqvIX+UlWQGAT5GCjO1?=
 =?us-ascii?Q?qkeyMerEuGDtgATfwBjNaowsfZtsZ/uzqFGFi2MTf+wMXuQjC6rf77zW6L3P?=
 =?us-ascii?Q?aGbW3p4svHBOwQcp5ZBRpyOMumCfwwUAnC6KoNunQg9+aGvJFUbw64k8vlIk?=
 =?us-ascii?Q?836FuW8IXfjK2HDlHhYkMRNDS6EopKEiYDW73ryhCvx4MXaqyUWgVIwpYg0m?=
 =?us-ascii?Q?6ycDDrqx5HhGEM1ZGcXPk1d8ps+Nj1sJ18m8DusPaCLJBNfznRE4bVzPleZh?=
 =?us-ascii?Q?/zVOWccBuRFVI0LxkI3GBau/wzUesqZfhZfSmQNBBYQmU0gUFPkve1RZxPuK?=
 =?us-ascii?Q?iOaFiCXN/FggvD9saQGV5RLcSzqfKJPtpfGsYjn2bjL99+kG4lpeCjyz5D1A?=
 =?us-ascii?Q?ND8738Mux+Y23Yx9mrSguJcJ7UPS6dWdyZl34e7132QWwozSAAtxZ3cKDyBV?=
 =?us-ascii?Q?YIMGmfgyJOs9HwWX4qDIWwyU0znIG9/fkiGkkbtjSQDCw5Q2FljxY66f4wZ6?=
 =?us-ascii?Q?5HTHP56umzmKa61QNh2LMddw25A0VCpuQ3lLDRBbMh/WzNnd2kh2KydYFdCN?=
 =?us-ascii?Q?BXnpWZH/a976qbDZmCrH+mFdp09+j1eYZu7QJiYwt7QDehZvGnyL5ZDVW/gP?=
 =?us-ascii?Q?UNi+6cDIc1V0ABM27cWdqkODsWt+A890trhNA+jnHXZCFUx45WlfEhk3osdu?=
 =?us-ascii?Q?kzPg0m0IrjY6Ny3cBd6r9Ss5BMGtmsSivPhyl2AkeczSIAvznt8ktbUV7lxs?=
 =?us-ascii?Q?h4XWxhaaPUUn4VWgop8TDX1il0HarLAbjqLcXmRehPcbv0QL/+7VqGRv97px?=
 =?us-ascii?Q?Qw8/WXB9ohAdbu4BD1O5MEp35Ndguxy0eMF0ceekQndEWNnLzuriP99Xm53U?=
 =?us-ascii?Q?I7od1QO2PMXoeh8TFwhynbLvPcKbuQlgtwvXH5cYjvQjj1Wv+SCHQhlB0Jw3?=
 =?us-ascii?Q?czZbzEfcHBc0dls3GkwzVgGy4w5TnCZtfsOTGKsnVIDhD09LOAmAtt9S+n9C?=
 =?us-ascii?Q?+IGwG2xKmmg0a6g22agQbdvMGHqS4LbrC0yvE9Mcd7/fUxlIwdtphKCK5AyO?=
 =?us-ascii?Q?s20i+iHQrAmdkbhWzSFoIvcRPq0mXUFO/58eSSHjLpT60LAxGC6VD+zTaIlF?=
 =?us-ascii?Q?ZQ7R5bS7Hd60wxOZDk0s5w9SdxVPShVzmyn4EHgC1+SiMHY/U43VNkDbic5g?=
 =?us-ascii?Q?GloIo2TGBcypQKJbJ0cdeocYoTWR4LOulPWHcxM7n9vSqhUorqNuZcIuO602?=
 =?us-ascii?Q?dg5JcGGAMFIuo8dtU9LTVQ/EYxe/Tlg=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e8ea725-be0f-478a-9c3f-08deb0c98ecf
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 08:28:06.4780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ZlyDJ6c1gzZmaWANQzlIK49XMaAl64AdbaW30qWD/GeWDdTJ1R/DvKBo26YyMMBZ3XG6Z6m5ShaTqN3o2coHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2P189MB2635
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 08:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236948

From: Amaury Couderc <amaury.couderc@est.tech>

Backport patch to fix CVE-2026-5121.
https://nvd.nist.gov/vuln/detail/CVE-2026-5121

Upstream fix:
  https://github.com/libarchive/libarchive/commit/071e2e1c5981372d40482995b=
a83c98c8b595418

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
---
 .../libarchive/CVE-2026-5121.patch            | 46 ++++++++++++++++++++
 .../libarchive/libarchive_3.7.9.bb            |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-51=
21.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2026-5121.patc=
h b/meta/recipes-extended/libarchive/libarchive/CVE-2026-5121.patch
new file mode 100644
index 0000000000..3f922d7864
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2026-5121.patch
@@ -0,0 +1,46 @@
+From 3d8e0f60c5a522ebfe0f967448bae7d1782edcae Mon Sep 17 00:00:00 2001
+From: Tim Kientzle <kientzle@acm.org>
+Date: Sun, 12 Apr 2026 14:51:56 -0700
+Subject: [PATCH] Merge pull request #2897 from
+ ElhananHaenel/fix/iso_zisofs_undefined_behavior
+
+iso9660: validate pz_log2_bs in parse_rockridge_ZF1()
+
+CVE: CVE-2026-5121
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit=
/071e2e1c5981372d40482995ba83c98c8b595418]
+
+Reviewed-by: Daniel Turull <daniel.turull@ericsson.com>
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ .../archive_read_support_format_iso9660.c      | 18 +++++++++++++-----
+ 1 file changed, 13 insertions(+), 5 deletions(-)
+
+diff --git a/libarchive/archive_read_support_format_iso9660.c b/libarchive=
/archive_read_support_format_iso9660.c
+index 7d3655a9..630efba2 100644
+--- a/libarchive/archive_read_support_format_iso9660.c
++++ b/libarchive/archive_read_support_format_iso9660.c
+@@ -2756,11 +2756,19 @@ parse_rockridge_ZF1(struct file_info *file, const =
unsigned char *data,
+ {
+=20
+ 	if (data[0] =3D=3D 0x70 && data[1] =3D=3D 0x7a && data_length =3D=3D 12)=
 {
+-		/* paged zlib */
+-		file->pz =3D 1;
+-		file->pz_log2_bs =3D data[3];
+-		file->pz_uncompressed_size =3D archive_le32dec(&data[4]);
+-	}
++        /* paged zlib */
++        file->pz =3D 1;
++        file->pz_log2_bs =3D data[3];
++        if (file->pz_log2_bs < 15 || file->pz_log2_bs > 17) {
++            /* TODO: Return an error here instead of silently
++             * disabling zisofs. That requires propagating an
++             * error return through parse_rockridge() and its
++             * callers. */
++            file->pz =3D 0;
++            return;
++        }
++        file->pz_uncompressed_size =3D archive_le32dec(&data[4]);
++    }
+ }
+=20
+ static void
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/re=
cipes-extended/libarchive/libarchive_3.7.9.bb
index 9cc5f3d540..f2ad360a2e 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -47,6 +47,7 @@ SRC_URI =3D "http://libarchive.org/downloads/libarchive-$=
{PV}.tar.gz \
            file://CVE-2026-4424-2.patch \
            file://CVE-2026-4424-3.patch \
            file://CVE-2026-4424-4.patch \
+           file://CVE-2026-5121.patch \
            "
 UPSTREAM_CHECK_URI =3D "http://libarchive.org/"
=20
--=20
2.34.1


