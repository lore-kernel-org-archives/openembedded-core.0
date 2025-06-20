Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 235D2C7115A
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 02:46:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1072.1750387611365777555
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 19:46:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82662e19f1=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K0xauC006300
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 19:46:51 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47c80s18jm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 19:46:50 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55K2kotT001632;
	Thu, 19 Jun 2025 19:46:50 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47c80s18jk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jun 2025 19:46:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nd3MobL342T51+i2fjpnssakARxNLZLEVcYuUjlfySsdNyl1y2xee2yYq1Q8qTwNQ7ReLUwO/lCuzzB+t5n79T3GoQ5GNr/mlgjTjFzZW6vJWKUDsnab5YPRjWJwnqRXTYsEP7LsEuMGSRZfClczIQHaeCX9QMwDg9wHSuxA1VPEA4UGMtbm66u3FgOfN+bNFY0qsyBGQmaBIzmWQYkJiYiBRw93Ql2f44a8kr6Iz+H+MconH6I1B28GLZOJEKKhWIcAlKzr328ey4j47jyr5pZw+n15o1UNr6nu5QSVcbdJfcigqDqf0vTFvqcROt4eNfNb0VkbrCf4SS2OGnsJAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+OK1lRggec/TyZEjxt0W3MbbKoKOwRmHoIr5Aaalroo=;
 b=OhpbAvI4+1VRgPJclMinnlEeGKUyJV+cIMqo64RZEC20iOs6FAZOU12Cl2o9Qobgh3jRIzgHAETZUScJdMDBvX7W1sX2HwKTeAOof6mDR4iotwYY60NwumGjuv9/5wZ1D1B5DGhRwhu4TOtuyjzAuVmxmVtJ8dGrqCI0fue4QnxCO7voiNiCzn6HWQvog8burnxWJAHrfDTRSHALlavIsmD0yyq3kTow9EZfQ1hl32IABRCIGRAs1ovjWLbcvMyfbVQLp49wtS45gd9+c6JkfeuDcSca03tByYUjShaGNutS1A9rcBwQCrnINGunDuFrlbn3Tn6y6lvKatVP4WzKWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by SA1PR11MB7085.namprd11.prod.outlook.com (2603:10b6:806:2ba::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Fri, 20 Jun
 2025 02:46:47 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%6]) with mapi id 15.20.8835.018; Fri, 20 Jun 2025
 02:46:47 +0000
Content-Type: multipart/alternative;
 boundary="------------IrlfRZc7OqlPmvykHpXqzc1a"
Message-ID: <43ccd2fd-7861-4966-8931-6a08e8544993@windriver.com>
Date: Fri, 20 Jun 2025 10:46:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] scripts/wic: fix calling wic ls|cp|rm|write
 hung in bitbake task
To: Ross Burton <Ross.Burton@arm.com>,
        "hongxu.jia@eng.windriver.com" <hongxu.jia@eng.windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250616081245.1565935-1-hongxu.jia@windriver.com>
 <A2AB1D35-6090-4E27-A00F-5A69851CCE72@arm.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <A2AB1D35-6090-4E27-A00F-5A69851CCE72@arm.com>
