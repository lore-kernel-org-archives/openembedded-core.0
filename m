Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE47BC02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 14:08:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.17342.1736777291041756717
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 06:08:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3108bd75fe=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D6ftwh025589
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 14:08:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443dv11wqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 14:08:09 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50DE89HJ029377;
	Mon, 13 Jan 2025 14:08:09 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443dv11wqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 14:08:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MRFDz2wds953Eu+6apAXLhoziUQS2dbOuREQcm5LTM3C+o280agAFihvSuTc0DxPr+BAUSjGVyoQrQekVajp9yGn/ox14Q/PPgIjEXHvDw0uqll0kZBby104DbIfYhLjzZxSQyfMeLh+B98LHA1HrWbAl+0EdSaPYovSUXKaFpLCGOqOjruVTA/t/vbvGCXOiJ/rPILhTOwSVvp1znqKjz0VssPQ176eA3hiW+K68oKt0f2MRD2wN7Y+hEiIkM0Y54i+DJckKnDcqfUdw8jo8X5PRGm8ukgt+88Gd2P7G+w1RHxPV3vuUXyacCu/4/BUcnn1coBZ+necIOkmBJ9b4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M4vos70IS8mTBzrfVjhqwFXeCtTYaleIjroOWGFmZtI=;
 b=ASc01CQPT+TtERCnyT+toEXeWIqn0LtwP0f9DGGFrV+0wv2S7EplxVA7ZAGIHx2bqKDU+Fgg1Du6VVm+lvSsnoGdv0fuyYiaMuLZ+TXdyqR9+eL9dT3iXW/fuB9Y8+g03ExLVYypqGRhZTLsPX+9ePAtEEECxezOrvB3kbsU+FcPWMZ9WpNk2tl7Xl34VZdlO1wuA2S65gPYY+420ZYUC47f86AJsQNsN6CmQkEf3raxAX9PtdWayQJdK3zgoH0mS0XEXNXL8vRwGpOW0VSnJx1PVOtozoMC1UpUCu58KtJ+Z17MGuoyMjxS/nwjyuN+BxjVT1ReCWPGmV0bh2NJ2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by CH0PR11MB8087.namprd11.prod.outlook.com (2603:10b6:610:187::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 14:08:05 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 14:08:05 +0000
Content-Type: multipart/alternative;
 boundary="------------AHc70T0BB9XOhNWFW06u8S7R"
Message-ID: <d3fdbb9f-029e-4e6a-9ca6-0fb138e7f637@windriver.com>
Date: Mon, 13 Jan 2025 19:37:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V4 1/3] rust-target-config: Update data layout
 x86,ppc,riscv64,aarch64,loongaarch64 targets.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250113133936.2968211-1-Deepesh.Varatharajan@windriver.com>
 <CANNYZj_cEFw7-GZoSzAz27LQ0Rvh32xfVU9jQCGB4rdduNkGgQ@mail.gmail.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <CANNYZj_cEFw7-GZoSzAz27LQ0Rvh32xfVU9jQCGB4rdduNkGgQ@mail.gmail.com>
