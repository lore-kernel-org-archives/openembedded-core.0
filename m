Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A64C982FA
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 20:17:33 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5807.1790021841236341143
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 13:17:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=vi7ikXCi;
 spf=pass (domain: est.tech, ip: 52.101.65.52, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t8K2DarSXxsSKRAmaC5gjQbEMmhKklNWLUfo6VO3A+Eg1KLmxMlp+axqTKzuprYbNuW5Lh5+Ho+og7UtS6934iXDBoish7o+gokv/mQarCMKBh/1GOyQlEq30Np041YuHNEw5Jt/s9MurCMGueYLnrQbyimLaE77fv+otd9ViZsDMp9A9zdutmA0Gzd9dyqMbPXx4izu0945UO9OxXxnKEhgF+9vEZ9mWUEbQ+bthc8M1ZD/IZEACrJPBnomU15oBlUynjodxC2ZRLK5rL5ErpUJp/NdoaK6TlaCKKw4XaoBREOBWOeoUGW4KlpMe5Bs/X+KtcGNsFQ10C8kocz65g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqLn+agFwRZya8Nlmc/+WoCsZiYU5thhu1qJhJN8OH0=;
 b=eHvx/LT99HnuuYERa70ZTNivvhz/Bh42kfHD/HlvdFLxGJHDF3dCnIRelC9RfH3h4k1PXnVsQCT5wVaKFSwScgSbYXAJzUsZKR9r7U6qoAYOW/G5ZOL2NDMpGuX/XVE5+FsKG5a6YFP3BzHE6ky+0x5pCWeBcyOHSbjSLpPC1+AfQy4VXFn2Tq8U8JQAJMCI6yA/IeZRIcJJ5K38fu6bV8vs+MK17b8DL8s3bIZuSY7ZXl4zmpRUzDADk/vFBms/6wXkimR3HKpY9g10OoDJ/sk7tRw9fZlTLQYNifDpJMY/lSRXnOarQKpRv4CNXkfaKHMrVBcUFrkcb12CkKErSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rqLn+agFwRZya8Nlmc/+WoCsZiYU5thhu1qJhJN8OH0=;
 b=vi7ikXCiJafW3r38hl3S+Fcf2WRuqV0d4L4f5CZIGknrCa7GSlHmgKiX6ww9nRbr0/1Q8V76/D3QD2q3H1YK/QFv9SLkiLlzCdfE19GA86aDrlxVomzkn3NZgb3/5UPtCR5OOXnhVedmWr/QAwezmNi0U1Vmi9GsPMXhSii/sGVq9us3S1VnNFMThtu0zPa9c0nc5ogSBe/PFxCUtmxV4GRisaBgYrAztXkd1fpf4oBNCnoBeOX8Clz0fLPk7p8Ot/bjaX2L2EFdyJ/0Kr+Uhz1s/YoGPuaL2vcjIPI0wGFQI+CADOvyWTyhugHpXsDxSXofsdL1f9Fexp9DaHkV2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA3P189MB3314.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 20:17:21 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0428.014; Mon, 21 Sep 2026
 20:17:21 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH v2 3/7] libpcap: Fix CVE-2026-31911
