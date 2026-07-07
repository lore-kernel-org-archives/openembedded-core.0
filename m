Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51FC2C43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 14:34:48 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.175806.1783434882955458104
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 07:34:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=vN2Mn6aI;
 spf=pass (domain: est.tech, ip: 40.107.162.30, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KMX1oGtwG0tBPXOQEb3JRZKpYO/8IOFBzeiRAEb+EHfZysePQsZsk6WHKHpA0LTdkmO784OmIf+wg4One3Gpe0aTJzAk3mxje/7TWtSouRaWiGPQEZsnFtVoRNH0L8U7zVOxCcPsP8pbw1cWTBGrDtLC9qSh6bbU95A2AjiinMhqmuY5OpHx796ZruFZw6X5s+jAMHbghkG6Q2eR9vFoTzbNxwln/wAL85rMkV5tUGIXYTzLGHF+5MWXJormrIMCt1wLXJAGyweb7+HBw2QvQe33Y4hUrpatCxO3AAa41Uk1OC+skS38hXszcpe5uUXXixAa3aUDl3Vt6vQ9xXzsiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O2X+G/y8lSaf1qBzcWQ3GxbHpXoqrV+M25Qz/3AV5Go=;
 b=hBJdb/bXLobQ3/7+AlArAM/jDWg1jhrMFDEV1Muu/Zv/PuaFX0i4AbBDD+ryyULQNtrM6/xKBUdM1j5rfcBFOIwxTbQivwO7GgOCbleVADA+Jd8veH9FtEX6tD2KIgaQddvQTge2j3kWPWOO+F0c+stJ5DhLPTMyRwkpWexxyv5Jj4hEY30WU+eWUl43NTTzzHAjp21+5Cryve3p9xxsN42JsZXq9zC/4yAapSs4U8m4OzfJTXeZ4vJTp8/19d+MbogCQGh1W0jyk+NjYcsWp7NgPTDA8M2evaPPVZDN4F5JCPGvoHKFTBbbNcoRp6+p/NGkBYE2LAKDMDPVXEoPCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2X+G/y8lSaf1qBzcWQ3GxbHpXoqrV+M25Qz/3AV5Go=;
 b=vN2Mn6aI35EKCBUazdffiONl6SU4xDBdPSIX1Ny2vAhiOETycSOgRk9jVp2tDABCtebey8xHaLGjuV/csORb068L6qckYDvJjmzGjT9ib822vDEA5v0JIgfilWYRroirzRGP4BwGx/zVrfN1oTvDgiCXQ6JgV4iXZDOnGxKxvT4lUL3UHOT2myST5E3bTcEjwAK4RmvgjTk6m16nTDNObTwH7WUsZ1IkLdrtIDDXJOXsIt+F3Aw7w9fwViRK84GdFuLYKf0t+w9aOsjn+Mi0ZL0ZQb28/5+SWx7ImPTA2HKPhqzHO8nUZrxXkr5GgTSZXIfoCcE3weeE46PeebgMsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB8P189MB0902.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:149::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Tue, 7 Jul
 2026 14:34:40 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%8]) with mapi id 15.21.0181.012; Tue, 7 Jul 2026
 14:34:40 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH] gzip: fix CVE-2026-41992
