Return-Path: <fhoerni@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F36C7EE31
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 09:24:27 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.130])
 by mx.groups.io with SMTP id smtpd.web10.4258.1750757061799194929
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 02:24:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=N9fcUa36;
 spf=pass (domain: witekio.com, ip: 40.107.20.130, mailfrom: fhoerni@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lw9arP0mqb9xI+lwAAETrjMzkdajHA8v7eWXTO71sfnepQMhkO9lJHLvH07gxG6aIyYKVbqEN5oDmqhE6E/FTrRmF/GHZvzHeFBFSan26ITr4OBjGmrnGN3xdFS7paA0upPbbvolca3BHBHZzA3nS7ILrgwb1db+Wl6ssJ9v8uW+KJsYdBJr3dxKB+pneIT3C1PDIIVhFHKU5iZ9dAgeJcmXiXvZSKMgyUr0Jufr1nFypFpP+uCtgu+ueGwdR3ON2aLBMlwl5fRru/ejz0pohw2pSlVTz/njoKLlKaoDwGBye4Q+Y4YPOh2P4csIyEXZNvunG/04dY+n+xnYi/46bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMaqAIZyLDMYso64zsxL+mPilF7CaMi1mN59tGqmrS8=;
 b=NCcDR/jLlqyfP0Kx9jlk0A3dr09juxjeeoZE8vTgjOZWlDYzY983dyaY+FEdn6SCVGbbQKT3uLHfJScwZ+fiBGdgN6sqRDqKPnbKG+uPYy+A3aate0SW5dBzm8LmLC1ERZhqwaxsjspYAragsl8dhskH6MgH7UI/xvBmXmbON+jKlW0rN809XZwH8Z3PDfDGLHfVNokFVan/XzM2DWy+GsFk0BkykltLu36LQEBhctrJkgBR9L1o1TX3CjoNNbhWJoe4dzABAVZe72uc2VdWMhi8LVFl0lM1Bs8Pij+LprDIYHBuEEyC/C24IV2ouAbM9Tz8J5IF+HxgKtxZKXS29g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMaqAIZyLDMYso64zsxL+mPilF7CaMi1mN59tGqmrS8=;
 b=N9fcUa36aaYHOO0DRSfzQMFQFcj6cYpaLzc9iQl7v6CAObKrRrqtk1DGcvl30ODtPOXeUjvKwlFngHRHl7Xvuvi5p2NbD53LLO1zMHv0m/sz6N8CsiQgD5JiCNaEvjaGb69vRO0OBhOOKpDteq3Fl8IjbpJQ3kyTVlOPGqb6dLE4fVt27SkEvEVagdKyWiSJcUv6aXhBDaJFkqCTz6XJ2nin5hgJJ22jJ7zsz7PGnxz6MYAnz0i8Ijwf0clzrSKGOwKz7lClOTZKUUbljHi8n8KIQYtQYLWdkJifxb77kQ9LTyuWf1zf2Dzz7YGCvuoAZxpp3sBnGvhR+g6xmhTDLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from PAWP192MB2225.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:359::22)
 by DB8P192MB0597.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:168::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.15; Tue, 24 Jun
 2025 09:24:18 +0000
Received: from PAWP192MB2225.EURP192.PROD.OUTLOOK.COM
 ([fe80::8a5a:c9f5:c976:7b14]) by PAWP192MB2225.EURP192.PROD.OUTLOOK.COM
 ([fe80::8a5a:c9f5:c976:7b14%7]) with mapi id 15.20.8880.013; Tue, 24 Jun 2025
 09:24:18 +0000
Message-ID: <50743f52-676d-45fc-a1ef-62e624688536@witekio.com>
Date: Tue, 24 Jun 2025 11:24:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] image_types_wic: Fix file-checksums for missing
 files in search path
