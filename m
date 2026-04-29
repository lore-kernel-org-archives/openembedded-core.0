Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF911FF8867
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 09:55:01 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7879.1777456493868836070
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 02:54:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Nb8mU0MO;
 spf=pass (domain: cherry.de, ip: 52.101.84.58, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YN4YDJxggPInXOcOIITiu01PJ92rf+J8wIBZbMcYz3IAYMydxdxmdNI6g6VtjM/dqI+UuTWyG6C98T2debBvvo11roKHos9Fx2Qw8B0BxBk8s5zhiNdbKeAy0GSAi3FnLbbtto/0awphgIH/zluAu2UcU22FqnZcvjxE+Znq3LjmGk/Zgf26iLL4mFZ6sSdFf3SxW9Gy0kgZTojpPV0I+5hJXgpyHZHXb+KDmvgFMHv7Dw5/F+/J//RyEveHr4s4FKskat3oV/lpijiTtTVc11xT2E2pNH7r7YRqBPSsBu33d81ukgWlrcWciXMWD6c8qYXNvZ7PJLQqD4e/YKh6/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6M+fdPMrBOXpfz19b4Aei6lQLhxgfUNfVFA75dj3WAg=;
 b=Yb5aj043/El+lo3wGcy4McQlta5ZEiupw3aeM8nCoFL9OjjIrgBKNpMwZXCe3IxVAPh1b0/BZzvuvKRkz3WBgfr7Nh4xSWX7PbFB0R/bbnjtPkM+aUR5GFSEZ8eCCmR4PzT31BqQz/QMBD5SkHeLJeGCbZqiNEk6q5X5OjyN+CK2F0JDRK7hemXKhRRbIyYOOZw0tLsn1uBHh/lkK/eWyB2aMIgTQkMBA4krFOdjlrCuXVSGN8d/VlqEczKIltpzO4l51rZBOD+8bzEfOlumu3LRPWlhHyJdmGybD0dDktythoPw48z2xnCrrAH387H+KD65kGNqZMzwx8p55oejaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6M+fdPMrBOXpfz19b4Aei6lQLhxgfUNfVFA75dj3WAg=;
 b=Nb8mU0MOCbrF8DB5TjS0qT6ANT5Nu5HhPpJLovZ5SZZE9Ljlc/LfyPAfRFMGbRN4iBz3WCVfT3VNVFLwW79kClaYBcS8bsSvA8Se5xaN6nLutjB1nJHvraFJpNa1hMh8L3ag1YdOVDS+7ynpwG5PP2Q6/+/x4e8AkQD3SqgB4LI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AS8PR04MB8152.eurprd04.prod.outlook.com (2603:10a6:20b:3fb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 29 Apr
 2026 09:54:47 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%4]) with mapi id 15.20.9846.025; Wed, 29 Apr 2026
 09:54:47 +0000
Message-ID: <b12002bb-9cf5-4acd-8fb9-6d4c4d959497@cherry.de>
Date: Wed, 29 Apr 2026 11:54:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] u-boot: Fix u-boot-tools-native build after DTC
 update
To: Marek Vasut <marek.vasut@mailbox.org>, joaomarcos.costa@bootlin.com,
 richard.purdie@linuxfoundation.org, festevam@gmail.com,
 openembedded-core@lists.openembedded.org
Cc: khem.raj@oss.qualcomm.com
References: <20260429001811.2723886-1-festevam@gmail.com>
 <516fab60f06521e2335185dc20d8b8c1d1330730.camel@linuxfoundation.org>
 <d322d9ea-5312-4033-a0fc-91abd7fd71cb@bootlin.com>
 <fa25613f-508b-4bd0-88c3-df0605f114ba@cherry.de>
 <4224196a-5bae-4ed6-8bd8-406d48a0b7d1@mailbox.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <4224196a-5bae-4ed6-8bd8-406d48a0b7d1@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::15) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AS8PR04MB8152:EE_
