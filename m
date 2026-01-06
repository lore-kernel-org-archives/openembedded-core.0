Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A41CD042B
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 01:15:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.80739.1767662131591591248
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jan 2026 17:15:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Ctn3RHHn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=546692fdb6=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605LexjI3469412
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Jan 2026 01:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=Oa+UV5OebLkqfpxx1gd6O8
	PHGpUVQ1PqqABGjTal/BQ=; b=Ctn3RHHnPqEfGls5WReEhAf5jSYRCiDnVmWwfB
	sGRTugdu1IM81OoeLxPZTfjs6z6LKKzI9J6XVZBi8VsCwap6xnXEXumzMmWJfwwz
	cM8Cgjh/ENgIv3z4ZKrQsZeB+EFDvR21lGZEltGAB52RffTyOkXvqyGQg04HqBPy
	LYJJVjivjMzNELZE0cdmqDgJDaMVzFM+xv8372MCSIlGJJMmCERLYHlEjg6wiQfk
	AhAtOT98ZVecQ0bh9/BW/9W8fyc+amtycFX1wxAt0v3lHpJgpFKjgxr/VVc7zmdX
	vVgXzo+j1nDr16xouchi31cd0TEMXoLcl0Uc6m2p68FfkGpA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011039.outbound.protection.outlook.com [40.93.194.39])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bet33a78x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 01:15:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fgns9HnD1wd9CZB8Gw8m3FQFFkUv9bEGUDTkCdOtGnsfVuQ8Bylgv04gCGF/FnvkZRKxsrvPdx8RdsUyzA9HOKVit2hP1ClrKPRWnTzgyqBTYMNaBzgjvYVH3cGUn+I/rqQHe4xU1Zb33MJ4thd2rPGziLB9EAHEUQR1MRe4t+fee3bQTcVZZ+hgH0vLuMUS55w+Fi063z+RdlFKxGpTbo0ixzvrR3NK17zJFrVPuOOcZ2wkRN1o4fbddoDNbXp/kDP5dXJKc2zMkRCmQhkTbmHbOGScIPV2xTjCj7JI9KbK9qoMAyWnPi9zqYWwLWO1oga/Crhfpwh8cWn0uaOGdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oa+UV5OebLkqfpxx1gd6O8PHGpUVQ1PqqABGjTal/BQ=;
 b=IrTQRTY75GDO4wtM78K3StNCkvQFuT3leBIhip6YfdzvOr8ckzSH9bfx3wFKswRm6E+KLNsVwRiKuPkNC1Q7IuhJlAaGKlDqr+lNP9y2ZE2/Inb5nLc48Gg5V2OdPPjQo2n3R30ktU2e6aZ1w0mThAom9YYadUzBOyslOC0jbor5KuWx+e5Vf++dqP44Ct1Ldd+FxjcD2SwPmZsD9VpepiZUtle8UWZkdyg4qVTfxZnxk5+d+BOudUpWliA3qWClPlLL/w5C77qVCKLVScFnwCr6fQng+XlezngADmkknBE/x2yuKKz66f8hYZCcp5aoR2X+qK9TewZQCz0u/DgFMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by CH0PR11MB5251.namprd11.prod.outlook.com (2603:10b6:610:e2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 01:15:27 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 01:15:27 +0000
Content-Type: multipart/alternative;
 boundary="------------0d9B0bivy092rieJdCGVjcEa"
Message-ID: <979d9d7f-8a2c-4cb3-8849-d8724f3d0f58@windriver.com>
Date: Tue, 6 Jan 2026 09:15:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] go: fix multilib file conflicts
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        Khem Raj <raj.khem@gmail.com>,
        Alexander Kanavin <alex.kanavin@gmail.com>
References: <20251222032455.2683666-1-changqing.li@windriver.com>
 <522E1A76-C605-4C0C-AB6A-F568E5676905@arm.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <522E1A76-C605-4C0C-AB6A-F568E5676905@arm.com>
