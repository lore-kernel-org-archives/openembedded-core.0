Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA09C4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 14:15:31 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.59])
 by mx.groups.io with SMTP id smtpd.web10.187049.1698761728879158976
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 07:15:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=JWIUz8Xp;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.7.59, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUckGXgnpyldHUMyCYw52kIn0yC7v+CAsiz6Up+TV21lUbA0urV3S6bQ0vxdNjWZh0AIiDwUtta48GTnQ6ChiJd5U/+fA8N/5OExBgES871OCAj7MZ906MEWzAiTto1G03pFHUkOXvUxwJjM5UNvMigq4NNrFICYJ7APefmH8sqcVty+dLnjlUUoyclY9FZ9a85aNVeJdEQA6ewXTFOut63EGqn0OXHA6NUerAfkfmrGFWO+VZ8GMUHaLC4QOL5cfjWIhIAxsy+pr1vVIW5HVWnIcg2gjpuODqngHd8C390t/PoA8inXfkJ5KN1+3y2Z1rCqsBFNuqWnsk8QHM4C5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZzVvcHUV6XGcOfjAnYXvaryTOUAEjErPwNLsDz2wUs=;
 b=EtkXAnsvOLO6HzFASQm8yNEioaGrARXt9j3H3ce0WXNjEKDnb2qp6aUSQrtDTRtpepcY595UtncsHP0yhgHFRlkqUzxBpelCyZoORxzBz4R/b3J80vTnzWmVLA9ytN6Z3mk+UWwQQGsrrISt8jL4UOMBodlpH9bxjyK57PxJhd4WJpLEaUVrqt4QnvndrovOPi13n9oisg1439/DHCy9L/kKbkBlGrfz0iGlPyjwfaP/d/tVnZSkbE8AY+eEMwEQveQsbdqak246LrgZuQhpEtPJT4UePLI+toTkg+JFp4jdJb0AdvNYITvc5nxh0Xn/pg79v+AFFYLQCc3WaZDgLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZzVvcHUV6XGcOfjAnYXvaryTOUAEjErPwNLsDz2wUs=;
 b=JWIUz8XpO9Dhvw6AzF1tcxSgp9yKAi2CJVfrWgY7cj/SNm20Mksu1d6NxHzQEtxuBUTN4LLHeL/MIABtWfM6eK5lhNxw7/qkVv2sNR2QOFxokZTHfT8vCBO7mtNp7L3HO3BbYSyIfoF2Et7L9K0PEOH+Py+8i5TfNMf03v0tdfoie+7+p9/5T/WU966VQu1Ac2h3fTiFzJVal0kP28SidgvfEbhWutXT3CBjiva3lYDjvpsjB5DuotG8iXdSMcjyuWzUAe8rFaDfdpFwHta1wLjaG0FC8G5dYBnv5og+//4L7URDf+TRw4YPwEjJY6g/QM7nRVS8wUD2rVt2aogcbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AM8PR06MB7044.eurprd06.prod.outlook.com (2603:10a6:20b:1d2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.20; Tue, 31 Oct
 2023 14:15:25 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::746a:49b5:ef81:9ff9]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::746a:49b5:ef81:9ff9%5]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 14:15:25 +0000
