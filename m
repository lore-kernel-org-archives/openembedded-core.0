Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B68EC369AB
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 01:25:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1962.1745544342195612252
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 18:25:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6210384862=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P0ZlNV008843
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 18:25:41 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jhd34w9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 18:25:41 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53P1PeEj015002;
	Thu, 24 Apr 2025 18:25:40 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jhd34w8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 18:25:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xooDlaimktxt8TjO5MhYSnDLRQcmeaumDays2M/aCdLdKzcjv8V3EOENOkePP5FF9jP14Ojy81y/G3iBeq3W9zc0Vvp0n09qcIjkOYfrfs8b/c5eD7hjaNdrz3a26Gfy7ExZyR4ghM3NUVp0ip4wNPWpA8Vlgoo8IoQmotrRWB+3SLfwm9dSxrAlqwA8rMOU+YLGa8efA/JWHvQd++CvES7aHPu4tOXg4V/mUVeTiZZ8K07NGntMIk918HoeoG+H9E7dzyMU1xf8r8VWlhQ76jR3xPa18/H0syrOwYgewNr9uj95HUO2jNc4DzMLPcY4AmOjRtxJbqZOw6fxTFr4Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRL1WzzXpi3a4xOWizWVAcWwagYHxtPRDTEf+2IqyDc=;
 b=kaXaHLoYethz4ETSXXM5wGdplsdQ85Ukm7FvB1If2FD4VvzgSnUD95fwHw05IxqSIWHGzHS5BDpb8O6K7a34feFoAWyYApHup2+siXwWUuzM2peR6dwKn8mO74GbEUKJJwvPQpYXDc/8Wv79rdnEJNMe9jZyOOx//LtEvYHZDCcn6QvrqcQPIN+hXfKlJyrfor+ydwvPxUWcfrr4EJTYXxaEVzpPy2OWegDOU65REdqwLQ0g6IItMMuVF/73FbRHZcheumnPoiyPbTpIu1pbct7gkY6txqVRidiZfU5YlOGnRSTZnwnFTR1tHH3DjqaWgtsNwNb/mWqZDTz+aXfSiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by CYXPR11MB8691.namprd11.prod.outlook.com (2603:10b6:930:d5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Fri, 25 Apr
 2025 01:25:36 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%3]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 01:25:35 +0000
Content-Type: multipart/alternative;
 boundary="------------5gdHY7J0Kqvh0S0ThFLuXAcg"
Message-ID: <947fa28b-20a1-4367-84b2-a2332381064a@windriver.com>
Date: Fri, 25 Apr 2025 09:25:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V3] icu: set ac_cv_path_install to install under
 hosttools
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20250422130702.1337476-1-changqing.li@windriver.com>
 <d76232c249fa6af70c2539d14e733825bc6f1dc8.camel@linuxfoundation.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <d76232c249fa6af70c2539d14e733825bc6f1dc8.camel@linuxfoundation.org>
