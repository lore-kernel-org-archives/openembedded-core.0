Return-Path: <bin.lan.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B98DE77184
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 01:31:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.96477.1734485473823491846
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 17:31:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2082a9dab6=bin.lan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI0i2ep002933
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:31:13 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43hadq3mfg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:31:13 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BI1VCml006947;
	Tue, 17 Dec 2024 17:31:12 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43hadq3mff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 17:31:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IcNeMCWPtmajNQZNP0f1iYR3qozxrrAebQW0ld/gNOqC8kc+Ndbb320Py72pxD3q8bHRea0u7tp6LYjAlnWO4l4UzY7ElVKVsFmQ+5HQaBkcqSO4sgvKcvEHRtg4yREYQNqk8/fcrv/9h/whryFp/w4sZdPtmHFs1RJUyECPIP5Hrf9xbF2aA2IiD2oGQO1O64TZidfAoR+lMj6pK9e2ZlA3sG3YHyFkfPeZy6YZmVM3IuumeZnNhw4KrjBTzMlHSM71mWmbEhWhbhOd4wB4qYt9UYeYUUXGsSvjuKLTqZsVl4K5Kc7kmK2QD5gMCnaTEFrxUYSFh7Ii8TOtbeszmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIoaT4FjsI46Dt1MfWElkBbcrbR+KUTDLXuICJgL9S0=;
 b=B7Tk1ArzVRXepBRKwOdpVswoPnHFSaJb2cMHpmHysgbZ9Mz4S1NzjyAlowFUKWPfNlOsa0AdOhyLPNKV1lCZCNB3IXD43/VVy8ajX9MYdBtvhAOB/boKa/bGNsNO0qm8SBZzhuHtYgACI7/60TeJJmt2j+ryzGU4J9hRVJIk8JI0Emw5Mv+zx/Ieps93QrtVCMZtmAXCQoWdmfJvDymOQKeukP6h1+j2EGFDUGYihJqvawhpum+WtguGAtI/mHonRiWAKvpQLcUfjQE/1Zn9iSTfMoVQYVYkfajRr79M8a+Yl0ITKb5pYrg5Po9LQc3DHU8XSZYOjetQoPFbot7TMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8701.namprd11.prod.outlook.com (2603:10b6:610:1c8::10)
 by IA1PR11MB6073.namprd11.prod.outlook.com (2603:10b6:208:3d7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 01:31:10 +0000
Received: from CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0]) by CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0%6]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 01:31:10 +0000
Message-ID: <35f92102-8a92-48fd-9beb-671d487d50d2@windriver.com>
Date: Wed, 18 Dec 2024 09:31:34 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] gcc: backport patch to fix data relocation to
 !ENDBR: stpcpy
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20241217104729.4115134-1-bin.lan.cn@windriver.com>
 <CAMKF1so72XWNdOaF0MFYJrAC7SLrx7TWDHiCO2iSybj6ksc_Yw@mail.gmail.com>
