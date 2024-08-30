Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66774CA0FF8
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 14:08:09 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.2])
 by mx.groups.io with SMTP id smtpd.web11.16162.1725026884051977017
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Aug 2024 07:08:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ZeOfWPPH;
 spf=pass (domain: cherry.de, ip: 52.101.66.2, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J88FJ3Rwt8QlR4eZnNufs/cmqUj9Ed2+QFq7+sjc1RM5jPOvCL1RePGRCoT3VY1uOAgnUfFgx0P4Urx+4nYBCgkDRYA8js/XBxMHBFySG76MqBQym1+KrH3T6ZQfK2r/hbifgxZtwOgZvzwXaDC9p5pHoyEe/rtdPX9dFoDO5BwlUdKvqJU+5VPv2xpSxLwbKBl8jB0PedLCNT/AlJefyXwWJ2uNGsoisxhDQ6g0RoJQ9OzYGfJ9+uuIKZ6lKsHx2Dp2pyrAd6txTnyW8TSTp2ai35r93TcR5tNV4R8MHHIsYuhl++ak37duggrKSK+sxVphtt8cJcgJQiXnA7OaMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TyNAjwm2xwJFgAfgG3Yt9Uby44QvHCxxQ0pvSVnC1o8=;
 b=IefxVLHdwp3v9eIc3zGDLwrfMcvGEMKMZB3cAKjRkNrp4cw8F1daUw8T2xWv3W45H6MQ0wDk9wdW7cZW4EcST6PIPf6gcFVzryJm4xIA25bcQbBdn08ggdWzvQsomj3kuGaFJFFcxL6qjZjK/BsVzpIXpTeAeCjdSAdrbuRZpfLJKo4GXo9JWV0zefBQ7So4Z4hakjt+puEekP9ZNwjwQUjGYld9WPjGMW6PXbuduEys0Czeiuyqrv08ZJxTijgzNLwuiNcHOykhwItD4VA4iRGs7q0oWBC6Bpk7LZ8q1J+MmAJps73D4cj8KBwofpYba7sHkCz/MU75NCfCfaT67Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TyNAjwm2xwJFgAfgG3Yt9Uby44QvHCxxQ0pvSVnC1o8=;
 b=ZeOfWPPHFCbhR7u7HnWOj1GweWf+iqkDvt7W125r4EXdlkitmcY1C1FhUxdYWBfOvkRXtc7RFCvgSiuhPM/XnapAIGYsOuvf/ARVu78A8TP+qzfN5n2+5cn4JxQLlt8B4+m2XE9y/yRsjbbrcIbX9Amje/xbrKtQWimoi+Uq11I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DUZPR04MB9899.eurprd04.prod.outlook.com (2603:10a6:10:4de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Fri, 30 Aug
 2024 14:07:58 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.7897.027; Fri, 30 Aug 2024
 14:07:58 +0000
Message-ID: <ccc0aa94-6233-4675-bd9f-248a40920724@cherry.de>
Date: Fri, 30 Aug 2024 16:07:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] default-distrovars: Have KERNEL_CONSOLE
 reference SERIAL_CONSOLES
To: jdmason@kudzu.us, openembedded-core@lists.openembedded.org
References: <20240829214144.2947418-1-jdmason@kudzu.us>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240829214144.2947418-1-jdmason@kudzu.us>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0214.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:88::11) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DUZPR04MB9899:EE_
X-MS-Office365-Filtering-Correlation-Id: a5a8e1dd-57bb-4f27-af6e-08dcc8fd269c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NVg3UHpaQlk1N0NzWU5NbXM0KzFtbnZ5UitCS1lqN1hFajJQSFJBcGZKRzJ2?=
 =?utf-8?B?LzROM3d3V21CallzUzdLd1lnZTNPaXA0TUNOZXc4UU9NRFdCZU5Zcks2R1FI?=
 =?utf-8?B?UHdHZzdtQlZORmt1WXlROXNYcVlpY05HMjVkYXJ4anJOdll6TDUvZy9rbFVi?=
 =?utf-8?B?Mno1NUkyYWRkMmZ2cTF4YXhVanAxMkR4TldvbTNOVC9PRlR4Q29hS2puVm9F?=
 =?utf-8?B?VGFrc3JTZnQrZmxyUG9UOUFoZUp2anJua0U4RHVrbVVReHJITVJBOWtEQmJ3?=
 =?utf-8?B?N2ZRTWRFT2p4NEVpZjZMNDVjYUlQYythRjFIeDRlYld6ZnlmK0NpUDJvZTVM?=
 =?utf-8?B?MnhmZm8vZm4raXJFcnlaZlNOVk5CWFpFbzhERXdqMXplZzBrOUtzM2QvRDJY?=
 =?utf-8?B?RGQzSmlYOGZUbEJ5VWF4c25lWXhoZllQWDBSS0lubklEYTMwamZVdzhWRTZJ?=
 =?utf-8?B?YzcwTHNZbmV0YW9kTXhJeENxS3dRQlFYZEFJdDJVQmpnSFVPcXI2eDY0VnFr?=
 =?utf-8?B?YkFOSld1ayt3cXRjZ1pXV1JtSzRoTU1JaFhpa1VBRlhpYkx0QU1nZGtMaEVq?=
 =?utf-8?B?RFl2Yy9UNi9TSEhQRzhCMUR6bWlib00xaEo1aWFvVzdTVTR1SDMwWHpTcDBL?=
 =?utf-8?B?UjZmN2s1MG5VMlMxQXk0ajNDMzNwMkZJQldGQUV5Ni9SRHhKcUduV2NKWGVF?=
 =?utf-8?B?dEdlQ1gzYmhzUGozbHM2ZEM0OXZzWGlUSk5RdndCazNabmFQWFZrTFlTOGkw?=
 =?utf-8?B?RW1CQmZWTEx6bElReU90VzAvbFprT3hFMUlRNGR4ak4wUWR2R1FMS1hNa0ZB?=
 =?utf-8?B?cnRVOUErZU9ZOXlQeVRIVWlLbkdybGFNMVFZc2Vtc1ZFSEVoejdlV0ljMWcv?=
 =?utf-8?B?a1FBL0NLYXRzejdTcVZxRWF1TFdhSVZMV3ZMcXBFRFBES29CbnZsQk9NSFRm?=
 =?utf-8?B?Z1RWNGlWcjdtK2JsTk9meE9wSlB6WWxJeFBZRnFIMzBWbWpXTGNnUStrNFda?=
 =?utf-8?B?RzlsaHdibFgrN3Bjbi96bWVUOEwwTHh6RnVCZ3pPRU1RVWdmQXhJVnlkNnNt?=
 =?utf-8?B?TzVOcS9ld3ZmTmpXR0lmRVdFWDVLRFU3UU1xUEF1MFVNSXNUQ3FTQzJrNXZW?=
 =?utf-8?B?d1d4NnFpOHJiNndyOFVnR2o4YkVzTDZSOHcvdHVabWFuQ0xjMTFFckdweFV1?=
 =?utf-8?B?bGxnUGZuSkw2ZUJLLzJxUnBVZ3NyOU1lMlZ1M096UEJRREgvcTdFcDhGS1pS?=
 =?utf-8?B?NWd3ZEFBQko5cEZYU0dHNHFZY2dNRUlWcVBFNTZvZG5ibm1kUVRuVkNUckFY?=
 =?utf-8?B?U1llMkpZc09BQ0ZJcXF4bk9sTDROM0dlSmhZSXNZZitHNFRUdVVJRW5TYjhm?=
 =?utf-8?B?OE9SMjV3U0NMUDVoaFF3VkF0MDg4RmhPZ0E0NTQwdXRTT2lSM3lTTTZKWVRL?=
 =?utf-8?B?d09SWURZZmZXaFJGaFJVZ0xzSHVjeTRBQVhRRmJXTDNZRElaM2ZNeHcrU2FW?=
 =?utf-8?B?NXE3UCsvSE9JbkV2L0tDWmgxUjdjVm5rd3dtcEdaU1RMZ3c1eWx3VnhVMHZ6?=
 =?utf-8?B?Z3F0TjNJUGpzVlFRTzBVMkRPWnVkcCtBaTRzbWNPVmZaMzV4RTRhMld3VGdx?=
 =?utf-8?B?VEEyWkZ4SGY3UmJzRWY1VWQ0NnUxemlzTENLYTVyVmVTVVBYa2dNMWZjM1FF?=
 =?utf-8?B?aHYwa3JVOVNSZGlnakhzVE13NGRmUmtya0pVbFd6OWxUaDdNdUZ3SlB1cHho?=
 =?utf-8?Q?0RasMnPPLVfl1qyVBk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MSt6RThxelNHajRzVHlyNHB4NmlsNzBHbDRJSUdtYzdYUXVUc3VXUEs0dnV2?=
 =?utf-8?B?QVNwSTVCM3F0S3YrSTRGdGtneitaVjkzdEE0RUErL2N2aEJJWjBzL3JuNjVJ?=
 =?utf-8?B?WDJwQmROUXR3M3dQM0RPYmRJWnBXZThFSDRidmtBYjNmQ1ZUZWw5REFya2c4?=
 =?utf-8?B?R1AvMnFTZ0FzWjUrajFwdkh6MkZxMWdVejJJaGorOWcxVG5kSitBTjVPUXM2?=
 =?utf-8?B?eTJVcFFBeDVYeEhrVkRlM3ArTWRnOHI1TDZkTVNvQlFLeGZvR2JxODNOK0FQ?=
 =?utf-8?B?MjdxRmduZjFGZTFlZjNuRzhBM1l3TXBHejdPTStVaWpUZ3hlYmJrN2FnNk5G?=
 =?utf-8?B?VkwvOVlDdSs5Z0V5YVArRGhVSjZ6Ym9kQjllQy9GQ3NhWTV5YStoR2FFcWRO?=
 =?utf-8?B?ZHYvUlZ2bDBvSVN2V3F3V3BVR0hkQjZlSmVNWDI3ZDJFd21HMUF1Zm0zY240?=
 =?utf-8?B?YmE3YlpsSkZZNnZTSkJiamtLdk10SmxLeHVsSmZLdlVJVXEyWjZIZ09SOXRr?=
 =?utf-8?B?TEw3M0lNUW82RmliZVN0dis5ZHN6M1lRUS9Lb3lYbWUrK2VaZmZGQnV2YmZD?=
 =?utf-8?B?OE83L0ViNGlKU0UxMTliVFhBZ0JiSTdmVW5hUEd1TFMzU2I2NC92bXdaa1V1?=
 =?utf-8?B?cHdEaHAyV1ZrRW5vR2J1R2NIeUFOcVJYMDQ0MHYyT1RxcEdybkkvTnFFQjFy?=
 =?utf-8?B?L0pieEZJeUpzN2k5aVBCNkpKcVpzbDVsOFZtRDFpcmJJSVR5djk1T2FNcFFZ?=
 =?utf-8?B?V3o1STcrTUlIZmh1K09PZDg0NVBpWjJQazIwTmdrYWsxakczU080clR0eUlM?=
 =?utf-8?B?QjNnanpNSXZ1NWJDUDBSQnNneG5sS0JGS1QyVS8wL280YkFXU1dJZHlsZjI4?=
 =?utf-8?B?a1dOK3EzdnFCM3JYajNyREd0VUFUZ0ZmNkQzQTJRc0c4RjFiZFIrSXVaSENm?=
 =?utf-8?B?UmcwTDBKV0RMdkV1RDlOQk9VR1dkWnp1N244bGI2bU1oT0FIMGpRUXVUV2tB?=
 =?utf-8?B?RWZXcEZublpMT0N6M1lYWk83ZFB1RjgrWXdEeHc4Si9rSE1lSlVvUWpBWnk0?=
 =?utf-8?B?cHpydEFXZk41YVVJODZ2cklJdm1oSFVLUVZNdyswbDRUMHZ5TWNFbC91VmJK?=
 =?utf-8?B?VUpyblhOa1pONjBNMVg3MXppcjNxVnErSTFOTXc5SmpUbHJ3THFaVG8rM3VE?=
 =?utf-8?B?Tll0cUpvOXpibGxEV0Z4bk5nTjV2b1pObE1ydkc0OENacG1qQWlMeEszM3Bw?=
 =?utf-8?B?NEI4UU9ZczEzK1pnMXJ1ZTV2Nmx4c1UwM1V5YnlOM2hHT0hxQWlTTnc4c1Bt?=
 =?utf-8?B?MEF4TGNlMGYvYURLbG5hMEZyRTg5SDBHN0ErYTUxU3dEcEY3L2hxYTdha3l1?=
 =?utf-8?B?UlUyUXB5ZFlBMkl1bFRtUzJHYURzTUk5ZCtIYlRBV0hhanYyeGVhdXVuK2Nr?=
 =?utf-8?B?ZW9jcnpOeVovWllPM2xhR3VmdWhGQjFTdGFFd2NjZFlVNWFMWjhCOUJqY3R1?=
 =?utf-8?B?cm9Da3BZOGhMOHpLbzkrL3RvV2VUbmw3ZVR1T250V3NoMDhDSXFOVExBakZ5?=
 =?utf-8?B?cGU4WnZkTURIVnZTUDFvWjhaUUFTSGlyTTY4WmxUSDNvcjJ5b0p4cDFoRzcv?=
 =?utf-8?B?NU9mN2Y4SnRGOCtpenJDRHlJem45VTNNdUt1emk4SXViTmtPdHVEZnpxYXJN?=
 =?utf-8?B?Wk9laDFWRjJUQXB0MGhrUncxZzk5ZFdtbWRpYll1UnpRWUpQU3pRaDNYQmxo?=
 =?utf-8?B?VmNHMUFnanQ2TlhiZnIvcWllTWRxM2g5M3BocjF1bk5tNWlPUmZ2UTViSlNJ?=
 =?utf-8?B?RGpTYklLVDJSNCtCNmQzdVdWbXpaOVlRSGxRV1QxTytydkljdDNUWTRqUy9y?=
 =?utf-8?B?eGk5YkN0K1p4TUVEYmJHZXFXaE9oY0Jqc3BYb3lXMWdkRXpxZVZqMlcvRW8v?=
 =?utf-8?B?Tm0za2NkM3pUamZrekhLK2NFVWNGUnpvWU8wSDgrTkdhYWhkSldORVZFZWh2?=
 =?utf-8?B?TVBDTmNYL25BRmNxYzNYaWkvOEk5YVBuOUs3ck9LZndIQlVrM2ZwV3ppVFNv?=
 =?utf-8?B?SDNNNWZqSnhPYisyVW1tekVoTzlhdE42MTZ6aDRENmhXTHJjSGZlR0hDYnVY?=
 =?utf-8?B?K3JXT1cyUDJDYWF2YWRNRVJRRGQwZnhleklsa1BGZlEvMkRMTXcvdW1EN2pu?=
 =?utf-8?B?dkE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a5a8e1dd-57bb-4f27-af6e-08dcc8fd269c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 14:07:58.1423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M+dg29oY322BY8+ukdqeCO80vvMHu7+i+ARWeetmLPv9Lrc3xsAUE5YgNyfoNWGUfnm3fLE2O38hn8m+E0kEscBLCdevlx1Vljbv13c53C0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9899
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 14:08:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203969

