Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15281E73164
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 13:01:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51649.1770037302594681789
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 05:01:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CTjsoaLO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=649331e31b=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6129vDPM3189312
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Feb 2026 05:01:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Pa1UXd6chpaeGiWOzJYx+l3cXcFCTBwT3WxGmjobq9U=; b=
	CTjsoaLOGGylePtQAs+3Y7Hikc792ORTLx5mP1CwwqgqWr+CnBKyEfg1WRSHKmmU
	g+QPCCurhIYaVp6mQGgfC+d9tR0R848jXasSYZ2pfwyslEaxtcRcYyLg4fw+PIuA
	2yOAmv//sINtVcRR7+HLkjAR+8/YIsPfmanQAJZ3aSRzColWB2so53RonK/zNM2x
	XgSjl9aFcFTDu/NKHtE6o3+VO1lVbHbBoGNvAom3tot4YwFMF8oHNf3yNuuseQJU
	eSA9fm+17SeGTapn0KLFLDxtf+pMhq4S1+53trSA6VQ/7uBpW4Lm8sUFv/KnPyMh
	YRQH7k414PvFOevo59BUZA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012033.outbound.protection.outlook.com [40.107.200.33])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c1j4gsnfb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Feb 2026 05:01:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vcpmBLAxZM2QzzFgQaj+/ITQwRaGbCvqZ3FrNB2x3m8/bTi4NXg6D6moMMrOEJlDVmDVGEgY6iIx2GxdVeGlEr2fJ+kHcWixJ4ByCMCksTpOb2ld4nQC4D+PafBzyqkmSxhNmT7hdibl6zXvX+WQXhLQOy2g70+aFQtQJ9QOob4Q/cqhutApF9ZemLwzKRh84EpV8M9bMar4TLA3u9FCycsG/wnVMz/mZsM6c1nZeaGGJXT/zDpJlSkhqfMXHPEQC6APny3pyoT3gx4RJLPdYCcyYiNZSHBcqlu6QwXoQftk5UVc1eAmZmz7+v7xibhipxSQHw9wbfqHBcEyshZqHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pa1UXd6chpaeGiWOzJYx+l3cXcFCTBwT3WxGmjobq9U=;
 b=Upm+gqh4/8MkRaKpkxop/DY10bDYrralnWE3CDEjgwZcUsKQNeZxzi1qrLcD3HjRFczSQ83jf1KT7kLRpDUcqLyQU3sZZEl+xCRJMLZ/mVJ31BiJ5CVHLHr+2a99StFJcZJFA7c8Fe5pIjuEdb1c5C4gDuAfhP4PC8uEeEOEVqBng112ECEJTofKxqiJ2Ntm9IUbBcSFYWQo7WJijwgQZB6bvzDDjNaDhBN4Oa8opltNfQVN0RFyy+iw+E+7kPJH/DsWbHaUy0aPAcRQb7aU86pVbag65kkJtM8wtMY5G/iyCnK3EPq9qgCwGmUKDcsc+yL2KvLNLS4N2ztxGy8i7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 13:01:37 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3%6]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 13:01:37 +0000
Message-ID: <495ad555-f9e8-496a-99ea-4b04702ac23d@windriver.com>
Date: Mon, 2 Feb 2026 21:01:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 2/2] rpm: 4.20.1 -> 6.0.1
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, richard.purdie@linuxfoundation.org,
        mark.hatle@kernel.crashing.org
References: <cover.1769148163.git.liezhi.yang@windriver.com>
 <212239fdc34e812c1e827917d5db83fecac2a3f3.1769148163.git.liezhi.yang@windriver.com>
 <DFZDD2VAMRIY.3LGF8BHLVYMLG@bootlin.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <DFZDD2VAMRIY.3LGF8BHLVYMLG@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0114.apcprd02.prod.outlook.com
 (2603:1096:4:92::30) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|MW4PR11MB7151:EE_
