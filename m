Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDDE5D41156
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 09:59:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32182.1768471184946895997
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 01:59:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qK8Ut90W;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5475b384d2=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F5oCXn1036431
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 09:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=zxx5Dui6MkKlTNxJkdnfZnWQ7qOhhG/DyqT5w9zTeCs=; b=
	qK8Ut90WtvckOW2kRpbgG0xG7X4wH+CKMn8Pw2b1nHAO/sR7a/Lv1x34DJ6gn27T
	bNBMAij3jseuuwzaczCyEKNuFYUTV6V8deANhx3o6wovR/TBxoySlc1gDsz4WpGl
	PmsxNLAchwHQV3rqXvRhjqJzHgI+413+nvLGq44yyJbzbhxNSpfELTISnlyE9nb+
	m4Hto4hD2ruBxdtli+nkZAO4Zod+2ShmNO+lbAtOT/cdTE+yonhuzbIx/iP0OXOb
	pQATLKaDvbUvQIVzDNKwHkH41NgOMwJSEiBEfaoVTQT5QDbb5Wmbkp0AlIMuWJAK
	yMHBeR1NxLkAritFI4FsSQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011058.outbound.protection.outlook.com [40.107.208.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkdr2npnm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 09:59:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NsxfpBZo/b6SecEhvXrkMazN1cNh7xWGJYCFRV+HnMKU4LD+2/2aNs/PMqncCLKfckPXW6uh8mr4OE1N89kcX7kl6JHBve6tZ9PdiiiIdRNGKUuV2XZ7UlJX0T57hPyar4jJX18HGUZnkdZ0GPQtpjxmYuJ2L+4+Q4BEKEkF9caEie2vzM/THiJqyeiEV0AyycYgMsp+fKeq3m92MvT2Q/8D8av3fsZxi1kvM3hPK8Bxi7YRlrdJ3plI7HdwvQunRzmssXNwNA8TCHC4Gshp7mZx9ERcEiMLjtyg4FNOry5Y82ddF8EPrTLH0F/pYOCQn/YDwIsSdzz2Wddl+y7OZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zxx5Dui6MkKlTNxJkdnfZnWQ7qOhhG/DyqT5w9zTeCs=;
 b=ArxVjMf0nu5AtBhCPkg3jAOkPqiafaydKKrK5oUQUUSZVhxJNHOocMI6Pgc95JA9Xws1hZhq4Q2IcO39ypaP08POUM9YizrvAf5ZfGD5Wy+pnWRPLUg252c77a0GpRrbl/ezDQq/NUVMBZizIaiyfHKwJaf6BsZia3Xwf4Sxfz6Rf4uUiqQLHuvG7XnzuT6gofYMu8/ekj+MRZhNhxoYpjX9NdYtf2uj9V8hluz0EFWT86xWI6Caex3BP1ufRXZrX7U+7enaT3+H7858M04pimiFp9X3X+gY7Qz9Upu2ztT2bBjpz3P7fWzj3vtDzjaHsufnQUhVIhwj0u0oOr3+Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by LV3PR11MB8457.namprd11.prod.outlook.com (2603:10b6:408:1b7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 09:59:40 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%5]) with mapi id 15.20.9520.003; Thu, 15 Jan 2026
 09:59:40 +0000
Message-ID: <e94a5ab8-88fd-457c-8130-8b738895787c@windriver.com>
Date: Thu, 15 Jan 2026 17:59:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] rpm: 4.20.1 -> 6.0.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <cover.1768469892.git.liezhi.yang@windriver.com>
 <f69b7f8ddf584c045a6fa168f6add2850519e410.1768469892.git.liezhi.yang@windriver.com>
 <CANNYZj-C+1htk4XR-uaSbsCw8OwE-bskmucyw0qLkD4TnNDbTQ@mail.gmail.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <CANNYZj-C+1htk4XR-uaSbsCw8OwE-bskmucyw0qLkD4TnNDbTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0174.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::13) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|LV3PR11MB8457:EE_
