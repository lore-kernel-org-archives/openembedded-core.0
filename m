Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2386EC54E71
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 16:24:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3436.1747844651368391025
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 09:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=723649de9b=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L49I6g024267
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 09:24:11 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfr9m60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 09:24:10 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54LGOAxN030153
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 09:24:10 -0700
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2048.outbound.protection.outlook.com [104.47.51.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfr9m5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 09:24:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4RXPYECpe1s68VAt8gLtxnQ0Km4+C5zve6yeVxxvOCEIpd1uDBH9ZY4Kt4CDNQYWG3rjkUSFaPL/L3d0bInbdIxfEH+yjwJccQ//oQ1c91zopN4NKQFYracmDa3LSVJuQHtVt00EGf+9w75tBrncZfUFqdli9u8a6hhxU8l9A0FuVXICL2bpjGev92Rpzyx0L4oKVBDV30Ede5vll7ttZMdihSYMnG5ctJTMayr1qNxFgTQ4XGr0oOCzlOaV29GZz2FSyfvN/o6euxvdPU+lyI3rL8alAW1Vf4aHRZD1DMKA+tbLUwXlz67dHLnZEmWwr3xnvqZYXTrTC/opu2jvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/EOO14EY6cpNL7oLS2XHdMcJgGUSBRvcOXZZ+VdvtLw=;
 b=FR31erJ+7mr4rmqL9686vI12cXc6ZJvmG4sFtpBWMsFxjVpgQSPb3CmUvrELEnB8iIhVVKQOVvPIt4Xek+9IVL+6ZPFC8GtE+A8VP68HNcxB3DA9kvFPvTYHGs+gcuQDqN5knGI88JfqSrTXgwPf85f748/qvCZS1yoI8pwW4CaudtBRAoW0Q/KorxjAz82yZ7T8DZbW17W9R8CxqexMrsx8fLLKUXW0VmkNDdCvGroaduyNK/n4WG2aPJwW9eSYSMu49rWHD+e6Th+L9/RzUdmmEjrhvqJmHtxEPCULBJD4nG/tuQc63ojzmExweB01Mmkuv7Uf7d5j5VgDdrM8EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DS0PR11MB7850.namprd11.prod.outlook.com (2603:10b6:8:fe::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 16:24:06 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%5]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 16:24:05 +0000
Content-Type: multipart/alternative;
 boundary="------------xcRAqHM4zeXFshTvcWlBKdxL"
Message-ID: <52ac2533-4b64-47a1-b4b4-0ea43ab2f25a@windriver.com>
Date: Wed, 21 May 2025 12:24:02 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [kirkstone][PATCH v2] gcc: AArch64 - Fix strict-align
 cpymem/setmem
To: sundeep.kokkonda@windriver.com, openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com, skandigraun@gmail.com
References: <20250521115945.3629052-1-sundeep.kokkonda@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20250521115945.3629052-1-sundeep.kokkonda@windriver.com>
X-ClientProxiedBy: BY5PR16CA0013.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::26) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DS0PR11MB7850:EE_
X-MS-Office365-Filtering-Correlation-Id: c65f49e8-b038-4422-f846-08dd9883e7d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RmlqWEY2N3N4bWF2ZXpOZXNKYmNFM1N1MWtabGRwdkg2V0tZaUhkejZ4SGQ0?=
 =?utf-8?B?ZjFsUE1BMGlTSWo4YTVOcGRIVWNCTFR1TTRBL1R0WGc4TFptanRwZ1dDUkJV?=
 =?utf-8?B?N3Zzd1Q2WXFzNGdER3JteVdUaTdnaE0xckQxOTNYVmVjQjhUY01uOXlDQmVp?=
 =?utf-8?B?QVg3a0NnY2hzQnlHQ2NCZ0piZ3NmZElxZ21JWVhqdmZvUFpMY2NPMDJ4MFQx?=
 =?utf-8?B?UlFaa1ZTN0FyRklhTE1PbjZEOFJPK2lzdGUwbGpQcE1ReUVvOTMvV3Z3QkRG?=
 =?utf-8?B?QTdLVzBVZ3FBb1JtK2ZjNjMvUDNpbk9obmlLRlhFRENROUpSNEJNUjJaWUo3?=
 =?utf-8?B?TFVqNGNCZ1ZOVFVuRUhZMmRIUStZbzd3MUtsbi9EMkg2aXl2TXdBYm1rdHR4?=
 =?utf-8?B?MGo1aU9vYXpzSlpBQ25WMzVmdDFVZ3J2RTQ1L1VQY291aG5jMSt3dTA3THIy?=
 =?utf-8?B?NFl4YXdYNWFvdWRCdVNjUjIyeFRlcVlOeHozemFEaU44TW9CMkJJTTB5QkJT?=
 =?utf-8?B?KzVQVGdyb3k5VEw5eW5FMnpUWnNtVXV5eXlveHhsLzhWNEZPb2h3ZUJhUnZz?=
 =?utf-8?B?NSszL1BIZFByVmxUdHVTM0s5SUoyTDJhNWZwOHlRK2J6QVlpWDFjVlh0MzBB?=
 =?utf-8?B?VjIzRXV6ZVpQeWtxOGRoWWhnK2JCbGZzanV5SmU3V05JcGd5QUN6Q2lyMk5O?=
 =?utf-8?B?U3o0cHRCQUsrenI5a0ZIa09SalNXbkplSU5PRGNDQ2psRmNrVmhHMVNoaXZy?=
 =?utf-8?B?cHppQnEwNzB4c3pUSk9QZ1hmWktJN1RwS1dlZjM2VUJlTVB6cDFwREVDamZ4?=
 =?utf-8?B?OVE4TFNwSjJDakVYR2FwTHFPK2hWU2lqWEc3eis4MUxjWkJqTXhrSEExa2N4?=
 =?utf-8?B?b0RDT0JRWE91VS9ESE1NVFlmY1VEQUFwczJCVU52dGQ3UlI1OUFUdUNYV2Ns?=
 =?utf-8?B?T01EQW53NEVnSkZjb2hudUt4ajhYRzREMGlDd0ZEWThicm5rQ3BlOEFQRndu?=
 =?utf-8?B?WXNabkkraGcrNXA0OGlqMXNuRlEySUQ1bXpxS0FDOUpHYnNyalhJSk8vZ05M?=
 =?utf-8?B?anl0QU1ZcnJENWJJOFFYUGpla3lNengvVVAvUm15Q3ZLV1JJeUVpVU1SZSt1?=
 =?utf-8?B?aG1DTVJhMXUyaWxhenB2T3QzNFRTNkppR1h1S1IzbEVTSDFkTmVKWEYraVF1?=
 =?utf-8?B?UVY2K2k0bzErQ2lPc0RzRmxDSUwvcUp5WlFabDR0bngxdXZUVDNvNGRqclJ5?=
 =?utf-8?B?eFFuZXowWVFEanArelFRUE10dU1iWlF1b2dzZHJLMEhTTWlMSXBRMTVKWFZS?=
 =?utf-8?B?YTFNeWIrOUEyUVBvdmdCU3d4Vi9lR0ZKbTA0NXduQVVOMEpOZW9iTWE0akdy?=
 =?utf-8?B?STBmcDJzVXJlY2FOVVgwcXZqUytIYkhaN0g5RG0vdHM3VXVhKysxWVNRTzN3?=
 =?utf-8?B?YnFmdEIwY0s4OU5WVnVuODBYTDJOK1N1MXNYVkg1dHpkK1U5c2V5OXIwL3Vm?=
 =?utf-8?B?dVRuUHpqVldva2x1eFFMR2pjWUpTOUlYcmpjUjVLeEdXcEIycWNLeUQyU1Q3?=
 =?utf-8?B?M3VPUkx3eStucFFVWURXSXVhb0VucktIOGFrcXFDc2VjUjZQSjFpRlJFVDRm?=
 =?utf-8?B?WEtDcVhJMWwwc2gxZFNyS0ZtMWo5QUVQNUdqRFFFemRQY0dpU1Q5dTJxQ050?=
 =?utf-8?B?c2x5QVB0bXNuK1RpNTRkQ2l5T1lzZ0RYbjRFN2xGUUxCVEQyRkdkVDgyNmNK?=
 =?utf-8?B?VWU4MFkxRUM4QzRMRzA1dkhTalFVZlAya28xUlYvTkpBR1RrNDJ5WDFxUFJa?=
 =?utf-8?Q?2v6O8K1Px04mYUDnH9Ofury2JfAmgp6e/KcMU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K3BIRUVITXB2Wmx2bmhtOGtZeXg3Q3ZUd2w3R3Y5b1pwZ0NJRHdJQWd5eHhK?=
 =?utf-8?B?YUJTcXd3ZjVzY0Z0K2pvbGdpaGMzSnB2RVdCaC9aQ2xHWFBsNW5oU3VqTmE4?=
 =?utf-8?B?cGwyT0NuZU9sdDhTZU03eFFUZGh1THNFM09nNUR1ZDlod25hWW9MYVVCTDNG?=
 =?utf-8?B?Wk9GWndrUk5Bb1BxWFhPd0RWSGRQRGdVU2VWeUJBY1ZTK1hqUE5tNGY3TjFD?=
 =?utf-8?B?a3pSalkwMExxR2U5anEvQ3N4MUx4djVBVVp6cnNNVzJJN2VsclpLSkl6Y3h5?=
 =?utf-8?B?THZKdU9pbDliK1h2dDJvSWlReVJRMU9VSTV2cWYwZlZvZHZOMVo1ck9SM1Nv?=
 =?utf-8?B?TFU4RGVteFZ5cGFkL29SSnI4K0hvRjlyVjQ0OHQ3UVBWdWJjL2lLZUdrZkhY?=
 =?utf-8?B?dWNJZWhkeWNlbHBrN3YyWWFYQXVUUnR3OXRneE5rcmRicDJtVCtTTnZDaW0z?=
 =?utf-8?B?Z0J3a2w4L2lTOU9HK2pSKzBtNnVtRzZscGtTTnpSVUNVVHQ3YmNzd2l1TlBp?=
 =?utf-8?B?ZUtrYnFCanRKZm4zeXlidml6ZWlTUHVXR2hRS3ZPMGFRTVVXUTBkNHk2ZFF6?=
 =?utf-8?B?cXdPendMZUhYQi9ydkh2Y2NHMndtRm5oWjZvNHNvYmlRekRETFRjemwxZy91?=
 =?utf-8?B?SjErVUREaEhRaDBNSXp1a2lxZ3o5M1U1RFk0a0o5Q1lvU3hqbDdrU2w5ZUJk?=
 =?utf-8?B?akMyS1pDcGZ6YlMvNFNQcU5nc3Z4bjFCUmZXdmYzTDRLcWZDVkNNZkdhTkNJ?=
 =?utf-8?B?UkVaVjJ6SzFya0x3bkl2c0JvSFRuRk1Nb0w0dE5TU3BwUmt5WXFBbnlodkxQ?=
 =?utf-8?B?SXpGQXR3bFZLUG8rYVZQOWhGb3p3bDVmbElQUkVBaE1FR0w3NWJkNWczZTJS?=
 =?utf-8?B?R3QyMlFBR0NMYXN0ZjdPdFNzMktFU3Y3c01ncWJad2dPRWhyRHpnVzZXYWZ0?=
 =?utf-8?B?d3ZkTFpWQVd4ODl3dzBMUk0wdXhEOTFUbTk3aW9iWWt0SDl2TFAzMjEyV1pY?=
 =?utf-8?B?eDRlSTVJQ0Q3NVJjN2NlN3FMdXEybElrQ3pXb0xYMmVEOVI5Wkh3RWJmRUNP?=
 =?utf-8?B?RjBhOFFFQm1lVGFEbDBiOFFrNmRuTW1QVFo3Y3BnSjlOYXFjSmhkd1V2TzlP?=
 =?utf-8?B?YTJrQU9pejJRUnBKeUpIOU1IMjBaaDVIdDFxRmc3bWlmSzUvckVUaFE0QjQ0?=
 =?utf-8?B?dStCY2l0SUFDcVJsKzZFaW5adE1Oa29USWVMOEkzcGtzdnphTldITE45Z2FO?=
 =?utf-8?B?WHhqVjZuRjhENnhid0EwUnc3NkNLS3ZGaGF1Um5QQnJ3NXJub0ZtWCttR1Ft?=
 =?utf-8?B?c1Q1Q3RYamZuZmVSZVJQbWJwOXBwblVZSm10ODZEZlYyTU51LzZVV1FEN0lC?=
 =?utf-8?B?aFM2YVZCSWd0MzJ5NzRFU25Edlc4a3pidUwxZENLL1RqVHhJVWRybjUwNURD?=
 =?utf-8?B?elN6WUZoSENzSFNRR25IRlg3M09NN21TU1l2TWRNL29NdmwrLzdMaDFXVk1B?=
 =?utf-8?B?VzVSYk8yeXJyZmF4VkNhSWFnUy9DemlZcjY0TTRHS1ptYWxkZmszdllxODY0?=
 =?utf-8?B?akM5dzM1V3lpV2gxZ2t3MnRPbFN2WENjSVB0T3VaK0FMR1F4NDhxRVdEcThX?=
 =?utf-8?B?K2M3MGRtZGk4R2lONEFoZy9KQ1R2WFhvYmZxZG8vNU9CbXJpSHhnZjZMcmh6?=
 =?utf-8?B?bTN3VHdQeE9WRHFLcUJ5NmVRTlBudHpib2V2emVubWNvNllIb09XQTd2aDZX?=
 =?utf-8?B?MGQwYUVKNWcwNE9QTmhyNVBrKzQ4WFFwem41cUdwakxpS3picHA5RnZ3VU45?=
 =?utf-8?B?aWQ5bG5yVndRZklqclcwRFkwcXZyckZldTNQQndmN0wwS0VRd0tmanFMOThC?=
 =?utf-8?B?bFNjQzdVRnZ3aDY0OXBBN2NtUW1wOWNQR1JPNXhUbU1heTNZbkUrTk9rdWY0?=
 =?utf-8?B?OUNOek8xWlRZU0Fva2xTOXdUNXo1QnZoaW05bGFZWUVrWlhjN2VJZW1GL3ha?=
 =?utf-8?B?ejJmT2cvOXF5MTNHaU9xKy9FUjM4bmdvWVgrNzhRcHE5NitTSUFPc0xHMzJk?=
 =?utf-8?B?dzBEUk5HOUlwcVh5SFJiSG1PcjVtYVpBcG1wMWhkTkMrZWxjTk5yQnB1bHpl?=
 =?utf-8?B?bDBSZVc0eVpsdnBXVXlMSlpCUWFVQW1wK1R3OVJDQ2xHeHFpOUtrUEFlYVM1?=
 =?utf-8?B?U3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c65f49e8-b038-4422-f846-08dd9883e7d8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 16:24:05.6762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Bggy1uGy99/zhM0irqNTY7BDPOKMicpRSA8UbNGN3B92YLRwR2Ep3x3m2abEMxXugX546bKrCA7NiPlowzrwGFcinFUabEL40XHGBykFQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7850
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE2MCBTYWx0ZWRfXzo38kHQurdM2 bn9FA1q2lwO2redkHwixWoMdPq/df9mKJzlFIX3v3BsyuMxNyJ8hgxYT+hrNYzoA1sJ3A8bEh89 Cq5CAHYEJN6OERIBh9bWRNsrwAp8OSpKVmC0KKrYj2gV1Iwc//yF6eEC0aICthkmGHSKSBa45tw
 a1XwSnJr3D2eF/DfRcnJb8R1q0JkFNMzjZHWvj70bxrRRGOE8xZlSuWTuswNL9Ty7HYx8S33a4s +vuqNKYqmC29iB37y/WAxhuZ3VJdVw1wNBwwjhgZ9DF+S0h++GpyuXfWn2OckMkuemb6n0Lfd+0 DolV5LDFy35YJek6UNW5Mw7oFfadBxjcdwN+vUTCThbeJq8syqNa/rnQlcIEsJGZyp7oPANT1kw
 QKuBLu2rBiJcI51rbdkIsAdcYS0TD8v4EdlrL8H+48QAFrpGgHjGRydnuVDa2VfD0So9latf
