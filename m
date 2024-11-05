Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8336DD12689
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 11:17:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.15360.1730805438160637661
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 03:17:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1039ed3882=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A55awK9007158
	for <openembedded-core@lists.openembedded.org>; Tue, 5 Nov 2024 11:17:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42n9a0jwsy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 11:17:17 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4A5BD9Xw013880
	for <openembedded-core@lists.openembedded.org>; Tue, 5 Nov 2024 11:17:16 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42n9a0jwsx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 11:17:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XhBO9JFkTsEWEfHoE2O753x/XuZAizN3RIuMBf70FHljnwEjo+JvIocsdJkpp51bT+m4glwgp+9T7pfMTNcgM4MmRpihaa32HefVPyAiTZplbsjlHFivOIN4tipO4keb0eOyL/jOanNJNiCs86qK6fjGovdTmP7sW+bj1y0mM7KqVHD79MwzmSukB7uVws6SvB+FeDB0alL8UDRF+Tl0YUrm/I0KtyrC6JWGA98VPWOUc47kSmSAY1L/2/QtD0mh3vcyBHwV4kXngIpecFS7f5tf+KXMVBBLkustikJEPDs/wLLh11IvJbkJ8oKTK5JUYW7Y22k/6xB2oEUml/zoWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ROiwXmoqA992f0aYT6d1YVJNyVVyq/lHoQOUKjNKgE=;
 b=a9GOYMZvRJQSzjX5EElVmlFhpkCHexLrdpHfOcbPmdWCMjTD291iSVRomSiXGBEmc83hS5jNTKaQWX0mFTnit/TWZCNSIIEVRhywEJYAFyrJZdb7VosF35wljikCl5Tzh9KZ73BBKlRa3t1yVwiZ1dDK9PCY2fO77kZZYo+vuMh1wr/qBWgsl5LvZ/CXEtTzNA+ztMtLBWzZd2H7m6s8vKCrfN0LSOcAXvYorVISPCZ8J9igL8+h2YDwzV5Szh5BPqJR0AaqensFYW6WNyaybUZ06OCwDLUcbGjEIGa1Ywswez1vzYkHIeMx9FQa7/+7JegnBsiPuwfzdXGJ/3Jerw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by MW4PR11MB5773.namprd11.prod.outlook.com (2603:10b6:303:180::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 11:17:12 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%4]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 11:17:11 +0000
