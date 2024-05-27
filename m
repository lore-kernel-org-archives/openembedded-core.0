Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A070C25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 15:29:55 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.102])
 by mx.groups.io with SMTP id smtpd.web11.156.1716823788499402408
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 08:29:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=aKBJSgHb;
 spf=pass (domain: cherry.de, ip: 40.107.22.102, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxZ1JmmGWqGbXJv3Gl5eDjlf/cr1h9lBtWzdrPsqdb0zoN2AbSlpN9bM4ui5ErfHJHBoNoKdsL87EeFCToKV5a/LubRAGuiZodKpqifURxPp0jFZ47DXGA4iuDl3Np6P0DkLP0RR7TTXV7JjKjdsfiZGPPugbMLrYE363qYFfpPageUWHXv7UfMg4ema0lHJ7fvktcek9ZHKcufNFU2xLyT48qhZYFhdl8MI9fJIfubkd04ORd1sf9NENeUeYrOaXAAu0yj5mtwLktaYlz4+12c2u2Za6EAT/ThqNkyKV6eIzGM2fcMbQm64sqicubpSSzUhI2FZ4SB8Z4h4wpbtcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cqyt2x9RVaA529v4roeQEmGqPGOzYP0CksNtsdvG9io=;
 b=IE0tkBZWyvCaIkBVhU+8iD4iE3yiq1tuSgOJBD8PCdmGTHi1njN343vnlxvnXQkNAUo5V9sVZi/pfuL9gLbHbsDybcXZjaKoVq6Z67nQD2hUvDSDxWH4V3hO85HC0ON98lkbwT+Yn/LpZ/7NjBJOCuSI065Xbokwn+gvnYAMw/QML6mbF0O25qZz+zP5ZKo4HzM4Gq2DfVkr4/lcb4ngNZPiSiWg7P+nnsnmPgKBF0rSjQKJSx2ZtkFyTR4ZSJXlHnADLGc8igGiTD/s7a1YcIwp/1NL/9fTWwkG0FBRqzmF+nUZHtWSmu6sx6f8Pi48RHXc0o4ClzluHnAuGpRzLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqyt2x9RVaA529v4roeQEmGqPGOzYP0CksNtsdvG9io=;
 b=aKBJSgHbcMXMYyncggwmR4ARTGA1KVL+kF6jjYFdpVQcbhMyCW3R3JeXez/l4YqnaJyi7tVxk5ga9QBJjkt2T2QdrqFNyDhpjabI/o08nlruyRPIguWAIvEtcBeTlQo8490rNOiYThn6LK3UzMvz4JoQ6Hxn8KOtFGmzK4ulvKY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6589.eurprd04.prod.outlook.com (2603:10a6:803:128::25)
 by PAXPR04MB9325.eurprd04.prod.outlook.com (2603:10a6:102:2b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Mon, 27 May
 2024 15:29:42 +0000
Received: from VE1PR04MB6589.eurprd04.prod.outlook.com
 ([fe80::8476:1b2f:f236:db31]) by VE1PR04MB6589.eurprd04.prod.outlook.com
 ([fe80::8476:1b2f:f236:db31%6]) with mapi id 15.20.7611.025; Mon, 27 May 2024
 15:29:42 +0000
Message-ID: <a18ae6ed-1ab1-4ba7-93d3-e22e00d9554e@cherry.de>
Date: Mon, 27 May 2024 17:29:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] image-bootfiles.bbclass: new class, copy boot
 files to root filesystem
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20240525085023.6042-1-marcus.folkesson@gmail.com>
 <20240525085023.6042-3-marcus.folkesson@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240525085023.6042-3-marcus.folkesson@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0035.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::11) To VE1PR04MB6589.eurprd04.prod.outlook.com
 (2603:10a6:803:128::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6589:EE_|PAXPR04MB9325:EE_
X-MS-Office365-Filtering-Correlation-Id: 74a25e5c-2c10-4b01-c500-08dc7e61d425
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S3BOQzJWR2I4RWkwVzhIVGh2QkJUaTRNOUNXdDJ0dVpPdHN0Y3VCTWxwWjdD?=
 =?utf-8?B?bkRvRURVdnR3bXo0a1YwRSt2aTI4enZaN3hLbjRXaG5qVitZL2svcFZhV2Vv?=
 =?utf-8?B?ZWszR3Q2UDdVWHYrQk9ZRGZrNzRZZTliY0RrUHJ4Ti9seFluZ2phclNnUENj?=
 =?utf-8?B?M01Ya1RrblNONWRiNjdwSHF0ZllrSEFnTzJsR0tqdFIyeVNWMUMzV2tab1ND?=
 =?utf-8?B?bmxnMWNRZG5jQ1hFdVhYTzhLRlFYQXQ2NG1DYkM2YkgxME5XMHRybUs0VHJz?=
 =?utf-8?B?SC8rUzRERWlSYkdSK3JxWDZMVldZQWVTdEhyTjUrUThnNklpT2JPRE1FQ3ly?=
 =?utf-8?B?bzQvSWxtU0Z4QzdRZG9xK0VDLy9HTnN5eUR6aVdRT2kyT0JRR0lZdnNBdmxP?=
 =?utf-8?B?TzlyeUhIb3NGY2lGV0pzSTBTRm1zNUNaSkMxVVpMdkxybTRMWXpPMWc5UFg3?=
 =?utf-8?B?aUljcWdtYXJVMWhhTmZKc2lXMkNnS0NoRVJXZEV5Wjk0Z01PVlpsYkI5dEt0?=
 =?utf-8?B?LzNoa2MxNG8vSXNMcUhpZThqRkY1TGpLQkplUDRBT3ZPTFppRlRvR1lHTHlR?=
 =?utf-8?B?a2pGQ1ExL2lZQWdRaHcrUDA5b25VZGlWRVovZkpRVDJQOTd4UDdrSk5DcVMv?=
 =?utf-8?B?MzEyMDk1TVIxa1FoRHB4ZGN3bXFRRjJBeTFWa2l4OFVWWmV0UzluMEY4MDNQ?=
 =?utf-8?B?aHFpWElITUdabDhHK1FjWWxtdThKd1MwanZDVmtodXE1djlUREhGVkU2NTBJ?=
 =?utf-8?B?VFZidzBMcXQzVEk1dlgzMFF3aXVJQk90eGR5WCtXeU5QNHRwTkpwYWFxcFlJ?=
 =?utf-8?B?NHg4N3JmMElOYlFoYVBxT3dscTFGVGoxbFl6RUtXWWFMK1lRMmhmK0pDQjZr?=
 =?utf-8?B?V1B5NCtzdXI2RDNSUkIxOS9EaUx3SkVkMkNGbmY3N2Zwcmd5dTZ5TC9hZGVW?=
 =?utf-8?B?cDE2QUUrV2ZSMDJNb1hNN0RzUUUxbzlFYVRab2JSTTZuSFBsNG5RelhQNjVO?=
 =?utf-8?B?Y1RLWHRJNEprOGlIZEFQYjJBOEpINUNkL29NTWFrMmYvSmdJc2VkdmQ1VE9W?=
 =?utf-8?B?SUtETXgxdG5URFA3VTRRYVJNREV6KzNuNFlFWmMyYm82ZUU2R2VvNzRXZHEz?=
 =?utf-8?B?UENhWlFSdlFOUjZwTVA2a3A3YlYrNDF2R25RaVRicmpCenpGTGlBVHIrczJB?=
 =?utf-8?B?SW9DMU8vRWpwazU4WU42ejdzZDB0MGJlRWkxMytyblE4ZXJhMC82OXhuektl?=
 =?utf-8?B?cVFMYlFlTlpvV21BQXh2QlJJbmZQczEweTlUbXYrMTZyLzl1U1RjYm9PWllv?=
 =?utf-8?B?RHhUbm5LYnVVb0p5ZmphS05zcHlnOWFwTTBDQVZpVk1kejlSOUU4UlVIRzlx?=
 =?utf-8?B?KytERGh5eFhONjBBTVdZblNoM2ZRcG16Slh6TlI2VVVEUE9XbEovOGhFUThR?=
 =?utf-8?B?aFJSaWV1STZkTk1sNmdXRHlMbWlkOXh6N2pNY2tjRDdtaWhaWERqZFB4YlJx?=
 =?utf-8?B?SjZ4V2xGV1JJdXpQMVRrNDFXdkROTUNPcUIrYnQycDZnRmlVUUl0RXloNkZz?=
 =?utf-8?B?TU5zZWhJYUtCWEx1d2dYOWhLNkZ4dDF4N1dCNGV6NUdUVXh0c3ptTzU5UUpR?=
 =?utf-8?B?OVFRZGV4TjdDVzNzeG42NUhlSEc0eDlUSGNtRkJWVXNqaGxNTEhtbjB1eEhx?=
 =?utf-8?B?Z0RoaWZvdGh4S0FiUjB5cnpmdVJ6YjNPY21ObUJGVmxMMWo0NUJkbUp3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6589.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YjZGYWpHNFhsOVpqR0RORVhseHBLSUhWN1NkM3dvQUpOd0kxbFNDdmI4d2hB?=
 =?utf-8?B?N3J4YlEzQ0poa1BVZWZMNnd6SkUzazB2WEhGSWhtbnFkMENuSi9GU1ladHRp?=
 =?utf-8?B?My85dDYydkgrV2lCQzNVaS9ZS1NQSFJ0RVU1WTd5ZkdVYy9QR3NiL2pVUk1n?=
 =?utf-8?B?Tm5vTjc5L1dORnpiRjNhRURWdUphcXpDQUZuVEk4OGcvZVo0ZTBDL3FFb285?=
 =?utf-8?B?VVl6L3pzR0xPY0JaaWdxbW5CNkFabFJqTm5Bc1JldzhhRFdLRmJxTkNKNE1W?=
 =?utf-8?B?dlRtaFF1T1FYQXdLUEFuK2R0NkZkd21RQmtXQ1pqMXF6TWRYTzFDdmVjOC95?=
 =?utf-8?B?ajFyMW1rZGlGUzdPN2QwVk9IMHg4MkRkRHNhOW94T3NjRzhGMGI2bkZBUDJS?=
 =?utf-8?B?Yjd0MEkvdjJkME1HY0N0ZjhvZDNEVTNxN3JtU0d6VVI3MUNSYVpXalZucXox?=
 =?utf-8?B?YVFzYXlyNzlsKzk1bVJhamtqUStwNk9Ta2sydUxWOXA5VDIwUmFGOWZwSXZz?=
 =?utf-8?B?eUw2WEc2bUtueGJQMTI2YUlISlJzM3pUc0VNK0ZNbjRYMDFIQU1xUVRoa3ZI?=
 =?utf-8?B?bkRzMkdHUjl0UFFnN0gzNjBSMlJJb3dUN0tpblFneHpWVVNwMkJyVUt3WGlq?=
 =?utf-8?B?S3UxRlBNU29BNUx0RFZBSFZFZ2w1OUNvWjIzR2duWFJBM005RmlFSXRKWDQ3?=
 =?utf-8?B?ZEN3UFVMajV1SzBrNU5pZ2JCL3FUOHZVeFRVMXBGbUVYOW4zWURjb0xOS0Nq?=
 =?utf-8?B?STBSTVl0NlpjSUhtVGs3d2w2Y2YwOVV6MSthaGVNNHp3cG9tMjlIY2dmWVhH?=
 =?utf-8?B?dFQyWlU5blVhREZwNVZtRGJKMDgzNmkzbDRNNFIxMUVzK01vc1ZVK2NuSVdq?=
 =?utf-8?B?NkN1VTFvWEp3ZDRuMGo5K1J4eFVFbkswYUVjQ0g1WWhwSHpBUGNNV0hEQjFY?=
 =?utf-8?B?KytReDRvUFIrR21Eb0xxUlg3M2NCa3dzbTkybjRxYm5SdGRuUlByTnVwSGVH?=
 =?utf-8?B?UTkzczA3TUJWc0VGMEhNV3VXS0huQzhWY2pHY1lXd3dlajdjd3Z0WTBtTUIw?=
 =?utf-8?B?b2ZmUGkrWkRUek80QkxsRGU4aUlobkVJZXBWclZJRVZLNStlL1RRaEZ4c1pE?=
 =?utf-8?B?Qi8xbDF0aElSTE9VVzdJc0lpVlc1MFI0VWtlNWZXb0luVWNJVnUrbDNJRmpq?=
 =?utf-8?B?c2pwdVlvTW5yVUpGMVpDOG5zbVY4bkpCS1JHZDBkUE9KSk9ZQTY3YVMwM1pw?=
 =?utf-8?B?cm9ybjNic3hnSldpOG9GYmxmUXF5NkhYMFdOSEx3ekRwTlJ3ZFNDZ3kyaExP?=
 =?utf-8?B?TTZaM2ljYjMzanNaMW1lZTZoWkVsdHM5WmZQS2RWUk13a1NtZE5MRS95SE02?=
 =?utf-8?B?dDVpalZPNmxtbVpmTVJxY1FmU0lwTjAyaXN4eUhEWllSUXRSMVVhQmd4RklK?=
 =?utf-8?B?eGYvaWJRS1o1aDBtVDhudWpKMUFQd0VRQUd0V282NkZvNm9oUlAwMG5HL2tD?=
 =?utf-8?B?VERXWkc3WTB1ZENaUVdGcm9Qamh3bWhiZ1c3MHRaN0tqOVFxUTNnRUZOVWVF?=
 =?utf-8?B?RGpVQWJ0UGl4ZUk4OU4ycVQ0Rjg4OU5yekRvM3d4Rk0wampXQmhEVzZzMjJV?=
 =?utf-8?B?Z1hQV2RBMW5CVmk4SWFVbytoRlBhU1p3UWRzQy9KRjBOajFYa2VMUWoxdGF3?=
 =?utf-8?B?eXUrUUM4N2djakFkVi9iekREbkl1dGJ6ZHZSbVVDTkptaU1sYk1sSEl0dGJt?=
 =?utf-8?B?eWh0R0FLamplZmRPbEExeno1U2c5OXM0WHdtQlByYUtPeVEwcWtvQVlGVW01?=
 =?utf-8?B?MUVkWVFPdE1aNHBHK1JYNFM3cFc0bVNNTEtBN1N2eEUwTC9MdnBEc0lKTERj?=
 =?utf-8?B?NTEvTWZaNXovSEVrdGJoeUtiT1B1UngvNTc3OXFRSnNBQ0dGcDREVVc4V01Z?=
 =?utf-8?B?bmxVSDVqbHlqVVdKV0R6M3hWMVBLWWl5QWFHeUZRcGI5NnVpWFpwKzBHSkVN?=
 =?utf-8?B?TVFFc2hQVGUzcG13aXY5SURTM3dIU29CTGhia2dhamQyYm9NcnI1QVNnT29P?=
 =?utf-8?B?bHF5dWo4OVJlYnZUaXo1eWV5RXIxMEF4K2Q4bDk0OVZjQ1Q0ZHNyTmdCbHFr?=
 =?utf-8?B?MEFLSXM0djJyalhTa1MxZmNDd1BRQXBxMVBqaldYd3VHanpzSTBZeE9aN0xM?=
 =?utf-8?B?c0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a25e5c-2c10-4b01-c500-08dc7e61d425
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6589.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2024 15:29:42.1402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GGnJP+gZzav5VDp+vZD8ZxWSptiF8vJ7fWWMP0KQmTuJJ2HAfB7A1kkeMjvgX7rkRgoW6hzaVkFZXNB8MgGHPWUXfZOKT03BTTR7HhI0nvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9325
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 15:29:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199905

Hi Marcus,

On 5/25/24 10:50 AM, Marcus Folkesson wrote:
> image-bootfiles class copy files listed in IMAGE_BOOT_FILES
> to the IMAGE_BOOTFILES_DIR directory of the root filesystem.
> 
> This is useful when there is no explicit boot partition but all boot
> files should instead reside inside the root filesystem.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>   meta/classes/image-bootfiles.bbclass | 38 ++++++++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
>   create mode 100644 meta/classes/image-bootfiles.bbclass
> 
> diff --git a/meta/classes/image-bootfiles.bbclass b/meta/classes/image-bootfiles.bbclass
> new file mode 100644
> index 0000000000..29a38ac631
> --- /dev/null
> +++ b/meta/classes/image-bootfiles.bbclass
> @@ -0,0 +1,38 @@
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +# Copyright (C) 2024 Marcus Folkesson
> +# Author: Marcus Folkesson <marcus.folkesson@gmail.com>
> +#
> +# Writes IMAGE_BOOT_FILES to the IMAGE_BOOTFILES_DIR directory
> +#
> +#
> +# Usage: add INHERIT += "image-bootfiles" to your image
> +#

One is supposed to use inherit image-bootfiles inside recipes. INHERIT 
is for global inherit, from configuration files, e.g. INHERIT += "rm_work".

> +
> +IMAGE_BOOTFILES_DIR ?= "/boot"
> +

I would really suggest to have the exact same prefix as for the 
IMAGE_BOOT_FILES variable since they are related. I would like to avoid 
the DEPLOYDIR, DEPLOY_DIR confusion for example :)

