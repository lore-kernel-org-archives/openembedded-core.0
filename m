Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45813D3B7E7
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 06:59:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2760.1765177137473492495
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Dec 2025 22:58:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=eSH5Sngq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4437ee5a93=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B85mZde3717063
	for <openembedded-core@lists.openembedded.org>; Mon, 8 Dec 2025 06:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=CZ5xHskfbslgo/WtfLqDZJ
	mkDPTV/iu0zv13BagtrFc=; b=eSH5SngqyOLl35m4762jo70IqlKkFDm4crbmbJ
	+y4ksqeROKdUkqv6bNElAsRswa+j6rFW8CajOn/AUjrr4dCBrgv4oE0xDsjc5aSD
	l9vQ84ieMLUBA34/UY6LhpKA03pizOMKuHNazSSMvtgi7fGBumGWV5RlyTrA0CaT
	XHDvN/rsrQOJ2VoZ4tM/xWGixSiOIR0yhvl+yEZFZF3gismrbJXZaqbFNMpkWndZ
	H9t1B0vZiLEM96ARRPPa6iuzEkfaz+8b/rtUZ9aconPluDgJPUdInsoTb8MmojBC
	9Gw/VbV81h20glZnkUjWuBjFmT/N99izj5V9MnvhTr/tQIhA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013021.outbound.protection.outlook.com [40.93.201.21])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4avb741bp6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 08 Dec 2025 06:58:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kMFKyWdiea7EjuHQnVJSN7uflMrawpvfIT9UkecIKvWPXkLNCoqDe2I2Ckvu1MwmOMh6pG/XYOt9Aw8FNj59OXiKVtXJljSaAyg6NUREDOnOQvCJ6AmS882GwqFbktO4dJfe4XwlB4BwngLSD5RCdfJLF3DgM/9PNLrC5A7yL2/0OpKZMC6DdksV4WApHfiFIzxxOuEND97Y6so6SzVvbQ0LltcILBSMbA97gyiywmZgMfd6E9BCOixrXhbHUZYUCsTx6zGaTh9wox2jREvAGFK1tPqXTKI9YdOUKiv6X7eALKUbTUrwtHT2hRymOdkKqXnSeS8LcWQDapZAC/PKnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZ5xHskfbslgo/WtfLqDZJmkDPTV/iu0zv13BagtrFc=;
 b=vLLdvNhfoGLs9iKDkJW0IV8MvWxrlsMbJ3ogI7kfh7dKJwVMpbf/nDlwrn1MPVBnWFTa+7696eJ5U8ITaTV3wRkIXFW3yt4o2ca6MyqXMX8lFBQYp1AijHPf3AJ5qur655Wp6d0Zuq7GphycDlLSCCtn48TUwPB4r2PFfHQyzh8NNKqbYjVkN8efUycJf13wsYPiut3JQGSWUc0Mw2doYRaa7f15Aw673i8DigKayvEESEGA2ZVFDBhR48w3tngFj+pONr433n0T8gsXbE34deHawmm2EyZHc3iCuxi3r6tyFDWvMtgwc9sTKE37zd090MZ/3uHioRoC5cNt3oMtsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SA3PR11MB8022.namprd11.prod.outlook.com (2603:10b6:806:2fe::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 06:58:51 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.9388.011; Mon, 8 Dec 2025
 06:58:51 +0000
Content-Type: multipart/alternative;
 boundary="------------ulMBMXSeeBDEyJWT0mw0sHHi"
Message-ID: <7f00631d-a0f6-4e7a-9c8e-50e3639dbc9d@windriver.com>
Date: Mon, 8 Dec 2025 14:58:45 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap 1/8] libmicrohttpd: fix CVE-2025-59777,
 CVE-2025-62689
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: Steve Sakoman <steve@sakoman.com>, Gyorgy Sarvari
 <skandigraun@gmail.com>,
        openembedded-core@lists.openembedded.org