X-Proofpoint-ORIG-GUID: B_-Uj_lfW4erAVyPvfNobdLXtO5UwXlV
X-Proofpoint-GUID: 7-WJMoFRzWmgbmJZgt9AAaRPNfeenSEM
X-Authority-Analysis: v=2.4 cv=TrPmhCXh c=1 sm=1 tr=0 ts=682dfe2a cx=c_pps a=r1LLKbupV3Dgd2n8fS09vg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=YYxr0tlKV7O_ayrIltoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=XN9Ty9q90LuFBGADy4MA:9 a=DmR9M0sFg1PtJRvy:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=ImwWUX5h3JJ3gRE9moBe:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_05,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 suspectscore=0 clxscore=1015 spamscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505210160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 16:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217047

--------------xcRAqHM4zeXFshTvcWlBKdxL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 54L49I6g024267

On 2025-05-21 7:59 a.m., sundeep.kokkonda@windriver.com wrote:

It's good practice to CC the person who asked for a v2.
I've added Gyorgy to this thread.

> From: Sundeep KOKKONDA<sundeep.kokkonda@windriver.com>
>
> The cpymemdi/setmemdi implementation doesn't fully support strict align=
ment.
> Block the expansion if the alignment is less than 16 with STRICT_ALIGNM=
ENT.
> Clean up the condition when to use MOPS. (PR103100)
>
> This patch includes only the alignment-related changes in the aarch64.c=
 file.