> +def bootfiles_populate(d):
> +    import shutil
> +    from oe.bootfiles import get_boot_files
> +
> +    boot_files = d.getVar("IMAGE_BOOT_FILES")
> +    deploy_image_dir = d.getVar("DEPLOY_DIR_IMAGE")
> +    boot_dir = d.getVar("IMAGE_ROOTFS") + d.getVar("IMAGE_BOOTFILES_DIR")
> +

I would suggest to use
os.path.join(d.getVar("IMAGE_ROOTFS"), d.getVar("IMAGE_BOOTFILES_DIR"))
here to make it a tiny bit more robust to missing/redundant slashes (/) 
for example.

> +    install_files = get_boot_files(deploy_image_dir, boot_files)
> +    if install_files is None:
> +        return
> +

I'm wondering if we shouldn't print a warning or at the very least a 
note if boot_files is not empty but install_files is, this seems like 
there could be an issue no?

> +    os.makedirs(boot_dir, exist_ok=True)
> +    for entry in install_files:
> +        src, dst = entry

Those two lines could be merged into:

for src, dst in install_files:

I believe.

> +        image_src = os.path.join(deploy_image_dir, src)
> +        image_dst = os.path.join(boot_dir, dst)
> +        shutil.copyfile(image_src, image_dst)
> +
> +python bootfiles () {
> +   bootfiles_populate(d),

I'm surprised by the comma at the end of the line, is this required 
somehow? What does this do?

I'm also not entirely sure we need to have this additional indirection? Is
"""
python bootfiles_populate() {
     <code from def bootfiles_populate(d):>
}
IMAGE_PREPROCESS_COMMAND += "bootfiles_populate;"
"""

not working somehow (I don't know if it should, so just asking)? 
tinyinitrd in meta/recipes-core/images/core-image-tiny-initramfs.bb 
seems to be doing it, so should/could be possible?

Cheers,
Quentin

