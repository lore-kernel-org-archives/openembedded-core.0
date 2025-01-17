Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19CEBC02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 10:13:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7717.1737108790408319733
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jan 2025 02:13:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3112c2805f=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50H5acFK006965
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jan 2025 10:13:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 446wf7hcrq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jan 2025 10:13:09 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50HAD8HV025496;
	Fri, 17 Jan 2025 10:13:08 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2046.outbound.protection.outlook.com [104.47.55.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 446wf7hcrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 10:13:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=svjVh+wbmmZe7mPjQoYuJv2n8RPZ0Q/VnXHyrW7JoqREmGpkCNoEL7EhiVtuEhhgV21RVJo8so1y9v6FZCE25zuxVww/Ei1T4iFj1HpnwH6wBjwjqV1F0JL+0D6uggr6zfNB+tzMxM6nbKjt6Tu8JdpsAr85UfZuGxk8wdhV7Ths4Pf0E9NCsmVe8TD4+R/faZSdBd0MREsaEkHxqMqjO0o/f8fuQCNt9QZ3HRzutUEQVIbS43mF/lJMh0neLc7ijuDlHw/mz2P919F+AqnzEeSNaKaRDK81EFyB9MfPGQx4rpmLQiJ9nrqx5JAmP7Gq2MvkHFBJKxjoNDwuI/Jkzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVD4FtZBDk3wwkiI45+C+gKEIgjTUHd8Z1p0ictyEJI=;
 b=AeXSXWSnuC+MJy6lwZwrJCncAdodKxxwGRexJt1SzdZ9LpRmlF2+ynNMjMk3tp9hRSbI242+wkzLwOOZFWGIVsWNK1Iwz47rinfijvI6vSUAqOWY8VuUUsxHi3OgpGJHTBckgvPZTJF36z50qArDeNUGAqiCYPkDa7itJYMeSRNkGAtnf3rj5iYHD52d/9XX3gcYNIENWDhui9YBnlD8dn6PxEGEOhsB8vT3Y86S6KvSCLKLxeD2rjfqu/K9SqBJJVVuRyumtBiWezJIgBHrOnkblFaCOUHuPTpophNCiQoOkn1Q7Fm9CG2PdwRpRlPOAFagIuLH332VU4s+ZgddHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by IA0PR11MB7912.namprd11.prod.outlook.com (2603:10b6:208:3dd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.16; Fri, 17 Jan
 2025 10:13:05 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%5]) with mapi id 15.20.8356.010; Fri, 17 Jan 2025
 10:13:05 +0000
Message-ID: <7990e05b-fe7a-42c1-95d6-1eb4909d8988@windriver.com>
Date: Fri, 17 Jan 2025 18:13:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] base: Add virtual/cross-XXX recipe specific
 provider control handling
To: richard.purdie@linuxfoundation.org,
        openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
References: <20250115204830.4030611-1-richard.purdie@linuxfoundation.org>
 <181AF8C1771E649F.1614@lists.openembedded.org>
 <209dd128aad0eb29fa451e0decf2d74ba2b80d72.camel@linuxfoundation.org>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <209dd128aad0eb29fa451e0decf2d74ba2b80d72.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYBP286CA0043.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::31) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|IA0PR11MB7912:EE_
