Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 074B5C3600C
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 20:02:01 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.61])
 by mx.groups.io with SMTP id smtpd.web11.3390.1743192114318143811
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 13:01:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=lVulUhWr;
 spf=pass (domain: oss.nxp.com, ip: 40.107.20.61, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jEn7tBaZa60J55NX0K4HZ44OjvV8Gss9zzB7mbaHo/Hdly4E+MhiYl7hGY0WOaXZo7Ksm52SDx1Htj9BxUus27gMIqrt+0CMnGvjLI6taZQU2nHWwRadBfvtzMpLh2VUDvL6MeVaPTR8OCEQhRaAzqFIp37GoOQx39qwvMWT8l0tl1WN/V5qNhmiufY7AU5FeB3DwfTWlSd/LHYZast3/FyFkR1mtxi9VkS+Hfr6k0SNpZvagOlqSvnOjhls7SyAf851stb+PxkxpZA6aqSeoyC3gNtbR41rChbsp/sHC89gN2SgHB3XVQewItzFNOeOF1JgukkbL04oUp7fQFcBbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G0s0AHzDYEB2sPIIbw3PRdo/bJcXQoZLfOviI+fMJN0=;
 b=TzTCL2fUe/8qN7mopyrBtnEArPsTngt76lH9bHIIbT1A7d4muLIGUHZziHZyYz1FZK4x8afL8t9Dqquj0z4vGpxCaBL6kAbeGYqkCYXZxjGeTjTHFyeorznHCa8xnYOJK+5nVkbI7swZv9FFD/MB9a0F934D5uIPzdwDrHVUKnp5XOnVySUVvppy5MVdy3Hcb9y8TR0ySDmXbpyFKOhjNw9a+s0hr1lpA55mrywDgSeKyKDbM7TL08R2sqyQFiaF3h7HE2D0vaKwnebx8pAAzXoBtN4ffotopF8fpRUNWnV6wOG4YwS+fNJgCDYFjVw+9K1qzBHcj9uW4uDvttwfUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0s0AHzDYEB2sPIIbw3PRdo/bJcXQoZLfOviI+fMJN0=;
 b=lVulUhWrpih3OVnl0iDejZ1NSsbpjH2lHJrNucBAkL8hXl0EFfJuifW4gnrHbsVOi5vzlhja/WKx9TxiONF7CfOf0rU6P2to50TyH7EhX0/OYHk7aNcIP0hnERjQlrnDPod+elwlMazpuSaOcPrrDXsMi3bS8rHQXtSRjznNBeCLA3tEzIZbcH/g+1LYZ/mxzJpoOuoIjwDEyYld4rbFYY2HZ5cxP65hRDzcyRyRsKlOe0AbSFYyio7AOb+hKdTqqHqZiCIymFWO4VSjiR5vEHcTVplmftdAPuVXgQ2YV22KjBnJSyF4pPjVGE02nCiGCsVybzd06/vmIJMpqWBUQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DU2PR04MB8741.eurprd04.prod.outlook.com (2603:10a6:10:2df::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Fri, 28 Mar
 2025 20:01:52 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8534.048; Fri, 28 Mar 2025
 20:01:52 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v2 2/4] toolchain-scripts: Add Meson settings for Yocto build SDK
Date: Fri, 28 Mar 2025 15:01:23 -0500
Message-ID: <20250328200125.1051797-2-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250328200125.1051797-1-tom.hochstein@oss.nxp.com>
References: <20250328200125.1051797-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::30) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DU2PR04MB8741:EE_
X-MS-Office365-Filtering-Correlation-Id: 35d4ef0d-bc52-42a8-e5a2-08dd6e3361c7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Oc6k7qZbu1AdwzJbOnNqg4rjASIO5yymoQf6TZ11GrMWz934OGxe9S2Yq1hp?=
 =?us-ascii?Q?HhIz5+K3U7MpM9yAQ7TlE0BjSPj7FjKNYjLggvueCFpszpF16q02wzPNPyOq?=
 =?us-ascii?Q?JbdBs6syGfgYwSLrHCn/eRjbKZHXbb92TGmcyeLgRSywAml8kKsTUqqTINbO?=
 =?us-ascii?Q?xGQ70sz7oqdocTOOpIeHvj0W6giNk3lPT3uLGrR5Rr5R2heEIYGeoVZAVPuo?=
 =?us-ascii?Q?kqMiogkbvnbLok4QrpLp+03QgF0D6uJjdnORmDpKAke0Jkc7LvnqJVXY4dz/?=
 =?us-ascii?Q?Y2w4/+1Khgv47Nu0hv2IE4KG//HAt6++wLCXNEPr4UOLy3FU0oMscvoXW8nJ?=
 =?us-ascii?Q?gi39vuyg/hzGhJoph3Q4PQeimdFGvX40mQ8iVdHljbJ+dsug4Nw9HTKvy9MD?=
 =?us-ascii?Q?p6V6hmuUrMzcc2Eke30FutKSwANjDOJS9Ld9JmmqNEQU9EtCFyUxcwtAtIje?=
 =?us-ascii?Q?QDXD1q1n0eeSLVbjMu49BlC3iY7UtIoVJkgXLAgrfCmmxfGK4F2z+VqHhwdr?=
 =?us-ascii?Q?mD/gBEmmFpilRxzT4A12KQAMj2aP2WCucx7wiYeu2fOvWdesbzxn23p7SYaF?=
 =?us-ascii?Q?3mVTPrPGtNFdOeIhkSoBzE2qZOnpzvj5JSTKF8blK+qp55zEy3R/lsvcSMmF?=
 =?us-ascii?Q?Gud/LMQdC2ZEtR5wEdpvo7HTr2yptcpec+T4D00yPQA3o+Ho+stYZ/F6A9uV?=
 =?us-ascii?Q?e09lmtPFZCWZ0uRnMSXonaoqK6Kb4pS90aD6E7LZwez3vSvHym5U3Y/do9/N?=
 =?us-ascii?Q?jUyF8C0q7wOBNXkNKP0b1S1BeaCEteQwQcQeUs6zVs3ohSqex+sE9e2WY3Eb?=
 =?us-ascii?Q?n1X4XyjdbQxQvme7cj2pDU3zUnj1EekvTk9GQdEnfCbAxGwSD3Tk0iZeNu/M?=
 =?us-ascii?Q?reFtSUb8zRZblGnor4muG7hgZHa+IssvrarQpRjkBieHYR6u2Ler/6BUsShN?=
 =?us-ascii?Q?BOZLEFXLATXF86xH9PkSejXkOqTfwJqJEG2R5DmhXs3ltepdayTXhiWVc+Sv?=
 =?us-ascii?Q?kd7kWh89ySAxJe/0tfMoFlY2AQwNvdSAp+h7/nOGI3Y9MDWUD5jLhHndPkvL?=
 =?us-ascii?Q?9Av6J8iB96jp0Si4+324zIdaA7WsFyzML8yJrtEMkzFQd0jyx2n/hEr3nCsr?=
 =?us-ascii?Q?djEV/vaY3bYVZugrEtMEOTxjoVGSBOiDfosjTNHrLSb5JCM5HZTI1YGoUJ5F?=
 =?us-ascii?Q?fwexqZ1812W6D4uzTtUig55xU35OAmZ2sc5XyDtB8Y9DFJzul4KsHoepiP79?=
 =?us-ascii?Q?Z0NyobY4gY2uzbgM3/i9AmuukDGtYV8KWLiOG9PhVyy9DEW5Ho9D5SwW1zhw?=
 =?us-ascii?Q?tlJvnu2vo63ue/9nqOd2AWnVHM8Zaem6lpcmY3lDh3PVsAVeoXKqNLO5CWdY?=
 =?us-ascii?Q?MoVfdE8/aWEbABCEB0NKTw7i9ArGl3WMpyC+T/2VZPHADWybDAf5sG7C/EDG?=
 =?us-ascii?Q?ALMTjjc7gjHl35FCex/i/FY7LedldjptelfnAKAzEN9xS4xsDvQrnA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OlCiAAmPwNb0bgpPoMHzP+0C5piHM/+72FDjLoX2WP4rthpSus4ew5Gm8wPS?=
 =?us-ascii?Q?ZT3x1WO03t21bpjtckrI2/nvzzK26JvhcLEoO77POrBLCWqlTmWYvF87fV05?=
 =?us-ascii?Q?Ytx4LPnjY6edGEoUbiQRrBMbL6PYsMyVDgqNq1xM7HyCWeDInZIJY0nZqoRm?=
 =?us-ascii?Q?PEw/TwCA+faquje+gRToCZkMNyI2mAos44pawxhS9+wQJ/AVJdB73On0fnWI?=
 =?us-ascii?Q?B1dpc9HkQ7KgA8DsJoa3RhjMnzx057vf2jqFaTkuKdpBvwr3BoC/9eP4l6E0?=
 =?us-ascii?Q?oNbXzgBGMDIHxrbdM7OQLYjBJ8Uz2Un9IzCavV/GL2SWonNkrthrS0bHPicH?=
 =?us-ascii?Q?p1GBhASzm5mkU4BSROPSEGl5IcqXgvYJ9xgU2+rXyS0KQdCu1Xj48COm0wi6?=
 =?us-ascii?Q?8HIwp1yTQrD6APaxH0sBD/LNUTv/KuSAcXBLqVpgC9z4t+gPuD+AL5gVudCj?=
 =?us-ascii?Q?PRZ7DyFkyyi6kNy5vCIkJo438MlHBICYa+8v6xYiOXEpRbrH3Orbhi4ttdJp?=
 =?us-ascii?Q?s4roLxubNa7HD0WV1E8C/Z7grW+35agd8/jImx7MxhTlAcLCfbViJF9PNtHO?=
 =?us-ascii?Q?8xHEdVTPGysV9Qp9eDB8BpRyTKI1m52OrDfpcQ/WIQnabfl3Qs5LcmkMNADS?=
 =?us-ascii?Q?bDHE6Uwu1uUx2tGGhSlPp4v46YJHe8V3+LwbyorINTknMejfVIJqCXinGUc/?=
 =?us-ascii?Q?4bvWt7IOM5L7HuXYz79mDsbp1W/9tFnIrkTmvffRPIensOqUaoH83Scf2trU?=
 =?us-ascii?Q?1b8P7OamCfC5ZPu+zWfrUn8say0YQUFtuqjVxHgRXJlnDIyb0v7F8G05Njkt?=
 =?us-ascii?Q?y0ZLRkKoMdvSiBrNEiH8im0O+3P075Po7QJgW/njAnR6OroRjyOzX8BoMhXj?=
 =?us-ascii?Q?n9UqFoUVAArjDBlmC/gDi73CVDECZJALCyi9xQC28Lr1rqAUy2CmW3hU4gRE?=
 =?us-ascii?Q?/sH1DSoWj48NMoaexeqtbUZvHB4iZXdVXw/eY+0Y6F0QAfF0y6yDwnFJNe68?=
 =?us-ascii?Q?xpZ2VtxMRIzlNM+ppoJhaMmQFX4hHz3zels6gChQXJSKeri7kUjLcZrCYSsy?=
 =?us-ascii?Q?25YtiECP3+IjKA7SXQHJ9khcPhYwNjOkAW4PiY6dONreJ6v0ChFBvLW1Q8WZ?=
 =?us-ascii?Q?BlZsM22CcdqlafL72SFcyNhSzxZfNXkC3x2vKkY6MUvfDMY+VmDHQiuyYrTE?=
 =?us-ascii?Q?NDLcxh3ykV8qHwTsS7V9isK6m1eEZYD7UsTUEIQkJlGnpCAbN4NSnj6MtqiU?=
 =?us-ascii?Q?OZajGRQ7FMsS82fxRKlLHNanuivzh5Kqa5ty2Ho4YLxo0SoZrUETqqAx4Sji?=
 =?us-ascii?Q?EjBTKuQXpil4W2I/nBshG+lhZiL7lI8PW7j95sGM5vgbOGbuFCEyB43l1tlX?=
 =?us-ascii?Q?oUEVzPVogVYT6KWOPHyfSx4llcTVp71lHG+TC62kxBnc6AVg9Vy0l1roYo/M?=
 =?us-ascii?Q?OrPH/5VXAbywJDSgD5kWN89IcISChLw3KxqwE2AiKRionuGm4MMwcpR11Ddf?=
 =?us-ascii?Q?maXaRCZ7oHJT/AnWbgCRkxWyXbFBthzYHPWCdDDYQ9Fq2MWm3AJjTncrB/QW?=
 =?us-ascii?Q?oW0SXk2J5YKK0DJ9fAJWERwykUe6LpfeCvm3FP1L?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35d4ef0d-bc52-42a8-e5a2-08dd6e3361c7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 20:01:52.1912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 77dOsrHP1dT8fTd+vFKUKzv+UNA3hX9Z/5LBdJW7Hk6t1O/Vu6i0V5T2qgTJBYby4b5l5OqLFKZdZNTynRo/ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8741
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 20:02:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213867

