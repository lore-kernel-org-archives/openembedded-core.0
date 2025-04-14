Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A16C3601E
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 03:28:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.41934.1744601330820130347
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Apr 2025 20:28:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61994136b9=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E3Soom023818;
	Mon, 14 Apr 2025 03:28:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45ydd1hmbw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 03:28:49 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53E3Sn9c023813;
	Mon, 14 Apr 2025 03:28:49 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45ydd1hmbv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 03:28:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GsQD7MWbbyMCb92hfFW2DrbCLu7XFaiJl2zLqt2TYAIO+mGoi5j46AsencvBzkTns8vfu6UKIBs+CuePrVM5ljNqoBObygENCX7EuLiC22L46bfbETPf72u6vityFaPsyf+aVJj94Zz2gEmzv8ZmdLXq3GsUH399LidWGvycaSsGK5OnkPtatCTq51Oec+tmNk3hPuH4OKEDmHMBvXqqqIbWXuvoBlrD9R5oTUdIH11ZYjSL63UqGPnrm4FqMAVMNNEDlJgYhKNRR4nYvj6Eo3OV5VTtgaLXiaGRqyedrw4a5nYxxZais443SdZPI18ln0MsJ8bIpCXhTsZtAVyJyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tre0EH5PtjEH9zzwe+sGsf+oabWKhq3siIDNN8J6JL4=;
 b=YJB1ona3rabpQ3VVyTRFC8HASNrY08K+6/t+tEUJL0CtA13KaQ1MZA6z761wi0I8PsCw9a7cZeX476zoPGjGAK9y/ap8c+g0pHfgaPR0usCLPkc1I7qY/fALdpD00dJ52cgbOhZam4laab/y1M8+ECfI+IQa62UHdE3MiO5RvPvvtVn32WVYmKrhz/zf9TFkt/afgZ1iyAIa+VfO3Auin5b8jvd9IFrxW3WDaXnOUDPng/GWvpGAuypbqLwgDGkNpjJTDtNm28yI7IYq7BuHCZtn9VCZkVdhzKd4NVwuv9pCX43SsbjuC+/XsjJ9DqzsUdsJqYeAPVGVX/CUo5XblA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB5173.namprd11.prod.outlook.com (2603:10b6:510:39::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 03:28:46 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 03:28:46 +0000
Message-ID: <2cdea284-f297-45dc-a048-b900547eb94e@windriver.com>
Date: Mon, 14 Apr 2025 11:28:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH V2 2/4] nativesdk.bbclass: handle
 PACKAGE_WRITE_DEPS
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20250410134021.1299595-1-Qi.Chen@windriver.com>
 <20250410134021.1299595-2-Qi.Chen@windriver.com>
 <D93MXXT6F706.2574MGU99TVPT@bootlin.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <D93MXXT6F706.2574MGU99TVPT@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYAPR01CA0170.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::14) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH0PR11MB5173:EE_
