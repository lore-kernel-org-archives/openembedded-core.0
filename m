Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCB0DCCFA03
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 07:12:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9421.1762413113102932656
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 23:11:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KXaEHe/L;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34057ce724=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A65mx051421227
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Nov 2025 07:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=df2Hk1J4gQWhV1KHqFXgIFfLNirbRkK7c0gg9vFaTPI=; b=
	KXaEHe/LFKpyWgTts5rC3Ao6zDlMtxG7A9zBaNCfMfzH+H5ES3hJuhUTvD9UZcyC
	44m9vUoYBzxBpHK65M2+XhTupg7AB7eCi1NnQ2n/E/in4NUACXgUdSlenDPgL2dP
	YvL/kkXyqR2J+keGCb2vTQ1avSPrdd+Ji58kLTwc39IlB4fi5Eihb7svMWw9r7xn
	QoMSs4LvEDogrPpahbOwaEgBWphkAP7k+ru7l1QoTovhhV1+cJyRH2d0AZFWA45x
	iFAsIPXUFVTBeSrdkAkvZkn5+YxiC5w62dFiZQkvIyBMf6C4biZ2DR0Utd6Gmywh
	fVXY+xnvJ50Y/c436/iz8A==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010046.outbound.protection.outlook.com [52.101.201.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a89w79asy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 07:11:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KD+fPUBhGqJU2p+T0jY9yrYFfH2qJ0UMgvyzu+djloHQGyQ8CSQbs0svq1sKvNcxKBN4DCC4VlGNgZhN8n4NyFnTK4btiIQ9ZnM7xdsMy+aUBC3lRDDwMYOyRYINK+RxPYjfh/+rVY4CcFbFc4T4GXDMe8h2YBroTYAg1CrQE3uUZWfwUbO3+U8x5lzYPZNpaR/106lQDVxWGYDHPbpJFrAksStH6OmnKLZZ4Eed1+tcoIucijcHy6cu9dXG4r495KbeMgTNFGsiek9fMpKpyK9iemTYeiu1V9X5kEsuDuLogMLEnyDOE3DM5cp0XiWaJ9JsB1it+DhTc4S1EqZGyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=df2Hk1J4gQWhV1KHqFXgIFfLNirbRkK7c0gg9vFaTPI=;
 b=Z74D2krsy1ZetGWmawS4PM3i2hEd60gJ6K2zkPiCoIchv4iFb+1G2/xbl4FujsD1Nm4GeqcCo3nVRVHfZVpuPETjDz+W5T+yVLHOwoLMtnQZlSsyEpOBRiCotSmoNz2hiaWOtK9z5zY9T3hCc+vXg8hhdvIjQRX5w8F+SESKJ6KyyNwTc/uHMoNuXNU4UkDtVZP4lWAjWEiebEMGhKxeChktwtfMdkMdq7nqO9OL0Cz5nPYiMeNOynKl9cvsZgIrSKJ8Rzj27gw29Rpb1s1BplTIl3KwN12q/2ivod7mfIiqNbCtbM15p+JQnbuAZ825zH69njh/dw77Me4Ad4wPVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CYXPR11MB8661.namprd11.prod.outlook.com (2603:10b6:930:e4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 07:11:49 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 07:11:48 +0000
Message-ID: <44cc8316-2ae1-4e62-8201-bb8e1dd45158@windriver.com>
Date: Thu, 6 Nov 2025 12:41:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH RFC v2 6/8] linux-yocto: enable Rust support in
 kernel configuration
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, bruce.ashfield@gmail.com,
        sundeep.kokkonda@windriver.com, elmehdi.younes@smile.fr
References: <20251105130942.833204-1-Harish.Sadineni@windriver.com>
 <20251105130942.833204-7-Harish.Sadineni@windriver.com>
 <c1201fa6-6976-40de-be9a-9ca8dc381535@gmail.com>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <c1201fa6-6976-40de-be9a-9ca8dc381535@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::10) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CYXPR11MB8661:EE_
