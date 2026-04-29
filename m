Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C28FF8864
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 09:01:35 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7071.1777453286440799712
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 02:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=HSupU0EU;
 spf=pass (domain: cherry.de, ip: 52.101.84.54, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQ1+OmxoyaTEdN3+JEKolj0Pc4Bf4elnb2AxAzBjRelj0BJmBj4fQE+HD6K4OJadWS5JIR3EGvVzIN0Bz42PJlKElCRV3l7jqsnkWb47vLyF/wtPRJEv4VH2qHmwUPmDdsaspYOPjdfUI/W3HVUACEHKc3xraYFidMQMQkeo6Cu9YYXna5bJDYU06pa0imHrq6PUbUGx2ZrBd1Ahdb8pilvMaeF5EvO4k8u+kMfK4/Y4SFj4dWCUTWR2ePfnL7syuhSh9EuqGEcelLg4AWz6n9rKLuAN/E0AGZ/d6Que8s/aK/ONFCJF32Q66WrazjqNKGzVhKUxmkjBAP+DxQaMYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xIMcqxYKctgQcc+objSf5eOWdKggPAnzJGFfVjHVWg=;
 b=W/3XMmWzKUrHDimdIYjtYCrxab5e1UMrsFFuxUd0weaq1QjGuk6TcVoxaW7ogt/PyRy/AegP0RQk/x3vTk/2lsxTrKfHX31LtmbyQHtYdRdU9LiFahyPvS+zIFd12X3cGFSoLVezt7jm+9236aWB4Ob/uBRBfQQtZOwNTQ4iSMIPkSck5Br+8UyEzEAQylTU9T2hizN6Cgc4P1KvQbd+2iRrSqJOf/aSzkU+KXJJAFHILX4C435+T0v6lGHoP4a9TPtBh2aEf06S55ClACJ7mN6gPt/cfPNqIpVnWpr62TXGKTzUYpT0G8w8SKyKj/23cuegbDikK8h5dJcAADBxVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xIMcqxYKctgQcc+objSf5eOWdKggPAnzJGFfVjHVWg=;
 b=HSupU0EUuyKjss//d19E6GtymD2eRo0NPzNLb0q75tw2EhWS4DcYoe86aSz0u9X0jP/Nx1pWdcndd3Yl1qgYoXows6cug5ayFYr0M9cciXws/G3D9mpO5cGy71XVFoUXOOVyXyIwtJp4Pi3bOEChj6Tnatysl2Q40mYxl5Mjp6I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by DBBPR04MB7945.eurprd04.prod.outlook.com (2603:10a6:10:1f3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 09:01:21 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%4]) with mapi id 15.20.9846.025; Wed, 29 Apr 2026
 09:01:21 +0000
Message-ID: <fa25613f-508b-4bd0-88c3-df0605f114ba@cherry.de>
Date: Wed, 29 Apr 2026 11:01:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] u-boot: Fix u-boot-tools-native build after DTC
 update
To: joaomarcos.costa@bootlin.com, richard.purdie@linuxfoundation.org,
 festevam@gmail.com, openembedded-core@lists.openembedded.org
Cc: khem.raj@oss.qualcomm.com, marek.vasut@mailbox.org
References: <20260429001811.2723886-1-festevam@gmail.com>
 <516fab60f06521e2335185dc20d8b8c1d1330730.camel@linuxfoundation.org>
 <d322d9ea-5312-4033-a0fc-91abd7fd71cb@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <d322d9ea-5312-4033-a0fc-91abd7fd71cb@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0502CA0013.eurprd05.prod.outlook.com
 (2603:10a6:803:1::26) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|DBBPR04MB7945:EE_
