Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD85CD4F54
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:55:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17028.1779875710656688852
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 02:55:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=OPAjp70C;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96079a5f83=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8ndF52633662
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 09:55:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=Qk9kxskiPHYoHHTyd7J1iT
	jCoGMTHTS4OlTlcr0LHpA=; b=OPAjp70CKSiW5S5tWB9zPpZihZAn82/bXu8ymu
	eAJz61DF2gwDbYpBoWpwihIckmBS5t4WUqDbd/SodbqogJ8RRuR+gvbRWo7GBwNT
	HoMczYpVtCdTQPAmTYGBcqn8X/IyML/au+2sWSMyeLJkHXQLAfle0h7M9a5+Cmpj
	DNqCrzrcQnSLCp2o5UmGRvDba7IyQjhRO3Cx5wmhRSMC2xytTwIZm4m1evgyezVG
	tWqui+Y7hWMWgy1m42Y4Qn09IygEljgxfY8QsO3i21AdmASNOz1baHfSFQkry0hJ
	FB86/GzqEScrxPl8jlonjrIKt/dVDCHTDFbZzbDaV6mr2d0A==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011049.outbound.protection.outlook.com [52.101.52.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eb376dmem-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 27 May 2026 09:55:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZItPXsGBGAsgYLHn/preVr1BrBQLqM55p8P1Op/SAnugtXNTpKFqIc6jnzRPuktDgtn1hollfpUmwtEILNqmdAtCe7wm1h6VJlJKxZLTqnMPAZDVl1uSvAHE7HUoCdU936lgFw+bi4JbainV2DDbrF0TPKJDBiklZggqNYD7BpMPunLbczUf4bp3P5gQigDDwhTSHOFXZWGpyudgtaNcEWvFzPlvMhTKdD3pX1Rymus3ZNuNvlXEe6xYAEd7QzpGs2Z21j3TZWm7jkPjt49N54yH+S4I/JsqQtCBzgTjwnq3i57oKGIxSaaRH8RgTnOitxrsF3Xmh+GblT4Eaqw+tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qk9kxskiPHYoHHTyd7J1iTjCoGMTHTS4OlTlcr0LHpA=;
 b=aEBSKDYFzUeIJyr1mpUc2Sw3iDGopkaPU1XHHVGxagpboOkpqxNNJceWB3oL5HmJu5PLBKEUpxrELhXpLk6FKx9q7wDZoTPAGUCz11FytMOOkDUXYdUfPJ++c+3YdBNXeTxFkekrnVcsuhCGjL3PyEHTNpiy6TZxTIwHMcd+mMtp2u8a/I2cYpHjOp7uM53jW+UScaL2xIr5LBwO6LxUgUw/4AylaeqvIVgxl331eR14rc7BB1B/lQt92cPOD7GXv+1Rjb0F0FeViJjQgUgwB7FMADgGbl43d+4admRzoukeNJtw7bwl4PE7o3CPPRyttEzucUJ3W/WB5A1a1+uo1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 IA4PR11MB9153.namprd11.prod.outlook.com (2603:10b6:208:56c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 09:55:05 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 09:55:05 +0000
Content-Type: multipart/alternative;
 boundary="------------vZSRNn0wDsxh9vgP0z6pfu4f"
Message-ID: <188a9de4-0dc6-4513-b3c3-5b14b9cce262@windriver.com>
Date: Wed, 27 May 2026 15:24:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 11/12] libc-test: add libatomic-staticdev to
 ptest RDEPENDS
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com,
        Randy.MacLeod@windriver.com
References: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com>
 <20260519072534.24588-12-Hemanth.KumarMD@windriver.com>
 <CAMKF1spE4vkhsNNiG+bM5Ro8XCgZpgNDDYNv-=hzFfqC0LGJUg@mail.gmail.com>
Content-Language: en-US
From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
In-Reply-To: <CAMKF1spE4vkhsNNiG+bM5Ro8XCgZpgNDDYNv-=hzFfqC0LGJUg@mail.gmail.com>
X-ClientProxiedBy: MA5PR01CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::12) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|IA4PR11MB9153:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cd26dd3-ab7c-46a6-e46a-08debbd60726
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|8096899003|13003099007|22082099003|18002099003|4133799003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	/qRTngX2foerTa9fR0Q9xfHPkDfgphmkMSVsoPSWYtWOh/lr86PZeKkR9MwEoiOiXg538kNuW/Y3aAHZ8EItZSVoIWtaxf45L6IZI2LsgrMKBSyTf0bpKUhbaf04HDrIM3dcjfTL8r/ZkavyBiiaVD7qhq067biBPIHyv0KWS99nYnUbCV4gGAZ2peRswSPJJXOSOFComZz8F5j2NP8YSay8QNTtChrhMW7p3FeOhIObxzgP4plfYqAnOPdHQmb4FlJj67Ktf82jS0Mmy2GlEtgK1ZAYL03GSHtedtQ7P5C2gBeXnTKc32MkPqg9qCRPUyOY7vx9k6TJow8Ac+JihDkTu5BifFRl5p5lXnj+gSEdWmFzdxk8wKVGtEtOCo7g7ARBkk6JYN4H8VPmsVkRF1urS2bhOG5FE2Hd28TPqjPD0qtEo+hy6jzdG8SqkCKQQwjS/UThaqUZKfnRH2ZfaTFWHkokWEFqJrvOu6ONJ3wKgxCy7QjQpENkikSNazeklhjKqXuTCvJdzzJ/rDm1DZt/ueT9tnUSDHuAWt1EvYTQPDMnmW0imTkKGgFN5wTsf5hH3I5bCNMhXE5l1AkEJncSxA13Rb8oRyD3oEUms7PChYfQfTOWtGEnnASrd2CUv7IMA4psiGbjfu6vVOEKvA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(8096899003)(13003099007)(22082099003)(18002099003)(4133799003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VTk2bzBuakpoWkQ5QVVUSjdlSHpPTldOaS9BNTJGTHJLaEh3WTFpSTRmV1dp?=
 =?utf-8?B?a3FWN2c2aHRqYVJKL3B2L3UwT1l4Ui9jK1FzY0NqRDBYQUg3YXpIZjJYYUt5?=
 =?utf-8?B?eFAxc3hHS2Qvc3VUOWNFV3c1Qm9MelhxekVaV1F6c0hjU05ncVJnZEI4ZExk?=
 =?utf-8?B?VlpDK3RGVVlZZFFQMkZIZmo1azRXMTlJSzY3djN3R2NLSThxUHhvNlhxQmtz?=
 =?utf-8?B?bk1HeEdyV1JPTTNKUlBUNlhRNFVWbUk0a0gyZDJiZzVWc1NNZjBVb1loVTBw?=
 =?utf-8?B?QmN6Q0phamxVTnB1NU45bXQwVTdEN251TjZJVFhuREsyZlBLUEpOaFlHRE1p?=
 =?utf-8?B?Uk45TkFmV011T1hEUFZaNk0wTWR2aURxdXplR1UrZXQ5dXdkTm9MZkJIRWJE?=
 =?utf-8?B?U3NaMjlNc1BJTjE4bVJ2aFRIVS9ocFhoVlNJY1RyZHhCMVVGN2NZcFdUWkU4?=
 =?utf-8?B?OWJzZ1ZVWWhqbFpmalRjQWRKY0VpWExjM2w0YTF0R0xiZjIvcENackljaEY1?=
 =?utf-8?B?QWNocTE2RjBWKzlUVnhuYmZFMktKR1VRMTVGd1FxSXhvOG4rZlRjYVpSK2M3?=
 =?utf-8?B?dVRITno2cncwV2RIMTVvS1N0S0xSYnVhdWdFVFdlT3ZYWWtKNWl4Qk84bW14?=
 =?utf-8?B?a0NObVh1SHhReDNUa3BzcXN5V2NIZ1BoL0RFZm5lTTEzV0R6RW5IL09lbFdi?=
 =?utf-8?B?YnZpNTNrZm9hS1dWbU91cWJNSDFtdHA2TW50VHhkcTU4MGowS0I5RmZhSlBH?=
 =?utf-8?B?ZDNucjVOVktJR1B6WVJlK1BmNlp2cXEzODFmOVdRdXNESWlHQ0tIaGVMZERF?=
 =?utf-8?B?QjJWQ2RJVkorSWlXVXNPYy80QWhzajhZd2NGWCtTK0Z1QUpXMzBlRC9maFBY?=
 =?utf-8?B?ajdLSkVWNnJCR3RLRWxYS21YR0pCd0Q0ZWx4MGxYM2diTkZ0MUk1UFdiaDhV?=
 =?utf-8?B?TVF1d1FzTmtEMFN5MlppT0NUMXpSa21BZVFLeWRVODExMEhEaWd6L0tyTXhJ?=
 =?utf-8?B?SndPb2tUam05ekdUWGFRY1p2NEJRM1AvbW4veVNzcWdicTI4ZW5vbHlLSDN6?=
 =?utf-8?B?b3dmTG1BN0d0U01jTGNNbGZCVjh1dmxtZmQ1RlNMaWV0U1VGODlYcFhycUVR?=
 =?utf-8?B?VHhQSEF4dFlsUHRnTERJdDJidmFGUHQyMHl5Z1lGV3c0MjBJeUdCT2lYa3NI?=
 =?utf-8?B?d3lib05kZ3FZWm95T3p5SmlwSWZETWNCemgxUFYyYWRnTlRLMlJzR3hCVE03?=
 =?utf-8?B?enpGcStnN3ZiQmhwcFZQdCtTdUlMNlpaL3BnejFLZjllVkRNaGhnbUJNdnZw?=
 =?utf-8?B?cFE0eThvdEFOUENtR2NEQzZVSm8yNDB0OS9WWlZnR0E1RDhUQjVSckwwRFJO?=
 =?utf-8?B?QnUrWnJUTXJtLzV0dFMyU25zY3dIbTZHQlUzVFNHRGhyVGlPMk5YMTBLMWhR?=
 =?utf-8?B?anhZNmJEZnQ1WGxpT0xReVBRcGZodU1CcDhrSU5wanR3c2lsU29CYXVIOFRv?=
 =?utf-8?B?YTZncHBzSFpEekdPWjBvTjc2cXo1bHdvNTA3dUwyZjN5U1dPdzRPUTU5RThF?=
 =?utf-8?B?SjlFOUJrRThENi9lWHpyQ0UzYkR3VVNDd1A0S1RWanRQSENIcTZqNjVyb1BW?=
 =?utf-8?B?cTVVSDFQZjZ1SmFWUUpNSkNYV1hodVVCY25jK1huallpWUd4Mno5TTNYTXRQ?=
 =?utf-8?B?WTgzQWduUTl2VzFJc2tvZWxQbWlhTGdkUy96dHl1R3YxRitRWHV3T1U0VUtl?=
 =?utf-8?B?YVZjbFV3OFR5bzZic1hrUFJ1ZjBCcUVMQ0Y5WW0wTzM2RzQ0TDRzWDJIUXZR?=
 =?utf-8?B?MzZISlozVzlxOXJvbE9TZ1FKdE91MmgrbDRlYWREczRxZzFocExGNll0V0kz?=
 =?utf-8?B?Z3NZU2oxeXVHbjdGZDF3UVBBSkZkd2JkREVieTJDQ2FMTU04T0xqNzZGRHZh?=
 =?utf-8?B?NXdRcnpKcDlheXZLYkZhY21ZOGR0OHdZaVJUZVU5NHh0Q1Qwd0w3UU5DVXd1?=
 =?utf-8?B?SkZNWnZjTUFzM0NubEVGVWlBV21hS1pLSGs5aWNQVHlEYXJ0UjEwZ2ViVllw?=
 =?utf-8?B?bEpsdUM2T1ZyengzOXVReVBjV1JFQ2tndFVVRFd1cHJPOExtN2dKQnNvblZT?=
 =?utf-8?B?Y1c0M3N2a0srOGZGVjVHQlV5UHhMRmV3NmdRamloc2xHU1R1dlNBU3hWTUhs?=
 =?utf-8?B?Mi84UmQyc1RLNy8wREV0cEtHRjNreVRlRmJXbmxnaFZkeThydnhXL0E3MWNk?=
 =?utf-8?B?d2FLV0pjZ2piUGlpb1ZnRVAyVkp6KzE3aGIwa2g0V1JmdjNSMmcvU3FuMEs5?=
 =?utf-8?B?Mm1tZCsyRjJhWXQrL3RIMnB3U2lLdEg5eUlGWng5eXN2emdaM3l2eXVkU1lS?=
 =?utf-8?Q?AT8M+LAES++WiY+A=3D?=
X-Exchange-RoutingPolicyChecked: 
	o7ZMJniVsg/lRn3IwzqPAIv2ALJglFGFJNh5rTuJLG4K82+Yc440t/oslt9LnhZweLhpwB4n7WFj48TlI0jyrApeK4Ws2okdmkoct2z/N6xQIOkzEJXA2DG1q97hA+LGRDsrpnN7AoA67qBhyyWa1uceQ6UbNFDvCWc+Ftu6ev4mrTmM1DZDvGogTHWdK64kkZo3O3plM4qzxXn5t+F5rCLa6111VTMK2BY8DGakzqRLgRYdq9qC4b/nA4csyNtapvyjp10zuVQz5vItS74/q1BBm6wraZ9Py+0mEZzf5bD41NoGtSXWCEVKAXbMVOLyj5m49wRQUVClYYeYaebvcA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cd26dd3-ab7c-46a6-e46a-08debbd60726
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 09:55:05.1495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IPqDq2bnYJtyGZEnepcZwMLAW9YM8D5S32fnWHqDFYuEPPiq3bDp0WJi+uMB8NPI6Ic+D9+OlI1gTFTqUANm1hamcVBSrh0qhfnZaiyAakk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9153
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5NSBTYWx0ZWRfXyPU10rnz/pUW
 rzMAC7T6OO5eKLstVtDof+obuoluHUQKWLJMDI2z7hJmEhCFVdMglhap8JA+rcycXFJllt4+ZE0
 catYJ9REFAd/tEyMHXt3ykPpmqCtIf6PW9sKZlr2IhzMendhUSpV9J+78HXXNC4van45KpWeL+9
 E3X4Nb/Vkf4o+IMvl+/Yg6raLayKELVR48bQZjXOb0XBRFRn/Tboid7I8cff7DSAGXX2jsXAoHk
 HAQHkdHPkfcLHwYE4sBHvSSzb1t5ZtJFv7uqbwAln2jTXVx0zuJKA6Y2VC3Jwew1EZBPWbjMAYD
 9BZKGlA4lIOv1l+vQc2MLUOYxgThhfirICXoXxnk2pQa19N0iOfb4EestxsVLrI2yCfmxJffS7r
 EA1ElA2IjU8m/3QdKQR95DlR1HwvvbyG4MOjjPkf/yig5+JScapAPLVLWumUmMZMcas0F3Cq30m
 fs1Wm804dYDT7ZmrvAQ==
X-Authority-Analysis: v=2.4 cv=M5B97Sws c=1 sm=1 tr=0 ts=6a16bf7c cx=c_pps
 a=23BBZRleo/1KOgyGqX6yRw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=Q4-j1AaZAAAA:8
 a=2CtcV8skAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=u_vVfFhwoGMuBxKrRqMA:9
 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=8H9_ecEGX7RCS9Ct2uwA:9 a=mZqqDj1mn1ImjLtC:21 a=_W_S_7VecoQA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=M3jiwns2EzFHIB_TvCNk:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: zbEudXVSs5nBSiwByOP2hGIKyM9khr8S
X-Proofpoint-ORIG-GUID: wwKQTaNfHAM6e1Q9eYxA3pCUgvThkJ0R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270095
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 09:55:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237636

--------------vZSRNn0wDsxh9vgP0z6pfu4f
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64R8ndF52633662


On 23-05-2026 07:14 am, Khem Raj wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
>
> On Tue, May 19, 2026 at 12:26=E2=80=AFAM Hemanth Kumar M D via=20
> lists.openembedded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!a6TtOzEO1jD8FfLw2fWpo-yZ_JjSr-W7G_kpsYcQ8udyue5aM3U7JhR4Db8pt0jPv4RjP=
0fip0S1BqgAkHeIvgw$>=20
> <Hemanth.KumarMD=3Dwindriver.com@lists.openembedded.org> wrote:
>
>     From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>
>     GCC 16 adds libatomic_asneeded.a which is required when statically
>     linking. The libc-test static tests fail on musl without it. Add
>     libatomic-staticdev alongside musl-staticdev for the same reason.
>
>     Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>     ---
>     =C2=A0meta/recipes-core/musl/libc-test_git.bb
>     <https://urldefense.com/v3/__http://libc-test_git.bb__;!!AjveYdw8Ev=
Q!a6TtOzEO1jD8FfLw2fWpo-yZ_JjSr-W7G_kpsYcQ8udyue5aM3U7JhR4Db8pt0jPv4RjP0f=
ip0S1BqgA4FIHuj0$>
>     | 1 +
>     =C2=A01 file changed, 1 insertion(+)
>
>     diff --git a/meta/recipes-core/musl/libc-test_git.bb
>     <https://urldefense.com/v3/__http://libc-test_git.bb__;!!AjveYdw8Ev=
Q!a6TtOzEO1jD8FfLw2fWpo-yZ_JjSr-W7G_kpsYcQ8udyue5aM3U7JhR4Db8pt0jPv4RjP0f=
ip0S1BqgA4FIHuj0$>
>     b/meta/recipes-core/musl/libc-test_git.bb
>     <https://urldefense.com/v3/__http://libc-test_git.bb__;!!AjveYdw8Ev=
Q!a6TtOzEO1jD8FfLw2fWpo-yZ_JjSr-W7G_kpsYcQ8udyue5aM3U7JhR4Db8pt0jPv4RjP0f=
ip0S1BqgA4FIHuj0$>
>     index 9d159ea9d2..d9999ec377 100644
>     --- a/meta/recipes-core/musl/libc-test_git.bb
>     <https://urldefense.com/v3/__http://libc-test_git.bb__;!!AjveYdw8Ev=
Q!a6TtOzEO1jD8FfLw2fWpo-yZ_JjSr-W7G_kpsYcQ8udyue5aM3U7JhR4Db8pt0jPv4RjP0f=
ip0S1BqgA4FIHuj0$>
>     +++ b/meta/recipes-core/musl/libc-test_git.bb
>     <https://urldefense.com/v3/__http://libc-test_git.bb__;!!AjveYdw8Ev=
Q!a6TtOzEO1jD8FfLw2fWpo-yZ_JjSr-W7G_kpsYcQ8udyue5aM3U7JhR4Db8pt0jPv4RjP0f=
ip0S1BqgA4FIHuj0$>
>     @@ -36,6 +36,7 @@ RDEPENDS:${PN} =3D " \
>
>     =C2=A0RDEPENDS:${PN}-ptest =3D " \
>     =C2=A0 =C2=A0 =C2=A0 ${PN} \
>     +=C2=A0 =C2=A0 =C2=A0libatomic-staticdev \
>
>
> clang wont need it.
>
Hi Khem,

Updated this to only add it for GCC:

 =C2=A0 =C2=A0 RDEPENDS:${PN}-ptest:append:toolchain-gcc =3D " libatomic-=
staticdev"

Will be sending the fix in the coming series.
>
>     =C2=A0 =C2=A0 =C2=A0 locale-base-en-us \
>     =C2=A0 =C2=A0 =C2=A0 musl-staticdev \
>     =C2=A0 =C2=A0 =C2=A0 sed \
>     --=20
>     2.49.0
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#237286):
>     https://lists.openembedded.org/g/openembedded-core/message/237286
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/237286__;!!AjveYdw8EvQ!a6TtOzEO1jD8FfLw2fWpo-yZ_JjSr=
-W7G_kpsYcQ8udyue5aM3U7JhR4Db8pt0jPv4RjP0fip0S1BqgAcPvrfzM$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/119387084/1997914
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1193=
87084/1997914__;!!AjveYdw8EvQ!a6TtOzEO1jD8FfLw2fWpo-yZ_JjSr-W7G_kpsYcQ8ud=
yue5aM3U7JhR4Db8pt0jPv4RjP0fip0S1BqgAJBrJVrs$>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/unsub__;!!AjveYdw8EvQ!a6TtOzEO1jD8FfLw2fWpo-yZ_JjSr-W7G_kpsY=
cQ8udyue5aM3U7JhR4Db8pt0jPv4RjP0fip0S1BqgAWq8fP6c$>
>     [raj.khem@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--=20
Regards,
Hemanth Kumar M D

--------------vZSRNn0wDsxh9vgP0z6pfu4f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64R8ndF52633662

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 23-05-2026 07:14 am, Khem Raj wrote=
:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1spE4vkhsNNiG+bM5Ro8XCgZpg=
NDDYNv-=3DhzFfqC0LGJUg@mail.gmail.com">
     =20
      <strong>
      </strong>
      <div style=3D"border: 1pt solid rgb(156, 101, 0); padding: 2pt; bac=
kground-position: 0% 0%; background-repeat: repeat; background-attachment=
: scroll; background-image: none; background-size: auto; background-origi=
n: padding-box; background-clip: border-box;"><strong><class=3D"msonormal=
" style=3D"line-height:11pt"><span style=3D"font-size: 11pt;">CAUTION:
              This email comes from a non Wind River email account!</span=
></class=3D"msonormal"></strong><br>
        <class=3D"msonormal" style=3D"line-height:10pt3"><span style=3D"f=
ont-size: 10pt;">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class=3D"msonormal"></div>
      <div>
        <div dir=3D"ltr">
          <div dir=3D"ltr"><br>
          </div>
          <br>
          <div class=3D"gmail_quote gmail_quote_container">
            <div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 19, 2026 at
              12:26=E2=80=AFAM Hemanth Kumar M D via
              <a href=3D"https://urldefense.com/v3/__http://lists.openemb=
edded.org__;!!AjveYdw8EvQ!a6TtOzEO1jD8FfLw2fWpo-yZ_JjSr-W7G_kpsYcQ8udyue5=
aM3U7JhR4Db8pt0jPv4RjP0fip0S1BqgAkHeIvgw$" moz-do-not-send=3D"true">
                lists.openembedded.org</a> &lt;Hemanth.KumarMD=3D<a href=3D=
"mailto:windriver.com@lists.openembedded.org" moz-do-not-send=3D"true" cl=
ass=3D"moz-txt-link-freetext">windriver.com@lists.openembedded.org</a>&gt=
;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              From: Hemanth Kumar M D &lt;<a href=3D"mailto:Hemanth.Kumar=
MD@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz=
-txt-link-freetext">Hemanth.KumarMD@windriver.com</a>&gt;<br>
              <br>
              GCC 16 adds libatomic_asneeded.a which is required when
              statically<br>
              linking. The libc-test static tests fail on musl without
              it. Add<br>
              libatomic-staticdev alongside musl-staticdev for the same
              reason.<br>
              <br>
              Signed-off-by: Hemanth Kumar M D &lt;<a href=3D"mailto:Hema=
nth.KumarMD@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" cla=
ss=3D"moz-txt-link-freetext">Hemanth.KumarMD@windriver.com</a>&gt;<br>
              ---<br>
              &nbsp;meta/recipes-core/musl/<a href=3D"https://urldefense.=
com/v3/__http://libc-test_git.bb__;!!AjveYdw8EvQ!a6TtOzEO1jD8FfLw2fWpo-yZ=
_JjSr-W7G_kpsYcQ8udyue5aM3U7JhR4Db8pt0jPv4RjP0fip0S1BqgA4FIHuj0$" rel=3D"=
noreferrer" target=3D"_blank" moz-do-not-send=3D"true">libc-test_git.bb</=
a>
              | 1 +<br>
              &nbsp;1 file changed, 1 insertion(+)<br>
              <br>
              diff --git a/meta/recipes-core/musl/<a href=3D"https://urld=
efense.com/v3/__http://libc-test_git.bb__;!!AjveYdw8EvQ!a6TtOzEO1jD8FfLw2=
fWpo-yZ_JjSr-W7G_kpsYcQ8udyue5aM3U7JhR4Db8pt0jPv4RjP0fip0S1BqgA4FIHuj0$" =
rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">libc-test_g=
it.bb</a>
              b/meta/recipes-core/musl/<a href=3D"https://urldefense.com/=
v3/__http://libc-test_git.bb__;!!AjveYdw8EvQ!a6TtOzEO1jD8FfLw2fWpo-yZ_JjS=
r-W7G_kpsYcQ8udyue5aM3U7JhR4Db8pt0jPv4RjP0fip0S1BqgA4FIHuj0$" rel=3D"nore=
ferrer" target=3D"_blank" moz-do-not-send=3D"true">libc-test_git.bb</a><b=
r>
              index 9d159ea9d2..d9999ec377 100644<br>
              --- a/meta/recipes-core/musl/<a href=3D"https://urldefense.=
com/v3/__http://libc-test_git.bb__;!!AjveYdw8EvQ!a6TtOzEO1jD8FfLw2fWpo-yZ=
_JjSr-W7G_kpsYcQ8udyue5aM3U7JhR4Db8pt0jPv4RjP0fip0S1BqgA4FIHuj0$" rel=3D"=
noreferrer" target=3D"_blank" moz-do-not-send=3D"true">libc-test_git.bb</=
a><br>
              +++ b/meta/recipes-core/musl/<a href=3D"https://urldefense.=
com/v3/__http://libc-test_git.bb__;!!AjveYdw8EvQ!a6TtOzEO1jD8FfLw2fWpo-yZ=
_JjSr-W7G_kpsYcQ8udyue5aM3U7JhR4Db8pt0jPv4RjP0fip0S1BqgA4FIHuj0$" rel=3D"=
noreferrer" target=3D"_blank" moz-do-not-send=3D"true">libc-test_git.bb</=
a><br>
              @@ -36,6 +36,7 @@ RDEPENDS:${PN} =3D &quot; \<br>
              <br>
              &nbsp;RDEPENDS:${PN}-ptest =3D &quot; \<br>
              &nbsp; &nbsp; &nbsp; ${PN} \<br>
              +&nbsp; &nbsp; &nbsp;libatomic-staticdev \<br>
            </blockquote>
            <div><br>
            </div>
            <div>clang wont need it.&nbsp;<br>
              <br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    Hi Khem,<br>
    <br>
    Updated this to only add it for GCC:<br>
    <br>
    &nbsp; &nbsp; RDEPENDS:${PN}-ptest:append:toolchain-gcc =3D &quot;
    libatomic-staticdev&quot;<br>
    <br>
    Will be sending the fix in the coming series.
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1spE4vkhsNNiG+bM5Ro8XCgZpg=
NDDYNv-=3DhzFfqC0LGJUg@mail.gmail.com">
      <div>
        <div dir=3D"ltr">
          <div class=3D"gmail_quote gmail_quote_container">
            <div>&nbsp;</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              &nbsp; &nbsp; &nbsp; locale-base-en-us \<br>
              &nbsp; &nbsp; &nbsp; musl-staticdev \<br>
              &nbsp; &nbsp; &nbsp; sed \<br>
              -- <br>
              2.49.0<br>
              <br>
              <br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              Links: You receive all messages sent to this group.<br>
              View/Reply Online (#237286): <a href=3D"https://urldefense.=
com/v3/__https://lists.openembedded.org/g/openembedded-core/message/23728=
6__;!!AjveYdw8EvQ!a6TtOzEO1jD8FfLw2fWpo-yZ_JjSr-W7G_kpsYcQ8udyue5aM3U7JhR=
4Db8pt0jPv4RjP0fip0S1BqgAcPvrfzM$" rel=3D"noreferrer" target=3D"_blank" m=
oz-do-not-send=3D"true">
https://lists.openembedded.org/g/openembedded-core/message/237286</a><br>
              Mute This Topic: <a href=3D"https://urldefense.com/v3/__htt=
ps://lists.openembedded.org/mt/119387084/1997914__;!!AjveYdw8EvQ!a6TtOzEO=
1jD8FfLw2fWpo-yZ_JjSr-W7G_kpsYcQ8udyue5aM3U7JhR4Db8pt0jPv4RjP0fip0S1BqgAJ=
BrJVrs$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">
                https://lists.openembedded.org/mt/119387084/1997914</a><b=
r>
              Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@li=
sts.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">
                openembedded-core+owner@lists.openembedded.org</a><br>
              Unsubscribe: <a href=3D"https://urldefense.com/v3/__https:/=
/lists.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!a6TtOzE=
O1jD8FfLw2fWpo-yZ_JjSr-W7G_kpsYcQ8udyue5aM3U7JhR4Db8pt0jPv4RjP0fip0S1BqgA=
Wq8fP6c$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">
                https://lists.openembedded.org/g/openembedded-core/unsub<=
/a>
              [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" mo=
z-do-not-send=3D"true" class=3D"moz-txt-link-freetext">raj.khem@gmail.com=
</a>]<br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              <br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Regards,
Hemanth Kumar M D</pre>
  </body>
</html>

--------------vZSRNn0wDsxh9vgP0z6pfu4f--

