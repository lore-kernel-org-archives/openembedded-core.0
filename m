Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB2FF9B5E9
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 08:55:31 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.37])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76313.1776848086562797618
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 01:54:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=U7GuBTt+;
 spf=pass (domain: est.tech, ip: 40.107.159.37, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=catN727uv0g63CUBOimLrLrEGuR9hZarW8EjcDhCaeeNOnojM5StimJE/Wol5f+O6MisZ8v1XMOryYz4A/51v7AdkS3EV21fQISDTPWCLTukH/p9tVPalvbGzowEd05yAzu/GvRE7PC8sDAiwr30jVAA4ntJ776G56nI1A1eNjHGUsCfZtFE348vKZ0DqMrJBTWiWg3GFQNjm9KCtzBDf5e1MjOQRuFasYbOFVX8+fpWpjDeLtQ9KlmDTjmAKEd14MJAHTLLLNQP+vzuIx5vnlCvuSME9V1vd74LYR8K4k0RmLfxuBpj44ag4EdRQNAOLdOzexc1X3FUfcLh5eLUjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdQ412qSlRh/W4QBTjxQOCzWqf54Q8dVnMfniNfSd9o=;
 b=s+tdhYiPn6VQthAKmVhkx8yiQUhTU7ygt3+nyx3/VoQtqtLxQG36/W7XzZ9F7YygDBiNYLHw3A9q+2eNiI2hN4w4haYu0JP881SYMCJeffd4eOW6djFeNz2L7QhPA6F3ZKMAAAYq8qQNVYTI5UqpZfFdsqDI/qpafsF4e5D5CsYqdsSiTnKvKR13hjSMAHI23Nsl8cgeEuhy+AFw7AGK4Ox24AZKULE3FS1Sq9qtal5fMpkgKdGVUtGMcMareDM6BBaqx+7nGuHV5wMABJHoH2IoFXwsXILxVGw4kHDWFoL5JcM0/qDjaB87BWsVUTPbVNawCeO8iHw6Y1oMI7Rqwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdQ412qSlRh/W4QBTjxQOCzWqf54Q8dVnMfniNfSd9o=;
 b=U7GuBTt+VVO2E8qvUUvogUlXcgb+cxGiDZgbKZAL+HMiy9Xkp3YFIdA1ToRHP0aUR9hKjXAI9WZmv7m5WMpp+tcYpruJTUCi1dfA9cXbs4bjLg5GADkTDG6MtKesgZ7juEN7fiEufGr2jYjohG75PCLI284qnU0qhxfT/+M3tbgwSXVc5wVxwT5Qe55FXmgYemPVLuoFjKo9qSTs6RUtBl15wvMYX7HyZg1CTOSnk8eXrP46J1038fZWx3bDeVlTNplPTs/CeWuVtwueDDXYOBng3hm0jfZ6oKIhKpGxrgqBU22WIwIUjQJzOlEp0WY2gbus15jK9EPPK3KFsD92sA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by GV1P189MB3129.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:292::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Wed, 22 Apr
 2026 08:54:39 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%6]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 08:54:39 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][whinlatter][PATCH] expat: mark CVE-2025-66382 as vulnerable-investigating