X-ClientProxiedBy: SJ0PR13CA0134.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::19) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|CH0PR11MB8087:EE_
X-MS-Office365-Filtering-Correlation-Id: cd85e8b5-94e8-4f0e-efbc-08dd33dbb33d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|4022899009|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZCtENjkrOHRiKzF4c29kQzVNNDJza3hISitSVzlGTGJHbTNkWnRZb2IweXpB?=
 =?utf-8?B?T0czc014SFovbkovR2VyWTYwVG16NEp1RTQrKzArSCtCbzBwWkVQUVJscTNB?=
 =?utf-8?B?K0hhZlpJRnlPd0pzRGUyRDRsNDJjdjkyZUduZkJMeGEzejMwUDVsd0FqVnRZ?=
 =?utf-8?B?QTRaT0JDbWY1cTJHc1hmM0pBVU5kSGNsaHgzZlBtQmQ4RjliK2VPZlJYNk92?=
 =?utf-8?B?T1R3TjFCYktrL0tXNkJHYWdvQllvNStWdDFqa29KMWoreHk0c0dRY3hyU3Yx?=
 =?utf-8?B?YU01WVlNc2svZk1JZEh5cGpyVVAzNTRvQWNFa1d2MEF3QmJtclVMemZpdWxZ?=
 =?utf-8?B?dG8wZFo1cUgzang3c3lzc1JPSDV6OURaZnBPa0Q5b2ZVREZDOXE5Z3crenFh?=
 =?utf-8?B?blMvUEZ0b2lRUS83bE1IVFh4UXh6Sy9wYUtBbVdFNDNGM1IzMkxwY2l5d0tW?=
 =?utf-8?B?R25HNFdRUVZpWEd0eTNicW1PMHFGdWZ1anN4LzlYbXl1d2VPL2lqMC9QVHFU?=
 =?utf-8?B?MWZIU3gyOVBDVk1CY2VhbUtZYUhYS1RVUGtLY1orbXZBcURnU050UFZRa2l5?=
 =?utf-8?B?ckN0L1dETVhNZzVUcWxSRE96c2NIc1dXQ3ZUMExIakxoNkJtODhTKzVzODdI?=
 =?utf-8?B?cW5oZWxoZml4Tkk5cVZPL2NyV0Q0RUQ2NnJOcG92SlZDeWQ0S0FNZUU1c0hQ?=
 =?utf-8?B?ZVVTWDZtak41cXlHbmdOTHcrdUkyR2FwQjRIUjRTVjBKcmV1OHF2c1RFV3hm?=
 =?utf-8?B?cTN4a1pYZElGY2JPRjFJVHM4ZEh5MGExVis4bjhWL1l4OS9SY1pxRW1BMUha?=
 =?utf-8?B?bjUxb1JwVk5rcG5sYnVNZXJWbWZXUWhGbDlTT0hLQnVZTEg2MGJyMUFwZk9Q?=
 =?utf-8?B?UkRoQ1VXQkVMSkNDVHJIamtaVzVtU3RyVmJKYWV5Rlc1MytkTlJlNXpFUGFK?=
 =?utf-8?B?YVJITHpKZEVqMXRJRXd3R0JkTTZmaDVOZytUemhvNmVacUROZllXKzRtNDFy?=
 =?utf-8?B?N09wY2VzdndvQXhjWEpSQlE3cFBTTkh3alNJOG91TURJV0N6N2JqM3BILytp?=
 =?utf-8?B?MDVMSzdqTFo3dXVFTWxmbHFsd3VlcHVySDRSOGNjNk9KeGJTNVgrRHJFUE9u?=
 =?utf-8?B?c01KeW96VUtTaHNVM0p5dDBLc2drK2VNK3BmUGJ2SnFKZDdCKzFHL1VUSWsr?=
 =?utf-8?B?VXpGVDlhV3pNNUlkYktsQWl5M1NHaEplUFpxc3h3cExuNy9sWFhlcGozWWR2?=
 =?utf-8?B?MzVvdkNWdXpUcmxlU3ljaGhYWXJNQ2VFVG9rajBaVDFpWXdNT3FuRVJpU2Rp?=
 =?utf-8?B?dzZUZk5iM2RPbUl4NjBIQUEwdk95TGwvUjQ0S1RIUEhpYVlCaGdjN2M3YXlC?=
 =?utf-8?B?MFNNeWxjRHlVcGltK0dBR0RnUmkrVUw4VXdsdWxOUzRkdVdic1dxeW9RUUxh?=
 =?utf-8?B?aWxwREhWV3dmaWNlZVdDL3NjN25uYmZZUG04b2hZS0orTklPZG0wcVR4ZEJw?=
 =?utf-8?B?SjRhMWxvUU5VTDVmTDdxSjhpWVduZjdMRHdKT3lwL2ZTd2laYXdYSGVqcm4z?=
 =?utf-8?B?MkdFN0pQSlNXZmpjY0VrWDlBazF5c2VxMG8rTERmUWlRN0RkWUgremJZZ21H?=
 =?utf-8?B?clI4SHZVYXQ5NEdaenJJNVlyMjlLNkY2TDBaMUhheFJsZVMyY2JwSjMxaXJ1?=
 =?utf-8?B?UVlnc2pUSU4waldKVHJ5dkx3VUFHdW9hU1FjWnh4QVBsdkpNU0UzTlgzZEVl?=
 =?utf-8?B?aWwzZ1RPTkp3cTRtQmpmVE0xTGZ1TTZxaUNyaWRXcnJ5S3BpWm5JZHo0VmFa?=
 =?utf-8?B?bUxzN2wxOUI2N1crendLUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d0xRRlNoVzg1S3lXRHFNa21ZekorSGJsMXJMMThZeHRteDlkM1AvU1k5b0J0?=
 =?utf-8?B?L2ZYaTgra0NXcGh0dXhmQTZNbWppd3YxUlpjVDZJWlJnR1EzYjA3QTN6djY0?=
 =?utf-8?B?SFc1R3JodG9TWHFZaU9RYnlBakxQMENLQTlYYVk5RElSQ1FvWStsaER3dm5D?=
 =?utf-8?B?cWVWOVk0dDFHYlkwRWpzcjNzaVczUWMxckgvM00xRHJhY2hQcENkTjU5Q3hh?=
 =?utf-8?B?REFmUDRpRUhIbklpWHM4QjUyMDBoUzlTZ1dPYjZMSUs1Y3AxTkd5dUVwaTVZ?=
 =?utf-8?B?T1VzajhvVGVaMHhRaFVIc05zWmtLdURhT2wwdllrNjFGVHpVTXQzV25zOVVG?=
 =?utf-8?B?Z1dqcWM0Tm1wUmNzRG5rS2JQaTZZbjFLand2cHRjdTVmK0NMY284Q0tiTjVN?=
 =?utf-8?B?VkkwK3F3RC96c0V0RkhubmlXUThtOXBCMHZhemRhcm9hYWpoM1NaTkp4OXhW?=
 =?utf-8?B?NGtSMGdaQVFwS2lYSDUvbXVZcEJQWVE1ajM4ZHA0dWtVT3hoR0VsekJ2TDVj?=
 =?utf-8?B?TUdPT2dYOFp1ek9HUUxKRVYyakpGWEV3NjNBaWJ5Si9zQk1nb3JQSDhmbmFy?=
 =?utf-8?B?WGhxWUpUZnJWZjJRUW5lRXB2aitaNjZHWVVZUDNIdW51V1RKNi84NDBTd1dG?=
 =?utf-8?B?OEFZY0poNFlmMjdrWVU4K0JwU3h4VlV0TlN5T2pBcEkwVzRjbUFBeld0K0Ev?=
 =?utf-8?B?QVZ5Y0tXRy9xeGFSdGYwQm9xOUs2UlVnbkhqbXgwUnE1VFI1b2VtVWJQL1Ix?=
 =?utf-8?B?VnlIcVZkNEViSGNEY0FzK0ltMDYzVkhsdC9yUGEzOGJSei9idHRJNkF4OW4x?=
 =?utf-8?B?TkZ3aWFod3dzRW9iRFpDNFVJZXNmN3p0RXpvMWo5Rm93NzgyYU5QZVg5anky?=
 =?utf-8?B?QWk4bWhXbGR2ZnppanYzTzdESzlWUVQ5U1Mxdy9TRENFSmptRWg3UDY5NjZM?=
 =?utf-8?B?OEVqL2h1dE0yanNZUzFDZTVoMGF6MXRrYXJITXVQTENkUkxkTjJJV0RXWnVN?=
 =?utf-8?B?UzFLZ3kzdXY5aHVLL3pTK3NSK2RpUmVLeE9mUHNwS1JtRWFCUm9FeDkvWncv?=
 =?utf-8?B?WTgwK2xlbUt0RXlsaWtkUXVIS3Nxc2dINjE0RTMrMU9DSlJDR0hVQkZCOWVZ?=
 =?utf-8?B?eEpEcGZrSCt1TTV0dVRCUHBEZUMyU3VwbGUzKzJnc21wb2xpaElwUjJuTzRq?=
 =?utf-8?B?QXovOUtBb2l3ZUZoSzB4NmV5NnZwdzlxWmZKZmtDemQ4eG4rQTRlb2FwU1g2?=
 =?utf-8?B?NnpjWVhSclIrYWszNHBWNzNCSHRBeVZwUk5xMzB2Z1lKS0FzazV1TUovNlNK?=
 =?utf-8?B?eHJXdGhHV0JjdjFXVW1keHRxMmtiemNUVkdOa0VtZ2tZelV5by9ieE9hQlBS?=
 =?utf-8?B?MGdqaWxHMGNnbnZBWXBGekU5OUg1WmthaVhKNm1TbVJBK1RCbnI2ZkZrcUgz?=
 =?utf-8?B?aHpiTm13end1dW5VSXRQRXJzbzV0K1JIZTJONmQ4cXNhdWZZY09RQjEzemZY?=
 =?utf-8?B?MnphVzRyUXF6ZVpQa09QZXZGNFdqSDNXN29leWhqY29sanJMb2JGVDNDcGhy?=
 =?utf-8?B?aWZydDRRczUrcmZodE1KZDlSY0ZXVWJtVTRveVdkREEza1hQWjdLQTlzb2dk?=
 =?utf-8?B?dGdVL0Fua1gyN2hMd3VONUY2LzR4TTRNbFNYVWYzNU1vOHhIVTdHOWU3Lyt1?=
 =?utf-8?B?cVVNZnUvVVF2OHNLNTgzek1mdGt4T0VmSE43bE5ETjlpenBvWDNYUjAra243?=
 =?utf-8?B?ZlpWZzhGSmN6ZGtmenl0TDE2ZHp0b0Qya01WK2RnaTU2ZTJHRnY3bElLQkRl?=
 =?utf-8?B?TFhWTXJGblpIamRMVlNFdjFTRzhzMy9jVG9KcHByRFRBVElpT3YzY05pTnox?=
 =?utf-8?B?ZkVITWc0T0lHcDFLYkxWdW9ucllQOHhnYWhRbzhFTU4rTU56bEExdGhpY0pQ?=
 =?utf-8?B?RDdGd0RnY2YrNVJqMm1tT0dNWHlHQUVObHR4RzZVOXdFYlRxcWlIZXhBdlZo?=
 =?utf-8?B?aWcxRHVud1g1eEZEV0JhM3dJRURsM0Rzc3lJTnpQd05PNGVBekt4UTVGdkNM?=
 =?utf-8?B?NDA2MytDeVVGSGxUSTRxQnMwNlJnRUU2c2pRUFhWekpIblBYUTFIc1BBaVZJ?=
 =?utf-8?B?ZU1ON1VIWG1hY2twZ0ZvTElWYWltaE1KL2lMa1l6VG1wekR6ZEVsdURHYjg1?=
 =?utf-8?Q?+Au/pDAVKh31lULLdmServ8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd85e8b5-94e8-4f0e-efbc-08dd33dbb33d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 14:08:05.5748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AVdfuDrYCTacq1yCvVYcDBASGrggxxazDaVYmwZApuebnoGWSDj66hlx8TW47oSIUDz7lW0yIXsCcwuQBRy82eF3aIzlHFTbXnLJ0ezyfDK5yNqu+8DzUwdMHRQIOEGK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8087