From: niko.mauno@vaisala.com
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH] ccache.conf: Remove obsolete configuration option
Date: Tue, 31 Oct 2023 14:13:26 +0000
Message-ID: <20231031141326.3750548-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0047.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::22) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AM8PR06MB7044:EE_
X-MS-Office365-Filtering-Correlation-Id: b082db34-0dc8-4403-eb9a-08dbda1bd3b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XZNNmPmnMEoDuRw4GggEZZqYbvx85h3oUwZDdzdgOnuGg7pN60pkWOa3BAoAXi2J7QujLE4n3U1O76Tz7KOJXBd07HfQc2XQUXN1wM1WnPuJqMPpEyyY7xb8MLU4cdX3AMi9LWLo+hWWoZePuak8gzb/ziZ3+6Wr/dMjZmrwdSlgSreZWbRFo9+tta6MHARwfMRO2dk0Vb/Be0t6VpysHnobc5vB7f0mE+QLd3oUz0NrHUXr2wRk/AZ56ltO6LQJjiNk/4P2NE82rNlS/jJVV5aCLZGCX0hibvkVwfBFkNPPtHzR1yqkyxacXgPQ2qKfwN7gkfynr2W6/Ng3i57tzLrVfUTHMXVMGsZdD8FvS4zv0vWsvPGbMPRvwPV/C0RhJr9F7YVhIXRn0uzCfoorYK62mOyRAOticXNrF/OQ5ktsDzJbGqK4D0wPRXdOZwJt2ilAFAIdhfxGscp2ngbkQs7dHFhozSSJHrYzFES09NxSgZ20RPGez6eXg3VuwQfkXfn76LhBBU1uB+BEcPqJC7zMazqmGeqBfjHndiA3d3VIOWokM6yuTtogOXSTzmd+U727yn+OcFsvpSFnTiRqDPXIr8e2j4QFlac3vUGkKOA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(366004)(346002)(39860400002)(136003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(2906002)(66556008)(83380400001)(4744005)(107886003)(38100700002)(316002)(6916009)(66476007)(6506007)(66946007)(966005)(52116002)(1076003)(9686003)(478600001)(2616005)(8936002)(41300700001)(4326008)(26005)(8676002)(6512007)(5660300002)(6486002)(38350700005)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DJRYIJ36YkAQtQgqERRKMAMAehXtkaolBGbYR3+eOuu4s9OU0RiPHWwffc+z?=
 =?us-ascii?Q?iDS5r3+8XxqnTXyo0ZEz41jDPx2UhAb1E808XArVmyx3s1K40mDjo85rXQmS?=
 =?us-ascii?Q?zxsG6UeDWhXmInIQYZkXeXIwO6UJ+aiWuwo6O+dlwaL298RPiLXIYAjrgBuN?=
 =?us-ascii?Q?1fPBjU/UWEL4rzcSMN7Bd1/LmI3a6bSs6owovgdlMgadIovc++PKSr6APd3P?=
 =?us-ascii?Q?DAMd8PA8/NwJEQAKoGqfy9prBnEr8kWuQWw+R8Muo06/XDeLqW9qM85SNHga?=
 =?us-ascii?Q?Dgy4WuwSeM3E1a6tmIzlPbKQlj5wJocKxHgQrC4EE8MQv3Mom/iUi6rXm5tO?=
 =?us-ascii?Q?K7e3vxnijYC55aqa6elcMEJpiZfd4qX6H8TzR63rBGuRH+okXi9mVSE/szhD?=
 =?us-ascii?Q?Ut3i4BhQ/p1WjHaSXy3KoQh2jHR57Pp1KqkLTatUTiBOV5GA8qyMi5rwdYtE?=
 =?us-ascii?Q?NV8gY3idxW4ijn+g/eMUlJtGVEx1ejSFlVzX3haOQh+VujCyG4KYI3gX7Kc4?=
 =?us-ascii?Q?Sb3uBLdWx8sQtKYcc82Y7RzdwmtKKqAhscUxviy0PHGOIGR8gpTUK8HIeYcn?=
 =?us-ascii?Q?6eZjG8fy/kMNFz2CrndVju+7zd5b3MH/rOJu80YVyM3YcCKLnAaEFtxPmLGs?=
 =?us-ascii?Q?IGty0bBoHPUEnn/hRS3gEj1E574KY5kvUAPLiXtFLD0sdJi9dDwPSSVXjxKG?=
 =?us-ascii?Q?ubzSL9uGUf1xhfWtk2pwlupLiHczail7eFqKxEFr7K6fGUFnHMTjiZlhNH1e?=
 =?us-ascii?Q?oYWN97lArE5i+wHCqvS+O4QJqtLAmbPygZIcjolrAajLBivsnmWclDCmlmqr?=
 =?us-ascii?Q?T5mkYr0mmqAo/BGJ/1hXiI5zMFkrIWE0jEOqn0w8S7slKnmDUiON0uWUf0xl?=
 =?us-ascii?Q?3DmZT49f2WrTGbsO+e4Aq0upGBvlTHGcAgmOqYmYUMlM3LCB+uwfZB1c6mOU?=
 =?us-ascii?Q?NOh/sixbH3GWYdjZXn2XtoRpZhmPoRpQrV+96vZ6qSRphL1rartieBTs/TVU?=
 =?us-ascii?Q?k0oQZLPNxoHfmmLTQsV8ZXmn9ZTUFSF5Y0+eQI+C8DvZ6UKofkmjmUJfWyZD?=
 =?us-ascii?Q?9GzzXuQysvTJDptFcVRlG+dcq39RNHvu6mWwAHQbRFBt9/zFti08dyuRyz3q?=
 =?us-ascii?Q?YSPSqivLqmX3FPiFTThY68tW6oy2oYicjx7Txuklf/yZ1/hHm32ucYNc43LT?=
 =?us-ascii?Q?gXJRUdaHBd8el9mlkou589qOv1FK3UOHHp6ouJyx7yJ/m8jCCuJ5Fs/ZG5Qs?=
 =?us-ascii?Q?HA5OCJ4RR5Zh3SQDdb8fvWhTFSDDJctBP+pN8VIPh4sY7EuJ5RwPzBbpMLRD?=
 =?us-ascii?Q?7vlndUQXVBxl0JZXJ5qy+qyB1dUNJB5lszpBPKgooa/R4cRcezivyocwbPNS?=
 =?us-ascii?Q?uks2EWsDvS0QYndfSsEasgmEMbrhtcqSRaS+b6KmJZTIBQb4AY3JhhCsCajz?=
 =?us-ascii?Q?bQChaccAkoRBFYX6cMRcUkX3w51msNdtfiN8mZQoFBWCKTR8IR6XV+ub8kQ0?=
 =?us-ascii?Q?rnXcIBqbXJ7V6BSL31FpXt0WJyXuHtr8p9EvMwTSNC0HETrIw2f5hlStBC7J?=
 =?us-ascii?Q?dFi0xGxVGM/FdTf+/2ax951x91EDSvHmclTCKiAV/UlPlSDeMG6WLoCkDmjO?=
 =?us-ascii?Q?8Q=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b082db34-0dc8-4403-eb9a-08dbda1bd3b8
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 14:15:25.6022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ag3TgSgdrxWf7HAnoP/K+svtkQ/1CEdHiVj/IJZnAssnmrAlbl1AITG3OMIOBxnTp7kXvOR3N6J1G1mW8cQ4dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 14:15:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189844

From: Niko Mauno <niko.mauno@vaisala.com>

Since ccache version 4.0, according to
https://github.com/ccache/ccache/blob/master/doc/NEWS.adoc#ccache-40

 * An appropriate cache directory level structure is now chosen automatical=
ly. The cache_dir_levels (CCACHE_NLEVELS) configuration option has therefor=
e been removed.

Therefore remove the option which has not been supported by ccache
recipe version since Yocto Hardknott.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/conf/ccache.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/ccache.conf b/meta/conf/ccache.conf
index 931012dec9..4406ae561b 100644
--- a/meta/conf/ccache.conf
+++ b/meta/conf/ccache.conf
@@ -1,2 +1 @@
 max_size =3D 0
-cache_dir_levels =3D 1
--=20
2.39.2


