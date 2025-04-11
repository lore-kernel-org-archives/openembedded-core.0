Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 897B8C369B6
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 17:28:52 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.1])
 by mx.groups.io with SMTP id smtpd.web10.32589.1744392526803705511
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 10:28:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=Ie8FvcHI;
 spf=pass (domain: oss.nxp.com, ip: 52.101.67.1, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WcQy61Zfz3pLjPrIYUDNzoBhqWNFceG1ImUFofAuce47YBC4ceGq6tI/6uaQQk2IjaGDHXrfQr8AjiSjjxQugLV0XpAhMABpnI7SkutlFJedW4v7cUXs39G/mnIu6CuqSrsZDjliprIlHfH/C2NxoIJtS/cxn1jgLYfBqGGUJ3AyPYKFV/eWH2DqhiI0XBgs0SyyZ13MQN1RTsdYiIqLz/foXOmXOW5v7n3EPkfHaW0gI/lRyqGrovMt0StTaGBgojGtsAaUOQZ55F4m/7u9pKRSCxHcwvnZMtqfg++GRNJqSoMHtpB8uebloelbu94RQPNKL1GmZo8Czq4dhJEn7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BN2bkbn0SV6FjesfBQ3SCHkxhA34PhUiX9xw2V3bCSA=;
 b=UKboLisHXDK4Rxlg8hnr1V2eCak3Q3FChD1WQKDUuim6NCwu9MIiU9Mg01pCzAWqxLD+ZmvJiZU7lnJPX4+BO9MOH3e9IIRF5OxfeHXA8CyRRWFduPbANuEwA4uLM4FuDuqzwGWgMOxdgBtVi8VmfCwjtARb1V4iz2Psbu8ryWznwYqKSKqBMru+gsRua6WL6KbyG0D9h45MaT6SPMjbHOTG+11TWF8cvxniKJchB9rgKXU0EuqiEYtPAJ//5vISSYuf5HpMPJPhutNxQxFhiHHGiqEACr4M+Z3c/Ow9Z82e3d0cvfa1MX767kw/8mRaSA9JC4hxG0wka0eSiuWHYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BN2bkbn0SV6FjesfBQ3SCHkxhA34PhUiX9xw2V3bCSA=;
 b=Ie8FvcHI4ENmKELIP8jxeyUEhZypxncNxnGsEmIs/4HvHOdPMvKYt8lbWibcPLoGvXdBCN8+jCU9h8PXkd7lZxIbLLM+zWCMSh2Jj5e1xBI6PRkFPqguO6bfnywgRiAgUF1tKorBFbPTfQwBiqDVktnKwRq2a2D9wYWc3i7gD1NwE3znsWahA90zwBO1ygcVBA58QYb+t1J+MwlWCl7SaTdmJzI6g5Bllz+vYnkQzujUA87hM1Zn91JnF8TBsI/0IaIX+dzzo8qXaSlkPgxbogxwPwQGm7rt6HMEL13MPBJs1s203DuQsE/S4d2QrxAL45JdSlBelH7Bb2IIGZoWYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM9PR04MB8100.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Fri, 11 Apr
 2025 17:28:45 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 17:28:45 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v6 3/6] toolchain-scripts: Export meson settings for SDK builds
