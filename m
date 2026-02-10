Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBAC7EA3F37
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 10:08:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16699.1770718126764367721
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 02:08:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=O7Q/jY5F;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6501c5c083=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A7rNx01923180
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 02:08:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=SvH9JnCsOBokt2zKmO40L6kezsPi3Vdo5wFEs+a4ryU=; b=O7Q/jY5FYMCu
	qNRh+7dld/AWI00kHysmOu33aPlOM/q16TD5PhOsoW069EovLpeyjQuCh+0HfhNx
	kSqtu1Fi4IDtGed0WSgTeX2COpwNHzcscpVeuuBJIvt2GnweGOpOSgUKJgj4pk3D
	62EtJSJzYvOWQ4EjqDs1FOiHj9yFJOvaOi4x7N6LhY/lxdew5+swWU1p0jqc427V
	SvtFBqnIs/Q2FfZroQg+6VrQscjN4peicecBgwIt1RYdPCngJRphhh0Q5AyDf22s
	1Fznn0FvbY/FROmwZncZQpxkOOjvkDVy+rABGQE6ELUfAd+LbZ3mkmr/XSgTUagx
	O/9TjNdNmw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013067.outbound.protection.outlook.com [40.93.201.67])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c65sj2see-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Feb 2026 02:08:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fzsuOQXo81xM+PRiHkJ7D83GlyL4LHcJcNRWq5Yck2iui13fSIo3Z/RauVSERMs5+bYujlFg5ttAnPP2xKWhidJGiUhVPCsFBp6t5Hf70UnET4mZMYZWpIod6oMCY2Lfw/XEeYnvgOCK30x+DIjH24MoredrXZycE91BTnMmGm6+uIhmKe7MIBnizSmUZ8Y7kmn7h3K3gnPSNJpQAFlTiJNKhKE+nUR7rdLUL/RP4Lm2OGK/VfzmqFDb5w5J9L1n10PyIE37b9Axz+Z92dphKBDkpEOqex2G4DevmbKVe1jPUgjBxwr9Z1vValqzHkxcU9mLPPM6dT2gt5JRuCxxjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SvH9JnCsOBokt2zKmO40L6kezsPi3Vdo5wFEs+a4ryU=;
 b=hlimPKu5+ufIwsXK2GagQtPvcNyo2FGn5Am370IX2pLzUIQGxNXxJiYBEFILEuKg0qou3Cn9uV4ldeQsF15fZ5p++XOBOsimC1g8AWzIsdBMpSFQf853RrDk89i/WF2nx/8ZmWKouwl7chknnlMMSzHkviZgnpaAdzdJLzlsM56KBcFY+RCcgye/n3j8rEfCnpFqaM0jGkFpFIFu8js/+LFfcAvUE+p0v2V83Jo90ytrHmUNlkR2TPCONIZjkzM5xfHm6fcQ0WcC4ZwZTUYMn8fbcyBxuqMOMRNKILCBQK9E6d6SQu0RycI3nX5HsWCDuQqln411GaiXHSsCFYu/4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by MN0PR11MB5988.namprd11.prod.outlook.com (2603:10b6:208:373::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Tue, 10 Feb
 2026 10:08:42 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 10:08:42 +0000
Message-ID: <7f8d134d-0ce5-4643-badc-8820110904cc@windriver.com>
Date: Tue, 10 Feb 2026 18:08:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v4 3/7] classes-global/package_rpm.bbclass:
 Remove %pre and %postin for libc6
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <cover.1770707181.git.liezhi.yang@windriver.com>
 <59ba081c8c874065b6cdc050a2897422be4a7a59.1770707181.git.liezhi.yang@windriver.com>
 <815228181136c50526453673dd9235a6b7e4ede3.camel@linuxfoundation.org>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <815228181136c50526453673dd9235a6b7e4ede3.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TY4P301CA0048.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::19) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|MN0PR11MB5988:EE_
