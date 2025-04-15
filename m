Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF38C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 15:53:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.23720.1744732304060861549
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 08:51:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6200f38ec5=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F5GJqc013038
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 15:51:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45ydd1knm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 15:51:42 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53FFpgrx003038;
	Tue, 15 Apr 2025 15:51:42 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45ydd1knkx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 15:51:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BSJ0qUy5VVzJRk5xcUT3g5atZlwEaBV1CVHzSTf1EvOHURqwRMC8e0nJQM7fSRyw+JG7oR0RjDbpW+AhHENxSvWPT5uBgH5PnGT9bhOYO6Gu3AxGVKXka2dVRLPlMH0hSg/6Y9AzuSYn7sdiWesgHkgoUVrCF/1/bY1dTV6tmbntSTVF70L9zCIIz2A1I7HMJIBZ5PpU13NgiwTwSQ468CwoHBuBsfdZpWeJap47Fk8HovEPQpyCA56qjr6Zvo+RzDT8q/+C6S8bh8D/JqqoaO00n0is9so2cnQavuf7pMS0Ohg+IOvgcOd02YCfE2hrK1Tf8lbFp2LoyWn2e//2+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AeHDYMglzDPcC5knEjXHp0faFfLilmkxWCRmlLiCsmA=;
 b=eOFnlOfbdMIiepcbT0S4+5MPvpVNNXPpF+x+WdCxjU6LPqgrMwR1FVicbkgTdLGzR7ZkHjH94aeUElg0FXqFGvYq2vy8pUgeRQwZhs/Qlu17ONCoF2GnSIabOKS/+e9IHQMVEuH0tEV28dvUD+mHJhpw0LwzSNaJhRZR41mBudnhO/f0DR3uRNLAyB4HF4BrjN/WDKwNMpX1pWwjSK+4GJU1ok5oUIFpYa8QrnOuZEZMrEdVBbMJwHoWYTrK0P2CbPCV8Z5QtvtAKP9qi5hM8W2vLQRrSq3xlNAr75J2FZBfK+KYfz2gDPKhniprAi0badlvrrXKP4RQPsEf1h2abw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by CYYPR11MB8408.namprd11.prod.outlook.com (2603:10b6:930:b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 15:51:40 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%3]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 15:51:40 +0000
Message-ID: <7c828e04-47da-42a3-aa3b-0893efe6ab87@windriver.com>
Date: Tue, 15 Apr 2025 08:53:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 2/3] rust: Upgrade 1.84.1->1.85.0
To: Martin Jansa <martin.jansa@gmail.com>
Cc: raj.khem@gmail.com, openembedded-core@lists.openembedded.org,
        Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20250331055424.1978243-1-Yash.Shinde@windriver.com>
 <20250331055424.1978243-2-Yash.Shinde@windriver.com>
 <CAMKF1sowYqhv29_Him+th4PkxvGG2FkEzeWmM3fgYzUeKpHqSQ@mail.gmail.com>
 <CA+chaQcn9EfvFMSEmBPnCu3duzwY=cNXzwXVGPBNSP7n-9SduQ@mail.gmail.com>
 <1d01500d-39e2-4578-9fc0-b8c7c231e6d9@windriver.com>
 <CA+chaQf_eWJgp9QVKQQ9iGviZU54Zc_1h-LyWW2yurWf06zCLA@mail.gmail.com>
