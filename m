Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF60EEB56A
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 09:10:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.43753.1726132228979107420
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Sep 2024 02:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9985178943=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48C2La5p027008
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 02:10:28 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gpbk5hs1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 02:10:28 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48C9ARl2005192;
	Thu, 12 Sep 2024 02:10:27 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gpbk5hs0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 02:10:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yuS5zzsZZU3jOhCjqLkij5DldDCAorUDO//cqBanWbIqXMBXHehIxlPFHRG17xDCRVSK1jG6dKdoM515xetd2ZS82cOXyZVLjmEgtBxMewS4i7lhn7osp7zTJJCDCjSV0dclerJwkin0cr2lIPGPueSKXeqtfs6KYbfPjbdsSJAfAZ9xHUIzTO5uUsL0r8g08u8g9kKys8bHTF/ll0s8z7Cv0BUlNXHfISL4QOCM8nW5WaToJEsb1KBZNQj4P1oruoI6pgbPXurFn3gMKJqsZrQA6eMyY3EmyVX7nbhMeKrBlA2BNevTcyiRvUQW1B+G34M3dMIi+trFxIRu+9JEKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gE90WQgJbf2lodzkEpK/gqnGl0ZxNFBO6X3lUSVVZJQ=;
 b=G3pQvuAjxFinfet5a7b7v//cu6EfwPgcCJ3NXpSjGZHDTiVHmlWHUs5gM+K94LmuhffPT2KfcZhLOU6Faax6ynoDTgi1rMrcUwEZFvNvGL+PeSHVoEmz+SxOnjqB7D3IsZIT1jWO6hVyINFYa4ReBdiMe3zz7xcE6uu5OQsN2gjATemcxbxpko5QfD5oO9fuaz1OLjfa3xPZ3fp3MuwtbUS5t0zM84ipLGGZfSHZhVEd6EFdBe+VeJB8GpBDYhQCE9j2DXLwd1fN6jVYx9S0Lfe6iOUxE8jKMF0NzVNL6i3hs7o1E2W/nHnki/tDDFAgE0Reh9yK5WNBdW+KI2TJUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by LV3PR11MB8484.namprd11.prod.outlook.com (2603:10b6:408:1b4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.22; Thu, 12 Sep
 2024 09:10:24 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%4]) with mapi id 15.20.7918.024; Thu, 12 Sep 2024
 09:10:23 +0000
