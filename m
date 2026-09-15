Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B059C982C9
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:16:43 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4960.1789499791346222233
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 12:16:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=s2FLsF8M;
 spf=pass (domain: est.tech, ip: 52.101.65.29, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+86am9IONGupCW0YMDXYcD2CV4sUYeTNJobeeaMuaSBPKAnzoqWyaboVN5ahK02+ikxZsHyRF8cePKdMfmbjmTx4KWai77lq8ZwM78Och0+xowdx8QlD+V6QgVvgFWttwkmuyySTQbAngg89CvdUUeJpHMX8cb1hEn5X1tumrecprE5GWBA5lELa2GKVszPRcpk7jAdXWBWFjilQB8D5M5kinEeudvx7UWjQ6R77crIyaValxFRxpHi4caM12HnNeRx60ZAoWTdtHnyZkV+q5CG46YlkN6tTZRxcpVOEGEbnbH4U5+KL+FwzH0MkuKvVEXNgkBnL7XxZRtvnAGkbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfrGBmCBoUz8N6ra63tYN37ew1DOenu7EKyE7gvIaHc=;
 b=t9yeAlU1Q3B+euAc8RcCbaN1zXrN6ea/rMXJunLE2K+xxz+nbLfjmnhLuyg9yvtn9w5SYPK/r6oCCDmj3Ye13EV2TQUMsplzlGT7pbeWpXQxGwR9kxC0MXd8B0a5AmTwCKBBriPC1c1ZwuhkK7WEPr6YZX9YDgxJwEO92NLqXQSukm5ZpaR2ydrxVtkKyX42him2LE3E9Oz/CJ26TLZ9yJUXyBYd7DLsMUPOTyvBYjCwIfuxY01W+zzqSo4Ce6SXl8mA1ViVJ5+D7yJnAJdxdT89EQzGkxqGrqXhnYJnokb+u1IfKZJKEG4ASmo21yQbqAPGMuo4Smpj9ucoOrMPIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfrGBmCBoUz8N6ra63tYN37ew1DOenu7EKyE7gvIaHc=;
 b=s2FLsF8Ma869GW4ZKSY2uAAt6l7XwGyVi5l4E2niz/6j5Gc7F3Z5kRl1yUZl7YrpYT3XkDZcTk0Qd0+zCTIbMIaWhj0N+syUYeWOGwWAonzXvQ8w8DRaBvZHtoskltS8sTdjIejDrs7Xciri2ZA9qBWgFRz8Qt9biOdm7GzntGiJlMpq/gF5+Oz1BQTNIs51ZUW/WBMtuPK5Y7yVRrTt/wf9HzLNUeEIKeTOz13ujvYW+mz9krkDuUcB6YTpVhLHvkMBxhSnmlTot/Zo5P7rc3BEGknTZ5OxhhZ1nIJfsjpNXeQjuPuZkyXl+jP4fvJPNnwepAC5rk35nvyD8XVW6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM7PPFCA14042DD.EURP189.PROD.OUTLOOK.COM (2603:10a6:20f:fff1::6a8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 19:16:29 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 19:16:29 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v2 2/7] libpcap: Fix CVE-2026-31912
Date: Tue, 15 Sep 2026 21:16:18 +0200
Message-ID: <20260915191623.42107-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260915191623.42107-1-jaipaul.cheernam@est.tech>
References: <20260910051154.30595-2-jaipaul.cheernam@est.tech>
 <20260915191623.42107-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0158.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::13) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM7PPFCA14042DD:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e170de0-76c0-4c06-8f07-08df135dd885
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|6133799003|12006099003|18002099003|22082099003|13003099007|3023799007|10067099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: 
	oj3GWQoBPZQTwvz0xEaQyWUSzI1YL9SwVt5yca0nmM+WeratfX8kIk6MPpe8yNSmPaCbw80h8uLnew97+9/1Wa53ScJDGuetYwl/JGuUgxZ2JfeX/jbvxzi/XMC/z7+5gqLvcmfKAt4PhhwTb9AMdjAsfE4vPlu3SRHEkqDBhxeTNf8+B1ihKTg6yX5uR6Is1mxRHyOnUTZ7fqbjdgIfaQT/HD0JVYAZb7iCZQHkrlBu83L/Y/UMuMK+CIueznZEfUMvt0jWjiOpjwbjdm65hKuseDeAjrhoSQbmdvO3LhflP+ey7fbtVOSkr34cPTXVZJrHps3SQ1N0iDs5XaGX+lYk7G3zZeS4lCFvHqm0FeS1FoDHVeh/Nzs00moyto1bhlqibqHM0dce9YHYKTrzClxSqpBgN8vZ1q5D49OCEF8otbc4/2to41Z4lA2GWnn3xwTb5plJWHwf3LwtYcWVYZoYbfMkttbeG2/zyc8dbqBnAwuq2Y/TOb3med0GIrI5puYEfaBLGeSMW/FNi14D6H7QF52zmyN8iW591wdzg9IBNpIheaDo0MulFur2fighXdm6Yu7Za9Yhn3ctgDk+lGRaq+XfZeKP35JuQ1LIlSP1rQEoyrzAxdPeL9U48wUt
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(12006099003)(18002099003)(22082099003)(13003099007)(3023799007)(10067099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jdEad6Gi8vvy0sa6YQscTTQjrKhuapv/4v16kunVf8lJaE0vvWTu6AF0lJeE?=
 =?us-ascii?Q?/yQuAyBwfv2dHLgogUxMr6C42CoMCPiD8tmW4m9kovicyZYf62331I/m7zld?=
 =?us-ascii?Q?ZRTKI9SL1BQeBsBMTKIGOLbk4gAjcyePl07BlwbhKhpFOzdXRFKmPj0ZnU2z?=
 =?us-ascii?Q?FWMym0v4GpWmh3KMGnC67kMS9B+7sRG7nWeL8U/l22OWTMfikZSOMb6gStXl?=
 =?us-ascii?Q?sjm9f7d+vecVFg4Wv/KfZwpd9x/ydsAB+leAF1XX57XErP0sDBg6iEEFtizE?=
 =?us-ascii?Q?SRD2hTcd2Lyf8bewcSelABWMrFegofTagsdz5YBExJGMeSI2dAnQSy90DxNA?=
 =?us-ascii?Q?as0Y4jsSp0xNPcu8eH/odM//jFyW802mOvuP1JNbM1yS2Ile4TWE7KIep5Ls?=
 =?us-ascii?Q?U+CIJOp5+05ycuSbM54p8dqKchFwTI73CFigYuOqszBdH8I6JVvbaXiKgYul?=
 =?us-ascii?Q?6HtZrWfbvFsW+R4gLPt3++igB71RSxZ8fGxB3aOOj0JsyQ0NuPylmA/mRzO6?=
 =?us-ascii?Q?FlUwHFmRACX78p3Ud7awWwEn7kShXQbPzJCKxQ6o6xVaQXp8dA/erUzAjn+L?=
 =?us-ascii?Q?TQSBbDQw/B/uIagRbj3iiOsdEMxyU+5t+534SAdCEPvAU3ieeaZ/R3WDFrXq?=
 =?us-ascii?Q?g/LbkfUHJbccbUiTaMETBuUeORoZNDIm8BlLIIMya8z92bmiqri3oJ49fLPK?=
 =?us-ascii?Q?teRFlg5Vi5SQjD+slCmUkoiSodSK0NFeMALXoBK0OdKER6EAJEMU1unCNI1R?=
 =?us-ascii?Q?h3j09kt+ogj/C4rXpuwaQ6kcCJJqRSKYouYFbTKTalgCpSHsupTVUQL59HaO?=
 =?us-ascii?Q?u1G1pVFDNDlQiB83AQECFYM0Yyiifj84WaP19EXTdH27uzRZXvhJjGGDCJ8B?=
 =?us-ascii?Q?OopC7eHNWujI6BiU/lGYWKM8oXlllPY+zEBn0o0cJCCBfxwsMFYCR1lzMzvB?=
 =?us-ascii?Q?eFJ3/eRWcndXwq8nVJ3B5OLxIC203L0lbshYAHBxW9uCr1gFgAKmgcRZ0s/d?=
 =?us-ascii?Q?aiFaY4bhRPkBtr21AdBRXfebONqozsgrNdwPZ/VTK6NpPu00Cd5lYthoaeyn?=
 =?us-ascii?Q?Wt0vC124NAr/KLW25QWWuoHUMVqJLX0y2ToyXWnwof61o3+6bm4X6taGfj24?=
 =?us-ascii?Q?2vKM8bs1hEaf9czxcz5NjR6ewFwgst9fcpxBGZMOOhC5Ao3Tf7SoviCGwVcu?=
 =?us-ascii?Q?G+Dq0uIb8mhbetbLuwzhtouJeLuuvCDUoYXkfviBrwUelTu7HUvx4bUklQl9?=
 =?us-ascii?Q?V2h63kSs25o/O3LCzUzvK3UNNDckulRnXCcbBY5vYuS9FZUOYEqN5NW6iTDw?=
 =?us-ascii?Q?DXsr57daTKp/MzazuT4+7DhNrKeC/H5m0vZFxkp0fJKKQ3oWnG9gE0ZgJ0vF?=
 =?us-ascii?Q?QuUQZ1ur8CyqZNsZLeHmr2G31A2E5RXzU4nF4cxuSjWUVwXwfssV4sI00h67?=
 =?us-ascii?Q?XVpEn3rej1tsjENsySal209Ym0bG+wf/uo7NurBPOcSg+3kJReV3uY7zo/yR?=
 =?us-ascii?Q?ICokIAFmaZnnHs7mk3z00K/1OQeG8tQkXMWdTBhWg31Va6kLsGEIzBCEqU06?=
 =?us-ascii?Q?ojuk5rgJrXondeqI6pVRWdm1AxFXgar8nDwyZeGh1zhOIBwWVLJorLkv8rco?=
 =?us-ascii?Q?6NNI91BkSg2qGsUK2fLzs/EytQYupeuuVVM7N+Pm4JKNsgrGLORTjt3Iy6Ds?=
 =?us-ascii?Q?HOsxhJVAAFlof8BqAzS1xhyvyJBkbYLJUaAJogz0MgfJ/XPF4Wk7n8/yvz0y?=
 =?us-ascii?Q?uMHNGH3rOQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e170de0-76c0-4c06-8f07-08df135dd885
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 19:16:29.6989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 78H2tSVugtmDlk/aBXj2O04koXPzdnp1AVUpv1ZvP0fh5Lmu5FnGASTn4zPyz31o3B8/fgXo5iJ4N1+8Nil4Nez2PD7JUakC6nhM1MAxbII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PPFCA14042DD
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 19:16:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245869

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-31912
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/d3f358=
d3cffbe1ecb94d5284b3e81f052a0adcb9
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcap/libpcap/02-CVE-2026-31912.patch   | 597 ++++++++++++++++++
 .../libpcap/libpcap_1.10.6.bb                 |   1 +
 2 files changed, 598 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/02-CVE-2026-3=
1912.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/02-CVE-2026-31912.pa=
tch b/meta/recipes-connectivity/libpcap/libpcap/02-CVE-2026-31912.patch
new file mode 100644
index 0000000000..ceae734ff7
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/02-CVE-2026-31912.patch
@@ -0,0 +1,597 @@
+From 09e04074ddfbca5fa33693c6e2d4f01a74857f65 Mon Sep 17 00:00:00 2001
+From: Denis Ovsienko <denis@ovsienko.info>
+Date: Thu, 30 Jul 2026 13:33:55 +0100
+Subject: [PATCH] CVE-2026-31912: Mind the program bounds in
+ pcap_offline_filter().
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
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/co=
mmit/d3f358d3cffbe1ecb94d5284b3e81f052a0adcb9]
+CVE: CVE-2026-31912
+
+Notes on backporting to 1.10.6:
+ - Adjusted the pcapint_filter() call sites in pcap-dag.c, pcap-netmap.c a=
nd
+   pcap-snf.c to the 1.10.6 code base.  In 1.10.7 these were already touch=
ed by
+   the unrelated "low snaplen" fixes (commits d5192db3, fb87fdeb, b0caefe8=
),
+   which are not part of this CVE and are not backported here; only the ne=
w
+   bf_len argument is added to each call.
+ - In bpf_filter.c the scratch-memory-store zero-initialisation and the re=
moval
+   of the stray BPF_S_ANC_* enum (1.10.7-only cleanups) are not present in
+   1.10.6, so only the new pc0 declaration and bounds checks from this com=
mit
+   are added.
+ - The upstream CHANGES/changelog hunk is not backported.
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+diff --git a/bpf_filter.c b/bpf_filter.c
+index 510dbd9c..4f9adeea 100644
+--- a/bpf_filter.c
++++ b/bpf_filter.c
+@@ -70,6 +70,24 @@ enum {
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
+@@ -84,12 +102,14 @@ enum {
+  */
+ #if defined(SKF_AD_VLAN_TAG_PRESENT)
+ u_int
+-pcapint_filter_with_aux_data(const struct bpf_insn *pc, const u_char *p,
+-    u_int wirelen, u_int buflen, const struct pcap_bpf_aux_data *aux_data=
)
++pcapint_filter_with_aux_data(const struct bpf_insn *pc, const u_int progl=
en,
++    const u_char *p, const u_int wirelen, const u_int buflen,
++    const struct pcap_bpf_aux_data *aux_data)
+ #else
+ u_int
+-pcapint_filter_with_aux_data(const struct bpf_insn *pc, const u_char *p,
+-    u_int wirelen, u_int buflen, const struct pcap_bpf_aux_data *aux_data=
 _U_)
++pcapint_filter_with_aux_data(const struct bpf_insn *pc, const u_int progl=
en,
++    const u_char *p, const u_int wirelen, const u_int buflen,
++    const struct pcap_bpf_aux_data *aux_data _U_)
+ #endif
+ {
+ 	register uint32_t A, X;
+@@ -99,13 +119,36 @@ pcapint_filter_with_aux_data(const struct bpf_insn *p=
c, const u_char *p,
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
+@@ -241,6 +284,40 @@ DIAG_ON_DEFAULT_ONLY_SWITCH
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
+@@ -394,10 +471,10 @@ DIAG_ON_DEFAULT_ONLY_SWITCH
+ }
+=20
+ u_int
+-pcapint_filter(const struct bpf_insn *pc, const u_char *p, u_int wirelen,
+-    u_int buflen)
++pcapint_filter(const struct bpf_insn *pc, const u_int proglen, const u_ch=
ar *p,
++    u_int wirelen, u_int buflen)
+ {
+-	return pcapint_filter_with_aux_data(pc, p, wirelen, buflen, NULL);
++	return pcapint_filter_with_aux_data(pc, proglen, p, wirelen, buflen, NUL=
L);
+ }
+=20
+ /*
+@@ -417,7 +494,7 @@ pcapint_validate_filter(const struct bpf_insn *f, int =
len)
+ 	u_int i, from;
+ 	const struct bpf_insn *p;
+=20
+-	if (len < 1)
++	if (len < 1 || (u_int)len > BPF_MAXINSNS || f + len < f)
+ 		return 0;
+=20
+ 	for (i =3D 0; i < (u_int)len; ++i) {
+@@ -483,33 +560,45 @@ pcapint_validate_filter(const struct bpf_insn *f, in=
t len)
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
+@@ -537,12 +626,14 @@ pcapint_validate_filter(const struct bpf_insn *f, in=
t len)
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
+-	return pcapint_filter(pc, p, wirelen, buflen);
++	// The actual length of the filter program is not known.
++	return pcapint_filter(pc, BPF_MAXINSNS, p, wirelen, buflen);
+ }
+=20
+ int
+diff --git a/dlpisubs.c b/dlpisubs.c
+index d4310de5..19934059 100644
+--- a/dlpisubs.c
++++ b/dlpisubs.c
+@@ -203,7 +203,8 @@ pcap_process_pkts(pcap_t *p, pcap_handler callback, u_=
char *user,
+ 		bufp +=3D caplen;
+ #endif
+ 		++pd->stat.ps_recv;
+-		if (pcapint_filter(p->fcode.bf_insns, pk, origlen, caplen)) {
++		if (pcapint_filter(p->fcode.bf_insns, p->fcode.bf_len,
++		                   pk, origlen, caplen)) {
+ #ifdef HAVE_SYS_BUFMOD_H
+ 			pkthdr.ts.tv_sec =3D sbp->sbh_timestamp.tv_sec;
+ 			pkthdr.ts.tv_usec =3D sbp->sbh_timestamp.tv_usec;
+diff --git a/pcap-bpf.c b/pcap-bpf.c
+index 49bb273d..13f83930 100644
+--- a/pcap-bpf.c
++++ b/pcap-bpf.c
+@@ -1372,7 +1372,8 @@ pcap_read_bpf(pcap_t *p, int cnt, pcap_handler callb=
ack, u_char *user)
+ #endif
+ 		 */
+ 		if (pb->filtering_in_kernel ||
+-		    pcapint_filter(p->fcode.bf_insns, datap, bhp->bh_datalen, caplen)) =
{
++		    pcapint_filter(p->fcode.bf_insns, p->fcode.bf_len,
++		                   datap, bhp->bh_datalen, caplen)) {
+ 			struct pcap_pkthdr pkthdr;
+ #ifdef BIOCSTSTAMP
+ 			struct bintime bt;
+diff --git a/pcap-bt-linux.c b/pcap-bt-linux.c
+index 2fc51665..9f464e70 100644
+--- a/pcap-bt-linux.c
++++ b/pcap-bt-linux.c
+@@ -396,7 +396,8 @@ DIAG_ON_SIGN_COMPARE
+ 	pkth.caplen+=3Dsizeof(pcap_bluetooth_h4_header);
+ 	pkth.len =3D pkth.caplen;
+ 	if (handle->fcode.bf_insns =3D=3D NULL ||
+-	    pcapint_filter(handle->fcode.bf_insns, pktd, pkth.len, pkth.caplen))=
 {
++	    pcapint_filter(handle->fcode.bf_insns, handle->fcode.bf_len,
++	                   pktd, pkth.len, pkth.caplen)) {
+ 		callback(user, &pkth, pktd);
+ 		return 1;
+ 	}
+diff --git a/pcap-bt-monitor-linux.c b/pcap-bt-monitor-linux.c
+index dfba8051..cfe52498 100644
+--- a/pcap-bt-monitor-linux.c
++++ b/pcap-bt-monitor-linux.c
+@@ -153,7 +153,8 @@ DIAG_ON_SIGN_COMPARE
+     bthdr->opcode =3D htons(hdr.opcode);
+=20
+     if (handle->fcode.bf_insns =3D=3D NULL ||
+-        pcapint_filter(handle->fcode.bf_insns, pktd, pkth.len, pkth.caple=
n)) {
++        pcapint_filter(handle->fcode.bf_insns, handle->fcode.bf_len,
++                       pktd, pkth.len, pkth.caplen)) {
+         callback(user, &pkth, pktd);
+         return 1;
+     }
+diff --git a/pcap-dag.c b/pcap-dag.c
+index 5ce15dd5..334a970c 100644
+--- a/pcap-dag.c
++++ b/pcap-dag.c
+@@ -666,7 +666,9 @@ dag_read(pcap_t *p, int cnt, pcap_handler callback, u_=
char *user)
+ 			caplen =3D p->snapshot;
+=20
+ 		/* Run the packet filter if there is one. */
+-		if ((p->fcode.bf_insns =3D=3D NULL) || pcapint_filter(p->fcode.bf_insns=
, dp, packet_len, caplen)) {
++		if ((p->fcode.bf_insns =3D=3D NULL) ||
++		    pcapint_filter(p->fcode.bf_insns, p->fcode.bf_len,
++		                   dp, packet_len, caplen)) {
+=20
+ 			/* convert between timestamp formats */
+ 			register unsigned long long ts;
+diff --git a/pcap-dbus.c b/pcap-dbus.c
+index d29fb81d..b0f30f6f 100644
+--- a/pcap-dbus.c
++++ b/pcap-dbus.c
+@@ -90,7 +90,8 @@ dbus_read(pcap_t *handle, int max_packets _U_, pcap_hand=
ler callback, u_char *us
+=20
+ 		gettimeofday(&pkth.ts, NULL);
+ 		if (handle->fcode.bf_insns =3D=3D NULL ||
+-		    pcapint_filter(handle->fcode.bf_insns, (u_char *)raw_msg, pkth.len,=
 pkth.caplen)) {
++		    pcapint_filter(handle->fcode.bf_insns, handle->fcode.bf_len,
++		                   (u_char *)raw_msg, pkth.len, pkth.caplen)) {
+ 			handlep->packets_read++;
+ 			callback(user, &pkth, (u_char *)raw_msg);
+ 			count++;
+diff --git a/pcap-dpdk.c b/pcap-dpdk.c
+index c78724e5..4fb8ffea 100644
+--- a/pcap-dpdk.c
++++ b/pcap-dpdk.c
+@@ -405,7 +405,9 @@ static int pcap_dpdk_dispatch(pcap_t *p, int max_cnt, =
pcap_handler cb, u_char *c
+=20
+ 			}
+ 			if (bp){
+-				if (p->fcode.bf_insns=3D=3DNULL || pcapint_filter(p->fcode.bf_insns, =
bp, pcap_header.len, pcap_header.caplen)){
++				if (p->fcode.bf_insns=3D=3DNULL ||
++				    pcapint_filter(p->fcode.bf_insns, p->fcode.bf_len,
++				                   bp, pcap_header.len, pcap_header.caplen)){
+ 					cb(cb_arg, &pcap_header, bp);
+ 				}else{
+ 					pd->bpf_drop++;
+diff --git a/pcap-haiku.c b/pcap-haiku.c
+index 609f585a..7b994fee 100644
+--- a/pcap-haiku.c
++++ b/pcap-haiku.c
+@@ -112,8 +112,8 @@ pcap_read_haiku(pcap_t* handle, int maxPackets _U_, pc=
ap_handler callback,
+ 	if (handle->fcode.bf_insns) {
+ 		// NB: pcapint_filter() takes the wire length and the captured
+ 		// length, not the snapshot length of the pcap_t handle.
+-		if (pcapint_filter(handle->fcode.bf_insns, buffer, wireLength,
+-		                   captureLength) =3D=3D 0)
++		if (pcapint_filter(handle->fcode.bf_insns, handle->fcode.bf_len,
++		                   buffer, wireLength, captureLength) =3D=3D 0)
+ 			goto drop;
+ 	}
+=20
+diff --git a/pcap-int.h b/pcap-int.h
+index ce0ac698..3d466946 100644
+--- a/pcap-int.h
++++ b/pcap-int.h
+@@ -579,13 +579,15 @@ struct pcap_bpf_aux_data {
+  * Filtering routine that takes the auxiliary data as an additional
+  * argument.
+  */
+-u_int	pcapint_filter_with_aux_data(const struct bpf_insn *,
+-    const u_char *, u_int, u_int, const struct pcap_bpf_aux_data *);
++u_int	pcapint_filter_with_aux_data(const struct bpf_insn *, const u_int,
++    const u_char *, const u_int, const u_int,
++    const struct pcap_bpf_aux_data *);
+=20
+ /*
+  * Filtering routine that doesn't.
+  */
+-u_int	pcapint_filter(const struct bpf_insn *, const u_char *, u_int, u_in=
t);
++u_int	pcapint_filter(const struct bpf_insn *, const u_int, const u_char *=
,
++    u_int, u_int);
+=20
+ /*
+  * Routine to validate a BPF program.
+diff --git a/pcap-linux.c b/pcap-linux.c
+index 20802e43..7e04a041 100644
+--- a/pcap-linux.c
++++ b/pcap-linux.c
+@@ -4279,6 +4279,7 @@ static int pcap_handle_packet_mmap(
+ 		aux_data.vlan_tag =3D tp_vlan_tci & 0x0fff;
+=20
+ 		if (pcapint_filter_with_aux_data(handle->fcode.bf_insns,
++					      handle->fcode.bf_len,
+ 					      bp,
+ 					      tp_len,
+ 					      snaplen,
+diff --git a/pcap-netfilter-linux.c b/pcap-netfilter-linux.c
+index 344bae47..ade53ea6 100644
+--- a/pcap-netfilter-linux.c
++++ b/pcap-netfilter-linux.c
+@@ -257,8 +257,8 @@ netfilter_read_linux(pcap_t *handle, int max_packets, =
pcap_handler callback, u_c
+=20
+ 				gettimeofday(&pkth.ts, NULL);
+ 				if (handle->fcode.bf_insns =3D=3D NULL ||
+-						pcapint_filter(handle->fcode.bf_insns, payload, pkth.len, pkth.capl=
en))
+-				{
++				    pcapint_filter(handle->fcode.bf_insns, handle->fcode.bf_len,
++				                   payload, pkth.len, pkth.caplen)) {
+ 					handlep->packets_read++;
+ 					callback(user, &pkth, payload);
+ 					count++;
+diff --git a/pcap-netmap.c b/pcap-netmap.c
+index f17f36ca..925f677f 100644
+--- a/pcap-netmap.c
++++ b/pcap-netmap.c
+@@ -79,7 +79,8 @@ pcap_netmap_filter(u_char *arg, struct pcap_pkthdr *h, c=
onst u_char *buf)
+ 	const struct bpf_insn *pc =3D p->fcode.bf_insns;
+=20
+ 	++pn->rx_pkts;
+-	if (pc =3D=3D NULL || pcapint_filter(pc, buf, h->len, h->caplen))
++	if (pc =3D=3D NULL ||
++	    pcapint_filter(pc, p->fcode.bf_len, buf, h->len, h->caplen))
+ 		pn->cb(pn->cb_arg, h, buf);
+ }
+=20
+diff --git a/pcap-npf.c b/pcap-npf.c
+index f638bd80..38e985bd 100644
+--- a/pcap-npf.c
++++ b/pcap-npf.c
+@@ -720,7 +720,8 @@ pcap_read_npf(pcap_t *p, int cnt, pcap_handler callbac=
k, u_char *user)
+ 		 */
+ 		if (pw->filtering_in_kernel ||
+ 		    p->fcode.bf_insns =3D=3D NULL ||
+-		    pcapint_filter(p->fcode.bf_insns, datap, bhp->bh_datalen, caplen)) =
{
++		    pcapint_filter(p->fcode.bf_insns, p->fcode.bf_len,
++		                   datap, bhp->bh_datalen, caplen)) {
+ #ifdef ENABLE_REMOTE
+ 			switch (p->rmt_samp.method) {
+=20
+diff --git a/pcap-rdmasniff.c b/pcap-rdmasniff.c
+index fd6d6fa6..5f15d4c5 100644
+--- a/pcap-rdmasniff.c
++++ b/pcap-rdmasniff.c
+@@ -170,7 +170,8 @@ rdmasniff_read(pcap_t *handle, int max_packets, pcap_h=
andler callback, u_char *u
+ 		pktd =3D (u_char *) handle->buffer + wc.wr_id * RDMASNIFF_RECEIVE_SIZE;
+=20
+ 		if (handle->fcode.bf_insns =3D=3D NULL ||
+-		    pcapint_filter(handle->fcode.bf_insns, pktd, pkth.len, pkth.caplen)=
) {
++		    pcapint_filter(handle->fcode.bf_insns, handle->fcode.bf_len,
++		                   pktd, pkth.len, pkth.caplen)) {
+ 			callback(user, &pkth, pktd);
+ 			++priv->packets_recv;
+ 			++count;
+diff --git a/pcap-snf.c b/pcap-snf.c
+index d08275ac..8a57eadd 100644
+--- a/pcap-snf.c
++++ b/pcap-snf.c
+@@ -190,7 +190,8 @@ snf_read(pcap_t *p, int cnt, pcap_handler callback, u_=
char *user)
+ 			caplen =3D p->snapshot;
+=20
+ 		if ((p->fcode.bf_insns =3D=3D NULL) ||
+-		     pcapint_filter(p->fcode.bf_insns, req.pkt_addr, req.length, caplen=
)) {
++		     pcapint_filter(p->fcode.bf_insns, p->fcode.bf_len,
++		                    req.pkt_addr, req.length, caplen)) {
+ 			hdr.ts =3D snf_timestamp_to_timeval(req.timestamp, p->opt.tstamp_preci=
sion);
+ 			hdr.caplen =3D caplen;
+ 			hdr.len =3D req.length;
+diff --git a/pcap-usb-linux.c b/pcap-usb-linux.c
+index bc39b1db..d219721a 100644
+--- a/pcap-usb-linux.c
++++ b/pcap-usb-linux.c
+@@ -733,8 +733,8 @@ usb_read_linux_bin(pcap_t *handle, int max_packets _U_=
, pcap_handler callback, u
+ 	pkth.ts.tv_usec =3D info.hdr->ts_usec;
+=20
+ 	if (handle->fcode.bf_insns =3D=3D NULL ||
+-	    pcapint_filter(handle->fcode.bf_insns, handle->buffer,
+-	      pkth.len, pkth.caplen)) {
++	    pcapint_filter(handle->fcode.bf_insns, handle->fcode.bf_len,
++	                   handle->buffer, pkth.len, pkth.caplen)) {
+ 		handlep->packets_read++;
+ 		callback(user, &pkth, handle->buffer);
+ 		return 1;
+@@ -921,8 +921,8 @@ usb_read_linux_mmap(pcap_t *handle, int max_packets, p=
cap_handler callback, u_ch
+ 			pkth.ts.tv_usec =3D hdr->ts_usec;
+=20
+ 			if (handle->fcode.bf_insns =3D=3D NULL ||
+-			    pcapint_filter(handle->fcode.bf_insns, (u_char*) hdr,
+-			      pkth.len, pkth.caplen)) {
++			    pcapint_filter(handle->fcode.bf_insns, handle->fcode.bf_len,
++			                   (u_char*) hdr, pkth.len, pkth.caplen)) {
+ 				handlep->packets_read++;
+ 				callback(user, &pkth, (u_char*) hdr);
+ 				packets++;
+diff --git a/pcap.c b/pcap.c
+index a076c5fb..6caa052b 100644
+--- a/pcap.c
++++ b/pcap.c
+@@ -4349,7 +4349,7 @@ pcap_offline_filter(const struct bpf_program *fp, co=
nst struct pcap_pkthdr *h,
+ 	const struct bpf_insn *fcode =3D fp->bf_insns;
+=20
+ 	if (fcode !=3D NULL)
+-		return (pcapint_filter(fcode, pkt, h->len, h->caplen));
++		return (pcapint_filter(fcode, fp->bf_len, pkt, h->len, h->caplen));
+ 	else
+ 		return (0);
+ }
+diff --git a/pcap_offline_filter.3pcap b/pcap_offline_filter.3pcap
+index 94b9a719..c6d62dee 100644
+--- a/pcap_offline_filter.3pcap
++++ b/pcap_offline_filter.3pcap
+@@ -17,7 +17,7 @@
+ .\" WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF
+ .\" MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
+ .\"
+-.TH PCAP_OFFLINE_FILTER 3PCAP "7 April 2014"
++.TH PCAP_OFFLINE_FILTER 3PCAP "12 March 2026"
+ .SH NAME
+ pcap_offline_filter \- check whether a filter matches a packet
+ .SH SYNOPSIS
+@@ -45,10 +45,35 @@ points to the
+ structure for the packet, and
+ .I pkt
+ points to the data in the packet.
++.PP
++In the
++.B \%bpf_program
++structure the
++.B \%bf_insns
++member is either
++.B NULL
++(which means to reject all packets) or points to an array of one or more
++.B \%struct bpf_insn
++elements, in which case the
++.B \%bf_len
++member must be set to the number of elements (this is what
++.BR \%pcap_compile ()
++produces).
++.PP
++The filter program must have been compiled for a link-layer header type
++that matches the packet data; also on Linux the filter must not use
++BPF extensions, see
++.BR \%pcap_compile ()
++for more information.
+ .SH RETURN VALUE
+ .BR pcap_offline_filter ()
+ returns the return value of the filter program.  This will be zero if
+ the packet doesn't match the filter and non-zero if the packet matches
+ the filter.
++.SH BACKWARD COMPATIBILITY
++.PP
++In libpcap releases before 1.10.7 this function ignored the provided
++.B \%bf_len
++value.
+ .SH SEE ALSO
+ .BR pcap (3PCAP)
+diff --git a/savefile.c b/savefile.c
+index c711a81c..49ef52b6 100644
+--- a/savefile.c
++++ b/savefile.c
+@@ -685,7 +685,8 @@ pcapint_offline_read(pcap_t *p, int cnt, pcap_handler =
callback, u_char *user)
+ 		 * and, if it passes, process it.
+ 		 */
+ 		if ((fcode =3D p->fcode.bf_insns) =3D=3D NULL ||
+-		    pcapint_filter(fcode, data, h.len, h.caplen)) {
++		    pcapint_filter(fcode, p->fcode.bf_len,
++		                   data, h.len, h.caplen)) {
+ 			(*callback)(user, &h, data);
+ 			n++;	/* count the packet */
+ 			if (n >=3D cnt)
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb b/meta/rec=
ipes-connectivity/libpcap/libpcap_1.10.6.bb
index 265c46e3bd..aa5265a54c 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
@@ -13,6 +13,7 @@ DEPENDS =3D "flex-native bison-native"
 SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.xz \
 	   file://0001-Fix-error-messages-about-32-bit-integer-overflow.patch \
 	   file://01-CVE-2026-0799.patch \
+	   file://02-CVE-2026-31912.patch \
           "
 SRC_URI[sha256sum] =3D "ec97d1206bdd19cb6bdd043eaa9f0037aa732262ec68e070fd=
7c7b5f834d5dfc"
=20