X-ClientProxiedBy: TYCPR01CA0076.jpnprd01.prod.outlook.com
 (2603:1096:405:3::16) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|CYXPR11MB8691:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b46f545-e611-46a4-ff22-08dd839813e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bUY3YW1IQXpVL0ViRm1POG5zRXU2Z3VCd0ZXVnRRd2wwSEpEVHpKbFJrN1Zx?=
 =?utf-8?B?MDBPWEFBTjlqajNlWG9PbG11Y0Zzb0RvaFkvZTdPQU1YN0NsMlRMWHQxTWxh?=
 =?utf-8?B?d1llUmpQNTl0cm1ISmJmb1B4ckVKRkRYNDRZaEpWTlJ5QXBIS3NobWlpMFVY?=
 =?utf-8?B?TUpyd0RFeHgyb0hXR01nbjN1NitTTHdYdFdOS3FMNGQ2NklHcWJLR0wrdkR6?=
 =?utf-8?B?TlJ4amF2TXptVFc1YmptNS9DN2FGRU1zaVp0a05sVWtmYk50bk1QUUNaU3pK?=
 =?utf-8?B?Mk9WNktNZkp3elJiOWdIU0NuaUd2aVBWWGNOOFc0SFpYNGZWV3UyaDViVmpx?=
 =?utf-8?B?WU5nMExucE1EUU95RElRVXRCK2wzQUFKb3F4YUZqOEZpQkNoYUVRMVJTaml3?=
 =?utf-8?B?eXZhS3lPZlR2ZFlCWGNQUmIwbU56VnpDOWplY1J2SHplaXJWOStjcmNEb3VQ?=
 =?utf-8?B?emRiWjNTbGVyZWVOaVdrU2VxdlJUSEhvemVKWURTZ2pkanM1aTR1SkF6ZnBK?=
 =?utf-8?B?Q2VQd3hXUWUrQ1BSM0pwYmhIY3VVRGxGbng2dmJabzFDWG43N3BwZ0w2YnV5?=
 =?utf-8?B?bm4wSGpQV3lGbTN5aUIrVVRaQWFVNTY1aEp2bU5oOWYybDR3UjY5S0hpcjhi?=
 =?utf-8?B?OGxFdXZNSjNJbEJVV2xYWGpjRXdHV0l4RlFPTndSSDdtallhWWNXVmpjNlNu?=
 =?utf-8?B?RlZhNDQzUDlvblAyNmJhakd5ZDZLUXFrR2dybFlab1ZYbHF0a2tpbm9ZdHlQ?=
 =?utf-8?B?a0wzRFc2TE04WVRpZ1k3NnNqeUhTVmxTa0lNcEZONHJKemhoM0kwWUZtcERx?=
 =?utf-8?B?d1ZHYzlLTy85Z0FmUzVaVnJDa1QwaVlCOEY1SEZZb1FISWQ3UDRVelltSkpw?=
 =?utf-8?B?Sjkzd1ZhREdXdXNKRU42T3poVTNtTkIrbWt2N1lqZHVVNnhhYnVoZDNEN0VH?=
 =?utf-8?B?aUhzZzdnZG5POUwza2J3OFRnb0dYb3lud0drdDlmZlg0S0pyRzJHUDJmdmdi?=
 =?utf-8?B?dFl3VWl2RlQxek9IQis5S1BEZ0RVTnl2UUtBc1dOWXdJUnJVeC9DbGJ5Sm81?=
 =?utf-8?B?RXA1N096L3dhSUtsSHp0MkdVbjNRRmJrYnJCeFFYMy9yREoweTgvMUZYVFI2?=
 =?utf-8?B?NDVDUXhiNGYrOTNyT0xYc05BWTIzK3pJR0V0bHlNMTVIWVNhdzJTYkhkblRm?=
 =?utf-8?B?UTBVbkRoZHU1TjNFRGRFdGh1SXQ4UUswZkN5QU54cnNIdHlTdnVXZnFYL3F2?=
 =?utf-8?B?ZWlXQWVFVjZvOVQ3NUovc3c3ZzZSdEZwRkVyKzVHR0JQS3ExQjRLMEc5a0Zo?=
 =?utf-8?B?S3RmaXRES2FNRzU2aFNmZkFlOXBZZlNxeXlHckFVWURoOGRqR3lJZFc5T3ly?=
 =?utf-8?B?dWU5WDZsTHZ5TG5NN3Z6UFJseUdQOUFBaDFlMXh3UnlHTmJ2T0l0RTBnUkpU?=
 =?utf-8?B?bk00ZXRCQnJicTljZTlUbXBjZTZrMmxnY3ZPekczQjl5NFk4RDJ0d2c2T2c1?=
 =?utf-8?B?VjNiWWtxRFNpTXJuWEVEWW1BZGJPbmh1UlUvTlFqV2ZObGJmYThSOWFHeVRl?=
 =?utf-8?B?aEFhQjdCLzI2c0d3Z3ArbmhXNUtjU29Pd3k0RHpDdU8rUXBUcWZQaEI5aFEv?=
 =?utf-8?B?NzhVbThtTHN2YVg1czkzZDdkZlR0OU1CT3dnMnI5OHIvTjRiYkdvaGdnS1ZZ?=
 =?utf-8?B?TkhvSkVlRGFndFJOVElLZHQ1WWpBZTBPRkpjUUttem5xVVR4K3VlYk90UHhS?=
 =?utf-8?B?QndsMG1HY3NyNExHOTYzMVpJZUpGeU5USVMyS1phMndjR0RtMWJQRS9uZHZS?=
 =?utf-8?B?eDFtSzZlWEpSaVR0ZmxwODR6b1Q3R1JCVG1JYklCeGZRQWVGYngrQ25IQjQ4?=
 =?utf-8?B?czRsRmVnanM4YnVQSHh3L2crQXpHUE5zSDZvRnBmeGZrNEdSWk9PMFZJM1N6?=
 =?utf-8?Q?4YXnSsQxhME=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZGdwZTZZYzdwUWx3Q0FXU1FEekRrQ0NuaFdXclBlN1gyUzVjZkppMkUxd0Jz?=
 =?utf-8?B?NW50L1F5eEY0QjBxSWpmMEhwNTRwcWxtcG5YaktXU3JUUlFCa3NzL1djOS9X?=
 =?utf-8?B?anp4QmdPM1BhOFcyQVdNR3A2MnVEb0phb3QxbmNlT295YmlTeHZHekthNUhP?=
 =?utf-8?B?RXZmbElYRklUVVFOWWFtUis5SUtxSmdTSks1cFo3SFNnbzg1cGF2K1RrdFBU?=
 =?utf-8?B?cDQwalE1QjFGV0pjMUxQZnNDakgvTm9JRzMxTFVodDZLZnh0S0tzckZjQWMv?=
 =?utf-8?B?ZHlZVENTdEdUOHY5aWw1SkZFaGpoYVNnUFNsWHZycUNoc25MNk4rUXFPOXNB?=
 =?utf-8?B?Z0hDaHpUZ3FHeXA2ak1scGF6MHZLTE1MT0ZXTkQyanJQcXRSQXVYQkZyT0d6?=
 =?utf-8?B?eVhvck5aQnFoRElmTkZFZ2JxcTJweGJvOGNqYjhISzRuQzRwQ3Q0bmp6bURx?=
 =?utf-8?B?NVZDaWZQVktQZkRTbTcxSC9paVhZR240TFMvc0VzZGNXMWZvM3JvQXoybmZa?=
 =?utf-8?B?QmVtUHVFVjErZFd0TkZqQnVOUVFQdU1zK2taTzgrdHpMK0VTTHBpQmhiOUZL?=
 =?utf-8?B?WlNiMHZpQ3gvL0k2VXl4bU84Wnlrb1dINjR3dGhIdHV3SzBKNHN2eC9ka0l0?=
 =?utf-8?B?VEE4RnEwWGgvblg2czdLeEFGSUVvd3FFYk1DTXBYNFNJTC8rRG5vUXV3blh2?=
 =?utf-8?B?a20zcXBodittVlFNaGZURXVEY2tWaDRxazNvQkRxN1hteTExL0hyZjlvaUh6?=
 =?utf-8?B?N0RKK1VHUzE2Mk5zbHk4bDJ4OUhONHdOb0gvVndhQXZHV2FaTlNFdGQ4ek83?=
 =?utf-8?B?S0phQTRCVTVUVFZGNzdUcmowenZjTkl6UDBvY3o2WVIycG5Nd1Y1OUZRcEZH?=
 =?utf-8?B?ZktUMU4vb3RHNjg2UU1IQlNxZytnVEFmOFB5cWxhdXRIaEdIcldYUkJiT0dj?=
 =?utf-8?B?enl4Z2RzQVAvREJuM3NjYXgwMzBzalZBcGdxYU9rWXpWVlllT3pYL0tCRXhs?=
 =?utf-8?B?RnVQLy9GSzN0VE42dTBrT0xyUDF3NXdaaC9yREJWU1pYWGVIdjJTbkZQcUc5?=
 =?utf-8?B?NDJuTjRpODJTWDRQSEYwUVlUNlNjMFVDaXFxVUJwWTZSNE9BMWRGUFRDdHlj?=
 =?utf-8?B?aUNpWFhFUTQ2QVNrNmlTWXRSRVRHRkh6emZGR1ZHQ0s5TjFhTEQ5VGttaWhK?=
 =?utf-8?B?bmR1akVscy90bm9CWjdtN1NraGhNUFp1UGMwSTFOc0Z4MnVxSjZxc1IrMHFm?=
 =?utf-8?B?YU1iVWRQWkZyR1BMeDRsTjJvc3lucERaK1lqSGNMSDlCaDFWZVZyaUMwOUJO?=
 =?utf-8?B?VGRBV0N6cWVMcDJLWkxoUVJvakFaa3RhdG1VNTJGUVp0V0I4VDNsT2xWa1ZQ?=
 =?utf-8?B?VFcwMi9ydDNhSC9iOWIySFpCcy9OUFZXYjIxTDF6V0RvOUw3d0FUdEtrTDZu?=
 =?utf-8?B?Znl1UHp6ejZLTWtFR3BMMzFWQklsZUROL244YWl3WDl0UzgrRGhUT2w5bEUw?=
 =?utf-8?B?VGJTclZxNGJTTjRUZm1FZndnVmhXRmVIeXFIaXdiNmFYRXdXL3dSM2hUcloz?=
 =?utf-8?B?NlBvSUdvLzltWlRMMzdyVzZmM20zOFVkZUpLTWRKVEIxcFRHUjVJbzlzSVhL?=
 =?utf-8?B?MnlsQ0lTZzhBTWdxd2VOU2ZNSitLRXNkN0h2bjB3eFJtV09QbEJMMTQyWW1j?=
 =?utf-8?B?VG5mSnhUb0xqSjkxZzdpVytEeW93SHczWXBuWTNRVEYxcklVbVJPeWd0S3l3?=
 =?utf-8?B?b2paVEJHRHdLWjhLVUphZnZybEQ5Y0dmZUtuRjZlNTU0VVlBMnJsYUxLOE1W?=
 =?utf-8?B?ZTRHMTlteDRuQjZwNFFlLy9SMEN2V1hQeUd6ZmVsdGZpSE5wZXpZR2ZmVkdh?=
 =?utf-8?B?WGZETTN1aitCSFIvVTBnVlVNNnhsMTFJakoxWU5pWGJDZHZuZUEwTXp1ZFJu?=
 =?utf-8?B?MjJyLy9ySmU1T2lhZS9jSkFPUjZKV2ZSbDhpbXBYY0NCczVsTmd6YmhoUzEy?=
 =?utf-8?B?ZjFQbExoVmJjeW5DSWZ4LzFmaVpMWGZIcDhqbHVmQzlXNG9SRE9LbDlQcFFN?=
 =?utf-8?B?Wk5ZRGkwTlZrNmtXQ0N0bzhKU29mR05FUmRxTm4xa2lUa2V3d3pPK0h2V0Ny?=
 =?utf-8?B?RXpYamkrN0R0YzNaY3lmMG9ZV2V4MlE1bjV4SC91OTdNc0x3Vy8zZ1ArSDJl?=
 =?utf-8?B?dVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b46f545-e611-46a4-ff22-08dd839813e9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 01:25:35.1561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oLuiOssr5f55OHRkdOnFz7CNLMM8HdYnC893/kstcNn49qV2C4hQYlOq/DWHrikMk0wbrS+Ow5uQYbOT1iSo9ytw1z0rDDyxTsuRI4Ij0sk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8691
