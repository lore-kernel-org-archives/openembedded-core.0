Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D62CCA476
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 11:03:03 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.1])
 by mx.groups.io with SMTP id smtpd.web10.15688.1759834981714262033
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 04:03:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=eRswDMnw;
 spf=pass (domain: cherry.de, ip: 52.101.65.1, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=epPneW3NeYwEAjeF13XjHwUJM8x0r7PpUF4QkKUzBwfaD3dEO7PP/GkgcUIsDNAUAa41UKz8pCwXIFdmwaa+vFT16DcdYM8UodTCwo18eZwHL29lSLwvOn5MaH8A+KOqiqfvTx9kmRckNNyTuEZmhDzNpZZFxv1S3pI1UxhEa8N9n2cyE+uRol8FaG9F2nYznxJfGOMeCT5Ru+ig+BL47IfnmI3DbEg23ZMpaUg0Pv5XsrkzFafmGLKHleUJganW66Yuczytzs+X2Esu5fvwIMgChwDnZjjrUMxkube06DMRcRARWmUpW1PaSHsPj7x/XFUCXHOTkdwuSl3t82B2Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eiePGa2YAys6EMtXRJ3XlogMS73oH5W61frvsCdSg8w=;
 b=UXmTwqMskHsbILDi5Mv7koFM2Jb6rqV+62Y98UPMbDBwyZFfpcC18EV8ISOj25KkFBu9GrZIqMkLX8f3X8GxQN9tDgPLOklyP25f32P1wg0iCzRAAJL/LhA3o9brA2gNNl6WJtlwavx1Sg+CP3jujdd+wqnMxJbDSB0EVqy5IGVkCGZ69LBJOVFXmOMxKltEfuk2YPwGdHZ1LPEgYo0Xt3Ozr2yxaUDEv+kObfaFgKhI6ZJSyYqyTLNiPEg/E6mvagrzeyF+sSlArsdxJSt+blUfS5jGn/bgXH7y0xikslM/GFzgnxvWYb/FTy3TQQ4xcYRuRBQTD12K9Dy1DTPe5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eiePGa2YAys6EMtXRJ3XlogMS73oH5W61frvsCdSg8w=;
 b=eRswDMnwjHBaLCLASNHhigRFlyK18hFigiVN0mSAtG3EvfM8CaAzBQw905xL9oHyM+hSn3n69cVOwyOkNikL5LaUWYhaMDbsZ0a2U54/8AmjyPh4svoxYfz6HOcPUUzdy3LMkxTWbSfN0C+0u9xUL3F0XsRfWtt1WAgfxcx0vqw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI2PR04MB11073.eurprd04.prod.outlook.com (2603:10a6:800:26e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 11:02:52 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 11:02:52 +0000
Message-ID: <3a2503db-3bde-45cc-afea-92d9f5120023@cherry.de>
Date: Tue, 7 Oct 2025 13:02:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] mesa-demos: split info tools to a separate
 package
To: alex.kanavin@gmail.com
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Ross Burton <Ross.Burton@arm.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20251002015030.2464972-1-dmitry.baryshkov@oss.qualcomm.com>
 <feae4e64-0969-4e02-84b4-3ecba5e41a02@cherry.de>
 <282130EB-8DFE-45D1-A1C1-B7720DCB615D@arm.com>
 <9179d213-ebd5-43d9-8748-6981807c29f6@oss.qualcomm.com>
 <18ea0a5d-036e-407e-96bd-ac1e6209ccc3@cherry.de>
 <CANNYZj-KyG5yJKLS8+ew7GEdc_7+NCLSsmmUtT5KXx9_-1PkMA@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CANNYZj-KyG5yJKLS8+ew7GEdc_7+NCLSsmmUtT5KXx9_-1PkMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0273.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::10) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI2PR04MB11073:EE_
