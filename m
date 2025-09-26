Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE6CCAC5AE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 09:03:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.13032.1758877419486346582
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Sep 2025 02:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=dbJlxeXC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1364670208=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58Q5JIow797198
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 02:03:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=rKw/4zRoQQeSPM7EddNVPX
	zcNZsg1HrJ5HNWxRPBeaQ=; b=dbJlxeXCPXO9W3Unbf6UFj6poA19l1pi4cXoox
	V+dMa0eysuwn5VWRgDP58n3txQQVDMj3CHmKznWLVeAt2M0xFRUnMutA2ChpM72Y
	8tfSsJu0uQ+bHbf2KIZnnYaQ8jmIBlfdVLvSR8Z32J3/rXXBnKhbi3bHkhMw8X63
	/HV3cCh30b4cCGaSLtaqgLHv8++jIvFhehygSDX0L9oh1iNYJGimnerIMb6afBIh
	OT9twP/L/YKg/9oJocbDbnCBebUw02ddXvQkon+gOn4XBcOjaM2L4lmaOZNKS6eH
	4c6b1WLRDx+cZhU1WKfHXiSQOMUtIWqT6g9eZOGnlYoy8pIw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012070.outbound.protection.outlook.com [40.107.209.70])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49dbse0kx4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Sep 2025 02:03:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EGR+MfbaMkVMMzBl/k/YdKRIV5DjKYI5WXx0zfOSSdHUhTPP3u49IjqbnIJwbWBb5VnIn3HxY4O6xfv7ocoOzUuw9Z0MM9ptrjNFOKs64NARLcoSwsP0fk60+x48z/vaUIHTEpky5l14ricO/oZoKfoFkyCsqKpSuJAi6G/nSdhh4svMuWqy6hCbZSSv/FE8N8JT2CuQ6uk6GVqfQDNMa787ny0XGoepSyOo4TAJxUDll/kRXs1Mi8utxSdtPufcH21LqN1vOr5ClH6azybT7UZfI5JIzGUTmI911b/HFgRdSOQFuJwozF5cL4t6qSxjk56RkkIJlkLZ6nj+wutEjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rKw/4zRoQQeSPM7EddNVPXzcNZsg1HrJ5HNWxRPBeaQ=;
 b=BMYBktkqpHyNm+ItGuhhzYGmJ+l+8Rtlhhmw6bSpo92Aoy3yX9CVPRLiplOE+Do+FQsdeC/qgev0MnH4+LyI3zHDdZ8h6GD5vHe4YguaCBA7Rv07D7kYZ0RUxZejgG4qRMKgeIXEPJkRbHzekXiDz0ataCb8JU8Do6O7JZ7AHOEAF7bcy3VCmBDg2608JSFRrvNUmiDbMMDu8q3x9PLDKGBpp7u8voZlzX+Lbjtf+V8eaJrFHdgOM9bIeAho+3o7MGpR+L/UoZYRO3k+mh96x2m4W6zQG1atGkfBnn8g+hrf7acRXzQLn75E6e5W+TQDIltd/X13Fwg28NaSpqt+Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by MW4PR11MB7006.namprd11.prod.outlook.com (2603:10b6:303:22f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Fri, 26 Sep
 2025 09:03:35 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 09:03:35 +0000
Content-Type: multipart/alternative;
 boundary="------------oYxiXI5FMkiz6agGUr00hyZe"
Message-ID: <80e911a6-ff3e-4f2e-ac0d-6f6043d43670@windriver.com>
Date: Fri, 26 Sep 2025 14:33:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rust: Drop rust-llvm use clang instead
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
References: <20250926071158.3439500-1-Deepesh.Varatharajan@windriver.com>
 <CANNYZj-=rkw_rpYXK9FA5wQDbXRXthUk2y_LWRs4Mym+_em6iw@mail.gmail.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <CANNYZj-=rkw_rpYXK9FA5wQDbXRXthUk2y_LWRs4Mym+_em6iw@mail.gmail.com>
X-ClientProxiedBy: MA1PR01CA0180.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::18) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|MW4PR11MB7006:EE_
X-MS-Office365-Filtering-Correlation-Id: 660a46d5-caad-463f-fbbb-08ddfcdb92cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?K1VLa3lBbTFzSXd0dVM5VTdSSXlDRXdBdDQ1eTNqUHVsWThwdWpSczJxUHUw?=
 =?utf-8?B?Z1VFTVRBRWZ6RGxCQVBaajRVY0xyNzFFQTJxVnF5S21HTExIbXRLWDdKTGxN?=
 =?utf-8?B?R1F2UTlhZXduWTBLMDlTdlN0M2Z2Y2hBenVmTjkwY2N1YXBCZ3Y3WDk1eGk4?=
 =?utf-8?B?dVF3VzZpR0VEclBoakRnR3R5S2FURzRDd09IdklmSHlNdVk5ZExSV2FVWnNi?=
 =?utf-8?B?QnpHTFpYZVFjUEgwU3pwNnZDR1lMWDQ2eG4yNjFNQ1RRS2s1RGUzR0xjVHJN?=
 =?utf-8?B?NFErQ0o5RVR0eEdESmtNanV0bzhoUVRkb0o5UklHMzEyNjI3TS9VUk1iQ3Uy?=
 =?utf-8?B?TkRueG1oeUJISjVrRnVwaEFjQWdPNVFMNnRGYVQ3ZUNnVTUxenZ1dHR3WlFh?=
 =?utf-8?B?VWk0Q3h2c1dHYnZ1SHAzTWtVN1FVYTJ1RGdIYnh6N24rT3JTcDBvdEh1VGdq?=
 =?utf-8?B?WjhweWc3dGgzUFVPTmFvaC84Q1pySUpzdjN4dGowaW1saWZQREVDQ2swNlQ0?=
 =?utf-8?B?Syt3STcrV3B0WW9ORFBzdlhYQ1ZBRmEyRjQ1VDNIeE9QSTRZV21GWTczdjc4?=
 =?utf-8?B?QWJWN2dERkV5QnhPZmh2MG95ZTV6WmF5RjB6K1l4NTV1RTFiTlpscitsL0x2?=
 =?utf-8?B?bVhnWWMvUzJ4cDA3aFVlR1J1UEVCR3JCMkpyejVFRGwrejhnMlFKWm1ZUFE4?=
 =?utf-8?B?c1FJUDd5WWhqd2ExangvNjJvTmVpR3h5eENRM0tISTlFMG8vVWVGWWU1TWVW?=
 =?utf-8?B?K0NsZUsrODFvWUZOOHo1a0JuZnVqUGQ1MGIrcW13R0hHWDhzSGZCTUI2dURB?=
 =?utf-8?B?OG5mbG44WWpINjB3dnNFaEg4aTk5SlhvUVBqT3ZjS1ZiNitSRVVSNjQwV1hB?=
 =?utf-8?B?bnJFaVNzSGZKWGo1T2lxOFNqbVQ5ZHZkbG5jaFZUdW9MYlZpSmV3YkdMWHh0?=
 =?utf-8?B?ZkQ0cHlUOGtyZ2lORnd4N2ZSYkRJR3NtL0Qrc0hvQyswRnhTN1RiYi8vY1l1?=
 =?utf-8?B?NVN5K3hKSHJSMUpJTmRWT2JhbEtQaXRsUmF2OEtDVCtnQUo3bkNqMEhWUiti?=
 =?utf-8?B?SnpONDhtZlpkb3FqbnJSNGVoaWUrODFBVm0raHRtODEybXBPV1dZTGRMQ1JE?=
 =?utf-8?B?UzY3a2tqcVlpWnpUZ3Y2NGs3SUs0RVRzd0pMTExUc3NiMXFIY3dDckp6MTMz?=
 =?utf-8?B?aWRZY3h4RWJTa3ByY0xKYVNrVlRCQkU0d09La3ZQMG4rN2IwSm92S0xHUm5H?=
 =?utf-8?B?dWdtZmU0V1BrdVFqWW55UERwYVJBR1pDcStsYXBkUHdQNE5nWjlYMWhFd0Qx?=
 =?utf-8?B?blg2c2IzdCtRSGZ5M05CYUZnVGFvbGZqaWJUckJ6eEVlbWRjeUtJZzZIR2F6?=
 =?utf-8?B?dWYrUkQzblhQZzJuSXZ1V1IzVU9yZ0NqMEFVa3F3eTZNTVdsN0VFWm4wY0ZO?=
 =?utf-8?B?dkdwSEJtQm5ZeWE3WG8yeW5TRlhYcHlvUzdHZ2ZycUdhSmVLOFFnRVUrQnh0?=
 =?utf-8?B?OWpXU1FVc3lPbEVZbi92TU5UWTBvR1cwL0tRVGpzalNBWlA5Tjkyc0QwK2h2?=
 =?utf-8?B?TkNTQkFGMER3WVhaNytYT3hrUUoyaU9FcisvRGs0WEdVWHU0aUZlcnBqaVJ3?=
 =?utf-8?B?MjJ4dVQxd3lYeC9tRERxaUFHQkc3dXpjakJvZloycXZMV0pmM1JSZFMzSDE3?=
 =?utf-8?B?dkVvWnZUWVhYRkxsY0QwQWlzcDd2QU9zRUVxU3V3dW4xaFkvREZqSllnWDVX?=
 =?utf-8?B?RUtqNmhYR2I5L01aanFrWHVOSHlzZThkT2cxLzl3aDJkanpmRGwzSHpiYXl1?=
 =?utf-8?B?QStkZjBUSkd1NjcxWElEZFd4VnJNeGd5SlVuMlJPWUlHeEMrR1psSUhsOEYv?=
 =?utf-8?B?bVhZYy8vVTQrYW9laU9ra0tva3ZuME5XT2FqWkVJbHVkdms0Y3gxbUo1R0VE?=
 =?utf-8?Q?fN9r09zLChAJb7YKCyGSaBrb9icfdBZE?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YzNSck9mYk10d3pJVTNJbTZZY0tNOG5sQjFLQSs5aFQvcC9leFh1MFhpdFBM?=
 =?utf-8?B?UVpIeEYzRGFiZk45QmdNbzkvSHBiazMzdTVUa3J5Umxjc1dNdk8vR0JiNFBv?=
 =?utf-8?B?Q3cwZWFJdEQ4QUJkY2loOFpxVVRUTGNJSFl3SzRFa1RpeXA1SHZVVDBvcTFG?=
 =?utf-8?B?VE9hbzFYUDc1R2Zqcm1DV28ydXhmRzNETy9Na2xjZThDT3VRYVViR3dmRWVm?=
 =?utf-8?B?WDJaUllOUTlTMXZpcEExLzJWTC9DeWhSVHFGWm1LZEVYMkxJV2JSY2RDdTJE?=
 =?utf-8?B?b1NnWUdvSDJFa0VFUk1yeXpoRVRzdUJHU1pQZ0QvcFRBWkROWkZSaVZmVkQ1?=
 =?utf-8?B?Ti9wU0U3UEkrSWlsY1crclB5cXRKK2FQaXArKy9DWXNzZ3libWhSaE5ld0xr?=
 =?utf-8?B?THFyK1ZEeDY2cjNHMU1yUGg3ZDlkTmFqRGlXMWJyZ1lCWDNEc0FKbmdIbXZl?=
 =?utf-8?B?eWhNOEpodm1meVNzUy9nZ0xhamZ1OGFCS0VjZjd1aTQ3ZTZQWDJBcFZTWUtG?=
 =?utf-8?B?OGhKaGw4bktPZitCZFMwNktKTlpBa1FQZDRyekhCazBHVXh6b09EaGNvSnlR?=
 =?utf-8?B?VTVLdG5ZNlA5cTRjNytVRmNIUjFaZDF3Y2FialN6WVZpZHZJN0xuOEVYUEFi?=
 =?utf-8?B?QkdaNmI4ZjY3YSsvSjRQNnAybVJDeStKWEY3NkhXR1ZySmxadGI1cno2U2VL?=
 =?utf-8?B?ZElQVUxUQUpnUTFoTW1yQWVrWnUvMStidUhOUXRSYlpJV0VOMHQwM0l3OU5j?=
 =?utf-8?B?MmxZQkk4bkoySTY4TFNhd2hmSjFGdkJ3d3RIakpSMGcySU80TXJuT1UzN1hT?=
 =?utf-8?B?MGZlK2luMXZkM0RZYVdaVUljRHFUZjNQS2dacURsVUlxc1Y3MTdKSFZIWHBo?=
 =?utf-8?B?WFRwSFdwd1BSYWxCbnJ4alhKME9xOW5iY1NqTjNYTGlNUlRzc0dzcXNMNzZY?=
 =?utf-8?B?R2ZmNnhHM1RzZWJoM29lQnJvcTRERGpydTlQVWFCbWlHVWhhcndIeTlBZDFT?=
 =?utf-8?B?VkhRTXdpQVgrd0tEd2xzaXk5b0xnamJqbkpVNWJxb0VPajZJYXM3UVBza3B6?=
 =?utf-8?B?S3M3WWw3bStiZ09kSWZ1aTlXbXNVbG1ibGRWMzF3V292Tm5wTzZZS0JNNjFF?=
 =?utf-8?B?WTFsclFwa0xDWkZSTkoyUHprUElZMmw0clB1b0Y4Qm9vbHg5VlViWC9FVmNX?=
 =?utf-8?B?NG5RUzN1NDZ3RHVtdjA5bkwxdG5ycHhoazhjZkhYMUVUZitnM29lOWE3Y2lK?=
 =?utf-8?B?WS9yeHlETFJWdmFMRXdCTFBaTldNVWFKc3Q4Y0JiNEtSaDNNcWVUMW5BSzdR?=
 =?utf-8?B?R0ZxdkdSS1hYMFBabmVsYVVWdlJTUVBtaWVITHN0SXByY3VCeGZoekN2WjlP?=
 =?utf-8?B?ZEFLQzlpMnp6a2grM2IvQjQ4cGhBazVyRnFuNjlFQjNXYmZLU1FIOGxXNlhj?=
 =?utf-8?B?N0FCVjhRQnFqdHp0ZHJkc0s0YzJWZm02eCtXVm9tUEJqVXFnQ3Y2ZFBmQUVC?=
 =?utf-8?B?VG03cUZMR1B2Kzd1NTE3bCtXazhNd29mSnhrSWRUa01FNVliSThucDB4Zmln?=
 =?utf-8?B?VTlWWjMvbEIwcTdGL0tKdXZqaTF3K1BVdEE1Y1NxZTFxbE1Gd3lsOG5qV1Qw?=
 =?utf-8?B?bnVJOGo5SHFMaDBSZFJJbHk5UmorMTV1ajVJME1kY0VwY3FZd3Iya1pDdWdk?=
 =?utf-8?B?THlSZXBYams1N20xVHJOd0ZmWXpySGhQVE0wWjdtUWJqdjMvRVdvZlZuMGc2?=
 =?utf-8?B?YkcxSVRUT2V0d1lScW9iSWNiYXU5WmZJcXZKNnJTT1RhanJCZG01YTRyVmMx?=
 =?utf-8?B?bHVuTGFkVFZHOFJkbVlpcmo5c1M1QU5rYmxOMGh0UGJuQm9Tcy9KWW54M25W?=
 =?utf-8?B?U2RJMW9EOFpCcS9vZEpZU2JWQlhmRmxCQUVJaE51ZmMvRVN2S0lXODFHKzVR?=
 =?utf-8?B?eHlsMmdod08yRTNtcXhyYkI4alRvQW92bmJpZWxsanNudG5oSHUzZEtoMXhy?=
 =?utf-8?B?OGF2R2poNkpFT21NaUpyU1dHV1Z4SGdrd0ZEd1A2MGFDRGJLT00xM2U2REJD?=
 =?utf-8?B?Y3BQWUNTVlNVcTdPNU5LS3VCN0dKeFVrS1NoTEFHVGN3Q1VwZ3BtKzM2a1JF?=
 =?utf-8?B?ajgreWQzSlFDa2wxMmFocmE3U3BqenNKOU0yQ0tBN0huNkR4M3dRMDlSdEFu?=
 =?utf-8?B?Y0w1cE4wMFErQmx0NUpwVk56UWozYkhQVTRYSnZyMFBrcFlva0tpRkV3eitv?=
 =?utf-8?Q?U9u3jkaPGVbydZu2g92TYLGKR+Js71etwViS582eRU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 660a46d5-caad-463f-fbbb-08ddfcdb92cd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 09:03:35.1593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 01CF+uyRNfkFlGm14/1PQjHl+X9fqC7AtR3JdLlGN3uGCsLn9Ilz+fnMiBDabPjdHCs0anmqke66Er3gwAIl1YiqFZQo/uBRrapDQ39kYuuj54fBYNbXaOW8FgBaU2yf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7006
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: xoFb9N8e28bgNDkfpVn_T0UdoAOvuaN5
X-Authority-Analysis: v=2.4 cv=NanrFmD4 c=1 sm=1 tr=0 ts=68d656ea cx=c_pps
 a=c7CpAOS9Jb82g9OYW51qCA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8 a=4HU2q5DpGzFrf7VEgyIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=yj-aMKAYKbz0kkd27lYA:9
 a=ENleyKNTu1KH86yf:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDA4MyBTYWx0ZWRfXzaGk0GH1ktQ5
 NBouJxOhSlDS4qFdi2sgwMk+Qf73+LxkGHPciXpw8hmR9QqrSXHShbzMJJ6paOvEtQwUlcQi3z/
 G7F7IK6ap8rlTmVJGrNneuEDNJB1Sf4rB3YQswqzUTtuE8a/yHaVb4o549NNWRbvJKfJpmxRJPC
 SgKTTgcn+jZbeo2bP60ZWr5tM3/J5KYBa961WE4LCcxOGu73FizFX6jHoJJuguce5s+EGUX95Xz
 e7B25ru+Kit6u03MB28i2S71Jw1sl/e5S9PneJTSTN4XTBNfC9orEdqPME+hsUC9biyIoVR33xl
 nFo8iIo2nG3fchhQOgqqD0Azznqz/adIiOPt/1x6p/h3NH6UbJRZQMfk/SA75dHt7+cWXFF+Lii
 wH2l0Z/LZIXbKJnyuzCylJrRj35qTw==
