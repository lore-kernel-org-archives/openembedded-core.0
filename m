Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06D04FEA814
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 07:05:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16690.1774422315027670266
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 00:05:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dvaFkR/j;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7544d13d61=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P4wMBQ188629
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 00:05:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=SBT/LjK0eQTHR+p7kI60REZSTNBhMGTqq2MVSPyB/aU=; b=dvaFkR/j8x68
	pWRpqLUtBHBw1KsGiNWYDQbpjzqn1vqvWfXS5PT13efVMax4RX1GvqJQaMyAFtYn
	ASiKgLA6qLnzfa7pBqjfdrA9wvdSURswxs8xqfLsKWeAoMEojsAyLH1AZVz+9B6B
	Q6KPBfMkZ4PHb6UUbxzsGTAz5uPKNkKLG/x8eOQUimFFFxkhIYqCH7gqE2pEFdw0
	XOUfFKWbvLDZcus8YKZ+J5Jcb0zSXdB8lEV0/OyGQEklPoauE/+PLYL5XND8Txjo
	XPWw+1/9nxzz3oRWrq2qNbLzRFoDxcoU+ca+eE/kBIyfFPtKUBAO5zKct0QzHdPe
	Vx5ZnouYnw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011023.outbound.protection.outlook.com [40.107.208.23])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1pkyce69-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Mar 2026 00:05:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ecBgkXYd115h+vqmsBnjATONIyuj6vIe+MG3fh9dnAgh3SgW/cpNNTYY89dthtlchAf2vvBrH4RrNjuB1OlelnIUcaiDFjHoKr5LlQRjJv1xIL+DLFN917AebtZe/xafu2KY/D2JeqE7qBGlR0H8Y/3bKQxjMP5cadX3tDyb2HKbIp/B/Fvl8Pmrhyd1pEMzkSkbwnZcYvluy0lapmZLAvhzIRl178+47+YSkbABJGevnxSEulLCVrctMAp/WZGejVwm7lvlOfgofJ8FGcSr2Y99JEAhr+3Ro7VvrlQi9OJ+JT2Zbc4xXnMyT9u4vv09w8QWuCNPnlrmMA9rt94+Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBT/LjK0eQTHR+p7kI60REZSTNBhMGTqq2MVSPyB/aU=;
 b=hnsoIgiGPlxOkCjCBCpfXogiHFVD6isD7Qe4lTQuZdXGm4dAYg+YdbydWh+kyAUudVj02SVNuafL8xx04WzGHSH4Z9X0CqkVj5gJfOBc/ZSKUWqf9f4uUuhEQmrLOv8S6xduRRn7pCg2FBrSrgZf229Xb5s3A1syyVhNeoDHNX1vnYLLdaIPUjtWmFdT5KCxsq/S3t/jd1vmDYHzr1n6rGkCwYy6en2xvuR5xjigvU9AlovtSjlcH+yNP7eHUIVKrQHAz7FW6/j4J8TECKn0jf7XatXYkymMFDYHak0yBWs8zeH17VTc3DeyKU55EWWR+ZzeUpPfwFNyEFqCQSjWBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ5PPFEF71E136E.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::85f) by DS0PR11MB8082.namprd11.prod.outlook.com
 (2603:10b6:8:157::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 07:05:11 +0000
Received: from SJ5PPFEF71E136E.namprd11.prod.outlook.com
 ([fe80::9c54:7158:b6da:aed7]) by SJ5PPFEF71E136E.namprd11.prod.outlook.com
 ([fe80::9c54:7158:b6da:aed7%3]) with mapi id 15.20.9745.012; Wed, 25 Mar 2026
 07:05:10 +0000
From: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "Ross.Burton@arm.com"
	<Ross.Burton@arm.com>
Subject: RE: [OE-core] [PATCH v2] python3-pyzstd: Upgrade 0.17.0 -> 0.19.1
Thread-Topic: [OE-core] [PATCH v2] python3-pyzstd: Upgrade 0.17.0 -> 0.19.1
Thread-Index: AQHcu2nJ1cuDZwuUj0++HRTUlZxVerW+050g
Date: Wed, 25 Mar 2026 07:05:10 +0000
Message-ID: 
 <SJ5PPFEF71E136EFD1B24D45F2073FD265CB849A@SJ5PPFEF71E136E.namprd11.prod.outlook.com>
References: <20260323031116.2513728-1-jiaying.song.cn@windriver.com>
 <84209a7f7a29421932c8f5dd95357039e6db8856.camel@linuxfoundation.org>
In-Reply-To: 
 <84209a7f7a29421932c8f5dd95357039e6db8856.camel@linuxfoundation.org>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=86ccdc32-23f0-471e-bc4e-d03996a6f463;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-03-25T07:01:36Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ5PPFEF71E136E:EE_|DS0PR11MB8082:EE_
x-ms-office365-filtering-correlation-id: fb25a3b2-27f4-45d9-f40e-08de8a3cdaa5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: 
 Izs0uyW6gtkt1qPsH2rBPlW9+nDDNs33B82Zj+hHn5QVtFlHVKQwTzDofyj4AyR7mX7m6oSOtjbWkB0uB7Uk0Vv4a81EvX9XqcPmdHZM2HaSHuiQLICeqU664XzuDuJenlqNlicfPL2ueb28OFm0Ls1/zyFeZ06ZB/x+Xu3klia3TpdmFlYZ1EGuGhEFe/6GmR6l9eBkZ6nCpGEvqoY7u5bvIa6QB0WHaDbwHssKcWTFNbE8wb+gud4VFygj2MEpXro9R0mP493JdHYAIfgyPJgRnKZnwaNzFAo5E4i3T+VR2DvzBWtKUXPaePsz2pwiIKWXb2dK0eW6dMI6efK0F3cetaqfjwBaTAEnAtqHTG8osjakC1AZrU0pNXdz1LFf0nLHnqXAZitfKgk0SrL48UWhCgK4l0bGP6uyORFntc6LZeyybVOEn2jnZhAGHvMwmsTEA07x816ZxeuvKx7AD0rBW0gTQx/FIkExRuhygGGXBjoseCRBOiXxORCLrg/M+1WGMNFoaXLImwDz1qcJrlePiBiHXn23beESv9e6jQn/GOEkbKo7PoSkdMVhVKLbBaKJImnH37Fc4/qCFBhFPsb6Wk3F5Ny5Xur+AT0NFeWjlxVooerOZi5UZ4/wJ/vbM+XxbJeRapZtMTCnVQ6/q51kBWWGzMlrOibRVFX7wJAHuhTMFqDQ7ZUd7j1BU1u6hI4jHpMvhHYHgwu4V+PrvH+UqoSxPhBHDZaEwe+a2NI6s3xxBOeerSVsws2TdYee
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPFEF71E136E.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VWttamtVaG9lY1l5aW50MTI5Qjh3NmVRVlZVdlFIZDRyWmNXeDJabG0vdlVI?=
 =?utf-8?B?V3ZrT1RrYUtYVkNwU0JIT3R0T09VT0tZbWFsSnBObXVWVTZtY00rQS9WbHNM?=
 =?utf-8?B?ZGhUMlp6NVZjMDcwYmVkUTduQWtoeG12MWJzOUl6TWgwNEFnTExDL1ZmMFR6?=
 =?utf-8?B?djRlSU1Nb3ByS254azZEZEZmRU5KTXVHSkdmWE8xbXhTOUlla1dyWDlUMkg5?=
 =?utf-8?B?UVRxclJkRHlGc25VbTZ0bHdRQnkzOXJDaVU0TW1xMFo1MVdkT05uTEMzT3Zj?=
 =?utf-8?B?UEpqcG1iQVZaekI5RVJwNXZ3dkF5RTJDL25DdEsrNkptWG5wT2lWMkpKT3dl?=
 =?utf-8?B?ZVFTeGV1dUZGdktLYkltY1l2TndPU1N5U0hoMGpyb0Zka0hKMkZDQnpXV252?=
 =?utf-8?B?YjRzcXlZVFFUNEM3Tlh5aW5CQS96WFlqSWpqeTYxT005ZW9GTVVYV0N1TFNu?=
 =?utf-8?B?eW1SYS9vbDdKUU1vdEh0Sk5MR0FVdlBweW1hZjFpcjhPdXBNMjVEZG5hN3Bv?=
 =?utf-8?B?Q0tRUkR5MVgzN09GeGx3MXkrRU1iNXRJVTdISnNCdHgrQnRlV1Uwa0Fzc3cw?=
 =?utf-8?B?NWlRUGhzcktJNW5iWEgxaEExRFU2amp4RkhZR0hSWEhXQ0NOM3N0RklGVGZW?=
 =?utf-8?B?QkVIMWt1cUNQZk11N05RbndldWduREdDWUhrbHB0Smo2Rmd0Yk0xTVNRQnFK?=
 =?utf-8?B?UUhNQjM2cjk1LzdhcmtUUnBhVHNOMmxOTFUrSDRVN1hSWFRYMjNxUVByZURJ?=
 =?utf-8?B?KzRtb2VFL1RaQXUrbkxqREV4RXBEUFhQdXByd2lHcFNDbTdnaUdJTzJ6em04?=
 =?utf-8?B?L2FZcGtYNkNTd2ZkTlZRU1NQaTdpRFlDNFlKZkVrVzZ1OGpyVFFkajhHU1RY?=
 =?utf-8?B?VUYzb01SYkJNUUNwVEI4aE9oQ3NjNUtRMzRqUFpuWUFYUytaVzQ4ek45NHNl?=
 =?utf-8?B?N0xmN3ArUnEwb2ZTZlFBUU96L0d5WlQyOGVSY0R0MmdCdGN5SGxWL0ZxcU1E?=
 =?utf-8?B?YStBSFhzMVcxS25jOUtpU0phS2cxMUM3RFA0U1BjWDB1RjhlMS9wWHhrVThM?=
 =?utf-8?B?WEhnZWoxYXhxTU5tYUIzWFZLL09jOVpuRXN0U1pUcFdrRFBLY2l3WVRyK1p6?=
 =?utf-8?B?R3lYT0Vva3NIbk96bUFQdWh5bUhKOGJUdTQrd09wME5LK2I0dXE2YVZoZ0R1?=
 =?utf-8?B?b3VDNEFkS1FNQ3EzOTFBVlJuOVA1ZWJSanJBekhTRDZuSlM0QXhCR3dDSzVp?=
 =?utf-8?B?TGw2Um1ESmZmNlc4V0VPZGl3Mk9QUDAvVTVka1UxQWVFNCs2djNhaEd1RWph?=
 =?utf-8?B?akFVL3dpWS9DZUNicVR4Q2xYeTk2WWxwMGtxRjdOVml6SEo2bTE0MThwRzIv?=
 =?utf-8?B?Q0hqN1ZLZ0EvRDVycmdoUGZpbmVucDFKYkNHOHh0RDF3UW81ejRRVVRTYk00?=
 =?utf-8?B?Y1M3b0F1VTB1ZE5sRzc1eHNsWDFPa0dxQURTMi9VTUhndUtWcnZzK2NaYVRz?=
 =?utf-8?B?R0lZdHlxR01laWMrSWFrQm1HeDZNN2J1d21jdFloMldnK0JlUkZtblFpbzht?=
 =?utf-8?B?Rm90NVU4Z25vVm5WUFh5RWRoM1BEcXE5dHI1dG5BMEV5Q3J2R1VFdGxNR0dx?=
 =?utf-8?B?bDZyd21Tc3lHTm9Uc05ZNC9pR01pRjRDT3AzbGozVnhpOFJKd01hQmZPRUFU?=
 =?utf-8?B?ak55RmNzUG1ldUNiWWxmWEdkU3QxNStlUEpWNGlTZWNPakJ0ZnNzLzJBMlJK?=
 =?utf-8?B?R29vL092NzNLY1RwTW1JVzFCVDZXK3B4RW9TQjZoRWxaaDEzU094Q2p5ZXpv?=
 =?utf-8?B?MzNJN3MyVzA2cnpQajV6UVlpcUkzVzl1VlBRZE5CUnZIRUVhVU9HbUV5Qy8r?=
 =?utf-8?B?VW0rdm1TREcyM24rL2o0N3IxN3FoWXVhNUtqeEhEOHpxTVU2MVhVK3ZITjAx?=
 =?utf-8?B?NDQwZ2N2bXBUV0s3cjBvMHNvZnRLcy84S0E1TUlyL2VNTlVESjh1cVJsaWdK?=
 =?utf-8?B?Umd4cHNadW1CaGFWRnBJWFgrcTRydUVlL21Ycy9iN0lPaFFkSWlicFQzNWhS?=
 =?utf-8?B?OVBnNUdrMkxUdU9kRGtaUDRBMTlOc1MwQk5TaGk5TWtGK0JzajZPK1NUQld4?=
 =?utf-8?B?aTBYNUQzZ253NHhKNkxzbnNWQ2hGRmdraU05R1JhNkpqeWFBN1BYeW5pR3Jt?=
 =?utf-8?B?SGhjSDdmRVg4NHFrdHhhQ3Qva1BMbmxzbXNCSTFSU29FM2tvbXpSN2NxYWNh?=
 =?utf-8?B?Nm5wM0w4bWU0eCtrQkd6VGxoZHN1UHpPT1M1cUNaY1R3SG8rKytlcWpRalhR?=
 =?utf-8?B?MVphRWtGdGtWTVFPa0tjTys0OUU2TzR2d0NvRmpWT1lKeUVlMk91Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	bZXsFsggh7O9IV+RWtZMeeAnvL1prfxocLKM7sWrtuI7PUD2n0fgTHbC9fEOg+Gea+yHdxbVG2rEsaJD5MB6yfMgG42zaNAo9ZDaR8+PRpBreGEIfi+G2tB/fYw0w8R1AdqdtXLFUJL2Lvw1mUX+fetokhCcGBLZa0Nnt9z1HmmzPL/K5qluJg0UrpzFhxptghoOCwiyZyplU2ajDvwu+mNxgoqt7asSYVU97Dy8p9hgBAPxLU/uR1SGI+DgXFiRBxmqSDYNz9y707op84tGHKiXRbca3BoYTgKS5Zg5ZwAZro1/TUgUitsF8hSHZsieh+IJdw551gXsmmWajVVkWQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPFEF71E136E.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb25a3b2-27f4-45d9-f40e-08de8a3cdaa5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 07:05:10.4060
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZHZg9Z8DP9xLS4wIlPXgTGqyXhdXH1XSGeeL0cqTrIXDrArqGsY9NHzraRvz/r7n5MiTRWveebQ84H13DAniidnRakqskb1kCZVhJvEvaxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8082
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA0OCBTYWx0ZWRfX7CMD9X5UECh4
 iPOTj+s6tgIWBFDDt2T2QD2U18WDbCZRCBT/+ebfn38u1XsUGIDezQV1OrwmiaiH6FUyjiE0l1i
 xvlDZ3/3DTrCqLEISX5TB7ABTV/fCdy9wv0AeQG8NlskrF/nnFsmNvFgRzGAplOF/3DkUXgtbOB
 CB6re06fFIhvYZC1xhEYwJ61SbXeJKdbctcxyj/v9Lmns4wmxxppHZTYIs7Jq1pxXg4xMd2chRh
 wSa+hGHg8oLkzvgLv+eGR52FSZdKuTzgdbZf/Jnml7mvZNKKxVPjEKklYax9fZi92ELc73q6LU9
 ebHhpN/mGmjNjVFD89sEaB7F36zpKLp22+YZzYnKsIhrWl8Qgqx5Xe8LQCEvMurUuTQNgP4Me2T
 0VSr1DK3IKmIfBZwaz0XJIosOFGQp3YByVhHXV0tAXUVZFA8huoMB6MaENY4kNvoxa/RXaRbWhZ
 x51nFVzKK4LU6EnGndg==
X-Proofpoint-ORIG-GUID: 3h8VgKs7Ck4rZyf3_GQztr0Bzwr2h0Sa
X-Authority-Analysis: v=2.4 cv=Scr6t/Ru c=1 sm=1 tr=0 ts=69c3892a cx=c_pps
 a=6gnvs+K4iRzQbkKjpWE4KA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=Q4-j1AaZAAAA:8 a=nQYV5XC8AAAA:20 a=1NWNoF9oAAAA:8
 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=pGLkceISAAAA:8
 a=UBFVfQAFWYhimOpKR3UA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=97APRTa-CG6DvPMFVxHL:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: sSxqQjR0ileLOktqS1LirfwONAbC3EvQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 07:05:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233858

DQpIaSBSaWNoYXJkLA0KDQpUaGlzIGlzIGNhdXNlZCBieSB0aGUgenN0ZCBDIGV4dGVuc2lvbiAo
bGliLWR5bmxvYWQvenN0ZC4qLnNvKSBub3QgYmVpbmcgaW5jbHVkZWQgaW4gcHl0aG9uMy1jb21w
cmVzc2lvbi4gDQoNCkkgaGF2ZSBhIHBhdGNoIHRvIGFkZCBpdCB0byBweXRob24zLWNvbXByZXNz
aW9uOg0KDQpodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29y
ZS9tZXNzYWdlLzIzMzg1Nw0KDQpJJ3ZlIHZlcmlmaWVkIHRoZSBwdGVzdHMgcGFzcyB3aXRoIHRo
aXMgZml4IGFwcGxpZWQuDQoNClRoYW5rcywNCkppYXlpbmcNCg0KLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCkZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5k
YXRpb24ub3JnPiANClNlbnQ6IFR1ZXNkYXksIE1hcmNoIDI0LCAyMDI2IDQ6NDAgUE0NClRvOiBT
b25nLCBKaWF5aW5nIChDTikgPEppYXlpbmcuU29uZy5DTkB3aW5kcml2ZXIuY29tPjsgb3BlbmVt
YmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzsgUm9zcy5CdXJ0b25AYXJtLmNvbQ0K
U3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggdjJdIHB5dGhvbjMtcHl6c3RkOiBVcGdyYWRl
IDAuMTcuMCAtPiAwLjE5LjENCg0KQ0FVVElPTjogVGhpcyBlbWFpbCBjb21lcyBmcm9tIGEgbm9u
IFdpbmQgUml2ZXIgZW1haWwgYWNjb3VudCENCkRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0
dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNv
bnRlbnQgaXMgc2FmZS4NCg0KT24gTW9uLCAyMDI2LTAzLTIzIGF0IDExOjExICswODAwLCBTb25n
LCBKaWF5aW5nIChDTikgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+IEZyb206
IEppYXlpbmcgU29uZyA8amlheWluZy5zb25nLmNuQHdpbmRyaXZlci5jb20+DQo+DQo+IENoYW5n
ZWxvZzpodHRwczovL2dpdGh1Yi5jb20vUm9nZGhhbS9weXpzdGQvYmxvYi9tYXN0ZXIvQ0hBTkdF
TE9HLm1kDQo+DQo+IFJlY2lwZSBjaGFuZ2VzOg0KPiAtIFJlbW92ZSAwMDAxLVJlbW92ZS1zZXR1
cHRvb2xzLXZlcnNpb24tbGltaXQtb2YtNzQucGF0Y2ggKG5vIGxvbmdlciANCj4gbmVlZGVkKQ0K
PiAtIFN3aXRjaCBmcm9tIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEgdG8gcHl0aG9uX2hh
dGNobGluZw0KPiAtIEFkZCBweXRob24zLWhhdGNoLXZjcy1uYXRpdmUgdG8gREVQRU5EUw0KPiAt
IFJlbW92ZSBvYnNvbGV0ZSBkb19jb25maWd1cmU6YXBwZW5kOmFybTp0b29sY2hhaW4tY2xhbmcg
KHNldHVwLnB5IG5vIA0KPiBsb25nZXIgZXhpc3RzKQ0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBKaWF5
aW5nIFNvbmcgPGppYXlpbmcuc29uZy5jbkB3aW5kcml2ZXIuY29tPg0KPiAtLS0NCj4gIC4uLmVt
b3ZlLXNldHVwdG9vbHMtdmVyc2lvbi1saW1pdC1vZi03NC5wYXRjaCB8IDI3IA0KPiAtLS0tLS0t
LS0tLS0tLS0tLS0tICAuLi5zdGRfMC4xNy4wLmJiID0+IHB5dGhvbjMtcHl6c3RkXzAuMTkuMS5i
Yn0gfCANCj4gMTEgKysrLS0tLS0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCAzNCBkZWxldGlvbnMoLSkgIGRlbGV0ZSBtb2RlIDEwMDY0NCANCj4gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXB5enN0ZC8wMDAxLVJlbW92ZS1zZXR1cHRvb2xzLXZlcg0K
PiBzaW9uLWxpbWl0LW9mLTc0LnBhdGNoICByZW5hbWUgDQo+IG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24ve3B5dGhvbjMtcHl6c3RkXzAuMTcuMC5iYiA9PiANCj4gcHl0aG9uMy1weXpzdGRf
MC4xOS4xLmJifSAoNTMlKQ0KPg0KPiBkaWZmIC0tZ2l0IA0KPiBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1weXpzdGQvMDAwMS1SZW1vdmUtc2V0dXB0b29scy12DQo+IGVy
c2lvbi1saW1pdC1vZi03NC5wYXRjaCANCj4gYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcHl6c3RkLzAwMDEtUmVtb3ZlLXNldHVwdG9vbHMtdg0KPiBlcnNpb24tbGltaXQt
b2YtNzQucGF0Y2gNCj4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IGYyOTEwMzIy
ZmYuLjAwMDAwMDAwMDANCj4gLS0tIA0KPiBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1weXpzdGQvMDAwMS1SZW1vdmUtc2V0dXB0b29scy12DQo+IGVyc2lvbi1saW1pdC1v
Zi03NC5wYXRjaA0KPiArKysgL2Rldi9udWxsDQo+IEBAIC0xLDI3ICswLDAgQEANCj4gLUZyb20g
YmM5Yjk3NWM5ZjQxZTQzNDgxYTJlYjA2MjNiNDE4MDkyNmJhZWNlYyBNb24gU2VwIDE3IDAwOjAw
OjAwIA0KPiAyMDAxDQo+IC1Gcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPg0KPiAt
RGF0ZTogV2VkLCA5IEFwciAyMDI1IDE0OjM4OjMxIC0wNzAwDQo+IC1TdWJqZWN0OiBbUEFUQ0hd
IFJlbW92ZSBzZXR1cHRvb2xzIHZlcnNpb24gbGltaXQgb2YgJzc0Jw0KPiAtDQo+IC1VcHN0cmVh
bSBzdGlja3MgdG8gMC43NCBzaW5jZSBzZXR1cHRvb2xzIGhhdmUgZHJvcHBlZCBtc3ZjOWNvbXBp
bGVyIA0KPiAtc3VwcG9ydCBiZXlvbmQgdGhhdCB3aGljaCBpcyBuZWVkZWQgZm9yIHB5dGhvbiAz
Ljkgb24gd2luZG93cy4gV2UgLWRvIA0KPiBub3QgaGF2ZSB0aGlzIHByb2JsZW0gb24gTGludXgN
Cj4gLQ0KPiAtVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtPRS1zcGVjaWZpY10NCj4g
LVNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+DQo+IC0tLS0NCj4g
LSBweXByb2plY3QudG9tbCB8IDIgKy0NCj4gLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkNCj4gLQ0KPiAtZGlmZiAtLWdpdCBhL3B5cHJvamVjdC50b21sIGIv
cHlwcm9qZWN0LnRvbWwgLWluZGV4IGRkODg1ZTQuLjVkNGQ1MTEgDQo+IDEwMDY0NA0KPiAtLS0t
IGEvcHlwcm9qZWN0LnRvbWwNCj4gLSsrKyBiL3B5cHJvamVjdC50b21sDQo+IC1AQCAtMSw2ICsx
LDYgQEANCj4gLSBbYnVpbGQtc3lzdGVtXQ0KPiAtICMgc2V0dXB0b29scyA2NCsgc3VwcG9ydCAt
LWJ1aWxkLW9wdGlvbg0KPiAtICMgc2V0dXB0b29scyA3NCsgZHJvcHMgZGlzdHV0aWxzLm1zdmM5
Y29tcGlsZXIgcmVxdWlyZWQgZm9yIFB5dGhvbiANCj4gMy45IHVuZGVyIFdpbmRvd3MgLS1yZXF1
aXJlcyA9IFsic2V0dXB0b29scz49NjQsPDc0Il0NCj4gLStyZXF1aXJlcyA9IFsic2V0dXB0b29s
cz49NjQiXQ0KPiAtIGJhY2tlbmQtcGF0aCA9IFsiYnVpbGRfc2NyaXB0Il0NCj4gLSBidWlsZC1i
YWNrZW5kID0gInB5enN0ZF9wZXA1MTciDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl6c3RkXzAuMTcuMC5iYiANCj4gYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl6c3RkXzAuMTkuMS5iYg0KPiBzaW1pbGFyaXR5IGlu
ZGV4IDUzJQ0KPiByZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcHl6c3RkXzAuMTcuMC5iYg0KPiByZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXB5enN0ZF8wLjE5LjEuYmINCj4gaW5kZXggYWY3MDY5YjZlZC4uY2NmMzdl
YWNmMyAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXB5enN0ZF8wLjE3LjAuYmINCj4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXB5enN0ZF8wLjE5LjEuYmINCj4gQEAgLTksMTIgKzksOSBAQCBMSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1hZWRiNWEyNjc5Y2QxNTUyZmI2MWMxODFlZjk3NGI5
ZSINCj4NCj4gIFBZUElfUEFDS0FHRSA9ICJweXpzdGQiDQo+DQo+IC1TUkNfVVJJICs9ICJmaWxl
Oi8vMDAwMS1SZW1vdmUtc2V0dXB0b29scy12ZXJzaW9uLWxpbWl0LW9mLTc0LnBhdGNoIg0KPiAt
U1JDX1VSSVtzaGEyNTZzdW1dID0gImQ4NDI3MWY4YmFhNjZjNDE5MjA0YzFkZDExNWE0ZGVjOGIy
NjZmOGEyOTIxZGEyMWI4MTc2NGZhMjA4YzFkYjYiDQo+ICtTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
MzY3MjNkM2M5MTViMzk4MWRlOTE5OGQwYTJjODJiMmY1ZmUzZWFhMzZlNGQ4ZDU4NjkzNzgzMGE4
YWZjN2Q3MiINCj4NCj4gLWluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRh
IHB0ZXN0LXB5dGhvbi1weXRlc3QNCj4gK2luaGVyaXQgcHlwaSBweXRob25faGF0Y2hsaW5nIHB0
ZXN0LXB5dGhvbi1weXRlc3QNCj4gKw0KPiArREVQRU5EUyArPSAicHl0aG9uMy1oYXRjaC12Y3Mt
bmF0aXZlIg0KPg0KPiAtIyBjbGFuZy0xNiB3aXRoIC1mbHRvIHNlZ2ZhdWx0cyBvbiBhcm0sIHRo
ZXJlZm9yZSBpZ25vcmUgZmx0byBmb3Igbm93DQo+IC1kb19jb25maWd1cmU6YXBwZW5kOmFybTp0
b29sY2hhaW4tY2xhbmcoKSB7DQo+IC0gICAgc2VkIC1pIC1lICJzfCctZmx0byd8Jyd8IiAke1N9
L3NldHVwLnB5DQo+IC19DQoNClRoZSBwdGVzdHMgYXJlbid0IHF1aXRlIHdvcmtpbmcgeWV0Og0K
DQpodHRwczovL3ZhbGt5cmllLnlvY3RvLmlvL3B1Yi9ub24tcmVsZWFzZS8yMDI2MDMyNC01MC90
ZXN0cmVzdWx0cy9xZW11eDg2LTY0LXB0ZXN0L3B5dGhvbjMtcHl6c3RkLmxvZw0KDQpDaGVlcnMs
DQoNClJpY2hhcmQNCg==

