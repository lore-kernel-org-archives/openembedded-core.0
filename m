Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9775CA101E
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 03:27:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.14981.1725334027136790240
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 20:27:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=99767a8c38=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48339bCs017112
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Sep 2024 03:27:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41brd1aj8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 03:27:05 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4833R54Z009555;
	Tue, 3 Sep 2024 03:27:05 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41brd1aj8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 03:27:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eO0oMnL+idW0VOfEd5wBkTYtKVTzLx4z8zb6ql477YM3FhpMFUhw5APH6bmlGjMoMSRZNQqh5iM+YeTkxmNlL4qcSxvjZBxgIakdMRp3Fsa3UDwO//r4InnS2ac67uIdz6CvjE+yb6geJqmHg6lTEWt+xJMcUYwO6wFFJ635a/+tBGrh37TkzrcT2fj2B+fCshU9+DaOhH1urHSUgKU2IbP8yGdNRTbOCGcQrdp0pBLu0jQ7ZahQSHz613gCgNLSYu3hevaPSriolgMNr6sYHCig/iCMu+F4g8+FB10ZpSG4YqDVcJvEGyWYsrU4Rua5GL0rzxxZQPIX2qCpGL0aqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2I++z/U+W8aOhhwwSkKEnwkUyn3j+L8oL1wpbU+/J4=;
 b=LRLaXAe9xubhm7EWCvm9D6lHZfjybz4GcODy5snU8KmzurMESVSVzS2/X5LvOqRx53O67p/zSI8wfLZl35MXZsw17ERF4qROGif2gCanUdiexyre/P+Smw2P6RdRXHXs3ppbFKlaNeG1Ss2zg0ZyLSGBIdzsrg5Xm8AqS4WKiyHtQItYmw44gVohtVF/SspO4c9JsriuNaJNMvq2GnBav54HphSG8wmw0wAKJg12JOMA+RFx4dT86cRLwKi3But7s87BSNMYDN9f29dDwhcjHIp/jHWswR4UAj8rKz0yRfM4mw8kBeVClDP9RqCUWvSjxAJFnV8t3JsLP0UebxkWuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA0PR11MB4656.namprd11.prod.outlook.com (2603:10b6:806:96::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.26; Tue, 3 Sep
 2024 03:27:02 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%7]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 03:27:02 +0000
Message-ID: <9f62dec2-203f-4d47-a435-d0dbf5c93622@windriver.com>
Date: Tue, 3 Sep 2024 11:26:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] why does EXTRA_IMAGE_FEATURES += "ptest-pkgs" not
 install *all* ptest pkgs?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <5557141e-86f6-1a86-2069-9f566e766385@crashcourse.ca>
 <dbba02a3a7967229e2133e69cd636349ac5374a4.camel@linuxfoundation.org>
 <6e65acdb-454-65ec-8dda-ad9f746468d@crashcourse.ca>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <6e65acdb-454-65ec-8dda-ad9f746468d@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BY1P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::12) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA0PR11MB4656:EE_
