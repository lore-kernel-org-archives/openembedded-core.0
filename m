Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EAA2D5B170
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 10:40:54 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.37])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45695.1765795246246842905
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 02:40:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=aH4a0woW;
 spf=pass (domain: cherry.de, ip: 52.101.65.37, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UB/LmcAhk/oC7/jazfRz8V4f+je0JC9VHtMzyH/ZqvTS9ynV4nf7oW78rfUXK5gekGDH0pAaNfj83hTtpps5BG1xT4UXXAKjRtubcq7p/Nlfe5OKO4D4hddas1MN0nfYEmsVLfamhl0PP6MEOUIZwematxe4xyD4yiCXKlPETHlID3Z6VAiqcppG7Z+vC2m7QCZ+ykhNiVdiseZaXtYNJgo8btAC9r5Q568FcuRL0b9+JOvKn3aPEwzCuhcyFcyOTBkzk6wkch00/Qe+i2ebQHCMcpUXOgJeG43ywQB5VoRshrQGyjiLHb9VSzfwArgB8ornEh/qEGwQb0k8OaicYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gp5FmcZLs6GAKxp7z6xc3O7zY0j1OTu9BtNagUpOht0=;
 b=Bwi8caytNrGISJ9794PsZiQdnPXkj7MRREvNwSyMNaCOxgSsoOwuoBliCsAQZGHPazXHk+CZN4C96ESUO8Pv1kUoa+Wn5Vmy5og6s5y8t8+T9HcJ25ImdSlHgG8LAKF0Lej4tFPNwvRDD2QUXrKUrVoc+sUl/ObuoUeLf73k9pqYKUstyR0pt9WsYBVcSCyCIBKge7VlXQfu4vInKyakdg+O8rSWIV3B6pQRpM3nT8xBgtX7XfQ9EjskWAL6frv4FEMKlfXvfglNYPnktbKOg5oW6EUocuSVtbQG0UkVthikCYFjcgAL88nHn5aNgLW5iDGggB5CyKTtTP1OjC+Xyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gp5FmcZLs6GAKxp7z6xc3O7zY0j1OTu9BtNagUpOht0=;
 b=aH4a0woW+pXYnt96V5hCWmGQDn9fPvRY9jauzg4o1CZNj9JyLDXgoLF872Sdku5cwcUDNOQv/3x6LDBr0rBP/MXAH9ej0upWPRcULkDohJrP8vIlqcP+Ac8kAkST0qpp+S1P1mOopd73O42NhH5l1ioxqzaUvrRLtZbsang322c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GV1PR04MB9150.eurprd04.prod.outlook.com (2603:10a6:150:25::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 10:40:40 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 10:40:40 +0000
Message-ID: <b23a2bf2-41f5-4d68-aeab-e647b1240fe8@cherry.de>
Date: Mon, 15 Dec 2025 11:39:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v4 3/7] libtoml11: cleanup package to adhere to
 the recipe style guide
To: adam.duskett@amarulasolutions.com,
 openembedded-core@lists.openembedded.org
References: <20251215102041.1630567-1-adam.duskett@amarulasolutions.com>
 <20251215102041.1630567-3-adam.duskett@amarulasolutions.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251215102041.1630567-3-adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0025.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::14) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GV1PR04MB9150:EE_
