Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 586EEC4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 09:31:11 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.61])
 by mx.groups.io with SMTP id smtpd.web11.17311.1667467863497448234
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 02:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=2CdKs9ZY;
 spf=pass (domain: vaisala.com, ip: 40.107.22.61, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cwNMmqQZ3/6nh6tnwEpY9bkakhVkT38rTh4v9DjETJZyV/bp+iJFi2I2NtXK+tngwEkUa/fDZPxh3YEjO/tvpXmRAfMA/vgc/c11tYV8FPrbcFF7C3XzbvLloeX1/dSMmdUnQ6y/XCwsLEasyI7WMVR0Qnw9+JEQTg9zSRza5nmqiguwnZ1VOI9ELVxoXsCnD21NXrzSezcJw+Msck4RLdqgD0nCWn2EvZd7cljk+8Br92CaEEz7koXLDQ/ZsJSxauw55MJf4VDNK2/bWo1YEUZPfLJZjw2FKVD0TK2PQmf98S6r1rlIiBim8DR2In9zb2k8w65Fp5UBshXzmo6cow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nga1VTbpBI9yBDGRU1jKjNSfc2/JsawVfdQ6L1i32mI=;
 b=EpRQH4T7hWq8INtyEs8IOGxzNwYCxSVjW5zluuOpSRbGeZW2yzVee6/ERMMOBmxkB9C03cPX7UCfhCdUhtYMVWldP/5Uc9JRp+ED2o1hoQftVJb9Oh2qCAttK+aqsMz/rVzOkNuMVwZxwMCu/41CSnIncpmiMSjKW0g9c76P0vvyLIP1gfiUeRk7le6/kndzrEtK5wiigvk4SrlB9RDV6cAf5fjLbOqT96/mhRFIqzNhVW/dmHwl2FVCu/au+MDRMeM3fIb9ON1UnBaBd0/uvz4zBO0CqT0irg0oiu1HszyXo42N//h9K/9jrxY+DhXKalHCpwQ/KqOduubF9eSbvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nga1VTbpBI9yBDGRU1jKjNSfc2/JsawVfdQ6L1i32mI=;
 b=2CdKs9ZY85oeO0kmQaTsHJG4LdzkCMem3aKVQa5hzo+wai2+H/l762J70S0zD3p/r4PHGzHjTGkjIvo3pLElbXl0RRjc0GGBZrUB4UEfxR6dfxceAzu830ndO14BeVuNoc/mfinj1vL/3s1iO/yC2h/F5WBRUGpqDo+x3+eGuyHC4zGKY50BYfJqnai3Si0pVA2JqR4rTaFgTdnWbkWsEJewrBu8Kdp2GNnnampLefxoFftKMa/5XDbe3vYYiiyKYSfovP47L1oWiqzJc2v1nIClpxPtiHHxCzH9lymVJ8buj5dhYu9mdvgX2iwaPLzj1xrMcIVT6/DchN3d4CJBqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com (2603:10a6:102:2b3::22)
 by DBAPR06MB7078.eurprd06.prod.outlook.com (2603:10a6:10:1ae::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 09:30:59 +0000
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::a2ad:443:3e3e:7baa]) by PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::a2ad:443:3e3e:7baa%6]) with mapi id 15.20.5769.018; Thu, 3 Nov 2022
 09:30:59 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH] systemd: Consider PACKAGECONFIG in RRECOMMENDS