> Changes to aarch64.md were skipped due to non-essential impact and pote=
ntial incompatibility.
That's better than not mentioned what parts of the patch you dropped but
it's doesn't *explain* why that change isn't needed or I'm missing the=20
point! ;-)

Please dig a bit deeper and explain:
 =C2=A01. what TARGET_MOPS means and does and maybe what the .md file's=20
purpose is,
 =C2=A02. why was it removed in the gcc-12 commit,
 =C2=A03. why it's safe to ignore that change for gcc-11,
 =C2=A04. Since you are not backporting the MOPS part,
 =C2=A0=C2=A0=C2=A0=C2=A0 it might be nice to point that out in each part=
 of the patch that=20
mentions MOPS.
 =C2=A0=C2=A0=C2=A0=C2=A0 Maybe that's overkill and you just need to expl=
ain in the commit=20
log but
 =C2=A0=C2=A0=C2=A0=C2=A0 think about someone who is just looking at the =
patch and do what=20
makes sense to you.

I can almost understand things better now but
I'll let you present it, step by step, in v3.

> All changes and outputs have been verified by the author.

Is there a test case that covers all of this that starts passing with=20
this change?

Please explain how are you testing?


../Randy


I looked at this a bit and found gcc/ChangeLog-2021 that talks about
the introduction of TARGET_MOPS. This was done in gcc-12 and later
as you have hinted at.

