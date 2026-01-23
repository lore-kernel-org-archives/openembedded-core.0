Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB55ED7236F
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 10:35:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64935.1769164532948686849
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jan 2026 02:35:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=fdx5Q20M;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=548386c3dd=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N4o2Ek3158193
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 02:35:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=pWbOFN7nQXLii551sHs+xR
	pKhcdCxm1SpxyygiQ6aag=; b=fdx5Q20MYqK3oudEkbMQlrOsMLjKtt+FJn+Xzb
	6SqZCXEMknwB825Oni366TMfaPWBl3IxF+2sjX3shTol7lKYfoOtNDVNO/bGU5Xb
	hCKdieKujPMT6SZK1Ud/r+Xc4BFevFnWY8IDlMYWDysQrQBTMmnjZjI3Y8R1zi/I
	IQdJidvP6ODy3DLVcVeDj2i2RzGAJvO/SPBmkJejFCn+orFV0TBtk6LqX/hAv2Zl
	MKZB3g6pGff7BUrEYBsWD0EIB5cGVGvCSDTugyjaEvHmhSB9T692pPIXKVTVLHrV
	F9r7jHO1itMVQ2Lcn/zDN4nnSd7nDNzjV3SXUyzBUT+Dwh6A==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012007.outbound.protection.outlook.com [52.101.48.7])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4btn75v0rf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 02:35:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OxHmjOQgUfKcFE8s1ETfwkMXhKiBnl/M9Jp0AR1GmF2jcTDsrcbB/JYcSU4geiLEbCajnmkjdBFLi/HGo0LNrRIqxagQjvTmnTAqbNuTJbrrEyZ61cJaRNZo3kFo8lGA71LxQnLZUovrfQoO6Q7+JVNEgi+OPGarhfftGxoIR6WSziR13T6DPxPpm54Org+27nvRPZaWLQMfJkGTV8Q7GphQSDQYphjoI9BRZK6Gm1kDCJ/Ls6c0Hhj96lx5Ymzi2Jcf6KBdbI3Xz3VpMTYCoVm8iOIw6BC6e2CHHkQkWHIYA0a3h4Jkca9XviO9nbJKygVfyXxc+XjiHvqdZLsl6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWbOFN7nQXLii551sHs+xRpKhcdCxm1SpxyygiQ6aag=;
 b=PCpKl8v2m8k9HnF7Cqx9PW0TZgquNPJ0QP2LeUXczE+OarwNHlQce5Fa0qQJG4Zn8zcLICFsLOpSUIdJwL9lcuXR8j8KKEsqJVHYWCsx9OVXqX1Hq1z+E8y4JrGfk8sPjpqiQ27F1LSHrrOqwQ38G8+oawIg5M4s/nufI4rD0y9X4BNF4ktgyUrnx1v1g4Cugr5FryF/q2o+wtsAz0gawn2bJKE7GzqTEw0B3kJ6ZhrIpgUdutnSVMhvvI6hIfn2gfTNoWtzJ5qUJMAFFrHsmJAQu2XK7k/V6gUjhSqkPdOVzstcRXU0yZVUBPCNBoGpptcF1E3JVda8dPjrsjNQrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by MW4PR11MB5800.namprd11.prod.outlook.com (2603:10b6:303:186::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Fri, 23 Jan
 2026 10:35:29 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%3]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 10:35:28 +0000
Content-Type: multipart/alternative;
 boundary="------------lMvY0CKxcwvXA0mjjaI1tqn4"
Message-ID: <703def79-e544-412c-bac1-4d30cf7ad65f@windriver.com>
Date: Fri, 23 Jan 2026 18:35:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V4] go.bbclass: set buildid to empty string to
 improve reproducibility
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com,
        mathieu.dubois-briand@bootlin.com
