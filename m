Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE2E6E7E0DB
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 10:54:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17136.1770720875915326233
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 02:54:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=lekNadES;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6501c5c083=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A7AaIB1634216
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 10:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=WcIyvwV/vuCR4tzy5G0aLPnS9EPiYENTLqA3TVrftcc=; b=lekNadESj+pD
	DuVKW8ieB+06FboRh/Df+Oe3AoaL+3Z7MvKtsQjz9X8pAJlwKc3bsNaIV5bsZoWG
	Po9QBS/XszmdNq89l3SX5a64j7vFm+KwoEa14L6yIRSbUP0Lcpyeiej6Dtsnmubu
	zSODOyD1hYoNflDfdI49at/iPM79d2SCn7Je2KZY12vddhEESk6LIQulp/uB6z3D
	KhfVBtfyXkkh6LrGBAOg3N6RZ960An6QsKSaldOemu5Crpu1+oO1aT52jX7TYXtH
	qorK5ozwA++AAOYGAgVKLBCFYYxb/8vEFHt+M21x7L9WVspB2Vjz0ZKw9ovjGrjC
	oMjGep1WPQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012006.outbound.protection.outlook.com [40.93.195.6])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5tkwk7ej-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Feb 2026 10:54:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EoWgZoQaKTn1VPIlx7WKr9h7z6u8EYnyrT1oSKM1xqINv2cZBiNPODP3c185yjTZsDinqje6SogwsCR9Y+3obdqKG1WowW557VZ68Lo1mLvuo1UDkkRgcwsg683K7oEdCdu+9uELpmAQFrdXNZv5SYSbnRBEeWPXNcOlxaYrAF9ButOCaCb+Y9lgNf5zCsdQBx6yQ5BIbmFMFeUc5RDvySfRodCjVg11/pj5/xquvfCfLcpF3t2qhjZnKiBQtWXikDVQNXiymXTwf3p4dfkjpxjg0udpN5Bu1JapTWIxA4IavOlfXtTQASXJqT/yto34oBDM8Jo1HB8OCp07A8QLzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WcIyvwV/vuCR4tzy5G0aLPnS9EPiYENTLqA3TVrftcc=;
 b=hYB/uob+CGrIQHFRKJJT4spqraVxohotOHu9RYBZN7tHbx7zXXtfm4c15NTbUewaBTSMbWdagSXIun+nF+D2pqzhuWM7egnGnx8fUgzIhrguetxXDdOx+0Xfv2rF5QsMQXfL1b1Jewa8nya5hKAKF37RIPWRUvfXaL1IbAezDp0r8pqd+NhWlA9ZjSVkPUumYcI/s6HvHGP+ioegWV/2lhkaFPaabOij8lrHYhPJ0D1RxCmhF/BkMeaQbC8PpPB6lSWspNVkVd+fZLk1QPbg926GPOSoJMkiVPr7FTOeFanytXqnzXoYB0rHKqelbyITlB67NchEBPIKMCJyhckJ0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by PH3PPFE994B740C.namprd11.prod.outlook.com (2603:10b6:518:1::d5b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 10 Feb
 2026 10:54:31 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 10:54:31 +0000
Message-ID: <ce6c27ce-4b66-44db-8545-05a539f4e455@windriver.com>
Date: Tue, 10 Feb 2026 18:54:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v4 3/7] classes-global/package_rpm.bbclass:
 Remove %pre and %postin for libc6
From: Robert Yang <liezhi.yang@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <cover.1770707181.git.liezhi.yang@windriver.com>
 <59ba081c8c874065b6cdc050a2897422be4a7a59.1770707181.git.liezhi.yang@windriver.com>
 <815228181136c50526453673dd9235a6b7e4ede3.camel@linuxfoundation.org>
 <7f8d134d-0ce5-4643-badc-8820110904cc@windriver.com>
