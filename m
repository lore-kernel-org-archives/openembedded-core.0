Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF88ACD1283
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 09:45:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.33852.1711964729607724624
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 02:45:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=hozOL8kt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=48215f78b9=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4319bmlx016904
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Apr 2024 09:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=CySVcrGE3Pqd/LCS9FQJKDxecaxBFw8y/0arF5HsDrs=; b=
	hozOL8ktTyAg5Wal4KtTTzpU6WmQW+Ldgl2A9sbmcG9dDt+Cl1/ZOQJQRySB8MXl
	6m474N9LNPKTR8AIjFokgo9dRT7gDIS83jxIvIjssJ9XlK2shHCdiY6aZkLpGXeZ
	Z615UMgYxJSctIqRK+k8QUPpB3PP4iSGdY4OmnT1orkwiKAKBMZwlHJKYJXDYvmZ
	NZlRd0OxUQjRUpU8FeNeBvTvjXQL0GY2KlZFEYr697b0YxeisnVG5NrDyDKMCEqc
	xkpEJpGorzXdAOSe8VBz4aHoHigvOk02+bwrVAY1YiQJg/Du/QfVCfXXUAX/Lq4t
	seohnUzcQDdZoQVdAIq/hw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x69q6sqmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 09:45:28 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4319jSkD027621;
	Mon, 1 Apr 2024 09:45:28 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x69q6sqmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Apr 2024 09:45:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NET2uamdkNgtRNxiB1DLhinDLrOwLHejJXKhEln0oDBb1g7n9uw1QFOS+rC16W6bYEf7VBJ//WsSMbt+MkGevPKHLa5/okDrTdMsOsLmxn42J+xOcYcIv9cn0qU2CnvAg2xYE3XTzDwABUSFf8PRkf08ezspMvH3fLhR3FP+uyz0eq8vu7F6yxiW3bWlBcNplPMJSPhFWeRpmRp+V+7kzfgHPy8fhseU5CBYInFWp0so280tB637kzJ4eo2bPF/79fo1TvHax7Zmd7l+eiuFnnSd4FKthtzsjeUjr9eOO7bwFTeH+v58atm1w9vczViups01K2pM3DKDgKt300d/sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CySVcrGE3Pqd/LCS9FQJKDxecaxBFw8y/0arF5HsDrs=;
 b=WDOT3L5uU3Lncz0HK1gIEcD2fm4k21fmWghDTu5cUYG971R8GYZfFy5dSMt0ylV2HetMyMW9yWOsqFnDSLinfNPcy/QzsEkUtvHQHtk8JcnZCr7UJIlwB6Gu249eGIA+JIYHsj1LWIMKX6Nk9fyjZHezqAXBbOM8mo+17Dfch/KRSEy6JpYjQqff4INhScwLmmleGwXITV3A3VY3jXj/OiAjEu5UZBn0xnz2BlwG5mOCb3Am9pZzjujaPhJ4Ovv96KgQ/CCshnqJ+rgVAycKXOrtY9uHFDoDfumW/031zLCcT3sPw8CztgwTdBzIN+BOfkySEDiLr3MY/C4LA2FO1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by IA0PR11MB8354.namprd11.prod.outlook.com (2603:10b6:208:48c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.22; Mon, 1 Apr
 2024 09:45:26 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::86fd:8a6:5f86:104e]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::86fd:8a6:5f86:104e%6]) with mapi id 15.20.7452.019; Mon, 1 Apr 2024
 09:45:26 +0000
Message-ID: <3da103db-11b7-46d1-9a84-d69485c40194@windriver.com>
Date: Mon, 1 Apr 2024 15:15:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] glibc: Fix stale qemu processes left after
 glibc oe-selftest
To: Randy MacLeod <rwmacleod@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        Randy MacLeod <Randy.MacLeod@windriver.com>,
        Umesh.Kallapa@windriver.com, Naveen Gowda <Naveen.Gowda@windriver.com>,
        Sundeep KOKKONDA <Sundeep.Kokkonda@windriver.com>,
        Shivaprasad.Moodalappa@windriver.com