X-MS-Office365-Filtering-Correlation-Id: fa653fc3-1a88-4a2f-f67e-08dea5d558d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|376014|366016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	5YeeuG+3wVvBwZGXCXBz/mF01VgBGkBalPzIPmwzHryR6E5HjSRnoDy+9x2xllXK98RwTelTfoj2vywdta5F25jluUP3Lfpd1bYksWQisa1sAIJ+JVWW8Vj59M+8OQ9Umr3PiZkEk0IM0oNn+VRW6pQzun05iFKmEgUTMVvAg77MCkUYGoJok4i1xqqFG28RPGYzaaY1kmWgeRpJwswh1MwngWNTrmUth6K147y8cl3I9zrFjXrQyDyN61IoRsWAfwlIhbuPMXlLb3LJYegu2ewQGNHIG1rfZ59ssEzzOJK4Og4XMkMvlTBVaq1bwsbafySdKuZHGzdobVYnUqhHTmb6zepm9nUCtpnvg9S0LgGIt2UehhKi4/FmLTSyIpkZFtQ89edQLcVFQRylSwfxiTJFC0rPrDqTjBMdTOcl1NgnyJZ9vgVz3zdSy/AZU97lNe/BWXpY3rMA/C5itz/cFHeEmafn/cfuosgQ7TaGWV/XYvhd99axuCHD/vXMSrjF6eW7LV4oz/OZLBeOluaVsw+tGl6i4o+Y4k7Oc8LRZB1hlWfoenz3JyYtY9eFWxlGZIzwGLUNe+2DfOO/Auj/AsmDAUPaRQtXpmw38+7D1vfNZtbIq1jIwTyC2FJpqsyucBXGQqAtvTkBboMX3RvaycuhplTVrmuri59FehV2wBPH67X5SYqTxFYtd6F8LQ+0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bFRhTWVUUGVDOFJubjJHcndieW1lZDJUdHk3dFVIRkJVa053cHk3NitlcUVk?=
 =?utf-8?B?dXZpSFZaNWk4Rmk1c3lMYnU4dEsxV0FzamJVQWNyOGFVeGhTUSs1UlE3Mnhn?=
 =?utf-8?B?dTZEWlJYZHZ5aXV2Q1F6YWY4ZjM5RmlhUzZXODlVOFhuVVpFVVB1c0F0TTRx?=
 =?utf-8?B?THN3NjhHSHdqTS9LaVlmYzlqS2tOYjBHTk9GWndsZGFOaFRERWdGQ3lZbkZu?=
 =?utf-8?B?QVdXcEwvRmYzRERhd2hTdC9TWFY4K2srSUs4NGxGajhsNEg2NGhKb2tjSklQ?=
 =?utf-8?B?NlQ3ZktWYjRJYlR5Qm4zU2w3Nk16OWtHRVZDVnZSY29yU3BwN1htcGNiN2pQ?=
 =?utf-8?B?YTZHRitGdmZBTEliMVc1VGEvalh3ektQdnJjM3krSzlJT3VhR0xqT3JITmpL?=
 =?utf-8?B?VkF5aEk3TVRBVDVWcU1NVnhHeCtsTEk2ZkROOVRnZU1BWkFsMGVNUzJwVG82?=
 =?utf-8?B?VFdCWjFyMG8yWjZvVHErald5czRqeDZTSU9qV0IrUktnZ2ZDTjBKaUhOTzBw?=
 =?utf-8?B?OTk0Z3lEMTBtcWtrMHVldzg1WDZianpxYncreW91S2RPWk1FeW9kaThRUDlX?=
 =?utf-8?B?WDI5c3hDSEtSeVEvYXBDWW4xV0RLSDZYYlV2Q0dkVkpUc0JhTXZYcVZGaXUr?=
 =?utf-8?B?N2NiUjF5WmFYbDMyM20vRzh5YXNRZitKMjd0ZlZ6cWhTeU04K1NPK3dsN1Qv?=
 =?utf-8?B?WkVSaFZyR1N0RTZBNXRsWDRyWUkxMnYzQUIzRFVaNURGN1FvMXo5V1pUSnBs?=
 =?utf-8?B?MEVxdERlVzY2SndoQklzZ1hPa0p2dkNTRkdUSGVvcE5ocDB4OW1wdm9NU1F2?=
 =?utf-8?B?VURicExDbmkrb2R0eGVtbTJNbElSNDF4bG5vcW42alhtSERzeDZ6RDdUU2ZF?=
 =?utf-8?B?Vy8va3VYZGZIK3pMZmlnRDRuMGRwWXFpOUluNDhRVkV0SjJDVnJ0STFhYUNx?=
 =?utf-8?B?UndqMGhNTGdxaUQwUTVPN1V3ak5QQ2d5Z09OYUhCamxsSDJnb3hLRExJVm1K?=
 =?utf-8?B?L0RIaTcxUVowMVBQN0s0Z1V4eWZmTFVMaEhSUXY3K01jcXlzZ0IreE5ndXpx?=
 =?utf-8?B?TmtPT1ZxekdMdmp1Nno3Q3RnZy91UlF6SzJBZVpYRnlkQ3hTQjFianFOMHJr?=
 =?utf-8?B?YVdMTmNqT2RNbCtwRE0xWXNaTWExWkQ1aHloNnRiT2IyaHVBMGhRWW52dndQ?=
 =?utf-8?B?WWZvMGkyU20xZklTc0ZuaWduM0d1d0lRV3VaL0gxZmo1ZTg1Kys1Q3ptRDAy?=
 =?utf-8?B?QnlNWlRwenpJUGZoTk00eFR6a1UrTWhCNHQwcjY2a05xQVVCa1htYis4dHcr?=
 =?utf-8?B?aloyY3RGWFRoTnVGT253N0wrOFNhV3ByNTlaUXpJZkRDLzFHTUhDZGw0S3N6?=
 =?utf-8?B?V2FRRlVkMVRSaExNR1ptR0czNlFJenJTWjNKVUE0WDQvKzdUTTlxOXFPa0Ur?=
 =?utf-8?B?cG5nMEQ5UlNOd09TdGJ6eDRRN2xJcnBUN2tNNkdHQTFEb3Q2UFNma2d2eGVJ?=
 =?utf-8?B?eXF5WG9SNEdvWkNzR0pwQzBLZS9EdE80VXlZc3UrblFGRU8wdnhuSnVKNHls?=
 =?utf-8?B?YkhTeDBXQkFkMlBWcnFleFdFVkJiUjFMYW4vekVIWUpqSGFFUEZrQld4ckxM?=
 =?utf-8?B?TkVRaHhIQkVlbTNPY2wxa1pEUWp4blpGMmtrTGVsV0xkdHIxdWNUVSttMGhS?=
 =?utf-8?B?S21FNWQzd2RidTduRDRJc2J0M1c2SUFXeWVYaWRKM0tnaFhuajBjYTZHbmlB?=
 =?utf-8?B?V1lzbDMvazNMN3QzeDFkY2d1SUZNRElqZUtuaWpkREhKaXBqZHBYVWRDZHpq?=
 =?utf-8?B?UW12UzhCRFNYbXR4WjhMS0swSlJTSGg1UGU2YWsyU1FwVGJ2ZWY2M3N6eVJB?=
 =?utf-8?B?bG5zeG9UNlptWHRZdEs1VWhnVkY3Y2xFeG1BeElSc1N2MERKWE03a2ZhZTE5?=
 =?utf-8?B?L3lBZnRIMUJQRjhCaER6T3Y1TDQzRWc0dm1oUkVMcWx4cG1ybmdlay9LTDdn?=
 =?utf-8?B?N1NITmd2WWhpeUNTdUhENFRSdDRxdmRIOVNtRDlYTWtVcWw3N2d0V3dUK2FP?=
 =?utf-8?B?aEdmeHNCRlNpRi95RWp6TjBEMVpBRC9GMnJmVldrMEIzTFFTRzJqSkIySkU1?=
 =?utf-8?B?NWNGK2xVVGNrOW5wK1dIRXQ3eWZRSmV3d1B1TFVIM3YveUluSjhQMmZoYTBt?=
 =?utf-8?B?dE9FazB0KzE5cVJtcHVjcnFCS2lpNWZKdnYyT00wcjlMMGY4SmtNck9pSUlW?=
 =?utf-8?B?KzRRWHgvR21FRHVSS0doOVNWK2l6RnZXYjg1dTUzK3RoNDBpbGhhK1k4VjRx?=
 =?utf-8?B?dWZKNXA0REFaeHNQSzRVSGRnVnRkWHNFL3pwdVRlRkh6WUVqaFVoN2FQRDJv?=
 =?utf-8?Q?SV5JNONwW29steHNW8oGb6qHz2fF5nXl5HFov?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: fa653fc3-1a88-4a2f-f67e-08dea5d558d5
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 09:54:47.1989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MuQwaaDufHVLL7rWBH+PXLurkJfUe+tNmH6inyjlGLu69M6F4WMirf0JgM0YPZ60Nw4S3CJ3gTd6/M8TWnmcuU/Qv7IYthLJMg97hi6hEJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8152
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 09:55:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236096

