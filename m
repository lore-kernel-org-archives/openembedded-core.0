Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB470D116F3
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 09:23:55 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11033.1764753825970370441
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 01:23:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=nBB25aIc;
 spf=pass (domain: cherry.de, ip: 52.101.69.66, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vbxmv4JwvZPu4JyUibuEOTobA/LTO1Y0aWmB0ph/iEnRqqJtj0SwSDDPWsdqmfo6mhAMa7JSN3xSqPw8VLUn0/4lsgZlBkvHsRIw61gtXlWmM3yfse5KbgniJuz7Sz7OzrRCMWC/t7wnr6F+7qEYEG9uwhTyxaIQns9VvMM1laUS7k95Te4oHMVyCWfpF0Y+EIlvC1r83OSQlmy5o75JSVPVmw/ogAuTEli3V5S+tPEULtDqKhB2EjmAWD0cczWup1sdbF8XpfRppV+ujqPz+0Fs2MyQBMO8oTz/Ryzmj48bLDYE9dYXDzvwE/wewt/HthpQEHYop9BjHNNiuuMeZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IysrDsaOdyXr8mZPtCSFQjxO9kwy9+0zSCglCvN4KYY=;
 b=CqFgB4DQaluGOsP6SL3aVDqGGKm4/jipi081MTjcDe+yM7KA4Wet9DqGnZDhCoqfSw9wmuh9mk3rS9qwmytBPezgRmmBpguzhPwK7RhARsJJ0GQpKk87lIpOsv4ob2NzqmlicJRV4HQ2O3zlN/0J5TOFW4MMgZFaCll06wmyX83M684+YJnY2qdhd58XuKlx1ZnHTg6RYXOyVYyJixQ065nd5o4DAylpQ5x+Yc6GtPi78Z5rcCBUzfR97XAPytf7KDqzHb375j7F1hukDubeZfRk6HpEqUYT3jNM4zQwnpR3oansT7ioe9RE9Mn8WMxN25DOGRSnpl0vaDLG/cLJwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IysrDsaOdyXr8mZPtCSFQjxO9kwy9+0zSCglCvN4KYY=;
 b=nBB25aIcDs5FIQDox+wl47tluZordPJ5FIjCDzXgwr7luE8Gr2WO9mnT8Fi6C126p2sCRnR/GYSNRHLiKBpAX+7QNukIu/IdReoTetDW6dbi2Zz5TqlcCiuM1qLnW1NOLey2mL2c0MiZ/Zydzo2S2f6JovIvlEfQFOWXHT75qSo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU4PR04MB12026.eurprd04.prod.outlook.com (2603:10a6:10:643::14)
 by AS8PR04MB7941.eurprd04.prod.outlook.com (2603:10a6:20b:2a6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 09:23:41 +0000
Received: from DU4PR04MB12026.eurprd04.prod.outlook.com
 ([fe80::2c21:dc0b:a3c5:531b]) by DU4PR04MB12026.eurprd04.prod.outlook.com
 ([fe80::2c21:dc0b:a3c5:531b%5]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 09:23:41 +0000
Message-ID: <e7b38e1c-f3c5-4d78-9b48-db7fb8a3e45a@cherry.de>
Date: Wed, 3 Dec 2025 10:23:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] python3-sphinxcontrib-svg2pdfconverter: add new
 recipe
To: Antonin Godard <antonin.godard@bootlin.com>,
 Quentin Schulz <foss+yocto@0leil.net>,
 openembedded-core@lists.openembedded.org
References: <20251202-svg2pdf-v2-0-529856a2b6da@cherry.de>
 <20251202-svg2pdf-v2-1-529856a2b6da@cherry.de>
 <DEOGAEFW67EI.2E2AABT6GGWQU@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DEOGAEFW67EI.2E2AABT6GGWQU@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR3P281CA0179.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::16) To DU4PR04MB12026.eurprd04.prod.outlook.com
 (2603:10a6:10:643::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB12026:EE_|AS8PR04MB7941:EE_
X-MS-Office365-Filtering-Correlation-Id: 21c99b28-c5b4-476a-99ac-08de324da635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z0FqWFpNYU56T3ltKzVBVFJzaGRCQW41eC93SjlQVE9RbVlIWFNLdUNiaktn?=
 =?utf-8?B?WkVYRWNRSm4wbG1pMWI1MHRtU0E2c3ZRZitFa05kZUs5UHFyQitqVWRQMHVj?=
 =?utf-8?B?RUVOakhuQXRPVytEdFR1ZHVSUVErZkhtV1h2UkN2L1RObFZrT1FiUFZaUkdp?=
 =?utf-8?B?WmlxWFBzekJTUEljSERmUzF3dTllNmVBT0FiRWdrNk1hWVpYZlhzMjYwbmdw?=
 =?utf-8?B?VUZRVnhQNWRNckUvOXJLRDVpREoybUtIczBkc0lpbnRYcHZFejRZMmk5RVZ4?=
 =?utf-8?B?eUVGcVFhZVJXOXk0b3V1dTE1dURaYzJXekk1Z1ZQQWZmU1lVTWZOcC9OOUFl?=
 =?utf-8?B?a0lIajFMNU5VWmc1Z1crNkxUNUlrQ21acUFVQmtQTHZDQnVDRHV3Z0JPNld2?=
 =?utf-8?B?RnN0bnNWaHhHMVd5NGhsazhBcWY5K1FJNWkyUVdsc2xMbGJVOUFHdmxvcXR3?=
 =?utf-8?B?NWZESVM5dnFYeU9VUEpmbHZyeGNpcHhFdWZ5VlZHSHErZVBCM2pmRUl1bU1E?=
 =?utf-8?B?MGVxR3NRdDJJN3U2UVhCSTdHLys1L1lpb0VVYklDV1pWd3Y1aDNtU1d5SWhP?=
 =?utf-8?B?TVIvYTB5cmdxRjhiOGVNME9QaS9NY2RVQnJucnRtYy9VQSt0bmE2OXY3dFRX?=
 =?utf-8?B?Q0J0Yi9oWHBlVmMwN0pWVlYrM1E3STdXYjFtalNab0Q0SzJtemcycGhFc1ll?=
 =?utf-8?B?UE9JbXluY3pTQ0hrRURST0xRaVBXbUE2WHp4emIxak5HSzBSS2F6N3FVb3pY?=
 =?utf-8?B?VjVVQS84czZwekRnYkRyVTJLUitTTjlaZ3VreExRRWhDeEo5bzVaZXJSZEJj?=
 =?utf-8?B?UGcxeE1jYkF6clQrZFRSajJsMUE4YngyRXNJU1J5ei94NmIvN3dqU3ZiVVUr?=
 =?utf-8?B?UHRHZEl1RkJqTWtMaEFZbDUzcHBLbHNPUlRuY2xrMXVyVHVOY2Nwc1ZBeFdJ?=
 =?utf-8?B?bXhRcWhGYWVZbmdQVGpPcFJDZ2JWNmVXbC9HRkF2c0dKZTl5eCszaHVHM0dY?=
 =?utf-8?B?a0FVU1BMcVFQdGI4QlY0SVdyVEFlUHA1TW5TUW5xS1hrRk9icjlDRUVCU2Fi?=
 =?utf-8?B?N2EydWkxU3VPRGtEZzFiSHdkbDVPYzFsOGlPaVE1dE9jVnNzaWpOckhselNw?=
 =?utf-8?B?NmFuVkhGYVhNME0xL0FCRGZlZHFDcmdWbDh3UGZOTFRoWldGc3k1bmFiVHNw?=
 =?utf-8?B?d1NWK1g0YlpocVhvMjBlZyswSnZhUGEzeW5aKzFqaUJ6MG5IRHRKbDlpMlVi?=
 =?utf-8?B?VXBDVG1DK0FMQmQ0U0xwOGRPOE5sb3VxTXl4SnNVb3p1WkxRMGc1c3FnMExM?=
 =?utf-8?B?dTlvVCt6cEViMTFiR2RNc2JhSFVKY2kzK21jREVtMGYxUXRISGhyQ0Vhei9u?=
 =?utf-8?B?N0t6MDVMNVV5TGNBWkw4S3llbC9iWHZRWGtZMGY2dmd3QkNTZWpYOWY3eDhn?=
 =?utf-8?B?UEtwcnBIRUhYQWFtRFhmVTVKaGZxdldaRVJUazRDRjJjSlBxOUVicWF5d0dK?=
 =?utf-8?B?RDBQalEwUzVQRlRkdW1QNzJKbno0MlN1NU9td2wwS1FqYVZMK3MzVEM3M1pE?=
 =?utf-8?B?SFVIS0ZBMHRqM2lOTGZSNmRiQktsZUs0VldGdHI1TmNmNHZvdzZ5MjkwQkhn?=
 =?utf-8?B?cXRVc09LV215VmtJckVHZmNLY1BvWEhheGRuY3hvaWRYdXVVelpySGRxOE9w?=
 =?utf-8?B?elRlVzNlUVc2YlZrOEZtK1hsK3kvdGlOb1A4OGVpaEx4ZmFIcWhRV3lncW5Z?=
 =?utf-8?B?RWJ0YTA3ZDZMRE5YOVZXWk5kcjh6aUNCVTh5eUUwaFBUc1FiQVBBaVJUeVAv?=
 =?utf-8?B?c2FMZUN0UURWUytKN2diTjhUck4zSTNnMW9TSHl3c1Q1djZGUlNJS3h0WnRj?=
 =?utf-8?B?cmNCeTV3YTU2bmhDanRpVFdkdFRXd3NLQ0JzRmUzM2Qwb3lHYzd5a09Yam1J?=
 =?utf-8?Q?5Og8YO9Xc94tUNXkYD5CV+a4ou2/5OoJ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB12026.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SUgzN1VXV1c3M0hrUzZKVmVjUXQ0UmtFeGEvY3VVS2thd3FKVXgwRjBJcDVQ?=
 =?utf-8?B?R2g5MHBOVVA0UURpWElLY3VSKytZNFQwNmExQThFKzR6U2dzRHBFRnZTTEY3?=
 =?utf-8?B?blhhc2gyQzlhdzFiOGtCeE9CN1ZGak1sSXBnTXpVeWZGbDhPQTgyOVlTYzAr?=
 =?utf-8?B?TEhhbUVtMUgwMEx2T2gzTkFrRmc1OU9jTVg0cU5pVDdWaVlVdGhGUnp3QnBq?=
 =?utf-8?B?ODFaVUd2MnE3dllXVXIwUHVQMFJEK1pEU28reGh2cmhjREpCeHNzcHRheEE0?=
 =?utf-8?B?d25KVnVFclA3aHllVGlMbGlZWEYzOHRIZzEyWTJQLzdQYlpQaWYyT3AzTEV6?=
 =?utf-8?B?STR1ZUFPVytUcDR4SHpNcG94NHJEYVl1cWJqd04rQVZVK3d2cHpaY2NRWDVD?=
 =?utf-8?B?U3lGcEhHeVNMUGFjMEVEeG16MzFxVmVEYi9KcXZCVWU5MWtISHNETmNKaURL?=
 =?utf-8?B?aVBnT2tpajQwWWJZUVpCbjQvMXR1c3hSKzMwUzBUK3dNZlRseUNmdi9uTWtE?=
 =?utf-8?B?VHA1Z2U2bnBIK3oyckFmU0VxNEFQT3BmM3FKb0FZRDhnUkdKaE1RZmozM2hV?=
 =?utf-8?B?VHY3aTF1aGpSYzgwR1JZNHlqWXEvb204NzY1ODhTOXRuWnkrcGUrUFpoNkVS?=
 =?utf-8?B?YWhKQWN5WmxhZVRQQkhBMW5yNG1sN0laVHlIaG9BUlA2ZFl3a2VVckFwUHVk?=
 =?utf-8?B?Kys4Wk96RE5rVWxWVG1idlU3djM3WGlLclNNVklYNGU4WStQLytWUFcwalRq?=
 =?utf-8?B?MTRhcUx2Sk9qN3ZhZ05id2paL2V3MmxSWEFwVVdvTkpmbER3R3JoTjFENVVF?=
 =?utf-8?B?NFBidWo0d3VHWmNrME9BVEFTbFc2T2RLWUVkTyswK01TWFFScmQzWWhacWtr?=
 =?utf-8?B?TzhMOWZNZGd4L2ZGVXdLcXp2UTJ4OW5BVnJjUjFoZWRQUE8rZHBiTHErRld1?=
 =?utf-8?B?UWs2Q2tzY3R3dWxkSlhVZnNka0twTXl5dXRwNThyVHJtRnQvRzNUeFcwcFYx?=
 =?utf-8?B?NjNQSkZwZkFjdS83Q2E1a0dJaDZLV0RHWGxHK3RndTRubzlreUNhYlczcUZN?=
 =?utf-8?B?c2Uwcjc0dFZRc3Z3NGI1cW02TFRGWDQ4QWI4VUgvM2VlbTdFcURBOUxBRlVl?=
 =?utf-8?B?MEp5L2w5VXpoN1NXcmd5STNwcy9GTzl0SFFJTmI1RmVIS3hKS2FrU3EvYzFr?=
 =?utf-8?B?TnhmbUZicnFrYk9YbVQrOWgzQTh2U3AwVHhVSGdsTHpkcHJYNCt6MS83SGFY?=
 =?utf-8?B?RHZmeURuVUlsT1NqZk15bG1nWEltbGo2KzRvc2R1bEJhd29vL3pkNXRCZzVw?=
 =?utf-8?B?dGN3NlE2Tm9yaVlkYVVCcXc3S25ISU8wcVlEU09McExsRlRvNitiWFhGVStx?=
 =?utf-8?B?VXl3WFZyWVEyMUtLMmd4ZzdUNlhQTU1hUW1ac2hvNW9rd20vYnJSOUx1aEdl?=
 =?utf-8?B?RHh5QXh4UVFreHlITWorRmJsTkxHaE1PTmRhMVRqVFAvK0dQRktFOUttSWNy?=
 =?utf-8?B?T0FTdUEzVldTYnpLSmVQU3VIN3pvdFhVdGUyb0NxRHVGbnMwTDBLR3ZmUXhM?=
 =?utf-8?B?bmRvZzFrSDlyRWNyTXU0OTZ0U3cxSkVHdThOYWRhWURnUEVNWGJhdlNOQjRj?=
 =?utf-8?B?YkhudFV3cUdTNWkvT2NYMnFtWnFlOTVQVEE3VmJNeWNoMlJyeStGdCtHL0Fm?=
 =?utf-8?B?YjhQUG53UHBVYktmYTExOUdOSFp3KzVpWDJwbWh3cWhWVSs0ZDJUanpSdnNS?=
 =?utf-8?B?anJadUlzRGdvNFNuOXVFZnRNVjdScUhjVHM4b05jc2pnMDQ5UzlITlR6d1NL?=
 =?utf-8?B?U205U2o4d2pWUGZDaFhsQUZGZ25UZ0JUTndRRHdkY29PbWJGaW53ajZneGsw?=
 =?utf-8?B?LzNMeUMzeExNK2pGaFYvMG4xNnFyU1hSdllVOHFEaSswNGJScExIZnBNWFJj?=
 =?utf-8?B?bXRMa3oySnhXT3k0UnRGdEdHdTBqZEZscm5wa0tmQmtUbmQ2eVdDTFROUEdw?=
 =?utf-8?B?bGZMeVhVWlMrR2U4MXVuWUE4OWsxMHNHOGNLTEl6MTduc3JSS0dFWnpxYnhO?=
 =?utf-8?B?OHdoS3d1U1ZFMlpRVXlkRlFIY2pHMjBDTEFzVm9ZT0xEblcwYXNLdUlrbjkz?=
 =?utf-8?B?RzJmQVdjOGJVTDNXT1IwSFBJUGdoSGtobXE3N3pHT1VIa3NVdURpdmVHS3Fz?=
 =?utf-8?Q?7GIWnnNiL6JEAAcefANmIUQ=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 21c99b28-c5b4-476a-99ac-08de324da635
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB12026.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 09:23:41.7034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 38U9DsUY91v9buaIlBcZyZEgWI4rtpFdGbU8ZnvGi0S+zNr1WrGMsSSgAEtO9rZ0yc6OI8E/CAFxZKGdJ/gFv9NWR1fGx4a3M7rfs9Pna/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7941
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 09:23:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227212

Hi Antonin,

On 12/3/25 9:49 AM, Antonin Godard wrote:
> Hi,
> 
> On Tue Dec 2, 2025 at 7:05 PM CET, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> This will be a dependency for building the Yocto docs soon, so let's add
>> a recipe for it.
>>
>> This does SVG to PDF (or PNG) conversion for images used in Sphinx
>> projects.
>>
>> It exposes three different Sphinx extensions, each using a different
>> tool for the conversion:
>> - cairosvg, a Python module with no available recipe,
>> - inkscape, only available in seemingly unmaintained 3rd party layer,
>> - rsvg-convert,
>>
>> So we'll only support the last extension for now.
>>
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>> ---
>>   .../python3-sphinxcontrib-svg2pdfconverter_2.0.0.bb  | 20 ++++++++++++++++++++
>>   scripts/lib/recipetool/create_buildsys_python.py     |  8 ++++++--
>>   2 files changed, 26 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.0.0.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.0.0.bb
>> new file mode 100644
>> index 0000000000..c686ebff23
>> --- /dev/null
>> +++ b/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.0.0.bb
>> @@ -0,0 +1,20 @@
>> +SUMMARY = "Sphinx SVG to PDF or PNG converter extension"
>> +HOMEPAGE = "https://github.com/missinglinkelectronics/sphinxcontrib-svg2pdfconverter"
>> +LICENSE = "BSD-2-Clause"
>> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b11cf936853a71258d4b57bb1849a3f9"
>> +
>> +SRC_URI[sha256sum] = "ab9c8f1080391e231812d20abf2657a69ee35574563b1014414f953964a95fa3"
>> +
>> +inherit pypi python_setuptools_build_meta
>> +
>> +PYPI_PACKAGE = "sphinxcontrib_svg2pdfconverter"
>> +UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
>> +
>> +RDEPENDS:${PN} = "python3-sphinx"
>> +# Only support sphinxcontrib.rsvgconverter for now.
>> +# As cairosvgconverter depends on cairosvg module, no recipe available yet
>> +# As inkscapeconverter depends on inkscape, recipe in meta-office, 3rd-party
>> +# layer not updated in years
>> +RDEPENDS:${PN} += "librsvg"
>> +
>> +BBCLASSEXTEND = "native nativesdk"
> 
> Patchtest should have seen this, but you need to add an entry for the recipe in
> meta/conf/distro/include/maintainers.inc. I can assign myself otherwise as I
> maintain some of the other docs related recipes.
> 

I'll add yourself since you don't mind, thanks!

>> diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
>> index a807dafae5..c6a40f5a7d 100644
>> --- a/scripts/lib/recipetool/create_buildsys_python.py
>> +++ b/scripts/lib/recipetool/create_buildsys_python.py
>> @@ -858,10 +858,14 @@ class PythonPyprojectTomlRecipeHandler(PythonRecipeHandler):
>>               if metadata:
>>                   for field, values in metadata.items():
>>                       if field == "license":
>> -                        # For setuptools.build_meta and flit, licence is a table
>> +                        # For flit, licence is a table
>> +                        # For setuptools.build_meta, license can be:
>> +                        #  - an SPDX license expression as string, since PEP-0639,
>> +                        #  - a table, pre-PEP-0639,
>>                           # but for poetry licence is a string
>>                           # for hatchling, both table (jsonschema) and string (iniconfig) have been used
>> -                        if build_backend == "poetry.core.masonry.api":
>> +                        if build_backend == "poetry.core.masonry.api" or \
>> +                                (build_backend == "setuptools.build_meta" and type(values) == str):
> 
> Should this be sent in a separate patch? It looks like it's fixing a bug in
> recipetool, there's no explanation about it in your commit message.
> 

Sigh... I was working on this after sending the v1 and forgot to stash 
it before preparing the v2. I'll send a v3, thanks for catching this one.

Cheers,
Quentin