To: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
References: <20250623142626.2914459-1-richard.purdie@linuxfoundation.org>
Content-Language: en-US
From: Frederic Hoerni <fhoerni@witekio.com>
In-Reply-To: <20250623142626.2914459-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P191CA0008.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::13) To PAWP192MB2225.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:359::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAWP192MB2225:EE_|DB8P192MB0597:EE_
X-MS-Office365-Filtering-Correlation-Id: 717559fc-3f2a-4477-b50b-08ddb300e4b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZDBLYllnbWtmZ052dHA2cUJVVmVnYkV6dmpmTlNYZ1NyZngrbVNZeEJWam1w?=
 =?utf-8?B?ZUlPS0piTXJ0eFpLN1hkSFhpMTRnOU96SEk2UUIzOTJmQ1F1aWRLNzRGUVIw?=
 =?utf-8?B?akM4ZDVCTXNnSGNPNmpET2VkWlV2T0tQT0ljYVJWa2p0NTJuUWRCWGV6WEl5?=
 =?utf-8?B?NFpVdnk2N2hTeVVoZktXaXFaSU5YMFNBY3FZZXVjRWU1czZsd1JVZjQ5OSsx?=
 =?utf-8?B?bGJTRXNIdUxIWUhkWDJ4TFJ0UWlIRDV2dTArNFUxM3R3UTNpZ1hpN2hsM3U3?=
 =?utf-8?B?YkpiNnFqaURQK3p3clF1ak43enlRVXEvL2hHb2hSK3hTYWNyUkhtZERsbS8v?=
 =?utf-8?B?VlRrWW9ROW52bzdhbGpsTEI4eVpuemEzRnVZVjBqZHVCR0pSbkFkUnhCZVRV?=
 =?utf-8?B?RmNnT25DU0Q2QU1lODhINVl6OERCS01iY0JoaVBlMzJKdHBWWGdkRDh6SmxY?=
 =?utf-8?B?SFAxUDk0czVoM2MwZStzSENFVkREYmNmZnloeWUrTjVZbFVpemdWYlRXa0Y2?=
 =?utf-8?B?UU1DbmQySURjL1Z0QlpSY2FMbmp2TjdvQkRhL0xHb2VmbnZsMldLWEdwYmJE?=
 =?utf-8?B?R3dmYUJ3Vjc5bzdmdmw2NEZxK0p2dytuNmNnVFRacWM3enNIb2JYSGFQbXVu?=
 =?utf-8?B?dUUvK0FjQXV1cTdYWkFVOGRMTDhzWExROWdGRC9Qc2xxRHR0TkVRR1hlOVQ3?=
 =?utf-8?B?Vktxa1FJUXRnTFFUYnlCbzdNZjBsdGpLU2pJd3pEamNsRWdMdmJSMERsaFFj?=
 =?utf-8?B?akZRSTlOaUpBbkZ1Tk1ZN0NlNGRkTUNwYVlMMVovRDZXY0JBTjlyRFQxRndR?=
 =?utf-8?B?MDVNSUJOaDBNVlptazlKRjcrY3JGcHB5dmsweVhOSkkyMS9yRGQvWVhzczBE?=
 =?utf-8?B?Q3hRdWlaT3pFb0UwOHVmVjlEZVA3U3pQL0toMGZGc0d5MGRnaExaSExCL29q?=
 =?utf-8?B?RThlZ3RYUGcvMkk0bFBtLzNUTG5zVkdsVkt5MGpkR0dSbDVpaEpLcDJlRmdH?=
 =?utf-8?B?Q1ZBbDFZZkhlMGV5SUJrK2FPVTBON2ZiV1VEWDdBWWdxNlc3NXdteGdVWmNY?=
 =?utf-8?B?WkRmSWpFVEVhVU00QXRPbmdxbUdDeTl0VlVjLzlneTdnckRHWTVEQWlQQlF0?=
 =?utf-8?B?SUxXQnc4VkZ0ZlA4aUZOcFN2RURHcjNUWlRVclBJcTN1ekIzRlpFSkFMZ0dM?=
 =?utf-8?B?OFZzOEhBcU1UNms1aTc4cVNZTFJNMStEaVZ0RW5FMVQ3alVsdStMazNCS0Fx?=
 =?utf-8?B?WDUvYzczZ3o2OHJRWGQ3ck5kbkZqVWE0MnZSZkdFZDZJdU4rMUZYL1JtTnkv?=
 =?utf-8?B?aURwQVl0WWw1MmRJdnAzak5XM3gvcGZFR3pWSk9LM1F5bm9Qdkw0MUNxazAv?=
 =?utf-8?B?eTQvdjJLUTF6MDRWTUZwclU0TUJucXNTby9pNUR1SDJaaFFBTmVJeWRnU2la?=
 =?utf-8?B?dkpJQm96allPd1BiakJ2bmdSUWs5dnY5ckFlUDR3dVBVQUE0d1l0VHlHQm90?=
 =?utf-8?B?Z2dZQmdVOW1tNlV2NGVOOEhUQnNLVGtIRWFHVnZEWlE2NGVjWjJSZllRUkRn?=
 =?utf-8?B?YmZtQ0VEQ08wZ2YxQ2YxVUdPRlBtWWM0TzdwTWYyc3ZpaElEbnF4RHpGbEkr?=
 =?utf-8?B?dWFKb3NlOWNPMW1WVmRTTDVvTC9nK1owWUczSUhHWExPeGVUTDVtcGpnT3FV?=
 =?utf-8?B?RUtPaGgvY2dudE1FcHhGOW5CdTNxZko3VENwZW9ONU1hRVJneVBVaU5IQkxq?=
 =?utf-8?B?ZTZtbkJhSFQ4MDlGbWdsUGRrNDBXeEtxZ1hCbFpFSm1vNWxhdWlNMVpjMm5t?=
 =?utf-8?B?UFJpM0NXWENFTFR2bGk1VjVtdUMyQ1V3V0hKQzN3bHBhL1I3bzRGaUlpaFh3?=
 =?utf-8?B?aHoybEV2U2MzcGIyWGtZdFQ0VlNLL1hMZ2d0RFVnRTRzTWNnZjhVV082RkpT?=
 =?utf-8?Q?hKowEt/vZWE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWP192MB2225.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T1ZrNENxRTZWTkY0eEpQNlgvYXZsOGV4QU5WTXlwTm9RRWNQK282UlBqVDZL?=
 =?utf-8?B?WVNlR1R0ekwxcjJFV3kyUGRKalFPNHRnTVgyeFcxUklHWkR0V1lwUk5PMy81?=
 =?utf-8?B?Mm56eEtDL2ZGQnZQajZvNm9FbXlUM2hqOWxhK2w0RmZtdVBTaWEwdmRUbnpr?=
 =?utf-8?B?d3dycmFIbkFlclRYcDVXcHBsYy9vSWtTSXFCdFloaHFxNDY0eEdiaG9LajND?=
 =?utf-8?B?c0o4bFpvdnpVOUFxUUtjcy9lU1FoOUYyZmhvS040OW5nemkzU2Y0Vm1jejlp?=
 =?utf-8?B?eXg5SCtKQ0Z1cWcxMnJwOFpqV3NoRnBLSndNNUFNZzRRaGgwRjBIZWtpTmtv?=
 =?utf-8?B?YWpHOHpJb1ovV0prZ2pJcWNKVTl2d2hDWmRFdEFRYzVpaFk2eTFVdERyYktZ?=
 =?utf-8?B?aWJITkJrRlJTKzhIOXNyeHA5VHlNQXUwb09CMFZudnhkOEo3Y1U2UndPZUpa?=
 =?utf-8?B?NmpxQjhjdzRxUnM3d2wyTzRic3FGclh2a3o4cXRtZThLUm9OWEZucWJlOUFx?=
 =?utf-8?B?YXZuNjFoa1NUdDh6anZmSnJaMU1zTkhmeEEvem53dzNEYWk5WTJiZ2p1enhN?=
 =?utf-8?B?V2s4Nk9BZ1NhZGFCSSswY0xsV0Q4VndkYnhrRVZldFJkSVUzMVRLbjRhZFh6?=
 =?utf-8?B?K2kyZ1BzWGNDeW1uY0NZQnpaR0pIdkdIR200eU5IU3doSGVNN1pDSW5GU09o?=
 =?utf-8?B?NjZuOHB1OHlnaFF1WEd4aXpDY0xtRm5vK0FFZ2NJdHN0dS9SMXNnVUFObm9k?=
 =?utf-8?B?Skx1MTBpbDFwcVRJOUcwM0xzSWRjQ0gvaEhEOWdENkUxNXU2MW02TFVYYXFH?=
 =?utf-8?B?QnhyNHo5QzRVM1hTM1dxdnBTV1ZtaTRVTEhQZnNJV05lNmJrV3E5ZjFBZFBR?=
 =?utf-8?B?ZEhZeUFmUFR1QzQrNlRhMldMbTVKTk40L1l1YURvbjFja2l6YkxxUnFxV0xM?=
 =?utf-8?B?Y0Z1aWhKVTdBbDlVbUN4bnBiWVlCcnNWb1dOS0NhalV4RDd6dGVOTHpyVzZ4?=
 =?utf-8?B?WVB3L0VkS0Q1dXdWQnd1bDl1eDRrUGR4cUh3L3gvc3VOaCt0VTlyelhyTjJ2?=
 =?utf-8?B?ZGg2dXlUVVJFODFDRHBWbmtJZEpsSzJBNDBRc1RuTGpYVGVHWVZHZ0Q3SWor?=
 =?utf-8?B?RlZlSmxPakZBR2dBcEJpQkE0cWd1cFNjbGtqNUdLV2E3aVpSMkw1YVIyUC81?=
 =?utf-8?B?VzkwS0NscHpVUXlkQ3ZqblBNSjZSWGxpd2hMMTVNKzc5UXhFdHYwdTBhb0FW?=
 =?utf-8?B?TFhmMmx1eXpsZ2VVUEZxaDlkMTdKRjJaYVZ3VnFQcmxyNUIxKzk5Vkd4ZnhL?=
 =?utf-8?B?a2FDS3U4UDAvTmpxNWNmZmJiVEFBbEFWSlQ1SjREWGpwUTk3TUpOV25XVXdB?=
 =?utf-8?B?aXpNbUFiWWJBYTJYZ3NXall4dTJPQTNVSG5wd3FWNjVGRnNoWm91c0pnZ0Ur?=
 =?utf-8?B?N0ViWGkyU3lNSTZwdk80YnhraW5RRWlVcll1QUw3aDBTL3M1S1lEby95R0dr?=
 =?utf-8?B?RGttd3ppQ2paVVBIcnZ0Q0xYd25sSFdYdmo5WkMvL3M3dXBxaHRnd280aEN4?=
 =?utf-8?B?ZmFyQlVaN2NLVkVaUWJwV1YxY3M5UG9VdkNYeVA4UXpCem1WbGtlTG9zSTFW?=
 =?utf-8?B?WFZrUm5JMnlTRGJrNFpxdHhsbklLOThvNUkzdStvNnllV3B3a0NvSE9Ycnkw?=
 =?utf-8?B?b1huaUJ3WmZzNzBiRFdBV0NpWmpQaDVmejRQTE83STNOME11c1J4aG15U3Zo?=
 =?utf-8?B?WXMwMDViWS9SVXVPaGJRUjhEYU83ejMyKzI0L3FiSWhSZE5SdU1yL3BYVXlD?=
 =?utf-8?B?R00yNHpJQjh4aTFLUUdKOWQrZUlvVVNBQ2tnWmU4SVd6aXJYbTNaeHEwaHZl?=
 =?utf-8?B?cnFzRzdzZDlHakxGelRId0Z5cUhSV0IrMDFETWNFM0R6T044Y3QzcFFoQTRs?=
 =?utf-8?B?NmNSd2dhclQwSnd2M2gxQWVKckRsRnQ0VnlacUNVeUVielEvK0ZXcHc4d0pS?=
 =?utf-8?B?ZTdGbExQZVZEL2xEUG42QSs4ZXVNQjE3dnNMajdtZlNFRVlNSkNHRGdkTDZa?=
 =?utf-8?B?OE9jN1QrUjNUOGFjbzlDeFBWUGlsa0pDcmVRbGNSemh2b2ZqMU1sZjJTSG5p?=
 =?utf-8?Q?JfAkbSGI3XPxfhcr1AwPnOg+q?=
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 717559fc-3f2a-4477-b50b-08ddb300e4b8
X-MS-Exchange-CrossTenant-AuthSource: PAWP192MB2225.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 09:24:18.0692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v64DvwcFap2DZBC4ZOiRdxytDO0X0U4eFtfdpO14s8YzIHC/6yHoPPzxJNJZWjSDt3AoldxCttnvrvnqWIER2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P192MB0597
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 09:24:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219238


