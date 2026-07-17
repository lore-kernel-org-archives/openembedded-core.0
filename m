Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93598C4451C
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 16:22:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.390.1784305367908785542
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 09:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QZX2WAXU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1658d8e000=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE7D3R1302150
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 09:22:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=FQ7/L5oHB+1grAHsze32Jo
	rndDi6GUyqJOHpF4Nfb+Q=; b=QZX2WAXUyciTLD1vX3OaKXznknrYdl/5Xtl7W7
	ox4G0UBYHtiZT4b6u4GKqTtG4SHUcISOuSQRT8C3p4T0V6Q/+5xVxW+ejm4EVlyy
	+EzhodpVTq/HfQC0fO5vCoUS2ps7TSm1EYifMeF98jUS3jTLNjpot0UKZQgA9eWy
	qbV3cWeaCACjXWxGgSkwL31gupJGhbkDYGQ386BCUDqLmcSSpn/iF07t0zRH4GjC
	r9UkrK6gvXC9aybtbKkOSQEFX+Ssj9JwO30+rZ96ghBMQgLqiYH9kwo0GYQ8XGPH
	FUn0oFMUNcsoKAEoduTnA3KhwnwGyv9ziymwpYhvWshL030g==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013059.outbound.protection.outlook.com [40.107.201.59])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ffgn58rx7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 09:22:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GdYlOEVqJc/zmsWqIH2KVR4jQKuODpcvFBrD7mvPdUfzye6v9YI8DV6I6EuYaq4N0F9wIEjhtMyZsOhZu2R62sbccfkm/9yuDC3llwrN0uoVLkdHwh+WPuPSSwdFEclmno3SASsaJi5UYEYV7MT3XxosiwcrZ3wz1aPi1zjPk6Hlmer6neb+pMDA4TFmKoeTxA9CG/YQHTQF6FF8reAQ6rrdZVUk9sJxN+5tHVo1Ilf54tkSU8qA5+VFNZ3JdbxefFsbRzD410TTXjt1j1PXorf/Mi/3te2uNRVPCcz1D/uSL31TgMqk38gs4VPBrI34gcWRlfdxlj61KygzXQ/FvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQ7/L5oHB+1grAHsze32JorndDi6GUyqJOHpF4Nfb+Q=;
 b=fQSF5/XsAGL+qcRvF70NFSLl7Ox+mnPcCkqQvErx03Hl/KT9ERllct4ZoLw9kOOdF6sJ9FIT8Jd22fDH9AaqbW9HaKl33qy5wLLjr0/LLCNJAw970+Qnkei2atTWZWE/aLH4lffYUwHobrszCZlTGYy+6KXDXexZ2zl/SFswPGCrjYy220Q8TcL4Q8k9R17ZhRpfUCutfhP3CYyhVjPe0A/ugJbD0+tN4YZvA8jZqtMhMMZd7d4kNWii5+IaEEvK7vuaA6bPOZMhxR8J1KHTSc99JLw8X3p4of5mFbWmy78X+Q9KpXTI/gmUlnajqkYOyUctOXGDwnM37131bwXkPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by CH3PR11MB8752.namprd11.prod.outlook.com (2603:10b6:610:1c2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 16:22:40 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%4]) with mapi id 15.21.0181.014; Fri, 17 Jul 2026
 16:22:39 +0000
Content-Type: multipart/alternative;
 boundary="------------FCeGmWnE1ZAEB7V80P0edZiJ"
Message-ID: <daed6c1a-6db7-48cf-94dc-ffd74af4181e@windriver.com>
Date: Fri, 17 Jul 2026 12:22:37 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v8 0/9] rpm: 4.20.1 -> 6.0.1
To: mathieu.dubois-briand@bootlin.com,
        Robert Yang
 <liezhi.yang@windriver.com>,
        openembedded-core@lists.openembedded.org,
        "Gavini, Sumanth" <sumanth.gavini@windriver.com>
Cc: alex.kanavin@gmail.com, mattware@cisco.com, esparlin@cisco.com,
        peter.marko@siemens.com