X-ClientProxiedBy: SL2P216CA0178.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::6) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|CH0PR11MB5251:EE_
X-MS-Office365-Filtering-Correlation-Id: fe9e2cd5-2ea0-4bb0-32e3-08de4cc11339
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZlZPYTYzVUpZMHl2MHUvRzd3UTdFTlRRR1lzTkVVM0diSVNGd1RRNmFQWmJZ?=
 =?utf-8?B?cnJwaHBXcmFCZHo3Qmk2MXhGaC80TCthWFRGMWpxQWlyUDhYUWNobFUrRDlF?=
 =?utf-8?B?cHdSS3dzL3M2V2pyQkxGRmk1bFhOMjY4SFRKNUhXbzZYSGRoT0Vrc0ZsanA1?=
 =?utf-8?B?cHh6RmxQK050QXhKT2ZiL2IweTdJdFdRS3pEOE92OUlDYkpueU4vek9uWXhp?=
 =?utf-8?B?SGNWRjQrd1ZMT3BiTTlYVmdZcHRaUmhUanYyK09MR1VjNjcwb1M3TmQwK1lG?=
 =?utf-8?B?NTY0eEhVVVFzWUU5VUIzamtuaUhoejRNRm9JRUF0K3JEbjdRaGo1NnJ4U1ZH?=
 =?utf-8?B?Ri9PRDJ4bC9BclE0TnNTVWR1NU9vRUdRMGpETnZNVEU3ajNGeFhSYWE2NDJR?=
 =?utf-8?B?UFF1Uk5Ta3grV1dZMmdjRC94TDFBWG4yd2V2MnZWdHVIOFhCcXJFc3FrUkpo?=
 =?utf-8?B?dUQzcGd3TTFmRVg5eFUxVWs4akxUWkE2emliYnpkVTFwRDY5SG05MlMrWERC?=
 =?utf-8?B?bGxZMVF4TUZsL1BnWDdyOEcwUnhGM2FRVi9tVGpJZWR0eVZTb09Td0FWZC9T?=
 =?utf-8?B?Y05zVlk1YUhIMkFjWjBsUDhsQVpHTDhoYVBTU0hMZ1RDaExyQkdHUGtRUXRi?=
 =?utf-8?B?ajJTWjRyempyTXcwYlY4VkZJaWppUnFEdDNmWEwvMjE0a3ptSUgrbkRhZG5X?=
 =?utf-8?B?MnNWd2NpVVk3YnZBNzFHdjB1VXZxRnRjajd2bG84NGZOd1RyajZ0WnMxOVls?=
 =?utf-8?B?WFE5TGI5QmtqUHlUajdpNVBuMWx4ZUgrWEdtRW01U1BSbnllY1paTGpSYks3?=
 =?utf-8?B?NDNxditOTzJib3lJV01JaVZPYVBTSFFTc2VHMHg5SExjZ1BXZE54RzcrS0RB?=
 =?utf-8?B?Z1dpeGt1blNVZ250cXlLc2dHYjJpd3gweVZiYXMwajNjd3RiWmkxQ2RUcGtj?=
 =?utf-8?B?MmJFd1FVbWZBYlRZVGlPbVhCc1N0MTFiRDdNTVBXN2JyU2NTN1dvcTczTmcz?=
 =?utf-8?B?ck92akRoeE03NGV3Qk9aYXVBQW81SHdYOFU5cTJuN3NRWDRTdTU3RTRUTDlo?=
 =?utf-8?B?WndBaWgrSmYzN1pKcDFEUnBEbzljRHVEMHhHVmdObitickdXWFJGQ0sxOE12?=
 =?utf-8?B?MkNMTVd5TXZ4c3lYMTRWZ3hWR0M2VjRzMHQ5Q04rRFhMMjBpRS9wdEI5dC9v?=
 =?utf-8?B?OGF2ZTNoYzNGYy9tSXRHTHl5MFdiWHQreURZWWNFbTlscVY5bCtnY0xtOEtt?=
 =?utf-8?B?SmVOK3BtZlNscTE3ZGUrYUdKWDhEbzg5OCt4R1hHTlU2U1dXN01SRE95byt0?=
 =?utf-8?B?UXp4eDZvMDlTc0V5MWQwYmJnaFpIbklKOXBkN3V2WkF4TXAvbG91VndDeUlM?=
 =?utf-8?B?Si9oOEV5eXhQMlFYY3cwSWZzQjdxNjFmQnNYbjd1Uit2ZSt2ck9WU0VtcjB1?=
 =?utf-8?B?akhDU044VjVUaGtrSGRhVHJ5SkZGSm1UM1BTNTlOY203YUdQNFZaek1DbVow?=
 =?utf-8?B?RVl4ZkFCZGRlRHNjaklMeXdXd2FWeDNtMjBMMkQwbjAzUytQRFI0SHFqUFhR?=
 =?utf-8?B?STN6aWx5bFRzTis0NitheGd1WWtYV1dGazkrZndmdkw5NUwwRkpKZ2RSdmVR?=
 =?utf-8?B?cTBFL3IwNzVKQzkyc3ZqVlRnY1FKZzd6TW0wUUVDMUg2RlR1VVc1MXJ1ZnZ5?=
 =?utf-8?B?Q2RrTmcxUHNqQUZzaERPYno0VEIvQkkrbHRXZm9kN2tIODZSdnRjRDhkUzZF?=
 =?utf-8?B?Umo1VG50Q0VzOHN2cGtONTVEWndIMzlCcWtOcHNOUG0zd0c4eTdBWnRkcEc0?=
 =?utf-8?B?MXZqdWJjaUxBK3p0b2hvVzI3aDBjazhabUdLSzBsSkl6alR2THN5M2tiOHhO?=
 =?utf-8?B?N0UzT0JOQ2IwRXNzSWZTVU1iSjI1ZHFLTEwvUWkxNHp5WnNnenpZT3FWc0J2?=
 =?utf-8?Q?SuS94OVeNkOvdvFq4KlG9C/atm2GZgyR?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bWxQbXVRY1JaNFdOQUhNa0xtR3Q3SEM1eUNoazc2RW1vemdtRWIzNEcwUEJl?=
 =?utf-8?B?blNsd3VzcWhaL1VLWmVob05mUnV6dzhJWmlyWmUzd21OZnVMZ2IwWnR5UVRj?=
 =?utf-8?B?dmpMRE5PanVzRllkMzR3YWh4RlRLWFl5ZFlZUmxKZXk3cDZNV1NXaXdHMFNh?=
 =?utf-8?B?QkZrbmNESE5UL1o4aXJZaXg3dnVyYmEwZysyeldoSE8vVk5CWkZkMjhqM3ZY?=
 =?utf-8?B?eDJVeE1CWmY1ajYzUTZ1eXNLcUx3Ymc5RE1PT1V1RDJKQmlMSXFvVUdENWZZ?=
 =?utf-8?B?N0lOdjFBL01tMStMZkh6U1ZsVjRyK1ZIdUE0NzhlaWRCRFdIeGJYM1kxZS9q?=
 =?utf-8?B?V3Q0anNKYVRZTjlzT2p2UWNzbHdTUUlHd0N6SG9JTnhhZXZxQm8rOUhzK3U0?=
 =?utf-8?B?ZGRKNkh6NDNVZ2Z1QjF5MW4wYkVpeFR6Ui8vRUE5WW5ObkJLM3lXWDhmckpU?=
 =?utf-8?B?YnZYUzczaHZ5RGNCbUFrTXM1UnJxUkQyVll5YXFUTzQ3aWw0RW5WMWFMRXZI?=
 =?utf-8?B?RUVPU3UvWGZENk9WYW1uTzdHL21SaW5aQU9DemZiUk5FVUp2dURZalN4YXlX?=
 =?utf-8?B?SUdMQlpmR2o5V0w1MldLcGlka056a25VR21ILzIydklvaTBpOUlGalRja0Zp?=
 =?utf-8?B?bVNpNmxLaTJTYkx4MU14Zzkxb3ZBTmg0clErK0U4QmpYd29BVUJ4M1dmWXBa?=
 =?utf-8?B?MkZuN0VoTyswZjBmbE1jdDdHMFdibHZnL0xzVGVwclpMNEIxNFlNR0pYT1c5?=
 =?utf-8?B?VndTdlhXaERLSFJ4dWZGYmUrNHZVNHIxYUZYRUNOeElDN2N3aFJHakZlS0xa?=
 =?utf-8?B?SjZXS3pGcWVtcW1MNmQ5d3hCWmN0RTQvTG5TOXdxeHVJWkhlSHl1YTJuTHJC?=
 =?utf-8?B?Nk9JUzhNQlpkVllhRCtQREJTeTVIZXp3eW1RUFRrTkxUS3hWRS9sU1FhejdJ?=
 =?utf-8?B?cTVRcG4zK3dyUTVwM1EzNENLREZlaFUwTVJmVktld21UL0M5dHljdDZXZjNn?=
 =?utf-8?B?bHN2Y2EyZ0JkR2FrdjhJcmsxeXdubUIzSjIxeE5jWnJMSXg2TWhna1MxNlZN?=
 =?utf-8?B?ckJ0Q0FEU0J5RW4vRVFDd3gxaEdKdXpvRnR4dG1DUi95OWhjUnZ6THU0VjNP?=
 =?utf-8?B?RklkM0IxMWt1bHo4NDF1ZEZlODFzUTZlQ2xPWHdxNWV3T1RhaFd6TE50dWpR?=
 =?utf-8?B?NkorWURxbnlwY0ViTkxQWU5mdHc1MnpmbWZOaHJhSVBuKzNlSkdkVXJ3YnZL?=
 =?utf-8?B?dm42VStpSXlVRytjZ1RrY0h5LzluY0NZQ0lvYXRsazdHOVlNbEhhRDRkR2RD?=
 =?utf-8?B?T205emlEWVZCUDhxVzlmOGpQSEYvUW9XUlNRQmhNcTBMK3cwMHo0eFpJMzJm?=
 =?utf-8?B?SDF4OWM3d3pGY1B5TW9rOThOU3J2dTVKcGNpZEx6Q1luMG1XWmh1SXpRUmlk?=
 =?utf-8?B?TVk0UW9RMlZoWnVhNENMbjhBUFJYTll2bms3ZHNuV1M5ZlA0a2xpOGx5ZUtV?=
 =?utf-8?B?K3UwY3YzZ3BMWC94b1ZuQzRyMUtzYjBhbFhDRHVQR2tjSGplWTBRYWluWXlM?=
 =?utf-8?B?TFhhNEVkWDl6YUVCeFZaVmFrUld2bHE4cE5pb2tDSzRrOWR1TzdWOXgrbGV5?=
 =?utf-8?B?VnNvOTdhd2Q5R1RGVUI1UEsxek9iZGpwcTEvSzR1V3NGNkhwTmRwZ0JmMngx?=
 =?utf-8?B?eml4SXhLMng5V09FMFE3RHUxZjhGWjhBdTNuTk0wQ2tOQkNSdHBkMXFNQnl4?=
 =?utf-8?B?R2Y3VWpQVHY2ZFVNZDRNeFVLaHM1RklwTVpTTmlwQzRpMlRsRFNteHNYeGg5?=
 =?utf-8?B?VmhYR2pZN3dYdXh5YWlwR09XdGVjWHM2L29UcHFtdlFqUFpZMWlDMitkdnVw?=
 =?utf-8?B?OVM2d1YvOXdpYWNrNmN1aTRlemlNWkJDc3JsNmxRL0ZuZU9Ba1pxMjNpNWg3?=
 =?utf-8?B?aGNUN0dHb2VpVitBQzhsbWM5ek1tYVZzem5VT3FsdURhdXVzVmpIMkQ2VmEw?=
 =?utf-8?B?TklkTXovVmxOWTBXVmtkOTBPenVTeDlhWS90VGN2L3VzTkVlK1h4UlhJVS92?=
 =?utf-8?B?RVp3dXJJWkdxb0xBTC94OEFRcU9VcXBsK005UUdDcFU1Vyt0MlFETmRtNEdZ?=
 =?utf-8?B?NTljS3JlMzZ0WHROU1Zqb2cvQXJ2QTF2WG9YZ1B5cmN5eUl4VGcvWkFHUUI5?=
 =?utf-8?B?Y28xV2hvMjhIenRzdk1jbkxKSWtsaytBaEwwYzlUeERPc1d3S0s3YVl3NlFh?=
 =?utf-8?B?b0dja1ZNKzFvR3JMaVlHdDF1cmxTZURXTlE0WkJObTMxM2JxSmhXby8rUjdX?=
 =?utf-8?B?TFZ4TG1tVGlMSkhBZHZ0ZHhLN3YwTTY1NXI2Q0pmNStNekJ5dGpOVUNqeHZS?=
 =?utf-8?Q?ziBb/BO7MGlJVm5E=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe9e2cd5-2ea0-4bb0-32e3-08de4cc11339
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 01:15:27.0754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FtfN0W131xdp8NHkDAt9JCPLl4xRY/gBLgfNIbcG+gDWmSJs6fcF/pIXHKWW5NThhoNlZ0NfOB0IR8ZgWDKZNqZm5coCITYfgI+6a14LLsQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5251
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=cPTtc1eN c=1 sm=1 tr=0 ts=695c6232 cx=c_pps
 a=ChtxJ3izA4DGUCEzIvXZbg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=UqV-9rqU63X_044ObaIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=7CQSdrXTAAAA:8 a=wvPkM9v7g1_ikmSEda4A:9
 a=C12WL2rh3pQoBPri:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: qDsgZfUT-wsOCb7ZjQ3FzJqoNtI79FR0
