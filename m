Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF85D5CC81
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 09:08:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18301.1765876082577687424
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 01:08:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rrviYqLh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=44450448cf=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG3tu503261186
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 01:08:02 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=fqGcpVEDON3uj+id7qXAW3ZuiH6Ku1CO0rKy0YeTI5Q=; b=rrviYqLhqtgE
	lokxhIkoDHYldLWc1KhkDcC60RxarsGA+b6zPilpJvUilE5ClNk9LXNhrdJZB1qD
	31PJTkldTmM/wYNY7YFZBr2UdavqaEFIWFCPIQS4+SMkUyLKhFYSJsIiCYlUqPVC
	liCx5mCnBBToklrn/+ShHTUwZJbXY37szWvZPhBjhVmcRxZaL2RaEOF3s+XuoLg8
	dlqLJ+/l/1O4ZOruUi0TSp1i26B9ieaoXZIpK1UsdnN2NBOPoqPJu1pHbcDpGGi8
	txRfysZwNDde+478wcRgR02dcEJBwECwC5L4e77dbswcUxua9DlBulm3goJ13cMi
	ibcVeRRAIg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011036.outbound.protection.outlook.com [40.107.208.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b14a5jrgr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 01:08:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lvd5U/jrOHWnQrdPKFgAb7LoWhsOgfw+p7hlFs0QsqRPVW4Fag5USrQPS2SlLxEMWziL1KSRGMhddMurdU5uWt7rThEmeLxH0mAC/bQuXyo+g5QwzCOIIzaoY8w4HHg0EaWWseSfjzjL1VWQOGoZPhFzS5uVb7XfqoR1iwTkUxMjI17eXVLMo4wkwoO0aiRkSEWhmVOuxoke3Z+BzHm/93/aUsQVtshlb2ubkbAD4pTsBL/T5c3Dgyun0Le7Sp05JGLcaKT+gzDh+yZJLd7GRbvg8dSac48HPfPYFdAuEZQsfudqna0eLrYTbdBbnqGzbxzaDpppZygEGzkgYCQxQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqGcpVEDON3uj+id7qXAW3ZuiH6Ku1CO0rKy0YeTI5Q=;
 b=puxloaZN81URazLVVitB3h28+ghwXa4QBKJQ46QjvIJONCHVC1B3MncwaMR08QcZEMCTK9kEHcAtdhbNP7hA/gtEqPGtl74gSErMMiQjnsuw5x3CXQypYOd1kHR43uZqG9iTuz7MAuszkgKZ7ers9MfX4Tmx/BvG5a8AL/cK8Ki3oJnGBOXtk39tDSuCCEalINn/pjSpcD8X7fqtwbleArC+e/6QUluudJLfHl8bMszrnc8zQvJQC5Ln5dT+NGsEIPtf86rH8BlcToQcDodFianiC7Guj2FuKDNnyTVLlunp9H3jKHxd2p4sA6FT7nt0fP/jfHwcMoAX8fBAmXcgig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by DS7PR11MB7808.namprd11.prod.outlook.com (2603:10b6:8:ee::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6; Tue, 16 Dec 2025 09:07:59 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45%3]) with mapi id 15.20.9412.005; Tue, 16 Dec 2025
 09:07:58 +0000
Message-ID: <bfb869f6-04d5-425b-b1fb-fcf95a1e173d@windriver.com>
Date: Tue, 16 Dec 2025 17:07:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v5 3/5] debug_build.inc: override
 INHIBIT_SYSROOT_STRIP for cross and native
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        hongxu.jia@eng.windriver.com, peter.kjellerstedt@axis.com,
        randy.macleod@windriver.com, raj.khem@gmail.com,
        openembedded-core@lists.openembedded.org,
        mathieu.dubois-briand@bootlin.com
References: <20251010075258.2161972-1-hongxu.jia@windriver.com>
 <20251010075258.2161972-3-hongxu.jia@windriver.com>
 <101da462a2254d31ad69f142189641958872a892.camel@linuxfoundation.org>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <101da462a2254d31ad69f142189641958872a892.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::18) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|DS7PR11MB7808:EE_
