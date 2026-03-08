Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2305EFCC057
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 14:28:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39699.1772980116404882158
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 07:28:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=C26z9U3A;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75278c0199=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628EQ7g1606391
	for <openembedded-core@lists.openembedded.org>; Sun, 8 Mar 2026 14:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=lm9AwLvg6/DyDm7T6ffEdjj9RPEOAOJGjh5ZoQstzFE=; b=
	C26z9U3A6Jipi4oxvlFrLw0U/6sGQmb7t3lYopM2hmk7rm6NgdtGqVQrNzkgNeO5
	nEU9j3ORokOn4Dy5FDFVMlnJGbGNF5FoV2BaNI13WUkMiT0xCy4uZeFQOUPu7OVL
	QTeRl3duvKQ/3tSsYKyk5/49mLTEFKReLFN674NgX6yTlS8/r2s5dLNYT7NqkBiC
	zhU6a4+Pd7f+hX/U7FjITxqqgQAdyatWDu6YEq+FlItcHVTTTVnhAtWsGMR9H4ZB
	12B91CBFeeUCU8Lwq5GBzUpm/Ec6yhgCefKtjVqpv9Vcgd/jpZNjAByl5xe9DwyC
	vrfoq02WqVxhkoCJDkWwdg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012008.outbound.protection.outlook.com [40.93.195.8])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cr97v93r3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 08 Mar 2026 14:28:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EiEsTLVUajiU2JBH1bNpz0G+lnntKA2teJqqho6ub01ZHfKl8cIKKIlIUgLCtwxETKnfSquy46Hy2PHd3kK1t5IzPnDXYbNhEr+4GBQBcsj1AuQrf4xTXdF8PixbuVGaqRxv/PgGDeODUqTC9Oa42jv1/McG748FoXRg35kBfpT9RlWc56W2uDHZItHSfhaJRAGj0ASZbxL02Ux4OrQc7iBekD5Z8d5zZnVi6XM2INIRt6ATe6GSPYOH86Na+AZq36VmlKIf4BmWsiVroiUstCp3Eh7zK2xcXdIAaI4LF3Wq4C3CFqkk3TMJ5BQYovc/JaCVUlQxDJ35pgOKjwiCSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lm9AwLvg6/DyDm7T6ffEdjj9RPEOAOJGjh5ZoQstzFE=;
 b=S7LZt1tyIsj2jeZKMEkV8QYALghTsM3um1xNfz3W1dhunPZvclB4rTSppKvQIEfnCYQfIb6H6bTZ2VWWdJH475gKWTeWW6kTwv4rq4Ztu47dP/kulAPJxX1RG1Gt8ufM6wAiyBYzEQGx3I3B8WydXv27eAjnp2oZaIgKoWGKOEE15Q8+KpkW1yVz82iy0P6RD8sIEpb027m3Hd1Pn93cPeoRcgUAIfGbK/0WMSO2YtciarwJd8I06SrFcPrj9ZLKPGOZkRMDghmT0HGc269Oq6JMKditnr80YTDMDeT0gJehcGcPJPCx2knX//nShJj0On0wHOb3+Mk12lypM+uzEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 PH3PPFA061B3868.namprd11.prod.outlook.com (2603:10b6:518:1::d3d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.10; Sun, 8 Mar
 2026 14:28:31 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.20.9700.009; Sun, 8 Mar 2026
 14:28:30 +0000
Message-ID: <73fabfed-9c3a-4eec-8f03-b8e1f1302b92@windriver.com>
Date: Sun, 8 Mar 2026 19:58:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] glibc: Upgrade to 2.43 release
To: martin.jansa@gmail.com
Cc: raj.khem@gmail.com, Randy MacLeod <randy.macleod@windriver.com>,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
References: <20260127053941.792825-1-raj.khem@gmail.com>
 <DGM7WKPONTXD.ZOV8O0CMQHXR@bootlin.com>
 <25b7aea3-e05c-4378-95b7-ad269a4ee93d@windriver.com>
 <CAMKF1sr+-xaOSezgQ92xPUSX7qPH_ruG6_Zkfq+TAG1gGpWh5A@mail.gmail.com>
 <59a0aba3-8d3b-4bf1-9d5a-c1b2e7b16e8c@windriver.com>
 <CA+chaQczQ+eYyG0bKhYBW26UN4Z7tQCWsoNd2g959THOKCe_BQ@mail.gmail.com>
