Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 008E4CC6B2A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 14:39:06 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.39])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15335.1791988742928670165
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 07:39:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=O/C1ICOa;
 spf=pass (domain: est.tech, ip: 40.107.162.39, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pM7p3z7sO+OehTg/bfxIymIpLBkG2EstbvrPGMeTeMpQ2fauZ++Txnos8ug9sfMPYIFYIGqhCo7Oowhh6FgJHj3oZH3/gUHNH1yV3acc3rjZKQpRhV4y8ZsL26d2uEb/Qu3CZH4AS4ko/qu4vcfUge9vMpYE32wlC8jXRH1jDdSp8Y+a8bm/WFfHHbBrGwyX2G+EbGgtl6zYfpmk7TZQWQ9CfTHp/cBX/IAMY3EtOyTTTHM/U24Qke7eYYWKoPuVSH9cSwh/MOVguSFUTDLutmwfl6QSr9ea2vDxIlvz2mIyBoUQwLy4qSReF5VpFPTCGmjOhnCWRSTH7CAV9WEPrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cH+zcMqk1ajB96GrQinmdPTW4q2mgzwuUslk5e8B++o=;
 b=kxRmQHGiHQDJDXM/wacbkWb2+ca3Yh7w4nz9KDezOg4O42jqz+IumE+JghwdcoJFCnwJ4fpaKrVV1KLzylFri4bFdWiJOgRgu1PSXKISmjj0CVnxEKxTaIym680RXTvCVYvmhjVyvFSyyrM6QiDdFOdV34Hf2O9MslAbbvVlRPdMmzm/Ujn5zHAc9dBZmrBFZ/5UomfAEIq02RLm5qSqQU7bkeldONHxOZbMhL2tcep9DdVDFHd8IpWXKQrufr4Sfxz2p1QaADYoGfm6lWTCuFN0XwF/MNvkk85P84/lV2Y4W1cxEERtekIl3AVYm2d0QJJU/5cRg8O+986tyfGe2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cH+zcMqk1ajB96GrQinmdPTW4q2mgzwuUslk5e8B++o=;
 b=O/C1ICOaS+2js3bAfW7LhTXTp1/g62rMFem43kEQXPQcplL28WyynW5MA8RaqLJ4SPA+Kp1TuZkce+PAqqznb6Nf3cyOWj9Tq30x7NEnRSuPNOlxNmGQ/qDZUY/11MesI57XiGWKhHjtwR11LF3WPYSoViUWCDxjqcORLijkJLhHiuMmR/uMjLayGMUgK2jwf27+w3yJvg6F+bPhRKyyjiPTmnuZgSaPgW14xcQMyiGFWZkiOR73f1TQloqaPYa7IQXZl0+14KOzLGiBiNtBcE16275fusGNoVyBNA4A4roNqzV1FE9eoqvG3zzjNaPc6iHHBoxkBFymOXRb1x5vmA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by BESP189MB036075.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:138::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 14:38:59 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 14:38:59 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH v3 1/7] libpcap: Fix CVE-2026-0799