X-MS-Office365-Filtering-Correlation-Id: 5640d74f-91af-410a-e0d1-08de625b330f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VjJoZWdYMDVGVGlsRzJEaVVwalFJT1o3MkdGcjFVVlQraGdrbkdHRDExOUdU?=
 =?utf-8?B?TkpBVTVDQjlsYkcxQS9BdGI0Zk9ENWNBSnpMdGl2d1ZjUzVHVFBTQTZnNTZr?=
 =?utf-8?B?VXdYZjZyanJScFFhZEY2Q0wwR0trT3JSRzA5ZVBoblpOdzJ6M091UGg0Qmox?=
 =?utf-8?B?TU9ZNzZKeEZncDBsNkZLYTlkazlxbnlhM2pjc1NqWkN3MU10WWh2dkt0NUhD?=
 =?utf-8?B?dm9xV0xadk1RWE5BbHdFcW1lQ3gydXdXZmcybkh2OXFodVpTSlFGZHJJLzlF?=
 =?utf-8?B?L2VVdGUyUVZ0dkFjOXUyK1p1UVFJWE9CbG55N3NqQm80UUVrMit3SWNUOURw?=
 =?utf-8?B?cmdaM2s0Qi9oMkVhUmF5Smg3Zkc3ekRzVWtJbTlpUnZjM0RNTkUzbVEyQWlY?=
 =?utf-8?B?RjdkNWZ0UEltUWM3TjZ1TzRRYkk2cEpIN09qWlhzT3BNanFBbURXNmdCKzZC?=
 =?utf-8?B?YzY1Unh6MFMrbTlmd0N5cTR0QStObjV5V3RCQTRmK25OQmdTNXhiei9zWkFQ?=
 =?utf-8?B?QUlzQUEwcmdWN1JxRFBmVEFMSWRLSUFYWVU4N3ZSTFBXSmI4UlpQY1JxZHVo?=
 =?utf-8?B?RENrR240bFpkbkxvS2YreG9DZ2dhM0VsMjNSUS9qTVlMajQ2bjcvRHNlcnpW?=
 =?utf-8?B?dVBDZ2tiRnh6blBML0w4aGl0NFA1b1pLY1diUDNDS1ZEQXZ0Yms5SjZWZEJ0?=
 =?utf-8?B?WlMxRWVTVjNXV3RqYml1UG14YVhNSkFxbEhteXRpb0FuRnZoNUdOY3VHREdQ?=
 =?utf-8?B?Q2ZCT0MvVDVNRnoyUnhrVm9YTlpyd2x3REtFRjY3akxsbXFLRUNodTRORmk1?=
 =?utf-8?B?TWtYb09hMHRuNzdoZXBHUmhUeTNWVENnQWZhdDVVN0pzSWs3MWJmZE43WHZK?=
 =?utf-8?B?RUJzakJDWGNzQ2hHSjFsa2RYNjhmTDNLdGNTZFBTZkE0VC85M0ZmVkpHUnVs?=
 =?utf-8?B?Y0lsWHNKUEtDVkhaNjV3VTBhOGE2clhVZGFyVjFPQlZpZGdyRFk5TTk1Zko2?=
 =?utf-8?B?a3lZTk9IRUhNeVk4TkN5alRSdTVrYnFJQjkzZnFzMDNsUCtweEVQZ3BXa09i?=
 =?utf-8?B?WnFqbEdrcm5ZMW9RcU1RcmtnVythY0JiNWw2anc2VFVlTWRZMTVIcG5KUGo1?=
 =?utf-8?B?NGFQWFNJYzl0Y1owTkRzRVdPK1d4bkcvU2wxNStxWDFZbGdXSGV6Ulh5S2lV?=
 =?utf-8?B?aUU5b1ptZDlDaE5iblJnbFlLZDk0UmpQbkpNdkhUS3luUzVXWk5pRVc1eTNj?=
 =?utf-8?B?am05RzhBaWhydzM4VUtHWDdNK0VpK3A2SVBMTVR0ek54Vkg2Y3RnellTQXln?=
 =?utf-8?B?aHQxTnFRbEpCREFsN0Q0NndYYVExWmhqTXZDUTRqZittT1lpTm1BTmZWcUdr?=
 =?utf-8?B?M09uMlBMTUVncmMwbzQxRFI4MTJjOWZ0aHliUHlIUk1TYXVyNGpKVCtwNDlj?=
 =?utf-8?B?cnJhMWU3ejJpRGJ6SlhqVVAvVjUxak84RHh3dVgzMWRWL1FWQjljc2tWNStT?=
 =?utf-8?B?dHVhZGluM21LUGFvVFFoQ2srRG1ycXNRN3BOakpYWnpoN0RZQlFFaDM2L3JQ?=
 =?utf-8?B?cnNlcXRZMitIWEl6WVROTStiZE15Z0czdTBVZGJMS3dncXF6bUlTdmdWbE8y?=
 =?utf-8?B?LytVV2VyR3RTK09uNTNFREVHcFlVVWY3cnRrTG80MXAybVJ5eGtBK2k3cWtl?=
 =?utf-8?B?Q0hTaGl5eXd2a29iRmxXOU5qQ3E1ZUoydlpGVEprdG9xK25hM1Jabm5UYXpi?=
 =?utf-8?B?WDVpbXFlRlNLVnNqdlRsMzZacTRTdDBTQ0wzKzIrQkVsNisxRjNlbEJndzBj?=
 =?utf-8?B?bDBueVltTmFFNklvMExUUVFpbkVtWmc1TUh1K01kbE5HL09oeEhJRzg3RUFP?=
 =?utf-8?B?dU82Yk9OZXBNS1JIQUdZNGxFZ0ZFQ3FCWGFmeGRsdzVuYUd3amltWlMxa0ht?=
 =?utf-8?B?eUpESjVYUzBINmsyRHZreXJTZG5JeDBzdXh1WTZZMkFWbnl6M1R4bjdmVVlO?=
 =?utf-8?B?U3Z6cmJybmdCajN0QzN6dUcrYlpiUncrS00xRVZSWEVJaEU3dEVmRy9nMk1z?=
 =?utf-8?Q?S/Q1zc?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RjU3emE5c2YyUWtqbVZxYW9PMmFCMFl3WEp1anNyb3RWVnNzK1dOWExjRGpE?=
 =?utf-8?B?cFdIYys1RDVFLzZ5dm9wcm1yUGwzZHVCVGtXay9CVU1uMFpDUWZMYW9CWTlH?=
 =?utf-8?B?bzg3U1BWZDN0VEVyRU54YTVvaEtzdVJjbW9DZTNWSkpoS216b3JJbHM4cTYw?=
 =?utf-8?B?c2c4UHhiRWxKTjlFNnRqSkJhZFE5bzlaejBCMWJQZkQ1cG9rcitmeXgyQU9B?=
 =?utf-8?B?ODV2bVlNZzJhM3I5YUw5WHQrUTN6ejhpNDRNend2YWI0RVR2Zk1UYkxuMHlm?=
 =?utf-8?B?S0VRNG1vRjlFOFg4Uld5L1RTbEMzd0tVeTlCUmMxYkhkNDFlakYrZ1MrRXdS?=
 =?utf-8?B?T1Q2NUpBRGwzNHRLaThYUFlya3RDRHJZMDFWWW1YazNwbEh2ZnFIZGp1b2Z5?=
 =?utf-8?B?N1YrRjY2RU9hRm01dk1PdVlNSlp0cGE0emxHSjdEUGtTV0JLMHZ3WGdrSUQw?=
 =?utf-8?B?UWpyaE94RkhUK2hsZDZuam5GN3NrMWN2RDRuMUllc294TVo3Z3plSk1IUVVR?=
 =?utf-8?B?RUlxSWx0bUROZVRJZ2d5S09pcHFtWVZoTi9FVi9aU2ROM2M4WmJ4MlJVYjQ3?=
 =?utf-8?B?eFViSllYdGd3KzVpL1lDN2gwbEY2M1VabERwM1dZbmd1Q0RBakVvTXpJVXVt?=
 =?utf-8?B?OUdTUU9hUkgzMHd6dDlpT2YvalhsSVdiN0MvNzR0aStMWS9ubnhoMFpNcDV2?=
 =?utf-8?B?dlhMam1jZDJGd0REUWVpb2M3Y2F0T1RVWktWZmE4bVByWXRHNUtFVHlLQVIz?=
 =?utf-8?B?UGNHYThxWjhWY29lMlgxNVdQQ0JLdTlWeVduYjRrVHFoVDJuanJ4b0NycTdK?=
 =?utf-8?B?RUZ4L042d3g3OGhveFpoVmI1a2NFaHFaYU1YalphTWJwbkxWaGpWR0tzamR1?=
 =?utf-8?B?cVp5aW1oWUJYUlNFMnZTYVJPZzBIWCtKdW5JVTJpemhCYUpVbU5Da2RiOXFi?=
 =?utf-8?B?MHZmRE9NQWk1Yk9BNmlBWWxybU90a20zTkpMQVF3aE9EZ29DNVp0K3dkM1lr?=
 =?utf-8?B?NkVaaWpMY1kwNUFJUFkvbm1SRW9jdm44N0Y5R2oydWM4d2tuUDVZdFNrUW51?=
 =?utf-8?B?NW40cGltVWpiWDkwd1NZQTNrdUxCUVJvbTFXOHl4RFZnaVY4RlUrQ1VNU0Fv?=
 =?utf-8?B?SnRjNWQ5eXE5MjRnVXZSSFkrUi9UeTluWVpCQlVqTVUxbG9ZTWdTSW9DRW9p?=
 =?utf-8?B?L0JlK2pRTWIrVmxSbmF4R2REdVNYdzNyZURHQThqT2l3eWdDSWExbk8yWHhB?=
 =?utf-8?B?K3JDTitJVGxwNzRkMkZvQ3lGeXhoem9HUzZxaVYzREQwQ1N4YmU2cSs3UUFY?=
 =?utf-8?B?YXh1V2gwKzJjUTFkS0w2UnM1T1RJaGxOenJ2S1hhbjJKaStVbTliS0JVWTF5?=
 =?utf-8?B?UkYwTTVOeWUrSXdUSk4zOWJYbldSdnpjM3pWeE44eVViUkJ1K1EzYkdyVjU2?=
 =?utf-8?B?bHJkRERPUW1MVXdGSm1TTmpjY0JhbGthWFVxdkJWQm1nSmJVZklveUtZdDhK?=
 =?utf-8?B?UFBWRU8rUm5jWkRvWkcvSGMvbno2RklNYWxFeEgrbkVuUHYrUnBxMXFoc3l4?=
 =?utf-8?B?R0FjM1l4ZFU5eXJ5a0ZzOFk2Mzd0eWNQRTE5a0NydlFqdm91WkpETjFvdzdr?=
 =?utf-8?B?OHBmNHZEN3pHZWtXb29YOFlRdEdWSHUzSVIvRm9OOWo3MDZ1SXNYMmgxcWhT?=
 =?utf-8?B?ay9hOUh3RWNoVjM2WXQ0cm1lc05QMk5QSEl2ZlpWSUw5SkREckRuWlp2dDRa?=
 =?utf-8?B?Y1FiZktPM29vdzVVMUx5QUZsclEzbG8zaGVoSVM2Y0xtTnMzcVQ0RHpzQnA2?=
 =?utf-8?B?Z08wb01GSTFMbWVJNUJRWER1SDZWY0duQzBKRUR3S1BGZ2IrVFk3UkNVNU1m?=
 =?utf-8?B?TVdLU3Z2OFlVY2tveDJ6TjJPWFEwR3ZqaXRjV0pxdVFkcjdBM0MwbEJHd0Q4?=
 =?utf-8?B?ejFmVnB6TEhudU53bTRrQW16RWc2RWtLb1QrbzZvUDNnSzg4b2RHZ2FoZTJK?=
 =?utf-8?B?SjhidUI4MGk2ZmlzUTRGZHFSU1R3QnUzRXQwOU8vcEVYRU9KY3BCNWNuRDFT?=
 =?utf-8?B?eDJHVEhvYWRQNDhrTFVRL0s3V2x1RmUrdmNVN29abHF3NmJyQUhvRXhUb0lz?=
 =?utf-8?B?T0xZZmR2MnhRdS9sM3A3TU5uNUZOSVdvUy9vZk5rUVJUdm1qUjByOGptZ0tX?=
 =?utf-8?B?ekE3WFUwUnBsVkhsQktBRC95QkpGVnpQajZWOFAxenFKRWd1d29ZaGI5V0Vk?=
 =?utf-8?B?Z1lMMjA0VytGREl2c28wRkVoZk5NeS9kcWhKb0ozalZXTjZWdDA0cmJrclFs?=
 =?utf-8?B?OExmOWlIZElueG1xbXVudUVkVDdSMGFLK3EvZUxNNjV0RDlVMzNjZ0tPQmNQ?=
 =?utf-8?Q?pRBe8VylEa5gV/20=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5640d74f-91af-410a-e0d1-08de625b330f
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 13:01:37.3958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lM3OdYiZL4ZPYIa3SCAWoJeZaLE0werDAWuHjXnq0kPKaH2sfCNGgvDG3LkWlK1XGK7qFwkrfjhlUuK5I9YwmQJ7gNCTcvgj8boOjoQ88q0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7151
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: sPodx88UdFALeiWhAbSsHiJiR707XTYm
X-Authority-Analysis: v=2.4 cv=UqRu9uwB c=1 sm=1 tr=0 ts=6980a035 cx=c_pps
 a=7wosIiAuCGbz/5oJp7M3oA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=mAICuo4sAAAA:8 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=A1DmAbejDM2ggrVNk6QA:9 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10
 a=eCMZ9PnozbMVJGdlLxYy:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: -roEk4lKgEj0J37ru3Q0Rt4bzYkghNz6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDEwMiBTYWx0ZWRfX9KwGzDPFLxt2
 PpMCUgPPkzT3BfT/IH0nPf7CAUAyfhSKzszYXAAmsGv7/JvYaal2fdWYeTsMTeTRMIB8foexkde
 gC9PbWvkUV+++P1JVmoIPFZskz0g9KqPHgKgNIHBB/EiON43jquUQnu0bCAv0+MBn+K3h5hSc5Q
 kYnVS+jAIXDe2tU0iJ2su33EiZUKKbjDQR3BIwJE3QrWWVxm8/0Q17TlkswkIhqxzJbaYtCaPw8
 VVgECQiws9pifqSFXX66kTKB7XHuOedEGzEU5owDEQIF0vwbQ87gUJsAn5eJ23+EGgCVifif+nY
 TIQc5E9MFQacjx/P1i5xtnrAYoXDHKBZRsBMTyaUUXLpuQ/i0GWSMf/YvYrZ3iVg6njJtKtl6p6
 4Plge0VlkyT3WZ3r+bg35Ik1eYcDU90YDlbeeTx8GXgs5S5IvrpX+ZhwQy0gaFrTFcheueAa9XB
 oXwI7oXSSRRZSQaztsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020102
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 13:01:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230351

