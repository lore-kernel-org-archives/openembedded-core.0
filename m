Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE2ECD41D4E
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 03:17:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.78401.1731381438106433446
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 19:17:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=10462b0a34=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC37ElZ028472
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 19:17:17 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42uwpp81q7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 19:17:17 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AC3HHfQ011002;
	Mon, 11 Nov 2024 19:17:17 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42uwpp81q6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 19:17:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M4P6RKBJZzXa2t4ODzjJRNpSf1Z/uwPBI/CJNtzZkN3xDGYT6u/r0Ka74B4ft86O6dj9tJh9e1xjx+CI4s8n3tGlxkEMbeAD0bS/AIL8hFnzSy0upZZh3W6oN+ig2OFvZYHpdVKktWXehdaQXvlPSegjdaTqomC4jBocazQIVr5uKZvkcsUJRoyuwdXV9isXHq9cwBhaX3APgNQOP3LyiWb5q6vr14d7MEhUFvEC8tZO2AV62miNgecvsMJUQpk7l6i9jxzLatsBizl0zge0lRpq2tpd7MO1w2e21nJZdQgyPkQCDOMwGtP9ZyY19Ei7jTXGxIBnsBJ6T8L72MpmPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65SCW4fWR1H51VdmXfd07z7Mc1KyohQwLd+YfOPf6ZU=;
 b=Y6fdugScy7Ln87kC4kZya951TgPZwJJQsQrwOYazaKeOJOm8Pv2bFyhHZ6wwJWN69bViXB7f/P9zqgpJUIYqbqeVYJt0UbUeocIfdcje+ESPAbn7GwfrIgVlmpyyLzCrrrRUbTmpDR/BHat6EJqTUR6/ahqSt1SHKWq9Lg5QQnsTocjAcvlQTOm/KE8Bi6HrBH84Ng4/U5EpTaI98/+y/gNPxe5Djf9/V3cl/g1BFiSohibu/enUooyj/6eYeZC0iv4rNYmUAK07pg65oHO+6QkaCZgRRlKTLXOmn8pPLT64MzjvuNqJgKetB0kSGBwpU3jnCFpst7nIOpTcXg41Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by CYXPR11MB8691.namprd11.prod.outlook.com (2603:10b6:930:d5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Tue, 12 Nov
 2024 03:16:53 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%7]) with mapi id 15.20.8093.018; Tue, 12 Nov 2024
 03:16:53 +0000
Content-Type: multipart/alternative;
 boundary="------------k1cnu004taIZpjoP2tFiWaV8"
Message-ID: <c696d5af-a856-4ffc-b2a4-bf8fba3a7cbc@windriver.com>
Date: Tue, 12 Nov 2024 11:16:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] gdk-pixbuf: enable other loaders by default
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20241111120212.173440-1-changqing.li@windriver.com>
 <CANNYZj8_h-HKtiRt1fOHzHLcj8_ctCavEJ3pe3x0QbiYZrdGrA@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CANNYZj8_h-HKtiRt1fOHzHLcj8_ctCavEJ3pe3x0QbiYZrdGrA@mail.gmail.com>
X-ClientProxiedBy: BYAPR02CA0067.namprd02.prod.outlook.com
 (2603:10b6:a03:54::44) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|CYXPR11MB8691:EE_
