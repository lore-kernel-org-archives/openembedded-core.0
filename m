Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9147E7490C
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 04:03:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.114901.1766549034312072443
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 20:03:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=etd5QeQE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4453214dcd=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO2dEp53905463
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 04:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=O190zucwPUmI0+Hbn9mwah
	tKEC6Y0dwG82qyPZF14PE=; b=etd5QeQE9Cq9kDOBLibcrIZ0UnuCCZQd/PC6e3
	PxtLk1zIcrgq6eqMB1RLx7erVKf+EdUzjZMqIH4uZv3GnAvpOyze51Kr/RrwAiGR
	c5xl9hSZsr4bAML/Q/VJwksM6YyrZ4+B+jBdTKhgQFPkgsVZBTWbX7qwJ8dh9wEd
	4p7DXLDLsNbsD5MmsBRkDtVfVKTaqpHBnTuz9Exk0bOXBDXYAKgmNmDsPCK2QSu+
	cGqwykuNH6O0E4WF4v6LbUmemvUNoi+G21H/ugf9qBWOiZT+VMNP5dpLuxzP320q
	p9wu3vuyAZpENdGC4uXd305AWzwsQjJbi/RRYcHTFwzNpDSw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012004.outbound.protection.outlook.com [52.101.53.4])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5h0vkvsu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 24 Dec 2025 04:03:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dYPU7yF5FrGckI+DRbRfASeTRUpPBB2syNvR6VA6SVYPyrpf6KlhqHGEjKkwnvzUPRwev7KS0DZHpCuZDhG76q48+RjliR/8cdWCUPAiNx2GmzwSLlKAcAdG4qnF7tWBQW0/QeP3Pf0ZhEnZZ/sEKoDws46MOWavPSyUCQhR7xkhwRQlyOdabjIMS9u246O3ElUfatAOHR9Zn9azY8dhFMKGa7AnX3j3n8r8SF0pFbvO40S/K2ChKoRNzWL5rq2NKL9KIKVkel33MX89BaVJsS+Omc8wwr44TM0gntxmftnN9cXX8azKlZwvoqy6L9iJ9U9Rr36FTuEXei/RmQ0xLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O190zucwPUmI0+Hbn9mwahtKEC6Y0dwG82qyPZF14PE=;
 b=yHJ0zc4BMVMaG+VgGQEeFhiYu3lIn3EiMwXiEQq5Ob459cHPquF+PKz0JXlwkaGg8TUQSfSoDyIbktydpUmd008skaOpHEaRDFQ+1y+fHJx5LQ9/RZFFZqRk9D8Rci2MPqbH9UE5QzFS0YvytGFtL8PSjhmL5QfvxCik+5cHrFp8jci1G+7BOMp6LVySew6i6taYdVlOhAiZ17Od7a+5T4BsO0qBBtarkDvnJTCkkVjAeeFseuZqfnCZkK46DFv8+ecALhMwj4JjzhoNvkn81U5Z7fXy7XM60q2njgAklBIHjXmq30ErSoTajVU+CIIwfx4pgu63zc1pRX16D+8kqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 DS0PR11MB9454.namprd11.prod.outlook.com (2603:10b6:8:28c::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.11; Wed, 24 Dec 2025 04:03:50 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%4]) with mapi id 15.20.9456.008; Wed, 24 Dec 2025
 04:03:50 +0000
Content-Type: multipart/alternative;
 boundary="------------cBl09suF8Qj9JGc06ERYmVyk"
Message-ID: <262b02d4-1c96-4263-af56-77e2578aab68@windriver.com>
Date: Wed, 24 Dec 2025 09:33:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] rust: enable default uwtable and ignore arm no_std
 test
To: Randy MacLeod <randy.macleod@windriver.com>, Yash.Shinde@windriver.com,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, hemanth.250302@gmail.com,
        nick.owens@eero.com
References: <20251222093830.2658141-1-Yash.Shinde@windriver.com>
 <20251222093830.2658141-2-Yash.Shinde@windriver.com>
 <c1d0b949-5995-4f60-8e94-98dd73ab5a3d@windriver.com>