X-MS-Office365-Filtering-Correlation-Id: ef3080d5-0c61-4c74-fb22-08dccbc8462f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZTFBQm5SYXg0MHNyNENtVGgranJFVUlRZU03MmxEdCtTL2lwVXBXY0x6U1h1?=
 =?utf-8?B?YlpreU5BWmp5ZmNxOW9PT1VDM0Z3TUpnZ2o2bHc0Y3RTR3pscWFGd3pLTi85?=
 =?utf-8?B?RlpCeVNsUjNzaVhGZEUvazBqYUYwQ2tSb1cwVUV6Y0hvYncxYkppOGdlTyt0?=
 =?utf-8?B?SmlLQm16M1pCN3YwcXNzWHl5N1NqdjdJM3ltYzN0bm93azlvQTFua2ptRCth?=
 =?utf-8?B?YWUxZTNZdjJyS3VmVllXZEptalBPVm02THQ5Qk4rc2lYVUlTTERwVEtxeHQy?=
 =?utf-8?B?REYrK0lRa2MzbWtTcVpXcXVXL1hlS01DUE5TL3hTRjVCdU5ENmxiODhTYWln?=
 =?utf-8?B?SkxVVGt2OFh4MGRFNnpjMTBjcWg1Y0FFRUhjVzdwWVExWVdSSGl0VDhrMTl0?=
 =?utf-8?B?NXVtRFRxdlF2cGE5SGJYdHRvUnBscDdVTFFPTEFPaHhPVXlRZmcwR3RLV3Fp?=
 =?utf-8?B?Z1ZUMlJKQ2dlN3hESHQxYkdBdm1hNTQzRVNrQUhWeWJXTDdpelVXa0pScVpj?=
 =?utf-8?B?N1pHdmRWa3psNWF1bFJlWGxOOHg3cGxJemhZL1ZmMTQ0aGtLYTZTTU1uMjVB?=
 =?utf-8?B?aWU0UTd2RFF5Ymszc2JUb2lnSXZId2ZITFNWOHRhSTRnS3MrcUx0UXplY3h1?=
 =?utf-8?B?OXFXcVVuTHp2SWFwejJya2JtUFZDVDVDZ1cwTFY2eWdNeFIyYkFCN2JKQndq?=
 =?utf-8?B?RnRTdDg3dXdBcUM4K2hBTnpPVFl5VVQzRlF1MlorRkI4aG5YS1psbVkxUXhm?=
 =?utf-8?B?Z0RtS2Y5d3JIT0ZKWnpvbkFhaDh3b0NnZXNhOTFFZmVpM2prOFpHanQzMmtu?=
 =?utf-8?B?NUErKzErWHZZeE5nS1p0RnNCbVY4NXNKWXdxMHoxL1pkb0l1ay9ZRElXbkV2?=
 =?utf-8?B?d1I0NjlUNFNuQVUyVjd4OGwvdzh2TDI3Nk5CUndWWXN4VDFjWFlkQU9QVEtU?=
 =?utf-8?B?Wm9GV3FzZWZITHBoZzVYdXVjZ095eEl2UllIQlp0bER6c0tITHl0WEQ5UDJZ?=
 =?utf-8?B?VHVReWNxdVFucTlkK0FBVk1MUURpVU5lKzlMWlg3TXJTQVFMWjR1RHNjVTIv?=
 =?utf-8?B?N3RjU3o4S0l1SXlGM1pheGtQT2ZYUU5QSFdpQkZqQlZlRFZMY3lGMnUwdFUy?=
 =?utf-8?B?TDZ4R21YaDluZzVVR2k0T2l1Ris1Nmh1dXFtV1R1TEJMMytHQWZRcTJWVFpU?=
 =?utf-8?B?MzN6aEN0eWxNajNFWEJDRWhHcW9BRXVUeXdiMDRCak81bXEreEQrblJzR250?=
 =?utf-8?B?QVJ1Szl3endqa2ZGeHZYRmQrQVpVQTBza1FTYllGLy94cHhvWnIxL2RxcE1y?=
 =?utf-8?B?TDVBNnZXN05hZlRwTldkUlR0RnFyS1pKMUhpRVdzZEE1YzdZK3gzbTB2MnZz?=
 =?utf-8?B?RmhmdUZ4VUlPTU8xMEtqbTRLRk9ZUS9JMjZVczYvZXdRRXFFMXprWjhKaThG?=
 =?utf-8?B?L0VSYzNDWUMra0cwcTgwZ1Fabzhwd25qNFpGeE1KdkQwcTgwejdtWEtTYWZx?=
 =?utf-8?B?TjV1akF3Zi81eXNmQXdpTUlWUTdpWnRneTNyaGFybE1lOWpoTWwwTXpHbG5j?=
 =?utf-8?B?b1d6MzRGck1McDQrQU1VclVFdHIxcFBtWUczQ3BrSGt0dUdZamxIS1pMU1hL?=
 =?utf-8?B?OU1wRkZUV2FqYmkrZExNM3o0SFBKR21yTC9ia2dkdk53bnk2U2RlNFY1Qit2?=
 =?utf-8?B?bS9IVWluRjZNekM3V0lvVm5oV1pBcWlrdUFkSEZtY2w0bVhxNGNoekMyUm15?=
 =?utf-8?Q?g3gXZQIxoyWZrSeGl4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?elhMUGlKZUJqTmhIbzNpbFdQb21jYWpJSDN6WUlZOGlsS0dyNzZCem85Nzd4?=
 =?utf-8?B?TTZTUlA5OFJMYkhlazduWTJtVlAzdmE4dDlyTThBNC9LTnQ5TXBlZjZOLyty?=
 =?utf-8?B?cVkyUHhLU0lGU2dXM3JxcGx3TlJraFROazRvSFFvTkVxQ0VPT055RUdqTG5L?=
 =?utf-8?B?QTBmaEVydHY2TzZpZnZ0bm13UDZSeUJOZnNJamlabW4rU1FsUjNRQm5VbjJ1?=
 =?utf-8?B?azV5NGI2dll6a1hDS21HajJhRUZBOWx2MHlQakJDNkY4WUY5ei9ML0ZBczhV?=
 =?utf-8?B?MmNmamVIcUJyWTdHWFp1Q1p5WFpjdStRTUZiSFFqNmpzOGZpVThac1FPalFS?=
 =?utf-8?B?ZURJNW1HRTJRM2xtK3YxTWdpR3FkSU9ydzQ4a1p0M2d0U0oycVJTNW5Qc0tq?=
 =?utf-8?B?L2RDaG53c0VXcndkelBaR2xqSCtnaGUyYVNSc21ZdHptV0RxTmpaWnlNUGFx?=
 =?utf-8?B?ZHBuWjJ3S0tDaXFsckFCR0tQd01rNlNPelZhVlBxNnBJdnNMZDFxYVZvT1Ra?=
 =?utf-8?B?UWtoWHlGUnZZYSt0MUphajJvWENob0VZL1FvNFZNZ3Q0NGFOeE5DNUxQcit2?=
 =?utf-8?B?aWg1cytFYWY4T1BCYmhYNllPTEwxUUdGR1NwbTU1eThzRFg4ekJPTTJuOGRr?=
 =?utf-8?B?MXdLOHlrcXVGN3RJQlNadmUyQ2UxSEVvbUc2eHZSeWpCQkdVQ3ZmV29lbmd4?=
 =?utf-8?B?NGpFNVljSDNOc0l2SXY4SzRhS28vZjlyME5CeVYwZWdEOS9mVndEbENlb3hr?=
 =?utf-8?B?UXhtRnY3WWI1M1BKVVEvbUJIK0lNbUFPQm12TkZmWDRVcnN3b3pDaXBxK2JT?=
 =?utf-8?B?cXRZTGJFajNKMU5lT1h2S0V0cFF2cy8vMXY4RUM1QlNWWU9yYzJBczRnNnpm?=
 =?utf-8?B?MS9lK25CS2V3QXNuUWxBOWZoanBBRWpCL3FQRjJWeUJmelZmSWdqOEQ5TERM?=
 =?utf-8?B?bjFaNTNYbGNnTmxYdE1rNGdENG5YdWhnclZ5WktGK3QrOHZpMkZyMzVUQUVa?=
 =?utf-8?B?MS80SlhDVEV3d1hUTGErQUtTQVdkaDdlMDF6d1pCMnhIaXZKbTdObStNaE1K?=
 =?utf-8?B?R3ZBR0huWG5rZm1rNEtZcytvK3NJOWZhL0RsOWhyTVdaRCt3TGZUVW1RMmk4?=
 =?utf-8?B?QVNxMHdKTXBwY1AzRm9qalJoY3NtS1BwMUhnaW1ZU01ZUVhCaW0waTQvMjRy?=
 =?utf-8?B?bTFDY1Z0UHllVWpob1JEdUduellLdlRaeWpLbUtvNFl3VlBqMlZuL3pDaUQz?=
 =?utf-8?B?YzZ3OTg2YmhCRWlRRkVLYUFZdDdlLzh6YXV3QU4yRm1ZQ09uVmJNRlkwSVNu?=
 =?utf-8?B?S2VLM0Z1N1M2Qm9SalNqRXNWN2JDQ0wrcnc4MHZEOVpORkQxenRFVmsvOGxJ?=
 =?utf-8?B?ZG1EMzY2dWRMNi93RUlkc2g4MVJUbTZudnFINnBKNnJLa2xGYVpkNE9YamZ0?=
 =?utf-8?B?RlhMSk5zdGkrYnNmQjl6VjNWdzhzamhJbFc0MzUwK2ZpZGhZamk5eTdHQ3I1?=
 =?utf-8?B?dWI1dEJ3WmwyYzdnbDJTTWl0TThoTWRVOGVyNUxiMm9SdzhUb29kY25YVk5K?=
 =?utf-8?B?a1JacFlYTVVlNDVHbWg1d3dxNHhLbjcwSVpLWVBiWkNtd2Z0UWdQMC9kc2Ns?=
 =?utf-8?B?NUp1OUhMR0V0YTZYeFB5TXRvcGtaT0V0UzhUdUlXWmtneWRjdXZFaERpUDNP?=
 =?utf-8?B?TDREQmFaZlRmcXRPMnFnR0lTUGJCcjZkN3RrQllPUnVJYnkyYTNuS2YrQ25K?=
 =?utf-8?B?YllFOW1NU3pMR200RmpoR0VEcSs2NUVCYkdXVDNUN3dueEJNaTRrcFpKcVcw?=
 =?utf-8?B?VERmTGJ4UzNsSlpHcTlyU1ZBRmtyNlExUTdFaXhWQVZjNXJBYjNmZHNpYjR2?=
 =?utf-8?B?NEpQVlNtRUR1d3RSbk9pKzdLRmhwUllOWGdyMWtJMkZLYkZLUWVzcy8rL2g0?=
 =?utf-8?B?QjVXcTVQelJiZTBOTWNnU3EwQkdrelBXVTQrLzFrR0R3OGlIZWh3eEZrSGk3?=
 =?utf-8?B?RUJSemErclRsMXMwOEthKzlGMk1UR2t1emFHaWZRYzZkVDBGRWlDNzRwdEl6?=
 =?utf-8?B?VTQyOTdBR0xGcUlRVTkzajAwQmo2NlFHSWVETFJxcm0xRTVVM0ZZakFnazR5?=
 =?utf-8?Q?7Zyg9DIfulUaSyiXyiRr9WotX?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef3080d5-0c61-4c74-fb22-08dccbc8462f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 03:27:02.1194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XT5G58fygFG5pc3F6Y0NWDNm72I3gxOCR0imPtDNVpw2jNtuXwJsuZhRUhpi1toi0wdJCSiJjZHQUjWr5z0s4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4656
