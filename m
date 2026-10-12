Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D13FCA9EC5
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 13:20:35 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13152.1791811232994244268
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 06:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=gHQm9KFW;
 spf=pass (domain: est.tech, ip: 52.101.84.61, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wwidjokW5iEFQH08CDIXogUffQ+i6K2ZRIxplophhrdM7Lac7XXjnW/cDaAclcv6r1+qg/LCSDAz7fYfppjgyZ48c5SsxcSWATBFd70INdlfoVooMXIiqtbw9cXLbCgP9LUGs/Z1bH6W61A7C/ldJ39Di/4CXCLHw/S02CXbK6KGDxejnsYXT3PruMj3Fm99jriDkXVA7exE3gjisgubvplHky/Lwi4BM33OKN8wKXA72EF9v4faI+glmMBixKBjK0zNnHF05TqRut+uqFlRXqpbuOgBBroqscN2ubQplavL6jzS2vx0BMB8rpBpau92YhI0hsHsl+U9g/iPOzw5sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5D5tQr+4/Z7lD/zWPgrXYxmIJ8lWnYjKtINBd9eRXhg=;
 b=jtFD+TnYL2wiD6dFDIvqxEgixEJhDokLYoVm3xwC3Enw8mxA5s6M+rD6Uvw1KWkppIi4//5wLX6PskKYBKjq1t0VlBlN6TEX5K4oduUVphL0dnXL25kP+7qe0ozmAfAFydcckQ+9LdcTjaeatA1UUcnXL+0ZzoUA0+G/sxrBXubPU0yMVsLhriTk+Npbn1VR2I62g946augwe8DhLzA2+kovRqK4JkzhdQhLSStiV71ggcid/qikRdt5oEUH57LEnOLvsU2Ek9zO6EKcdae6xmg24uni5zlZXArrVhkxo/geDRMb382qSQ+1WgNlVFFzN0fCYbJW6RClbVhI7VWncA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5D5tQr+4/Z7lD/zWPgrXYxmIJ8lWnYjKtINBd9eRXhg=;
 b=gHQm9KFWsKVR1nskeHXsTgGqAfFjj3gDjPZ+LR0Zrq6Gw6LQ666cy/8b/6GpfJ17rI9mOGAEYiwELxfkGSIPF1XIdStVvzXOQL2uUe5VRHoSbSSw0nSdvtgLGBadi05bMamYnVmmyOU61sgEOfjKkyKVxY6cnCQPfmKr2vG2hyBTno9X93cFijcLNxEsJ71OAfCnAGNtCwPaGbnLqa4TZu+7cP/8jLkovGkJFj3jNcwJbzgEFzg8Hs6j3/djSdXcEQX13IAzY/YbG5gqLZNHQmW/Cj88tFEpD0OQQ5+rksyComISCVO955JtFaOl4xtnIp4QlFMg4TTSMPc3bXYeHA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS4P189MB1966.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:4b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Mon, 12 Oct
 2026 13:20:32 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 13:20:31 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 16/18] python3-pycryptodome,python3-pycryptodomex: upgrade 3.23.0 -> 3.24.1