X-Proofpoint-GUID: oCW-IYHmURgC6EiHmORSXuGSVudY1-wQ
X-Authority-Analysis: v=2.4 cv=N5zTF39B c=1 sm=1 tr=0 ts=67851e4a cx=c_pps a=hHPfuxNGWHHq0fQgDGst2w==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=rtMjMdbjQd5hfq3s8S4A:9 a=QEXdDO2ut3YA:10 a=scgZtQAgwulBoYZdEN4A:9 a=frVBILccLhC315t6:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: W4c_7ab3ZECGoWUT8u_HdefYFXHNEnUX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_05,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 suspectscore=0 bulkscore=0 mlxscore=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2501130119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 14:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209727

--------------AHc70T0BB9XOhNWFW06u8S7R
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 13-01-2025 19:21, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hello,
>
> when you send new patchset revisions, it helps to explain what changed
> between revisions, especially when no feedback was given to the
> previous revisions.
>
> You can do this with cover letters, or by including a changelog in
> commit messages under --- separator (so the changelog won't be
> included in actual repo commits when patches are taken from the
> mailing list by maintainers).
>
> Alex
>
Hello All,

Testing patch 
|/home/patchtest/share/mboxes/V3-1-3-rust-target-config-Update-the-data-layout-for-x86-ppc-riscv64-aarch64-and-loongaarch64-targets..patch|, 
the following test failed:

