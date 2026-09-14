Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95112C88E6A
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 09:09:58 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16302.1789376988676100369
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 02:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=gu2UiOu4;
 spf=pass (domain: est.tech, ip: 52.101.72.70, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qnqFnInZGUd8Ok3eHj9b+suJ+dUpkxnktIu8pllUYFK+RRZ5QXL4TQBCq9LBbpUqOaG81w8hl/xtejOsObIWF2jiybBg+3eOsEw+dpvSAd6B7UbPM/sXidGj1v7HPJZSOAAM7tGbcYYSiAxo/BD3YqFASZkhw0UQYoO6kAshwVZE5j+HBIG2Y/xU1Bo7SRvj+f/SwTukaooFhJiu8zA7WL5+ungaIrh/ZNgy9RwWrh2grfkN9y42Qidh5Zqu3fBG1qiqBVRkfJmbXwdnPHHM25evWpsCYbdVBtNKqZGzpTqL87YBf1Nip9xErYF/gyr9qt8h0YgZs/idPJeoybflcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X76QCchA/yAEWwk4sUXbl9b47+TqVz/+10G4uMEAlKA=;
 b=EoIZuVvpqXb7WqNgaZA0k/qLIm+Z9Z1mHULGqRAK5zZFfec3Omu99afP6i+F8KP3k9vDGGLTXAQCDhWPl1CO4o9jvqXD6sTm0TqaIm0YtFlf/IeMURvbwkQU5ZA885M7ItTdS1DtzFmoFTR7lYUicKloKO63YAgPQknM5cgqDVRaHVFK2wA4N5XuWzKisgMsNETLB+M3Fnjjd2IIbwFKcnUfmS8l0NnEhxYhnTtCog6m1WiX3blHvn3TTGDuH1291/ZeGo7hfn4XO+CD71/bFAFkwXbXp65a0PH5wqTa+9gbkgdiZya3t3Oq/YY+FZbHaA9zLRVOY5ZFE0FKm2McrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X76QCchA/yAEWwk4sUXbl9b47+TqVz/+10G4uMEAlKA=;
 b=gu2UiOu42Zl64sP6vPHrbmZlQKfac0BNm0e6W9VMHRAaTalwfVBBt5NOgCUKh5gPRyep4EEIIVLKIQwjfOev7hsvoIS3Q5jSaiCaWfrjLjC/VxenleB3CHgoi+8h+rJx7rxOHi8Zjyxkr3GowoDfY53ZupoIdXZkuyM6bAaqevdpWc/t4+jXRV3uvhl3G2Ja5VRahVXQ7KGT00dE8k9ave3HeV1nygLxYTUrZIBRJLNJe6zSDHPNZ9FIbKj/EfBks1AHnMHIiAZRtoF3OfS+coVGPZW8p5Lv3vF3MfYzKqrEe6Qvy8k1+XDHXR1BA1yyBpd7xNYNQSf9dpzHS8lorA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GV1P189MB2292.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:97::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 09:09:42 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 09:09:41 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libpcap: upgrade 1.10.7 -> 1.11.0
Date: Mon, 14 Sep 2026 11:09:40 +0200
Message-ID: <20260914090940.57818-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0062.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::13) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GV1P189MB2292:EE_
X-MS-Office365-Filtering-Correlation-Id: 01caaf00-184e-466d-fb2f-08df123fe93b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|6133799003|12006099003|18002099003|13003099007|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	Jj4LgkQVkum9d9bNg3ONRGF9NC9TY5snVtGN8IHRmJ+T392oLyD4MgvbBcEDq4eVZNDMiu4kShMTZnGb4O1gbzITwrKe15W4K38Chhj4KWlESRK11Q7qxgWIEo+kaceQuFfylV4auuYPBhZy4/AnhAHdP32IoxKx01ep5XG87xP6KgLO3D9thtAI6PChYammXYM+fYBwf51sxRdbiTEGTxQ2BinGVqgm/WglGAVfl1/ZCCkYLK63Ee6ddNMI1690/FHjvyO1/FR52CLhwHFGk/0HNAn2du5Z/pnjnt5OBiZ3G7MKoFdf2lxsOusCyBtd1brRb538t1YdnUwOYcqJY/0kdIxZev/sFZ/LebUz8SDdRHUT1BF/WeoVD9sNqOOK31cQ7mJndurXkxoWEl4R5d0T2FbCa/mZx/UmG3R+NH48nYXdQzKHbPJUGZ2piBwdxiHoW0yA0H3BiX0nM1iSgtOOFpA8CmYdb3RPFyDLW1IbAlxudiSe0EYlXzOWipsVb262dTkcD687Mqdmj71/EDz1coeGSBJlN8yKgg/JUefAFUYseGvNuYSPw6nD472TCWggnynQttV9lzuXk8RZR8lwTruQ0TVQTocKrpgQO4bxw1vgfh8aVj8IBJfM16l0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(12006099003)(18002099003)(13003099007)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uab6qSqDi14sQ8njy2XclS5JE86Oe2WDHlE4oGv+sdfvgEmfkpnIjv8SddFa?=
 =?us-ascii?Q?3d3UYge1yQnhAj+/sG7OC0C81SFSRYYw54oyK3pFKpShLRIF9J/wZ7ta30IJ?=
 =?us-ascii?Q?xCYcNJC/oY98PXhe2t5eX7vLZBRsOJ5YZ4ufOd1MgcNCoOE+ELsfgpy6uxBw?=
 =?us-ascii?Q?f/3CZ81klZ7U5OhXz5f5xN3+D7ECYYFPSoaRuWHS8GOVeIutJ/8bz/afO7fs?=
 =?us-ascii?Q?DNtUbi4CWqi3pXEgfh7qYHnCbrKPrgK+kgXODx2yowWr9mULXk+DPPcbYt5e?=
 =?us-ascii?Q?GdoSDlRdJ7mlM8euDTe93FhWIWpkzrKPmX8xZyTzUbClZO34HRpD7wMS8NXe?=
 =?us-ascii?Q?zENu8DkEdbBsiJKou2qps7QL03QDSXx66qTDUd7YWfjxq0CYlvi1jR/5p7YC?=
 =?us-ascii?Q?UMhiKuRdEHaLtglt9zKBRBk/oyFzcJXktgYpCNkLx78uaANGFfNF1fLSqL3+?=
 =?us-ascii?Q?m1J/SyHM83Glx7Yfd2JVqyy2igoRssafM3UwVcawhrAH9G1i3aryaP+Rycqg?=
 =?us-ascii?Q?kpHtDg5W04ujPYIOWVJh6bjetEeH6NK3VxVJ/Vs5JTzH/OxZlkeAipx3bdgt?=
 =?us-ascii?Q?E4KJ6ngERy7nLlBB2Kb6faXIFWtI3xG/ubZJQS6WYh0AaBtx7LFL2sLPQzO+?=
 =?us-ascii?Q?sLvdpavp4DyR0OUYTWu0MW6uRdbQGMAvWF8YlFQwsYaH4DISALHH6K09wGW0?=
 =?us-ascii?Q?uQ0l9D17fKWFMBqATjYXNyUY8BXPWIX0EfNstkaz1EB7vqcRPM4EXOKy+ZTa?=
 =?us-ascii?Q?bmoAS9G1N58CqRmqgwuxBYY7txsuwQaxNilf6b+0SCwcFasUkzZB4b2s8WtB?=
 =?us-ascii?Q?1rpu3qqPAF3WdX1bFTIAUUnm9DYqNtrA9MqBv1rdQ0AFAZxhoZd5sRwrlLPX?=
 =?us-ascii?Q?VPK9AjkVIV6DKS+QjhAk34jpBVFDxXMjwLLRaTqlxUBZgXHGAFSB1oFoWMiD?=
 =?us-ascii?Q?4QDnLqt0iLUAJ0VEWeQFyDZa2i/lXi+5E8FuWi63s1PxKdqJZjdkkYhy3Qs2?=
 =?us-ascii?Q?zXIxM0rdjdYAyU4udcarDUpCiv7IIiFTAX2Hhbkj3ITfLgzbCshOyq3DSc3V?=
 =?us-ascii?Q?6ISJc+UAo4RFI0evM/0rNGLeiHlhWoES+qi/IwZkXDtPVVAuKUdqGPHprjlM?=
 =?us-ascii?Q?7zHo18UuWyPWZuTxuM/JoXWPUt11WflEvL7ikHpCvrDt5pbZiDT9Pu2cIXQ2?=
 =?us-ascii?Q?h8rbAArZMIYNd9dzKi5P7m7kWuHZNrFOerhmLrbGkp4fLRTS7PTSoX59lhnk?=
 =?us-ascii?Q?KPEF6nY53plWYkxOJsYYzNvA5A7163oDrNiwxMqsmiBdOWz9zW3W9HARW8Wr?=
 =?us-ascii?Q?ibaRQB+1c2WFLKGYgeDSrfu0gRUJyReAjNbzMBKPX9evbQbJwpiIwmRMh8Bf?=
 =?us-ascii?Q?CfoJNGWmUTttEQrk6htl6aqx/mu4wh+73Earn4QgvWSri4FLfGVnW4vCGBE8?=
 =?us-ascii?Q?aYx/JTuKwz2JvO3+7D8x8KLpKf1J9VM1a0m0r2aZ19lf+czUwcgrvOLXFhDw?=
 =?us-ascii?Q?axTOBvElgCs3CucLXr7rvPT+fSa2ZN9CY0W3pyFIo3r/lOpkH9f9Vqm1mpVA?=
 =?us-ascii?Q?+qSWTYIDV1isYKoVjcF0t1jpsd6DRM1TKWQhoGNEpBiV/oSk5+v/d1x9HpOr?=
 =?us-ascii?Q?7zOvPccIVuRhK1u8i4N3XIMvieQhTXZIsRzJFbFNl0cICp2PIxqAcq7DGvh9?=
 =?us-ascii?Q?8iVOFtDCP7XnswosFyT6QPcD04oCkX6iuY7kFG/TbOAH9bnEa1GE2OJPD+oK?=
 =?us-ascii?Q?CHn/e7ey4g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 01caaf00-184e-466d-fb2f-08df123fe93b
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 09:09:41.7219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kc6zywZKaX517AIlP8n0vfDT9duOc6jlpFaHw2Dlk9NOiZwmXkS6Thew2Rs/HsC+QnvwT4Hz686OZ2X9ocejzrEm3+lvZIL+etTlXL8Vls8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2292
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 09:09:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245761

