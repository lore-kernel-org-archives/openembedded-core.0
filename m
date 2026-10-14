Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A008BCC6B1D
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 14:33:55 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15206.1791988427582314280
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 07:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=tlrM46Ps;
 spf=pass (domain: est.tech, ip: 40.107.130.23, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pMx9moE4zjYnYT8LXDTvcZU+HK6Q//T8YXrXTGgy+lz633dcuTm4mEgohln1YQcf83Wwr34y745CIelEJaefSjAcMGidc3ox66hpf/vLJQLVyI/Oref//0sXtqYl34Xz+7UXS8GOu7c+vruO7t489A6mi2k3omqdUFKHBN/U6vUxipa7LPj9rcFkkp+aSQFHFmLxuJ7yICHFKsxJw3kONRWhxvlVmKt5S/3+BBdD2woXeu2Ui2wttZ5pILJAM95zsajT6WrbHDirwCyZZ94z5R0uVhOz4xaAXT0MZrKF1E1tOcsEMUqsgxcfF6LvW5erPIwIikXWmY90rLtR8Iu5hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cH+zcMqk1ajB96GrQinmdPTW4q2mgzwuUslk5e8B++o=;
 b=w+YeumAWKKdZyY99IS87vcbuSkRiYQ2nYe9fhuGsArnkKtEXlEgvMz/+TrAXFIs9aAgO2bg9Qt/0p4i2jz2nGszr1h0DlOYnmk9f08abamEtO5r6y6Omzs15rOd50KQVJMtBXuDyWy57yT8kSfvlkmWGwSDimQKp7vKrjwE4+7ESUfxw2Cm1JfsJEzqP1SqCnIUT6WwD3g/W4zbpVOI0eHz+3UgPUDbi1GW5nCSUFE26IPrtpcFIZAh70aCtNxGSW5HSST3SlvMFGS791G4SQ9x14OkISixPMjmBZIEDJqtHPUYRD5oX/mYowhfB8De3mOLKI88jiiFr66u5BSN3rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cH+zcMqk1ajB96GrQinmdPTW4q2mgzwuUslk5e8B++o=;
 b=tlrM46PsjP4PHQOnWlfRqzVD+k9nuV1QLF+IrYxs26ZUw/2BFGn0Si4Kbtql24bfmDvDSIBgqFIle2izfT0Jes33HeMfEcnCw97Swah5wBvIekykp4eS4WMXMP9CIt73NWbPTb+MdFy+u40W/qMYseRlkb8onTi+YRG9d5euMuUxRNj+n0W0u+uGSQyTqJgtJzgR93TYHGVnsj9rRkSiNdMYEWRq/C8UQ6NOEjg93sNJD4W58pYuh6vE49vOcLCgxomu6GqoDRChYY6hn8TWp26mQNDt7a01VfibNKJV4OTOAKOZuf4RsyRZsoBguqyrY2OODpxOg0tqCbPYuArAmw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU7PPFE8B517AAA.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ae8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 14:33:42 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 14:33:41 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 1/7] libpcap: Fix CVE-2026-0799
