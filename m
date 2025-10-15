Return-Path: <david.nystrom@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B815CCD18E
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 12:20:53 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.15])
 by mx.groups.io with SMTP id smtpd.web10.14913.1760530842733380946
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 05:20:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=VOxt5qLY;
 spf=pass (domain: est.tech, ip: 52.101.69.15, mailfrom: david.nystrom@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gKEmJTnI7oi4+pzwSAnt6ZDQ7EqaPkjv+EYeLmXFF4clOi3DahHvNbulSZE/AaRRdHK8H85Y0vPWUChYLO4e/WxfTc55vUHDA+uyo2GRI7888FqV+u5WllvIqoUsHz8BKguSzC7lAY80/OrwK3tncy3KgfAZq+KGIck8MWDCu0n6u/UBfP5Gjdd2R9pfnrzxqUBQZVL0uP0S6p1fxai/U5gxuRTXmyUREGjvUdiY7LJqLhMYzacgBjDl9pRM9gJxEUpu1pTaU2IQ7TsYy3L8EwPjYHQGnaB9FBLf/B87o5A0zMYhZRRvh9fRXOklpkTj7zXI8pdzWANERNnLaMklgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8u1GhR4txP+cVCjoYjL/wFEQUKS94AtSJtcgbPVIsc=;
 b=FQEHtcliqfeqdlwE4faexDYmY6Zkhzc19RnQ7XOeg5jOHL5hILA1LudmdKI2y246KqPr45XewEjRVwAu2eGvkQ6HqB6or2RmrMUFXLLtrrOj9j3Pmu5LDBD3o7hM91eKtjmzyhCSxwt9rBZ0Jfn87bkWnLJHKOjLx+6L+wEnatGvScjKOknqU8DZPSwccjN7mX9/DknuaxNDxJ4dyEGrej72yljl9x1W0pmlQNASXK3uLyc8gNSzKA4WqXCRSWqDz5FQ1cDXvASn/WmEkwxP6ht/XarKlTT53rkik6jBZ34cDgdm8No0I4cnTRYev9r6gcknE9xfypq1VxmptB/XaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8u1GhR4txP+cVCjoYjL/wFEQUKS94AtSJtcgbPVIsc=;
 b=VOxt5qLYM9/tMAYpqLlCGGpNSfyw9VeRZ6+7mqo2cVZGPRUn0vchg/iY90bKlYep7cJ0q7i9wgzfaR7jkfuQOh5sCPXc7lKyfI/bF2Suk77T3ysQ1MuC548AHHJak2JRuPW4bOrJxZBppx5lgdRS8R7htfzAyHviklwSmygINnI3TnbtqgW0kqwKA4mvpxDMIRKWq6E1QLUkcVl0K7YMjOrr30/2xAYsW+x0IXxirFSC1ryjvEQ1M2F3KiurNp6/ikfwb2+UzjpJEmcuGWTuADeCK69ZEJmWs+cPOjFIRgPnF7RCyAHz14bPBwIVzz5mvpZQ+vmPPeUi3oBukwfl2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f3::19)
 by PAXP189MB1831.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:289::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Wed, 15 Oct
 2025 12:20:39 +0000
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc3e:2aee:25eb:1a0b]) by BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc3e:2aee:25eb:1a0b%4]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 12:20:39 +0000
From: <david.nystrom@est.tech>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?David=20Nystr=C3=B6m?= <david.nystrom@est.tech>
Subject: [OE-core][scarthgap][PATCH 2/2] openssh: fix CVE-2025-61984
Date: Wed, 15 Oct 2025 14:20:28 +0200
Message-ID: <20251015122028.336769-2-david.nystrom@est.tech>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251015122028.336769-1-david.nystrom@est.tech>
References: <20251015122028.336769-1-david.nystrom@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0090.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::8) To BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:b10:f3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BESP189MB3241:EE_|PAXP189MB1831:EE_
X-MS-Office365-Filtering-Correlation-Id: d8ebd9fc-eba5-431e-629b-08de0be540bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9eCPfF3EOI4exgwbNAuo5iFSczf/Bjxm0SXTeDiv3vJ5PLUIdB2n6wBnjgqu?=
 =?us-ascii?Q?uj07rsgncSxJ3Frmbm2Kx8eeoTleYcTb4w6O0WUtP74zXRp6NHNVGFVZFDtg?=
 =?us-ascii?Q?LmljQA06MWTJWzPnR/CxekTY8mboI+7YzuMetjCKMBDVBomEer6+VmeGvQY1?=
 =?us-ascii?Q?B2dzVwNLq6KQ1Uq6PRLUc3tQSfn1IeQyxcTUsBO3xh5wRO16+EOuGYoTBb5D?=
 =?us-ascii?Q?gaWmoxC2NnrK4E7S5eMAt5b4c+xwyoPkwal6Ydhnkd1u0azcoERZVn4ZAKBd?=
 =?us-ascii?Q?9WHhaETtWKBEPGyaMr7EHnefZ3kFLlBMi75RyKOYqX4IkOi04JQkCIHcndVR?=
 =?us-ascii?Q?rsk+Gc8aZJcide27UPXBJaLFDQW3zx2zCVMpZZ7QgeJWMcxwMu5psWw+YBED?=
 =?us-ascii?Q?mCskYA/KuRUAs9PgCPyZGVwQKuDIAD7PSlfFGQu7NSJq29lMgT0bYeY4m7Vu?=
 =?us-ascii?Q?j4s2ktIwu1pxB8cMFHUhGSOJC8NLub99rnEzfCoDAoF5vuvEK+cDTRpJVfzr?=
 =?us-ascii?Q?BHccOwvZuy6str4z9MmFf2L4GPADrmxDO+2ECzI5DxVsZlWVMoTSAyC2jc/6?=
 =?us-ascii?Q?Iok1+jIafWfM+oKlv9+oe0cosQMFAtrfJsqwktrRJrNlbNudEXF+5VS89/5s?=
 =?us-ascii?Q?8dyjHFQKoDT7lKWvBj/x4Bb6xZQu9lp3A7MXyVVA4UU1gG0nSmpIoHPQ+htO?=
 =?us-ascii?Q?r5077kD/bCDKmfG4yaTdUqxjSzqJKhI1jfN9DuLXlz6WOOyXINEupEL26sGC?=
 =?us-ascii?Q?c4mHIvMYaLtY0OJDtIE3v600qCPzBeX3aLIGt8Iz9lrC1bUPQNPEzM222B0d?=
 =?us-ascii?Q?/sSJI5+xL+HyEDTrWF4EYKhfnuW7yjxRfFsEWdom8Fqm82eb3E2iC0jt6qGp?=
 =?us-ascii?Q?pF+5dpYacozpcUDTvh62ax1+zAc3nG5lU2UmYXpS4TBCP4fCEut+vDZZMMGF?=
 =?us-ascii?Q?Ys/L4J4DQ6Cf07w0BOJdsLZgoBZU2uqChMeLGCTndtE9xcwc8L08nTncZxKY?=
 =?us-ascii?Q?xNF3CtpeFSkNF1qUZcfgy3Cfv7uGwdLDOGMuGcEgZt9yH5+hMrOgO45dpniH?=
 =?us-ascii?Q?hSzriQAALm5gS9qsvqdjrxKQuVFSV1DYjDUPO39obtqUN+C+3zOGdiECwcjg?=
 =?us-ascii?Q?cKDJwI+nuzUbCx/lsRPaNJTKcc8Jd4EQTfbYUsj2ov9XrdUDz1rTJLrmliKT?=
 =?us-ascii?Q?aT2g0H+9lvsFbpCTp596zzsS11QgaxzoJHePvfj0+LzXtIg9DvwQqNXG4WkV?=
 =?us-ascii?Q?fovzUlJTz5IawisIL+jUpBapEHTsN6Gt7sgXcdWfYJLVmeVeetoG0lkeV6Yl?=
 =?us-ascii?Q?J6jQ9cmlTK++B/OoFSqTe6CsB9Z1H3+oLpJFv43RW1n7Mh5ObdOgVgyj2xZ1?=
 =?us-ascii?Q?bM42+KNJemTyfB+pkCE5Vl900OvLONS10/jCVdSBnOFyQaA6C0JutkqMeliB?=
 =?us-ascii?Q?cbWd639czoIAT2F/LFNhGxFMRGljjzMAAqZaX3TWnuS4kRQYimJ+cg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BESP189MB3241.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yGaq3KwmnqMYLzdt6XMJN/ta0wkgd/s8tPG3sggrp2M251/KwByOUPHrs6Mr?=
 =?us-ascii?Q?L2gEyeR5Cf/KaPFKpiHBAA2ZMlZrVbadgROiS31eyJKKcNVtKDJupKbUobnB?=
 =?us-ascii?Q?wVWcRmXQyqTK2tc/5LLRwMz31xOuFFPQPmzmhymgo3zXXnZMHzZMV6MvZR0D?=
 =?us-ascii?Q?c8QFF4eBsfUAriiNnG4pkO6wSR/BJCR+Zudm3C9sq30uE1hYg4c6p2sJ/QrU?=
 =?us-ascii?Q?GF1GaptTkZxXFClHNNol7MVGvn0k9sgIhQOSnXCf33gA+P/VSQbAll8AXvPk?=
 =?us-ascii?Q?1LN+bP9ipI9oo+SIzyqr/WD58d9tSdHHODTaV9U/Bi6M46lrqE+nu28LAvfA?=
 =?us-ascii?Q?hOSJPrqDzC8mhY5Z+hB9YWxcK9utoEwoG9iIZUF+ek/iNQrajN8UpxE4goDT?=
 =?us-ascii?Q?SOKgt1MZDWRz7CW1fpndrbMT67rtAH1jBF+1UhJvLWxYPlcysT4db0DJmdxb?=
 =?us-ascii?Q?VpKOy14Uniblak0lV06re6MRY8W/1b9d5kiuar46I8SNKRIJHtm1id/3fO5g?=
 =?us-ascii?Q?dII5OY313VYCK4OhPvN0j71jNsRTFEwdZ1WBHUpkBMGbeRx/Z/w1J7s9OpQY?=
 =?us-ascii?Q?0t6XXZU4uUHM+OS+rI3F6BLEC3epWldV/w+GaXGznDWw0NyDbddxAUVOIeFz?=
 =?us-ascii?Q?jrLfSp9ycpZWIQwwyl29wXItEn/puD/b9ZUsnQapAYzsBTG5+oO9bWqwxSy2?=
 =?us-ascii?Q?LtpxjFZqapujQg+uJzD581oFYIHcd4Mvx+cMA3rh0wnARBPbZaOTsgGk8N6q?=
 =?us-ascii?Q?HwObWrI4xRMRCaqIjeK2qCppRPWCJUXhNaBECkZYnjUQYpoLCS8oRN3yki+4?=
 =?us-ascii?Q?uXZNPFsF29LgRcpyesPIVdnRoAs4v2Twla9fl5QqXd3E1K1QV+wOim1V92+j?=
 =?us-ascii?Q?o1n3vRNTrN4QiXV//MF3WgRHn2+hbNlyRo1LtWsFRlp4WEm2eKOeSEUiuu+Q?=
 =?us-ascii?Q?mU7Z6XObpgAyD5Bv9QAicf+lnxMl2Skd5mk02Rr0JUEDc2/MONwnJrCmSckR?=
 =?us-ascii?Q?fJxNfxEHT0hL63aRGN7DibL1W/2ReDM8iLgNTQ/osMf3do9/xvCaNKwTn5MX?=
 =?us-ascii?Q?ub5bEdBWV/a5w6J61Lx5LIoMvnBTaiSpaFBhqZ1/Ds2mu4PkbPk00IsyvH5N?=
 =?us-ascii?Q?9UZkIMHR7t58h2gZE1UzaMOIHsJDNWQKLzEEGJaIWAjASFxyJRaYgrNrWhy4?=
 =?us-ascii?Q?pBcbJ2FnoFBbzB4qh7+GvUsnS1zuzumWf2kfC3twS1Xqu1RmBerKVgJUmhsQ?=
 =?us-ascii?Q?oKQPPhD5uGkD/FltR5YT39CW7q0YrhbTgXitNoPnorKhb34CfVmWqcfq2C71?=
 =?us-ascii?Q?TCyzkyYvUbY8Xdj24kMx8f3mGnY+cLbMnE3XvI9n8fK8TTnt9pDDg8B0b30/?=
 =?us-ascii?Q?sorV8+Ssm8WukKxV23Jbj86nSnsBruRGh6kT0IJg6TRSMCWr2J2t3JtGqBZV?=
 =?us-ascii?Q?SM7/GsL5UtlxlO3sQ1W7i+/LzHJsIWdj2v6+ZZTBCGfxzNkUx5/ez5uPqjH7?=
 =?us-ascii?Q?7TnUSgVdwcqqIDGtzd6JeCBY0NrhfGJn35pRKnD0cRiMJ2GeO6AM2SzAdwTO?=
 =?us-ascii?Q?CIGh2pxYGlZwsx45ev2eK4fq5SIIivtRJPGco7yz?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d8ebd9fc-eba5-431e-629b-08de0be540bc
