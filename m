Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11CCBCC6B1A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 14:39:16 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15337.1791988748056411672
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 07:39:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=pX53FAhB;
 spf=pass (domain: est.tech, ip: 52.101.70.53, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jad8ua57AI5YK46npZtPJ+KbuQoZl7D70vbbNLYGu31NFlILCzty2+QoOG8PSixk8LYDIVLZ4vr8j2JnhMj4c20ONsEYIywSR8bVccaMhJEY8xza6U16lu8YpUnPbDeyF1+wUNQG2AuVi1lbdmJHxD7U+NzrvL2pCqq7w4zcvh0lUAf7Oy421JH1MFn3S+ENVa4wSDS4mEg2CCDosyef7AP1rd7li40JlywbdN+OK6jEX5ClMnGwW8kKfBiMGdpbzlNoKOSHcwKSTjkQL6KctFQJBJFF8EWZ2vWGVS0C6oFtbxNDmhh9TMvzXedt09hPHRsrXBlZ3Xdx92jsAYp5LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHNbe5LjwcsnxZGYzHa431uJiWb33kDZFR80EXu8kbs=;
 b=dOew/LWc4YGSday60T4plQ925pBoN3p1JJKlQ6MFZIg/7B3v8ejOdZP9ULYdRH0/U8Yp+ICxP4qNp2D+41y7Y3ghn6r/2WIFGt6TcPBOMPIuzH8ACJjxRFoQZzs4oW1bKreZG4maFQYohKsw+So4rh0bzw6YbS41tYEv1aHFHgdUM1a9ZiWXT7DUrhndvRwALlczwa55m5SsYSHXBqBtxYkT46xFU2gSRkZcJd+wLJReDaYtXf7Cv16Z30SOviVYb3ZV+Anelfb66xAJGJLM3EeqTA9afLRvyn6fMSNsIUf2miVHVYQHDqyuxnK6gwh2UqKHhbS4YW7vGbV0/iuQ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHNbe5LjwcsnxZGYzHa431uJiWb33kDZFR80EXu8kbs=;
 b=pX53FAhBIhV0B83eUF8N8gE4namWCV3FfUPfypFyGCIJDvOoWNuZwbuUa9gIopbslActcHTUNjLj81OPaE0meATR/o1Iz8HxUH5mlYjJvlfp86P/Y844v9dfvYKxs1bsqaFP15iZHZC0TyFAHB0xfeEMzHN1X/Q0FLUfL8/iLtjYMKWH0AsHVu5uzVOmnW672Ns9y1I511dv09vJ7Y5cuBwfvfZcC9nqugy+diRpIgxorGrkL75gLVvONEBftsZmyMYTuLfYPJhvdoCWngVSTcDhsmyaezm0iVvUfsC2PrBmbbd+sCg+knO6K8rtDPJb3Lex7L2PZP/r5v4wCD7vsg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by BESP189MB036075.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:138::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 14:39:07 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 14:39:07 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH v3 5/7] libpcap: Fix CVE-2026-6554
