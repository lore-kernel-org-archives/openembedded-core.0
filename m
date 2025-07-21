Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F1BC83F1A
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 03:18:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.32087.1753067921632523765
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jul 2025 20:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=92971a342b=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56L2244Q810192
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 03:18:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4800k09huu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 03:18:40 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 56L3G5Zh931990
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 03:18:40 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2086.outbound.protection.outlook.com [40.107.93.86])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4800k09hut-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 21 Jul 2025 03:18:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NEQjf6WnCJhebMWmtxlxE+QMM8+mVINO8OdP/34czqIab78ERd6NH7N5Jg0NGc1iUVlimtQwEh0Y1k9+Rqp3HlUnQgnWuqrnNbXIO44bjGEyLoFzcYFOyLLqkgj4InB+Yq4ZchgQY9LUKchK8c5Uii9IpC7Kh0RBtay+FWigLJivsJSDo4MkHwUOxLSWaKcmoIFFg0DwyydcAzAMmAsIq6D1EwMbs3GMKv7Lz6iqWJ0uJJmfXnXR1Tzr4PzOTdHeu/rftvT2yf6BAU3IzzqanVVt3yj9hdlQR0BLlgUWa+gBecBQwAWVluNapjmYekEkyg1SYiolv69Bxg8IdCP+hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJpPVhJTQ862E+6A+MQlYDd/xn0WiGdQffv+aj2Wr/I=;
 b=RCXAl8ly+uYKIERmGa1zIUqMtJ1FZaXjX7CEAXVqSrz5JH1j2rPO8d+CVZu5J5muhm+PB9wwS2yZC0pbFxxFCFrfJ1n7A7XgSD5OBRWe70s1n31idSii4PczeI0lPxAeyjBCyyoebHtYcV05UIN7bpKwmGsc0CyG3yF9RZOFeNKXvFefpFMpdACsSaDrfIvDS9a2xHDKy/zTSsMtPQlMUy6mJJ6YD+hPHa2U0sKJC+ZTUnrErrEyPIKcXJe8v3PGXVQB9MtxgpO50yPXyDGjuSMnaARUujSL6sYOxUYFNEVxpXQBYusbaIG6IDagOLUnZkTaP2zeSGwp8u7K7C7iYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by DS0PR11MB7310.namprd11.prod.outlook.com (2603:10b6:8:11d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 03:18:38 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%5]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 03:18:38 +0000
Message-ID: <40709a8d-309f-425d-9270-046bff8771ee@windriver.com>
Date: Mon, 21 Jul 2025 11:18:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] compiler-rt: Use clang for native compile
 as well
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250711064233.590809-1-raj.khem@gmail.com>
 <f55a9110-37ea-4a7b-9351-194a49788c1a@windriver.com>
 <CAMKF1spoQFoVSkk+EqF1xwCBXcGVW6WXPpZjVuKJKogPFuHKXw@mail.gmail.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <CAMKF1spoQFoVSkk+EqF1xwCBXcGVW6WXPpZjVuKJKogPFuHKXw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SEWP216CA0070.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ba::6) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|DS0PR11MB7310:EE_
