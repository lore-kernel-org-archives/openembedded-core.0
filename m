Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3523CEBF97
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 11:18:13 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.60])
 by mx.groups.io with SMTP id smtpd.web11.66744.1727435886708306500
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Sep 2024 04:18:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=QyDXGaK3;
 spf=pass (domain: cherry.de, ip: 52.101.66.60, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GoLv6ytMif/EWQGikyQsq1KZrTUurKaLZvtv1MFFFio/NyGRdGw84kFVKNzNgzIECHq+089DpvfbPhzP9gX0CrHqQpQpTrBKFDS1D+bfF6cSxH8R4RPvYNwnuAjxfmy2Ce56EZuTui6NSToHcYKy7wz6BgzArh5IbjEodh8QT8a+L0vxok//xc7q4qeTlSNNpo8zLFn8TuZSF6mOXywhn7kNFn+QI/wHf0LABDjMoG4qVOWdXIIM1zpjVncFkmK4ZIun8lR3A83htO/j6RqOGm+UivgGDI0RWiAG9YRz9G2/vXXPB0OTOEu/h3YM+2exDgakF3Tj4J1N3fktesk85w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8m67yqJnT5WNIqJY6Og8wNaM+o39YSsrpkvIdFg7yRI=;
 b=lr1Y9vE4WWLusP9YCT6CyLVlQxazfcqtPEDAbHI9QrdE0hbL1YxBgWMqL5duyS1UoZt/GaC+VsXa9bbHZ/Pzlb/Jo92x401U/Uu+qK5hHV9lITltXTzwl+U4q91fxQUvoCdvjLv0rfWJBFXG2kku9wQuQk9RZNysBxZTZ5SQVYY0P4GNliV4DGG7f3XRIDBD81ptlxlolncem/dmatBbYcTIavPTOKKAcfzKs4SP7QCNj6c81vqU0Pafo3uN+oRyh0FoQD4p63VVHU5PwFk386ihaaSEUnvLhvFPhfHIWKbdb2qc4PCu8TshgHt1iYo5EWGeFBvXCFEs+3LX3Q/sng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8m67yqJnT5WNIqJY6Og8wNaM+o39YSsrpkvIdFg7yRI=;
 b=QyDXGaK3yfdY3HR+hQYnad3BhCT7Kgy0Edb/P/7ZiaUnJ2mxpQIvmI0IakylUIvD9f2+BZnLwRjbbgWSVoSms7Py+PDHnmZlKQYfk9aSQ2S/Rh6eRi1f/vE9Yh1w6ACmMney+96lxv3BEa2bkDxin8+FQY8X8qiMRpOjQj8lh5k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by PA2PR04MB10470.eurprd04.prod.outlook.com (2603:10a6:102:419::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Fri, 27 Sep
 2024 11:18:01 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%2]) with mapi id 15.20.7918.024; Fri, 27 Sep 2024
 11:18:01 +0000
