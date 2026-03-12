Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8501D106ACEE
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 20:57:04 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.765.1773349015461391102
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 13:56:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=TE9n6E3Y;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.53.66, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s+yKwULbCTKHCSIcyvsqPaLCu21bjvdF5mTr+AqfNwqzoLcPKMbhPjuVtKBlMMKUSSGhRglbWfAdIH2d9iC7EeBMpqo7upWzSSvf922YSt8WFWSVhh2CE4BrC9K582aKXCcozlJ2aLau8WQNgCyMExE+oDnVbIXGroWMVzd42YRf2jw25FgBwIlTNB0lueKz5rETdE2TdqbEiNL+sYM6B/UmXsR/RUEAY8HRXpDt98kd0EA8GxbkSzS84IZXDBJWkyM4IWYLHs5ZB84/8wwfVmiG1w6NWyr90hb94+pdaqJ8m2dJvr9EK0nSA1mP0tPPCfpy1kDFiiF0f+XPH2JufQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asks1U/C1KYl53LqxEFpsFVMQOTK5Um7EV1PZ7FQa0c=;
 b=SICpsdPoXKNhiftmNpcvjni5QnJCp+n2KKqaxarH3zuFMKjgZH+lkFeEuC+RztYcHZnzM31m1YaEaqvnFe4e8TBV4JSXN1+SUAoqCCwqTwvULFssSvMH/qjVQdtBlkvUYbYhPr37syZiP2TG4Nu09Y/bQOM6HO88zaivsxSbCy+SRx1sO92wZqV3jHSpnpbajzER+Ubg2Ea4cNEWL+zhYlwu0dv6MIq3n82ANzwtE/wQB05KBGIlIsR6qzfKeypKhIcucxU0uFX0AkaUZPlzr+NH61EDbyOClb+0R8h5VDfUtxkNEXs1Ycgngz3J5x7RJ2suc0AZPAYzMN0kf/0EcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asks1U/C1KYl53LqxEFpsFVMQOTK5Um7EV1PZ7FQa0c=;
 b=TE9n6E3Ymae8dxzeHnFBNOX5oZ//c7L2EbQL81a5ogtoLGB75ki2/wh56pWEFba1z1hpSqOx3VN+8G8XfRqoX0Zl/ES/LNJd7iBYPXIcuzB/TnpXHRmqdxPpZYu1lxUXvaWnH/YrtVNA7qtYxjooEWI6PnD2nYpZndWUcn03xUY=
Received: from BN0PR04CA0007.namprd04.prod.outlook.com (2603:10b6:408:ee::12)
 by IA4PR10MB8326.namprd10.prod.outlook.com (2603:10b6:208:56a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 20:56:52 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:ee:cafe::dc) by BN0PR04CA0007.outlook.office365.com
 (2603:10b6:408:ee::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.28 via Frontend Transport; Thu,
 12 Mar 2026 20:56:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 20:56:51 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 15:56:51 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 15:56:51 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Mar 2026 15:56:51 -0500
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62CKuprD3507183;
	Thu, 12 Mar 2026 15:56:51 -0500
Message-ID: <444c3784-b4d5-4882-a71f-78351dff0a80@ti.com>
Date: Thu, 12 Mar 2026 15:56:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] uboot-config: fix KCONFIG_CONFIG_ROOTDIR path
To: Francesco Valla <francesco@valla.it>,
	<openembedded-core@lists.openembedded.org>
CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <20260305-uboot_devtool_fix-v1-1-4eeba4bbe4c4@valla.it>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260305-uboot_devtool_fix-v1-1-4eeba4bbe4c4@valla.it>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|IA4PR10MB8326:EE_
X-MS-Office365-Filtering-Correlation-Id: 61559d02-99cd-4794-4b71-08de8079e2eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	vcqhW+6b/txW8l7UYK/dqvBpvDEkumJJA2DWjlLEs51c6UG3U4VvHEQwVSP3guYADHN9XuzvAB2dAaIBeSDnBC1MpZ/LQ4EiRsRMwOYP3wAhYLzeRboN5Uo6NxyMKlTmMnVZ0V6+GcRZmdxVcH46ajVCNthmIxXMsfomi7TCihqWEVaL4dJixd3IVTdx05aX+fXCR59+XamFi8lAWCmeqRpaN9TKFR4Av3q3KY7D+lSKAOh9cbfusPv3i/1ft1/ZkyVxD692Wh2VyJhMZgSoxKCqrWnmkvr0kWkvxbvJ3pDBhZqA5/CRuPq121h3d7Lrz1FkU7gR7IalzOjnqA8ZHghWXn5pBOX7YE07N7KrgZNqjxZvxg9FLL2M6jI2+gALvtTFqN5eTTRWfbh7qxqEE8hc3mYUCABZ5GVABDos/aG6c4+tX2XgLjjBctwwYzy0af9wpYl99jZQsLuSRMo1BES9Hc4GSZA7cBqtEvq+KysD61Fev02K8g6Tzvi8NNNR9V6OCaR8WjAFJ2iqlKAFHmzkW4+lCJLYdrUtOjSYSnaBQm1/vwvFPcXoImOhO2GEiyvE2yjpFd5+ya5NmR/QG5MWEjBZ0YiC7LCs/VRe0vn8j6DJKZXGg9Sb/9NvMFtSy4uKrah4zib8kAwBakTML00/mAd2j7jG5ijYmCk+2yI/m5ALUgriRSwvrN2BKzDgn+GPdO5PjptDlxHaAd8AwFJmn1kyCv9rQ9Y1RETXXxe86GBrexdoNLSCCd9wIJ4wZzn1OQQy5xs/iGtVyWnVYA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	PSK9pbYW+99CrPtD1I7S037GD8aGAvqdkvGP1JUkGEDfOKWwDZioYQ9Ihg3Fllo/qEgoQJFgYB6xMjAW93mxwDmf2HlQCXjvSIfw0YxepNgUXrkZ3GlkvrtHlSeKVfaquouD0JsmisqpkuNEyyA3iGNRj2glEKZp0/xfk3j5UtMfNeVc5E2ba6bmfs6LO6YgfL/y3Ll8yqJH/pMwnP4tsdnxGBG978Blc4s+z4S9XSBU1ueXprDXyVIOwhysor3LcDMydgZxrPRIDnMvOxxuAFkomZxLKV2RLypAT5E1vBzb5RbwrBmpIgHLN2zAgz47su6CEu5Fmiv5IrQfsYrYMrwepVlZyqYJbEMZYxAmTI4lMirRZ4TSf1wr0X7IolxD0+EAX0pcAphGznZDj1gsWlzxYky0FuEnAYHw8vNh4vwpXaBUCYyBC15NlOA1yxVW
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 20:56:51.8554
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61559d02-99cd-4794-4b71-08de8079e2eb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8326
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 20:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233005



On 3/4/2026 5:04 PM, Francesco Valla wrote:
> Commit 22e96b3 ("u-boot: Make sure the build dir is unique for each
> UBOOT_CONFIG") changed the u-boot build directory name to include the
> UBOOT_CONFIG value the build is performed for. Align to the new pattern
> also the KCONFIG_CONFIG_ROOTDIR variable, which is used by devtool to
> create a config baseline in case the menuconfig task is enabled.
> 
> This fixes the following error, which can be seen when building u-boot
> under devtool and UBOOT_CONFIG contains a single configuration:
> 
>    cp: cannot stat '<u-boot-builddir>/<u-boot-defconfig>/.config': No such file or directory
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>   meta/classes-recipe/uboot-config.bbclass | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe/uboot-config.bbclass
> index 112fea2de44cd716fbe65598b275410a4fb90056..f7848396c17fdf4835053b9f5a45480ef8ce9f1f 100644
> --- a/meta/classes-recipe/uboot-config.bbclass
> +++ b/meta/classes-recipe/uboot-config.bbclass
> @@ -251,7 +251,8 @@ python () {
>               # Ensure the uboot specific menuconfig settings do not leak into other recipes
>               if 'u-boot' in recipename:
>                   if len(ubootconfig) == 1:
> -                    d.setVar('KCONFIG_CONFIG_ROOTDIR', os.path.join("${B}", d.getVar("UBOOT_MACHINE").strip()))
> +                    builddir = "%s-%s" % (d.getVar("UBOOT_MACHINE").strip(), config)
> +                    d.setVar('KCONFIG_CONFIG_ROOTDIR', os.path.join("${B}", builddir))
>                   else:
>                       # Disable menuconfig for multiple configs
>                       d.setVar('KCONFIG_CONFIG_ENABLE_MENUCONFIG', "false")
> 
> ---
> base-commit: d3e757f21403554e7064c5fa2b353080d14d2ce7
> change-id: 20260304-uboot_devtool_fix-170221fd17bc
> 
> Best regards,


I'm working on adding a test for this change to make sure we don't break 
it again in the future and I noticed two things.

1) This whole if block for the check is indented one for level too deep 
for what is required.  I'll include moving this when I send in the test.

2) Do we really want to disable this if you have multiple configs.  The 
logic of UBOOT_CONFIG is that the last entry in the list acts like the 
"default" set of uboot files.  In other words, there is a symlink 
created with the proper UBOOT_BINARYNAME that points to the final 
version generated by the final config.  So we could point 
KCONFIG_CONFIG_ROOTDIR to that final build directory and not disable 
this feature 100%.


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

