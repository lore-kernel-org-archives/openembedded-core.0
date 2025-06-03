Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20656C5AE59
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 19:14:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3770.1748978063062852672
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 12:14:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8249c63dc3=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553AuTRb011365
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Jun 2025 12:14:22 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rscde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 12:14:22 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 553JAWsH010480
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Jun 2025 12:14:21 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rscdd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 12:14:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eFHRnlp/UijVKCrdB52LlI+U8vxMLNHP/D3+ElIWTrSXib4UxCP7o2iUbeWIjvMtxQ9m2+w4YtxJl55kuJodIrleAKtlGUjrIVEUX8Dc+GT+DjqRopEEyB0FVbmfrQOKHVMxHyELZDnGGwqd5ytZnhk4mnqGhZJQakN0HHlOfSZQZIpnJxERKs4PxGMl/YGLT/gYFGQDSE3q3WgCaxBrnuFGOqsH8jJ+XBKj4PiFzAD1C3DTV0rlzqYpIMmKBmckG7IlV6OiY/XYM0fXCavR9V/YsYPMPavrho+EFCY3U3C3R6jHIHaTAuGDulqzKjJZ9YnzGxmyf72qCbk+6PNUlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQCZS5PO9RTKSJLNA0/8yr13vlKVB8TIjxKD8hK0yHY=;
 b=rggLAmfgW7QF33etr1U0auzHWaqswuea80SBAwNXfJmfo67Dm8E/hSsa5GrsN9uREFbcjJgaZkAoYcX2gqiqdBuBL0VV9EjsYUJViL+wwb6xDoxHUGaJTL+sB0IdL/AdpbXCOJdHMgPmr9o+B5REv9twHQ4kvyvPZTxU9uwGdXz545CTbDBo2CWqU3uId+vfvtWB8AB+7xdaxJS461Vn3dO0Ezgcd6+3XLSB8pFEXL3F368fPxTPzW1Mn6mwLMQGva9PBiAV7s5sCVSr4CEy/C6VCryoZpjy22oKCJtZ+o5rqfQzvEd3GgvEz6WrT7IJzB4QbwI21vqbfCdQdLiBBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by MW5PR11MB5882.namprd11.prod.outlook.com (2603:10b6:303:19e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.36; Tue, 3 Jun
 2025 19:14:18 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%5]) with mapi id 15.20.8769.037; Tue, 3 Jun 2025
 19:14:18 +0000
Content-Type: multipart/alternative;
 boundary="------------uCVkUAt2d0XaZkKszEO0QYKF"
Message-ID: <0b4166f9-56b5-45cd-b492-fbd0d0680245@windriver.com>
Date: Tue, 3 Jun 2025 15:14:15 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC] rust: Upgrade 1.85.1->1.86.0
To: Yash Shinde <Yash.Shinde@windriver.com>,
        Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
References: <83e0d268-ec47-4f3a-bf05-2aee4e58e749@windriver.com>
 <CANNYZj-BmEXJVc1rdVPGu5wz87AW1RvbX+WhgicAfEby7kjUhw@mail.gmail.com>
 <47ba1f68-f67b-4c58-b788-63e06fdf4816@windriver.com>
 <CANNYZj-JtVtjk2e+Z=OmVF8RaygO5M1e+6tbQuTZYotbYetQrg@mail.gmail.com>
 <7571c07b-2225-4449-8169-08b044208072@gmail.com>
 <afaa4102-c876-437a-871d-f6f90697d5f4@windriver.com>
 <CANNYZj-Pa_jhraEz7qAHoDXLxfg-7ztH4UhdRPXirw6biZGWEA@mail.gmail.com>
 <36532bcc-c9dd-430a-a932-ec81e9270f19@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <36532bcc-c9dd-430a-a932-ec81e9270f19@windriver.com>
X-ClientProxiedBy: BYAPR05CA0070.namprd05.prod.outlook.com
 (2603:10b6:a03:74::47) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|MW5PR11MB5882:EE_
