Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A610BD2E03C
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 08:31:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1371.1764923472907515867
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Dec 2025 00:31:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Phg7EJgt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4434d54add=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B56sGql3789647
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Dec 2025 08:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=pZUA09eldWqjL7hITgPYssDmn2Js1rirzAU+9fiN7m0=; b=Phg7EJgtomz1
	g7T/JyLZMOCKb6E4Os9esK4CCNGxa+A2/fSI6dOQUZV/MEMeaDyQJ2U46vqxwyWO
	aQ/c3Dc8f02XIG4qIQGGkrIELm82UY7WmP9xLJT810uFqZlHM0s1OgWrcJqXRbeI
	32ZtPfO6+U8AKMB0Obfhi+5Pj+50CSZJumGwA9XQGAN0FP/zlos7lvduno1u8tsT
	UW2p6iWc2Mn7wZvu1S3+6veklhEAhuhIyV+Dl2hlv70TzF/o+hDMmpyksp8VzURI
	Ii96Z4lZa/SQTDPstDgzmAXH8WKFpAcUjWNTTcdFw/KFhANmMknNQ4x6leeTjZSt
	bqeZgtNS5A==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011020.outbound.protection.outlook.com [40.107.208.20])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4auqv105wj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 08:31:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qHHZv6RWpGHLLeUEFUQ6FZspSB+oRy/JkivQk6FTwVATy8q1XpUflvcK6NslEmvnitJhqoTQXXJs986JLXZw1ADtjnQeFaIceizQaelY9WCIedVHbofZpUJOa4e/grYct5P8deA3TU9pU4nOOR++mu9xX/8DE6xp6140skfW5jLever0lk+btEnX1ucOqFpCY58cwcHmAtVm/g4oWQX10eJeAm5GnX1NX9u/3m7W8rDMwOAFUATffXR/fChxm0mmHgRpxEW0iTABatrUcq1rRckWaYsbxXcH1Sos47yP3eam8nsUS+Q1k0tw2M8VOwOgS2BAkqpMJVB4rqlth9Qsgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZUA09eldWqjL7hITgPYssDmn2Js1rirzAU+9fiN7m0=;
 b=QVerkNCny9OANcRDXuQ5VKcRTJ1kmcy13AhIpET2VmmPFx4vCQDk2Xix90S++mrvxJQPWlSMDIBfoBL7pa2kCQeLwLx/LwNARluhEqPxNRJJHgFgO2UBxXfM5FV+4/xUr0+SvAY+mhQFPyRabKv7OBYdOTi6xuDzhe2OgEfKwFYvZRMorHHQKlTDsPiGfEGKnq1iwFWpHOLlzX6LzsJ8eZ8uZOkMQtjXG28/0HpqUqgWJ8Q3MzmlKnmmI1fbZSdAiOD93c+hRIbRYaPP1e4hYYAxbW+7Fu+6X2jmf2J7HuUQ9WkbRNncSgneRRJPNSh/M2fh6XhQPXxguJE4X28o8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH3PR11MB8773.namprd11.prod.outlook.com (2603:10b6:610:1cb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 08:31:06 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9366.012; Fri, 5 Dec 2025
 08:31:06 +0000
Message-ID: <76518c9a-4662-419f-a3a3-e03e183b4438@windriver.com>
Date: Fri, 5 Dec 2025 16:31:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 2/2] core-image-ptest.bb: use ?= for
 PTEST_EXPECT_FAILURE
To: "Marko, Peter" <Peter.Marko@siemens.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20251205081008.320482-1-Qi.Chen@windriver.com>
 <20251205081008.320482-2-Qi.Chen@windriver.com>
 <AS1PR10MB56974B8A04684033C2275119FDA7A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <AS1PR10MB56974B8A04684033C2275119FDA7A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4PR01CA0022.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::8) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH3PR11MB8773:EE_