X-MS-Office365-Filtering-Correlation-Id: 0104d810-ac74-413d-d652-08de05910f8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?REZLS0RGWDVGTkMxaUQvcGZCbkVmSjJ1QnZNY2ZmWklIdVp6a01QalREZzJt?=
 =?utf-8?B?Nktwd2gxN3N4TWx5cGFnOUt6cUtIaFhoS01NZTJVWUs0WmVmM2NQVC9pOXZq?=
 =?utf-8?B?RXM4Z2lpdFhuUEpMT255QVl2cjlvLzdSMGFEWEJxOFk5emVRWE1jWmhWckc2?=
 =?utf-8?B?UHlCRkFmRXI3RkF1N0JldytuaFViMWhyS3lDQ2ZpWlFmSUcwajZvRkxLeWNE?=
 =?utf-8?B?MVFCNTZucEdnczRoZUF1VmNYMlNyTXNZczJGeWVaWjNjcWFrZHhmRFRETDBH?=
 =?utf-8?B?bkxiQVFYTWpMb1FEMTBRTTZrS3lpVHB2TDFtU05GMDZRb0xXTmk4bis4aXY3?=
 =?utf-8?B?LzF6Qk9QcC9MdE9vMlgwNmhCSG5WbGRSQUNVS0ZoekszK2hWbFd5d2Y1Tnlp?=
 =?utf-8?B?Zk94TStoRFZoZENONjZQTnk4VUQ0SVgwQVJ4UVBYeTd2dFp1OXFTOE5YNC84?=
 =?utf-8?B?WEpDdEFBNnF5QzIzTGpobmY5OWhQQ29PWjFHbXJ2ekFrQUt4bytGY3MxZzhn?=
 =?utf-8?B?d1R0MmdZRkpJd1g4SEdpTzNLWGlvYVo5TVp6TmloTzF4TW0vMHB2UEoyelhB?=
 =?utf-8?B?VzlsRDAyRVNwWHBzZlZiVU5paG96WkswMkxUZENjTjJTTjJnckJpVDRoc2N0?=
 =?utf-8?B?Y2ZMVUpYNGdpdmlaOGF4UHNCN3BGMkUzaVJmVWRCeE1PV1pYbmx2Y3ZQSHpV?=
 =?utf-8?B?TXBJK21lY0ZTZjRGQ3gzaTBad01pczd5TUVXeHdmWFlvNjI1aDF5Q0NYQWc4?=
 =?utf-8?B?U1BjcC9RaEFLYk55cGk4SmQ5bE8yQ3ZIRDFrYVJ6eWIvMjVUVEovU05kc3pR?=
 =?utf-8?B?UFNHUnFXamU2UmVOTzlEOWpZT3pXeGdRUHBlTjhrRm1qNTM2RUZtTm1FdXhu?=
 =?utf-8?B?b0w0SFFpQ2pmRTE2TndCNGMrSm44a1MwdEtqc1pGbUpmeGtCQTkrUFNYTjhU?=
 =?utf-8?B?NG1xQnBBbThnOVZUZzhzbzJlZE1TY3hGV1NNNk9IK1NYV3V1dEFIaXFCMlJO?=
 =?utf-8?B?b3ZzZG94WWExd3gxZVRhYTRkL1k3YjdyNUU0Tzd3V05TNVdKSllGVHFCK0hK?=
 =?utf-8?B?aXVlcTVnUjNXcFordzVZQTV0YTVrSUd0ZEZQV0s3QnNXZU1XRUdBdTRFaGpN?=
 =?utf-8?B?UENsZ1NYMHo1WEhyNGNwVE1CanlraXpyTjdsSGJkK09UOU5rRVA4WStWVWlZ?=
 =?utf-8?B?bTNKSE45cEFDK3gyRlVKTnpiRzcwN3lVZFJFZG42azJmTGFtT1VidThuRVZN?=
 =?utf-8?B?ZE1rUFRac0dxZ1lGSXJFYkxRR3BtMlduZHY4U3JrRkxEazBJWHlOeld3VzRD?=
 =?utf-8?B?dnpxa09CR3dlRitVL2psbUgvTmdHdWxrRkJCNTdNVUNSY2FmN3ZkSmtFN0Jy?=
 =?utf-8?B?T05iM0VyUy9YWUc5Zys4VmJLeDBxd1JvYVhMRHRYSzFRTE9xUUdqUUNCT2xB?=
 =?utf-8?B?RHo2bnVoS1hmTWJyS1hrYkRhdHNXdUpiMnVVcHR6c3AxU3F3WlIwcXB1VnN1?=
 =?utf-8?B?cDhEM2c3blNyaHY4ZFhXNy95dnJrNjY4cmVFVmJEL3hUMUpOblJyRzFlRE1H?=
 =?utf-8?B?WEwrZmQrc3NNT1BaWTk5eXZNZXdhVVcya3UyY0pWaGNDR01Mc2QyZG44TzFs?=
 =?utf-8?B?a0RjVWhnQWlDZld3eFBMamdsZU5LcExOQ3Z1U0FRT3RYbXhMZm1YZWNkNVVP?=
 =?utf-8?B?aXc2dGZFVExPeS9LVDN0WEc5QitaNHE5b1BGYnh3SzFZdXU2V0g2VEtkZTlw?=
 =?utf-8?B?UFh0OFRSRVNOT1d4dGI1MWVsTmI0dXh1Zk1wU0tKUjMyRFdHSkNqRC92bksx?=
 =?utf-8?B?ZTAwZUo3N0JSNjJrWXJ3ckc3MVpTeVBvRTVYZ3RzYm5wc0wvelJPQ3dvMWJh?=
 =?utf-8?B?QlFaUzd2NUtzcCt1VVRXZjE2UUR6N0tmY0xOR0c1MUVBbC9rSlcybS9QZ0Zx?=
 =?utf-8?B?OE85OFdGRkpJQWhWWjJPcUNRVmxQSlBGQlhhQ2JiY291ajREMUFnbm4zWlZS?=
 =?utf-8?B?TVo1RTNNY0pRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bmh0K3E4VTlaak9xcXRvZDYzYjR1c3BJMnp2S0s1aU9EdWUvQVpzL014bUtz?=
 =?utf-8?B?ekVxRmpSMXNmQVl0VU1kVnpxaDlkdncxOThKdTJiWHpJems5d2FtZkFuQzZu?=
 =?utf-8?B?bWZ0OHJQZE1RL25GSDRQeTRqRjUxYit3ZUVMSHdWRVo2TkVGNDBhSHdPMDFn?=
 =?utf-8?B?WHM2Yk5relc2TkxZOW5BMFI3Z1g2d0FCajFBZFcyeC80ZmhNWmorWTRReHk5?=
 =?utf-8?B?Vm9BV0dJRWZUanR0em1mV3BTMjhEZkw2eHNOWHZ1RThkSDRMb3RMMlBHbDZ6?=
 =?utf-8?B?ZGR4U0VkQWFZM2pYK3NYeU0vSHIyTkdTRUZSZDc5NUl0UGMrQnhVTS85cjlJ?=
 =?utf-8?B?VEk4Qk0xNlpOanV6ZjBuT04wd2ZxUmZXNndGUXF5aFdNck1HaFNLcjZrTVd0?=
 =?utf-8?B?U2x5Uno1RXdKNTFkQnFidzRhSTdVM3E0QmltS3BpSndPODFxYkIyWTdjWU9r?=
 =?utf-8?B?L2NzZWNDTStCMEcxakJSZ2VCc1pPNFhQb1lwK1VmRVJLZUxvN2tzT1ovTGNC?=
 =?utf-8?B?dGxjem1KVTNMellHQlJid212M09LS2pDVTFCWnNrb3VVbVFsaVBDaktmZ0sw?=
 =?utf-8?B?NlRVci9ZYTJ3S1NLS3ZPczFIb1hNb1lLc1NMVTRjOG5va2cwZEtjVlpXWE53?=
 =?utf-8?B?NnpXb2hrNUtPNnFhOXFINzhpS09GZUcyb1RHZDNmRXVFOFZ5c3JwbW5LT2Vu?=
 =?utf-8?B?MEp6dlpBaEJqQWloWnhkU0xoY1VVQ2VaUDl3b204SXlDb1FYWWloK3lhZy9p?=
 =?utf-8?B?Ujl6aTB4SFRxRG9KaFVKOHdiQjRUS0RmeEpxM3BKK2lsd3pGMGsrUkViSCt3?=
 =?utf-8?B?SHZHYklJVkVpRzY2NU5Vb0g4cllwcy9WNTZkU0hnTnNMaHJ3d2toelRuVVBD?=
 =?utf-8?B?b1Rsdkx5Mkc0dTV0QjNsdDV5NDlIcUtRN2NHVVNCekZCT0hpdnBsNlZ0eUNK?=
 =?utf-8?B?cWhTS21Kb2ZkbHE2Wi9NVERYRmtKZHN0UE0yNmdSdjNJdVNRSm9aNUJxVVVz?=
 =?utf-8?B?dFNZeG0rbWlLRGVTclMvWXNVY1pwSWxtN1J3c0I3ZnpXTkQyV3k2WktsN2RM?=
 =?utf-8?B?MkNYb2xmRWNFQnFyMTh6cFhNWmpJWkhPMWZFT2txTGVOSURjRWJhaytjM29E?=
 =?utf-8?B?SmlYSzlmSU0zTzVMOGpFdGRtYnJ6M25DTTNycUZqRlo2MTJ6NzltenBLYXBo?=
 =?utf-8?B?ODJMWUF4QS9HTmtHUldCU0ZtVi9uNTVaQ2dwUjhFOFM5MnBETzlsYjl4WWlx?=
 =?utf-8?B?Nzd5dEV4R1pjRFpFWmNwWFkrdE1PS2Q2V2JWWTVsb3B4ZnVRKzJhLzBvSkpx?=
 =?utf-8?B?UTNYZjlDYmN1Y2pkSHo2R2NoT1NmTGlLMTdiODBmRWx0dWdvd0hxMnBTT1Bp?=
 =?utf-8?B?VzAxUDJKNG5yRVNYRCtHOTZpYURtTWttUkRkNFF4ZmVwV0U3TUNoV2RaTXFB?=
 =?utf-8?B?SHFWelZXWWNsZDhmeEUwQS8rWkNsZytHN1ZWMk0wbTdveEFsTlFYdytzenNT?=
 =?utf-8?B?ZGFNY3dpaDYwVGtNNllRS1F2Rm90MnZwa3V5R3ZvSkxvZTFrZkF5cU91S0dn?=
 =?utf-8?B?OU1LM0ErTit6NFBLQmQvOHNIWkdCOGMxTnBXWENzYk1XR0dHVEx1Uy9kdGRt?=
 =?utf-8?B?RmxZdEdmbWNiZFdyN05QbmRwUU13bmhybnkyTHl2bHBoZlk4WmxGVExxUE0y?=
 =?utf-8?B?TGlWaFpLVktGbmhCSTVnclZwaFhlY2pvNjN4Zkc1MFNLQ3paM0c4TWgvUzda?=
 =?utf-8?B?MGtiMGN4dk5GMHBuaVp2NjdaT0d0cWlSTnVoZm1UVyt5clB6UEkrRmVrY0tW?=
 =?utf-8?B?bDNVRkhHTTFVYmo2T0E2THk0UDNDTmFJeGsvdU9kKzVYVDg2Rkpqci85R1lL?=
 =?utf-8?B?RDgvQy91Y1RUQ1crRm01Mm8xWG1YdGM5QlZ0M20wVGdQM3NCcTRxWkt0L0Vl?=
 =?utf-8?B?NEIzN1lHSHVOdzArQTZMcTV3RmtXNnhCVHBrNmZZVEQ1dkVvTzgvR2JvQXVH?=
 =?utf-8?B?bVVhNUliRUljWjlycEVWdThDelN4RkhRNDdwZjZYY2w2cWtvTWpZaC9tSlpK?=
 =?utf-8?B?QlZuS3B6UjYyVzd2MktqMzRubU1DcDl2eHQwV1dydmp0OEpJT2VvRkN5dFFW?=
 =?utf-8?B?dm9CcGlMdVY1a0FETCtmOUVTdE5xNnZTMGZIemJGb0x6eXljeEE0NEY1Y0JD?=
 =?utf-8?B?c2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0104d810-ac74-413d-d652-08de05910f8b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 11:02:52.4944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AyaKpoeR3yvFX+z6bY8MbddSh4hkEN1zInaE2+trBqEVJ0VL8Um/3XKzQXInd4csFRqySo3ukDUi5l1Pk19+RiqKqGvlNee+E4qK3Iqebf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 11:03:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224523