From: "Yash Shinde" <Yash.Shinde@windriver.com>
In-Reply-To: <CA+chaQf_eWJgp9QVKQQ9iGviZU54Zc_1h-LyWW2yurWf06zCLA@mail.gmail.com>
X-ClientProxiedBy: PH8P222CA0029.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::7) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|CYYPR11MB8408:EE_
X-MS-Office365-Filtering-Correlation-Id: c0c2e64a-cafc-46d5-b728-08dd7c356951
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QlRzT1dHc1NYWlNmd3lpeTZOVXltRENLc2srTUVwR2toZ0llQ3EybWdDaldz?=
 =?utf-8?B?RGFEbEhzeSs0SEhaTXJTNlpBNG9FT0xVeENubkpBbC9DVjFZRGQzNlZ5ZXQ3?=
 =?utf-8?B?Lzlma0I4WnBobWtpZUdTak5YaTc0OGVaSFFOQzFBRHNNeWZ0dXNmMFROb0hY?=
 =?utf-8?B?eUJwOHR4Ty9DNzRvMjhKbFRjdEZIVDI4WGljQUtNYXlnNUxCSjdwNndZenU1?=
 =?utf-8?B?aWRqV0hJRy9tUitETUQzQklMWjVaa0g4NHFyL3BRbWhoRGgvdDBRWmRTVlk4?=
 =?utf-8?B?VUd0emgxZ3JNYU5TVkxZd0FXaEUyVGM0cEtZTDF6ekhxM0puNmd3bWpac1Vq?=
 =?utf-8?B?cG5tcG4yaENJRFgwSjdyOHI4T2FiaUxwMi9SZGROSEhzeFFHQnBTeC9xY1k3?=
 =?utf-8?B?UGdTNmNBNEtXUXo5cUw5dmVZcFJaa0Y0R0tRS0JFMHZ3Mk9yZHhwNFYwdkE3?=
 =?utf-8?B?d25sVkR1MzF6N1VOeEY1K1c4eXhtTFQxbkxROVVEckNtQ0orNTBHeTBYaWFm?=
 =?utf-8?B?cHg2eG9hM1lOSGhkcW95SDZxblorZ1c5THU1ZGF0WWd5NWJoNE9pWkU1ZE1G?=
 =?utf-8?B?QkRNRWlpeTFjZVJIclVqN1FabzRFT0JzT0lNbWNSZEY5amtlUVJQZ0d3UzQz?=
 =?utf-8?B?ZEkvRzcrYlZrREZ4cyt0WlQ3eDlnRUdTT3FrMEYzT3B3SVVpVVZxbFpDRStC?=
 =?utf-8?B?czQybW9nYWo0cDZ3djdDaW40OVg4bzZtc0VvWEN4NGFnRGtnNVRaMVkvMURq?=
 =?utf-8?B?WVJaWUlaS1docElUcHdUSTRUejBDK2dmNlh1S2wrdkFKemZ5TlBaUGIwekVC?=
 =?utf-8?B?dXVVQzBabmtwS21LbEYyYkJNMzJYR1ZzWFUxV2M4cVhKaDJPenFRWUZzdEZz?=
 =?utf-8?B?TFV6SUhGREpJcHlVRHB3NEpNYWw3Z3BISVFKd1hJSDBvNnY1WERYRElQeE1p?=
 =?utf-8?B?OVRubjEzdCswV2I5UXJOL1o4TG00VjZaWFlkZlk4TmR4c0VwSWtSY0I2dU1I?=
 =?utf-8?B?RUVHTUVncWMvTk9SZUl4UnFZN2lhZmZJQnkxb1dPWXJBd1FEblpleGs0YVNs?=
 =?utf-8?B?eHJnWjYrQzZFT0R1YVlIWjRJTGVjQkI5K2VDTUVkdUFraDJCcno0aWtHZlpo?=
 =?utf-8?B?SWsxQjVEajFzT3JHRWREMDVqZ05VcEx0bzFsbnJId210RkQ2S21Raytibzla?=
 =?utf-8?B?NWM2a1BKcVNiQ2R2T3VBN0RCbUFxeDlpYTI5REVRK05YM202aUNPQlhzem4y?=
 =?utf-8?B?bHZ2T3UwaVVzQmNWRlc0a1Z0VXN3blRlZHZXNGNRWEQyWHhzQXgxOHNTTURq?=
 =?utf-8?B?WWdsclJEY2phYS9YbEc3ZVV6a3FBbENUK1VWZENtZHFURlg3Rm82TW00bUgv?=
 =?utf-8?B?M1Z5a2xXaGlBeDJYbDdnSVNxL1FWcDJkcWY4d1l4Zk50UW5xNHAzWXBMbDJz?=
 =?utf-8?B?SUN2SEViT2pmMlVPeDlWbTFkOXB0V0xLVjZuNzVpRmo3S3NNK251eWJsS1Zo?=
 =?utf-8?B?OWExdDB0cFVJTEtISktJRG9nR0x2VGF1d0E3ODJuSXNQWGRSdEhFU3lTS2d4?=
 =?utf-8?B?aFB6QUVkamFnSTliRjI3elNpU2dSUk0xN3FqTjFqZFNKa2dOUzdqbFMvRTZ2?=
 =?utf-8?B?QzAvd1pUdnZaN3V6YTVrWG54SnVjcDhUUVhEd09OTHZsSVh6Q2ROYVNZcjlE?=
 =?utf-8?B?TWZHY2ZqNU5ySG9UOGZUbE1JaEJMU0JvZldEVC9RcHZYZk1MOGlTb2s0NFRP?=
 =?utf-8?B?U2taWmE0NGV2NThPSWRiekFqQUsrQ3lOWmF4ZXhIaFM5enpzRFlod3k0Tmcx?=
 =?utf-8?B?RjhsK1RjSVByUG5udVgyeWVBWlZxeHJvT1R3VFQvOTY0V3N5dGRlRzJ5QmFG?=
 =?utf-8?B?TGk2UWlaSFdBazFFOCtVNzl5dGkzTmJYTFRpRWlyYUZocDJDVTg5TytSOEtZ?=
 =?utf-8?Q?66irKQduXgs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b0dTQjQ4UWhtWU51a1JDOUVVWWNIZmJSMWNZak04dmp3ZkdLV2hJMUtZZDVV?=
 =?utf-8?B?NUNHSlVRYWc4ZXF6KzdwWVlTUnhYZFVQZC8zS3BvWHpZbFhkTFN4Z3hJaEJT?=
 =?utf-8?B?QUM4QXgzQmY3Y2ozQzJkRlpsMmp0Wndaejd6QXplQmEzTi92Z2hsZnhCTXk4?=
 =?utf-8?B?eEl2cHZUa0ZDeXFYWHp6YWZBMDBpQWlKc2RaQytqeEpNcHBqaWdESEpnVEtE?=
 =?utf-8?B?NTNFTmRGSmNMSTdqV3czREZITGswZVJoVi9uTnZONzNnb2liK3JBcEtSbjZQ?=
 =?utf-8?B?YUY3L3FDVEZ1bDZSeitpOUFtQlhsTElRZjhFSXkxVDNzbHFEL1FSVUxZRG9P?=
 =?utf-8?B?TTBBUDRaLzIxcFhFZTNpZHVtQWpDdGNoNE1ZYjRyazFGcWJLbUJTa3dVRllJ?=
 =?utf-8?B?TnlpN2RsZ2dWVWh0WkZHenpSNFlnRUg1Y0JTUDk3TXFuWXNHMHpoUW1HRmdw?=
 =?utf-8?B?NXltSWJVNjVYdWhoRG9MTW5jcFVQbDhpeXo2cGxmdk8zS1B3b3pFRXZBVStI?=
 =?utf-8?B?UHVDM29Ba2NOeW5IS3NnQUhNZUZkZU9YK0NhVlZGelpBamN4TnQ5MEFvRTJF?=
 =?utf-8?B?ekEyVVdDRVVBRlF5LzU1VWp2dlZMWUhHb1lRd1grbmxkblBaeGN5dEZUbWpy?=
 =?utf-8?B?SDMzMHJ1MU5WZ3hFZm9heHhCWVpTcHZYTlFYMzlCcHFFWk1FWHdJdlhWZDlY?=
 =?utf-8?B?eFZuSUhJcmJDV0hmQ0pZRmNBcHlEYnczUUN3MGhnMXBvS0ljMW84UzVQTEY5?=
 =?utf-8?B?OVJwZkRra3oxbnhHcFhxMEZLR25XWkdwYVZ1YWVjUVRaUFhxWG5Ld0NjM2sz?=
 =?utf-8?B?d2N4RFlPVlJUSVZQVW56cnc4STBJQlZFc2tmd21HZWY4UkR5V2tJSUw0d2pF?=
 =?utf-8?B?aGFHTkhpQ2tvejdpS0Iya3NkY2JDbDFia2JNUWM0ZDJtZ053bUY4YUxGbmo5?=
 =?utf-8?B?ajh4T2s4RFdIb1BZbFVMa0N4Zk9nL2lGZlc3SmxXcmI2cTI0THY2bnpTQjNH?=
 =?utf-8?B?RXhpN2Y4bHZIRDNMTjcxK2JUak5iK2tqTjlHUnhIUkdjcksrR1UyUUxQTzZx?=
 =?utf-8?B?dzBoVEtLN2t6cEp2WDN1eU5PN2ozdkdnVGM5NEo4SWZydnBWM1dlTHNLdlZE?=
 =?utf-8?B?MVVobFc1cDRXdWROc1dqNit0eS9oTk9kRXIrSUc0Sy9BY2JIMG5yaXZuQlhY?=
 =?utf-8?B?Q0Q5anJDSml1a3RvbFI2OHN6OE04VHg3YUgvcmJHMUNoUlo5YmlkWXlXbVpG?=
 =?utf-8?B?dUxiRFNzOW9WT1c5TlNEeVdacUVkVVBuSzNDa2pFdW9GM2VNbjU0eDNyYXAx?=
 =?utf-8?B?Vk9wQmRVQUtPU0Q4VHphMVIxbWFTaUhBYmRKNnFYQWJUbzU3RnFQYmxtdW1a?=
 =?utf-8?B?NzlSVUY5TWZtK0VqT1JyM1lUL0VvYlduc0RlWHlqSjBrbzRMOC8zOTFDc2lN?=
 =?utf-8?B?L0o5cFJkTCtuNUNqem44cTJrQ2tMRUtMTFFUbUJST3N3eEY1anU1eUlNS1pF?=
 =?utf-8?B?VGhmUkxXMzJJcmd2ZGlERUVnWjcyYk1vUmV2VXpIdnJlUXdkcmpPckVFN0Jp?=
 =?utf-8?B?cmdVRC9tZ2xkNkF6ZDNtYVFnSXhqME1BdXVCZzZuRU1qSmdrSkpZb1QxRFA4?=
 =?utf-8?B?d2ZWWXVRbmlyUzNiYWt6bFh0b2RORVEzY1hack9Ncit5TS9RVTNRVDhoL1Nu?=
 =?utf-8?B?SkZkamRuUzBWZlM1MjVRcXBQRk53ZFNSWVFzdDBpUkdWTjVEWW50TjcvN284?=
 =?utf-8?B?YjhHMVpmd3ZvaUVSRGdBRUNJVmE1Y3ErT1FIdE5zUFhabE96bUZSV0pKM2tI?=
 =?utf-8?B?Q0J6SmZ1N2RpUjJaazZxRnVVRWpRTVh1ckcvUFRoeW9TT1lXTys5SEthZjgy?=
 =?utf-8?B?UlZPaEFuU05GK3NGYjdkRjlRWkRoa2lROHkxYUV4L0NEenZuWVdHcDloYXRt?=
 =?utf-8?B?cUZ4b3o2aUNuQmlaMWpkYmVtcldDT0VGYkV5N1RHTmtFVXA3aVFyMnl5Mncw?=
 =?utf-8?B?K2RGY283Ums3eTd2dHhzdkJnZ2ZxajJ2d3Q2UisvY2RmY0ZRTGhpbWZlREwv?=
 =?utf-8?B?QXFNUmUxaUtqSGJmbTJLd2lqMS9RS2hEU3dWWWpJR2lXRkVoZ1Nzb29CTFVq?=
 =?utf-8?B?L3U1dXFGRHo3RXNZanVYMVNLd1FxSmdOd2tCL2o4Y3Y4RjFRU3hxSjFiYXZD?=
 =?utf-8?B?ckE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c2e64a-cafc-46d5-b728-08dd7c356951
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 15:51:40.0111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4m1oV485GdNvcX+p67p9B7pA8cDwG9maAfyICUhde3o94OH83N2CGheOGLTo98b5iOIRY/00hK+R4wtDa9gIKysORTpYcfwNxMoKArYmPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8408
X-Proofpoint-ORIG-GUID: JPU_dJ48Zz_jC3x2mB-S08oMNVGLF-85
X-Proofpoint-GUID: 7C-Uhm127BYxoZVw7gZkp3yhkMGP0Oej
X-Authority-Analysis: v=2.4 cv=HecUTjE8 c=1 sm=1 tr=0 ts=67fe808e cx=c_pps a=smr7v+wKk2SgYJk0SwJNKg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=Q4-j1AaZAAAA:8 a=vEnl5ZFpebpfMoZ9AwEA:9 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=Ok-Av6GroSeFCn6-FDkA:9 a=VQZ0TcQaE4ki-tAH:21 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_06,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504150111
X-Old-Date: Tue, 15 Apr 2025 21:21:35 +0530
Content-Type: multipart/alternative;
 boundary="------------TJDLYCkWngRsopAM6HAWN0Xy"
