Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BEE8C5AD49
	for <webhook@archiver.kernel.org>; Sun,  8 Jun 2025 15:41:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.39474.1749397299938597847
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jun 2025 08:41:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82543c27de=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558FK71i031983
	for <openembedded-core@lists.openembedded.org>; Sun, 8 Jun 2025 08:41:39 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474gq40uxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 08 Jun 2025 08:41:39 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 558FfPtR031583
	for <openembedded-core@lists.openembedded.org>; Sun, 8 Jun 2025 08:41:38 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2087.outbound.protection.outlook.com [40.107.243.87])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474gq40uxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 08 Jun 2025 08:41:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WL+Cu/oopSr/0qHQ2Fjl5RFVmEFRoG3t55OWQL0MVr7R7eKAywqALHXVBFZTnc4Us3zUYjHzM2Py8R9i3+ceiZxNkZmu5MZ8CXkB/6GxNxpNN35y7dlC6Cnlet1JbubFmsd1hTqrlrz8q7nXz62sGz1zDD9RRs8Aq/miuiWUFnmLD6KSEMqMk1tyeiSStjJ9hw2qw4kOU0KLeZDdDKv6i3y4K394n2ZVq56lCuPlfW8Q0EfNJ1PPAQp+Wh5j3yLh1MTsD9bI2H64ndzbZv+7ItkChvA9F0i0wosLC7PjftcM4tfNARe8iaT054AtL9tp37oLHoF5erznslWtOnjvgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0HBJaWS661u1PZERiiPXMqrjQvkPvleznc8I7EfYxs=;
 b=yc7mNhNur1e9/ATHKsSu5eDQSxaQHjipr8fmaqLDBR5rop/0+ErT4I/BqJvqTDxVYoEkGJZUht6pb51AoeMA7er6SjRUINKBl3ZfYWqhXA9Nm778r9FsPgTtvqPjWzvHdzqHFhxyz58ZTAiJWUuG+1mjGLZf4RDN81siQrRa1fIbSIjl3aXclIAvpb0S6udBFrsW4imFaTVqgchJYZYNJ/tBUZxoBrHvk9ImwlFgGOUZk4h31u3mQTuWZQNMQ2KY987Kr9mlFFAw/+G1mPGGSmZ4ZMWzlXcQYpXDygMQ9/kVDi46z9asLMtacvMtVsHCv8KukTAzC1Ga6vYud2HHCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by IA4PR11MB8941.namprd11.prod.outlook.com (2603:10b6:208:55d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Sun, 8 Jun
 2025 15:41:34 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%6]) with mapi id 15.20.8813.024; Sun, 8 Jun 2025
 15:41:26 +0000
Message-ID: <ae6dac52-8dda-46f2-a463-dc6ba2f88b62@windriver.com>
Date: Sun, 8 Jun 2025 23:41:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Patchtest results for [PATCH v2 1/1] rpm: 4.20.0 ->
 4.20.1
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        "patchtest@automation.yoctoproject.org"
 <patchtest@automation.yoctoproject.org>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <ac979fa2e300f8fb8e4f60fddcad4d299741ab33.1749379320.git.liezhi.yang@windriver.com>
 <010101974f25b46f-25c3d505-38be-4277-ae97-006ce8b41b73-000000@us-west-2.amazonses.com>
 <68a030c3-3aad-40be-b0a4-9ba344ad6a39@windriver.com>
 <DB5PR02MB10213DB19791CAD7D83342256EF68A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <DB5PR02MB10213DB19791CAD7D83342256EF68A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0016.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::20) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|IA4PR11MB8941:EE_
