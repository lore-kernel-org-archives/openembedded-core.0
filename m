Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75392FE5202
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 11:14:04 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.2])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18854.1777029230263735626
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 04:13:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=M8lAB/5Z;
 spf=pass (domain: cherry.de, ip: 52.101.83.2, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qp9tD/NXzBqwXxgAXF/raNx1MaX2geilUNGouY7WfYUZ3G0QIMund8U+WRFza5OjPa4DfhhlyQcpHovC2MyOGWvF4V6IaU4Yb53X4yjAQuSkK+S1umeS3vWaYjU62/S1KuVgB6k7g5SdP7evPebWQHPk7JXv3JynBINfsC84sdL/iB6Er5QTNKUW/mr0Ylxk4xMltSsdU+9BgFiJCS0BqO/AZcGRpZ1LF275avU6JnK+8/EpI3Kjk2oELFp9cUnKcsTEzzrbcuXnLPcY5B0RNH4LHyEuD2Zzy6j5TF4Qu03VQZjH0JdnF3PBAEgYjv/7wcP7+l3edgsBIzudTq7m0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRpFv/lFcgYD7J3BGSiam4SUR07dWLgbvM+dlft62AI=;
 b=Fk5MIRWEWj6SALv7ZX3njc6cNolJFNG2jElVvy7T95P2v8ap1vH4P/U/NNY5IdtKzmZWBKRZOAh7u7E/nK0K3VjFppuCo9MqRkYQCWE3K0rfy/Q57wey31DjqnXULNgtBs/1UMz6lZOaLA/m3KIrhRoIkXwN9owmYCWq3RhNZJJAcGkTicvow0JLGaJsgc0XeIqU/iHO0+swErqGbUGyuX/v6MkTmkj+j1xRls1F/0nGk1ENmm39RSlKCrAUBMkv0Yupzyf91yIwO1/m2SlgsGjARNuTvRbnXdcrLf6uDdbeSsD1UWMDNOUsf29bJO98tc0qF+htAOorAZnSZZqtWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRpFv/lFcgYD7J3BGSiam4SUR07dWLgbvM+dlft62AI=;
 b=M8lAB/5ZXqraKHVDJdcZglKswhGmQPQw30sT9mYC1AvZg1B2JoY8A0p8KSU3oNmK54I99iFezNlir8E8BAGJIpF/7hXi6dArfftseoqSboo1fZFvrX4dbWTRB+wDDBRFVNXTLX5lCNKk09RNCn/yfyBqoqUWcT886mGRq3McvZ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by VI0PR04MB11917.eurprd04.prod.outlook.com (2603:10a6:800:306::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 11:13:39 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%4]) with mapi id 15.20.9846.017; Fri, 24 Apr 2026
 11:13:39 +0000
