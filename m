Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43409C36010
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 01:13:01 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.64])
 by mx.groups.io with SMTP id smtpd.web11.3141.1743556370958788708
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 18:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=vEMW+Hez;
 spf=pass (domain: oss.nxp.com, ip: 40.107.22.64, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aK680o1VvlInoNzXtmL6TDdMrhF2WiZDD9NeGa4mi5Gj7fnCSEE8PFlADxBYqFVcCJVHh0AbynWbMEyfFPqBYLRbLGkcZwznSpjg9CzHcb1h4s4BcZ1X+QMIKDGcPFag3voHhQlOhXGV/ut2vMQhTcuPwEbX98BeccdpYOEhivKjWN/g/m7UEgRUsghwQVT63FBon3xg5IOv6Q8i+rqCaAKbl61cPJpU936qXf1tkbAnrDBcRcroSnTiUva5MRMa1aAUDKP06cMwli5PlGHxjpWSDapR5PILgdDAkcNkL6HA56aJGMcwZGy/9FOV622PCCqy0QVK+r6lF5BewlUQVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kpFh/GpqqHIW/wyNgsCdlEH8nkhFIT0rEYiyoYaoN/E=;
 b=boFEdKZAVXpY/M/M3h4jnWS8AOS+IKIrajddv3XoZUAwVvYxsWLBL8ryswSYMGlv1UiJ8N6YVPmu0KPILOc8ADxCffPugHPC27fGLd+NaEBM7OaqqQ4iUJbkT+RB8qUTtPiK6fYs0Uv5o/Pnh7Sl4SXvGmK67kQX9JdNUb7vEZ0bLafaFYJXsyIcVyiULj29le2JWX6diyxKU+J6hV0P66yGA2tx7DsXB9xZ8TXzO9hgdDGcSk1biHZdWLULwG1aUrsWazg/A8QdkmOcImNN3DxIPkxRXaxZ9srh09Dodjmz1ZvXgpzHBrm8/Y9PB/pPuXpcdpRhlIgzBxqkRuqnYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpFh/GpqqHIW/wyNgsCdlEH8nkhFIT0rEYiyoYaoN/E=;
 b=vEMW+Hez2S/xTKce+gP5x9reFSNlIPfe3au8iF4D9meeF3VpkWxZkRDv9OWU7avQHjnJ6OoaWN6YONFXG7HvB7r0RAB1tMWRB7IX35hHYG+AEMgRSTA0j/T1eMiPGNVhlKLCwd82jS1MUhJHEMi6e96bwD1k4YlP1Gd0WsuFLefmy/bB3b/t5PTI3yXCFyVDSYaBkMto89GP9lNgT/DnCnfh4SRgcasepAoYb8LOu2q+0TBenmJj3XQhptnreG5uPXqquTMYeqi1wCI3ohe9yPM26tI7l5Nvq2YsRAQiOOxuyKWT2k2NQSA8m4hUJfIN0W4L88cBbht+MijQtgyAFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM9PR04MB8891.eurprd04.prod.outlook.com (2603:10a6:20b:40a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 01:12:47 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8534.048; Wed, 2 Apr 2025
 01:12:45 +0000
Message-ID: <3a66f1a0-5dee-4ac2-9c3b-4113bc23810b@oss.nxp.com>
Date: Tue, 1 Apr 2025 20:12:04 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 1/4] toolchain-scripts: Export meson settings
 for SDK builds
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250329180853.1057381-1-tom.hochstein@oss.nxp.com>
 <DB618274-577E-40BB-A811-A96042B3FE73@arm.com>
Content-Language: en-US
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
In-Reply-To: <DB618274-577E-40BB-A811-A96042B3FE73@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0178.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::19) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM9PR04MB8891:EE_
X-MS-Office365-Filtering-Correlation-Id: bb4c7538-df03-40e2-18e8-08dd7183797e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|4022899009|366016|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?a2RTS0FSNXZITHJjWU5UZUxHYlJBSHJKaTc5VVErNnU3S1JGSHpQaURzN04w?=
 =?utf-8?B?cU9DTDkxaXBKaTJjbi9nMCtLRVNsYktWQU5WMEk1WnljbzE1QzRVZ3dJMTgw?=
 =?utf-8?B?aHNjMDk5bU5xR3RWWFFpaXkzeUZTdkM2TzB2SGRqakRPYW9sL3ZNUlNGMlFp?=
 =?utf-8?B?SnU5cVVWWnN3Sm5OZXBGWGoweHNIbVZaYi82cmhzcHdQWm9WcXpZajZtNHZH?=
 =?utf-8?B?NlVEbng2eUFhY0hkUldaL01FeUpZVG1YVzZuM1VVTHorRXFUWEVNUmhsVVdx?=
 =?utf-8?B?QW5ieEFINFpZM0puUXE4K2hiTjdOVmdvL3c1RkMrdUVDVEE1QWFxT2c3NWNP?=
 =?utf-8?B?NjZPZmFoUVlMUm5TMVQ2Z1drckZyeS9MQ2d1K3NHQmxyRmpOMTRIbmJ1ZVFj?=
 =?utf-8?B?YmVBTTFyRFNJRmZrTDlmOW9mYXdudFVoVDExMHBDMm1hZ0ZDODZFa05UbzRy?=
 =?utf-8?B?VzNTQnRleVRPNDFBZWwvRi8zbnEweXRGRXpISnlkYTI3QWVIOHNSTVo4aHY5?=
 =?utf-8?B?bXp3YkVYdEpwajAzeUZQdDRvU2Z2bkJwSTBJb3QvOVBkK0wrMzQrd0ZpTmpu?=
 =?utf-8?B?ZU4vRk1KYTlzZ1pVdU9WZ083SVNXM01TYVFzL3N2TDZicEhHUmtTZlJnWHVk?=
 =?utf-8?B?TzZCR1pJOUtNNGRWWkpEMzlOQkFpVWRBS1NsY1cweDhsTDA5aTdLV0d5a0lO?=
 =?utf-8?B?Y0dNa0c1anRweHVSblZDSlAwR0VPVW8rVlBlYXhmcDE1KzhJbldhZXpya2hs?=
 =?utf-8?B?ZExxNFNXUWVlcXc5Q09zK0VKRis0eU5oVXI0OHBjYUJHN1B4UURYMnN4UWlx?=
 =?utf-8?B?Rml5Qkg3YXJJQ3hGanAzanZwcXdDTnYxaHN6ZzBpMy83Y3Y0L1ZHZC91ZS9W?=
 =?utf-8?B?U1k5ZGxtM1VBa3Q5VnRUcEprcERTWUlWdTF2dlNmMnErNkx0Z3NJa2FEMzY0?=
 =?utf-8?B?cThBTmlRanBaWEJuK0ZIcThUODRpS1B2ZXRRTVJqYm1lbmtuRjR2UlJPNm5S?=
 =?utf-8?B?a2Vac2RBbGdneUZEak5reWFsQmFwMDBCcW5tSElsTlorbnR2SGhQT1FwU0I5?=
 =?utf-8?B?a055NmlMdTBQdkZmQS9Xd28rbE5XT2d4U1RZdk5sNEY2a0ViVnJ4dGRPcVZO?=
 =?utf-8?B?UkVRZVBuY1kvcjVQbEx3T1RZdVR4TzBDV245M1AwOGxpRlgxWGZLOStRTUxH?=
 =?utf-8?B?S2NLMUtLN09HMlgwREs0NDZJdklvSU4yUjZTdXM1THgrVnczbFVqcGwxODBp?=
 =?utf-8?B?c3ZVcXpKbUp2UXU5NlJNTkdFdzZYUkdOZXFKS285Z3l5bEJrMFc0alE5NUdn?=
 =?utf-8?B?WkhzYXhZMldOSkV3alhzNTk2V1hWSThZNUZUblVOOG8wMGszNkh1MXlZdDR5?=
 =?utf-8?B?RGYrZDRxVm1HeEkvR2F0NTU2dDhlM0hqaWdmYzdwZ1d1UU9LQUdTdHhacWV0?=
 =?utf-8?B?djFpVlNlQ2FkRWpmMEpPUWxOM2RCT3YwazNiTWlDWmdjUG0zN2Z5VGlQaU9w?=
 =?utf-8?B?VE1lQU1jQ0FkUHVUK0VNM0FpSm9zYm9FNkphdXJnVy9waXA3MGRNY2hCVS9U?=
 =?utf-8?B?cmFMT1ZtQ3VhK1dkTHZlcjlBMXNBQXVVblpWSm83dUhFTFJiZG5EQVpXQ0Zt?=
 =?utf-8?B?S2d1K1hYZFhzcHpVVlIwQ3ZaeTJFa2hva3dmWVZGTHZPemY5M2hEMkk1amZJ?=
 =?utf-8?B?azlERTBaS0pOaEZ1ZXVuR1BIVE9DcGdhMFlCMmxKWE5nazd3OWN3V1c0VkNT?=
 =?utf-8?B?c1ZMYS9BNHpHYjdhWnRZYVAwSlEzRHR0WVVKMGdXOGJvaFhySzllMFN6bTAv?=
 =?utf-8?B?VEVUQ0JkTUJQR1BQVXZ5QT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TmFTRzFEWEYraW95SDJYNnQ0ZkZvYUtVbm1wWHJ4MzZjN3dTbWZBdFhVMllm?=
 =?utf-8?B?dXhpdmxWZWZaNzJwRXN6Y0dpZHhIbHhYbTVUMlc5NmY2T1MxMXJnTW1yYk5x?=
 =?utf-8?B?MUlsU053dGdRR0wvcG11VXV4Wlo1UXJmcVRXUWUzRWxEZCtrQVdsU0I4Qm9x?=
 =?utf-8?B?T0VBSjhibUwyTGVJMmxJTTBQM1FSelFxanJyVWNTS0U1Mm1uWWFXekh6NWM0?=
 =?utf-8?B?VmlnaXZXMmQrZmpKdXloOVJRVDJQVHllR1BCR2hEZnd0STJjbS9DN3VNbTls?=
 =?utf-8?B?a1IzTnZHNlVzRWt0ZHRhWEpxWXEvcnRVSllLaWFKd242Uld4TE50Q3lWd2FL?=
 =?utf-8?B?SEtaTExta00zSXFlem9RaEJlRmlLNWJrZDd5UTZlSDJvdlY0OHRTQXF4LzN4?=
 =?utf-8?B?dGhBc2hNUjNoR2RQNEI0ZktlczQzVnFNb0lwa2hzOXBnb0orT3d0NkNKVGVi?=
 =?utf-8?B?RFdXNk9BTWZHcDVqMDM4MUEwc0xZREFqaG1yeGI5cE5YcTVVcVBKdkVUVFkz?=
 =?utf-8?B?TTJUQ3dZYWg4UnBBOTk0dGhWVjdHNDljckZicHo2dzlFYU92cXBxUnlqNm51?=
 =?utf-8?B?NTd5c2gxTEFZd3hwQUJMTVgyemFzSlpzVitFWVJVRU43OWt5OFdib0hIUGRX?=
 =?utf-8?B?dDBKeDEwMUZqL2c0azAxWThreE1JKzVMMTduZURqY1pSRENwY2NhSEVwQ2V6?=
 =?utf-8?B?a1VmRUVDVkErcFo0RVV3bEYwOTM2MURDMzdicnJ1YXRWODB4My83cFpCWm5p?=
 =?utf-8?B?Q2pjSUNzb2NhcjNiRVpnZ1pDT3dNNmlNaG5yZnJYd0llZGxzTG1VYThpNWw2?=
 =?utf-8?B?Y3hpSkpuaHh1dHFPdXZMd1pFWjZyVjZRTVM0MGdFWVhEWWMxK2czSE1zQURI?=
 =?utf-8?B?TUYvckhHb2VPNDhMMUtnMVAvZUxBSzdGQm9hSktiM2IxTmpFazFQMmVmdDM5?=
 =?utf-8?B?UVJremF3TkRKd1dTY0tkaTV2YmkzdFJkZm16a0hOclgrSzZaQXNBaU9NZjA0?=
 =?utf-8?B?Z3N2R2hxNlVGRkw4Q0dubFJsazcvR2I3eXE1Uk0xWnE5NkxwcUlGM01Ua1FW?=
 =?utf-8?B?SjhUd3FlN3laTCtKUlJzaVprdnd6eVRsaENCZ0pDWUhzdzFpcG5CSmRHR2Ri?=
 =?utf-8?B?NHQvWWlET1Y4Yzk0dmN0YWwyZTRBRUVmcVMvd3RvUkhSUzhVNml5MXJqZmE5?=
 =?utf-8?B?VlRZcHlZTnFwellhWEVUMUlmbU10K1BOeDZiSkQ3ZzQ5elczSjkxOU4vNU9m?=
 =?utf-8?B?WXFOMUhiMHFpSEVNT24rb2srR2krSldIN3BEdktTUVc3L0JMbG01Q0V0N2ox?=
 =?utf-8?B?bWJmaWk0VTg3cVo3ek9BT2RLdUtXdWZMWXYySy8xS0lTZmNxbFpBWnFyK1pI?=
 =?utf-8?B?bDVrUDlPNW5kRDFUUlVlQTRmL1F3U2o1SGNGV2NSZDRlTkxrY0pYNzQzYi9I?=
 =?utf-8?B?Qk9HZ01TMjNLZ21OYis4VWRMeG8yelVuSEJOWi9RUDJ1Z1YvMnVVYW9iTGxq?=
 =?utf-8?B?U0JyODBSaEFTRmlFN3VRNC8zclRjc0R6Vm1mci9mZ3VGamg0dnlYd0ZNWU9H?=
 =?utf-8?B?dTFLQVpXa0YrQjZweFNTUUtjZzJhNThkMVZOUFRGMlBZbVpIZ09xVnc3bXA1?=
 =?utf-8?B?VWcxVmdHMDF0cEFOUUFEakFVM0cxMndiR2Vacm1yaXJWZ0NqTTg1MmhuQ0gr?=
 =?utf-8?B?UDczRkxzeDI1UHNVdFMwZ2ljMVNtdTY5bXpYWE81aFJEb0ZDWXB0SG9HYjEv?=
 =?utf-8?B?TTFGT3pSd1pydmYwWUJSaklJUmprRFcyODc0RzRwN21oREpIM2I3cnM2TmJD?=
 =?utf-8?B?QU1ockJsMnUwbHU4SENra010WVZBby9MQkM2UFNJRDNqemRiNXNoSGkzSVN0?=
 =?utf-8?B?R2hZVWtnUHBiSzBqZnZoV2tReW9JZGZYVVRwY3ZxZVFoZnVuUWFueGp2cEp4?=
 =?utf-8?B?UFpUTm1RUU9kWFVTR3hRVldNS1kydmIyYTdITW9hZW55Z3hLN3k5NjU1Rjcz?=
 =?utf-8?B?WHlqRWljcDJXVVIrSDZzNTlQZno1NU5wa0x0dEQ3WWtLR3cvams2K0NsRFVm?=
 =?utf-8?B?NEU3a0tVN0M0RVROTFBhRWFXVktPOUtTQ1hCV1FyVldRZ0dBVXN5cWZCUUx2?=
 =?utf-8?B?dXVNVUV3Rjc0WUlTVzcwWmRhUFdsNUFScUVvbXdPRXZMQ083Njc1V2Jad3M5?=
 =?utf-8?B?Nmc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb4c7538-df03-40e2-18e8-08dd7183797e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 01:12:45.3035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 24ctBR+w4Mz3voVZz5Fas1PoC/IbxTj9fOZFfHB9MTR7YxYPUOBgQA5aZ7BJH0R0w1lxR9pGzk8ENHvUXzmkWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8891
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 01:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214162