X-Proofpoint-ORIG-GUID: dkg1ROuNMuCJ9DSZF3hHWOmUj2q97ixR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAwOCBTYWx0ZWRfX8AYnKuxLV92Z
 6rRPqme8V0Mc3c+JTBSxVcYj+uHNW4Grf0zilfIPAYvdAHKVnR+Gi8zQTON8mKs4faOJv6Ex1YT
 5Jb45mbHZrWP7K4aN67HiQ3UML/OL/HpxTgiBz/S0+Ad6VT2c4kG0f7rl4SveYgoy9Z35A9MbLe
 HErc2N/7s4+cAM+qtZf+o2gdwLIaEkwgxmOyIBKyjSOorQwBcdRcmX2Rnb+lhIe9wepfs0t40QV
 +hDWLKyypKH7qKPf5USC0LU0Ou0edzhQG3GXIXnY5VYTS+3nsZbhPXTu4NH69SSdH/7MV1YMpWH
 qkgfBQAIl+4Wgy/Eec/1a1Qv/JpImT5csMUlIe5uZMG9HWN5uYAtCrX3zUrOng8S40NGA+TBr9S
 5SFRsvRTV7bsEtFISdQ2T7XqQqGYiRl0XCJP+JpFGsb6MVu50yq2Tsv8dB8oHNuavIUZOcTnvPL
 TXhLrcRMlG2Y/NkFEXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060008
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 01:15:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228879

