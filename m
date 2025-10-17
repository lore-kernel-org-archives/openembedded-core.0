Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15134CCD184
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 05:44:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9162.1760679874210739061
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 22:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=afCtLGKg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2385f46021=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59H5efTi2691225
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 05:44:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Y/Ohtl4GqWnXNAlB6J+rBh25ARcKGBS3g1gce5NjixQ=; b=afCtLGKgrowi
	FVeccPPJjIgXgC5CrOvU+rtW+LcmOM1G2iFWcTwK2+vurt35HUYLEwaoiNcVfkD/
	M3tg6QGEPguSPQQhMxB0Pb8CoBlApc5kzY7xHYThCNyXoX2J+nH0ykXu8hEahSnm
	Bc/VZMgvSreufclLYbezW+ZjigZGbumMD05E/jkuG+JSA4l0LeSKF9yaRiGivqDN
	utScYhMSkYBPsUqji2UQCAXoJXwKFCJ3AcYVJn5O+kzExCDSJT1gyOKDUw38fZNT
	OM5v7W+GDT84mzzVsqpq1Z0fjvTf2hafLo2LiGatXoCNdx45CLiyqeEbou1XPfl6
	zn/fnxzapg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013063.outbound.protection.outlook.com [40.107.201.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49sthhbpf1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 17 Oct 2025 05:44:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ElzLdj5HJCwMWLNIoYQ21vbF99hj30nt66JrGtgb4m3PN7PWe+/YnvU8/HFjid+3TChWbgvNBdY5haoy2rc3z+ZeQHGvMUjLEIb+G2nS64jgJ4FGzCio1sJ/3fE4o6XSgU6Ko6XXjYMCkixH1VRzgjXuM2P6kBjRrJpBb1AwQLqIthrkT1iV9MgvaNEVgQ8PeVX4ijhicssNq9lUG3NgDls/clrh9cGwlz6rxdmypQD+vkKfFNqCmg5HP57d/BhIeU/Tt/Ucs/Hfga1RoAPSvCpnPUiC+CNVdJTdML8LPy/WLgcWTzsf8FXQUDWJU7vhk0t3nhhOCrR/1D2rvEv/fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/Ohtl4GqWnXNAlB6J+rBh25ARcKGBS3g1gce5NjixQ=;
 b=CTnOSntSd6QRUQCm7EAcjL6EpFccr+WR8W6spj3PylCb3j30skIwCzeJOqGOWbmMcFvmTXkgXBgNyXuHjbsQHjXvHVdqZLkt1odMRoNR8DIq/RKPgOJJdWGfSVPanJgbED5bumuoxZAqlPatH1LXGYA90z3kjRzUzI7nXnkW705yuBf9UZjJpj3v2Sne3UfGDSIot/6d0JQOu/W/FiNxbDujJVxP48CCUwIokMH7+1LiO0zBfRhyPDhPDQvJL1GCBKIGDSTM1xPJXE/cpYAdMvDUVRNf+xAiJdXscN7wxObqAzryLkkoBxA9azT4VPrW1huVCzxqd1Q8SY3abEz3MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by DS4PPFAC42FDD50.namprd11.prod.outlook.com (2603:10b6:f:fc02::46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 05:44:29 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%4]) with mapi id 15.20.9228.012; Fri, 17 Oct 2025
 05:44:29 +0000
Message-ID: <f4965168-3c12-4882-8cdf-9128c4b053bf@windriver.com>
Date: Fri, 17 Oct 2025 13:44:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] libxml2: upgrade 2.14.6 -> 2.15.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20251016074240.2464360-1-hongxu.jia@windriver.com>
 <20251016074240.2464360-2-hongxu.jia@windriver.com>
 <DDKCUYGEIQSY.1VSVCA6M3O4JZ@bootlin.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <DDKCUYGEIQSY.1VSVCA6M3O4JZ@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:4:197::6) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|DS4PPFAC42FDD50:EE_