References: <20260114064400.4070617-1-changqing.li@windriver.com>
 <a065254107d5d01736b8a68b67cf53c0b26fbe6e.camel@linuxfoundation.org>
 <188AC968E243AEBC.2595076@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <188AC968E243AEBC.2595076@lists.openembedded.org>
X-ClientProxiedBy: SI1PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::7) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|MW4PR11MB5800:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ee315e1-329f-42bf-fd24-08de5a6b2086
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|4022899009|1800799024|376014|7142099003|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TUFaZFpGOHF5aFJrNjRNVkRmdUVNTFBBakdCUW05WldmZ3Q2U1pCbUpmNWhW?=
 =?utf-8?B?aDNHNTlxL0Z5cmJNdkVDcGFadjdLcVlxakg5YkhLcXJEWlZPc0VPOVA2VzVN?=
 =?utf-8?B?MU1RRTFyMTc0Mlc5TCtwanNZOVJpZE42ZFJIQW1xRWhZQ05UVXJtVzIxMnE3?=
 =?utf-8?B?WkNLMmxuc2FoMzMvQnFJbEdQd0xUYlhVL3NqbTNNYW01WncrNllMRjQ5aWhB?=
 =?utf-8?B?K2ZmUTJXdzJRYm1rZkdKL0hieCtHMDJ1a3dvRTNZSGtvZUVzeHZHK2ZTQ2l3?=
 =?utf-8?B?bGJsRCsxU2owQUx5eUc2bHdUSjZYc0RZRXBoanQxNSsvWnNvOVVxVXFtTnFt?=
 =?utf-8?B?M1JjZ1hLTzgzRStqV3FVbWQzZ1pnUVAzeFgxV3EvSVdwa1RsWE1JRXJUdzFx?=
 =?utf-8?B?Tmg3aFBEb1BXbU9La3k1R3BpT0FpMG9HS0FpdXhMbGFQcFpKNHBueGE2aWw1?=
 =?utf-8?B?K1FIY3dqbXNWMnRlSE9XaFZWcjdVZVFHU1c1VVF1aHlBeW9KSWNVS2pRMWtl?=
 =?utf-8?B?ckVmd3FXc1F4K1NoVnJ0TWFLSEoyM3VyNDRIS2h0RGJhK2huWVVKVkdmTTFi?=
 =?utf-8?B?cFZXbkE1Q2FMS21SSjN5NDA3RDRBWEVtdXZGU2dyeGRLU3BwcllIbzIxQ3h1?=
 =?utf-8?B?cmtKcVNJaG5YMHVFSjdOWFQxU0lCbXcrYWJJUVUvV0pNNVhTVCtCU3FZMGxC?=
 =?utf-8?B?NjVaTU5vSjduY1N2Uys5WWFQTEZFaytRdUtINHR1Q0VlWmtwMjdJRktmdDRB?=
 =?utf-8?B?MHpwMStUZzBCZ3hCRHliNnF1K1ZCeDhrNzdENG0yRWFuNnVxRG94NXNUNitx?=
 =?utf-8?B?RzYweVhQTGZyS24vYUZOZHI2N3h1NEx6aVNVV2RNVXd5T0dEOXZqVElteDBw?=
 =?utf-8?B?c1lub0dDNXRHWW1SYVI5cDlCUG5uV3VmbjZtRVBqQm5aM3Z5OVlLVFg2alU4?=
 =?utf-8?B?RTgxVmlkeE0zY2NkdjlOWGlRYlFPTnBSYUJ1TTZPS3VHb3VkUkZjQjhIaUpO?=
 =?utf-8?B?Sm9sZktKVkp6TDZ3VjNWSHJPUUYwRW1hVjNNdHU1MHI2V2YrTm02cTZ5eHNu?=
 =?utf-8?B?anR5TXZCUFJkc091elMwaDVFU3VFSEtYelJ5QjlyQVBaM3VFOTBxNjg0dy9t?=
 =?utf-8?B?dTRDR2hrbVpzTlNydWI1VUZPU2xIbWtndnBVckNtWStWallhaVNSc3J4am10?=
 =?utf-8?B?MkV4bzZOTzB0YUlaUklQbU5oUnR6R3NadzlnK3FMK2JMdGk0VG04bFlSZmQ4?=
 =?utf-8?B?Y1Zpell6REdZK3VITGVQdE4vUDJBalRnNXFBNmxZbk5YTjUwY3E2dHBudEY5?=
 =?utf-8?B?b2hTSkRNWEFENWgxRVlpayt0L3NLSDFtdHFuTlA2bmVtZUZPR2xRdkxOK2JB?=
 =?utf-8?B?RjZZaGhCZDk0dE93cS9DcmFRdEsveWdxY0hvV2N4QW5EeW5IL1BIaDBlRmZy?=
 =?utf-8?B?aXg5MkdNaC82K2ovNzA2VW5xbUprQ1VtSlZtZ0dSWUxoME5NUTRuUW9BQWR2?=
 =?utf-8?B?a1JxdjcxKytmbDNSamJ1cnoyK2lodC80MmpxS09nbzhRaWlzVkVjSDloVi9D?=
 =?utf-8?B?U2E1TWhtaTA4Vit0eE9mM3F6aWFnZ1l0RUFqdWRGS0tBK1g4cHgxN3J6a1pH?=
 =?utf-8?B?Y1lBaDI3U2pkSUtvTGJKdWhJcVdzUlpJNVIyeG8wRE80TW5XL3dER2xFQW82?=
 =?utf-8?B?STFNSXVjdFFBTFByNWpRMG81K2dIR0ttR1l4U2ZtakFPeG5OWEVqQzgyRXp1?=
 =?utf-8?B?MjQyME14WUxDUEM1T053cmpHbHlKS0hYK3hrd3Z1U1E4SFpTZld1cXhHQWxq?=
 =?utf-8?B?MWhvbC80eS9ZMGxxNlY1ZWh4OHlRb0U3NktuQ29JMkp6RlRZdFBpYXBLUzc2?=
 =?utf-8?B?aXpMOFlJWGR5NUcwdHR2RVZ1c3RvYUlMQlJ1cGpyRDhrbWNFSTFQaTIvbzMx?=
 =?utf-8?B?T0tiNVZxQWxwb1ZxUnN4V1B1dTFmeEFNUzJrbk5McVlSdDEyWml6MzlkcnQr?=
 =?utf-8?B?STdsVnI5MXZuTU0zYXhoWVpuZVJNVDcrWTJPSTR2eGdKMkFtTGFORUlPOE56?=
 =?utf-8?B?WS84R2hITVRvZHE2OE4rQ3BwV0ZmRks1WkJWdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(1800799024)(376014)(7142099003)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aDRrVFkwTnBZeU5CdnJHK0FwYXJ1ZitYdWtIZjlhMDZpNDNBM2x1UGpSQ2F4?=
 =?utf-8?B?Rk01ZVJsMU02WjQ2SXYzaU13amJNTlNvU2xkRnhYWGtqeXlla1dLUmJlM01n?=
 =?utf-8?B?ZHliTDlXOFFOSEw2bGFrNEE0UzJMU3UwWG9uMDdteDliUWpXM2cwVDFkN1JQ?=
 =?utf-8?B?WjJhMmdmZHVnVlZJazJ1VmNHamlIdC91aVFsUmRPZVE5ekIzci9hbEV5Yy93?=
 =?utf-8?B?T3lJaktpb3FQeUtBdVdjWkNuMmJNRHhOMW9SRTRmejN2K1Y5Y2d0bnFoQmZU?=
 =?utf-8?B?ekUwU2xRUlpNNkE3RjhSRlMrc3kyMzJ2clhvcHdrSjBUR1ZKSUVWdWZ5eEla?=
 =?utf-8?B?VDJSSFA0b3Z6T0VGc2VRaVpRWVkxTXJLb0RMVER2aStmZEswVGFpVi9ac0Y5?=
 =?utf-8?B?WHhEZHJKRW03TDUzQ2RHS1dxKzNIQ0doWnB2U0VyaFZBVDdIcDhhYzljL3cx?=
 =?utf-8?B?L1ROUTNwciszbWZrOGtTdFVEMmlkanJFekErM3BHODZPZWlvcUxsQlY1a0tR?=
 =?utf-8?B?UjczZmk5NTg5MnFITFlqRldRM3ZTcXRmK1JBa1JDNjhGQTZDeHRzME5ZUThF?=
 =?utf-8?B?enZ1QnpoTEtFZHJNWjdMSk9IQVE4eitDSXJxaVFNMHZjem5DQ2tlNGF1RWEx?=
 =?utf-8?B?OHR3SCs4U2JXZFpaeVJQbTFRUVd4TVhWM2JIa1J0clc0SC9TdGZnNXBwb24y?=
 =?utf-8?B?WnFuK0xRWjJIRHRkLytPaXpvNlViUXBRdzFCeUJ0RjVEYS9YWHlneHlNamJ1?=
 =?utf-8?B?RC94OExUNDE4UlIwQ0hueXVERkZHVkJIbDlkY3JxQUtRNVEwSUg1OE1nUzBh?=
 =?utf-8?B?ejJHZENyQzM1V05iT1g1RHA5eWF6RWVwMHlxMzM4d3FjZ3VPZW40TFdwcGpG?=
 =?utf-8?B?YmkrMTJkbnRROFUxTVdBVm5MMnpUU0VDUjNnTU9wcmZiTytGTkFFenZwSVBo?=
 =?utf-8?B?d0FNeC9ic1ZaR1A1d2QxTzQ3TmFXcnVuRjBBNnZtdWJneFp6VkZ6cmN4TkQ4?=
 =?utf-8?B?M2xWcUpjUHYrbGZ1b3RxWHVPdTJQUUdXN0owSjRFVDdsYVF4NDJTY1krTDM4?=
 =?utf-8?B?RW5iczZmWGJsa2l4UWFkakp1cXZ1anJtS1l5M0tPTVpGUXhWZzhYNlBMZGRU?=
 =?utf-8?B?ZDNKTktMTUNtRExSbnVnaVRxTzFMc20yRmk4bE1rOU1rZHl5QlBvY1U5a1Zr?=
 =?utf-8?B?U2VxNG0waEx5a1BnWUd4dzhhVXNkTlBQakhIN0VwdDd3allNbGpBd3gzeU1Z?=
 =?utf-8?B?bk1YOTRjMW9NY1VzOUVDV1hOY0xJTitKUWg1aXNubUVCSmZiQXFUakRJQmwz?=
 =?utf-8?B?TFNySlBDU2JWWlp1SlluaGE2NGQvY3oxL2d0dlQ0WHEvQUVXRHpUUWs2ZDd5?=
 =?utf-8?B?OXNkNC9tNkQ0dGZUa0dCV1hZK0thUTFVZmNaOW1wRkR0TDIyaEIzOXZuT2Fi?=
 =?utf-8?B?M21mc0VMMVlQY0ZJVURnQW1RQU1PWmdTUGVqUUVYT3V4U0duL0p5Nm5pVzNz?=
 =?utf-8?B?aVBqY1NZTmJ2cjd5OW13cVJKY3gxdFZTZWhlVEhPSzRBdmtrS2tZZjRkZnMx?=
 =?utf-8?B?cFRBT2tBL3FrRU1CYzJxR09JdmR5VDRvcnN0cXRFQ2Y5TUhvYWZQVnp3NHlP?=
 =?utf-8?B?OXEyNWhYaXhqb1BDNFRqbVhQQW9oWDRSRWNYdmZyVkRIOWZHb3F4bUtJZUcr?=
 =?utf-8?B?SFZJZzI5SjRKWHdMd0ZyNGx5T1VhbVM1TDAxQnZLME8zUlYrTTNSam94RVNq?=
 =?utf-8?B?RTZFUVIwZDZtSVUyVlhWalNsNGlWbmhJcTlYZTNnbzZ1RVlNa2haa2FNS1F6?=
 =?utf-8?B?enl4Tjg0UGllRDBha0c0a1paTVUzV1VCV2p4NkZVdVNqaUVhMys2a1VBWG15?=
 =?utf-8?B?cGxhOGF6R2pYdTJaVEo3QzkxbG5ZUVk2TmJkNDI5S1dyaENjenNQcTlpb0hx?=
 =?utf-8?B?WFJCY3dKd2JPWmtRZ3ZEejFWOFA5bmg1dEVwYjRlWGVWaWUyOE0ySDAxcXhK?=
 =?utf-8?B?cTk0eDFkWFhheXBoK3dHbzRvVjZWVzk0cU9jU3JJY25WMGk0UlFQSEFrcDBN?=
 =?utf-8?B?Mk1aQkpKUTRlQWJrbFV1eEZYVjNuRG42L2p0bUxjODdGWWR1MzVtNjNZMyt1?=
 =?utf-8?B?cDZWcXhwUExvcnJwQnNGWkprYWU1VE9oWVF3d2cyOFc1c1QyZ2wzWHBzNko3?=
 =?utf-8?B?bWVCT1lmclh2TEZvSlJwUWVyZlJaK3Y2NDhBSlpqeGMvSjBRVVBxQlZ5eFR3?=
 =?utf-8?B?TlhxUVFWa1d6UlNjZHpuak5maTZ4WHJtektDMnJNbVowa1hjbkxWVkc1RUFF?=
 =?utf-8?B?aTRlTzVSZFJJOW9aMTNyQlA0U1lqZ1pTWTZwbnZuQmIvZ1E2b1FhTmF6UzVo?=
 =?utf-8?Q?WPJGlMnGpSzAhv0I=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee315e1-329f-42bf-fd24-08de5a6b2086
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:35:28.8409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PCK6hOeYNhSuwF48q4fDMkjrV2ZO24Wez9qi9VU1eumP1RtjP7+SmqWjTAuFY9i3wp5qSpi3H97RrqG8PSntFHwg66MMIoa3G29TQ2eIJLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5800
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: xNKQtJ88wD1mV8Zq47N7-YhLA2au8e4-
X-Proofpoint-GUID: 4geFq-iorqZgpHW9eTmsZhruJYVXhAL4
X-Authority-Analysis: v=2.4 cv=fpzRpV4f c=1 sm=1 tr=0 ts=69734ef4 cx=c_pps
 a=F1HhE1toGRAZ88wdd1wKFg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=UGXAvUmdAAAA:20 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=4YrxMwNkCVFhItU02EsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1sP1sHNm1_C1K6Rph1sA:9 a=T9d-ExRxuD7nmG8y:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA4NSBTYWx0ZWRfX24guTbZdV9He
 o1AVJfS6tXmrzTsb9NcYuzr9ok5uMWKhbri42xGGmeLU36HAmpUX/qjlEMOvaHhV6DN/dIjQ2Ea
 DUl0InZ1/9j7lWv4PcRAiDoOktXgbRV9FKgRegf2IGgfqy4bOk+uZODFbfpsNd6ewWgKEMEtcX9
 U9r+bvsj7XGZenADWH4aeAmAYYM9VY+9PgCKMx20fhJqal5o16stBWkaFv+stUIWl4K5ldKbldQ
 ZYCFX7GgmlGoVm/I+8XQMWVcM0p+8hZ9WgVZgCkHDOD6Rxc7k0gMFBdDITsP1lJfcuJxLYvmZkk
 vWDWEJRTrFTn/qZDnyaAgDyhSqW3QK4rcY9jIcmzpCCV/+tQUTT37e1c/31EWArA+0aVTYZXsuW
 GLIoVLCA/rSD4tm9DYnsGomwJCY6XGudFRxaShA0zsRoQbkN4LasVWtX4IJ3h0oHz/k47iWb2Dw
 T/ox0PcIvOxLfrl/4ZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 10:35:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229879