Date: Fri, 11 Apr 2025 12:28:00 -0500
Message-ID: <20250411172803.3706607-3-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411172803.3706607-1-tom.hochstein@oss.nxp.com>
References: <20250411172803.3706607-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PH3PEPF000040AF.namprd05.prod.outlook.com
 (2603:10b6:518:1::5a) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM9PR04MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a49de48-8b39-46af-cb39-08dd791e4faf
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wDa1DG4dEhDF5TvE3nE2wXfK2Roctz8wcvv8TOQ2AFjlr9nQkBHaMCp6kj6d?=
 =?us-ascii?Q?deLXswKPOyfNRATYQgyvO5WiozKn2NcVL1Y8l+ksMmCAn21YnraB1ZJLqOpR?=
 =?us-ascii?Q?Sl5/jwHli1mbGXrkcxKS4sKUIkimWbgL2haUOkq0bAg/L7R/pRuQ2KQ7V1uK?=
 =?us-ascii?Q?+4uVNd3rwsaKudG2oINQthucG4ZFt9ktboEKa6qYpYJcwDkaE/BZtPXikCVu?=
 =?us-ascii?Q?240NG9MyWuFbG3Re5o2v52JAb62s1WZIBi2cZltmkZA9B83uvMQh7LV333hp?=
 =?us-ascii?Q?Zu9cB7m7pgQY2bVxgJQ15+luFZ6j0khXmWUbABBcsaCww4bhE6fA4qbBMj5E?=
 =?us-ascii?Q?eVUuqO5rXxazcy5GddPdMbNx4KWLCNHHydjG1FKeQ6hD0ANNYcUPVPsTiNM9?=
 =?us-ascii?Q?qXEDJG61eCBaxYcLEqaqIMh5jbuqGV9EfCV9Us0YMsSyBmFdIFzyjQXxJl89?=
 =?us-ascii?Q?p5eo3p8pcr5gffAYLftI3uu5iXHQpB2zRYXtP/hcFxZVuUXXmwdMsIlW9Tkn?=
 =?us-ascii?Q?QSYbhsHkWpURuz9gLDQGmTXHSXdfkVjgtcZVcjoX6Gx/mK1M/xUwhaUjp8mJ?=
 =?us-ascii?Q?eEfRDkE8EBFld/4B+OU9NO1CuYcRyjZU+Nyd6uQB3IJ4/uGzMRg6NtAb1Xsk?=
 =?us-ascii?Q?ntjlOTLuQgiA6FpiWefqvyT39EEIZ3zVT3Wd/ei4ky8iXdxS749m+uzfVnpV?=
 =?us-ascii?Q?BHdG0bCYo8pBYduhIJQsSs+qTbS/gvrlLd6ljUFDIQJ0+D02VuyDFt43CUiQ?=
 =?us-ascii?Q?nUnnGue7RYbEZfUhaeDE72Q/VNDJbdaVx9ZaexEWZyr5FL15uSqzS5VgSRAz?=
 =?us-ascii?Q?JwaCRKoOUAswcxPouD+zYm5M2+lWr/U8M63AkAoBX0+7R+6oR7iillhzZEPA?=
 =?us-ascii?Q?SG+K6WpnvO0foQQIz4/GQbG80A+qA9GHTfaOfuUlsmopriwSD5qR+ARWNe1V?=
 =?us-ascii?Q?9RNvWOCnJIohOrQ5Blv0NoiLSMWgX+Xti6J+JCW3KCYBxADVwY9Ia+b4I8HJ?=
 =?us-ascii?Q?LcphuJtD4oCd4vavnrw7EAwJGHvWSfs7b5D6SkjpZ+kltuHaHs56XB7QbWf5?=
 =?us-ascii?Q?2hqYplTO3CwjfJBbhawYO93iL1WiuQj86NF2HxweRSHs5YUryLWB5fXk/T0u?=
 =?us-ascii?Q?wSfl+QpI0hx6rUPdEaZX83G4JERrrUPP5BRSH5mbRc0SPEwh7gI/2DdCk4Sr?=
 =?us-ascii?Q?MXFz0NhmBeSnGyLYzBtJvFRUN8X9qOCQ/GNSXbWBZvjQhwWyFHRDzCaftW6/?=
 =?us-ascii?Q?9TwmNWxxxHdWeLI+HQnK4gmHk+2+E/AJKjb73IJZkrmzkjRuwqID+yCGKgyV?=
 =?us-ascii?Q?RFUcUORj+blTjm5hyrQwgyuYkZ4rZcj4Bv+SK5qQW77mw5K2+dyNn8/iiBau?=
 =?us-ascii?Q?ZCidi940VbrDxMzXN2UjTzaXzLYo59fSA6aFz+Eb5PgbVnI0Nzq9BlI7PAIW?=
 =?us-ascii?Q?H5wQiulHSwA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GeU1I5nTn4/UHyFh9OGd/fAn+xwg0VVZkdlbUUPN/xsD3fCYL+xyjEhhxACc?=
 =?us-ascii?Q?MgAdtPydBzwn6v1TSlYdxkaYFHPtNY0ELy1oRX+Y81fivyA8go8LwlGOl75e?=
 =?us-ascii?Q?H0pvQyGPJT9/3RefNELcQNjZBIf7NJWJO8CfwgIl7CU7LG0gLX6xqsSqkFPs?=
 =?us-ascii?Q?dqS5cjnds7Z5UBqBQx+YASAJqMaTNAKmhZUG2Mx6r6Gd+bssESx2Nor8T2eo?=
 =?us-ascii?Q?lc0yNvI3dLowySgjA8xi5ffOthvaPrZCKk0ZSmipkghi4JuUMB82e+EUg5Yj?=
 =?us-ascii?Q?/1DQhp0G/XUL352p74PbKFAmyixrd/dGDhPlx9Pnotdv5wX4wyD3ugf5Fzz4?=
 =?us-ascii?Q?VytADzZZvqECgrwppO+maPeob9pLR7XSu2n1u9w55YAuDEn9qLo8qy6c8GXc?=
 =?us-ascii?Q?0OgX02cU1ncyTD7s9MNmdMV/+zXa3HYA8BXn6YpXKgxWdRIqAKCij3qh5SxJ?=
 =?us-ascii?Q?SboBnbXJoSb5ZzAzkiC+JxHsZSxVH9iZWG73nri/yPyzgblADXyVqeqyb2vr?=
 =?us-ascii?Q?//HTPSOBN5/xvHgO4I+e2RE71YiLO7eYlJ5zwPFfMLdIQ4b1wyPYPx3hCMCK?=
 =?us-ascii?Q?AFXoC39nH3UP3yc3EP7lJr66qd2iAHmA5vGcWnueB/bOq960R9c/6uKfWvmy?=
 =?us-ascii?Q?wN1EIjJNaJNskWj7Zqivz3PJARpCeVa96kku8RbnacLPXbLa28TNshmN6X+m?=
 =?us-ascii?Q?R0UeXGEO2AH/Mv4HL+48lKsjFDf5406dXbeKffV7InjIqbA9vSObXocVOCMQ?=
 =?us-ascii?Q?D2KWG6cqOaXqwBvUkGBaqeTIa5+uZSQ/2Da0QpGFD9svsh9pid0mHGb5cke4?=
 =?us-ascii?Q?Vzkp4RK9W6iMphF7D6LZ2P7WDqh2LQqmUf5drCA9MSvRVjwmYEDKIdyIgisR?=
 =?us-ascii?Q?+Z71qx30BixoliWeqEcmPcTVbmsOoZNoeBOa3lUGjqOBOxQf0p9dTVlo+eXx?=
 =?us-ascii?Q?jevjWfvymCkPz6vxrUy1bzkBvSbMt7E9R2X2aU6qK9lTdCgqD2XyDbEdp8oF?=
 =?us-ascii?Q?zNJrKHBV91s4UH77eSXLYlteFfCHIWhQuqxjFwj/pEN+USPGtTQKxlrRO6KA?=
 =?us-ascii?Q?EH1VBpPv21l4k7Sk+h2GOe3zQDQcNc8OiQI3ZxOY0tAgy4c7Xx/yl6lTRvIb?=
 =?us-ascii?Q?YJ3u5bZ7MvK07w8pQVGpy80H/EqjHMZDtyzQLpN1MllKfiROh1Ar4SdXz6/G?=
 =?us-ascii?Q?Sqx2i14wTjrMCb5qlLTUoPudnRLcf1/cCvErz1J5NCpT1f/936MWcayqsxkJ?=
 =?us-ascii?Q?+OZGbsKT2xavLFGWS9lTMFZa9KwsiXI874YS7ZrF5AGaTR6U9ylU0k4dcQl8?=
 =?us-ascii?Q?pcSo5WPCeiwMZcIY9UHW6eGbNb0s71ykaLfMhT/s0B5AahAXrA9zDXyx2Npb?=
 =?us-ascii?Q?OQsIgURKkcMVfWOC+QEXHNFechiXnXs9G+YXlEJTuCqZHKY2VhjE5OCxISIj?=
 =?us-ascii?Q?hQP28oLftqrhX8s1vJrbkYKk232bYe0VtN72es4oIdDUpCGxKp45QMCLdlXz?=
 =?us-ascii?Q?mbCLkGRCzFWoaQpgXc41KYeO25iF76K+9zFTpC2tk08q1sPa8cniYnXBFWoF?=
 =?us-ascii?Q?EHltsaU08G6Mp4ddNSx/8tKcvTOn+rRfV1kUOfkp1DhGRT37Kupce35zddjM?=
 =?us-ascii?Q?3A=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a49de48-8b39-46af-cb39-08dd791e4faf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 17:28:45.0872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lWHczGLTYoO1AJeODIDufYKMTFp/xPyfHc1kV8ptZBVkbD0r/U8O7Ds436sBrGkFZTrf2+iv15+NLTROXI2JMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 17:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214749

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


