Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37BBCE77180
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 08:13:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.52237.1734336826693950389
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 00:13:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=208084afa0=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG5l2qR028034
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 08:13:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43gy80hprv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 08:13:45 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BG8DjYp017705;
	Mon, 16 Dec 2024 08:13:45 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43gy80hpru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 08:13:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6ZqL3ohtswsatUdztWkTEn+WQLlrasm773SkI+IZV2ynDD5zVECpJ4spiMEniZB+L++Ypp20MhAsXMJylni4UdXBY78AfY17RH0HxO1/5MT2vfmO8sF8Ii7vICyD8zQ7+UjMLQY3jt3orTLMnKHxx6MrMORJ2lc5ivmgE+Yyr+hbN6780w3Eksg+gix1iEVSIFY2xG8nNYRWocDsztTHDcki0E3Kr93yx2HWTqdorfWfw43cgm9vdH2uThZINC9eM0awnZGjuSB9P9JJR+8UCSPqew4ZLgnR3hiLzbNNIO6JDw3Db63ivjblIVrOU2YZcHD/2xDK18IeXn1MqFeWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sds9OD85d3xDC9PT5e1tNN/ZNlF1d7/5lERDX8bQ1T4=;
 b=QPufWUhJ4cAcmGncNB9QxO9btmxQHrMpGeGIgraz/MMGQjK6pUTa6saU8frlmcpQbCYsG0+s0ingMsiaBi+CPR9unkNFOkWn6e9dIkL8fIeUpB4eMI95oxGgfHrQvUjhJ+D+UDdprIDRhLrMwfcEzQClfl9e9Eci+wZrv6wtRWG/sMeIbDrbyhg9k8iBbjaoJK3r13F37FUwU91SsAE6TQCuqs4n2iktxn7qt8QIhBotUtWcvsFbOU7GRXEF3ygYNNvRp62F0UIVJxPmXTeJ2yAPW78pX+rmCcWBNvtNgHaaGZI1INU8CX+QyE702SM8xgKwx+NZM4F3uizRwHFkjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by DS0PR11MB8207.namprd11.prod.outlook.com (2603:10b6:8:164::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 08:13:41 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%2]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 08:13:41 +0000
Content-Type: multipart/alternative;
 boundary="------------CAfaBq0RBYuYufpBz51EHA9c"
Message-ID: <086a57e8-5bbe-4baa-baa8-45bf1852426b@windriver.com>
Date: Mon, 16 Dec 2024 16:13:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] meta/lib/oe/spdx30_tasks.py: fix alias in
 simplelicensing_customIdToUri not extracted
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20241212110932.2063844-1-hongxu.jia@windriver.com>
 <CAJdd5GboPsjC+A9PBBSGX_41PYLGdWCoJF5V1u6J2+R-NC1W4w@mail.gmail.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <CAJdd5GboPsjC+A9PBBSGX_41PYLGdWCoJF5V1u6J2+R-NC1W4w@mail.gmail.com>
