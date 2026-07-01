Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F60C43602
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 08:26:53 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40299.1782894408228268543
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 01:26:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=MxX7p41j;
 spf=pass (domain: est.tech, ip: 52.101.72.69, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mTwrBRyZZy7MwsNjDK9c9ZyH+RXK7z+q5ikJYyXrLD4Rwnj7QVuTgcYbxIst5aTIIV8T2yaFo/8nWuwc2uIMGS/l9NsjINcyZzLyNBsWtVj7HDaKwOSdQ7DbVFYkALulE7r53p/SEUH+UyRdGbPUdvilQ5CE4F004rc2iXwK2pBubsMpTZ40x+KJf2hgRDD3pOmxacs2lpn76yAC/+wLivpc0gdLxBgcZVI0Sxu3Su23Y2VtP0G438pKSB876RW2uK2JgfTlzfaOApLs+Xoi2oVaIR4ooBACjhdg2nHdG4hFfQFnxeWHznKMk7CLLxSHXruEAuFu9dySm/LsEgSITQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wUG+ESmZoMLzUtqQTbE1qVma4fRqIxc3QYGfotMMYLY=;
 b=PXs000TaiwurH1eTCV2GPxrvCg9hsR86+QJ1iymtUC7Q4VHnZ8Xb715qL9gSU7Q+XFi17JJgEVXMhCxwfCzdru+EUIGzOjRTx21VGV7h+qdciGJoBVh1dTrVdpkFmq4dDSwA5TfwDy1OeiY73hlKe5gG/Yw0GwTGmqNXYUFV0SysHiNmyw3wVBac/cmXlaFz0bdt8kX+irvcMWKbiuBfSsIMc02AP7hL4Zhxfregge6U4MgS6MZBhgOJeQm/pe6KTrIEhgiCpjcj0QN4ksZBqGLhYpOCmlblcISSPecVvIS4zJn8KYFV2v9gRxumW9eoHn/wJ3YXPCxELr2x2hk7vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUG+ESmZoMLzUtqQTbE1qVma4fRqIxc3QYGfotMMYLY=;
 b=MxX7p41jpsFUM8BXM6wzmINefBbQxeBzeomKxyjxUw2jBYOVoOGfKnpuht8dlaI43oUrw1uoit+Lj6n8o6mfsnEbbDJJWEQrgljYg6H74+Om4wxbgTSrklkhBxp0Mx85vMDwrfz9ObUKqi580SR9uJu8y85pVKTqErlgdSg+T0+jzf25yNY121IYaYNhKjjzEh/YBgnt7/Nove9zfR/N8YSQtUsaJPlyYDnSjqTayOx9GGBFrkRQvuaI0/iciYtwbguwzHKakHa3mjagmmxBwMb/hPReF1tU0cCmdMQuklM1B3rm3+dINpfAYM6Bi6tJ8PAhAZkro04myxR08qBVLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20)
 by PRAP189MB1873.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:278::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 08:26:43 +0000
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d]) by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 08:26:43 +0000
From: Roland Kovacs <roland.kovacs@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [master][PATCH v2 1/2] gnupg: Upgrade 2.5.17 -> 2.5.20
Date: Wed,  1 Jul 2026 10:26:38 +0200
Message-ID: <20260701082639.69648-2-roland.kovacs@est.tech>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701082639.69648-1-roland.kovacs@est.tech>
References: <20260701082639.69648-1-roland.kovacs@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0129.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::12) To AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:111::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB0725:EE_|PRAP189MB1873:EE_
X-MS-Office365-Filtering-Correlation-Id: 4432814f-5406-4dad-85f7-08ded74a7b56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|56012099006|11063799006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	IRRcuk14v0ZwyKtkREDh2cQL250cY/a4sNGVpU+pjf6jv2qjuJB3Vbxvc2Rkuyk9wwMNubU49sWSxjWFSX4fA2J5Rwg+giTpAtC7aI7uqeDcPuDt7uYeSqysq0hyaGQtLzASVretGytTPXNEEBRNlyWhIFXnH9oAkq01ZYIlH4bEGjU/5w6CqAXulprBwNS+I08ZjLdRr41wjIZwdUXqF2nCa1yVbCFmV/NisIY5oX9G66/DlQlpgZO5bsTWyrKdWnPkq+SqNtz5GiYLjmQeARaCHvzxiYU/ed+i8pqYBzo2KQtd4DGplGAyXSmHEpKJuSurGzzulrudbVk+xEH1ehToeRjoERySeijDGNV/5haxbezhIB0wdV+O2JTzoxNmSq9OQwBb9gvVYsUZn2KnYxZHduVo4eCM/foGiNauWry62d7UNkF0Dy4z9vk63q4v/+soe4fc+c8/RD3n8MFvtnL/wxlcTDhk98Oy6su5Nw522GHyopeuUo9AiM9kith58Oku46FEzeD3xwK42sH6DAKpTB3Nksu6ygi1f8fHSLIuMKVHFjGu+1AvHSDWclT5WxnI8m+BYn1aqJuTy7I+eSkDOhfKOhiAPOQ3Q8H1/T2XlPmeANpJaeG5Mc8Fvsxz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB0725.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(11063799006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dJE0WE/DU9bIzSy4+UEH5ydnZjeGpgzIpTR1aRAoJdP3PQgbN2OTTp7B0A+a?=
 =?us-ascii?Q?jg3jGyx2TXfcBXWN9M6pvt7F418SxqWa59ayV4C4TnubfKonD7JTagHl3/qs?=
 =?us-ascii?Q?1YQN0QkondOHtI0VD0RwjwHSj9YqS/ZR0IY5L1LQMP5Y+FirLTtz2NHUdXWG?=
 =?us-ascii?Q?VsgAZLx2gxPukRz6cqWXfFgI6vF3gBPmhtdllElAIAvQA7o61J7isp4kIXoQ?=
 =?us-ascii?Q?WR2SFj25ImVQQWkpG4KzMHW3RsYjTJmbhH8apo3WyuI49/0lFdfAzQV5iY0W?=
 =?us-ascii?Q?Sy6fvxrU05D94ZPa77nphaim4B4NVEpu49+XjMSxQSht1o7B+7RqyihBv+qR?=
 =?us-ascii?Q?6R9y0Th23wWzznT7+z3PBTl618Ic3C/t2a/CQDMk6Wxy0LjfyNnHE+ORxf34?=
 =?us-ascii?Q?fSO+WGHQgBVDY3ARDM2pesq2FgZlJJh00fYnOGUz1X76+VhunnnHjOeIVE9T?=
 =?us-ascii?Q?A+V8jSyINW1qMhUq00KTc6MZ1JS19dYrwIftk1WCcW2KEpCgcFYqrx3HoKy8?=
 =?us-ascii?Q?+ZbgZuzsC/wtbbEbUc7WmWRn8fPheV1GJiu61Y9O9RXZEKQowVwiI3t3lxqx?=
 =?us-ascii?Q?v/3dPeVEELG76kvoyuX1cIT8SwD/iKDhbcH05mYuruevcEUGuOru7lunrSG5?=
 =?us-ascii?Q?7BMc1s/U6N7ih8JgcViec4dOkXVEZiads0TNQhZFehugTzh7WdwwG5J1ayJX?=
 =?us-ascii?Q?AbqMSNglMYsAf5WKIKZDA17qa34uMBsDOY8JMQiTcYq2dZ9RKPwBZbrYOc6V?=
 =?us-ascii?Q?sFVSIDwDTqfhcWkzg7ufHUrg++MG42qOKPfR+HeCgp9XOBzVUXku/RjS+EYo?=
 =?us-ascii?Q?RUksInwla/ju7ooLV9k1BQ8WdfpeAyUHt2flDxlJdz13ggqNFO6jyQ/rBt1t?=
 =?us-ascii?Q?V0BbmcNon0FFT60MYqmpZpF8Y3v6AK9axuI/LrKMBpjpqbUBU/7mCXHZbnT5?=
 =?us-ascii?Q?rgebu3jpVgg/R93IqiyRGrBQagexAJOaLF2NIWC/5NXd7/UNCWSILAbgya0q?=
 =?us-ascii?Q?35lpR5kLqqauFmQGtSSAWS+shlxNXXkp7kz9Etsgx7bpFmAwEGQE+n3T2kEL?=
 =?us-ascii?Q?vFwJLzq5quooMT5EcRyXUQPeSvsPpXlPdI71GJ3Bw2b5iAbbbKkvynpVpVFm?=
 =?us-ascii?Q?FL0hfJOrfYDbEQo3QygjXTg43NvX9NXTFnxNaOkF04fJKJ2mhPjwYiEpSNH+?=
 =?us-ascii?Q?gCrrMYoR00r3KrX07sIoPQZD1JJtqHQ4aWkym2T7Tnbi9TNM0ifUY+mEmOlb?=
 =?us-ascii?Q?FQm0ZVyJXvJgDpToZD66knb4MacpPXaYj4S1kjSei178bAElq0H1Ck52bENX?=
 =?us-ascii?Q?B31d3NMJixVRhFFV8xz38ceaGmkacu8AEMhE9xfcpIYJQGXRp9jtomCN3wPq?=
 =?us-ascii?Q?x/m+uCQcl2fbaa4Emwy9RulpqBCMmGrz6hfwb/pbhhy0Evws4IrUHcIPMen0?=
 =?us-ascii?Q?DxPMBjTLQ5tQjQDz6IPlSsnZFHmXIeBgLJjjxznnNNx4FnjxE0+rpYqhqVH1?=
 =?us-ascii?Q?Zt+Mkl/mWrFep9CXcE0D3G+6N9ZSL5NozanV/jM7//CNI5bzLVmRuqjARj6j?=
 =?us-ascii?Q?mIc2M88dkq594wMN/L1WbqZ8dJyTv9UryQL0CBGYOjT0S5DVR47K3NVOey4T?=
 =?us-ascii?Q?xtY3BCOWEtXyYJnzez0NnISvXYOxBMvLC+yGVWtxhGlOZMJNvX9q8o3NA9fi?=
 =?us-ascii?Q?uz7FAsAvzHCE6reCRfbVD911Sm8NmznFvGhfjFiQsozBDTS59X06Bf2JHldm?=
 =?us-ascii?Q?4dnVOqd+3w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4432814f-5406-4dad-85f7-08ded74a7b56
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 08:26:43.1452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j69cxX2dm11QJvkvP7Qm3F2syNZRmWuoFMBnTic10cJ/tLqeDRVFR3BWqIFG81lCCK/U1vEX8QjHXC0qe9eVAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP189MB1873
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 08:26:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239956

Bug fixes included in this release:
   - gpg: Fix wrong assertion failure which could very rarely occur
     during key signature checking.  [rG693f5642f6]
   - gpg: Consider certify-only keys for revocation signature check.
     [T8196]
   - gpgsm: Fix possible double free in the CMS parser.  [T8240]
   - gpgsm: Fix possible too early removal of ephemeral keys.  [T8236]
   - gpgsm: Avoid emitting a final FAILURE status line if --status-fd
     is not used.  [rG69c27fe377]
   - gpgsm: Fix a regression in 2.5.19 for password encrypted GCM
     data.  [rG60a823c97b]
   - agent: Fix not using cache for pinentry loopback.  [rGd4b608a31f]
   - agent: Fix command PUT_SECRET by saving input line.  [rG1875bc185e]
   - keyboxd: Mark keys searched but not imported via LDAP correctly
     as ephemeral.  [T8048]
   - scdaemon: Avoid buffer overflow with SC-HSM cards providing RSA
     keys > 2k.  [T8244]
   - dirmngr: Fix uninitialized use of the dns_any union in
     dns_rr_cmp.  [T8251]
 Release-info: https://dev.gnupg.org/T7997

Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
---
 meta/recipes-support/gnupg/{gnupg_2.5.17.bb =3D> gnupg_2.5.20.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnupg/{gnupg_2.5.17.bb =3D> gnupg_2.5.20.bb} (=
97%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.5.17.bb b/meta/recipes-supp=
ort/gnupg/gnupg_2.5.20.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.5.17.bb
rename to meta/recipes-support/gnupg/gnupg_2.5.20.bb
index fd6588769c..68e1316668 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.17.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.20.bb
@@ -24,7 +24,7 @@ SRC_URI:append:class-native =3D " file://0001-configure.a=
c-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk =3D " file://relocate.patch"
=20
-SRC_URI[sha256sum] =3D "2c1fbe20e2958fd8fb53cf37d7c38e84a900edc0d561a1c4af=
4bc3a10888685d"
+SRC_URI[sha256sum] =3D "6461266e99c308419a379abe6c356d54c214136c4589bd6595=
1091138989ffc6"
=20
 EXTRA_OECONF =3D "--disable-ldap \
 		--disable-ccid-driver \
--=20
2.34.1