X-MS-Office365-Filtering-Correlation-Id: edab9a60-7826-4eaa-5799-08dd02c874e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Q3JOWm81bk1KUHpNOWtERXd2bXozMlZUOUFBMjhDYXNrajZpMzY2S1pNSVli?=
 =?utf-8?B?cGREUkh6RURia24vK2hab3JTa1pxM1Q1S3ljM21kSXMwOFYwVUVIZ2FXV0dH?=
 =?utf-8?B?eTZzNTVqZ3dKYWsyK1ZJa3JKK3pwVit1azFHU1BMcmFXd3NFcFlCRUlKRkcr?=
 =?utf-8?B?aE5wNXJPdC91dlRNSnVPc25BZU5zeEVUaFVZb2ZFK2xKMFlCNTh3Z0NCS1V1?=
 =?utf-8?B?bjhJa3p2NUwyWUg0WmpUejdHS2EzR3dCT3RtajFmSXM0NlRGU1NGRHZDRUJu?=
 =?utf-8?B?MUZzdGd3SzNkNG0rZjhoTUs4N0ZFL3JqbExSTm9kckRVaFNWL1pJUy91V0g0?=
 =?utf-8?B?NVd5clNTdDNpYzhDTmMxY1pTMks3cjFQSUsvb0NTVTYzZDdGc1hzT0daMHZK?=
 =?utf-8?B?bU54ajU0N2h6OWFvUjVGeHdXZTUwY2xibDAvQnA3aDFSaElNSHNyS2xOVmF4?=
 =?utf-8?B?SlhzNHVqSkpkTDZHM1JXVm5PUlNnd1BNRmVRUGk1S2ZWNjMvdUE1ckVuK2ZU?=
 =?utf-8?B?UzlGOHB4bWxxbTVxZy9YYjJ1RjJqdHFFMk9kR1JoRDByOUJRSDFHVWQzM1VZ?=
 =?utf-8?B?RFFvWlVxT0cxUkI4UnV4VU11Qk5kazlhUktNU0h4cGY1VjRGaHNWWm04VXdL?=
 =?utf-8?B?TVY1SzR1ZkRmZVVOSDVVWVpRVEx3bmxpNHJCVHBjazBucGxveDhsVnVRSHM4?=
 =?utf-8?B?U0xaWEtIZXFQNVRFdVZVbTQ1VWhpMStFU2tLbFZiSkxOYXFPbnpzV2hHWnRB?=
 =?utf-8?B?VTN5Ry80aW9vQW5haEloNUFGRGF2ODZmNkM5WjlOeUgrWnd6ZFg0b054bTRy?=
 =?utf-8?B?MloxZk03MW8wbXVHSGxNUS9zdGpYRWkvYVJxNG5RMi9TcWtwbXZBQU9ZbzdY?=
 =?utf-8?B?dGJyS0RZMngvSEszWGNNeis4S0djTEc4TXNaSEpza2JlVGUzRGE3aklxNzlW?=
 =?utf-8?B?Q2hVLzhrTDB3MWh4ZVp6cElRamJxRlgxeWRlT2tBUDBPc1BodjJHNnNEZm1I?=
 =?utf-8?B?WC9nNTBCT3VNSThPMzJFdVV1TWNTQVJwbFkzL25IRE5yNU92T2xMYmNyS3hZ?=
 =?utf-8?B?cXZ4Q3E2ZlRWL3FZeWJyUm1Eb2FUYW1LV1pWNGN5Q1Q1ZTgxWXl1UVhCTnU1?=
 =?utf-8?B?WHhtM1lNdFUrYTFKSFRmOWtITStQVnM3RXZDMzNHM1ZEQWVqN1FxUTA2N2dC?=
 =?utf-8?B?WUlSajRLM2xaMHBqdG9RSGM2TnRqTUJITlh2UTlpREJnazlOK0pqMnZndGY4?=
 =?utf-8?B?V0dzWXYwakxYQ1NvNDg2eWxUMmtGUjBKamNYUzdYRmlQNHNKcXpaK1hWbnpO?=
 =?utf-8?B?dXZqQkpDS3E2ZEdVaHZsdW4zNmpNNEpNRkZwc3hSZXJMTzUyT2U3eFIyK0Fk?=
 =?utf-8?B?b1FySUlrVzhqY2EvNGFCNmZMWlZsWFpheXFPR0tLM2tWS2pDeUVhcmVrNzB4?=
 =?utf-8?B?VC9xNnRwVXB6SGVYNEVLYktaSWc5TVc3VXJMdDN5cks2TXN5Rmh2RlpPZWl1?=
 =?utf-8?B?VUJReHhhSHBIMVdHblV0T0JFMUkzTzgwVmxXYzFhUjlCSW9KMlcyaDZvNVZl?=
 =?utf-8?B?Rm5STzFtR3JYRnd3eVlvTkt3Umc4cG9pQkgxOXVuVDZ3UWpadkorRkFHOTIz?=
 =?utf-8?B?bC9Nd29MaHFidVVYMXJoNkZrL0hsTTI0UWYzV1NVamlaWGpPVjVRU1RyQWtE?=
 =?utf-8?B?SFQ1Q3NseENVVitQMlUzSG0zSGxQVGwvbnJKNFJmT1h1bGVJRmxIMTVBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(1800799024)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T2QydFBsVTA0TzhUOUFRR2RERXozZEJ1dnNNTlRySlA5Y214Rk9yUGdBZEM1?=
 =?utf-8?B?MlMrajdjNVdONUx3M3dDYlB1UEp0d1RDVGdlYnJ6QVZBYkNSTW9aWVMvMGhD?=
 =?utf-8?B?bnE4cCt3enBxUy9LNzB1RWhlSml0Unp4WENSZjd5V1pCRVUwNUxiWnBXMGRo?=
 =?utf-8?B?OTA3NXdzZ2QvNWd0Mk9UeElXRnc1NFZWQmVtUW5BMEdoa0VMSWZOMThNQmdh?=
 =?utf-8?B?WExuYUQ1VytxWkdkUnM1cnZ5ZFdaM3lFckg1Uno4WjJxK2MzUlVDRTU0aWhp?=
 =?utf-8?B?TlJYbEhPMHRIVnc3UzIxYnJQUUhhL3pSNjhJMXFpaVcvM0pqYUUzTEVRaFRt?=
 =?utf-8?B?d015MGh0U28vN0F1RkVtVVZPVEdydXBpcUROSnFvM2o0WHhlUC9TaEhETWdX?=
 =?utf-8?B?Sy9wSTBWbEdveDBUNDhaclRISFNrelVxR2UyOGJzb1RRL3lkbVRxaUlJN1JL?=
 =?utf-8?B?V2FQL1BtMWZpZGZYQkxRNm0yY3Bsa1JRMG9MR0dUMVBhOS8wUGdtTFZ3S2dy?=
 =?utf-8?B?NzBFZU1nUCtrYUN4M0oyd2dqYVYxbGd0bnFvS3VqYmFWNWM3dEozMHRXVFpN?=
 =?utf-8?B?UFIzK1RsOVpObXNnekZIUDkyY09lV28xYitwZ01wcFNqUXl0VWRNb0EzMlEw?=
 =?utf-8?B?YklmcExkYk0zbDIyTHBNWEp2S0llNUlhYXhINm1WTzFsNkIvR01GMlVCL0Zl?=
 =?utf-8?B?azZoZzQ4aVdxZ2RLVlVIUExiMmZZSUZmb2taTnZoOGtxQmRPc05iWjNUVEVu?=
 =?utf-8?B?ZDZhakFQdnlKY1ZSOTI1NU1YOGpwUUttRllwZ1paaXJ5Q3htajF5eWlWVXp2?=
 =?utf-8?B?dlZadmJZWGxpWnFnQjlsZ2xDMDRMSWFPM09DTDJIWWNwRE95VWZIQnowZnhr?=
 =?utf-8?B?OFRZdnE1MFlHd3gxN1I5dWFQOG0xQ1ZkZlFmTUwrVytiUGZzRGF1bXJCQ1Zo?=
 =?utf-8?B?dThlWkZ2SWQ0bEVEb05VVkdFRnU0NWpmeU81VWFqS1Q5UnN1QnBFdjhlMFdS?=
 =?utf-8?B?U1J2M09NcXVFdG9mVmwxcHN6Z3VEdEdPK2laWldqMlUyRFlNelpjblF1bVJU?=
 =?utf-8?B?eTRtQVRaSWJLVytnTllTRnROMHNvV04wWFpZSFBzZllyZ1lxZ045TDZ0RXVS?=
 =?utf-8?B?bUo5bGdXRUYxNUNEYXE3bXIxdFF0a1ZxbmRkNExuYWlLREpUeTdnMHhBMktM?=
 =?utf-8?B?UUpjemtzcnY1SzZJTWErS3NBaVpoc3M3VkhkQ0p4MGxpeC9OeENjMlRrMXUy?=
 =?utf-8?B?N1gvbWl1d0FEWTg2N3Y0VzlUZS9OVUJPWVN4K3drUzI2anJSek5mMTA2cG9S?=
 =?utf-8?B?MlAzUVgzZFY0NGpUUnBrbWZrWnlFNTYzbVo4S2IweWZyODRLZEZQa2xldGdn?=
 =?utf-8?B?K1I3N0Q1MDNNQXFrc0pibitRSERTQk41dXVOQVB5d1h5OWgzZ04zRjJSNFRm?=
 =?utf-8?B?ZkZNZ2ZjbXdiS0hBeEJPYzNBaVBlY1JRbG85bGZlS2o5KzUrSjBWc21PbDFq?=
 =?utf-8?B?czF5RmYvUGlHeVVuRjU2TWhFM3lpbE9PTXBBbFpVSWNmck9leXRLRy92c2lM?=
 =?utf-8?B?ZlYwdDJUS2RNa1JSeStuZWVTZTU0SEpKOEN5T0owNm9JTkYwWU5xdE00VHEz?=
 =?utf-8?B?dFdUWkdZWjF5S2hoUHpDWDhrR3czc2k5Nko0UzFhckRHRjY0OHZ3amJBN01F?=
 =?utf-8?B?dUxZeHEwNFRkY2JkZk1GcWJwbFNITXh4M2htdHNjOVo2Z1ZubXlIajNyS3FY?=
 =?utf-8?B?ek12SVRJT1dHTUpjZFFZNG11OWFMS0huNUQzd2JLSnZWNTM4Z1psbTRXVjlz?=
 =?utf-8?B?OXFKb2d1aTYrV0dWZGE4MTBuWWxOSXR2MEc5MUhyUjlKOGQ3eUcxT3pMMUNt?=
 =?utf-8?B?THNtMk5iSEthaUNZalRvb0ZEUUg1SGY1UTdZUmJrRjIvL2xqSHZMWTRLWmEr?=
 =?utf-8?B?LzhkbW9SNmNMMmI3R0MreGNPeURUVFhzMnBLTG1CSjYrOGM2cEFRZGk1N1ZH?=
 =?utf-8?B?Zk1TYnJLU1VQVWt3NW1WMk1hQUg2MFAyckNjNXRDSUo1MWxMTVVSUTFpYytZ?=
 =?utf-8?B?c0hYWTRDbWplRHlOQ25JR2E0NStQMDNPanRrTndqbDdsVnVoeHBEc3A3UHhl?=
 =?utf-8?B?clc4Wm93QzREU0JjaEFsVVc2MU5IYk1qdXZmWHN5a1VPRUVNZXdpaTdjYVpM?=
 =?utf-8?B?Qnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edab9a60-7826-4eaa-5799-08dd02c874e5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 03:16:53.5730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XmjaOZ4PpL1Lgh5aKEYtDDh8J+uvYJ8pv1r4fU4qcgNRIvGkhRPSyiN4dLsdRi8Wp/WiLMb+EKKIuUPHR5UA5G6mlXN44fev5Dlclam0mzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8691