Content-Language: en-US
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 15:53:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214951
Message-ID: <20250415155343.CqVFsjI9fEI9zmc5UGBIeByrgJhfGvpa4CgRVTtADtw@z>

--------------TJDLYCkWngRsopAM6HAWN0Xy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 15-04-2025 17:08, Martin Jansa wrote:

>=20
> qemuarmv5 uses tune-arm926ejs which uses armv5te, I think you would
> need
> to use armv5te-vfp to reproduce this, or use qemuarm with
> tune-cortexa15
> but switch from default cortexa15thf-neon to
> cortexa15t-neon
>=20
> I was seeing
> it in multilib builds e.g. with
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/=
master&id=3D40e9c4744a7f1eb2d91af9539d69555d36dfba30
>=20
> which uses DEFAULTTUNE:virtclass-multilib-lib32 =3D "armv7at-neon"
>=20
> unfortunately just treating softfp as soft ends with segfaults in rust
> as
> shown nere:
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/=
master&id=3Dc65eda95e5dd3ad0be0565477236d7902d5d625c
>=20
>=20
> Regards,
>=20
>=20

I checked for softfp tuning using (which gave TARGET_FPU =3D softfp):

TUNE_FEATURES =3D "vfp armv5te"
DEFAULTTUNE =3D "armv5te-vfp"
TUNE_PKGARCH =3D "armv5te-vfp"

