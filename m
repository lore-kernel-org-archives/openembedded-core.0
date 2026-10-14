Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3603CC6B1D
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 14:39:05 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.39])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15335.1791988742928670165
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 07:39:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=hD6cutZF;
 spf=pass (domain: est.tech, ip: 40.107.162.39, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eDaDJXzeXrAQymLZmFtljSDFsfKldCV0VTGkllHnGyQeE+MqOeXDt6KJByyqPVxvwDfxtwsGL1/MntQjSsppvQSJN5g0MmJ6PJYJUlUxQwEHpMtdvqqFa9+/P6lBC3PHx1PByrY9fYvdlmOx4Mn3fyryXTkEgx/k+G1LA1C1zPNO/CzedVOkWNL1rGInhNBIU6GnkPr52Yh2HG5JcdaOs7tBcmhyNM8FEFuQpvurPhBQWkdnTNIpWxgqkJyd43sqmFxZWouZtFuyFIYAZLjU4WTQe0/dDliXlQTyifBj17KsrZC64r5dZVMrVRespSBmSbsLeJl9Kg8rBxHqJiO/jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDs8DSoxWA/jbmZtQIy/JtadiZwzq0sUNBaXp/9MG7g=;
 b=J8qo0+y48r+uBr9ln8pEknwGNIccoVKYbba0KVvB5Dd4Aj3bq4DucZuh5e97Ut4N4JSh4Fhyy7qrZkIH0bl/7kYOjH6uKMxiNAanUl0H8UbIgq0FHxdkJXopJl4xalpCgC46REbqqk0J10UqqWKLNyv5/RHUl7In+CGaAECzcDJJ5gOCRuNgSQ6EAqXUFaTBp2o+clpX5NrY8Zco+BdMTlkR0iO/5k/Fdl4C9Ef2PUXtgaOCCLNSxP3DXgp22Jf+rKCMfuRWhLlcZReyG1UuQkq/zDjGgHgUh/arD1UqlMAF0wzIqTay7L8v4u9I4Dbk1O7N2X+xFO+7bjXESKk9TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDs8DSoxWA/jbmZtQIy/JtadiZwzq0sUNBaXp/9MG7g=;
 b=hD6cutZFrfoTaINjCOeUDrRCFL/qvpErkzG7sX2BX/gR/p/nIuHN5j84kG2m+uA/8Uwxd+2PWpUb1eLVkKHQOOFLeYYUo+19rTULJ8UQkspyXermYGs70Eb0Zt6os4SIGLQ9NWwVHiZyt93gDw1iyuk/dLc8cE8eau0amND8UV3j3e72Q6csNIHGov3w3DYpwx+oshAuctXW/ykIaLsX9IC01aZ5f4VqZJSrCR2HPaLWCxfXEgm7BriLXmxJSjI5m+2oDzrnUAkOvRI1/Vketh9zKIJB6yH/W2YrrG5bgLWbgRjSVje0tqygr/Vez8TldBmYnf1KkNGQtU6tUggyQw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by BESP189MB036075.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:138::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 14:39:01 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 14:39:01 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH v3 2/7] libpcap: Fix CVE-2026-31912