Date: Mon, 12 Oct 2026 15:20:03 +0200
Message-ID: <20261012132005.23909-17-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
References: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0047.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::16) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS4P189MB1966:EE_
X-MS-Office365-Filtering-Correlation-Id: 8788880f-f46b-4c64-beb1-08df28639743
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|56012099006|18002099003|10067099003|6133799003|11063799006|22082099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: 
	KQXpb1GcqCLyCikUjciKxyfkJv4LXaho6XF+4RGB/wNidwSYdQgge4S8iWZ2wggc1Jhe2AgtV8SQDWk7FxPoNdjo7GgDOr8Ak15mdKWmL/FPnG4fU4B1lWCOArv7XXRPi+2KAcNy15/aAhcxhky1T18fGWupLa8B5weznDIjYKJ/4EfAOOmf61pD3wwGesxkDKX1bMHPoNzo49HoBay30H+gWKixdAX38ktLkPhA6Nm11qn9rg/pnXaZ+fGZvi9lu+ilgKqUVr1PR9MbgvrlWWEcPotr5XbDB6H72CNTst5/2B8oA9DiN0W312uiNQ9dAaCMpG7XHHiPTDXV81/C33QJuZBYrrZFyoPKoCzCyx+Ii8cvrAsnJ8FXB61xHDwddTNhF78R8mYre7uwXEmf4UNqwpvqt6kwgIOdb/QL7v8ZoTypDRStvtM+3xTcAdD4YNYizZ5eMIn3pFhq3BIwEnq6zxXc27wAp0gqefuhg64RJJGtTwZWMiGNpbheXVWKZPElpgFpSwY7MzdjUgqqlPR7Mo+ZIIonUn+/4F7sPj3IaNtNqnQbV/uWuT3K4XDWnKwMqWGh1bL1N8BSTqbvgAm5k8f4vgREk15tLfSVILLo4uS4MpEiVKETg+zjvPYk
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(18002099003)(10067099003)(6133799003)(11063799006)(22082099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rSliI8GFk7Vq7QqqnMp++7c820kpdlCWT2GBaWxCSbxR7Tp4K4jhKYqZmJZ3?=
 =?us-ascii?Q?8N00uOXkD8XrzP8hxMLZZ6aZdO6pRN0O1t2jYsIgKRYO3EW9RHXsdztvQ0WI?=
 =?us-ascii?Q?iwyg82uSiFElVEchcOMI2QT6QMz764hVBidNdSK6bAILNSsk5dweYYWun63t?=
 =?us-ascii?Q?pMG6mPInUCwjSaWW3zm3s8Nl734L1O9cwfSKyFybnXKn4/BAr92wdhlP6CM7?=
 =?us-ascii?Q?f4+GmY8e8od6/rd7iVdu5qzk0PZ7br78lsGQ0QavVULRIG4suDkTPS/bDgA5?=
 =?us-ascii?Q?0tTonEcq89nCMrtutMF8yTGsyq47UYFJSWGauk21us5deC7CsqaVwT7/X7Op?=
 =?us-ascii?Q?p7p3Z6hYeN1IaNjpImxyZ6g6cH3F4qGc4F92ug92yRn8DLsUMvCdlRS0b8Zz?=
 =?us-ascii?Q?U+ag6r/4u6oopJgNAnrYK+0RduU5IWSKYdCS2ESo1S3sxMMmNbvWnThkwhIT?=
 =?us-ascii?Q?bVpeGbX1r54y+ec1Mjgs17ZIyUU2/U4mgjQ4QeTiioa9bR4siN4F57kotcG5?=
 =?us-ascii?Q?Ne5fVq1rspxXaxHV3HFF4S5OzKv/AubmPdSP2yU7SIH5yoREFkz0EIQM7e7Z?=
 =?us-ascii?Q?Op/IpHF9dIqyLe7ZgftwXqagMSG3zg43qDoiKgwn0anVNHo8cs22+mdBzS+/?=
 =?us-ascii?Q?BCN5/IeU28Elp13xn0KJ/60Aylayw0injxU/78Cib56NrfQ9W4ZjCS4xadE4?=
 =?us-ascii?Q?F6v/jI0S5Vp16aNxg16hpnO3+SuOx9EDaHvBrdvxIjc5KtjJfNlxgXzR4uMj?=
 =?us-ascii?Q?LK0YDYrBd8OQdgdGdXTF8yruWP1cplvHMUrOkJW6DYl2Ds50hRCQcMw2n2vO?=
 =?us-ascii?Q?6qII7VQ9naxnDPHTrRaXTYlsud/L625FztnpNfa9hDC2UfmxNsAkeYWLp7d3?=
 =?us-ascii?Q?jn/h28J/gaJli39Rav5xLHFcB9Lk9TW4S1bJJFScvz6yitlELks+Fd1nv0hi?=
 =?us-ascii?Q?f8QSOoLEnDphB+unbe4VP5t2oDsaskBeGy2e4z9maP2V9PBtGTAYHUonWB9/?=
 =?us-ascii?Q?TdQA0nq5M0Dd6DGBV/Ps19uMQawQe4eqcjB/9FGOyDB2I/uoybyrcd2E9ewC?=
 =?us-ascii?Q?O/KW7zQXyLooyFqUM4Gm2Uh2+8MBvh3MzYKVJS+8AIAtiHtWV3hgANUlT2ix?=
 =?us-ascii?Q?jTKipt3ihUliU1uMMc91DZW31m7YudtUkMEr+PD37Xq3bj9rb/RjjQXOwgny?=
 =?us-ascii?Q?6lgEpuVlVTUCWFsHJzZa3WYboIujhMe5pLnDe41Ol1M9Y+FsQ8lfYxvnSSr1?=
 =?us-ascii?Q?9f/kHSpFF3Xmhrn4erJpLNUUbR/ZH6OPsEtLGHTObwiM4737JDeanmasobGQ?=
 =?us-ascii?Q?DbLvhGVtxvyzURl3PabnGExrYJiC6FXPFBDlKN7tc3gcRAw61ug1cnC4w8DL?=
 =?us-ascii?Q?fjqDu0HmBebBaPL9GxaHJQrSO0R/bh7Fp2CXNBbL+oZ+8XtUVW2fWpXVKBlE?=
 =?us-ascii?Q?yfksRyM4B6Rp0xhZ+eCe/CbJc7jsq1bUO8v/J8Y8FjMJdcK8GBUXn8vc8EQf?=
 =?us-ascii?Q?M1Z2PvqmyUVyqVWd5lub/o05DAopKnBWIi2kmOn9oFZRSn2rnNCFxJwkWKIy?=
 =?us-ascii?Q?kmnMoyPkm7NDjYN3UwR4bkefYUYtr+eLkWE5/70vH30Bhi+NjVPdbPdSJ9Ol?=
 =?us-ascii?Q?WTmL4S1RAZ2sZSrEU3hOhcxoEE0WADXPqHafmVQ0Tax97sMdiXe/Ju6vDIL2?=
 =?us-ascii?Q?J1a+aHmKY5B6A3ividx7jzf7crNwjPdwaXn/+a2/IZ2/NnKDmm28/vbozoud?=
 =?us-ascii?Q?fOCjl/Ht6Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8788880f-f46b-4c64-beb1-08df28639743
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 13:20:31.5665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VcY/Bdg+bLaG3NgoJD3zJq0MpDXErZBfG3qj5czurTobWotjU5mrzcX9sbOpmr1tz2FVcoQPsjOmgoeQOKxornOSFFvjhJTxqZOj+i9flqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB1966
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 13:20:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247660

Release: https://www.pycryptodome.org/src/changelog#october-2026

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...n3-pycryptodome_3.23.0.bb =3D> python3-pycryptodome_3.24.1.bb} | 2 +-
 ...-pycryptodomex_3.23.0.bb =3D> python3-pycryptodomex_3.24.1.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pycryptodome_3.23.0.bb =3D> p=