=E2=9D=AF git blame gcc/ChangeLog-2021=C2=A0 | rg TARGET_MOPS
d04ae83244d3 (Jakub Jelinek 2022-01-03 10:18:16 +0100=C2=A0 1214)=20
(aarch64_expand_setmem): Adjust for TARGET_MOPS.
d04ae83244d3 (Jakub Jelinek 2022-01-03 10:18:16 +0100=C2=A0 1215)=C2=A0=C2=
=A0=C2=A0=C2=A0 *=20
config/aarch64/aarch64.h (CLEAR_RATIO): Adjust for TARGET_MOPS.
d04ae83244d3 (Jakub Jelinek 2022-01-03 10:18:16 +0100=C2=A0 1219) (setmem=
di):=20
Adjust for TARGET_MOPS.
d04ae83244d3 (Jakub Jelinek 2022-01-03 10:18:16 +0100=C2=A0 1238)=20
(TARGET_MOPS): Define.
d04ae83244d3 (Jakub Jelinek 2022-01-03 10:18:16 +0100=C2=A0 1239)=20
(MOVE_RATIO): Adjust for TARGET_MOPS.
d04ae83244d3 (Jakub Jelinek 2022-01-03 10:18:16 +0100=C2=A0 1242) (cpymem=
di):=20
Adjust for TARGET_MOPS.