X-Proofpoint-ORIG-GUID: _iJganpMoWk-wm2FptyHK4IU3mhLd06A
X-Proofpoint-GUID: AgXsxSJm8KumPHp7132srYvexU_mqDz2
X-Authority-Analysis: v=2.4 cv=J4f47xnS c=1 sm=1 tr=0 ts=6732c8bd cx=c_pps a=5b96o3JgDboJA9an2DnXiA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=GHR8O2WEAAAA:20 a=p0WdMEafAAAA:8 a=Br9LfDWDAAAA:8 a=pGLkceISAAAA:8 a=qKcqgRx5WMwOi4U29dwA:9 a=QEXdDO2ut3YA:10 a=yj-aMKAYKbz0kkd27lYA:9 a=RirA_IkYKFbeDkWB:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-11_08,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 bulkscore=0 clxscore=1015 mlxscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=736 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411120026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 03:17:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206985

--------------k1cnu004taIZpjoP2tFiWaV8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/11/24 20:05, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> This should be a PACKAGECONFIG option.
>
> Alex

Hi,

V2 patch is sent.

Thanks

Changqing

> On Mon, 11 Nov 2024 at 13:02, Changqing Li via lists.openembedded.org
> <changqing.li=windriver.com@lists.openembedded.org>  wrote:
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> Refer [1], upstream gdk-pixbuf disable some loaders by default from
>> 2.42.11, this makes some format of icons not works well after upgrade
>> gdk-pixbuf, report error like:
>> matchbox-deskto[501]: Error loading icon: Failed to load /usr/share/pixmaps/xinput_calibrator.xpm: Unrecognized image file format
>>
>> Fixed the same as some other sdks and arch linux, enable
>> these loaders by default, refer [2][3][4]
>>
>> [1]https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/e052a112075a19fb75f1f2ff3de4c82923de13f2
>> [2]https://gitlab.gnome.org/GNOME/gnome-build-meta/-/issues/846
>> [3]https://gitlab.com/freedesktop-sdk/freedesktop-sdk/-/commit/3ab7810255c64ce8aa2ae3ac10250148588ab49b
>> [4]https://gitlab.archlinux.org/archlinux/packaging/packages/gdk-pixbuf2/-/commit/4fa2d98a197781354b66a9710c9d596d502c961b
>>
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ---
>>   meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
>> index 9f825a68ef..e48589dcd1 100644
>> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
>> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
>> @@ -43,7 +43,7 @@ PACKAGECONFIG[jpeg] = "-Djpeg=enabled,-Djpeg=disabled,jpeg"
>>   PACKAGECONFIG[tiff] = "-Dtiff=enabled,-Dtiff=disabled,tiff"
>>   PACKAGECONFIG[tests] = "-Dinstalled_tests=true,-Dinstalled_tests=false"
>>
>> -EXTRA_OEMESON = "-Dman=false"
>> +EXTRA_OEMESON = "-Dman=false -Dothers=enabled"
>>
>>   PACKAGES =+ "${PN}-xlib"
>>
>> --
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#206948):https://lists.openembedded.org/g/openembedded-core/message/206948
>> Mute This Topic:https://lists.openembedded.org/mt/109513172/1686489
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
--------------k1cnu004taIZpjoP2tFiWaV8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/11/24 20:05, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj8_h-HKtiRt1fOHzHLcj8_ctCavEJ3pe3x0QbiYZrdGrA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

