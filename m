Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D789FC982C4
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:45:36 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5557.1789501526272473796
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 12:45:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=bmhBBbqm;
 spf=pass (domain: est.tech, ip: 52.101.66.7, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rD/r+/ZOvXOpvkqrL7plasq5PjuPIw9PN0tXzKlgC9bxTj8rZ/W7SbD1d7MXjXU7t+cCjRjXzfQt/5Mi25Xp9KJx2swFrpHHboZvT7dCZWzJaqhzXx7Cavg4ZozOUo8cdaIEU+Lqns3kFMlMPWqd5Z+nWkuQyhkrwdtK1T2vqVuaBHKhyX4uwrbvg1NNJuBlXoNfvZ5ukqHpRfrgB+OKCxKebdnfxFE8ho5cc6G6/XgcoSMeDS4+I645soyMtZ1BKiM2H39tt5SibM1NjFlnspkTzHfsqPbyEKhwA3+oHuYDc7zKnf+O3XeML5Y7cgjJuN9agv1/tOcziQD1KnWX+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=epFr9pwU0M1g0CGRObxLEWeLqG75am9U8XIp+BTsKQ4=;
 b=yHjSqQb3Tqxo0OR0ve2AiPAgMmeHKM7z8xg5nSlsmZ6Zwhdn8LJl0jK11B1JYQfsg4aNVnNn7OUH3nSIIZTtnfka6yKXGZEKJ+51rBvuwyPzs3DgMQBr4rX5JWcUU5/hHFZka7YZVmt9k+TMFv5TYix0Wv2bKFyJ22/eZETk+J1oPQLFn+cyBnF+qryYN1o6QCT9PTnwVUWLwo8Bv4ZZFejW4d5ffL56MJKcTDC3E8uXKJRV66MDz0hOsRAvU7CDo85jPzn1Rwi5zO6mCDE0RLi5o6z0Mm/byMa3/bp41mogwaQdWzaCI8zvQBZy5EgQiOa85clp4FVQuys4KYehxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epFr9pwU0M1g0CGRObxLEWeLqG75am9U8XIp+BTsKQ4=;
 b=bmhBBbqmg8i/v8c9HVfIlbRiNVlJvEihX7VrvF0bsv4Am/wFadj0iMWrc77vGgz13awZ6SgA8yKaonYgn34KbrxExG32Ft6YuKLtBtyUqwn7a4DlPNHQlzwcWzMW8HpkmORyFnzcgu+8PvwOdzN74P5aQt7MSLmGP/y6Ne6u8o0y7zpKO0AscXi5/qcBAgoalielvA0yEVPVQa8XEA85S7KQ3uD6JWNqXjELpXv+1+k6myH0M+S/7ENSjjeOiansGUJz7s+uijcD6t92D86j+R3tFdE3ViyVRfGiuru+SAnAEU3KFPdRoJClqKF8+hGlrSbvpjQd3+Nl72oQg4UY3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PA1P189MB3172.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4e7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 19:45:25 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 19:45:25 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 2/7] libpcap: Fix CVE-2026-31912
