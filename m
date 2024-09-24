Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA8BCF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 08:18:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8886.1727165915906258798
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 01:18:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=99979d78d4=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48O5e2Yp014639
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 08:18:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41um6hgak7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 08:18:34 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48O8Du2m019171
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 08:18:34 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41um6hgak4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 08:18:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B70cxCROkXumN/VFUsEjf6WoPNOt3ssGcSFsfGu5UE7i8RKk4udF0zVV+Bk4ISkk9Wlyzz2xZuGGi5JU8VdMG1y0xGsULf0foy0hMPilFFDA0aW321pWVTTaRgQr1hrod2jiRwm56WTjjqLapWT7OwW0Zuv2WXGYjAfhHDxU8FFl0azoYOjGo64q0yfKqS3htD5cbtEZ4Tuy8edSxtk33NalM1q8QhG5OqvBO2AOpZAXwEzgn8i2Rzu2AR40OgDkVvtg/p5xu1aZqzGATwTPnisU1XHuYmzI2UG//AkrTuJFHZ9d3/0AVhjJmw0BStpth8bq0Gzu0mgHCcYFlcs4hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QAhxin5+xNAU14LOX5ie3wVv+ZDZ2DhIpKHtpXwmGm8=;
 b=Iiz6EEm694VrvDf+9/w5p2Vi/J0L+3Ifn6m0GwvoqxdnQBnNTZUFvcQ4isq/OGr4NnLBy5AzdbfmYbsbRmM8x27jM6i8/3ceLu3cpNckBnx8b5uHBoVprZopDKAKs+hC/ZPxDch6IxxHoENlAvz0mW+MVi0fj5iWlDHPh73yfKHbFTL2lq+aEsvBjuRfw4gFhCGh/LCHNSCb+D2RsjDAJGCf5HwrtGxgRTEGkeYyaLajgH07ev0IWVLT3nLsGpQSBJTRnaNnemN0TQQG2RzjrynCh7Dq3B2oTKCbj3j4AEqyVMHTxwXoIeEn1N9eyIajUQXJZoxaNq0XfxKGp3lscg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by CY5PR11MB6257.namprd11.prod.outlook.com (2603:10b6:930:26::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Tue, 24 Sep
 2024 08:18:32 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%4]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 08:18:31 +0000
Message-ID: <4285e3a9-7db3-429b-abe6-3f299555c3b7@windriver.com>
Date: Tue, 24 Sep 2024 16:18:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 0/2] proposal: Append VENDOR_REVISION to PR for
 CVE scanners