Content-Language: en-US
From: Bin Lan <Bin.Lan.CN@windriver.com>
In-Reply-To: <CAMKF1so72XWNdOaF0MFYJrAC7SLrx7TWDHiCO2iSybj6ksc_Yw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYAPR01CA0097.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::13) To CH3PR11MB8701.namprd11.prod.outlook.com
 (2603:10b6:610:1c8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8701:EE_|IA1PR11MB6073:EE_
X-MS-Office365-Filtering-Correlation-Id: ac8c4ee2-d3be-441a-c6e4-08dd1f03a71a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RkhNS3dCeE9VK3BhaHd5WXM3TlowOEVLMXlSaDJEcUx4bjRFL0VSdzlCUllo?=
 =?utf-8?B?d0pkelN1RjdpUlQ1RmpmSG5ETHZvR3dpVnIyVXBVcHhJd1hqalgrUGxKK1Rj?=
 =?utf-8?B?SXNuSHI3YVdzTVdzbHNNcmdNaGtJam5WUUo2cCsxV2wwaW5jeUszeWdCaktI?=
 =?utf-8?B?emJ4QzdyS1poM0dtYWVudXdmWWlHY3M5U29XNkpCZXlMV1NjUXcxQ2ZmUGF6?=
 =?utf-8?B?YXJrTzNLZzcrQnZZQmlRMGVsUHZkbHJGTFJZTEM3eTEwd3hFNVFVS3o2bzl1?=
 =?utf-8?B?WXlLNG9tVmh5TVRYcTBuQVZKV0xMSjdoRkR2MXNnMnpWQ1FLQmV2SFZWYm00?=
 =?utf-8?B?bTBseUsyQjI1WHBYVmhMQTRqcDQyNGoyUXIydTFQYjU5aktMcnRzS3hmNnoz?=
 =?utf-8?B?RWhXYjZScU9vUUdWYjhGQnlydFZRckJJTGluZVNDVFdrMDRuc2xSVnlzenI1?=
 =?utf-8?B?dlJMU3BtNVl6ZmhlaG0ycjN2TmxpYUtjTTBPaVNtaTFIdjJETUl3RU1odDJt?=
 =?utf-8?B?MnROV2lHVzUzcXZXa3hYdU13MExWR2xhWVQ1NXM2UytBeHJUM1daekkvNWQ5?=
 =?utf-8?B?b2dMMjlyd3ZnM3ZpR3RucE5XMW40WlN6eXUxU2tXRG1kaFE5NHpqYzE1MWd2?=
 =?utf-8?B?OFhIS0cxSzBWOFl6Vng3cHVvRmNjTjYyNU1WOWptcFVOZ3pjc3VYZHMza2dJ?=
 =?utf-8?B?L0hJWFQ2aHorUVVyS1cvVE1TMkFtNmNqakxqaVJOTmt5UTlkNWowTXhDWWt2?=
 =?utf-8?B?dW5iL2xHR1Z0OWd3Y3RNamlGLzdWNUpiZGZvbkoxT1FFL1dRY3pPdDBQbTF2?=
 =?utf-8?B?azFPOXcxMnJ5TEFPaTdjb2xySkNwS3JIWmoySWw5aVYrVzVnbXVUTTBUcm1M?=
 =?utf-8?B?alc2MFcwNmpua1RKdEF1L3FqMFFnOElqNGlhTGEvdTZTNCtWN29WWXc2c1lK?=
 =?utf-8?B?Mld5U0szcTVFc0x5cFp2dDlQYjRIN0Y2NWV4N2k2TnQwQ0UyL1M4WXk1aEhT?=
 =?utf-8?B?NmNVQUJtNFE4K216YVQ3eUl1NVU1cVdubzZBUTV3OUl1d1VVejEycmVEcG9q?=
 =?utf-8?B?YUdMZ1RHTTlTaG5pa3k4ZTdqaGJVa1BQNU10SVZrSHB0MDFhcGpVajdGdm9l?=
 =?utf-8?B?UUpaYWd2WitacFVTRkVxR0JTSTFFUFpaUnZDb1dTNmdxMHBUNk5xU1hOWk9q?=
 =?utf-8?B?aFJrYXl6b2dvRjNDVThvUmcrMGhpOVZoUE1sc091ckl1Unl5aGl4b2JVVWpX?=
 =?utf-8?B?MENXelZGK0pXeUM2a0d4ckJGZXNtUW1YSGdGbHBHMjZGcWttMlpwZTNNOWZM?=
 =?utf-8?B?Z1FiWXFQV0lkSHVoakxxTHJRL1hvUk5VRUdsTElxT0k5Q1RjemxkMUZRZ2Nk?=
 =?utf-8?B?OTJiZ2tQSWFvSndEQUtyZ1JKV1cyc0sreU5RdHJpTHlQTkNXTmJPQ3lnQUov?=
 =?utf-8?B?TE9Id3BNejYvWXFHNWI0SEVwdm1PSFJWWXBrUmN1REtJZE1xb0RKTmdWZ2NS?=
 =?utf-8?B?cktPY3lJbWFyeW00M1JDTnl1bVlYUlVXd04zTnowRE94R2hQNkJjUkhvMUNX?=
 =?utf-8?B?ZEF6UkMweU1KcVB0dkhyM2ZKd29zTG1VdmhZTVMwY0grWC9VTTR2QURKWElF?=
 =?utf-8?B?MFFCVkRBQmcrRm1tK1dvQ3RrQUF5NEo0RGx3YUQ1aExGMUpoQWNjejByeWJs?=
 =?utf-8?B?SzBPU0VITTB0VWlwMmRFVVhzek95RFBtei8yQkY3WlVMczcyNThmaWVJenpY?=
 =?utf-8?B?VnNmVll0SHpaN29QTGNsams0RGhjRHltOHhBQ3JyTXcrdkdUM251ckYzMjlQ?=
 =?utf-8?B?cG50bTZweHMzMDNaek9pUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8701.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VldQdVk2SWxlT0N0VGRKd05PVVhDQ1RKY0FwL2szVlE5QVlLTUo1S1Uzamly?=
 =?utf-8?B?M0lQOFVNRUhDS1VoMEZZN1MrdTcwSWFjU1FIYWdMNlFUNGN6dEJUNi9PQVI0?=
 =?utf-8?B?Q3VDbytxbE9aNmIwYWJpdkZzc25IWjYwZjF5VGpUbENVYWZDdm45VkdEN2lm?=
 =?utf-8?B?aXFCU1FPSElDcFlReE1CMTFBYUxHd1FCMjRyV1Y0M0U5VFZzV09MVnBYYU5y?=
 =?utf-8?B?WTNXZ2NGN1puNXIvbk53TUY4Z2xLSTdtMFFRTlM4Mm5oQTNDbVpFVkpMeE5G?=
 =?utf-8?B?cFBpTFMxVGhmRmU4U3JvWm5NM3dSZnB3OElvc3hMSksvR0xFOUdzMi9UL3VX?=
 =?utf-8?B?a01EaHlidUhTYTljQ3NiUVN0N1BOVzRnS0REd1B4VHpZV0tUUWxTVFhsYUdJ?=
 =?utf-8?B?VlhhRzlMV3pVLy9JZ21HOGl3V2tCa2UyUEV1cmpSdGE5c2pCZ0oxVzMvS2hQ?=
 =?utf-8?B?cGFHVEZnZ2ViY1VORTA1UEFzZWRhMXJzWG9xa2NMdXlPT3NicVd3QTZ5V29n?=
 =?utf-8?B?dmc1Y05WYXZoZmFuSUlUNjhXQnEvVlZwVXVTREdyYVU1N3YzbHpSUlExTWg3?=
 =?utf-8?B?cHNWQlVMZUlkSTBRSnl1TWdJT2dZWFVqc0Q2d0Rwd2pzZkdKL01KMTJDSGFs?=
 =?utf-8?B?bUJsQkM3NjR6QlJXd0NaaFJjRklzajZBaTlvVXo0NHF6UGhLV0FWSk82RU1a?=
 =?utf-8?B?RVFLSXpwVHJ3blkybE1oaklhOFkwUUdYWGM1S0NXc2pKc0VuUldQcytaWkpK?=
 =?utf-8?B?TXF0U0psUGNUZnZCaldyR0MyOVJKbEdUMTg5NGtlbEV0UXJnME8za09aL0dm?=
 =?utf-8?B?NnFzMXFTK2RhVk4zTGlJRExJN3dlREU0OGhWbGxFRnBIZmgrSEFVWEZJK29K?=
 =?utf-8?B?ZFRTd3EvYXVQNGYwS2phdFRuSjlHMDdPcWd3STZVOVA4bTdVSXdoOThoYkRx?=
 =?utf-8?B?aHcyZStnS21hdWRyKzdHdTZ1S1lKemtDcUs0STMxcFdpZTdaMkNoS1o3MmE5?=
 =?utf-8?B?TVl1V3dnMjdpcHM0RmlyVWJZeEpyNU5qTmtocTkzbytKOG56ZDVBY2JjbnVp?=
 =?utf-8?B?SU02M21KQ3FIQUQrekJwcFdlTlV2ejNUUzk1b1hNNiszTTk3VFF6K2I3SC90?=
 =?utf-8?B?S3RSMDc5a0RFbXRoVW9JeVBUY1JkazQvUFlFaXRqZjRZdmRQZU1OUEZSSkM3?=
 =?utf-8?B?anhtK3hOUHZWaDBiNHpteTdXdjBEMFhVUUJFYktJMWdTQm15Umo3MXV5a2p0?=
 =?utf-8?B?UUwyMzFvL3VsOVpMMkJuQUhJS24wektNZzN1UWJ2enZvV1lxS3lBdjBwKzlQ?=
 =?utf-8?B?U3lPUjUxNUhrSHVIeUlrOVcrSVU2aWM5MUdKdXdiamNaV0w2aWd3YmZWc2lD?=
 =?utf-8?B?ejBLMUtsWVpVUHRFc1ZPQW9lRnRJVW5tUmxZSEpZTVk1RmcrcUNJbEdvRktF?=
 =?utf-8?B?NzVTam1GejY1VmtPMytvakxhSHp2Q3pIYU41ZlMwVUxTeGJwY2JIem1sQjUr?=
 =?utf-8?B?MlAwejhRT2o3aWFRa05DdUk4SjBCbmxyRWJvT1FXcFVVN0Z3NDFvak1jcnBV?=
 =?utf-8?B?c1FFTnZOOEJrR1liOEpCNE52Q0lXdGsrY1NJSHpyU29hZ0VBc25COWZxUVZl?=
 =?utf-8?B?VVdhLy9TcW0wT3dTTG5PclRKcmhTVDI3QlBWV3RxajVoREt1N1UzS1UxRDYy?=
 =?utf-8?B?Tlk0VXhFYU1rcFI5WStjeDl2aklNUis2L0FmWmRJekk1azFuOWFTUE9INTh4?=
 =?utf-8?B?YytYZFJQeTljS1JwRnpQVTloaHBNOTNZeEZRUUhRemV4Wk1Eby8rY3FmOHBD?=
 =?utf-8?B?djBYUk1zZHpHRkQvZVRoUHkzYVpwOUJkc2xZSE4zcCtGVktQbXVqZzVRVmlj?=
 =?utf-8?B?WjdlT201U3k0MDl5RURDeUxPZERRa2ViQllOaE81ajdtQzBZY3ZXdWo3OTY1?=
 =?utf-8?B?RUVwMW9heTNlTS9XRXBJWjAvWlBuU0YrTUl4LzlXVEQ4VUFHRGJKcnlmWFdN?=
 =?utf-8?B?Q1ZCUXV1YXp6cmpWMUtWdllnWUs5ZTVLLzZhOUw0Z1FwdytoemF6dTZFZy9z?=
 =?utf-8?B?NVZrOWUyMWdTeXpyZ3VsWGdjd0w4TVEwVUlnOFpxYnh5eTBuVlliNHY2U2hj?=
 =?utf-8?B?NkErRmwwM2dGb0JON0lqS2t0eTV2WHBGMmhORVJSQTgrRnh3RUdhZGNIYncr?=
 =?utf-8?B?NHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac8c4ee2-d3be-441a-c6e4-08dd1f03a71a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8701.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 01:31:10.6843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pSUpG29IO0Fsc1yHGRTKxCLLbphXHs8aMzGKOWa3sSwWoEotalRmrfi63fU9Um7iaJzSZ13jaszsi3jtVbSwpw1Kew4CxLjbdxP40b91vm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6073
X-Proofpoint-ORIG-GUID: J_zwdC8wQINcm5CJDqdVEkXRkbMdiqIc
X-Authority-Analysis: v=2.4 cv=INT4ChvG c=1 sm=1 tr=0 ts=676225e1 cx=c_pps a=gaH0ZU3udx4N2M5FeSqnRg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10
 a=mDV3o1hIAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=j3aK5QarhrN_uOSlfyMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: xHwVapKrVO12MDFYpENNJJaXByqVEACw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-18_01,2024-12-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412180008
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4BI0i2ep002933
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 01:31:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208867


On 12/18/24 01:20, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Tue, Dec 17, 2024 at 2:47=E2=80=AFAM Bin Lan via lists.openembedded.=
org
> <bin.lan.cn=3Dwindriver.com@lists.openembedded.org> wrote:
>> There is the following warning when building linux-yocto with
>> default configuration on x86-64 with gcc-14.2:
>>    AR      built-in.a
>>    AR      vmlinux.a
>>    LD      vmlinux.o
>>    vmlinux.o: warning: objtool: .export_symbol+0x332a0: data relocatio=
n to !ENDBR: stpcpy+0x0
>>
>> This change set removes the warning.
>>
>> PR target/116174 [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D11617=
4]
>>
>> Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
>> ---
>>   meta/recipes-devtools/gcc/gcc-14.2.inc        |   1 +
>>   ...ch-to-fix-data-relocation-to-ENDBR-s.patch | 447 ++++++++++++++++=
++
>>   2 files changed, 448 insertions(+)
>>   create mode 100644 meta/recipes-devtools/gcc/gcc/0027-gcc-backport-p=
atch-to-fix-data-relocation-to-ENDBR-s.patch
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-14.2.inc b/meta/recipes-dev=
tools/gcc/gcc-14.2.inc
>> index 4f505bef68..a25bc019e5 100644
>> --- a/meta/recipes-devtools/gcc/gcc-14.2.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-14.2.inc
>> @@ -69,6 +69,7 @@ SRC_URI =3D "${BASEURI} \
>>              file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.p=
atch \
>>              file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
>>             file://0026-gcc-Fix-c-tweak-for-Wrange-loop-construct.patc=
h \
>> +           file://0027-gcc-backport-patch-to-fix-data-relocation-to-E=
NDBR-s.patch \
> tiny nit.
> is this tab vs spaces ? can you fix this.

I have fixed it and the v2 patch is sent out.

//Bin Lan

>
>>              file://gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.p=
atch \
>>   "
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc/0027-gcc-backport-patch-to-=
fix-data-relocation-to-ENDBR-s.patch b/meta/recipes-devtools/gcc/gcc/0027=
-gcc-backport-patch-to-fix-data-relocation-to-ENDBR-s.patch
>> new file mode 100644
>> index 0000000000..5bede60816
>> --- /dev/null
>> +++ b/meta/recipes-devtools/gcc/gcc/0027-gcc-backport-patch-to-fix-dat=
a-relocation-to-ENDBR-s.patch
>> @@ -0,0 +1,447 @@
>> +From 4e7735a8d87559bbddfe3a985786996e22241f8d Mon Sep 17 00:00:00 200=
1
>> +From: liuhongt <hongtao.liu@intel.com>
>> +Date: Mon, 12 Aug 2024 14:35:31 +0800
>> +Subject: [PATCH] Move ix86_align_loops into a separate pass and inser=
t the
>> + pass after pass_endbr_and_patchable_area.
>> +
>> +gcc/ChangeLog:
>> +
>> +       PR target/116174
>> +       * config/i386/i386.cc (ix86_align_loops): Move this to ..
>> +       * config/i386/i386-features.cc (ix86_align_loops): .. here.
>> +       (class pass_align_tight_loops): New class.
>> +       (make_pass_align_tight_loops): New function.
>> +       * config/i386/i386-passes.def: Insert pass_align_tight_loops
>> +       after pass_insert_endbr_and_patchable_area.
>> +       * config/i386/i386-protos.h (make_pass_align_tight_loops): New
>> +       declare.
>> +
>> +gcc/testsuite/ChangeLog:
>> +
>> +       * gcc.target/i386/pr116174.c: New test.
>> +
>> +(cherry picked from commit c3c83d22d212a35cb1bfb8727477819463f0dcd8)
>> +
>> +Upstream-Status: Backport [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dp=
atch;h=3D4e7735a8d87559bbddfe3a985786996e22241f8d]
>> +
>> +Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
>> +---
>> + gcc/config/i386/i386-features.cc         | 191 +++++++++++++++++++++=
++
>> + gcc/config/i386/i386-passes.def          |   3 +
>> + gcc/config/i386/i386-protos.h            |   1 +
>> + gcc/config/i386/i386.cc                  | 146 -----------------
>> + gcc/testsuite/gcc.target/i386/pr116174.c |  12 ++
>> + 5 files changed, 207 insertions(+), 146 deletions(-)
>> + create mode 100644 gcc/testsuite/gcc.target/i386/pr116174.c
>> +
>> +diff --git a/gcc/config/i386/i386-features.cc b/gcc/config/i386/i386-=
features.cc
>> +index e3e004d55267..7de19d423637 100644
>> +--- a/gcc/config/i386/i386-features.cc
>> ++++ b/gcc/config/i386/i386-features.cc
>> +@@ -3253,6 +3253,197 @@ make_pass_remove_partial_avx_dependency (gcc:=
:context *ctxt)
>> +   return new pass_remove_partial_avx_dependency (ctxt);
>> + }
>> +
>> ++/* When a hot loop can be fit into one cacheline,
>> ++   force align the loop without considering the max skip.  */
>> ++static void
>> ++ix86_align_loops ()
>> ++{
>> ++  basic_block bb;
>> ++
>> ++  /* Don't do this when we don't know cache line size.  */
>> ++  if (ix86_cost->prefetch_block =3D=3D 0)
>> ++    return;
>> ++
>> ++  loop_optimizer_init (AVOID_CFG_MODIFICATIONS);
>> ++  profile_count count_threshold =3D cfun->cfg->count_max / param_ali=
gn_threshold;
>> ++  FOR_EACH_BB_FN (bb, cfun)
>> ++    {
>> ++      rtx_insn *label =3D BB_HEAD (bb);
>> ++      bool has_fallthru =3D 0;
>> ++      edge e;
>> ++      edge_iterator ei;
>> ++
>> ++      if (!LABEL_P (label))
>> ++      continue;
>> ++
>> ++      profile_count fallthru_count =3D profile_count::zero ();
>> ++      profile_count branch_count =3D profile_count::zero ();
>> ++
>> ++      FOR_EACH_EDGE (e, ei, bb->preds)
>> ++      {
>> ++        if (e->flags & EDGE_FALLTHRU)
>> ++          has_fallthru =3D 1, fallthru_count +=3D e->count ();
>> ++        else
>> ++          branch_count +=3D e->count ();
>> ++      }
>> ++
>> ++      if (!fallthru_count.initialized_p () || !branch_count.initiali=
zed_p ())
>> ++      continue;
>> ++
>> ++      if (bb->loop_father
>> ++        && bb->loop_father->latch !=3D EXIT_BLOCK_PTR_FOR_FN (cfun)
>> ++        && (has_fallthru
>> ++            ? (!(single_succ_p (bb)
>> ++                 && single_succ (bb) =3D=3D EXIT_BLOCK_PTR_FOR_FN (c=
fun))
>> ++               && optimize_bb_for_speed_p (bb)
>> ++               && branch_count + fallthru_count > count_threshold
>> ++               && (branch_count > fallthru_count * param_align_loop_=
iterations))
>> ++            /* In case there'no fallthru for the loop.
>> ++               Nops inserted won't be executed.  */
>> ++            : (branch_count > count_threshold
>> ++               || (bb->count > bb->prev_bb->count * 10
>> ++                   && (bb->prev_bb->count
>> ++                       <=3D ENTRY_BLOCK_PTR_FOR_FN (cfun)->count / 2=
)))))
>> ++      {
>> ++        rtx_insn* insn, *end_insn;
>> ++        HOST_WIDE_INT size =3D 0;
>> ++        bool padding_p =3D true;
>> ++        basic_block tbb =3D bb;
>> ++        unsigned cond_branch_num =3D 0;
>> ++        bool detect_tight_loop_p =3D false;
>> ++
>> ++        for (unsigned int i =3D 0; i !=3D bb->loop_father->num_nodes=
;
>> ++             i++, tbb =3D tbb->next_bb)
>> ++          {
>> ++            /* Only handle continuous cfg layout. */
>> ++            if (bb->loop_father !=3D tbb->loop_father)
>> ++              {
>> ++                padding_p =3D false;
>> ++                break;
>> ++              }
>> ++
>> ++            FOR_BB_INSNS (tbb, insn)
>> ++              {
>> ++                if (!NONDEBUG_INSN_P (insn))
>> ++                  continue;
>> ++                size +=3D ix86_min_insn_size (insn);
>> ++
>> ++                /* We don't know size of inline asm.
>> ++                   Don't align loop for call.  */
>> ++                if (asm_noperands (PATTERN (insn)) >=3D 0
>> ++                    || CALL_P (insn))
>> ++                  {
>> ++                    size =3D -1;
>> ++                    break;
>> ++                  }
>> ++              }
>> ++
>> ++            if (size =3D=3D -1 || size > ix86_cost->prefetch_block)
>> ++              {
>> ++                padding_p =3D false;
>> ++                break;
>> ++              }
>> ++
>> ++            FOR_EACH_EDGE (e, ei, tbb->succs)
>> ++              {
>> ++                /* It could be part of the loop.  */
>> ++                if (e->dest =3D=3D bb)
>> ++                  {
>> ++                    detect_tight_loop_p =3D true;
>> ++                    break;
>> ++                  }
>> ++              }
>> ++
>> ++            if (detect_tight_loop_p)
>> ++              break;
>> ++
>> ++            end_insn =3D BB_END (tbb);
>> ++            if (JUMP_P (end_insn))
>> ++              {
>> ++                /* For decoded icache:
>> ++                   1. Up to two branches are allowed per Way.
>> ++                   2. A non-conditional branch is the last micro-op =
in a Way.
>> ++                */
>> ++                if (onlyjump_p (end_insn)
>> ++                    && (any_uncondjump_p (end_insn)
>> ++                        || single_succ_p (tbb)))
>> ++                  {
>> ++                    padding_p =3D false;
>> ++                    break;
>> ++                  }
>> ++                else if (++cond_branch_num >=3D 2)
>> ++                  {
>> ++                    padding_p =3D false;
>> ++                    break;
>> ++                  }
>> ++              }
>> ++
>> ++          }
>> ++
>> ++        if (padding_p && detect_tight_loop_p)
>> ++          {
>> ++            emit_insn_before (gen_max_skip_align (GEN_INT (ceil_log2=
 (size)),
>> ++                                                  GEN_INT (0)), labe=
l);
>> ++            /* End of function.  */
>> ++            if (!tbb || tbb =3D=3D EXIT_BLOCK_PTR_FOR_FN (cfun))
>> ++              break;
>> ++            /* Skip bb which already fits into one cacheline.  */
>> ++            bb =3D tbb;
>> ++          }
>> ++      }
>> ++    }
>> ++
>> ++  loop_optimizer_finalize ();
>> ++  free_dominance_info (CDI_DOMINATORS);
>> ++}
>> ++
>> ++namespace {
>> ++
>> ++const pass_data pass_data_align_tight_loops =3D
>> ++{
>> ++  RTL_PASS, /* type */
>> ++  "align_tight_loops", /* name */
>> ++  OPTGROUP_NONE, /* optinfo_flags */
>> ++  TV_MACH_DEP, /* tv_id */
>> ++  0, /* properties_required */
>> ++  0, /* properties_provided */
>> ++  0, /* properties_destroyed */
>> ++  0, /* todo_flags_start */
>> ++  0, /* todo_flags_finish */
>> ++};
>> ++
>> ++class pass_align_tight_loops : public rtl_opt_pass
>> ++{
>> ++public:
>> ++  pass_align_tight_loops (gcc::context *ctxt)
>> ++    : rtl_opt_pass (pass_data_align_tight_loops, ctxt)
>> ++  {}
>> ++
>> ++  /* opt_pass methods: */
>> ++  bool gate (function *) final override
>> ++    {
>> ++      return optimize && optimize_function_for_speed_p (cfun);
>> ++    }
>> ++
>> ++  unsigned int execute (function *) final override
>> ++    {
>> ++      timevar_push (TV_MACH_DEP);
>> ++#ifdef ASM_OUTPUT_MAX_SKIP_ALIGN
>> ++      ix86_align_loops ();
>> ++#endif
>> ++      timevar_pop (TV_MACH_DEP);
>> ++      return 0;
>> ++    }
>> ++}; // class pass_align_tight_loops
>> ++
>> ++} // anon namespace
>> ++
>> ++rtl_opt_pass *
>> ++make_pass_align_tight_loops (gcc::context *ctxt)
>> ++{
>> ++  return new pass_align_tight_loops (ctxt);
>> ++}
>> ++
>> + /* This compares the priority of target features in function DECL1
>> +    and DECL2.  It returns positive value if DECL1 is higher priority=
,
>> +    negative value if DECL2 is higher priority and 0 if they are the
>> +diff --git a/gcc/config/i386/i386-passes.def b/gcc/config/i386/i386-p=
asses.def
>> +index 7d96766f7b96..e500f15c9971 100644
>> +--- a/gcc/config/i386/i386-passes.def
>> ++++ b/gcc/config/i386/i386-passes.def
>> +@@ -31,5 +31,8 @@ along with GCC; see the file COPYING3.  If not see
>> +   INSERT_PASS_BEFORE (pass_cse2, 1, pass_stv, true /* timode_p */);
>> +
>> +   INSERT_PASS_BEFORE (pass_shorten_branches, 1, pass_insert_endbr_an=
d_patchable_area);
>> ++  /* pass_align_tight_loops must be after pass_insert_endbr_and_patc=
hable_area.
>> ++     PR116174.  */
>> ++  INSERT_PASS_BEFORE (pass_shorten_branches, 1, pass_align_tight_loo=
ps);
>> +
>> +   INSERT_PASS_AFTER (pass_combine, 1, pass_remove_partial_avx_depend=
ency);
>> +diff --git a/gcc/config/i386/i386-protos.h b/gcc/config/i386/i386-pro=
tos.h
>> +index 46214a63974d..36c7b1aed42b 100644
>> +--- a/gcc/config/i386/i386-protos.h
>> ++++ b/gcc/config/i386/i386-protos.h
>> +@@ -419,6 +419,7 @@ extern rtl_opt_pass *make_pass_insert_endbr_and_p=
atchable_area
>> +   (gcc::context *);
>> + extern rtl_opt_pass *make_pass_remove_partial_avx_dependency
>> +   (gcc::context *);
>> ++extern rtl_opt_pass *make_pass_align_tight_loops (gcc::context *);
>> +
>> + extern bool ix86_has_no_direct_extern_access;
>> +
>> +diff --git a/gcc/config/i386/i386.cc b/gcc/config/i386/i386.cc
>> +index 6f89891d3cb5..288c69467d62 100644
>> +--- a/gcc/config/i386/i386.cc
>> ++++ b/gcc/config/i386/i386.cc
>> +@@ -23444,150 +23444,6 @@ ix86_split_stlf_stall_load ()
>> +     }
>> + }
>> +
>> +-/* When a hot loop can be fit into one cacheline,
>> +-   force align the loop without considering the max skip.  */
>> +-static void
>> +-ix86_align_loops ()
>> +-{
>> +-  basic_block bb;
>> +-
>> +-  /* Don't do this when we don't know cache line size.  */
>> +-  if (ix86_cost->prefetch_block =3D=3D 0)
>> +-    return;
>> +-
>> +-  loop_optimizer_init (AVOID_CFG_MODIFICATIONS);
>> +-  profile_count count_threshold =3D cfun->cfg->count_max / param_ali=
gn_threshold;
>> +-  FOR_EACH_BB_FN (bb, cfun)
>> +-    {
>> +-      rtx_insn *label =3D BB_HEAD (bb);
>> +-      bool has_fallthru =3D 0;
>> +-      edge e;
>> +-      edge_iterator ei;
>> +-
>> +-      if (!LABEL_P (label))
>> +-      continue;
>> +-
>> +-      profile_count fallthru_count =3D profile_count::zero ();
>> +-      profile_count branch_count =3D profile_count::zero ();
>> +-
>> +-      FOR_EACH_EDGE (e, ei, bb->preds)
>> +-      {
>> +-        if (e->flags & EDGE_FALLTHRU)
>> +-          has_fallthru =3D 1, fallthru_count +=3D e->count ();
>> +-        else
>> +-          branch_count +=3D e->count ();
>> +-      }
>> +-
>> +-      if (!fallthru_count.initialized_p () || !branch_count.initiali=
zed_p ())
>> +-      continue;
>> +-
>> +-      if (bb->loop_father
>> +-        && bb->loop_father->latch !=3D EXIT_BLOCK_PTR_FOR_FN (cfun)
>> +-        && (has_fallthru
>> +-            ? (!(single_succ_p (bb)
>> +-                 && single_succ (bb) =3D=3D EXIT_BLOCK_PTR_FOR_FN (c=
fun))
>> +-               && optimize_bb_for_speed_p (bb)
>> +-               && branch_count + fallthru_count > count_threshold
>> +-               && (branch_count > fallthru_count * param_align_loop_=
iterations))
>> +-            /* In case there'no fallthru for the loop.
>> +-               Nops inserted won't be executed.  */
>> +-            : (branch_count > count_threshold
>> +-               || (bb->count > bb->prev_bb->count * 10
>> +-                   && (bb->prev_bb->count
>> +-                       <=3D ENTRY_BLOCK_PTR_FOR_FN (cfun)->count / 2=
)))))
>> +-      {
>> +-        rtx_insn* insn, *end_insn;
>> +-        HOST_WIDE_INT size =3D 0;
>> +-        bool padding_p =3D true;
>> +-        basic_block tbb =3D bb;
>> +-        unsigned cond_branch_num =3D 0;
>> +-        bool detect_tight_loop_p =3D false;
>> +-
>> +-        for (unsigned int i =3D 0; i !=3D bb->loop_father->num_nodes=
;
>> +-             i++, tbb =3D tbb->next_bb)
>> +-          {
>> +-            /* Only handle continuous cfg layout. */
>> +-            if (bb->loop_father !=3D tbb->loop_father)
>> +-              {
>> +-                padding_p =3D false;
>> +-                break;
>> +-              }
>> +-
>> +-            FOR_BB_INSNS (tbb, insn)
>> +-              {
>> +-                if (!NONDEBUG_INSN_P (insn))
>> +-                  continue;
>> +-                size +=3D ix86_min_insn_size (insn);
>> +-
>> +-                /* We don't know size of inline asm.
>> +-                   Don't align loop for call.  */
>> +-                if (asm_noperands (PATTERN (insn)) >=3D 0
>> +-                    || CALL_P (insn))
>> +-                  {
>> +-                    size =3D -1;
>> +-                    break;
>> +-                  }
>> +-              }
>> +-
>> +-            if (size =3D=3D -1 || size > ix86_cost->prefetch_block)
>> +-              {
>> +-                padding_p =3D false;
>> +-                break;
>> +-              }
>> +-
>> +-            FOR_EACH_EDGE (e, ei, tbb->succs)
>> +-              {
>> +-                /* It could be part of the loop.  */
>> +-                if (e->dest =3D=3D bb)
>> +-                  {
>> +-                    detect_tight_loop_p =3D true;
>> +-                    break;
>> +-                  }
>> +-              }
>> +-
>> +-            if (detect_tight_loop_p)
>> +-              break;
>> +-
>> +-            end_insn =3D BB_END (tbb);
>> +-            if (JUMP_P (end_insn))
>> +-              {
>> +-                /* For decoded icache:
>> +-                   1. Up to two branches are allowed per Way.
>> +-                   2. A non-conditional branch is the last micro-op =
in a Way.
>> +-                */
>> +-                if (onlyjump_p (end_insn)
>> +-                    && (any_uncondjump_p (end_insn)
>> +-                        || single_succ_p (tbb)))
>> +-                  {
>> +-                    padding_p =3D false;
>> +-                    break;
>> +-                  }
>> +-                else if (++cond_branch_num >=3D 2)
>> +-                  {
>> +-                    padding_p =3D false;
>> +-                    break;
>> +-                  }
>> +-              }
>> +-
>> +-          }
>> +-
>> +-        if (padding_p && detect_tight_loop_p)
>> +-          {
>> +-            emit_insn_before (gen_max_skip_align (GEN_INT (ceil_log2=
 (size)),
>> +-                                                  GEN_INT (0)), labe=
l);
>> +-            /* End of function.  */
>> +-            if (!tbb || tbb =3D=3D EXIT_BLOCK_PTR_FOR_FN (cfun))
>> +-              break;
>> +-            /* Skip bb which already fits into one cacheline.  */
>> +-            bb =3D tbb;
>> +-          }
>> +-      }
>> +-    }
>> +-
>> +-  loop_optimizer_finalize ();
>> +-  free_dominance_info (CDI_DOMINATORS);
>> +-}
>> +-
>> + /* Implement machine specific optimizations.  We implement padding o=
f returns
>> +    for K8 CPUs and pass to avoid 4 jumps in the single 16 byte windo=
w.  */
>> + static void
>> +@@ -23611,8 +23467,6 @@ ix86_reorg (void)
>> + #ifdef ASM_OUTPUT_MAX_SKIP_ALIGN
>> +       if (TARGET_FOUR_JUMP_LIMIT)
>> +       ix86_avoid_jump_mispredicts ();
>> +-
>> +-      ix86_align_loops ();
>> + #endif
>> +     }
>> + }
>> +diff --git a/gcc/testsuite/gcc.target/i386/pr116174.c b/gcc/testsuite=
/gcc.target/i386/pr116174.c
>> +new file mode 100644
>> +index 000000000000..8877d0b51af1
>> +--- /dev/null
>> ++++ b/gcc/testsuite/gcc.target/i386/pr116174.c
>> +@@ -0,0 +1,12 @@
>> ++/* { dg-do compile { target *-*-linux* } } */
>> ++/* { dg-options "-O2 -fcf-protection=3Dbranch" } */
>> ++
>> ++char *
>> ++foo (char *dest, const char *src)
>> ++{
>> ++  while ((*dest++ =3D *src++) !=3D '\0')
>> ++    /* nothing */;
>> ++  return --dest;
>> ++}
>> ++
>> ++/* { dg-final { scan-assembler "\t\.cfi_startproc\n\tendbr(32|64)\n"=
 } } */
>> +--
>> +2.43.5
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#208831): https://lists.openembedded.org/g/openembe=
dded-core/message/208831
>> Mute This Topic: https://lists.openembedded.org/mt/110160747/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

