Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C388C54EE9
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 22:39:25 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.76])
 by mx.groups.io with SMTP id smtpd.web09.2157.1662590359627453842
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 15:39:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@nxp.com
 header.s=selector2 header.b=SfwoXBNd;
 spf=pass (domain: nxp.com, ip: 40.107.6.76, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a5HX9gwePVw5ne0F0vsKsyY518ErPcBpEPY3MhTxgi0UYmwynZzAp4A39I9B13gT+68aqF8rfrmLcsGSDIKAODrzcNAdEnd6Mp4/Pb5rw9iFvGFfguQTAlTz6m4L54lVD6fJMjurvAvoUiUgGUF/D3FY8FshxPgoka/BPVLXVwBkYNYbyRUvHrh5qsnvWYD8GYqfWhz9dTR2deu8YUIbrs94Yw0dV5PkrEhHsJe7Qa01EHNkpNGQ6KFEqtD19q+ftjW7fa7jNDOVaE08Q61ZoEUVehiltBGPSDN1bfHK0eeR7oMfIRWvV13OFav9DhC5jOpzIUnIqwR3ZvKGYW1NJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdWWmRLq9keJAJEh8LI65aVqVmIfqPOlQvijQp9ct9I=;
 b=JAXShsy4AgXE0KKWE0MvGu4jVqBgLcrKVocbirKSzi7Zd+tQGI5SILxJARbDWmHG2V+K2dbLK9QVzsmvhpRU2MD0Z9jqB1djoz7JZfqJTDP0glukyJRnFtGqwDmUnnU/dRJaS0PdRNJyCwUfOZxdRO5zNJVooB+OA6Nojk2BoYqyRb3+0MGkXIOJggI7ac58wEIyoTmfn3CeGKeCwd14Woa1fnjflW2EcYMsyZABvfh0lBMBiquNzrjI1s6SF02P5eh6p9+SbiVtM3RvFH7SFNJT2fG7JBQS7rDwmhpmp26U512lMVpq+v4uysft28WaNsQd19v+415x91a46P/c0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdWWmRLq9keJAJEh8LI65aVqVmIfqPOlQvijQp9ct9I=;
 b=SfwoXBNdeM+RkZnL9KSEf7bJzIh5IbALA9VNgyZjxBGIKQCcJZLAGh9EBsNyCHnVnzY9FPoSRSaEMx9/gjoqFgfLInbCGkXF2c+QEI/CHOF7F0q+qAHszlvKoPFUnUFxP4or9cDhdBbSKvAkyjj1ZRS9R0oI81RXaFcGZCvL2Dg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PR3PR04MB7308.eurprd04.prod.outlook.com (2603:10a6:102:80::21)
 by DB8PR04MB7180.eurprd04.prod.outlook.com (2603:10a6:10:12c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Wed, 7 Sep
 2022 22:39:17 +0000
Received: from PR3PR04MB7308.eurprd04.prod.outlook.com
 ([fe80::2f0c:165b:8713:d1ef]) by PR3PR04MB7308.eurprd04.prod.outlook.com
 ([fe80::2f0c:165b:8713:d1ef%3]) with mapi id 15.20.5612.014; Wed, 7 Sep 2022
 22:39:16 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [PATCH] cmake: Fix CMAKE_SYSTEM_PROCESSOR setting for SDK
Date: Wed,  7 Sep 2022 17:38:51 -0500
Message-ID: <20220907223851.3800857-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0179.namprd03.prod.outlook.com
 (2603:10b6:a03:338::34) To PR3PR04MB7308.eurprd04.prod.outlook.com
 (2603:10a6:102:80::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3PR04MB7308:EE_|DB8PR04MB7180:EE_
X-MS-Office365-Filtering-Correlation-Id: 7474e4ef-9e69-4d4c-d1b6-08da9121cbbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PCellpMdvjbIBAavZMXZlPQTO5EL5HHjfeOI1EdIyUZgV+ZCE6ejksUDxbMoqCZVtOp58EZ0mTJuyEiGN7n5fKXpoV/y0hS3BDiz45RzcPJli6HIJsVBR8AA6AG3Rb6POh4vndRfSEfWJynoZdBBBl5SxwpSOyUFylu1pMt/Bjymdljh0FLsGvAwThht/t1uPUIZK+X2pj3QvHS+2mBIcWETAbBNZN6vXKRrimPLY259RjqkvCzJOdptlqoa3kHnJbe/AEpArOaMvO/n9WGiBFXvBRgMIA+mfJJi4yH0Ghx08YQa1TVuDcmj382HtXceq4p1oOdSMSQ1eiGBYuMIFumO6Z8jLNVhkZ56TRp+iM5OMB82PTzebY5mPIi0YN2TqNVXGSFnXTPvw6wV6WU8kYNzWogKTt5GKwaVqDhZks5Ufs7yYjUPe/W7JwF/lh5HPVOmR9RJU30CsYSsOkI5kuXlIRTBPjYYW1RboQSpIy41cjfhHKXCT2lNI8ZwbC1lNGL8y3uQX3y0Jplaqt0urJoOYW53UjZIbLBtoXC9jkPBjeBWx5nMaYG3Tcoa4wXBVmFpcGzcR0bpcurtd0w58nepjdJfTp87kamC5CvO5jl3ZQo+XkL4hKDpEgZvsSKmzHW8O3BwmCKJaUsN8LgXQdzONSrgntpDWSAA0GcC+PDl0nBHCUk8aogbI0bXKXiqbpXoj82Gt2693I0YSkcoMjGZ1MC9ciCWZMZy8Ft1nYo+o1EbgoKlByRRNRCqmuebTQQM0FuG1QKwPGQgj/aIFg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR04MB7308.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(376002)(396003)(39860400002)(346002)(136003)(6512007)(5660300002)(44832011)(66476007)(66556008)(66946007)(86362001)(8936002)(26005)(6666004)(4326008)(52116002)(478600001)(6486002)(2906002)(8676002)(6506007)(41300700001)(83380400001)(38350700002)(38100700002)(1076003)(2616005)(186003)(6916009)(36756003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?l6Wa55QWkrOxt/feVRyTNb7JiKojGwakOfudJgmu+Gv5WGLhlTpKYDSj0BHg?=
 =?us-ascii?Q?vkCvQjyyNB2Gi7XLkMCUX2VogcPo1kj2mNDuFN8foCPnXtmY9Uyh/H1cggN8?=
 =?us-ascii?Q?j/qxtwGicfiNtf3QLXJqMeLGLUvpw5C4eixncqQ8Hys2PUeJSsxrSVFEMggL?=
 =?us-ascii?Q?ru2naMhCsHUkvR7JqVlU25Yky+yTeSlnC4Cz+ow4vmYDzGgiDkNG5XSlPnKH?=
 =?us-ascii?Q?RCO8xAcUkZsqHbplXY5phfVKuGFXE5OghT+Jge9c3g965lZeAhDf9ItGiUyY?=
 =?us-ascii?Q?Dkr33DhD2saen1I167FvAHQSHgKZHnMCwBARTIRdGr0SFjWfR1r36SkJkF1y?=
 =?us-ascii?Q?13jSv3PFzmq8kgVmyDQ15uQuMKZCHjNTY3qeaEzeTt7uOMFAC8AebuCKXaDE?=
 =?us-ascii?Q?jJVKfTSgJZGhXTeAv24BbrF5DjgKIfHudosPwMbjUdQLvMuGjA3MMLP2w8XL?=
 =?us-ascii?Q?zBFtKAyCrG0jVnG/I9G6RMufEyk1m+uh5aPXJPkXGQjO7wmBr+41zAN2vrCj?=
 =?us-ascii?Q?okr+ebccew8D3YxTaoT4yS/l/gPscnteZve2tVyUyqAgGNmDOjJq8hEoKKy2?=
 =?us-ascii?Q?ADwYxl5ECWQVEWXR+2ta84GOITVoafDtWgV3n50YRxZd0Rg+YbyETY8JZCXi?=
 =?us-ascii?Q?9yPjjNUp6zWIgbMiR7eh2tOumv3HLZrsEu25hnxr+XHSLij8Mc4MG7m6xPUt?=
 =?us-ascii?Q?BhBvus3P+x/a9UgMx2C5xK/aF3d3NLDmPrA53VsqhKEpJfxb6Unpbb0UJTFx?=
 =?us-ascii?Q?QjlWZAgIXDNEjEe88kCk5Y9ulKEkXqBgVkaDBBgyQvgexaZkbR3nQhZvK6uB?=
 =?us-ascii?Q?q7CRZaJxqG9lDphPhXPNJMbvyNRY9oYdbF97H0raaBy1AWw61tpAWZCjqaZZ?=
 =?us-ascii?Q?mJzNpZ7ckniy9NBrUysnPxmml5UF4blHplIjYk7rYzjR1q9GC3AbVuZy6k4g?=
 =?us-ascii?Q?FEI/0xMa/gunuTNmAOEzNXJ6SQ9X69mtz3X2xXssQ2f6/ZgVuAQMEWsZUaaR?=
 =?us-ascii?Q?q+/4fxNbt3XEwJNM2pDJbuJVf09sn9XlbCJDFU2rAi0X6tqyxm8Np+TEmOlG?=
 =?us-ascii?Q?uwNU81k7fj1HbRKQ/ePFdg9kvn6m3UPUD3JZHJqQPBR03yVWFTV00rBiQ428?=
 =?us-ascii?Q?/WETl8c9LAQv0Sl7KhqxcLTsPIq7wITfG/G5LLRlsqBYfOuOaqagZKZjnHcI?=
 =?us-ascii?Q?qBUBoeQSP5li75LvZTmsBnH+bjQhirD7a2PW4u9nxR7HNDquJzk7/YF6fkwf?=
 =?us-ascii?Q?9qW+UXBeLFcpXDcN4pQ4OiflopyX8E4S8QPKfqGbLyQAF5ntDZZ1Nk8jcMVx?=
 =?us-ascii?Q?ymlLr5//I52C5kYLvNwkBCSD/D9tP9YGoQDNo5PxfCVCSpGnp/YsyPtjWXDA?=
 =?us-ascii?Q?vDLThamjDYLqnZwZZWLayBVzzz17bSG4/tJwOl4JvjIMSkhSWSwkdFOjHsr5?=
 =?us-ascii?Q?xD/P18Sf2IGjXImvzm8kt0q5pKEW6ZIyn++s56nxiFQmtmhRrPzPFNqpMk/b?=
 =?us-ascii?Q?U2zb93Uw9c9kU4sWxbGj96o2oKjqvsQinvvFmPpip+46GatoBhUJu8OPb+9E?=
 =?us-ascii?Q?IdQqjXkrOTJilhvHmMYY0UWK2Nxkp3oHXrUj7KDK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7474e4ef-9e69-4d4c-d1b6-08da9121cbbf
X-MS-Exchange-CrossTenant-AuthSource: PR3PR04MB7308.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 22:39:16.8232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dOn8gfvWerzu2NL2VDFiY6zbVqqhgE43TbXh31VqHxjfqrXjDJ5KhI7wv60AepxmgZycA5h0a26fdn2WoXvr/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 22:39:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170432

When building using an SDK, cmake complains that the target
architecture 'cortexa53-crypto' is unknown. The same build in bitbake
uses the target architecture 'aarch64'.

Set CMAKE_SYSTEM_PROCESSOR the same as for bitbake.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake b/me=
ta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
index 3ddef12c83..d6a1e0464c 100644
--- a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
+++ b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
@@ -11,10 +11,7 @@ set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )
=20
 set(CMAKE_FIND_LIBRARY_CUSTOM_LIB_SUFFIX "$ENV{OE_CMAKE_FIND_LIBRARY_CUSTO=
M_LIB_SUFFIX}")
=20
-# Set CMAKE_SYSTEM_PROCESSOR from the sysroot name (assuming processor-dis=
tro-os).
-if ($ENV{SDKTARGETSYSROOT} MATCHES "/sysroots/([a-zA-Z0-9_-]+)-.+-.+")
-  set(CMAKE_SYSTEM_PROCESSOR ${CMAKE_MATCH_1})
-endif()
+set( CMAKE_SYSTEM_PROCESSOR $ENV{OECORE_TARGET_ARCH} )
=20
 # Include the toolchain configuration subscripts
 file( GLOB toolchain_config_files "${CMAKE_CURRENT_LIST_FILE}.d/*.cmake" )
--=20
2.25.1


