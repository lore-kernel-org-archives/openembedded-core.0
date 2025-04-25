Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D748EC369D1
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 07:22:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1852.1745565754174312810
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 00:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6210502670=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P5AWok018960
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 00:22:33 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jhd3dyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 00:22:33 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53P7MWpD020536;
	Fri, 25 Apr 2025 00:22:32 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jhd3dyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 00:22:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l2qfy+S3k4xue5SQWG5UMkWgd0Jju+v/33SUNNRQYDRsuWtkuYAnlyYFNLjP5kf1jaiQxzLXpIrjh7Ey5Tjnz5h2zAtxsc2nxNjRiw/UM7bUSATjebHGK+VSZMR0r5afWtw/Lj/FsDepCSXeFo9UHLtalTNj0wdxQAf9nYscPnQZHLGwf7U8/FOkTkF2l2gJ6q3nLW95vWIHS2zOF5eaT4EJVtTEBwt9cfOpgqme6PlOd3dJ54PL6QjZwsKjXiwUHU8EWAP9Uybi4mhWrR618pIxMDoWCiPA1pHWE6I8Is/6UhGWrI6h73A6QWa8HsDidmn7PbLugHof1hQIvR9uug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k40V4maCzZl/3hSzui4uOhhFeaUg9yaAR2vXcTT3OI8=;
 b=MSKlrRctdjW+eycaH9tk7WQ29jhGzlQeIqB256a1a+xdsxU2gmTWt4zKJfoNKBXIGzYIMf0JgXVceEH6qRjx/rBAr66xX1ykOMgyJd/vojAaswCYw1QhOj9BSOQn/eL6KObnnELZtXFskOc8VjQT9sH0Xfjn1TEZwViPOopnHddTeaXRSWP53HUnWfCUBwyT33R61oBIGHU+1zVzikE7O3yVnC+RzwfSw7ccis9Mr2+z6I+0Cdb8DOmCKOp+eHCcMOVRAzuRyfH/pv3FrB9BYDOyaehbXavmQIs/xMJVVERxe4WQ0dOreGykzOeYmGfHiIe98Bnso4yniDcgmmnaFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ5PPFEF71E136E.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::85f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Fri, 25 Apr
 2025 07:22:27 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 07:22:27 +0000
Message-ID: <cece4c6c-a974-4ade-98df-088cab9b38f8@windriver.com>
Date: Fri, 25 Apr 2025 15:22:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2 v2] sassc: fix runtime version
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20250425065438.377577-1-yi.zhao@windriver.com>
 <20250425065438.377577-2-yi.zhao@windriver.com>
 <434d8a287a4e2842c74b1d952583765688237f51.camel@linuxfoundation.org>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <434d8a287a4e2842c74b1d952583765688237f51.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0048.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::11) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ5PPFEF71E136E:EE_