X-Proofpoint-GUID: 4gztOrT4_57UY-cHF5O0r961XGrQwsHy
X-Authority-Analysis: v=2.4 cv=Qdk0vdbv c=1 sm=1 tr=0 ts=66d6820a cx=c_pps a=ZuQraZtzrhlqXEa35WAx3g==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=YB3MBxk6xW8l0IQxA_kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 8YKMI1NC4F_LXGjwJMecuHPeucm9vklL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_06,2024-09-02_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 phishscore=0 impostorscore=0 mlxlogscore=774 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2409030024
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 48339bCs017112
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 03:27:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204115

On 9/2/24 19:04, Robert P. J. Day wrote:
> On Mon, 2 Sep 2024, Richard Purdie wrote:
>
>> On Mon, 2024-09-02 at 06:39 -0400, Robert P. J. Day via lists.openembe=
dded.org wrote:
>>>  =C2=A0 i'm sure i've overlooked something silly, but in building a
>>> qemuarm64 image to demo ptest to some colleagues, poky by default set=
s
>>> the "ptest" DISTRO_FEATURES setting so all of the corresponding ptest
>>> packages are *built*, but when adding:
>>>
>>>  =C2=A0 EXTRA_IMAGE_FEATURES +=3D "ptest-pkgs"
>>>
>>> only *some* of the ptest packages are added to the image. eg: while
>>> bzip2-ptest is built, it is not added to the image, as are a number o=
f
>>> other ptest packages. if i *explicitly* add that package, then it get=
s
>>> included.
>>>
>>>  =C2=A0 is there some obvious reason that a number of ptest packages =
are not
>>> included in the resulting image, despite them being built?
>> In your example, was bzip2 actually in your image or was it only built=
?
>>
>> I suspect it only installs ptests for things actually in the image.
>    yup, i read in the ptest wiki page that the ptests are installed
> only when the associated regular package is also installed, and i did
> verify that bzip2 was installed.
>
>    oh, wait ... damn it ... just noticed that my build incorporates
> busybox, which probably gets in the way of installing *numerous*
> ptest packages that would normally be installed. does that sound like
> the culprit?
>
> rday

As far as I know, if bzip2 is brought in by some other package's ptest=20
(e.g., A-ptest rdepends on bzip2), then bzip2-ptest will not be=20
installed. It's not just ptest, all complementary packages have this=20
problem.

Regards,

Qi

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204093): https://lists.openembedded.org/g/openembed=
ded-core/message/204093
> Mute This Topic: https://lists.openembedded.org/mt/108224395/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
Qi.Chen@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