Hi Marek,

On 4/29/26 11:51 AM, Marek Vasut wrote:
> On 4/29/26 11:01 AM, Quentin Schulz wrote:
>> Hi,
>>
>> On 4/29/26 10:43 AM, Joao Marcos Costa via lists.openembedded.org wrote:
>>> Hello,
>>>
>>> On 4/29/26 10:03, Richard Purdie via lists.openembedded.org wrote:
>>>> On Tue, 2026-04-28 at 21:18 -0300, Fabio Estevam via 
>>>> lists.openembedded.org wrote:
>>>>> From: Marek Vasut <marek.vasut@mailbox.org>
>>>>>
>>>>> Set PKG_CONFIG_SYSROOT_DIR as invalid path, so the host tools
>>>>> build will surely not find host /usr/include/yaml.h file and
>>>>> will disable yamltree build. For details, see U-Boot commit
>>>>> 807bcd844afe ("scripts/dtc: Fix pkg-config behavior under sysroot").
>>>>>
>>>>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>>>>> Signed-off-by: Fabio Estevam <festevam@gmail.com>
>>> (...)
>>>>> +# Set PKG_CONFIG_SYSROOT_DIR as invalid path, so the host tools
>>>>> +# build will surely not find host /usr/include/yaml.h file and
>>>>> +# will disable yamltree build. For details, see U-Boot commit
>>>>> +# 807bcd844afe ("scripts/dtc: Fix pkg-config behavior under sysroot")
>>>>> +PKG_CONFIG_SYSROOT_DIR:prepend = "/invalid/"
>>>>
>>>> This feels a bit like a hack. Is there not a config option we can pass
>>>> to u-boot to make this deterministic, i.e. always disable libyaml?
>>>>
>>>> Cheers,
>>>>
>>>> Richard
>>>
>>> Maybe setting/appending "-DNO_YAML" at HOST_EXTRACFLAGS (e.g., 
>>> through EXTRA_OEMAKE or BUILD_CFLAGS)?
>>>
>>> In the end, that's a direct consequence of having an invalid 
>>> PKG_CONFIG_SYSROOT_DIR:
>>> https://eur02.safelinks.protection.outlook.com/? 
>>> url=https%3A%2F%2Fgithub.com%2Fu-boot%2Fu- 
>>> boot%2Fblob%2Fmaster%2Fscripts%2Fdtc%2FMakefile%23L21&data=05%7C02%7Cquentin.schulz%40cherry.de%7C73feb8ea44e0468f38ea08dea5cb6a9f%7C5e0e1b5221b54e7b83bb514ec460677e%7C0%7C0%7C639130490251925693%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=%2BbKkw2HVgw52EWv%2FxeSlWRZ%2Ba3%2F3ireKwMxCLBvIwyg%3D&reserved=0
>>>
>>> It is still kind of a hack, though, but I hope it helps!
>>>
>>
>> dtc-objs will still contain yamltree and thus attempt to build it.
>>
>> Fabio, you are not explaining why you don't want to add the libyaml 
>> dependency, Khem attempted to add it in https:// 
>> eur02.safelinks.protection.outlook.com/? 
>> url=https%3A%2F%2Flore.kernel.org%2F&data=05%7C02%7Cquentin.schulz%40cherry.de%7C51022e2ce9de4d74fada08dea5d4e18f%7C5e0e1b5221b54e7b83bb514ec460677e%7C0%7C0%7C639130530938248835%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=fXgk4FZc6wnMD37AUWBnyJQBwmuAnjURis5JlZnT9iM%3D&reserved=0 openembedded-core/20260412035757.134385-1-khem.raj@oss.qualcomm.com/ but I don't see any follow-up or statement it should be dropped.
>>
>> I'm very much against setting a variable in the recipe that applies to 
>> all version of the recipes and will not be looked at again. Instead, 
>> add a patch for U-Boot that removes this (but again, why?) logic so 
>> that next time we do an upgrade there are more chances of someone 
>> looking at patches and trying to figure out if they are still needed.
>>
>> In any case, we absolutely need a justification otherwise I'm afraid 
>> we'll never be able to do a cleanup because we don't know why it was 
>> needed in the first place. This is something that has happened already 
>> enough time for me in OE-Core/YP that it really is a PITA for upgrades 
>> and cleanups.
> In short, see the U-Boot commit 807bcd844afe ("scripts/dtc: Fix pkg- 
> config behavior under sysroot") referenced in the commit message of this 
> patch, and the matching Linux kernel commit ef8795f3f1ce ("dt-bindings: 
> kbuild: Use DTB files for validation") .
> 

I know, I brought this up here: 
https://lore.kernel.org/openembedded-core/52fa5836-b061-4896-be48-673fca5ba3d4@cherry.de/

> I think we need to port that kernel commit to U-Boot, upstream that 
> kernel commit (should be easy) and then add it here into OE too. Then it 
> will be really a problem solved all over the place and case closed.

Yes, someone needs to do the work.

Cheers,
Quentin