X-MS-Office365-Filtering-Correlation-Id: f7c00f17-3e15-4ae1-70b1-08dd83c9ee96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QWVYRE9sbHNLK2M2bHVjSE1NOXdqYlJZMG1zOWZZVUtrOW1UUHVhN2gvVDVY?=
 =?utf-8?B?SXZRYk85VWhyMmNHSndWS0VuamUyejM0SC93MENPbms2VUthSzNETUJ3WlBG?=
 =?utf-8?B?M012dnIxdkpaTzIwZGpkVjFmMENVWWRrK3NvdHJOcFUwaW1QVVFjUXlXcGV2?=
 =?utf-8?B?RjRuRlpXT21zbGpHRHZDYzN5SDUxWElsNm44RitEMFhkMldnNUtxZVlSUUQz?=
 =?utf-8?B?dkRuYkFubXJDLzFmR1RxeFQ3TzRKcDRrKzZjTms3NUVEc0NBSGVsZ3IwWWt4?=
 =?utf-8?B?N0lFR0RXN2R1eXVlUGZ0YTVQRDFkWUhJWVZiVXZVVDZ3RmVWQklvb3lPblg0?=
 =?utf-8?B?Y3QxMCt3SDVUdEx1VlN5REFPUyttQ0FWY0JpY1ZxN2EzaG9VZmFlNjdWcHpi?=
 =?utf-8?B?eC9JWFYvK1VwUFlydExCK0VFNFVDamc4QldCOVZpZHo3R0s1R3IvbkdWWVRr?=
 =?utf-8?B?U2FSdnZaamMzVFZGT1NhTDZjNnZVaXJIY01UbmxLc2RweERQRVVHUFZDVDRJ?=
 =?utf-8?B?aERXVVhuaWg4dEZ4bWsyL2N4MnNFd3Mwdk1Hcjh0c0xjaXdVaFR6SExlSDdY?=
 =?utf-8?B?VVY2S0V5aXlSclZBTy9rdWw1RVpjSS9qOEN6UXNRaHhQZkJBOE9IbCtGUUtJ?=
 =?utf-8?B?eUd3d3dGZnl1TW9yRS9uN3dxRldZKzFudVhOVEY2T0Q4N213Ym5BRmx0UmtH?=
 =?utf-8?B?MGhtK05KdnF2SjlZSWVuak9Gc0YxTTAwSzZvY3YwWUtkK2NaY0xBUU95cW5m?=
 =?utf-8?B?WVpkSEM1NERuYnI5VGZENnpzT2hST1llckd4dXk5eE9RUk5vV1NwemROVStQ?=
 =?utf-8?B?N0RkSG03MjZSVGRRMVc3b09ZY0RENktpRXVIQ09Wa3ZONnVTenB1dkEzVnZp?=
 =?utf-8?B?aW54UVQzeEJVYllnVzBPbUQ4QUtXRXZqVE5uMFFQNlpRL0Z4M25pT0sxYTQ5?=
 =?utf-8?B?cmlmOGJaVTF0YzVmVGtLZFZtQXJFTjhVaGhlWlFLejVOZUdwaDRyTkE2N0ov?=
 =?utf-8?B?VXVzeUxJV3FkR2w5OFBHaEpyTGJXb244Qy8xckZJaWhqdXVCSEZHQmpmVVJ5?=
 =?utf-8?B?ZExOV2NJbVVzTS9adlVpZnVGQld0TjlCZlNBNWl2VG1zNFh4Q2N6TTJMN00z?=
 =?utf-8?B?OVhsQW5nTVBhMy80b1NHQm5QMS9uOXVYK1JxVUFVOXkxTCtsN3BQNUNxaTVw?=
 =?utf-8?B?Ujg2eW1IbVV5ZTBGaUo2SkM3M2NTcXhZdzU0aHdLOEM0Q3lpelEzUGhtUFFX?=
 =?utf-8?B?Qno3WVJMNm1PdVF6RHlnZ0JQZGZYTUxBcWMyOVdORTAzQ0RoYU02WGNyMkwy?=
 =?utf-8?B?dU9TVklUVEl1UGFURDU0b2FTRXBDUTJ1OEVmNEY1V2JrR2hvL2ZrZFF3M3Rj?=
 =?utf-8?B?WWNTc01HM2s4UG5TUXJrTU15Rlk2Z21VZXJHYll4WlBDQ2E1YUJXbjRRakVy?=
 =?utf-8?B?azd3VHF3N214ZVgxK2F2V1JiT3JqNGJZWGF1bGRkdGladVhOck5mQnlhNkFO?=
 =?utf-8?B?NnJkWGcwM0p2OXlNbDk1NUs5NjZFTTkrZjJjdFFoKzE5TGZ5UldOR0hnZm5P?=
 =?utf-8?B?Y3kvcG4yQ09wMjl2ME1DOGMyeW16OTlGdkFpVFg0Z2pEaDVQRzRJSkNVbllL?=
 =?utf-8?B?dGM4cjNiRXhvdWVEa3lKbmhEa2NaVk9HUFF1Z3FqbzRRQ3I1WnJuU2VqemRK?=
 =?utf-8?B?REtIT0JzdStTcktsNDJKa0crUVZKTDVuKysxV0txampseEpCZmtDUU1iN2JW?=
 =?utf-8?B?ek5WK0pIcmhvTHF4V0RMVjFER29BeGdQaTloclo1dDh0d2M3dDJ5Qk01V2xP?=
 =?utf-8?Q?ql3LSietvFwG5H7OCCw5+KxsFndvGbXF391zE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VHlqTkNwQ2g2RW1mYWR0T3lHdmNmd2w5eUs5TVNDNnhlMXU4ejhlU0JRVWIx?=
 =?utf-8?B?eHI3TzdhTWxqZmh2bndpZzQ0Z0h6eGVHcFhoRGFnajRJb2VETHAzL0pqVllC?=
 =?utf-8?B?QWlzNTNzWkNkNEpSRTB2TFlobzg0OGpZZ2cyZ3JsenY1bU1ZaEJLVXRURndK?=
 =?utf-8?B?eGI5amhUc2dmTUpTQmJUZmw2TmRIWEtsdndsZDE2d3JVcVNLWDJMKzhSNUR6?=
 =?utf-8?B?S3d3VkJRUVlLSEo2ZE84djROTS85YkVDeGdKaHJabWVxeVVxL0o2MEFXbkgw?=
 =?utf-8?B?aXVac2ZRN3dsNWNoVXIzcm1pL1poZnk2K1k5eU1ZVFcwK3AxRWN1VVh4aFdB?=
 =?utf-8?B?VitLU0R2RXFWblA1a2QyZnlNbWw1UGJOMVZhL1dDbW1FR2xqZFJiRjhNVmJ3?=
 =?utf-8?B?VWxDS0RYbDhlTVlnRUwzWG42Z0FsY3ptOXZyVkV2c0gwblo3VXg4Q28rOVNx?=
 =?utf-8?B?bVJUc2ZDeXRiR2lOcWpocjNuU0MvUUVBVm10amQ2aGsrdlZHS0pGcUtIMFl3?=
 =?utf-8?B?MnNiQ29RNFZOMkEwMi9qL1JZTXZod054TW5ROGJVbWp0N0llZjhPdCtlTXp1?=
 =?utf-8?B?RDRnTzFNeXBlbXN5VCszK29zNFhIRGJLb2I1eXR0ZytRZFpUek5aRmRFT1A5?=
 =?utf-8?B?aDlPT2tqcE1ESnRSUFlRY3dXOWM2ZWQrOXQ4a2EvOXRLTGRVeDdYNGIvcnlQ?=
 =?utf-8?B?YkpZRWVJZTgxYVRWdldBQ1N2ZFNDQ3hqZVZaQUhuQnNVMDM0RHFkWkpyN3h2?=
 =?utf-8?B?Q0ZvWVZYMUF4ckRSY2JZQmxQWWtmejBFMnZ5OHB3NEkvQVJKN2g5SGEyV3Ax?=
 =?utf-8?B?RnhwRVlRWitZYUViRFhLQVk1RHVkVlJqcSt0Y0FjTkNlWTlsNTBaaHYxajFB?=
 =?utf-8?B?UTJJRDJqTzk3NWIydVFHWVNTZFN5Yi9RNkpyRlhiazZnUUh6L1VIbHdTTjRC?=
 =?utf-8?B?NVFFcTRxSVdWVkR3Z3N0SXZXcFJPUHJVaW5JcW4vcEp2akJYWEpDYU5xUGpR?=
 =?utf-8?B?NnBnd2FVK2hCVDFiQUMxemRZOEZ0ZElRd2wvZ2xqdlpFZWhEVFAvVWdLRmo3?=
 =?utf-8?B?Tm9oWTAycVcyblBJMGZmVm5LRDZ2bzM1NVRTUTZ4WVNXZllqSmRrTmVwYmN2?=
 =?utf-8?B?cldEY2hjV0crTWZ4eFJRczJIZTcxY240b3dqbGNVSFZHL216REQ3bitkZyt0?=
 =?utf-8?B?WEJYSHhsYUVDZlNKWjY0OCtHc0grNGh4cGdPWlRmSGoxcUQ2bzhaeFhsK3dV?=
 =?utf-8?B?SzFPUno2YXJrRFdJYUZleG5xd0xqTGQycEJTSG8rRjczOTBKUDFqYUZGazhm?=
 =?utf-8?B?bVQzUjlUYUxSS21FN0JrVTFMVEt0U1hrc1UxV0FHZ05EY1dvZnZoV2kreld5?=
 =?utf-8?B?RUZOcUsramxVeGpBYzdnaDFFVGt6RFVGNC9FM3crWWpqa1dEQkxHR1NHV1Fj?=
 =?utf-8?B?ZUZBdHdZRktkN3l0K3JYYWhISVZFRE9uanVhUjJ4ZVdMR04rdkJ4emNKUG1i?=
 =?utf-8?B?d1o4UVhJQ2w0VTRzZDZsczB1Wmx5cEloYkZmNHJYOCtaWW1uOUpUVUx0MHRk?=
 =?utf-8?B?RTk3NExwYjJhKzBSODhOTWNPWXY4Nm00aDhpbWNoZzhhZEZHa2Zsc2tDNURo?=
 =?utf-8?B?dS9yNVMyZDY3bm9Zc25rVUZvMXRtdXJXSmg1S3RKaERjeS9YRHhwY0d1bCsy?=
 =?utf-8?B?YTA0c3Vmb3Rsa0Zxd2ZYQUhUTzhndzVMTVE2ZU04bitIUkIxbHc1TTJKbUt6?=
 =?utf-8?B?bkFyQ0ZEQkJCUG1jYlZza3EvRFJjc045K0NuZmZJOXpEejl4TEgveGt0bnhV?=
 =?utf-8?B?R3Raa2RuN2xSN1htUzZUR0NEcFROOGRwUHIvWWdLcEh4b1lra2NlVk5xcS9u?=
 =?utf-8?B?bHAxQnptRVVadThyK2VNcFN4RGhwN0pzTDY5QmNxdDB0S3F4UnN0T1lKQUkz?=
 =?utf-8?B?Y1J6YnNESExKMkorQ3VPQ2JyVUN3RlBSU0cxcjV1UTRSMzF4OU9SOWhDUng5?=
 =?utf-8?B?Rk9raHlCM3o1ZVJlOGxjUFRsS0JPanV4anRkdXREL2JuY3JINzBLK0ZieDhI?=
 =?utf-8?B?Vm1sa052c0VNczBISkJYVkNUTUFtblFKNDg3VzhtU0c1ZUNrOWxIREdxUW9o?=
 =?utf-8?Q?4MTNzxYV7ZfMl6UBvRlxIsnCr?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c00f17-3e15-4ae1-70b1-08dd83c9ee96
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 07:22:27.2015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KDLZD4cRAFaeHF0js9K+GpEhkuCyjpkmj+dxZz3QxRKjgZ3l5YQse7GtUywWPeOnKKuHShOgTanv7qlSd7KkpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFEF71E136E
X-Authority-Analysis: v=2.4 cv=ZNDXmW7b c=1 sm=1 tr=0 ts=680b3839 cx=c_pps a=IYePPuTyj3qIg1BHBNk0GA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=G5qY9uygLnt4ZIVLNfkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ovNvxV87W062BBY_Ceyz57ZEYOv9R5mU
X-Proofpoint-GUID: qeQXFbYaqORbJ3UzwkjLYzvH_JPzx21O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA1MyBTYWx0ZWRfX2f7OAscQFVzo I2UIk1Jpz3Lq2fUCIc8u9F/vzA7PI5xI2IlAXnS1jPJyUmI2x6TU0VTogjaxTwtKrB1gr8jpja9 6Dd9QhaVlEqe23PPd21wfdV7+FRDbxhu3dpn8pzSGvKAYZQh404tBvD66J+1IrNcBh9qf6LrTdm
 h6T90Ju48C9FzPWVIxDutnOayFbI8Sw4ZsSNDN9uZsjfzsgMW+G7jdKH5BsoJZehPd7Aa16f0ld HzEioPPP/46ojkHSrkbuTH/NoYmsYi6F8b8QeJI7qVLBQ3v2CIoBpYtWLFAmcKlOrq2T9YQjndc FP9lGhA69GYOVx+rtjTHB80sUWx7XGO4VcmYNn6lEuIL1P2QL6IidWnfsCtKy8dsS7GlwgE1VYv
 7oPTfiH7blqOedCn5dm0chGS/C/1yBpZZg8aPMF2djLb75gs1f4Ndn68AoJu7jNfS4L7NZmT
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504250053
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 53P5AWok018960
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 07:22:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215433


