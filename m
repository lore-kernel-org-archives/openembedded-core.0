Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 474AFD41171
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 11:13:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33144.1768475619803481271
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 03:13:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jUGFQo+9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5475b384d2=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FAUkOo584280
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 03:13:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=tS6+gGjDhEXZ+oOJ801lP9fJfJJAzvf2EuXF3YGnEes=; b=
	jUGFQo+9iY8fZ6SGzSWmQ78PCwkDSSJUTGk88QJXntLjGVnldbT1k551EMFw0CBC
	hre+eLF/RSQEgZWa3KHKxR0x0zi1WNmRMxAinZdv0Lpn+BD1Va7/A6Ql/XHeQ6rm
	GjnOCgdGDV52pwWgmIemNA47D0ejtyd5Q9gULRekWV2Kl5ds+e9VroNTrTfE/Vy3
	fhw4qUJyLZjnW2g06GO8QxxoU+saT6+TWjRgNqK1HqvhBkCdRR+7tgN5P1gadYGh
	F4RmBLaUzeUZUS6QBFqh+3O6kY4caMJ8zWcK20KK+8OYQjbxgCxGzJ2AHwAQHK14
	NWoRQxVCJ2DD4y+oV3QYDA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010042.outbound.protection.outlook.com [52.101.201.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkjx0wnbt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 03:13:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x6DzYZzOwbb1X1czXoxwHl9PN4I+oKUs8RenFBPISSz3SnUgFKYmCmd10WI9uEb8ldynIQVG4ODWxmHcQqNRYVNJoxQuf0YhF/Mea+QCWLH6KLVFI+VMu6KG0K2o7FLiak/tTNf0UMTgOiCPRJuzkfdt2GhQHEBx+C5vQZqmlDDhsE5xW1YUcqscZf2vCF8lILYDaf9IZ6HAywPnhctdp5j7fAuAy9xFfiMkQVt2msuJrBM4Mk9qTLFPwJ1v53WDdyoBrSW4lpiZPigvMMuS2XHAADxKNkIHaN9o7Izwxcr355OLmhR6Zk37Aa1rW+WTEpLL37v4ny9OTADhdUyiMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tS6+gGjDhEXZ+oOJ801lP9fJfJJAzvf2EuXF3YGnEes=;
 b=AQDOqF7gRCjXFGa75Qmg+XSN47/Upmc7KNmdFUBzSMxJpNt1Qf81xeUh7CrU8FIuSXfBsIv63nJdNyBvOELENQNMOEgEGTzJFGICPgigvlZXWHvDKz7dxv7d8pe3g3GFGbkYhWQ9WhdDzOoQclQAvlTl372OcPWgSduGVVULYRbBdymq0zgE92kpXEHUi2kd5Zw9pGutFYaA+o7C8etwiJoJ2b6WrcJkmnkx/BqYLSlUXBI2HtCxcgHimvwzj+zMHcTlTq+TomwZel2rmJ/RSrWZd+3BSOqZUIiLoQXTgj29SMateZSftjttQ5xcLHM2paiS8+bl9cj3ZVtJusiwDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by DS0PR11MB7683.namprd11.prod.outlook.com (2603:10b6:8:df::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 11:13:36 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%5]) with mapi id 15.20.9520.003; Thu, 15 Jan 2026
 11:13:36 +0000
Message-ID: <109ae7a8-2ec8-44ef-94b9-f6bdb77dca37@windriver.com>
Date: Thu, 15 Jan 2026 19:13:23 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] rpm: 4.20.1 -> 6.0.1
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org
References: <cover.1768469892.git.liezhi.yang@windriver.com>
 <f69b7f8ddf584c045a6fa168f6add2850519e410.1768469892.git.liezhi.yang@windriver.com>
 <CANNYZj-C+1htk4XR-uaSbsCw8OwE-bskmucyw0qLkD4TnNDbTQ@mail.gmail.com>
 <e94a5ab8-88fd-457c-8130-8b738895787c@windriver.com>
 <CANNYZj-_cRUQXiWij81yP4QaN3ewGYWrpc8o6FhhGev6R1D8gw@mail.gmail.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <CANNYZj-_cRUQXiWij81yP4QaN3ewGYWrpc8o6FhhGev6R1D8gw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KUZPR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:d10:33::14) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|DS0PR11MB7683:EE_