Message-ID: <7bf76c1a-a3ba-4c18-bdb7-4b9044adfd9b@cherry.de>
Date: Fri, 27 Sep 2024 13:18:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-core][PATCH] kmscube: Upgrade to latest revision
To: purushottam27.kumar@lge.com, openembedded-core@lists.openembedded.org
References: <20240927105333.52805-1-purushottam27.kumar@lge.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240927105333.52805-1-purushottam27.kumar@lge.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::15) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|PA2PR04MB10470:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f000ad0-695d-441e-bd87-08dcdee60c66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eDBNUkpCUVFUdUdtWURGcE9NWEIwNGlqdUE0dlh6NEVrTUw4YXdEeHJLV2Rs?=
 =?utf-8?B?TGFnejNyZ1BlM1JEamp0N2VSK2J2M0NPbmdMaDFmOFJJOXhEbDJhUWNMVnI0?=
 =?utf-8?B?UVhxaTBGdEQ4SThMb3VNYVFNS0NPZ1Z1dlVyeDZ4UDNObWtGUW83ZUFpdS9I?=
 =?utf-8?B?L3NPVXJZMGVzdmx0clpVYWNTVThCN1g0UnFoZTRYWWEzQVNWdUtJc1YyeFRt?=
 =?utf-8?B?Ykp0aVYvS2ZoOG93Mmg1YVVBSmlMczVrY0pIaVdFZDNlbk5TUVZFTlhpdzRz?=
 =?utf-8?B?bVJiVVJoNnB4WUdNWE53R2tibmVXQ3k4YU1GVkVwWTFZNEpGYXRJV2Nkdnp5?=
 =?utf-8?B?Z1JVaXJRQjNGSWJSVGtRdUNnVzRDbU1scDhOd3c2STBvUDkrVzZGT3cvMG5u?=
 =?utf-8?B?Z3hMNWdHcEszSUJLazZJaXNpTlB2THZTRElBR2VCWlJUalZveEhhbHA4OXdC?=
 =?utf-8?B?MTkxNDBrcFhLaE5QSzRVNm03RVpnS3lzUmZvQm14UjRUUTIxRUZrb0IrT3Az?=
 =?utf-8?B?VjU5Z0s5eFVVTDZmOGl3VWVUKzhHbzlMZ3hlZ0dVaHBNNS8rNGhDb09KVUdw?=
 =?utf-8?B?ckJGQmFOdndIZXRCU0wrL2hOaU12ODZCSlliOTFkazFKMUEya1kvVFBjUGNt?=
 =?utf-8?B?K3k1cDJzdUkvaFJUTUFzYk05OUd6NjZ3YW81djNZTFMrUkNJR28zeWNUYVpJ?=
 =?utf-8?B?OEQ3MVZCWUp0aEhTc3o5MUxVSmUrTVlmd3UzNWVlU0I2VDM5SHB1bnd1Wm9F?=
 =?utf-8?B?VFQwTGJINitnWXUyeld1a09jN3YvMjBybkp2d3M5Z25WaUlreDJCc21NYnZp?=
 =?utf-8?B?blZFbm9kQUo0bExsRDNMakFtZi9NM3ZEbE9OWVhlckNpUGJRRW9CRDZrM1RO?=
 =?utf-8?B?cmtOd1M3V3lHMmxUS0dCVUJ3bDJQU2lMRklJZVVBbGMzM1JGNlRESGFwL3Mw?=
 =?utf-8?B?Z2lWOTlaODlRR1hXL0RKenNteFBRZVNsTmJoSjR5REllS0tFV0N3RTBINGJh?=
 =?utf-8?B?M2JpZzJoOHh3ZkIzYXM2VVNCN2JNbENhcnNRbVBscnR5ZGNNVXkrQ3doQVBo?=
 =?utf-8?B?TE5rQklaMEorU1JDZXNLY2UyUm5KQVpaU0djQ2k5YVYzdjVacGN2TmdWQWd2?=
 =?utf-8?B?QnJPZHpKSUFyQmQrNVhlQlg5RXlBQ3JYNklGeEpva1llMTY1TWdBOFlBWVUx?=
 =?utf-8?B?WHlyWlkzSkVOMTFnTnJkdVp1eFNmT2J3M1ZFWG4rMVhZQUtxdFJFajFmVjJp?=
 =?utf-8?B?dGxuS3lURzZpWnZHNXkzU3piZ01SckNQR2VHUjBORXNsMCtaSHQwYU8xYXFh?=
 =?utf-8?B?d0RiL09qVkRFY2lTeXh4R2Y4ejIrY2liMEswOWxTbDZzTzdBaXFBZUxLS3hj?=
 =?utf-8?B?bUV5c0piWHcxb2hOcHQ0TktqZ09uMUpneWVIVVhtRWNvWmxINDhoT1FlMi9S?=
 =?utf-8?B?cTc5djBLRFJLVFBkUTVlczNNSlVoejNMZlo3TVRGb1g3Qm5pcTNvMjI1TE5K?=
 =?utf-8?B?WmZNV0xuTTJUV09PZDAwRDUvdzhzRzQ0QUZ3a3F0NTJSZWVUWnloOEY2SzZN?=
 =?utf-8?B?cDRoRUNWbzNNVjRVUWdieFVWSWVNVldqbGpBenV5V0RyZU5aZlJxQTNkQVpa?=
 =?utf-8?B?dlZ5MzlIR0tiYVFyTnZxUHBMVy9BQmRLcTN0YkpVL3haZTZ6dVVKYm14QzdL?=
 =?utf-8?B?YzlmN0tZS2dwQmgzWHl6WW5MMnBhODRIQkRvOGUxTTI0Z1VXL2g4RktvdlJa?=
 =?utf-8?Q?AkD7dVaxpMbxd9kwYg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eU5XSS95MkxpSGZ0aE5FRmV2MkNvQnZJdEYvUWh3d2lHSnhiTXJRKzluYkdk?=
 =?utf-8?B?Rk1FTFpXdzhIL2VIR0RSUHFNSStiNTlsQlVSaEcxWlVScXA5SG13eENYYmpo?=
 =?utf-8?B?UHdaeW1vTC9tRU9vaFVKRXp3Qk9NeVhJZHlvc1A5ZHJVVkVjU1l3bkVycWpK?=
 =?utf-8?B?RUJDdEJkYjVHcE83bGZ2bHRpa0VaWHBSZCs0SG9RL0twaEVuZmZiOERsZ3ln?=
 =?utf-8?B?eTZUZFkvSWhwNStPR3ZvR0twcHdRWGFMamVDVEp5SGVvZTM4QmM4enVGZ2JT?=
 =?utf-8?B?Qi9VMEUvcS9kM2tSWjJiMjdNWTNoaVRGaUNlc050YnU1Umk1dzhKelVvQUM0?=
 =?utf-8?B?a0JqTWVwNm5RVTFnczI5Vng2eThwN3pEZVJkUFdmcytrVTZLQWVrUklWTy9Q?=
 =?utf-8?B?QnRoTm9OdU52OUN1QVhuYWF4SWFEODJaZHp3c0JodmdrUVZ0Q0Vqa2ZvaWZx?=
 =?utf-8?B?V2hrcnNoUU5jY1dXY1NUbFNzQk1NMmlVc3FNRld5Z0QwSzNXaVVTRHZoRkZR?=
 =?utf-8?B?ZTRhakRnTWkva0tEU3U5VXlETzdRbitFdDRGM0NXa01vYldhbHdyWU9VQVVD?=
 =?utf-8?B?U0Y0QU1XQ0lIU1Arb0FLV2R3cEwyR3ptRmVDQnY4dDdDckxCNUowQ090VXhH?=
 =?utf-8?B?Q3RXTVJtM2tsNFRkbzNaSGY2QlpoVWhIckVlL0lCVmgyRm1XT0x2VHJaWHpj?=
 =?utf-8?B?WTQ2WG85OFQxaTlseW1ucnZRWi9sR1ZzSnZ3QWpkMG1PZ25zYlRRL0Zyc1po?=
 =?utf-8?B?ZzdjUGV2cmdYeGx1azNVNkdEaThEa1l5ZkFiTkhRRll3WlR5bVVtclZVWE8y?=
 =?utf-8?B?TkgvSTVXVHh4WitudHlxL2czRnMwTUlDYXR0akVrZUhNY0I3S3RrVFNETExU?=
 =?utf-8?B?NWlqTHpyNS9vZXFGN2dTTGNiYlVTbHVzRkNDbHZ4QzEyYmwwNTQvd3dpL3hI?=
 =?utf-8?B?OG1xMThUK1ZPZnFxYUpYUG9NaW0rMEhYb0lkNnNnelJic2d1TjkzUjFYSnhr?=
 =?utf-8?B?bGo2Tnh0WXpjeTROUXlDbUo0OFdjUHhOQ1pNeFRhdlIvYW1kMWJWRDdkc29J?=
 =?utf-8?B?NmszODl3UHMzWmdkZjdQSU9XcHA0M1JPUWJScnpqSG1vNEJHTU5rRTM4UDZN?=
 =?utf-8?B?Zk5CY0JLSnc2QmZQZHJaMytGUXFHNGV0WlZ3N1J4eTFmdC9wOXhlVUVpN1Yr?=
 =?utf-8?B?WEhlTmlkaGRBdTkwaFI3Znh3TEp3bWtJT0ExSFcrbDhnNlRNbDFJR1NISlJm?=
 =?utf-8?B?azAzK3V0YWR0Q0VzSGlheG02UnN3eE1NYVNsaThOTXB0Qmg0eERUb2pIeXlr?=
 =?utf-8?B?MHpaRmViNVFmZGhFMjg5Snd1UzBNRkFBMWZQdStVakY3UDFiay9BTnhRK0t0?=
 =?utf-8?B?RXFlVkRuR1A2engwaitxZDhIWGJaUFU2QW83NWZmYjltYng0S1hWTjUyQ1lI?=
 =?utf-8?B?Rkpkanc1VkkrMnJZd2JETlhWbGxDanJyTjdzdzF2NjZGOVJ2ZEhhMkNqWjBK?=
 =?utf-8?B?bDNDUW8wdVhsSy9IcFpLeGY3OGJnN3k0Zmp5OTQ1OExRN2lzbjlXbmU4aFR6?=
 =?utf-8?B?Z0J0MnJXbFplbEZma2IvVzkyZ0VUc1QzN05sMjE2Y3dSSmVKVlhVWmc1djBE?=
 =?utf-8?B?UGZJT3VlOFpLd3NPb2RUT09XclFxd3BwdHdCbm1NaG9zOEl4ek5yMG1hQlNW?=
 =?utf-8?B?SE5KTnRxb1hMQ2F3eE45bTFwVzJuOTZIak4wQWE1YzY1aGJqd0pBeEhWRS9D?=
 =?utf-8?B?Zi83L3lsd3UwTkNZNmQzaSt2UU1zL0VpVVVkcjBRcEwxZUxxa28wcVpiTk9i?=
 =?utf-8?B?aHVrQVgyd01wdHJsOWRtdXJqTmhlQ2JMSjMwWFFKOFEraWd0aFJvLzlHSm5a?=
 =?utf-8?B?eDNZMmh2ZzlBd1V0azJERVV0dmVuLzAwV2tkM1M5UFIwTEk4MXdRM0JJalo3?=
 =?utf-8?B?QXltSW1xYjRkaHJSdnRIbVlpQVdONmNWVU1hMTlYUmtsditqZnplcENFSFNm?=
 =?utf-8?B?bEFPZFFJTGN2K1A3NVNreVpoR1hnSG9oVzVnVlpyaHF4a1BrRXR2N0h6d2J2?=
 =?utf-8?B?S3NxLzJUcmpXK3gxYXVnaEdjUFdPazFVL2UzWmFpSnZGMEswK1k4UTJtN09o?=
 =?utf-8?B?bjNMYy9oWjQ5WThmb3VEaVJVMExiM3IySldyd0NCMitJL3BWUU9WNDdHeGhI?=
 =?utf-8?B?bFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f000ad0-695d-441e-bd87-08dcdee60c66
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 11:18:01.2799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Si32Plq1VpOVzg5mk5sOAX3Sm6afzQwr4TR1VZJ/YUbSZEdbAwQ1xfnPYpU7GczRIAXb4AATohPgHkqqaplYJXy87JHaL5VT0/iBpyOUDuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10470
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 11:18:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205016

