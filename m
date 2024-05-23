Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 499E0C25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 13:26:51 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.115])
 by mx.groups.io with SMTP id smtpd.web10.15402.1716470802775411011
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 06:26:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=AlzdaB8X;
 spf=pass (domain: cherry.de, ip: 40.107.104.115, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PbuR9mUKFFhYOUtr4EbB/s73ZcMnKXzfGbgu8B3PZcDLkITRSEkZZKoJNskTAC/QBnXyH+pHf9a5a8EvQUueAyAiOPa9wytKKSCdpheH+ZAfZ54WFc7NXm508pk8fgSgc95gBS7CLuvBqgdKFXx7fX7q3vwKBlr6X/uL+op9lA2uLtG6VDtN0gTNzMz7zj9PDMQBb5o6RvWj87lcaMMFTa2nQQb/AuX8MDs75UptTbLB8l5jL03HLLvu0MghmRmxM34TbxHKMVGgpmYiur5+Queyq3UnKaOo9BJTaAJxXnoS27mtg77Bc+u4nDZ2BdqSXgz4mxKKooLHm7OR9O3kGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MLVDeHW+jnOgcnP9FDcPCM9DOV+Ha+Yq0RPg2iFV7zg=;
 b=IsYAk3nF4KD9KEfbh4Cb4O13e6pjt+JBQcxSVxlhMuY2x0c8yI3tMqrH1dDOB2c+w+yqCSxMD08TwRHLufP6+TO1rcQjjjtOQsvBNO60wCZ0m2WXVzC4b1c7MP7RprQzOk0pPVlHKAuwPgcf6prHwdPkJYBlJKUZn0/MQocpbc8/PoWOx4PVlqBl2Js6tXE6I+nOplTNFpWrbbUGfl9MKtquHTIMPxeTyZrf/3726fMuYw3B9tEgDHx0vmrSQxnYv+NlZQ7L1IOKoNODV4FIDGqXz9jjuLgFZjMJqAxS1aPJMvcqjc+XPeDyIgoA3skjp67dbEtHOp+9k3IyjEiypQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MLVDeHW+jnOgcnP9FDcPCM9DOV+Ha+Yq0RPg2iFV7zg=;
 b=AlzdaB8XGVKYCHCE/dEyb+XNnDwyBhU5Ss+QO8wXvZ8RWhTN8TS5rX4oHiilesnk03bxfM1KHxmbao66H+lrygw1H99nT63VKvKk6H38O/AiByJ/K/WVwpYCsctwJyDo/figFDHhukVitBA4sgMdc6QnTyiimeQx/9tmNWYsEJ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM0PR04MB6578.eurprd04.prod.outlook.com (2603:10a6:208:16e::11)
 by DUZPR04MB9968.eurprd04.prod.outlook.com (2603:10a6:10:4d8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Thu, 23 May
 2024 13:26:39 +0000
Received: from AM0PR04MB6578.eurprd04.prod.outlook.com
 ([fe80::b0f9:e7f8:2613:eefd]) by AM0PR04MB6578.eurprd04.prod.outlook.com
 ([fe80::b0f9:e7f8:2613:eefd%3]) with mapi id 15.20.7587.035; Thu, 23 May 2024
 13:26:39 +0000
Message-ID: <66c6fe23-dbdf-40a5-ad5b-393b4d1239f9@cherry.de>
Date: Thu, 23 May 2024 15:26:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] image-bootfiles.bbclass: new class, copy
 boot files to /boot on rfs
To: marcus.folkesson@gmail.com, openembedded-core@lists.openembedded.org,
 docs@lists.yoctoproject.org
References: <20240521173343.2954628-1-marcus.folkesson@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240521173343.2954628-1-marcus.folkesson@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0013.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::16) To AM0PR04MB6578.eurprd04.prod.outlook.com
 (2603:10a6:208:16e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6578:EE_|DUZPR04MB9968:EE_
X-MS-Office365-Filtering-Correlation-Id: 39434bf1-fc7a-4197-1004-08dc7b2bfa17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MkFoN2p4UDVhZGJqT0ovSHJFZklDWUNtcVkrdjV5OVlidjE0T1pHOXhKTC9Z?=
 =?utf-8?B?WWN1RkYweDI3S25RcE15S2pyc1ZQU2FObWZjbkhhRUs2OGxXSlgwTUtMWi9a?=
 =?utf-8?B?d2ZvQXg5ZDdRb1dDd1l3STVYMStJb2U3SUIwOThnelBUajBDOTZ6OVRDajhV?=
 =?utf-8?B?cTR4RUhOVUw0M3czMHBLRVE0azMrU1dUdWkrWncxd2NpNC9YSWUwRlpyNjdU?=
 =?utf-8?B?d1BTMFY5b3lVZWlPZVlYK0VnMHcraDlqRVZtdnpTRnpRZlIvRkNlcW1ybTln?=
 =?utf-8?B?ZTZwaHdIakVQSFVxV2IxaldFSXJNM1ZGSHI1S2QzR21xVDJPRGdiMXlPZzZW?=
 =?utf-8?B?cURmdUJUTjZuT0ZzSG5rdXBrM0FLMWo1ZTRQSEdCalp1a2Z1anBPSVMzRVMw?=
 =?utf-8?B?b3BoYjd4MTNhaGlyVjBqTjUvMExNZWJaclhSSTJ5VG82d2FYZnVTNDJGckxv?=
 =?utf-8?B?Q3RGcTZNb2RKSkpZd2Y3UllvTVE5MXJWZS9LU0xYRENlRU8wR3hFWnI1elRa?=
 =?utf-8?B?RHE3U1dyYTZvVzNNVXFsaGxBRWtveEtNWU5TSVhHZjIzSUpTVkJ5WGFveS9i?=
 =?utf-8?B?RnBPd2F0aUxXUDIrdUQxYWhrTU5YNG95dkZZQ3JsRjY3ODlsQzNtaUZTYllC?=
 =?utf-8?B?ZGgrdlVmbEVBOTVMblJTbGgvT0lTSDNxZ1h3b2NsbU5ocUcvR0JzbFFIT3Vm?=
 =?utf-8?B?YXB5MExCclp5a09Od24rTEF4SWo5aUdoUFJ6SmlYTVBrSjl1WkNJTjBXRTJl?=
 =?utf-8?B?S1ZOSDQ5elJBN2xtMzFndURtditHQ1YrTE1WbmE5M2N2M3BlRkdnODdVMHl5?=
 =?utf-8?B?WXFHVU9RcmovbjNSM0swbGRrOVJvL3dBZkI1ejlSazlvalRLMjlJUEN0YkJN?=
 =?utf-8?B?UWdEQkpMRXRzckNNRHdnMmY4YzVMbTFhUllLT05pTGhsYzNMMno5YW1OaUNt?=
 =?utf-8?B?QnJaQ1dBcUZmQmo1TXF5ZmZueldmaGJEYUc0RzNGTURRRFhreS84QWhQSmw2?=
 =?utf-8?B?NmI0YitORWVVWGhXOXViRGgwMHpjTE9EVDhRenZxcXovU1dGeDViZzFNY0Vy?=
 =?utf-8?B?WFlRSWQ4TFhCOFViL0I4UzFvOWZYWG01OVI0V0tONHlNbVVzdGZ0MllPWTFr?=
 =?utf-8?B?ZDVvQno0aGZUUHc1cXdadFY4bFA4RE1nN203QmtZaVZlRFBoSWlkSktCNlZn?=
 =?utf-8?B?c1hBMkJpaE9KWW1KQnovVDRjRERLbEdNV0RrbjdpZ2dqMjdMdU1NQXJKNnAy?=
 =?utf-8?B?aWJCdWRjSjBwMTF4V2FhQVNxOFQ5dVMxQ3BpQTNrQ1ZDR2dFcVFUVTM1K20y?=
 =?utf-8?B?SldzWkpvWERGZUJrY2hraEtnb3l5azN6N2JuYzJGdVAycWQ1eUVaVEZ5WlJq?=
 =?utf-8?B?dWdLcEE3ekJZTzJCSTN0Wjdjb0R6SWlIa3F0ckFRaGNpdlpiY2hIdzJJRkFF?=
 =?utf-8?B?Ymo1Rm5FTElFRHdnTTlMZUpvRHdINTd6LzdPUndtbmE3cWhjSEZQVlYrVDdI?=
 =?utf-8?B?Vko5YmhFNjhzV1g1WjI0YVV0VFJsWFNWYWpvUmdsNzl2dVFXRWJOMTJvM09Z?=
 =?utf-8?B?bmtzZXM5aW45SWRWRW1JbEVmaTE3VWN6MXJRa2pBalo1UjdtSDNWbzVxWnA5?=
 =?utf-8?B?VUloQ3A0WFdMR3p2NHRUcjUzeXlEZWpNQTF1RzVPcW1Wa0lHbkptREw1RFgw?=
 =?utf-8?B?Sm96S0VMVzh0L21YWXJEeHdibnBKdXowUDc4aVRrVmNoZnpmcU9PSFZBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6578.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?azM3VzF5UXNocDRtenBld2xBcjlpdkIxeTltZW8zVW1BY1hPUUFIR0FYOVl2?=
 =?utf-8?B?YWFORVQ4Y0FBVHZ4QzNMdHNMTlFCUCtLZmdFS3RPcmR2eldaelRueExINTMx?=
 =?utf-8?B?dWFSN3FHYWRzdThENmRIUGxuRUhTZjZ1c2dXQkJTWTUxWTlGZTNVVVlBdm92?=
 =?utf-8?B?c0hTWW1ZTHpGaU9jenNCa3ZjV25PU0hLcUdlb3BUdHMrSXpTV0lyUHlzUVR2?=
 =?utf-8?B?aFNJL0c0MHFkZkM2Mk9HMU51KzNNQjFxM0RHVU5EUExsaDJmVnlOcURobUlX?=
 =?utf-8?B?R0RHNDJ2b0JJNUhwd3VHM3hORk5pcUVHbGRqUlNPQXRDRU1QTXJ3R1dGNEor?=
 =?utf-8?B?dVAwWmtoTFRzVlA2RjFwUXYvekxWeG83NUxMcm5VRWdDbE04L0pGWTNIK2Vs?=
 =?utf-8?B?REw2Wm5oRktuR1padnlweDBnZDk0U0dETmc5WmRIcWFCMzFmZFRTaUJncHV1?=
 =?utf-8?B?eGtRWVhCZVZmRUkxWS8vc2lBNGZMQms3azFPWTJsYVc1d1lmV2FiSmtuaTRP?=
 =?utf-8?B?Q2d1enU0WWFuNFJVZ1F6RWlkd3ZBeHBEMWxiaUhtYW1qajB3MlM4V0dxNm41?=
 =?utf-8?B?WEZDSDhLekMrOTYrRC9raVEzOE9ZeUxPa3lxVFgvRWlCaHNXanhEdXl1MXZu?=
 =?utf-8?B?WXpaZytrWk1RY3RleFM2NWNTajBncnRGNEx5OElOeWl1K1h2NUc4eDVPUVMr?=
 =?utf-8?B?WWM5blI5eFlhUnpjWThtY3VHVmR2dS9UdmliSTF2dE9rWVUyb2YzV2VFWDU0?=
 =?utf-8?B?MGdTd3ZtV0cxSnFPdy85aVVmaDdaT3g2amVIYTFDemFDdmFhYzZhNEdhVkVV?=
 =?utf-8?B?UlRqT0JhYTM0dU5LRzJYZ0NqOGtLWUs1dlJIK21FZWZaV3dSOUJzMGJyVUVh?=
 =?utf-8?B?RnVZbHlZYzJYMzk4em1IdTJnaTlNSnlQNFg2aEg2N3JDd2tJeTFQaExPVHFC?=
 =?utf-8?B?VklWb1B3ZHoySFMxZi9RcDNnSnUrSmNoUmtMejF2QUdJTWdjSVp6WjFLRXdt?=
 =?utf-8?B?Y2RXWWJSSXRFV0FoQ1ZNWUxhdlJDbDNZL1RjRzA5blppK1B0Y0NlUGxZenVT?=
 =?utf-8?B?Um9jQ016WU1HQ2l6UzViZU5Id3lpSW4wek5Gd3RCbmRmZlFHd3UzZFdKVXF6?=
 =?utf-8?B?TDJGbEpZZXd0emhUZE45UW5UcHJyMm1NeEsyUHo0cUN1NGpMR2QyQXppdnR4?=
 =?utf-8?B?ektMU0JUaEM5ZG9GV3NFcFlwOGMwbHVVaVIrdzZ4RmtXT2diNTNxVDZhYVRY?=
 =?utf-8?B?SXowTm41OU5hYXRaZEtpL1FOclVUVFFYTVNEVE42bkJ6dEttQ3cya0Q2T00w?=
 =?utf-8?B?d1VIWGRzbElmckdycGtZNnpVbVBSVVFjNUJnUk5HSTZxTDBLTmMxZ1REZVNL?=
 =?utf-8?B?QnpoN2lRMmFOOFZQdkRJUTkzeERudUVSb2UrSHhFSzlpbmRLckQ3MzlQaGxG?=
 =?utf-8?B?VG5iaFVzVmJTYTZiQXhVaURDZ0JHdnJHTnZJVVUvbGtHTmx4MC9lRUI1eDk4?=
 =?utf-8?B?RlIyU0lwcEpJQVN4RzJKKzA0aW9JbFdIRDJWZDZTbzJ3TnlJZEp1M2ZVeWpS?=
 =?utf-8?B?RXdyS1RKZllFdG5nY0VPZ1ZCTmNTWkxJM1BkZVpXM0tpUmpkclhQd3NUc2lt?=
 =?utf-8?B?QUhxT0hIWVJ6WEdDYlNWYldtb1ZFU0NGVlZFaEdpRS9FK01lTXRvL21ZVFM0?=
 =?utf-8?B?Yzdza3JjZ0F5TnV6RzBlSWNKQVRjd3RzMW1ORkp4Qk01dVB6SXpXZUVvcVQ1?=
 =?utf-8?B?dWVKTVRZeFRRSVFzQ1RHSFJVM1RyK3VyN2NpZ3AvUlhJTlE0cEY0S292cUEw?=
 =?utf-8?B?N3E3U1VITEdubTd1ZVpqUlhpcmhkcXhBbVhhcVJVMmJ4NlZBKzFmSjlIZ0Z4?=
 =?utf-8?B?ek43VzlyZy9QNDlOOG14OFRsU29xMXhqVTZiZ0FYRUJyMHNyeUlScDBFQjZ0?=
 =?utf-8?B?S0VkcXo0eFpveUZlL1ByZ095SlpWaGEvb1h4TCtIblEvRE8rWlJWWFFEYXMy?=
 =?utf-8?B?RFBHdHhRbGRkZHVXcFVQRmJCMzdrRDdBRFVINHJYWHlxb0hvSVJnemVJUy92?=
 =?utf-8?B?TFY5WFJiSmNPU0RlS2RzaHlhdHlDakRBeWhaVHhjUnBVS0VGT1pVaE9CaHB5?=
 =?utf-8?B?MUoveFVZcGwvR1FOQ2U1N0ZTUEFBQVMvWFE5Yis2QVdIWEZnNEp4ekUyS3dY?=
 =?utf-8?Q?m9RdQDwwHGnpvBwDzNBdKYM=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 39434bf1-fc7a-4197-1004-08dc7b2bfa17
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6578.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 13:26:39.0392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0vgf34ZfpuY9bNqnqeR5f9mrfwjryDkdy6kJJf1tZ77DJzeVakru/6zj3I2owN+/wixuRvU10eMrpxsPhB0ufCX+/GBm1yUIyQG+0WKDxJc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9968
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 13:26:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199793

Hi Markus,

On 5/21/24 7:33 PM, Marcus Folkesson via lists.openembedded.org wrote:
> [You don't often get email from marcus.folkesson=gmail.com@lists.openembedded.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> image-bootfiles class copy files listed IMAGE_BOOT_FILES
> to the /boot directory of the root filesystem.
> 
> This is useful when there is no explicit boot partition but all boot
> files should instead reside inside the root filesystem.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>   meta/classes/image-bootfiles.bbclass | 69 ++++++++++++++++++++++++++++
>   1 file changed, 69 insertions(+)
>   create mode 100644 meta/classes/image-bootfiles.bbclass
> 
> diff --git a/meta/classes/image-bootfiles.bbclass b/meta/classes/image-bootfiles.bbclass
> new file mode 100644
> index 0000000000..850e14e4bb
> --- /dev/null
> +++ b/meta/classes/image-bootfiles.bbclass
> @@ -0,0 +1,69 @@
> +#
> +# Writes IMAGE_BOOT_FILES to the /boot directory
> +#
> +# Copyright (C) 2024 Marcus Folkesson
> +# Author: Marcus Folkesson <marcus.folkesson@gmail.com>
> +#
> +# Licensed under the MIT license, see COPYING.MIT for details
> +# Inspired of bootimg-partition.py
> +#
> +# Usage: add INHERIT += "image-bootfiles" to your conf file
> +#

Since it's in meta/classes, I assume we can also inherit image-bootfiles 
in an image recipe?

> +
> +def bootfiles_populate(d):
> +    import re
> +    from glob import glob
> +    import shutil
> +
> +    boot_files = d.getVar("IMAGE_BOOT_FILES")
> +    deploy_image_dir = d.getVar("DEPLOY_DIR_IMAGE")
> +    boot_dir = d.getVar("IMAGE_ROOTFS") + "/boot"
> +    install_files = []
> +
> +    if boot_files is None:
> +        return
> +
> +    # list of tuples (src_name, dst_name)
> +    deploy_files = []
> +    for src_entry in re.findall(r'[\w;\-\./\*]+', boot_files):

Isn't this a more complex boot_files.split()? What do we gain from using 
this regex? If we have malformed IMAGE_BOOT_FILES, this would actually 
introduce some logic error:

 >>> s="plop\\plip;plep plop;plap"
 >>> re.findall(r'[\w;\-\./\*]+', s)
['plop', 'plip;plep', 'plop;plap']

I'm pretty sure we don't want that. Instead, I would suggest to use 
split() and iterate over that, split(';'), check for each if there's 1 
or 2 entries, add one if it's one.

> +        if ';' in src_entry:
> +            dst_entry = tuple(src_entry.split(';'))
> +            if not dst_entry[0] or not dst_entry[1]:
> +                raise bb.parse.SkipRecipe('Malformed boot file entry: %s' % src_entry)
> +        else:
> +            dst_entry = (src_entry, src_entry)
> +
> +        deploy_files.append(dst_entry)
> +
> +    for deploy_entry in deploy_files:
> +        src, dst = deploy_entry
> +        if '*' in src:
> +            # by default install files under their basename
> +            entry_name_fn = os.path.basename
> +            if dst != src:
> +                # unless a target name was given, then treat name
> +                # as a directory and append a basename
> +                entry_name_fn = lambda name: \
> +                                os.path.join(dst,
> +                                             os.path.basename(name))
> +
> +
> +                srcs = glob(os.path.join(deploy_image_dir, src))
> +                for entry in srcs:
> +                    src = os.path.relpath(entry, deploy_mage_dir)
> +                    entry_dst_name = entry_name_fn(entry)
> +                    install_files.append((src, entry_dst_name))
> +            else:
> +                install_files.append((src, dst))
> +
> +    for entry in install_files:
> +        src, dst = entry
> +        image_src = os.path.join(deploy_image_dir, src)
> +        image_dst = os.path.join(boot_dir, dst)
> +        shutil.copyfile(image_src, image_dst)
> +

We literally iterate three times over the same files, I don't see a 
reason for not merging those three for loops into one?

Also, I now realize that this was heavily inspired from what's in 
scripts/lib/wic/plugins/source/bootimg-partition.py, would have been 
nice to say so ;)

> +python bootfiles () {
> +   bootfiles_populate(d),

Not entirely convinced we should have a comma after bootfiles_populate here?

More general question:
1) how does this work if one has a boot partition created by wic (via 
the plugin bootimg-partition?
2) shouldn't we factor out this code here and bootimg-partition's? or 
make bootimg-partition somehow call bootfiles IMAGE_PREPROCESS_COMMAND 
to avoid code duplication?

Cheers,
Quentin

