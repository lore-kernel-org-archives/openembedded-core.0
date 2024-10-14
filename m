Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5639FD18132
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 17:16:04 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.25])
 by mx.groups.io with SMTP id smtpd.web10.449.1728926158703873207
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 10:15:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=N/v8WAGz;
 spf=pass (domain: cherry.de, ip: 52.101.69.25, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c2y+sP0P5BVQFEq3hXXobpQhniwBCU5l8EbX/8TuA9If5y9xi+uoihtU6MKt6bZwBTVJWkpIR5EYAVMflmXw8lol8TxUrXQXq6RRBej/anPIYOobqULjj8F7ht8glzEMyrGshngkceEn/EDx4CLOps7CCPYkpEgS/sj5+n1nrd0PPYa6ksO5tbuegjfPBx1kyQ1Tr3ThWnF6IOt31AbY/3/WV+Xg3mC0Vv9FH6WSFbXS0EEaL2ITbBhbCosTNxngixsxc1frbBm/2zEIczybbiKfVIm4n5plrZREmHdFyi0KCTClrOv86RkLgeCqkByceIkosgxVnXt0Q27Ici7Cyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8mPQUd0PpflzyYbSwVo1Ff9uIjdIIpb5e5DDJbhxtk4=;
 b=XDGHa8aeqKnOLRPXH+c7PpGVOO0ZsXm0pOrG+qyDifiBDBqA2YQy8Ed2R+g//hwnmU1Kz9DsUGUgNHePcjguNYT3fL7aeSQBMNBMsrI7rJ85FHd9RUkk/koPDVzoVTlLe2lDtd0KWcXi0aieTMZHPT3qH0PHxweFy1ZCYd7bwnjP0Ty3VTMKfLWypaM5QwKK6h+7murupiSLVqTLp6Rs4OEre3IIFkDct3lTcgojgwTV5qc+w+IfaupI62t1gqqWKCTQgiUvkpZ+2CIZMQT4GzkUwaaNb/b4eXIs6AKBUi9GL9HutKa5KUUM9Bm2l4GvUO3aajeqkljcAzbuhPrCxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mPQUd0PpflzyYbSwVo1Ff9uIjdIIpb5e5DDJbhxtk4=;
 b=N/v8WAGzWt2uJrgyODFdd1SYEjAI2RKYslrw1riCZTWRApSqV/2q0fCLWiWUuyvAFyGSpMpqEG9FBecLd8oq3anKwb67Es6dVhLRwAPN/eqojNv3gmjabw5UHYMlJ9kTJUxEJeY82REBWAfrWgO3RCCqM1hzfBr5359mzf7JUFo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GVXPR04MB10945.eurprd04.prod.outlook.com (2603:10a6:150:21e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 17:15:53 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 17:15:52 +0000
Message-ID: <2547eb43-b75e-4d93-af32-a45324e9759e@cherry.de>
Date: Mon, 14 Oct 2024 19:15:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/6] linux-yocto-dev: conditionally add
 coreutils to depends
To: bruce.ashfield@gmail.com, richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
References: <cover.1728912923.git.bruce.ashfield@gmail.com>
 <88eada332f5d3d00baf9f2cedf63460d80356032.1728912923.git.bruce.ashfield@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <88eada332f5d3d00baf9f2cedf63460d80356032.1728912923.git.bruce.ashfield@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0200.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GVXPR04MB10945:EE_
X-MS-Office365-Filtering-Correlation-Id: e9d7dfeb-1e2f-460e-ac1c-08dcec73db4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?azFLU0ljZVBsMTZjeDR5NGtCcFRidXRiTzFLSk9EQVBOaDNSSDVoUEwxT00v?=
 =?utf-8?B?OXRFbDV1OWhYRTMya2V0ZGdnREY2VFNxQVhrTlZhdHQzTkJCV2dRRC9UMWF0?=
 =?utf-8?B?SG1hdzdJUCtDbGMvSmg0VVAvSGxQK1ZBNGtINXFIRHFGb2FiTThaWjc3aFUv?=
 =?utf-8?B?OGdNZTdjcHBvMHZRWVBLSWc1ZDJIZ0xWU3Y0WGFPUm1qMlBEVUEyUmZIM3Zo?=
 =?utf-8?B?Uno4SDFCTVh5OUJxczUzZCtQVldMWklxb2tFMlNCbnNoY1kxR2JOT2tTb1pE?=
 =?utf-8?B?UUYwd0ZjaWRYQjVMTmY3eFFGWmlpUi9QbXljS3BNR0VWaFdwQmJwVEVOQ2hI?=
 =?utf-8?B?UVVSOHBZSWozUXBmSWJKUGNLbmFMd21jdjlQSXh6TllnUDk5dzM2NzNZTVcw?=
 =?utf-8?B?UnlIcVBSMGJZY2tsMTBuQ2UrbTZUejVGWDJJOUJ5RmZETTRTVTJIcXlZTCtt?=
 =?utf-8?B?ZDZwcGY3cExVQ0YwWnRBWnFCZkI4SzgxdXBjemVXWDJOSEVyWTAzWmpvWm9M?=
 =?utf-8?B?bkRQZVZvb1c5Z1RySGNYK3VLeEI4U2g1RHlqUEJSWVZIaElNMmlTbTdEdlNX?=
 =?utf-8?B?Sldqeml2ZHBSTTFZZVVLclRvOXpEcEl2c3R4L09JYnBVcmphQ3lVRXhqdXZ0?=
 =?utf-8?B?WUxFNHFqVEpuTWdFRE5JampETzNkMnRaODVhalB2a3R3N25ibVphRG13QjQx?=
 =?utf-8?B?N2tMdyt6N2s3NDhGOEQ4UUt6OU9sSnk2d0xsMXZkNWpRTGZvWXYvSys5L1Qz?=
 =?utf-8?B?Q2FVMmhIbTU0VWVhTDJoSndyTkpyYjJ3NzVRRjlJQ20yZzlSK0RjYSt6ZG1B?=
 =?utf-8?B?WjRsRWE5dE03TVdPTTROYnJtS2c5SVFCT09PNlhJN0U3a3ZxSTVweksvY1Bn?=
 =?utf-8?B?VkZFZG5RVzJPNUkwa0VVSW9VR3RHekpxNGVBYmFVWHpZTGRFWFArVE1NVnY3?=
 =?utf-8?B?aGphOWdhektldEYrWmJZK1FHSDRlczBQYWs5NXQxamxoWjlSTjBHMC9FMGhO?=
 =?utf-8?B?TjhEam1vTkVlcGc4NGtmWFZKQjJwOG11SGw1d2tjTXY5cm1ianlHMFFzSmQv?=
 =?utf-8?B?am1sc2l6ZzNXMnNEeWIrc0NGQ3JGTW45M3N3MGY1QXN2Ny9kWWJCeFhxSC9U?=
 =?utf-8?B?Kzc4MUpxQTlmbHU1b2FURlAvbGRUazd4QWI0eUNqTTBKR1EyNStDQ0Ftck1q?=
 =?utf-8?B?R0w2SUwxUTJBVkplVDU3b1JSb0tQendnV2xId01pR0hranhnZ0tFOXB3TGFU?=
 =?utf-8?B?dFJ5OGtNeG9OL2g5VUU1VHowT2pPMnlkUlVGVGNBejZKUHVucE1MUXVTaDd5?=
 =?utf-8?B?QytWcllLWnlDYjNWa0dQck1hdnhJQUNOUVBtdEpDUU14SVhyMFByUWw0YndP?=
 =?utf-8?B?WHZPc2IyVXJQVC8xOWI3VSt1QW9WWHZ3cGo5NjhRZkNFUUxBRU1DcUZydEZ3?=
 =?utf-8?B?OTBsY1ZRRFcxdzRWRVZmMmhYVFhaYjY4VzRMR2xYNWFzN29JbDBERFJTaTlj?=
 =?utf-8?B?Yk1IeWlIbmhvcnlXL2pDWjQ0TGExMi9NSjBJN3UxNnFFZm1xMVB2RWtocTFU?=
 =?utf-8?B?NG5SaXBNQ25zakJTV1dNUHZMb28rMUk0czljMy9iRVZzcFhnU2M0UFI1NDhn?=
 =?utf-8?B?QUNYT1Fab2piWVBVNkxXQWZaOHBRRVJGTkd2SzFaakRWSEJnczRTaGs4RGVp?=
 =?utf-8?B?LzNQSW0vV3NIaDI4S0FpQmpwOVc0TXQyeENhTmhEcnhZdE16SnBhOFd3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SWlYa1g2U2IxNllieVRTMDVWalN6alRURkpTWm1ETlo1Y2RmcEtBZlF2V0p2?=
 =?utf-8?B?YWMwMy9IVTRPRy9CODdIdVVGclVxRVF6VEFreE5HdVl3M2xQeUhxQjE5Myt0?=
 =?utf-8?B?eUtMaU1lVkxQN1VkZ3dZRkFUcEhnSkpjOTVnMldKOFpGQ2RSc2hsMDRnSDZq?=
 =?utf-8?B?cFdFZ1ZYUE03NGtob2paY2puTzczQy9FRDBDOXEyZXVJb1U4OWhpcDFqKzNx?=
 =?utf-8?B?b0pmM0xCS1IyY3ZHaDBwY0Fmd0lSMmE4bU5KUVBJWHRyWmJ0UDQ5dXBtdUhi?=
 =?utf-8?B?djVHZ01aTENsS21oTitFT1pYbm5PVnkydmtaZEZNSC8zUmlIRU44OWU1aUg3?=
 =?utf-8?B?bWZmbEtnSFgvd25XQnR1UzB2NGNhVWJ1NmtlZkFNS0hVelhZbExXdlhDcmxp?=
 =?utf-8?B?aHBJTXZYL0d4NUJQckJ1Ulo4a0cxVWJidVgxaFpLYTV6L21wNFczWGJiY1JT?=
 =?utf-8?B?VTJEamtlTG9vYXRWS05ndE1aUkt5OWtmc3BXK2VsWHpxMS9sNFNFRm9sOVd5?=
 =?utf-8?B?SDdNcmZPanMxYVFGMzRUUEV3dlBUMjAxbndFWUx1d2dCL0VyTUo2UVdhdkZw?=
 =?utf-8?B?ZzBhdW53azMxRi9UWVEwUks2ajVRMVhwOEw5ZThoUUJzOXU0eUNEZmFSSEJD?=
 =?utf-8?B?b1QyZEcxZ2twUCtIVllZWlFBYklTdlNHNGttSzBvQUU4cWl5eE56bGZiL3NK?=
 =?utf-8?B?Q3VzUzRZZ0RHakQ2dlQ2L1UzNFp1US9LY0pDZHRLTmRWZHJuYVlmdWRvTTc4?=
 =?utf-8?B?dXNJSTRZTnFveVFnQVJMVzlvMFFxOU0veUxkMCsrRTlpeEpHa3o2RVZFajRZ?=
 =?utf-8?B?cmlzMG9VSTZzdzMwbndNZFpJNGlhNDRXZjl1WXYxeEJzU3FZaXAxMUl5WnVl?=
 =?utf-8?B?aXhHTE92bk1UUkprMVlFbUd6MFRQaEM1UEhmaWIxa0xoeVNlclBPYVgzeGZt?=
 =?utf-8?B?M0gvUC8zeC9pUTFxYThxc2o4NWE4akc5Z2FiRjg2N256c3JKaGRwSHJwSU4v?=
 =?utf-8?B?QStqYmZ1VXRNR29mNVA2dEZFcUVQeElWMmNScVdTb1paRGRnY0t3RHk2K1NS?=
 =?utf-8?B?R2VBTGY5cTM1QVNxV1J1ZjFkWk5EekszZHdrVkl2aWlXUFppbUV0a2JVNWdr?=
 =?utf-8?B?c0R3WE1oRlEzRFQrZWpzMUx6b3NpUFFrWVpPcWl4ZVloUm1qU29QazByVXJa?=
 =?utf-8?B?a2RvT0RBejNuTjh1NkdlVTF1MWQ1ODRGRitOejlNU1plQ3A5THQxalZUREIr?=
 =?utf-8?B?R05MQlgrdE1MVjBaMndzK2NibWowcXBoaU0rc2EyVEpFbFRsUVh4RGxRKzZW?=
 =?utf-8?B?VURDQ2RBZUp6cFNNWGxOcHVOZVV4eFNIeFlRSVdKMUd6S1JjNEhsaFJ5TmJZ?=
 =?utf-8?B?djBOUG5MOU50NDVmUEFaY0hYRVZ5eEEwUElITWNRTlRYa1ZlWElGay9HUjZu?=
 =?utf-8?B?OUFOalR0eXpXbFc1aXQ3UnJBU1lWZHJtalNpb0F3SUZlT21SWGFlaTRWLzJx?=
 =?utf-8?B?OFlKWUEyN2tFS0xlbFNqOTVLQS94aDl2bFZkQ2x6VzJhZTE5L0diZkJlYlFk?=
 =?utf-8?B?MkFMcVp6T3ZLK0o4UzQrWmtvSDlpMWJ3eEthM0w5QXZkOU1Gd2FyclBFUTRI?=
 =?utf-8?B?T0VoVHY0dU0xaWdYWXJYRGtram5GVk9hN25KMjhyMVZYVEJXeC9EWmI5VEJ1?=
 =?utf-8?B?b3hiSXVSblFCNmRlMmRRck03UlJoY2xNanI0Q05YL2ZxVll2NkdSZUFsNFhm?=
 =?utf-8?B?WTFvUGl5M3FTQ21oNXhMMS8xVERVUFY0Y3pYY25SYzFrVWFubXJERFJjdklm?=
 =?utf-8?B?R0JabzZ5aFMyUjM0UXZMMlE0b21HZW1wUGRhVmF3VUhUZUFOeEhybSs2OFlW?=
 =?utf-8?B?Z3FQYXJ4MWxNaWlGNnk0VVQ1WGZMNklEWG1yM0JuQ0xrNjJtNEdZeXFlR2hi?=
 =?utf-8?B?QnhocUY2WDNseU5rbmd4MkVuMFhPam5FTTU2QjNLSFdMbFFSTDVkbGlSS1Jy?=
 =?utf-8?B?V2ZncGRnekdFYU9NSFBMNXp2a0VwY0lqY3VhaERjR01wOG5XOW01bFFNeGdn?=
 =?utf-8?B?MXZiSEN2OHRieGdac0VmdXAyL25ML1BWQXdhY1JPa29MQUZHaTN1SHVRY2hp?=
 =?utf-8?B?NUdmNjNxUW5RVmFRdVJYY3B1a0pMQWs5Z2VNaCsydUxkMnVGYjhMWFBVa2ow?=
 =?utf-8?B?U2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d7dfeb-1e2f-460e-ac1c-08dcec73db4e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 17:15:52.6717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ShZEpuH92oeDVNf6Wz/P/JSbqx5KaRo85Q6/XTES8L10gZGq0ud0ny9LNtFSzU/xq/CcSUvwtbaaYEZjGsd/zJelEWtXyIHhOyUdEKUyV3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10945
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 17:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205790

Hi Bruce,

On 10/14/24 3:45 PM, Bruce Ashfield via lists.openembedded.org wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> 6.11+ uses truncate as part of the build. While truncate has been
> added to HOSTTOOLS in oe-core master, it still is possible to
> build a kernel recipe newer than 6.11+ on a release that doesn't
> have the HOSTTOOLS tweak.
> 
> We can test for truncate and condtionally add the dependency.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>   meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> index 292897ce43..752d108bd8 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> @@ -44,6 +44,10 @@ PACKAGECONFIG[dt-validation] = ",,python3-dtschema-native"
>   # we need the wrappers if validation isn't in the packageconfig
>   DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'dt-validation', '', 'python3-dtschema-wrapper-native', d)}"
>   
> +# 6.11+ uses truncate in the build, so we need to either have it in host tools, or
> +# build it ourselves
> +DEPENDS += "${@bb.utils.contains('HOSTTOOLS', 'truncate', '', 'coreutils-native', d)}"
> +

Nice :)

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

For the sake of completeness, truncate is part of HOSTTOOLS in 
scarthgap-5.0.5+ (yes, not released yet) and styhead and later releases. 
We may want to backport this HOSTTOOLS+truncate patch to kirkstone as 
well maybe? So this patch here is only required for any other scenario 
:) (it's basically not useful for master branch but is nice as a hint to 
user trying to figure out how to compile 6.11 on other branches :) ).

Thanks!
Quentin

