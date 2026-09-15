Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA7DC982CA
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:45:37 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5557.1789501526272473796
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 12:45:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Ubt8gSIp;
 spf=pass (domain: est.tech, ip: 52.101.66.7, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K21c4wVLwxhulfjeg9C25DxuBeYP9YgRxwJLQtMUfWmn/WmBsAd9/SID+7J3snD4FXib1Y+thuSpIajEpoBd1zlmD1koEvK6XwtMczN51zgWlNzg9ym6QOs5DSsalmmGWHPFStWCUIlRXGalDFZOY/7AsP4j4cJlZ1veCKbPTmwwZVrW3Kyk7tSPIjihp6FNkLgnzC4a1b48KGOnXZR6W71otJvt2Qwq9gUAlRZveIphxydRWCEXy1o6KMEt19QMtFQepIzI9O1YWgwdT/qewjnfBouT+a0TziyCgxfLUakSbqZM7IE2iuxl2Uh2ffdjwuQi8alHn1W2If4fYxtqug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwbkjW/B/k6ixh+PPHOcvSydbNpV8x6SipxprSkPatQ=;
 b=p1lmBdB5ZP2W1o0a9YXRdYy5O7siab1ypwsARN5zRGQPwWXPXs+gkp0CFzylwcRHCbYm/msDxlIqMG9Iiuo6TmopCa3KHdleuA5cvwStYTQnV6uxSB3pPR+WdalYlgOJIo7l3LZ13j5j9Typ+hjwMopxbSnHvriW+xBir2o4EDR1rLREgx+Sr7DJ+yfd5Rls03LCgwU5NNP9IHBimU1aLLQ11j5H6Dq+f9R0s07Z6oDl0KkmWcM8GturirYLY5NcypvCavQGfJVyL5IN3YeXQ/RWNKQDJwZkJf2NpTL+oKWfTuCrQD4yGZ7z+3GzDsN+LA53057mtfppz/YX1jXqRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwbkjW/B/k6ixh+PPHOcvSydbNpV8x6SipxprSkPatQ=;
 b=Ubt8gSIp33YMjGOTNO8SL2QankQUFc7sI2bVsSJAfb2ib7KUHSXbpRIjaLVMdNZ5B+QF+Ifendi8ncQu6Exhd3t08/62YxpzhKNaOMtZtlvItSU6FLvg9d8QaOKMubAto56GDzLQ3dQZlJiQ3xFDGKsm98tFpSPZzLBr6gdd4GaQ4hdbqYT703uvLyXZrJlfMisOh90sU8JK9i0GzfJHtwdl2hPmkLrpo9MlwVM4JZ1n7gLgu7b4P2qGV6jgIO0VwQn5sEmIYpMN+Idjmw7/jOm9tejvwLpjWGxRBX9Zz7PVwj4v7vlAPkiu2ySWyLfVjPclObEMmwMvrap37nsBdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PA1P189MB3172.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4e7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 19:45:26 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 19:45:26 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 3/7] libpcap: Fix CVE-2026-31911
