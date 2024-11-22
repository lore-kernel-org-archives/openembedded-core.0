Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA19E69175
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 16:22:37 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.59])
 by mx.groups.io with SMTP id smtpd.web10.28255.1732292554772708368
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 08:22:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Dr7lr3Tf;
 spf=pass (domain: cherry.de, ip: 40.107.105.59, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AyxpBkepV8rKUaX6OrzWrGgVY2TDuKvTNOoyLdhwLvC9d1zYtzY8fl3c2mpz9fyY4DV+RMPpZfOtxijFLJvvKIpi2mmIrdBi6epdxtLDpktAqPBMIMYnip+CJJRM/ATuFlPa8JegV+TgP+hb9crKldkfVvY3n370tovsqe+1RRjaM64zzZ+mGOJDEoqXojCQTp4rlUYG8QOdHqy3Cp0rRN47/ZsVuHsJW/hZoOAUgqcYMwNyYyKU0JNc20kW75gJVm7kFm6Sl5hsHMKa+miTNAsswzLyPTSSJRJA4/hAU/We4/EVEqioXN3KvA6lTri7EtB1hRWEADGRueFuqATXLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cuCJVL8LTDTcUcFF0FpllJoCamLWsUVNB0P30zavscs=;
 b=dFbjkIj4xfiwlbTDDNo/fvcKOmTrVR5zrUaHxXXHG/5A2N9qlKxRoYw3oXOh8eNGR1o67aksV1CO/WcQpZ6xVEPhuwyA6FnQjeZ6x2bnQdCNGkCva5oLGQZ847WKY+QtsRUs1vA2M/MZheNBBspNAa+0KV05tnsZT/JZwjfYbyC/sJ3/7pQMaZkD5Bi7DBT20wjNglsbnbr49ku1TsgFxXta+ypV36r6d1CEsJ9itVtSFHSjw08S+/kc5lk+Wp1nOO03wEF64gr6ge6N7tHp0QZ3KvDfoPxaUMjFAslBiOJ86QCgvkbe4LJQryCyzn8TG7rAlww9U+O99PZFoGjhnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cuCJVL8LTDTcUcFF0FpllJoCamLWsUVNB0P30zavscs=;
 b=Dr7lr3TfE1o0K1kK4QT9xKEWq77Jn0n5Sm7i+Jd+NFx+Jr9+W5KTlvdTUJ3pJcLBm3BDaRxp009EzqoHXNkYP/G/moORajZybpTrHNJlwgXtDM0kJGirRihHeU28DEXRE0SwvTq7OGvdtJUseZjStGjV3T32mCcwoa6zv27bvtA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM0PR04MB6834.eurprd04.prod.outlook.com (2603:10a6:208:17e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Fri, 22 Nov
 2024 16:22:31 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8158.024; Fri, 22 Nov 2024
 16:22:31 +0000
Message-ID: <15c5416b-52d1-4dfd-b76a-62d887a7ac90@cherry.de>
Date: Fri, 22 Nov 2024 17:22:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] spdx: Fix SPDX tasks not running when code
 changes
To: JPEWhacker@gmail.com, openembedded-core@lists.openembedded.org
References: <20241122154939.2133845-1-JPEWhacker@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241122154939.2133845-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::19) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM0PR04MB6834:EE_
X-MS-Office365-Filtering-Correlation-Id: c416f0ff-9bf9-40b1-9920-08dd0b11dca5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UEkrVDBIcGt3Q2d3QUdrM3QvcXJKNWI1SzhiSjlTOStnM3RrNmVvTElwd1BN?=
 =?utf-8?B?ZWtpWUltWEdiVE9tZGNLa1puL0M2SERGRWpFM0liS1FsUWRLVERZNUlPRmxu?=
 =?utf-8?B?dDZreGljOUlKdll1N3J1YWQzOTFJUzNqaWE5cExOZ2NFT0l6cm9KK0ZiZDN1?=
 =?utf-8?B?R0c4UDUxb21PNk5zSWk1RUR5VjlKUWF5WVhPSUN3TmVKejJFZWdOTkpUNEkv?=
 =?utf-8?B?b3d2NjRTUnoreGlNSERIcGNmbEpDL0U4V2JkbzVsYkY2b1RGK2l0TDhhYlhV?=
 =?utf-8?B?U3lYWnQ0a2ZnU01NL3hkczN0VjlwajRhM3VTWW9Gdk5hNUF0ZDJPR2theVN2?=
 =?utf-8?B?TUNZUmQ0aTVhQ2lFaVI1d0QvcTNWck9rZzdhd0M0MjRkV0lrMXB6L1loWWZT?=
 =?utf-8?B?VWM1ZjFyTFJZNEFhWVdpWUlKbFZWem4zUjhSRVppU1hvenE1d0xXN1VZL1Jz?=
 =?utf-8?B?cFV0M3FSdGZ0MVA2RkkwSVd3LytOSkVLV0E5Zk9jT3JRdlM3WGRQb0ZxOG5y?=
 =?utf-8?B?RTVhcjRhU2ZZVGNQZ2ZtTmZ2azR6cEljdWVZckpYdTE2ODd0T2szM1lMaWo0?=
 =?utf-8?B?dEtOQ0syOXZUdWhJcTBPT1ExbnYzanBtOWtxQkx0cysvQnE3YisxcFMyZm9B?=
 =?utf-8?B?Z3RES3RGMWUycWFXOS8xT1lRbXR2SWhmUWZobG9tdk1PbCtkeGc1Rk1mTVY5?=
 =?utf-8?B?dWE4cUxacS8zdW0wM3hyWHZ3Z3BVK3VRdzV1N2JSY2dlcjVEeWozclEvSzhS?=
 =?utf-8?B?ZHc3dG02eWx4QVcxcGRpZEhiU202OVNvLzZURCtiZ0ZsUXZQajdYdTZjUFMw?=
 =?utf-8?B?cks0d3BKVS8xazdOTmRydk45a1lZb2tDVzVrUlcwd2N1djRITEUyck82bEVK?=
 =?utf-8?B?R0lYVTd1Z0ZuaUtmemxMQzk4alhyU1RDb1QvNjhPUUE2cHlUclBjN3BldXRX?=
 =?utf-8?B?N0ZYSnZub1JXVm5UWGxKcmUwcmJQK05XZlU4a2szSHB6NzBRdDdyb3FPZVZK?=
 =?utf-8?B?V0QxNnZIUGdtazVmRXE0K3NGTzR0TkZLM3VBOE9mMHRoRWJOdmJvTTYyQ1l6?=
 =?utf-8?B?d0EreXVxMVk0ZThsZk5sbGI4T3cwSGZYaXdDMjNMZ1JYT2RKMmQ3VlpiZlVB?=
 =?utf-8?B?b0tjd2s0cWRmODVEa1kzMitrWG9peGxSYlBNNDJscDVNWGRJQ3NGZnFEdFhu?=
 =?utf-8?B?RHVtbTU4UGh0WGVQM0FENENWejR4dXY5dE5GWkZVVXBHZlNHbzdaQmlqSU1m?=
 =?utf-8?B?YzgyOGNZOEZ6b09zRGNwZ3RueFdkc05DTVI4OUN3dmJ2dnNiUndwSHNGa2I2?=
 =?utf-8?B?NUt0cXk3MHNOZXh3M0wrMVUzYjF2RldRazA2UWVQaE0vdVJWMjZ5RVp4SHUw?=
 =?utf-8?B?Wnc1NWpWa3BpaEVrVXpHdThNdUc0ZGlkKzI2cnhVME8yWUJVQ3UzbW1kK3Fu?=
 =?utf-8?B?SUdBWWxmRTgya21SVHFrK3lWWk40cGRzUnFiYWNVcUhvbmJFcHkyT0l4ajNL?=
 =?utf-8?B?UjN4cDJlTzRRMjl4bUVSbFk0cENFME1rc1V4emlBYmEvNXlnUk5Ud3Z3L0R2?=
 =?utf-8?B?eXZDaE5HR1NjUm1qbFRscTdVMDdaR0ZTd2NMMGREcHdyZzVpVXByZHVrdjJK?=
 =?utf-8?B?SXV6c1BFbVVTVEJ0Q3lkWHQxbEhOckIrb2QyYXd2MHJmMEFjZVJlbktpaVQw?=
 =?utf-8?B?cituYnd5M2pZVktoWWM1a25EeEpRbW5RNmNVQ1dxS0Q0Mmt5NGpnL2x0K3N6?=
 =?utf-8?Q?KuX7BDr5WfCXOby8BQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZFJpUVlSZjBVbU5tQ3psR2JpaEVnazE3Snc4WXJoWkhZdHl4SDc1NDF1SDRh?=
 =?utf-8?B?NDJBSUh2Rm9SZUozSnkyaUdIdG9WZGZBdW1vYUVuRnVNN3BvOTkxWlhDdWk1?=
 =?utf-8?B?bkpUM0dvbnQrNVY1UXJpQThRTmpUK2JCTDhzS25LZk1DNjlZelZobHkyTzFR?=
 =?utf-8?B?OFpuVlRyc3pBRnA3U0VOMGVsODE1TjNvZ3ozcXQ2VWZsaVUzbW94UEM0M0FX?=
 =?utf-8?B?WTdQZGk2Q1dLL3RaVndaWUw2UlJGdnpaT3VNdWs4cUd4bTRHNHJPazJQbjNS?=
 =?utf-8?B?dVNaQ3lCeVlhY1FGQ1Z1MTFMRThreDVMYm9FZW1NSUR0cmJzS0hVWWtqc1Vl?=
 =?utf-8?B?RWhQVzVuejZnNEh6U0ZMRUwvVWUrL3YvR0FzQVQrbFYvbFl3N0l6ZVhFVVRr?=
 =?utf-8?B?YTlVU3ZjQ1ZhSGt1bjZqNGtZWU5zTGVPUzcrTGNJWkVCZWttR09VR2lnUGVD?=
 =?utf-8?B?bGUvbndGbjJ5Y3hJYm5PU29McG4rS2dsOTRKQ0pidndPQWFqMndUTklZQ3pq?=
 =?utf-8?B?ZW9Wc3hOdGF5ZXdlWTRWTEhXK2wvSjEvZzFYdjF3bkVwOUFvUEtyKzBUcW1a?=
 =?utf-8?B?enFKdDJmeVFia0hVd2NDN3RsY0FVdTFQMjZweWxSRTlJUHhxZS90d1J2enBt?=
 =?utf-8?B?MEtTTFFMN0VGY0pGWVpmdmtJU2h2SnYvMHRGbC92VTMzRFFwdkV0QlA1aDkw?=
 =?utf-8?B?TXIweURpUE81OGsyb0JKaTRuWGtqckI5OWM3WTJOYWpnVlAyd2YvajVwaTJQ?=
 =?utf-8?B?dEhZbENiMU83aE9jaGNvOEs2U1NuQ0U3QXU5Y0RsTHdteGlwRm5ob1BLbUpI?=
 =?utf-8?B?ZGgxbWNMOGE3djZ6OWppQTREN2psZ00wRWgwdWduUmdaeC9UTGswdkNCRGxo?=
 =?utf-8?B?UEYvNVd4cGdoMkxHRTVtM25ybHg4dWt4WHpyenNTVG45c0htZmZMaUdWT2FF?=
 =?utf-8?B?YzRzK0hITW9CQmtrNjhmWk1Yb3hFazMwblhpZE9kQVJkblMwazZOV0kwUXRX?=
 =?utf-8?B?dHRjQ3VKUWJtR1ZHTmptY1hFWCtmUEtuZTJObCtiTGNFZDg5ejY3M3czYXRh?=
 =?utf-8?B?bVlMdEdqMnFlN1lHZ3ZxUDhzM3VNNnd2SmRxaGdCRFVuOUhGaldTWm9hQi93?=
 =?utf-8?B?eTRoejhYVjRVblRBNnQxRUJwY1pValdBL3FBRUNjemEvQmpZN2J0am1Pelpo?=
 =?utf-8?B?WjJYOXBBb3BWTUhobzBIdVU2Wm9ER0NGZXFBSlBqYlZhc0MvYkphZWdLWmlv?=
 =?utf-8?B?bWNVY0dHdEZ6YThZS2RlYnJXSmdwOFhIaWZkSXNIRS9mQ1A5bzBYbVc2MDQ5?=
 =?utf-8?B?VFdPTkg0STNGdCs0K3BCNC8zNlNST0tHeFZiM1BmOG9KbkhZOUxpK3FiNmxq?=
 =?utf-8?B?VEdtdXJjd3pzc09qa1dkYjZGZjE5YUh0djhtaWlvN1UxcTBCYW5oSENWSlp5?=
 =?utf-8?B?WEs3NldJcW05Ri9kWmxBVGw2Z0o5YnY0QmpIVUpBUUNHZlNjSWdqcGpkM0Z5?=
 =?utf-8?B?Q2lFelNRUEZWakJjRDNCRzF4eU9Ycm92SjlqZkt4Wk5kWHNPTm9HTGpaMG12?=
 =?utf-8?B?bTFLU2VJYUkyNHhlMHUzLzU2blQ4aVVLNU9oZWJ1bGQ1bDVVYUVLN0x0and6?=
 =?utf-8?B?Vkt0dDd2anJpU2lraUUrQlJEOFdvOXdtZXZiRWRWWTYrdmhIV1hsamoxOWJC?=
 =?utf-8?B?cmR5cDIrVG5IZzFEUXdyenlTeEl6M2QzdzFrV1AxcVlFSWY4NURMNWxFcGtO?=
 =?utf-8?B?NEdzcGNwWHY2cU1LSmgyMmduam5hWlV4aTltMkdrVW5yV1hIOUExVUJic1Fp?=
 =?utf-8?B?UVJOYVdnTjlhRXZ0Q2c5RWhpR1U5M3A0Mm1kSjFPbCt2d01lTmNsaUdSSmxt?=
 =?utf-8?B?NkVVSHNneWRUMTRMUkR3VkZ2SFVlVTBxV3VjbytSR0xSblJaWEd4VDE2cUFl?=
 =?utf-8?B?K0hpNHl6bkIrRklYU1RDeENoS1ZNdmtpc0VMdlR0S05vVG9SalVqVFpUOE96?=
 =?utf-8?B?NzRDOEJYeDVveWFJem5BTHpUNU9VWFdONDhHbDZ0S255RXc1Q3E1OHlXZ1Iz?=
 =?utf-8?B?WmRTeHpqNUpoSmltLzVVUk83cm16cWFmYzlxcENlcEtDamJBNlM1Y2QySm9r?=
 =?utf-8?B?eTd2THB0Z0l6RzZ3NWJWSStMaGN5b2xMUHdHNC94dFVWKzNZcElUcWx1MU9T?=
 =?utf-8?B?R1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c416f0ff-9bf9-40b1-9920-08dd0b11dca5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 16:22:31.5773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o2VaOztAlBot9KHF7nFtgOgrKqkDDKMCrM3ERa70djcdhL5nXJkNYWCr/Q0T1JpPK5pcGqhQBwn8Yf+H6Ycp6DCzGQQw50B+C44fCGi/y9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6834
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 16:22:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207628