X-Proofpoint-ORIG-GUID: pqpR1BBA-F8VMosWF_Jz8PKfRhoKx-dF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2509260083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 09:03:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224065

--------------oYxiXI5FMkiz6agGUr00hyZe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58Q5JIow797198


On 26-09-2025 13:08, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Fri, 26 Sept 2025 at 09:12, Varatharajan, Deepesh via
> lists.openembedded.org
> <deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>>   meta/conf/distro/include/maintainers.inc      |  1 -
>>   meta/recipes-devtools/clang/clang_git.bb      |  4 +-
>>   meta/recipes-devtools/clang/common-clang.inc  |  6 +-
>>   ...-gcs-instead-of-gcs-target-attribute.patch | 66 -------------
>>   ...r-sort-ClassInfo-lists-by-name-as-we.patch | 31 ------
>>   ...-llvm-allow-env-override-of-exe-path.patch | 33 -------
>>   .../recipes-devtools/rust/rust-llvm_1.90.0.bb | 98 -----------------=
--
>>   meta/recipes-devtools/rust/rust-source.inc    |  1 -
>>   meta/recipes-devtools/rust/rust_1.90.0.bb     | 18 +++-
> 1. Can you please split this patch in two? One that switches rust to
> use upstream clang, another that drops rust-llvm recipe. I'm not sure
> we should do the latter, having two patches would allow separate
> reviews.
Sure I will send a V2 that splits this patch into two patches.
> 2. There is an upcoming patch from Ross that splits llvm from clang, I
> guess this would have to be rebased on it first?
I=E2=80=99m not entirely sure , but as per Richard=E2=80=99s earlier sugg=
estion, if I=20
have the patch ready, I should send it to the mailing list so it can=20
undergo some testing.

