Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC99C88E42
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 05:12:10 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6892.1789017120475080008
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 22:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=MtxAtF1K;
 spf=pass (domain: est.tech, ip: 40.107.159.68, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jgzCoRN9wjN83wQzpnqIHIHvElYHdXs17HpmBkd9uUzKztyHEWuLfgr/Py7dAMAK69MBYxk3tSuRohn5JLXQDjO0fFzYuxdUaTCs2hNBfmIzt1KcBrre3PcI+t73wLEGkJly3vibDeV5J0rpDLZRWrUcXNlRfJT0E5bT8Rya0CyvHMHKd4oJs8qsLmCiw8sZpww4TJvhNwLhwODG4vCLi2AZiGPG8Zp3SgelOawOn7jmZWWcIFA0UBHafYFQLA1jJ3payifwwCKSsczgTdXBpGOD8I0OAVcSsfYtQjbI9wCWAjQvtb2bRIffb/m6k08zxHyze09hyn1yoFyOFbpExg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gaeTFqqh62nh4sstXXyWS1rQfNZQze8tx09vj+MLMyM=;
 b=WKsgfzibqXq0XlkA6ycgCCsYJ5AyVg1r6U/keGR0qp2yRbPV2U6cEKQEKwm23SyEIsSGPqXtJRz8FHZIwvAFYyyDz9M4bMSqBQOgulm27YRs7NBVZ79gPt9evkjA6Hs8Xfp4Hp6fhXRcMaYzC2NTQxGMMGKX8CwRYvS5ionlqrvJXgX8Q4cPGRIu8e3ywf5BCLWixGzthGRnz2gR0w/pTg6alGGBfmU3L5aJyFKDO2yl7tLvT20EkXDYybPVonMfafSBhDh31WUNUc4kW6H5wsy7150ZBRXicyHUDs/gRIf13+KWjRIeKsCuZ2jt3Y1jH7080l/Dl6YYjbVPhJa9uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaeTFqqh62nh4sstXXyWS1rQfNZQze8tx09vj+MLMyM=;
 b=MtxAtF1KAdOK+tiRuR6Zuy59A0ptvjMHNvj6HC7EIHw+OLtgl48X6eV8vnz8lyqp+DGzzabMl3s5+TfI6Tr8AHlpOUvSdkdXEdUcYro0xvKQ7cjlX8Ehy5YzDX2d7Iax69vsb2vg3Ev6hyDPxnuFNUxODMMwCCh/SHv2uTSJDIkCqFmgBpRMUybM3EIen/GeyJyCAfGLsSjx1MEdtvJH6RxtH8X8uv8d5S+oVf5oJJLD3IZCXYgw8mFwifzEClGeeIoTpoC+8VWqkMf2skypxpPyawLoYqozKqEQJODHVBURgsQqcBQHMIcmM0Uw4/wAVWm2vBeGjHDlYE+Yv84QCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS4P189MB2085.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:514::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 05:11:58 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 05:11:58 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH 3/7] libpcap: Fix CVE-2026-31911
