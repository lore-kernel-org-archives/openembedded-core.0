Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC92C982ED
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 20:17:32 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5807.1790021841236341143
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 13:17:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=N09W0qUr;
 spf=pass (domain: est.tech, ip: 52.101.65.52, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kF7Zi/ZH0BmHaq5m3BKwpAi2rFeqF5sKw1MfjmEaDWPMJr3bjcqsTUrDq3ef4H5c/ezhFHqusQBpOXbPI7Wt1gUu38eCWumUyb3ChegK/HYgnyaYbxj3GSeVeuluk2dQSA7PzXHkoCHfoVHJk3QbStVcG4Vz1+8dVeN7GNUw1f6CZlwVEjEp+JI7Aiy8oQJYbeg6KQwuTdfzpkxhjTYV7r5ZcR1JM/o1+opxGPQcVqrIrGeD9GsBANXUBvdrxf7HLQ1AnQdeYm0VM5Selc2/fPNG/cMKtQbHwe3WLw0ruseX7o6HAicsvfT+Of65uvl7v4s0UuSCazksPPS7Q9rshA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRgD/jOFtp1cgnJaStg9UYZ8b71J9sa0dffBu4FIJUY=;
 b=qHo7yGjlyurZQVtGdkDhpjZN54kLVJgTO6yMKhVgeFTm3TJAr345+FeRa5WCY7vCkOoQJ//mPrZwTH16pyr/CyPg2uGjZvGamOedoQBNg4/fg7XcfdUSuRncOcEyrZfdOs/VkkfXp/2tRp8yzNAMf8/OoqnAUdnEJC7/deB2NTci/THbDajTpYMHVjW4atTsETZGml5DTD8SNLcbJ0/LNpg/gfmjUxeMGyezfoiGoJhofKC9v8cgCw3NJJdRcqTbM7zycfNVUlGmUVwwuggCqEd5KdJNZ2r5f9NvCvjM9PFS5q9+lOWARECz+TGmB7qOZo/CKPkpqXXyjdRqKch2Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRgD/jOFtp1cgnJaStg9UYZ8b71J9sa0dffBu4FIJUY=;
 b=N09W0qUrg7cAiTkn1ziaUu/li7wJMFgUJvxw6ujajZoa4Ue+BwVKUfFdes6FdZgcwv7gJTfBeVJjmZ+hSWq6v077auZYTQzsMNbA4P8QQHUdSlf3cKcWIbdm4Fzi2n7mWNkLSCojTdDoIIDNIix2tTvlIQF9/0esYbu5kAx6ogcZWIvMmXEFpR7KuAG3MyLBccTPfyBOxEvxliy1S3uZgSQP3Z1IwauFEaxxbCMKe/Tuc1b9cVOMKklVF6Zp+2FklUa9d12c7zNAxGcu+OLj5+xwYR0kQj/XJCKQLTtaWb5Z4v0yYw3W2ytSBYbJtfLWQIz42eu6QHZ2rGXJVv9RMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA3P189MB3314.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 20:17:20 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0428.014; Mon, 21 Sep 2026
 20:17:20 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH v2 2/7] libpcap: Fix CVE-2026-31912
Date: Mon, 21 Sep 2026 22:17:10 +0200
Message-ID: <20260921201715.79085-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260921201715.79085-1-jaipaul.cheernam@est.tech>
References: <20260915194520.45847-1-jaipaul.cheernam@est.tech>
 <20260921201715.79085-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: VI1PR03CA0077.eurprd03.prod.outlook.com
 (2603:10a6:803:50::48) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA3P189MB3314:EE_
