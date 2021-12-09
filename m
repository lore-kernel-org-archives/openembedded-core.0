Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E1A4C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 15:41:10 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.92.75.58])
 by mx.groups.io with SMTP id smtpd.web12.12898.1639064469300663472
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 07:41:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=WebeSniV;
 spf=pass (domain: outlook.com, ip: 40.92.75.58,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWfyX90XEocvu+FUnWKbX0jV7VrGgLo1EeADJOCMFDEqavjVEk6rCjdb3CRfeGA6ZCUbP0bH/1h2MJCy4+VR0jWlloRXHCBWG5So5ujlhEhk3B6686f6IYKgaaMKoirGXZW338PpyH3otvF+4p/+IGiHBqk/lD+gFQSLBn5Sjxed5Eo7eiWmpSjPCo0SNI38ld21hB/L5Lj/xrHhlkOKrSiHULvH8pm+CvoGuxVAITrTvW/0OdILAwH9eV/mvgZnouN7g0PzAkpw6eiYr24VJqATXgHenVsFbFTUcJvKpcbKu9yyYXYoY+jiH+T7Pgb/OG3+OERO8fFJLzjMQd4Ppw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GrGu2UxqHpwKcAEaCd0WmxP9/CjVIcxjObssX4FmGGY=;
 b=iJ9TAFVwjNgvrGqa8CtQrt4CYSoo6lPd84O1YVYkzJqnxVU+VPCFQ6noJ+lwEEycTx7fTNd0Oo+Gm3V5kSv0l+naA4847oxixPaZleP9QVN/TLqcRkRwxP9KnFl1Ddm18DWZ+34iXV6QF++e3M8rKviQEagSduwlpO/dPCRh+hNOabR/2X5YX46UFwb5Oy4B3ZIznnYkQUJkYTOq+lSUkidivWzUnO1Al25j9SoFgxQUMt4kjpbkocrgVu9a+owISwfu4UpvFqH+4oGVseqVTBU+TusIxztqa/3lRmue7D6EP1aN4vFXxzk3oRNwRr/se1Xb+yB2Mrvwd2dfmV6fxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GrGu2UxqHpwKcAEaCd0WmxP9/CjVIcxjObssX4FmGGY=;
 b=WebeSniVccAueWXTWm7o5hnD7u/p3WTZn+JzmIhEu5CtfgXNblQU1sTijIjkQmyrcsllSraztgXp/h6RU/qJJIc0kHE4xOm1Uoc3kxxgEZozNP1Ein7PP9E4+j3rlGFLf62EJ+0aHYr/2xSixE4wAyEhYSeOEuTX/auvJbhYfcnWDQeUR/m0TpmxY0mVAuD4yTeKfX8SExRf/nrVgS34NQoAwF+p1EzenPh7Mg+ALnGROZLTsh9RBiZCuZTmiifAaUmrh2wXtVfQ27SHkqffPx+nQt6z5Gnr/hYmlM5be9OX0crZkxReWeQBgwHCfMSn7Zlb/v8GP8QsHkyPfs0hNQ==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB3780.eurprd09.prod.outlook.com (2603:10a6:208:17d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Thu, 9 Dec
 2021 15:41:06 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa%9]) with mapi id 15.20.4778.013; Thu, 9 Dec 2021
 15:41:06 +0000
Subject: Re: [OE-core] [PATCH] mesa: Avoid PACKAGECONFIG warning for broadcom
 entry
To: Andrei Gherzan <andrei@gherzan.com>,
 openembedded-core@lists.openembedded.org
