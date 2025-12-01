Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C1D5D111A8
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 03:31:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12372.1764559872243991041
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 19:31:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qHmgwVDt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4430bdac1a=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B11St8r1614274
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Dec 2025 03:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Xb5701CskO2k3YS4guD/sWhb1od38lPyvHOOk2KROnw=; b=
	qHmgwVDtSHBnG2ySEbR9/2KQGN2wMe3PxD6l2KXxv8sltOSkCd725fto1E730enP
	7TkqMpwdZqXBdwRb/ug5nQ7fiQn3gbXZFXLfFxvjUhHZ2hSThq2x4/FVemtNLYRD
	/D7U9rH4/STbR58EeRMUAaihZ7BkR8d5fBJKrBjF+Iz79X0+DEyvrRPeNZ/mUV+E
	Y7S3pve0biceWjHwucTmd8hytvOPPxh7p5XCDZWhvvAsVdyRggIALh4nVfTpuTwx
	RH+R1UcoBwajGf2brSyMy1aXvWiUEl/1BceaKKdnC3yeTWivAyEVXvDQfFWsh/3o
	BFswMOuLYyzLf6GH9/Vetw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012030.outbound.protection.outlook.com [52.101.43.30])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqqt699c8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 01 Dec 2025 03:31:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xjhTHrqdoqpQEAeniXiWryNnDHBd/ezfHKDWoI7QcdylskG+pxmQizi290uL1ZsiRKJ0SVnGCTN3wwXBjZ8OyfPhoBxC8CZWqzhe1t2LW/uQmX1OBcS15NzcqgSQL7E3/56wT0BOU5cD0k/4JikAVFYks4jl7YW1aDTpsow8ze+LuBXJV0oud/CiSQLlGb6JLIlSdr2xTIth4Epwa0dTF1PijoZMA1HjjpctYauZRBdOEHUr6aktmEU9hSmun5Op7VnsdfjLo/6AsXV1YoN5yioi0F4z5InU4wYK2s2hdN+k4dMhMQ49Y6hP9MlBwVNumOPmuTliohuUsUqXr9fSUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xb5701CskO2k3YS4guD/sWhb1od38lPyvHOOk2KROnw=;
 b=KlyxPxPRt+wEliroUR4AUiKE79coMTZyF1u1uBpkEZxfqKfQmuyc8ZF42ohElbMlvXv59PAtLc1G5sgtF9ufmYW1VVybjej5AI6j+O+Sa2LrpBfpa7qBGxKwoBKPpBFIPVC7u0w8IdCgcb4nRoyzu9R76vd2SZOW26JvSjHH5k6YtRibBysSgyT4/9jaevOJtXEfnDI/w/zGfD/z/WcfmvqIMkmFMXP8rLzBEuaKJHRWjmiTaamSK8nm+kmxseLBb5ir5lTmqtqOdZC0UVXyjQWpBV1+pePiY7+PVB24iXMF7NCZr63uOce1ptyAJEcI5y2xwCU1jzmShK2ypbWXoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS7PR11MB6296.namprd11.prod.outlook.com (2603:10b6:8:94::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 03:31:08 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 03:31:08 +0000
Message-ID: <77c0e422-25e5-40fb-ad1d-eb20d8a29853@windriver.com>
Date: Mon, 1 Dec 2025 11:31:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH V3 1/2] rootfs-postcommands.bbclass: fix adding
 'no password' banner
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, alex@linutronix.de
References: <20251129154130.505619-1-Qi.Chen@windriver.com>
 <CANNYZj-JX9NtKZ56R=f9XqJGRQKhKSkYnh80DjaWn69ZvJ7VGA@mail.gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CANNYZj-JX9NtKZ56R=f9XqJGRQKhKSkYnh80DjaWn69ZvJ7VGA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0136.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::20) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS7PR11MB6296:EE_