References: <cover.1764713862.git.steve@sakoman.com>
 <ce604b9bf682e404baa15800fcdbc01abd6a66e1.1764713862.git.steve@sakoman.com>
 <b0caac3f-5a60-48e4-bd89-15fb3654a91e@gmail.com>
 <CAOSpxdbBg_g6=LKqs58LnZnTG9SGSuXUUudvz=kiwVoTD-W_6w@mail.gmail.com>
 <a895de24-e46b-4966-a091-b95f1df6f767@windriver.com>
 <CA+s=J=z-d13udWyvARTW9hgMFpzDkNQi=CS7dPhcW2qMaQoLFQ@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CA+s=J=z-d13udWyvARTW9hgMFpzDkNQi=CS7dPhcW2qMaQoLFQ@mail.gmail.com>
X-ClientProxiedBy: TY4P301CA0119.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37e::9) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SA3PR11MB8022:EE_
X-MS-Office365-Filtering-Correlation-Id: fac2021f-d178-4647-c80a-08de36273e84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MUszS3FVOUI5U0JMUzRibEpoaCtiTDF2amJVenMxVHd0M2doMnhIdGk5M3ZY?=
 =?utf-8?B?OGFGTFIxcjlDSHFkOUVrZ0FLV3kySjZvVjRYaWhadm41djdwRVpaaUc2YlhS?=
 =?utf-8?B?YXZaY2wzbm5mQlUydkRlczlZOFltUzhyaHM2TW44cmtaaHJ4WnY1bVcxZ1h5?=
 =?utf-8?B?QXg2MHhUYitHNW9YZUJMTys4Wk9oaXZ3RzE1VXdxcWg1TWhIektsWU9tcW9o?=
 =?utf-8?B?Z3g5ZTdEMmlmTk4wTWxQdE53cjRvY2o4QVVzOVVkRk16LzlldzFHUi8vb3Vr?=
 =?utf-8?B?QlcvWEN0ZU9wYkhZS0RiNEtucVc0R01mY1dodi9qTzlrb0xtTVYybnhhTHV6?=
 =?utf-8?B?ZWx4OWt4QUhsUUxSWWNCUCtKSzB5Y0VSRks1NXBGTmJPcW1UUFJhUjArMzVO?=
 =?utf-8?B?OG9JMTJuMDFhMzRRaWVpem10aGZQVWpxYTU2NnJLSFVlcGNTOE5DWG44SlIw?=
 =?utf-8?B?NTZFVVhIMjkrZVJxOVIyTWJxQlNjTFNWYUVWeXdKalVOY1cydC96a3V4SUE1?=
 =?utf-8?B?cE02Q3dpd1VCMGRUUUFvVFlnaEorWFF1K3cxdU5vblRQTllIZ3hpOXJmY2Jt?=
 =?utf-8?B?YVVSS2hBbWNkWEJLUytucmgyVXRpejZYR2RDK2sxSkRZbzRWSklmWDhaMVNt?=
 =?utf-8?B?SGZubUQ3QWptM24xNk5hZ3dZbEFlNTBkZ29URUZVZlpRNFovZllmS2VtM3RU?=
 =?utf-8?B?NnNmcCtYRmZpYlEwODZCNHlVTHY4cVJwNi9NTjNsOFB2TGtXdnlkK1RNSnVh?=
 =?utf-8?B?ZGVTSUZ0SXl2TS9obHJFTUZ4V1RxM09BZWJQRXQ3M3d6NTJTcCsxQitPVGJI?=
 =?utf-8?B?RFV1eElQbFBkQVM2bUs3b2NuMEI2OVBmV0hGVkZIL2xhOVMyM3FBeFcyaUdt?=
 =?utf-8?B?ZUtKdk1OV2dhLzlTckswaTdYL3kyQTNrSXJWcUVpNEgwSXRCWE4yUXhQS0lC?=
 =?utf-8?B?OGpqbDQyTGFmVUJoTUV5SVpQQWdoVDJGQ0x1MUQ2bUJTdVRBQTU1YnErNEZq?=
 =?utf-8?B?TXozRk1SWWlXZDdBNGNQS044c1VDZWozcGlhQy9xcjhIL1RhN3RJR3FLajdi?=
 =?utf-8?B?NVVyVnU3QXZaU3FoYWdUSUpsZ0F0Tk5QS205NmhNc1ovN3NZYjVMSnJ5NlFP?=
 =?utf-8?B?ZjRoWVdoaSttM09mK1NPVEFrcGJGQnBQck05WU1FdEk3QjZKdStuNy9vUmdW?=
 =?utf-8?B?Q0FFM0NlVkF5TmdQZkhHMzQ1UUZIbVQ3QWdaM2tBMkpRUVVQRnlKV1VzdTVl?=
 =?utf-8?B?ZFpSS29oZVlTWFZSeFJWYmlzTGdydHpaU2d2MjZUcE1mUGtyU1RsMGpiZVFy?=
 =?utf-8?B?dmJqSW9jN1U4V25mL1dWNFJmM2ROMjBxRWplM0g1ODY5bUxXNXFNY2Mwbkx1?=
 =?utf-8?B?ZHRoS3AycEZYekZVMTMwVHEzTjdxb1pFcGhBRmxoTGdDRDlVQ0prbXAyUFZs?=
 =?utf-8?B?WnhsanFCakJQQTNWZ0pjcTFzTEc4T0hXWFhRdnR3aXM3TThhSkZHaklzZDNu?=
 =?utf-8?B?ZTFVTmwxRjIzQko4dGtaM25NWUNtSkI1ZEVvMzlrYTBDckYvQlJSbnZRaWEx?=
 =?utf-8?B?Z1ZtdDU0NjcwRC9UK3NNN282algrUjA3RFRZQ0xmZHJzMUlPN3JiTjFRMWF3?=
 =?utf-8?B?eHZzWkN5bmZEUjYvMUsweWdSRFJOeTJtWWx3d0RpSDVsOC9UZmlpTlh0elYz?=
 =?utf-8?B?OVpJaTR3K2hqWFNjWFRYdk9VUmQ5eGt4elBJaG1ObUJtQ0RleFlLZU03eGpP?=
 =?utf-8?B?aEdVbitiWVhyQkhQdE5HcVJyNEIrRWQwOHNmL0c0ZlpkQis1dTJtRkg5SURG?=
 =?utf-8?B?VERsWUVRdkd4RGFlclEvNmJHbFJkc2NzeStQT3NUckJQY1RrTml5UjRBVzho?=
 =?utf-8?B?OENlL3ZiNVBBQkVxVmtmaS9Xc3gzMkZnT0hCaGRDd1BiamVaNklaWWUxeERB?=
 =?utf-8?Q?weY+XHJrkjaqH0BnN+vfCL0kGe0r8u+R?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?enVRV0twemZKaTVYbXNtaGlJNHhianhuOUgvMDdnOEVpUHVBTVBLelN6eWVj?=
 =?utf-8?B?bWVIaFZzKytZUHNpR3BsTmNVb3c2L1M2TlpNdDNqdkYxYXB2T1RUVzdUOUpq?=
 =?utf-8?B?SnhWMzRaUmh2QWVaeEl4elhrVm5UbWZOZlhBVzJWT0ZVei9pYlcwWkZtYXoz?=
 =?utf-8?B?QVRLak9UbUJSWDUwY1Ayam9DZkRGaXFaMG8xbVlpblFJZUxFQnhxQ0lLaTdr?=
 =?utf-8?B?bElBTGROUnJ0YUJ0QzR1WXVldTRJQ0ZxNjhHeUNlVHNyYmJ2YUx0eml3YytZ?=
 =?utf-8?B?Z1hVWERMSmsybkNSQnRWZzRCYVZsY01tai81R3ZITExMeElwN0Qwdm1qcnJH?=
 =?utf-8?B?T0JDWkZ3RlhDaktoR0pyV0JTZ2p1YlppV0ZwT3V6S25VMU40S2pJTGljRk9X?=
 =?utf-8?B?bDdTc1gwNlRKODQrR2RzWnJCNHZTT0N6ai9NT3J6U1ovMXh5QmlvM2ZUSkF4?=
 =?utf-8?B?RnlQWkxqL2RpMURyWDhoUE03bWQvWGkyRDN3OURzYVRFcjk4Vktta1JjRERH?=
 =?utf-8?B?MGNkbkVTSVAzZzM2cEpzVzMvWm5RaHdXLytrTFVHMTY5N0Y2aEt4WGxUY3Fy?=
 =?utf-8?B?ODhjWVFaVHVjaEZaOGNrcytNRmx2a25HNTJJNGxFWmZwRFI2NjZsUHFUMERV?=
 =?utf-8?B?WU40ek9FaE0wbWpOTTg5d2ZKT0tmQmxpaXVyZDl1TS85RU53OFhmTEc3ck85?=
 =?utf-8?B?UjhVSXNHSjkzM0kyNVE4ZUpJb2ZUdmkwOVVsVEcvZ1U3bXhEQ2NNSnJVbTRN?=
 =?utf-8?B?R1hEUVkwMUZUODZWVjhkRXZKcUgwTzIvUFVROS8zMm10R0c5aUJlcXBVd3pP?=
 =?utf-8?B?UFVvUUFweVFZT3pjWEdITzVvdVp0RkNlMzdSckljV1pmL0NKMWUyUjNOZFgx?=
 =?utf-8?B?QkFVZVJLeE5HdVQ4QVhsNFJwL05jUXB4Ym9qYmFEYkZLUUxlMXVkakdIQTBO?=
 =?utf-8?B?SnRzU1dCV2lOdTh1L2NKYVFydzh3MGJnWGZITkxFNFhlK1BONzBlTjlMN3ZG?=
 =?utf-8?B?YXlxcjNoSmpMb1lKd3gzeXNuOXB0SzFMNVZFUjNoTmwrcFhUSy9VaUoxK2hI?=
 =?utf-8?B?aTNCcjhJOGNobmFTOThGT29LejRWRVpIWjJTLzNwenJWcmhPSE94eHRtajgx?=
 =?utf-8?B?WmxCb2tkenMvNmVWRHlNa1VmUUxvb2d3KzdOaGwzS2pTbmx5b1RTRlNEYnpZ?=
 =?utf-8?B?bGY3bUlIME9nUGpsL0tlaGVQQWpNUkowUE40SWM5eGc4VUtjSFh2M2pCUHRJ?=
 =?utf-8?B?Z2wyUFhNTG9pelFIakVPSllNSUhienBGck1mN3VvSGtvOXE1anhKVlEvNnNw?=
 =?utf-8?B?YmdSQzZYbUhIemt3emVwMHEvcVRvM2hoM2FndlJWWi9ZL1hkR0d3SVd0SnVh?=
 =?utf-8?B?ODJGNXk4RERPamtWbEUrMU0vYTdnRlcvSDJIdXEySVlDN25qNngxa0U4K1dy?=
 =?utf-8?B?MVJrMUNUdTU4L2RiUWdsSWVmRkZuS0dPLzgwNFJaZWNPVlNIK1hZa3plS3g2?=
 =?utf-8?B?YlAxNWFXaHg5Sm05MnNkUUFyVmFGMmRSZkYvK2JSU3A5RmpvUGljZ3JicmRU?=
 =?utf-8?B?aXNBVzEybk9IcUNrMGNDUFVmQ1dTUmNWY0MwbjlFZ2hHZHpROU5uU2JySGlp?=
 =?utf-8?B?TEhsRWJibDJ1KytkM0ljaEFSdE9OOXpmUlNUTlptZklEZ0U5QTdqTGFTdUl2?=
 =?utf-8?B?MW1OYzNoNVBuZjdOK2F0cjRPNXlSUExoNXp5dklvUnhkNlFNSmwzVTJQc25q?=
 =?utf-8?B?cFZqY0lReVN2dmlxbU9EenhwODFIbHZQS3lEL25RRXo0aHZQNUt4VjF5ai9x?=
 =?utf-8?B?SmVna3dTdzlSZHMvd2ZVbjFWMklzeFRnNnRHQkhWVWNzZEQ0TVNjbVllRXNM?=
 =?utf-8?B?ZnZQT0dWQWdzSWpPdTRYYWZqWjNFZlB1eUxpVHptQ1VBWTg3RGpPYTE4OWJi?=
 =?utf-8?B?cm93VDhHK0tLTkhXdzEwdHQ4SzJ6NFZTUFFybm54Nk5MTlVJTDdETkx2RFNM?=
 =?utf-8?B?SHBNaVZyZHI4U0NwalpYMUE2UVNUZTJ0NUJNSVcvY2YvS2JtNXg0eUQ3dmRp?=
 =?utf-8?B?eXJKU3NQQnA3WUczSFpFNGlzTVFQV1FFNjRkQmtxVlZEcEVJaGF3cmVRR1Vh?=
 =?utf-8?B?VFN6Q0pkOTcxUDVJaFJ4ejhBQ3NYYWxQTlBLZmEweXp4d3IzR0pIZ1MvdVQw?=
 =?utf-8?B?UkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fac2021f-d178-4647-c80a-08de36273e84
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 06:58:51.5530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S2Y1rU8xCW1iyfED5cgKowRAMLsSMdvIBLBMwxiYp6ENbLibdUqeeAqzr2gD2mwTZmoRshkNevVGtChr7mwogOdEAWvuOF40oNvc1Msqh1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8022
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 4BZqF_v_VnoOd-48PbNBduWSd-0XTydG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA1NyBTYWx0ZWRfXzy6N4h8aNuGC
 LgLH3BYHZtawTDH5TS/Cgj4/8/zwbR+rtsznWdEWcsRAVvY8R2vWgu29vjD+jBuYLX41q3EF7Jk
 JZ0SY4ZM28O9GhWRAZwQWthFFlozUwOAyTLFFdS/ZJXFObBePgOwa2Qg4tDm1QlT3KuY3XXkVj5
 ZcUwwIDhDxPwsnw5alEnJ+aeH3fgoxX6jnCYRIso02QRqSeLdMSVleywH09ozFfrr91mdHJ4wCh
 LD1IFI9TUt21x7y9evetbZAH2tVBkMA2o4uYM2QF9sxF2RK3LYsdxBdF9xHhvsA5iuecwNXp7iF
 gI3htTXaMTwoVRhQ6ubHk6cAbmU9ppx+OIb7ICtAWm21/8PkUa4SsUDvG+8L6CZjRn7OiKWI6xb
 iJxoxvflP6EVpxYXV4kUQjQXaFYLDw==