X-MS-Office365-Filtering-Correlation-Id: 63d62987-2e5f-4f25-eda1-08de1d03c07d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z0YyN0crbFdjVkFkaFY1UWR0U3l2OUhpM21pcTQvU0M0MVpMY0lMenlLL09L?=
 =?utf-8?B?SndPZnRJcTFaS3Uyd3RvdSs3R1A0VGIwb3l6RzVIbVJDRzU0UUppUThLNStO?=
 =?utf-8?B?ckRMYWNZc0hsTkM2QnB1a2h6VjlOMHl3eVBUMFFJaEV3SzhNYzdmejNjQU9q?=
 =?utf-8?B?VWNOSS80Tm5tcDU5WHJ0bmhwd0UxeHd0TVduZU94eWdJOHBNWElkRlRjL0R3?=
 =?utf-8?B?azBnMlRQTlNpWUxwd2VHNnZNMjN2VEVnMEVqbzBhYlh4bklmR2wyMk1HdHJ4?=
 =?utf-8?B?NVhsWFlMeGxIT09wNEl4dVB0UUJKcmIyeXdUR1c5UStiQ2RaZytHd2hMV1RH?=
 =?utf-8?B?VEpVSkJleUJIQlQ0YWx5WjBaaHI3VTJ6b3R1M3RNY041Q0ExbGp2dlZDeW5a?=
 =?utf-8?B?T05UWGQycXN5VHFGVzZUV1dNYVBtTnVlRmREN0J3NXVtUzFvUGpKU2VFOTFY?=
 =?utf-8?B?eWQyQXdTcUlNSmhXVkIwaXpGeEVGWEZEaEsvL21yTU0xbHMxdU5NWEdIRWFH?=
 =?utf-8?B?am1mVjJLS29BRmczT2YrS1ZQaWVxc3dRNExSejc0aEF1TEQ4RjVXaFZ1K2Fa?=
 =?utf-8?B?RVk4Z0lYMU5RaUhCTXdyaTJPT3NHMmIwZGVhSCtKeGJScmpxRDJqY0FiYUx3?=
 =?utf-8?B?ZGFsR0dlUVhDTGpoeFg1emRodk9SakE2aTVkcGtYb3JJOE5LVkhiQlM1VkpG?=
 =?utf-8?B?NWZRZlZ0VTBtOW9iRW9id043Yk42MnNkNEdMWjBYSUhmbEpmM0NFK3RmL0Uy?=
 =?utf-8?B?bXpqL1h5b2xmR3crUjVBcDJGK2phTURnRzhSWE5xWFdEamxLTW5qQVBZRTJF?=
 =?utf-8?B?TEVvcFA1VUFTR1pVOUthL1loN3BYa002amc0S0k2elZleVFwTTIwTnYwTU9C?=
 =?utf-8?B?NU9sSWJwUS9uTDhqYWVmdzUxUVFFRG5wNEVveE1jWnlEQW9JWk5xTTVCRmFR?=
 =?utf-8?B?blFsZkNsOEtlSGhPVVlyckVvTUtuOUZWNFRZMHJQVXNUcVkrN0pYOG5wZ2d6?=
 =?utf-8?B?bTdRRlhyZzAvc2Y1bEJLMDJJemtCbTZKdmsyUlRwb1RkV09nbUEyOWtpdlhz?=
 =?utf-8?B?Z05vUGxkU202MGczNmxVOGNSeUZjOGh5UjdXYlYrU1h2RVFGT2I3TlR4d1Bk?=
 =?utf-8?B?a3lydmJQUmJSYVMvN2pMOHFjTTNadEJucjhtRzR5bkhqYTkzYUhQSXc2ais5?=
 =?utf-8?B?RzRwdi9aUXl0cll0cWtQNXVCanZqemhCV1dGbU5Hc21aaTVVNThvR2kyOUdw?=
 =?utf-8?B?MTJ4dFhiNzVqTithZms1Y25sOGg1QU96eVh1TFNqN0FRTE5LUENJMCtYeldK?=
 =?utf-8?B?OUVySzRydWQ5SlJGYUg0TXVaU0syTmRqR3NnZXFyMkFYcEFWaFlrWWVjSlgr?=
 =?utf-8?B?ODB0b28xTXYrWnJ2RzR3aTQrVUd3SzlXb1VzUS9XcC90bzd5TEh3RG1KRWJu?=
 =?utf-8?B?WkhhbFNzcTcwUmFXNDBWNjY2bS9jVW56MHVCTDhKN1ZDWUdkTHB1YWhPQzNl?=
 =?utf-8?B?M1ZYVDl5emt3OFBNUFV1bWNGODd4bkxBczlWUzFIN2dObzVmTUVvRitFcjZ5?=
 =?utf-8?B?cDdVYkNUSUk1d2djd0ZBMk5BbkcrdXBDS3pnam9BNnVNZWZyWGc5WDZaQ3NN?=
 =?utf-8?B?QkNnU3pHVEx0TlJNYUR6MGQ4UllZeWpUaWVNMXNRY0NxQi9ZcDBTaFovTTZy?=
 =?utf-8?B?OHdRd3pmN0JFbDMzOCtLSXZsTE8valpDUHJMbWhxb0hVQnQzRXJqY2dCM2V5?=
 =?utf-8?B?U1BJeXYxczJSZFBqSndFY3ZDU2VhckJRZU5VbWp6bXA0bTRVQnlqZDlFZStt?=
 =?utf-8?B?MHB4NXVvOU13WlRyZUZyb0NYUXVsT3ErbFFudTVNK1ExYkliNXZVcUc4bmVj?=
 =?utf-8?B?Nk1ueGlwMld1VlljS0RXWVM0eEN0S1YxTnNCMkRweUNiNHZNcGVVYTVRbFVT?=
 =?utf-8?B?YlhHeWJScnNhNFNDV1UwZm1xMG9WZzNMc3pmNmZrVnY4eWhvT3M1WUJLbThp?=
 =?utf-8?B?QS8rWUt5Wmtjc3NOL1RvcWNRTWFlbEZYb0tvYWpqMGdpTUhoTDdxYXpTeWVI?=
 =?utf-8?Q?4VI1c4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U0xIT20ySlg0d0J3VUtLOGROYnlNUFhoZ2pFYkc4SUs0akZDNFRkenBCNjlK?=
 =?utf-8?B?YVNsc0ExWC9MUzcvczJvSmpqN2xJV2NGZGZ2KzlRS2tvVzBpb05kd2diVFZE?=
 =?utf-8?B?OExsM2xBTkZtTGFFbmhGWVZ4UzV0SW5xeWs0ODZ4a2k0YzNTTTVGZE5VUjEy?=
 =?utf-8?B?UEYyT2gycW56MHNYejgyekhpcldTbWRwYlZjVWVxTmx6aXI2dmhnWUNUM3pD?=
 =?utf-8?B?QXFzSmtnSE1RNmVOUzFMZGNGTDBTR1pjekFtODNFbGFhUi9UVytyMTVJc0ZV?=
 =?utf-8?B?Q29wdG5QRHFmRUk5bGhxY0NGMnl3TWk4WHROZ0dKTFpFRTF0NG1QR3FQalZn?=
 =?utf-8?B?TjhXazRtalRsbk1oOG02ZEdwR2t0L2tYSDFKSkhUQytYTDliTE9LZ1JrZEpr?=
 =?utf-8?B?MnFpNU1idFNpMENwTVhHV0ttZ0FZK0lrRkwrRWhDTHlQVkYvOFdndlNxdUZz?=
 =?utf-8?B?OFZiaWoxeU1QOWE4UlNMb0dZbHpHdzhDcVBlTlo3WDZkUnV2eUZ5WktiRWd2?=
 =?utf-8?B?U3BHZzYwWEFvQkxRTGR3TzRqYnhxVHNYZUVYc0kyeDlyNmdydEJiRytUcHBG?=
 =?utf-8?B?YXZ6bFhjdTQ3Q2l1T2VNeU9Zajk1SGNvSzIvNGVtejhhVGNLRlNPSjl6dEx6?=
 =?utf-8?B?N3lna0k0RzBLMFpCTllJN29MTzY3cE96eGc4UjJYZHQ3RWNYbmVPZmVpZ1lW?=
 =?utf-8?B?bEpPTURIVVQ0T1ErQjM0bi9ZVW1BRHZDQkU2ZEpnQmZwZlowVUV4OERScVBl?=
 =?utf-8?B?bGFLdmVsS25MNm5OK2ZsSjVqdFlLZGo0T0ZlWFk2K3JDemN2d3hPTjFkRXBG?=
 =?utf-8?B?VVA3d01JNGxUcTUwN3lZU29nUFBEVERFekhJdklVdlM1NnRXdkR1S29UOUh3?=
 =?utf-8?B?VitQamYyajNybGpmR0RGb2FEMDNnbTZnRTZWREYzTnBZT21IWDF4L09FTEMz?=
 =?utf-8?B?SUg1NkxDQStWcEtPdzZ6cU8zNDUzNXp6QXJVcjdHdFRqSlBuSXZBQk1TSUlu?=
 =?utf-8?B?bXJkd1pKdk5FeHhGM1JxZThkdkpSbDhlZWoxTlB6Ti9qMDVNMUZIT2NaY3FV?=
 =?utf-8?B?Q0E2V2N1SFZwUm9rRHJ3VXlQRi9xakNUVEl4em1VOXdsTzBubmtoM09aajN0?=
 =?utf-8?B?SWU0TE0zNmFrMTUxS3NKM0RKS1ZxN0xrK2xRaGFXeFNzaDlGRmNxWUJjZDFm?=
 =?utf-8?B?NDlHMDdMaVFHcDFKeE1nZW1HbEhuUzk2VHRLelRLMTdoZ3BKd2kxdEFlWFUr?=
 =?utf-8?B?NUM2ZkMwRExrZEZLOHV1SlpkOUFTVWJBeWNUUC9nak1iODNoVDA4Q2IvbWxM?=
 =?utf-8?B?TWlTd016bUhicmM0cW1IcTdoWFlDKzgyek90bE5RbUJxaVo0dHd5cTg2MDdv?=
 =?utf-8?B?M2NUTnpMZG5udFdWdnFWaWJxUkpVOW5YUHllaW1LckhuOWhwekhvSjV5TlFH?=
 =?utf-8?B?QVpuZ3dvMThpMnVwaHBBdFNVVTNRQmNqRnZacnhtbU9IMUFBMm5EcXNsamJP?=
 =?utf-8?B?UjZYeFFnUmxZOGxOby9HcTA5ZnpCRi8rMVdvYzRlditqV3RjdkYwKzhqeTYr?=
 =?utf-8?B?TnRnbEpCclN5bksrTjgrVFY2Z0h2aGxtbFNIbUxPYU03VkM5N1M3K21HV1FL?=
 =?utf-8?B?U29QVy9NK3RHODhGQTBmWTVBRm5zWU1KRkVFN2dCTFBFd3RDbUxyZytpM2lr?=
 =?utf-8?B?a2xFQXFkZXlPVjhld3BDaktSK1JHS1FUQkNZVGxwN0NndGhWdGljYTNONVBm?=
 =?utf-8?B?K2dlWmJmYnd2U3F5bUZzZ2xPOERKc0lWTFFXZ1NwRGxTU2NuNE1oanNJU2hl?=
 =?utf-8?B?VkhGRnhKV0JxVUttSTg3Yk5mMWRYbVJYc3JsTWJNSG9KTkxwYkQyQUVaZ2x6?=
 =?utf-8?B?a3ZZYXE1ZDloVXliTVV5L2dJSG9hVEh6UkNDbExDQU1FZm9DNloyeEVmZVZy?=
 =?utf-8?B?MFRiOGRLREpQcGZlLzZjYmZ5Y1pFTi9ER3pQMG5yWlZLV09od1UrUmJOaWRr?=
 =?utf-8?B?US9qNXM1YjdRKzhBTytsZlVzckRFbjFaSVVDTnJlMFVxcVR1cUEyektLTDJK?=
 =?utf-8?B?c1JxNUlORHo1RG93UE8xbG5VOHJFZ3lZQjFxbjdmNENIZEl6NWh4U3B0Y3Z4?=
 =?utf-8?B?TEN6MzhVK0RhY3dxNHFTaE5SVzdPMXRHUjlMeFZiWDZ6VEw5WmxpZHdFUE1B?=
 =?utf-8?B?RUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63d62987-2e5f-4f25-eda1-08de1d03c07d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 07:11:48.8758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 911tXZJz9jS5C/he0+hXdGNazTtQFhbjTj6VxPvMbUrocacG7Syx6bHgcuQiSGlMcjGIBkQwfYG/kDy59X5rxg6mfsjtHDbnNMBfHvwJ1SE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8661
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: V4-qiBpPFdUxqR7Ulm37N1lQYDtrL-v8
X-Authority-Analysis: v=2.4 cv=FYo6BZ+6 c=1 sm=1 tr=0 ts=690c4a37 cx=c_pps
 a=Sm015RFco05wDkMfClhrzg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=LBrJKkpbrPDllpyLAzYA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: M54SzILy1qScSPoGdlA7VH9HuLgWwobu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA1NiBTYWx0ZWRfXwuh2uyyZDmNz
 Hcu2d27fmBpSj/4dGjccVjoVn9MUSY92852ebNJBQM5hd2jsftyq2z0g0YrMWHDFAqMoNY+KUHE
 kuWTQIyhEn+J+zQXVI0xtkhcEaU1PJiOWk44i7Pu0eGwheTE9FhBDhCjHflThDsTq0V/vYOR1Pi
 u8pQd2o4nQQsX7FT5DZ0cCeZQjkcSPe8/ibwnSsR3UqxRXxY0VcDHON00sjBfj9DKJdbx9Jjq/B
 IC5j60qgussLSFqqpWimNS90aZnf0o0Skf0h7igNtY9Fx5snmEbyZV+7umIENOzvwRGbm9cJT5g
 azSRf3AIRAYP2So6g9Km6vp8GGgJu+9Klm6+tfgkY2FzNQbErSojCNYbZkOxdhBQaIj+iezBoGZ
 HsU/WEFoUtNMBQZ4xXcA5BIhSlRYxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_01,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060056
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 07:12:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225963