References: <cover.1773324129.git.liezhi.yang@windriver.com>
 <DH0XA8PQOXXR.12KPIBAF43RZ3@bootlin.com>
 <1f50dc21-bf2a-4b2f-9a39-9ef5137f26c6@windriver.com>
 <189C7BAFC42D9B2E.1443259@lists.openembedded.org>
 <DH2B7SIOV4KX.3PZ5RW0V6NOSR@bootlin.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <DH2B7SIOV4KX.3PZ5RW0V6NOSR@bootlin.com>
X-ClientProxiedBy: YT1PR01CA0116.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::25) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|CH3PR11MB8752:EE_
X-MS-Office365-Filtering-Correlation-Id: ec38aaaa-d9dd-4be3-ec8d-08dee41f9f03
X-LD-Processed: 8ddb2873-a1ad-4a18-ae4e-4644631433be,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|4022899009|1800799024|23010399003|13003099007|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003|8096899003;
X-Microsoft-Antispam-Message-Info: 
	iwIzeLugDESkhK6m8lk6/YCSn1q6TgG9F+C5LQZYDQRnu3XKjZU4DcbiqTm8CDuSNJf7YHXhFwDlsbXhF1aN2Vsbkj3B0m0e9FPYTNR6joPqj5RabWKtscHkZddKWZpRWsxkkeDVHsssbIdn9m6iSiJM/8yAbbQTTF+Z3cy8gmLcOL8c821aNRVnDG56ArAlu1dEJNnM3f+Cw68xDuDNL+ZJKycjuip/rRMYwsqE4IiGMYX3s5Nae5rTl1GEAh4wTWdczKYM6WGmJQ1n9QAMbHCMKIXQMwolQ0sbsAzvWZEM1hmiDBtecP64zIwP/Mdxmk3OwRjxMmFQctmsDVkVFT1+qrbHWfo0azKbCJryoZ35gFm9zyxT7GcWN0biTjiVqgLYMVfeV0/QDyvSeHgsqWW2gogY5jF0FxTjxpPtNqudobYd0SX9WUZdE05KYjzXebcKua8C9CvX3bx1Fd7vgZOAmBNt2Q7mni+aiqSxvoI602jArmd8oXUier9N/d9txNB7VNP6UdSNDSdfjmc0/ncpm7ub+O9YLe+7BQQ2d9VY1ctztRJxwYgltrUiM4Q1VYJQEnGCVGFbUu+iMMZXpK/ZIvgcIxq7GAxZkWtWeSY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024)(23010399003)(13003099007)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SjB5U1drRzZiY1RWMHYvR1ZLSWNqcjI1YlBkWUdCek54bWw0azMzdzBPcVJI?=
 =?utf-8?B?RGxKWTc0NFh6VjdRd1hkNnJkOVcybisrNmJtaDV3b1dvZGdqSm1vVnpkY1Jy?=
 =?utf-8?B?R2hvTjYvWi9iVFg5VVh5ZTg3dU5NSlpIbkF1dTc0WlBHYXBSUlNDOVQ5YlJi?=
 =?utf-8?B?TS9hT3AzMzc3ZjFZMlpPbUx2SG1OV0VpNThFV1Fnc0U4bFFJak4wR25QMVMz?=
 =?utf-8?B?aHdWTnRJU2N4RzJNc1kvWXgxYnJlQjJaUVIwMFVzN2pobkZVMDRPeVI0T0Jn?=
 =?utf-8?B?Vzc0aHhSNHpiZXBqNEhjWVUvU0VrUENBU1ZmcFJjeTZ2MVJRSEJ6TVdCbG04?=
 =?utf-8?B?SGhud3lvcWtpSVRveS9lbFBFNGM3ZUEvZW9OVzZZT3dsU1J4Nllsekx0bVVz?=
 =?utf-8?B?MmwwdnJJYVpMbWhCSFpybnF4eExpTlFvZk1Md0hkUkdhUittQVRXakp0WG5q?=
 =?utf-8?B?N1kreC9LcE1TOG1meXMrTFBpbk9sUitGb21lR1I2aG5JQm5qT1lwdHZFam9P?=
 =?utf-8?B?dWtPeVFueWI4TWN5ZUovV0FncHNjUjdYU0tjb1BHNk1vVmUwYTh1WWtBNUJX?=
 =?utf-8?B?NkVoUnV1T0tZM1JVaDRTTmVZL2VOUm1OTUxoQmMzck5oakdQRmZUcmpPdFNN?=
 =?utf-8?B?WGVoRWgxTXdDRytQcUhaYlUwMGIxdFpnaDlEZFJHb2k3R3JVSU1XYk9uTjBO?=
 =?utf-8?B?b1MxWklsYytjZC9nbThGZGNXRW0xYVFra0VXbmQwd29uR3BjNG1xZUt2STd3?=
 =?utf-8?B?cmoyWUc1V0hiNUo1M3FvelAxb2pWUzZsNFZMaHdsSERJQmZBTGdKMG9GR2Nl?=
 =?utf-8?B?RXJoNDkwZW1welJodDBCSFlsU2RKNGhuY2pJaDZDdGdqRTNhb2lWcHpQbHJx?=
 =?utf-8?B?aFdrQ1Rod0t6VUs0L3BVcWc4ankvUmIwN2xjdkZ0UjBWMEFqdGVCK3Bmc253?=
 =?utf-8?B?SFhPajh0eHdWa1pvaVM0Vk0wbENBM2JMV3hUVzFnbnpDZnNzMVVzQm9qM21a?=
 =?utf-8?B?N1Nka0VESGxLYjllNUJ4d2x4V1FEME1UV1JZeXZKWDFYL1Njelc5aDRJS3BH?=
 =?utf-8?B?UzdLck5EVWNRb0xTaTI1amlsRER2UFVZb1NZN1Z3VTdBT2tHNzFGUGNDQ3BI?=
 =?utf-8?B?amRNcWZHT0cvOXVjNW1pY1l1OVI5U0hKNERud0YwYTlvRk9NT29JMkdMeUdL?=
 =?utf-8?B?NzNacHBxd2NjUG8zRElzbmViN1c5V0MwbkVjNlFMTUc2b3hSU3cvNTZWOHZN?=
 =?utf-8?B?RU02Z2FnSzB3REp6bUJER0MvcWNDVEZycW1sUXdnMFV4eXA5WWtOdzYwVE1j?=
 =?utf-8?B?cSs1UG5FbEVYQ2UvWC83djFNOVVlT2pmaGNtTjJodXVQOE5yTTN2WGl4WEFV?=
 =?utf-8?B?MHlKL3p2WERSajAzb0VtZzNYaEdBdTR2WmJ4U21nT09aRWJxbTdxSHpOYmIv?=
 =?utf-8?B?WE04YXo3ZExsaFRmSUlhL1JwRGlPOFFra0xSOXVuZ3I4UjhRZ21QcWpsWmRl?=
 =?utf-8?B?U2VLcnBYWUtNSXk4MVRLR1VxRE96VnZPNFpJbmRObmFRMWxLaml3dm5uRk1o?=
 =?utf-8?B?U2V2ZXRad1RreHcxWkErRkQ2MDFYY1I3RDRpM0hSeG8yS3doZWtCTHJ5S2Jk?=
 =?utf-8?B?Y1VZRXJaOHN2amNxb2F0M2RoUUgyMVZ1UVpLbDZsbG1peHF2SC96cm40Y1hy?=
 =?utf-8?B?aTFpc1NhWXpGUFJyZzdOaFMzQ1QwclF5RzBsQnpBOEhkNVlZNFBMQTlrcWYv?=
 =?utf-8?B?NU01S3VBVkw5N1ViOXpjUEh3cTRwZk41TitUOXNzM0p5Y09TNDVZL0p6Zllk?=
 =?utf-8?B?YytDVC93SDhvNXpKZkY0dW1UWm51L3dvYy9Xa20yTW9IRElOUjc0UDMwb3Jy?=
 =?utf-8?B?QjJ2aFB4MGI0ejl6S055TW1EVHRQQzNIY1RCVTNwTm42bWg4MjkzcjVlVlRK?=
 =?utf-8?B?bU5oWk5oT2k2SlowTG9tbllKT20zZDlmWVdOYlJRYmRNUDdLTE1qK3I4VnFL?=
 =?utf-8?B?T0ZDUjFhM3ZqWnQwRmYxcVNHNk05QVBwUW5JWjZ3NlY5Qmh3UXRLZkx3aUo4?=
 =?utf-8?B?cjlyTThEMW56aTRqdHhvcklmNFRHcWpLcU9DdnoyUXJYbzBWdFB0Y2NUczZn?=
 =?utf-8?B?S1JKVng3eU1lSDNHOHpzQTFqWjVyQjVITmR6YnNsamQ3VUVsZ1FaYUI1SjdF?=
 =?utf-8?B?eTZwMjBIT1dpSllPWnByR2l4eHV5RU5teTg4YjVyZ1JHRFQwYm5kTWdlQSs3?=
 =?utf-8?B?dEVPRE5YbTZieWc4eXJXbUgvV0M2WnBIOXg0REo4K1NHWWVCZFpZcUF3NmtW?=
 =?utf-8?B?Z2pGalpZdjBXUSswd0xFdjdURXczdjFHRnAxNE1yTXdqRnJiSjVNVmlPMWZl?=
 =?utf-8?Q?70HB2535uEd2AqeY=3D?=