*FAIL:* Test for shortlog length: The commit message exceeded 90 
characters per line (currently 102 characters), 
(|test_mbox.TestMbox.test_shortlog_length|)

To address the above issue in the V3 patch from patchtest, I updated the 
commit message to ensure each line is less than 90 characters and have 
now submitted V4.

Regards,
Deepesh

>
>
> On Mon, 13 Jan 2025 at 14:40, Varatharajan, Deepesh via
> lists.openembedded.org
> <deepesh.varatharajan=windriver.com@lists.openembedded.org> wrote:
>> From: Deepesh Varatharajan<Deepesh.Varatharajan@windriver.com>
>>
>> -----------------------------------------------------------------------------------------
>> error: data-layout for target `x86-linux`, `e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128`,
>> differs from LLVM target's `i686-unknown-linux-gnu` default layout,
>> `e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i128:128-f64:32:64-f80:32-n8:16:32-S128`
>>
>> error: data-layout for target `powerpc-linux`, `E-m:e-p:32:32-i64:64-n32`,
>> differs from LLVM target's `powerpc-unknown-linux-gnu` default layout,
>> `E-m:e-p:32:32-Fn32-i64:64-n32`
>>
>> error: data-layout for target `x86_64-poky-linux-gnux32`,
>> `e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128`,
>> differs from LLVM target's `x86_64-poky-linux-gnux32` default layout,
>> `e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128`
>> ------------------------------------------------------------------------------------------
>>
>> Rust commits for updating the data layouts:
>>
>> x86:
>> https://github.com/rust-lang/rust/commit/dbff90c2a7c751cf9d6843cd585429beb100c17d
>> x86_64-x32:
>> https://github.com/rust-lang/rust/commit/ec55a05374d89d206be5140a4759af92f1b42f15
>> aarch64:
>> https://github.com/rust-lang/rust/commit/4d397d33da8aff64419a03694d152c8250916f19
>> ppc:
>> https://github.com/rust-lang/rust/commit/ad7ea8b7e690e6000006b6fde630a2c8c4385019
>> riscv64gc:
>> https://github.com/rust-lang/rust/commit/f414715ebfda201f91f80ef9f28d9923d614d1c4
>> loongaarch64:
>> https://github.com/rust-lang/rust/commit/4a06a5bc7ad259023e4373e794687adfce252dac
>>
>> Signed-off-by: Deepesh Varatharajan<Deepesh.Varatharajan@windriver.com>
>> ---
>>   meta/classes-recipe/rust-target-config.bbclass | 18 +++++++++---------
>>   1 file changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
>> index 399c13db26..67aaa56bac 100644
>> --- a/meta/classes-recipe/rust-target-config.bbclass
>> +++ b/meta/classes-recipe/rust-target-config.bbclass
>> @@ -146,7 +146,7 @@ MAX_ATOMIC_WIDTH[armv7-eabi] = "64"
>>   FEATURES[armv7-eabi] = "+v7,+vfp2,+thumb2"
>>
>>   ## aarch64-unknown-linux-{gnu, musl}
>> -DATA_LAYOUT[aarch64] = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
>> +DATA_LAYOUT[aarch64] = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128-Fn32"
>>   TARGET_ENDIAN[aarch64] = "little"
>>   TARGET_POINTER_WIDTH[aarch64] = "64"
>>   TARGET_C_INT_WIDTH[aarch64] = "32"
>> @@ -160,21 +160,21 @@ TARGET_C_INT_WIDTH[x86_64] = "32"
>>   MAX_ATOMIC_WIDTH[x86_64] = "64"
>>
>>   ## x86_64-unknown-linux-gnux32
>> -DATA_LAYOUT[x86_64-x32] = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
>> +DATA_LAYOUT[x86_64-x32] = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
>>   TARGET_ENDIAN[x86_64-x32] = "little"
>>   TARGET_POINTER_WIDTH[x86_64-x32] = "32"
>>   TARGET_C_INT_WIDTH[x86_64-x32] = "32"
>>   MAX_ATOMIC_WIDTH[x86_64-x32] = "64"
>>
>>   ## i686-unknown-linux-{gnu, musl}
>> -DATA_LAYOUT[i686] = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
>> +DATA_LAYOUT[i686] = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i128:128-f64:32:64-f80:32-n8:16:32-S128"
>>   TARGET_ENDIAN[i686] = "little"
>>   TARGET_POINTER_WIDTH[i686] = "32"
>>   TARGET_C_INT_WIDTH[i686] = "32"
>>   MAX_ATOMIC_WIDTH[i686] = "64"
>>
>>   ## XXX: a bit of a hack so qemux86 builds, clone of i686-unknown-linux-{gnu, musl} above
>> -DATA_LAYOUT[i586] = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
>> +DATA_LAYOUT[i586] = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i128:128-f64:32:64-f80:32-n8:16:32-S128"
>>   TARGET_ENDIAN[i586] = "little"
>>   TARGET_POINTER_WIDTH[i586] = "32"
>>   TARGET_C_INT_WIDTH[i586] = "32"
>> @@ -216,21 +216,21 @@ TARGET_C_INT_WIDTH[mips64el] = "32"
>>   MAX_ATOMIC_WIDTH[mips64el] = "64"
>>
>>   ## powerpc-unknown-linux-{gnu, musl}
>> -DATA_LAYOUT[powerpc] = "E-m:e-p:32:32-i64:64-n32"
>> +DATA_LAYOUT[powerpc] = "E-m:e-p:32:32-Fn32-i64:64-n32"
>>   TARGET_ENDIAN[powerpc] = "big"
>>   TARGET_POINTER_WIDTH[powerpc] = "32"
>>   TARGET_C_INT_WIDTH[powerpc] = "32"
>>   MAX_ATOMIC_WIDTH[powerpc] = "32"
>>
>>   ## powerpc64-unknown-linux-{gnu, musl}
>> -DATA_LAYOUT[powerpc64] = "E-m:e-i64:64-n32:64-S128-v256:256:256-v512:512:512"
>> +DATA_LAYOUT[powerpc64] = "E-m:e-Fi64-i64:64-n32:64-S128-v256:256:256-v512:512:512"
>>   TARGET_ENDIAN[powerpc64] = "big"
>>   TARGET_POINTER_WIDTH[powerpc64] = "64"
>>   TARGET_C_INT_WIDTH[powerpc64] = "32"
>>   MAX_ATOMIC_WIDTH[powerpc64] = "64"
>>
>>   ## powerpc64le-unknown-linux-{gnu, musl}
>> -DATA_LAYOUT[powerpc64le] = "e-m:e-i64:64-n32:64-v256:256:256-v512:512:512"
>> +DATA_LAYOUT[powerpc64le] = "e-m:e-Fn32-i64:64-n32:64-S128-v256:256:256-v512:512:512"
>>   TARGET_ENDIAN[powerpc64le] = "little"
>>   TARGET_POINTER_WIDTH[powerpc64le] = "64"
>>   TARGET_C_INT_WIDTH[powerpc64le] = "32"
>> @@ -244,14 +244,14 @@ TARGET_C_INT_WIDTH[riscv32gc] = "32"
>>   MAX_ATOMIC_WIDTH[riscv32gc] = "32"
>>
>>   ## riscv64gc-unknown-linux-{gnu, musl}
>> -DATA_LAYOUT[riscv64gc] = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
>> +DATA_LAYOUT[riscv64gc] = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
>>   TARGET_ENDIAN[riscv64gc] = "little"
>>   TARGET_POINTER_WIDTH[riscv64gc] = "64"
>>   TARGET_C_INT_WIDTH[riscv64gc] = "32"
>>   MAX_ATOMIC_WIDTH[riscv64gc] = "64"
>>
>>   ## loongarch64-unknown-linux-{gnu, musl}
>> -DATA_LAYOUT[loongarch64] = "e-m:e-i8:8:32-i16:16:32-i64:64-n32:64-S128"
>> +DATA_LAYOUT[loongarch64] = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
>>   TARGET_ENDIAN[loongarch64] = "little"
>>   TARGET_POINTER_WIDTH[loongarch64] = "64"
>>   TARGET_C_INT_WIDTH[loongarch64] = "32"
>> --
>> 2.43.0
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#209721):https://lists.openembedded.org/g/openembedded-core/message/209721
>> Mute This Topic:https://lists.openembedded.org/mt/110586460/1686489
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
--------------AHc70T0BB9XOhNWFW06u8S7R
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 13-01-2025 19:21, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj_cEFw7-GZoSzAz27LQ0Rvh32xfVU9jQCGB4rdduNkGgQ@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