Content-Language: en-US
In-Reply-To: <7f8d134d-0ce5-4643-badc-8820110904cc@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TY4P286CA0081.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36d::13) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|PH3PPFE994B740C:EE_
X-MS-Office365-Filtering-Correlation-Id: 53df462d-281b-46fa-ea35-08de6892c50a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YmtZWkNiU25pcm1nSDFJRHd2bU9aREo0QWZSMi9kZU42V2M4dC9XZFRCVXBW?=
 =?utf-8?B?Zkxaa1B2b05HOS9rVVR2S3dwKzF3N0lkVnp5aWVoU1BRMm5MTjJ3RHpaRW9p?=
 =?utf-8?B?c1l6dHpiOVdmOGVQQXgvS3YvRUVHV2cvcWNTZVZVbTh6VGxZakpBOEd5L05v?=
 =?utf-8?B?Z1RvMzdaMFd6anNiR2ovV0ZUVWhBazJreGZya3lBTGQxL1N4aW0zNlVRWndF?=
 =?utf-8?B?dWd1b3JsZzVTSDNMY3h5dzhDLzlFMHhmNDFtMVBGbkNENzR4UU5HRlR6WVJN?=
 =?utf-8?B?K0pBVlRYTHV3N0YrWHBYRmVWbTJzeFUraTF2UngvQkQ1R2s0RzBZUGZrcEdK?=
 =?utf-8?B?T2JTV0hrNjJDL2hGTGk4bThGMys0K294czF5emJnNG80T3o5V3N2L0VvYWFk?=
 =?utf-8?B?cXI1aWJrM1E5QUFIcjdBN0JMYjE0MGZabERGcTZUNWxwNExiYi9QOGprTmpF?=
 =?utf-8?B?TTQ4dmhQcTNyMGdYZnNlSVdWaEMzc2VMUE5DdWdHVFluNTFualQyOTkvcWFx?=
 =?utf-8?B?a0NucnI3cW5TMzViNi81NUVSUDI1akpOQ2x5YWFqaGFsa0VFaWdZQWFrZTdN?=
 =?utf-8?B?RldDancvSTlvK21XcGQwaTcreEVnSDlGUjZPaEEvN1ZrYmlLa3gzZHJSaUxT?=
 =?utf-8?B?UkduMUhLbVBmYmVyS0l5UW52M0Q0elprSkQxMERXc2tPbHRJWGZxZ2t4eGk2?=
 =?utf-8?B?dk1EOURnMHRTd1FQU2hndmRMMUZSRGlVNGFJb1NGNzFPY25SOURlL1ZUZHFr?=
 =?utf-8?B?bDA2b1pRblhWajdDVDNWU1BOdXRDTUhiZXJ1UjBRbmR6cmVuUHNsMG5vRzR2?=
 =?utf-8?B?TkhEcU4xLytDOHRqQWxlQ0ovcVE0UHZTMURiQnBsQ2hFa3M5aU5ENy9Ia0Nz?=
 =?utf-8?B?TXZVRVkxZDFQLzRGa3ltZVZGMDVFdmVPcmloZ2xoK2dtSWJscDloRWdMM0pm?=
 =?utf-8?B?aWZKY1hMbXNoVnNjL2VmRWNVZ0dDVE1xL2wreXZMSmd2U1M5ZngyUzc0M2R3?=
 =?utf-8?B?cUpxYmZscnhEbzhMbnNtQnM2bW1GWjd6SXNEZExwU0N2MnVXbm1JeWVHdjVV?=
 =?utf-8?B?SUtIWkpQQzRxTVM2TTRzdXdiUUNVMVJ4K1FZaFJGMmlKVFZzRUlONU9aOGRn?=
 =?utf-8?B?QzBUV09VV0hPaWVLMTlQcy84WXdLZ2wrY3QzR2FNSFE3djd1RWpiNEtndDh1?=
 =?utf-8?B?S2RRa0tNWGVNWmluOEptMEhLTDBmSnR0SXdZaWhtQnp5LzVNTUk3cGp1TXhG?=
 =?utf-8?B?L0VvWStIUE9kblg0QW5qS1BUU3hIZi9WU3JOL2c1alpVM2pQb0FOSGZ6Mlln?=
 =?utf-8?B?Y2RnMWl1MWs1Qmx3Tmoxbll5OEcxWjY3WDdXSzIwRG4zOFdaTlV4eG8vWnBm?=
 =?utf-8?B?UE1ucXJHbzNTM2hrWEZCeWVXZVBNTVIrbGN3c01VQXNwTGN2MnhkQ1hEUUlp?=
 =?utf-8?B?Rm5IOWFHNFdSWndlTlpjRGFNTmNJNTc2ZWhHeHYrdFpRaWoydkZad2Q2aDBX?=
 =?utf-8?B?d0YxM3pteTdZMndsQWtCQ3dVMUZ3RUZGN3A4R2orZFNCc3ZpMDN4VkROQjVk?=
 =?utf-8?B?SzVvd1lCMmEzTG9KOFpkaEhFcEVhS1kwcEc4V2hLdEltdWJCYUtzd3Z6SUZV?=
 =?utf-8?B?SFhvaFQyTUw4cWp5bGs1Q2NmUnJVemN6ZXM3SGZtMDNPajE4OVpSZWpZQXZM?=
 =?utf-8?B?cHp5U1ZRYzFjKzg0Y0xLL2J5N1pHbGd5MDJlMHdvVU1uczE0bktRVlJOOTlr?=
 =?utf-8?B?Qit1NHdWNE9QUjBWQ3o0aDBpUy9KVkZuTEUrVUovTXlvVk5VQU5IeUEyZjFh?=
 =?utf-8?B?alQ5YlM4UG84a094K3Q4NlVTOUEwZkZqZnhOejl5Vk1YVjR1WlN5eDBvNFV2?=
 =?utf-8?B?WUxSb0pFZXBJYUZhL3o5MlR6TWpvSjdPbDRMY016dFlJQklMN2NPVWs4cVNZ?=
 =?utf-8?B?OGNXcit5dG05Y2Jpbms5MnBPbmFvQm5aRmpKRzhUbkFzT2dKMFlXUTNHU3Vm?=
 =?utf-8?B?Z1JuS3dIdmJTU0xwUXcvTHlIWG5Tdm5VU2VsYjAxaFZwYlo2ZC9BTk94bFBi?=
 =?utf-8?B?dGpLa2pFemxkVEhSM3RiQlVvZHFtNmlROFJFeVpnd1laRkZpQzRYeXd6bzFr?=
 =?utf-8?Q?pu3Q=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bDV3VHUrT2RYbzlpdGtRcWY1c2VNS2hpUm5TQjg3azNYZkxsRmRUTys5dDlS?=
 =?utf-8?B?aTFnbXBzeFF4eDRZUWlwRzI4YmJTa2hqV0JEd1VSbDdZN05ESS93bStvZHRP?=
 =?utf-8?B?K0FVUTVQMnRreHNmVEJMa0tLUG9DN2ZlR0c1Z0UwN0dmcUlTM2Zya1UvRXdo?=
 =?utf-8?B?eE9WVXFuNTJSRXNCRm1FdlJPZkVUNlVBUXcxSk1STmVSb0c5aUp4a05pelNL?=
 =?utf-8?B?QlZ4MUsxd3JqcklFRWtCQmhOT3NaVWpldDJZK25UOERrb2hmSEVhUTVaTmdI?=
 =?utf-8?B?L0xldVNJcWFFdUsxYWZld2RySGYzaGdBR3ZlcmVjM2xBa2RlTTZMcVhzNGQy?=
 =?utf-8?B?ODJXUWhkQVVhQTFIcUpqTVNDVjN0am8yWHlqcnBYcklzWGQ3RGVwYzhnV254?=
 =?utf-8?B?TG1pOHlEcWxpaE9sV09WWWpRa1BlR1RHWFNrQXBQWEl5WkdZalAzczZLbXFT?=
 =?utf-8?B?SDh2UlpHSEpoT2VEbFNkcXd3aUNGUlFYZWRXMHFGRXBzaGNCSnJncUVoblFo?=
 =?utf-8?B?T1dHTjcvT2g0c3VjeDFLeXRrWWswTTlVaWdCUTl6ZmtUNC9Ba3h1c042ZjFV?=
 =?utf-8?B?d0RYcmdlMHhoNjRrV0xvZHorUWJEQnIwTkFvdkR6R3BwYVlWanZic01nMmlz?=
 =?utf-8?B?Q2ROSTBTSjRzaHJ0MlBYK2ZjcVNKL1IrS2VuQzBTb3Y5YTFaclRnbGRySFJQ?=
 =?utf-8?B?VE1FWDVPZGVoTFFLaE5lMTVTQ0lNMlRwcndibG4vV2pjL3B4dDZ1WUhyVTBl?=
 =?utf-8?B?bG5DOXNVL0FoNWM4eTFGSENvc1NIWHVBNXMxeHFlbkFlbEZhZDg1Vi9Jbktw?=
 =?utf-8?B?WFk4cjVXYXRMUUtrd0FRZkV2TVdLbGJCOTZaVGdZR3FmMTNTaC96d29lS3Q1?=
 =?utf-8?B?TGFGZE5FMzRReENaQ1p3Z3VpTTNUbm81SlpyNUJEV0wyeU1pdUZRNTE2Kzg2?=
 =?utf-8?B?MEplN0w2OE5KYW55WTE2VUJEcGxWb2dkOVArTWFIN0pEMjlZWFBza3g4NWdN?=
 =?utf-8?B?ZkpXWlVaTDh2YWRwSjQyMVlZSWt4SUI5RytqNDhWemVXNXF2a1VuN0pETGlC?=
 =?utf-8?B?RkZYSzI4SnFSckUvdzhwYTM4YmdWQ01zMy9OblJyUHdKYVYwUVVJQXpOL2U5?=
 =?utf-8?B?RmlTclZyTlhQbnRXUmtGUlZsOFpheWlKSitNdEsvblZnS2ZRYnFiNWlLY2xj?=
 =?utf-8?B?MC9udVh3eU5wQ243dUFRSkFoUm0yUXgxRGpNNzNkVk51WEtLd0lBamp6K1lI?=
 =?utf-8?B?Z2Q4aEc5NUNJbFJtYUNVanJmNEk3RU5vUTVlYkk5YUJyWVcwTldYcUEybWNB?=
 =?utf-8?B?S1dic3IyYTZaSGxSd1hpeWhibkNPZ21yK3ZrSUpxQkxWNHl4NUVFeFk2VFVy?=
 =?utf-8?B?OE9tMXpkWXQ4SUdoMWtxVHJicTR4a0tURW9ZanZtY2hQeERzaXdyaHVONFNa?=
 =?utf-8?B?b2lhSDJiS2RHNFBJOElLOEd2L2xKSWlqQ1g4b1prSE9kemFhaTJTVlFZbGk4?=
 =?utf-8?B?ZjdrQkRndm9KOWJ3QjNLWkpSRXppQysyS2xjb2gxQmRmWmZrRTVyMHVRZjBs?=
 =?utf-8?B?eXgrMG1BWEprNll2N2k4T0E2Zy9xRHdBOUcvdDNGRG5SSURCSGMxUnhNTk1q?=
 =?utf-8?B?MlFabHhlYlJDWExYL21SZnpnSTh3WEpsU2JLNGhLUTA4U2hEeHF1a1BRY3lI?=
 =?utf-8?B?K2g5T3JPYTNYdFBZZzgxVHpueVZkOS9JbVlzSGVGODBXbnpwOHpSQW1sSFI0?=
 =?utf-8?B?ZnhjMEY0dUtFNHZkNUZqNXR6ZHcrRWJKREJOZTlLNEczMmhyaitlMDc1YUV1?=
 =?utf-8?B?OFhFdGpnSEhWM1ZRdzJ4bU0xK2JUTlArb2RiYXhMTDJuMHl6Q04vemU0TFRE?=
 =?utf-8?B?ejFWNXBhbjFtcUpLRjJiRmJKZ2pPUFhHMUVjYTkxVlVFOTRlbXBxWmhxeHl5?=
 =?utf-8?B?anRvRHVzMG5QREEyNkgyK09hZEFIZ2dHczBuUnM1eGdsWGprYVdSckh3TW5Y?=
 =?utf-8?B?NXpZSzhZaTc5di9zZEhxRjhBVE9EUXQ3M25YdnZ4UTFRcGhkOWJHWGtIZ2hQ?=
 =?utf-8?B?MUs5T0E4R3R0K2hHSnVIampZeEo2L0xBWDRIMmxCNGRteXBxWjhvOHdXallF?=
 =?utf-8?B?dlo3M1pIcThJNmw2MmZ6cU1YN2NCckw3TnpCNEttU0VWRlBhRVFndndNbm0w?=
 =?utf-8?B?RVdvZThLWlE0VXBieHROSWc1NnBiS1RWOWxqQTZqcjNJam1QUnRhYm1MWkty?=
 =?utf-8?B?S1RJUnQ1ZTZQazdYMW1WQ3AwMW93K2p6T3pGTEhYNE5QQkorb0hSVGx4Ykx6?=
 =?utf-8?B?NGViRXRSMi9IQ29VdnJ0SWtRa2JINmNqOWgyNGt0K0FwYlV6RGJ3MnZkZzNs?=
 =?utf-8?Q?KdQhqn1Licp5a6co=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53df462d-281b-46fa-ea35-08de6892c50a
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 10:54:31.4958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vv4jMr92EyPkRKxINarixYGCxWTm8YrZFVq+hnoYXetWnAQ720ECa20OWvGA9f4/bbEYG8CZcy4b3rvbaBI2abx6pQVRTN0AJqZSRhkDAYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFE994B740C
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=bvBBxUai c=1 sm=1 tr=0 ts=698b0e6a cx=c_pps
 a=NVT6GquIkcOJbfF4gP4t1A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=uzb1ML4FPayjTsTmckoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Ya__HtoBOhs6DWnacvFLagBrw-PPla-Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA5MSBTYWx0ZWRfX0IuqFfGNPDj8
 5y7wlbYkG4gTWyTaiZ8cEGAdUx7y0nKDgKS5POfpfSlVJnDSy9Dsq334v7DC4cf5Tadm2jV00VT
 eFfRUUcVHifD5flkKgiX2uV7uSIHReO4fsR32rxoqXWaIkcUGjvR0MV26+E+j3iC46062LHQs2z
 qBMnSztBVuRXF1hZyPK97IY+s7A/J9Ytg+KLCruhOMmqgwMKDOXkJO4oKd6kKaAYI9K2O+KCLqt
 OgP1L9/h6m4G1pT8am+JWSYwMN0y1n6Y2XCPv+jrnKjL54oIeapcyATpVdZF+RJyZt+gLYLe/aN
 41rEMtoVoVYApyPBA0PuBnZeGzm86h0RKTkm7G8OnjGoqljMThdKJpE33zwidiLUab8f2BxxfP5
 ynIbOUOdxF01k+YmAgEUznBnYNJBXYExIvwscwdxppLzSC1TCZyYg80HG7Gw6WYCE+mDZfIn3RA
 yzBXhXjJTtzP1MBWumA==