X-Exchange-RoutingPolicyChecked: 
	TsFBDJMhMNVOvCL7WSP8O44PMyd9UzRA5k5u2k19/aO4XK7v12V0flf/ZudvRzi+4Qo5cF4PnTJFsIKnPTEslt6xk7w0axpQ7j9M8MzUdolgsGVhLpSj9Vm2rmKro6wQL1whhjBjl4Q8FBRKCzVF2jUyjUJfPbZa14jiiBusL8GOUIXbxaAfxYnqX/dcHSDEd2V8/8zUuYgMQAxNsU291bwqMk1ece0RdgDp/ofkwiEEXjXP9cdRmTNvm2uJ3WCO9BFDqCEPAC5qv4JUov1aKqDhHi3SLyd5HweiCiv6quTOH109ksxZwXGua+rmsH+3HMwh1IfUITrhrPr39ick5Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec38aaaa-d9dd-4be3-ec8d-08dee41f9f03
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 16:22:39.8370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jo4ah8HUjbYziVQbd78wBNLiRFkOErurMcHFMOHDlVfJ76ZQSRfGT0H0LvhlTYVoK10wvN3iH7W1V2z0+AC9Wg9kqEf/A+2zb6oupzC5lsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8752
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=eYQNubEH c=1 sm=1 tr=0 ts=6a5a56d7 cx=c_pps
 a=xAoCywwWBQ/pNZbveyboNg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=neLBuZkd3ITohzi8UGEA:9
 a=QEXdDO2ut3YA:10 a=P-IC7800AAAA:8 a=r6-ERZ6UWyl8cCneKWsA:9
 a=qwMPqfJ5lc6bRvwJ:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: BOYWTGvAUH-OLOgAzUedjPcTly3eEwuy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE2NyBTYWx0ZWRfXz5X6pA6MYXvo
 xM5iRX//gja18VMVZsx0N19OXqD68uUXYUPULsZ0aNvbmeHG/lldQwns/RUzSUqqzPUchdEYenG
 1k3+vMmae5eJLw20Lbfge0yghR9pI/N6CVdl8rh9GbAkyh3r4E/Um/Qerh5imyPVyVb9y1PJpgW
 Nd34wtPKcS8W/WrLJSBT8H0yBIdDoDV8uE2znz1p7XoXciXfRVO+1+5rQmM5T79z1YdFGMS/qGX
 gDyAi0dJkKmSDh6XCIxKWe49+3lkOoob7WdNe1tmx1WFGZFr7dLfYp+9mkp/pFa1qqCyP/f3PBx
 kEgu7JbYWbnF7dtUtPRFFKZnl0tNOLBhwYuztLwszUFI/f9brD0R57G2r/oA9e9zmyKutRp80Rc
 PiEr4gBd2z1WQ//5hbPNdLBkbmuB90Gr8RS/IvSOKSMM6jMMwBf3V8tzSThqLATERScfK/dG4y6
 Jkyn55aP5fWYqdi4vpg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE2NyBTYWx0ZWRfX1Ysc/RKmvxOj
 KQD3jX7R52RLRQ538cwVTBl/RN10nd/XgECM5eRs6mEin0xVhCyKRYLEi1jK7s1bpwjTsqdy/5d
 Lf2M6O3C1ZgT6DMm9WmN4q0bfIJ8lXGankbNZYxIvxk2jQwWeIJL