Hi Mathieu,

On 1/27/26 20:27, Mathieu Dubois-Briand wrote:
> On Fri Jan 23, 2026 at 7:13 AM CET, Robert Yang via lists.openembedded.org wrote:
>> From: Robert Yang <liezhi.yang@windriver.com>
>>
>> * Add a tag to SRC_URI so that there will be errors when only change the
>>    filename during upgrade it, as suggested by Alexander.
>>
>> * Rebase the following patch:
>>    - 0001-Add-a-color-setting-for-mips64_n32-binaries.patch
>>    - 0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch
>>    - 0001-Do-not-read-config-files-from-HOME.patch
>>    - 0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch
>>    - 0001-When-cross-installing-execute-package-scriptlets-wit.patch
>>    - 0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch
>>    - 0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch
>>    - 0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch
>>    - 0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch
>>    - 0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch
>>
>> * Remove backported patch 0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch
>>
>> * Add the following 2 patches:
>>    - 0001-tools-elfdeps.cc-Remove-format-module.patch
>>      There is no format until gcc 13.1, so remove the format module to make it
>>      work on hosts such as Ubuntu 22.04.
>>
>>    - 0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch
>>      Fixed:
>>      GPG check FAILED
>>
>> * Add scdoc-native to DEPENDS to fix do_configure error for both native and
>>    target:
>>    Could not find SCDOC using the following names: scdoc
>>
>>    Note, both target and native need scdoc-native, it is used for generating the
>>    manual, the man pages in *man/* are scdoc sources
>>
>> * Add /etc/rpm to nativesdk-rpm to fix:
>>    ERROR: nativesdk-rpm-1_6.0.1-r0 do_package: QA Issue: nativesdk-rpm:
>>    Files/directories were installed but not shipped in any package:
>>    /etc
>>    /etc/rpm
>>
>> * Test info:
>>    PACKAGE_CLASSES = "package_rpm"
>>    $ bitbake core-image-sato world
>>    $ bitbake core-image-sato -cpopulate_sdk
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
> 
> Hi Robert,
> 
> Thanks for your patch.
> 
> Some tests are failing after this upgrade, you can see them with
> "bitbake core-image-full-cmdline:do_testimage":
> 
> AssertionError: 1 != 0 : dnf --repofrompath=oe-testimage-repo-qemux86_64,http://192.168.7.1:41395/qemux86_64 --repofrompath=oe-testimage-repo-noarch,http://192.168.7.1:41395/noarch --repofrompath=oe-testimage-repo-x86_64_x32,http://192.168.7.1:41395/x86_64_x32 --nogpgcheck install --installroot=/home/root/chroot/test -v -y --rpmverbosity=debug busybox
> ...
> %post(busybox-1.37.0-r0.x86_64_x32): execv(/bin/sh) pid 624
> error: failed to exec scriptlet interpreter /bin/sh: No such file or directory
> %post(busybox-1.37.0-r0.x86_64_x32): waitpid(624) rc 624 status 7f00
> warning: %post(busybox-1.37.0-r0.x86_64_x32) scriptlet failed, exit status 127
> 
> Error in POSTIN scriptlet in rpm package busybox
>    Installing       : libc6-2.42+git0+453e6b8dba-r1.x86_64_x32               3/4

I found the root cause, it is because busybox and libc6 depends on each other,
busybox' elf files depends on libc6, and libc6's postin depends on busybox'
/bin/sh, the do_rootfs works well is because dnf-native has set
RPM_NO_CHROOT_FOR_SCRIPTS=1, but it would be failed for a fresh rootfs.

In rpm 4.20.1, it let the installed files' Requires win, so it installed busybox
firstly, but in rpm 6.0.1, it let the postin's Requires win since postin would
run immediately after the files are installed, this does make sense, so it
installed busybox (which provides /bin/sh required by libc6' postin) firstly,
then we got the errors. I couldn't find which commit made this change because
a lot of files and functions are refactored during 4.20.1 and 6.0.0 (not .1),
I also tried bisect, but failed because a lot of do_patch or
do_configure/do_compile failures for each build.

For libc6's the postin is:

#!/bin/sh
if [ x"$D" = "x" ]; then
     if [ -x /sbin/ldconfig ]; then /sbin/ldconfig ; fi
fi

This doesn't make sense for lib6 since there is no /bin/sh or ldconfig when
libc6 is not ready, so we can just remove libc6's postin to fix the problem.

I will send a V4 for it if no objections.

// Robert

> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/11/builds/3059
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/3107
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/16/builds/3127
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/3100
> 
> Can you have a look at these tests?
> 
> Thanks,
> Mathieu
> 


