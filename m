Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0F5ED6EC07
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 13:09:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.115557.1732885746701006871
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Nov 2024 05:09:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2063b2c209=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ATBe1eV004124
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 13:09:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43671at4sw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 13:09:05 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4ATD7seM002426
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 13:09:04 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43671at4su-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 13:09:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aj5hXsFs+8+Y2Hib22Yly7i0jltQPsAgiBSAe5cGHNoe3DKc+syt0qIbzfSaMXgkv2rbHINVsRjLFMpAQLc+gxx28zbPzGhXeMutA1em6CgIJs+oxwDdyRMDiZuqJtuRstFApzObOZCJ/ukTmM71HAJTp/xxu0esOKv6u2cOwcieY8Nz254UL73bmaagtWbZ46AqLYiqvnMwkgg6iSkz0Dn/HDwgMtNaLfXGO6LggbVix+cop7t2zEZd0OMG8thJ74HwYWJZDtc7DVVuHSZtD/Un1rsjU9nQCiI1L/OOEiq766KfgJbTa6b4V1hTBxFPM/ya346odJh3XeaMtrIeVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RhoVp7f73To5ripUqRkgS9CeCV1iNjdCBW/dFuRExLc=;
 b=vtmIYA5PsxLEA9Cg9mWPCX0qLK8ZKZz1uYTc6jU4IWvzWtcnBgtkgalW68vxYTrdW3jFlF7pb9fK7qwUkOXsE4NZVFwnqmmCuPvxgJkzMO0971su8sJIhvukhbS9KXCmpaa6hqYWY/TFi5ySNdscmd8T02afNcsOSXiQElAEr2dYKShB/dMy/HZm+CJ5DhWuRKZjlOVyULX9TvxYWHEehtkI92hnoyfv8PWiOvCsL+UO/bvG5ed+YeisEbMh9/VlJpYBQ4OrqnuT4TRHeDnBCiIO+hEiqzgxdgq+92qtCIFINMcNkzXoq6HlP/bOjXcjNkVtmCtrs7jvUT+OMPT0eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by PH0PR11MB5207.namprd11.prod.outlook.com (2603:10b6:510:32::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.15; Fri, 29 Nov
 2024 13:08:59 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%3]) with mapi id 15.20.8207.014; Fri, 29 Nov 2024
 13:08:59 +0000
Content-Type: multipart/alternative;
 boundary="------------2hQB585sd7zmLeNJ1cPwNm7b"
Message-ID: <5138cb18-0faa-4f87-b803-8d6ec253f5d8@windriver.com>
Date: Fri, 29 Nov 2024 08:08:57 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [AUH] valgrind: upgrading to 3.24.0 FAILED
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org
References: <0101019341233958-bc9f112c-fcff-4f31-9543-aaf8d865ccfe-000000@us-west-2.amazonses.com>
 <CANNYZj8w-pNwEMw4QkX9YR6mqLLBQmd_O5fhq+0P8V0rk2MWEg@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CANNYZj8w-pNwEMw4QkX9YR6mqLLBQmd_O5fhq+0P8V0rk2MWEg@mail.gmail.com>
X-ClientProxiedBy: BYAPR08CA0009.namprd08.prod.outlook.com
 (2603:10b6:a03:100::22) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|PH0PR11MB5207:EE_
