Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C776BCC6B2D
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 14:39:16 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15337.1791988748056411672
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 07:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=KthuLjY9;
 spf=pass (domain: est.tech, ip: 52.101.70.53, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dqQEPC7XZIQdxpjH3wQMEW6zRJAnqcrJDslu3LPtjezbSyPwfv+N0JvY0V1nGfS2ikrZ/AyuEZhsMt8yOfSat9ap78adR5lhlavJRZEn80efjV3h2BkQ80SECjzAMec9oycS7bRwJBgp8OUMfhb0K/f31gHP6tZQxFFSgGP0BWAvoC16S5moh/zUICOg3OKvSHlXCD5Ab1Fgsa2LwS4vqtSMo94PcetMuETdqvSnmcCzSTnVzstmJODdG4G9SyjUQG9bFDm9KS5ZHEEguubWDFN2JIJDN4c/7ftgd9bXO/8MZ/NDNLhzvU8lF5hRF29GaMc/pgI9PIL6uUOqZzTWFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgt16AUjbcgDnzDRzB8XHQ62KaxkiO2TMQRLb1suBos=;
 b=toZG4H/1FCCisN+AVZnm4RNaZjP5O7FUulk8z71L7WDLmi2Hb1RDA6Y1UIMlcsGcqWoAoxqyzkS8AGgl46IH9G/xigYz35S2Qrp42iTWwQNX+gOT2jrVOI2R80PcbfUjuZV7wWlxk6sZ+eWqhC4bdvW4TnNv24b/peQOKQvriUGhLwzOTLqaUa6mJw+gUDAWTieRJsMRBBSC4LSP59VoytJ5kF/3X5wkROOuH4k17WHTfYWOgCHTXQ1hVC0WiM1WpiD/OJ78ZbPhMHYo6BM2l4zc+xHGWGKqq2eTKU194L1+frucplE7P72R7exk+1BC6SZ3/psvGk88Hiti27fDXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xgt16AUjbcgDnzDRzB8XHQ62KaxkiO2TMQRLb1suBos=;
 b=KthuLjY9KhXXdnW/IrkxiSak65dl+E2vfpZlcp1LcgLAK2dD2l2I6y3FuaYLdOaog2BPfU45BwtaU6gSzNCiOhAVEpi3EgMbJWd/fyi/XjNKPZoz1XMGGEjvLJA9I5EqToavfgNCIJ+zOuGSTQmpFz6Dle/JwcpBI25GVQdxmck/SBw/3gF8+PI6b399iYxMD3q+XQQPADD3Yu/m8RqOQhWNE0qYHBWpAXrDcIdy8g+ynMYoFoFSo3nzs1dSM4/kfV5rS0IoO/bYshGafl9b4yuii2DbOed8aoxxSuwUO9E4Y8l/JHxw/HfZbBTtYRgkMhjLX5a82miee2784O3ePw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by BESP189MB036075.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:138::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 14:39:04 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 14:39:04 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH v3 3/7] libpcap: Fix CVE-2026-31911
