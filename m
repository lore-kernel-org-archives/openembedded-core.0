Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC1DBC369A1
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 21:18:43 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.24])
 by mx.groups.io with SMTP id smtpd.web10.59866.1744060717594523402
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 14:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=ioGemWw/;
 spf=pass (domain: oss.nxp.com, ip: 40.107.159.24, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DgAppkwTeAdDqrWPK79WJ9WbGQxQh53wZ3xuwCJcQ8FevNSt98z1gqzQk3kQnIloluoL4hrMMgCvgJB/O3m+EKrXadeJVXEZM91Xt2TVSeHlhcEIGMfknDit240nz2dWeon749vw/lZduRLYUEuLqChbnRfID6RSz3aVylhXuShb0AQcp4FC/uNoGfNSUHj4ujfaU58BC9/Y4XnnGgy4aJaof9GCNotU+Is876OEn5PDb1w8Hy3X3Jv1hHjtvjnbv6syC+IJIykHNa9qFjOqGnZSumsFOJZKpw8r4R/PhmI4/kNlGwnPXfQxYmmpyAYJYA+N75HIHAEp36JdQG/GmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BN2bkbn0SV6FjesfBQ3SCHkxhA34PhUiX9xw2V3bCSA=;
 b=fY9+FYua5ZMhuLOVCPMY1+lDJff+vPvJGpHNSSpQytq5qxpsJiPzIwpEn3Wy1q9dCTDA25k8gOvjre33Btor1xrSvkrEqghF6a2cv5nGuyP4yL2TEHQRMlr4sllo7Aq5QkvuCkOGeErD5OmlvsctywnzElc+1taw68yaU+Ev9Z+mNU1QVY3CIPwO3JtTd5CH0HNOW6ouIMQnYCDGD5qsihbRL0NKJ26fJ8zBPUNyJVAkeXC4p/xe3AcNkv5+f4ntni/hHx9R3vocC66in+5aUUWiBrs2lhyxDq1egS/6tH2fqu4FBeXG1ujNFkewhMijoXspvhx+jz/RPa3LW798jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BN2bkbn0SV6FjesfBQ3SCHkxhA34PhUiX9xw2V3bCSA=;
 b=ioGemWw/qN5OTetkKjrV0G1UsdNRcXJI0Cpvh8UNDW8C2RjbkJ/9E6g2NBMHGWwdDSAxvVtM9TBzjq6d1p38VYQYXDt9qXXi8Pq9r5JMnXIafZVV7ZfObcivigXUUaEz0/z9XSmMh6FLhLJTCFdQoMQgR+C9HSyFnpfFNox7+KpBQx1zSecL9NJW3k7irm95bJFQTI1bC7U34El90hXoasMHk4uWaM9w851BOE/fHLPwjE0zKDe943vxx/jS7F8JdZHaoJj0/S3kNShBRScdevuy3p0tneS7ugJJ5Wd+DeIC5YyPmuasVdOhnNSVZ+XCOGEs4nVtUMv54uxvdh6SEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by VI0PR04MB10760.eurprd04.prod.outlook.com (2603:10a6:800:25e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Mon, 7 Apr
 2025 21:18:34 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 21:18:34 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v5 2/5] toolchain-scripts: Export meson settings for SDK builds
Date: Mon,  7 Apr 2025 16:18:03 -0500
Message-ID: <20250407211806.1782316-2-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407211806.1782316-1-tom.hochstein@oss.nxp.com>
References: <20250407211806.1782316-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0164.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::19) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|VI0PR04MB10760:EE_
X-MS-Office365-Filtering-Correlation-Id: 43ef6233-33be-49ad-1f65-08dd7619c15a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XMr0rU56Rm8ze2zwOo6+GoODhGP9viV651Ld8DbjusrGJBkwQw8g2SozIMBo?=
 =?us-ascii?Q?BCLcdRQvdcFYlOXckXnTdIDdP+ufN5MnLH3ppMMPZV6CfvQ99XF77CU4VFIH?=
 =?us-ascii?Q?THiBOVL7Im7ibCrn2QOwyh+wZnpMwentmKeffjJn/d8bGAzTtvGCLUgrVqPk?=
 =?us-ascii?Q?tMQsQj3fBhh+AdM6Ulj6CMCeoA8xiirStFzQxPRxeAQzXJowm1iqbt70L4+7?=
 =?us-ascii?Q?IGzJk/JONLVnyiIxxIcYqJ6gGJ97qGG5xxfABDI6Y8GJB8+xID+H76azoE7e?=
 =?us-ascii?Q?R9aMOtBVzyJFkOd7+L+l/CZY+c2i3AFWicbTciPBx3gGkgqmJHyQwNoj1kP9?=
 =?us-ascii?Q?eESngU6NmaY6Hk5cL1g69EAz+XTv0wVKImII2QhHMa4cR3bQaNpWHk84nor+?=
 =?us-ascii?Q?yYDWfDuPPPBMwqoln8BwY6YpPD8jfOYMFZiHMMJ2nitMSy/qmr+Xe+Dd1o2X?=
 =?us-ascii?Q?HFwbTcIkaKcdi6s/MotLqaRrz1DhpwgZFc3isgwLbomyIGy5GV/h+cg3Gtbk?=
 =?us-ascii?Q?0Yy3DGDgxpZiVAlTRLQndKildhUkWDfPQ4D6nt/St7ubUMSuE3UC3E8SUkMM?=
 =?us-ascii?Q?3Yrz/v5aOXs5SN3v2DRzMB+YRRj6xE32X/JJCNko8E4klE0sZlADg0/w5vcI?=
 =?us-ascii?Q?8qC6H2POUpWCPazqoykG4IahxmMMMRCPUaCMkrAWrboTpQ+5Gso7iRnv98Xp?=
 =?us-ascii?Q?Ft7Zfkpmo0LYbnOREGxy10Qy19jebjV64QieUdRBwcH0XS9L2fT91NyVoR+B?=
 =?us-ascii?Q?qIzC7BgV8UPp6LtD3CrExzwXRu7hDO+mGbIPWih9c9DVCFA+PWjDzKATXici?=
 =?us-ascii?Q?lnluj1w8AMlZt1je4s0tqyazfCPZNpl8K6+pB+JXoQUSR08PVI/e9IxCxsdb?=
 =?us-ascii?Q?6Y5KzMtr/RAVucY3N4oZeuRlBtHaUmtG+AjWjyBGJYtABD4E7/JZGd57HBVN?=
 =?us-ascii?Q?cRxP4FV8E7uNOrnleNynt44WT84FfcPtY36gy9DzCj4lKQ4zj30ahQAUbD1t?=
 =?us-ascii?Q?dYkY0Z/dNpnjGXASncucarZJuJXj03RUKdHsM/XFCvJvomB8V1Jf4nTIsf6B?=
 =?us-ascii?Q?k4uJiMz5I1Djmq9yPMePLoBOBZIw5dTY0qe/huQr4SfmIr1DZ1x/9gMBC4lx?=
 =?us-ascii?Q?VI+BpdRkjXbHoKPDhecBh88fuUsMHUZL4iYtyj+6BcUHSKiKhC5s+8mT6uXF?=
 =?us-ascii?Q?GIvq2gIcYbb+JY9qq/6njA4JBfw1oP3syqqZw88VtW/rI5qlC5XbIhDWpkHo?=
 =?us-ascii?Q?DTTef/xKtNjldWikWYFyj99ghsoowyAwDZE16kJh09XsbEhVOx7wGKoeqs/4?=
 =?us-ascii?Q?oJQOh4emVAUbhc+Uolu1ogTG4Xam8TqKSIutiF99vestvjHLDvsIWs5a/669?=
 =?us-ascii?Q?2/W/gLkxdi4H5BB8t545U12AVNzd?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sA6suFC+ARsC/BldlH2jY5xdrYFtB5MlUcV9C3EtrDCRlgTWPPFxfGGFHUQd?=
 =?us-ascii?Q?FyXbGZ4jHH29bxoS1QSZ3A9Uz5uKRRRDi4HrOyL2Ei1ptzgtFlISkQPywF9I?=
 =?us-ascii?Q?fksHAqOTqSuWPC1cxM3k2KW6PpJCzBkVEfID2/0hg8VoAawbGnhAR9aIOufy?=
 =?us-ascii?Q?xMksixJQStQRSU/m+SNRNnQYcepmBTvOlgcZC2MG6fISCFXKwHCCvUN3eRce?=
 =?us-ascii?Q?5aWSiUzqIheKOqBZKZCoUDgdTJ5m7zrcTyNm087XgvMLqq588gAjsjzP3NZp?=
 =?us-ascii?Q?9DjrSZP+waA/1lfTJmtHjSKqrumlbyKD6KuNQMYz5PViQaSlS+OkPiQJy0qP?=
 =?us-ascii?Q?uhqsS94OzPZfAPx4RZPi+ISDrbt6GsWDs6qfe06XM+C22ebXB4SQ6gpD8LkJ?=
 =?us-ascii?Q?cxYQ62ftdbLi2Y3m0jJbxneHalnJQ3glxXsaE9Z9wGMWg+SsxBkBq0zuP2eQ?=
 =?us-ascii?Q?5XoGwT5ZzLHMh12o7C/UwVjqd8DlPOgyF0gjuHGPEV3vb44gjzlTknJDIVE6?=
 =?us-ascii?Q?BYEroOFyJNHD2wZrDNdBqOj0/iTkLfDsKZk2Pbczc6ook7gm+SldMPnTNQWr?=
 =?us-ascii?Q?BOwBrJTxf2B07TpH4V1OP8r4OLDbZ8kwx122H2LqhPc8BXsTOpi3wVTivyV/?=
 =?us-ascii?Q?w8FHjeVwj8j81myxtpO0wyAXhVkn0mBz/RBCxRhpGisrOCvu1+fWV6Fc/xdq?=
 =?us-ascii?Q?lUc0m4gbcmHC48UILOtzmkluVT9SQren8vI/093RVUYafg8jC4KwGScBB9ZN?=
 =?us-ascii?Q?9nLEtmnLkH2r9dwQmmjxOP5t9oJXeP17uLpxFuQcu54f7myrSttooT+CRTlp?=
 =?us-ascii?Q?/peiYrsicvVuZwGrCE8PWvSemL7xzrTYfYkW9AFcyFmN4NxoZCUOjQl7TZse?=
 =?us-ascii?Q?P1vLDEdibcMT6amhWKvQLPZMrD6IRm9rEUy99Evk0YJce8/zsPcFrCJnEL83?=
 =?us-ascii?Q?XrxNSRJ+fz9jM2WsftFyHFGmJNSw+gLrvp3kqu4GvpVaF3d2p+RGuB898tAx?=
 =?us-ascii?Q?E3KYuDRg35B8uNSTkRdw4sqUFYOvV5RafjcRAjqiL/TAq8hhCSd0ZhxzlyLH?=
 =?us-ascii?Q?JqKZbIbAEmkVUKjoJKw3+ohw/brLzK9V1X84NgoxX8rxTqKCu+watxhax4O6?=
 =?us-ascii?Q?7qKZRB5oJE9/7HQyqfKV9GB6VKreq59vZRKsBkZa9TCqAykFkLTYkd20RPiw?=
 =?us-ascii?Q?kEE4kxmJAAIV/BH42LcfaGmivCJGWvwmxGIBV/SfSNC7Fxu1owgGpWtHXFWU?=
 =?us-ascii?Q?29QXuNelwb0FL+qqB2TkNrH+YWR34UuzKKnjrekCKqeAEUytp2ZPAG1iA773?=
 =?us-ascii?Q?FIrnZgqPtuqVcMQzW4BmqsQhi0DFYDQE2b8n08YpZ/dCwOhFpX3lmDOIM1kl?=
 =?us-ascii?Q?PsZxzGOoDd2pSPPL78YPVIpUDNy75xiVJaMWLjwUHRzFs86eFFIHcyvDFpdm?=
 =?us-ascii?Q?iNmRZTwpnabNubWIEWnBukvSFxisCfOtB6Ee27rRucjYr63td/c5MjlU/Zn5?=
 =?us-ascii?Q?Qwdn83k4diWJZ/3DHl0v1fObaII3g90wMZIdYaR8525PP4WMA9ioVwnr7gHk?=
 =?us-ascii?Q?DcG5b/uDsQER7cuRxece/bGmXmLYxx7TomcyHciP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ef6233-33be-49ad-1f65-08dd7619c15a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 21:18:34.8076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6tapiYDPiVHVr9qooyvVo9z7A+F8suOO+7TZ/mNH31MCcOFcjbVeWrdD583DyQ05MnA/akovw0S+7GichvHQVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10760
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 21:18:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214478