X-Proofpoint-ORIG-GUID: AXgjr4k-ufNzq8VfVDhniCSTuDUD2uWd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100091
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61A7AaIB1634216
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 10:54:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230884



On 2/10/26 18:08, Robert Yang wrote:
> Hi RP,
>=20
> On 2/10/26 16:52, Richard Purdie wrote:
>> On Mon, 2026-02-09 at 23:10 -0800, Robert Yang via lists.openembedded.=
org wrote:
>>> From: Robert Yang <liezhi.yang@windriver.com>
>>>
>>> Fixed:
>>> $ bitbake core-image-full-cmdline:do_testimage
>>> %post(busybox-1.37.0-r0.x86_64_x32): execv(/bin/sh) pid 624
>>> error: failed to exec scriptlet interpreter /bin/sh: No such file or =
directory
>>>
>>> It is because busybox and libc6 depends on each other, busybox' elf f=
iles
>>> depends on libc6, and libc6's postin depends on busybox' /bin/sh, the=
 do_rootfs
>>> works well is because dnf-native has set RPM_NO_CHROOT_FOR_SCRIPTS=3D=
1, but it
>>> would be failed for a fresh rootfs.
>>>
>>> In rpm 4.20.1, it let the installed files' Requires win, so it instal=
led
>>> busybox firstly, but in rpm 6.0.1, it let the postin's Requires win s=
ince
>>> postin would run immediately after the files are installed, this does=
 make
