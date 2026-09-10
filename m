Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 727BFC88E47
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 05:12:10 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6892.1789017120475080008
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 22:12:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=mRwzVMB/;
 spf=pass (domain: est.tech, ip: 40.107.159.68, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J1CyOJSFEagqAtNT6ZLwox8A6WYeNdSTcQJysOTSWpX7T6A+03Zz4auOmEyjiNu0VNoRPWRBfF0JP6ugbNny2Vh79aoukBoLIXjDLIUrngbuZ3YXvNYEy2ugai0g0jn62/axjnjoSSf7bImvYw6wYqtfz4IkjNKRec89aXnumEOhkb1qj42pffk5l8SKzLxtzDkaQ5/Rod6DDzEWhLVoRUQ1VChVbGHhE2rvkWohUnTSyJyWCu/9yP2OH5uKJDLz1snah1a6UblDYeIaBVNISHJcdZOSPo2ZiCT8uX1OfNXgPfDTd5uNj4R0Bhz64WtMe4YH56TRRqsh8u8UCDuisg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=agIvHSP/PtSLKQ+/oqIpDgeBZyyWJwasy3Lj7gQHIYc=;
 b=dVP17hWRRHufxunGF+9iCSi5tZJhMXV3s0/tGA3m+rhuKd2dQ8hGuF3NJ5uOR9DNEJjnar8E9GuVkcg9b8LKbQS7rgL+fZYGUSgiLqS/Lc5YFl+P1vbqcRG7H4v3zJWbUywbihT7TEotVZZ2JGGskRzUabnHrez+RRi1WxRNEIkk6tUMnNUmHqjxBPowqayKhvwEru4OZTqOSMCUTwkYbeGVvhLxJA6/jxvyx2KIGFDUcrCsBTy4UAONmU8Eq4OKbSMUj/RIyfDYaMS1iW981RvJW0GfXjlSobhuadtMK02DgMWlGxz5lyb+EHRSM1yilpqXNiZRzJbLyU00Yk1sxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agIvHSP/PtSLKQ+/oqIpDgeBZyyWJwasy3Lj7gQHIYc=;
 b=mRwzVMB/ssJn3dLeVP4gKEatN9C5twXDn7nd5mPYv7W17HW3hNVluLW3creFIwp6wIgLKfJTpbTOl89UJ/R/vxQaXQMU69s4T3XLlJQFuXAyUY19q0ktS6y2xviGcVTvIed6bWS0BgZjQcDQK+r70EFyBGr7v/ig98Eb5dYhIDO71pZJmrO+vTzaPKytSkdOOONuycA4lVWqT579KcP62HemYkaZWlHoh1DI76S3/km8O4nRe09KNtKld2IZ4czs752bhQLyTUf4D0A6KVPHkUmLvh0gLPcmiUyROoO0ohsWsWiS56pC3kT7/RE9lnkwlYGjKgr9ntVXRnFyYUavwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS4P189MB2085.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:514::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 05:12:00 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 05:12:00 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH 5/7] libpcap: Fix CVE-2026-6554
