Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E123C71135
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 02:13:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.21500.1750039970950859444
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 19:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8262abcf9c=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G1HfNT018168
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 02:12:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 478xa1hdcp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 02:12:49 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55G2CneZ001777;
	Mon, 16 Jun 2025 02:12:49 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2086.outbound.protection.outlook.com [40.107.100.86])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 478xa1hdcn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 02:12:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cg+SFMuYzXxuQ3Z4U2mDot2AkHVtEcnz65x8LWdMGUefW2r5gzGtpRzd8Gk1WW0HDz5dV/2zu45CLAGe2PMkQqC6LtkA4kSt2jJX1WY8kGTpckxASjJyOIt+w5FbGCyULwfzLSgUfxu+JrpZnJ+xKtsItqdOhYf55Qouk5Rr+R2uQgf78dh7ZHYZFZgSIx7w5PZjhVdX/JfMSuqAhZUKBffjbWLVGTHvh4bPGKmgF/2Hp4kTLVjxPGf3Qe2hFYGW5E+RGascgiCC1XfHuTiMz7mlaP4WuauEgHIMbuQ+yjJ/doornpd64Ohe55GglHWceRFh0arSZ3kNtVTiYYrMHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l23A5uMnlO7d8WRrnqAGCFj+4iqlIPpZaoSFZhY8m+I=;
 b=ppsYrFwLCp62sqW7C6pWz6wKepVPG9+DheLrMQBqro7/OvfhwXqNZjQ7NqvC+KNyJqNsjKubonZfWX8yYMbPcvf7MHnb5ahIblKyQarU9Q6hsiCyVOU+rrs76h+nn/2x4frIst48dSXn+CQPgim5GyBJmUySyMJ9iwda0hHkuYGAeavFEU8CR4eCEhSbV7NmxDjB/lXXheRzJpMZN1rjV9UOl8PLbZteNA1X6ep7BrsHV+4Hy9PK33mlTpKIpZ5jyiXZGOP0Idn0CEV3gmmIm7tA8OnYHqmLvQtL0W6g7rHYfaewT0yxtsFo08FGU4wTwU23iNP2vIENDApsedBJfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MW3PR11MB4729.namprd11.prod.outlook.com (2603:10b6:303:5d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 02:12:47 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 02:12:47 +0000
Message-ID: <102437dd-dbbb-41f2-a05f-1a2a9120a6e5@windriver.com>
Date: Mon, 16 Jun 2025 10:12:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap] systemd: Rename systemd_v255.21 to
 systemd_255.21
