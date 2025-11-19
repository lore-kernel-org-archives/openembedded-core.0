Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17300CF58E0
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 20:12:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16573.1763583120613006858
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 12:12:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=X3c1cm9n;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3418077aaa=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ7vSfY4100534
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 20:11:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=0TGTy9pQpfbq9rsqLitWFv
	h3+vsKraz39TWlITGxePQ=; b=X3c1cm9nBCqevIC0TzWZFWplnWajJKv4uBN0Na
	HvoYcjO5RaUbbiAzhyEqiHsZNWKSlCAZS8xOHVaG+qTf2i4avM4SmJWDmRrYnvYw
	gIO0cdY409xpk69bEVsFPF9WdjL0ytEB3e5pI97QjPUNzDNf9u/1TxBnVIq99Ur+
	pJafcUDHiNlS7CY77nQAetEoNVcKWB3WcXZ1T8o8E2EfEpmSLmEjFgUMOituMWwL
	dK3sRzW1KNCQyUDeIDJiyvHYt0sC0tiuuxSZY7XT1X1iy8DzNSUN0jBXl28gFXAj
	hyDUEGkpuRbkrQfhZvwqiiGtS2NRK7Bw+IzNuKw3uOZOzlMg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011056.outbound.protection.outlook.com [52.101.62.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeeqwnmrj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 20:11:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/esDqjHa9xziaLSoKYMNll0wpyp3SD3kvJD7fIKOQyw82fPTaRJpL58iha814dWHC+xJObi8ByFO8jhdPa84RSxL3W5wvCSsnHG5fIK1pKgLattuIaCwsAdl+H1u9OuWMPiahGccS9uBWQs8m6u4FWkNj3xCdZMDKcRqHILUvYsTCDbTGXsgCLWeJPxHK2E5v1wJKcLvR/Y+ETNwC9yNiN8Q0mOOLQjxOxKzuVWiAZn5QwgttucNNvpX/3Qg7oxgRWUMVjRJMN4Nyqj33BQrqELbTrqsFWXB1TnciR1S8PMheUWN+e9QD+b1Dpj09SB4VQfEIXVgBXWxIBvm+XkKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0TGTy9pQpfbq9rsqLitWFvh3+vsKraz39TWlITGxePQ=;
 b=gjy0GyMXshHT2V06vmXfxTVfo61P+mxO82IfjZVqkywuWC9i2sLQYJfgoxlRqbmEHtyMvt+fxr7etZ54rVNmfICMkmkY+1fOAopIvrEDFOLucUWAtokNxW+8CmXNJbaa5nZF0F4fNOmeNJ/C6vfGGar8L96FhwjqZOfXd8eu85XSzKPM4szmBYAHH6cX4JONmhiq5DxUFyEJ4Y4m47xdkr69FotL8sYCyybgxWJVzetRxrHjYY5II/3fJpEfngCj1O8s1mr5zv4q5qmhRNT2IGvMxB88uE+rLyTkc8cxgBAuAh8pf7OEecsa5bg2rH84dvp5rgkNFIGiwzJFpWuSXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SA2PR11MB5081.namprd11.prod.outlook.com (2603:10b6:806:118::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 20:11:57 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 20:11:56 +0000
Content-Type: multipart/alternative;
 boundary="------------NxRNQ56TTOWaGEp3ODbQj01Q"
Message-ID: <84a0e47f-5772-4d75-bf30-d76f14526116@windriver.com>
Date: Wed, 19 Nov 2025 15:11:50 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 04/11] bitbake.conf: Include "rust-kernel" in
 native/nativesdk feature filters
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, elmehdi.younes@smile.fr
References: <20251119164804.256364-1-Harish.Sadineni@windriver.com>
 <20251119164804.256364-5-Harish.Sadineni@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20251119164804.256364-5-Harish.Sadineni@windriver.com>
X-ClientProxiedBy: FR2P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::19) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SA2PR11MB5081:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e6dc1e6-c8d3-4b9f-ec69-08de27a7e3ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SnpHbDBibEZqRzEweFhISjlYczRCamRqWmorYW5BYmlFYWpodE1hQnRnOWJM?=
 =?utf-8?B?cHNjcWZUQkNVU2EzTldBZnlybksyYU1maXFpUEowL3FLNFRVZkhpVTVzbW1S?=
 =?utf-8?B?MFAvd3IzR2JnakZkY3hXU1l0aXpyTm15eTN4bmRTZXVpTzRBOGpkTFY1UWdm?=
 =?utf-8?B?dkhsc2hUMHpIdkJmcXRYZEw4Zyt2c2dRVmdEcWR4M015cnFkSXpQVE9ud041?=
 =?utf-8?B?azloaDcwZTBGN2dmWEVBc09SelVmWWh3NnRDamVONlJlNXFzdWlnaFV1d0NG?=
 =?utf-8?B?ZmpCSFRQRzhDdDV0cHF6ZlVJeEhXVVRESzVNVk5DbGJGOWlVVHZ5VTZUam8x?=
 =?utf-8?B?RzQ0YTUxbGUzRzlmOFJsTk1zKzJSbWpaVU8rZXdWMnNUZk94NWY3NzBvZDZX?=
 =?utf-8?B?R2g1T1pYdSs2Nm9mQzNRU25oSldWdkJFZVFUTldHTWZXbWFJVGpsUkt3b0tW?=
 =?utf-8?B?NnBmcENkL1NleUlNQXFqc2FvZkl5Um1LMmZ3Tno3SzVWQzEyZUhJOHJxbUdC?=
 =?utf-8?B?UEEwQlAyMWlqQ0FUUm5RQjNYUFZ6VCtFbFU3VkVVZ0szb0ZINEtpY0pmdFdp?=
 =?utf-8?B?Vk1idEZLczN4T0lWUmtnYUFuUmhSdkNWVTQzM1poZTJiOE5tSTRmMGsvV2FV?=
 =?utf-8?B?WnkwcFgwb1lieTJvUnhFR3ZlSElucUhLYTJCdnVLVUExaGdibDR6L0tKeHFM?=
 =?utf-8?B?L0s4MTNrRzJYOGMxRWRzUFpzY0dyVktWTjAxOVc0cUtmTkZ5cWxvc1VWUXlC?=
 =?utf-8?B?NFZBdUVqaUdvUFNwUWRWZFZEaWhiN1FqSGxEMndNeEVaZnZJNW1hNTd2WEht?=
 =?utf-8?B?M1RKZFRGaUhKTTB4NDhsc3lacW1VYkRxVmFhZWtaL0JjYlJRZnhXdDArSHFq?=
 =?utf-8?B?OUlIRlliWndKa0ZuUzBLdWlNVVJ0ZTRuQ0FIUFordGtnb1FjVHg5NHd5M0RP?=
 =?utf-8?B?ZWdqaXhqNk9qdVFFRXdYRkc5eXBLc1hXajlwZkdhV2huOG1DNVBDb3I5MFlD?=
 =?utf-8?B?VjZGeFc5b1U1clp0Mi9oSmxoWTZVdkVHbVgrbm5vdmtsaC9hOHNhaVJDM3lv?=
 =?utf-8?B?UGo5cmgveW9XV21mRmFKTGNNZXZKSzYzUHlUNlpjVTNLT2ZZeWFFR2t2ZUNv?=
 =?utf-8?B?TmtKUDIxWmFwTEVjaUxWY0YvVEY0THVWbUlJS3d2Y2FyY3Z4VTJ5cXdtd3Rh?=
 =?utf-8?B?a1h6Q3Z2VGpma1hkUGkzcDhzWFNEdlBFR3BYMGJFdGhycStSRjd0a3REaitQ?=
 =?utf-8?B?TURsdUdoZDFnSHV4VHZxM2VFNkZUZ2Q2UitCR2lyRUN5WkRkS2lDNktsbEZa?=
 =?utf-8?B?S1BndUtkdkpUYjlrQVNFc2xYOTZ4cVRVYWk1NUZCa3Y5Z2szeGJRUXZUMUpB?=
 =?utf-8?B?b3ljVTF0WmRwVUpQQ1BCR3F3a3dYY1FNSnBoVERKQUNJMXNsQ25yeFJoOWVH?=
 =?utf-8?B?bVlvZ3UvSFpKYU01a3BRY0UxNFR0dXdyZkdXMVpmOUNtenpoOHhCakhVREpR?=
 =?utf-8?B?QmdoUU5tenN4V2ptN2pZcGF6d09tT1RqOHU5czJVcnBXZjRwcUQwV2FpSzZP?=
 =?utf-8?B?MXdzczAyOTNEb3hsN1R1YlpaTXdjNUVEMDEybW0zTEdOSS9OUHdJeFg1Z0hp?=
 =?utf-8?B?WUFUU01YeEJ3NFdaOWJhRC9YMFc3cXkvLzRhbkQ4dmJydUE4Z2pFUTdvZnhm?=
 =?utf-8?B?aVFab2pKNE1uWVRhMlVpb3JoK3Y4eVFMY2EwallvSTlYTnNhYThaUVJ4OUdF?=
 =?utf-8?B?MXB0UUNCbHozVjNPNjI1YzhYUjUzeTdzTzBVMW5CeXJWZEFRUVJQVWpZWmhV?=
 =?utf-8?B?ZDBjdXVna0ZCM2o3dm9TU1pDR01iR2xSWDJIY2hpOHkwV1BhL3JBcllRRldy?=
 =?utf-8?B?dmllTUFIcklQb3AyS3p0ak1UOVZXaFFMT1RJbDRxR1F0VDBIU3FQUDhNdVFY?=
 =?utf-8?Q?ov2dyaNmGESBu79axzY9AUHfvIgRI8nx?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VFpGRFNGKzR3K1JWTnk1K1Y5ZXpDcFZlTVhBeHVwdW5sS01YWlJBRUZpZk4x?=
 =?utf-8?B?UnBXM1daRWNkeCsweW5oR2p5aUNMTkdQbTA5THRwS0JLTHRmV3FVVi94alc1?=
 =?utf-8?B?cmxHOUl3ZHhLS0dQM3lHSFhRU3IvbXF3czY0L1JXS0ZENXJBcE1DbFRxZGxr?=
 =?utf-8?B?SUNKa0hRbytiVnBjZUlnSWovUU9idnpVai94TnNOOEduT2NJNVpKNi93M2Uy?=
 =?utf-8?B?d0lGVngwN3VFWWk4Zytvd2I5ckZCcVI5MTV5RWtOczliOGk0bHpNNGFuTitG?=
 =?utf-8?B?eXFVVEZJSWxlaGU0dHVmRSttM3BoU0xCSFlpZllRTndBYllHc3NyTkM5alNP?=
 =?utf-8?B?ZkdMTzcyUTVtYlRZTWxNeHcxdTlvQnYzTEFhVVNucTZpNWZuOFl0UVcwNnRy?=
 =?utf-8?B?UTdsSVF4U2NZcDJDazlkc2RmOW4vNDRYa2FEblBLMjZ2c2lvREU2N0pMN3N0?=
 =?utf-8?B?VVkzUUNQMEZZalpyczRkTXQ5cWxGd2h2YndKaDVEZG95RGlLTnN1TGNsdHVH?=
 =?utf-8?B?Ui9UNTkvMlBVbzVqcUliQXpST1QyQ2lpalVhckFiYkRQOWhNeXp3MGlzempB?=
 =?utf-8?B?UXZMVGtUYlBaZ0JDemEzU1hxNGk2ZG04WEFNeWVxNnJlU0hRYjVkQTR3eTNJ?=
 =?utf-8?B?TXVCUGNjakg2c0s5VkRWQm1zMmRYVXlpa3FhQ0FFbjZqWkxHS3lQRWZIdHdM?=
 =?utf-8?B?RWdGME1JSG5NS1J1MUp3MnBKNjR1NmN3NllLVE9oYzk5NWgwUmp0SHc3NXQ4?=
 =?utf-8?B?ZG5IQVI0TGIvT1RaWlJPaVZZK2U4RTloNm5IUVVTcE9ieC83SlEyMk55amYy?=
 =?utf-8?B?Q2FJeCtwMExleitOS0ZXemJoTGlFTStkS3pETzIvOGJjYTVnem1LcGhmR1Rj?=
 =?utf-8?B?NjR5eTNzcU1ENXIrVEZtRFF2NFBGcHVUNHZqNjBKZkp6YWhtdWQxdkorZUlj?=
 =?utf-8?B?dFRFUWNlTW1vVlhGQnBDKy9yMnlFby8vUVV3b2xSdFlkQVJ1UEZ4b3hBbWhH?=
 =?utf-8?B?YkZLbHhLcVFyUVNndnpTTkVNUzh5VVRsaC9kOXFJWGhyT1RYVFJsVFgzTEVK?=
 =?utf-8?B?amxVbXlReUx4aFFsWEhxdHlpMlJvc3FyaXdCcXNwVkhNQi9xQWpCQnI5NFRL?=
 =?utf-8?B?VGUvK3h4bjRGdW9YRDVTMnNHSm9ydmlJMHVtWjRuTGJmUzZIR2xxZURhcURU?=
 =?utf-8?B?SnlYWnROcm0rMGxTOEJ5UFR5QWpPSGJwWG5uZ1pTeW1jNS9Fb1BTWnF3WWkv?=
 =?utf-8?B?ZkhwTGd1OFN3S3pneXpSUStkNGsyTFkxOXhQS0pjVTJoZjFGNDc1VDYwSWli?=
 =?utf-8?B?RGQxRStabTM4MHgxODd4MURuMHBkZEJNcXVTc1YwaklBZVBEbUdsTDRFYVgr?=
 =?utf-8?B?UjFUWSs3K3hnM2xqckl4U1NBRzZNVkZtWEVWZWhmclB6WHBhbkM2WE93ZWZR?=
 =?utf-8?B?SXlKQ25lOWhLY2VuKytBVU96WEtzUk96MFY2djlPeklDZHdTRUpzMzJkVU1K?=
 =?utf-8?B?R3RJckhzQWJVRG5OWkRvSllxaktjdVlVOWtMUkRUQkZUdGNsbkdFSk5aMFNS?=
 =?utf-8?B?RkEyNjkxdlhhdUYydE9iTlExb2U0WERuUFh2bkVPTlRkNmZWQ25IMFFHTi9O?=
 =?utf-8?B?dGUyMDNvOTBOMlh2WlBoQXoycXgrcm5nTHNuZkhUcC9kcitXQVZRSU56bmdq?=
 =?utf-8?B?a1NjUWo3L284anpTaGg2R0FoNzc1RVJWWllGV3ZTdWI2NkdVNjY2b09RTzVk?=
 =?utf-8?B?RWNDM3RadlcyQWFDd3RoQjJvZEZQSEtuU2JTdmcyUXNHZmpyVVdhT1NhQU05?=
 =?utf-8?B?VURubU8wdTdjQThTRHJGclpRQnN4NEpnMWgrVTBaVEpZdUErQVRmSjczT3hr?=
 =?utf-8?B?WWlOR01mQTc1VGlpNGpxMEoxb3FNcjRsUWVTbEVCWEUvZlVuak92Y2xkV0k0?=
 =?utf-8?B?RDVLN2t6UHc1T1pOWGNsRy90Mi80aklWRDVBTFE1d3FyU29GbkMwQVdZTkox?=
 =?utf-8?B?ZVZsR2JqUTBUMWNHVSs3QTRodFRCYWMxcDhTMERCZHhFRFlpZlJHZlV0VmR3?=
 =?utf-8?B?ZEw3RjJRdGlKZW52elEvZXFrVnZ4alY1NDQ4OW8rK1Y4dDVNTFlDV3g1K1pQ?=
 =?utf-8?B?ZmE1RE82QlpoaHc0Q1EyeFBiSnBUWWE1UnBscEI2NGZUb0dvYmRjSkJDbW9Q?=
 =?utf-8?B?T0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e6dc1e6-c8d3-4b9f-ec69-08de27a7e3ae
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 20:11:56.8246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qCKKwvL5fTifTGcbFw0hqufgUa+r1AGGKSqTqJa56hAwldxZXZPkCrTInBgw9Zhc/om1ZoKCDMRTdEbo6j2HDlWDjHXfUb4rwktoZswVjq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5081
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDE1NyBTYWx0ZWRfX4RgLC3uM4g5J
 gh+Zgij0GWFevviDdWsAb7cC9YmfMqg+WAgdq7lvS3whhc+yfbE1Ybe3l14/EMbzpU3su3CLNHY
 z2ybRCAZ/kn5bZPbO4A8iu81PVxFHRA4SOdtH4PnMBLxURdhW9MA/fsDuwT6I+/RZp6Ti4hYym4
 NFJquFWhpy2piSIqOQeeWUjhs7cQKNh+sxhsxKncMgnR/zBe1//iv5G+Mwf8pHUCoIs8a0LcNGd
 dBX2dRJiUMssHbVGcWYPY1Q9FZVnEo/sZ3ftH7wILBmhPzUHPyNCKol4nqdR2Ky3w2reHBJ3FrB
 FTzaDK/ZsEYL66dfZrzqf1pW3LTlAI55jBPUh246PTSHup6oac3a1eaE3h4hpP827B+wxzx0UXh
 IlWs8tm5olyXV3Wxc77QKDb8I4A/JQ==