Date: Wed, 14 Oct 2026 16:33:33 +0200
Message-ID: <20261014143339.73692-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0338.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4::8) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU7PPFE8B517AAA:EE_
X-MS-Office365-Filtering-Correlation-Id: 39e0c93e-70fd-4a4f-489b-08df2a0024e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|6133799003|12006099003|18002099003|260925022911599003|260925021911599003|260925021311599003|10067099003|3023799007|13003099007|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	oKwD1sCDEEkPO+WcM1SuQnvmPa8wTwG7+y3lXDczdxFyViPihs/50cymvcrhVRit3wInbaCPB08Rrg7VFLEX9N/b+jJ2euc8RP7xsDYpPyoTUjAHoR1RUikHRAmbjvOrANZaxrIJ6mXQq9FwzMtzDG8LOt+7o5ea56r/X+6tcTNWSF9/EwplQqlk6Ghx4o2HKkTkHNQ4i+tk+010eny5LOZ59tsNn1O8uYNugvgeC0YIovYkT6lx4CCaiNRBH62appz89P7LVMHe8MYquhaxtdZN9lrkDQem+zDys2i5/O9gwvm1e64WlH1MDJc2DzYW2G0fKXkuh/ID6Ru9C2FgLPdZPH9MYCCy9Vx0b3UTybuHuAS59ZIglQxLwwldhd9zSLxqeNYs+6gt7CiPjYkPuDr4Fzf7R7UiyFLUZdY+XM0ZTDOPZvjPUdo4y2Dr8XodNFMf8c0NI+MAv08qTXpD4cDIoynxdl37LjZV5i3HzeFUAGSipQOMk/1gN4Z+xpwjOaXc3Dal7Qr/ZCTLLLUpWkUqhvO6yhrMEBYmkmvg6brSmK/2M05GfBOim8Lk3QRR7v6yDID/0Juyry11m3Y7V94NvNSNciV7bFCC2hdnT0mkXgyoH+VC/nvK+lIFeK+J
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(12006099003)(18002099003)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(3023799007)(13003099007)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?l/F95Mu8hAeYETFAA2Ge6JJySYc6H0z/v16h4fXSH9k+IEID2ExmIFncm6Sq?=
 =?us-ascii?Q?ZHNQHBf0J8avCn8VaWUnG+1zKYHSwWK1iGftR3jJ+lYh/bRjV6VtvSoFpIJp?=
 =?us-ascii?Q?nCqJFMTw6PXMLOBsWWlwgRFgU/xueG8ib3mdCdq6U6EjJtgN/SuWd5riaUrm?=
 =?us-ascii?Q?ZqF+DXkBg38RgPtMdQK4xW48UFj0mqbLyT8UUpS9gC0Lu+VYWM9QQJQezBR4?=
 =?us-ascii?Q?JGcBgMz5UxIQmORbOy7OLmRcTk8uGVmqnBOnEr3CAyJ6i7ml4aQ6AoUxTNAf?=
 =?us-ascii?Q?TPwbRKW/S2v97UkF+HJMZtlWq4/KaLZu8Rza799zL58a8q8/ub6LLUPaGagu?=
 =?us-ascii?Q?gM8tKIHpyR0nMd8fS6jTYkBV3sKPcky8ygKr8VB0aEYhBOyc1H1EInO1RJtu?=
 =?us-ascii?Q?0WibhjQi5YKoaITYDdEKULjZeXd9s/kp+5gVWkz7sZN1hX0qvDRnIppjzfO4?=
 =?us-ascii?Q?Mjx6fpKNI0FtY/9EB35CojxMmHHwOppqLhM0Yho/yJj3WGI45GJlPRrhXTcV?=
 =?us-ascii?Q?juGijvCIwv3hrLENIHwf+XEf3FoYF2IrCijvV6A+nQYSNdLim+W91VhL5GYK?=
 =?us-ascii?Q?Bzc7qaEbiDKJsq0FPU43CTQp2bkZpXnDD6q1fHS+vHt6aTNuL9VrARw0miDU?=
 =?us-ascii?Q?tUyyfwFUCYglcG1tF5OcsEVlEbLY/2Dc+MHLvRecgxhba79lZIriIVuRUOZL?=
 =?us-ascii?Q?6Xj4FucTv3pc34zcTLfLtgOpseDSfzYDvY+D/9FXIM6QoAsWxi+AVAyd3Mi5?=
 =?us-ascii?Q?gnC+9qv0xALQQwisSBPMb2Fg7zDXtW3uzfFCihqdwL7BJJpRrUJpNWUszDNw?=
 =?us-ascii?Q?cnCTcIW7TsSWEF3orApeAcIS70QNqYKnlLHBmaQoFQOfv/OwDVRuODpz7iAT?=
 =?us-ascii?Q?jJURezJDc0nouwrYWz+0D/jBNlv0ujvcXBjxFzpQYgXef59+fJeSBQ2Az+0L?=
 =?us-ascii?Q?pHKuU4cfKJUkvSILxBInTYFco3+h3aI6fh46nb70XOTs36DPn0bx6+NjZJWR?=
 =?us-ascii?Q?KIhzqzVrgui1Y0R66qy6EDkvckWBwtKO4kSFVD2FGFdG6aLjvgkS14O/xudH?=
 =?us-ascii?Q?r/FqX3ytoneSlyFNYVtPsui6rgRQZiyB7JKhfiAmzLN5ILnvYc3z1eAtR7dY?=
 =?us-ascii?Q?rN/ex+NZ8iXhnTb5FyQv1tpnIjEskMT5jPbHtOKGMGqH66lDzLzKJeaoRjYh?=
 =?us-ascii?Q?NnZtbn/jUK4lF94qh3RNcim6FE28q5KVdBLa7NVzKyaaW9M9Ildm+Pgl/M3V?=
 =?us-ascii?Q?xKmls7v9WqbBHJHe16jLU+AaX6JldVSAvcwZBQAoxcw8ywHQEjbMX247ohpm?=
 =?us-ascii?Q?wR2xt+cyAEhckJmKEH5xEmiSbJhztVRtt/feU5GpqVS2JgJP2jA8a2061EWa?=
 =?us-ascii?Q?rpDtqduHB3VkZy2WxL8FaqmehhCJRxjeJR5XENQ43MZW4SSL0hBYs63Vn1ha?=
 =?us-ascii?Q?DZIWpN58EZLh2lJ23qbenRSbGfKG/s6Kg4l9erjb6EE5GzQVr8CM0xYGm8DG?=
 =?us-ascii?Q?ZDtuAymz10FuW5oBUpx7ak7fYa61F1AJ0zX0aHjF5Ep5Z+x3KlkHw3DGKlsT?=
 =?us-ascii?Q?Xq3O/vkTOk2JcmoYFpfmtFg3pdSnq0NZDiMFZgfq+ZFHcwx+zmCdvzfVpNKK?=
 =?us-ascii?Q?oHQJJibl36D8sUHVdMSRP7Iyw+vRBJKEAhZAFk6PkRkh4O0KoxmCRiRUyHsf?=
 =?us-ascii?Q?hOAbHqJ08v3r/1zmTVtMqEjlp78+cgGJNHmL/GS6aac450956ZEuWBO9g4OV?=
 =?us-ascii?Q?rrTWythHdw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e0c93e-70fd-4a4f-489b-08df2a0024e8
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 14:33:41.9008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aE5lk4eTCmjGkZFIwH1qj/ohbsWf3Zsc1yAAFIjsDAIfIlglpf7U5DI5I5FOIYvMrZZM7CIhFyGIYPoXBnJD7PUa7Dh1V1YajyFZ3NH3N9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PPFE8B517AAA
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 14:33:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247763

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-0799
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/48e896=
0a7108e9e828f9d7bdc7e97bdab841aec7

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcap/libpcap/01-CVE-2026-0799.patch    | 67 +++++++++++++++++++
 .../libpcap/libpcap_1.10.4.bb                 |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/01-CVE-2026-0=