--------------lMvY0CKxcwvXA0mjjaI1tqn4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60N4o2Ek3158193


On 1/15/26 11:20, Changqing Li via lists.openembedded.org wrote:
>
> On 1/14/26 20:36, Richard Purdie wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the=20
>> sender and know the content is safe.
>>
>> On Wed, 2026-01-14 at 14:44 +0800, changqing.li@windriver.com wrote:
>>> From: Changqing Li <changqing.li@windriver.com>
>>>
>>> Go packages and binaries are stamped with build IDs that record both=20
>>> the
>>> action ID, which is a hash of the inputs to the action that produced=20
>>> the
>>> packages or binary, and the content ID, which is a hash of the action
>>> output, namely the archive or binary itself, Refer [1].
>>>
>>> And action ID include hash of modroot, which will include build path,
>>> so this make go package not reproducible.
>>> Refer [2], keying off module path instead of module root directory=20
>>> is a TODO.
>>>
>>> [snip of log]
>>> HASH[moduleIndex]: "go1.25.3"
>>> HASH[moduleIndex]: "modroot=20
>>> /build-a/tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/recipe-sysroot-n=
ative/usr/lib/go/src/cmd\n"
>>> HASH[moduleIndex]: "package go1.25.3 go index v2=20
>>> /build-a/tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/recipe-sysroot-n=
ative/usr/lib/go/src/cmd/buildid\n"
>>> HASH[moduleIndex]: "file buildid.go 2025-10-13 16:08:43 +0000 UTC=20
>>> 1704\n"
>>> HASH[moduleIndex]: "file doc.go 2025-10-13 16:08:43 +0000 UTC 558\n"
>>> HASH[moduleIndex]:=20
>>> 007b9fe2edd5b3232f5c98ae6c46e80a435141cb627ba5418c5314c0cbf4df7b
>>>
>>> Report this issue to upstream, refer [3]
>>> Workaround the reproducible by setting buildid to empty, refer [4]
>> The trouble is there is a lot of potentially important information
>> going into these buildids and you're just removing that functionality
>> entirely.
>>
>> Can we patch out the problematic component until it is fixed instead?
>
> OK.=C2=A0 I will check if it can be patched out.
>
> //changqing
>
>> I'm very reticent to remove them entirely, that doesn't feel like a
>> good solution.
>>
After do more investigation, it turns out that the not reproducible is=20
not caused by what the previous commit messsage mentioned modroot.