X-MS-Office365-Filtering-Correlation-Id: 3659b489-2f50-40f7-2c9d-08de688c5e81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eXlDZERpc2t2NkhneUtoL1A5Qk9kREhmQllESkNITlhYcTV0Uk4xYWdzZXBl?=
 =?utf-8?B?VzMwZXRwc1k0WHZENHZmY3I5b0hkZXJ1djZGK2hiVTRkU1N0UDZ1aE1heUFW?=
 =?utf-8?B?RU5kWmRHYzY1alZEUmZmNHVDTlJBTXp1cUtwVnhPZnJkNEMwTUgrLytpU0d6?=
 =?utf-8?B?ODl0M2ZHa2RvNW1zS1hxSzl4dTg4b0cxRldnYzAycjVvWnhBMDdZL1g2VDh5?=
 =?utf-8?B?Tk5OZVFtS2wxMEgxVmZ6Wm5ZNDdrN2JHRkkxRlBxd3hSSW5PRU1kMkVXYitT?=
 =?utf-8?B?L3RsYWJrQ1pqeUh3WlIvL1hxbkR1UGZkTG1tMXcxekZ0NDRvQWc1QjJKVXNL?=
 =?utf-8?B?V041aldxU1Y1K1lQRUdoSDhLdnJlQlBuZFZxNC92QnlpakswLzVTU2drTmhp?=
 =?utf-8?B?UmxIZGhIZ0pONVdZTlMwY2ZoZTI0aEgvL2VUcjFpMGxGamw3TVEyd1FJUWFm?=
 =?utf-8?B?NG8rYzNHVUhwd1drdWFZVjlieGdpbjVuSFNOdnhrOUpXcjBsbWRtSUVudkhn?=
 =?utf-8?B?RlZXTWdkZDF4V213eUF4MnU0dXVFeXp3cFMxVlVXWUY4Z3NBYkpZTDQ0bnBn?=
 =?utf-8?B?cVBNSks4S09qS1ZwVVd6eW94aFFWWFZaZFhVanRXdm05TTl3RlBac2NsN3J4?=
 =?utf-8?B?QmlXS1ZycVlvT2Q5RDNmNmtEWElJRmtzeTFYeG45S0toSUd0MmE1THRQbld0?=
 =?utf-8?B?VExiVk9TM1RlRFpSaXRVV2M5Wm8wM05rRWg5bVFSb0VaUGNXbFJiVG5NZUhw?=
 =?utf-8?B?RzhrRzhGa1REQWhBcEJ3dzVZMThxNURwUTAvUGdYNTNLc1R0aXQvZG9HaU5D?=
 =?utf-8?B?aW95Nm8reW9MNVJ0VGJVSXlGK3h6YWxhd3F1bXM1cStOTHBOMDRFeHpHbmlj?=
 =?utf-8?B?bW1LMm92MCtPYzJ4bVdtZzZIbEhxcGNDSlFsTnFhSWUwRGdmZFdKbk53UStx?=
 =?utf-8?B?OUtYNVRDSXNjNFRObGZSWnlkeXVYOXRGTmFSRXo5Q25WWkxLTko0NlJkakxO?=
 =?utf-8?B?K3Uyb0sxLzlEeHNUR08yL1ZyWkdpMHE1dmVWc3plS0JsaklGT3crSElGemxV?=
 =?utf-8?B?b3NzRzRSektNUWNJZ3poTU5xVU8yTkxqOHFUY2dNN3llNlZqWFdySktjZXRG?=
 =?utf-8?B?ZXJDZ25Id0RwdkhnL3FZZXMyYTFuV3BsY0FwdndydGgwNEtpVDdySzVIcGtF?=
 =?utf-8?B?M2pJU2J6c2V0YzhwR2dJU25LNmdaRHJFYjJFNzlkdVpQZ2lLbDRsRkcrbVRM?=
 =?utf-8?B?UXBEaVpYdytINlByaE5Ybm9QT0xLZEg0NXJxMXk0Y3NHdDg0WW0rbjlyU3Ra?=
 =?utf-8?B?clNTaFE1MDFSSEFXSHZ0cjJiRmkxWFhhUDlyd2J2K3Vwdkl2RHhXZ3ViZWlH?=
 =?utf-8?B?QnptYndXKzZncG9OMWx0OXNySnpFNlJMRUZ2aWZrb3F6ZjBpL3plUmZCWCtL?=
 =?utf-8?B?TExwWmFkcU9sL25DRGlWTkhPdDU0ODgwbmIzaThKME92WXZwZWNXeXNpd05D?=
 =?utf-8?B?WlIxK3BaNmd6b29BWnlkdXdKeEFKZWtGTlh5VWxPa1JzWGx0TzFjZzc2LzI1?=
 =?utf-8?B?cXUweUsyOXlqMU9UL3V2SFlCVXZBTFJOWDBmdlBpbmJHbHgxeS9EY1pZRDJL?=
 =?utf-8?B?WThLSG5qMXcvT0NGVUFnMStTV096RG9na0x3eFR1S1JOQTNrd0Q2SnNXY1JK?=
 =?utf-8?B?anNGS0tUdlRxekN1YXI1N1Qvb1lZdUJZZ0R1VHg5QnpMVmxiMlpXS2gxRGlW?=
 =?utf-8?B?cXQwUThBZ0QxYWF5L2hlUGNJOXJnWDc4OWJZOU9nMFo4cE5GQW5kUTgzdnNt?=
 =?utf-8?B?MVRGN3ZUZ0hMU3BCMjVaYWpFOW1hRUdPQ25CLzN0YlNtQjZnUU1VSG1aMDlz?=
 =?utf-8?B?aGRYb0YvVGpPTzRtMERqbk1LTEQ4TDhZVldBUUI4MWRzek41aHkxRm5Zb21H?=
 =?utf-8?B?M3pic2VraldQNG50Q0RvYkx4WHkzalBMSW83WWZRRlFBTWx1OTNzbzUwWlhD?=
 =?utf-8?B?V0xJYnJWdlhIRS9GbDZodW5CUTJ0NzAyMEVTeU1KamFWU2RELzljcjN1NUxX?=
 =?utf-8?B?eUJUN2pUT2JBaWNWL2tNVkpTRWpuT1duZHE2dk9rNmN0Z3paOFhPTjdXc0VV?=
 =?utf-8?Q?bTDY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Snc0WDZoZkhxWmhKWU5nUG5kQ0tLUVRhaVJSRFYrdm1kK1BnZFM3UVlKaTJ5?=
 =?utf-8?B?bkpWY3BTVVZybDN5bGMyRlNJWmU0bUgxSnljblIvc00wdzZsSU9xbUlvSUx2?=
 =?utf-8?B?c1lXQmkwcHJYUFlpVThqeDJCZ1JXaDZjV0o4QVhXQWV1TXV2cmtWUm5wdURB?=
 =?utf-8?B?Qlo0aXpCZUlCZi8xaVJXaTdOeG5iYkVvUGkzR01hR0k0RGI2cFBIbTV2Smlj?=
 =?utf-8?B?L09uL0tSdTdsaTd0L3FHak1MQi8xUnpDNDUyOXB4Z3pMajdEdWx5RXhJK0E3?=
 =?utf-8?B?M3VEQ0JUa2EwQnUzRURmSlQwYUFnMlh0L1ExTEF3WXhOczJvSTRQL0lZNnpN?=
 =?utf-8?B?Y25JYjAxbzRtQUNTTFZkWWhFVDBua0R4ZXg3aGpMSkxxRzZuTmlRVzVZZHZp?=
 =?utf-8?B?RDhxZTNTTXIwRnVCTEx4ak5CSzdzQTdMMlVRZmxhTG8rd0szWGR3RHlrR1Rl?=
 =?utf-8?B?c0pjL2F3cXIwM2VUVkJDOVJPckVlN21LZTRFQW53ZklHWEt0bjNPRnFGZkwr?=
 =?utf-8?B?bVRxUlhvdXRoaTB3amppTHRvV2d3UDJZOS9qQTlCNkNCL2JLMjZ5RWpwL1lh?=
 =?utf-8?B?Vmx0cTVBSkFhYnNiMEE3cmxpclRiWjFTNjl1YVZ6VDlwak0vNEtUR0E5eUNV?=
 =?utf-8?B?S09XOU1UM1JGT1BQeDhrQSsvUzJwWUFVQ0FndzBORVBmblova0JPVHZBVUVM?=
 =?utf-8?B?aG9xaWZ3UE13WDBGWEJZN05ERnNvdER2aGVoMzhuVU9BMUErRndVRTBQakRa?=
 =?utf-8?B?cVBjSFMwdndXYW43S3FOWENpc0s5UmkwVXYydng5NHpKbElzWkdoR1R3dWdN?=
 =?utf-8?B?a29QcmtYb0JFNFZucmYwSjhUb2IwSDdXNVJQQkd6MEQ2T2twZzBvNFhrUDR3?=
 =?utf-8?B?VVhvS0NhT05sR0JYcGFqOGo2Qmp3bDBiVU5sbkYzLy9zQUZXSG54ZkdaNnht?=
 =?utf-8?B?S0tTc2hwbW95ejZYZXRuelZTSXYvbVJGM0tqN0M4TmZNTnpyeWw4VkxvR2l6?=
 =?utf-8?B?Z2tJMTF2YXhUVnNEQW9CYVlXSm1Fd2RRMWhXQitjMzdGeE5FVTFiVTJjT2M0?=
 =?utf-8?B?Uy9keUlGdllOeGFBbWlLUHFkZ0prZENXRGp5ajJaTHdyYmJ1cEpxRHpIZVZS?=
 =?utf-8?B?b1JZZXZhU3htNU9iRTV5QW5TYmtTVllnU0hGWXdkSWd3dEdUWXVPem5jOFZ1?=
 =?utf-8?B?Z3dIbzhBOGpXNHgzeW5nVGk3QWN2NGlKVTVVT3JHQUhDbWhjYmpLMU1Dd202?=
 =?utf-8?B?eHZjMVJJZFZ5K2RJb1gwY1M3MFU1ZUJacFU4KzZ6M0w5K21iMHRlbkVyaklp?=
 =?utf-8?B?VkRFWkZ0cHJtZTFKd0JlZHp5VndqRHBuWC9sMEQzZVI2QmQyWnE4N1FDZ0c5?=
 =?utf-8?B?Y05jdUZ2aGU4ODlnUlVUQ1czZnEwWGM4QkJNS0hTYmNpcldjNlpzQm9oYVhm?=
 =?utf-8?B?d01rOUJuZUhNRUxnK3h6Y3QzVHlXRTdoemZlSU5sUmwvMFZOWFpNTXF4Qitp?=
 =?utf-8?B?U0Z2TDdMbDFKem9ETTJzVmFuVHdyYU5BTGVrNEo0NDhOUG5PS2ROVVVRK1NO?=
 =?utf-8?B?YmZjNTJkdXJyMzc3NmpJNk5vVWdkRmk1YU5hcDBaQnU1blo4RzNHQkMwRnk1?=
 =?utf-8?B?QUFSZXZ1QmJTdzdZTE5EMjNZampKdnBDWGtLL3ZJVDVycmN5SW5qOElNNnFp?=
 =?utf-8?B?SlYxT3AzeXczNXFGVkh4YU1mV3RMME0wMk91YXhHaXBscmw0UmltZm9lNElI?=
 =?utf-8?B?UWk0bXBIcGdGUElya2tsTVd5MjFXT1laLytFTGJiekNteUREM1EvUUpmZUxo?=
 =?utf-8?B?bWtEWjJzVjBWOVRHa3U0bFg1Q1E2by8yUjkrUXFhRFZuUHlUemhlSW9vL0hM?=
 =?utf-8?B?NXQrYkZBQUNpU21vTnQ1VEJhdHk4QWFCMFFwYVZVWmVmVHRIY2dZNmNBQTAx?=
 =?utf-8?B?anErZXVNd3NLbXRMd0RYRGNFb2R6WEFtNlFOVTdyREFYQVVvZjEwVFVEUzkx?=
 =?utf-8?B?VGZrcHZod29zRm9tUGtkL0JpYThWZEhjMFJsY0gvRitacHVpR1ZpbFJLMGVI?=
 =?utf-8?B?bEJ5YW4vbVBhSm5zVDFwaTI4b3FtMWo3bExPSHRKYWVGalhVeUh6dHo0aUVo?=
 =?utf-8?B?VUdHQitYTEJHOVhCTWM4UFRCU3dWSmlIQUlkZDBOa21naDdCcU9NZUdOT3Ru?=
 =?utf-8?B?RTIxL3BOYWduU2czdERuNlJUWGhQUzNTVnBXUWlmeTl0bGpsWVdJdi84NlpY?=
 =?utf-8?B?RnV2Z3lIbDRmOUZFcXg0NlRFeWdWbVNXeGNYU0tqOFZWNmIyK3MvcXltSThZ?=
 =?utf-8?B?OEdqVkhNV1BNTm0xbTJmSjBYTDAxU29CRzVCZ0RMQzZtRjYyem5aK1JWRzB2?=
 =?utf-8?Q?Bjgrz95zifT1sCKA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3659b489-2f50-40f7-2c9d-08de688c5e81
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 10:08:42.6995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qgnNM00SNDi1j8ay055Iq4ZBJt8kZvdGQA2Cj2wVGvuEeXn5HGM8sB0Cz39evn4fFO9bCe4RfbyZsD+pE3NbgZfj2pKYiVhOOUV/BBPhJUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5988
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 3tlUYLcQ4nWJPnXbZ_roywb26j3A0ues
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA4NCBTYWx0ZWRfXzvshPxF0EL4U
 /6ra8Be48Q7DFzwxhEtA/MU2t013WcoSa3pp8D+FJ18+mZMVphMNHlasJajyUB/wloR9YjBKm0v
 Ok8gTRszxvM5IwLFe3vTZ1qDwLv35Zab6tRiEMSMr0a1ELg0hHda4OKavOODlMnVQ9MM8T5mDqN
 q4gbGRPtJlu9BbTXtWnqYFqsOIBbQMoHJwl6e8sQ3XMGY/qfqf/cEDQovBH7ZLFZDY+jtZhZ2He
 Cyq4/K2X3ZTmx/4FKk5B4sgkGwCbRn/5jXfyaYZI/WHdlCVHGsUNDHaSf4V2SE/G0py7MbF8EpF
 3BSYle8oZ5/x/ItS7nghzg3Rsxr9ZVq7QTNdfDIqweLNokTKDq+EVobGg74QvL8eF09nanz7LDX
 E3bwE2uzt+6vV4hYwow7TCvKGLv3SV+YhJ4a8DWZGpfd7veQ/w9rpr2pIPMhaTWkaNi4y6QMPy7
 g2hBOEo7zxXKSYurbrA==
