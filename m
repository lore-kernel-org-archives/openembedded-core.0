Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE9A7E7718B
	for <webhook@archiver.kernel.org>; Sun, 22 Dec 2024 02:38:23 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.76])
 by mx.groups.io with SMTP id smtpd.web10.18612.1734835094324511432
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Dec 2024 18:38:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=A7/GUt4S;
 spf=pass (domain: oss.nxp.com, ip: 40.107.20.76, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cire45Xsz//fJgB2V5zwGXHtNb33M65OvNP8/K4GMqlRJu5gwN/V4I6H9/NtnLpTXhRP1eYEvXtaJZ5xuof5s/zeUfmUjo0AhBFzO03Ft5uV62IwtA8j8YjvKRDqwmCnR8uL0QDikJjlxpv6b+jnnP2oNv0ndRRUx0exPq6N7ZS74T+aMybvIZT7v4gCOllpm/9AFJjGkEjcNeNmEZExh06fS6QyqeVP5Xd9iqB4NX6tUVJDbEHVzEGQDPEl1iBMbayu5RJ32ex1nbZrZXfVDg1NsPRxK4K/4hEXygbWaOn+zlPJx5cw1JNknV7gxoOHKv1nGY+2HzsTg9r7iPjacg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2z+f8XLzADN83aWGHcgsvLSqfiI4ga/IaAZHU7+Oorg=;
 b=f5qUtz/Ish/aTeR3zbYSB4b9HzV6bcHXN1enBHnv+ITDL2IicsI0opmB0DJ3twWGSgYu0wwaX9CkTY4sDjZaXKBPvlVFnV9eWI6Rg6YZg3nyvmuA3+y2VtKptSuJ9dGvXUbT4rfTQog3FgyGL7wOms8LMJ5F+Ra/WYEBlHYxgYzMfT7SHMbwtQh4zeDE65f+5ob/scObqWBhn3DSvLaHy4lA2mxcQAuWIg8cQAhdaZYkXqC61nAtFCeVLgY+H1X683VSMQqucx4lD7W6c7Vs6Y0aMxgn3uyHFfQgznPlynNzIdqcFSaYddrrZsWC3gPMNbfrds+8V7gmX/Us8Orv9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2z+f8XLzADN83aWGHcgsvLSqfiI4ga/IaAZHU7+Oorg=;
 b=A7/GUt4SHjwdUBuOeyGaE5jT01w8xy2x9hpdpveZaHFW0zw78vegPEVC/03VxUoT+ZHKkxQA0FHk+iarg5dpCMWsxBkd3ig8Udiu0dZlNAHecPgUSD+pDSJ+h7CCZUjl69apSAayTNevxcPKfL0NYNHR+KsswwQcy+NJu0ch+6DbOH4rQp/TclhXLIhuIACIAA/ZvmHciN3lQbe6M1n4IfQ9VHdz6CO4ff0jQNeByBnv3GPCyTPS+jrhf5bmiYMAPnSIQkX7+5r7pmLCfjFaHVKWZYhppImFKKih4UU1oyMJ6EC9OMnqQhwJekDmsmpvr3K0Hvv4h8rJPuJ65zKEQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by GVXPR04MB10303.eurprd04.prod.outlook.com (2603:10a6:150:1ea::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.18; Sun, 22 Dec
 2024 02:38:07 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8272.013; Sun, 22 Dec 2024
 02:38:07 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v2 3/4] weston: Fix wayland-protocols dependency
Date: Sat, 21 Dec 2024 20:37:08 -0600
Message-ID: <20241222023709.2233470-3-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241222023709.2233470-1-tom.hochstein@oss.nxp.com>
References: <20241222023709.2233470-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0022.namprd11.prod.outlook.com
 (2603:10b6:806:d3::27) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|GVXPR04MB10303:EE_
X-MS-Office365-Filtering-Correlation-Id: 7df3fd2d-4f84-459f-8fcb-08dd2231ab29
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9XUJ9VzEuIzNuUIlXK2dQmYPxPEpRYR1kLS428Jwgj/s6d19bMQUgYq8cICI?=
 =?us-ascii?Q?8jca3fEVeOGY4+Two+KqTBO6tJUyhFPbIaN63GGYz/C+98l1RJlPMyPqesnu?=
 =?us-ascii?Q?8GEXPPeFF4xVeUpUc+QZweV+fwprH5HX5ZxA66C7XqVWsZIAEE9l5HGhx3N1?=
 =?us-ascii?Q?JMOY4NaKvmdeWUl0LVCbaMcZdi+K1DpqqaBoVP8Pvmyiz4CCmhy7obcJ6DF9?=
 =?us-ascii?Q?QBvtuRexaKiMfOHECeFkehiy11dvqH32ItDRQlmGZBGyIsdjXrnGpAcrZF4T?=
 =?us-ascii?Q?1x3ZLABHZ0PpfzEawgb/AdqBT5BU5/dFNgQlpXM8ZoXq8d07RrE4zA6SJyhl?=
 =?us-ascii?Q?IJJTx/elgDVYLo51slh8wZ7lsaLxE4I4NpxZHkSiSZO0PtsPwf4gtnQZnXsK?=
 =?us-ascii?Q?CubAmYDIgEeMuN7vKdRz7yMW3w4lG9RvuNASmJcQiPqEz6ljx/JPen7XpFuh?=
 =?us-ascii?Q?oqyu6FJB6GyuCxlTtIVvy146KOyarCDYw/uDrCWeNL85WngceLEja73ReUBM?=
 =?us-ascii?Q?k9tqiAHX5P61MUeKm5UC+Mns/9VuX8T3HOAXtBvHa11b294V4v1vtydeq//u?=
 =?us-ascii?Q?UzwMNzSPP2BUlVqbydg7UMD8nDd0Ix9DRMVeVpP8psRb4Wo/sJrz7MG8oYVJ?=
 =?us-ascii?Q?l57Yb/C/w3kCoRllb0klc8i6qXMAC9ULsIRUHCw1LS+X9bPB773yTDbSz1Lt?=
 =?us-ascii?Q?GMQEiWa7aNlymiObBb6QQ+Yx5TOBiudh3LHXK2ph3K5GQPcQWQpItZ2A5JBN?=
 =?us-ascii?Q?ProIHXYUuAeZ3MWAOYM6/Y194ym87lsj6G2XK/vjFtUoeUEC+L6MsHHR8Hbg?=
 =?us-ascii?Q?dHuE0s9MbGbWRZw4uteOlizqqhaiCCuLvbtVwJHpHgjXY6sx8Ky6TNsqiZc1?=
 =?us-ascii?Q?VHZWROb6pfqhlYHSrPCShv+u3gDJQtzpFSWUW1Q6dxO0GizLnaj1yvfW5uJ3?=
 =?us-ascii?Q?76QX0LWprzjXdk0CkpycC4BiPJTwKvWtQRzLhtJqL6k3/8rpqyvO77EYCjML?=
 =?us-ascii?Q?bdadCLFYtRkrRITuWrMazNPyIpm+Sg4MfI4VJ3a/iXdBFO7KLz2NxXnR772D?=
 =?us-ascii?Q?V1MqAAsaFX0I0EsCFI6gSpJV87EP3Ur/2xRwIkKMStxZ6+fyHcwUZPOYvwMi?=
 =?us-ascii?Q?4isul4QWGBWoOTYzuH38pJhHClDyT6ufjkfaAn4j9t9stkFVx4e9tjkF+cd6?=
 =?us-ascii?Q?zwUAo/G7Zc9Xt6iazNF3wdjG6VBPIdwpYZUZmcUBM7cWtMON8TW/wM7lUUm3?=
 =?us-ascii?Q?frzTzt6j0/Qo/JI8i6BWI/RD27L6fEmLQazynC4+ACSfDQc6awpWf4t8GIrN?=
 =?us-ascii?Q?gWdVqn3LqvdTMIKpPSWk0f0yqluutAhQa90z9htGZ4VIuVkqeKCKPifXXc5I?=
 =?us-ascii?Q?LOon2Eo0WNZNVrHg0zyDoqWWpmeF5OZ0E89/7ifLq8rVLLcEe1HIKn6fq8Lo?=
 =?us-ascii?Q?dJ2oVjEo7AFSRvO0eULHU8diDAAgU9dN?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IMhp0QO7jlPPiyIXZos7Pgx9GH1EIUBy0Yr4XcL2Ox51+FDa3bSp13Q/S49G?=
 =?us-ascii?Q?py1ozukkTJAyk5avd0jleeizGW2JGSxUyfJn052GfKwlpdbWKBcUwe2QQUNQ?=
 =?us-ascii?Q?Uxd0PbPkE+iUe39DkoEVZEamMDpMTMDuua+SFqDGPNnPoFbUAbYkhd2LO5cB?=
 =?us-ascii?Q?cpC64Qn4X//GzWk4CyjWr17q/VN1496nh+CUeuFqmIY+hBAoW7xZM/r/EkYX?=
 =?us-ascii?Q?+42ch5zmZjdnu2t5LRhGDeQAA7/591NYcePnnedUnAt+5WzCnlbtM9wdZrax?=
 =?us-ascii?Q?wcBTZnzlwgc731hTEEcwNxazFetZ9f8xE1wV2/CG7ihMN8nk+S6NKTe22tj7?=
 =?us-ascii?Q?Cy9r+SqCEofhSeppaZM0K6bBbdzxDOGphkOmXD5PyQlAm7op1SI8vmHQvgSz?=
 =?us-ascii?Q?WzzbFLbsInC6MVKJIwdg0lzw/ayj+tg6mAVFdI5hCga5WmnJ8GgiMgj9E1jZ?=
 =?us-ascii?Q?f9fZnLmfxVd+vt5vRXv2X66/+d/c3LKhhP+0gtI/6La6TctJny9Ox+fKl2Hd?=
 =?us-ascii?Q?RTtpzRL7fzzPqEq5XufBuC7fKGA8/Pxwm2jki4ZLhewLZYaIns1EHsRQKB/A?=
 =?us-ascii?Q?Ue5R1hN9kKE0WrhBbRyKuBPX5hRuuAAzMoXMb31qrMZo5e89xoIYtn+q9YmO?=
 =?us-ascii?Q?Zec+9w+R+I5fEFGIKC2OxRfs1LE5qz3ZqL4BSs5/avKP20lmmmC/fPkl7oEi?=
 =?us-ascii?Q?DaqaIM5zwy5Dna2tmj4PFBDjG4Q+R009mI/5qudrJeV/vQ3vwefpTenmxZjA?=
 =?us-ascii?Q?haqG5MHoOslabtjALn/412cRBybVzSlW7tpOYojUVAM90DattJZXj9MUpVAh?=
 =?us-ascii?Q?aS9mX8M0h61PT5XAaYifA0kebh2gnEr8O/nCwyJ4IZxeZvXT32+XjquA81eZ?=
 =?us-ascii?Q?hduRvJCrKH9iER/f/gDR9Z3Jc4yvzfjuo4PL/ipUjnslG1xzyMG0cPVm3L0X?=
 =?us-ascii?Q?aLhUDJ85kAkO1oi6BzrygGMi6ufg0sxRUc8u8gAHj1tmXDR7yaVXiPQPZVV4?=
 =?us-ascii?Q?sqLHCNd0cYME5fe4FafQyeCOkfytbSWaGaHkXwcCawY73bgzLk6fNBk2saKh?=
 =?us-ascii?Q?mYiVGMx5NHXGTMWgrHZI1JJRXAZaAjZUolZtQVcjKLTw9eq1b3VtBeGWNeVl?=
 =?us-ascii?Q?vA+28YR4iCcSCNN1OGxQ3I6Z9bomQs5AN5sUhgSk7GqBnFkndvHIP2kkH1je?=
 =?us-ascii?Q?Bpe+4zyz+SUeIx+fkWxvc2G40ON52dtBx7HbW2aiH468Bt9sOPSNvyRBAm6h?=
 =?us-ascii?Q?9pSk6ea92xz/gm5a62gMre6i+YZqhk490blJlk0wji74jHjC6csJXLSEg0DJ?=
 =?us-ascii?Q?viVXbFXrMtpMPGi4mX2Gi+9PI8AaqPTzX+PBQoylHNYBpN/66Vmsxft/5yqr?=
 =?us-ascii?Q?4qfmHgAZwK903Wn7pfm1XhqIplsAdqLk5D3SLOTFYSbRuxwf1qCyP/dvtMBJ?=
 =?us-ascii?Q?hQ4xMhw0VLzToSv6MMccKVS3KLdd8qv8P10YQDmaEiqE97P/I2InHtVaQGoB?=
 =?us-ascii?Q?NEJsuxn+yIncDXJBSHOK8M5GeaGgdNM2EHDxDCuXiWa446foXEuFBnnuDNfS?=
 =?us-ascii?Q?JTur1AmdsyY4ik8uSRP0JwxMKt5B4npjzh8t/a1XX3RCERrlWfOk/oLdnGQ1?=
 =?us-ascii?Q?gA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df3fd2d-4f84-459f-8fcb-08dd2231ab29
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2024 02:38:07.9075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YN/gNc58ZsRQT/DQzG5dukO6qtKXnUPjcxvlPdSV8vGsfDfxPnsZM8SKR7tPkYJYIweX5LRPfdm8Ft1dJtrQ8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10303
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Dec 2024 02:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208997

An SDK build of weston fails:
```
Run-time dependency wayland-protocols found: NO (tried pkgconfig and cmake)
```

The file wayland-protocols.pc is missing in the SDK. This is traced to
the upgrade of wayland-protocols to 1.38 [1], which re-enables the dev
package, which moves wayland-protocols.pc to wayland-protocols-dev.

[1] https://github.com/openembedded/openembedded-core/commit/5de187aee675a7=
8fe59620a3fb64a5da5ae662aa

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/recipes-graphics/wayland/weston_14.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_14.0.1.bb b/meta/recipes-=
graphics/wayland/weston_14.0.1.bb
index 50749d7d15..4cb0ca4d5f 100644
--- a/meta/recipes-graphics/wayland/weston_14.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_14.0.1.bb
@@ -137,7 +137,7 @@ RDEPENDS:${PN}-xwayland +=3D "xwayland"
=20
 RDEPENDS:${PN} +=3D "xkeyboard-config"
 RRECOMMENDS:${PN} =3D "weston-init liberation-fonts"
-RRECOMMENDS:${PN}-dev +=3D "wayland-protocols"
+RDEPENDS:${PN}-dev +=3D "wayland-protocols-dev"
=20
 USERADD_PACKAGES =3D "${PN}"
 GROUPADD_PARAM:${PN} =3D "--system weston-launch"
--=20
2.34.1