X-ClientProxiedBy: TY4P286CA0021.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::6) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|SA1PR11MB7085:EE_
X-MS-Office365-Filtering-Correlation-Id: a9e7ed63-ecea-4df1-fc49-08ddafa4b2ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dzNsNXYrakt6MVJEVUxZcm5OUExEZnp2aHFkcmZScEs0K3dKL0xVNmhCb2l5?=
 =?utf-8?B?QXFmb3NhVE51c1FtdjV0VXY1aDZqbG9jd2dZSTB6ZUVaRUF2azIxcTN0OFB3?=
 =?utf-8?B?ZTRSSFFIeWJuT0pQcGI4eTB2U3pTWWRxcXpmVGFOdjFFV2dGNEI2Uk94NlA4?=
 =?utf-8?B?OXB0VDdORDJmMEM0M244U2tuSWQwZ0VhZHR4MDlROFlZdmdXcWRkZVVIWGxL?=
 =?utf-8?B?bE1MczNtaHNYMHhqTURSb3dGTVZ2SlViVHBZaHBxeDZyOHBPaSt6L3VxNXI4?=
 =?utf-8?B?OGRIaHhYaEhRcTVrdjBlQTJvQVE4TmlybXYwUW1WR09LNy9ra1RidGZRMmww?=
 =?utf-8?B?NndDTDVQU3cxSmxMdTVQZ0dJNENqNXN4Z0RuUXhJVTNQWmNTZkVlZk9ZSmR3?=
 =?utf-8?B?MFBYaUwwOG5YTFJSVjFNUTVBYjZYMHliOW8wbmo2eEQ0QTRGZ0xpcEVWeUxS?=
 =?utf-8?B?bk1mUG9kVndEVW5lVlgrWHBnZW1OTElJcVNLanNjazN4ZlJBaERNRkM0Z2Jj?=
 =?utf-8?B?cHJNcXRoUG1zc2FpL1RZRUJEZmxNSmJkb2k0OXlNUllmVEJMV0NyVVZDSTRS?=
 =?utf-8?B?RjN3VmJtbEp3cWhhdWVhZ2IwSSs4eUZFREMrYUlKN2hCYVE3S3RQRkZvbGhO?=
 =?utf-8?B?SW1vTDlvdXFrNERXeVlzTnF6TGM1UFRoVHdycXhSSmtNQnlmYlRzWXd1TlZV?=
 =?utf-8?B?UjYxUkJ1SlI3MEJtTUQ4bWdNNVp5UXhzRENhNGdyTWtqbjEvenFpUWFHVDh5?=
 =?utf-8?B?c0hEclRjdTQzTUVGTVFGcUZPZ0V5cWpQK2U0K1ovb1pPMGtpQ1dweWVxdVJT?=
 =?utf-8?B?alZLaFI1M0lnQUJXRmtPT01wdTNxb1ozclYyR0hibldDVDY1ZFpuY0xiU1lT?=
 =?utf-8?B?bThUR01GOEROaG5QQ0E2aEgrSzRSeVRhZzNPUy9TMkY2SlBkc2ZnOGIwTjhW?=
 =?utf-8?B?Z1lWc3hxUGxEZ1MvcThtSHRJbDJkZGJqUGVjZXpHVHpSSWM5akZLS09ITmlt?=
 =?utf-8?B?STByZXhHRVVFZUpEb21Nc1JISXFIQ1Z2RUhmV1Nud0x6WjNpUmN3V2RzdXNh?=
 =?utf-8?B?NitUZlNmZjlsbHhDUzQrNjZHc2wrdXpZUzJBaW9uMDFxMHBnK2NxcmlTU01N?=
 =?utf-8?B?VlBXQlc0WndaZGJrOTNDSHJLZjVNYlNxNkFtbTdoL2FCYlE3SWZoY05QVUtJ?=
 =?utf-8?B?REY1U0dyN1lkMlVFTXh2R2xiWjRIeFg3Tzc2K01xWUVBZkxvR2UwazZ4RWY0?=
 =?utf-8?B?VXVwZmc5VE5temtFNm8rbUhMaU4rbEE4THRHZDlHbG94cVNJT3pZTTh3MUhz?=
 =?utf-8?B?OG9XdG51ZG9xQ0kvUEVFOHZ0QzJyTHE1ZTZ5S3VsbTRFaDQvcnA4alhEbFlh?=
 =?utf-8?B?dUR2bkZWbE51Qnkvb2tvd3d0SXgyNlhKN24yUlZQRllwMUc2VHlKTThMZTlp?=
 =?utf-8?B?UDllRGJoK1l5UlFuOTRKZFNNdi93MXBmaUlzekZhWnFpU2IwOUE5U0ErSmx1?=
 =?utf-8?B?Nm5UVVoxYkJZeXcxeGFCT2dXby9YL2pBc2Z6M256Q1dEWnVmSDhCcU1ZTWZB?=
 =?utf-8?B?ajQ1VWEzV3lnQVptd1BsOWtkb3h3bXJjaVZJSFFBOUVieGdRNGtJWVROaDN2?=
 =?utf-8?B?SmpLdXlUWFd3alhlNUczSmR5bHg5eDFtRnJWZU1YN3hqYlp4M3dweWhOMDdv?=
 =?utf-8?B?MS9HN0ZkU1hUZGh5QUFrcmgzSHdHQ1ZTSHdWVVQ0OEFZemluUWx4djBVVWRW?=
 =?utf-8?B?NG5WMU1mb3NKTG50SEJEUEVlMm9TUUl0dlkyMjNXLzZhYThGemU1VTBtZVhW?=
 =?utf-8?B?b0pxcUVZenBPODhsekRGTE1oYkt1d1k4Smo4dkhkdUpzQ3h5c1ZjNTJTTjZD?=
 =?utf-8?B?RGFuMDlHNTYzWHE1NjhUeFoyR1JJNXFBUnE1MHJKa3EzWTJLRVhwSnpDRXR2?=
 =?utf-8?Q?LPKs58etYB8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MmR0OEtzYStqZ2hpNitMU2psSFlJQmExWnRleUJUd0hNWlRwcEVocVZvb3Bq?=
 =?utf-8?B?TmU0NWlSWElzeWgxejkwcGtzUGNBMzBoTTgxR05NT1ZFRlZFampIWnZkMndk?=
 =?utf-8?B?bW03WldQZlo5QWtNZ05tUnRycm50Ynh0cVl2R0c1WFAxOVBIa0U1Qy91SGN4?=
 =?utf-8?B?N2NQd001VXVqNS9jQmZ3Sis1VFJSRTBzNVFqRnY3aE9BNkxPbjFXTXZBVzNN?=
 =?utf-8?B?OW9wRmswTng1YVFkemdUQWVKSnF0dy9odWthczUvKys3OHRVRTFoL0ZqWkh3?=
 =?utf-8?B?QjBWV2RzNTZsQ1pYREJFTjFkNlFkbFVuT045S3BtY3hvcWdndkh5bUt1a3dk?=
 =?utf-8?B?OEtuTFdBV2kyY0ZIenl0ZklEWUd2YUlCZVhUTlMyaFBOVFlUaEdPTjZlY2NQ?=
 =?utf-8?B?Q1lBVm4rajJQcWdDTkIrTWNEZEpnOFlLS1BSZGRBa3BMQUVkVGtJakw4eGZD?=
 =?utf-8?B?UTduaFhYSENZQ21HWkhRMnpkd0U5RHgxQjZKTjhRSG9TK0M2SzIxRFZYRGpa?=
 =?utf-8?B?NS9sVHl4N2x1YUZzZ01tL3BrZTdWMzJZdEVVeWZvWkUyd1pXMC9zY3BmNStE?=
 =?utf-8?B?R2RCNE5NYU1oNWlwbmMxbE5JY0E1S0NGSEpIL1NaN1hRK0FmZXdZb2JWN1Vy?=
 =?utf-8?B?QlR3Q0dpU0RqMm9qMU5BUm1rTHNQTDNhdHBEY0FpakFzeTl5UHdJU0tqZW9z?=
 =?utf-8?B?Vng0SWtwbENTamFuTERHRTk4TFRlQ0VaTHA3K0lUTjdLSWx4amVTOURQUXA3?=
 =?utf-8?B?ZnpUQWpPaEwzZU9uVnQ4L2NVMjBoT1FwTzJ0a1p4bWlDcTl2d2ZYSEpieHp1?=
 =?utf-8?B?OHgrUEJTVHJRM2RIMXUybjRvZGhRUXZyWU1sVFQ1c0VEVisyVnVBZ2g1S2p6?=
 =?utf-8?B?emlTMytJTjRHSkl5dFBUMVZSanZvZ3pVaVdWZ0FpSHBiY0pJcTZ2R1JiRFNl?=
 =?utf-8?B?MzdtVHB5OXJaU01IcUtIVkh2TVlQQzh4Z0xqUUpaR2J6cFIzMFdJOTh5cG9O?=
 =?utf-8?B?eUUyZzhFeExZSjE2eXJEOGQwODkxdXpWRkVTZUtwSHZ4R0dvOUdtM2xUUTFs?=
 =?utf-8?B?Sm5ReUFzYTlxK1RCdU9VMEhqS2pBVTBOSU1DNis0UmlmZ2dUc3doUUFqTUM3?=
 =?utf-8?B?TVplM2MyeWJhQlZBZ3ZsRytZcEZZbW9qZTcvUlhYb0hYM003cmg5aC9oa05k?=
 =?utf-8?B?ZHg3OTZiUnBHbnRIYU8zODVkQldsNW9xZXVYR2NxYXlJQlg2dXdrVHlodEM5?=
 =?utf-8?B?TUtFcXdSSEROVHlnME1DSkNQZ0ZORlRoa3hmN1hHZno3Y1BmWmcwMk1LSCtQ?=
 =?utf-8?B?TjlrOTFMSHJ0cE43L1ZIOWswNzZWV2RtWjc0REJwOC9KOUdoSmRQNVRSdVhw?=
 =?utf-8?B?Mno2UGhLZFp2SkFkZ0gvREN3c2pHMHNId1ZmYnJyb2t6K2VTUHRFMFBRbVZq?=
 =?utf-8?B?ckF2TG1YQVR6U2JIQ2ZoTjhtajJSTmhrcEtZQ2NZeHdPS2FtNGduLzEya3Nr?=
 =?utf-8?B?SW5BSFhxZlNnSkExVDJFc1loV3IyRkxSUEdjdGp1UGYzVHJRQ0ErSFh0WkNQ?=
 =?utf-8?B?SjVmQ0JPRWFoVkpkK3BRUTFoRko1S2g4L2p5VmFOc2lPd1pxOFRyQk1UTFli?=
 =?utf-8?B?T2gwM2NiYjR4a2FPNk5sN3NTSGJjT05PSXlrdjgvemNqWkcyaFV5ajlUYlR0?=
 =?utf-8?B?QW9NdytDd00raG54d1luUURpYWdFRFJxUW93QkplbEsyY1ByUTlBL2czSkI0?=
 =?utf-8?B?ZmxwQ0Q4NUFBWU1lNWFaQzQ1bmdpZ1R4dlROOTZoY3hIUjJtZXFCaCtUTllj?=
 =?utf-8?B?c3JKTSsxVE5LOXI1bGV3RFZjZU00QlFkYTFxZFZSOVl0enlSSWRWc1dPRG1S?=
 =?utf-8?B?aCtxQUw1VUVFclFoQWF0c0U1d0UxVDN1Rjk1ZDdXV3VQMXNYcUNsSEI5WlI2?=
 =?utf-8?B?dFNqU01ZUFd1SjBPZVMwbWNKNVZjSFBSazdyNEpUQUpQeFFPVk9rTjQvL1dl?=
 =?utf-8?B?UGl5SjJNbW1DcjluZVM2MEtHVUg2Z041RXh4Kzg5SkpVMVNwcm5Wdzk2cVpr?=
 =?utf-8?B?c1ZxRTJZd0dCVG9abHVobW5OWGR3NWZKdUcyaS9TeTVyQk8xVEl2c1FYK2Ro?=
 =?utf-8?B?M0QvRlMrUGJkbGhGazd5eTI3NVVscHE0TDBKeVZ4ekZyMUE3aEZsQVkxMXcw?=
 =?utf-8?B?dVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e7ed63-ecea-4df1-fc49-08ddafa4b2ee
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 02:46:47.0687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H9EEM4CEdrJQZR6VZ6CyZf4ApRb6imF5xv2Aou7tyDsvLylUeeiOTk2oOAmR0lpa7Y51EPtBTt8SU5uJSW6h1BZ6JAW715DuhKLbTquanGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7085
X-Authority-Analysis: v=2.4 cv=edg9f6EH c=1 sm=1 tr=0 ts=6854cb9a cx=c_pps a=Q/Wut8DCZm/BU1iMwo/3iA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=Q4-j1AaZAAAA:8 a=GCvm_fw347_qwXLMs_UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=7CQSdrXTAAAA:8 a=wvPkM9v7g1_ikmSEda4A:9 a=DWhfh2zG0RilNSc1:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDAxOSBTYWx0ZWRfX/0OUTc6Yk0Xf 6IbVJifBilptx3ndsyE07neYrOsTSg1OFAhWugMzGkSAEWTwuKAjkmVq3IQpfNvcxapwfnG2o4c Vt6/ToCaZMDBiQ4rSX41a07QCa8+PVw+XhJp2sXHpgMVuzx9jTYhyaU/sxab/TmL7YcNXmLqBo4
 O/F996FkU8XsJuIj495SW0B4cHNH5doPFoFoIQ5l1LZyrdAl91sHYJLiUf6QiXgWCJfY281RqJb RBI2Qw49p3JoRGwz7rWaxD9MXXF2sbxRwEEkoVeCpeYv2E9SzPG1Dia/EEPSIC5/o8kmWwC6ACJ t9Tehi5gzCkbvK1TEurv5UgkVyDSzNOEvBpIWk/QBNK44VzUoHOI3W7Oha7G0QNzAf3KBAt7aWJ
 LZ5mxN5YOvZzYlBlMWtlgckaojpIv1pMxQc6kScF+xJUTfyrc2ehybVgt6OW5JPEY+Z0v3ur