Content-Language: en-US
From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
In-Reply-To: <CA+chaQczQ+eYyG0bKhYBW26UN4Z7tQCWsoNd2g959THOKCe_BQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BY3PR10CA0007.namprd10.prod.outlook.com
 (2603:10b6:a03:255::12) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|PH3PPFA061B3868:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dd0c12f-9ab9-418b-3e2b-08de7d1ef860
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	0y2Gb8q8a5DFEEOdFBAtdCBWVQeMheuCZzvqccPHtMml+Aa4OHsEYDT41MLjwwso4ck4+vOwusksBIn1YF5a48jS78LcV6er4GMtYVP8jmbj+NZFgzFzPl32CbzheodWv8q+uJ0StvNey0ikHd0liz4P8pKju/diCC584ou+cra8Bgw/I5CGDkLy/EdcMQOZ4LxkyATIn1laOuEEzzWpynkaszJf1KCIUoboGwmSJFKq+7Qyygik06pyzdY+FTuulT+jQEGDR/N0rgw8vf5iADy9pRKfxKeQFSxj4L5Boolvt4jG37WhAP0yBxNArNpJGoTxvCQIGuABRKeh0aXLLUoh/3tXXVF9CUF4/XN1zO/mGgoHulF48npH+3Fo3bOcuMeclN5dvaJB4RWu+HMGJiEMcqOtSyeie/fSS11o7arwdgdJWL1fvd62K8CRVUEdWvCHaCKEUC5ETv2vLUxyowKh4yBgo9dk4qyfNn9Zjv0kPypyFaXP/Qo80kOTbWDvBz/0GuLDAq8q8LKB9kWbbTFN4jTNe/7AkFE+N6enTdnnw39Gx51XbYoRRSdNun8wYGGbQI4VbOGoSL/ODKUIuqKGnsPXD4GBaTCxeb3L7Gdw9+4uQ3w5CyIwda+CwjXb0Isq5NqrDNjU9vpFHIV2+lGsc45loP6/GAefb4/4W6+RES3t30+xW1/2uBcLITN1
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?di9OUXVBazdUeUZsUHlvUkFURDREbzBoQldnZzBQczgyRGdMeDR2SXA1UWZj?=
 =?utf-8?B?QlVyaE5tZkhCRDNRenovUHppRVhJM1lnWlZzcjBkNStQR0hmbGdkbmg3UTFq?=
 =?utf-8?B?bm1nbDhLNGJYQW5aNEVnVGYzcjl0YWE3VFYzNC9GRHcrVDRzVnZvdHpiZ3R3?=
 =?utf-8?B?QWY4NzVBVWtJM3NpVEptZ2pzMWRFWFRlaGVaNng3RWxDa2xIeTdFL0dIelBK?=
 =?utf-8?B?RG8vbGJNR0E3WTJwNGJ4T21yQVovYU80ZTFyWGdnWFA5SXBweU4xeE5FRHg3?=
 =?utf-8?B?dE5jOW1SRW9XNUxsRzJRdnhpZmlzZThmM3loenFjMklNVlphK2VJUzE0YVZ0?=
 =?utf-8?B?UDBKeXl5QnJERlRqNy9LaHlQclluRmsvY294bVdQbVBxQ0hES2JoNEszYTBh?=
 =?utf-8?B?elUzTjNWanRkNHBpRWFEUlJIWk84Z2ZDb0Q5L1EyTFNycU1KbkdrSDdwM1lV?=
 =?utf-8?B?NXZNcWJZWlYzak8rc1NLUnIyWndxR1IxODZySCtSc3BoVFVPMHJkc2xaSUlZ?=
 =?utf-8?B?YnhHUGg1RVpzSzJQTCttQ3hSYk1XcnFvc0dxclB5dVdLaGRUK1Avc3kwRDlr?=
 =?utf-8?B?YkhvVnFRdHRuVGo2TWY5SGFJSWQ3dlBseThzUkFlSDk4clI0cWV1dmduckdG?=
 =?utf-8?B?bG5MU2tZV3l1RnVrdXpWNUkyalUxNWxidUZORzY1Y2hkSmZKb2tLUTZRWlhL?=
 =?utf-8?B?RXNBUU9DQzdVaklrcVhyYUJnREFoNnZSM2c2bXp3dHNqZERSbmt6clNQR3py?=
 =?utf-8?B?QUhRZmw0bXlLVmJqcHhDK1JLR2t3ZW13UExiUTArLzBoVnpZbGlWZUxtSU1P?=
 =?utf-8?B?d292TzhDMGdQcElUVjRKSUZJMkhhTkdtTEhWMis3UUtKWStmMmJaQXpxMHNM?=
 =?utf-8?B?NENaT0g2dk5aMXI5akxwekJMQ2huam1YbGtiZk5ZSG1jeDBuWjlKcjZkbzVl?=
 =?utf-8?B?RjhIS1d0cWlTWFRWRVB1QTNOWnFLbnBQSGxpRHhCbG43YXAzYlFhc2R4NS9j?=
 =?utf-8?B?Ui9tTmVsM1MwVWxwSE8wb21CdmhPNFJjaTNSQk9RbXRaN3BZYmdsUXorTnh0?=
 =?utf-8?B?NEphNGlCUTJPR3c5dzFWdldIWElIMHlPM25Qb1V1ZzFrTVhvVlUzNExVM0tZ?=
 =?utf-8?B?SnBjL2NoTDdtL3R1QWdiSTdrbzBFTUxpa2pzWGpUNHhqRzRhWkJscGZxc3JH?=
 =?utf-8?B?cWtNNkFWall0QzVpelp0cDI3eHN1Ym80bEhxNnFGUjJDbENvc2JkU1FIWGU3?=
 =?utf-8?B?WkZyeGY4NXc3V0ttMUdqYjZ4S1l1amRrUmdZWG5RQ1RlZWJjUDRiNVRKNHIr?=
 =?utf-8?B?d0RMakovS0xoNzh1N3JKTTFQeklwaDNXcTU2QTZCdXkyOHk4bi9WTFlSQ0Mv?=
 =?utf-8?B?YzFCVkNMYlg2K01CZGttOExTU2ExaXRlcUFwS3l1aHl4TXdjZG53eDNOSEtq?=
 =?utf-8?B?QlNHVDFJa1Y1Z2NPSENyc3hDUGdORTZmb2NoZ21WcElKbGEwT1FmN2FRK2JO?=
 =?utf-8?B?UHR4QWUwRTdzQVhsaUw0ZmFaVFZpU3JwSmJXVmQ2MG5LY2ZvTEliYzR0Mndr?=
 =?utf-8?B?S0N0QmZnVDNmOXdlWXVadEpNdzN6bnROdzhKOTEzTUxIVHdKaWl4K1dHcEJ6?=
 =?utf-8?B?WDhLZkRxeDUwWkluODBENVZJS3hZcjJJdjlRdHdrOGZjOHJGMngzU1IwaCtD?=
 =?utf-8?B?akZOREkzcjNtNFBZSVpxWFRsSDBpZ015RDJYMVVLZnVaRk5VVFg1cnUzaEJS?=
 =?utf-8?B?SU8rcTdnSXRXZ0UzNU9iL1BCTWRpWHlVOWdNYmF4ZURmc01WTk54WEFsNGZO?=
 =?utf-8?B?dUwzZzBSKzYzQ2ZQV1lKYmpZeUtIVUtpN0dwK0lVV09MaitRN0F6d2lCYmRv?=
 =?utf-8?B?V0JYeDlBdGcrZUxZRHNNUGhMbG1JNWQ0WFJWYmhOTURoc2VucUlBSENtOUFT?=
 =?utf-8?B?djdQdHd6cjNXeXZsWk5ScEVBYXY3SldLYUE1anNvUHVyNUNIVEpWNHpObENO?=
 =?utf-8?B?cWVWdHRFaHRKYVc5b1pmcmExeDZQSmN0UzBudit2TWIrNFRiaGdrVVpWeFVa?=
 =?utf-8?B?dmZReVdvTEdvSVRkczBvbXpqanhPV0w2eHBSSERhQjBJQThBMld2NnEyV09t?=
 =?utf-8?B?Zld1UXNnaXBFUk1oZVFXWENBd0lWWnpsdzFVRStEOTRkMGZLMnNzd0FpWUFJ?=
 =?utf-8?B?ZGJ0Nng3NTV2eGkwdjh4YnZEYU9hSHdxT2dpc1FWdSttWWdpRGxDNGlGZmxM?=
 =?utf-8?B?NkdLT0EyQll5Mmc3U3E2RFVoN1IwOHNXbFMyOXFWU0dlaFRwRDVkTDB0TWgr?=
 =?utf-8?B?TC9RVHdoYWxaMjY5UmdyZE1PTGtrRmtuUC9QMnJVRHExdGVlcnJhd1grRDFx?=
 =?utf-8?Q?m8J8OowQVm/XLP1Y=3D?=