Message-ID: <f4f9df7b-6830-40f7-a29e-43cd86fe6abf@windriver.com>
Date: Thu, 12 Sep 2024 17:10:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 2/2] lib/buildcfg: Add
 is_bitbake_in_separate_repo()
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
References: <cover.1726065189.git.liezhi.yang@windriver.com>
 <46758adea9ab24c5624eb1953ba8ca5143036e5e.1726065189.git.liezhi.yang@windriver.com>
 <DB5PR02MB1021387DDF9A7CA5E3FF95BF4EF642@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <DB5PR02MB1021387DDF9A7CA5E3FF95BF4EF642@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::20) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|LV3PR11MB8484:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e2cd320-4cac-4eec-d908-08dcd30abbb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UDFOYm9Ybk5mcjhIYURURmpEWkp0KzRtWEdFOEJ3OEs2cElVaFdMNkFDYmFQ?=
 =?utf-8?B?TFN3UVB4bTc3NWxObnRpbFY3S1RIY05yNnk3TzZQWHloRHFHd0FHaTVJd1Rw?=
 =?utf-8?B?TDN1UDhmaFpqMmwxbVZzWXZqdnoxeW9XVWIwcW1OU2ZtRW5tNFZXYTQ5YUFj?=
 =?utf-8?B?N044blNhOE50NnhOcU4wSFdXalBhc291aE5IQUdidmF1eFBHWHp6N1REbnBM?=
 =?utf-8?B?NCtwSmRldlRWNTVVa1o2c0JNOWswZDhQdnhQakptOU5XQjd6NGE0NFRTOEVQ?=
 =?utf-8?B?K1RHQk5lYlRWTFpsQUM3bXhLSmhhNlBrQ2Y0NU5JUkVLcnYwcFlVWTQ0YUdy?=
 =?utf-8?B?amV5VjRoTnI1MVJPRGpSYktCbFNqc3ljMlVuY3RoYUxZbk83eHl4WXp2YzRw?=
 =?utf-8?B?VmxHTEdlOWJ2eklTSlp1V0RxZStyTUROd2k4NkM4bVNzTStmR3lZemtEVjBa?=
 =?utf-8?B?ZDhMdzZzL0VId0JoTkNUR0tWSVBpWDA0M3M3eGRGSVArajBid2gyZHFmckNE?=
 =?utf-8?B?eHdsS2ZySHVOZEdTK0dVNWw5cFBTVzBQRlFqR0EyUWRPU01RWjlkeVhQR1g3?=
 =?utf-8?B?dktSVVAwc3hhMDQ1YisvWnN0aXhHYzJIRENjUW9rSHV6bzkxNzY2dXAzUnpD?=
 =?utf-8?B?SnpoWlNaME55akwzaGdGbjJ1ZDJ1anhyUitEUkpMV1l6SFNOTmlhWW82ZTFW?=
 =?utf-8?B?bm1YMldCbWhPR2YzQkZsd1JMeXJFaDZNc2NtOUhGTzBpeVdiKy9sb2ZwQlIw?=
 =?utf-8?B?RHEzeUY4clNHTXZwMEVwdXJkR280cmhKRWNIdzEvSU9mZzIrSG1lclNCMEdi?=
 =?utf-8?B?WTR3Y0hNTUJJblNnaGU4VUsyWjZlVy9rZUl0d0tzSUlTUzZmUmF6VStIdCsv?=
 =?utf-8?B?eGZlQStBWDl6RlcyVFRHOTBpNXc0Q1JnbkdCK1Rtc2ZObEUvaE44OGw4QnpS?=
 =?utf-8?B?RnVkZzM5UGlMU21BUWVOc0VwVDJSS2xqdlR6bVRZdnJzeFZNQlF0NHdMQjcy?=
 =?utf-8?B?Z283K2RQNE9qR2loZzlKRDVUTnQwVTllaFhGT2d1QUNVaXd2aVo1c2RxNHdK?=
 =?utf-8?B?dWtvQ0ExN2xPZHJHOWQwNXEvcFV0VnRsbXd0Ylp4djhnWWJ0eGI0VTFqYjZn?=
 =?utf-8?B?bjQwdjM5dkswMWROdndNUiswTVZBQW0zME5ZdzcwSXpVRUozRk9BTDlYVGxp?=
 =?utf-8?B?NkcyMkpGSFdyM1FkclBqVi9RTFJlMVNVeXduSlIzUHFacEw0dGU3eVhuTlhp?=
 =?utf-8?B?bTZQQlhZcnVrWGxKYnJaMHFpV2VvNWp3aUp1alJmdVJZMmc5ekZxRWpSTU80?=
 =?utf-8?B?dHYyTHkrNXJlcTc3djN6RGx0N2lZUTdDTk1VQ0xtMlBWWGZjcFI5YWZ1cm42?=
 =?utf-8?B?VWNCZHpzTWVLcm00d29CcERieklVRnBadjFYZDJ4UXptSTMrNDdaTnhpWDgy?=
 =?utf-8?B?TkZNNFpHcFdGS1NNK1R0VERuYnBFc05iMW51ajZyRGdhT1NFaFIrYTFiM1VY?=
 =?utf-8?B?ejVTajlyNGoxOEw4R0xwbFM3NGpGOFVkVGxaSUVFUXVJWnhsVTlrbDFFMzF6?=
 =?utf-8?B?N3VienU1K3d2Wk9GelJFV2oyRS9DeWVZcWdUN05ZM2tyS3RSTm1aKzlwaGd6?=
 =?utf-8?B?ZW14Q244d21WcFJYcGR0UXR2TUJML3JqUDBKRXV2eGZ2cng3MnoxSHhhUTdo?=
 =?utf-8?B?RGh6d3VqazNjRTJpMnFxUzhTblAxSEdFODhVdnJ4dy9vRUZDS2xzalFOVzg3?=
 =?utf-8?B?cy9xM2hWdkhTMCttYVVwRGYxSml1Qi9lVVBzNVU5NW5VRXRmbGtNYXg5Z29l?=
 =?utf-8?Q?sklln/6B3Re0fD5a3APM2eSxbc9KBEAN1zVFU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aFFmdUZiUEFEU2xoYTRwTkp5QXpudmFLSGlNYzkvaGN4MGcrT2VnMitDZWx4?=
 =?utf-8?B?YlhYT0ZFb0VZclpjSmxWclIwSnR0QjRYN2lielFETUEveFNGdXhMb0lXSlRH?=
 =?utf-8?B?SW5HN0ZjU3RqQW1BSzZCd0pDL1hJZVZCdXlDR2xwU09iMy9LTndhbkhLeS84?=
 =?utf-8?B?VHk3Q2pjL3NkcG1KT1oyR2NGT25PWGFCR1R0QXUrWkN4aEoydDdxMHl4NWZm?=
 =?utf-8?B?OGZVMzNDZEt1V0s3MEwzODlUT2hMZ2R5RWpOVkZvdGMyTXNTTWg2QUQwbEJx?=
 =?utf-8?B?Zy9PWHo5dlVsR043YWJvOHVLZ3Buc1FKY3hoWlp1YjBTMmxPNEJTSlpzNnc0?=
 =?utf-8?B?VEljdnUzUlFsaHJseXE0Y1B3dEZsQlQ0TklCVklEb2puc3g0ZGUyOGJFZmdv?=
 =?utf-8?B?VVAvazZRNkZxS0FwcnNpQkw2Zm5mbzlzRlQ1d0x2dE9vME1rMFMrZ1pWcmow?=
 =?utf-8?B?aFZwZGFWNUx0WUozeFRuYmN0cGt5SGxRWFYyV3lDZzVrUjQyQzdQOHZsTzd3?=
 =?utf-8?B?RmdNUWFpT2t3VlVLT0UrbkNWNzlPWkdDQ1IrNG41cGo1Z2xVWlYvc0dUZGNE?=
 =?utf-8?B?eEZoZ1VqUTdjNlpjZmZCSzFScHhxZEJPZnF2V0N2cXh0VFRYaHdZMTdQSU8v?=
 =?utf-8?B?RWoyTHZORUVYbndob2gwdUFvZ1VzMzJzTzdtSnRWcEV1anZCajNkMU4zbXV2?=
 =?utf-8?B?bzMzcjNjZXJsNGRmVHV5QVlMMTRCQUNXSWFMWFZ4ajVFZzVYc1d2c3ljblB5?=
 =?utf-8?B?WVhxV3N5NS8xRWk3VkJKWFlQSGFQYnN3NXdBdDJEZ1N1VEx4YjBXQkZhTW1l?=
 =?utf-8?B?dFM3b2pIaEZLTUUwOEhWMGZPNGhXcGdLeDVGVVRBbUluam01V1c4RENzS0d1?=
 =?utf-8?B?ZVpIbnpzK1ZGRGdSM3RNSGdoYXlobENnaHdVenZmbENOeHloU3cyQ2dWMVps?=
 =?utf-8?B?RG4zRGxtVkxhWnM4K3A3L1RJaFgvZmdkWFM4SFkyaTVWYWVYRUtiZU9PaWdL?=
 =?utf-8?B?dThFYTh2dHUwNUZYS2pEVXg0ZExwOXcvVjJyb1R6OHYzUTBKa2VwWnMwNkNS?=
 =?utf-8?B?Zi82cUJ4Ti9XM056L1ROM3V1TGUxTkZJOFJObXViUkJuM21HMEw0bjJtdWtM?=
 =?utf-8?B?SzB0SFR4clZ2Tit6R1ZKZCtkRm5Sb2ZoZ3I3dUExa2hjUEVNYTNUUnF4NzBE?=
 =?utf-8?B?Mm5vM0RZUmp0U1czNUhpVW1TYmtTaFg2S2NKdG5jcHE1czJ3SkFqOTYwckww?=
 =?utf-8?B?MUNyMGxVK0o3WlFnYzhhOElDSjNmWFltZVdrb3pDOGlwRnJNcmdZUnBTdDd6?=
 =?utf-8?B?MXBxZTNxRkgycjFzbTBOYzRaMVB2REVQN0YrZHQwVEo2cENUbDJMWUQ4SzBE?=
 =?utf-8?B?MmJSWlRzcU5FdFNQcDFmNUtEOHB0eUt0eFFhZXFCTmMwVElYNnE0ejhkdFlH?=
 =?utf-8?B?aUVXNzdmaTZYMWorUnkxaGpmNThIcWpERjRJTlNkN0V2c2QzUVJaSWRzL3ha?=
 =?utf-8?B?NTJLc2RmRHVnZWtQQTAyTkRWRjBhRGdJVThRS2FJWnA5QklwdDBJSFAxY2sz?=
 =?utf-8?B?RzNNR2pwVENiMjBZb1Z5TmdZVHlZd2dTTUFBdmJEa2RqbC9xdWRvN0FoQmdD?=
 =?utf-8?B?Ry82MU53cDZqbWZQTndqMVdTVEgyWjgwRVNxS09FR09oMlZnZEZMaDRuTG5w?=
 =?utf-8?B?ZXlzRW5RR2VWejE2MTJVQW1RUVZHYXZYWFdkTGxmNzhjMzY0Z3E0aXRhNzJ2?=
 =?utf-8?B?eTVVSXdBZXJIWGtUa1BCWFhhU1YxT2psZlVwek55TzJwbzZ3YXlUamdCdUR3?=
 =?utf-8?B?U3RzTTY5RVNjUWYwcjhYTCs3QTg3VGFxbXI3ZjhpcVBNWlRxV3NLT0F0QTBZ?=
 =?utf-8?B?T2Jid1c2VkEvdHlIZmZIckRGeUs1RFBCOEY4N0xBM2hSUWk5VWYzNVVvVXVW?=
 =?utf-8?B?eXlZM2FzaU5kbjRwVGpDT2tlL0U0MzlhVDFEZkxXVnhwVEtneC85SEJpbW1r?=
 =?utf-8?B?eUJhOXQ5TFR3am84L1RYeWpnK3ZYcU5OVlRYbENsUGI3eng2ZTRmQkxtSXYw?=
 =?utf-8?B?WnBGNEhJWUdYZndTQW5MWTFGRVlackExSDI1Rmw4Z0d2K21xY0pSSWR1Rktj?=
 =?utf-8?B?eHpHdVVhY0h1ZkVrck9CWmhtMHVhRmlwRFdLL25VOTM5M2tOY3k3ei9BU2Z0?=
 =?utf-8?B?YUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e2cd320-4cac-4eec-d908-08dcd30abbb8
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 09:10:23.5225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tj18RBDkf1xh1xyWjrDyArO9EY6IvtK+J2KdhABGwCBBpqQJXn1OUi5RjiPCEHMVAKpkGV3zfwrQha8M3TAuYWP+YSRkSlPsT+UP2ThAuFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8484
X-Proofpoint-GUID: 9D_9oSnE0gZCwF3Wf4vtg1OC3GONIbpI
X-Authority-Analysis: v=2.4 cv=Ye3v5BRf c=1 sm=1 tr=0 ts=66e2b004 cx=c_pps a=/1KN1z/xraQh0Fnb7pnMZA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=T126U-Se5irkshTrUigA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: XY_E7-aQHimrNz1blxqQBcxzih0zh9Xe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-12_01,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 spamscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 malwarescore=0
 mlxscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409120064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 09:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204427



