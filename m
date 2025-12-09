Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 687B8D3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 10:13:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4507.1765275182667386728
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 02:13:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=m/JDoLSm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4438aff1f5=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B96WUFH1976701
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Dec 2025 10:13:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=DbeLELIk4w6pd2Y+kxaTTU
	P7SwuMEPogNrFjtQ+u5so=; b=m/JDoLSmZWFQpfLU6+kfP/LihNmHL1j6ACucP3
	cPNSTHYzDG4FUghH4ZVrMfzl8h8P2qb6f04+bgnq9zJoXyFe4YyCEDW+5IucuYu7
	pZJB7txMVWG7ME6qIP4F2VCwdfGRR//wEQz41I5YahKud0vC/cEq8no6RLMRkVWu
	s3TFfcF25SfzLT6dsXtnYa2ddf89Wgtfo6zBhhfBS2hVx2a391GIkE9gkRDTBvmm
	s0TGqP7QPiA48iAwzChUMT6+te/0LY491OM2X550yTRGnenLicrTRl/j/IGRjQ2/
	UvxbjuHuDs5ykvMpzKTH5MfFtWCUGkBMDK1weAkaY4Gv09lg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011070.outbound.protection.outlook.com [52.101.52.70])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4avb742ueu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 09 Dec 2025 10:13:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GQuejy/LFk81UNnUUMiWXhLqfc3r7GkOrjAxduJpQaks+T7FNlkB3y/4mME2rp4no2h3IH9c2hx/g917RH155DNL4D1lfDmqRKKMnIg8zOXfaaD71PUzF/VKQrBSQRji132NKlGQwFqBdPxeO5LJxHWKEB6xOotpdLYZ8mCEB9OIPdWRt5KaVbOalbZkrVoReQ+pJDTQrwCF7Ubnnf284J9cFxbu1Cc+xC1tcmE1vTm9M/FCIhqLGFSQl5VY4hVzxYMpDnU7Fw2Dum8ThlCFESnEabNAvmyz6TwbjmH6xBzwX3uzlqB4bghZmH6UDpLW8HNJO73KAsdrPdHocAeLWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbeLELIk4w6pd2Y+kxaTTUP7SwuMEPogNrFjtQ+u5so=;
 b=SR4Y0K+r5WaK9KDhAkcnhd5DL/JDGuNrlSOBwEHgHW1KpGbLl6dHmgMZs1uJThjdnKAjnS4ad+CEGbBnbTtuooFaWvgGvxgcVzdjg4P+G5z/rfScN5GyhlPV9ar+W3oy1hrxKRmXY57PtOHtg3DLrNVM7crubttKv9Ts6qGwAwFlrpT0snyzFpIqn5g2xsH5+KmlNGvJlj8TgkT/fhRnxdVHr3I1KbnkN4+sDT/3UtO7fTjyUwD0tm+ZeHoWnqNVe6GhwRraVcr1yHm4tc5B6E+7CDJUAMOa47zyOWmd/lD66DwBP4brD+pC5JE6V1yBHc1KyaP4zGAPfTYsMljWMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by CY8PR11MB6915.namprd11.prod.outlook.com (2603:10b6:930:59::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 10:12:58 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 10:12:55 +0000
Content-Type: multipart/alternative;
 boundary="------------IGeameVldqtq9cbJObQQHKL7"
Message-ID: <e4a61408-3316-4f00-b6d6-dbbd236b5a4e@windriver.com>
Date: Tue, 9 Dec 2025 18:12:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] go.bbclass: change GOTMPDIR to improve
 reproducibility
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20251208091148.368769-1-changqing.li@windriver.com>
 <CANNYZj8TPT+Y0-ni63tyGPWZHZ4zweaAm7nKdMM_KA40AOkwGg@mail.gmail.com>
 <47201384-ce8d-4188-be45-4bbde9a27601@windriver.com>
 <CANNYZj_kb0aX2TbAc2dQujwrDit_nOh=HhAQi5fG-U0+DurM8g@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CANNYZj_kb0aX2TbAc2dQujwrDit_nOh=HhAQi5fG-U0+DurM8g@mail.gmail.com>
X-ClientProxiedBy: SG2PR02CA0127.apcprd02.prod.outlook.com
 (2603:1096:4:188::7) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|CY8PR11MB6915:EE_
