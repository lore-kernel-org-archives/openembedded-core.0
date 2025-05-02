Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED76AC369DC
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 03:15:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11323.1746155716775516407
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 20:15:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7217d83023=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5422v3jv000646
	for <openembedded-core@lists.openembedded.org>; Fri, 2 May 2025 03:15:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46b6uj2v9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 03:15:15 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5423FE1p027521;
	Fri, 2 May 2025 03:15:14 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46b6uj2v9h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 03:15:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xyEl8mWCLcBdTpiC7AeAIL5EtVGWMW9pNECb9Xbe/0Ca6hLpjfRcCUPiHbkAF+XAm90Jv3nLokhwlJpQk3jHWwh9JISlSR5U0ztbR7zKRFoCbO4j2mYQZWyiRuLNVvs2go/tOa4y5MR5zqyuRv9SoVb6cd/qckI+yaiMcvw48cXZD/m2uz05ZZUBbWsE1GVJFns7O1OTQqJGfk2MMujfwXedDMj/fZjql1aiswVBWHfDOAl9WFXBzVhubqUVHnNi/tmSdN7oy7IbzylMDUiYMYWtCgPgRFRqB/grp3s4z6CKNn+f9vNhkuhCyCVepxRWfEeCats825cxfIOzeqHXhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jxQF3PqR6Br55S5vlA4yVyEz22o6CAJBeHN5fFWyShg=;
 b=tkLDSyiT7uDbIR+SUAR/ypf7xHgtSAduMBjQx341cll3Sq0oWhWyG47fBVn5WwU1UtTPbMCekjpBoVt/J88n8k4K/F9Ni/8wbt8NGAQyqLorQHJWRCOHoxhbdWyGDIqYv0ETLu/l23XDNYcwy+nRHBTJA5H5WxFXYKELsQKfO22g9cQfAhSO4dfHXlL95JNbWLA67LZm+UZyV33FaP8FKdoOvi3of2KvpXgVH64TkVwaCh+81FPZuTjOLRcMulha4jWIq/iId3g2JHggJp87S8wBwyGyjH4VOIW3E8cHkNU43T/EetuW16SWAx/G8CUjqeYemIo6/CiHPLemxqlA+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DS0PR11MB6493.namprd11.prod.outlook.com (2603:10b6:8:c3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Fri, 2 May
 2025 03:15:10 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%4]) with mapi id 15.20.8699.019; Fri, 2 May 2025
 03:15:10 +0000