X-MS-Office365-Filtering-Correlation-Id: d2563d05-b6d1-423d-b4de-08de0d403d9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aXRIamlkMWVsVm9KQ3Q0S2N4Um5TUHhHQ3UvTDFhVUlOemRZSGQ1K284OUh0?=
 =?utf-8?B?Ty9oZksxakFjcUdCNXovanNpNW1KeG1ldDd3am1zbjFJQlVNZlJVcTRqRkdo?=
 =?utf-8?B?dTlRbHRYK0NyVXhOaHRXYXNvQzhlaTQ4cVdabENMTC91MnpvcHliRzhwVGJx?=
 =?utf-8?B?cnErV1FFZWtvUU92Z2FBNEg3cHhLOFk1QmI5UHI4bTZTU1J4Vndzd05sOWMw?=
 =?utf-8?B?VHhoamJySHl6TCtTSXRsVlBuVHo0c0VrMWkrR2JPZ29SVFJDbmlrMVRjUTVm?=
 =?utf-8?B?NXFYaXdsaHlnR3owekY3aDBLbFdlTk9BTWlhNFJ3bmJqSEZZL29yWmI3QTcw?=
 =?utf-8?B?NnRiVWlJOFBiYWtYMHNwMDZKLzdkMmVVd3JOeG44QVJsNnBJUW85MzFaZk1X?=
 =?utf-8?B?MEQwWkw1R3d0RmVpSTZmdmR5K2loeEdoc3p5V1NkQVQvZXZLSHN1VUo2RUdJ?=
 =?utf-8?B?cHdUbjdYYzNwYmJONmk1OUdvc2VaMTVsNXZjb25WZnJwWmVicWswYW1mWGc5?=
 =?utf-8?B?V1hJLzk2OVVuS1NPNjhJQUU5S0lmczBiY3NVZG45TWwrOXY4aG5yaW4wczJN?=
 =?utf-8?B?eG1XVjFNeW5RT0JXTHVORXZLZkJGWUNmN0FtdkpsQ3NCTDFPSHJYcWduaGxW?=
 =?utf-8?B?cllPM3I5ZWpwUGxpcVhXbCs4Y1Ezd0tPclBPZVEyUm5TMFlXdWxxS0g3cmlx?=
 =?utf-8?B?dHdoWWpPTHhHWi9XeVd0MkdRUTZEcUpVV3o3RjRwV21HREZUam9vUUcrSVNN?=
 =?utf-8?B?Y2E3WUpoUmlDSTJZaDZINWU4RGUrazlFMmNGRVZVeXdmZklybGNYNVh4RmNS?=
 =?utf-8?B?ZWh1ckJETUpvYW95RlU1U1I2MGwvaVVuTjdCU05JT09kbW1BaU5IRDZpMWE0?=
 =?utf-8?B?UnVsbCtnUjhDTldEanljNUhXd1RBMkQvN1VNL1NOS05lRVMrMDVTT1o2czg3?=
 =?utf-8?B?NEF2dllCNFQvelhjSUVNaG5pSHphbVAxWG42SW1WenRpK0JvaW1ZU0VuM0hp?=
 =?utf-8?B?WWttNXdtbTh1cWczM2RjdnhUdW1SVzkyc0UvR1NjTkRHb1AvTU9SbTB1OFpT?=
 =?utf-8?B?d09idjk4dXh4ekdMQUhoVEpuOFN5TituOU5ndGhlTEVQZld1Mm9ZRDFGZGtS?=
 =?utf-8?B?L1J4QWtTaXNJNG50RmtYV25HUFhzR29lNGJHQmMrNnF0Z1psMTh5bGF0SFpG?=
 =?utf-8?B?dm5Lck92TGdSTXkyZzRON2ZLSU9tV1l2LzVTcUhJcEZOZmtMa3VWZ0J1Nm5t?=
 =?utf-8?B?WjJKZGZkK2hqd3JEeUFlaEo2eW9RN1A1MGZ5RTltOHdLcCtVRFo2SjYrdzdD?=
 =?utf-8?B?d0JiQWFVcWpUZ1VocElHNWFRNDhWa01LMmI5WFprM0RneVgxOFQ1Rmh0bld2?=
 =?utf-8?B?ak9TZFEwZVdidzFEOXRjT3o2NlU3NWJwckpIcDY2Vi9OTSthTWlIWUM5MXJN?=
 =?utf-8?B?bUx5ekY4VDF0R3MyWFI0dnZCaXJMSXgzT0JIWjhROHExRUFWZ3c2aFBsWUpG?=
 =?utf-8?B?WkVHbkw4MmlSMHNveFpwU2ljMlBzWFlKL3N1Y0w5NmQ0c0lYa3llejdjTG0y?=
 =?utf-8?B?V3h5cWRjcWwyeWZqc3RIbm5ud1I4MmlIUXNpM1YzME1pZDVGbzdPenFPZ1c5?=
 =?utf-8?B?OGtQbTd1MUtscVpUUHluL2IxbnBVQkorcHpCRm03R2k2QThKYW5zWmFyMklR?=
 =?utf-8?B?bGJpbFFuZTdyWHhGUVl6R040MGdvQ0l0ajVXUW54T3MxV1JyNVl3ajluQTdr?=
 =?utf-8?B?UzJsRmgrNi91UWxPNzhadHBJNmZhWkhtYks2bW02VXBxQ0J6dFU1QWsrWVk0?=
 =?utf-8?B?WGJyMStSeG1QdVI3N05oRzZ2OWVSdGZIdDNNWGprVUJDQ2oyR2pBUWJNSXlh?=
 =?utf-8?B?QzQ0ZmJHK2RqcWpnSkFKZVZnZ0RySHl5YmxBTEpmQzZWRFE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UjJka0NSQWkzRnN0ZDZKbW5IR1VwUFhLbndXS05DZUY0b3ZuM0lqbUVVdi9E?=
 =?utf-8?B?L0Q2THFmWUk3YVJRYWgwYnJCY25mTHFnSjhxbTNwb2x1YXpLTnRaenpMMHRj?=
 =?utf-8?B?NU1HSFByYTVuQnJxYXNDSHpMZGE0V3RDdGVUbFdFQkkrRmVYN3o2SUFTYXBU?=
 =?utf-8?B?SkhSQ1Y5S0ZwdFN4ZmEwUUdBOGJUdG5EVXJpZFdoNmd4YWJMWlZ0REVoUjJ0?=
 =?utf-8?B?ck8rS2ZuN2RPWUVpYkVTZms2MjhBaVAzSTRnd2lJWFIvN1lPdy93ZDRyeWZL?=
 =?utf-8?B?WDFObmdBdnFiZjdNY2YvUVVYNEdTSllDVkV0S2Jhekk2c1ZmNXA3cUZ3Ri9I?=
 =?utf-8?B?SHhCNG9DOGpZR0pGdDRMVUdjVUVyVm5vL0lWZG5ocU5uZENoOGhhWXQ2QjdB?=
 =?utf-8?B?YmIxdk9WcTFQVUhHUUw1ajFPcDZ4bmF1M0pPTjZiM1BvUklXaVdXSjJDRlVF?=
 =?utf-8?B?QUlzdG1zbk5XMXBjcEFUdDBJbVZVQ3hBeHV0ZDFMeEpVQkdEYjl5NUV1R3Jy?=
 =?utf-8?B?dExVSE1Bang4c3R4Vm9KLzBkZ0NlMGVDUnB6VDQrS1RhUlZNaVJlN2dvSndE?=
 =?utf-8?B?NnFEM3J0eC9xOWJ5UEtmMXFJOXNPSVpiak5XeFpMdEhDZkxreXI1RVJsa25I?=
 =?utf-8?B?SHNpb1NCd29EamJKVGhJSURFajRpek5JRFhaVGhQSlBldUlYUG5GK2dpbnNi?=
 =?utf-8?B?R0htaVI5UFgxM0hEQmlOQjZkTlFPZUFsYnJNd2ZsTTVhSkw2MzF3ekV0THRL?=
 =?utf-8?B?eS9IeFN1a0s1aDkxQlhpajJQM1REZmdlZzMzZm54V2plbWdNK0tTQTlVN1ZV?=
 =?utf-8?B?WktDaXo2czVFei9nK3FQOWZ6RnNwYUNoMnI0R3NWMi9ZaUluTzdMTDNWenlO?=
 =?utf-8?B?ZDJuQVJPaHN1NkJOc2VrWnB0TXE5bmVkZGoyK0RhcXZGMmVuNWJvckhNVmQ0?=
 =?utf-8?B?OVdFWEQ1UXl6ZS9YM0FUaEp0OXpUOFFFL01kczBhRC9TLzZvZXNqTVFTWnNr?=
 =?utf-8?B?QWhrcU4rajVJKzNkWUxIU1d0dURFY2pwbDEyeVpXaUlXMWxXN0ZETjRLODg4?=
 =?utf-8?B?cG4rRkN5TnI1c2xNWU9LcTYweWhZVzB4cjZYTnJSM1I1YXEwWXJibHNxN0pv?=
 =?utf-8?B?Yk1GaTVWZkNJcUVFZkk1ckdOYjFkaHY4eHVGWHBkQ0hQUnZzaDA2UmcwamE0?=
 =?utf-8?B?MTFzOGttVkNqalk0OTU5eThWRHBHc2pkSkxVUjR5Y1hXN1ZJZzV6cmJpVHlK?=
 =?utf-8?B?MUM2QXc4K3N4WEptelJad0FneE9lVHZFT0pLYmE3TzlkSmxoYlN6dk9VTC9n?=
 =?utf-8?B?ZmxzYWoxd1NMcWp6RHBhRXVOb0Y4c2xBRTJpcWFoTStJRU1IK0pFVm1pVHlq?=
 =?utf-8?B?WUx0YlZWY1dGYm5Mcm1jcmpaRDUrOUF3NGI2bmJkWmFhdkhTQllHL2hLenln?=
 =?utf-8?B?eVNaVmVkNVVCR3B4TWNIWW9ycUJRcStRa1QyRThUY29FUUIzbWJnVTlWZEdi?=
 =?utf-8?B?NmI3WHJrL3lPQi9nMy9NdTJyNDRjb1FZc0xDZzV2b2JyOUErTEtjTmRyOEF5?=
 =?utf-8?B?VXVoRGFYK1VDWkZUQzhjeWxNWGJVYW9DUmpobkVzcGxsbTRWS3VzRVhGNDVH?=
 =?utf-8?B?aTI0clFBemtvRE5TYjV2SHg2by9KZGpOczM5YWF5VG14TWhXdmZJcTl4NUNS?=
 =?utf-8?B?QXFQdWdQQ1MvYUdjWnhJMnM4eStZUS8veEdNbGZrNmo2a0E3NnFla1JCRDNn?=
 =?utf-8?B?UVE1WWZWZmxKOGxkVkNuY0s3YWpZVVVQVyt0dkpGNThRWWFuNDQyWXFubUd6?=
 =?utf-8?B?QTljVE9jQSthTmU2Mm5VRmFXd3BzOFVaWEt4RnpIWXBqWlZnZkFkNUNVbFdH?=
 =?utf-8?B?RGx0ZzRZTWIrSW5tL3BYWHlSVk16RURVOVM0V3VGWTFKRU9HbCtxcHpsQ2dx?=
 =?utf-8?B?Z0FtK0p5aGwySzdJd045VXJsQUZyMWNCS0ZId2ZsSk9FdERyVTMvcjg0aWJS?=
 =?utf-8?B?VUZ6WGN4K0FJa1NZaXB0cVV6eHM2VVFKUmhMYnl2R2dpdEZRVnQ2a1ZWOWt6?=
 =?utf-8?B?YWtRTDhtQk4vRWhrTGFEVkpoYUFNUUFEVi84ZEhOYUhFbzBqTTFWWTNaWmJM?=
 =?utf-8?B?bGh2UUg2WGdCRHBaSjU2K2RYTGtLaFNkSGVlalFKRDE1Q0FOcTJPU0R3RWsy?=
 =?utf-8?B?SVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2563d05-b6d1-423d-b4de-08de0d403d9e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 05:44:29.8595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QzJrIJ5r9zlmJRgWy9kdJlerjDkPOWBUoANuYEwM9+4jg9IxjTG0RrCpD6DmBpAjGRmKfx4ggLfmBfCGPaDmD4DpnBuQc53ZdcKKj3ACVW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFAC42FDD50
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: QMrgkxDnlSZv14uXzKvk4NGpYqvKNb3_
X-Proofpoint-ORIG-GUID: DLSAWU_ryyYKswmzKBeL1zT_htXIZEl0
X-Authority-Analysis: v=2.4 cv=QLBlhwLL c=1 sm=1 tr=0 ts=68f1d7c1 cx=c_pps
 a=42Ag0VRmng1YD8CjqzuPTQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=GHR8O2WEAAAA:20 a=Z5getJ8MAAAA:20
 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=t7CeM3EgAAAA:8 a=ij94W6kC2FAeMkD465QA:9
 a=QEXdDO2ut3YA:10 a=m9p5bXcFLgAA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=FdTzh2GWekK77mhwV6Dw:22 a=CTwFTDRtctY-zZ8oRDn3:22
 a=yULaImgL6KKpOYXvFmjq:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=UDnyf2zBuKT2w-IlGP_r:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE3MDA0MiBTYWx0ZWRfX8wG3NNodY0Ya
 kCR7RD6AJ9bztYsCDr0sCCwqkke44uU1rhNqo+PW9f33Aikbl+e8AHBJE+0qFn42giF3aqKHBrH
 EUHvlNwhkrn0cRVyBolSJ2KKGVfI3gv60URwvx2mySM2Ye7GXX0bPl2VsuIRTCD+N0WJ681U5yL
 SY/uV+NM7fIexlNba+P0tRWFKH73ssYa4equDLK4ayONq1KQZD9ObeeK7ln97nvGYwvUFo7e0ug
 uBcWZ+xf1ugAT4zXOzAq+GFIRLjDoSZu47zufIE60xVs2jufzI2B/vrI2jxT+ppGJrPowfRgWKc
 lKCpgKHWAZqwVqqo1cSAjYi1N/5olPxY55TU+npM2FXOac4Pf/K/wqQl7OYUw9Bvhi26mvzIR+c
 dISlBms0Aevz77dUD78/7Aj9BWGZjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510170042
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 05:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224993

