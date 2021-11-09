Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15EE7C433F5
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 08:41:15 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.92.73.64])
 by mx.groups.io with SMTP id smtpd.web11.9470.1636447273473297432
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 00:41:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=ETNkDRWL;
 spf=pass (domain: outlook.com, ip: 40.92.73.64,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LcSAUr75oMy8jU+VEnywGCxlEsY3jndroYw0aJNLywQHq2X+jApSD3IMGBK6tbYq9pcsGbqgPgy0wnamVztN/vqDkOW1mj7Vi2MmERV6QbDAfArLwBUfQyPqOMUcptZf+hJu6zXNoQYJ4XrzcS4ZRTBUlv3QxfiYX9OUHigWp/l7/8tXgZReYSEeq5oDBEHatZQ7oCN1zlNGOEYPvXVQZl2uRw18xYowWMu5ZdBREKVwl/lD9oSBNRN7Fu1HDmA5+bTOg5Ar+aRLVK00TzpQd3uVUMVnkvnDEJZcR5TKDbcIDEhRNdSIfvyouoTCt9oAcv/7DxaduouSjHms0kh9xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9uOrUBKN7T9PjC56g0FKQghgAqSMJcBK44zWG3+KB0=;
 b=ndSvnJ/1JnT/hggyuYTB9t7y2PhoRL1Xmi7wZ+xPOP3EpQvOgPdgBlTnEdir1ROwtlaDqbK5bPjnQ3ogpixJRlti3Vp6QAlMzeNjd0Ua7tYlSpwx0Qg9HpVISVGpUpCnKJr/slCixvrNbwrGWr4hSeJu8eZkhquM2GQYFjctareJ3plxp9zqWCwiCKPv1VEFE2USdBRyYNbMVt0CiZgjBUWlLZewM3YCvaij39KMNnvW6gg22NLnpeilA91vLHHoHs/Yjwi8Uigcud/NYSPkPm6Y/jotJfKlgqGxtVDMsnmhUN3dyYI/yNTlwTiLxu3egStb9bE4fGG7qViCqzY75g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z9uOrUBKN7T9PjC56g0FKQghgAqSMJcBK44zWG3+KB0=;
 b=ETNkDRWLPXOmf/o/oq1kPFPTnChb8XfCUr+PyINyGEyuG+W+dxuDzmf1PP/cf0Kf90CoNJ9oKXUY+RAwoE06t/HCChl+cBIHVpDhvhu1UQQAlRGopU0Cx9qVtibr5HUdrjW3A59potKHDRHLAPnbJdXIZz4cRdaXwil/wQ6rhiM3PXFK/CLJfdbX0s0rVUYuf2c2ZhTguEFCFm9djxUjvzpPcLniWTROE93lBO/xwobl5uTKkhmF0JriHBD8sn+v8Hoa/jGJP5XmvYhc4MpIKOc7R7ciy/tNbaFw0LHOEtypuT60f+n2An6mqOUTyM3Q6C/oZqiYQLPHLJWZLB/UqQ==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM4PR0902MB1890.eurprd09.prod.outlook.com (2603:10a6:200:93::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Tue, 9 Nov
 2021 08:41:10 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710%4]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 08:41:10 +0000
Subject: Re: [OE-core] [PATCH 1/1] bitbake.conf: Set ZSTD_THREADS to half of
 cpu number
To: Robert Yang <liezhi.yang@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <cover.1636447679.git.liezhi.yang@windriver.com>
 <5e10cddcd2697c7b762c8c8d245bb76f8666aefc.1636447679.git.liezhi.yang@windriver.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB46429C45C98E52EAF652EBF0A8929@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Tue, 9 Nov 2021 09:41:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: 
 <5e10cddcd2697c7b762c8c8d245bb76f8666aefc.1636447679.git.liezhi.yang@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [pwDh9+2CDcywv3RqdD+qcutTfpkhoxrkCUL5fvAN5eWa7shNoqaBFSYkib0pKrHK]
X-ClientProxiedBy: AM0PR08CA0025.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::38) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <a13718d3-7954-c166-7d7c-b9c08a1fc363@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:3103:205c:200:bed3:df7f:f488:16a2]
 (2a02:3103:205c:200:bed3:df7f:f488:16a2) by
 AM0PR08CA0025.eurprd08.prod.outlook.com (2603:10a6:208:d2::38) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Tue, 9 Nov 2021 08:41:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e968298-2327-4586-54d1-08d9a35cae29