Hi Jon,

On 8/29/24 11:41 PM, Jon Mason via lists.openembedded.org wrote:
> Currently, KERNEL_CONSOLE has a default value of "ttyS0".  However, Arm
> machines and those using virtio serial prefer to use "ttyAMA0" or "hvc0"
> (or something else).  These are usually defined by the machine config
> file as SERIAL_CONSOLES, which has one or more entries.  Take the first
> one of those instead of ttyS0, but default back to ttyS0 if nothing is
> set.
> 
> Also, use this variable in the efi wic file instead of "ttyS0".
> 
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>   meta/conf/distro/include/default-distrovars.inc | 3 ++-
>   scripts/lib/wic/canned-wks/mkefidisk.wks        | 2 +-
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
> index 7554081e8b1a..976ff4adc526 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -1,7 +1,8 @@
>   QA_LOGFILE = "${TMPDIR}/qa.log"
>   
>   OEINCLUDELOGS ?= "yes"
> -KERNEL_CONSOLE ?= "ttyS0"
> +# if SERIAL_CONSOLES is set, take the first device entry.  Otherwise use ttyS0 as the default
> +KERNEL_CONSOLE ?= "${@d.getVar('SERIAL_CONSOLES').split(' ')[0].split(';')[1]},${@d.getVar('SERIAL_CONSOLES').split(' ')[0].split(';')[0] or 'ttyS0'}"