X-Proofpoint-ORIG-GUID: Y2JMPeWMs6jRpkRDGjuqQIo1A15rK6Wb
X-Authority-Analysis: v=2.4 cv=EpzfbCcA c=1 sm=1 tr=0 ts=69367730 cx=c_pps
 a=j8DUK8/cuCuEDQ3LLq2Aww==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=IvQJNAUUq8ru2VKf7xoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=yj-aMKAYKbz0kkd27lYA:9 a=IUOafGDcFIQ08Loc:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080057
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Dec 2025 06:59:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227377

--------------ulMBMXSeeBDEyJWT0mw0sHHi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5B85mZde3717063


On 12/5/25 11:41, Anuj Mittal wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Fri, Dec 5, 2025 at 8:22=E2=80=AFAM Changqing Li via lists.openembed=
ded.org
> <changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>>
>> On 12/5/25 01:59, Steve Sakoman wrote:
>>
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender=
 and know the content is safe.
>>
>> On Wed, Dec 3, 2025 at 12:25=E2=80=AFAM Gyorgy Sarvari<skandigraun@gma=
il.com> wrote:
>>
>> This is quite a big change in the middle of an LTS release... not that=
 I
>> have a better solution. But maybe a warning in the docs would be
>> appropriate about this removed feature and its reason (not sure who
>> takes care of these).
>>
>> You are quite correct, this is a large change and deserves further
>> discussion since it is removing a (admittedly experimental) feature.
>>
>> I will remove this from this series pending further discussion on list.
>>
>> Hi,
>>
>> This vulnerability exists in libmicrohttpd_ws.so, which is generated w=
hen building with the --enable-experimental option, rather than in widely=
 used libmicrohttpd.so.