X-MS-Office365-Filtering-Correlation-Id: 13336ffb-f667-433e-676a-08dda6a2ee38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RHo1RHVDUjRpV3dSV05QSHE0cThIRnFaMGZDS2FVSXNXWVQwZ2J6ckNkQ1Br?=
 =?utf-8?B?ejJ6dFNUOUlpSnZHTVVFZEFlOWROUXY0NEt6aWRiUlhIaEgrRnBoYTNlNUND?=
 =?utf-8?B?NEFONFkxYjY2cEdRcEF2eVd2TUtKcjVZajNYRTgrVVQ3Wk01ejNIS2NzWTNU?=
 =?utf-8?B?T1YrbWZuMUVxL0Y4UUJ2SFYvQWoyVDNNTllmZGNJZ2pLOGxTdEkzMnluaVdO?=
 =?utf-8?B?dmhRQ2FrWHMxaFdoZ2VCOWR3NnJBejJ2azA0RTQ1Wk9PVHM5MXYyNjljVjFH?=
 =?utf-8?B?YUcxNmRnWjQvK0pYaWhXc0hJSzJIMEZjYTBYT09lbnpKbEtsbjI2QjVTYWtw?=
 =?utf-8?B?SWozT2ZPZzl0bGVWUEZXTXhNOW9KT3FVNnl5cUFmYmtrQWNjZk9aNHMvQjQw?=
 =?utf-8?B?NmNzTWZsNTdaYm5INTFPMTRadWI3dmQzM3FnNGN3RHQxZGZEeERWc3drWjRI?=
 =?utf-8?B?bzMvb2pUVnpac2t3dWhtQURrYVk0aEkyNEF6L3hBMTh5V1Y0UnFtclNDdTNT?=
 =?utf-8?B?bWM1WE9KeGl5N3l2VTFRUVBzNVhNSW1yU3RTVWMwNTcwTTM0VENLTmp3aE9r?=
 =?utf-8?B?RzVERVpDT1YrVEVlUkxqM3lsaWNydWxlYnBpVWFEUVVUNkZVM1ZmZFJMMVNT?=
 =?utf-8?B?UW9BeEt3bmtXRmhIV1VkSnhhUDY2ZGJKUFJmcGl0RmJWMFlRWUpha2M3aGNz?=
 =?utf-8?B?UE5yclRZa0NvWUxtMUJCRUZ1aWtMa2lCUkNFV09zQnRhVC8xa2VieTU4UGUx?=
 =?utf-8?B?OUNKajhCTE9XSGhWNFpaMGVsbzRlU3BYaStjMlZJaDVjQ29PU3VHbGJIZERi?=
 =?utf-8?B?TzR3cmdpMGZaU0prZFFIZ1F0TzVMTG9KbTdhNlBZOEhWVjdiTUh2Q0RWZUJP?=
 =?utf-8?B?UFZFOVkyTUZDSEw0WFM3b3NmZ2lBTWdPS3dWdVhPeC9WbThmWXhzYnlETkQv?=
 =?utf-8?B?NXBxcldwRE9mekR2UnZpRWd4elE0a1BWU3hIZEdqMmJ0VzhScHl6cXZTODhH?=
 =?utf-8?B?YzhrQ2Y3M0Z5OTFUMHpZVlgvbUlwWGZYZmt2NWQxckVMMENBajlHQmNtQjBL?=
 =?utf-8?B?Y3ZPMWc1clQrVk5RK1lZOHV2WE43OTA0MXcvb1hYd2EzeU9sRVVRK09TbHpS?=
 =?utf-8?B?SS9RbUs2ZDZBcmhrem5Xd2NIaVJVY2I3WUtlMDRYRFliNGxESTh2cXdGNG53?=
 =?utf-8?B?MmFid0NXYUd6YldpRkV4WVBLK2t6QmVYOE9BVzJlci9reFZrbXJlLzV1M2ZK?=
 =?utf-8?B?dDZRK29uRjZwVENTdWViMUNWUnp3T3lXOURRNnVJWFhpdkFKVW51TUVTcG9N?=
 =?utf-8?B?b1duK1JxQWZOZENjbHRIc0d6Q3NOZUkvQU5DQU5iUmkxaHFkWmphdlNjR3dx?=
 =?utf-8?B?enhJc2ZPd2ZibkhlUDlSSXJnQ2lzRUN2VkM5WEt1Y2dBeHBLRnRwR0FBeEFz?=
 =?utf-8?B?aS9ZY1l1SXFPeTJUNFl2NEpPWit0TXZCNWtyaXZqT3MwdnJKekFFQld2ZGY0?=
 =?utf-8?B?OVFzekhoTUpsNmhPQnhYRUlsS2ZiaGZhdFVSY3NxVzNtdlFyYW0rVk1sa0lM?=
 =?utf-8?B?bGE4eGxOZTViUnQ0enZZeHUwTDUrdlo3b09oYWRRTGNvM3daMGxFL1ArNG85?=
 =?utf-8?B?a3dueHd4Zm5ta1JsSXVIR0M0dU44ckJBNlhwRllaODhDWFlWcVo5TzZPWmVF?=
 =?utf-8?B?TmtnUFdIM1drLytyZjhpeFZycUNsZ2F4YU9MUkI3MXFpYlB0ZG90VlgwNHJz?=
 =?utf-8?B?RlBqZ1AxOERqZHRMQ3pFbitvWXh4a01ZdWlybGc2TWtnVUt2WW1jaUhWQ2pu?=
 =?utf-8?B?cHFUNm1kdzE0bzlZSmtyd20rNDdxUVhWckp0eTdrak9xb1k3a2VQSFBDS3lQ?=
 =?utf-8?Q?sJmEEFL6hol2p?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cFZ3QzFsT20yVlg5d1NGMGZDZFFuK09JTlpyRGR5TFN6dStmZFQ4OGcxWWxn?=
 =?utf-8?B?dTZUTWJmWEJEMHVqeWpyUHkzbFl3TjFXZThwaHlNeUJOZ0QwdGw0Zk84N0hw?=
 =?utf-8?B?ZzVDdkNuV3lSZVNKWStqaWoyb0RSSDFSSVd2NlpTR2ZBZW1MOVJrZjNUUmg3?=
 =?utf-8?B?bmZtY0hLUzFUcmJNVjFQNkI0Y1Ivb3F4OEYyY1gzZkFaN3RRYTVzSnFuU0VW?=
 =?utf-8?B?bDZXWVFpdm5rd2FTMVdCSHFNUzRUY0xkVnVZSjhaeTViRDRtQjhMRjRBdTlZ?=
 =?utf-8?B?TFNQcmlXSC9GN0JQc3c1RGIwMHdTOE1CZDl3T25WMzg1VmJTZXZBakc4RmdQ?=
 =?utf-8?B?NlJZREJ3eVFIZWxxelRQd3Mxa3d5M2F6ckhmdjBnODZPRi9Fb2c5V2hlZHA5?=
 =?utf-8?B?N0RXa0JrRzNmQ01wWDBuYjVrb2tveG9FV3VNbGI5RVc4bHdyanVqLzFXK0o4?=
 =?utf-8?B?cm1XcmUySldkMThPdTdnMjVpZGJvdEZIQzdvNHkwSnB0VEw1RjZISWZ3aHpU?=
 =?utf-8?B?UU1sQ2hYWm9CRktHRVNNM2JlUUpmY2Y3cCtyNngyU1JGMW1zdXpla053d1Yw?=
 =?utf-8?B?bkNFdStsbE1iemgxQytLSFhnSUFRTXZkUWdEbWhhYWxNWFZGNVE0ZG9JVFJR?=
 =?utf-8?B?dWtkUDRRd0lqN01HSVU0NzA2ME96TXJnNExGa29BbnpMenA5RnRkTFRJZjdm?=
 =?utf-8?B?alJhVEwwV2pQbkVJR1NXbjU1ckp1QmpnU09laEhTQ01RVHgvekFZTk8vM09v?=
 =?utf-8?B?a1hNbWZiVnFJT1c3clo0aTZ3VE83OGZOVmMzUm5HcGkvakxPSG9OcjUzOFJ5?=
 =?utf-8?B?dW13d1FQVDM2R3hKeHlNYkJhZkZ1RSs3VlBEZjlCVXVlOHQrSUdnbU1iNktk?=
 =?utf-8?B?QmtISVVIV0hqSjV3U01WR2g1MnZVZjNZaUFSU29yZFljYU1kVUVTOUllMW9s?=
 =?utf-8?B?S3dmTE1sWlJXM0lEbjMrY2hpWEsrNUJ1UjJhODkvSDZrYTl6MlZlbzNaOHZO?=
 =?utf-8?B?RWhDSlkyM0RVcGRaREk5ekJtVWd2L1ZmZnM1alhMLzUwaEhIQVB5cnlrbzJG?=
 =?utf-8?B?RkQrbFVVVFB6cW5pVVlzeVZEdWtCd0J1UDVQdTRhdXFkRUlNWnRtQjRXMzdS?=
 =?utf-8?B?R2JHdE91UGpFMllVU2JxbmdHc0UrZldzSnp1cERUWExOSC9RcHY3RFBGbHhW?=
 =?utf-8?B?aG9EclFIandLVlFIcEZuRHRvTXQ5S2F6ZTMxVFZtcEsrcG1DY2l0TDJJajRk?=
 =?utf-8?B?UElqZHJ2ZWdaczE0Qk51N3o3T3NjTVZlWTRZd0JEVDRHczJyV0Z4NnJrVXcz?=
 =?utf-8?B?T25kNTdrZ3lwQVlDRDY0QWI2US91RmZJU3N3RTA5RXo5ODlaM3J2OVFQWDZy?=
 =?utf-8?B?bXVDZ3R0OUdXTnpobFR1N3B2QUFvYzNTTmlQaklMRUsvcG9ocmJIQWNxa2dK?=
 =?utf-8?B?amxyRWVPTjNFUVZ0UDZ3QXJsK1BaTnpjZTlzQW5DT0FMUC85aFZYcmMyek9i?=
 =?utf-8?B?Yko3dDZFamZ1MVNNNFVXenBBeGhmZWVDZDNsMEpKMkh5KzN4MmNLMHVJZnor?=
 =?utf-8?B?U2xTTkNiMEJGcDBHMWExNjFOOExFMkk1VXMrVnRXK0VGSXJzQXhmclVJcjJ5?=
 =?utf-8?B?Nlh1SnZ1WEFPTDlXSWowUHlWOTRMbHVhc2lkeVN5anpWdTIzNWl0OGl3VGox?=
 =?utf-8?B?OElvbkl2MU8xUmVFdlNJMFZQdlJUSEtGTm9NMlFoa1NMdWY3WXFhZlZNYzhT?=
 =?utf-8?B?VTdlejVDdU5iQURtZmRTT1ZrYlpGYXhUVlE1YjV3VEM2aS9OV1FKQzBKZk40?=
 =?utf-8?B?UnMzQ0RlWngrNVBndjA3enR2b0JHVlNFVDBadEYzbmVhY2FrTW1PWHNPSmJL?=
 =?utf-8?B?WXhJNWxqQXN0ekRBZXR4bEZLMVZGY1FYVWlXbnJrSzZvd3dLa3dhT1RuVmp5?=
 =?utf-8?B?Y2VnTDNIY01YSlJqNXhzUUZwZmRqZ1lYT2p2d3RyNXpTZGVMNWhZZ09nNjBM?=
 =?utf-8?B?NWd1bWJXR2c2NzZaR1l0QkFDV3RrckIxSnU3V29kS0ZHdEVSNWE1UFFXNUJE?=
 =?utf-8?B?QWdMYStMSFE5bmNZbldnMTdjb05KT1NzNGc5MmpOL1ZDTDgzam5iWDYyOWRx?=
 =?utf-8?B?djNFQ09PYXNVd1dpTjR1WVMxaFVkYjBoQjQ4eTNJRm1hVkRkTHRUenJsdld0?=
 =?utf-8?B?NFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13336ffb-f667-433e-676a-08dda6a2ee38
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2025 15:41:26.9124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QCdwAoDuoNgsg8RpGGW+02xYF3MJoRGfrj8T0xbvg/QWiEXMN4CYqiwm1XC+fx7T0mnx3CWAm8U5LxH+IYUdpdXqmAtrQfH4Iu8tKMJckDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8941
X-Authority-Analysis: v=2.4 cv=Qrde3Uyd c=1 sm=1 tr=0 ts=6845af33 cx=c_pps a=FMzp8OqCp2tFekhue/BAgg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=WRks1Z0DctvbMoBnEsAA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: JIrPBF-MPmsvxNGZoiOB_EtXGHnCTf8n
X-Proofpoint-ORIG-GUID: WzEw4fuMJshPRVEo43RRggoAp_6wPrft
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDEyNSBTYWx0ZWRfX+Eh7S+pm2qZe x2x73rJGpZDCzP3bBSaVon4mFmQryDlNINbBxz6xivDBG2eJZaKau8ZuJt8gAoGpbozyrpSM8jE NU+Dfw6H1mP7aQJVGk2bttqAjsK+nS15k/wXJz3H6aNIw3ny++KODiyEw4soIelucjUguTnWhf4
 Qj916z/WUNsYRACnZhdM2kCrCdxp8xlncjWpZecUXSZ8Ez4Gn1cmBV7McEMVcaXXvCXQi9q9qkY eTcg4Q36Y2u0aMxP6FpX/cj7gfKcuL5oFGcU7EZVuhlFhszxonIsvcwhylYfn3Hl8KCqM5Dui7C 0shNFyTo4iwqW+TDCq1e5upqgtzGP3OvxvF0+vNV5CPAtymfLv7ovm47CMJEDWf3E8UzfxoIwKb
 XB8d6VJFI0zuZL9eltNwXrxFt828sKNxxN2dKlpnBueAe1aLP9kwvJ1APxI/76vRoGArzZlD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506080125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Jun 2025 15:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218220