--------------0d9B0bivy092rieJdCGVjcEa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 605LexjI3469412


On 1/6/26 02:08, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On 22 Dec 2025, at 03:24, Changqing Li via lists.openembedded.org<chang=
qing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> This is for fixing the following error of 'bitbake meta-go-toolchain'
>> when multilib is enabled:
>> Error: Transaction test error:
>>    file /usr/bin/go conflicts between attempted installs of go-1.25.4-=
r0.x86_64_v3 and lib32-go-1.25.4-r0.core2_32
>>    file /usr/bin/gofmt conflicts between attempted installs of go-1.25=
.4-r0.x86_64_v3 and lib32-go-1.25.4-r0.core2_32
> Why would you do this though?  We don=E2=80=99t support installing bash=
 and lib32-bash either.

Hi, Ross

The issue reproduced when multilib is enabled globally in local.conf by=20
following config:

```

require conf/multilib.conf
MULTILIBS ?=3D "multilib:lib32"
DEFAULTTUNE:virtclass-multilib-lib32 ?=3D "core2-32"

```

bitbake meta-go-toolchain will failed with above failure.

[snip of meta-go-toolchain.bb]

TOOLCHAIN_TARGET_TASK:append =3D " \ ${@multilib_pkg_extend(d,=20
'packagegroup-go-sdk-target')} \ "