X-MS-Office365-Filtering-Correlation-Id: 951cb2e9-62a9-4a5b-e75c-08de308a10a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NDNUbEtpekluUFBkYTNHbXlKUzdETHdXa242cm9FY3h1c21Wck1vZHE1V2hI?=
 =?utf-8?B?MkZpTWdtczArQVY0aWpaNUVudmNBQTRrMHlySUl6Z0J1NnBEYWxPeHkyQzFZ?=
 =?utf-8?B?MGJQbTk5OU9EbVFUME1VSURKMk1MT3A5OWc4bmI5dDRPUXg2Z3BtdzdsQjJx?=
 =?utf-8?B?akVqc0F0bW5zVUp1eElZc21BVnp2bUZGdjZJaWlyOGY2djA2NzNlRjZNb0ZP?=
 =?utf-8?B?QWJnZWZMMjh4c0FVMzdJdTN5V21ETHhnb3UxR0lZN29OMy9SRy94T29LVnY1?=
 =?utf-8?B?YytJa0VsWVF6VlN6SmRydzAvdG5jQ0NPUkY3MG5FK3RNdTR6YVVydzIwUW4w?=
 =?utf-8?B?Zzk0VDZMd0JVSjVOaXNDT2Y2bHA5SUxqc2xETkdPbDZoR1FkbFd1TkRadFNK?=
 =?utf-8?B?Q3VJYXpZMDl4bVpUUlg1KzduT2NENmxXb0J2Q1lQR29lVVFYVGNtZmZuTWZI?=
 =?utf-8?B?RjhMUHlyMzBrQ1VYMU1KZXZWNnc3bWMwTmJ2K1djNDQ2QXNPV2E2M3hVOFB5?=
 =?utf-8?B?bVNWZ2k1Q045REYxaG82NnNZNEgwZHAzVG1RMy9XSUN2OHRhb096SjJ2NzBC?=
 =?utf-8?B?NmFYdkZmT0lFZDZEZ2ZvTFVTcGR6Ly9ucjVrWmt5V0VWUzJ2UFNYQlFrSytY?=
 =?utf-8?B?aDNRaE9jaEY1TkZWcCtrK2x0eFBmeTdsRzJkUm9DalpUTU5rbXVHdXdjazJU?=
 =?utf-8?B?SFRrMGFWN3EvT0lCb0w2NkRpYjFxc1hFcVRLVDAwWmUwMjA4UUROMEo1YW9r?=
 =?utf-8?B?TlVKdXovNWxhdjNNK1FlejdoL3RycWJYMW1JOWZ6R09KWHVQaHUzRGhUYk9k?=
 =?utf-8?B?bG1YRHRQMldIV2t4KzAza2g0bE03VzBEY0J3THh1UXN2cExMVFNzZC9SU2Er?=
 =?utf-8?B?cW4zRWRqc0pXTFhONzkrc3VERTFqT2RxWEJqTkhOTVBoRUh4bm9hc1dGTUhI?=
 =?utf-8?B?ZkhOVE95V2c0dTBCUXQwV3kvQkNteWI5NE1kVkpHWStOSDVUWE1iOW9pNksv?=
 =?utf-8?B?dExyYU9xVGZGd29XZW1KaEdLdDRDemo3cDFoMUxvS2poV1F5bHNhRDc2emg0?=
 =?utf-8?B?S0NINW8xNUZkK1krbU9sSzlzbFkzbElBTEJxVlhvVURTVDBHRWV3dVRaZVZV?=
 =?utf-8?B?bXZuVTR4SjRKOCt0MTY3Y01WeXAwWE1DY1crMWNwUVIzM2MwQnlYVks5bk9z?=
 =?utf-8?B?OVRycVNBQnlkbXhQQXpoRERlcTd0REZxY3pONlppNFZtSEFWZ2pXYlA4dEZ2?=
 =?utf-8?B?UDBCVDR5TGpqVVM0VWNGQkhMT3htZXBhOVZ6aHVpRTlJRzQ4NXN2SGl2TzVa?=
 =?utf-8?B?aTlOYUpCL2tNT2Z0MEROR2dSNldlcGJDM3RsQUU5L3BUOERXYjN0a1d1SVpp?=
 =?utf-8?B?ZVk5V01VTWZqV1NlY0tXYlhsdXpjbVhDUnNZWHV3bWt6L1pvL3MrbGxXTTRi?=
 =?utf-8?B?a1dKVWg5bk1RVTJhc3paU3R0VVFXSDlxWUhpRUI3Q0VNRG1YM3dlczI1aUY4?=
 =?utf-8?B?SWhHOVNsSzJia2EzaEpUWm9ndDl1V3lMdW91dnZ1bVNSY3o3Smc3OUVyRkhJ?=
 =?utf-8?B?bVQ5MmFyYVFtNzhVYkxLMjkwNHZMMXhoWjBod2Q3M0swcTR3SEJNd0ZiSi9N?=
 =?utf-8?B?cHhaeXkwcXJEM28zUGdJdFpvMWFEMlI2R3AzTWdnYmIwVzdOTXlsTTZZYkRN?=
 =?utf-8?B?SFFoalp5VFFZdWpJbjduRlBieDFjQjkwZWFlY2xlOElVNzFJbDhWVnlpRjFY?=
 =?utf-8?B?WE82YjNtS2RVT1FXTWpsMkZNK1UvazdaUGZYMkMzNXllNlFDVG9zeGRJR2FL?=
 =?utf-8?B?cTFVSmkvb2dnL3ROUFRyb3FXb0hzSHU0RFQ4ZDRwVG5tejdHdXlHRUhpWHhW?=
 =?utf-8?B?QlZoSmxncnc5ZGdzbkJpVEp4MG5WSG1xZ3k1bG1wWksyaFViWHVYZFl6TmdQ?=
 =?utf-8?Q?8MC0ZaHohCGBBaSbg1DN3poq36CtmBnQ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NHA3S0hEUTFJQTcveWNZc2VrNjRhNWtTSVU4WEgrZWdUbHlRT3lUSUEwM29L?=
 =?utf-8?B?V1dMc1Q2cFh4d2QxMVptdEh4WkFKV0w1V3YrYVVZZm9ieVdvMmNXK1JJQndM?=
 =?utf-8?B?UUlFNzByWnNOZTREbnppU01RcHNCSkVXdUNyeGI5YzBkdTlaajRPQXZ0NlU5?=
 =?utf-8?B?eEtpMkZzSE50c2lzWGVaelJEVWFYQXY1MHZTWUdIejNXcms5dUdVd1BnN0RS?=
 =?utf-8?B?cWI4M3dUNi9RNmhaTnBKL3Nnd2Vobi95aXpxZHFJbkpEeUNCRUl5VlBybFhm?=
 =?utf-8?B?UnZ4ek5JMTFPbU1JdUowRGttQ2R5SWJOamdiQWJGaFZZREZySUZQd2U1Rjkz?=
 =?utf-8?B?NDYwTDBPL0s4aC9ybkFmNlp5M0JabEZhKzZjR1ljRjVMZkZaN1dXczhiR011?=
 =?utf-8?B?cVRJbFlOUk9mVlJRMHNYWmVKWnBHdnJIQVM1SzZ6Z1JuY0NyRGFYa1Awb1Qx?=
 =?utf-8?B?aWZxNk9LdUZ2cFl5aFJrM1puQUtHU0p4VzFpUWxPL3dvOTY5Tm1PdFJGd1Fo?=
 =?utf-8?B?d2FrU24xQU9Vb3ZlZDE2a05OVmNreTJQV3k0UEtCS1p6UTkxcER2Z2VoWXRS?=
 =?utf-8?B?aFJRTk9jNWFtZXBXeEp5WGN4UHFWVTN6K3RlU1Nyd3JxYWxNR3ozSDFwMVJt?=
 =?utf-8?B?L3lSNTBYMVE4QjRyd3RLZ09UYjEzQi9QTXp3V29DV0RSNGtMclJ3blpIQnpx?=
 =?utf-8?B?NTF4UDI5WjJIQ1A1OU95S0ZyeEo1NTFCN3RZY3AyaHQ4T3M5RlVBeFNqdy84?=
 =?utf-8?B?dVU1TjQ0RXFQQmREM0F3bEMvQ0pERmpsWjBOTTJPODNFLysvMUQ5R2dNUHFu?=
 =?utf-8?B?MVd5WmRqMVNwTnc3MDY3Q3U3UkdJTGlncjJ1Y29WWDNQT2tRUEJGUHdyTGRY?=
 =?utf-8?B?bjlHRDRhMEp2UG5DLzdlaHBYN3QzTjVvdmRhYWZVQVd6SllZNW05M0NoREZQ?=
 =?utf-8?B?VmFhMFdvY1preE5Vd2tvVVBDM0M2dHBDaHl3UjFXbkVtYllUUHhQM2ZEbk85?=
 =?utf-8?B?VGx6Skk1NWJFS1MxWStJeHltWFBqZ09BQWFZTDJRN1dSKzVOamprc3V4VG81?=
 =?utf-8?B?SHlpbm9mb1Y1enlQWG4weDRQZHlJVEt6aWZCV3JTTlJvbnFRalp4NWtqQWo4?=
 =?utf-8?B?bmxwcGhwNFBBRFIyM09TUzZoRVVQU25RQWZCWi8vK25FRzRXdzNkdGpFTEFQ?=
 =?utf-8?B?eXhJV2N1dkdlc3dEQzdoOEpaaTF5QUNjamFiSUQvbTRDUHJNTGxEdzdpWlpD?=
 =?utf-8?B?Y1pXYjJPYmdOL2tZT3Bzd1ZHdzVFa001SG5BbmhmV21VeHRMUEt3UVlGZ1o4?=
 =?utf-8?B?V1NLdkltQ0dndHVkTzFuQWN1UHpETUdmNFNnQjlIMUQvajVaQzgyZlVwUVZK?=
 =?utf-8?B?bGQ3SE54RENwVk1iQmZjTENmTi9uZEl1TmJ4cFhqcmtab1g4RWJ2UUhEQ29z?=
 =?utf-8?B?Vy9oYlNkUHd4RW1yTXQ0QUs1L1pJNDFBbTN6WGFXeXBQZ0xWcnBQV0VyVzRa?=
 =?utf-8?B?clpOSWpLbjBuUXBnS3JnUlNEVWREVUtKazN3SlV3Q0dDSFNyVU50YjlMZ1Iv?=
 =?utf-8?B?cGdqbkNuM3J6OTNnTlJPWGpHS05MTFRQUkw0QndzcVZBNHVCd1BtZWlXQXFw?=
 =?utf-8?B?UGcvOEppMXlBWFIyWXczV09YOXhRNmROQVI3YVFqUURCMHc5MUFCOXcwN1ZX?=
 =?utf-8?B?VGFBTFJ6cm1PTWFDNGJwK0dBMktwU1U3QjgwOTh1MTdWZVRGQm40eTlnMThu?=
 =?utf-8?B?U3MxRWdYYWNzcFZKREU2WUw0eXRIbkFyMjYxL2Vmb2lna3dPK0NZMDVXWW5O?=
 =?utf-8?B?M3hYR2JQNlNwNWhjb2hjM0gwc2ZpK3k4QS8rSktBOUQxVE1zMzhqYis3Ny9X?=
 =?utf-8?B?Rmx5NHhORzM5OGRwR2VaRUJJZHRlOS8vb2xRQWlBRURKUzBZTzhiUUtSSE1E?=
 =?utf-8?B?N3BBM08rc0tpRFFZWjAzVDhwSVpseWFkQ012NVJXVzBNSWt5SHd3L3hodjVo?=
 =?utf-8?B?QnRxVStKMHZTWHhGT25uOE96T2o4aVBsZW90UTNwc2pUN0Y3N2lqWDByWFBW?=
 =?utf-8?B?NVJ3dHpuaEg5MmQ5NXBuTkxmOTZuaEJkZFVCd0t3OXN5L0NVVCtGV2ZjOTda?=
 =?utf-8?Q?URsVLn8oJqrf5hnd9ursIgbGq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 951cb2e9-62a9-4a5b-e75c-08de308a10a1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 03:31:07.9298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H9sOgFIWgDKrSZ6ySpWuZFGz2yXh4M08+sXwRDkfAdxCiAaBdMiEAUrVE+16QHZCdTNRABS+EM8/R1xDTTsqyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6296
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDAyNiBTYWx0ZWRfX/d1uxbjz5CKI
 wOcHPcxPQth+ccHDJ343s3HTq1Tc/hhqFY+PiL1LnNYgLV/mW2RPEqh+I/A7Bvuo2++bYir4uh7
 D8G5K4U9QuR5cto/VavFAqrr2uMidJklJXAvohxbeikTr413dP4i9H/Gww9t/ZkMglxIv9rElEo
 oHcgJWKAZWDZDK9AzgOrCVN4qwNW+c8ABuH033H8zFQK9yP68QDaaN8mRXjhwBPoIsOHTuQvqrU
 dUpUrlUG7AMQ7Nad2m0/oCq5kqmPd9UKMAR0ZdeaqtXTZxYXeK7RGJHyvt2PaXsPDqhTK8jRewa
 rVZgoBZL9tzOfQCpNES1PGsoMyT8KSOkggSAa/7whdR8Dv1aQOjycqVUngHvvD1P8O4kNJcm0Ke
 fbyOUZIgWXqcu0qJ0Ly+d09HXHw2lg==
