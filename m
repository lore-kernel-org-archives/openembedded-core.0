Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C89EC55166
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 23:52:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.710.1785369122101049180
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 16:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=rTnX9+X2;
 spf=temperror, err=temporary DNS error (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2670ca2d30=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TNnv9A2695180
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 16:52:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=4+0dxCybc5ePyEfvH4ko8Y4mCaOMbfKRW4IO5xEUdAE=; b=
	rTnX9+X2t1HjIf4zn4sh/vzqiQ1y0hYey2tTuMpu5vDIdmOE7nXN36z2uaMRQKVG
	cfLVus50Y12EsfA3oUo33KC4Q2/hoBrh1yT3P7p/nOtAkt9GLYcyxm7iER8GcjN8
	IvrzhCMDfYUjoGbfj/o7w0r5OhHBauTIzFEWrq7v/pGgn/0gUmNO0YxRp4j15c7K
	KxxyO9ZoAncCFanVdemxAWPF5s8yth6nfCwfldmk7vhddXS/RPTnU38eZiYUrw6z
	PGV0yP6E6qm81OYfCrMwjp2vbv3ZSMHbMGJ6jbK/gZDO0M06kRMqBLpMlxQPG5f7
	OaYFKYnuZ8gOCZz+AWMccQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010051.outbound.protection.outlook.com [52.101.201.51])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fqugmg038-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 16:51:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lOtpCV07AOydqLC1H8c5sJJQ7kMUp3eqTHzWtViwhhaO027fAqU9rhtRVRni26d7KIwDr5GvQ2niftwdpoFbyRnnpwU3PXY1+Rf8ks6V/qnn2Luxy3lSruu1q3INi/lkOuEBb0nolP7M6YYaGfMS/AWwAb6Rt2CT/SYiREiEYtp3ff7ZfKLp2xHDbRjrXak1jX95u1SS8ukU+QZw5u60I0N71zecnqgsCs3lGaQm97MdveKXHPmTONqqWLK/BLw2v/BaS1oms+EcgHWiLHRyU5l5qmPX3NFCFhqsMFvV6kIGVmzyf0FyJ45JoB8JOhODMEhBJmeEzGUD5TIhqEY9ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+0dxCybc5ePyEfvH4ko8Y4mCaOMbfKRW4IO5xEUdAE=;
 b=y0dSAoAuSt/pRpDfqh1KQMQDnk6jZNSM5ybJX9W457jWDX0jdnkt/vp/CL9TRovPQqSY3M3QqQyUh+MLjpVi/SKV+5EOYyJRO27WSt/8fjtMPSbZwiprADMC2v7zAj1TeDhEV6XTY7eqsO307A1WFjMDu12S8hKSF+O5cICAOz03qHJmY7bO/4aVd70r1D4i5pb7xDMZsiT8bO0Vf/mDtj7ee1dtJVVLchHmd7AfyCgG4B8Bzb6uiNt0aonvjJl98ZyhLrEfEH2D0YPeXpB7/sNXPfVmu7LoqeXO7YydMbUBA31/oE8QrTvCudLUcEQEG1OKIJsuaqGPJkjlwM/UXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by MN0PR11MB6183.namprd11.prod.outlook.com (2603:10b6:208:3c5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 23:51:57 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 23:51:57 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v11 4/9] lib/oe/package.py: Filter out /usr/bin/pkg-config file dependency