Content-Language: en-US
From: Sunil Kumar Dora <sunilkumar.dora@windriver.com>
In-Reply-To: <c1d0b949-5995-4f60-8e94-98dd73ab5a3d@windriver.com>
X-ClientProxiedBy: MA5PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::7) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|DS0PR11MB9454:EE_
X-MS-Office365-Filtering-Correlation-Id: 7933c645-b3bf-40ee-8375-08de42a17194
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|376014|1800799024|366016|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VEF3MFlqVXBLZUJiOG1VRE9Pb3JDaUxBcTlETzlEaGNuSmExTkhFV3JpbVc0?=
 =?utf-8?B?cmZTR3JNa2J4Y0NqczJvUGpKeTVHcVdzWFkwaTViTEphblhocFZ1ZjFCQXc2?=
 =?utf-8?B?dGtLYlcyM2ZocHU4ckpTYkF6ZW5MS1Y1Umx0cFZ2N1J2SlRlcjdyU3ZiV1NN?=
 =?utf-8?B?VTRLRkRPZGJIdVdzczZ2RmRYTmRKMWYvendSNzVlM3h0bXBLQmxhaG1SbWxH?=
 =?utf-8?B?Ujc5RXZzRndBOXlpWmFQT2hVRDRoTXVveWtBVmJKWFhkeHFSLytjaGhJY2pH?=
 =?utf-8?B?OTZMaW5EWTU2VTVOQm81NkZSS2pTQ0wrSmtkd3p4K3Z3WGMwL2QyamZxeVoz?=
 =?utf-8?B?dzErYmpPOHV6WmFGSnVyYUZxanh3TFJxQzhMRmhlSnN1K3A0NjljSHlTRDlY?=
 =?utf-8?B?YWFMdEttMUNKTm1FZUxqaHhnNGJmWjByNkh6elhadXkzRkIyVy9xTXk2Q3lW?=
 =?utf-8?B?SEhoSjNpUmJzRzZzcWR2WVpJZDJGc0ZyVlpZWXEzLzlnNUJKRjVXTUdPZzR3?=
 =?utf-8?B?VWVwQUZmQVE2SW1HbnFVVytoQW94UGM1NER4eXdQaitPN3lXdTg5d21xOEsy?=
 =?utf-8?B?d0lUdlNUaDM5ck9Ka015N0FEYVVpek96TE1HUDRKNjUvM3RJT2FiRHJjcVlx?=
 =?utf-8?B?MzN1ZktnNkNnK0xEanZWMmp4ODZXd2Vzb1BSYVZpVWlLcldzTE5WazNzTlpE?=
 =?utf-8?B?d1VFM2djdjJBejRPcTNLRUs5QVZxYjFBK094dXhvWGdHNnYxbzAzeTY2YnpM?=
 =?utf-8?B?MkloNWRtTkdCeUdWRVBxcUFPQXVnMnhjVGkwVVdFMlN3NGhLbzFtaTMrQVp5?=
 =?utf-8?B?VitTSHROUFNnTTNRVEsyNWZVOGw0dnVYVkYwTnJpRXFrVlpWNlhKTkx4ZXc0?=
 =?utf-8?B?TnMxaE4vMlM3Qjg5Z2o2WEJKL0JiSUxhb0txR2J4MjA5bGwwL2FueSs5V0dh?=
 =?utf-8?B?bG15ZnYvUWJXUis3aUNrNWRZTjRPcnpDekQxVFFWOGNnbm1EbVNDbEZLRDdm?=
 =?utf-8?B?bkptdFNhOGV4SUF3bDZ2Z3Rnb3JVRnFYSnlZdlFCRWlxcDZyN3lVa0F4Sklk?=
 =?utf-8?B?QjhCTXZ2eTZPWE1lNHFxa3VhVmdCZmtBU3NsTnc3WVFpTEFoZXVtL0JUU0ow?=
 =?utf-8?B?SU1hL2lxZlJ1b284cEF0dXhQWXZhYnlnbUNZN3NYU1Jtb0R2YldMUEdNYU9j?=
 =?utf-8?B?cUhiM28zaVMvVnMvK3NOOVhENW9LMm9yNVFNYm94RHltT2lXYnFHVmpyZTRh?=
 =?utf-8?B?aFhwekY5UFB0eURrKzVvTm1LRWNHM1pSbUJXN0xCQ0VNY3kvaWdHbXUwZVpF?=
 =?utf-8?B?TDUvYjdMOGt1aUhuR2pYTFVoZjZkM0dNYlpnS0NxUE44M3d3RTZJWk9tdTRT?=
 =?utf-8?B?eHlHV0hCaVl6dkZDaURKenhZU2RXblVCRFRSaEs4eTJuYWpFbldMUlR2bWJD?=
 =?utf-8?B?M3RDeGRUYlhLRUtYTnU0QktCZk1DQ3dpWjJpancydTA5RWlpdkFMVFB4WUZT?=
 =?utf-8?B?STE3UE52OHgvOFZOdWZseXhkRS9LVFh2dWdwamVEaldsSzNBbHpQaFZzSFBY?=
 =?utf-8?B?VUFpeHc1Vk1rckp2bG1lUXNndHBqM21rZkcrWUM4V0pVR1RZZ3VVRHVTTldZ?=
 =?utf-8?B?YXNpVWxEdkdVd2xLUzNWcmRCMTdPWlk4d3A1NDlvQ1B1RUFzeTJnUTVkSTMr?=
 =?utf-8?B?aENkcHVpN3V3alVIUDlEVUkwRXhPOXJLREY5S3ZDWEgvcUZIL29TR2xFNlpT?=
 =?utf-8?B?a2RTb2twT0JIRE1GbXZhMVpqK3RyOVJnK1YxVlR5OVV4dU91Y1J1d01vTk5O?=
 =?utf-8?B?bmpIaDA3K2RCZG9wSE8zVFNSNGNzbnZrZXlCK3lqL1JNVHJCRzQvZmVVTDQy?=
 =?utf-8?B?Qm1oSTVkYVhJU3RDZzF1bWNzNTM1c01qVkg0czVtUEFjbzhLMWJPVDZUb3hJ?=
 =?utf-8?B?NEVVUGdLL24wNWc3YVBnc1Y1aHpRNkpBZzQ0YVNzZGU1S2JtRzloUlFiM2RD?=
 =?utf-8?B?aXA1dG53Ryt3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aG5WK2N6Q0xJWmlSbzBDek9mcnNpMFRtZ0VsZ2Z6Y1lRaWZsRTdXYVN2RUhV?=
 =?utf-8?B?YWNWeGl2ZTJhbkNYcHJmU2xnZEJGWkRPcU1ZdTJnZlhwUTE5d2ZKYmo1c3R0?=
 =?utf-8?B?MUloejlXS0haQ0pGdkI3MzdnNGFNT3NoYW9xQWduRFhTLzBNV2NyUWZtYi9v?=
 =?utf-8?B?cWp1eUt0Z0NsekEwbmgwdUNnOW1vbVVpVFQwYkJMWTN0dkFYNytBNTdSdTVU?=
 =?utf-8?B?VnFLbnYzOWlaMFg5M2lNcFRBazk5d2szbjZsUjE1Zi9YRnFJbEYxRlpuMHhF?=
 =?utf-8?B?S2dUdlgrUjlGR1pkZjNZcUpyNWRHd2pVOEhDbENWQzF0aDBkWE1pK2t0Z0I0?=
 =?utf-8?B?eUJWOXpET3ptUHpQUjdhVUFQMGVqeEhId21nNTZubzRRMkk3N2RuYjdidElw?=
 =?utf-8?B?Q2hyOXBUQkVxUFBkVndaTGtUbkQ0dzhObWo2OXF3Tk1wMHEvUmhPM0FJTXhL?=
 =?utf-8?B?cERQdUEyallsUm9oTFF1OHd1MFdjMFhIOXVpSy84VGZFV1hvQXEyOGk2VTJK?=
 =?utf-8?B?OG1DVktIem1rdTBKNVNtSkJ5YUQxTlJjdkhPTlVoZm53VTJSZU9lZDY1UmJP?=
 =?utf-8?B?b0h4bmc3L2g5dkh5K3ZtelF5QkFUcTFBMEt6V0ZEME14TFl2a1Z4Y2xpR1hw?=
 =?utf-8?B?QnlMWW1kUFNFdVRlNG40cUJnN1VaMndaNTluQVY3R0ZZazlrNklXai9Ndzg3?=
 =?utf-8?B?dFBjZFNQb0NTVkl1RUlrSGpsM01mMFYxRlV5elRoby92bXVOZXhESUVjME5Q?=
 =?utf-8?B?WjZMV3hQZXdMbjBYNUIvekM3N25uTXlaVm4zS1U0TFJqckltcXdaOXlhblVG?=
 =?utf-8?B?TnRsenZ2N1I1Wk1ua2FDU3l6cEg4Q0hvbURDQmdqVlFIcUZOQ2hWeVc2VUow?=
 =?utf-8?B?MkdoSWFkRnNzMTFvdzR5OU9ja0t5OGx1VEY0RzdGdmRsTnlONTViYmxMT08v?=
 =?utf-8?B?dVdIQlBNeUdtUTBsVDF4KzVEQVVBWklCbzdlZG5yWjNlcEpmWWdvbitnMnF6?=
 =?utf-8?B?Vk1LdkhQL2NEQnBvbk1CZkNVYVNPclAvUmJDaEtZc3Q0OVVzc1R3bW1WZHh6?=
 =?utf-8?B?bnhmL1hQZEFZRjJ1SnRDR1M1TXhOWXdaQWl1UU9Ua0JTTzNIdXVwY1pmVUxj?=
 =?utf-8?B?U2FNd0dMTXF2UUtsZGRlcUQ2b1J6WlVTUjE3UUpScENPR0dMUnR0ZDI0cTdU?=
 =?utf-8?B?aC9IVHQ1NXBUeFlaM01yb0pEWnFCcVlxem9xb3ZtVEtoUm1QTXUrejVVckJQ?=
 =?utf-8?B?RFdyTnVob0NKUkNDbmI3VWVvZzhKWmx6bzVDYXFWTkwremV1bVBjWUJGU2pp?=
 =?utf-8?B?b0toZlpsM2tGeGVScmVyYWlLY01xWlhZd0Rua0hVay9PMlJpam0wQlNlOFhw?=
 =?utf-8?B?YWY2RkloY21Wd2Z2dkJ4a1BFbUpKRmtSTXFPbFBKQU9qdkVpakorR0R6UjdV?=
 =?utf-8?B?VmFEWm1yVVptVU80OWxGQXVQWW0ybzF5eXNveW1pdEV5NDBROG0rU0hOV3N0?=
 =?utf-8?B?UjhxZzJpM0wxSTUrZ25XS2F3WjMyOFpWVDBFZ3Riay9EQkYzeEtCYkNsWlUy?=
 =?utf-8?B?S3Myby83OFg2MmNYRFpKQzFsOUlocFJXOFBNb2JwNU1tZXNBOTJoNkJIa2lR?=
 =?utf-8?B?TXd6OGFEbGkvZGNDcDlVYVNhVk1vVlFSRDNyUHhDbUlqTzNKeGl1ak5kc3dN?=
 =?utf-8?B?dXlZcnZOK1h3Q0cyY2pWODJiMm9RQkRkeU9LNjEyeEE5R2xITnF0V28vd0g3?=
 =?utf-8?B?eGZXb2VXMUxsbE9mTmpibWk0U2NVWk1YcWV1T1p1blR6SjZhcnd0OWJmRnFk?=
 =?utf-8?B?YU80U3ZrVVpzTjQ3YXV6K0NUdURsc0xNVTJpci9XU1VoaXUrZWtUZEVsRllz?=
 =?utf-8?B?dldLTnliVm9KanpYR2s5c1J3SkZ3VDNiVThKMU9SaHp2WXN5MTc4OGp1V0VT?=
 =?utf-8?B?Nzg2VXhwMmJsZHNYUTJDeXVackFHVlhLeCtSMXgxWW9DQWpTWFN4M0pibTQ3?=
 =?utf-8?B?UXVleXo0cG1IOEVLYUV5K1pKOE84blF0eHNhbWR0L1FZTm5ZNEZmaW1kZE5x?=
 =?utf-8?B?cG1IWkw3dzZQWThNaXdCNUdRK2pkS2lpZStvSFpvV2RRUzQwcFprVi8vcy95?=
 =?utf-8?B?enUzSEtXNzZVQ0tzTXRFQ1N2SFkrL0o0UmZnbUVjQ1RnTFhpWFlKM1l2bUNn?=
 =?utf-8?B?SkRzRjJrVGFhdlpRN1pvcFJmUksvTTBWT1RVRGRnalpUTXpDRWdvak1pRW9Y?=
 =?utf-8?B?WlY4RjhEZ3NhOG5CRHZ4Z1pJYzB3U2NFNFJKeVBrbVZSM1BmMzJiTWRXVHZj?=
 =?utf-8?B?ZThVeHZUb2dPd3g5bzJ2QUo0aEozVlZZWHY4dzBHZC8zNXl2REpSY0pYdDAv?=
 =?utf-8?Q?nKik3vhdUPBGfKNFAxNsHq9joHey4c+/BA8BQvZjFuxRb?=
