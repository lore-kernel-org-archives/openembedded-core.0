Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76FCEC369A4
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 08:54:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.29665.1744275261660362881
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 01:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61957cd107=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A5eYOS001118
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 08:54:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tsr1pp3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 08:54:20 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53A8sK7W002959;
	Thu, 10 Apr 2025 08:54:20 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2043.outbound.protection.outlook.com [104.47.70.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tsr1pp3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 08:54:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VkTT062y3PDgi/uG/RETlGmYh7OTXy6B4SuUv26KToIlCuAVNK0rZ8PILnpO+VWe9jJeth7+IRfugw4PgHQYclsSihgRe76CdJT5iz6Fv9w2mYimOWe9w+V1ojsERtedxz1MKC92LLECDZdNd5VgRzzG10h0W12DQI7Y2fcXzEyYLr7YW0cUUOFtRoeqp/ErjcOrXd1OoEzLPD+FLTUI1HPLvjpPPKvz0m70vOLn0gJSR46YwxxS23JSpY3k89/d4HLumPISH0Q50J7eqiI9EJdOB5njjLDhonENjfYcr/VXC5KU84PbJ0bBuLlzu+pbOKb0SOfpF1I6eRDAnvPuPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7fqnt+wPv4tsKGsTBut5E1tPdwn+hjuwaQyfJ/HBng=;
 b=UpKFuInyROyVp5owi6pNwmXnZ83e7wb6Tn1tuHofFpHyo8mNwHk8RyUeuhOz8xg32qw4KLp+TuE1t1Jj6NctkOBMEKhGoC1P0Jji5Ip6K6WLiH34+JqFHNydITylOHIdkrdpk3kpkwlSu4tstQBZxgAZ6Oue0YnKcnNbfwg332F78h7rqikrBBpKlC9W6Kl12uAGlB0bUpiZs2RWRhuR43bhY0cLPJoOlUeNN4ssL975iP6Muc/E2YEeM1RuoJ1HzLYjw1opJWyOCbUx+BMND8PNck/mOXdyf3aIIupthnNhHoUvnDSsJ69l/zGhDiyPfo3cW3LPw2Nm4LM3QZmrCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB4918.namprd11.prod.outlook.com (2603:10b6:510:31::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Thu, 10 Apr
 2025 08:54:16 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 08:54:16 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH 2/2] lib/classes/recipes: refactor qemu.bbclass
 functions into library functions
Thread-Topic: [OE-core][PATCH 2/2] lib/classes/recipes: refactor qemu.bbclass
 functions into library functions
Thread-Index: AQHbqc45Fpdu9Al+aUmQoS/jtDcjfLOchuGAgAAQXiA=
Date: Thu, 10 Apr 2025 08:54:16 +0000
Message-ID: 
 <CO6PR11MB56025A00A006AFD778CD70ABEDB72@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20250410040825.1283228-1-Qi.Chen@windriver.com>
 <20250410040825.1283228-2-Qi.Chen@windriver.com>
 <CANNYZj-e4q=gEJ0yCy6r373wK+Qy5=BreFEsPJzsvGEi5TMB1A@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-e4q=gEJ0yCy6r373wK+Qy5=BreFEsPJzsvGEi5TMB1A@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|PH0PR11MB4918:EE_
x-ms-office365-filtering-correlation-id: 6d1d1c3d-f559-4521-4e8f-08dd780d4618
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?TlFaV2JjMkpPd2tVU2tMREhSZDY2RE1HYWROejMzbFhwK05jRTBVMXNKWUtt?=
 =?utf-8?B?N3ZpOVh6MFFjK2xmeDVPZjNhT1pSWVhqdVRSVEFvYk5BcjEzQ1p1VkFZNnhs?=
 =?utf-8?B?Q2lqWmFPRWc3TGNPajdkTHlUeXUrS3ZObk9zWkRKbCtYc0pHaFRHOENkckJu?=
 =?utf-8?B?WHRiUVdWWVpFMTl6VkdlOGhQV2FqbzBVMWZLeFZLSHNwMVk4a2tNOTFZdjQz?=
 =?utf-8?B?YXg5RWkwaUNQTGdpVm9ZMzgxMVE0bXBmSkZsWHY5UlJVd0dBOXRsUmRhMkpm?=
 =?utf-8?B?RlRhOHJaRytpTEJjSWpTMUNsZ2Nlb2x6YmVXU3hlSVFTS1h6OW9mRC9oNExU?=
 =?utf-8?B?RHp0Q2ViWmNpNERIZWpSbDZ5em1la3ovVXBwclJLblFLdmpVM1hmQjZiWllC?=
 =?utf-8?B?NEdrdjh0NW41eGJ3SGg2SXdVZmxhdm5OUDV6aWJ1WFhCak84b0FiMzBXcUVv?=
 =?utf-8?B?MVdWVnNySFFUQ3JlMzQ0RU4xSzVxeFl0K1hEejFuUzRPTmMzM2p4UWFyZXFw?=
 =?utf-8?B?UkNreXE4TlFTTVlSbDM4OTgwekRHOE01NXpicHVMT3ZoTWZtMmQ4NkV0bEJu?=
 =?utf-8?B?ZDBEZUQvWkUxWTdKZDUvQ05GVE9LNEdzbTMzY2ZQSzVKMjhVMmR3VVZPbk9n?=
 =?utf-8?B?VzAwTDZNQXlFR2w3UmNONFVJNUVqQzJsY1V4KzhxTERXWWZjOWE2WitNcSsz?=
 =?utf-8?B?cEp6ei85cytsSkl2VndLWXZ2Mm9GKzZrSlV0K2lpT0JNSGpIam9MZGh2MFJX?=
 =?utf-8?B?Nkt4cEFsOXBHbi9HMjErNVJUMFZSM0lLMjdFdC9HQXJnL2pHbjFxSVlST0hS?=
 =?utf-8?B?M3RLazJIcGYvN1RtbXdDY2dFWXcySXJVT1FJYVhwSXo4QVI2aVhMTURTZkhm?=
 =?utf-8?B?b3VMOUJGY0NnKzA5UkdWay8wYzFVQUkwb1ptSUcrQ3JXWTRKMVhWV1ZYeWRj?=
 =?utf-8?B?TGNGRXhwN2J6NDZka0VjRW9HMWs1cDVqRzdVVDd6aTFDcUJGQmRnL3hLSHNj?=
 =?utf-8?B?V0k4TWYxSmE0eGtwd0ErbG1SVHAzanowMW5xNXpreTU4clk4VWRNY1lTWERy?=
 =?utf-8?B?R1RPRC96TWlSd2wvNEJEZEZtZlRMRy9RU09OYVB1dXJBK3kzQWI4MTRlSDdY?=
 =?utf-8?B?UHpuSU0xKzBKSFgvb2JhVnN5dHRybkJrbi80aWMzYUNubW5tYmU5bDN5OCtE?=
 =?utf-8?B?K0hsNVJ3T3VMMHJRNHd3NDM1dldQL0dRTWNyOGh3UnBoSTBxS2VmVk5FZG1Y?=
 =?utf-8?B?cDRaYjlhd1B5ZmlrYU5LOEtNUlNyZWZTMXF1UE0xakJIb3hjNnJlbGRPd05t?=
 =?utf-8?B?WFRFY0FJbk1ZREl0ZDJOd0dKZHQvT3lpOTZyVWJqcTJjcHVhaHVTTTB5RUpR?=
 =?utf-8?B?SXl0MnBWeVBzc2FWakF0eXFLaVJqTmFucTBnckkwZVJJYVA0bXc1WGhOK1lU?=
 =?utf-8?B?RFZtU3EyZ1BvNDFycDJzYWpKbXZrays3YjgwVGlZWm9GWFlzdHZpQ0IzUWJt?=
 =?utf-8?B?N1lKQzlxZldveFVZdG1sNzM2UklQLzhaSTcvZ2lCWXBrWWVYd2lxY1BFeVdw?=
 =?utf-8?B?bDBvUTVERW5yTnNGeTBLVUt2NW52eUlKNWhPSmpTMnQzQ0hWUnEvWmp0Szcw?=
 =?utf-8?B?V2xIejhvZVY5U1JaOGtMdm8zNmM3emZBNG9jU1ZBdXZuS3NKdkFxUEE1L2pv?=
 =?utf-8?B?RTlTdUVjTGRXSXpwSHlvTWRxT3BYRlhmcnJicDRVK1paUTRQeFp2L3FyaEkv?=
 =?utf-8?B?Ym1WVTMyS3BhOCtVWXRSWUxwQWs5STVXcS8vTi9JOFJHVWlJdWUwcThUV21w?=
 =?utf-8?B?NWlGd2xITjAyZWtjNGFueFZWNVMrdDl0aGxIUWY3Y3VnQ2xDSUgwbkd6ZmdW?=
 =?utf-8?B?MnFuL1VWUXoxaVU5NUZJRkIrZDUzeHhjWDMxMzdaTTFTREVOcGZacE9hRGNq?=
 =?utf-8?Q?rTpSgREa2jpREqyrC86CLmXqUSwLrzzY?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dFVTSml6em1laUw3YlM5VmhXMlZwb05SQXZDUE5OTjMxTTlHSzNpUUxwMXFp?=
 =?utf-8?B?cmxoYzhIU0ptKzN3QUowdHNiQlY5NVZZdHYxSGN3Z0ZBRzdxa3RQaExiMjVv?=
 =?utf-8?B?T21nTWtMZ0hWNjk4V0UvUzQyTGwxRVFLVmdjSlYxYmE5Zkc0UnNXZ0l5eXdo?=
 =?utf-8?B?aUFqcWFXeHBVanJaQzA1NEtLTTMxbndNT21XdFdBQ01RYjdwTXFyNnoxN0xq?=
 =?utf-8?B?UXoxT0pRQ1pLQ0xQQXNxL055Q0taUFNEVGlscjRoQUs2Wll5ZldOVVBxb1BC?=
 =?utf-8?B?R0tmc1FncTg1OFZKM3hIT21OZERJTGNzODNSaUdUS3BaZ05TRmg5Y3l4ZkFI?=
 =?utf-8?B?WWNYSk9GWmkxWTVDRE9TRDMyZzM3ZTlscG5xMlc5L2cwMDYrK2tibTFHQS9C?=
 =?utf-8?B?WjFSYnlhT01pRlp6Q1ErUnlQb2R0R1l6aGNVdzA3SVQxcjJUSFFiWHNzVEh4?=
 =?utf-8?B?NFlTQWttaWdkc05qeUhPN0kydmNQZWYrenlzZWZSUkkwMjFEWW1HM0crMXJ4?=
 =?utf-8?B?K2YwdnAxQ3VGSUdkdHdZT3llVjJlSVI0WWFnRS9GYlkrT29LUHd5c0Z1d2R2?=
 =?utf-8?B?cDdOU2grUlIzcWxZUTNwWFNyRGlHcHZtUG5kZlU3WWc3S0ZTbDIwNWZpWFIw?=
 =?utf-8?B?TytEeVRXTnE2MTlSZ2wxR3BuNHp5M0dxcndWdjc4V09oaGZkbFdPbWw0Mmo5?=
 =?utf-8?B?STBWUHh2Nm9seUg3UDVWN3JmSHNmRjVjK09QUnlVMWZCR2JJTTFlNldwUHhm?=
 =?utf-8?B?WE5BRzFBMGZNMjJPd04yVENTOW9WOVJKbjM1MUdXQlRoSEM5cHAwbXZNS0NN?=
 =?utf-8?B?RGdFV2NJamd3UmxnU2xlOFlqRVFUa1RzcjVWMUV2QUllWUx0M0xROWJ5dHhK?=
 =?utf-8?B?WUlFeUxWUUEvRGhNVkpFV1NFNGdzN0QxNm5oQ3VhQit1MVAwZWMyWjNudDB1?=
 =?utf-8?B?OEtzMnBPQVZNT2ZmVzNCSUQxL1lyL0xYQTI5Mi93SnRsbmdVWXQyc1liUjhS?=
 =?utf-8?B?TitvOS9ZUm5DV2N3a2tCYVlUSXIvSXV1dm44ODd4UC9IWDY0Zmdxemw4clpr?=
 =?utf-8?B?d20yclJ0MG9SanFKZzN5QlRZdXhwUnZkZUlZcnRVVDlXUTYrUzZWQnJPN2pY?=
 =?utf-8?B?NGkrM1V5TFlMN0VvZzZnUGNFVEsxS1YvS1FOQmx2aVhUQWpqZW5xWGZTMFNG?=
 =?utf-8?B?N0ZwQ2FZcXpvVVZCTExwaXRkRXlNN3FHVkJoWDhyZHBicjJlK2t6N09VVjdZ?=
 =?utf-8?B?ZjJwRGFSTVo1ZFZtNEtDUDMrZElhcHZYSzRnVTl6RFU5T0V3U0FzYzVhRkVj?=
 =?utf-8?B?dHZqd0o2ZlNpUGNoUmdqTTlRcHpmUzdRdk9aNWdkeHRXNjRWQUVCNkhhSnpI?=
 =?utf-8?B?bVlGMjU3NDlkeWEyeTd0RVFETjk4aDlFM1dHcFRSMlViUVdoMEM0MDVUTlpE?=
 =?utf-8?B?VXQ1UGhYa0REbW5FTGphTUc2U1Btci9MMGllZSt5S2twMzZRekZrU25iOXFh?=
 =?utf-8?B?TmhodnRnUHJIN2JIZWZ6L3ZsTXlPZ1JvOGM0bllBNjBEblY5am83ZGFtcjRD?=
 =?utf-8?B?SWUrME81ZEMxYUROOUxzcXRIMHhCK0ZYdjE1bkE1RUNlTnJzRkk2anhnUHJh?=
 =?utf-8?B?NHREak1JVE1KakhsTG04RHg2NE9UdktsYmtaYkRObEQ1WU5ROEVDNlpLanM3?=
 =?utf-8?B?b2lpRGRuVWNiekx2U3ZSeG5QdE5BZ3BHejNZUWZodSt6cysyQkpqejROZkll?=
 =?utf-8?B?VVZOT2w4QkErM2p5YXRFU1NsRGF5aWxaVVF6RGhOWU5UeVVlZmo5bFQ5VzQz?=
 =?utf-8?B?TXlsSnVoc2hUNHhYelczbzBYbXJmL01vVU54TVdMU2V3S09JVTk4NHUwNGV0?=
 =?utf-8?B?ZFBhV1BwZEpVS29NOUxYN2NhdWNlS29nRXc0TWp1WE9FblA2V0RRL3d5NUJV?=
 =?utf-8?B?KzRPK3RZNlRyZjMxSDZsMTRUY3FkWnpNUitPUDk4RlJuS1ZxTDQ1RStFL0Nx?=
 =?utf-8?B?WTh0eDR4dlpLUDA0MEpkK29LZFFsT2JjOW12ZTFuam1IUVM0TWJIVExXWTZF?=
 =?utf-8?B?cWdZZnBXdUx4WmY0ZUUyaDNiMUZkQW5Bb1UrR2Y2bVBzTUE4c1F0RnArcGp5?=
 =?utf-8?Q?0JlgYcFbHLNtCI4zAujK8rJQj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d1d1c3d-f559-4521-4e8f-08dd780d4618
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2025 08:54:16.2092
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OewDxAHl5nU4sKb6VVRZU03jmCdpv5tYL9sEhLdbpp/h+/d7Vx+uF0awznLajV6cvb/ULDO/VxYVw3kSPdOj8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4918
X-Authority-Analysis: v=2.4 cv=Td6WtQQh c=1 sm=1 tr=0 ts=67f7873c cx=c_pps a=GoGv2RwMe+/7w9MjyR+VRg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=XeOPnqnEIgsdYGM7-t4A:9 a=QEXdDO2ut3YA:10 a=0lgtpPvCYYIA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: 7K_QggsT_SlO_p36VZslIAocIZFpWJ0y
X-Proofpoint-GUID: 30jkGW4-lNKUptj2diVJBY6kZ-JtdLof
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 mlxlogscore=801 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504100066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 08:54:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214632

SSBtb3ZlZCBpdCB0byB0aGUgcWVtdV93cmFwcGVyX2NtZGxpbmUgZnVuY3Rpb24gaXRzZWxmIGlu
IG1ldGEvbGliL29lL3FlbXUucHkuDQpJJ2xsIHB1dCB0aGlzIGluZm8gaW4gdGhlIGNvbW1pdCBt
ZXNzYWdlIGluIFYyLg0KDQpSZWdhcmRzLA0KUWkNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCkZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPiANClNl
bnQ6IFRodXJzZGF5LCBBcHJpbCAxMCwgMjAyNSAzOjUxIFBNDQpUbzogQ2hlbiwgUWkgPFFpLkNo
ZW5Ad2luZHJpdmVyLmNvbT4NCkNjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdW1BBVENIIDIvMl0gbGliL2NsYXNzZXMvcmVj
aXBlczogcmVmYWN0b3IgcWVtdS5iYmNsYXNzIGZ1bmN0aW9ucyBpbnRvIGxpYnJhcnkgZnVuY3Rp
b25zDQoNCk9uIFRodSwgMTAgQXByIDIwMjUgYXQgMDY6MDgsIENoZW4gUWkgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgPFFpLkNoZW49d2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiB3cm90ZToNCj4gLQ0KPiAtICAgICAgICBkLnNldFZhcigicWVtdV93cmFwcGVyX2NtZGxp
bmUiLCAiZGVmIHFlbXVfd3JhcHBlcl9jbWRsaW5lKGRhdGEsIHJvb3Rmc19wYXRoLCBsaWJyYXJ5
X3BhdGhzKTpcbiAgICByZXR1cm4gJ2ZhbHNlJyIpDQoNCihpbiBhbGxhcmNoLmJiY2xhc3MpIEkg
d29uZGVyIGFib3V0IHRoaXMsIGlzIHRoZXJlIGEgcmVhc29uIHRoaXMgd2FzIGFkZGVkIChwZXJo
YXBzIHZpYSAnZ2l0IGJsYW1lJyk/IElzIGl0IG9rIHRvIHNpbXBseSByZW1vdmUgaXQ/DQoNCk90
aGVyd2lzZSBsb29rcyBmaW5lLg0KDQpBbGV4DQo=