Date: Tue, 15 Sep 2026 21:45:16 +0200
Message-ID: <20260915194520.45847-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260915194520.45847-1-jaipaul.cheernam@est.tech>
References: <20260915194520.45847-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0059.eurprd04.prod.outlook.com
 (2603:10a6:10:234::34) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PA1P189MB3172:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ca8bbb5-8ecd-4070-f762-08df1361e3ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|56012099006|11063799006|10067099003|22082099003|18002099003|6133799003|12006099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	7GFWlkuYGvnPCurc4p+y379M42Qnrm2RZu7xO1Kll6gSwMHR3gh9erKOK40Mo1bZnEPFug5vamT1XP1LvD8OH5RJJU6B2ZPwkgZ0iPRTaqy5iNulhiGxdM1wYDBWYJhYEXWC2Trk/was0dilGmEOG6SlkE9rOJFa0Zv+CRb8gHys82Gtf5vZVFtlSZ6f/a4e2EAb6MkqWySf9ors7iPk3Qzf26f/chO+C7frgUB9p90hOePL8pIJ1M3KTJiyy2kuNWA7PRlRLQoUCLCPvEY8BB8j+MZ52BKXhfiCOnN3tOuHR2Nm8DD/MemJGZDg9lmfkG9ucqGHLMVjvYYX9bCeZLMRys/wXO/2ITSHGFKTKTATfUB9a0zBM4T9u5QGvDOP4dtfWGoBG50pKpqI2AEQhoH9oLrBD3ZyMnrpcNPXUCjIw3ehhVvg3eIvvLALpK2s57G2Ro/H4iV4FabUe2IuGXKSP3zpx4mirw6JPudDUqyuC3bwsruGgRTLoVy6SxkbT+XtVYFaYivkwTPeNp8drfEuHs/pwkQl4xTp5meqAlMKpdLEMPpjHJYDK3tk58Vq6zcONrcKe4/qq7hXIAZAa6XVzDJGpmyZpGQxIqwa2GQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003)(12006099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Y+p/Yd6PsS6zWvIE9sCIkakK5rbSg9RS4NMsGtyJVTKR4oH8+XDZ9OjJEYYI?=
 =?us-ascii?Q?JUzsmRu4+fQdGUVqLP4Ac25J/lBTkWMwKFb/F0cFOMht7aIwxjrytOR2i74Z?=
 =?us-ascii?Q?49naN7woaBW7MjN6Yz5is3nxRycifivnPm7pV6CUOECHwEdcFxDgG4WH5Nk1?=
 =?us-ascii?Q?o4cL4ogsAaWrSQja2I4K3s9850zykA1Kv3GcbammJJGp0qkpvpoVxPc4Tvb5?=
 =?us-ascii?Q?o0k9gIYGZO01Y+ea63XZGZTAjZh0hfhBtxx9U1OSCZH9g+VIO3Jr3QJr8Wye?=
 =?us-ascii?Q?E6cZemA67vkv7MwAB7if1WFRtVCvdsB7O25o9oBVydabAmT/ySIFzMxreh9J?=
 =?us-ascii?Q?LAdCFfcKIKWWUq97QIL/3wXIICmENaJTViqyLvey/ORE0y8JeUk0JfFKcWfv?=
 =?us-ascii?Q?LoERvN1uGKhLikWp545l/oY9m3yvbUJYf1RA1dLEBfXp3yM88RUitVTMRafO?=
 =?us-ascii?Q?7ve1Yz9xmicXOy04GyLLp7EERy5MAZe4aOgXAUKD0B2OCvgVPbfeEZyJDxUa?=
 =?us-ascii?Q?kecL3W+8E3jDTRXCtjCMrKWlO4ZX3kZBolB+Jq7SvC22qZAeMN7c4YjHM7nd?=
 =?us-ascii?Q?sNK57zo38uwPmGIwy1bWDBoPjUQqap3Z69jEOT04as4ROL5uNL3+KRtz8m77?=
 =?us-ascii?Q?McflnOT3IB0PzZMA/8cehEZ8IUqDMMiQ7on50gtGUb/6Zq/o8fIIk0XlIgNh?=
 =?us-ascii?Q?XflX1lW48rpp1sRN1tml6nuq4qg3EpqoILvJzJDDS/FBmwssgDzSLtsnDyfv?=
 =?us-ascii?Q?ENi05bfsoz7bcorzdDWm2xMvcB5bWeq2v4a97IlpXfk7B48ESWsC1dLfNqZx?=
 =?us-ascii?Q?/+O+pjdkcJs3Z7qvKB++89qUu1pxdTWOks2haYYisa6fTTo+GD5Zmq7aI0OH?=
 =?us-ascii?Q?bTxXwnAGT//agYVN3NphdO2noXAB7jNs2l29OCSgauOQHDRC4/V5DAx+erNp?=
 =?us-ascii?Q?Mfz3fRfaCSpUa2hvp9ikp53ALefLyv1TUDVi90S505hPKDxvX8gq4m77s+YC?=
 =?us-ascii?Q?FurChelO5qT6u9MPFOJ2txeM+9z+7m4pOUY+xcu6VybS1QNiB7rKyfZnJU1K?=
 =?us-ascii?Q?C4gHV9uoXRIHXCaMNcf5bkTb2MmB0VAnTc0kY9F/r+zSovczdgVoe5djO4WN?=
 =?us-ascii?Q?1ejtKDoFQEOaPxzhF5lvQwNdgjJQW70++/P0UP1pl7/u+RqnQ1CyxEvkyNQ7?=
 =?us-ascii?Q?7NaKHAeeIpXSaOtIG5EwGI5yLBLiW+RbIwugr695nIPJwhmVRbxLXKXFDU0a?=
 =?us-ascii?Q?ymq3Htr9UVPBCJykW/6VEXePPBuYgsyfVrBs0HYup9zHje2Z/FIu9GpmGFOj?=
 =?us-ascii?Q?nNNncbtikgo2rw4xj09dtVipCJHdYXMswiGozFabFLiJ6qclGifAJhebiybF?=
 =?us-ascii?Q?9yh06KynxZRMHKi665sOZsu5qpH0CsK5tzLO9USica2+zz9ZF0XY6dLVdjtu?=
 =?us-ascii?Q?iziS/yf/0wRdMPMZKF0kJU6mutMFlQN4R/Uc2/SfE8gjoP9XD3VNwCV9lvcT?=
 =?us-ascii?Q?jBlqFGEKXgGwjnL7DL9KuhgXOwjSR4pvOA0QF4/Qp2ASRc96BM243+ruXWHU?=
 =?us-ascii?Q?nYUiNmuUYutz1iZXYsiiVWwQKdvnoevrmDGPgk2MqQbjAhx0qAuXencHrfu9?=
 =?us-ascii?Q?Oq9yT7f/rs0GyMt+ldSftJgqcfEVdkYPUdW1I/nwak+PVGsE6QUejsGYN0Sl?=
 =?us-ascii?Q?PL8SDrdMh67NT8UW8Gsm1mJbqAUhBAcsKHT//NMcYHJs6TTlliyOUlyKKV4d?=
 =?us-ascii?Q?fcLUJsyFzw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ca8bbb5-8ecd-4070-f762-08df1361e3ba
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 19:45:26.4489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5wxRnAj9Vs8WAgA5MzhoNcvpwLJHgNkCYFzxYh4ux8oF4hybrdwbuRkCA2NXe3BlZgT3VbNLJeBCC8ztAP/UW/hHW3VVy4dvERPk6WhbUyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3172
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 19:45:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245894

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-31911
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/a715bc=
dde830299cba4171514385cb17ec19b6e9
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcap/libpcap/03-CVE-2026-31911.patch   | 42 +++++++++++++++++++
 .../libpcap/libpcap_1.10.4.bb                 |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-3=
1911.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-31911.pa=
tch b/meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-31911.patch
new file mode 100644
index 0000000000..ccd470ef7e
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-31911.patch
@@ -0,0 +1,42 @@
+From a715bcdde830299cba4171514385cb17ec19b6e9 Mon Sep 17 00:00:00 2001
+From: Denis Ovsienko <denis@ovsienko.info>
+Date: Thu, 30 Jul 2026 13:34:08 +0100
+Subject: [PATCH] CVE-2026-31911: Fail opcodes safely in the BPF interprete=
r.
+
+This vulnerability has been discovered by FuzzAnything Organization.
+
+The current revision of pcapint_filter_with_aux_data() calls abort() if
+the current instruction opcode is invalid, and assumes this never to be
+the case.  This holds for programs that have been generated by libpcap.
+
+However, this does not necessarily hold for programs that come from an
+external source via pcap_offline_filter() or [deprecated] bpf_filter().
+Furthermore, this does not necessarily hold for programs that have been
+validated by libpcap because the current revision of the validator has
+gaps in the checks and accepts a number of invalid opcodes (another
+commit addresses that).
+
+Thus in pcapint_filter_with_aux_data(), when the instruction opcode is
+invalid, just reject the packet.
+
+(backported from commit 4ccb54bf4946d31a248ec93bdbeaabd97fb9d8f7)
+
+(cherry picked from commit a715bcdde830299cba4171514385cb17ec19b6e9)
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/co=
mmit/a715bcdde830299cba4171514385cb17ec19b6e9]
+CVE: CVE-2026-31911
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+diff --git a/bpf_filter.c b/bpf_filter.c
+index 2ea11d46..d6e4b019 100644
+--- a/bpf_filter.c
++++ b/bpf_filter.c
+@@ -146,7 +146,7 @@ pcap_filter_with_aux_data(const struct bpf_insn *pc, c=
onst u_int proglen,
+ 		switch (pc->code) {
+=20
+ 		default:
+-			abort();
++			return 0;
+ 		case BPF_RET|BPF_K:
+ 			return (u_int)pc->k;
+=20
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb b/meta/rec=
ipes-connectivity/libpcap/libpcap_1.10.4.bb
index 323cca3d98..5b97c14e85 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
@@ -19,6 +19,7 @@ SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.gz=
 \
            file://CVE-2025-11964.patch \
            file://01-CVE-2026-0799.patch \
            file://02-CVE-2026-31912.patch \
+           file://03-CVE-2026-31911.patch \
           "
=20
 SRC_URI[sha256sum] =3D "ed19a0383fad72e3ad435fd239d7cd80d64916b87269550159=
d20e47160ebe5f"