X-MS-Exchange-AntiSpam-MessageData-1: KOl0Lq4NHuNT/9ib+F1AUtjyBHwrWDmobnE=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7933c645-b3bf-40ee-8375-08de42a17194
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 04:03:49.9735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PAkMZbPooTbN5FTPEg9qIKHyqIiRP9fqobi79J9Q0F9Rg95V85RXOfh9fabKVFNtG4QpIUlyF9wsEr6mSZ7z+EBtD0iPIcXkhwgtP/hxrLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9454
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 5x_35-bgNGuAapjVj4ma1OgbwbNMsypW
X-Authority-Analysis: v=2.4 cv=I6Fohdgg c=1 sm=1 tr=0 ts=694b6628 cx=c_pps
 a=1kzZLs4G264k5kMmJ/E+Xg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=guKZO4zXEQROI-P0-0gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=RvsMUuUuTeoL-9m5EhgA:9 a=OOSSp-SkikSOISam:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: B6ix02n5-AIEjgMFa_FeEhLHfZ7YnXgS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAzMCBTYWx0ZWRfX4x+hva0K91Oh
 IJI7dbGPrdQalnQSf7cUZ3jTsUMOaSsoWfGyQjMP7/zO7xgsEw4XcGm2XRyISKwGXTSEiY8V7D+
 yW/UiVU6QuZqgP9K3gTre6o8zMG1N+xQiEHExcvwsud5SC37DjldIaA0VCY/eUv8f7nrxvEVlEc
 EpzS8Z2+cD72RZ3qnT+XlXFcNsCu3aaEI0iCmWYDvmXZ90nvg6ldEQEMBD8hIzIyhTwzGt6dOZ4
 0KapJnDtmYjnXkXt3FUb4qA5q1L1wrfv8beb4q/QmYT7hYRb9eIPKPkVZJuwHAFbh1rQTatnAjq
 HeqBEXcy8OBI8sByAPcoOmxZgEUgSyB2bDmRSqaqZOsA/cORPF11PTZS3DOh6vc//YYe6W/Mxe2
 ruIhnnEpFzXqeRN/jsprQ47j7S+kxDNgtcWKIme87KfENUWVEqH2lwdD7bxp9rPT0yoXIaBFWRC
 Fq5Vo3ACvWNg43oMo+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 04:03:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228519