Hi Alex,

On 10/7/25 12:30 PM, Alexander Kanavin via lists.openembedded.org wrote:
> On Tue, 7 Oct 2025 at 11:36, Quentin Schulz via lists.openembedded.org
> <quentin.schulz=cherry.de@lists.openembedded.org> wrote:
>> That's making mesa-demos kind of a meta package that pulls in everything
>> built by the recipe and at the same time the only package bringing
>> binaries other than the info ones.
>>
>> Can you simply add this to the commit log/as a comment so that we can
>> remove this RDEPENDS in the future if we want to without having to guess
>> why it's there? It doesn't reflect an actual dependency but a personal
>> preference.
>>
>> We could also use RRECOMMENDS here to show it's even not required per-se
>> but we think you probably want the info packages too.
> 
> FWIW, I agree with Ross and Dmitry: preserving existing behavior is

This is personal preference. We need to do it with existing releases, 
but nothing forces us to do it with master.

I've pushed for that for linux-firmware in the past for the release 
branches, but this simply doesn't scale if we want to ever be preserving 
existing behavior. We split linux-firmware recipe into even more 
packages quite often, that's never been an issue. That's what the 
migration manuals are for, documenting changes.

Now imagine I don't actually need the mesa-demos-info package and only 
want the benchmark/test tools. Would it really be possible for me to do 
this? I don't know because of the RDEPENDS being there which seems to 
indicate at least "something" needs one of the info tools to work at 
runtime. So now I have to do research to figure out if something 
actually requires it or not.

