Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E6BC88E41
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 05:12:10 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6892.1789017120475080008
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 22:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=WdsU260t;
 spf=pass (domain: est.tech, ip: 40.107.159.68, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZTqFs+yU5xkGL4lNMKjzNmsnkGPopbOIS+2qtvcNmDu8dBELK8Ig+8JI5NHSWYvFwCEIfTJUTyNZr9d/l+1CUf/PJNz0kh/u4eX6nMFQRECIdIncxh5A3aR7n8Jt8VJEoaHqDpBbihFQrC0NpWvuxpisZ5L+VDe4+gDQerCICFj48y41bvmkD7INKC6ZoSj1HRkjvR1Er7fs1xWXV5gkoOHZh56nbdmMAgdMGNXnRMZfid92yKsGZIsE+oRGxFq7b3unT3MlHHw9eOxJF70VOf7hxav18HrKzD8QdkJvXHt+ofeAujMuDoBLvk735gxo1IyZGDcUCOvjpgoBh7+30g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lP6EBesQ3tKC9baf51olH0eVbcqD7+zTL70B4OJL51w=;
 b=GZ8uexYu9PMfG+GB6G8KcZcJ6VA0gtLVOk8+ru+oeA6Uob0os2iCUm83zXEVKPEFbxJCgT87NaPVv3+qemGyeMbq0BIvVWkTPRoau7OwxNgSySJxFkKx6N4BIqjAoLbfgHXEzGHK5wjT2QkChfMNZov4uROAHJhiPbCIpUF+kdd/Iv1VJYK6+NbqueqIn3QzWmPWj8yorW9jKrao4nOlwN8GNgV6mNdVvhIE1Dd4bDzzv2M9piJ6qrVTb/JzGCnvyqYi4kQJo0touCnjsAM448VbhMavPWOnCUKwbOOV1FRmojnVrsefeh7nOf9tj8MPF6qbYcFBgS2b8BQe8wfy4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lP6EBesQ3tKC9baf51olH0eVbcqD7+zTL70B4OJL51w=;
 b=WdsU260t4P7or+6erWczCiOCKMFftAA/G6Jx/kkWilrtL92s0gklvtknqnpPhvFaGoBfopDD40I49iJgF5mh+kXDCppzfvdC9d8p36BWklMAfCOOcnQJBT89J+Z53XvbcYRfLN/J81vBG7m+VWtOyFd7fCWGqYe/HEA/p+WECIJrU526WeoNklVN+Dr+T3iAZqXhfSuBDMfZvHEzYWNcAIJ4euOq8cOHjbOt2Vlkk7b3LFY7FglI372I903hFpXT6D3vIheDN2EkITI3TP+s0AgISGf0ePr74UXWXdrgJ6AKOCv0GNqTMCUzz7d7n2yHRCQXBhSCDBA/4RKSZYApUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS4P189MB2085.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:514::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 05:11:57 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 05:11:57 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH 2/7] libpcap: Fix CVE-2026-31912