On 23/06/2025 16:26, Richard Purdie via lists.openembedded.org wrote:
> When we tell bitbake about file-checksums, we need to tell it both the fi=
les
> we look at that exist, but also the ones we looked for but aren't present=
.
>
> This means that if files appear earlier in the search path, bitbake can t=
hen
> do the correct things like updating the taskhash and re-running the recip=
e/task.
>
> In this case, wic was only signalling file presence. This patch adds in t=
he
> files it looked at but didn't find too.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/classes-recipe/image_types_wic.bbclass | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-r=
ecipe/image_types_wic.bbclass
> index 740ed946f8f..6180874a4cc 100644
> --- a/meta/classes-recipe/image_types_wic.bbclass
> +++ b/meta/classes-recipe/image_types_wic.bbclass
> @@ -57,6 +57,16 @@ def wks_search(files, search_path):
>               if searched:
>                   return searched
>
> +def wks_checksums(files, search_path):
> +    ret =3D ""
> +    for f in files:
> +        found, hist =3D bb.utils.which(search_path, f, history=3DTrue)
> +        ret =3D ret + " " + " ".join(h + ":False" for h in hist[:-1])
> +        if found:
> +            ret =3D ret + " " + found + ":True"
> +    return ret
> +
> +
>   WIC_CREATE_EXTRA_ARGS ?=3D ""
>
>   IMAGE_CMD:wic () {
> @@ -98,7 +108,7 @@ do_image_wic[cleandirs] =3D "${WORKDIR}/build-wic"
>
>   # Rebuild when the wks file or vars in WICVARS change
>   USING_WIC =3D "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.j=
oin('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
> -WKS_FILE_CHECKSUM =3D "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_=
FULL_PATH}') if '${USING_WIC}' else ''}"
> +WKS_FILE_CHECKSUM =3D "${@wks_checksums(d.getVar('WKS_FILES').split(), d=
.getVar('WKS_SEARCH_PATH')) if '${USING_WIC}' else ''}"
>   do_image_wic[file-checksums] +=3D "${WKS_FILE_CHECKSUM}"
>   do_image_wic[depends] +=3D "${@' '.join('%s-native:do_populate_sysroot'=
 % r for r in ('parted', 'gptfdisk', 'dosfstools', 'mtools'))}"
>

This patch fixes my issue.
Thank you.

Frederic

Witekio France is an SAS company registered in Lyon. Registered office: 14 =
rue Rhin et Danube - 69009 Lyon. Registered company number: RCS 518 864 012=
 00035. VAT number FR 68 518 864 012
This message contains confidential information and is intended only for the=
 individual(s) addressed in the message. If you aren't the named addressee,=
 you should not disseminate, distribute, or copy this e-mail.

We continuously commit to comply with the applicable data protection laws a=
nd ensure fair and transparent processing of your personal data. Please rea=
d our privacy statement including an information notice and data protection=
 policy for detailed information on our website.