Create a new set of exports for the Meson `host_machine` cross settings.
This allows the target cross file to be created correctly from
meson.cross.template and aligns with meson.bbclass.

Note, one might think that HOST_OS and HOST_ARCH would be appropriate as
inputs here, aligning nicely with the Meson naming. That turns out to be
incorrect since the script is generated in a native/nativesdk build with
HOST_OS and HOST_ARCH set for the "build machine", not the "host
machine", using the Meson terminology. See
https://mesonbuild.com/Cross-compilation.html.

Fixes: [YOCTO #15485]
Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-r=
ecipe/toolchain-scripts.bbclass
index 9e4320f876..3053cd0f1f 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
=20
-inherit toolchain-scripts-base siteinfo kernel-arch
+inherit toolchain-scripts-base siteinfo kernel-arch meson-routines
=20
 # We want to be able to change the value of MULTIMACH_TARGET_SYS, because =
it
 # doesn't always match our expectations... but we default to the stock val=
ue
@@ -72,6 +72,10 @@ toolchain_create_sdk_env_script () {
 	echo 'export OECORE_TARGET_OS=3D"${TARGET_OS}"' >>$script
 	echo 'export OECORE_TARGET_BITS=3D"${@siteinfo_with_prefix(d, 'bit-')}"' =
>>$script
 	echo 'export OECORE_TARGET_ENDIAN=3D"${@siteinfo_with_prefix(d, 'endian-'=
)}"' >>$script
+	echo 'export OECORE_MESON_HOST_SYSTEM=3D"${@meson_operating_system('TARGE=
T_OS', d)}"' >>$script
+	echo 'export OECORE_MESON_HOST_CPU_FAMILY=3D"${@meson_cpu_family('TARGET_=
ARCH', d)}"' >>$script
+	echo 'export OECORE_MESON_HOST_CPU=3D"${TARGET_ARCH}"' >>$script
+	echo 'export OECORE_MESON_HOST_ENDIAN=3D"${@meson_endian('TARGET', d)}"' =
>>$script
=20
 	echo 'unset command_not_found_handle' >> $script
=20
@@ -101,6 +105,10 @@ toolchain_create_tree_env_script () {
 	echo 'export OECORE_TARGET_OS=3D"${TARGET_OS}"' >>$script
 	echo 'export OECORE_TARGET_BITS=3D"${@siteinfo_with_prefix(d, 'bit-')}"' =
>>$script
 	echo 'export OECORE_TARGET_ENDIAN=3D"${@siteinfo_with_prefix(d, 'endian-'=
)}"' >>$script
+	echo 'export OECORE_MESON_HOST_SYSTEM=3D"${@meson_operating_system('TARGE=
T_OS', d)}"' >>$script
+	echo 'export OECORE_MESON_HOST_CPU_FAMILY=3D"${@meson_cpu_family('TARGET_=
ARCH', d)}"' >>$script
+	echo 'export OECORE_MESON_HOST_CPU=3D"${TARGET_ARCH}"' >>$script
+	echo 'export OECORE_MESON_HOST_ENDIAN=3D"${@meson_endian('TARGET', d)}"' =
>>$script
=20
 	toolchain_shared_env_script
=20
--=20
2.34.1


