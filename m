Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB09C54E58
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 09:34:43 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.121])
 by mx.groups.io with SMTP id smtpd.web10.39156.1710754477596931435
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Mar 2024 02:34:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=RSLOK/du;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.8.121, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evpfG14PXMjZfLsrxdlxQXz4Lm4Z1G6a3c+g+5IfHQe6sPVP3FkDE44rnMdQIk9nO0SRvHEtW9A+UlIXXgooDzX6mL9t3sGbrOIKobkMcj3nevoBimU7kjBbpXZJbZLt1xKogrOu4aEmQUvdCdml0aNqcdVEk3rkwE/c+yDEuNQD3voz7hW2t+HkmFXFWLsOrYAThqq3L/r5n5W8iBsUI57qCFP79tRNApTIkBO7nNSYAc4kyravDzh0TBd0PoETSJ/inCVbuRc5tuD+jARk52TBWgqZSVbaHzfpJ+XwCZWRMO5y5wPpIKGws2lWYNnwvYk40cYhg229odigOycQaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PrF5azTDn29pZoDbOiq0rUjoPDguR6sFoG+fe27Rzlk=;
 b=e0She4EzfX99vOAZhTcYRd+to5kUynHCoNn9l4UxFI3wXLaJJ7WZUKaUcI1DV9WHlgX0O5n1NXUjEpzHpQv8DRA09MG6W+IlCUG628H4JgpQMC7Mf0KsVxW4JYBqRnGsrgHXxIkrW0wLVI59L/eO6vNDxbg900IaWoZ88pDFw8iDwAzkUFJ92RjhymKno/9S0eSuKzQc3KfXszygZqhI1Qa6cZbqHXY9NvGk1nwinRR/OzrBmmb58XZzIalQniwkzBG85EqluN28vE6vbYYPH9KdqiID1FgJcmmzqJlvJ1FbEq6qM98GeRu74bzb5Q+0wp1xhrTdunGrdAGKE4Zx7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PrF5azTDn29pZoDbOiq0rUjoPDguR6sFoG+fe27Rzlk=;
 b=RSLOK/du22m/gCvN+kVMYP8zSjmiqxNo1++Qi4GRm2DcfwIWNS20xvhkgrt121lLEHQiftq94F/2xPikXVfhJT3msPcUX+tq7LT0Cdr29YWTiiY55ntH4/d3kSpGCbJMAGpPe4/v+yi9uODYEMfkwbJh4ChNj8v3prKNHDG9C8WCXf0t1GptcA/KNmKWWNqvJcUpjdEuS2rEZ8bwRI3+gTKLRb88U8FInoFBQa8CZLYKJp2gspUihVE5UZkIODvXsMhvKWjU05QAWfbJMzgquMchAbMNIk0u1NScdeMlM3B7qgGqTXVNFDCXAPMk6z/61vo7AvGOcg+XIksNLbUirw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AM0PR04MB6817.eurprd04.prod.outlook.com (2603:10a6:208:17e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Mon, 18 Mar
 2024 09:34:34 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::23:4118:ae4a:8dda]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::23:4118:ae4a:8dda%5]) with mapi id 15.20.7362.031; Mon, 18 Mar 2024
 09:34:34 +0000
