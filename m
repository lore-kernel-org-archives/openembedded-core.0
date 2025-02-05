Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81FE8C02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 18:10:49 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.70])
 by mx.groups.io with SMTP id smtpd.web10.19353.1738779041545535596
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 10:10:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=Jr7FPJOL;
 spf=pass (domain: oss.nxp.com, ip: 40.107.21.70, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bw8T3sUgVXBzhuppuULUjcv0W5K4FF/Vh1w5b9kyqqPrEgUDprerAsPWkBC+mbGZzYTipw/sH+ubkIbAEaeNV1EOMap0LQ4QSa4Ew5SnjzfJbwyhejjSr6ZYgSHUpt6OJnPm+gZ/Qcw3iOYGUBMFJt4lyipnpG6H6BNAuVcdCHjU4u6ZReSN0ChXeBCh2up2ezDNF+xda3V7fmej/cd6klzRGcvzdHWpUsy7bICrzgnPvXjiaJIGxiSkAZ1axbk4yKgYC3sr0wYEndB0D3KsktBGi93lUwoy+wVE84FGLPhaUtKaFJrCcVs2XPiWOWbMmHHJL7tgOZhrcCuB/GnaaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZbrjVVEQl8YCTCkDvS84CYN+Y4w7+mMZYxtu2OTnOgQ=;
 b=Ry+/nTcbc/WMNPOv2zcpEgBp8vsIAmokK5uSiJGTpH/cVioc1HdcmIlR42i5mjMJJVkH9c9yIJ4HnqLEVuqojkuVSWe69HYFcaRvrzYWB6zsrHgZB8j3KgeVCOw95C5aaiSQ52D0evDnxxJRgr2JhXpiaFdpizwAFCwrsXal9e3dTXXW1m70f1ft4m4W34RsJmQx+5CLwj1zyUFr739a/5hXxIYVJGP4i+IKyWUmAl0vf9ND1uuWQJZSRpr+D1WKtpouZBNG0OJlpI3YrRvwmRSOiOFBHry6G0UU463ylGWhBhxymCrYIDrXuudGsF1ORQe7wyPSXLA1anciOSyp8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZbrjVVEQl8YCTCkDvS84CYN+Y4w7+mMZYxtu2OTnOgQ=;
 b=Jr7FPJOL/aQoxiRlob+GBQJycAO58qoVfAaKjli61/IpY0se5Zd7ZkTKRvo8ldZGRiuxZWAWmXxVvF0K2Ub00b7mSejD45mGDz6WylzX3tgx3xbzH8Eq7TyMp/2hXqwlNCZ8kvLor8u0jw0bdUri44fetHQJ0RTxEhrqsx3xFg50UAkwiirrXmYOYUaCXYzUlW7CCwSCOfwv+brCEMXvqbxuha3n/ISr7BHbU5vuhyoN0gWX1kxhpkgzZ3RIlVv2s4C77gOONA7mgtNHyDoiuZVKiwb95jvDX/JzNwgAPK20chuskbq1Y5CnniCdbVScrwatyjkXcqFi4gOL2ZrvpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AS8PR04MB8166.eurprd04.prod.outlook.com (2603:10a6:20b:3fa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Wed, 5 Feb
 2025 18:10:37 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%3]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 18:10:36 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>,
	Marcus Flyckt <marcus.flyckt@gmail.com>
Subject: [PATCH] uboot-config: Fix devtool modify
Date: Wed,  5 Feb 2025 12:10:15 -0600
Message-ID: <20250205181015.3064866-1-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0368.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::13) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AS8PR04MB8166:EE_
X-MS-Office365-Filtering-Correlation-Id: 0abeb1ee-f65a-427e-5c79-08dd461063a5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Jf30HYMzSqBkY4kFyCWm23bHgFunPkyp/okTJuyUK4D2/GCoz2bCsEQwYypm?=
 =?us-ascii?Q?EdCSeKXSzIfIcsjXhLx1iuYAxz0H87lZ8W/pePamJjyrXi198JqOERpC7MfO?=
 =?us-ascii?Q?BVuqrCybdhjyg/28iNW2iOioQ1SEMCBlDYf49jNPP82ijPg9PejhRHAVO6UL?=
 =?us-ascii?Q?m+w9Ya0t7EL9Q6FZnI5YGMgLwMJMh1Jsq0GoTJCX3ngLc8t8pMABDd7TEFP1?=
 =?us-ascii?Q?nGzzVwe3eY97Y/lkEsA+Df6fGkfDJ3xIaRJCIQDGeF1q1w1Wqpo42ax9o2/v?=
 =?us-ascii?Q?/u4MoBdLsgrSVXSOBjM+mNI7AcbxK9iZJaEjumRzd0zQIVXMaPizkzANGZ2p?=
 =?us-ascii?Q?Srpl2g/pYCoxcGz0TAOCJNttvc/a8SzgHs2DSb62Mz7iHD4Yr992sEni8ymT?=
 =?us-ascii?Q?oHDXM/+7yUC4i9Br7Ngm6Je1lc/nIB6vNv7GyaiBoeeqGYvxroyvx6s1BNGi?=
 =?us-ascii?Q?vhAQMAxDyN7/lxkVm23yaD3onaJdKpsoBOhdYDffkXWTzJJtTOKCzUJCyyV+?=
 =?us-ascii?Q?H8sixfT6QYOllVc7pECqYTd7ydNG1GVRFNnVjxGRXOYr4EtydIhnKnyqcAKK?=
 =?us-ascii?Q?+yY4Xo2lzB+QAhb6H7fYst7eSkVRUQjXdsjZCck/ynfr3oqy4Xlf0RPTRXIF?=
 =?us-ascii?Q?xvz8LFin16Ojz7SSDFE719YGASB9o3Rs52e0B7vIH4zfu8GomE0NGxODN5MH?=
 =?us-ascii?Q?vIpZ3cEOGK0inLAiqUKYy1IvR7iRazfM4pdXnZeALDJtbAedHHAgdHYX05wH?=
 =?us-ascii?Q?9ixNBWhztBbpRlt6WrclykVunmOUkbMECAijfXDSTIARkqWRtO4fp2JAlwzA?=
 =?us-ascii?Q?BlXxE+1Sj4BXnDDPL4MfXvfagQbO9+57CUs/w/Nzvd7bPOYbZicZbjpy5okv?=
 =?us-ascii?Q?gclBP2WRDtN1RT/1gXt64d6U6pXNnPoGiXMcyWC+qMRsqBfAjK75Powox2CU?=
 =?us-ascii?Q?ipeV94piLGdyss4f4LDKPzrIKAAcesqiVrjKsjnXMbp7Uuo+/ezf4sNfoc6I?=
 =?us-ascii?Q?oKKFXpSQRztTdwQmsO21x0L86FW0UsDe+iTzkUCI7fMHTWkuXAgbsfltief4?=
 =?us-ascii?Q?0Bc78XaMdBhwR/WNwJIWpGEuF4sKIZItfUcXUbQ3TToSZRDwRbUKP4F5g1CZ?=
 =?us-ascii?Q?V7YH5L2SKMoplpaq4S6eaQ4rPG68GqziftikqYxJ5NtQR+VoSqgZGiDOioCb?=
 =?us-ascii?Q?Tv09FzHPS1kwzd8BnxvQ//q/7jYrLwOkkILE3TF4ownYJAeioiQkIaKY8pyg?=
 =?us-ascii?Q?SGUz+KxcyVbEvXq5KlMx5db1PuLyDfj3/YMcghAV2YvDihbRYUiUIAzPTL6Z?=
 =?us-ascii?Q?DHFnAubrivOjMEdRFzowK8Rx1/iNo/NWiZCvNgJK8Tf80vIgCHAISJbMr0JE?=
 =?us-ascii?Q?fSNAr8xHvxcPEL/Die7+CtP03Ef4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NrgyeEGV8DyAH9CanKceTip4mKJdUnczaT0iRFPG/Ou5FSjMqi3wNbcAI2Sq?=
 =?us-ascii?Q?n9w94Wmt4V2qxWG4vVlH/MJyEsFgr60AslBs2tmmez3PduLiL+aNBHlfbEZV?=
 =?us-ascii?Q?PryiSDuWXlwUbF1+YWFcghSdST/Ky0ngHwywAwnOWBqJJtxjRJZxWLEH+Cff?=
 =?us-ascii?Q?SNpZ2Xx/LSpbd6TCX9R/J9wQzGKODUquc8+IluWFdNG7rnSL3WpHHK0F6oqB?=
 =?us-ascii?Q?vtpICd1Km8bkr762ERYEYxED0kDOQK2WGtX4fZXvrd1g0oa3KHby+BwEKd64?=
 =?us-ascii?Q?Wy1BMTfsMH81WzTDUZk62LmoDR3oohC3B6rHKqnmnFbtxrSvCv7A3esJZRlm?=
 =?us-ascii?Q?+ApDVZtWczcLBmFmgqHJG/aKRhXJz5FxG06LMYH+0IH4HCUFKVE1DXrKzsop?=
 =?us-ascii?Q?M6FLyAPVZ9pPBKq822Y6NW4Ogu/lWdISaoHfHKBHhRxpS/e3xmPjwJr3m3zl?=
 =?us-ascii?Q?DqR8LKqvx+UMBrpCsYlZqw2B92/lqec2v+oVYisSXSf4KAAdX+CqmXwJ9aOV?=
 =?us-ascii?Q?u0jl0XS2olN0OJfaELGmKKhlASeHZ722XuYNNA00wAQsqbRRT8LhCjqmuYHx?=
 =?us-ascii?Q?ayunD4J9SXu9Q60VnsGqlAisUrcuk1wOZG+7ce71tpAQCo8vix1C5jR7wcOl?=
 =?us-ascii?Q?F68qVrEgZpjsfLP1pHT+B3TdcQZXczFqE+YUF8gOkyxnnPmkp+hZcLU3FemN?=
 =?us-ascii?Q?aSDgXuqI+0t3Gtup3iAgH/S8cPPLcho0IhXy552ZXuq+CFg6RTH1jGrW65FY?=
 =?us-ascii?Q?PXxJS0S1FvwAU2r8h+zkDfqmWkpZMO9qoxGfrz0UP205bwGaKzM3OYBi1yeT?=
 =?us-ascii?Q?XPsUGlD7evbPC1qnc6kPI+iVyXz0Tb4GM4YdE18KGiC+1YDCLWx8R4433+rD?=
 =?us-ascii?Q?Xioq8Dl38YP0BLHQU58RPuJTJr9yAXtUMIRzIJhcygvuB+lBFb2WhMH4YfYP?=
 =?us-ascii?Q?/C7RVNP3qcItVzkknd8+n1W6yrtnJZw4vEQ3yKz02o3U1Rda/qPPbuISj4vC?=
 =?us-ascii?Q?3KBpjeaMZ0AB0AQgPCvV7YjagDMkoDmK1SrY6u4NxUvGTmk7LXA83c4maIf2?=
 =?us-ascii?Q?/sil001zArENEkADd2CRw92T7H8L2y4kgHjWPvIyG3x3BXCnPKrDolaa+Hw/?=
 =?us-ascii?Q?MK5TiFs6EOFvTV2kMy5oGw4ucrFCdmGdMw74WMzKa5q0lUo/xPKEtIgKCXSJ?=
 =?us-ascii?Q?PQuyU4SACr8k+lnrVJXDsgIDCL64QLSMmvVcjLt+vtkUcRwO5OlAIlztmTx7?=
 =?us-ascii?Q?5ofMTP3F5PMD0V10O1bxXcBqHo3jQrbOnQ2G89qqAyZowBH911RkMTI9vUUR?=
 =?us-ascii?Q?cwFYtt2j+d1ZhbXrNbrC4tLVnTd6fU8DhTTRXe/KKSNRAxyrV/5KRHs6WALD?=
 =?us-ascii?Q?Wr5Gt8i91ndIYl3qBknxjHHsPOehTV3/WVDsoZln+6foTpVuUvZ2vg7EHiUs?=
 =?us-ascii?Q?iwTGhf5DHrMiUb0QDNqj9RgNRrC1DjOZkni9+cnKKJS2QUQFklMWfz8j/rVk?=
 =?us-ascii?Q?RPDuvCffXSGKzxGr5J1qolD1BaC+oFKzsM3dedjpAm6AMe64arfxivZg2Myz?=
 =?us-ascii?Q?X2KIhKPBby1WhZNV+YA6dox0dCm0LjduluP8Ifl4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0abeb1ee-f65a-427e-5c79-08dd461063a5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 18:10:36.7263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GCq0kWnr0dscAycCzffreodv7Y5GOj12nxOJ7vps0QWBu1SHvp5ITDLLQfvKnCYRbawBWKdjqhY795uriaMaWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8166
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 18:10:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210872

