Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5D31E77197
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 09:41:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.43999.1736415702680942424
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jan 2025 01:41:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=31047a590b=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5096kaHN005376
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Jan 2025 01:41:42 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fkp9ksy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 09 Jan 2025 01:41:41 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5099ffOC000723;
	Thu, 9 Jan 2025 01:41:41 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2044.outbound.protection.outlook.com [104.47.70.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fkp9ksx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 01:41:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ynp3IkS3UM2BsdCAFKcL4sc8QnYhaMZEjIxVVUJS6J5WxVUY59PoIQolIG7K9Krfrj3M/Idy9liYgmbALn39N3486A695hYLNUPQYZY7JeFSwptcl6MDL5W7IQIhzLJ3FUVNUR3qltBve8Yvt+yEL4R4N0BrWhc1OsaGvTFWvi5f+DW9KpxzD77QhP5Zj+QWfDkJn5grdwXm5TQsOo8Qgiy8QwfTKvbkefNfR94bUEMd0al2lhUiqhmCI3ydyMZg/ehOCOs34aCZzICuXR+ltoHpFdbBjy3oECKui067AJuWukmrZ8QDE275Gj+q2oXfARync5ibq1dSXJmoSUrJvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGuU/xg64G4fA9IRsWfAZlUF/C65aeWANy3myrGjER4=;
 b=m/d/GP4/l9A8ma2DyLOS4mFosvGrXHf4Hy6PzQaXX4rVeUkT/3AUmg/r9fUADBt2jCsz/MtWaeL+4F0RuwGksG51C2yX9kyHW4HyAI3DNFsB+mFRx0YDDH+bvU31+kW4RwzNwWT5N0biyfL8kSU+eeO/0ZzqRR8HPpZ0ZWOsbsHCU3OF5pAUAK964gYY1PEEcidFUri2TfuNOQSP7pmYdGplCkYO4R8wDmcDJfRxzi2Yh1uXd+7mBdHh5WHGsL5v/ZZ6JnMAVwkL39iOI1nGW39RgAbaV0J0+VpJ2bf+vaBXddg52MVzKuQj7pRyDRMDAmHEfVHh+Cys+Cq+CkihJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SJ0PR11MB5868.namprd11.prod.outlook.com (2603:10b6:a03:42b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 09:41:37 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%4]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 09:41:36 +0000
Content-Type: multipart/alternative;
 boundary="------------Nz0raH7S5YzsUy13gk4St7YD"
Message-ID: <482e4d78-917a-49f8-958c-4a4dbeeca056@windriver.com>
Date: Thu, 9 Jan 2025 15:11:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/3] rust: Fix for duplicate libstd.so
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
        Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20241227065337.1257972-1-Deepesh.Varatharajan@windriver.com>
 <20241227065337.1257972-2-Deepesh.Varatharajan@windriver.com>
 <CANNYZj-8a-wb6PUbqm=6MUj6jUVWJYcwcZ6X_TbkDkH9s1Q8DA@mail.gmail.com>
 <bbe79a18-0e94-44ae-81a6-bd8088f84da8@windriver.com>