X-ClientProxiedBy: SI1PR02CA0059.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::19) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|DS0PR11MB8207:EE_
X-MS-Office365-Filtering-Correlation-Id: f43074df-cd8c-4824-a337-08dd1da98cff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?L3dEVUJ0c2JvT3o0ZHdWT3BaK3d0b1MrK3V6RDFqT3BodnJHc1QyUk9CRkRj?=
 =?utf-8?B?a1hsTVVtaUdCQWd4cmRKUU95VktORXZSc2NScGlwTytoSmkxWlBKUklWZGl6?=
 =?utf-8?B?WFZzbFBjQWllK0p0bXByb0krczVyaUFuTEY2OWlHaXo0K3pZWGhRNDloekpX?=
 =?utf-8?B?QmVyTmUvbG03SUxGeU1XSlVEVmRic3BlaThTRktZbnlwUE5RN3lhQWlDeHBH?=
 =?utf-8?B?Q0dlWE53MCsyTmozSWdZbGJHbkpmdWRCanl6Kzg3eVl3S2ZiY2s2eHVSaHM1?=
 =?utf-8?B?SUV0eGljMk5NYkhOdm9YWVJONTFXWDBrMSsvc2lXcmZESFRLOTFGZTZKS055?=
 =?utf-8?B?bmhMOVBrTzRRL05JVG9WVXpkckpOK3JsR284WkhrbFFOSHZsSWlkeDRLWHVF?=
 =?utf-8?B?a21VZ05aa3cwN2F4T2lTcFMzY0EydnZGVUFuTzhMenY3c1JtWlMvMEdRVHkv?=
 =?utf-8?B?TWp6SU1qeFZLUzJsNy8yd3VtS09laVhwOXc0M2docUowU2FMVlNlUkJHMk9R?=
 =?utf-8?B?eUhqdUdWRE1uOGl2cjQ3NVNkV1NLV3FSaC9MYVE2MjQ1cmpaYVRMN3ZrcmRP?=
 =?utf-8?B?QmFxazRTdEM0WUhiNGRlWEJtZ3ZvbFVMQVhCZWl5VUgyYXFBVnZXbHV1QWow?=
 =?utf-8?B?ZWhWNXBxejYzei9mNlgwNVBpV1hWejVpS2dyUWxLajZSczYvQ2tHTDFoblRp?=
 =?utf-8?B?RlB0SGNQUGlDNXpTMVEyazVlN2p2a2pGcWZIVmxwZTN1YVZKc2p4WkdlS2g3?=
 =?utf-8?B?OER6WVpUZEJCaXk0eFF1ZGQzdUFiSWs2VGJWRzlTWmoxbWZOWjdSV1BQazli?=
 =?utf-8?B?N0VSazNhYlJTSjJxRDhOa3Nld0o1ejdkZCtka0p2bkJYSVZKd3BpQzVRVEtZ?=
 =?utf-8?B?cGJwUTZpU3dJclFja2lza202S0Y1TWhmM2dMdndCRCt5NWVxbDRua3ZCNXdM?=
 =?utf-8?B?dW9oM3htSDJveHAzSmRyNXNUQ3Z1Z0wxR0V4TnI3RjYzcDhwaW8yY3hTazk1?=
 =?utf-8?B?WFYyeHRieXI0eDcyZldhdE1UNkJ5ck0zTU84VWxyY0dVYzVpNnRtamNXOThT?=
 =?utf-8?B?K3duVW81NlhTTkFUeVR3L2dDbFJHZmhpZDdFS0tXak51UXJ5dHpVK0dGdmpl?=
 =?utf-8?B?eVB0ZnJkLzVwdG9JVTNwbldOcXhWZWxKOG5TOWZHdUgxeDA4TEFIQjlrZ3RT?=
 =?utf-8?B?VGtxV25MSVVDOGVrMzFGUnBYQlVjRWU0UDN3TWp1ZHF6K3B0RnZZVXRReloz?=
 =?utf-8?B?dzI5bUEyWkFaVHRDYlAxaTZQTUtRVGZGaTZCdkxZMkdETUp4QTljSXNNdmk0?=
 =?utf-8?B?aFZzbDJMeVY2WjBEOGU4TTc1VVVkQUVoQWd4REhnY0FzSHN4SFR4ZHhINzZL?=
 =?utf-8?B?Rk51N21GcTFBOGFHL1U4VmduVTlBRlU5aGY3NXVtckl4dFhYZ0dvMW9EQ1Yw?=
 =?utf-8?B?QW5CdFhPQkVsQ1NQTzVaamk1UVlncCtLZlNEcnBtNzFMSVFLVG92MzhtQU85?=
 =?utf-8?B?aEVtT2J1ZXU4UmVCQXBQNTNqTU95UE0zMzJ5MFVpQnZlcEE5K1IrWjU5SDky?=
 =?utf-8?B?YVd0TkVTL25JUUgwUHdZOVFXUXZTWE16S1lJZ05jbkFqUUtzMi9YaUFHZ0Va?=
 =?utf-8?B?SkVUMzRnZkJNOUhLakR4RTZId3ZacnNBTm1QSStEcUVlQ3lkandSU3MwVlJn?=
 =?utf-8?B?THA0VFUxVVMrOStEODQvY2xnTFoyKzRpWFh5ZTZxNjBTREJFb3V4b3JFS1R5?=
 =?utf-8?B?QlFRYlRsV0M0emhFV3JXSHlmODFzaHlrSFhzZng0RHhxMWF6Z0ZCNVFyQ2VG?=
 =?utf-8?B?UTBDNVFoWVZ3Z2wwNHhQQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RC8rU1dxNU5MLzgwS1kyMUNOb25vNDk0Q1RnT0JsR3U5QnlISERwQm5qa2di?=
 =?utf-8?B?dC8xcG5PNHQ1T2xOMWNyOUp6SXNyZnRmS1NLMmpEK2Fza3k4cGJWZmpWN09F?=
 =?utf-8?B?WWFGUkZVWlovVEpIR0NzYzVURHhIZEc2Rk9TWnpKNG83MEJWRmprNkZqZ3Yz?=
 =?utf-8?B?dk1BcXRVWUFpVlcxc01kZk42RGw3OEMrV1plRWdBNHNjZGcxd2dEdFRRZlcz?=
 =?utf-8?B?MlhYN1pxTko1RHBiUmRINUNoV24yS1R3VlhtWDU2NmRSTVR5UlJvNXZRcjdi?=
 =?utf-8?B?RU1oRk4rMXM3c3dreTMvdTRKeFM1bzkrUTdjWG1lQTEvci8rbTJoKzYxc2I3?=
 =?utf-8?B?Sm1kRTBwUkNUbEZ3VUdDQW5YWk56THF1U0lFOGxualIxVG05dEF6VEdqaisr?=
 =?utf-8?B?V1F6ZnBkbVU3bDV4N3NxaVA3S1dMUHhhY3NwKzVIQUJ3S3AzbnZXOXl4aE1r?=
 =?utf-8?B?aHN5S1FWQmV2V0Y4emFDRmEzMVRDK1NGbGNBY3hTa2NhUk5RK2IzOFNaczVI?=
 =?utf-8?B?S2pJUGJOTzhTS0tPOWk3Z3RmUUhqbVNoQmxWMklwWm51eDY0ODJ2cUsrOU9J?=
 =?utf-8?B?bzl3cktlWCtPR2lsbTVuRllCY3U0c0JUYytDY2o5WmdOcTJSMng5N1o1Nytx?=
 =?utf-8?B?eHA4SFJjUmw3UUE2YjlqelpNUEhIbGNjcGgzUFRqVUlseGc0d082d0x5cmQ2?=
 =?utf-8?B?WmxEUjVnQ1h5T1BWeE9ja05HVUk0SHl2QUh0a1lyd1JBRFV4aWlOSnJueEhh?=
 =?utf-8?B?MmZSdHJKZm1sd1dSd2dra0hFRDVNMk9EZS9PQWJOdFhlVUszc1VUVDVjY3V2?=
 =?utf-8?B?QlJjVUdxN2V1V1FneXZoUlNnWkZYVHJFdkJJRUVvcjlpNFlpUEoyeUNiZ0l0?=
 =?utf-8?B?UWFRSWlnUzZ2VGwvTTFHS05pbnFhRW5hcXpxbi84NktzdWNTRWQ3NlVVVFNk?=
 =?utf-8?B?bW9mc0JTS1paWXhnRlhMY3ptWEhyZHRjMG9zQkVhQjJIWjVNOW1RZUs3dmlh?=
 =?utf-8?B?VmRVc2gzWVRJQjFNU1Y5ZjFuWUd2VDRNWXZwd0xDYWlYeEtwdTl1N25DRnRr?=
 =?utf-8?B?WEh5SGlyc1FPMTczZE4xby9MTXkwMkx1YWtXL2VpMXR2TzE0bm54Tm5hV0tm?=
 =?utf-8?B?Ujc1VENDOFE4TWpkMTkyVFVvd1MzVTN3eXdTdi9mTGFXMHlNZExqWlNCbXBs?=
 =?utf-8?B?bXBSNDNHUnkvYS9JVGU0bk9oZTZ6NUpWRi9xenFLenBjOFlxemJ0TUtFZE9V?=
 =?utf-8?B?dmpoWndEditadHYzbkYzUXpZMmhwQldJblRwL3dlZHB0amltMmd5M1lSWHZj?=
 =?utf-8?B?NlRnamJ1d0RES01DMGpLWWxha3N2eVBMVmhwenE4a2U2QlBnZ09lQTJyM2NV?=
 =?utf-8?B?aHdOdk5nVDhWOXQzTTZtdWVhQ1pzWHFFYTNOZ1QyQjBzV00zbWN6c3dzRUZ3?=
 =?utf-8?B?V3FvdXV3MVYrYUJkWUlmdExQMnE5Wkt2UGtXYStnNjJodm9yQ2FzZTFRRjI5?=
 =?utf-8?B?enZoOEhtQlZPSk93SFJDVkdzVHo2UlBhYmV4YUJCZU5TZVBRWjdFVGRrREVO?=
 =?utf-8?B?T05UR1Mrckl6TFJGTXVDcEVtbzc2RCsvY2M1YjA4SnNBZGtlYlZFYmVMK2Iw?=
 =?utf-8?B?RGhUbldLOTdUQ1hDTUxNSGNHbnM5OGllR2pzZGxNVW55bTlORHlwamErN2xT?=
 =?utf-8?B?WmpUMG0xcWVrRnRiNUNRZFBpcEc4ZnlXSTFEUmoreXJERmF1Nmo0cGF6Z083?=
 =?utf-8?B?WEQ2Tkd2RFhIQjhkcE5jV2l3QWpVMHJTdEdFaVZYM3Z5V2FPb3ZaMXZtM2xH?=
 =?utf-8?B?L1BMc1Y0UmNOUG9OTVFlUlBweUdZM3R6TlovaVNlb1F1ek9FYTdPVEVCaTZy?=
 =?utf-8?B?SWMvWjRWa1ZIeDJnQ1pFVVRhQlVMQW96Z2dpeEVRTzJLdW5TWmJYL0c4NE9R?=
 =?utf-8?B?SlRQaHVPMjBsUDJXMzFVWUxnb3VtZ05yU3dFbTFnbGFPQlVHZDdRWWQvOStK?=
 =?utf-8?B?bGZDOW5OUERMTSs5Mkg5bmQ1MHlUTW1ESmYyb0E1cW5kdW83cE9KTGV4VEsy?=
 =?utf-8?B?Q2tKckpSc2VSWFlDS1I1Y2NPZGFTQnk2Wlc3SW1lb3AwaWFZamt0c0V6RUpl?=
 =?utf-8?B?VURLY3I2dkdTSm1YdWlxZ2NkU1RaZklGYVlGWmVKNWFBc2g1VnNDK2R1dmVB?=
 =?utf-8?B?QVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f43074df-cd8c-4824-a337-08dd1da98cff
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 08:13:41.1659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IMRdPWuv0vIfR+z0g6VG2imBaNjT2gN9eKjy6hEUTHw6SPTW6LvU/E4OeHa2vthHLDeDxH8ISXRkaDihXnx1qTRRSPMQIyiKi+0UeQ7E/mA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8207
X-Authority-Analysis: v=2.4 cv=I4ufRMgg c=1 sm=1 tr=0 ts=675fe139 cx=c_pps a=ybfeQeV9t1qutTZukg5VSg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=rorgr0BEAAAA:8 a=24AZYWMyAAAA:8 a=t7CeM3EgAAAA:8 a=Uex7hbRgqxRNpWiL_BEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=LVVdaqqDU9W9cF4QaU8A:9 a=vb61wfGcJE997USw:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=FuUPMLReglAHmohU_o2S:22
 a=bG88sKzkDEFeXWNnvthB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: V7JNL1xHTv1EY8JabqiF7Gohx9oUHJMm