But, it seems that softfp is not a valid value for llvm-floatabi in rust.
It gives error as follows:

| --- stderr | error: Error loading target specification: 'softfp' is not a=
 valid value for llvm-floatabi. Use 'soft' or 'hard'.. Run `rustc --print t=
arget-list` for a list of built-in targets

As you mentioned, using soft instead of softfp also doesn't work either.
It seems that unless upstream Rust provides support for this, we won't be a=
ble to build Rust with softfp on ARM targets.

Regards,
Yash.

--------------TJDLYCkWngRsopAM6HAWN0Xy
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p>&nbsp;</p>
<div class=3D"moz-cite-prefix">On 15-04-2025 17:08, Martin Jansa wrote:<spa=
n> </span></div>
<blockquote cite=3D"mid:CA+chaQf_eWJgp9QVKQQ9iGviZU54Zc_1h-LyWW2yurWf06zCLA=
@mail.gmail.com">
<pre class=3D"moz-quote-pre">qemuarmv5 uses tune-arm926ejs which uses armv5=
te, I think you would
need to use armv5te-vfp to reproduce this, or use qemuarm with
tune-cortexa15 but switch from default cortexa15thf-neon to
cortexa15t-neon

I was seeing it in multilib builds e.g. with
<a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedded.org/ope=
nembedded-core-contrib/commit/?h=3Djansa/master&amp;id=3D40e9c4744a7f1eb2d9=
1af9539d69555d36dfba30" target=3D"_blank" rel=3D"nofollow noopener">https:/=
/git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/master&am=
p;id=3D40e9c4744a7f1eb2d91af9539d69555d36dfba30</a>
which uses DEFAULTTUNE:virtclass-multilib-lib32 =3D "armv7at-neon"