Date: Tue, 15 Sep 2026 21:45:15 +0200
Message-ID: <20260915194520.45847-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260915194520.45847-1-jaipaul.cheernam@est.tech>
References: <20260915194520.45847-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU6P191CA0069.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::22) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PA1P189MB3172:EE_
X-MS-Office365-Filtering-Correlation-Id: 14d765fa-88f5-40bf-a0d3-08df1361e2e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|56012099006|11063799006|10067099003|22082099003|18002099003|6133799003|12006099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	a5o7xswQHvVLaVbj5nzErYFXTrETdCnV+djVgELgDrd01jBQIYhbxV0cSwmKfPfY2c+35NjrVd0zj5BLhvCBOG5lA6yiPc+WGiuf54rQ25qd+RYdrAIc3auhxeZpt3nDa6MuoaBNGbsgW8gLSi8uy6fUAeegVbFmzy7kIt2mcoyzASvIsJ/qf5gwdq6TCDzBj/Hm2d26gFlAN3dxjkER5NKbV3EdStYZofW+LeCZm7BhTJIiz8Gxmeu+7ukOMnEXbGc560wKGyCTQa0jFxHEVnI68eP6yOXINwDz3Xn0d8xKy+ToFpKVQvqW9TWsgwsZ3J8PZkXsaCQ0Y76bjTAhDXJ2kbKtGM7Gg6B3mJvznC/oR8rI4kNHT3bNH8FNSTmfXL3W9gSaGn4qyjMYDYJv8S8nlIk1ziW/IoA9OO7uJL6CO/mZDsrToyi2EVo1F/kOxk3UMPNwHdq++659JRk18NhK+TI70sK8IlD/kG/4FUH40PAQOJzc9Atat0gYxKQZST+mwROaOYTExIkyHITAY1kC3Xv/jK1lfhg60sItuD96N6ejC4QnpmVR75B7WR4YMP6zEjjRAWwImdULJ3owgHwDp0aFIZVUdbIyriepjio=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003)(12006099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gsoLFep+IIgHmRvXne9DaTsTLefhv9bEV5Fz6QQhqs0iBZRkgq4H+bB0Qu7q?=
 =?us-ascii?Q?1qXD7D8a/0rjWuvrbJYKLOBwVNAxuOpnOUrDcIwWChAYu5WhGGuunZTwPuJ3?=
 =?us-ascii?Q?JSncPBPw++/NjBwZ1IMlRFjJFvLKeAe8lOb96iItSBXRic9HlT95maVA+TlG?=
 =?us-ascii?Q?zHaSs0II9/gXzepTeOX0gl3k9H533NSsoWw0YVDGlbmuUCxpn3xNF9lIVIlM?=
 =?us-ascii?Q?iGdIgi2dlmLcDoco3iBDBP9dpZTx9FxWMivxLniwsZa+L7Z4+B5BhvvtaWXT?=
 =?us-ascii?Q?V3GR8RhlaZmhHdKxE8PPkBpm/BsffvKVvPONttPDM7inELyTIZd2szDPWARZ?=
 =?us-ascii?Q?qTs7vg180tU/nFa/KxhYwaoRl9jdsRYF0ZGQDVCJOxmh9GhsNSw4lRWHNt7C?=
 =?us-ascii?Q?TQ1d+WOuD1asTUd3lGSYiRvKVDfN9rnMPoo2EVz4sRstTy2cbl0QAFBVq/5/?=
 =?us-ascii?Q?sXfhL/Ox345FtV4+X4D3KqfZx5csiFyN/D6ADHob+NlqG7EZJt79qwRnAC2K?=
 =?us-ascii?Q?A7hD4crbg9k1D+6jlAIsyVDdZfR4pkCmbXsubxE6axROaK8w1a3oj0Coiia9?=
 =?us-ascii?Q?IKB2EigqlaSCnFQvlZMb7T5XmOQr/vxzqegvnH/4waFZUeJrbMfv/nNqDbpQ?=
 =?us-ascii?Q?x+2oT9a+cakl8JK9sx7xcHSuXggKAOOTzNtTpOLg71B6urCB9lptjKKiOWBc?=
 =?us-ascii?Q?wM7alvTcSJEIiGKHixlAxlESWwJFrFcMLW1m+Fg+Fv30X1isiHxkK0J35zHG?=
 =?us-ascii?Q?xhWPaZkzSfp2+XMJSnGOX/CWzNZHgetpufNpU6j8eQwN8UIK48u4Aeqc98Xe?=
 =?us-ascii?Q?cPkPOKqSBh2DM7LaGa9+Aou79W0fSPxAdy23Xp44P+q6pO4fkmZXJ/gdv2Zl?=
 =?us-ascii?Q?Tyt5nDktRRpMaeJ1y3NKofzqfsDkp/NgUnsnUMRuwLbY1tPYZVpdz+hTwhod?=
 =?us-ascii?Q?gWuzQL1/D8OQVcPfGNRSOl9fEvFHXzZE1R7kWV1VXEurZLoqShAyGSA/iKt4?=
 =?us-ascii?Q?ipKconBjTHgOgBfHuIffyLLsf7wrP0sKFGgYSZ8VmNfljGfVuxYg40wgRuvB?=
 =?us-ascii?Q?zY/wZQH8g7CdrFrpY1Jymj1ubdtONDc7Tm/U1sLo3X02yisPjXs/JJjLExGC?=
 =?us-ascii?Q?KQj7s6uGgEOHkanxJ9ejPf5KjYRJpPLxDvdIVe78D7FgDxFcVgxaxik/Xoyx?=
 =?us-ascii?Q?Gysac9Xyqdh5daSQfb0UjreEARTLToIzfFLsCoBWxFugccipb3vgCUlmKLUn?=
 =?us-ascii?Q?qKGez72ELU7Kj6cT4u8dTl+N16soZaIV6SYF+KGTM2ClwTFWDgPPGGZTxIV/?=
 =?us-ascii?Q?2lUNB09JbhdFqutW+J4cPFU1yyM+QvO2rj5tLezy68917M/w6+HbOtAvmtEp?=
 =?us-ascii?Q?cTuq3fSWtp0UeSz9p/juqKs7TMXpF08kBE74E3zI4N/qJV6LOooglKUVmIUz?=
 =?us-ascii?Q?0MMUd4cT3t7wHz0FBBXQDR9m5zaKFhfVfgEy40sR7bwYxR2a/uN5h4SG6VF5?=
 =?us-ascii?Q?7/KUf1l7HUsA83gQVqYRMq8omS0JuvjY0WW41SErqTUfxCTfISuXI5OSLmay?=
 =?us-ascii?Q?kxDHrXJ/Y1T6WVOQS1hYs0FNLdrkZ02RBCgLzYyspP2ZwV1AZkSIIU31Tq0p?=
 =?us-ascii?Q?UBFMW0JvgM03ConL04TC3b6255LkcaA298L664TXcf6+uDUZlt8Pr0Us4ivq?=
 =?us-ascii?Q?9TjuUZesv7nOT5DRQRwiOLi2wIQv0/KpVbR+iD1QUoybIMjQjMSTSQPAi+1L?=
 =?us-ascii?Q?RBqEo3wloQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 14d765fa-88f5-40bf-a0d3-08df1361e2e6
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 19:45:25.0716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 62ECNUInwwcxBUPh4HcK0moQStomoJkyNa8NyHIGXeVUb7AkShjRrhuu1i+/nqEeVFkvvmitnqp8q0Zr1AqNpoY0+KihZ7YjBNDj7+Zu1SA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3172
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 19:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245893

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-31912
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/d3f358=
d3cffbe1ecb94d5284b3e81f052a0adcb9
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcap/libpcap/02-CVE-2026-31912.patch   | 520 ++++++++++++++++++
 .../libpcap/libpcap_1.10.4.bb                 |   1 +
 2 files changed, 521 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/02-CVE-2026-3=
1912.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/02-CVE-2026-31912.pa=
tch b/meta/recipes-connectivity/libpcap/libpcap/02-CVE-2026-31912.patch
new file mode 100644
index 0000000000..1173a4f9d7
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/02-CVE-2026-31912.patch
@@ -0,0 +1,520 @@
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