Date: Wed, 14 Oct 2026 16:38:51 +0200
Message-ID: <20261014143856.74426-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261014143856.74426-1-jaipaul.cheernam@est.tech>
References: <20261014143856.74426-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU6P191CA0039.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53f::13) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|BESP189MB036075:EE_
X-MS-Office365-Filtering-Correlation-Id: bd8c4a53-a8bf-452b-b1fb-08df2a00e38c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|12006099003|18002099003|22082099003|10067099003|13003099007|3023799007|11063799006|260925022911599003|260925021311599003|260925021911599003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	q3eWoh2p1Xa6G3zm++onx7gSJDBXqTghb+6bNr8AF6v49sl+r8eycoVPhzmtNhr0pggKOdVmmywCNptlhq/A3VLdJmBASN4ejCurIRXySr70dLnMlusrqTbVE8zfrBIwfpA12SI8+6k6ZuQ1PhJrVoUO8EWPh1FzIiC3vxwBgTscE4yd7rGV6ZZhPuvjfVI3yhNaPyVbVlLitKvhRj/98QMGb7oCvlsS7Z1Rt7GetC6m5htKQhl+Rzbgbd5X94JxyDUIedod/PF4nEGLIk9I3vlXoAIbcjAAaTOM47Db/KrmzXj8hGBox/QMreMx+LjZ9pjBHXCbu0tMB6KXUBwTqjRbgIYmtnAxM7CQEtW08XLT7K41tcDRieevJP7GTOQ8xRlrafCQY9a+F9jlZx6I+bP73Kleeb7+5Ank00ewssp5mutee0FqYtkHRwB14/qLoVOU9mXYTSYAtJMBQm9cbVBE8Q2XRDInSAtHX+xYzfKbYjAeFe47CRkKVhFYy4v6rKY4fNroFJWVJzBRhTLTWuQjbyfL2kB6B3AHcRNoW/1KkIIImxs6r3+TwKt3y2KTSOUQsaFnV3kPA8zVbdwYj0YY8PSuXPP31RXZnH2ikVo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(12006099003)(18002099003)(22082099003)(10067099003)(13003099007)(3023799007)(11063799006)(260925022911599003)(260925021311599003)(260925021911599003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?q38sNyG+gaTgJaUZk3Y088jytClv7YBV6zzK3s8xu5veeBbmdSf7O2EbpVYB?=
 =?us-ascii?Q?30vLi6aUCFyDRDjR2aoc6o7MzJSD4rN/ac1UM+u6YUDis8pRc5IaqdHdUJG5?=
 =?us-ascii?Q?zW97V23Wo8EqSXT58P+IFqdy2IqJfOK9+8zJJjT5KWgPTAynZKJ5ci9qZBz2?=
 =?us-ascii?Q?bZjrIl6ENOZNhQIWp1RgeBJ88k1cOQKCRojrQjyOvZGUkS856xa4IJEGsJK/?=
 =?us-ascii?Q?DEet9yaO504lOasAqHPruJRRVstjn2M98gKoWkHvvXkotPHAAKIxlj+FtSf3?=
 =?us-ascii?Q?1EiN7PoTuQHemjASCpA7lG5Ggfnbqzr/Loka4+ztTOq+yrhGJNuJQfz1RnXn?=
 =?us-ascii?Q?hbzG5IU7Z/u1x6HPKZ6d+snwqy4Tbhh6V59c4QPTdHON7icVRQDMnSNP02Ml?=
 =?us-ascii?Q?3P6hqJ1OXQOKb1uNEyKGmvL7NZxDh2KoYUoJ/EqlVjvsEMy1JV9Ye9141hNg?=
 =?us-ascii?Q?J3y9u5xE17J2ASDu8lIdHwT7GKLUAJYl822Ntp2/BJOw7fX8fOAoThQPqk/0?=
 =?us-ascii?Q?a7INRJ/e2ldvjJ/3xgAwWmXm3j7g6ZgtS1y3xvUyq10OUC5/nlkhaqC3ZXkO?=
 =?us-ascii?Q?00wesvd6aWzNZZ6ylJQLv5JMwz9aTtq62Ly0tlgoDEO5SRq/2+aOnXg2lgGt?=
 =?us-ascii?Q?p382qg6wXIs6ooBLzH6iOQGrMyD8eZU7u7d5fCkp4azqHAS18HLTS6rwNphI?=
 =?us-ascii?Q?+ijQgsg3Xnk3dcIwVNxDys7HCNiVs3jCgiQ4dslgoK6pdx/vOb1aa7tUH3St?=
 =?us-ascii?Q?bkjvcd820zavVX6Evlsz5RupFJogbR4PiBl4k1WzoW5QwMu53gls0AQudDPo?=
 =?us-ascii?Q?T+K8584VdnxCbFygqIkaeF5fLoEyo/jGGgYPpFIx4DwfsTC2uwyFlmLNjIOO?=
 =?us-ascii?Q?qvdtgfdad4RQQZ7hRdDiRz/lenXB1hoPaMCWVKWLmgYRCpk+qxLwa/Ljk+9g?=
 =?us-ascii?Q?KHfPA5k4sOEVfMd0QH/3LG3EwUtyyKFEyLYtxfU/8Ih9BF7DBQGd0RmolUxP?=
 =?us-ascii?Q?Nd2VS6Lmjq6NuS/Q8z+S/wzERORX9iFtUS4gOQ4VoYPCCBdzhry7HWUPc2u8?=
 =?us-ascii?Q?DtUdcd6br0enclWjNXa9U2M6SXK5Gz/dDGMpg42CJl0jn6Q92/y2R243R4fa?=
 =?us-ascii?Q?1jhorJcp1ELRB6/kcoXGUgEoIp4kRSk9TlUI3A6xo/Ia9QeQ4A1ev+B+2BOQ?=
 =?us-ascii?Q?34SaeRcR81TpNcfUu9WntmQQMRmKakuzryjbl/wOII52OMmhiANivHtf7ze4?=
 =?us-ascii?Q?qEE/Pj6HBwNlNfHH8TWIM3bVORPjPIsPO3Fnr4PTLhtjfmwF+TP9vwqg13Mh?=
 =?us-ascii?Q?6/4KoUjQ+B7mNY121w50l6QbPj3dI23rg6IfYAq3gSZu+q99LiGaQHoqwgqr?=
 =?us-ascii?Q?goAdWVGnOOIsVAgJE9t0W1kDzoMlpDJ76He9mHZYKY1RAJmLZEBfbg4uPZWv?=
 =?us-ascii?Q?OUcEJSu/kHjnjX+McdJBBS9Jt3Y5+aTIcjobCdI30mJy+l2vIg43jdBh9PJh?=
 =?us-ascii?Q?ArDXAHCGrivImYyUWmTjZ61cZJSnFGCd2b+OLGbnqdQ7KQD22pLCOJ+LF9Zu?=
 =?us-ascii?Q?w5Zx5JjW6yD2b7Ui6Sh8vK4EhO/q0R+jTcLj6ATuUpiKyaSto+0i9TwGe6T4?=
 =?us-ascii?Q?h+xsuw9gXCjRAyRUKtrTIqqaDy3M+w2ilWwyQ/Q1dHNJatVxYXlFV9Ho1M9U?=
 =?us-ascii?Q?hoxFDOnoJ24ejJzcQ94Aze7m2SAU30WdYDYWwuxmjkZEyyxUx4lW88iEJAI/?=
 =?us-ascii?Q?wcb+bCDjTw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: bd8c4a53-a8bf-452b-b1fb-08df2a00e38c
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 14:39:01.7425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ewpkWkw2RriV1LXNKSFV+lP5PLiyu9QrRWX4b+sVvdql1VxDmFyIo3ua6ee2wXZ42D1jVTF2opxEBifgAy4aJsH8Ke2wDrpuNI7DTmzbW+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESP189MB036075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 14:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247768

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-31912
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/d3f358=
d3cffbe1ecb94d5284b3e81f052a0adcb9

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcap/libpcap/02-CVE-2026-31912.patch   | 591 ++++++++++++++++++
 .../libpcap/libpcap_1.10.4.bb                 |   1 +
 2 files changed, 592 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/02-CVE-2026-3=
1912.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/02-CVE-2026-31912.pa=
tch b/meta/recipes-connectivity/libpcap/libpcap/02-CVE-2026-31912.patch
new file mode 100644
index 0000000000..1118287040
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/02-CVE-2026-31912.patch
@@ -0,0 +1,591 @@
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
+ - The upstream pcap-haiku.c hunk is applied to pcap-haiku.cpp instead
+   (the Haiku module was rewritten from C++ to C after 1.10.4).
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
+diff --git a/pcap-haiku.cpp b/pcap-haiku.cpp
+index 8ae9119c..3d34220c 100644
+--- a/pcap-haiku.cpp
++++ b/pcap-haiku.cpp
+@@ -85,8 +85,8 @@ pcap_read_haiku(pcap_t* handle, int maxPackets _U_, pcap=
_handler callback,
+=20
+ 	// run the packet filter
+ 	if (handle->fcode.bf_insns) {
+-		if (pcap_filter(handle->fcode.bf_insns, buffer, bytesReceived,
+-				captureLength) =3D=3D 0) {
++		if (pcap_filter(handle->fcode.bf_insns, handle->fcode.bf_len,
++				buffer, bytesReceived, captureLength) =3D=3D 0) {
+ 			// packet got rejected
+ 			return 0;
+ 		}
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
+diff --git a/pcap_offline_filter.3pcap b/pcap_offline_filter.3pcap
+index dbb6e966..406604dc 100644
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
+@@ -46,10 +46,35 @@ points to the
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