X-MS-Office365-Filtering-Correlation-Id: 1440f4c8-1943-4c74-e96c-08ddc80548b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dk9ZQmhZTlBmaFJHQnVCWEMrWHM0WExWK1hIbE9kcmxmTnh0MGRTSFZkZWxX?=
 =?utf-8?B?bndSYTdqaytEYlpMcUtGUVpGRTVnUGdIU2l5K2hGY1IvVXdieGxBTXlRcXVr?=
 =?utf-8?B?cFFyYnVJTGcxMEJodThscnhpTzdrMDVaQytlK2p2cFl6eHJ2eTFLY0tkSmpr?=
 =?utf-8?B?TVFwRFdBNmhKWE0rVUp4TjV4RHYrck5wb3cxUVpseWNLWU0reSt0dzVYVVA1?=
 =?utf-8?B?MktiWXR6V1dHSDB0Z1g2UC9CQlJuZFg1SVR4MnJTRzRXWTdvQks2MHE0UjRh?=
 =?utf-8?B?TVJ0ZlpqZW1RV29iUWh3VEFGZy9WNVZWOWI5Mis2eG9ETmVaRmo1TTNuWGV5?=
 =?utf-8?B?U3djV3pNbVR4RHlQbklGbkZveFNrOTZoWTB3eGV3bmNYQ0xGK2pJRkNhMVlv?=
 =?utf-8?B?SU1kVExMb05lK04zNXlwVTBoU09Tck5iREdZZHd4ek5OVndsbkxBL2oxd2hr?=
 =?utf-8?B?ZDQ5U2VhNjNzRDMydjFCNm5mMExkdnZRVElLVlFmTTZlaXBFOS9yOFV4cU1z?=
 =?utf-8?B?TWRkdzRxREZsdEEyaWE1aVM5TThrNGlYQngxR2g4VGZrN3VvVndETHp0VjlL?=
 =?utf-8?B?U0FOS3JOc0xaS0E4VEdwdjUvVEhSb0xaNnNPVWxOak1OTmhNenFEb3dWK2FF?=
 =?utf-8?B?UzB1ai9ZK29nNnp4ZXNXMFJlbjlaSE5LbG9ETXZvL3IwckczNkdzTEtBZzU3?=
 =?utf-8?B?RFlpZzVoMGRiaUZDWmlvVXFDVDhpSlFRZW8wRTlsYkVSZS9idXFsNG5ta1JN?=
 =?utf-8?B?aXVRUThBUW9jSzRvaHRncFltcmFSYUxTWGZLQlVJRm1UeXVuS25ObVA3a3Rr?=
 =?utf-8?B?QU1Ma0pISDEybDhYNnlkeFZnZForRk1nOU1GMHJnWEJ1NVQvMXMyaXVwS3Qz?=
 =?utf-8?B?amNBQkpaSmNVMXJXT3Y0NlpLQzR3YUdEcTVNYjA4NVJiU3Y2T2JURUFVRnJP?=
 =?utf-8?B?NWV4TG5EN2pFelBtK2kyYlRjZ0gyZTBxemdjUm9hMEwzSjRFSTdTdzJiUVd3?=
 =?utf-8?B?TkZ1ZjBmd0RsdkxVc29GNjR3MWNWL1RDL1hTcjJJWmp1WTJYd1N5aGw2STZX?=
 =?utf-8?B?ajd4OHFnWmlnQzBRYWY2dWZ6UXdiUDBDSSsvRzAweG5ENDB1VUZuSWNFZHRD?=
 =?utf-8?B?WGtSODZhZ1B5cUhsSWlXak9McHBudHVmdVVjbWR4QkVzYm5JRWpCdEhlRjJr?=
 =?utf-8?B?c2RtMTU3Ky9OYnNSTzhVd3UzbDR4eEs2M1JYR09JN3QzZHlkUlVxdytxVFVL?=
 =?utf-8?B?amM3aUduekl0MlZmL3pIQktzYmRMUU51TzUvNVcyK0RuNERpMVFva0JIUVMy?=
 =?utf-8?B?bXZJQWR5Q1pRWFAyUm1ta3p0ZlNtOFRtRkJaY1owL0ZKaHdZa1p2dUM4ZFJK?=
 =?utf-8?B?eEptSitRdXBuUXZOZ2ExQjdtKzA3QlhKVVJ3UG80ZzBmKzFiQXpXZVZiMVMv?=
 =?utf-8?B?M3Z3WFRyZnRCVUQ3b0EzWnN5R1BrbDVPU0RIclBQaDYxNjNBQWdqSk51MjhJ?=
 =?utf-8?B?enkzZUVkZkRLVFJCUEdMNWxGY21ZWVFzZ1JLeWltQUpHUGZkM3hvWnZuNktn?=
 =?utf-8?B?UWtlQ0dadzNpamxjY09kNlM1aFR5Z3lwbmN0RlljWGhzRGUwM1JYc2hIOGVq?=
 =?utf-8?B?RTFRNWxmdkJWa29ObytxR1k4dG9IOWgyd1I1RU5sb2hWeFBVUzE0aStTNjVh?=
 =?utf-8?B?UnVoQlVSb3J5V2VoclZ2cE9BMEgySEF4NlN6SEk1WGxPU2VuVDJzNVBPZXEw?=
 =?utf-8?B?UHQrSVR5VUFNRWdzOXJwaHNZZTVaQ2w1b2VyNE02SVRIeUtNUUw2ajlTR0di?=
 =?utf-8?B?T0pvUzVla2RBbVVYRjlHZFR0OXVSemVkTEFCYW1vNWc0bjNvMnUwOGtuYWVE?=
 =?utf-8?B?Q3RPR1N6VDVUM2dCQVJyajV2QktuSVMwRmczK2dUY21qOVhaK0paMUdkb2NR?=
 =?utf-8?Q?tyf5Xz72c6g=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WCtEanR3YjEvQkZRcFFnVnF3ZFZ4UjdwdmtRUnFnWE5wdXZIY3RScjhuaGRK?=
 =?utf-8?B?YjJuZ0JpMG9LT1d5RWlvTnYxOTY3Njl4VXdtenZGMUQxbHRGS1pqMmZsSkNE?=
 =?utf-8?B?V0VRSlMwY1Mva1dudmNVY2VVSmdDMGQ1bjh1cFh2VGFnS09kb256UzB5cHk4?=
 =?utf-8?B?VWhwMG9rMTdsMm9hZHZnQ2tQMUpHWkpRWnFtdGJBTDFtUUsxdlZtb0JNYjA5?=
 =?utf-8?B?K1ZuU3h2SzM4RG5jeEdHMWVqbk1jL1REa3QxbmtnbjNNeUFvcjh0VU16N2JI?=
 =?utf-8?B?RDEzQkJjWDhqQm45TjB5OXliNUk0eDdmeVFRYmcwR0NldGtuV1Z4eGlRSGNy?=
 =?utf-8?B?Q2lqY3FJMGYwdExGZVVUckJnQzJkM1R2RXNvZ3B0T3k2MkVRd0VlUUUreDlx?=
 =?utf-8?B?aEFrYWZNQlJqNndEYlpyZlQramRXT28vMXFVc2txQW10Sk54bzBBZlVhcUVx?=
 =?utf-8?B?b2tYME93VmcyS2xQTTJZamRhWkVFNVdwRTBTZU5pQjE5QjRGSzBPWmJSendC?=
 =?utf-8?B?LzZmcFdQbGNvZ3dVMlYrM3BlK2xrYzFPK0lLVE84YlcxRDhLM3doVTI2ZFQ4?=
 =?utf-8?B?V0NUeWQ2WVZ0OVZNTWRYb3lmRTVtZWN4YjUreUdUelJKazh1R0ZKbHdZZEIx?=
 =?utf-8?B?Uk56elJhOHlBbW9BRDl2VktzWEpCbG5JcE5GdVRjcHpDdGliRXhUWmIxWHFO?=
 =?utf-8?B?c09NS1VNazVBVzgzU1cvZDZhU1o4RXBEZXJxcHVldjZ1cXFzWkhoUTNCN0tH?=
 =?utf-8?B?ZnJsNGxaVzgwd0hjUkJRSVhsWi9rNWduaFF5VG40QmJPSkhmTE9vays2NnRQ?=
 =?utf-8?B?Q0cvVVdoYzAyVUJxQzY3eHc4NWlkNWJGcmtaSHpqeDd2cVZ1Q01zSVUzWVc2?=
 =?utf-8?B?dEZEUUJTZ1pqaW9FbnpvblBCV1JkMlRlam1ad3VpWWxOVWRQVjNESVhlbGtF?=
 =?utf-8?B?TDR6czF3dzg4dmFFVGZpOG5XcmV3Q3dEZ0Q3bjlTcnFuby9SMUpvRDB5QkhB?=
 =?utf-8?B?eWpZUmlKY0thNGg4VFAxV3ozcTZFY25HR2xJdDE5OVozYzNTYkZVdmZxMFI3?=
 =?utf-8?B?NnlpbUFrOHJFWE1Tbm9TTitPMWZZTGlGSGxUMG9qVmZ4MDQ2N0JBb0VWUVNE?=
 =?utf-8?B?bkJJWXhBTnF2eDNac3dxdm1hdVgxU0crQndXeXdaTnZhdXpaRmh4UTJodUhD?=
 =?utf-8?B?WEZqbTlOeHFDZGY3Z0lDTE9NbENKRmdxTW5zUVV5RW9wRUREVXRwek9NaFNo?=
 =?utf-8?B?QTJUYTVGdGQyTzZIUEMyd2wxbmg5NTFWbU56ZGJXMXdZUDJvTG5kN0J6YWVK?=
 =?utf-8?B?eGRFMk41Ui9UNnR2aXowL2VZWk9ZMGs2Mk4zUGkwMTNRK3BRZG9WaGJ6cW9L?=
 =?utf-8?B?ZGVYbUdLZ01XNThsVzRIcm56TmY2RTF4MHdqL0oyYWw1eTFvcHBReEcxdWZq?=
 =?utf-8?B?SVJTdkovZXBzSWxtaTBlVmMwKzJTVFl4Z3htNUxKU0RJdloxRWdnOGhaOHkr?=
 =?utf-8?B?UkEvSFUrYk1QWUxGZkZIc2UvdytvOVllRVpqbWY1T1VaRVBoSHZPTzI4ZUQ3?=
 =?utf-8?B?WDI4cS80OE1zRlJSTkVza2VkbUNhWVhxVWRnQlh6RmNmV3p4aC9iMndzQktV?=
 =?utf-8?B?Mi9rNm9nZ1JBSTVSOUNqTjFnRlRaR1FCVXVPQm9HdFNaTTNCamtRbm1QM3ZN?=
 =?utf-8?B?d2EwL0hwRThwcmFMb3U1amNxcXdvaW9vYXFmWWxlalhiYTV1cmVyVEdvZ252?=
 =?utf-8?B?YUtySWlkLzFtdGVXVVpzNDBURjVMTEc2WTY5NjY0VmdubTlxMTV1TnBpdjBn?=
 =?utf-8?B?SUJPYVpra1pBd1Z1SGZqVkVKTTF3NUd5T2dDbHFsYzJvN0Q0NWtXdGtQUHdF?=
 =?utf-8?B?cGhNK0Z2VlZuYkNKbXRKcXJNMllpekJpWi9vRUFFL3ZyNnRLcWt6bE9aODhH?=
 =?utf-8?B?LzBNeFJpbWl5cU1McUFMOHQvYmYzbXJYZmxkQnk2UTdVbnNRZjIvYXFwcTl6?=
 =?utf-8?B?KzRFTWFCSjF3UTRrM1JSc3dvWCtXY09HRDlCNVlRSGx6R1ppUHplQ2p4bjIr?=
 =?utf-8?B?bk5Vakh1Z2NqdExYTEJoWlR3c1hqUE51WFlCVVhTY01HMEk2NUt6UVUxcHI3?=
 =?utf-8?B?TjRibm43Qk1WQTNFTWV2ZXVXeHdnYmNpZUtQVmNyWWJZRXRZTnYyU2xTUyto?=
 =?utf-8?B?bkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1440f4c8-1943-4c74-e96c-08ddc80548b7
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 03:18:37.9546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cOc/9Hccu4TBMogAJs8xiqovzx+J5r0EgMmkFmOxmu8ODf5x834RgRH9FT/qVEjN9weLZlmX0AtEr81f48kS/ioFGFS2VfMA7DtxRu3SyLM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7310
X-Proofpoint-GUID: mqFQy3-eZbB60HzDg4TBT507eHRjj8fE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDIwMSBTYWx0ZWRfX1V+nj/YX/TNS
 KPStcY2El83v4BpreOPiqJx2/UkwOi7Y/4Dayal4ofuvZs0lmLiNkN+aytN9FC5NrW1c2qs574i
 v+Kpt8gIdkyd3bm9CnU9zCibNJRG4V/SwsiXFk880Na0Uf6BQhzMLSRPMORj8+aE0+9BmuPUoT4
 oI1DwZBH1KfcaFbIfb9KYxT6cyzpbt5t0oX73uVBMpQB1xXLTUpANF3pTnYP50HzoXA9V64pGJc
 lbyyuv2j7pcaMODAs5snzcOuKBhQJ8vBzDClQwR2Y6qR+V5jWViz1mKgK8r1g3Sr38C+pzAuH00
 NZiB3I3mohMDdg78KVzzmn/n62+MoWj0+/tWWR6TXKzTaKoeT1FA+Lbh8nlEXvSB6UiYlGy7tnL
 KS4lxjLs
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=687db190 cx=c_pps
 a=muCzuJRA6IS5PBT2mfi56Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=FcmGULZRri-m0WDjqiMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: GWvHN7tEiQjgoewA843S7ab2a3TzG2_d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507180201
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 56L2244Q810192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 03:18:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220653



