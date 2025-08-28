Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB25C8303F
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 11:39:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.18625.1756381166572627008
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 04:39:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=LoPtZrJs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1335d894ee=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57SA2AHk2656814
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 11:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=U5+h9e17PAHP3+QS67zufp
	dcBgDaPNSEBISt8n2/2UE=; b=LoPtZrJsdThLHdXs8F7WIUNcpUQTyTDFcD0eCe
	TOdg5TS8VNvZPOIdxLwhJ7GmL6Dvga39dYlgbVJ8v+0nDr2yWwYONfDTkDBmW2XN
	fiqXfc6WsAGeXnxqINzlDL17HuJNyf2nK7gF5s+B1aB7cOjevfv1h6RP6tLXhEJB
	it4aUfckJfUO81hkYzfTyctp4s5L9x3euiw9YmfewKGRXKamuRSQPi7tCyhT5cRs
	/2vNbnhctRt+7LmDgJzKIvyAWaqyNYXkD/ZrxoX9mNTYeheaqWcdD8kMGMgPgpeg
	rniHyqAnWp6cBYBtqQo5K5INdnWBFjciTsMjHjpPj00qVI9g==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2044.outbound.protection.outlook.com [40.107.212.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48q2v1dtbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 11:39:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gwk+kkLos917qq0HCXJdTz/2Ob6vpQ/MC6G4GBmai/ooE3KasTl3PUgDMQfgNCiYrAOp7GCRXj/TCPtLvSJ5LV0c8NEeboDzh+7Ar2zgPFE0BGc+vkbvIjmIBl1KWLPFF4PF9f+cq9Ojdfikq+32smBYHXLlqSGIpRvS0XYjp+DLxULYb5mGRZpd5CCJQ+kLm3xh8gxl6F24y40o512kZa1aP8IM2rUJaP2SFdXIFRPDlGQRb/OBAOrTApVCwkTIev4zIO+VmshAjYfevDeq2j3KWS6SIiNnSLeMhLyu6+x5Tr8fdnAqxXXmxaZ5l/ANCt39oMJ1Ze1T7jYJpmQHGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5+h9e17PAHP3+QS67zufpdcBgDaPNSEBISt8n2/2UE=;
 b=JrWtN+afXhtTkU9YcQymgFLF6xqwR5IP0K7LXpwWHGn3sx9ZrWcp6ZjLXY+hUqeaANdP1Im7cyLQLXhlw68s3AAMg3wKNe7nHjMqGuljyDVvKD52r0tb43pwWAik072u68nKjbO9Q0kT2a4Q+taD3hBN+lsRGHFEpBBSDXVesdpe85dJmS/4WAsuOkJIEV3H7jrmNc/Jb3dLP6eH7RDvwakVNK370MiMVNoI3NCVslu7uUf3fM+2LYdQaiP8u943Y/3L4VhIYlCUWmr4uIBsASfhuu4ZED4bUlOqhOqpTPmY5hH0RJR+DVE+r7SPNA6hu/aEOTnnEEcMr++9bylT1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by MN2PR11MB4693.namprd11.prod.outlook.com (2603:10b6:208:261::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Thu, 28 Aug
 2025 11:39:18 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%7]) with mapi id 15.20.9052.013; Thu, 28 Aug 2025
 11:39:18 +0000
Content-Type: multipart/alternative;
 boundary="------------QjUdhb4C7A2hdOefh0C3UT24"
Message-ID: <da5ba304-1f41-4e30-8c17-5ae597bd348e@windriver.com>
Date: Thu, 28 Aug 2025 17:09:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] gcc: remove .gnu_debuglink from SDK toolchain
 binaries
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com,
        SunilKumar.Dora@windriver.com
References: <20250825165026.681972-1-Deepesh.Varatharajan@windriver.com>
 <CAMKF1so8YHaBFxw1SJq87Q4siPcTSY9kaoXzDqhOTcAGyWH8ZA@mail.gmail.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <CAMKF1so8YHaBFxw1SJq87Q4siPcTSY9kaoXzDqhOTcAGyWH8ZA@mail.gmail.com>