X-Proofpoint-GUID: cUPL6A4FmsBC7FRVfnSrUozqUdBCnQF6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170167
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 16:22:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241216

--------------FCeGmWnE1ZAEB7V80P0edZiJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Everyone,

Sumanth (CCed) has joined Wind River and will pick up where Robert left 
off unless someone has
things underway already. Sumanth doesn't have Robert's deep knowledge of 
rpm but
he is an experienced developer and will make this a top priority 
immediately.


The first step will be to refresh the patchset locally without changing 
much but then
he'll update to either 6.0.2 or 6.1-rc2. What do people advise for the 
version?

../Randy


On 2026-03-14 03:00, Mathieu Dubois-Briand via lists.openembedded.org wrote:
> On Fri Mar 13, 2026 at 7:58 PM CET, Mathieu Dubois-Briand via lists.openembedded.org wrote:
>> On Fri Mar 13, 2026 at 5:54 AM CET, Robert Yang wrote:
>>> Hi Mathieu,
>>>
>>> On 3/12/26 23:52, Mathieu Dubois-Briand via lists.openembedded.org wrote:
>>>> On Thu Mar 12, 2026 at 3:09 PM CET, liezhi.yang wrote:
>>>>> From: Robert Yang<liezhi.yang@windriver.com>
>>>>>
>>>>> * V8:
>>>>>     - Fix build with systemd (Check patch 7 for detailes)
>>>>>     - Make rpmbuild can find the pkgconfig (.pc) files in /usr/share/pkgconfig
>>>>>       (Check patch 7 for detailes)
>>>>>     - Backport a PULL from git/libarchive to fix oe-selftest failures.
>>>>>
>>>>> * V7:
>>>>>     - Add 0001-scripts-pkgconfigdeps.sh-Use-pkg-config-from-PATH.patch:
>>>>>       To fix "bitbake core-image-sato -cpopulate_sdk" error on Ubuntu 24.04 when
>>>>>       pkg-config is installed on host, now the host contamination has been fixed,
>>>>>       and the patch has been submitted to upstream:
>>>>>       https://github.com/rpm-software-management/rpm/pull/4127
>>>>>
>>>>> * V6
>>>>>     - Fix -cpopulate_sdk error when DISTRO = "poky"
>>>>>
>>>>> * V5
>>>>>     - Fix RP's comments: Don't hardcode libc6 into package_rpm.bbclass
>>>>>     - Use SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} to fix the loop dependencies
>>>>>       between /bin/sh and libc.so.
>>>>>
>>>>> * V4
>>>>>     - Fix loop dependencies issues for libc6 and busybox
>>>>>     - Fix issues for can't find pkg-config files (.pc) on qemux86-64.
>>>>>
>>>>> * V3
>>>>>     - Fix Alexender's comments
>>>>>       a) Suppot rpm 6
>>>>>       b) Move rpm-setup-autosign to rpm-build
>>>>>       c) Remove -DLIBELF_FOUND=False
>>>>>
>>>>>     - Fix build for nativesdk-rpm
>>>>>
>>>>>     - Drop patch for createrepo-c since it has been upgraded (rev:
>>>>>       804a238c8a4e86c2bcfb2192d54cb861d5fd32a6)
>>>>>
>>>>> * V1 & V2
>>>>>     - Initial version
>>>>>
>>>>> // Robert
>>>>>
>>>> Hi Robert,
>>>>
>>>> Thanks for the new version.
>>>>
>>>> I suspect I still need to get some gettext patch with it. Either yours
>>>> or the one from the glibc upgrade series. Is that right?
>>> I think you meat the following oe-selftest error:
>>>
>>> ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on
>>> locale-base-c, but it isn't a build dependency? [build-deps]
>>>
>>>
>>> I can reproduce it with pure master branch: (rev:
>>> 438afb3ded629408172c4bd7d556c5d2abacd631)
>>> PACKAGE_CLASSES = "package_rpm"
>>> OE_FRAGMENTS += 'core/yocto-autobuilder/autobuilder'
>>> MACHINE = 'qemux86-64'
>>>
>>> IMAGE_INSTALL:append = " glibc-utils localedef"
>>> GLIBC_GENERATE_LOCALES = "en_US.UTF-8 fr_FR.UTF-8 en_US.ISO-8859-1 de_DE.UTF-8
>>> fr_FR.ISO-8859-1 zh_HK.BIG5-HKSCS tr_TR.UTF-8"
>>> IMAGE_LINGUAS:append = " en-us fr-fr"
>>>
>>> $ bitbake glibc-2.0
>>>
>>> So I don't think it's caused by rpm 6 or gettext upgrading, and we don't need
>>> other patches.
>>>
>>> I will check how to fix the glib-2.0 issues, but it's not related to rpm 6.
>>>
>>> // Robert
>>>
>> Hi Robert,
>>
>> So yes, I have this issue, and I'm not having it without your series:
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3399
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3290
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3517
>>
>> And some reproducibility error:
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3579
>>
>> I will try to build just your series on top of master and compare with
>> master. Maybe some strange combination with the glibc upgrade.
>>
> Ok, so here is an a-full build with RPM patches applied directly on top
> of master: we have the same issues as yesterday:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3410
>
> selftests:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3526
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3420
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3298
>
> reproducible:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3592
>
> By comparison, here is an a-full build on master:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3414
>
> I there any test I can do to help you?
>
> Thanks,
> Mathieu
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#233072):https://lists.openembedded.org/g/openembedded-core/message/233072
> Mute This Topic:https://lists.openembedded.org/mt/118279443/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------FCeGmWnE1ZAEB7V80P0edZiJ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <head>

    
  </head>
  <body>
    <div class="moz-cite-prefix">Hi Everyone,<br>
      <br>
    </div>
    <div class="moz-cite-prefix">Sumanth (CCed) has joined Wind River
      and will pick up where Robert left off unless someone has<br>
      things underway already. Sumanth doesn't have Robert's deep
      knowledge of rpm but&nbsp;<br>
      he is an experienced developer and will make this a top priority
      immediately.<br>
      <br>
      <br>
      The first step will be to refresh the patchset locally without
      changing much but then&nbsp;<br>
      he'll update to either 6.0.2 or 6.1-rc2. What do people advise for
      the version?<br>
      <br>
      ../Randy</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2026-03-14 03:00, Mathieu
      Dubois-Briand via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:DH2B7SIOV4KX.3PZ5RW0V6NOSR@bootlin.com">
      <pre wrap="" class="moz-quote-pre">On Fri Mar 13, 2026 at 7:58 PM CET, Mathieu Dubois-Briand via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On Fri Mar 13, 2026 at 5:54 AM CET, Robert Yang wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Hi Mathieu,