Content-Language: en-US
In-Reply-To: <bbe79a18-0e94-44ae-81a6-bd8088f84da8@windriver.com>
X-ClientProxiedBy: MW4PR02CA0003.namprd02.prod.outlook.com
 (2603:10b6:303:16d::30) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SJ0PR11MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: b92deca6-1e2c-4c88-6200-08dd3091cfa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Qkh6L0p3TTFmYzZ5M3FrMWxDaXVZTTV4VzFVVjBScElvRDRSR2hLNjludThV?=
 =?utf-8?B?NEJya01uai9BSERWSjZMMVpoTEt4RlpKSWYzL0pDbW5NRG5GWEk5U1l5UkIw?=
 =?utf-8?B?L2p6STdSU3YwaTc1aDhQNXFhZk1GQWcxamR1Y2RjSktaNFpDRVhiY3UvcUdK?=
 =?utf-8?B?eFExT0p6UDFOVExmWi95T3JxVnpYY1d1R29sbDZWNG5pN25MSlIyQnhORXFX?=
 =?utf-8?B?TlYvTjQxNkRnVGxQWFAwblRiaFZWL3UxRXV2UlNZNEZ6QnE2WUdHTXhNQ2Ni?=
 =?utf-8?B?d2Z2dUtkWkg2Z3JNQndCR3RMMFhxQ2Y5bFpNNUVMWmNsVmZMZ0h1dE11MG8z?=
 =?utf-8?B?MzFHSTdSaUpzOUlyT1crYjkxYlZ0ZEZqS2J5Z0VKaEh6MlVPcytlaEJReXNS?=
 =?utf-8?B?aGQ2cEJ2RVVud1BaYzEvYit3OHdxeWpiTm1rZnFrRUxzSzFzYnFES056OUpW?=
 =?utf-8?B?Q2lOZTFkajBWbnN2NnQyWXBqbkxHYm1EeCtBQUdEaGc3Z1ZCTURKaTdZVHpG?=
 =?utf-8?B?VEpsSmJNM1psVTlSNGNpUWowRHNwc1R4SXhxWjcyVmMwbVg3dzVYekRLOVFC?=
 =?utf-8?B?blVDbktUaTRwTGhlTHNNKy9yZ2ZjSnhJektSSGhlSGxxR0ZHU3NEeE5LYmhr?=
 =?utf-8?B?WEVCM2d6YnlxYmpUcmY2eUtZZk9vanFrejVZTnNvTmxBYUJjc2pWWUFhQk9U?=
 =?utf-8?B?bW9vTkhBaVpDbi9LYnN0VDNWNit0SUswdlJtSVRUQUx5cHZLWTVFYU9KTmU1?=
 =?utf-8?B?NlYrSzJuUHhNZkF6eTZOK1YwbWFWT2VCWVN5VDhoQ3NwMGxxbzNZSWcxZVU5?=
 =?utf-8?B?REtrZHphMFN6Um54dTk0QkhpbzA5YmNWRVE5bXZneG1UMU9qNVZXbDBjMXlO?=
 =?utf-8?B?YlNZN3o2RmhTYjRnbFNUV1V0aHFVNkszUWdUS0FVTmVnYlZhZkFJLysxd1g5?=
 =?utf-8?B?cE92T0dmS2FsSEVPa3ZPYUlWSXdPZkFVYUpsUW85cVdWQnZEZmNOb1dlU3gw?=
 =?utf-8?B?dERvK2Y1TU82SVF1NmoxNlg2S3NaSktSRFRLNlV6a3JnTjM5cmpkWWhZb2lL?=
 =?utf-8?B?eVZZY1FDNjhYOE0wUlFZQXYwZVZKZUtEeUx5VndQckJnUW9GRE9Bc3RLSWJk?=
 =?utf-8?B?ZVF1V0lSdGliYTlpRlV1R1VYTmpBdGhlektvRCtpSWRMOGhNL2h5NzhmTzlk?=
 =?utf-8?B?RjJRVHRkY1M3RjNRY2tlVy82cGdva2NnTzQ5OXdjWHBpN3RPVnorNXpFa2tz?=
 =?utf-8?B?SHB2M290N0lGMGYzeG5yc001SWxXV0JNR2g0RFJIT1d1RFhrNEN4TmRlWkZh?=
 =?utf-8?B?VHNST25JbDh2T2lPaTN5OGcxekNtL1BETEN3MmhQVlRKak9OL3diOS80V3dQ?=
 =?utf-8?B?NDVBNUtZbWtuMEYzQnhhdG1mc2VIOE9CWUN6ckZTcytwZDMyOG9mTzBhZjJk?=
 =?utf-8?B?TXZSTnh4R21OOXRVMStyMStTWGs5Z2dXWU94T1lnVEpxQVdnNWZoNmJJUFF2?=
 =?utf-8?B?ZU1lUlhRaExjREFuL21Zd3VTVE1VSEhPUEtqV0k4dkhCc3VZREl1MFkwV3R3?=
 =?utf-8?B?dGFMcElUK3FOWkY4blpJbEJiMmlrZng3dG9nMnFkUVFPQzB0V3ZmMzdISCtC?=
 =?utf-8?B?bDV3T3FhVmIzejZJallxblpHVXBOcmpmTGs4Z3hnb29ReWFsYzkvYmpOWUcx?=
 =?utf-8?B?RlVqL1oxdkMzN2lQWmV3MWdESitrdGxjZXUrMExZclcxY0dUSm0xOEZUQXM1?=
 =?utf-8?Q?XSHehDyaL4HYrZ1MP58dPlPAKz3IZNa3holFi5m?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z2wxNVRqYVdncGt6QzhEYlU1RXV3WXB3TUZScmVwRThjckx3RWp6blJ5aDhw?=
 =?utf-8?B?OCtScG16T0paOFVYU0RleVZqMGNDWExuSHd3dlRWWkRFbEcxK0Rvb0FTeXgw?=
 =?utf-8?B?czE1UlZZMytRT2YzM1FlUVlrTjBsWC9ITUxhM2Q0Zkl2c1owSXhmU2xxQ01n?=
 =?utf-8?B?WVA5dXU0cVMrdXlQVjZFSGJIMi9ySDhIdTBJMTRCd3U2Z0hDV1VETmFmTnJ2?=
 =?utf-8?B?eDFDZHhDSVpSYk16WEdwTEczVEV3T0V5WExpdkplbmo4T0xxdXR0Q3RIQUtR?=
 =?utf-8?B?cTNqY0l4THc4SllUWjZvZEsvTDlBdE5kQWtIVmhobTUwZVFNMHNhMFNhZUZ3?=
 =?utf-8?B?V00vUUowTS96cVhNTjNMMXJhWElqR2FYdDRlYWRLQVJnMXl2L05Ddk1INzhx?=
 =?utf-8?B?R1BJVEQzd2w4ZVY1akZ4N0REdDJxcmI3MWtQNnF5aWFUNEZKOXZIS2hvbGFG?=
 =?utf-8?B?WkNYbE9CRWk4MnlxMzhOUzF3cENoVDNmcjBOVXduQUVmbFRxVE9JbXZBRzFN?=
 =?utf-8?B?YVYvKzQ2TUdydis5OXdhM1RnaFV2cEwwYUFIcmlkTjVYTTVyS21nOUlWd2gz?=
 =?utf-8?B?QXltd1NsclRwZHRTQU1ESmNtYmdENFJkbzU4dDF1RXFJZktTSDk1UXRONFk3?=
 =?utf-8?B?MEoxUnNXdGV0TWh2aTNvNWY4Z3dtbGRtbDJJU3kzOW5zeXAyb3NJY2llUzgy?=
 =?utf-8?B?N3FBNE5JV2h1bFRUQzRDblptNzRmd1FtSEdBNFU4SFgxQkJNb2hsemw4SW9p?=
 =?utf-8?B?YWxpc2hyd2paYXF4RE5hZVJvbGNaMi8zTU5uYXozNjJLQ3VTbXgrZnd2cHBS?=
 =?utf-8?B?RFlzLzZsWWREYUMvOXBPVFBHOWRyS1JQQUphLzhlODBNb3oyRFN4U3NjWHZI?=
 =?utf-8?B?WmFHMExScWUvc3Z2RWliV2NaNjBzWEVyT0dUK3RBbWZhYnVlWEU2VlMzODJN?=
 =?utf-8?B?UEphWWhQNVhIZVB1VWo0TlR0eFM3ZWN0QTVvaUpIZFpid1pReW1ya2xqV3Rj?=
 =?utf-8?B?STd1VFZFdWRtMlRnQnFHVXhGMFI1SzBsUUljMkZVbW42cjVBeW51WUw4ZjY1?=
 =?utf-8?B?WFI5TFpZT3o0SHY4ZnZZTXRyKzNXMXBleW9RbkNKc3dKNW1FcEZ6c2QyMlcy?=
 =?utf-8?B?aUVmakZXSUZOZWlEOGdqUVRHa1ZiTHpjS29TdHYwNmdtSDRiRnBmQm9kLzdG?=
 =?utf-8?B?N0VxVVF3M2hXemJ1bmRxTkZRMVU1cHR2Mk1TZ0IvbU1SRW5EV0N0ZEpSd2h1?=
 =?utf-8?B?dzRlUDloUmRGSjRSTmlvb0gwTmZBU1R5WGpJRlBFTXpiMDhYSmMvQUZpUk9k?=
 =?utf-8?B?Z3ZEQXRwN0VjdXBOUWRSZVFJMllJVjNWcUFhMGQyYnJFRWlBVlJxSG0xRUh3?=
 =?utf-8?B?cTRwYmp4S2RXMWdMVWdrVGQwVVBJeElUK3g2NTBQMFJIQzJIK0dBbGV1M0tT?=
 =?utf-8?B?ck9vYXhCVW5qRjRUUUhLM3VpM1ZoVXdRS0Y5OHhOc3VoZlJMWFZoV1ZhcmNz?=
 =?utf-8?B?ZTFGekVNc01GNVl5RkJ0ZmhkUE9UeVh0M095NE15VDFVcWZqa1duS1B4b2dS?=
 =?utf-8?B?SHJCT21xN0RXd01jU3dNazVmck44aTRmZlBWZGhVMzN3UHkxWGJmNk5YVnpM?=
 =?utf-8?B?NkQ0UXR2RU1Kb2g4UklmTG11TnhOaEd5N1dpNWREYlo5QlBTVG1mbDBCNzV6?=
 =?utf-8?B?NGpxYlJCVENLdWRHdlpBaHBDQ0JWQmdpNDY4c280T05KdzFEQWZxTTZqTE9i?=
 =?utf-8?B?QlJJaFRtSUJLaUc0M2hNWFd2YVJBUGVVdDg5T2ZxaEhySEkrUjZUVzJ0TVlp?=
 =?utf-8?B?TVdNVHU2SEQycDJuOWJPL0pqWHJhNDlnVUFaeGdxWEdBVm9aVlJrbWxueWlm?=
 =?utf-8?B?ZGVBMWZ4QzJtSXBka1hNMkVuOCs5bEZaWjJoUnkyL3E3emVXVEtpRkhWcnly?=
 =?utf-8?B?cGVmTFdCQkZzQmFMMzZXeFBOb2NDaGNLaUo2bWthT2ZRbndSdEZyQVFSM1gz?=
 =?utf-8?B?ZWZ1c2JjVTZaRDhXSHc2UVVEbzB5ckNDU0ErSXhuSFJSREcvaitwMGtEN2dM?=
 =?utf-8?B?Z016ek1ZamQ3cXhmSXZNR2lXOGNHRm1pbU9rSjV3TjZ1TW9vcmNTY3BmTFVB?=
 =?utf-8?B?Uk1kVDlHc3cxK3lUUmR5cnVBYjN5bUEyWFFFZk1DK3dwV2tuNTZQR0Y5UVFm?=
 =?utf-8?Q?9YXt3Fa3smN2MqUGCP0VSfI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b92deca6-1e2c-4c88-6200-08dd3091cfa1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 09:41:36.9162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0qE8Q6uf/kA0AG/zb5KI9NrvtqFD8PN4Nk15KbnIwigPYX4okB6c/jO5nkjfqegreUTZ83srIfT3xcyyzqc2mChIEuiUW6tBA+/S6IKY+197CROhsjUVPiYDOTlpzhpP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5868