X-MS-Office365-Filtering-Correlation-Id: 30929eef-067d-41af-a875-08de370b84f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z1AxYWtvTkF3TENCb3Fwdit6eXNVbHB6Y3FUNUVXRVBWU3NocHJWNW5WWVN1?=
 =?utf-8?B?dXhEN3dVVXRsWDAzbFZ6dmJaUUtZTmJ3M1h3UEY3ZVdhTnVmTEJ5TWdQeXZQ?=
 =?utf-8?B?dEF5SGpjYUcyK3JRQkFvWG5GZzZmSHhCRHJOTjlqdUEycUE4bGxYOGwvR29n?=
 =?utf-8?B?NmpObmR3QUdDaHp1TTlSYXlncDFhSjVTdHJwOEFRdEUycGY3bHUrUU5LZlRi?=
 =?utf-8?B?R0F6K3ZBV0xCRS9sd2VOQnJFaTJPS2l1Q1RRZFdPSDhrY2tuSzdIblpIcGcw?=
 =?utf-8?B?bUI1Ymo0VVJqZUkrQ2ZVWDVPQ0d2MGFTYS9sNy82MVJBRnh5dVJNSFRndmd4?=
 =?utf-8?B?NG9EdzRBSmFRdm9nNG4vbnhxY1N4NXhwK0l0QlFKN3M1ZnRLVFBZNjhGMjRH?=
 =?utf-8?B?YnVmeU1Id0Q1UXlTVUoya243b1JCRkdYdXRnOXFReUt4WEdWclpNcGxkUGxT?=
 =?utf-8?B?QUs2WEs3Y2VUVnR6M3pBV3ZkUWpzLzk1OGpTY2Jta0pLUzRJZkVlaSs0TEUv?=
 =?utf-8?B?dTNZdnZodHpTQmFVeXQ2aGZoQ0RVTTNueHVPN1NmYnMrbVJKV1FzcUQ3SWow?=
 =?utf-8?B?M1d6bnkyMEUrZ0hpVm5IMklLTXgxM2dFY0o5MkQvTEFjT0EvR1JKYVlnV0NZ?=
 =?utf-8?B?cVdQdFNUdUVsZnpadTY1T3EydWVybkw1U2RubThUaGdxV0t1Wkw0d1pCalNa?=
 =?utf-8?B?UFU5R3pwMkZrK3NjR082alJDT0Z3dUJIb21HaUhaVkVsdHF1WHdYTkRTcEF4?=
 =?utf-8?B?UHJ1VVBqUkozMWE4R0pPT3hHQlRTRmZncGRPR0h2SnplT281aExFR1NKWW9w?=
 =?utf-8?B?SklZNzJNWDJ4MXpvd1ozNmU2TXlZZDhxNlJSTTc5SWsydGM3d0JWaWRXWTZp?=
 =?utf-8?B?SFR1anlBWlZnblNmZnJ2YVR2YTY2Ny9OSjhDVFZNSkV4akZRKzhPUmVDeEwz?=
 =?utf-8?B?MFlMZGxqWnIxRXozejVLUnNLTk8wOXlLN2RlaklHbk4zNGNienFZSmxMOWRS?=
 =?utf-8?B?amFZRjNuSnBqbkJqdy85Z1ZHTXBWYUdaMUdCdThGMW8yVnBnQjFJdGdXdlVu?=
 =?utf-8?B?Mk5pV1ZZRTg1S3c4ck0vNm9qZHErMnFaSkMwV0luYzJTUS9DVmNNOFNFWjlM?=
 =?utf-8?B?cXV3ZTZaTEU0L1JUR1lOOXlHUWZIUzdja3BvaVNmUm9pZWtrWXVBU25TVlA1?=
 =?utf-8?B?QWNwWWtNL1U3L0p3b016eWZDUzU0YXN6L0FvOUFVSmVnWEJrTXR5NmdnZ0tx?=
 =?utf-8?B?V1U2TG13TTJCT2l6Tmxlb2lxaFpzNTlEZGR3WHFHOTZUTXI0aTA1U1VkVXJV?=
 =?utf-8?B?dzdRaW1kUHB5ekFQdiswMHQzZzJ0amJaNDhBVUxldXdtUVEzeGlJVmt2djdk?=
 =?utf-8?B?dnZBQy9rWFNsMlJ2UkkzNm9ScmhSTWY5YjNDVjRobW5tdXBQQ3praXgwOFdU?=
 =?utf-8?B?Y2NtWXI2YWNKUjU0L0szNFZMaE54RktYUmthbGNXcjNlTHdyMWUycnhvKy9j?=
 =?utf-8?B?c0pOR0FQZ2kvREplN3o5WkZRWitsSmJLMVp4eU5DNHY4QW56SVZjeXFOdHpM?=
 =?utf-8?B?cUw3amMrQkhQM3AzY0s3Nkl2d0ZMTnUyT1FsOUpEL0hlbkllbWQyMFFRb0Qr?=
 =?utf-8?B?MXFiUXRZM2VZUjZRa1NNWkt3c0RhSVI1Tld1ajlvVzBndm1lQjZyOGVER0U5?=
 =?utf-8?B?Y2pMKzUzRFJlN1hoSFpGRHhXR20xVFJIOUZveTM3RkU4UGRJRXlZZVBSeGhO?=
 =?utf-8?B?Y1ZLd3R5WW1vQWliREt4RkkrZEM4V2ZxUEgydkwzOVNMRmZMbVQ2TDdJcFdk?=
 =?utf-8?B?VkRoQzVwZlkwNEFWelRJME8xV3ZIdmQ3K0pOOTdYU2l1LzBTbFNSZHVQbi9Q?=
 =?utf-8?B?Sm5DcEhxM1JQOSt6dU4rWHh5ZXdFZE1vZmJkSExsVU9hcXBqaFlTVjRyWmpT?=
 =?utf-8?Q?jWgG8C+xuDPt4sfq67o7MVIhTHdRbYFT?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?czdWall1Qlo1eGc0RUNaRTdQaCtPc0ZaVnpFSXpXQWVmN3h6SEk4d0Y5OG8z?=
 =?utf-8?B?aTdvTXBRQit0TlFlYzJkZFdrZWJWYnJIV2VvbjQvR01zWnZHZjdyaStmZWRM?=
 =?utf-8?B?OUU0OTJBZGRiQ3NkTTEzQ0tuNDJBbDRucFY4SXlkZ2c2ZXRBTWRaRUtSU1FR?=
 =?utf-8?B?cmphV3hmTmVmNUxFQUpMZVRZMVdBY3hpNG9vdHVzeVZjMzlzQ0RXTC91YjFC?=
 =?utf-8?B?anUzcmo0SlZkTWxxNU16YUpUb01BL3JZRTQwcStEQ3JvUCtIalkvQ3JDSmZw?=
 =?utf-8?B?YmI0RTFnOWx5WFBlaHg2bTNuVWorVERVU0FVQlFZZ2YrTlk4ZVZveXBtUVds?=
 =?utf-8?B?WFNWSTE1VmlTVkpDaWpvVDZFNWtxbS93cEF6RFdXNnlFdkxSVlBNU2NFU3Nz?=
 =?utf-8?B?Z24xV3RPUmFPWGhuZExkZmhUcW13Z1lkbVhEcnIrV0ZqZDFqakswcDRxM0tX?=
 =?utf-8?B?bGY1b0RBa200NWhwNURZMkdhUHFGOTNsUUNxTHVERnBrSlhqazJEZTBRbjY4?=
 =?utf-8?B?NlIrd1N4b0ZPTGhWSTd0b1RNMEQvZGtYOUcxQSt0am85dU9nNlZHeFRGZS9t?=
 =?utf-8?B?RXh2WS9TWk1DVW13ZzBVSXVKV1FRN1hVZ1QwaUV0Ym5raTVPRVRQSGt6UnVC?=
 =?utf-8?B?NDFkQlFMck0yL2FIWWFMdU83SFM1WW0wTnE0bUhkUXowbTVVbUZOZ0VqbWtF?=
 =?utf-8?B?d3hZTVpUbEY0Q1FVb3BhUzNuQTQ3YVpZNVV2U2dBeDIrZy80RU9NUGRIZ1Nk?=
 =?utf-8?B?RWFYZWR0QXhSNkZCL1VwWmljZHpyTDAxNy9jZXJOUi9sdVI1R09yYndJMHpo?=
 =?utf-8?B?T3VCc1NIMHd0REI3MzdwU0xBOFBpU3puYm1iYnpDeEtoRUFVcFZFV2ZSSFo0?=
 =?utf-8?B?bEgrVkprMllBOC94YVlJL3J5UFJ0YUxSREVzNXoxWUNLU1I2RExvbVZUS3k2?=
 =?utf-8?B?eDJUZU1KcXNwMVljT0dicGhEY2ZHWDVBdkxuQnlDWHVadnlBOUtqQWtKR0NP?=
 =?utf-8?B?ak1Ca0p6QXcyZG5mbHlSL0VpSlRGREx4YU9BSWxwNTAvbjR6Y0dtZVBmRHRa?=
 =?utf-8?B?Z3dRNTlMbFF5V0RKdkU2R2tqT0NqYUZ1RnVoN2dKT1M2dUV5d1VFRGhmYXhQ?=
 =?utf-8?B?a1gxb05jUnZlY3ZGU3p1RnFVajJqTlhnMlc4dE5tc3hkRGdiN0hiSEFHVHgx?=
 =?utf-8?B?RkxwY09UbjMyQmdtQUFJOG54eG5Ua29UbnpsQnhML1REdWs5Yk43eWQwSWdI?=
 =?utf-8?B?OXRFSWhHYzVqblM2ZEs0TUsveDVrSVR2cFRrQnJiU1U0S1pnbnUwYzk3UTdS?=
 =?utf-8?B?aTBneVc4SWtvSllpSVdQRS8xWTROaEhSZFBWN1BIcHVyWThxNmpXSE9DdTNv?=
 =?utf-8?B?YTBjd1hjeHg4NXpQc3c3OW82eFBkbXVBREp0ajE0Njh2L2ljamFoVnJpVFlJ?=
 =?utf-8?B?Z0RhMUpQTU03S1ozcm1vV0EwWktxZWxMeTZhajRuNzRJUnFGL0tmZENYY2p5?=
 =?utf-8?B?bHFRanI4V2JNZUs0dVhScVZ4VUliZXpFcE5TeExHcC9IaUVVd0pPbGJDaUFF?=
 =?utf-8?B?MXNidmxDV1U1ZmNJRFVJYUdvWStFWUVNWkNEcDhubHlzVlVCOC9xSkFsWnhR?=
 =?utf-8?B?czh4eEtNOGJpT2lYWDB2SWs2NnhQSHVaSUJRUnM0Z3BLb1VxZlU3UDNsaDB1?=
 =?utf-8?B?eEx3SlErWEJCc2gzcEx1TzE2eUpGVU9zUmt6ZkJuRzVlSEhMUkpSSDJwOEhw?=
 =?utf-8?B?QnJXVHBoYzZvbUpYNWNyYzBYTFc0R21venJleDRURTk4aVhDOVNxWUNzVzV2?=
 =?utf-8?B?RlM4RVo4cWd4ejZ2dDVDNGJ5TExUbU1xMmV4NVI5NCtMVGJ2eVlnbmdTUFNy?=
 =?utf-8?B?VG1Zc1JaMEVVd2JSbmJvSGlXL20wMDRmb0JTNDhieHAwc28yYjVqU2llVmlj?=
 =?utf-8?B?ZHFrRHEyUm9hYnZ0anpSRTFuNTZnTm9nTXVocGlKNHRBdzNpMG1Va1F6ZSsv?=
 =?utf-8?B?Q3JOMXl5WkZKZ0NUUHcvcjBCUHpBMTN6U09kV0NJbTFrQkFmNk5vdW8velFF?=
 =?utf-8?B?YzFqYWpJNXh3U05rTHFrMXRFNTFJekI4SDFBaHFGUXovUnNaYWVVVnNNMkJE?=
 =?utf-8?B?SThtODNVZ29BSE94VC82azZzOC9iU3o3aEJQT2ZnUGJ3aWo5NTF3bVRNMEpL?=
 =?utf-8?B?UkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30929eef-067d-41af-a875-08de370b84f9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 10:12:55.1411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gOEQGqjEnkKYhAzKIbCqXF/jXKLlmDPQAuEzs7qNfR5UN/iFPrjThaHKZKIMMzAyyRv5hpLvqySiUbOdxdG6ul9lqRiJENVuzP8ZOWNkzqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6915
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: lEOE0C8NSiJlwnqgxMGAxqsICfoxVmjJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA3MSBTYWx0ZWRfX2TpCSgVZZ/JH
 x1K0ZGrVr84d7fLRYYM9VbsOKF4LOiJGa8fzFW6HPkAoArJeVcodThq3SznBZvMZ0V8qkPDWHII
 PrZFj8ulSgt98Q+K/9lIsmQs279kcfW7HjYGfKNdk/hTsqSu/QKImsWAXjzKRgvIvNS6XFj7kQT
 1wk9RxMZaGg/RV4QkuUwuLAYK22fJAvP2BJX5svJimmXJqWqMJGETv5yLt6LcDs2iheE30WTsWm
 s2rOhxRQjKfRQMg3u2hii//OUPtvX4M4O3Enf5NzkRQBjDsvGYnsbi8j+GZL5BwacS10//6rsY4
 2iwTr24ifjxchQ57T71+epxB+Xs7fsU80ivh3INvqW3bOJ/7fzWtxi6iN3KOXUKvMZZwWEtQKVn
 kTxrSjhDd6ArHB9iiymedDbdbVg0bQ==