X-MS-Office365-Filtering-Correlation-Id: 14942510-b9d6-463d-e435-08de54272079
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Rm5EK1pSTHBDNURGUVFvQmZ4dE9HcENXSWJrdmc5b3hsV21CVWIyalo2TzJM?=
 =?utf-8?B?TWV2UUZRY3lzcDJkZzNKbHJCTGlUTkZaM0ZJM0I5azJDenh3RjVQKzBteXJL?=
 =?utf-8?B?bGM5bWxkbmRXWnliMVpQM3ovaWpJR2VNOEdhYis3TjFBQnp3WUhTTUxCeGdk?=
 =?utf-8?B?UTlYaVJVZU5qK3VzMFI4Z0MyTEh1UWw0NGRoSzgwMStBbWx0dVZNMkViQmZ1?=
 =?utf-8?B?L2oxSm0yeWxkTmpTQ3RZRStOR1pVUXQvV0FWdiswVnloZXNQb3lpTHkyUVdq?=
 =?utf-8?B?WGZLOEtqak81SVVyQzZpb2ZqRXRGRE9Tdy90eVN0SzdyS00xZFQ3WE9ENG01?=
 =?utf-8?B?MVA5NmFDTzRoOE9GR0dNMnFMWGJaa2xZVEEwd2ZJa0wzTFJXK0xDbVdudEVs?=
 =?utf-8?B?cngzRCtWQXEvRllqNkkyczNJNGxqbUlKanNTeGlnSm9jM29GRzFwK3ljRTFa?=
 =?utf-8?B?cDU0TWo3cEZHWTZLYTN6UzhBTWJUR2ZGd3B2d3QxZFhhMHNjeFNqSXc4aU9v?=
 =?utf-8?B?TmlSaFMyYzd6NHJXWGFkOHNPL0NDcG5vd1p3RHBIOFlYVFg2YnJ0L3lNUTRO?=
 =?utf-8?B?L01PeThiTVZHM09oYWlxSE1QdFdnb0s3c1BVN2FXQ1pSRjFqTEhEdUtlYk5v?=
 =?utf-8?B?QjEyNnh3ZWRnUWsxODI5bUt0em1STEk5S3JhVFRuNFF1RXpZUjI4ak5tN3BU?=
 =?utf-8?B?emJZbVhNRm80aVpHZWJySXNBUEZpcm9WajM4Q0wzWkt2UVpXSWFGNzVPdXI3?=
 =?utf-8?B?UlNTTFN1bzVKdWRoTE5qRzBtaUd3R3lHMm83VFBta1hKV2N2UWFjMENubUZL?=
 =?utf-8?B?cEFlS290RTRhMU5peXBkN3ZGUU9wSTB0dS9yUFBjZVF2TWt0MzE0ckVXZXRQ?=
 =?utf-8?B?a0hGeHYrTmZKTi9xSFJZSC9vYkMxNG1tbmxEWlpMZXlrQUZESWJzMGZBS2I1?=
 =?utf-8?B?cDRZT0h6cGVkb0dJaUM5ZGhhUXM5NWp3N0tHWEF1UGswUE1KRGhBUWxsa3Z4?=
 =?utf-8?B?NFFuSVpJQ2luTEs4Z3daU242YjZ6N0dZOHNtcmE4a25HR2xVZ2dmZlZmamsx?=
 =?utf-8?B?eHo2cU1sRG1zQTdEY3cybVUyb2EzTTFRNWpWdGFxN1YwV2VMd2ZFUFhQRU9W?=
 =?utf-8?B?MytJdDBkR3Y0SHE2M1dkQXczRDAvbGtBb2VOaXJGM1ZTZXBnc1pzWk1leUdS?=
 =?utf-8?B?RkhIYk12alZMWnRtK1NMTWVuUGMrMGtGTkloUXVEMnBjNkdJZUxwTXRwYU1z?=
 =?utf-8?B?TzdWVy9SbUFhQ1ljYkg4UWJNNnRSc2FvQXdMc1ZtdmZQWnNOY0dGbVZyZm5i?=
 =?utf-8?B?d2NsWEc1YmJ1YXlZVG1PRTNqN29id3JQeGVqbFFGam91dmNDQWoxd0RCMFZS?=
 =?utf-8?B?dVMvVEk0VFhOUEh5Ri9xcmFuVlJJc0R0VGNRY2RlbnBCU0g2bkZxK1RxZVFC?=
 =?utf-8?B?RWdaZEljdXVsKzVzK29JY095OWo2UHp0NjlmanVQUDRFWE5sbWtZUlRMaUdG?=
 =?utf-8?B?TVZEblQ2OEhDOWtnVTRmdVV1OTFRUDFuUGJ3Zkt1WTNpTTBMME1EdDZYNENT?=
 =?utf-8?B?SzlRMVYrMU1QUzZQQ1lhMExvd2c2VUZZZ0VRMUtWUHB3cFdlbHpkQ0s2cWJ4?=
 =?utf-8?B?TkJtZGtadVVwZDVZclNDMEpDODhFY1dZRGNvZi8wK3lLT2dtSnlLNzJ4Slly?=
 =?utf-8?B?NStqZ21ja3N2Zkt0MmYyM1RmRG1TZ0lMWE93MlM1amJKV3FJMm9ZeklXb2FG?=
 =?utf-8?B?cHZCdERiSEdKbzNFNjQwbjlGdzdab05xZGVNK0kzbGF1bG85ZGlaaFljcUlk?=
 =?utf-8?B?bEVjWnhseVc5VEx2UkNURmhmTEtralprM2FTVlpKbEZRVVFxMEdjV1pTV2Vx?=
 =?utf-8?B?K041aUJuRk02cEZTdjN0U0gzK2doU1VTenpqZVJOckUvOTV6UGJVNWQyeVBI?=
 =?utf-8?B?dFdnSllYRVh2NnpHMmFXRi9oUEZ1L2tubExDcXZ5ajBGUjNFWFo5N1RncFFs?=
 =?utf-8?B?SW5hUmtnSmV4WCt1TURFUkxGYmp0WENJbW9xMUhoR1hwTTRkWmlJbUVjV3M0?=
 =?utf-8?B?eFozM0FXdnhXbGFNeWZvbC84QTRkVUlxQ21WL2d1enc3Y3A4VzZSeFJDK2lL?=
 =?utf-8?Q?/ahPVDjWczSyC1K2tiYM4ZiOm?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?My9EK05TZXY2Z0VXMjl1bHZkejEwVDFINkkxdVdTR1lZLzRtZnoxQktmN1Vs?=
 =?utf-8?B?ODhnSWNKeTllWEN4Qzg4enVtREhFbWIyL0ZmcjlVSHhTL1R3L291REIzY2Z2?=
 =?utf-8?B?bHpvMTlkODBNNERtZG42dVRhQXRiMzFpb29lWUc5akpWRFhHU1VZeXNXODNJ?=
 =?utf-8?B?Snl4aEF1UUJxam9nSXJoN0cwRmw5MTlGQkVURTZlMm1PYmdXU1MrbXhNVDVu?=
 =?utf-8?B?ZkM4MWVvdDlISHBWTWVnbkR4LzZIQlNiUld1K21QTTJ4WnltUXl6L3lOcEwz?=
 =?utf-8?B?Wlo0Skc3Z2xSc08xK2NRU0NoMEZRV3NmVWhCQ3lmdUJST1VPTHErbkVoT2xx?=
 =?utf-8?B?dWFrV3JTRWthOTRHMWh3MTVkNElzYndWUWNjMUQ3WEtZMm90MllxNFl3TWUv?=
 =?utf-8?B?cWhPb3VpWUI4aUEwamxsYWF3WS9VdVNVUFlkNlZrNXJWbG5RUkZQbjhtMHI0?=
 =?utf-8?B?eEJrK2I0Y2pIak16MERsRWhycDhObDVLNWlZMEZ6dkJHakxkMy90VjhuMHFz?=
 =?utf-8?B?RFBuUjM4TDF4NzZOcnpJLzhBOEdmR2FPWUpRcVRESW00TFhCNXJvbXVFMUJD?=
 =?utf-8?B?S2o5MHgxenEwSG55N3IvMFdWYVZ4SDNTMFM0K1FtK0plRVlJL1B2NFByZXM1?=
 =?utf-8?B?d1FIUGlqb2lPVUdGZFQ5K2tKL1ZTVGpobytMSmZPTmNwSnpqTm9ZMFVrbmk2?=
 =?utf-8?B?aGdabTd3eldZU2I4UGplaUkxUlVrVnhqNUpkc0E5TzQrK1dvakFPeU5teTA1?=
 =?utf-8?B?NmcvNmhXRzNlWFNUSTNiL2hzMU1NNk5maFJZakh0d0RtOGFJSG1HSVVzcVpT?=
 =?utf-8?B?REhWU3ZDZTQxbTJBNy92MzNTZGUwTTlnTHk2aFhVSTJBN3h5OXEzV1JyRG01?=
 =?utf-8?B?a3F0NThlTXplN21JZ1p3MlZyV2U3MlA0dkVTU3M0WGkxRVZkYjZqeWJhT1RH?=
 =?utf-8?B?NTcvaGtabWp1bGVkZ2JTb1IwcWRuOUs4bSt6UEVobzBGaWFlN1FxN1p2V0I4?=
 =?utf-8?B?RWRYbUtvaUExWXJhdHVIMGt4dlM1dmR0d21tdWxmT1l5L21oSFpReSt2UmM4?=
 =?utf-8?B?MFlXeXZ0aDYrNXVPV1VQMjMvdmRqSEZGd2o3VlVLSGN4L04yeXNSaDVJZmNi?=
 =?utf-8?B?am9SRUswVUNyTmdaT0ExVENtcnF6dEFHeS9oR0M1YTA2UEtVZlF2OFVvWWp1?=
 =?utf-8?B?WVp1YllkZkVVWkVkQ3dOLzZrck1ia3ZaYjgrVEhHRnhIRHdGdGpPMnZMN2hF?=
 =?utf-8?B?TEdMUFU1R2lWMkRvVFZzaEhSWXBmUEtGSHhmT0lOazkzMHREMEhKM0xjR0NB?=
 =?utf-8?B?QWE2ZUZOSXM5VERGRld3ci9lRGlJQmwwYzl5WCtqeWdLQ2Ewb2VOVXQ4N2JP?=
 =?utf-8?B?SkdRTlhsK0lBNmJGeEQ2dGlYMEcwK0k1YWk3RGMzSkZUWWpYWEtGMFBZa2Rh?=
 =?utf-8?B?VTJycE9pcy9zOVplZU0vek54LzJ2VlNPOVl4NDUrdGVNK2FONnlTdnFqR25K?=
 =?utf-8?B?UkNSY0RuaThqRXgwN2Z3c0xOMG9XSVFiRG1LeDJBZzBiWTJvQXhhelRnV0Iy?=
 =?utf-8?B?M0JHU2ZyOGkwK05xZlhta242V1pHMlZlay9QNm91TXJhejVlck9qMGt6dDcz?=
 =?utf-8?B?VlduTUNTRVdFT3NmMStGVGJwT3gyZ1FNMm1pdjlMeGNzbS9HbmExdmZQdlMv?=
 =?utf-8?B?R0EwKy9pVGY0MnJESDh5YkVLQWNJVmNSZ2dRMWpLSW93UWc2eVNnbHRYNSs0?=
 =?utf-8?B?ejZTL2RUZ0lHTzlXTG1BaFdjUUhtTDBuOGNCYUxjUzNsMXpLQ0UwVzlzUU1M?=
 =?utf-8?B?K2wvaDkxSW56OFdIQ1VBbFVHUSsyU05kMkVxa2VZbGdNMHhLOFNsMjRWc2xv?=
 =?utf-8?B?aUp3RUhkeDBkZDQ2NXdmMjlBdWVlbmQyaWJMclZYRXJZMlVaT09oSFgwcWRq?=
 =?utf-8?B?aTBrT3l4MHZpaGRGZzRLbkhTMElGK2R5eEhldGNIeTNWcVlSRmI0NmtXUHFv?=
 =?utf-8?B?eXRsOWFJZzZwaWgvbXNTcVNTemFyS2J0YVkrbTlyeFN2dWoyYTBVcmkwalJa?=
 =?utf-8?B?bHUxY281YmRRWDR0cHZ1Ri94aHRkK0NxR29sdE01YnNiL2sxbXMwU3JRV2ZB?=
 =?utf-8?B?aGZMdTRIaWNKWnZMeHgwUUp2SnFNcGErSWtNb3ZXTjduUEpWYUFBZDA3U0xz?=
 =?utf-8?B?K1p5T013TDI2YXlwN21vVjIxaGZVMFd0WUpyWjlLeDF3bEx2MDUwbTR2OUxU?=
 =?utf-8?B?TFQwUlJ3dEtVYzJ4dytBcDJCUThuc3BIT2dwQW9rWWVEMDJ0Qm51WUttRVhU?=
 =?utf-8?B?eVd4akdWNXlsbXBtQTNIdGxqb0FHZU1PVVYrczlNQVRaNWFHQWdzdWt2d0JJ?=
 =?utf-8?Q?J3AIwyHOHLDRMJN0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14942510-b9d6-463d-e435-08de54272079
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 11:13:36.2443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9rUEEVYxNIfOJrMtJ1NTwjd5042/uZhwj5fb0qdI51gvh2C6wm/ER8Lpu52XWsjq0eOMs2aRuag15MHKaUgQN5zez/vUeRkYDKZFMK8GXbg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7683
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 2uyi9vHnXkzs8j8fVgn5pLxMk6wApwjf
X-Authority-Analysis: v=2.4 cv=e5ULiKp/ c=1 sm=1 tr=0 ts=6968cbe3 cx=c_pps
 a=/Dg/agRq+0IGp9KZEOxzXg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=5JnKibzKD7VPnva55iEA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA4MSBTYWx0ZWRfX4gBbfqORrwUJ
 wYRmWhSKz/sVrgYv+ZR/WOEqdrv1wO5icAEj+VXFMvEsV+5QU1gmToyTuk9+HUbFx9PZMqo3EVi
 5lOVU4YzhMsoR1jXZrRZhbkme87vN1ghDB32MIWZzTYGu3UH/TsADL0+BDij5QPYcIq4hdUZCZL
 xVHnf0PYE2s0Mrm9Kw0uqi3jASXsWm/HjgccvpuRzEp3uMDYIGAIL167hiZO554xNs/pShls8MK
 YRyDdEMSC9ARb4bCnWl2yzE387VjgbE3wDrbiQKprPdG4zL4/QUbVqeB10317BZa0nJ/rKdPROB
 cspEjvsOrSGXIYPCQuxmWUchJS+UjAFgxakHTl9zuwiXrO+4hm0UProMOGQw/eB2a1w84/afHVy
 FcFZib52t5us6t/eiASk8EGk/sv5K4QxBBmLNZX83hCSDBL3iALwuQW4lWvaU4SXAp6GsbQ+ZAj
 q4eprCCTjBUgDMcFxnQ==