X-Proofpoint-GUID: NSKcjWGB3X2tlqJJaQdkN20HbwdesCCI
X-Proofpoint-ORIG-GUID: CE6H7zkuB9isisZPb-2jm6X_Ep-px4OY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_01,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506200019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 02:46:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219095

--------------IrlfRZc7OqlPmvykHpXqzc1a
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55K0xauC006300

On 6/19/25 21:30, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On 16 Jun 2025, at 09:12, hongxu via lists.openembedded.org<hongxu.jia=3D=
eng.windriver.com@lists.openembedded.org>  wrote:
>> While calling wic ls/cp/rm/write in bitbake task along with do_image_w=
ic,
>> it hung without return.
>>
>> Due to commit [2255f28b57 wic: add WIC_SECTOR_SIZE variable][1] applie=
d,
>> It calls get_bitbake_var in `wic ls|cp|rm|write' to define sector size.
>> By default, get_bitbake_var starts a `bitbake -e' to get variables whi=
ch
>> triggers nested bitbake in this situation
>>
>> Refer `wic create', adds option --vars and --image-name to support to
>> read bitbake variables from <image>.env files
> Does anything in core replicate this, or is this only a problem in your=
 custom tasks?
>
> The commit message is confusing as this doesn=E2=80=99t fix wic hanging=
 in bitbake tasks, my understanding is that it gives you a way to avoid t=
he deadlock instead.

The hanging was caused by nested bitbake, while calling wic=20
ls/cp/rm/write in bitbake task,

and wic ls/cp/rm/write start a `bitbake -e', there are two bitbake actual=
ly.