X-MS-Office365-Filtering-Correlation-Id: f3c8d934-323b-4bd7-f82f-08dda2d2d665
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cktuT0ZsSVU5WFhNOGljRjhrVkh6R2R0R1c3NjFCM2dMOUZkcXU4U2hVYnVa?=
 =?utf-8?B?SmZFZllObVdxbE81aWVSSU5pY3BrZVo4dXBDaHo1aFRZQjBiQlp3M2FteGxR?=
 =?utf-8?B?V2xWTytacFd1bkZvdlIzRUxMZmFaaWhNNDlRZStwZDlyMU5sb3JTZjFaSDdq?=
 =?utf-8?B?TTJqRFZ4MzU3aXl3NHgrQ0ZTZTFIbVZDdjhPQ3AwYk9UT05XT2s4T053cHR5?=
 =?utf-8?B?MzcwWEp3RjdJY3dqOUJ3Rm5xWVhSYlZpVEN4ZC9xLzBLWGpNbTNZRnR4dXVv?=
 =?utf-8?B?bjJRblRibFZDMzRkYU9vblo1YW9KYm5pM1UvRlBHRUtUN1dPRURTTHRqM3hp?=
 =?utf-8?B?Sm9rMzdXZUlJRlIvQmIydDQ3b2d0QWRndXFJSW9FMzEyRWZTS2xMME9LWVhI?=
 =?utf-8?B?Skd4ZFVZYnRVV09taGM5VXFjbitrNzBsUkJFOVJmeDNwMWR2WjRjcm1JUFFa?=
 =?utf-8?B?SnIyY2VVb3FhaEh3OW9XaENtbktaVDVwclJ1c2c3ZnhVUDhkdDEvTXpmRkVJ?=
 =?utf-8?B?ZHdQMHBKZTBVR1hsS3dWUVRrYkJBcGg5REloVUo4a1k2aldpM1N5NkNvVzNo?=
 =?utf-8?B?RWd5YkhTSC93ejcxVlhYRVhYNXI2NXRoTHBuNUZwSlFlM2cyUGNYZE5hQmlw?=
 =?utf-8?B?Um5QdnJ5NFlkSEV1eWhuQU56SC9PcGRkMDcrMEFlaVdtaWJrTjRIeTF1M05l?=
 =?utf-8?B?Y1B2Zm9NdXNXSTk1bVBQMm15UkgweHJPZE0zRzlneVIvcHVXZTE0a0VwcE5C?=
 =?utf-8?B?RWY1bi91a2ZVUHdzWTVySGNPMkw3d3ZXTjc3K3U0VHBhVzBLV2NXVVVLc00r?=
 =?utf-8?B?bnR6TW5EMlUvdmpvOUpCZ3VWZ3lobHpmNlZtOW5LSk00WFZwY2M5RmVXb1Bx?=
 =?utf-8?B?UHJNVVloK3RSRDJVUy8yUzdiN2dObHhFUW1xTFlndUM2NWJFdVZNTi85VjFW?=
 =?utf-8?B?UmYxV0VrMUk5UVRSNEhMbXVhS2l3OG01N3RKK1pBdTM3azV3SCtmdzgwOS82?=
 =?utf-8?B?QlhOeUNWaEcxV002ZDA5WGtxSWVMS2xuNHBRT1N2ZGNKUldjWmpySDZrUkJJ?=
 =?utf-8?B?VElFUnRJVWdtYmxzVUFnRHNobUZrNmMyN1pBVC9Ybi9sdXBhZHc3L0I2WDc3?=
 =?utf-8?B?dXJNdjhYekpXZzhJYjMrMDJRSjRNTGd1K1VkK201TU1DVXpFYkhiUk1Cejln?=
 =?utf-8?B?K0k0b1o4RnE1cjRoME5EVTQ3S2F5VnZFNU9yanc4UkJZTGVrZEFqMkphUlZk?=
 =?utf-8?B?MHd5dDIxcXBCZDdFbFFuNUo4MlQ4aVlsdEhrQStFMkNEdjh0ZFFHTnM0dFcy?=
 =?utf-8?B?YUdlOFAxSHNoNFhkOHdhUXBra1RRTlJiQlF5RC81ejNwYzgwZXExY2RCbFZX?=
 =?utf-8?B?bUlFTkw0QUYzSytOQUFGK1BCdHJGU0JUWmVZZUwrTytleDJPcDZIYzNUbENz?=
 =?utf-8?B?bXByM2g2MWtsVG82b2M2ZE82NE5rdXRjd2lJbjdmYUVEU1kxVVN5b2l6aExx?=
 =?utf-8?B?aWo2ZUNQNEpBSG8wWEZ5cVJXOUxHYzNXWi9iK2svWVVFZlFaVU11UUFZY1JG?=
 =?utf-8?B?NU1RdFg0WWFiNk9VdFc5KzI2NFJLL0xzVnFObGZOYXBrb3RqZU1yN1JqUXRY?=
 =?utf-8?B?cFJaa1ArRUFFYXcxdmdZelNSdVA3ZmFHQktJTUFwT2NNSktGVDFzS0p0ZUs1?=
 =?utf-8?B?dWd2dWNxK08yeFE4MVdQQ1hYdUYza2ZRMWMxSVhmWVAwclA5M3hrV2Z2Rk5x?=
 =?utf-8?B?NEdwSHl2QkVqY0tNRGtmTm8yZi82R3podTNiZU1BOG9URktEdXI0ZHVxNERp?=
 =?utf-8?B?b3BoZE9xd05FdE1lR3F4U2pldlA4alFBRkpqQ2RhcTIvdm42dU5pNEo3Lzl1?=
 =?utf-8?Q?p2YU/Ip9ckIJn?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bThDYmp3ZVg4RTBmQlQ5R2RLMnRQZ2pVaUo4YkllTWFZQ3VwSlQwMjlpRDd5?=
 =?utf-8?B?TE1RRngyTjlnM2xMK29nVVhNSTc0bFBOcGo3d2FQZjloVVg3bkxsUHduMGlO?=
 =?utf-8?B?MEhXT09Wajg3RzBudVZjbnVXeUNMMmhteGpqSmZSOThNazVaS0UvcHVsUWNL?=
 =?utf-8?B?b1M1VGlHVnhtdHJqZ1RpdklmUzE0UHFPTWxxU0dwZmlSMkk4L1NuWkFxZ0tY?=
 =?utf-8?B?VjVBSnQvWS9YUERwWkVsK3JwTy9Ua09ZbDROMGZBREsxT0lFZmZadllvcFFj?=
 =?utf-8?B?YVp2R3RBek9pRGJTaE9tK2ZSOTU0cWZTanN0bjk0TStwWGRvOEtDaDdVaytI?=
 =?utf-8?B?UldxaVBzaC84dENpNmZQNEd4L3p4TzZrQ0d3ZVkxRStBOWcvZTZPZS9iMUpV?=
 =?utf-8?B?VitMUVI0YVN5dzQxSElEOFkzTC9hWWpkdStNdUdENzlLQitxM0lSanRXWmhP?=
 =?utf-8?B?WkpjaTdxNXVveS80QTcySHB3aDVIcUdNTnh2L0Z2MWdqcW1SeEtqclF2Yk1Z?=
 =?utf-8?B?WndFd2I4d1JZUkRjTENzK29qNEVoekRGODB0MzA1SnpMdzNXUW42N3k0a2wx?=
 =?utf-8?B?ZzMrb3lGakV4ZlJnZWw0NnAzbU5UbkVndkc1c2wyVURINHlFSnRsN0VEMFRt?=
 =?utf-8?B?akRrYWp2T0c1aUgwditLbGNLR1QzaXBqMXdLWWdwRzArMnJId1k5d1RNSjFF?=
 =?utf-8?B?eDNMNlRWSW0vTUxLejlsaUZwazV4bWpwNm5UUkovcWJFbGZtdGxFa1d6eGZQ?=
 =?utf-8?B?aFdZbkVITFp3elBRa0tWL2svQTlpd3hObWhCZlVpR2thdnc2WW1JcmtTaVhI?=
 =?utf-8?B?YTUrYnU3VnZnYXdzQ0VsclFiSXo4azVoRHBNK1ZsaEtVSS9mRjdBamZkVzhL?=
 =?utf-8?B?NW9JRkM2aDFEVzA0eTlRZnh4N29MSEhHTnhCVCtXSEk0WE5HcDduRlNubFhU?=
 =?utf-8?B?ZVBKS3JBRU5Ba09rL3I4Z21GUUZHaEtmaUlHa1lOMVJJRzltZm84cU8wMkFi?=
 =?utf-8?B?d2dIOVZoWWN4MVFlOEcxbkRxNjd6cjNmajNZRWFqcFFBdk1yeU5tUWFrYklL?=
 =?utf-8?B?VGh2SjBGYUt4V0NXN3JtZVFtM3d5NFlVUUJtUWRnR2hxNVVnajk2cERnZ1Bo?=
 =?utf-8?B?WlBYSDc0ZlU5U1QyY1Z6K2ZITE9Mc0UreFJSMGpCbGhnT1RZKy9ybS8veHFG?=
 =?utf-8?B?WXgwZ2Yzbnh2SkV3QUUyWVJLY0paN244VFhZMDV4aGdMTHlESFh1aS83cWE1?=
 =?utf-8?B?dDdlVFdDcWUxdHBiZkNUalVTTUdtR0VxYzVlYVBKSmw0VGVxV1BaS29oMzV4?=
 =?utf-8?B?c0tCa2IraVVvRjhRTDJSUEx5Vnh1MXorOGt2d09QaFpYSGNhcWQ0MTJjQVBa?=
 =?utf-8?B?MlQ5eFV3OHlkVDNvR0lLQ3owUkJ2SzVZa2w4UXl4TndQRk9ra1NmZ3pYMStM?=
 =?utf-8?B?WE15VW5tMUVZdm1FZzNYam1QVy9rYlBIZWRUSVc1RHU3QS9hcHR3ZFJ5UUdr?=
 =?utf-8?B?ZWgvS1ViUUx2aHp3NXBRV0M5TEtUN3E3UHBJWkJadFJiSHNjQ1g1RGVJSmZS?=
 =?utf-8?B?TnQycEQ3cHQ3SVZXZ1g5UXJKS1llbXdTV0dXUmlUYlVOSHQxVjVESFB5bERm?=
 =?utf-8?B?QmUyZ0xxOWVSdmU5eXIyczRrVXJ1NmliajI0YlZzaDMwWEUwTlQzZzU2K0Yy?=
 =?utf-8?B?NkJ1SVJaZDNXVGV2c1NFMnpaOHBnekUxNDdadmdzN1lPMjZLRzNkL3lPZVZZ?=
 =?utf-8?B?UUtRVHdhcktMdE5CMjFhalVMTnl0ZkFmVUNBTmxwcFJ5M1JBbHRWWXgySzA3?=
 =?utf-8?B?aWZxZW9zd2FXWS9SNi9xNFN1b0hDeFp0bFJYR0hySmdBcmROcjVmMU1WcHNr?=
 =?utf-8?B?MFJPaHRPOFY3amVkbjh5dWdjWFQwNWdaeWdab2Fjb1ZBTGpndERkczNQUXla?=
 =?utf-8?B?YkNkUFlJVWVRL0ptbU5ldHVzcFltOHp6c2xRTkhZU2VreFJsM1BxUzJmajRG?=
 =?utf-8?B?ZFk4d0FGK09uaVhRdUlxWjZyM0xHR3NJMjFTZTRxRUswR2xDY0JXU0U1VVpk?=
 =?utf-8?B?WnpuQXBocXVlR3dQdEFKaENGUEYxakgwZ2RPQmk3VWJ0VHAvUExjNFdUOFJz?=
 =?utf-8?B?RGk0S2lVOEI3N1JTWnk0UzBLTzdPMjVaRGt1R0FBdU9URE10U012MzFraWRj?=
 =?utf-8?B?VWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c8d934-323b-4bd7-f82f-08dda2d2d665
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 19:14:18.2485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KEcvLcGISgUQ2Y/9L8nI6x0O6MzJjlnpRFe5q6m0m3pm8o/ExOJN3uHGWvtrFpGLMcYie+kb+g33k4PQ5miUP5Xkrm2gurEbRGSCd3D8GFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5882
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDE2NyBTYWx0ZWRfX9CzNoagApapI NuxrtVfC+UgnPVBFhqhzvF2rlz2/EU+g3XK7VnIpZvrLpGleBXTjgoF4h+ySy3eYolmM2dR7e0F ad17NfA3SI4P46sUw1e278ysLMWWDSG1JjJQU9ytZIM2v8xlR797DnVX+oDGyTURBDOQ2aaHNpe
 WG2FwatpgDjsP/K+za+lYTx02bbMV5Qx81ImZjrWrBslZ/1MVXixCe0+Ap2pcUSbGyWNrtE+cE4 o55tHmi385byk+3V2R7U8cK1BMbKmwvYBjkDmvfTtS970CLqbGpSsL+kmg7nB3XzGA2n1YpQC+4 K9RUR4hcmINr37wmqJq+srCuYBU3CoocFMNH6F+OsuXpxlrJp8TD+EB39GcF0Tzz2DoSyzN1MfW
 +WAsISYNVU5WtzKYXg9vL6flOHfNqQkeQ4ytbDp0RuTZPYgevuRIAfhhpHBhSY51J0ONfH+8
