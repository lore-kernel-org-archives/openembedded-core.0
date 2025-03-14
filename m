Return-Path: <bin.lan.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99168C282EC
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 08:27:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9177.1741940829771373438
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 01:27:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=51682306ed=bin.lan.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52E5GRHW009961
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 01:27:09 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45bgat21vx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 01:27:09 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52E8R8nv026745;
	Fri, 14 Mar 2025 01:27:08 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45bgat21vw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 01:27:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wBghX7+pIUSEakOes+LVaqoqp/Y7zRmD6AW/a0H4qweQWr4SVvjZVf2q5l09kgqlFJ+VffHY9wIrxPcV84dSgsnpzEZ6MhOrkZuobvT7toP0cXkNV7vcF4W5+nzER4eOUyKk2MdiXB7Am66UAvFLsjnTy/7Uc0H1ud8dtlPYzeNOJ+34NgRFCxSV70CxiX0Os8zLca1aGSeaVw0KPKxw23zSilltJ5WRa6kw50GHRg0qW8GXwGYULblAT72DMNsX3hVwACeiFFEq0PEidgLlNEH11xJHkXeRXsx8zsu4mdYpiwuhAMufkafKEdICdD8fSPCTyXmzUm51qcJBn917PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOaKfCRSC4fKRdTpQojzwdETjSDj2AxVdLMWRYesI5o=;
 b=LqcJv3WOsXXOdei1uMPJAaHeZMXeXoRIIRURJvBrNfCGUOL8pmxNoEv5J49ZuXwEqke5JuqeKXEvBojowO3fN6f8rBCGIjb3/8wayVsfkN0ZySt6drbmO36qOAAkWaOqZUT5UskEbT7VXzB7L096UZsdXhkCLeLqkZvfE6jX8FNjcNkIv2npEmDOuNkKmh5E72nTiMLB9okp2Qvs+lghw5+O/RSQytZM2eW6uWmo/PIG5ixBwX6bYah0V13uKngOSIka5kfQ9DcPKAOC5n+CeflHGF9HrIvQXZoFl/zaMCc9M3SongYWxA1hIrOYghUmJSpAv9UTMXy/hFJk717l9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8701.namprd11.prod.outlook.com (2603:10b6:610:1c8::10)
 by SN7PR11MB6749.namprd11.prod.outlook.com (2603:10b6:806:267::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Fri, 14 Mar
 2025 08:27:05 +0000
Received: from CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0]) by CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0%2]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 08:27:05 +0000
Message-ID: <900c197d-938a-497e-b178-c7658f8ee6d3@windriver.com>
Date: Fri, 14 Mar 2025 16:26:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v5 0/1] babeltrace2: upgrade 2.0.6 -> 2.1.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20250313021751.2313822-1-bin.lan.cn@windriver.com>
 <D8FC1AEI4MBQ.2COAWNC1NGIQE@bootlin.com>