X-MS-Office365-Filtering-Correlation-Id: fb5e6923-4ce1-488f-305f-08dd7b0476db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WUgxLzllb2M5dE9jVGRSY2xzcG96QVhTOC96ZmpEOVljODkvVThwNlZtd3gv?=
 =?utf-8?B?YmFkQjJuNmdWbE45QUg4VHBSWFdrbHBtRGloU3JPZ1NTRUJQVzI0SHcxbXBV?=
 =?utf-8?B?MVhObWFLZ3E5Sk1YN09TczA4MHorNWRzOTlEZFZpOWtvdmZHNkFjWU15Qk45?=
 =?utf-8?B?TVFYR0x5L1JBdS92SFVaVkZxWUZIZzRiZVZZTG95UTFtWWx6UElsa2ZUbkRW?=
 =?utf-8?B?RDY0dllaNmNVRlpWYzdJZWd3cGYxZkpCbGdJeGN5VXg5eWozc1N5aHhVdXZS?=
 =?utf-8?B?d1lpZ0lFUEdUQXQxSE1YTHJicktIci9NQnhveUpKZEZzTG5FMTJnQWVPdndw?=
 =?utf-8?B?Q0xNOGo4SlNFdmw0c2FwcjJJdEZCc3pKV0Nzd2wxQWNPMWlyNFNVcU1VZ2RB?=
 =?utf-8?B?bnZDaFpscDFhZk9uQU5aYjNKTG9mWndhU3ZqRHl5UXZWcEdndVl4V3dIcXVh?=
 =?utf-8?B?TUovU2R6U1JRS1NyRmdiNFI4RloxQjFHRnJPT0JsTzhDR3JXM01GeDNNUTAy?=
 =?utf-8?B?N0FWbHJVc2RqbnUyc2MvY216LzAyTUNoRG1SK0cyNXFheWl5ZzlDMUM2V2dZ?=
 =?utf-8?B?VGVEOXg4N3ZrcjhycmJIQ0ZuOHFSVzdBTHdLcURQZDVPSWFpUktHU21FT0hl?=
 =?utf-8?B?U2YxbkFsNTkveVhYL05RL0dYd3IxVVgwS3VFMW1KWmkxamt1cXVobmN4WUJI?=
 =?utf-8?B?N1o2RFFudUpmb2JabG9tZDE2TGtGK0N2QitDNVdnVXFSQkh1blJUdEVYUnEw?=
 =?utf-8?B?TlpJUWdSVTVBeFd3aE5TZGNKRWZCTnVGRWZWTVNpZFovQ0xmajdLMy9RU0lO?=
 =?utf-8?B?eHNnK1dyNW5yTUR0bjgxYU40K2M1QjlMYlVxempGWlVtdUNxcEZGTStpZDVn?=
 =?utf-8?B?Q0txQ1VqcDJxdUhFK3p1RUtIc3QvV0Q5N3J5dVJDd0plQmtlS2U4ZzZyTTll?=
 =?utf-8?B?aTJ0Wk5uZ2lVWTc5bHQvbFRBZTJzTmRLOFVRd0dXbEhwaWNTU0FJY25Lc1Jr?=
 =?utf-8?B?ZnJINjdIWXo0eGd2SEMrbE0vUlIrb3lMcGVOcTdZcGRBUnRvNkJPbzh6S2xm?=
 =?utf-8?B?QlJiWlJheGtNTlYzL3NJRFR0NlEwTGk4K2RHcHZtSW1iTXRoV0dOQkhXeFlj?=
 =?utf-8?B?SkhDNzdGMWNEaUhRVUw1OHJDc3p0NHBiSnJMVEZzTDROeHJxWFlBekVQTm1r?=
 =?utf-8?B?R2lva09wTktkQWdxRGxJVERIbWw0MHB6T1gra1g1KzBHVXQwaHlGU1V2OEZv?=
 =?utf-8?B?Sm8vc1Nja2Y1czlZNUlqL2ZrMmJleFNiODE2TS8rOGptbERxdkpZWXNqSDho?=
 =?utf-8?B?aXorTHQyRGhGRDVNSXJiTjVrK0pVK1hPWEczQjBuWlhjbGNESHl6RVdzYXFy?=
 =?utf-8?B?a2I5VDNNWWVYaWdHOXBrQTJXcFVrV1V2MWs3QVVCVGkvdkYvcWpPK1EyLzFm?=
 =?utf-8?B?VmlIaGg1V0x0blNUZjJlc0JkWmRYbW8wQlRibjR2UVUreC9LckE0anVaa2VI?=
 =?utf-8?B?dTVMdHFIb2pwN21JWEF0UlUvOVhwWWRpSDBJYkhtL1I3VDJTbG9VTkdPRW1C?=
 =?utf-8?B?QTdOc1MyL3N2Tm9nNEljSyt3d3VzSnpPOGN6UDJLbUVadEYyYXFBQktDam5J?=
 =?utf-8?B?UlJ3dUhmMkpsaHVZckxQZXJ1cEpzdG5laklLWkkxSk9MTEZwMlBmdTNYdlJP?=
 =?utf-8?B?UmxBRFpNRCtMczZmZlZpOTVnUHZHT0t0Z3JSYS9BdEZXVDJxUnhuSStFaHZN?=
 =?utf-8?B?bG81K1IycW9hZ1hpcGVBTjM2MVJCV0t2cSsxaEJsbVJKWjRncGpXYVZhS0FG?=
 =?utf-8?B?V2RFcWtCSkwyMVBYWGxHcjVJWGN3bTVycmIvYlNUUTdQcmFGS2REcW1oNVU1?=
 =?utf-8?B?RGdFRkFaNTFYWFR3Ky9MVDljTnR6dVVSRG11cks0eHhLRnVWVnk1NG9uYmow?=
 =?utf-8?Q?GH36byXW0UM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZUJIcWh0Qk5PN1ROQXA4ZHV3ZDNFQWROb092QW05RDg0ZXByQWw0RmxWeHd2?=
 =?utf-8?B?ckpnS0d3eVFISjRTWUprOU9LWkJvcmZNVlQ2MEZ2MGRvNjBMbVlEK1hiN2Mw?=
 =?utf-8?B?Z1lReDlXOVNNTXVLaTd1ajRMT0lic3ZJVjlDUzYrbHFXdDkveCthMHlYdWU1?=
 =?utf-8?B?bVNrQlV5T0kvNlNpNVI2Q1lNaHN2bW9rRzhEY0dwVFZCT0VGREF4ejVEM3dX?=
 =?utf-8?B?QThTMk12NDlxYVo0SFczS2wyUll5dDh2dWptL256OWZiTldsMFpsMUhRa2Vl?=
 =?utf-8?B?WDRZdXN6Wk9KUExkQnByTkxpRFEyZ2ZjajZ3SXNUTjFyb0lyT0VSNkh6Nkwx?=
 =?utf-8?B?NnBxRE5tMm5jZHhHK2JEYTc3aFdqeUdHeSsyMWlGd1lQWDRMQS9sTnFyaVl5?=
 =?utf-8?B?WnYyelc2ODdOeUxlREdIZTBIcVNNZHJZMWJpS1lvMzFNWGo0cjNjbzd4blE5?=
 =?utf-8?B?VmtXbjlQbXdUR09uM0tTZGVBVGU4YW9SaGxNUGVaaUY0bENsUTcrVjNGZUh4?=
 =?utf-8?B?a0U5TWtqT0FwYklEdVk5cmFPalJIUkVWMlZWenA2dit6dkg3c0dFZ3BXVFg0?=
 =?utf-8?B?YUNwYTdDdGpaenBPejdhd0NIbk9XM01kWHV1WEJNY0htUVRHZXFjeEt3cStD?=
 =?utf-8?B?VjMvM1VuaHRyc2pXRTR0WkdKaVhuN0xoZVVGM2pRbjdQcTE3S1lKY2ZUVFkz?=
 =?utf-8?B?VFV4MkdKUnlqK2ZiMUhSZWZuaEg5bzBBRjV2WHZQUVFoa0hnbnExQXZtNE5J?=
 =?utf-8?B?dEMya1dienNQZUFtYU4xZTZiMFhPL2grKzhUdS9YdmR0dFhFejBYOWtqT3lY?=
 =?utf-8?B?WDgwTjk4c2JBbjk1cFFGMTFGcE5TQ3dxMXhtOFZzRk1WV1pYUkY4eGlQOXJB?=
 =?utf-8?B?dzgwSkhiYy82YzhoVDdCUGluVkpQS0RBZmpUbHcwKzdTSWZSNXIydUlsOHov?=
 =?utf-8?B?bG1xQ2RJSWpZTU5Hc3ZMVFQ0TzlUK0NrbGJTUHFkZTZGemZZSzZKWkF1eFZn?=
 =?utf-8?B?Vk4rWmU2NFRFNDJQNGdxVWJiQWNhU2NPbG92MnpTU09TMko2RGpiaWRXbnE5?=
 =?utf-8?B?d2JiZlBYcEN3b1VYL3pQT1J6R0dTYlcvUXI2Z3ZEMUVGa1d3SGJ2dWdDZVla?=
 =?utf-8?B?OGlZOFJxUkNTNFZwcFUydzc1OHJDOEcwcGN2MkYzTHNDTFkrOE5sL0FZV0Jq?=
 =?utf-8?B?Uk1xYlR4OEp0V2FkcTNFZnhuT25ucVU4MTdCT2F4WmtYUFpkY0dNK3AyMSs0?=
 =?utf-8?B?bFVPWGE3aENTanJDbnFqcUprWnZ3OW4xa2JFQm5BempTV3NpVFNYdUZ4WldD?=
 =?utf-8?B?VWhrRHJaTytXWis1d3Q0NmRtTzFYR0dUWVcrclhPNm9LV0JCcXlIamJEZ3Nu?=
 =?utf-8?B?OHB3MFVEODRtNHpZZWRyUTVXQVhjazJacHk3TmhvcXI3UTZhaW1PTXVJT0xi?=
 =?utf-8?B?S0RJbHBJOHA3dkFaUFpNcGRYbTgwbHhZK2VzL0R3dFFiWnRQeTRqZWgzZnh6?=
 =?utf-8?B?cHpJVkpaYWN1WC9oc3l2T3U4MzNwekNTWGhEd0l4Y3M5MG83aDBwaDNkWGJ4?=
 =?utf-8?B?b3d3Q3ZhdG5OcXJuUEFraWJGb2h5L1VrK2M5ai8xcDFlMEIxdENiQ09VMGs5?=
 =?utf-8?B?L0pPSjhKdXFPMXE1UFh0L1ExeTMra3hXdzdTOWNPMEE0MFh5aUs2WEwrd1pJ?=
 =?utf-8?B?SVNIMktlWXNrOFh2VUwwbExLRHBobldYVFdpOU9JR2tyaXREb3NPUjNlRUdp?=
 =?utf-8?B?WTdiZWVGRHdoRzZhRUd3WEtSYnI0amhZOUNzck9FRFltYzhBSU1vZ01nM1lM?=
 =?utf-8?B?aS9RWmhTdVpUSVppWGtnMnBaSXpsaHVJTVVTU1VTeC9WUkNLS3VFM01mZ1k1?=
 =?utf-8?B?cG03eWVmMGJBQUlhYmpOeWg0QTZPOHpKYis3aGF4T0VXU3lpV2hsSzExNWdE?=
 =?utf-8?B?VExORkNiRENhSHhVUmxLT00zalQvK2U3Tno2KzJYbk1jK2U5TlB0czVJSVZn?=
 =?utf-8?B?UDEzdU54WHpiVGd0NXN3K3RIZ2FubjdaM2NQMTRLblVXUFZLSlFYT09tK2Qx?=
 =?utf-8?B?Q2dVV0pwRlpybk1VS2pXZ0srUHp5Ujh6ck5uQklic1Q0NmYwSU5Gam82QnYw?=
 =?utf-8?Q?hpKyGuP0pwnS+SYKNledcvlkh?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb5e6923-4ce1-488f-305f-08dd7b0476db
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 03:28:46.4345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MziYOuu/dmQjR8/VpFVuJQ+JUDK1+gAWXePXDOn7B16HxQYH/R9RK4Ag/qjlRylqaSvKBw3yxzdMNWE4WFKMTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5173
X-Proofpoint-ORIG-GUID: fK83L6pKoIp8T4kQYNRLBiqtLqFWKzzn
X-Proofpoint-GUID: tWHIo8HVLMpCPqj0HsYEL_H9Tv91aMH8
X-Authority-Analysis: v=2.4 cv=HecUTjE8 c=1 sm=1 tr=0 ts=67fc80f1 cx=c_pps a=t4e0UQJdoJrPmzgCWb9hsw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=8lDjYnUQXbhyZvDsAJcA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504140024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 03:28:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214791