2021-12-13=C2=A0 Kyrylo Tkachov <kyrylo.tkachov@arm.com>

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * config/aarch64/aarch64.c (a=
arch64_expand_setmem_mops): Define.
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (aarch64_expand_setmem): Adju=
st for TARGET_MOPS.
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * config/aarch64/aarch64.h (C=
LEAR_RATIO): Adjust for TARGET_MOPS.
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (SET_RATIO): Likewise.
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * config/aarch64/aarch64.md (=
"unspec"): Add UNSPEC_SETMEM.
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (aarch64_setmemdi): Define.
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (setmemdi): Adjust for TARGET=
_MOPS.
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * config/aarch64/aarch64.opt =
(aarch64-mops-memset-size-threshold):
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 New param.

...

2021-12-13=C2=A0 Kyrylo Tkachov <kyrylo.tkachov@arm.com>

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * config/aarch64/aarch64-opti=
on-extensions.def (mops): Define.
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * config/aarch64/aarch64.c (a=
arch64_expand_cpymem_mops): Define.
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (aarch64_expand_cpymem): Defi=
ne.
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * config/aarch64/aarch64.h (A=
ARCH64_FL_MOPS): Define.
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (AARCH64_ISA_MOPS): Define.
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (TARGET_MOPS): Define.
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (MOVE_RATIO): Adjust for TARG=
ET_MOPS.
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * config/aarch64/aarch64.md (=
"unspec"): Add UNSPEC_CPYMEM.
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (aarch64_cpymemdi): New patte=
rn.
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (cpymemdi): Adjust for TARGET=
_MOPS.
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * config/aarch64/aarch64.opt =
(aarch64-mops-memcpy-size-threshol):
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 New param.
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * doc/invoke.texi (AArch64 Op=
tions): Document +mops.