X-Proofpoint-ORIG-GUID: -HAcB2b4uIkglgAR5ndiDuHMCy-gUjVi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-16_03,2024-12-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2412160067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 08:13:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208760

--------------CAfaBq0RBYuYufpBz51EHA9c
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4BG5l2qR028034

Hi Joshua,

I've submitted two solutions to fix the issue,

One is make StringProp to decode SPDX alias with actual ID, which refers=20
class ObjectProp's decode [1]

Another is add special code in expand_collection as you suggested

Would you please have a selection on them, or other better=20
ideas/suggestions?

[1]=20
https://github.com/openembedded/openembedded-core/blob/master/meta/lib/oe=
/spdx30.py#L293

//Hongxu

On 12/14/24 07:44, Joshua Watt wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Thu, Dec 12, 2024 at 4:09=E2=80=AFAM Hongxu Jia<hongxu.jia@windriver=
.com>  wrote:
>> After commit [spdx 3.0: Rework how SPDX aliases are linked] applied, i=
t set
>> license_text_map with alias other than actual spdxId
>>
>> The property of simplelicensing_customIdToUri is ListProp(ObjectProp(D=
ictionaryEntry))),
>> and class DictionaryEntry has key and value, the property of value is =
StringProp other
>> than ObjectProp in which could not support to decode/extract alias wit=
h actual spdxId in
>> image jsonld file
>>
>> $ bitbake core-image-minimal
>> $ vim tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootf=
s.spdx.json
>> ...
>>        "simplelicensing_customIdToUri": [
>>          {
>>            "type": "DictionaryEntry",
>>            "key": "LicenseRef-PD",
>>            "value":"http://spdxdocs.org/openembedded-alias/by-doc-hash=
/d53e90e23b12c4ad640809a74a810e86f31c76cdbdf36487712d22a33d53362a/sqlite3=
-native/UNIHASH/license-text/PD"
>>          }
>>        ],
>> ...
>>
>> After applying this commit, revert [spdx 3.0: Rework how SPDX aliases =
are linked]
>> to set actual spdxId other than alias to dictionary license_text_map
>> ...
>>        "simplelicensing_customIdToUri": [
>>          {
>>            "type": "DictionaryEntry",
>>            "key": "LicenseRef-PD",
>>            "value":"http://spdx.org/spdxdocs/sqlite3-native-e5cc0672-d=
8dd-57e8-a2df-fe4615831fda/162c62b5b011cd3f82f413b3dae4d6d1542201552c964d=
5ce69fe170e0720b85/license-text/PD"
>>          }
>>        ]
>> ...
>>
>> Signed-off-by: Hongxu Jia<hongxu.jia@windriver.com>
>> ---
>>   meta/lib/oe/spdx30_tasks.py | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
>> index 036c58bf4b..82fcfe7a63 100644
>> --- a/meta/lib/oe/spdx30_tasks.py
>> +++ b/meta/lib/oe/spdx30_tasks.py
>> @@ -107,9 +107,7 @@ def add_license_expression(d, objset, license_expr=
ession, license_data):
>>
>>           spdx_license =3D "LicenseRef-" + l
>>           if spdx_license not in license_text_map:
>> -            license_text_map[spdx_license] =3D oe.sbom30.get_element_=
link_id(
>> -                add_license_text(l)
>> -            )
>> +            license_text_map[spdx_license] =3D add_license_text(l)._i=
d
> Ah, sorry, this will not work because the SPDX IDs can be wrong
> anytime that documents are referenced across sstate objects. This is
> why we have aliases in the first place so that they can be "looked up"
> independently of their actual SPDX ID, until they are all linked
> together in the final SPDX document. This works for normal object
> references just fine because the alias SPDX IDs are "missing" when the
> document is merged, and our code knows how to pull in those SPDX IDs
> by the "missing" alias to resolve them.
>
> Unfortunately, since a DictionaryEntry holds a free form string for
> the value, that doesn't work here. Instead, we will need to add
> special code in the linking to manually go through all of the
> simplelicensing_customIdToUri DictionaryEntry items and resolve any
> aliases to actual objects. I think that needs to go in
> expand_collection() in sbom30.py
>
>>           return spdx_license
>>
>> --
>> 2.25.1
>>