To: Alexander Kanavin <alex.kanavin@gmail.com>, david.reyna@windriver.com
Cc: openembedded-core@lists.openembedded.org
References: <cover.1726821150.git.liezhi.yang@windriver.com>
 <CANNYZj9SyrR1TMWY3ehfbT+-rrDQqfKVSiN-thQQBoVwXK+uxQ@mail.gmail.com>
 <0738ba86-15be-4c53-a8a3-624c65eef18e@windriver.com>
 <CANNYZj-VTYcBgd8TDdwsE+Zww3LCH2tiAzOUUuU+9SkubczPUA@mail.gmail.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <CANNYZj-VTYcBgd8TDdwsE+Zww3LCH2tiAzOUUuU+9SkubczPUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0041.jpnprd01.prod.outlook.com
 (2603:1096:405:1::29) To PH7PR11MB8527.namprd11.prod.outlook.com
 (2603:10b6:510:2ff::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|CY5PR11MB6257:EE_
X-MS-Office365-Filtering-Correlation-Id: 8930e7d0-b978-4001-148d-08dcdc7177f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|3613699012;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cGg5M3IrSTdzWDlON0hwQ213d1FLa0JOaTBoVEJlOUZpNllzTjZraXd4Z0Zn?=
 =?utf-8?B?VnI5WSsxditYMG5sT3VyTlFHejlBcWk3TWxhK0twS1JRK3gyMUg5SXNMTHhy?=
 =?utf-8?B?S1RGZDVtMFcwQTkwdXF3RU9sVXNQNzVVTXNJRVByZDNqaCtESjlDbEI1SFpZ?=
 =?utf-8?B?YlY5NFptdXFEeFg5QVA3RUNuVkIwMmdvdForcXA2cTFLQXlJakEvaGNtWWhC?=
 =?utf-8?B?YzlGMmlWcW9teE9GY3BicWxOckl5d0FHcERjWFNMeGpVVU9kck05dzE5cTZL?=
 =?utf-8?B?ZkdkSk9NMStwemZxUktFd2ZqZkdnQVRrL2VPb3RBemFMMmFlZGxhTWlNcXNJ?=
 =?utf-8?B?NUpHZWlEcGF2dnlMdjFreFNGQlVwWGxOOFViOW0ySFFJdEhLcUd3ZUUxV3pp?=
 =?utf-8?B?VHp5eTY4ME5lV2ZQVy9CT1d2dFhqbWp0bHI2Q0NVOGFkRDZZL2RnMmlrYy9m?=
 =?utf-8?B?Rzd4VUh5QXJKRnp3bXYxS1VNTU1VVS91QkVwa3JtYjZ2bG9MZTNaeWhHS1lt?=
 =?utf-8?B?OUR3MG5Gb05xSDZoN3VWSWxLa21qOGV6ZTNsNko3b3JNcVR5NkwrQU8yOEt3?=
 =?utf-8?B?Y0VnVEVxMEpSU09uaWxuU3pXVFNhNzlmTklxY3QzZmN4LzMrZS9rODMwdng4?=
 =?utf-8?B?bEF0bEhtcXNXdThVcnNFZ0o1RTNIUlpsM3g1WDU4QURKdjlKckcvNU82cHNL?=
 =?utf-8?B?czk2ZWx4Y1pzM2k5N2JHSmZ5ZVBXejZkT1FhenUzb3NLWDNpc00rTWVUNXRl?=
 =?utf-8?B?QkhPNjN4NGZ4azRlYjdjY1cxcG5XWHQ1UE9sOWIyZlM0UjR6VnhwcFdjOE1R?=
 =?utf-8?B?THF5UVJLODRoOHhrWCtmbXByaVdKUng3MHlkOHAxN0hLYndKT1Y0cDZxaHVq?=
 =?utf-8?B?SVY5QmFrdnhkNlU2Y29nYTlTVDBvcytoYjVyWCtzOUpIVzNyRkFzUU4rWlFi?=
 =?utf-8?B?bVdoSmtXRnc5WHFVQVdSWUUyL0cwSERSalBUNVBjYVNCYU1BeTRxRzFyUXUx?=
 =?utf-8?B?UmVCZ2x2Q2ZkYWNmK1cvN2liSjlFUGRpWHoxS24vVkFXSDBnakxtYTdUbDhr?=
 =?utf-8?B?eW85bjdoZWk1b3IzOEViQjQrbkF6dGY1Q25GOU5nMS8vaVNIdnN5TzhtbmtT?=
 =?utf-8?B?QUZGYnc5VmQyTmt4dTA5QzJ6cDdjRmJzaklwYlZ5NWdVakIxT1R5Z2FoK3VF?=
 =?utf-8?B?RjMyQ0pjYXk3d0ROc2lYYWs0b090MGJQa0FleGUzVnFjMjN5a2xZNGVNVGFJ?=
 =?utf-8?B?bGVNVlNIVGRMNEk0UmNaM2RCUDhBUjFELzJmaDJ2cW1DelRPLzlnWWlvUW9Y?=
 =?utf-8?B?dGdYb1ZqcGE4cEpxbnJNMGR4ekNqSGQxQmhrd3FkTzRBbmo0TExsSmFoR01w?=
 =?utf-8?B?VmVqSHdrb0Nhb25FTU82OGRvWjRoWm9wMW5VYjVqZFVaUGc1Z0lGUEJlb1pT?=
 =?utf-8?B?REJ6Wm1aWHdLNEJ4K1RPd0piL3pXS2pPK0NtZTdEUmRPckh1SVBPcVdGdUpk?=
 =?utf-8?B?Q2cxQUczcHBETHBnMEh2Q3l1d0VmcnFMTHp4NDlDZmtZN0lqSFc0aEJYVGlF?=
 =?utf-8?B?RWVJb2xJNHg4QWlPdXlSaWtPVG9CZGF6T0liamIzMWh1bDFKdkJobm9ZVEh5?=
 =?utf-8?B?Y3NoM2V1KzhmcDJPZnZZT2R6QnUvOFMxUThoWllIOUV4QnJQNnZPZEx1VGNO?=
 =?utf-8?B?aGhKcmhUR2xkQWdXSnBnUmxtR0ZnQzN0eUIxbFZkQlp4Tmo1eXZGYU1iQUVj?=
 =?utf-8?B?RWZBdXZHOENwYWZOazJvQjMyVUhWeExLSzd3aDBpSGliVmtQTUN3c2lRV2N0?=
 =?utf-8?B?NFVtV0p4UFc1VkRMdTlYQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(3613699012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZFgzY2dCa2NXVUZTaVozdnZtVUdpMHVRajhhL3FyV2tuZUZ3YVpnY1FJNExT?=
 =?utf-8?B?d1lXY3J4ckRjRjBveHBCK0NOS0VmVXBmak1ReDd0djJsU001VlBOaXNOS2VP?=
 =?utf-8?B?QzRrdlMrN2V1T1pGd1BQUkx3UXJoZ2VqWERLZGgwMFZoUW12QTBkU3A5cHpL?=
 =?utf-8?B?dG9EM2haWXRqaFIzTjVNMnlHTTVxemlUQ1VTU2NxVDJmczNBemVGbFJVTTFn?=
 =?utf-8?B?M25GbHMyeVpMSDNMSTBxUXYvQ0xEQkM5M0YzZzJmKzl1R0ZaU0kyYks3bVhC?=
 =?utf-8?B?VnRnQVpFN0ppSXBvNG00U1ZXdHQxT3ZpQy9ZUThkOWFqWXJjRmRGV0VobnBY?=
 =?utf-8?B?dXM2S2lyMlozNGdYVXk1MERnK0t4QjRVd1V6Yjhxc29lb3VxYTNCUndsTzA4?=
 =?utf-8?B?SnJ1OTNQamp4dXRnSVhsYzVySWxmS0ZoRVdBczdaWU9UOEVnblRaTEJTeGRk?=
 =?utf-8?B?YnA4d1B5TVcxSnptNnZ5bGovZytPbitRVEN0RjA1YjVFRkZoUTRLRWU2b2hj?=
 =?utf-8?B?Sm5Fb2JleDRLMUFxQmZ4NEt6Q0dLZCswaVo3RVNLVUQxKzZYWG1OWmcwL0pH?=
 =?utf-8?B?QWFkWGo2ckE3UzVtWlJ0QXBQUWpENzRTSExaU3VsUEVrak0ySXBwOWhkNEJr?=
 =?utf-8?B?Vi9GZlRqN2k5U0NTOFFzaVIwRHJiWmhuSE5uajRjS3VUUTAybXJ2TDFrTHlU?=
 =?utf-8?B?ZGRKYlVIQjZKWWlYSlZsaVBJM2xwZGF0MlA1YlI5MWpwUWthOG9BMFdOZmpS?=
 =?utf-8?B?dlp0U3pxWTk5TnZEdWwvaE9DRmFIT2c3b3VzR0w2TmFtT25YQWRUaUdiMnUv?=
 =?utf-8?B?UG5SVVNHN2E5ZmJpY0twdTd5T0RPWXNFOFY0cUFIYzhLb0xja2UvN3ErTEs5?=
 =?utf-8?B?eWNqUzZ3b3kzeFJoblRJS1VIc3pFRlNXTmlUS2JFQms3U0h3ZjgrK3g0MjVN?=
 =?utf-8?B?Zk0rYVhBN2ZGR3dNN0pFMTdLTTVYNm03bTgyU1QxYVBRTTlQSGNkajRsWlAr?=
 =?utf-8?B?eWpCYUVYcCtpcUNRQldDZFpKdkdYZHpOdFhTL3pkV2pYTjFzNEdUbHBkRkVp?=
 =?utf-8?B?ZFdndlRRelZaaTQrQUJqaUUwcmNoNC9XWGtXTjlKalZBcStUN3h3bUxNdHVF?=
 =?utf-8?B?bWVEdEIvU0dtd1lZazBTT3YvOEloTnRQUTFsMlFHOG0wMVNYS0xiL1ZURGJY?=
 =?utf-8?B?RDJ4RjBzbUtaY2tjQzhQd1g3RGJBK3pBNVZrOTdiYUd3Tkc3ZWhJQnpXQzNs?=
 =?utf-8?B?MXovcG9zUUxEWC85Nm9lU0xpUy9RbmFJSkpvYjNMRm52Y1UyR3lhR2pyTHlR?=
 =?utf-8?B?UkVnNGRvR2R5TzVoRXVsaThuaUJoMm0wWmkrSytVSHFNTkIrbTB1bjBjWHRy?=
 =?utf-8?B?VE1NTklvOGl0ZEZEYnJ2M3Ixb2Y0ZGFUWi9sb05yVDE3Q2c0Q1daSVdJdUpG?=
 =?utf-8?B?UzBySVM4b2NIUStHWURZLzhodTJselhidU1kbDNNR3cxL3hPMElyc015OGdL?=
 =?utf-8?B?RjdLMDhNWTlQL2cwTi92M3dFQjh1RjZvSjBCQ0EwTERiTUFpV0lTeXV6dzJJ?=
 =?utf-8?B?eWR4b0pqTU0xVkN6YjhXdVZZM1RzcGQ3SUFuWU5ROEU4ZkkzMjJhRFc5WDBq?=
 =?utf-8?B?cE5qZDE3dXVRVzI2KytKdEJnYllxaW9JMHFPRWs5TGprZG9YUFVCbmZVOVBJ?=
 =?utf-8?B?bUdYc2ttV2ZzSTVzaE5VanVZYkp5QnhnMmxEV1ROM0hac3A2eUFJTTU2dk9E?=
 =?utf-8?B?MVpBbi9YSEk4Z2hPSjg3MHlnQnV2OHUzWlJ4bmZiRlkzekxZTTRRVm1GVFMw?=
 =?utf-8?B?S1VPSTBPeVVkUWJXZkptYzZLQllweHFiYVp0Z1hxenVSSWxocHdzSUl4RVhB?=
 =?utf-8?B?SSszNGlmckw5ZXREaVVHSUxwUHVwMExNcTZzZzhiQlpLYXJUbmJ6bnVGWFdu?=
 =?utf-8?B?Tkxwam5NVVNROVBmOWVBYW91eXBjWkliTk1zUWRqL0lxa3VZUXc5blAwamNP?=
 =?utf-8?B?SkZRYTY5Zk5aeFdTSEpJU2RoZ09GTm9ULzl4eFZoenA1U3RUWkgxNjFBcVh4?=
 =?utf-8?B?ZjU0WG4yQUM4SVVBNktVY1hJS0IwSkhvK3Nmd0xRQjJrRisxbWZwYWV3NHB6?=
 =?utf-8?B?UFZkanEvajdDdzRvenpvUGZSSzNFbGpZbVZoRnR5c284UExlRDBaemQwRUky?=
 =?utf-8?B?MFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8930e7d0-b978-4001-148d-08dcdc7177f8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8527.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 08:18:31.8926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZKOJ9dilmpF/d75Cc2Zg/N0qSQSCxQm6vBCRdtUmXNdLMhaggAkW8rReP/x67ShwgJBhUu6e5oGOaViiQ43MQdJ7WZo3CsdH07kbz0B3QVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6257
X-Proofpoint-ORIG-GUID: aIm4THS9xQ4zjOO0nVnqREPX3zy7jZ1W
X-Authority-Analysis: v=2.4 cv=bas5U/PB c=1 sm=1 tr=0 ts=66f275da cx=c_pps a=ZeveGGZnxkNpWlA7A6AaFA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=p5-bi9iQhCB0go767mkA:9
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: xsgTwuHgc7kpe8zUjiXzhKckjCfFdQQ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-24_02,2024-09-23_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=949 clxscore=1015 priorityscore=1501 spamscore=0 phishscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2409240057
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 08:18:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204839



On 9/24/24 12:47, Alexander Kanavin wrote:
> On Tue, 24 Sept 2024 at 06:24, Robert Yang <liezhi.yang@windriver.com> wrote:
>> Thanks for looking into this, the problem is that the metadata (CVE patch info)
>> is not in the binary packages such as RPMs, so the cve scanners such as Trivy
>> doesn't know that. For example, CentOS and Ubuntu also has the similar issues,
>> they use the vendor revisions such as 29.el6.centos and 0.4ubuntu3.3 to help
>> Trivy know that the CVE is fixed in a lower version package.
> 
> But how is trivy's database updated to include such custom vendor
> revisions? Is it done centrally by the vendor (and how?), or is it

The vendor itself will update trivy's database, David Reyna (in the To list) is
working on a script which can update the database, we will provide more detailed
examples later.

> done by users in local installations? This does appear hack-ish to me,
> the better thing to do would be to actually include the list of fixed
> CVEs into package metadata.

The problem is that Trivy can't work in this way AFAIK.

> 
> I'm not sure this should be carried in core, if there's only a single
> known tool that needs it, and core has no support or tests for it.
> Maybe something like meta-trivy?

Trivy is just an example, we're trying to make more tools such as blackduck work.


// Robert

> 
> Alex