Content-Language: en-US
From: Bin Lan <bin.lan.cn@windriver.com>
In-Reply-To: <D8FC1AEI4MBQ.2COAWNC1NGIQE@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG3P274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::21)
 To CH3PR11MB8701.namprd11.prod.outlook.com (2603:10b6:610:1c8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8701:EE_|SN7PR11MB6749:EE_
X-MS-Office365-Filtering-Correlation-Id: dbe373de-02fd-46e7-37a3-08dd62d20086
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?T1FiVEZQK20rRk5DRG52VXlCWjkxeUY3NXhKcFJFSzJYc0YwL0s3di92dVVu?=
 =?utf-8?B?eWtiNEF3Ky9RSWd0MjNZa3hpaG9mSmRuTnVxVSt5QnlVZlI5RkFpT01UVWkv?=
 =?utf-8?B?MGhRdDNLalhtT21rSEVtcVo3Z0FWUEIxdzJWVUh5UC9LVklBei9DNTd4M2ds?=
 =?utf-8?B?enpHejQ3aHZLNWpWbVV5VWFkQ0lwR3N4U1owaFVnTTA3TFJ6SHVnK2QveENz?=
 =?utf-8?B?Z25NblRRYUZYU0RhMzd3TlU0SE10aXNVcjNhMGFjTkpEYVRtbUlLcmJwaUM0?=
 =?utf-8?B?N2g3TXU2YWo5Q3JpS2pIakdScGJQQ09CWVVHTEVJSVI0a3Z6M01Ib3pmT3Bi?=
 =?utf-8?B?b056am10UU5jQlV2NUpScWdkR2VMdlpwaVBFMXRhTUxnbGw1dTA5aXE5d0hM?=
 =?utf-8?B?bDBNSlNXTVd2WWNjeGtOenl6VWZINmExdUIvd3BydWpVbExXWkYwcDVaWGRQ?=
 =?utf-8?B?VUJORmtqd2FZN0lSa0FyN0dLTGlDc1hIOCtBdHN6YkhHS21GYUViTHZBOTJa?=
 =?utf-8?B?MDFaUGxHVWVRL1VQTnRmaEh2UGJxc2pwVzRuMlZhSFhzL0V3MHliVzFrY3FJ?=
 =?utf-8?B?dDJMTXdZUTlrKy9IL1pVcitGelRKY21GNmNVZDhPbmc2TnZ1SnlrU3l1dTkx?=
 =?utf-8?B?djRvWEd0eE5UY09ERnUvNmFrRUQxT2xCeFdxRFl3WU9ha0FkdXhSbUkwZEhx?=
 =?utf-8?B?aVhZenRNYmNKNlNjM3BsVzlkSjVSei84VE1aZUE4Z28yTTBiSlM1VlYrdHNS?=
 =?utf-8?B?UG0rOTRIUkhUMzVmcjJybGo2WmFtbjV2TlMwV0JBMTJ2aUc2RUFveEZoanRr?=
 =?utf-8?B?VXlwVzRtQUwvK3QyL1lVcUpraU5aRE1hN0o2QkpxL0NRNW84ekpWVFVDeWw3?=
 =?utf-8?B?cWI5S0VDZU0wcGY5NG81MUhqN2pTT2NRUWIzZDl5MVIzcjM5R1lxdTlnaVA1?=
 =?utf-8?B?M3czQk03amluRzloR1k3Q0MxcDIrQzIra0xsNlJGMS94RVNTazhXTEQzd09I?=
 =?utf-8?B?d0J1OWZ3VzJPZ3lGanFoRElsU1lqQ1FaUERKYk5KcFhFejJBVFJtWE5RODVB?=
 =?utf-8?B?R3ZITjVxYTR3VEd1dm02LzVuVDAzUElqK3dSQWpvNHpqTGtwRnpMeEpiWXV0?=
 =?utf-8?B?ZVE2YWpnZ25tZU5MYUdmRERsdGlrRTdvRG5GOXhoaVdCNW1DR2pwQWF4Ty9x?=
 =?utf-8?B?WTlycDVqcG1uUnRNakFXKzhuNEQ1ZzFEb05BR2F4czRBcjY4b2dYU1BCMys3?=
 =?utf-8?B?ZE9ha3o1eldIUnFYTGllV01NOTFEMmh4TGo4a3ltRG54UmQ5UTZyQkZsZWJ6?=
 =?utf-8?B?RzVWWWRNN0s2enZSeDlybHZtWWMvSW1sZTN5V2dsVFdJcnZITFJmR2k1THpE?=
 =?utf-8?B?MVVJNGJtQWwzSU05bElieHNob1FkNTFjazlnMUs3Z3NvOXNoZFFvTVRJcUFC?=
 =?utf-8?B?dHFqdlpYT2FvSTlrNjBIeGpWakE1RlNNTFRpWkJJTlJuRE9NSE8rUE5ualZ0?=
 =?utf-8?B?V2UwcFYrSzJYc2d4d213Z1diS1RlT0QwTk9DKzN4eDJCTHRXWU9ZTVhQZkhB?=
 =?utf-8?B?M2c2UGIxQmxqa1ZUUzV1azlKWGl2S0pPVWpRdCttUEZEZmpZZ3YwRG5DcGhO?=
 =?utf-8?B?YjBDTnd0NUlSWm5NMEpWWHp6ZDhiQm9udXZxRStPZFAxL2tKdEZ1US9PdGpR?=
 =?utf-8?B?UHNXZWNpcUtyVUhIQmJIemcxMW1vNWowYWFXeGgzdzVCRUdDVjdVK3REQkE0?=
 =?utf-8?Q?Y0292M7QsIGYnRu1D54qg5DWKhlnOZJxPloemAq?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8701.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZlY5ZElIcDVNU1lUWVBjdzhhN2VwdDVDT0NqODlhRzRna1V2OTg1TDN2b2JG?=
 =?utf-8?B?QUJrdWh1VHZMbGcwTlp6VzNRdDlnY0NvNys3OUJ1Y1ZVZGl2WmVwemZlbGxx?=
 =?utf-8?B?SkVMbVFxWTVFcW1BeFRZeGQrb1k5czRELzFqUmN3cW0zeHBFN1ZCSzhpd0ls?=
 =?utf-8?B?NldZdnF4ZXhFWisyUTVpcWcvTWtGWHJnakJkUkhaWnlHSzNsczM1RkczWVhH?=
 =?utf-8?B?WElrTjNNZjJ0OU40aUIra3daRmdvV1lOSDNHay9haUhVKzFPb3h4V0xCUm0v?=
 =?utf-8?B?RWZ1RmlTejdsS0NPZHN5KzkvUExVL2ZTelJ2bmxxUzNTZ1BZVzU1cUgzQ2Rh?=
 =?utf-8?B?bWNSVE95N2FBemJzamRtVnc5SlZwRDBMVTFJUEE1NFVLaFZpRjcvZTFoaWtj?=
 =?utf-8?B?bHYweTBqOFUrTG9VWjRMTUFOK0xRUjFIc1FkTGluUThmV1RQdnhUNG1pZ1dC?=
 =?utf-8?B?YXRjNytEbHhGQ2h0dDJ3eTljcWVQTmd3MzE0cEs4NHVkRWxhU1FLMzFKcmp1?=
 =?utf-8?B?TzVMZ0dIZFJkcmdkSlh3UElubDNKbnJKTnFLSzdIYjYzZkN0M0kxVkdUclVC?=
 =?utf-8?B?YWgvRm5zcVRSVUFiL0Z5UTk3WVZHU2hTbkxGeGF1NllTMVUwZjdab0Rsa0gv?=
 =?utf-8?B?bFVXTHMyNmlPNXp2UzZSK0ZtZHRQUXFrM3dvYjBoUDdSSnM3TWhqQndIK01r?=
 =?utf-8?B?VFNiWVRqMG5ZSjFDN1g1MmxCdklUWmxKUkVzQVRaOHhTRmdjaDAvNThBeHFW?=
 =?utf-8?B?Uzg5VFNnY0pOWEtaV1ovbnBrbTdybjEyZVFRSVZwYTluYWhlY1ZXZUE5Zk1Z?=
 =?utf-8?B?UVhOZzh4MmIrV3ZGeEYvWm91ZFY2K0hleERsY2g2RnZFZkFMRjhvRElGQ054?=
 =?utf-8?B?RnU2d21rb3JiR2JoY1grczdJMVFVUk1pbEl2T1JWcWpBcnU5Q20yVjRBaTQ4?=
 =?utf-8?B?ZEEyVTJTNjhJcStYOHl0VHp4SENETWY3SS9YbW12Sm5INExRdzk5MGdmQm5O?=
 =?utf-8?B?QUErTVQ2ZlpUTHB5eHRqRVZXUi9FMnF4bFJiVmNleENmWExUbHNKSVFEdi9B?=
 =?utf-8?B?c3Q3VWJYYzFjZGFUVy80UVlqMFM1RG5KRzlrbkxGNTB1V0hQcU1QUTBhOW8z?=
 =?utf-8?B?eDJMTFBnRnZlQThqd0hGMC83ZTRCbFJDMXduNExSM1hCNVl4amF0RGZNNld3?=
 =?utf-8?B?WUNZWTR4WCt6N1g4ZjlEV1JxeGNPbUt1ek9NSFZhZlBGVU0xc0VMa3E3Q0ZJ?=
 =?utf-8?B?ZEgrQldTVE9mRFJzamtOMGNLT21kZkMySFFYSnppTGtwbmxmUUQwZU80RGl6?=
 =?utf-8?B?eFNQdksvMVRIZXhESlFEalBqM0J0WTNFaUVNQXNaaUYzT2l1YWtKMGQ2ekx3?=
 =?utf-8?B?ZDJQdGN2S1laL1dibUNqVUo1TGJCNW9xS0lxZFpZSDhkdlZhOXU5MVRXbGpw?=
 =?utf-8?B?Zk05RmM1WmdFVkp0QVhKTk1weHNOWEY1dXBURTVWN0JaTEdXUlJVbnRDNWls?=
 =?utf-8?B?UXlWYXZ1SGJxOVIwbFJ3Wkd6UlVDbXR3SXNid2paVVh5V1U5RnlSVzBDbkdn?=
 =?utf-8?B?M0pZSWVPVUpsUmlVcmk5M250bnNya0ZSRXo0UWpOOGs3YnNZOE1LbUY1a1Rx?=
 =?utf-8?B?SHg3RjlrbVUySTBiRjJRMUlYSENMUTZrN1Z5cWl3cUpHZE1sMGVkSUFrdVpM?=
 =?utf-8?B?b2lpVEY2bHp0aWgyRHhNd1NQZHNmNktLd1NaUXNVajNVUnozckxUN0JmVGgv?=
 =?utf-8?B?U3RUb3AzYmVmREV1RUtOWlBkKzk1VERaQTdwdVFYNUpudnNMUGZjTjdYWE1V?=
 =?utf-8?B?SFpORi9sU1JRRm5sUlkzUkpMZ2xiWWZqOFhJQmI2b1dpVzVwbUNWbXFoVCtq?=
 =?utf-8?B?KzVOdU5UQ2plVk1GcEpWODJzdHM5SVlmalFjcGI1bU82RW5mcERNck9EaDF4?=
 =?utf-8?B?YU9NM0x2clkyZURUZXpMUGVDMTQwSE9LRGxCZHNxZERWazN2TXhSSjczT25V?=
 =?utf-8?B?NHp5RHRoV0dNUTYvS3dZdkx5aldOQTNTbnBsdHNyZEhKM3ZVbmFoZ0p4cjV5?=
 =?utf-8?B?SmhUeGlNVnMwZ0dqZWc2TDhwcHZTSVVJOURaVDFkdjRLd3pZKzJXL3BoYWJM?=
 =?utf-8?B?V2RucTRDc0ptVFo5Z0dUdm5vMjlWYXBaV1d6SzRWK2tEUkVVR040YzRwdFBT?=
 =?utf-8?B?bnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbe373de-02fd-46e7-37a3-08dd62d20086
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8701.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 08:27:05.1351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uHaq09tTLyVGPr6wlst9jHwZlmEL61rppee3Rk/hZJsqubKU2X4p/KqciIoakqCikiraJ/yNF14Yy0fMAqI03eMiG0dgVe15pUvy2JmFJss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6749
X-Authority-Analysis: v=2.4 cv=VYX3PEp9 c=1 sm=1 tr=0 ts=67d3e85d cx=c_pps a=GDxOUaUasxmcDRSC7gC2IA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=iGHA9ds3AAAA:8 a=1NWNoF9oAAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=eutCOiaOnUahuVAIPSUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=97APRTa-CG6DvPMFVxHL:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: NZjAcIFH-2xpxNcyLCgH-8ugI1eDcgRY
X-Proofpoint-GUID: VytVWjw_yPJ-4uXuSvHR8qdL5yD0RPXA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_03,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503140066
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52E5GRHW009961
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 08:27:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212822


On 3/14/2025 1:59 AM, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Thu Mar 13, 2025 at 3:17 AM CET, Bin Lan via lists.openembedded.org =
wrote:
>> From: Bin Lan <bin.lan.cn@windriver.com>
>>
>> v3:
>> Some failed test cases are disabled.
>> All test cases are passed when running in intel-x86-64 board.
>>
>> v4:
>> The Upstream-Status of patches is set to Pending, I will discuss it wi=
th Babeltrace2 project.
>> Add some notes in the commit log to explain the license change signifi=
cantly.
>> Add more notes in the commit message to explain the change of babeltra=
ce2_2.1.0.bb.
>> Remove "INSANE_SKIP:${PN}-ptest +=3D "buildpaths" in this patch by set=
ting the correct environment variables in env.sh.
>> All test cases are passed when running in intel-x86-64 board.
>>
>> v5:
>> 0001-Make-manpages-multilib-identical.patch and 0001-tests-set-the-cor=
rect-plugin-directory.patch
>> are submitted to Babeltrace project.
>> All test cases (no skipped test cases) are passed when running in inte=
l-x86-64
>> and qemux86-64 as the following shown:
>>
>> Testsuite summary for babeltrace2 2.1.0
>> # TOTAL: 2022
>> # PASS:  2022
>> # SKIP:  0
>> # XFAIL: 0
>> # FAIL:  0
>> # XPASS: 0
>> # ERROR: 0
>>
>> Bin Lan (1):
>>    babeltrace2: upgrade 2.0.6 -> 2.1.0
>>
>>   ...001-Make-manpages-multilib-identical.patch |  12 +-
>>   ...not-run-test-applications-from-.libs.patch |  28 ----
>>   ...-fix-test-applications-in-cpp-common.patch | 129 ++++++++++++++++=
++
>>   ...sts-set-the-correct-plugin-directory.patch |  30 ++++
>>   .../lttng/babeltrace2/run-ptest               |   4 +-
>>   ...eltrace2_2.0.6.bb =3D> babeltrace2_2.1.0.bb} |  35 ++++-
>>   6 files changed, 198 insertions(+), 40 deletions(-)
>>   delete mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-=
do-not-run-test-applications-from-.libs.patch
>>   create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-=
fix-test-applications-in-cpp-common.patch
>>   create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-=
set-the-correct-plugin-directory.patch
>>   rename meta/recipes-kernel/lttng/{babeltrace2_2.0.6.bb =3D> babeltra=
ce2_2.1.0.bb} (69%)
> Hi,
>
> Thanks for the new version, but I believe we do have some failing
> ptests:
>
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/1758114/raw_i=
nline
>
> Can you have a look at those please?

I am working this issue. In fact if I use =E2=80=9Cbitbake core-image-min=
imal=E2=80=9D=20
to generate rootfs, all test cases pass in qemux86-64.

--

Bin Lan

>
> More details can be found in:
> https://valkyrie.yocto.io/pub/non-release/20250313-87/testresults/qemux=
86-64-ptest/core-image-ptest-babeltrace2/
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

