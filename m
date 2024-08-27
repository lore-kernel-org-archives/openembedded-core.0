Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE90C5321D
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 02:25:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.69608.1724725514307974691
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 19:25:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=896980ac62=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47R1GguV011486
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 19:25:14 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 417f1ka775-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 19:25:13 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47R2PCfd013017;
	Mon, 26 Aug 2024 19:25:13 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 417f1ka774-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 19:25:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HdObOwa8OLigShfpetcQMBIKam0kxa/7lj3CNzuSOtKYRdC2p/7+KVUgYQ7nTWKqnxfzDDV3bZA6Nq+5kyxh2zlMumV+dlgw3qRYmeGZ5YkJWQ4P02HCDDo4HWyTemzuWsWQrdyrmOBp6m/3dj4YtTUSke0Q68I3hzsHfk760/l578JQzGdS69plgk4bfk3eh20riok522aFqcLgEk8gDepckdn36x35S4RAYGPIrkythaueQk1X41BtDmZenurH1sCU3i9NIZid5qqz9e2wFwDBDOfASapTX8o5nfZbsceO0GS5GkibZLCd/Jy10PQqObCBgN2+2JWj0rSHIU4LBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xqWzMjrFtutLLPRBOnTOu7LqcrJMpzsr3kp+0ykcoYk=;
 b=Iqsn74qtGb9K/9Shk8H4jMdib2OKhGQ8HdapnBkJ+rAuNOXiqHqdDJuU+0emSFVRwUnvqQn9ClNyGx2OJKs3s1dptwtayu9rHwVlykTnCyeRE+wjqgaQVlGNShw4VejPNyb00yPs++c0M1ijN7eck7laGxrIHMxAl9gnef4umoEFlchaRSM92PTDE2dA7GDDVwItMmCvY3XJ+YaFrj+GenF9SdQtVEeKvk/1etlWlwzIcleMTCKwPnAuXfS4OQUr9KRyWlAU+UdXiiP7HgOM2+s7+50LEE85JjnbHNKub9tlb7tUuaXd+UOUb6zVCPDmg2ACJVF/jgwjHTVgdLJmSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by IA1PR11MB8100.namprd11.prod.outlook.com (2603:10b6:208:445::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Tue, 27 Aug
 2024 02:25:09 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 02:25:09 +0000
Content-Type: multipart/alternative;
 boundary="------------O027ApCG5Rhdp6gqJDWl3WGS"
Message-ID: <e0bb9151-925f-4665-a635-2da3ecb98a02@windriver.com>
Date: Tue, 27 Aug 2024 10:25:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [master][PATCH] webkitgtk: fix do_configure error on
 beaglebone-yocto
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
References: <20240826085148.3492132-1-changqing.li@windriver.com>
 <638fcf654276d1ccbf67a8d8881404a78f3b7cb6.camel@linuxfoundation.org>
 <CANNYZj-wzkPSccXYOKm9=Lf00JffvEx8qOU00tzHLWia=5oGEg@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CANNYZj-wzkPSccXYOKm9=Lf00JffvEx8qOU00tzHLWia=5oGEg@mail.gmail.com>
X-ClientProxiedBy: SGXP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::36)
 To DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|IA1PR11MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: f4a2814a-ad00-4b82-afe1-08dcc63f78b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bVpYaVBLbjN3dzNlZVRGcWhXdWtMaDZ1ZlRzcWx4ZDFMTWNwKzJsNzMrMytn?=
 =?utf-8?B?NWVuVEEwbWdqRXd3OHl2ZHU5VG5sVHNYQnNpdG5tMzlQM1NEYm0wTVMwZ2tP?=
 =?utf-8?B?L3JqcFBHakhpdVZ4cFpObWh0Y2RmOVNtVTZkUUJGMFFCaEFXdnZ2bHRwMEQ0?=
 =?utf-8?B?MnRHV1FwaHhZUElYcmYrbEY5WEh4bmlPQ1dzcVNEVWNnS0hwUjlsdXIweVJv?=
 =?utf-8?B?RXd1c1UydlptU0hOWXVseERJcXNZWlpSUzhMQ0ZOSGVtMXRRTUVBMmorSGtr?=
 =?utf-8?B?MmRlakt4b3Fqd044ZXlHWHdTSlQxZS9qb1VWYWo0QlR5OVNyczJiSHBZU29U?=
 =?utf-8?B?emVqUWFPendCeThubVVxTWJDdkNES1doc1ZVMVc2MnRrTnZqd2hXRmZQR0dM?=
 =?utf-8?B?ME5JU3JGdlRhKzVkUUltVlpBeklabDNNMThRVG1mbkViYXpvSEw0N3ExemVv?=
 =?utf-8?B?elUwWi83NnlPVXpSTjl3dzRNeFJtakVUenoyQlRhZ2FKOC84REV6WEw4YkM0?=
 =?utf-8?B?ZytGRisveWtIMG0rSlpaajQ0ZmlCY2FRcGd5S2VaanNVajdzdkROMkdicXR6?=
 =?utf-8?B?ZGEyb3NRU0tWR0l1Uk0yM1hEc0U0UWQ1MmV1WllwV1ZoalJyQi9iTHRWR2d1?=
 =?utf-8?B?WE1NZzU4cE5TK0hITnFaL2F0SXJDQXgvZmFyOTZkSXFXVy9JSS9DanM2R29q?=
 =?utf-8?B?cHlsSWlUYVBlQktRUGxMMGhSdThlbzdPNlBFRkhQaG1JdTFGLytUeDBxQXo4?=
 =?utf-8?B?MW9ZVEhuMTJRbFd2WEkwbUFqMkUxT3AvSis1U3pYZ0dwZjAwRTVHR2RSUWw5?=
 =?utf-8?B?L3g2a0FTbmVnbzFqOUNqbUFYRUZ4MTN6ZTBhSXpDRk5TMXh6RTJvdGRmQytn?=
 =?utf-8?B?VjVYYTJPMGJwdDFLbnFCNGxxVkpwUkc0TkQ5NkhvWmJpSTZLMVBkSkw0dEZI?=
 =?utf-8?B?R25SbVZsSmN3cHlIOTI5eGV2dXpKM1BwM3BnSjBXYWRIVGE4eWNJWnMydk9X?=
 =?utf-8?B?SnpTa1AzeUlsOWVXZ2FHSGQyeDhoNE5vQWREN0VmQk9PNFVmMlFpVUlMWXRU?=
 =?utf-8?B?WlVTUzdEQ1VRNzl0T2F4QlQ2K2lFZkNJSWxOWlJUME9od1d1MzdmNjlqRVZZ?=
 =?utf-8?B?aUVuMjJmWkh2Zm1XSHJTSmtqK1RGUGMrdU1GZ0IzdldCT2Y3MGk3Z3pYTjZG?=
 =?utf-8?B?T215UkZ5STdHRko2Q1NWQ0xzZDFJUHVEeTUxS3J3MDRWbUZnWEZlMGd5cWxD?=
 =?utf-8?B?b09YbWlxZmdCRlZEeDE2OVV6dENVOWZKeWRqREpDUm56Tm9TTHREazVIZ0pD?=
 =?utf-8?B?dlYxT0J0WTZMVkdnVjBqclJlVTNuaUJ3VUp3WkxibTBWRktIWTlMWlloZjVK?=
 =?utf-8?B?QkFQRDF6VXpvVzdCeTczYmJDbGV4Y2pjbytRSEtHa1V1MWZhRll6eGlvTjFY?=
 =?utf-8?B?U3RVaXMwT1VYSDVvRWIzeDZtcjBCV1BIbU8weE5VQ2Y5WmJnZ0FNTTlta1hF?=
 =?utf-8?B?aGVHUnNyaHRDcTJqRW1uNHlFbjdHdFN2NjhGTW16MmRqbS9ZNDdVSWFSYUFu?=
 =?utf-8?B?bXpuTHI1UnhCaG5tM0MzdnhiWWQ5S1VQQTZWZlExc1daTmJRUGFqUFZ4NHpF?=
 =?utf-8?B?ekxpRkovYnBKekVpcEliR1Y5eHd2MmIyeXR1SHRiUzRLdC84MGtwOGw4ZG9V?=
 =?utf-8?B?eFA0bHdqZk9ObGxDRUU5SExhVDMwSk94eDRhL2V3WThWTE5wRktZdGtxdkIy?=
 =?utf-8?B?Q25sdXNpWElub2licHZhSnIyS0tDVjVLOGlSc29RUTBSWHY1bFE4dnF4TzZ6?=
 =?utf-8?B?emprNVVwTFJiODVBcmRUdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RHAyNStoOEJ6NzVUQ2lXMW5QMlpkZXRGdXJCMENVVXdSNWJ1VHdkUU1JS3Bt?=
 =?utf-8?B?eDBoay9YQ0V5N3pqNUp6dkdCYmdDQ0ZXdVVoRTZhM0N4cGtRRVRvWHlYV3h3?=
 =?utf-8?B?YlAxbkN1OUpBUVlqOWl3d3k3SFNSNjJzRXF3UUZ0UjdXUXdZQTR3Nzkvbnh1?=
 =?utf-8?B?R0VyT2RvZTdlTXZaeHM0dG1CQ2oxaEp4OVNuRzBpRm9LZUVKZFdrTFdqWGZU?=
 =?utf-8?B?c3pNTjh0YlRiZWgyeFpkeVMxd3RDeXpNTHkwM09EcVRickkybDNYdmNxbS93?=
 =?utf-8?B?SVRHc2lsVXV0cTJWMnNlMzN5ZlN0SnBOd013dWtRN2FoT2NjSno0LzVuV2JY?=
 =?utf-8?B?QTlQNDRrci9id2tkK2FDYnFQUm4vUXQ4WE9aMEkzRm9UTHlhMTVMejF1aDVz?=
 =?utf-8?B?b2pMWUJQYTZJbFhLbCtXVWMvUkFWWE43K0UrV2dhazU0YXUrOXpqZ2dpZGZI?=
 =?utf-8?B?dGIxdGRmMFc3TzZ5NEordXBwQkZLUjdHekIzbWhPNEpMV2VyR0FweUkyOTNu?=
 =?utf-8?B?bTlqUU5oTEVMK2xKN0hnVG02UThnQ3pBdGgwcVdmREt4MEx3dVBnY1ZSc2hY?=
 =?utf-8?B?K285aWxrZDBmNXMyQ3R1SE16THQ0RWtTdzdJdDk0RURoZWFmckFjOVRCR0VG?=
 =?utf-8?B?aEF4VGNaOS9ISnpHalhzSU9NT3J6WDNrRGozSTZnTFpoTkZhNUhHUjBSL1hO?=
 =?utf-8?B?NFdSbnBvTUFlQnJ2RWFpTDRWOHdMenhKTG5UYmFrQjJOUkhnNmFXQ293Q1M3?=
 =?utf-8?B?bHFYNFRIcXNHM0hoc283TktmTUNGdGhPelNwZUxDdGlkbUpOTUlVcUU0UDUr?=
 =?utf-8?B?SGFDdmZ0c3R1K0tWbkQrY1RzVitNS2hiVG9JSzRVMDl6U0ZYcHExWDN6bHlW?=
 =?utf-8?B?emRSVThkUUx3MFJaZWtNdHltVHNRWEt0RVJTVG8zYlRpdnFOV01ncE43K3Nm?=
 =?utf-8?B?UUtmeUNiSzczcGJ5aUhSRFovc1Q2aEQ3RjRjak1Kdmk0NUVVbVpHeDUzTXFy?=
 =?utf-8?B?OFJlN2xhcUlBOXBnL0lnUmFuV1MybTJpdHVKMFNVQ05MSUtHRGREcnZCRm82?=
 =?utf-8?B?K2xZZ1dHSC8yNXNieHNvZ1IwNjJySTJ4c2lSUWxsZ0M4eGh0NWNlbk9vd3lW?=
 =?utf-8?B?UnBvK2NuMU5SOU5kY245dUJmM09qenRjYlczSlMwOTZMNDhhWTNWdEpjTTd5?=
 =?utf-8?B?VGdtS1IwQzcvZEZTRjNPZEdrSmhPMGtjaTBqL2kxM01WUU82V2NmZ2NHZ2Fa?=
 =?utf-8?B?VUpPVzNrVTE4SVFhbXlaa25GRW11b3lsa21mQ0tBRXljcDJ3UG84RkVvRS9N?=
 =?utf-8?B?OFhJVEVmL1VpK0dNNGwzS0xiUzFvNGFUMGdPMzZQV0QxNnhVVHQ0MmVva3Zo?=
 =?utf-8?B?NEM2Z1drVXVRbFVtVWJPcC8ydThZQzBkWVZjZ0lkN3poaUtJb3Fab3I5Q3VV?=
 =?utf-8?B?VTNDMzlsVmF6TmhvaWE3SW9NYVpOVEtnTUFFMHZsUnJBVDU5Zys2cllyOHJj?=
 =?utf-8?B?TjJ0UEdnTmdBMm8rRUJkNUprOTBaVDNteXZndkg4M2JGQUNxRmJ5TEZ2ekJL?=
 =?utf-8?B?cFA2eEEvYTNvY250SW44aEx1RXh3ajB0bTJ4b3Ezd1lPMlJtczBYakxDd0N1?=
 =?utf-8?B?UjFnbXZHM2hIVU1nY0NkRjQrY3J2TmhlZ25HNG1ud3ZhTGM5V1ZRK0NVM1BM?=
 =?utf-8?B?RitvZ0xNZVVuV1VuL3FXSUl3K1p1VHFlV1l6Z3Y0UVFrMGxjaW9GNkQ5WDNs?=
 =?utf-8?B?SkhMVzNvWGRvQU4vbzhoTC9PVDNWeGhoYlJ6enVnSUxRa2Myd2ZKdmRKM3Ns?=
 =?utf-8?B?aHhpYmZRN0lPdDM0eE9qUEUwa2dOUjZxUHNaYW9WZ0hVakFtQXRHTSt6THFB?=
 =?utf-8?B?eUVyWGdCUWNIR0VzdkY1bUhqSTdZbmV5RFVXZW1MOVU5K2NwakdGbk1HM0I2?=
 =?utf-8?B?TFB3djBpenIxZmlQSmEzc0NRQk1oWDVHSE1QZmV1NWdCU1prWDJ0M1BuZzA2?=
 =?utf-8?B?ZjFlNmRKajdyd1NjdkVsNExncm1haHR1OC85bDNRV0tvR05reDFBeDh4cUJx?=
 =?utf-8?B?eEdscFBobllKL3Y5R1dlL2xOQzY5Ukp4Vjc0YkFTRjdTWnczbnRvR2drRjk0?=
 =?utf-8?B?S2tzenNCOTBqRFR6K25mZkpVRG0vK1QxYTRiajBSYk1sYW42bnk2UEFrMExj?=
 =?utf-8?B?MkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4a2814a-ad00-4b82-afe1-08dcc63f78b4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 02:25:09.3320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bG/JhrozQFgsd/xekcJja1oa32+vNUk5YZMn2STbJXhbo/TKUhjwWlWWxQUWnzczn7oMEAtCpAFc0b060KX/bn+wtF72pnpby9aATuFN7z8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8100