X-MS-Office365-Filtering-Correlation-Id: 9de8908a-1a0d-43a4-c901-08de3bc66444
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M043Qkt5K1VSNUNsMlB0akxPZk8yalIzUE40WGQ0dEpsUU5sMXVYdmQ1QUFx?=
 =?utf-8?B?T2VxeXVVY2gxOU9EZUd0MmxGNjA2NGtaSU9adERYZjc5QWtrWW5ocEhJZ1BK?=
 =?utf-8?B?SDg0MVRFRlpveTZoaVlVYXNqaWhaOEU4dytGYVNWdCtLV3htc0JwNWxucXcr?=
 =?utf-8?B?RWhPekxYbmFTcEExVUtJdmlpY1VDTTdKWkFWZURGbEN0ckxSMzNWa0FveGFW?=
 =?utf-8?B?Qi8rSXhOd3dzZWkycXhsazdmWTF0cVIvQlI3ZjZLOStKc2t1c2phemN0VVlr?=
 =?utf-8?B?djMyYk1RK1NCN0dlejVFWnlUcW9QSGJ1OXl2ZWNwbUlaeWJ1aVhHOC9EWDQz?=
 =?utf-8?B?UDdiYTVQU284NUlxcXd2dk11bXFFbytrUmNMYjJBNnF0dnhrMVBFSmpGTWVM?=
 =?utf-8?B?RWVteUVxUTJLV0FpRkdGTHZuZDJOK1ExeDFqMkJNcHFQS3ViWW1hd3lhVUpZ?=
 =?utf-8?B?RkhERUpLRWY0dVo3UWQ1N1llK1J5aDkyL0t4cTVobWdVWmE4WCtWVnBrTU1N?=
 =?utf-8?B?ZGFneTAxUk9TOVFxcTVXNmEzMWVzdmJRblBnQlVBajNFbENiKytoVmVJV1Nr?=
 =?utf-8?B?M0EreTJ6cmJXZ0szUis2cTlQQzVEWEtQb1BlWlc0UHZ3NTQyL29rWUcrRFZL?=
 =?utf-8?B?dG8xVmVwUEROR0Zyd29JYm9GSXlMTmwrSjdvdlNzRGc1cU9KNThCa2kwejRP?=
 =?utf-8?B?YlplZGljZGVWOVdKYTN1aWdkTnJ2VWVuV09QSXJTYkxDMlBWTFlBcXd1UEtY?=
 =?utf-8?B?ZGU0Skd0WE9sUmNla2Y4YlpGeU9HL3Ryd1FJV0ltWDNZVmVJZmQzZnBmRnBQ?=
 =?utf-8?B?U3VwVGxneUsyaHRmdmg4MGgyU2ljcHFNVXN3WWpqeGJHck9kYkk0aWpGZjJt?=
 =?utf-8?B?S1hTT24yL2NOMURMVTdYb2VuaWZUbUtGSGxxWXY1YXN6SS9jRHNndEFVVjdo?=
 =?utf-8?B?U091a1Z3UUd2dDJFZVpxUldtOW1odFhid3ZZbE5RZnNXVGJxOE9USVpZL1dj?=
 =?utf-8?B?SUphc0FKUkdxcExCU09kVWZoYWduNW13M2x6RFlHK1BVK0lJTnFod0NMcXNz?=
 =?utf-8?B?Z0x3cTZQZk14Mll2bDR0cXc5azBPWjBNc0c4OGN6VE9lZGZCdXFlbnVEM1kw?=
 =?utf-8?B?elNYbGViWHVyZUlxbGxtV2lrbUNabnhscGpCUExQWjhzWTZqRVRZbk83SDcv?=
 =?utf-8?B?UFMxRHZoVE9SU1RGUTl4ajUzNUNXdFROa2IvOFlSWFJPdkVHNVdwYzY3OSt1?=
 =?utf-8?B?VlVtcVdNQVE0dHU0Q0RhVHdvREJHV0FXNjlvenUvS2UxVWlzY3ZFS09XQlJX?=
 =?utf-8?B?NjFJV0JKdWRkT0ZWbmI2bnJvbjZncGJKYVVEblJrZ0tFQnpRTmEwMUZ6SzJw?=
 =?utf-8?B?NUFYZGtnZ0NGYUZFeGEreWZwUUticEZiZk15Z1JWUW4rRzk3anhGblhacm11?=
 =?utf-8?B?RGx5UStxYlJPQ3lKL0RlUVliNUMyczUwaUpzQng4aEVGV3RLbjB6Z1JIOXlu?=
 =?utf-8?B?WTZPZ1hmSGxjZEFwYVpvQkR5VjFVSzlKcDNsUXdGY2xGcUl2Rk1VTTBWOXdW?=
 =?utf-8?B?cXdJWjJ2Rk1MQ0hZOFZBUFZkZng2UnpsV01GTW5TZktzdjBYd2RlVVd1S3dY?=
 =?utf-8?B?ZXBOek81aUJ2VVhBbFlEYWNzRUxlZjZRYTYwamUxY3R1eG9TSHVqV3ZQKzVq?=
 =?utf-8?B?d3ROUTQycjlXQit0b2dwbzNMNS9mUUFwakhCZlhLTG1HbmZVY3pvdGRqYTNK?=
 =?utf-8?B?NDJnUnEyb1BMWUhsd1BveCswbE40QWxuQzUzWjVFQVVVYVJlTE9EcjlOSE92?=
 =?utf-8?B?cElVY09WK2JJRzlQTjhUb0dQOHYvRVlQdHFGVVV1K3lQbU5XalVrcUpJTUxh?=
 =?utf-8?B?cjdibDQrdCtRQ2lRR0gvNWNkRHkyak1kcDhtZk82VlJaRmFyWklOeEdDSmxv?=
 =?utf-8?Q?xHhnDWlQO53IIk5uWmpFQdhX48UlFmic?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?elVEa3RLUWgvWVBGY1pEVDQvcUNSYTBMUC9ZanBwbnY1b3lybUdHemFtR0E5?=
 =?utf-8?B?VWY3RHVQdHBZTzBxMkJZMzlWVTR6amNPczlLWTl1UkZxNFEwQ293YjErMGVt?=
 =?utf-8?B?L1ZWMGNEaFdTZXpHbUR0S2lEN3BZWE44eW5SWGlpSTRWOXNyaXEvVndEWUJ6?=
 =?utf-8?B?a3cvaWFpWForUUtkOGV4WG5UQnpvd0xMVVhHMHVzTndCY2t5QjNHcVMrc3Bj?=
 =?utf-8?B?cXFpSGtUdFNLQWRiWVA5T1J6MjZ4RFUxelJpdUtpWXN6bUovWTlpWFlnMEk5?=
 =?utf-8?B?WFRrZ0tnU2ZQdCtEbXB4ZnFUUWVHQUppTU5aUVp6cm43dk0zdGhsSk1JQkdV?=
 =?utf-8?B?ZHpjeE42dEh3K21GRjJOVkxpUnFHK3R5SWFiWWozNlVlSis2SUtCanovMGJD?=
 =?utf-8?B?MHdaUFRnbGVTTWo5NS9GWWU1eEh4bEZyS1ZwNXdEUW5lazAyb1VrN3cwL0hN?=
 =?utf-8?B?aG80Qm85bmxGbTVEbDdZZVBlWFF3MHh0cm96VFJUTGZUSXp3ZWpVeGtSdGxr?=
 =?utf-8?B?cWhDdlJIdytYcUFobXk4NThuVjdZTnNWWHZpQW05eGVveWYwcllFQWtNZEdt?=
 =?utf-8?B?UllLQkRqelBncFdFcVNRTm5kMG1ZN2FsSjlkVFl5QUMxUTFmVVF0ajRLU2FC?=
 =?utf-8?B?SkY3enROem1HTUdTUlFZbmhsVDhKUE5iSWRXS1lPcm4vcjB1endIWEdvbjFm?=
 =?utf-8?B?ek5zQzkrYnVjaWtsSm51QVlYQlR3RWErKzdzTXQ0bzNnZUVIbjVwSlFpQUxS?=
 =?utf-8?B?Tmcrd2RYOVBZcHU1YTVTNlFZakUvcnZDMmhlVTN3bXVJSWVIZVBGTi82VFhH?=
 =?utf-8?B?T3NRSGVFdTRxL09GcWlwbURRSTdDeHA5VkcweHhDVkVVaEFoNkxPMHhoSjlT?=
 =?utf-8?B?b3RMV1BPalY5d3M1Qmo2SW1QeGRTQ2ZodnhPN3FObVVoQU14RGtlZzVKdjNW?=
 =?utf-8?B?RlllN3FTYzJzWXc0UkVYaC9rWWJEYmcyTW5idzhhTHIyUm5NblAyQ3A1dmxw?=
 =?utf-8?B?WnM0SGlIYzMxZ1VURXZFODdFOWRGRmw5STRBMVlPaGZCMExDR2JJcEJGVmRM?=
 =?utf-8?B?d3hZVmtNNGhpMTFyRUVObHRIMWd1V0F3aEgzVHI4N0pjVzhGcHh5K2FyNWFX?=
 =?utf-8?B?QS9xdHVuTWpESnp6L3NhemN3eGRZVytWSWlaOGVTWGEvVU1ldW9LeTZEbTRD?=
 =?utf-8?B?RGsrTTJtcUMzSm84YTM3eHZ6YnE1blJDY21wNzJtM3ZzL3FvRjg1YmU0Y2Z3?=
 =?utf-8?B?bDdxb1FVQTNTam0vak1UV2pCUFNqbWFBRm1sL25lWmNnZm5GUm42dXJPL25r?=
 =?utf-8?B?SjNIekdRbExlam1EbHJTMnlUKytxdEIrNENoYXpsdTJBenluajFITWFZM0hx?=
 =?utf-8?B?MFRGcFpUZEdPUm1iOU1GK0FMVldaT244d3lTYTFHU25TZTYzVWpRNzVTWlpu?=
 =?utf-8?B?QXc0ZXg5M3pWSkl2TWhENGExMTlJRW1EaFpLaXZuQVFSNEVIU056VWZjaWtp?=
 =?utf-8?B?c1gzbXI1SkM2Ym1kQXIvZHZBMXpDb3VESE94L005cGRIaGpHL2xxTEZNa3Bk?=
 =?utf-8?B?Lys2ZU80cnNtVWxOcEJ4dWVONG5rZ25oeEcwZEMydkJVZU9mYjdBeUdHeGtt?=
 =?utf-8?B?ZTU2NitaaGZranMvNnlGK2tpTmFtRlF1Ly9TNGU0VmJFQkc4RUtuT3BkZDNr?=
 =?utf-8?B?L2plRUMwRUZ0YXhCOXdWQlE4cE5KSDBSVFNNaHU4MW5CUFVZb3gxVXUrQjVD?=
 =?utf-8?B?ZjZ6cG5LVllQOFMySGY2UWtxY2VDMjkycXpqaVF6ZEI2eGM0TDV0R2RodnNo?=
 =?utf-8?B?dzVON0RRbW5zT3dZMjlqWlF0U1V0SVNTYm5IeElUcFlUcytsS1lqVkJsanRE?=
 =?utf-8?B?cWMrOW5KZHliaVJXT0tUdjBKUy9hd0F2a3Jhc2F5QmJTYUZ5aDBUTEJiTERw?=
 =?utf-8?B?S3AzSUNnZkwzQ3pXSU0zWlZ3Mms2RTA0Z1BCbzJHYVNYT1VOcUhwK2trWWtM?=
 =?utf-8?B?RVRHbldWS1ZQWndpUjM2alpXcjRUUFJUVW9mYllQY0x3YXdnWlB4V2NYOHlU?=
 =?utf-8?B?WkV0R3JqKzNSU1oxSy9YRXZSRkpVQXJ3aUxoNGp4aXNqczZVZGpQM2NJMDJK?=
 =?utf-8?B?allwek83T0F2bHROWjErYlcvYndGTVQzNDZFOTZJcC94Ujkxam9hQjFPVUNH?=
 =?utf-8?Q?SOygsNNo3Zq0O19j2HjtoeA=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de8908a-1a0d-43a4-c901-08de3bc66444
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 10:40:40.6116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: //90nN0ngg3MSvEJYKoVPKp+6vCYcfhVHvz4jmRnt1VPQMRLYXrd8dE17INoJ3zwSvp4/egxKDq1REG4iLUDoZ96GGGAFAFo4z+T9wli+PU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 10:40:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227726

