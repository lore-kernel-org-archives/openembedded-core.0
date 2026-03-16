Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A50F53D9D
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 21:08:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61946.1773695302667791426
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 14:08:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=PEyzUNPj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75354e842b=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G7v25d2557265
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 21:08:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=U+865yy35tuxjejbcxlK1E
	2qsqlDble3RTprfV677v8=; b=PEyzUNPjREgoT9N88zN4ukqo9nSrWUacLK7gVS
	bmHXYjYrCJZonzRIYNhBvMkI99p4kLSF96bH5b0ofIesXGpfbZBmDeE/osbmYaQf
	YVeeaZA+NkPI5bL8PcYI5ppXDuBqlkdeRIwfB18m+kkHLFf9yYv0XEc+78p3d1Gl
	sBcykJ3x7r4A4mMMHm//+tXTv1EAr/2plIdblMRJjJ+QZ2X6JHkM3dxX9HwM3bfn
	MD1M56ZmC/cdDihqVb1J/hbSvuG+DWAQhQS5GVW9OvkA4rK25MLHBYfyUpGPjI5y
	PkMjfDLxxfYgALJLToN1DoPf7/UvWwhvWCXzL1NEtHwyg30Q==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012059.outbound.protection.outlook.com [40.93.195.59])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cvvvyjm1h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Mar 2026 21:08:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PTI0iXDOt2uWm0+yzZp09OiJC1ozimouVlzBqjT+DS8JUXyhjc/dKyT41YDFrCCOKi22eBT1wxJGU5zcZLO4kiXJC7jNLtehKMJXLjrztfM/RuJerj0TdzdPtus5x65CJvFh0ip0wpMOhuKwRPt6A6RxBEs2JM77OU+mjPirQlF/3Lqb98k7KaPDeOcP4toDPeDhcQ7oxZqTcBt+mgBsWPbchKQuw9KHBN8m+oSItK+Nn59jUSeOIbRGONweu6IPf5Mn0W8i7E/kjyRvOxXwl7vQ6Dn8c/1yUrdWq+w3DWdOhSyCksCw1xGH1VzyXTt2elf0D7Ot4xqUMUyoVh3E7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+865yy35tuxjejbcxlK1E2qsqlDble3RTprfV677v8=;
 b=DwU7yrekjLXhWOmh5t9Xt3eCjPIvTvJ5sO1TcfwfuTuJ7CuZfOvul+p4KoaFhBBI8YE9FPzYcgnyg6w6QmjfHUGoTdM9ii9HGq/6ykuN5IxsRAeBZH4zDaH+zEWRe7NH6KzvFrD7AEVb90ymvl8I+6Rs8gdtTg+MJH0NePLvnW3MSd1Ff1Apc/v2WnWQE1QqBmyEia/YjWTJL4yTXjiWJAbrpHbtRLX4NkCMzzHKrXCrVlej0J3KAZB0CbzO7Nph8edJf+Vc8QPxhQ22gdNAUQVnCACYi8HhpsTV+JTohl/1tX2/na+N/D8AXIIQXZ8id9Az1NlIB/EzwE8qCKuXyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by LV3PR11MB8674.namprd11.prod.outlook.com (2603:10b6:408:217::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Mon, 16 Mar
 2026 21:08:13 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9723.014; Mon, 16 Mar 2026
 21:08:13 +0000
Content-Type: multipart/alternative;
 boundary="------------s0E6GFLKji2dgGjKcd0bI980"
Message-ID: <e4863d03-6c88-421d-b613-d846818f6a54@windriver.com>
Date: Mon, 16 Mar 2026 17:08:07 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] rust: Drop
 oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch
To: deepesh.varatharajan@windriver.com,
        openembedded-core@lists.openembedded.org,
        "Marko, Peter" <peter.marko@siemens.com>