On 9/12/24 13:13, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Robert Yang via lists.openembedded.org
>> Sent: den 11 september 2024 16:36
>> To: openembedded-core@lists.openembedded.org
>> Cc: alex.kanavin@gmail.com
>> Subject: [OE-core] [PATCH v3 2/2] lib/buildcfg: Add is_bitbake_in_separate_repo()
>>
>> From: Robert Yang <liezhi.yang@windriver.com>
>>
>> This would help various tooling that is being developed for setting up layers
>> and builds, or creating configurations for those tasks out of pre-existing
>> yocto setups.
>>
>> Suggested-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/lib/oe/buildcfg.py | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/meta/lib/oe/buildcfg.py b/meta/lib/oe/buildcfg.py
>> index dab4aa7831..9256b327ed 100644
>> --- a/meta/lib/oe/buildcfg.py
>> +++ b/meta/lib/oe/buildcfg.py
>> @@ -71,6 +71,16 @@ def is_layer_modified(path):
>>           # output and a 129 return code when a layer isn't a git repo at all.
>>           return " -- modified"
>>
>> +def is_bitbake_in_separate_repo(bitbake_dir):
>> +    """
>> +    Check whether bitbake is in a separate git repo
>> +    """
>> +    bitbake_git_dir = os.path.join(bitbake_dir, '.git')
>> +    if os.path.exists(bitbake_git_dir):
>> +        return True
>> +    else:
>> +        return False
> 
> That if-statement can be simplified to:
> 
>      return os.path.exists(bitbake_git_dir)

Thanks, updated in the pull request:

   https://github.com/robertlinux/yocto rbt/bbrev
   https://github.com/robertlinux/yocto/tree/rbt/bbrev

// Robert

> 
>> +
>>   def get_branch_rev3(revisions):
>>       # Return 3 items for each revision
>>       return ["%-20s = \"%s:%s\"" % (r[1], r[2], r[3]) for r in revisions]
>> --
>> 2.44.1
> 
> //Peter
> 