Date: Tue,  7 Jul 2026 16:34:20 +0200
Message-ID: <20260707143421.34255-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260707143421.34255-1-jaipaul.cheernam@est.tech>
References: <20260707143421.34255-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0147.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::20) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB8P189MB0902:EE_
X-MS-Office365-Filtering-Correlation-Id: a7ac1d83-51af-486c-5b0f-08dedc34e0f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	NtnrC8UgonXgNdEuDMyeHOa0u63eLdpHkXKjQz76g6T3SBFFMHR9RYN5GlxEOoBvs6dKf8zd3TaMJsTPw70NaQbunbRCHfE0pWakJPJjXqjEytnUFzwB6S6UGYAcpJkxW85xD6YZpEtXkWp14QUKrK1CQc60BuVQGjJUqa5uDtNwB/7Au0+DyE/aP82oGMdg8ZBR2WwoD3iGRGHduTU6I81OSQBmk2TWCqgrN0UDi4yJhuQYyVhI+6O6zBqlaiLJuSdmoRM71aRue8CoWgJFCyc/7z8382pOEk+Q9+HpU6XybU7P6uvqVtXQBZQBf22cBhiF2M+1Fpqp7Ggv1jSUYFsUsl9GGTBHOGPpHAzkPf9jsMjXbqPrQxfIEYsVfmHjfE92HojwaBU8k912sKHy1hP7tKHOqhJu4pR+/HFhCliqK3iRkspwsYKJ3uzGbi+N2UyDDvoTzt4ftQmM7EBbAOk6FggCttrnQFcpQdfFHDMvALS3zcB+g81r92zKgaF9uqKDGXqmY91I9F/zlAUs9IcNMjw2eby09O6g/GMURCQNYmxwvqBVDqrc6tceOfGkh4NYbZLYfhDFexVnmT0Fnk2sePnPBOsXlhXWjxV6CcNLvuETkSMvjhnGPZi4bq3BcJBWTJCdFJi6BBO8yjeTgQbrcjAoYfJKOL9nmK30ybw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8GR6cSdJWhJHLJdi2b5VWKJnPwzLqCZHQHcYU1O/99zgzYkgVin/p6hZZI0n?=
 =?us-ascii?Q?SU3ybgDlKV6QB6Pe66ve0yaTDy8OURFyboQtYKrAfUTsgGjhpblgUQwdSP7f?=
 =?us-ascii?Q?xwvCuZWIJc3Y+SeX3RGAl55kKr4mRjWZjzUPzVXUhId+rAFTG97wL2pFXZPA?=
 =?us-ascii?Q?N3Qs2fjRHdZDLX9RH7ZtB8XIaLXpyPxbpNOCylXRY2z4Z0+AYnpajzXQQPJ6?=
 =?us-ascii?Q?/LiC8rRMafRkewilThwffabU/wsT9+C0jP00GSlJgWXeHANojXSihFhqDpMX?=
 =?us-ascii?Q?vc1vtsisnwbnbJIe/W6axL1H29G9PPmBu/3wMBUjTayVCcNQUfl2WVuiqddv?=
 =?us-ascii?Q?TZbVR3MYyx7D+pZny6wP4+6GZn6qacdHiG8FdKn3QktISEm0fYSz2MGSaOI9?=
 =?us-ascii?Q?nT4dAi8ngK2Q/gU0/4B7EUdSLEiWy51YjW1+PGLd15End4YlaSDpv8Iuf7I9?=
 =?us-ascii?Q?CYVY7GfrCv37dOJoTik+ql78aZvIfaAco2ZKEgXstrtBaFeuznWku2Ld7dWp?=
 =?us-ascii?Q?f081BogFdKN5VtnQHpWNw4IB6XqCiKfe7Q4JM3YrKpdzbuozmNSX9oVTX4mK?=
 =?us-ascii?Q?ISkEg2UgcbO4rBZugSpj+faRgkyHUqsX+DM98/TZOWF3OZRIQYw1O3kcJRMa?=
 =?us-ascii?Q?fMulXY9uhzOpMK/EloL5bDwCknN/bqo8Tdu2P1Dh0aB40QreLaddjUwhpn5N?=
 =?us-ascii?Q?WFvEPKRn7Qu4vT5kS/SjxcNPoVRUqzj3/eTZMwXkykT32/kbpqopR/M49P4B?=
 =?us-ascii?Q?lRs5IL0aDIY8y5u05ofD72n7IgojihGBIpzUMjvPbyPr/liixi2zzCa3HnV1?=
 =?us-ascii?Q?JC3AsqeYxX5ETKDbw52dlBK75b7vusuomnKjBpyRi6GhxpKd5U3lP24B4lp3?=
 =?us-ascii?Q?Qkh5/sV4qu1+2FbTY02xjvSCtq7Etvtvk4GtzOfxGip5Zu4rMuU/43R7AnOb?=
 =?us-ascii?Q?ICj5hX7HV1Ek11cH3f/0zL5WNlEL8UmJP7QklmlXykTaZmVdz8uw/6Uov/mX?=
 =?us-ascii?Q?TUQCcQXjiUlJmvhoYZ3z2lRqxCZtSi4RU3KCVM+R0MKiq00IA7Ai/K+Pdem8?=
 =?us-ascii?Q?2bQWBtVygzPUGKIwdAzDUJoKKZrJvVCzoxiqyxsgvpzIWJY9UIxixtttRBkv?=
 =?us-ascii?Q?p5yF7b1G6u6TQLKtihtTfiA4fs1F0Wb2VyQj+baPwwirq4kQqNkk9nrg02w5?=
 =?us-ascii?Q?3CM6lCGt4pTsSkjso4pU0dVdwlWjtFyKxLtxmGr6Hg1x1MeIUBX5lhfSCFe7?=
 =?us-ascii?Q?L7AhJLhPXl7xzhsHKaXFR0j/9VuOxTlkLDY0G4M0B5LMpzqkBrqAePpEPh1N?=
 =?us-ascii?Q?UwCiHkkR5c83roNsLA8dJKf4SPBdmQAJM3K9lFVlK4m+uPJz+Z+/OzVLldjr?=
 =?us-ascii?Q?5uusXNcinEUyBq7CN04Y5hkEpnWKM1UIEgl3iyVZgokBGfVTsJPDH84i0wfZ?=
 =?us-ascii?Q?+dLL9ozOqnrcKpiYaSe4ASEmOk2CHN8rfqQDoQvvEU8e/ckYqMfCQ3ADzkAp?=
 =?us-ascii?Q?Rwy5+OWKmOJ5j/iOlXk9YzdcY03f7Z/rv3ub7EnZ5KosFrkwp88AuEv/2oie?=
 =?us-ascii?Q?zc57v+1n/DaJBSYh6Rv65MvJzBWterf3gm5pKQ01x3Lv56Q+DSxKiRi/rUjP?=
 =?us-ascii?Q?9pXOyUIKaxrG9MeBCbCd+PZv19RKtEJBI4jp8/Pu6bYn3nWgZ5n9MhYBwtmc?=
 =?us-ascii?Q?bdQHfNyG4Zcq3cGsME4e2Ao5yaRrL+exwFmuAxMxVoLWgSDLTl9V3Dr1gNEs?=
 =?us-ascii?Q?ZnMdXYr1yA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ac1d83-51af-486c-5b0f-08dedc34e0f2
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 14:34:40.5126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1fmfT6Wp9fD6wuFJlHVheOQgsZZkTZRB/wwPslwB7cvcCSlskKKxtVvlXNvDXx6+VORk80o9ozLsNcoVm7ZVhGISASMQ+b4/pEwWQD1ezME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0902
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 14:34:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240393