Hi Joshua,

On 11/22/24 4:49 PM, Joshua Watt via lists.openembedded.org wrote:
> The SPDX code makes heavy use of python classes. While this works very
> well, the bitbake dependency parser is unable to understand how to deal
> with them, and thus changes to the class code do not cause rebuilds to
> occur. To correct this, add the library files that include SPDX code as
> file checksums for the SPDX tasks. If this method works well for SPDX,
> we will look at implementing something similar in the bitbake dependency
> parser that should allow correct checksums without having to explicitly
> add them to each class.
> 

Oooooh that reminds me of this very issue happening at my previous company.

I'm wondering if we shouldn't just add this file-checksums dependency at 
the global level somehow? Since one needs to call addpylib 
layer-dir/path directory in order to be able to import those modules in 
tasks/functions. Maybe there's something we can hook there somehow? The 
issue being we would either blindly reparse/rebuild all recipes when 
those changes or we need a way to check which task(s) import those modules?

Another option could be to forbid addpylib on a conf file and force it 
inside recipes only, but I guess this means we cannot use those in 
inline python in conf files anymore? which we do use in 
meta/conf/bitbake.conf.

The change itself looks fine to me though, wish I had this idea at my 
previous company :)

Cheers,
Quentin

> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>   meta/classes-recipe/create-spdx-image-3.0.bbclass | 3 +++
>   meta/classes-recipe/create-spdx-sdk-3.0.bbclass   | 2 ++
>   meta/classes/create-spdx-3.0.bbclass              | 9 +++++++++
>   3 files changed, 14 insertions(+)
> 
> diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/classes-recipe/create-spdx-image-3.0.bbclass
> index 18e6cf6dfa2..51446162857 100644
> --- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
> +++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
> @@ -36,6 +36,7 @@ do_create_rootfs_spdx[sstate-inputdirs] = "${SPDXROOTFSDEPLOY}"
>   do_create_rootfs_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
>   do_create_rootfs_spdx[recrdeptask] += "do_create_spdx do_create_package_spdx"
>   do_create_rootfs_spdx[cleandirs] += "${SPDXROOTFSDEPLOY}"
> +do_create_rootfs_spdx[file-checksums] += "${SPDX3_LIB_DEP_FILES}"
>   
>   python do_create_rootfs_spdx_setscene() {
>       sstate_setscene(d)
> @@ -53,6 +54,7 @@ do_create_image_spdx[sstate-inputdirs] = "${SPDXIMAGEWORK}"
>   do_create_image_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
>   do_create_image_spdx[cleandirs] = "${SPDXIMAGEWORK}"
>   do_create_image_spdx[dirs] = "${SPDXIMAGEWORK}"
> +do_create_image_spdx[file-checksums] += "${SPDX3_LIB_DEP_FILES}"
>   
>   python do_create_image_spdx_setscene() {
>       sstate_setscene(d)
> @@ -72,6 +74,7 @@ do_create_image_sbom_spdx[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
>   do_create_image_sbom_spdx[stamp-extra-info] = "${MACHINE_ARCH}"
>   do_create_image_sbom_spdx[cleandirs] = "${SPDXIMAGEDEPLOYDIR}"
>   do_create_image_sbom_spdx[recrdeptask] += "do_create_spdx do_create_package_spdx"
> +do_create_image_sbom_spdx[file-checksums] += "${SPDX3_LIB_DEP_FILES}"
>   
>   python do_create_image_sbom_spdx_setscene() {
>       sstate_setscene(d)
> diff --git a/meta/classes-recipe/create-spdx-sdk-3.0.bbclass b/meta/classes-recipe/create-spdx-sdk-3.0.bbclass
> index ea01a21cc59..855fb3d09f9 100644
> --- a/meta/classes-recipe/create-spdx-sdk-3.0.bbclass
> +++ b/meta/classes-recipe/create-spdx-sdk-3.0.bbclass
> @@ -8,12 +8,14 @@
>   do_populate_sdk[recrdeptask] += "do_create_spdx do_create_package_spdx"
>   do_populate_sdk[cleandirs] += "${SPDXSDKWORK}"
>   do_populate_sdk[postfuncs] += "sdk_create_sbom"
> +do_populate_sdk[file-checksums] += "${SPDX3_LIB_DEP_FILES}"
>   POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk = " sdk_host_create_spdx"
>   POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk = " sdk_target_create_spdx"
>   
>   do_populate_sdk_ext[recrdeptask] += "do_create_spdx do_create_package_spdx"
>   do_populate_sdk_ext[cleandirs] += "${SPDXSDKEXTWORK}"
>   do_populate_sdk_ext[postfuncs] += "sdk_ext_create_sbom"
> +do_populate_sdk_ext[file-checksums] += "${SPDX3_LIB_DEP_FILES}"
>   POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk-ext = " sdk_ext_host_create_spdx"
>   POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk-ext = " sdk_ext_target_create_spdx"
>   
> diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
> index bc23d2d2115..640f5490bda 100644
> --- a/meta/classes/create-spdx-3.0.bbclass
> +++ b/meta/classes/create-spdx-3.0.bbclass
> @@ -122,6 +122,13 @@ oe.spdx30_tasks.get_package_sources_from_debug[vardepsexclude] += "STAGING_KERNE
>   oe.spdx30_tasks.collect_dep_objsets[vardepsexclude] = "SPDX_MULTILIB_SSTATE_ARCHS"
>   
>   
> +# SPDX library code makes heavy use of classes, which bitbake cannot easily
> +# parse out dependencies. As such, the library code files that make use of
> +# classes are explicitly added as file checksum dependencies.
> +SPDX3_LIB_DEP_FILES = "\
> +    ${COREBASE}/meta/lib/oe/sbom30.py:True \
> +    ${COREBASE}/meta/lib/oe/spdx30.py:True \
> +    "
>   
>   python do_create_spdx() {
>       import oe.spdx30_tasks
> @@ -137,6 +144,7 @@ addtask do_create_spdx after \
>   SSTATETASKS += "do_create_spdx"
>   do_create_spdx[sstate-inputdirs] = "${SPDXDEPLOY}"
>   do_create_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
> +do_create_spdx[file-checksums] += "${SPDX3_LIB_DEP_FILES}"
>   
>   python do_create_spdx_setscene () {
>       sstate_setscene(d)
> @@ -160,6 +168,7 @@ addtask do_create_package_spdx after do_create_spdx before do_build do_rm_work
>   SSTATETASKS += "do_create_package_spdx"
>   do_create_package_spdx[sstate-inputdirs] = "${SPDXRUNTIMEDEPLOY}"
>   do_create_package_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
> +do_create_package_spdx[file-checksums] += "${SPDX3_LIB_DEP_FILES}"
>   
>   python do_create_package_spdx_setscene () {
>       sstate_setscene(d)
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207626): https://lists.openembedded.org/g/openembedded-core/message/207626
> Mute This Topic: https://lists.openembedded.org/mt/109724577/6293953
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [quentin.schulz@cherry.de]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