On 7/21/25 02:53, Khem Raj wrote:
> On Sun, Jul 20, 2025 at 4:45=E2=80=AFAM Robert Yang <liezhi.yang@windri=
ver.com> wrote:
>>
>> Hi Khem,
>>
>> I got compiler-rt-native do_configure error Ubuntu 22.04.5 with this p=
atch:
>>
>>       /ala-lpggp71/lyang1/poky/build-u/tmp/hosttools/ld: cannot find -=
lstdc++: No
>> such file or directory
>>       clang++: error: linker command failed with exit code 1 (use -v t=
o see
>> invocation)
>>       ninja: build stopped: subcommand failed.
>>
>>
>> I have tried:
>> 1) Add libcxx-native back to compiler-rt-native's DEPENDS, there would=
 be
>> dependency loops.
>>
>> 2) Install libc++1 on the host, it doesn't work, get the same error.
>=20
> you need to install libstdc++-devel that matches to newest gcc version
> installed on the host.

Thank you very much, it works after install libstdc++-12-dev on my host.

// Robert

>=20
>>
>> // Robert
>>
>> On 7/11/25 14:42, Khem Raj via lists.openembedded.org wrote:
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>>    meta/recipes-devtools/clang/compiler-rt_git.bb | 7 ++++---
>>>    1 file changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/re=
cipes-devtools/clang/compiler-rt_git.bb
>>> index 342a7b0e95e..4da85f29378 100644
>>> --- a/meta/recipes-devtools/clang/compiler-rt_git.bb
>>> +++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
>>> @@ -35,9 +35,9 @@ DEPENDS:remove:class-native =3D "libcxx-native comp=
iler-rt-native"
>>>    UNWINDLIB:class-nativesdk =3D "--unwindlib=3Dlibgcc"
>>>    COMPILER_RT:class-nativesdk =3D "-rtlib=3Dlibgcc"
>>>    LIBCPLUSPLUS:class-nativesdk =3D "-stdlib=3Dlibstdc++"
>>> -UNWINDLIB:class-native =3D ""
>>> -COMPILER_RT:class-native =3D ""
>>> -LIBCPLUSPLUS:class-native =3D ""
>>> +UNWINDLIB:class-native =3D "--unwindlib=3Dlibgcc"
>>> +COMPILER_RT:class-native =3D "-rtlib=3Dlibgcc"
>>> +LIBCPLUSPLUS:class-native =3D "-stdlib=3Dlibstdc++"
>>>    UNWINDLIB:class-target =3D "--unwindlib=3Dlibgcc"
>>>    COMPILER_RT:class-target =3D "-rtlib=3Dlibgcc"
>>>    LIBCPLUSPLUS:class-target =3D "-stdlib=3Dlibstdc++"
>>> @@ -57,6 +57,7 @@ LDFLAGS +=3D "${COMPILER_RT} ${UNWINDLIB}"
>>>    CXXFLAGS +=3D "${LIBCPLUSPLUS}"
>>>
>>>    TOOLCHAIN =3D "clang"
>>> +TOOLCHAIN_NATIVE =3D "clang"
>>>
>>>    def get_compiler_rt_arch(bb, d):
>>>        if bb.utils.contains('TUNE_FEATURES', 'armv5 thumb dsp', True,=
 False, d):
>>>
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#220135): https://lists.openembedded.org/g/openemb=
edded-core/message/220135
>>> Mute This Topic: https://lists.openembedded.org/mt/114096532/7304958
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [liezhi.yang@eng.windriver.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>

