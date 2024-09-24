Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F8DCF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 08:22:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8775.1727166120372744758
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 01:22:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=99979d78d4=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48O4oHvP020745
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 01:22:00 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41um550acm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 01:21:59 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48O8Lx05008843;
	Tue, 24 Sep 2024 01:21:59 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41um550ack-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 01:21:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x7hZzYBdTZiLt2xxyXrsQP3HwsMM6FfzKbYIbgoJa+u2I25x0bXc0n3Cion+aLd3LPQFxckF3C8om1e175s+qEDL1TtONAwC7wpovLJ5qacw8r7QbqHYyFQ4DjAoyyikfJdylUiS/QuByk4e3ugAEI7lJ+jnlxxKbRrUjCAQCx/xlJUvCY3r1fFQISjf0ow/ZsnPaQRlAq7sDxUfgt5z7lXvI91Fy62kZecXMa3ZwLxUMkWpGNTHtS5ZatsN3VoRXKtXQ0+cjnglhovysmRQKv/eFWO6ewKKHFCfh4Rdnf2VNJWQunwyUQKo95ne/2ebZz+9NQO3YAvBjken6roe2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8n0jhUHHQRiB1R4dBi+yTLpjmWx15GapJ9hUJX5d3Q=;
 b=UGOcpWS1rVSk7e5hNv+2Ux3L9viCJsfg7VsYp1JVhs3tM27tppcGDNUSGoqq4sTf9MVQ1+rd0K02aROZVw3CfuhaecRIAvgTvdAdLfiqphHvlS4T3AoGgs7HIWovN69OyYdOymmHUu0zokYsbmP5mY3LtM8gTFHtNVJxlrawgxm4tVt+5x41UICTSm9Wn5JVa7cOAtoXaSg0R36cXbc6FlK8nc/v883drziOTNTenBcOFzU3JDKc1gmOP14QRUzOGC7jUxS9RsuWUe1ugd7HouuJRb3tgrRNf1cZG3JqNVnom0eIJoKcWfLdOPTyG582thBsc/RbCiXNV+R2NY9C4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by CY5PR11MB6257.namprd11.prod.outlook.com (2603:10b6:930:26::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Tue, 24 Sep
 2024 08:21:57 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%4]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 08:21:57 +0000
Message-ID: <b823dea1-a904-4ee3-884a-0ffd4131bf6a@windriver.com>
Date: Tue, 24 Sep 2024 16:21:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 0/2] proposal: Append VENDOR_REVISION to PR for
 CVE scanners
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org, david.reyna@windriver.com
References: <cover.1726821150.git.liezhi.yang@windriver.com>
 <ZvJvq2MtzI_0BPMd@nuoska>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <ZvJvq2MtzI_0BPMd@nuoska>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYBP286CA0018.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::30) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|CY5PR11MB6257:EE_
