Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE37C43458
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 17:57:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.859.1783792626756422236
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 10:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EHa7XBRk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=165255a33e=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BHv51L3513845;
	Sat, 11 Jul 2026 17:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=EBJ0l6HQM9LNQXXKUqhogUpyjHjpD1hywRccYZiGBBg=; b=
	EHa7XBRkfF1Cbkk6qXVqdUte/7sZtV8duAMh9fhP/TZ/n+3KnmzMuUEW6NnM82cV
	iFCrVrxzpyYEt8Ubnz7XHhZDctKu3PAaeYFV/nHNFn1FA0CVCpwJDFOZMLF9oHIS
	0Nwd2HESmwH8UwRqe94WRUBbhK/PUSVAwgYvB6I5RvMUivrneJD0OkV7gTFiv/tP
	1K8OLJ3Y3l+7bLrn9dnhEgE2HtT7YuSytvn9XtK/8NK2770Vly9b7dOQGcFXdhBH
	9eFL1EeikCqSAVzYLBUTt3CrCShNllcXgH9E0+9aELHD2VmosTXZyEea1a08skeJ
	jhAdZHBmgYUmRcMM4r+pSA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013010.outbound.protection.outlook.com [40.93.196.10])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fbct4gjpn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 11 Jul 2026 17:57:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n0KMsE3FIs2QZrbAaHHekvhIQcJm2+ZnRg5odxN3/lvrW8pL1k+A1shS08Qt6jP7NSVJ3ZjiMK31MSOpBh0d+T0V3n/aTa7XtHSGVA55q3/rwuiI65iEsrZipDXXgVRTyhslTATmp0rTMKwiXkrW12EobOj3kfd7dRj5fPj/lIiT2cFP44C36UjhBCWQxo0VE06iGPV3Jgq5UbisNHEdVV2uQ0I2/NaRkv68zCLT8E4V681WLu0IjAiQ8+ErdVW84Xwhq7UPjIJRjJlJFVafzbeY+a7sDT9C+ll2tGBU46OXXRNeKtRPyIOWAhntT6/hF81iBXz4PAGsuDLvnWlzSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBJ0l6HQM9LNQXXKUqhogUpyjHjpD1hywRccYZiGBBg=;
 b=VyEDxGR1S7odwlczK/lQqlobQtX58WgLYaI/zvAka2Qs5oEnEfstEzJtKYKQiHQBonv5SFClGQfQrN2l5/wWhhZa0OQrvG8jW4OwfFjzQB5x3EYCIucYJg//qoSt9lYa9i0o2ebVoPExPv9uruKTN0sfuQ23Pgk3APfzq/ovfN8SYy1P06vunGLBL4mGCy1hNIPt70q647v3oPq3Na4Djns6a/Bm5xsLDREf4FNFCqv8dBt7HVK8hDlD7dnSWQvY+QHuV252sjv+yCTjwFGztq0j7H5v1oHV6ue3CykfzlOpMyv2wPrFktrrVFjwiinTGepohrgLTTg3svLmbgv9+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PHXPR11MB9688.namprd11.prod.outlook.com (2603:10b6:510:3ca::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Sat, 11 Jul
 2026 17:57:03 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0181.019; Sat, 11 Jul 2026
 17:57:02 +0000