Date: Thu, 10 Sep 2026 07:11:49 +0200
Message-ID: <20260910051154.30595-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260910051154.30595-1-jaipaul.cheernam@est.tech>
References: <20260910051154.30595-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZP191CA0007.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f9::11) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS4P189MB2085:EE_
X-MS-Office365-Filtering-Correlation-Id: da423111-ca51-4b42-ea82-08df0efa0989
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|10070799003|1800799024|23010399003|376014|10067099003|6133799003|3023799007|22082099003|18002099003|12006099003|56012099006|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	+fNDns4QEUfUeeFMwu73dXnN11O6x2L5HgLnG9SqXor4lWa8QOJ2T+qrNQ6/RWS+YJbwPir0duDCoV5qQ3rdY6CnuQhYF1DQfthbJ2Ek4t0Y1o1O7XiwRv0x/YUOeY809oDEcNJd/kLvufM6thUHYlGyYI+YrErstalGLVXDLMNKSu4d6CsJ+ZPwtmyyRR59dwyJzQIbXs6xOrr/Y3zzwywEDOWGfeqMcWEUzKEVFNSeFjWc58URz69l8seaI9Dicpi+i+NgqjPBzj0DQ403rLAsuNHks0vlkJLX80KiEJchNFQZGXcIkjELLOVQgisJjdmTI4IUW2Mj7rCm85f9FV04ZTqhXOOPNiClUaP5MpG86pKwlWZS4fxeqmlW0mBLc/7CSLT6DsdWhN7GC9zKmniu9X7YJAaI1q0BkYmgFbtRoDeZHyIyWxWehg0bbSelTlf9JxeVYvJdrxvdJnzh8HEB2ZopTZr7zUyRZBjbXlgkAjBhZYooA/Ws3R7zlBnqsLrPelO1ycJtCaWn5BQnICzSAeHIdLxGExtVWKWrlY0DdhZsDhu0wls/mRFOuuTxKo2bkw3+vAXWziec2TmCUdmC+yMMWR9iO3/7AIIJ4mSnA4xNJWlXI2nIjlm4rVFi
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(23010399003)(376014)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(12006099003)(56012099006)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FWZWRy29W1HZEwFCJq+143Xe8pXJ84QxuNqRnvPd/+A4kDJGowN53YBHbSPG?=
 =?us-ascii?Q?imQtWhqNh7W6QdAEif3t5xEIVWxeunSqv2/oAUZC40RSw8gTpBtjPQ0I5p59?=
 =?us-ascii?Q?4tdYv4IpnHZtsdeH2CxE0mt/etL70WbtF/vV6GZdXYzkBmCySRWO8cx7Fls9?=
 =?us-ascii?Q?K9mTr9leWUrcgD6VXBWEJu0xnO1oolipPQl+za+9iqwcEVYjxF40ED3PQpLw?=
 =?us-ascii?Q?TbfxPNeXvqF/0CGhSfBJSLiy0TYXTu7XPblB2pmjrFKtPDK5DEkvuvBGZEnW?=
 =?us-ascii?Q?grzNl6vsqN1OI2OxwfI7kUD5uDbr5gxcs1Xd5QH1p3xM/y8kywki+yHOWbNz?=
 =?us-ascii?Q?jHW7B6zU8bzASe3mIz9Uq40qOILGStGM4vzkhG2pz4UK1apfqxEypB8ajTQx?=
 =?us-ascii?Q?dvmsjZTjL5Ho+RHKaQKpgaiJYvwMYqvm7qOF9sLOl2IJhX192nfpylSmpJFs?=
 =?us-ascii?Q?LVJSjVOwcpBoYGYoF/LXOIn6xJ52IJ7XK9kg+rlb5u2Z8XB0+p7cpLUK+0js?=
 =?us-ascii?Q?2tFt7SrQaDad8vFAL5HUtBf8L0Z4rzIdLpVlOWl/91IVkrtuHsm63xtemVpZ?=
 =?us-ascii?Q?Ol3prBOhzgMPSkLjXDnS23XkX32cI4wTjvwL4cf5++3+7yVbxJDgBpJRs/sX?=
 =?us-ascii?Q?E5ldm9qCZ6rqBwhvEOKsI7tflLtNu8HWbFAJOIjlEpqcc4Hh957ykzPzx369?=
 =?us-ascii?Q?S83Jz0lTGQOGMV/O0I3gxZnBsRI3OC9lvv/8hJkq+PcCdqBRWaWYEbbPCed1?=
 =?us-ascii?Q?pOMdQF3NJklTpew/vdK3c70g7RgX4Io3RsENUWF9Ht9EtxuTRKHFNDFigWqS?=
 =?us-ascii?Q?WIz1Umv7C+gZ39kWAYEC0tfzQSRicPQ1oZcqhKpIp7XkPe99BOsNwOTp+Dxi?=
 =?us-ascii?Q?EaMNfwr/nZqH6dleaB6ACk5a6CCJMXGrrY14AkidnUWEZbM0kfv5PLZTUbbp?=
 =?us-ascii?Q?beDNHg17bXBT1NtzEa+My1vCMLjNU3kCv2GdQbHocBQlBshaRZVNLZqjHNC0?=
 =?us-ascii?Q?5bwgaqa2ky3AwXruvB1jXJ3sdhUjwK2USA22zegoxIjO3IuPw97ti+ETHCag?=
 =?us-ascii?Q?XDird4j+cpGavqHVDe09HvF3bhygg+WyuahU++oh6eFPemmZSTzQS1X8jVY/?=
 =?us-ascii?Q?gqOhqQ0hJLfAgNs91qBzoFTkvrOAx1mpFaDHRlfE5sSyrN80+Fra5/w4D9sU?=
 =?us-ascii?Q?pwV2NjvGZ0X5PywI0d9lc5apaeHtCkF7y0DrHXe2f749VExTTRlrqa6xFwuE?=
 =?us-ascii?Q?rc9p9taeyuIPbdcDKzDaXLkEri2zJvTNav4/YtyCZEHbg9sdC859EbOYatY/?=
 =?us-ascii?Q?8i290jDMbLap7QPH/BdC1Y4DD6+XQhrZWTt1TzgaSdOBXevwCS99QBULeOc3?=
 =?us-ascii?Q?Cd4ANTDC7YKkXVCEnm80nmkO6MqxMCFyPojlo0LKZEmTA2xQQTO5Q5uVJH+Y?=
 =?us-ascii?Q?pPeVRTnqsKp6uiExnBnBvPAU3hE5ModVbPy+o8OZMhraj+usx9aowAia77Gq?=
 =?us-ascii?Q?9ZuII4F1h79fPtMktm43ItbWCnZsqGtnec6hhdxAsHtig5xk/ie3GLH1W2pF?=
 =?us-ascii?Q?1/qNT3syguVzjS8XUkdZPGQi4m26OP3ESNNzANrmq3t0Fi/eXZoHRPKvEEyF?=
 =?us-ascii?Q?Vruvqr0Gsj3yXZh+esihh9J1gE1i11kURiG8PBqretBqVh3Dsso8YCIsSRVV?=
 =?us-ascii?Q?TCaVZS8lVmPkT2z+oKVV8K/z1IvMI5gkuPY58E4ZRt7PtN8ZOo/3gHe+5VII?=
 =?us-ascii?Q?l8kqecXZ4zxehKEDtW2GdKTprzdC0XB1my6KFsMMtOQDAZPwfJYywJV+B6VP?=