X-MS-Office365-Filtering-Correlation-Id: 44d41be3-dcce-4c53-4bc9-08df181d56c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|4143699003|12006099003|10067099003|3023799007|13003099007|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	irvojTqUJeWrKyY9m1Skfa0dz/yBvWI8ts4ptte0SLa/adAFDr/tsOIot/WAA5WzV7MGSSAZtdGncjaFLZVNAVLSsqTXf/rsLJWNnJgM1l+LGmISxuF0M2z98uyP0eLc0pdf7ckEvMyNsRVcKx6z9kfIWWaxEBeppij8nb1PLnY3YYiniiWxYUMJJrvihOI38U2OXjA+hS5OzzBJ2CDBGKEFFQFATZLDiQoIUm2mrCy/v6OmWsi5RssMM3MPTXSoZbvKemxMTdLzZlSA0wc61tn1DxCMgJk9DJ3KzfAz8ktLirKWiCqPcUdmizKDP9m+KT7TPSzU5eoyAEo8SnnuQzgbADHJ9+xRiWaDeirusQB4wmJ0njxSsQ7Cjpeu+AD+nkGb06vMJmiUA41IckHBSd65VFJVulUUmDDeQ4bkjkuL1nf1UZWxVsIdCoO5Ydjk0cB1ATBVu2zkTND9uakuwrYpht/GaSg3DEhSgrgyt/pA7Rk0PB1OPiwxFttEYdgGZ9C8B4So/k+ZkOZQ4daknJAw43MPKzlhQnAcDVDfkKclzPKkcDtg6AVUN+4VLo5V1NHPBvauJj+TuAuqlY0zvPyj5fnsNrj5wmZqOntSHjU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(4143699003)(12006099003)(10067099003)(3023799007)(13003099007)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TCsI+p3q3/kgS/1I1X0fY2xzRiOCkUpF4s9yai0vFLiv74/1jKImhN4iML5o?=
 =?us-ascii?Q?0Bw5aHWW+6gE+bi6YXPvMr3BTBhilqSICIeRlIQ3tOYTLMyIVpXGWfhfBNIV?=
 =?us-ascii?Q?GhyvBVqmw1UAZyOxJpmKitnV2YHJNr+mRTkqnUq1pJoPcr6HvYT82UuJZmBg?=
 =?us-ascii?Q?eXvct2GJYg9fhD9bKcVBmZq1m415PcaMTOaGcweUeMYuerpizaRY0wfBYBb/?=
 =?us-ascii?Q?NwXMxz69r2Xdh/wys1cAs7N/D/WWxnLnFxnjMldKQgeSd/bnn8WYbbBkMNDd?=
 =?us-ascii?Q?zS9k58lvad2hv2k5b29szPm23MUNRvmWiYqjqgIG8Fl2bVEFqdGEHvYB2mQQ?=
 =?us-ascii?Q?u2MOelg2jLf85lgje6eL/4thhWCJ7kTDZbxUl3HoIoJAyDlQWDYG8ydaezwO?=
 =?us-ascii?Q?I5IXnWIX09nNWhrQMwJSBadi+v1XzFs9tKpyFqD1ZUYS7Mkay+AA3uhm2BwS?=
 =?us-ascii?Q?fDXuGr6/oDGAWdPlSPWjI/hE2xh+F2FaWUM72wISVMB4O6/tUPOFpVqZ0bs3?=
 =?us-ascii?Q?hjpkovBOyohcxNNBtU1MtBdU4wJdVz4QEKtwkG/Ao6zCQoZgNMpQ/Fh/Wj+0?=
 =?us-ascii?Q?CgGsnuXlULqu96rQsQdarsizyAbwTTCICyUIeZZ6w0jawegGoA9DHBRmVMXA?=
 =?us-ascii?Q?nvIRVr6C2w0VHZllU3eioEsLguddAo1WWoeH07ytZVUXiXIOrMyRO5Hiyn9P?=
 =?us-ascii?Q?+otPiu7Ty+krcRD91t95BfxiIvBB4sdAeyB7bDevay4CP4YmpUT1BizuaATP?=
 =?us-ascii?Q?pHEro6SlB0Cg5oxD0/7NVHG489vaUEeduPM3DcGDdSFrMgouvrzDAG1rVIyE?=
 =?us-ascii?Q?HIA1k1Bdg1aSLzBWfr7WoQLVc05vjTidiL5TDvsmOiP6Vd/K7NUZTVhfGwQj?=
 =?us-ascii?Q?GDDH1DlIHDxSIsGPs+oS1LSvRt337jLTzR8xImmP1lPQeafzpGs8SB09ciNZ?=
 =?us-ascii?Q?K8m8IJo0LLiLMTNwiILHtmlshHTP4aqzqhM2Cy8IR2vwLJ7YnijrcUddAtN2?=
 =?us-ascii?Q?I9n3n/BRXjgExFEl3DdWaYn/E5LW/iIo43wPFzNagXiEgMhwXdzNyITno2XC?=
 =?us-ascii?Q?0VkLgxlHeCDg7B8NHP8HPhBP1JGElAGufj88VT30xlV43pEyNb7EBJWkR6Wg?=
 =?us-ascii?Q?FU9BS8UtcuPTVD08adDeyusywHDHcpcxSa16h/tJIvKYtPOzBn/wRYDmvcdM?=
 =?us-ascii?Q?k+6f9mhBHWecxKy7dZsTMcqtNgIwqdSIwPpKWCT00Tj9SrAuvWvQeFieN/Fc?=
 =?us-ascii?Q?djpY4ARZqZKtUaWcz9BDSAdgw9JYa3k+SDoJn3oS2VgpvumkA8S5MWm0kUdS?=
 =?us-ascii?Q?F7lp2ep0w0WpDXVNxKwZBlvox8ZQ2L4TG8mnMOJJX0qyokWWBh3CreO3g0ME?=
 =?us-ascii?Q?1kawjyR3LfyJXVWmAOmW7Zw4TDrSB65Hx4lPmc5J/II/RwGYttCgAywJDmCF?=
 =?us-ascii?Q?tx2LAn5kc3CVWA/iffh5tYahv+OuPakjyPSKdXYxhJEo113KUPlDW+DKFGao?=
 =?us-ascii?Q?9N+iChFQ1GSp9IiokDBS+xLnbnt/lV1SsHfMBraZJ/6y7iXWXx82LaIsr5L8?=
 =?us-ascii?Q?B9Voa3cmYjjyWxFJUVtjIeTNyzIMSwQjXC+FWVI66DbEZe1ZOKmh3h2K3Hs9?=
 =?us-ascii?Q?bGz0EAonXPeyTlmjHfbi9w8ZujRBXr/m1SC6PurP8/x31rI0flLuyQOvPPFx?=
 =?us-ascii?Q?+mvua6v5wDg6zT4rvTQq4QLLrCTv0hfeU4jPEEN3qUZoI1qZSZFbfRRQSVY5?=
 =?us-ascii?Q?d4qIGhlsoQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 44d41be3-dcce-4c53-4bc9-08df181d56c9
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 20:17:20.0664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8QnTc3j6LdoEQV12aPGkAvvN2PRVhdPQB09yrQIIF1Hw06a0AMckJ+fMXmRpl3de2I0ADZXN3N/GhqS2Xf8Z9AgbdRy2+DUAVTP5Rpd6lag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P189MB3314
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 20:17:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246350

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-31912
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/d3f358=
d3cffbe1ecb94d5284b3e81f052a0adcb9

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcap/libpcap/02-CVE-2026-31912.patch   | 525 ++++++++++++++++++
 .../libpcap/libpcap_1.10.4.bb                 |   1 +
 2 files changed, 526 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/02-CVE-2026-3=