>
> Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=3Db9=
d16d8361a9e3a82a2f21e759e760d235d43322]
>
> Signed-off-by: Sundeep KOKKONDA<sundeep.kokkonda@windriver.com>
> ---
>   meta/recipes-devtools/gcc/gcc-11.5.inc        |  1 +
>   ...rch64-fix-strict-align-cpymem-setmem.patch | 45 ++++++++++++++++++=
+
>   2 files changed, 46 insertions(+)
>   create mode 100644 meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix=
-strict-align-cpymem-setmem.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-11.5.inc b/meta/recipes-devt=
ools/gcc/gcc-11.5.inc
> index f17ec9da5c..1e8371b2bd 100644
> --- a/meta/recipes-devtools/gcc/gcc-11.5.inc
> +++ b/meta/recipes-devtools/gcc/gcc-11.5.inc
> @@ -60,6 +60,7 @@ SRC_URI =3D "\
>              file://0029-Fix-install-path-of-linux64.h.patch \
>              file://0030-rust-recursion-limit.patch \
>              file://0031-gcc-sanitizers-fix.patch \
> +file://0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch \
>              file://0001-CVE-2021-42574.patch \
>              file://0002-CVE-2021-42574.patch \
>              file://0003-CVE-2021-42574.patch \
> diff --git a/meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-=
align-cpymem-setmem.patch b/meta/recipes-devtools/gcc/gcc/0032-gcc-aarch6=
4-fix-strict-align-cpymem-setmem.patch
> new file mode 100644
> index 0000000000..4c2d827799
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-align-c=
pymem-setmem.patch
> @@ -0,0 +1,45 @@
> +gcc: AArch64 - Fix strict-align cpymem/setmem
> +
> +The cpymemdi/setmemdi implementation doesn't fully support strict alig=
nment.
> +Block the expansion if the alignment is less than 16 with STRICT_ALIGN=
MENT.
> +Clean up the condition when to use MOPS.
> +
> +Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=3Db=
9d16d8361a9e3a82a2f21e759e760d235d43322]
> +
> +Signed-off-by: Wilco Dijkstra<wilco.dijkstra@arm.com>
> +Signed-off-by: Sundeep KOKKONDA<sundeep.kokkonda@windriver.com>
> +---
> +--- a/gcc/config/aarch64/aarch64.c	2025-05-08 20:40:10.969865898 -0700
> ++++ b/gcc/config/aarch64/aarch64.c	2025-05-13 23:11:07.006796627 -0700
> +@@ -23621,14 +23621,15 @@
> +   int mode_bits;
> +   rtx dst =3D operands[0];
> +   rtx src =3D operands[1];
> ++  unsigned align =3D UINTVAL (operands[3]);
> +   rtx base;
> +   machine_mode cur_mode =3D BLKmode;
> +
> +   /* Only expand fixed-size copies.  */
> +-  if (!CONST_INT_P (operands[2]))
> ++  if (!CONST_INT_P (operands[2]) || (STRICT_ALIGNMENT && align < 16))
> +     return false;
> +
> +-  unsigned HOST_WIDE_INT size =3D INTVAL (operands[2]);
> ++  unsigned HOST_WIDE_INT size =3D UINTVAL (operands[2]);
> +
> +   /* Inline up to 256 bytes when optimizing for speed.  */
> +   unsigned HOST_WIDE_INT max_copy_size =3D 256;
> +@@ -23750,11 +23751,12 @@
> +   unsigned HOST_WIDE_INT len;
> +   rtx dst =3D operands[0];
> +   rtx val =3D operands[2], src;
> ++  unsigned align =3D UINTVAL (operands[3]);
> +   rtx base;
> +   machine_mode cur_mode =3D BLKmode, next_mode;
> +
> +   /* We can't do anything smart if the amount to copy is not constant=
.  */
> +-  if (!CONST_INT_P (operands[1]))
> ++  if (!CONST_INT_P (operands[1]) || (STRICT_ALIGNMENT && align < 16))
> +     return false;
> +
> +   bool speed_p =3D !optimize_function_for_size_p (cfun);


--=20
# Randy MacLeod
# Wind River Linux

--------------xcRAqHM4zeXFshTvcWlBKdxL
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 54L49I6g024267

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2025-05-21 7:59 a.m.,
      <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:sundeep.kokkon=
da@windriver.com">sundeep.kokkonda@windriver.com</a> wrote:</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">It's good practice to CC the person wh=
o
      asked for a v2.<br>
      I've added Gyorgy to this thread.<br>
      <br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20250521115945.3629052-1-sundee=
p.kokkonda@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">From: Sundeep KOKKONDA <a cl=
ass=3D"moz-txt-link-rfc2396E" href=3D"mailto:sundeep.kokkonda@windriver.c=
om">&lt;sundeep.kokkonda@windriver.com&gt;</a>

The cpymemdi/setmemdi implementation doesn't fully support strict alignme=
nt.
Block the expansion if the alignment is less than 16 with STRICT_ALIGNMEN=
T.
Clean up the condition when to use MOPS. (PR103100)

This patch includes only the alignment-related changes in the aarch64.c f=
ile.
Changes to aarch64.md were skipped due to non-essential impact and potent=
ial incompatibility.</pre>
    </blockquote>
    That's better than not mentioned what parts of the patch you dropped
    but <br>
    it's doesn't *explain* why that change isn't needed or I'm missing
    the point! ;-)<br>
    <p>Please dig a bit deeper and explain:<br>
      &nbsp;1. what TARGET_MOPS means and does and maybe what the .md fil=
e's
      purpose is,<br>
      &nbsp;2. why was it removed in the gcc-12 commit,<br>
      &nbsp;3. why it's safe to ignore that change for gcc-11,<br>
      &nbsp;4. Since you are not backporting the MOPS part,<br>
      &nbsp;&nbsp;&nbsp;&nbsp; it might be nice to point that out in each=
 part of the patch
      that mentions MOPS.<br>
      &nbsp;&nbsp;&nbsp;&nbsp; Maybe that's overkill and you just need to=
 explain in the
      commit log but<br>
      &nbsp;&nbsp;&nbsp;&nbsp; think about someone who is just looking at=
 the patch and do
      what makes sense to you.<br>
    </p>
    <p>I can almost understand things better now but <br>
      I'll let you present it, step by step, in v3.</p>
    <blockquote type=3D"cite" cite=3D"mid:20250521115945.3629052-1-sundee=
p.kokkonda@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
All changes and outputs have been verified by the author.</pre>
    </blockquote>
    <br>
    <p></p>
    <p></p>
    <p>Is there a test case that covers all of this that starts passing
      with this change?<br>
    </p>
    Please explain how are you testing?<br>
    <p><br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p>I looked at this a bit and found gcc/ChangeLog-2021 that talks
      about<br>
      the introduction of TARGET_MOPS. This was done in gcc-12 and later<=