X-Authority-Analysis: v=2.4 cv=PvyTbxM3 c=1 sm=1 tr=0 ts=683f498e cx=c_pps a=KB7kLzfingIg7eHt7PrfOA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=iGHA9ds3AAAA:8 a=OQZl7eEfS2bfk_DjHpIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=0lgtpPvCYYIA:10 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=Qy0naWYV1x9khxTI7U4A:9 a=kEh9ScJpB9yDjyyS:21 a=_W_S_7VecoQA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: yU5KBQFIGKwxk7xUFEc7fWmIOVlJ-WaB
X-Proofpoint-ORIG-GUID: Gj44ZVTITD2dKzv0s4iCbDHgaQmr6kGI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_02,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=982 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506030167
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 19:14:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217821

--------------uCVkUAt2d0XaZkKszEO0QYKF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 553AuTRb011365

On 2025-06-02 7:15 a.m., Yash Shinde wrote:
...
> The latest rust v1.86.0 upgrade changes are available at:
>
> https://git.yoctoproject.org/poky-contrib/log/?h=3Dharish/rust_1.86.0_v=
2
>

You have the zsh file in with the main package in:

# Whether or not to optimize the compiler and standard library
@@ -222,6 +228,7 @@ INSANE_SKIP:${PN}:class-native =3D "already-stripped"
FILES:${PN} +=3D "${libdir}/rustlib"
FILES:${PN} +=3D "${libdir}/*.so"
FILES:${PN}-dev =3D ""
+FILES:${PN} +=3D "${datadir}/zsh"