1912.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/02-CVE-2026-31912.pa=
tch b/meta/recipes-connectivity/libpcap/libpcap/02-CVE-2026-31912.patch
new file mode 100644
index 0000000000..d9fda1ec48
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/02-CVE-2026-31912.patch
@@ -0,0 +1,525 @@
+From d3f358d3cffbe1ecb94d5284b3e81f052a0adcb9 Mon Sep 17 00:00:00 2001
+From: Denis Ovsienko <denis@ovsienko.info>
+Date: Thu, 30 Jul 2026 13:33:55 +0100
+Subject: [PATCH] CVE-2026-31912: Mind the program bounds in pcap_offline_f=
ilter().
+
+The current revision of pcapint_filter_with_aux_data() does not know the
+number of instructions in the filter program, it assumes the program
+counter always remains within the bounds of the provided filter program
+and always reaches a return instruction.  This holds for programs that
+have been generated or validated by libpcap.
+
+However, this does not necessarily hold for programs that come from an
+external source via pcap_offline_filter() or [deprecated] bpf_filter()
+and have not been explicitly validated.  If the interpreter executes
+such a program and advances the program counter beyond the last
+instruction, it will be interpreting memory space after the filter
+program as BPF instructions, which in the current implementation will
+eventually cause either abort() (another commit addresses that) or
+SIGSEGV.
+
+To fix the latter problem, in pcapint_filter_with_aux_data() add a
+parameter for the number of instructions in the program and reject the
+packet as soon as (or just before) the program counter goes out of
+bounds.  Update all incoming code paths to specify the length; also in
+pcap_offline_filter(3PCAP) make it clear the function now requires the
+'bf_len' member to be set correctly and uses it.
+
+(backported from commit d1209988c74dd9330659898d3b676ee6bbe1c551)
+
+(cherry picked from commit d3f358d3cffbe1ecb94d5284b3e81f052a0adcb9)
+
+Notes on backporting to 1.10.4:
+ - Adapted to the 1.10.4 pcap_filter*() names (renamed to pcapint_*()
+   after 1.10.4).
+ - The upstream CHANGES/changelog hunk is not backported.
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/co=
mmit/d3f358d3cffbe1ecb94d5284b3e81f052a0adcb9]
+CVE: CVE-2026-31912
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+diff --git a/bpf_filter.c b/bpf_filter.c
+index fa82d1d0..dec336ea 100644
+--- a/bpf_filter.c
++++ b/bpf_filter.c
+@@ -72,6 +72,24 @@ enum {
+         BPF_S_ANC_VLAN_TAG_PRESENT,
+ };
+=20
++/*
++ * Kernel BPF implementations tend to define BPF_MAXINSNS to 512 or 4096,=
 the
++ * userland interpreter in libpcap is meant to support much longer filter
++ * programs.  In the latter case it is important that BPF_MAXINSNS does n=
ot
++ * interfere with the safety checks in the validator and the interpreter:
++ *   (BPF_MAXINSNS + UINT8_MAX) * sizeof(struct bpf_insn) < UINT32_MAX
++ * It makes the most sense to be able to interpret as many instructions a=
s
++ * pcap_compile() can produce, without optimization, for a valid filter
++ * expression before it consumes as much memory as the current definition=
s of
++ * NCHUNKS and CHUNKSIZE() allow.  For some expressions this can be almos=
t
++ * 1.53 million instructions on a 64-bit machine and twice as many on a 3=
2-bit
++ * machine.
++ */
++#ifdef BPF_MAXINSNS
++#undef BPF_MAXINSNS
++#endif
++#define BPF_MAXINSNS 3060000U
++
+ /*
+  * Execute the filter program starting at pc on the packet p
+  * wirelen is the length of the original packet
+@@ -86,12 +104,14 @@ enum {
+  */
+ #if defined(SKF_AD_VLAN_TAG_PRESENT)
+ u_int
+-pcap_filter_with_aux_data(const struct bpf_insn *pc, const u_char *p,
+-    u_int wirelen, u_int buflen, const struct pcap_bpf_aux_data *aux_data=
)
++pcap_filter_with_aux_data(const struct bpf_insn *pc, const u_int proglen,
++    const u_char *p, const u_int wirelen, const u_int buflen,
++    const struct pcap_bpf_aux_data *aux_data)
+ #else
+ u_int
+-pcap_filter_with_aux_data(const struct bpf_insn *pc, const u_char *p,
+-    u_int wirelen, u_int buflen, const struct pcap_bpf_aux_data *aux_data=
 _U_)