On 4/25/25 15:11, Richard Purdie wrote:
> On Fri, 2025-04-25 at 14:54 +0800, Yi Zhao via lists.openembedded.org w=
rote:
>> The sassc_version.h should be generated from sassc_version.h.in. But
>> there is already a sassc_version.h file in source directory. When ${S}
>> !=3D ${B}, the sassc_version.h is generated in build directory, and th=
e
>> original sassc_version.h in source directory is not overwritten.
>> However, the latter is used during the build, resulting in a missing
>> runtime version. Remove sassc_version.h from source directory to ensur=
e
>> that the one in build directory is used during the build.
>>
>> Before the fix:
>> $ sassc --version
>> sassc: [NA]
>> libsass: [NA]
>> sass2scss: 1.1.1
>> sass: 3.5
>>
>> After the fix:
>> $ sassc=C2=A0 --version
>> sassc: 3.6.2
>> libsass: 3.6.6
>> sass2scss: 1.1.1
>> sass: 3.5
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>  =C2=A0...assc_version.h-from-source-directory.patch | 61 ++++++++++++=
+++++++
>>  =C2=A0meta/recipes-support/sass/sassc_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 4 +-
>>  =C2=A02 files changed, 64 insertions(+), 1 deletion(-)
>>  =C2=A0create mode 100644 meta/recipes-support/sass/sassc/0001-Remove-=
sassc_version.h-from-source-directory.patch
>>
>> diff --git a/meta/recipes-support/sass/sassc/0001-Remove-sassc_version=
.h-from-source-directory.patch b/meta/recipes-support/sass/sassc/0001-Rem=
ove-sassc_version.h-from-source-directory.patch
>> new file mode 100644
>> index 0000000000..04f42d7322
>> --- /dev/null
>> +++ b/meta/recipes-support/sass/sassc/0001-Remove-sassc_version.h-from=
-source-directory.patch
>> @@ -0,0 +1,61 @@
>> +From b5d03d5313d4cc19a7e6e9ba5fd74d1f8400cd46 Mon Sep 17 00:00:00 200=
1
>> +From: Yi Zhao <yi.zhao@windriver.com>
>> +Date: Thu, 24 Apr 2025 21:28:55 +0800
>> +Subject: [PATCH] Remove sassc_version.h from source directory
>> +
>> +The sassc_version.h should be generated from sassc_version.h.in. If t=
he
>> +build directory is out of the source directory, the sassc_version.h i=
s
>> +generated in build directory and the original sassc_version.h in sour=
ce
>> +directory is not overwritten. However, the latter is used during the
>> +build, resulting in a missing runtime version:
>> +
>> +$ sassc --version
>> +sassc: [NA]
>> +libsass: [NA]
>> +sass2scss: 1.1.1
>> +sass: 3.5
>> +
>> +Remove sassc_version.h from source directory to ensure that the
>> +sassc_version.h in build directory is used during the build.
>> +
>> +Also remove '--dirty' option from 'git describe' command line in
>> +version.sh to get rid of '-dirty' suffix from version number that
>> +was introduced with this change.
>> +
>> +Upstream-Status: Inactive-Upstream [lastcommit: 2020 lastrelease: 202=
0]
> I think this is still worth submitting upstream since the rest of the
> project is active and it may be this component hasn't needed changes
> rather than being inactive.

I will send it upstream.


Thanks,

Yi


>
> I'd note "Add a deprecation message to the readme":
>
> https://github.com/sass/sassc/pull/275/commits/0d4b8c835b79baa776a8636b=
e0cb74ed4a969d64
>
> which may mean we should look at what is using this in core and if
> changes should be made. It looks like the only user is libadwaita and
> the dependency is optional there...
>
> Cheers,
>
> Richard

