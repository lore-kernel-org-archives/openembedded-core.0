Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F470CD37AC
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 08:48:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46015.1778489275134751616
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 01:47:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=iwiTddEE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=959147fd60=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B5WD8N3066318
	for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 08:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=0Kds+VRMMww2PO4Qh4fj2hKzTSsVWImSHyN+MTcnBjQ=; b=
	iwiTddEEEBCpisAIeWYyOhT1451IDsXE2RCyhFcVSd3c5SZOqIZpK9BkI16C2ok1
	iAtq0B1ZuFF3ZceH/+bE36FntYPGc5IsbrKhJ0G3d35ojLmiRu5G+M9Q4V573AVi
	/Pjct0oyzAOeSGO4CO0ngEJ92VQb78Evai7Dn97dSq4Sto9KrWdpMKYwoysT+uEs
	sB4IhSm8Kdj5fMm7gX1o+tr5ldihe7FX1LtW3BK2ZcbCMcNeWVhpDt0YM5N24WuT
	INQq2WItLAmCGHL6zlKx56LDcyRP8AHpKYJd9Fq3LJQ8HOh+s5dpnV2KtmwIGZXz
	81mhSDQrxgDLGDTvepq36A==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013035.outbound.protection.outlook.com [40.107.201.35])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e1uw6hrnu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 08:47:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=odl4YD+u+kO8yamv/Ed89DjlQRLhpzU9eJjsFS3ZQ8xTFhPGJPVqRS/e2Z8aFqqwew/sWgu4z0h+WUF5jSIVSJH0JoI9YAODrqAE6JV8LZ4UuKYD6ehLZmU2QjvQYbcuom7Ltv8u+HYWsrCPuFcPX6JPfCnjcufbFDZOMYPzcj4lqXeoes/yyvsk6V5k27sM7s2wKSqVUhnqNjWrT51j4O61r2npESC+iW3hnxILg93JQoaljP96wkqZcM6hFNKJOtZC7BxC/kwMTB2WjWQbrXnrZSJTHOACC7F4a24SdzVcT/nF2k7tid94EFfdQtF5Ykw+/ERyPMh8lh5cZCCC1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Kds+VRMMww2PO4Qh4fj2hKzTSsVWImSHyN+MTcnBjQ=;
 b=UepANMJ3BP+ZG86GONwqMdlUOQveNP8HjonyCp87qD57yYRnBDt9axZrncLSfPKsAG224WEzteqw/wqoPvx9YZuooD8jK7KpSpwJtYjkDgAZLdvMiBAUXIBVmnrEC3ipeZ9dMIlvPthSSRcAIYf83ECp171A9p0JVlW5fYGQMOXBT6ec+rlOytmAs/Fbzqkc/0iZpx6LbxXWZ0iHSg1kV8oKrPg7FA6m9ca3M26nfnxQUV5smZ1wRpQkXiYn+Ve9XQv/wojSI2cOXHtW7alC8tSfN+NJ7j6cOexrSYwSFJMICRm1QBSp2PcnDgbLoRbqzi0LVjoou1XP5/l9NUsTUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by CY8PR11MB7105.namprd11.prod.outlook.com (2603:10b6:930:53::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 08:47:50 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 08:47:50 +0000
Message-ID: <ec3ffbf5-09b7-4176-a032-f0473f741be5@windriver.com>
Date: Mon, 11 May 2026 16:47:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Pseudo abort issue on ubuntu 26.04
To: Paul Barker <paul@pbarker.dev>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        "mark.hatle@kernel.crashing.org" <mark.hatle@kernel.crashing.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
References: <DS0PR11MB7312D96BD98C4D7FAD8D2BD6823D2@DS0PR11MB7312.namprd11.prod.outlook.com>
 <0aa707e8222442434bf9361242653873931b9af3.camel@pbarker.dev>
 <db7385e4-6c92-42d7-8526-ce6192b7f775@windriver.com>
 <10dbe396971651a67f0dbe0056f7e8f3d4957620.camel@pbarker.dev>
 <d9f3b4688610911f39708cf584da58b5be3e25fe.camel@pbarker.dev>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <d9f3b4688610911f39708cf584da58b5be3e25fe.camel@pbarker.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCPR01CA0176.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::18) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|CY8PR11MB7105:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d234238-d184-4035-cbc8-08deaf39fbbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|3023799003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	PsIDX9BLt0fft9fxNyMyfdytCDqP5RiCnAycIDYrlX6SyXlt0Lqq7+hNFz0CZyX3cq0QpDbqdotMDTFLCxPhpsjYFLsBLfVYu028DRjQoRBuLW1ZMqiMNeRpGLjcz97FWTOB0hIJZFH9T09eqchP57ARk21+nbJmjcrZyjmeibnsLhHKCHpH5Z95s/xr5TFQJaDrLY8Xv5iPZ1e43xwley7pB75Z5uBBcFNUS30stIOshiooa8AaQFdhXCqEAkGrX6wc18pQuPsPjGYj26T1J3Hz/VYCTqeG+olcYj12/FA3Oj/vouHow0vmcjxZ+XWy3sN88y99WCpJQwRWacnZKmLUKtV6wManlGUNViDl9VmfG0oCCKEXgLY4AUuiSv7lV9j/mw7qlGD/Q8UQU55Wb7QLfweX1Aik464pXK/jIeDJtztkB4PRyFMdcJxM/NuBmOPZLdPaCFMFly2b+cnrZD2w3ryhS4RZSPqe6iC7xeHCNfZJA4G+QMlbd4OKf1NAUY4yH7mZF9MkSgjsRPJEd9Q+M8gWR6OGXfkCK71DAbsgZr23sk0ybihA538+KwFS7/3TB6+7mPO4ni40Rv2XXlfKIP4npUB6LNi7h4fAHgn/Jje5GsTJz1T+UBdlEsFdmVAx+yQ7Qf2YzFCQCwne+g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(3023799003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RDNWbFNITFlhbmRveHFkUUI2VjVrM0lOS3hhc0lxRzdvL0NGMWhaZFJMQis5?=
 =?utf-8?B?NjBWaU9OMFlQS0hmK2JWSDVUYU5FSEorQVVuSE1oRk9SQng4Z2FzL1MzK3Q4?=
 =?utf-8?B?V0FhN2diMGpkL1l2R1NUWCtOelJWOUlsS0E3dElUN0poYTU1MHI5QUhWM1Bl?=
 =?utf-8?B?SFJCaVFseC9teUNjWUlLaTBNZnFXOTh0UW41WHU1V1IwQ2IvMjB4UE1VbUh1?=
 =?utf-8?B?d3E5NStPN1dkWW1wT0U5SnloMXpqNkhocFg3RmYwTE5PT2NIL2pzdHNyRXhU?=
 =?utf-8?B?ZWQ4NytIUEdGRGpuTUxNTlVuSUo3ZVRnNmROYTYvQWg1RFZ5ZUpEV3hEZ3kr?=
 =?utf-8?B?cnh6NkpjbXR1aDRLcUZHL0d3VWNtS0tDS3RvZHozMGEyTVlOT3hVWHNjYzVx?=
 =?utf-8?B?YUJKUlpmRnFyZG5jQVFMZC9qTWZjMFM3aXNtSjRUbCtvTDRiaTdpVjl0UHRI?=
 =?utf-8?B?Q0Uvc2tZZDNydSt1WjRPQ09OY3NiVE85UzNwRm1iMXR3aWpxaDVpUTNIaG1a?=
 =?utf-8?B?b2ZtbS9Wd0Fqd29HOFRLd1NjRmQyL2pnb0lmWXVETFVVNjZTVzF4b0R0Tlp3?=
 =?utf-8?B?VTNacW9DM3krK1ZYL0xYQzM4cEhWSVYyZFg2dEIzTVZpWUV6MlZsNzk4N2ho?=
 =?utf-8?B?WWEzUGE3aDdlR0tQREI2M0xTbmdyMGtCazR5bm80OENnVEJGU3cvWWhTZmJZ?=
 =?utf-8?B?bkRHWWJBTjNXc1hkWm56aDRYWENHTy9PZWhNa2hkUXFVSUdiRFBTRDZoRGd2?=
 =?utf-8?B?Tk5DRkNiL2JRcDBMRnZjc00vSFA4TDczQzhBMGV4Y1p6Wm4wRmtRMk1ya2Z0?=
 =?utf-8?B?UXMrZmVoWWo1bmZVSWY0UmpnR0ZBY09tV3VCRkRzb1JzK2JESkZkM2tFRjYw?=
 =?utf-8?B?OHZXRHpmeUJGOC9oRHlNVEVRRSsrcDlMZmdTWG9JZHRKRldmUHN3bUdVSWVy?=
 =?utf-8?B?bW9lT25HMFY3bE9OL3hhNng4NjU3U04zNHFsOXVDT091YnNCL2I3VjY5MWlD?=
 =?utf-8?B?SjZQR3FrY3B4TWpISlpvWVkxemtOakJtVERkRWlrbUdERTQ2NlVlTmNMMzhE?=
 =?utf-8?B?SkRULzhaaUJRWVJlTXNDT2VjMzVzOThtSXpaVFo4TFA1a0NiMWl3aWdNdTFn?=
 =?utf-8?B?R05XTFJ6bTZ2b0o5VUJSRG5ncFpEdE5rNDNhMEFuemJMOWVWaXFGWkducndR?=
 =?utf-8?B?dFVvaW9BQmNUbDdrY3MzQ200UlpZdk02K0h2VnE0bE9QbjVBV3VicFBzQ0NN?=
 =?utf-8?B?VEE4NFhMOHlnaDJRby9aS3JUdCt0ZGN4RnBMME00K096TGhsVUorUG5ySnp5?=
 =?utf-8?B?RUkvaDFYKzlxdW9TdFpaeEZhaGNSOEcrK21FMk1lazYvYmlMdCtqQzBRMFVn?=
 =?utf-8?B?SXJaaTBqa0hIMitmaDVuV3pVaDF4VXBER3doNUJaOWVWOEtYNUVhMUlZRWpQ?=
 =?utf-8?B?Ri94WmVoS1lJU0krZGhwZTlJMFE3SVNHQVNqZFZuN3FmZWtFYWcveVFEVHp0?=
 =?utf-8?B?SnF0NFFmOXZ5MkhHaU9jbGxWWnEzcHZZa3FaZUJGZkZZbCs3ZTdDbEFNZllh?=
 =?utf-8?B?TVA2OUtNU2JXeDFEYmRSTEliT29SWE9TbUl2N3RjK2VyeWFLTUZBSnhYZmZ0?=
 =?utf-8?B?eHRFVndGbjN3OExRblFEWU4xNWI0QS9oN25PR21xVEVocHE3ZFlPb2R6RkI1?=
 =?utf-8?B?aG9QK1E1RlhtalVjQnZ1YzV0am9JQkU5V1Z3MzZkYVgrQUNIUnZMTVRMMmJL?=
 =?utf-8?B?Z2QyNC8vT2pmcWxYWTVZSUxnZWlBNjVMblkzNjdlODZ4QStWNWlqK2VOdEht?=
 =?utf-8?B?cldYUWRiVkhkNWZsclRwU1kzS1hNa0oyRG5kRVFOWGphWDZuZWE3K2NyZEgv?=
 =?utf-8?B?ellRZnRoRlVwa3hsUlZublh4UUx4Ny83SnJvVUZXRXF2Wm1NUWswaFdBS1hs?=
 =?utf-8?B?eUlmalh6dFlpdm5YM0pkdEZLMzY5alFnSzNCUnllU2lMdkVWSkJXM0JQZStL?=
 =?utf-8?B?S25pa0gwL0tqKzQzVVZsbW9RMnNNQkhWS2FvNldmemtUM0ZlWU5SQU5kem9D?=
 =?utf-8?B?TDNGaWZDaGZ6L2FQV2xDeURqSnhoVVZFTUhYQXNSaGxGMmdIRkJxTHBtd20x?=
 =?utf-8?B?cHJUbGtySW1jZlhBZUZ0RVc2V1I1d2dVdGVXUy93Z0N5ZkZkMjhLUzZFZ2RS?=
 =?utf-8?B?NzByWEJSRnRzbGU0cE1KeG9aTytWSDUwRlk0a1FDVnFHbEZ1VVNHUVlRUG8v?=
 =?utf-8?B?MmZRbHJoMjIxbjkvSVlTUUg4dkpYV3FDMExyNXJVL243a1dTN2w0TXd4Rk9z?=
 =?utf-8?B?ZTVITDNZWGtMWHZ3ekU0WUUxSFNCZXZwK3JZWjhHRHZGbG8zK0ZDTzVwd2sx?=
 =?utf-8?Q?LQthYD9o8M3aFYaI=3D?=
X-Exchange-RoutingPolicyChecked: 
	ileUspS78Yxtg1DzSHpr5mcUEpYhDOUMTbDMegCcLT1tFJGjC3OkuT0wDYxf8wj6Ov3uM3lB5ujPJFkpnUSuWfKmO/FT/2S/GCDVTuiShqlA0ctioUG51JHgG5Y63lDHiGsSaJn+lJTTBl4Jd8d4ijyioqslNZ5DYoy5FvqtnqEdFsa3cmmIXFKcsgNfsKUxnBuB02nLJmhdZHZs0ku8SixsAuj69hWyrC27jN60NJVGQ336lazIAPCX6zZCQqwdAQYMkRW8cWmfw3S5tvlCjDHGPwONu29ACLYLSfGo4xS+y12YeUgOCCJPKQQZ0LJ2VWlvgD6n1tRU2+HMXHpY0A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d234238-d184-4035-cbc8-08deaf39fbbb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 08:47:50.7342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZX9dRtigycgzWXfPeReA9YqGrQyY/NtFwZlUuyNEsphZT98F6dkpuTyYeNan7wlALS+wyr+QtNyfLICqvQOKSuCJews8Co1RDxQPA9hwhXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7105
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA5NiBTYWx0ZWRfXxy1Uov/YINtU
 DujHfEgr3QUXS0fCXxZ+posMEFpT7aovqwFYkaW0ZgBAYKU1rKPnT0HI2dPY3bscHnEHOLaijVA
 OPxA8mOJ95xBM7FLsGriKY4uB2K3aG9ZLuj46B2IWUl1I4+L09b0SHiEyzdFq6Eq3hpVxubpzwG
 5OxBna59lxGIostrL/OZOi+eOF2nW43kKW+5ZSH9tm+OIAA928Wm6e1DLdwHiFUZcCnkVhqDgfI
 kmo2oRDmEQZ9722EH/+Ov1wUFIwmtAcQBEJeWv491R0OzVBIuAavcY4Pk+RMG48v+RjodYrKFoz
 EKnCXQ663aFcBTr/6a8uHU9fxLpu0aW+lMt4eVYkqAbWBYuha9I+FvuBfBlaNu/dneeuRFFKLBP
 BrPlIBPokrlMgT9PwmXNxT6yOknpanYBgDBnjs701mm18sAzrKKXo9IjawdSrTzM5QHF9HFf2Oj
 6zNQqVlVP4t68C2Vz3A==
X-Authority-Analysis: v=2.4 cv=d6nFDxjE c=1 sm=1 tr=0 ts=6a0197b9 cx=c_pps
 a=7ih4RDJ3RAUgM2BElznDog==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=iGHA9ds3AAAA:8 a=oMtIHeyGAAAA:20 a=X-pmbOGEAAAA:20 a=Q4-j1AaZAAAA:8
 a=ysnGxlkrgPQBb-tCCagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: JzNIY6sesoP3GHhvaftoAQPRan02j3rH
X-Proofpoint-ORIG-GUID: empegHlME_IxOT1_hB2L015B4TG3gzmz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110096
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64B5WD8N3066318
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 08:48:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236785


On 5/11/26 16:09, Paul Barker wrote:
> On Sun, 2026-05-10 at 16:37 +0100, Paul Barker wrote:
>> On Sat, 2026-05-09 at 09:41 +0800, Changqing Li wrote:
>>> On 5/8/26 22:58, Paul Barker via lists.openembedded.org wrote:
>>>> CAUTION: This email comes from a non Wind River email account!
>>>> Do not click links or open attachments unless you recognize the send=
er and know the content is safe.
>>>>
>>>> On Fri, 2026-05-08 at 13:19 +0000, Changqing Li via
>>>> lists.openembedded.org wrote:
>>>>> Hi,
>>>>>
>>>>> I am trying to build project on ubuntu 26.04.  "bitbake postfix"  f=
ailed  at do_package since pseudo abort,   after doing  some search, it i=
s caused by ubtunu26.04's new change,  Ubuntu has officially begun transi=
tioning its core system utilities from the traditional GNU Coreutils (wri=
tten in C) to uutils (a Rust-based rewrite).   I would like to seek some =
help,  could you give some advices about how we should handle this?  Than=
ks.
>>>>>
>>>>> Here is how  it happened:
>>>>> * =E2=80=8E  In do_install stage:
>>>>> There are  2 files target to installed under ${D}: (there are other=
 files following this pattern)
>>>>> ${D}/usr/libexec/postfix/smtp:     which is  mv from file under {S}=
, and then chmod
>>>>> ${D}/usr/libexec/postfix/lmtp:      hardlink to ${D}/usr/libexec/po=
stfix/smtp
>>>>>
>>>>> With the old gnu coreutils:
>>>>> when install smtp,   mv will call renameat2, which will finally cal=
ling real syscall since the oldpath is under {S} which is not in PSEUDO_I=
NCLUDE_PATHS.
>>>>> then chmod call fchmodat,   then fchmodat wrapper will save an entr=
y with uid 0 in files.db.   install lmtp will also insert an entry with u=
id 0 in files.db
>>>>>
>>>>> With the new rust coreutils:
>>>>> when install smtp,    the behavior of chmod is different,   statx g=
et current mode,  rust chmod check the current mode  is the same as the t=
arget mode, then
>>>>> fchmodat is never called, then smtp is not saved in files.db,  and =
this will also make install lmtp insert an entry with real uid like 25610=
  in files.db since smtp is not found in files.db
>>>>>
>>>>> * =E2=80=8E  in do_package stage:
>>>>>
>>>>> Exception: subprocess.CalledProcessError: Command 'tar --exclude=3D=
./sysroot-only -cf - -C /yocto/build/tmp/work/x86-64-v3-oe-linux/postfix/=
3.10.8/image -p -S . | tar -xf - -C /yocto/build/tmp/work/x86-64-v3-oe-li=
nux/postfix/3.10.8/package' returned non-zero exit status 2.
>>>>>
>>>>> Subprocess output:
>>>>> abort()ing pseudo client by server request. See https://wiki.yoctop=
roject.org/wiki/Pseudo_Abort for more details on this.
>>>>> Check logfile: /buildarea1/cli10/yocto/build/tmp/work/x86-64-v3-oe-=
linux/postfix/3.10.8/pseudo//pseudo.log
>>>>>
>>>>> tar command may  call stat  for ${D}/usr/libexec/postfix/smtp,   si=
nce the  we have a same inode entry in files.db for lmtp, above error rep=
orted.
>>>>>
>>>>>
>>>>> The key  issue is ${D}/usr/libexec/postfix/smtp is not inserted in =
files.db in do_install stage,  which will cause wrong uid for lmtp and  p=
sedo abort in do_package stage.
>>>>> I think we cannot change behavior of rust coreutils.   I am wonderi=
ng even we patch postfix to not use hardlink, the pseudo abort issue may =
disappear,  but since
>>>>> chmod not call fchmodat,   we don't insert entries for these files,=
   maybe the uid etc is wrong in final image.
>>>>>
>>>>> [1] https://github.com/uutils/coreutils/blob/main/src/uu/chmod/src/=
chmod.rs
>>>>> [2] https://github.com/coreutils/coreutils/blob/master/src/chmod.c
>>>>> [3] https://lists.openembedded.org/g/openembedded-devel/topic/11921=
1397    // patch for build postfix with linux kernel 7.x
>>>> Hi Changqing,
>>>>
>>>> The tar command failing with exit status 2 should be resolved by rec=
ent
>>>> changes in pseudo. Which Yocto Project version are you using?
>>> I use the latest master branch with pseudo 1.9.6.=C2=A0And this issue=
 only
>>> can reproduce with ubuntu26.04 with uutils installed.
>>>
>>> ubuntu24.04 with gnu-coreutils=C2=A0 works well.
>> Hi Changqing,
>>
>> I looked into this as the chmod behaviour differences you described
>> didn't sound like an issue to me.
>>
>> I think the actual issue is that files moved (instead of copied) into
>> ${D} are not tracked by pseudo. For postfix, when using GNU coreutils
>> this issue is hidden because chmod always sets the permissions of the
>> file, which pseudo observes. When using uutils on Ubuntu 26.04, chmod
>> may not set the permissions if they are already correct, so pseudo
>> doesn't observe anything it can add to its database.
>>
>> A simple recipe can reproduce this issue on Debian 13 (where uutils is
>> not used) as well as Ubuntu 26.04:
>>
>>      LICENSE =3D "MIT"
>>      LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3=
da9cfbcb788c80a0384361b4de20420"
>>
>>      do_compile() {
>>          echo hello > ${B}/hello.txt
>>      }
>>
>>      do_install() {
>>          mv ${B}/hello.txt ${D}/hello.txt
>>          ln ${D}/hello.txt ${D}/hello2.txt
>>      }
>>
>>      FILES:${PN} +=3D "/hello2.txt /hello.txt"
>>
>> Building this recipe fails with the same pseudo abort which you are
>> seeing. If we use "cp" instead of "mv" in do_install then this works a=
s
>> expected.
>>
>> I'll discuss this with Mark and see how we want to handle it.
> The recipe above also causes a pseudo abort on the initial Scarthgap
> release (tag yocto-5.0) so this isn't a new issue, recent changes in
> pseudo are not responsible.

Hi, Paul

Thanks for help.=C2=A0 You are right.=C2=A0 And I tried to patch pseudo l=
ocally to=20
make renameat2/renameat only ignore

when both oldpath and newpath are not in PSEUDO_INCLUDE_PATHS, and do a=20
simple test,=C2=A0 at least

bitbake postfix works well without pseudo abort.=C2=A0 =C2=A0After tidy u=
p the=20
patch,=C2=A0 I=C2=A0 can send the patch to upstream pseudo

for review.

Regards

Changqing

>
> Best regards,
>