Hello,

when you send new patchset revisions, it helps to explain what changed
between revisions, especially when no feedback was given to the
previous revisions.

You can do this with cover letters, or by including a changelog in
commit messages under --- separator (so the changelog won't be
included in actual repo commits when patches are taken from the
mailing list by maintainers).

Alex

</pre>
    </blockquote>
    <span style="color: rgb(222, 226, 230); font-family: system-ui, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(36, 37, 38); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"></span>Hello
    All,
    <p>Testing patch <code>/home/patchtest/share/mboxes/V3-1-3-rust-target-config-Update-the-data-layout-for-x86-ppc-riscv64-aarch64-and-loongaarch64-targets..patch</code>,
      the following test failed:</p>
    <p><strong>FAIL:</strong> Test for shortlog length: The commit
      message exceeded 90 characters per line (currently 102
      characters), (<code>test_mbox.TestMbox.test_shortlog_length</code>)</p>
    <p>To address the above issue in the V3 patch from patchtest, I
      updated the commit message to ensure each line is less than 90
      characters and have now submitted V4.</p>
    <p>Regards,<br>
      Deepesh</p>
    <blockquote type="cite" cite="mid:CANNYZj_cEFw7-GZoSzAz27LQ0Rvh32xfVU9jQCGB4rdduNkGgQ@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">