This should be a separate package like:

=E2=9D=AF rg FILE.**zsh
meta/recipes-core/systemd/systemd_257.5.bb
511:FILES:${PN}-zsh-completion =3D "${datadir}/zsh/site-functions"

meta/recipes-kernel/kmod/kmod_34.2.bb
58:FILES:${PN}-zsh-completion =3D "${datadir}/zsh"

...

Thanks,

../Randy

>
>
> Regards,
> Yash
>
>> Alex


--=20
# Randy MacLeod
# Wind River Linux

--------------uCVkUAt2d0XaZkKszEO0QYKF
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 553AuTRb011365

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2025-06-02 7:15 a.m., Yash Shinde
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:36532bcc-c9dd-430a-a932-ec81e92=
70f19@windriver.com">
     =20
    </blockquote>
    ...<br>
    <blockquote type=3D"cite" cite=3D"mid:36532bcc-c9dd-430a-a932-ec81e92=
70f19@windriver.com">The
      latest rust v1.86.0 upgrade changes are available at:
      <p>
        <a class=3D"moz-txt-link-freetext" href=3D"https://git.yoctoproje=
ct.org/poky-contrib/log/?h=3Dharish/rust_1.86.0_v2" moz-do-not-send=3D"tr=
ue">https://git.yoctoproject.org/poky-contrib/log/?h=3Dharish/rust_1.86.0=
_v2</a><br>
      </p>
    </blockquote>
    <p><br>
      You have the zsh file in with the main package in:<br>
    </p>
    <div class=3D"ctx"> # Whether or not to optimize the compiler and
      standard library</div>
    <div class=3D"hunk">@@ -222,6 +228,7 @@ INSANE_SKIP:${PN}:class-nativ=