Date: Thu, 10 Sep 2026 07:11:50 +0200
Message-ID: <20260910051154.30595-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260910051154.30595-1-jaipaul.cheernam@est.tech>
References: <20260910051154.30595-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0067.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::6) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS4P189MB2085:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bcc02b1-751b-4817-61f9-08df0efa0a33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|10070799003|1800799024|23010399003|376014|10067099003|6133799003|3023799007|22082099003|18002099003|12006099003|56012099006|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	gbwIwh1dD9PnsFzbIUg+ZAruC0PsuH1Nf3hTRTv7ReZCtGTwahA0D4hIwm/LevctQ/XFfumv2Qe6lxySEgjcHNqJ95uJiaObBYfDcE66LyF4tAAV1dodWb89QmjzgGB0p6xRtdeZo4V3gFnAAjQncru0T5MCnnyvcl+RQYSmu9KCVq3MlIBuFOv0OOKbiQHNF58rYdrhHHS0DbzT4EDsVQxiCj+bzyZzELSqdaN4043ek5Vzr2nEgA6nrfE3MLtqjRcdK2t2/HBF2xhQ4L/q0903B0U89yGiulsScbTV3Ue4f451+bK39VY90ymHmnZbibKs7jFRhxvpL5tHNRXKzXEv3dgSEozTkjbgyjFAUkat6wGA+ap+/ne/iW/6f0bpTBoMA1MefZ6mgsuUldBselnf+uFv0EW8r1e9cgSJuhmBZ/lAXg9zKXr34ortabx8sKMmmiSZSlaFk4ycvUVlBADDPrx672sWlK9MgGxnEvwSP7GbzKLiXDNz2+Eow4rW94Fk684hlx7vNrkfWfTsqqGrGeOEeYw5+AYf9gXpRo5i6sJ5iRQEo9TPRvVtM4eYdqJfQUjhOMsu7XK+0gX8uAd/tFOcIxJvIkxqYQuOCoPe5wE8PsAzseYI+UfgM3Tt
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(23010399003)(376014)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(12006099003)(56012099006)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?v/Ctgc4Wlmeum9/HtqLDIXwnarHKel69P9P3gPqczhM95rWep9L8/5CC8Uex?=
 =?us-ascii?Q?djfNGYNxNp+b5RCXm8AmMEEAzUTgAolUovqlyVXWYd5nEBMB62UfwQGTfUbg?=
 =?us-ascii?Q?MyPoA2K04N/6Uwu4gZUjLbEL/W/0NtrQ3cO9OdJCwErKTFonSgEQ55PNL3wZ?=
 =?us-ascii?Q?NTWSz/Bk5ncf9LYI05zYn3gi1jvR1UysBsLYTOv7CNZoagJQdhO6Z8Qa11FA?=
 =?us-ascii?Q?6+nm04i/kxEr5vo4K2BCyQQ+T+ZAyzvgAlPlhvZrLyPd0Hw5MrYkJP3c0p+U?=
 =?us-ascii?Q?oxCLpLibx0A3u56iutK/c9lfIoWTrNIF0rH5zpKYoH6O7aqiA2EN0DZ4nRc+?=
 =?us-ascii?Q?OJtx2/3yEc7dVX/nvkLmzX2xLBNZwh5NyrH6lBCYejmBNj3I5UCmgryVb3xU?=
 =?us-ascii?Q?LEovdpMaycAqeRjBXD5yKW03L3MhRSfelvGYmpVXE7FG3ypxBATFDeAV4RbG?=
 =?us-ascii?Q?BR77ip6bvaZNykf5VorKmZmXsqZNgiqWJdV2sMPFAYtjyu2W6uD+arplMz2a?=
 =?us-ascii?Q?0/+qWiWxV/p1pAplY2LdY2n6hhdOymdbug1dwAwbMZTvrSzEh2/IwiATo6EN?=
 =?us-ascii?Q?zk+UNN5RQKFjuYOtdzBI9HyQzZuOUqDAO9cpsJI5sXI2MJ+38rYj6X4OgJr4?=
 =?us-ascii?Q?xQS8exeTshwGrVyorWb3Uqf3OGuYc2WlV6IFM1AzPt6excqBLp9YlrP42PQ2?=
 =?us-ascii?Q?pixHcJpO7EbOYSCWuwkibPNtD79QyIlvudrJcnEvbeUbHJNZRUQO6RZ5VJE3?=
 =?us-ascii?Q?EIW2KmNa/VZ8I+/Fl/0Ln0x3t0RXpWiWvkT7ZYDwf44pylFGIAvo7VY5GxNi?=
 =?us-ascii?Q?ohPEMLCXacb+cWxD5GTbAtWSd7zsTQimtgiu5naqPW5mjh7SwLf40mnlx84v?=
 =?us-ascii?Q?xmJ15h/QF415UJ2Qeo3n5SH0q5aRGl9Sj6YGDks30nNK4pNeKAPGCMgvi0wO?=
 =?us-ascii?Q?RfiOvNkXZ2o3iQOPd9JklTbo0Rv40ibCTqvVkDS0MYgu35be4ebdjvFkMgtt?=
 =?us-ascii?Q?Kei0oaU8HADYY/S+k3yExfJORRq2g6YnwePoFhUj7p1Rp6xcJAeLS0iztDip?=
 =?us-ascii?Q?8nTftkH5pFCPLaYmXMewnIAE/5h5sebxL0QQss+tfRmSCoITLDSy8WSXiUXT?=
 =?us-ascii?Q?kK1R9rOE8xaU4ykLJreTghiL7CSjesIgcBCtoohNNdx3oB+zAjr0TJfQ0j+0?=
 =?us-ascii?Q?UCPwXo5G3ZPJrFby10OBR1Xjk5tCT8yBR9AD+LTY1wmFhm43mLpwFBzQlHO4?=
 =?us-ascii?Q?0EvHNFZEWztmit8k1L26Jo0rcHg3Fg6vWe19QeerJye3pxb4lPT0VQF7AWnl?=
 =?us-ascii?Q?9PeCbeaY1JOHS49ZgBnOCH+vihBjwh3Hq7kpGPdNdUHTzCiL/JjCFm04mAqo?=
 =?us-ascii?Q?EumS2ZnJjLVwYVPqqZSmftYM37AAdrikE3JgeDVkoYPqKwwFj6IA515aKIIH?=
 =?us-ascii?Q?1wansUXiFsxjwjLu3ADwL0PCjjJIyLpAd2rOjkwRUiVnmwVrWKz8oouc5IxL?=
 =?us-ascii?Q?w5P1p3zGzvlt1egEfQBMG74Ps/XJUqKwcxPhU/0tWILSfDtdFis9/VXCaAWb?=
 =?us-ascii?Q?6k65kkimWfesTT04yHGeWuXGGoUhixIVsDvN5qNt9Mb7L2I7sdzBwFuKqlMz?=
 =?us-ascii?Q?nISl2xHtCgARMpSicwhytsAS9y+ppeN2MVyt/Bx4FdcmWaLjY5r7L2AISabb?=
 =?us-ascii?Q?0qGKxFIEP2HwpXjJueqrmIjWll1mmcKsYUNkZVjsPsRDMCc14Je2B8M21GJj?=
 =?us-ascii?Q?7THviq5sV9OtOZ/haVv/uQ0CqvJgLZ0UINPnywWDX33K/jnMfZ3aUwbzIMDJ?=
