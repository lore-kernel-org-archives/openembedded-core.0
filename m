Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 394C2C5472F
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 14:13:13 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.43])
 by mx.groups.io with SMTP id smtpd.web10.79474.1724767983644034491
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 07:13:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=E5Tf/ekG;
 spf=pass (domain: cherry.de, ip: 40.107.104.43, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oqr183oxbzOixArY3VKi/BLs0WAAt7XhJ8oP1ra3fKpNDugE8G55KMM9eA4a0pznXyY9uhjuXQ62f6gv+ODtKcSbMbiGZieuFz7MsMeyI6K+pHgpb+eJ7TcFiKtIE+6TMgHErQjvxXJxb2cAHMKxHQ9NA6069vsHptssEIDNvtRiqfz3Ex/2vrwnN/QwnDlszl6xXTLS2GctTB5KYp6KswVOuwEazCEPCcyWi5ughhDRACzgUquyQsfu0dOvpZxjZwAV48QzDg4MJRTe5Z/14G/rtetTDXSXq0Jks6aMaONdbv7Z1r9Qi/ueULMIjBIJQRbcHsH5YfAW+lG9519okg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdRmBZqIHuPmvw+ko3w0dZi47wxLoRz34YoBNJ6qd4U=;
 b=gXlyiiJg8UR4MkB+A0M6YLZe7EtU0FGE8JF/nuJfNoGwX7VoBPhDiD3icvr1p7Akx0VG2SuWkGH/jrMkHvZPIg2hXnI1iG2p9XItgSytOm1hdyPbqWFzVnjbi6zHPdo0ekOqz3NtVB5duaTq7X0mHOCuny6btHqnZ7ZAhJ7sN0gOwYCD00DR8JjgXNDBtlVCPa8LKGvp2IBwpNlneltdQUwxMafuE/JEdTgtVIb5jQViQJ2RYuIUdk8GIGnrSX1vrfnLkyXholAji0Jjr6VQHtGDr3UsxkJ+5GC1bO/EbDlJGWI0VPWVxl27EyyIdSnqbBgMLaO692IvcNHGrHLAsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdRmBZqIHuPmvw+ko3w0dZi47wxLoRz34YoBNJ6qd4U=;
 b=E5Tf/ekGBCBWqlpsS29FWyfTQcrSwi8/CxuY3wvGm+RpZHQwYM9nNDerkWLQqw71MLmrVA8LlxR2A8YWt0FdSk9tyy2h+Jvcc2K0l/S4JoR4Jqo/KiJZNj9Fqte3lF5yLY1Rb1rlh1em5/81oKzD8pEPVXTLqzERbwcFZaMNOD0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PAXPR04MB8912.eurprd04.prod.outlook.com (2603:10a6:102:20f::22)
 by VE1PR04MB7423.eurprd04.prod.outlook.com (2603:10a6:800:1a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 14:12:58 +0000
Received: from PAXPR04MB8912.eurprd04.prod.outlook.com
 ([fe80::7a71:bd84:cbb9:add8]) by PAXPR04MB8912.eurprd04.prod.outlook.com
 ([fe80::7a71:bd84:cbb9:add8%4]) with mapi id 15.20.7875.019; Tue, 27 Aug 2024
 14:12:58 +0000
Message-ID: <5bb87f1d-f023-4bd8-ab7a-6c1ff636c3eb@cherry.de>
Date: Tue, 27 Aug 2024 16:12:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] linux-firmware: package qcom-vpu firmware
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240827100930.127469-1-dmitry.baryshkov@linaro.org>
 <e93464b1-51e2-4058-afa5-3811975de62e@cherry.de>
 <CALT56yP2tgC8RoW2UzzMhTW8m48-s-6icgGSRdgVJdwDrxPrvA@mail.gmail.com>
 <a1f39ba7-0aa3-4ba2-b847-a11d420b60be@cherry.de>
 <CALT56yMVDDEQ-A2Z6+_Jjbh0vyGU4fjq_0MPPZghfs9sSqd1ew@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CALT56yMVDDEQ-A2Z6+_Jjbh0vyGU4fjq_0MPPZghfs9sSqd1ew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BE1P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7b::9) To PAXPR04MB8912.eurprd04.prod.outlook.com
 (2603:10a6:102:20f::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8912:EE_|VE1PR04MB7423:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a4e112f-1985-477a-20e7-08dcc6a25a25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RU44cWJmS0JURGlScEZwdXViSjdBbDhvN0lDZWNNS1kxQy85UzI2ZEk0WDRK?=
 =?utf-8?B?QkxoYm8wRWpYWmFmZFJjTisweTg3QzhDVUUzT0pid3ZCM2ZWWmxKOXFNeEc2?=
 =?utf-8?B?U0QvbDB2bm4wYnR3bGlRMDlNc1daNmk5ZXpUYlBRWjhrN0JBYnJ0QkVsMTRo?=
 =?utf-8?B?Q09Ublpmb3EzNFNDSVNId0JtZFFZK09rUFEwTVNoSy9uL1p1SFl1YW9qR3Ni?=
 =?utf-8?B?T2J2NHcvMkRCY0NuT3BnTUtwN3c3RUJXRHVVTGY3bUFHeEtpOHRsTU5HUnps?=
 =?utf-8?B?b0R3Mzg3NWVLRXZCRnNoRzd6WVR1Nk85T0I4MllQY0NwMGhKVTJNcnBDOGFO?=
 =?utf-8?B?bXY0dktVZkx4Zi9IN0lvRUdwVWxKV3RITTBUc3ZENUExVnltT2NUbUI0YTIr?=
 =?utf-8?B?blVPSmU3WEprNGprT3QyTmVDdENiUkJhZGhlRmM3WGNSUU1MeDVCT0dUZDcw?=
 =?utf-8?B?VUl4SGxaMkRzRjZ2UEdMN1lWaENKRVhZOHlabkRpQ1NQUGEyOWVyV0txVGZI?=
 =?utf-8?B?dnZneGtSNzFCbGJrMjhsV3N5dzhXSjk0YzVsSkc5dkVQdlB1a2hnWlM5MEM5?=
 =?utf-8?B?SGFOT1hCcU5XcXlnRTgvRTJYMm4vci9nWHppNkoxeWRncTMwOG1pNGlkL29x?=
 =?utf-8?B?T3djSzNxbVFHU010SFlidW96blZ6Z0Z5eWpCVFp2Nk1JNjR6QTZIODF0cm1m?=
 =?utf-8?B?TUROd0w5NGVMaWFBS1g5dHVydzlyVCsrSW9qckVWdEptcHFkeTB0b2E0UTNX?=
 =?utf-8?B?azFQbWw4RitGWDM3R25mZEVoRXpDSGRsSHpnYzlSREVMZ01rWTEzRE5meDFm?=
 =?utf-8?B?dHE1L0tBN1ByRlppLzdyWExSTTFkMUIyUmlBR05Jc2RTaHgycUJQQStiY0cz?=
 =?utf-8?B?QnI5VzlLQzlyR091QzZzUGZqc2pjVWxJbmtibUgxYnhLekxjc0kxaUtGT2ZF?=
 =?utf-8?B?Qll5MFV1RFF4R2tWbUdrd3VPWVhzWEJKUEFVS3Z2Sm5ESlVZVzduQXkyWFlR?=
 =?utf-8?B?TDVrVlNGMlhOZVBVNDRHTFdGYWg2RlNmeFNLWDBET2REQTlmNzd0V3AwTmRB?=
 =?utf-8?B?RTcyMDhyNUV0NTBWRy9JdmhPWUtXYTFIdS9GdWlhZnUwOVRnU1RqclgrN1oy?=
 =?utf-8?B?TW11dTMvdVZPSEk0UUpsUUI3d3JlSlk3UEViR05IWGl0Y0NCWGFKZmVWaWFI?=
 =?utf-8?B?dGNwR2lGMWFWMjVCekxoWXppdE9VVE5MWFN4NjVqUFRQS0dKNmpOdktkRWVL?=
 =?utf-8?B?VVNNZ1pacEVvRXE2ODhVSXpSQm93VVd3bk4zT0J0MldXakFtWTZRd2N6U3BP?=
 =?utf-8?B?OG90UWlhaEdGUjEwTG1tOTNhYmVDc29TWEJTMjgzWHVaRm8wUkxTYktBWUgy?=
 =?utf-8?B?aDQ2YlRPa3A4ZjkxNmVsejlGNCtrWkM4aVFMT296bHRrejlFMldBOWM1eGNL?=
 =?utf-8?B?bURIWUxSQVQrU0VDODBVVk9NYnUvZjlJNUhSSzNDbStGM1VPTzRDSXlMdmZr?=
 =?utf-8?B?UERZeVc5TU00WHcvMU5pK0s5NDJpNFB1dU5iYnR0SlBpUW5RTjg0Y3Y1VnBT?=
 =?utf-8?B?TE9ERkRXTVg2ZXJBd3NCT054S2IreG5sbFkxcVlISmtMT29zdzJqN2VXK1k0?=
 =?utf-8?B?V01kbW5FbFBjNVJtZE1PYW5EOFVudmwwM2hwMWZVU0kxSCtDZ0xsSnh2WTc3?=
 =?utf-8?B?WWh0SURMaHF4OUNnU2hvN1V1RFBRVmF2VmFBaFhzR3ROU3NCc2lPR3JXbTdt?=
 =?utf-8?B?ZlpvRjJ2Sk10bXZWR1ZEcEpnTlhndHkwYm5ULzdMczYyYkNvN2wvdnFnaHNS?=
 =?utf-8?Q?iyh/ylUE8TRx7kAfq5NByQk3P3cKKRdI3osME=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8912.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RURXdy8yNzRLZXMzVHNOZm5JSWs4UGM3TEZCbjhyUWg4WUxCcjRhSW04YURE?=
 =?utf-8?B?bkt0UFVnaVpieG1YMVdWUFl2bjViRU9ZVlNGNDRsOXhBT25oVnl0dTlnNGtV?=
 =?utf-8?B?TWN3c1llU01iVWZ0VWJJcDVhaFptMkc2UExCSGp2K2dSZFBZREFQbjBOTjI1?=
 =?utf-8?B?N0VPMm55ejcyeXowT0R3K2crdUlQY2w2OEs4di80U0FURHBWLzNOZ2Rwc1Nu?=
 =?utf-8?B?WnpoaEpQRVN4N2xtZ3hRdFUwbGx3VURiVExiNHJITzAyWVcxbkJPQmY4TkJL?=
 =?utf-8?B?QlJGdTJXSHdRbEhWTFMyaHlvV1ptZHdlZlR1ckhMMC9mSTZQZXVCbUtGODFP?=
 =?utf-8?B?MzV1Q3BxT2lKVlhRWFhySktuVjJPdVZURHNwclBodW5JYlhjdDlaTlRpaUp0?=
 =?utf-8?B?RFcxZUZ3QlI2Q2g3WWFtNjIweUFmOE5raFNoUU1oQ1daYUx5eE9qcXJ2R3FO?=
 =?utf-8?B?Rzl0UkozT3Z6aVJlUGRCOWRaenJIV2djMEM5SGJ6a3B6R2IrNkIyc2RDZjVw?=
 =?utf-8?B?UmFDOEQvd3dDM3F3Wjg1NnhmcGJFMFVLaVYvQk1ZZTM4VGxIU255NUg2RUZ1?=
 =?utf-8?B?V2I2cDR3OWJCVHZKeVVIajVGVnNmblRZbDBPWS9JZ2E0V3ltd3d0RGNBZVNS?=
 =?utf-8?B?M2phVXVFd2pXNGwrM2FIS3NsYWgxdVRiNmcwaFpkY0VxNzk0WkNPSllmQmRT?=
 =?utf-8?B?bjVIMS9FQkJUeVpBdHd2RHFtTFh6dHF5ZmJQVGtqdlpGTkliekp2Z1JzZ2k4?=
 =?utf-8?B?WGNnaW1BQlNadG5nR3pPQ0IvOHUyYU9iemVVQUUzYTVxa2VISnd1TW9vTzZv?=
 =?utf-8?B?UEtKbTlVWFg1RlZZeHZUVGJRbWtJMXpmbW5mU0tMVXB5TUQ0Y0kyT0xxRFJS?=
 =?utf-8?B?ZEZQaVRZR2tMVjFxZGdtUkE5b2s3QXF2aXNuQUIxQ0thY0NZRCtzY3pndWhT?=
 =?utf-8?B?TEJMSXZjOVBQSkcyVU5vZSt5K0JCaXRwdnowazhRUVRzZmljUU9KSkt4L0k2?=
 =?utf-8?B?emIyYk50bWZOU1FaWFZyeTVZM2R6TllDRjNZL1VtREY4N0hsSHJ0d3poUjRC?=
 =?utf-8?B?T3MyaTFHS2FrLzQwK2kzVjVYMWxneXBwbTFOdUV1cHMrVTVNZEFESG9iVXVZ?=
 =?utf-8?B?TjhLeWtKQ1VjRHdXTG9Pci93eUhsSG1iUWJSNGIwT3gvL0wzNnpXaGVUVVBa?=
 =?utf-8?B?VWV4Ri9VVGhLU0RXYlBLZXB6amxYU3NhTnp4b2UvYkRkdXNJb0VoSDB2cmZv?=
 =?utf-8?B?dEMrMVRWa2ptaUdLbjZwWWpVU1BWOVdiUWFsNCtWSkZFSStFemFRTWNSajFM?=
 =?utf-8?B?d2UzRUxFSGhPWUxGdXFNMGZ0VnVQbzdOU1R0R3ptdkdKTWVWSEpza3VocmxS?=
 =?utf-8?B?M09MdVJBaFNIU0QyalZ2Y0Y3U0Z2WkhpNXNNZEZrSFAvc3N2YXY0OHV4SFkv?=
 =?utf-8?B?eHFvNXYxWVErdjBvb3l1SGJ2a0xZUitFN293R09GbzRMYkYzbTIxeHBKMG1t?=
 =?utf-8?B?NTlvWmRBN0czSWZCbS9kMWpUZG04NGVIZDNmUE8vejVJSVU2SzY2NmZERUg5?=
 =?utf-8?B?L2pUWndzS0xkUXE5WnRmYlptcTZyVUxIUU1kcUIxZnJVMHRXY3A3QTlSRkFj?=
 =?utf-8?B?eVJwVmFCcHpZdHY5UGhGUnIwcjBnSE5xMlZFZmg1QXkzZFp5OVh2V2ZTeUNB?=
 =?utf-8?B?SEE2a0JVUzhlYUpnY2ZNdzlrR2pFcWxjYmxXSmpOcTFKYXVVdm9aK3lzOFJZ?=
 =?utf-8?B?cEVrTTJyUE9PWkJxWXdhR05XbEwwM04vWGgxeEFsbFk1SUJHYUhscm11L0R6?=
 =?utf-8?B?U2tkWG1HV1p3d2F0bzNnN2hldjJaL01nd0VxSk9Pc0tCak9QWTFqM0Z0cFNn?=
 =?utf-8?B?VHUxUC9BbjJnZTRaenE3dW1yOEdnUUt2YUdKQzYreldNcENkZDNuSGZxbEdh?=
 =?utf-8?B?WjFxcVBsbEE0WTZCdlRqeFA3cHJ6SGduSEc0VW5COFFWQ2R3YUxMOWwyRUZp?=
 =?utf-8?B?KzdnOEJxVWtHc1U1akk1Q01kcmdSSnJjZEFUZEl5RmtrczFnNFRXTWJtbGxD?=
 =?utf-8?B?MGtNaTh5bTBtNmdSUzNyVG1QOW81eWVOckFEQjZrQ1NGVDJyenU5bnRaNHh1?=
 =?utf-8?B?WHV1bUFZVnJoWG52amhBZHpOZWxjQmZPcjFWT1NsMVRmUVQ5RTNzM3J4TlJ3?=
 =?utf-8?B?TWc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a4e112f-1985-477a-20e7-08dcc6a25a25
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8912.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 14:12:58.1597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w56+FewtxwOVFJKv5KmjV6sBMrBA5fLzWN9s7XkXgBi3x/YbqSRer+Ru5K4H3M/k0s3lgT2Jd4ymYDKBQNOKPQ2YHABrhXhlUW5jcLUML/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7423
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 14:13:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203845

Hi Dmitry,

On 8/27/24 3:18 PM, Dmitry Baryshkov wrote:
[...]
>>>> It's also not necessarily required to merge those together as we could
>>>> probably still have two different packages to avoid bringing in files we
>>>> don't need (I assume the same SoC doesn't have both a VPU 1.0 and a VPU
>>>> 2.0 ?).
>>>
>>> First of all, the original naming seems to be incorrect as
>>> demonstrated by the new file names:
>>>
>>>    qcom/{vpu-1.0/venus.mbn => vpu/vpu20_p4.mbn}    | Bin
>>>    qcom/{vpu-2.0/venus.mbn => vpu/vpu20_p1.mbn}    | Bin
>>> qcom/{vpu-3.0/vpu30_4v.mbn => vpu/vpu30_p4.mbn} | Bin
>>>
>>> It is possible to split one file per package and let users pick up
>>> packages one by one, but granted that the whole size of the directory
>>> (4 different firmware files) is 4.3 MiB, it doesn't seem to make sense
>>> to me.
>>>
>>
>> 4.3MiB is quite a lot if you want to be able to have a tiny filesystem :)
> 
> Well, these devices come with 64 GiB or 128 GiB UFS storage, so no
> need to be that picky.
> 

