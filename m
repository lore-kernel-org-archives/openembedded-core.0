Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13098C25B78
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 11:23:32 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.103])
 by mx.groups.io with SMTP id smtpd.web10.19546.1716895406442804215
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 May 2024 04:23:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=g/MtZT2w;
 spf=pass (domain: cherry.de, ip: 40.107.241.103, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DG3r7Nu529AHn3jbRVXQ8Cton8H5uvE/fUUN27n2cS+skstawgEmIeSW2NNzvtVWHZtinO3eJeee1uSr5iQ1HrvWwthskw6XMpVPkc7un3RYtOXhqufPSdf+uHmNwWkww2mdxKt8aga73RqUxbUG8pwnjg9sDTD8qatOBx9n288JMFEZLA3SlEMzH2rUDO9o81f38+/TeA276E+4NVJNubhQzlJ3Q44kFHdnJbIxjac8pnn9dBT7TkmQOFaLVy48jcofMJAF++YU1V2L17HTMaIu6SvYrFs4TQZXZWubVviRpNf7d9Kgg2X29CEFNiFRtl7wy1A8EdHDbNN86+0TgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rHmj2V53f4yfZH2J51dD+VkWlKbaywb9n7UOCNrRia4=;
 b=El9XtY/D8Ss8dPpX3Qj//zMbZ7zU71vis5sAMA+efvNViwXFeLPhX+6oMVfJ8G5d3NCWe6UBeWZkVEaeudO55/J6nW68TEU/QbY3zhj5bMOI122eweiptiyGsoCLsskDXqef5j8olIxxt68ATuFKcTVuizxe9mD083q8bWJIPGWLx8b6ui4poXOr0fJW51do2vkVTCeLaWXgT7eZk2yf83XBF0LsSQ1WMueVtQEvuV2+NqO3ZpZgWcPX2IuWDpPUHyAswFGhSH5A34XHHcNwy38E4Y+8gCMFcDmYDrKX56e/l5q9+w1lDeGJJcAVQ9lkL3uGhOd7zLqUNorQ2D7PZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHmj2V53f4yfZH2J51dD+VkWlKbaywb9n7UOCNrRia4=;
 b=g/MtZT2wIqN0GgaQ9WY7xz1hpHTTb+iSLP+tGLzlXcb5+IJfHnflW4pC2uCx5o1h4lqRVVHMLdgO6hCiJV7+soR+rghhOlP99LehKri1pWkhTozr9JL1EQSm6rmoR9oFoFtMsYFJ7CsYhOW6Ouqt1VT0GstVfseASAd7G1kgj+w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6589.eurprd04.prod.outlook.com (2603:10a6:803:128::25)
 by AS8PR04MB8070.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 11:23:22 +0000
Received: from VE1PR04MB6589.eurprd04.prod.outlook.com
 ([fe80::8476:1b2f:f236:db31]) by VE1PR04MB6589.eurprd04.prod.outlook.com
 ([fe80::8476:1b2f:f236:db31%6]) with mapi id 15.20.7611.025; Tue, 28 May 2024
 11:23:22 +0000
Message-ID: <2261f556-6e25-4d18-9147-2f9d361bdaeb@cherry.de>
Date: Tue, 28 May 2024 13:23:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] image-bootfiles.bbclass: new class, copy boot
 files to root filesystem
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20240528090832.725884-1-marcus.folkesson@gmail.com>
 <20240528090832.725884-3-marcus.folkesson@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240528090832.725884-3-marcus.folkesson@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0030.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::26) To VE1PR04MB6589.eurprd04.prod.outlook.com
 (2603:10a6:803:128::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6589:EE_|AS8PR04MB8070:EE_
X-MS-Office365-Filtering-Correlation-Id: c9207076-0638-4aba-7e78-08dc7f08955f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c1QvK0hzc3hydTIxcHlLb1pqV1ViVklwcEJoV2E3Z2JFOHNzYUZsT2RuTlhE?=
 =?utf-8?B?aTRra0NxMUxtSzIwUEk1KzZ4enNhelJKMjJ5QS9BdXBrMmFaN2lGajBiZHEr?=
 =?utf-8?B?N1B3Sk9YMkc4OCs4Z2pXTnhjaVpXemRzNXpDVVRQQWhuZTRXQjJud0p2bW8v?=
 =?utf-8?B?WWhnME8rSjduOHh3YU1HUDk1T3g2OHdlT2pWaUcxeThMazVyZm5ONHNhT1Fa?=
 =?utf-8?B?QVIrMUZwUzNod0N2T2tNK25QWHJRRU1vV2Rqa0p4ZFhOR292TUFESnkyRjJo?=
 =?utf-8?B?YXl3R3c2bWlaU0NQa1RkUVBxaTk0bmMrdFpXK1FtaG1NMGpPVXJTSG5VR2RX?=
 =?utf-8?B?d3VFM0l5NnkvVE92QXVBeWovS0t5a3dEb2pZa01FKzJpYThLVkJvRE9raWti?=
 =?utf-8?B?R2tZbldNdTZLVXcyNXcyaCtqT2p5Y3NJeVhSeU5QUHJjQ2xTYTE2Zm1vVSs4?=
 =?utf-8?B?eXJJR2lNeFZQdFFHQlZSZy9TeUx2QUp0NmFJcFBrS2FqTzNpVWhBSmxDN2cv?=
 =?utf-8?B?VU0yblpuT3VQUUJtVG96NEg4VDNhdTBPampacGUyQVNkV3pUczZMSkFieTdX?=
 =?utf-8?B?bmFZSmZBbEdRcTZFSmQzVDVsdzdYcEhGVXJaS3RrSk1VYXduQXRqN0RTazZi?=
 =?utf-8?B?YUZWTXVhT01HVld4d0pKWHJReGpjQmxnS3A1VW5UVDhwUUNCSzZ3ZVdRSkN5?=
 =?utf-8?B?MmI0am0wUEVub3E1ZWp2ZWtSN3RPbVJuRWI3aGV3dnBhQmF1b05MMEk0NklZ?=
 =?utf-8?B?eHVUaldOM3JKUVJzdEZOOUJwV0FpMmNiS1RrbHNaUmhFVCtkQSt5MkxvT2Rq?=
 =?utf-8?B?Ui9zc1N6YWNUajNNaFkwSXgwUk5UNGozNk1YYWxxaDdZTDFJc2liTGRhcEhR?=
 =?utf-8?B?M1hhRHIwTjU5N3hWSkFPVFdGRm1pZmRJT0ZHWEUvdXZyTkdLRGhmNUx3S05i?=
 =?utf-8?B?RmdZb0pwdmJiMFkyRi80dENtbGsvUEhjaU5yeWJHeUlUVTNlTGlEenMxblB4?=
 =?utf-8?B?aml1UDRQeC9OOElscXVEY2k0dS9xVHFta2pqVmVtTkhwckJScUtVTkVKcS9L?=
 =?utf-8?B?MnFwSkdyRzBINDlSeFBBWkdoUlErTmUxZ1VER2IzM1FHUGRZOHdiVDFqOHpC?=
 =?utf-8?B?bjQzYlBPMkR6dFlXQVJjM3huRS9OVVh4SmlFQk5PRzQwcjZGRjhsRnhyK0dz?=
 =?utf-8?B?ZkRTckNUcE43aitTQnhnVVBCNTg5M0xjRElCQURFL3ZkV1J3Z0sxYTNoQ1hj?=
 =?utf-8?B?QWxJRFk1M1VlNVpxSDVJcXFGMk9wTExTcWlucHpoUmxZMU9yVmZWM21MS1ZJ?=
 =?utf-8?B?ODNITVVBTEN5M2xKR0VUT0lIVklrRytYdXNrcDJWNVZ2dmRqRmxKcVYvV2Vx?=
 =?utf-8?B?N1VUT1ZDK2lrd0pGSk9IMnlVT3dVY29WVjEwbVl5dnlCNU9najVBMWpZd1Ny?=
 =?utf-8?B?N1EvMjg5aHhBOXhtWm5kZlhhd3pWK2xNVkFlYlN2ejQweUlBME8rUmRlSldw?=
 =?utf-8?B?bXJHcTRkN3loZTA2cnBjWjFSUTc1dS9QZFo4V0VaZDhrdS9tMEdQNzBsZjFk?=
 =?utf-8?B?em1FSEZWK2hZektPRTh3WHJsRk1rWlFsRjY0WUt2NmNiQkdDRDR5am9MVXZU?=
 =?utf-8?B?cDUvU3AyU3JKWmRvRjVvZDV0QzNReVE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6589.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VmRyeUpscFdlK2UvdHcyeU9KQlIrQ0dWVGMrSkNCZXJ4UHdWOE1wWnRZakRz?=
 =?utf-8?B?c2VvSUJyOVNhUjVyeXNZMlUzN0I5eUFBbGl0czNtc3JNclk1c21DR3l3RUFS?=
 =?utf-8?B?SG5UR1djUEZNMmhkNTRrUHJnbEQ3YWhIT1BjdUN0ZDJTMmREVXNSWnc1Z0RC?=
 =?utf-8?B?OXk4a3grMDNzWTN4ZEg5L3NJMHhiQTlNUDgrWlArbzczL1NKc3JZSTVveDBa?=
 =?utf-8?B?czJ2OGZmRFVVZklMMTF1NXdVWlJiYjBRL3Q5YzFIQW9XSXM0Wi96WHFTNjVJ?=
 =?utf-8?B?Rkp0QTRjWWNlakRZQld3WVEzNzViTnNoVEZKNmYrSUZtVjk4Rmd1aDl1akNy?=
 =?utf-8?B?cU83cTZPOFQvaDFHcGJaMjRqUllDczczdytqVWpVUngxMnpMcFhEaTEyZWVK?=
 =?utf-8?B?WkErUVQrZ2V3dFBPQ1RCRGN5Z1Uwc3NSR3loQU1lcFZKNGZtUzJVcnZhbTVU?=
 =?utf-8?B?MlJpZGtNTnN3Y0R0MkgwUHlvYmpUUmowT2RyR1h3ZmVsWnJFWWtPRjY0d1hi?=
 =?utf-8?B?aVhuTGdGdW0zdjZiWlFoSWpPcGdnSDR3Sm9YOEpXeWdyYTJYV3lLMlkyR3A2?=
 =?utf-8?B?c1lRK3A0R2piNm1yQ2I0ZzZjWExRN0dJNkc5ZCswdWZ0T2FCNXFrRUN2NU9N?=
 =?utf-8?B?Vk9ENmpLUDc1bSswcm5yY0M5NFZOOStOTW9jMGtRd21zbG9QcElwa0xpcnFW?=
 =?utf-8?B?K3NzWnFoYWlCY0xEcXlnZEk2eWhLM1VzN3k5dkhiclA5ZjRncTJrQlRsYTB0?=
 =?utf-8?B?Z3VJQkNhK1F4bzlDWGtJYzJWSURabFdteGU3YWdnZHNZaWJhSmpiZkNBRU5s?=
 =?utf-8?B?Z2dmRXhtc3kvZ3NjQU1uN29pTmpwaEgyWFhqMWZrZjY5d21NVklnZTRVd3ZS?=
 =?utf-8?B?MmxQenNWTk9wTGd0ZzVXSnR6c015MkhPS1VWT0owRDFTcDhDbzVIV1dpWUo1?=
 =?utf-8?B?aW1OSFRvcDkxU01Pc0xvemp3UXgyQ1ltZkt0RkJEWlQzbkIvbEtac3JIL0xa?=
 =?utf-8?B?dFFGMlc5bloraFI3RHh0Z1BlWjhNcDI2dnl3QUxCZjd3SFcyalZBTFpVUGpw?=
 =?utf-8?B?WmNRYTNRTnY1NUdzdmdqYkxtalI5emFacWxKK3pKdWh2SXBmSU1BNUVzQXRr?=
 =?utf-8?B?MXlhVTRhc29kU0lQS3FFMlp0c3ZtZzlnYjljcXQrT3AyUGNqdTY0N2hVNkdq?=
 =?utf-8?B?UkRBemlLaXh0cTRxcmVYUUtHQ2tjYWwvTE9BNkhDLzdoQ2M4ODNaWG5FOUlN?=
 =?utf-8?B?T2JjRURTaWRSUzl2UWRXL2h3blJlcjl4dnp2QytuTjI2RGh5NExnTmlISXZ6?=
 =?utf-8?B?djVmM1JCcS9vVzdQM1ZzaEgwQmtoQ1dXYURVN3prVitIdlJtTnB6NTdlQUpU?=
 =?utf-8?B?dHBmbVpWdFpiVURmeUlNcGxhdjVqVFl2Snh1ZjJvbWxTNUxjRnhla1gxUVZz?=
 =?utf-8?B?YjJYQlpMU3JURlZVaTYyRDh0R1lwblhYY3BvdEthRTVycGs0UEQ1d1lDekVN?=
 =?utf-8?B?MWFVYlpWZm1LMks1SGFnUjlFcVhzVGpSTFZQV1VCZ3JlU0dOcGRMV2s0cUU3?=
 =?utf-8?B?SHBzendsUVp2VG55czdWN2s2ZXFzVzVZdFJ4SFI1K1VjOHovU2dzNUI1TTdu?=
 =?utf-8?B?d2wzbEpwT0I3WjI2ZlQ1OXVBajg1SVljMWk3VWREUzUvT3c2QzEyVUhFdytP?=
 =?utf-8?B?TVlER2wybWRRMkI3YkRyQjRYYzA5Nlo4b2tzQkJHY0ZqQWJ6TFY3SC8rUU1m?=
 =?utf-8?B?MGZjSjM5eEYvdkxsbDdqV3EzQTZnUUVKUjBCYTEvVWtVU0FjWGVvYWlhSVF4?=
 =?utf-8?B?OWR5MjFzYlZnTWxYSWFIRjdtSklYZ3M1MHZaTDAxaDJEdktVMVV2QnIvM3A4?=
 =?utf-8?B?NmlmRHdzTWlzeUQ5ZEh1U0lMN2JGSVRlUXBNOU5ha2NENzYzald0SGFPUzE0?=
 =?utf-8?B?N3EzK04vSjRxMmFiMHpIWVNYcDgwODJsVyt1YnRuOEZLRDdETFlpSW1uVVRS?=
 =?utf-8?B?cFAxMVVsUmlaY25nL3NyL3JuSkVaVzR1bEVQVUNrbHFDODdmcXh5VHg5R0ph?=
 =?utf-8?B?VWFFc3BXUFRuekRXTjNOZno3THJkRlZhRkM5dGxZOVNrQUF1M2pZTk1TZ0I0?=
 =?utf-8?B?VjJJMXdzZ0tkOEJtTkhOV2VKTkFub1ZrcnpNaWthUERuK1NkTkUzNk0wVlZx?=
 =?utf-8?B?a1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c9207076-0638-4aba-7e78-08dc7f08955f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6589.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 11:23:22.3397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BeU+nwk0l2H3JKYUximz7nSip1j08BnNOanTmCri3Esry6xKDwf+BD7wZYcZr91x/V85G/x1TFSmeMMS7h9xY9n1EZtx1rDabeKnrU6vMwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 11:23:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199969

Hi Marcus,

On 5/28/24 11:08 AM, Marcus Folkesson wrote:
> image-bootfiles class copy files listed in IMAGE_BOOT_FILES
> to the IMAGE_BOOT_FILES_DIR directory of the root filesystem.
> 
> This is useful when there is no explicit boot partition but all boot
> files should instead reside inside the root filesystem.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
> 
> Notes:
>      v3:
>              - Skip the intermediate bootfiles() function
>              - Rename variable names to be consistent
>              - Various python optimizations
> 
>   meta/classes/image-bootfiles.bbclass | 38 ++++++++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
>   create mode 100644 meta/classes/image-bootfiles.bbclass
> 
> diff --git a/meta/classes/image-bootfiles.bbclass b/meta/classes/image-bootfiles.bbclass
> new file mode 100644
> index 0000000000..79c58f414a
> --- /dev/null
> +++ b/meta/classes/image-bootfiles.bbclass
> @@ -0,0 +1,38 @@
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +# Copyright (C) 2024 Marcus Folkesson
> +# Author: Marcus Folkesson <marcus.folkesson@gmail.com>
> +#
> +# Writes IMAGE_BOOT_FILES to the IMAGE_BOOT_FILES_DIR directory
> +#
> +#
> +# Usage: add inherit += "image-bootfiles" to your image
> +#

Simply

inherit image-bootfiles

c.f. 
https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-metadata.html#inherit-directive

since you put this class into meta/classes/ and not 
meta/classes-recipes/, it could be included both with

INHERIT += "image-bootfiles"

and

inherit image-bootfiles

The former is to be included from configuration files (e.g. a distro, 
local.conf, machine conf file, etc.). The latter inside the image recipe 
directly.

I am wondering if we shouldn't make this a recipes-only bbclass? so 
moving it to meta/classes-recipes/? This means that we won't be able to 
use the INHERIT += "image-bootfiles" anymore but.... should we? On one 
side, we have something that only applies to images, on the other hand, 
it's probably something close to a policy, so rather part of a distro. 
So just wondering, not asking for a change :)