X-Authority-Analysis: v=2.4 cv=ZNDXmW7b c=1 sm=1 tr=0 ts=680ae495 cx=c_pps a=LxkDbUgDkQmSfly3BTNqMw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=u6u72HfGYxEgEmeRtP4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ag1SF4gXAAAA:8 a=LVVdaqqDU9W9cF4QaU8A:9 a=jd1QHv64HvZwuPk1:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: g52Le-SN1RGNoELzp439XrZczY_bmn0k
X-Proofpoint-GUID: NTC0y3y3p7ktzFhyktO2uF1jeS6nrKG2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDAwOCBTYWx0ZWRfXy8cnUk9/iHjn gUCw+Vl8HxdRwnceixRpTZ5aNDw7NZu1fXw92PQeeYiry8wfKZ/+UFg7srSjvG22XBRFk1u62ZJ 8+vHi2WTgNny/SfW2H1gw+1EqvQVRvW8V1ekByW6oI0kGvd2jyXEvjSFteG8buGiWtytMvi0uPB
 K8iqbD6BZ6XbrBB9a5cewCBZN/EpaOkA/NS2pElivLgYeiXq5jGEtf9NqyjqzOTj/shzNECVsoJ ZrxvL/+NS5PdwbL5m8t2ZhBhWO7CmjzWbIhkHogDZAokFrsTsqTgE0Rohwo3jkSaNjbd0qORiA+ 6fFB46eR3VikgF2kEza/QAojwBARbcpGzlmWxMrT93ZIxn7oz2O/vtWzdrJ72ljkfd+tOuR1X2p
 xzPaxsAvM7QklNn5a5YP4xPK/wgW3Z9t47EI5MaHQu+OiaonjH04kxZSNjfbl7s7NlQx2D6I
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504250008
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 01:25:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215412