Date: Wed, 29 Jul 2026 16:51:35 -0700
Message-ID: <20260729235141.1067679-5-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260729235141.1067679-1-sumanth.gavini@windriver.com>
References: <20260729235141.1067679-1-sumanth.gavini@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: BY3PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::30) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|MN0PR11MB6183:EE_
X-MS-Office365-Filtering-Correlation-Id: a0cdc713-6b07-44ca-69ab-08deedcc601d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|52116014|38350700014|6133799003|5023799004|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	thxEWyFvocPV7Fz6pcC3M+Hg1xZBa1yPu8ZsLkO4ppi9YYj3jUjoBX759INjNrbwq7XN/V8fWB2YsOhAYGWbJVUqtDMHyYH9pNq3J6TkvT7uor6HdlNKqpvQrdm1qOGmJ5uI1btCVsmNqh+PGufXFk6OKN5cVXagLFjsq2c1M0dC3u7XO0ibODV987HBPQ9/QRkIkOQCXxmgKLohPrwDVFK9WKSLHLH/iB+y6H4TIZ7yDAb7eL4BiWeM3LClME9RzgdnCTMZQH5KtbO/BHOJuJLuOLiW0wVbSYztWYr1aZwaoJgvpMVeuh4BU/tPYbv8i/vJ/JpYS8RMZ7NtvipdyVlojFPiKPllAkUAI2hadLSVEQSSI/vUsbyKbour5myksUk62H7zGyEck/Qi1eITSznBzKiRkJJfWnsQQ4jq3NX1uWruiPQUETRSHeWHmnE+fA5RLoGNC8ZT6M7s5qKNavr4NPuuoc2bFIKnjQyLlZENbXjsJ5ozcLPJaeMzoNVs5f7DMwI/FXDTLE96Y0l3fqZGkglLd9FQYg82eUu5byuxg+w8KX6lHnZ9MAobnx+azmRfYC4vst+MMgzA5j/rZKDrpd4ZRTI5QyE4FaZpHpKzjnAFShyTZiX+aPQi8p2svGhS4vZjCv/AQYkAH8c6NxOdknywyWrBMUumB+guQKf8l1iq1huD33JcRQ1AInIepzJFgHKLU6ZvkG8LQzDriI53GugnvYg/l7dqJDGydwY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(52116014)(38350700014)(6133799003)(5023799004)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V2dJVVY4ZzVwV3VOLzBzTzJXN3NPVzdnTTFDU1JmTWZEUUFrNW5JbHFTZjJW?=
 =?utf-8?B?Ris2TTdKUnFxR2ljc0YzMng0M3dpMGw3WUxzQkJJOTFVV2xxM2tCQ0tYalh6?=
 =?utf-8?B?YzhDSU83MXBEVmFra2pFOW9jZ2Yzd1VnbHQzWUpsckpMUks4VnAzQTFVUUJP?=
 =?utf-8?B?QU82dzRYNjlLU3A4a0Qxb2ZUWUtyUkszVHNlU1BPd1I0WDZrdHduS3E0bXJT?=
 =?utf-8?B?eUlBY1NTZEVQV2ZkVUtNSmZBZWRtVm9FVGk5bUNBUVdLenRsODd3Uk03ei9Y?=
 =?utf-8?B?VFcraVROaXh5Vm5jM2F5Ky9GM3J2bngveUhvN0JVUlpjK2lpQUUrWnZOQmU1?=
 =?utf-8?B?TWNsUVBGU1pUY0M4SVJuamFldTJkWmV3UTlYeWJiMkJ3K0diRFd6R1NNTTdh?=
 =?utf-8?B?c1pNcUhUN1pQaVlRb2hOcldZb21ybnY2L0dJSHd1Q1ZtMncrTVhlMXR2VVpy?=
 =?utf-8?B?YkZaTzhNa2NJRGZ3aEZkTHplUnhZY2JxN2o4Z3FkVkp0bmxvTmIvUkpweXBk?=
 =?utf-8?B?ai9oMzlFS3YyV3ovdDhQSmp5VlFyLytFRGV6S1FtdjNNMkFxY24vaVAyZGYw?=
 =?utf-8?B?dlpyUVZpcWtQMTV3QWZRc1docWJWQW00K01XcE1RYUNNUEVabXQrQnRqU3Zo?=
 =?utf-8?B?YnYrVEorSi9HUXNkMHRKSnpTdWVKd1dXV2hXWWVaQVpadmFZSm1Uck9oNzli?=
 =?utf-8?B?NGF1SVJ2ZW5PeG0xRUpWWHZDQmpqSExRaVM2U1FFanVPNng1c3NOSWR0R1RH?=
 =?utf-8?B?RWp3WERtK2c4YU5uY3dTby8wbmRoU0RGMTMxTlJ5L2hpSXp0bUdpU0xQa3hm?=
 =?utf-8?B?VzlpWDY2UWNTRlJrbnlKcVJaNGR4RjkyQWt6S2JXaDBQc0dBT3RscUVpYVZW?=
 =?utf-8?B?NUJiQ2ZPK0k4R01DNG5uV3hCb1hNQnlOQU1pWHg0OHE0MXl6TEVQamEvVkZi?=
 =?utf-8?B?SllsMlV5OWdNZ29veXYyY1o2UWphV1lFQjBqa1QvMzdzMzB6MTUyTGlJck5x?=
 =?utf-8?B?OFU0bytDU00xNm1uRTZBMGtnNlpQZHlHbDlRWTROYTFTUk5Cb0FNN0V5M0lz?=
 =?utf-8?B?U1B1ZW8rTWxMbFRPNTl3MkxqTkNIR3lLay8yUXJaWFRMY3lUUWpSK3BudUdr?=
 =?utf-8?B?SUd5OUtGcnlaMXZZWXpQLzQrdkJ4dFFoRUJSQzN2TUJCRjVEY2VnMVFjZldl?=
 =?utf-8?B?b0NQU08wNW5YQk1UMDd1TUs4aWk5Mnd0NHJVbEh0RlJobkVYaHhNRlJMTlhl?=
 =?utf-8?B?SEE1VWJ5Mmg3d0lBWXdkSzN3OW9YQjBqN1FkYTlKbEc5MXhBQk1ZTWs2eGQ2?=
 =?utf-8?B?UmRJd3JVYlNUd3J3bnR5b1JHT0pVdzc5K1BlMXdwZ0xMbDk3TmlkVTdvQzd0?=
 =?utf-8?B?Ym5xZm1ZYXpIWk5aUm1lUnNieXVheTkvd1lOMllRb1EzeTFFUjVuQVBvcVBa?=
 =?utf-8?B?aWdTSlkrdlhQSVRsUGt2TDRQZDJzSDI1RWhySE43MGJINXdjNDJzeFU5K3M5?=
 =?utf-8?B?dDZVSUZLc2xORzhHVzFNc0RUaWN0UkFaUERBa0ozdHArRTJ2cENmaFBYUTVJ?=
 =?utf-8?B?TGR2R3YrS2ovQ0w1Nm1HZUpZWFpSU2xwUkh0MlFBNm5rWGN0T0J0amw1a0tP?=
 =?utf-8?B?VEI4SzY4UjRNRm5MczQ4UDVvQ2tpZmJJS1Voa0ZmL25ia2hyQTVlams2c2lM?=
 =?utf-8?B?RGtnM2lKZjUvSFR0L2F3aHR0MjJpNXAyUGZTcEx1SWI1dnlYdTdaMzlvcW1R?=
 =?utf-8?B?aC9kRjRmVEZuZWdjSmxFNnM2V3JrQmxaR0lxTXBjUk43N1VvU3AxVGpCMnNp?=
 =?utf-8?B?NlVpWmt1a3Y4NDV2WGxqWTRJVk1DK3hUb3pScGN3OVp4cDQyL2s4NTdxMWVr?=
 =?utf-8?B?UWwrV2JNVFo3RCtCN0JGRlBmTEd3SUg4SG9sd3M5NWxpQXpWOWpqNVcvQmNY?=
 =?utf-8?B?Mm5DYytRbGpuZWhjU2t4bUFTOGtncWY2cCtQRHRmRjNEVkxqbnNHc0FUSGFj?=
 =?utf-8?B?V0tFUXdLdjVaNWs5MjRSUTQxRVRKRzRuWWE1YVZaLy9wTXpvYS9GR0FuVG5o?=
 =?utf-8?B?ZEtyK2svYmZPYjBHT2ZsNytiNllrdEQ5QVc3N2c0MFVuTElyMHI3dWV0K0l1?=
 =?utf-8?B?WldwUTFDRU1kRWhWTWt1ZlVGWjJJZUhWelV4dGx0K2xPblVkaW15Y2h1YW9h?=
 =?utf-8?B?N3c2NlM5aGZrKytQMHg0emtXUU5ya2ljbGkvWmk3RUFITXp1dFpaWTlQY0Fj?=
 =?utf-8?B?dERoenBLTUZEVUtNekRwZHk4dTBwVm9KbnBjUitjQ1BrMExNSWEwTVcxRUho?=
 =?utf-8?B?WnVrbTdSbjZFT0wycWJ3NlNFSjNlWWpYekUxMGZrek9oellHenZZaUtZcWM3?=
 =?utf-8?Q?hcoiU13Krr3oAXFs=3D?=