--------------cBl09suF8Qj9JGc06ERYmVyk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5BO2dEp53905463

Hi Randy,

On 12/23/2025 4:10 AM, Randy MacLeod wrote:
> On 2025-12-22 4:38 a.m., Yash.Shinde@windriver.com wrote:
>> From: Hemanth Kumar M D<hemanth.250302@gmail.com>
>>
>> Rust 1.92.0 adds new test that require unwind table support to be
>> enabled by default. Set `default-uwtable =3D true` in the generated
>> target spec to match upstream behavior.
>>
>> ref:https://github.com/rust-lang/rust/commit/fe66eaa67acc47525db6f13cf=
97d54780d87b805
>>
>> Also ignore the no_std simple-runs UI test on ARM targets. The test
>> fails with panic=3Dabort due to a known unwind table issue on 32-bit A=
RM
>>
>> https://github.com/rust-lang/rust/issues/146996
>
> Okay and I'm glad to see the upstream issues linked.
>
> Should we make some of these tspec decisions set-able by well-informed=20
> users?
>
> Maybe they can already do that using this horridly named "FEATURES"=20
> variable.
> (rename to RUST_FEATURES maybe ?)
>
The existing FEATURES variables in the .bbclass is currently used for=20
low-level CPU instructions.
As you suggested, RUST_FEATURE variable will allow us to keep H/W tuning=20
separate from
high-level compiler policy. I will discuss with team.
>
>
> For example, this bug:
>
> Unable to produce a Rust static binary with TCLIBC=3Dmusl (oe-core/mast=
er)
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16076
>
Although the bug report did not include a specific recipe, I used=20
ripgrep as a reference
to validate the issue and was able to build a fully static musl binary.