X-Proofpoint-GUID: 1vB8BvNCDJfhvvQqmI6JfIyNSGI0FdFE
X-Authority-Analysis: v=2.4 cv=Cpyys34D c=1 sm=1 tr=0 ts=698b03ae cx=c_pps
 a=R3Nq4yRH+PcKhTCrdXTq7w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=YDj844BS_8YK_25DU24A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100084
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61A7rNx01923180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 10:08:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230878

Hi RP,

On 2/10/26 16:52, Richard Purdie wrote:
> On Mon, 2026-02-09 at 23:10 -0800, Robert Yang via lists.openembedded.o=
rg wrote:
>> From: Robert Yang <liezhi.yang@windriver.com>
>>
>> Fixed:
>> $ bitbake core-image-full-cmdline:do_testimage
>> %post(busybox-1.37.0-r0.x86_64_x32): execv(/bin/sh) pid 624
>> error: failed to exec scriptlet interpreter /bin/sh: No such file or d=
irectory
>>
>> It is because busybox and libc6 depends on each other, busybox' elf fi=
les
>> depends on libc6, and libc6's postin depends on busybox' /bin/sh, the =
do_rootfs
>> works well is because dnf-native has set RPM_NO_CHROOT_FOR_SCRIPTS=3D1=
, but it
>> would be failed for a fresh rootfs.
>>
>> In rpm 4.20.1, it let the installed files' Requires win, so it install=
ed
>> busybox firstly, but in rpm 6.0.1, it let the postin's Requires win si=
nce
>> postin would run immediately after the files are installed, this does =
make
>> sense, so it installed busybox (which provides /bin/sh required by lib=
c6'
>> postin) firstly, then we got the errors. I couldn't find which commit =
made this
>> change because a lot of files and functions are refactored during 4.20=
.1 and
>> 6.0.0 (not .1), I also tried bisect, but failed because a lot of do_pa=
tch or
>> do_configure/do_compile failures for each build.
>>
>> For libc6's the postin is:
>>
>>  =C2=A0 #!/bin/sh
>>  =C2=A0 if [ x"$D" =3D "x" ]; then
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -x /sbin/ldconfig ]; then /sbin/l=
dconfig ; fi
>>  =C2=A0 fi
>>
>> This doesn't make sense for lib6 since there is no /bin/sh or ldconfig=
 when