[snip of meta-go-toolchain.bb]


go is in packagegroup-go-sdk-target,=C2=A0 it is extended by=20
multilib_pkg_extend.=C2=A0 so both go and lib32-go will be installed.

go is added in to packagegroup-go-sdk-target for providing entire=20
toolchain include compiler.


Regards

Changqing

>
> If the goal is =E2=80=9CI want to build 32-bit go apps in my 64-bit use=
rspace=E2=80=9D then luckily go is always a cross-compiler and you can ju=
st set GOARCH when building with the standard go.
>
> Ross
--------------0d9B0bivy092rieJdCGVjcEa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 605LexjI3469412

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#ffffff">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 1/6/26 02:08, Ross Burton wrote:<br=
>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:522E1A76-C605-4C0C-AB6A-F568E56=
76905@arm.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On 22 Dec 2025, at 03:24, Changqing Li via lists.openembedded.org <a clas=
s=3D"moz-txt-link-rfc2396E" href=3D"mailto:changqing.li=3Dwindriver.com@l=
ists.openembedded.org">&lt;changqing.li=3Dwindriver.com@lists.openembedde=
d.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">
From: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:chan=
gqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

This is for fixing the following error of 'bitbake meta-go-toolchain'
when multilib is enabled:
Error: Transaction test error:
  file /usr/bin/go conflicts between attempted installs of go-1.25.4-r0.x=