X-ClientProxiedBy: MA0PR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::15) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|MN2PR11MB4693:EE_
X-MS-Office365-Filtering-Correlation-Id: 37071c23-e21a-47d0-47a3-08dde627841f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|1800799024|366016|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R2d1RXlUUjJJTVNoek8yK3N3dXhIRVRLSTkxVTFyRC9sdktKSmdmTi9EQVJR?=
 =?utf-8?B?dUZmVDNONS9Fam1qbjVubHBIRkJVMnFqU2Y0UzFxSUd5aHJwcWc5Rjh3K3hK?=
 =?utf-8?B?ZktLdXpVUW9kazV0b1VqdU82L0ZuMTBqU0NVNTQzQXFCQUh3QkJjYWYvcmcy?=
 =?utf-8?B?am5yMDV4a1NmWTlyaS9QdGpZSE81YjlKUzcwMDM1RThQVUJZQk9YVXAvcjY2?=
 =?utf-8?B?TlJZOXBEQkJzblVMTjFIUGJIMit3S3BFbHYvdkd6S0gyVmZBNFREczBQV1hq?=
 =?utf-8?B?K2w4UkpqN1ZJUnlzZWpSdDY5UWQ3b250NVZQZkFqdEJmclhhSUZJYnEyWkRS?=
 =?utf-8?B?R21KYU8xWkpPZDBBNW9zNFhVWVlZUGZlVjNuK25oVkU4R0YwUHVqK0VmYmVE?=
 =?utf-8?B?MVpxdkNwUUZBUHVYekJVQ3cwa0ZyazVGc0tkNHg4dXp6YVJwVHdDNWptWDBO?=
 =?utf-8?B?MVhkd0pLMHhpUWdCTVlUa2VmaldmYmo3djI5SVlMNTcxckhyZmZvQlZCSmlt?=
 =?utf-8?B?OUhDR0JZWlJ0VC9vNkNKOTJGV2FiNmhLNUpUVlN6aEZIMGYxNWlEbXZlVTl2?=
 =?utf-8?B?TTlkMEZwZ2F5ai9vNlo4b0xDdHJZb1ZLd0VoRWgvUjZTb0FIYVRLd2h0VWZi?=
 =?utf-8?B?KzdwU1Z6RUlnMmd6ZzdqcGkzM1NSSndNdHc5QmlPdWM0dUFneGwxQU5aRlVC?=
 =?utf-8?B?ZklDQzVFQVBhVEFNOUEyWTFwVndNRENGMXVwSksyd2NWeXUvY0Q2OW1YenRa?=
 =?utf-8?B?YThkVEV4Y21STkFXaE9XZ2YvQk94RTFUQlcvSmlSQXZKaXVPQms1SkdlcmtH?=
 =?utf-8?B?dEtJb1VvS0t3UldKeEFTbk9abW8vZzRscEV0QnAxZWxYOTU2b2NCQkNXMXc4?=
 =?utf-8?B?OURHenI3b1BCK3FFVXlpSXhEMWJFMFFmeUc0TlY2MTFNTnlnYjdKUUtWRWQ3?=
 =?utf-8?B?YXU5OFpFOEtNYXdvbEhZSkpNdXFBRGtrN1hiUzhaMlpiU081M1RManBOUHFu?=
 =?utf-8?B?ZUlNMmhnaTg2bnh2YmFDMkwvdzdvRkxSbzY1NExYb1FJdk0xekgxQWZVb01M?=
 =?utf-8?B?TGxHVFRSRExSeTlZODJ2dTVqMUc0RGlyK1BielExSUtObUcvbGxlVis0aGhR?=
 =?utf-8?B?aFJOY2NGVHZBcC9ZOUJ0TmU2MUNQbktqd1NGb05MbjgrUWV0ZkRKejQ1UFJi?=
 =?utf-8?B?Ynp6R21lMGYxeVNNWUx4UnBUdEtMYWRjWUdyRTRLMWZiTDhZSXg4QzZ1MWw2?=
 =?utf-8?B?Q0dNT1lPa29WS3dJUGY0Tkowa0o1OVR3c2dsN3NoWFJoNW0zdktKOENQMG1j?=
 =?utf-8?B?Tk9FdThHMFVsNDFQU0c1SGp6U1JjbzFjQ08rQ1pZa1F4ejZOcTZ2YnFNZTVz?=
 =?utf-8?B?OVFLM2lYdUZ6Y0FabWtTeVhVSHBCd0ROWGxOejZGeHNsQ1FpZHJqc1BNdUho?=
 =?utf-8?B?T0dMV2t5SEdFM2VzKzZ0dGFGOTVvY3RSY0NQNWVQS2xURDBWb0pMNjNuOXFS?=
 =?utf-8?B?TFhHNDRBTVdnbENEZjlnNVRlZVN2SHh4K3YxWlZZU2N3WktLOWMzQzRiODFv?=
 =?utf-8?B?cDd0bE9MR1pUQzJDR2tyNURrTlo5cEwrTmlrbm5vcU1jd1dhNFd0MzZTZzRp?=
 =?utf-8?B?cTZHaFRET2pqNkJMdUk4NE1rOVlKT25qelVmaUkwRWZ0ZjlwMDFDeDdHbFpn?=
 =?utf-8?B?eDZBUHFjQ0FMVlY5QkZRUHUrSjlGaW1yOEY1NlkwS3g5RWdFOUNUQVhpUkMw?=
 =?utf-8?B?NWlMMmc2VCszaVJUOVZKWFFqcEFDUFJKNVlhcW4yZENyVys4QU80VDBmLzdX?=
 =?utf-8?B?UTNuZVZuYWJyeXdmamhxOUc4NC9zcmtsdmNCeHhtRXg4Mk5UYkpPeXRGdDM3?=
 =?utf-8?Q?vKvWVE3cCBxhW?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(366016)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?akdhdEh2ZEZZSjI2OXV0VFZVYW0vWG43TzRpZWRBVEdBQU5mVmRBN2VEQ1dm?=
 =?utf-8?B?SkswYktvYVJub0VTMEtXNDNOUjJ5NnB5eE1PRmJyM01TTmpRcVBqZ3haR0NR?=
 =?utf-8?B?cytBRTdONHY5d3RnQUVOZzFoWUNtRTU4VFhCeVpvZWIxaUJqaDc5b3pJSldx?=
 =?utf-8?B?VXBUQkZENzhKMG9hNDhRdXpGcFNJNk1lUnpSQlJ0Z1BUMjdIanBtSFhCbUxS?=
 =?utf-8?B?aW41WkdEc2VMcUlZRHEwaDdEeHVuS3VaQTFaQzRyTm1sZHN3YjMrKzBiUlV6?=
 =?utf-8?B?bm1KM05DRlhYa2NRTUcvWHhaYXVCU2pvbHYrS3BmaGtWL2hmekY5U1NMdCto?=
 =?utf-8?B?YXZ2YXEyeTZjOVZqVEhwNktPYU45cG1JdzhMVFg0UzVLdkVadHNlbFNUbkFE?=
 =?utf-8?B?MmxoVENOVzdjem50NmRoOE90aTFtOUhOeDA3enJQRXRQMHVuZjZRNmM5bm5V?=
 =?utf-8?B?SjdwcDNKM0hGVEVnN2pFNm5ldm9Qa1p6QTRNcy9IeUlVTTZtZjd5WVMyL3Bx?=
 =?utf-8?B?d042S3FKTlExUmRqci9PWWpxOGtGZ1R6QXdEQlIyOEF1bFdJWjUyNTJyRWc4?=
 =?utf-8?B?bEdxd09FZ1FzdGQzajZWSGdpU2ozdHBWOCs4MnFWWHBNQU5pVnlhWi9iOFUz?=
 =?utf-8?B?c1NhVXppSlUvYVMrYko4eFNab3JiZGhCMHMwcUdJZ2tuSzAwZ2tGQUluUUd5?=
 =?utf-8?B?Q3hmVVVDTHlYY1NEV2k5dG14bmNrVGM1Zkx5bUtHYmpmV0phakxHTDJrbkhi?=
 =?utf-8?B?RXlUUFUzV1A3Y1VHZ1B1bFlxUTRELytMMldVOHkwZ1F6dkV1TzA0WmI4ZWRi?=
 =?utf-8?B?S1hrQjlZaHE0WWhsMUhRRGlNT2Y3bVpoWUhsSFBsRFYvbDdrVitGNytPWnZs?=
 =?utf-8?B?cndBdTlDODBKM25ZY09HRVc2VXU5bEVESmV2UTlHd2VSMG4yWnE5ODQ2TktL?=
 =?utf-8?B?YzJDa0IrSW92MHd4ZzEzN1R6WnVSVzErMUpBTTAyTWhyOFo0NytxeWY4OUtH?=
 =?utf-8?B?LzFOWTlBUjBGRm1STGM2bHd3cWdTaHloMTNPdTI4eXdaMG1KQmVCU21Vblcv?=
 =?utf-8?B?Vi9jRnJYL3RHQnBUNGcxMkcwc0kwbi9mQnlBaDhuQUhUMzVYWHBpM3dDTkhW?=
 =?utf-8?B?YzlZMGsxSDFOdllHczl6L1JZMmpPVTIveEpzZDY4VmFPNElWQStUWnNpTXdz?=
 =?utf-8?B?T083WU9WUFpWY2dPY1dBc05pZ1BnUHNMLzRUdGlOSmlCTlJYSVg5aFdqMWQr?=
 =?utf-8?B?T1RmS0xpYmNwKzBhTXFycWlHZ0lKTVRBVTlEUnd2YVhQYlNwbU1aa2U5dEF0?=
 =?utf-8?B?RElhNDh0Y0pOM0IrY2xITEVLQVRDdDZJUWIvcTk2akVOQ0o4Y0xGS1NtVllo?=
 =?utf-8?B?dUJ4QkhtcUkwc0Q0M0NQSThTZTZ3SHNPeW9ka1FrZFJ4V3FWVzU0ZmczU3ZZ?=
 =?utf-8?B?VjZMMllQWTM3bTMrUllJeW5zaVdQemVGQkRncmJWdU5WR1dhYWhrVWJpbnUr?=
 =?utf-8?B?a1NDdGpyTWRubXNxUXFjK0NPTTVKYXdaZFJiYXpyTm5nd2d5UkxhYnhVNFF0?=
 =?utf-8?B?VzMxTnprOEFLZEh5SzM5TGQwWVovcTVLU1Jqd0ZXVjdFd0tDRFNWK0lJeDRZ?=
 =?utf-8?B?SHpyTzBnRk1VK3k2MnljU0FtVFR6UW5teHZFUmc5c2ZhVVVsaiswN2NaZkR1?=
 =?utf-8?B?b3pMRkZBRkptR3V6ZFJKZkowWm5nOGdxQTBKdm9DRy93dWQrWDl4MDNHUFBY?=
 =?utf-8?B?NXppcklYWmErNU1VVG04VlZlb0xOM1N4VFlhTFo1dHhuSzBsTkxxaVVKVCtY?=
 =?utf-8?B?UFMzald5QXQvL0FWaExlcmtBUGcra2xhMTVHUzlLUzZPVFdsMlJ5dnFXZTlM?=
 =?utf-8?B?R21aQ3RraklXd2pyaCtGcVRmdmcyVUNGQ2tvQXcyM0VDMEZVUzVld3VVM21Y?=
 =?utf-8?B?QnM3dTJtb0h6S08xVXBuaVM2QktPU2Vac3A3REsyTEtmMzJyOWh6WjNCNUhY?=
 =?utf-8?B?cnBueStHOEpyN3ArTUIwOEV3UTZMQUVsdjV3bUlsRmExT0xMTnZHSnpRbXlt?=
 =?utf-8?B?ZGdoSHhIWjcxeHcvV1lwZWRQaGUrNVpBQ2VzaENuNjM2WGw0RXFBeHljZGM0?=
 =?utf-8?B?VzQ2TzlGQzN6cUFUTm16VE93V2RCWU1TamlvSlViUS9KMUQrMmpYL0FkZXFv?=
 =?utf-8?Q?dkaasBHb4YZNwTRNnvNqUnY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37071c23-e21a-47d0-47a3-08dde627841f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 11:39:18.1754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wT/5K3ws3xXIPDiE+HTfEZ7nKtEJlKHSYEXll4pNrR826+i3cSTGpf6SLyVZqAYYBI4pRoHS+/A2CT8MvGRN6axs4ZoQTsCNT6unTXtB2QAxJJFb2TClcnkV7OeIiwIE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4693
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: ZGBxSpJFqILKHg64a37U13P1kzOlgA5I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI4MDA5NyBTYWx0ZWRfX36vrzsWL4cY8
 iSJanTkc/Mb5UFvVjKSHLNurhxUgvYPW/XoOhrt/Ip1rciD5xZfVX5PebOkLNaGXSHR+r0rp3lR
 xGJ+qWT/1E2cRjyUtAt6N+zS7jZgaSQkDBnXDIOqrfzudxyzxk2luFkS4Z5vjlwVtqNkeOrkrRH
 DWyNATqLnoUiDWa5kLWwnWI/8WiuKMo/Wi9fHSirVd+QOhD1xEk12kQdGVAjVIgcPlpnzo77jjm
 0hcqH3zEFtBqRZtTqraMXeGRmlXi3JD1Mod2/zul0Ms/FEeqOWww2gylFhg4+Kk+O5uUrVrZmIT
 MPGYfDXuzZpblek7MKCR9t0SSd0u89weLJ0GklFw2Msovwm3u1CNA9Tc40Ejek=