On 3/12/26 23:52, Mathieu Dubois-Briand via lists.openembedded.org wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On Thu Mar 12, 2026 at 3:09 PM CET, liezhi.yang wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">From: Robert Yang <a class="moz-txt-link-rfc2396E" href="mailto:liezhi.yang@windriver.com">&lt;liezhi.yang@windriver.com&gt;</a>

* V8:
   - Fix build with systemd (Check patch 7 for detailes)
   - Make rpmbuild can find the pkgconfig (.pc) files in /usr/share/pkgconfig
     (Check patch 7 for detailes)
   - Backport a PULL from git/libarchive to fix oe-selftest failures.

* V7:
   - Add 0001-scripts-pkgconfigdeps.sh-Use-pkg-config-from-PATH.patch:
     To fix &quot;bitbake core-image-sato -cpopulate_sdk&quot; error on Ubuntu 24.04 when
     pkg-config is installed on host, now the host contamination has been fixed,
     and the patch has been submitted to upstream:
     <a class="moz-txt-link-freetext" href="https://github.com/rpm-software-management/rpm/pull/4127">https://github.com/rpm-software-management/rpm/pull/4127</a>

* V6
   - Fix -cpopulate_sdk error when DISTRO = &quot;poky&quot;

* V5
   - Fix RP's comments: Don't hardcode libc6 into package_rpm.bbclass
   - Use SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} to fix the loop dependencies
     between /bin/sh and libc.so.