X-Authority-Analysis: v=2.4 cv=Adq83nXG c=1 sm=1 tr=0 ts=692d0bff cx=c_pps
 a=H8CAifLk0DAaaH9V+JapoA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=xa5H7zyVkTy9hUGYpzcA:9
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: Z_CkrdeIl_fGu0o74s7I1XbcLKpsN_80
X-Proofpoint-GUID: dSTr7ik2kdU8MyzrkGvGR0w8NSq52Pwo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 03:31:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226954

On 11/30/25 02:14, Alexander Kanavin wrote:
> On Sat, 29 Nov 2025 at 16:41, Chen Qi via lists.openembedded.org
> <Qi.Chen=windriver.com@lists.openembedded.org> wrote:
>> It's possible that users use EXTRA_USERS_PARAMS to set password
>> for root or explicitly expire root password. So we need to check
>> these two cases to ensure the 'no password' banner is not misleading.
>>
>> As an example:
>> In conf/toolcfg.cfg:
>> OE_FRAGMENTS += "distro/poky core/yocto/root-login-with-empty-password
>> In local.conf:
>> INHERIT += "extrausers"
>> EXTRA_USERS_PARAMS += " passwd-expire root;"
>>
>> Note that allowing 'empty-root-password' image feature + setting/expiring
>> root password has been working since available. This patch focuses on
>> the banner. We want to ensure that it's there only when root really has
>> empty password.
> Ok, it took me a moment (and an image build/runqemu execution) to
> figure out the use case for the above. Which is: make an image that
> requires setting a root password on first boot, but without having to
> first enter a static initial password. In which case the banner is
> indeed misleading.
>
> The patch can probably be tweaked to ensure the check for needing to
> add a banner runs last (at the point where no further modifications to
> the root filesystem are going to happen), and it can be made
> unconditional, and only checking the actual content of the root
> filesystem, and not accessing IMAGE_FEATURES at all.
>
> Is that ok? Can you do it like that? And tweak the commit message to
> explain what that configuration actually does :)
>
> Alex

Yes. Good idea.

I'll use this method in V4. I'll also re-order these two patches.

Regards,
Qi