On Mon, 13 Jan 2025 at 14:40, Varatharajan, Deepesh via
lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:deepesh.varatharajan=windriver.com@lists.openembedded.org">&lt;deepesh.varatharajan=windriver.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
From: Deepesh Varatharajan <a class="moz-txt-link-rfc2396E" href="mailto:Deepesh.Varatharajan@windriver.com">&lt;Deepesh.Varatharajan@windriver.com&gt;</a>

-----------------------------------------------------------------------------------------
error: data-layout for target `x86-linux`, `e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128`,
differs from LLVM target's `i686-unknown-linux-gnu` default layout,
`e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i128:128-f64:32:64-f80:32-n8:16:32-S128`

error: data-layout for target `powerpc-linux`, `E-m:e-p:32:32-i64:64-n32`,
differs from LLVM target's `powerpc-unknown-linux-gnu` default layout,
`E-m:e-p:32:32-Fn32-i64:64-n32`

error: data-layout for target `x86_64-poky-linux-gnux32`,
`e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128`,
differs from LLVM target's `x86_64-poky-linux-gnux32` default layout,
`e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128`
------------------------------------------------------------------------------------------

Rust commits for updating the data layouts:

x86:
<a class="moz-txt-link-freetext" href="https://github.com/rust-lang/rust/commit/dbff90c2a7c751cf9d6843cd585429beb100c17d">https://github.com/rust-lang/rust/commit/dbff90c2a7c751cf9d6843cd585429beb100c17d</a>
x86_64-x32:
<a class="moz-txt-link-freetext" href="https://github.com/rust-lang/rust/commit/ec55a05374d89d206be5140a4759af92f1b42f15">https://github.com/rust-lang/rust/commit/ec55a05374d89d206be5140a4759af92f1b42f15</a>
aarch64:
<a class="moz-txt-link-freetext" href="https://github.com/rust-lang/rust/commit/4d397d33da8aff64419a03694d152c8250916f19">https://github.com/rust-lang/rust/commit/4d397d33da8aff64419a03694d152c8250916f19</a>
ppc:
<a class="moz-txt-link-freetext" href="https://github.com/rust-lang/rust/commit/ad7ea8b7e690e6000006b6fde630a2c8c4385019">https://github.com/rust-lang/rust/commit/ad7ea8b7e690e6000006b6fde630a2c8c4385019</a>
riscv64gc:
<a class="moz-txt-link-freetext" href="https://github.com/rust-lang/rust/commit/f414715ebfda201f91f80ef9f28d9923d614d1c4">https://github.com/rust-lang/rust/commit/f414715ebfda201f91f80ef9f28d9923d614d1c4</a>
loongaarch64:
<a class="moz-txt-link-freetext" href="https://github.com/rust-lang/rust/commit/4a06a5bc7ad259023e4373e794687adfce252dac">https://github.com/rust-lang/rust/commit/4a06a5bc7ad259023e4373e794687adfce252dac</a>

