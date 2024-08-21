Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDFCEC52D7C
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 14:10:54 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.104])
 by mx.groups.io with SMTP id smtpd.web11.20719.1724249452891863133
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 07:10:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=MgSHB9p1;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.104, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y8SoZiwPc8U3wHwNI4qjgtCKidYX92MidpwuKQ+pPjkc75FhDaJ3l7sQ4Dpw25dT79wnTTt685t4FjAzeTfuWGbXzmR+ktOWUfne4hF34nqnY0PpK2WE7oGpikFsPFMsMAvMvpXgnjmReQxx0EdspermpKk5gLg7oe7v7MZhpC+mRo2ekmdpRK742S927hIsNQYuAJNl9nBbVpooxWgVc2eCSuEleA1pdmiJVIrJnnYXx3uYQROC+XnBU/O5Bcma2r4geDgG/JHZNmmBV8vQT8t0Iv2mPTFZNazyKOFugBet0paMTwNrhPjirVekqJgo73X8spHTnzGooNFpJwjcbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8FFyZkX01fBTYrQ6omB00KZylaViOT3JQd6FOmQXic=;
 b=XspPHw8xCh1nv1htR3QnJWzO6mBSh57/39ovj3NOALQt+Su1PyY1zF3o+3yhZ4uqcEQEHQ6GbOrlpygz4xapohp2MXlsOskvj+n3XPrcl4Wdv7Ep4grn7oDDZJZ2NdOsd86V/7Yt46V7a7RJ5arRb0nxNMbA5f8u09KuricnFmUmit1MATljC7p8OcauywNQM3Rc7eBio/S/eB6ER7kjAL2nu2ni0a/baFPPjtcE8hV7Q3aq8L1MDj9LGRP2ee5qBNTpQl+O/7krOGNz7VpQyVCIsGILbv9XMCQf9dwZhVlDj0wwdrw+UclewL897/3nGdKrpgXaGf+ysMZUs0Lsvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8FFyZkX01fBTYrQ6omB00KZylaViOT3JQd6FOmQXic=;
 b=MgSHB9p1dzUvifs82Sd18FwifsHA0u2ouFTr4mBYfdN0ugBBuT6UM2vPZ3NGTZqwQUo/nz4aKJcU8pSaFBF4DqFFeDou9xxUo3CsDHZk7mK2R4Uc9/po1vqRYbXiq4EUY+Z1vyQZsIsSg5KBhhTl51NjOHIfer0mnYA29yd18/FZC+NEunA6p3ljIdULkNgwhJfGyslBgNUE75m26RUCxNhsr0sniE8T0IIAh2RBpBKcrqFYUQfrXAlKwYH4h4EtTTEdSamJ+dFAF2MY+TQw+hTkoOX+CdzjHVRWMpd5tg4fBPXSk+oZmVoNzzXn4ZyPEQTdl7wbZ6u/TPPHtbwSiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AM9PR06MB8164.eurprd06.prod.outlook.com (2603:10a6:20b:3a3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Wed, 21 Aug
 2024 14:10:50 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 14:10:50 +0000
Message-ID: <0a2d4d60-8850-4e40-8638-29e948d16e8a@vaisala.com>
Date: Wed, 21 Aug 2024 17:10:47 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v5] util-linux: Add PACKAGECONFIG option to
 mitigate rootfs remount error
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 openembedded-core@lists.openembedded.org
References: <20240819182649.128659-1-niko.mauno@vaisala.com>
 <20240820191943c7d1348a@mail.local>
 <f236db96-06ce-438f-843d-25530ac1d16d@vaisala.com>
 <CANNYZj_X-TYO8vLoJBTqwmwrwD0Q2bEPi3TJL3N9hMzV-1JUhQ@mail.gmail.com>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <CANNYZj_X-TYO8vLoJBTqwmwrwD0Q2bEPi3TJL3N9hMzV-1JUhQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0020.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::32) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AM9PR06MB8164:EE_
