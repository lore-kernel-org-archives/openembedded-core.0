Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D3FC25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 15:21:03 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.123])
 by mx.groups.io with SMTP id smtpd.web10.30531.1716823259177047342
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 08:21:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=SrZKwGEx;
 spf=pass (domain: cherry.de, ip: 40.107.20.123, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aluOMpNn4XNESTRVnuQ/49jDzvsedY+7v1PGOlzjxOZfLTVhrfBMRLjduy6XDsrhMzBDHJMX2sa8iZVMs+3LnDvbesG7mFQIwXFIafvSw2B/tFa3QDzpMoDQG7pDwOq4Zrt6f6XgZw8MEWRTEHnV9BKBnHslyaxDwRfXVSaF493T9JUGJ8wLZqbGLTDnEedG+qouGsojFq2kSl4E71z1nF3F0naiSsKxLdDM8abhUg5JJ9Y/dwRQqaqNV87wyLqGBRdI3stC8e99tY8Wjrq114JHYSeySFKDCyDc53aUC+4ALDAyVCnjB+4tELh9WwHFyK2Md1OExm4g4gCOaMOK+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=obRYtEn0I7q4YWI8QWjFtR7w/nLbo2LnszDySQDFf38=;
 b=N826LokSqipimaP89sLa3Ub1z9Kw36HT7ijhQzZmn4m9xRrmBYygYvsquQ46QwuBCxiu4PxOe9a9OmKN/Il90zY2pBqaKuJeJzKeNRp0nIoHzqY0YEgsKqM61K7KIhfWA8ukEFo0SBbm6VqnFLVGaBOQSSPF/f5pZwkUUFyqQcrogmoSFjBmrOcot/6vukseacvx5S766sjYdg3MmCriiJyBzagPKM3HszCj6BFA0cc6xlYMHIuvxXrwOIRsVA/DULoyuVXtCw0EzkayuIPh0TayWWPFfwA64VkHVgX4cAViBa0J4maiHCGK7HPQ64QoNUp6TA++uAaj6MIe7Hyf/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=obRYtEn0I7q4YWI8QWjFtR7w/nLbo2LnszDySQDFf38=;
 b=SrZKwGExhLzPn8ooTK8qYMfyylG1elkArz9J9cFkQe636Os8oLNgMFkJh5HIMF3SpUdglx9s1PC1eSmnaW4EdgF+8LZXllk7we0tprMGeJszJp0O99F+F3rR1mctgTl33sS69OIbk220paGyu46m5hpHjyGzlt/gPTvidr6Vzzo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6589.eurprd04.prod.outlook.com (2603:10a6:803:128::25)
 by AS8PR04MB7672.eurprd04.prod.outlook.com (2603:10a6:20b:23e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Mon, 27 May
 2024 15:20:55 +0000
Received: from VE1PR04MB6589.eurprd04.prod.outlook.com
 ([fe80::8476:1b2f:f236:db31]) by VE1PR04MB6589.eurprd04.prod.outlook.com
 ([fe80::8476:1b2f:f236:db31%6]) with mapi id 15.20.7611.025; Mon, 27 May 2024
 15:20:55 +0000
Message-ID: <913d0052-6ba8-4e30-bea8-ce910acd9e64@cherry.de>
Date: Mon, 27 May 2024 17:20:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] bootimg-partition: break out code to a common
 library.
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20240525085023.6042-1-marcus.folkesson@gmail.com>
 <20240525085023.6042-2-marcus.folkesson@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240525085023.6042-2-marcus.folkesson@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0042.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::14) To VE1PR04MB6589.eurprd04.prod.outlook.com
 (2603:10a6:803:128::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6589:EE_|AS8PR04MB7672:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e9ca38b-765e-43e1-6a46-08dc7e609a53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aDl4Q3UwTERPSmNuQjZOdnMzMExoSVkzb3NncEd5VzMrMGkrNzUrMnlyL045?=
 =?utf-8?B?cnhhTU5yUnNDSkFnaXdUeWZOTkRlOUpxSTkyUDNxSU9EbTJFc005am9vc1ZH?=
 =?utf-8?B?bk4zSVUrVEoyYXozV2tGa1VqQlpBWUd2alBIanBmUmJBUVBsZGpYUE9TdzNU?=
 =?utf-8?B?Z3B5T1NxNzZFOEhEMW5ET2xXd1AxWkw4M1pwT0RkcXR4NklFWkdXR1lmek5p?=
 =?utf-8?B?SVdTSEhkY3lRZUdPbHpjZzlMc0FhVk5tYVg2d1kyeUVjdHJKb1ZXeWxVVWor?=
 =?utf-8?B?SzFkZHhaamNvWUhQMFhHejJ1ZWlVOHVsODhQeDJKQzdiNXRDc25HNzZYTWlX?=
 =?utf-8?B?ZVZXVXEvUTdPWlZsaTkvVng3NUZPVER4T3RJUmZtaU0vM2tRb2R4T2pFZUNp?=
 =?utf-8?B?OGtKM2pnYkdvMUhidTBCMUFueVJrUGxkS0N2dGQyQ24yU2ZQci9zZjJ6d2dt?=
 =?utf-8?B?bE4weGgwNzZCOCt5cGdwVjJXL0RmVFVYSmhHTXJWNWlqSmpBS1RPUGhSRm9j?=
 =?utf-8?B?VXZTRDMweVJHRU11MENGcldQTmg0RWJYZDZqemx0dUQrQVlHMWNqLzV4ZFlT?=
 =?utf-8?B?ZThDYmUvK0syRVEwZGZGNjcwTVhCVFY3YUQ3VFllWE45N3paQ1NoMmgyT2hG?=
 =?utf-8?B?TGFJbHNBbUl4ZzV2MVBwVlQxaitRYlIyd0RtZERCamNHODFRSDlPMTlmbXZL?=
 =?utf-8?B?dE00RHJKUGh2c0tvY1BnaTYyajYwa1V5b0hVOFE3cHE4Q0VKTGU1djVwM0pI?=
 =?utf-8?B?Nml4dFZTQ2lxbHdDRFRnM2piV2Z1SWRsOWNKeVhPcVdsRDRLT2NleDUvMTVk?=
 =?utf-8?B?SG0wNDArSVl4TDd3UHU5LzM1cmkvTWNnbVU0eUgxWTVxdUpveTlYejNpSzEr?=
 =?utf-8?B?dDJvY3BsUmR2MmZ5a3dPQ1FnWEZqTGhvc3NDK3VobzNsQ29HNGlNdEZnajRl?=
 =?utf-8?B?QjkrcVFPdjFVMldoampHbG1HU3lNQ2I0QzVJRUJyNnNTTXZ3ejYvVUlqbFZF?=
 =?utf-8?B?d09iczFMbzcwMytTZlYvUzhZQ1VIOUVBdi92cXJQZ2pDQmhwa1N5TVc4enpl?=
 =?utf-8?B?Nkg5ZCtsMllBclBXdGRWek9iQkN1blI1V2UwcHl5NFdDbkpmRytYNTVYQVJU?=
 =?utf-8?B?cXdzVUt3YTVneTR1WWc1RU11MkR2bnhjcnRlam5DM1ErdDlUd0FJQ0h0Uksr?=
 =?utf-8?B?dGdKSitaSUVoWkdhenZkWFNDeG9hWVlkNFMrZlZ0dlJuWjhORHJwS1BCVXpL?=
 =?utf-8?B?QkJiMmJhNUFmVDlSNTQwcExiYU9Nc2lNYk5XWGgrS3RKb3hVS2h1cy82ZWNx?=
 =?utf-8?B?THExTGcxY0Y4N24xbVowaDlhYmFvdFhmSEJpQW9lWHpEdzBSMk95cFpUa2U5?=
 =?utf-8?B?cW54UTRkaHhIYjY2V09MZVB6Ky9LZDVCSnNoeXFHck5HODAyN2R1cURnOHdW?=
 =?utf-8?B?ZE5tUWhwcmFaanpzODUrSWYxVzB1eHVLcU52ZHpRTW1sMDNoZ1lWcXRVU1R0?=
 =?utf-8?B?UVErTXo1emwrbzZ2eXJVWnN2UytBZUIvbWpRL25nWGgxVzk4TFdDK2h1ZnUv?=
 =?utf-8?B?ZzJDNGNNSkJmVDMvVEZZUllGRjBPNHFDeUpYU0VWMy8zVTNXTFFIZkw3U1NH?=
 =?utf-8?B?UW9MOFArc0NZTnM1bEFWT0xqdmh0Y2ZwcnczVzZLcEJXM0hvZkJxYzAwOWZQ?=
 =?utf-8?B?SGdPaE5zVWNKdDg1b3Y4WFBtcVVLWTY1TURpZGkvR2hQcGh5ZXZscWdnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6589.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dHMvb3ZlYm84NWtkTlZ1MERMVlVBSndPbFRUaFB4Q3N4SEdpMkhFM0tvNWFa?=
 =?utf-8?B?Qy82VkVpaEljYzRySDAvN2JWaXd5Smd0WXAzclg2ck5ESzFoMzVMMHhyQVhp?=
 =?utf-8?B?ZnFpUlZwRWQ5T1lDUVRWd0pxbDdqZ3c0RndxTHVMWTFWdm51Wkd5Z25OekJ3?=
 =?utf-8?B?N3ZOVTl3bUY5VmQveFJ0SDRHTUhGZFNDS3F6SUtpbGU5N1NrUit2ZkkvVXJH?=
 =?utf-8?B?N3lVZFFzWjhLUmtmZ0pteUtqQmZ3VTloQ2xnT2JnRERKSkNCM3ZvT1NFd0xY?=
 =?utf-8?B?MnNkcDBoMy9wYnpwZG0zT2JaTUZvRlZmamxLUjBXYTduT0xnMXBHT2ZzVHhD?=
 =?utf-8?B?cW91cXJkdFNpaTBUTjVXd2k1VFUzTlNYYzZtMVBPeVoyeG05Z0dZQm5ydkVw?=
 =?utf-8?B?VkE4THBYTjB3TFlDY1RVVGZCVkNndWFBR0Mwc1RyOG5Nd0sxREx2V3BITDFQ?=
 =?utf-8?B?SlJkWS9OYnhBV3dXbjIxcDBNTVZoVVNLdkJiZDBTYktsOHZUWG4xbDlOb3Jw?=
 =?utf-8?B?S2NJeEhpN2ptWFFROExXZWdHUTBqMG5pRVpKckFFSkdpdFdJMHJhN2RVNXJl?=
 =?utf-8?B?ZnRQdXIyakpxVmFoVzg4ZU1zUVNKQTBoOHV0TG9OL3ljaVNvOGlxREZVaUV2?=
 =?utf-8?B?bFliZFBWQlRldng4UTg3ZWtjbHVXM0RkY1l6eFRNVldPVHJ0ckZacEdzSDh6?=
 =?utf-8?B?SlFWU2ZLblM2dXNlUnYyL25BT0Z5cEhUZTJxQjZwcGZ6WGVoRkdaL3FyZGdJ?=
 =?utf-8?B?SG0zUnkzN1B0Y1EyL2M5dlo1VzQ2aGNSd3NTN1BFVnN3ei83OXY3MkFQSnBz?=
 =?utf-8?B?YUdPdkFYaUtTRndFV1RScE43cStRcGRTblNWcWtuRGYyb2F5bVd3djlFdkFJ?=
 =?utf-8?B?TTczRTBiZHlQT0dGVW02T3VkSXNzUHNwQmIyajJlcFhDbmpQd29vYzZXUjBu?=
 =?utf-8?B?Y2dNZHRsOHE2cTc1bXlUZGk0b09RK0Rwb0VCRGI3NG9rRlRXZm9UOWtiTXhU?=
 =?utf-8?B?N0N0UW0ybkdFTzRDWTlIRVY0TWVQK21DWldzUWtTZjlVMW0zeEdiQTY3WWMx?=
 =?utf-8?B?M3lvSHRhdkI1RDZLalVqdnVuaWRsTFA3QWZmRXBkeENub3JqeFRjQU1tZXBZ?=
 =?utf-8?B?VG12NzhjTjdLZWZTNmMremhQYzdkVXZSVDNTbW1wYXQxK1B3bWVCQ3U5aHNx?=
 =?utf-8?B?dVhVUEQ2cDNBVCtqZkxna2thY3dTUlN0Vm52L0gxL2V3K2IxcWJiRXp4cVQz?=
 =?utf-8?B?WExERW40UEVva1A5S3VzMHR3blppSjRFQ2lMeTQ5bklBaWRmMEpZTXlwNWZX?=
 =?utf-8?B?N3V0dlpHQzZhNU42eW44OEpqYVhJNUNPM2JXd1dQZkx5R0xSVkE3RVM1d3BF?=
 =?utf-8?B?MjlJYjdIazc4Ymt0Z3dUNlgxUGFHVFdCQVoxdVpmalIxZXpxeVkzVmRTbXpx?=
 =?utf-8?B?SGpQVGxmVi9CM1ZPZkRmNit5ZVNWUExxZHpaTWZCblNLQkhnOUdkZzZzZTdL?=
 =?utf-8?B?akZLTEQ4RFpvTlBjNHZNQnF1eHN2ZE5iRVhnZXBZM0JGeUVlMkdKMXRFUnFh?=
 =?utf-8?B?cFhNWFg1K255a0IzWXVybU14ajJLMDN1U1FkZDhzQWw1YWIyalUrdVFGNU9W?=
 =?utf-8?B?QzlhRldQNStZR0tWQy8vM1ZWVUg3RWRHbTFYYUhWVm1NLzR2TEdyejhCeHAz?=
 =?utf-8?B?eDdxczYxUVc4ZUJTZGgvc1R2a05oM1VtUGhkaWpLdEJEeWFEODYzOXI3ZXlk?=
 =?utf-8?B?U3BZOXlWN3UzWlFYWlQ4VGR5NVl1ZlRZSzdnYjY3NHFlY1dORHdHbkR4Wk4r?=
 =?utf-8?B?QkI1enhxeXRTQTFLYmg5anpERUJ2dklZNG5ldlJwWlZ4QVlSRVYwTGltV21Q?=
 =?utf-8?B?N2FmSU9oMHlmT09ad29uMVhwY1d1d1E3TEtFdUlLV0dSbCsrcUtwU2NaUllZ?=
 =?utf-8?B?cjQyY1I5VWxFMHBlMEo4WVdSVHJyWllOK3dYeG84NUxhRjNNaEVTd0RKNUd3?=
 =?utf-8?B?dTlyRU1tRUh0V3BoKzgzWGdXVUtkcHVNWmFjVGljSklibGZucWFkbGJMeEVx?=
 =?utf-8?B?UU1oTkF5cXhGaWE2VVowdnZ0WlF5L0oveWlRZzc2QWlTN0s1QWJzdG5kL3I2?=
 =?utf-8?B?T3F4SndOREd6SDZsL0lub0tEVUJUdi93Tk1EQjZoUENTQ1VtS0ZaazRkeGxk?=
 =?utf-8?B?cVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e9ca38b-765e-43e1-6a46-08dc7e609a53
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6589.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2024 15:20:55.1874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C6CSwG+2xWeayOzZpGOCJmBqrS/ddTU4W4rzk6tx7X4NBzUFE4liXl+Wx1F3GGd2mEapIBzOPoQc+SMM0QnLP2fczCkGb7da4iB77oa2p+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7672
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 15:21:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199904

Hi Marcus,

On 5/25/24 10:50 AM, Marcus Folkesson wrote:
> Break out the code that parse IMAGE_BOOT_FILES to a common library.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>   meta/lib/oe/bootfiles.py                      | 56 +++++++++++++++++++
>   .../wic/plugins/source/bootimg-partition.py   | 39 +------------
>   2 files changed, 59 insertions(+), 36 deletions(-)
>   create mode 100644 meta/lib/oe/bootfiles.py
> 
> diff --git a/meta/lib/oe/bootfiles.py b/meta/lib/oe/bootfiles.py
> new file mode 100644
> index 0000000000..81e09f138e
> --- /dev/null
> +++ b/meta/lib/oe/bootfiles.py
> @@ -0,0 +1,56 @@
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +# Copyright (C) 2024 Marcus Folkesson
> +# Author: Marcus Folkesson <marcus.folkesson@gmail.com>
> +#
> +# Utility functions handling boot files
> +
> +# Look into deploy_dir and search for boot_files.
> +# Returns a list with files to copy.
> +#

It returns a list of tuples with (original filepath relative to 
deploy_dir, desired filepath renaming) if I read the code properly, I 
think this is really important information.

> +# Heavily inspired of bootimg-partition.py
> +#
> +def get_boot_files(deploy_dir, boot_files):
> +    import re
> +    import os
> +    from glob import glob
> +
> +    if boot_files is None:
> +        return None
> +
> +    # list of tuples (src_name, dst_name)
> +    deploy_files = []
> +    for src_entry in re.findall(r'[\w;\-\./\*]+', boot_files):
> +        if ';' in src_entry:
> +            dst_entry = tuple(src_entry.split(';'))
> +            if not dst_entry[0] or not dst_entry[1]:
> +                raise ValueError('Malformed boot file entry: %s' % src_entry)
> +        else:
> +            dst_entry = (src_entry, src_entry)
> +
> +        deploy_files.append(dst_entry)
> +
> +    install_files = []
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
> +            srcs = glob(os.path.join(deploy_dir, src))
> +
> +            for entry in srcs:
> +                src = os.path.relpath(entry, deploy_dir)
> +                entry_dst_name = entry_name_fn(entry)
> +                install_files.append((src, entry_dst_name))
> +        else:
> +            install_files.append((src, dst))
> +
> +    return install_files
> diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
> index 1071d1af3f..b22a448b65 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-partition.py
> +++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
> @@ -18,6 +18,8 @@ import re
>   
>   from glob import glob
>   

You should be able to remove this import as it was only used in the code 
that is now moved to the lib.

Otherwise looks good to me, so

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks,
Quentin