X-MS-Exchange-AntiSpam-MessageData-1: AgUfez+4B07N9C9kevxgnBhDLsgO/r9+3eI=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bcc02b1-751b-4817-61f9-08df0efa0a33
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 05:11:58.6668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HVpZuTcd7EU7wyD45knLYj0MsgUlI9sC3QFbve9LCE8BdaCQwoVX91s/yxGEzZVg0cGNO2eoGWBzx1jSguSadDJ2VYoigFcoCBDUpH9UKQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB2085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 05:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245526

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-31911
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/a715bc=
dde830299cba4171514385cb17ec19b6e9
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcap/libpcap/03-CVE-2026-31911.patch   | 57 +++++++++++++++++++
 .../libpcap/libpcap_1.10.6.bb                 |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-3=
1911.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-31911.pa=
tch b/meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-31911.patch
new file mode 100644
index 0000000000..a0c53f9a09
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-31911.patch
@@ -0,0 +1,57 @@
+From 0067e8fd1f3caf866da3d95508831389f3b20e11 Mon Sep 17 00:00:00 2001
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
+ CHANGES                  | 1 +
+ bpf_filter.c | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+diff --git a/CHANGES b/CHANGES
+index ab812dd..f0b5974 100644
+--- a/CHANGES
++++ b/CHANGES
+@@ -2,6 +2,7 @@
+   Backported security fixes:
+     CVE-2026-0799: Access M[] safely in the BPF interpreter.
+     CVE-2026-31912: Mind the program bounds in pcap_offline_filter().
++    CVE-2026-31911: Fail opcodes safely in the BPF interpreter.
+=20
+ Tuesday, December 30, 2025 / The Tcpdump Group
+   Summary for 1.10.6 libpcap release
+diff --git a/bpf_filter.c b/bpf_filter.c
+index 4f9adeea..f8b842d6 100644
+--- a/bpf_filter.c
++++ b/bpf_filter.c
+@@ -152,7 +152,7 @@ pcapint_filter_with_aux_data(const struct bpf_insn *pc=
, const u_int proglen,
+ 		switch (pc->code) {
+=20
+ 		default:
+-			abort();
++			return 0;
+ 		case BPF_RET|BPF_K:
+ 			return (u_int)pc->k;
+=20
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb b/meta/rec=
ipes-connectivity/libpcap/libpcap_1.10.6.bb
index aa5265a54c..da218bd87b 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
@@ -14,6 +14,7 @@ SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.xz=
 \
 	   file://0001-Fix-error-messages-about-32-bit-integer-overflow.patch \
 	   file://01-CVE-2026-0799.patch \
 	   file://02-CVE-2026-31912.patch \
+	   file://03-CVE-2026-31911.patch \
           "
 SRC_URI[sha256sum] =3D "ec97d1206bdd19cb6bdd043eaa9f0037aa732262ec68e070fd=
7c7b5f834d5dfc"
=20

