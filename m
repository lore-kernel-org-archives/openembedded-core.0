Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9983EC54734
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 12:11:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.76955.1724760675997379547
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 05:11:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8969dc1e56=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RAemW9027242
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 12:11:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41754qb14p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 12:11:14 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47RCBEb5032062;
	Tue, 27 Aug 2024 12:11:14 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41754qb14n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 12:11:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yPMYk3Zqhg11oozIAYhFy9Ys9Hkv83dFuM+3KVzqi5A9NUVj8huAk+5y27Cb6p3C1LeBGE6mfgjqWdH+s8bWUxpt/ehNE/aOFvnZPGhopxuDLnA3HmIjGWt9sTq1hN6Ch2pK0iqngCk/pXWQqrVYUz4g0ysFRVN+zlrujgZ47v8f9/sV++wPe1thNk1EkUHMnAAJ9mCCS+0o3QGrvOcWP7dYqZhzkXiTbMNZr44mJiUCTRCJVfIPmDVDLC5YZp3pZqWq3u5hf3vN/hdsH+zkNtJChnLb2Fxqf4uYX8YqyBrLxnKXRhj8lVJPalHSWSkGTa+0ld7099NkffjfHmO+lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=msYSW297dbEBNWDOr0on+Kj37Whoy101ZOrnr/XEOss=;
 b=IgU9odGdxOFKpvIwtHHZ+wh+2PrIy2FLJJKSgw84UZ5GHHbpdFlL9HvgBrUDXHZIvrcI022Of7IQitNw4m6tQnyJmBFyl8xNHk4VT2Qp2Tn9EapBJyXyqHxqdiloTMvFW/1Qf/GUhg/YvcIGKuPPHhX7VWyGA1c2T8HIqwZkrMDG3EYYKi3ojKGbCuW44nv7ohxaXXxtFhE3TMjQePELCjKg/L7XeoND4psd6eZrx9imdP7h5nUiT6upYCu8oxsn98uvwXd85XLytIGVFAO56bDrl7GU9bG5u9FCBen5IHrbf3N73NpExPMktBzEMwKEpxEoOY56k+arY8dR+Fh5Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by DM6PR11MB4755.namprd11.prod.outlook.com (2603:10b6:5:2ae::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Tue, 27 Aug
 2024 12:11:11 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%4]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 12:11:11 +0000
Content-Type: multipart/alternative;
 boundary="------------w2c4OjaGAHINZPXs302ftbjq"
Message-ID: <15bf0cae-b114-4ac7-89d9-3f7df77b41bd@windriver.com>
Date: Tue, 27 Aug 2024 17:41:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] rust: Upgrade 1.78.0->1.79.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
References: <20240825170553.566798-1-Yash.Shinde@windriver.com>
 <20240825170553.566798-2-Yash.Shinde@windriver.com>
 <bbbe564b9b6191edbe62abd69fa3b337ada2ad4a.camel@linuxfoundation.org>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <bbbe564b9b6191edbe62abd69fa3b337ada2ad4a.camel@linuxfoundation.org>
X-ClientProxiedBy: BL1PR13CA0200.namprd13.prod.outlook.com
 (2603:10b6:208:2be::25) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|DM6PR11MB4755:EE_