Message-ID: <c887b509-4283-4488-8e82-8ba35ca99678@windriver.com>
Date: Fri, 2 May 2025 08:45:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH] glibc: stable 2.39 branch updates
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
        Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20250501030313.638148-1-Deepesh.Varatharajan@windriver.com>
 <CAMKF1soiQ=bmtZwHLLZ4OAEHA=8r04mQ0ATyFmcCaZmy27tXVQ@mail.gmail.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <CAMKF1soiQ=bmtZwHLLZ4OAEHA=8r04mQ0ATyFmcCaZmy27tXVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BY3PR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::13) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DS0PR11MB6493:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e6108ac-077a-4e85-47d9-08dd89278bf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|4022899009|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eHE4VGM5ZVQrSFpnUVVFYzN3QWNNQmg4VEhuNU04cWlhOTQ5UE96MzMzNG1r?=
 =?utf-8?B?Mlk3c0xvYklLUmZ0RldzNWVGdGhPcXBWMDdZb2dMRnFTd3ByOU5wN0hib1Iy?=
 =?utf-8?B?cHNLTWxlK0tnRHlpS1p5Z2NQcU03WldJbHpsWm5jV1FQdktWbllpd3VLVEI2?=
 =?utf-8?B?R0Z6YjRPdGcraFdUZkYvL2JwbGxRcEhDRVIzaHF4SC9mdjhYQTdtbkc1Z240?=
 =?utf-8?B?cjZtRHRsTUUwV1JRQTBCWjYwSThYOHBXNzA0blRFczBXa0lLcFE0WEpOdW5o?=
 =?utf-8?B?TGlIbkp4dU1YMkNDNXRIenVCMVAzSGhKbjlRRTBjSUI5SERwR0lMVFJMNHlX?=
 =?utf-8?B?dWVSRkpBYkE2Mlh4OGovME5kdlBUYkt5S1FhZjA1ZUlJaU00TjQrcWVSazhG?=
 =?utf-8?B?OUpnaS9rSmpsQmhDYmhRbUhVZjBaNEpkK0RtV1ZVMElpSTdXNFVaWFlVSkJi?=
 =?utf-8?B?cndHdDJST2VEWWRQOUx1a3cxeHArS2ljMHBuUVZuOWVaWTJUZ0xDRldWdE9S?=
 =?utf-8?B?bmdDSjI5bWlHVmdIbGY0eGd6YzBIZ0x5cHNQWnRzV29GTjNvTTNoR3dvUUpN?=
 =?utf-8?B?K0hRcFg0UGk0Rm5wdG93cytia095WXNCQ3dabjdjYmRld2RDaDBxTXZyei95?=
 =?utf-8?B?TTRncWg5N1BVaTczd1FGNUJqcU1lczdTWXZTVUFSTG1CRDFVL1Vnb0NMaVV2?=
 =?utf-8?B?QjJLbXE0a05EdVhJVkZUckJpenpyTE00Z1RkeHVCZzdqcUFma2NIdnF6Qjdi?=
 =?utf-8?B?UCtaRnJOOFpIbm40WlpUZ3JlQXhJNXlhMHhKYjhkSlM4YWFPS2llbDBWTTVo?=
 =?utf-8?B?bjhNRmNGSFJtcUptcnZkRVA1cnZlOFN1Q2w4QWRlMU9nMHZaK0VXMGo0cTl0?=
 =?utf-8?B?LytiSDd4Y2ZWNlYzN3hpc0hHa0gxRW9iMVhlelg5N3FWRkp1bWplc09sb2tn?=
 =?utf-8?B?TW1RaUk0VjhLTXlYcFdCNHN2MG52UkZFQjJ5RkhpZ2w1MitnMjNDOGJ0bkpO?=
 =?utf-8?B?NTc0U1d3VGpzOUZiTmUyM0ZBVWptdDhtaDgzVlVpbDM0UGdON3BUMVJKRGw5?=
 =?utf-8?B?OEVwajkveDkvMFA3cS9WWHh4Q3dtU0RJUE41UVdtVjBpemh4NFNKVCtUQTZ0?=
 =?utf-8?B?cHZuL2NURmgvUTNVeW5GTXBLMzU2YTdlanRscHAvcExxbGVQMWVoUEpwSFN3?=
 =?utf-8?B?NUV6M01WNWdnaFB6NjBmS0VsaCt4ajQ3cERxNVo1bVBMSnRJZWpBbGxsS3RW?=
 =?utf-8?B?bzBQMVhMVGY0Wk1WU2ZJVWVyT2ticXZZK2hnL1N4VU5QQzYxeGpSR0VJK0c3?=
 =?utf-8?B?d0ljdjhDRGhBL1Y3VUNtWllaWXhjZnJGL2kyc3FHZmc2TGt2SWhBdFJMLzhU?=
 =?utf-8?B?cUhCeDRnNHRoQk1xL2Vaa1lETjN3b0xnczFHMGdoM0lVRndRVnpDY0pwVnRs?=
 =?utf-8?B?bjNXbEQrdWYvSFJ5VUE1Y2lDL1BURjZCbUZWQVA5MlgvRnR0LzNwTzZ0T1Zh?=
 =?utf-8?B?azlqc1ZIKzZ5ckQzV05lNnRvNjI0WmgzaUYxbnVoV0xkK0VTZm9La3VYYXBl?=
 =?utf-8?B?aEJpZkxLbXR6akQ1MFpSWXo1WnplZGo3ci85RjBJdHliWXluZ2twYWtIek5N?=
 =?utf-8?B?OXUzYklWaFBvOGhZL040bktIQmJsK2F4WlRHeGl4UzcvTVVTVGJmZkorVzFw?=
 =?utf-8?B?T09ad3pDTGZjYm1LV2JuME1kN0R1a1JoNWdQQ1VYa3VzUGhJNC9oOTVZak51?=
 =?utf-8?B?WGlmbHJpMTR0cTlnZ0krZEh2NkdHSzZXY0l5dmpiZU1iaWFybUhEbVlKdHpT?=
 =?utf-8?B?b2lHcGgrRkFUN2Z6NjJsM2dwNVdKZDJMNlhDaDlrQkN5aDVqd3Z2WmhzZWVv?=
 =?utf-8?Q?Uzn/212UQSix2?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MXZkdGUzY2JYK2FnYkRjNm42NDJpeTVuMG9ubnNpYWd5WURlSnBCaldlYjlI?=
 =?utf-8?B?bWN1T2daQjFMOVBweXBQVG5yOU5MeUFET0pwMXU0OTRPSzFUYmN3QjZ3NnAx?=
 =?utf-8?B?Rmxrd0M0eitvZnJzaGhGeFpXSWlwTGNBdnlraUYxVVQ1L0hjV3dmSmZ4K0pL?=
 =?utf-8?B?M3NOSm1DMGZIWXBVaVR0NEsrZjBNMVZlSjQ0OTUzOE9uTVVsSnIyaHA1dElp?=
 =?utf-8?B?ZTRnOG5yYlA1SGpvd1pOdTB5cFB2UC81OWlOaEttR2QyMkU0U2RnK0ZjQmZw?=
 =?utf-8?B?eUhkaGUxZnBBcFJQWDZOSWcvOW15MzFTOWh5NGNpdkpqWkt6QTRPVW83TkJ0?=
 =?utf-8?B?dGdENjVWUkhVVmsvSmtOV2o3SFdmaFFQVUpLVTlQOG56WmkrUlZ3bkhoWnlP?=
 =?utf-8?B?S0VjbTg1NDRLMmJab3FYUHhLZDB5VlhNTUwreWJmVVh0cUt4STV1aXk1bFFD?=
 =?utf-8?B?ZFNnWkxTSkkvNUpqWFppZ0g2a0RBZzN4WDhkNkp2c0o1MkxvSjBVOUNzM1Qz?=
 =?utf-8?B?YWtjWjdTR1ltM1BNN1Y4Q2hzMlRpVjViWm5aeXJCQmcvY1hkMGp4RE5jK2ov?=
 =?utf-8?B?SDQ5Tk5YNFEyckM5eFViblYxVDVuQVdoNWFPVGlVZlVyb0J4TWJDeEo3YWRS?=
 =?utf-8?B?SlBzMlgyN1RudXVtTGRtcjhpTEorMktBc2QzTEJwOEEvWldMYnFvN1Q0Skhl?=
 =?utf-8?B?SzBIUlUzRFRsQVNOUVBFTDhaYS9lTEV4aEFaNitHREZZN2dOL0ZuRHo4NnlO?=
 =?utf-8?B?bTVrRXVZZ3djblJmTEJSbnlpaUFnSVpzaFM2bDc3RFQ3djBUdHlySEcvdmg4?=
 =?utf-8?B?SGorbTRDcGt0algwL1pTTmNxNUQwZFNDT08vcCtrbkNJUlUrMjFmaEM1RjRJ?=
 =?utf-8?B?d2FBenljL05QZVBHQmR4TmdNY2x6bklPN3d0LzhwWE9XSkl5TTNMc2NzWnVI?=
 =?utf-8?B?ZEFweXRoOTB4cjBQTEl1bythbXNKR1EzRHJGcU1xMERTZTN0ajlEOGNDY3JY?=
 =?utf-8?B?c1N4a2RzOS9mRFVFNkZtRmNPbjlmc0xBS0x4bU13SnVGMHFJclNTOTEySExi?=
 =?utf-8?B?cm1INWw1OVpHUWhISXNMZEhZNTcwSWlaZ1Z3K0RVcjZGZ0w0MVJxbzR1YW4z?=
 =?utf-8?B?c3hjOXl0aDlPN0s5cFBuWEl5VFBRZHo3a0ozUUk5RG5sa0s2NytLZEx4WGtB?=
 =?utf-8?B?dGZXWkRrT09GTkhIeWlIZUQwTWhINnZwZHJrYXIrU2J6RnBMcnRLQTBVQmEw?=
 =?utf-8?B?V1NXS3BrWGx2bFFVL3NTVzF0amU1QXRtTjZ5dHpISEQyc0ExbjUwWm56ZEhr?=
 =?utf-8?B?Tm5WczRuVTFiSnNUWVpEZncxRVpHdXhQWFRsYitBOUxhRXNyb2FoY2lUdG1J?=
 =?utf-8?B?UGo5U3JZVVNZYk1uYWVvT0Q5TEdYZjFoLzdTbERDZWpNMjBSMHM1NVp5Z0FT?=
 =?utf-8?B?ZVdGWWJSbGt6UDhEMzNFRnhybTRRQ0xkeVByc2NMcnBQN245elZJaHBWQ21u?=
 =?utf-8?B?ZlBYR1BvOGlUZ2RPZE1QRmVwU0tkNm4xVXVwS29sZU15Wm8xbjB6ODlpZWJr?=
 =?utf-8?B?a29Idk1HNDltWWFyMllWMkc3b1VYdXh6ZDVSbVdDUGlSWWZqRVJLSUlXTkJS?=
 =?utf-8?B?QXd1cVhaMVgva2NXbk9PbC9YejQ4NWJJUUdrOStqQUpoYVNWVzl0YW5DTHlM?=
 =?utf-8?B?SS9Nbi9UZXdIUFJheDgvb3VqdUlyb0ZzMkd1NDBYMkRlOXcyaFMwbVVzams4?=
 =?utf-8?B?TU1WVWlIRHVRdkV6enR4ODVQdkE4cHlHclB0UVdoRHdDZkNIbHRST0g0eFBY?=
 =?utf-8?B?SmF0dWlqRG5qT3hhMUE3NDN3Qlg2S3lVcVpMTXVqOVZtcnNXUjlNbWY2N3lG?=
 =?utf-8?B?K0xsMUVReDR5aklQTDRFRHFhdnd1Yk1UdENrZVNBeis5YXVsL0JqTFBsYmtC?=
 =?utf-8?B?STJkV3BqeEdLNXhSakl2a1lxbXB1UWl0V2ZWSDNzV1lnK0N2ZTdGalBUY2V1?=
 =?utf-8?B?ZkpTQmRwMzRBZXFFM0lZTms0YmtpMHllUW0rUWZDWTNVcENTWkxwWlBTZUJU?=
 =?utf-8?B?OE5wT3lvZ2RCcXpXU1FCdjByekQvWU9NaFJ2Q1JOSUJnV0xKenF6eVpwWTla?=
 =?utf-8?B?dnlacmFOZU1kNWxtdytQVGR0bENpUm1HMEcrYzFmcHhlUjhIN1hBV2plWlB3?=
 =?utf-8?Q?YDE8iNBnjUs2L8IZIIy880I=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e6108ac-077a-4e85-47d9-08dd89278bf1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 03:15:10.3379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wubRWVxqcuvlHrt3bn9ghAFv0BH+ldxjut7vl3umUj2dJ7mYVLFjQCpwRtDcHiDXGdE2dt1sYd624Rv1/p0CmR9gdAV/78AymdqUmiHMEVrde3DlYESywBa5VYDXD1Sf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6493