Message-ID: <a860afd3-6fb0-46ae-bb67-63d29050f605@windriver.com>
Date: Tue, 5 Nov 2024 19:17:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] nfs-utils: 2.7.1 -> 2.8.1
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <cover.1730732225.git.liezhi.yang@windriver.com>
 <ec364dc24b0f05d9ab9086f77dd50f37175e9be9.1730732225.git.liezhi.yang@windriver.com>
 <F21B89BD-5291-4D98-AB27-5DB54FEFFAA6@arm.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <F21B89BD-5291-4D98-AB27-5DB54FEFFAA6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0107.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::9) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|MW4PR11MB5773:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d8b19ae-8826-4e81-51e9-08dcfd8b64de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VmJpVDlzSzgwV0FqbWRjZ3VjcHVlUGV2dnZMclVZNk9QemQvZytXa0MvZDlj?=
 =?utf-8?B?a0F4L0lQS043eExvK3lvVzhuMnBGUWY0ZmxzTTVzL1FRRWQ4V0c3V3ZJYVIx?=
 =?utf-8?B?QnBWV3pNSDAxWUFTYjVzaGZ6anlJSWxMTFVaZWROSkMwajJINVd1N2V6c3Jz?=
 =?utf-8?B?WTlCSmVmeFJWN05UbHEyNFNFRGRFL0tobndrcHdjN3V6a0RnYUx3MVNkNmNx?=
 =?utf-8?B?WDBjRGVOVmJ4d3hjRFBNV0dISUxoQ0RhUUtqMUJnODkyNkpLeE1GeEpXWm9w?=
 =?utf-8?B?d294REZNU2hudFpIeC9zTXlwMEZ4b2tJSzJkWDRPMUYrWkFaMTkwbXQ1ZElK?=
 =?utf-8?B?aXNkaytST0dNelJjMzB0aFVjT0l1RjFVSVNGL2dVOXlLSmJqTHF6YXVkc3dh?=
 =?utf-8?B?OE5DblZLN3VDMlNDRUJOa3lqbEVFOU9TZTcrRmhzNEtVcjNMRVNMd21zWWlE?=
 =?utf-8?B?dGlmY2RrSmNtb1JzZzVmaWtKeTY1d21nVytmbllwbDFtREdyVldweWZnVkUw?=
 =?utf-8?B?Rm9FS21nYW1pcGV0dmZpdzEwM3ZORnp1djR5aG5VeEV2YXJLMGR1SmFaK3FX?=
 =?utf-8?B?eWtVVmNxZ3lVOXhnc0g1bjc5N2VzWENrRWhxZ1U0dXE0bkxkSWdZa3JBUGZM?=
 =?utf-8?B?Qy9IUmxvV1UvZVRQZUxVUTFZTkRLcFRRRW8vQjlPSjhDd2N5N3AvQVh2dVoy?=
 =?utf-8?B?Nk05UUNVL3lHYVI1R3VmZ1JXbkdiZkp6TGtFMEdJZ1pHVmpablJLQm5DMkw1?=
 =?utf-8?B?T0FNbW1FcTdOU1ZwWU5pNmFIZFpaN2ZvUFZZc1NlWkQyb0V4VG8vY2poV3JQ?=
 =?utf-8?B?TnBDWXkzdExnVHR3cmJTV3NEdGdXOEhUcy9LR2RWRUYvTDJTTzNQeE12ZkE4?=
 =?utf-8?B?NlVFV25MTHl0Q1U4T0R1NWRHTzdWRFNPZ05CQlJIbTB1OEplSi9BQWFnYjFD?=
 =?utf-8?B?THZlN1Q3VkFXWHR6OS9GOXNkNDhMYTUxcDJEMi9hcWFuMXI3cThPYXVibThy?=
 =?utf-8?B?YWhiSUVKM21YRktjYzlreFRFYjdseTJHVitDVzR6N1Vua1pvY3JZbFF2T0Vk?=
 =?utf-8?B?aXAzSGtpd1RMZG5rRlNBNkdTNWJJT3dSRmMwS3hDMVh4cGdGL1lrdmVJQ1Va?=
 =?utf-8?B?b3loK3VLekwwQWVkeW9HaXRUNWdicUhiSlpWSzhsSVpxeWdzeGlvUmFOMzVr?=
 =?utf-8?B?QmYxMEduaWFNL2dNTTE2TWM3bmlYeTZIM2Q1Q1Jkbis3SG5nVVREVmo4b2ZR?=
 =?utf-8?B?eWZoSWM4aHljNjgwVDRDVlBJU29wNW5oNXYwM3VlckY5bDc0ZXJxSi9lOFR4?=
 =?utf-8?B?M2tUZndvZzlzalhrdUh2R1REb2x5clgweU9OeUh4Zk5BYm04dWlSV3RhQ0NV?=
 =?utf-8?B?eXpIeVlDVDZsRkJ1eE9qeUtiOVF4d0ZsY3FVZ2UzS3BmbGZTY2VqWjYvSGdC?=
 =?utf-8?B?Z1djOG1DcEt6UFNqaHQ0TUcxQ1RubFhqS3NWQkpwZ0diNm5pMFlhWldQQUpw?=
 =?utf-8?B?dGxKTVByM1NmZmFTKzNBWnZBZllNVU1rajRFeXFjWHhETkRXNEpvOEZ3NGkw?=
 =?utf-8?B?Ui9SMTRBZmQ4ZHhhVjdGbUNCZWlrZ1Z4VkRkS0poNWhzYkRadHZ2UWVKeDZ6?=
 =?utf-8?B?ZlUwemVmblkrc2pER2ZIMTFYRHY1TGdVdi9Yb1JxRTlMUzhrYTUwY25kN21E?=
 =?utf-8?B?WExoRWZIYzBycFpKZnh0dk5JalV1ZEVleDNTWUU3M2N6S3dab29UMjNwN014?=
 =?utf-8?Q?XP/s2zeOqnT3aU0JoOQllfZea0SGQ1VciYPrszV?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MjRGZFY1cXFiNXoxTUZ2V1lGMzQ1aFArdE1KWGhWMjVXOG9HMjFKMXBLL1R5?=
 =?utf-8?B?blpTUktoZGVUMlhUR1lVekZnUnBmUXRrQmV5NHMzb3pFWGFGRGVNUkVENDVq?=
 =?utf-8?B?VW9FZy9POEFjUllQdThXYUh1NzVTYWtVNXg5c3FmTEl3NDZQeFRMRkh1UUNt?=
 =?utf-8?B?eURYS3BMTHljSDVmOUpRTFV6NkZuTVplRkswNDFNQzM5enJHTS8vMnpNanpG?=
 =?utf-8?B?YlFKTEhSWGFpbklCbFIzWXVFYytOOHlta1JjK1JKWkZoQjVmUlJoMFpBOWVa?=
 =?utf-8?B?L3pmQ3UrRnRXVnhGTk55T2JrVmV6RWRlMVIxMWVoZ1RORUVwWGZKQ0pWQ1B6?=
 =?utf-8?B?L1BQWFZXUXY0QzlGUUhhWTdLWlJId3lEWEtyQlBIeFNXanQ5UU13Vk0vZnhV?=
 =?utf-8?B?Qm9QSW85OVBtYm9TMWtQdjZ4SEtWM3FyeUlYRjV0TUlsN0VEMHNjZFRtdEFX?=
 =?utf-8?B?MEk0Q0pacC9MNEpFMHFkbVN4RkRPL0wvWGt0QkJxdjIvT3pVZlZuVGQ2SHJq?=
 =?utf-8?B?Ti9NeTBhME51TENuMElzTFg3NjRIZ2tmbWIzVDhZcEh4dk54bzE2bUV4dzBD?=
 =?utf-8?B?MGZvMnJnRksycHFJK0c3a2Q1MzE0c0tjbmd4NDJOMXYrUDFjRW9lNEVGWEFa?=
 =?utf-8?B?T3JpTGVSOGlCRUhMQk9mOXFiTm81NU1SMGZzQm55Y3U2R1crMWZubElhMXg5?=
 =?utf-8?B?QTlHZlBYalBaRStlZGdlVGs2TEpGekpJZ0xVSGF2ZUhZTFVYSkFGRjMvcUxv?=
 =?utf-8?B?UEdNMEZqbDlJWkpic3BzcUE2RDMwTlVMSjlDNFNaS2xZdVdHUWw5bnV0WGZL?=
 =?utf-8?B?QUJ0bDkzZXRDRjJOWXFZYk5rYm9NSW9la2thSFpCZVNyVENlTFJNRy82OXpG?=
 =?utf-8?B?TWxGcnZPVTFWRUw5M2lDWjRoZ1AxQUZvZW1CRFc1RWdUMmc0SUpoODd1UW1K?=
 =?utf-8?B?VnRaNkNEL2FJbkgvRHI0cFNWMGp1ZW4rN2lKR05uMXMzNUJyUjcwWW4yM0Jp?=
 =?utf-8?B?VExUQ0lLM3FyaUFSeEhEZ3VqMktBV2V4eXByUVViZ3phV0VRcDYrUVRVc3hr?=
 =?utf-8?B?WVhReFlLS3JKQTBiSUM3TldUTXVmNGFjNHJQdUhpVmVhNVA2OHU2WWNLQWxl?=
 =?utf-8?B?ZGtOQlRvVkZCbzd2Ky9SbkFjeEpuekxRaU1UYVZaTHF0b0FXSStuUGpuY2NS?=
 =?utf-8?B?MEwraWZXTTFUOWZsNzlvQjdwN2wwSlJLakNuZVBkRFArcXJvWVE1Y05MbTZo?=
 =?utf-8?B?ejBQeUExZWQzaDB3NDE2Wk5WZk9yOFJWT2U2d3NPbnI3U2RxcEFGa20wYisx?=
 =?utf-8?B?Wkw0MXpzWlZYL1JsYldzSFYvY0ZvNmd1QjFkamRQME5Rb3BNTHpTd1FRV3M0?=
 =?utf-8?B?bHN3aFRaZC8wMGJHaU9yTFZKeWJmOXJyOFRoUWxYdXhKd1FWWG1jMklDVnpV?=
 =?utf-8?B?TXl4ZWFZSTNEZXNxdlBMeEhFZUp6Q2lRbjI2dXZjbWVWTCtwYVNBeTRyUHpk?=
 =?utf-8?B?SmdOWVA5KzJyTGJsMVphQ1JtK2dEWEJZcUpybGxBNHI2ZmhNTzAzK25LYVNK?=
 =?utf-8?B?OXdqdExDbG1DWWNJMit2QnF1clJVQkFLa3I1bCtNY0w3OEtRc1hyd2h3Wisx?=
 =?utf-8?B?SENSNzMzYmtOMVJkVU5nSWhFU0QybitqUGdVVUNXUjJIVzdiMHVBRzU0OWY0?=
 =?utf-8?B?a3RjdUUyNTZ1bVhHbGdrZjJVVWk4bW5TY2N2VlpSMytwSjU4Zmg5R2tjMUt5?=
 =?utf-8?B?YmlJTUcvdG9FUUszNFJVZDZaTzBlcUdLSHpYS0JwQWc5cTROckNLKzJlK3ZE?=
 =?utf-8?B?ZU5vSlJNNlhUaG5CVHhEYmp3ZE9lMlRGaEhqaGlzNkRHTEdDSnE5WG03aWFZ?=
 =?utf-8?B?SkExWVJJenpNZXdHcDRhdXFmWlkvYit6dFZ4MzhGbzYyM2hxQVV5ckVGazhN?=
 =?utf-8?B?NGxuWHFDMGFMTml1bEtZZVM5enV6d1BFamNjeWhTM2RkVm9pWkpYNGdEaEVU?=
 =?utf-8?B?UnhaODlmWW1WK1V0aE9CMlJuYzN3cnhSUi9hZEpRcG5PanR1WlA5UHZKTG9T?=
 =?utf-8?B?WngwOVBiNDdPdEsvTmtyTElPbTNmcktLNkFtQ0QrcnlzRGt4UkJ2NEhQUndO?=
 =?utf-8?B?Slgvb01qTG1nVDlWeFRJYnVDQys5QWxzOG91Smxwd00vMDJrdGlwYlJ2bFVp?=
 =?utf-8?B?Ymc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d8b19ae-8826-4e81-51e9-08dcfd8b64de
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 11:17:11.5048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EiM8EMsln4+b4WhifZAp4ovqU2VHBtEMLuh7h9yOJpL90PU2EbSIdWo/s3E1Jwq2IO2ik40nCqF0rdE3jrZLBV8siQ4YLDtgtdTrLmy/0/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5773
X-Authority-Analysis: v=2.4 cv=H7mJwPYi c=1 sm=1 tr=0 ts=6729febd cx=c_pps a=nskeBUqQUen4dZUz4TdP1w==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=S3jTHfkfTbSiyIag6nEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=0lgtpPvCYYIA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: 9LmYo16RRX1OOOq9dWecGXOdjVBMhOxe
X-Proofpoint-GUID: BnBLh7fLghlDqWlYZSJKbtZmKY8rwSud
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-05_03,2024-11-05_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=482 malwarescore=0 adultscore=0 mlxscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411050086
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4A55awK9007158
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 11:17:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206702



On 11/5/24 19:14, Ross Burton wrote:
> On 4 Nov 2024, at 14:58, Robert Yang via lists.openembedded.org <liezhi=
.yang=3Dwindriver.com@lists.openembedded.org> wrote:
>> +PACKAGECONFIG[nfsdctl] =3D "--enable-nfsdctl,--disable-nfsdctl,libnl,=
readline=E2=80=9D
>=20
> Is readline meant to be a runtime dependency?  I=E2=80=99d expect it to=
 link to the library so the dependency would be automatically generated. =
Is this a typo and it=E2=80=99s meant to be a build-time dependency, or d=
oes it do something unusual that means it needs an explicit runtime depen=
dency?

Ah, sorry, it's a build dependency, I will send a V2 for it.

// Robert

>=20
> Thanks,
> Ross
>=20