To: setairidis@gmail.com, openembedded-core@lists.openembedded.org
References: <20250614210317.1303-1-setairidis@gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20250614210317.1303-1-setairidis@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0132.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::16) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MW3PR11MB4729:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bb42ddf-8fe1-46c7-7785-08ddac7b499d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|4022899009|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V2FlVzJyMDhDUzEvbitzOVRYdFJHR2NSNVdRY2V5aVRZOTFVOXVJd3FPYW5Y?=
 =?utf-8?B?TmdoRVFlL21jTVJXd2dCbTdnTTlhUnZEZk5RTCtuR3pBRGVwdjRYdmJyeXJx?=
 =?utf-8?B?eGEvYmx2QzNmVjdMQ0JWS0k1aVpiYlJlbUl0ZWJSdUxpZC9BM3dzTDlTUENI?=
 =?utf-8?B?eGd1QkYwNHVlTGJabnNJQkd4S0RKZjZBUy9NbGZKM2tpWnIrSmZMdHdtTkFT?=
 =?utf-8?B?Q1R2TnNiYkJ1aUY0dmJuck40NTkrZVdDVmdMaCtKK3FmdFYrQkRxMHVodXBl?=
 =?utf-8?B?Y2IxZ0Y3NmJQYVhWUjFzaTJSZlhNQlYvYjRSTmNldGN3QldGODR6TnRxdC9X?=
 =?utf-8?B?bzY2bmZ0Unh2VzVCRTd4ejlsMkUraDVqV1o0U1FVbTBkdkJPaWF1Vkk4M0J3?=
 =?utf-8?B?bk9ISEpXNVdVNDlhc1NpVXFzRjlKbUF6Mk5FSW11dGphVllPdEhkeWpSRU5G?=
 =?utf-8?B?ekFsU2s0OTQ5a0xiUlRZQnRRVGR3RU1CRC93WDZYQU9yNzRjb0N0WGpMQkhQ?=
 =?utf-8?B?Y0dtUEFLcHJWVGxxUlUzZW9hS2dVNExvS0hiN2pEWWNwWVVHK3lSTDhuRWRm?=
 =?utf-8?B?L21abjdIS2lCY1ZVOFk2bE5Pc3ZnUW1MYTYrbU8wZjVoeUhOUUNQQnJtQS9C?=
 =?utf-8?B?RlB5ZGdWRitHaEpiQWpBZ2tNTEVuRG95Y0V6TE1yckwxMjdOR1FpL2krMGtt?=
 =?utf-8?B?Q2ZLTDlORnNoR2tsdjZxcWV5SVNBMytkRm5zWWFaUHV0WWRjVEF4Vlhzdmw2?=
 =?utf-8?B?ZzgyM1RQajZ1eTQ2YXRKTzRVRnB4eFFHWE80TC95dGNybVc5OGhmN3Q5T0dp?=
 =?utf-8?B?UmtCbE8xa1ZMN1dpcndaNUo3V1prK1VBOWRSNkpOckRQWUlxWXJBZlJ0UitP?=
 =?utf-8?B?WndicmtNVjVvR1FPTFIvMkVGazlORFdBNytSa0haZEg0RjBZTHBOV2Foa3Mv?=
 =?utf-8?B?MVZzNVZvNnN4S1BwdnBQT29FZ016RTBNTUdiajdCL2RkeWVnaUNzYmtyVzNq?=
 =?utf-8?B?WUprbTFTVzVtNlBpZGhIQ0tpbnVPc1FjZkFtUm42b2NKb3drK2hJNFkxU0gv?=
 =?utf-8?B?MWxlK05yYzhGMlJtYUVkSDIwak52dTlhRmNqbWpCWkQwUzFCNlgwMjRWWFlq?=
 =?utf-8?B?ZmxqRjdPTlljZWJGRkl6TzJycHIyRXpIeTVObVZQUVRaZHgyb1F5bklXLzVR?=
 =?utf-8?B?cVFWazF0YUlhM0tCZEdCSUhvdG1sVWlNdURPalJCQ0k4QUd3U3VtZ2lyVURU?=
 =?utf-8?B?d280NFZHUVhWekYzZm80ZlBQR0ZneDhKck5YdmpiaWdIZmh3clNDU09mckZX?=
 =?utf-8?B?UEcvTjE0L294dmJFOEpBTzIvRFhoME4vR0lYcC9sUWRQa1VNajBjeDJ6aEgy?=
 =?utf-8?B?akMyTUNoTEp2R1dQeDk4S2hhTFFXV0lqU0Z4QzBROUFCK3BBZjlCcXM5Q0o4?=
 =?utf-8?B?anM5RE5QVFVLU05ZRmdkVDVZbHdJbmZPdThHTDM3TjVIV1JMV3VvVS94T3R2?=
 =?utf-8?B?MngrWXl2Qi9Eem1FSXR3dzQxdHptdHZ6dmlUSmFVT1BNdWhWMFk1OGlCcjhV?=
 =?utf-8?B?TmNKbVo3MC9RSlJTbSs2dUVUYlpLNXZiT2VMVU5iVXJOY3BPVWt2bzdPQ0pE?=
 =?utf-8?B?b2FkS1pKSUE4NHRybURTS1NDM1NEQ1M3Y0E3Ukw3Wm5hRysxRTYxb2hTcW5J?=
 =?utf-8?B?ckhGLzh1SzVxNGkzTUUvVHVhSzZUNVBqcTNDQlBTY1FabTRvdS9tSjcwa0JD?=
 =?utf-8?B?d3lHa2N3bnVZcnN1cTR4Nkp2dkdoOTJ6d0t1Rm9hNUl0QmhVYlV0c0syK0NT?=
 =?utf-8?B?eTA4SHdJTnNSOWFUNjJDamNOOFh0NnpEQlVNdVREMldZeDM2a2hPSFlsVTkx?=
 =?utf-8?B?ZTFIQ3RDTjY3STZ0c0tTbWR0eGdjM1V2eWtFSDNIeG9oeU9TQ3ZkMFVjSTZh?=
 =?utf-8?Q?kqypNB3Cyz0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aGlKYnU3YjRjald0aXo2d3V2Qjl0WHlrbndncUlpYWR1MDJodUlXK1FTQms4?=
 =?utf-8?B?VnBqY3pObjNKUEswVE5LMGhnbkVKdG1GSFVkNk81UkoydnVyMUc4VmE2OHJ6?=
 =?utf-8?B?LzU4UDZYL0FTUjFsdm9pS0x0MEZYWk5rLzQyVVZvZy8vNFh1RUx3WVNHYmU5?=
 =?utf-8?B?bE5pWE0waVBKMVBlb3ZzU1M3ZHNVTjFtaC9JdXd6aXp1Q2lKbjFNVHdPUjdN?=
 =?utf-8?B?RU9ieGdYK1lRbnMycUVUVDE1K01oQTVYZ2V6enBENlRSR0psVE9CcnBaQTZl?=
 =?utf-8?B?NFloL1NYYmJLcnF6ckdSckdBZGNzVTMvQkkwa2RiMmVrdVN1VVFqb0s1dnBn?=
 =?utf-8?B?SlhEWHpUVzIySUJ6RHYxMFRjajZaVEc0a1ZvLzZnaWhPTGduUTQwRnhFUEc3?=
 =?utf-8?B?YTZ0c1VxVG5kQWtqNEprcHl3dHFYazZOQW10eGdlVE5NeXovZTd5MXhwTDdv?=
 =?utf-8?B?UmxVUTJmaDB5RS80NjFKOXlHY2tPcGtnd1VBbzVOeGRqaVBFeWJoZUlXeGtZ?=
 =?utf-8?B?enFJWTZaVklIcnlHUTluSUhwRlZYZXVGODVMN2lDWDBZejlmWldEK0YxdDRl?=
 =?utf-8?B?MHIrY25wamU3NUU5M0V6NXBvQzdGV0d0WXJqQ0taTTZQaTVEQjQrRGo1K2M1?=
 =?utf-8?B?ckljVFllTUl4TnVTQ3ZTSS9rSU1jcXpZaEp4MUJLTkVlK21NbXhNLytyOXpa?=
 =?utf-8?B?R1NyUWdMMEd3Qm55TlJreXpZeTJQUWx1WlZ5U0hxSlJvOFg1cXhWVE5LNkxj?=
 =?utf-8?B?U29WYWpYQVZaMjVlN0lGU0REbk5sVXNXQkV1RUpnTWFqRnhGWC81TVcvNUg0?=
 =?utf-8?B?MU5aZzV3NGEyWEE5S0cyS3lzWnd4RjliZFZLcEJtVU5JeXdZT25KNnlueUZ2?=
 =?utf-8?B?Y3h0M1RnREhCNGJRUGQvcHZVeFpGUFNFczhJWGdENmxXOG9KWEd4ckJNem5D?=
 =?utf-8?B?NllYUTg2T2pxSldJZkRMdmszbUdvVGVIeTROeFRWS00yd2FxVWNRcG82L0ky?=
 =?utf-8?B?ZXZDd051MHdJVldLMUxaclRNa3UyRFZNTmY1YTFVbXdJamVpVUVML1lmNGla?=
 =?utf-8?B?YU1abUoxUHU5V3NtTGNSVldXMmdoKzhyZWF1MmFtWVZhYkY3OFdhaWMrdnVY?=
 =?utf-8?B?NXU5MWxLcDczclpISjMrbXpZQ0NzZVRUbFJwZ0VXVXp4MzhYNjM2MXREOVRB?=
 =?utf-8?B?anJhT01jdFlGcU55OXU2dEFtQTgvNnJWYkJSSlBqUWFkcytNeUxrem1zdmxL?=
 =?utf-8?B?MjRKZktaOXVEYjRJcVNLSmFKU3Exb2RHL2JXUzluZytQYnlTTUQrdTFxeW0x?=
 =?utf-8?B?NFp5TWczNVEyRmpzZVYrTFdjR2Uxc3dnZ2xscnpwdjBQQ3hjRXBGa0JWdUQr?=
 =?utf-8?B?aWo0NTRzYkdvODBRWC9CU1NXTk9WM1J5KzgzeXFQR3Q4MURiK1B3bS9xalI4?=
 =?utf-8?B?ME1JNldBMk5Pb3diUkVoMFZKd09OSWdZK1owYWY2WndFcksrT0gwNWNiSHYr?=
 =?utf-8?B?OUthZ0JNbTBjNDVScTlFaHNXVWc3Qk5Tb0xscmZMdjdoY29SUGxpUmRDNUdz?=
 =?utf-8?B?WnVMZE9kV0Z6SFdsaXNiZno2MUptY3BVd1dNcTJ6WTVOaHlSTXc0Q1NKOTRF?=
 =?utf-8?B?RnpHcWZYbUl4U2huN0taRlZtWUV0U0sxOTlTb1R6aDN1WW5BcUxoR0d3SFBV?=
 =?utf-8?B?RGR6QmI2d1VKT0k2WU5yTERudTZDckhlUm0zMTc4QjdHVTRXZDRLWXVxRzVa?=
 =?utf-8?B?MXVFR3RMWFlHMnVqVHlaTnBFRkVKekxaQmtWSm1kZmU1cTk3UVkwdFllYlFK?=
 =?utf-8?B?S0ExV2pWZml4QTNmQndlS1hZdzNGSENCa29zTk8xSHZOQUtscHdPM2xPdFFD?=
 =?utf-8?B?Sm5RTFFjek92VCt1RGYwWXVZbU5TR3ZoaVkxZFB3bkZzTUIxVml0WHdZczRB?=
 =?utf-8?B?ckx0U0d5dmkxZmNyb3UrNTVUMW1lWFVGMEw5bDBla0R1YnI0N2s0R1RVSWRP?=
 =?utf-8?B?MmdqVHRYbmRSbEdmR3M5ck1yeFdETDVDTjgzdzFMN0dyQVJPekpyeU9BTU41?=
 =?utf-8?B?NTNPbjZ5NVQyd3BuYWVWN29PVWhqNnBmbTVRZjZrbmE0L0VtRnF1YlVERnMv?=
 =?utf-8?Q?DJE7h3EAw1sL2LCyXK/K5eoL9?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bb42ddf-8fe1-46c7-7785-08ddac7b499d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 02:12:47.4725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3wdkvqV5JiD1zb7J6CHnXtNJNfZqkC9wp/VGDNgPFbfZ0G0NNIJ1sGmAk1OUto65fuyDmCc/SX6wC4VbkTXABQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4729