References: <20240401081011.479084-1-Yash.Shinde@windriver.com>
 <CAK6=ix4Z4cC7h3xzHpURNC8ZOWrBqMUYV1+xkGFWzFcSFH2_Rg@mail.gmail.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <CAK6=ix4Z4cC7h3xzHpURNC8ZOWrBqMUYV1+xkGFWzFcSFH2_Rg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1PR02CA0059.eurprd02.prod.outlook.com
 (2603:10a6:802:14::30) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|IA0PR11MB8354:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7yqEBg66TAkAbOZuBYMZQwPQ5S64x6zxGP3hWg/lsoG8FO7J9CBt3+Vq7qlo1JUX3b3lV7O6YczLI1lGucTY+oet5TBoQdg9Q6C7q2j2zW5uvhjsKFvmNPhd8ITxcIb5aot6FFp5LUHrh8q8ankMw7Q/Pg2knI7PPT0ZaaeuxOtzT2pOT8POLCNOeMYQw4ocTccMvCCeDXNtzDPCvHahF8DqYrMvEY8wqdLzM8wDYFQvuOGmqf+lgLbrqO7QQKJPCW7WVY+lolIyCpO9VUI2xmNVrLGnNg4IPgxwb/oBPGHpjo0Ep/MTGybkcU9YUpbOrMehpV5viPHE9zm4ij+esGHSOt25o4Aup0U/K/amMP2BDZJhZm8sQ2TQzAa871So7CilpRvCi9B77MaZj8sHBPwSX2rpLptYvjrLwWYsctZtkLiBPIGWy8WNDmMaFfH+WACVV5wtTikxU1H2Xh514WWlw0bORvlh2guYkPha6PQo/iRHZHHTQ3RveKvG30h93Ucar4ufplsVmk9eSoDOtjxFQKEpvZtyg4yoTWQiJ2N0fsgYu231kAeNV9dv0oc7CfR7wOJi7SP8JOg+rkavrGeZd1diWCWb5MsYqUnjIknwziAiJQaOABMfaKuiusO/je4pLY+yzTdtjoig1+SxvVKSO5gpJcr9BfEY8K1RA/Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VlBoeENHN0hFTC8rVmZIMW1vaDFNa2hoT3hhbEN2dC82cW9UYTh1dzE2MVBl?=
 =?utf-8?B?Si9mNEFsaUptYzNaUUVYcDhLVnhvZEwvK2dYbkg5eXhGczF0K1hEalZBckNO?=
 =?utf-8?B?YU05UFZhRHB5bFJBQWJpS3BYSitwbk9uUVhFVkQ0bkVyTmZBdTFBT05WREh5?=
 =?utf-8?B?ZWhiVk9PMm5KN3BsZm5JeTZTTE9LMjBybzNrQzRtS3hIU2k3L2Q2OUdtSHp3?=
 =?utf-8?B?RTlDQTVSSGdYTklpZjBDWnhWQ3NleVVQTXNyMTdiVFNCTmNEOWpaYU4rbnNm?=
 =?utf-8?B?SlUvQm84M3BsR1ZqZjRENUR0aXJEYmxiTW9jTUczcGcwaDhMam9yYzFtSyt5?=
 =?utf-8?B?cE9TOUgwTjVJR1NTYmV6MEFzcU1LajNtcS9ud3ozL3llVUc3YnRrZ0w5V1JR?=
 =?utf-8?B?Z0YwSEFkNGdhenNKc0t2WkRHRWE4YXpTQkJZRm9BdnBOT0x1cGFNYVd6dTlD?=
 =?utf-8?B?S05LbTFIQklrYitrc2xxOXNyMFJNWUdmcXltNXhXektPMTloS3ZtZUd2Q0JW?=
 =?utf-8?B?WHM2QXVnRXNLWHFzcFFieFVWSTdwVnpIcTJIWXN5WHhaMGtPUDUzTytjT0hN?=
 =?utf-8?B?a1Yxa0RwL3IrZG9TK2R5dTV6TUpybnVSUjBOVmFJK1hvVnR5YzVpMDJPUXlD?=
 =?utf-8?B?TXVjNnZYbEZNQjU4dDdycHgxY1huelZKWmxsYjdyMDlDenRZbU1PdCt3ek5V?=
 =?utf-8?B?cXhWQVgyMnBTbzB1cmVlUXN2K0VubzZCWmhoVThHYWRIR1ZoL2k3K2Q5WlFY?=
 =?utf-8?B?UzBYK3JrQVRDQlREdWg5eTd5QWgzSS9LODlPdHBpci9lclJ0cnZyNUp6cFh6?=
 =?utf-8?B?am05U2FnL3Q3OWRNVHhnNzR2ajYvSi93R3QrN2ZacG5OSmQ1TFBsYVpFQlI0?=
 =?utf-8?B?NHBQRElVK1VEV1NVdXNNenE3RU9UVEh3bGsxcks2eXc1b0ptQS9RVGJGT2dl?=
 =?utf-8?B?NE54UkRnZmk1NXVCNGJySU4rQmp6V2RGRjZ5YWNxL0lJSXVZWmVOUnNiOUcz?=
 =?utf-8?B?RndqMDF0YzRPYUxWR1FneFdqeFNhMnBVTmJGY0dHVE5lUVF1UCtOVk9XUmtM?=
 =?utf-8?B?dS9PNU9YQThCNzJtV3dCWWgrbUhaYnJyQUp3T0FTMFBwekpXRWphaklnREs5?=
 =?utf-8?B?c0hVa28zRjhXcUhwY3NKQzltcjgxZ3M5N2wzYzBRYlNtT1ZiVGNPcGkrcHBo?=
 =?utf-8?B?bjdvdWlKcGlyMEdIYy9uSGQyanZ6cWQzYkxKYzl0ZFJmQ2pCRVlGZ1VzeEZH?=
 =?utf-8?B?OWNDakJyclk1REVwTXJweUdnbFA4Q29kVW9QQk5qWXh3SHN4Q2xRMVdjaFhX?=
 =?utf-8?B?bUlhYTkvQlZtVmVPM0hqUEZ3VnZkZCtyMzZaNis4cWE1WEZaTVZVcFNCQjJI?=
 =?utf-8?B?L1hpWnpINjl5UGovZ1VaT0E2ME4ybU9LdjRpY1c1am01bmwvVmxDUU1uMS95?=
 =?utf-8?B?UHpUbzBJYzZuZ0pYYlRCOGNmSTBaNnNXTkEvWURsUjF0ZGxvWThBREFsVHdH?=
 =?utf-8?B?VlpMTHl0UENRL0Zud3o4Z2dZNEp1VHBTaTBsVG1nM0Y2WnlFcWdRZ2F5NHFH?=
 =?utf-8?B?UnpVVlk0RGVlOVBSdkZKdDdtdDNaajRqbkd3OWhNZ1hxSnRvQWlHbnpDVm5w?=
 =?utf-8?B?SU16MjRtT1NVZDVrSHNyRHpXa3hXVkRLNDBzWDFsL1l4VWhBMCt0MERBQ2hI?=
 =?utf-8?B?aGFFNE5iRlpZWUxJWVF3alhCaTFNVGdwRWlWYzRjc0tSckx4VXFJeFJFVkVI?=
 =?utf-8?B?bSt5aHczNkVvSVgrbU81V2JIODhLMU1wUmg4Q0dQV0Z3U2htL2NxR3Rac0NO?=
 =?utf-8?B?U2p6bnpjK0dlSkp5MGFhWk81eUJWYmd6OFVXV25QOXZaV1NaV3ZRcmxlNC9h?=
 =?utf-8?B?aHJpR2xCVFF0MkxEOEt1VXFLaFBuYzZpL3Y5TVdKZ2ZiZWpRb05yM0ErdC9Z?=
 =?utf-8?B?RXhYcDZEUmFxZng1UWRXRmNJWWtTdnJMUUwvTjVNMU5NMEJNS1RMTWt2QjV3?=
 =?utf-8?B?bkx0U05jRVNwUkMxSEV2QTRNOXN1MTNGZE81UjBjZUZ5ZTRLcVROTkRSZ0xV?=
 =?utf-8?B?cDRsRmtWcWtKaXRDSHVhTWRNeFZpaWFVSFVzNytZbHArSkZKSXVkV29QcHdN?=
 =?utf-8?B?QlNMcEwzQS9lOFN4TWpPeERBYk16aXFSZnVUSHRIV1M3WEpVNkNKeU0weHdN?=
 =?utf-8?B?QXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e45eba-e7c5-487c-8712-08dc52307565
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 09:45:26.3988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B3qhg9fxcATgtlTsH7Hd6mYexggr71HvgQpCMAPAoqBvrhHQwrPup22DJ4wUcpeg3q74BomlTpi8THhIn4ofhyaEjSm5e8ODa49AjfeXAeA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8354
X-Proofpoint-ORIG-GUID: 4LWlXvlsAjpOtVj1UMIi4inXvVXjwtTi
X-Proofpoint-GUID: wJA9Nt70v3nvOKq-bGnPEdrlO3nwlm40
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-01_06,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 bulkscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 mlxlogscore=925
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404010068
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4319bmlx016904
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 09:45:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197682


On 01-04-2024 14:36, Randy MacLeod wrote:
>
> The short log is misleading since this isn't really a fix.
>
> You have:
>
> glibc: Fix stale qemu processes left after glibc oe-selftest
Will send a V2 with updated short log.
>
>
> Maybe:
>
> glibc: Skip 2 qemu tests that can hang in oe-selftest
>
>
> Skipping is what we want for now but
> have you tried=C2=A0 wrapping the hanging test in a script that runs:
> strace -f -ttt -o foo <test>
> ?
I tried to reproduce and strace this issue outside yocto environment for=20
ppc/mips target but make errors were observed when cross-compiling and=20
building.
Thus, unable to capture strace logs.

With the latest poky sources, the issue is not reproducible locally and=20
unable to check there also.


Regards,
Yash
>
> Randy

