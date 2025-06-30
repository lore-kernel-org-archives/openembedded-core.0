Return-Path: <vgiraud.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D73C83029
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 14:51:00 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.131])
 by mx.groups.io with SMTP id smtpd.web11.42575.1751295059062894132
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 07:51:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@witekio.com header.s=selector1 header.b=A2xVMhtD;
 spf=pass (domain: witekio.com, ip: 40.107.21.131, mailfrom: vgiraud@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UqLZAZS+HI+R2e0rj7/ErKXuxLV6Mhu2S0B3WA9YP4jZoo0P0l/HiW8soXkS20965qN6fJT32bIMFnPjlGJq6VhiMrtwhSnSjQ0VNltdOm3jZF0+wd9WC10k6vByY766i+4wS4w107/w2qQS8N5mOekjyNLg+7mQ78/tzMXAaQejrKg6BZVUBNWJgbppgFGhVCpH9f2GP1VMuZt/M0lgCxiLmFjOVoD2E9pvRNFESya/r8c1QU8I/7SAQbTJSsgx9Z9MT7fc9gfaT/c7LpgCMuQzkpMwYJNfUwa2pZhjg3ISJdvbXKQiq5cdK8pwCU9NIGG1Jyk67bOGNIRubgf7/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POBYJH4URU/nwCjFpJ50ppb++AGe/hkWlVAt4c3kJKg=;
 b=EiWNIn1PdIKgUgpG9JfUFep30WxaP7TyhWv5ZLNgq00Yc2U3BTMc1eCijpw3NSTa5+WD5+2OJw1wkcM5OmsMSCpkAKobLZj6Jb+MZPSjnsEv9a+LgGt+NcTtpb/IqK+xHoaM8etocNDfGegsIpABIN8JCclF0XQ6dCZopRrQzebtMBhdFjKA9g/xJNSTpKeqRymvX7wBXfVH4/w29tY/21Sr8VowRYeectJeJC4W1lYZ7PlI97V5yjB06BLonpZKwXbtsk3fDNn9UFZJ6MsLDgzyXbra3JBpM9EIu1xCn0KwjRxxyKvgt6qaqiQZCH99c5J990MQnu7zKD+PjZ8XvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POBYJH4URU/nwCjFpJ50ppb++AGe/hkWlVAt4c3kJKg=;
 b=A2xVMhtDXYtsMcjcizI0w+HJOdwCndTNs+/IXRUFK6HfF+9qb50fsPTBCJPQmyB+hq3zJUJVmphSYq+6OdEX3AQfyp/e6G7UGNBBYHsXlDvWFdru3n5ZtPT7ygAgKcsV4d62M3hiJk9/3H67n0WjzHodgoC+omY4C/kpWSXwr5PXeQQVf0445pTHIV5RBheIDMRpCnpBok6VwOTdVl5SqlGNwE3cUTlNjKgH1GIehNuICuEwYRi7tJibF/9nyca3EHbEaTs2ymjkxGJP++iErg/X7hdy0lFVI2011dH70Zwf05k/LC0zF8iNK081oKpLTV7Gnw2YOcViRg8zcjb0SA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from VE1P192MB0765.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:14a::15)
 by DU0P192MB2019.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:409::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.13; Mon, 30 Jun
 2025 14:50:54 +0000
Received: from VE1P192MB0765.EURP192.PROD.OUTLOOK.COM
 ([fe80::9356:670a:78a:d38b]) by VE1P192MB0765.EURP192.PROD.OUTLOOK.COM
 ([fe80::9356:670a:78a:d38b%5]) with mapi id 15.20.8901.012; Mon, 30 Jun 2025
 14:50:54 +0000
From: vgiraud.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
CC: Victor Giraud <vgiraud.opensource@witekio.com>,
	Bruno Vernay <bruno.vernay@se.com>