Message-ID: <3a7e0892-9656-48f0-ae64-ee9ee047b6e1@windriver.com>
Date: Sat, 11 Jul 2026 23:26:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/3] RFC: Fixing rust segfault (#16058) to support
 Ubuntu 26.04 on Scarthgap
To: Yoann Congal <yoann.congal@smile.fr>,
        Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, ccasciato@21sw.us,
        paul@pbarker.dev, randy.macleod@windriver.com, ross.burton@arm.com,
        sundeep.kokkonda@windriver.com, Alexander Kanavin <alex@linutronix.de>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20260626-ycongal-scarthgap-rust-segfault-v1-0-97df64b7b298@smile.fr>
 <CANNYZj81E4G9gSBPHNNsxg4JiJ_wEnmCoSkNdQ2bzJBjF5q=DA@mail.gmail.com>
 <DJJ33TR36YJC.24WW5E1PX60Z2@smile.fr> <DJJV9FGWRHJB.26TA7NN2T8LVS@smile.fr>
 <CANNYZj8nhGqmvy0tTnUHCNtnjkjweE-OwqL3gDL0mOYGgQO8OQ@mail.gmail.com>
 <DJO58J8D7X5G.2FRK2OBFYWIDO@smile.fr>
Content-Language: en-US
From: Sunil Kumar Dora <sunilkumar.dora@windriver.com>
In-Reply-To: <DJO58J8D7X5G.2FRK2OBFYWIDO@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0247.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::16) To IA0PR11MB7910.namprd11.prod.outlook.com
 (2603:10b6:208:40d::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|PHXPR11MB9688:EE_
X-MS-Office365-Filtering-Correlation-Id: d01ef46a-cc34-4491-7fdd-08dedf75cf24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|10070799003|366016|376014|6133799003|4143699003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	BJ1sWV9PEOH9YrBMv3wwBFMXtLVk6RtLy8o3b2ZbElYe+9NgMD0Y6aHTBXpm/XOAI5BY9EBWVRbNKZ/SbY57R0eh/ZFb5lVKPT8+tZiEDB+P0+ZCNGknP8lDMcxZMdzpjy9OEOoPhj7Fukcifj/77o9j6Gb/d6MgQHusXXfpcf/tOX9sLfI6vYnd4lhE3nLp705iKPsrwgsDgWODal2/6ie1rBWmkXZPqRSfH5IM3xk51i64oNS7oTbAKlvcuhjMeRzVsv6ed8J2dktQDCBqR6uKJlr3mtNuB0yW8Q1F32bgknjebKDimY4lhEIcbnqI9qLDXT1Yrsc3CLAk0M4iJIGCh97NA2dLIkhGOCuKF2I+YXuWhbweB6DCOdHNiFLo0lQS2/UxBrjgGKrE0FrnmcoZiJLAEv7LRdp1RKrVgoUwkOQmZLrbiccYETeIcGxjdHHX86Gb73ZcD9zeo6mDzkZRrVDOuNknCqHLW5iOR9rVIDHaWNiLwrtm+QwvTGiJtHas+Xk4x6zAkfyK/hY6ElzHJlNi3VaC1Syq3arX15dS6pvFo9LjZr3OUU3gkYb6FZy4qNXBICINo9LpQ0gpmxd4ixQ/jlWxU9xIcx96pdvSPxHA+bYAeIL6x5mIKO/1
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(10070799003)(366016)(376014)(6133799003)(4143699003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eSt2WjMvR2NsTTliSzJocU5RdExHSGJ4Mk1hZGY2RUFwY0d2WnNETUVYZ3hp?=
 =?utf-8?B?YnBMZE5PNUJYZVZXUlZ1NE1sckVBamVWeXRlL2xwdG9CNTFIOGdLR1hSZDVj?=
 =?utf-8?B?czFleUlKQVhKRW9Db2RlRzljQ3FkanllZGpwZldDTVRPa2xEdHRMRVlyK0dQ?=
 =?utf-8?B?bGxKMFZBT3RRSWJ6S3NuL2E0cVZSMFh3RTdYdWFVNjlLYXZLakJQZWZFaHZN?=
 =?utf-8?B?NVBqMkhqOVJUa2lJNStGeDJsODlMSlZmYlRUeHF5TG1UeDlBUnJ6U1huQ2gy?=
 =?utf-8?B?QnRpSnJwWEFEdWlvS0puRExhZXVOajhKSWZ2QWtQaFhNRXFoMURLc2ZvRGtI?=
 =?utf-8?B?VmJwK1A3V2JDNFF3L3ROTndnZlByZ0g5Y0owNzVIdjR5TmtmRUlXbFZQbHRP?=
 =?utf-8?B?ditGQjI5V3VYRjBrZ01hQW9yYXJlZjc5ZkdieCtvb01ZMEJ0Z0JNcWQ5N284?=
 =?utf-8?B?RnI3TXJnRE0wajBHTjMwWk1Na002ZmZVcGNqZTM4TklFdTVqTSswYkpQRnhi?=
 =?utf-8?B?dURMMElBWkprNENvcHdUSXZYR01ON1BraU10UnYxQlprZTJ1MUpldEp1Z0Nu?=
 =?utf-8?B?cTBZSjBEbnZUNHVHTlJSZGlSSjdna2xlQUxzNm5seXhIQzJ6KzVZMkcxK21M?=
 =?utf-8?B?cUFtWnJST0N1Ni9tdDJQaEdESllOMFc0N3grQlJObjVaYjdOenFtUy8yWGxn?=
 =?utf-8?B?RTNRemM5TVRHU2tmaHRURmZqR2syWXhHREVxc2Y3VE5JY0Jra09wL1NETmpo?=
 =?utf-8?B?Y1R1QTQyQk5GLzFIMm9PaHR0V0F4RlZiait1RUQveUFmOStveWd5TVFIZWh3?=
 =?utf-8?B?bWdLazZ3UTgrYkFSQVViUllHME53TGtialpFWnpHQ0E0QzdIeTBYVFRWVkdE?=
 =?utf-8?B?ejU4YUpFWndmQnhiVGRVSXlDeGcvMW9nS3FyeFh2c0hLcTZCTWZYck8waGV4?=
 =?utf-8?B?U0xZZVI1dGRlU3NqK1NOMlJTdlR2TDRET2JYbi8xWEhxZGlEUGRWcWdOOTlu?=
 =?utf-8?B?bHNid204SWFKaTJTaEVONmN1MkVrK3B1SFlHREVsUktRRVFyOVZoWEk0SFFN?=
 =?utf-8?B?M3RSSjlyM3p3a3BkTXFpWUlNY0xDd3ByTVRyVzIxNVBmZHBxWmNaZGdUT0l3?=
 =?utf-8?B?dVZtVDRoUDNxY1dvajJldXcrczNPRXpWWWo3Z0lkTDhTcVNFendpZjU5RCtH?=
 =?utf-8?B?OVhodUN3VU9OUGZQbjBzVnRFdnhBZTREVm5qczBaZ2hzRDc5OWFRajZEQlQx?=
 =?utf-8?B?K0Q3NTlkcmhSNFZabGYwVUY1MFd6MVNJNGl4UTVTMlBtUU9JcndUUnpOSGp0?=
 =?utf-8?B?cEphQXIzUDIrcWc3MWVSWGoySHVvcDFBQ0x0eTNEdWo0RER2cU42WklrUjV0?=
 =?utf-8?B?OFFPeWJlSEpqeWFWUGhwbkQrV24vb3NFZVVyNkU1YUJ3ZlpUVW1Xd3IxL3RK?=
 =?utf-8?B?bkdiYSs2USsrWldQOVFJVER0VndBMlplckFVMDhDQ0xHcURBUGdiSEhJVENr?=
 =?utf-8?B?bVI4WnhjOW5va1FiVGcyYk1xN0tRSlRqcEROaVplVTB3aGVxOGFjaFlreXVF?=
 =?utf-8?B?WG42Rno5a2Z0YXhaZUxJUzlDajdMVGNTMm5CZ2tYeGRqYlBJaE9mZ0FBZUNn?=
 =?utf-8?B?elh1YTF3eERVUWZ1WVNNbEIvVHoraktPbVlxOXJvV3A0WHZweDZWWGV4TzRl?=
 =?utf-8?B?OXdlZ1RRU2NYQ2xSNVdKUEdKQjF0Zy9VUVJoWi9FZ20xN29wTmtzWVBjUG1r?=
 =?utf-8?B?VHF2UUU4cWlmZlJJcy9BSTN3WHZ4WFZpV29RN1Z3bFJlQ0lGbVIxMkc4U1NN?=
 =?utf-8?B?SjZwWGdhelV0Nm51eWVYRW9CNklNRVZpVTZESDFPWG5CRGxpdkZkNE9oMGFI?=
 =?utf-8?B?M1N3NzNJeUZtM3IvRXUzWEhqbWdBRVpKTnZvalpCRGllWDc5NTFrLzdnbERP?=
 =?utf-8?B?YVNqU1BFWHZxVms5dG9YWVhld3VUVmxzWmIvSjVVNVVmVjZENXlqellTN3o3?=
 =?utf-8?B?a3R2R0lzSXhwYXpvMFU0QWNFTDlvMEZzKzRmSG83YS9xZzhLdm90ZGc5OEtm?=
 =?utf-8?B?TzdDU1NYaDk3OFJveFBndFFmRXMvS0N0THVPVHJ1dDVmeDZydlc0b3pMTWxW?=
 =?utf-8?B?TktzbzNoZzNSQ0Q1bHYyVkkzSG03Mm9hVDJzeG5FUW5EdFNxTU1Da25adVFL?=
 =?utf-8?B?cThTOENCYkQ5aGhIYW4rV0k3N1N5ZXMrOEV2TFZSNks3S25iTEhiOUhFMGl2?=
 =?utf-8?B?NGIwOHd6amU2UDVCbHdQYzlKWU9MdnFTMUxHdmN2ZDVKZS9KQUJaK3VwODFC?=
 =?utf-8?B?Nm94NEpPZnIvU0d3T0hZOTNVd2Q2OThrZS8wbnhEUGk0dkpPcDV3Vk9ib1Ev?=
 =?utf-8?Q?Iv2ShK8XH0qnzoONGcQ0Qxxa8K4c/YWxpWjyr3eQ4Bl6I?=
X-MS-Exchange-AntiSpam-MessageData-1: OsO0hnwB0i6XSoDAZNnqZAZMHYe78I/ONyE=
X-Exchange-RoutingPolicyChecked: 
	qWKaThkjGI9W/aW0bT/d6HLwsMGS/Dr0haedHHG2CgpQbTheq10ARacXUZwZmH9CKVjzRBmshCjjebADu5YhBXYysfKKqIg+yiDqHKUZNNfStvRrTEeD0Gh3HgOdcOB8ibw5RSmLHYYvGqmR5mfLpXckCjCjJstajeakECadKgkiIO58CiNghvc9ytUcb2EPUj7yWEi/6HflOQIO1yHOGTndFxNFUcm+9KpLGRc2IFdZrilYiflibspSyLFNKi3B6Lrm30zTyVaZNMKYzgWPJkhKTVcVuAA+lRv6buCdUfG2vhOSXSfxErWmH+mG2LDpQLUPRCLR8Mc912mXeiZZ+w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d01ef46a-cc34-4491-7fdd-08dedf75cf24
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7910.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2026 17:57:02.5158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ziOdNlVWR/Y0+xrUV5BvKaOjusX3ec1n+Xi1IMQo27i8BYj41VCoqY9I3qhTh+XyuyNfH70LBhZy2QZM9YBpz7g5s4+A9NgpSusNYQkzn4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PHXPR11MB9688
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=J9CaKgnS c=1 sm=1 tr=0 ts=6a5283f1 cx=c_pps
 a=GLOgxCHNDJEaGAThK2D1wA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=iGHA9ds3AAAA:8 a=nnKF3bN5cx75fS-ADx4A:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDE4MCBTYWx0ZWRfXz18e6lRIG0ge
 Qt7xMiUZXrJwtDQ4+lqx1chVbCrR9StkI/RK3mJGz9CGwozIhld00Et9Lrf0tpn6lex5pGL6GAH
 HBuV188wiz3eDtjSHaZUFDsm+Dv+bUIO4lgG4Oh4SsNfF5RC++Cm
X-Proofpoint-ORIG-GUID: 4PN26GgK_aRVo35jGq1kP9OT2tynlZUM
X-Proofpoint-GUID: FORdiv8So4yHVunnVU_754vsmBGFi_TA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDE4MCBTYWx0ZWRfX2TzHF+0vA0zh
 5rSpnztP4Clfv23AuDkEwO+NxO+f8hezOCkYzkjGS9br02/PVPGpLgk/aIfHUF0cfzC/y+8zIKD
 +ByaILbZAG8LwdZaI+Q1c5GLLAh4BCHVK3HK7e3yWnf4l6UmVIUa+6HzPq5wUW3hN5X0LYcVmy1
 dX8Ib+0UIA6PL8tFgY6pUeCG7G51LmPvHqWuXtclNq9+6VnHg58+Bl/q2zOCHqssgeXR6Wooh9W
 rM6vmAclItK2CG1QWEhHJjV0xOeR++8DWf5JXNl8ZwvBA/oR4CkmMJX29v0SoYpDiF+148ylUZu
 R8CG/SjcmFybbKDyVfrOVZAYEfX2Dec/HXhhG3ruCjL7oZIWQxMXtpMa7xdJi8vDWhvEWwAMEUk
 VDlEM0J4CdrKvHLaNPwS4L7M/JyYqk1TQKstd2tysDsms3L4Nor0+Yjz16Vfx89Kk5TrM2l/cBh
 +y6eTwiwGCjYBGhTaIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 17:57:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240720


On 7/2/2026 7:39 PM, Yoann Congal wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Sat Jun 27, 2026 at 5:16 PM CEST, Alexander Kanavin wrote:
>> On Sat, 27 Jun 2026 at 15:29, Yoann Congal <yoann.congal@smile.fr> wrote:
>>> [...]
>>> I'll pull on that but suggestions welcome!
>> The log is misleading. The actual crash happens in a different, later
>> rustc, which does link to libllvm statically via librustc_driver:
>> [...]
>> Alex
> Thanks Alex, you were right!
>
>
> To anyone interested in using Ubuntu 26.04 to build scarthgap:
> I'm at the point where I need to stop investigating this and drop
> Ubuntu 26.04 for scarthgap until someone fixes this situation.
>
> Here is my analysis:
> On current scarthgap, rustc links statically to libLLVM (via
> librustc_driver). For unclear reasons, when libLLVM comes from recent
> distro and rustc is built on old distro, it ends in a segfault.
>
> To fix this, master changed to dynamically link to libLLVM but that is a
> major change that I'm not comfortable doing on a stable branch. So, in
> this RFC, I've tried limiting the change to -native/nativesdk-. That
> does not work because ultimately, target rust does a bootstrap where it
> builds a native rustc using target build options (in this case, static
> link to libLLVM) and reproduce the segfault.
>
> I thought about using the rust-native we built to bootstrap rust target
> but that looks way too intrusive for stable (and also, not trivial!).
>
> One workaround could be to hinder sstate sharing to prevent sharing
> accros host distros (opposite of what uninative does), but I don't know
> if we could get this idea to a mergeable state.
>
> Finally, support of recent host distros for stable is nice but only as
> long as the changes for it are not too intrusive and obey the stable
> policy. In this case, I could not not find a fix for this issue that
> works under the policy.


Hi Yoann,

The "unclear reasons" part is now clear. The root cause is a binutils 
linker bug, PR ld/32991.
The full analysis, a small reproducer that checks any ld in seconds, and 
the verification
on both master and scarthgap are available here:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=16058#c86

The related binutils upstream discussion is also linked there.

In short, no Rust changes are needed on scarthgap. The fix is on the 
linker side.
We need to ensure that every ld used to link Rust includes the PR32991 fix.

Would it be feasible to update the workers to use a newer buildtools 
tarball, and to ensure
that workers linking with their host ld also use a linker containing the 
PR32991 fix?

Thanks,
Sunil

>
> Regards,
> --
> Yoann Congal
> Smile ECS
>