X-MS-Office365-Filtering-Correlation-Id: 072fc5f1-1896-4833-22f8-08dcc69156e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TkNHYk1WcTg3SFI1WDQ0UkpDbWtXanNIOGpYUWk5N2FFakkwQTlOUVlOWjhz?=
 =?utf-8?B?UzhIdG56QlhVbTNWRzgyUXI4WUJVMEtMSURaaFlBUi9UM0RuZWNnbXcyaTl3?=
 =?utf-8?B?SWFQOTk4eS9iNTIzZFNDOXBPQm9od2haV2pPak0vN0Exb0hOTitCT2hVK3F3?=
 =?utf-8?B?UndvNitCeGdZZGdmK1luNHpjVDNmUmR4ZmFsZlNWVTViWjFCM0I3RHZtalQw?=
 =?utf-8?B?dVpuSExpbGpQbzlZVjdpTkQwWTZ6RDR3NUlTM1N4U3NQc2k3RHBsUzlNQ3Ey?=
 =?utf-8?B?d1hxdzNIajFDWUF5K1ZVQ0ZPSSttSThXK0pmMkdpMFpHRURLdFFhSHM1NnJp?=
 =?utf-8?B?NkVxMXlVRzBvUHJkdzQ1WTRVcEJoOXpqK1N1VldMUmVHT0F5NUVmMFFTWkRj?=
 =?utf-8?B?V014S3o5Z0V6cEdTKzhMeW5QT0d0Q3owKzZxNVVqVmxHN3M4UWRWQmJZQlNT?=
 =?utf-8?B?RHhMTFhIT1BpRWlsTGxyWkpFdWxUQzROTG1aY3BiYitTSy9Xc1JtWmNCU0FH?=
 =?utf-8?B?d3VRNFFnWFpFMlllL0MvTmY4b3N6RmxtQnNzQWFjblhvL3czMFFZb2c1TERX?=
 =?utf-8?B?aVJwblJXQUJ5aWVGeE9uUUF2Y2FobXpYK0Vsc2lhamRYU3hHZ1YwSWM0UmE4?=
 =?utf-8?B?NVRSaVREUFBJaW1YSCtjLzVjQzFSbTd6WnRiYW9PeEFyNUl0V3ZzVDJZUUFS?=
 =?utf-8?B?VENVTzFvbTloSkU3c3ZteGp3ZGJqR0g3NUN4UzNMaGFPNDlVK0N6UEcvWDgx?=
 =?utf-8?B?VVBOaFF4eGQ2NnU0SmJ3L3B2T3FIQTkrMzJWWGQwKzlZeWhyZVd6SjhwR3RF?=
 =?utf-8?B?WUU0WjB5WlQ5ZVVBeVNRV0xXZG55R05sMGxXbHp1ZXR5SjBqaDlvaVoyRlVW?=
 =?utf-8?B?Um8vVnhLcDZKWTNvTnNUaFNSQkIrTmZoc2dCL2hyQUQ3THFZdllhUlZxQW14?=
 =?utf-8?B?UmkwZXR3WUpZS3J1NVhCWlZmS212eS9YWFQrcDdEUkNwenZDdzZDSERPdXBS?=
 =?utf-8?B?RmQyc0pmcExZRjkySXlNRGZLcGpiU1dBbkxxWHNYNnkwaFpiZis4bGExbEtR?=
 =?utf-8?B?cGRSRitzTUZIOGRYU0NRQXNkc0w0Vy9MOTBjWXNMWWFLaWdUd0dCQ0xGUnFv?=
 =?utf-8?B?U3JSQ3dyM3cyQjNPTkFrSDNaT1BsYllQU2ZHcUgyNlpiTkd5clE3NFkySjhR?=
 =?utf-8?B?Zmh5VHpjMFNZR0JtZHJxVStPZ2J5R2NRZkt1SkZBNEd0OWw0NndWRjFhbnZp?=
 =?utf-8?B?Um1rbnJvV0hVeXhoaWViYSswZjNlMStNcHdFU1dQK1JFTzVGYmVncnFXUnFq?=
 =?utf-8?B?YUQ4Sk44OWJCc01wOWtCNXV3UGRzR0tvZXBVeGx2VG1Ea1NnOS9EOGM0NFFo?=
 =?utf-8?B?Z2h1RmEzVVNyR050am93amNxMHVLaFQ0MDJTbkZQTlFBZzJPRVpRWGVuOE5K?=
 =?utf-8?B?djV3V2dzUDgzZDVNMkYwaUp6SDFCNmNza2c2WU14STFyQ1RvcDJrUVB5SnpQ?=
 =?utf-8?B?VWZ5d2JadnNBQjN2VGVjMnArYklEK1VoY2l3ZTNrQVlsRW5seEtHWDFvWGRq?=
 =?utf-8?B?SEIwL3dLbVJpUUNidEdXL2hIV2MyR2xJN0M0bG1JTE9SY25WSnpkNzJzUU9X?=
 =?utf-8?B?ZldjUFZjdi9zdzdvL1hjZG5nMUVibytFZjVLTk1wQnJ0Umx1aFlQenQrdWVv?=
 =?utf-8?B?OG5mVTlnNmJRc0d2aU9mVHJ0ay9yT0wxZm81anExTTFFZGVIVEFvNEI4ZU5z?=
 =?utf-8?Q?KJnmDEKeZAUFFV9cl8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NUYrYjhNZUxEWWR3QUtNUUQxRzEvSmRoNUJib2FtejJINTdRWlJxOXh1S2RH?=
 =?utf-8?B?Sng1a21wazV0aFREMFRJV0E4cStMNFJ6dldFazZ4eXBjVjVVdzMwM1dETjlh?=
 =?utf-8?B?RFp4NTMwRktGMVpDSllYZVFHVTBlZHd0OUNta1dBY2lseWFDWFJoMTExS01o?=
 =?utf-8?B?emlrenl4RzF4dU9EZmlmdjgxQmlCeUxpaUJYVFgrbHF4bjNDWHhmd1cyVktU?=
 =?utf-8?B?NlBzMHphZ2lUQXF6bm92aGVLWDZ5ZFgrZGFmcDlkaWZzMy9rWUdHWVZ3S25E?=
 =?utf-8?B?OUp5MDVYbGNHSUpwM2FqM3JTc3hnN1VsZWFsMjRTVlV5WlRzOWJYUWg0MkxK?=
 =?utf-8?B?K0JNV25zcWJlRHNtT2hLRWRnQ0ZzSi9JK3cxQzhVcG5TUVdQTEFJUjJFeitu?=
 =?utf-8?B?eTM3dnNxVm9Za0FiM0ZKdjZjNFBWc29jNTIxMFZrTU1kSUlTa2t6RmNaYnB5?=
 =?utf-8?B?QTJ6NTMyS0FYeDAzWGYyNW05R2NsOEhDZGxnSHNUN015aVNvamRsbENBVDV1?=
 =?utf-8?B?clhHVEh0dFMrcGE2dlBGQmcydy9IVkk3S0NhZ3dGbTV4bU5PcTU2Z2toVE9Z?=
 =?utf-8?B?UzNCYU1salVOZGZKNG5kN2xBL3NMNmg2OEFkMSs2TStDYWN4OUNEallvWndM?=
 =?utf-8?B?VWpqV3poeC85UkR1WlM1VzlabEFDdVFJeG5BSE9kVkJ6cmpDd3ZXYXEzSjkr?=
 =?utf-8?B?dUFEeVoxRGFDb3F0Unl0TzdBcHI2YUJHdFZzcmIxQVdMU0tpeDFRbHprV1dF?=
 =?utf-8?B?NFhWMjBaZ2RGK3hzdmVTaEpYYWN0UXhlTHZPMktVN2FVeHgzelUzT3h2aFdq?=
 =?utf-8?B?dzB5VlpkSWZHcTJYRUVJUGozblZuTUhZam5ZdGVvNStzcUtxd3BmdEFqRmJq?=
 =?utf-8?B?RU5RLzkwTTRWK0xkU1NxYzlyVDlIYnkwbTBhUllCMmR4UDYzT2J0cnVnZysv?=
 =?utf-8?B?dEVqQmo4RFhmMFo1NzlURWNISDlvMFoyL01Hc09LM0FDaFN2b0JOakwwT3J4?=
 =?utf-8?B?dmVFQWhDRmhDS3puQ3NCekwvQVJ0UFNwY3hqVEUwbWsvaU5MdjJuQ3p2OVFi?=
 =?utf-8?B?RlpTNU1zblkwc3RaY1NweHFYM1RJMXExVms0aXhzSGZOZ1FnSi8wM3FHa05W?=
 =?utf-8?B?c1pjeEhlYk84YjdYRDRUK1cwdCtsajV1SzUzaEVBaG5YS3RHK0Z6V3JGQjZF?=
 =?utf-8?B?ejN0UGpCZnVRQmJsYTRELys2TTFLQWFyL2tGUUErMFdkeFNmaE5hU1FrUGE1?=
 =?utf-8?B?NXRrK3c3eW50cjJrWkU3dUxsTHV2YjRUOUpqM2tqSThWNGUySUlUSUE5U0Ry?=
 =?utf-8?B?SnBJUHNVNjFqMXJLVVNHa1dNUmdzbGtuQjR0TDBwVHpWMnZkRGE1VDY2cFNp?=
 =?utf-8?B?YUI1UElGZzd1Z0lLTk02aDU5Zk9nMTdvMUtNY2tWNXNHL0UwS3VHZGd0dENG?=
 =?utf-8?B?THh5NFIzS29KcXcwcjJCNzdDUXlGUHVkYlIzUnJJRHJObWx1SkJXZEd5aDZN?=
 =?utf-8?B?R1d6Z2hzOWY5VUFEMjdSVHh6SDFlUVhsN2dtMU9VOFBhQzhYNEttOEpqVXpa?=
 =?utf-8?B?Rk5NeFVacUJkc0t2ckRzSXMyUWl6eXAzem1BWjJtZWtXR0l6dlZkSjU5blB1?=
 =?utf-8?B?WFNoTlZrRk12T2M1eFAxWlkyTFlwTW5MTXY2OHFJVEFJeVNUNDFuVHNON2sy?=
 =?utf-8?B?emhGM211YmNMYllYbXBOUEY0dFJTWHZrbVRvQ1lUQWQ2RGZhRDhHZTR1RVA2?=
 =?utf-8?B?bHU0d1hVU29DTTZkcmg1U1NBNzJiUWo2TFUwdkdHWmdSLzcxdk5yNmtNN3ho?=
 =?utf-8?B?d21FSkhSeG9ZOFM2dStMa3p1ZlptNlpERCsyL0QxVlJUbFF0dzRUQ3FGT2Fi?=
 =?utf-8?B?SHFoZHk5emNQZG1hLy9OTFlXQk1MVkh4UEpVR1gwc01JZDFaNmt5SmttVEw3?=
 =?utf-8?B?ZUxDNmJhVEFJeEJwUnZhVVo2Tkx6S0hjT0xjdE1LNlVNMWo2YW5HMGh2UDFw?=
 =?utf-8?B?dFJCRTJhNVdYVm5iT0daZlVTNU1nZnVVOXNUclFxa1VGWmUyT1FNckUrNjVX?=
 =?utf-8?B?b1FsZWRGeUd0TGxPenFzaldvcmpKSHhSZkU5UjlsNXRQNWxUK2N5bng4ek41?=
 =?utf-8?B?aGNOTVNXQXpyK05zYkx4NFlwdkxWNzFLcjRrZzRlLzJTUUZpNmQ5eS8xcHdU?=
 =?utf-8?B?QXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 072fc5f1-1896-4833-22f8-08dcc69156e2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 12:11:11.2291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 83yWwkhxzWeyv4BVgIlp4Km677ii0dryd+t9tEGwJUK7WHAl62lRX1hD/l6aSTyg+/gu7byNhJ/ZtOxjPHe2jmcFRRp3LSh6F1bGxEtOADA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4755
