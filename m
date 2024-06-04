Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ADBBC27C50
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 14:24:11 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.129])
 by mx.groups.io with SMTP id smtpd.web11.22838.1717511043972036245
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 07:24:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=nEhjkdmd;
 spf=pass (domain: cherry.de, ip: 40.107.247.129, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eLsoXE6A8qsr3Ck//2fZnTq/h3ZxELmiAcidq7Orga/M6cPGMtU7ihrb7UyGsEdzQYNqNrTgYVokARk++F/0qw88OGo9INPE+ebZX+ilXy2KjB+2kvucgs5G0nfaNlrMlcYcaHQWXdNMj2ap1ovwODcf5SKIaUmq1dPKZnYo4LwpGsNU0EkLwIe8//8oank4SKy1eG7nOOPtRUKUyoyd49RCVlf1GdVZYflTs6lswBMZ2uU7zkKCLumSPlkNhdnGXD7A6Gqf7IG3XfDrusB+UIWqX5HnZdxFSpDHRtvPogyU0t6Ae54rY9scI2Bljq73PwNm+TMzCozheoyt2J2whg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2nCsAEHBk+pY1QvPogD32qBqZT1mPTFK1lV/bIpLU8=;
 b=LqB0V0hfel9q6l591B6LA4eeR/hPZ4jRUokEojfOOwZsZXu03DMdiIYgMWa+BPFIHt87mtU8hlg42b+CTAXCxNU2ZvewGAeucxXZhm6Ljn0NIpQqhJUGZMcHNzrKIMrlnam6fbUSj0UFJQF25nxsGbMti9tUD7bmyygSi7HJ2/wUv2OSAZucPF7UEGuCUiPtygPRDwoIZb9eg7dmQrkiEChg3gyXlgZ2/y3it8zWNZ6ZWh1sJbupJIao8em96wwJqPZqpQFHKuLkMJeEHoW+Ke+naVA6Nitcc5KVya+EqogDqHmwLnkJBK/c3y1WDXdWpwZiVj0kOiL+Qc/JvW+Jng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2nCsAEHBk+pY1QvPogD32qBqZT1mPTFK1lV/bIpLU8=;
 b=nEhjkdmdrZiX3l9/DFDlySQ5qjOx+kvWkLJYpkpdrGJs7J7TESMGdFUAPpHnNq87le6sWluxp4/oymG82m3wdpP7REkzG+K4Fsshm/CX9GoZrEeIYqNlfXa3s1tBS0PeqUXGES+EM74+aZKxeFbAJ0VCtj9tx+sinx7dqJ3eVuo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7982.eurprd04.prod.outlook.com (2603:10a6:102:c4::9)
 by GVXPR04MB10383.eurprd04.prod.outlook.com (2603:10a6:150:1df::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.30; Tue, 4 Jun
 2024 14:23:45 +0000
Received: from PA4PR04MB7982.eurprd04.prod.outlook.com
 ([fe80::3c4:afd5:49ac:77af]) by PA4PR04MB7982.eurprd04.prod.outlook.com
 ([fe80::3c4:afd5:49ac:77af%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 14:23:45 +0000
Message-ID: <7f0cbf29-f885-4f39-8b83-4e89b709d6f0@cherry.de>
Date: Tue, 4 Jun 2024 16:23:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] mesa: add new package for Mali CSFFW Valhall firmware
To: Quentin Schulz <foss+yocto@0leil.net>,
 openembedded-core@lists.openembedded.org
References: <20240531-panthor-v1-0-1a76fd752c1b@cherry.de>
 <20240531-panthor-v1-3-1a76fd752c1b@cherry.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240531-panthor-v1-3-1a76fd752c1b@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0046.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::15) To PA4PR04MB7982.eurprd04.prod.outlook.com
 (2603:10a6:102:c4::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7982:EE_|GVXPR04MB10383:EE_
X-MS-Office365-Filtering-Correlation-Id: 35d195be-cd94-4726-cd52-08dc84a1f133
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?L3dzUDVXQWd4STFnbGNTNEtKMUxObitKREhadVp1YWZJdGVGWGxtZlNSaTJw?=
 =?utf-8?B?MkNQWEQrcGhPT3hvUXJ6RVVmZXVrVEJKYStzaVFCTzU1SnlVMVFEeGxTYW5i?=
 =?utf-8?B?YW54T0FmODNLZDRqQ1llb0Zia1pRVjI1Y3ZKbGRDZUdaUlIxb0ZhQ1krdG9F?=
 =?utf-8?B?a1lCTlhkUXcxOTlpVDc1OHdKdGZJYmxPUU5OMGFSZDZkZ1hUK0JvMkJHdDJQ?=
 =?utf-8?B?QS9nYUJzL1pxUDNEdnNGM2Mrc1pVcGc4VllIMnREYmwvMW9CWVhSNU9QQkpN?=
 =?utf-8?B?V0tCbFZOaThhYndmNzE5R2dTR2YvdTVPNGl2dEJyVDBXQllXeE5TOXJlUnN2?=
 =?utf-8?B?Z25pT1BxSWZEdnppRGNySVNsZG5pRlJ4dnZETFZER2Y4UGsrKzVMSG5ocHpM?=
 =?utf-8?B?ZnZBUGFZSFZVdWtCQnFYTXNaTUU2Q3V3TUpUR1RPR3lrckdGSU1WUk5ad2tm?=
 =?utf-8?B?R295R2FjSHNyOGRubUpESmpjOHpPa2xRMTFudGthRmxvckhheFoyVlpNbS82?=
 =?utf-8?B?elZ3aFVMSC85K2JpM0ZBSUdLSHFBQUhpTmhjMFRXeTBhd2hSQS9KSEVnQ2lW?=
 =?utf-8?B?bG54ZVViVEJ1blRQcG1PNGFzUjJLbnBnM2pjamtTNm81dHFwcGp0ODZVSWNL?=
 =?utf-8?B?eWtaZzV1L0FiQ21PVUt3OVhPRTAzQm9yR1N6eWR2akNxdkJ2aXFWa2tNNUtF?=
 =?utf-8?B?a0IzZHB2OFh6WmFDUTB3cDI0ekdVMGIwTFgrRCtMSUFlTkZPbkJJNVJKTXRa?=
 =?utf-8?B?Uy90cmlXVTRBUnJPRXlWT3J3eXBXdEdaWlJoVjNsb3V1Um1yblNJVEFjRXh4?=
 =?utf-8?B?TTd0d0dIREhtNFhoSFdiViszT2FDRFZOTE9qR215MWJ5M3pwMVFoWGVnbStC?=
 =?utf-8?B?eTlhSnBiWGdTQVlISlZFZGh0TXhzK0tjak9ZTHFjMzNvYWJ4ak1zMUtPVnlk?=
 =?utf-8?B?QjBwU21WWHpjNWE1SGFxOHBjNW4rbEU0S3dZNlZhZjNnVGsyaW5oVFVhL0RT?=
 =?utf-8?B?SURROXlub2ttRXZsaDRTK28yY3NsVTB6cEV5Rk4rRUcyd0ExenhnM0pISDZG?=
 =?utf-8?B?RHc5ejU5ZDhjODRWUXlLeU5Ob0NPaVRwbmQwVXNzYXl1Yy9yVUptclFyTHli?=
 =?utf-8?B?bHFiZnRaZUEvUkVBa0IyV1VqbTU1czhRMG91UWo3a0FpWkNtaW5BWHkvYTFU?=
 =?utf-8?B?ODlLVEJtNGUwd1kxUGo3MExwK1hTV2VGaTFqSUZsZUs2U0tyN25JWTNQSENi?=
 =?utf-8?B?bFdtOTY1M1BQS1dXNFlURkl6amZIU2Nub2VZSzdnOEtxSnl3dktFUGVmQUJK?=
 =?utf-8?B?UWc5TVprT2VKVzFHdWtaSjUxVzFjNlpmYVpnaTBNN3pZY2VYYm9Ob1NkTzY1?=
 =?utf-8?B?cWVFSkhtRWFncmdMQmw0Z2h6SkpaMVg5VWIxalpISnBDUitvdEp4OTVyNkRE?=
 =?utf-8?B?aUxjNXMvMEw0KzRSQW5wN2o5QmVGalhoTnBqU1hneTVlc3BUb2piOEUwVmFO?=
 =?utf-8?B?SGhsVVcyOVo3aHZkN2o0MW1URUx4ZHVBSTM2RTl5ZzM0RS9LYURIRGk1bmJz?=
 =?utf-8?B?NEVMTDM5SjIyTDMxdkFLMXZaQnA3Uy9LdGpEcFdCbitWUHdkV1JpdVBPdk5k?=
 =?utf-8?B?QVlyUmh4NitIU1o1Y3dPVHg0eVhqTDI5SWRnaCs2SUNKU1hOczRkTVQvbmw0?=
 =?utf-8?B?MUc2VnIyckJkK2tidEQzMDI5Ym1BL3FjZjBXSytraDQvNjhOaHVhbmJZT3V0?=
 =?utf-8?Q?X4/3fSujSA3ZN+63T2IbRdmV6MhpQ8lfId5alaO?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7982.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y2RBWFlRM0pOa2JVc3lWdG9iYW91ZTFXbVc4cFZTYzljS1F0cEluRUE3Zzlr?=
 =?utf-8?B?d0xMRWUrWWxMbFJHS1BYL24wVjIvQ011aW9yalVkMFpKNko3SkNoRTV5S1c4?=
 =?utf-8?B?RW9KNWpPcjExalBIWXMvWnBYQjZkWWFlNFpaOFlSSU1XOENDTlRtWDkza2s0?=
 =?utf-8?B?cGZWWnlDL1JxWGl2VFBhYk1PL3c4aXhYeGlNTkpOTjFwMlpNeGY5NE15eks4?=
 =?utf-8?B?VFFmY21lVmNrRmdRVndZRE0xSitmUnB1NVUrTHB3bFZpOUFVbGFJc1VNTUI0?=
 =?utf-8?B?WDU1YVdBUXArbko0OHpSVTQ0bXI2Vllrc0ttWXRCWDhESUU4d1FoNGloNm82?=
 =?utf-8?B?LzU1ei9GYTBKYXM2Unp5M2lMQXZVL0dJaWUzWXpmRGl2SDVKbEtnTlhFNGMy?=
 =?utf-8?B?VitOREd0R2l4VmJNc20zUm1sNThxTDBvYUtnMVJHRjNLRUNqalg0YTNlamlV?=
 =?utf-8?B?UnlZemszaUZaTmZvaXVEUmkxTWs2RVQ4MFh0SzZObU9PbzV6QTNScFpkdnRz?=
 =?utf-8?B?aWRnc1J5cXRGTVF0Y3lZcWVWNlJ6R2o2aG1OdExTa1YvUlI2WjJicnZtRkls?=
 =?utf-8?B?WitXaDU0ckdPaXVSeTNQbFl0SlNRc0hLYUtVeTB3eU1pdHVid0RYTi9USmtp?=
 =?utf-8?B?SEpKMk5BdE5qTWQwZnVKRVNTV3lKVjhXbEFYWnFKQ1RlNjRDWGQvNXNLYWlP?=
 =?utf-8?B?eE81MXpjWHA1b0tPMU5EdDhDU014ZUpraG5hYktrLzluMnYvc2U1ZkgwODl2?=
 =?utf-8?B?MmRxbHFNMmdlQUdIMEVKTkFya050NEdmY2pDSGpIelZMVmRTZ0pUOFA1c0Nk?=
 =?utf-8?B?VG5GRys3S01rTVA2c2IwM01PclJKTTVhemNNTFE5Zko4dmxWT2RwKzRLemQv?=
 =?utf-8?B?S0cxcjhFQ3NMYkFBTGNHQ1JvY1VPcVVpOUVxQkwwWXRjRVNKSi9JWkZuV1Rp?=
 =?utf-8?B?SEN3enFTdE1ZZWNDejQ4SVVHRGNSS0VHSi9rLzlxME93Mmh2Y1lsd1Y1eTFY?=
 =?utf-8?B?WC96emdNVjZTelgxbFVPcGZCcTNZSXNaMlhPTUgrVi8xVjBqQlhmTDVRTEFX?=
 =?utf-8?B?MVFpMmRwb3ozTWxSQmJkdVZyc24rWkg3aCtPU3FsQXlsUnUySVZIZFl6c0la?=
 =?utf-8?B?QUZiWHRSajlLQkhoZVJOeWpmclNGZFdYM1BRa2cxY1BjOU9sM01WTDNFYnZE?=
 =?utf-8?B?VWwyTVp0Z0JmVUhLYW8wVjZYaDJUM2tibWtWdE5PQVM0WTZqZ0pNcG5ob3I3?=
 =?utf-8?B?NG9scWlrYnlwd0d1VWNrUEdJaHBtK21uSjFJUDVNelJqYVJaQTQwOFIzOUNO?=
 =?utf-8?B?UnJ4NHdGcVkycDRlb0U5NVlqVE85eEtmMHBXNTM2alBxNTVqazJGWXdWdVhZ?=
 =?utf-8?B?NC90SDJtL0E0TThOYlNYZ3RuSndIT0dJdVhRL3R2dzZwanF2aG5ZTTVGOUov?=
 =?utf-8?B?b3JCZUk2T2Vmdm9FKzRGblZvZUdLOGhFTUpNVElhdUlWTVF1ZVlSQllvczRO?=
 =?utf-8?B?V0s4RXRiWDdwNGRya3B4ZWQ5TjdiL0hhMDkrTlNHWHpqUTdPcGFCTGo2QVVu?=
 =?utf-8?B?cWhKb2cwVUVtTWg5RTFCeUljUkhhWGZHZDB4WVV5dnVTWTNGbjhBdlk4bGNr?=
 =?utf-8?B?WXNsN3lTc3VGOUMrZkpKZ1o3ZFJxTWhYalR5UUdTSFZNQ1hCenRiejJzK0lZ?=
 =?utf-8?B?RUprSVJCb000V080ZHNmbkpvMEhvQWRIVk5aWVNYMUc1Yjd5eUIvT2FkSnEz?=
 =?utf-8?B?TGx5a1V0a1ZSb051eUlIUUtGZ2ZsS2JwdU0xVXhWRTgvUkFtZjd0alJDdkhK?=
 =?utf-8?B?T1pudnRjS2M0S0xmQ3RNbmZ3ZklJT3FKR3BjSzdVMG53OGxmZklRNWhsejdM?=
 =?utf-8?B?c2RHejNtVlRMdHc3ek14Zm9nMzhOTExUNUxURURvcmJ2aGtIcnhZMjJQN2FV?=
 =?utf-8?B?dnpoMzBKNjQ3bFJUQjQ3VU11c2huMGVjbEc1VWg0UllJenRkY3RWT2sxNjRB?=
 =?utf-8?B?K0t3d21FQzVWQnNPMS9pcWQrTzllV1BSRGJMRUtwWnBHczduMjczZzJCUmg4?=
 =?utf-8?B?SzU2MU51N1RSR01hLzJTYmZkblpXeFhNdm1FbWpzOTkxb21EM1dTYllWK3cy?=
 =?utf-8?B?TzVjTC9DeW56b290eGFQK3ovZnZPemxTRHIxbCtUQnNZYW9ZOHpjYU9naUNI?=
 =?utf-8?B?d1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 35d195be-cd94-4726-cd52-08dc84a1f133
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7982.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 14:23:45.3896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: shWVxMoV5eh74Zhjooxec5XWaCTBNnLuQ/Ed1GQji2yPo3H5wO4ZVlOARG+jyuv6R56D+xdrllvfVelCGnP5slpT6wo+yuyOwXn6nk/Wpas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10383
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 14:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200338

Hi all,

The title is misleading, this isn't for mesa but for linux-firmware.

I know this has been reverted in master-next but I think we should be 
able to take it in, even if the mesa changes don't make it just yet as 
they aren't really dependent on each other except if someone wants to 
use open-source mesa on RK3588(S).

Cheers,
Quentin

On 5/31/24 1:53 PM, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> This firmware is necessary for closed-source mali blob + drivers and
> open-source Panthor (via Mesa + Linux kernel) drivers.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>   meta/recipes-kernel/linux-firmware/linux-firmware_20240513.bb | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240513.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240513.bb
> index 026e5dba00..4a87105d98 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240513.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240513.bb
> @@ -39,6 +39,7 @@ LICENSE = "\
>       & Firmware-kaweth \
>       & Firmware-linaro \
>       & Firmware-Lontium \
> +    & Firmware-mali_csffw \
>       & Firmware-Marvell \
>       & Firmware-mediatek \
>       & Firmware-microchip \
> @@ -113,6 +114,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
>                       file://LICENCE.kaweth;md5=b1d876e562f4b3b8d391ad8395dfe03f \
>                       file://LICENCE.linaro;md5=936d91e71cf9cd30e733db4bf11661cc \
>                       file://LICENSE.Lontium;md5=4ec8dc582ff7295f39e2ca6a7b0be2b6 \
> +                    file://LICENCE.mali_csffw;md5=e064aaec4d21ef856e1b76a6f5dc435f \
>                       file://LICENCE.Marvell;md5=28b6ed8bd04ba105af6e4dcd6e997772 \
>                       file://LICENCE.mediatek;md5=7c1976b63217d76ce47d0a11d8a79cf2 \
>                       file://LICENCE.microchip;md5=db753b00305675dfbf120e3f24a47277 \
> @@ -192,6 +194,7 @@ NO_GENERIC_LICENSE[Firmware-iwlwifi_firmware] = "LICENCE.iwlwifi_firmware"
>   NO_GENERIC_LICENSE[Firmware-kaweth] = "LICENCE.kaweth"
>   NO_GENERIC_LICENSE[Firmware-linaro] = "LICENCE.linaro"
>   NO_GENERIC_LICENSE[Firmware-Lontium] = "LICENSE.Lontium"
> +NO_GENERIC_LICENSE[Firmware-mali_csffw] = "LICENCE.mali_csffw"
>   NO_GENERIC_LICENSE[Firmware-Marvell] = "LICENCE.Marvell"
>   NO_GENERIC_LICENSE[Firmware-mediatek] = "LICENCE.mediatek"
>   NO_GENERIC_LICENSE[Firmware-microchip] = "LICENCE.microchip"
> @@ -354,6 +357,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
>                ${PN}-bnx2 \
>                ${PN}-bnx2x \
>                ${PN}-liquidio \
> +             ${PN}-mali-csffw-arch108 ${PN}-mali-csffw-license \
>                ${PN}-mellanox \
>                ${PN}-nvidia-license \
>                ${PN}-nvidia-tegra-k1 ${PN}-nvidia-tegra \
> @@ -608,6 +612,13 @@ LICENSE:${PN}-lt9611uxc = "Firmware-Lontium"
>   FILES:${PN}-lontium-license = "${nonarch_base_libdir}/firmware/LICENSE.Lontium"
>   FILES:${PN}-lt9611uxc = "${nonarch_base_libdir}/firmware/lt9611uxc_fw.bin"
>   
> +# For Arm Mali
> +LICENSE:${PN}-mali-csffw-arch108 = "Firmware-mali_csffw"
> +FILES:${PN}-mali-csffw-license = "${nonarch_base_libdir}/firmware/LICENCE.mali_csffw"
> +FILES:${PN}-mali-csffw-arch108 = "${nonarch_base_libdir}/firmware/arm/mali/arch10.8/mali_csffw.bin"
> +
> +RDEPENDS:${PN}-mali-csffw-arch108 += "${PN}-mali-csffw-license"
> +
>   # For marvell
>   LICENSE:${PN}-pcie8897 = "Firmware-Marvell"
>   LICENSE:${PN}-pcie8997 = "Firmware-Marvell"
> 

