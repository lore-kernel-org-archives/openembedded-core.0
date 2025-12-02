Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E088CFD2F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 10:17:00 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4579.1764670611850142892
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 02:16:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=RIGgcWj8;
 spf=pass (domain: cherry.de, ip: 52.101.84.11, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pzu2Z6lheeQxAH5lWxapPLjYw3H9+BIFIDNpa+yz35vlgKgZyz1FlWnSS1ORsezB6CTRwaClPaOaTe5Ed25kee5Yd0KtcOAA+C9GVoDyai/EkCuZKOBfanozVhE1lqn49XaQx7duMs60sy9LOXqA2UCiqb+ecxu2pNDh7aNyFpRREZk0WHgK6iP+EnsGK43i9Y3V89t4W3vSVcST3oMpROnr3mBcGFHJpPQNEP+7beeHJ+HFYz+zHgS5TzMPhcN/Glqgrugd/u99ZGikXxD1z3mtJ+kwlT45ucri3NpJsKxFJyWv0EHRgR7sQfK4ll7hrTN00hbfot9uXDLunj2O4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vu+xrcm4RqxaTzDAWDd6TbNqXJfK9E5BGTQVEfPoXrc=;
 b=jOkxy5EkPw4Vvqgowc6t14nH3n6W7uXaKpgtiNNDG76GjlqNpJRAUBSxYRGPx4xWjqoQ0o7XY1Hsg9f5s9T5WfL8yeFQY0tOivUmRRQEkKWBEDN1nzqHMRutqdFneHwew3262rvkSiFv02BRNY1zj7g2MSd7BX+sjepdqnk/tOqjaHFrDWh9IPGxSmxH2AFF+cXUsqNgLJfLOVInZlxym4nfKSz/tn3hBlqF+8RccrL7TOKmNAwz06QcQRPDxlJPqrce9N5zOy/LoOlCzEj9KyqtKsup1RLBpIuGvpLBah2UVh6ktJrnhNI2TmBWebX/ZLp2ZIehsEw5v4NoVdZdfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vu+xrcm4RqxaTzDAWDd6TbNqXJfK9E5BGTQVEfPoXrc=;
 b=RIGgcWj8aS0XXH3uS6zaUgK8dNZa7yHyxeRUpX657S0MKolZaMz7aaXxntw8930HgQPuYGN4mODf8Fs9HbrWiRbvgwu4dECFuxBrPY154hno5yLMSnyrAVQ/taXvJ6+nOkUG6Paoj44pdTy3gS1WZP3XwbpsmE7Yo+pLEpi+YmI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GV2PR04MB11350.eurprd04.prod.outlook.com (2603:10a6:150:2ae::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 10:16:46 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 10:16:46 +0000
Message-ID: <6d8e2450-b360-4412-b96d-3c079d53bfde@cherry.de>
Date: Tue, 2 Dec 2025 11:15:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/4] mesa: fix drivers sorting order
To: dmitry.baryshkov@oss.qualcomm.com,
 openembedded-core@lists.openembedded.org
References: <20251202004951.2358784-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251202004951.2358784-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::16) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GV2PR04MB11350:EE_
X-MS-Office365-Filtering-Correlation-Id: 1760fbe2-d344-48ce-0c1f-08de318be61a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?elpqZk9mWjV4WE0valZMTWFNVWloVloxQWs1dDRDN25JUjNDc1V3NGdRbUdI?=
 =?utf-8?B?OHppUWQ1cWVHRkRHYy9ISUM3LzRqWEVtZ3JDb25Lc09rS0Vmb3UzSUh2dG9Q?=
 =?utf-8?B?czB0QmZ3SDZjMkFIYnYvck5WTGgyZEZROERnMzR0c0pIMm9vZlpuaWY2aFhO?=
 =?utf-8?B?dTJLNGZHbURZR3d5eXNVUE0wQmZ6UlhKdS80SXZWZU5TMzJCT0ZOZkRMK1Vi?=
 =?utf-8?B?Q216U2hrTmQzZ1U4UGlwcmNyMWNPUG9vZUhteWxCZVpESlN6N1R5Mm5qZkF6?=
 =?utf-8?B?THIyN0ZHSGhQNmJzQTF4U3JFaEVrd1ZlUnJrbDY5ZXc0ZnNMY1JYTkFYNUxO?=
 =?utf-8?B?UnpUOERuLzhvdkU4UVRYNktBVjc1Q0hiRlRuM0p4eHpmaWVsNnZGMXduTnZD?=
 =?utf-8?B?RG0yeUVDaktQQWFZNnpva2tQbXRyTTVIS3AydkRFRm5nbU04UjlwZDM1WnJK?=
 =?utf-8?B?S1VGdUlZdWZHVWZyTkE5Sko0dVBBeEJxZnRrdFFVbWdXaEhzNWdDdFhaRUZt?=
 =?utf-8?B?emZxcmtKVVllWGVVVHFZYS9GWHZWditFc2txWHVLWjFwUHN6MXdjVXBRMTk1?=
 =?utf-8?B?eEk5cTNyY0VFbENiV1lCelpMTnZSdnhiQ1BNKzdQNG05Z01HNzA0bHAzeHYw?=
 =?utf-8?B?L1pmR29QSHRhS0Y4c0lPZWRmalVxNDBweXFJZEIzdkFBUlFpUnBFeXRDK1Fk?=
 =?utf-8?B?MFhsVWd2N0ZJczhFSlZQWGgwbWxNem0wUFpGU0Z4aFhaVmc0WFE0aDBwNUpV?=
 =?utf-8?B?T0Zxa21hU1VaYTY0eVFKQ2c4SURwN01iR0VpcTJuckRUYWI3UGJvRDQ5MXpV?=
 =?utf-8?B?VENZRmhwaDBvRmxQMDR6TWhBUXdZWFlFQ1RWS054QzJHUW5QSW1QQWFaTnEy?=
 =?utf-8?B?Mkl0WHU1b2hNTllKbWhDSDNPSlltMm54ZFhTYTJZTEdDRFRLU1NnYnc2b25P?=
 =?utf-8?B?TUtQd3ZLSUVOZUFhbjJ3WlVaVGZzdHRaMk5vT0gxMzE3VXZnYWZDQXRyUWpy?=
 =?utf-8?B?TXJlcHRZalV4NHN1MVg0Tjl1Smdyd2piNFhJdjJNRE1aRlc3aWpwcGpDNUR0?=
 =?utf-8?B?SEpkSlNzV2IydmNsaHlwSzRjdDloY1NCTnlDeWlHbDVIczNxdk1MQmlMUEVZ?=
 =?utf-8?B?UGxJSSt1UTdENXJqd0Z4SzN6NmI0bVRZdjZXZVJ2VTNsMkU1Q0t6VC9YaTlj?=
 =?utf-8?B?R1NFRkpDZGl0L2hLYTNQR3RpUHoybWs4a1k3alMyZE04MXF0MDFXS0ZpT0ky?=
 =?utf-8?B?aGpNSHZSb016NjFzN1haTnhnQXBLSm9MbzRWcFF5MUU4YjVlN2NoNHd6dnNz?=
 =?utf-8?B?TXBuRlprNzQ5U1ZwZUNYalF3OVdGRU5OV2lXUWpQYTZlN01uVXpmc253UnM0?=
 =?utf-8?B?eG84dzdlWmpTZVUyc3M5cDQxQ0I2Wk52RVArc3pSUkE5RDNSY0Rpd2dTQWNt?=
 =?utf-8?B?NE11NENTVWQ1SGNXMUZqcng1VFpnY0RTeWxqcFRMdVNjdFl1aU9BY1d0UnA0?=
 =?utf-8?B?bUd6anAvcEYzTjhOTG4zVVVjWmpYNXhqaHdmVnEwTDFlOUxoZ28wWlpQTHVW?=
 =?utf-8?B?Vjhhclh3MHlTU1k1aG9QQjZ0R3IrU1E3MmF1ZTR1RjBqMFlBVXpGY3U5M3pz?=
 =?utf-8?B?RGsveEQxejV6THpzQUg4aVBpakxhbDhyWmk5VXBoYUhKOWRuWFNjRkloeUtl?=
 =?utf-8?B?UnJHYVBQanBLLzQ2dTZjcDN2QUFiME1jMG5pVWkvS1V4S2c0NStQRW1TdHU4?=
 =?utf-8?B?VDQyd2JWWURhdzdzT0g3aUEwMHR0OFZHUkM5bVVTSHd0R1NYNXRpeDdWTnNa?=
 =?utf-8?B?WUt5NGhUM3ZVYlJpSGJwcmZQTkJsWU9Hd3pSa2J0eEtFc0JIcnlxYzNIRWZH?=
 =?utf-8?B?Uk1hVEpCV2FXU0pJemdEU0lHZW93RC9FcGVndGlRZGlneU5La3FvS09qTHk2?=
 =?utf-8?Q?es/x6zK2m6BjiiM/zN0TO02lYUjdv0VQ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a0FWVEpiSG9FbUh2UlBYTUVkY05NY1YwREtGSElncTF6REUzSTFjNXp5MVZu?=
 =?utf-8?B?L25wenVSWWVFWlIxZVF6U0c1cE12bzdxR3NoNjV4NjREM0o5ak52SWVCKytt?=
 =?utf-8?B?OXM4WXk5MGxQU3RhV28wY05iVjRQTFRkd1lSemUxY3B3MWFiaDQ5R08zZlc3?=
 =?utf-8?B?NVRqb1llMkEzU1Y3c1pldXZ5azgxRmZJQ2EvYUZVbnU1WTFJSHcyMmJ1V3pt?=
 =?utf-8?B?ZVYrVllGNzRJTFBKczZhcnVGWmc4UGZtZ1FTZUdNNXpuQnRZWGl3Z1ZJdXdK?=
 =?utf-8?B?RjQ1TG4zczhKZzZYdTV3T1FNa0F5NWRETFRPcEkzWGhDZ2d0N21JbXdDbjBJ?=
 =?utf-8?B?bGI0UmVzRDRtMFM5Ymh5MkJRQTk0Q0dYUWdwbkFvUGgyZU5iLzQzWXl1VlpT?=
 =?utf-8?B?a1dSeFVQOWJiSkpPYTYwYjFjTGt5QWUrUitKN3BGK2tFZ1NpQzhIY3NKVWdX?=
 =?utf-8?B?REFCcmM5bnlXQmZDMTBLSUNRQjNDUVQzSmtIbW1FRXNVMUJsbDhGa2lnMVZs?=
 =?utf-8?B?VGVHeXQyaDB4U2ZCK3NRMHFBK3hTcWVlUTQ1YTZvWnl1Rm9yTnA4VW01TGY1?=
 =?utf-8?B?QjlmRCs5VUM3SGpNZ290V2d2SjA4YVZUT3h6UGtZOWx6QytjMmFEbFpBYzBt?=
 =?utf-8?B?b1hoaXc0ci84azZUelhFU1VxTjRZdEtnd21QOTQ3OE5JWlZJTy9hMzg1d0tG?=
 =?utf-8?B?OG4wNkFwQmNkN1lueXhoR2ZnQjhzRHZJMU1TdStjUWJCRm5BMndoVG15N0hW?=
 =?utf-8?B?Q0pNdmdHY2hGQ093c3VPaU82d2dnUExuTWRWNXdtNE43dFdSeE1QajZ6aHJp?=
 =?utf-8?B?QTFMbTA5SnZZTWk3ZEdnZ1ZXN3A1ZjV2UHBlVFBjeC9IV29pZk51SkgwWlBa?=
 =?utf-8?B?SnpJaGVWU2JBRU9zcW0vSDE2WmQyK3NkRzZOSklhdHdUSmVKQ3B1QWplWnF5?=
 =?utf-8?B?ZkliakpHZnlEdE1IM2F6NXZuSjBKMVprU1V4T1YxMTZHdTNDTkZXVUtMVXB6?=
 =?utf-8?B?SlZEMGRqdzJPc1ZwQUZDdXdwUHk4MVlnTmYvVDZhN2dYYVVQT1k3NlZvdEtW?=
 =?utf-8?B?WDh4NFcwVXRiZEI1Qi9yLyt5UituVWJmNDJnVFNIMDErZkpCSFk4SmZNSlFz?=
 =?utf-8?B?NGQwMXJmRFRTOFAzM0J3cVArVnU2TXdUOWM0d0ZOeDN1TVpQZVQzYzRzbzhN?=
 =?utf-8?B?bVJWMkx5OFZhWmhVaHB5bUtXa1E2S0pnbDJJVHFRNlJObnpHL21sZWpFMUdF?=
 =?utf-8?B?VCttTmN0QzczWFpSSGxDV3ZERlgzSVlGMXFBbWYremgrNGJ4UEw1b3hyeE5v?=
 =?utf-8?B?YjdtU3NjYWo2eFZvQXlwNm5MaE9TbkZscFBjVUh0RFpkdDdYRTFEMU5iTnZv?=
 =?utf-8?B?c3VMdlJ0MDg3ZS9pY2ZQVUVnOGZCcTBZOEJwL09JQXBaV1R2MmhJMlg4cEtJ?=
 =?utf-8?B?Vk1STVJhWHZXSWZHRDJ5U1ZMeDZXVndkSDRoeVhaMHAvQW9ZYURNajlBbGhC?=
 =?utf-8?B?UFZsdW9NNVAxMmpmdDVXMUZqNHdVWU5Lc05lSDdpL2V4emx5NDIxTEdlcTRH?=
 =?utf-8?B?SDZDZVE1aGxwcUhHN2VUSzNYSEhxdWs3QXNyekpOc1dDR0tsZmpKRFRpRm9S?=
 =?utf-8?B?bnpEbzZNRCtkYzFIUG1CZGI2UlFyNnhMeUMrbnd6TVdWNFk3V1B4S3EzVWhN?=
 =?utf-8?B?MnFyRFFvWUVTdkVScWE0eW9JVDJiWm5uWDhCN1lFSnBaSjAyMjIvR0YrT0d3?=
 =?utf-8?B?enB3SVAyclZzUXJ2TGprR3N3YWJsbFkrdnZaV2I5MXhFWThjVGVuS3dVUXZ6?=
 =?utf-8?B?ODdvMEY3aHJsR3E2WU5PbkVZdDlnU2E4am5qdFFoSjNZWVg5eEtKT0FwVGtR?=
 =?utf-8?B?T0NGWnpTeFFKblFJMlNoNFdNTzVmbmp4VExLMS93ZC9XTEhPY04weC83V2lD?=
 =?utf-8?B?NjZRaGY0dXF2K21rWnFLS25hZ1N5NFFrclVtZW9FcjZEbjB3OFMrcjR5KzZ5?=
 =?utf-8?B?MEptUVVYakdJeStMUnRKUCt1bGplVVNVRTEyNHpDcU95SmFCSVJDYm4rWkJK?=
 =?utf-8?B?RzdBY2NjTTNVYUowVFFDM1IwbCtsN0piYjBheEdFOHRwbmZZZEdkcGhJdGZC?=
 =?utf-8?B?Zis2ZEE4aGJ2SXZZVWJKeHV5Z1pRcWpLMDVaYys1SUQwSlBBL2l0dmJnMFFh?=
 =?utf-8?Q?SYVy+f4bRMXCsfi6Tn8vTIE=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1760fbe2-d344-48ce-0c1f-08de318be61a
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 10:16:46.5622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zxj+tFRXXEKkZ/B46LpxYCOXWET9nziTs7QMK7Bf3tti0eAf20IvhbqaCVMpn7LvOv4/Wntd66xCpTtZwGHx4vDzncWP5KessV9UKcHFnLs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11350
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 10:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227156

Hi Dmitry,

On 12/2/25 1:49 AM, Dmitry Baryshkov via lists.openembedded.org wrote:
> Fix few issues that were left unnoticed or breaking sorting order.
> 
> Fixes: 64108679ada8 ("mesa: sort out driver lists")

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