On 3/31/2025 9:44 AM, Ross Burton wrote:
> 	

> I spent a little time glaring at the meson/sdk interaction previously 
> before getting sidetracked, can you verify that the test case change I 
> attached still passes?

It does.

> 
> Thanks,
> Ross
> 
> 
> 
>> On 29 Mar 2025, at 18:08, Tom Hochstein via lists.openembedded.org <tom.hochstein=oss.nxp.com@lists.openembedded.org> wrote:
>> 
>> Create a new set of exports for the Meson `host_machine` cross settings.
>> This allows the target cross file to be created correctly from
>> meson.cross.template and aligns with meson.bbclass.
>> 
>> Note, one might think that HOST_OS and HOST_ARCH would be appropriate as
>> inputs here, aligning nicely with the Meson naming. That turns out to be
>> incorrect since the script is generated in a nativesdk build with
>> HOST_OS and HOST_ARCH set for the "build machine", not the "host
>> machine", using the Meson terminology. See
>> https://mesonbuild.com/Cross-compilation.html 
> <https://mesonbuild.com/Cross-compilation.html>.
>> 
>> Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
>> ---
>> meta/classes-recipe/toolchain-scripts.bbclass | 6 +++++-
>> 1 file changed, 5 insertions(+), 1 deletion(-)
>> 
>> diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-recipe/toolchain-scripts.bbclass
>> index b59a295abc..e54685e965 100644
>> --- a/meta/classes-recipe/toolchain-scripts.bbclass
>> +++ b/meta/classes-recipe/toolchain-scripts.bbclass
>> @@ -4,7 +4,7 @@
>> # SPDX-License-Identifier: MIT
>> #
>> 
>> -inherit toolchain-scripts-base siteinfo kernel-arch
>> +inherit toolchain-scripts-base siteinfo kernel-arch meson-routines
>> 
>> # We want to be able to change the value of MULTIMACH_TARGET_SYS, because it
>> # doesn't always match our expectations... but we default to the stock value
>> @@ -72,6 +72,10 @@ toolchain_create_sdk_env_script () {
>> echo 'export OECORE_TARGET_OS="${TARGET_OS}"' >>$script
>> echo 'export OECORE_TARGET_BITS="${@siteinfo_with_prefix(d, 'bit-')}"' >>$script
>> echo 'export OECORE_TARGET_ENDIAN="${@siteinfo_with_prefix(d, 'endian-')}"' >>$script
>> + echo 'export OECORE_MESON_HOST_SYSTEM="${@meson_operating_system('TARGET_OS', d)}"' >>$script
>> + echo 'export OECORE_MESON_HOST_CPU_FAMILY="${@meson_cpu_family('TARGET_ARCH', d)}"' >>$script
>> + echo 'export OECORE_MESON_HOST_CPU="${TARGET_ARCH}"' >>$script
>> + echo 'export OECORE_MESON_HOST_ENDIAN="${@meson_endian('TARGET', d)}"' >>$script
>> 
>> echo 'unset command_not_found_handle' >> $script
>> 
>> -- 
>> 2.34.1
>> 
>> 
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#213889): https://lists.openembedded.org/g/openembedded-core/message/213889 
> <https://lists.openembedded.org/g/openembedded-core/message/213889>
>> Mute This Topic: https://lists.openembedded.org/mt/111975257/6875888 
> <https://lists.openembedded.org/mt/111975257/6875888>
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [ross.burton@arm.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>> 
> 


