Return-Path: <vgiraud.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 010F6C7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 07:06:51 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.113])
 by mx.groups.io with SMTP id smtpd.web10.4187.1751353598555037146
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 00:06:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@witekio.com header.s=selector1 header.b=o7gpiq3G;
 spf=pass (domain: witekio.com, ip: 40.107.20.113, mailfrom: vgiraud@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fwysjUuvHMHiDibaNhI6xiIULhW4+LRdw5eXo5AStvGUanAuZUS2aEl2T0r1dZQQA5eJ5G6Ztw3dwfGl3bRr77YUP0IrYhtBqVpb0ZHmZ3D0+fxqRXUoU+N51K8l0VKIUvGJPh1Swq5xVSuzzyITXyCjI1FtTE57InWrgcQzwlet6Y/NRVwvjYHwDGQAyfkiolwpFZhrNoudRaEZuNVnZPzExTNpphr3OG12rWjz+Qe1HwLjAuYi7RH4Zm2B92DpZ2atdhn552P8ofupEmawErGhEqT9FChcIjgQ15vvmSvBMsb1kAJt7YuAQoW//VpQdBNFS+kbP27PurZTzOtCfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94IFCkh9WPxk/6Ifu8fLt0bEBsxrnOWLqKhCSskjES0=;
 b=H9ciGtcwCAv2d+Pgz+FenvTKTcAG3aG+ZRqLBdA/0NJJCfl9C/XaEKmf+qZ5/1TE36txpXY5ePRB7jCW3dpZSeAkXI2hlD0kXjw9EsnpWp3EgKhJuLXXmsI8Y3GBxlpKrj4K1yUHoXBw3/p2i4oo83XnCU1I/rTCypQQVJiEiSt4WP5gJ833vMC+QXPSi86fxJQFjRRVSMY+K2VM9tRdmQS2c8Ekd7Uw4jIOGEiGmq0qJayqw0j1tqm31F6QgHE++68EwJ5ouGaRo9aLRD01G8ypQNbI2gAKtwXrAonEnkAwjv8vRh451hiX3JBchUmVFWooEzA1ud+vFD844JCoiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94IFCkh9WPxk/6Ifu8fLt0bEBsxrnOWLqKhCSskjES0=;
 b=o7gpiq3G2zUCeNtSt+fGLlv0DrbyGZbU9VsZ4OdDklB38opPR8UgLybNI9o3Xjo8DpRmY9imeOJl+KQgouE/XeSvHTVqkDFUiwvC5WW7NqWd8hu7lVXcaYRHG5Z8mB4wJzzUZfN2FuUBswMdI4OUa9gFmZKHXeFoH6F1a5sVj7YtXdaRTSxRuSSPB4yj1EzKKeKqifR+A1fjnQxQ14sJkFj9FT5H6EGAg452bFMC3oKIO0FrycxNhJ9fhPrdIUQjM/3pC3NyWKSDeyj7NSjaugAs1zxjQ1BEQcyydL3+cgS1fTSzlCkgmawtmb+XcCln6sKr1I0KxAoHJQnIeiqr/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from VE1P192MB0765.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:14a::15)
 by PA1P192MB2340.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:450::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.15; Tue, 1 Jul
 2025 07:06:34 +0000
Received: from VE1P192MB0765.EURP192.PROD.OUTLOOK.COM
 ([fe80::9356:670a:78a:d38b]) by VE1P192MB0765.EURP192.PROD.OUTLOOK.COM
 ([fe80::9356:670a:78a:d38b%5]) with mapi id 15.20.8901.012; Tue, 1 Jul 2025
 07:06:34 +0000
From: vgiraud.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
CC: Victor Giraud <vgiraud.opensource@witekio.com>,
	Bruno Vernay <bruno.vernay@se.com>
