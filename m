Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2906C4450A
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 10:14:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9585.1784196881861237515
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 03:14:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CenwvaAx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=16570459e8=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G9sQWU2455881
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 10:14:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=wI+20+SfZAc6BmlA9RVFbtEmLjvbm4d6ME6JcCTXP2w=; b=
	CenwvaAxmBtEaUX43mF5ura885CJbuZazcZzN72MDIwK4qF0T+TvMBrhFso+ifl2
	UkmTxv1GTTEBrZo9BUWS+y2nGO2D2+YQCjgmnSUwdJcrNfKuWmtIib10MkkQsF84
	yqBzdhJPiUWljI9hDi7Rt4WuStHHO2x5vdvCEtTsdM45xZzwVd5IBrIcL+mmLdX0
	dPVT+UrVuF4f00vmg0GbHUu6ittjyzzVLemVLA8fjeb3DC/oOAC0onlBifI1vurF
	QtG4mKssi9BZzwQVY8b6628fS7n1JLzHQqyg4be5VYH8TfsukqhahHTRn5BK3jdt
	DDWMpFqRO/h+bJb6oZ3nAA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011019.outbound.protection.outlook.com [52.101.62.19])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fbct4qwjh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 10:14:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FsD6B+P4e4x1ToU5n+hxXQ3AhC5gUPA6Aj/JwTGzs3w2xBhl2hVJ2W+M1KFQ5tXPhoZqjoF54/vFHXlcbj1z340xnO/n3E5NRU3znxoWO4SxRQ3UKhdEiqEMp7HjcOByfEfc+8O02OOBBxujEmux+GO9HFUz0gqUZTx6RZNfxGXo1Pt/BkIt3gjlVtLG6jT8LxiQC82XXagJuxWIOVaNLvKVK4pp7JyJwm/0f2JfT67irlrbjwzlXwYtrrklt4+HfGQ7ItzncSY/O3y5JCHYz6MpsMY30lLvHNueDFplYcqKC9NB8gstFCOuoBkZ3SwqjbPsAbost+FsZBWZ2x7wFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wI+20+SfZAc6BmlA9RVFbtEmLjvbm4d6ME6JcCTXP2w=;
 b=AyAO3sv5mMZ08apZNaMi/9rerSIhPKXtMZySAVhqBkW+rgy7AwoQU636z1ifvM6BuodsdGbL0LNj4+ZCljGHeYmPjKncuN5wuSKHlWmQbvaGaztDhyEGFiJr93SVgo33DFes5jaLlFuciyiMZtddz1bA/cQiTNK/Pfo9038TkoNgWxOCSU6VP+PTeX68tH+3KcwCzarV0e8DRwfuyABe8lqvWLZVe03BIOrIrNifvG6XcuLyuUGk8yIp/KGalHst+JKD96ijiFD1O6r7H7E3qEeF09DS5m3Ql1KBLBQU91Ah+SqzOwBS7WBTcycbicENWR5LM4lwmox8tgy3VfPNqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by PH3PPF1BAF94C4A.namprd11.prod.outlook.com (2603:10b6:518:1::d0d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 10:14:37 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%4]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 10:14:37 +0000
Message-ID: <95e58c26-7eea-4f68-8bb6-fbd3b85041e3@windriver.com>
Date: Thu, 16 Jul 2026 15:44:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 0/3 v6] Oe-selftest for Clang, LLVM, LLD
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20260715060021.579656-1-Deepesh.Varatharajan@windriver.com>
 <DJZT67DMVUOV.3CPQL3DTBS745@bootlin.com>