Signed-off-by: Deepesh Varatharajan <a class="moz-txt-link-rfc2396E" href="mailto:Deepesh.Varatharajan@windriver.com">&lt;Deepesh.Varatharajan@windriver.com&gt;</a>
---
 meta/classes-recipe/rust-target-config.bbclass | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 399c13db26..67aaa56bac 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -146,7 +146,7 @@ MAX_ATOMIC_WIDTH[armv7-eabi] = &quot;64&quot;
 FEATURES[armv7-eabi] = &quot;+v7,+vfp2,+thumb2&quot;

 ## aarch64-unknown-linux-{gnu, musl}
-DATA_LAYOUT[aarch64] = &quot;e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128&quot;
+DATA_LAYOUT[aarch64] = &quot;e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128-Fn32&quot;
 TARGET_ENDIAN[aarch64] = &quot;little&quot;
 TARGET_POINTER_WIDTH[aarch64] = &quot;64&quot;
 TARGET_C_INT_WIDTH[aarch64] = &quot;32&quot;
@@ -160,21 +160,21 @@ TARGET_C_INT_WIDTH[x86_64] = &quot;32&quot;
 MAX_ATOMIC_WIDTH[x86_64] = &quot;64&quot;

 ## x86_64-unknown-linux-gnux32
-DATA_LAYOUT[x86_64-x32] = &quot;e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128&quot;
+DATA_LAYOUT[x86_64-x32] = &quot;e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128&quot;
 TARGET_ENDIAN[x86_64-x32] = &quot;little&quot;
 TARGET_POINTER_WIDTH[x86_64-x32] = &quot;32&quot;
 TARGET_C_INT_WIDTH[x86_64-x32] = &quot;32&quot;
 MAX_ATOMIC_WIDTH[x86_64-x32] = &quot;64&quot;

 ## i686-unknown-linux-{gnu, musl}
-DATA_LAYOUT[i686] = &quot;e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128&quot;
+DATA_LAYOUT[i686] = &quot;e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i128:128-f64:32:64-f80:32-n8:16:32-S128&quot;
 TARGET_ENDIAN[i686] = &quot;little&quot;
 TARGET_POINTER_WIDTH[i686] = &quot;32&quot;
 TARGET_C_INT_WIDTH[i686] = &quot;32&quot;
 MAX_ATOMIC_WIDTH[i686] = &quot;64&quot;

 ## XXX: a bit of a hack so qemux86 builds, clone of i686-unknown-linux-{gnu, musl} above