Backport upstream fix for a global buffer overflow in the LZH
decompression logic (unlzh.c). The left[] and right[] global arrays
shared across LZW and LZH decompression routines are not reinitialized
between files processed in the same invocation, allowing an
out-of-bounds read in the LZH decoder.

Reference: https://nvd.nist.gov/vuln/detail/CVE-2026-41992
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../gzip/gzip-1.13/CVE-2026-41992.patch       | 32 +++++++++++++++++++
 meta/recipes-extended/gzip/gzip_1.13.bb       |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-extended/gzip/gzip-1.13/CVE-2026-41992.pat=
ch

diff --git a/meta/recipes-extended/gzip/gzip-1.13/CVE-2026-41992.patch b/me=
ta/recipes-extended/gzip/gzip-1.13/CVE-2026-41992.patch
new file mode 100644
index 0000000000..5d3534fcb1
--- /dev/null
+++ b/meta/recipes-extended/gzip/gzip-1.13/CVE-2026-41992.patch
@@ -0,0 +1,32 @@
+From 63dbf6b3b9e6e781df1a6a64e609b10e23969681 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Wed, 15 Apr 2026 12:00:17 -0700
+Subject: gzip: don't mishandle .lzh after .Z
+
+Problem reported by Michal Majchrowicz.
+* unlzh.c (read_c_len): Clear left and right when n =3D=3D 0.
+
+CVE: CVE-2026-41992
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gzip.git=
/commit/?id=3D63dbf6b3b9e6e781df1a6a64e609b10e23969681]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ unlzh.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/unlzh.c b/unlzh.c
+index 3320196..a6cf109 100644
+--- a/unlzh.c
++++ b/unlzh.c
+@@ -232,6 +232,12 @@ read_c_len ()
+         c =3D getbits(CBIT);
+         for (i =3D 0; i < NC; i++) c_len[i] =3D 0;
+         for (i =3D 0; i < 4096; i++) c_table[i] =3D c;
++
++        /* Needed in case LEFT and RIGHT are reused from a previous
++           LZW decompression.  It may be overkill to clear all of both
++           arrays, but nobody has had time to analyze this carefully.  */
++        memzero(left, (2 * NC - 1) * sizeof *left);
++        memzero(right, (2 * NC - 1) * sizeof *left);
+     } else {
+         i =3D 0;
+         while (i < n) {
diff --git a/meta/recipes-extended/gzip/gzip_1.13.bb b/meta/recipes-extende=
d/gzip/gzip_1.13.bb
index fd846b30a5..208220867a 100644
--- a/meta/recipes-extended/gzip/gzip_1.13.bb
+++ b/meta/recipes-extended/gzip/gzip_1.13.bb
@@ -6,6 +6,7 @@ LICENSE =3D "GPL-3.0-or-later"
=20
 SRC_URI =3D "${GNU_MIRROR}/gzip/${BP}.tar.gz \
            file://run-ptest \
+           file://CVE-2026-41992.patch \
            "
 SRC_URI:append:class-target =3D " file://wrong-path-fix.patch"
=20
--=20
2.34.1


