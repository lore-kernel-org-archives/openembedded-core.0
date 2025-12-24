Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD3E8E7490B
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 03:41:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.114659.1766547659687501013
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 19:40:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=XwsVMykL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4453be3734=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO3dupD1414366
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 19:40:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=zBbbFK7KZD7dZpsBgPpIaX
	YKCCNKqEsnmGtbQIsjFfk=; b=XwsVMykLyLGfNo2My18HbGRXAXAHWwPJw9ITzK
	T5En6Raczovu4o5QglHRIjyCQjloJ2QS6473cEGSXWui3icxV5FSxKIrLhsUmwhv
	Ixny3z0JsSZ6BmUxiA2484o+/ImeyfQsaBNwiOawJQc8UKcASI6h17b5XWvbZBrI
	ix87DWr6JbgWfRFpmy9j8O4fse0Wx4oKGArLWzDklTwVoSAe9Q3TsNFcG5UP/n3c
	FWEcwopR6NeE4EBowKHh17k+zkf3q5R3255F1SfF3OaB5D4qyKnwPmzubGukq0FP
	yzQE3QWUA4GEjKAbm9vGelW7CAP1a+g0GsHl527PjdO2s03Q==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012002.outbound.protection.outlook.com [40.93.195.2])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5qy4un82-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Dec 2025 19:40:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZB6hTlaP0pKyAM4oev6OO4FaYd4C3DI/EGtk9bM1Gcxz9PkIPIosfNca4lP/W4S7fcDjoVbDinwOaXbjubxl80X7howBcDHZHk2+2QmyFXCIbQtMPLkRHz+VFv926dDy07RLO8QS2n5Aely5HVYkz8LOG+Sl25B/Z7vamgmnvFBfEKT5gY6DmlY8bsyzFAp8k3/rSOr70Anny6g5+bzO4mExh1ZhPmjS5vLsUrOGW2/glOpY/Ss/tsBGARsxjuDkyVlJZk6xiMwXt+nQoNNQ+AfKGDySQG8xtmxEHyhbIEFc+kc79dqV6XDABVn5wNIgSssl/5K/Ynr1M5Vbz0TWWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zBbbFK7KZD7dZpsBgPpIaXYKCCNKqEsnmGtbQIsjFfk=;
 b=zMi5Zjxfu/gnysfpAzxL0wjUDizDo+XCgBo3B5s75SrBoueK/dQydBmh8lPvmG4F/mJSVhKN8UUT489LI/HU/HCqLWFMSY7zY0DAuAvr7zhZwPryCpf7GnvoMuzWaERo9kuKhRrLy7gJDWg2ft6OwA4963jEXiKK5mecZMi8k4S4PhhEHRNWHLK84XprXFlO4zkEsyS2TMJC824zVaXOscn+2TiQ0goWVgsf0cPOUUcisSWCqbof7XeX+/YUd83zFyW7VuOJNvJEB9w7YTeADs/EbUKsEGja5SAXyH37Z5/eJziP9PzZ75L8qjfNU5ktLcRt76t1TJAOTvKmfQMFhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by DS7PR11MB7929.namprd11.prod.outlook.com (2603:10b6:8:e5::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.11; Wed, 24 Dec 2025 03:40:56 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.9456.008; Wed, 24 Dec 2025
 03:40:55 +0000
Content-Type: multipart/alternative;
 boundary="------------p4n0tJ9cOetV651ek0g6eM6S"
Message-ID: <22d11bb9-0b18-4d72-b3a5-94d5b85037b7@windriver.com>
Date: Wed, 24 Dec 2025 09:10:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] binutils: Upgrade to 2.45.1 release
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        "MacLeod, Randy" <randy.macleod@windriver.com>,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
References: <14ecad42-51fb-4abc-a493-c58cfadb9688@windriver.com>
 <CAMKF1so7Bm9QgASazA3WnF+4mRtQqfwwFpvMHbyNsNBdo1c7Bw@mail.gmail.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <CAMKF1so7Bm9QgASazA3WnF+4mRtQqfwwFpvMHbyNsNBdo1c7Bw@mail.gmail.com>