On 11/6/2025 2:09 AM, Gyorgy Sarvari wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On 11/5/25 14:09, Sadineni, Harish via lists.openembedded.org wrote:
>> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>>
>> Add initial support for building the Linux kernel with Rust enabled:
>>
>> - Introduce `rust.cfg` to set Rust-related kernel config options, including:
>>    - `CONFIG_RUST`, `CONFIG_HAVE_RUST`, and `CONFIG_RUST_IS_AVAILABLE`
>>    - Rust sample modules and developer checks (overflow/debug assertions)
>>    - Disable BTF and module versioning for compatibility
>>
>> - Add `rust.scc` to include `rust.cfg` via `kconf` in the kernel feature stack
>>
>> - Update `linux-yocto_${PV}.bb` to:
>>    - Append `rust.scc` to `SRC_URI` and `KERNEL_FEATURES`
>>
>> when sending non-RFC version, we will send kernel-config-fragment to the yocto-kenrel-cache
>>
>> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
>> ---
>>   meta/recipes-kernel/linux/files/rust.cfg      | 9 +++++++++
>>   meta/recipes-kernel/linux/files/rust.scc      | 1 +
>>   meta/recipes-kernel/linux/linux-yocto_6.16.bb | 3 +++
>>   3 files changed, 13 insertions(+)
>>   create mode 100644 meta/recipes-kernel/linux/files/rust.cfg
>>   create mode 100644 meta/recipes-kernel/linux/files/rust.scc
>>
>> diff --git a/meta/recipes-kernel/linux/files/rust.cfg b/meta/recipes-kernel/linux/files/rust.cfg
>> new file mode 100644
>> index 0000000000..a884f3cf6b
>> --- /dev/null
>> +++ b/meta/recipes-kernel/linux/files/rust.cfg
>> @@ -0,0 +1,9 @@
>> +CONFIG_RUST=y
>> +CONFIG_SAMPLES_RUST=y
>> +CONFIG_SAMPLE_RUST_MINIMAL=m
>> +CONFIG_SAMPLE_RUST_PRINT=y
>> +CONFIG_SAMPLE_RUST_HOSTPROGS=y
>> +CONFIG_RUST_DEBUG_ASSERTIONS=y
>> +CONFIG_RUST_OVERFLOW_CHECKS=y
>> +CONFIG_RUST_BUILD_ASSERT_ALLOW=y
>> +
>> diff --git a/meta/recipes-kernel/linux/files/rust.scc b/meta/recipes-kernel/linux/files/rust.scc
>> new file mode 100644
>> index 0000000000..4686d9ce5e
>> --- /dev/null
>> +++ b/meta/recipes-kernel/linux/files/rust.scc
>> @@ -0,0 +1 @@
>> +kconf hardware rust.cfg
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
>> index 2188c7fed2..33bd8a92c3 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
>> @@ -77,3 +77,6 @@ KERNEL_FEATURES:append:powerpc64le = " arch/powerpc/powerpc-debug.scc"
>>   # Check again during next major version upgrade
>>   KERNEL_FEATURES:remove:riscv32 = "features/debug/debug-kernel.scc"
>>   INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
>> +SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' file://rust.scc', '', d)}"
>> +KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "RUST", "rust.scc", "", d)}"
> Shouldn't this check also for 'rust-kernel' instead of 'RUST'?
Yes it should be 'rust-kernel' thanks for pointing it, we got missed it 
while updating RFC we will correct it while sending v3.

Thanks
Harish
>