On 6/8/25 22:13, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Robert Yang via lists.openembedded.org
>> Sent: den 8 juni 2025 12:52
>> To: patchtest@automation.yoctoproject.org
>> Cc: openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] Patchtest results for [PATCH v2 1/1] rpm: 4.20.0 -> 4.20.1
>>
>> On 6/8/25 18:46, patchtest@automation.yoctoproject.org wrote:
>>> Thank you for your submission. Patchtest identified one
>>> or more issues with the patch. Please see the log below for
>>> more information:
>>>
>>> ---
>>> Testing patch /home/patchtest/share/mboxes/v2-1-1-rpm-4.20.0---4.20.1.patch
>>>
>>> FAIL: test lic files chksum modified not mentioned: LIC_FILES_CHKSUM changed without "License-Update:" tag and description in commit message (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
>>
>> There is a "License-Update:" tag in the commit message:
>>
>>       * License-Update: Minor formatting changes as the commit messages
>> said in
>>         41143b27b6f7320f280aea6014e8f532eb0239d6
>>
>> And V1 didn't have this issue, but failed in V2, I didn't modify the above
>> section in V2, something is wrong with Patchtest?
> 
> My guess is that it is due to the fact that you prefixed it with a "*".

Maybe, but my V1 also had a '*' prefix.

// Robert

> 
> Personally, I have always thought of License-Update as a trailer, i.e.,
> similar to the Signed-off-by trailer. And trailers are not allowed to have
> anything preceding them. They are also expected to be a single line, or
> folded according to RFC 822 (see `git interpret-trailers --help`). Now, I
> do not know if this is the official definition of License-Update, but if
> it isn't, I think it would be a good idea to officially define and document
> it to be a Git trailer.
> 
>>
>> // Robert
>>
>>
>>>
>>> PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
>>> PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
>>> PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
>>> PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
>>> PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_presence)
>>> PASS: test Upstream-Status presence (test_patch.TestPatch.test_upstream_status_presence_format)
>>> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
>>> PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
>>> PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
>>> PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
>>> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
>>> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
>>> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
>>> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
>>> PASS: test src uri left files (test_metadata.TestMetadata.test_src_uri_left_files)
>>> PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)
>>>
>>> SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
>>> SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
>>> SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
>>> SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
>>> SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
>>> SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
>>> SKIP: test summary presence: No added recipes, skipping test (test_metadata.TestMetadata.test_summary_presence)
>>>
>>> ---
>>>
>>> Please address the issues identified and
>>> submit a new revision of the patch, or alternatively, reply to this
>>> email with an explanation of why the patch should be accepted. If you
>>> believe these results are due to an error in patchtest, please submit a
>>> bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
>>> under 'Yocto Project Subprojects'). For more information on specific
>>> failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
>>> you!
> 
> //Peter
> 