X-MS-TrafficTypeDiagnostic: AM4PR0902MB1890:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0k5wktiVXj3I5wPxvTP3+Vyw+S8fntQNA+l3JuBkO6LUEpejEhQ3oPcP/Xa4iv9pg2aA9pcBszY1mO+EFVJJ00IZhcqEZeZsNvAVOXy8diGR6La1XNyxZsmMH+8MlARe1/Giv7Q8cm3WsAQxxkOZFHGLHFvFVEwCByQQXhaMjNr3SJoMMcoltYUAqQF+zPN5fYdBh3JbDI/8a7gAn35iSNRmnwqTnqcOoaJ4eEdzpn/m7Zoad95Cb1HXrG95JvqFZ0Wf/KsruhSeFAt3X61KLsD3r7TJ2XW45ynkBnCxr+7TlMn0XO4SH/r9eJHrZHt9QPNNV6DGP/ud55lEQ5QxMsvwDq38jj4pxxZ/Rtgn1s5bWQBZP+etPU8q70DgwyPqLK0m9+AWt2Vnibhxh+2enXFmVJg+H55JEWuiFqit3tHI3BPEuI7akTZC+KGtu201njWIexrVLjfmpuTErsu+tPRj5YWZJFZtArAeTI3wm7Tcz6zKKY9LjCmJ9bTQGlIEZ1MdicVQtpJ7Ap1VkXhZFIhtUrKN4zsuMYd/pUoPsFpCZby2gqUFj9+Nw0WTpqjagajkuaWtdIyoYpVHTeb/i7Eyme4MhtEBtrc6EAjLr1H26ISLFjOW6pAWa/td8xzp
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	eh0CBSftvD4mUwSGdkV9KGb41gPLW6O4+SrNuPBTNQYBUYDVd1+ZO7wfLDVhOyTTXP0fPfYK5gKeWcXm7FvLFQUX03JOgDNFfJAmNBGMD4c9RQXYuS9ZZ2d+wDN0lxEDPqUm4BrOBb3I3rMNJibhqw9kZofi0xQjehhitEBiYFQgTVhXmTGrAYXPYsxbTUn0nGSG9qiw8CMvBXd3ux12+aF90vip2BmsY/oGXo2lxhGdUE1LLno1+4T0u+D1ja+LiG5EbZ+jNmVv0qS206MpcmHM6tGltzWWVaNjPu72IobPSd6amEUAf61O4UNkO2+HLdz98uFrgbWhlefKHB/p9PAktbFsuFe3vOWJYTMLdjHWt9puN5prjY6FW2Fx5nc7PXfJUbYDUOn/SJtfio0zjn42i/+uqBr1IXeBINYjuEa36n9ta91CbyRQju8u9rNiMmZBrTgNFBUFg8vDkIQevDpE4463xPU0rW9INgdcdsuhn5ZKu/87sVcZ8hC+u38MBaCeUvcnl3e8fQSt/5cWiU/0smEfokasTeZ1krGONxfIubLbEP4J/hwiMxz3dckteYcX6NvktQGKREjbOVm5/j1gIJYsLSd0H5LUioYX2T762cmbua2jhcSseSCaN88L4jd1W6NXDUWsUcY6JY8pPwkGEpmIfd3Vq4I1zf9vndiUCbLW9V6CmeAc0uiK9Kfw3zgKZSXTtD2bVUnYlLENAwAbhIoFRRc9qTlY64pAweAg9LsuVJmXOftunopb/Poo8uPs61KsC4GM3wkFTXrv9w==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4e968298-2327-4586-54d1-08d9a35cae29
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 08:41:10.7921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0902MB1890
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 08:41:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158001



On 09.11.21 09:48, Robert Yang wrote:
> The original value is very easy to cause do_packge error when cpu number is
> larger, for example, 128 cores and 512G mem:
> 
> error: create archive failed: cpio: write failed - Cannot allocate memory"
> 
> Set the ZSTD_THREADS to half of the CPU number can avoid the error in my
> testing.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/conf/bitbake.conf | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 71c1e52ad6..46ebf5113f 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -833,7 +833,7 @@ XZ_DEFAULTS ?= "--memlimit=${XZ_MEMLIMIT} --threads=${XZ_THREADS}"
>   XZ_DEFAULTS[vardepsexclude] += "XZ_MEMLIMIT XZ_THREADS"
>   
>   # Default parallelism for zstd
> -ZSTD_THREADS ?= "${@oe.utils.cpu_count(at_least=2)}"
> +ZSTD_THREADS ?= "${@int(oe.utils.cpu_count(at_least=4)/2)}"

Then why not just limit it for the large setups you are referring to in 
the example, for instance like

ZSTD_THREADS ?= "${@min(int(oe.utils.cpu_count(at_least=4)), <insert a 
sane value of your choice>)}"

BTW this can be also done in your local.conf - as Alex already said, 
there is simply no reason to make it slower for everyone, while also 
half the threads of a 128 core machine could be a trouble some setup.

Last time I had this issue (with XZ back then) I used 
"${@min(int(oe.utils.cpu_count(at_least=4)), 20}"

>   ZSTD_THREADS[vardepvalue] = "1"
>   
>   # Limit the number of threads that OpenMP libraries will use. Otherwise they
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157998): https://lists.openembedded.org/g/openembedded-core/message/157998
> Mute This Topic: https://lists.openembedded.org/mt/86926962/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