Date: Thu, 10 Sep 2026 07:11:52 +0200
Message-ID: <20260910051154.30595-6-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260910051154.30595-1-jaipaul.cheernam@est.tech>
References: <20260910051154.30595-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::11) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS4P189MB2085:EE_
X-MS-Office365-Filtering-Correlation-Id: 80412ebe-968e-4b38-03bd-08df0efa0b5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|10070799003|1800799024|23010399003|376014|10067099003|6133799003|3023799007|22082099003|18002099003|12006099003|56012099006|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	NUV9eo0hOKb6hQKvmNBeYQuXZDf+dnMVCh7WrvhHjO5XTOqn/KI81yFHZzzc/7soTOLr50qGL7L08nOff+SpNCzJfs0DtMSTqZ63hB398nZkUYk7NrSQM7nvPVpijV3yc6keC7SF/bXzujSrZuf3Qv/Wpl6PVfnvjez9AVMkuAmy6Gw2STJ3eUYJCSKcTHWOHKp9AIZGMpZ0dSiQviZMkDcfDYiPa7jTBJC83OPcTMrOOyfww6AcLi8AK8/tLiSSZv3EfSelCTa8B9tJ9LoTNk/TgCeSbF+0ErUjDn9N1BmBc2QgACI9ni17rHNGeljb/9OSBzHOunAfWfF61vdlE4GNB/H73AoYuyuEeFvPptVNlk/fTSeDU6Y/WLIIwy0TKqGM+4p9Cl0FkgfB2rW2ICu4eHont+O/BmmDZlnTaagDpFeCOAqmaw4xtWC+zbE5tsiu+tFWSneHJXWH5c8ypUGfnIuojgGJUGggj+vdmK1u3tx5CEJMldqKDoNrX1wuIfyBvvnRRVhC/Oe9o2YfKyu5/+Pzj/wRVbL6mcI6Qz1a9+oi9bI2XZsACR7qEN/md1eaGk58m//aJBdyhvbkf2aznde58L1J7BHSMfnnS4Kzb3G3P+JWLvojNJIL1slJ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(23010399003)(376014)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(12006099003)(56012099006)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?j/H+TtkynzUll9fX3ahdmwGQ04KoGxrSn0tNFpF7VkJQ1oYSfflHezgcCX6M?=
 =?us-ascii?Q?g33sdnKI2TZHc4/N1HJgKHLsbaqFTBIYN3rWGftsUKR4Fyu95gBLA8pPy7Xg?=
 =?us-ascii?Q?dSDS0xsrRBvMfJjMeDhCMjt2+upCrKApSetPtAz3davOPbhPiswLSkrbxYnR?=
 =?us-ascii?Q?QhejEMmlV3tWaiZiILSr75Ehoo/YjTaT8akgneFINTLWqCE364aAVaSv/kZX?=
 =?us-ascii?Q?yt7VnuwR8dT617RV576d6yC7iU3zBnaLDfvsag8S04LCRu7j8sFswM+t0+iI?=
 =?us-ascii?Q?R5RDkfZuE5BIr1AVIswKXcWA2UgQFwSAC8hfCTk9foFvIjUVKS8a0PCc3OQj?=
 =?us-ascii?Q?lhdeR2N6TrnbWuPj29ynuvyKauW6tRtUdvvEw+qFfl3oG1TFHG6ssTwqLjak?=
 =?us-ascii?Q?Urw20Hpv4zB2shA77sv26rcdEXvGqQVOH+D/hTOMJpGye8e7v5G+N6Tx+eOj?=
 =?us-ascii?Q?aUDWtOfnOKiJaOZxL8xdLOwhge2Nde03GZGbI74lNJAtXR4PdiiV1VpDq4tV?=
 =?us-ascii?Q?b5ST3d+2Q6BiGIep732t5rEpJ5ezjagcn7hVlAVxAtjsrUAn2+LGN46+gidb?=
 =?us-ascii?Q?zcn7px4EnxyI3a0axgOT2UBMR5FbkkWhjTou79EnmYckA9s8OyAD1xoX1fcs?=
 =?us-ascii?Q?nxim9hHA5acB+jUUqi6yOH3tcZ1Xo2qp73N2fW+qggU+rRc4Vl13dV2+bJzN?=
 =?us-ascii?Q?wnCat4/rbTWwRnvEfn58q3iyyJ/lblb03MSPx3aW56hKFRjFWlrAccid3jK0?=
 =?us-ascii?Q?WRxcki9Af21SM16AcDOsibLY1med1kjmYR4xN9yDA7XE/PlC443WNo0r0Yfx?=
 =?us-ascii?Q?DGkAh6mcVwqFc5PP8U783be49f/GZRWABvbe++DrziGvPIQD/6wqx+UGUQTN?=
 =?us-ascii?Q?oAZSq9H7vXH9ODuts34Pf1ldQExzxrlid7dhX9mOkIJWykN7kvtD8P0ylwKx?=
 =?us-ascii?Q?Js/CP9IE4PkJZxGE35TOQrWJkeGHWZvgMJ8wfMPFWQ8qagqdSKT52V/k6TKA?=
 =?us-ascii?Q?4h7y9pFh0TB6iaG0hTICASANSCtD7ur/OFQ5r+YFTGSUjQ2+7DD8ITfghpU9?=
 =?us-ascii?Q?PsEVCce44uuYlhP/gUgmXVmmyoLXNSmfcjDiN+qo4/JTXm4+2H2QNOPDIamc?=
 =?us-ascii?Q?HrnhJiQ1XvbTaD5JZVqO1gMsmY5boPalbpIWonXxoeFnhdhtzzg1d9LI3VVT?=
 =?us-ascii?Q?baby4kyqhhPOL8i2zncNeoxrTSSLb29SvUGfsq7wla3t/yQXP+t4NsA/x00i?=
 =?us-ascii?Q?6zBQMn+W4Pp3jAxgcypfYTSStI3TWrcMsubEPlNTq87al7alkvCMJ019/sFK?=
 =?us-ascii?Q?i/8CqGCd8vFIPc05vnmQdk2NgxqPQDd+XPp03c1mivHF3sKDyvunn5YgrpJF?=
 =?us-ascii?Q?z45VuViMDDSlc8tuSeXdGLJG+mQccQAn75AycaNExrir1PNNzsV3YIqZC6iF?=
 =?us-ascii?Q?4LuQby/3ZnrpORiuecLy+SbXvD+0Unuj98fD2scetY1beescRkFAOtgs/3VC?=
 =?us-ascii?Q?0aTn9IKpB4IU0fdnpVq3AKMUEEnnpoC0QcIAVdn+fn3dwEk/dk5evXLdjtJt?=
 =?us-ascii?Q?9XoWbdwP0UM2ZqWj4H9FVWfoUuGeLGQ4tn/UGh63rYdmvTF86b7Whk0VpfSZ?=
 =?us-ascii?Q?nigeCafXaOVUpIl9s699cOkZzyNeNqSu9bcX+hlml249C3S+6iYEhcugjcKE?=
 =?us-ascii?Q?zqjtwlePNHvY8Q2Nc+5su8t6UdHehl/YMUgNiwh4J4cvfsGZRXfQtkL8Ntv7?=
 =?us-ascii?Q?xKuCj2NY6CTM5ZH9hdjGGVtHKZmkSR6xSDyPUHx8Bgik0IpF34mmzyafT9IA?=