* V4
   - Fix loop dependencies issues for libc6 and busybox
   - Fix issues for can't find pkg-config files (.pc) on qemux86-64.

* V3
   - Fix Alexender's comments
     a) Suppot rpm 6
     b) Move rpm-setup-autosign to rpm-build
     c) Remove -DLIBELF_FOUND=False

   - Fix build for nativesdk-rpm

   - Drop patch for createrepo-c since it has been upgraded (rev:
     804a238c8a4e86c2bcfb2192d54cb861d5fd32a6)

* V1 &amp; V2
   - Initial version

// Robert

</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">Hi Robert,

Thanks for the new version.

I suspect I still need to get some gettext patch with it. Either yours
or the one from the glibc upgrade series. Is that right?
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">I think you meat the following oe-selftest error:

ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on 
locale-base-c, but it isn't a build dependency? [build-deps]


I can reproduce it with pure master branch: (rev: 
438afb3ded629408172c4bd7d556c5d2abacd631)
PACKAGE_CLASSES = &quot;package_rpm&quot;
OE_FRAGMENTS += 'core/yocto-autobuilder/autobuilder'
MACHINE = 'qemux86-64'

IMAGE_INSTALL:append = &quot; glibc-utils localedef&quot;
GLIBC_GENERATE_LOCALES = &quot;en_US.UTF-8 fr_FR.UTF-8 en_US.ISO-8859-1 de_DE.UTF-8 
fr_FR.ISO-8859-1 zh_HK.BIG5-HKSCS tr_TR.UTF-8&quot;
IMAGE_LINGUAS:append = &quot; en-us fr-fr&quot;

$ bitbake glibc-2.0

So I don't think it's caused by rpm 6 or gettext upgrading, and we don't need
other patches.

I will check how to fix the glib-2.0 issues, but it's not related to rpm 6.

// Robert

</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Hi Robert,

So yes, I have this issue, and I'm not having it without your series:
<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3399">https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3399</a>
<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3290">https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3290</a>
<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3517">https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3517</a>

And some reproducibility error:
<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3579">https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3579</a>

I will try to build just your series on top of master and compare with
master. Maybe some strange combination with the glibc upgrade.

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Ok, so here is an a-full build with RPM patches applied directly on top
of master: we have the same issues as yesterday:

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3410">https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3410</a>

selftests:
<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3526">https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3526</a>
<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3420">https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3420</a>
<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3298">https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3298</a>

reproducible:
<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3592">https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3592</a>

By comparison, here is an a-full build on master:
<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3414">https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3414</a>

I there any test I can do to help you?

Thanks,
Mathieu

</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#233072): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/233072">https://lists.openembedded.org/g/openembedded-core/message/233072</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/118279443/3616765">https://lists.openembedded.org/mt/118279443/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------FCeGmWnE1ZAEB7V80P0edZiJ--