-DATA_LAYOUT[i586] = &quot;e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128&quot;
+DATA_LAYOUT[i586] = &quot;e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i128:128-f64:32:64-f80:32-n8:16:32-S128&quot;
 TARGET_ENDIAN[i586] = &quot;little&quot;
 TARGET_POINTER_WIDTH[i586] = &quot;32&quot;
 TARGET_C_INT_WIDTH[i586] = &quot;32&quot;
@@ -216,21 +216,21 @@ TARGET_C_INT_WIDTH[mips64el] = &quot;32&quot;
 MAX_ATOMIC_WIDTH[mips64el] = &quot;64&quot;

 ## powerpc-unknown-linux-{gnu, musl}
-DATA_LAYOUT[powerpc] = &quot;E-m:e-p:32:32-i64:64-n32&quot;
+DATA_LAYOUT[powerpc] = &quot;E-m:e-p:32:32-Fn32-i64:64-n32&quot;
 TARGET_ENDIAN[powerpc] = &quot;big&quot;
 TARGET_POINTER_WIDTH[powerpc] = &quot;32&quot;
 TARGET_C_INT_WIDTH[powerpc] = &quot;32&quot;
 MAX_ATOMIC_WIDTH[powerpc] = &quot;32&quot;

 ## powerpc64-unknown-linux-{gnu, musl}
-DATA_LAYOUT[powerpc64] = &quot;E-m:e-i64:64-n32:64-S128-v256:256:256-v512:512:512&quot;
+DATA_LAYOUT[powerpc64] = &quot;E-m:e-Fi64-i64:64-n32:64-S128-v256:256:256-v512:512:512&quot;
 TARGET_ENDIAN[powerpc64] = &quot;big&quot;
 TARGET_POINTER_WIDTH[powerpc64] = &quot;64&quot;
 TARGET_C_INT_WIDTH[powerpc64] = &quot;32&quot;
 MAX_ATOMIC_WIDTH[powerpc64] = &quot;64&quot;

 ## powerpc64le-unknown-linux-{gnu, musl}
-DATA_LAYOUT[powerpc64le] = &quot;e-m:e-i64:64-n32:64-v256:256:256-v512:512:512&quot;
+DATA_LAYOUT[powerpc64le] = &quot;e-m:e-Fn32-i64:64-n32:64-S128-v256:256:256-v512:512:512&quot;
 TARGET_ENDIAN[powerpc64le] = &quot;little&quot;
 TARGET_POINTER_WIDTH[powerpc64le] = &quot;64&quot;
 TARGET_C_INT_WIDTH[powerpc64le] = &quot;32&quot;
@@ -244,14 +244,14 @@ TARGET_C_INT_WIDTH[riscv32gc] = &quot;32&quot;
 MAX_ATOMIC_WIDTH[riscv32gc] = &quot;32&quot;

 ## riscv64gc-unknown-linux-{gnu, musl}
-DATA_LAYOUT[riscv64gc] = &quot;e-m:e-p:64:64-i64:64-i128:128-n64-S128&quot;
+DATA_LAYOUT[riscv64gc] = &quot;e-m:e-p:64:64-i64:64-i128:128-n32:64-S128&quot;
 TARGET_ENDIAN[riscv64gc] = &quot;little&quot;
 TARGET_POINTER_WIDTH[riscv64gc] = &quot;64&quot;
 TARGET_C_INT_WIDTH[riscv64gc] = &quot;32&quot;
 MAX_ATOMIC_WIDTH[riscv64gc] = &quot;64&quot;

 ## loongarch64-unknown-linux-{gnu, musl}
-DATA_LAYOUT[loongarch64] = &quot;e-m:e-i8:8:32-i16:16:32-i64:64-n32:64-S128&quot;
+DATA_LAYOUT[loongarch64] = &quot;e-m:e-p:64:64-i64:64-i128:128-n32:64-S128&quot;
 TARGET_ENDIAN[loongarch64] = &quot;little&quot;
 TARGET_POINTER_WIDTH[loongarch64] = &quot;64&quot;
 TARGET_C_INT_WIDTH[loongarch64] = &quot;32&quot;
--
2.43.0


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#209721): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/209721">https://lists.openembedded.org/g/openembedded-core/message/209721</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/110586460/1686489">https://lists.openembedded.org/mt/110586460/1686489</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------AHc70T0BB9XOhNWFW06u8S7R--