Date: Thu,  3 Nov 2022 09:29:53 +0000
Message-ID: <20221103092953.1978654-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF000013D9.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1::15) To PAXPR06MB8579.eurprd06.prod.outlook.com
 (2603:10a6:102:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR06MB8579:EE_|DBAPR06MB7078:EE_
X-MS-Office365-Filtering-Correlation-Id: 7093718a-8cd2-41b0-e16c-08dabd7e1e1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sT+AT43w25+2x3yAhHrwYs4l5qZ1HCORKWMYPcxtVNXwouCM1Fsvy2JIHM8LBAhxOBPebUsS4GS/ugdrunymHSFIfrE3XJtRop9su0bhDuzqSURnXjekovkWqhETGo2m5q1em0GBEIe5aLNq9BWiM9qhqU4az4tXLG/oyJW6yZ3z9Yazi5YbAtwjOmAG1kVf/U0DzXOlZ4T8wdOobR81YOxgghD7eIGNh82SHSTOvBH9aOy0KO4F67Nxh34UcmHBOU6o4TQNz/9d7oz/JlcMlzkPuxoZWdUWdMcDTL52VOCNm0Few+9QMgLKm1t2o8/F4qWL+XLRNrcDswhWdRzVRYPTlgBbWYE4zG4CF/1GBw4u9qyAL2tj2xIkQoezIzf0fnkd6wha0963oCW8qnNCG14vJuWf1VKL64iHktJNfqqASWBQ5Q8bqeyefFX413TaqlzdndoU8vwX1RbPbgkG1sIvWD0UaLCMGe/Lb1sJ8BvcXug+kdCKTjylkkzD3UxiGg7rR6cU+2Pel0W6cl9jKHtU7qdPfdAfaRsQEENQtn6CBOfoGovRUQ7hTOI3UlDnelC6VLJ4mzjc2NdM8bKLdbtxZvSjmtUV3RWbfJJBc7gabW6XquTDKbU1AMVVwIycBcnx1GK+rVyBzoIwJhKoCGrbiuE5QAAMA9hA+wFWik3cuQ1jvfUcHRxBc/fPjUmWjvTYK+wy5gvrEKMX3yiBer5zFbPkdT/ZOynW39euVIhGKUjylsLzzCGrl3QsK9iBa3SmN/pf1RXOAhuP9NpP8Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR06MB8579.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(366004)(376002)(346002)(396003)(136003)(451199015)(6666004)(107886003)(5660300002)(83380400001)(38100700002)(2906002)(44832011)(38350700002)(6486002)(41300700001)(36756003)(6916009)(478600001)(86362001)(6512007)(26005)(66556008)(66946007)(8676002)(6506007)(316002)(66476007)(4326008)(1076003)(2616005)(8936002)(186003)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YJdKAetMbTkI3ZPaxB24qKZwbfkNyckOnrqIoGDFZi1fLpVcduJ9uuK1/QDg?=
 =?us-ascii?Q?cjIFJ3DAF+C4IHBxYeiparLpINOPmYaDmUT1TaHyeUx+7nIhgMScfpbp5b32?=
 =?us-ascii?Q?b/zNiDRfIumyJOQX+yFv7OWqSQk5o8A0nvSmCw40AP9P5cf6uz/kQDRVn50S?=
 =?us-ascii?Q?LPkHQYnpQgmPIuvnVHN5ZnfbTPOLJ7AgSgGpIwIfOCJlnv41gARGZKQOM0+q?=
 =?us-ascii?Q?S8sFAEut6sVMJsfygVvpgUyvvf5d4BsOaCEtWw4qxE4WFFvKdiC7T+p7y0nA?=
 =?us-ascii?Q?HK6utNOtzygi0X+W/RNWxQRYs6HY0paUtednLsEX+dZsKhq47VEivjSuYvkX?=
 =?us-ascii?Q?RZ8SBQmpn5m59vbtYKet9cMwhXpVSZVj1IUYlmw3KuPHBV7sCnmHyDl2H1VC?=
 =?us-ascii?Q?eXsPm0x6svBhAzpq/3hbmQ1Q1NYwDS0RiiJsnAd1vRHqR/NnKNlPN+14VmKJ?=
 =?us-ascii?Q?PDbSpH45hvVEXxgAhViCLWPcsCUFMB1qD9CiY7DXtt7a3XttyQFf4Jqg1oLt?=
 =?us-ascii?Q?DyPwYHWcBC4diqIntxm88U1XrtJxa+VE0vqR2SNPObD1LsqKjQAVeTIuwf5J?=
 =?us-ascii?Q?UphX8cV3mDZx0UGH5N2sbJouCpA8zjvlRrTE4fb3gSfSALsjcEFNWm6I51xH?=
 =?us-ascii?Q?Iea/2dMiUBo1OMi5IH1BWXOFKkedPIuvTDePaI9Ra2kVp32nM81nxJqvTF0R?=
 =?us-ascii?Q?NV7n4Ith+2om1zX1kaJX4//skAJvTzFGE2BA/XFRcn2MiWn+O+CTNF/3G8Bl?=
 =?us-ascii?Q?/XTaMWVcYosrgACxSPOmWgRsa4tNnOUrs1DzuWbgnvFYwWgAJ+8nQxc6cPXz?=
 =?us-ascii?Q?rEIuVPQqkQNzGEdkO4X/j0mKJxtEc6ObKYz9fedtRjF7lgx7eL1YdFbhEKc5?=
 =?us-ascii?Q?xp3d5c08WhAD9ZUofgsBF7FPJ1qXPnI6yQPrVRMGyGFwneJhj+fNiLjMGIjP?=
 =?us-ascii?Q?MBT8zP87GaVGeaXNITakpGusGlNF3ZrpGwtrR32GqBb4dpa6e84kmVjTUJnp?=
 =?us-ascii?Q?on0UxRKw/GojB8fsfkC7I2y1xj9nIrbO15WoMs+NC/yRy4iU07c8eH5WoG5J?=
 =?us-ascii?Q?anhjKX6fEwKKFvKYgT3fqu9DQPiiyLubCjzDNA0KSbO8zGUllJXNTHrB+nfU?=
 =?us-ascii?Q?Fa4GEFu2IpubWW/1lTbGqG41VQ3SmqXW4IYFzp37JzGgxGujSRdNFb//gvMS?=
 =?us-ascii?Q?JOCPSozsWQ3mdvsVjXl5xKXLWrObWVPozAlvI4IMzoQkTaLrcjpmNk/y6NOR?=
 =?us-ascii?Q?IgCSYJ1idZh/sdeKsDCWcnSXSaB8udnZQfOPm0kPOqooggWIhlgDwHiTC4Hy?=
 =?us-ascii?Q?e+XEjTRFYkJyMA+mmwX9RJ2SVfAqy2LCzxw7GAPxoq/PPAYYBr5cCMiDMca0?=
 =?us-ascii?Q?kp7UaCgrRDeYnTiHAIHIJ2kY8usmp0XqbSlMDU3d7qU0rEKIg9tev+b0ZZCR?=
 =?us-ascii?Q?5qbOOZIAM8fv+cdiZtU71DJbHU0fP02grhVoqoN81QaoPB59LeiagnQeo0Ul?=
 =?us-ascii?Q?xTPmrRu35bnDgr8DKSxC8a7Q1WE6joy40X2jGUQ2WvPF4JVBE493JTYA5oUh?=
 =?us-ascii?Q?q2zLYaYJAsnY9NyGANZSlXHMwm7l4Q6WznCNbeSvarRc31J6e0PNyLIMmQJT?=
 =?us-ascii?Q?ZA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7093718a-8cd2-41b0-e16c-08dabd7e1e1c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR06MB8579.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 09:30:59.6178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gSyXXM7C2kStEQJu8p58xGJ6+zEpJsn5KC8UBDOqToIniEVWlMz8BClMCsvC4LVcY9N4VOBdYle3pkTHuQGLOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB7078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 09:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172618

Since RRECOMMENDS declaration implictly induces building the recipes
that provide the runtime recommended packages, conditionalize adding
such values according to associated PACKAGECONFIG settings in order
to avoid redundant building.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-core/systemd/systemd_251.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_251.4.bb b/meta/recipes-core=
/systemd/systemd_251.4.bb
index 87668cadc7..1b771a7b86 100644
--- a/meta/recipes-core/systemd/systemd_251.4.bb
+++ b/meta/recipes-core/systemd/systemd_251.4.bb
@@ -437,9 +437,9 @@ FILES:${PN}-binfmt =3D "${sysconfdir}/binfmt.d/ \
                       ${rootlibexecdir}/systemd/systemd-binfmt \
                       ${systemd_system_unitdir}/proc-sys-fs-binfmt_misc.* =
\
                       ${systemd_system_unitdir}/systemd-binfmt.service"
-RRECOMMENDS:${PN}-binfmt =3D "kernel-module-binfmt-misc"
+RRECOMMENDS:${PN}-binfmt =3D "${@bb.utils.contains('PACKAGECONFIG', 'binfm=
t', 'kernel-module-binfmt-misc', '', d)}"
=20
-RRECOMMENDS:${PN}-vconsole-setup =3D "kbd kbd-consolefonts kbd-keymaps"
+RRECOMMENDS:${PN}-vconsole-setup =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'vconsole', 'kbd kbd-consolefonts kbd-keymaps', '', d)}"
=20
=20
 FILES:${PN}-journal-gatewayd =3D "${rootlibexecdir}/systemd/systemd-journa=
l-gatewayd \
--=20
2.35.1


