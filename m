Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35AA0E7716A
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 07:38:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.76776.1734421094956475623
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 23:38:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=20814ab025=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH1b3HY013397
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 07:38:14 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43h1092u1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 07:38:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oyORM7oit+/Pt65JePj7w+Osts1PEFt2DOfdPu6b2YxLBUKKyK181dH+kpVGUgqzMKQod8j0mRjZ3HNlu3ZFkdl1FnxwQX5o41csHqIYwOfEtTPgS7QdeK0OBGiBRIO/KEzt6W0ZdSDYbi1G1MaYbIW1GsJ6b6qFCgTK6IkXs5VI9cUcFKnoXrXSyqo3asHOTqpq4Zsj2cbkZSybCwopY7JIT01FRMdtfDgVwSO6XGDJ5Ysgc/t/IRROtxiZt7ZBx3bKwJ+VJ8lC+tVvH+T0T4aDiWQ3UWp11/NQqMjHVQvqgu8B+t5ncVXgy1xXhDNHys8p11FZn9ROuVShDO4yLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ooIE4KU15XQ+Oz0lOaRRyaTKCYSdXkNIAZcvwx/EH5Q=;
 b=VdzKfGQs+QoywuCkkB6YOI9S6dU4X34ZGARfxfkx46JEDm4RPhEp8jvLLU3Hl0+OkVkGdwFwMthRP8XEQcabD573Cs3QocI3VWZfNqLKwXksHobjM9SVMq+lmiDp9Im+QyZYHMzhGvqLBwx8a1GBbNYHyXuTKzGLF1Sd0jilYRmfj4KkKg7WWvzqzexyHsZKWoaL55+jawHcUTjHtGmIu9O87d0vJIIgdAPurL3oMktTRI3y1Y1En1VamKkwjYyJVK6O/RwMqlptqyVgZlBnnY7x187xotRcRGaFmRlR49dzLC0LjqoPrtz5YxLe6RXR6pofSYqEwP3VN/senfFDfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by LV3PR11MB8601.namprd11.prod.outlook.com (2603:10b6:408:1b8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 07:38:08 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 07:38:08 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] systemd: upgrade from 256.9 to 257
Date: Tue, 17 Dec 2024 15:37:51 +0800
Message-Id: <20241217073751.3185503-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TYCPR01CA0167.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::7) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|LV3PR11MB8601:EE_
X-MS-Office365-Filtering-Correlation-Id: f8aa90a4-cbb5-43d6-4adb-08dd1e6dc01c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZWNUWkdnU2NXOGtYa3JTdVg0M3luTGNDNjlZc2JmLyt2LzhoWCtSWGoxY3J2?=
 =?utf-8?B?azYvZG1JQVdsODYrV0NKSTdad2NqOUlPSjFHTEsxZTVmaFZSblRjMFVleTZx?=
 =?utf-8?B?V085aWh2SG01aHZaVnRaaHYyeXlNUVBUZmN4SjkrMGNhUUIyWUJzM2pxcm5a?=
 =?utf-8?B?bGNRZURVQ2FFZ0pyeURJeGdFajhTeHRvQmVyZVUrMzFEb2VHdVRiZFI0QmNz?=
 =?utf-8?B?Q2dwMlRweTN5UnJqK0V1UmViZXpsKzJmMjB1Wm5IeFVablB2azY5bGloemxF?=
 =?utf-8?B?RThIYjZtVFZtUUVkeVN2T2dsN1V3L1IwTlBEL3J3TG9zd2lSSmcyUlZYRkRi?=
 =?utf-8?B?S1I5TFIrd1M1ZnBxMVdXNXByMmpSM29PTjZJNHdtZ1I0ODJQOEVJSlA4Y1hN?=
 =?utf-8?B?dUZmcStzYjM1OEs5dUY5YmFNUTRESUVPQ3owd1VIQitnNE9CVlBsL0hMS091?=
 =?utf-8?B?SEQyeHJFdjVTOVd2ODd1Mkk0ak1jR21jY1hJQngyWjhpNTdWMUdoSXd5QmRk?=
 =?utf-8?B?NGhuV1drT09SdGxjWndWL2FBbURGUXZiVEhYUTdqVVlOd3JTdXlDQWVOMnR6?=
 =?utf-8?B?dkRYMHBEOHhMY2pLckl3bTFSeUFEV1g3RUlvLzJQcVRMWE9YVUZNVTdpY1ps?=
 =?utf-8?B?Z3g1SzNRaHJGVmsrZXgySW9pS3lRTEg5cWxZVUpqODlOUFJ1aStSMVo4ZkJr?=
 =?utf-8?B?TGxzU0N2ZGtkc0JtQWFCSnpRQXRtMXRJZ3pJT3BPOG1zTEZtTVJrbjI1bFBv?=
 =?utf-8?B?d3h6UDVBcnp2TzF4bkFqWG5lcWFkSE5CUyt4aCt2Njk5bk9kRnYrVFgremNj?=
 =?utf-8?B?NmtJU0IyUGFmT21DRHU4ZzhuendjcDkzcHBZUnE4bHVGenVmellnL0xZcXdo?=
 =?utf-8?B?cUJhM1krYkJNWGhPTEJ1ZFYxWWduN09QVzFUdnRMMUdmRys1V1JNaUVmVVpk?=
 =?utf-8?B?VlZnWmQwbUJiRUxxN3JjUlRuWHBrK3U0cnVOczNBSjNOQldDQlBJdktQbEs2?=
 =?utf-8?B?VWlELy9iUHNmMHpyd1lJNC96OCtmRHRaYlRJQUZLTngwZUVOWElTQnRDMFI4?=
 =?utf-8?B?OXNqZnVnODJGK0VUcXlZcTI2UnJMMllqWmZVWXJyeDNIejYrVDQwRDQ5TzZ2?=
 =?utf-8?B?OGZIZS9oc1VpSjFvbytFNGtqeEt0Z2c5djcyZWwvWTBiY1dGVjJBUGdoeFJ3?=
 =?utf-8?B?VVpwK3NyRms2ZnU4MGpPSTc5NHdhZ2F1U01NL0o1RTU2bjBuT0ladDk2Znlt?=
 =?utf-8?B?bHo0WWJHVnQ5ZU0rdGg2RnZ1YlovYWRmSmtHVjBhaXpzTlN5bzhyb1ZQajdM?=
 =?utf-8?B?QU9YZy9qUE9vTlpHNHk2WjJ4VWQwWDRlK0ZKR2MwOCtzdlJqbUlKUC9XQUpy?=
 =?utf-8?B?Ym1oM1Y5dC9BajdJckt4VmlFZWF3VHd3ajF4UnhBcGN4WGtiVTVYYXBZRXIr?=
 =?utf-8?B?ZlNLeFViNXQ4alJmRlpHWDh5VTFwcXhVQkRsd3VRYUw0T1lUU1dMV1F6UHg3?=
 =?utf-8?B?eXg4UWpPTlJmVHZSNUhlZE9pNHZ5aXlPczdDQ0M3THpqSHc1MU9SaTk1c0dO?=
 =?utf-8?B?aldjTXRLbDdsb2R6WGZOTUZzM3c5MVR5L1dZSkplWUhNOHpIYk1rUS9TZzFC?=
 =?utf-8?B?clZGVzJLSXdjNGdSTnZGa1FyTjBNMDdzMWQ4c21McVJwNjN6alVQNmttOVFz?=
 =?utf-8?B?Q3k1bEJucnc0cG9mYVRxQS9NRTg5Yk1NYTljM1hpNWFJbFFrNDQxQnNYdy9H?=
 =?utf-8?B?OU5pS1dobVpZOStNRXZpK2x2YnlWZ0gzNlhlSjNUUEZ0Q2ZKalVweDhiM1p6?=
 =?utf-8?B?dmxhQWIzcUlvaW9ieHFRRS84b1N6M0ZKL0U0bmN6NTFMMjVhSkhDRUtGV3JV?=
 =?utf-8?B?aTVjNENFLzVraVU1RHJkRmpPMTZkUlFLQkpDNTBLOXNnaGdMRnJ2ZWJqbkNU?=
 =?utf-8?B?S3Qyd2hrc0JHZkZsTnBjS3pIWWp4YWZBcGpBMnRKTUtaVHFzazFWNDRIZ0lM?=
 =?utf-8?B?Q3duT3dFT3FPKy9iZldjMHF6UVdyNDR6dDF3cFVQQW9LdjlXWXQ4OU1rd3Vt?=
 =?utf-8?B?bW1YSGxNYUdZdW1yTHRxOVNMQU93UXdTZWxJL1NQUXdDbWJiYTFvMkZtZit4?=
 =?utf-8?B?cTkxdkduektURy9HcjJwRkVHYUdUT284b3JqQWNJNFg3V1N5SUhUS1RIREt2?=
 =?utf-8?B?MVVudHd2UGJpWC9lLy9zcGplQU40R1ZCUWRCYXFodDZCSU5DdGRLZ2NuVGI1?=
 =?utf-8?B?VFRTZlZjVDJ3U0pQUzFJTFBYRDNBRnFZUEFPbHNzb1d5MWlmNGtQaFdiRzJt?=
 =?utf-8?Q?jx1aaq4sYsD8QtGAyp?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?enRBYTcwMUxPKzBocTd1QmtFN3R4dllkSEs5RFYvREZwdFEwVkdUVnR5d0Jw?=
 =?utf-8?B?d2FLZjZKanVnUzMrZFQzVmlrQXJFMDFDUXBvQThKdDIwVTRRTUZjVjV6UXRQ?=
 =?utf-8?B?NmJuQXpaSzBkTnB2NlQ2RFkzMEh0ZjlXTnJrK2RoS0pzUEdmS3JzcGdGUVVY?=
 =?utf-8?B?TmcrUEtBUEZFWE00b3MwYVZJazlpSWFRR3l6S1YzOGFqQ1B6ejE4V2NOS2xS?=
 =?utf-8?B?VFBBcngzcFFjeEVPMVc1V0g1Q21CTktacFJBK21aNzZWWjQ5OVcxNHhnajRl?=
 =?utf-8?B?Zzl6Nkx4UmtpZWxXdXdxenl2cXdzMDFEQzFPcFREUjNrZFl5N1RDSytUMkNw?=
 =?utf-8?B?QkdVU1RtQjJnMHpXcWNaVHJhZWRya2Nma1h6SGxHYzF2K000VWxJNmc2UUNo?=
 =?utf-8?B?KzM3OUF1UU5hWk5BSkt3NmpFd2VlNnVwU1NQT1cyYUNNZUVJc3N2Yzd5L1BE?=
 =?utf-8?B?N0IrZjV1R0IwOCtISFQ0eWd4RmdwcXhaUldCYmYxblhqYUlIU0tHZVZIUTlm?=
 =?utf-8?B?UGR2aVBXNVlvUGkxbGNHV1NiOXB5Uzh2Z29TRU5Kektvcm9yUE93TmlES0My?=
 =?utf-8?B?ZmVwb0dKRDZIc3FQYXpwMHAzclIvWUVkTU4vVEl6L1ZHQlByN21zb1BGdjR1?=
 =?utf-8?B?Zk43cHVHeFhmUzkxOFBROStLN2w0QlVZYkd1K21UelNuYUpBUjRKZDVZc3FJ?=
 =?utf-8?B?U0cyK0U5amY5VDllNWdodDdlb29CUUpZU2FBK3ZvSThqRGZwWUNWY1pPVEhH?=
 =?utf-8?B?NWdBbVNsRDQ3SXFhSTF4cFVqbVByMlp1ODkvVlJ5ZDZOWGpIUmEyY21CVmZh?=
 =?utf-8?B?QjNrUXkxK2w4aEtiK2dKSS85UWZyKzZ1ZUxpWERYUU05NkRGSnlWZjBkNnBl?=
 =?utf-8?B?cHdTWHRydHJHQUMxcjJlTE05Q01DZll1a2w2T1RuL3BxdHQ1T3JSdjdqQ2Qz?=
 =?utf-8?B?c2lDdVRDV1FKK1BvMGNPMUk3K2xrdGV5YXE4QmwwT0JFT1kyK2huNzc3c2hX?=
 =?utf-8?B?MG93Vnozb1ZLaVVnbkxJNGVTQWE4RVpaT05iL2pkNllaQ1VYMHdLY1ZoQjVy?=
 =?utf-8?B?SmI0NlQwYUd0a1Jlc3d0bjB6MU1paWgrTDhzeW1pSjFYZ0V1Wjh1VDVGcitH?=
 =?utf-8?B?Q1JaM1p3WlpiZUhUMFhTZk8yeWxpalBVOWVkSTNoRXIyMWlhaWVVQWRYc005?=
 =?utf-8?B?ODBaN1FCTWh3TVVjMnlMMER3THYwcytxQlo4bE9OV04vQnBRckt4SHNIRUMx?=
 =?utf-8?B?cVVjMzNXMlFhb091Qys2R2hadzgrTVZMM2lyeTFoV1RKallFSExvVmZ6SVda?=
 =?utf-8?B?Z2Vlem9tNC9tSG4vL3lCTzV1Y0VNYXVWcnliOUtDcXp4enRKMUllMWFwZExY?=
 =?utf-8?B?UnRaa0w1dTdubUxxT21ZeWp0YmJGUE90TUo3Sk8xUFVHRVd1TGxoM1lWaXYz?=
 =?utf-8?B?dXVJYU5lSTB0NzQvS0tSVzl4OEc5Z1oyRFlNdkJmS1lteUdMK0M5MEJGVHZT?=
 =?utf-8?B?SXR1c21VUGloczlSaU5kUTBkOTBNMFQ5VjcxUTdIWCsrT3YzVm1OK1ZYK3Ux?=
 =?utf-8?B?VzN5SmpVU0F4cW1ndWc0WlRYaU1xSTM1bmhwZUtQcGVBR2oxTG1WRUVHaUdo?=
 =?utf-8?B?ekVmU2JpejFjWEdDVEFkOW1WOUkvM3N5RDZuby92Y0M3WVA5cFcxUjh4QXZu?=
 =?utf-8?B?VldiL2JLeGxaNk5DWXJoOXQ1S0JuMlVnYkszZHo4NTUrYlcvNkx2Mm1DN3Fx?=
 =?utf-8?B?QzBnTktUaVU2aGFnNXhpd2FHYWp0ZHNPMldnQWFMcG9rU2x4Vk40UUdxOUV3?=
 =?utf-8?B?cWJWZERLME5QZjg0ZjdkVVNrSjVPRzNHdXE0cVgyZW9raEdTcFplSTNZWW1K?=
 =?utf-8?B?ZXk0ZWs1V1N3QXpZK1BPN1VFRzRwUWZWTURYeWN2L2ZIbVFXajBHb0F3Y2M4?=
 =?utf-8?B?aXNQQWZoRkttR05rM2RscUhrT3pyRjJ4MFVVT2xRQjdMTy9HUTNtaGhGeGs1?=
 =?utf-8?B?KzgyR25QNU8vcnlLdEpVY21TUG1HWVRsTldWMUdNTGtLZ1FtNDdEMWI4RVRT?=
 =?utf-8?B?SWl3MURrNllKUWFLdDdwcStWVjRScllCRnlMaGV0disrMUk4RmJodXVtQ0pS?=
 =?utf-8?Q?QFDnpBpgWX/BG3bJ1nxngiH51?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8aa90a4-cbb5-43d6-4adb-08dd1e6dc01c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 07:38:08.4937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KgV+A2iGppiip4kqFugpcNgkh49uQhFW93pvNr0d8VrqwoYecmOS5paERiPZav7W/6YczXJ9RKLTQwNraRuPew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8601
X-Authority-Analysis: v=2.4 cv=bp62BFai c=1 sm=1 tr=0 ts=67612a65 cx=c_pps a=GDxOUaUasxmcDRSC7gC2IA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10
 a=NEAV23lmAAAA:8 a=y5Yq1ZyPAAAA:8 a=SpEKIKrXAAAA:8 a=XkRKQH6RAAAA:8 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=k-42gJp3AAAA:8 a=pGLkceISAAAA:8 a=_iH6NxeTAAAA:8 a=yMhMjlubAAAA:8 a=QyXUC8HyAAAA:8 a=ZegLgNpjrXWVSMxljmEA:9 a=qAtpzWnjfMaQ-oQW:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=JjjLDvxjFSEA:10 a=KWwMgwcXafsA:10 a=RVmHIydaz68A:10 a=PoVUXeey_BepnEeCpHdp:22 a=IxR1EdaEH-3-cEuU933n:22 a=1gUyE30hU_ULiMxJiLUW:22 a=FdTzh2GWekK77mhwV6Dw:22 a=uCSXFHLys93vLW5PjgO_:22 a=zZzRKORMDKZaSe7LaTAy:22
X-Proofpoint-ORIG-GUID: -LlIc7xlBl8CYHxa2l-uaQANfwKnKGe0
X-Proofpoint-GUID: -LlIc7xlBl8CYHxa2l-uaQANfwKnKGe0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-17_04,2024-12-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412170061
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4BH1b3HY013397
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 07:38:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208803

From: Chen Qi <Qi.Chen@windriver.com>

Patch changes:
* 0003-coredump-set-ProtectHome-to-read-only.patch is drop as it's a back=
ported patch.
* 0009-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch is drop as
  AT_SYMLINK_NOFOLLOW has been supportd in musl.
* Other patches are either refreshed or changed to fit the current versio=
n.

systemd-boot changes:
* Use src/boot instead src/boot/efi in do_install and do_deploy. See upst=
ream
  change 97318131fd06 (Rename src/boot/efi to just src/boot).

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...ve_256.9.bb =3D> systemd-boot-native_257.bb} |   0
 ...temd-boot_256.9.bb =3D> systemd-boot_257.bb} |   8 +-
 meta/recipes-core/systemd/systemd.inc         |   4 +-
 ...tall-dependency-links-at-install-tim.patch |   8 +-
 ...implment-systemd-sysv-install-for-OE.patch |   6 +-
 ...oredump-set-ProtectHome-to-read-only.patch |  38 ---
 ...-missing_type.h-add-comparison_fn_t.patch} |   8 +-
 ...-parse_printf_format-implementation.patch} |  16 +-
 ...B_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch} |  12 +-
 ...06-add-missing-FTW_-macros-for-musl.patch} |   6 +-
 ...7-Use-uintmax_t-for-handling-rlim_t.patch} |  14 +-
 ...atible-basename-for-non-glibc-syste.patch} |  10 +-
 ...ffering-when-writing-to-oom_score_a.patch} |  10 +-
 ...T_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |  99 ------
 ...ompliant-strerror_r-from-GNU-specif.patch} |  12 +-
 ...efinition-of-prctl_mm_map-structure.patch} |   6 +-
 ...not-disable-buffer-in-writing-files.patch} | 258 +++++++---------
 ...tch =3D> 0013-Handle-__cpu_mask-usage.patch} |   8 +-
 ...atch =3D> 0014-Handle-missing-gshadow.patch} |  32 +-
 ....h-Define-MIPS-ABI-defines-for-musl.patch} |  11 +-
 ...ss-correct-parameters-to-getdents64.patch} |   8 +-
 ...tch =3D> 0017-Adjust-for-musl-headers.patch} | 100 +++---
 ...rerror-is-assumed-to-be-GNU-specifi.patch} |   6 +-
 ...til-Make-STRERROR-portable-for-musl.patch} |   6 +-
 ...ke-malloc_trim-conditional-on-glibc.patch} |  12 +-
 ...ared-Do-not-use-malloc_info-on-musl.patch} |  10 +-
 ...2-avoid-missing-LOCK_EX-declaration.patch} |  16 +-
 ...nal.h-to-avoid-the-undeclared-error.patch} |  16 +-
 ...eferences-using-stdin-as-a-struct-m.patch} |  10 +-
 ...clusion-order-to-avoid-redeclaration.patch | 288 ++++++++++++++++++
 ...c-avoid-boot-time-segfault-for-musl.patch} |   6 +-
 ...clusion-order-to-avoid-redeclaration.patch |  76 -----
 .../{systemd_256.9.bb =3D> systemd_257.bb}      |  50 ++-
 33 files changed, 604 insertions(+), 566 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_256.9.bb =3D> syst=