Date: Mon, 21 Sep 2026 22:17:11 +0200
Message-ID: <20260921201715.79085-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260921201715.79085-1-jaipaul.cheernam@est.tech>
References: <20260915194520.45847-1-jaipaul.cheernam@est.tech>
 <20260921201715.79085-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: CWLP123CA0050.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:59::14) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA3P189MB3314:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ac741d2-cc4b-49fd-302e-08df181d57c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|4143699003|12006099003|10067099003|3023799007|13003099007|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	tTAMWeKbC95EQEmgnfYy6OuI4Y+8og/PwRdMi4SE1MRBnpcIsZqmfG2laXhRy5oA4UNNHkpIcdjsImeMi0SBKmGQWKJyrvL/K1sg2mMVwTtAryKMaHtk1BoBAlitrStlaI0rh8zXkoDJCMqMNsyr05yETHh38aTbqumkrsVlR+4DJiFChFWseso1LcUTFvV3PWewz5PQyXdgZgvnmWRMypNjJd8EESeGd/clbdLI0HPM07juuuKQr0/qmLuOZnWJJdCBsPd2v8MlWCzIUXZEK30P/jtNSUfSa1bb0soogG6eDGJZ/nBbpixCLHwTuLS4CFJtouO/3mlxsr8izrirQGltuvPVv7lWXC00uV0hRJZDrKLQSltYiUuyxWauzXY/8xdluL3NMNmjef1lF8PT0T9BC1qhT4ozzwaIPUcOzf28PoHk8HCnexs535DgTJjs05PFlrnq+QS3cnoKjuL+6DEEJhqhSpueT8zC0w4Lc49eeV2gse34k+wA7JbyKOSDR4wW3+IaVgzZUzWjjNZDkCvENNMYeNjP689PAJMetQqTQE7o6YPHg3Yf7euTvjQGkcstQ2XY/kUo/xYjsbYSqNFXLMUelTi0BNytuCJAVLM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(4143699003)(12006099003)(10067099003)(3023799007)(13003099007)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?D/JYJuXf5EXpXPyJsl0Yaq5vne79EyvVG8FRDuqtdkwTxCyYQq6Fd9JP/0OQ?=
 =?us-ascii?Q?+IgycioCbFaLOftQC11P0zcuD2VPj2JdzBa3RJIzUbZ/nADI+9oFtC1J9foy?=
 =?us-ascii?Q?/z5ppW2EfU3Gw/MFJ77xuE+XjC+Qm3ztuEXfpiOkL31H0YOvdO3lL99GpeTD?=
 =?us-ascii?Q?VRxdfsXZsQpHXGUZpdpqKUaQLd3f7n/kNzLGz0xRV+eSn3eM4GdoCug8ASNW?=
 =?us-ascii?Q?k3G2tfNdCoWn01+QXDxzeh1vbzj/Z1dchlDsRja8a6cRm4xZbrr3wrC3cT88?=
 =?us-ascii?Q?JA8g7A6KfXR8bZ+R+em7xqN3f9FWXzLHJAy6ICx8qzYo7qf5jbZyqbynp+oz?=
 =?us-ascii?Q?mDIOhEmjc9MDi4av2zhViWrJvrShbmWQuhre9+g6MJ8t757XhOAl1o7ddUqw?=
 =?us-ascii?Q?4fU6eKvIG7D9PiHSwE+I9F5whxWTmlMUtrZbSSANhAFnyOAlbWDMGuqPHJWh?=
 =?us-ascii?Q?1RjJymJjogLhPyoQzF0WWMOC6dnUKlUEKBKDkgvM8x2BPz0CdyMfaL7CwKO6?=
 =?us-ascii?Q?wrsHBOth5F9zYEXhOvqLDpM4Y8EDpzPrVgYTBiRUmHcQ6Tr5114BnLoiWl8O?=
 =?us-ascii?Q?G9AMj2Bo5XLMFB2wzDt6jPsavWPfpxUSmtLF5eiWN3Uq/AmCUUCnR4c4gVdk?=
 =?us-ascii?Q?Op11HTKqzl1N4Jg6Dg6sUB0eSRGMtadNsYSDcbO7gQNGo/PRCsTlPxyt1zqE?=
 =?us-ascii?Q?7MpSt98/E7gaPTC/GVPQ7weAdCyhjXSUEfbKvIH3ZuJgy+vaROPJNKU7gxP1?=
 =?us-ascii?Q?sBsceVN1x9YUM78tjQ6sJh2F2YCoz1Jn6pWT3LDGCrg/Ob4X1czQ5EPmjGI8?=
 =?us-ascii?Q?wy4uygw7hmoUeB9fBhjEtHcZsyRCHMLZwbhLe+ODPHUE4Zf6FQi9DLB2uHbd?=
 =?us-ascii?Q?Z83Ok0J9p1leu8Ob973B09mIDwlRUma3W3mNoe5hjFtv8SZNfrgu31xMXbwS?=
 =?us-ascii?Q?VJvs30Q0PkDjsDO6mNiggGZgsl07u/IjDtAu9qrMtluKd+VHJzYy9lJfGHoV?=
 =?us-ascii?Q?znRKHpRhXJFEWxOne69D8XqQrBUcEwUkyK4Qh3UPD4/dNqB9JgZ2BUcGdCtJ?=
 =?us-ascii?Q?zmwJspollPuZckAIFxukpApMsHC7sh6OmM43VzDjVSeo7NeSk/qQ41UGDf4P?=
 =?us-ascii?Q?6yPgPy3muIkONt+TcZdLWEjjobSZFqj4Cjqzh32JXKdShC0xNO/XUvVrTjji?=
 =?us-ascii?Q?WskxDSQjKDg+11AfX7iHLsbHwMGmxXwQ0IZMA/TgcfstEcE443giYak61RYk?=
 =?us-ascii?Q?T5t8vShJWEmFWPv8PLvsxdeHQ8Nw5MxcjitjTo0PM3dj8LJcy4ThlcxQ9CBZ?=
 =?us-ascii?Q?9WlgK0oMc4+WajBLKJGbHcSAKnEMtWVOp6mKHWsV5Zxw//XkzAmXmbF0tI9/?=
 =?us-ascii?Q?xG5dDX8x4kTQVEiXBJF+51Pe2UcEyn2unwLBC8dXD3TdIlEtbN134KE+IPpR?=
 =?us-ascii?Q?+7yzEkbv+ktVfLHKa0Tj2GEk8J+iOlrt0CVNcSFqs2C5c/vxWjGWHdmYiyuf?=
 =?us-ascii?Q?O9Myoyju80pL49UYNx8ipRQFtcsqptRIlAyQusRKw/uT7UH7po8fQe/oGnBG?=
 =?us-ascii?Q?GY6aGvIE2ExPuKgpakxAMOSRM2CYzNuE3Od2ENsELvBdZI7JiT8Go9xnEV9f?=
 =?us-ascii?Q?2UFNIhVakMtPz+yoFaBP+/s2nZVEHR/jRJu0aN6Ctn66UzBt4EX3tmiGlxxz?=
 =?us-ascii?Q?jT6Q20qQl4XCLpgPWG+gm5qC/pKIRvF/l8fGiQov7Jb21YfSQgvHt5xIGqFw?=
 =?us-ascii?Q?ERT2Xt74nA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ac741d2-cc4b-49fd-302e-08df181d57c8
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 20:17:21.7022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6NzbyJljZf0DmuW/ysLqY3GSUwj+L142a6pzcw0J5fV6bEDSXO9LUh/IkElT8vlVhCUoa24mycAG1NvH2es6/20LhXnHKb2cD1Azxd/g6Vc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P189MB3314
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 20:17:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246351

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-31911
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/a715bc=
dde830299cba4171514385cb17ec19b6e9

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcap/libpcap/03-CVE-2026-31911.patch   | 45 +++++++++++++++++++
 .../libpcap/libpcap_1.10.4.bb                 |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-3=
1911.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-31911.pa=
tch b/meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-31911.patch
new file mode 100644
index 0000000000..a2d00d8c53
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-31911.patch
@@ -0,0 +1,45 @@
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
+Notes on backporting to 1.10.4:
+ - The upstream CHANGES/changelog hunk is not backported.
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