The Meson settings added for the standalone SDK need to be available for
the Yocto build SDK as well.

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-r=
ecipe/toolchain-scripts.bbclass
index 00593f681c..5aaa021bab 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -103,6 +103,12 @@ toolchain_create_tree_env_script () {
 	echo 'export OECORE_BASELIB=3D"${baselib}"' >> $script
 	echo 'export OECORE_TARGET_ARCH=3D"${TARGET_ARCH}"' >>$script
 	echo 'export OECORE_TARGET_OS=3D"${TARGET_OS}"' >>$script
+	echo 'export OECORE_TARGET_BITS=3D"${@siteinfo_with_prefix(d, 'bit-')}"' =
>>$script
+	echo 'export OECORE_TARGET_ENDIAN=3D"${@siteinfo_with_prefix(d, 'endian-'=
)}"' >>$script
+	echo 'export OECORE_TARGET_MESON_HOST_SYSTEM=3D"${@meson_operating_system=
('TARGET_OS', d)}"' >>$script
+	echo 'export OECORE_TARGET_MESON_HOST_CPU_FAMILY=3D"${@meson_cpu_family('=
TARGET_ARCH', d)}"' >>$script
+	echo 'export OECORE_TARGET_MESON_HOST_CPU=3D"${TARGET_ARCH}"' >>$script
+	echo 'export OECORE_TARGET_MESON_HOST_ENDIAN=3D"${@meson_endian('TARGET',=
 d)}"' >>$script
=20
 	toolchain_shared_env_script
=20
--=20
2.34.1


