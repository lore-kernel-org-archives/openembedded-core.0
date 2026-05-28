Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5392CCD6E44
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 14:00:39 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11666.1779976795126402952
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 06:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=zW0EFQGP;
 spf=pass (domain: est.tech, ip: 52.101.83.47, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fw3rrGz7hruZ/Vkec6KSfXaSJULT75IfUOmOsk0jxSlfJDdFDuRVuF9yZMddR0bA3ow0vMMBBeY2cq4Si0yj12lOZMw+g6VA5KA+7R478FpZ6nttKVQiyBHC7D2oFJlGfBddk/fZoPHKDth5UnODe0OBtkWBKDVnEZ69XDwHH8zSdf4T49bS5mw4IrWROXL7p3zzJNg0g0fIqrMzoUFtrVP62OI5js45lYz7q8Q14t2wqwE7qUbBLleRGYSBQiBL2NInL0mLCfnJWqu5LtBGRZjZtNwuq+uKmHOntHAh/WkbyvEYCbK6A9O+iH8GvOy0K6nRR6shcKOqeNo2N21lFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyJ/a+Q5pXOU3Fh259MoEYyjBZZn3kEbjX+ohL4dxoM=;
 b=F8FLMMqHazv+QcHFwvq0m/Wp2JQniFrhA5TBy/XPGbsH+Wx2S1z5cBtBnBEoM3InYIlHRi2LzF9SEJQUeLKNuXzoL3rVlZt/Zm4qznts4tkGOeSnHmThQfSvzqZt/s5UFt8+ud5bJlqkvA/0cEYoIR0G99624mg6tnfUySkUBanFAEnIkobt+z/CD0fFAl+ofCRzHa3XkMvnQMf5mv8dKiS8rHgDtJVf4rhczr7rtmkKHF16X+r77xYGvfjTFzQJNWce8GTDjJwHJJ5FR4o7nn+CTR6e0fF9L6H25/qKQCa4mTs/fH0cL3j50i95QoZpFNZ2/DWyLIPSc5zHwFNtJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyJ/a+Q5pXOU3Fh259MoEYyjBZZn3kEbjX+ohL4dxoM=;
 b=zW0EFQGPpRgFCtKHZ2s6eyNZoRqJGHkX0rckLnQxf1MXWOcQGBSMbkqsj3O+Qd7PVfosb/HS2tyEMdQsf0F+p/PUsZOaLpJuG/u7PW4JfVt2uty2I5ogB0tSsE/CMv9uVlj7eAbIYgSYIu0+jr+K3YqOYIvf+KjWJDdFsrlm5euRY2HkEF7d2P9dposXivfVqnJjQNiN9y8nKO3qJq8B1//Xlh2oOj3zI/Q7uI7mlrVul0eW3iS019g/LNqqWBz2QkjXDuZmbdHRC31m/djpUhLJV4XwaLNi6XqaN2JUkfEsrSCkEWBSz3wQbo/yTy5MCEkI+CBiQZM0tl6veE+lxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by AM7P189MB0963.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:175::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 13:59:51 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%6]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 13:59:51 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][master][PATCH] libpcap: fix error message on 32-bit integer overflow
Date: Thu, 28 May 2026 15:59:44 +0200
Message-ID: <20260528135948.302986-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: LO0P123CA0010.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::19) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|AM7P189MB0963:EE_
X-MS-Office365-Filtering-Correlation-Id: 6917531b-a026-4723-4668-08debcc16323
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|6133799003|11063799006|56012099006|12006099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	8jOJIEGuspxdTdBs4SkEECnM+UR8mam5P1JPxg26iLHVDVxt96S+anfyOJjy2ooczjbuP7st8WIiLgs5w8Tx1+U6RZgEFr2fykcU7TcmPa5THSo+ubdKpSHX4tiLQAHtxSpp0kbnh9g8dO6J+ZKFw4uDS57olQe6mzbtgic2DJa7lCptKuXM05RH6irxTwUFvtnn9ZxgPQpmzFVnDmiDerJRwLECX8EShO1pB3teKD5v41nauacela2yGzuAWdhHtRi69/RQkR+gt1wlae/2T8C3Jz9R3OEA6exzRpKZF4Otvv3dSzCGkBUZXf7s+Q7ImICrqAiB5IHaQYaGRXKP/TQSgrapkmPEYcRCJF0aiDegdYbcXBChxYwv4qyTa74bDTZFgJdBdI9PsGd+RutjEwNJpp4RvLSxbTtdoqiIwQCsTtH9UJdAAsjM//A1SguEzDi8AdKwWw+Gh60o0H8erQjR8p3fpEso580QGITbKXdK+Qi3mIYW6PmKh545J+2yYg0kvY55OARgUerjgF1WIyU7XDpcTbrgKYTTTFk6ef0xDKs0IkfuGPd22jFnZx5PJJrPDRnwwzQ5zGkYqNZuNHeZqn+En9FL8IPsPrQ2GjR8UjPwTEcqrFg+c7YO2jLxbOTYSYfGNG+18cpbfL+xhQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(6133799003)(11063799006)(56012099006)(12006099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YNGWncT4Y4jPolsirNTmzZogu2LyqtzUfbX08xFN8Y5qQEMF4WUcHnG61+8y?=
 =?us-ascii?Q?pqdS/BvTI+jc/bLUSkH+OCB6qBD0WtZM5Qy+ytKwMChAC/7xubMfKeCHVvkc?=
 =?us-ascii?Q?+M1/ahwDk6Gmh/gDh+B91Se4Dj18vclJoo5JJz+Y9kWCEwZdLhmTwys2iLv1?=
 =?us-ascii?Q?TWhcHn3ufzHKkyncvlVNsPRm7Ig6H2KExJsEZe9lLskz7gucjfJw2rGDsdIX?=
 =?us-ascii?Q?4ghgXp8djfyM1FfxDvOCxbhY0Af9RzNuc3B/Uqt9pxHlLB5PJLnNaLABKMJH?=
 =?us-ascii?Q?KB9BYg1LuFJQAc+a3v1ylXvexdIdhC93DkecLd8bfRpGBIIFWkbxr5oqeVTf?=
 =?us-ascii?Q?L58FdwpFbapnC0VsZmM5qavxmpmejYB7hEFxMks6FPE2f6AkqjIGXTU9jwvU?=
 =?us-ascii?Q?AWeNAOgaVSh2W0QDlEwpy53OF01jEXOfcQYa788PFuMznupq/H2St5feYnGB?=
 =?us-ascii?Q?6iBDsxVgniesKSapAsLNiepnZKty0aF1TiK5MDc8dWrq3kzSubiqR8Gx4oXT?=
 =?us-ascii?Q?c3H9XPMrO5LIOJclm7828HlfxUsaDmH3g7L5s5J40NMCiyfX2BpDVYG6Uhi3?=
 =?us-ascii?Q?TVfw88mIHeZEn8g2uLLz65TC3VZ9j6q7X3nI4d8FS/IsQod3o2Rik7ZH5jeb?=
 =?us-ascii?Q?UTH0t3TKexNgJg7uSdhHrn282iZZvXU7G1QWkY3vCJxhy5Ex+WCS0jsscX1Y?=
 =?us-ascii?Q?9nLON7Vzk4HDbrxVFv0EoMSK1PJF9YJRz8ZNXpnKuJPemOnOn7e0z+B71LTy?=
 =?us-ascii?Q?uD618bC8EqJgyTlW1sbTShMcGKI0Uql+H8O0IrLkM1TT++wQYzaOzdleHGKX?=
 =?us-ascii?Q?ATu4nPwrA2Dgo0z4RthQ5P9Bq4F4+rZCGB3yEx8y1PWyjGu8QBFDlebgQu3I?=
 =?us-ascii?Q?KqvcGRY7jRV1aEdEPfxjybPNLAa0f8VfSWt6wnj/LE1BF6aoAmVklu/bCHQ6?=
 =?us-ascii?Q?2pU8c8Ganc6FDyWCe++OXCaEGTmnOjMlWB0O8syfp0mFizTkH3CBFNSRsR/x?=
 =?us-ascii?Q?bpTxCvwg1hqRVi5EpF2NFSAVNk7xfslN5KlgP6QtQWLAKv1FwX4pDvw5vX2L?=
 =?us-ascii?Q?8baCoO9kSLdYqSW5/raIrPgVkobZHjD7BqlAXzde4+0oaXAwVqnQ84tnaQ8T?=
 =?us-ascii?Q?iFlhrq9rIr2PI5L8atPPa9QBY/q41Fo16cs3hTtdQXGvMHHrxYgNir2s7LjW?=
 =?us-ascii?Q?a1IB6qkn7662NIEdXgLT2BUJTGTJrnSNUSw5ti3H6idW3njiNUnL3ruJ+lW/?=
 =?us-ascii?Q?9TBqYecWV3Dsd7Se/EEV58b1DATrMGuTVdFja+AQk6lw2nqowBOen2kH/yYq?=
 =?us-ascii?Q?ymscn87oSiwvQMljQNlBeuLk3moKUDtsZE8P0RThl5927GVXoGLR7fwjaiai?=
 =?us-ascii?Q?tTJWhTzVqFPuzj0YWuAb09Msz2QuxyBmeYqj+A9XH0qjafWIN5tL+gt90tk9?=
 =?us-ascii?Q?FDXn3pXZv8d5jLhcP7X8s1C9zCj0EumWjqaX42iuEXP0azbNZTaqmr2Vg/P3?=
 =?us-ascii?Q?je8aAoxPKpiiIc0e7pT32FZa9DjvPM16eIaPUsfCopvSOmrkGky4ZqMGvs6I?=
 =?us-ascii?Q?RrRZcJpOLdKu5JajC0cG0uUs1RKJFF7aPRciA2FT+MFz29fRJQF++FVFeGjH?=
 =?us-ascii?Q?I/rFDgSmH0pY0XwNPm3KI18BzDef2VsHlLam+Zh9tK60FmlyyMgyugatyO7I?=
 =?us-ascii?Q?fmK1taR5oZZsLZfd/92UA8W/xy5Q4ogyiCvL8pIQjVblAkPPMI1tpjNPy95w?=
 =?us-ascii?Q?O5n/xD6DgpOAvteilKReacmEL2yWWIc=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6917531b-a026-4723-4668-08debcc16323
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 13:59:51.2278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FpkaXvACBo9yE85C3CAtxSkF6BsZktl1yb9cuJwKL/gm8XMd2hdLJ15VfEpK9hmTUhzepEXU+4oXDj1/mbsnd8G3/oawlRhKeCxW09mkEK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0963
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 14:00:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237712

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Upstream fix: https://github.com/the-tcpdump-group/libpcap/commit/0d8bd2f67=
c16637c4d25d81fb24cdcebc35afce6

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 ...ssages-about-32-bit-integer-overflow.patch | 158 ++++++++++++++++++
 .../libpcap/libpcap_1.10.6.bb                 |   4 +-
 2 files changed, 161 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/0001-Fix-erro=