X-Authority-Analysis: v=2.4 cv=DZUXqutW c=1 sm=1 tr=0 ts=681438c3 cx=c_pps a=2bhcDDF4uZIgm5IDeBgkqw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=pGLkceISAAAA:8 a=DTY0uIvfRYZf1W7FoyUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-ORIG-GUID: 6wn5mZYoW3ngnBXINFSOBt7ydd0yHW6F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDAyMSBTYWx0ZWRfX+DQayhXJumzB kHsq8t9x68ZOHU9Kb6Q6dWyZuGp4l+bECJ200UFXZuo2MDMu5J46ozCvgLKESK2ikD4eG4nQ2/P ITfQsXyU/6UQnPQCOgHSLclCqOmv9Z6ufvdd/GkG03xlHYTUDY2QTy81hFQgx2C2RHUku82Zcxz
 gw9ul/vVKBH3Dt4/erimAZ0iPZrLq8NVFy4Cgo8c6/753AsZA1ukrH1YAlgPoBkPMF+X6RXHjVe uxt7lyBAQgmsXbrQu54/ZR0W+GYKRA4huGux6r41mWBuFsgWgbwyZ8UucuBdYOjuspJWKSKDrdP C37jKePvnUO2/Smw+9eaaA6KJXpDoTzS12RBQXjG+HzDQGspo67Jd/CbycLhbSOmF81xTEz8/MW
 LOgcVs9bxXAKjF/0PEkfIXne8d2TIyrZwc1pijaB2xikQAwA7NtPgFiyH3nlJ9GbXOEO8Ply