--------------CAfaBq0RBYuYufpBz51EHA9c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4BG5l2qR028034

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">Hi Joshua,</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">I've submitted two solutions to fix th=
e
      issue,<br>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">One is make StringProp to decode SPDX
      alias with actual ID, which refers class ObjectProp's decode [1]<br=
>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">Another is <span style=3D"white-space:=
 pre-wrap">add </span><span style=3D"white-space: pre-wrap">special code =
in </span><span style=3D"white-space: pre-wrap">expand_collection</span>
      as you suggested<br>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">Would you please have a selection on
      them, or other better ideas/suggestions?<br>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">[1]
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/openembedde=
d/openembedded-core/blob/master/meta/lib/oe/spdx30.py#L293">https://githu=
b.com/openembedded/openembedded-core/blob/master/meta/lib/oe/spdx30.py#L2=
93</a><br>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">//Hongxu</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 12/14/24 07:44, Joshua Watt wrote:<=
br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAJdd5GboPsjC+A9PBBSGX_41PYLGdW=
CoJF5V1u6J2+R-NC1W4w@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Thu, Dec 12, 2024 at 4:09=E2=80=AFAM Hongxu Jia <a class=3D"moz-txt-li=
nk-rfc2396E" href=3D"mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@wind=
river.com&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
After commit [spdx 3.0: Rework how SPDX aliases are linked] applied, it s=
et
license_text_map with alias other than actual spdxId