X-MS-Office365-Filtering-Correlation-Id: 677bc092-bdc8-4b7f-c3d7-08dea5cde22f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	XAbWw6ApvVkw30124X9WSQpuzJX/onvU0qqAsi0tTPMlFvrRcOK2gNhOtLE9FgRgqdJkPdJTSYapIBAkMfYVbNWWoylnVhuVRbWQrE2imD+rExchkiQlpe6M788zwNtUMBq6Kxvlh38eNUglSlUsQaAkmGjkdP4TQGWZthbcHurL3JsZWL6jE349fvx3BGDtCPvWJK36BIXkM/BDdy/N+ftf1M366sf/1p6gCMcyhgRjia+PEQhsIsqceLX/f2IuACYtKURwTGJhSfb0m1lYLZlw+VxW64Ohl9cuU1tILIhughDuT3iqZZioNB7/wmb2xo/MKcNuChw+S3+fYBvgzsqdQNlDQL6ysqkaFSu4uW/Pau/O5BJn3CRBnEJnh3snrJNsbdAFtNOvwxraS6RHr0jp3eYhC+k68FoLdh1OFwCgjd+KFc2hR0rTKu5cez2FMDmkeJZG7KKIEDa3SPdYax6UAGuePoOThwkmpURyN/9c7PAroWRKM64tHalgxoEdMYOA8YDHzf8w9nezguErLO6yZNuTrD2bs8ldTGu+S9luhi97O4pKitpk1FpwqSokYj/uhYb0yf0Ls6klUIEag42IURiRKa6GXyX/mnFjg+wX8fM5IxJZi4Lr5brv8ZBAA3xbFld/Flc3nOt6vOH8IcU8Hol91W6IPVO/MvTaazThSFQkoe1txmqD5GIdcog9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a1dmRG1pdU51N3dIamN6WkZiZTU0cHo4dVo1ZEkzMDRWalRaN1I3NVRFcFJJ?=
 =?utf-8?B?eCszclJlUi9GK2haeDV6NlczM2Y5MHpsaG9pa1U1TzMyZ3VJYUplV0lLeHVs?=
 =?utf-8?B?R3prdDBFaUc1T0dvSGMxNFNsY3BxdmtNWmVqaEIrQnNQZm9MZ0ZzNCtzVmNH?=
 =?utf-8?B?MGxsR2tZMUJFVDlTOWJ5K1h6N3dWYlRseE5ZSFJpV0FaanpwMWlubXA0YzQ3?=
 =?utf-8?B?akZyeEVERzh1NUJkeUNkMnNGSGxMMDFsczlpUWtlazM5NzBDSmRwaEFDYWNy?=
 =?utf-8?B?Y1NObldEajdQZmdEMXZQUTk1ZjM4eEtORDY0VTBXN1V1UGo1RkxQcGN0Skpz?=
 =?utf-8?B?SzY3WWJzL0xadGlmZ1Vrb2djMEtvall3eGNYRnhRRFZScVBxRkdJL3dEMzVj?=
 =?utf-8?B?RTlVWXo5WVAwVDl0dUZvZzNpclBtdHNDZnFmM2MvclNET3VwQlk3UG96RklN?=
 =?utf-8?B?ZjBXQlR5ZlFSa29oSFROVXdFcElHVVl0bEVoNHYweE5RdnR3cndiTUdKMVVY?=
 =?utf-8?B?RE5JNVJ4cjVCSXpVaHl4QUVrVXR4MUhTcVpoRGVuKzV5aTlpTytrR0lRSFAv?=
 =?utf-8?B?M1FYZm1mY3NTYVdZUmRXUlYvMVIrM3dTS1dVVXpMR2x6K0c1WVExWmlxR3ps?=
 =?utf-8?B?d3FqRzRxMTEyNXByb0EzODE5OVVwQ1Y5cmhvd05wR2NURzhJNXFmZkdyOXlD?=
 =?utf-8?B?SmNDeGh0bnJOcC84NnVWMmVLZTFydlFZODQrNWo2UHE3RldNc3h3OXRsakQ4?=
 =?utf-8?B?QTB2WUZWdmJZMDNKbzdtTHAvM09TRCtVTmJ0MGh0SXlpRVhoRGZhWGNHNU1h?=
 =?utf-8?B?a0U2Si94Q09PTXNkVm13Z3pndm4xSUxiaHczcHhIYk56cVd4bExCbVVqVWIr?=
 =?utf-8?B?SWR5R2xjNW1yYVBjL0MyUWZaQzhvN2J6dUY4dGJTVGNRRGtNVG45MFY2MENF?=
 =?utf-8?B?Ymc2SlZUV1hvY21Fa01UNmZUWU1IY0pXN254Y3BQZWVVNnRUTEE4MCs3VlVw?=
 =?utf-8?B?d0dlU2NpVzFtVG1oV1d2SE1zM2tudkp6Ym84dWY5S09FbWFEdDI4dGZLRzlO?=
 =?utf-8?B?MHVrbUpveFRsQU5ZOXA0L1YvdE4zU1IvY29Uc0N4UWZNUUxSUjgzZ0VudlFv?=
 =?utf-8?B?TTN1MHdoNlNaMW9YRlQ2UnNNaEFLTGVvakVUWmtkaTJxTWY0ODNaYnFlcVBw?=
 =?utf-8?B?N3RLYnIxTzd4LzQ1cHZIay9ENXVTUzVXTEZlaS9IUzFaN0pxTitlbU4vc2t3?=
 =?utf-8?B?bEYzdnZnYlFYbFVYT05EeVhZQlBNQmhZZmU2anN3b3FaNmxUb1N0ckROdVJN?=
 =?utf-8?B?RUY4d1Q0aHJ2OTRzd3N4SmRKeTVVZ1p3ZERPMXViMlE2MHBjUkdERWNBZlFX?=
 =?utf-8?B?UElKbFVhejRVNUxxT29RMFpDU3V6TkFlQk4rNk13MUI3YVhEdFcyb25TQlQ4?=
 =?utf-8?B?S0ZUTVlGK1ErQ0doL0hkWkRyU3ZoekxhNFRUa28rem1JNTJvd3k2bGV4RnZM?=
 =?utf-8?B?S1lWTXQwNUkvWDBtRzczT0JvZGdRYjBJYlRPcGtMVENQc2cxR0JIUSs3T2lW?=
 =?utf-8?B?bloxamdhSkM5V0Nnb21hTnlubm1INVIzMEFwdFBYdzBGRjVEWEJWU2JlSy8x?=
 =?utf-8?B?ZnRRWjlBRGRTd2VycTQ0cDJmVk1FaWtLNmVYWDR1cmVKK1poenk3WVFHclRl?=
 =?utf-8?B?M1U2RUliYktXNjhuMml3TGFVdHlQSWw5b3lJcllMSC9qNEhtcEJMZ2JHZ1ZE?=
 =?utf-8?B?bTRwUTRjY2NYRGVVWWNzYVUvNmlyVWtmZU0rZkpJdndkSFpzT3VxZUFRbmxH?=
 =?utf-8?B?Z3lHQ3BJVjZqYnBObDRXNFRMMEx1Nng0U0FEaGhhL2N6dVpkZm4yaUxQMEVH?=
 =?utf-8?B?TzY3enN2MzRkbXNscmNtTlJPS1dCY3ZtZy9TWkRTZUJETWQwbTY2dStXcXh1?=
 =?utf-8?B?MU5ISHFudHBxTUF3cHFlSG9mdURtYjdUUXFiU2w2ZENOMEJORXRnc0hTeFJD?=
 =?utf-8?B?UDNTUmxnWlpNc3c5TEpELzZxM2l3R2lrb2QrK0RPVlYzZ1RqVXEwTlBXeTRK?=
 =?utf-8?B?bEtKY1F1MjhEejQ4c2p2UEI0RFdkdkVjYUFOWGFTRWoyWkxvUGRSMG1KZGFV?=
 =?utf-8?B?MmVNSjBudmJVbTY5aEdzMWRISU9WQmNLN1B6VUxjeEFmOUs5dUhMcGpWb3dZ?=
 =?utf-8?B?a1d3d3MrSTdTVlF4cmdPOHF3T2NQa3Y4ZDEzUDA2L092SE96U21QMFJiYUJz?=
 =?utf-8?B?dVdnRVJGcTllVytIMlJGMlFBM2JxSm5yU05TUDB4V1FkOENockY2a3h4d1Uz?=
 =?utf-8?B?RWJ6OGFkQnlSOEtsYjlBNUNzZGk4UDhUa1RqaE85MytiWkNBOEx2MzZZRE1y?=
 =?utf-8?Q?SRHyUjNv0Hh8Imbytq2sYao4R85Sc0MFpt4W8?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 677bc092-bdc8-4b7f-c3d7-08dea5cde22f
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 09:01:21.6349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J5pnO94MivEzKLuWpG7Elm5nW04Jh2bIJ69l0YoJfVaaAIU9rC2MqPGdfL4W07JOySm9mzQqb3yxVpkMl7u5rG9IWQBB6kIiMlUqjnydoVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7945
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 09:01:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236089

