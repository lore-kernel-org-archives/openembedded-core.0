Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F90CEFC24
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 15:18:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12000.1728400680594455744
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 08:18:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=00114b8562=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4987opEl032246
	for <openembedded-core@lists.openembedded.org>; Tue, 8 Oct 2024 15:17:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 422ve8ucbd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 15:17:59 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 498FHxE2013455;
	Tue, 8 Oct 2024 15:17:59 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 422ve8ucbc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 15:17:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rZInBxBdsKw9Ijthg4gixJk4BS6cY+12zXIv3xM/75nt9UfgEWJpgxnKyG4igIjCQLbpXRa2jSyxsrVKz4D+uXBMKLREchp9xbs2VOJSpnVPg/xuCAeNds4ydMUWJ+lvjuBf8Oyr1X8c2i4hORFCFHxDSb2jSVTztQ72ijy2TdXhy94br/Dhf+OexOkZq6TJl8DIvOTKcks3VHikZT8X16jDE5Htlw7d+4gtGm+5TffSpuI0T1uBaRTd2gV0SE8vl3/TZAktwuDz94oGH3xJs9cEjpD3qMlQ8Gc9GtfmEVw8DA7hc8FBolhy/dHYgA+/0UEGV5ARL13WPcQIASaeZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZJZceTDt2/KlKGNtVd5/toSGo7kd9F/LutOa3ancIQ=;
 b=l+4v3heIdZ0+txDVC85c6uijcn6Pr0HEsjDUJ/we56+Roa4D2qM9FNj3gvOmfVY9O0sjVMJw4Umdmv/33NLYGvXKPhKFfbaFBJ7cjJWiQrMjslGAQLLgcVSXQ6gD1JQfRKQgvYDY3bjWLqopRINHgoCQiDH2U0EziWk8Z0WSDBBdY7ZsWpKKdIS2vw4jzb9DMzIoSY2B/WGqMrNvKfJ2SD21f5Yc9xvlVtmxaYpk57dBZ5ZlkYPgZoLL7QLycvtbKYDFITno4zjIWUTa7uylENQwU5J2FjMQTie7jxqG/BABP4V/FC+vf7o/o0Y15U9EctNXjt4MQ4NIH5fWFpnrgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by CH0PR11MB5268.namprd11.prod.outlook.com (2603:10b6:610:e3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 15:17:55 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 15:17:53 +0000
Message-ID: <dfe23bf3-0247-4f26-93c7-2eab26e0d408@windriver.com>
Date: Tue, 8 Oct 2024 23:17:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] kernelsrc.bbclass: Move
 virtual/kernel:do_shared_workdir to do_configure
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <cover.1727069614.git.liezhi.yang@windriver.com>
 <73daecdd8298f7cc64730877148ea11b3f113bc4.1727069614.git.liezhi.yang@windriver.com>
 <CADkTA4MjcpmOqarUHz2UnNwHZZgRtEB7c18stuuggLb+deu_Ww@mail.gmail.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <CADkTA4MjcpmOqarUHz2UnNwHZZgRtEB7c18stuuggLb+deu_Ww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI1PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::20) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|CH0PR11MB5268:EE_
