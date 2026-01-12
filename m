Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40849C9EC8D
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 16:00:44 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36021.1768233643555171727
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 08:00:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=arND2oq7;
 spf=pass (domain: est.tech, ip: 52.101.66.71, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O7sQcNMwwv8livK7bhJfrMK49ZgP8D1LSfAdlgUqM2PHm0D8ziBjiFKSHHGZP9RIX6dLg7UGY6kK0cM9CZg/2Y5yxzmXzSzhgWDmpN8v587CF/aFM2APWsyBJr5a1HIS91cuIECJzYTYY/7C9oVReVv9K7GAaPY/sJB0vi6lu988r5M88BcUoceGfFUhI+eknTEAk6l9K0rU3rxd57I/dfNm80iHs4ZHaXdMPzaD4M8Gbn6T6DPl8P4DdhEbT+vK0lqBwF67ztNo/pnlYBE5rAFDWzJozdJLK4iLSJmayPR6RXNng4ujAQo7UYlOzv3w10mwyPVyUFN1oWVtSxX5fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ug/T/J7/vwK+KMdnct6l10Nqv1xzqkVPZu1we6zSlbE=;
 b=QsgD7VGdyLt5GXo4YXkaeivk6yyb42IbKO6xSNjLu/LcOcr4j4W8I9o33ctqRkzpnUyempwzBMgPxLNDr+48QX4kn08CubqQs07UcNfiPzpkYBaHrFKdsEPzbe/HAo27jmLqSPVKIqCEfK4wxWZSfHucOMS603FL6MIcRHK0AcSf4by+oVd/O47itG5CJPtmJN8g5D3ghxho6OXjAea1JRZkNOTquJpS4A6quLDxWTgjNbNk6PBe0C7mm2FJELi7DsfBe6H/bvtyaYDVzQVdDwJqaPEWaVWMqDKamK7aonpeXvKQAHHKo5t/sLEpR3yuCvzGg/E0EmnTwBtA4I4Mpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ug/T/J7/vwK+KMdnct6l10Nqv1xzqkVPZu1we6zSlbE=;
 b=arND2oq7vlO+UdnZUfL5VH4GCzatsLDPuEAa1x1jhNA7P4eyvGEYUERkfXYVZUbO3fdO3qs8emR9nO0fv9FNHpnx5arPYbWh7VYU1Ka6ASgYSf3wBnsCfoa/G9jP9UQqzEIrbd4TMLLU5WM9XsTJUb1gW03pb+eaLGEcOhhqOZHT3OdlLhBlXwvKkdYrv08t5RHC3jzTD8Tn+5a7pE7THNCgTxR57+h9jlNPRzS6cEYJpp7EneZNZBATh5e21B45C0iZurwgagYTF4ePnMHxCpu9r+wVff0Hw5dAbpm3su2TNEIBZS9rb7JLY03iS+vTWmIdC8bd0eZsw7OTY6aWVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by PAWP189MB2376.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:338::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 16:00:39 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::3cc6:ccd5:b124:2a6a]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::3cc6:ccd5:b124:2a6a%7]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 16:00:39 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [review][OE-core][scarthgap][PATCH] libtasn1: Stack-based_buffer_overflow_fix