I found that changing *tspec['dynamic-linking']* from *true *to *false=20
*in the .bbclass alone was not enough
to produce static binary. The problem had two parts.

First, at the target specification level, rust-target-config.bbclass=20
forces dynamic-linking to true.
Because of this, the compiler assumes the target is dynamic and ignores=20
requests for static linking.
As a result, it still produces a dynamic PIE binary that depends on the=20
musl dynamic loader (ld-musl.so).

Second, at the linker wrapper level, *target-rust-ccld* enforces dynamic=20
linking by default.
It automatically adds flags such as*-Wl,-Bdynamic* and *-pie*. This=20
conflicts with the compiler=E2=80=99s static intent
and causes it to pick shared libraries from the sysroot, which leads to=20
the error
=E2=80=9C*attempted static linking of dynamic object*=E2=80=9D.

To work around this and meet static musl requirements, I applied=20
recipe-specific changes to bypass the wrapper=E2=80=99s
enforcement and handle circular dependencies and crate-level leakage.
With these adjustments, the final link correctly uses static archives=20
instead of falling back to shared objects.

I will update the bug report with these findings.
>
>
> seems to be due to hard-coding dynamic-linking to True below just=20
> after your:
>
> +    tspec['default-uwtable'] =3D True
>
>
> change.
>
> I've CCed Nick in case you guys have a quick work-around to enable=20
> static linking.
>
> ../Randy
>
>> Signed-off-by: Hemanth Kumar M D<hemanth.250302@gmail.com>
>> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
>> ---
>>   meta/classes-recipe/rust-target-config.bbclass       |  1 +
>>   .../rust/files/rust-oe-selftest.patch                | 12 ++++++++++=
++
>>   2 files changed, 13 insertions(+)
>>
>> diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/cla=
sses-recipe/rust-target-config.bbclass
>> index 33a290412e..2a06c4ae8b 100644
>> --- a/meta/classes-recipe/rust-target-config.bbclass
>> +++ b/meta/classes-recipe/rust-target-config.bbclass
>> @@ -418,6 +418,7 @@ def rust_gen_target(d, thing, wd, arch):
>>           tspec['llvm-floatabi'] =3D "soft"
>>       elif fpu =3D=3D "hard":
>>           tspec['llvm-floatabi'] =3D "hard"
>> +    tspec['default-uwtable'] =3D True
>>       tspec['dynamic-linking'] =3D True
>>       tspec['executables'] =3D True
>>       tspec['linker-is-gnu'] =3D True
>> diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b=
/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
>> index b39b326455..d1fba81612 100644
>> --- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
>> +++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
>> @@ -254,3 +254,15 @@ index a3562f2fd93..d4e52ed91be 100644
>>        fn linux_hwcap2_aarch64() {
>>            let file =3D
>>                concat!(env!("CARGO_MANIFEST_DIR"), "/src/detect/test_d=
ata/linux-hwcap2-aarch64.auxv");
>> +diff --git a/tests/ui/no_std/simple-runs.rs b/tests/ui/no_std/simple-=
runs.rs
>> +index af44dfe..e6674e5 100644
>> +--- a/tests/ui/no_std/simple-runs.rs
>> ++++ b/tests/ui/no_std/simple-runs.rs
>> +@@ -2,6 +2,7 @@
>> +
>> + //@ run-pass
>> + //@ compile-flags: -Cpanic=3Dabort
>> ++//@ ignore-arm FIXME(#146996)
>> + //@ ignore-wasm different `main` convention
>> +
>> + #![feature(lang_items)]
>
>
> --=20
> # Randy MacLeod
> # Wind River Linux
--------------cBl09suF8Qj9JGc06ERYmVyk
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5BO2dEp53905463

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p>Hi Randy,</p>
    <div class=3D"moz-cite-prefix">On 12/23/2025 4:10 AM, Randy MacLeod
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:c1d0b949-5995-4f60-8e94-98dd73a=
b5a3d@windriver.com">
     =20
      <div class=3D"moz-cite-prefix">On 2025-12-22 4:38 a.m., <a class=3D=
"moz-txt-link-abbreviated moz-txt-link-freetext" href=3D"mailto:Yash.Shin=
de@windriver.com" moz-do-not-send=3D"true">Yash.Shinde@windriver.com</a>
        wrote:<br>
      </div>
      <blockquote type=3D"cite" cite=3D"mid:20251222093830.2658141-2-Yash=
.Shinde@windriver.com">
        <pre wrap=3D"" class=3D"moz-quote-pre">From: Hemanth Kumar M D <a=
 class=3D"moz-txt-link-rfc2396E" href=3D"mailto:hemanth.250302@gmail.com"=
 moz-do-not-send=3D"true">&lt;hemanth.250302@gmail.com&gt;</a>

Rust 1.92.0 adds new test that require unwind table support to be
enabled by default. Set `default-uwtable =3D true` in the generated
target spec to match upstream behavior.

ref:<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-la=
ng/rust/commit/fe66eaa67acc47525db6f13cf97d54780d87b805" moz-do-not-send=3D=
"true">https://github.com/rust-lang/rust/commit/fe66eaa67acc47525db6f13cf=
97d54780d87b805</a>

Also ignore the no_std simple-runs UI test on ARM targets. The test
fails with panic=3Dabort due to a known unwind table issue on 32-bit ARM

<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-lang/r=
ust/issues/146996" moz-do-not-send=3D"true">https://github.com/rust-lang/=
rust/issues/146996</a></pre>
      </blockquote>
      <p>Okay and I'm glad to see the upstream issues linked.<br>
      </p>
      <p>Should we make some of these tspec decisions set-able by
        well-informed users?<br>
        <br>
        Maybe they can already do that using this horridly named
        &quot;FEATURES&quot; variable.<br>
        (rename to RUST_FEATURES maybe ?)<br>
      </p>
    </blockquote>
    <font face=3D"Calibri">The existing FEATURES variables in the .bbclas=
s
      is currently used for low-level CPU instructions.<br>
      As you suggested, RUST_FEATURE variable will allow us to keep H/W
      tuning separate from<br>
      high-level compiler policy. I will discuss with team.</font>
    <blockquote type=3D"cite" cite=3D"mid:c1d0b949-5995-4f60-8e94-98dd73a=
b5a3d@windriver.com">
      <p><br>
        For example, this bug:<br>
        <br>
        &nbsp;&nbsp; <span id=3D"summary_container"><span id=3D"short_des=
c_nonedit_display">Unable to produce a Rust
            static binary with TCLIBC=3Dmusl (oe-core/master)<br>
          </span></span>&nbsp;&nbsp; <a class=3D"moz-txt-link-freetext" h=
ref=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16076" moz-do-=
not-send=3D"true">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D160=
76</a><br>
      </p>
    </blockquote>
    <font face=3D"Calibri">Although the bug report did not include a
      specific recipe, I used ripgrep as a reference<br>
      to validate the issue and was able to build a fully static musl
      binary.<br>
      <br>
      I found that changing <b>tspec['dynamic-linking']</b> from <b>true
      </b>to <b>false </b>in the .bbclass alone was not enough<br>
      to produce static binary. The problem had two parts.<br>
      <br>
      First, at the target specification level,
      rust-target-config.bbclass forces dynamic-linking to true.&nbsp;<br=
>
      Because of this, the compiler assumes the target is dynamic and
      ignores requests for static linking.&nbsp;<br>
      As a result, it still produces a dynamic PIE binary that depends
      on the musl dynamic loader (ld-musl.so).<br>
      <br>
      Second, at the linker wrapper level, <b>target-rust-ccld</b>
      enforces dynamic linking by default.&nbsp;<br>
      It automatically adds flags such as<b> -Wl,-Bdynamic</b> and <b>-pi=
e</b>.
      This conflicts with the compiler=E2=80=99s static intent&nbsp;<br>
      and causes it to pick shared libraries from the sysroot, which
      leads to the error&nbsp;<br>
      =E2=80=9C<b>attempted static linking of dynamic object</b>=E2=80=9D=
.<br>
      <br>
      To work around this and meet static musl requirements, I applied
      recipe-specific changes to bypass the wrapper=E2=80=99s&nbsp;<br>
      enforcement and handle circular dependencies and crate-level
      leakage.&nbsp;<br>
      With these adjustments, the final link correctly uses static
      archives instead of falling back to shared objects.<br>
      <br>
      I will update the bug report with these findings.</font>
    <blockquote type=3D"cite" cite=3D"mid:c1d0b949-5995-4f60-8e94-98dd73a=
b5a3d@windriver.com">
      <p><br>
        seems to be due to hard-coding dynamic-linking to True below
        just after your:<br>
        &nbsp; <br>
      </p>
      <pre wrap=3D"" class=3D"moz-quote-pre">+    tspec['default-uwtable'=
] =3D True</pre>
      <p><br>
        change.<br>
        <br>
        I've CCed Nick in case you guys have a quick work-around to
        enable static linking.<br>
      </p>
      <p>../Randy<br>
      </p>
      <blockquote type=3D"cite" cite=3D"mid:20251222093830.2658141-2-Yash=
.Shinde@windriver.com">
        <pre wrap=3D"" class=3D"moz-quote-pre">Signed-off-by: Hemanth Kum=
ar M D <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:hemanth.250302@g=
mail.com" moz-do-not-send=3D"true">&lt;hemanth.250302@gmail.com&gt;</a>
Signed-off-by: Yash Shinde <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:Yash.Shinde@windriver.com" moz-do-not-send=3D"true">&lt;Yash.Shinde@w=
indriver.com&gt;</a>
---
 meta/classes-recipe/rust-target-config.bbclass       |  1 +
 .../rust/files/rust-oe-selftest.patch                | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classe=
s-recipe/rust-target-config.bbclass
index 33a290412e..2a06c4ae8b 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -418,6 +418,7 @@ def rust_gen_target(d, thing, wd, arch):
         tspec['llvm-floatabi'] =3D &quot;soft&quot;
     elif fpu =3D=3D &quot;hard&quot;:
         tspec['llvm-floatabi'] =3D &quot;hard&quot;
+    tspec['default-uwtable'] =3D True
     tspec['dynamic-linking'] =3D True
     tspec['executables'] =3D True
     tspec['linker-is-gnu'] =3D True
diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/me=
ta/recipes-devtools/rust/files/rust-oe-selftest.patch
index b39b326455..d1fba81612 100644
--- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
+++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
@@ -254,3 +254,15 @@ index a3562f2fd93..d4e52ed91be 100644
      fn linux_hwcap2_aarch64() {
          let file =3D
              concat!(env!(&quot;CARGO_MANIFEST_DIR&quot;), &quot;/src/de=
tect/test_data/linux-hwcap2-aarch64.auxv&quot;);
+diff --git a/tests/ui/no_std/simple-runs.rs b/tests/ui/no_std/simple-run=
s.rs
+index af44dfe..e6674e5 100644
+--- a/tests/ui/no_std/simple-runs.rs
++++ b/tests/ui/no_std/simple-runs.rs
+@@ -2,6 +2,7 @@
+=20
+ //@ run-pass
+ //@ compile-flags: -Cpanic=3Dabort
++//@ ignore-arm FIXME(#146996)
+ //@ ignore-wasm different `main` convention
+=20
+ #![feature(lang_items)]
</pre>
      </blockquote>
      <p><br>
      </p>
      <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
    </blockquote>
  </body>
</html>

--------------cBl09suF8Qj9JGc06ERYmVyk--