The `wic create' use option --vars and --image-name to read bitbake=20
variables from <image>.env files

other than start a `bitbake -e' to avoid nested bitbake in this=20
situation, this commit just refer what `wic create' did

//Hongxu


> Ross


--------------IrlfRZc7OqlPmvykHpXqzc1a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55K0xauC006300

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 6/19/25 21:30, Ross Burton wrote:<b=
r>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:A2AB1D35-6090-4E27-A00F-5A69851=
CCE72@arm.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On 16 Jun 2025, at 09:12, hongxu via lists.openembedded.org <a class=3D"m=
oz-txt-link-rfc2396E" href=3D"mailto:hongxu.jia=3Deng.windriver.com@lists=
.openembedded.org">&lt;hongxu.jia=3Deng.windriver.com@lists.openembedded.=
org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
While calling wic ls/cp/rm/write in bitbake task along with do_image_wic,
it hung without return.

Due to commit [2255f28b57 wic: add WIC_SECTOR_SIZE variable][1] applied,
It calls get_bitbake_var in `wic ls|cp|rm|write' to define sector size.
By default, get_bitbake_var starts a `bitbake -e' to get variables which
triggers nested bitbake in this situation

Refer `wic create', adds option --vars and --image-name to support to
read bitbake variables from &lt;image&gt;.env files
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Does anything in core replicate this, or is this only a problem in your c=
ustom tasks?