Date: Wed, 14 Oct 2026 16:38:50 +0200
Message-ID: <20261014143856.74426-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261014143856.74426-1-jaipaul.cheernam@est.tech>
References: <20261014143856.74426-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0224.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::20) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|BESP189MB036075:EE_
X-MS-Office365-Filtering-Correlation-Id: eef4d022-9e59-48f7-b8ee-08df2a00e26a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|12006099003|18002099003|22082099003|10067099003|13003099007|3023799007|11063799006|260925022911599003|260925021311599003|260925021911599003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	L2SRstWmTcNXTEHjbiracpOD8hBo9UwIe+C81oX//8LVqrV+dGaZKMGegVtFSEMTUfFwGFBTR8hWhkPrJuvBVJNaEjvnHhaa1Z2ErZqtJ8PZjkQvixN47KQ3LPdeqt9lsuNEuNBlhZ5R5NIXb+nvA/qIo2joXibGVeW98JS5VWOHwz42s64xRguTfXMvnTHPRx1aurFl1y5uOWa89ij82ObN6DMJwyiJQuakuMIyxEns9ksrH0YUpIeb6sgiG+8mMUZ2S1/HPBrfd8b1JQTKrr+7yx2ws72cdH2rxfQkvsxwkt0aV3zeRPaM1qNs989pmZFT4wThostKncxLaM/d8YlLFr1M3qp6zfAbjhbkHCHeWV3WTzkUmcw40LUIknBo/Q+luQcFNYyIrKUfQeFcq96i4j4o+Rg+Y2LBxsxabD+wuxsdgGNpb6eF65BlJLj9F5h212R7kScTTyOemoGuIu4iZLmF/K3rbop7JgvQ6sjas1WKSs2gicQCIwm2J72bOhGEuxADDDMBTwJFNLYUkjCKyQuVkBxjkoxHanqNv72SNHOi1VImAvTyhLjnvpFhX/7cqatOnrR5jd2DghQlMFrp1JoKKr1i+WSRS+ImKRkVhLDbAXLJCWKKtJ8/OsIg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(12006099003)(18002099003)(22082099003)(10067099003)(13003099007)(3023799007)(11063799006)(260925022911599003)(260925021311599003)(260925021911599003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aypo69/f5X+hvI6oDZwUtn8/Bj0x0ivh8umqgB7AkyeqiIhaui31qJmPny14?=
 =?us-ascii?Q?Syh1jRBPRGqbXjpZ2vl26G7LvKjrp8CTM4g/jJdzB6ut77vx2dmGNKFhKkxW?=
 =?us-ascii?Q?OLGChRTpmTlxAhX36beUj26y2tW0cMVqxvtJlhDh/E5D7Lvj86+VKzhvyxlS?=
 =?us-ascii?Q?BNQJQ1gGMeNLmMjzXYWLhOtA+I7xRKZrF9ayqbYFiyePbRMtwEGEUTuPAihi?=
 =?us-ascii?Q?Qf0D81kWS1rczW+nImWIaSlHihYg58enfKwhdHDN41H61Jj+BuvzD/aQKvvi?=
 =?us-ascii?Q?sb5DvEMyUz66WEWJsuq7nqrRRnI/SBXl2zCt8GKORRgJHD8bLVjlfRp+ij8k?=
 =?us-ascii?Q?nvFgdHelyQGRDBCmmV9Y7iX0glwqR1elxqceUfiy6pSnMu3bfH2xlBgLO0fs?=
 =?us-ascii?Q?XJLl5CAEtG5lvZ9qhc59akC8yD/gpcSiriaausoFrB7dFCAhwXYzAc25lnSj?=
 =?us-ascii?Q?5lXAGU93J30WkjUFibnLIz+Y6WZ/fLDuQKY36eK5+ZL8Be7Tmn82RIocddoy?=
 =?us-ascii?Q?dVqqQSZPUn0riZuGPjEYBFbKHRLF+9IRPmYxCedDn+q+EMaQbF1DAMxRhGlO?=
 =?us-ascii?Q?6tMxFidODl55biOKH3Rh+nyBWbRyKL8JjQTgqRmttOEEarU8owfpu1jcXwht?=
 =?us-ascii?Q?tI/dN5rR7Tx0ObE6Yj3bPd/9bQuH6ROs3ogKMKM0Yd5yc/9lt+6TcQDGm5cx?=
 =?us-ascii?Q?sh/4CKzSDgPK3wJTa5Wwu5/YyueRnWOXPT/mMsU8flZriiNCQYY5NneWFQ6e?=
 =?us-ascii?Q?tcxLjzjpRUetRmWLR8aRiGXVTjSoithr2KbFDAmcuxRChBsaDrDCIbjqZ82P?=
 =?us-ascii?Q?kgml9mJmBVaUuU/JzVqRqum6erUgkjd0WtETwRFTZk+6zHKmXIIWrytTcC/f?=
 =?us-ascii?Q?3YFgnkUsbRTBAeUYufLJbEba5lSVU6c7MdWaecyRihYH2EsIfjBjbKMWFmhk?=
 =?us-ascii?Q?RWJlivO+9oEF7QHV/XuQaltHKY+5eZ0k5Cz1NLm0wIl2I+7R+w8jjDammDma?=
 =?us-ascii?Q?C1la31N1m62hVf76kPju+Nv7pSeRK3EWayRg4/ic+kNNIR6UoKPZn2C2hyZ3?=
 =?us-ascii?Q?twlTxC2VctpY3MKQnLZSBUED//081JEz8yfUwBioCkM4fJQ5qVtcsckB3SEZ?=
 =?us-ascii?Q?ri6Sap1DRP33EvWiOOxJg+Qf4ShHi7omYUr7eIP/TqC/y6EGegJwhFdCkJPe?=
 =?us-ascii?Q?3Mz4eWuWb/0QCwCcs6MzO23CaDjhtx60taLqRbaxFF2jiCn4KRjxy5vovkbG?=
 =?us-ascii?Q?GHRE3EDLEfBb2qE3t9r9ryieF6iMW05vUnWe8mXz1+uA1C+5DG5TQeAMTybZ?=
 =?us-ascii?Q?MZE1Tm7E9IrMPicgfE9MsGk1yOzEhkLD+P9cZvA6PJlf5+3lgniiEQcC7DKp?=
 =?us-ascii?Q?BqqX5rd+nfq+WUVEcn4gpqMFCy2R9/2cqLEkB4nTNeKzlC0cMQkYevJoVmrJ?=
 =?us-ascii?Q?9gbBoYR6HfBr3LTtEyLTyOSBMkfyPCh2YpopG5qQH1upgP7Vq25ZCGxBIbLd?=
 =?us-ascii?Q?bWiYhHskVDtVhoV5ryNKQFbPEo8k9898k2rjDakHtocsQyWIGEc5rqhnRhTe?=
 =?us-ascii?Q?u3TAK9KRG7NaHTtganpQouz+jIYs1DJUV9E6VOcXQbRq8/dW5Z7u3RASqwUC?=
 =?us-ascii?Q?nnDsLaFS6SA3tSOygJYFxVYjVwQ5iLr1kcDjlM79rDsmIe5iWLGflbqtxFT8?=
 =?us-ascii?Q?bCfsU2YH9t/mXFVmnKJGQM4HP1O9/mLttVhZ0SiEbgff4L/vYnGtdSeNxR8h?=
 =?us-ascii?Q?kP5KuWgmLw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: eef4d022-9e59-48f7-b8ee-08df2a00e26a
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 14:38:59.8098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: no/TlIsKFV2M0i3Sgx7heBKejs61LK5LTG4lndH8ut0YhuY83AXnBSy+RDxmU33Zu6YKwKxcc8rnYVCVLYRUoqS7v3W225S1bltNHA9IzKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESP189MB036075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 14:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247767

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

