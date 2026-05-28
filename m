Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E54CD4F54
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 13:59:59 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.34])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11470.1779976725193773973
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 06:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=BmND34Jf;
 spf=pass (domain: est.tech, ip: 52.101.83.34, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hB8EYBd+2aLaLhxANcuMhf8ZDPb/xg0aszH2wP1WoyrZkLoCXr47xRMmBR3wH+RKyTPCkC5rgltU6JylRZsagSf53OYi6vqDYo94oEdG+tOVvSmvbPc/V0xoxevh7Qmd/Ss0PILJdIhzvOa2ec7x0PmNGo+edF+GhLSTnUBJur1X23GmUcC2rruwK4m/OOzTIjEhm4j7FAfiVQVPFL0zY2DbY++uaVPOHuY0t8BUxwaTA4rq3xGv1qw9j0c64SOcDEBPD2vnHvysmRrZuGdqB5itUFuvqvFaPxuZoceTfKiBR/NJPH94CSmO3f563zoT+3tQkeqwj8zOjcVnAfuxCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyJ/a+Q5pXOU3Fh259MoEYyjBZZn3kEbjX+ohL4dxoM=;
 b=bCCrWxhGbxSQI7vmX8nRfH1zyJhUra3rkPY16HhlXFXDUMnWG/F+GEOv4/5NEkIbaBKt4lxD1aedKZ2OnA4F5ar+yI379+NOcogd0UgvHpFWFPXHzM6YscwwhYpNUpnt7BaStmR+OW6EvNjWvZze+W8ofqXkVZ3boeoHnqpHM2k/Q2aRV2Oewm3ROXBrFr+1uw2ObuNBZu0XQMct04TS6QMY3fVa+xz2m7EdHh17xRacuktqOQUj6RDJ58BxD2p0BHOMko2jJR7tPYf9eWeTxPesm2/lDcIWfXTsPRxlzBT0CjtSYQ4M0evh0nTSbXvSvYqzI87o6Zx5qAVXTA2JuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyJ/a+Q5pXOU3Fh259MoEYyjBZZn3kEbjX+ohL4dxoM=;
 b=BmND34Jfy2s5v4z975JmgtU2y5/7PIqlpVbzJbvDZUN/51oWru7sjshpiNMMchANaYblOcMlLGBP2+NtZLfC6RU90WG6ragi1iorAlIGThJwkp7fNbvmPKnTQKrnbDrvT0SZVKPkbcW+2scRUc7zSNwnompE436vy3FVHXnX5nQanUJls4vZLxCMRpLFIZRtifRoae/TnjsJ08tlciLL40NohV78SdrQBjrJJ0ltbkVWJeI1Rexvg5sHFyao9IzE4MxvVJUIXz15w0GPeE+SfTEA3MkZO/PxZ7KPCgkHknL/IwRLHyt7hcm4uU3KJClEs/chUTaRNeNXPTbMZc42Vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by AM7P189MB0963.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:175::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 13:58:41 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%6]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 13:58:41 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][wrynose][PATCH] libpcap: fix error message on 32-bit integer overflow
