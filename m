Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E9FC02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 22:19:30 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.61])
 by mx.groups.io with SMTP id smtpd.web11.25992.1738793967319757243
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 14:19:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=cvvO7PHk;
 spf=pass (domain: oss.nxp.com, ip: 40.107.241.61, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CXXtl1ERikOYXmbxlBnj01cel9fdhyt6Ako+AGJnZAVbrT0Uuch3Yf9oNM4g5AqkZ/uqT/Dlp1hudZuhQ4UDlpBqnlKQMSb5dG4/fV7OHAah6r9zTiw7m+ajoXUSK77EkBG+T9jf2v+L9zVSaUXyOds/7IY2kWZ21e4YTiA5oHeb3BrgBPEhKIBds/2/KGg/sYLThcWAg8JXYwwfRY2z4j9KKwkUEh380Hjpz7LyrQu7RWpxjEbBU1eWZlOhe18u3/c9giEKtxkCeYMpPFQ+h/fJCizG/yVZfYlpjcGeo7p5WsagJG3lTQP2IqWKZMaNhHNvb7VJHCOJAHlG4nvR5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KL42xAGiMBA3PfExU4ZvmaXQ/KYKLAsdKbChwwHzGvE=;
 b=j37gkHtRNVEK7m7vby2+xS4ksTF3MW6HXI2ODtE1mBx5PrGJ9KOvKBlJPP3QOu5FTzFVrqxJRGVeDTGm1tmzZn8817lNVNdo7JHfZqhlzWSQbyxlrZb5R0ljgbvk2muNga8JeH1ykTqF2WX9uBwYovCxatdr1e30W2wMACmwgdUpdm8QYtnzWokWfVUGCN2CaQ5H3ZgiG5HFBTyjQU0mOhxprGocSz5fBqmIyDGb2F0TrJ0UpzeREB+kzv0DS5MJxAwGc6+V6rhZbRlPZKzT4ljBROFaGeGIaAD/RTzQlgoGoyViVI3ftgTXghfmAN1gkwKB5JmZePD5tVqYgKybHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KL42xAGiMBA3PfExU4ZvmaXQ/KYKLAsdKbChwwHzGvE=;
 b=cvvO7PHkM8xOcm591Qy5jj0aeaertBjSIaOzOLMA++eVilTAhkUIoY+z/bJRUHCPzqIrKxTXUx+wh27hsPKkKB+mZuc3394pyhbLnCuvgGkMpemZWXGGujX7WeBsE+Hi3N68rjqo62iZEdnP+HVb3U3nK8z+SA7T+XYR1Mw44eoahfhyT5lnX909WOK5frOCsfCWSUJ3a4lB1lg9OW/UL+unyl0p7zufLuSxBKi+ZilgK2EtHqYf8ffV7c4k8ak4FAGrfx6d9Oyp47hPY43Xww0n25cj/zLm7SpJ5yplJgQvuAZzsBVr7p2Rw1VpvAIYBuqdidAKVcPALJ2wsDrbXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by VI0PR04MB10928.eurprd04.prod.outlook.com (2603:10a6:800:261::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Wed, 5 Feb
 2025 22:19:23 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%3]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 22:19:23 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>,
	Marcus Flyckt <marcus.flyckt@gmail.com>
Subject: [PATCH v2] uboot-config: Fix devtool modify
Date: Wed,  5 Feb 2025 16:18:55 -0600
Message-ID: <20250205221855.1397666-1-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0131.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::16) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|VI0PR04MB10928:EE_
X-MS-Office365-Filtering-Correlation-Id: bd6354fa-5758-4d0b-4119-08dd463324bb
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?83roayQFmYlrlkC+a5TEDSo4722JmUfw92KKY1/wXdVipTY91N/36ZcA3jzC?=
 =?us-ascii?Q?BbSs4wLZxmYqXbOSafyplh35k3oGxpJNqoJDPQaDXb/U50tIET6REiVXf+ML?=
 =?us-ascii?Q?G2IrCZoOix6uCf5mowmZBJp6dcNsD2c2kz3wylt+Nub8MkyCqxR8A17TQA2i?=
 =?us-ascii?Q?f5tpT2H4s+7qMxk1Prq+pTuAF4lx+wF5ZgcBoUoqxXrSrRIlT2Fb18b7jVlE?=
 =?us-ascii?Q?KEKEUgdnbcYUbzyfFPCb6CNKx6gRuVbuPY7BD9Az2Nx37FM6TcFXZ+dVBDgO?=
 =?us-ascii?Q?HxIrMnWcizfqSPPFXnj7RVOqKpMBhPyVKumD6z3aLBFOu1VkUuxYIicWkqD4?=
 =?us-ascii?Q?sBzEprQKWnxS2e9dhQLKG7ZZIDeG2f/2uS3STCmpL9we2QpU1I006UtJO7N9?=
 =?us-ascii?Q?QJTz8+Vq+l+lqj067L+wR1Fsk10dbC3jsDJjNeECaPF+5OvU83MhVSO7vwDc?=
 =?us-ascii?Q?3EKrRCgF75yt+DKjMX6z+OVkUGV/VL9w2LQc0hWmK5Z/tfJ8rEKkahahZftO?=
 =?us-ascii?Q?ripuHmrZjeEIkRcUaDZ/hdrP+Vfq2FIdcvWIS7ceFb7l644hZ09W/e815bt5?=
 =?us-ascii?Q?qdjTx00I8M55vJK88nuiIT6aF5cf/STxRiv0hlIiP+YN0N6E/lWeOLLrVS7C?=
 =?us-ascii?Q?aK9zssoS4320ChpwRkxIAUbdxDbyn5/pM6p+oIGsNYD987ngabmhllpVlcxR?=
 =?us-ascii?Q?HF/paSN1jfKduv/27u8Py2cEp8dbyEa69ZxQvT0VaeKgVxMtpKYXSAikNpEn?=
 =?us-ascii?Q?CYjxBL8py+pCZrVg1+ZCBMNF/8F/ddJN1wUSVYm1Npnj/dfrOnySMXjnnFMu?=
 =?us-ascii?Q?S211Cqhe3UDoIQijbzEnxXwe1Cr7EpVBJSWUgxdNd4vXKSntoWXw7yEKG5FW?=
 =?us-ascii?Q?OvKcEsA2VBqw+7DFSmLa3k32LMeOMkMqDzy54TKV/tgL80+iZp+SqVQdHPVj?=
 =?us-ascii?Q?7HXxowrRSWygj0Bc/U4G4GNORF7d6/WnZa3uY1MBSb41c9vCKz13GJjB0Fm/?=
 =?us-ascii?Q?OSv2AZXqponVLuw5aTMVSyyObOFAP0++t+hdjCBcpuzbPFGcMIXiD9R07l/k?=
 =?us-ascii?Q?5OJXmPj8WNw2s7vrdrzEs+QUE/JqXRxAlxR7x3dBeVxUVo3vM2VsAW17MzZO?=
 =?us-ascii?Q?/yayAO/v9Uy5NGm/WWgz+hWBcKkqzmUX/s29PM4xEEfvB6ovhkVDP2DoHGfv?=
 =?us-ascii?Q?BiMJD/CNjhfoLMAOkm7KEkp1tVSPG//NSfHxl+DExL+BCS8kHPOiM91RSVl+?=
 =?us-ascii?Q?+JItNCgWpAgQvGRkXdtlJlW0MVTU5WUgTqULtuk9EyJj6lS+7VQ4RHlpWITJ?=
 =?us-ascii?Q?MIx/YIaBs47ccusXJz/gJbKbRnLPQp50YCOqeGPV1t5LGPatIkRM5lh42NOx?=
 =?us-ascii?Q?7jyb8+WWBgRSq+iDAIQrZBNR0si3?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GEZd45ncuabOxp2qokU6M1dR+X96kjRs4+iV5jvaXNTzweg+JkoDnVdouCiZ?=
 =?us-ascii?Q?nOZTW2Dj1gV/ntssb87ZuWzf9lxyBPjt7T0twFrz0o9CpoFDMt2og1BNUCcI?=
 =?us-ascii?Q?KyhAVuObTRIgDj3fajxXQdYZOjWcvmpitwuifYLp16OEV+lHroLi300R01sN?=
 =?us-ascii?Q?W6zj+ceHUjLt35h0HCTzh4eoUP9k7HOKJ1W/kauS+cPkjvJr0LNkIi/ttaq1?=
 =?us-ascii?Q?2JvshmmmZHLHHMsH0d0I2eZDvsdCWzr8HaYJLXf1nrGFoDtdPNTl6UhUrnqS?=
 =?us-ascii?Q?kPGgKjcfrvWX/NIlT0sKtQELsa2wxl/O5QgPvlHuVwRjnHCdY/V9Pb+rkE5O?=
 =?us-ascii?Q?w6yntU4x6lf/VQfcUtHyvDCGT/oC+wzEHVmDiLUIIOV6oKRWeBsJz9qAxAja?=
 =?us-ascii?Q?Ar8uvYuhIJlTsX5xDN3GleQyB0DgEzVV5MMtm6bHH/n679v317qXLiUsx9H/?=
 =?us-ascii?Q?aEIh+adaLIpgLJSvzeEsksBFAMkToLjSoUy+ahPWFlFlVPlXPNVDA/hQxDKU?=
 =?us-ascii?Q?1vCkv8dxVmTEMWQW56E+q0TOEho+CqWnrmRQk14cGup07fgnsZRNOtbKVGAM?=
 =?us-ascii?Q?moraf0/sQTZiHLWmbPLE0MFduoHnV2Z12HiX2LPDzKtk54z957vS89MPpNWF?=
 =?us-ascii?Q?yEfqwIEOuQAMeMIgsHZZf8VflmYE1F7J8zQpuVKBG7wXxIJJLrkP3XGnTIxl?=
 =?us-ascii?Q?LluElQaUkl0c5ECWNpCTNI24iRrfP9bXTjscWY40QpAWHqLr3cOlG0TNncno?=
 =?us-ascii?Q?tuYh5NIB/8ftoAMeeI3n8AxtLB14XNqQXqxp8Ief0IPOWFZR+byghnsyV0Tj?=
 =?us-ascii?Q?pBQ+ayL8duqDI9j+eqHaGcHsJ1W0ZMEsfnjfatDGlNWJksliTKKwWtOkrK/L?=
 =?us-ascii?Q?Tc0YP9K4rNljPHtqOIaYPvaYPtD2wJkZ0n2R6R/nUfiMWrLtz2P6yrCGtR5T?=
 =?us-ascii?Q?Vnj1c9YQgz7JnukCWvSSuGfMoq1wjyunZ7klQWMWWxd9KXxUhYagnEzdooz/?=
 =?us-ascii?Q?ewUY7RDAGi8g1DmHS8tbwVENKKI+wOadaCPkuWo2Oa2tUWXPaufkw7ea2bbW?=
 =?us-ascii?Q?reE9VPnpYgweJff1riwIMTlJJ+dOGANYx6V5J/BJFWYLosY5j9GyhsM1zTFN?=
 =?us-ascii?Q?+xdM1aBxTIchNdV/6nmbDUxISK9NNQAnqP1MWeCwGA2q6Sk7g+zhI3+fLCFF?=
 =?us-ascii?Q?ivWqLfOJeuy2x5hUoawtp2kTkrip/CfRbxLVpfFybmP67KT5O5wHUdRvVOcN?=
 =?us-ascii?Q?9bdvpYZPzxeBmeJU+UFAWCzfJBhz7VMoDxN9vuBQOOH4Y+u/i4s0pTENrDST?=
 =?us-ascii?Q?7/eb5FS4ziehCmhbM8qjZpwBoAwBitqGaIdGbozyJeU2GsB+gZZbjkG59yr6?=
 =?us-ascii?Q?XuPUqXq+zdujOwzZ69eISocE9H9d6Z2743OCnG1fXA7XA82HhDrciyM89kOH?=
 =?us-ascii?Q?iF4Ze0ChpD1q3z2IswL/2znjTuN5PrP3/+22y4pu5OwG+/WivrlHDpyUJ0y6?=
 =?us-ascii?Q?1MvTctFkAckGik36GaO7gMmMX1s6vBtxEqBtpQk5TV62xd4v0avOPaGQx0hF?=
 =?us-ascii?Q?rVK1YquJoHP2a+GxE/BONsUus0XduKNH2uLdFtvL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd6354fa-5758-4d0b-4119-08dd463324bb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 22:19:23.1918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NeKbIfXXsQmK3Fo8wl8OSyH8+E5rwDX6SQsxl8EYgWjke4dvwKSa+DfRWoo52GncYml52lJHus8bA3kn2S792Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10928
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 22:19:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210880

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

Fixes [YOCTO #15603]

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