The property of simplelicensing_customIdToUri is ListProp(ObjectProp(Dict=
ionaryEntry))),
and class DictionaryEntry has key and value, the property of value is Str=
ingProp other
than ObjectProp in which could not support to decode/extract alias with a=
ctual spdxId in
image jsonld file

$ bitbake core-image-minimal
$ vim tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.s=
pdx.json
...
      &quot;simplelicensing_customIdToUri&quot;: [
        {
          &quot;type&quot;: &quot;DictionaryEntry&quot;,
          &quot;key&quot;: &quot;LicenseRef-PD&quot;,
          &quot;value&quot;: <a class=3D"moz-txt-link-rfc2396E" href=3D"h=
ttp://spdxdocs.org/openembedded-alias/by-doc-hash/d53e90e23b12c4ad640809a=
74a810e86f31c76cdbdf36487712d22a33d53362a/sqlite3-native/UNIHASH/license-=
text/PD">&quot;http://spdxdocs.org/openembedded-alias/by-doc-hash/d53e90e=
23b12c4ad640809a74a810e86f31c76cdbdf36487712d22a33d53362a/sqlite3-native/=
UNIHASH/license-text/PD&quot;</a>
        }
      ],
...

After applying this commit, revert [spdx 3.0: Rework how SPDX aliases are=
 linked]
