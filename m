Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3B01CCD185
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 05:43:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.35856.1760334227084766567
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Oct 2025 22:43:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=hUeKewCE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2381cdf521=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59D4nttG1261366
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 05:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=QDb1aOXgfgvzRczVC1jgQl
	0O74afaDfxDer756sPi5o=; b=hUeKewCEH9ULO8z29oT6lcXMmiIBbj4hk61L9z
	njYMfnUI4hkg5Bm9UQVR/rFs/P9KPnCHeOKvu423nyVhURQavI1p5vL7cREVSY0A
	bX0frRN9uLXl9SuYps3sNcw7JHHzLGg1lMUAM8397fSflSKhK9MiNuvUKPQMMajD
	GVcYoEVX9qKrvIl7fa9DvLol7fWVWpXyH4CbGWWJQlrexgeD3Gb9Y6vgY0gtmISz
	N6t4watCMAppxcp7q6IjRMIpvde4jS6oVPM5AOBPYZwpmibDourMj0M8eopgOtkA
	gfCOd7OU5T0qUbVaHUURww6A+c4QoTytRM/uSlSlNx7Pnmjg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012046.outbound.protection.outlook.com [40.93.195.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qcewhg65-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 05:43:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZlUEXkaf/pk/qmLywcPhRsOs/8vcTTkAhK80GE/iZrSLuysZ0pwn3TCcCNuk6je3hkliK8cucJetyoVapZ7J6EV7CmIBdwfEgLHik552P8JTaFtWbpCxDeucv2Ga0AK6r5uvnohnD8NOYEl3iT45IEghGqn+KnWFc8Gw6jL4d73wSj+Lxx6+cdl0XpVxGlmYi3SLkuYROMFoHwy4p3CHGF8bh0Tf4B0dBaEJ+PtkvBHaWALDyr4sRm2vJtIVmTctN6rPhTSnZCYITEZedoFnRB4COP+DCv1fqRJ915QsMKRCsECH3bK7oYVhDqE0+9ylE9jDujicC4yBekn3y0itFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDb1aOXgfgvzRczVC1jgQl0O74afaDfxDer756sPi5o=;
 b=NKy7YyokNpENi1gmY72s03AfSLc4OE4ESATbqD9ZJrUWXJbJ+uYMH+oOjZasuEPF0jQ5e7oLsYLUc0lUQL+itKcwYVjk1BKMOBvHFTsWlmReHx3cKzsG5vQbP8XNv6xulb+/v9EdmKPeFBejdF1Uh47Qm5fLKghwcJ0CqyyefpkDtGS2BZRUWKnOSNFgH6eGSso0lu1p39+PGlKxm17RKbweqpu4+9VJa9jrX3Z9vd9tJcpWywr0SB+w2d+xPwp/OjH5SiyX1WdmUkYaEEzqj86eT9FpcL0zq486ZAc7VsVmsdQm1zpCByoKxlTaSmC8HBabF961oK87b22+XS1dJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DS0PR11MB7335.namprd11.prod.outlook.com (2603:10b6:8:11e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 05:43:42 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 05:43:42 +0000
Content-Type: multipart/alternative;
 boundary="------------gP6gKNUcaTGI70tLzEcB5uvZ"
Message-ID: <fa48bc66-598e-4155-92e1-0ca43f61358f@windriver.com>
Date: Mon, 13 Oct 2025 11:13:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH] glibc: stable 2.39 branch updates
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
References: <20251007063146.2204704-1-Deepesh.Varatharajan@windriver.com>
 <CAMKF1srf+8nF9rvQ058VpzeFU4zPMe4b88jYCT3QqrW=D_nkYw@mail.gmail.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <CAMKF1srf+8nF9rvQ058VpzeFU4zPMe4b88jYCT3QqrW=D_nkYw@mail.gmail.com>
X-ClientProxiedBy: SJ0PR03CA0354.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::29) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DS0PR11MB7335:EE_
X-MS-Office365-Filtering-Correlation-Id: 61bcaf2a-3697-4d8e-631a-08de0a1b7771
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QTBEZGh2Tm1DZmpQcTNqMC8vcnlJNFFINnJteEhaME5ESFg1by9tNjE1RjZs?=
 =?utf-8?B?aklud2FyWEdFT2dYdi9OQjRGSWREOUVNeVBZYzE4ZG53NTVDRW02ZTlPVlFl?=
 =?utf-8?B?eVpjUU9uUTdQN1RkQ0lkY2ZnR3VwMmdUVHVGN1c2QmlWcDZ0bGhzdmYzTnNr?=
 =?utf-8?B?TlFIS0d2SExyeFJQRGV3T2dmRk1IVHdFaFBEUUtJNHkvM042T1ZaNUpSM2JD?=
 =?utf-8?B?dDVyclNsZzZBb0N1ekVFTU8wWEw1dFlhLzNNdVdYdHRqZmpmb3hyRm9ER1h2?=
 =?utf-8?B?SXV3Y05RZEx4UHVISFBwaFoxdkZxNHkzeTIrZkpxLzV1a0J0Q2dzSS9adHlu?=
 =?utf-8?B?clZBMmFaOFpwanp3Q0JyeE1BVDJqcHdxeGZMWENibTB5RktkejhkUUk5TkxZ?=
 =?utf-8?B?bEw5enFScFNJbU43NG9IS2RmODd0RUh6dUxrNW04SEw2c3U2YWNWRndnSzhG?=
 =?utf-8?B?M0lCU2o0TkRhY3d4T1hOQkVOYUNTTGU3TDhqZ0RBSGlNT09zbTNYOXMzaVZN?=
 =?utf-8?B?dWczek85SEFEQ1NwNlRpa0RXOUV3djVnTEVEYlJJMkQ1REZvQUpOYm9OSjd4?=
 =?utf-8?B?WXJWbUtlaDlvbElzcTdPMkxnSHVxU2FrWnMvRUo1TnNFTlVLNFMvNHVYZG5G?=
 =?utf-8?B?dXFJR0ZBeHVHN1VkUWpSS0VaaGZSRHFWSXVTcUpmUzhMUWYwUnM3ZDkzZUtM?=
 =?utf-8?B?ZXMxNk80SlZQNTF0UlYrMUswVHJOZGxVQThjTzNHQ011VjhEMGlQMGR0Tll6?=
 =?utf-8?B?UDZzd0pqYnl5SXVpN2JNVXFhaXV5M1BTNVRQd0xVb2pTcDkxWkd3MVpNN0px?=
 =?utf-8?B?aWc2UVExNXNTT0lkd3VBVlNmYWc0Y1NRZGdHZmNnYnlIUDVzRndGNXUvamdL?=
 =?utf-8?B?QmZ2QTEwRkExWmRHL3kyQWlOaUpOejNPbHd3SE9LbGhLOHp1cUZCclpOeGxQ?=
 =?utf-8?B?Z2YxUG5FQW9tbjRaOWhHMGRwWmJGcFVDVk1uZ0RYUWplMld2UG9XVFFYc1ZG?=
 =?utf-8?B?UXphUGVqaHdpZHBHekNNNUdvKzJQNGEwU1NMUUtLL2pudHlRT3IxcFR4WVJq?=
 =?utf-8?B?YVFqRytCRU9QbTBXVkJrTGRpZlNicVRtcHBXM0xBK0ZnNWlUQmRqanBLV1RH?=
 =?utf-8?B?MXFnWndMbnBISlBvdmRaOXlsb3B3akhyUXpxSGFFMVRQd1BpazlLc1NkNENr?=
 =?utf-8?B?aGNjSVA0UHgzdllaMzUvOGwzdit1WjFMQW82SzVReDZxbmhRRCtwQWpmSnE1?=
 =?utf-8?B?VmNiNG9Oc2pybi9uMXdmaGlUVTlnaTMxem1tSTg1dEMyYThaUXQ3N1FGcVox?=
 =?utf-8?B?dndsR0xvV2pHcnFmV2lMaHg3ZlhObmxoVXlMd2JwS2M4a09YVFhxWXVFRkVW?=
 =?utf-8?B?SjNaUXpmeU5WMkcrS1Z4U1k0S3J2c3liV29sSjMrWEFScVRiQnpZZiswbHZR?=
 =?utf-8?B?YXpTaHViRGdTUUJuTlg3dWtzc1N0NnBvbjJVelBmRENmUzFYSmVMcHR6SjNp?=
 =?utf-8?B?VG5wMVN5N29jNmpmekprVjdka0g3dnl5YWEwWm0xejg4VGpoK1lDWjFhelZm?=
 =?utf-8?B?clkyUnQzVDJhdTNVMlhSRXh5eVkxN0RqcmtySGZnK0g1NmNSUDZnSW9WTVRW?=
 =?utf-8?B?cjhrUXNWNmVLQzk0T3B0UFlsTjdZMmhOZ0UrWk5JQXZsLzlBRzJPNWZVVjJa?=
 =?utf-8?B?MzkrL1BBZDJOaWlxQmQxWS9HNlc4M3RsVTkrYm8yWE9MMjJ0bFAwN2F0VWY2?=
 =?utf-8?B?dWZFNmo3MG55TnNIUTRxamhIQXM4SHN4bGxMYkVITWdiVFcwb2h3ZmpyaGx3?=
 =?utf-8?B?RUo1cHNYWVhHbGxDaGZDS3ZhUUdYeENpbW40ZVkwMVhid3FxOHhCQm5YOFZ4?=
 =?utf-8?B?YTFjL2J3dFFpeTZSdXdrUktOM25JYVBJVEgyWDF0QU5tR2c9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b254bExOcmg1a2YvS3ZNbU1WeFRzbmlWU2t2TVcxang0ZWVrOWpGdGxBa0hp?=
 =?utf-8?B?d0kzcUlDcWxDY2FxanYzVG0zL2NXZTMvUzVuN3B3U0QxU1ByMS9IUzdvNnZR?=
 =?utf-8?B?ZnJFdkx2ODZZbTJFRUlwNERjc3YzbG92cFNYcyszMmlkNlpoMm80RWlqbGZV?=
 =?utf-8?B?aTdlTUVPeXFoVWUreXUxWlNFNTA3SmFoRmRkcVVjVmszd1J6dnErNDAzQ3Q3?=
 =?utf-8?B?QVduNU4xd3ZqUmhQSlRLeUZkaWZ6V1I0aXBFWDdvUW4xQ0l4VW9makxlcmd6?=
 =?utf-8?B?bFlFVDRDZnNNRmVkeW10Y2t6dUZpUEhFOUxOMmhQWW55ODlqME1MTEhnWUpP?=
 =?utf-8?B?R1dxVEpaRVhXYjY0ZXh3VjNMTWxKbjhHVzF1NDlRZVFXOGE3T2o1OVduRmZX?=
 =?utf-8?B?c3ZIM0lkeWJaSzk0NHFUbDJtODFCMXJUcU8vd3JiUDYyY1V6NEtxYTQ0QmRM?=
 =?utf-8?B?NHJyWDAwZ0t6TFM4dlBhc2pnWkQya05maFhEWWRsNysyVnI2UmZRS3NUTU1K?=
 =?utf-8?B?TmNVNXdMNXJSeWRGMk1SQzFXeUlJQmIzZ0xOTTNqQXE3REhkbnNJRW9UZEtH?=
 =?utf-8?B?aDhTZTl1UzJyQlI0TWpyNlc4Tk4yTDFRV1R4VkkwVzFHc21RazRvaWFUYjVJ?=
 =?utf-8?B?LzlObWNrZ1F5bE03aHMwdFBET3V0TmJ4dkkyTVZwaCtWczdCWGV2dWtaZjJt?=
 =?utf-8?B?MTNzSXJnWnhNMWVzdVcwQzRsanFQQVB0a0cwejk0VG13cVV2ZHVDOW1VdGJp?=
 =?utf-8?B?TXlBWUhFd0FtR0w2Wk9yTlloR3BWQk9RaGE5c09xdTlocnJ4M0hJcGEyV0pG?=
 =?utf-8?B?OUYrZERvY1duRldyaW55dkx6SVVwZVh5MmhYTkJuK3FJQy9UeVdVdlh5MFl6?=
 =?utf-8?B?Z0R3SnBmUnFjSE54TGU1b3J0bGNZYzZKZWVaWEw1WlFVak94ZTlHUkJQNnhR?=
 =?utf-8?B?SEdGbXJlR2I3Wm1HMDNZTElFdzJYNkV2MGlRUThuL1NRdi9DNmdPbC9qMHNu?=
 =?utf-8?B?YlVEelkzZnAvZFVNYkE3VXpiNkRMUHQwZ1g3RmcyejAzSkkrZkRudzY2Tjd0?=
 =?utf-8?B?TVhHbGdiMUVJdXVTb21qV1BIT05GSW80dkZnbXEzVEoxVC9LVnQ2TGtUNURQ?=
 =?utf-8?B?dnRaVm1FcWFBd0VvcHY3dEk0ZHlNSTFJTlUyVUFnb2REUlFXVGx4RlZ5ZWxQ?=
 =?utf-8?B?OHNzL0ZOb3VvaTN5bzJSLzNqYWZraWg3eXZqaFdodWZ0WVg3RW1GOGN2M2VY?=
 =?utf-8?B?V1RjaHpyL1FLYnppbE14TU12R1JEL1lKQmlXTzFuQ2htRmZMOHRDV1BJQVZ4?=
 =?utf-8?B?WkpjclVaL003dWFJbXZwM1E1WHUrWjQzN05CYkdpZE9TekE0MXhUOUdJTERq?=
 =?utf-8?B?VTB1dlJkTUlkYzVZNGVESmlMYzV4T3BJVDJVa3RPb3orZTM2NHdVSzliS0d1?=
 =?utf-8?B?ekFITGEzczZiOWV4TUdWVloycE5sYkFRRm9sZWZ3am8xY2JSaGxFTjRXaHh1?=
 =?utf-8?B?Y0YxWmNmZmJhdys0QkNWZjhlZGwrU1dVYXdhSzVBRTMyUHpSYXVKQUFKZ0ZS?=
 =?utf-8?B?NXdjdEgrY0pyY00vazY2ZnhWRUkvUDYxdGZWRXBQVGh0Z0lxZEdlV3N3blZh?=
 =?utf-8?B?bVhmbmxxTmdsVlN5K3EyOE5QTVZMRk42cVZ2N2Q2bXN1SVgzaCs2Q2Rwallv?=
 =?utf-8?B?RDYzNklpVVk1b0tmV0xjZGE4d3lycmJwZ01XN0V5WE1hWHA2Y0M2LzJQRHk5?=
 =?utf-8?B?S3FuSEg1NU9JQmlUYmRyWk5jRjV1dkdVcEJzaURVamlpSGs3dlRrV3RabmNW?=
 =?utf-8?B?VElRL3Z0NzZjWDZrQ0RtM2tlRFg4VDhsQUhza0s4c2RCSGM3TnpqQ2piQ2Nu?=
 =?utf-8?B?L3p0T005K0dKK3dVWTl6R1pQaENxbFFGQ1REVzdoa2Jjdkxwbm02OGhwTHRB?=
 =?utf-8?B?dUJLR3doQ25FUnBHM0thdjYxa3U4OHkvZTN0VVQvTm9YWGJRdDFFd3FPMWRy?=
 =?utf-8?B?SjBVYTJUN01FK0NNQkVwZ2dIU2VOTUFFWWJXZTJQUXltZVNVUGFnM202ZGZH?=
 =?utf-8?B?ME1LY25odGJzZDFmRnEzWUhkcGx5Yzc0c3N2T2FNMWxSVmllNzNQWnpJSmNO?=
 =?utf-8?B?akxWdDdkWWpyUHFSMXJpTGtYd0RWbUdYT0swdXBrc0VwOEpYZG9ZbUNKbnl1?=
 =?utf-8?Q?TxrR6URpqr1y8ux3SgZCBpw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61bcaf2a-3697-4d8e-631a-08de0a1b7771
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 05:43:42.2126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dk5wCcOvQgVVZlKth3HuZzXm6yUU5BXNpLcGblo1C5Yh9yaaXe+DJInGN8M9ph+p+oq5Lduto60aR794uS7hrJr9MGZIHsGc5HzuoY6wRcwgiR5si3o63GLAX3j+IHf9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7335
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: i2vNyhmAaKT7euOglFzIWLnwukjQ82FJ
X-Proofpoint-ORIG-GUID: _olOQLxNDVUU6FFjktE08haFnf6zj8Km
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyNyBTYWx0ZWRfX+Mv9jAMOnv3p
 bvpheQ5iCPPS1gy/yggdij/bPewZY+DN/Fj0oad1uDDI8qOrl+WkW8uk5X1DXE2j8p+JgKlLiH1
 WkPJO2LX4fqgHdm8vpOTL7xx5sXIcB8lp7Etu3aQcWgjxUZzA48nA7HMuajQn6BDcGiyeubexna
 d0wxDBKMmzH19xQAVM6vB8BVBMKSLXqPYuX00KjnglbynIzTCK27eE6DfE+JTLuG9xwn770wq41
 B5rQnN3y6F+Au6l+4zlVEEpmwYK1fAC1QWssgNnrQlb4bzg8mXeZwHY1EN652A+FH+0m8j3+ijh
 jsQE72tL+9MUzh1657OO/85wtvpPNEZ+L0zp9mgLudATL6kiGRIp4EJ9SfXd457HDc6cFyDPLwR
 2hKHKiGWeH8sUS3u5hgScFH3Vh8ltg==
