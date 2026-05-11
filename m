Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 137C5CD37BE
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 16:39:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54825.1778517587386390134
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 09:39:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ArDcFWhG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9591c3dfe4=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BGdfil2159475
	for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 16:39:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=6wRfTi+uC1O+I1zGV+oIxu
	6ne+q3WC9WOBEsWru5dG4=; b=ArDcFWhG05JI7yHAGV6u3ZQoiv4ttd+WuUiWK/
	y7RSwaZ+PWSMBUMqKtInU/xsA3D4fElTp9QJ+f1qO8hYOS+leS0TU4OgZPh7L7Vx
	R6flZeWPARZrCrtYJOfDiBD3GjgJP1XlrBNBlpeaNt5XxI1fLjvt30cYZKHdUtu1
	ccA7oINPpGfvU2bjQoMXPFm95wIAnwp/ZDHrbBIN+Mcf+ZFdmJibpaRItGuBg0yS
	erosLSucQ/h0/tf+1WnZfGCE33jJLnPPO5Kt6QgJMDRS5dM0O0U+hdV0L1UZpfKS
	xqeuE/DT+HNmcN51NeYZY6o+CWSV6clt8Ov9r3PPnWNGJY2w==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013023.outbound.protection.outlook.com [40.107.201.23])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e1t502b9d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 16:39:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DSHA/xu9zTwX1eNpxiZfWpqtQ0y5XREw82dimcemY6zImP4rGO96wA8JWHIAh7SoNkBqKcuCO2pJbxfcgnK0FzpB2EN3kF5NGgsxr/7yLzFnQwrZfkGeWRhRZOdP75umJYYcZ2xmHJkeg0BfszKU7POs4DoQ/9Tg6npbyHw2RXecax2/cFjba0YPmhQAQvf36rBRhF9FEN9h6cf0bh1SinG96+kauqllPmiV4u+2pIgpLCBRGKjr62aScoLOm7aMgudJkpF0WEiGZ6/1B89j6pmzzYlVqA8ZjFCV6WMIccCvcsfVEdUx+c9S3nV3Luz1jHJBpIA9se6FFJD+fYe+LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wRfTi+uC1O+I1zGV+oIxu6ne+q3WC9WOBEsWru5dG4=;
 b=QCi9LgPWjHxem7T3VvLeNzGnmcT+0eQBpK9fH3m2tVQEXL2rgxd6qOda5WIOTWoJngUu3lr0XKH6ymACw2B0IctuUHPJ+TizJoR1E6BQVRNVEBm4fYq67+dxZwYDpzam8xEcoaZG4X+FyYYutJomOlF5ZLra/J3JmrEjaU+04F63XrSufk8cq/wAkoe/cuq8ZLb0FhV+Ez/rgZ0Y5kBppQHhHjbRA0DO5DrZZ3HQZChWl2vqcDM6HZk9U3s83dOQ19tURs/nXDG0mhh9yhnhVcha0K+p4jMnWU4t4gBy0/bM2UfwrBIyvTadIeOTaqF9mMyDfOXXOuPpCt503cgOaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SJ0PR11MB4799.namprd11.prod.outlook.com (2603:10b6:a03:2ae::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 16:39:40 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%4]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 16:39:39 +0000
Content-Type: multipart/alternative;
 boundary="------------SW9FslrvU0QMJjikbCVVmVE8"
