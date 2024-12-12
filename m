Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA0C2E7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 14:35:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.20946.1734014124729921100
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 06:35:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=207616a842=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCALcEY018304
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 06:35:24 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cwy1wpms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 06:35:24 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BCEZNnN002999
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 06:35:23 -0800
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cwy1wpmq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 06:35:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FnbPC3qEYIPuoOfkzjJCzrujhPo33XbAESiRQXFB3i9m+vSP4H3cKnd1U8MiIO/GKO8QWY/6qgDUCigAmzMmHgt4u4q80MwDfi19LFyL8MbwkybiNdV3bd3KTsfz5gqRXZxx3wse32+67Ce1Gk2GBiXMF/ubh/WKqBohtYT9V6tsMCizlswE+nOLDlVgtXPNrvH4mcprxj1AU60tyua5/XTQvHWn0sXnrUTTHUSgmGBWggSnm+TD38IcoeI5HxvHzL5apaIFoXo5q0RFC2aULztJFHo1DS3RWU4NUoPH2n4p+awPnrK10K26ZmWEntFAHmvBn/6XJ4xdNIrVsH9NWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4g2aN73ImlcLjPNINfxl7EkmfAM/ozsI5jKBng1InIQ=;
 b=wfdnqWB8SWP4QwgQ+bcENSClP+HJm2k7gk2inRH+hy9JT8Ktrt/HcbWqRhKKUfVGLdPQAhVG0bQ6yIveEt8jJ7YU/ksnFu2fk6LmQB2Srli4Soz/hI94LompeKRNK5/CvyLGRhfADgTtiLBz+nyadf8z4k8bTFqoBzT6ySi0th1yYeIs10zYHjk573pMb24RQKrSk+C83O7aF9IWMZT+vTjPh1mgntHh+zwl+hLT6FbgyvA9x7pI3JSi3v4Icf3v83rCTBYmwUYa39ADsnHWIMO9qOEP9zFTx8KZity+Bb17PhZ94AeUmUFD5l1DA+PqRjZc/cN4TCRZZLniS8my2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by PH8PR11MB6831.namprd11.prod.outlook.com (2603:10b6:510:22d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 14:35:19 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%4]) with mapi id 15.20.8230.016; Thu, 12 Dec 2024
 14:35:18 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com, Randy.MacLeod@windriver.com,
        Sundeep.Kokkonda@windriver.com, Yash.Shinde@windriver.com
Subject: [styhead][PATCH] binutils: Fix CVE-2024-53589
Date: Thu, 12 Dec 2024 06:35:05 -0800
Message-ID: <20241212143505.3625521-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: BYAPR01CA0025.prod.exchangelabs.com (2603:10b6:a02:80::38)
 To PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|PH8PR11MB6831:EE_