X-Proofpoint-ORIG-GUID: ntWGMbUe6xNfktWLMB1ZiFZgA1_7udLU
X-Authority-Analysis: v=2.4 cv=EpzfbCcA c=1 sm=1 tr=0 ts=6937f62d cx=c_pps
 a=6Zlfg0iwFc/B+5Yb0ubQ1w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=_WXCGia4l-oKLtrup4AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pGLkceISAAAA:8 a=wvPkM9v7g1_ikmSEda4A:9 a=YEcU1d5el1xS2p5E:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 10:13:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227421

--------------IGeameVldqtq9cbJObQQHKL7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5B96WUFH1976701


On 12/9/25 17:39, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Tue, 9 Dec 2025 at 03:37, Changqing Li<changqing.li@windriver.com> w=
rote:
>> Wait. Go does not have reproducibility problems right now: it is a
>> part of reproducibility test, and not in the exclusion list. So how
>> can the issues that this patch set aims to fix be observed?
>>
>> I checked autobuilder configs,  although we have reproducible test, bu=
t only test with openembeded-core
>>
>> and layers under meta-openembeded,   and there is no recipe inherit go=
.bbclass(except etcd under meta-oe,  but already skipped)
>>
>> So actually,  we don't have reproducible test for recipes that compile=
 with go.