Message-ID: <89883e28-6fff-43ff-8a68-67af3025b5a7@theobroma-systems.com>
Date: Mon, 18 Mar 2024 10:34:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-core][PATCH] python3-gpiod: add recipe
To: xiangyu.chen@eng.windriver.com, openembedded-core@lists.openembedded.org
References: <20240318093554.2521527-1-xiangyu.chen@eng.windriver.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20240318093554.2521527-1-xiangyu.chen@eng.windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::13) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AM0PR04MB6817:EE_
X-MS-Office365-Filtering-Correlation-Id: 604a8c48-72ae-45f3-c866-08dc472e9ec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AVMaC5tfThCkAMcPaYe8w/ofnSZYAgqcxUfe19R+oe1AwHnU9hO3sYLCr2hKlvy6zJLV69ngnTMCz4KVPi/iXIU/u16OYqDGvZ4NH6fChZK1BpEk342yDKn25vNLMPbujWnHE5irRadGXBNg9U/90ZeGMyUZxXkw2oaO4cehaUpmf+KCQ5JIndNO07BtKfOQjETTCxBWlOLB3s2u1V6QpSaSi762WZYQ4hopH3siAdctTdwZN6nWMU1ulLL9RCE5JucMkIdTikWFwx1MJMrH0a0ifA537Gx98cVkoQKfZYcdxixjhvVU1il1EySwgi6xWiWKnPcMGNXzPyY9yoco20cyh6yhweL9QBkXVcXFcwDBPQJ1bbVoUJDWveyffHUqWZEGimCYc8mo4bx/NzF6pruWY1i2Nd4p8eunynTtXyOL6SbcyrsXr92sx/07Wm/Z6RzrqRcRt3W6/kk3oAODZ/Ui07ZnxBMu3VlpEriF8hJMhn2kqaGKbZmLeOmdD7919dpZ9HQ9mEZ3luoBKhjNog23BreArING9/lc4Dp0CqFazdKxakPGaKZb91SSV+laJNrCE5xWVbbC/AJhpBoLqyDW1CsXAc8Vw/fmq13svyI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TllvWXRKTkl2SFVMcVdNbjl5d0tEcUhCY1RKaWhKc3l5b0N0S3dZMGZHM2ZJ?=
 =?utf-8?B?YmhnUTBRa3lDa25WbCtkcTBBd2poSDhwQkM1cEltSzZCQTBYZ3BqZjlpRUVU?=
 =?utf-8?B?T1VrcWN1NWRUWlFCbFFjRXpWS3E0clNXM3VkQjRrUkdrMFZPU1M1TnJNZUZW?=
 =?utf-8?B?RHRjaWhHSU9tVEVGRU1JZ3crVlU3RHorRFk0QkMvd2RROXdWcm9LYWg4eWkw?=
 =?utf-8?B?NEp6M21WanBtVkhhM3BDYVdrbW1UZDVSMnlIUE5jZU5uRjBvSTZYZzV4Tjhs?=
 =?utf-8?B?RVZXcGF3R2ZFcCszM2dqNVZiQlhPMFBaYXVmRDhCTVFHbGlVd0VSVkxlblFv?=
 =?utf-8?B?M0E3dzhGWlRXa2tBNm5vR1Rma21Ea0RTNnE4Qk9ab2FJTFkzL09yUXNxSmtJ?=
 =?utf-8?B?UjBCSS9YMlV2bS9KSkJPWXUvK3BRMklMUVYvaCtXNHQwZlRiV2hvM1JEd2tP?=
 =?utf-8?B?eXdMdU1LQlREaVpjYURWbWJNSWJPWFR1NTJhSTJRTGNRK1VxZWozRkRGR1E4?=
 =?utf-8?B?SE9oa3BxK2REdWNad2ZGN0JkbzdsWW9aNDRyUzIwSzlUNDh0UjhhTWx0aXNH?=
 =?utf-8?B?RGU1RDN4LzhWdGxEcnZuakhBTkxQaGdmeGIyS0F1UXpWRXQraHF5ZWdsY0w2?=
 =?utf-8?B?ZnE3bnFndFpuWVhyZndqOSs4RUt5UGhCUngrRHNMOEhkdG82cGJGV25XRFow?=
 =?utf-8?B?dHcyWGJkMmZxdlMySGVWZVd4VklLM2R1dS9pN0VYa3ZEaDB3SnFOVDE0N252?=
 =?utf-8?B?OUJBMGFST3M5TXVWM2hzbnRsRTRhdlRmeGdiY2MxWFBBOGpROUhidHVuNnRZ?=
 =?utf-8?B?WER3ajEzd0NOdG5hNXhIeU5CWW45TDhrTWhkY2RiY3Q3cEQwelYyVU8rWlM0?=
 =?utf-8?B?S1FNRWxkL1lIUXdKSnI1TGxyZzJpQnFTMEZmUExvSFJOOGJQb09GMW5mbmVY?=
 =?utf-8?B?bmNHVWdDbHVudkRJTmRkaWZBcmhVd1FueGNJMkZyejFGRzlDbFhseGU4eDlV?=
 =?utf-8?B?aXFQVmJCYmNNRFdMbDVBK2pTS2Y3V3JPN2ZFNm5tR2ZyckxyYlB6dDBqZnJ4?=
 =?utf-8?B?ZkpVSUsrQ3BFSUFkcldJZmwvZzFVQTZwZ1EzQTdQcDArTDlWTVRIUlI2NFQ1?=
 =?utf-8?B?Vk5qeEhXNVlBZ1JER2gvNWdCdTlhV0pPelg4Y3F6Y3owTjZxMTBqY2QrcWg3?=
 =?utf-8?B?MVZEZEFwczVUTXBqeTZyMWJQK1hlVGJPYXV0UUxrcTJjY1Q1YkJQVE5NN0ZR?=
 =?utf-8?B?Z25OQWFsRFNlTkJUc2I5MGRHOSsyeXJGL2RTSVJ1N0c2bXEvajNyNjl3eWYw?=
 =?utf-8?B?MXB6eDJaMXpmVWQ1M01NVXVaSVVaOHVYWGZyMHQrNTFlbTFhSHV5andEOVRX?=
 =?utf-8?B?SFBqVnNqMVVyKy9ueExhUE1WNERoOWhjNEJ0SVhLTFEySGdRS29DZy9yVys5?=
 =?utf-8?B?YUt2VUppMHFvRlcrdUduZWtQZC9wMm0zUnZaR25qWEVrd20wd1RweW9RTXFv?=
 =?utf-8?B?cmJUaklYczg4UTE3b1kyOEVPT1dhRUtoWHZZeE9tSHhSODhzUXdYdCtITlBr?=
 =?utf-8?B?ZDJQMWJEU1lSTzRybFMzdFdtNnpLbUVPMTNybVBPUkx5T0hITWFvdVg2by9p?=
 =?utf-8?B?ZmJYcmlTZVNMQVdvR1Z6RnZReld0bUdPSHJmS1A0QnY1TG0wd0lNcjRTMkMr?=
 =?utf-8?B?TGc2Z1phbTMvV1UzUnh4b3d6S3p3R2N6OUFxYStTU3pJOWowZ2cxUFIxOTh4?=
 =?utf-8?B?NXdwQVFXb2VTUFRFSk45Z3dYTTNSR3VkNXEyNVFtaGpKTGNJY0plelU2SlF5?=
 =?utf-8?B?MS9FTGVVcHQ3TTh3RHdXdkcwamNaWXJxZzlVdzE1MERQQ0VWb3FtbFIrM3Nx?=
 =?utf-8?B?WUU0VkRsUlMvNkpKOXp3UEwxSjJMVVgwOXV6WkVTMTFic1RaWURhbytkMXBH?=
 =?utf-8?B?eTloSkFJZ21TVTQrM09XY0tJbHlscnZ2RkJPMFJxdjA1Zjh5VlVYQXRuK0RT?=
 =?utf-8?B?WFcyRXNMYXM4NDI2NXBNcXhzZDMwanpVOThESFZWS0gzWFBtSVRGbWFpZm00?=
 =?utf-8?B?ZGh6MmhXQmdSN1lHYWxJd04xUHg3SWVKaWRvaDdyY1k2QS9wbXB1a1E5UGVp?=
 =?utf-8?B?SUVPbkZGaE9vMk1iK0QxK3V5QTREK3dpajRqRXllc3BmK3ZVS3R0bEMra0NQ?=
 =?utf-8?Q?OURbEXb9Lj+rrJBp858eYEA=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 604a8c48-72ae-45f3-c866-08dc472e9ec4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 09:34:33.9583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WNFPvzUcF8i4hOOWLVDbCpBsIuoALK3ixL0o0890NbwqPKAOudrh3bzrwYU6gDCVYYyzKkcwSJsBHdpLGzTLI2QyzT39+GS3kkKjRO1iXcmfIhUyPfwO/P0py9RYCSPY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6817
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 09:34:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197298