The root cause related to the cgo_ldflags, which may include build path.

Take buildah as example, it deps runtime/cgo,=C2=A0 and runtime/cgo is=20
compiled into ar archive file _pkg_.a,=C2=A0 and=C2=A0 it includes _go_.o=
,=20
__.PKGDEF and other files.

_go_.o maybe include metadata "cgo_ldflags,=20
-ffile-prefix-map=3Dbuidpath/xxx=3Dxxx", and meantime, _go_.o, __.PKGDEF =
all=20
embeded go buildid in them.


build buildah, deps on package runtime/cgo, so "import runtime/cgo=C2=A0=20
'contentID of this package'" will be part of actionID of buildah.

'content ID of this package' is the content ID of _pkg_.a.=C2=A0 we canno=
t=20
change this content ID by simply exclude them like

what this line has done:=20
https://github.com/golang/go/blob/master/src/cmd/internal/buildid/rewrite=
.go#L46

because the build process will use this content hash,=C2=A0 sometime veri=
fy=20
cached can be reused or do cache verify.

it is related to how go design like.

I have update this analyze result into:=20
https://github.com/golang/go/issues/77086.


And seems fix the reproducible issue by passing -buildid=3D is a safe way=
.=20
It only influences the last step when generating elf, the previous build=20
process still use the original actionID and contendID,

