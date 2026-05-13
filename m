Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B57CD4F24
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 08:16:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2636.1778660202296037983
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 01:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DvGCE3rf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9593f74c6b=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D42R4P217788
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 01:16:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=sELQTjlGjl9AI+JYsKbMi/TyiiYqrhNE7wKLI59+pO4=; b=DvGCE3rfL37A
	EdWcgzaDUUbRl9nXSgl2EqSadBHEFbGYXzMQZKfBnNoICAb0tvggXf+eHFsJKe2z
	UasbnyKagEz3VZG6FYL2aVS2uj4lYP6BjdkonkVu1R6ywXkRA7AmDcWQofSG+wdM
	f2dGtQWXFNmH1kIYjopgY47POd0Bh1bIJPJdZ+8xPQ8l84uoBTs0mJGGNPcyuhCH
	abxywe8ypvsK9YB/9ehy1EID7XsxWcJGFRCcs8U0VesmWKYHWVA51rJdOZ+62XIa
	YUovlmNgtVMNxZx5Xb/ub/DXEtjl0V/lf98oSLpwtO88RmVrB0Jgv7YukhfOpE8+
	QKpDskHgog==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010055.outbound.protection.outlook.com [52.101.61.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e4g7g8cct-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 01:16:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H8VR9fKPd8eI+1sZr1LOmDqSKAOcKmXq/hZEHQr0EmCkZnUimeb4qx7SitNXLRVhddTl+eOL1Tl6b3F1kpGcDz3V3AS0c0KUHviTVFPDuVSXSkqSh5jDdWNJ1dZonSjgM2W7tEPKLWaTs3qXqOH87pAFL+Rw0cbBCUvsohiQEXrxPA6jc5QeXFKOItw9sbCru2X18c8HEYcAeEh1ebgkei5IMg4LvJE0HupkIZbx1sQG2hpeHDoSZIjKuHPq3Do2JA/YUBzVJbyQFVO8yiaU8stpr8xl5cldPmh1wg6nqzeOEoEXi/8Ccx8E3pd6cY5u6cjXWwNAMXkljofBJ5lkJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sELQTjlGjl9AI+JYsKbMi/TyiiYqrhNE7wKLI59+pO4=;
 b=abeJZlq1diE4brhKmDVtOoMp9lYrk1Z0S1vZBz1Eu0IOtLUCgrd2kb6N2JrkQFFIOuxQhc49kHK9nsqGzXXvZ6LMDmhMzd3B09/6NQ2pD4I2xNohnQU+YowbQCDUb3ZFmnxxoruHML5Xq8jHIJzlRzwpwiUpyfasL6hRumSdmdpVGij9Xyqzqp2w5rsrq79rXaKBwSuPESbpKd1ZcdPyqgBLUWqZP/m9VY79mI2SCbwh++eGiEYO5GjlJFbjoz4l2en+DgxdQA+snKSxHiiE2gs3Fo4s3Oa/HRoz2OJ80wuiHy59gOtR9lTwxjOmc+yydXEd+ZnoTtNab78EiII6xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by CY8PR11MB6842.namprd11.prod.outlook.com (2603:10b6:930:61::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Wed, 13 May
 2026 08:16:38 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3%6]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 08:16:38 +0000
Message-ID: <28f86457-56d5-4716-a6b0-2e81e9e39631@windriver.com>
Date: Wed, 13 May 2026 16:16:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 2/2] strace: upgrade 6.19 -> 7.0
To: openembedded-core@lists.openembedded.org
References: <cover.1778659781.git.liezhi.yang@windriver.com>
 <19dc384322b778c446534c54666b60f0eb721827.1778659781.git.liezhi.yang@windriver.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <19dc384322b778c446534c54666b60f0eb721827.1778659781.git.liezhi.yang@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SE2P216CA0066.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:118::10) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|CY8PR11MB6842:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a0c5f92-5a9b-456f-e75a-08deb0c7f457
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|4022899009|366016|3023799003|11063799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	tt5kxXkKp19yW+8Oo93dQqmu1zUqZ1bAvtFj9AItgpx/mXzkbWkFljvKJDSEfaBaTnQQYi8agIP0rRVyknqLgucK14be2Q5RIYN1bG0+LwbbJxnvNOjaxwyBMtWHoCDwIGwhj+x6r2TXp19NyF83Do8xM9HGuzuJwcWg+iHUiUW6W535T5m2HxMfbN5wZicNqpyZ8P+EeyPfvmoB8GGGJ68uD0bD32C21jibbXJqmgjKwXVeMDyR8d+ZftN/RCjUqUFT4EzwcyoB8CRuLmXzDR5g75EaURO48xVycC2GaUUWTCoA1N5i7H8cWvAtaUrhEzRam5yPvUmZvOCkHKv9bdLP1+/klj62mNE/s7k5MNxbyTjmO14GWk7olQEEi/BqKIGsuvVzA6bBAZYc2oL+CzycmEhZp22FvF3LyYqvLHWRUKxB6oaUNCp1+fAWR8Sb7BnM+MMkFZaJj+9b578+GSyqDtCkRIsxN/XcysIomfpfy4za2h43qz9pQjU21qcGVzwHxqyjIKRVMR1NcEl6I6GiSLGPA/VM99pTN7ARHpK93KNMLhHr//c46sKo0kFzVvhFWiZjT8wVMu3POChLAPWdy1zPNeDorlxTnI18/rkjIleqp9xJgtvFu8Q7utCn9maSfVsOdOLXfmb2ufXdnw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016)(3023799003)(11063799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YlhzYkN6TTUzVUZiZmEvM1Fmb1NiM3duVmYxNmJCR2Vla2JySlBndk1ocE9F?=
 =?utf-8?B?blhwUFlmNVNNL2JwUDRqZFVVY2s1QWMrdDF5Y0IzYlZHelZyZEtVZWV2dzho?=
 =?utf-8?B?OUEwNUZzTFlCNkV4T3hETzducy9idC9DWkRRVWdYNUpnUGJxTHdWQnJMckty?=
 =?utf-8?B?T0RQdlQwWGN6VDZPS1d5bk0wU0pFazlVU3dzS1R5TGYxZ09WNkFYeENwdThj?=
 =?utf-8?B?czNNUHRLamNtL2hZckJ5QWkvazJZeWpndFN3UklHbFdQOE9PejJhem5tc1JK?=
 =?utf-8?B?WlJlZnQ4em9abGN3bnRxRFZZbFdlNUlwVHUrRGR1cHdmTW5rbExxS0p3S0hD?=
 =?utf-8?B?dUNrcVlsN3YrZWdNZnZSSVpqbTFvOWN6K1RKMmVsWGZuNXJkcS9YMHpIUXd4?=
 =?utf-8?B?WUpjcCtZd1prZEloN0xVSHM2TVJpOHl1ejFUR0hiTnFBdlBFUUk4a09mazdC?=
 =?utf-8?B?N3F2eGs0Vk5xRUtNWGRRNFVkOGxMUGZLbFJ6ZW5Na2NWT3NZMUpyZmY3QzBS?=
 =?utf-8?B?TTlXdG8xOEFFM040cU9lMitnN2NiUXlMamRXa0FIa0ZVV2VBcVpscUpwYS8z?=
 =?utf-8?B?WEgwcHFkeTFLS3pGb0hSTmo1WUo2RWRVZ0o0TkgraGl3Ymx0ZHZwREpySFhk?=
 =?utf-8?B?cUpvT0Nkb3lMVEVJS1l2bXNWRnVwS0F2Q2tWYWFwczNKY09EdnN3U2FSelU0?=
 =?utf-8?B?QWdOaFBxYWM5R2JQSFVuTVg2QUxvS1ZjOEZTRGVkUzhLZXNJbWM1RlFYcG12?=
 =?utf-8?B?ZUcrdytTN3BOZi9VNEloWW53d1c4WTA1ekZFbitDVmNTSStWdm10ejd6UThl?=
 =?utf-8?B?TjJNNVNUVHlBMlBaQU0xREZSSi9USVhhRnlnK1l4ZWUydGI5SFluM0RDbzlj?=
 =?utf-8?B?YlBkWlIzQUxnem8wa1lYYktmWjcyMEs4eXFheDFmeVlDVFEvMWp0QmxKOWll?=
 =?utf-8?B?VzRZM1BWdEJsNHp6UEFSbmYzMGdmbCtnMTBwcGxMdmV4ak9STnBNRndEOE9T?=
 =?utf-8?B?MlpsZEJiaTUwMjZLd3dNVUFlQnVzQmgyd0l5eWJiVDZIaWlBRFV2TC9yTUts?=
 =?utf-8?B?aHhBRWZjcFJZa2FBbWcwVTBaWU9TNUtueWpvN0xQQjZ4UElIQzZHY2RpZWZK?=
 =?utf-8?B?azlUem1Hd1VSZkR1VWQzelRzS1NRRm45U0t2QjdBNEJnei9jYldJeXNKQ0dZ?=
 =?utf-8?B?cUltYXFUSjBUNEF0bUJkSm9peWlGUThKYTNKSXdTV2hYV0dOQ1JEWFFNN1A5?=
 =?utf-8?B?SWxMNDIvUW1kUmI1Ky9jMjFiZitLK0JwUUF6cTF5SnJmdmlCZzZvZ2w4TnZ2?=
 =?utf-8?B?c0ZwNmV1MXEyUDZKWHZiWFlyd2tONDVaVlRPcUYvVFZPYVJRUC9wSEdTWmR3?=
 =?utf-8?B?K08xM2JKUGUvcG02QWhrQjNBQnNrbDYwTlViUWROVnpoMGdKcGdQZi9YZDVO?=
 =?utf-8?B?bHpBK21vTzBwYnpEU1NHL015NmFKVEhZZHBRNEI2ZkdmYlNzeGorSlFIVDhz?=
 =?utf-8?B?aXN2SmVBODZqWHlkRnBHdExHekdqR1lwODNJWU5KL1g0QTB2dUl2YTBHMk9G?=
 =?utf-8?B?MGdDZ1Foc2hjYklMNXZTbjdzTzVUeTZ4N3BHV2VLWFJVckNlaUN3cllBeTBp?=
 =?utf-8?B?cVpVM0hpY1BTSXRSYit4MVovMVRyWnV4MW5zeFJiMEtRQ21mVmhoeG9lRGt2?=
 =?utf-8?B?MjExdzRJdE9PZWtxZDR5cHorZFlCMXkvR3hxeUxuOUlmQzUva21oZXR0bXVN?=
 =?utf-8?B?aWpiaTI2OGs5d1dVVnVwd25TZVBBdW9JRU1TMGlKZ1NSL016VjVybEFFVzVr?=
 =?utf-8?B?SFQvVkc5N0V1bXpwVkRrcWt2ZVVrbFJLSUJmYklrMzI1MGxlM1p5cWFqRDJv?=
 =?utf-8?B?M3p6anAxMHI0R2orTTBEL2ZjTEVua0xDdlVDYStBa2VXS0tpakFsZjZreVVo?=
 =?utf-8?B?dHoyTUFpcEhRUTlUZTlBWUtNWWxKbERlenVlL2czS0NOREM5TW5NeHAwaEl0?=
 =?utf-8?B?aFFYT2I5NmQydUtkZTg1bVNsYWQwODFUaEY2S2RWQ2ZQS0FTL3dxb21zaW83?=
 =?utf-8?B?NHdGbzVrQmN6aFRlQUY5ZERUMk9MK0lKdkxxWFo3WUcvZUJBY21PNU1QUVE1?=
 =?utf-8?B?L08zOFA3UHZFZUpsdFdVT0lEdkcvOVZ2QkNCVFpLalpMbDZ3akV2dXI0cVd3?=
 =?utf-8?B?aXBlZHZEZCtNbEs4a2RNYXV6NWY2SEc2a0E4a0drTFhndnM3YTR6NmNxTEw3?=
 =?utf-8?B?YTdxUzh0TFBiUlJwSVNzSVRsMCtPTjdLNFNqS3ZveXk4QmhpUG1LWmZiMlpK?=
 =?utf-8?B?dUZEVGF3K2JRSHpybncwMG9vRVU4TDZCM3luTWNaakFTTXBmTTNvUT09?=