X-Exchange-RoutingPolicyChecked: 
	Cckd0xCxpPcVH3tClKjir8ztrSTpI9PSC/RsPRpRSC22vr2l+uw/uRu+KYUEgUvqH7JzKMYMCajugrrTt0N9IwVBa5YoTDFOgZYWcbFDIYXmyl3eIaPMfWxoBjd03GvuzyvW1JvRnponbgYkUlcJKmMpRn7ZHUEm/MSopAwlYRT58t+MWkb7f6avOSlVpuUtAPAGf0eBhgZ3h2rkSdHErNAMa3ADEOG0LPAahybkgHz04yzMjW9JmJhNit5B/uBdH5ryCxsUgVO4a3ZsxtnbX+b1n+5rXD0pgzvYjsdMKvq88opOAUx8I7PW4afSY+q8WyeReEtxALvIUOWgC12n5Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dd0c12f-9ab9-418b-3e2b-08de7d1ef860
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 14:28:30.7328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JQy/PYbR7VndsKrONDZfbdrCohVu8lNDMDG215TWwvIdFPRjXB/SOt4QLzXonU7joJH7vSzGQ+R5dMfdLPObDgEhTWSViT23u+HszjsJ68U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFA061B3868
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: uEZ6QI498FAnZx-B4sl9We25YO3zVeRw
X-Authority-Analysis: v=2.4 cv=B9a0EetM c=1 sm=1 tr=0 ts=69ad8793 cx=c_pps
 a=5ppPJOB7bB2hO4guNQQ//Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=Q4-j1AaZAAAA:8 a=CCpqsmhAAAAA:8 a=iGHA9ds3AAAA:8 a=pGLkceISAAAA:8
 a=t7CeM3EgAAAA:8 a=z8vU8Gr3U-nLPclttLsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=ul9cdbp4aOFLsgKbc677:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDEzMyBTYWx0ZWRfX9kVzbjwr4eKl
 HV6kGCXWrFMvplvLqmMv1r5SQ0jCvL7LnWXDUiUEbA1D21CC4aIDyuQOcfGk9OX5rjbBAvjqR90
 oz3vZKrOOnLm3zY0RbXl1SlsI8rvNfZVao/oij9D2wjCH3iri7tX9PkNejq4Z7SYqLYmPhUDU3m
 H5ptOAQRr6jUuUHkQRU6GgZ3I+tr7LDqYTXDkKfAxIVpjaEWB9s/G4b6FmhkivmCOGCkWb/O8GF
 CMobB98/8AZ5EZLGbBvzlokBIYSyHUvQS+LEStaonxESkmaMceCwI89MiEnP1aN3BzdemC+2XEk
 jZ+54mAdQ5sMgBAIBVoAjpyal/DGwl8ZSJ+xJUFT57Vdbmgx6x29KlWhtX2qdvgaVYWGC7oEheC
 DV6jdS4N71W88JNxB97fHG8eCxResImkHf2Df8GexLvjhkt1C2TikkfgLBwbfGkXrFjAM8es0Bi
 QRmsgW+xSrGTWM2tSVQ==