Cheers,
Quentin

> +
> +IMAGE_BOOT_FILES_DIR ?= "boot"
> +
> +python bootfiles_populate() {
> +    import shutil
> +    from oe.bootfiles import get_boot_files
> +
> +    deploy_image_dir = d.getVar("DEPLOY_DIR_IMAGE")
> +    boot_dir = os.path.join(d.getVar("IMAGE_ROOTFS"), d.getVar("IMAGE_BOOT_FILES_DIR"))
> +
> +    boot_files = d.getVar("IMAGE_BOOT_FILES")
> +    if boot_files is None:
> +        return
> +
> +    install_files = get_boot_files(deploy_image_dir, boot_files)
> +    if install_files is None:
> +        bb.warn("Could not find any boot files to install even though IMAGE_BOOT_FILES is not empty")
> +        return
> +
> +    os.makedirs(boot_dir, exist_ok=True)
> +    for src, dst  in install_files:
> +        image_src = os.path.join(deploy_image_dir, src)
> +        image_dst = os.path.join(boot_dir, dst)
> +        shutil.copyfile(image_src, image_dst)

This won't work if the parent directory of image_dst doesn't exist yet.

"""
 >>> import shutil
 >>> shutil.copyfile('plep', 'thisisatest/alsothis/test')
Traceback (most recent call last):
   File "<stdin>", line 1, in <module>
   File "/usr/lib64/python3.12/shutil.py", line 262, in copyfile
     with open(dst, 'wb') as fdst:
          ^^^^^^^^^^^^^^^
FileNotFoundError: [Errno 2] No such file or directory: 
'thisisatest/alsothis/test'
"""

So I think we need to run:

os.makedirs(os.path.dirname(image_dst), exist_ok=True)

before calling shutil.copyfile?

In the bootimg-partition wic plugin, the following is done to install files:

install -m 0644 -D <src> <dst>

which creates all directories leading to <dst>. Additionally it makes it 
rw for owner, r for group and others. It seems that shutil.copyfile does 
this automatically (doesn't seem documented but it did this on a test in 
the python interpreter).

Cheers,
Quentin