X-Proofpoint-ORIG-GUID: 0gKoaIqRB2AFl9vzYNeZbRydsan9sVlk
X-Authority-Analysis: v=2.4 cv=McQ+uI/f c=1 sm=1 tr=0 ts=66cd3909 cx=c_pps a=GDxOUaUasxmcDRSC7gC2IA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=2mWC_6QaQi95S0f1tJQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=pGLkceISAAAA:8 a=ktOyJPztaX449sVuNHoA:9 a=wgLvLjmmEEhSYoni:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: AT_eZ5uKBWFddXvFv-wV24qeblvdfNFi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_01,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 mlxscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408270016
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 02:25:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203774

--------------O027ApCG5Rhdp6gqJDWl3WGS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 47R1GguV011486


On 8/26/24 19:04, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Mon, 26 Aug 2024 at 12:57, Richard Purdie via
> lists.openembedded.org
> <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org>  wrote:
>>>   meta/recipes-sato/webkit/webkitgtk_2.44.3.bb | 12 ------------
>>>   1 file changed, 12 deletions(-)
>> Why aren't we seeing that error on the autobuilder?
> I guess webkit isn't a part of the standard arch-qemu targets (e.g.
> sato images)?
>
> Alex

Yes,=C2=A0 this issue only reproduced on beaglebone-yocto.=C2=A0 And webk=
it is not=20
the included in core-image-sato,

and we seems don't have world build for beaglebone-yocto on the autobuild=
er.

//Changqing

--------------O027ApCG5Rhdp6gqJDWl3WGS
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/26/24 19:04, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj-wzkPSccXYOKm9=Lf00JffvEx8qOU00tzHLWia=5oGEg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Mon, 26 Aug 2024 at 12:57, Richard Purdie via
lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie=linuxfoundation.org@lists.openembedded.org">&lt;richard.purdie=linuxfoundation.org@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap=""> meta/recipes-sato/webkit/webkitgtk_2.44.3.bb | 12 ------------
 1 file changed, 12 deletions(-)
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Why aren't we seeing that error on the autobuilder?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I guess webkit isn't a part of the standard arch-qemu targets (e.g.
sato images)?

Alex
</pre>
    </blockquote>
    <p>Yes,&nbsp; this issue only reproduced on beaglebone-yocto.&nbsp; And webkit
      is not the included in core-image-sato,</p>
    <p>and we seems don't have world build for beaglebone-yocto on the
      autobuilder.</p>
    <p>//Changqing<br>
    </p>
  </body>
</html>

--------------O027ApCG5Rhdp6gqJDWl3WGS--