r-messages-about-32-bit-integer-overflow.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/0001-Fix-error-messa=
ges-about-32-bit-integer-overflow.patch b/meta/recipes-connectivity/libpcap=
/libpcap/0001-Fix-error-messages-about-32-bit-integer-overflow.patch
new file mode 100644
index 0000000000..4f2af53762
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/0001-Fix-error-messages-abo=
ut-32-bit-integer-overflow.patch
@@ -0,0 +1,158 @@
+From 217c3a07c7db694324b5c61eaaa07774735e2d7d Mon Sep 17 00:00:00 2001
+From: Denis Ovsienko <denis@ovsienko.info>
+Date: Thu, 9 Oct 2025 20:51:45 +0100
+Subject: [PATCH] Fix error messages about 32-bit integer overflow.
+
+Since commit a5cac25 stoulen() takes a pointer to a string and a
+length of the string and uses the length to report a problem about the
+string.  However, by that time it has already modified the length, so
+the error message does not match the input:
+
+$ filtertest RAW '123456789012345'
+filtertest: number 1234 overflows 32 bits
+$ filtertest RAW '12345678901234567890'
+filtertest: number 123456789 overflows 32 bits
+$ filtertest RAW '123456789012345678901234567890'
+filtertest: number 1234567890123456789 overflows 32 bits
+$ filtertest RAW '0123456701234'
+filtertest: number  overflows 32 bits
+$ filtertest RAW '0x100000000'
+filtertest: number  overflows 32 bits
+
+Consequently, if more than one number in the filter expression is out of
+range, it can be not immediately obvious which one it is:
+
+$ filtertest RAW '4294967296 !=3D 4294967297'
+filtertest: number  overflows 32 bits
+
+To fix this, in stoulen() keep a copy of the original string length and
+use it for the error reporting.  Ibid., factor the format string out and
+show the base in the message.  Simplify the forward declaration.  Add
+two comments to outline the clash space between certain MAC-48 addresses
+and certain octal integers.  Document this syntax peculiarity in the man
+page and add a few basic reject tests.
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/co=
mmit/0d8bd2f67c16637c4d25d81fb24cdcebc35afce6]
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ pcap-filter.manmisc.in |  9 ++++++++-
+ scanner.l              | 33 ++++++++++++++++++++++++---------
+ 2 files changed, 32 insertions(+), 10 deletions(-)
+
+diff --git a/pcap-filter.manmisc.in b/pcap-filter.manmisc.in
+index bfb692ff..929d668d 100644
+--- a/pcap-filter.manmisc.in
++++ b/pcap-filter.manmisc.in
+@@ -18,7 +18,7 @@
+ .\" WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF
+ .\" MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
+ .\"
+-.TH PCAP-FILTER @MAN_MISC_INFO@ "13 June 2023"
++.TH PCAP-FILTER @MAN_MISC_INFO@ "9 October 2025"
+ .SH NAME
+ pcap-filter \- packet filter syntax
+ .br
+@@ -886,6 +886,13 @@ integer constants (expressed in standard C syntax), t=
he normal binary operators
+ a length operator, and special packet data
+ accessors.  Note that all comparisons are unsigned, so that, for example,
+ 0x80000000 and 0xffffffff are > 0.
++.LP
++Note that 32-bit octal integer constants in the [010000000000 .. 03777777=
7777]
++interval, which includes 75% of all 32-bit integers, are interpreted as M=
AC-48
++addresses when prepended with a single zero (e.g., 012345670123 means
++01:23:45:67:01:23).  To disambiguate the expression, prepend such an octa=
l
++number with more zeroes (0012345670123) or represent the same value using=
 a