X-Proofpoint-GUID: Z7yOQQMVJkVoszel8luOww9dEyF3-wRS
X-Authority-Analysis: v=2.4 cv=O65rvw9W c=1 sm=1 tr=0 ts=66cdc262 cx=c_pps a=OemXRkCljtmPz/OzEC+nkg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=ei4SEBeUAAAA:8
 a=iGHA9ds3AAAA:8 a=6-mHwN2TeJhlGVFQT1QA:9 a=QEXdDO2ut3YA:10 a=iWm1cKwhI7EA:10 a=ag1SF4gXAAAA:8 a=yj-aMKAYKbz0kkd27lYA:9 a=8vXngM_1lD-dbDmZ:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=8zIOOLb7Ym0NljyPXbuS:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: peFTXueuYgQIn-Ir-d_wmjtpERi8A37B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_06,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2407110000 definitions=main-2408270089
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 12:11:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203836

--------------w2c4OjaGAHINZPXs302ftbjq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 27-08-2024 16:08, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Sun, 2024-08-25 at 10:05 -0700, Yash Shinde via
> lists.openembedded.org wrote:
>> From: Yash Shinde<Yash.Shinde@windriver.com>
>>
>> Update the patch files with rust v1.79.0.
>>
>> Drop the following backported patch which is merged
>> with rust v1.79 upgrade.
>>
>> - cross-targets-backport.patch
>>
>> https://blog.rust-lang.org/2024/06/13/Rust-1.79.0.html
>>
>> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
> It seems mostly ok but we did see:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/9385/steps/13/logs/stdio
>
> in Alexandre's build :(