X-MS-Office365-Filtering-Correlation-Id: cb539842-3aed-49cc-3fb6-08dcdc71f464
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|3613699012;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?am1LdTlTMElKVnVjd2hleEJvMjM2dUJ1RGVZYitndVBxVVdDd2VPQnZRYTVV?=
 =?utf-8?B?VTlzK1FOd1hnSVB2bWF5RU9kV1BVeUpNRnd0WGcvYXdHS2NTd2VKWU5yRThQ?=
 =?utf-8?B?cnFGc1RwVEVCNENGOWh0RFI5cWNTV3F1U2pQSytPQVhLWldEVFN3dDFSaGh5?=
 =?utf-8?B?MUVDdlI1aExQZ1ZyNE4rU1oveEhGdE9JSFRpbTZQeTRLR2FPNXVWcWJwUGZD?=
 =?utf-8?B?S0xEeURkVzVEQ25CUFNHWG9jbjlkbklaQkpLWGR1Q2VXK1RpckRmZ3hSdEpV?=
 =?utf-8?B?enF4dDVCL0RIL2lkS2taNzJxUElmTG43Z0Rtci9WVktqaHB5WjJ5TlFNUHRN?=
 =?utf-8?B?TkxzMlRvcmE2M2EzUVhPcjdNYWtSczNIZ1B3TjhjeWwwaEdpeVVrUmJUM1FK?=
 =?utf-8?B?QTBxQXdpZlF1T3VZa2dIUG9yd0N0dFdwaTdSV0lFYWJtNTdZeUNuMC9ab3ZI?=
 =?utf-8?B?UXVQcnoxaG5LeFhnRTllelZqVXNld25FVVJKNE1VbGg4Y1hEY3lOVXJFVGxO?=
 =?utf-8?B?bXZCN2d6T1N3K0RiU3hrV3oxbHZBMUlObkk3eDVLanNFSGhyN2xaMlVrdVNJ?=
 =?utf-8?B?dDd2a0dzRmI3emxWbkJhM2NBeEUySHhhTFh3Uk1UOFVSajF4VTI3TGxSV3FT?=
 =?utf-8?B?RHJTS3o2eEErMXAwOTkvTTMwL3RrcjJzRlJOcUplU040L1V6TStjTnZOYVVq?=
 =?utf-8?B?TEtBMW5JaGdDcWRlS3RNa2FHUGxSalZ6QWd2TmhSRjlBaVY3andEYkp4KzNV?=
 =?utf-8?B?SWhvQ1FocWEyR1FxNG5kbVF2Um0vdE9JNVF4cUhtZWx1UTFtbzY5RS9MTUFt?=
 =?utf-8?B?UTl6dGpYdU41MThIK1pjQkwvNmxseHFBVnNoelpnNFhUc0NnejFRNUcreTlM?=
 =?utf-8?B?VU1rVkRQN2o4eXpsTWJueW43Z0JhWFJCV0VCYUxaNFFqbURURnpnbnBNeFlP?=
 =?utf-8?B?ZjN1Z29OMWZvZDlnUXlEZEUvNkpaVEE1TG5lcEVGY1B6Y0ZsL1hjRVp4WU1m?=
 =?utf-8?B?TExEd0FYWjB4NUtYblRtbTA1M08rdlk0cGJRcjJVSlQzTkhJRXV3N01HVUYv?=
 =?utf-8?B?dWhsSlcxWlVrWXFPMlZqV1p4aEViYWlqdWxjV2ZIYmZSeWFYczlwYjZIb3U1?=
 =?utf-8?B?UWQ1L2RvS3NSZjNQUDM4VmVTYkU2Sjd5c1VTNEJMd3Z0YnljUG1zdDJZVUY2?=
 =?utf-8?B?aWN4dE0rSFFHV1d0ZTdjclBFc3FzcFVjbGNGdUpYL0hWLzI3Q1pCZWVGcUFt?=
 =?utf-8?B?ZlB1WUQ5a3VsQ0Z6dDRoQXVzeTR5NmNZbTVIQjl0bXc5cU1kS2MzOG9Ca1Bk?=
 =?utf-8?B?ZGdCdlV1eG1XMWtUQmVyT1RaUlJjZEVOY2xOWHpqajVielBDNmcxLzJFbzNH?=
 =?utf-8?B?U05LUGNaSis0eENhQ1lubnQyUFJZcnhNSjhnc1dGOFFnZEUzNHRPU3ZRNG50?=
 =?utf-8?B?MVFFR1laM1RKcGFkWEN2TEl2RjhXQ2MzcTBXRnNRQkdsVlVLMU1hcXlsWkhj?=
 =?utf-8?B?RUV5VFBYc1BBS2pabEU4NVkwdFJFZ1FxYWg2YVNhc3IzNWN3SnIrdHlyRWU5?=
 =?utf-8?B?MXZPdzcyMVA4UVVUcUY5cnQ5b0dLZUJ4TkUzRDRIS25TYmlIQW1wK2JoZXhW?=
 =?utf-8?B?YjlQOHpvVGlOYVlxam5xQXd6S1B3OGxFRHpkdTBFQjBub0E5dy9Pd24vZmpj?=
 =?utf-8?B?cHhGMFlINmU5OEZOMzFXaHVPeHFvdkpXQk5yU2VSenVqanBKeHdvVUxRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(3613699012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N2ZrVEEyQXFTM3pMcExoUnhyb2JZOWVVNjhpbkJWM29XUzdNTkRYRWExZmow?=
 =?utf-8?B?OW1ZU0FEWTcxMitFSTFrUm8zUXIwVU5mdVpGMkQ4UzcrS3JKdlIrT1ZlcFV4?=
 =?utf-8?B?SGIxdjhyZi80ZXFMb205K0FvRklTcnAzR0VQbkVhdjVmM1JVRmJkTkw5QnRY?=
 =?utf-8?B?QmttVDZaRXNrcFp5ZFVFVHJyMS81NzlGa1VsU3hmZnNZci9FZ2lIUTByWlhk?=
 =?utf-8?B?ZDdoejJVWXJwVkxCcTBQWWNqcGlOMkgvMUpQOGlEQlQ1NThKeWFETlJCcHRE?=
 =?utf-8?B?MGR1TW5zNXFmaU5XZHhrelMwWENCbjZ5YVhBSis5aWR4T1VWL0xaekpqRkdN?=
 =?utf-8?B?a2pOUmFLUlBtQjRQdzVLZnYxTklFS2didlJXTmF6dDFDd0ZWeGwydXdqYVZp?=
 =?utf-8?B?a3NkWVh0UUpHTEw4NGhKbkJKTzNYaUl0MFdBd1B0UHFURkdDTGJYSk1nSTZz?=
 =?utf-8?B?RVJtRkJJOUhDb3pCTUdWcFBpWVVtRmRQMHNnMmVrdDBKaFJCa1o2QjJtVGEy?=
 =?utf-8?B?UGZ4OENTendZcWUvVmFKTnJGZkkvY0xmdDRFZTQyVWNDeXRJbVBnSVlaMmFS?=
 =?utf-8?B?M2UvT3UrcnNFZkVCMzBzeURrVml3N0FSVzZGS1FORlN0U3ViWkNNMFNaUE1Q?=
 =?utf-8?B?ZzVxMHU4QWhBZkRpRU9ITkhhNlpFNUpTREVaOFh1bGdkNnVpRnhGampXSmtl?=
 =?utf-8?B?ZUN4b3RtV2tjcDJaNy9BZFVTdUg5OS9Dc2hPMW53UW83cm5Bbk9TZ0h6aXRr?=
 =?utf-8?B?QnE5dHlHaTZIMEprZ04vR05BN0dCV0h2bFVHYU1DQyt0QW5rRXpnU2NtMDd1?=
 =?utf-8?B?QVhOcUVUUWFsbWNFcVlEV3JWVDBoeTFpSlIzU2YwY3h1RkFNMWs0c0x3U0xR?=
 =?utf-8?B?N1RuelpZbUVXVFlIT0FlWjBJNG9OVkRDOXM2allwZHk1endNMEo5eWdSTnhB?=
 =?utf-8?B?aWFWMFRSRVpoRmZzanlCTm9JMXUreGVMSkZOcEd6MXc2cHBoeXlTbFFSWERa?=
 =?utf-8?B?S01BTTFnOWJpRllzTW1LUk8xQUR5SENjL3hQMW4xSDladkhsS1lnZERmRWJl?=
 =?utf-8?B?UGJJdGhSUmdUMDJTN3hYUlVqbHUxZlVCVkxnbHBaVFpZQmwvVTd2M2R3ZnF2?=
 =?utf-8?B?TVFOSGh5Wm1uRDJieDNsRFRMcTVWUTFjdjhkSHNKemo2aHZHT1pybVJPSVEy?=
 =?utf-8?B?WERzelBsQXg4azZWeFk5K2xadENOb0g4WGdieFZwSlQ3WmNVbnJFbU5SbWxy?=
 =?utf-8?B?Zndrdm9qVy83K0hkNFJxanJmcE1QKzJiZ2ZjbXJkbVJob0NUNWh4ZFZTS2lx?=
 =?utf-8?B?YTZQQm1kbENXa0FVYTJienUzczk0NXRGWEY0ZklFdDVpLzJ3QUpQRVN1V2E5?=
 =?utf-8?B?dThVcitTeVRKbUthSDVyaUdOMWNvaUMxMWxiMC9HTEVjWElEOGtrNFkrTG9W?=
 =?utf-8?B?eVhmMHY4Y2c0dklGcFVNajhjcWdGeFBZem0zSENhVzIzM2pjS0dBcHF3d0RK?=
 =?utf-8?B?V2FkRXNNUDg0YVViU2pDTmltT1FYQnppL0NrM3VVbHV6aGJGckd5QmJ2bVAv?=
 =?utf-8?B?OHdUVldiS2VuMFVCMkVkVGVVcnhMN3RyWE95bzJ6L3NHVjRwdkNVMFNCcCt6?=
 =?utf-8?B?VThXY1lzSUo1NGVoTmQ4UStlL3dyUXpVZko5SGNtOFlZNkdidktQQ2VqeGV4?=
 =?utf-8?B?ZWtvVXp4ZTlRbkc2TjN6bUdtM01GcnppRUxKelVrTTZacGhjeFpJSG9ZYXg1?=
 =?utf-8?B?MGNpZlQwN0g4QWlXZDFWUllRUlg4WWF5c0gvUFcwbVNSSE1nR2J4Y2NDN1Jm?=
 =?utf-8?B?dlZFQ3d0aEVGd2NpZVBLMjAzTXAvL095VFZMeUo1VjlXV1FFMzZZSDh0bVht?=
 =?utf-8?B?U3AxbnVlMk1sOCtVZk52WkpiODZZVzdWNmtoSHpUS0piMC9jWDExK0p6eUZ0?=
 =?utf-8?B?QmQ1NGhqWTdKWmI1akd4bm5BSVlmMzQxM0tRbnRPL0ZhWmR4QVg5WWFZaHNa?=
 =?utf-8?B?RjJTek9oQ0pCbGluQ0RjQ3VITUNxWkJoWkNwSHZGWk92T3NZU2o1TVREWW5l?=
 =?utf-8?B?bUNYemRlYzEyUGpZUFBtYkJTekd4MHpJbmFqZ1g1K1VMaGp6OER3S09ZSkNT?=
 =?utf-8?B?NlFqaGNKN0dnTnFjeXA5UUo5TksvUGp6N2VVZXlYMDVTZ254c0hEUnh2MFFO?=
 =?utf-8?B?TVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb539842-3aed-49cc-3fb6-08dcdc71f464
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 08:21:56.9924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AM/mFm+vSN4JzH1Kw68F/eFdde7db4VvD5eefk8abgnknXLd2aXCd8KmpXcpJ2wS4psuv5RHVSZC/zQ4I9pDWv++hBQOoXfl1WpyXfmp/Rk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6257
X-Authority-Analysis: v=2.4 cv=Z/q+H2RA c=1 sm=1 tr=0 ts=66f276a7 cx=c_pps a=nskeBUqQUen4dZUz4TdP1w==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=zP9Ww3IbAAAA:8 a=SXIC225tPuws0PmYn0YA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Jas66_JEJwYT-GINoPcu:22
X-Proofpoint-ORIG-GUID: JIo_AWFwC7_fOynFlVRlKV7Zgyt3wrdj
X-Proofpoint-GUID: 668pqCppIosKJ3bL8ib4AMaK-j8xrS39
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-24_02,2024-09-23_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=987 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2409240057
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 08:22:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204840

On 9/24/24 15:52, Mikko Rapeli wrote:
> Hi,
> 
> On Fri, Sep 20, 2024 at 01:53:13AM -0700, Robert Yang via lists.openembedded.org wrote:
>> From: Robert Yang <liezhi.yang@windriver.com>
>>
>> The VENDOR_REVISION is for cve scanners to know the CVEs have been fixed in a
>> lower version, CVE scanners such as Trivy can know the CVEs have been fixed in
>> a higher version, but it can't know the CVE is fixed in a lower version without
>> a helper, we have the following ways to set the helper:
>> 1) Use PR server
>>     This doesn't work since the server updates PR for any changes.
>>
>> 2) Update PR manually when add a CVE patch
>>     This is doesn't work either since:
>>     - This is very trivial and people may forget to update the PR
>>     - The PR may be updated for other reasons except CVE patches
>>
>> So we need a specific part such as VENDOR_REVISION for cve scanners.
>> The VENDOR_REVISION is designed as part of PR:
>>    PR:append = ".vr51"
>> - ".vr51": The VENDOR_REVISION
>> - "vr": Vendor Revision, can be set to other values such as oe or poky
>> - "51": Convert from DISTRO_VERSION (Yocto 5.1), it can be customized with
>>          a function defined in GET_CURRENT_VENDOR_REVISION.
>> - The VENDOR_REVISION will only append to the recipes which have patches
>>
>> There are two bbclasses to manage the VENDOR_REVISION automatically:
>> - gen-vendor-revision.bbclass: This is used for generating VENDOR_REVISION
>>    automatically, and save all the recipes' VENDOR_REVISION in
>>    vendor-revision.conf, it is like:
>>    VENDOR_REVISION[meta_recipes-support_libssh2_libssh2_1.11.0.bb] ??= '${VENDOR_REVISION_PREFIX}51 \
>>     CVE-2023-48795:CVE-2023-48795.patch:b6c68cd1f0631180914ff112ac0c29c4 \
>>     notcve:0001-disable-DSA-by-default.patch:61b6368d4a969d187805393d8b8fee85'
>>
>>    And in the second release such as Yocto 5.1.1, the bbclass will update the
>>    vr51 to vr511 when both of the following 2 conditions are met:
>>    - The DISTRO VERSION is updated, for example, from 5.1 to 5.1.1
>>    - The recipe's patches are changed (Patches added, removed or updated),
>>      otherwise, it will still be "51" when Yocto updated to 5.1.1, this can avoid
>>      unnecessary PR bump.
>>
>> - enable-vendor-revision.bbclass: Append VENDOR_REVISION to PR
>>    After the VR is appended, the rpm package is like:
>>    openssl-3.3.1-r0.vr51.core2_64.rpm
>>
>>    There is no change if the recipe doesn't have patches, for example:
>>    base-files-3.0.14-r0.qemux86_64.rpm
>>
>> Check the comments in the header of gen-vendor-revision.bbclass for more details.
> 
> This is very much backwards, like Alex mentioned as well.
> 
> There is no need for this. If CVEs are fixed with patches, then those patches will
> mark the specific version and patch applied as not affected by the CVE.
> The classes export this data. If anyone feeds this data to external tooling, then
> the CVE patch status is a critical detail which must be exported and imported into
> the tools as well. Otherwiser the external tooling is not really up for the job.
> 
> I've seen several commercial tools not managing the patch status at all. IMO these
> tools are broken and can't be used to manage secure patches of real products
> which have to apply CVE patches and can't always update SW versions.

Maybe you're right, but the mainstream distributions work with those tools such 
as Trivy:

https://aquasecurity.github.io/trivy/v0.17.2/vuln-detection/os/

// Robert

> 
> When managing a yocto based Linux distro, IMO, the tooling is already there
> to handle CVEs etc. External tools frequently cause more pain than actually
> improve things.
> 
> Cheers,
> 
> -Mikko