This should be a PACKAGECONFIG option.

Alex
</pre>
    </blockquote>
    <p>Hi,&nbsp;</p>
    <p>V2 patch is sent.</p>
    <p>Thanks</p>
    <p>Changqing<br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj8_h-HKtiRt1fOHzHLcj8_ctCavEJ3pe3x0QbiYZrdGrA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">
On Mon, 11 Nov 2024 at 13:02, Changqing Li via lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:changqing.li=windriver.com@lists.openembedded.org">&lt;changqing.li=windriver.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Refer [1], upstream gdk-pixbuf disable some loaders by default from
2.42.11, this makes some format of icons not works well after upgrade
gdk-pixbuf, report error like:
matchbox-deskto[501]: Error loading icon: Failed to load /usr/share/pixmaps/xinput_calibrator.xpm: Unrecognized image file format

Fixed the same as some other sdks and arch linux, enable
these loaders by default, refer [2][3][4]

[1] <a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/e052a112075a19fb75f1f2ff3de4c82923de13f2">https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/e052a112075a19fb75f1f2ff3de4c82923de13f2</a>
[2] <a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/gnome-build-meta/-/issues/846">https://gitlab.gnome.org/GNOME/gnome-build-meta/-/issues/846</a>
[3] <a class="moz-txt-link-freetext" href="https://gitlab.com/freedesktop-sdk/freedesktop-sdk/-/commit/3ab7810255c64ce8aa2ae3ac10250148588ab49b">https://gitlab.com/freedesktop-sdk/freedesktop-sdk/-/commit/3ab7810255c64ce8aa2ae3ac10250148588ab49b</a>
[4] <a class="moz-txt-link-freetext" href="https://gitlab.archlinux.org/archlinux/packaging/packages/gdk-pixbuf2/-/commit/4fa2d98a197781354b66a9710c9d596d502c961b">https://gitlab.archlinux.org/archlinux/packaging/packages/gdk-pixbuf2/-/commit/4fa2d98a197781354b66a9710c9d596d502c961b</a>

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
index 9f825a68ef..e48589dcd1 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
@@ -43,7 +43,7 @@ PACKAGECONFIG[jpeg] = &quot;-Djpeg=enabled,-Djpeg=disabled,jpeg&quot;
 PACKAGECONFIG[tiff] = &quot;-Dtiff=enabled,-Dtiff=disabled,tiff&quot;
 PACKAGECONFIG[tests] = &quot;-Dinstalled_tests=true,-Dinstalled_tests=false&quot;

-EXTRA_OEMESON = &quot;-Dman=false&quot;
+EXTRA_OEMESON = &quot;-Dman=false -Dothers=enabled&quot;

 PACKAGES =+ &quot;${PN}-xlib&quot;

--
2.25.1


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#206948): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/206948">https://lists.openembedded.org/g/openembedded-core/message/206948</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/109513172/1686489">https://lists.openembedded.org/mt/109513172/1686489</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------k1cnu004taIZpjoP2tFiWaV8--