Subject: [scarthgap][PATCH] busybox: fix CVE-2022-48174
Date: Mon, 30 Jun 2025 16:50:27 +0200
Message-ID: <20250630145027.2540389-1-vgiraud.opensource@witekio.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO6P265CA0002.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::11) To VE1P192MB0765.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:800:14a::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1P192MB0765:EE_|DU0P192MB2019:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b7a80cc-2a76-4f1e-92ff-08ddb7e583d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|366016|52116014|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RzyW/B3bwIoJLSXvyAzwzWTdJOMwaPIaoAWmD59W+x76xXet5fbnzAlHSMU3?=
 =?us-ascii?Q?r1EefkGS/1kX/xtDIY1PWk8JhMIlUj+sGJYT4XzD5lmSHrYplfQCqP8F1I0n?=
 =?us-ascii?Q?ZL9nsFeV3hQK1Z1xVP5U38zFls6Uf505mwSyJOw5nf/q84UKCE/kXphEfSj3?=
 =?us-ascii?Q?KMRQgi0K2AgN9mBxfGa+W6hifNSyQSCEPTRm/+CB+oRUYbw7eLlToM3Mn49O?=
 =?us-ascii?Q?9e2t6OULaHpxqn+67E/bbmxhHpFSgWFlZLT5YbddfxfBJluUqtQkrsYB0JtE?=
 =?us-ascii?Q?88qeDDOb2ztnWO2MEw6S4Vd/trQlNpXDn/3A7BJerU6yke8rOydreRv0yhF7?=
 =?us-ascii?Q?+qKWjTHJeQOicpTq+8rcU8P1FHZOI2uB3nws/H5FLLZkcxe5iXNfjhyP2Bz6?=
 =?us-ascii?Q?YBC6u38pn15xSTaBkSZYjRYBd84a5mmVNU9FuaAclRpNVnlSJXLytiHpq7TC?=
 =?us-ascii?Q?0qXFhmNqIKjf0UyjLpClT9SuEPWRT2HXdmeb1f6vVHf6fV4CDKmaG+iafSYS?=
 =?us-ascii?Q?/MAahnYazXrbXYZcJXehEW88F18FV1Xg8uOBACY610lgzPHM/Gf75uYrjrFY?=
 =?us-ascii?Q?Pg1A3o0kWUiUNa2EeftgXw7JfOFZo7wv2PZhFyjBnkBKL8AEjgPeO/poZVDu?=
 =?us-ascii?Q?XOPlsdQ8HjIHfuN1C7di6WPLqjvOulYyP1n5VeApy6gmSst6TbFOnMQf0hWq?=
 =?us-ascii?Q?37yCPslIsP0nkGmDz6UOwoP+eZ9sKHg1phEzzhW3G1NlZNSa5+4563NApygN?=
 =?us-ascii?Q?f9N0H0J9aTCV7B5srlT0Ud96ZtJ1GdKt7hoFhZ98CTjg8O6VEw3o4QbCqxD4?=
 =?us-ascii?Q?MDMq0gk5RbdQtMO37LXpKI8gr0mxqUDVb0CVBEGhBZkZxQI+dwRk900P7s+q?=
 =?us-ascii?Q?6SHAaUIUmXCAdWQVTLeCT4Nle0Y7IkUJ3P49Btqb2bqpkyeQoQwoPzNgQT6k?=
 =?us-ascii?Q?BpikMpipKc8cwtdE+tG2/dRVdlJxuznFTlrKpt5G6aryshzOQcAqYruEntC/?=
 =?us-ascii?Q?4XuxQ+bGRM76oCnJ6v42r2o1+q1r7oZK1RzjLiuiSgcCBJBpG3DW76Cuz9TZ?=
 =?us-ascii?Q?a1vpCSiB6XWbGV8Mg4AfBe3YdfA4u7UDkreFq3u8HckuHyXi5UllUpahXUn8?=
 =?us-ascii?Q?m+DRzIYSmAogxah/ArT0fUCjxdzWoglBvF0Jnm4NQphsRdfNMdwJedf3hQvV?=
 =?us-ascii?Q?1x3M6NkkHRD5te3dLqk0AhrCSvpc6bf8u2G98Au6NoVfNNnqwlqVGnoy2sSB?=
 =?us-ascii?Q?iOcDU4U9G39KINFAMlmPYNzjCI+hwwvWVV9SqZWLlJthHv+x2jMpBhbGN2SO?=
 =?us-ascii?Q?3vnd7hiK2u/QDcaEK3ntfXMiUhDzL7Fb9csLT/KfDb60qjkRxtXK5HdeF2il?=
 =?us-ascii?Q?mFDPAgiC7WcobGjOpNC9bT8G0xFO7NprcRsrIialzj+XBIuNuNybFBdbTWTr?=
 =?us-ascii?Q?mioBx27/RRP+v/f7sBG0e5LpIPzUdfPEzOm5dyzvPYwcDn2ZfBPZwbNVRzWe?=
 =?us-ascii?Q?spKYIvpPYVxWBYa4w/h4KJq0/BvtDqXkWeI7hzQU6LdsN3Luy2cjKD7MogCA?=
 =?us-ascii?Q?4s4GHm17loPY8wHrGg17dFQJESLHMkA0waUgC4r4ff9vQToNSXE7P3Jeu0qA?=
 =?us-ascii?Q?0W3A6qUK2KlxFJDhU9LruLltOnUVsOidVSxZaKbjpSEk4w5/ok8KDorWTqDS?=
 =?us-ascii?Q?ELKrcA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1P192MB0765.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(52116014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OLUJwZPs4/8Dv7Vi5rqZ4qc3jI7EBBErVpjcO09rbJcR86E/FgOXexQVYfa4?=
 =?us-ascii?Q?RCg7BPoQfnU3shrqyT/mM+HvMXbXrm8r1AqVjZ0joEMfEtETXti0m6PrpFsr?=
 =?us-ascii?Q?SuA4yGuPMsjfFK8TJKFv7frlVLNg1NoiadMOF+K1qztlBu6Z+NtQHmxu+M0/?=
 =?us-ascii?Q?uIrgoLeU+bX3VTvRlqNFIJJW7exJWcDmdex9LxuXJhy6FiNE02Y/vifddoK3?=
 =?us-ascii?Q?W9wG9+WgwzuVqBf74LSu4CqCDFE6K7ThCh3PvADgp7fhjlf5D0krhwhcI+yx?=
 =?us-ascii?Q?p8fXr7j/AsVb8/G7EJv/LyN4oWESeZqqyO5ZSMpgE8TkAA3SOEVcp8VXiSah?=
 =?us-ascii?Q?ynfZm9U4GQdndhXAnh2+90wT+wnEBGYl4zeFebf/QvoJcDRv+OIelqxsMfGU?=
 =?us-ascii?Q?j46m6wut4VCr0AbbPEpyDzrvuN8en2H2aXCUsVqo45txCrjLEBEmSvC3NeNr?=
 =?us-ascii?Q?DleLrbGIaInH1A33VjpqifH+BozgQDUfxA2iGscLIFgUhvX8HH3rgtNZuqGq?=
 =?us-ascii?Q?S5plhNSMT/4vcfVEPMID4KW4rzQPJ3HLLZs2w5kzZVizgg5ypJTsObVqs2N5?=
 =?us-ascii?Q?nMaLRJRjfJnAupUVw3zg3A+FGCCQd1Hh9DXXZENqnHzaQg54DfHHfYsS4/G3?=
 =?us-ascii?Q?lgmgVOss2L+pp8owDuPRuRmEncHcALXJErPdYj20hwxJT4pkjxjSvQ+5RAWD?=
 =?us-ascii?Q?MY2R/HnGB9RY2tEibvJDqMD1lGtslwz5CWRTo6+Qii5yFBq9groUDgJ5hcCG?=
 =?us-ascii?Q?GsnVUalPwJOfbb/aIAHli0GrSKaJjHRAMsNq6iN55ngOOix96rtk644nsaxu?=
 =?us-ascii?Q?g5SG/pUU1X2ZkEqpeyFfSckJi7YnpndsAs5hnTCP5OTFA/ZyJPlanmFm2drG?=
 =?us-ascii?Q?09UpLaRIj/sWhpIIzvOEp+8rmjGlxShTzM0mpxSZOMbJ5cz2St169LTMFlF9?=
 =?us-ascii?Q?fZBiZVPuelGKnek5fx12ceTEPU3YpAv3YSnEQIw3ZFVAWdK19Pj3XJMYK+rO?=
 =?us-ascii?Q?y0wqIwoydvwyeIthctFf7wmoHuas62eBEEGM9I59PPRFBZAZYV9NcGpaxxrS?=
 =?us-ascii?Q?GIvx1Sk4JfpWgfFGAh8nBvSPeyzQ7OnVbBCnjZpobgaLx37RZrvIRt8EpLkC?=
 =?us-ascii?Q?p6Kk5XqkGJSIsFSC8kI0b0W1BQWcxZ0427O/utNdUqj7abvGA1Mv09Z7xWTG?=
 =?us-ascii?Q?BF1TIYqOnampfN7uFpB9ocxNFV9VfDrYw+1Ac+IUKDYP8vHXYeOUSQOno3xX?=
 =?us-ascii?Q?9MVMxBc6/JHpHLM+P4bcumz0CC426Uc22eLMi6ohNZX/bxOfl+njbrt3IKOx?=
 =?us-ascii?Q?iB1tAb+yULhRG6Aba0DyFX/LH1YBuSqnAYQ9Cgq9DHhJzSajrpQvH93f/F3i?=
 =?us-ascii?Q?8IwmJAtkjReo89hlBlRB3djPJ6qPHQqr9t8Vd6pBbdgv8T7TlF5ZFkKKna2t?=
 =?us-ascii?Q?McEB4XGgSeR/sbuquQy6mg+31ji1WIQCSAcLXBD+miCb2B1z/yyouFffyF2m?=
 =?us-ascii?Q?VPNt5iZ9BzPWgqUvspEpaCzLKeb5BafEMGcKa/qxEO3LvasJQgQ5qMb2UUd6?=
 =?us-ascii?Q?BOt9WCkiiBGAn+fDinObSdXY58g58A2jijRNx8d9M4dm5jboBCyr7qLqTJbr?=
 =?us-ascii?Q?uTjUEcZ2H25Zyzq8SiN0h1jvkHj5iT+1DIMGrKHVyrLg?=
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b7a80cc-2a76-4f1e-92ff-08ddb7e583d3
X-MS-Exchange-CrossTenant-AuthSource: VE1P192MB0765.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 14:50:54.5821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SF47NY3ckASMz5G3JtXP/jTsusfBvvaeKHwCTafF7sYihzaCH8yWrDRTbhWUYmjeGOzzEbotdwXNNh2TEZ29ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P192MB2019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 14:51:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219525

From: Victor Giraud <vgiraud.opensource@witekio.com>

shell: avoid segfault on ${0::0/0~09J}. Closes 15216
CVE: CVE-2022-48174

Upstream-Status: Backport [https://git.launchpad.net/ubuntu/+source/busybox=
/commit/?id=3Dca2afcbf42017d998ce3d6726f5ff5072a3fa853]

Signed-off-by: Victor Giraud <vgiraud.opensource@witekio.com>
Signed-off-by: Bruno Vernay <bruno.vernay@se.com>
---
 .../busybox/busybox/CVE-2022-48174.patch      | 80 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2022-48174.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2022-48174.patch b/meta/=
recipes-core/busybox/busybox/CVE-2022-48174.patch
new file mode 100644
index 0000000000..01d3213281
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2022-48174.patch
@@ -0,0 +1,80 @@
+From ca2afcbf42017d998ce3d6726f5ff5072a3fa853 Mon Sep 17 00:00:00 2001
+From: Octavio Galland <octavio.galland@canonical.com>
+Date: Tue, 13 Aug 2024 10:42:58 -0300
+Subject: shell: avoid segfault on ${0::0/0~09J}. Closes 15216
+
+CVE: CVE-2022-48174
+Upstream-Status: Pending
+Signed-off-by: Victor Giraud <vgiraud.opensource@witekio.com>
+
+---
+ shell/math.c | 39 +++++++++++++++++++++++++++++++++++----
+ 1 file changed, 35 insertions(+), 4 deletions(-)
+
+diff --git a/shell/math.c b/shell/math.c
+index 76d22c9b..727c2946 100644
+--- a/shell/math.c
++++ b/shell/math.c
+@@ -577,6 +577,28 @@ static arith_t strto_arith_t(const char *nptr, char *=
*endptr)
+ # endif
+ #endif
+=20
++//TODO: much better estimation than expr_len/2? Such as:
++//static unsigned estimate_nums_and_names(const char *expr)
++//{
++//	unsigned count =3D 0;
++//	while (*(expr =3D skip_whitespace(expr)) !=3D '\0') {
++//		const char *p;
++//		if (isdigit(*expr)) {
++//			while (isdigit(*++expr))
++//				continue;
++//			count++;
++//			continue;
++//		}
++//		p =3D endofname(expr);
++//		if (p !=3D expr) {
++//			expr =3D p;
++//			count++;
++//			continue;
++//		}
++//	}
++//	return count;
++//}
++
+ static arith_t
+ evaluate_string(arith_state_t *math_state, const char *expr)
+ {
+@@ -584,10 +606,12 @@ evaluate_string(arith_state_t *math_state, const cha=
r *expr)
+ 	const char *errmsg;
+ 	const char *start_expr =3D expr =3D skip_whitespace(expr);
+ 	unsigned expr_len =3D strlen(expr) + 2;
+-	/* Stack of integers */
+-	/* The proof that there can be no more than strlen(startbuf)/2+1
+-	 * integers in any given correct or incorrect expression
+-	 * is left as an exercise to the reader. */
++	/* Stack of integers/names */
++	/* There can be no more than strlen(startbuf)/2+1
++	 * integers/names in any given correct or incorrect expression.
++	 * (modulo "09v09v09v09v09v" case,
++	 * but we have code to detect that early)
++	 */
+ 	var_or_num_t *const numstack =3D alloca((expr_len / 2) * sizeof(numstack=
[0]));
+ 	var_or_num_t *numstackptr =3D numstack;
+ 	/* Stack of operator tokens */
+@@ -652,6 +676,13 @@ evaluate_string(arith_state_t *math_state, const char=
 *expr)
+ 			numstackptr->var =3D NULL;
+ 			errno =3D 0;
+ 			numstackptr->val =3D strto_arith_t(expr, (char**) &expr);
++			/* A number can't be followed by another number, or a variable name.
++			 * We'd catch this later anyway, but this would require numstack[]
++			 * to be twice as deep to handle strings where _every_ char is
++			 * a new number or name. Example: 09v09v09v09v09v09v09v09v09v
++			 */
++			if (isalnum(*expr) || *expr =3D=3D '_')
++				goto err;
+ //bb_error_msg("val:%lld", numstackptr->val);
+ 			if (errno)
+ 				numstackptr->val =3D 0; /* bash compat */
+--=20
+cgit v1.2.3
+
diff --git a/meta/recipes-core/busybox/busybox_1.36.1.bb b/meta/recipes-cor=
e/busybox/busybox_1.36.1.bb
index 42dd5f71eb..69e9555766 100644
--- a/meta/recipes-core/busybox/busybox_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
@@ -57,6 +57,7 @@ SRC_URI =3D "https://busybox.net/downloads/busybox-${PV}.=
tar.bz2;name=3Dtarball \
            file://0002-awk-fix-ternary-operator-and-precedence-of.patch \
            file://0001-awk.c-fix-CVE-2023-42366-bug-15874.patch \
            file://0001-cut-Fix-s-flag-to-omit-blank-lines.patch \
+           file://CVE-2022-48174.patch \
            "
 SRC_URI:append:libc-musl =3D " file://musl.cfg "
 # TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.html
--=20
2.34.1