Changes: https://github.com/the-tcpdump-group/libpcap/blob/libpcap-1.11.0/C=
HANGES

- Remove backport patch as its part of release
- Remove the "disable IPv6" build option. inline with upstream release
  (Refer: [1])
- Remove unmaintained DPDK capture backend (was disabled by default). (Refe=
r: [2])

[1] https://github.com/the-tcpdump-group/libpcap/blob/libpcap-1.11.0/CHANGE=
S#L115
[2] https://github.com/the-tcpdump-group/libpcap/blob/libpcap-1.11.0/CHANGE=
S#L21

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...ssages-about-32-bit-integer-overflow.patch | 155 ------------------
 .../{libpcap_1.10.7.bb =3D> libpcap_1.11.0.bb}  |  11 +-
 2 files changed, 3 insertions(+), 163 deletions(-)
 delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/0001-Fix-erro=
r-messages-about-32-bit-integer-overflow.patch
 rename meta/recipes-connectivity/libpcap/{libpcap_1.10.7.bb =3D> libpcap_1=
.11.0.bb} (76%)

diff --git a/meta/recipes-connectivity/libpcap/libpcap/0001-Fix-error-messa=
ges-about-32-bit-integer-overflow.patch b/meta/recipes-connectivity/libpcap=
/libpcap/0001-Fix-error-messages-about-32-bit-integer-overflow.patch
deleted file mode 100644
index 5c14e189f0..0000000000
--- a/meta/recipes-connectivity/libpcap/libpcap/0001-Fix-error-messages-abo=
ut-32-bit-integer-overflow.patch
+++ /dev/null
@@ -1,155 +0,0 @@
-From 936de20fdc8475d3627986ff5525198332cf2b0a Mon Sep 17 00:00:00 2001
-From: Denis Ovsienko <denis@ovsienko.info>
-Date: Thu, 9 Oct 2025 20:51:45 +0100
-Subject: [PATCH] Fix error messages about 32-bit integer overflow.
-
-Since commit a5cac25 stoulen() takes a pointer to a string and a
-length of the string and uses the length to report a problem about the
-string.  However, by that time it has already modified the length, so
-the error message does not match the input:
-
-$ filtertest RAW '123456789012345'
-filtertest: number 1234 overflows 32 bits
-$ filtertest RAW '12345678901234567890'
-filtertest: number 123456789 overflows 32 bits
-$ filtertest RAW '123456789012345678901234567890'
-filtertest: number 1234567890123456789 overflows 32 bits
-$ filtertest RAW '0123456701234'
-filtertest: number  overflows 32 bits
-$ filtertest RAW '0x100000000'
-filtertest: number  overflows 32 bits
-
-Consequently, if more than one number in the filter expression is out of
-range, it can be not immediately obvious which one it is:
-
-$ filtertest RAW '4294967296 !=3D 4294967297'
-filtertest: number  overflows 32 bits
-
-To fix this, in stoulen() keep a copy of the original string length and
-use it for the error reporting.  Ibid., factor the format string out and
-show the base in the message.  Simplify the forward declaration.  Add
-two comments to outline the clash space between certain MAC-48 addresses
-and certain octal integers.  Document this syntax peculiarity in the man
-page and add a few basic reject tests.
-
-Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/co=
mmit/0d8bd2f67c16637c4d25d81fb24cdcebc35afce6]
-Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
----
- pcap-filter.manmisc.in |  9 ++++++++-
- scanner.l              | 33 ++++++++++++++++++++++++---------
- 2 files changed, 32 insertions(+), 10 deletions(-)
-
-diff --git a/pcap-filter.manmisc.in b/pcap-filter.manmisc.in
-index 2444ff7..3c8a190 100644
---- a/pcap-filter.manmisc.in
-+++ b/pcap-filter.manmisc.in
-@@ -18,7 +18,7 @@
- .\" WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF
- .\" MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
- .\"
--.TH PCAP-FILTER @MAN_MISC_INFO@ "13 June 2023"
-+.TH PCAP-FILTER @MAN_MISC_INFO@ "9 October 2025"
- .SH NAME
- pcap-filter \- packet filter syntax
- .br
-@@ -885,6 +885,13 @@ integer constants (expressed in standard C syntax), t=
he normal binary operators
- a length operator, and special packet data
- accessors.  Note that all comparisons are unsigned, so that, for example,
- 0x80000000 and 0xffffffff are > 0.
-+.LP
-+Note that 32-bit octal integer constants in the [010000000000 .. 03777777=
7777]
-+interval, which includes 75% of all 32-bit integers, are interpreted as M=
AC-48
-+addresses when prepended with a single zero (e.g., 012345670123 means
-+01:23:45:67:01:23).  To disambiguate the expression, prepend such an octa=
l
-+number with more zeroes (0012345670123) or represent the same value using=
 a