Hi Xiangyu Chen,

On 3/18/24 10:35, Xiangyu Chen via lists.openembedded.org wrote:
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> 
> python3-gpiod is a python library for interacting with the linux GPIO
> character device, it provides a simple way to control a GPIO in less code.
> 
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>   meta/recipes-devtools/python/python3-gpiod_1.5.4.bb | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>   create mode 100644 meta/recipes-devtools/python/python3-gpiod_1.5.4.bb
> 
> diff --git a/meta/recipes-devtools/python/python3-gpiod_1.5.4.bb b/meta/recipes-devtools/python/python3-gpiod_1.5.4.bb
> new file mode 100644
> index 0000000000..21f0f35cbb
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-gpiod_1.5.4.bb
> @@ -0,0 +1,12 @@
> +SUMMARY = "Python library for interacting with GPIO"
> +DESCRIPTION = "Python library for interacting with the linux GPIO \
> +character device. It is a pure Python library and has no dependencies on \
> +other packages."
> +HOMEPAGE = "https://github.com/hhk7734/python3-gpiod"
> +BUGTRACKER = "https://github.com/hhk7734/python3-gpiod/issues"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fc4e57275d8c245894e576844466f725"
> +
> +inherit pypi python_setuptools_build_meta
> +
> +SRC_URI[sha256sum] = "d8e4daa655dee75c33a49f5859b2e36c72385021c06c5552968294b1ad5c2dd0"
> 

I would highly recommend to use the newer version of gpiod.

 From the pypi package[1]

"""
Versions 1.5.4 and prior are the deprecated, unofficial, pure-Python 
bindings.
"""

To give a bit more feedback, the same gpiod PyPi package comes from two 
different git repos. Before (and including) v1.5.4, it comes from 
https://github.com/hhk7734/python3-gpiod. Any version after that comes 
from https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/.

The latter is maintained by one of the Linux kernel GPIO subsystem 
maintainer and the former has been abandoned as far as I remember.

c.f. https://github.com/hhk7734/python3-gpiod/issues/39 for more info on 
gpiod package in PyPi.

Cheers,
Quentin

[1] https://pypi.org/project/gpiod/