X-MS-Office365-Filtering-Correlation-Id: e3fd7f47-384a-4143-cca4-08dd1076fcf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|4022899009|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NTlLRDVKRGd1RjlnZjR2L3NBNUdzeEwzSlJSY2hKdnkzbHArVlc3bFVkamFM?=
 =?utf-8?B?QlcwZ2o3Zi9DVXE1bWp1R1FZVWV5b1JtQW5HVlRYOVN4U210aXo4L1ppS2Rr?=
 =?utf-8?B?ZHJvMnk3QjI1VFU5UEw1UzlUOHArQnlUNmNpKzFsYWhWZ2o5bFhBZE1NWGNr?=
 =?utf-8?B?UldMTjZQZGFYQ0JoWFJPdHlCdHF2WHl0MEpZWWJhSitJUklQNW5RNjRjWG1n?=
 =?utf-8?B?cW9BdU1YdE05SXJFcklGdW1TN2VZYnBrV2p0QkF1YlJxbW1TbHZWa01zeFFD?=
 =?utf-8?B?NVRBNXord2o0OUk5VlZPd3ZlVXNpVVZpeGI3eVc0VVlEbWhSc21mNFZ4MVpz?=
 =?utf-8?B?RzF5OEYzay8xMkcwVHlzUGROMVhFUC8wSVM3TDNpWHlSNHZyWFpGNGxsUGxI?=
 =?utf-8?B?c2dQTUFvWGNJU1hLWGdzeVRNQ284aGpHQi8vOUZTaU9sdXVsT0RPcTZHeGRY?=
 =?utf-8?B?SkZuMGtvbDNxeEhBZzVYVW9jZEk1VjVDRVdTcWJ1cWJ6TVpNaWVHN2VPY1Y1?=
 =?utf-8?B?bjRrRXJiN242UUdBZ3k0SVVTN3dOZmlCU2JMMjhVV0VVMGJoTGxWM0FNRVZz?=
 =?utf-8?B?bzRIa1VNaFFxb3NLK3ZWVUZUbno2anV3T1EzWVQzUTdpQXJZV3dwV3dlNDIz?=
 =?utf-8?B?a2c1Z3JUa211dkhjNk1rRUpETTBTeEwyNDNZUlBDY1JWU3R2R0d5U3lKTFR0?=
 =?utf-8?B?TTRma05wVjdIbU9aVk9HUmovZUJha0VTRVhwN2sydVBUdndxZGxncncrV3hk?=
 =?utf-8?B?QnBHd2ZzRERGbnRYTDNveTlQT2NUT2JwcFRmVTBjeFFBNTdEWG5IVnBHRVlV?=
 =?utf-8?B?aFVhQ2FtNHVRSWVFMURoT05SL2JDTmdBQVp1MGs5b05tdVdFY0piSU9FNWhX?=
 =?utf-8?B?OFR6YTBvemFKWmlvc2tXRTVGUUxaOERZZXdXTzFjUDlFeFhVTUNkR2lmcTZn?=
 =?utf-8?B?QzJaeERzSFgwUWNUVVhKVkM3U0EvMTEzYjNTSkFOTGJpczRLSVJEUzhqODJw?=
 =?utf-8?B?UDB6MjRPMC9HVDdPVzg5bFRMbmxEeC9RRG01YWFHWHdjbEVLZnZTeVIzbFY4?=
 =?utf-8?B?clRObkxJaUJQdnlPdGtxYklnOUhhVFU3aXBaU1RoaE1IWHkwOVRkOWxDTEhL?=
 =?utf-8?B?Ukg2UWhDT0dQRU80d3NlQkg4cVRBeklpNDE5eWVOZUNUYXd5RU9DZGkxMlVN?=
 =?utf-8?B?VTZ6MGpFWTZ0cURMNFpMbTR2c21OWUFHU3Q1dXA2UWhockhRdEkxbjJUcUg0?=
 =?utf-8?B?U0pSM29VTWlFY1dMdHJrK2ZFU3Q5bCtZRmdibVAxb2hxdTVpNjBiRFMvNWlN?=
 =?utf-8?B?Q3BpYjA0cDdrcmN4a2tRYml1RDFXanFBMXRjbXMvZS80YjdmeDdWMWVKa0Jr?=
 =?utf-8?B?K0NKSzhydjRyS0lCajEzZjU0YVJOT25LRUwzYnFIaVZiYjd5MzZyWThsUzVT?=
 =?utf-8?B?MndkeXpuSk5sOW5HdTFLZ2JGOFExcHZNbjBQRmpSM0FlNkRwK0RvZks5UHY4?=
 =?utf-8?B?SER0eVpqcWtNSkdtU3R1Sy9CRnlpNVlQTmF5OWJwN0h6RzF6NGNXTXB5NmJ3?=
 =?utf-8?B?b1o0VzZUb3JLWXB5ekIxZmdBN0tVN20wVmJpSUZaV0xkZHBuamYzemo5T3Ro?=
 =?utf-8?B?QjEyNDlvRFl6UVQxczlPdDV2SXBwdW1jbmt6T0NSaXZSYlZSMFpOTmtKdTlo?=
 =?utf-8?B?U1UyNkx3cjVTQmZMUSt1d1cxV0FPMzZ0MVplRm5xamx3RWVzTzgwWERDOUx2?=
 =?utf-8?Q?RWCtiV2nAmx7JS7DzQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?czZXZnUrZzZZbG1xc1haeWxnd2dWVEtNdVp3RXZEWU1jYmk3c3BkUDl1R081?=
 =?utf-8?B?a1MzOVhhSnV6bXpkUjliYlpGS0hEUk4vY3RWQkpuY1JCRStENkY3ZUNtOVNX?=
 =?utf-8?B?MldZZEswUXhuZ1ljZ21IKzdBYWxaYWEwVEdoYmtmdTBXQStrNkRuL1liRi80?=
 =?utf-8?B?cVh1K2t5R1o0d2I0cnRuQ2JTWThPUmx5eVdlNXVBcHBkNjdKcncvZFZNYUFF?=
 =?utf-8?B?WXd4NHFlRlFyOFJvOHowNjRMTGNtT1RIRWJlZjBzZXVVTmlhOTRGdnJxYWQ3?=
 =?utf-8?B?Q0FrR2F0NWJ3akNOZHVzUHZIbUtmRG80RkFvMDBtZVFyRlprZE1LamJKa3dU?=
 =?utf-8?B?VDFEMk5Iblo4c3kzaVh1MlNITzdheE8zKzE4dkNjaXkxSWlrSUk2UUdIeU9r?=
 =?utf-8?B?T1k0V3NtWG4xTElpWDFIQTBFQktuVHlXWmwxWjRJRzBOVGYvbTJNOUNqbHBV?=
 =?utf-8?B?TTdva0FLRWN3RjdnYkF0U1BOM2tOdXBKdFRzUkYvd1B5V0lpOGYrVEpsRlBP?=
 =?utf-8?B?d3FHb3pxNSsxNnEzaDlTakt4bU5jdlFxdW9MTkpVTmRiU29YSVBBUE10RjFC?=
 =?utf-8?B?Zjh0NFlpSUpLakVKbFFPV1FZWGZUTDZXR1N0M3ZZRTBpdlkzck9oeU01SEdR?=
 =?utf-8?B?eFFENVQ3b0loT2Q1dDlHOUFWYmZHcjJkcmZlWi8wOU9ZRDZDSW56R0xtY2ht?=
 =?utf-8?B?QXRad01icFZqaFpiMGNHWk1hWmNOSWlJUngydmpWZm4yWXNVRm1qZ3B0WGdu?=
 =?utf-8?B?L0h0ZTJBUzBMZmg5Z3FtbmEyaTg1ZmV5ZFVoY1lzdXQ2VDJseEhlRHlzV04r?=
 =?utf-8?B?MkR0aGVBOXNVbW9OUHh5RUgzcHV5Nm5WYWgwQkVueFZJVTc5NGZUMUN6emUr?=
 =?utf-8?B?b3dMZkkzWm9KY1VvcGNndFBpcGx4QjN0MmY0Sk1sR25GVnVKSk1sd1VYS1dT?=
 =?utf-8?B?NjIwbENaQTN4VlM1UXR2blNNZ1NkVUFjbDlZYzZreGU4OTR6dFBnYm50a0kv?=
 =?utf-8?B?OHI4Zm5QMG5uSWQxTjdRLzJjS1ZOZTV2UEJPWm0relFwVmxrNWNGNyt0Z3Y1?=
 =?utf-8?B?ZnJMeDZiRk9VUll0RGY5SEdMVE5UQ1NzaDIyUDlldk5hQTdFQyt5QWh6S3pR?=
 =?utf-8?B?SHpMSkFlR2JkYnhyYUptclRiQzNQSTJ6WDBhMjhJNkpFRnZxZktGWDlvcHI3?=
 =?utf-8?B?SitSWEJzRk8vdStGRzNrUWtOWCtvNHBnTmZoV09KTUsybWxHTVJONXNRZGxv?=
 =?utf-8?B?azI5d1hBSEZMNUlBVU1BSXR5eTZGa1lwQ29FakNwdHhEc3JtYW5sNTJYZlFW?=
 =?utf-8?B?ZzZpc3M0ZzdKNWNUcmxqaTJuQWdOdjM1NFRCZzNiS1ZNcnd0cTh6SmovM3Z3?=
 =?utf-8?B?TEpQelZ5RWRXY0txTUl4di8zYnVsTmV4TjRMZyt2ZnJ5Skp1cldJNWN5YTBL?=
 =?utf-8?B?akNvN2hNc3p5Y1VQSE1EbHRMeGo5aENWSy93cUtmNUtxNFRNZkVhVjA0Sklh?=
 =?utf-8?B?bXNjK0pMMi9HcXlDVTRTZVpxS0hKT0ExYnZxd3I0d3VZN091ZVdWTCtwZ1ox?=
 =?utf-8?B?VmVZN2Mzb0RMZDA0RnptdHpOY096RVh4YjZuajdoZkRLK3ZldlFIRWw3TFJu?=
 =?utf-8?B?M00zUjJ4WVJlanVlRitndmRFZ0ticTYzTEtCdVdyK00wbTFVdTUvMlpTSkRL?=
 =?utf-8?B?d0JteXBGSndTbmswaHhKVWw2c3Btb2FTVXVFRERRVEhtaklmandRLzc5RVN0?=
 =?utf-8?B?Ri9iYk1IY2lKeVl2NWpDb1RiMVE4Z2FURXFtY0JINmhNZHgyZnNYZUZqalN2?=
 =?utf-8?B?aEQzS2EzUi9SK1NKWDhob3h5N3VhU1dobExQcEdFc0Zua1RSRjJuaFRYdlpJ?=
 =?utf-8?B?UXY5NTh3b1pvekhWQkZaSE5aKy9xUmdSQXR3OXUxUFZyb2ZzVmgzYzZIOEtI?=
 =?utf-8?B?d1FibGFFUjRYTkZBYnBOSXUxa0tMZ1E4a3JFZFQvQjhsVnlVWW5nc3h1b2hu?=
 =?utf-8?B?WENSM21OZ0hnYUovQTlkT05zZUlTVjdQNWdTWXdQbDRIY0dxYXlTQkFUZS9B?=
 =?utf-8?B?RWRydzBOMWVrRFY1UlAvUFkxdVJKVWN1OGF6ZkVPS29NQnRjTUxLVUlRVzZy?=
 =?utf-8?B?b0JvUCtTV0tSK250Qnd0QjhYTUFhSnlvQUtrcFRGNjJGVkl2NmY5RkdWbzdM?=
 =?utf-8?B?NWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3fd7f47-384a-4143-cca4-08dd1076fcf2
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 13:08:59.4592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ENYUFT37fgIrCRAbYgKuDci3xWkbia6Uue8LYEMcfquT/QYEquPIrQWUiuJBb6daoNKCojW2W+Ha8dHw4hl8a3JWEd1PEljGFXT4XY2A7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5207
X-Proofpoint-ORIG-GUID: KAnT6dFuZGNXyWZm82H1hAoaIrHv6kHG
X-Authority-Analysis: v=2.4 cv=TIS/S0la c=1 sm=1 tr=0 ts=6749bcf1 cx=c_pps a=1mby/iHf9ieL9308fKykyA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=CCpqsmhAAAAA:8
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=zOGRAEGXHFMk7-aANXYA:9 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=mp0W8R6NrFMMdpb4RvoA:9 a=GCzxtvRcY79w4L-u:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=ul9cdbp4aOFLsgKbc677:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: VpmGCJad6s08up9ANUbgBbDxg0VyhA9-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-29_12,2024-11-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2411290107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 13:09:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208016

