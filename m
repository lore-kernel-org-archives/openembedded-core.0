Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66EC8C54736
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 11:38:32 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.68])
 by mx.groups.io with SMTP id smtpd.web11.75518.1724758709224896605
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 04:38:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=P5j2qiGm;
 spf=pass (domain: cherry.de, ip: 40.107.20.68, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CcrQbU85ba+iP2aS4QRvLYr7ODdTjyvSk5NfIdEJlTp6kLI43f4yyDtJZFSIoAWz6+xg7Ng8ILklDnTFNyHlR35ui1ckQ8Q8OcauIe1PYqFxT5ff8LfNlPti2uKEi3W/yyI0gLO9HNgmnr74OcVzDItG1sf/OK8E25lr94qhaEGkSNve09/7vjxTnXJoiDqOG5Cl5hLww9CrZPZg3FZ6AR8soDvzF+GKXoNrL4o0BD3PUGh7pDUgskY5m/LN+V57Ucy3/xmYCwHHUKeNS5A5B5HUcfKFlx1+hWl/QsUgeD/ldqjlUW7zOncaSXnPXKzDAVLAQdFevR5RasgE8YQ7LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQaprROVYHxccMJMb2830m1csFgyQUVaDtBg0kWM5ss=;
 b=aOGiwkk1hFfmZ8nCWo2KILeAeqpBBSLsINYeBTJ06x0tllWBwlW4s7FjlVo/wvHNISP5DQXmNjkOcZ5XX/nhsUpk1b+VKhvGc8lP24Hv61So/QLtd+B7/kh8zN7BrXaym1h5XJVVmcxA1X7Udxhy4T+dzliF5H3nyu54AwZFK2GBNBRhuwKsZQN7N8dyoDeJUqaO88ZPW35cjuIX5g8PvnISE3xENY+BVaBsg/RLZZjP2bXV0bkBNRRICkm4G4NYcKLDRLSJwJPcaSTmv8+HDKOkVqR2WVRsaA+fJzP2ot7sJpRkwlY8vNx5KiX2iuPIbhRdoSja3V6tUtOmULzY/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQaprROVYHxccMJMb2830m1csFgyQUVaDtBg0kWM5ss=;
 b=P5j2qiGmCcvvq75GeqTm4D1/IqoOH1+iakRjvSk5yk+/62znvrEy603DgJlpLINYHFdPU835MfcJs3AgSUGk9Pa3+k8wtoqo0HVCmCHsCMBrY5A/rZd7aDYbyREtvnx8pUi15b1n+51FHsvB+fVWa3u4Ckw9QAKXNntHQwLI/0I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PAXPR04MB8912.eurprd04.prod.outlook.com (2603:10a6:102:20f::22)
 by AM7PR04MB6982.eurprd04.prod.outlook.com (2603:10a6:20b:dd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Tue, 27 Aug
 2024 11:38:20 +0000
Received: from PAXPR04MB8912.eurprd04.prod.outlook.com
 ([fe80::7a71:bd84:cbb9:add8]) by PAXPR04MB8912.eurprd04.prod.outlook.com
 ([fe80::7a71:bd84:cbb9:add8%4]) with mapi id 15.20.7875.019; Tue, 27 Aug 2024
 11:38:20 +0000
Message-ID: <3740ffde-e3c2-45db-8de4-e968dba578d0@cherry.de>
Date: Tue, 27 Aug 2024 13:38:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH v2] linux-firmware: add a package for
 ath12k firmware
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20240827100343.127172-1-dmitry.baryshkov@linaro.org>
 <e30c7d94-0e6d-4e82-8ff0-511cd3526387@cherry.de>
 <CALT56yNt9cFULbzMpSz7sBXzS9+b-=K7JnvBLUKWvJ6ieUniTA@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CALT56yNt9cFULbzMpSz7sBXzS9+b-=K7JnvBLUKWvJ6ieUniTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7b::13) To PAXPR04MB8912.eurprd04.prod.outlook.com
 (2603:10a6:102:20f::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8912:EE_|AM7PR04MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: 61af6cde-f65c-470c-5cc3-08dcc68cc01b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Zi9QNlFjcGI3QVNMcFFNNWdCcXYyUnIxL3Vzei9BSTJiTFFhZnQ1YTJ0N2lp?=
 =?utf-8?B?bUFERWVrWmd0ZmFUMTJiVjBPRW10Vnk4Z1I5eWxZNWNDM3BXbDBWUGhQYktG?=
 =?utf-8?B?ZHZ4TktZWlQ3VUpJeXV0SzN1T1c2VUo4UUJKeURCeEx6MjRML28yNUlwS0NR?=
 =?utf-8?B?RGNBRjZFdkFsTkNYQzBiTnZxMkNoakVpRXpNNEtYeENSODdaTy8rcGhDWlRx?=
 =?utf-8?B?Umg5MlJBbjZObnhqS0NXQldXSVp0OXhISEM0VnI0ejc4REwyY0lUTzBxRjFz?=
 =?utf-8?B?VGdxc3pKRk44bTFCOFdNMXE4cEZETmdadGYvaFdNd24yZEE4VXlKdHdvUjhz?=
 =?utf-8?B?c3JJak5zUjdIZnFVbk43eGFmOG9uMFdzVmpPVFJCbUZhRVZxdjVvWWluZVlu?=
 =?utf-8?B?N2RGUjgvWU1lbFlRZnBXTm5DMm5vK1dOYTZxZGFveVdrcGkwdUZGVmZtU3BT?=
 =?utf-8?B?aG9aSmNBVnR4bWhqYndjTXNkMitoNXBGUzIzNnNkc3lOUHVGVithUGJab1NH?=
 =?utf-8?B?WHlNSUhvSjZ0SUhNekc1eFJWMytUYURHTjA2ZU1LcVhicUdFeGdIbzZvRWJB?=
 =?utf-8?B?TSt6TDZRSlZkS0NMdUVldlBhcFNkMDY5L09sTEhpQ3hJV243U3JaVlpad3Rp?=
 =?utf-8?B?RzF0a2YrYWI0WFpOU1BoRVdLdmtoVmIrenVzK2YrNW9tc1NZVkpGcWVHT3J5?=
 =?utf-8?B?Y3BwUVlLem1jNm9jNFJUay8wUEp2WG5nR0xMU2gwSDgyT01USThPOTNOWFFy?=
 =?utf-8?B?eE1vZWxoYktDajV6UEVQYkVBSjlvZzBEay9zT1E2cjAyWDg3SnErRjhxSzMv?=
 =?utf-8?B?QUNxUmVFN2VnRWVMaWsxTzQrRG1PNmszdkJyRHpKT1d1Ny82K0V5WGowQWEy?=
 =?utf-8?B?Y2hsc0MxWVNvZUhFL0owODMvbmRvb0I3ZXQ1aVdvL21tQjJGWUZhK3ExWmln?=
 =?utf-8?B?ZnFuTkhJc1lSeTkvUzRLSHNXZFFERjBGN1FXbzFpU3c0dVVRdlY2ZUlWQjhR?=
 =?utf-8?B?WmdVeFd2RjJtQzZMTTJUR2FYVnl0SzhLUUdsTWtOZWRzNTY1SzJGdEVIak9M?=
 =?utf-8?B?N1VIKzBMSDJOK096TitqaGNybXlTK1pKa0U5Y2syd1hIdFpVZkZJdFVHSkJs?=
 =?utf-8?B?aXFlTTdXeGlJd3YzTFd5L3NoT2trbzg3d1EwQlY5bXJmRmZWaEs2TTV1bnEy?=
 =?utf-8?B?eGhuck1VSy9RNXRQWmd3SklUVzhIUjVSY25ESGFYY0hIUzlZY2NLcUVaODJ4?=
 =?utf-8?B?dEg1WVB5eU5ZVzdhQit4TFdzRFhVQytheWNtRGRHYXFISGxKV0ZNcUxmTENi?=
 =?utf-8?B?VHhJczZLWXV6QTF5U1UrNi9DcFJoWmk5WkphT2ZHeVpvdGZCL3JmUTdicGxj?=
 =?utf-8?B?Vm1McHRoQ0owNUxEZVlmNk5FRzFDcTBjdE9nR0tiZVA4RFVtRkRNcUhJanNR?=
 =?utf-8?B?dnFHM3lDamhQOFZwcjhYc3BxTWZwZ0pQRXFCSHRTTzlWa1kxazZydmlHT1NB?=
 =?utf-8?B?YzcyNEk1UHYxNHRHeUU0dE85RzgzMHJGTjBKQTI3STZqUHJJRGVGR3orS0RR?=
 =?utf-8?B?dmFMMDZRM3d1b1VnV1dxRFY0eGdIYWxjK1UyMzNyR0tmWWZaMTF1c3hDSHdG?=
 =?utf-8?B?ZlJhRWR0cmhwY0ltV0YxYkR4VkdPdjVqNUZsVlBmNEIrL0N6ZUR2K0VMM2Ur?=
 =?utf-8?B?RyszTVd1MmliblY1TGRKWGxFUzlJbXYyQWUya2F5SUdWQXpPK1NkWlk1TWNK?=
 =?utf-8?B?Z0RoNWhSZ0tLTzcyNExaQjJpNnp6cjEySjNtekNVQWx0ZndKYXVqN2NmOVky?=
 =?utf-8?B?MG1wRE45RzVRQys0Y01yUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8912.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a2drcXdpK2cyY1dhTCt3RGlhMnpoaGFjUURiV3FJOGVCZkxhcXJFeVRheG9U?=
 =?utf-8?B?ejV1SUZ3M2ovLytzeWJvZjRpa3dqSVhtbVBlZHJlY001dmowSUpYY0hyYW9K?=
 =?utf-8?B?SjNpVVhVcFhLc3lVbGJENHhydU1HTE82aUxLRHRSRGV1N1VPM2dUQnBsUEpn?=
 =?utf-8?B?Z3BzemRFenRwT3hlMWgzdkZzUHhjb29ZSzNUTS9YbHUyeEZBUjZqMjlCaG9S?=
 =?utf-8?B?WmNIaWVZcFNGWFlzVTl5QjN5dzhWQzBsVG05cEFWRHlsaWdlZEduWFJIckhE?=
 =?utf-8?B?UlZZcjF2TnlGdURWR1A1QkRLRllkd1B2eGlJS0NYVmNaS1pjaVhZUWY3clQ3?=
 =?utf-8?B?VWJhQ3lxM2dvZTlISDcyMmRwcVRPaDBqSm4rQkRnVk5KU1N5U29UanJ0cTVq?=
 =?utf-8?B?aVJsWFhhOVg4UzRMZEhRVWtGMC9GR3pPdE9KWS9CUEFBaWgxR2NCQ25nRGs3?=
 =?utf-8?B?a2lLSDA1M003S1FaeEVjQ2o5ck0rKzFlRlR4UEU0OXVKL1dES2pYeGhRYXRI?=
 =?utf-8?B?eWJydE0xaVFEZWc5NTVQK3Z1MFFjWGdsUWhIT0pubWduMW0rKzR0NlAvMVcz?=
 =?utf-8?B?dDhUNlF3TndodCtWdk1KcVhvd0tFNVhEK3YrUGxJRVNuaXJDQU93NTM3M2pv?=
 =?utf-8?B?d24zam02dUhicTg4bVkxdHR2VXdpTTZ6VGo0N3FZRG42MlNrclUzR0djRSt6?=
 =?utf-8?B?M3NMZlBwTDVwV255dm01ajlDUFJCTzM0RlhVamdVQVdPYlo0YlQ2c2xRZnZl?=
 =?utf-8?B?Q1R2NVRlY2hrZFI0Z0dpd0NKUW9VVTZWdFFDT0haWGExWE5mRWlWelg5OGJK?=
 =?utf-8?B?UVJGeFN4RjlaQ25NQmh3cWhDREU5QllTclRtQVVHRnphUVpMbWE1SzJEVjdt?=
 =?utf-8?B?M1JWd3ByZUh1TTlHWUg3Rjdyd0E5QjlFNjNqOFFXczF6Rk1pWjdwYXArTkFx?=
 =?utf-8?B?aSt4VmNPUjY3dm45TWp4NitOdWNuL3dtdGtBczF4QjZHOXRIVlpjdVU4aTdo?=
 =?utf-8?B?dmxMMDNyaWhWYkVWOElLNHRHQ2prT3VFTjFpUTBkL2ZCTnNzU21NK3RlYnE0?=
 =?utf-8?B?YXJwM2tMR25oNGx1ZGV5NmM3REpYUEtMbEh2NSswY2FXWGt0Q2lBTFBzMzJk?=
 =?utf-8?B?YnhBZnhtdHVVZmZFWWhrZkx3UEZCdm9YRDJuTldpTmo1KzdjZzJ1ajVtUzZa?=
 =?utf-8?B?aHZJeVkwc1lGRm96OVY1S2xwWEExYmVDTnYzREJZTkVKVHJ0NnBMRlpWdjlu?=
 =?utf-8?B?ZzZUUFZlUzdBZVNMekxneEh5VW1seFdTOUNzTy9ESVpYNGVVam5IV2tNYzVL?=
 =?utf-8?B?RGVmL0I3cDl3YXNISTZYeFZRMk5Lb0dTOW01bHcvREthSkoxV0E5YUdqSmQ4?=
 =?utf-8?B?NmlFd3ducXFOdndTSytGUmZkTFdiY25Odlh1UFQ5VGw0QVQ0MmIvTnR1V3Vw?=
 =?utf-8?B?cjFkZ2xIZTVUTmZqVkdlckRNRGdzL21lblJzOWxWSGZSbzA3SENkQjgrMWQ3?=
 =?utf-8?B?UndTLzlEMk1CNWEyNEZUUm1RenVlaVlpTDNEbnUvWWhNK0gwNWRsNXlveUNs?=
 =?utf-8?B?clVncGswc0RJbm15TmVlQkhoM3ordmpycVNnZlZwWnJiVHpuTncwbHdrVWxt?=
 =?utf-8?B?b3dRNGEvTDlWbGpxczZKWnJhdVhFVkJtaG0vbFc1ZzNiL0cybnFnM1Jid3I3?=
 =?utf-8?B?R0o2MmZZZiszME0xWFBnNmZhMHdBbWg4N21kQUdCY3RzTjhDdmgzQ1AvUDJN?=
 =?utf-8?B?TnNBeExGYUozU3lGMVhMTkNvSUtIWk9lSEMxY3MvdW1mVW5RN2N1NC9POWRN?=
 =?utf-8?B?dHVWRFhFb0JUcTR0QTQzN2NYVngzUU84R0I2b3VTQ3NDSXF2bjh3UnJCOXpT?=
 =?utf-8?B?Sk12ektQa1g2UUg0N1Y5ZnBvY0FoVWJ1UEV5NGRxcUhlWEpRQ1o1eXIxTUlF?=
 =?utf-8?B?a0xHelhFVERLRGd1NVorMDNoaXluZzdBbXN4YzhRU0hWQnJscVVsNmswelVr?=
 =?utf-8?B?S043RlRySUFzMC9jK1B1c1VTQ2lJWndGd3hxWnVocDN0eVZBVktPZ2hpZ3NM?=
 =?utf-8?B?eS93Qm5sS0laNTRrUVQxaGJ3N3JRV3RGd2h4RTdJN1pNaG5oZkVmcHEvcFRq?=
 =?utf-8?B?VzJDSnRLczdmRURJMm5Lcy9LNm9KV3UzYXpQZXpHRGNtMG1uYkxLTTdka3Jt?=
 =?utf-8?B?R0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 61af6cde-f65c-470c-5cc3-08dcc68cc01b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8912.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 11:38:20.1739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /hgDCuT6IPpSd78urI3U92vyjtIEppNwiLkUkS+ShXavnQ214jESlFwEk5q1aNsgbRDlkDWp2g3z6735N+o6QEFVxBlV24Y1vZ9Gbv2Uoi0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6982
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 11:38:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203834

Hi Dmitry,

On 8/27/24 1:37 PM, Dmitry Baryshkov wrote:
> On Tue, 27 Aug 2024 at 14:32, Quentin Schulz <quentin.schulz@cherry.de> wrote:
>>
>> Hi Dmitry,
>>
>> On 8/27/24 12:03 PM, Dmitry Baryshkov via lists.openembedded.org wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>
>>> Add the firmware package for the ATH12K module.
>>>
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>> [DB: added rdepends from PN to PN-ath12k]
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>
>>> Changes since v1:
>>>    - Added PN-ath12k to RDEPENDS:PN as not to break users expecting ath12k
>>>      from linux-firmware (Quentin Schulz)
>>>
>>
>> Was it really part of the linux-firmware package? I hadn't checked
>> myself, it was an assumption.
> 
> Yes, it wasn't split to any of the packages, so it was in ${PN}.
> 

ACK.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