emd-boot-native_257.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_256.9.bb =3D> systemd-boo=
t_257.bb} (86%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0003-coredump-set-P=
rotectHome-to-read-only.patch
 rename meta/recipes-core/systemd/systemd/{0004-missing_type.h-add-compar=
ison_fn_t.patch =3D> 0003-missing_type.h-add-comparison_fn_t.patch} (91%)
 rename meta/recipes-core/systemd/systemd/{0005-add-fallback-parse_printf=
_format-implementation.patch =3D> 0004-add-fallback-parse_printf_format-i=
mplementation.patch} (97%)
 rename meta/recipes-core/systemd/systemd/{0006-don-t-fail-if-GLOB_BRACE-=
and-GLOB_ALTDIRFUNC-is-not-.patch =3D> 0005-don-t-fail-if-GLOB_BRACE-and-=
GLOB_ALTDIRFUNC-is-not-.patch} (94%)
 rename meta/recipes-core/systemd/systemd/{0007-add-missing-FTW_-macros-f=
or-musl.patch =3D> 0006-add-missing-FTW_-macros-for-musl.patch} (89%)
 rename meta/recipes-core/systemd/systemd/{0008-Use-uintmax_t-for-handlin=
g-rlim_t.patch =3D> 0007-Use-uintmax_t-for-handling-rlim_t.patch} (93%)
 rename meta/recipes-core/systemd/systemd/{0010-Define-glibc-compatible-b=
asename-for-non-glibc-syste.patch =3D> 0008-Define-glibc-compatible-basen=
ame-for-non-glibc-syste.patch} (82%)
 rename meta/recipes-core/systemd/systemd/{0011-Do-not-disable-buffering-=
when-writing-to-oom_score_a.patch =3D> 0009-Do-not-disable-buffering-when=
-writing-to-oom_score_a.patch} (83%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0009-don-t-pass-AT_=
SYMLINK_NOFOLLOW-flag-to-faccessat.patch
 rename meta/recipes-core/systemd/systemd/{0012-distinguish-XSI-compliant=
-strerror_r-from-GNU-specif.patch =3D> 0010-distinguish-XSI-compliant-str=
error_r-from-GNU-specif.patch} (88%)
 rename meta/recipes-core/systemd/systemd/{0013-avoid-redefinition-of-prc=
tl_mm_map-structure.patch =3D> 0011-avoid-redefinition-of-prctl_mm_map-st=
ructure.patch} (83%)
 rename meta/recipes-core/systemd/systemd/{0014-do-not-disable-buffer-in-=
writing-files.patch =3D> 0012-do-not-disable-buffer-in-writing-files.patc=
h} (77%)
 rename meta/recipes-core/systemd/systemd/{0015-Handle-__cpu_mask-usage.p=
atch =3D> 0013-Handle-__cpu_mask-usage.patch} (92%)
 rename meta/recipes-core/systemd/systemd/{0016-Handle-missing-gshadow.pa=
tch =3D> 0014-Handle-missing-gshadow.patch} (84%)
 rename meta/recipes-core/systemd/systemd/{0017-missing_syscall.h-Define-=
MIPS-ABI-defines-for-musl.patch =3D> 0015-missing_syscall.h-Define-MIPS-A=
BI-defines-for-musl.patch} (75%)
 rename meta/recipes-core/systemd/systemd/{0018-pass-correct-parameters-t=
o-getdents64.patch =3D> 0016-pass-correct-parameters-to-getdents64.patch}=
 (90%)
 rename meta/recipes-core/systemd/systemd/{0019-Adjust-for-musl-headers.p=
atch =3D> 0017-Adjust-for-musl-headers.patch} (90%)
 rename meta/recipes-core/systemd/systemd/{0020-test-bus-error-strerror-i=
s-assumed-to-be-GNU-specifi.patch =3D> 0018-test-bus-error-strerror-is-as=
sumed-to-be-GNU-specifi.patch} (93%)
 rename meta/recipes-core/systemd/systemd/{0021-errno-util-Make-STRERROR-=
portable-for-musl.patch =3D> 0019-errno-util-Make-STRERROR-portable-for-m=
usl.patch} (91%)
 rename meta/recipes-core/systemd/systemd/{0022-sd-event-Make-malloc_trim=
-conditional-on-glibc.patch =3D> 0020-sd-event-Make-malloc_trim-condition=
al-on-glibc.patch} (77%)
 rename meta/recipes-core/systemd/systemd/{0023-shared-Do-not-use-malloc_=
info-on-musl.patch =3D> 0021-shared-Do-not-use-malloc_info-on-musl.patch}=
 (86%)
 rename meta/recipes-core/systemd/systemd/{0024-avoid-missing-LOCK_EX-dec=
laration.patch =3D> 0022-avoid-missing-LOCK_EX-declaration.patch} (78%)
 rename meta/recipes-core/systemd/systemd/{0025-include-signal.h-to-avoid=
-the-undeclared-error.patch =3D> 0023-include-signal.h-to-avoid-the-undec=
lared-error.patch} (51%)
 rename meta/recipes-core/systemd/systemd/{0026-undef-stdin-for-reference=
s-using-stdin-as-a-struct-m.patch =3D> 0024-undef-stdin-for-references-us=
ing-stdin-as-a-struct-m.patch} (84%)
 create mode 100644 meta/recipes-core/systemd/systemd/0025-adjust-header-=
inclusion-order-to-avoid-redeclaration.patch
 rename meta/recipes-core/systemd/systemd/{0028-build-path.c-avoid-boot-t=
ime-segfault-for-musl.patch =3D> 0026-build-path.c-avoid-boot-time-segfau=
lt-for-musl.patch} (85%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0027-adjust-header-=
inclusion-order-to-avoid-redeclaration.patch
 rename meta/recipes-core/systemd/{systemd_256.9.bb =3D> systemd_257.bb} =
(96%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_256.9.bb b/met=
a/recipes-core/systemd/systemd-boot-native_257.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_256.9.bb
rename to meta/recipes-core/systemd/systemd-boot-native_257.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_256.9.bb b/meta/recip=
es-core/systemd/systemd-boot_257.bb
similarity index 86%
rename from meta/recipes-core/systemd/systemd-boot_256.9.bb
rename to meta/recipes-core/systemd/systemd-boot_257.bb
index 10b532d47c..6a50ac05aa 100644
--- a/meta/recipes-core/systemd/systemd-boot_256.9.bb
+++ b/meta/recipes-core/systemd/systemd-boot_257.bb
@@ -54,13 +54,13 @@ COMPATIBLE_HOST:x86-x32 =3D "null"
=20
 do_install() {
 	install -d ${D}${EFI_FILES_PATH}
-	install ${B}/src/boot/efi/systemd-boot*.efi ${D}${EFI_FILES_PATH}/${SYS=
TEMD_BOOT_IMAGE}
+	install ${B}/src/boot/systemd-boot*.efi ${D}${EFI_FILES_PATH}/${SYSTEMD=
_BOOT_IMAGE}
 }
=20
 do_deploy () {
-	install ${B}/src/boot/efi/systemd-boot*.efi ${DEPLOYDIR}
-	install ${B}/src/boot/efi/linux*.efi.stub ${DEPLOYDIR}
-	install ${B}/src/boot/efi/addon*.efi.stub ${DEPLOYDIR}
+	install ${B}/src/boot/systemd-boot*.efi ${DEPLOYDIR}
+	install ${B}/src/boot/linux*.efi.stub ${DEPLOYDIR}
+	install ${B}/src/boot/addon*.efi.stub ${DEPLOYDIR}
 }
=20
 addtask deploy before do_build after do_compile
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/sy=
stemd/systemd.inc
index b85d5b187d..79d344b78d 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,8 +15,8 @@ LICENSE:libsystemd =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3D751419260aa954499f7abaab=
aa882bbe \
                     file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd25595107900=
8b364516c"
=20
-SRCREV =3D "f15fd96efd5ebdfb18746acb0cbb35a4331b4d8b"
-SRCBRANCH =3D "v256-stable"
+SRCREV =3D "70bae7648f2c18010187c9cf20093155eaa26029"
+SRCBRANCH =3D "v257-stable"
 SRC_URI =3D "git://github.com/systemd/systemd.git;protocol=3Dhttps;branc=
h=3D${SRCBRANCH}"
=20
 S =3D "${WORKDIR}/git"
diff --git a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-=
dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd=
/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
index 4ffcb2ed46..5101f9227e 100644
--- a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-depende=
ncy-links-at-install-tim.patch
+++ b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-depende=
ncy-links-at-install-tim.patch
@@ -1,7 +1,7 @@
-From ca94c86736ca7917e6c50d09d6c6ba56ba139709 Mon Sep 17 00:00:00 2001
+From e5fd143f215f072404c544f694cb026a4231503e Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 21 Feb 2019 16:23:24 +0800
-Subject: [PATCH 01/27] binfmt: Don't install dependency links at install=
 time
+Subject: [PATCH 01/26] binfmt: Don't install dependency links at install=
 time
  for the binfmt services
=20
 use [Install] blocks so that they get created when the service is enable=
d
@@ -25,7 +25,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  3 files changed, 7 insertions(+), 2 deletions(-)
=20
 diff --git a/units/meson.build b/units/meson.build
-index b231341a1f..b613a188a4 100644
+index 96f4852741..0a3a4fee67 100644
 --- a/units/meson.build
 +++ b/units/meson.build
 @@ -156,7 +156,6 @@ units =3D [
@@ -75,5 +75,5 @@ index 318bf8efc2..6ef684861d 100644
 +[Install]
 +WantedBy=3Dsysinit.target
 --=20
-2.45.1
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0002-implment-systemd-sysv=
-install-for-OE.patch b/meta/recipes-core/systemd/systemd/0002-implment-s=
ystemd-sysv-install-for-OE.patch
index 36cc5678c0..d8bb572261 100644
--- a/meta/recipes-core/systemd/systemd/0002-implment-systemd-sysv-instal=
l-for-OE.patch
+++ b/meta/recipes-core/systemd/systemd/0002-implment-systemd-sysv-instal=
l-for-OE.patch
@@ -1,7 +1,7 @@
-From 40ae40de3db990a7e56694f24fc625b1b71a98f7 Mon Sep 17 00:00:00 2001
+From fab8c573d06340868f070446118673b1c23584c5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 5 Sep 2015 06:31:47 +0000
-Subject: [PATCH 02/27] implment systemd-sysv-install for OE
+Subject: [PATCH 02/26] implment systemd-sysv-install for OE
=20
 Use update-rc.d for enabling/disabling and status command
 to check the status of the sysv service
@@ -39,5 +39,5 @@ index cb58d8243b..000bdf6165 100755
      *)
          usage ;;
 --=20
-2.45.1
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0003-coredump-set-ProtectH=
ome-to-read-only.patch b/meta/recipes-core/systemd/systemd/0003-coredump-=
set-ProtectHome-to-read-only.patch
deleted file mode 100644
index feb1178d23..0000000000
--- a/meta/recipes-core/systemd/systemd/0003-coredump-set-ProtectHome-to-=
read-only.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 4ac1755be2d6c141fae7e57c42936e507c5b54e3 Mon Sep 17 00:00:00 2001
-From: Etienne Cordonnier <ecordonnier@snap.com>
-Date: Fri, 6 Sep 2024 10:36:28 +0200
-Subject: [PATCH] coredump: set ProtectHome to read-only
-
-In https://github.com/systemd/systemd/pull/5283/commits/924453c22599cc24=
6746a0233b2f52a27ade0819
-ProtectHome was set to true for systemd-coredump in order to reduce risk=
, since an attacker could craft a malicious binary in order to compromise=
 systemd-coredump.
-At that point the object analysis was done in the main systemd-coredump =
process.
-Because of this systemd-coredump is unable to product symbolicated call-=
stacks for binaries running under /home ("n/a" is shown instead of functi=
on names).
-
-However, later in https://github.com/systemd/systemd/commit/61aea456c12c=
54f49c4a76259af130e576130ce9 systemd-coredump was changed to do the objec=
t analysis in a forked process,
-covering those security concerns.
-
-Let's set ProtectHome to read-only so that systemd-coredump produces sym=
bolicated call-stacks for processes running under /home.
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/commit/4ac=
1755be2d6c141fae7e57c42936e507c5b54e3]
-
-Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
----
- units/systemd-coredump@.service.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/units/systemd-coredump@.service.in b/units/systemd-coredump=
@.service.in
-index 012c60d2f6..fa3206d07b 100644
---- a/units/systemd-coredump@.service.in
-+++ b/units/systemd-coredump@.service.in
-@@ -28,7 +28,7 @@ PrivateDevices=3Dyes
- PrivateNetwork=3Dyes
- PrivateTmp=3Dyes
- ProtectControlGroups=3Dyes
--ProtectHome=3Dyes
-+ProtectHome=3Dread-only
- ProtectHostname=3Dyes
- ProtectKernelModules=3Dyes
- ProtectKernelTunables=3Dyes
---=20
-2.43.0
-
diff --git a/meta/recipes-core/systemd/systemd/0004-missing_type.h-add-co=
mparison_fn_t.patch b/meta/recipes-core/systemd/systemd/0003-missing_type=
.h-add-comparison_fn_t.patch
similarity index 91%
rename from meta/recipes-core/systemd/systemd/0004-missing_type.h-add-com=
parison_fn_t.patch
rename to meta/recipes-core/systemd/systemd/0003-missing_type.h-add-compa=
rison_fn_t.patch
index f4456f3c15..f2094eb71d 100644
--- a/meta/recipes-core/systemd/systemd/0004-missing_type.h-add-compariso=
n_fn_t.patch
+++ b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-compariso=
n_fn_t.patch
@@ -1,7 +1,7 @@
-From 34b7e1ed3b9a896db6fad435fd141c385c7337d1 Mon Sep 17 00:00:00 2001
+From f99ef6c4407b56e8d15455fe27eb732ada87215b Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 13:55:12 +0800
-Subject: [PATCH 04/27] missing_type.h: add comparison_fn_t
+Subject: [PATCH 03/26] missing_type.h: add comparison_fn_t
=20
 Make it work with musl where comparison_fn_t and is not provided.
=20
@@ -45,7 +45,7 @@ index 9c818bd747..ef10c8be2c 100644
  /* This is the same as glibc's internal __compar_d_fn_t type. glibc exp=
orts a public comparison_fn_t, for the
   * external type __compar_fn_t, but doesn't do anything similar for __c=
ompar_d_fn_t. Let's hence do that
 diff --git a/src/libsystemd/sd-journal/catalog.c b/src/libsystemd/sd-jou=
rnal/catalog.c
-index a0b673f65f..29dd2fee16 100644
+index 7dcc35d8d5..87b8d6aad6 100644
 --- a/src/libsystemd/sd-journal/catalog.c
 +++ b/src/libsystemd/sd-journal/catalog.c
 @@ -29,6 +29,7 @@
@@ -57,5 +57,5 @@ index a0b673f65f..29dd2fee16 100644
  const char * const catalog_file_dirs[] =3D {
          "/usr/local/lib/systemd/catalog/",
 --=20
-2.45.1
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0005-add-fallback-parse_pr=
intf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0004=
-add-fallback-parse_printf_format-implementation.patch
similarity index 97%
rename from meta/recipes-core/systemd/systemd/0005-add-fallback-parse_pri=
ntf_format-implementation.patch
rename to meta/recipes-core/systemd/systemd/0004-add-fallback-parse_print=
f_format-implementation.patch
index b0865b32af..f9a45bb40b 100644
--- a/meta/recipes-core/systemd/systemd/0005-add-fallback-parse_printf_fo=
rmat-implementation.patch
+++ b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_fo=
rmat-implementation.patch
@@ -1,7 +1,7 @@
-From 4a4005583e2debe491850229aa5ae2a97770532d Mon Sep 17 00:00:00 2001
+From 34fe809cf686c1a81db5f3f027e33fece350ba0b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sat, 22 May 2021 20:26:24 +0200
-Subject: [PATCH 05/27] add fallback parse_printf_format implementation
+Subject: [PATCH 04/26] add fallback parse_printf_format implementation
=20
 Upstream-Status: Inappropriate [musl specific]
=20
@@ -22,22 +22,22 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.co=
m>
  create mode 100644 src/basic/parse-printf-format.h
=20
 diff --git a/meson.build b/meson.build
-index 52723bef09..e20bf3af8a 100644
+index bffda86845..4146f4beef 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -753,6 +753,7 @@ foreach header : ['crypt.h',
+@@ -773,6 +773,7 @@ foreach header : ['crypt.h',
+                   'linux/ioprio.h',
                    'linux/memfd.h',
                    'linux/time_types.h',
-                   'linux/vm_sockets.h',
 +                  'printf.h',
                    'sys/auxv.h',
                    'sys/sdt.h',
                    'threads.h',
 diff --git a/src/basic/meson.build b/src/basic/meson.build
-index 9a214575a5..b49b6ade56 100644
+index e02f787c75..9435df895d 100644
 --- a/src/basic/meson.build
 +++ b/src/basic/meson.build
-@@ -189,6 +189,11 @@ endforeach
+@@ -188,6 +188,11 @@ endforeach
 =20
  basic_sources +=3D generated_gperf_headers
 =20
@@ -430,5 +430,5 @@ index 7d02b57d7b..75e8e08add 100644
  #define SNDBUF_SIZE (8*1024*1024)
 =20
 --=20
-2.45.1
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0006-don-t-fail-if-GLOB_BR=
ACE-and-GLOB_ALTDIRFUNC-is-not-.patch b/meta/recipes-core/systemd/systemd=
/0005-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
similarity index 94%
rename from meta/recipes-core/systemd/systemd/0006-don-t-fail-if-GLOB_BRA=
CE-and-GLOB_ALTDIRFUNC-is-not-.patch
rename to meta/recipes-core/systemd/systemd/0005-don-t-fail-if-GLOB_BRACE=
-and-GLOB_ALTDIRFUNC-is-not-.patch
index e7a0abcf9a..1b5e0d54c4 100644
--- a/meta/recipes-core/systemd/systemd/0006-don-t-fail-if-GLOB_BRACE-and=
-GLOB_ALTDIRFUNC-is-not-.patch
+++ b/meta/recipes-core/systemd/systemd/0005-don-t-fail-if-GLOB_BRACE-and=
-GLOB_ALTDIRFUNC-is-not-.patch
@@ -1,7 +1,7 @@
-From ed836c3478e1193e99e37d50db96d124796a3322 Mon Sep 17 00:00:00 2001
+From d368a0317c747961f69a455a09a3de3fd13410a2 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:56:21 +0800
-Subject: [PATCH 06/27] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is n=
ot
+Subject: [PATCH 05/26] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is n=
ot
  defined
=20
 If the standard library doesn't provide brace
@@ -115,7 +115,7 @@ index 49d71f15c7..0a49ebcc17 100644
 =20
          (void) rm_rf(template, REMOVE_ROOT|REMOVE_PHYSICAL);
 diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
-index 807925f199..b4f86fc611 100644
+index 86bf16356d..da552dbaab 100644
 --- a/src/tmpfiles/tmpfiles.c
 +++ b/src/tmpfiles/tmpfiles.c
 @@ -73,6 +73,12 @@
@@ -131,7 +131,7 @@ index 807925f199..b4f86fc611 100644
  /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
   * them in the file system. This is intended to be used to create
   * properly owned directories beneath /tmp, /var/tmp, /run, which are
-@@ -2570,7 +2576,9 @@ finish:
+@@ -2573,7 +2579,9 @@ finish:
 =20
  static int glob_item(Context *c, Item *i, action_t action) {
          _cleanup_globfree_ glob_t g =3D {
@@ -141,7 +141,7 @@ index 807925f199..b4f86fc611 100644
          };
          int r;
 =20
-@@ -2598,7 +2606,9 @@ static int glob_item_recursively(
+@@ -2601,7 +2609,9 @@ static int glob_item_recursively(
                  fdaction_t action) {
 =20
          _cleanup_globfree_ glob_t g =3D {
@@ -152,5 +152,5 @@ index 807925f199..b4f86fc611 100644
          int r;
 =20
 --=20
-2.45.1
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0007-add-missing-FTW_-macr=
os-for-musl.patch b/meta/recipes-core/systemd/systemd/0006-add-missing-FT=
W_-macros-for-musl.patch
similarity index 89%
rename from meta/recipes-core/systemd/systemd/0007-add-missing-FTW_-macro=
s-for-musl.patch
rename to meta/recipes-core/systemd/systemd/0006-add-missing-FTW_-macros-=
for-musl.patch
index 474a7d38d8..578411c4cf 100644
--- a/meta/recipes-core/systemd/systemd/0007-add-missing-FTW_-macros-for-=
musl.patch
+++ b/meta/recipes-core/systemd/systemd/0006-add-missing-FTW_-macros-for-=
musl.patch
@@ -1,7 +1,7 @@
-From 8320725f1a9088623da8753c7077473b98a63107 Mon Sep 17 00:00:00 2001
+From 54b6e10aea2b0fb52782c3a71f06654a89b46bff Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:00:06 +0800
-Subject: [PATCH 07/27] add missing FTW_ macros for musl
+Subject: [PATCH 06/26] add missing FTW_ macros for musl
=20
 This is to avoid build failures like below for musl.
=20
@@ -40,5 +40,5 @@ index 8684d064ec..70fc2b5376 100644
  static char **list_nftw =3D NULL;
 =20
 --=20
-2.45.1
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0008-Use-uintmax_t-for-han=
dling-rlim_t.patch b/meta/recipes-core/systemd/systemd/0007-Use-uintmax_t=
-for-handling-rlim_t.patch
similarity index 93%
rename from meta/recipes-core/systemd/systemd/0008-Use-uintmax_t-for-hand=
ling-rlim_t.patch
rename to meta/recipes-core/systemd/systemd/0007-Use-uintmax_t-for-handli=
ng-rlim_t.patch
index c8598ed2ea..b4a570e1f5 100644
--- a/meta/recipes-core/systemd/systemd/0008-Use-uintmax_t-for-handling-r=
lim_t.patch
+++ b/meta/recipes-core/systemd/systemd/0007-Use-uintmax_t-for-handling-r=
lim_t.patch
@@ -1,7 +1,7 @@
-From 41abe1a4136babfe5df63e9561dcf29d3c8fe6e9 Mon Sep 17 00:00:00 2001
+From 85d8c4c27e855d54c1740902a836c8f2aea9bebc Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:12:41 +0800
-Subject: [PATCH 08/27] Use uintmax_t for handling rlim_t
+Subject: [PATCH 07/26] Use uintmax_t for handling rlim_t
=20
 PRIu{32,64} is not right format to represent rlim_t type
 therefore use %ju and typecast the rlim_t variables to
@@ -27,10 +27,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  3 files changed, 9 insertions(+), 15 deletions(-)
=20
 diff --git a/src/basic/format-util.h b/src/basic/format-util.h
-index ba7cff6a8b..2736abb07b 100644
+index b528c005ca..41c4c095be 100644
 --- a/src/basic/format-util.h
 +++ b/src/basic/format-util.h
-@@ -42,13 +42,7 @@ assert_cc(sizeof(gid_t) =3D=3D sizeof(uint32_t));
+@@ -41,13 +41,7 @@ assert_cc(sizeof(gid_t) =3D=3D sizeof(uint32_t));
  #  error Unknown timex member size
  #endif
 =20
@@ -86,10 +86,10 @@ index a9f7b87f28..059c67731d 100644
          return 1;
  }
 diff --git a/src/core/execute.c b/src/core/execute.c
-index 513e95e09d..0e269617f8 100644
+index 3d55b0b772..4824ff159e 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
-@@ -1067,9 +1067,9 @@ void exec_context_dump(const ExecContext *c, FILE*=
 f, const char *prefix) {
+@@ -1162,9 +1162,9 @@ void exec_context_dump(const ExecContext *c, FILE*=
 f, const char *prefix) {
          for (unsigned i =3D 0; i < RLIM_NLIMITS; i++)
                  if (c->rlimit[i]) {
                          fprintf(f, "%sLimit%s: " RLIM_FMT "\n",
@@ -102,5 +102,5 @@ index 513e95e09d..0e269617f8 100644
 =20
          if (c->ioprio_set) {
 --=20
-2.45.1
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0010-Define-glibc-compatib=
le-basename-for-non-glibc-syste.patch b/meta/recipes-core/systemd/systemd=
/0008-Define-glibc-compatible-basename-for-non-glibc-syste.patch
similarity index 82%
rename from meta/recipes-core/systemd/systemd/0010-Define-glibc-compatibl=
e-basename-for-non-glibc-syste.patch
rename to meta/recipes-core/systemd/systemd/0008-Define-glibc-compatible-=
basename-for-non-glibc-syste.patch
index 162650725d..22e2ceadcc 100644
--- a/meta/recipes-core/systemd/systemd/0010-Define-glibc-compatible-base=
name-for-non-glibc-syste.patch
+++ b/meta/recipes-core/systemd/systemd/0008-Define-glibc-compatible-base=
name-for-non-glibc-syste.patch
@@ -1,7 +1,7 @@
-From ea8e85d92f67a7af8577a4ce7c67c7aaee65d10c Mon Sep 17 00:00:00 2001
+From f4cd939c7cc1ce0a59bab2693768f2c95d9ced00 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 27 May 2018 08:36:44 -0700
-Subject: [PATCH 10/27] Define glibc compatible basename() for non-glibc
+Subject: [PATCH 08/26] Define glibc compatible basename() for non-glibc
  systems
=20
 Fixes builds with musl, even though systemd is adamant about
@@ -15,10 +15,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+)
=20
 diff --git a/src/basic/string-util.h b/src/basic/string-util.h
-index ff5efbcf55..d1a6bb0e76 100644
+index cc6aa183c0..0b035125cd 100644
 --- a/src/basic/string-util.h
 +++ b/src/basic/string-util.h
-@@ -26,6 +26,10 @@
+@@ -27,6 +27,10 @@
  #define URI_UNRESERVED      ALPHANUMERICAL "-._~"       /* [RFC3986] */
  #define URI_VALID           URI_RESERVED URI_UNRESERVED /* [RFC3986] */
 =20
@@ -30,5 +30,5 @@ index ff5efbcf55..d1a6bb0e76 100644
          if (!haystack || !needle)
                  return NULL;
 --=20
-2.45.1
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0011-Do-not-disable-buffer=
ing-when-writing-to-oom_score_a.patch b/meta/recipes-core/systemd/systemd=
/0009-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
similarity index 83%
rename from meta/recipes-core/systemd/systemd/0011-Do-not-disable-bufferi=
ng-when-writing-to-oom_score_a.patch
rename to meta/recipes-core/systemd/systemd/0009-Do-not-disable-buffering=
-when-writing-to-oom_score_a.patch
index 60cec6dc7e..8e3eb15b54 100644
--- a/meta/recipes-core/systemd/systemd/0011-Do-not-disable-buffering-whe=
n-writing-to-oom_score_a.patch
+++ b/meta/recipes-core/systemd/systemd/0009-Do-not-disable-buffering-whe=
n-writing-to-oom_score_a.patch
@@ -1,7 +1,7 @@
-From 7c8634c441401b034cd4bcf4b916a7042076fca8 Mon Sep 17 00:00:00 2001
+From 6959db351fdd551d46e22667deec6032552b2662 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 4 Jul 2018 15:00:44 +0800
-Subject: [PATCH 11/27] Do not disable buffering when writing to oom_scor=
e_adj
+Subject: [PATCH 09/26] Do not disable buffering when writing to oom_scor=
e_adj
=20
 On musl, disabling buffering when writing to oom_score_adj will
 cause the following error.
@@ -24,10 +24,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.co=
m>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/src/basic/process-util.c b/src/basic/process-util.c
-index c9d968dee0..7d6d3ce7db 100644
+index 3253a9c3fb..772c4082a1 100644
 --- a/src/basic/process-util.c
 +++ b/src/basic/process-util.c
-@@ -1816,7 +1816,7 @@ int set_oom_score_adjust(int value) {
+@@ -1848,7 +1848,7 @@ int set_oom_score_adjust(int value) {
          xsprintf(t, "%i", value);
 =20
          return write_string_file("/proc/self/oom_score_adj", t,
@@ -37,5 +37,5 @@ index c9d968dee0..7d6d3ce7db 100644
 =20
  int get_oom_score_adjust(int *ret) {
 --=20
-2.45.1
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0009-don-t-pass-AT_SYMLINK=
_NOFOLLOW-flag-to-faccessat.patch b/meta/recipes-core/systemd/systemd/000=
9-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
deleted file mode 100644
index 851dcbd553..0000000000
--- a/meta/recipes-core/systemd/systemd/0009-don-t-pass-AT_SYMLINK_NOFOLL=
OW-flag-to-faccessat.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From 8af5d1e3c0dc7e71f7a4aee0f539a5d772d47354 Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <armccurdy@gmail.com>
-Date: Tue, 10 Oct 2017 14:33:30 -0700
-Subject: [PATCH 09/27] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat(=
)
-
-Avoid using AT_SYMLINK_NOFOLLOW flag. It doesn't seem like the right
-thing to do and it's not portable (not supported by musl). See:
-
-  http://lists.landley.net/pipermail/toybox-landley.net/2014-September/0=
03610.html
-  http://www.openwall.com/lists/musl/2015/02/05/2
-
-Note that laccess() is never passing AT_EACCESS so a lot of the
-discussion in the links above doesn't apply. Note also that
-(currently) all systemd callers of laccess() pass mode as F_OK, so
-only check for existence of a file, not access permissions.
-Therefore, in this case, the only distiction between faccessat()
-with (flag =3D=3D 0) and (flag =3D=3D AT_SYMLINK_NOFOLLOW) is the behavi=
our
-for broken symlinks; laccess() on a broken symlink will succeed with
-(flag =3D=3D AT_SYMLINK_NOFOLLOW) and fail (flag =3D=3D 0).
-
-The laccess() macros was added to systemd some time ago and it's not
-clear if or why it needs to return success for broken symlinks. Maybe
-just historical and not actually necessary or desired behaviour?
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
----
- src/basic/fs-util.h          | 21 ++++++++++++++++++++-
- src/shared/base-filesystem.c |  6 +++---
- 2 files changed, 23 insertions(+), 4 deletions(-)
-
-diff --git a/src/basic/fs-util.h b/src/basic/fs-util.h
-index 3e2db95304..d5747416b0 100644
---- a/src/basic/fs-util.h
-+++ b/src/basic/fs-util.h
-@@ -49,8 +49,27 @@ int futimens_opath(int fd, const struct timespec ts[2=
]);
- int fd_warn_permissions(const char *path, int fd);
- int stat_warn_permissions(const char *path, const struct stat *st);
-=20
-+/*
-+   Avoid using AT_SYMLINK_NOFOLLOW flag. It doesn't seem like the right=
 thing to
-+   do and it's not portable (not supported by musl). See:
-+
-+     http://lists.landley.net/pipermail/toybox-landley.net/2014-Septemb=
er/003610.html
-+     http://www.openwall.com/lists/musl/2015/02/05/2
-+
-+   Note that laccess() is never passing AT_EACCESS so a lot of the disc=
ussion in
-+   the links above doesn't apply. Note also that (currently) all system=
d callers
-+   of laccess() pass mode as F_OK, so only check for existence of a fil=
e, not
-+   access permissions. Therefore, in this case, the only distiction bet=
ween
-+   faccessat() with (flag =3D=3D 0) and (flag =3D=3D AT_SYMLINK_NOFOLLO=
W) is the
-+   behaviour for broken symlinks; laccess() on a broken symlink will su=
cceed
-+   with (flag =3D=3D AT_SYMLINK_NOFOLLOW) and fail (flag =3D=3D 0).
-+
-+   The laccess() macros was added to systemd some time ago and it's not=
 clear if
-+   or why it needs to return success for broken symlinks. Maybe just hi=
storical
-+   and not actually necessary or desired behaviour?
-+*/
- #define laccess(path, mode)                                            =
 \
--        RET_NERRNO(faccessat(AT_FDCWD, (path), (mode), AT_SYMLINK_NOFOL=
LOW))
-+        RET_NERRNO(faccessat(AT_FDCWD, (path), (mode), 0))
-=20
- int touch_file(const char *path, bool parents, usec_t stamp, uid_t uid,=
 gid_t gid, mode_t mode);
-=20
-diff --git a/src/shared/base-filesystem.c b/src/shared/base-filesystem.c
-index a4e2dae245..67aa8ea1f2 100644
---- a/src/shared/base-filesystem.c
-+++ b/src/shared/base-filesystem.c
-@@ -145,7 +145,7 @@ int base_filesystem_create_fd(int fd, const char *ro=
ot, uid_t uid, gid_t gid) {
-         /* The "root" parameter is decoration only =E2=80=93 it's only =
used as part of log messages */
-=20
-         for (size_t i =3D 0; i < ELEMENTSOF(table); i++) {
--                if (faccessat(fd, table[i].dir, F_OK, AT_SYMLINK_NOFOLL=
OW) >=3D 0)
-+                if (faccessat(fd, table[i].dir, F_OK, 0) >=3D 0)
-                         continue;
-=20
-                 if (table[i].target) { /* Create as symlink? */
-@@ -153,7 +153,7 @@ int base_filesystem_create_fd(int fd, const char *ro=
ot, uid_t uid, gid_t gid) {
-=20
-                         /* check if one of the targets exists */
-                         NULSTR_FOREACH(s, table[i].target) {
--                                if (faccessat(fd, s, F_OK, AT_SYMLINK_N=
OFOLLOW) < 0)
-+                                if (faccessat(fd, s, F_OK, 0) < 0)
-                                         continue;
-=20
-                                 /* check if a specific file exists at t=
he target path */
-@@ -164,7 +164,7 @@ int base_filesystem_create_fd(int fd, const char *ro=
ot, uid_t uid, gid_t gid) {
-                                         if (!p)
-                                                 return log_oom();
-=20
--                                        if (faccessat(fd, p, F_OK, AT_S=
YMLINK_NOFOLLOW) < 0)
-+                                        if (faccessat(fd, p, F_OK, 0) <=
 0)
-                                                 continue;
-                                 }
-=20
---=20
-2.45.1
-
diff --git a/meta/recipes-core/systemd/systemd/0012-distinguish-XSI-compl=
iant-strerror_r-from-GNU-specif.patch b/meta/recipes-core/systemd/systemd=
/0010-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
similarity index 88%
rename from meta/recipes-core/systemd/systemd/0012-distinguish-XSI-compli=
ant-strerror_r-from-GNU-specif.patch
rename to meta/recipes-core/systemd/systemd/0010-distinguish-XSI-complian=
t-strerror_r-from-GNU-specif.patch
index aa3c45cb5f..0dfb77890e 100644
--- a/meta/recipes-core/systemd/systemd/0012-distinguish-XSI-compliant-st=
rerror_r-from-GNU-specif.patch
+++ b/meta/recipes-core/systemd/systemd/0010-distinguish-XSI-compliant-st=
rerror_r-from-GNU-specif.patch
@@ -1,7 +1,7 @@
-From 4a2df0bba1741914617ca1271e2bc68a5d9e5dac Mon Sep 17 00:00:00 2001
+From b7f6c245b4ae72999f23eecc2bbb6d6fb8db667c Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 10 Jul 2018 15:40:17 +0800
-Subject: [PATCH 12/27] distinguish XSI-compliant strerror_r from GNU-spe=
cifi
+Subject: [PATCH 10/26] distinguish XSI-compliant strerror_r from GNU-spe=
cifi
  strerror_r
=20
 XSI-compliant strerror_r and GNU-specifi strerror_r are different.
@@ -24,10 +24,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  2 files changed, 15 insertions(+), 1 deletion(-)
=20
 diff --git a/src/libsystemd/sd-bus/bus-error.c b/src/libsystemd/sd-bus/b=
us-error.c
-index f415797700..a5c6e9a3bd 100644
+index 58c24d25c0..69a0d09d42 100644
 --- a/src/libsystemd/sd-bus/bus-error.c
 +++ b/src/libsystemd/sd-bus/bus-error.c
-@@ -410,7 +410,12 @@ static void bus_error_strerror(sd_bus_error *e, int=
 error) {
+@@ -405,7 +405,12 @@ static void bus_error_strerror(sd_bus_error *e, int=
 error) {
                          return;
 =20
                  errno =3D 0;
@@ -40,7 +40,7 @@ index f415797700..a5c6e9a3bd 100644
                  if (errno =3D=3D ERANGE || strlen(x) >=3D k - 1) {
                          free(m);
                          k *=3D 2;
-@@ -595,8 +600,12 @@ const char* _bus_error_message(const sd_bus_error *=
e, int error, char buf[static
+@@ -590,8 +595,12 @@ const char* _bus_error_message(const sd_bus_error *=
e, int error, char buf[static
 =20
          if (e && e->message)
                  return e->message;
@@ -72,5 +72,5 @@ index 75e8e08add..41e5c7c2b8 100644
                          char error[STRLEN("ERRNO=3D") + DECIMAL_STR_MAX=
(int) + 1];
 =20
 --=20
-2.45.1
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0013-avoid-redefinition-of=
-prctl_mm_map-structure.patch b/meta/recipes-core/systemd/systemd/0011-av=
oid-redefinition-of-prctl_mm_map-structure.patch
similarity index 83%
rename from meta/recipes-core/systemd/systemd/0013-avoid-redefinition-of-=
prctl_mm_map-structure.patch
rename to meta/recipes-core/systemd/systemd/0011-avoid-redefinition-of-pr=
ctl_mm_map-structure.patch
index c48bd58383..16d741cf87 100644
--- a/meta/recipes-core/systemd/systemd/0013-avoid-redefinition-of-prctl_=
mm_map-structure.patch
+++ b/meta/recipes-core/systemd/systemd/0011-avoid-redefinition-of-prctl_=
mm_map-structure.patch
@@ -1,7 +1,7 @@
-From 846b8f16cf07d9187261e06701a75eb208caa707 Mon Sep 17 00:00:00 2001
+From 43b0269e850a2fbcb6ca615258aa8f8a9b4f6a9d Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:44:54 +0800
-Subject: [PATCH 13/27] avoid redefinition of prctl_mm_map structure
+Subject: [PATCH 11/26] avoid redefinition of prctl_mm_map structure
=20
 Fix the following compile failure:
 error: redefinition of 'struct prctl_mm_map'
@@ -28,5 +28,5 @@ index 2c9f9f6c50..65a984b564 100644
  #include "macro.h"
 =20
 --=20
-2.45.1
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0014-do-not-disable-buffer=
-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0012-do-not-d=
isable-buffer-in-writing-files.patch
similarity index 77%
rename from meta/recipes-core/systemd/systemd/0014-do-not-disable-buffer-=
in-writing-files.patch
rename to meta/recipes-core/systemd/systemd/0012-do-not-disable-buffer-in=
-writing-files.patch
index e624c2d71e..00b4b777f4 100644
--- a/meta/recipes-core/systemd/systemd/0014-do-not-disable-buffer-in-wri=
ting-files.patch
+++ b/meta/recipes-core/systemd/systemd/0012-do-not-disable-buffer-in-wri=
ting-files.patch
@@ -1,7 +1,7 @@
-From 88694101bcac461c39049962ce97ce579cc07e13 Mon Sep 17 00:00:00 2001
+From eaf26fdad00448b8cd336eb5db51e0baa8d8e588 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
-Date: Fri, 1 Mar 2019 15:22:15 +0800
-Subject: [PATCH 14/27] do not disable buffer in writing files
+Date: Mon, 16 Dec 2024 14:37:25 +0800
+Subject: [PATCH 12/26] do not disable buffer in writing files
=20
 Do not disable buffer in writing files, otherwise we get
 failure at boot for musl like below.
@@ -22,35 +22,34 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.co=
m>
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 [rebased for systemd 255.1]
 ---
- src/basic/cgroup-util.c              | 12 ++++++------
+ src/basic/cgroup-util.c              |  4 ++--
  src/basic/namespace-util.c           |  4 ++--
  src/basic/procfs-util.c              |  4 ++--
  src/basic/sysctl-util.c              |  2 +-
  src/binfmt/binfmt.c                  |  6 +++---
  src/core/cgroup.c                    |  2 +-
+ src/core/ipe-setup.c                 |  2 +-
  src/core/main.c                      |  2 +-
- src/core/smack-setup.c               |  8 ++++----
+ src/core/smack-setup.c               |  6 +++---
  src/home/homework.c                  |  2 +-
  src/libsystemd/sd-device/sd-device.c |  2 +-
  src/nspawn/nspawn-cgroup.c           |  2 +-
  src/nspawn/nspawn.c                  |  6 +++---
  src/shared/binfmt-util.c             |  2 +-
- src/shared/cgroup-setup.c            |  6 +++---
- src/shared/coredump-util.c           |  4 ++--
+ src/shared/cgroup-setup.c            | 12 ++++++------
+ src/shared/coredump-util.c           |  2 +-
  src/shared/hibernate-util.c          |  4 ++--
  src/shared/smack-util.c              |  2 +-
- src/shared/watchdog.c                |  2 +-
- src/sleep/sleep.c                    |  4 ++--
+ src/sleep/sleep.c                    |  2 +-
  src/storagetm/storagetm.c            | 24 ++++++++++++------------
- src/udev/udev-rules.c                |  1 -
  src/vconsole/vconsole-setup.c        |  2 +-
- 22 files changed, 51 insertions(+), 52 deletions(-)
+ 21 files changed, 47 insertions(+), 47 deletions(-)
=20
 diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
-index 553ee6075a..a3704baf6a 100644
+index 309dccb45a..7aec5072a0 100644
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
-@@ -457,7 +457,7 @@ int cg_kill_kernel_sigkill(const char *path) {
+@@ -495,7 +495,7 @@ int cg_kill_kernel_sigkill(const char *path) {
          if (r < 0)
                  return r;
 =20
@@ -59,43 +58,7 @@ index 553ee6075a..a3704baf6a 100644
          if (r < 0)
                  return log_debug_errno(r, "Failed to write to cgroup.ki=
ll for cgroup '%s': %m", path);
 =20
-@@ -885,7 +885,7 @@ int cg_install_release_agent(const char *controller,=
 const char *agent) {
-=20
-         sc =3D strstrip(contents);
-         if (isempty(sc)) {
--                r =3D write_string_file(fs, agent, WRITE_STRING_FILE_DI=
SABLE_BUFFER);
-+                r =3D write_string_file(fs, agent, 0);
-                 if (r < 0)
-                         return r;
-         } else if (!path_equal(sc, agent))
-@@ -903,7 +903,7 @@ int cg_install_release_agent(const char *controller,=
 const char *agent) {
-=20
-         sc =3D strstrip(contents);
-         if (streq(sc, "0")) {
--                r =3D write_string_file(fs, "1", WRITE_STRING_FILE_DISA=
BLE_BUFFER);
-+                r =3D write_string_file(fs, "1", 0);
-                 if (r < 0)
-                         return r;
-=20
-@@ -930,7 +930,7 @@ int cg_uninstall_release_agent(const char *controlle=
r) {
-         if (r < 0)
-                 return r;
-=20
--        r =3D write_string_file(fs, "0", WRITE_STRING_FILE_DISABLE_BUFF=
ER);
-+        r =3D write_string_file(fs, "0", 0);
-         if (r < 0)
-                 return r;
-=20
-@@ -940,7 +940,7 @@ int cg_uninstall_release_agent(const char *controlle=
r) {
-         if (r < 0)
-                 return r;
-=20
--        r =3D write_string_file(fs, "", WRITE_STRING_FILE_DISABLE_BUFFE=
R);
-+        r =3D write_string_file(fs, "", 0);
-         if (r < 0)
-                 return r;
-=20
-@@ -1833,7 +1833,7 @@ int cg_set_attribute(const char *controller, const=
 char *path, const char *attri
+@@ -1721,7 +1721,7 @@ int cg_set_attribute(const char *controller, const=
 char *path, const char *attri
          if (r < 0)
                  return r;
 =20
@@ -105,10 +68,10 @@ index 553ee6075a..a3704baf6a 100644
 =20
  int cg_get_attribute(const char *controller, const char *path, const ch=
ar *attribute, char **ret) {
 diff --git a/src/basic/namespace-util.c b/src/basic/namespace-util.c
-index 5b4e43f921..42a84ded55 100644
+index 332e8cdfd5..804498127d 100644
 --- a/src/basic/namespace-util.c
 +++ b/src/basic/namespace-util.c
-@@ -325,12 +325,12 @@ int userns_acquire(const char *uid_map, const char=
 *gid_map) {
+@@ -354,12 +354,12 @@ int userns_acquire(const char *uid_map, const char=
 *gid_map) {
                  freeze();
 =20
          xsprintf(path, "/proc/" PID_FMT "/uid_map", pid);
@@ -144,15 +107,15 @@ index d7cfcd9105..58fb5918a3 100644
                  uint64_t threads_max;
 =20
 diff --git a/src/basic/sysctl-util.c b/src/basic/sysctl-util.c
-index 9a1933f579..7d6fc65ee1 100644
+index 2feb4917d7..4c74620a00 100644
 --- a/src/basic/sysctl-util.c
 +++ b/src/basic/sysctl-util.c
-@@ -58,7 +58,7 @@ int sysctl_write(const char *property, const char *val=
ue) {
-=20
-         log_debug("Setting '%s' to '%s'", p, value);
+@@ -97,7 +97,7 @@ int sysctl_write_full(const char *property, const char=
 *value, Hashmap **shadow)
+         if (r < 0)
+                 return r;
 =20
 -        return write_string_file(p, value, WRITE_STRING_FILE_VERIFY_ON_=
FAILURE | WRITE_STRING_FILE_DISABLE_BUFFER | WRITE_STRING_FILE_SUPPRESS_R=
EDUNDANT_VIRTUAL);
-+        return write_string_file(p, value, WRITE_STRING_FILE_VERIFY_ON_=
FAILURE | WRITE_STRING_FILE_SUPPRESS_REDUNDANT_VIRTUAL);
++        return write_string_file(p, value, WRITE_STRING_FILE_VERIFY_ON_=
FAILURE | 0 | WRITE_STRING_FILE_SUPPRESS_REDUNDANT_VIRTUAL);
  }
 =20
  int sysctl_writef(const char *property, const char *format, ...) {
@@ -188,23 +151,36 @@ index d21f3f79ff..258607cc7e 100644
                          log_warning_errno(r, "Failed to flush binfmt_mi=
sc rules, ignoring: %m");
                  else
 diff --git a/src/core/cgroup.c b/src/core/cgroup.c
-index 34fd2a250c..cb1a6d01eb 100644
+index 6933aae54d..ab6fccc0e4 100644
 --- a/src/core/cgroup.c
 +++ b/src/core/cgroup.c
-@@ -5173,7 +5173,7 @@ int unit_cgroup_freezer_action(Unit *u, FreezerAct=
ion action) {
-                        freezer_state_to_string(u->freezer_state),
-                        freezer_state_to_string(next));
+@@ -5167,7 +5167,7 @@ int unit_cgroup_freezer_action(Unit *u, FreezerAct=
ion action) {
+         if (r < 0)
+                 return r;
 =20
--        r =3D write_string_file(path, one_zero(target =3D=3D FREEZER_FR=
OZEN), WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r =3D write_string_file(path, one_zero(target =3D=3D FREEZER_FR=
OZEN), 0);
+-        r =3D write_string_file(path, one_zero(objective =3D=3D FREEZER=
_FROZEN), WRITE_STRING_FILE_DISABLE_BUFFER);
++        r =3D write_string_file(path, one_zero(objective =3D=3D FREEZER=
_FROZEN), 0);
          if (r < 0)
                  return r;
 =20
+diff --git a/src/core/ipe-setup.c b/src/core/ipe-setup.c
+index 4648d43829..80d03d87d4 100644
+--- a/src/core/ipe-setup.c
++++ b/src/core/ipe-setup.c
+@@ -94,7 +94,7 @@ int ipe_setup(void) {
+                 if (!activate_path)
+                         return log_oom();
+=20
+-                r =3D write_string_file(activate_path, "1", WRITE_STRIN=
G_FILE_DISABLE_BUFFER);
++                r =3D write_string_file(activate_path, "1", 0);
+                 if (r =3D=3D -ESTALE) {
+                         log_debug_errno(r,
+                                         "IPE policy %s is already loade=
d with a version that is equal or higher, skipping.",
 diff --git a/src/core/main.c b/src/core/main.c
-index 4b8a315d86..051a31ba84 100644
+index 172742c769..e68ce2a6d8 100644
 --- a/src/core/main.c
 +++ b/src/core/main.c
-@@ -1789,7 +1789,7 @@ static void initialize_core_pattern(bool skip_setu=
p) {
+@@ -1812,7 +1812,7 @@ static void initialize_core_pattern(bool skip_setu=
p) {
          if (getpid_cached() !=3D 1)
                  return;
 =20
@@ -214,7 +190,7 @@ index 4b8a315d86..051a31ba84 100644
                  log_warning_errno(r, "Failed to write '%s' to /proc/sys=
/kernel/core_pattern, ignoring: %m",
                                    arg_early_core_pattern);
 diff --git a/src/core/smack-setup.c b/src/core/smack-setup.c
-index 7ea902b6f9..1aef2988d0 100644
+index 7ea902b6f9..ee4cd56023 100644
 --- a/src/core/smack-setup.c
 +++ b/src/core/smack-setup.c
 @@ -321,17 +321,17 @@ int mac_smack_setup(bool *loaded_policy) {
@@ -230,8 +206,7 @@ index 7ea902b6f9..1aef2988d0 100644
          if (r < 0)
                  log_warning_errno(r, "Failed to set SMACK ambient label=
 \"" SMACK_RUN_LABEL "\": %m");
          r =3D write_string_file("/sys/fs/smackfs/netlabel",
--                              "0.0.0.0/0 " SMACK_RUN_LABEL, WRITE_STRIN=
G_FILE_DISABLE_BUFFER);
-+                              "0.0.0.0/0 " SMACK_RUN_LABEL, 0);
+                               "0.0.0.0/0 " SMACK_RUN_LABEL, WRITE_STRIN=
G_FILE_DISABLE_BUFFER);
          if (r < 0)
                  log_warning_errno(r, "Failed to set SMACK netlabel rule=
 \"0.0.0.0/0 " SMACK_RUN_LABEL "\": %m");
 -        r =3D write_string_file("/sys/fs/smackfs/netlabel", "127.0.0.1 =
-CIPSO", WRITE_STRING_FILE_DISABLE_BUFFER);
@@ -240,24 +215,23 @@ index 7ea902b6f9..1aef2988d0 100644
                  log_warning_errno(r, "Failed to set SMACK netlabel rule=
 \"127.0.0.1 -CIPSO\": %m");
  #endif
 diff --git a/src/home/homework.c b/src/home/homework.c
-index 482db23dbc..ed6b8d271f 100644
+index 00e74894b3..7457113efe 100644
 --- a/src/home/homework.c
 +++ b/src/home/homework.c
-@@ -302,8 +302,8 @@ static void drop_caches_now(void) {
-         /* Drop file system caches now. See https://docs.kernel.org/adm=
in-guide/sysctl/vm.html
+@@ -304,7 +304,7 @@ static void drop_caches_now(void) {
           * for details. We write "3" into /proc/sys/vm/drop_caches to e=
nsure dentries/inodes are flushed, but
           * not more. */
-+        r =3D write_string_file("/proc/sys/vm/drop_caches", "3\n", 0);
 =20
 -        r =3D write_string_file("/proc/sys/vm/drop_caches", "3\n", WRIT=
E_STRING_FILE_DISABLE_BUFFER);
++        r =3D write_string_file("/proc/sys/vm/drop_caches", "3\n", 0);
          if (r < 0)
                  log_warning_errno(r, "Failed to drop caches, ignoring: =
%m");
          else
 diff --git a/src/libsystemd/sd-device/sd-device.c b/src/libsystemd/sd-de=
vice/sd-device.c
-index d8d151835c..268cb65ec7 100644
+index 01fa90b1ff..83ab655bf4 100644
 --- a/src/libsystemd/sd-device/sd-device.c
 +++ b/src/libsystemd/sd-device/sd-device.c
-@@ -2499,7 +2499,7 @@ _public_ int sd_device_set_sysattr_value(sd_device=
 *device, const char *sysattr,
+@@ -2563,7 +2563,7 @@ _public_ int sd_device_set_sysattr_value(sd_device=
 *device, const char *sysattr,
          if (!value)
                  return -ENOMEM;
 =20
@@ -267,7 +241,7 @@ index d8d151835c..268cb65ec7 100644
                  /* On failure, clear cache entry, as we do not know how=
 it fails. */
                  device_remove_cached_sysattr_value(device, sysattr);
 diff --git a/src/nspawn/nspawn-cgroup.c b/src/nspawn/nspawn-cgroup.c
-index 4f28b4a225..c93c2c33b5 100644
+index 4f28b4a225..c899c218b2 100644
 --- a/src/nspawn/nspawn-cgroup.c
 +++ b/src/nspawn/nspawn-cgroup.c
 @@ -93,7 +93,7 @@ int sync_cgroup(pid_t pid, CGroupUnified unified_reque=
sted, uid_t uid_shift) {
@@ -275,15 +249,15 @@ index 4f28b4a225..c93c2c33b5 100644
 =20
          sprintf(pid_string, PID_FMT, pid);
 -        r =3D write_string_file(fn, pid_string, WRITE_STRING_FILE_DISAB=
LE_BUFFER|WRITE_STRING_FILE_MKDIR_0755);
-+        r =3D write_string_file(fn, pid_string, WRITE_STRING_FILE_MKDIR=
_0755);
++        r =3D write_string_file(fn, pid_string, 0|WRITE_STRING_FILE_MKD=
IR_0755);
          if (r < 0) {
                  log_error_errno(r, "Failed to move process: %m");
                  goto finish;
 diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index 5842d3ba8f..44ff9d946c 100644
+index 500725d35f..745b6815db 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
-@@ -2741,7 +2741,7 @@ static int reset_audit_loginuid(void) {
+@@ -2857,7 +2857,7 @@ static int reset_audit_loginuid(void) {
          if (streq(p, "4294967295"))
                  return 0;
 =20
@@ -292,7 +266,7 @@ index 5842d3ba8f..44ff9d946c 100644
          if (r < 0) {
                  log_error_errno(r,
                                  "Failed to reset audit login UID. This =
probably means that your kernel is too\n"
-@@ -4450,7 +4450,7 @@ static int setup_uid_map(
+@@ -4588,7 +4588,7 @@ static int setup_uid_map(
                  return log_oom();
 =20
          xsprintf(uid_map, "/proc/" PID_FMT "/uid_map", pid);
@@ -301,7 +275,7 @@ index 5842d3ba8f..44ff9d946c 100644
          if (r < 0)
                  return log_error_errno(r, "Failed to write UID map: %m"=
);
 =20
-@@ -4460,7 +4460,7 @@ static int setup_uid_map(
+@@ -4598,7 +4598,7 @@ static int setup_uid_map(
                  return log_oom();
 =20
          xsprintf(uid_map, "/proc/" PID_FMT "/gid_map", pid);
@@ -324,10 +298,10 @@ index a26175474b..1413a9c72c 100644
                  return log_warning_errno(r, "Failed to unregister binfm=
t_misc entries: %m");
 =20
 diff --git a/src/shared/cgroup-setup.c b/src/shared/cgroup-setup.c
-index 093b6d0d22..89d0ac612b 100644
+index 49d40f60d8..0f4aa8512a 100644
 --- a/src/shared/cgroup-setup.c
 +++ b/src/shared/cgroup-setup.c
-@@ -364,7 +364,7 @@ int cg_attach(const char *controller, const char *pa=
th, pid_t pid) {
+@@ -369,7 +369,7 @@ int cg_attach(const char *controller, const char *pa=
th, pid_t pid) {
 =20
          xsprintf(c, PID_FMT "\n", pid);
 =20
@@ -336,7 +310,7 @@ index 093b6d0d22..89d0ac612b 100644
          if (r =3D=3D -EOPNOTSUPP && cg_is_threaded(path) > 0)
                  /* When the threaded mode is used, we cannot read/write=
 the file. Let's return recognizable error. */
                  return -EUCLEAN;
-@@ -395,7 +395,7 @@ int cg_fd_attach(int fd, pid_t pid) {
+@@ -399,7 +399,7 @@ int cg_fd_attach(int fd, pid_t pid) {
 =20
          xsprintf(c, PID_FMT "\n", pid);
 =20
@@ -345,28 +319,46 @@ index 093b6d0d22..89d0ac612b 100644
  }
 =20
  int cg_attach_fallback(const char *controller, const char *path, pid_t =
pid) {
-@@ -974,7 +974,7 @@ int cg_enable_everywhere(
-                                         return log_debug_errno(errno, "=
Failed to open cgroup.subtree_control file of %s: %m", p);
-                         }
-=20
--                        r =3D write_string_stream(f, s, WRITE_STRING_FI=
LE_DISABLE_BUFFER);
-+                        r =3D write_string_stream(f, s, 0);
-                         if (r < 0) {
-                                 log_debug_errno(r, "Failed to %s contro=
ller %s for %s (%s): %m",
-                                                 FLAGS_SET(mask, bit) ? =
"enable" : "disable", n, p, fs);
+@@ -1049,7 +1049,7 @@ int cg_install_release_agent(const char *controlle=
r, const char *agent) {
+=20
+         sc =3D strstrip(contents);
+         if (isempty(sc)) {
+-                r =3D write_string_file(fs, agent, WRITE_STRING_FILE_DI=
SABLE_BUFFER);
++                r =3D write_string_file(fs, agent, 0);
+                 if (r < 0)
+                         return r;
+         } else if (!path_equal(sc, agent))
+@@ -1067,7 +1067,7 @@ int cg_install_release_agent(const char *controlle=
r, const char *agent) {
+=20
+         sc =3D strstrip(contents);
+         if (streq(sc, "0")) {
+-                r =3D write_string_file(fs, "1", WRITE_STRING_FILE_DISA=
BLE_BUFFER);
++                r =3D write_string_file(fs, "1", 0);
+                 if (r < 0)
+                         return r;
+=20
+@@ -1094,7 +1094,7 @@ int cg_uninstall_release_agent(const char *control=
ler) {
+         if (r < 0)
+                 return r;
+=20
+-        r =3D write_string_file(fs, "0", WRITE_STRING_FILE_DISABLE_BUFF=
ER);
++        r =3D write_string_file(fs, "0", 0);
+         if (r < 0)
+                 return r;
+=20
+@@ -1104,7 +1104,7 @@ int cg_uninstall_release_agent(const char *control=
ler) {
+         if (r < 0)
+                 return r;
+=20
+-        r =3D write_string_file(fs, "", WRITE_STRING_FILE_DISABLE_BUFFE=
R);
++        r =3D write_string_file(fs, "", 0);
+         if (r < 0)
+                 return r;
+=20
 diff --git a/src/shared/coredump-util.c b/src/shared/coredump-util.c
-index 805503f366..01a7ccb291 100644
+index 805503f366..3234a1d76e 100644
 --- a/src/shared/coredump-util.c
 +++ b/src/shared/coredump-util.c
-@@ -163,7 +163,7 @@ int set_coredump_filter(uint64_t value) {
-         xsprintf(t, "0x%"PRIx64, value);
-=20
-         return write_string_file("/proc/self/coredump_filter", t,
--                                 WRITE_STRING_FILE_VERIFY_ON_FAILURE|WR=
ITE_STRING_FILE_DISABLE_BUFFER);
-+                                 0);
- }
-=20
- /* Turn off core dumps but only if we're running outside of a container=
. */
 @@ -173,7 +173,7 @@ void disable_coredumps(void) {
          if (detect_container() > 0)
                  return;
@@ -377,7 +369,7 @@ index 805503f366..01a7ccb291 100644
                  log_debug_errno(r, "Failed to turn off coredumps, ignor=
ing: %m");
  }
 diff --git a/src/shared/hibernate-util.c b/src/shared/hibernate-util.c
-index 7c21157580..06ab74b04c 100644
+index 1213fdc2c7..4c26e6a4ee 100644
 --- a/src/shared/hibernate-util.c
 +++ b/src/shared/hibernate-util.c
 @@ -495,7 +495,7 @@ int write_resume_config(dev_t devno, uint64_t offset=
, const char *device) {
@@ -399,7 +391,7 @@ index 7c21157580..06ab74b04c 100644
                  return log_error_errno(r,
                                         "Failed to write device '%s' (%s=
) to /sys/power/resume: %m",
 diff --git a/src/shared/smack-util.c b/src/shared/smack-util.c
-index 1f88e724d0..feb18b320a 100644
+index d0a79b2635..0c82d9943a 100644
 --- a/src/shared/smack-util.c
 +++ b/src/shared/smack-util.c
 @@ -113,7 +113,7 @@ int mac_smack_apply_pid(pid_t pid, const char *label=
) {
@@ -411,33 +403,11 @@ index 1f88e724d0..feb18b320a 100644
          if (r < 0)
                  return r;
 =20
-diff --git a/src/shared/watchdog.c b/src/shared/watchdog.c
-index 810c5b5206..be0d127ff3 100644
---- a/src/shared/watchdog.c
-+++ b/src/shared/watchdog.c
-@@ -93,7 +93,7 @@ static int watchdog_set_pretimeout_governor(const char=
 *governor) {
-=20
-         r =3D write_string_file(sys_fn,
-                               governor,
--                              WRITE_STRING_FILE_DISABLE_BUFFER | WRITE_=
STRING_FILE_VERIFY_ON_FAILURE | WRITE_STRING_FILE_VERIFY_IGNORE_NEWLINE);
-+                              WRITE_STRING_FILE_VERIFY_ON_FAILURE | WRI=
TE_STRING_FILE_VERIFY_IGNORE_NEWLINE);
-         if (r < 0)
-                 return log_error_errno(r, "Failed to set watchdog preti=
meout_governor to '%s': %m", governor);
-=20
 diff --git a/src/sleep/sleep.c b/src/sleep/sleep.c
-index 0402bb07f3..a6cbb45340 100644
+index 181bb4ccef..2dbb3f4bc6 100644
 --- a/src/sleep/sleep.c
 +++ b/src/sleep/sleep.c
-@@ -139,7 +139,7 @@ static int write_state(int fd, char * const *states)=
 {
-                 if (k < 0)
-                         return RET_GATHER(r, k);
-=20
--                k =3D write_string_stream(f, *state, WRITE_STRING_FILE_=
DISABLE_BUFFER);
-+                k =3D write_string_stream(f, *state, 0);
-                 if (k >=3D 0) {
-                         log_debug("Using sleep state '%s'.", *state);
-                         return 0;
-@@ -157,7 +157,7 @@ static int write_mode(const char *path, char * const=
 *modes) {
+@@ -158,7 +158,7 @@ static int write_mode(const char *path, char * const=
 *modes) {
          assert(path);
 =20
          STRV_FOREACH(mode, modes) {
@@ -447,10 +417,10 @@ index 0402bb07f3..a6cbb45340 100644
                          log_debug("Using sleep mode '%s' for %s.", *mod=
e, path);
                          return 0;
 diff --git a/src/storagetm/storagetm.c b/src/storagetm/storagetm.c
-index 1bb8eec316..cf9b4c4a21 100644
+index ca8e886d37..5c27c54f09 100644
 --- a/src/storagetm/storagetm.c
 +++ b/src/storagetm/storagetm.c
-@@ -186,7 +186,7 @@ static int nvme_subsystem_unlink(NvmeSubsystem *s) {
+@@ -197,7 +197,7 @@ static int nvme_subsystem_unlink(NvmeSubsystem *s) {
                                          if (!enable_fn)
                                                  return log_oom();
 =20
@@ -459,7 +429,7 @@ index 1bb8eec316..cf9b4c4a21 100644
                                          if (r < 0)
                                                  log_warning_errno(r, "F=
ailed to disable namespace '%s' of NVME subsystem '%s', ignoring: %m", e-=
>d_name, s->name);
 =20
-@@ -254,7 +254,7 @@ static int nvme_subsystem_write_metadata(int subsyst=
em_fd, sd_device *device) {
+@@ -265,7 +265,7 @@ static int nvme_subsystem_write_metadata(int subsyst=
em_fd, sd_device *device) {
                  _cleanup_free_ char *truncated =3D strndup(w, 40); /* k=
ernel refuses more than 40 chars (as per nvme spec) */
 =20
                  /* The default string stored in 'attr_model' is "Linux"=
 btw. */
@@ -468,7 +438,7 @@ index 1bb8eec316..cf9b4c4a21 100644
                  if (r < 0)
                          log_warning_errno(r, "Failed to set model of su=
bsystem to '%s', ignoring: %m", w);
          }
-@@ -268,7 +268,7 @@ static int nvme_subsystem_write_metadata(int subsyst=
em_fd, sd_device *device) {
+@@ -279,7 +279,7 @@ static int nvme_subsystem_write_metadata(int subsyst=
em_fd, sd_device *device) {
                          return log_oom();
 =20
                   /* The default string stored in 'attr_firmware' is `un=
ame -r` btw, but truncated to 8 chars. */
@@ -477,7 +447,7 @@ index 1bb8eec316..cf9b4c4a21 100644
                  if (r < 0)
                          log_warning_errno(r, "Failed to set model of su=
bsystem to '%s', ignoring: %m", truncated);
          }
-@@ -295,7 +295,7 @@ static int nvme_subsystem_write_metadata(int subsyst=
em_fd, sd_device *device) {
+@@ -306,7 +306,7 @@ static int nvme_subsystem_write_metadata(int subsyst=
em_fd, sd_device *device) {
                  if (!truncated)
                          return log_oom();
 =20
@@ -486,7 +456,7 @@ index 1bb8eec316..cf9b4c4a21 100644
                  if (r < 0)
                          log_warning_errno(r, "Failed to set serial of s=
ubsystem to '%s', ignoring: %m", truncated);
          }
-@@ -345,7 +345,7 @@ static int nvme_namespace_write_metadata(int namespa=
ce_fd, sd_device *device, co
+@@ -356,7 +356,7 @@ static int nvme_namespace_write_metadata(int namespa=
ce_fd, sd_device *device, co
                  id =3D id128_digest(j, l);
          }
 =20
@@ -495,7 +465,7 @@ index 1bb8eec316..cf9b4c4a21 100644
          if (r < 0)
                  log_warning_errno(r, "Failed to set uuid of namespace t=
o '%s', ignoring: %m", SD_ID128_TO_UUID_STRING(id));
 =20
-@@ -408,7 +408,7 @@ static int nvme_subsystem_add(const char *node, int =
consumed_fd, sd_device *devi
+@@ -419,7 +419,7 @@ static int nvme_subsystem_add(const char *node, int =
consumed_fd, sd_device *devi
          if (subsystem_fd < 0)
                  return log_error_errno(subsystem_fd, "Failed to create =
NVME subsystem '%s': %m", j);
 =20
@@ -504,7 +474,7 @@ index 1bb8eec316..cf9b4c4a21 100644
          if (r < 0)
                  return log_error_errno(r, "Failed to set 'attr_allow_an=
y_host' flag: %m");
 =20
-@@ -423,11 +423,11 @@ static int nvme_subsystem_add(const char *node, in=
t consumed_fd, sd_device *devi
+@@ -434,11 +434,11 @@ static int nvme_subsystem_add(const char *node, in=
t consumed_fd, sd_device *devi
 =20
          /* We use /proc/$PID/fd/$FD rather than /proc/self/fd/$FD, beca=
use this string is visible to others
           * via configfs, and by including the PID it's clear to who the=
 stuff belongs. */
@@ -518,7 +488,7 @@ index 1bb8eec316..cf9b4c4a21 100644
          if (r < 0)
                  return log_error_errno(r, "Failed to write 'enable' att=
ribute: %m");
 =20
-@@ -557,19 +557,19 @@ static int nvme_port_add_portnr(
+@@ -568,19 +568,19 @@ static int nvme_port_add_portnr(
                  return 0;
          }
 =20
@@ -542,18 +512,6 @@ index 1bb8eec316..cf9b4c4a21 100644
          if (r < 0)
                  return log_error_errno(r, "Failed to set IP address on =
NVME port %" PRIu16 ": %m", portnr);
 =20
-diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
-index 581bbaf345..cdf648a2d1 100644
---- a/src/udev/udev-rules.c
-+++ b/src/udev/udev-rules.c
-@@ -2706,7 +2706,6 @@ static int udev_rule_apply_token_to_event(
-                         log_event_debug(dev, token, "Writing ATTR{'%s'}=
=3D\"%s\".", buf, value);
-                         r =3D write_string_file(buf, value,
-                                               WRITE_STRING_FILE_VERIFY_=
ON_FAILURE |
--                                              WRITE_STRING_FILE_DISABLE=
_BUFFER |
-                                               WRITE_STRING_FILE_AVOID_N=
EWLINE |
-                                               WRITE_STRING_FILE_VERIFY_=
IGNORE_NEWLINE);
-                         if (r < 0)
 diff --git a/src/vconsole/vconsole-setup.c b/src/vconsole/vconsole-setup=
.c
 index ba742dda69..6f20e81615 100644
 --- a/src/vconsole/vconsole-setup.c
@@ -568,5 +526,5 @@ index ba742dda69..6f20e81615 100644
                  return log_warning_errno(r, "Failed to %s sysfs UTF-8 f=
lag: %m", enable_disable(utf8));
 =20
 --=20
-2.45.1
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0015-Handle-__cpu_mask-usa=
ge.patch b/meta/recipes-core/systemd/systemd/0013-Handle-__cpu_mask-usage=
.patch
similarity index 92%
rename from meta/recipes-core/systemd/systemd/0015-Handle-__cpu_mask-usag=
e.patch
rename to meta/recipes-core/systemd/systemd/0013-Handle-__cpu_mask-usage.=
patch
index 86003db4de..35009cba42 100644
--- a/meta/recipes-core/systemd/systemd/0015-Handle-__cpu_mask-usage.patc=
h
+++ b/meta/recipes-core/systemd/systemd/0013-Handle-__cpu_mask-usage.patc=
h
@@ -1,7 +1,7 @@
-From c1cbec8571855b8480d56dcad2ab81aea0782bd4 Mon Sep 17 00:00:00 2001
+From ab4fda874b26542de96720db58cb0e8704a40108 Mon Sep 17 00:00:00 2001
 From: Scott Murray <scott.murray@konsulko.com>
 Date: Fri, 13 Sep 2019 19:26:27 -0400
-Subject: [PATCH 15/27] Handle __cpu_mask usage
+Subject: [PATCH 13/26] Handle __cpu_mask usage
=20
 Fixes errors:
=20
@@ -24,7 +24,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  2 files changed, 3 insertions(+), 1 deletion(-)
=20
 diff --git a/src/shared/cpu-set-util.h b/src/shared/cpu-set-util.h
-index 618fe1b0a3..46c92077b0 100644
+index 2c477d8a01..c026ce77a6 100644
 --- a/src/shared/cpu-set-util.h
 +++ b/src/shared/cpu-set-util.h
 @@ -6,6 +6,8 @@
@@ -56,5 +56,5 @@ index ea0c58770e..b65c0bd370 100644
  /* Print information about various types. Useful when diagnosing
   * gcc diagnostics on an unfamiliar architecture. */
 --=20
-2.45.1
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0016-Handle-missing-gshado=
w.patch b/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow.p=
atch
similarity index 84%
rename from meta/recipes-core/systemd/systemd/0016-Handle-missing-gshadow=
.patch
rename to meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow.p=
atch
index 6c7b233f95..08d4e384ff 100644
--- a/meta/recipes-core/systemd/systemd/0016-Handle-missing-gshadow.patch
+++ b/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow.patch
@@ -1,7 +1,7 @@
-From 8b540d8240bbc3f917de9ca8d3b62f28c3424d91 Mon Sep 17 00:00:00 2001
+From c5165f6adf8a9cfe8c0784c598b87d7d7e8b7d1a Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Tue, 10 Mar 2020 11:05:20 +0000
-Subject: [PATCH 16/27] Handle missing gshadow
+Subject: [PATCH 14/26] Handle missing gshadow
=20
 gshadow usage is now present in the userdb code. Mask all uses of it to
 allow compilation on musl
@@ -17,7 +17,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.c=
om>
  3 files changed, 30 insertions(+), 1 deletion(-)
=20
 diff --git a/src/shared/user-record-nss.c b/src/shared/user-record-nss.c
-index ffb5721466..4d01815c8c 100644
+index 9223a2e6ca..f9eb1a5b64 100644
 --- a/src/shared/user-record-nss.c
 +++ b/src/shared/user-record-nss.c
 @@ -286,8 +286,10 @@ int nss_group_to_group_record(
@@ -45,9 +45,9 @@ index ffb5721466..4d01815c8c 100644
          }
 +#endif
 =20
-         r =3D json_build(&g->json, JSON_BUILD_OBJECT(
-                                        JSON_BUILD_PAIR("groupName", JSO=
N_BUILD_STRING(g->group_name)),
-@@ -344,6 +348,7 @@ int nss_sgrp_for_group(const struct group *grp, stru=
ct sgrp *ret_sgrp, char **re
+         r =3D sd_json_buildo(
+                         &g->json,
+@@ -345,6 +349,7 @@ int nss_sgrp_for_group(const struct group *grp, stru=
ct sgrp *ret_sgrp, char **re
          assert(ret_sgrp);
          assert(ret_buffer);
 =20
@@ -55,7 +55,7 @@ index ffb5721466..4d01815c8c 100644
          for (;;) {
                  _cleanup_free_ char *buf =3D NULL;
                  struct sgrp sgrp, *result;
-@@ -372,6 +377,9 @@ int nss_sgrp_for_group(const struct group *grp, stru=
ct sgrp *ret_sgrp, char **re
+@@ -373,6 +378,9 @@ int nss_sgrp_for_group(const struct group *grp, stru=
ct sgrp *ret_sgrp, char **re
                  buflen *=3D 2;
                  buf =3D mfree(buf);
          }
@@ -65,7 +65,7 @@ index ffb5721466..4d01815c8c 100644
  }
 =20
  int nss_group_record_by_name(
-@@ -382,7 +390,9 @@ int nss_group_record_by_name(
+@@ -383,7 +391,9 @@ int nss_group_record_by_name(
          _cleanup_free_ char *sbuf =3D NULL;
          _cleanup_free_ struct group *result =3D NULL;
          bool incomplete =3D false;
@@ -75,7 +75,7 @@ index ffb5721466..4d01815c8c 100644
          int r;
 =20
          assert(name);
-@@ -391,6 +401,7 @@ int nss_group_record_by_name(
+@@ -392,6 +402,7 @@ int nss_group_record_by_name(
          if (r < 0)
                  return r;
 =20
@@ -83,7 +83,7 @@ index ffb5721466..4d01815c8c 100644
          if (with_shadow) {
                  r =3D nss_sgrp_for_group(result, &sgrp, &sbuf);
                  if (r < 0) {
-@@ -402,6 +413,9 @@ int nss_group_record_by_name(
+@@ -403,6 +414,9 @@ int nss_group_record_by_name(
                  incomplete =3D true;
 =20
          r =3D nss_group_to_group_record(result, sresult, ret);
@@ -93,7 +93,7 @@ index ffb5721466..4d01815c8c 100644
          if (r < 0)
                  return r;
 =20
-@@ -418,13 +432,16 @@ int nss_group_record_by_gid(
+@@ -419,13 +433,16 @@ int nss_group_record_by_gid(
          _cleanup_free_ char *sbuf =3D NULL;
          _cleanup_free_ struct group *result =3D NULL;
          bool incomplete =3D false;
@@ -110,7 +110,7 @@ index ffb5721466..4d01815c8c 100644
          if (with_shadow) {
                  r =3D nss_sgrp_for_group(result, &sgrp, &sbuf);
                  if (r < 0) {
-@@ -436,6 +453,9 @@ int nss_group_record_by_gid(
+@@ -437,6 +454,9 @@ int nss_group_record_by_gid(
                  incomplete =3D true;
 =20
          r =3D nss_group_to_group_record(result, sresult, ret);
@@ -137,10 +137,10 @@ index 22ab04d6ee..4e52e7a911 100644
  #include <shadow.h>
 =20
 diff --git a/src/shared/userdb.c b/src/shared/userdb.c
-index 75dece3442..5628e1410f 100644
+index ff83d4bf90..54d36cc706 100644
 --- a/src/shared/userdb.c
 +++ b/src/shared/userdb.c
-@@ -1038,13 +1038,15 @@ int groupdb_iterator_get(UserDBIterator *iterato=
r, GroupRecord **ret) {
+@@ -1041,13 +1041,15 @@ int groupdb_iterator_get(UserDBIterator *iterato=
r, GroupRecord **ret) {
                  if (gr) {
                          _cleanup_free_ char *buffer =3D NULL;
                          bool incomplete =3D false;
@@ -157,7 +157,7 @@ index 75dece3442..5628e1410f 100644
                          if (!FLAGS_SET(iterator->flags, USERDB_SUPPRESS=
_SHADOW)) {
                                  r =3D nss_sgrp_for_group(gr, &sgrp, &bu=
ffer);
                                  if (r < 0) {
-@@ -1057,6 +1059,9 @@ int groupdb_iterator_get(UserDBIterator *iterator,=
 GroupRecord **ret) {
+@@ -1060,6 +1062,9 @@ int groupdb_iterator_get(UserDBIterator *iterator,=
 GroupRecord **ret) {
                          }
 =20
                          r =3D nss_group_to_group_record(gr, r >=3D 0 ? =
&sgrp : NULL, ret);
@@ -168,5 +168,5 @@ index 75dece3442..5628e1410f 100644
                                  return r;
 =20
 --=20
-2.45.1
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0017-missing_syscall.h-Def=
ine-MIPS-ABI-defines-for-musl.patch b/meta/recipes-core/systemd/systemd/0=
015-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
similarity index 75%
rename from meta/recipes-core/systemd/systemd/0017-missing_syscall.h-Defi=
ne-MIPS-ABI-defines-for-musl.patch
rename to meta/recipes-core/systemd/systemd/0015-missing_syscall.h-Define=
-MIPS-ABI-defines-for-musl.patch
index a7a641e0ad..f0aa3a0bd8 100644
--- a/meta/recipes-core/systemd/systemd/0017-missing_syscall.h-Define-MIP=
S-ABI-defines-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0015-missing_syscall.h-Define-MIP=
S-ABI-defines-for-musl.patch
@@ -1,7 +1,7 @@
-From 45bb63a1727097683acad23f270968026671ec6a Mon Sep 17 00:00:00 2001
+From ef9ad83759f78de983d2d7c4f95bc48b83bb8f66 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 12 Apr 2021 23:44:53 -0700
-Subject: [PATCH 17/27] missing_syscall.h: Define MIPS ABI defines for mu=
sl
+Subject: [PATCH 15/26] missing_syscall.h: Define MIPS ABI defines for mu=
sl
=20
 musl does not define _MIPS_SIM_ABI32, _MIPS_SIM_NABI32, _MIPS_SIM_ABI64
 unlike glibc where these are provided by libc headers, therefore define
@@ -15,6 +15,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/shared/base-filesystem.c | 1 +
  2 files changed, 7 insertions(+)
=20
+diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
+index e2cd8b4e35..f2fe489de7 100644
 --- a/src/basic/missing_syscall.h
 +++ b/src/basic/missing_syscall.h
 @@ -20,6 +20,12 @@
@@ -30,6 +32,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include "macro.h"
  #include "missing_keyctl.h"
  #include "missing_sched.h"
+diff --git a/src/shared/base-filesystem.c b/src/shared/base-filesystem.c
+index 389c77eee0..e3627c4603 100644
 --- a/src/shared/base-filesystem.c
 +++ b/src/shared/base-filesystem.c
 @@ -20,6 +20,7 @@
@@ -40,3 +44,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 =20
  typedef struct BaseFilesystem {
          const char *dir;      /* directory or symlink to create */
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd/0018-pass-correct-paramete=
rs-to-getdents64.patch b/meta/recipes-core/systemd/systemd/0016-pass-corr=
ect-parameters-to-getdents64.patch
similarity index 90%
rename from meta/recipes-core/systemd/systemd/0018-pass-correct-parameter=
s-to-getdents64.patch
rename to meta/recipes-core/systemd/systemd/0016-pass-correct-parameters-=
to-getdents64.patch
index b4b6be0e75..b802106155 100644
--- a/meta/recipes-core/systemd/systemd/0018-pass-correct-parameters-to-g=
etdents64.patch
+++ b/meta/recipes-core/systemd/systemd/0016-pass-correct-parameters-to-g=
etdents64.patch
@@ -1,7 +1,7 @@
-From 78a59a540d425e677d5652d9b72d7b175e36f4dd Mon Sep 17 00:00:00 2001
+From 9079b158779a9c395c24f882f72a1c734795045d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 21 Jan 2022 15:15:11 -0800
-Subject: [PATCH 18/27] pass correct parameters to getdents64
+Subject: [PATCH 16/26] pass correct parameters to getdents64
=20
 Fixes
 ../git/src/basic/recurse-dir.c:57:40: error: incompatible pointer types =
passing 'uint8_t *' (aka 'unsigned char *') to parameter of type 'struct =
dirent *' [-Werror,-Wincompatible-pointer-types]
@@ -20,7 +20,7 @@ Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.c=
om>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/src/basic/recurse-dir.c b/src/basic/recurse-dir.c
-index 776733148b..d37419658c 100644
+index 378fd92b06..5b567b457d 100644
 --- a/src/basic/recurse-dir.c
 +++ b/src/basic/recurse-dir.c
 @@ -56,7 +56,7 @@ int readdir_all(int dir_fd,
@@ -33,5 +33,5 @@ index 776733148b..d37419658c 100644
                          return -errno;
                  if (n =3D=3D 0)
 --=20
-2.45.1
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0019-Adjust-for-musl-heade=
rs.patch b/meta/recipes-core/systemd/systemd/0017-Adjust-for-musl-headers=
.patch
similarity index 90%
rename from meta/recipes-core/systemd/systemd/0019-Adjust-for-musl-header=
s.patch
rename to meta/recipes-core/systemd/systemd/0017-Adjust-for-musl-headers.=
patch
index 44eebe16b3..5a2bc3c552 100644
--- a/meta/recipes-core/systemd/systemd/0019-Adjust-for-musl-headers.patc=
h
+++ b/meta/recipes-core/systemd/systemd/0017-Adjust-for-musl-headers.patc=
h
@@ -1,7 +1,7 @@
-From 585e04673da62a8bf50e00fd6c1ae9ffc66c3b2f Mon Sep 17 00:00:00 2001
+From be9d8f221ab9d31c0df8b2b3e66172bb9bc0f71f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 21 Jan 2022 22:19:37 -0800
-Subject: [PATCH 19/27] Adjust for musl headers
+Subject: [PATCH 17/26] Adjust for musl headers
=20
 Upstream-Status: Inappropriate [musl specific]
=20
@@ -10,6 +10,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 [Rebased for v255.1]
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
+ src/basic/linux/ethtool.h                     | 3 ++-
  src/libsystemd-network/sd-dhcp6-client.c      | 2 +-
  src/network/netdev/bareudp.c                  | 2 +-
  src/network/netdev/batadv.c                   | 2 +-
@@ -43,11 +44,24 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  src/network/networkd-ndisc.c                  | 2 +-
  src/network/networkd-setlink.c                | 2 +-
  src/network/networkd-sysctl.c                 | 2 +-
- src/shared/linux/ethtool.h                    | 3 ++-
  src/shared/netif-util.c                       | 2 +-
  src/udev/udev-builtin-net_id.c                | 2 +-
  36 files changed, 40 insertions(+), 36 deletions(-)
=20
+diff --git a/src/basic/linux/ethtool.h b/src/basic/linux/ethtool.h
+index a32293ba20..2aad67e9c0 100644
+--- a/src/basic/linux/ethtool.h
++++ b/src/basic/linux/ethtool.h
+@@ -16,7 +16,8 @@
+=20
+ #include <linux/const.h>
+ #include <linux/types.h>
+-#include <linux/if_ether.h>
++#include <netinet/if_ether.h>
++//#include <linux/if_ether.h>
+=20
+ #include <limits.h> /* for INT_MAX */
+=20
 diff --git a/src/libsystemd-network/sd-dhcp6-client.c b/src/libsystemd-n=
etwork/sd-dhcp6-client.c
 index 3e992d7cad..c7e1ff4dbf 100644
 --- a/src/libsystemd-network/sd-dhcp6-client.c
@@ -62,7 +76,7 @@ index 3e992d7cad..c7e1ff4dbf 100644
 =20
  #include "sd-dhcp6-client.h"
 diff --git a/src/network/netdev/bareudp.c b/src/network/netdev/bareudp.c
-index 1df886573b..c8b6714726 100644
+index e122abd97f..c120c2969b 100644
 --- a/src/network/netdev/bareudp.c
 +++ b/src/network/netdev/bareudp.c
 @@ -2,7 +2,7 @@
@@ -75,7 +89,7 @@ index 1df886573b..c8b6714726 100644
  #include "bareudp.h"
  #include "netlink-util.h"
 diff --git a/src/network/netdev/batadv.c b/src/network/netdev/batadv.c
-index 26da0231d4..2e8002af8c 100644
+index 9806d8eb7c..19c3d881c2 100644
 --- a/src/network/netdev/batadv.c
 +++ b/src/network/netdev/batadv.c
 @@ -3,7 +3,7 @@
@@ -88,7 +102,7 @@ index 26da0231d4..2e8002af8c 100644
  #include "batadv.h"
  #include "fileio.h"
 diff --git a/src/network/netdev/bond.c b/src/network/netdev/bond.c
-index 52a7f126b6..74ca0812db 100644
+index b866940b7a..a0eaf0a866 100644
 --- a/src/network/netdev/bond.c
 +++ b/src/network/netdev/bond.c
 @@ -1,7 +1,7 @@
@@ -101,7 +115,7 @@ index 52a7f126b6..74ca0812db 100644
  #include "alloc-util.h"
  #include "bond.h"
 diff --git a/src/network/netdev/bridge.c b/src/network/netdev/bridge.c
-index d426c0c501..14432adb95 100644
+index d3ba4989d9..4f7301c4f1 100644
 --- a/src/network/netdev/bridge.c
 +++ b/src/network/netdev/bridge.c
 @@ -2,7 +2,8 @@
@@ -115,7 +129,7 @@ index d426c0c501..14432adb95 100644
  #include <netinet/in.h>
 =20
 diff --git a/src/network/netdev/dummy.c b/src/network/netdev/dummy.c
-index 00df1d2787..77b506b422 100644
+index 8b2893d5b4..412123f036 100644
 --- a/src/network/netdev/dummy.c
 +++ b/src/network/netdev/dummy.c
 @@ -1,6 +1,6 @@
@@ -127,7 +141,7 @@ index 00df1d2787..77b506b422 100644
  #include "dummy.h"
 =20
 diff --git a/src/network/netdev/geneve.c b/src/network/netdev/geneve.c
-index 22c2b00e1b..1d762c4911 100644
+index 1d68be9bc8..539151c49e 100644
 --- a/src/network/netdev/geneve.c
 +++ b/src/network/netdev/geneve.c
 @@ -2,7 +2,7 @@
@@ -153,7 +167,7 @@ index d7ff44cb9e..e037629ae4 100644
  #include "ifb.h"
 =20
 diff --git a/src/network/netdev/ipoib.c b/src/network/netdev/ipoib.c
-index d5fe299b7b..c9c8002eac 100644
+index 6932c62e2a..fc458da9e8 100644
 --- a/src/network/netdev/ipoib.c
 +++ b/src/network/netdev/ipoib.c
 @@ -1,6 +1,6 @@
@@ -165,7 +179,7 @@ index d5fe299b7b..c9c8002eac 100644
 =20
  #include "ipoib.h"
 diff --git a/src/network/netdev/ipvlan.c b/src/network/netdev/ipvlan.c
-index 51ae64341d..46460efabd 100644
+index 6e50f72aaa..49acfee25e 100644
 --- a/src/network/netdev/ipvlan.c
 +++ b/src/network/netdev/ipvlan.c
 @@ -3,7 +3,7 @@
@@ -178,7 +192,7 @@ index 51ae64341d..46460efabd 100644
  #include "conf-parser.h"
  #include "ipvlan.h"
 diff --git a/src/network/netdev/macsec.c b/src/network/netdev/macsec.c
-index 4b9f19cc95..6c4951a7e6 100644
+index 6dd434f803..f9fbe9f51a 100644
 --- a/src/network/netdev/macsec.c
 +++ b/src/network/netdev/macsec.c
 @@ -1,7 +1,7 @@
@@ -191,7 +205,7 @@ index 4b9f19cc95..6c4951a7e6 100644
  #include <linux/if_macsec.h>
  #include <linux/genetlink.h>
 diff --git a/src/network/netdev/macvlan.c b/src/network/netdev/macvlan.c
-index 21933d3970..a4ace19dc6 100644
+index fd112b58e1..b038740bda 100644
 --- a/src/network/netdev/macvlan.c
 +++ b/src/network/netdev/macvlan.c
 @@ -3,7 +3,7 @@
@@ -204,7 +218,7 @@ index 21933d3970..a4ace19dc6 100644
  #include "conf-parser.h"
  #include "macvlan.h"
 diff --git a/src/network/netdev/netdev.c b/src/network/netdev/netdev.c
-index 2b411425ba..fe00200135 100644
+index c2986aafb5..147f1c95d0 100644
 --- a/src/network/netdev/netdev.c
 +++ b/src/network/netdev/netdev.c
 @@ -3,7 +3,7 @@
@@ -217,7 +231,7 @@ index 2b411425ba..fe00200135 100644
 =20
  #include "alloc-util.h"
 diff --git a/src/network/netdev/netdevsim.c b/src/network/netdev/netdevs=
im.c
-index 15d5c132f9..a3ffa48b15 100644
+index 59958c3bbe..61169016b0 100644
 --- a/src/network/netdev/netdevsim.c
 +++ b/src/network/netdev/netdevsim.c
 @@ -1,6 +1,6 @@
@@ -241,7 +255,7 @@ index ff372092e6..eef66811f4 100644
  #include "nlmon.h"
 =20
 diff --git a/src/network/netdev/tunnel.c b/src/network/netdev/tunnel.c
-index db84e7cf6e..93d5642962 100644
+index af05cfda81..f659bed3a6 100644
 --- a/src/network/netdev/tunnel.c
 +++ b/src/network/netdev/tunnel.c
 @@ -2,7 +2,7 @@
@@ -266,7 +280,7 @@ index 380547ee1e..137c1adf8a 100644
  #include "vcan.h"
 =20
 diff --git a/src/network/netdev/veth.c b/src/network/netdev/veth.c
-index 78555286d1..e7eff072e4 100644
+index 54d3b59734..f3f75e22b5 100644
 --- a/src/network/netdev/veth.c
 +++ b/src/network/netdev/veth.c
 @@ -3,7 +3,7 @@
@@ -292,7 +306,7 @@ index 60e49a5b8a..266fd58813 100644
 =20
  #include "parse-util.h"
 diff --git a/src/network/netdev/vrf.c b/src/network/netdev/vrf.c
-index 24079a7203..33ff17ea82 100644
+index c35419f859..4d1d3ef141 100644
 --- a/src/network/netdev/vrf.c
 +++ b/src/network/netdev/vrf.c
 @@ -2,8 +2,8 @@
@@ -306,7 +320,7 @@ index 24079a7203..33ff17ea82 100644
  #include "vrf.h"
 =20
 diff --git a/src/network/netdev/vxcan.c b/src/network/netdev/vxcan.c
-index c0343f45b6..f9e718f40b 100644
+index 2de89b8e24..ce1b8f9b69 100644
 --- a/src/network/netdev/vxcan.c
 +++ b/src/network/netdev/vxcan.c
 @@ -1,7 +1,7 @@
@@ -319,7 +333,7 @@ index c0343f45b6..f9e718f40b 100644
  #include "vxcan.h"
 =20
 diff --git a/src/network/netdev/vxlan.c b/src/network/netdev/vxlan.c
-index 37f65967a6..bdd8848a02 100644
+index d8a066370d..8f94eeb763 100644
 --- a/src/network/netdev/vxlan.c
 +++ b/src/network/netdev/vxlan.c
 @@ -3,7 +3,7 @@
@@ -332,7 +346,7 @@ index 37f65967a6..bdd8848a02 100644
  #include "conf-parser.h"
  #include "alloc-util.h"
 diff --git a/src/network/netdev/wireguard.c b/src/network/netdev/wiregua=
rd.c
-index fed1be8d11..94b659fd23 100644
+index 8d1dddf828..5182783f45 100644
 --- a/src/network/netdev/wireguard.c
 +++ b/src/network/netdev/wireguard.c
 @@ -5,7 +5,7 @@
@@ -357,7 +371,7 @@ index 905bfc0bdf..39e34dbb3b 100644
  #include "missing_network.h"
  #include "xfrm.h"
 diff --git a/src/network/networkd-dhcp-common.c b/src/network/networkd-d=
hcp-common.c
-index 9f0268d934..8cd605ab4a 100644
+index 8b64dfe8f0..caa2885728 100644
 --- a/src/network/networkd-dhcp-common.c
 +++ b/src/network/networkd-dhcp-common.c
 @@ -1,7 +1,8 @@
@@ -371,7 +385,7 @@ index 9f0268d934..8cd605ab4a 100644
  #include "bus-error.h"
  #include "bus-locator.h"
 diff --git a/src/network/networkd-dhcp-prefix-delegation.c b/src/network=
/networkd-dhcp-prefix-delegation.c
-index 2e660b7763..b8dd6240a0 100644
+index 16426de981..3d8efc05f1 100644
 --- a/src/network/networkd-dhcp-prefix-delegation.c
 +++ b/src/network/networkd-dhcp-prefix-delegation.c
 @@ -1,6 +1,5 @@
@@ -381,7 +395,7 @@ index 2e660b7763..b8dd6240a0 100644
 =20
  #include "dhcp6-lease-internal.h"
  #include "hashmap.h"
-@@ -20,6 +19,8 @@
+@@ -21,6 +20,8 @@
  #include "strv.h"
  #include "tunnel.h"
 =20
@@ -404,7 +418,7 @@ index c35102af74..3be469ae16 100644
 =20
  #include "sd-dhcp-server.h"
 diff --git a/src/network/networkd-dhcp4.c b/src/network/networkd-dhcp4.c
-index 4dd6044b18..15a598f9db 100644
+index d94ac1a213..b8fe82cb6a 100644
 --- a/src/network/networkd-dhcp4.c
 +++ b/src/network/networkd-dhcp4.c
 @@ -3,7 +3,7 @@
@@ -415,9 +429,9 @@ index 4dd6044b18..15a598f9db 100644
 +//#include <linux/if_arp.h>
 =20
  #include "alloc-util.h"
- #include "dhcp-client-internal.h"
+ #include "device-private.h"
 diff --git a/src/network/networkd-ipv6ll.c b/src/network/networkd-ipv6ll=
.c
-index 32229a3fc7..662a345d6e 100644
+index 04f51ab530..c4580754f7 100644
 --- a/src/network/networkd-ipv6ll.c
 +++ b/src/network/networkd-ipv6ll.c
 @@ -1,7 +1,7 @@
@@ -430,7 +444,7 @@ index 32229a3fc7..662a345d6e 100644
  #include "in-addr-util.h"
  #include "networkd-address.h"
 diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
-index 6b0f09926a..81f44f6e6a 100644
+index 3c042e6c18..05fe2cb900 100644
 --- a/src/network/networkd-link.c
 +++ b/src/network/networkd-link.c
 @@ -4,7 +4,7 @@
@@ -443,7 +457,7 @@ index 6b0f09926a..81f44f6e6a 100644
  #include <linux/netdevice.h>
  #include <sys/socket.h>
 diff --git a/src/network/networkd-ndisc.c b/src/network/networkd-ndisc.c
-index 7cafe1f6a3..07c293c9a6 100644
+index 33e86fb04e..51292871fc 100644
 --- a/src/network/networkd-ndisc.c
 +++ b/src/network/networkd-ndisc.c
 @@ -6,7 +6,7 @@
@@ -456,7 +470,7 @@ index 7cafe1f6a3..07c293c9a6 100644
  #include "sd-ndisc.h"
 =20
 diff --git a/src/network/networkd-setlink.c b/src/network/networkd-setli=
nk.c
-index 058bc00ba1..bb0a430a0b 100644
+index 8519e6e7a0..7aca2bbecc 100644
 --- a/src/network/networkd-setlink.c
 +++ b/src/network/networkd-setlink.c
 @@ -2,7 +2,7 @@
@@ -466,10 +480,10 @@ index 058bc00ba1..bb0a430a0b 100644
 -#include <linux/if_arp.h>
 +//#include <linux/if_arp.h>
  #include <linux/if_bridge.h>
+ #include <linux/ipv6.h>
 =20
- #include "missing_network.h"
 diff --git a/src/network/networkd-sysctl.c b/src/network/networkd-sysctl=
.c
-index 68c23e0eb7..e177c49d9b 100644
+index 10a35bc44b..84c6b68ee4 100644
 --- a/src/network/networkd-sysctl.c
 +++ b/src/network/networkd-sysctl.c
 @@ -2,7 +2,7 @@
@@ -479,24 +493,10 @@ index 68c23e0eb7..e177c49d9b 100644
 -#include <linux/if_arp.h>
 +//#include <linux/if_arp.h>
 =20
- #include "af-list.h"
- #include "missing_network.h"
-diff --git a/src/shared/linux/ethtool.h b/src/shared/linux/ethtool.h
-index 3d1da515c0..3fca9a4faf 100644
---- a/src/shared/linux/ethtool.h
-+++ b/src/shared/linux/ethtool.h
-@@ -16,7 +16,8 @@
-=20
- #include <linux/const.h>
- #include <linux/types.h>
--#include <linux/if_ether.h>
-+#include <netinet/if_ether.h>
-+//#include <linux/if_ether.h>
-=20
- #include <limits.h> /* for INT_MAX */
+ #include "sd-messages.h"
 =20
 diff --git a/src/shared/netif-util.c b/src/shared/netif-util.c
-index 8adc2c89c8..1977e28d7f 100644
+index 978ce42341..899b5f613f 100644
 --- a/src/shared/netif-util.c
 +++ b/src/shared/netif-util.c
 @@ -1,7 +1,7 @@
@@ -509,7 +509,7 @@ index 8adc2c89c8..1977e28d7f 100644
  #include "arphrd-util.h"
  #include "device-util.h"
 diff --git a/src/udev/udev-builtin-net_id.c b/src/udev/udev-builtin-net_=
id.c
-index 384a1f31cb..c94bb70afb 100644
+index 09c04b9a7f..4686897dbf 100644
 --- a/src/udev/udev-builtin-net_id.c
 +++ b/src/udev/udev-builtin-net_id.c
 @@ -19,7 +19,7 @@
@@ -522,5 +522,5 @@ index 384a1f31cb..c94bb70afb 100644
  #include <linux/pci_regs.h>
 =20
 --=20
-2.45.1
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0020-test-bus-error-strerr=
or-is-assumed-to-be-GNU-specifi.patch b/meta/recipes-core/systemd/systemd=
/0018-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch
similarity index 93%
rename from meta/recipes-core/systemd/systemd/0020-test-bus-error-strerro=
r-is-assumed-to-be-GNU-specifi.patch
rename to meta/recipes-core/systemd/systemd/0018-test-bus-error-strerror-=
is-assumed-to-be-GNU-specifi.patch
index b3fbfee08d..a92b8cc80f 100644
--- a/meta/recipes-core/systemd/systemd/0020-test-bus-error-strerror-is-a=
ssumed-to-be-GNU-specifi.patch
+++ b/meta/recipes-core/systemd/systemd/0018-test-bus-error-strerror-is-a=
ssumed-to-be-GNU-specifi.patch
@@ -1,7 +1,7 @@
-From e01f0c444423eb65d176713735ff8cefb3068f3d Mon Sep 17 00:00:00 2001
+From 349f9a0f9ecfc6575a3d9eeaffe89536e6a43914 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 8 Nov 2022 13:31:34 -0800
-Subject: [PATCH 20/27] test-bus-error: strerror() is assumed to be GNU
+Subject: [PATCH 18/26] test-bus-error: strerror() is assumed to be GNU
  specific version mark it so
=20
 Upstream-Status: Inappropriate [Upstream systemd only supports glibc]
@@ -48,5 +48,5 @@ index ab463bd1b3..e2ebcaaf33 100644
  TEST(PROTECT_ERRNO) {
          errno =3D 12;
 --=20
-2.45.1
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0021-errno-util-Make-STRER=
ROR-portable-for-musl.patch b/meta/recipes-core/systemd/systemd/0019-errn=
o-util-Make-STRERROR-portable-for-musl.patch
similarity index 91%
rename from meta/recipes-core/systemd/systemd/0021-errno-util-Make-STRERR=
OR-portable-for-musl.patch
rename to meta/recipes-core/systemd/systemd/0019-errno-util-Make-STRERROR=
-portable-for-musl.patch
index 6e899d0905..791079a19f 100644
--- a/meta/recipes-core/systemd/systemd/0021-errno-util-Make-STRERROR-por=
table-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0019-errno-util-Make-STRERROR-por=
table-for-musl.patch
@@ -1,7 +1,7 @@
-From d2f632dd6a8cca0fbdd6568ce84004335c004f58 Mon Sep 17 00:00:00 2001
+From 28fa1d5f56c6ddee9e336e6f2051c55e9f2f98b4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 23 Jan 2023 23:39:46 -0800
-Subject: [PATCH 21/27] errno-util: Make STRERROR portable for musl
+Subject: [PATCH 19/26] errno-util: Make STRERROR portable for musl
=20
 Sadly, systemd has decided to use yet another GNU extention in a macro
 lets make this such that we can use XSI compliant strerror_r() for
@@ -38,5 +38,5 @@ index 48b76e4bf7..6e7653e2d9 100644
   * Note that we can't use ({ =E2=80=A6 }) to define a temporary variabl=
e, so errnum is
   * evaluated twice. */
 --=20
-2.45.1
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0022-sd-event-Make-malloc_=
trim-conditional-on-glibc.patch b/meta/recipes-core/systemd/systemd/0020-=
sd-event-Make-malloc_trim-conditional-on-glibc.patch
similarity index 77%
rename from meta/recipes-core/systemd/systemd/0022-sd-event-Make-malloc_t=
rim-conditional-on-glibc.patch
rename to meta/recipes-core/systemd/systemd/0020-sd-event-Make-malloc_tri=
m-conditional-on-glibc.patch
index ed7e3ea586..16df44cd86 100644
--- a/meta/recipes-core/systemd/systemd/0022-sd-event-Make-malloc_trim-co=
nditional-on-glibc.patch
+++ b/meta/recipes-core/systemd/systemd/0020-sd-event-Make-malloc_trim-co=
nditional-on-glibc.patch
@@ -1,7 +1,7 @@
-From 4a3ed5aaaf108d3a07f24997698906e801ba2412 Mon Sep 17 00:00:00 2001
+From 66de8a53849f76f5596327c38ae5f002b9f534cd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 2 Aug 2023 12:06:27 -0700
-Subject: [PATCH 22/27] sd-event: Make malloc_trim() conditional on glibc
+Subject: [PATCH 20/26] sd-event: Make malloc_trim() conditional on glibc
=20
 musl does not have this API
=20
@@ -12,10 +12,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
=20
 diff --git a/src/libsystemd/sd-event/sd-event.c b/src/libsystemd/sd-even=
t/sd-event.c
-index a1305ef014..b8a73da2a3 100644
+index 7aea7d2581..d3f4001f53 100644
 --- a/src/libsystemd/sd-event/sd-event.c
 +++ b/src/libsystemd/sd-event/sd-event.c
-@@ -1877,7 +1877,7 @@ _public_ int sd_event_add_exit(
+@@ -1881,7 +1881,7 @@ _public_ int sd_event_add_exit(
  }
 =20
  _public_ int sd_event_trim_memory(void) {
@@ -24,7 +24,7 @@ index a1305ef014..b8a73da2a3 100644
 =20
          /* A default implementation of a memory pressure callback. Simp=
ly releases our own allocation caches
           * and glibc's. This is automatically used when people call sd_=
event_add_memory_pressure() with a
-@@ -1891,7 +1891,9 @@ _public_ int sd_event_trim_memory(void) {
+@@ -1895,7 +1895,9 @@ _public_ int sd_event_trim_memory(void) {
 =20
          usec_t before_timestamp =3D now(CLOCK_MONOTONIC);
          hashmap_trim_pools();
@@ -35,5 +35,5 @@ index a1305ef014..b8a73da2a3 100644
 =20
          if (r > 0)
 --=20
-2.45.1
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0023-shared-Do-not-use-mal=
loc_info-on-musl.patch b/meta/recipes-core/systemd/systemd/0021-shared-Do=
-not-use-malloc_info-on-musl.patch
similarity index 86%
rename from meta/recipes-core/systemd/systemd/0023-shared-Do-not-use-mall=
oc_info-on-musl.patch
rename to meta/recipes-core/systemd/systemd/0021-shared-Do-not-use-malloc=
_info-on-musl.patch
index b8583c7af7..7ab56ef8fb 100644
--- a/meta/recipes-core/systemd/systemd/0023-shared-Do-not-use-malloc_inf=
o-on-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0021-shared-Do-not-use-malloc_inf=
o-on-musl.patch
@@ -1,7 +1,7 @@
-From d3880d167d8dfafbb8ee62f7737a869f9525f303 Mon Sep 17 00:00:00 2001
+From 93d13363c605fb2de484f38f3726f8fbad1c3540 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 2 Aug 2023 12:20:40 -0700
-Subject: [PATCH 23/27] shared: Do not use malloc_info on musl
+Subject: [PATCH 21/26] shared: Do not use malloc_info on musl
=20
 Upstream-Status: Inappropriate [musl-specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
@@ -11,10 +11,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 5 insertions(+), 4 deletions(-)
=20
 diff --git a/src/shared/bus-util.c b/src/shared/bus-util.c
-index 30f9602b1e..5308f168db 100644
+index ff80e580fc..a628a29d0c 100644
 --- a/src/shared/bus-util.c
 +++ b/src/shared/bus-util.c
-@@ -755,15 +755,16 @@ static int method_dump_memory_state_by_fd(sd_bus_m=
essage *message, void *userdat
+@@ -787,15 +787,16 @@ static int method_dump_memory_state_by_fd(sd_bus_m=
essage *message, void *userdat
          _cleanup_close_ int fd =3D -EBADF;
          size_t dump_size;
          FILE *f;
@@ -53,5 +53,5 @@ index 8e70e365dd..9e782caec9 100644
                  break;
          }
 --=20
-2.45.1
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0024-avoid-missing-LOCK_EX=
-declaration.patch b/meta/recipes-core/systemd/systemd/0022-avoid-missing=
-LOCK_EX-declaration.patch
similarity index 78%
rename from meta/recipes-core/systemd/systemd/0024-avoid-missing-LOCK_EX-=
declaration.patch
rename to meta/recipes-core/systemd/systemd/0022-avoid-missing-LOCK_EX-de=
claration.patch
index 6804c7c62e..d06967f8d5 100644
--- a/meta/recipes-core/systemd/systemd/0024-avoid-missing-LOCK_EX-declar=
ation.patch
+++ b/meta/recipes-core/systemd/systemd/0022-avoid-missing-LOCK_EX-declar=
ation.patch
@@ -1,7 +1,7 @@
-From ca2a736627f8ee8dd9dbbf5b3149d4c8493833ff Mon Sep 17 00:00:00 2001
+From 5b8df64993b68a5a4af0f214d8cae77f4e716593 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 2 Jan 2024 11:03:27 +0800
-Subject: [PATCH 24/27] avoid missing LOCK_EX declaration
+Subject: [PATCH 22/26] avoid missing LOCK_EX declaration
=20
 This only happens on MUSL. Include sys/file.h to avoid compilation
 error about missing LOCK_EX declaration.
@@ -16,7 +16,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  3 files changed, 3 insertions(+)
=20
 diff --git a/src/basic/fd-util.h b/src/basic/fd-util.h
-index af17481dd8..fa20bfa30f 100644
+index 93b254c680..5f0b1a816d 100644
 --- a/src/basic/fd-util.h
 +++ b/src/basic/fd-util.h
 @@ -6,6 +6,7 @@
@@ -28,10 +28,10 @@ index af17481dd8..fa20bfa30f 100644
  #include "macro.h"
  #include "missing_fcntl.h"
 diff --git a/src/core/exec-invoke.c b/src/core/exec-invoke.c
-index ee8db04e76..2aff654f0f 100644
+index 9d636f5529..6be43caa57 100644
 --- a/src/core/exec-invoke.c
 +++ b/src/core/exec-invoke.c
-@@ -4,6 +4,7 @@
+@@ -5,6 +5,7 @@
  #include <sys/ioctl.h>
  #include <sys/mount.h>
  #include <sys/prctl.h>
@@ -40,7 +40,7 @@ index ee8db04e76..2aff654f0f 100644
  #if HAVE_PAM
  #include <security/pam_appl.h>
 diff --git a/src/shared/dev-setup.h b/src/shared/dev-setup.h
-index 5339bc4e5e..0697495f23 100644
+index 92ba6cf764..ba01a0ae55 100644
 --- a/src/shared/dev-setup.h
 +++ b/src/shared/dev-setup.h
 @@ -2,6 +2,7 @@
@@ -49,8 +49,8 @@ index 5339bc4e5e..0697495f23 100644
  #include <sys/types.h>
 +#include <sys/file.h>
 =20
- int lock_dev_console(void);
+ int dev_setup(const char *prefix, uid_t uid, gid_t gid);
 =20
 --=20
-2.45.1
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0025-include-signal.h-to-a=
void-the-undeclared-error.patch b/meta/recipes-core/systemd/systemd/0023-=
include-signal.h-to-avoid-the-undeclared-error.patch
similarity index 51%
rename from meta/recipes-core/systemd/systemd/0025-include-signal.h-to-av=
oid-the-undeclared-error.patch
rename to meta/recipes-core/systemd/systemd/0023-include-signal.h-to-avoi=
d-the-undeclared-error.patch
index 5cfb112d67..c8bcd9e355 100644
--- a/meta/recipes-core/systemd/systemd/0025-include-signal.h-to-avoid-th=
e-undeclared-error.patch
+++ b/meta/recipes-core/systemd/systemd/0023-include-signal.h-to-avoid-th=
e-undeclared-error.patch
@@ -1,7 +1,7 @@
-From ecf124ab2e488a71741fe443ff4863f7ed172968 Mon Sep 17 00:00:00 2001
+From e39afec7e5a2f3a9de7202affab4d0340ba879d7 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 2 Jul 2024 22:18:47 -0700
-Subject: [PATCH 25/27] include signal.h to avoid the 'undeclared' error
+Subject: [PATCH 23/26] include signal.h to avoid the 'undeclared' error
=20
 Upstream-Status: Inappropriate [musl specific]
=20
@@ -11,17 +11,17 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 1 insertion(+)
=20
 diff --git a/src/basic/pidref.h b/src/basic/pidref.h
-index 9920ebb9b3..2fdd4ff50f 100644
+index 42ddf4e50b..b9cf53680f 100644
 --- a/src/basic/pidref.h
 +++ b/src/basic/pidref.h
-@@ -1,6 +1,7 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
- #pragma once
+@@ -3,6 +3,7 @@
+=20
+ typedef struct PidRef PidRef;
 =20
 +#include <signal.h>
  #include "macro.h"
+ #include "process-util.h"
 =20
- /* An embeddable structure carrying a reference to a process. Supposed =
to be used when tracking processes continuously. */
 --=20
-2.45.1
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0026-undef-stdin-for-refer=
ences-using-stdin-as-a-struct-m.patch b/meta/recipes-core/systemd/systemd=
/0024-undef-stdin-for-references-using-stdin-as-a-struct-m.patch
similarity index 84%
rename from meta/recipes-core/systemd/systemd/0026-undef-stdin-for-refere=
nces-using-stdin-as-a-struct-m.patch
rename to meta/recipes-core/systemd/systemd/0024-undef-stdin-for-referenc=
es-using-stdin-as-a-struct-m.patch
index ca1a525a0a..9532e6b9af 100644
--- a/meta/recipes-core/systemd/systemd/0026-undef-stdin-for-references-u=
sing-stdin-as-a-struct-m.patch
+++ b/meta/recipes-core/systemd/systemd/0024-undef-stdin-for-references-u=
sing-stdin-as-a-struct-m.patch
@@ -1,7 +1,7 @@
-From 787606c6ff822fb3fe41ba951ee289bbf6d4def3 Mon Sep 17 00:00:00 2001
+From 5a4334fde21b896cd75b2d1a56e06a4f365e9c4d Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 2 Jul 2024 22:44:31 -0700
-Subject: [PATCH 26/27] undef stdin for references using stdin as a struc=
t
+Subject: [PATCH 24/26] undef stdin for references using stdin as a struc=
t
  member
=20
 In musl stdio.h, we have:
@@ -18,7 +18,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  2 files changed, 4 insertions(+)
=20
 diff --git a/src/shared/edit-util.c b/src/shared/edit-util.c
-index cfb2828f4e..1794a7b269 100644
+index e37609c2e1..1b212ae7b4 100644
 --- a/src/shared/edit-util.c
 +++ b/src/shared/edit-util.c
 @@ -3,6 +3,8 @@
@@ -31,7 +31,7 @@ index cfb2828f4e..1794a7b269 100644
  #include "copy.h"
  #include "edit-util.h"
 diff --git a/src/systemctl/systemctl-edit.c b/src/systemctl/systemctl-ed=
it.c
-index 15398f8364..e7d53ca9a1 100644
+index c42a31153d..7695ceeead 100644
 --- a/src/systemctl/systemctl-edit.c
 +++ b/src/systemctl/systemctl-edit.c
 @@ -13,6 +13,8 @@
@@ -44,5 +44,5 @@ index 15398f8364..e7d53ca9a1 100644
          _cleanup_hashmap_free_ Hashmap *cached_id_map =3D NULL, *cached=
_name_map =3D NULL;
          _cleanup_(lookup_paths_done) LookupPaths lp =3D {};
 --=20
-2.45.1
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0025-adjust-header-inclusi=
on-order-to-avoid-redeclaration.patch b/meta/recipes-core/systemd/systemd=
/0025-adjust-header-inclusion-order-to-avoid-redeclaration.patch
new file mode 100644
index 0000000000..d791ad2da1
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0025-adjust-header-inclusion-orde=
r-to-avoid-redeclaration.patch
@@ -0,0 +1,288 @@
+From a90044320eecda424ed678d283ef60806c70fcda Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 2 Jul 2024 23:23:57 -0700
+Subject: [PATCH 25/26] adjust header inclusion order to avoid redeclarat=
ion
+
+Upstream-Status: Inappropriate [musl specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/basic/parse-util.c                | 3 ++-
+ src/libsystemd-network/ndisc-option.c | 6 +++---
+ src/libsystemd-network/sd-radv.c      | 5 +++--
+ src/network/netdev/l2tp-tunnel.c      | 9 ++++-----
+ src/network/netdev/l2tp-tunnel.h      | 6 +++---
+ src/network/netdev/wireguard.c        | 2 +-
+ src/network/networkctl-link-info.c    | 4 ++--
+ src/network/networkd-bridge-mdb.c     | 3 ++-
+ src/network/networkd-route.c          | 8 ++++----
+ src/resolve/resolved-dns-stream.c     | 5 +++--
+ src/resolve/resolved-manager.c        | 5 +++--
+ src/shared/conf-parser.c              | 3 ++-
+ 12 files changed, 32 insertions(+), 27 deletions(-)
+
+diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
+index faa5344921..0fc9d12c89 100644
+--- a/src/basic/parse-util.c
++++ b/src/basic/parse-util.c
+@@ -2,7 +2,6 @@
+=20
+ #include <errno.h>
+ #include <inttypes.h>
+-#include <linux/ipv6.h>
+ #include <net/if.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+@@ -20,6 +19,8 @@
+ #include "string-util.h"
+ #include "strv.h"
+=20
++#include <linux/ipv6.h>
++
+ int parse_boolean(const char *v) {
+         if (!v)
+                 return -EINVAL;
+diff --git a/src/libsystemd-network/ndisc-option.c b/src/libsystemd-netw=
ork/ndisc-option.c
+index 3aab51f51b..feeb4c78e5 100644
+--- a/src/libsystemd-network/ndisc-option.c
++++ b/src/libsystemd-network/ndisc-option.c
+@@ -1,8 +1,5 @@
+ /* SPDX-License-Identifier: LGPL-2.1-or-later */
+=20
+-#include <linux/ipv6.h>
+-#include <netinet/icmp6.h>
+-
+ #include "dns-resolver-internal.h"
+ #include "dns-domain.h"
+ #include "ether-addr-util.h"
+@@ -16,6 +13,9 @@
+ #include "strv.h"
+ #include "unaligned.h"
+=20
++#include <linux/ipv6.h>
++#include <netinet/icmp6.h>
++
+ /* RFC does not say anything about the maximum number of options, but l=
et's limit the number of options for
+  * safety. Typically, the number of options in an ICMPv6 message should=
 be only a few. */
+ #define MAX_OPTIONS 128
+diff --git a/src/libsystemd-network/sd-radv.c b/src/libsystemd-network/s=
d-radv.c
+index f241929ad5..7cef3c3f71 100644
+--- a/src/libsystemd-network/sd-radv.c
++++ b/src/libsystemd-network/sd-radv.c
+@@ -3,8 +3,6 @@
+   Copyright =C2=A9 2017 Intel Corporation. All rights reserved.
+ ***/
+=20
+-#include <linux/ipv6.h>
+-#include <netinet/icmp6.h>
+ #include <netinet/in.h>
+ #include <arpa/inet.h>
+=20
+@@ -29,6 +27,9 @@
+ #include "strv.h"
+ #include "unaligned.h"
+=20
++#include <linux/ipv6.h>
++#include <netinet/icmp6.h>
++
+ int sd_radv_new(sd_radv **ret) {
+         _cleanup_(sd_radv_unrefp) sd_radv *ra =3D NULL;
+=20
+diff --git a/src/network/netdev/l2tp-tunnel.c b/src/network/netdev/l2tp-=
tunnel.c
+index c87e44797b..437b40c114 100644
+--- a/src/network/netdev/l2tp-tunnel.c
++++ b/src/network/netdev/l2tp-tunnel.c
+@@ -1,10 +1,5 @@
+ /* SPDX-License-Identifier: LGPL-2.1-or-later */
+=20
+-#include <netinet/in.h>
+-#include <linux/if_arp.h>
+-#include <linux/l2tp.h>
+-#include <linux/genetlink.h>
+-
+ #include "conf-parser.h"
+ #include "hashmap.h"
+ #include "l2tp-tunnel.h"
+@@ -17,6 +12,10 @@
+ #include "string-table.h"
+ #include "string-util.h"
+=20
++#include <netinet/in.h>
++#include <linux/l2tp.h>
++#include <linux/genetlink.h>
++
+ static const char* const l2tp_l2spec_type_table[_NETDEV_L2TP_L2SPECTYPE=
_MAX] =3D {
+         [NETDEV_L2TP_L2SPECTYPE_NONE]    =3D "none",
+         [NETDEV_L2TP_L2SPECTYPE_DEFAULT] =3D "default",
+diff --git a/src/network/netdev/l2tp-tunnel.h b/src/network/netdev/l2tp-=
tunnel.h
+index c558ed49de..8419ef34c5 100644
+--- a/src/network/netdev/l2tp-tunnel.h
++++ b/src/network/netdev/l2tp-tunnel.h
+@@ -1,13 +1,13 @@
+ /* SPDX-License-Identifier: LGPL-2.1-or-later */
+ #pragma once
+=20
+-#include <netinet/in.h>
+-#include <linux/l2tp.h>
+-
+ #include "in-addr-util.h"
+ #include "netdev.h"
+ #include "networkd-util.h"
+=20
++#include <netinet/in.h>
++#include <linux/l2tp.h>
++
+ typedef enum L2tpL2specType {
+         NETDEV_L2TP_L2SPECTYPE_NONE =3D L2TP_L2SPECTYPE_NONE,
+         NETDEV_L2TP_L2SPECTYPE_DEFAULT =3D L2TP_L2SPECTYPE_DEFAULT,
+diff --git a/src/network/netdev/wireguard.c b/src/network/netdev/wiregua=
rd.c
+index 5182783f45..79b21cb4ba 100644
+--- a/src/network/netdev/wireguard.c
++++ b/src/network/netdev/wireguard.c
+@@ -5,9 +5,9 @@
+=20
+ /* Make sure the net/if.h header is included before any linux/ one */
+ #include <net/if.h>
++#include <netinet/in.h>
+ //#include <linux/if_arp.h>
+ #include <linux/ipv6_route.h>
+-#include <netinet/in.h>
+ #include <sys/ioctl.h>
+=20
+ #include "sd-resolve.h"
+diff --git a/src/network/networkctl-link-info.c b/src/network/networkctl=
-link-info.c
+index f356d3c231..216c442de1 100644
+--- a/src/network/networkctl-link-info.c
++++ b/src/network/networkctl-link-info.c
+@@ -1,7 +1,5 @@
+ /* SPDX-License-Identifier: LGPL-2.1-or-later */
+=20
+-#include <linux/if_tunnel.h>
+-
+ #include "bus-common-errors.h"
+ #include "bus-error.h"
+ #include "bus-util.h"
+@@ -16,6 +14,8 @@
+ #include "strxcpyx.h"
+ #include "wifi-util.h"
+=20
++#include <linux/if_tunnel.h>
++
+ /* use 128 kB for receive socket kernel queue, we shouldn't need more h=
ere */
+ #define RCVBUF_SIZE    (128*1024)
+=20
+diff --git a/src/network/networkd-bridge-mdb.c b/src/network/networkd-br=
idge-mdb.c
+index 358ca4d294..fe87f7c093 100644
+--- a/src/network/networkd-bridge-mdb.c
++++ b/src/network/networkd-bridge-mdb.c
+@@ -2,7 +2,6 @@
+=20
+ /* Make sure the net/if.h header is included before any linux/ one */
+ #include <net/if.h>
+-#include <linux/if_bridge.h>
+=20
+ #include "netlink-util.h"
+ #include "networkd-bridge-mdb.h"
+@@ -13,6 +12,8 @@
+ #include "string-util.h"
+ #include "vlan-util.h"
+=20
++#include <linux/if_bridge.h>
++
+ #define STATIC_BRIDGE_MDB_ENTRIES_PER_NETWORK_MAX 1024U
+=20
+ /* remove MDB entry. */
+diff --git a/src/network/networkd-route.c b/src/network/networkd-route.c
+index 0f3f79ec4f..325743bebf 100644
+--- a/src/network/networkd-route.c
++++ b/src/network/networkd-route.c
+@@ -1,9 +1,5 @@
+ /* SPDX-License-Identifier: LGPL-2.1-or-later */
+=20
+-#include <linux/if.h>
+-#include <linux/ipv6_route.h>
+-#include <linux/nexthop.h>
+-
+ #include "alloc-util.h"
+ #include "event-util.h"
+ #include "netlink-util.h"
+@@ -21,6 +17,10 @@
+ #include "vrf.h"
+ #include "wireguard.h"
+=20
++#include <linux/if.h>
++#include <linux/ipv6_route.h>
++#include <linux/nexthop.h>
++
+ static Route* route_detach_impl(Route *route) {
+         assert(route);
+         assert(!!route->network + !!route->manager + !!route->wireguard=
 <=3D 1);
+diff --git a/src/resolve/resolved-dns-stream.c b/src/resolve/resolved-dn=
s-stream.c
+index e57af66221..f66d8f0606 100644
+--- a/src/resolve/resolved-dns-stream.c
++++ b/src/resolve/resolved-dns-stream.c
+@@ -1,7 +1,5 @@
+ /* SPDX-License-Identifier: LGPL-2.1-or-later */
+=20
+-#include <linux/if_arp.h>
+-#include <netinet/tcp.h>
+ #include <unistd.h>
+=20
+ #include "alloc-util.h"
+@@ -12,6 +10,9 @@
+ #include "resolved-dns-stream.h"
+ #include "resolved-manager.h"
+=20
++//#include <linux/if_arp.h>
++#include <netinet/tcp.h>
++
+ #define DNS_STREAMS_MAX 128
+=20
+ #define DNS_QUERIES_PER_STREAM 32
+diff --git a/src/resolve/resolved-manager.c b/src/resolve/resolved-manag=
er.c
+index dbaad81734..b988e75851 100644
+--- a/src/resolve/resolved-manager.c
++++ b/src/resolve/resolved-manager.c
+@@ -1,8 +1,6 @@
+ /* SPDX-License-Identifier: LGPL-2.1-or-later */
+=20
+ #include <fcntl.h>
+-#include <linux/ipv6.h>
+-#include <netinet/in.h>
+ #include <poll.h>
+ #include <sys/ioctl.h>
+ #include <sys/stat.h>
+@@ -46,6 +44,9 @@
+ #include "utf8.h"
+ #include "varlink-util.h"
+=20
++#include <linux/ipv6.h>
++#include <netinet/in.h>
++
+ #define SEND_TIMEOUT_USEC (200 * USEC_PER_MSEC)
+=20
+ static int manager_process_link(sd_netlink *rtnl, sd_netlink_message *m=
m, void *userdata) {
+diff --git a/src/shared/conf-parser.c b/src/shared/conf-parser.c
+index eaa8a5f11c..03379e7474 100644
+--- a/src/shared/conf-parser.c
++++ b/src/shared/conf-parser.c
+@@ -2,7 +2,6 @@
+=20
+ #include <errno.h>
+ #include <limits.h>
+-#include <linux/ipv6.h>
+ #include <stdint.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+@@ -47,6 +46,8 @@
+ #include "time-util.h"
+ #include "utf8.h"
+=20
++#include <linux/ipv6.h>
++
+ DEFINE_PRIVATE_HASH_OPS_WITH_VALUE_DESTRUCTOR(config_file_hash_ops_fclo=
se,
+                                               char, path_hash_func, pat=
h_compare,
+                                               FILE, safe_fclose);
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd/0028-build-path.c-avoid-bo=
ot-time-segfault-for-musl.patch b/meta/recipes-core/systemd/systemd/0026-=
build-path.c-avoid-boot-time-segfault-for-musl.patch
similarity index 85%
rename from meta/recipes-core/systemd/systemd/0028-build-path.c-avoid-boo=
t-time-segfault-for-musl.patch
rename to meta/recipes-core/systemd/systemd/0026-build-path.c-avoid-boot-=
time-segfault-for-musl.patch
index 501728cbc8..a7549ee151 100644
--- a/meta/recipes-core/systemd/systemd/0028-build-path.c-avoid-boot-time=
-segfault-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0026-build-path.c-avoid-boot-time=
-segfault-for-musl.patch
@@ -1,7 +1,7 @@
-From 0e4379088b1cf607b605b785f6f23943ebeb6584 Mon Sep 17 00:00:00 2001
+From f2a7cf1d2a2bc2516a180809efd85c828cd9c7f4 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 3 Jul 2024 07:18:42 -0700
-Subject: [PATCH 28/28] build-path.c: avoid boot time segfault for musl
+Subject: [PATCH 26/26] build-path.c: avoid boot time segfault for musl
=20
 This function, at runtime, should return -ENOEXEC. For musl, it
 somehow segfaults. I think it's related to getauxval, but it's
@@ -27,5 +27,5 @@ index b5972658df..4ef551034e 100644
                  const char *runpath =3D NULL;
 =20
 --=20
-2.45.1
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0027-adjust-header-inclusi=
on-order-to-avoid-redeclaration.patch b/meta/recipes-core/systemd/systemd=
/0027-adjust-header-inclusion-order-to-avoid-redeclaration.patch
deleted file mode 100644
index 1be075d606..0000000000
--- a/meta/recipes-core/systemd/systemd/0027-adjust-header-inclusion-orde=
r-to-avoid-redeclaration.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From cf94d43572770007f95b832f477aa5a03624a1e5 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Tue, 2 Jul 2024 23:23:57 -0700
-Subject: [PATCH 27/27] adjust header inclusion order to avoid redeclarat=
ion
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/network/netdev/wireguard.c    | 2 +-
- src/network/networkd-bridge-mdb.c | 3 ++-
- src/network/networkd-route.c      | 6 +++---
- 3 files changed, 6 insertions(+), 5 deletions(-)
-
-diff --git a/src/network/netdev/wireguard.c b/src/network/netdev/wiregua=
rd.c
-index 94b659fd23..a78ad5762d 100644
---- a/src/network/netdev/wireguard.c
-+++ b/src/network/netdev/wireguard.c
-@@ -5,9 +5,9 @@
-=20
- /* Make sure the net/if.h header is included before any linux/ one */
- #include <net/if.h>
-+#include <netinet/in.h>
- //#include <linux/if_arp.h>
- #include <linux/ipv6_route.h>
--#include <netinet/in.h>
- #include <sys/ioctl.h>
-=20
- #include "sd-resolve.h"
-diff --git a/src/network/networkd-bridge-mdb.c b/src/network/networkd-br=
idge-mdb.c
-index 7ff4a18846..fe1a9cf888 100644
---- a/src/network/networkd-bridge-mdb.c
-+++ b/src/network/networkd-bridge-mdb.c
-@@ -2,7 +2,6 @@
-=20
- /* Make sure the net/if.h header is included before any linux/ one */
- #include <net/if.h>
--#include <linux/if_bridge.h>
-=20
- #include "netlink-util.h"
- #include "networkd-bridge-mdb.h"
-@@ -13,6 +12,8 @@
- #include "string-util.h"
- #include "vlan-util.h"
-=20
-+#include <linux/if_bridge.h>
-+
- #define STATIC_BRIDGE_MDB_ENTRIES_PER_NETWORK_MAX 1024U
-=20
- /* remove MDB entry. */
-diff --git a/src/network/networkd-route.c b/src/network/networkd-route.c
-index d596fd81e6..0dc0d2a7a3 100644
---- a/src/network/networkd-route.c
-+++ b/src/network/networkd-route.c
-@@ -1,8 +1,5 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
-=20
--#include <linux/ipv6_route.h>
--#include <linux/nexthop.h>
--
- #include "alloc-util.h"
- #include "event-util.h"
- #include "netlink-util.h"
-@@ -20,6 +17,9 @@
- #include "vrf.h"
- #include "wireguard.h"
-=20
-+#include <linux/ipv6_route.h>
-+#include <linux/nexthop.h>
-+
- static Route* route_detach_impl(Route *route) {
-         assert(route);
-         assert(!!route->network + !!route->manager + !!route->wireguard=
 <=3D 1);
---=20
-2.45.1
-
diff --git a/meta/recipes-core/systemd/systemd_256.9.bb b/meta/recipes-co=
re/systemd/systemd_257.bb
similarity index 96%
rename from meta/recipes-core/systemd/systemd_256.9.bb
rename to meta/recipes-core/systemd/systemd_257.bb
index 2b5a90aacb..3f7cbe2106 100644
--- a/meta/recipes-core/systemd/systemd_256.9.bb
+++ b/meta/recipes-core/systemd/systemd_257.bb
@@ -28,37 +28,35 @@ SRC_URI +=3D " \
            file://systemd-pager.sh \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-=
tim.patch \
            file://0002-implment-systemd-sysv-install-for-OE.patch \
-           file://0003-coredump-set-ProtectHome-to-read-only.patch \
            "
=20
 # patches needed by musl
 SRC_URI:append:libc-musl =3D " ${SRC_URI_MUSL}"
 SRC_URI_MUSL =3D "\
-               file://0004-missing_type.h-add-comparison_fn_t.patch \
-               file://0005-add-fallback-parse_printf_format-implementati=
on.patch \
-               file://0006-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-=
is-not-.patch \
-               file://0007-add-missing-FTW_-macros-for-musl.patch \
-               file://0008-Use-uintmax_t-for-handling-rlim_t.patch \
-               file://0009-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-facces=
sat.patch \
-               file://0010-Define-glibc-compatible-basename-for-non-glib=
c-syste.patch \
-               file://0011-Do-not-disable-buffering-when-writing-to-oom_=
score_a.patch \
-               file://0012-distinguish-XSI-compliant-strerror_r-from-GNU=
-specif.patch \
-               file://0013-avoid-redefinition-of-prctl_mm_map-structure.=
patch \
-               file://0014-do-not-disable-buffer-in-writing-files.patch =
\
-               file://0015-Handle-__cpu_mask-usage.patch \
-               file://0016-Handle-missing-gshadow.patch \
-               file://0017-missing_syscall.h-Define-MIPS-ABI-defines-for=
-musl.patch \
-               file://0018-pass-correct-parameters-to-getdents64.patch \
-               file://0019-Adjust-for-musl-headers.patch \
-               file://0020-test-bus-error-strerror-is-assumed-to-be-GNU-=
specifi.patch \
-               file://0021-errno-util-Make-STRERROR-portable-for-musl.pa=
tch \
-               file://0022-sd-event-Make-malloc_trim-conditional-on-glib=
c.patch \
-               file://0023-shared-Do-not-use-malloc_info-on-musl.patch \
-               file://0024-avoid-missing-LOCK_EX-declaration.patch \
-               file://0025-include-signal.h-to-avoid-the-undeclared-erro=
r.patch \
-               file://0026-undef-stdin-for-references-using-stdin-as-a-s=
truct-m.patch \
-               file://0027-adjust-header-inclusion-order-to-avoid-redecl=
aration.patch \
-               file://0028-build-path.c-avoid-boot-time-segfault-for-mus=
l.patch \
+               file://0003-missing_type.h-add-comparison_fn_t.patch \
+               file://0004-add-fallback-parse_printf_format-implementati=
on.patch \
+               file://0005-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-=
is-not-.patch \
+               file://0006-add-missing-FTW_-macros-for-musl.patch \
+               file://0007-Use-uintmax_t-for-handling-rlim_t.patch \
+               file://0008-Define-glibc-compatible-basename-for-non-glib=
c-syste.patch \
+               file://0009-Do-not-disable-buffering-when-writing-to-oom_=
score_a.patch \
+               file://0010-distinguish-XSI-compliant-strerror_r-from-GNU=
-specif.patch \
+               file://0011-avoid-redefinition-of-prctl_mm_map-structure.=
patch \
+               file://0012-do-not-disable-buffer-in-writing-files.patch =
\
+               file://0013-Handle-__cpu_mask-usage.patch \
+               file://0014-Handle-missing-gshadow.patch \
+               file://0015-missing_syscall.h-Define-MIPS-ABI-defines-for=
-musl.patch \
+               file://0016-pass-correct-parameters-to-getdents64.patch \
+               file://0017-Adjust-for-musl-headers.patch \
+               file://0018-test-bus-error-strerror-is-assumed-to-be-GNU-=
specifi.patch \
+               file://0019-errno-util-Make-STRERROR-portable-for-musl.pa=
tch \
+               file://0020-sd-event-Make-malloc_trim-conditional-on-glib=
c.patch \
+               file://0021-shared-Do-not-use-malloc_info-on-musl.patch \
+               file://0022-avoid-missing-LOCK_EX-declaration.patch \
+               file://0023-include-signal.h-to-avoid-the-undeclared-erro=
r.patch \
+               file://0024-undef-stdin-for-references-using-stdin-as-a-s=
truct-m.patch \
+               file://0025-adjust-header-inclusion-order-to-avoid-redecl=
aration.patch \
+               file://0026-build-path.c-avoid-boot-time-segfault-for-mus=
l.patch \
                "
=20
 PAM_PLUGINS =3D " \
--=20
2.34.1