>>
>> We don't enable this option by default,  also we don't provide PACKAGE=
CONFIG for it.
>>
>> How about we still keep the patch for fixing CVE-2025-59777, CVE-2025-=
62689, and add the following warning in libmicrohttpd_1.0.2.bb
>>
>> +python do_warn_experimental() {
>> +    if '--enable-experimental' in d.getVar('EXTRA_OECONF') and '0001-=
Remove-broken-experimental-code.patch' in d.getVar('SRC_URI'):
>> +        bb.warn("This option is removed for CVE-2025-59777, CVE-2025-=
62689, if you insist to use it, please remove patch 0001-Remove-broken-ex=
perimental-code.patch")
>> +}
>> +addtask warn_experimental before do_configure
>> +
>>
>> if the user enable '--enable-experimental' , warning is it removed. if=
 user insist to use it,  they can remove patch 0001-Remove-broken-experim=
ental-code.patch locally,  then
>>
>> warning will disappear.
> I think it should be the other way around. If we don't enable the
> option and don't have a tunable PACKAGECONFIG for it, why complicate
> and patch? If someone did enable it knowingly, they should fix it in
> their append or recipe.

if we don't patch it,=C2=A0 should we add function like do_warn_experimen=
tal=20
to remind user about the CVE?

it is possible that user enable experimental, but they don't know the=20
existence of CVE-2025-59777, CVE-2025-62689.

Thanks

//Changqing

> Thanks,
>
> Anuj
--------------ulMBMXSeeBDEyJWT0mw0sHHi
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5B85mZde3717063

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#cceed0">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 12/5/25 11:41, Anuj Mittal wrote:<b=
r>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CA+s=3DJ=3Dz-d13udWyvARTW9hgMFp=
zDkNQi=3DCS7dPhcW2qMaQoLFQ@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Fri, Dec 5, 2025 at 8:22=E2=80=AFAM Changqing Li via lists.openembedde=
d.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:changqing.li=3Dwindrive=
r.com@lists.openembedded.org">&lt;changqing.li=3Dwindriver.com@lists.open=
embedded.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">

On 12/5/25 01:59, Steve Sakoman wrote:

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Wed, Dec 3, 2025 at 12:25=E2=80=AFAM Gyorgy Sarvari <a class=3D"moz-tx=
t-link-rfc2396E" href=3D"mailto:skandigraun@gmail.com">&lt;skandigraun@gm=
ail.com&gt;</a> wrote:

This is quite a big change in the middle of an LTS release... not that I
have a better solution. But maybe a warning in the docs would be
appropriate about this removed feature and its reason (not sure who
takes care of these).

You are quite correct, this is a large change and deserves further
discussion since it is removing a (admittedly experimental) feature.

I will remove this from this series pending further discussion on list.

Hi,

This vulnerability exists in libmicrohttpd_ws.so, which is generated when=
 building with the --enable-experimental option, rather than in widely us=
ed libmicrohttpd.so.

We don't enable this option by default,  also we don't provide PACKAGECON=
FIG for it.

How about we still keep the patch for fixing CVE-2025-59777, CVE-2025-626=
89, and add the following warning in libmicrohttpd_1.0.2.bb

+python do_warn_experimental() {
+    if '--enable-experimental' in d.getVar('EXTRA_OECONF') and '0001-Rem=
ove-broken-experimental-code.patch' in d.getVar('SRC_URI'):
+        bb.warn(&quot;This option is removed for CVE-2025-59777, CVE-202=
5-62689, if you insist to use it, please remove patch 0001-Remove-broken-=
experimental-code.patch&quot;)
+}
+addtask warn_experimental before do_configure
+

if the user enable '--enable-experimental' , warning is it removed. if us=
er insist to use it,  they can remove patch 0001-Remove-broken-experiment=
al-code.patch locally,  then

warning will disappear.
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
I think it should be the other way around. If we don't enable the
option and don't have a tunable PACKAGECONFIG for it, why complicate
and patch? If someone did enable it knowingly, they should fix it in
their append or recipe.
</pre>
    </blockquote>
    <p>if we don't patch it,&nbsp; should we add function like&nbsp; <spa=
n style=3D"white-space: pre-wrap">do_warn_experimental to remind user abo=
ut the CVE?</span></p>
    <p><span style=3D"white-space: pre-wrap">it is possible that user ena=
ble </span><span style=3D"white-space: pre-wrap">experimental,  but they =
don't know the existence of </span><span style=3D"white-space: pre-wrap">=
CVE-2025-59777, CVE-2025-62689.</span></p>
    <p><span style=3D"white-space: pre-wrap">Thanks
</span></p>
    <p><span style=3D"white-space: pre-wrap">//Changqing
</span></p>
    <blockquote type=3D"cite" cite=3D"mid:CA+s=3DJ=3Dz-d13udWyvARTW9hgMFp=
zDkNQi=3DCS7dPhcW2qMaQoLFQ@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
Thanks,

Anuj
</pre>
    </blockquote>
  </body>
</html>

--------------ulMBMXSeeBDEyJWT0mw0sHHi--