X-ClientProxiedBy: MA5PR01CA0175.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::14) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|DS7PR11MB7929:EE_
X-MS-Office365-Filtering-Correlation-Id: ee0243a6-a3c0-41db-7ed3-08de429e3e93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|13003099007|7053199007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MkhoeGpvU2MvdjZybnQxcUpzaFJlTDhWRk5QT3dlK2xwdkNSZTFib09JYVhS?=
 =?utf-8?B?VW8zQTdoWDEzSUwzbHJoUTFRMjY2VU5mdW1uZm52YytoajlmTW4vNmtYMThN?=
 =?utf-8?B?K0VnTVZuQUxLQzhMd1pBc2lUWmxMRThsVGMyZVZwZVAwRVA2bnViWGpBMHYv?=
 =?utf-8?B?YkIzRHFjVkJhYnNWTkR4VUt6RUQyRUJ0KzIxRkZRNTVMSW5SeitRb0YweE5v?=
 =?utf-8?B?Z1Y5NDJMRXJ6dHdoK1A2Q214Z2g5Z2x3OFNkNmhEeEhlTVJlc05mVThTMXN0?=
 =?utf-8?B?Smh4TStoY3VPcCt6NVh2T0I1SzN3NGxOdDFtbG4vaElLWlBNYng3TjBpL2Vx?=
 =?utf-8?B?OCtIV2R1SmFQbU9LUnM0N3E4aWg3c1lvenh2MVEwRzI4VFFDck5NSjlPaUNj?=
 =?utf-8?B?TEJ4R2IzYkx3OTVsZUxQT2dvOGZZc2Q1VXE2VGVINVk2QnBWRnI1eXJGZ3Fx?=
 =?utf-8?B?SEhQZ1JoVU4wVThOM0NrZFFmZjdpVmltQ1BubTEyc0Z0ZEVKUDJ1dktEbFlz?=
 =?utf-8?B?RXMxUjhjSXdwMTR0Y2RhTVZFalhsd3NkUDVLVW82SWdMTGo5TEVUeVF5UW4x?=
 =?utf-8?B?UWZQZ29idlo5SmRzRjdVM3M1OUdoeUpOSnc5cVJOTEFPbDBlQjdqQ0Frd0Z3?=
 =?utf-8?B?NGtIQVlXWGRSTUxONDIxbWtMVEVXdTRqWmZGbkJaa01yNVpyL2toOUVDZ3V4?=
 =?utf-8?B?QVR0Qm5MQUxmWHlieUJGS2V5WkVlY0MzQWt2cm5sNTFBZ3RzT0MwenhjNi9P?=
 =?utf-8?B?Z2l1ZlppZ0ZiL1ZJbnlZR0RzZDZobWdPUVhnWXBXdm9HYldHS05sbEc0dnp0?=
 =?utf-8?B?ZzRkbHZ4OFNYZ3U2d1hiOXZnZ1JWdkRSLzZLcFRLcTM1bW1BaXdHaG0rd0Ex?=
 =?utf-8?B?Q2pKdEc1Qi9FL3h6Q1gwbnAySlRvdVMwcGgwem9OMEI2NUFNQmUxYTArRlMv?=
 =?utf-8?B?L3ZRbVhsTWRXVVFoUC8zNGUxcGZkdU5rLzhSeW5mTlJXYmcrNlN4WFBrdzZv?=
 =?utf-8?B?WGhQN095eEVMei9xSVJCamxheTltUUd6UTk3RTJVd01CMFREcCtsRDl5SWZ5?=
 =?utf-8?B?a3lRK29mS1N2Tlkrc3htMzBzMkd0UUZiMXoxWFlLNnArbzFFVHordWkxTW1W?=
 =?utf-8?B?S0RybklEaDQ3SW9vUWxHWmFodWw2VkNhOXpMQTlsbXljblBxclJ5dTMxMzZF?=
 =?utf-8?B?QUlXRUFqR1ZGb2pCRUowWW1tOGdnWkFrcnl4YWIweUxVRW5uZmd2UnNDaTBz?=
 =?utf-8?B?Zk9qOUdHcGdpLzI4bmFzVXQ0QUEwbE5DVklzeVI3Z29tR2l4M1NtdEc0ZnE4?=
 =?utf-8?B?bnhVa1pCMkRJbEp4bllES09oN2RMVlhQcFpXQWViYnNtWkNiMll4TjFFdkoy?=
 =?utf-8?B?V3V5ZkFLVnE5WnVrc1JRZ2hzck8rSGY2ODNlVmZEaHRUWFFOR1UwcHpVMGxo?=
 =?utf-8?B?UFZkdEFBN0hOQXU1WWwyTHk2MW9taHJadlh1L1pkdEorVnZVNHRHQkpGdWUr?=
 =?utf-8?B?YlNpQTB1aUtMTWtOL1ozU21RYzd2RFBJb1FISU1ZVzVHd3BqTW93Y3RxSkk0?=
 =?utf-8?B?SDM1UTdwVGlpL2gza0kxWVZzTkxYSnhOc0tpWXE0Smt3YldINFVXV1Zka2hx?=
 =?utf-8?B?bDB1K0JuRHRoejlqSm93UHJMcEs5T3gzTjdwTHA0Z0N5VDlObmR4OXBDV2t3?=
 =?utf-8?B?VFk3UzAxV3BVRVhNYUs4SmpWSllwRXp1YVNLZWM3ejZYaEEwZ2xRdnhvNEYw?=
 =?utf-8?B?YVlXYThEcldpbHVERzA3Rk50TVcya3NETlhPVmp5YVFVOHRTMWhueEN0NlE5?=
 =?utf-8?B?MHhqNlBMVVlZOElOc1o2Z091ZlVXSW43ZEFOVzZFM1JuN1dMdWw1RU9kLzEr?=
 =?utf-8?B?ZnFUTFpmUVdvTm9STktWRGM1VVYwVzU0Qml5anpMVkw4blE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(7053199007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SklNVUd5Nmw4cjFMQ1Uxd0g4Wk1BQVJHWURUT1M4VURWVUlIVE0xTGE1NXpC?=
 =?utf-8?B?NUtUTy81QmpocWEyN1B1S20xWWNZYnEzQjNmazFISzVnc3RFNXhpWlhiZ3Iv?=
 =?utf-8?B?b3psOHhsVWFIcnloeGhTeklwdkZUZFBscmJEZDUyQVdNWGNnc0szWWkzOVp5?=
 =?utf-8?B?VmtZaUFnYStsVzJETHJhdjhYVFdpQ2xtZUhvWDNZalpUVmYydlNvNDQyWGdy?=
 =?utf-8?B?dDVndXcxdzNOMmg2cUlLUnQ0MU14ZVNEcXpkaHkyRys0MGo5ekpPeHBKZTNE?=
 =?utf-8?B?eFppdWlwTUVIUWM5QzdkR0U1eDZCTkk3eWpnUXdPR3lKd3d3MmI3eVpnOUl6?=
 =?utf-8?B?RjhkdEZJOERUTUlsR0tqY2hwSHZHbngyVzlWY0pCRmh6WG5UQytKWHJ0bE1h?=
 =?utf-8?B?OHFnR3R2d3JFR0QxbUNsTG5wNkp5dngxSjBCWGNacGFpdSt0STMxNjNydDUv?=
 =?utf-8?B?VzBFZlJvN3F6MVpFU2tDV2NUM0N5Tkg4SW1TdzJ3b2lLQmIrbmJieEhZM1J3?=
 =?utf-8?B?UGJxdmZmVUpLczJ4em5xSGNwTU93czJyNDI0OXl6RS9xTjl4Ym1WYTZsZUZG?=
 =?utf-8?B?V0cyZENSUjFpQXZIRkN1MDNLcFQyMVZ6TG9iN2FZU2lxbEpGdGo0SlpkeDA0?=
 =?utf-8?B?UHJKZ1lHd3JNMGVnVHltcTFnU1BpQXdNWW1EUW9QYlNscStiVnVPcXdqM1JH?=
 =?utf-8?B?SlZaamJsbVZUeGxCSmNEbWJvYk1tMzAyVGw1aFl5elA3MEU4YVJEYzkvVU5u?=
 =?utf-8?B?U0I2OWhrdTV3Y3IrRFhYUVU5V1hhNGEzc0ZtQWdQdnVKekY5TG15V25ab25w?=
 =?utf-8?B?bWJkMmRMT2dkZ3BPSEpmNS9JamRBZVlmL0htWnRDb0VLbkRreWFQS2d4ZTV5?=
 =?utf-8?B?cWZXZVdTaUtFaWw4akIrc0JibXE5NG9pNUc2dkZNYmpqb2xvY09hQVN5WmZS?=
 =?utf-8?B?b3l5YTM1K2xhSjZTeHEvYUNTcWJrYnllcEVpOXFrREFWVmJiUm9Ycksrelox?=
 =?utf-8?B?SWxEeW40SS95UHFqSUVZL1dTbjhXOUlRTWF6V3kzSUhHdjl0MWZQVXI1N2Rh?=
 =?utf-8?B?dEw4bXAxY1YzSThYNTFoYjFoNWx2RVVUczg1MDNjdUU1RDNSNStDRkpmczBT?=
 =?utf-8?B?ZXprZmpwSmFPeVB4SVVISHFiQzRWWTIyVWd1cHEyVm04Umw3aysyY2dhR3BN?=
 =?utf-8?B?R3VYRis3RTJCdVBuSllHV1N0TW40cVZJdlkxdUxVT3cyUlJaYjU3R0dMTEpq?=
 =?utf-8?B?RnpOMW9uQVZIS2V0U3FpSWxndXkwMkFud2ZzeXdEQmR3aVoxUEdLMXF4cXZh?=
 =?utf-8?B?dlBsTzVyVXA3NGpUNHZWTFNoczd2aGZrZ01ZNWpWRW1kREI0Z0FyK2l5QkRN?=
 =?utf-8?B?OGp2NTVwQmdibnlDMUk2OTZDWnY2bkIzWnd0dnVaQ0xCbWxIbEdocTYxb3FF?=
 =?utf-8?B?L2sxckJ0SHA4YThtNjFFNzY3WmpSUEcySjlWRDNGNEdiMmVvUGYwbmswWlFN?=
 =?utf-8?B?WWxlZzYzck9weGl0SDd1d1A4eERYYy9uY0xJSXFNdnFhZHNDWjk4Q2dPNS9U?=
 =?utf-8?B?QzV4dXM5UkFDRWpNeDJUeVNSNVVabERWVm5NaXMveEc5a1pESDg4SGRHWldW?=
 =?utf-8?B?VWl5UE8yejNTejc3V2dIU1VIWitzcU5iR0FRZ0QzZ3ZxRnhzWE5EeWV1djNM?=
 =?utf-8?B?eWNYbjFaRTNnZVEwVTZuay9MRHg0aEFKbGhBa1llT0Q5aDhCUTZndjIwNStK?=
 =?utf-8?B?OElJSXB6VXJPdHhVTkYxdDRnNkhzN3VXSFpqMFlrT1RZd1JYaWRUVXhwMlJz?=
 =?utf-8?B?a1dFWnB6N05lczlBTlNucmFpOXdvN1dBbVhtSW53KytzZU9FTk9hamZMMXBS?=
 =?utf-8?B?a0s1T3h2bWVFa1JhbzhXcXNheVBwUW1pdDcwTVhaMU1HU1E2SUJYaEVBWE0w?=
 =?utf-8?B?Q2hCSGhCcUZZNng3ak15U0FRV21RNmpHSjFtSEZNMUR1U0VsUjEvVGpoMllR?=
 =?utf-8?B?ZEc4Ym1uZUQ0WC9rRjBwWUcwdU55ZU41U3c0a0MzSkJZR1Q0amszQVpicnhY?=
 =?utf-8?B?UkJ4cU9mbjJZQ3RDK3VjdXVtV0lCaEZ1NUFFWFkvUW1HT3VWc2tXellzdXNj?=
 =?utf-8?B?MjY2Tm1CVnZLaWNnbFNvYjBWU01jWEhSME5jak1ETWJqWEt2alMzSFNiU0Ur?=
 =?utf-8?B?dUFjQUR1dkNtNFA3UHBoczFlWjU5cGFUWTN4cEFGa3NpV29qMFpPOTRvZ0c4?=
 =?utf-8?B?V0FwdVFKaldadGxMM3dhQTBrYXREcTZnMXlIWlYxcGFTMWMwc1V4ZXJLT0Fk?=
 =?utf-8?B?VDBDWDZTZEFMUmkxUHZrQ3ZFbEx5WGtmcjRaSmpvZlhlMzFSeCs4NCtCRzZp?=
 =?utf-8?Q?FAj84g5Zn+ujk/C8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee0243a6-a3c0-41db-7ed3-08de429e3e93
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 03:40:55.8704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PbeCpj/f04OyxvRdM1lXBC8nLrTOgoxzJhzj2YmToB2kgIlvru8yBPXw7gmme1ESSHNiunqHmabRZkqIWGtpgK3zWeSyWPEwgTxpP711VKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7929
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: vqNBjhmWJ-LR0h1obp10O6aJLnnODu0q
X-Authority-Analysis: v=2.4 cv=Q+vfIo2a c=1 sm=1 tr=0 ts=694b60cb cx=c_pps
 a=LBR8CsJoUNkXwF8+XrmcNA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=aJZYe2M5AAAA:8 a=t7CeM3EgAAAA:8
 a=zIgFc4q9XiIEz9cjmrAA:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=BGw2QJaul8qF0iYYoigA:9 a=t0Qrb6gw-OsZ6DK4:21
 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=SfU6TQGumTKQ1EXAEY8U:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAyNyBTYWx0ZWRfXx4i5+CpFr5/v
 CTYpi5bRVRgo0UMORnKvedP5wW5hLYi9apvwlEDIFkBXmDgdz/S20gdHWw6OlwyDK0vmlfukhgd
 7hsm19pCSHtKjaaVQWskee+z/FUfArDeWhakKewhPVefO3OHparzyH5zxFE05ukeH/GCWP1rd+m
 2nm/GQCVsLNywudXV9qWrmsU8l+Hp6+Tjfc1yIKJjcuRDPNLxTFCdBd/lH+A4kmdJFfvp1igGIT
 sJYme8FPo885lz1oJbCY0aeawEbxWuQ+AZIgLf6BEcS4iyIq4s5PFOLA2AfptA/mW7PAVgdpSgz
 0KJ1B4YdEqF0RI8TmnMHdLD9kM8IzxVkIw35eS7aFAxEgY6rD+zeHpW/h1CimwKZI5mjtHRfiO+
 Rz70FD/kckQssj3OzTK+NHUGhOUcEgKvXGN53lMClLTa64jGVX483Hrcfcsj/kRollTtryuRsxL
 io2s4Cq5vow2OGYiX0g==
X-Proofpoint-ORIG-GUID: tWMKd0ot2XH9T1h4uU94E3df5PI86ZJK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240027
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 03:41:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228517

--------------p4n0tJ9cOetV651ek0g6eM6S
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5BO3dupD1414366


On 23-12-2025 20:25, Khem Raj wrote:
> What is the one that=E2=80=99s failing unexpectedly

Previously, "replacing non-deterministic member()" test failed=20
unexpectedly because it required "SOURCE_DATE_EPOCH"
to be unset while test execution.

Ross had sent a patch after the v2.45.1 upgrade which unsets this=20
variable and the test case passes now.
https://git.openembedded.org/openembedded-core/commit/?id=3D7ea5d2c5aadb1=
852aff23616e973b382df44c8d0

Regards,
Yash

>
> On Mon, Dec 22, 2025 at 11:16=E2=80=AFPM Yash Shinde=20
> <Yash.Shinde@windriver.com> wrote:
>
>     From: openembedded-core@lists.openembedded.org
>     <openembedded-core@lists.openembedded.org>
>     <mailto:openembedded-core@lists.openembedded.org> on behalf of
>     Khem Raj via lists.openembedded.org
>     <https://urldefense.com/v3/__http://lists.openembedded.org__;!!Ajve=
Ydw8EvQ!bSuADBQihRUKCPY6NcUSMxZKmUh5MGc2VnUPK5Qo5_PKn2nYUqzowTnjkErhZM_ED=
WH06QVXwUepNTneG3bJ$>
>     <raj.khem=3Dgmail.com@lists.openembedded.org>
>     <mailto:raj.khem=3Dgmail.com@lists.openembedded.org>
>     Sent: Wednesday, November 26, 2025 7:11 AM
>     To: openembedded-core@lists.openembedded.org
>     <openembedded-core@lists.openembedded.org>
>     <mailto:openembedded-core@lists.openembedded.org>
>     Cc: Khem Raj <raj.khem@gmail.com> <mailto:raj.khem@gmail.com>
>     Subject: [OE-core] [PATCH] binutils: Upgrade to 2.45.1 release
>
>>     CAUTION: This email comes from a non Wind River email account!
>>     Do not click links or open attachments unless you recognize the
>>     sender and know the content is safe.
>>
>>     Regenerate ld/configure
>>
>>     Brings following changes
>>
>>     * e3a18893e1c LoongArch: Use more appropriate assertions for the
>>     relocation of TLS LE
>>     * b136efd10a7 Re: dlltool memory leaks
>>     * b4bde11f310 ld: Don't use -mdirect-extern-access for LoongArch
>>     * ab776bc8685 lto: Set plugin_format to bfd_plugin_no only if
>>     known_used is set
>>     * cec7ab85f24 aarch64: gas: Allow movprfx with fmmla and bfscale
>>     [PR gas/33562]
>>     * 0b040187894 aarch64, gas: Relax Armv9.6-A mandatory feature set
>>     * 4df2be75910 i386: Add GLIBC_ABI_GNU_TLS version dependency
>>     * 71c1de4b0c8 x86-64: Add GLIBC_ABI_DT_X86_64_PLT version dependen=
cy
>>     * b0fe5c23780 x86: Add GLIBC_ABI_GNU2_TLS version dependency
>>     * d5945a221ff x86: Copy non_got_ref_without_indirect_extern_access
>>
>>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>     <mailto:raj.khem@gmail.com>
>>     ---
>>     =C2=A0.../binutils/binutils-2.45.inc
>>     <https://urldefense.com/v3/__http://binutils-2.45.inc__;!!AjveYdw8=
EvQ!bSuADBQihRUKCPY6NcUSMxZKmUh5MGc2VnUPK5Qo5_PKn2nYUqzowTnjkErhZM_EDWH06=
QVXwUepNd2s2e4L$>
>>     |=C2=A0=C2=A0=C2=A0 6 +-
>>     =C2=A0...-system-directories-when-cross-linki.patch |=C2=A0=C2=A0 =
48 +-
>>     =C2=A0.../binutils/0008-Use-libtool-2.4.patch=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 1827
>>     ++++++++---------
>>     =C2=A03 files changed, 832 insertions(+), 1049 deletions(-)
>>     .
>>     .
>>     .
>     Here's the binutils test results summary:
>
>     Test Results:
>     =C2=A0 =C2=A0 =C2=A0Before=C2=A0 =C2=A0 =C2=A0 After=C2=A0 =C2=A0 =C2=
=A0 Diff
>     No. of expected passes=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 317 318=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+1
>     No. of unexpected failures=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 1 =C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-1
>     No. of untested testcases=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 5 =C2=A0 =C2=A0 =C2=A05=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0
>     No. of unsupported tests=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 8 =C2=A0 =C2=A08=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00
>
>
>     The additional passing test case is, "replacing non-deterministic
>     member" after Ross's fix:
>     https://git.openembedded.org/openembedded-core/commit/?id=3D7ea5d2c=
5aadb1852aff23616e973b382df44c8d0
>     <https://urldefense.com/v3/__https://git.openembedded.org/openembed=
ded-core/commit/?id=3D7ea5d2c5aadb1852aff23616e973b382df44c8d0__;!!AjveYd=
w8EvQ!bSuADBQihRUKCPY6NcUSMxZKmUh5MGc2VnUPK5Qo5_PKn2nYUqzowTnjkErhZM_EDWH=
06QVXwUepNReXU5OJ$>
>
>
>     Regards,
>     Yash
>
--=20
Regards,
Yash Shinde

--------------p4n0tJ9cOetV651ek0g6eM6S
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5BO3dupD1414366

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 23-12-2025 20:25, Khem Raj wrote:<b=
r>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1so7Bm9QgASazA3WnF+4mRtQqf=
wwFpvMHbyNsNBdo1c7Bw@mail.gmail.com">
      <div>
        <div dir=3D"auto">What is the one that=E2=80=99s failing unexpect=
edly&nbsp;</div>
      </div>
    </blockquote>
    <p>Previously, &quot;replacing non-deterministic member()&quot; test =
failed
      unexpectedly because it required &quot;SOURCE_DATE_EPOCH&quot;<br>
      to be unset while test execution.<br>
      <br>
      Ross had sent a patch after the v2.45.1 upgrade which unsets this
      variable and the test case passes now.<br>
<a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedded.org/o=
penembedded-core/commit/?id=3D7ea5d2c5aadb1852aff23616e973b382df44c8d0">h=
ttps://git.openembedded.org/openembedded-core/commit/?id=3D7ea5d2c5aadb18=
52aff23616e973b382df44c8d0</a><br>
      <br>
    </p>
    <p>Regards,<br>
      Yash</p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1so7Bm9QgASazA3WnF+4mRtQqf=
wwFpvMHbyNsNBdo1c7Bw@mail.gmail.com">
      <div>
        <div><br>
          <div class=3D"gmail_quote gmail_quote_container">
            <div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 22, 2025 at
              11:16=E2=80=AFPM Yash Shinde &lt;<a href=3D"mailto:Yash.Shi=
nde@windriver.com" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetex=
t">Yash.Shinde@windriver.com</a>&gt;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bor=
der-left-color:rgb(204,204,204)">
              <div>
                <div lang=3D"x-unicode">
                  <div lang=3D"x-unicode">From: <a href=3D"mailto:openemb=
edded-core@lists.openembedded.org" target=3D"_blank" moz-do-not-send=3D"t=
rue" class=3D"moz-txt-link-freetext">
                      openembedded-core@lists.openembedded.org</a> <a hre=
f=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_blank" m=
oz-do-not-send=3D"true">
                      &lt;openembedded-core@lists.openembedded.org&gt;</a=
>
                    on behalf of Khem Raj via <a href=3D"https://urldefen=
se.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!bSuADBQihRUKCPY=
6NcUSMxZKmUh5MGc2VnUPK5Qo5_PKn2nYUqzowTnjkErhZM_EDWH06QVXwUepNTneG3bJ$" t=
arget=3D"_blank" moz-do-not-send=3D"true">
                      lists.openembedded.org</a> <a href=3D"mailto:raj.kh=
em=3Dgmail.com@lists.openembedded.org" target=3D"_blank" moz-do-not-send=3D=
"true">
                      &lt;raj.khem=3Dgmail.com@lists.openembedded.org&gt;=
</a><br>
                    Sent: Wednesday, November 26, 2025 7:11 AM<br>
                    To: <a href=3D"mailto:openembedded-core@lists.openemb=
edded.org" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-li=
nk-freetext">openembedded-core@lists.openembedded.org</a>
                    <a href=3D"mailto:openembedded-core@lists.openembedde=
d.org" target=3D"_blank" moz-do-not-send=3D"true">&lt;openembedded-core@l=
ists.openembedded.org&gt;</a><br>
                    Cc: Khem Raj <a href=3D"mailto:raj.khem@gmail.com" ta=
rget=3D"_blank" moz-do-not-send=3D"true">&lt;raj.khem@gmail.com&gt;</a><b=
r>
                    Subject: [OE-core] [PATCH] binutils: Upgrade to
                    2.45.1 release</div>
                  <div lang=3D"x-unicode"><br>
                    <blockquote type=3D"cite">
                      <div id=3D"m_1132560493976160023divRplyFwdMsg" dir=3D=
"ltr">
                        <div>&nbsp;</div>
                      </div>
                      <div><font size=3D"2" style=3D"color:rgb(0,0,0)"><s=
pan style=3D"font-size:11pt">
                            <div>CAUTION: This email comes from a non
                              Wind River email account!<br>
                              Do not click links or open attachments
                              unless you recognize the sender and know
                              the content is safe.<br>
                              <br>
                              Regenerate ld/configure<br>
                              <br>
                              Brings following changes<br>
                              <br>
                              * e3a18893e1c LoongArch: Use more
                              appropriate assertions for the relocation
                              of TLS LE<br>
                              * b136efd10a7 Re: dlltool memory leaks<br>
                              * b4bde11f310 ld: Don't use
                              -mdirect-extern-access for LoongArch<br>
                              * ab776bc8685 lto: Set plugin_format to
                              bfd_plugin_no only if known_used is set<br>
                              * cec7ab85f24 aarch64: gas: Allow movprfx
                              with fmmla and bfscale [PR gas/33562]<br>
                              * 0b040187894 aarch64, gas: Relax
                              Armv9.6-A mandatory feature set<br>
                              * 4df2be75910 i386: Add GLIBC_ABI_GNU_TLS
                              version dependency<br>
                              * 71c1de4b0c8 x86-64: Add
                              GLIBC_ABI_DT_X86_64_PLT version dependency<=
br>
                              * b0fe5c23780 x86: Add GLIBC_ABI_GNU2_TLS
                              version dependency<br>
                              * d5945a221ff x86: Copy
                              non_got_ref_without_indirect_extern_access<=
br>
                              <br>
                              Signed-off-by: Khem Raj <a href=3D"mailto:r=
aj.khem@gmail.com" target=3D"_blank" moz-do-not-send=3D"true">&lt;raj.khe=
m@gmail.com&gt;</a><br>
                              ---<br>
                              &nbsp;.../binutils/<a href=3D"https://urlde=
fense.com/v3/__http://binutils-2.45.inc__;!!AjveYdw8EvQ!bSuADBQihRUKCPY6N=
cUSMxZKmUh5MGc2VnUPK5Qo5_PKn2nYUqzowTnjkErhZM_EDWH06QVXwUepNd2s2e4L$" moz=
-do-not-send=3D"true">binutils-2.45.inc</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              |&nbsp;&nbsp;&nbsp; 6 +-<br>
&nbsp;...-system-directories-when-cross-linki.patch |&nbsp;&nbsp; 48 +-<b=
r>
&nbsp;.../binutils/0008-Use-libtool-2.4.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; | 1827 ++++++++---------<br>
                              &nbsp;3 files changed, 832 insertions(+), 1=
049
                              deletions(-)<br>
                              .<br>
                              .<br>
                              .<br>
                            </div>
                          </span></font></div>
                    </blockquote>
                    Here's the binutils test results summary:<br>
                    <br>
                    Test Results:<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp;Before&nbsp; &nbsp; &nbsp; After&=
nbsp; &nbsp; &nbsp; Diff<br>
                    No. of expected passes&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; 317&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    318&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;+1<br>
                    No. of unexpected failures&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; 1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp;0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;-1<br>
                    No. of untested testcases&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; 5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp;5&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; 0<br>
                    No. of unsupported tests&nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; 8&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp;8&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;0<br>
                    <br>
                    <br>
                    The additional passing test case is, &quot;replacing
                    non-deterministic member&quot; after Ross's fix:<br>
                    <a href=3D"https://urldefense.com/v3/__https://git.op=
enembedded.org/openembedded-core/commit/?id=3D7ea5d2c5aadb1852aff23616e97=
3b382df44c8d0__;!!AjveYdw8EvQ!bSuADBQihRUKCPY6NcUSMxZKmUh5MGc2VnUPK5Qo5_P=
Kn2nYUqzowTnjkErhZM_EDWH06QVXwUepNReXU5OJ$" target=3D"_blank" moz-do-not-=
send=3D"true">https://git.openembedded.org/openembedded-core/commit/?id=3D=
7ea5d2c5aadb1852aff23616e973b382df44c8d0</a><br>
                    <br>
                    <br>
                    Regards,<br>
                    Yash&nbsp; </div>
                  <br>
                </div>
              </div>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Regards,
Yash Shinde</pre>
  </body>
</html>

--------------p4n0tJ9cOetV651ek0g6eM6S--