to set actual spdxId other than alias to dictionary license_text_map
...
      &quot;simplelicensing_customIdToUri&quot;: [
        {
          &quot;type&quot;: &quot;DictionaryEntry&quot;,
          &quot;key&quot;: &quot;LicenseRef-PD&quot;,
          &quot;value&quot;: <a class=3D"moz-txt-link-rfc2396E" href=3D"h=
ttp://spdx.org/spdxdocs/sqlite3-native-e5cc0672-d8dd-57e8-a2df-fe4615831f=
da/162c62b5b011cd3f82f413b3dae4d6d1542201552c964d5ce69fe170e0720b85/licen=
se-text/PD">&quot;http://spdx.org/spdxdocs/sqlite3-native-e5cc0672-d8dd-5=
7e8-a2df-fe4615831fda/162c62b5b011cd3f82f413b3dae4d6d1542201552c964d5ce69=
fe170e0720b85/license-text/PD&quot;</a>
        }
      ]
...

Signed-off-by: Hongxu Jia <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
---
 meta/lib/oe/spdx30_tasks.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 036c58bf4b..82fcfe7a63 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -107,9 +107,7 @@ def add_license_expression(d, objset, license_express=
ion, license_data):

         spdx_license =3D &quot;LicenseRef-&quot; + l
         if spdx_license not in license_text_map:
-            license_text_map[spdx_license] =3D oe.sbom30.get_element_lin=
k_id(
-                add_license_text(l)
-            )
+            license_text_map[spdx_license] =3D add_license_text(l)._id
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Ah, sorry, this will not work because the SPDX IDs can be wrong
anytime that documents are referenced across sstate objects. This is
why we have aliases in the first place so that they can be &quot;looked u=
p&quot;
independently of their actual SPDX ID, until they are all linked
together in the final SPDX document. This works for normal object
references just fine because the alias SPDX IDs are &quot;missing&quot; w=
hen the
document is merged, and our code knows how to pull in those SPDX IDs
by the &quot;missing&quot; alias to resolve them.

Unfortunately, since a DictionaryEntry holds a free form string for
the value, that doesn't work here. Instead, we will need to add
special code in the linking to manually go through all of the
simplelicensing_customIdToUri DictionaryEntry items and resolve any
aliases to actual objects. I think that needs to go in
expand_collection() in sbom30.py

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
         return spdx_license

--
2.25.1

</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------CAfaBq0RBYuYufpBz51EHA9c--