-+decimal (1402433619) or hexadecimal (0x53977053) number.
- .IP
- The
- .B %
-diff --git a/scanner.l b/scanner.l
-index 405d331..bd708c9 100644
---- a/scanner.l
-+++ b/scanner.l
-@@ -48,8 +48,8 @@ typedef enum {
- 	STOULEN_ERROR
- } stoulen_ret;
-=20
--stoulen_ret stoulen(const char *string, size_t stringlen, bpf_u_int32 *va=
l,
--    compiler_state_t *cstate);
-+stoulen_ret stoulen(const char *, const size_t, bpf_u_int32 *,
-+    compiler_state_t *);
- }
-=20
- /*
-@@ -244,6 +244,12 @@ V6004		::{N}\.{N}\.{N}\.{N}
-=20
- V6		({V680}|{V670}|{V671}|{V672}|{V673}|{V674}|{V675}|{V676}|{V677}|{V660=
}|{V661}|{V662}|{V663}|{V664}|{V665}|{V666}|{V650}|{V651}|{V652}|{V653}|{V6=
54}|{V655}|{V640}|{V641}|{V642}|{V643}|{V644}|{V630}|{V631}|{V632}|{V633}|{=
V620}|{V621}|{V622}|{V610}|{V611}|{V600}|{V6604}|{V6504}|{V6514}|{V6524}|{V=
6534}|{V6544}|{V6554}|{V6404}|{V6414}|{V6424}|{V6434}|{V6444}|{V6304}|{V631=
4}|{V6324}|{V6334}|{V6204}|{V6214}|{V6224}|{V6104}|{V6114}|{V6004})
-=20
-+	/*
-+	 * In the regexp below the "{B2}{3}" form matches all octal numbers in
-+	 * the [010000000000 .. 077777777777] interval that use a single leading
-+	 * zero.  The interval includes both integer values that fit into 32
-+	 * bits and values that don't.
-+	 */
- MAC		({B}:{B}:{B}:{B}:{B}:{B}|{B}\-{B}\-{B}\-{B}\-{B}\-{B}|{B}\.{B}\.{B}\=
.{B}\.{B}\.{B}|{B2}\.{B2}\.{B2}|{B2}{3})
-=20
-=20
-@@ -486,13 +492,16 @@ tcp-cwr			{ yylval->h =3D 0x80; return NUM; }
-  */
- DIAG_ON_FLEX
-=20
-+#define FORMAT_OVERFLOWS_32_BITS "%s number %.*s overflows 32 bits"
-+
- stoulen_ret
--stoulen(const char *string, size_t string_len, bpf_u_int32 *val,
-+stoulen(const char *string, const size_t orig_string_len, bpf_u_int32 *va=
l,
-     compiler_state_t *cstate)
- {
- 	bpf_u_int32 n =3D 0;
- 	unsigned int digit;
- 	const char *s =3D string;
-+	size_t string_len =3D orig_string_len;
-=20
- 	/*
- 	 * string is guaranteed either to be a string of decimal digits
-@@ -538,8 +547,8 @@ stoulen(const char *string, size_t string_len, bpf_u_i=
nt32 *val,
- 					 * in 32 bits.
- 					 */
- 					bpf_set_error(cstate,
--					    "number %.*s overflows 32 bits",
--					   (int)string_len, string);
-+					    FORMAT_OVERFLOWS_32_BITS,
-+					    "hexadecimal", (int)orig_string_len, string);
- 					return STOULEN_ERROR;
- 				}
- 				n =3D (n << 4) + digit;
-@@ -573,10 +582,16 @@ stoulen(const char *string, size_t string_len, bpf_u=
_int32 *val,
- 					 * number, and are about to add
- 					 * 3 more; that won't fit in
- 					 * 32 bits.
-+					 *
-+					 * This code path depends on using more
-+					 * than one leading zero for all values
-+					 * in the [040000000000 .. 077777777777]
-+					 * interval, otherwise the MAC regexp
-+					 * above consumes the string first.
- 					 */
- 					bpf_set_error(cstate,
--					    "number %.*s overflows 32 bits",
--					   (int)string_len, string);
-+					    FORMAT_OVERFLOWS_32_BITS,
-+					    "octal", (int)orig_string_len, string);
- 					return STOULEN_ERROR;
- 				}
- 				n =3D (n << 3) + digit;
-@@ -609,8 +624,8 @@ stoulen(const char *string, size_t string_len, bpf_u_i=
nt32 *val,
- 				 * number that won't fit in 32 bits.
- 				 */
- 				bpf_set_error(cstate,
--				    "number %.*s overflows 32 bits",
--				   (int)string_len, string);
-+				    FORMAT_OVERFLOWS_32_BITS,
-+				    "decimal", (int)orig_string_len, string);
- 				return STOULEN_ERROR;
- 			}
- 			n =3D (n * 10) + digit;
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.7.bb b/meta/rec=
ipes-connectivity/libpcap/libpcap_1.11.0.bb
similarity index 76%
rename from meta/recipes-connectivity/libpcap/libpcap_1.10.7.bb
rename to meta/recipes-connectivity/libpcap/libpcap_1.11.0.bb
index fcbac2dc26..df63ab68b8 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.7.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.11.0.bb
@@ -10,10 +10,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5eb289217c160=
e2920d2e35bddc36453 \
                     file://pcap.h;beginline=3D1;endline=3D32;md5=3D39af351=