--------------2hQB585sd7zmLeNJ1cPwNm7b
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-11-29 5:57 a.m., Alexander Kanavin via lists.openembedded.org wrote:
> Hello Randy,
>
> are you able to work on this upgrade? The rebase conflicts in
> vg_regtest.in are significant and I don't quite understand how to
> resolve them correctly.
>
> Alex


Yes, hopefully I'll have an update next week.

../Randy


>
> On Mon, 18 Nov 2024 at 22:18, Auto Upgrade Helper via
> lists.openembedded.org<auh=yoctoproject.org@lists.openembedded.org>
> wrote:
>> Hello,
>>
>> this email is a notification from the Auto Upgrade Helper
>> that the automatic attempt to upgrade the recipe(s) *valgrind* to *3.24.0* has Failed (devtool error).
>>
>> Detailed error information:
>>
>> Running 'devtool upgrade' for recipe valgrind failed.
>> NOTE: Reconnecting to bitbake server...
>> Loading cache...done.
>> Loaded 1880 entries from dependency cache.
>> NOTE: Resolving any missing task queue dependencies
>>
>> Build Configuration:
>> BB_VERSION           = "2.9.1"
>> BUILD_SYS            = "x86_64-linux"
>> NATIVELSBSTRING      = "universal"
>> TARGET_SYS           = "x86_64-poky-linux"
>> MACHINE              = "qemux86-64"
>> DISTRO               = "poky"
>> DISTRO_VERSION       = "5.1"
>> TUNE_FEATURES        = "m64 core2"
>> TARGET_FPU           = ""
>> meta
>> meta-poky
>> meta-yocto-bsp
>> workspace            = "tmp-auh-upgrades:d91c453382ace1e86d0f29f82f8d66e5dfc2e69a"
>>
>> Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
>> Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
>> done.
>> NOTE: Executing Tasks
>> NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
>> NOTE: Writing buildhistory
>> NOTE: Writing buildhistory took: 13 seconds
>> Loading cache...done.
>> Loaded 0 entries from dependency cache.
>> Parsing recipes...done.
>> Parsing of 922 .bb files complete (0 cached, 922 parsed). 1881 targets, 41 skipped, 0 masked, 0 errors.
>> NOTE: Resolving any missing task queue dependencies
>>
>> Build Configuration:
>> BB_VERSION           = "2.9.1"
>> BUILD_SYS            = "x86_64-linux"
>> NATIVELSBSTRING      = "universal"
>> TARGET_SYS           = "x86_64-poky-linux"
>> MACHINE              = "qemux86-64"
>> DISTRO               = "poky"
>> DISTRO_VERSION       = "5.1"
>> TUNE_FEATURES        = "m64 core2"
>> TARGET_FPU           = ""
>> meta
>> meta-poky
>> meta-yocto-bsp
>> workspace            = "tmp-auh-upgrades:d91c453382ace1e86d0f29f82f8d66e5dfc2e69a"
>>
>> Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
>> Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
>> done.
>> NOTE: Executing Tasks
>> WARNING: tmp-recipetool-x6d4ggx6: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-v2z_cd3c/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-v2z_cd3c/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
>> NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
>> NOTE: Writing buildhistory
>> NOTE: Writing buildhistory took: 12 seconds
>> DEBUG 5 [Errno 25] Inappropriate ioctl for device
>> Adding changed files:   0% |                                   | ETA:  --:--:--
>> Adding changed files:   0% |                                   | ETA:  --:--:--
>> Adding changed files:  23% |########                            | ETA:  0:00:07
>> Adding changed files:  47% |#################                   | ETA:  0:00:05
>> Adding changed files:  71% |#########################           | ETA:  0:00:02
>> Adding changed files:  95% |##################################  | ETA:  0:00:00
>> Adding changed files: 100% |####################################| Time: 0:00:06
>> INFO: Extracting current version source...
>> INFO: Extracting upgraded version source...
>> INFO: Fetchinghttps://sourceware.org/pub/valgrind/valgrind-3.24.0.tar.bz2...
>> INFO: Rebasing devtool onto cafaff76aa66d7f05d5e9be09f9a9edd39833b0e
>> WARNING: Command 'git rebase cafaff76aa66d7f05d5e9be09f9a9edd39833b0e' failed:
>> Auto-merging tests/vg_regtest.in
>> CONFLICT (content): Merge conflict in tests/vg_regtest.in
>>
>> You will need to resolve conflicts in order to complete the upgrade.
>> INFO: Using source tree as build directory since recipe inherits autotools-brokensep
>> INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/valgrind
>> INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/valgrind/valgrind_3.24.0.bb
>>
>>
>>
>> Please review the attached files for further information and build/update failures.
>> Any problem please file a bug athttps://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler
>>
>> Regards,
>> The Upgrade Helper
>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#208012):https://lists.openembedded.org/g/openembedded-core/message/208012
>> Mute This Topic:https://lists.openembedded.org/mt/109653242/3616765
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