X-Authority-Analysis: v=2.4 cv=XZxzzJ55 c=1 sm=1 tr=0 ts=677f99d6 cx=c_pps a=zz2QubYGG/9FVtTd3zWqHQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=EgjA6SED1V3569uzDyoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=LVVdaqqDU9W9cF4QaU8A:9 a=Ix0I0cpiQcRZsnKK:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Ixap-4WUQ26rvDz1ZiD2H9a_W5BHYMG4
X-Proofpoint-GUID: WjkXGis-co9fRNF89fcd0BbJ2empsTZU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-09_03,2025-01-09_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501090077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jan 2025 09:41:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209623

--------------Nz0raH7S5YzsUy13gk4St7YD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5096kaHN005376


On 09-01-2025 15:04, Deepesh Varatharajan wrote:
>
>
> On 28-12-2024 00:26, Alexander Kanavin wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender=
 and know the content is safe.
>>
>> On Fri, 27 Dec 2024 at 07:54, Varatharajan, Deepesh via
>> lists.openembedded.org
>> <deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>>> From: Deepesh Varatharajan<Deepesh.Varatharajan@windriver.com>
>>>
>>> The `do_package` task fail with below error due to multiple `libstd.s=
o` files installed in lib dir.
>>>
>>> ---------------------------------------------------------------------=
------------------------------------------------------
>>> ERROR: rust-1.81.0-r0 do_package: rust-rustdoc: Multiple shlib provid=
ers for libstd-20c3de2d9292cd03.so: rust,
>>> rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.8=
1.0/packages-split/rust-rustdoc/usr/bin/rustdoc)
>>> ERROR: rust-1.81.0-r0 do_package: rust-tools-rustfmt: Multiple shlib =
providers for libstd-20c3de2d9292cd03.so: rust,
>>> rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.8=
1.0/packages-split/rust-tools-rustfmt/usr/bin/rustfmt)
>>> ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for =
libstd-20c3de2d9292cd03.so: rust,
>>> rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.8=
1.0/packages-split/rust/usr/bin/rustc)
>>> ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for =
libstd-20c3de2d9292cd03.so: rust,
>>> rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.8=
1.0/packages-split/rust/usr/bin/clippy-driver)
>>> ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for =
libstd-20c3de2d9292cd03.so: rust,
>>> rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.8=
1.0/packages-split/rust/usr/bin/cargo-clippy)
>>> ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for =
libstd-20c3de2d9292cd03.so: rust,
>>> rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.8=
1.0/packages-split/rust/usr/lib/
>>> librustc_driver-fc36770e343ef852.so)
>>> ---------------------------------------------------------------------=
------------------------------------------------------
>>>
>>> To fix the redundant `libstd.so` files are removed from the usr/lib/.
>> What installs the redundant files in the first place? Shouldn't it be
>> adjusted to not do that?
> During the Rust build process, multiple copies of libstd-*.so are=20
> generated, as Rust copies the
> required files from the stage2 build artifacts to the target image=20
> directory. When these build
> binaries are copied to the image, Yocto's do_package step encounters=20
> an error. To resolve this,
> the redundant libstd-*.so files are removed during the do_install step.