X-Authority-Analysis: v=2.4 cv=T5GMT+KQ c=1 sm=1 tr=0 ts=68b03fed cx=c_pps
 a=mebX5EyombX1F+Z0XUZ8mw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=bK-c0jfj7ZhjVHbQmv0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=UBFVfQAFWYhimOpKR3UA:9 a=jRBkgnPkpWQVJ_jg:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: wjtA_lgccHpOwL-78m8glJ5veTleIYce
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 11:39:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222565

--------------QjUdhb4C7A2hdOefh0C3UT24
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 57SA2AHk2656814


On 26-08-2025 08:29, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Mon, Aug 25, 2025 at 9:51=E2=80=AFAM Varatharajan, Deepesh via
> lists.openembedded.org
> <deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Deepesh Varatharajan<Deepesh.Varatharajan@windriver.com>
>>
>> SDK toolchain binaries (nativesdk and cross-canadian gcc) currently
>> contain a .gnu_debuglink section pointing to separate debug symbols.
>> These symbols are not required in SDK builds, as SDK users do not
>> need production debug information on the target, only the compiler
>> and headers for development.
>>
>> Including .gnu_debuglink increases disk usage for distributed SDKs
>> without providing any benefit for SDK consumers and so removed.
> I need to understand the problem a bit better. Is the system not able t=
o
> specify ignoring debug info from SDK, if we include debuginfo with the
>   binaries how does it change things ?
Hi Khem,