Hi,

On 9/27/24 12:53 PM, Purushottam Choudhary via lists.openembedded.org wrote:
> [You don't often get email from purushottam27.kumar=lge.com@lists.openembedded.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Upgrade to the latest kmscube revision.
> 
> Signed-off-by: Purushottam Choudhary <purushottam27.kumar@lge.com>
> ---
>   meta/recipes-graphics/kmscube/kmscube_git.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
> index 34d5a7d71d..01ea80a142 100644
> --- a/meta/recipes-graphics/kmscube/kmscube_git.bb
> +++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
> @@ -10,7 +10,7 @@ DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm virtual/libgbm"
> 
>   LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
> 
> -SRCREV = "467e86c5cbeb2a2051b31ce2c240d6ddf5bc3112"
> +SRCREV = "b2f97f53e01e07a920761e5d3e3ba22898b794a4"

This seems to bump the gstreamer dependency requirement to 1.22.0 and 
later, which is only supported on mickledore and later so backporting 
(if there is) should only go to scarthgap and not kirkstone.

We may want to do the backporting, c.f.:
https://gitlab.freedesktop.org/mesa/kmscube/-/commit/4961a04b4a434aefbd412eb24fb76998036eaaf6

"""
This solves negotiation issues encountered with V4L2 stateless hardware
video decoders when using kmscube video playback option.
"""

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