Date: Mon, 12 Jan 2026 17:00:02 +0100
Message-ID: <20260112160031.71913-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0405.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::14) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|PAWP189MB2376:EE_
X-MS-Office365-Filtering-Correlation-Id: e7145540-0fe3-45c5-2e45-08de51f3bb70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Dt4J3oFT/JBdn7VwBB01OdCT3gznzXpmpb9XdWDIzj5lunZJUIpkON8CsyUa?=
 =?us-ascii?Q?e6uolt8Fs7soeJCpglnWlSgW2J7a4OEt54yXXixmzV9N6BMy4Ihxqe8wMbxp?=
 =?us-ascii?Q?Wigk3vSO9vccya+GqFA5qxPYSTi8YAjVt2OV4qd7OulB0nqrdBiACEFQf+tq?=
 =?us-ascii?Q?fXDukx2yTcOvrG+8q+o8foGzCGowjtqoH5sxmTqcCx7KPq+q45oOcaQ3+tzK?=
 =?us-ascii?Q?1wSIBE6yF+eFciLP2Q3+zE09Auvbo4i0hFzCWqJ/kpv7KBn8Q6aWraIiBg+h?=
 =?us-ascii?Q?PFHOd9vwv3Q6KIgy5ZhCR/STsMxuPTc4CCvcr43Jq2z9ktc26aaTvOsoskpp?=
 =?us-ascii?Q?YBUk9ZuEc0qj1DXBz62ebVfNCtyBk39xrmT089sJd09PiUf7GxfQoWhpKWvV?=
 =?us-ascii?Q?gaBr2VqXQnZlt9wTF8f98/Heem+cl2Q/w1rM+ggYk26MGxHBc4XUhtkF6ApC?=
 =?us-ascii?Q?G8meTL3mxpCQZ8IVqPvfFMay9kEyiDWbiL5ohbD7y1OjybefxQxSo84Mqvsf?=
 =?us-ascii?Q?gwGVSzaPSLpaGla8oqVk1Lm1vAdr/jKQnzndDV314n6EVgWd1K+hjIGf/54W?=
 =?us-ascii?Q?aapqKP/+XDh7M2U6KWXCTm3r8JCuEfYjsIAT3ZuEm2FJBaLK2mFJlaxEYd7I?=
 =?us-ascii?Q?NNnx3XXpIBrbJSOtLORTfhMXHF407fmbUJJHHLWdQKMiKMBdsOilC9M2Eu7v?=
 =?us-ascii?Q?KZHN3c/VzOjeVc4G7++/L7BeduDgGawcmYhaAE5eCgIv/YvGYPNpmT2koB0u?=
 =?us-ascii?Q?WLezGEFENEwc7YgKV5QLPab9n4IunbDTdSDd2krShKE2cfrWzG+b1PRdqHRg?=
 =?us-ascii?Q?+JaUb68MfuNCGoj/7QvoK1RJbt3nC+X0ZcH/JsjcSsc/H8jE0pQUoRFUZVvH?=
 =?us-ascii?Q?cqPPQZgLiLqQcZX9UDXmitGt6OlDqOHzt/nHGs0l6dufJiM16QoUDKLKiVVN?=
 =?us-ascii?Q?sV5WWku2NcovFUjB6ycFZnNVLaGPjHvU2qfLoDXOxTwWUYjxoQ9YqqtagzY8?=
 =?us-ascii?Q?ucRUydz1uMtnmxj0uDw50tMRbzuMJa8DgMvX7LGvNhm1pJcAwgm6Kf17onuT?=
 =?us-ascii?Q?J/mvBDUAo8sdrDfOc2wfI3ChSLcA7MGsaOtXxWHDI4G+cRGmtUPwOh0A56+p?=
 =?us-ascii?Q?fxKgpZoUwfhs4eTHKeNyX3EOSE6SPiAZLzgz0b6v2NSmCFFeTbxtmYbyDzJ0?=
 =?us-ascii?Q?YUFVA4EaMi46r/Qcp3PsM92prH8btVbhy/FBG5cpbx4+6jZ2KcxkIK+pl5Sy?=
 =?us-ascii?Q?tthliAtT8CNEEkK5OXAU7B79wtv3LkknTK7BF73OlEupgRN7kRAi2j4S5p/3?=
 =?us-ascii?Q?gzITqX1dNlLS4wGtrj1AdJikdu7ciyq0ORPysbrWA3V4+QbufcsYblcN38mf?=
 =?us-ascii?Q?ZDRiYAAjS0DYCm6t1eiH19mPpNjZL5Is53A8oFAR8Id5YAY3kbRn4D6FKOAy?=
 =?us-ascii?Q?aZa0dMHVL8NU2282g9P++qLW095EGYNQ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QoNT+WjD7iM/L4eNCEM1cniD5ShXH0+lxXCLIfZprqfdIKKe68elZLoqlD8o?=
 =?us-ascii?Q?tlOOVASbg3fHYggn4R4Pg8PnYLcn5aPgCrcStYAP14rkZS0iizAjVVvCl30S?=
 =?us-ascii?Q?ghMitQzL3E1IS9glJSxN0XM+1Nfd71KK4TDMIUxkJA8yVyNh38N+62G77uYm?=
 =?us-ascii?Q?Z+wdgFZMzbL0YSlFJYRQgqhgcn0MF6fqpc7oOv9frRNXWhoC98NwceZVEJkB?=
 =?us-ascii?Q?EyKh+kMwT0GRJ3v/VpnVef5XwFRDqKmMEUnYEZYOg13kZNWtoe07iBD4NL+t?=
 =?us-ascii?Q?deq8Gt0exLDjn5V15b3tDmJBLE7l0eSPNbyd+NMq0XdWCF44EZVew8URnZr7?=
 =?us-ascii?Q?IrpzWHN7krfFJmjwikZSRRJIkuGJNwG2KXMzgfSFgHkVI+ALIfr6DtZqmP7r?=
 =?us-ascii?Q?EsZ6ajy3LeKDMDLyDkScOK7cJQOsaQhbtwQ5eq9vYm5rxCyFHe64kHEwApM6?=
 =?us-ascii?Q?Cywqwz8evJDTyCdsznL1GBiFxUATwbK1ZG+A760cAXnqQuXTpCN2bGQOXFB3?=
 =?us-ascii?Q?i2D2+Dh8gA2rMDgCTPI/6IW2IYF43n8uPEeK52+pefMkfv9T7TYeKLucMPW4?=
 =?us-ascii?Q?dJHd2AfNSW3qsFnUnxfO/MTawtp9DAKl1EoEYivm6cmHWA/j+gCXKQMdvQNl?=
 =?us-ascii?Q?afI+0/Epg+0WoKotFjWlFb8SUHeZxPJRIyfkymMXTIrGJa0dYtPyd/AocAal?=
 =?us-ascii?Q?JXgv6srZxF5L25jxl/8EVashVGRCR7Ezecgc1l1KPEOiKnp8mNYP9+kkE1ys?=
 =?us-ascii?Q?1rxq1tPj/u2VG9t767ILanCxhilI4K0VV8DUgsvjiMEClHoChQWoK7n49x94?=
 =?us-ascii?Q?/9rwcJ41o35uw1FZ9DRL8AyhPDWAquhEY22wTtN5eEIzps8n66avcSu+a6Xq?=
 =?us-ascii?Q?cp9+qSvMns096BOV58GhjpIdx9aXuPeLp4QHzm6zM1mQlYlkhwU736Y8mAgP?=
 =?us-ascii?Q?i0GLIxk1OY2ijcog7FiSuvd7Evd0qPkjmgDOScHUgxtsg1W9E7Y4+izrVROr?=
 =?us-ascii?Q?5fwSxN0hrFEnkL9oH11l/9uFDfJ5u7aSiuxLpIhKEF8DKVLf7qLu4ibPupCA?=
 =?us-ascii?Q?iD8vCmCIx6l4G+DFaqpxAEACZLU/zxbQcM0PYxE6rZ/zDJnTkVpvop2zTJda?=
 =?us-ascii?Q?nWbQ/MBYkOJGnv9xQ0LHPdSI3Hjv8kbXS790/7gmsdpZUaP7Yq7Lo+xSdyBp?=
 =?us-ascii?Q?vFzjzVZmJbGQ0Hszl7TnCwLxiG+/9LcB67gANyrgrlFjPhaoMbh0SgIlUDCj?=
 =?us-ascii?Q?VR4i6uzHu7tMmtZ4hCZf3BoO0hl4gBJroDHGDD0ZXDxVpl12a1DIut3QUUF1?=
 =?us-ascii?Q?Gj2UwdA1MkjJogmo07r4VbMdo7JuTVzT5D9om5914NTI/aqstdJj88JAL67u?=
 =?us-ascii?Q?HgP0x//lGzWS5ZyfHF53A9/8txxjrJ7HsLi8THhoLfHdj1myKX3tF4843ygQ?=
 =?us-ascii?Q?98SHg32AjXAZHAYflm3ZxouyDJSllmm6Ekz07tKQ1xd8O4MdaOuRcRrqpv1v?=
 =?us-ascii?Q?PP2rXjsB0TrYl4LAJJQ73l/nkT+M53E4Shib5KlsQr8Ggm2FBY6QRmprVLCN?=
 =?us-ascii?Q?GmKsxynoodTLAUQ2jEHC2NjEVuGwH4XsfucRATvXvZVqcsI0mDr5Os003FFi?=
 =?us-ascii?Q?hFlR8DzZlvTEN7gb1z3ogYXwdyCrDh1kk6E/4uNn4nSzmI8bbydOdIl0VPvh?=
 =?us-ascii?Q?kzs3f6FO0kwrrncGMahoPDM6aDbKLSSKahdfnhImMqx/GjufpMyGrY/gLg3I?=
 =?us-ascii?Q?y5YiZqA5ZA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e7145540-0fe3-45c5-2e45-08de51f3bb70
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 16:00:39.7358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1XeP+dC2bVDRWRKQdSAyblPdvxF/o4rorHkGBpMMmW7HUvbpydseDO6HdW5qP+C5uJtVbKojTy49VoyDgWpmbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2376
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 16:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229210