On 4/11/25 15:36, Mathieu Dubois-Briand wrote:
> On Thu Apr 10, 2025 at 3:40 PM CEST, Chen Qi via lists.openembedded.org wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> We want nativesdk packages to depend on correct recipes introduced
>> by PACKAGE_WRITE_DEPS, so do the same mapping just as we do for DEPENDS.
>>
>> Before this change:
>>    nativesdk-glib-2.0 -> qemuwrapper-cross
>>
>> After this change:
>>    nativesdk-glib-2.0 -> nativesdk-qemuwrapper-cross
>>
>> This can fix do_populate_sdk failure complaining missing of
>> nativesdk-qemuwrapper. Error message is like below:
>>
>>    NOTE: > Executing update_gio_module_cache-nativesdk intercept ...
>>    NOTE: Exit code 127. Output:
>>    /xxx/lib32-core-image-sato/1.0/intercept_scripts-xxxx/
>>    update_gio_module_cache-nativesdk: 13: nativesdk-qemuwrapper: not found
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
> Hi,
>
> Thanks for your patch.
>
> It looks like this is causing some issues on the autobuilder:
>
> NOTE: The "universe" target is only intended for testing and may produce errors.
> NOTE: Resolving any missing task queue dependencies
> WARNING: Nothing PROVIDES 'nativesdk-ptest-runner'. Close matches:
>    nativesdk-libtest-warnings-perl
>    nativesdk-serf
>    nativesdk-xtst
>
> I was able to easily reproduce this locally, just with "bitbake universe -c fetch".
>
> Can you have a look at this, please?
>
Yes. I'll look into it ASAP.

Regards,
Qi