Cc: Andrei Gherzan <andrei.gherzan@huawei.com>
References: <20211209153839.2322513-1-andrei@gherzan.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB464283999240AEEFBE8453ADA8709@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 9 Dec 2021 16:41:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211209153839.2322513-1-andrei@gherzan.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [vAUKccXejUoZTozyRIIAmpntKp2hAZTraxNSeZX+kYEPFu5XXxGhshjqUFMzOc+A]
X-ClientProxiedBy: FR3P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::14) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <ac3e8051-c394-0d6a-3968-ed1b6842e672@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e1f3788-891d-4a21-5c57-08d9bb2a5095
X-MS-TrafficTypeDiagnostic: AM0PR09MB3780:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	X1j7u367uHtVNC7QrUsQp7HFM1qgUCSMMpL8EEdyyMTz2OrQrbZHcR5FCODMFT91jTKGb5bUx7AtUJjvziN5zoC7O3IEJ5HoWfN/QtNnxBbg8lZXKkSXi2Eyc1q5Vmr/3s+P50Lwu4dn9Z+wMxqbLKBLfyvRn3O3DpzR4T8cio/ymN1hVlVqnOI8OQv5mTJn1gCb9vju+7R1y6twBhd9ejahLmtBhASZ3roGUDEi5+084ZwN5gFqLPaN8Oq2bPQ3kcuOk8RILk143C0NPf2NWTZbpjMthvzMyalVxsQ4xuBQdAxj22yrSvAuEYVgpL+KaGAgratPB1noTNsfzG4Yf/ZYAJ+7hEOw2I5+x1+ej/14UNzTFtXZQ2sh99N+yDsXYCVHLA6QanXxf9wBVk3BzKAFlbjr+d+tbato7EE09GdgA7Kd5GFM3I2u4ucXQtCWPqK+vS6NzBSWHa7U5tX1hzr85u6gX1YhQ1mCr4XccyhUe5ZUWMY9b5GUkxkKdpk2CFuurN3nd2BERzYFAxqVxol+Rl8SJhSlZ7z5IApnFwyaLNMOXeqOGXJqNYNWqXNF4cUleTRM0I4QIcMt+/fo1fACzbxYSVsEQlqY+bJt4d/cUxpBpgkKJHrDRu9/xHOfysSeXEHSuI6NQpslhOs79glg/aDEsENCHrciRfOQZfM=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?djlaVmFFNDc5QjFUN1VwYVRkUGJKN09VYjdHMWZWRkgrSnRBbHhDTG44TU84?=
 =?utf-8?B?Nm1VWG5wUEhwRHdsSUtLMnBvSHQrV1UzS2l2b05oYlQ5cHlEZmVSbWtKeWc2?=
 =?utf-8?B?cmpVSHo5T2NKRkRkWGgwU1Exb0JKN1J4TnZZZkErbXJSZkpLOVNlM2NZMncz?=
 =?utf-8?B?L3BaRWJ3bzVhaEF4ZkdFK1hJUFBPYnA1Y09Hd0MxTjR6bnhDekMzK0JPbWF2?=
 =?utf-8?B?UGpsVVBnQVpPTkNGT29JQmd1cXlLZjY1bGhDSzRFdmljaE4rUTJJL3RyVFBQ?=
 =?utf-8?B?ajlweFQ2SnVoZFJvc2gyZ090bmVyOGZoWCtDTUhQMm9Ma3JKUkRCUDBUT0J3?=
 =?utf-8?B?REQwNGtaOUNEV1dVNWlBODhWY2dmRU5HZXN6Mk42NTBGWFhjMzdsYThOTVZS?=
 =?utf-8?B?R0tLQWVXVGozbTJtQU5kOVNsSC94R3hlZkdWaEhOMmhvemZvcnRNMUtDOTZY?=
 =?utf-8?B?a3hQMnhLRnp6T2FZU0dzUlJ4K3NLa1Z6dzJsQURqNTdLN2JXVGMxWUVLaEtv?=
 =?utf-8?B?dzFCL3psYUpHNWVxdUkyam1RZ1dGNU9EeHdpa3lCM2Mvck9rbDY2NjNwZFFL?=
 =?utf-8?B?djBQaUlBK2FHaEs1V0xaTmNpcUd4UjNkcTVLNVZueCtPM3dXRDJrazZPaHdD?=
 =?utf-8?B?SVlhSlNhVUlzcUZoQzg2TWtYcmRTaWRmai95enFsbFBLOUpVSW5GZkNack5Z?=
 =?utf-8?B?bHFrR0ovbHRoTkkvMzl4N2xLUXROaThDOGR4KzNKajdHZEl1SkM3VCtBSHNh?=
 =?utf-8?B?b0hKallHLzcwYVlBTG82N0MwSEFUejVGL2NUSGtQSk9PRWhCS3ZMcld5aEMw?=
 =?utf-8?B?bFhERDFUa0tYdGZiSnVWbGN2aXN6SXdXZytVNjlBSzdSY05vZ3dXR3NVazBi?=
 =?utf-8?B?ZnNlZDhleHBDVGl4cUg3dnJCeUplWHVVUjFFYXBYVmQ1RXltWmZsMjlmWk1U?=
 =?utf-8?B?M2dFTlpieXJFYzlrdmsvNm1IcGJzREloazg5VU1BNWlQVE1Cd0hWVlpxYjBP?=
 =?utf-8?B?NnJMbFNlV1F4V2JtanhIRjJuN1NkQzkwb2RlV1dZbS9velVkdGJKbjI1d3FU?=
 =?utf-8?B?Z1JKMHF6SmxEeGpQK05BZWhSYUdLTHI3czNRT3RqdUJ0ZjF2ejRubDV0eVF4?=
 =?utf-8?B?UFpER0k0UWhibFZMMFZvK3U5S3N4OHlRRFZyQ0tHNGVwSE5tNVdVc0lVbDh0?=
 =?utf-8?B?YncvQjRIWTJUellHS095a29aT0FNMnNUN01qZThjQzRqd0l1VnpZeUJyN1lZ?=
 =?utf-8?B?WUVhWmNWWVdBa21ZU0lOTFNHbWNoREdLcy80UE12R3pQNzVpUGJDLzZER2xM?=
 =?utf-8?B?RUFyVVJMTG9rcFFHUW5SZlZSK2RLNVcyVE00MW1CRXZWNndSS2R4Wnhsdmw4?=
 =?utf-8?B?YjdqQ1NlVzV0UkE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5e1f3788-891d-4a21-5c57-08d9bb2a5095
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 15:41:06.6821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB3780
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 15:41:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159458



On 09.12.21 16:38, Andrei Gherzan wrote:
> From: Andrei Gherzan <andrei.gherzan@huawei.com>
> 
> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> ---
>   meta/recipes-graphics/mesa/mesa.inc | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index c894c2dab5..8db91a7b2e 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -128,6 +128,7 @@ PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
>   PACKAGECONFIG[broadcom] = ""

Isn't that the very same as this one ^^^?

>   PACKAGECONFIG[etnaviv] = ""
>   PACKAGECONFIG[freedreno] = ""
> +PACKAGECONFIG[broadcom] = ""

The indent doesn't really match the others

>   PACKAGECONFIG[kmsro] = ""
>   PACKAGECONFIG[vc4] = ""
>   PACKAGECONFIG[v3d] = ""
> 

Could you please highlight what kind of warning you're seeing as part of 
the commit message

> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159456): https://lists.openembedded.org/g/openembedded-core/message/159456
> Mute This Topic: https://lists.openembedded.org/mt/87614068/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