Hi Adam,

On 12/15/25 11:20 AM, Adam Duskett via lists.openembedded.org wrote:
>    - Add a BUGTRACKER link
> 
>    - Move SRCREV to below SRC_URI
> 
>    - Use gitsm instead of multiple git entries in the SRC_URI
> 
>    - Remove SRCEV_FORMAT as it is not needed.
> 
>    - Add a tag to the SRC_URI
> 
>    - Add a UPSTREAM_CHECK_GITTAGREGEX field
> 
>    - Use `PTEST_ENABLED 1` instead of `DISTRO_FEATURES ptest`
> 
>    - Change "Submitted" in 0001-Remove-whitespace-in-operator.patch
>      to "Backport" with the appropraite link to the relevant commit hash.
> 
>    - Clean up run-ptest.
> 
>    - Add libtoml11 to maintainers.inc and ptest-packagelist.inc
> 

Usually when you need to have a list of things you have done in a 
commit, it means each item should be its own commit. 
OE-Core/BitBake/Yocto is a bit more relaxed than other projects on that 
rule but I find it a good thing to do in general.

Looks good to me, so:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Small note on UPSTREAM_CHECK_GITTAGREGEX, isn't the default ( 
"(?P<pver>([0-9][\.|_]?)+)" ) sufficient? Regex101 seems to be matching 
4.4.0 out of v4.4.0.