Sorry about the above format

During the Rust build=C2=A0process,multiple copies of libstd-*.so are=20
generated, as Rust copies the required files from the stage2 build=20
artifacts to the target image directory. When these build binaries are=20
copied to image, Yocto's do_package step encounters an error. To resolve=20
this the redundant libstd-*.so file is removed during the do_install step.

>> Also, as noted elsewhere, you cannot hardcode 'poky', or special-case
>> based on TCLIBC.
> Updated the patch
> https://lists.openembedded.org/g/openembedded-core/topic/patch_v2_2_3_r=
ust_fix_for/110513058
>> Alex
--------------Nz0raH7S5YzsUy13gk4St7YD
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 09-01-2025 15:04, Deepesh
      Varatharajan wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:bbe79a18-0e94-44ae-81a6-bd8088f84da8@windriver.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 28-12-2024 00:26, Alexander
        Kanavin wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:CANNYZj-8a-wb6PUbqm=6MUj6jUVWJYcwcZ6X_TbkDkH9s1Q8DA@mail.gmail.com">
        <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Fri, 27 Dec 2024 at 07:54, Varatharajan, Deepesh via
lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:deepesh.varatharajan=windriver.com@lists.openembedded.org" moz-do-not-send="true">&lt;deepesh.varatharajan=windriver.com@lists.openembedded.org&gt;</a> wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">From: Deepesh Varatharajan <a class="moz-txt-link-rfc2396E" href="mailto:Deepesh.Varatharajan@windriver.com" moz-do-not-send="true">&lt;Deepesh.Varatharajan@windriver.com&gt;</a>