X-MS-Exchange-AntiSpam-MessageData-1: GGEYrvhmTR6qvUUI+k+XV+d3tJfvAKaoyOU=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 80412ebe-968e-4b38-03bd-08df0efa0b5d
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 05:12:00.6103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xMiCts+OGq2ts37hQCaNHUtSEZ3ku2AYW9j7EcDoopUFoPoRFkBu2ib32kPH1U4znuQ+hH3d7qiPC9knuDMN2SGUiW0/LB/JMPywnVZXTC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB2085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 05:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245528

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-6554
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/ff3c83=
475ac303c6b681c52ad0b6e14795a8e0ce
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcap/libpcap/05-CVE-2026-6554.patch    | 108 ++++++++++++++++++
 .../libpcap/libpcap_1.10.6.bb                 |   1 +
 2 files changed, 109 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/05-CVE-2026-6=
554.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/05-CVE-2026-6554.pat=
ch b/meta/recipes-connectivity/libpcap/libpcap/05-CVE-2026-6554.patch
new file mode 100644
index 0000000000..720bce3f89
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/05-CVE-2026-6554.patch
@@ -0,0 +1,108 @@
+From ee37e79521d28a04b09f5c37b835ae7955c15e75 Mon Sep 17 00:00:00 2001
+From: Denis Ovsienko <denis@ovsienko.info>
+Date: Thu, 30 Jul 2026 13:34:33 +0100
+Subject: [PATCH] CVE-2026-6554: Limit "ja L" looping in pcap_offline_filte=
r().
+
+This vulnerability has been discovered by Kaixuan LI.
+
+The current revision of pcapint_filter_with_aux_data() assumes that any
+"ja L" instruction in a filter program does not jump to itself or to a
+prior instruction that is guaranteed to reach the same "ja L" again.
+This holds for programs that have been generated by libpcap.
+
+However, this does not necessarily hold for programs that come from an
+external source via pcap_offline_filter() or [deprecated] bpf_filter().
+If the interpreter executes such a program, upon reaching such an
+instruction it will begin looping infinitely.
+
+To mitigate this problem, in pcapint_filter_with_aux_data() enforce a
+hard-coded limit on the number of backward jumps per packet.  Ibid., and
+in pcapint_validate_filter() as well, reject the only immediately
+detectable case of an infinite loop.
+
+(backported from commit 63c005c25aeabf1404968add49fc885da3e127e0)
+
+(cherry picked from commit ff3c83475ac303c6b681c52ad0b6e14795a8e0ce)
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/co=
mmit/ff3c83475ac303c6b681c52ad0b6e14795a8e0ce]
+CVE: CVE-2026-6554
+
+Notes on backporting to 1.10.6:
+ - The stray BPF_S_ANC_* enum removed upstream in 1.10.7 (commit ff47ba55)=
 is