X-MS-Office365-Filtering-Correlation-Id: bdf3a985-0c3d-43d7-c5c2-08dce7ac6154
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dnNLdUFiMUo3OEJTWVFqeUVxcE1BQlpSZE81L2VDeUpyYVpYekhwZHZiSnF4?=
 =?utf-8?B?RlE5YzVVZ2pkUlQvOTNmcjZrQW1rZzhpWmRRYkN3WlNCcEs5RGNTUHExdXp0?=
 =?utf-8?B?cEVFamNMaWU5VEtsVXZ1c2ttTUplVzlCdnBmSzZMWVAyckdWU1V0QnlsVEhF?=
 =?utf-8?B?Qi9XL2ZmaGo5UnFRbFhjYW56Z3hwcExXQXFaWnI1OU01c0FUMVBPdVVlNVlp?=
 =?utf-8?B?RmFwNTZ2NjhPTWxlSmdOV0NCWWd6aTB3RmUzaDdXRlF3ZUtZbHV3K2ZYbkNv?=
 =?utf-8?B?eTVEcFFTRWdwcFR2d0xlVC9zd2NmWjc1Q3EwMW1zVHU2N1E2Wm1vMWsrb2ZI?=
 =?utf-8?B?ZUo1ZzRzUTA2UU5zcGp5dXlxUE90MzhaMGRnZFJYYnF0Y1FPNzlieFM1RVhu?=
 =?utf-8?B?TjR3WERhUXY0RVhyOVNHMWliTncrazRKazNOQkhDTkZVUllBVG9SVWJwTlpB?=
 =?utf-8?B?R09GQXU0RkZJQVh4Q1FGR2pnNG9RckJoajE2d0lvV1p6WXZEelFNM1g1OUhO?=
 =?utf-8?B?cVh4TEYzVGl4NTJuelY4VkFxVVI0SVJiNUtIazJWR1liZ08vZHZxTUFTOWVK?=
 =?utf-8?B?aUQ0d1llZnJQcW9aNmNtY2JISEFhbTQ5bUVLTC84RFVKZ25ZeGoreXRzWE9J?=
 =?utf-8?B?ZCtnNXRidnMzYVFRRVhyOGlCVFVKdmJTL2tnNXlLcjBTRTZYN3FZbDdMS3VQ?=
 =?utf-8?B?RlNyZXliQi9iMXA1MHNYK1BEYnhHbnMzK29tNWZ4ekJkblhuS2hlTzViNmlq?=
 =?utf-8?B?OU9uYU1ha3o2cG81Mlowd001bHhpckh2R3Vycmtadlh1SXZHMkZGL3dIcU4w?=
 =?utf-8?B?d1llQ0RDS01KSVJYclp1TVYwc2l2UHpVRDMraUJTT0J4aEtqTzQzL0tMcUgv?=
 =?utf-8?B?eWQvM2U0V2p6NVVDWS8zUmNkQ0NnWTVFUlZ2bGRMNTMvR3VLTGFaSisxRVRv?=
 =?utf-8?B?NEFKYkRHN3VzK1FUdGNXaEZGbit6eTFhOElSZ2RZdHNqbkZldmluTnhERHEy?=
 =?utf-8?B?OUpSVG5XYnRGdDBhR0ZJbkpkdldjUkpTYTUrZDJHTW5ha0lxZGR1NTRjQUlD?=
 =?utf-8?B?ekd2QXdoeHNoUVdYV3IzS0E1NThDU0lxT3NSa0pweHoyTzFXVjFiK0J2NWJI?=
 =?utf-8?B?ejEwMlZNNE5mcHJCSEFwNU5GT3VBcmVrNGVoNmtLQlU0YUN0eXhpa2hURHRu?=
 =?utf-8?B?MmNLdThkaVBzb1liTGRaRTRSZTRFMll5enF6alNZVjRLZVdqWlFDbm9sV1kv?=
 =?utf-8?B?L2ZVTDhqVXBFeTh1QmFKT3ZuSitaVXlZNHVRbXNYVmpsaWJIZlZMM2tWb3Az?=
 =?utf-8?B?Y28vR2tLT09mYlIxWEs1eXBZNVZ6bUdTS0xZYXlNVzgrcEN4dzczQy9mQy9U?=
 =?utf-8?B?Nms5am5BMFpGWEwvK1FoczhNaXlIWEYxcVc0U1BCMFdoemFwK1hTMnhlMzdl?=
 =?utf-8?B?LzlOeWpQdERNTnNCdHg0Yy9vZThpNHcraUpUT0RDdHFsb2Jqb0YwOWJLQWw0?=
 =?utf-8?B?OTZwOHJ1SHJDZEd6emdjK1JaUzRSb2RzWUdhb1NhZEZYZEVaVjJuMW9FMG9u?=
 =?utf-8?B?S09MN2ZDZmptNWkrWmNJcm10b1FVZ1FEdTNySmNnYVhVR29VQ2VvNGZrOGQx?=
 =?utf-8?Q?OSPxIHLcMcM5zUyQ1CStnkJfcSZQ9qRrljlKZmQJf4jE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WWVVbHJxa1hySHNSZlJ1MElCdktsbGpHcUl2OFlQMjEveVJBQmh0SU5KbUMz?=
 =?utf-8?B?STYxeERFcndxWFk2TGdXbVd0d0tqeXdEMnI2eWhuQzZac0w1Ykd5MUlDRjhZ?=
 =?utf-8?B?bjVHN1lYTTVvVlM0TjB5c29WN201UEoyQU9rTkdnSUYwa1NsMjZxN2w4WVdr?=
 =?utf-8?B?SHhoRE4vUUR5L3JuU3BldTlUMXZNSFFCZE1jTVpaYzhlV0hocmNLcmIvRHNl?=
 =?utf-8?B?K2V6aG5Bck1YLzVqVGpacFJGczVSbnM2enlCazNWdFJNMjBCa2JKZ25jakJ0?=
 =?utf-8?B?dFJhaHBQamplOXR1MEpiYTBPNVF4ZVkxd3NGUnV0U2NFcjFDaEFpOWthS2F5?=
 =?utf-8?B?bkhkRzdoN1FMWTB2bjIwZFQ3SG51S2I5clVRSFVMU3YrWXBzQ1VzUStOaEps?=
 =?utf-8?B?UUttVFZHOWU4a0czZGxCSFJ5bUJOREJOV2hDQjMxSzB3Q01EVlJEMEoyUzlh?=
 =?utf-8?B?dlFTN3pzeHhuQmZXTlFhbnpObDlzdEVXS213QWJBd2J0T1FHVkhJVlEyWDFV?=
 =?utf-8?B?am1lOVhiMWNRNXlzUmpzQ3ZKMFdQS3J2R3RpKzhnOHpJV0RkaHJoYlR2dmhq?=
 =?utf-8?B?eW5FZWs4aGRuUWlLVHRLdzY5Zm1zZE9mNGU1ZUU4cWh5aHVYMU80enpCMGpx?=
 =?utf-8?B?SXc2L0lBR2tlMzA1eCtoZEdBakpzeWpjYjNKQkxBZE9SbHk4NFJiR0JWZVpW?=
 =?utf-8?B?S1J0cDNOdmlXby91ZGRYM1NnWFhSMGVpNm9GRXNIVUl4eCtOYXkxSDBrTDZw?=
 =?utf-8?B?RTdLV0g5bFFpeENoY0ZkVGY3UW1JL2RtT0hTa08rN3J4SlhPKy9sVklHYjZL?=
 =?utf-8?B?NmJkdVUrdWJ3ZVpMRDhIczVPNFRsU05QbVVLaTZ4Y0Jodm8zSHdCVnVaenp1?=
 =?utf-8?B?ck1XUnl5UVdSVzJGSElIVEF6ODR3ekNrZk4yaHRFMzJSWTliMW02YzlHaTNp?=
 =?utf-8?B?N29zZXFVUWRQRmR4VmxuTUtvL1Nxc1BGbXBTZUZTZjlpc0sxNUFWQlFKd296?=
 =?utf-8?B?cTNmZVdvWlVqeWZCR1Z5WVpaaUMzejI0NEpZcnFSb3pzY2ZOajV2dUppZTI1?=
 =?utf-8?B?YnJHTERMdHJEOXZWajJNYzRHck1ZZmcxUmVqUVJwd3dMUWNQc2lVTWZOYmll?=
 =?utf-8?B?THRKMitEcEUrTmxyNG1YVDdaSkFqcmVIangzVFJ1TURQVlNLb0JjL0NKNW51?=
 =?utf-8?B?bEptS3VlOG5jUVltaXozODB6anhvRC9Say9sbk0xZG1ER0xTby95SWVtYzBp?=
 =?utf-8?B?K0NseU9IRS9sTGtZaXlwR3o4SE1iM2NUZ2h6dE0wZ2VETVZ6cW4vNjhlU3Zv?=
 =?utf-8?B?eFBEdHowRXdaY0NGSkpROEQwN0h4V3lpei9aZHJIbWZFNUFtQjRyai9UZWFR?=
 =?utf-8?B?bE5ZZFd2RjkyZUh4MlNsbC9GNWlMa3VQQzNoN3NUVlBWNUIrOXBpS0FIMWt2?=
 =?utf-8?B?dnJ6YTlSMGlMWFJReEZMTklKemE4MVdkbnRodHQ3b3NTRWRCRWsxamxyZ2pa?=
 =?utf-8?B?K0s1akFBTDd2Y1JORXI2dkNCaWtpYXpWVXg1SDRoM1lHTVNaTEZOSms2cTM3?=
 =?utf-8?B?bmxNV1NwMXpXNEd3VTd2Qm12UUxPVms5VnM3OUkybTdOcjhaSElwVTBUL093?=
 =?utf-8?B?cCszeTF1Uk4ydTA5c2pJUWp2N3krc2FMQkkwdHdERTJoM1ZIMytIVGhnZEJt?=
 =?utf-8?B?ZU5aTm5nWllFbTN1a3luanZyZmtla1ppTXhRc2p4cXJramYvam9DeENDT1po?=
 =?utf-8?B?c01Vblp1RUVCeVBObGxVU3AwdUxRc3FyMGN0UTVXQU90WDJFYndtMjV2YkU3?=
 =?utf-8?B?bEw3Q2M3cjVhelc3djFBT3A2NEdEWkhZN09uZVZCTzFKTnhrenJHSm5ld3cx?=
 =?utf-8?B?eDYyZWtOdWh4N29QY3BzN1dDUmt3aUhqcDZ5bWppbFcrazl5V09jNGJxVm5Q?=
 =?utf-8?B?R0FJV1BER05aU3IvVTB1NUJBUGVPOU90ODhOcURnVGlvWXlSUW5uOXFHNTYv?=
 =?utf-8?B?UFpPbGU4UXFLbTFJSHk3eUVXTytyWU1hM3NPQlpQcGhEcmVOOXVOSzdvbGov?=
 =?utf-8?B?dDNNSEhveStyZ3JhRGdTVEd6eWcxS0lpOTNPMitRbC8yQkdvSjN3elZQREJT?=
 =?utf-8?B?b0NqU3U2VTF3eFFLK24xUGwxbDVnY2o2YUtOSVR0TmtjMVlteHF3YzRQcS9s?=
 =?utf-8?B?NFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf3a985-0c3d-43d7-c5c2-08dce7ac6154
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 15:17:53.6462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yDWJ+9FMIw4N0NGLp5/7MTzFiaaSOlfU2qnSVdXpLXLwqbqTWEX8/+0jLgKoNgB9m5XTn+A+VgiwLaiTXbQtvb6NtSDQMePhO+e4uZ+ZgRk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5268
X-Authority-Analysis: v=2.4 cv=CPp4XgrD c=1 sm=1 tr=0 ts=67054d27 cx=c_pps a=LxkDbUgDkQmSfly3BTNqMw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=AO5g9t0AkZibQdmkPT8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 1T7gYzImmJglzoYwD7q5r1IdyEuCCrVt
X-Proofpoint-GUID: VV3ErWbjWQEImfjxNx_IQ3ZctxeaWtaQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-08_13,2024-10-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 impostorscore=0
 suspectscore=0 phishscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2409260000
 definitions=main-2410080096
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4987opEl032246
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 15:18:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205293