X-Proofpoint-GUID: gus0DGJ28YQrOhx50wyITAY_ncqQZpwW
X-Authority-Analysis: v=2.4 cv=OuxCCi/t c=1 sm=1 tr=0 ts=691e248f cx=c_pps
 a=6I6wiI215fH6V9pCQ0JikQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=4f-Sc8qcnBTL38n4rAcA:9 a=QEXdDO2ut3YA:10
 a=xWBQjpzubWhZ7YZo0B4A:9 a=yC6k_MdXa9jPo4TS:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 0MQ3yY6HrSsVqY8Zc7b7ivD6fhGThavQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_06,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190157
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 20:12:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226587

--------------NxRNQ56TTOWaGEp3ODbQj01Q
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-11-19 11:47 a.m., Harish.Sadineni@windriver.com wrote:
> From: Harish Sadineni<Harish.Sadineni@windriver.com>
>
> When enabling Rust in kernel, native and nativesdk variants of rust need
> to conditionally install Rust standard library sources to support 'make rustavailable'
> in the kernel build system.
>
> By adding 'rust-kernel' to DISTRO_FEATURES_FILTER_NATIVE and
> DISTRO_FEATURES_FILTER_NATIVESDK, the 'rust-kernel' feature automatically
> propagates from target DISTRO_FEATURES to native/nativesdk builds
>
> Signed-off-by: Harish Sadineni<Harish.Sadineni@windriver.com>
> ---
>   meta/conf/bitbake.conf | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 5406e542db..8d6211efab 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -916,8 +916,8 @@ DISTRO_FEATURES_NATIVESDK:mingw32 = "x11 ipv6"
>   
>   # Normally target distro features will not be applied to native builds:
>   # Native distro features on this list will use the target feature value
> -DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opencl opengl wayland"
> -DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opencl opengl wayland"
> +DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opencl opengl wayland rust-kernel"
> +DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opencl opengl wayland rust-kernel"