Date: Wed, 22 Apr 2026 10:54:33 +0200
Message-ID: <20260422085436.320259-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: DU2PR04CA0313.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::18) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|GV1P189MB3129:EE_
X-MS-Office365-Filtering-Correlation-Id: 1acee8d8-2cfd-4ba1-b7c7-08dea04cc9ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	zK2gd0Debf7IAy+Irshhce/rD6G/nex1Twdtgxu7CqcSh+hiqpSC+6OzXGYTE5rmAa7MWEpW/N5vXoWgSTDuhCvEadO39uvJK/p6oH/HVU8J0Zgh2DDSnEZKsOMEMuQCG0rwg/P16iL42iTeQymekBhe7gTNisIuCebDqEYr4c8dXs9briflnyg78VfUlbkhFMeYa9QCizmIuknkoPcUUGX1CIVysmCWUdPY+Gg2OeD7lxqpf61awD9NgXYwq07+vVwEn1gskPsyUJl4BBylUZJTCHDYuQbmTTFVk3RqO9wf2xe3JyHhc5SxqbLcOXgKGXjofZUvXCk0A3ajfHLrhLNgdkU27X523Qk8VkyQ6ONktQLc8Qoi3DXToezkyj0ZIHE7ma+qi3drgxp0H0GbW18UPUNGHOd+5Voc5Eos9OoRcg0jBXizPiao3nLell/uf61mRjz8ZP9jvHAOpObtkXn1aH/pghI8CGfgDNPcEoKXKnqhWY1vUZ/axNLdaX5GroFWFd7voZV8iF5t9fu6Siq5oURbF4zCyZ087oEjDBRy5bGq2/hTlB2TB+6kHQ2VURleyhqJL/ntvDXcaF9Zt//i0ULgoVeTh2e4PjZcqeZSFMQIOW5U0k3yYOadxD6EFu/05dHo8wdHmM9reiklwnTAj8C/wXPh11IWAcVdEuDR8kaEWobWbi8jHl6pQ4vxV0z45NrNxPr47n6718TvQGOVnw5sK9eo2IAk5BjfnT4vrDxj5hvjed77mUCo59D/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Wzynf9wj0PTk+VMXAl67n4DHxGWwCd1LKeI6ho14X0IayXg7dPC2CjAyHgjP?=
 =?us-ascii?Q?WwCg4ZKsfS2zCJDpxxk8i0oPv1p49ZvpJWJscKg7CjdJ3E3f52+y4QGYhbGp?=
 =?us-ascii?Q?Sm2shP09r1vXQdSxwU16YaR+k0ydiFlAf10l/Zk1s//rd2sV5sri6Nn+GxKC?=
 =?us-ascii?Q?/aJNNQVl/U0reKpxJl2naybQJ/D6xqWMlyEcooTOC5IHQgYmVI1AzoopkXpH?=
 =?us-ascii?Q?PBhOmM4yxbLRrt/CSZ5p6fCLqyw51hi0mz1jLfFn6ikk4ebQOcOn9H/47z75?=
 =?us-ascii?Q?VjRU3UAqhd8gfiAR8E2UUphG+9Yk7n0WUPvOhpz+ogwXtDnj8cgwi/rFxpkQ?=
 =?us-ascii?Q?Znpis7xCwhwv4uwfk7bVTjU26vIQA8YN0rQU2b1AON4yD2v1C7B81pLrXKIa?=
 =?us-ascii?Q?XhLN+Z3YDja/5YYT4Tjxf/3mKDQBQAToIHoiI5OaLnBQYChWHvk+izI2lECB?=
 =?us-ascii?Q?3w815uvO4ihFBf4PCeHMD3zI594rAUofG8F9x6lE0WobbaCwgfxCQeQhPtjK?=
 =?us-ascii?Q?+vouLYIKSkL7gQ6kFhewuQu+FsjTwrUdeOOpp0BrlBmm0+/bwKumY3BkKpVr?=
 =?us-ascii?Q?FOV9hQZLuF93wDw81pB3X7BIg5KYLJ6m8ho8TIs2Ny6SyNd9WM3KQAq0li43?=
 =?us-ascii?Q?ZeatzxTgae32xsgpbIkLZSD8aPveTXkrkKt+xH1nk5Azgkx81+uQ85e1B9NG?=
 =?us-ascii?Q?EbLWGIlGNyHs/9nRYUr55ks9n7GFf2sQ4Ig4gRgZ1xihrFeA4zV/wb5fA3tw?=
 =?us-ascii?Q?p3XNPvWIDRPtfjqolYj+eHimeHs8z9Hfj0YxVH5clJn0CN164O92R+luCRHE?=
 =?us-ascii?Q?GRVModEi08F/faQI+pJld5ypJBkPV3eRgbfw4vWCMVQlnOaAGxFB1OWGnzU5?=
 =?us-ascii?Q?wATgkoYl4j24DP2eRPAcGymT4qg365BDpBe3FsLsDn0YDvNLk+L2AXqdUzPy?=
 =?us-ascii?Q?0o4dSPFG4Z2FBS2Vu/b8SG35LPrfbJMQWC567M80i0PSot/fnycU5H3wwuRa?=
 =?us-ascii?Q?jZsZHdGPFTB10YyHadbyyLsPObJR3Vln/+ouEbnY0uNTH+locKoWwsVpNxBz?=
 =?us-ascii?Q?sSFGpbZPN3X2+IsKWYEFwtB/BCtd1u9p2VHxO1VJbEKicsHvPhGJjISKvPSC?=
 =?us-ascii?Q?MXK/EoRQqchnph6DBgd6LhxprzbPJXc1oBeEw1bDAJNo9D2X0jt5LFDpVP1f?=
 =?us-ascii?Q?/5J+nv81QOtqZGQl6rvPMdXu2hk4QHByF2VcsXAmmsXlBHgRUV/3DgNOznPr?=
 =?us-ascii?Q?GMGocKtUbEpb9i3enFcnVwtCWsmp1A4dpV2kfmtdr7zQ/gdOXHOsgY+BRZy/?=
 =?us-ascii?Q?iuxOqDq66AR6miXhSoMmVfv1pH3HG33m7aOjIVMaxSTohtLwi8mtFaxaVdaQ?=
 =?us-ascii?Q?CxeAq8GMoKrPtZUUJ4HQOqbZ+r32roWyRIrRMbuens1lgZlsBv7gKXLuOeH6?=
 =?us-ascii?Q?6qIg7qXxEfFIuhxXzh+xftUHpFWgyfFp49K7RfmTfyQPnJ0Ai66czyyS+xew?=
 =?us-ascii?Q?xSm69WdxSZllSBRT8o5xscvsqUlPv7WH39DV2uPPPcxP6C+WMPdrf9hPTku8?=
 =?us-ascii?Q?GtefrUvHn0Cll5E+qWkMFafb3JO+G9XtTDV9a0ZZl6GLkvznYX1gSOBw7FGv?=
 =?us-ascii?Q?E0GXIOhfLM1SGmx5dr3TeAFETqUgdxXGocoYsYHJHjhMIjqSdYyXXLxSq32t?=
 =?us-ascii?Q?VkiXQZCfGdcilTqTZa5FSFtKd6rONTsNr2Jz6ThA0qDAE2SBsplnhBeIoXsm?=
 =?us-ascii?Q?+k3rrdCWVFFgLiMVrUBMSKd521+V0m0=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1acee8d8-2cfd-4ba1-b7c7-08dea04cc9ac
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 08:54:39.6220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rizXXzZdKKH6HFpe0HEJmCXDTbVUL/gbf32VCtbZk2pHcl+HiXac1vzLTxSyeXSxf8pyDlYxps0tnckKAB5uYSIv+Oa11xvHUp5TwcvZOQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB3129
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 08:55:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235698

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

No fix is available yet for CVE-2025-66382 [1].

CVE_STATUS[CVE-2025-66382] =3D "vulnerable-investigating: no fix available =
yet"

[1] https://www.cve.org/CVERecord?id=3DCVE-2025-66382

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 meta/recipes-core/expat/expat_2.7.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/expat/expat_2.7.4.bb b/meta/recipes-core/exp=
at/expat_2.7.4.bb
index f1eff49688..65aee9d17f 100644
--- a/meta/recipes-core/expat/expat_2.7.4.bb
+++ b/meta/recipes-core/expat/expat_2.7.4.bb
@@ -36,3 +36,4 @@ do_install_ptest:class-target() {
 BBCLASSEXTEND +=3D "native nativesdk"
=20
 CVE_PRODUCT =3D "expat libexpat"
+CVE_STATUS[CVE-2025-66382] =3D "vulnerable-investigating: no fix available=
 yet"
--=20
2.34.1


