Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B92B2C982C1
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:16:43 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4960.1789499791346222233
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 12:16:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=lujZaWb9;
 spf=pass (domain: est.tech, ip: 52.101.65.29, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eW9ZgfiGjGYQFGOLAFciUH2yJZB8daCwVlLaqeb2kDRH1RCzgMljXDWu9qxbpY6okyJ8o39/KQCgDff0lYFDX4tAWfoxEEYgQiWF5Uh+cpopAH1bxDz3p9Rxbr/Us0L9v9+kblItcBL9PP9JCVP/+9EeQFcVJKOZZkSy53hxUhHhxyD2/xP03HNvC3wpeRB3zHIfrNlhVPvtp87hVJy+ex9Rwug9cqUjJkR76STOMWvAERcBc/8hood72bnKy1eXtpCZaJgVAD7DNuHQJCBmZoGmShIq0V2kk++0vCT8lPe9lJ+BaeXlL+1iW7T3CnsmKDkDZnD6HyRQgQad3xgDpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHH8z3XwbvW1s/jLnGEmOxm9glmJFm1p7AcBj9rM9YI=;
 b=DjNfgWdzD973oNJUAkoEDwYPcaGv2UPBYGIqEUfcOXa1kMtbRm2Cnr6T98QfOJDqMs+VztBjdYNUPeh5IqXJZXZ6VyF2VmM9IdQK3VL3Gn0MODZfpms9oRqR9osLzTaqagc2n3WLdx/w28xwRxnrJPlWWWXPhx46upp34Vth2sWCuCSYPwdoso1l5EVJHUeLL3/SfBRI5hw9QQJNCyzNHslbEqYrMPqGLrv8tozjiP95j4WyhTyXAK1varWoiX8o9rh+fm+ClDN5d4X5XTSKD2deTrX/jBhaW8rvVQeF1jznYJPSCCMSmPOwawpYPR/dEX+blTw4UuF1KwEoWeKouw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHH8z3XwbvW1s/jLnGEmOxm9glmJFm1p7AcBj9rM9YI=;
 b=lujZaWb91Dlmbb5idw7PNuJQFrSb7piOR0UqbEXNLZ+lmi7Q9K+WjbUfGWglu70JrWzSAdP4p4LeeO3qS0DyxXLTbH1UUeEcTM5nuf+9KKWtc8ZcsB+93YkzjKVlj/FjI1/HA9e5oESouiDYFgIlgqW1OpUSSL+FUt/AX9pYOjb93YndyynMW1/2yd4IkDImzyMm1YkZzXvY3kMhqexrc914alVwpOsbUIrbUmtskSDrSqS9SswfnUlzNvG/czb7rCRLXL/vLtoZUhof3YeovlJ1agxAha7wKUjoI3loygvBHGLJyGZcz45A+mdTUVXGmIwDAzPW2HPU1iJdk7KrwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM7PPFCA14042DD.EURP189.PROD.OUTLOOK.COM (2603:10a6:20f:fff1::6a8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 19:16:30 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 19:16:30 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v2 3/7] libpcap: Fix CVE-2026-31911
Date: Tue, 15 Sep 2026 21:16:19 +0200
Message-ID: <20260915191623.42107-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260915191623.42107-1-jaipaul.cheernam@est.tech>
References: <20260910051154.30595-2-jaipaul.cheernam@est.tech>
 <20260915191623.42107-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0085.eurprd04.prod.outlook.com
 (2603:10a6:10:232::30) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM7PPFCA14042DD:EE_
X-MS-Office365-Filtering-Correlation-Id: ed505c9e-673d-4a6c-7835-08df135dd938
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|6133799003|12006099003|18002099003|22082099003|13003099007|3023799007|10067099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: 
	1sP975fHve19YjlVRljgnwKaijo8YyD0N6i85to8tHhtKji7cqUhgST3FjRC0Z4kYKmikKCzAvPjndHzQFZMlHr8CcTAWF39gluaShfUl1+xzgjMu1Qj2Wko1VMPfUebsSpltSA9B7LC7dKxZ3+jpA1XjAxGHId8Ph+uVjDBDRNBkzXBH5F8+GvXbk7A38TF/C7il9NaUoJfISCiKyiyjNzG84DvB8b9bQMZ12OkupZjfx877aBNGt5k1LW5obtJIdyg/xlmDca10Ly5mGoHs4ujCGVW1kSjTJ6AaEHZ6287MoNLOTIQGl6GndX67XnQO8IelcR7rILyl0Qf9ewWDuBExZZEO9U7DK4jaNOxjqxEEQ/Km7n65CgNJ13Y7TnRQpFZqAzqlwCf13aQfxgbDFuxofcSfLrfhfcSQZ8VAJ3s0aK2vEKtnsgs5hIVBf8VatssqBl29hZIDcUnpf22MNSt1PDeOejm20bC1DcDyTf93ZDIIMW8V9EE8TFqFsVUpPgvLrQYl+m+A9oz2yXdcSeiFAcXVyImwF4grEyfAYHB7f+TWaJOhciXR7fDlGPOg6KBnCIkdjPHM+PU2sxUyoWSoSHcidlTVFeHKtaL9Tc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(12006099003)(18002099003)(22082099003)(13003099007)(3023799007)(10067099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Yr7Iinb3VL41MEHIedni2yxwTHsJ/GQbXC94S3nfXD70t8hhk0yKWNX6mBti?=
 =?us-ascii?Q?1YpkUvMZOXRgfHqgpMIKbg7lb5Dlnf5/QSuQZTMKs+IpOaGm6xx8fczrSxeD?=
 =?us-ascii?Q?/0qOW9bwpak/kGkLbx2aG/V/sOFg/epXgINOUzJa9Kqp4eH9FKUPW5V4l08G?=
 =?us-ascii?Q?W9lCt/rF9jDv2EEf1/Pcu6L03OjeTydrGDPEU9o6ieAYgriOG11QE/oPSwKo?=
 =?us-ascii?Q?v4rVR1+ddqbWpWmYUSP7iILDJfKOelwUG7C6dc6V2BsdVvmEZ2TE3rZH4nUS?=
 =?us-ascii?Q?Vrs7JgFt9R4Vj+RTF4BU6zJXLqK8bTZnlwXtb22A/6lF5DccKZIrf0E2BT/m?=
 =?us-ascii?Q?oGvQqIKZ38PZiUOcEn1ob3UMS/CmBDdbnDSVRb78Gi/lWDalitMtGJzg1kle?=
 =?us-ascii?Q?8SfyK2yAIZBgekQIm6w/aRVe7ag7RbaVKHYTxlv5JFSkzdRl5VA0wh3Kqlui?=
 =?us-ascii?Q?RQLmeNqS6lNdcAjrbNmWbEHuQUEuoFba6IwnOp3f5MDpvkgevUG5RHT9q8dF?=
 =?us-ascii?Q?sF5FOGCu0LRa1SsGtte6uo5BXbAR5jMMKPqR4LUdaSGBtjY6Og5jzoqRuBi/?=
 =?us-ascii?Q?NmShyhE7pjd9kO3Qyr0WW6cGlvHHuW2cmrCXj69IK2NQx0iHO0BWGuqtfeu9?=
 =?us-ascii?Q?S0JRrpbZ3uaW4gANBSMOq4/jyk7eFy1GNkqMRymcFm7+DykARC2W3+nrcWlz?=
 =?us-ascii?Q?L9zK90Av2JXQ+wTYmXKJlaS5pn95pq1mYBlcHZ4Jxk9nWAOgg0pj9QuKshxs?=
 =?us-ascii?Q?A4bMBBz+xysFVxSVIG+1cCdQaK0yBHT0dqb4XJfYRrFnkOKYLpKFcDgdcGCM?=
 =?us-ascii?Q?YcFt75OguAumevDi2oS40hBC8DX5kc4eTKwqHPEngNfVC8uBZKHufb5NGJ+W?=
 =?us-ascii?Q?iu7GDH+NnZdTdAMIgFCq2YI/LPJ9IGjj7YhWBFBcXB1cMAVdaA9jd36ccwOE?=
 =?us-ascii?Q?s3CZ4+EgVBYHN6+MlLGgfqwJt8c5IKtyrzSLNfkit8OfW35841ujMJQYFxG/?=
 =?us-ascii?Q?GOdxVFlqnSxipqV8ZeMIlJYTkdWHEOtteEUj/dSUisdppOMa/EsohFMAT71O?=
 =?us-ascii?Q?J5gL3Z/IvV3EMzJMgQv5irDzUjsPbQXAs2Gl6E2fl2p6Sfc/4HMEqFq7YTa5?=
 =?us-ascii?Q?Ko0bU4Rwo2lFV3hG+3LbrJEjfzPWJreReI3XCOiKOEgB8VpVPtl3TtB/Emyc?=
 =?us-ascii?Q?Oo8toQn13EnM+ng3Z3tEQ4yJX70n2bVRL1FXtFAEOhoBr+mroAPD/G12Llfq?=
 =?us-ascii?Q?1myvyxXCIiyj5JLNmodk2ihdOIpJeOmLM45CBlGqfN165UAcDlskzgpKtVfR?=
 =?us-ascii?Q?tLKcYcqMeFRLiQOSqNF747BEN/z93tH09JDL8JtVjTvAu+yADPV++l8Y4RoP?=
 =?us-ascii?Q?x3WfiNdENC0A+HdQoaWQn2kf41Xbe/h3aENOqLbd15gLZt0RPmj+tI9U0RiL?=
 =?us-ascii?Q?a6vmh48orgmozaKMSoFfd2CEfb0rvu1iKB+0QiSOolkxS4TNJijZFhEZMIJS?=
 =?us-ascii?Q?NHH4DyXBjBegBz7k9YmRZqyVXi4zohQE9vJdeR8umIR/crq02/KuS0/Nk/4d?=
 =?us-ascii?Q?dDMx4YGVgyTrQAtfq38GASyQsuoSuaiQtuyOVvT3uIcJfE86Kj+eE9oC93Mc?=
 =?us-ascii?Q?aGGlgcKoY5zw4FQ9su//PPykffa48Oo406JLqyK4Bb5X7U7wbGRAGBPuiWpI?=
 =?us-ascii?Q?GA6a9a5VM0qu8jukjY7nafzcy3OMdbbimvc+FYxvorw41evwdmO1ykADFHvx?=
 =?us-ascii?Q?8m7SxswaEA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ed505c9e-673d-4a6c-7835-08df135dd938
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 19:16:30.8524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J3J2b2g/vgmKzSpvVq0Swn23lu92VJCtTfXDqhrtlGmLYcZ2/2hs3CfCVxPmaQKlLw+ccu0rdAHtC9ulsUbwwdJ+AbCrJexHj+Y93PEmcFk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PPFCA14042DD
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 19:16:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245870

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-31911
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/a715bc=
dde830299cba4171514385cb17ec19b6e9
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcap/libpcap/03-CVE-2026-31911.patch   | 45 +++++++++++++++++++
 .../libpcap/libpcap_1.10.6.bb                 |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-3=
1911.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-31911.pa=
tch b/meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-31911.patch
new file mode 100644
index 0000000000..1060b3c372
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-31911.patch
@@ -0,0 +1,45 @@
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
+Notes on backporting to 1.10.6:
+ - The upstream CHANGES/changelog hunk is not backported.
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/co=
mmit/a715bcdde830299cba4171514385cb17ec19b6e9]
+CVE: CVE-2026-31911
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
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

