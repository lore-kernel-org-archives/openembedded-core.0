Return-Path: <Quan.Sun@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D7EDCD6E5D
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 19:25:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3292.1780428327078619489
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 12:25:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=RK5rHtD/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0613f71746=quan.sun@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652HU4Mt2020247
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Jun 2026 19:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=gDS4Dkz6G0BAVEhaOf0KH1
	v2EG1n0oRJvRbYRQ+BAUE=; b=RK5rHtD/hJC1uixUjhdHBbtXu23I98Q/8tVruY
	155Y0Dv1JjlEBoy4TeOrkvKiIGH5q295ReoQSAfYyt9A0a59OtI2pHZUp/yj2+Rh
	RCiXSFlQ4rNnFGmqm1rMeGW4PRf8Z8S2HEBq4Ne9TMBSuluvvit6B4qCe2vDquEA
	h494MYrOtnohDj+Yw8NiB/gO+HE0ImBj6fIagLC8aKfYLsaT8sJ0a/b2vFhH52rV
	ItwvqPBPLAoOFZYZMCI41FONL/ecblggKHEfvKsMVmUgUDnHCaLAJtneijAywQ9x
	3vEBKXsCdl2cFAsNQk3di3SHl9xUoJq1J1LRIl/qMHqWMl3Q==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010016.outbound.protection.outlook.com [40.93.198.16])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4efpv8dce0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 02 Jun 2026 19:25:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X6we9PIbEAMfDdjbXhwXg62nlwcPXVzgxZwKbUwL47vioIFPdqLDemdEReDiV/7KgKJmIgK74Amc0xNEMpnFOEga4AAAlocLR2qQR4SDT4gFwu81l8tvFbIEg6e+hAWcFQbzn5myUYc8XepwR4K7ejWQ5+dIxyqUjmbtnmw2WhX11PQkg94A5LwFlvhDdTK3A6Q4nTx339iutfiGrE8ZekJ0twrBC3pt9iDk5O70KJNb4YIvtrSiRFVApLiPrEP5Baz+tlS+BkYhWlfgi7wy0RZLjtlAeRsfbOTFyzE/0wXuTq0V4zGKDgjwUEFIusyekC1fjL8LDM+NJ1I+uKJWvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDS4Dkz6G0BAVEhaOf0KH1v2EG1n0oRJvRbYRQ+BAUE=;
 b=i2Ji/NqGG3j5SfdHasulpOy6mhAuL1FkUKReUCr9s6kC1MLaR1s90oInowSMzovow1QEv4PdhdU3CeWMfl8Hy3tDynFZLmuAz74U/ktqu/t+JQWp2WYmEDQXR5mtStDhM+CMhmTTyR22jJhct2dvaR+yjx/qqxCZ3GNgmHxUPevZRDIxYwjCC3m7j9aBcfgPZ7p34EYH5YfVzTCmUvKQtxHvicLBtjXRowROsrS6i2tz8ELHtVkRJPtJEOWflUlDFIAwA0WhfDqCOiaPS8RgSmFbe36blQkJTacmX0lE4nd60qtWeDmgzTvAKhtpAkb0Zlf2s/YURU9z503SI+I5NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7283.namprd11.prod.outlook.com (2603:10b6:208:439::10)
 by PH7PR11MB6674.namprd11.prod.outlook.com (2603:10b6:510:1ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 19:25:22 +0000
Received: from IA0PR11MB7283.namprd11.prod.outlook.com
 ([fe80::6e41:656f:120e:8e8]) by IA0PR11MB7283.namprd11.prod.outlook.com
 ([fe80::6e41:656f:120e:8e8%3]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 19:25:22 +0000
Content-Type: multipart/alternative;
 boundary="------------Y2LiGR7j3ZpR03EYpNdRWs9K"
Message-ID: <867f6a81-8f8e-40e5-8440-31c6694bf5f0@windriver.com>
Date: Tue, 2 Jun 2026 15:25:21 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20260528202639.4097815-1-Quan.Sun@windriver.com>
 <85CB8A63-D069-40E7-A0C4-74D615E6CAAD@arm.com>
Content-Language: en-US
From: Quan Sun <Quan.Sun@windriver.com>
In-Reply-To: <85CB8A63-D069-40E7-A0C4-74D615E6CAAD@arm.com>
X-ClientProxiedBy: YQBPR01CA0159.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::19) To IA0PR11MB7283.namprd11.prod.outlook.com
 (2603:10b6:208:439::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7283:EE_|PH7PR11MB6674:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d074e6c-49d0-4ba9-a4c9-08dec0dcb098
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|4143699003|11063799006|56012099006|6133799003|22082099003|18002099003|8096899003;
X-Microsoft-Antispam-Message-Info: 
	J7xYMtanl7Mnmyjt9GVZTgi8ddbV2kteSL5WH1xkIgPTxcch985TTxNNUnvVZ0zVIbflnarlu70MGS++ka1Oj99c8qihxdDQ6/ZtGt7uAeBW86jh1G0ALSkb7b2f67wpO81Qk8Ql8LgUSR1QFwqqJGdEn3AtaGy0DUDzr0NXwKFMt5ieiK5061lGlVqumI585HV/Ev7YUhtwF9caAVdQSKTAsyRYLQe5AFzpBF5ucrAL41sD1X7FZqr7UkYn2f2nhfh79SxeX9O/FO473zzi0nO/cT+1ocBrpElvuKdkh3GamHGVdkTlvTCnsGKxtqDYKIskrQgsn6b4WJSEn4pLcRNyfMp59YGowCUDdGXnOM1ob08jeLqnCaMyk+LRDSkjOAb3F8p2ijNJcD/csrEUJJmBUWL5EF4iE+j7YyOy993fcNz8e9MUzjKrfppWO8Epvp8oClmGatWIARwpwiZuZZqefjsE6dhB33j4ugB9ky1mcG+Mf/n8Jvnvrlj5Y2djpITfPQ9xBYwe8LnkNEs96qZ8KrxfOWqQBiiuDznXaYkYWmtdALmk1GXIKD4Adl/p/FUA96el1Xxqw4MZRvXxCYFJ/MT5OlT9/VWqH8e4P9WEQ2HW8d0+jCpPFnLPWKN7U8uShn2/29L/cEECKCKI1ewMR+hetK5l+wOjmzkXHTmrM3jV2iGSMUfnfYA3KoKK
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4143699003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cTJCNkxEVzduclNwZFI3RVJJTTZlYlpMQXZYdnc0cEVXbGI3ajRvMFdDS0ZT?=
 =?utf-8?B?Uk1COVJEQS9xUEFnNjdNaVNWTm5PMzlWQy9TeEFFZzBYYWE4NEpBSlBuUWtk?=
 =?utf-8?B?eCtvWTZ1dnF4VHp4OEVSR2RoSDlldXBEeE1iTDYvKzlYN0ZZOVN1U0tqTE5H?=
 =?utf-8?B?TTlVb3MrbVhLMDlqaTNhRG5ETGxnODMrVnZySWFZamVHV2VBOVlRa054Y0Fl?=
 =?utf-8?B?eC9aTG83YW9tNDFiQnJhZEJDSGNLUTlnRktYdXkrL29DbWw0VEFUZE16dDdi?=
 =?utf-8?B?QXhyRHVFK3V4MDhYSXB1ZzBRYVZML3RIUTRoL016MWNPeEpkRHhoSWt4cXEr?=
 =?utf-8?B?ODcwVGFRU1lxVStUQ0NQVW1qR21nZUFCem5qYStEZlNIZnFGaGpsSElnOG9E?=
 =?utf-8?B?cG9TQWlrb00yOCtpMFBLZ2FRMUR3TklHdTc0Z1dadks5OU5xc1ZVVVpvT0pH?=
 =?utf-8?B?a2xMSnhtWFlObzluYXpBL0FvS3Q5Z1cyMUlQTjV2dXM3NlRmMmNBL1ZWbjlF?=
 =?utf-8?B?RFl3eHkrNjRsbmxibkR0bGdXWktoMGprTWRSZ1p6bUVsc1Y3L3RwQ2t6Y2FZ?=
 =?utf-8?B?UEtxamFVTEFXZzJ4dkxoOUxkNkdIM0g1U1A2cEJGTmpDa2dqVzhRR0ROL0lJ?=
 =?utf-8?B?WmxDa2hmUDc0RmJXWk1paGZwdzBLcFM1RUk5bW5wVS96VGNEdGR1RDNIbjV4?=
 =?utf-8?B?OHdpWjU5OTU4OWRxY2pKZFU0S3lYQkI2UFk1ZWtXR0E2ZWQyWkcvN0pxT2tq?=
 =?utf-8?B?c2Rvb1FWRVp3YzlnQlVhZUlYU2hDbWVjODNEd1RXTjArVjhzaXFpNkcyeG9s?=
 =?utf-8?B?b2UwSGo4VURXaDFOMG8xdklOMGl1MEMvY3Y0QTh1RFU4K2g3VkhBN2pUa2RN?=
 =?utf-8?B?ampmK0Y4bFdnZVYwNXBzZ3hCTW1ZUnRSWUhGRkhScVVJRHNFWjZMR3VHb0Jw?=
 =?utf-8?B?VmFhekdkRXJqUGJ3SFUrcklWd0lMVjJyRVFWdjBicW8vU2VScFBhblhqUGRW?=
 =?utf-8?B?WTRYNFRKOW9YWm5aaEwwNzJKbFlocTI4NlNCbDEwamxvd2JpV3h4MTBtQndx?=
 =?utf-8?B?dHBhRTgxQWtLNkZZdEVjTEE0WjBxemtadmM1dFFWWFo4Ukk3S2RzeFNLNlZ3?=
 =?utf-8?B?R2pQS0I1UHFTVkxZeDY5WWZyRTF3VHc3UGxWcGN0NFJVSnUvc1BmcXFQMi9O?=
 =?utf-8?B?VC8yb1hXV21Sb2tidHdyRys5MURGTVdNeEVJZW5GdE5ndllRSVpoZGlFTDQx?=
 =?utf-8?B?S0t1WmlzaHBQSEZvOVRjcWNZSDBDYzErMThobXExV0NsN0F0VHFGOGg1a2Nx?=
 =?utf-8?B?b1lBaVlmaGU0Q25ZWEM2MzZVY2M0RHZnbkEwKy92RlkrL2FHZTMwUFh4Q3V2?=
 =?utf-8?B?clBaZ1lQczFzbG5LanRwQmpVaU04K3Z4T3JQK2ZtbmpXaTBHQlgyc0pHZ3pF?=
 =?utf-8?B?YlVSVVUwRDl2dzR1Wm9VWGZEZkZJbW9sRzRFcXhGNGFucXM1b1dSUnlHWnFT?=
 =?utf-8?B?eS8vRzJTWkxzNis0QTBCOHNJN3ZsTVNrbnlYdDZIWHdTZ0FHMHJydjZkSHRO?=
 =?utf-8?B?TzBZS1ZucFVKZ3V1VGhiYzk3clArY1NzTGZBbEpGUTB1ZUVobG0rdExYdEVN?=
 =?utf-8?B?ZW9XRFE4akhTWjU3STJiR3BoemNCNWpWazk0MUx5Q3oxeTE4bGd3Y0UyYlMz?=
 =?utf-8?B?Rk9lcFNTNXFCWUJUM3dCZW85S2pJc1VmWnF5bEN5UWozTFIzZ3RLN1VVek5o?=
 =?utf-8?B?ZU16L1M2aTkrL0Q0MUhXQ25Ua1kxdnhKNWJHSnRDWXNuN3IxZ2F4ZVBNdkhB?=
 =?utf-8?B?R1dGVHo1cmt6OUFmTDdnMkxBZ09LMVBGU3hyUXBiejc1bjU5dUxCb05kdldD?=
 =?utf-8?B?aERIdUhVQnI1WG55eDRmTDBYQnEwUVBBVG1UZmkwZnVvemJSZWNJN0crMG5V?=
 =?utf-8?B?MXRWVmVPOStkdk0ranJ2Tjd0eWx5d1MvQUtxSFFMS29FZ2Y2R1QrZjQ5K3Y5?=
 =?utf-8?B?bEJsYno0UitkYUxVV3lGV2JKWWYxcDhGV3FueU1JK0xkT2RPaVVzbkk4RWJs?=
 =?utf-8?B?aTE4VGFQbDZNVGhHZGxqeVptVXRBNE54NUFQWGNwNUFjUlpwQS9SNW1YaDR2?=
 =?utf-8?B?cE1YOUZCSy9IRjNRWVVQbEdPTVZFT2ZwMi9IVkNDU2RFbldSMGpYUkdkam9R?=
 =?utf-8?B?TGZuNDluREk1Yll5UXVyaGRhSVNBbTRjK3dXL3cwS0FPKzVpeFBjbjB2RmpT?=
 =?utf-8?B?dDhGQlRPa0ZNMWswVXFHN1dEU3V4WGVxaG1xeE1IVm5EdFk2M2JJTHh6ellY?=
 =?utf-8?B?RXBhaVoxRVhLTXdWamg0NHpzQlZDREF4M05YS25vays1eXFDaU5Mdz09?=
X-Exchange-RoutingPolicyChecked: 
	PpAwLnJXpieCqWPL66NuuskPWCEHXaQ5O6pnQsajZ5nlk/iPGPPyLe+H6/QEOC1KhtdYHe09ott3aB0p+lLuK3/GZbWK7i7FD8mHZBepl928MQF5fdolGU03XLIoV+Ya4l/miUiIaHnXd8nEEHmOde0yx5HobXxlc3n0cr1mTu+/3UQeqP8SKPzMqxEq/knmGvETIeA7+g/+KluyaYzabTE7MFlkBrRQ4XSDtuKyCZ3kwhid6IsBgMjALvy3pcJAXihhGUDvmopnwobRdhKE9gQlCMD8dVsI49RQULTX5Z4SAgr8MfaDmH1UPujkLDrsOl0wN4MzEdpoIFeCNgk4MA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d074e6c-49d0-4ba9-a4c9-08dec0dcb098
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 19:25:22.3032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AWddJ1/qz85BoSW0RgeUWJfh8NwXP0Wkuzv6+/YrrZPfmvW9/LqY36Kh/sTGpp4FYl04yg0o63+jZskGz1XNeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6674
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDE4OCBTYWx0ZWRfXwaISsLRISgxV
 WeafYpBF3LelsZtdCu0+NC1GKApUDboh7/NHVmcPH+5qe8rhBwxcb9CYJ6DKKFIaal1+vBnaRC3
 Cg6zPGJa/xZ4HoiGbkXX/ySfH9KODbGg9lwpZkjgoBek3RvpPlpiPhDGrJ/3cj2//RGLrzTPUyg
 GctJfU0Wp699IhdNp4nxjGDz8s3Y4plv8S3U66UQHbqP9U6OQQj7fN7y9Fqm4WQC33ql5xZ83fE
 3eMBjJOKsD/MeNxJva4d8TXpLipFNxZUr26jj9ODIK08o5sHdf73vy/9E3ecxwvdEIAQ6K7CZlZ
 FSRRL+8iB/btoTlE8wOSmftjt5SiUwCYbzWTPMcn2Oo9CUHFD7pROJzJBVVOPyDOTaNKLrj+srO
 rBT1NfoUEiCk3iylnm9Yl0TuBCCy2mIhLpj2l20pCKMHoqJqureOHr32mPr4OtpUO+oE4i/tbaW
 QWQM1C2B+54qwG/WRNg==
X-Authority-Analysis: v=2.4 cv=Opt/DS/t c=1 sm=1 tr=0 ts=6a1f2e25 cx=c_pps
 a=YvyvOXr+GU2iduXSFDI6sw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=Q4-j1AaZAAAA:8
 a=6fK5SK4Q6KJUmG0xJXMA:9 a=QEXdDO2ut3YA:10 a=7CQSdrXTAAAA:8
 a=yj-aMKAYKbz0kkd27lYA:9 a=mfpsbEGLnfEARFxV:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: HqrXKh1jko6RgA4vnqweZFXg3o46VwYM
X-Proofpoint-ORIG-GUID: 7BWkT2SCO431D8tKzRyFpPkQtGxzauPZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020188
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 19:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238070

--------------Y2LiGR7j3ZpR03EYpNdRWs9K
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/2/26 12:57 PM, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On 28 May 2026, at 21:26, Quan Sun via lists.openembedded.org<Quan.Sun=windriver.com@lists.openembedded.org> wrote:
>> - Add python3-qemu-qmp recipe (0.0.6) as a separate package. The QMP
>>   Python library was removed from the QEMU source tree in 11.0.0 and
>>   split into its own upstream project. This is needed by
>>   qemu-system-native for testimage integration.
>>   Add an entry for this recipe in maintainers.inc.
> Can you split this piece out and send it separately?  We can merge this now, whilst the graphic and other issues are fixed and tested.
>
> Thanks,
> Ross

Hello Ross,

Do you mean I add the the standalone python3-qemu-qmp package to the 
existing qemu 10.2.0 recipe and have qemu-system-native use it instead 
of manually installing from the QEMU source, i.e.,

1. Add python3-qemu-qmp_0.0.6.bb to meta/recipes-devtools/qemu/
2. In qemu-system-native_10.2.0.bb: add python3-qemu-qmp-native to 
DEPENDS and remove the manual install -D ${S}/python/qemu/qmp/* block 
from do_install:append()

Or do you mean something else?

*As Alex just sent out a patch that would unblock the qemu upgrade to 
11.0.0, which means I don't need to take any actions here?*

Regarding the graphics issue, I do find something interesting: maybe the 
upstream qemu commit 52053b7e0a ("ui/sdl2: Implement dpy dmabuf 
functions") which added the sdl2_set_hint_x11_force_egl() function. This 
function is supposed to force SDL to use EGL instead of GLX (which would 
work with llvmpipe), and most probably something could be wrong there. 
Unfortunately, I'm currently busy with other things and not performing 
further investigations.

Thanks,

Quan




--------------Y2LiGR7j3ZpR03EYpNdRWs9K
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/2/26 12:57 PM, Ross Burton wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:85CB8A63-D069-40E7-A0C4-74D615E6CAAD@arm.com">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On 28 May 2026, at 21:26, Quan Sun via lists.openembedded.org <a class="moz-txt-link-rfc2396E" href="mailto:Quan.Sun=windriver.com@lists.openembedded.org">&lt;Quan.Sun=windriver.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">- Add python3-qemu-qmp recipe (0.0.6) as a separate package. The QMP
 Python library was removed from the QEMU source tree in 11.0.0 and
 split into its own upstream project. This is needed by
 qemu-system-native for testimage integration.
 Add an entry for this recipe in maintainers.inc.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Can you split this piece out and send it separately?  We can merge this now, whilst the graphic and other issues are fixed and tested.

Thanks,
Ross
</pre>
    </blockquote>
    <p>Hello Ross,</p>
    <p>Do you mean I add the the standalone python3-qemu-qmp package to
      the existing qemu 10.2.0 recipe and have qemu-system-native use it
      instead of manually installing from the QEMU source, i.e.,</p>
    <p>1. Add python3-qemu-qmp_0.0.6.bb to meta/recipes-devtools/qemu/<br>
      2. In qemu-system-native_10.2.0.bb: add python3-qemu-qmp-native to
      DEPENDS and remove the manual install -D ${S}/python/qemu/qmp/*
      block from do_install:append()<br>
    </p>
    <p>Or do you mean something else?</p>
    <p><b>As Alex just sent out a patch that would unblock the qemu
        upgrade to 11.0.0, which means I don't need to take any actions
        here?</b></p>
    <p>Regarding the graphics issue, I do find something interesting:
      maybe the upstream qemu commit 52053b7e0a (&quot;ui/sdl2: Implement dpy
      dmabuf functions&quot;) which added the sdl2_set_hint_x11_force_egl()
      function. This function is supposed to force SDL to use EGL
      instead of GLX (which would work with llvmpipe), and most probably
      something could be wrong there. Unfortunately, I'm currently busy
      with other things and not performing further investigations.</p>
    <p>Thanks,</p>
    <p>Quan</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------Y2LiGR7j3ZpR03EYpNdRWs9K--