X-Exchange-RoutingPolicyChecked: 
	kWIW0eyxyzHEyEqXz8hN96B6ZfUw+qH7AYBGSc8HpA3uRzvPRELRhsL98vnDVoEpe6+eD1/e+s/vNubo8ggsD11dccrx+3cjP3Hoq7KQY74LhMLyPWgFU9INnJP/Aoe1O0jKW4COlWoPPZwL30GQyRdM5O1m8qdB2js/0Xn1HB/8sfLstIqyAGlllZ5TpfW5rjd9dphQjZqdBSJmUBpZDHIWyK6qWNpdJSP+3zveZw80cEPiCxJAB+GrevcWmI1msC2IZcMIq5WJV7pnf4Ebd6aQa/uDsMuaruoAISEqp5RWIAb6jM6meRUBt15Mo7C9O11Zq1i3gJ2YmoFqu2eglA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0cdc713-6b07-44ca-69ab-08deedcc601d
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 23:51:57.5985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Glhj0jXioVgIJ30R6tjki941zw/4rXLKOdH79bTvrS7VwBrhNppGb3QWaSJ+Ugor+psaaQ8ukoaC4kxO8B8ENtq7kRxWvYOD8ZnwoSp8PeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6183
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: UHNkxMo2qkdy-7ceLUec3RispyrTVYfC
X-Proofpoint-ORIG-GUID: gX_D9RyYKvFG2StrPh6W5GZGYZla6dZA
X-Authority-Analysis: v=2.4 cv=dtnrzVg4 c=1 sm=1 tr=0 ts=6a6a9221 cx=c_pps
 a=f0OpuPnQRmDrWRgsA3vZMw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=t7CeM3EgAAAA:8 a=cXaodKgrPycq8dEL5jgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE3NyBTYWx0ZWRfX34zumo5Df0oC
 4t3ji3wvQoUTMPJackZe1wuh031TVSSPUTEt04ot6UH/7uS3xFHTf2eBZwxWSzwAN4liXQ8qASB
 Pj+ZNVVnOv7dRkoP9cM/ts7YwRLWFRCB22o1zH6FVwM5WUWs6RVy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE3NyBTYWx0ZWRfX7SbUOFKzS2/T
 iH902GFltkJ9iIB9SzhuuU7FMovF/XnqBqvdZ+WuhJY8AHfHM/wAbEHz13xQgcRCGDqd/74wtmv
 oQdCuKJs1g3dyjjAdxFvrakge9CMMDmDrvIm0ymxkvYg7ykSwxpKd/ZFGZK7Q9QK0MuH/Unmwvb
 zEwNOO5PrGdg2pRJTaftqr9P3nP712BTP67k/Pxqxglp3E2Z2XLwywQuvg5dGnqdetVB5u0JFM+
 qPHksmbch6eNUea0FPjAQzRuAf2DyUUROCYEHwGGNgmrHjHtxXgwqu5G18bnvXJ4o6oWrS1l1ap
 CiQgrXFGQ/r7/zvVKcLzUmNBgOT58Q5i5X8gT6Vaq+9CYxAWdtNyQLd8mi4qET8vToUChMkI0P4
 zVGbVGf5SyxBa3QrdBU0PRNZvGIv9UWhJnW0sioUg4YkBJI+L41U1JKfBXK/x4X87ECgWaKlI3K
 uWHklMXLttAwD89qzAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_08,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290177
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 66TNnv9A2695180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 23:52:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242305