Hi,

On 4/29/26 10:43 AM, Joao Marcos Costa via lists.openembedded.org wrote:
> Hello,
> 
> On 4/29/26 10:03, Richard Purdie via lists.openembedded.org wrote:
>> On Tue, 2026-04-28 at 21:18 -0300, Fabio Estevam via 
>> lists.openembedded.org wrote:
>>> From: Marek Vasut <marek.vasut@mailbox.org>
>>>
>>> Set PKG_CONFIG_SYSROOT_DIR as invalid path, so the host tools
>>> build will surely not find host /usr/include/yaml.h file and
>>> will disable yamltree build. For details, see U-Boot commit
>>> 807bcd844afe ("scripts/dtc: Fix pkg-config behavior under sysroot").
>>>
>>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>>> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> (...)
>>> +# Set PKG_CONFIG_SYSROOT_DIR as invalid path, so the host tools
>>> +# build will surely not find host /usr/include/yaml.h file and
>>> +# will disable yamltree build. For details, see U-Boot commit
>>> +# 807bcd844afe ("scripts/dtc: Fix pkg-config behavior under sysroot")
>>> +PKG_CONFIG_SYSROOT_DIR:prepend = "/invalid/"
>>
>> This feels a bit like a hack. Is there not a config option we can pass
>> to u-boot to make this deterministic, i.e. always disable libyaml?
>>
>> Cheers,
>>
>> Richard
> 
> Maybe setting/appending "-DNO_YAML" at HOST_EXTRACFLAGS (e.g., through 
> EXTRA_OEMAKE or BUILD_CFLAGS)?
> 
> In the end, that's a direct consequence of having an invalid 
> PKG_CONFIG_SYSROOT_DIR:
> https://eur02.safelinks.protection.outlook.com/? 
> url=https%3A%2F%2Fgithub.com%2Fu-boot%2Fu- 
> boot%2Fblob%2Fmaster%2Fscripts%2Fdtc%2FMakefile%23L21&data=05%7C02%7Cquentin.schulz%40cherry.de%7C73feb8ea44e0468f38ea08dea5cb6a9f%7C5e0e1b5221b54e7b83bb514ec460677e%7C0%7C0%7C639130490251925693%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=%2BbKkw2HVgw52EWv%2FxeSlWRZ%2Ba3%2F3ireKwMxCLBvIwyg%3D&reserved=0
> 
> It is still kind of a hack, though, but I hope it helps!
> 

dtc-objs will still contain yamltree and thus attempt to build it.

Fabio, you are not explaining why you don't want to add the libyaml 
dependency, Khem attempted to add it in 
https://lore.kernel.org/openembedded-core/20260412035757.134385-1-khem.raj@oss.qualcomm.com/ 
but I don't see any follow-up or statement it should be dropped.

I'm very much against setting a variable in the recipe that applies to 
all version of the recipes and will not be looked at again. Instead, add 
a patch for U-Boot that removes this (but again, why?) logic so that 
next time we do an upgrade there are more chances of someone looking at 
patches and trying to figure out if they are still needed.

In any case, we absolutely need a justification otherwise I'm afraid 
we'll never be able to do a cleanup because we don't know why it was 
needed in the first place. This is something that has happened already 
enough time for me in OE-Core/YP that it really is a PITA for upgrades 
and cleanups.

Cheers,
Quentin