From: Amaury Couderc <amaury.couderc@est.tech>

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
---
 .../gnutls/libtasn1/CVE-2025-13151.patch      | 36 +++++++++++++++++++
 .../recipes-support/gnutls/libtasn1_4.20.0.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/libtasn1/CVE-2025-13151.pat=
ch

diff --git a/meta/recipes-support/gnutls/libtasn1/CVE-2025-13151.patch b/me=
ta/recipes-support/gnutls/libtasn1/CVE-2025-13151.patch
new file mode 100644
index 0000000000..6ece045643
--- /dev/null
+++ b/meta/recipes-support/gnutls/libtasn1/CVE-2025-13151.patch
@@ -0,0 +1,36 @@
+From d6dbdff9a87e277c5c42adca935b32b5f99b464f Mon Sep 17 00:00:00 2001
+From: Vijay Sarvepalli <vssarvepalli@cert.org>
+Date: Mon, 12 Jan 2026 10:49:46 +0100
+Subject: [PATCH] CVE-2025-13151
+
+Stack-based buffer overflow in libtasn1 version: v4.20.0.=20
+The function fails to validate the size of input data=20
+resulting in a buffer overflow in asn1_expend_octet_string.
+
+Fixes CVE-2025-13151
+CVE-2025-13151
+
+Upstream-Status: Backport
+[https://gitlab.com/gnutls/libtasn1/-/merge_requests/121/diffs?commit_id=
=3D305377bad9ab87f461a2adcbb056c424cd56d03a]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ lib/decoding.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/decoding.c b/lib/decoding.c
+index 1e0fcb3..abcb49f 100644
+--- a/lib/decoding.c
++++ b/lib/decoding.c
+@@ -1983,7 +1983,7 @@ int
+ asn1_expand_octet_string (asn1_node_const definitions, asn1_node *element=
,
+ 			  const char *octetName, const char *objectName)
+ {
+-  char name[2 * ASN1_MAX_NAME_SIZE + 1], value[ASN1_MAX_NAME_SIZE];
++  char name[2 * ASN1_MAX_NAME_SIZE + 2], value[ASN1_MAX_NAME_SIZE];
+   int retCode =3D ASN1_SUCCESS, result;
+   int len, len2, len3;
+   asn1_node_const p2;
+--=20
+2.43.0
+
diff --git a/meta/recipes-support/gnutls/libtasn1_4.20.0.bb b/meta/recipes-=
support/gnutls/libtasn1_4.20.0.bb
index 8127ba5b1d..bfc011a2f1 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.20.0.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.20.0.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af=
26da5dc08a4e440464 \
=20
 SRC_URI =3D "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
+           file://CVE-2025-13151.patch \
            "
=20
 DEPENDS =3D "bison-native"
--=20
2.44.1