--------------5gdHY7J0Kqvh0S0ThFLuXAcg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 53P0ZlNV008843


On 4/24/25 18:33, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Tue, 2025-04-22 at 21:07 +0800, Changqing Li via lists.openembedded.=
org wrote:
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> icu will check program install path during do_configure, eg:
>> checking for a BSD-compatible install... /path/to/install -c
>>
>> And this path will be writen into pkgdata.inc:
>> INSTALL_CMD=3D$(INSTALL-L)
>>
>> Decided by if install is installed into recipe-sysroot-native during
>> do_configure stage, the INSTALL_CMD could be
>> /build/tmp/work/corei7-64-wrs-linux/icu/76-1/recipe-sysroot-native/usr=
/bin/install
>> or /build/tmp/hosttools/install.
>>
>> set ac_cv_path_install to install under hosttools to make a determined
>> result of INSTALL_CMD, avoid vary caused by the execute sequence of
>> another task which DEPENDS on coreutils-native and independent with
>> do_configure
>>
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ---
>>   meta/recipes-support/icu/icu_76-1.bb | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-support/icu/icu_76-1.bb b/meta/recipes-suppo=
rt/icu/icu_76-1.bb
>> index f0890fc890..a33f48cf8e 100644
>> --- a/meta/recipes-support/icu/icu_76-1.bb
>> +++ b/meta/recipes-support/icu/icu_76-1.bb
>> @@ -20,9 +20,9 @@ inherit autotools pkgconfig github-releases
>>   # ICU needs the native build directory as an argument to its --with-=
cross-build option when
>>   # cross-compiling. Taken the situation that different builds may sha=
re a common sstate-cache
>>   # into consideration, the native build directory needs to be staged.
>> -EXTRA_OECONF =3D "--with-cross-build=3D${STAGING_ICU_DIR_NATIVE} --di=
sable-icu-config"
>> -EXTRA_OECONF:class-native =3D "--disable-icu-config"
>> -EXTRA_OECONF:class-nativesdk =3D "--with-cross-build=3D${STAGING_ICU_=
DIR_NATIVE} --disable-icu-config"
>> +EXTRA_OECONF =3D "--with-cross-build=3D${STAGING_ICU_DIR_NATIVE} --di=
sable-icu-config ac_cv_path_install=3D'${HOSTTOOLS_DIR}/install -c'"
>> +EXTRA_OECONF:class-native =3D "--disable-icu-config ac_cv_path_instal=
l=3D'${HOSTTOOLS_DIR}/install -c'"
>> +EXTRA_OECONF:class-nativesdk =3D "--with-cross-build=3D${STAGING_ICU_=
DIR_NATIVE} --disable-icu-config ac_cv_path_install=3D'${HOSTTOOLS_DIR}/i=
nstall -c'"
>>
>>   EXTRA_OECONF:append:class-target =3D"${@oe.utils.conditional('SITEIN=
FO_ENDIANNESS', 'be', '=20
>> --with-data-packaging=3Darchive', '', d)}"
>>   TARGET_CXXFLAGS:append =3D"${@oe.utils.conditional('SITEINFO_ENDIANN=
ESS', 'be', '=20
>> -DICU_DATA_DIR=3D\\""${datadir}/${BPN}/${@icu_install_folder(d)}\\""',=
 '', d)}"