X-MS-Office365-Filtering-Correlation-Id: f8a2a93d-2319-4d84-bca5-08de33d8a237
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MEJFeUVURXB6RG9DZ1QwWDBVNU9EK2E2Mnc4b0p5NzB0QjRBQlhubjdTbWZx?=
 =?utf-8?B?QXoyNnZjYlhQSndBMkhQSDlIck9VdEdZZ2htSkljYno0SVI5UHAxYjV1ejgz?=
 =?utf-8?B?SlJYRkRyMndMN01SM2kyWU9vWWdlcmY1c0dKVllMRDBwQnR4aXlsZ0U2azRq?=
 =?utf-8?B?S05KZmhzVjE1VDJ5VWdvVk9QWmZUM0g1eXU5MmRVZjdPalFxMG1QUmpocHhH?=
 =?utf-8?B?c2ZZYTBFcWN5YWl5aU9XbHRCM2o1cElpYUliOG02N3FPbFVjM3BVb2s1elJl?=
 =?utf-8?B?QzZyZmNORDhCb1NyNHlSSDJyZWkrQkY0dkxZaWl2dzhoRlhudU01ZW55Q2o2?=
 =?utf-8?B?NmFOR05ld2ZXMk9WWE9uNFlzNzBmQ2p6enQzbUloSnIxR0VvcHdiSURralFk?=
 =?utf-8?B?ZXo2VXlNTTRXYU9TaVhFeEg0UVNrcHBOZGpkTzRMVkY0QndZRkJFeXdCNmFp?=
 =?utf-8?B?QXpweWxKcHQ3c3FnYjRMNFBFOGZyenNhR092UXJNazBGYmRUc0VqQWVmS3VZ?=
 =?utf-8?B?MHZEUWQwSUNiVnpsdDlZY055MGs1bk1TOVVyZ1VLYUNZOFRtU3FhUHZpNkxS?=
 =?utf-8?B?VDc0MW53d2V6RnNLWjhYUmJvSmkzYkcwaHVQd0JiQncyZGEvUHFRakR0R3dB?=
 =?utf-8?B?S2VoeG1SNE8yVFFpTTZWNGdvazRGRFR0QXlwOUp3bkExcDcvcXI4d3JoLzVG?=
 =?utf-8?B?NGdESk5xTm5pUmkzcGdjSTNJWTVzdEg1UFVTNHZhUTZrOW1BRlV0QXhzZlBp?=
 =?utf-8?B?YzQvbmNXcGZ2S2JpNG9yR1FlUUc3K0FsWWFCZWpmOFFuaW1tSFBmSmFrSzI4?=
 =?utf-8?B?TVh5OVhndXd5YmEzMTZ0RVBWVkQxNnJiZEUwL3BKdVpkRTlHVGJVQVBveDBp?=
 =?utf-8?B?RHBWSFZZeFV5aEcyOEc1RTEzcDE1bWlWUzN4RzJkZ3VSdVNmcldjeVhFWnZi?=
 =?utf-8?B?MDMxSzVTNGtwZ3dKbVJtS2FMVFhhY1pCTmVqOXhRblNKMHFQYkNVbm91VEZS?=
 =?utf-8?B?MUpGQnh2VWUyb1dicTc1UjNmb1lzQkVGeWlOc1ZqVmIrS3RGQUNRcW5DOXhH?=
 =?utf-8?B?V2NCeWhGV0Rid1Fkc0J0UkRzMUVld3lMc0JhWEpiUkpyQ1Y3S2NwcEtGend6?=
 =?utf-8?B?VkVlRUtTWTZ3NVdDOE9EWHkyajRaTU4xUkJVV1pHUUNKVTI4eWNtdkNnNStj?=
 =?utf-8?B?TG8vN09IQ2ZwUWIxaDhWWFVpK2lzQ1d5enVlanBtVlBNOHdjTURNbTJybGN2?=
 =?utf-8?B?UmJoSTRZRkpoVjE0UWtVaGNmMzJORGhkOHJzdHdLak5vSGJVMG0wVmRHMUg3?=
 =?utf-8?B?SEg4a1JhZTVaMktnNDJrRHpLZzA2dnBySWJMTWU2Rk10RWMvZEtTb1MyOVdq?=
 =?utf-8?B?U1VjLzl3OXBNdVExYWx0N3B2cG0yelVHUTNLZGwwVm1HU1hYbnlzaEExUVFk?=
 =?utf-8?B?bEo0YmhYeExJYlFoSUI5R3VQZEgzWVkwRUhncXl2QzZ0NVlpZFAwVDc1anVY?=
 =?utf-8?B?eVFjd0NpWmVaS3h0OTBja2o3b29hSEJlSDFSWG9tb1VIV3luVko4K1BXYUhU?=
 =?utf-8?B?L3IrM1BPY0V5czhuaC85Mm5LUXdrN1djTzlGYzc4ODNZSzlGMXRGUnpHdWVt?=
 =?utf-8?B?RGxrTGxwNTdkVFc5bE0xU3k4TkN3T1BCMXFCMFZERFgwY3FoR0hBeWIvSFpJ?=
 =?utf-8?B?R3ZSUWNJVWZ6dUZtZTdHanhvQ3B5UjZHcTFmR2laMEg0TXRYRWtDVmVxTU5w?=
 =?utf-8?B?N0QrRitRelc0Y0Vvb3ByUTdrQ3BwVVU3UWRWajBHZG1zTXc0cmNlODhoUTBt?=
 =?utf-8?B?RnNCNmppVzRJazhQRzRpc3pKQ3I3VmF3Sk4xenE3cGlmSlUyYXIvUFk4U0hV?=
 =?utf-8?B?OTJ1TUpkaVMrUGJaRGd5ZWpFcEFuOWgxS3MveGRsYy84b0lhTVBFdHk5ZC9I?=
 =?utf-8?Q?E1XVdNrH9hb3vhlS8pF+1oLq8zNgOEOa?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NE5qVlZmS2lzVmdLYkoyaEQ0WFFXcUtZbndPVEQwQnhtcy9qOTFIU3B2L3Rq?=
 =?utf-8?B?d1AyeTgweWhMVElWMlkxeTVzOFhKdFltRmN6RXIrZVUxRFo2Sk9MRlkySGgw?=
 =?utf-8?B?UUtFQWp0OWVEN0xqSzJuR3pqY0I4RUlrUTBvNjd5U3AvWEVLL2Nvek9FSG5Y?=
 =?utf-8?B?dTZaZmJ1VDFQOG5GUFZESk5jV3Fab2t4ODZnd1B1KzFRNkoybjZSNmN4RHU1?=
 =?utf-8?B?bFh1S09xMUtGdGdiRzFHSGZtaHQrbi9JclNnaHpJVFVXTVVWTmYvWjhmUXR5?=
 =?utf-8?B?eld6Zzc5cjhFTFZoWmNqQ3BoSHZ1a2V2ZW52clhVZWVBbFZhVWRlRHFveWE4?=
 =?utf-8?B?Ymh2eVhtQkNjM3pRM2xNcnNjMW9lM3NnbE44cDErZlZVMEp3VERGbEdqVE9B?=
 =?utf-8?B?dDN0KzR6UFhRWHkrYWJ3dFFXL0FYRTlrazZsSVhjcHQrWWxNNGlFYXZMVnc5?=
 =?utf-8?B?WjB1R1ZhbllqNE1pRUo2S0t5QXpaMS9kcmJNQjhpdFZreHpXZGdzWmc2NnlE?=
 =?utf-8?B?T2daQ3RrZUdYcXVQWFpTajN4L0h5Y3lYRGtzQW9uSktIODl1SUp3Sk96OHRk?=
 =?utf-8?B?Vy9UbWkyV1pXQWRyaFNiT0lWM2daaVFZSjlUbWIrQ3NWQzZMUzlXYm5tSkFt?=
 =?utf-8?B?K3M4ZjFoYUNYZTVJV3RHMnE1OXlSTzlTL1ZuWUhFVzYwdTc4RjcrWjZHODlJ?=
 =?utf-8?B?TWFrOE16YlNRaldLMFBUVG45Rlp3eHJEdk9kMGhEeEtmSEl5RGUySWR4QWVp?=
 =?utf-8?B?OWlhOVVZaG5MS0JHNXB3VmtPV21QM1hlSm9XT1FMYUhUUWpscFJQTzBja1VJ?=
 =?utf-8?B?eGFhbCtLL2xlVkVOOFZsa0ovL20ySzVVb2ptOXR0WHhpTFdwS1dBVmNmNFZq?=
 =?utf-8?B?UVJjamVEejF6S0JJb3JOM3ZsSHZNVitmVHVMdFp0eDRPVHJScG9JdkNmQWR2?=
 =?utf-8?B?SnNsSEtVeVhwRUh4TS9CbGFMOGRTM2ZlNkFaK29zU1FmWlZjWkp4Q2szOGxR?=
 =?utf-8?B?UzZvekh1NzFETGt6OWl6c2ZXdnEzS2xJNjFRTldFLzl3eGxaYmdlMXBOZTRi?=
 =?utf-8?B?WHROOThTa295Y2N1RGNKeVlLOVNrVmg0M2hiazk4UVVGS0F0eGpWV0EyRCtj?=
 =?utf-8?B?Uysyd3JtUysyL0lHUVQ4S3A3L0ozbVp0MkhJRDRscUZxZ3c2TnVwL2REVHBK?=
 =?utf-8?B?TkdCd2pzMUdvQVZNQk1oM3RIbTd0aFVjbGwvV1owUEZrK3ZKQURHQzhqakp4?=
 =?utf-8?B?TjFGaE50RUpTaGFuUVQ4UzlIQmpYMG9jTnNWenNzcjRmUlpMdEI0V3kyOUQr?=
 =?utf-8?B?V2VrT25MZStyb2gveVdFdWExUGlhSVRjaXBlbDZSYmxVZE1ka1luamdnL3hT?=
 =?utf-8?B?dm5vNkJlU1Z0OW1VbHNUYVJZVTlTWmRHWUkvVjRJR05RNmVWdENlbHB3ODlJ?=
 =?utf-8?B?SlhReXg0VGJZc1VaU1JYRGp0NlUwdG8yVHlIL0xrdEI3amZPOE81Q3hvWVQw?=
 =?utf-8?B?bEhOTFBiRHN3ZTFvcExwSkkrNllzQ3YwZGtlY0VHb1BWeVZSbThCemNLTmhE?=
 =?utf-8?B?QUZzWnNuVEUzc0E1TXpRS1pXeURUU1RnTitKdElGUjFEalpGQnpHVUZNaDdh?=
 =?utf-8?B?Wjc4L3RsREJrTzMwRzJ1Q21QM3RUaTg0alI5K1lTc3JkY2FZWkJGRm5vS1NX?=
 =?utf-8?B?NDVKbXZoajN1TCtkWHU5QnhZUWVodFdYZHN5am9CU2JMdW0wUU4wSEFvV2tw?=
 =?utf-8?B?b0RPWXpQNnh6RExWWUdYRVMzeFRnKzBjcDRqZ1E2cVBoN3lHd3ZMbkQxdGsr?=
 =?utf-8?B?RnhIQy83cmh6Sys5cEN3T3JsV2R4alJIRFIvWHcwMUhHZ2JpeENLZkNvVThT?=
 =?utf-8?B?S21VZDRiTGY5Yjl4Zkw0ZEtBMFRjQWZKYzQwNisyckIvYXBiZkFwRmZsRGRj?=
 =?utf-8?B?YWlra0drRGZRMjA5UGs3TGNMUkh2UmVxS0hiT1BOeGFvZU5ZcTZzdkRKQS9I?=
 =?utf-8?B?NUJaaUVPOWE0WmRZcnk3ZUVPdUhDTGgyUXpSeXhyMFc5TzhNOFM5aXp6L1NC?=
 =?utf-8?B?VDZnVkNqRmJlNEdUTndMekpGVEFtYnE4VUoyTmM5aWg1NEFWcHJleWovU0hQ?=
 =?utf-8?Q?a6hiGRM4K2j3jTQg2lTnBHzYi?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8a2a93d-2319-4d84-bca5-08de33d8a237
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 08:31:06.1616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xr2Z9QgSliGIBjBt2CQBcZRnkJsphkL1Hr2Sl7j0oRQ7lCXuQbH4O74HFGijEJbld/De65b9p4dtjRU11ErtEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8773
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA2MCBTYWx0ZWRfXxQLvH3jGyrYP
 z65YDA6b+1MqgbtJlRmFERPzE86XvE7UvAx2d43dBoRsjP2BzHtcQARXqhYjyZXaqap/trpM9K/
 Ng8ZKH+MSe9qdL+km+tUaULEnItJSHbsq3vDxjIDt3BmY8ZVGzlASrcngksTxx01g4J2VApMu3r
 dZfe25PmBMhKAHZV644+paDkX64wi//8l+obglW6MMFzhq0zx1cOklTltDdXVbHZCMC9WEBXUaF
 yAa5jVL2FvXSbOU50HKcUGCBeeEzpWi8WCf4/2Fgi9Y+jHPfHuaBhHj1HTLfx6+rOFYeHSXwYKL
 48R+pioHYbtt/rKm6uGZvaPrqBm42XrMG9DeHwq/Uq5E3nVl+gQ7j59G7TXl+x0dAMxtkdtMfGX
 z9XI2ctVwTbQQkgBt73W1boNhTDhKg==
