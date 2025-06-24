Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 331C0C77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 18:18:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3186.1750789072464180095
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 11:17:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82704a5857=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OI88Ek027836
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 18:17:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dkqakeyw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 18:17:51 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55OIEYE7004991
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 18:17:50 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dkqakeyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 18:17:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DgBCTbqcJdFjS7cZ08X8sQ8aniorOykcC5LyC0KdBlzpWothmXEblIseOWarTrnbNBP+/HcV/rMQg42StotcgwlTwUoM3Zaon5LrgcwWzUP+FoXdBg+6JsGEvzYx4pspgQAO723Fv/S3aKOf6RQD5jiTrjHUpOLJ3FZ9j7GrIFDHD3wkc8t16kLeB2ShH3NBZLTRQ8Oq/6A9Y/Ecb4ZnFm5lbcxW2BUcbqKgXZale9Vf3fYUx2nRbB5UXpB3A6xda9OXZ/cRCj/qp47Hob0nD2a/nHbG7SrEWKH87MK7G9cMElkDjbKTUQc7Mxfzuam+lA3ON7GQhgKbMqfCnWbzMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/TUoquqWtvK5mEmutcc8DnO1t8iAHFKh9f0PFR8BF2I=;
 b=zBOfRu1QSiaOY2lOQPDwkgVbOO+VpUYBFiOQfdottbilthGE86FZ7nsseWA5RyaMj+fjZxetfHEzfqHyP7/N5ZsPm7SbDnx40G5q7qfzIvdiyPtGlAM3MX1o3u1ED8hpCLceuqejTigGANb3AuqHPe01ilPMP6KXoX9RGf9t0eS4iD53OrKCt1epbepKd3A0jAsvevHdL+Qd35GmQA3WS9+7lTkpe5u2eYWVDQE4ODTPqHQlkOZAqIeiGqOWK96UaO3a3vz8VmcmOyDv2Y9RjpleBqX21v43K3z5IJv1+AX/BX9oTj9SudLwhGqtFVCsmrJIkmzLaVbHp2Zbg2qWmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by IA4PR11MB9441.namprd11.prod.outlook.com (2603:10b6:208:569::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Tue, 24 Jun
 2025 18:17:47 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8857.025; Tue, 24 Jun 2025
 18:17:46 +0000
Content-Type: multipart/alternative;
 boundary="------------xDocBIDCpHJwtg1xcbEkekrE"
Message-ID: <f3f89cc6-2e9a-4d6c-a977-eaeeca39c17c@windriver.com>
Date: Tue, 24 Jun 2025 14:17:45 -0400
User-Agent: Mozilla Thunderbird
Content-Language: en-CA
To: "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>,
        "Shinde, Yash" <yash.shinde@windriver.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        Ross Burton <ross.burton@arm.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Subject: Can Rust and Clang use a common llvm ?
X-ClientProxiedBy: MN2PR18CA0013.namprd18.prod.outlook.com
 (2603:10b6:208:23c::18) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|IA4PR11MB9441:EE_
X-MS-Office365-Filtering-Correlation-Id: 017ecff8-2386-4051-6606-08ddb34b6bb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dTRHTHZrNm0yMXBteDhaSThYVDJOZFprRDdlSkhyKysybUZJTHh2aVR0ckxB?=
 =?utf-8?B?TmJabmNFdXFFdGtib1pXZ1V1UmNrdXhVbEZqUTBWUEcwUm1JbE53K2JJd2d0?=
 =?utf-8?B?YnVtYmN6TTNaUHh5YVJLMDlHU0t2MDZsR0xUeHhRYXpMR21YazZSRGRDdUZh?=
 =?utf-8?B?WStEUkFMQ3IrSHZuSFZNZnVqbFRzREtyN2FSYUFYL3RUV1BzNDNDc2tuc0Uy?=
 =?utf-8?B?UmNZZmN3OERnUThiZnNZVGp1QXhKQ05LQzVhc3NQRi94cEt1eWhDWmRsSEcw?=
 =?utf-8?B?WCszSEdpd1hqSGk5M2xwUTRmZXVnT2kxSnlINXlQeXV3S042TUtaSS83OUw2?=
 =?utf-8?B?OTdtbGJsU1RMeUZldFFIODM5dU8vay9rQll2aUZlaWNlalhFQjRKOU4yalNQ?=
 =?utf-8?B?N1VPdVlzMGdTYkxNRlM1cjJ1YUg2WFVhUFI3Z3oxRjNlSEtqM1E4NW9CWVFZ?=
 =?utf-8?B?dFBWS3lnNWJIUitlQlRXMFhDZVpvbmNWYVEzMW91MmxXSmpLV1ZNUTR3ay9j?=
 =?utf-8?B?WGNRQ0l2ZzVhcWN5RUhocmp0SmUyTmNsUHB4MkpPWElVYUd4YlFBV0Nhck94?=
 =?utf-8?B?d0QvTXVqZDlySFltV1R4bDFYbFJoaG5GdWpZQXZGa0NEcnRuamhxL0RzQnly?=
 =?utf-8?B?azEvRm54Y1IrZ21kdk9ibWt0eStxelc3a2plNGhVdDd4V1JKUVMrSWNoMDR6?=
 =?utf-8?B?RkREZTN6RnpJSldqVHN3cE45aUNFd29RdEhmL2p5ZU1wSnJtNXU5UE4raStt?=
 =?utf-8?B?clVtSGdyb0pldUJ4clVqcHloR3pEbzNGUkhTU1lzUFA3TVRBM2ErMVlRNXll?=
 =?utf-8?B?WUxiN3hTT0Z6MTJGd0ZqZEZZZDlvL0lueWE2cVZETjZEV1RxekxmZUVuSmFD?=
 =?utf-8?B?SkJ2Q1dHVDZ0UXVPb2c3YWFONktMQkpKaFk1ZE9BNXNoeVpqYUE3bGR1eUZB?=
 =?utf-8?B?YnpNYzRTQzFWR3QzaWVaMmhJUHdBYWZacFlncHBaYU1KRGVwcTJubWpGL2hU?=
 =?utf-8?B?SERPdUdCRlFsWkVWUU9lNkxEMTNqc2R3QjNPTVZmMThRc0Z6cFBPVUp0M01N?=
 =?utf-8?B?SHdvZ1FsWlJ2emZpaUVHL3VIY0tWWkUrRlo1RVAyRFBMVXZ4R2NXMDZwVXJ5?=
 =?utf-8?B?dHQweDd6K2s4VS9lNjF5cSs0NUJnNTZnNjl4aVF2elNJMnVMbjU3NzBaNW5n?=
 =?utf-8?B?VUZla3FwQkovZGdFb3lFYWQxZVlWbVFqcGYvbnNlZW5rRzZJYWlJVUxIVTJl?=
 =?utf-8?B?NVRJZTBJckhwYmxLeEJza1FRT3N4MURqdnFER1dtZWtleUVrR3BlaGsxTHFU?=
 =?utf-8?B?QzQ1eE5kdzR1YWtpSTBLY1NyMDU1RC9DZm41Ry9kMkhVTDZXYVkwNW5raUs3?=
 =?utf-8?B?eFh6cVo3M0M0TDN4ZGNkbE53RHErWGZyL0l1c1ZJMTFNNXk4RU45b3AvSldj?=
 =?utf-8?B?UmM0TlV6amxvSnN4VFNzUWxKMVJOS3pVbWd1UFNJUm5TYXF6STJvUUt4aDBK?=
 =?utf-8?B?YnBoREgzSDc1Mm9LODJ0MisvYkxwemZUa0h3UTRIbFlDcGpQZTVuK1BHeDl1?=
 =?utf-8?B?SmRkdjkyTEZCdWIxcFEzR25GUlFWb2Y1Q1MzTDJFVmpKcDhjWTR4ZnRlTWZO?=
 =?utf-8?B?cHM2eE1qcmIwUVk1cm1FbEVTV3lIT1BjYUVvTzdqS2lJcUlnTmd0YTdnbnRp?=
 =?utf-8?B?WVo4ZW1ibVY0SFBxTG5JNzNIZzFXYjlWbkJQMkhzR1JOTVI3M2VIbDBrZ3Qr?=
 =?utf-8?B?a1N3dUNTS2lyREZqZEZrYSsrOUtQVHdLckNFb1J6OXd4ZjUwRjluN0duNWh6?=
 =?utf-8?Q?fR1ZOIPfbil3WDBp2MDXEhxI6RermH1GF6et8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dXd1VHp6SjRMUmw2RHZTbk54Yjk2ZzFURnhjYkdoYU1Ca0pYdnh3WlJ3Z2V4?=
 =?utf-8?B?YjkvTDJiU2g5N0RGLzc1Q3N0YlNYeU5CUHZIUU5LWjJaU0NvWWMrTWp4c0xF?=
 =?utf-8?B?a2RkZmFTTmRoVG9wZUdqbmdmeU9UTW13ZlRKdE54R3loYjhycmZ1bUU3RDBS?=
 =?utf-8?B?Q3FzcFl6Q2ZuWmloelh3TEIzUHlyTVJkWjAvcHlYYlVYMTJRS2RHSHZEZHl1?=
 =?utf-8?B?WWpERm1CZzdBV2VLczhUVTMwazdHejNOVlZFNE80cE1QRHMyWXFlLzFzWjJZ?=
 =?utf-8?B?a3Zablh6RmM1ZTdaaE41b1FxT1NrZ0xZdXFFMUVRd1ZEWFRmOVBhZkt5bUt0?=
 =?utf-8?B?Ty9ZNVVCcUNGOW51OWN2NHE5RGVpUzRiVDhMZ2M2V0dRQW1zTC96MG5Ma05O?=
 =?utf-8?B?ZmxnVGJxRDF0VUw5Q3FGay9rTGZxcnU1aTZ5MDNLTGRxRXZOQ2F6U2tnbzhU?=
 =?utf-8?B?djk2anNDUlFVYUFJMWZBRzJ4M0pxVXl1N3JBS2FGZVdyOEd3MzhLZU0vaGts?=
 =?utf-8?B?SnlNUTRtempmRy9jOEtpb1VkUVpvSFBRZDA1dllySktuL0hzNWtQblZDT2FV?=
 =?utf-8?B?VFMvamVVU01HZGk2WHVSR3lnVnk4YWxHUkhibjZYamdFMjRqQ0FjeFBPekRo?=
 =?utf-8?B?Zi93WkN1VndmbmMvTFQrOVNLc045RjZPbVNQN2JZemwwWTJPMFk3R01FQTRm?=
 =?utf-8?B?aDVMNk1Xc0Zmcm1CNThhSzFrZVpjNUx3VTFVSzR4SVpHUnFvVXFNMmkwSGtw?=
 =?utf-8?B?OVZ5TG9ra2Z2b2RiZ0tVK2p5UE9hWlNDL04xdGxWYmxrTjhhOUlaQStEZmVj?=
 =?utf-8?B?ckVPRlcyeXdleGVHZHZwTkZMV2hZOGNpcXZCYlVUMXZqZG9pUmcydXM4cDRP?=
 =?utf-8?B?WDBSQUp3MnNvOEsybnZOYU9VV25qVjF3R2N3b0JPK3lMaVFkUVdTZldWK3Zq?=
 =?utf-8?B?N2FSN0xGRzI5OEdnZHdUdCsrVFlHRXVNNGpOS1I2YlNiRzNwZUhCNXc1a2tk?=
 =?utf-8?B?SzZKd2tmRWNQZUdTK3oxSVUybFVSRVNpUTVKWHJ4TnlERXltU0Y4aEs3VUg2?=
 =?utf-8?B?UktwSmhzQlVoVEN6L2xPc1pFMTFRZ2twK3BNMHh6eGxWWkdwUExudzdjTDBG?=
 =?utf-8?B?M2lld294R3hsTlVzS3FNZHZTM1BKQzRSOXRMZVJuL2huWXNLT2doNjNvaEZI?=
 =?utf-8?B?WjRaYkx5Z0Rkd1lGS05QOWVLYUl2TzRlSlFEYURGbU13ajI4V3NIRXVwR1Vm?=
 =?utf-8?B?VzVwM1VzbE5LTkV3QnhxOHBTZGU1Q2tWYlFMS3FXUVl0STgxMkxzek11S1Ey?=
 =?utf-8?B?MWZXWEMvbktLekpvL01iRDNGbWhtVER3bXdjOFg4b0ZoM1JqRG5GVnlpSUhz?=
 =?utf-8?B?ZjlyUityYUVhQUE4N2xDUDR6enE5RFJDNGNKMUFVOVh5U2ZhRnBnT1JORFcv?=
 =?utf-8?B?bXJKSWNBeVMvQTJjYmRDc3g4R3JOZDlNUDBsUFhxWXZ2cW5iOUx1TkZwMmw5?=
 =?utf-8?B?cnlnUWY3Ykx5cjZ5dHFRTTZRTjg5RmxtZ28yeHdOMkhxZ2xIWEN1N2htdnBl?=
 =?utf-8?B?MjFWTkIrVVVUcEhsQVc4YnVqUkFER2JBL25Ea0dCYlpnVm1DbHVIZWFPQ0tU?=
 =?utf-8?B?SFZsSjkxVUJWODZ2cGFBb3MvQytvZC94L09YOUVtY3V0Nlh1NzdUdDNDeURS?=
 =?utf-8?B?OVFMeVhQdWliV2hGVFcxUCs5eXdJdGRLUUZjSFg1TGxZeHZCRkpnRlZhRy9q?=
 =?utf-8?B?UU1FR0dTMDBmd3M5VWQyVm16U25peVB1c0FGUURFSklEcmp0QUp1T21JMlNX?=
 =?utf-8?B?bVJ5dFlFVHI4amNkZXVpZU5mY0U0ZDNYcFkzd1I4MU1MMFpheVFLbmJYY2tQ?=
 =?utf-8?B?VlpSdWtEbVBJUWI1emhhU3J1Q2M5M3AzZm1vU3UrYUJzQUNNRTBSVDZvSGYy?=
 =?utf-8?B?QmVlTlhlcUpqVm9EbnJxWHM2a0FQajhISXZxbGlBT0diYUlaUXRSNG1MSlVL?=
 =?utf-8?B?STQ2U1J4Zi9jRGlGSkF3RUIxaEhFSEIrUmV4ZXg3QlFRVndaT0M3VDMvcFRK?=
 =?utf-8?B?SDdSS1Z3SjBvN1B2NzBZRlRPenlZbVdzdmZzQWlPY2VhRmIyVHRaTnZIQk9l?=
 =?utf-8?B?bmpVMHVtTzRldTNkM2doZDUvblNhZmpleGVJa0c2SnJDM0F0eFVsbVJ6MkRh?=
 =?utf-8?B?NkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 017ecff8-2386-4051-6606-08ddb34b6bb9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 18:17:46.8817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VQzf4ZL4RgsU8wCP2T/CUMcW60nIKGhVGJJ/7bFdCYqODWmilMVs5chJj8RwSOqIaiar7l7xM0wl+aS/+tw0zliB3ceYCQihISUdCZDKpSg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9441
X-Proofpoint-ORIG-GUID: pbBWjkEqvtHVw1QgJTHGtn56K4d58KDi
X-Proofpoint-GUID: hI41RgwoLtNcHbeh3qbA_7quAwShoNz8
X-Authority-Analysis: v=2.4 cv=N/IpF39B c=1 sm=1 tr=0 ts=685aebcf cx=c_pps a=y1kxij1K/spEzL/Wv3VtHw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=iGHA9ds3AAAA:8 a=xhfioePTf47TxFqhBL8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=xvLHq4VIaqVLYq6EMekA:9 a=LcmypUhzWtUTI2yT:21 a=_W_S_7VecoQA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE1MCBTYWx0ZWRfX9ptLU+qJNdLi o2nr3FG6c1XITcdM0bfikEmwK3GW6PQ6hqMbJkwwpDE+xHCKL6LCzZpreP6jD77vgYipL7ZdGyN iPUKzFE1WXP0d73J1FD3gpKhXU3hsR86rsoiPe4AOyosVd0OUCvUF2TW7o5BKuJqB3dWhAc83S9
 8iiWFWfCtC6pGXwBIGLezv53Inw2DuxJb6Tmuj5NSPxCBtVsSh6AtGQ+10/JltsgYW9NUDwW7md 8pgzw9aDGOo4H4GsvM75k3JaCtMjTeZ2XVCuRvbNKmdNIkOck1VVrelawHqYLLXcwLczUDymSVk WUIckz7E8U3nRCBP3WayPPjsZ7JM0Cw9IFwrIrEHJDzOaW4osWLxwrZI8YxCv7dFgCWPpJ+hBhM
 WcG6ViQfPc0NaFk/CRcN5BtB2jtxk0U58JG3p3dfRpsvgJhiORv4zT2sY3Yl+qXeiniCbNZ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506240150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 18:18:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219278

--------------xDocBIDCpHJwtg1xcbEkekrE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55OI88Ek027836

On the YP tech call today, we were talking about the poky image build=20
time and FS footprint.

One idea that we've been blocked on for a while is to only build llvm=20
once or at least not 3 or more times
like we had been for llvm, clang-llvm, rust-llvm, ...

Now that clang is in oe-core, we can make some progress and
we should look into avoiding the need to build rust-llvm as well.

Ross hacked things up and is able to build rust-native but
target rust fails. See:

https://git.yoctoproject.org/poky-contrib/log/?h=3Dross/rustclang

Yash, Sundeep,

Let's add this to the long list of compiler improvements that
I'd say belong in the following order:

1. Keep rust up-to-date,

2.=C2=A0 Eliminate rust-llvm

3. Reduce gcc testsuite failures

4. Clang testsuite
5. Add ptest for binutils
6. Other toolchain things I've forgotten.

Some of these things will be worked on by different people
so hopefully we can deliver a couple of them (from the 1-4 part of the=20
list)
well before the M3 milestone.

--=20
# Randy MacLeod
# Wind River Linux

--------------xDocBIDCpHJwtg1xcbEkekrE
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>On the YP tech call today, we were talking about the poky image
      build time and FS footprint.</p>
    <p>One idea that we've been blocked on for a while is to only build
      llvm once or at least not 3 or more times<br>
      like we had been for llvm, clang-llvm, rust-llvm, ...</p>
    <p>Now that clang is in oe-core, we can make some progress and <br>
      we should look into avoiding the need to build rust-llvm as well.<br>
    </p>
    <p>Ross hacked things up and is able to build rust-native but <br>
      target rust fails. See:<br>
    </p>
    <p><a class="moz-txt-link-freetext" href="https://git.yoctoproject.org/poky-contrib/log/?h=ross/rustclang">https://git.yoctoproject.org/poky-contrib/log/?h=ross/rustclang</a></p>
    <p>Yash, Sundeep, <br>
    </p>
    <p>Let's add this to the long list of compiler improvements that<br>
      I'd say belong in the following order:<br>
      <br>
    </p>
    <p>1. Keep rust up-to-date,</p>
    <p>2.&nbsp; Eliminate rust-llvm<br>
    </p>
    <p>3. Reduce gcc testsuite failures<br>
      <br>
      4. Clang testsuite<br>
      5. Add ptest for binutils<br>
      6. Other toolchain things I've forgotten.</p>
    <p>Some of these things will be worked on by different people <br>
      so hopefully we can deliver a couple of them (from the 1-4 part of
      the list) <br>
      well before the M3 milestone.<br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------xDocBIDCpHJwtg1xcbEkekrE--