X-MS-Office365-Filtering-Correlation-Id: 42a291ea-3a91-45f4-c968-08dd1aba3364
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bllHMHNzQXFERFRqRmRyU2xyQTZ3a1FFc0FMQVRxQUFETFZ0WjQ0a2g5NWI5?=
 =?utf-8?B?ejZjVXo4THdQWi9nWWZGM0tncndvQU85eVZFTThHSWpLT1R5ZzhEeExXVWRZ?=
 =?utf-8?B?MnRXYk1YWU1tdGlKOWh1RFh3V3ZVQitFazRBWDk4L09QNFJHeXdFZmo1V3NT?=
 =?utf-8?B?RDBtSXhRQWl5QWdiMWN1cDMyZ1Jyb2lqVTJ1U1ljdmxTQWs0TU5kV2JUSHUr?=
 =?utf-8?B?SnUybGVyQ2xVNUNYRjdMbUt1NXNHcTFCMTRWT05nRkJpUFRvVlhsSkJXSFVS?=
 =?utf-8?B?dHBka1R1NENWT0lWemk3NTMrYmFMT3NtMkNranNxYkd1aG14aDAxUXBRQ2pZ?=
 =?utf-8?B?Z1g3em45S2sxdThLcm83eFFTZHRRdlZrcTVpTlJHWDkvUnhPY0p3S0Q0ZVFi?=
 =?utf-8?B?Sm0vTytXZ0JScGx0SUs2Nis3c1E4SlhiaE94Z1pZV2ZKaFliY2xSS24wUzFG?=
 =?utf-8?B?Z2VZMmgzYVN2K1VBejROQWQzRUNPcENoVjhHbDNZN3NHUWQ5YnM5ZlN1TzFr?=
 =?utf-8?B?UFdDa0I4OXc0VnFUcDdaU0JlSkFzZG0yQXFpWjFYalRlRGppeDFXSTJKWDdv?=
 =?utf-8?B?NEpMdmg0clNxWVMrWUwrVkZTa3NGaURoMCtCYmxjK1NHS1IvajJFS0JCTTY4?=
 =?utf-8?B?WnRLNllTZEFrM3ZTYndMMXBidTZtcVUvc3JXQXRHMlI5c05yUzlLSWtSOU1h?=
 =?utf-8?B?bzBYeW8zWmNhS3JMTEMzZXV4NWNtck80T0wwUGpUR0xEWnlMaVA3TEQ3aHlV?=
 =?utf-8?B?bDUvS2dqeldES3Vzb2R1MEtMbXFFOTRuTkE5bGFERmZ5dFYzZkdkZU8zYmJl?=
 =?utf-8?B?Wnpvc2czQmNNQ080Z0RtQ0VWUkVnWkJEc3RzaXd3NGxMM2lSS2VTSGI1MEVL?=
 =?utf-8?B?SFNFYUdaUkdWdisvTXc5ZlFFTTk3QlVkd2RLWkZwM3U1VkwzRlhQdjZISWJq?=
 =?utf-8?B?ZUhiNDNvL0xpOGtNRndmc3p1OTZQQ2YxVEx1ZDRwS1RBa002M0djcjhWNjFW?=
 =?utf-8?B?VmhyYWVEaklxVnBiV21vM2VBdXd1TFZoZjY4L2xuREUxeVlyT0hJZjl3M2RI?=
 =?utf-8?B?SFdPRGZTekdkT0JVbHZlcFZQdXE1QkttcThWM2dnbDRkUlJwN3JyWXFkQW9H?=
 =?utf-8?B?NHE4U0JJdDQ1SEFKU0prbEUxUDJsVStlbnJOVXpEL1V3SG50eDkwRExCUkJz?=
 =?utf-8?B?TXUxN05SR1grUlhIRFdHWk5DYWx3MzUzYnZTb3dTbWoydzg5RzU5dUk1ZmxO?=
 =?utf-8?B?NkJIVlA1U0NISnlsMWtyZTJGTHhXYVVQUFlmdm5CRGNRWm9LaDZIR1hQRHht?=
 =?utf-8?B?UVhITDFvY01wZDZyeVdweVdXRkhabDBGdGJqSTdXUFFyUVlZQ0liRmxCQUZv?=
 =?utf-8?B?T2JnWW1OMnQ1MGJZRXBqNXpSRytIcXkvMjBJOHZNRWFlN3VIYnR4NDlPa05K?=
 =?utf-8?B?NFdtZ0t2R21Qc0c3UktYU1Riby9xVXR0SFRrSWNFaUdQRHVzcHp6Ylh2N0x3?=
 =?utf-8?B?ZERDQ1d5NUQyQ0oyR09KakVQdzhlMlVPSTB1SWZPK0NkMmRpVU9Ed21RVmJk?=
 =?utf-8?B?R0l5dW0zM3pIUTdqaytXbTV5aDkxQmpmNFUzcTAxZnkzMzhCRFR6RWM5MDRw?=
 =?utf-8?B?RWFIcUJoZnpYeGFQSzFpclVVYW1nR0ZNOWxqUCtoRzh6aE05M2M0NU9DcWg2?=
 =?utf-8?B?c3J2Z0N0Vms1UEQ4cGI3NDZOMDZSY3B5anBqNHJmaEk4cDlFN1NzM1ROd21i?=
 =?utf-8?B?NzVRNmRBblpGaXZQZWRCM0VXRUVPMndMYkRHUVMxbWdLN2VWTkszYUFMYVF4?=
 =?utf-8?Q?RNfGwI3ttEP7NfPhve3w2jGZ1NUs9V2aJg0U4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WnI2Q2MzdEhXbXFpZm02RVlHYzFVaGplQVlaVjJzSG1SYmV1T050ckZUTTJj?=
 =?utf-8?B?ajI5UUVQSFBrVnhqcjZyRW9HbnFUWisrS2o5VG5hd1hVYWlIdVZyWER0bDNR?=
 =?utf-8?B?ZmgyZXlpNnpYVWw3QjE1NG9lL1Z6QW9NVGtuUFlDZ1cvcDNPYmZlQzdJMHNh?=
 =?utf-8?B?cStLcTlhcjBCdzhGZis1bGphNW1VaGFicklvalJCNXJVdGVrWktzV0F0UVp3?=
 =?utf-8?B?VHNaOUdRWWdWS2JoN0lDSmszVHlRU2tjejNkd2NXMHI5dlI3bUhxTm01UG50?=
 =?utf-8?B?ZHJCY2hFRUYrcjU1QmVORU1sTDVlaVd2dk9LZVR0bU5vNEFkQW9IcVZNcmYw?=
 =?utf-8?B?N1pTL0VSMEltY3R3R3UraEd6Unh2MmFhOFNyY3h4NGZpd2x4US9MK1VURG55?=
 =?utf-8?B?eDhndGJ0MEE0aGtwQWRYaHNQS0crekdLcWU0NFJXZDk1NDRDejFneDB2MGJD?=
 =?utf-8?B?RGFMaWFZcHNMUHhsTktrU0Uxdm9GVW5IYVdvcEZqeWFJSGtOT3I3K1Z3Q0xz?=
 =?utf-8?B?VXQ2NTZFMnVSRFpESTlvL2R2OCtjMDNmZ3FLeXIvN2xBZ0t5UGpRdE1PcU5D?=
 =?utf-8?B?MTgyeWpRQnNzcUxTalRxemd0MHpUWDlzU1UyRlZqT0dISnFJM2huaXk1RzZM?=
 =?utf-8?B?ZG11ejUvWUQxQVlCYzVKQUc1TkRUajd3VmRpRlpCS3Q0OGNXZTZ4Q01PSHRC?=
 =?utf-8?B?cHlTOXdSR0NJaXltbXBnZy9mYThhdlR2aXFDQ1ArcE1qUTVPRXFkK00wS1Jl?=
 =?utf-8?B?Q3BxdEpiVHNQK05zSDZ1L250dVUvS2UxcVhPcEFpblZMSXRYTGFLNGRkMnRT?=
 =?utf-8?B?SkVUR2YyRzA1eU1xdk0rNzdxRHI3ZkZJZHo5STAyMlpWVGNIRzFOSWxqVTdK?=
 =?utf-8?B?UXBMYy9IK1d3WmcvOHVRUFdsU3NUV0FSak1LNlIwSVZwK21CYTJ3VEo4RVov?=
 =?utf-8?B?akczMnk5QXIzY2J2WHR4RkJaSWNNYXYvNlJWMGlUeER0cmN5NmVzYWlIQnRt?=
 =?utf-8?B?TlNtaXlMT1Z5bE0wNVpYdTNmTXdydVZJZXFXMEdzZEIxVUdybVF4YTQzWlVT?=
 =?utf-8?B?SVNHMTZiczF5enc4ei9vb3Bjemp6alphRE5CV2dZR2tsNEFOMWtxQnpjN0VN?=
 =?utf-8?B?emNsK2dEeDJoQkMyV0llcks4aS9KTStKQlk0M004MElGQ0JKS0h1akxVbGxR?=
 =?utf-8?B?eTBYL2IxdWwySWNKV2J4K3VUNHJpL2RCRlc0UGJleU05bWMwSkdaa0R5ZlFP?=
 =?utf-8?B?cThFNzZRY1RJOW81MnZremFJMzJ5V2hsM1B2T1dla2wrS2U0YXJncHlEMEtB?=
 =?utf-8?B?OGFjUEVDdzAyQnNXNElvdkxyVGt4MHliVnd1cktRb3Z3UE9kZ0hXWFJ0THlt?=
 =?utf-8?B?TndUaEJXYjdQcExXaVhsZXJkMXNUUUdkVlE3UlVtbnVTR3A0azgrWVozNytG?=
 =?utf-8?B?QmxGUzRSdVd2Yi9TMTNITFlyblBkdVpoaGRHcjVwUTUydTgvR1lLMFFJa3Vt?=
 =?utf-8?B?bTdSRzJ1eUV2VklRM0VudkhTRkhMSWFVWU1lU3AyUEtYK2d1eXFCbklMNUlq?=
 =?utf-8?B?UDhmVzhMN1FvY1dsM1JYUUcydklQVFhpbm9vWWNIaFpPd1pTaHArOGJkbTBv?=
 =?utf-8?B?THB4WGlqRUM0dGlwVnduMGRqR05zVlRCWmRvU2dmYjZpN0lEY2tuNnlGby9r?=
 =?utf-8?B?OFNHSXFON3RiUnBaaHg1RWJCTXQremxEeHBydkx6ZGk1TzUvVEVIdzFiU1BW?=
 =?utf-8?B?ODVWUC91U0pnMDh2ejVURGlHZ3A3VTFGeHhKWE9yUzRQMTVMOFdtTjVQL0JU?=
 =?utf-8?B?b3pNejJJWGgzQThlR1Z4Mzc4SUxqWlorZ3pwM1RZT2U4d3BWZXhWY3AycnVI?=
 =?utf-8?B?UEtmRytBSTlmenhIS3BWa2sxakYwZFMwSU1Va2JYOW5aVHFOaFV1T1VMNGh4?=
 =?utf-8?B?YThqK01hcVBiU1dCU1A4cmJTaGZXY3RVK3ZRTnJ1RUNwaW0xL2ZuYmJiS2dS?=
 =?utf-8?B?UGt6Vm4raHh4ZzlyZ1lhZXl5dExTTjF3R003dHdYd045QUVBSEtLNVMwQjJh?=
 =?utf-8?B?ek5KbVlKdksxVU8veXpSQ0hHZml5MTI1L0gxZWQzLzVCT0RrOGFBRVYwTmo4?=
 =?utf-8?B?TkFhL1kzSDA5UG1oTlZRRkJ3UVU0TmNmRkxYbHA0bjRmWlVWNERDaTNraUxk?=
 =?utf-8?B?bXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42a291ea-3a91-45f4-c968-08dd1aba3364
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 14:35:18.8411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B7h/U2UMTeflbvVwMVlHt9tCTzwMGOR72qFSVdmMJxu00IMtLh8a49Rf3NGmV35WVpOGnUuhezisGrOWXGTcqCsIfBtJySUWCnCZvxm5nPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6831
X-Proofpoint-ORIG-GUID: cNjkiBDqDuYvb0zNdQCTVlKN3uhkaSqe
X-Authority-Analysis: v=2.4 cv=eePHf6EH c=1 sm=1 tr=0 ts=675af4ac cx=c_pps a=YTelpZo7+Gv92UPfPuytLw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=QkpFdd30EMMon_xh91kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: T4YpMTARZ0j97oIXVSRV_ts8TVVxdmo7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-12_09,2024-12-12_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412120105
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4BCALcEY018304
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 14:35:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208648