Message-ID: <aa4d8b7d-b7e6-4839-9a30-1bf82398e739@windriver.com>
Date: Mon, 11 May 2026 12:39:37 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] glibc: stable 2.43 branch updates
To: peter.marko@siemens.com, openembedded-core@lists.openembedded.org,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
References: <20260507224813.3496793-1-peter.marko@siemens.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20260507224813.3496793-1-peter.marko@siemens.com>
X-ClientProxiedBy: YT1PR01CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::22) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SJ0PR11MB4799:EE_
X-MS-Office365-Filtering-Correlation-Id: 151bc598-42ad-4189-d900-08deaf7be548
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|1800799024|366016|13003099007|3023799003|11063799003|56012099003|8096899003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	K6uaVdi3clzlg6tz6yb/0ufGbw51k9ssPHfRx0B+5Am2TmuiYR1xMQ/1cXCuLh28pqLCiIYPBplDEl+E7hKklgLMYD2GP2UsnDsPszd8NtLbdzEfOiAisSNEomgOWfUs+uLHHOPQbDDHwg1T3qz6PVPm8hHYy09KxmJ9yuHlTnoHaO1bdD9gZ/FgsMyaINThlmyf6KltqXsiWJ6PgHvc2qBjpLqhSuXK+7ga6QbP3JhtK9XWHK+DCa0zcFIZ/BE5voqM4x0lz5oSY8hhB/1Pvn5GPNEzpFN6JYJoYKulWhHgRhoJSN2GfNg9aEp+b0mlUyetZebVCcZbpuS56uzCbJ72zFFfGE+t8MuLIu0Wc7F7ZMU/EdD53Q+0lGsVcrkHiFqOOOMTxXK1O6Mx35MmP/KFrh4hZRk9nCPEPrzm3tB+XwCVFSbsUHawHWkmiB0DonYPqXT2Y9/p5aYqQEUHACdWFyL7GQTNPMzxRKlNQzo5fLeeqizQf/70EDuQkIpOrJNuQbgKlSLjChL0tal901exzBJ6uQTOuM48Cs2ODKwMEMe8zfd79mB6GVjDFVv5mKaCJcR5O2TweGjOgf1ONDW+9UYCypLXy2vUAxigl9OqqoKs0x6xEijlkbwQh5zdTKfHChORYRo5JTalAqwL2A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(366016)(13003099007)(3023799003)(11063799003)(56012099003)(8096899003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dFhucHRMaGdYeGlXU2txQnJGSmI5WTRTSStHSDJCY21wVytzb1BJMG1RcUJH?=
 =?utf-8?B?NUp0WDN2dFpaenVROERQOTdkbWVWejV2RDVrUHlhaTQrZnQ4c01LQnN6bkJM?=
 =?utf-8?B?ajNGZXppQjh2R3VsYVdDZHQ0czR1S2ZqSnFHLzFDN2doRGpHRjBQYS9KeXY4?=
 =?utf-8?B?ekFlUk1zajhyUkZGVFlQYnNIT3lZNXJxZEMxN25CKzJwRkIzNHN1TEMxUlVs?=
 =?utf-8?B?clJ1cjdQS1Q2RHhTRTBHc0NtK0w2L0RmS25SRmI3Tzdza3dFR1VWbk1hVkti?=
 =?utf-8?B?M0NFc0htM2MxaXFqemsxeDBiWUdEc2ovUVhXZy91K3czMERtYzlweUJjUVo1?=
 =?utf-8?B?TUkzTDduRkd2Y2Noc3dSNVRteTZxakEwbXpkSmluNXRVMWtUZmN6NzhpU3Zl?=
 =?utf-8?B?TmhjWFVTSXZzODhWeUV1MGVONitNMkhZVHE3d0xUMHZVekRFbkdEZnhiaVpT?=
 =?utf-8?B?bW5LaXhIWnJKY3FITjFVdUwzdkkvaC9Pek85NUVNZTV2NWc2U0tPSGlNTHYr?=
 =?utf-8?B?SWJDeXBmZnY4Zjd2eWp6QThTdmtMQmFidDhyOVpITnJUNFdyQ0xuT2ZaVFZF?=
 =?utf-8?B?MlIvb1hjaUZ0dERVRktPeUN5dG8yUmhpTFovZHJSWnBoQmkzQXhURUFaUHcx?=
 =?utf-8?B?NHV5UlE4cE9OeUc3WU1RYjJDSjNRNlBLcytVV05TeTgrUUVUbDBXVHg5YXEy?=
 =?utf-8?B?RGlDcVlrZHBoZHZvc0F4OTdINUlueWtMQjd4NWV5c1BQaUlkcVM3VVUwZzN6?=
 =?utf-8?B?TUZyT3BBMTRhb3N6T2thSjNNOHRuT094YXRhZXE3U0QxZFp3R2s1K3NORmty?=
 =?utf-8?B?UndoSTJOa1BRb0grTEp2NjI3WG5rajNpL1NSemh5USt1MUdFRTB5YmhjVnRE?=
 =?utf-8?B?eFZPa2hSdVd6MUhPWmJTUkFFZzhtS2tUVGRJYTdWa1FtamxlSGVDdW5mcXc5?=
 =?utf-8?B?OTJEc3BTQ3BFeXYzWERFUHNxYUtMSk8wZGtJVFdoM1BTRG1jWXZIS2xsZm5Y?=
 =?utf-8?B?TFJ6MmlmWGk3L1pMbUhVTXlDZVJUb0ZVQU1vaW1SWXFCenF3enowRzJCMS9W?=
 =?utf-8?B?eWh4cjI0Sm1iT1B3S2Q0TkxRRkFRdk8vVzRxN2E1bTQ2UTFzZlJIaW94TUs5?=
 =?utf-8?B?OXRrRVByOFQzanE5WjRUckRBYzIzZE43SlhWbSt2bCttU0ZneGlLS3FXWWJ3?=
 =?utf-8?B?ekl3UElNbG5wMWZiYU56S3pLK3M0VDhhdDdtMXNzYzNQbjNCSE9USWpzZXpJ?=
 =?utf-8?B?WDNxZGdaQmhFekZCZ2Z5U0p2bzNlZkFCeVhtS3hyODQ1UkltTWZsQkYxUURQ?=
 =?utf-8?B?Yk9lVnc0L0wzRXAvcDdZM1l1V3BZbmEyUnVLdjZRMm1RaXBBb3lwU3ZuaS9K?=
 =?utf-8?B?SUdHamtLbVREVSs0VHBqb3orTUFwMGdZcFNzd0IrSkpQbC9CWXNWeVVpTWNa?=
 =?utf-8?B?SzlPM2xWSWdVRUVEM1ZtZ1pEa2w5L1pzbjhMVGxwQkJ5Q0hFenNNeXhJL214?=
 =?utf-8?B?VTl0UkRVeCtVRFhDWVRYS3ErMHo4OGtLT2xSQUQ2a2IrMjZTMGpBTVJGUytO?=
 =?utf-8?B?cDgyUTFVMGYwQWVMaFgxeU5uZzk2VVJBRDl4dk1zT2gvZFhXYWIxYm9weWhC?=
 =?utf-8?B?cXlLbnpZZFovSldHTFNvL1Z1TnhrZUYrZFIvQi9BTTZaL1FFTnhhakFPTHlU?=
 =?utf-8?B?TXBTaGs4ak9xVmZDQlpXVmJhWVo1eEkwUHh1T3M1ajFjcCtEdWtpc0FTWDVr?=
 =?utf-8?B?Q3JIVkN3dUZMem1BZnM2L3RjYmRucDFmQ0xKaTk2ZzMvRFhqUy9NcnVsMkdJ?=
 =?utf-8?B?ajJldVBQeE91N0c5SXM2ZkU0dG5PQUF6M1N4VEMyUm01U0NYY1BTWWl3OCtB?=
 =?utf-8?B?UEVJZDA1cGdKZ1ptcm5vTWhPN2tIa3ovMHFvQTRzdFRkMHVGRThIU3Zoc0NU?=
 =?utf-8?B?UUY5N3hGVjVTS3ZVbWRXaWdPMkpKNDg5NHl4MzU4NEN0ZVRqa0pBK0x6UnJJ?=
 =?utf-8?B?UVFqN0FiRUVCZ3RpR3EvbGhjYU1KOTkxTk0rMFhaU1YxUkh1Wk9yV1JGeFlM?=
 =?utf-8?B?bUxJVldOUUFFWGJ4cUVMU0cwengzTjFVU1pGWHdkQWFMSk8zeElVSkdlTVIz?=
 =?utf-8?B?Q0M5VmFVMGxLTzU0amUxR3htZlpqQTBOZytHMytPV2d4ejRrcTVxcitiVzdQ?=
 =?utf-8?B?L0h0bW9KM0pNVVJ1TUhxdCtpT1o0SVZpdEt0WlpQNW53bVNLUFNPUG84bjZh?=
 =?utf-8?B?VkwvS3FSRHRvV0NGZHdHdmM3ZG1mK2tpdmMrZkFvMWxNTE5acFZnaVlzUnNs?=
 =?utf-8?B?aFkwMWhGczhyeFg3dUVMdG1iR1E0YUxRbDdMWHV3NjJxN20vZ1poUGxHajly?=
 =?utf-8?Q?A1tl572MpxQ26mvs=3D?=
X-Exchange-RoutingPolicyChecked: 
	Jo8yZvHVGhtwvUNqAI0aYsFHGGPIIwg3AT6PI56BPGVyGG/wj90rKkhqRgroKzdXhhkW3w/jbYzD52sXysPfVfHhq6kOJbIEElIsL5Hm3xzZ28oixn7eO7xgaQGoiZ0b7QODI5z7lf+HtgQOgsc1fpKVW7G+iwY9XqTwTVCDU6brLlBa8+OjVfHhQKeEFHtizJfSiuWoTfwY8aUfuu4DvYB7JrTsun7/iL/KPOXl/xytHN7FauonmdFRCReE78WQ6HN7MU3bqCHA9exgli+nnLbbZp6FNFrzZlfHhMJ27T4A5eg62jZOYhYnBTuqAQ2ZEj5j9gL4CsHNnv3jT7VJCQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 151bc598-42ad-4189-d900-08deaf7be548
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 16:39:39.7738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kFD2+tasERzSyaRERj5Bx3chtr6nruEkZJOlQT7+5qcKvQ4tdcIkvHHvh+lG64d66gsbyFCh5e+6vlDboQ68LYionR/9fCVOJOo62kcMLSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4799
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: Oy58szJitb8TDYHuhUVKQr3qrUsNnQvk
X-Authority-Analysis: v=2.4 cv=C9fZDwP+ c=1 sm=1 tr=0 ts=6a020652 cx=c_pps
 a=JigUrrSO7vm3KiUpdjzzBg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=Q4-j1AaZAAAA:8
 a=a_U1oVfrAAAA:8 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=luKbfgiTm0OkNR8MTr4A:9
 a=QEXdDO2ut3YA:10 a=_53-xGbMz_tefR4YBzwA:9 a=KfBNGgSYgcMOO0eB:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: t5PVcoHz_9p1KdVTxV9CccS2Q28LnUtF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE3OSBTYWx0ZWRfXzQRm+eXEwYgr
 +aBqA8yKwP581PjchueNqVlejUcO6eObOKBpLDSynPpTulPRNumzX/ROVy92E7/CKOZuUmzdwX1
 reAYAkgRKj/Q4k5VjAQ3cLNz4x67vZCCnTPBHAZDcmXGxRrKa00ntEGN2h464NRb9o2SotJZa4a
 FMTlDpo55DRMxORhvqXd0fgmlqu+3s4ChjaA5BffxpIYLOp5EBuDcHr1/TGTAfgvVhpPzYanMb0
 dsbh0QbOU5b/p7qFfveRkUAqYy3wvLRMszoSuMQykjTDBrTwOs8K4bu4i2RCFz6lhzUtnmgvRgZ
 gTYtrnKVOlxGNxBaGBOKB2pj07pMCwF+MF7uLX4nPea7ep0xluLxRYzu7nmEjS58JfwpUznaTJx
 /bGQXV94Unf8Q9E6MSIDZlS5ld4M22XrZ15QMF04wGQFL3m0bQQYU0AWSo+HKzmBW6eRNTGEnps
 cyzQWO+hmOECXBTxU4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_04,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110179
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 16:39:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236821

--------------SW9FslrvU0QMJjikbCVVmVE8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-05-07 18:48, Peter Marko via lists.openembedded.org wrote:
> From: Peter Marko<peter.marko@siemens.com>
>
> $ git log --oneline ce1013a197eb4a3b8ff2b07e0672f4d0b976ce7c..e9517114acc77c0b8af9da6700107df16882b701
> e9517114ac (origin/release/2.43/master) abilist.awk: Handle weak unversioned defined symbols
> 1634cc11a5 Linux: Only define OPEN_TREE_* macros in <sys/mount.h> if undefined (bug 33921)
> d1d8d27164 include: isolate __O_CLOEXEC flag for sys/mount.h and fcntl.h
> 8362e8ce10 Use pending character state in IBM1390, IBM1399 character sets (CVE-2026-4046)
>
> Testing Results:
> +--------------+--------+--------+------+
> | Result       | Before | After  | Diff |
> +--------------+--------+--------+------+
> | PASS         | 6629   | 6632   | +3   |
> | XPASS        | 4      | 4      |  0   |
> | FAIL         | 105    | 103    | -2   |
> | XFAIL        | 16     | 16     |  0   |
> | UNSUPPORTED  | 559    | 559    |  0   |
> +--------------+--------+--------+------+
>
> Changes in failed testcases:
> malloc/tst-malloc-fork-deadlock-malloc-check  FAIL  PASS
> malloc/tst-malloc-too-large-malloc-check      PASS  FAIL

 From patch review meeting, we're going to merge this but I have the 
following question:

It's a little odd that his failed.

Is the failure reproducible?

Sundeep, can someone on the team reproduce these results
and if the failure also happens for them explain and fix the issue?

Thanks for the update Peter.

../Randy
> nptl/tst-getpid3                              FAIL  PASS
> stdlib/tst-qsort3                             FAIL  PASS
>
> Signed-off-by: Peter Marko<peter.marko@siemens.com>
> ---
>   meta/recipes-core/glibc/glibc-version.inc | 2 +-
>   meta/recipes-core/glibc/glibc_2.43.bb     | 4 +++-
>   2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
> index 015e7943c5..af3db54cee 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>   SRCBRANCH ?= "release/2.43/master"
>   PV = "2.43+git"
> -SRCREV_glibc ?= "ce1013a197eb4a3b8ff2b07e0672f4d0b976ce7c"
> +SRCREV_glibc ?= "e9517114acc77c0b8af9da6700107df16882b701"
>   SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
>   
>   GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https" diff --git a/meta/recipes-core/glibc/glibc_2.43.bb 
> b/meta/recipes-core/glibc/glibc_2.43.bb index ffc17eb072..b84c55ca17 
> 100644 --- a/meta/recipes-core/glibc/glibc_2.43.bb +++ 
> b/meta/recipes-core/glibc/glibc_2.43.bb @@ -17,7 +17,9 @@ Allows for 
> ASLR bypass so can bypass some hardening, not an exploit in itself, m 
> easier access for another. 'ASLR bypass itself is not a vulnerability.'"
>   
>   CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
> -CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-15281 CVE-2026-0861 CVE-2026-0915 CVE-2026-4437 CVE-2026-4438"
> +CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-15281 CVE-2026-0861 CVE-2026-0915 CVE-2026-4437 CVE-2026-4438 \
> +    CVE-2026-4046 \
> +"
>   CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
>   
>   DEPENDS += "gperf-native bison-native"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#236626):https://lists.openembedded.org/g/openembedded-core/message/236626
> Mute This Topic:https://lists.openembedded.org/mt/119206065/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------SW9FslrvU0QMJjikbCVVmVE8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <head>

    
  </head>
  <body>
    <div class="moz-cite-prefix">On 2026-05-07 18:48, Peter Marko via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260507224813.3496793-1-peter.marko@siemens.com">
      <pre wrap="" class="moz-quote-pre">From: Peter Marko <a class="moz-txt-link-rfc2396E" href="mailto:peter.marko@siemens.com">&lt;peter.marko@siemens.com&gt;</a>

$ git log --oneline ce1013a197eb4a3b8ff2b07e0672f4d0b976ce7c..e9517114acc77c0b8af9da6700107df16882b701
e9517114ac (origin/release/2.43/master) abilist.awk: Handle weak unversioned defined symbols
1634cc11a5 Linux: Only define OPEN_TREE_* macros in &lt;sys/mount.h&gt; if undefined (bug 33921)
d1d8d27164 include: isolate __O_CLOEXEC flag for sys/mount.h and fcntl.h
8362e8ce10 Use pending character state in IBM1390, IBM1399 character sets (CVE-2026-4046)

Testing Results:
+--------------+--------+--------+------+
| Result       | Before | After  | Diff |
+--------------+--------+--------+------+
| PASS         | 6629   | 6632   | +3   |
| XPASS        | 4      | 4      |  0   |
| FAIL         | 105    | 103    | -2   |
| XFAIL        | 16     | 16     |  0   |
| UNSUPPORTED  | 559    | 559    |  0   |
+--------------+--------+--------+------+

Changes in failed testcases:
malloc/tst-malloc-fork-deadlock-malloc-check  FAIL  PASS
malloc/tst-malloc-too-large-malloc-check      PASS  FAIL</pre>
    </blockquote>
    <p>From patch review meeting, we're going to merge this but I have
      the following question:</p>
    <p>It's a little odd that his failed.&nbsp;</p>
    Is the failure reproducible?<br>
    <br>
    Sundeep, can someone on the team reproduce these results<br>
    and if the failure also happens for them explain and fix the issue?<br>
    <br>
    Thanks for the update Peter.<br>
    <br>
    ../Randy
    <blockquote type="cite" cite="mid:20260507224813.3496793-1-peter.marko@siemens.com">
      <pre wrap="" class="moz-quote-pre">
nptl/tst-getpid3                              FAIL  PASS
stdlib/tst-qsort3                             FAIL  PASS

Signed-off-by: Peter Marko <a class="moz-txt-link-rfc2396E" href="mailto:peter.marko@siemens.com">&lt;peter.marko@siemens.com&gt;</a>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.43.bb     | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 015e7943c5..af3db54cee 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= &quot;release/2.43/master&quot;
 PV = &quot;2.43+git&quot;
-SRCREV_glibc ?= &quot;ce1013a197eb4a3b8ff2b07e0672f4d0b976ce7c&quot;
+SRCREV_glibc ?= &quot;e9517114acc77c0b8af9da6700107df16882b701&quot;
 SRCREV_localedef ?= &quot;cba02c503d7c853a38ccfb83c57e343ca5ecd7e5&quot;
 
 GLIBC_GIT_URI ?= &quot;git://sourceware.org/git/glibc.git;protocol=https<a class="moz-txt-link-rfc2396E" href="mailto:diff--gita/meta/recipes-core/glibc/glibc_2.43.bbb/meta/recipes-core/glibc/glibc_2.43.bbindexffc17eb072..b84c55ca17100644---a/meta/recipes-core/glibc/glibc_2.43.bb+++b/meta/recipes-core/glibc/glibc_2.43.bb@@-17,7+17,9@@AllowsforASLRbypasssocanbypasssomehardening,notanexploitinitself,measieraccessforanother.'ASLRbypassitselfisnotavulnerability.'">&quot;
diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-core/glibc/glibc_2.43.bb
index ffc17eb072..b84c55ca17 100644
--- a/meta/recipes-core/glibc/glibc_2.43.bb
+++ b/meta/recipes-core/glibc/glibc_2.43.bb
@@ -17,7 +17,9 @@ Allows for ASLR bypass so can bypass some hardening, not an exploit in itself, m
 easier access for another. 'ASLR bypass itself is not a vulnerability.'&quot;</a>
 
 CVE_STATUS_GROUPS += &quot;CVE_STATUS_STABLE_BACKPORTS&quot;
-CVE_STATUS_STABLE_BACKPORTS = &quot;CVE-2025-15281 CVE-2026-0861 CVE-2026-0915 CVE-2026-4437 CVE-2026-4438&quot;
+CVE_STATUS_STABLE_BACKPORTS = &quot;CVE-2025-15281 CVE-2026-0861 CVE-2026-0915 CVE-2026-4437 CVE-2026-4438 \
+    CVE-2026-4046 \
+&quot;
 CVE_STATUS_STABLE_BACKPORTS[status] = &quot;cpe-stable-backport: fix available in used git hash&quot;
 
 DEPENDS += &quot;gperf-native bison-native&quot;
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#236626): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/236626">https://lists.openembedded.org/g/openembedded-core/message/236626</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/119206065/3616765">https://lists.openembedded.org/mt/119206065/3616765</a>
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

--------------SW9FslrvU0QMJjikbCVVmVE8--