Fix a problem with `devtool modify` as suggested by Marcus Flyckt on
the mailing list:
```
    I encountered an issue with `do_config` when using `devtool modify`
    on `u-boot-imx`.

    ```
    [...]
    | cp: cannot stat '[...]/u-boot-imx/2024.04/build/imx8mp_wl400s_defconf=
ig/.config': No such file or directory
    | WARNING: exit code 1 from a shell command.
    ERROR: Task ([...]/sources/poky/../meta-freescale/recipes-bsp/u-boot/u-=
boot-imx_2024.04.bb:do_configure) failed with exit code '1'
    NOTE: Tasks Summary: Attempted 963 tasks of which 962 didn't need to be=
 rerun and 1 failed.
    Summary: 1 task failed:
      [...]/sources/poky/../meta-freescale/recipes-bsp/u-boot/u-boot-imx_20=
24.04.bb:do_configure
    Summary: There was 1 ERROR message, returning a non-zero exit code
    ```

    The issue seems to originate from the following lines in
    `workspace/appends/u-boot-imx_2024.04.bbappend`:

    ```
    do_configure:append() {
        if [ ${@oe.types.boolean(d.getVar("KCONFIG_CONFIG_ENABLE_MENUCONFIG=
"))} =3D True ]; then
            cp ${KCONFIG_CONFIG_ROOTDIR}/.config ${S}/.config.baseline
            ln -sfT ${KCONFIG_CONFIG_ROOTDIR}/.config ${S}/.config.new
        fi
    }
    ```

    For some reason `KCONFIG_CONFIG_ROOTDIR` does not point to the
    correct directory. It gets its value in `uboot-config.bbclass`:

    ```
    if len(ubootconfig) =3D=3D 1:
                    d.setVar('KCONFIG_CONFIG_ROOTDIR', os.path.join(d.getVa=
r("B"), d.getVar("UBOOT_MACHINE").strip()))
    ```

    So the main issue is that B gets expanded in this expression, and
    then later B gets changed by `externalsrc.bbclass`.
    `d.getVar("B", False)` does not solve the issue, however the
    proposed change does.
```
- https://lists.yoctoproject.org/g/yocto/topic/109254298#msg64152]

Suggested-by: Marcus Flyckt <marcus.flyckt@gmail.com>
Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/classes-recipe/uboot-config.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe=
/uboot-config.bbclass
index bf21961977..74992182c3 100644
--- a/meta/classes-recipe/uboot-config.bbclass
+++ b/meta/classes-recipe/uboot-config.bbclass
@@ -144,7 +144,7 @@ python () {
             # Ensure the uboot specific menuconfig settings do not leak in=
to other recipes
             if 'u-boot' in recipename:
                 if len(ubootconfig) =3D=3D 1:
-                    d.setVar('KCONFIG_CONFIG_ROOTDIR', os.path.join(d.getV=
ar("B"), d.getVar("UBOOT_MACHINE").strip()))
+                    d.setVar('KCONFIG_CONFIG_ROOTDIR', os.path.join("${B}"=
, d.getVar("UBOOT_MACHINE").strip()))
                 else:
                     # Disable menuconfig for multiple configs
                     d.setVar('KCONFIG_CONFIG_ENABLE_MENUCONFIG', "false")
--=20
2.34.1