br>
      as you have hinted at. <br>
      <br>
      =E2=9D=AF git blame gcc/ChangeLog-2021&nbsp; | rg TARGET_MOPS<br>
      d04ae83244d3 (Jakub Jelinek 2022-01-03 10:18:16 +0100&nbsp; 1214)&n=
bsp;&nbsp;&nbsp;&nbsp;
      (aarch64_expand_setmem): Adjust for TARGET_MOPS.<br>
      d04ae83244d3 (Jakub Jelinek 2022-01-03 10:18:16 +0100&nbsp; 1215)&n=
bsp;&nbsp;&nbsp;&nbsp; *
      config/aarch64/aarch64.h (CLEAR_RATIO): Adjust for TARGET_MOPS.<br>
      d04ae83244d3 (Jakub Jelinek 2022-01-03 10:18:16 +0100&nbsp; 1219)&n=
bsp;&nbsp;&nbsp;&nbsp;
      (setmemdi): Adjust for TARGET_MOPS.<br>
      d04ae83244d3 (Jakub Jelinek 2022-01-03 10:18:16 +0100&nbsp; 1238)&n=
bsp;&nbsp;&nbsp;&nbsp;
      (TARGET_MOPS): Define.<br>
      d04ae83244d3 (Jakub Jelinek 2022-01-03 10:18:16 +0100&nbsp; 1239)&n=
bsp;&nbsp;&nbsp;&nbsp;
      (MOVE_RATIO): Adjust for TARGET_MOPS.<br>
      d04ae83244d3 (Jakub Jelinek 2022-01-03 10:18:16 +0100&nbsp; 1242)&n=
bsp;&nbsp;&nbsp;&nbsp;
      (cpymemdi): Adjust for TARGET_MOPS.<br>
      <br>
      <br>
      2021-12-13&nbsp; Kyrylo Tkachov&nbsp; <a class=3D"moz-txt-link-rfc2=
396E" href=3D"mailto:kyrylo.tkachov@arm.com">&lt;kyrylo.tkachov@arm.com&g=
t;</a><br>
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * config/aarch64/aarch64=
.c (aarch64_expand_setmem_mops):
      Define.<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (aarch64_expand_setmem):=
 Adjust for TARGET_MOPS.<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * config/aarch64/aarch64=
.h (CLEAR_RATIO): Adjust for
      TARGET_MOPS.<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (SET_RATIO): Likewise.<b=
r>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * config/aarch64/aarch64=
.md (&quot;unspec&quot;): Add UNSPEC_SETMEM.<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (aarch64_setmemdi): Defi=
ne.<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (setmemdi): Adjust for T=
ARGET_MOPS.<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * config/aarch64/aarch64=
.opt
      (aarch64-mops-memset-size-threshold):<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; New param.<br>
      <br>
      ...<br>
      <br>
      2021-12-13&nbsp; Kyrylo Tkachov&nbsp; <a class=3D"moz-txt-link-rfc2=
396E" href=3D"mailto:kyrylo.tkachov@arm.com">&lt;kyrylo.tkachov@arm.com&g=
t;</a><br>
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * config/aarch64/aarch64=
-option-extensions.def (mops):
      Define.<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * config/aarch64/aarch64=
.c (aarch64_expand_cpymem_mops):
      Define.<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (aarch64_expand_cpymem):=
 Define.<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * config/aarch64/aarch64=
.h (AARCH64_FL_MOPS): Define.<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (AARCH64_ISA_MOPS): Defi=
ne.<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (TARGET_MOPS): Define.<b=
r>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (MOVE_RATIO): Adjust for=
 TARGET_MOPS.<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * config/aarch64/aarch64=
.md (&quot;unspec&quot;): Add UNSPEC_CPYMEM.<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (aarch64_cpymemdi): New =
pattern.<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (cpymemdi): Adjust for T=
ARGET_MOPS.<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * config/aarch64/aarch64=
.opt
      (aarch64-mops-memcpy-size-threshol):<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; New param.<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * doc/invoke.texi (AArch=
64 Options): Document +mops.<br>
      <br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20250521115945.3629052-1-sundee=
p.kokkonda@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"htt=
ps://gcc.gnu.org/cgit/gcc/commit/?id=3Db9d16d8361a9e3a82a2f21e759e760d235=
d43322">https://gcc.gnu.org/cgit/gcc/commit/?id=3Db9d16d8361a9e3a82a2f21e=
759e760d235d43322</a>]

Signed-off-by: Sundeep KOKKONDA <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:sundeep.kokkonda@windriver.com">&lt;sundeep.kokkonda@windriver.co=
m&gt;</a>
---
 meta/recipes-devtools/gcc/gcc-11.5.inc        |  1 +
 ...rch64-fix-strict-align-cpymem-setmem.patch | 45 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-st=