> Does this work if you just use:
>
> ac_cv_path_install=3D'install -c'
>
> ?

It works well,=C2=A0 bitbake icu can build successfully.=C2=A0 And it can=
 also fix=20
the original do_package_qa issue:

in function remove_build_host_references, only hosttool path is=20
removed('s:${HOSTTOOLS_DIR}/::g'),

so when install under STAGING_BINDIR_NATIVE is used,=C2=A0 qa error happe=
ned.


But if use ac_cv_path_install=3D'install -c', the actually used install=20
maybe under STAGING_BINDIR_NATIVE or HOSTTOOLS_DIR,

decide if install is under STAGING_BINDIR_NATIVE when do_install is runne=
d.


So I use '${HOSTTOOLS_DIR}/install -c' to make install under hosttools=20
is always used.

Regards

Changqing

>
> Cheers,
>
> Richard
--------------5gdHY7J0Kqvh0S0ThFLuXAcg
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/24/25 18:33, Richard Purdie wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:d76232c249fa6af70c2539d14e733825bc6f1dc8.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Tue, 2025-04-22 at 21:07 +0800, Changqing Li via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

icu will check program install path during do_configure, eg:
checking for a BSD-compatible install... /path/to/install -c

And this path will be writen into pkgdata.inc:
INSTALL_CMD=$(INSTALL-L)