X-Exchange-RoutingPolicyChecked: 
	RYdc8IbfvdKp4Jo/WCZ3AjWfMQD1OVPViVTB+GHlSOwVGWqwJ7rwoW+BTAIey8wbpUz6l/ZN9AGvNwBGQQevef1FU4iVgLygmNYMvVe0CIHFDxhciV1kcZUUUsvCs8sdjvYkvG72SuB1ggHaYETkZP4ZakR+GsbWW86XK7NXbx38MM89u1CaIqt3ea8c9F8oOcDMSwXS5+ukDRlidJ+gbNp0966FAmBm6u6wAnWBgFCrhjdQCIM6l3FlmdsPMk8zKRHN918Sp+TfdSVzFyxhooinuWWSXMtPN59y4+n3OUW71NMGuBzRji0uxG7+zcaOfXoqNLlh1VFt5HVFng1NsA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a0c5f92-5a9b-456f-e75a-08deb0c7f457
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 08:16:37.9033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 71NFzGuaJf8AdQQFvrEziNJakxfVcQ333ArQMdAYN2XY8lAoBqIafwCpR1iVDT4EX3Y49uwFtjrSK8iOCxfG9tyuNqmYGPGvFSNCRlqdWhQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6842
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA4NCBTYWx0ZWRfX8L7BGvoEdBQp
 qJMRJUHms4MrJs3Y9S7CvVoaAmfMxnmonzjUJgnqHpC4NJpTUC5d776jlyXb9qcYjxRiy4cUDR4
 vciKHv3KmAIoe3kCVKtrccBPgu6oid+qZmHXZlsKjnv43nBPRrstkmhkFHBuOhvWT2uT8c50D8b
 e7EOVIRQk2G6/6E90a4r+/EXGF2zMze0t8IgK5VbVpWp+mZSn5iAxqlVfcGa5S2TXMVlAqmNceI
 sYvc64i30vfh/KQUAl/F0zQcw03dsdyYfHNMG1Hl7jwOg42VlhX9m8Z17VIrRujDbzKWvztl/8W
 v8vVEw2wGXrgEisJ+IsR34b6L+sF2m/WWBD3MPTnTLFon2o6ZG6ALmDz+3P/+ngAM3gKVsIvslY
 fTdp8jyTVx0an/BcmsdSdq+fID/U5dT8EdFJI1Bp2KWYKO3FBerSbmN/wxh3cbAmHugA//Z5DGg
 iXYTspeWSaXK44UGUYA==