The |meta-mingw| layer currently sets |INHIBIT_PACKAGE_DEBUG_SPLIT =3D=20
"1"| in its
|"gcc-cross-canadian_%.bbappend|", which results in the=20
|".gnu_debuglink"| section being
stripped from the cross-canadian GCC binaries. This behavior leads to=20
inconsistencies
in the generated SDKs depending on whether the |meta-mingw| layer is=20
included or not.

So the idea is to make this behaviour as default in the gcc-common.inc=20
file for both nativesdk
and cross-canadian GCC. To ensure consistent SDK behavior and to reduce=20
SDK size.


The below are the differences in binaries :

Binary=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 Before=C2=A0=C2=A0=C2=A0 =C2=A0 After=C2=A0=C2=A0=
 =C2=A0=C2=A0 Diff (bytes)
--------------------------=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --------- --------=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -----------
nativesdk=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 x86_64-poky=
sdk-linux-gcc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2165192 2165080=C2=A0=C2=A0=C2=
=A0=C2=A0 -112
nativesdk=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 x86_64=
-pokysdk-linux-g++=C2=A0=C2=A0 =C2=A0 2169288 2169176=C2=A0=C2=A0=C2=A0=C2=
=A0 -112
cross-canadian =C2=A0 x86_64-poky-linux-gcc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 2165216 2165112=C2=A0=C2=A0=C2=A0=C2=A0 -104
cross-canadian=C2=A0=C2=A0 x86_64-poky-linux-g++=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 2173408 2173304=C2=A0=C2=A0=C2=A0=C2=A0 -104