X-Proofpoint-ORIG-GUID: 2f6vx5H7xZDlKTMz6IEnxQkkqdcF9C3j
X-Proofpoint-GUID: -XWhxizXmfuyPn0a-Nk_FxiiKK4KOX3x
X-Authority-Analysis: v=2.4 cv=dqfWylg4 c=1 sm=1 tr=0 ts=6932984f cx=c_pps
 a=KTjCFeyF3Vp3atYHcTGfzw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=v4lpaME7tTozId6vA2YA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_03,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 08:31:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227340

On 12/5/25 16:26, Marko, Peter wrote:
>
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Chen Qi via
>> lists.openembedded.org
>> Sent: Friday, December 5, 2025 9:10
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core][PATCH 2/2] core-image-ptest.bb: use ?= for
>> PTEST_EXPECT_FAILURE
>>
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> We need to allow users to easily override this value in local.conf.
>> This has the benefit that 'bitbake core-image-ptest-xxx:do_testimage'
>> fails when expected.
>>
>> As an example, I used 'bitbake core-image-ptest-util-linux:do_testimage'.
>> It succeeded with warning message. I didn't notice the warning message.
>> I saw the command succeeded and I tought util-linux ptest is OK. But
>> in actual fact, the ptest failed. It's the PTEST_EXPECT_FAILURE setting
>> in this core-image-ptest.bb that is not giving me error.
>>
>> With this change, I can put PTEST_EXPECT_FAILURE = "1" in my local.conf,
> This comment should be probably "0".

You're right. I'll send out V2. Thanks for spotting it.

Regards,
Qi

>
>> and I can easily see if 'core-image-ptest-xxx:do_testimage' succeeds or
>> not.
>>
>> The PTEST_EXPECT_FAILURE change should result in testdata regenerated
>> because ptest.py test case's behavior is affected by it.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-core/images/core-image-ptest.bb | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-
>> core/images/core-image-ptest.bb
>> index 017f05f81b..b554964d20 100644
>> --- a/meta/recipes-core/images/core-image-ptest.bb
>> +++ b/meta/recipes-core/images/core-image-ptest.bb
>> @@ -42,7 +42,8 @@ QB_MEM:virtclass-mcextend-tcl = "-m 5100"
>>   TEST_SUITES = "ping ssh parselogs ptest"
>>
>>   # Sadly at the moment the full set of ptests is not robust enough and sporadically
>> fails in random places
>> -PTEST_EXPECT_FAILURE = "1"
>> +PTEST_EXPECT_FAILURE ?= "1"
>> +write_image_test_data[vardeps] += "PTEST_EXPECT_FAILURE"
>>
>>   python () {
>>       if not d.getVar("MCNAME"):
>> --
>> 2.43.0



