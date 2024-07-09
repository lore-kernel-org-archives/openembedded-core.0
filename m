Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA78FC2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 12:24:59 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.103])
 by mx.groups.io with SMTP id smtpd.web10.11756.1720527890084720929
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 05:24:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=D3ixdMgj;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.249.103, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N+mmHWNxvFRl9aiFM+Bkox271w/nR4ViPBceX7TCFvrr++HXuV7z3kP+Yp3U7QmozR5LVBRjzfIKoCMQ7dNNG1VqYs2WBuVAR8ZefZeFFpvt2QizFRGdUB9CM2B2XuNmoRsW6TEh75QKr8dVFoU+WLWmc53/f1Zp7k6ON74DdAzsnIGJsY0+UuwNbb1TLbf3GtZk3eOX4iYduIaiacd+FBS20btQoDNNA9PVpACKDwcgjHl4jaHYw1NadQIJ35GCb1XSHg1Y6DXb38x03PuOBPwP7Ny+IEKlIl2AsfRhzkzFiURE5LcZopPDkk+OEoaItn64VSYqjg/8JsQDRLrDlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J4BE47uHKtdlceYS6/CaG9CajRUasxJeXzqSwiCxvic=;
 b=FnEs3zXJB0k3Y08rbiKJhWBT97npgjDsMbZGr/ECH0TQONwWQdku3UBZhw1uQhxH1vz4ux5qxS6tZJegUQRr2vlLkR5BHTyVmbEp36bFocSUvsKEuZc1rI288KQc7O1Jqd3SKkqA3RSQpvSrLyWDPL8L51hPSWd/XCkWeFuuIu0DiW06C6P3Z0u05UsIzQ6UTRQJ8X+G+nc1kOU/W9Sq4GPAo0svxGGrOg7/Nf4E+/jqF30a/kLBXJsbaezZ2oNLgjTyeq7exF+I/rZ9V5guAODYEDpf2Jwp884O4TAmIikxtGRcB51KUaNqaV842GxXES7MI0pYOJ1iuBq3m0UHeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J4BE47uHKtdlceYS6/CaG9CajRUasxJeXzqSwiCxvic=;
 b=D3ixdMgjvrFGqjBBGizVc5CqnT09WM/KNnLj8lMeyfp4xQJNOTAR3f2jXnRZD/wIccjlf41j8efNfhqkVdAuCqbj1rBlXYFSft7lrMAslKhF4WERqBnx6aRjluaG4I48dmSe/iVKoL5XJ8g3CDA63NTuzoMlaEmPQrJlp9nEhASIF2qzekElVhASSXyf2/ff0o/pJZ2VMFxHKWmHQQny5JheFXk8ik9maBpcNO4srP+FLES0zxI6p0/euUwB+SihroKz3fXqFxPIv4FLKHrXGFI2SrjahSHICdxLw7VtjDjjHcKfc/SY/O7zhJyZkTFxZLPPWjAY4WB1n64NZE6PgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DB8PR06MB6570.eurprd06.prod.outlook.com (2603:10a6:10:128::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Tue, 9 Jul
 2024 12:24:47 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 12:24:47 +0000
Message-ID: <c0e710f5-e9a8-4b4a-a6ca-188fceb7f6bd@vaisala.com>
Date: Tue, 9 Jul 2024 15:23:31 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] systemd: Mitigate /var/tmp type mismatch
 issue
To: ChenQi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
References: <20240704071519.566147-1-niko.mauno@vaisala.com>
 <47137b74-b746-7ca2-e4ba-13edce044239@windriver.com>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <47137b74-b746-7ca2-e4ba-13edce044239@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVX0EPF00011B50.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:8:0:a) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DB8PR06MB6570:EE_