X-Authority-Analysis: v=2.4 cv=PuiTbxM3 c=1 sm=1 tr=0 ts=684f7da1 cx=c_pps a=O90xIoCmo5/PAqnhJQK6Sg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=NW8c44ENt6Bztmw8yMEA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: q0Yft0wzw4D3CjgkEYTsEk9tQ742jG_H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDAxNCBTYWx0ZWRfX6Cg6euTdGGq9 XTu2kPLrR3Kl2Tj0hdTy0zJMlzjzZmhN94ku1BQ9OEIvweLuZdQ3AfGTYw9jkqewy62GbxJxYqb GzWCoxELTVE+/s2UqqbT5np8Ysvl/CzI51KAHTLWL9lFROhYKaK8/EDgEaRWmgbz7fdRaGntP/Q
 A0gMlcM/WznY/Yx8dC6hXG3cwveq1FB7vVmSx/uuPwBlI9SX8VtSsnZsb4smm5vpz5VHYOE/oNf yCRbtqQ2H8Jv/+sOWJSBq+zc54mBF79HeAO6lY5nXQj63sgLnv/mTVlurp9kD/ndgg3YyMBjnk6 CkuwUZnUnT5xzgXkrJqufFWxIih9efRciWPz2h+U/zlahW0UkQ6aeqRWbQUkgWSiB5OVDYOw0Ua
 kH0VMCRuHYKaP0UsyjnyHjZcqAqZfTkWX1kt2xIymuEtC/q6RG+Ax9clZQ0ih75O928ZUnlV