RPM's pkgconfig.attr fileattr auto-detects /usr/bin/pkg-config as a
Requires dependency for any package that ships .pc files. This causes
every -dev package to have a hard runtime dependency on pkg-config.

pkg-config is a development/build tool used at compile time to locate
libraries and flags via .pc files. It is not required at runtime on the
target.

Without this filter, do_rootfs and do_populate_sdk fail with errors
like:

  Error: nothing provides /usr/bin/pkg-config needed by
  python3-dev-3.14.6-r0.x86_64_v3 from oe-repo

This is triggered when IMAGE_FEATURES includes "ptest-pkgs" or
"dev-pkgs", or when building SDKs, because -dev packages are pulled
in and dnf cannot resolve the /usr/bin/pkg-config file dependency.

The fix filters this dependency at package generation time in
filedeprunner(), consistent with the existing filtering of python()
and perl() auto-dependencies in the same function.

Note: pkgconfig(foo) symbolic dependencies (e.g., pkgconfig(glib-2.0))
are NOT affected by this filter  they continue to work correctly for
build-time dependency resolution.

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/lib/oe/package.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 8ccd89a190..d210b4a73b 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -253,6 +253,20 @@ def filedeprunner(pkg, pkgfiles, rpmdeps, pkgdest):
             if dep.startswith("python("):
                 continue
=20
+            # Ignore the file dependency on /usr/bin/pkg-config. RPM's
+            # pkgconfig.attr fileattr auto-detects this as a Requires fo=
r
+            # any package that ships .pc files. However, pkg-config is a
+            # development/build tool used at compile time to locate
+            # libraries and their flags =E2=80=94 it is not needed at ru=
ntime.
+            # Without this filter, every -dev package would pull in
+            # pkg-config as a hard runtime dependency, causing do_rootfs
+            # and do_populate_sdk failures when pkg-config is not
+            # explicitly included in IMAGE_INSTALL or TOOLCHAIN_TARGET_T=
ASK.
+            # This is consistent with how we already filter python() and
+            # perl() auto-dependencies above.
+            if dep =3D=3D '/usr/bin/pkg-config':
+                continue
+
             # Ignore all perl(VMS::...) and perl(Mac::...) dependencies.=
 These
             # are typically used conditionally from the Perl code, but a=
re
             # generated as unconditional dependencies.

