Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE473C369CA
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 18:10:39 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.34])
 by mx.groups.io with SMTP id smtpd.web10.15636.1744913431181441892
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 11:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=YWB6Vuyg;
 spf=pass (domain: oss.nxp.com, ip: 52.101.69.34, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kxdPuAXB1QzBGuDxkFdClSpWSOpedVyGT9RowRRWsHoykimriEBn1En0FxK/dwEY8XN7Py5SZ4NXVC02ptFSleNCTe7I9VX7K5CcosYahECgsO0on6nqpDitNaV68XoLU3MOWIY/+M8Fpsr/uU07p+T9zo+csym92jPepipTXflKnw7sAn1J2P4j0zbiXoA38c7huMqz9UIv8XlUq3TVAydJetRp2amRWxMK56srVat2SaGs2qXHNw0C9aP+ylKiteVq7OFyDc3q3LtTg2wUhxOLg3Ib8VCSY9brvwzPABwCIg1UOIn+qfyYykqalQ+jtAsnDM/GsBnle6VbCF2hyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sfiapi8A1uopjiQGjIyiV+tFfiPhGA3JfwazFGi1nWY=;
 b=Gsqrjem0froa657whuHhexeDNZ4EUeB7Q/ZAHFlJ4t8/LoGXHDynn9opqZVnBOA3zbh8V26zMZgq8UG7hTvc78DTBTV9nAxfUt0TfVqK2uT/DDSD0sGPIqUrdXmFc6BYllWKfZfDcr3IojikqiGv8ZKP0nv9a2KDJJB8zcTx35508/H0ruJkH1+O2n46eOsHguD8e35cRtdpFpYzX2aEWkKBgAz9h3EGt8BOjWqNWS1PC6qJRxJIG+o7JyjbKFg7VOvcjp6E+06Q4S/zMebtyirvKE3r/jn9z8c8l27deSQRRsMHEb+2vYLwlsewsvXGnrBD9cUL58SrW1cX9Yezhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sfiapi8A1uopjiQGjIyiV+tFfiPhGA3JfwazFGi1nWY=;
 b=YWB6Vuyge2pWi9ymwfixXr6JdxNl9r/jn2HTbjbCYyAxb0r8KbO9bycwscjLl9a2H7wEo8RtT0/2MmTiq+RY45it/77BnmKdSHu2GPeYU6OTJBjjtyry+Gsj/nrJf+tSxehthjyAe8c7SoXFs8T+RP9EWsdrgehFp30zbsWUB7EnBjj7c7hfTLYYmq5/rEhfdxiB4unkSr47RYmq2V8IZgqUyalZd9J7iH2d+u4/vI6cwS30ph+vAqKMpZsF+24JCwGWKdoijG16B6/5gQ45V4RRIelErEDZpUxa3mFZMy7g4be/qkCTphHoavyGxIXvTULsGpLN/SKQR65E+fd61w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DB9PR04MB9497.eurprd04.prod.outlook.com (2603:10a6:10:373::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 18:10:28 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 18:10:28 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v7 2/7] toolchain-scripts: Add Meson settings for Yocto build SDK
Date: Thu, 17 Apr 2025 13:08:29 -0500
Message-ID: <20250417180834.1722588-2-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417180834.1722588-1-tom.hochstein@oss.nxp.com>
References: <20250417180834.1722588-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0147.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::21) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DB9PR04MB9497:EE_
X-MS-Office365-Filtering-Correlation-Id: 87161a8e-11ef-4f01-703a-08dd7ddb223d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mesa5YLWFme4Mq8e8bBeDWOl1SVDo4cAaFoMiJ5xdo9qKhoFeOofEAMVE1t6?=
 =?us-ascii?Q?NYhD0i/6CVokVxFXFmUHiTy5yBXIy3fAMYedtdlMf5y93yhLAXyCBaehw5LH?=
 =?us-ascii?Q?aMfin9IzvdHWcKvBX+zHEgnxowaw3/bZPbLlQ+fTPTxqymQz53lW9oXhQxrp?=
 =?us-ascii?Q?MCWGnSQTiSXEatPbKOWeNNlNIKRE3QbfKtOTuklspRm9uNAFYT+CsyTz00TL?=
 =?us-ascii?Q?OkoBhSQzcYacPLn11jK/7QjgN5fU3vRA9XRCX0I/kHLRwioA14nVnn7IwcBY?=
 =?us-ascii?Q?6ckKQ2/RgFOtMNoijgqKAfa/q7gdMy+MUS3qq5b282mDDm1cil6HvFnAVWkE?=
 =?us-ascii?Q?CWi5N2P+ZeH31t7B2zeAKui70P2/NGlu7paZIweVIPxY27mHVYlHsqK2QDFZ?=
 =?us-ascii?Q?06ArHzbUO8VevZO7rm9BrxeFl5TY1T5oW2J+JQTeixM33b66o8crrw2l/POT?=
 =?us-ascii?Q?IyT3czP9FOO4bbJ+kJ2XpA4gsu/UPp6+z6LzIJbfJqg9UCOp0wyHs3NuO8iY?=
 =?us-ascii?Q?Sq+g4M6gUhPx4dsdJHQULdNQUkBo3GbRBxmRGaSqan55lNkZS92YLq8m6BwB?=
 =?us-ascii?Q?T1wsaRT133NWxWuo1u031KQbE/RUnZbcRV+CP/YIipOrMGqcpWjG06fbnG1K?=
 =?us-ascii?Q?nTxBazLk+AxgJFyYCi1uSyXEGqiKxUf21SlpeAWG/CEx0GaVB3hSAkn0Bewb?=
 =?us-ascii?Q?2J7ZEFgIInib8kI/fOEc4tdDRTGSfkAmeykcpvjgnDSOgAYB2g07epSSyb2t?=
 =?us-ascii?Q?j7FfGTvacxg0S3aHNcqM0I4tm37hp6C/4cJ4+6E/uyJym/JVaqYPJOuqJ1NY?=
 =?us-ascii?Q?0Pfk4qCbCjJVDfxSi9Nhwf/5iXPgy4wWB5E26Ewz8NYFSgdOG1S9t3C9Ox6O?=
 =?us-ascii?Q?TMZtiqi86FfWlweuQa7pjGqtDFk/M9ojj7oRlSO8rjoAeYUAsR3/crAT6gus?=
 =?us-ascii?Q?QqnmCNudEZYrRFDlAv0y30PkTIUPmniwUOgDy4pJYYBbQ3jxrx+LUvr2P0l3?=
 =?us-ascii?Q?8cw3HsLOKzhCsbsXEWjv+ipkWeWk3+LiJljiPJx4PQwbil50pCmhzGvEJiHX?=
 =?us-ascii?Q?P23PTR7cSEIkm7TORM+J0KY43zwo5KwGjq4WnlgnnFj11c8M61joZKxlxTzd?=
 =?us-ascii?Q?USstTqV6D1nIaRj0bv4PP2jHa7EyzKPYjacDJayM6Kx2N2NTq8inTzMMYNff?=
 =?us-ascii?Q?8+lLRIHHtK4/EV5K9chKWmwEMD1LOsf76Y7sGgjT1tlReoOtXCGALUwvEwPa?=
 =?us-ascii?Q?KtZOp+F8KFurdPuyuokJzkZRMmlRbowjK3StKwRZzYrkkOzzOslHtp9ri3Xs?=
 =?us-ascii?Q?NCIUjtvDXmplGj5m80GsVg8LHyqKfPHzvqB9SFnuRvd4AUuKIh49MxmEIWQK?=
 =?us-ascii?Q?mzDZ371QZzQ/7h9h1FLlz+g+a8M0v9GW1XnPHWh9qkLLDzZxI955H0u8De2u?=
 =?us-ascii?Q?PF0PePtOH5ZENqIt9xfHp4xs5y4pioB/pBu6kZCCmn79yfeIZUc15A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6gboLJ3W0UBf7prrsf9QpnmTz75HuG0JIVN9lzDwEMnC17O+7ufqtSHeIWG/?=
 =?us-ascii?Q?bL8zrgHY2eC7kk3Ll2KxbLo0tzAjgVOoflCg9jWY2hBMj4hfLbWL2qoq/u0G?=
 =?us-ascii?Q?mI5+7ZOYon7E9NOlqUgYAIZUDx4BE/gPmHUAUl46joQ7DyRKkw4RqBQGPVUv?=
 =?us-ascii?Q?uOhPgFeUmtkUwwjNHXkmmR6I8WCXIiP/XHqL7/kZwAp9BSYg6+LjPO8gvCW/?=
 =?us-ascii?Q?F0FIEZ0lXdteDOsl0vNren5JjnES1Qpt9DsHnRtWSRQTv9UwsulFOlnmq5TT?=
 =?us-ascii?Q?O8NPm9HSdIVkBYdbbRuahA5bvKQcBwlChDOBXlfUJgcASR2PnoQ2kT527aYo?=
 =?us-ascii?Q?P/TmrgJYXOxn3g3/u5RVcZHOEbajgciqB5Uo39tVBH2wNn/xTHg6dK2aNKqv?=
 =?us-ascii?Q?0QaQ5QSOlAXvLBLwxNqkrKjbFOE9U+Zvly/AcOxGW5JpmpCD1aS4u81gy/MW?=
 =?us-ascii?Q?kgfaww4IumurJwwADt8UpczCgEUWmzsLczQkzPmhWftzyuSVz+FWrjGT3RfM?=
 =?us-ascii?Q?RSPm2JhXErcr7NfWCvDccJiw04X8odf7jKEaXpXq7iAFaAKHYkPhLVREeOz3?=
 =?us-ascii?Q?QTrOjpd97u4yfKKQJDzfSGZkVOD01qWx5T4kU+9hsdt29xwUiR0LItEnBDs+?=
 =?us-ascii?Q?8nJ1BLhFRvxhS0Ko0ffgW6uj1VCJy1RcCkfk50A+Tw7jCqNpB5inszPt5Dd3?=
 =?us-ascii?Q?rwHWZ1Z9Zbu1PzNjuyvivlcOnBMS1TH7UGXB1HPafYO11ElGcGzZVPEpUnWs?=
 =?us-ascii?Q?lQNMxoH2WbFeFyIwPB8Hg60uyhXO07+ySOWmF/PVNE8S8FeDvr+Tq69A7bqE?=
 =?us-ascii?Q?12McRNHuUz3D+dimdHgAzsQ3krYZ5A44d01glaCyaIdd3IsGmZ4cfiBWrzMx?=
 =?us-ascii?Q?jIE4FcBe0NKzfhu1TyhDaNLP4akbb7FqFtuHR5D9Ljgs+GsR9Tgk3QAwS2zW?=
 =?us-ascii?Q?T5+GOn3jgJKfQAAt53Y2K/CgK1JPBg6n4lfVcRpruBWrUC1izzSoAmt+H7Lr?=
 =?us-ascii?Q?zWHzHhbzCGmi7GXnxi+vFrn2HHCy3rEDFqTR3AKFG5k7UVe2ALl0rU8wS01G?=
 =?us-ascii?Q?08zJCDzoQF18aQ3v3TIog62CkIyDrjm0BPKfL3BEohMXg7wwr2hFWWEXRZ4X?=
 =?us-ascii?Q?b7QY7nD3N3Mj1xMRRHhQXdivlHa5GQXgZbmhMJSr4hVjR0Qz0KWT1ZwXD1KK?=
 =?us-ascii?Q?AHQArRavOizBqDcc/zadaBQaVuTKNmbI5BgI+MZSt1JhFL+M3quuKn5r2CUh?=
 =?us-ascii?Q?qCp+RsbnWiwKQH762O7suCulpeMbdkvhVy8FvDEImHKnDtIio0Tjdqc2aWKw?=
 =?us-ascii?Q?ExTuHEVGLATTpT4eKw+pQ6QzbZ3l+SppnUVzKDvHfmZjvJSVXULlOgk9MQ/N?=
 =?us-ascii?Q?ipHoW4D0N9LoI/sIpIQYMegdfgUbw55MZM+fH0PbStfAaTF7t+kl+CP2DIYu?=
 =?us-ascii?Q?nAORSok8ZkH9R39fqTaWf2iR8dd6TpKpnYvuST2Xd7Iy0HCAmU70vHx0wcAf?=
 =?us-ascii?Q?8Yh03cSgKLX/ORNxu4AyA5PtDxIAr5yXQi7PdbgZEx8iQENBj4XuEqLYFPbL?=
 =?us-ascii?Q?O3G/AbMimRVauLI4H5HP/hscMBH5sTScYQYSuSjpMmUhSwJM07/hH3UvErHh?=
 =?us-ascii?Q?xw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87161a8e-11ef-4f01-703a-08dd7ddb223d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 18:10:28.5170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1hdKLR9+ucwdYoIiWXVkoWJh/SbM2dB0m/YKuX+zBVvxWOIYLLXKWYAKMR47G1z44yu1ZNW85R7zPvSP3cj4rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9497
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 18:10:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215109

The Meson settings for the standalone SDK also need to be available for
the Yocto build SDK, a.k.a. meta-ide-support.

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-r=
ecipe/toolchain-scripts.bbclass
index b59a295abc..9e4320f876 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -99,6 +99,8 @@ toolchain_create_tree_env_script () {
 	echo 'export OECORE_BASELIB=3D"${baselib}"' >> $script
 	echo 'export OECORE_TARGET_ARCH=3D"${TARGET_ARCH}"' >>$script
 	echo 'export OECORE_TARGET_OS=3D"${TARGET_OS}"' >>$script
+	echo 'export OECORE_TARGET_BITS=3D"${@siteinfo_with_prefix(d, 'bit-')}"' =
>>$script
+	echo 'export OECORE_TARGET_ENDIAN=3D"${@siteinfo_with_prefix(d, 'endian-'=
)}"' >>$script
=20
 	toolchain_shared_env_script
=20
--=20
2.34.1