X-Proofpoint-ORIG-GUID: EHQ2We3xaKgEO-Sznpc3XwWFfOo7ZMXr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 11:13:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229405



On 1/15/26 18:01, Alexander Kanavin via lists.openembedded.org wrote:
> On Thu, 15 Jan 2026 at 10:59, Robert Yang <liezhi.yang@windriver.com> wrote:
>>>> diff --git a/meta/recipes-devtools/rpm/rpm_4.20.1.bb b/meta/recipes-devtools/rpm/rpm_6.0.1.bb
>>>> similarity index 100%
>>>> rename from meta/recipes-devtools/rpm/rpm_4.20.1.bb
>>>> rename to meta/recipes-devtools/rpm/rpm_6.0.1.bb
>>>
>>> This can't be right?
>>
>> You're right, I was curious that why there wasn't errors for such an upgrade.
>>
>> I checked the PV and rpm file name, both of them are changed..., but I should
>> update the SRCREV, I will re-do it.
> 
> I guess there's no tag= in SRC_URI at the moment, otherwise it
> would've been caught?

Yes, you are right, I will add it.

// Robert

> 
> Alex
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229398): https://lists.openembedded.org/g/openembedded-core/message/229398
> Mute This Topic: https://lists.openembedded.org/mt/117276630/7304958
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [liezhi.yang@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