X-Authority-Analysis: v=2.4 cv=M+xA6iws c=1 sm=1 tr=0 ts=68ec9191 cx=c_pps
 a=bI4C2FY7jnHyvFZ3dxthkg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=Q4-j1AaZAAAA:8 a=g8kpj7RRAAAA:8
 a=lekKIaO-AAAA:8 a=xYs9qb22AAAA:8 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=NfBXs2BjxGWoWCvuvQkA:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PAMyYzrA6HsrdgpRdlYA:9 a=CLVzJb_M1jBxypOA:21
 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=v5Yk9Oe5dfkXNfcFWQjz:22
 a=qrSiWULKMlJISJ36kZk6:22 a=6yXVcWBlFjK_M4UFds7R:22 a=ul9cdbp4aOFLsgKbc677:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510130027
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 05:43:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224756

--------------gP6gKNUcaTGI70tLzEcB5uvZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 59D4nttG1261366


On 08-10-2025 03:00, Khem Raj wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
>
> On Mon, Oct 6, 2025 at 11:33=E2=80=AFPM Varatharajan, Deepesh via=20
> lists.openembedded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!cYINbaVVx5doNELC4AM-uQOTakPE0amyjf39rdX092vchrK7PwEvrdBsN8WQ2GTmNJjyn=
7cyiSKYNBYZ_Ys6BXTvJUk$>=20
> <deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>
>     From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
>     git log --oneline
>     b027d5b145f1b2908f370bdb96dfe40180d0fcb6..765534258e7f2c33719e3a5bc=
13432552991513b
>
>     765534258e (HEAD, origin/release/2.39/master) nss: Group merge
>     does not react to ERANGE during merge (bug 33361)
>     7ce7b4b2f4 Rename new tst-sem17 test to tst-sem18
>     a6ac06abeb Avoid uninitialized result in sem_open when file does
>     not exist
>     ff6ce67220 elf: handle addition overflow in
>     _dl_find_object_update_1 [BZ #32245]
>     fffc2df8a3 Optimize __libc_tsd_* thread variable access
>     83340b35cc i386: Add GLIBC_ABI_GNU_TLS version [BZ #33221]
>     5541edb1bd i386: Also add GLIBC_ABI_GNU2_TLS version [BZ #33129]
>     1f17635507 debug: Fix tst-longjmp_chk3 build failure on Hurd
>     3b6c8ea878 debug: Wire up tst-longjmp_chk3
>     89596f46e3 i386: Update ___tls_get_addr to preserve vector register=
s
>     4c2509882f elf: Preserve _rtld_global layout for the release branch
>     cf0e7d512d elf: Compile _dl_debug_state separately (bug 33224)
>     5cd1f4b1a1 elf: Restore support for _r_debug interpositions and
>     copy relocations
>     97017da5ef elf: Introduce _dl_debug_change_state
>     5601ad79b7 elf: Introduce separate _r_debug_array variable
>     24c94ea84e elf: Test dlopen (NULL, RTLD_LAZY) from an ELF construct=
or
>     79d84b5da5 elf: Fix handling of symbol versions which hash to zero
>     (bug 29190)
>     5f5c411132 elf: Second ld.so
>     <https://urldefense.com/v3/__http://ld.so__;!!AjveYdw8EvQ!cYINbaVVx=
5doNELC4AM-uQOTakPE0amyjf39rdX092vchrK7PwEvrdBsN8WQ2GTmNJjyn7cyiSKYNBYZ_Y=
s6AdhHCTw$>
>     relocation only if libc.so
>     <https://urldefense.com/v3/__http://libc.so__;!!AjveYdw8EvQ!cYINbaV=
Vx5doNELC4AM-uQOTakPE0amyjf39rdX092vchrK7PwEvrdBsN8WQ2GTmNJjyn7cyiSKYNBYZ=
_Ys6wAplQN8$>
>     has been loaded
>     4c9b1877fd elf: Reorder audit events in dlcose to match _dl_fini
>     (bug 32066)
>     f407a14ff7 elf: Call la_objclose for proxy link maps in _dl_fini
>     (bug 32065)
>     e27601b385 elf: Signal la_objopen for the proxy link map in
>     dlmopen (bug 31985)
>     fef226255d elf: Add the endswith function to <endswith.h>
>     d21a217fa0 elf: Update DSO list, write audit log to
>     elf/tst-audit23.out
>     4f145bb35d elf: Switch to main malloc after final ld.so
>     <https://urldefense.com/v3/__http://ld.so__;!!AjveYdw8EvQ!cYINbaVVx=
5doNELC4AM-uQOTakPE0amyjf39rdX092vchrK7PwEvrdBsN8WQ2GTmNJjyn7cyiSKYNBYZ_Y=
s6AdhHCTw$>
>     self-relocation
>     65d86471ce elf: Introduce _dl_relocate_object_no_relro
>     5434cc2c41 elf: Do not define consider_profiling, consider_symbind
>     as macros
>     b2d8c6cbe7 elf: rtld_multiple_ref is always true
>     2b89de7c91 Revert "elf: Run constructors on cyclic recursive
>     dlopen (bug 31986)"
>     46e3ecad27 elf: Fix map_complete Systemtap probe in dl_open_worker
>     5f225025db elf: Signal RT_CONSISTENT after relocation processing
>     in dlopen (bug 31986)
>     d6cc325fcf elf: Signal LA_ACT_CONSISTENT to auditors after
>     RT_CONSISTENT switch
>     6917fde6f9 elf: Run constructors on cyclic recursive dlopen (bug
>     31986)
>     9fa7cc6a0b ldconfig: Move endswithn into a new header file
>     269e89bd8d x86-64: Add GLIBC_ABI_DT_X86_64_PLT [BZ #33212]
>     62ff85fd09 x86-64: Add GLIBC_ABI_GNU2_TLS version [BZ #33129]
>     f0e8d04eef libio: Test for fdopen memory leak without SEEK_END
>     support (bug 31840)
>     42a8cb7560 Remove memory leak in fdopen (bug 31840)
>     d1c1f78e9e math: Remove no-mathvec flag
>     20d2d69a2f Use TLS initial-exec model for __libc_tsd_CTYPE_*
>     thread variables [BZ #33234]
>     c11950503f ctype: Fallback initialization of TLS using relocations
>     (bug 19341, bug 32483)
>     25c537c3b3 Use proper extern declaration for
>     _nl_C_LC_CTYPE_{class,toupper,tolower}
>     fbdf9680cc Remove <libc-tsd.h>
>     fca5937510 ctype: Reformat Makefile.
>     49f0e73fa3 elf: Handle ld.so
>     <https://urldefense.com/v3/__http://ld.so__;!!AjveYdw8EvQ!cYINbaVVx=
5doNELC4AM-uQOTakPE0amyjf39rdX092vchrK7PwEvrdBsN8WQ2GTmNJjyn7cyiSKYNBYZ_Y=
s6AdhHCTw$>
>     with LOAD segment gaps in _dl_find_object (bug 31943)
>     64488b4b31 elf: Extract rtld_setup_phdr function from dl_main
>     9833fcf7ce elf: Do not add a copy of _dl_find_object to libc.so
>     <https://urldefense.com/v3/__http://libc.so__;!!AjveYdw8EvQ!cYINbaV=
Vx5doNELC4AM-uQOTakPE0amyjf39rdX092vchrK7PwEvrdBsN8WQ2GTmNJjyn7cyiSKYNBYZ=
_Ys6wAplQN8$>
>     fbade65338 arm: Use _dl_find_object on __gnu_Unwind_Find_exidx (BZ
>     31405)
>     392e6cf1e8 AArch64: Improve codegen in SVE log1p
>     3a78a276a3 AArch64: Optimize inverse trig functions
>     b6ea8902a7 AArch64: Avoid memset ifunc in cpu-features.c [BZ #33112=
]
>
>     Testing Results:
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Before=C2=A0 =C2=A0 =C2=A0=
After=C2=A0 =C2=A0 Diff
>     PASS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A05080=C2=A0 =C2=A0 =C2=A0 5096=
=C2=A0 =C2=A0 =C2=A0 +16
>     XPASS=C2=A0 =C2=A0 =C2=A0 =C2=A0 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0
>     FAIL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0119=C2=A0 =C2=A0 =C2=A0 =C2=A0=
123=C2=A0 =C2=A0 =C2=A0 =C2=A0+4
>     XFAIL=C2=A0 =C2=A0 =C2=A0 =C2=A0 16=C2=A0 =C2=A0 =C2=A0 =C2=A0 16=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00
>     UNSUPPORTED=C2=A0 154=C2=A0 =C2=A0 =C2=A0 =C2=A0154=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0
>
>     Testcases changes
>
>     testcase-name =C2=A0 before=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
after
>
>     debug/tst-longjmp_chk3(new) =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS
>     elf/check-dt-x86-64-plt(new) =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS
>     elf/check-gnu2-tls(new) =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0PASS
>     lf/tst-dlmopen4-nonpic(new) =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS
>     elf/tst-dlmopen4-pic(new) =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS
>     elf/tst-dlopen-auditdup(new) =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS
>     elf/tst-dlopen-constructor-null(new) =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS
>     elf/tst-link-map-contiguous-ldso(new) =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS
>     elf/tst-link-map-contiguous-libc(new) =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS
>     elf/tst-nolink-libc-1(new) =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS
>     elf/tst-nolink-libc-2(new) =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS
>     elf/tst-rtld-no-malloc(new) =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS
>     elf/tst-rtld-no-malloc-audit(new) =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS
>     elf/tst-rtld-no-malloc-preload(new) =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS
>     elf/tst-tls23(new) =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS
>     elf/tst-version-hash-zero(new) =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS
>     libio/tst-fdopen-seek-failure(new) =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS
>     libio/tst-fdopen-seek-failure-mem(new) =C2=A0 =C2=A0 =C2=A0-=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS
>     nptl/tst-sem18(new) =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0PASS
>     ctype/tst-ctype-tls-dlmopen(new) =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FAIL
>     ctype/tst-ctype-tls-dlopen-static(new) =C2=A0 =C2=A0 =C2=A0-=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FAIL
>     stdio-common/tst-scanf-bz27650 =C2=A0 =C2=A0 FAIL=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS
>     malloc/tst-aligned-alloc-random-thread-cross-malloc-check =C2=A0 =C2=
=A0PASS=C2=A0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FAIL
>     malloc/tst-aligned-alloc-random-thread-malloc-check =C2=A0 =C2=A0PA=
SS=C2=A0 =C2=A0 =C2=A0 =C2=A0
>     =C2=A0 =C2=A0 =C2=A0FAIL
>
>
> While new passes are good the above two are regressions. So it will be=20
> good to quantify them a bit
The test failures seem to be intermittent. At the moment, I don't have=20
the logs from the earlier failures,
but I reran the tests a couple of times and they passed consistently.=20
Going forward, I'll keep an eye on
any regressions. Shall I go ahead and send V2 with the updated commit=20
message?
>
>
>     timezone/tst-tzset =C2=A0 =C2=A0 PASS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0FAIL
>     elf/ifuncmain8 =C2=A0 =C2=A0 PASS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 -
>
>     Signed-off-by: Deepesh Varatharajan
>     <Deepesh.Varatharajan@windriver.com>
>     ---
>     =C2=A0meta/recipes-core/glibc/glibc-version.inc
>     <https://urldefense.com/v3/__http://glibc-version.inc__;!!AjveYdw8E=
vQ!cYINbaVVx5doNELC4AM-uQOTakPE0amyjf39rdX092vchrK7PwEvrdBsN8WQ2GTmNJjyn7=
cyiSKYNBYZ_Ys6schzlBo$>
>     | 4 ++--
>     =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>
>     diff --git a/meta/recipes-core/glibc/glibc-version.inc
>     <https://urldefense.com/v3/__http://glibc-version.inc__;!!AjveYdw8E=
vQ!cYINbaVVx5doNELC4AM-uQOTakPE0amyjf39rdX092vchrK7PwEvrdBsN8WQ2GTmNJjyn7=
cyiSKYNBYZ_Ys6schzlBo$>
>     b/meta/recipes-core/glibc/glibc-version.inc
>     <https://urldefense.com/v3/__http://glibc-version.inc__;!!AjveYdw8E=
vQ!cYINbaVVx5doNELC4AM-uQOTakPE0amyjf39rdX092vchrK7PwEvrdBsN8WQ2GTmNJjyn7=
cyiSKYNBYZ_Ys6schzlBo$>
>     index 89e532fd67..f63eb0ad56 100644
>     --- a/meta/recipes-core/glibc/glibc-version.inc
>     <https://urldefense.com/v3/__http://glibc-version.inc__;!!AjveYdw8E=
vQ!cYINbaVVx5doNELC4AM-uQOTakPE0amyjf39rdX092vchrK7PwEvrdBsN8WQ2GTmNJjyn7=
cyiSKYNBYZ_Ys6schzlBo$>
>     +++ b/meta/recipes-core/glibc/glibc-version.inc
>     <https://urldefense.com/v3/__http://glibc-version.inc__;!!AjveYdw8E=
vQ!cYINbaVVx5doNELC4AM-uQOTakPE0amyjf39rdX092vchrK7PwEvrdBsN8WQ2GTmNJjyn7=
cyiSKYNBYZ_Ys6schzlBo$>
>     @@ -1,7 +1,7 @@
>     =C2=A0SRCBRANCH ?=3D "release/2.39/master"
>     =C2=A0PV =3D "2.39+git"
>     -SRCREV_glibc ?=3D "b027d5b145f1b2908f370bdb96dfe40180d0fcb6"
>     -SRCREV_localedef ?=3D "fab74f31b3811df543e24b6de47efdf45b538abc"
>     +SRCREV_glibc ?=3D "765534258e7f2c33719e3a5bc13432552991513b"
>     +SRCREV_localedef ?=3D "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
>
>     =C2=A0GLIBC_GIT_URI ?=3D
>     "git://sourceware.org/git/glibc.git;protocol=3Dhttps
>     <https://urldefense.com/v3/__http://sourceware.org/git/glibc.git;pr=
otocol=3Dhttps__;!!AjveYdw8EvQ!cYINbaVVx5doNELC4AM-uQOTakPE0amyjf39rdX092=
vchrK7PwEvrdBsN8WQ2GTmNJjyn7cyiSKYNBYZ_Ys6h4hHRn0$>"
>
>     --=20
>     2.49.0
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#224512):
>     https://lists.openembedded.org/g/openembedded-core/message/224512
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/224512__;!!AjveYdw8EvQ!cYINbaVVx5doNELC4AM-uQOTakPE0=
amyjf39rdX092vchrK7PwEvrdBsN8WQ2GTmNJjyn7cyiSKYNBYZ_Ys6k3sTiAY$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/115632145/1997914
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1156=
32145/1997914__;!!AjveYdw8EvQ!cYINbaVVx5doNELC4AM-uQOTakPE0amyjf39rdX092v=
chrK7PwEvrdBsN8WQ2GTmNJjyn7cyiSKYNBYZ_Ys60aoY-IE$>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/unsub__;!!AjveYdw8EvQ!cYINbaVVx5doNELC4AM-uQOTakPE0amyjf39rd=
X092vchrK7PwEvrdBsN8WQ2GTmNJjyn7cyiSKYNBYZ_Ys68ykMG-s$>
>     [raj.khem@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------gP6gKNUcaTGI70tLzEcB5uvZ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 59D4nttG1261366

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 08-10-2025 03:00, Khem Raj wrote:<b=
r>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1srf+8nF9rvQ058VpzeFU4zPMe=
4b88jYCT3QqrW=3DD_nkYw@mail.gmail.com">
     =20
      <strong>
      </strong>
      <div style=3D"border:solid #9c6500 1pt;padding:2pt;background:#fcfc=
03"><strong><class=3D"msonormal" style=3D"line-height:11pt"><span style=3D=
"font-size:11pt;color:#000">CAUTION: This email
              comes from a non Wind River email account!</span></class=3D=
"msonormal"></strong><br>
        <class=3D"msonormal" style=3D"line-height:10pt3"><span style=3D"f=
ont-size:10pt;color:#000">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class=3D"msonormal"></div>
      <div>
        <div><br>
        </div>
        <div><br>
          <div class=3D"gmail_quote gmail_quote_container">
            <div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 6, 2025 at
              11:33=E2=80=AFPM Varatharajan, Deepesh via
              <a href=3D"https://urldefense.com/v3/__http://lists.openemb=
edded.org__;!!AjveYdw8EvQ!cYINbaVVx5doNELC4AM-uQOTakPE0amyjf39rdX092vchrK=
7PwEvrdBsN8WQ2GTmNJjyn7cyiSKYNBYZ_Ys6BXTvJUk$" moz-do-not-send=3D"true">
                lists.openembedded.org</a> &lt;deepesh.varatharajan=3D<a =
href=3D"mailto:windriver.com@lists.openembedded.org" moz-do-not-send=3D"t=
rue" class=3D"moz-txt-link-freetext">windriver.com@lists.openembedded.org=
</a>&gt;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
              From: Deepesh Varatharajan &lt;<a href=3D"mailto:Deepesh.Va=
ratharajan@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" clas=
s=3D"moz-txt-link-freetext">Deepesh.Varatharajan@windriver.com</a>&gt;<br=
>
              <br>
              git log --oneline
b027d5b145f1b2908f370bdb96dfe40180d0fcb6..765534258e7f2c33719e3a5bc134325=
52991513b<br>
              <br>
              765534258e (HEAD, origin/release/2.39/master) nss: Group
              merge does not react to ERANGE during merge (bug 33361)<br>
              7ce7b4b2f4 Rename new tst-sem17 test to tst-sem18<br>
              a6ac06abeb Avoid uninitialized result in sem_open when
              file does not exist<br>
              ff6ce67220 elf: handle addition overflow in
              _dl_find_object_update_1 [BZ #32245]<br>
              fffc2df8a3 Optimize __libc_tsd_* thread variable access<br>
              83340b35cc i386: Add GLIBC_ABI_GNU_TLS version [BZ #33221]<=
br>
              5541edb1bd i386: Also add GLIBC_ABI_GNU2_TLS version [BZ
              #33129]<br>
              1f17635507 debug: Fix tst-longjmp_chk3 build failure on
              Hurd<br>
              3b6c8ea878 debug: Wire up tst-longjmp_chk3<br>
              89596f46e3 i386: Update ___tls_get_addr to preserve vector
              registers<br>
              4c2509882f elf: Preserve _rtld_global layout for the
              release branch<br>
              cf0e7d512d elf: Compile _dl_debug_state separately (bug
              33224)<br>
              5cd1f4b1a1 elf: Restore support for _r_debug
              interpositions and copy relocations<br>
              97017da5ef elf: Introduce _dl_debug_change_state<br>
              5601ad79b7 elf: Introduce separate _r_debug_array variable<=
br>
              24c94ea84e elf: Test dlopen (NULL, RTLD_LAZY) from an ELF
              constructor<br>
              79d84b5da5 elf: Fix handling of symbol versions which hash
              to zero (bug 29190)<br>
              5f5c411132 elf: Second <a href=3D"https://urldefense.com/v3=
/__http://ld.so__;!!AjveYdw8EvQ!cYINbaVVx5doNELC4AM-uQOTakPE0amyjf39rdX09=
2vchrK7PwEvrdBsN8WQ2GTmNJjyn7cyiSKYNBYZ_Ys6AdhHCTw$" moz-do-not-send=3D"t=
rue">
                ld.so</a> relocation only if <a href=3D"https://urldefens=
e.com/v3/__http://libc.so__;!!AjveYdw8EvQ!cYINbaVVx5doNELC4AM-uQOTakPE0am=
yjf39rdX092vchrK7PwEvrdBsN8WQ2GTmNJjyn7cyiSKYNBYZ_Ys6wAplQN8$" moz-do-not=
-send=3D"true">
                libc.so</a> has been loaded<br>
              4c9b1877fd elf: Reorder audit events in dlcose to match
              _dl_fini (bug 32066)<br>
              f407a14ff7 elf: Call la_objclose for proxy link maps in
              _dl_fini (bug 32065)<br>
              e27601b385 elf: Signal la_objopen for the proxy link map
              in dlmopen (bug 31985)<br>
              fef226255d elf: Add the endswith function to
              &lt;endswith.h&gt;<br>
              d21a217fa0 elf: Update DSO list, write audit log to
              elf/tst-audit23.out<br>
              4f145bb35d elf: Switch to main malloc after final <a href=3D=
"https://urldefense.com/v3/__http://ld.so__;!!AjveYdw8EvQ!cYINbaVVx5doNEL=
C4AM-uQOTakPE0amyjf39rdX092vchrK7PwEvrdBsN8WQ2GTmNJjyn7cyiSKYNBYZ_Ys6AdhH=
CTw$" moz-do-not-send=3D"true">
                ld.so</a> self-relocation<br>
              65d86471ce elf: Introduce _dl_relocate_object_no_relro<br>
              5434cc2c41 elf: Do not define consider_profiling,
              consider_symbind as macros<br>
              b2d8c6cbe7 elf: rtld_multiple_ref is always true<br>
              2b89de7c91 Revert &quot;elf: Run constructors on cyclic
              recursive dlopen (bug 31986)&quot;<br>
              46e3ecad27 elf: Fix map_complete Systemtap probe in
              dl_open_worker<br>
              5f225025db elf: Signal RT_CONSISTENT after relocation
              processing in dlopen (bug 31986)<br>
              d6cc325fcf elf: Signal LA_ACT_CONSISTENT to auditors after
              RT_CONSISTENT switch<br>
              6917fde6f9 elf: Run constructors on cyclic recursive
              dlopen (bug 31986)<br>
              9fa7cc6a0b ldconfig: Move endswithn into a new header file<=
br>
              269e89bd8d x86-64: Add GLIBC_ABI_DT_X86_64_PLT [BZ #33212]<=
br>
              62ff85fd09 x86-64: Add GLIBC_ABI_GNU2_TLS version [BZ
              #33129]<br>
              f0e8d04eef libio: Test for fdopen memory leak without
              SEEK_END support (bug 31840)<br>
              42a8cb7560 Remove memory leak in fdopen (bug 31840)<br>
              d1c1f78e9e math: Remove no-mathvec flag<br>
              20d2d69a2f Use TLS initial-exec model for
              __libc_tsd_CTYPE_* thread variables [BZ #33234]<br>
              c11950503f ctype: Fallback initialization of TLS using
              relocations (bug 19341, bug 32483)<br>
              25c537c3b3 Use proper extern declaration for
              _nl_C_LC_CTYPE_{class,toupper,tolower}<br>
              fbdf9680cc Remove &lt;libc-tsd.h&gt;<br>
              fca5937510 ctype: Reformat Makefile.<br>
              49f0e73fa3 elf: Handle <a href=3D"https://urldefense.com/v3=
/__http://ld.so__;!!AjveYdw8EvQ!cYINbaVVx5doNELC4AM-uQOTakPE0amyjf39rdX09=
2vchrK7PwEvrdBsN8WQ2GTmNJjyn7cyiSKYNBYZ_Ys6AdhHCTw$" moz-do-not-send=3D"t=
rue">
                ld.so</a> with LOAD segment gaps in _dl_find_object (bug
              31943)<br>
              64488b4b31 elf: Extract rtld_setup_phdr function from
              dl_main<br>
              9833fcf7ce elf: Do not add a copy of _dl_find_object to <a =
href=3D"https://urldefense.com/v3/__http://libc.so__;!!AjveYdw8EvQ!cYINba=
VVx5doNELC4AM-uQOTakPE0amyjf39rdX092vchrK7PwEvrdBsN8WQ2GTmNJjyn7cyiSKYNBY=
Z_Ys6wAplQN8$" moz-do-not-send=3D"true">
                libc.so</a><br>
              fbade65338 arm: Use _dl_find_object on
              __gnu_Unwind_Find_exidx (BZ 31405)<br>
              392e6cf1e8 AArch64: Improve codegen in SVE log1p<br>
              3a78a276a3 AArch64: Optimize inverse trig functions<br>
              b6ea8902a7 AArch64: Avoid memset ifunc in cpu-features.c
              [BZ #33112]<br>
              <br>
              Testing Results:<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Before&nbsp; &nbs=
p; &nbsp;After&nbsp; &nbsp; Diff<br>
              PASS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;5080&nbsp; &nbsp; &nb=
sp; 5096&nbsp; &nbsp; &nbsp; +16<br>
              XPASS&nbsp; &nbsp; &nbsp; &nbsp; 4&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;4&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0<br>
              FAIL&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;119&nbsp; &nbsp; &nbs=
p; &nbsp;123&nbsp; &nbsp; &nbsp; &nbsp;+4<br>
              XFAIL&nbsp; &nbsp; &nbsp; &nbsp; 16&nbsp; &nbsp; &nbsp; &nb=
sp; 16&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0<br>
              UNSUPPORTED&nbsp; 154&nbsp; &nbsp; &nbsp; &nbsp;154&nbsp; &=
nbsp; &nbsp; &nbsp; 0<br>
              <br>
              Testcases changes<br>
              <br>
              testcase-name&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; before&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;after=
<br>
              <br>
              debug/tst-longjmp_chk3(new)&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;
              &nbsp; &nbsp; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;PASS<br>
              elf/check-dt-x86-64-plt(new)&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; &nbsp;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;PASS<br>
              elf/check-gnu2-tls(new)&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;
              &nbsp; &nbsp; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;PASS<br>
              lf/tst-dlmopen4-nonpic(new)&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;
              &nbsp; &nbsp; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;PASS<br>
              elf/tst-dlmopen4-pic(new)&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;
              &nbsp; &nbsp; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;PASS<br>
              elf/tst-dlopen-auditdup(new)&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; &nbsp;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;PASS<br>
              elf/tst-dlopen-constructor-null(new)&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; &nbsp;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;PASS<br>
              elf/tst-link-map-contiguous-ldso(new)&nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;PASS<br>
              elf/tst-link-map-contiguous-libc(new)&nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;PASS<br>
              elf/tst-nolink-libc-1(new)&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;
              &nbsp; &nbsp; &nbsp;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;PASS<br>
              elf/tst-nolink-libc-2(new)&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;
              &nbsp; &nbsp; &nbsp;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;PASS<br>
              elf/tst-rtld-no-malloc(new)&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;
              &nbsp; &nbsp; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;PASS<br>
              elf/tst-rtld-no-malloc-audit(new)&nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;PASS<br>
              elf/tst-rtld-no-malloc-preload(new)&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;PASS<br>
              elf/tst-tls23(new)&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; &nbsp;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;PASS<br>
              elf/tst-version-hash-zero(new)&nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; &nbsp;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;PASS<br>
              libio/tst-fdopen-seek-failure(new)&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; &nbsp;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;PASS<br>
              libio/tst-fdopen-seek-failure-mem(new)&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; &nbsp;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;PASS<br>
              nptl/tst-sem18(new)&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;PASS<br>
              ctype/tst-ctype-tls-dlmopen(new)&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; &nbsp;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;FAIL<br>
              ctype/tst-ctype-tls-dlopen-static(new)&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; &nbsp;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;FAIL<br>
              stdio-common/tst-scanf-bz27650&nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; FAIL&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;PASS<br>
              malloc/tst-aligned-alloc-random-thread-cross-malloc-check&n=
bsp;
              &nbsp; &nbsp;PASS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;FAIL<br>
              malloc/tst-aligned-alloc-random-thread-malloc-check&nbsp; &=
nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp;PASS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;FAIL</blockquote>
            <div dir=3D"auto"><br>
            </div>
            <div dir=3D"auto">While new passes are good the above two are
              regressions. So it will be good to quantify them a bit&nbsp=
;</div>
          </div>
        </div>
      </div>
    </blockquote>
    The test failures seem to be intermittent. At the moment, I don't
    have the logs from the earlier failures,<br>
    but I reran the tests a couple of times and they passed
    consistently. Going forward, I'll keep an eye on&nbsp;<br>
    any regressions. Shall I go ahead and send V2 with the updated
    commit message?
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1srf+8nF9rvQ058VpzeFU4zPMe=
4b88jYCT3QqrW=3DD_nkYw@mail.gmail.com">
      <div>
        <div>
          <div class=3D"gmail_quote gmail_quote_container">
            <div dir=3D"auto"><br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto">
              <br>
              timezone/tst-tzset&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; PASS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;FAIL<br>
              elf/ifuncmain8&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; PASS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; -<br>
              <br>
              Signed-off-by: Deepesh Varatharajan &lt;<a href=3D"mailto:D=
eepesh.Varatharajan@windriver.com" target=3D"_blank" moz-do-not-send=3D"t=
rue" class=3D"moz-txt-link-freetext">Deepesh.Varatharajan@windriver.com</=
a>&gt;<br>
              ---<br>
              &nbsp;meta/recipes-core/glibc/<a href=3D"https://urldefense=
.com/v3/__http://glibc-version.inc__;!!AjveYdw8EvQ!cYINbaVVx5doNELC4AM-uQ=
OTakPE0amyjf39rdX092vchrK7PwEvrdBsN8WQ2GTmNJjyn7cyiSKYNBYZ_Ys6schzlBo$" m=
oz-do-not-send=3D"true">glibc-version.inc</a> | 4 ++--<br>
              &nbsp;1 file changed, 2 insertions(+), 2 deletions(-)<br>
              <br>
              diff --git a/meta/recipes-core/glibc/<a href=3D"https://url=
defense.com/v3/__http://glibc-version.inc__;!!AjveYdw8EvQ!cYINbaVVx5doNEL=
C4AM-uQOTakPE0amyjf39rdX092vchrK7PwEvrdBsN8WQ2GTmNJjyn7cyiSKYNBYZ_Ys6schz=
lBo$" moz-do-not-send=3D"true">glibc-version.inc</a>
              b/meta/recipes-core/glibc/<a href=3D"https://urldefense.com=
/v3/__http://glibc-version.inc__;!!AjveYdw8EvQ!cYINbaVVx5doNELC4AM-uQOTak=
PE0amyjf39rdX092vchrK7PwEvrdBsN8WQ2GTmNJjyn7cyiSKYNBYZ_Ys6schzlBo$" moz-d=
o-not-send=3D"true">glibc-version.inc</a><br>
              index 89e532fd67..f63eb0ad56 100644<br>
              --- a/meta/recipes-core/glibc/<a href=3D"https://urldefense=
.com/v3/__http://glibc-version.inc__;!!AjveYdw8EvQ!cYINbaVVx5doNELC4AM-uQ=
OTakPE0amyjf39rdX092vchrK7PwEvrdBsN8WQ2GTmNJjyn7cyiSKYNBYZ_Ys6schzlBo$" m=
oz-do-not-send=3D"true">glibc-version.inc</a><br>
              +++ b/meta/recipes-core/glibc/<a href=3D"https://urldefense=
.com/v3/__http://glibc-version.inc__;!!AjveYdw8EvQ!cYINbaVVx5doNELC4AM-uQ=
OTakPE0amyjf39rdX092vchrK7PwEvrdBsN8WQ2GTmNJjyn7cyiSKYNBYZ_Ys6schzlBo$" m=
oz-do-not-send=3D"true">glibc-version.inc</a><br>
              @@ -1,7 +1,7 @@<br>
              &nbsp;SRCBRANCH ?=3D &quot;release/2.39/master&quot;<br>
              &nbsp;PV =3D &quot;2.39+git&quot;<br>
              -SRCREV_glibc ?=3D
              &quot;b027d5b145f1b2908f370bdb96dfe40180d0fcb6&quot;<br>
              -SRCREV_localedef ?=3D
              &quot;fab74f31b3811df543e24b6de47efdf45b538abc&quot;<br>
              +SRCREV_glibc ?=3D
              &quot;765534258e7f2c33719e3a5bc13432552991513b&quot;<br>
              +SRCREV_localedef ?=3D
              &quot;cba02c503d7c853a38ccfb83c57e343ca5ecd7e5&quot;<br>
              <br>
              &nbsp;GLIBC_GIT_URI ?=3D &quot;git://<a href=3D"https://url=
defense.com/v3/__http://sourceware.org/git/glibc.git;protocol=3Dhttps__;!=
!AjveYdw8EvQ!cYINbaVVx5doNELC4AM-uQOTakPE0amyjf39rdX092vchrK7PwEvrdBsN8WQ=
2GTmNJjyn7cyiSKYNBYZ_Ys6h4hHRn0$" rel=3D"noreferrer" target=3D"_blank" mo=
z-do-not-send=3D"true">sourceware.org/git/glibc.git;protocol=3Dhttps</a>&=
quot;<br>
              <br>
              -- <br>
              2.49.0<br>
              <br>
              <br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              Links: You receive all messages sent to this group.<br>
              View/Reply Online (#224512): <a href=3D"https://urldefense.=
com/v3/__https://lists.openembedded.org/g/openembedded-core/message/22451=
2__;!!AjveYdw8EvQ!cYINbaVVx5doNELC4AM-uQOTakPE0amyjf39rdX092vchrK7PwEvrdB=
sN8WQ2GTmNJjyn7cyiSKYNBYZ_Ys6k3sTiAY$" rel=3D"noreferrer" target=3D"_blan=
k" moz-do-not-send=3D"true">
https://lists.openembedded.org/g/openembedded-core/message/224512</a><br>
              Mute This Topic: <a href=3D"https://urldefense.com/v3/__htt=
ps://lists.openembedded.org/mt/115632145/1997914__;!!AjveYdw8EvQ!cYINbaVV=
x5doNELC4AM-uQOTakPE0amyjf39rdX092vchrK7PwEvrdBsN8WQ2GTmNJjyn7cyiSKYNBYZ_=
Ys60aoY-IE$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true=
">
                https://lists.openembedded.org/mt/115632145/1997914</a><b=
r>
              Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@li=
sts.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">
                openembedded-core+owner@lists.openembedded.org</a><br>
              Unsubscribe: <a href=3D"https://urldefense.com/v3/__https:/=
/lists.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!cYINbaV=
Vx5doNELC4AM-uQOTakPE0amyjf39rdX092vchrK7PwEvrdBsN8WQ2GTmNJjyn7cyiSKYNBYZ=
_Ys68ykMG-s$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tru=
e">
                https://lists.openembedded.org/g/openembedded-core/unsub<=
/a>
              [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" mo=
z-do-not-send=3D"true" class=3D"moz-txt-link-freetext">raj.khem@gmail.com=
</a>]<br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              <br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------gP6gKNUcaTGI70tLzEcB5uvZ--