rict-align-cpymem-setmem.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.5.inc b/meta/recipes-devtoo=
ls/gcc/gcc-11.5.inc
index f17ec9da5c..1e8371b2bd 100644
--- a/meta/recipes-devtools/gcc/gcc-11.5.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.5.inc
@@ -60,6 +60,7 @@ SRC_URI =3D &quot;\
            <a class=3D"moz-txt-link-freetext" href=3D"file://0029-Fix-in=
stall-path-of-linux64.h.patch">file://0029-Fix-install-path-of-linux64.h.=
patch</a> \
            <a class=3D"moz-txt-link-freetext" href=3D"file://0030-rust-r=
ecursion-limit.patch">file://0030-rust-recursion-limit.patch</a> \
            <a class=3D"moz-txt-link-freetext" href=3D"file://0031-gcc-sa=
nitizers-fix.patch">file://0031-gcc-sanitizers-fix.patch</a> \
+           <a class=3D"moz-txt-link-freetext" href=3D"file://0032-gcc-aa=
rch64-fix-strict-align-cpymem-setmem.patch">file://0032-gcc-aarch64-fix-s=
trict-align-cpymem-setmem.patch</a> \
            <a class=3D"moz-txt-link-freetext" href=3D"file://0001-CVE-20=
21-42574.patch">file://0001-CVE-2021-42574.patch</a> \
            <a class=3D"moz-txt-link-freetext" href=3D"file://0002-CVE-20=
21-42574.patch">file://0002-CVE-2021-42574.patch</a> \
            <a class=3D"moz-txt-link-freetext" href=3D"file://0003-CVE-20=
21-42574.patch">file://0003-CVE-2021-42574.patch</a> \
diff --git a/meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-al=
ign-cpymem-setmem.patch b/meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-=
fix-strict-align-cpymem-setmem.patch
new file mode 100644
index 0000000000..4c2d827799
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-align-cpy=
mem-setmem.patch
@@ -0,0 +1,45 @@
+gcc: AArch64 - Fix strict-align cpymem/setmem
+
+The cpymemdi/setmemdi implementation doesn't fully support strict alignm=
ent.
+Block the expansion if the alignment is less than 16 with STRICT_ALIGNME=
NT.
+Clean up the condition when to use MOPS.
+
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://gcc.gnu.org/cgit/gcc/commit/?id=3Db9d16d8361a9e3a82a2f21e759e760d23=
5d43322">https://gcc.gnu.org/cgit/gcc/commit/?id=3Db9d16d8361a9e3a82a2f21=
e759e760d235d43322</a>]
+
+Signed-off-by: Wilco Dijkstra <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:wilco.dijkstra@arm.com">&lt;wilco.dijkstra@arm.com&gt;</a>
+Signed-off-by: Sundeep KOKKONDA <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:sundeep.kokkonda@windriver.com">&lt;sundeep.kokkonda@windriver.co=
m&gt;</a>
+---
+--- a/gcc/config/aarch64/aarch64.c	2025-05-08 20:40:10.969865898 -0700
++++ b/gcc/config/aarch64/aarch64.c	2025-05-13 23:11:07.006796627 -0700
+@@ -23621,14 +23621,15 @@
+   int mode_bits;
+   rtx dst =3D operands[0];
+   rtx src =3D operands[1];
++  unsigned align =3D UINTVAL (operands[3]);
+   rtx base;
+   machine_mode cur_mode =3D BLKmode;
+=20
+   /* Only expand fixed-size copies.  */
+-  if (!CONST_INT_P (operands[2]))
++  if (!CONST_INT_P (operands[2]) || (STRICT_ALIGNMENT &amp;&amp; align =
&lt; 16))
+     return false;
+=20
+-  unsigned HOST_WIDE_INT size =3D INTVAL (operands[2]);
++  unsigned HOST_WIDE_INT size =3D UINTVAL (operands[2]);
+=20
+   /* Inline up to 256 bytes when optimizing for speed.  */
+   unsigned HOST_WIDE_INT max_copy_size =3D 256;
+@@ -23750,11 +23751,12 @@
+   unsigned HOST_WIDE_INT len;
+   rtx dst =3D operands[0];
+   rtx val =3D operands[2], src;
++  unsigned align =3D UINTVAL (operands[3]);
+   rtx base;
+   machine_mode cur_mode =3D BLKmode, next_mode;
+=20
+   /* We can't do anything smart if the amount to copy is not constant. =
 */
+-  if (!CONST_INT_P (operands[1]))
++  if (!CONST_INT_P (operands[1]) || (STRICT_ALIGNMENT &amp;&amp; align =
&lt; 16))
+     return false;
+=20
+   bool speed_p =3D !optimize_function_for_size_p (cfun);
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------xcRAqHM4zeXFshTvcWlBKdxL--