X-MS-Office365-Filtering-Correlation-Id: a22756d1-3ac1-4866-2178-08dca0121f04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dTRmNWw3bWRsUWQzeWJCSzZ2bHZVZ2swOUJtTkxWTk10dUQ0T001ZEF6VGxk?=
 =?utf-8?B?WVFBUHJ3bWh2cHpSM2JJcGFIZk9heWprdTVsN0d3MG01WWluV1BpU1R0N1Jl?=
 =?utf-8?B?eGs5WjJNRlQ2RHRXUHJTeGlBMEY3NGN1SXhNNEJYZ0xMWVdOUm8rNkdtUS9j?=
 =?utf-8?B?OVk2UVdHbnh0OXl1K0h5bFNGK1F3Z256K3RZcCtIRTN4QWVJRjBXZWdkRUkz?=
 =?utf-8?B?cDZ0Y0ZDL1MrSjc3RzlCUjNBa0xObnErWWZTa0xjaHU0aWdLRGhxdklwNml6?=
 =?utf-8?B?Mkg4SjhNaXVrNFpmcThobE54U1BDNDVqVzZLNVlaY3hmeERMSWkwV0JrekFw?=
 =?utf-8?B?V1JqSjZRSXE5S1VHUUh6WXBqdlBITTB1VzRIQms3OHhPUFJtMWsrRjdmR05N?=
 =?utf-8?B?WG13WkFFVDNyVGY5Q0ViUmhmWjFScmswK01CZ0Y1VWRiYjIxWmVxTGVVMDZw?=
 =?utf-8?B?N2FrY21ETTNzeVg3K2xLVlhnaTJhZUptWXNIeXFHS1pZYjJtNy9EMFhjdmdD?=
 =?utf-8?B?M1V0MU5qa3FYbW91U1FtSFZlQzRFTEJEQVJTazhCNU1yL2hGYTc0RTc3Nlg4?=
 =?utf-8?B?eFlnclVTbnJacTJkN0hpMkVYN0VpT241aHNoaVlQb3ZoZU15Sjl3R2EwMjRF?=
 =?utf-8?B?Y2p6MmVya3B0TmVRRTNycklXdkRxazdxeXgyeHRpNk9tbkRQSlpHMHlZVjYr?=
 =?utf-8?B?ZTRvR2hUeDNOQ2xmaTNaNGo2M2p2VUx6ditNU2FuMU9DeHhHdldTbGtBRm1E?=
 =?utf-8?B?OC9VZ3UrNGJ2VElzbzlQa0RHYUVRWXVyeFZ1NDlWM2l2Yy84MHkrb1FSTzg2?=
 =?utf-8?B?Z2s0S3NvYUl0ZkRnWGNWSy9EU0VkSkQwRzJoRFR6QUZlM3Nmemhqcm1MYVBa?=
 =?utf-8?B?V2F0eDFrSzhLZ3lqcG9nc1ZldllpYllPMlFVQk12L1k5ZEZvaHM0ZVVWTlU0?=
 =?utf-8?B?bTUrLy9LeDVBVCtVL3RuYUU3UVVOUmtDVy83dlRETjI1NDZTZXNqb2NEVmFV?=
 =?utf-8?B?ZFNzRFF2clF2R3ZJeDd4OW1PbGloWHVTbG1wSXBJRW82cXF5N0o0THB1aEE4?=
 =?utf-8?B?am5TVStBMkFRQi8xTXpzMmkwYnJCZ1VEMU54YUtlL0t4bGY3N2tlMDVzQVJ4?=
 =?utf-8?B?ZTFBRm85U1lXbXEveWszM3FGbWZjejMvajM3TEVQSUl1Kzc0cDVjSkhuRktJ?=
 =?utf-8?B?dDZDNW5SVVRFUi8ycHFUUEZia2tTYmZoWDU5MUlieW9TbHdtUHd0ZUl6V1B2?=
 =?utf-8?B?Y2tXWGh3a2h0RzIza1h0ZXFMOFFCMlI4NFFwMjVrcm8yTUFsY0N2OXI2OWhs?=
 =?utf-8?B?NGlwdVdXT3FwUkZyT2s3b0NLVXFPVzhnbmpWSWlyamJkU0lrMnJGWmUvaGh6?=
 =?utf-8?B?V3lKWWpjaG5DNVV5Zm9CTGhuL0cvblZXbnRwa3h2VEdZSWxqOHlRNzVOUElY?=
 =?utf-8?B?NldFbVhadE4vS2NiTU81MElPQTN2UUZkV0VONVZkeGt6eVlacStpRHIrcjV5?=
 =?utf-8?B?Y1hnNnpHdkZETklQWUxsc3VOSzc0ZGdPTWdSYVNpNXNzdDA2a3dFVUVwdk9R?=
 =?utf-8?B?K2lvMEZsRkxNeHRQZUpod2dIejJrbGJXR1RGYUVrOFVKMFU4R2hPaVBzVzBx?=
 =?utf-8?B?R3k5a01ERjVScktCK1pNU0VrYm5RNjd6eXh0NDhpZlVtQ1M2Sm9jaWJCUDlw?=
 =?utf-8?B?UDhOK0lFekNEQTZ6T1hnVk5HU1JWOTFubjFjTmlEMWNFZVJIZExvZVRJTith?=
 =?utf-8?B?SWhXRURob3kyQ1FJNzF5dGpxV1laaUZDaENyeW9HK1YyWlNNbUJoOGJteDV0?=
 =?utf-8?B?UmlnR3dwYWw4MVpRRWZ2QT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WWxmYnhnc0dqc3NFR1h6cWxOS0VHdVloUzFUa1dMT1dsayttNndVUlU3UjY1?=
 =?utf-8?B?a082d0FWSk0zdGkwbVE0UlBqVVlnbWFQRjdrTXBRQWV5aUtHa1liakxiSVA4?=
 =?utf-8?B?ZCtLcnBSNTB3dGUrcE1xN1hwUWdLWnlqVnhQekRnNU5XWEtSUm5iRGlvVTBG?=
 =?utf-8?B?WGliUy90RlBqQ1pTdjM2N0FQMW5xRG5lV3l6YUhrSFdyZXFoVFQvMzJ4Yitz?=
 =?utf-8?B?MjhRZThnbGlnOHNiK1p6dlcyemZLRTdYdXFOdW5oVm9INTMzejFOTDl4Mnk3?=
 =?utf-8?B?NVFkMFFocThDcTlRcWxkQVB5ZG1GVkxnSXlOeTlEcjZKOUluUklsL3NnYUl5?=
 =?utf-8?B?YXBMYUlIVEZ1THBtUXh2a0ZQQWNTaDZvL0ZUaEtjSWZOK0cwOVBJT2ZyWk4w?=
 =?utf-8?B?RWJCT0E0SXJYenZTbEdTNUFaaFMzL0N4aU5heTlYaWZYVWMvbTg4TjE2MElK?=
 =?utf-8?B?a1F4YjhvYXhGVmNrQ2MxWGQyRmdLbUZVa1FoRGNJRGk2QmZGQklrSTQwQm9s?=
 =?utf-8?B?TldkL3ZXRDZoWXB1WkhqQlhiczhLMHdhU3VWZ0FQSTNadVVEZTBTWTVJVm84?=
 =?utf-8?B?WjlyaW9raDQ1UHk4Wm1rbC9KbGN3ZGRoQUh0RjRmeURwcjduaHFYeHB2MXJs?=
 =?utf-8?B?QjNBTmxVOWxCckxOT3RwSHBlbVBZZi81UXRiRlNVUjg1c1NWdlh1b0NZZ1B3?=
 =?utf-8?B?YnhEb2Vtdk1ReTdoait2bVJGMTU1d0RWQnY1Y0Z6SHliNGhrZUxEUlZibU0v?=
 =?utf-8?B?enJ6RmZQcUtQc2EvcFRWM3JoNWRsWXNBTllzcUFVZzNCWXZwYzRCaEpKb0pL?=
 =?utf-8?B?dUhsNVBkdFN2UzdPNGZYSGhhaExuejZqam4rV1Y3QjNudEhoWVhLRXorbS9z?=
 =?utf-8?B?Vk80NXRBeVl1emlkMCtBQTVhdUF3bnFvYUQ5MWdFbFVGZHZlWittY0FuOHJV?=
 =?utf-8?B?WU9NN1RFZ0FHMk1qWmN0WG1VL2V1b2wvTUVTZWQ0eFJoRmFWNUFIWEZYS0JE?=
 =?utf-8?B?eURjNTNNNWMvL1RTcDhTK3lXNmxRdEZUa05SeXBGZGx2bmFKMUZZVG1VdlVP?=
 =?utf-8?B?ZzBjL0VGZ0ZVcFZBNnVvRFhmZFZiK0dPT3hVc0hzZlAvN2hDejhqNzVraHhD?=
 =?utf-8?B?QTRmYXBtWGpoVlg3c2NLcm1TRkNlOWU0RVhobHQ5RnZuRnZnVmhsYnFiSWZR?=
 =?utf-8?B?MzA3K0g4TVF3bXh0cmNEVXlPZGN3ZTFvYjZ4NUZ0M0dZWkNnRU14QjR6aXRB?=
 =?utf-8?B?YTFIS3hlMnppVFEzQXNvQTVjbVFCZ0s0V1BlUGlNMkExNnR6TnZPNkY1NjBs?=
 =?utf-8?B?ZEJKNjk3THd3a3p6eUNROXRnVmpUM1h0NTdJQk13eU9PeTUySXJ3T3VrTmZ0?=
 =?utf-8?B?KzdaZHR4cUVONGVDbnhLUy9yN0dKUDdmZjM0VzRGbWcxNXhWcG1PaUtKTS8r?=
 =?utf-8?B?Z3F4aFk2Zm0yclpmWnNORFJBNlNYQkxFNkNWT2hZOS95Tk52Z2FLNUNHSU5C?=
 =?utf-8?B?ajNaWWNpanNtRTVYMVd5R25nVEZDTlNheXZSYXBTSnZYZVBMNEw1VUNTazRK?=
 =?utf-8?B?cmJkb0V0cGRWK0E1VzJndVBxd0wxa1ZPbHlLOFRFQ2MrYVNWTmZnc2R1S0VD?=
 =?utf-8?B?cjNsS3FnYVgvQ1pjZWlIbWZhQmc4T0NRVDQ5UUpkaWpNUXh2cUVPeDlrbFk2?=
 =?utf-8?B?Vk05bzFpcGxPdXNpL3lBSTNaVFQ1VzlnR1pWTk9iSEpGeFkyYXJNV0dTVjZy?=
 =?utf-8?B?Z2dPV3ZUUGk2cThETld1ZUJtd3FDWWJ1SDZsTURkbjBLdkNhbnNuVWlsaUYz?=
 =?utf-8?B?NFZXZk4yV0JVQ2oyNzczZVJpY01RbFZDcHNyYzg5Q05CSUphVEh5SG5lakJx?=
 =?utf-8?B?OTdneGc1UXFjKzh1MGcrVFhrNjQrNnlobjJ4Y1Zvb3l1NnRXM01hUjVLTWgx?=
 =?utf-8?B?aFd0M0tTU3I1SFc4a3pQQ2hnZkZoaytOSXRRdU1IYkxEVlFsdzFuajNhdWVP?=
 =?utf-8?B?K1ZPMUl6WjJaaExaelFIUnFSa2dpV09XbFFVQjdmdldUNTBGTTFqdjh6bGVC?=
 =?utf-8?B?VVZ2YklwRlZUd0tLWWZZckplN2p1bzF5WW12aEVCeEgrK2p1Q2Nyb1BkOUp4?=
 =?utf-8?Q?xN9FmlZQChXOkSa4elnZZI8sJ?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a22756d1-3ac1-4866-2178-08dca0121f04
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 12:24:47.1381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xzBsIQ8/KtUeCbYd82+qplNZqQkGwu9Ui5Q/WiZzUJh3rUbVyVXE6KMMalYFGJf3aCuAj2UKypeTy2oPjDjysw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR06MB6570
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 12:24:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201657



On 7/4/24 10:49, ChenQi wrote:
> There's a pending patch from Changqing, which also handles /var/tmp.
> The title is: [OE-core] [PATCH] VOLATILE_TMP_DIR: Extend to specify the
> persistence of /var/tmp
> 
> I think we'd better handle that patch first because you may need to
> change to the way you used in your second patch to handle this /var/tmp
> link.
> 
> Regards,
> Qi

Thanks for pointing this out.

While waiting to see what will be the outcome of the aforementioned 
/var/tmp change, I have resubmitted my /var/log specific patch as v2, as 
these two patches are independent of each other.
-Niko