Cc: Sundeep.Kokkonda@windriver.com
References: <20260311132658.1230334-1-Deepesh.Varatharajan@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20260311132658.1230334-1-Deepesh.Varatharajan@windriver.com>
X-ClientProxiedBy: FR4P281CA0413.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::14) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|LV3PR11MB8674:EE_
X-MS-Office365-Filtering-Correlation-Id: c2122a16-b8a6-4fc7-9872-08de83a022aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|4022899009|1800799024|13003099007|8096899003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	wgVZ6UxE4w/dE4pPPeVJwpm3lSFNHcw4HUDvXyOPtORx7TM+xt1WB7uuDiXnNFkrwvuxVY9lY+CXMHDZU5AlnoxRB2n8SU6n2aqA8DLGmxJH0GnyIKZtm8/D/3sTnhNnlsGIFh87IbVRyyO+QL7QHk4tY6KigjNsp5XRr40SS/HbVjN2cXCbnE8m3C5KC4DqtCz0XnsT3LeINqBqqi7I+CV/GoAXY9dZmo/xdKf7VkVmwfiz2d5rpnwmgy7jMI5YwP/Ee3cGcI4UoQTuPkh8HGxeIRBJen2UlfDL8T46nt1Q5i0iUQfs96ZvQL4lnfxwWDx63P5uDvuDoR8c3VymcwaatvoGiSN4OmdgaLO/NevHBXkl+J4T6NIFPAdypWMRcEj41FMkOpTaaiMvRFIgsoU05MB034zUYPOS20KV+OzvyGZsMoML9lqa96l+wVghBiEIWgIJJdAl2iGXKl8jzIzzkl2aPekKKs0vA4HEpT90TliSdkJnOvDybaeaVXyc0fmv0Lucbk2TV1/tOa3hGQ1z/FmZiq4g+R4WTEtBPe+brhdxmIPypctjuQTY4iFKsqRVlu1zZfVrudRFTm1v9e2mH/ISLCJniV4LSBXOHJXxQeuogXEwSDQOfTj7pymKiscVZ8CSNZnlIfczXbf21OyGF47LdeMdf42PZyvU6SIf282wkmSVOE92s/Ul/nFC
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024)(13003099007)(8096899003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c2NnbWJMcXRmTWI0ZlZPQWI4a3RtL2VObjROaGR6dkNoR3kvN3h4alF4NGVs?=
 =?utf-8?B?cDM3cFhVOW0yV29TeGdLM0piQUYxQTNseisrdGwva3o5S2JaTkdnRmRnWlZG?=
 =?utf-8?B?SWt6ZGt2eHVQaVQ2YlFzT09idjJ4RWM4OE8yTEdUc1RmWG5NRUVzUXgvZE1T?=
 =?utf-8?B?R2lDcnB4QjVXT1pVSXY1cDMrbW9CRFpYUTRQNTdOdHJJVUVKV1EzaUF6NFpP?=
 =?utf-8?B?NGYxaXRxN3g4QzQweklWVDBSTm9IS0hZWmRCdDN3ZzRwaGRjT3AxQ2lzTXcr?=
 =?utf-8?B?NDN6ZEtUZ1RxSVBoN0RSQ25mbDZmdktvbFRKbkJ1ekRhdWZCaWRtNVc4alRa?=
 =?utf-8?B?RVBQb3NtOFREV25xenNvaGdwNW5ieWNacjdsODRwYTJ4VXFyMnI5ekIrQ3Qw?=
 =?utf-8?B?N0d5dTFMWHV1eDA4K3FaMU5FQzBGYnppR00vMGdnekJZcVNEbUtMeENlTW04?=
 =?utf-8?B?U2J0aUtBQnd6enBEeVViNE52b3JBUmw3T1cxcDZGQldZVlRsZFpoakk2SGRV?=
 =?utf-8?B?ZUppN2lHMjRRSTV0dVhsbldWMHBsNGYrOStoWEFlelR4WU9TeWdzVE84anNh?=
 =?utf-8?B?L1g2aE1WdldMNkJsVVI1NVI3aTZnZjR0aHpFQ3ovTEtheWVjbTlsTkRzV2tn?=
 =?utf-8?B?QzdMcmR0V3ljbVN0UzlFUWxNTCtqdkl0YnA5U0VxWW44TzE0VDdFL0dBNVNr?=
 =?utf-8?B?YTFPTGxCa3hkOUJyZk80MmxMTS9Ra0loSitFQTY2OTNqdm9yQ2ptZURGbElX?=
 =?utf-8?B?eE9kS3lpQmpheEtKWTY3WFh6ZTdqeFFVempNL1RsbEdTc1BJa3JSdHRFRFAy?=
 =?utf-8?B?ZkJWb0VjYlg4bFZscEx4MFU4M1VJWGliajVhU1N2QTRrUnZEOTJaZ2I2aldZ?=
 =?utf-8?B?RmhzaThkazMycVp4TXl1dU42cWJoZ3c0a2dWcHpzdGhrdWFxbVlrU1Z1REM1?=
 =?utf-8?B?Mi9WS1QwalRyWXRSbFBsZnliK0lNV2t2V3p5RkVLbzFSVVQvZ3BrY0w2cE9z?=
 =?utf-8?B?SUNFWTJZWXNEZVlFMkpVOHhBOG9DU244S04wNC9POU1tUXNFZlJJZlhpVXRE?=
 =?utf-8?B?QlFVYVlJMDBDMHgwWStOc2JDdUpKMWNpTHQrRE9oakZDU0I5Y1lXWUhRckht?=
 =?utf-8?B?VFRjZzY4Unp1REFwU2Fpc25Dd1JyRTROcWRkcTM3cWZSeGhLWk4wcWJXeTk0?=
 =?utf-8?B?TkJ2ZXpWZkh4Ukx0Y0tabks3UkJiVEpaNlUrS09XTmF1L3BkckJkS3lMbTBx?=
 =?utf-8?B?M1RyMW5aNEEwNVA5NzZQYkhQRmRWekd4V0pLZk1wQm44UytnbTlxamtpUWxK?=
 =?utf-8?B?Umw3SGJRWm42b0xaSk9MZVppTWFxaVFPcEhJZlVaa1g4Zks2OXIxa2xIMUhl?=
 =?utf-8?B?M0hoejF1OExUZkIyWHZzK0RDRlRZcVd5VkI1T3ErVWNIbnlLd0lqK2htSEND?=
 =?utf-8?B?aS9DaXNUbFFjTFQ5c2VBM0xYRmtVbVNLbnBud2VHaWIrMlJ4WEZXTm5CeGhT?=
 =?utf-8?B?bmRLL1RGWlozTU03TFVVenZxTW9OMGNWVWxZTlBVb0NHYVRUQWtpWnJCYmRh?=
 =?utf-8?B?MEZ0bzJsdjlrZXZ2U2luUXF4QXhJUzRHMlZxL1FWem1MRUdraVI0Y2lJallS?=
 =?utf-8?B?RkF3bitENnczRi9mLzQxYy9sMnAzVDFLVWROM2ZseVY5N2Z4WFYwVDVKWHlV?=
 =?utf-8?B?akdyemlBMlZ1QldXZURseWprVEJacGtEZkt4SXlNS05mSTV0ZnhNSDY1Zmp3?=
 =?utf-8?B?WXhpaHVhclFKYWpLdmZtL3NabnBBeWlheEpWVGJJMGJpRHZhYWpEL1BuMzlB?=
 =?utf-8?B?SVB0KytiVi85YUhXNEhOamRDdE9TT3I1WXl2VFlBSjhVdE8wSnNDYUJkbDZU?=
 =?utf-8?B?MkhnT1ozb1RuNjdIUzRMQmQ1YjBPbFI0bDlNa0c0c2RuN0V0SGxpRWhvbUVq?=
 =?utf-8?B?S2pMaUY3NG93V0cxWXhWcklzRFFodzJCMnEwWm1TRlJjNXVabWorbEpqUzV4?=
 =?utf-8?B?YWkzV25JTkZTbUl6eVJFZHZLQ0tRSEdObFRnSHRPK3krKzRKZFpTZllxb1FB?=
 =?utf-8?B?eVBFeG1LNHRxd2FJdzZKcEJPdWMrUTdSc1VhaEJEQ1Q4RUJmR0oyUzU0cXlN?=
 =?utf-8?B?N3BLczMzS0kwUk1FSjFCTXhWcFZZaS9OcWpzK1l3a1ZWSHlHUzBWY1FST1ky?=
 =?utf-8?B?S3NLY1V2dnE3cVd0WGFYWk9LUXpseEEzSCtjTGlhYysrTlRCNXN0VTJWcnpn?=
 =?utf-8?B?YjN1T3gxTTJGbGhMOXBXVUdYdkVDS2hhNm1ray9NU05YV3kvMCsxU3Y3MVUr?=
 =?utf-8?B?b2xDWTROa001YnRORWRnODd6Q3plU05DTGhNenNheVVJY2RibVlMK1pOT3Zs?=
 =?utf-8?Q?u1F7vhX8+RN5gvxg=3D?=
X-Exchange-RoutingPolicyChecked: 
	Dj8q/zEpJPPDlsdQ6CoW+P+nL/3h1EiM4pRhMLFGqd/kWyEWI9te512AFx54ln8AOE51PrZBFf+198y4rUqalZM8gg+rqfDpx6ID1fUa4WegjB1aGVDdO+VdCwAX5uaDAuqSxygVWJ0V4H+sDVZd/AQS7K4g2mNCuEW1rNEYVBcipWb8vEal3gitXco14dbaQCj7JuXsLzmUVlJTF/DIMAaKEFWY6P7FHtT7A2GoVdgxzNWSjqGFmoszQIFEYHQKU9WWO/umyvlWG7AE7MIHB5E/MRqfI3QzMJQz40o41JBhDHP4K22PYUMoKjQw/HYBsMZZE6pRo5jUdbfPE3WMgg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2122a16-b8a6-4fc7-9872-08de83a022aa
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 21:08:13.4398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gYK+rMMU4bVHiNqmzrX3V87zw9bxzlIg8kWTVYc9V5aVy6tvQND7Sb1ZqLWkNxC0klUR4dSXGBvh5Z4gsSHxu5NBFgzQbHBxOUuguRQL4f0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8674
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=E4XAZKdl c=1 sm=1 tr=0 ts=69b87145 cx=c_pps
 a=kKSmHeP+WC7M7nWjYtsSRw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=ei4SEBeUAAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=a_U1oVfrAAAA:8 a=nkDu92dG6bXQUi1SI_4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=c5PHOmjWSzqiE8AAD9cA:9
 a=fw2NHagrMVRJMlsD:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=8zIOOLb7Ym0NljyPXbuS:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE3MiBTYWx0ZWRfX6ugMm3FhWNH0
 Q9rHuSLGpsFaSwbgObRbACg1Xm5H04pb+Eq2D/RAiDNLLpqRczDDSwJ205qICSXnrsaKwIkin2e
 F2Ix2oAN79EiKbuSKJBiI8P5ruFCC1MICbI9JY9Sf14EUTL3ExD3VgYhdCM+OOlH566peEElmD0
 95UpTeqsOr5ELGppUXrxqFJOSeWpCP5cqIEyvq0XYGUTOuFGimJZol9SAGbQQhoaCR73X9SaOgN
 /slG9AXMxpxaOKRXhFZUP0UwiP4uphfe0/fMyHSUvYxJO9/oN2tt6bwbNaDlYKQeLO51n4ja7r1
 L5RqzHCgmKQWs3km45ub5PK7De7PvMPw1/N4wXLzThY5xQCzwD316vuMEiZLY/ORFeswWugKNeT
 7BM6ZOWttMNWAm4tBK8d0dPvG4SNTP9XSh9QYIENlYfoQaw83Ibal8qr6z+UB1wjHSh41XhM5vD
 ZO47MlMQqcVOOzXOhFw==
X-Proofpoint-GUID: a2bd7yp-cHQJtxzH0WBzaHVX426Zxytj
X-Proofpoint-ORIG-GUID: PQr1a_QGPE2vvCY84Z8A5t8zkCftGfRe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_05,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160172
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 21:08:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233270

--------------s0E6GFLKji2dgGjKcd0bI980
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62G7v25d2557265

On 2026-03-11 9:26 a.m., Varatharajan, Deepesh via=20
lists.openembedded.org wrote:
> From: Deepesh Varatharajan<Deepesh.Varatharajan@windriver.com>
>
> This patch was originally introduced to address a rare failure on the P=
PC
> target and with the latest version of rustc this issue no longer occurs.
> So, this patch can be removed.


FYI, merged:
3b5c2d8bdb=C2=A0 =C2=A02026-03-11=C2=A0 =C2=A0rust: Drop=20
oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch

If this causes problems for anyone, please let us know and we can=20
consider restoring the patch.

Deepesh,

Surely there's some existing data that you can point to,
to convince upstream to double the timeout if not 10x it?

../Randy

>
> Signed-off-by: Deepesh Varatharajan<Deepesh.Varatharajan@windriver.com>
> ---
>   ...crease-timeout-in-process-sigpipe-ru.patch | 31 ------------------=
-
>   meta/recipes-devtools/rust/rust-source.inc    |  1 -
>   2 files changed, 32 deletions(-)
>   delete mode 100644 meta/recipes-devtools/rust/files/oeqa-selftest-Inc=
rease-timeout-in-process-sigpipe-ru.patch
>
> diff --git a/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-ti=
meout-in-process-sigpipe-ru.patch b/meta/recipes-devtools/rust/files/oeqa=
-selftest-Increase-timeout-in-process-sigpipe-ru.patch
> deleted file mode 100644
> index 5bd1abffb4..0000000000
> --- a/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-i=
n-process-sigpipe-ru.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From b4524278985f517b0785b6f64a21380dcf1ff096 Mon Sep 17 00:00:00 2001
> -From: Peter Tatrai<peter.tatrai.ext@siemens.com>
> -Date: Mon, 4 Nov 2024 13:58:16 +0100
> -Subject: [PATCH] oeqa/selftest: Increase timeout in process-sigpipe ru=
st test
> -
> -This patch increases the timeout for the process-sigpipe rust test, wh=
ich
> -occasionally fails when the server is under heavy load. Increasing the=
 timeout
> -reduces the likelihood of false negatives under load.
> -
> -Fixes [YOCTO #15625]
> -
> -Upstream-Status: Inappropriate [OE testing specific]
> -
> -Signed-off-by: Peter Tatrai<peter.tatrai.ext@siemens.com>
> ----
> - tests/ui/process/process-sigpipe.rs | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/tests/ui/process/process-sigpipe.rs b/tests/ui/process/pr=
ocess-sigpipe.rs
> -index 11f363d62..c12d66016 100644
> ---- a/tests/ui/process/process-sigpipe.rs
> -+++ b/tests/ui/process/process-sigpipe.rs
> -@@ -23,7 +23,7 @@ use std::thread;
> - fn main() {
> -     // Just in case `yes` or `while-echo` doesn't check for EPIPE...
> -     thread::spawn(|| {
> --        thread::sleep_ms(5000);
> -+        thread::sleep_ms(50000);
> -         process::exit(1);
> -     });
> -     // QNX Neutrino does not have `yes`. Therefore, use `while-echo` =
for `nto`
> diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-=
devtools/rust/rust-source.inc
> index 04204969ba..47a0154cdc 100644
> --- a/meta/recipes-devtools/rust/rust-source.inc
> +++ b/meta/recipes-devtools/rust/rust-source.inc
> @@ -4,7 +4,6 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-$=
{RUST_VERSION}-src.tar.xz;n
>               file://0001-Define-more-ioctl-codes-on-riscv32gc-unknown-=
linux-g.patch;patchdir=3D${RUSTSRC} \
>               file://rust-oe-selftest.patch;patchdir=3D${RUSTSRC} \
>               file://repro-issue-fix-with-cc-crate-hashmap.patch;patchd=
ir=3D${RUSTSRC} \
> -file://oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch;patc=
hdir=3D${RUSTSRC} \
>               file://0001-src-core-build_steps-tool.rs-switch-off-lto-f=
or-rust.patch;patchdir=3D${RUSTSRC} \
>               file://0001-riscv32-Define-plain-syscalls-as-their-time64=
-varian.patch;patchdir=3D${RUSTSRC} \
>               file://0001-Update-call-llvm-intrinsics-test.patch;patchd=
ir=3D${RUSTSRC} \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232879):https://lists.openembedded.org/g/openembedd=
ed-core/message/232879
> Mute This Topic:https://lists.openembedded.org/mt/118259934/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------s0E6GFLKji2dgGjKcd0bI980
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <head>

    
  </head>
  <body>
    <div class="moz-cite-prefix">On 2026-03-11 9:26 a.m., Varatharajan,
      Deepesh via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260311132658.1230334-1-Deepesh.Varatharajan@windriver.com">
      <pre wrap="" class="moz-quote-pre">From: Deepesh Varatharajan <a class="moz-txt-link-rfc2396E" href="mailto:Deepesh.Varatharajan@windriver.com">&lt;Deepesh.Varatharajan@windriver.com&gt;</a>

This patch was originally introduced to address a rare failure on the PPC
target and with the latest version of rustc this issue no longer occurs.
So, this patch can be removed.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>FYI, merged:<br>
      3b5c2d8bdb&nbsp; &nbsp;2026-03-11&nbsp; &nbsp;rust: Drop
      oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch<br>
      <br>
    </p>
    <p>If this causes problems for anyone, please let us know and we can
      consider restoring the patch.<br>
    </p>
    <p>Deepesh,</p>
    <p>Surely there's some existing data that you can point to,<br>
      to convince upstream to double the timeout if not 10x it?</p>
    <p>../Randy</p>
    <blockquote type="cite" cite="mid:20260311132658.1230334-1-Deepesh.Varatharajan@windriver.com">
      <pre wrap="" class="moz-quote-pre">

Signed-off-by: Deepesh Varatharajan <a class="moz-txt-link-rfc2396E" href="mailto:Deepesh.Varatharajan@windriver.com">&lt;Deepesh.Varatharajan@windriver.com&gt;</a>
---
 ...crease-timeout-in-process-sigpipe-ru.patch | 31 -------------------
 meta/recipes-devtools/rust/rust-source.inc    |  1 -
 2 files changed, 32 deletions(-)
 delete mode 100644 meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch

diff --git a/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch b/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch
deleted file mode 100644
index 5bd1abffb4..0000000000
--- a/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From b4524278985f517b0785b6f64a21380dcf1ff096 Mon Sep 17 00:00:00 2001
-From: Peter Tatrai <a class="moz-txt-link-rfc2396E" href="mailto:peter.tatrai.ext@siemens.com">&lt;peter.tatrai.ext@siemens.com&gt;</a>
-Date: Mon, 4 Nov 2024 13:58:16 +0100
-Subject: [PATCH] oeqa/selftest: Increase timeout in process-sigpipe rust test
-
-This patch increases the timeout for the process-sigpipe rust test, which
-occasionally fails when the server is under heavy load. Increasing the timeout
-reduces the likelihood of false negatives under load.
-
-Fixes [YOCTO #15625]
-
-Upstream-Status: Inappropriate [OE testing specific]
-
-Signed-off-by: Peter Tatrai <a class="moz-txt-link-rfc2396E" href="mailto:peter.tatrai.ext@siemens.com">&lt;peter.tatrai.ext@siemens.com&gt;</a>
----
- tests/ui/process/process-sigpipe.rs | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/ui/process/process-sigpipe.rs b/tests/ui/process/process-sigpipe.rs
-index 11f363d62..c12d66016 100644
---- a/tests/ui/process/process-sigpipe.rs
-+++ b/tests/ui/process/process-sigpipe.rs
-@@ -23,7 +23,7 @@ use std::thread;
- fn main() {
-     // Just in case `yes` or `while-echo` doesn't check for EPIPE...
-     thread::spawn(|| {
--        thread::sleep_ms(5000);
-+        thread::sleep_ms(50000);
-         process::exit(1);
-     });
-     // QNX Neutrino does not have `yes`. Therefore, use `while-echo` for `nto`
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 04204969ba..47a0154cdc 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -4,7 +4,6 @@ SRC_URI += &quot;<a class="moz-txt-link-freetext" href="https://static.rust-lang.org/dist/rustc-$">https://static.rust-lang.org/dist/rustc-$</a>{RUST_VERSION}-src.tar.xz;n
             <a class="moz-txt-link-freetext" href="file://0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch;patchdir=$">file://0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch;patchdir=$</a>{RUSTSRC} \
             <a class="moz-txt-link-freetext" href="file://rust-oe-selftest.patch;patchdir=$">file://rust-oe-selftest.patch;patchdir=$</a>{RUSTSRC} \
             <a class="moz-txt-link-freetext" href="file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=$">file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=$</a>{RUSTSRC} \
-            <a class="moz-txt-link-freetext" href="file://oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch;patchdir=$">file://oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch;patchdir=$</a>{RUSTSRC} \
             <a class="moz-txt-link-freetext" href="file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch;patchdir=$">file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch;patchdir=$</a>{RUSTSRC} \
             <a class="moz-txt-link-freetext" href="file://0001-riscv32-Define-plain-syscalls-as-their-time64-varian.patch;patchdir=$">file://0001-riscv32-Define-plain-syscalls-as-their-time64-varian.patch;patchdir=$</a>{RUSTSRC} \
             <a class="moz-txt-link-freetext" href="file://0001-Update-call-llvm-intrinsics-test.patch;patchdir=$">file://0001-Update-call-llvm-intrinsics-test.patch;patchdir=$</a>{RUSTSRC} \
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#232879): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/232879">https://lists.openembedded.org/g/openembedded-core/message/232879</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/118259934/3616765">https://lists.openembedded.org/mt/118259934/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------s0E6GFLKji2dgGjKcd0bI980--