X-MS-Office365-Filtering-Correlation-Id: 82463ac2-378a-4891-18d2-08de541cccd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bThXaFByNDRYM3p1aU1HVzlTTmwyTmI3bUFTNUtVREdJUTlaUzZ1NFkzTHE3?=
 =?utf-8?B?TDd0UW5VZit5QlZvMy9DVWNxTldEQ2dpVFdBVWFlbHFxRTkyNnpjM1dKaEpO?=
 =?utf-8?B?TWExNWF6eHp4SFlMejl3eGdMZ1F2TVZEeWJJK0ltVitrcjZSOXdNdjdnaVZR?=
 =?utf-8?B?ZThBRnZ4RkNWcWZxeXFLQjN4Y0l6enZZWlo5NW9kZEZYRlpMRTZXMXhKckMy?=
 =?utf-8?B?dG9ieFpQRVR3RURreUNsamo5a3ZNVXB2QS9nMlZFdjVyS1F4UjdaMTJtYXpp?=
 =?utf-8?B?YWw2bDdCcEh2OGhrdEVIVjR2WnhXT1lXYVdvbUI2WnBhOVRsN0M2aHpaelYv?=
 =?utf-8?B?WFhtNWY0dlhWOFQ5MzJpcjNjeTJxcEFmUXE1ZXUyMVpHNzQyclNiaTNXMkhY?=
 =?utf-8?B?ZmRkU0ZxQVV2SDZTaHFFZHE0Ny95RXhzdWc1S0syQ0dVT3E1VCtFSHhzdUMz?=
 =?utf-8?B?RVJ1RlQ2VStKOUlmWkhUdHE5bjNHeUc1VmQ4alBUcDgvdlhjMXFzY0ZLTHpQ?=
 =?utf-8?B?ZHBqbjdEVm1CNVJ4dy9LRXA5eGFUWVZPQ0RqUXF1S1dRZ1Jpdlp0SDNuek1B?=
 =?utf-8?B?S2J4QjVOU2VJSGp5ZzZvQjZqS2xObUdOYnNSUjNUaWVzdjZoenlmWXQvdVZI?=
 =?utf-8?B?OGEyL1FsZDhwQ1lPUzE0aUhyRkNQeFFJUzJxUGFNRFRSYmlwc2lkdFhNaXVk?=
 =?utf-8?B?VmUzT29NYzJkTkdMdnJXYVFja09JQUhGb1htZ0VzVUduZVJQUFg2aWRnYW9r?=
 =?utf-8?B?NStWZ1d6VWZpWjFYYmR0bGhSTDVhVCswaVN2WTBPaGJwNElYMXowRkxUUU1m?=
 =?utf-8?B?NS9jMW02YjMwTFFXeG5za2pUR2hLTk9lT0VGR0s2eGVSaTRlK2tzRnA3MWR6?=
 =?utf-8?B?M1lzOUl5NEd3NEkvaUEwRU1kV2YvdXdKQXVub3ozMHI4Ump3a0x4WDF1WjBC?=
 =?utf-8?B?bmpTdzF0azc3aTNJU3R1KzhMRnpLaUFCMEFjRnc3OVY1bS9ZL3BtK3ZEVlhT?=
 =?utf-8?B?eXY4NVNaY1BqN09CMzRxd1BZTmZ1V3BmQWNPaWJkK3grVG5rVHM4eUFucGRl?=
 =?utf-8?B?WEFPdXY5UkhuTWtGSU5La211c2UzVmtzZDhWaFBJZTFQOEgzQkpVb0p6RjJS?=
 =?utf-8?B?bG5JbUp1by9NVXJVbkVCc1hwUHJSd2N2NUNEYjhUeEpSY0I2a0RrQzEvQXE3?=
 =?utf-8?B?WXU3Ujl5R1dQUWR0TDVHYXR6T3B5Q0U5cVkxeWM4OEtFdi96anRiR2c4ZjFK?=
 =?utf-8?B?WjZ0WWlGVFNhdmxXeWF5bzJZKyswMzZTZzFDaEQwM0VJVzN6S1BZSGsraGhX?=
 =?utf-8?B?cHIzd0tFUVAvdW5BZFo0Zk1VODdhMU1LbjZyajdZV2pXc2hNdlZXVnhVMkFu?=
 =?utf-8?B?WDNrNXVuK0cxSmRseFEwNkVGb3g0STE1bFdJZ21WZi9YS0R6MU1FRjdiMDRJ?=
 =?utf-8?B?SUZsNTVkeEw4blg0YVk5elBXNjhMa050OUYrcW1JOFN5VUhRYkNMVGNKTE5N?=
 =?utf-8?B?U0NRUTJjZUQ1bGVIdlhlVmpuU1JVQWVKZXlkb2tWTy9SZmJJVFNQODRvOHhT?=
 =?utf-8?B?aVBpL1EyelF2VVFOTzFmUFhCOUg1SlJTWlNYWGNTdkZIdWhma0s5bkxZZ2hm?=
 =?utf-8?B?NjQ1ZGVHY1Z5VmsrODZUdkVrOS9qQU9xVmpUNXlCUUpSOGRFVnlQRForZElQ?=
 =?utf-8?B?NEpKRVoydzlIRmMzRlY1YmpRQVVKUXdpUVVkRHZqVjZ1UVVINzdjZW8zaysy?=
 =?utf-8?B?N0pvdWZ3ZFhqZXpiL2treWRDSGZWN25KS25CNjNhcDFRVnBmMzNVeWZKRmhp?=
 =?utf-8?B?c04xemw0eUJPK0lyMmFtUnRYdDltNGV3c3QvS3NHV2VSM1JxODdWRkhQVXRL?=
 =?utf-8?B?dGVIS0ZrdWU3RG5PMmhReEtaK3htY3dMTSt1V2thN3VpM1doTkc4NFZtVFEr?=
 =?utf-8?B?YmVQSEZCUkVZS2dtRU1qTkJrdHlqMTZhWXM3V0Z3cmw2bXV0Um1ESW53MlN5?=
 =?utf-8?B?d0t0bFhucUxYRktNdmtlc2cyQlljS1l6TUY3alZxc2RvWXVXZy9sdEV5QTJn?=
 =?utf-8?B?a05EdXBKYUYwaFVLVkx3QnJHdGFPSXc1MS94aGVUV2dUQ2NlUzVVUjJPRXRC?=
 =?utf-8?Q?RalM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M2t6YVo2bjJtbldITm0ySDFZY0EwMVIyenQzSWd3OFFpQW1jN0gzcFpYK2xh?=
 =?utf-8?B?QVJYaUwyRmx5RmozYWlPbWx0OG9SOXdFRWdMTndwcW9Ea053T2R4QUtWYmpR?=
 =?utf-8?B?bWZIV1RWelZHMU56QUxsOE93VFFWNjRnOWFPdjhSbnBFUml6VnhNTmpteTRT?=
 =?utf-8?B?K3RuMnBheWhrT1FiQ281ODNVcW1VMlpWd2x6R0JFT3dYTU1NbUNNS2pXdkw5?=
 =?utf-8?B?UGE4dm9FSDNScno0Yk54UzB0eXE0YisvWm1XT2ZKMjlnQ090dTY3VHd4cHdV?=
 =?utf-8?B?TWF2dkhCWmRoVklKK21aSHVWVFV2OUVSc2RQUTU0L2pUMjVFNWFEWUM1amhV?=
 =?utf-8?B?VE5yUExzTWt6SWNhUFp0M3MySDRqQW9pYStlTFg4RWNEV25FRUZDeFovMWh1?=
 =?utf-8?B?Y1RIa1B3S0lxNm1pLzJMUG9WWlBWS3BkNThHUG1qSm9qZm1kZjRVaXFXbk9V?=
 =?utf-8?B?aER0clVrb3RsRjN1NFR2WHpuejhpdVFxd0tlMk1Pd0NIanR0eXpRQUNlN3Uv?=
 =?utf-8?B?bDFWK0ZmZVNVNlBDck0vTjBHR25XRVRKemtCL0JaVW1OcTRYb255bkhFRXEy?=
 =?utf-8?B?eGZxQkFKWlo1eTBmRytjblNFdWhSNEt4QVNaeDJ6OEh0YlR3OGowbmhKOVZ4?=
 =?utf-8?B?YTB3SzBteGtEV2N1RC9JdVlqU04rbFNDbjlxVTEvRnpIWEVydXVscHBQZm4z?=
 =?utf-8?B?T2xKaHFpNjdGRXZBcUN6ZW53ZzhGbVhhVHNNRmhGTStuTVdCMkJqVVFLSGpQ?=
 =?utf-8?B?dlVoOXFmU2tXSXVUUndiL1Z3YTl6cDNIdm1JK1A0TGN3OWtaTFdUSFNmUlBx?=
 =?utf-8?B?cUV4VEcrU2tyTkpvanB0cjU2RDFVdkl2aHV4WCtDVnk1cFZDbzFnRWtLZHBo?=
 =?utf-8?B?QlpnYXRMUHFJUmNBNk5DRVMyenFoaDlkQU5nRmFNa0k4SjVHTzNDWTdUT0hl?=
 =?utf-8?B?QVZnSUg5TU8rNTlvNzNGNFRJRnd2YTNSMjBHczNseXZOSlRJZXpWdzJPNWpX?=
 =?utf-8?B?UFdReko3WGYzU1RnRm5SUlk3NHVlc0MxcEhXN0tWN2RDQkRpUkpvdmh4WVY1?=
 =?utf-8?B?UEZSdElZcFFEWTRDSzdSYmFpZmVrV1pGUmFJNTRReno0R0IwcVZlRnlZb3U0?=
 =?utf-8?B?emJnNVZ5VWdpWUxIRllEWDkydFloOElkbTFheEd4RFlUMW9QZnlHSkVlT2pm?=
 =?utf-8?B?cDZiU0R4aFJSMnFTWEV5bXFESWJuekowMGkwOHRWZDhyRUlTNDJ6U3h2TWJF?=
 =?utf-8?B?T3ZPSmliOTdpSWxYQXArc0d5d1lnWXBTUGtNYU5KOTkyR1piRm8rU3dtZ3NL?=
 =?utf-8?B?Q2hDNUdVSy9sZm93L3BKeTd3RlkwRk1yTzd5MlRNSkF2L0YvbGZDYTR4M1Yx?=
 =?utf-8?B?TzZ3Vm9pem4zUzFXMnhiQ01vUEl4RTB4emJ5dG9wLy9tLzR3Q2JyTUtWMVZo?=
 =?utf-8?B?UWFxK3dqQjZtb2ZWTktvTnR3L1BSOXJjNGZISU9TbVNlS1NWVzl5WUphaW1p?=
 =?utf-8?B?bklzWE9YNjZIY1pwTXVIdGs1aWcxZUl0WVRNNG83RVhqNzFwb0RFdUFMSVRv?=
 =?utf-8?B?UjlJbUVtQ0p2QnlBRldhVFVMaUlwdUYwc1BRL25FMlFIakkvVnZDdW9qWmd3?=
 =?utf-8?B?Y05jSWNlbHhsMTZGSjdjeG9TRDJVOUdtU1FHZnAvbzNmUE1kWnFXVXZoVFhX?=
 =?utf-8?B?YjFCck9ob1A1MmZWUHBUSVJIa1J2QWNaUS9ZY2cxK0E0dmJISExiQUNRN1Nj?=
 =?utf-8?B?TFpTNkFIYUZEM0pxQ2EvMnZ4LyszOUtXTnJoRHM0Q3BLc1RxYVV4RURSM1Y0?=
 =?utf-8?B?VUt3R1pSM0RYZXB0YUEvRDZDVGlMUUs5dGFQYngvMXdXNXBzMm54VjAyUS8y?=
 =?utf-8?B?YVplVnhpSi9kdHJoc2h2SkJZNjhyeVFCMCt2R01LeDlMcnhsT3kzdlJpR1h6?=
 =?utf-8?B?bG14OCtEd252M3BSWGpyKzFNTmxranpuWmtDYTduRjJRYXlnRWUxQktyWjhY?=
 =?utf-8?B?NjAwQzVqdXZQdTd0U3FPYWxtNWFQUWJXTlI0ZS9iSkt2WVZmTkpqTlZIU0JE?=
 =?utf-8?B?VmVSQWpGUm00YVcxeE40MzljWVZGWDZYdU1tUCtOWWpwbjB3Ui92S3kxUHdK?=
 =?utf-8?B?dzRodmgvQi9YN0JmZDd5ZUx2Mmk4MmRLTTY4M0ZsVlhNSmE0T01Zc1J3U29p?=
 =?utf-8?B?bG95K2tKNzF5R1NIblRPa0VpTE1WWHBWb1pqencvbjhGakhDYzZ2QVBZWFhO?=
 =?utf-8?B?dEZIRmpubWl3VHV4ZVg3WmlZc2xWTTAvUWxLQXpuV1MzRUNhVE5KYjhMYkJI?=
 =?utf-8?B?cERpYmtxTW9DOERHSTNGeWtlZWJqVnNEUzBXTDBvZ3dGN0ErOVNWc0t4L2hp?=
 =?utf-8?Q?p7ZK5DmjQ2kwDhpc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82463ac2-378a-4891-18d2-08de541cccd1
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 09:59:40.7726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ac26eiailhtOxIlDknysoW6WI/ZaGKbNYqxjXURUMtNKWg117tiDU9kv19hMdy4mP0PZUrw3qpTBPB1xPAPQrxKT3bP71q+Swdmk0HSejwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8457
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: G6oHlDO05rJTGIkalSCMUTjv9p8dTQhc
X-Authority-Analysis: v=2.4 cv=fLo0HJae c=1 sm=1 tr=0 ts=6968ba8f cx=c_pps
 a=EoP4yJziA5n+MzrLuL7W4g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=zpWaxEwjuG75Co8RLYYA:9
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: Q2R8zECh9IAHle68wo4BPttzm8z9Yxnd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA3MSBTYWx0ZWRfX5afulNXErp5A
 D7VA5aDKJU0AnSE/tPpUT0G837WfqDJPx1BDS7HqbBih5K/p0Ofk9+PyM24vq6nvBiF9+xqTZoA
 w1eYhd4mXxHtQ/5+Vo3j/YQ94e43pL+ee+cXOr9faYqKz8y9VhkkvEcRokNtla5vF707QeMD79g
 7HZbQPBbxegDbKw9d0kRZkX0RewOk+ixhaq/iJmJVnHSrlOQRIYcrwqZ1EXGy4+FYwMJT6qcH3Y
 19E0P46l+Xj3z6DJ7Fu+boblXs8ALT2PrGSjy39DEUWZjVBlwuCQ9sNehPLovAjL3LBmCFo1y+c
 C+uM1jWob4pxhIk+knd0xrhw0hmDkWg0jL4U3x7Nvgm4kOLe3u2SGN8KEJdiyBaQpNzDfwMi4l4
 kW4fZgXztkQzMqQ1X1cYbCRzCrJ8DznZ0+jjc3HbHk7l5DbKfYyHmHSQ1vHec74hlr/XP9dBS60
 WFo40pFFJss5TBdK61w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 09:59:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229397



On 1/15/26 17:49, Alexander Kanavin wrote:
> On Thu, 15 Jan 2026 at 10:38, Robert Yang via lists.openembedded.org
> <liezhi.yang=windriver.com@lists.openembedded.org> wrote:
>> diff --git a/meta/recipes-devtools/rpm/rpm_4.20.1.bb b/meta/recipes-devtools/rpm/rpm_6.0.1.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/rpm/rpm_4.20.1.bb
>> rename to meta/recipes-devtools/rpm/rpm_6.0.1.bb
> 
> This can't be right?

You're right, I was curious that why there wasn't errors for such an upgrade.

I checked the PV and rpm file name, both of them are changed..., but I should
update the SRCREV, I will re-do it.

// Robert

> 
> Alex