Date: Wed, 14 Oct 2026 16:38:52 +0200
Message-ID: <20261014143856.74426-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261014143856.74426-1-jaipaul.cheernam@est.tech>
References: <20261014143856.74426-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0345.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4::16) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|BESP189MB036075:EE_
X-MS-Office365-Filtering-Correlation-Id: 225c8b8e-6c47-483a-a880-08df2a00e519
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|12006099003|18002099003|22082099003|10067099003|13003099007|3023799007|11063799006|260925022911599003|260925021311599003|260925021911599003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	58SPMAGJZcunXklsBnPkp7Gi0WWH+/3mwM0INPxsdlSOaexu2lYf0aLrheukLgoK72JSzVwfU2cVjD/hmk3P4jitnPxScn6Rb6HSPgcm9EC9lQrCJ2Fyj6qfYpZKe/hpodmVb5cpmtl0+1LolspizVofqMzDWZhS17ctXGspMdKNH4vXGiGHa3GA8mbvD7H597s0f5q7kv3gSinMB9DbysVLSf8vcN+957awxZn+fBfqbfz4AoerJj526vtdLfBzaeMtkiy1y15orBj/vSPu21KwyaM50OiCsvV9I2jDhlcYq90hT4kPirycWhG9CYR688tjadtjdnQtc5H7rWWqGbtQntyfsxrDbaw62z+B1srveq3lgOt31TmGOUuZASFNpFzSKtL1in+HHZt+SGzuCrQmWhcyjd/XNHXgro7lhPM6IhwzjjlGmhXtIsBkAsPBzS7to5d95SzYE5lbR+nHB77hpE8mRRimAm37NysBPGRyd85REHpj+lYXziz112MHblT0LbP2hsAsIv7N/y1pXTFw2Bq4D5oT7ejZDy/eIVt+Nv2f+x3wjIo3d1hg0V7ANQCnL8diGr3863qL9JgnNl6BnwpxDAEWZXcu6nLyp3o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(12006099003)(18002099003)(22082099003)(10067099003)(13003099007)(3023799007)(11063799006)(260925022911599003)(260925021311599003)(260925021911599003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/6ldgA89wWo8hnLdQTyrhVbj/7Sex00AV7S8U7AJdZxRuvi5WDoDzrlzO+da?=
 =?us-ascii?Q?oDxzZYvGcK0XftFJXDCio2vn8vY3XZL/ObOMvxdHNj1K6DD2dSf1X3S0UqIk?=
 =?us-ascii?Q?z0TqTE/1S26rBFUigIDo9Z6iKf7UN7S7MyT/rkFvZu+8cce936R3Hu6DMXyN?=
 =?us-ascii?Q?l4UANWxQCJ2TvKZ+ly4cPLnlkiQF94H7QAfbDja3bQWMlPLnL9WeOLATd7tt?=
 =?us-ascii?Q?PYltKduW5Kj19O4q3o/1Gxeg+EnN1IdS9Gv4XhJBqX3AZ1eCGCCZHn4141Vk?=
 =?us-ascii?Q?i3XOCgJZWs1LlaXmAwRw9GhcpmTYS0vcLq8e47MRFlc6xd5k/PlXGxQziOoo?=
 =?us-ascii?Q?IgIQ6CVfUkGw9ObjLcabNu5BKJEG73pxz9Puf85wCI/kkphd8iBv2LZaQxqT?=
 =?us-ascii?Q?RrQV9W70L7EE74rdMj9mri+fUxxZVuNhS6Di0Va9Wl3GOP/z4hl7Zs4Gitks?=
 =?us-ascii?Q?167Af7grrilD1PZtVEk6TgA6SKPHYbzQc5bcP4AQXvxdmm7cwjL630e46wLU?=
 =?us-ascii?Q?mCVQYMAjeL1u5G4+RsdtedGuj3QeQcTb8ZTBL20eQhyqOG/+m/pqijT0ZVpD?=
 =?us-ascii?Q?r/Q0th5W3f8WdZb+ds4HyB742hOQEkR2Jxm5C/kpaA6HomGGtjdLfsDnKJNr?=
 =?us-ascii?Q?pqy9C2IHhyYE329ucxmsi5n5Whr65ij3YlYZtF4jlNhyt9FxHXp1io1ugKEZ?=
 =?us-ascii?Q?9hnkMG5n3p9A+OotfiLj4T71wToHJjB74lEN0oN3LjIVU5T0J3YKXmkUPBhj?=
 =?us-ascii?Q?3TUzg+esixwME7mAxlUuyIAZjZqGkK3dRTYYDB6yj/fFFETM5x4Aow/gqkte?=
 =?us-ascii?Q?hnBwvQ/coRJQ/S5VKf/T11hknpqUAcSUoMWoi58GStkTOn+yJrUl5BKK0BdC?=
 =?us-ascii?Q?J8Khi1T5wU+O8c/w81NQTP/Uk8vFMoZbUALf5vDd1o2AyI14xSlCjlMhWXVY?=
 =?us-ascii?Q?/gR4vaKsOx6V8UWkLbViPggdDLljAD/ccXKyJCdnRkEuHQvo+eya/EMHgiok?=
 =?us-ascii?Q?/MqKHDqfVfZ+qoDwLjAb1voctzWpyy7ORTrvhXC6479lx9dmI/91iKlWcbC0?=
 =?us-ascii?Q?zp/4ATIjAJUOCZL0YC0FuHsRU2S/AxrqZJPRsLbHYCtQDh70G4P6Afb3xRIL?=
 =?us-ascii?Q?5pQnXoJcUOz16v9SFf6Q5hopr0q7u+xHz83Px1PGsbzBhMmauPHey+s733Io?=
 =?us-ascii?Q?jYa8m2oQT3cvTQ21ar2sAm3dU63WeYgRKBhTE8ezCBoAPB0Zaklr1veqQTOm?=
 =?us-ascii?Q?7W4hoqvGsa2wKggcin0Esx5A7kiN6r5XYEegKu3x3/2Y8GEqvTZBdcsrUUDI?=
 =?us-ascii?Q?50nBvSLVMjSB6OOKUjnbAqviwvlsWuXrE9WfB9JwnmG2e4kDoOwK2/ZM4K9i?=
 =?us-ascii?Q?wvl2QwxnjAsmRNKv1i51ZquRIsm/KLxYujem3yDO/0mj8TTOtAEzojhZyJQo?=
 =?us-ascii?Q?OsazewLyG2Rck8OcGq4MZzhhqqMkRgNPi0ia5ao5T92hat7VeTjXIzEjETwz?=
 =?us-ascii?Q?P2Ah9VXnAOAFxxIJgh4grEFvKZyAdRWsneiszYBUSSQIctyWuvohNmXbXNyg?=
 =?us-ascii?Q?lHCbtaR1Y9aVU5TbU0OaSALyRXuDFRG00LjDM8DOf6IJgQMLw1BMxIvaVkTp?=
 =?us-ascii?Q?e8HZuoz7Q/HFq3ftJiYWbRkMGNX9gxiu+nLDnbZHOKGh5wC3fvh1rSXFEUip?=
 =?us-ascii?Q?sSyuQllDsVg+CVv4P9iXVy2L7AwLLil10Lli8a9r0x55bzlSHS1c6/D4jM9c?=
 =?us-ascii?Q?Z6voErSrgA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 225c8b8e-6c47-483a-a880-08df2a00e519
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 14:39:04.3164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SiesywIOKZlBwf0Nt+RjjmN5ZbL6TFzqVsXDbNrgvTcI4HJpuR0sqyWwY0l3gY5CpmHBWAjmDaRqX4nljON5RuxaZLJSMma/gj+G7+7kKXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESP189MB036075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 14:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247769

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-31911
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/a715bc=
dde830299cba4171514385cb17ec19b6e9

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcap/libpcap/03-CVE-2026-31911.patch   | 47 +++++++++++++++++++
 .../libpcap/libpcap_1.10.4.bb                 |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-3=
1911.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-31911.pa=
tch b/meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-31911.patch
new file mode 100644
index 0000000000..fc35ada86a
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-31911.patch
@@ -0,0 +1,47 @@
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
+ - Adapted to the 1.10.4 pcap_filter*() names (renamed to pcapint_*()
+   after 1.10.4).
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

