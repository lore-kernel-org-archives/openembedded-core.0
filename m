Return-Path: <Quan.Sun@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B61ACD4F54
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 16:47:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14960.1780073234228403564
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2026 09:47:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=QAUendmL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0609d6bc0d=quan.sun@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDlJu9319753
	for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 09:47:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=j6Ply3cd31djE7Cwfu1GYk/Qgos8JZc5O8JxvGHiPsY=; b=
	QAUendmLXJ4yQqaE0lzNGPXq577SkuiO9mLjSLGW6ZGTserdWoUPjLHQJt7dTSL8
	PL7tGkXH5nKWjXCJP/l8aYH5sTwjWHHnnRUQbXIpG4/L0Vbwd0cig9Q3x41Db6/9
	GGEEezRdTawurf64S++l3FJDyw/HFZpWwJBVy1S8mzKkkGrZ6ybD8esB9vxmF5I0
	60WjFuDxXTl7PtvNDgYh7lOCVrlwENiLdufIPMVjnukChu1Ho93XfkAf1FeDnMpw
	YPfNj/48fS4LT+ucdfhGAa7Gd4nIa2wieUYOs0MinaKwUIt0WWBv3aQv92AK+0mq
	H9EOcqkqyxxPkzO0oqczVw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012020.outbound.protection.outlook.com [40.93.195.20])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ee7x6ttp3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 09:47:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=my0QdBg9p/oMNHk/POZcUulRSj4jkf+Ng3qz1/aWLwPZBrPP3jFeDLOuSqEcZWWvCl7NU1DqPJYZrXYI45uvsESS9xy654PRQMWIX35oqI8izIMiUys7SlJ+xLLgYzh7RD68PkgoMFiUJ1a3R5eC2fjKaorRhS3H+z5M97EPQUmlDuxWrzSfS8UcS4VWaMp4mgu1lgzq79TaAczlF+k2SiUVRG/RCp8lWef5H0bNeHlPmldiWw8KXk8glk3gY6KHriil3yI//5h7cbP8G4Uymo44T6vLe4qqcfWcVd9QcY3PAhUJtf3yjST9QrxJ9kL1R0ywdvoFUHzqfmsako1SwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6Ply3cd31djE7Cwfu1GYk/Qgos8JZc5O8JxvGHiPsY=;
 b=JOO3ZiN6yj1EGypmLrY76CVh/hXFHwo/aaIMNfgTs1t8Wyugt9zxszNeOmEAfXvBivMh2h16Cs+kJj+bYRO/p2Q8JXyBYQ/qg3MHP8s0L4pHT0EzRIVJ9vGx+6nY+bt1wjCaIZuhH9RVxa9vxMeoYoUyRoDtWxvPsishOxZdxht/tZw85LzTgTV4X/xBPiFWlgbdSjOlIgWjOYlO0zTI3oxGwzkfOnSVKpmb1BFx+DjqhhYjERKmEYwk8xVx60yYHvALBR2NttvDy+pweEOmstXCgfWbgP/+fxUfsnjDlIs33z9eNA2MUJe0vW15EtTggyzSGPWGSXE0YOCifpIveQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7283.namprd11.prod.outlook.com (2603:10b6:208:439::10)
 by CY8PR11MB7268.namprd11.prod.outlook.com (2603:10b6:930:9b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Fri, 29 May
 2026 16:47:09 +0000
Received: from IA0PR11MB7283.namprd11.prod.outlook.com
 ([fe80::6e41:656f:120e:8e8]) by IA0PR11MB7283.namprd11.prod.outlook.com
 ([fe80::6e41:656f:120e:8e8%3]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 16:47:09 +0000
Message-ID: <f43b9715-1735-4e16-96b7-963daa162c90@windriver.com>
Date: Fri, 29 May 2026 12:47:07 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20260528202639.4097815-1-Quan.Sun@windriver.com>
 <DIV636CRY5LQ.2KV03HIYY2WKI@bootlin.com>
 <be287797-1941-4afa-8aef-b015ca194476@windriver.com>
 <CANNYZj8gMc8PdWMse=g1J7goZC5Ga=nwN5hA+uX02-G+LNHEwQ@mail.gmail.com>
 <7da33301e8a0bae93a33695b4fd41f67a08e1b9f.camel@linuxfoundation.org>
 <3bde2ef8-5565-4495-9904-dd3db839de1d@windriver.com>
 <CANNYZj8St8Foj7C1RZnGPFmzsAFyCEjvXVZa9DD5Wv6YQ8u1TQ@mail.gmail.com>
Content-Language: en-US
From: Quan Sun <Quan.Sun@windriver.com>
In-Reply-To: <CANNYZj8St8Foj7C1RZnGPFmzsAFyCEjvXVZa9DD5Wv6YQ8u1TQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: YQBP288CA0002.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::23) To IA0PR11MB7283.namprd11.prod.outlook.com
 (2603:10b6:208:439::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7283:EE_|CY8PR11MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cd62f3f-2224-419f-e71e-08debda1ecb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|6133799003|11063799006|5023799004|4143699003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	8Lx3xP94y9rUwdJEY0YuHa8WKaFTCrAFOhqLdj7xCUBgmmpWhvKcSCa/g3aADD6CMNBohZ9vJ81cvw3D/vigReWboIv1hWS88na4cM36LYNKQg+sUidsCcj7FzKhFtBGNFUuFN0YFkytWD9K8ABj95Vp5l/kyhy/qghD/puZPlw2cbrpnajwlh7Le4hC32wGxnwPHUtocBAGQF7uYTXYYQ3LYqm1329zH/Pr21Bwf8S4r8giXBDAULlKGbuxwSP9YhwbdaUMJvZLdvw4o+UguoVRk1g0DTbp9BGMZNDL/N3LFDTqm95/Yr4xp+BIotEDplO2uQXjZpSox/XibJhbc1hU9sW7fbWBFLHjP1AuC07JTLc4NgkiYJnlmjXuMfft9GWxN5x/5CoByykkYZF5HSaWFm/B4XwG6S7dhp9k0IEs60C6tn/C/+RKjfdvG9UyufXHJkjNRWNbarbs8qeIkg1LKbVE17ItGutXxY5h02ZSA3+WUrG63h/GHbJhjLOb/BuXS468YdG9IyYhmEsC5Vt6Ujx5CWgNj5rLr1ajU+CYq1EdJx48/XBWISAtCLjrh8Sr8QMYq7sEsl7wdKNy7fNciEFJNzeiAjUR4wmVhmuEh/MZbGQDsiK109EVzG1bTWHHGou0jcnfLcbOsZ6k1ZJ9qJsCjdKzWO0jvWQc2ife+oFiPKC3riKHnH8NEAPW
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(6133799003)(11063799006)(5023799004)(4143699003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VFlMSWRXZGU5eUxwOWRUYmsxc21QVExLWTZoM2J0b1BQcFFUS09DeFNITDdT?=
 =?utf-8?B?SGg3K1JZMDJSYVBhZkpIMzhHNERKekhCU1RhTlhOaFlUekVndWY0M2ZWMEJu?=
 =?utf-8?B?Q1h0OGNVbzlVaytqQmNLWUQ3QktZR2o4NEVtYVUyUHlqdmtDZVlENHZFWndS?=
 =?utf-8?B?SGFqM0JaUjc5UmJvRm11SWpjQkJFUVBpSHZveDh2WDd4M0wzS2hpVmhMS1dw?=
 =?utf-8?B?SmtZRkY5M2lzanFPWEVRbFcxK0pJeWVBSTdrbzdUV3lCRksyeEkvSllHbzZK?=
 =?utf-8?B?S1ZBV0xCZ0IvUDBLQXYveExWNXpVbFVkcVZhcTV3WUFPeCt6R0I2eXJnb2ZF?=
 =?utf-8?B?bXJMTkRaeUZoRHZrU2pYSzFORzlPN1hWZEM0YWtPTWhnQ1ovNjg2MmI2dmMx?=
 =?utf-8?B?Q3B3cW5ERUR6SlEzQ0FEa0hFY3ZiWm95bkJkTWpXQkd4eXhmeTlnRTloTHBD?=
 =?utf-8?B?dTlJdkU5VWtxR3FGWHcwcURyU21ZMEtXSVRwNHhwVFowWDM2R2J3bE5RaEtT?=
 =?utf-8?B?VTBiSlJLWEdIbGNESHJ6aldLaGJlTHhkK0VvUnowV1pnWGVIMkdqWjR2aTdH?=
 =?utf-8?B?Q2JvNk9FWXBEd2JSdnd6TjlJeFcybDVkcGNuUHJGdnR0Tm5lUUJTTkxNaHJs?=
 =?utf-8?B?cmFLY2tLdmZvU3ZyYk51ZEhPZmVLMitRd3R5QzM1RzNrUHdGczVlK205TmJT?=
 =?utf-8?B?UjJyb3BnQzhzaWVZa3BsQ2JQUGVsUnl4LzJWeE1YMEpDUnIyMThET2JEekVR?=
 =?utf-8?B?ZGpwQzlkNmhwbTM4TG93RXBPbHJPS2YrTi8rREE1NDdGZWlMKzZPVGJrMjJ0?=
 =?utf-8?B?MjNrMUtpRjJuWkxnUzRraW5ZZlltMm4rdFBJQTI0bnM1VENES0ZKRk1HSlg0?=
 =?utf-8?B?TWRxY1h4UXVQUUtXNW5TS1cvT1lJb2c2bXp2eVhRUVdneGZ4b3cyNE11SDl0?=
 =?utf-8?B?ZDVVOGY0eEtic1FHUWRodU1QNElkWTB2UGltMG9yN0FTWDhjVHdlZVZqQ2h4?=
 =?utf-8?B?OUhzcXh6elRvNGFHV0FHR1kxUGJ2WUFqRk1GU1daM2JkR05kNlF6cnhtTDJU?=
 =?utf-8?B?VnBiOU1aRWZTZytnK1hNOFBRUGlGMzkyVjBqbHBiVmJYRkpWVVdIN244RFBO?=
 =?utf-8?B?SXRjQ0JhTWdoYzdiK1JmbjI2SjAvYVVNR05TUXFsbzIwUnB6LzVPYXpOUGVw?=
 =?utf-8?B?aE9FL2ZVdUdudk0veXlHZFJwOUU0b3Bqem9raTdhZU4xcFRKZWZ1dzMzYzdm?=
 =?utf-8?B?Q2s4UEpZcVV1K2trMmk2ZjRNQ1IrNTI1NVBoUFFoRmhDWGIwbCtXNE0wM2Yv?=
 =?utf-8?B?eHlhbDEyd1VocHV3azNWUmszRlh2U01odkh5NFV3TCtlRHV1ZklCanJWRUJQ?=
 =?utf-8?B?WDA2b1k1RkNxMVdwT2l2WHNwNEZ1RjZ2U1Q0cklvYnc3Y21OakozY0t2aHZi?=
 =?utf-8?B?ZmI0YUk0aGt1bUJMNzZ3b2dzMWt1Q0RxYUltcDhjbDZ3UmVmMUJ5Zm9CdzF6?=
 =?utf-8?B?RXVVRzVqWkJvYWZRdXVueWVMN3VjN3lXS2xCbWluK250a1d0MHZvTVNTcG92?=
 =?utf-8?B?bGVua3AxWW9nUURHUFRVYUdJTDViV1FjK25ROGxQem1xeThHdFFFVFp5Yll6?=
 =?utf-8?B?Z3BmTU0yTm44VkhyTk5adFM1WGFhRWlsMVFzV2tMTitXVzVNNHVpbzdPNXhv?=
 =?utf-8?B?ekFUdDdndTJPeUZkZjVvTDFuS28wdWpia0Z3cHNuV1V2MjFOU2VBU2lvSTdx?=
 =?utf-8?B?Sm5NLzRWK3c0Y3cyKzJScGZ5S0JxS3BOaXJUSTh1a0pweHY0bFVmRTg1em44?=
 =?utf-8?B?dzlITm8xTVlHLzUweHJIak9VRFZjMU5mWHFzWityalAvajJwZSs5b1BhWkt6?=
 =?utf-8?B?dFJIeURMc0VCMEJjRWNkdjBvQXVZZTBuSDE0V2FEVHNmVGJHMys3dm5qdGxV?=
 =?utf-8?B?bU1qV01tbDZKVzNoTWVseUhPTm5ZRmUwaTF2K2NCQ3lRMVdwTDVCVkpKaDk5?=
 =?utf-8?B?L2FFSXd6RzNTazhMdk80NkJYVHBTY3VldDkzK0pmTGV0RFJ0WWovcnhUOUdh?=
 =?utf-8?B?WVA5Nm1vQm9JbEFwUWkwSEF1eDlhNDhNak5rRGNMMmpoVjd3b1U3VlFmdHEw?=
 =?utf-8?B?SE1XaWhyMzJCZHFpTnhRODI4ZUNnM21zUWR1eWJnRFVKcWh6Q0R4SG5iT3R3?=
 =?utf-8?B?bmhNM1duM0gyNGRZckhBWG1kTW85RzhtSFo1bmpEamdhQ2dpTk9YdVdQNExN?=
 =?utf-8?B?RlMvRHdEWU01Qmo0RU1lOVptaVdZbGxJUURGTzhidnlKOHFucHZJVnVtdkpY?=
 =?utf-8?B?eXcyQUdDWkF6MUw3ZVo1anUrb25NQlRlMGJkQUVtTXE0NGovM1UrUT09?=
X-Exchange-RoutingPolicyChecked: 
	cV71GOKW+Av0MdJ217kTCqYXncVJxDIu9li/7GFvuhL0PygYEOIqOoTtI6FnIg+KRL37qJvuHHYuyDJOhp+QPOQ2J5cVzTkitZCO6r3KKEyj7dgdqmI8nEjo/as4LFN/zDeMYZaA4iAz1bcyxTG6c+0/kMoUc5l+YEbKVjeuKmOdGEYWs+h5nKHY3VWPeJ3gftkKlUi70DBE6H6KNyd3M6J/XKl2lpJy/rhwhjas9r5g+M4gR+iXNQp0Z4E/if4XKE9xBAj+EAX1KkBAKAUsqDoO+REx/ZmphOuahBiB4lOsMvCbdF9OoRlqHt5eXFr9/vSGDcG6fIaA+Df9S/3nUQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cd62f3f-2224-419f-e71e-08debda1ecb5
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 16:47:09.3757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +yd+du6P/q9UgmhkognpV8wt9ZSiCTGSq5Q0v+F/SbYm5VaxrSplb6WEUPSl4yj7iFG9mQTG3DZmeCpSZRP93w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7268
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: MhjRgt_6bX1BHj6JGtP2e2loYWOta6Xw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE2OCBTYWx0ZWRfX5hEb8j/jWp2N
 KrFX4XaIV+JM5ft8/R3ylNyN/LU897num+wNIPDvVsJx0u7v8UrMEN0gTApVFnlGKQgL6yoy0wv
 AFWXTNerSfq1kSPDn/yVtNfYH9vwF4xrs0UDnLlswQMWpYd8TQTYi910J1XOTj0FqDjI1uG1tZs
 uf0InxR0k2V3dM6vUWlKAneJUGqHoN57mc9j6BCscNj3n+2jJtwuaT3zDnIJ9CTqGO0UuoVkvcW
 oQ1QDN4F9OJeHehDePgj76xz0wb47RU/R6AWivN8ojOr9OxLIKI5KVbVeYR7aHnSl+SI/lTGMeO
 Pf0Z/iTTOeySIPfxzCgirtgRNOVes5AFm33H9OyVRnjiGSvIgOwiKKVQ2GBe1xd358crkb66dE5
 03fZYtnTZF2rytzbXT7Q0sUAGUxmmtBgFg0Yt5etnq0c7M2MklazF1y1pTO8YdCM0ZFHRtadLt8
 c/QHSqaysdfyrGYu1BA==
X-Proofpoint-ORIG-GUID: NE64nzG5xRmaGF_wq4CX1chodj91iuUK
X-Authority-Analysis: v=2.4 cv=FcEHAp+6 c=1 sm=1 tr=0 ts=6a19c311 cx=c_pps
 a=88sJ5CXPnL4yMuzzfZxD4w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=Q4-j1AaZAAAA:8 a=uzbBWzKhMacXkRooB9wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290168
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64TDlJu9319753
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 16:47:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237767


On 5/29/26 12:29 PM, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Fri, 29 May 2026 at 18:10, Quan Sun via lists.openembedded.org
> <Quan.Sun=3Dwindriver.com@lists.openembedded.org> wrote:
>> This is likely a real QEMU 11.0 regression, but may not be in QEMU's
>> code itself.  The QEMU 11.0 likely changed its display initialization =
to
>> be multi-threaded or reordered it, triggering a race condition in the
>> host's Wayland/EGL/Mesa stack. Maybe setting SDL_VIDEODRIVER=3Dx11 cou=
ld
>> solve the issue.
>>
>> This issue is different from the "glx: failed to create dri3 screen /
>> failed to load driver: vgem error" seen earlier, which was a missing G=
PU
>> driver issue on the host.
>>
>> If you have any detailed logs, please share with me and so I have more
>> contexts.
> It's the same issue, I assure you. Qemu 10.x prints nothing and simply
> starts, while qemu 11.x first tries glx/dri3 , then wayland/egl/vgem
> (even though there's no wayland running on the build hosts), and then
> finally crashes, with the traceback that RP provided.
>
> I don't think it's a race condition, as the failure is deterministic,
> but I agree that something has changed in qemu's GL initialization
> sequence.
>
> Unfortunately there are no more detailed logs than this. We've
> considered disabling this test, as accelerated rendering directly into
> gtk/sdl windows is tricky to support, complicated to reproduce (with
> regressions like this), and has limited use. I've promised RP to write
> up a proposal to oe-architecture, and I'll get to it :)
>
> Alex

Then it could be this:

The QEMU 11.0 changed its GL display initialization sequence. On=20
headless build hosts (no=C2=A0=C2=A0Wayland, no proper GPU), QEMU 10.x wo=
uld=20
silently fall through and start, while QEMU=C2=A011.0 now probes more=20
aggressively:

1. Tries GLX/DRI3 =E2=86=92 fails (glx: failed to create dri3 screen, fai=
led to=20
load driver: vgem)
2. Tries Wayland/EGL =E2=86=92 crashes (the segfault in eglInitialize =E2=
=86=92=20
wl_proxy_create_wrapper)

It's not a race =E2=80=94 it's a deterministic crash because QEMU 11.0's =
new=20
init path tries
to call into Wayland client code on a host where Wayland isn't running,=20
and that code
path hits a NULL pointer or invalid state in wl_proxy_create_wrapper.

Still, the upgrade itself may be fine =E2=80=94 all actual QEMU
functionality works (685/686 tests pass). The single failure is in
test_testimage_virgl_gtk_sdl, which tests hardware-accelerated GL=20
rendering into a GTK
/SDL window =E2=80=94 something that doesn't work on headless CI hosts=20
regardless, and QEMU
11.0 just crashes harder than 10.x did when it fails. The test itself=20
may be a candidate
for removal/rework.

-Quan