++decimal (1402433619) or hexadecimal (0x53977053) number.
+ .IP
+ The
+ .B %
+diff --git a/scanner.l b/scanner.l
+index 57779497..49aaeab2 100644
+--- a/scanner.l
++++ b/scanner.l
+@@ -48,8 +48,8 @@ typedef enum {
+ 	STOULEN_ERROR
+ } stoulen_ret;
+=20
+-stoulen_ret stoulen(const char *string, size_t stringlen, bpf_u_int32 *va=
l,
+-    compiler_state_t *cstate);
++stoulen_ret stoulen(const char *, const size_t, bpf_u_int32 *,
++    compiler_state_t *);
+ }
+=20
+ /*
+@@ -244,6 +244,12 @@ V6004		::{N}\.{N}\.{N}\.{N}
+=20
+ V6		({V680}|{V670}|{V671}|{V672}|{V673}|{V674}|{V675}|{V676}|{V677}|{V660=
}|{V661}|{V662}|{V663}|{V664}|{V665}|{V666}|{V650}|{V651}|{V652}|{V653}|{V6=
54}|{V655}|{V640}|{V641}|{V642}|{V643}|{V644}|{V630}|{V631}|{V632}|{V633}|{=
V620}|{V621}|{V622}|{V610}|{V611}|{V600}|{V6604}|{V6504}|{V6514}|{V6524}|{V=
6534}|{V6544}|{V6554}|{V6404}|{V6414}|{V6424}|{V6434}|{V6444}|{V6304}|{V631=
4}|{V6324}|{V6334}|{V6204}|{V6214}|{V6224}|{V6104}|{V6114}|{V6004})
+=20
++	/*
++	 * In the regexp below the "{B2}{3}" form matches all octal numbers in
++	 * the [010000000000 .. 077777777777] interval that use a single leading
++	 * zero.  The interval includes both integer values that fit into 32
++	 * bits and values that don't.
++	 */
+ MAC		({B}:{B}:{B}:{B}:{B}:{B}|{B}\-{B}\-{B}\-{B}\-{B}\-{B}|{B}\.{B}\.{B}\=
.{B}\.{B}\.{B}|{B2}\.{B2}\.{B2}|{B2}{3})
+=20
+=20
+@@ -486,13 +492,16 @@ tcp-cwr			{ yylval->h =3D 0x80; return NUM; }
+  */
+ DIAG_ON_FLEX
+=20
++#define FORMAT_OVERFLOWS_32_BITS "%s number %.*s overflows 32 bits"
++
+ stoulen_ret
+-stoulen(const char *string, size_t string_len, bpf_u_int32 *val,
++stoulen(const char *string, const size_t orig_string_len, bpf_u_int32 *va=
l,
+     compiler_state_t *cstate)
+ {
+ 	bpf_u_int32 n =3D 0;
+ 	unsigned int digit;
+ 	const char *s =3D string;
++	size_t string_len =3D orig_string_len;
+=20
+ 	/*
+ 	 * string is guaranteed either to be a string of decimal digits
+@@ -538,8 +547,8 @@ stoulen(const char *string, size_t string_len, bpf_u_i=
nt32 *val,
+ 					 * in 32 bits.
+ 					 */
+ 					bpf_set_error(cstate,
+-					    "number %.*s overflows 32 bits",
+-					   (int)string_len, string);
++					    FORMAT_OVERFLOWS_32_BITS,
++					    "hexadecimal", (int)orig_string_len, string);
+ 					return STOULEN_ERROR;
+ 				}
+ 				n =3D (n << 4) + digit;
+@@ -573,10 +582,16 @@ stoulen(const char *string, size_t string_len, bpf_u=
_int32 *val,
+ 					 * number, and are about to add
+ 					 * 3 more; that won't fit in
+ 					 * 32 bits.
++					 *
++					 * This code path depends on using more
++					 * than one leading zero for all values
++					 * in the [040000000000 .. 077777777777]
++					 * interval, otherwise the MAC regexp
++					 * above consumes the string first.
+ 					 */
+ 					bpf_set_error(cstate,
+-					    "number %.*s overflows 32 bits",
+-					   (int)string_len, string);
++					    FORMAT_OVERFLOWS_32_BITS,
++					    "octal", (int)orig_string_len, string);
+ 					return STOULEN_ERROR;
+ 				}
+ 				n =3D (n << 3) + digit;
+@@ -609,8 +624,8 @@ stoulen(const char *string, size_t string_len, bpf_u_i=
nt32 *val,
+ 				 * number that won't fit in 32 bits.
+ 				 */
+ 				bpf_set_error(cstate,
+-				    "number %.*s overflows 32 bits",
+-				   (int)string_len, string);
++				    FORMAT_OVERFLOWS_32_BITS,
++				    "decimal", (int)orig_string_len, string);
+ 				return STOULEN_ERROR;
+ 			}
+ 			n =3D (n * 10) + digit;
+--=20
+2.34.1
+
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb b/meta/rec=
ipes-connectivity/libpcap/libpcap_1.10.6.bb
index 1b10001035..1c7f40d6fd 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
@@ -10,7 +10,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5eb289217c160e=
2920d2e35bddc36453 \
                     file://pcap.h;beginline=3D1;endline=3D32;md5=3D39af351=
0e011f34b8872f120b1dc31d2"
 DEPENDS =3D "flex-native bison-native"
=20
-SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.xz"
+SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.xz \
+	   file://0001-Fix-error-messages-about-32-bit-integer-overflow.patch \
+          "
 SRC_URI[sha256sum] =3D "ec97d1206bdd19cb6bdd043eaa9f0037aa732262ec68e070fd=
7c7b5f834d5dfc"
=20
 inherit autotools binconfig-disabled pkgconfig
--=20
2.34.1