++pcap_filter_with_aux_data(const struct bpf_insn *pc, const u_int proglen,
++    const u_char *p, const u_int wirelen, const u_int buflen,
++    const struct pcap_bpf_aux_data *aux_data _U_)
+ #endif
+ {
+ 	register uint32_t A, X;
+@@ -101,13 +121,36 @@ pcap_filter_with_aux_data(const struct bpf_insn *pc,=
 const u_char *p,
+ 	if (pc =3D=3D 0)
+ 		/*
+ 		 * No filter means accept all.
++		 * In this case the value of 'proglen' is irrelevant.
+ 		 */
+ 		return (u_int)-1;
++	if (proglen < 1 || proglen > BPF_MAXINSNS)
++		return 0;
++
++	/*
++	 * Require the current instruction pointer not to overflow for both the
++	 * filter program (where the pointer will be dereferenced) and an
++	 * immediately following margin (where it will be not).  So long as the
++	 * margin is large enough to represent the destination of any single
++	 * conditional [forward] jump from within the filter program, a single
++	 * guard prevents all filter program over-read attempts that result
++	 * from the program running out of instructions before a BPF_RET or a
++	 * conditional jump directing the interpreter beyond the program end.
++	 * Unconditional jumps mean a larger problem space, which the BPF_JA
++	 * case below addresses separately.
++	 */
++	const struct bpf_insn *pcend =3D pc + proglen;
++	if (pcend + UINT8_MAX < pc)
++		return 0;
++
+ 	A =3D 0;
+ 	X =3D 0;
++	const struct bpf_insn *pc0 =3D pc;
+ 	--pc;
+ 	for (;;) {
+ 		++pc;
++		if (pc >=3D pcend)
++			return 0;
+ 		switch (pc->code) {
+=20
+ 		default:
+@@ -243,6 +286,40 @@ DIAG_ON_DEFAULT_ONLY_SWITCH
+ 			continue;
+=20
+ 		case BPF_JMP|BPF_JA:
++			/*
++			 * The pointer (pc) decrements and increments in units
++			 * of sizeof(struct bpf_insn) =3D=3D 8 bytes.  The number
++			 * of units is in the [INT32_MIN, INT32_MAX] interval,
++			 * hence the result can point before the beginning or
++			 * beyond the end of the filter program and can under-
++			 * or overflow; also on 32-bit architectures it can
++			 * under- or overflow more than once and can test
++			 * negative for underflow, overflow and out-of-range
++			 * conditions after under- or overflowing at least
++			 * once.
++			 *
++			 * However, it has been verified above that the program
++			 * length is sufficiently small and the pointer does
++			 * not wrap within the bounds of the filter program, so
++			 * there is a one-to-one correspondence between BPF
++			 * program counter values [0, proglen) and all valid
++			 * values of the pointer.  In other words, after this
++			 * unconditional jump the pointer arithmetic result
++			 * will be valid iff BPF program counter value will be
++			 * valid.  For the latter problem the solution is
++			 * almost the same as in the validator.
++			 *
++			 * The main difference is that here the current value
++			 * of BPF program counter is not a 32-bit unsigned
++			 * variable, but a ptrdiff_t expression, which is
++			 * 64-bit signed on 64-bit architectures and 32-bit
++			 * signed on 32-bit architectures.  However, the cast
++			 * to 32-bit unsigned is safe in both cases because:
++			 * pc0 <=3D pc < pc0 + proglen, therefore:
++			 * 0 <=3D pc - pc0 < proglen <=3D BPF_MAXINSNS < INT32_MAX
++			 */
++			if ((bpf_u_int32)(pc - pc0) + 1 + pc->k >=3D proglen)
++				return 0;
+ 			/*
+ 			 * XXX - we currently implement "ip6 protochain"
+ 			 * with backward jumps, so sign-extend pc->k.
+@@ -396,10 +473,10 @@ DIAG_ON_DEFAULT_ONLY_SWITCH
+ }
+=20
+ u_int
+-pcap_filter(const struct bpf_insn *pc, const u_char *p, u_int wirelen,
+-    u_int buflen)
++pcap_filter(const struct bpf_insn *pc, const u_int proglen, const u_char =
*p,
++    u_int wirelen, u_int buflen)
+ {
+-	return pcap_filter_with_aux_data(pc, p, wirelen, buflen, NULL);
++	return pcap_filter_with_aux_data(pc, proglen, p, wirelen, buflen, NULL);
+ }
+=20
+ /*
+@@ -419,7 +496,7 @@ pcap_validate_filter(const struct bpf_insn *f, int len=
)
+ 	u_int i, from;
+ 	const struct bpf_insn *p;
+=20
+-	if (len < 1)
++	if (len < 1 || (u_int)len > BPF_MAXINSNS || f + len < f)
+ 		return 0;
+=20
+ 	for (i =3D 0; i < (u_int)len; ++i) {
+@@ -485,33 +562,45 @@ pcap_validate_filter(const struct bpf_insn *f, int l=
en)
+ 		case BPF_JMP:
+ 			/*
+ 			 * Check that jumps are within the code block,
+-			 * and that unconditional branches don't go
+-			 * backwards as a result of an overflow.
++			 * regardless of the direction.  libpcap uses
++			 * backward jumps to implement the "protochain"
++			 * primitive.  All offsets that mean a backward
++			 * jump in libpcap (whether in-range or not) in
++			 * kernel BPF implementations mean out-of-range
++			 * or overflow forward jumps -- kernel
++			 * implementations must reject that.
++			 *
+ 			 * Unconditional branches have a 32-bit offset,
+ 			 * so they could overflow; we check to make
+ 			 * sure they don't.  Conditional branches have
+ 			 * an 8-bit offset, and the from address is <=3D
+-			 * BPF_MAXINSNS, and we assume that BPF_MAXINSNS
++			 * BPF_MAXINSNS, and we know that BPF_MAXINSNS
+ 			 * is sufficiently small that adding 255 to it
+ 			 * won't overflow.
+ 			 *
+ 			 * We know that len is <=3D BPF_MAXINSNS, and we
+-			 * assume that BPF_MAXINSNS is < the maximum size
++			 * know that BPF_MAXINSNS is < the maximum value
+ 			 * of a u_int, so that i + 1 doesn't overflow.
+-			 *
+-			 * For userland, we don't know that the from
+-			 * or len are <=3D BPF_MAXINSNS, but we know that
+-			 * from <=3D len, and, except on a 64-bit system,
+-			 * it's unlikely that len, if it truly reflects
+-			 * the size of the program we've been handed,
+-			 * will be anywhere near the maximum size of
+-			 * a u_int.  We also don't check for backward
+-			 * branches, as we currently support them in
+-			 * userland for the protochain operation.
+ 			 */
+ 			from =3D i + 1;
+ 			switch (BPF_OP(p->code)) {
+ 			case BPF_JA:
++				/*
++				 * So long as both 'from' and bpf_insn.k are
++				 * 32-bit unsigned, this check rejects any jump
++				 * offset that points outside of the valid BPF
++				 * address space of the filter program no
++				 * matter whether signed interpretation of the
++				 * offset is positive or negative.
++				 *
++				 * Note that this condition is necessary, but
++				 * not sufficient to get correct results from
++				 * respective pointer arithmetic in the process
++				 * address space.  Other necessary conditions
++				 * are that BPF_MAXINSNS is correctly defined
++				 * and enforced, and that the pointer does not
++				 * overflow.
++				 */
+ 				if (from + p->k >=3D (u_int)len)
+ 					return 0;
+ 				break;
+@@ -539,12 +628,14 @@ pcap_validate_filter(const struct bpf_insn *f, int l=
en)
+=20
+ /*
+  * Exported because older versions of libpcap exported them.
++ * This function is deprecated and unsafe, use pcap_offline_filter() inst=
ead.
+  */
+ u_int
+ bpf_filter(const struct bpf_insn *pc, const u_char *p, u_int wirelen,
+     u_int buflen)
+ {
+-	return pcap_filter(pc, p, wirelen, buflen);
++	// The actual length of the filter program is not known.
++	return pcap_filter(pc, BPF_MAXINSNS, p, wirelen, buflen);
+ }
+=20
+ int
+diff --git a/dlpisubs.c b/dlpisubs.c
+index 6815b0ec..790acf28 100644
+--- a/dlpisubs.c
++++ b/dlpisubs.c
+@@ -195,7 +195,8 @@ pcap_process_pkts(pcap_t *p, pcap_handler callback, u_=
char *user,
+ 		bufp +=3D caplen;
+ #endif
+ 		++pd->stat.ps_recv;
+-		if (pcap_filter(p->fcode.bf_insns, pk, origlen, caplen)) {
++		if (pcap_filter(p->fcode.bf_insns, p->fcode.bf_len,
++		                   pk, origlen, caplen)) {
+ #ifdef HAVE_SYS_BUFMOD_H
+ 			pkthdr.ts.tv_sec =3D sbp->sbh_timestamp.tv_sec;
+ 			pkthdr.ts.tv_usec =3D sbp->sbh_timestamp.tv_usec;
+diff --git a/pcap-bpf.c b/pcap-bpf.c
+index 2898e598..04b5620d 100644
+--- a/pcap-bpf.c
++++ b/pcap-bpf.c
+@@ -1255,7 +1255,8 @@ pcap_read_bpf(pcap_t *p, int cnt, pcap_handler callb=
ack, u_char *user)
+ #endif
+ 		 */
+ 		if (pb->filtering_in_kernel ||
+-		    pcap_filter(p->fcode.bf_insns, datap, bhp->bh_datalen, caplen)) {
++		    pcap_filter(p->fcode.bf_insns, p->fcode.bf_len,
++		                   datap, bhp->bh_datalen, caplen)) {
+ 			struct pcap_pkthdr pkthdr;
+ #ifdef BIOCSTSTAMP
+ 			struct bintime bt;
+diff --git a/pcap-bt-linux.c b/pcap-bt-linux.c
+index c7bfef1d..dcf3b575 100644
+--- a/pcap-bt-linux.c
++++ b/pcap-bt-linux.c
+@@ -394,7 +394,8 @@ bt_read_linux(pcap_t *handle, int max_packets _U_, pca=
p_handler callback, u_char
+ 	pkth.caplen+=3Dsizeof(pcap_bluetooth_h4_header);
+ 	pkth.len =3D pkth.caplen;
+ 	if (handle->fcode.bf_insns =3D=3D NULL ||
+-	    pcap_filter(handle->fcode.bf_insns, pktd, pkth.len, pkth.caplen)) {
++	    pcap_filter(handle->fcode.bf_insns, handle->fcode.bf_len,
++	                   pktd, pkth.len, pkth.caplen)) {
+ 		callback(user, &pkth, pktd);
+ 		return 1;
+ 	}
+diff --git a/pcap-bt-monitor-linux.c b/pcap-bt-monitor-linux.c
+index 206e65b5..3f9d5b49 100644
+--- a/pcap-bt-monitor-linux.c
++++ b/pcap-bt-monitor-linux.c
+@@ -151,7 +151,8 @@ bt_monitor_read(pcap_t *handle, int max_packets _U_, p=
cap_handler callback, u_ch
+     bthdr->opcode =3D htons(hdr.opcode);
+=20
+     if (handle->fcode.bf_insns =3D=3D NULL ||
+-        pcap_filter(handle->fcode.bf_insns, pktd, pkth.len, pkth.caplen))=
 {
++        pcap_filter(handle->fcode.bf_insns, handle->fcode.bf_len,
++                       pktd, pkth.len, pkth.caplen)) {
+         callback(user, &pkth, pktd);
+         return 1;
+     }
+diff --git a/pcap-dag.c b/pcap-dag.c
+index f261ead0..c3fe1dbd 100644
+--- a/pcap-dag.c
++++ b/pcap-dag.c
+@@ -668,8 +668,9 @@ dag_read(pcap_t *p, int cnt, pcap_handler callback, u_=
char *user)
+ 			caplen =3D p->snapshot;
+=20
+ 		/* Run the packet filter if there is one. */
+-		if ((p->fcode.bf_insns =3D=3D NULL) || pcap_filter(p->fcode.bf_insns, d=
p, packet_len, caplen)) {
+-
++		if (p->fcode.bf_insns =3D=3D NULL ||
++		    pcap_filter(p->fcode.bf_insns, p->fcode.bf_len,
++		                   dp, packet_len, caplen)) {
+ 			/* convert between timestamp formats */
+ 			register unsigned long long ts;
+=20
+diff --git a/pcap-dbus.c b/pcap-dbus.c
+index 506f150f..760bb9ba 100644
+--- a/pcap-dbus.c
++++ b/pcap-dbus.c
+@@ -91,7 +91,8 @@ dbus_read(pcap_t *handle, int max_packets _U_, pcap_hand=
ler callback, u_char *us
+=20
+ 		gettimeofday(&pkth.ts, NULL);
+ 		if (handle->fcode.bf_insns =3D=3D NULL ||
+-		    pcap_filter(handle->fcode.bf_insns, (u_char *)raw_msg, pkth.len, pk=
th.caplen)) {
++		    pcap_filter(handle->fcode.bf_insns, handle->fcode.bf_len,
++		                   (u_char *)raw_msg, pkth.len, pkth.caplen)) {
+ 			handlep->packets_read++;
+ 			callback(user, &pkth, (u_char *)raw_msg);
+ 			count++;
+diff --git a/pcap-dpdk.c b/pcap-dpdk.c
+index 025a6748..cc31d2f2 100644
+--- a/pcap-dpdk.c
++++ b/pcap-dpdk.c
+@@ -407,7 +407,9 @@ static int pcap_dpdk_dispatch(pcap_t *p, int max_cnt, =
pcap_handler cb, u_char *c
+=20
+ 			}
+ 			if (bp){
+-				if (p->fcode.bf_insns=3D=3DNULL || pcap_filter(p->fcode.bf_insns, bp,=
 pcap_header.len, pcap_header.caplen)){
++				if (p->fcode.bf_insns=3D=3DNULL ||
++				    pcap_filter(p->fcode.bf_insns, p->fcode.bf_len,
++				                   bp, pcap_header.len, pcap_header.caplen)){
+ 					cb(cb_arg, &pcap_header, bp);
+ 				}else{
+ 					pd->bpf_drop++;
+diff --git a/pcap-int.h b/pcap-int.h
+index 894e74af..11ca3c56 100644
+--- a/pcap-int.h
++++ b/pcap-int.h
+@@ -619,13 +619,15 @@ struct pcap_bpf_aux_data {
+  * Filtering routine that takes the auxiliary data as an additional
+  * argument.
+  */
+-u_int	pcap_filter_with_aux_data(const struct bpf_insn *,
+-    const u_char *, u_int, u_int, const struct pcap_bpf_aux_data *);
++u_int	pcap_filter_with_aux_data(const struct bpf_insn *, const u_int,
++    const u_char *, const u_int, const u_int,
++    const struct pcap_bpf_aux_data *);
+=20
+ /*
+  * Filtering routine that doesn't.
+  */
+-u_int	pcap_filter(const struct bpf_insn *, const u_char *, u_int, u_int);
++u_int	pcap_filter(const struct bpf_insn *, const u_int, const u_char *,
++    u_int, u_int);
+=20
+ /*
+  * Routine to validate a BPF program.
+diff --git a/pcap-linux.c b/pcap-linux.c
+index 13bd8529..b2b2ca70 100644
+--- a/pcap-linux.c
++++ b/pcap-linux.c
+@@ -3993,6 +3993,7 @@ static int pcap_handle_packet_mmap(
+ 		aux_data.vlan_tag =3D tp_vlan_tci & 0x0fff;
+=20
+ 		if (pcap_filter_with_aux_data(handle->fcode.bf_insns,
++					      handle->fcode.bf_len,
+ 					      bp,
+ 					      tp_len,
+ 					      snaplen,
+diff --git a/pcap-netfilter-linux.c b/pcap-netfilter-linux.c
+index 2eb0fc8c..5b5f5c18 100644
+--- a/pcap-netfilter-linux.c
++++ b/pcap-netfilter-linux.c
+@@ -259,8 +259,8 @@ netfilter_read_linux(pcap_t *handle, int max_packets, =
pcap_handler callback, u_c
+=20
+ 				gettimeofday(&pkth.ts, NULL);
+ 				if (handle->fcode.bf_insns =3D=3D NULL ||
+-						pcap_filter(handle->fcode.bf_insns, payload, pkth.len, pkth.caplen)=
)
+-				{
++				    pcap_filter(handle->fcode.bf_insns, handle->fcode.bf_len,
++				                   payload, pkth.len, pkth.caplen)) {
+ 					handlep->packets_read++;
+ 					callback(user, &pkth, payload);
+ 					count++;
+diff --git a/pcap-netmap.c b/pcap-netmap.c
+index 27d36e5b..bcfd6e93 100644
+--- a/pcap-netmap.c
++++ b/pcap-netmap.c
+@@ -81,7 +81,8 @@ pcap_netmap_filter(u_char *arg, struct pcap_pkthdr *h, c=
onst u_char *buf)
+ 	const struct bpf_insn *pc =3D p->fcode.bf_insns;
+=20
+ 	++pn->rx_pkts;
+-	if (pc =3D=3D NULL || pcap_filter(pc, buf, h->len, h->caplen))
++	if (pc =3D=3D NULL ||
++	    pcap_filter(pc, p->fcode.bf_len, buf, h->len, h->caplen))
+ 		pn->cb(pn->cb_arg, h, buf);
+ }
+=20
+diff --git a/pcap-npf.c b/pcap-npf.c
+index 99b5981e..a4364353 100644
+--- a/pcap-npf.c
++++ b/pcap-npf.c
+@@ -682,7 +682,8 @@ pcap_read_npf(pcap_t *p, int cnt, pcap_handler callbac=
k, u_char *user)
+ 		 */
+ 		if (pw->filtering_in_kernel ||
+ 		    p->fcode.bf_insns =3D=3D NULL ||
+-		    pcap_filter(p->fcode.bf_insns, datap, bhp->bh_datalen, caplen)) {
++		    pcap_filter(p->fcode.bf_insns, p->fcode.bf_len,
++		                   datap, bhp->bh_datalen, caplen)) {
+ #ifdef ENABLE_REMOTE
+ 			switch (p->rmt_samp.method) {
+=20
+diff --git a/pcap-rdmasniff.c b/pcap-rdmasniff.c
+index d63ca898..c8763b33 100644
+--- a/pcap-rdmasniff.c
++++ b/pcap-rdmasniff.c
+@@ -172,7 +172,8 @@ rdmasniff_read(pcap_t *handle, int max_packets, pcap_h=
andler callback, u_char *u
+ 		pktd =3D (u_char *) handle->buffer + wc.wr_id * RDMASNIFF_RECEIVE_SIZE;
+=20
+ 		if (handle->fcode.bf_insns =3D=3D NULL ||
+-		    pcap_filter(handle->fcode.bf_insns, pktd, pkth.len, pkth.caplen)) {
++		    pcap_filter(handle->fcode.bf_insns, handle->fcode.bf_len,
++		                   pktd, pkth.len, pkth.caplen)) {
+ 			callback(user, &pkth, pktd);
+ 			++priv->packets_recv;
+ 			++count;
+diff --git a/pcap-snf.c b/pcap-snf.c
+index fe9cc9c8..16ce9c8e 100644
+--- a/pcap-snf.c
++++ b/pcap-snf.c
+@@ -192,7 +192,8 @@ snf_read(pcap_t *p, int cnt, pcap_handler callback, u_=
char *user)
+ 			caplen =3D p->snapshot;
+=20
+ 		if ((p->fcode.bf_insns =3D=3D NULL) ||
+-		     pcap_filter(p->fcode.bf_insns, req.pkt_addr, req.length, caplen)) =
{
++		     pcap_filter(p->fcode.bf_insns, p->fcode.bf_len,
++		                 req.pkt_addr, req.length, caplen)) {
+ 			hdr.ts =3D snf_timestamp_to_timeval(req.timestamp, p->opt.tstamp_preci=
sion);
+ 			hdr.caplen =3D caplen;
+ 			hdr.len =3D req.length;
+diff --git a/pcap-usb-linux.c b/pcap-usb-linux.c
+index 726e4a8a..44b2bf30 100644
+--- a/pcap-usb-linux.c
++++ b/pcap-usb-linux.c
+@@ -735,8 +735,8 @@ usb_read_linux_bin(pcap_t *handle, int max_packets _U_=
, pcap_handler callback, u
+ 	pkth.ts.tv_usec =3D info.hdr->ts_usec;
+=20
+ 	if (handle->fcode.bf_insns =3D=3D NULL ||
+-	    pcap_filter(handle->fcode.bf_insns, handle->buffer,
+-	      pkth.len, pkth.caplen)) {
++	    pcap_filter(handle->fcode.bf_insns, handle->fcode.bf_len,
++	                   handle->buffer, pkth.len, pkth.caplen)) {
+ 		handlep->packets_read++;
+ 		callback(user, &pkth, handle->buffer);
+ 		return 1;
+@@ -904,8 +904,8 @@ usb_read_linux_mmap(pcap_t *handle, int max_packets, p=
cap_handler callback, u_ch
+ 			pkth.ts.tv_usec =3D hdr->ts_usec;
+=20
+ 			if (handle->fcode.bf_insns =3D=3D NULL ||
+-			    pcap_filter(handle->fcode.bf_insns, (u_char*) hdr,
+-			      pkth.len, pkth.caplen)) {
++			    pcap_filter(handle->fcode.bf_insns, handle->fcode.bf_len,
++			                   (u_char*) hdr, pkth.len, pkth.caplen)) {
+ 				handlep->packets_read++;
+ 				callback(user, &pkth, (u_char*) hdr);
+ 				packets++;
+diff --git a/pcap.c b/pcap.c
+index ef1bbb71..9ee83f98 100644
+--- a/pcap.c
++++ b/pcap.c
+@@ -4179,7 +4179,7 @@ pcap_offline_filter(const struct bpf_program *fp, co=
nst struct pcap_pkthdr *h,
+ 	const struct bpf_insn *fcode =3D fp->bf_insns;
+=20
+ 	if (fcode !=3D NULL)
+-		return (pcap_filter(fcode, pkt, h->len, h->caplen));
++		return (pcap_filter(fcode, fp->bf_len, pkt, h->len, h->caplen));
+ 	else
+ 		return (0);
+ }
+diff --git a/savefile.c b/savefile.c
+index db8a3aa0..e9708b23 100644
+--- a/savefile.c
++++ b/savefile.c
+@@ -687,7 +687,8 @@ pcap_offline_read(pcap_t *p, int cnt, pcap_handler cal=
lback, u_char *user)
+ 		 * and, if it passes, process it.
+ 		 */
+ 		if ((fcode =3D p->fcode.bf_insns) =3D=3D NULL ||
+-		    pcap_filter(fcode, data, h.len, h.caplen)) {
++		    pcap_filter(fcode, p->fcode.bf_len,
++		                   data, h.len, h.caplen)) {
+ 			(*callback)(user, &h, data);
+ 			n++;	/* count the packet */
+ 			if (n >=3D cnt)
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb b/meta/rec=
ipes-connectivity/libpcap/libpcap_1.10.4.bb
index 692fdf606c..323cca3d98 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
@@ -18,6 +18,7 @@ SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.gz=
 \
            file://CVE-2025-11961-02.patch \
            file://CVE-2025-11964.patch \
            file://01-CVE-2026-0799.patch \
+           file://02-CVE-2026-31912.patch \
           "
=20
 SRC_URI[sha256sum] =3D "ed19a0383fad72e3ad435fd239d7cd80d64916b87269550159=
d20e47160ebe5f"

