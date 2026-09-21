Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13799C982F0
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 20:17:32 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5807.1790021841236341143
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 13:17:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=TRy3/e4c;
 spf=pass (domain: est.tech, ip: 52.101.65.52, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pFYQGKe5/gGgSA5TPvlXzoFRMefDqgHwLj2dFiZggbPyH8fJIlSJQggVb33gHqLuZVpUjeRmRiFXkUOaS1a7BlyUZf82bdiLtKEBYlNmaxN7FyRs1zDaIUTJuu9uhYufPkjubglQNYqGT2NUqsTREehxlnyi//djzTfqO03HuoQ1lVhi+ZIVv/UsFGR2QesfBR78FKH4bnpb20uYIBaM2CepmVRED3YSxYmoc7WwZQe4UUXTc43LQzrvLCIwYpA9/nMqALIrdLnqYsifHtyUiZrDyKVwVg3eUjyHCt5MNTZTHShQtrmcw2TQ/3ru/+hYuAIjfVgUWlqdj+5HaOwA0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cH+zcMqk1ajB96GrQinmdPTW4q2mgzwuUslk5e8B++o=;
 b=gz+nAR7jdA587iGUxS3qv9V3unLQ9SeppSmJh1l+MMEA/RJNa5UZ+IiYfuunQTwPmi4eyfaU3hFrokZaY1XTAFuCLAlxF5QdrHDhe11fnliY7z69FNQRt2lTCLsuecXRmCspEMm4h/W/T8qq2FoCOLhtZVuP/AhALIGfmfXfXInTW4577A1cVQTikQzOHMevzm/rThx3Xk6eYDP8EtBmRvCjeOrTgxVsrRMBRFpd9mtjY9fErZCjEeLVphU1wzy0AK20v1OixYrb+WXYUrbWliiN6/vGRZhy3GwlnrDEBbgJ8apIU1fBzy5p7xNQSYv3Nh+ZvD0dq7UbO5K9i+WDWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cH+zcMqk1ajB96GrQinmdPTW4q2mgzwuUslk5e8B++o=;
 b=TRy3/e4cSSuPun9uvIgMYd65PiTzay0vAZ7/BnQTx9ffLJsVGEtF0qBtP2dJTxulV0p96qfGf7YW4wdJeHxZlY/9nZ5rJEw4X5XFBySuIzeEXQxoGMQVndFwlEhjwRTcbhPnvV+XAeBBtkNSM+Ghyt+vhs/bb2kPws96BfGi04MAs0GvjktWX5LCrNn65tWwU8Oh5JTPyxJWt0THyb0rGPIm7XPNxc8AF14jR8z4kicp8/sCMHVIUlWe5yCN9GPAX3TiI6e5TRguyRDU4ulEp9K1BkgeFwMLkmfDprDj9n+B+F/kFoO4KgIMzDSdUjCVo5tFmOdVGMdd2avo4DhpIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA3P189MB3314.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 20:17:18 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0428.014; Mon, 21 Sep 2026
 20:17:18 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH v2 1/7] libpcap: Fix CVE-2026-0799
Date: Mon, 21 Sep 2026 22:17:09 +0200
Message-ID: <20260921201715.79085-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260921201715.79085-1-jaipaul.cheernam@est.tech>
References: <20260915194520.45847-1-jaipaul.cheernam@est.tech>
 <20260921201715.79085-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS4PR09CA0002.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::9) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA3P189MB3314:EE_
