Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A79F5D206BF
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 08:36:43 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.42])
 by mx.groups.io with SMTP id smtpd.web10.43804.1729154200733853542
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 01:36:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=U6RqCQS7;
 spf=pass (domain: cherry.de, ip: 40.107.22.42, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JvkEO7yDgSIwrebOveA7VnisGpDAoV4TPdpVZ+T7hjp8L8KFqsNbI1K9hW88dbgTAQPWPe2DfUpj25jbFPKCXjO1/uAm6jLhXNuTFQCouBfl1Iz9oIuyR23kDrGeJ/OfdWlOe8kfs9jBf/zbey3AbMoKPKi3DRzdq5Kmg3gq7Fp39pS9rF6+gv2NJOqEyb4Qy9gmXTPm1pmZMGbQDdiS0P7+5V0M7aKBtUfJDTbll/h7MTrCTWLPiOMJ0tljHA2QiYnHEEwSD74l4EYVLnyE86kSHyanH80XWaFHaoV+tkwvBi2s/r4CzwrtIy/o9vf+bzTczHDERgwgICuHGv13Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/RoTFlM4Lp6KiU6ny9jYZfj4VJrueMEPoQEYp4Dn0U=;
 b=r6jVqWgdue7Mc2kYucUCIIwZYwTkCRiiJA9J9Am5WsjqrTwPVX+PKv6LH4QJSvpwT+tSDGRp8V36C00Mfmyc0tZfNXY+IvjkCPA/d/W52lDKtK9vbgaGx9OL04Vwt0Lty5rOGFoe/hpEzGVBsgeRcL4FMvvSM1kXtSiL1eymil4rz2QZCIhkK/BjViguIIz9vlf05J/TJ/PQ8WNLrFlLuV0oWIltEYvewZLFJIkPyPE2+7zYBijWtFwS/NSsMi8JVPEBUw230O8BmxC7xUhcmXYRL93dtlC3cCzduZVDg3ZkQoUhcnIWdzy4XEgHWf4c7Z+mju/sD60U7hcKwHMzHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/RoTFlM4Lp6KiU6ny9jYZfj4VJrueMEPoQEYp4Dn0U=;
 b=U6RqCQS7xo3yzzlxeXfJK1CwtnfbCjjDzIQ4oCqsVyRvrxGlM4y4otwCrkBTYE1hqP9/IHTIer6R9faVP26iY1VcUCW5sM/VqPls8IP9800JVyzRdnu5I59d+VaKlY5XB/ts2m4xcfGCfDV1sWxln+Z5KB4HDKSB2HYup6Pnf6o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV1PR04MB9213.eurprd04.prod.outlook.com (2603:10a6:150:28::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 08:36:34 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 08:36:33 +0000
Message-ID: <bc4824a0-9304-4720-bc28-338ad842093a@cherry.de>
Date: Thu, 17 Oct 2024 10:36:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] tune-cortexa32: set tune feature as armv8a
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: raj.khem@gmail.com, workjagadeesh@gmail.com,
 openembedded-core@lists.openembedded.org
References: <20241016122555.21496-1-workjagadeesh@gmail.com>
 <CAMKF1srq8CNR7xuNDov3Vh4JjipFWjzuroeL35HFF=CKKS0vhQ@mail.gmail.com>
 <4a307cc0-2ff6-4d73-9c0b-21893be1e5d0@cherry.de>
 <CANNYZj9pvdBWn=O28LUkZ=c9ZKOc3WgOvviRzkHNJv6qLSQHgQ@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CANNYZj9pvdBWn=O28LUkZ=c9ZKOc3WgOvviRzkHNJv6qLSQHgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0131.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV1PR04MB9213:EE_
X-MS-Office365-Filtering-Correlation-Id: 57420c36-8937-4aef-b447-08dcee86ce8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WHNQV0FPZG1tMERmTWg5SXRoUHVUSHRqeERxcXRUQkI0U1dvN0RkcUt6TUI0?=
 =?utf-8?B?N3NoQ2ZFcWw2ZlNoZjBaSTRydUIxUjVndzFyK1JkL3A5NWgybVRLc0l4VmVZ?=
 =?utf-8?B?T25iS2pSZmJkZ09tYjZvOCsrUzU4aWkya05oT01CaWE5bndlcmNDSG9EQmt6?=
 =?utf-8?B?UEQ2S0VhcGIxaGdkVlp5eUF4TElnQ2xadGRzUTRvRFV4VkpWbVY2TFo0NVBJ?=
 =?utf-8?B?cm1HRmR2ZmJtMHUwUEU0M2hNdkFodlViVjNRMjJyU1JWTm05MnJEdjMxRUNG?=
 =?utf-8?B?M2xPM2Zzdjgxd1dFcXVoZlg0am4waWZMZ3pPU0Q1Nm12Zlptbkg4QmQxNjdr?=
 =?utf-8?B?bC9lOEpoUGNRMUpSbGJMaThsVWliM2xqeWFJOXlkSU4xT2pUTUx4L3phWldL?=
 =?utf-8?B?dkdKRjdEZEREUm90ZnFxKytLVVZFWmxNcG9TOGJ4eEQ5aS8zN1ljZnBhM2Mr?=
 =?utf-8?B?bkJ5N21tQ1c5aTY2ZUd3NUJobThxdzVpdkV5RjBIWWhEV2lWYjlXdUhneVBn?=
 =?utf-8?B?SCtzdTBwYldaR2pjQ3UvRDRycHVkcHVrc1NCUHVLL1FJYUdtckhSeHlqUlFZ?=
 =?utf-8?B?SndEUGhtTDR1dzNIR0hYY1RXTHloeXlCVWZySHJwK1ZVU1hqM3RNcTYwTG9h?=
 =?utf-8?B?YlBFajFXaE5Ecm04aHM3WXJOWWNjODVVVWV0VXYyaFVWV1Bpb3hjOW05K09z?=
 =?utf-8?B?VlMyY2ZrTGxjNzRtZTBtUm1LVlF2dGJQN1dMUUF1SDl5MEo1SEIza3ZxZitX?=
 =?utf-8?B?KzlYOTBwbEdDckUvcTNFcUoyS3FKa3lZLzEvZmNjcms0cFJRaE1RZzdoZFVZ?=
 =?utf-8?B?M2tVbVBwNnlnYW1TWnVpTHcrUU5oZkhuVTdJMmVETHdVWktJS1ZXOS95cG4x?=
 =?utf-8?B?OEcxRVU0cThza2tiYUZUd0VGQm41N3pRMHBFNS9meUc0WFNlUS9qR1F1WmZD?=
 =?utf-8?B?K0NOVDRXVTUzQ3MwNkxsT3FxNkxYTFRZT0FVQTZydmQvUGNmanBhbmdzWGxD?=
 =?utf-8?B?N2t3WS9WajkxNGJHTWxWUlo3RFRieElGTHowaysyOUkreGl0ZjYwSDBaUlVR?=
 =?utf-8?B?d3YvOFo3Q1ZjdHlZZ1NqcjA4Y0poWS8velloZE00NG4xZlBveWRiRXcvQTQ2?=
 =?utf-8?B?WE5KUEZNVEg0U0s2cWhXbm1xVEhaUmxBTkFoUFczODlTd1NYZktIcjQ3dGF5?=
 =?utf-8?B?Mm80QjFqMHJ2QnlzWnRBamt1SUxaV0FucmdSVFZoeDVjUzlLTWtScWRBVDRK?=
 =?utf-8?B?QVdVaTJnaFJyajhxZkhIalJ6LzJIYnQ4S1hVbWZZa1REbzQrcEZKd0NraEZp?=
 =?utf-8?B?cXlHZGozbUpwWmhNeUttd2VFMG85QlZ3SnRicDhyTllXSU13UHllZkJzamlq?=
 =?utf-8?B?RlFIOWVUREVPWnhLTGxPMTYwVnNyTFBUS2NRTEUrNHRYOVZ6TTluWkx1Um5a?=
 =?utf-8?B?ZmdtVjcyQUtTWHliYmhMdTdSK0NQdEV1QVZSV0JCNElWT21QOWZLUFZFTEFL?=
 =?utf-8?B?WHArYjJTZ25vK0VXb0pHMk13MmE3SE45Q3hkclEvczNZYi8wTUV4am9UMVdz?=
 =?utf-8?B?bjV4SDlkUExlbXNFVDZPU1JVVk5wbEVYQW04STQrbEU4ZGR4czJObVdkUm54?=
 =?utf-8?B?S3pCTjl0K0JVS3RJa2hEMmsrS292N3NsZVFQY3FVTkE4eFJPM1JZWXphQU04?=
 =?utf-8?B?WEhqdmExOFdNQTRoLytyY2poeFVnUDQ1cnNzVm5zUGlaU2Q4ODVESy9PMmF1?=
 =?utf-8?Q?2GIXdRyM0J0siEzwjg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dzJ1SHRVNjljaU5SNVdSOWFBdlp6SUw2NHNYazdKeVo1d2pibk52NTZ4OEZt?=
 =?utf-8?B?VzVSc3p5VE1xdUl5ZTlDQzRnNGlBQWp2djdOTTZKS3pqbGw1WmJBNHdLcEFP?=
 =?utf-8?B?NkRLZERCdlczR24wY3I4K1RZZnBEbkhCS09uQTBXNmNtZXEvUytKR0Z3dGZI?=
 =?utf-8?B?K1g1Q3A4VFNDWmxXYndaYzNnelVkWkxpdmdLTlFyb3NhczZ1MUY1WEN1RnhQ?=
 =?utf-8?B?ditHRmZKK3pwcGl6R3hLeGhMT3NYcFNoTE45TkNSdG1adWdTcGRRN3ZJSWVO?=
 =?utf-8?B?d0pINXpob3VhMStrdTV6eTN1cFJNRDJGSzE2LzdKcGlPVktpTFBoSmswUXZC?=
 =?utf-8?B?bTBnYlRSR01heDVlUmdEMTZTVG0vQi9rR2ptV0IvM2srWENhVFBraDdzb2Zi?=
 =?utf-8?B?TEZ3RmtxMzh4NlFnVUdGNmJiOXZaWEhGYkxPTVU3UnNxMFdMZTRvNlR1cGN0?=
 =?utf-8?B?NVRKRHRZRG12ck9rSlNKT3IyaDQ5Sm5XSE5IVG45clAySGovWThCOE1BVnJj?=
 =?utf-8?B?M1pjenp3ZG9lZUJnTFNFOTMzQWtkczhmRnZnMUgzRmlGYTN5MzNjVFJ2QjNF?=
 =?utf-8?B?MUlKUVR2SEg5N1RXYzhVY0Y0cUU3eTgzbEhDaC93bXNGTUxqeHlJR1B3K0F1?=
 =?utf-8?B?UWx0N2pjUTliMjVhelVZc3V5YS9lcDNhR0RiaTAxWWRDOGluSm9Uck5TbUcr?=
 =?utf-8?B?UHpQS0hGNmNZSjBBUnozUFNFVjhlRitiMnVvelpsYituZTlzSUF5ZERNWFJP?=
 =?utf-8?B?UDFheno1dkZNdFdnaktYa2lvZXgxenFlbG1DWnA1b0tPcmliVU8rSWczUDhS?=
 =?utf-8?B?b25oaEVycXBhZHBrUE0rWHk4TEIzajBqbUxHVnM4Nmx1b3owMEVQaS9hUVA3?=
 =?utf-8?B?OEIwKzNEcUJVRUsraFBacnppWlNUeVRGQ1FHNkJvWFRZQXBEd25SVzdXeE5n?=
 =?utf-8?B?NTJmR3pkTlZCMU9aMVoxU2JQQ05LajlHL2tZT2YxSHh0VS9UM1JXcTB2QWZV?=
 =?utf-8?B?dGRNUmVGRDE0SVBxUmthYkU3N2NhSENacGpSRDJHbWUwZTByN3Z6TnBSeTJK?=
 =?utf-8?B?clNXL09sT2tTVTIwRm55NVkxZW1DN2NHamlHNlFhTFRmRi9ZaWN4bTJlblpz?=
 =?utf-8?B?ZCtrQUlpaFZzclVQSVdQLzFPT3kxQnl6c25ZT2xjY1VSWXNmYWhoWnpKMWdY?=
 =?utf-8?B?b294a0lVTjhxSFRhWnJKQ0IvclRLaFFpNndUTGhWWVA5cUt6QVBaNzA4Wjgz?=
 =?utf-8?B?aXVoUEMzNVBWblQ4Z0duSzAvaXl0MExjaVFWeGhqU1NkdHdwR2swSDZQMy8w?=
 =?utf-8?B?T3N6RUhRMWhsLzlIRHFWeGZNZWZFRnpwajVUZFJ6bVp1REtZK0drY1YvSnNB?=
 =?utf-8?B?UWNrNUhTdklVTm0xQ1ozbFd6SzJmS3RQTVFrbGhZMVVyUmVBNDFZdC8vcXlX?=
 =?utf-8?B?K2czUEdKSndocW45WXNNSWdTZllQN2RSY0VHanI5c1BpaE9HdUE4SUg3eXUv?=
 =?utf-8?B?ekFqbEUxLzBNMWxNOXBxRk9Kck9BR3lONUFzYWZQMHAxY28xa001TGt6NFZq?=
 =?utf-8?B?N3Buckk0MDR2ZWVqcjdmdXFPVkNublRGWHVESTZiUFlHbnJDMThVcjRUV1gv?=
 =?utf-8?B?cWtabVBHbUoxOWl5WjhrV3FML1B6Q0NOWnE4cnF6MmdzVnBiNWpMZGVsT2tQ?=
 =?utf-8?B?Zk9kSTFWRzRsNmVtVE1tWEV6OFJHYm1ab1RDMDNyMzM3SG1ENmNZNVFLU1h5?=
 =?utf-8?B?S1BkN1lwektuSy9PakF3L3BOVGRUNmRIR2dtTW51NWt3MVhBZHdNWXJqRXNi?=
 =?utf-8?B?SURnc1lOZWNJem9ETmc4TldXY2Y4ZWQ4WCtVWTQ4YmxhQUQrNm5RUVFENm1L?=
 =?utf-8?B?OW5ucDI0Q1ZBK2dkbUtsdVVWeWJ6RGdRN09iSTZCVjhHZFd1YlVHTzVueXYz?=
 =?utf-8?B?alZEWm93eUtCamhwaG4wZnhNSGJTOHY0SGNJRTI4dVFYaGNTaTVTditmVUJV?=
 =?utf-8?B?UG5POXpjZFdCN0pYdjQwQkprZlRoS084QU9vbkMrTkF0RHpvbjhKZUp2bmhH?=
 =?utf-8?B?QkJtWVdNWVVEcitWRGFkdThHTEVYZzFnNG5SaGtnSi9qYjltejRiZzR1QktT?=
 =?utf-8?B?NC9COTFSWExwa09vaGNCRnRpcFBjdW1jZ3NyaFdQSjIwUzMrYlQwd2xSb09L?=
 =?utf-8?B?WFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 57420c36-8937-4aef-b447-08dcee86ce8d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 08:36:33.9489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ukEJUk/kHFxd1Luu/VY4+9oSK3+94UroXY0fx3c6Vf8rrJ9/yyPjkf2/n3tuk3X8omMZJbJGX/BBRgPyWdJBihq4jY/n58UDvJAohtvC/SU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9213
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 08:36:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205990

Hi Alex,

On 10/17/24 10:34 AM, Alexander Kanavin wrote:
> On Thu, 17 Oct 2024 at 10:18, Quentin Schulz via
> lists.openembedded.org
> <quentin.schulz=cherry.de@lists.openembedded.org> wrote:
>>>> Cortexa32 is a 32-bit armv8a architecture processor, so set the tune feature
>>>> as armv8a instead of aarch64 which is 64-bit armv8a architecture.
>>>>
>>>
>>> That's right. its aarch32 only arch. This change is fine to apply.
>>>
>>
>> Do we not have an issue with
>> TUNE_FEATURES:tune-cortexa32          = "aarch64 cortexa32 crc
>> callconvention-hard neon"
>>
>> in meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc as well too then?
> 
> The patch is addressing that, no? Is there a different file or a
> different issue?
> 

Definitely a different issue... with my reading abilities :)

Sorry for the noise.

Quentin