X-Proofpoint-GUID: 0WyGU1nf_EmfNaowA0JzxQt6hd7qv_T9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080133
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 628EQ7g1606391
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 14:28:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232652

We have sent the glibc 2.43 patch series.

It has the following dependencies:
1. libunistring: upgrade 1.4.1 -> 1.4.2
 =C2=A0https://lists.openembedded.org/g/openembedded-core/message/232314

2. dtc: backport fix for build with glibc-2.43
 =C2=A0https://lists.openembedded.org/g/openembedded-core/message/232504

3. m4: upgrade to 1.4.21
 =C2=A0https://lists.openembedded.org/g/openembedded-core/message/232612

Patches 1 and 2 are already in mathieu/master-next. Patch 3 is still
under discussion.


On 07-03-2026 01:35 am, Martin Jansa via lists.openembedded.org wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> I've sent fix for m4 and dtc in oe-core (pipewire, libwebsockets in
> meta-oe) and have a possible fix for pseudo (waiting for reply from
> maintainer).
> gettext is fixed by the upgrade to 1.0 (was shared separately by Randy)
>
> Cheers,
>
> On Fri, Mar 6, 2026 at 8:00=E2=80=AFPM Hemanth Kumar M D via
> lists.openembedded.org
> <Hemanth.KumarMD=3Dwindriver.com@lists.openembedded.org> wrote:
>>
>> On 06-03-2026 01:59 am, Khem Raj via lists.openembedded.org wrote:
>>
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender=
 and know the content is safe.