X-MS-Office365-Filtering-Correlation-Id: 11517422-9c08-48b1-8b07-08dd36df8866
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OVhDWFRxMURoaEdMQlBXbWVqUkg1bkJkdGozRndKTGJ0b0FkVmczSlBsLzZG?=
 =?utf-8?B?d2xsL3ZMd29ocmZMWUVmNHV0TFQvYlFjeHdGTW5zS1M3akdncElFYmV1WFJi?=
 =?utf-8?B?UjJ1c0UrNFgvMXhteG1lQWRZZHVha05LTGRVQWd4L1VPc0xOWHR5Wkh5NVJQ?=
 =?utf-8?B?WVdCZmZQVFI3UUthWVJJUzVZdTRqV3AxOG9GOG1nRXZNdmxJUWxkU1hoMHNN?=
 =?utf-8?B?eUEveEZHM3c1L00zQWFkRkFNTzF6M09pRkk2akdKcjJhdTlteVc2Qm8wb2NK?=
 =?utf-8?B?ZHUyb290cjcwMDFub0RrSFBZRXJNWmUzWC95d1ZHc09rRE5kSHJVYW1aV0FY?=
 =?utf-8?B?elJqd1c2MTA0QXJqYkxHby9saTJXV25YSFh1bXM4dUoxbWs3M25NRi9tcjg0?=
 =?utf-8?B?VVVSczF6c3FTRm5TK2lRODVTNlFMc1lNZHMyUmdhSUZ1VGMvQ3N6UERudWRI?=
 =?utf-8?B?TDllaVp5NjU3eUJPVktTY1V0d2U5Tkljd28xdGtEY3d5N0xTZWJmM2N0TC9M?=
 =?utf-8?B?eWQ2TjRsdVhwcDFXekF6SEh2cFVadHlGTEVjM0FNWUI1M1lacVE3UWk4VXRU?=
 =?utf-8?B?VjVjcnZCVXVUNGlOQTlaRkVmRy9JUGZyNDRMeWVMTldYaW53cTk5cTRIaGdR?=
 =?utf-8?B?QitITUpBenErbThtM0szS3dPb1J3VGNEYlByVDhVa1dmM3RPeVBlbzVEZWt0?=
 =?utf-8?B?S3lZQ1dzcEhwUVdmNEpYenorQ0JYMGZtK21HSFJkdVpBUU5RcDczZmNUeE02?=
 =?utf-8?B?Q2dzdnlCVnFjazcvNW1MNStub3dsc1FETUMzYTNZMDlsakx4S2l2aU4xa1J6?=
 =?utf-8?B?YVg2YlJQTjEza01aemIvamxKRCsxMmtIUDVBbEIrUmFOOG5SYWxhWW9HTlpw?=
 =?utf-8?B?VENHd0t3bXhGRWd1bzdmOVN3VmpjVXdXQkJzN2ZoT0g4YnhtaTROOVVTM2lv?=
 =?utf-8?B?VWxxa2d0Vi8yVlV5czR4RzBmS3dENFgvN1FHbExNLzRQdW50Q2NiR2VEOFFW?=
 =?utf-8?B?aGNqMFVNQ2dLLy82VncyR1VMNkRkMDEzQUpMcFJzMVFObXgwV1hrRXZveDNQ?=
 =?utf-8?B?eVQ5TWMrdEtLSmZJbnFkeE8zOUtKL2dGNGhFamk5bldTK1BsZWNpaEtTdjFR?=
 =?utf-8?B?NXk2bm45WFBINzJwditsS3BlY09wbG9OaENuR2VPdm1RZ3luMGRZT25sM21N?=
 =?utf-8?B?MW1ncy8zTGduWTVTV2t1TjVTdHo2dG8yaFdhMGw2RHA4OGR0VGQ4Y01Jek5I?=
 =?utf-8?B?NFBiMkdRbURzQVlLOHBoWjRPNXFqWFlkTExULzNVSFl3UWJpbkFqMGlLWUhK?=
 =?utf-8?B?VXBIUUNJbWI3cnA0L2ZMQ3NGL2poS3p6ODdaQlZZbHArOW1QU3FFZS82M3FI?=
 =?utf-8?B?d1VoV2MrK2RWTWViY2J3WklHbTJiWW93RDFzTmtQbEpFMm00M3Z1a3VkNS82?=
 =?utf-8?B?ajlXSmlUdDdXeXhCSXFRNTJYenZzZ1VkYkVLSzNKMi9ha0NQMDdOeTh1clVo?=
 =?utf-8?B?elZiM2ZiZkxNS2VUcFBCZjJpei9EdlNlSVFyWi9VdDRLcWtBZGZySUVhelJo?=
 =?utf-8?B?ZUJoNzhPdGxzNEtBMGE4RXlmR21ZOUVsVTg1ajdBT2lEdW9LbTNnSWszMnEz?=
 =?utf-8?B?dlY1b0NBQXpHSXZFNHYxZEhzRDJyK3lqeHpVWWJ1c0I0ekJCV0ZrNnJ4cmtt?=
 =?utf-8?B?V2I4RFpxYjIyNjN6a1MvVmFJR1hsMGR0cGFRMGhuOEtlNVhrWUlOVi8yR3VW?=
 =?utf-8?B?N1o3b01HOUFlV0NlWnN6Q2lmVnlzRWNHREFkQXRiaFl3MzJpMEtDMjEyZkJB?=
 =?utf-8?B?SmZuZ2RkM1NmcXcvZ3h1QT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Tllzc21jL1dpRWFRZnIxZnlLaFpSQXFVS0pLbzcrNk9rSkpKcWlqU0Q1RmFu?=
 =?utf-8?B?ZlNoZ1FKYVkyUVMxS3RVbVBiaEdLTjFpYVpnRGI5NDlQZXF5dzJodHE5ZlVw?=
 =?utf-8?B?a1FsUGFENmRBUCsvdXZNYXdaK0UwUDVlYkYxTjAwS2NVN3BIQ1Z2dEtrMHdQ?=
 =?utf-8?B?dXN2Vi9PbG5EMCt5M2J5L1J0Vlk0Z0cvTFNxNEV4ODNSZkxpclcrZ21wcDZT?=
 =?utf-8?B?SXFIeWhFZ2VEZFNJQWUrb1JEUTFNWUFBTmNLcTFmYzZnTDQvamxyRHk1YTVU?=
 =?utf-8?B?aEluUWJSbVRkVFRWR0hVSTAvT0NPYitYL3VVK1gxSDNaeTJ2aEJ1Wm5kSlVu?=
 =?utf-8?B?bUp6Q1kwc2E3ZGRDQVlFWGhhSzBVaGVzTG5saG9qdWRGNmxZUEJNaTArZ1Zh?=
 =?utf-8?B?VTN2UlFkamFNaVpHNU1PeWJicUM1Y0lvcWJpWmI4QzdWMjFYMmxzZkppUFBy?=
 =?utf-8?B?OEpnTGxCb3FhSk9vZ3NYVzBmMUJXbFc1R1ZYUVdaQ1EreEJGdENITTNtQ0Jj?=
 =?utf-8?B?WFF5T1JRbzBZbzJUMWU3NWxWSkkvVHAwU1p1L3Nxay9ZYTFwcW0zWW9uaXQ2?=
 =?utf-8?B?QmdoQmEvWGJoOWxPUnI4aU1lWVdQMXZlbisvemFKeEZNMUUrd3p0bHdHcjFE?=
 =?utf-8?B?NHFtSWRjaUg3MjRmMVMwZTNud0tXMmx0NEsxY3RqQ0lsbHU3b0pXWkdjVDdV?=
 =?utf-8?B?TFBndEsyNDE5bXd0YmpuY1ZqcElrR2dnMEk3Z0NKQ3ZUcFlBTDRKNTJMSFFl?=
 =?utf-8?B?QWZzKzE4TzV1Zno4YkVRblVzYXNvc3JsT1g1bDdudnRoVkhpVHRMd2Jaa0lp?=
 =?utf-8?B?NmdsMVoxTVhwZCtwOTZRaFVmQmtTaFFNVjQ2MDdYQzBUVTlXQTBrZ244ejJM?=
 =?utf-8?B?TnlreWYvR2Z3RHdhdGVPOEhKV1ArOUlySkJtMUlTaEVHKzlIczNYcGdqbitF?=
 =?utf-8?B?UnkzbkpKN09MbldEbGwwU2hQZTl1YTM4NUxRSS85QmRSa2taZndHSlhKZHhJ?=
 =?utf-8?B?WHdsdUNnN3ZZYUR0eDRLais2TzFldFhMSVFZem5KSzg2b3pnQUdCQWlFWFdY?=
 =?utf-8?B?S1VYbFV2NGt5SURiUDdPUmVpb1krSXZ3MUZpVXY4eUp6L0ljYkNrVW9UNU1H?=
 =?utf-8?B?clllNE9ONGd0Z2VDTmpGRk5QdUM1dHArU05CdjB1ZkJ6QnRqWG1aamZubFg3?=
 =?utf-8?B?QUpFZEJHaGtORld5d1hYcG8yLzdGdG94eWFob2tOcXpnTW9ZcVFyQ2ZkSEkw?=
 =?utf-8?B?L2pEVUp6blh1WTRjMWNESnQ4WWNrTDBjc1ZOSmowMHM1YTBlSEtYZldWQUxP?=
 =?utf-8?B?ckJra2QyTXJQUFF3anFaQTNNNUhRaXc4N2tDeXFrMVl5by9yMEE1V0VCc3hq?=
 =?utf-8?B?cU9wK1hkYkRDb05QSEorQ01yTUJtYytPSjJ2S2w2OGluN1MwMHN2SnRrejFX?=
 =?utf-8?B?eUZxWlllM2p1a1RmNGQ5RmFva1JhenowcDV4TjBOcktveEVzS0hjUGtFb0ww?=
 =?utf-8?B?ZmJ0VGVaRWJzakNOTmtPeUVzVEVHSG81b3IyNDV1UkZHaVhuYit3WFBTL3gw?=
 =?utf-8?B?cE41L0g3OGIybmFrVXVORzdDeFBmd1hiYnBTYVF3K1hWQW9LbHdXRnRmQ01F?=
 =?utf-8?B?NWxEK3hEbHZhT3ZnYmJEbGZaVkdId2ExSGlONmh4ZXhqR1VxNFd0TEZSWDJL?=
 =?utf-8?B?NEZNUUNPLys0cXlHM1NiT2FFbFRXOCttQ0tPSEFKWmlQVjFySzltM3hoWGxx?=
 =?utf-8?B?Ly9XbExUSW1DQXRvQkVhclBmL1pWWForSDBtenVkRlMzNEF4YXdCOXJCSTlE?=
 =?utf-8?B?TldES0JqaWdrR2pYVjJ1TnVTS1hWZHkvbnJXb29acHI5U21ONjVnRElDMjFP?=
 =?utf-8?B?RTVWZW9mK3orZUIvT0c3V04vTUZMNGwwZUhWU1ZWQU1URlFYTmZlY3o4L2cw?=
 =?utf-8?B?Ym5MSUVhTDkwMlBqYmZ2NzdrSSt1S2JIUTZyTW81MFZWL3ZYdzJuSis2dnpN?=
 =?utf-8?B?QUcxSXgyS3RKN2lyZkNlbTdmcmd1RmZtSEhJUkRweFpSVm9WKzMrSHhzdjM1?=
 =?utf-8?B?eXpzeGZDWGNBRjExU2FNOFE5SktjSHZtb09BNjg4YTZwRVIzd2R6S0Nxekhw?=
 =?utf-8?Q?NwOiuhA70uWsifYF9Wkhj0RfG?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11517422-9c08-48b1-8b07-08dd36df8866
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 10:13:05.1882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wv7jWuIzJjS6n6qosJX8eQtJTvggjIR0S2HbOFq0oKu3H+2n6Hre3qRDYo7a00KUcaf35DdOvCMK36J9ROMcrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7912
X-Proofpoint-ORIG-GUID: M5Uk4pMktN--IyLT52LuLJOPb7kiWnPv
X-Authority-Analysis: v=2.4 cv=X8moKHTe c=1 sm=1 tr=0 ts=678a2d35 cx=c_pps a=OGaRt8TyNAR4X2Yz4FfAAw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=V6c5ERrxMIFE83raC7QA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: HgjEX5Yym80iDvRBdsoq22RLXtqfFCEc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_04,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 malwarescore=0 impostorscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501170081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jan 2025 10:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209981