Subject: [OE-core][scarthgap][PATCH] busybox: fix CVE-2022-48174
Date: Tue,  1 Jul 2025 09:06:12 +0200
Message-ID: <20250701070612.2617074-1-vgiraud.opensource@witekio.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0282.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::30) To VE1P192MB0765.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:800:14a::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1P192MB0765:EE_|PA1P192MB2340:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d5454ca-96ac-4ee9-7103-08ddb86dcfd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|52116014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?h7JlSdqKjBU/4tTWNtGfCjx92i8XmuXU4v+cOClWHFehFGq6kScdrByuPbaE?=
 =?us-ascii?Q?KVyAMsYgaY2gW77v4jgb3Gy5cLH4/g+bCEBAoB/NvPfNmVEwlbrOSlgacdq7?=
 =?us-ascii?Q?UPCCo6T73SjvROca8Dm5YD/iwFhz+tG+2iHf5MtaEG6Sv04yyEEiA3ca1Mq7?=
 =?us-ascii?Q?zXKSSPJGfaKjyTVD1jzWHmC8Fh2gCk2kANGI7UyCv4omO1BNOhI8yEiEizBv?=
 =?us-ascii?Q?34ArYnvDWZHh0QwTBqET9GPZEU8rHRab3esfcDK3n6ELo7X3juU87uDAfjnw?=
 =?us-ascii?Q?xjjGanRjBj7KZDZwAHZ+oqI4F922rc72BRgmx4kcT2EGt2CIx4MU71kX70DP?=
 =?us-ascii?Q?fURX/FOtDgybzPrqCqJ2SEBH4zsXVo+SOfwHdvm0dpNsEnI/RHLy2LoM8gzl?=
 =?us-ascii?Q?/8YPjijIFvoTgTz4qVNO/565KbPMouiX9dKLR8Rm5k9s4PuQaB8OeL9PjEUe?=
 =?us-ascii?Q?uGjLM9avGFmLKQkvJX32UdUjlIm/BLYoujYruLgwO8lQWhJw5iX2rvkFjlqD?=
 =?us-ascii?Q?Hdl5zsV9TVypKJ6tWOuDFHal0ZYETZX3hXS8i8O0t6Js3TtZXDXDB3YxHXuz?=
 =?us-ascii?Q?JTwAhsbMZjdDexZAocK/cFzeKgP9xylCXNjgPgzQCy4cHUlrfKAtFXW26fi0?=
 =?us-ascii?Q?EkvIkJ7Jdnf/nolcug1zHZ2CAy8LvjkiprJNw+2g8D7txrkjoYbmI5Bi7Ext?=
 =?us-ascii?Q?eP8AISLTauPEkujO8wpb38fOwHo7+1pY8jfZnwQnMQsCjZuWovJImQTqJjOr?=
 =?us-ascii?Q?CZad9tZECA6lpEUH2nnyhPpW6DTSIht1TrmCs6KH0VGXRSz/x5aYiwHix9Mr?=
 =?us-ascii?Q?H89gGx8AQfZ+2iVNawt+WfwZA8V/5j+v93MOQk7JQFz5DWSnNOrhXz/o+yAx?=
 =?us-ascii?Q?Hu+hfz+7vRRvQEgB2juWEauy8JJnIe/2wgw7nitDHFcoRyLjXWA83v/cShVa?=
 =?us-ascii?Q?BU2ww2xvfh0cBUVTZQzZK0rywPrjHByLJdWZ9WSXO/8TRmENF2FY5hKSSg5X?=
 =?us-ascii?Q?3agXNnEvNCgkZCLvp68hj8T1biY8x6IiC/94CJb3qHgHVj/jpbmJp8pP67j7?=
 =?us-ascii?Q?3gB2t7Ivt/H5fpQIBe3HvfSu0gIp1GsxcvYFurOoCONg0Bo3bVSuRXNcRSxd?=
 =?us-ascii?Q?ihXmiPJK2YNPbofYBaMdFbS5lstIB9Hy7zvfsMoTGwK8Ia3LD+CvrYZcNzPX?=
 =?us-ascii?Q?3A99CLv/DS5Rk49f1N+N8VCWLRjYZgYnCCEhDvhwipoR4ag5zUzk8L5385Is?=
 =?us-ascii?Q?x3+zNYHcGtOgFhUP+DnbyN55d4sbI1z4U+8CYLjjEvRST1QXlfr+xHr1RGWT?=
 =?us-ascii?Q?xJR4RXXWpg1oixp+fRfNFLUQxHqadav6k9zccSfQ6BBd69NQyNGfQ40bptxh?=
 =?us-ascii?Q?Sy3dXHtdiGvKiQb05zkbRpFCnoZIKXCIay+9eCD3rpPzMtPMF3cosOppr8SX?=
 =?us-ascii?Q?uXhC4woJ+M60/Fq0bgfMQ3lwG7UmfDhyDnMoBRZDepf66Qh+fJWjnAvqw5SD?=
 =?us-ascii?Q?4HRIykgpMXRxJunX6c0WNfHVWY0AB+qZzee8loyN/vUc9aT4MOPMjKofGmeZ?=
 =?us-ascii?Q?iVBx91Cj9qv2yWsn0lnKBl0hwmvCzo4uOvbzUy/vkiibwpATWvZcUU2cpabz?=
 =?us-ascii?Q?dQToLWM8snjXG1Usuw+hlkdYBoqYYOZF4Mkru2EeoSW+F11dyo9LKEW8Jgmu?=
 =?us-ascii?Q?kkD1yw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1P192MB0765.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(52116014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UxMSPIKBmEGO+vLDb2nwWqALXgPs1EJ71408oDUlEMTMlvzO555/35lj6w7i?=
 =?us-ascii?Q?gXkA+vgW9vyvYh+CJjn1DutINUQY1xiSWtP9zpp3Rzzv/ruzAaHVsOJAMPf4?=
 =?us-ascii?Q?Sfe9BSAUrdOm3vTpex5D6NmSD8UyjLktNE2FoX4dIMGz0lzjH7rqj0PaDHm4?=
 =?us-ascii?Q?JBKHjc11BfSj+RHK+u7Uns737PsOVxuJLpkeSyQ+4NhUQotbZcIqIHEnMOL2?=
 =?us-ascii?Q?hv+0SfSrbJQh8xwKqQFUo1dLQqpSLlA23lebm7Fundlpsxud1jOctrEuOg2M?=
 =?us-ascii?Q?wZUjM1jrI1+HC8f7TULcXX3ORihjldndR5M7p62GA+3Hy2YcNrGc1zlNeQPN?=
 =?us-ascii?Q?DxLVpHczD6xN5edwwv+dgvOMaBzL/LJl0+uD/hMJf/dcJmdz2BkpQ3qjbZDe?=
 =?us-ascii?Q?8XJsUVc4Didu8OpEsl7foiMC/cVofMFCoB64lsZcV25aGpc9lorOPaz+85pp?=
 =?us-ascii?Q?zuf+nPOxF4nxzGSApzLa+gmXiEq25DJsfkTvS5AbLfaX/6YcoI3u07Fih+BP?=
 =?us-ascii?Q?O7qxwoid0i4pOcrdhgL7HxeMCgdPnvnWQseeB4BNtkrngKn2GXk07H3HuQXu?=
 =?us-ascii?Q?Y8/rQso+k+8E4ZPig2PuQFiaRFd/zEI1lkl77I4XPh+BE/exvYroiAT5m35m?=
 =?us-ascii?Q?sQt8rTlgwN4eiz3JZiD+fETgheWqdGzBD6WBpsMrFEjQB6kNtPRzvEE99xfM?=
 =?us-ascii?Q?gTY1U5Spm+QImwtJGFAZqpHRHVGT0/GReUVacN3sCsIDk8PeAC2EoqRDeqHo?=
 =?us-ascii?Q?NsGT+Jdx6Z9vP9z+veJmnPbthCWC54GX2tvcbeqlLvuCuap5CYMEwzoncMGe?=
 =?us-ascii?Q?QhlsGGMX4eyExrfHrd7QN437dwuL8B4G1EPYaT8+YIYIl7kbK+d6s3i5flV8?=
 =?us-ascii?Q?ej5fht6yawzmbhyW+rfiG4uJ4SdvzN46D7mwfQy95aB5OdGuQTriQ1jjYDQ5?=
 =?us-ascii?Q?MgaTGS3k2puScpUSV0BwjcT5TuDt8pqe5drmGeP9GDak6Y7zSDwKSxoWngfd?=
 =?us-ascii?Q?Bddfv7MzSEiKtwgqksapyrAhDLzbLJKbsGCpLguR3kxQ4gYPmo/yPDXRGAiL?=
 =?us-ascii?Q?wiF9cYg0BgnvnDavp3YzSoZ93mHgsrJbUbClkQ8QvYCemKXq2WUSuuYm7L4c?=
 =?us-ascii?Q?0/hUAZneCqbGV1QUpvk60EK3sXUmcAbEkyRRBZOEm4f38PX8CMERCaHQZKfr?=
 =?us-ascii?Q?tja+b1pt0q0FsbNC+kg7Ijd3Zu+d5BAUbFQ0vZRSTMQkkJSYf1E1UIRYJYWT?=
 =?us-ascii?Q?Jx5SIJQxNEB5ZnnHFTlJ98GvCC7h5OqWxKOfqQy6OrYeEI2nzHOBLviRo5lh?=
 =?us-ascii?Q?YZZtnYN0wiTDW8GkJh0AMumD//wCb/nmaQdXuy2+aXjpVygMRyqiy69/5Wge?=
 =?us-ascii?Q?xPaIAn7QY6iFjjPJfloN7lAVOMQROcDhYTtCmPXGHSXbDPvuXG+eeOhYYFzM?=
 =?us-ascii?Q?9MzrEr0qnMLIzrs+iQvEgXI7oSGxe5ydRYxq98KGAfPR5uyqfaCh/Jk2ZJdw?=
 =?us-ascii?Q?Q36KFEt7s6dUj+jhTatUPLkyVLCrAp888zx1CukFUUYoRUZaScTyvKwsNd6Z?=
 =?us-ascii?Q?VYNfdaN6ZLK6aNY7PolHlRRF5Wsbuus0yUkVAEQh6r3WFVhR+epGr87+HUvW?=
 =?us-ascii?Q?c2HHCT8qJMfyfHhwKV+7yoiZ5c3+kcj+gwXQYCHosLWk?=
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d5454ca-96ac-4ee9-7103-08ddb86dcfd5
X-MS-Exchange-CrossTenant-AuthSource: VE1P192MB0765.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 07:06:33.9596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Hom7KUYuKYEP6N5mlOD7FI6KPj8L2dprjxToxifTjmX9+NEhon69HUPvYWrfH0rQQkBWO6RgxsZznjIv/GLxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P192MB2340
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 07:06:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219545

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
index 0000000000..8d53f2ef90
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2022-48174.patch
@@ -0,0 +1,80 @@
+From ca2afcbf42017d998ce3d6726f5ff5072a3fa853 Mon Sep 17 00:00:00 2001
+From: Octavio Galland <octavio.galland@canonical.com>
+Date: Tue, 13 Aug 2024 10:42:58 -0300
+Subject: shell: avoid segfault on ${0::0/0~09J}. Closes 15216
+
+CVE: CVE-2022-48174
+Upstream-Status: Backport
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