ython3-pycryptodome_3.24.1.bb} (56%)
 rename meta/recipes-devtools/python/{python3-pycryptodomex_3.23.0.bb =3D> =
python3-pycryptodomex_3.24.1.bb} (76%)

diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.23.0.bb b/=
meta/recipes-devtools/python/python3-pycryptodome_3.24.1.bb
similarity index 56%
rename from meta/recipes-devtools/python/python3-pycryptodome_3.23.0.bb
rename to meta/recipes-devtools/python/python3-pycryptodome_3.24.1.bb
index 1b2a5edd38..0aa53559d6 100644
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.23.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.24.1.bb
@@ -1,6 +1,6 @@
 require python-pycryptodome.inc
 inherit python_setuptools_build_meta
=20
-SRC_URI[sha256sum] =3D "447700a657182d60338bab09fdb27518f8856aecd80ae4c6bd=
ddb67ff5da44ef"
+SRC_URI[sha256sum] =3D "3f9e74444c0ecbec7af232a95d282c74b114d53212ce075ed1=
7b7fd7dca32bb3"
=20
 CVE_PRODUCT =3D "pycryptodome:pycryptodome"
diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb b=
/meta/recipes-devtools/python/python3-pycryptodomex_3.24.1.bb
similarity index 76%
rename from meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb
rename to meta/recipes-devtools/python/python3-pycryptodomex_3.24.1.bb
index e2120d9972..b24e047a19 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.24.1.bb
@@ -1,7 +1,7 @@
 require python-pycryptodome.inc
 inherit python_setuptools_build_meta
=20
-SRC_URI[sha256sum] =3D "71909758f010c82bc99b0abf4ea12012c98962fbf0583c2164=
f8b84533c2e4da"
+SRC_URI[sha256sum] =3D "09081666ffc599976c0b8b29caf2cf82212c0f05bed233c8f8=
ed53e4f6e1d356"
=20
 CVE_PRODUCT =3D "pycryptodome:pycryptodome pycryptodome:pycryptodomex"
=20