Message-ID: <52fa5836-b061-4896-be48-673fca5ba3d4@cherry.de>
Date: Fri, 24 Apr 2026 13:13:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] u-boot-tools: Add dependency on libyaml for
 dtschema validation
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
References: <20260412035757.134385-1-khem.raj@oss.qualcomm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260412035757.134385-1-khem.raj@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI5PEPF0000097D.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::80f) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|VI0PR04MB11917:EE_
X-MS-Office365-Filtering-Correlation-Id: 045de782-bb74-45a2-99d6-08dea1f28935
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|10070799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	M3H11o9U7QXzjueafrrpjvVI4PTrLZWiJV6/eabVrfbXk9wXSxdTtxDd9U4WGSU29FUctv+FQtqHVEBcT3cLI2H1gkjMWzMOkVzOVVrXCj1u6nzLSTsEnL+GPutgZpV7QjUTTWTMdJualgD6AfEVGp0IT9RLh/+UfxvThYcRPUwRptlzfX8AIRsVky33A6jMURpyUTkNe+r405WwVQ4QAhiVIoXUCoxMIv/FFTIZKFPnMr47/MHtA30C7blipLx3wP2nX1hosVly2xy9JyUN5Q8imNExlMpLlSAhw1H8itWi/KhNLcBkmkaJIhtXmkolS3uuCqdTX5yvFb26OuKrf9QIuG0r7Ibr47bN36VqotV+er/4Ns2aI68aGD49Ng5dqPMSsyYN4tekCfvx1LZ9uszlsi7tVpejnVh0u0fxrhI9gzl31djRz3xudHQtjI5HclpeK6GSeZNWQTFzVa6bB7V6+i0qRt77Azt6STqEqYACbiyJRwmY7Jh4K0k4MHXZvWgRKhQrdQQIibPaU+Er7imLOoCLAjKlpe/2bY6p7ut/hQuAuyqwbcG5rZAVvYT5ZjA3G7SOw8rC0qglG6ppcXVxsQ2ueF5UyheUzS6q7JtgcJdrguKPVMVpCiQ1QPQJG10mnFvsu62i3bhI4F3gkrkGmQfCfCYWZfAg1GAQqE+IvjRvHeNGTiPsE9ba1VGWgUffDWuKTinzowbDourBQOPzV+OUNaIIYP2ISSpa0Lc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eTZoRTFxVmJ5Tk5zczBIWUo1WldoVTZrOVVWckNmdStiZTdHa0dGY0lpNnVD?=
 =?utf-8?B?OG5ZSDVQeWxFQk5jVGdGeXBEQzZDblRCdDRxNFlLT0hOTFlmb2QvSXB0QlUr?=
 =?utf-8?B?Wk1xMkUvTFVyRkt4azErWkJLUUZUQTdjTzA5Mzh6aWphL1ZuT0xhcmxtVUF5?=
 =?utf-8?B?eGN4ZWl2dER1NERKSVZYRkxzSFA1blZyUlRZMThYbEtWS2NjVGRNcU5NTlRO?=
 =?utf-8?B?cm1aVkFCRWUrWER2dDMwWVAreFdvUkZ4L2N6ZDhFc1R5RU96RXVTSVhZWmNy?=
 =?utf-8?B?Z1VDYklGTEZiVzl3RFVsODFFOUpnUitvRXJ6NjZYMzd4TVg1aVhEUGhDbjhu?=
 =?utf-8?B?V3ZpaFJBcFY1WG5JcnhxVTdLSUxHemJmQW5WZExDMWVGTmRnckVoRGtrSU1I?=
 =?utf-8?B?SmNGd1loRU90WmZKVDZkU3BaK3pUZ0tPcmY1c1g2K1hMdGU1aTNrRm84SUti?=
 =?utf-8?B?SmpNNTFwYzhya0FDYUZnTkxVejlGTGJaNHpoRWlmWThqWG55MTA3ZEwrYlIy?=
 =?utf-8?B?S3VyeGRiVVllNmVVUXA0RHJCdkp5c291NlJYa1VzeUVXWlVpV1JQbUhoRkZC?=
 =?utf-8?B?Njh4NnExQmFaTzJSRThzL1lZcThsMHczbFNyWk9jSENlYXZGck8vNlhUaTRz?=
 =?utf-8?B?VWYzUDlXOXE4Sm9RMGRjVzBsbGtTOTFrNXdHWGVWZTJMeG9IOFNVVnF4OGJM?=
 =?utf-8?B?b2FxazkySndkSytkWDQvdG1KZWx5UUFaanZaTXRXU2Yva1NQWDhUOUthWHBq?=
 =?utf-8?B?TXpVRUdUYzhtU0FnZXdxU2lHTERZM0ZzeVFjSkVURlozT1loVXpOY2VTYVE0?=
 =?utf-8?B?SXM5YkYzVWNmMFZxS1NOZFZRR042YWc2Y0lBOHdzd0xRTEkreXVLOGZYWmhL?=
 =?utf-8?B?SzRMTThTbmpSOEhLeURibFJGNGZGK2J6YWlNKzV0ZWpobkdIaHh5RHpzY3hN?=
 =?utf-8?B?bXlNTURwM0pRWTlxenpVNjlDZEVXMEhNZnVJRnVIQUFhdXU1V2pHekxGL2Mr?=
 =?utf-8?B?L3RHWmpvVVV1Q29XdWc4REJRNjN1bFRQem45dUJzbmYxSmV1cEhyLzBOaWFV?=
 =?utf-8?B?UDlOUHlZdUpOWFZOTEU5N01TZnFqR2EvaG16dDJ6YmtUTk5zQ2VkWE5FTUhE?=
 =?utf-8?B?aUxNU3JxWDNrZmZrMnFYb0l2OHI3Ris5N0w0QWtDM3dxdXQyd29DQ2lzY25i?=
 =?utf-8?B?cnBIbDRtanZwbXpNYUlkZUt4VCtwV09mQVppaFMrT3N4dzRPeDgrMUVoa2k2?=
 =?utf-8?B?UlZJZXJZbHlZV29KYWgxLytRK3lpR05XNEs3RDRBajFNdWJvUTVpUGV5dkpQ?=
 =?utf-8?B?RFBWODRGZmJtWUFEZENFbEExZ1FoWWFLZGNuSkNZb2ZrbTZFdnR6c0hEa3VC?=
 =?utf-8?B?cjFDYXFhQ2VEZVZ2TG5tM3d1Q2dCcTRCLzErMVhkcHNlRjVUT1diWDBKcDhV?=
 =?utf-8?B?UldVWDU1MFFvRldjcnZtQkMrWjRCRzNjQmdYYk1xV2lJZTRaU05IODI5YjZB?=
 =?utf-8?B?c2E2WEpRc3JMSjYwMy9oWU5Zanp2bGRVRHR6UGhBUE82VnhFY1hLTmJsNmNm?=
 =?utf-8?B?RUxkS2ZRWGE2bVhWTnNxODZnVTgwc0N4QitRRmVYaFJXOVhueEZyN2tGT2JP?=
 =?utf-8?B?ajVXaU5pRkkva1ZwV1Y4MTh3M2ZIajJqZnpmQkR6MTlBbkJneEY2MmZlMGdY?=
 =?utf-8?B?bEZLVkRybm4xNXE3ZDBwNVF2Q1Nsd2JsdE1uL2NnT3FIamg0MCs0T0ZBVVZK?=
 =?utf-8?B?Vk84aHlYVVpuak1TbUp1NVZUUG1zYXQwMHY3Y0dRdlA3VnM2aHNaK2orYWhI?=
 =?utf-8?B?YnptQk1IWUplZHlETThUL3M5eXVrV1ovNnpac3N6ZDN5Z2Nzd0k5dEVCbjJ1?=
 =?utf-8?B?dG9SVURyS3QxemphVnByUHZrWDY5SlpycEpVdXFsNjBSL1BzWVVTdHBRMFha?=
 =?utf-8?B?UzltZ0prV2U4MCttckljelpRWDA1SFQzeFdZZ3E5WHlEOGkycXBwRTJkZndG?=
 =?utf-8?B?cGVQcEhTcVJhaDIxZk9yVWZhZUo1QzBSMWlHMkV5bThraGYvZUU3bG1wbjM2?=
 =?utf-8?B?Vy9ZSG9rZm5jTGQybGxNL09VeUxzYytCVFFyYjNNOUZtejdSaGtGbDdMR0NN?=
 =?utf-8?B?VTRuTUpIUytXZG1rTHdsaWw4WDd1ZndjK2JnQ2VwTWtDcGpKYm8wTUQ2alM4?=
 =?utf-8?B?TkFYaWsxSTUxS1loR0Z5anVteWJEZFlxOHkySi9CNS81V3V3U0h5T2ZrM25D?=
 =?utf-8?B?VFhxQXZoQnl3eE9LQ3BTSU9jSVZZaURCSHJJdmNvL2wwcEpScGlpTGpybmhJ?=
 =?utf-8?B?V0FzbVZjZVNZOEZwVmQyMFVmdXlTOFJCa2hNL1IzV2lXN3NQcFpscVEvV0h1?=
 =?utf-8?Q?VqycNLwCMsmKGt/8TT5KkGyJAsE+Bt4lJabO1?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 045de782-bb74-45a2-99d6-08dea1f28935
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 11:13:39.1532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zBW6ftNngSlSRWEBIQbiPKSqzEXZjrDMslGopise7mQUgJSsZk89zO52G34uSrb6koqOb/oi0dfl+0h6WuRIYPFtSmh0EXRvsTNtLQpRo1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11917
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 11:14:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235858