I am looking into the failure but was unable to reproduce it.

The error log says:

/stdio: ERROR: cargo-native-1.79.0-r0 do_compile: Execution of 
'/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-native/1.79.0/temp/run.do_compile.1874995' 
failed with exit code 101
stdio: ERROR: Logfile of failure stored in: 
/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-native/1.79.0/temp/log.do_compile.1874995
stdio: ERROR: Task 
(virtual:native:/home/pokybuild/yocto-worker/qemuarm64/build/meta/recipes-devtools/rust/cargo_1.79.0.bb:do_compile) 
failed with exit code '1'

stdio: ERROR: Command . ./oe-init-build-env; bitbake core-image-sato 
core-image-sato-sdk core-image-minimal core-image-minimal-dev 
core-image-full-cmdline core-image-sato:do_populate_sdk 
core-image-minimal:do_populate_sdk_ext
core-image-sato:do_populate_sdk_ext -k failed with exit code 1, see 
errors above. (1724719291.3: 11079.3)/

I checked "bitbake cargo -c do_compile", 
"core-image-minimal:do_populate_sdk" and core-image-sato:do_populate_sdk 
and all passed successfully.

The build cmd has many /core-image minimal and sato/ build cmds.
Could you please help me to point out which of these exactly cause the 
issue?


