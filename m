Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF04C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 21:18:43 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.24])
 by mx.groups.io with SMTP id smtpd.web10.59866.1744060717594523402
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 14:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=gFZdk3cp;
 spf=pass (domain: oss.nxp.com, ip: 40.107.159.24, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u0fCVVy7kSmFddyLEe4+8WGGCgVeRkQLn7ELH5UyWVwnGtDD5aXntqx1YcW4feZALVJJ2miaUFhRX72893H6sqgp225t39TeaRNnub2058NjxfnO4vyPNfLHc7rOSsIx2DoFWQjHTcyBdk6GNLpd6RJWpbUGNKpQQ1TnoiYXBRYR6ZVNJdvNUNhgR1bDCNAZ2eWVCuQtuQ64FaByloYIlqZYLImnIBqpoVI6LI9iY4t8ebe4ov9mmW7YE7A/X5KG1WvNQAsVSTm28HLgBrHagN3hPhPaejYXUIu81ZK3Rca3LcsbpWDn8IPGc2v5b6pNvXk0J/VD+BPSWf3BEbN/tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sfiapi8A1uopjiQGjIyiV+tFfiPhGA3JfwazFGi1nWY=;
 b=xAnKVPBt/Pme1+iShN8QpUQylvZ3/hKjjS42yqn8npIp9lPhSzZXn0nF/bJV0DGef3MPbZ28AKc70OzTLiuEE0kHTX2MhawFMdaQ1FzMezxM3202PqBtvfFIZJ3YwezH1/tXKI5iaKPedivby6QpKQvUV59iqcF4Gc0hXSpVhVWL98SqFf40XEELBtZSB1IhW/LH0IC5TchkLQGkYQMvCTffD8ikUeSDVEQ8R9aDDLopMR4lz2ww8komteb2ZYlHwc6q1bzlJpkEzVu4enBwsakLNOlV15zhyxE1g5b7pqoCJMgiS+9dc/S7U/PMBsE/MkPWYuG8ZjJNxCH7PVJbzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sfiapi8A1uopjiQGjIyiV+tFfiPhGA3JfwazFGi1nWY=;
 b=gFZdk3cp9tmsMiS1OQwDUhFfe5Tb06XPFWxO4nOPqpF/HXz1L3PyB053/mhCdqbi5MAzg4qlwS/McROEQwNRHFx9u+DapWOFqnnCu3i+rJlJ5JAMyZYsrTI+09Ngeu3p6fkHkNJVrWMTfkQJxD0YsXIW4cBxO4YxgOAEu0RZfWVGdU/JCAiXHMluVYF09AkROrm5VNPZZsr+G5J4Nz2AqKM9467SgPZQndhKLsvJQHPvCOd2kLmUfkgg60dZVWgb1BdWNJ0kaAYdo/MiNXs80dG22HnTb8w5KR/BN1yOQon63aVBXVf8bi3fgAEvODwK0fu63fBn5UMtppPPwM2fbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by VI0PR04MB10760.eurprd04.prod.outlook.com (2603:10a6:800:25e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Mon, 7 Apr
 2025 21:18:33 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 21:18:33 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v5 1/5] toolchain-scripts: Add Meson settings for Yocto build SDK
Date: Mon,  7 Apr 2025 16:18:02 -0500
Message-ID: <20250407211806.1782316-1-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0164.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::19) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|VI0PR04MB10760:EE_
X-MS-Office365-Filtering-Correlation-Id: f03a2d15-58b2-46c2-0f23-08dd7619c05b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TTMKeTeSxnzbUgZ4f+Y/l3uU+zRKeIW9NzynvBspMh6tm33iKydgsplaIm9M?=
 =?us-ascii?Q?PI9x3naageEt5wPOAKBJ9EzQNflIjdCmWc2bhbWveh9Da98IQUVDQQIbr6q3?=
 =?us-ascii?Q?qzvsk+jxwzYeC4gE5695GolDaoBTwZmBd6qu0Cbp2vbqsBXygti/DZ+dhtDu?=
 =?us-ascii?Q?+iwCk6kJpcEAw1OVS3buI/a3MKPM+rgmXURe8RXK1A/lmzzUz9uI/gkQJQFg?=
 =?us-ascii?Q?MUVYdfVz2I2T4z2f5HMJmY9zXNtGGtDvmWkbv+JgEQef67LNHvkR5ZZNNfxW?=
 =?us-ascii?Q?Wlj//nwp6SQ+10SY/hNDd7BngINuHWS0UylvWXScfdbseeRIsjDRGmrrijTy?=
 =?us-ascii?Q?FIiNC0NtF6wQGIsMG6Q/2N/YVcOW+82DNI/hk04ZOgxFyzUzb8fwqbfnB/i0?=
 =?us-ascii?Q?J6GlQwfSuos0LoiihZwIgmG9qpFVbHAfZbeE/t1ubVYV3H7Zuwr/xakgYB2e?=
 =?us-ascii?Q?+pt2ajzJovOhIXkpxbrmkn1ho24gTWCIJpCi4nkEgR7x/h9ufKndjkUkDdON?=
 =?us-ascii?Q?xyafQhMXPqEBmIF7RONOKS/lHe1G3XbMUIHfUgYXb/RLCL2NUtO8Pbq7jKtG?=
 =?us-ascii?Q?whheQrdCdBjizUqRfAtAZM3eCQcj9YNqT7bU7F62/OlYqFBGD64iHfKbzm5J?=
 =?us-ascii?Q?fZw2EwIWl/lMPNON1jxFht/DJlSduUhGP0DIG1t3E8kxeWeLRm2RQ9to4joZ?=
 =?us-ascii?Q?mka1Ir/Fy75k8HK4WCVGUSNFyUwdUEJyCQeewn0RLTLOoO3yqHLI+b1XhASy?=
 =?us-ascii?Q?VxTCeATfL68N6rH03UZ38et+fCxX73Kd/DcM1+MhwM25QmR1CQzFfmRyvYzB?=
 =?us-ascii?Q?l+27Q+tYeZfsS2xkA2tPuA0IZKI/clg984pDsF88bAt157vFkIorWKH0TW7p?=
 =?us-ascii?Q?ZPwgZh6oaHL8LVMv/FRg3C7x6gQUhzSiZzsPlGumHVoOClQrIBv0/77xU3oT?=
 =?us-ascii?Q?oE18WXTqhQTAJQkTtTTsIzgSM1NEULmxxjWyIS4PjIe2FgbU4MlJOQsHw+qa?=
 =?us-ascii?Q?QdBi4GCztjdetmrsLV63ohAqGIa+ZuO2kvoQiR2IpcI+3zGswXGr01Wx+Okd?=
 =?us-ascii?Q?DxgvN835llRaxvEYjYDcntnxwRODaqornnATpd2lLhkgQq+b/luC+73Wbyx9?=
 =?us-ascii?Q?f+LhV8kGUVySMJxYZRJTdSg/JZhSzp2GzSSjexF01lxIUCzQ4PsPdyxeQfGw?=
 =?us-ascii?Q?DP3+m/mh3cF4XrH8264zorNXRLfTdcO2f07MmRz+jOjdDm/o42w8ks8kywDm?=
 =?us-ascii?Q?Fu+2log+hfexDa/RxLDwpChUf/4RUHMNEEeDCmHBdkNFH9tNzVKcZQpFKMw/?=
 =?us-ascii?Q?rtCkq5T/i+vEGusnonL6RfoIEfi/7J/d5AciXSuBF1B7KgEMmEA8VWVvLMtM?=
 =?us-ascii?Q?P6SHwqbFBIXjo7spFyCXifXSc+VF7wUoxxmIKp/FpiL5ETEpePzyAzKXRwJq?=
 =?us-ascii?Q?hGzVZD6Ys2BGrvfc6pUuzz3hASqVtJDs?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Pd4C3pMFZ6eWTDKStK+KK4Co8qtlqJ9iGKJFMtCZcpbTHMNvY6KVMroYVQhr?=
 =?us-ascii?Q?O3IVZZiqT5zrC1dgXmuFWZGDtsMK+oGv3Fh+BbvB6DfhNhJ+dG2l0ftgyw5r?=
 =?us-ascii?Q?x1xNgujfOPcXibd3AUVe1E5iX8v1h5hG+BBcuxfQbgEvqSLnyOarn6mbyrXW?=
 =?us-ascii?Q?9wtKGTLbhyj/rBKUrUhJcleMiR+9cCtruV4uMniUg7zx3N+DmRT/cSuVDFYc?=
 =?us-ascii?Q?PhpVtdvWfEdHgC8TZY0Iq0tdNVvNCjvZUdsLR5DcKOG6/zF9v9QvDRPk/gzG?=
 =?us-ascii?Q?4obsaSnXqThSa5fcq4zoe9R5rhit3qQnPv937Po5O7MTaCjZ+XaJyFmwWs/K?=
 =?us-ascii?Q?IzXR4gPg24gs9ZOcKVHanpDlxHssmX4zYOasTQ89PLSq9LHztLDP42xA9hoU?=
 =?us-ascii?Q?V+qjPx7RMTS4NQJJZ5Fn1ifxcePU7VmTur1TODJVc3xNoUHNd8T0Wdf6NTv5?=
 =?us-ascii?Q?7k+SP9b6WHeS08XCJtBoIL7mKLAUuHIrpAA7IeEHJtYXbnN4Y3ybbuyC+IFv?=
 =?us-ascii?Q?/D0vhjYBWkaf0JNvkof8z6YL4EgCgKZGT6HRfwvMQDStsufxFq+9I4I8fr8G?=
 =?us-ascii?Q?srgHijocDhjg037qvIvA4Pelsz6eOmBQz8RgdM/jqMfolx6hCgnRxotn31qd?=
 =?us-ascii?Q?iWEmBJqBQNW/3biaJoyt7mb7v5hDbtQ1zZINhjFP8TMXQllR/vgWQJHVgvVR?=
 =?us-ascii?Q?SH5y+DyPpSLfkupTXCl02EdqQfM6UHHvZABzzReLGC9RFZgwhUn5nvVdwhhk?=
 =?us-ascii?Q?Hhek0yldPoN7K7a8r7tww5bToa9ylj2Yy3fZv+R17g7vfUeGIq7GDI7LqBk2?=
 =?us-ascii?Q?p9OIl/GFGXFGLPTiYm3X/Vn9DqYLZOF7WQjLfrp1+KZuKL6g5ruACM7lkHAL?=
 =?us-ascii?Q?m29lWJzI56xx3vVnBvUrh9AeYPOJ74+ub8k0BjMcYCHF70Bb/khRzSu4C2Vy?=
 =?us-ascii?Q?GFaTbUxSKtut57mMQ/natoP1opMWTj7Ks3pE8hbXtKZcn6rC6XdkmOuvSzIf?=
 =?us-ascii?Q?qfKZu84svBoi8Oqs/5gsLjGVybIuWMlnr9I8jYiqHBtEOyIwck/pfdlG0eB9?=
 =?us-ascii?Q?aeDJQDkUdJC34o51//bGcZkbaAf84qZrgtYGqAwLftXpwrpe57vpLhyJqVz+?=
 =?us-ascii?Q?q/48qVa3ntYtfJoM6rUR7psOvCTUhCXUussAmhVR03GAJrp5uOrBawPGvg86?=
 =?us-ascii?Q?KNi4R575IInK8gTjt6y88/m4yMbljSXEx8w2yVbUS/ZqLh/+ZytUdA4NahY6?=
 =?us-ascii?Q?QD5PMKZRDmjx3LxtPZaJPHK/B9KU6CoxopUnSukUrvIw5N2fh4QXsP971XqK?=
 =?us-ascii?Q?blOAj35Ta7/8ciGdQE87kDNERQ31XNqPewudsQe6GZcU9hEk7no+Lq0PqcmP?=
 =?us-ascii?Q?D8S/I6+zki1nq1l4J/hc7CHpF3VQHsnAi8iOR8mRRziAmZRFQlwj5byKS2SX?=
 =?us-ascii?Q?CR0AySft4nBQnSqcfyGN5M+tXaQtS9bFp5dR4NxYweXbGzxMfScAhiQNUeUI?=
 =?us-ascii?Q?dtmsc/y2VZnOE/OiT9ttqyaPCqv2zQD4V+3RWiV3NtaDF8F1d11pTI1mjMlO?=
 =?us-ascii?Q?56Dx3qcMRuP1ZlLJ77N79o+lWisGGEUwb3VYHn7N?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f03a2d15-58b2-46c2-0f23-08dd7619c05b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 21:18:33.3620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BxvGUsW/t6+9XNQMPl9EH9f3EQiiLuBCY4mgxMna9TBtv/m3DnuBgAkWV9knVImVatjTkDa+9GAEqhtB+kHWTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10760
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 21:18:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214477

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