X-MS-Office365-Filtering-Correlation-Id: d541213a-1953-4402-fcee-08dcc1eb0f04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|4022899009|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MXJrSVVOMnZxMllrc3lxTGYzem5TeDlWcVlvNXhqTGJJWEk5RUFWNGpnT0dr?=
 =?utf-8?B?R1dtTVZjaW5kZzFGZlBSeTdFeHdoL0FqUzBnVm9NUnhjMDhqWTF3ZXVkWWRr?=
 =?utf-8?B?MDN5VUpKdGNwcWd0K2d6UyszT1czQldScVhqOWNsWFAxeHcwQUxxNUI0MkxS?=
 =?utf-8?B?N0xsdXpubDFWQlFydzl0YjR0SVdKcUhyeXZCNlJzR0dTQ3F2MGVLbzR5bUJX?=
 =?utf-8?B?aTNTbUpaZTU0dFRnWFhxV3JCdjVieWtFVkJseTR4bUovQitzY2dqSnpxQ2VC?=
 =?utf-8?B?b2pldktTaG5vV1Y4SE5TblE3Rmd5V3k2RS9BS1B6Ym56Zk5TeUF4S292WUNJ?=
 =?utf-8?B?SW95a21kUVZJZlVYNU1hSUk4Ui9qZXFoZWdnSWFiZ3UyYWJQM2RnbmFyNmpq?=
 =?utf-8?B?RXJ4NEFJZ3V5TUQ2MGpxZ0Vad0tScHZoTjk4czRubzV1bFlEVmp5TzNoYjEr?=
 =?utf-8?B?dnhLNmYrOWV2Qnk5VUc2ZU9nMitwMFBGTDVaT3dWYXBWTitaSCsyWENZbFcz?=
 =?utf-8?B?aUVmYS9QNUdNT1A5bENyYUFHZWtuaittYlNFV294UUs4d2RjOWpYVC85L0xm?=
 =?utf-8?B?dXJaMmlhblBWa1VTaWIyaisvOENMT24xMlBsZFpweDU0WS9XMVpBeGJlVTZS?=
 =?utf-8?B?MjRXY2FaNFQxVFVPNEdVOWZCaFhkVThSSTFaQXdGc1U5QUdSUjNjaFIxb0c5?=
 =?utf-8?B?UEY4Z0YwdW9XTjZCUEs3eU9kUGdwNisrNUNSc0F3bDFzWTVVN21kSFB3UUF0?=
 =?utf-8?B?Z1QxalZ0bHJRZ2g5WW04OWw0RUkyZFhXMFB0bTFtZHJVRElwQUFEL004bTR6?=
 =?utf-8?B?V3JobWVaMlJZZjQ0RWNJSkM4RWU4V3JPRnZEQVVVYzNWZkt2U3RneUdJdGww?=
 =?utf-8?B?c1BQQjUxK1YxSXloVTJKWlFxWVBMR2ZHeHlqWFhwUnRJUnlaSENUYkI1aDF5?=
 =?utf-8?B?VS96alN3S25ZeXUzc0h4SWtIRUs0M2RuS29tQmhZdk15MkhPN2I2S0hVQjJn?=
 =?utf-8?B?MXRPSDZtdERWOTVNaFNvNEhCbjJhRWkreTlNcHBjTDZtMTI5R3NDYzd6ME1F?=
 =?utf-8?B?NEpjZXB5bVkxTDlZeHNsTHNQQ0NsSW85dGlKaU9oRUs2Q04zVmpmZ1VuOC9t?=
 =?utf-8?B?b0dJcGI3YTZIVjBZQ2FZUVYyaXFZL1ArYlUybzVvbGtDNGNvZEVLUGxsQUZz?=
 =?utf-8?B?S05LRkN5VDViK0kxWVFISEFMOVJCS0wzamlLTkFuNnhSVUovK3pKWFY3TnlU?=
 =?utf-8?B?cSsyTmtZY3ZyTEs5SFlBaUIyWVYrL24rc2ZjKzRCa0tob213NWpuaUdYUEFL?=
 =?utf-8?B?OXlKaHYvM0NjRDBNWThPR3k2cVA4OUxRZWZLZnptNHVwczNGN0xWZkVKT25X?=
 =?utf-8?B?WitNd0xnaU9KbmViVGdxRjZydXpERWEvWFNiOEw4eFFlcHl4Zml0dDhESTVq?=
 =?utf-8?B?UzNsM0x5ZFFpZDN0N2NJempJS3JFRUZka2cyVTFzZ3UyenJBYzdhR0cyYkNP?=
 =?utf-8?B?bW9Xc3B4ZW1ZV0VPQUlZV2c2Yk1jc0NsWFhHVGV5dU5QdUJUTFI1VVR4b0VW?=
 =?utf-8?B?L2hsZGJCYk1zdmdBREkwcitXSDRlWmFPbFg2enlrYUlOd3RiR1F4SHZhOTdz?=
 =?utf-8?B?YVFoaU15UEhnb1pXL3d2MDIwc0c0dmhyRGI4SFVTdElzMTI5cHQvWW9QNk9O?=
 =?utf-8?B?cE1QUXdINlhKWGpQaG1IS2R4MTEyb2xqdTVZdUpoZHZzSjlaZlV6ZnM1NXAy?=
 =?utf-8?Q?bITDkshzAq5fpSLoa8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VGV1OXpCckNSSTFJSkROVWJVQ0hXS1k3V0VDeExWMXhJSWRwWThQQ1ZJSEM1?=
 =?utf-8?B?WGZSdmkza3lQalI1UmNYMjVRTDdPN09aSjdMVGM3UDRQcC9RVDhCY1pDSTBw?=
 =?utf-8?B?UlFrL0J5TTdzbWM4QWp3MkJtVnRWOW5IRXFCeFM3OFR3WFNtaGxuNGJudnM0?=
 =?utf-8?B?QmJJWVQxdDZ1VGxuZis3SXREbzFoWHdHWmlCMmxoUjlZRWxUb05KVm1USjBp?=
 =?utf-8?B?OE8yZG5rdWQzbXBGWXVtUzdyNS9ZWlFJSGlJRVhSbExveWJMZ3grWkh1MVUz?=
 =?utf-8?B?VFN4YWtzMS9kd2p5RjVPM29EQ1VwbkJWa3ByRXBCS2x0RXhIbVF2ZzBlcTBL?=
 =?utf-8?B?dll1dVNFeU5GK2lCSnVCZ1ljSWh2a09kYWY1SFE3bUVBL0JHNEN5MUdhaDRP?=
 =?utf-8?B?ZVo0TnFYd045SmN3YkFTRU5MUEdJbnVlMm9QcjNid1B6cG9VU3FUN0lvc1Rv?=
 =?utf-8?B?Q2Q3bGx3Z3A3VThnbW5qeEkrUkQvcTNNYVBYbWVDNzNYdUh5RndPL0l6SVlR?=
 =?utf-8?B?OEo5a3ZuaFdqY1haYmV2TG1vTC9iY09MWG1FazVmSUIzWXA4ODNDYjVlVUxF?=
 =?utf-8?B?T0xmTGtpbk1uVVpLQUdHbWhvZEs4Z1E1TktmMUlBZ3ovSTFwT0dVYVZJQ1dp?=
 =?utf-8?B?MmFXZU9xM2hqU3o4MGNpUEkvRUM1SktpcldqT3lNdEtrak5DMzFFZ21kM2d5?=
 =?utf-8?B?b0tCalpKb29PQWlNazZNTXNwUWVSTVFra1MzZmJsd1ZhbGpHeEhSL0tod3dT?=
 =?utf-8?B?WStjTEo2aEViY1VKU2QyVWxWUHdCamdtTnNkY3JtdThIWm84UklqVmVXNmVm?=
 =?utf-8?B?emVTY2N6YlZvbG5vekRRREduVjdkaFRiM25BL1E1YUlRekZEUEhabXVlUlJU?=
 =?utf-8?B?Nnhjd0pGVytBQm90VVJCdDFLKzZMRTVZZnpGaTJObTdsUVpXY1hiVTBDWmJV?=
 =?utf-8?B?bWNYY1lRNkNkVERKMWpzUUFnWFlTTE5rRFRkVUlxcnpQSnNaaW8vRkJZM3Bz?=
 =?utf-8?B?WW8vVzVTT0RjUk5VK0tsRWJCb1RuS1djUXNxSERkU20vWjF2SVd6SHBQZnJM?=
 =?utf-8?B?RFRHcVBWay9BK25MVUM1Vkc2WXpodVorcGNKY3gwYkNjRUJTeXI5cld6bFE3?=
 =?utf-8?B?UENoYXBtL2crdlZ4cFRjSXJuRFB6bDhYYXZwZTQzbk0wQVZoZ2J0UlR4VE9m?=
 =?utf-8?B?OTgrZDlnS2ptbktHMVJFSzErQ3BpQ2YyV21ZMkkreGM5MmRQVHVSREVxL1FC?=
 =?utf-8?B?MTBSeFg3VklQQ0Vzd20xbU1wMXJjcXAyazZrNHZ1WVdLb1ZTcStJZWZ4VXc0?=
 =?utf-8?B?WE1KUklhTXdMbjJZem1SK0l3dk8xTmhibWFQRnd4aHNGT0M5Vnc4bmhacEh2?=
 =?utf-8?B?QjEvNjRTRWpzVEZud2djcmdoMS94RzlTdjU0RnVmeTZaK1BYZXR4TTQ2c1dE?=
 =?utf-8?B?YjlYa3VrRTd1TVg5OEFWY0gzMW9Ua2ZCdHVrVnpuZXdNL2NXajQyY3ZLL3BH?=
 =?utf-8?B?NzBBU2VyT0UveklRWWpRSGdmdXJoZlA3TWNCdjhVM01DaEZZN3JJQTNKL0hX?=
 =?utf-8?B?RVAyYVJUZmlYODRLOTJDdGg4OVljME9ya2pGWEJKcmlLZ3JtdTJNbDY4WDlV?=
 =?utf-8?B?aVV0UXZURGg4L3ZhWFExcUQwOVdmcW5SaXZ6cnpXUng4TXNOQktFdDNYc1pq?=
 =?utf-8?B?LzVXVGpNVkJaSDZKVHZFcU5oNXJhU0ZlYjhnMHk2R25veU1ZTjJRanE2VG9l?=
 =?utf-8?B?Tk5tTytOM0MzRndINU9xc05wNC9JbnJ1ZUFMTTg3dGlwRnlsaVBPUkM4dm1z?=
 =?utf-8?B?WkFlb2xXcSs3MHJyT3dSZGRBSWJJWk1jWlJhTjZGcG5NWU5pbmF4MHRmMkRX?=
 =?utf-8?B?VUdBWGQ1SW5RUTZHT25WN2Z0QUU4aWJ5T2tyK3N0djhzcXp2cjV6L2xhZnpa?=
 =?utf-8?B?YnpWeDY3RzU2L1I0Ni9vZWUrelNhdjgyaWdWL2dSS1ZlUW5YOTBDSHNFcUpJ?=
 =?utf-8?B?VmUwZTdneC9TUTQ4ZjNBR3Q3dDlYNHNGcno1YkxpUWdXMVJwdTRMWXl3elBa?=
 =?utf-8?B?MUNWaXJSM2prbGNKUnlWRllzc1h2Rm0xY2lDS3g4ZkJmN1l5bWh3L2k0WDh0?=
 =?utf-8?B?cjZYdXBMRVBWdmZyd2xXSUlEd2tMUUMvUHpZbGZma0ZoSjZ4R0QrK0xheWhi?=
 =?utf-8?B?dmc9PQ==?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d541213a-1953-4402-fcee-08dcc1eb0f04
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 14:10:49.4236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jnlUWLRtxSGl6D84DDgQo/1+lKK0wLYuwmoV1m7PFYlvXipYW9JDu5S6v0oa7W69PwqJSWuux0tSX0TTnDg1lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB8164
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 14:10:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203608