X-Proofpoint-GUID: BqjBqT8EWdDtwjRQ5yOxMtbHAl_sRb8a
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505020021
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5422v3jv000646
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 03:15:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215904


On 01-05-2025 11:24, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Wed, Apr 30, 2025 at 8:03=E2=80=AFPM Varatharajan, Deepesh via
> lists.openembedded.org
> <deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>
>> 3463100f2d x86: Detect Intel Diamond Rapids
>> e09436c2cb x86: Handle unknown Intel processor with default tuning
>> 7620d98186 x86: Add ARL/PTL/CWF model detection support
>> 765ff3d0d4 x86: Optimize xstate size calculation
>> 65ae73be01 x86: Use `Avoid_Non_Temporal_Memset` to control non-tempora=
l path
>> 2be36448c4 x86: Tunables may incorrectly set Prefer_PMINUB_for_stringo=
p (bug 32047)
>> bde201e92c x86: Disable non-temporal memset on Skylake Server
>> 38a7632f2d x86: Fix value for `x86_memset_non_temporal_threshold` when=
 it is undesirable
>> cc59fa5dbc x86: Enable non-temporal memset tunable for AMD
>> 0da58e8be0 x86: Add seperate non-temporal tunable for memset
>> 837a36c371 x86: Link tst-gnu2-tls2-x86-noxsave{,c,xsavec} with libpthr=
ead
>> 87ab0c7f7f x86: Use separate variable for TLSDESC XSAVE/XSAVEC state s=
ize (bug 32810)
>> 60cd7123a6 x86: Skip XSAVE state size reset if ISA level requires XSAV=
E
>> 4cf3f9df54 x86_64: Add atanh with FMA
>> 01ed435e2e x86_64: Add sinh with FMA
>> 0edcc77fe7 x86_64: Add tanh with FMA
>> 7ecf0d3bde x86-64: Exclude FMA4 IFUNC functions for -mapxf
>> e1fe22368e nptl: clear the whole rseq area before registration
>> dd8c0c3bbd math: Improve layout of exp/exp10 data
>> a1b09e59e2 AArch64: Use prefer_sve_ifuncs for SVE memset
>> d0e2133470 AArch64: Add SVE memset
>> 0cc12d9c47 math: Improve layout of expf data
>> 0cd10047bf AArch64: Remove zva_128 from memset
>> dd1e63ab58 AArch64: Optimize memset
>> 65a96a6f2b AArch64: Improve generic strlen
>> 4073e4ee2c AArch64: Improve codegen for SVE logs
>> 78abd3ef6e AArch64: Improve codegen in SVE tans
>> a10183b633 AArch64: Improve codegen of AdvSIMD atan(2)(f)
>> dcd1229e5b AArch64: Improve codegen of AdvSIMD logf function family
>> 72156cb90b AArch64: Improve codegen in AdvSIMD logs
>> 5e354bf4e2 AArch64: Simplify rounding-multiply pattern in several AdvS=
IMD routines
>> 80df456112 aarch64: Avoid redundant MOVs in AdvSIMD F32 logs
>> d591876303 aarch64: Fix AdvSIMD libmvec routines for big-endian
>> f6d48470ae assert: Add test for CVE-2025-0395
>>
>> Testresults:
>> After update    |Before update   |Difference
>> PASS: 5068      |PASS: 5072      |PASS: +4
> +4 should mean more passes after update but the table shows otherwise.
> Can you list the 4 tests which are passing now ?
Hi Khem,