-- 
# Randy MacLeod
# Wind River Linux

--------------2hQB585sd7zmLeNJ1cPwNm7b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2024-11-29 5:57 a.m., Alexander
      Kanavin via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj8w-pNwEMw4QkX9YR6mqLLBQmd_O5fhq+0P8V0rk2MWEg@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">Hello Randy,

are you able to work on this upgrade? The rebase conflicts in
vg_regtest.in are significant and I don't quite understand how to
resolve them correctly.

Alex</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Yes, hopefully I'll have an update next week.</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj8w-pNwEMw4QkX9YR6mqLLBQmd_O5fhq+0P8V0rk2MWEg@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">

On Mon, 18 Nov 2024 at 22:18, Auto Upgrade Helper via
lists.openembedded.org <a class="moz-txt-link-rfc2396E" href="mailto:auh=yoctoproject.org@lists.openembedded.org">&lt;auh=yoctoproject.org@lists.openembedded.org&gt;</a>
wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *valgrind* to *3.24.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe valgrind failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = &quot;2.9.1&quot;
BUILD_SYS            = &quot;x86_64-linux&quot;
NATIVELSBSTRING      = &quot;universal&quot;
TARGET_SYS           = &quot;x86_64-poky-linux&quot;
MACHINE              = &quot;qemux86-64&quot;
DISTRO               = &quot;poky&quot;
DISTRO_VERSION       = &quot;5.1&quot;
TUNE_FEATURES        = &quot;m64 core2&quot;
TARGET_FPU           = &quot;&quot;
meta
meta-poky
meta-yocto-bsp
workspace            = &quot;tmp-auh-upgrades:d91c453382ace1e86d0f29f82f8d66e5dfc2e69a&quot;

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 13 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (0 cached, 922 parsed). 1881 targets, 41 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = &quot;2.9.1&quot;
BUILD_SYS            = &quot;x86_64-linux&quot;
NATIVELSBSTRING      = &quot;universal&quot;
TARGET_SYS           = &quot;x86_64-poky-linux&quot;
MACHINE              = &quot;qemux86-64&quot;
DISTRO               = &quot;poky&quot;
DISTRO_VERSION       = &quot;5.1&quot;
TUNE_FEATURES        = &quot;m64 core2&quot;
TARGET_FPU           = &quot;&quot;
meta
meta-poky
meta-yocto-bsp
workspace            = &quot;tmp-auh-upgrades:d91c453382ace1e86d0f29f82f8d66e5dfc2e69a&quot;

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-x6d4ggx6: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-v2z_cd3c/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-v2z_cd3c/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 12 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  23% |########                            | ETA:  0:00:07
Adding changed files:  47% |#################                   | ETA:  0:00:05
Adding changed files:  71% |#########################           | ETA:  0:00:02
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:06
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching <a class="moz-txt-link-freetext" href="https://sourceware.org/pub/valgrind/valgrind-3.24.0.tar.bz2">https://sourceware.org/pub/valgrind/valgrind-3.24.0.tar.bz2</a>...
INFO: Rebasing devtool onto cafaff76aa66d7f05d5e9be09f9a9edd39833b0e
WARNING: Command 'git rebase cafaff76aa66d7f05d5e9be09f9a9edd39833b0e' failed:
Auto-merging tests/vg_regtest.in
CONFLICT (content): Merge conflict in tests/vg_regtest.in

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since recipe inherits autotools-brokensep
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/valgrind
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/valgrind/valgrind_3.24.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at <a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler">https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler</a>

Regards,
The Upgrade Helper



</pre>
        <br>
        <fieldset class="moz-mime-attachment-header"></fieldset>
        <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#208012): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/208012">https://lists.openembedded.org/g/openembedded-core/message/208012</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/109653242/3616765">https://lists.openembedded.org/mt/109653242/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------2hQB585sd7zmLeNJ1cPwNm7b--