>> libc6 is not ready yet, so we can just remove libc6's postin to fix th=
e
>> problem.
>>
>> And also remove the workarounds in oeqa/runtime/cases/dnf.py, they are=
 not
>> needed any more since the circular dependency is fixed.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>  =C2=A0meta/classes-global/package_rpm.bbclass | 6 ++++--
>>  =C2=A0meta/lib/oeqa/runtime/cases/dnf.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 8 --------
>>  =C2=A02 files changed, 4 insertions(+), 10 deletions(-)
>>
>> diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-gl=
obal/package_rpm.bbclass
>> index f4dd779a52..526ac57982 100644
>> --- a/meta/classes-global/package_rpm.bbclass
>> +++ b/meta/classes-global/package_rpm.bbclass
>> @@ -421,12 +421,14 @@ python write_specfile () {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spec_preamble_bottom=
.append('')
>>  =20
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Now process script=
lets
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if splitrpreinst:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # The libc6 shouldn't have=
 %pre or %post to avoid circular dependency
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libc6 =3D '%slibc6' % (d.g=
etVar('MLPREFIX') or '')
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if splitrpreinst and split=
name !=3D libc6:
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 spec_scriptlets_bottom.append('%%pre -n %s' % splitname)
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 spec_scriptlets_bottom.append('# %s - preinst' % splitname)
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 spec_scriptlets_bottom.append(splitrpreinst)
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 spec_scriptlets_bottom.append('')
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if splitrpostinst:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if splitrpostinst and spli=
tname !=3D libc6:
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 spec_scriptlets_bottom.append('%%post -n %s' % splitname)
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 spec_scriptlets_bottom.append('# %s - postinst' % splitname)
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 spec_scriptlets_bottom.append(splitrpostinst)
>=20
> I'm not happy about coding a "libc6" reference into the generic package
> class. It does make me wonder if there is a similar issue with musl for
> example and we'd end up with a longer hardcoded list.
>=20
> Could/shouldn't we just not add that postinst for libc6? You could for
> example force the value of pkg_postinst:libc6 during the packaging
> process and empty the postinst instead.

I think you meant add the following lines in glibc-package.inc:

pkg_postinst:glibc () {
     echo
}

We need an "echo" here, otherwise, meta/lib/oe/package.py would add the
"#!/bin/sh" to the postinst:

         if needs_ldconfig:
             bb.debug(1, 'adding ldconfig call to postinst for %s' % pkg)
             postinst =3D d.getVar('pkg_postinst:%s' % pkg)
             if not postinst:
                 postinst =3D '#!/bin/sh\n'
             postinst +=3D d.getVar('ldconfig_postinst_fragment')
             d.setVar('pkg_postinst:%s' % pkg, postinst)

But this still doesn't work, because rpm will add the /bin/sh as the defa=
ult
interpreter when not specified. And currently, meta/lib/oe/package.py
add the ldconfig_postinst_fragment automatically when find so files,
that the root cause, so how about we add a value like:

NEEDS_LDCONFIG:<pkg> =3D "0" or "1"

Then we can add the following line to glibc-package.inc to skip that.
NEEDS_LDCONFIG:libc6 =3D "0"

And also we need update meta/lib/oe/package.py to check the
NEEDS_LDCONFIG:pkg.

>=20
> Also the commit message explains the problem with the postinst but not
> really why the preinst is a problem? What does that contain which is
> problematic?
>=20

It is similar to posint, the prinst has a harder situation than postinst.

// Robert


> Cheers,
>=20
> Richard