X-MS-Exchange-CrossTenant-AuthSource: BESP189MB3241.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 12:20:39.5562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UmSnhYksxY5oawPAFsSEGTlyMD4NvniNJxaiYTox8N/sjcNifTK0vkQu7+sg3i1yDgEcQRZIrrNUKvqwEbH1aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP189MB1831
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 12:20:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224893

From: David Nystr=C3=B6m <david.nystrom@est.tech>

ssh in OpenSSH before 10.1 allows control characters in usernames that
originate from certain possibly untrusted sources, potentially leading
to code execution when a ProxyCommand is used. The untrusted sources
are the command line and %-sequence expansion of a configuration file.

Note:
openssh does not support variable expansion until 10.0, so backport
adapts for this.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-61984

Upstream patch:
https://github.com/openssh/openssh-portable/commit/35d5917652106aede47621bb=
3f64044604164043

Signed-off-by: David Nystr=C3=B6m <david.nystrom@est.tech>
---
 .../openssh/openssh/CVE-2025-61984.patch      | 125 ++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |   1 +
 2 files changed, 126 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2025-6198=
4.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2025-61984.patch=
 b/meta/recipes-connectivity/openssh/openssh/CVE-2025-61984.patch
new file mode 100644
index 0000000000..f705410b24
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2025-61984.patch
@@ -0,0 +1,125 @@
+From d45e13c956b296bf933901c4da2b61eb2ccd7582 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Thu, 4 Sep 2025 00:29:09 +0000
+Subject: [PATCH] upstream: Improve rules for %-expansion of username.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Usernames passed on the commandline will no longer be subject to
+% expansion. Some tools invoke ssh with connection information
+(i.e. usernames and host names) supplied from untrusted sources.
+These may contain % expansion sequences which could yield
+unexpected results.
+
+Since openssh-9.6, all usernames have been subject to validity
+checking. This change tightens the validity checks by refusing
+usernames that include control characters (again, these can cause
+surprises when supplied adversarially).
+
+This change also relaxes the validity checks in one small way:
+usernames supplied via the configuration file as literals (i.e.
+include no % expansion characters) are not subject to these
+validity checks. This allows usernames that contain arbitrary
+characters to be used, but only via configuration files. This
+is done on the basis that ssh's configuration is trusted.
+
+Pointed out by David Leadbeater, ok deraadt@
+
+OpenBSD-Commit-ID: e2f0c871fbe664aba30607321575e7c7fc798362
+
+Slightly modified since variable expansion of user names was
+first released in 10.0, commit bd30cf784d6e8"
+
+Upstream-Status: Backport [Upstream commit https://github.com/openssh/open=
ssh-portable/commit/35d5917652106aede47621bb3f64044604164043]
+CVE: CVE-2025-61984
+Signed-off-by: David Nystr=C3=B6m <david.nystrom@est.tech>
+---
+ ssh.c | 26 +++++++++++++++++++++++---
+ 1 file changed, 23 insertions(+), 3 deletions(-)
+
+diff --git a/ssh.c b/ssh.c
+index 48d93ddf2..9c49f98a8 100644
+--- a/ssh.c
++++ b/ssh.c
+@@ -649,6 +649,8 @@ valid_ruser(const char *s)
+ 	if (*s =3D=3D '-')
+ 		return 0;
+ 	for (i =3D 0; s[i] !=3D 0; i++) {
++		if (iscntrl((u_char)s[i]))
++			return 0;
+ 		if (strchr("'`\";&<>|(){}", s[i]) !=3D NULL)
+ 			return 0;
+ 		/* Disallow '-' after whitespace */
+@@ -671,6 +673,7 @@ main(int ac, char **av)
+ 	int i, r, opt, exit_status, use_syslog, direct, timeout_ms;
+ 	int was_addr, config_test =3D 0, opt_terminated =3D 0, want_final_pass =
=3D 0;
+ 	char *p, *cp, *line, *argv0, *logfile;
++	int user_on_commandline =3D 0, user_was_default =3D 0;
+ 	char cname[NI_MAXHOST], thishost[NI_MAXHOST];
+ 	struct stat st;
+ 	struct passwd *pw;
+@@ -1016,8 +1019,10 @@ main(int ac, char **av)
+ 			}
+ 			break;
+ 		case 'l':
+-			if (options.user =3D=3D NULL)
++			if (options.user =3D=3D NULL) {
+ 				options.user =3D optarg;
++				user_on_commandline =3D 1;
++			}
+ 			break;
+=20
+ 		case 'L':
+@@ -1120,6 +1125,7 @@ main(int ac, char **av)
+ 			if (options.user =3D=3D NULL) {
+ 				options.user =3D tuser;
+ 				tuser =3D NULL;
++				user_on_commandline =3D 1;
+ 			}
+ 			free(tuser);
+ 			if (options.port =3D=3D -1 && tport !=3D -1)
+@@ -1134,6 +1140,7 @@ main(int ac, char **av)
+ 				if (options.user =3D=3D NULL) {
+ 					options.user =3D p;
+ 					p =3D NULL;
++					user_on_commandline =3D 1;
+ 				}
+ 				*cp++ =3D '\0';
+ 				host =3D xstrdup(cp);
+@@ -1288,8 +1295,10 @@ main(int ac, char **av)
+ 	if (fill_default_options(&options) !=3D 0)
+ 		cleanup_exit(255);
+=20
+-	if (options.user =3D=3D NULL)
++	if (options.user =3D=3D NULL) {
++		user_was_default =3D 1;
+ 		options.user =3D xstrdup(pw->pw_name);
++	}
+=20
+ 	/*
+ 	 * If ProxyJump option specified, then construct a ProxyCommand now.
+@@ -1430,11 +1439,22 @@ main(int ac, char **av)
+ 	    options.host_key_alias : options.host_arg);
+ 	cinfo->host_arg =3D xstrdup(options.host_arg);
+ 	cinfo->remhost =3D xstrdup(host);
+-	cinfo->remuser =3D xstrdup(options.user);
+ 	cinfo->homedir =3D xstrdup(pw->pw_dir);
+ 	cinfo->locuser =3D xstrdup(pw->pw_name);
+ 	cinfo->jmphost =3D xstrdup(options.jump_host =3D=3D NULL ?
+ 	    "" : options.jump_host);
++
++	/*
++	 * Usernames specified on the commandline must be validated.
++	 * Conversely, usernames from getpwnam(3) or specified as literals
++	 * via configuration (i.e. not expanded) are not subject to validation.
++	 */
++	if (user_on_commandline && !valid_ruser(options.user))
++		fatal("remote username contains invalid characters");
++
++	/* Store it and calculate hash. */
++	cinfo->remuser =3D xstrdup(options.user);
++
+ 	cinfo->conn_hash_hex =3D ssh_connection_hash(cinfo->thishost,
+ 	    cinfo->remhost, cinfo->portstr, cinfo->remuser, cinfo->jmphost);
+=20
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/reci=
pes-connectivity/openssh/openssh_9.6p1.bb
index bdb8a1599b..1cdd888ccb 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -33,6 +33,7 @@ SRC_URI =3D "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/p=
ortable/openssh-${PV}.tar
            file://CVE-2025-26465.patch \
            file://CVE-2025-32728.patch \
            file://CVE-2025-61985.patch \
+           file://CVE-2025-61984.patch \
            "
 SRC_URI[sha256sum] =3D "910211c07255a8c5ad654391b40ee59800710dd8119dd5362d=
e09385aa7a777c"
=20
--=20
2.48.1