Hi Bruce,

Sorry for the late reply, I just came back from holiday,

On 10/1/24 22:42, Bruce Ashfield wrote:
> On Mon, Sep 23, 2024 at 1:34=E2=80=AFAM Robert Yang via lists.openembed=
ded.org
> <liezhi.yang=3Dwindriver.com@lists.openembedded.org> wrote:
>>
>> From: Robert Yang <liezhi.yang@windriver.com>
>>
>> The do_shared_workdir populates build artifacts to
>> work-shared/${MACHINE}/kernel-build-artifacts, which isn't useful for =
do_patch,
>> make do_patch depend on it will make a lot of recipes compiling which =
makes
>> world's do_patch very slow, e.g.:
>>
>> Download sources locally:
>> $ bitbake world --runall=3Dfetch
>>
>> * Before the patch:
>> $ rm -fr sstate-cache/ tmp/; time bitbake world --runall=3Dpatch
>> real    23m31.739s
>> user    0m25.086s
>> sys     0m4.630s
>>
>> * Now
>> $ rm -fr sstate-cache/ tmp/; time bitbake world --runall=3Dpatch
>> real    12m25.650s
>> user    0m35.641s
>> sys     0m5.699s
>=20
> The motivation for why this is a priority should be included in
> the commit message. It helps us decide if any issues this may
> trigger are worth the risk.
>=20
> I assume you are doing some sort of source archiving, or
> licensing and all you care about is the patched source
> for this, and not any potentially generated files from the
> build(s) ?