799.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/01-CVE-2026-0799.pat=
ch b/meta/recipes-connectivity/libpcap/libpcap/01-CVE-2026-0799.patch
new file mode 100644
index 0000000000..a4dfea4236
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/01-CVE-2026-0799.patch
@@ -0,0 +1,67 @@
+From 48e8960a7108e9e828f9d7bdc7e97bdab841aec7 Mon Sep 17 00:00:00 2001
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
+Notes on backporting to 1.10.4:
+ - The upstream CHANGES/changelog hunk is not backported.
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/co=
mmit/48e8960a7108e9e828f9d7bdc7e97bdab841aec7]
+CVE: CVE-2026-0799
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+diff --git a/bpf_filter.c b/bpf_filter.c
+index 8691d0d1..fa82d1d0 100644
+--- a/bpf_filter.c
++++ b/bpf_filter.c
+@@ -219,18 +219,26 @@ DIAG_ON_DEFAULT_ONLY_SWITCH
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
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb b/meta/rec=
ipes-connectivity/libpcap/libpcap_1.10.4.bb
index ee7d7540f6..692fdf606c 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.gz=
 \
            file://CVE-2025-11961-01.patch \
            file://CVE-2025-11961-02.patch \
            file://CVE-2025-11964.patch \
+           file://01-CVE-2026-0799.patch \
           "
=20
 SRC_URI[sha256sum] =3D "ed19a0383fad72e3ad435fd239d7cd80d64916b87269550159=
d20e47160ebe5f"

