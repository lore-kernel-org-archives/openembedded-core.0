Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B2C8C35278
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 16:12:57 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.136])
 by mx.groups.io with SMTP id smtpd.web08.2070.1646842373366271435
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 08:12:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=vXSB5n50;
 spf=pass (domain: arri.de, ip: 40.107.6.136, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCfGsyT7qnZ4UPA6uPLS+qnx/0bFYd3VExbAwjYVU1MochOXeKCs6Om09Z+5671Qg9mSNng/55z97apH3p756JAfElBdGfsU8fo6UW4mp9YsBfxjxqMVokTI/7IdJ1pU6VmCoWixEtyFFemW6gGX7NQ4wecPpLbeoYFaP0fVSqdqU5ZROwPUC43g4EHblY5ZcouEqrih5tdkKmqyZtiFhO3IEndTkVD8YKoe9Y/s90FBIagtahhIzwa9n2rLDKjw96qy/5DKqVTFMqn0uttOGw6ShgFyegZLethCxQ3To1T4gQMOCA6zQCovGEhV/3IzMNW+eDsDDmZ5PxtedOTR4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yw1IX5pmXYzLxyus1sdcjOi4rcEXOKrQj4wTptiBAaY=;
 b=C7zpHt5p7RBiaaK07w5UsZYC4RW2YsQH4szH/7qDLpTFDw6kSwrOCjQ505w/bQFceeqfwHm0Q5T+go3SXpHlQanbfSHQiZPfNQ6TOXePWavDzzG2xZV/71KedbzGQxEr5kfmYDwVnYGbznVuCZGzwwx7X+qa5SIFROJ2lSzbDWgoUMOs3SVpegw9ZZcvBRo+Lxc1dszSYFm3IPyVWa2F4jbPyTrvmhbDeeLe+uKCby2GyxOlAo3ENIYUBSQRUd1UshhfUyDQwtTo8N9A4vPTqopryCHW1GjCy7sq+2LYN+ifBnjC8pkMPf6HAdlll6nQaI3dptI4Vdm330mjJRBP9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yw1IX5pmXYzLxyus1sdcjOi4rcEXOKrQj4wTptiBAaY=;
 b=vXSB5n50yohGIBxfFFTVRHiqI8jQ/uBch0YD3hTn5Vk5iQKsSPJzaLpK1kVnDrAjd7X/ZyKtx/mdkWniSCJlJvGGa6LSiZKG7KsFmssnmjRC2w2q/aHLmXaFu9xy5lQl4P8dxGhxsemwZzJTDv3v2DLwlTfjecI5TXHQG4wrLuY=
Received: from SV0P279CA0037.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:13::6) by
 DBAPR07MB6727.eurprd07.prod.outlook.com (2603:10a6:10:194::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.15; Wed, 9 Mar 2022 16:12:49 +0000
Received: from HE1EUR02FT044.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:f10:13:cafe::f0) by SV0P279CA0037.outlook.office365.com
 (2603:10a6:f10:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13 via Frontend
 Transport; Wed, 9 Mar 2022 16:12:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 HE1EUR02FT044.mail.protection.outlook.com (10.152.11.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Wed, 9 Mar 2022 16:12:49 +0000
Received: from dhcp-192-168-0-28.wgnetz.xx (192.168.55.52) by mta.arri.de
 (10.10.18.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 9 Mar
 2022 17:12:48 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: <jpewhacker@gmail.com>, Samuli Piippo <samuli.piippo@gmail.com>
Subject: Re: [OE-core] [PATCH] binutils-cross-canadian: enable gold for mingw
Date: Wed, 9 Mar 2022 17:12:48 +0100
Message-ID: <2117950.irdbgypaU6@dhcp-192-168-0-28.wgnetz.xx>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <20220309091323.2647842-1-samuli.piippo@qt.io>
References: <20220309091323.2647842-1-samuli.piippo@qt.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [192.168.55.52]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f92eb2ad-ff8a-40e2-07d0-08da01e7a7e5
X-MS-TrafficTypeDiagnostic: DBAPR07MB6727:EE_
X-Microsoft-Antispam-PRVS: 
	<DBAPR07MB6727E45ADD613393CEF64876BF0A9@DBAPR07MB6727.eurprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LiUeKyMRhg9n4wjEsvJmb7Or/P06P686HQ+Mf0b8vluVJJwIlfBwi5q9O/UseWQqDXjCJrGTQ6xEXUGxC2NKo2TqDwGpEuxBHb/ecwu6FPPoDdwHXvSkDZnlIkJcjBLUWhIWoePN5usn+myNOmHkFaWwnfLIpll5W4A4gtyBb0qLnxg8vpyJMLardU+zD2hX3q+4NB04pg8eJPMxga4n6hzMuB5j6qhlzQPyyNXMeSTKHjJ8CWJpggYFjpOsAGt0DwT+bhEKoIsgNXjZSU7kIpBr9QnVMCJUGQ8PylHN4qm3RiYc/yPuPsQfS0gNP/Hjy/98XZeGnnTAxe7mry2DSZhMDbfpbN+swEWSFpp62igQL+ARC+WiCX4qQYjVy1Ye03NiflAgzdt3Ybw1YV3ppbbT9Ziq5x4CWyYSOMQk0VkGjM/aAH2JYRWtkx6c3GkwGomGM+/VIHmAdRFWL7TVuPQsVn49WsUFtSPhAsMYBXiKJmUDCLPmFGU/oxalCxsr5NhOCJFaYelkarulf0BQyyaK/yeIcF4E0xllywlmwlZwzludR2bF9aaQyK6vw10s95hr5KZy+Ih5CksBl+75ZwY4MH4ppbk4zzBmNce4NBdr9SWcNzsfdU74qBmYbK+rO/x0sNDbc57UUM3E4dafVleMSK/1eSjb0kfbe2yygSGjWxJG/eaGWE4puWAVujH9pVn0w1UhJSBc56t5OiVrrM6mNTlLAus4kBkGrjjhrYYjG9DlkuBPGV3OP2ZACJrx9CrDDvA8yMPUJFSkHDyi5NmMiAvgkeQlA1nBft6USoBS956es7bfqLyxfeKH5bIy
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(4326008)(6916009)(16526019)(70206006)(70586007)(8676002)(47076005)(82310400004)(36860700001)(54906003)(316002)(426003)(508600001)(83380400001)(336012)(9686003)(5660300002)(26005)(2906002)(966005)(186003)(7696005)(81166007)(8936002)(36916002)(356005)(86362001)(55016003)(39026012)(102196002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 16:12:49.1443
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f92eb2ad-ff8a-40e2-07d0-08da01e7a7e5
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR02FT044.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR07MB6727
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 16:12:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162970

On Wednesday, 9 March 2022, 10:13:23 CET, Samuli Piippo wrote:
> This reverts commit b5a595a4be09756b88e91f3353e3b221b165ab44,
> gold linker can now be built correctly for mingw SDKs.

I am interested how to use the gold linker from the SDK (on Linux).
I already tried this in the past [1], using -fuse-ld=gold, but without
much success.

[1] https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg142777.html
> 
> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> ---
>  meta/recipes-devtools/binutils/binutils-cross-canadian.inc | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> index f44f46602d..b3d591e658 100644
> --- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> +++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> @@ -13,8 +13,6 @@ EXTRA_OECONF += "--with-sysroot=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VEND
>  # e.g. we switch between different machines with different tunes.
>  EXTRA_OECONF[vardepsexclude] = "TUNE_PKGARCH"
>  
> -LDGOLD:sdkmingw32 = ""
> -
>  do_install () {
>  	autotools_do_install
>  
> 