The list was sorted so please keep it that way.

../Randy


>   
>   DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit gobject-introspection-data ldconfig"
>   MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"


-- 
# Randy MacLeod
# Wind River Linux

--------------NxRNQ56TTOWaGEp3ODbQj01Q
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-11-19 11:47 a.m.,
      <a class="moz-txt-link-abbreviated" href="mailto:Harish.Sadineni@windriver.com">Harish.Sadineni@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251119164804.256364-5-Harish.Sadineni@windriver.com">
      <pre wrap="" class="moz-quote-pre">From: Harish Sadineni <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>

When enabling Rust in kernel, native and nativesdk variants of rust need
to conditionally install Rust standard library sources to support 'make rustavailable'
in the kernel build system.

By adding 'rust-kernel' to DISTRO_FEATURES_FILTER_NATIVE and
DISTRO_FEATURES_FILTER_NATIVESDK, the 'rust-kernel' feature automatically
propagates from target DISTRO_FEATURES to native/nativesdk builds

Signed-off-by: Harish Sadineni <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 5406e542db..8d6211efab 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -916,8 +916,8 @@ DISTRO_FEATURES_NATIVESDK:mingw32 = &quot;x11 ipv6&quot;
 
 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value
-DISTRO_FEATURES_FILTER_NATIVE ?= &quot;api-documentation debuginfod opencl opengl wayland&quot;
-DISTRO_FEATURES_FILTER_NATIVESDK ?= &quot;api-documentation debuginfod opencl opengl wayland&quot;
+DISTRO_FEATURES_FILTER_NATIVE ?= &quot;api-documentation debuginfod opencl opengl wayland rust-kernel&quot;
+DISTRO_FEATURES_FILTER_NATIVESDK ?= &quot;api-documentation debuginfod opencl opengl wayland rust-kernel&quot;</pre>
    </blockquote>
    <p>The list was sorted so please keep it that way. <br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20251119164804.256364-5-Harish.Sadineni@windriver.com">
      <pre wrap="" class="moz-quote-pre">
 
 DISTRO_FEATURES_BACKFILL = &quot;pulseaudio sysvinit gobject-introspection-data ldconfig&quot;
 MACHINE_FEATURES_BACKFILL = &quot;rtc qemu-usermode&quot;
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------NxRNQ56TTOWaGEp3ODbQj01Q--