X-MS-Office365-Filtering-Correlation-Id: 5419c7ba-be3e-4561-1ad7-08df181d55c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|4143699003|12006099003|10067099003|3023799007|13003099007|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	q/+BeNm8plLKpasfn1Gt6d06WRTVJEV3tbPGaVH5Nu3eLyXM4+UpPgUtf99VyoXT1i/MNyqO6oC3ro+pI4BRnTDJWJBhEVpCEUbEkR4d0JCxLixT4JXPRgeEuHI1+u3p0bTtXZxkZONfXygEEs69ZEmgFJdgkOtsokN1eBgkHvP4bx0uTs2gDN+9HSP9d2SMgjR/un8dXq45h4nRICeOqSy3ukbxQZFRMZh/MTDChB388r85Pjo6VUzaLM+rKHbzvc+G1mgIpmr2GmiD0F3IXGeAlAC+CHxYq8LLylbT5Is/CBwzJCc0Y6lFlVDK7Cf0g5C03ZCoAdr0mj4GZbXwkBMcrN9OLPPtfUWG9R29aJdJZAAC12s7u0yiaI7YYcMtGznWjl1xIUPNTeoyb6YsF7ULuuCac/eAUxg/Y+chOg7ngZ0pnq+W6w8V8KG0fufmjEwNoRGCFOzL8x2Ifc8QCfJbZKst/NC6fEqE70aOO/1/TtMFltzYIY0ACnrkBIsWkqa0uj4iyAhgyH9Gu489RM8CN/NOMYaA9rbFbueDDIJAe1gXZQH3260So8FLUlQz6KddJQ2fe04tuipzQ2IPMjs6clsAulgmZo/ZklK3cm73osUjBLEk+7nk/VmrUm10
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(4143699003)(12006099003)(10067099003)(3023799007)(13003099007)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7s0LinomC2XvtZWt4ltc88rSoJ9BOA0m4Bs1KDZX4VMgUKcR/Mt4GBumDXOZ?=
 =?us-ascii?Q?bzmblsso/ACnc1FcQQNDljJjnxlNQmOfKG+XYtki6IXlJcQctZ+yeSBz74M4?=
 =?us-ascii?Q?IYxy19kstagEG6f/m80syf6xH/RHMc4IeLuNIbr/zmPSKHkuxsMOSh9ATC6H?=
 =?us-ascii?Q?1o3XZIvbBGS25jiWtVfQRCsDWlVx3q1yE/YcQK81b56h+ZheHzjnCOGu1anf?=
 =?us-ascii?Q?MQDgZhpICLTzoSBjic11DV/gl4jflZfquilO621xB6V4bAzzW7mYlMqYC+xE?=
 =?us-ascii?Q?HaxQSM2d76w8Zt2KmPpiMdAFHPiJkbGtGXgBwMpRgZ4PC0wRgEBxhzBa8ash?=
 =?us-ascii?Q?UZjguWKED69shXJEZC6x5Fwrdx+25sxgXg8qp+LOye8HYkCOsB7RBOzGlRZB?=
 =?us-ascii?Q?QAi+T17vDpU2aAaD8Uo0mfCZ1SNbDblsBzac4r6Dum3jB642zxb/i6JiHB+1?=
 =?us-ascii?Q?oVLfcJKA/7THHM/jnEbbtcjlfEamseqzha7yoPIqq8mWMXFtvxvtSMqAY3gy?=
 =?us-ascii?Q?fGVzIDWNYLTnDFM6qqCIDnGqjAF6t23Qk1MNe2WG/h6YjGony4HwMm23/j53?=
 =?us-ascii?Q?EyP7XxyEYmWo6W1TuVbKlmonL+j/Bw+nyGck9FKRkwSqDbosQj7KuK8RQqXw?=
 =?us-ascii?Q?eoNEaTBCpIMaI01abr3cIw0NGfwzJuZ4eSQtA1d+s+E5LHVT5mmLYqza5kiV?=
 =?us-ascii?Q?0W6i0jDDlVfOCKCTNVaS3fFh19Qn347VuQl8igJ4N9aIU7M5VFy9ZCE/y3nS?=
 =?us-ascii?Q?+AOgUVBMj0P0D+Kf5Dzw6OtCLOTtMXWNOCswbF5xWEoZTEhP7vmTeWZ+bIfA?=
 =?us-ascii?Q?ej3KQyow/KyfNR+hfMT6TsHXVj9VlkmftjoM/yVfCPNaC6DqJngwy/Z51Tah?=
 =?us-ascii?Q?ffloOxL4S4xCjZSU4aoST3sAE41nf8ajm5PzLu1l4+7305PxNbSb9V0PAQwC?=
 =?us-ascii?Q?L682DoFEQHVWnMnb3OI4J+3BqDqHaJVVqsUEEDfLbHvwYZYCXZsF2kggW5GH?=
 =?us-ascii?Q?jyHcWKregPpZnKE7tkbXJ9kzeJrJpWfT3LSojF4zjkbL7Bd1TsFbO46mz5HM?=
 =?us-ascii?Q?8w1gDNQxwiAyNJhFMCDmt2AADSbxjcDxH78mmj9Z5O+wxKRujqjiGlbg6zpk?=
 =?us-ascii?Q?7E4YUsx5FS8rAkz14r3vYE/1OBNkmo2ql5HPkwSzCjy5fU9EqSjg14D6/cfN?=
 =?us-ascii?Q?XyCdzviJGMGcV0gwgNGmA1Vm9NR+JAwVwiVBjvBwQC6qUSzMCOsjDcw06x4l?=
 =?us-ascii?Q?YQQmcbwd+woQ5XYUWuccdnB5pmQ1eZDCZ9VwZWH0NsN8W843hLg5fSSg1EUj?=
 =?us-ascii?Q?6DLbEutx8Tn3xM5VS5mPluHMXexbHs7/e5Hk0biUXdmG3s7sIxG6U+SGNfED?=
 =?us-ascii?Q?Xjb0+QMdG2o+dvO3LWJ7QvlU6P7f57b1iTxTtbaRA51w3Ol8njDjBMmyC2ur?=
 =?us-ascii?Q?TGiwMeJK+HjxlMqKZxOlW4G1ngIglHp+7TPb+Tx9TrYRQw0HhOmeggICxl/s?=
 =?us-ascii?Q?O3ro0mi+/O36d4iOJEIj0a/puEdO/iriAU/XbgxA9pyGA63Ip91/F7AJItQ2?=
 =?us-ascii?Q?+WizMLms4/WkOXKWKifVCRemWOJNBIV7uAx0cSADTFM7nPC+Cj+/8KOgryLO?=
 =?us-ascii?Q?mzihVV0eA3ho26FhAi3YEJ5Q7y+KUNvoTAhIcWR4GKCsHIDXuxJEDG1u6FrK?=
 =?us-ascii?Q?leuo7dOpoSv9Jv9gUJxvgRIyYsB9YIzuE/YOlLGigIH5gpuiTSCLxEYyUdTN?=
 =?us-ascii?Q?yLmeLtfYrA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5419c7ba-be3e-4561-1ad7-08df181d55c4
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 20:17:18.3083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PxfSwgXThsA9Y9c1Le5AkfkKeIjV435SsqkwCJI/cHBbbzHJoJyCepLyMDTEd4+Ti16ckQXioTJ9IC9oLX0u4g8MEgP/qZliBEdKyvTpuM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P189MB3314
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 20:17:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246349

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