Thanks, submitted v6 which adds the new PACKAGECONFIG option for 
class-target only.
-Niko

On 21.8.2024 15.17, Alexander Kanavin wrote:
> I guess this new API should not be enabled for -native variants?
> 
> Alex
> 
> On Wed, 21 Aug 2024 at 14:01, Niko Mauno via lists.openembedded.org
> <niko.mauno=vaisala.com@lists.openembedded.org> wrote:
>>
>> On 20.8.2024 22.19, Alexandre Belloni wrote:
>>> Hello,
>>>
>>> arm64 fails to build with this patch:
>>>
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/9356/steps/13/logs/stdio
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/131/builds/4727/steps/13/logs/stdio
>>
>>
>> Thanks, indeed it seems that on the older Debian build host, the
>> mountfd_api requirement fails for util-linux-native recipe:
>>     | configure: error: libmount_mountfd_support selected, but required
>> mount FDs based API not available
>>
>> Ref.
>> https://github.com/util-linux/util-linux/blob/v2.40.1/configure.ac#L1315
>>
>> I.e. failure stems from the added explicit
>> --enable-libmount-mountfd-support option that extends also to -native scope
>>
>> I wonder if there are any proposals?
>>
>> -Niko
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#203585): https://lists.openembedded.org/g/openembedded-core/message/203585
>> Mute This Topic: https://lists.openembedded.org/mt/107986659/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