From: Yash Shinde <Yash.Shinde@windriver.com>

A buffer overflow vulnerability exists in GNU Binutils=E2=80=99 objdump u=
tility
when processing tekhex format files. The vulnerability occurs in the
Binary File Descriptor (BFD) library=E2=80=99s tekhex parser during forma=
t identification.
Specifically, the issue manifests when attempting to read 8 bytes at an a=
ddress
that precedes the global variable =E2=80=98_bfd_std_section=E2=80=99, res=
ulting in an out-of-bounds read.

Backport a patch from upstream to fix CVE-2024-53589.
Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.g=
it;a=3Dcommitdiff;h=3De0323071916878e0634a6e24d8250e4faff67e88]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../binutils/binutils-2.43.1.inc              |  1 +
 .../binutils/0015-CVE-2024-53589.patch        | 92 +++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0015-CVE-2024=
-53589.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.43.1.inc b/meta/re=
cipes-devtools/binutils/binutils-2.43.1.inc
index 1ce19fbdc6..94e7d7f7e6 100644
--- a/meta/recipes-devtools/binutils/binutils-2.43.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.43.1.inc
@@ -35,5 +35,6 @@ SRC_URI =3D "\
      file://0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.pa=
tch \
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.pa=
tch \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.pa=
tch \
+     file://0015-CVE-2024-53589.patch \
 "
 S  =3D "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0015-CVE-2024-53589.=
