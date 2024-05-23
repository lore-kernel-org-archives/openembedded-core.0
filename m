Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6855FC41513
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 13:49:11 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.108])
 by mx.groups.io with SMTP id smtpd.web11.17509.1716472143336155409
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 06:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=PUEWZ4dv;
 spf=pass (domain: cherry.de, ip: 40.107.104.108, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M7R/wjBMyq2en4PiBXclDL7yp3fqBvqiUoRmeN3A/Q32vRnJYKPffjeW6YKTHG7SJdUVnsdhbVGV1Juo1KijodruQRFG3Z7AgQtzoc66jA6J8zvAv6ySBwLIUZVoh+BusdID3sIwx/InBPK4Bsnq/9WG8YpOgmHxNzkIlA6JRA3BekeoWlXfNBL/JHeEqlwigHJEwQA4ESM2TRHhcvN7SmfSpDlovbFs2Uszg3f8K9V0QyaGA7Z6mAQvRstsOxEE9qh9xEJQBekiZjJD66b6tl9HaGfWPUhRbGo6L6atzhrCOeytHGd0XADL+xXSjYal50DOA+YOPR9wcorGrheVtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ygw7HgI1xxMSAexzUM+S9c4JMCZEye4FLzFs/jEDtuw=;
 b=RcJsL5i/90ROsJAShEx13GUq6Ne34BKLVH38td9VUiCrX26evLrLk1ZIM7H6d/EW6+MGPRQiKQej6305XQmAS1odG9j1otjChLukoPEKh628NIX/EfQWoVLLASsBVO/r7vMzVuSzyK2zHb3DvNI+RyD7xjZJUXV/9GSzIcw8s5HhhVteee2x7gZ1Awg7ut8HphthWyx1w/OMUH6Bh3dIH4p3QBWp87HiLaojj+lbvLvQMnuPcFa3VI5CJoPWFqnYtlRo+OnC3RPRZaetqcpu+H/bTGrsMbqWO5nU+ryDL+JJMvKj/iX6xTR8OMeEp0SOziRQMYFqltgDjuUpm36zrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ygw7HgI1xxMSAexzUM+S9c4JMCZEye4FLzFs/jEDtuw=;
 b=PUEWZ4dvcKweu3cWe2hCvXV8INbwSAjM7g1M8BdjStePUkKwl7gn7z4+seMKn3ZgTvQDIDkwq6wB8L0m0edwdr+puLZJyYYVtfNDgx21YeKH9MZRv/i7wlD79QnOZebKpip79UwISjeyYYrfMwmKINgo4AtxWZ1S3YXlenPl+UA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM0PR04MB6578.eurprd04.prod.outlook.com (2603:10a6:208:16e::11)
 by PAXPR04MB9350.eurprd04.prod.outlook.com (2603:10a6:102:2b7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Thu, 23 May
 2024 13:48:59 +0000
Received: from AM0PR04MB6578.eurprd04.prod.outlook.com
 ([fe80::b0f9:e7f8:2613:eefd]) by AM0PR04MB6578.eurprd04.prod.outlook.com
 ([fe80::b0f9:e7f8:2613:eefd%3]) with mapi id 15.20.7587.035; Thu, 23 May 2024
 13:48:59 +0000
Message-ID: <26ceaa97-266a-4a43-bfd0-306f29f65e8e@cherry.de>
Date: Thu, 23 May 2024 15:48:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [OE-core] [PATCH 1/2] image-bootfiles.bbclass: new class,
 copy boot files to /boot on rfs
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: marcus.folkesson@gmail.com, openembedded-core@lists.openembedded.org,
 docs@lists.yoctoproject.org
References: <20240521173343.2954628-1-marcus.folkesson@gmail.com>
 <66c6fe23-dbdf-40a5-ad5b-393b4d1239f9@cherry.de>
 <CANNYZj9TnoFbUkKnyvh=WgbTBp13rf6+0jrtGJiNv9A==bNYiQ@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CANNYZj9TnoFbUkKnyvh=WgbTBp13rf6+0jrtGJiNv9A==bNYiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0004.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::15) To AM0PR04MB6578.eurprd04.prod.outlook.com
 (2603:10a6:208:16e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6578:EE_|PAXPR04MB9350:EE_
X-MS-Office365-Filtering-Correlation-Id: e645708d-0efc-45ca-66bd-08dc7b2f1910
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZSsyVkZCWHAwVmp5eUN3NFdZR0hoVU1xaEpkWm14SjN0WFRmL2pPOERYeDVU?=
 =?utf-8?B?dzRTZHYvdWVzSTR1RFhNNmIyRXp0bVlwaFh5Z1I5QTJ0aEFtd1FLYkg2WWdT?=
 =?utf-8?B?a2FMY3c0YlE5S0pGNzZ1SUVESzM0bDY1SWQ2cXkxcFJ2OFlzZ2k5TXFuOVV2?=
 =?utf-8?B?aUoyOE1HYWgydENudWNlUzlCOUUxZnZjSHUzbGxpWHd1V0FQTkg4ajMwb0JH?=
 =?utf-8?B?V2x0TnViMFRqTDAzTDlBRk1xSlcySDErcndtYmFoQXVteE14MGFjYzZ2K0kx?=
 =?utf-8?B?b1U4anduQXdjeXpsWmVSbTRua1BVZGhUMUxzVFdnWWJjcDh6KzFvVUZ1eExx?=
 =?utf-8?B?SmgzcnlYOVhWUnhLL2I0SzVlYnJJQ3dUQ1JSV0l2eENnV0dnSzhTTlM3NEd1?=
 =?utf-8?B?bnJNcVpwbDBaSXdVQkVwZm9TSnBtS2VqREtrU3E5aUVpVnYveENib29DWmlC?=
 =?utf-8?B?WGZOOW5WM1FCdWtrTHA5WERjTUFRZzU5MFUxR2tXUEV4MHl5WStiVTQ3Znds?=
 =?utf-8?B?SnBDVzRwY01KcHZjQnc2QnNiYjBGK0g0Y2VxZDJkQ2tYbi9xYThKdzZzejQv?=
 =?utf-8?B?OFNkYWZjbG1KZXRJRDMvYktic1ppZzdwNzh6UFQ4a29kN0pSTVl1ancxZi8r?=
 =?utf-8?B?Y0pVajg3UzFlUGUzY2JZNG1HR0VTQmpXV21TUUwwbHo1VHlnMDZpYWZUSjJ2?=
 =?utf-8?B?NWppcVp4V0J6TExsNWNZMlU2YzNoNFpPaVpySEFyOUdCNUNOU2E1c1FaeG1J?=
 =?utf-8?B?ZGFFV0pDNXZ4R0pHUmVKVFRNMk5kUkZ2a241WFpUcHplUTduTDhmQTB2Rkhv?=
 =?utf-8?B?ckFQZWcxREhieFZmODhqK3lBRmsxS3dzaExUNG9XQ05MVndJYzA1RUR1ZnVy?=
 =?utf-8?B?c2N4eklnVnJZZG56VlV6RzdDcjhOcmZ6OFlPbVJjSE5mOHFCVTI3NjBUUFRz?=
 =?utf-8?B?d0thN3dTaGtSaWFtNnVRTnJTU1JlT2FpaDc0aklXSURjOHJxcGwzTXMrbWNU?=
 =?utf-8?B?ZEdFbTkxY0ViTm1HK0pjQTdyY3YyT25XakV3eGp0N28zYitWajVOeFliQ0hm?=
 =?utf-8?B?YjE2SFRRMmJ6UWZaTGtDdzR6ZWJLM0ROYWNvd1N1eHJISnVaVDlGOGF1TjRr?=
 =?utf-8?B?VStnM0VxNlFYa0p2a2Q5R2tBck9kM1VWamhyZTNIUjEyTlVTRTlGalBBREdJ?=
 =?utf-8?B?VGl5N09FL2JROEFPSC8wZjMvaU1hQy9OOG5KYzhFK2ZrVlZEZXpkVzJIekhM?=
 =?utf-8?B?VndMNDFvekxDaGN6ckIrZGRmcDZOS2VNRXlOR0dKdS9lbUxyTEVSOFUzMWtI?=
 =?utf-8?B?TXdhemxuRnQrVEVkQjZHTllzMXJWb2l3eUNDeFBBUnYzaDMrODRuWEJtdTJq?=
 =?utf-8?B?VzlBWEhrQk0yVDV0ZEpJS3BZRHROeHBiNTRNTnFHRzNaU2V0bWF1eXIzVGVz?=
 =?utf-8?B?MHdMNDFJRE1pd0VoRmJrNHJJUVp3VlBENWV0T3B5SXdNdC9LZGkxQm83cTNh?=
 =?utf-8?B?M0hTaTY1RTRXT1RSY2ljcXJmSitMYWRXdXBVL0xmcExacmVsTkZWanI1SXd5?=
 =?utf-8?B?bVNyMUVLYTVjenVycUJOajlXc1piWjFxOGp1d3JMS2pYeDY0Tm12WWkvY245?=
 =?utf-8?B?NW9MVEowTVMzbVRNdFc5cTQwYXRDSUpaY1BrVmkrSEQ3b2xhK3BHS3Ivd28w?=
 =?utf-8?B?Vlkzdk8wRytwNWVDbnI5NVRIZkd4dlJTQUVKNEgxdDJCOE5VNys0TzdBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6578.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YkpsYTgzQnh2dGpFNzhSbDhlbHdoazhqVmxpcEphYlcrSVdIYWFMa0ZXWkFt?=
 =?utf-8?B?MU1MblJkbEdxL2d1QjBObWtqeExDWnpCVjI0YmI1UURYZ25HMlVoeDNIS1Zr?=
 =?utf-8?B?MjFZSHdGSXMrb1VSZUFjNVdxaXJMWEFWTFBETXFkVHF5RXZsTTZVeU91aHc0?=
 =?utf-8?B?bmlUc1JWRVlsQ20xLzlJVVlydVl4MStuOEdJd2FqSjFyS1c1SHIwNGhaVzdj?=
 =?utf-8?B?RG53ZGE1d21COWtVUFVaaGgzeWNURjRFeDJxTzlOSGZKQjQxWnROcnJjSlRs?=
 =?utf-8?B?b0dEYXRZV2E1V0FPSy9tckpUbFdSU1RaMmNzTUxNeGo0dkw3SytkbGJaUDEr?=
 =?utf-8?B?eHpkR0dCWUMwZEtDUWRxTDd6ZnRDNDFaaWZWUThpV1N0QmUrZUkxK3RxVkI2?=
 =?utf-8?B?dGp1ekVXNXpveTRiWGIza1hLb3V6WlQzL28zdWtYbGhvVjY0SVRYbXk0YUNV?=
 =?utf-8?B?VDFpN2Z6MElwQkJwTXhiMVh0SU1EVkJIOWR4UVNESjRqNTZxSUVRMFVkT3FB?=
 =?utf-8?B?QWJ2c21iUUNhWVJDWnBxbW9yd25QYmJac04vNUE0NXUya3oySFNXRUREN2pi?=
 =?utf-8?B?NXVhbURDV1loRVMvdEhLbnVCenhVdDZpMUE0Z0VpQjVvTHByZ2h6U0U2QVNx?=
 =?utf-8?B?M3lkOEFlc3ZiSjVRTTI0VEMxT3FVdXk3ajdHZkNuTUV6MjNrTWlRUk9abS8w?=
 =?utf-8?B?Tk15YXUxTWwxQkZ6WEY1SnE0NWgrUFp1VEh4dGlxZExPNFdFd29BVXlZend6?=
 =?utf-8?B?bE5IaS9NZG1IdDNVeXYxSEVEb3UzcE1kQ2pIUnUrM0xNUk9XUGdPL2FkdE54?=
 =?utf-8?B?a1VycXdPUy90bU5hbENZUWJldTFtWi9PbDFWUGJIczJ0S3laQUJGR3ZxVHow?=
 =?utf-8?B?Um5kMXJOd25MM0htVy9SSEtoMmNjR3ZDN1dKVlFJWkROcDkwUEtMeHZVVXV2?=
 =?utf-8?B?YTJiZW5mcHBBeDdoM0ZyejZHcDRoNC9KK0U4Qm1pMEVZdW9YdEYyaXJqdUQx?=
 =?utf-8?B?dndvUFNkcnZiRVprRFVrWnQxK1pSZkp4b1JDclBqd29pdE9BdkVNUTRnVURu?=
 =?utf-8?B?dmZ1UWVBM202UytyN2RSUkV1K1JydE9iNGRHRHRPbkwxdlFXR29LbXErbERT?=
 =?utf-8?B?Q2p6L0hqTk5ZckhlMVdVM1k4aDJYVmtZcHZvY29lNXpnNFBwN3QwcXBrY1kv?=
 =?utf-8?B?aDB5UEFyU3VDYkZFZmVNL3NEaWxuMU1UV3g2YTdubjRoYTlnbmQ5NEpyeGdO?=
 =?utf-8?B?bDFnUkN0aTlZWURzaStxNm9vbTJBcjY5RnU4eElKUmxhVmZtT2Q0RlYyMWcx?=
 =?utf-8?B?eklNY0xQbkh6Qjh0YTI1UHZDcFV0TTlDNWNYUWJ2TmkyNVdvVUJoU282ZlpE?=
 =?utf-8?B?cjZhK25pOWgrdndIQVB0dzZGQWJXQ0sycnc2OGVzdC9ORWhjd1R4WHhxbVNN?=
 =?utf-8?B?SHBQR0xZMjRYTWQ3VWdVbXY1MksxY0piUDdpS3hOSEJ5TG82dUUvK280SkE1?=
 =?utf-8?B?QW80Ty9jSVFnRUFaUE5QYlZtbjdEOUVNSXc5eWx4YTBhU0lqaWttcjBscDZk?=
 =?utf-8?B?V3pRS1ZLU3BoNGZhZTFSSTdPUWdvMlViRzhHdDVOalRFODlTcU9JbzZmSnBm?=
 =?utf-8?B?WU16ZG10Vjk1U3BJSzlhVWhNMXc5VEhOUm5yU3dpVGtpL3FMbk1hNnlQYmR4?=
 =?utf-8?B?bVNhUWdtWG1aalVLb0pMcTBVMmxJcy9lZldrMHZaOExXRTZPbHVoWFYyblpm?=
 =?utf-8?B?QTlxbUIybTVvd1V1Q2NOR1dYamoyVEVLQkFWc1U4VW5JL0lYM2RXM1o1RGJN?=
 =?utf-8?B?NGhWY3JNUElONm1aS0RHNThKM1FyRXd3Y0NlN3VYbE43ZHRHLzJNUGh4SXFX?=
 =?utf-8?B?eVE2UXhtQklhLzJGQTdISllPVStZMUxOWHpQakZUeDQwWm01ZVJPNklSeEFE?=
 =?utf-8?B?Z0NKTWczKzNGQVllVit6TSttd09jY1h0eHdqelcvcUhSZmVueTB4TjMyRHd4?=
 =?utf-8?B?ZEwzR09uZ1poYms2VW5HUjZFa0paZDFXY29td3pFOGR1eTZnWEJRSlM1MXA3?=
 =?utf-8?B?ZVkveFpCcUMzUmhFV2xEemVjL3IyTzl5amI0bGdlRnN0MGo3WGpRQ2tXbUp1?=
 =?utf-8?B?QjRzY3Z1NXJnYXpucUJjOUZkeGdhcTRoWnltSVNVODQrbmc1ZHNwVkJMa1Mr?=
 =?utf-8?Q?xqPjB4O73XSy8itjB7eKD+A=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e645708d-0efc-45ca-66bd-08dc7b2f1910
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6578.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 13:48:59.4827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wVCbhE7yiT6pAEe2f7081/uHJW0Sp46ZkcsOwJ1ZcZCz/09c0whxKsISdX7PUQ1Il8lKchgiOOQtdNHQExm9qwsu/JSTAVJmEkiGY5D6kAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9350
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 13:49:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199800

Hi Alex,

On 5/23/24 3:38 PM, Alexander Kanavin wrote:
> I also have to repeat what I said in docs@ list: why do we need a
> special mechanism for placing files into /boot? If /boot is not a
> special partition, then it's just a folder in / and can be populated
> from packages like any other folder.
> 

There's renaming logic here. Which provides much more flexibility than a 
package would. You could have a different name for each image recipe for 
example, instead of having to use a distro, packageconfig, bbappend to 
modify it. Is it a valid use-case we want to support /me shrugs, be we 
already do support it in wic, so maybe that ship has sailed already.

Cheers,
Quentin