Hi Khem,

On 4/12/26 5:57 AM, Khem Raj via lists.openembedded.org wrote:
> yamltree host tool, used to emit YAML from the DT, is now
> built as part of the normal u-boot-tools build to support
> the schema infrastructure
> 
> Fixes link errors like
> 
> | /usr/bin/ld: scripts/dtc/yamltree.o: in function `dt_to_yaml':
> | yamltree.c:(.text+0x91b): undefined reference to `yaml_emitter_initialize'
> | /usr/bin/ld: yamltree.c:(.text+0x926): undefined reference to `yaml_emitter_set_output_file'
> | /usr/bin/ld: yamltree.c:(.text+0x933): undefined reference to `yaml_stream_start_event_initialize'
> | /usr/bin/ld: yamltree.c:(.text+0x93e): undefined reference to `yaml_emitter_emit'
> | /usr/bin/ld: yamltree.c:(.text+0x957): undefined reference to `yaml_document_start_event_initialize'
> | /usr/bin/ld: yamltree.c:(.text+0x962): undefined reference to `yaml_emitter_emit'
> | /usr/bin/ld: yamltree.c:(.text+0x983): undefined reference to `yaml_sequence_start_event_initialize'
> | /usr/bin/ld: yamltree.c:(.text+0x98e): undefined reference to `yaml_emitter_emit'
> | /usr/bin/ld: yamltree.c:(.text+0x9ab): undefined reference to `yaml_sequence_end_event_initialize'
> | /usr/bin/ld: yamltree.c:(.text+0x9b6): undefined reference to `yaml_emitter_emit'
> | /usr/bin/ld: yamltree.c:(.text+0x9c8): undefined reference to `yaml_document_end_event_initialize'
> | /usr/bin/ld: yamltree.c:(.text+0x9d3): undefined reference to `yaml_emitter_emit'
> | /usr/bin/ld: yamltree.c:(.text+0x9e3): undefined reference to `yaml_stream_end_event_initialize'
> | /usr/bin/ld: yamltree.c:(.text+0x9ee): undefined reference to `yaml_emitter_emit'
> | /usr/bin/ld: yamltree.c:(.text+0x9fa): undefined reference to `yaml_emitter_delete'
> 

OK so there's a test to check if libyaml is available by looking if 
there's a file at $(PKG_CONFIG_SYSROOT_DIR)/usr/include/yaml.h. Then it 
uses pkg-config --cflags and pkg-config --libs on yaml-0.1 to find where 
that is located. I'm assuming the first one is found, possibly on the 
host distro, and the pkg-config possibly returns nothing as libyaml 
isn't available in the sysroot? This seems to be what 807bcd844afe 
("scripts/dtc: Fix pkg-config behavior under sysroot") is supposed to 
handle (specifically mentioning this fixes building with Yocto SDK). 
This commit is part of 2026.04, so not sure what's going on there. They 
say the error doesn't happen within Yocto because pseudo intercepts and 
rewrites the path, so this seems weird.

This logic is also borrowed from the kernel, which funnily enough 
dropped this entirely 4 years ago, in commit ef8795f3f1ce ("dt-bindings: 
kbuild: Use DTB files for validation"). So maybe something to work on 
with U-Boot to update DTC again (Kbuild and DTC updates aren't trivial 
in U-Boot as far as I understood as we have "lightly" forked it).

Cheers,
Quentin