Also if you're changing it from the default, maybe add the v as first 
char since this seems to be the naming scheme for the tags in that repo?

UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"

[...]

> diff --git a/meta/recipes-devtools/libtoml11/files/run-ptest b/meta/recipes-devtools/libtoml11/files/run-ptest
> index 9bc480aa7f..22d6f7e0e1 100755
> --- a/meta/recipes-devtools/libtoml11/files/run-ptest
> +++ b/meta/recipes-devtools/libtoml11/files/run-ptest
> @@ -1,12 +1,13 @@
> -#!/bin/sh
> +#!/usr/bin/env sh
>   
>   cd tests
> -for atest in test_* ; do
> -    rm -rf tests.log
> -    ./${atest} > tests.log 2>&1
> -    if [ $? = 0 ] ; then
> -        echo "PASS: ${atest}"
> +
> +rm -rf tests.log
> +
> +for i in test_* ; do
> +    if ./"${i}" >> tests.log 2>&1; then
> +        echo "PASS: ${i}"
>       else
> -        echo "FAIL: ${atest}"
> +        echo "FAIL: ${i}"

Renaming atest to i incurs unnecessary noise in the diff.

>       fi
>   done
> diff --git a/meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb b/meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
> index 38786b79ed..c3b00511ae 100644
> --- a/meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
> +++ b/meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
> @@ -1,9 +1,10 @@
>   SUMMARY = "TOML for Modern C++"
> -DESCRIPTION = "toml11 is a feature-rich TOML language library for \
> -               C++11/14/17/20."
> -
> +DESCRIPTION = "\
> +    toml11 is a feature-rich TOML language library for \
> +    C++11/14/17/20. \
> +"

I believe this change means we have even more useless whitespaces in the 
description.

Cheers,
Quentin