I=E2=80=99ve also rebased these changes on top of Ross=E2=80=99s poky-con=
trib branch=20
that splits LLVM from Clang. The rebase went smoothly, and the build=20
completed successfully without
requiring major changes, the only adjustment needed was to depend onllvm=20
recipe instead of clang. Given this, would it be appropriate to send a=20
v2 now ? or should I wait till Ross's patch to merge first ?

Regards,
Deepesh

>
> Alex
--------------oYxiXI5FMkiz6agGUr00hyZe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58Q5JIow797198

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 26-09-2025 13:08, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CANNYZj-=3Drkw_rpYXK9FA5wQDbXRX=
thUk2y_LWRs4Mym+_em6iw@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Fri, 26 Sept 2025 at 09:12, Varatharajan, Deepesh via
lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:deepesh.varatharajan=3D=
windriver.com@lists.openembedded.org">&lt;deepesh.varatharajan=3Dwindrive=
r.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre"> meta/conf/distro/include/=
maintainers.inc      |  1 -
 meta/recipes-devtools/clang/clang_git.bb      |  4 +-
 meta/recipes-devtools/clang/common-clang.inc  |  6 +-
 ...-gcs-instead-of-gcs-target-attribute.patch | 66 -------------
 ...r-sort-ClassInfo-lists-by-name-as-we.patch | 31 ------
 ...-llvm-allow-env-override-of-exe-path.patch | 33 -------
 .../recipes-devtools/rust/rust-llvm_1.90.0.bb | 98 -------------------
 meta/recipes-devtools/rust/rust-source.inc    |  1 -
 meta/recipes-devtools/rust/rust_1.90.0.bb     | 18 +++-
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
1. Can you please split this patch in two? One that switches rust to
use upstream clang, another that drops rust-llvm recipe. I'm not sure
we should do the latter, having two patches would allow separate
reviews.</pre>
    </blockquote>
    Sure I will send a V2 that splits this patch into two patches.
    <blockquote type=3D"cite" cite=3D"mid:CANNYZj-=3Drkw_rpYXK9FA5wQDbXRX=
thUk2y_LWRs4Mym+_em6iw@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
2. There is an upcoming patch from Ross that splits llvm from clang, I
guess this would have to be rebased on it first?</pre>
    </blockquote>
    I=E2=80=99m not entirely sure , but as per Richard=E2=80=99s earlier =
suggestion, if
    I have the patch ready, I should send it to the mailing list so it
    can undergo some testing.<br>
    <br>
    I=E2=80=99ve also rebased these changes on top of Ross=E2=80=99s poky=
-contrib branch
    that splits LLVM from Clang. The rebase went smoothly, and the build
    completed successfully without&nbsp;<br>
    requiring major changes, the only adjustment needed was to depend on<=
span style=3D"white-space: pre-wrap"> llvm recipe instead of clang.

</span>Given this, would it be appropriate to send a v2 now ? or should
    I wait till Ross's patch to merge first ?<br>
    <br>
    Regards,<br>
    Deepesh<br>
    <br>
    <blockquote type=3D"cite" cite=3D"mid:CANNYZj-=3Drkw_rpYXK9FA5wQDbXRX=
thUk2y_LWRs4Mym+_em6iw@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

Alex
</pre>
    </blockquote>
  </body>
</html>

--------------oYxiXI5FMkiz6agGUr00hyZe--