4MiB here, 4MiB there and your image is unnecessarily tens of MiB bigger 
and your OTA update image is that much bigger, the initrafms/suqashfs 
take that much more space in RAM, to load, to verify, etc... It's also 
not because one of the devices based on this SoC has a lot of UFS 
storage that all of them would.

>>
>> Ok so, if this
>> (https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=36db650dae038be945fb04def591fc726255b09f)
>> is the commit doing the change, we have an issue. We also need to
>> maintain backward compatibility, not between different versions of
>> Yocto/OE but between different versions of the kernel (I assume to be
>> the reason of the need for backward compatibility).
>>
>> See that they mention in the commit log that they provide
>> backwards-compatible links, we need those as well. Otherwise we may
>> broke older kernels we were compatible with in the past.
>>
>> I did something similar to that in a previous update, c.f.
>> cdcfdc1dc545fe381764795ed502a3fa0a48b87a in poky.
>>
>> I would suggest the following:
>> - keep the packages split
>> - add the new file in qcom/vpu for each package
>> - keep the venus.mbn path (which is now a symlink)
> 
> I did a simpler thing. I think it's easier and matches the intended usage.
> 

If VPU 1.0 and VPU 2.0 FW packages are self-sufficient, I personally see 
this as a regression rather than making things easier. We have split 
packages, and I don't see a reason for merging them.

I'm no maintainer, so this isn't a decision I should make. Though the 
symlinks absolutely need to be part of the package(s), aside from that 
it's just "policy" or preference :)

Cheers,
Quentin