X-MS-Office365-Filtering-Correlation-Id: babb6eb6-cf21-4c81-886b-08de3c829b18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eld2NTkzaWhET0xuU05KSmFDbXNpaE01eGMwOVN3UVJvUmt2cmdzQUc3L3BL?=
 =?utf-8?B?KzVDbTVrQzBmekdkWE5ld0JZNzdjRVRqRGFhTVA2b1ZaVWZvanBSbExnOGFh?=
 =?utf-8?B?RkkrVFNDU1g1Q3ZrVEZEYlNNa2FWN3k2bWJ3RzFSUVR5UVViWExDbEdzVTlZ?=
 =?utf-8?B?cU9BcnZvZzVrbkNEblMvUXNPZE4xZkVEYTg1V3JqQWEvZHUraFpYVmhTNkNz?=
 =?utf-8?B?elZoV3pTTkVRWTdyb3Zyb0tFRFNiSUxWcmRTUXpLd3N0SHlFYjJNRHl5VXR0?=
 =?utf-8?B?UFJ2NU11S0tqTFF5T2UxNFkxMEUzQUYzVzVhV0QvOFhSekM0cXFQYzVTNFh4?=
 =?utf-8?B?QTBBUjM1UW1ORHRwUy9aQ2tONTNmSEtZYVkwQWdTeitCYlNYN1Q0dVJxMGg5?=
 =?utf-8?B?Ykt3WFZXdU8vL0FVZmdiTVdpaC9ZMjVYcWpVMklGZ3dReExuLzJqS25pNy95?=
 =?utf-8?B?M3BKNURoMUZUV2JYVERIcUNVSVoyWkNyREhTOHRoMnM0L3Y4VEdCaVNXWmFM?=
 =?utf-8?B?UW9EQ1NWU21EUEdUdU5PblVKQ0pPQm5TOVM4dDRtL0pFd2tSVlFiMFR1eE1v?=
 =?utf-8?B?R2JyZ1BzZGlKY01FOXV5bFdGc2tYTHlrcTcyV2MvcDJCdnRFcUxzYitOcHlL?=
 =?utf-8?B?N3NlL0xHbFlMU2h5L0xnejFEd1EwNHB3eTlPMjZHVWJocVk3TGhVdUZ6eUxz?=
 =?utf-8?B?U1orei8yTWt4UWkwUWJaeDJIVWJEV2hUVzExWjh0WnRvVVhmOFl3Z3B4ODVn?=
 =?utf-8?B?WkFYRDRKWW5oaXZrZmxKYXV6cGlqMnUwZENuTyswY0txWkx4eTExOTQ0dkEx?=
 =?utf-8?B?U2xVVmF4Umo4Q1VUbGJDU2RiaUUyU1h1UW9MK1R4NnBqVEV0cGlwQkZrSTR2?=
 =?utf-8?B?WTExS0pnRDF0RmlHVVVzcGJxekFUS1ZmSm5COURIeEZaTEdiV2dZc3krc3ZD?=
 =?utf-8?B?Q21LSFdVaUNHYmI5TllIRzd3VUs1UkhmVVk1QklHbmU3dmdJWlUxeE9nKzd6?=
 =?utf-8?B?ZjJWWHdDU2Z4cDVrYkExQzYxTUtPWGlCUUs3RjBxS2dIQi9DNG1saDdkbTNI?=
 =?utf-8?B?eWFEV2gyay8wZHFFcjFSWDVNVFV4TlFEYTBoQlRDdHg3UzJXYWphTDJla1ZO?=
 =?utf-8?B?ekQ1elhRU0VNZnExYmhZQ1dkMHJvcGhBYzBybzJKemtETHpjdTJKdGZaZzM2?=
 =?utf-8?B?dUVvVktCbmdQamQwZ1hGTlVaTmNxQk9VMW5OQW9IWThVTHZQSDA2cDFPNW1u?=
 =?utf-8?B?ajRzcHdYTE9yWHMraFp3WWZKSnA1aGhWcEJ2OHU4bTRmVEcvQmxONHRzL2xP?=
 =?utf-8?B?ckxWeC94TlJvNmhlL05nck1sR2lFOC9leHJqSG5LYzArWlo5SDRGS0s3d05o?=
 =?utf-8?B?R2ZpNkNYMzNYL1Z3Vm5UR3JrNzFzTkNRZHBraHkyNktwL0wxb3BMUXU5Tkdi?=
 =?utf-8?B?T0psazZXVTFTOXRTUnl0dDFqa29nK2ZCa1NVNER0a0lVdUxtR1k4c0dCc3Vl?=
 =?utf-8?B?bU9JakV5TXRSTDVlQmczT00xM0hKMFNHMmRCR2cwUUkwaUtOVGROVUI2c2l2?=
 =?utf-8?B?OElidFBXeDZNemppYm9UV2NOM2xCUUhJandTYmIydzZUMXZWeGd1YkVDMVlU?=
 =?utf-8?B?WWNkbk1OeUt0NzNXQlMwQ3JLZVlrelpzcUd3R3pqWllsL1JLV1ZIZDZERERD?=
 =?utf-8?B?Ujg3YVBYUm5PQlpXUmRMVUticHplT0tZNDZ5VlpOL3N4ZU9uNXYrbUJPK2FS?=
 =?utf-8?B?RHZtaTRRV3pnZE1pUTVPL25PM2k5a0NteFB5M2xzOWZ5cFFyVmhkU0NndXQ1?=
 =?utf-8?B?bFZKdjlKOE93MHc3K2I0T2ZVYmJRNjFKQm9JbHhGQUFRT0tWMWg1ckpsRStt?=
 =?utf-8?B?QytyMVF3STdXd1VCSHBWTTF4MHVQVFZ6Nkl0V2FadGhrQjFBQjV1TVNpaDds?=
 =?utf-8?Q?6uvtRFFIibKDz4A84tDpRuNAhn/pvlHf?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?elRGNkJlTWkva3AxMUlZc3NQUGhxd1Axc3JYcmRXR2t3d282NUJvTm10SGt1?=
 =?utf-8?B?azU4em13NU95TzRzTllYRGFLeDVweXpHWlpwcElyQVhYQ0RUaWRPVHVITkU1?=
 =?utf-8?B?MEdqekZ6NzljbW1HbG9NZ0ZUYWdadzg1d083ZFA4ZzliRVYvUDhRbGVwYjJD?=
 =?utf-8?B?WmI0MVEzOS9abnZpSFpySFVHZVhFOFQvNlFFUUdJNGJub2thQldlMTdCSzha?=
 =?utf-8?B?SXo2Q2RSd01zSmE4NWEyTnMrQzZ6ZjI0MzE0c1FRY2ZGNG1DMk12RG82QU41?=
 =?utf-8?B?ODdCSFF2MTRjY3ZqS1U5WE5VOEU4WDByaUZzcU1hSURVL1BXcnN5c0ZRYTZG?=
 =?utf-8?B?cmd0SGwwaGNkOEFjR2U1V0V5WlMzTkoxY2VPTGFsd2EvMWcyd2xwNjdiQ1B1?=
 =?utf-8?B?a0lURE91QXF1STlnZTdHYmRTNHNZN0x3WDArK1BlWFhMM3NHOU1JNFpmckR4?=
 =?utf-8?B?RndybFlmTTFzVFk5TnBiNFQxNzYxZnhxaUtCRmxhVFdnandpclJncDFVL1FZ?=
 =?utf-8?B?bEpXT2NJT2FmalVSdGljWkc4V0J4RmlRNENJSWEydFBpVjRMWUFiMmpIUUlY?=
 =?utf-8?B?ZmtaNmFOa1M0QVVBbk1xZnU0eVlKb1MvS091aHhXM1phaVN0aHBiUjRIMitN?=
 =?utf-8?B?ZUlPZVhrN0Fvc3lxTklZQmdzV3BBYldsbVZYZ2M1a3p2cFQ3dVRzMk9XQy9o?=
 =?utf-8?B?TDQ0VzJyYXRTSUJITmlhTXlySjBiNVFGS2g5U1NuSFhyYi9STFhldGlRTlIy?=
 =?utf-8?B?WGwrdWRlRVRTVkJTeU9INzMxRFNOWGJyUjY1dWpCRFZpL1pDOUFhSkRQL1hG?=
 =?utf-8?B?Nkxab1RXY3pwc0c4SUVUbXZHeFhYMWlaWEVFSmw0bU5KZzFwTTk3K1FFa09j?=
 =?utf-8?B?bC9IQ2l0KzFxQktKRzNZY1g2TFFZVzYrSG02cjVNWTVXMzJPczVuVmxONSt4?=
 =?utf-8?B?b0xSdXliMjNCbXA3Q2h5VjZYWmlyWGxJckxWR29sdy8xZi9semM5eUo5a0J3?=
 =?utf-8?B?T0dyOTVXTTBTVjgxNVNLUWVpTzJUbWR2WHBjQ3YrbkZYbk5wSTI3ckwxTVFj?=
 =?utf-8?B?OFlhVlp4QVFDbVZiNy9vakMzNkR5ZmJEMXRkNFY1eDZVZm1KNmJtU2FLT0FX?=
 =?utf-8?B?bDFrSDlGQWJLdTVqUlRVZ01mT3dodFBVeG1YTm5ZZmFkVnpHRFlka3UwQjlr?=
 =?utf-8?B?b3NLY0RXWmFiUjJ1YUxBQkpYb3gzS0hCN3ovTENjTFQ3SnZtUjNqUTM3cFgv?=
 =?utf-8?B?Qmw2Vmg5OW5NUW9NUlY2RExDN2Y2cGo4RDBDRHBWbGE1eFljem9BMGxNeUpK?=
 =?utf-8?B?RTlhaDRRc2ZWenVHd0pzNzFGWU5vRC92N1JoT2VuM3h4Q0tLK3JsSUpmOEtY?=
 =?utf-8?B?UGpnRlFLU3krdzRJRjFMWGRCMC85UXAvUHd2bEQwdUI1WitXRk1QQXF3SmNT?=
 =?utf-8?B?aWZSZzZyRGJmZ0FWbHc5ZUlRY1RkK2VzeXphazNYMWhMMlJEbWwzYjhRelRB?=
 =?utf-8?B?ZEVrdWtBSjZ3VkI3ZmZndmJ3ODM3T01kK280WUw5VnZaekQrYUJ3WVBRODIx?=
 =?utf-8?B?d2RYd0hzTmR0bjdONi9MaGFVSVNJVEhqWVFLVlFJL2JYRkwxVGltSHdRLy90?=
 =?utf-8?B?cnZybW9pS1hnVDBTZlBaY0Jqa21MRzdPU1pLeEU0R0Y1MlpGc09Fa0tRaDlZ?=
 =?utf-8?B?MDhWaFhQNUtRbkFOVktMRUhJZklaa2x4WjhoWkR4Mmg1U2puSG5zUWppRUpF?=
 =?utf-8?B?T09sYU9LZHdrYzEvbjV1dzhNM0EyRW9EQlRNWnNpTGRkU1lTbFNpWlA3bzdv?=
 =?utf-8?B?eEZzcUdlV0c5MzBwMmFZVVI0TU8vRUF6WGNOZTdDckNrSGJlNFZUdnhvS0do?=
 =?utf-8?B?RURjRnR5eHVwUFpjSHp4bWYxSFhwVXJyM0pkbWpMQ05KY0xIT1pzeFI0enlT?=
 =?utf-8?B?ekJ2NWx5THgxTlBsQkYyR1hyT0dhWHA5SFJnNk13Sm9EQkMrUVlyMXduOC9T?=
 =?utf-8?B?U2puOEtqOU13MkhGMGo1VG1ZanIzdE01MWJ5L1hHK2lUeGNFb0VqYUdKaTFv?=
 =?utf-8?B?MHZyanZwSTJzMU1OclR5RVE2RHltQVJFTlFpdXNqcUtGRUZia0cyZ2ZoTy80?=
 =?utf-8?B?bUdRWjNYNG9NdVA2UzlMYmxhM2o3aEprZU5zU0kybTVXVldJa3FaZHdUWWRp?=
 =?utf-8?B?R0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: babb6eb6-cf21-4c81-886b-08de3c829b18
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 09:07:58.1971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CTqr9a3v4X1/BRDYcJQRiX+/mcFyvaowBfihDLhTFe4kjUuiAKCMlSnkTBA+NQZo9iCCHb5B9TKI9MeY93HSchrF5998r+cf+vH+AliQtzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7808
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: nP6QV8ugQe8WasHMLXrRFssfC4r8fzDD
X-Authority-Analysis: v=2.4 cv=bs5BxUai c=1 sm=1 tr=0 ts=69412171 cx=c_pps
 a=uJxR2RjB/d5PFa0hjvWx4w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=IA4xdaxstyKIia3CV5QA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA3NiBTYWx0ZWRfX5vLrax5Poc8w
 UZZWB8jiU3TUg10VgYqrqDmtWBlg7mq2tYGuSg+RpsTuP1Z41/fM9seFFiLkGSrrdcBbAiDhFMz
 lj1WodcaTp8CIooRis6o/COCuBvwqHiLgQC3dvgaJkW2OGcN4RhMq4r8UuI+IhbIYjs5Qt/pDwh
 S77Kt/SS50yX7aARQ5AjzRw5zSWdK5R9fh6J1ax8EgZej2/8OVEMbNx3r+n0tzfeqeug5yJI2lq
 3alazUlqo5+ao9dpoLIG5j6ckbOKJsKVs4j3KLFj0dmCaoEWvC6S4ohtMzjiWW9l5v5iv/fqybI
 Y7c8YyQ6QklRblwLssinMXQJU0Cu5jV663scAYSwGLoR4HEQ95txqQCndNElyiDDPJJYmK3X+UY
 Hi/uZyUWm2vVPKvCdMU1Y13szpPaBQ==