I believe this won't work if SERIAL_CONSOLES is the empty string (which 
is the default value in bitbake.conf). I believe we need to check if 
SERIAL_CONSOLES is not empty. I assume we don't need to check if a ';' 
character is present and can be assumed present if non-empty?

Also, because I was curious, the following may work too:

",".join(d.getVar('SERIAL_CONSOLES').split(' ')[0].split(';')[::-1])

would construct the same string with only one d.getVar call, and added 
bonus it works if SERIAL_CONSOLES is empty.

>   KEEPUIMAGE ??= "yes"
>   
>   DEFAULT_IMAGE_LINGUAS = "en-us en-gb"
> diff --git a/scripts/lib/wic/canned-wks/mkefidisk.wks b/scripts/lib/wic/canned-wks/mkefidisk.wks
> index 9f534fe18471..5fa6682a9e10 100644
> --- a/scripts/lib/wic/canned-wks/mkefidisk.wks
> +++ b/scripts/lib/wic/canned-wks/mkefidisk.wks
> @@ -8,4 +8,4 @@ part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024
>   
>   part swap --ondisk sda --size 44 --label swap1 --fstype=swap
>   
> -bootloader --ptable gpt --timeout=5 --append="rootfstype=ext4 console=ttyS0,115200 console=tty0"
> +bootloader --ptable gpt --timeout=5 --append="rootfstype=ext4 console=${KERNEL_CONSOLE} console=tty0"
> 

I think we need to add this variable to WICVARS?

c.f. 
https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/image_types_wic.bbclass#n7
https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/image_types_wic.bbclass#n99
https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/image_types_wic.bbclass#n207

Cheers,
Quentin