+   still present in 1.10.6, so the new MAX_BACKWARD_JUMPS define is added
+   alongside it instead of replacing it.
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ CHANGES                  | 1 +
+ bpf_filter.c | 25 +++++++++++++++++++++++++
+ 2 files changed, 26 insertions(+)
+diff --git a/CHANGES b/CHANGES
+index 35121e7..ff9bac3 100644
+--- a/CHANGES
++++ b/CHANGES
+@@ -4,6 +4,7 @@
+     CVE-2026-31912: Mind the program bounds in pcap_offline_filter().
+     CVE-2026-31911: Fail opcodes safely in the BPF interpreter.
+     CVE-2026-6244: Avoid division by zero via pcap_offline_filter().
++    CVE-2026-6554: Limit "ja L" looping in pcap_offline_filter().
+=20
+ Tuesday, December 30, 2025 / The Tcpdump Group
+   Summary for 1.10.6 libpcap release
+diff --git a/bpf_filter.c b/bpf_filter.c
+index 0178aae5..bc6d149f 100644
+--- a/bpf_filter.c
++++ b/bpf_filter.c
+@@ -70,6 +70,8 @@ enum {
+         BPF_S_ANC_VLAN_TAG_PRESENT,
+ };
+=20
++#define MAX_BACKWARD_JUMPS 64U
++
+ /*
+  * Kernel BPF implementations tend to define BPF_MAXINSNS to 512 or 4096,=
 the
+  * userland interpreter in libpcap is meant to support much longer filter
+@@ -144,6 +146,7 @@ pcapint_filter_with_aux_data(const struct bpf_insn *pc=
, const u_int proglen,
+ 	A =3D 0;
+ 	X =3D 0;
+ 	const struct bpf_insn *pc0 =3D pc;
++	unsigned backward_jumps =3D 0;
+ 	--pc;
+ 	for (;;) {
+ 		++pc;
+@@ -318,6 +321,17 @@ DIAG_ON_DEFAULT_ONLY_SWITCH
+ 			 */
+ 			if ((bpf_u_int32)(pc - pc0) + 1 + pc->k >=3D proglen)
+ 				return 0;
++			/*
++			 * Terminate the program if this is a non-forward jump
++			 * and is:
++			 * - a guaranteed infinite loop because it jumps to
++			 *   itself (exactly the same as in the validator), or
++			 * - a backward jump after many enough backward jumps
++			 *   already made for this packet.
++			 */
++			if ((bpf_int32)pc->k < 0 && ((bpf_int32)pc->k =3D=3D -1 ||
++			    backward_jumps++ >=3D MAX_BACKWARD_JUMPS))
++				return 0;
+ 			/*
+ 			 * XXX - we currently implement "ip6 protochain"
+ 			 * with backward jumps, so sign-extend pc->k.
+@@ -605,6 +619,17 @@ pcapint_validate_filter(const struct bpf_insn *f, int=
 len)
+ 				 */
+ 				if (from + p->k >=3D (u_int)len)
+ 					return 0;
++				/*
++				 * The only type of infinite loop that can be
++				 * detected in this function is a "ja L" that
++				 * jumps to itself.  For this only k =3D=3D -1
++				 * needs to be tested because the check above
++				 * has already rejected all other values that
++				 * would wrap the pointer equivalently on
++				 * 32-bit architectures.
++				 */
++				if ((bpf_int32)p->k =3D=3D -1)
++					return 0;
+ 				break;
+ 			case BPF_JEQ:
+ 			case BPF_JGT:
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb b/meta/rec=
ipes-connectivity/libpcap/libpcap_1.10.6.bb
index 258a15f5ba..6ca75117e1 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
@@ -16,6 +16,7 @@ SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.xz=
 \
 	   file://02-CVE-2026-31912.patch \
 	   file://03-CVE-2026-31911.patch \
 	   file://04-CVE-2026-6244.patch \
+	   file://05-CVE-2026-6554.patch \
           "
 SRC_URI[sha256sum] =3D "ec97d1206bdd19cb6bdd043eaa9f0037aa732262ec68e070fd=
7c7b5f834d5dfc"
=20

