Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8431CCA5FAC
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 15:56:23 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.468.1790697382591817211
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 08:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=Xo/3C4Ef;
 spf=pass (domain: est.tech, ip: 52.101.84.58, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gaEqy07T+QoIdx8fTYEhHtIFatOGunH9NotaNnDal9/1zVdC1m+MnLa7fuT52ziPMkuJzlasXXfz68FlYcpR1ShW7OBuko3x/B9BTvFmzXc73hn90/FhNYgCm6uRO9AADuSDgX0ERBFhAQ5XRWibduQBdaJkQ847InrQIY5y6k+/Naj60RJWD/RwnI075An98iuDTVXFKcuO/cbXJxhHD7f4/35Vmmx+lan6Ys6Xy5WkPfFcXZXh03TdWL7gRLD0kkjRnLcGaZDeHZlaT1sROM3x9EmZiaqxzpwKCjjAmAcdP1/HIDQptpihBMbK9gJGQQLXzo1vsa6FEe6wsLVB2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Si4RfhstxXq0NJnSnvzkr0WjaQFupzyXWitqOcntZaI=;
 b=tYDmPH2YqpOljzSc/hpQLxruuK73aiouT54kWNSmWEK2E0QKHgC5D9xPYnaVy2nnpyUx4FCJrX0e9MpfXVQhtOJLtHmy1dtuRT0ixokvxPfBna1FNqbinoCchaw6cRnLg/jnVPn8ucMgm9jZQmxMemJBw6KN3ZawLBvkLgxExiM4rzQmveBQTaB9ztpmiDO0/3kmqXvNI4Q6q1k1wbqFCRf0xqP3ZzipJT7myRzQVi6KIQQYkEPAjvFTB1baW+e2n9ryih6OfIVNeIM06oWtgotEOPJq/mVv2aH11XxSG1a0Wqu4AoXjArpJUn621refuOJRU7sEcPK1LlpD+pIo7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Si4RfhstxXq0NJnSnvzkr0WjaQFupzyXWitqOcntZaI=;
 b=Xo/3C4Efo6yw7BcDxMQURl1NBRIGkk/z5EDxr8bEq/spOKPGU1PgkJ7s6JMTjvW94CBrNbYMj2ciwzs+dajCD5yBmbkt8cClAWwImbmUuROFSAs87ux0RkaRg3RPj4yOM4uEHvJJ+A25JopTFUuvOWpfyCjbILkzg+6u70el7BpZmXnW8UmO+NPRFIxcslE0By65Os3SNB+oU1sLhhdo0BIm8qFEV4gj+Cg4Q5v6AC0FzcfqVoDRac0DcbuNwj9U+UexW6cC7P8VfIqhZl81Pk7seMdb5BT55wmB7n0mXN5LLfo/HIugD2k8OC7gbu0iuzGN/q5rvRQpj9jzOwPjGQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GVXP189MB2053.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:6c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 15:56:12 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 15:56:11 +0000
Message-ID: <fd2d10b8-5d64-42ab-aeb2-64e320e33851@est.tech>
Date: Tue, 29 Sep 2026 17:56:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] gdb: Upgrade 17.2 -> 18.1
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20260929093506.88396-1-jaipaul.cheernam@est.tech>
 <e97ebd18e97df989e06522e09735e185e2fbb6c6.camel@linuxfoundation.org>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <e97ebd18e97df989e06522e09735e185e2fbb6c6.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0043.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::22) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GVXP189MB2053:EE_