The commit message is confusing as this doesn=E2=80=99t fix wic hanging i=
n bitbake tasks, my understanding is that it gives you a way to avoid the=
 deadlock instead.
</pre>
    </blockquote>
    <p>The hanging was caused by nested bitbake, while calling&nbsp; <spa=
n style=3D"white-space: pre-wrap">wic ls/cp/rm/write in bitbake task,</sp=
an></p>
    <p><span style=3D"white-space: pre-wrap">and wic </span><span style=3D=
"white-space: pre-wrap">ls/cp/rm/write start a `bitbake -e', there are tw=
o bitbake actually.</span></p>
    <p><span style=3D"white-space: pre-wrap">The `wic create' use </span>=
<span style=3D"white-space: pre-wrap">option --vars and --image-name to <=
/span><span style=3D"white-space: pre-wrap">read bitbake variables from &=
lt;image&gt;.env files</span></p>
    <p><span style=3D"white-space: pre-wrap">other than start a `bitbake =
-e' to avoid nested bitbake in this situation, this commit just refer wha=
t </span><span style=3D"white-space: pre-wrap">`wic create'  did</span></=
p>
    <p><span style=3D"white-space: pre-wrap">//Hongxu
</span></p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:A2AB1D35-6090-4E27-A00F-5A69851=
CCE72@arm.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
Ross
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------IrlfRZc7OqlPmvykHpXqzc1a--