Date: Wed, 14 Oct 2026 16:38:54 +0200
Message-ID: <20261014143856.74426-6-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261014143856.74426-1-jaipaul.cheernam@est.tech>
References: <20261014143856.74426-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0353.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::16) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|BESP189MB036075:EE_
X-MS-Office365-Filtering-Correlation-Id: bef01695-9e03-46f6-5ce7-08df2a00e6d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|12006099003|18002099003|22082099003|10067099003|13003099007|3023799007|11063799006|260925022911599003|260925021311599003|260925021911599003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	5HMu3GpHq4Ghi5ph1j+0BBxT/15L44m1lljXvSKPxsmjvCg7kFEOycjYn9vo9LykPP/aFPYqgPF2LbWXeFiAjvyKEFmdQArA1hjzrMEAnK847GmRMgFAkdymwK8W8ca3SR77JsjC6h4lyPJocjNegwNiDxdwP5d335lILlyCVkiZ2jbkoX1J2AGW99eaCRRoNkrsmRaQPZNMH69tQa6vqyHfgaGNi82xvLcwLIp+h0yrhKGwAOjGKE3OPP0rQvGIBBAbgGi4dKeBLx+HgnXRXiRBOWGhsjURDpiu44dJH+F8W20amPHaPYfjnTqgJ8fA0OwpcplAa4BWQXo7UZsPyyBWnY5gfCXnB3OeMoBWxlzClke1KSFkAaBKDIezNzIV3IR+UNVU3JTuTcGiBqBHkFBx6zf2+DiIcRVZmY+cjmJxPK5sF6X6VNHc4jpQE69vstk3HwZo/VWdeBOaK2vzI/SZw1/quHpGhvpLoRGCAQmpHYNAoykgQJtwHdT02gJWh4yNa28mBUfIw8meGsTWPs65zTtK/p/2YIKnsMBJWDMhwlusrNO+EJXibHXUXhMMzBeBa8lskTAj5g6hkXxS4cfcTvKQkdAppzTliV50NO2GNcALn2V5xSmoQtozMqYp
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(12006099003)(18002099003)(22082099003)(10067099003)(13003099007)(3023799007)(11063799006)(260925022911599003)(260925021311599003)(260925021911599003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NFRQEcF1eXkDScvaanlCY8/xdXokBWVn7QGgMVu/9k5J/o92X+MFnd5FWIvu?=
 =?us-ascii?Q?Apsvd1lOexiwhKE9R5IahX7TcSUDc2A1LLNgm2hCf3dJfUHagYyX6fIHkxtR?=
 =?us-ascii?Q?CHgZ9HB8eKGn2HZaeotvPV/uwMqAqU61ghsjZ2BfqlESPqlgQZchngzVMslR?=
 =?us-ascii?Q?E40CMc+yWijJFsGlt3zroK2iGQp/vDtk5ke8tQnvaNMhs/mi/BT1LxcDlFvz?=
 =?us-ascii?Q?dA/V3Y6P9nmeJ7W9krafFq9qxLDZmfnMGpDziaXFXRUm4iXOWwIUI6Yii4qh?=
 =?us-ascii?Q?YeHKS8YzQW6sso09Su+vgviiYLHQ0rtte6Ugpjp9KL2TQ5CYaz9lMrlQMiZK?=
 =?us-ascii?Q?Fu43M5d8o4TDbRftQuT8So860l+/xpRaRZRZmZKUCKOdlNjljM6ZhNlYbJuW?=
 =?us-ascii?Q?OnC1mCxmVHjTpGh5JqeDY+7G3H7HM6hW0rUQqoh1p4DBHZh0kQZwpiRf8ndf?=
 =?us-ascii?Q?G0NmTW0B1VIXAevCGoTv+CzoJ78nA7v09ymN6zrL4CbYqAYN5mmfjDZuibBT?=
 =?us-ascii?Q?ZuFeauhNyUot5i/J8rBNiojt0D+MxbFZD60rXxnw1PqM8zkZ5YsxG8sGqKzK?=
 =?us-ascii?Q?fXaQXHWtefmO5UOR+txjwrCFiI3TbXk5grAayr0Gs1i97UD2lUkryXo9JiI5?=
 =?us-ascii?Q?2O2zGBVoi0/LNbcHk/mCDHJ5K9Ij/RhBShxbla+Hv7VPAy226gfyxEnJWjLU?=
 =?us-ascii?Q?9UMN5ki0O9p474qzRxYri1Ni1fLSIrrXQ4uevslKvZ+2VlBuUSMUOzCcE3dk?=
 =?us-ascii?Q?whuCTUFFUkNE+WppUCO8iCH0YLrCQn1r4bDjuiHBTByzFE0iN8uHSEFNfyBM?=
 =?us-ascii?Q?61WGP9KGwPkvcHu42WH1MdzR/Lke+C47TEkd3k2EhFNwEjWh0MvX2YS12e67?=
 =?us-ascii?Q?UfvRaI5AJfMnb2N0J5j0qfTJVQL6qboT702dqMRf4TNHHjd+wXMl2IbKspjY?=
 =?us-ascii?Q?7OdEyseVXJKubYkNDmiwgAVHsruIudpPRfFn7WlXeakdtloftXUvpVwTMfFd?=
 =?us-ascii?Q?DYynX9992Sc/jCRQmWBgfx4LAL1cqSjVVgol5nl1BgQ6G+q0NdsqGWPRjdgG?=
 =?us-ascii?Q?oN3qZSeecAKQBmFRgQ6loXZRAHEwGvxrrARCV5JoC2ESE0bvY6JQlD9R1QBz?=
 =?us-ascii?Q?6asme4zqwSb2QRMz3wuoUwsabwKojsAn8kG43ABy3IVX8hKjR9gGCWOSBnnu?=
 =?us-ascii?Q?pkcUMVbT1rP9TJn+siYnGS28Tu7RJQXPUy6FVktbLgo6lIC2I0hku+epTLoE?=
 =?us-ascii?Q?lvZ5oV5lAjUuYNx5LkeIiaZSzgKPn3bqZNwHc67vAEe9gtoEVN4qYD4JFiqI?=
 =?us-ascii?Q?rlx/KFwX1MNyXILZE0caE0TR5UCMv7bN6M78A6mZ3hv38CxcHDth4ktFWXgE?=
 =?us-ascii?Q?KWXeJEjJxzE1YF5Jx7KSsPiZFTPK2Ox6dzBjTfL6w3CvLzKW8vagDt3DxB+q?=
 =?us-ascii?Q?8QtFRiIVg8xqXghIq5QXVg09JHI2AHwLUIfgkMedY+TvEMdJ78NB67Zwupps?=
 =?us-ascii?Q?V1DkLL9k7xLP6OxPeqOnKhccOfQdm1APCo4yatglLhXKMW+0neaYslh+Nk4d?=
 =?us-ascii?Q?8NUcvc5OMazSizM0bl29DMr1FKCW6rjwSb/JHPXjoMhgnnI6L4ACMJmwvHHZ?=
 =?us-ascii?Q?Q1uxj6oRe6/PDXVmcCrRTyP0reKiFWS3PEOCW/enPaa9yY0/3B8Ak2u/XlB1?=
 =?us-ascii?Q?/h+sopYCSVv+GbQ4lZ74m47d38WWctjc5wBluc0XelBM1c74NAUViKruTG7U?=
 =?us-ascii?Q?fFkJ/xn6Qw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: bef01695-9e03-46f6-5ce7-08df2a00e6d1
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 14:39:07.1845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WqPTZ9mBycQ9uE3tH3oLorhQcgCl/i6b9hxSiB9gyio/yIqsLiumOZOJmeMjc+soNNzFbl+xxILkISHMr3vgY1vhNVfR3Ssg98sBVp0kLDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESP189MB036075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 14:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247771

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-6554
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/ff3c83=
475ac303c6b681c52ad0b6e14795a8e0ce

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcap/libpcap/05-CVE-2026-6554.patch    | 92 +++++++++++++++++++
 .../libpcap/libpcap_1.10.4.bb                 |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/05-CVE-2026-6=
554.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/05-CVE-2026-6554.pat=
ch b/meta/recipes-connectivity/libpcap/libpcap/05-CVE-2026-6554.patch
new file mode 100644
index 0000000000..9c44294d1f
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/05-CVE-2026-6554.patch
@@ -0,0 +1,92 @@
+From ff3c83475ac303c6b681c52ad0b6e14795a8e0ce Mon Sep 17 00:00:00 2001
+From: Denis Ovsienko <denis@ovsienko.info>
+Date: Thu, 30 Jul 2026 13:34:33 +0100
+Subject: [PATCH] CVE-2026-6554: Limit "ja L" looping in pcap_offline_filte=
r().
+
+This vulnerability has been discovered by Kaixuan LI.
+
+The current revision of pcapint_filter_with_aux_data() assumes that any
+"ja L" instruction in a filter program does not jump to itself or to a
+prior instruction that is guaranteed to reach the same "ja L" again.
+This holds for programs that have been generated by libpcap.
+
+However, this does not necessarily hold for programs that come from an
+external source via pcap_offline_filter() or [deprecated] bpf_filter().
+If the interpreter executes such a program, upon reaching such an
+instruction it will begin looping infinitely.
+
+To mitigate this problem, in pcapint_filter_with_aux_data() enforce a
+hard-coded limit on the number of backward jumps per packet.  Ibid., and
+in pcapint_validate_filter() as well, reject the only immediately
+detectable case of an infinite loop.
+
+(backported from commit 63c005c25aeabf1404968add49fc885da3e127e0)
+
+(cherry picked from commit ff3c83475ac303c6b681c52ad0b6e14795a8e0ce)
+
+Notes on backporting to 1.10.4:
+ - Adapted to the 1.10.4 pcap_filter*() names (renamed to pcapint_*()
+   after 1.10.4).
+ - The upstream CHANGES/changelog hunk is not backported.
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/co=
mmit/ff3c83475ac303c6b681c52ad0b6e14795a8e0ce]
+CVE: CVE-2026-6554
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+diff --git a/bpf_filter.c b/bpf_filter.c
+index df92c433..ae8a3a36 100644
+--- a/bpf_filter.c
++++ b/bpf_filter.c
+@@ -72,6 +72,8 @@ enum {
+         BPF_S_ANC_VLAN_TAG_PRESENT,
+ };
+=20
++#define MAX_BACKWARD_JUMPS 64U
++
+ /*
+  * Kernel BPF implementations tend to define BPF_MAXINSNS to 512 or 4096,=
 the
+  * userland interpreter in libpcap is meant to support much longer filter
+@@ -146,6 +148,7 @@ pcap_filter_with_aux_data(const struct bpf_insn *pc, c=
onst u_int proglen,
+ 	A =3D 0;
+ 	X =3D 0;
+ 	const struct bpf_insn *pc0 =3D pc;
++	unsigned backward_jumps =3D 0;
+ 	--pc;
+ 	for (;;) {
+ 		++pc;
+@@ -320,6 +323,17 @@ DIAG_ON_DEFAULT_ONLY_SWITCH
+ 			 */
+ 			if ((bpf_u_int32)(pc - pc0) + 1 + pc->k >=3D proglen)
+ 				return 0;
++			/*
++			 * Terminate the program if this is a non-forward jump
++			 * and is:
++			 * - a guaranteed infinite loop because it jumps to
++			 *   itself (exactly the same as in the validator), or
++			 * - a backward jump after many enough backward jumps
++			 *   already made for this packet.
++			 */
++			if ((bpf_int32)pc->k < 0 && ((bpf_int32)pc->k =3D=3D -1 ||
++			    backward_jumps++ >=3D MAX_BACKWARD_JUMPS))
++				return 0;
+ 			/*
+ 			 * XXX - we currently implement "ip6 protochain"
+ 			 * with backward jumps, so sign-extend pc->k.
+@@ -607,6 +621,17 @@ pcap_validate_filter(const struct bpf_insn *f, int le=
n)
+ 				 */
+ 				if (from + p->k >=3D (u_int)len)
+ 					return 0;
++				/*
++				 * The only type of infinite loop that can be
++				 * detected in this function is a "ja L" that
++				 * jumps to itself.  For this only k =3D=3D -1
++				 * needs to be tested because the check above
++				 * has already rejected all other values that
++				 * would wrap the pointer equivalently on
++				 * 32-bit architectures.
++				 */
++				if ((bpf_int32)p->k =3D=3D -1)
++					return 0;
+ 				break;
+ 			case BPF_JEQ:
+ 			case BPF_JGT:
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb b/meta/rec=
ipes-connectivity/libpcap/libpcap_1.10.4.bb
index d23a018a95..f7ba1bf3ea 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
@@ -21,6 +21,7 @@ SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.gz=
 \
            file://02-CVE-2026-31912.patch \
            file://03-CVE-2026-31911.patch \
            file://04-CVE-2026-6244.patch \
+           file://05-CVE-2026-6554.patch \
           "
=20
 SRC_URI[sha256sum] =3D "ed19a0383fad72e3ad435fd239d7cd80d64916b87269550159=
d20e47160ebe5f"