if we set buildid by pass -buildid=3D,=C2=A0 it will influence what value=
 will=20
be set into section ".note.go.buildid" in doelf.


Bruce had suggested to set buildid to a proper value like SRCREV.=C2=A0 i=
f=20
you all agree with this solution, I can try to send a V5 patch,

if I can get SRCREV, set -buildid=3DSRCREV, otherwise, still set buildid=20
empty?=C2=A0 like:

GO_BUILDID ?=3D ' -buildid=3D"${@d.getVar('SRCREV') if d.getVar('SRCREV')=
 !=3D 'INVALID' else ( d.getVar('SRCREV_%s'%${PN}) if d.getVar('SRCREV_%s=
'%${PN}) !=3D '' else ( d.getVarFlag('SRC_URI', 'sha256sum') if d.getvarf=
lag('sha256sum') !=3D '' if () else ''


Regards

Changqing



>> Cheers,
>>
>> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229382):https://lists.openembedded.org/g/openembedd=
ed-core/message/229382
> Mute This Topic:https://lists.openembedded.org/mt/117257536/3616873
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [c=
hangqing.li@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------lMvY0CKxcwvXA0mjjaI1tqn4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#ffffff">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/15/26 11:20, Changqing Li via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:188AC968E243AEBC.2595076@lists.openembedded.org">
      <br>
      On 1/14/26 20:36, Richard Purdie wrote:
      <br>
      <blockquote type="cite">CAUTION: This email comes from a non Wind
        River email account!
        <br>
        Do not click links or open attachments unless you recognize the
        sender and know the content is safe.
        <br>
        <br>
        On Wed, 2026-01-14 at 14:44 +0800, <a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>
        wrote:
        <br>
        <blockquote type="cite">From: Changqing Li
          <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
          <br>
          <br>
          Go packages and binaries are stamped with build IDs that
          record both the
          <br>
          action ID, which is a hash of the inputs to the action that
          produced the
          <br>
          packages or binary, and the content ID, which is a hash of the
          action
          <br>
          output, namely the archive or binary itself, Refer [1].
          <br>
          <br>
          And action ID include hash of modroot, which will include
          build path,
          <br>
          so this make go package not reproducible.
          <br>
          Refer [2], keying off module path instead of module root
          directory is a TODO.
          <br>
          <br>
          [snip of log]
          <br>
          HASH[moduleIndex]: &quot;go1.25.3&quot;
          <br>
          HASH[moduleIndex]: &quot;modroot
/build-a/tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/recipe-sysroot-native/usr/lib/go/src/cmd\n&quot;<br>
          HASH[moduleIndex]: &quot;package go1.25.3 go index v2
/build-a/tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/recipe-sysroot-native/usr/lib/go/src/cmd/buildid\n&quot;<br>
          HASH[moduleIndex]: &quot;file buildid.go 2025-10-13 16:08:43 +0000
          UTC 1704\n&quot;
          <br>
          HASH[moduleIndex]: &quot;file doc.go 2025-10-13 16:08:43 +0000 UTC
          558\n&quot;
          <br>
          HASH[moduleIndex]:
          007b9fe2edd5b3232f5c98ae6c46e80a435141cb627ba5418c5314c0cbf4df7b
          <br>
          <br>
          Report this issue to upstream, refer [3]
          <br>
          Workaround the reproducible by setting buildid to empty, refer
          [4]
          <br>
        </blockquote>
        The trouble is there is a lot of potentially important
        information
        <br>
        going into these buildids and you're just removing that
        functionality
        <br>
        entirely.
        <br>
        <br>
        Can we patch out the problematic component until it is fixed
        instead?
        <br>
      </blockquote>
      <br>
      OK.&nbsp; I will check if it can be patched out.
      <br>
      <br>
      //changqing
      <br>
    </blockquote>
    <blockquote type="cite" cite="mid:188AC968E243AEBC.2595076@lists.openembedded.org">
      <br>
      <blockquote type="cite">I'm very reticent to remove them entirely,
        that doesn't feel like a
        <br>
        good solution.
        <br>
        <br>
      </blockquote>
    </blockquote>
    <p>After do more investigation, it turns out that the not
      reproducible is not caused by what the previous commit messsage
      mentioned modroot.</p>
    <p>The root cause related to the cgo_ldflags, which may include
      build path.</p>
    <p>Take buildah as example, it deps runtime/cgo,&nbsp; and runtime/cgo is
      compiled into ar archive file _pkg_.a,&nbsp; and&nbsp; it includes _go_.o,
      __.PKGDEF and other files.</p>
    <p>_go_.o maybe include metadata &quot;cgo_ldflags,
      -ffile-prefix-map=buidpath/xxx=xxx&quot;, and meantime, _go_.o,
      __.PKGDEF all embeded go buildid in them.</p>
    <p><br>
    </p>
    <p>build buildah, deps on package runtime/cgo, so &quot;import&nbsp;
      runtime/cgo&nbsp; 'contentID of this package'&quot; will be part of actionID
      of buildah.</p>
    <p>'content ID of this package' is the content ID of _pkg_.a.&nbsp; we
      cannot change this content ID by simply exclude them like <br>
    </p>
    <p>what this line has done:
<a class="moz-txt-link-freetext" href="https://github.com/golang/go/blob/master/src/cmd/internal/buildid/rewrite.go#L46">https://github.com/golang/go/blob/master/src/cmd/internal/buildid/rewrite.go#L46</a></p>
    <p>because the build process will use this content hash,&nbsp; sometime
      verify cached can be reused or do cache verify.</p>
    <p>it is related to how go design like. <br>
    </p>
    <p>I have update this analyze result into:
      <a class="moz-txt-link-freetext" href="https://github.com/golang/go/issues/77086">https://github.com/golang/go/issues/77086</a>.</p>
    <p><br>
    </p>
    <p>And seems fix the reproducible issue by passing -buildid= is a
      safe way. It only influences the last step when generating elf,
      the previous build process still use the original actionID and
      contendID,</p>
    <p>if we set buildid by pass -buildid=,&nbsp; it will influence what
      value will be set into section &quot;.note.go.buildid&quot; in doelf. <br>
    </p>
    <p><br>
    </p>
    <p>Bruce had suggested to set buildid to a proper value like
      SRCREV.&nbsp; if you all agree with this solution, I can try to send a
      V5 patch, <br>
    </p>
    <p>if I can get SRCREV, set -buildid=SRCREV, otherwise, still set
      buildid empty?&nbsp; like:</p>
    <pre>GO_BUILDID ?= ' -buildid=&quot;${@d.getVar('SRCREV') if d.getVar('SRCREV') != 'INVALID' else ( d.getVar('SRCREV_%s'%${PN}) if d.getVar('SRCREV_%s'%${PN}) != '' else ( d.getVarFlag('SRC_URI', 'sha256sum') if d.getvarflag('sha256sum') != '' if () else ''</pre>
    <p></p>
    <p><br>
    </p>
    <p>Regards</p>
    <p>Changqing<br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:188AC968E243AEBC.2595076@lists.openembedded.org">
      <blockquote type="cite">Cheers,
        <br>
        <br>
        Richard
        <br>
      </blockquote>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#229382): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/229382">https://lists.openembedded.org/g/openembedded-core/message/229382</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/117257536/3616873">https://lists.openembedded.org/mt/117257536/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------lMvY0CKxcwvXA0mjjaI1tqn4--