Apologies for the confusion, there was a typo. I mistakenly listed the=20
'after update'
passing test cases under 'before update' and vice versa. The following fo=
ur
additional test cases passed after the update:

PASS: assert/tst-assert-sa-2025-0001
PASS: elf/tst-gnu2-tls2-x86-noxsave
PASS: elf/tst-gnu2-tls2-x86-noxsavec
PASS: elf/tst-gnu2-tls2-x86-noxsavexsavec

Regards,
Deepesh
>> FAIL: 120       |FAIL: 120       |FAIL: 0
>> XPASS: 4        |XPASS: 4        |XPASS: 0
>> XFAIL: 16       |XFAIL: 16       |XFAIL: 0
>> UNSUPPORTED: 157|UNSUPPORTED: 157|UNSUPPORTED: 0
>>
>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.co=
m>
>> ---
>>   meta/recipes-core/glibc/glibc-version.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-=
core/glibc/glibc-version.inc
>> index da9227ccca..040fc793b1 100644
>> --- a/meta/recipes-core/glibc/glibc-version.inc
>> +++ b/meta/recipes-core/glibc/glibc-version.inc
>> @@ -1,6 +1,6 @@
>>   SRCBRANCH ?=3D "release/2.39/master"
>>   PV =3D "2.39+git"
>> -SRCREV_glibc ?=3D "662516aca8b6bf6aa6555f471055d5eb512b1ddc"
>> +SRCREV_glibc ?=3D "3463100f2d47f2897a24ba8023a5c7aaf2d26550"
>>   SRCREV_localedef ?=3D "fab74f31b3811df543e24b6de47efdf45b538abc"
>>
>>   GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dht=
tps"
>> --
>> 2.43.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#215761): https://lists.openembedded.org/g/openembe=
dded-core/message/215761
>> Mute This Topic: https://lists.openembedded.org/mt/112554022/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

