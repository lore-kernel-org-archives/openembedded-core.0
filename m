Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DBE1E6F060
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 07:16:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.96701.1766474179766114958
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 23:16:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=oj8LcP7h;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4452694da9=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN4F5ac1715505
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 07:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:message-id:mime-version:subject:to;
	 s=PPS06212021; bh=UThMberkqzFJ/PEShpwF/BgoZkAKwu1vWmUUDnayfdk=; b=
	oj8LcP7haHb/qpzYlAGhNc1SGZP8NTZ4CbRKNX0F3EOh5pHIjBHk72nH1X/Ga0Y8
	jXd1qjm9jwgAOkbv495JKaCngUNxoFpwWMGRV759ytDIfNV89SFTM0krlhXO9Y1c
	wDig8cfwI4jsWeJsqkoFR45ZULlPp9JuW7sW4E1QajvHMkSHVHIt3Hb8IfTEzRgS
	WeeLZ5x6gUMe/xydgWZdE/f6fiai6iizZ2BHTboiDUDKs50pJq32qZAdIwo13OW2
	k0adnfqbtGwpGyHORui1l16+LetptKB8pN29uXgv7iWtCWShispB9Zu0fLrzdj6N
	2UH0TEDkcjIHdoPWD1NZlg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012011.outbound.protection.outlook.com [52.101.53.11])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5h0vjts1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Dec 2025 07:16:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XnGTesb1Gsqgv+ExHS22DNbJi+ybmxOvJHwGkhlS1YUAFfQyoO46cWus+pkZ8IyKXNnkzmK/H3TNJojeMe2J1ZJQXPc4znZ49Y91mWVJyFW9WLBSpUKDkwIi4rl1IUxumzo3r1DRQEGrBj0/TpWR1KwyLgf9pIqAKtIkxnH7xjrOcNwHV4Xd8pAyUwxFKOwHuPFI8VSzlJEhA8k3HBvD1fu0zdfLPkV1SYMfB5Y9p61OUT8g0UYF/7uKffeZAHBqWDH6avGmPFso4i3lhXjtU2hFg/K63mbthLdIqKxtOHT2dd519aCREaZ3rnsHdRTg76RSqNI18xYmbTg/HQzOYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UThMberkqzFJ/PEShpwF/BgoZkAKwu1vWmUUDnayfdk=;
 b=WTv7thqlgaM5SDknGBmUVYqBShhUWqgTGH4nznIwwy/aCziQvTPCa0ZSTCfhM9YE/EbzBNLDIrmnJZwb/Kx5g/b9c0G0lcPcEmXp3NDYV2/+7hmtReO7xSONwEPToNCNurelNeZniUxS3v8MnH+DQaniXioTFBXAD6kpccNhtj4BaS9yY8j70mswgEp4jEcomAtqrcITCiEAB1AdR+pGEOr7sDNWpOFyzYaFklZH6WmUpfuscUH9QedXHPRbGB1IeAtd4RjObsGZOksW7B0eLu3Jf7pWeDxsEJ1rrNCKRXMj9zxuUT+OE4/Irp97xuh6Vj2EX/7piGiXis+7sj2Sag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ2PR11MB7599.namprd11.prod.outlook.com (2603:10b6:a03:4c6::7)
 by LV3PR11MB8459.namprd11.prod.outlook.com (2603:10b6:408:1b0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 23 Dec
 2025 07:16:15 +0000
Received: from SJ2PR11MB7599.namprd11.prod.outlook.com
 ([fe80::8345:1cb3:a109:be24]) by SJ2PR11MB7599.namprd11.prod.outlook.com
 ([fe80::8345:1cb3:a109:be24%3]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 07:16:15 +0000
Content-Type: multipart/alternative;
 boundary="------------FF3v79t7UXzA4ogs04I93z4j"
Message-ID: <14ecad42-51fb-4abc-a493-c58cfadb9688@windriver.com>
Date: Tue, 23 Dec 2025 12:46:09 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Cc: Khem Raj <raj.khem@gmail.com>,
        "MacLeod, Randy" <randy.macleod@windriver.com>,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
From: Yash Shinde <Yash.Shinde@windriver.com>
Subject: Re: [PATCH] binutils: Upgrade to 2.45.1 release
X-ClientProxiedBy: MA5PR01CA0155.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::7) To SJ2PR11MB7599.namprd11.prod.outlook.com
 (2603:10b6:a03:4c6::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7599:EE_|LV3PR11MB8459:EE_
X-MS-Office365-Filtering-Correlation-Id: 90d4432a-ce83-40d2-c6ea-08de41f32914
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SWRpQTFZc2k2bDF4aEcvMHNxaXZ6YXhWQTFvWUFremNudWlpYVVKcEZBdHAy?=
 =?utf-8?B?RkQvMml6Y3RaWlFCcEZGY1d2UzhLeVI5OWhoaGt2V29aRTJSZjVDenVkeVBu?=
 =?utf-8?B?Uy92N2p6UlhVYXJEYVRhVTVEWU94RkV5a3RZUjRjcWFmaWZrRUlNeWFxRmx4?=
 =?utf-8?B?YUVqMWQ4SE5SYldpdjVmVGI4RDBpbC8wOEpEaEpBeEZlOG9WRGd4M2RYY1Jh?=
 =?utf-8?B?ZWx3OHQ4ci9XdUlmczNnMmY4Q05FVU5vejcyY2x5UEVZNGJwVzgyU1FuUFY5?=
 =?utf-8?B?MCsxT0lxWjQ3OXdaYUliZEtQem9jNEd4N2JCL3ViOXZVNEY5dUIrbUZwUXhX?=
 =?utf-8?B?eXR1aUVxakJQbVdPRjhCRXJBV0l5WXFac1VIR3pPVm9KMzRIdlJmZDlyUWhw?=
 =?utf-8?B?Z09LYjFsYWRqaHBtMG1lV2tHbXpaQkVPQXlDWEhvc3VnSWN0MDUydmFqQnlJ?=
 =?utf-8?B?b3dLZlo4djZRN0cxRHFDNE1FZ05EZlc1QTlMOTU2Tkh4SzQvV00rV24vTzdu?=
 =?utf-8?B?Sll5VmV4eStSQi91UzEzeTlZN0w1K1NKV0RGdTV1UUxQTVR4NUhyRnF2Yy9I?=
 =?utf-8?B?RVNyLzIwM3VyTGVzQUJaUDR0ZmtEODIzL2VDaSs1TVp1ODVpLzhsMDM1Uzhy?=
 =?utf-8?B?VjZqdms4RnpSUFRVYjF5bXFsbE4wQ1NSN2VkRnJraW5jQjFpL3JsTjBPTzdv?=
 =?utf-8?B?YjkwY0pkOEc5Mk16VCtxeE9oQkhNUC9oYUw2RXJCZ2g5czhpVTVUeTRMVFpw?=
 =?utf-8?B?ZEFad05sb0h6d3pWeGEzaloxbXhHUEI4QUt4cHZpTURpNU4wMHNIdWdUQVYv?=
 =?utf-8?B?VnlsN2dyWVhrUmlydjFzb25vU2s2QkNOZnA0QjE4RnlzQzYzMVJjT2NpdnBW?=
 =?utf-8?B?bHBFUzR3NU1RQUJTQ256dk9KTjZVdlh5QStZNHVCQ2R0bERVb1p6NnVBWkZH?=
 =?utf-8?B?MUJjZUk1VmhNZ2ZyMkU4Ly9CMWdxdzFsZDdZTHcwUDFCMWkrSDFxQWE2OEll?=
 =?utf-8?B?Q3JiektaRHVqUUdxS2RpS2xud25uNjdWZkd1UzlNMi9kd3lMNncyRTV3QzVM?=
 =?utf-8?B?YVpQK3ljMFpmZnRVVlByOXhibDNzS2tjdjNxVWQ2bFlmRHZpMy8rT25LT3FS?=
 =?utf-8?B?K0N4ZW9ONmQ1enlaNnpiYUp6dEtmdUpWbjBNUnlac0VaVXBIVkN2OG5QdXFo?=
 =?utf-8?B?OTlkYzZSeGE2M2g1T29ENEdRcVZuODV6MHgrelhNYU5rZTZvN3NWSjNSaTlO?=
 =?utf-8?B?YUFvOU1nVU0xalNKNDRZTWVxZkVpSlNyZVhaYVRvK0ZLL0I5S1BCUURZb3hu?=
 =?utf-8?B?eVdKeUVpMHpvK1ZHcUp6b0pTSEtwUTFDY0liTmQzZU9EZ2tEamNDQ0dad3U0?=
 =?utf-8?B?VkM1czhoTlk2ZG9xb0dXVHMxdDJjd1dadGZVbWFKcFdUZEJWU1d6SjQxTTgw?=
 =?utf-8?B?L2xCMXlyMCs3eStoU29OVEYyL2cyRnV0Uy9laUVWRHd0MXRWOWpEWTVzTTF3?=
 =?utf-8?B?U0NieldCNjZNSk5DdE5qcGZaT3Ezd09paFYvMi9pcExzbFZkUjJGeGdZenl5?=
 =?utf-8?B?RHRFcHJzaHZzQ3g0WEkxOE02MlNUMjJXdWU3azdPQXA3YU82cE0rSFVGMjE0?=
 =?utf-8?B?TGNncy9wK0xhNDJ2bzF2ZmJuaGFCL0dnU3lwb1QrS3RRdWZvMjUvd3BBQ2lC?=
 =?utf-8?B?T2kwNTFZTi80eWkyTFhDSkYzQWt0R255Y242QzZKb1FvRnN3NzZvSGhDUXpT?=
 =?utf-8?B?NVNSNktTcEw2QnhZNkd0STNLZ0VSYUtqNEFTNkdtODB3bE5Nb2xvcCthaUNw?=
 =?utf-8?B?NkhxLzM2M2dKRDBTQTc5V3lpOGJUNzNKNmYrQmhaNUtjUi9heXVVQXl5ZjVv?=
 =?utf-8?B?WGRRWVNjeWRqNFhMcnpFWHRDbG1iYnN0YmJvd1JnOVVmaFllV2toUmVnQU9v?=
 =?utf-8?B?eWZJOHhNVjkxN0hKQjhPV29QNldYK25mTml1T3lFQVlRNWdlQ2h0WEVYV0s3?=
 =?utf-8?B?WXpJaW9SbG1RPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7599.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SGJlNFRxYUZJZ2dWT3hHRE5TZ3BzTkpFUU1zdktnM2sxWWpTbTY1WWo0Ri9L?=
 =?utf-8?B?QzN5NGZFVGQ4Szd4L0VyTjlzZlVwdWRROTdneVI4TkdiaFNEQXNxNXNJLy9D?=
 =?utf-8?B?S0E4YUhrSk4zYTBDS2RkaHg2b3l4ZWFaNG5rVkpyNTBQRnJ1eXJMTHQ4QzZC?=
 =?utf-8?B?OFMzakVPdFIxcWJ6aDR4OUhrNzJ6MEFWMG9EQlNlSVo2TzhUYzQ1ajRWSEhH?=
 =?utf-8?B?YzMrR0JkRm82MWpGaWdHNXRFOEZxNU44NVJISkg4YlBlUVJmdmpTRnpJMU8w?=
 =?utf-8?B?RVVqaGMvTVk3czhhTmdaOUhxdW91ZEZ3dUdKZ1lYd1V2SUY2WURFNXErdGxJ?=
 =?utf-8?B?RHlzSUowUEVZUWdva3pnYzR4REZ0Y1UvYTMzNGVqSm1hWUVTdWFaTEs5L29H?=
 =?utf-8?B?L2d1bG9zdEJlMWtPMnE0N2RUK05QSTJYMWpHYndOZ2t1TUVqNVFkdjlqV0dJ?=
 =?utf-8?B?c2xscm1zL0d3T3kwa3l0VGNEekplNStXS0RTM0NmWEJ0QWphYmJjbkt0ZERK?=
 =?utf-8?B?UDdpZzZDS0F6Y0FtUmYrS21zamZCeitoYUp0WXNtOG12N2xkVTY4eVRBUXg2?=
 =?utf-8?B?L2RxZUZ3RXBmM1gwb3NwQ2VzYWczR2hTVm5KaXJldGFNVkRKRTBzUXJWVkto?=
 =?utf-8?B?aXd5bVozRlR0VWxPNHhPR0hJbzA3MkR1ZEVpL092YjFQSkJMWDRpdmhJWFFF?=
 =?utf-8?B?ZjFkdURKbXRpU3MwbDhlY203akRqSUV4ZHBnOVc0ZWQ1M2xoSVZlNEpNM0hG?=
 =?utf-8?B?VkNaZ2Q3NEdRZ1lrcWRIVVZwRkdjWWdVN2l2N0MydTJvSzAyUkI2ZFVhYnBy?=
 =?utf-8?B?aFhRZkEzamVmczVET3BCUEcyVVJaYjZqeGsrdXhRNmU0b3cyOWJBVG1uQm5B?=
 =?utf-8?B?N0loUUhyaU9EOTF0UDBWZjNRamxWbWs3V1R0U2FoNFhTdCtRbVM3Nkg1bXRw?=
 =?utf-8?B?KzZkazN5SlNzK0VsdjNhY3E4aHVxVS9CQ0FqSlNMT3VmNGxjMUZwb2pnVTVl?=
 =?utf-8?B?d2c2REZSbzNZb1VReUNjUEhpSXZMYzJLekZJRldReEpDLzFhZGdjK3RCUnhq?=
 =?utf-8?B?TE9nTDVPR212REszVThCZ01BcmcwN3YvSjhvNEVtZE9QejM5NjM0VDNOam05?=
 =?utf-8?B?SmF0bmlwNzFHLzMzRGFhMVV4NEJHYXVQeXhpZ3AzNytlbThRaWFDTnNTb09y?=
 =?utf-8?B?bHFUVHQ2RkljQWI2TTR0WUF4RGQwZ2ZwU2lmQ0xYcFZvWWpadTZPZTYyWms1?=
 =?utf-8?B?cnFyVDdlelM1b0pSUFE1dU5oRnJDdzE2VlM1S3NtUjJ6MllxZFo4aCt2ZitK?=
 =?utf-8?B?L0F3ZE8ybjQrNGdXK0NjeWwyK0UwYXRLT1V0OGV6SGpRemRnTmlQNEl5Z2NI?=
 =?utf-8?B?bE1ITU9mVWtkcjNGSnZnKzlkNi9ra2crUlR6QlRNa0sxRFJKb3RNR0Vybkk5?=
 =?utf-8?B?dHhoeXhEdk9EYmM4dG1FaVprTXVIUnF6WC9yK3MrNS9ZUjhtT0xLcnRKelI5?=
 =?utf-8?B?Y3FFMlJWSTBLYzlpUlZTOUFWdHgyT0RvdE5TRkRiVHFMQTAveVBOWWl2N2N4?=
 =?utf-8?B?Y3FnQ0tJbCtyT3lCYU54ZWRndGpUTFVkNE1ES0d2bEN2SHFHSGVFcG9DMlJT?=
 =?utf-8?B?Qkp0YWxodEtQaC9IOGtpelh3MmFyb3krRmZBZ0lnNVZlRFVpb2R4SnZQVU1a?=
 =?utf-8?B?NlRsWGhUV0VvcmMwQ0crRGZ2M0V0R3NnYjNHbytVNUhaWTBxNUwwUWl4bm9X?=
 =?utf-8?B?Z3VTZ1ZoSUgyK3JBd2F0Smx1ZlVMa0pwYmFCNysyYWZwS0pOSnlWSlJkd0Ft?=
 =?utf-8?B?YUw2OHZLUWFUUm1hcXV6Y0U0V1JCVDJsT2Vxb1h6Qk9aZGRPeTNzemI1MC94?=
 =?utf-8?B?aDQ1RXBRbGRpWGFHdXZPTUxhRzR6bEM5YmU4SXJHYWdsVE9nZjg1UUJjb3dM?=
 =?utf-8?B?em5kSE9yQTVnQTNzeW9BeUk4N0VEZk1LcmpRdmxINmtTY3g0Q0IycnNSbk5l?=
 =?utf-8?B?THk0ZHZidTVqdGhLUjNWZGVjdVUxWFpMcFgvVXZlMkpIcktybXN1QkM2Mm4x?=
 =?utf-8?B?ZUIzWitPUEFmcGdMUk5zNlpudnkrdFowVEUzcnpCTE5oZHZUcDBlOFI3MHh1?=
 =?utf-8?B?NFpJbnU2bndrS0s4MWMvUGc5RVZleW9JWlNPUU5IdENDSXBUWUZSMWhhYW8x?=
 =?utf-8?B?bCtHTGIrUlBBSG9xU1lpL0s4aDVTNlk1ZHpndjRNVmlLbVZyTHh5bTlCUUJD?=
 =?utf-8?B?R0JDb3QwK0xybng5ZmpqWVBEU3FWUjJYWUdDN3VmY25mQ2p6dGlPR2ZUUlFB?=
 =?utf-8?B?V0tib3dqRFBBWlNIMURrK3F2NHd5ZytaL2xqblhERGVCVDhlYnpzZWc2WUFr?=
 =?utf-8?Q?x8xsbndNen/5pfH4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d4432a-ce83-40d2-c6ea-08de41f32914
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7599.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 07:16:15.8221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3g+e0lBDSUcODOOn6fOOlqMrWYI9zuPYIw/9NFqwLpHctOxHobw1MtMUBzyf9i64hoiybaiaQ1jaC3pdVoE2ttAOJDWwl6Cahal0gbFLLsI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8459
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: oUeTb4C8aX6CW39G_W4g0e2UHAfsI8-i
X-Authority-Analysis: v=2.4 cv=I6Fohdgg c=1 sm=1 tr=0 ts=694a41c2 cx=c_pps
 a=FgInDTms8P7UIkhGxXY9Tw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=q-K_ymHq7JZDIP48oiQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=xQrBabcLfEwEeP2tvYUA:9 a=GuYBVZMQ3Tbiqnj9:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: yyZ4KfNUDOxm3k-35q-dac-JEgv21ZYz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA1OSBTYWx0ZWRfX6DNaJYrrw8wt
 W13FCOWH8PZgBXGe9YWU7fUr+U17tQkVGQvngYxGbjb3OhFU0O4GC1V7WqC+BHeTtPTm8Y8FE5q
 2Cj0tSHq1RKztzVRdiZLbjRS50Iyjv9/j/lV6MYKbwmQL2WPrhn1toBUUxD9GArwboGPq/b9Xqp
 vwW3CNLBtPeqgTCWG1CEVd2ZZWhOCwrL4ikoCwWbgsQpdiJKftbnnHw8Sph1MP+XClXcBjCLVU0
 gyBrxAZF+xSyto+LPR69aClx13n80X7MClVa48HjRECXoKfNzsMTtghFhL5NQ8tUsCWh8J+Jd6G
 8vMBpydBxV/JhKp/gFq3eyowXbXNsqSHJBb8RVpMXVEROb87cFkm8Fz4ps9yW2Zpl7165SCIzhR
 Fqt9/SEaISutSRr6UH3Sv9XHdSOOWY0DoKc9QwcrMm8sDRa+vXY12OTYAauFv2VzspKgTPYIHLN
 OtOiNlwmYGpNRAFuxiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 07:16:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228453

--------------FF3v79t7UXzA4ogs04I93z4j
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5BN4F5ac1715505

From: openembedded-core@lists.openembedded.org=20
<openembedded-core@lists.openembedded.org> on behalf of Khem Raj via=20
lists.openembedded.org <raj.khem=3Dgmail.com@lists.openembedded.org>
Sent: Wednesday, November 26, 2025 7:11 AM
To: openembedded-core@lists.openembedded.org=20
<openembedded-core@lists.openembedded.org>
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [OE-core] [PATCH] binutils: Upgrade to 2.45.1 release

> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
> Regenerate ld/configure
>
> Brings following changes
>
> * e3a18893e1c LoongArch: Use more appropriate assertions for the=20
> relocation of TLS LE
> * b136efd10a7 Re: dlltool memory leaks
> * b4bde11f310 ld: Don't use -mdirect-extern-access for LoongArch
> * ab776bc8685 lto: Set plugin_format to bfd_plugin_no only if=20
> known_used is set
> * cec7ab85f24 aarch64: gas: Allow movprfx with fmmla and bfscale [PR=20
> gas/33562]
> * 0b040187894 aarch64, gas: Relax Armv9.6-A mandatory feature set
> * 4df2be75910 i386: Add GLIBC_ABI_GNU_TLS version dependency
> * 71c1de4b0c8 x86-64: Add GLIBC_ABI_DT_X86_64_PLT version dependency
> * b0fe5c23780 x86: Add GLIBC_ABI_GNU2_TLS version dependency
> * d5945a221ff x86: Copy non_got_ref_without_indirect_extern_access
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0.../binutils/binutils-2.45.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=
 6 +-
> =C2=A0...-system-directories-when-cross-linki.patch |=C2=A0=C2=A0 48 +-
> =C2=A0.../binutils/0008-Use-libtool-2.4.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 1827 ++++++++---------
> =C2=A03 files changed, 832 insertions(+), 1049 deletions(-)
> .
> .
> .
Here's the binutils test results summary:

Test Results:
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Before =C2=A0 =C2=
=A0=20
After=C2=A0 =C2=A0 =C2=A0 Diff
No. of expected passes=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 317=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 318 =C2=A0+1
No. of unexpected failures=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0-1
No. of untested testcases=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A05 =C2=A0 =
=C2=A0 =C2=A0 0
No. of unsupported tests=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A08 =C2=A0 =C2=
=A0 =C2=A00


The additional passing test case is, "replacing non-deterministic=20
member" after Ross's fix:
https://git.openembedded.org/openembedded-core/commit/?id=3D7ea5d2c5aadb1=
852aff23616e973b382df44c8d0


Regards,
Yash

--------------FF3v79t7UXzA4ogs04I93z4j
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p> </p>
    <div class="moz-text-html" lang="x-unicode">
      <p> </p>
      <div class="moz-text-html" lang="x-unicode">From: <a class="moz-txt-link-abbreviated moz-txt-link-freetext" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>
        <a class="moz-txt-link-rfc2396E" href="mailto:openembedded-core@lists.openembedded.org">&lt;openembedded-core@lists.openembedded.org&gt;</a>
        on behalf of Khem Raj via lists.openembedded.org <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem=gmail.com@lists.openembedded.org">&lt;raj.khem=gmail.com@lists.openembedded.org&gt;</a><br>
        Sent: Wednesday, November 26, 2025 7:11 AM<br>
        To: <a class="moz-txt-link-abbreviated moz-txt-link-freetext" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>
        <a class="moz-txt-link-rfc2396E" href="mailto:openembedded-core@lists.openembedded.org">&lt;openembedded-core@lists.openembedded.org&gt;</a><br>
        Cc: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a><br>
        Subject: [OE-core] [PATCH] binutils: Upgrade to 2.45.1 release</div>
      <div class="moz-text-html" lang="x-unicode"><br>
        <blockquote type="cite">
          <div id="divRplyFwdMsg" dir="ltr">
            <div>&nbsp;</div>
          </div>
          <div class="BodyFragment"><font size="2"><span style="font-size:11pt;">
                <div class="PlainText">CAUTION: This email comes from a
                  non Wind River email account!<br>
                  Do not click links or open attachments unless you
                  recognize the sender and know the content is safe.<br>
                  <br>
                  Regenerate ld/configure<br>
                  <br>
                  Brings following changes<br>
                  <br>
                  * e3a18893e1c LoongArch: Use more appropriate
                  assertions for the relocation of TLS LE<br>
                  * b136efd10a7 Re: dlltool memory leaks<br>
                  * b4bde11f310 ld: Don't use -mdirect-extern-access for
                  LoongArch<br>
                  * ab776bc8685 lto: Set plugin_format to bfd_plugin_no
                  only if known_used is set<br>
                  * cec7ab85f24 aarch64: gas: Allow movprfx with fmmla
                  and bfscale [PR gas/33562]<br>
                  * 0b040187894 aarch64, gas: Relax Armv9.6-A mandatory
                  feature set<br>
                  * 4df2be75910 i386: Add GLIBC_ABI_GNU_TLS version
                  dependency<br>
                  * 71c1de4b0c8 x86-64: Add GLIBC_ABI_DT_X86_64_PLT
                  version dependency<br>
                  * b0fe5c23780 x86: Add GLIBC_ABI_GNU2_TLS version
                  dependency<br>
                  * d5945a221ff x86: Copy
                  non_got_ref_without_indirect_extern_access<br>
                  <br>
                  Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a><br>
                  ---<br>
                  &nbsp;.../binutils/binutils-2.45.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 6
                  +-<br>
                  &nbsp;...-system-directories-when-cross-linki.patch |&nbsp;&nbsp; 48
                  +-<br>
                  &nbsp;.../binutils/0008-Use-libtool-2.4.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1827
                  ++++++++---------<br>
                  &nbsp;3 files changed, 832 insertions(+), 1049 deletions(-)<br>
                  .<br>
                  .<br>
                  .<br>
                </div>
              </span></font></div>
        </blockquote>
        Here's the binutils test results summary:<br>
        <br>
        Test Results:<br>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Before&nbsp;
        &nbsp; &nbsp; After&nbsp; &nbsp; &nbsp; Diff<br>
        No. of expected passes&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 317&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 318&nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp;+1<br>
        No. of unexpected failures&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0&nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp;-1<br>
        No. of untested testcases&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;5&nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; 0<br>
        No. of unsupported tests&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 8&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;8&nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp;0<br>
        <br>
        <br>
        The additional passing test case is, &quot;replacing
        non-deterministic member&quot; after Ross's fix:<br>
        <a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/commit/?id=7ea5d2c5aadb1852aff23616e973b382df44c8d0">https://git.openembedded.org/openembedded-core/commit/?id=7ea5d2c5aadb1852aff23616e973b382df44c8d0</a><br>
        <br>
        <br>
        Regards,<br>
        Yash&nbsp; </div>
      <br>
    </div>
  </body>
</html>

--------------FF3v79t7UXzA4ogs04I93z4j--

