Return-Path: <kexin.hao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB848C36010
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 01:34:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.64510.1744076077989136884
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 18:34:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6193b1b1b9=kexin.hao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5381SdQf022970
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Apr 2025 18:34:33 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tyt4awm2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 18:34:32 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5381XMdH030060
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Apr 2025 18:34:31 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tyt4awm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 18:34:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WKh97Xs6pXYP9mlaLxnIO7dn/1Q+lL/fNROm972a8ymwMYFTj5YaNck/Qhw6jDTS8fVZhxcU4mxzd3lfqQh3NwoH5q5Yj6kB5dMx6dABMLP0t5jFwGPMhiBv3OivmKztVU22UVE9hINaaP5vfx4ezRuHdc88DpuYOqV+omDbLH7rM2Q0BRk8yTrv1/DKBt/vvPHxtKLnn1VNtTf1//cv9Fnv3YIOmx4Jfi1SrR9R0fnc7Evsom3u0ve9PZFs5Yxoq3Lk0/wDzUxgV4ZVDKgUhaA/TtDro/pKIyZhZ+5Gaa2ZYa1WMmZPljqbitWrBwvYdNVJQIrZ4cBWAQXKkU8pZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ssD5RWWWMOEyDYN2X3uPQAV6HDR93Q50Pcp+Yt3kRs=;
 b=l+0jXIaFxzqJfsOY+Rg/v7GxGiFk7Pj5+80iY1dGZQYrSWP1hPURG1+q3YBqxDvAM+n/rec5CpGq8aBBdy+GsTwXp62TdVD6+i99O8wEyB9o7g5d6bLPYYxa9IGL/Gp19ubo6P70zv5+Kh/k0LeJi9dQoDsdreFZAFq8ubuV7SN1bXfaAWiZmlJrxIaSqYV+8EqQJIcQ+I/PW5fSOoahloTLriFzRdhf7NpwxhNsImALqxJft4xLj8kWdSPQHXnb15nYPkIUfOKNMrYzlC2PCXTgfcupmgwie5GzIL9ub/SCU4m0EsmlwLepK2nebfjIuwhFB+ePvvb/Sa93BfjSHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN2PR11MB4646.namprd11.prod.outlook.com (2603:10b6:208:264::8)
 by SJ1PR11MB6225.namprd11.prod.outlook.com (2603:10b6:a03:45c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Tue, 8 Apr
 2025 01:34:26 +0000
Received: from MN2PR11MB4646.namprd11.prod.outlook.com
 ([fe80::5a5d:3c61:7600:4a56]) by MN2PR11MB4646.namprd11.prod.outlook.com
 ([fe80::5a5d:3c61:7600:4a56%6]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 01:34:25 +0000
Date: Tue, 8 Apr 2025 09:34:18 +0800
From: Kevin Hao <kexin.hao@windriver.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Khem Raj <raj.khem@gmail.com>, Christos Gavros <gavrosc@yahoo.com>,
        openembedded-core@lists.openembedded.org,
        Yoann Congal <yoann.congal@smile.fr>, jbk <jbk@mm-software.com>,
        Adrian Freihofer <adrian.freihofer@gmail.com>
Subject: Re: [PATCH v2] initramfs-framework: remove hard dependency with
 busybox
Message-ID: <Z_R9Gv0jqc34y-uJ@pek-khao-d3>
References: <20250407164456.4845-1-gavrosc.ref@yahoo.com>
 <20250407164456.4845-1-gavrosc@yahoo.com>
 <CAMKF1sqHSmryz3LSpsJiL1AMGdaoSGZK0vWgYfw3xymBAiEz0w@mail.gmail.com>
 <9fbf35dd-e562-408b-be87-daeca7c86d3b@windriver.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YoFW5Q8negmTU//X"
Content-Disposition: inline
In-Reply-To: <9fbf35dd-e562-408b-be87-daeca7c86d3b@windriver.com>
X-ClientProxiedBy: MN2PR01CA0049.prod.exchangelabs.com (2603:10b6:208:23f::18)
 To MN2PR11MB4646.namprd11.prod.outlook.com (2603:10b6:208:264::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4646:EE_|SJ1PR11MB6225:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c220a7e-21b3-4bf2-9b6a-08dd763d7ee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VmU4bUhCeDJHZHg2QUl5cnNSckVHRGVRd1ovZ0FBK1Q4Q3NXZnlYTTlDVWJ2?=
 =?utf-8?B?eGFCdEhVam14Skd6dE51alBHdWs2R3g5RDRSWWtvbEREVE1zRS92eXFPd0Vu?=
 =?utf-8?B?ZDNyOGdLQWFvZHE4djBzNVJYZFNQNE1tYTJjUU5abERCbCtrbEhqdmdpdEFJ?=
 =?utf-8?B?WitSV3I3L2RjNGNyT25QMXdUemRSbUZKYU53NGtoY0lwWEpYT1RZVS81L1I1?=
 =?utf-8?B?dDJKZlNBaTVhaFBTOExyemJKeWZraHVJdkp1bXBvWUk4cHFPZXV4YXVhdi9Z?=
 =?utf-8?B?L0JvSWNicFBTLzdleC9VSFo1U3llK09MTkJadDhZK3pBSFd0QWJBYlBUNkZv?=
 =?utf-8?B?L0pPN1M4bTdZSWVwRFNMZDdjSnp6dDA1RWNiR0psV1V1eStNZVp0Z2FlV3Fl?=
 =?utf-8?B?OUFITElMR2xqbmQra3dOU2hiMTlVdW5UbHgyWHFTdVhEVVM1Nkdpajk2dmZT?=
 =?utf-8?B?dGFoeXNDVElBcUg3UmNEaE1ZN1pOb1ZRRTdQazBZU2xlaER5VUg2ckJLUFlk?=
 =?utf-8?B?Z0xoUTZlbnFWSXdadjY3TjdXdnROaysrbGpsYmdsWFRaWDAyZkQzV1hXYXZj?=
 =?utf-8?B?b2JidkE2czJLSTZyVUlrQkdTOE12U1gvU0hKNlJZK2ZaWWdNT2J1eG05Tm1K?=
 =?utf-8?B?VTYvOXVqU3hsTThsdG9vTFBpbStjdHc3NHVoekU5bjZrOHRFMFVSV2dDVVJk?=
 =?utf-8?B?NEJIek1naGhNUTExRVhJbXZCTG5PYzVLSXA2T05uUDBPeENsQ1N3cDZ3TkJP?=
 =?utf-8?B?YStVWThDVzRQSHRsZktqM09HcXRKcE1mZ2RHejFscjJOTy9TVG1IYTI1UmZD?=
 =?utf-8?B?Zk8xK3ZZcXdiNzdrN2VNS0RVKy9JME1VRFJhWTZiRWN6NWRqYmtDdmVacS9v?=
 =?utf-8?B?NW1SVzR0S0xaSXRqTWhhaXBNQTZHS3NhK0NMdmMwZ291Z0tmZ0NnRWZScnND?=
 =?utf-8?B?Y1pDRkdxbzFBTU5JdVhSQ3dHZTBlbkZIdnFDMCtKb0JDMnVvZFR0QUxRT2hz?=
 =?utf-8?B?K2p1aXZZakhHQnZiM2RLOWdvTTd0RlliTm5RK21TTnRsN3NBQk9tUlV1WHJH?=
 =?utf-8?B?bzhBZXVGaVk5WEtqZmZkMUNGcXdneGhQenlENjNhNTVnS3drY21lUmEwaTQ0?=
 =?utf-8?B?UjNoQVMyQWJQMXBvbCswc01TTmVyQXZ5SVk1SitCaVpyM3dWMFpicTNyWnJX?=
 =?utf-8?B?K25PQ0ZhVmdpTC9GNUttdFFQVWZJMXM3RHVZbWZVOXpROG1DOWdZWkFqbThz?=
 =?utf-8?B?Nnd6cmpiQkNlWGlEeXJmL2taa3hvMFQvbFd5b1Znd3FnVU5XRmMxRUVnRm40?=
 =?utf-8?B?ODF5emhDdWYzNnFiMEVyT0RuYkRMdk1BNFZ4clJYaXlGTkNLWkdIUFJhUitK?=
 =?utf-8?B?am8ya3pFZ1R3YW5ESDFnU3BwK3ZRYnBVd0JFOGU4b3VZTjJiUkgrM3FXdlM0?=
 =?utf-8?B?RklZMUtHRVZkeDA5RVlNMTFGd1JSUnRIUERZam9tWUY0c1BmMU1KbG1QdzNy?=
 =?utf-8?B?OTNPYS8zTDAzaEVWMzhvTzBVUStneTYvZTRuTEtWdzJWNFBvQ1pVL1BIV2hp?=
 =?utf-8?B?T1VuS1N3eTBnNnBNUkFHdmRJSWJqcDJOaTBoMys5alUycFkvOFVnNEZRRlRG?=
 =?utf-8?B?VTQ5Q3ZabUhLRTZqMlpqTExsekdiNzlhVFdCai9RVGQ3UTFobkd5bWl5bzZN?=
 =?utf-8?B?aXhUc2NpQjB5ZHBvT002NUZnZ0QvWHV2N3RhbklQbm9MM3YrUmZSVGRRZjY5?=
 =?utf-8?B?cURsZHRKOS9hVUNBako4bjNFTUk5cWJydUdWRVp4U2xIS0xETDFWK2h3dHNs?=
 =?utf-8?B?by9GUFVTMGpUY0RCZXE4Tjh5Um9FamEva3V5Smt1Z1dyZUtBWExsOWJITEFk?=
 =?utf-8?B?Z01pNE9jWVlmZWNVTHV5Yk9MSDRnTHlxaVpEV1VzbWpxMWc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB4646.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SDJ1UjB1SThRenVFc293Q3kzdCtBam9ES3llRlM1b2VneHo0dmpnamJlSWtY?=
 =?utf-8?B?UkNpbXdZcUdqbFE1cHd5T3BVcUFrTDNnVE5vcmsrUVprOWI3Ui94Z2NrdXAr?=
 =?utf-8?B?eTFvQVZOR25nVHU0RHQ5Y1pjMXIva3Zxem50bkNQMXprNXRVU3NIcmVhS1pj?=
 =?utf-8?B?MzJmWmhJY0FXY0prRmxDKzdHMndZTk9oSThwRXVjWG4vQzk3QTYybGdYdVNU?=
 =?utf-8?B?VGlqZDZrcHRCaGVncktXY2Q1UW1PSkVQQ1JQLzRrMWdIbk83dnF5RDZ4NUQ3?=
 =?utf-8?B?ZGkxTG85THBSQVNsbnYrUEg1eVV2eVBpMlFndUZLUVM2SFdQQUVhWGpNSHIx?=
 =?utf-8?B?T2Zsc1d5OWFrRDZuNGZ4azRRRzJsK1JPRE5ZSFVRZnc1NjBMajlaQkpEVXc5?=
 =?utf-8?B?WDlaclRna1VKdTNzQWRnMW9XYWw2RlBDUFkrMkNtMjBFOTg4WHBISmtqbG9Q?=
 =?utf-8?B?RDV3UTBZQ200a1VGK3Z3Z2trMWFPczB6U0tHRzlxay82dldnQkVoVVJ3MjUz?=
 =?utf-8?B?RER5UnFCRkxaSmZHeWNHQzZFUWtXTXA4ZGJ3NjhnTVR1Z0VjWDZzd3FhWkRx?=
 =?utf-8?B?T1hwcE9xTENDWVpPcE1ONCsxaGFWWFZNelB5VGlsSUJSYzRoYmNMKzZGOGpX?=
 =?utf-8?B?cFdiTmtWenNPS3FIeldTam1IUmZoUkxja3F3cG9WdVFSbzl6Sk5qRUJFM3hU?=
 =?utf-8?B?dE9XMjNac3lWSHp1amdJbWY2V2tWUitWdXdUQ255WHlRb3R1NlJPNFJkWjI0?=
 =?utf-8?B?UHJ3Mk9rRjdiS3ptejVvbVpHUi80a0Zxci9XaVgvRVpXek9qSE5vWmJPa0hO?=
 =?utf-8?B?T0pTdEg3WkUrN0dxcmVzc1NSbTFIaWxFbUl5S05NOElKRXJESUJPUDBQcWNa?=
 =?utf-8?B?YmNaZnJCYUFFUFJ0a1JEelljbmJCci9Sa0R2cGFjSHVMSDhtc3ZSNlZOWUhX?=
 =?utf-8?B?Qk1MeFZYdHVoeWxmSUgxVm0vdFFmcjdhUEgzSjM1SHY3OU1JTGRNbi9mU2g3?=
 =?utf-8?B?MGovQndod29hQzNUcTE4L1NNR2pjVFllOFhuWmR6dm1UVXE4NVUyOVBOYUdY?=
 =?utf-8?B?WHRKWGJJYnd2V1hHUDVQUnM1N0dGb3hPUXBJRWY5Wm9tOUZvdEtaZG9OWHJk?=
 =?utf-8?B?K3hTdXlkQ1RLYkhya1Z3YTBMbmZrRUdFL0lpTUZtZHZKeFRGQ01RSDVMdE9Z?=
 =?utf-8?B?bkxpWXFxNzFZWmgzcFFnMWE5dW5ubFhrdmIyM1R3SlVzL0pia0hhTmh3OC9Z?=
 =?utf-8?B?VElrUDF0RGxISXpFNHViWS9Ic0YxMVZQcFRDS244cS9EQ1c1dTFCeVVtbEIx?=
 =?utf-8?B?SDdYNVZFQjVNWk1xRnRtN2IyK2Z0R0RtelFaYjBZUDVIZ2dVazV6SDQ2bmxV?=
 =?utf-8?B?T1NwWUd2S29IWlpRZGdaV05IaE5admdiMVBXeklGb1I5RE1NemIwNUUrTnRW?=
 =?utf-8?B?alNkOVZGOTNXZUUzcnY1Mllrdm5aYmo4VjJJaWllMEtPUGpaM28zSTJodk00?=
 =?utf-8?B?Z0NrcjdwaTl0Nit4d2czMzF1NU55blcxUERKY0ZPM1ZzRUZmbmo3YXdMVkFq?=
 =?utf-8?B?VkJGbEc3Rlc2MTVWcm1qaWJTZ0JaS0NmeFByMGhpN25jblhxSnh1WE5WN2pv?=
 =?utf-8?B?UTdNUkpYdHkxVFlrY0FxbW55d2pEZ3V2MEY2cDdxaFBqelZ0dGJlaFNGaFl5?=
 =?utf-8?B?SjlmT3FlcDk0bXp0OWhSRU5pVU1lZW52WkFyK0ZVcnVrWUExQlR3Wi9jMEUr?=
 =?utf-8?B?NGgrVnRnRnN0aUlNc0Y5UGVsV3VwVXowMDFZemdJa2FZN094L21COGRGbjhW?=
 =?utf-8?B?cHJlb0YwQ3VvemRHWFRiWHUzYmcwMXhPakVqbXB4citTZnBCRXYzcmVQUGxG?=
 =?utf-8?B?a2lCeTFiN2Q3K1g2VG1iM3NEMjhHWEV1bWpWcmJYS1FRbnNybkYxU28zYklO?=
 =?utf-8?B?N0M1dnF0aEFWNkl5L3ZSUGkyZlZBbm1hdW5UNWxZTCtVa3RVY21MNGlPbjlt?=
 =?utf-8?B?OWZ0YmprRXVTbFdIVVN3WGxmZnc5cTBvUGhNNExLTXlTM216Ni9wSHY4N0Jq?=
 =?utf-8?B?VEFGUW9LT04vd3dFQnJWUFFLUjM5TUpiRWdMd2hRbjRMRGdkdHpyN24vdU1u?=
 =?utf-8?B?aldSMkpqZ0hUK1lrTGw4Qy95ejVpbnNydWxYSXFiOVZDZitPOVhqb1Y3cjR6?=
 =?utf-8?B?Wnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c220a7e-21b3-4bf2-9b6a-08dd763d7ee1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4646.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 01:34:25.2907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ZQ1jBJrVgfVEhSLWqmLreXCe8a9XMLs1nZwkmJ3mwQBh3TYP2q6LAzzt/r2pSdLfQrS+meCCwJu2iEwtB+ALw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6225
X-Proofpoint-ORIG-GUID: 8x52sxJLE8-RnXl0jECiCHYPouGUxcIw
X-Authority-Analysis: v=2.4 cv=RMSzH5i+ c=1 sm=1 tr=0 ts=67f47d29 cx=c_pps a=X8fexuRkk/LHRdmY6WyJkQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=NEAV23lmAAAA:8 a=CjxXgO3LAAAA:8 a=t7CeM3EgAAAA:8 a=irw2G16eAAAA:8 a=pGLkceISAAAA:8 a=tUEv2AO6scI0r8BaCc4A:9 a=QEXdDO2ut3YA:10 a=VTagnj9xOK1AZ9vEp2AA:9 a=FfaGCDsud1wA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=RvFFu2bzxk4ABdbp7JBg:22
X-Proofpoint-GUID: i-RFU-_-b10QunIxeTEDAqv1VQ5eUE2Y
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_07,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1011
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504080009
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 01:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214501

--YoFW5Q8negmTU//X
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 07, 2025 at 08:19:50PM -0400, Randy MacLeod wrote:
> On 2025-04-07 1:04 p.m., Khem Raj wrote:
>=20
>     On Mon, Apr 7, 2025 at 9:45=E2=80=AFAM Christos Gavros <gavrosc@yahoo=
=2Ecom> wrote:
>=20
>         In 'finish'script the Switch_root command with option -c is busyb=
ox specific.
>         When package-core-base-utils is selected the boot is breaking wit=
h message
>         "Switch_root: invalid option =E2=80=94 =E2=80=98c=E2=80=99.It was=
 reproduced using qemu.
>         Remove -c option to make it compatible with both providers.
>         It is tested using qemu with busybox and package-core-base-utils.=
 In both cases
>         qemu boots successfully and filesystem is accessible.
>         Fixes [YOCTO #15716]
>=20
>=20
>     Looks good
>=20
> Probably, and it's a small change, but :
>=20
> 1.  Usually the busybox version has fewer features but
> here util-linux doesn't have the option, which is a bit odd.
>=20
> I also checked the git repo/master branch and it hasn't been added.
> Note that toybox, a BSD-Zero licensed, re-implementation of busybox *does=
* have
> the -c option.
>=20
> I wonder if anyone has asked util-linux if they'd like that feature for
> embedded boards...
>=20
> No sign of that as PR or issue:
>=20
> https://github.com/util-linux/util-linux/pulls?q=3Dis%3Apr++switch_root
> https://github.com/util-linux/util-linux/issues?q=3Dis%3Aissue%20switch_r=
oot
>=20
> and
>=20
> 2. More importantly, embedded folks are often emotionally attached to the=
re
> serial lines/ console
> for doing BSP development and low-level debug work.
>=20
> CCing Kexin who will hopefully comment on whether  he and the WR team wou=
ld
> care if we drop the console specification.

Appreciate the notification. This change appears safe for our use case, as =
our
primary focus is kernel console functionality. No objections from my side.

Thanks,
Kevin

>=20
>=20
> If not, then I have no objection since one can easily enable the -c option
> when debugging and then ship without it.
>=20
>=20
> ../Randy
>=20
>=20
>=20
>=20
>         CC: Yoann Congal <yoann.congal@smile.fr>
>         CC: Randy MacLeod <randy.macleod@windriver.com>
>         CC: jbk <jbk@mm-software.com>
>         CC: Raj Khem <raj.khem@gmail.com>
>         CC: Adrian Freihofer <adrian.freihofer@gmail.com>
>         Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
>         ---
>         v1->v2
>         * the commit message is extended with more info
>         ---
>          meta/recipes-core/initrdscripts/initramfs-framework/finish | 2 +-
>          1 file changed, 1 insertion(+), 1 deletion(-)
>=20
>         diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/=
finish b/meta/recipes-core/initrdscripts/initramfs-framework/finish
>         index ac0de9f996..716c2f44af 100755
>         --- a/meta/recipes-core/initrdscripts/initramfs-framework/finish
>         +++ b/meta/recipes-core/initrdscripts/initramfs-framework/finish
>         @@ -41,7 +41,7 @@ finish_run() {
>                         mount --move /sys $ROOTFS_DIR/sys
>=20
>                         cd $ROOTFS_DIR
>         -               exec switch_root -c /dev/console $ROOTFS_DIR ${bo=
otparam_init:-/sbin/init}
>         +               exec switch_root $ROOTFS_DIR ${bootparam_init:-/s=
bin/init}
>                 else
>                         debug "No rootfs has been set"
>                 fi
>         --
>         2.34.1
>=20
>=20
>=20
> --
> # Randy MacLeod
> # Wind River Linux
>=20

--YoFW5Q8negmTU//X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEHc6qFoLCZqgJD98Zk1jtMN6usXEFAmf0fRoACgkQk1jtMN6u
sXFAMwf/VcPlow+K3/UQesTImRQJIWyXRUH0SWb/OipIPPQZg42Dval7J3AnRtqu
fAEQnyaVzTbEVlIfZ++sQZq2kKwPmmwpEn8oNIpWeEzfFTH8DwBmlZgKla5ZWWin
z8rd04gRcWNwC3/U8Sh/bLvG37Oq0VkgcYhOoBtIRWtcWLx3OAVQjDt7h6nNxY52
iYSAH4+VzrjkUlOdFffw1CWJ1+4V/LGlHdKPtWho3OFtxqLIvoJES5OvAJPTvxi4
JYHuIczXXIYERSrXRUgGdNXdYsGEG3rRUaDZi8mcvg+vGSefvw317IeuYmpukNv/
YjBqHky8q6pbR8O2oPFKkNhcGyCmPg==
=U0DG
-----END PGP SIGNATURE-----

--YoFW5Q8negmTU//X--