patch b/meta/recipes-devtools/binutils/binutils/0015-CVE-2024-53589.patch
new file mode 100644
index 0000000000..380112a3ba
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0015-CVE-2024-53589.patch
@@ -0,0 +1,92 @@
+Author: Alan Modra <amodra@gmail.com>
+Date:   Mon Nov 11 10:24:09 2024 +1030
+
+    Re: tekhex object file output fixes
+
+    Commit 8b5a212495 supported *ABS* symbols by allowing "section" to b=
e
+    bfd_abs_section, but bfd_abs_section needs to be treated specially.
+    In particular, bfd_get_next_section_by_name (.., bfd_abs_section_ptr=
)
+    is invalid.
+
+            PR 32347
+            * tekhex.c (first_phase): Guard against modification of
+            _bfd_std_section[] entries.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.=
git;a=3Dcommitdiff;h=3De0323071916878e0634a6e24d8250e4faff67e88]
+CVE: CVE-2024-53589
+
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+
+diff --git a/bfd/tekhex.c b/bfd/tekhex.c
+index aea2ebb23df..b305c1f96f1 100644
+--- a/bfd/tekhex.c
++++ b/bfd/tekhex.c
+@@ -361,6 +361,7 @@ first_phase (bfd *abfd, int type, char *src, char * =
src_end)
+ {
+   asection *section, *alt_section;
+   unsigned int len;
++  bfd_vma addr;
+   bfd_vma val;
+   char sym[17];			/* A symbol can only be 16chars long.  */
+
+@@ -368,20 +369,16 @@ first_phase (bfd *abfd, int type, char *src, char =
* src_end)
+     {
+     case '6':
+       /* Data record - read it and store it.  */
+-      {
+-	bfd_vma addr;
+-
+-	if (!getvalue (&src, &addr, src_end))
+-	  return false;
+-
+-	while (*src && src < src_end - 1)
+-	  {
+-	    insert_byte (abfd, HEX (src), addr);
+-	    src +=3D 2;
+-	    addr++;
+-	  }
+-	return true;
+-      }
++      if (!getvalue (&src, &addr, src_end))
++       return false;
++
++      while (*src && src < src_end - 1)
++       {
++         insert_byte (abfd, HEX (src), addr);
++         src +=3D 2;
++         addr++;
++       }
++      return true;
+
+     case '3':
+       /* Symbol record, read the segment.  */
+@@ -406,13 +403,16 @@ first_phase (bfd *abfd, int type, char *src, char =
* src_end)
+	    {
+	    case '1':		/* Section range.  */
+	      src++;
+-	      if (!getvalue (&src, &section->vma, src_end))
++             if (!getvalue (&src, &addr, src_end))
+		return false;
+	      if (!getvalue (&src, &val, src_end))
+		return false;
+-	      if (val < section->vma)
+-		val =3D section->vma;
+-	      section->size =3D val - section->vma;
++             if (bfd_is_const_section (section))
++               break;
++             section->vma =3D addr;
++             if (val < addr)
++               val =3D addr;
++             section->size =3D val - addr;
+	      /* PR 17512: file: objdump-s-endless-loop.tekhex.
+		 Check for overlarge section sizes.  */
+	      if (section->size & 0x80000000)
+@@ -455,6 +455,8 @@ first_phase (bfd *abfd, int type, char *src, char * =
src_end)
+		  new_symbol->symbol.flags =3D BSF_LOCAL;
+		if (stype =3D=3D '2' || stype =3D=3D '6')
+		  new_symbol->symbol.section =3D bfd_abs_section_ptr;
++               else if (bfd_is_const_section (section))
++                 ;
+		else if (stype =3D=3D '3' || stype =3D=3D '7')
+		  {
+		    if ((section->flags & SEC_DATA) =3D=3D 0)
--=20
2.43.0