unfortunately just treating softfp as soft ends with segfaults in rust
as shown nere:
<a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedded.org/ope=
nembedded-core-contrib/commit/?h=3Djansa/master&amp;id=3Dc65eda95e5dd3ad0be=
0565477236d7902d5d625c" target=3D"_blank" rel=3D"nofollow noopener">https:/=
/git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/master&am=
p;id=3Dc65eda95e5dd3ad0be0565477236d7902d5d625c</a>

Regards,

</pre>
</blockquote>
<p><span>I checked for softfp tuning using (which gave TARGET_FPU =3D softf=
p): <br /><br />TUNE_FEATURES =3D "vfp armv5te" <br />DEFAULTTUNE =3D "armv=
5te-vfp" <br />TUNE_PKGARCH =3D "armv5te-vfp" <br /><br />But, it seems tha=
t softfp is not a valid value for llvm-floatabi in rust. <br />It gives err=
or as follows: <br /><br />| --- stderr | error: Error loading target speci=
fication: 'softfp' is not a valid value for llvm-floatabi. Use 'soft' or 'h=
ard'.. Run `rustc --print target-list` for a list of built-in targets <br /=
><br />As you mentioned, using soft instead of softfp also doesn't work eit=
her. <br />It seems that unless upstream Rust provides support for this, we=
 won't be able to build Rust with softfp on ARM targets. <br /><br />Regard=
s, <br />Yash. </span></p>

--------------TJDLYCkWngRsopAM6HAWN0Xy--