>> Please pick the latest from my branch I will be traveling for next 10 =
Days
>>
>>
>>
>> We picked up Khem=E2=80=99s patch and have been working on resolving t=
he autobuilder failure. The earlier autobuilder failure reported in this =
thread has been addressed However, running a bitbake world build initiall=
y exposed failures in the following modules:
>>
>> gettext-0.26-r0
>>
>> lib32-gettext-0.26-r0
>>
>> dtc-1.7.2-r0
>>
>> lib32-dtc-1.7.2-r0
>>
>> m4-1.4.20-r0
>>
>> lib32-m4-1.4.20-r0
>>
>> lib32-ltp-20260130-r0
>>
>> ltp-20260130-r0
>>
>> lib32-barebox-tools-2026.01.0-r0
>>
>> barebox-tools-2026.01.0-r0
>>
>> lib32-pseudo-1.9.3+git-r0
>>
>> pseudo-1.9.3+git-r0
>>
>> Several of these issues have been resolved by upgrading the affected c=
omponents or by backporting upstream fixes.
>>
>> The remaining failures are currently in:
>>
>> lib32-ltp-20260130-r0
>>
>> ltp-20260130-r0
>>
>> lib32-barebox-tools-2026.01.0-r0
>>
>> barebox-tools-2026.01.0-r0
>>
>> We are continuing to investigate these issues and will share the updat=
es soon.
>>
>> On Thu, Mar 5, 2026, 8:23=E2=80=AFAM Randy MacLeod via lists.openembed=
ded.org <randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>>> On 2026-02-23 4:01 a.m., Mathieu Dubois-Briand via lists.openembedded=
.org wrote:
>>>
>>> On Tue Jan 27, 2026 at 6:39 AM CET, Khem Raj via lists.openembedded.o=
rg wrote:
>>>
>>> License-Update: Match to changes [1]
>>>
>>> Added free_sized, free_aligned_sized, memset_explicit, memalignment, =
and new time bases (TIME_MONOTONIC, etc.).
>>>
>>> Support for the Linux mseal system call to protect memory mappings (s=
ealing).
>>>
>>> Added support for the openat2 system call, allowing more granular fil=
e opening options.
>>>
>>> New, optimized, and correctly rounded functions from the CORE-MATH pr=
oject (acosh, asinh, atanh, erf, erfc, lgamma, tgamma).
>>>
>>> Significant 4x improvements for fused multiply-add (FMA) on AMD Zen 3=
 by updating ldbl-96 implementation.
>>>
>>> Improved remainder, frexp, and frexpl.
>>>
>>> Experimental Clang Support: Added support for building with LLVM Clan=
g (version 18+) on AArch64/x86_64 Linux.
>>>
>>> New CPU Detection: Enhanced detection for newer CPU architectures.
>>>
>>> 64-bit atomics for 32bit x86 patch is no longer required since upstre=
a has dropped this logic in 2.43 release
>>>
>>> [1] https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Da0ce8b07=
79e290596e99ca6d96c301684a2d7cfe
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>>
>>> Hi Khem,
>>>
>>> I have some build issue with this patch. Yet I had some merge
>>> conflicts, so maybe my resolutions were not correct.
>>>
>>> ERROR: nativesdk-gcc-runtime-15.2.0-r0 do_compile: Execution of '/srv=
/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/x86_64-natives=
dk-pokysdk-linux/nativesdk-gcc-runtime/15.2.0/temp/run.do_compile.3275864=
' failed with exit code 1
>>> ...
>>> | /srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work-shar=
ed/gcc-15.2.0-r0/sources/gcc-15.2.0/libgomp/affinity-fmt.c:330:25: error:=
 initialization discards 'const' qualifier from pointer target type [-Wer=
ror=3Ddiscarded-qualifiers]
>>> |   330 |               char *q =3D strchr (p + 1, '}');
>>> |       |                         ^~~~~~
>>>
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/324=
0
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/32=
29
>>>
>>> The branch that was tested if you want to check: https://git.yoctopro=
ject.org/poky-ci-archive/tag/?h=3Doecore/autobuilder.yoctoproject.org/val=
kyrie/a-full-3260
>>>
>>> Thanks,
>>> Mathieu
>>>
>>>
>>> Khem,
>>>
>>> Will you send a new version of this patch or should Deepesh do that ?
>>> We need this ASAP.
>>>
>>> ../Randy
>>>
>>>
>>>
>>> --
>>> # Randy MacLeod
>>> # Wind River Linux
>>>
>>>
>>>
>>>
>>
>>
>> --
>> Regards,
>> Hemanth Kumar M D
>>
>>
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#232590): https://lists.openembedded.org/g/openembe=
dded-core/message/232590
>> Mute This Topic: https://lists.openembedded.org/mt/117484328/10244482
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[Hemanth.KumarMD@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--=20
Regards,
Hemanth Kumar M D