X-MS-Exchange-AntiSpam-MessageData-1: 99dgEVZDlf6AMtGF32t01hIzco58zfhB6G8=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: da423111-ca51-4b42-ea82-08df0efa0989
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 05:11:57.5863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nhjGsnyXerI+0pcgaH1+mqb4x8Lm9ts5ENJUamcQjxrWYU30J7P0ZfpP/TvphYo73CIe6PWQ2rpJPYrnfcy3JRhwu+CUo2X+jEGR6BPFdQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB2085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 05:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245525

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-31912
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/d3f358=
d3cffbe1ecb94d5284b3e81f052a0adcb9
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcap/libpcap/02-CVE-2026-31912.patch   | 630 ++++++++++++++++++
 .../libpcap/libpcap_1.10.6.bb                 |   1 +
 2 files changed, 631 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/02-CVE-2026-3=
1912.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/02-CVE-2026-31912.pa=
tch b/meta/recipes-connectivity/libpcap/libpcap/02-CVE-2026-31912.patch
new file mode 100644
index 0000000000..f32c5ed39e
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/02-CVE-2026-31912.patch
@@ -0,0 +1,630 @@
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
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ CHANGES                  | 1 +
+ bpf_filter.c              | 137 +++++++++++++++++++++++++++++++-------
+ dlpisubs.c                |   3 +-
+ pcap-bpf.c                |   3 +-
+ pcap-bt-linux.c           |   3 +-
+ pcap-bt-monitor-linux.c   |   3 +-
+ pcap-dag.c                |   4 +-
+ pcap-dbus.c               |   3 +-
+ pcap-dpdk.c               |   4 +-
+ pcap-haiku.c              |   4 +-
+ pcap-int.h                |   8 ++-
+ pcap-linux.c              |   1 +
+ pcap-netfilter-linux.c    |   4 +-
+ pcap-netmap.c             |   3 +-
+ pcap-npf.c                |   3 +-
+ pcap-rdmasniff.c          |   3 +-
+ pcap-snf.c                |   3 +-
+ pcap-usb-linux.c          |   8 +--
+ pcap.c                    |   2 +-
+ pcap_offline_filter.3pcap |  27 +++++++-
+ savefile.c                |   3 +-
+ 21 files changed, 182 insertions(+), 48 deletions(-)
+diff --git a/CHANGES b/CHANGES
+index 74f8ddf..ab812dd 100644
+--- a/CHANGES
++++ b/CHANGES
+@@ -1,6 +1,7 @@
+ 1.10.6 + backported CVE fixes / The Tcpdump Group
+   Backported security fixes:
+     CVE-2026-0799: Access M[] safely in the BPF interpreter.
++    CVE-2026-31912: Mind the program bounds in pcap_offline_filter().
+=20
+ Tuesday, December 30, 2025 / The Tcpdump Group
+   Summary for 1.10.6 libpcap release
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