>>> sense, so it installed busybox (which provides /bin/sh required by li=
bc6'
>>> postin) firstly, then we got the errors. I couldn't find which commit=
 made this
>>> change because a lot of files and functions are refactored during 4.2=
0.1 and
>>> 6.0.0 (not .1), I also tried bisect, but failed because a lot of do_p=
atch or
>>> do_configure/do_compile failures for each build.
>>>
>>> For libc6's the postin is:
>>>
>>> =C2=A0=C2=A0 #!/bin/sh
>>> =C2=A0=C2=A0 if [ x"$D" =3D "x" ]; then
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -x /sbin/ldconfig ]; then /=
sbin/ldconfig ; fi
>>> =C2=A0=C2=A0 fi
>>>
>>> This doesn't make sense for lib6 since there is no /bin/sh or ldconfi=
g when
>>> libc6 is not ready yet, so we can just remove libc6's postin to fix t=
he
>>> problem.
>>>
>>> And also remove the workarounds in oeqa/runtime/cases/dnf.py, they ar=
e not
>>> needed any more since the circular dependency is fixed.
>>>
>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>> ---
>>> =C2=A0=C2=A0meta/classes-global/package_rpm.bbclass | 6 ++++--
>>> =C2=A0=C2=A0meta/lib/oeqa/runtime/cases/dnf.py=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 8 --------
>>> =C2=A0=C2=A02 files changed, 4 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-g=
lobal/=20
>>> package_rpm.bbclass
>>> index f4dd779a52..526ac57982 100644
>>> --- a/meta/classes-global/package_rpm.bbclass
>>> +++ b/meta/classes-global/package_rpm.bbclass
>>> @@ -421,12 +421,14 @@ python write_specfile () {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spec_preamble_=
bottom.append('')
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Now process =
scriptlets
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if splitrpreinst:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # The libc6 shouldn't hav=
e %pre or %post to avoid circular dependency
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libc6 =3D '%slibc6' % (d.=
getVar('MLPREFIX') or '')
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if splitrpreinst and spli=
tname !=3D libc6:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 spec_scriptlets_bottom.append('%%pre -n %s' % splitname)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 spec_scriptlets_bottom.append('# %s - preinst' % splitname)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 spec_scriptlets_bottom.append(splitrpreinst)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 spec_scriptlets_bottom.append('')
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if splitrpostinst:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if splitrpostinst and spl=
itname !=3D libc6:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 spec_scriptlets_bottom.append('%%post -n %s' % splitname)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 spec_scriptlets_bottom.append('# %s - postinst' % splitname)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 spec_scriptlets_bottom.append(splitrpostinst)
>>
>> I'm not happy about coding a "libc6" reference into the generic packag=
e
>> class. It does make me wonder if there is a similar issue with musl fo=
r
>> example and we'd end up with a longer hardcoded list.
>>
>> Could/shouldn't we just not add that postinst for libc6? You could for
>> example force the value of pkg_postinst:libc6 during the packaging
>> process and empty the postinst instead.
>=20
> I think you meant add the following lines in glibc-package.inc:
>=20
> pkg_postinst:glibc () {
>  =C2=A0=C2=A0=C2=A0 echo
> }
>=20
> We need an "echo" here, otherwise, meta/lib/oe/package.py would add the
> "#!/bin/sh" to the postinst:
>=20
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if needs_ldconfig:
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.=
debug(1, 'adding ldconfig call to postinst for %s' % pkg)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pos=
tinst =3D d.getVar('pkg_postinst:%s' % pkg)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
not postinst:
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 postinst =3D '#!/bin/sh\n'
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pos=
tinst +=3D d.getVar('ldconfig_postinst_fragment')
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.s=
etVar('pkg_postinst:%s' % pkg, postinst)
>=20
> But this still doesn't work, because rpm will add the /bin/sh as the de=
fault
> interpreter when not specified. And currently, meta/lib/oe/package.py
> add the ldconfig_postinst_fragment automatically when find so files,
> that the root cause, so how about we add a value like:
>=20
> NEEDS_LDCONFIG:<pkg> =3D "0" or "1"
>=20
> Then we can add the following line to glibc-package.inc to skip that.
> NEEDS_LDCONFIG:libc6 =3D "0"
>=20
> And also we need update meta/lib/oe/package.py to check the
> NEEDS_LDCONFIG:pkg.

A easier way should be like this:

lyang1@ala-lpggp3:glibc$ git diff
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 17535ebd6d..f97eae104f 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1824,7 +1824,8 @@ def process_shlibs(pkgfiles, d):
                      if s[0] not in shlib_provider:
                          shlib_provider[s[0]] =3D {}
                      shlib_provider[s[0]][s[1]] =3D (pkg, pkgver)
-        if needs_ldconfig:
+        if needs_ldconfig and \
+                not=20
bb.utils.to_boolean(d.getVar('SKIP_LDCONFIG_POSTINST_FRAGMENT:%s' % pkg))=
:
              bb.debug(1, 'adding ldconfig call to postinst for %s' % pkg=
)
              postinst =3D d.getVar('pkg_postinst:%s' % pkg)
              if not postinst:
diff --git a/meta/recipes-core/glibc/glibc-package.inc=20
b/meta/recipes-core/glibc/glibc-package.inc
index 21f2200d19..df0dd6720f 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -293,7 +293,10 @@ pkg_postinst:nscd () {
                 fi
         fi
  }
+
  CONFFILES:nscd =3D "${sysconfdir}/nscd.conf"
+SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} =3D "1"
+do_package[vardeps] +=3D "SKIP_LDCONFIG_POSTINST_FRAGMENT"

  SYSTEMD_PACKAGES =3D "nscd"
  SYSTEMD_SERVICE:nscd =3D "nscd.service"


And also set the value for musl.

I will send the updated patches after more testing.


// Robert

>=20
>>
>> Also the commit message explains the problem with the postinst but not
>> really why the preinst is a problem? What does that contain which is
>> problematic?
>>
>=20
> It is similar to posint, the prinst has a harder situation than postins=
t.
>=20
> // Robert
>=20
>=20
>> Cheers,
>>
>> Richard
>=20