0e011f34b8872f120b1dc31d2"
 DEPENDS =3D "flex-native bison-native"
=20
-SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.xz \
-	   file://0001-Fix-error-messages-about-32-bit-integer-overflow.patch \
-          "
-SRC_URI[sha256sum] =3D "68fa62cffb974f4275641ce14c2e2d75739251f30e00e6a090=
0903b247d76a03"
+SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.xz"
+SRC_URI[sha256sum] =3D "9237f5bae9dcf3a91823d9963ec43b7c0e2e3374ef2ad57d92=
c8cd39530f4723"
=20
 inherit autotools binconfig-disabled pkgconfig
=20
@@ -21,19 +19,16 @@ BINCONFIG =3D "${bindir}/pcap-config"
=20
 # Explicitly disable dag support. We don't have recipe for it and if enabl=
ed here,
 # configure script poisons the include dirs with /usr/local/include even w=
hen the
-# support hasn't been detected. Do the same thing for DPDK.
+# support hasn't been detected.
 EXTRA_OECONF =3D " \
                  --with-pcap=3Dlinux \
                  --without-dag \
-                 --without-dpdk \
                  "
=20
 PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', =
'bluez5', '', d)} \
-                   ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
 "
 PACKAGECONFIG[bluez5] =3D "--enable-bluetooth,--disable-bluetooth,bluez5"
 PACKAGECONFIG[dbus] =3D "--enable-dbus,--disable-dbus,dbus"
-PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,"
 PACKAGECONFIG[libnl] =3D "--with-libnl,--without-libnl,libnl"
=20
 do_configure:prepend () {