Content-Language: en-US
From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
In-Reply-To: <DJZT67DMVUOV.3CPQL3DTBS745@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0090.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::9) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|PH3PPF1BAF94C4A:EE_
X-MS-Office365-Filtering-Correlation-Id: c7e2612a-dd72-48b2-a14a-08dee3230a21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|4143699003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	S0V3nxmQonddX4/b3a3qLBKNWgL/QzGFX0aMrG4cKIp5HmvhIus/VTEgjTnimqNwMYv/BHhc6BLHeUom/36JBQxYXrcZtTFfwUwXw5j9vhduzdNhYPuxGAVcNabafRAgVehZ0NMAvmgGJWwvVqrGrAPiAUroz3nPFrRfq6CX+fSNY7OtwY2zdBN/CF+BJ6GzGk56qUsDJDOk/pq/WUZbaXohAwPhVGZAUUBERuFPJA5aytpiMqeBAciIBDLIaDVhmZTA3gJveIyCa59F5ZCCShicbJVIm76FSSYivyy1INCJOQeUdI+yJ4lid4aWhMDeEaq+bHhvRVYZDbugABfDvFPx4QntvVex58bhNK4T06Qz8DnX9cwqrq3eXtOV1VLc1QyQwUUtOb7uPdesujRjCpL9joKxVKelJW+d8Azir0pqj8PPjuJYInAXZ0AHkPU/FjNlAZ0+BT6oCCDI5sVNIXu0NWTjqnt+AVDKfHIR3Fi7odEH+3m+LXOC0M4eTXR+z9/0yw7Ipnap2U/MrhsvuD8YmKNbRIMcBqHvhoPu6A9OTPv4ShqnfArf13lny2mTih64xXMfOsabfV9qAfjVVy4VFWQ/AhH1Fw0r1WTWAvo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(4143699003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T3B0RWtPSTFNTFd6T1ZObFQ4QVRQRmhsMFg5eWdMY0YwZUZHNmJXdm5HVnZP?=
 =?utf-8?B?cFhoUXZPR0N2ak1RS3NaL0RkSFphMkxqOXNWNjdocDltZFFDblBuNE1YcHBy?=
 =?utf-8?B?cERQODNyM0grOGViWWJiSXQxc3R0VkI5bFMrTkcxQm9lSVlLRHMyWHV2MGtZ?=
 =?utf-8?B?RVV5SFRiL2t1aDJneGp6eU8reFNrYURKNlBhWWp3TlFyVWJRb3BQUTZNOE12?=
 =?utf-8?B?ZHhqWXRzMHdTSEVSYlBiSFY4RHJFRFFRN1h6cGhxT09ZYmxwdWljclVwaVpq?=
 =?utf-8?B?MFM0V0Z6K1J0UTRRcHY0MjVhMVIvL3dHVjZicDgvK2R3ZWQzcGljWTNlZUZu?=
 =?utf-8?B?UVBWZEd4SWdvdXdSY2dQSzd6amNKL0JpdVh4TEZ2T0JXZzdsckhYY1dWUEti?=
 =?utf-8?B?T3Y4ckFxTzNLR2tJTzAydUhFdTJmeE1NcHZCeW1xUkRZK05naUZ2RGZLTlJi?=
 =?utf-8?B?WU1QR2NuRjNXbGNzT01VUGNSSDcvSHRrQVVWZFVGRDFWQ09mNmJIZGlIb0pN?=
 =?utf-8?B?SmsyUmRndVNYY3Q0NXF0eHQxTG1wck9JSTN6Ly9aZFNzeGxsd0JUMVRvTVEw?=
 =?utf-8?B?dGlzS3orZ0s1YStRZUNNVWlJaXp5SHBXeEY4b0g3YlVHOTF5SGFFSktmVFRz?=
 =?utf-8?B?c2hSdzdUZzNNUVVxWUdXdnYrQWtoL1RIQUVuWnhMQlVxL2ZybW5MenpYSWhw?=
 =?utf-8?B?SkJEWFZ6Wk5vbTcrS0tPQnhPQVF0T0l1MFA2aVRDTmR3N3cwK3lGb1FkdTNy?=
 =?utf-8?B?S21JeVZ2LzRlN1Q3TVZBTy9BR3MxYmtqbXZrN3pHLzVjR0Zlend0Nml0RGpR?=
 =?utf-8?B?VFBvaytPYlU0L25PUnpzbVkzSmVZNTZnbGo3RGFONTNSZXlhMkxQM0FwRTdt?=
 =?utf-8?B?M3N2eURpSVhZMVkwRVhCTTBiTm9HdjUwUEVPVUNuTlVUdWlBa0xLakw5YmRp?=
 =?utf-8?B?S1pRTDcvc3hrZWpLQ293Zmx3aEcwNEo0Ly9MdjhPUkJMaGlOcE5rdTRKZzVV?=
 =?utf-8?B?OFVuYVN3WkpPM29VVDJ6SS82NXZRTy9EamNRUG9SMWY5aS9ZYm85NHVnNzBj?=
 =?utf-8?B?VHU1alVmbHlRT2pvdlN4eGhNUmtuSUxNSWMxTFQxK08xT2l3TVM4Tm1LQVhC?=
 =?utf-8?B?ajZQcGU0RkZiK2cwK0p3Z0l3anlIRWhLbDZYMk9QT2taUnplbk1NYUc0cjh5?=
 =?utf-8?B?d0ZPYUE5OUptMXNDVDNyNDZoVCtkSURPa1hjdjRUSGNBU3BENk5tcktEbEJl?=
 =?utf-8?B?NExJVEdLaUVCWXBxSUhvaGpUak5IU2krR1RNaTJGbHVOS3FPWVVvcjFUZ2Zq?=
 =?utf-8?B?ZExtcVkyNHdrR0E3Qyt6ZkI3azlIcmtZa3JzWm9VZXRETDQ0cW45aWR1dVcr?=
 =?utf-8?B?VVdHSnVZYTBXOVZEOWxkeGM1bkZrREN0UDk4K3Bield0R2p4cko4N1ZLT3c3?=
 =?utf-8?B?MHN6SUFsdk5pWkJrUGxBTG1SMGkrUCtpWjVnQ1RXem8wYnVxbDcwTmxFcmlw?=
 =?utf-8?B?Z0F4d0dHNlVQbk45OU9BcDRtUSs0aTdGVGs5RW0xQTE0NFVZa3JYL0tkNDVk?=
 =?utf-8?B?NW4zcHJxTWx6cVRJOFlWcEdNb1FLR0VudkpnZ0o4WVI5bW5ja3c2cSttM1Z3?=
 =?utf-8?B?ZFF4Z2RialpiSUVsamZOc2pNeXdjS2U1cWx3bE10RktXUGtheEtIME1aQWpK?=
 =?utf-8?B?YTAvTlpkUjE2eE0xWXVOQjJ3aThaMzd3c2k3U0hvek9FdXFUNjAzVnpTMGFV?=
 =?utf-8?B?OXhOdGYvblRlZlU1SjkrUzZyMWFrUkJNWm90T21UMGh0RUhHWG1KemxGSGZP?=
 =?utf-8?B?Snc4dlFVQjZhbjBvSFdabGVKREcrUUtlUDVqUWJLZ2FiWnl2SEtaenNkci9B?=
 =?utf-8?B?TWZ0RGg2SGZJWHpGV1gzLzVSUkxuL3k4K3pjSWxDaUFJRFVGcjYydUZEYUVV?=
 =?utf-8?B?SmFjNE5NcU1CREtpZlRvN1dSRG9uR3lxUFVraHhSRlhxVVMxMDd0QXUvOEJW?=
 =?utf-8?B?RzhOdHRrVCswbnFCRUY4Qk1ycHBYR2RXWmFQcWRHUytjMUtLeG1pcVhMbnJW?=
 =?utf-8?B?Mm5DOUxzcEpJUlRYaXVUekV3VVlwbW5zOEhTcFNxazFsSjBpS1ZYV2VtU2Zh?=
 =?utf-8?B?MC9KbU01YnpxNXZsN1dVUlpyaFBzaTRZL05ZbUdKZ2pnbUpabnRNQk9GWFc3?=
 =?utf-8?B?aGRxOHlyaVl2aEhDQXd5Y1pkU29CQkNOc2VpTHRmdEJGRUJUdHBBTWNjZ3FW?=
 =?utf-8?B?V21UeXdXQ0R3MzBLQlZCZzhKLzQwemNxTmc5U0ZvNVJXL20rdGZuMjN1bEZ2?=
 =?utf-8?B?bGNnaWZkano3L3pBclN3bXU3bjRWVWFOcDd6SjVrVDhWajBpRkE5QmQxOGZo?=
 =?utf-8?Q?G+mjhUB7mxNZkGgi2FghqSUnx2lXlsykaB7aa?=
X-Exchange-RoutingPolicyChecked: 
	b76aFA8Zw8RtZrV2e7DSXRXOw2txTGm89Zsxdz+WB/2Lt8rt95FiorwGkUKuJdPvtA4bRNo2+BYG9Z+P5WhZsdDA3mRXiTN19mPzuT1suR28m8U1vZvn1d0MySx6tJbnwg1+c0rCoyYKExmspwPzwXdcZlU3KNTFScykCB6Ythkygo6Bsj65LyfyKUmCh5AV+I4jfnfzF2hi2AQCL76u6/DZAZARSkHKP1m5d36j4n5/Fk5y7T82NBdhmUwXkt6InKK7nmPR6rhpPgS2d2LFWGlW9/vDQ77gF0fY9WWBYBn275Pmdr5/+ZcysZBrDtyCxefzKA8+9l2RJd689me/WA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7e2612a-dd72-48b2-a14a-08dee3230a21
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 10:14:37.0804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2RiHYGZy/a2LG/ykrj4IcsjZcgONDV2os4LPa8hwSxkeBGRi6V0g6FZF6lJ1qUX+3Q+bdyXLIpxdhwo+fWlDBEHZF83+ICTzV6SyHiSO1i/qsPQrUOfGOjWUbjFMoGGe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF1BAF94C4A
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=J9CaKgnS c=1 sm=1 tr=0 ts=6a58af10 cx=c_pps
 a=UyUtkpB65yKBl9uddpDweA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=iGHA9ds3AAAA:8 a=1NWNoF9oAAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=o7dzBBqEv-OVBek79qkA:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=97APRTa-CG6DvPMFVxHL:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEwNCBTYWx0ZWRfX3oQtgTpg3Hm4
 d3h8Nu0s+LkEcevWXDOR0Kp2j0V6DP+1JAlEhn2YSaD7BrVC3nB3M8v81JGklbZy+JqSw9S88RS
 1Joh2Ka6rBYxZRH62uE2fL6siwiDw6F3xKLIjVARyzkMD3ibV943
X-Proofpoint-ORIG-GUID: h6TFV5jsOau3_NGnUf3relB5C8sEpfX5
X-Proofpoint-GUID: KrwfdQm9_MqYRvxtqLfUaw39bEQ58LYU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEwNCBTYWx0ZWRfX0sVggq7M8ieI
 MI/GQHJpVS9GFOLhKt475z17Cxpe98CjKSDcm/FnPk5gGxvZIBBHWLDXNBzgRNrD87FhgMWc6on
 3cHxM9rcEiNB1CsHSKzvCkRdNyzVgK4Y0SDMBRfW92FvajLowyA3HvJhaplDCFTZAkt8C0tdzE/
 PmYomh3rhA8gFU5ciIkACuPKTm3/G5MHTnXl3m110Y7F4OtYmPF9xkwxhJKQY2CSRqUNFfSYk/5
 vWvH8pThU2ftFIo7eobhcOeIxI4hyuyy14lw2a8yHj6yrDCgunJ8KY6kYvmhdKyZ78iEGsrbkXZ
 6y27Xh+DaE8+VPpFUMxVoHXy0590BcHxQwVyEXdpaeZNb7020Rmpd+vQtMt+tZnJ00XrQMmQSfz
 VpkYFZvbiksU0nmLY8KyYoDP9pWk3gdazRiY8E/twdTcERJnXiOHDPouhOhQMnoteZMIBD24I4I
 r5Po8F1eVKsbHtGqxvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 10:14:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241078


On 16-07-2026 12:44, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Wed Jul 15, 2026 at 8:00 AM CEST, Deepesh via lists.openembedded.org Varatharajan wrote:
>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>
>> This patch series introduces a test framework to run selftests for
>> target builds of Clang, LLVM, and LLD.
>>
> Hi Deepesh,
>
> Thanks for your patch.
>
> It looks like it does introduce reproducibility issues:
>
> AssertionError: The following deb packages are different and not in exclusion list:
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/deb/./x86-64-v3/rust-dbg_1.97.0-r0_amd64.deb
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/deb/./x86-64-v3/rust_1.97.0-r0_amd64.deb
> The following ipk packages are different and not in exclusion list:
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/ipk/./x86-64-v3/rust-dbg_1.97.0-r0_x86-64-v3.ipk
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/ipk/./x86-64-v3/rust_1.97.0-r0_x86-64-v3.ipk
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/4386
> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260715-161pbdip/packages/diff-html/
>
> I did not really identified where the difference come from. Can you have
> a look at the issue?
>
> Thanks,
> Mathieu
Hi Mathieu,

I don't think the reproducibility issue is caused by the clang testsuite 
changes.
Those changes are guarded by the `CLANG_ENABLE_TESTSUITE` variable, so 
they should
not affect a normal Rust build. Before sending the patch, I also ran a 
couple of
tests, including reproducibility testing, and did not encounter any issues.

I did a bit more digging into the AB builds and found the following:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/4378

It looks like the same Rust reproducibility failure occurred in your testing
two days ago, when the clang-testsuite related changes were not yet present
in your branch. I am not sure what is causing rust repro failures in AB.

Could you please run the reproducibility test one more time and let me know
if the failure occurs again?

If the reproducibility issue doesn't occur again, we should consider filing
a Yocto bug to track these intermittent Rust reproducibility failures.

Regards,
Deepesh
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