e
      =3D &quot;already-stripped&quot;</div>
    <div class=3D"ctx"> FILES:${PN} +=3D &quot;${libdir}/rustlib&quot;</d=
iv>
    <div class=3D"ctx"> FILES:${PN} +=3D &quot;${libdir}/*.so&quot;</div>
    <div class=3D"ctx"> FILES:${PN}-dev =3D &quot;&quot;</div>
    <div class=3D"add">+FILES:${PN} +=3D &quot;${datadir}/zsh&quot;</div>
    <div class=3D"add"><br>
    </div>
    <div class=3D"add">This should be a separate package like:</div>
    <div class=3D"add"><br>
    </div>
    <div class=3D"add">=E2=9D=AF rg FILE.**zsh<br>
      meta/recipes-core/systemd/systemd_257.5.bb<br>
      511:FILES:${PN}-zsh-completion =3D &quot;${datadir}/zsh/site-functi=
ons&quot;<br>
      <br>
      meta/recipes-kernel/kmod/kmod_34.2.bb<br>
      58:FILES:${PN}-zsh-completion =3D &quot;${datadir}/zsh&quot;<br>
      <br>
    </div>
    <div class=3D"add">...</div>
    <div class=3D"add"><br>
    </div>
    <div class=3D"add">Thanks,<br>
    </div>
    <div class=3D"add"><br>
    </div>
    <div class=3D"add">../Randy</div>
    <div class=3D"add"><br>
    </div>
    <p></p>
    <blockquote type=3D"cite" cite=3D"mid:36532bcc-c9dd-430a-a932-ec81e92=
70f19@windriver.com">
      <p> <br>
        <br>
        Regards,<br>
        Yash<br>
      </p>
      <blockquote type=3D"cite" cite=3D"mid:CANNYZj-Pa_jhraEz7qAHoDXLxfg-=
7ztH4UhdRPXirw6biZGWEA@mail.gmail.com">
        <pre wrap=3D"" class=3D"moz-quote-pre">Alex
</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------uCVkUAt2d0XaZkKszEO0QYKF--

