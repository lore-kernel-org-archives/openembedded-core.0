Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 536CAC982C5
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:16:43 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4960.1789499791346222233
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 12:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ACn+39uZ;
 spf=pass (domain: est.tech, ip: 52.101.65.29, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k3+dZ781CCIqeNCJNV+85OqJ83ofu4RQifAYHRxX06KV400zsE7smQq7BBAjRiLoTftekcMvKux8kVMbqQhV8UEk7F9OQGV+Ev1ZN7LE5UyjeOLXZGhWugrRu1bjrz9mzQfIFHpC/4LlmGQAW2Li2bhJTpzFnW7za/sovpaO8ShwaCCVQdTJPcHnwlXn4S/LHkU7OZOjeRBbt3TGiM/oRFpbSF9jKrqsJDqPiOEG2Ke4sNUG5NYiiG2U8vz5IHu8khwck7G6c6M/U/Lsy7AQg7U4XAbhFvKRuxziwn8MBvJHEpGG2H0nNUP8st+f2mj1WOgYJodpZPJVvKDdCqUHaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RCEkcbSorxUBzD/2zOIKQR5lci5KpOWCSjwpsp5bmiA=;
 b=gWeObOLga5QeisXC6u8EYx2kaXJ59HMY+5R0awN9DED2SKsWfZq/dZ/BG1SasumWLtjDxTnU+Wcz/DuYWdsaTDbR02uCmv7GWt3j3vHH34EY6Y6Aaxz5TTJkZPWTd0kcIyjCB4+nn2fHq6zt3lBtdlc0l+m9m9L5LLdI6oltkmXpjX+Jsr60dcQmJ50dDu9K6iUzGF6CgWoScsK255YL6T7RNEyhczx/C4WXf9bFtyb7m2DAdmUI8Srh1HifCLu0p8nQk2wV5Zx5FXrqGaWtKB7xFPTvSOVTKv5necjjMXOUoaCt4YzPqH5eJdXH9VY3YInytm34kXUuWkX7iRIBsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RCEkcbSorxUBzD/2zOIKQR5lci5KpOWCSjwpsp5bmiA=;
 b=ACn+39uZ6uIrNX+PEZm+a9Z/vVlbFTKUg81KhQbXxuBtEVrFoCx7LQHeb8nKYRfbn/axARrSddU7NrrYIMtIUuNPGrM1Bjv7lNVvFu+qjr/vqZDS9uWO6ZG2t3+Rl+KkshFkrHL/1V3OSq9XIP/jER9tgb5l2NDN4lgktjbg62ONEQGDQYeK2N3uRnWlqAdCV7KK4LC9hepQLhYxIeY19HQlfySWk8Iea/5N9gRfHNc4Sifz2hqZDcot0L2qkLoRDUPu2diWvp5rH60Orp9KAKZVZa1GKqMRAEcgrHY1qKR3h6hz1lCvc9RzpN7a64A+hpy5JPs3aC5cg7GsllmaaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM7PPFCA14042DD.EURP189.PROD.OUTLOOK.COM (2603:10a6:20f:fff1::6a8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 19:16:28 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 19:16:28 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v2 1/7] libpcap: Fix CVE-2026-0799
Date: Tue, 15 Sep 2026 21:16:17 +0200
Message-ID: <20260915191623.42107-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260915191623.42107-1-jaipaul.cheernam@est.tech>
References: <20260910051154.30595-2-jaipaul.cheernam@est.tech>
 <20260915191623.42107-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB8PR04CA0029.eurprd04.prod.outlook.com
 (2603:10a6:10:110::39) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM7PPFCA14042DD:EE_
X-MS-Office365-Filtering-Correlation-Id: 9401641a-3cf5-4e81-0a70-08df135dd7b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|6133799003|12006099003|18002099003|22082099003|13003099007|3023799007|10067099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: 
	q4jPIIJ2py/HUreupMpY4d/jPx7U2w1bfF+1sFnnM6nwZRY+HeuBBXJT8lG9kVyzy+9+bfwFlt60yUNZrIcohgiq4ndEGaqQlIhzWnKyIpPxccwlFIKvi295Gk0J2xsr0Qwac4N6HojNQEpsHIXbu9XSLbCXAIiqjfeNiw3M6Kl7xMv+XJIUG7fZ25V9G7jEeLDExAwCwpdY09FUoXqjteuHT6s57cqkLfGd+VIT9lHoZoQANGVdrpIEzSfUVLyYH3i5Kh5QbuC5/aOqQBbmxDlWgPfFtAStUor/MTTd4otLq4maR4umxsZR564V9SyXzxgW8P2VzqVm+vYC5jr99lAsecW46OLeLZSaah7wfKmUA/qbcDV/lFhIW/hFZwsGhSvKbqXaLy84wnv92x/iu4iSfU9da8ZMj9rcg5UJIQyUAoZDRSJYVVvXWSuvyeSRxynojZwNKIDzsY5m9iYjqSV7FNR0le97hWM4ZlVVE3xvHls9TCUPVtcxsHG+Cs+DV4E4jpevZHOg+LqzbPdGP4hh3R6OujGZrIJ4uhYZb5V34ZdYk4ug5GIKvcPcBPuxi/GlGhM4p5La4p8Ewo3Cn1Ut6Q1pq4s6D8NOUh7UVEI4rcm05DyqT9juY8crlJNY
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(12006099003)(18002099003)(22082099003)(13003099007)(3023799007)(10067099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FuVn1PpdOnHRhAaty7rjHvmGU35N9dpq65VtzxMThtjmoi7+TC3Na1zoCgGX?=
 =?us-ascii?Q?nUxYQ3CG2eVl7qScBapsbVPTmOhBIZsPUuZAAHL9GCd6lSPOtj+qOnEFkBxk?=
 =?us-ascii?Q?GU53Idfu0N3nlPS3NhPzCN7EA/Q1FIQnK/vd93bZ8GUFNx+5pMRGT0hO/emT?=
 =?us-ascii?Q?n+EaY+R13VwNNnmZnd2DJ61bMz/4PD4uJT1R5O0GXBJqmKuVV2kBZ3mGlVmR?=
 =?us-ascii?Q?UWHQoEi3tmlRDOt/IICasXrbhsnkPmLoGSPmmpkFxhJKJAIefpOFpsLCWT1m?=
 =?us-ascii?Q?A0vzaq3miaos2dLc96OtQ+UY7fjMGFVSErm0XaVkGBc7hqjA6RQB6ioEm5KL?=
 =?us-ascii?Q?13GdCFsF85dk5oZkuUUwiKyqcQEIa2SmJPHkX7V2g2iDUpYu05obFAkNRHJ9?=
 =?us-ascii?Q?Nek6z8CGCis/3jizMfdC3oLdaTqM67kNcySeqfG3z0u7jL1ML933Lb2agwgy?=
 =?us-ascii?Q?R3s3R1paHjjMwLn9Cl/znb1ssduwILC6t7EjQHhvHnTEA7K8rll6yjV77utX?=
 =?us-ascii?Q?QiJSU6bK2fGKaOJsvbQd7JwGQM0IWtxgi5Iy20LBFED/fNpUPe+eIJt/T5ij?=
 =?us-ascii?Q?tyoiqpDZqFXf+U3whzy37cIesWDgEKKeyUGAofh/2NVlF8YHvNtq3mG0KP45?=
 =?us-ascii?Q?GtDehWGDtnbAn4hiYekaPooNNtkjQniymX0XAJxONrpd1OhYR57SxI7tajKP?=
 =?us-ascii?Q?6UiasbsklI/Ni0d9aZ2BBwhi0NqZjR+l5ozAWmJfLeaMIJ2qbDsZwFm2kYgT?=
 =?us-ascii?Q?cWCyxPIt8Y4gX6Zj4taKGbFwIXFpIZ0U4QNn6J9Cz6qvIag7xYrYY5Mr+ufs?=
 =?us-ascii?Q?DC7yx3ta+DQBlrwJdHH/oiMjOm5x2+53luDBv6h/Unsn2aTWFFKwgOnEwL+r?=
 =?us-ascii?Q?lKh2iyIlCKgmF4UtokFMu8XSycKLPbLJBmaRDpFRp1fqxn2VqhFydnjT/Uat?=
 =?us-ascii?Q?oh5gEzZbil2rvEvNeCG98eWusrLENwx8GA/jl/nXKb3abIabofrkDbgJi8kh?=
 =?us-ascii?Q?OuTFNF7wwr+h/eANFX+1JCU6AkZwTg0YuXIKllGUkTefF/o05Ft6SwDdu98q?=
 =?us-ascii?Q?9nXSj19V4Ae9iUrEmgRL6aqKQRMa3EWfqIj7yj3RPjzBzjn3ys55dU+U2lSk?=
 =?us-ascii?Q?P9j24AytQ9cbNcvIorQ84NCwh7pCoYNpgzZbOnfznvnPLD5S8ozgw0oCSAvX?=
 =?us-ascii?Q?wezxusMCWhTaLcmj7AisHCTZqbgNCd+ozC1yOviGTHETph5t5TT+ds3ynbo0?=
 =?us-ascii?Q?Knj7DyTnpJeIZFcqyy38R10jpaadQtZm/61TRChleJFUq3LFV/Vz17+2r9DV?=
 =?us-ascii?Q?+rOufSPH3hmOa2AWnhQiHln9eTndjAqYTpWRywHAyuwBSWDF2UI95qlFcW8V?=
 =?us-ascii?Q?YO5/BHUIi++mA8PztS/fakoJ6TEe7pNGKQ1GcfhQRPQjAhlIMHLujtnk5YqM?=
 =?us-ascii?Q?sM2Tar/87qHn+sRlAjMbOjiJc5MtPkrpXO/Q9kD8GNU/VrjDtMW4GgCNg5rY?=
 =?us-ascii?Q?MsEhjRlaX297+yh561UkIYDcBduWrCKqS3/drvh2Gz2YWQhs4NIQlBZURc55?=
 =?us-ascii?Q?Qx61E+Aa2L9inOPs29NYRX4C4S+PGiV+7PUwgWcZ3N3es6vXznYSeybApZE+?=
 =?us-ascii?Q?dxU6R1AEzb4QOEsVR0IVlx5sV+HJdc5lG3gzChGukzym/HDgwNt79D0YwgC6?=
 =?us-ascii?Q?4BACJKAtWMxVWG5E/yIXGQ0TjAGF4ubMgs3fFkf6z2SVrhnXODKBPj6RzfNy?=
 =?us-ascii?Q?Duh4bKH8oQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 9401641a-3cf5-4e81-0a70-08df135dd7b3
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 19:16:28.2703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AVNFIF0oWmA3SQYxYHUYQe3VUAa6xOSM/hqMHoSE5BD/PNeE9jl5XkvV9FpJW7VzpPQTAdriXBTm93EUeKTVMknJTMIU6WEuv5XyIzK9q2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PPFCA14042DD
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 19:16:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245868

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-0799
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/48e896=
0a7108e9e828f9d7bdc7e97bdab841aec7
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcap/libpcap/01-CVE-2026-0799.patch    | 67 +++++++++++++++++++
 .../libpcap/libpcap_1.10.6.bb                 |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/01-CVE-2026-0=
799.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/01-CVE-2026-0799.pat=
ch b/meta/recipes-connectivity/libpcap/libpcap/01-CVE-2026-0799.patch
new file mode 100644
index 0000000000..7c40faa608
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/01-CVE-2026-0799.patch
@@ -0,0 +1,67 @@
+From 3c55fdefa576c7a06feab86a9e4341be414de49b Mon Sep 17 00:00:00 2001
+From: Denis Ovsienko <denis@ovsienko.info>
+Date: Thu, 30 Jul 2026 13:33:41 +0100
+Subject: [PATCH] CVE-2026-0799: Access M[] safely in the BPF interpreter.
+
+Include Security identified and reported this problem as a potential
+vulnerability in 2018 (case reference "I7").  Their work was sponsored
+by Mozilla under the Secure Open Source program.  The vulnerability has
+been independently confirmed only recently.
+
+The current revision of pcapint_filter_with_aux_data() can, but does not
+check whether a scratch memory register index is valid in the "ld M[k]",
+"ldx M[k]", "st M[k]" and "stx M[k]" BPF instructions, and assumes this
+is always the case.  This holds for programs that have been generated or
+validated by libpcap.
+
+However, this does not necessarily hold for programs that come via
+pcap_offline_filter() or [deprecated] bpf_filter() from an external
+source and have not been explicitly validated.  If the interpreter
+executes such a program with an invalid index, it will read/write the
+process memory at arbitrary locations starting at the current stack
+frame.  Depending on the address, the memory layout and the OS, this can
+result in stack buffer overflow, SIGSEGV, SIGBUS or other effects.  To
+fix this, in the interpreter reject the packet if the index is invalid.
+
+(backported from commit 569f8fd3524192acbabf93c9cd704471bb38f84a)
+
+(cherry picked from commit 48e8960a7108e9e828f9d7bdc7e97bdab841aec7)
+
+Notes on backporting to 1.10.6:
+ - The upstream CHANGES/changelog hunk is not backported.
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/co=
mmit/48e8960a7108e9e828f9d7bdc7e97bdab841aec7]
+CVE: CVE-2026-0799
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+diff --git a/bpf_filter.c b/bpf_filter.c
+index 9b899bbb..510dbd9c 100644
+--- a/bpf_filter.c
++++ b/bpf_filter.c
+@@ -217,18 +217,26 @@ DIAG_ON_DEFAULT_ONLY_SWITCH
+ 			continue;
+=20
+ 		case BPF_LD|BPF_MEM:
++			if (pc->k >=3D BPF_MEMWORDS)
++				return 0;
+ 			A =3D mem[pc->k];
+ 			continue;
+=20
+ 		case BPF_LDX|BPF_MEM:
++			if (pc->k >=3D BPF_MEMWORDS)
++				return 0;
+ 			X =3D mem[pc->k];
+ 			continue;
+=20
+ 		case BPF_ST:
++			if (pc->k >=3D BPF_MEMWORDS)
++				return 0;
+ 			mem[pc->k] =3D A;
+ 			continue;
+=20
+ 		case BPF_STX:
++			if (pc->k >=3D BPF_MEMWORDS)
++				return 0;
+ 			mem[pc->k] =3D X;
+ 			continue;
+=20
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb b/meta/rec=
ipes-connectivity/libpcap/libpcap_1.10.6.bb
index d381a4eb2f..265c46e3bd 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
@@ -12,6 +12,7 @@ DEPENDS =3D "flex-native bison-native"
=20
 SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.xz \
 	   file://0001-Fix-error-messages-about-32-bit-integer-overflow.patch \
+	   file://01-CVE-2026-0799.patch \
           "
 SRC_URI[sha256sum] =3D "ec97d1206bdd19cb6bdd043eaa9f0037aa732262ec68e070fd=
7c7b5f834d5dfc"
=20