X-Proofpoint-GUID: CesqF7AhzOOxqGamWkARDVp4G8XNuC3d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512160076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 09:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227927

On 12/15/25 20:02, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Fri, 2025-10-10 at 15:52 +0800, hongxu via lists.openembedded.org wrote:
>> The debug_build.inc is used to collect debug build configuration,
>> override INHIBIT_SYSROOT_STRIP for cross and native bbclass when DEBUG_BUILD
>> is enabled
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/classes-recipe/cross.bbclass        | 3 +--
>>   meta/classes-recipe/native.bbclass       | 3 +--
>>   meta/conf/distro/include/debug_build.inc | 4 ++++
>>   3 files changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/classes-recipe/cross.bbclass b/meta/classes-recipe/cross.bbclass
>> index 9abf166e50..ede04950b5 100644
>> --- a/meta/classes-recipe/cross.bbclass
>> +++ b/meta/classes-recipe/cross.bbclass
>> @@ -23,8 +23,7 @@ HOST_CC_ARCH = "${BUILD_CC_ARCH}"
>>   HOST_LD_ARCH = "${BUILD_LD_ARCH}"
>>   HOST_AS_ARCH = "${BUILD_AS_ARCH}"
>>
>> -# No strip sysroot when DEBUG_BUILD is enabled
>> -INHIBIT_SYSROOT_STRIP ?= "${@oe.utils.vartrue('DEBUG_BUILD', '1', '', d)}"
>> +INHIBIT_SYSROOT_STRIP ??= ""
>>
>>   export lt_cv_sys_lib_dlsearch_path_spec = "${libdir} ${base_libdir} /lib /lib64 /usr/lib /usr/lib64"
>>
>> diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/native.bbclass
>> index 7d1fe343fa..b3411d20ca 100644
>> --- a/meta/classes-recipe/native.bbclass
>> +++ b/meta/classes-recipe/native.bbclass
>> @@ -118,8 +118,7 @@ PATH:prepend = "${COREBASE}/scripts/native-intercept:"
>>   # reused if we manipulate the paths.
>>   SSTATE_SCAN_CMD ?= "${SSTATE_SCAN_CMD_NATIVE}"
>>
>> -# No strip sysroot when DEBUG_BUILD is enabled
>> -INHIBIT_SYSROOT_STRIP ?= "${@oe.utils.vartrue('DEBUG_BUILD', '1', '', d)}"
>> +INHIBIT_SYSROOT_STRIP ??= ""
>>
>>   python native_virtclass_handler () {
>>       import re
>> diff --git a/meta/conf/distro/include/debug_build.inc b/meta/conf/distro/include/debug_build.inc
>> index c006093345..1062326417 100644
>> --- a/meta/conf/distro/include/debug_build.inc
>> +++ b/meta/conf/distro/include/debug_build.inc
>> @@ -40,3 +40,7 @@ EXTRA_OECONF:append:pn-nativesdk-debugedit = " --disable-inlined-xxhash"
>>   lcl_maybe_fortify:pn-vim = ""
>>
>>   CXXFLAGS:append:pn-vulkan-validation-layers = " -DXXH_NO_INLINE_HINTS=1"
>> +
>> +# No strip sysroot for cross and native
>> +INHIBIT_SYSROOT_STRIP:class-cross ?= "1"
>> +INHIBIT_SYSROOT_STRIP:class-native ?= "1"
> One key question is whether this still makes sense?
>
> In most cases you want to debug target binaries, or native, or cross
> but it would be unusual to want to do all at the same time other than
> for test builds. In test builds, you can just add the extra config.
>
> Perhaps we should therefore just remove these?

Copy, v6 incoming

//Hongxu

> Cheers,
>
> Richard