Decided by if install is installed into recipe-sysroot-native during
do_configure stage, the INSTALL_CMD could be
/build/tmp/work/corei7-64-wrs-linux/icu/76-1/recipe-sysroot-native/usr/bin/install
or /build/tmp/hosttools/install.

set ac_cv_path_install to install under hosttools to make a determined
result of INSTALL_CMD, avoid vary caused by the execute sequence of
another task which DEPENDS on coreutils-native and independent with
do_configure

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta/recipes-support/icu/icu_76-1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/icu/icu_76-1.bb b/meta/recipes-support/icu/icu_76-1.bb
index f0890fc890..a33f48cf8e 100644
--- a/meta/recipes-support/icu/icu_76-1.bb
+++ b/meta/recipes-support/icu/icu_76-1.bb
@@ -20,9 +20,9 @@ inherit autotools pkgconfig github-releases
 # ICU needs the native build directory as an argument to its --with-cross-build option when
 # cross-compiling. Taken the situation that different builds may share a common sstate-cache
 # into consideration, the native build directory needs to be staged.
-EXTRA_OECONF = &quot;--with-cross-build=${STAGING_ICU_DIR_NATIVE} --disable-icu-config&quot;
-EXTRA_OECONF:class-native = &quot;--disable-icu-config&quot;
-EXTRA_OECONF:class-nativesdk = &quot;--with-cross-build=${STAGING_ICU_DIR_NATIVE} --disable-icu-config&quot;
+EXTRA_OECONF = &quot;--with-cross-build=${STAGING_ICU_DIR_NATIVE} --disable-icu-config ac_cv_path_install='${HOSTTOOLS_DIR}/install -c'&quot;
+EXTRA_OECONF:class-native = &quot;--disable-icu-config ac_cv_path_install='${HOSTTOOLS_DIR}/install -c'&quot;
+EXTRA_OECONF:class-nativesdk = &quot;--with-cross-build=${STAGING_ICU_DIR_NATIVE} --disable-icu-config ac_cv_path_install='${HOSTTOOLS_DIR}/install -c'&quot;

 EXTRA_OECONF:append:class-target = <a class="moz-txt-link-rfc2396E" href="mailto:${@oe.utils.conditional('SITEINFO_ENDIANNESS','be','--with-data-packaging=archive','',d)}">&quot;${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' --with-data-packaging=archive', '', d)}&quot;</a>
 TARGET_CXXFLAGS:append = <a class="moz-txt-link-rfc2396E" href="mailto:${@oe.utils.conditional('SITEINFO_ENDIANNESS','be','-DICU_DATA_DIR=\\">&quot;${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' -DICU_DATA_DIR=\\&quot;</a>&quot;${datadir}/${BPN}/${@icu_install_folder(d)}\\&quot;&quot;', '', d)}&quot;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Does this work if you just use:

ac_cv_path_install='install -c'

?</pre>
    </blockquote>
    <p>It works well,&nbsp; bitbake icu can build successfully.&nbsp; And it can
      also fix the original do_package_qa issue:<br>
    </p>
    <p>in function remove_build_host_references, only hosttool path is
      removed('s:${HOSTTOOLS_DIR}/::g'),</p>
    <p>so when install under STAGING_BINDIR_NATIVE is used,&nbsp; qa error
      happened.</p>
    <p><br>
    </p>
    <p>But if use <span style="white-space: pre-wrap">ac_cv_path_install='install -c',  the actually used install maybe under </span>STAGING_BINDIR_NATIVE
      or HOSTTOOLS_DIR,</p>
    <p>decide if install is under <span style="white-space: pre-wrap"></span>STAGING_BINDIR_NATIVE
      when do_install is runned.&nbsp; <br>
    </p>
    <p><br>
    </p>
    <p>So I use <span style="white-space: pre-wrap">'${HOSTTOOLS_DIR}/install -c' to make install under hosttools is always used.</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">Regards</span></p>
    <p><span style="white-space: pre-wrap">Changqing
</span></p>
    <blockquote type="cite" cite="mid:d76232c249fa6af70c2539d14e733825bc6f1dc8.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">

Cheers,

Richard
</pre>
    </blockquote>
  </body>
</html>

--------------5gdHY7J0Kqvh0S0ThFLuXAcg--