> I see. I was confused and thought this fixes the go toolchain somehow.
>
> There is one recipe on oe-core that does inherit go class
> (go-helloworld), can you check why reproducibility issues don't happen
> there? It would be good to have a reproducibility test for things
> written in go in core, so this doesn't again regress quietly.

This issue reproduced when cgo is enabled,=C2=A0 and go internally add=20
--ffile-prefix-map=3D"WorkDir"=3D/tmp/go-build" to gcc

to tell gcc not include workdir in object file. for go-helloworld, it=20
should be pure go,=C2=A0 does not include the "C", so it will not met thi=
s=20
issue.

//Changqing

> Alex
--------------IGeameVldqtq9cbJObQQHKL7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/9/25 17:39, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj_kb0aX2TbAc2dQujwrDit_nOh=HhAQi5fG-U0+DurM8g@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Tue, 9 Dec 2025 at 03:37, Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Wait. Go does not have reproducibility problems right now: it is a
part of reproducibility test, and not in the exclusion list. So how
can the issues that this patch set aims to fix be observed?

I checked autobuilder configs,  although we have reproducible test, but only test with openembeded-core

and layers under meta-openembeded,   and there is no recipe inherit go.bbclass(except etcd under meta-oe,  but already skipped)

So actually,  we don't have reproducible test for recipes that compile with go.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I see. I was confused and thought this fixes the go toolchain somehow.

There is one recipe on oe-core that does inherit go class
(go-helloworld), can you check why reproducibility issues don't happen
there? It would be good to have a reproducibility test for things
written in go in core, so this doesn't again regress quietly.
</pre>
    </blockquote>
    <p>This issue reproduced when cgo is enabled,&nbsp; and go internally add
      --ffile-prefix-map=&quot;WorkDir&quot;=/tmp/go-build&quot; to gcc</p>
    <p>to tell gcc not include workdir in object file. for
      go-helloworld, it should be pure go,&nbsp; does not include the &quot;C&quot;, so
      it will not met this issue. <br>
    </p>
    <p>//Changqing<br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj_kb0aX2TbAc2dQujwrDit_nOh=HhAQi5fG-U0+DurM8g@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">
Alex
</pre>
    </blockquote>
  </body>
</html>

--------------IGeameVldqtq9cbJObQQHKL7--