Yes, I'm trying to collect the patched sources for ip scanning, and there=
 are a
lot of do_compile tasks are running when run --runall=3Dpatch which looks=
 strange.

>=20
> See below for why I ask.
>=20
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/classes-recipe/kernelsrc.bbclass | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes-recipe/kernelsrc.bbclass b/meta/classes-reci=
pe/kernelsrc.bbclass
>> index ecb02dc9edc..f23a1e6bff2 100644
>> --- a/meta/classes-recipe/kernelsrc.bbclass
>> +++ b/meta/classes-recipe/kernelsrc.bbclass
>> @@ -7,8 +7,8 @@
>>   S =3D "${STAGING_KERNEL_DIR}"
>>   deltask do_fetch
>>   deltask do_unpack
>> -do_patch[depends] +=3D "virtual/kernel:do_shared_workdir"
>>   do_patch[noexec] =3D "1"
>> +do_configure[depends] +=3D "virtual/kernel:do_shared_workdir"
>=20
>>From what I can see (bitbake expansion and dependency experts
> can feel free to correct the below):
>=20
> There's already an issue with the KERNEL_VERSION / LOCAL_VERSION
> variables, in that they depend on STAGING_KERNEL_BUILDDIR, which
> is populated from the do_shared_workdir. We are moving that population
> later / to a different task with this patch, so those variables are now=
 going to
> be defined at a different point in the build. There's potential risk in=
 that.
>=20
> Looking at the routines get_kernel* that the variables are using, they
> gracefully return None if the file doesn't exist, so the question is ..=
 would
> an impacted user of the variables notice a potential issue ?

Maybe we should make get_kernel_* report errors rather than None?

// Robert

>=20
> One wonders if they shouldn't just propagate the exception to the calle=
r
> so it could be dealt with, and harder to ignore.
>=20
> So while it does speed up do_patch, there is a behaviour change in
> when the variables are going to be valid/defined.
>=20
> Bruce
>=20
>>   do_package[depends] +=3D "virtual/kernel:do_populate_sysroot"
>>   KERNEL_VERSION =3D "${@get_kernelversion_file("${STAGING_KERNEL_BUIL=
DDIR}")}"
>>   LOCAL_VERSION =3D "${@get_kernellocalversion_file("${STAGING_KERNEL_=
BUILDDIR}")}"
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#204794): https://lists.openembedded.org/g/openembe=
dded-core/message/204794
>> Mute This Topic: https://lists.openembedded.org/mt/108603063/1050810
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>=20
>=20