X-Proofpoint-GUID: 30aVHcWNOB2J-TqDi5r6T6mdKkcF26ul
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-15_10,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=930 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506160014
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 02:13:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218753

Please don't bump PE.

If you do so, you need to do the same for releases after scarthgap such 
as walnascar and master.

Regards,
Qi

On 6/15/25 05:03, Savvas Etairidis via lists.openembedded.org wrote:
> Pumped PE property to two, since this is not a version bump
> but a rename. The recipe was accidentally renamed with a 'v'
> prefix in 29e623b2ad00555788412fa520fbb9ffec794cbb.
>
> Signed-off-by: Savvas Etairidis <setairidis@gmail.com>
> ---
>   .../systemd/{systemd_v255.21.bb => systemd_255.21.bb}           | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta/recipes-core/systemd/{systemd_v255.21.bb => systemd_255.21.bb} (99%)
>
> diff --git a/meta/recipes-core/systemd/systemd_v255.21.bb b/meta/recipes-core/systemd/systemd_255.21.bb
> similarity index 99%
> rename from meta/recipes-core/systemd/systemd_v255.21.bb
> rename to meta/recipes-core/systemd/systemd_255.21.bb
> index bb9dc3da33..aee677bc87 100644
> --- a/meta/recipes-core/systemd/systemd_v255.21.bb
> +++ b/meta/recipes-core/systemd/systemd_255.21.bb
> @@ -2,7 +2,7 @@ require systemd.inc
>
>   PROVIDES = "udev"
>
> -PE = "1"
> +PE = "2"
>
>   DEPENDS = "gperf-native libcap util-linux python3-jinja2-native"
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218644): https://lists.openembedded.org/g/openembedded-core/message/218644
> Mute This Topic: https://lists.openembedded.org/mt/113646091/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