86_64_v3 and lib32-go-1.25.4-r0.core2_32
  file /usr/bin/gofmt conflicts between attempted installs of go-1.25.4-r=
0.x86_64_v3 and lib32-go-1.25.4-r0.core2_32
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
Why would you do this though?  We don=E2=80=99t support installing bash a=
nd lib32-bash either.</pre>
    </blockquote>
    <p>Hi, Ross</p>
    <p>The issue reproduced when multilib is enabled globally in
      local.conf by following config:</p>
    <p>```<br>
    </p>
    <p>require conf/multilib.conf<br>
      MULTILIBS ?=3D &quot;multilib:lib32&quot;<br>
      DEFAULTTUNE:virtclass-multilib-lib32 ?=3D &quot;core2-32&quot;</p>
    <p>```</p>
    <p>bitbake <span style=3D"white-space: pre-wrap">meta-go-toolchain  w=
ill failed with above failure.</span></p>
    <p><span style=3D"white-space: pre-wrap">
</span></p>
    <p><span style=3D"white-space: pre-wrap">[snip of </span>meta-go-tool=
chain.bb]</p>
    <p>TOOLCHAIN_TARGET_TASK:append =3D &quot; \ ${@multilib_pkg_extend(d=
,
      'packagegroup-go-sdk-target')} \
      &quot;
    </p>
    <p><span style=3D"white-space: pre-wrap">[snip of </span>meta-go-tool=
chain.bb]</p>
    <p><br>
    </p>
    <p>go is in packagegroup-go-sdk-target,&nbsp; it is extended by
      multilib_pkg_extend.&nbsp; so both go and lib32-go will be installe=
d.</p>
    <p>go is added in to packagegroup-go-sdk-target for providing entire
      toolchain include compiler.</p>
    <p><br>
    </p>
    <p>Regards</p>
    <p>Changqing<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:522E1A76-C605-4C0C-AB6A-F568E56=
76905@arm.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

If the goal is =E2=80=9CI want to build 32-bit go apps in my 64-bit users=
pace=E2=80=9D then luckily go is always a cross-compiler and you can just=
 set GOARCH when building with the standard go.

Ross
</pre>
    </blockquote>
  </body>
</html>

--------------0d9B0bivy092rieJdCGVjcEa--