Regards,
Yash

>
> Cheers,
>
> Richard
--------------w2c4OjaGAHINZPXs302ftbjq
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 27-08-2024 16:08, Richard Purdie
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:bbbe564b9b6191edbe62abd69fa3b337ada2ad4a.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Sun, 2024-08-25 at 10:05 -0700, Yash Shinde via
lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>

Update the patch files with rust v1.79.0.

Drop the following backported patch which is merged
with rust v1.79 upgrade.

- cross-targets-backport.patch

<a class="moz-txt-link-freetext" href="https://blog.rust-lang.org/2024/06/13/Rust-1.79.0.html">https://blog.rust-lang.org/2024/06/13/Rust-1.79.0.html</a>

Signed-off-by: Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
It seems mostly ok but we did see:

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/9385/steps/13/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/9385/steps/13/logs/stdio</a>

in Alexandre's build :(</pre>
    </blockquote>
    <p>I am looking into the failure but was unable to reproduce it.<br>
      <br>
      The error log says:</p>
    <p><i><font size="2">stdio: ERROR: cargo-native-1.79.0-r0
          do_compile: Execution of
'/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-native/1.79.0/temp/run.do_compile.1874995'
          failed with exit code 101<br>
          stdio: ERROR: Logfile of failure stored in:
/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-native/1.79.0/temp/log.do_compile.1874995<br>
          stdio: ERROR: Task
(virtual:native:/home/pokybuild/yocto-worker/qemuarm64/build/meta/recipes-devtools/rust/cargo_1.79.0.bb:do_compile)
          failed with exit code '1'<br>
          <br>
          stdio: ERROR: Command . ./oe-init-build-env; bitbake
          core-image-sato core-image-sato-sdk core-image-minimal
          core-image-minimal-dev core-image-full-cmdline
          core-image-sato:do_populate_sdk
          core-image-minimal:do_populate_sdk_ext <br>
          core-image-sato:do_populate_sdk_ext -k failed with exit code
          1, see errors above. (1724719291.3: 11079.3)</font></i><br>
      <br>
      I checked &quot;bitbake cargo -c do_compile&quot;,
      &quot;core-image-minimal:do_populate_sdk&quot; and
      core-image-sato:do_populate_sdk and all passed successfully.<br>
      <br>
      The build cmd has many <i>core-image minimal and sato</i> build
      cmds.<br>
      Could you please help me to point out which of these exactly cause
      the issue?<br>
      <br>
      <br>
      Regards,<br>
      Yash<br>
      <br>
    </p>
    <blockquote type="cite" cite="mid:bbbe564b9b6191edbe62abd69fa3b337ada2ad4a.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">

Cheers,

Richard
</pre>
    </blockquote>
  </body>
</html>

--------------w2c4OjaGAHINZPXs302ftbjq--