X-Proofpoint-ORIG-GUID: 2Qulyc-wqLuM7-sKYV160J8RXwao8Mh_
X-Proofpoint-GUID: 2Qulyc-wqLuM7-sKYV160J8RXwao8Mh_
X-Authority-Analysis: v=2.4 cv=Q7jiJY2a c=1 sm=1 tr=0 ts=6a043369 cx=c_pps
 a=WlRzkYvQEyJpYq9ouSSplg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=5KEJ3k9QAAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fk1lIlRQAAAA:8 a=Sv4y0yS6AAAA:8
 a=QyXUC8HyAAAA:8 a=ag1SF4gXAAAA:8 a=7CQSdrXTAAAA:8 a=kD6EpqCopnRxhJBdjlsA:9
 a=9D4HFVnPSN7_ompT:21 a=QEXdDO2ut3YA:10 a=olg2BfGzmf2haRflzj8J:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=U75ogvRika4pmaD_UPO0:22
 a=I7ze7AG8jwQKfjVvUIqj:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 08:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236945



On 5/13/26 16:14, Robert Yang via lists.openembedded.org wrote:
> From: Robert Yang <liezhi.yang@windriver.com>
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   ...gnore-pwritev-pwrite64-tests-on-musl.patch | 62 +++++++++++++++++++
>   ...toconf-macro-to-detect-largefile-sup.patch |  4 +-
>   ...kport-ax_prog_cc_for_build.m4-macros.patch |  2 +-
>   ...001-strace-fix-reproducibilty-issues.patch |  2 +-
>   ...002-tests-Replace-off64_t-with-off_t.patch |  2 +-
>   .../strace/strace/Makefile-ptest.patch        |  6 +-
>   .../strace/strace/ptest-spacesave.patch       |  2 +-
>   .../strace/strace/skip-bpf.patch              | 25 +++++---
>   .../strace/strace/skip-load.patch             |  2 +-
>   .../strace/strace/update-gawk-paths.patch     |  2 +-
>   .../strace/{strace_6.19.bb => strace_7.0.bb}  |  3 +-
>   11 files changed, 91 insertions(+), 21 deletions(-)
>   create mode 100644 meta/recipes-devtools/strace/files/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch
>   rename meta/recipes-devtools/strace/{strace_6.19.bb => strace_7.0.bb} (96%)
> 
> diff --git a/meta/recipes-devtools/strace/files/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch b/meta/recipes-devtools/strace/files/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch
> new file mode 100644
> index 0000000000..d19533854c
> --- /dev/null
> +++ b/meta/recipes-devtools/strace/files/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch
> @@ -0,0 +1,62 @@
> +From 3c692ce22a70e9fa4cc21afa56d03a9adcd5d2a2 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Mon, 18 Aug 2025 22:18:58 -0700
> +Subject: [PATCH] Ignore pwritev/pwrite64 tests on musl
> +
> +musl uses wrappers for pwritev and pwrite64 using
> +pwritev2 syscall [1], however the test exepcts that the
> +program will call pwritev and pwrite64 ( glibc behavior )
> +
> +This can be fixed if the function calls are changed to
> +use syscall() API directly, but that needs change upstream [2]
> +
> +Issue is reported upstream [3]
> +
> +[1] https://git.musl-libc.org/cgit/musl/commit/src?id=5370070fded61b569196764673a4fc8440aac79e
> +[2] https://github.com/strace/strace/pull/347
> +[3] https://github.com/strace/strace/issues/349
> +
> +Upstream-Status: Inappropriate [Musl Specific]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + tests/pread64-pwrite64.gen.test | 3 +++
> + tests/preadv-pwritev.gen.test   | 3 +++
> + tests/pwritev.gen.test          | 3 +++
> + 3 files changed, 9 insertions(+)
> +
> +diff --git a/tests/pread64-pwrite64.gen.test b/tests/pread64-pwrite64.gen.test
> +index b53e069..0a1e6e6 100755
> +--- a/tests/pread64-pwrite64.gen.test
> ++++ b/tests/pread64-pwrite64.gen.test
> +@@ -1,4 +1,7 @@
> + #!/bin/sh -efu
> + # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (pread64-pwrite64 -a21 -eread=0 -ewrite=1 -e trace=pread64,pwrite64 -P pread64-pwrite64-tmpfile -P /dev/zero -P /dev/null); do not edit.
> + . "${srcdir=.}/init.sh"
> ++
> ++skip_ "Test not ported to musl, musl generates pwritev2"
> ++
> + run_strace_match_diff -a21 -eread=0 -ewrite=1 -e trace=pread64,pwrite64 -P pread64-pwrite64-tmpfile -P /dev/zero -P /dev/null
> +diff --git a/tests/preadv-pwritev.gen.test b/tests/preadv-pwritev.gen.test
> +index 5ed8297..b83f129 100755
> +--- a/tests/preadv-pwritev.gen.test
> ++++ b/tests/preadv-pwritev.gen.test
> +@@ -1,4 +1,7 @@
> + #!/bin/sh -efu
> + # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (preadv-pwritev -a19 -eread=0 -ewrite=1 -e trace=preadv,pwritev); do not edit.
> + . "${srcdir=.}/init.sh"
> ++
> ++skip_ "Test not ported to musl, musl generates pwritev2"
> ++
> + run_strace_match_diff -a19 -eread=0 -ewrite=1 -e trace=preadv,pwritev
> +diff --git a/tests/pwritev.gen.test b/tests/pwritev.gen.test
> +index e54fd15..4999816 100755
> +--- a/tests/pwritev.gen.test
> ++++ b/tests/pwritev.gen.test
> +@@ -1,4 +1,7 @@
> + #!/bin/sh -efu
> + # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (pwritev -a22 -s7); do not edit.
> + . "${srcdir=.}/init.sh"
> ++
> ++skip_ "Test not ported to musl, musl generates pwritev2"
> ++
> + run_strace_match_diff -a22 -s7
> diff --git a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
> index 1750f34518..bda5156cdf 100644
> --- a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
> +++ b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
> @@ -1,4 +1,4 @@
> -From 4c7112f36a70d3034c583ab45058491129111585 Mon Sep 17 00:00:00 2001
> +From 36df82284b1e8c3d7338c315016a8e74c0978e32 Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Thu, 15 Dec 2022 15:54:27 -0800
>   Subject: [PATCH] configure: Use autoconf macro to detect largefile support
> @@ -13,7 +13,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>    1 file changed, 2 insertions(+)
>   
>   diff --git a/configure.ac b/configure.ac
> -index ad12d20..a760789 100644
> +index 956bb85..0812725 100644
>   --- a/configure.ac
>   +++ b/configure.ac
>   @@ -43,6 +43,8 @@ AC_PROG_INSTALL
> diff --git a/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch b/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
> index 68a1a4230a..920c2e4faf 100644
> --- a/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
> +++ b/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
> @@ -1,4 +1,4 @@
> -From 00de0004bbb7c0816f9f899345971c148c9e59d9 Mon Sep 17 00:00:00 2001
> +From dd821aebdefb3531202bcd51fce5e2bd74c1512d Mon Sep 17 00:00:00 2001
>   From: Khem Raj <khem.raj@oss.qualcomm.com>
>   Date: Fri, 10 Apr 2026 23:39:47 +0000
>   Subject: [PATCH] m4: Backport ax_prog_cc_for_build.m4 macros
> diff --git a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
> index c633531f44..77f90bf0d1 100644
> --- a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
> +++ b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
> @@ -1,4 +1,4 @@
> -From d0bbbf170f70746b2b8e9bb6129b0b9441a1c4b5 Mon Sep 17 00:00:00 2001
> +From bb0cd804214054ef95193daa0b7076ed5be1c881 Mon Sep 17 00:00:00 2001
>   From: Jeremy Puhlman <jpuhlman@mvista.com>
>   Date: Wed, 11 Mar 2020 19:56:55 +0000
>   Subject: [PATCH] strace: fix reproducibilty issues
> diff --git a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
> index 093cedc233..7daf3f6763 100644
> --- a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
> +++ b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
> @@ -1,4 +1,4 @@
> -From f487e2a0f1568c989a0294f4335f3dc9a6012d8d Mon Sep 17 00:00:00 2001
> +From 2d6384cd2b6b923ea3eb6863beb0bfaf6bf628c2 Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Thu, 15 Dec 2022 15:56:13 -0800
>   Subject: [PATCH] tests: Replace off64_t with off_t
> diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
> index 60562ae7d9..3d23e34244 100644
> --- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
> +++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
> @@ -1,4 +1,4 @@
> -From 6d77203fb22e076918dc983db47b48b28cbbc06d Mon Sep 17 00:00:00 2001
> +From 21747b62c36689b68fac7e987a9b93b998f692e3 Mon Sep 17 00:00:00 2001
>   From: Gabriel Barbu <gabriel.barbu@enea.com>
>   Date: Thu, 25 Jul 2013 15:28:33 +0200
>   Subject: [PATCH] strace: Add ptest
> @@ -13,7 +13,7 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>    1 file changed, 20 insertions(+)
>   
>   diff --git a/tests/Makefile.am b/tests/Makefile.am
> -index d76b5c6..d4fc206 100644
> +index 7d80e07..1e0e064 100644
>   --- a/tests/Makefile.am
>   +++ b/tests/Makefile.am
>   @@ -18,6 +18,7 @@ SIZEOF_LONG = @SIZEOF_LONG@
> @@ -24,7 +24,7 @@ index d76b5c6..d4fc206 100644
>    AM_CFLAGS = $(WARN_CFLAGS) $(TEST_WARN_CFLAGS)
>    bundled_CPPFLAGS =
>    if USE_BUNDLED_HEADERS
> -@@ -939,3 +940,22 @@ BUILT_SOURCES = ksysent.h
> +@@ -950,3 +951,22 @@ BUILT_SOURCES = ksysent.h
>    CLEANFILES = ksysent.h
>    
>    include ../src/scno.am
> diff --git a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
> index 3e66b15850..14ad35be74 100644
> --- a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
> +++ b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
> @@ -1,4 +1,4 @@
> -From 76c23e018608421624d1e00b9e387b265e6da469 Mon Sep 17 00:00:00 2001
> +From 0b3d278fa808a21d4300a71d062807f905671bf9 Mon Sep 17 00:00:00 2001
>   From: Richard Purdie <richard.purdie@linuxfoundation.org>
>   Date: Wed, 29 May 2019 00:10:32 +0100
>   Subject: [PATCH] strace: Tweak ptest disk space management
> diff --git a/meta/recipes-devtools/strace/strace/skip-bpf.patch b/meta/recipes-devtools/strace/strace/skip-bpf.patch
> index b058b0ba03..1fa8c2db2d 100644
> --- a/meta/recipes-devtools/strace/strace/skip-bpf.patch
> +++ b/meta/recipes-devtools/strace/strace/skip-bpf.patch
> @@ -1,22 +1,31 @@
> +From 66edf5d44ba89f73d51657edeeb19fc10d008aea Mon Sep 17 00:00:00 2001
> +From: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Date: Mon, 22 Dec 2025 12:14:45 +0000
> +Subject: [PATCH] strace: Skip bpd tests for now since they don't work with the
> +
>   These tests failed when upgrading to 6.18. Skip them for now until the issue can be resolved
>   as the upgrade is needed for newer kernel versons.
>   
>   Upstream-Status: Inappropriate [issue reported at https://github.com/strace/strace/issues/370]
> +---
> + tests/bpf-v.gen.test | 1 +
> + tests/bpf.gen.test   | 1 +
> + 2 files changed, 2 insertions(+)
>   
> -Index: strace-6.16/tests/bpf-v.gen.test
> -===================================================================
> ---- strace-6.16.orig/tests/bpf-v.gen.test
> -+++ strace-6.16/tests/bpf-v.gen.test
> +diff --git a/tests/bpf-v.gen.test b/tests/bpf-v.gen.test
> +index e57154e..440ddfe 100755
> +--- a/tests/bpf-v.gen.test
> ++++ b/tests/bpf-v.gen.test
>   @@ -1,4 +1,5 @@
>    #!/bin/sh -efu
>    # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (bpf-v -a20 -v -e trace=bpf); do not edit.
>    . "${srcdir=.}/init.sh"
>   +skip_ "Test doesn't work atm"
>    run_strace_match_diff -a20 -v -e trace=bpf
> -Index: strace-6.16/tests/bpf.gen.test
> -===================================================================
> ---- strace-6.16.orig/tests/bpf.gen.test
> -+++ strace-6.16/tests/bpf.gen.test
> +diff --git a/tests/bpf.gen.test b/tests/bpf.gen.test
> +index 1391d6b..c4906b1 100755
> +--- a/tests/bpf.gen.test
> ++++ b/tests/bpf.gen.test
>   @@ -1,4 +1,5 @@
>    #!/bin/sh -efu
>    # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (bpf -a20 ); do not edit.
> diff --git a/meta/recipes-devtools/strace/strace/skip-load.patch b/meta/recipes-devtools/strace/strace/skip-load.patch
> index 20535fe005..dc88706948 100644
> --- a/meta/recipes-devtools/strace/strace/skip-load.patch
> +++ b/meta/recipes-devtools/strace/strace/skip-load.patch
> @@ -1,4 +1,4 @@
> -From 40244c27de6b8fa0f6f6685d20e64309884e73bf Mon Sep 17 00:00:00 2001
> +From 7fc69711b5e216c385b22a5b64c6c7c8be693600 Mon Sep 17 00:00:00 2001
>   From: Ross Burton <ross.burton@arm.com>
>   Date: Sat, 30 Aug 2025 00:47:03 +0200
>   Subject: [PATCH] strace: skip a number of load-sensitive tests
> diff --git a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
> index bf4a8cd123..c47ca08dd4 100644
> --- a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
> +++ b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
> @@ -1,4 +1,4 @@
> -From 71bcc83993dd1f8f30c3defaece23211c9b73f33 Mon Sep 17 00:00:00 2001
> +From 6bc97ed4e26ca4d275c10f5b4f56fc43a8e12925 Mon Sep 17 00:00:00 2001
>   From: Andre McCurdy <armccurdy@gmail.com>
>   Date: Mon, 18 Jan 2016 11:01:00 -0800
>   Subject: [PATCH] update gawk paths, /bin/gawk -> /usr/bin/gawk
> diff --git a/meta/recipes-devtools/strace/strace_6.19.bb b/meta/recipes-devtools/strace/strace_7.0.bb
> similarity index 96%
> rename from meta/recipes-devtools/strace/strace_6.19.bb
> rename to meta/recipes-devtools/strace/strace_7.0.bb
> index 7b8d4851fb..1150cfda61 100644
> --- a/meta/recipes-devtools/strace/strace_6.19.bb
> +++ b/meta/recipes-devtools/strace/strace_7.0.bb
> @@ -20,10 +20,9 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
>   SRC_URI:append:libc-musl = "\
>              file://0001-Ignore-pwritev-pwrite64-tests-on-musl.patch \
>              "
> -SRC_URI[sha256sum] = "e076c851eec0972486ec842164fdc54547f9d17abd3d1449de8b120f5d299143"
> +SRC_URI[sha256sum] = "6c92419be3f2ec560b31728a4652217c59864c8642ba7b1b3771b1b013ad074b"
>   
>   # remove at next version upgrade or when output changes
> -PR = "r1"
>   HASHEQUIV_HASH_VERSION .= ".1"

I removed all the above lines in the PULL.

// Robert

>   
>   inherit autotools github-releases ptest
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#236944): https://lists.openembedded.org/g/openembedded-core/message/236944
> Mute This Topic: https://lists.openembedded.org/mt/119293906/7304958
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [liezhi.yang@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