On 10/17/25 13:41, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Thu Oct 16, 2025 at 9:42 AM CEST, Hongxu Jia wrote:
>> Due to upstream [Remove LZMA support][1], drop option --without-lzma
>>
>> Due to upstream [disable python bindings by default][2] and are
>> planned to be removed in the 2.16 release[3][4]. If we still enable
>> python bindings by --with-python=yes, due to upstream [doc: Build docs
>> with Doxygen and xsltproc][5], build python binding requires doxygen
>> otherwise build will fail, and we do not provide doxygen in oe-core,
>> so remove python package directly.
>>
>> [1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/1763281cd65ded4067ddf123eb7358690c214b0b
>> [2] https://gitlab.gnome.org/GNOME/libxml2/-/commit/fa931566d2f541d3162c7b98c8a12e6b2a6ae542
>> [3] https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.0.news
>> [4] https://gitlab.gnome.org/GNOME/libxml2/-/issues/891
>> [5] https://gitlab.gnome.org/GNOME/libxml2/-/commit/bbe5827c94cc9b0e393ff3e6eef6dec2376317e2
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
> Hi Hongxu,
>
> Thanks for the v2. It gets better, but now we do have some failing
> ptests:
>
> AssertionError:
> Failed ptests:
> {'libxml2': ['attribs.py',
>               'build.py',
>               'compareNodes.py',
>               'ctxterror.py',
>               'cutnpaste.py',
>               'dtdvalid.py',
>               'error.py',
>               'inbuf.py',
>               'indexes.py',
>               'input_callback.py',
>               'nsdel.py',
>               'outbuf.py',
>               'push.py',
>               'pushSAXhtml.py',
>               'pushSAX.py',
>               'reader2.py',
>               'reader3.py',
>               'reader4.py',
>               'reader5.py',
>               'reader6.py',
>               'reader7.py',
>               'reader8.py',
>               'readererr.py',
>               'readernext.py',
>               'reader.py',
>               'regexp.py',
>               'relaxng.py',
>               'resolver.py',
>               'schema.py',
>               'serialize.py',
>               'setup_test.py',
>               'sync.py',
>               'thread2.py',
>               'tstLastError.py',
>               'tstmem.py',
>               'tst.py',
>               'tstURI.py',
>               'tstxpath.py',
>               'unicode.py',
>               'validate.py',
>               'validDTD.py',
>               'validRNG.py',
>               'validSchemas.py',
>               'walker.py',
>               'xpathext.py',
>               'xpathleak.py',
>               'xpathns.py',
>               'xpath.py',
>               'xpathret.py']}
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/642
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/2458
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2497
>
> Can you have a look at these, please?

Sure, it seems we should remove python ptest for libxml2, v3 incoming

//Hongxu

> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