Date: Thu, 28 May 2026 15:58:33 +0200
Message-ID: <20260528135836.302623-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: DU7P190CA0028.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:10:550::14) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|AM7P189MB0963:EE_
X-MS-Office365-Filtering-Correlation-Id: dca0dcf8-42ad-4573-3f46-08debcc13934
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|6133799003|11063799006|56012099006|12006099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	2HVsEehmEu3CeQLGSAJDdvDDtR2doQHdF/AkZyc1fQMTUi1gi5qm6Cv/7MdhFk/EJupNVNAALr8qAX3ol07fZ2EwhqI6/AT2svqLxKbghABNSANbgtOCtYxlxUxIGuIyeo1wwrNQY0XxJOuJNoHxlQlhm9kONmCYpGbcf9G8CYhqahBwFvBPAXK/ucYnOoBXfDj2Ry4Dr4Cgxs37iz6nS4f6XX4jzH28szXjMWtSyLf2mh9tMUj4JObn7CphRsmtwLnqJGZsiiWtlKhy3i1sFZ1G921IJA5Tb1Hln3SKlaxzGrm6BvKEppHmxlx2VYlmKc1ghnVJmRxIBWEdDpMtsrgv1+K5Fg9TylBCnXWJWIfWk+wDzsJl0NecqK8hzutEuw+yUmMH4ox2bcz6RasPIxm+I4Oyf88nkE4jmNw7V/wt507l+mWsPhEbQnEYFtY29nacs77uclfrSndgqrcUHIcDLJrSYQpr4nhEvCnLrdSjea7f5i2tV/DwFrror+qpLvUqOVO6HuSOQWK5Jw67WUR1dKzgmweOiUEuuiG6RsGBw6MjJzQk2npjwwLgPqZoN8XnNEa4hEJF7vFjJ9UfHGzOuvV6aZ8owr9vdACuDRJ72AdptnlWKKWrsarFsixfRVy0xgroISghWt+vfNlqzA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(6133799003)(11063799006)(56012099006)(12006099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Z66hxWpiD6SAUqAYIQFJEvxFsBGn+sirX8Y9R7zY3kEeOJzUW106I5F+ebDQ?=
 =?us-ascii?Q?YKoXutiKcAknk8MiVDPZK+fKTOTyjLgr/xwj2SjkR/xYEO2IyuJ/ZqNPDiI/?=
 =?us-ascii?Q?sX2S5HRkudMQ/3v9LGDlk6VDyXiiIlQ+1VdLkfg5KPZZRNhNOsrGFYZoN/KR?=
 =?us-ascii?Q?KpiB8KcVYr7ABoNTYM+sT9pIwJwtZqUexK2gn6onOohZqpv83LIgtIED3Tdt?=
 =?us-ascii?Q?MqZnOt7Nz+q9W9SqWS5kTNDyIlQwl7LnSaUGUp7YRpP+ErVqDi3s5PfMhTO3?=
 =?us-ascii?Q?G+ZTGByMHdrCAHHYAIvD0TmOeO+QulLPdvGGOKA9Whw+zsWx/R7qT5TzfH8p?=
 =?us-ascii?Q?Sr0Ue4KMLFaMTTTcrRnypVU/Yle0DiW30Fe1cNMVOJMoxAuKiSuPkDIU4wq7?=
 =?us-ascii?Q?YVlPflzxb9uNp68FcepTBT4zAdTm+Xao5j5yJ4GLY89JsQV/QndzSKpg22oR?=
 =?us-ascii?Q?zl3+JU7AOjWn6EXLuxAlNDymVwCDQtvnQIupmpWpTGLfCnfr0YPdbmMnOMWZ?=
 =?us-ascii?Q?vqk9LMuZYfVThmAhFWT/UkFxJ5V7vMHjKYDKKK6M47ZESGczk+15ToxqWyn/?=
 =?us-ascii?Q?DEGW6CQPFs6/S6YbQYs9EsCUvuEL0ya6/zDru1rFvKshAt6N6S/o7YI/DwwN?=
 =?us-ascii?Q?GOgpL0u/xKixRhacxmFLHAJLbKWvwwefa76xxJ1f0TFw3GGhzD2WOM2+LTjr?=
 =?us-ascii?Q?B1QBSxmjtWgnz7EKd1go/ae18zLBzxragdiYV0sVoDRU/f1+LqFQBNXvge6b?=
 =?us-ascii?Q?8XMMo/YtOrRmY+KPW1oi5fMVHSi3hc4KGWmRmjHTCCBMhVcT+S8xdhrwbWut?=
 =?us-ascii?Q?75ifmxfWwvN7P9z0Ie52GkIqZKznvevToMCKvJnGOvOx0FbQ8pJOogRQP7H7?=
 =?us-ascii?Q?bGSEqzYEggNhPb4lWqc34EiBizZN62bPP6f5crQ4FV1PviHRlVNsSJX3MpPj?=
 =?us-ascii?Q?69Zl/hB5iBMn2kWZL4wlxOOV/pgNsVycF4fwGDqrN9KXx8PYYQcMgaYH/aNF?=
 =?us-ascii?Q?9qkc0DX+Awu6KMPFZ+JwFKUt6EizpZw2GnQlReyAGl4H7XtabDAMJn5mW5PK?=
 =?us-ascii?Q?1+P9bgmdlNmrZ7CYzhsftObH5hep+ZHf5SXO91uS5VxyFHqEADvyyIp97gz0?=
 =?us-ascii?Q?Mj9JhLT5F9VP2cxGtLVAR1PXOtwHxvAzONy/R1XpFysUTm5D3ljQOAO1fUsm?=
 =?us-ascii?Q?plWqxjwtEGzMRoP87YpYW75yy2ozJ2jl1KpZR8k7af+UY4rBDeEOgptKrgsE?=
 =?us-ascii?Q?ztJppVGhBnhEdrSd9wo80c54EWt2PRie4MLs56TYWhumx69ylsybOqokXWkd?=
 =?us-ascii?Q?5QnXOC6ZY23+WaRpQ6ZRhdvTX53ZVYsQAK1YAv6CexPrabRAlw6ZrVaEHzhS?=
 =?us-ascii?Q?7WdCXJ1qcs062FAyQ12I6frFCgrrFzwweM4oWLUU3CG806pSj4axW28OUExu?=
 =?us-ascii?Q?UEUHu+NwVYhbL0PF3fL1bosno8cEbyYxqsAxefNtTgn5CnZRksuef95SHQf2?=
 =?us-ascii?Q?1t/68vNtG7mIOWqjTUOVBgv0kJ6h6cc9Si8Nu07P0CmkMwVdV/kr2qsiopVV?=
 =?us-ascii?Q?gmFrOsAW0NcqJfJVXDyADTjQSmPwh4Z7vW69wDvujf3ErWqaBsaFGqjgpTdI?=
 =?us-ascii?Q?dzeuxnggG7D4o9X5EQKj0USAdlTvWlFzpcYAjPJD8EgcbtNOZFCeor7u/7F3?=
 =?us-ascii?Q?LRSV9uGZfPws3FGM/ytflSRVMWLkSxWX398pLXZc9iEQL5W1Sh3j0sTBJfEl?=
 =?us-ascii?Q?0lXN4jXImWKHS2so7guIrWHRN5EiXDc=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: dca0dcf8-42ad-4573-3f46-08debcc13934
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 13:58:40.9063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yy1lCh6xUdbNxh8eQnL4CK5dLzyzi3jRAXGE7mezkkGBKlmVFnMK3R1T2fBC25s+nBLRMv76pVg7Hfx3Ov0j1m5cCVRo/dm4vjUv1IjSxCA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0963
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 13:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237711

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