X-MS-Office365-Filtering-Correlation-Id: b2f2f778-199a-4798-aa91-08df1e422f0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|6133799003|4143699003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	eSjWpQCBBEjYpKGmo3gPZ8XwwWQ5pyg0NdjkgOIdOhY7CjbwNMN4AU4DPFuxYC0rT0JFUoQSjocSdQMx6rfa4svHqzKpXukJ+q76RgdxD5PuBkaS2FFAoKrm+u2LsqYxcv7QhDkM5WrA1bA/SA2APi1nt8vSlXnGQEp2ePhArivJQixrQjbWNEfGT0Xhms/768PD0ka3JIvXLwmFpvkdLQgT/EqVwMyf4SYh+PenPqhd6Tscx8CAeXNBIVId4oUSpx9B+GDMhfeVJmfKI3Tn9HmX+Iip8b37CDP7K5NCaoxf0JBP8ONuq1KH9/xQy4lFaJ9BK2qrqjrnl70jLPkuO8t3DZ5m/0YyHN4veA2TAhl3o9AZ/ANPmxwv3bgjX9B2bqsim8FWONf2EriwPSYUz0vdk0uTX0xqaGfMmz5laMWWc4Vh9pqXzdlysgZH6Scn14bXbzIdbqO3Ad5dcxPvOtDcfbJEGFBQ42fpU20mR05TyXcORW6H2p1jcPLusjMQuUX4Myc7WTv4Zh3JeJQm4qt6nDauJw9J0jZkr0whRpVOvzTZIJ4S99iXTHuJyBgJLPrg4bm/gFfAJrA1pTaZ/Ae2NNBXqacT88E3NX/vbHw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(4143699003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TU01RVN6cE5FN0JrRnB5RjJqVHF3bG5iV0NqT1R6UVkvRFVSTmdRdDdsU2w4?=
 =?utf-8?B?VldWcG5FMGhwMWpNM1Jsc3pUOVVtcmt5a0x5STZmU1FMTzN2RVhHUGhQbE9W?=
 =?utf-8?B?dmJ0RVUwa0o5dXJ0L0lwQ2xUNVlPY3VyTWM2UGNVeE1qSms2TGROM2YrTDJw?=
 =?utf-8?B?V0FyczFMNEFuYUpUaGk3QysxMkxhaVhNajZreVlGSDA3MURIS1M4VjEyZlZl?=
 =?utf-8?B?T3I5M3NWNUgvaGUvb0FITVdQVFdTOWcwZzRtcnljNnkwak5vUnpEN3BwTFRy?=
 =?utf-8?B?Z0RoTlpXOWdtWWxuQ1Q4MUx2MmRzTVE3K0JCUFdLRWgvMm4zby9EYk9zeVBj?=
 =?utf-8?B?a28rU3VDZVVTWFpxRWMzYmo3WGVUQ1VLdTJ3S0JLK2RlMGRLRWRiODBCdDhE?=
 =?utf-8?B?VHRod3JnUGNSN3h3ZThPb0VGQkVzTE90cjhLMHNOcGx0cEFLckptUkMyMnNm?=
 =?utf-8?B?RFNPRVVKKytmTnkrZjkxVlZ4RkZjWUFDaW4xcGVQNVRPbFQvUHpubTRBV005?=
 =?utf-8?B?M25OOHZTemY4SzZLWkxjOEwyVkZTSUlkazg5THRHRHg3K1NwUFlhM0dHbWJK?=
 =?utf-8?B?OU5TL2N5T3VYT3o2eCtnM3JBbGN1a1BKOFFDT3o2SUF4bG5VYS9FTHRmTHUv?=
 =?utf-8?B?NTUxQmdMbFYwRFdrZEZPc25SOGJGRHlKSTRGSXErSW5DK2t2WVdGVVBkNFBJ?=
 =?utf-8?B?V3FLSEw0Q1NadnRKdUxnbGU5NHd6M0hIQTZ4V0xYZVIrd1BwQVJtUGsrTmNL?=
 =?utf-8?B?S0dPaHBDZ2ZsZ0RONHI0d2xHZTcxT3p6R2dvbFVHa1dockNBT0hXV1JjWis2?=
 =?utf-8?B?bUk4OFN3OGNRMlRneDJzOXgzZWhPZmRmSUg2UVZrY0hXeWZoODMvQXpUb3Z0?=
 =?utf-8?B?VllLUEJucTJxSVhDakhaM3RNaS9oVFVzVnVBRkh3RFZjbzBZeSszMHVrTHZI?=
 =?utf-8?B?M2tZcnVuQ1hScDJxOGw5YVRNSllmWUtiWGhnTXZGb2RZejJNZ3I0NzMvSFA4?=
 =?utf-8?B?ZXlVTFRlRFcvM2tEa0VSbU8vNEo1L0dBZk1MNFVLMlk4aVJ0TG96NE5BTi9K?=
 =?utf-8?B?ZHVCZVN6MTIweHEzalFsVDlBblZ1LzdIYUYrRmx4MWZndGVIYzE5VDE2L0lE?=
 =?utf-8?B?bkttR3p1Znp1MTNydm8rdTVvckt4eS9oWTA1YVVFaWdOZUR5QzlpellSajlQ?=
 =?utf-8?B?RWVSalJTVVRGZHVrQ1UybERhOW9ZVlpsd3dKRDIyQ1ZraFJNVmZxcEczWURT?=
 =?utf-8?B?Y1pBNmNIUnJqRGxUYlF5aUFQbFc2bjBDUUl3ckY0bmFIbnlVOURBLy9XVklZ?=
 =?utf-8?B?bzFRM3VMRWpYTjkyaHQya2NOd2dwbVI4WFRabUdUZWZELzIvelhLUzVKZnFM?=
 =?utf-8?B?a0JxbFVxUmJDTGdFSzY4NEEvWDFDNFcxSUdURkE5cDA3cDAwczFYMlVoVTJY?=
 =?utf-8?B?ZFJoeUlyOGhaNFBRcEczR1Y0bHNjODVFN0wvaDhkSXgwaTROdkdXK2dtaE96?=
 =?utf-8?B?djIwa25Pa3cyWDZsR3crUGhjTFAzeDUzdE5kUXZtb1IzVTdMaU1oY1VOSE5p?=
 =?utf-8?B?dUl2T293S0MxSmF2c2ZVWkZVb2RnQ1pnR2VBYTZjaXZ2YjNLRVAydHI5bFA2?=
 =?utf-8?B?R0JQLzlwaHlYUFlVZEl0MVZPNkNsM0ZsNU9vRVp2Z1lYMEw2Y1BxdFEzRHVN?=
 =?utf-8?B?bmN1aVZ5TVMzKzBrUk1NQXMvV1lXLzFYekNDZnpFOXNjUmswUWxMNnVlWTRh?=
 =?utf-8?B?aHd0Q1pJNkVKclU5bHgxWXBNdkwyVGhLQUc5alRtU252ckxJRzQrTHk1Sk01?=
 =?utf-8?B?aUhxU0VzK2JhRjBIQnhwOGhibitBRVQ1aGJUOWVLdWtGTlFaTkNsLzlHYWdF?=
 =?utf-8?B?S25WdkRURVA2M1dWR0wrbTVUY1N3cFkvVTBHeDdRZmFNM1luczY0U1lmZjNG?=
 =?utf-8?B?REpBdGc2RFRhUkpNbFF2NWgrZHczaDVQb3J0NFh2R2MvK1p6Zis0MTNlSUhF?=
 =?utf-8?B?cDFsNTlzcmlNS1RYb1o1UnYySnY3cWYzSnhKUlVCQWMrYTJmT2ZVRUx2Rmkw?=
 =?utf-8?B?MzhTQUpmQ3FzSDk0b1pOQnQ2UXg2Q0FFTGlQcmZ5ZVNjWFNDempFRmU2OWsv?=
 =?utf-8?B?VlVWejdhSU9KdWVHUjFrM3p5WTdNN1FBUFlTbkxGRTlWSy82QnN6WHh6Z3VB?=
 =?utf-8?B?aE1HRUpBb3RIOE5ocjJDOW45SmYwUVNJMGx6Vk5HWXhDcWF6eThpRS8yZDEw?=
 =?utf-8?B?ZTErSUhTakMxaFpDbkxNMzBQemc5RDlDZGkxOTE3UUhrNmt5a09iWEhwQmUx?=
 =?utf-8?B?Rm5kWmhKdm03V2FyakNGS2FRTzliWUpSMktsR0EzTVdMTENQWTFVdz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b2f2f778-199a-4798-aa91-08df1e422f0d
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 15:56:11.7104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YpAk7WcpWTXO71R1e/4GAMFE2oDXYogSFl/NZTsrifZ28Cvp5cbZu6wAfQYgQVnIvlZfLmrLUyzLaPSFzeZuPYgkMDSSWQVQ4yNONM7FB7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB2053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 15:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246877


On 2026-09-29 14:08, Richard Purdie wrote:
> On Tue, 2026-09-29 at 11:35 +0200, Jaipaul Cheernam via
> lists.openembedded.org wrote:
>> NEWS:
>> https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob_plain;f=gdb/NEWS;hb=gdb-18.1-release
>>
>> - Refresh existing patches
>>
>> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> I think this triggered:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/4785
>
Hi Richard,

I tried different combinations(with musl and without) locally on my 
machine (ubuntu 24) and no issues found.

Could this is be host contamination or sstate issue ?

Can you retrigger autobuilder again ?

Regards,

Jaipaul