The `do_package` task fail with below error due to multiple `libstd.so` files installed in lib dir.

---------------------------------------------------------------------------------------------------------------------------
ERROR: rust-1.81.0-r0 do_package: rust-rustdoc: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust-rustdoc/usr/bin/rustdoc)
ERROR: rust-1.81.0-r0 do_package: rust-tools-rustfmt: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust-tools-rustfmt/usr/bin/rustfmt)
ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin/rustc)
ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin/clippy-driver)
ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin/cargo-clippy)
ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/lib/
librustc_driver-fc36770e343ef852.so)
---------------------------------------------------------------------------------------------------------------------------

To fix the redundant `libstd.so` files are removed from the usr/lib/.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">What installs the redundant files in the first place? Shouldn't it be
adjusted to not do that?
</pre>
      </blockquote>
      <span style="color: rgb(222, 226, 230); font-family: system-ui, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(36, 37, 38); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">During the Rust build process, multiple copies of libstd-*.so are generated, as Rust copies the</span><br style="box-sizing: border-box; overflow-wrap: break-word !important; color: rgb(222, 226, 230); font-family: system-ui, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(36, 37, 38); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><span style="color: rgb(222, 226, 230); font-family: system-ui, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(36, 37, 38); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">required files from the stage2 build artifacts to the target image directory. When these build</span><br style="box-sizing: border-box; overflow-wrap: break-word !important; color: rgb(222, 226, 230); font-family: system-ui, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(36, 37, 38); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><span style="color: rgb(222, 226, 230); font-family: system-ui, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(36, 37, 38); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">binaries are copied to the image, Yocto's do_package step encounters an error. To resolve this,</span><br style="box-sizing: border-box; overflow-wrap: break-word !important; color: rgb(222, 226, 230); font-family: system-ui, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(36, 37, 38); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><span style="color: rgb(222, 226, 230); font-family: system-ui, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(36, 37, 38); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">the redundant libstd-*.so files are removed during the do_install step.</span></blockquote>
    <p>Sorry about the above format<br>
      <br>
      During the Rust build&nbsp;process,multiple copies of libstd-*.so are
      generated, as Rust copies the required files from the stage2 build
      artifacts to the target image directory. When these build binaries
      are copied to image, Yocto's do_package step encounters an error.
      To resolve this the redundant libstd-*.so file is removed during
      the do_install step.<br>
    </p>
    <blockquote type="cite" cite="mid:bbe79a18-0e94-44ae-81a6-bd8088f84da8@windriver.com">
      <blockquote type="cite" cite="mid:CANNYZj-8a-wb6PUbqm=6MUj6jUVWJYcwcZ6X_TbkDkH9s1Q8DA@mail.gmail.com">
        <pre wrap="" class="moz-quote-pre">Also, as noted elsewhere, you cannot hardcode 'poky', or special-case
based on TCLIBC.
</pre>
      </blockquote>
      Updated the patch<br>
      <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/topic/patch_v2_2_3_rust_fix_for/110513058" moz-do-not-send="true">https://lists.openembedded.org/g/openembedded-core/topic/patch_v2_2_3_rust_fix_for/110513058</a><br>
      <blockquote type="cite" cite="mid:CANNYZj-8a-wb6PUbqm=6MUj6jUVWJYcwcZ6X_TbkDkH9s1Q8DA@mail.gmail.com">
        <pre wrap="" class="moz-quote-pre">Alex
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------Nz0raH7S5YzsUy13gk4St7YD--