> the right call here, and that is not a matter of personal preference.
> The patch has now merged, so anything needs to be done as followup,
> whether you want to add a comment, or split demos into
> mesa-demos-demos, and make mesa-demos an empty meta-package is up to
> you, but I'd really rather see you spend your time on high-impact
> things that matter to the project as a whole.
> 
> Such as:
> - sorting out the ungodly mess that is linux-firmware packaging (if
> the packaging subject is close to your heart)

I've read Ross (?) was working with upstream to have some packaging 
script we could call based on WHENCE or whatever else to prevent us from 
doing the error-prone task of splitting things manually like we do 
currently. I don't know if this was pursued and if it's going on.

We have someone currently adding even more packages, see 
https://lore.kernel.org/openembedded-core/20251006170804.9664-1-reatmon@ti.com/

> - solving perf reproducibility problems, which is holding up the
> upcoming release
> - writing documentation for bitbake-setup

There's currently work being done on that side. See 
https://lore.kernel.org/yocto-docs/20250819213530.3616042-1-tim.orling@konsulko.com/.

Alex, I don't appreciate the tone used in this mail. You can disagree 
with what I'm suggesting, but you can't simply say "we are not 
interested in your review, please rather send patches for these other 
issues that are more important to me" which is how I took it. We are 
already lacking reviewers, there's no need to alienate the existing ones.

Finally, this isn't (always) me nitpicking about "useless" stuff. I've 
tried to understand some changes made to some recipes (sometimes decades 
ago) to know if I can undo them or what I need to keep if I'm cleaning 
things up. mesa comes to mind a lot lately. If we don't put this 
information out there, I cannot know without spending a lot of time 
figuring it out and/or risking regressing the recipe because I 
removed/reworked something I shouldn't have.

Cheers,
Quentin