On 1/17/25 00:56, Richard Purdie via lists.openembedded.org wrote:
> I should perhaps talk about the issues this patch series highlights.
>
> My first observation is a conflcit between my choice of "virtual/cross-
> sdk-cc" and our renaming wanting it to become "virtual/nativesdk-cross-
> sdk-cc" due to MLPREFIX being needed/added for multilibs. I'm torn on
> going through another iteration trying to see if "virtual/nativesdk-
> cross-cc" works better, I suspect it will.
I just tried. Yes. It works better.
>
> My second set of concerns are around the usability. The patch
> implements DEPENDS remapping but not task[depend] handling so you end
> up with changes like:
>
> -POPULATESYSROOTDEPS:class-target = "virtual/cross-binutils:do_populate_sysroot"
> +POPULATESYSROOTDEPS:class-target = "${PREFERRED_PROVIDER_virtual/cross-binutils}:do_populate_sysroot"

I think if we put the remapping in the bb.event.RecipeTaskPreProcess 
event handler, we can avoid doing changes like above. The allarch hack 
is also not needed.

I'm testing a patch locally, no error so far. I'll send out the patch if 
things work, or just add some more info here if things fail.

Regards,

Qi

>
> for the 4 cases I found where this is done in core. Not the end of the
> world but will catch someone out in future (probably me).
>
> The need to hack around the problem with allarch due to ordering issues
> is a bad sign too.
>
> I'd note that if we accepted the syntax above more widely, we could do
> that everywhere and not need the remapping. It is really ugly and
> unreadable though so I'm thinking that would be the wrong move.
>
> One alternative to the second patch's approach could be "filter"
> implementation for variables (Joshua once had a prototype of it) which
> would help DEPENDS but not task flags.
>
> Another would be to drop this "in metadata" approach and move the
> remapping to bitbake and make it API. This was going to be my original
> approach until I realised something was possible in the metadata.
>
> Thanks for Joshua for talking through this for a minute, it has
> encouraged me to write down the issues/questions.
>
> There is unfortunately a little bit of deadline pressure too since M2
> is due on Monday and I'd ideally prefer to get a change like this into
> M2.
>
> Cheers,
>
> Richard
>
>
>
>
>
>
>
>
>
>
>
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209969): https://lists.openembedded.org/g/openembedded-core/message/209969
> Mute This Topic: https://lists.openembedded.org/mt/110650523/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