Regards,
Deepesh
>
>> Signed-off-by: Deepesh Varatharajan<Deepesh.Varatharajan@windriver.com=
>
>> ---
>>   meta/recipes-devtools/gcc/gcc-common.inc | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-d=
evtools/gcc/gcc-common.inc
>> index 8d95698743..3793aff0a1 100644
>> --- a/meta/recipes-devtools/gcc/gcc-common.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-common.inc
>> @@ -144,3 +144,8 @@ remove_sysroot_paths_from_checksum_options () {
>>   cleanup_installed_include_fixed () {
>>          find ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include-fixed -t=
ype f -not -name "README" -not -name limits.h -not -name syslimits.h | xa=
rgs rm -f
>>   }
>> +
>> +# Disable splitting debug symbols into separate -dbg packages for SDK=
-related gcc builds
>> +# (covers both nativesdk gcc and cross-canadian gcc)
>> +INHIBIT_PACKAGE_DEBUG_SPLIT:class-nativesdk =3D "1"
>> +INHIBIT_PACKAGE_DEBUG_SPLIT:class-cross-canadian =3D "1"
>> --
>> 2.49.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#222417):https://lists.openembedded.org/g/openembed=
ded-core/message/222417
>> Mute This Topic:https://lists.openembedded.org/mt/114885056/1997914
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--------------QjUdhb4C7A2hdOefh0C3UT24
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 57SA2AHk2656814

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 26-08-2025 08:29, Khem Raj wrote:<b=
r>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1so8YHaBFxw1SJq87Q4siPcTSY=
9kaoXzDqhOTcAGyWH8ZA@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Mon, Aug 25, 2025 at 9:51=E2=80=AFAM Varatharajan, Deepesh via
lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:deepesh.varatharajan=3D=
windriver.com@lists.openembedded.org">&lt;deepesh.varatharajan=3Dwindrive=
r.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">
From: Deepesh Varatharajan <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:Deepesh.Varatharajan@windriver.com">&lt;Deepesh.Varatharajan@windrive=
r.com&gt;</a>

SDK toolchain binaries (nativesdk and cross-canadian gcc) currently
contain a .gnu_debuglink section pointing to separate debug symbols.
These symbols are not required in SDK builds, as SDK users do not
need production debug information on the target, only the compiler
and headers for development.

Including .gnu_debuglink increases disk usage for distributed SDKs
without providing any benefit for SDK consumers and so removed.
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
I need to understand the problem a bit better. Is the system not able to
specify ignoring debug info from SDK, if we include debuginfo with the
 binaries how does it change things ?</pre>
    </blockquote>
    Hi Khem,<br>
    <br>
    <p data-start=3D"67" data-end=3D"396">The <code data-start=3D"71" dat=
a-end=3D"83">meta-mingw</code> layer currently sets <code data-start=3D"1=
05" data-end=3D"140">INHIBIT_PACKAGE_DEBUG_SPLIT =3D
        &quot;1&quot;</code> in its <br>
      <code data-start=3D"148" data-end=3D"178">&quot;gcc-cross-canadian_=
%.bbappend</code>&quot;,
      which results in the <code data-start=3D"201" data-end=3D"217">&quo=
t;.gnu_debuglink&quot;</code>
      section being <br>
      stripped from the cross-canadian GCC binaries. This behavior leads
      to inconsistencies<br>
      in the generated SDKs depending on whether the <code data-start=3D"=
365" data-end=3D"377">meta-mingw</code> layer is
      included or not.<br>
      <br>
      <span data-teams=3D"true">So the idea is to make this behaviour as
        default in the gcc-common.inc file for both nativesdk <br>
        and cross-canadian GCC.</span> To ensure consistent SDK behavior
      and to reduce SDK size.<br>
    </p>
    <br>
    The below are the differences in binaries :<br>
    <br>
    <span data-teams=3D"true">&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &n=
bsp;&nbsp;
      Binary&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Before&nbsp;&nbsp;&nbsp; &nbsp; After&nb=
sp;&nbsp; &nbsp;&nbsp; Diff
      (bytes)<br>
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
      --------------------------&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --------- &nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;
      --------&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -----------<br>
      nativesdk&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; x86_6=
4-pokysdk-linux-gcc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2165192&nbsp;&nbsp;&nbs=
p;
      2165080&nbsp;&nbsp;&nbsp;&nbsp; -112<br>
      nativesdk&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; =
x86_64-pokysdk-linux-g++&nbsp;&nbsp; &nbsp; 2169288&nbsp;&nbsp;&nbsp;
      2169176&nbsp;&nbsp;&nbsp;&nbsp; -112<br>
      cross-canadian &nbsp; x86_64-poky-linux-gcc&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &nbsp; &nbsp; &nbsp; 2165216&nbsp;&nbsp;&nbsp;
      2165112&nbsp;&nbsp;&nbsp;&nbsp; -104<br>
      cross-canadian&nbsp;&nbsp; x86_64-poky-linux-g++&nbsp;&nbsp;&nbsp;&=
nbsp; &nbsp; &nbsp; &nbsp; 2173408&nbsp;&nbsp;&nbsp;
      2173304&nbsp;&nbsp;&nbsp;&nbsp; -104<br>
      <br>
      Regards,<br>
      Deepesh<br>
    </span>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1so8YHaBFxw1SJq87Q4siPcTSY=
9kaoXzDqhOTcAGyWH8ZA@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">
Signed-off-by: Deepesh Varatharajan <a class=3D"moz-txt-link-rfc2396E" hr=
ef=3D"mailto:Deepesh.Varatharajan@windriver.com">&lt;Deepesh.Varatharajan=
@windriver.com&gt;</a>
---
 meta/recipes-devtools/gcc/gcc-common.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devt=
ools/gcc/gcc-common.inc
index 8d95698743..3793aff0a1 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -144,3 +144,8 @@ remove_sysroot_paths_from_checksum_options () {
 cleanup_installed_include_fixed () {
        find ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include-fixed -type =
f -not -name &quot;README&quot; -not -name limits.h -not -name syslimits.=
h | xargs rm -f
 }
+
+# Disable splitting debug symbols into separate -dbg packages for SDK-re=
lated gcc builds
+# (covers both nativesdk gcc and cross-canadian gcc)
+INHIBIT_PACKAGE_DEBUG_SPLIT:class-nativesdk =3D &quot;1&quot;
+INHIBIT_PACKAGE_DEBUG_SPLIT:class-cross-canadian =3D &quot;1&quot;
--
2.49.0


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#222417): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/222417">https:/=
/lists.openembedded.org/g/openembedded-core/message/222417</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/114885056/1997914">https://lists.openembedded.org/mt=
/114885056/1997914</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------QjUdhb4C7A2hdOefh0C3UT24--

