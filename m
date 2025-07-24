Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F17FEC83F1A
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 04:23:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4808.1753331027812104013
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jul 2025 21:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=930074213d=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56O4Ja4F348614
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 21:23:47 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 483ac7r4q1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 21:23:47 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 56O4NkGL354546;
	Wed, 23 Jul 2025 21:23:46 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 483ac7r4q0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 21:23:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wFFUsx0KWUbXAiQrRZb4T1N5QfxjmYcRZRkFMm3f82hEa3iXJy5RI9k+MdUOOx15oFrHlzlD0w2raQhJZCRdy+zJ49OUzBmDsnkBLxJZfTeFC/hV8MuevdJBHSgejFkx4DiR/INWs51o9hjVZ+FmN7ECILYpk+uBsHf9iZZfLsDjimH1WvZK7NYBcIb6ROlACmZWUO19E3T51byfTNq8UIdw8DG+CMi9RNu/ygwA5j/BFndhZ7npYsRH+NMJ0rjYAYJi2rVP6SL0a55rgqFoiQIjDS0flM++eUTc2LUe0+jQElVomd3FRNKzNZb44E6lzhTtEenjMkmPLI2sVu6nqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EeDE5ICKCqHw9Viyecd6LRnksB6pVAgWvtYKNEKlI44=;
 b=QnPeqhvWD05cX/1X5T4HNI/ipvCuSu1cA36ncMB09dIxXxHuPecn5fQJboB8BHjzOh5sq8mvbJhQMdA9jsNQBKZxxlrptxuDD17ZQqV4rmnwnMdjI03i5keZTQKUA5fyLUMIPe6ILY0kuKYh4vJHQ5X5exGkUXYvUEGsYWMUncLFcPbyofVZlrxHVL3Ca4iS5BRbU+N6ldE7r2vpYKiNL4YJM8pKjERcLm0qm5tZFqbF/1sHTJYb1dhDlJ4x4UElKEgyNx1d+cK68s1qkjXWwQiEaoDVY8d2K0wrjp7SPEtHvb31+6FII1SHYfl3N/TAO8Eyca3wzpVqvQErIP/Plw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DM4PR11MB6190.namprd11.prod.outlook.com (2603:10b6:8:ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Thu, 24 Jul
 2025 04:23:43 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%7]) with mapi id 15.20.8964.019; Thu, 24 Jul 2025
 04:23:42 +0000
Message-ID: <909b38c3-075f-4114-ae6c-838b3eb44aee@windriver.com>
Date: Thu, 24 Jul 2025 09:53:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rust: set CVE_STATUS for CVE-2025-5791
To: "Marko, Peter" <Peter.Marko@siemens.com>,
        "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "Sundeep.Kokkonda@windriver.com" <Sundeep.Kokkonda@windriver.com>
References: <20250723104923.1204089-1-Deepesh.Varatharajan@windriver.com>
 <4acc3f53298c69ae7f7fa9b9302a565d9a799af6.camel@linuxfoundation.org>
 <AS1PR10MB56974F5434B447CCE9CFF00EFD5FA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <AS1PR10MB56974F5434B447CCE9CFF00EFD5FA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MA0PR01CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::15) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DM4PR11MB6190:EE_
X-MS-Office365-Filtering-Correlation-Id: c97c8f9f-fb79-40f8-cf52-08ddca69deef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VVVETHdFQU04NFkxdXVPYmt5OVptcW1wOUR4cTVZM1dKS0pvMU1YRG9SY2pE?=
 =?utf-8?B?M3JjQXBJMEUvVERyVzNoZGFOaTJsQTV5QWZTaTdkUWxVeWZTTVdZcHdubU1C?=
 =?utf-8?B?SDA1ZVlmaDJJb0c0dUxpblltV2JsTml1OWVzTmYvbk9NZHliaWRQYkFGVkFv?=
 =?utf-8?B?MEQ0TlBXOXVsOW5IRGkwQXpMc0lac2FCYUNuUGNnLzZLRWZKUVhWVWdITkh3?=
 =?utf-8?B?TkxHY0l6cWlNN1dYOW5XV2poUTJwU2c5YURpNUtDU0lGcFovSWtaanZQNStx?=
 =?utf-8?B?c0FmcTJ6SmQzNyt2UkRkT3lZZnpOaDIxYmd5dnB0dlRjNGtTM2RDc3MwZURq?=
 =?utf-8?B?VnR1NHRkTHE1RGhzQ1k5YUQ1NmozT093SlNsbEtuMmFaTTF4WUFlend2UFBt?=
 =?utf-8?B?OWFBb1hWcFVqNVhjeWFGODJhTUl2MmhIL3NlK2M3eFBGbUNZa3pldmZqUWUr?=
 =?utf-8?B?SWxWaWM1dG42QmY4ZDYzQlp1M2wzaHFuVnlwOE95bkRmN2Q2ZlM2azhWSnhq?=
 =?utf-8?B?UzVQVjQyTmNWTE8wK2Fhc0hMQWhmK1RhaFBGbVB1UzdGUFdHNkw5cCt4RlNF?=
 =?utf-8?B?OWozQkplaTY0REVuNUlYSnlrMzhFbk4yM0FCSW4wc2ovd3hCSC9jUlZTbE44?=
 =?utf-8?B?OVpBTUVVOUhGMmRoR1VFMjVWd2pJMnMvb25TZERJYy9GZ2JiT0lZVndyZms0?=
 =?utf-8?B?bXc5WlM1T2tNR0VQVE1TTE9weXplR2VIellFQnJ6VkhXazl2VFV1OEU4Mzg4?=
 =?utf-8?B?aW1JK3dvZFRROUE4azlFcmE3RzR1NkRVR2hsd0hVYVNIcUl4S0lSbnc0UTdQ?=
 =?utf-8?B?TEhaOFpSNGY0REFacEpCdjByWWpKZVliU3hDUE4wZTdqYXpqVGg5VERjbDEx?=
 =?utf-8?B?czE2YTgvbXdMQnd3WXF2SVhxZzJ4SjFoeTBNYUNiOGpQRWNjZ2tJWjF6SHdr?=
 =?utf-8?B?ajVrZG9zMFhZdVY5L3BLbm80M21aTTFSWWNBQ3NFZm80ZGF1NDJ1eGJKOFR6?=
 =?utf-8?B?YzE0UnZQN2ZtVVdYQmx4WExXMkkxWnJSSDBSbmg2N0hmeUdBbGI3ejZ0Zis4?=
 =?utf-8?B?aE1ZUnJPdDR5QXlmYUFIQzhIYVpOb2hFQy84cW13eTVyOEEwQTZJMGVLbW5v?=
 =?utf-8?B?S29qZ3hVT25PQ3ByS0tFR0dlOVV2TFA1T2xDWVJhZmMvRVFESG16MjBUSnR4?=
 =?utf-8?B?SnpxOC9Yd1VTdEhzQkVFS01VaUVXaXRSTVl1eWEydDMvbFEzb01raGVOcnda?=
 =?utf-8?B?L25JTEk1b0JiR2laYVY4MXdkb3hvRXRsZFIwSFIvSjhPWDlPbHFqclJabWxW?=
 =?utf-8?B?QU51MW1QZXFkOHJ0dldReGdZOTVodURpUDZsSWtaQnladmxMcDEySjBYN1Rl?=
 =?utf-8?B?VnJnZGtYcW9jblBnbTArWEM0TWhlVC9MbWZWZlRNQjczamJxcXZNZmJWMzA2?=
 =?utf-8?B?UXh5anpJZWk2QUFMVW05N1pBUHlING0zRzdPMm13ZEpSSmcvanEyaUh2dVAw?=
 =?utf-8?B?Y3IrNGlMNld5QU5TTFhKM1c2QTYwY2Q4N0RmUUF6ZE9HWGd1TmZ6RXlpMnlE?=
 =?utf-8?B?Sk9rZGJEVVFqSGd2dFE1WWo0UmZmdjlEVncveVhaRERiVzhoa3NnMmlhZ3hm?=
 =?utf-8?B?bEIzZzBMOGUwM1VDdDZ1TEtNUCtTVHpLeTV4RkdDak1zL3R2cnFRTUlodlFq?=
 =?utf-8?B?anVxdDlpbkdzbk9EU0RRVzhRMWVvb3FjVStYKy92WlVYelBtS29Md1hWeXZu?=
 =?utf-8?B?b3JIUWJwb2VsU3g2VDFpVUx0Y1k3RnhuUDZ3dHAybHN4ZHM2eEZtV013Ymkv?=
 =?utf-8?Q?ijOg2m0wp1suAz5LWVWupD0V2Jp0oxr0/hE/A=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aHo4c3JuYUR6NlFQL2lpNTVGeEZkNlBTV1J0cWlpS0RWL0JIazdseVFtZ0hj?=
 =?utf-8?B?ZGdFNGlKQUprR2dwMms2N295Q2pJNS82dnJVclZXQlZLdnA1SDY0VHlOSU5n?=
 =?utf-8?B?aHVRQTVqVUN4NHRtcW02SEo3SUpxd3pTUzZITHJ5anZjc1R0M3hqUlR6bjkx?=
 =?utf-8?B?Qys4ZDVSREhKRUd3WERPSHFaMnB4YXd1ekx5ZXVIQkNwWXNnZkFIVklqanVy?=
 =?utf-8?B?cE5WTC9ZcG9TRlNsbXFKMDRrdENBOW13UUgrQ3htRVQzSngrejgzL3htS0dR?=
 =?utf-8?B?ZWZUNmw3TW5sQmVMS1FUZW1QY01PdEtDcERITkZFTkdiWjAxWnllaldkcHF4?=
 =?utf-8?B?a1NsWllxc3VVeDhKZGRNMEpYZWdTVmloZW1xTktkS2RtRWM5ZXVRcVNobzJK?=
 =?utf-8?B?NlEwMEV4VWdNNWZsQVBDMkhka3lDMk9IbS9rM2t1MndVZTAwVE9aTkZuM05Q?=
 =?utf-8?B?a3hnSm5zYXlNdStlNUxXQ0tLTDV3dG9Md1pqN0hWQ28wOWFGczdHL292T3k4?=
 =?utf-8?B?T3NHRFN3VzNTMDBLcWRBSG5IOVhGSUo4ZWs0b0dBakFsZkdxQzl3WXFtUHRM?=
 =?utf-8?B?R1R4cUZsR2RhbTd4ZXZvVUNwMzdiSlArRkJncWZjYktDejRSRE9mZkdrLzg3?=
 =?utf-8?B?Y2pmTEIydE5SRUJIMzNRUVhmY3lXTnVoZUNvUTRlR0UxYnZ4aXk3YXJ2NXRO?=
 =?utf-8?B?OXpLVlhncFRIZE4vcjd2WFhkYThzNWVERUJSQ1pIT3AzRVlnT0hZWmtrbGlN?=
 =?utf-8?B?NVltTlRmRlBabjdYSjUzWWNaYUczZUlIL0ViSEZxSDBOdmlGOVhqYmVBZkhE?=
 =?utf-8?B?NG1yYi8xa2RNY0lRa05ISXRjdjhmTTdyWlF4anFaVG92OTA1YmF5V3MzMi9P?=
 =?utf-8?B?TVdOdVVwZnV6MlprcnlPQ2J2cjQwbVNTYjZSbzNnQzN3NGE0a3pYc29ZcVEr?=
 =?utf-8?B?SVZ3aWhKTHlpRFFqRUdDL3k4ODk3aSs2UzF4L2FSbEl1a2Jmd2wxTCt3NHlQ?=
 =?utf-8?B?NmttbXRBZmtjbDhOSXVIcjMrTXM0MVJhdHI0TVVPZUovYVhFV3lYclhWNnJR?=
 =?utf-8?B?RDlxWTlScERXWjZVTG1Rc1B4TkJHSUtBcW53Rm9DeVdMdnlwaFh2VC8weXdC?=
 =?utf-8?B?UTBLM0dPdTFTbFFzOVcyRVhUOTlmZk1qa0dST1ZVdTEra0dXUXhFL0loNm9s?=
 =?utf-8?B?aFBXNkVORU4rby9rWE90T1JlaTc3ek5NNkl4V29WTFpjdmZMdmJ1NDZldVNH?=
 =?utf-8?B?R0RLNWF4THZtbzJBZHFBcmtuWG9ja3dHYnBydkR2aUxqR1lnUXBVd3ZOZzMw?=
 =?utf-8?B?S0pqYmY4TWo3OXNXZWw2Nlo0TDkvK3pOb0t4eTd3eVp2WTVrdUs2SXh1UHVv?=
 =?utf-8?B?cWkxb2liWlV2YkRvaE1kbkpqRGpUWmp5RlNRTi95UFNsYzEwbFByYVdWdkxR?=
 =?utf-8?B?WWZ3SjFmR0JhZm81VUQ3c2ZsbytNVVdIZzNMckNwd2dHNThMY0FqeXlCdUYy?=
 =?utf-8?B?MHk3QUxSV3BRR0JHYmc0SWNJbklkVW94d21wTlpJK1VZVTFYWHVLYlllUGJP?=
 =?utf-8?B?SmRtYlYyUlllUjB3RUVta3V3TDNmRmdaRGxwQVcrMTc4OE55dFhHbW0rdWdL?=
 =?utf-8?B?enhrMStYT3UwcTJRSFpPMEpDTytCS0pvSWZ1WGFBMWpzQTdTd0g3WEVuTjhM?=
 =?utf-8?B?Q2JYUG8weW9iL0MzeSs1NmRPUjNMWCtRVW1LWlJyM1NpYjA5dThxS2lmcXRP?=
 =?utf-8?B?VWxKS3JlTkxOQUtMMTlWeXlpdVF1andOcDFDcG9kTjJ4elRXT1BKNXM0ZzYv?=
 =?utf-8?B?RlZuMUNtTldoTTZJUHRUenVyRmN0YUxYOHVGSXQxUUFPTkZtc2l2cHFtcUF1?=
 =?utf-8?B?OEdjVG9EVVU5K1lBY21manFIRG9XRWx4YjVoMTA3cFpPR3A5QnBrVTZ3c201?=
 =?utf-8?B?c1lCbENsVFQ2RmJhNU9MUExFUzdrb09oYW5hQytNaFRNdmkyZVpZSDg5eWhC?=
 =?utf-8?B?OG5STHNvQWdZQlZMMHZnM0liNHVyc0ZKOHJINTFUbGNJNStDMTE5bERBMFIz?=
 =?utf-8?B?ZmFOR3R5TTB0eWRodkhOdGhFRTlCcm5tK0ZvUElJaTF3UXl0Nis2RlZyUlNy?=
 =?utf-8?B?UjJLQmxpMVdCa2M2bTRtZHREZHpQZGJFeG9CaU5HQnRSa1ptKzhEenZoQ1RP?=
 =?utf-8?Q?JhiFaHXZphXqlD+3h8Ct/Us=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c97c8f9f-fb79-40f8-cf52-08ddca69deef
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 04:23:42.7624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YawvnYa/b24GGHSBIu1U1UZxYS4NYL/z+DVdb+wJvf5bLPRtoF4ejpb+wkA6HQHQkjtFu8Qp14ZfsCqWpmI1LEwRhVyI2xPAzR6W+9fJUItx5OT+VPyCrPpZOGv1zNzq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6190
X-Proofpoint-GUID: xdV0KZrLJDzL4SV47jbFQTs_QvKlx5EJ
X-Authority-Analysis: v=2.4 cv=C5jpyRP+ c=1 sm=1 tr=0 ts=6881b553 cx=c_pps
 a=6akm9z1k8Uad+K0hPNbjZw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=PYnjg3YJAAAA:8 a=20KFwNOVAAAA:8 a=iGHA9ds3AAAA:8
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=fKJBslGpfQU9iv7fgBwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDAyNCBTYWx0ZWRfX1f4kAOmU63w1
 mzYuRMkBgoYRsXNxWQ2lfZd6XGKE4I6gifOXmi6dyUlQHJeC6kcp9F9Sbs4q30/jFfIaAn+rAPW
 Se2mEXiex0aA4OxLxWfwnUFbej8vgv1mEOCdDuThABhveRS8Q+4xIKcyIMopudCiZiPp8ZWap7V
 GFbRBzRtoZTluhhGh0TCc44L/Kn6erw9AdL8NGsTWlSJBot9HNxdCPztVI71pmNoDYcwzmh8r5y
 PRja2WhB2B0IV9ZgAURRcgDT1ufgqTjnim8eHmUygNDCwaJCAknRxQ2GVDIJzDTXdS2ShJxm/Dq
 EAqx2B8UFtId8N67ZcZ1HcDESYOPf44Efb/0j2VKyoVSroYkGSF7cney1MKDwng9X6yJv39Sbmv
 et11vX0U
X-Proofpoint-ORIG-GUID: MHsG2bQHDbtphmweJ2y_Gl6yK_dBt_II
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507240002
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 56O4Ja4F348614
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 04:23:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220818


On 23-07-2025 21:27, Marko, Peter wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Richard Purdie via
>> lists.openembedded.org
>> Sent: Wednesday, July 23, 2025 17:35
>> To: deepesh.varatharajan@windriver.com; openembedded-
>> core@lists.openembedded.org
>> Cc: Sundeep.Kokkonda@windriver.com
>> Subject: Re: [OE-core] [PATCH] rust: set CVE_STATUS for CVE-2025-5791
>>
>> On Wed, 2025-07-23 at 03:49 -0700, Varatharajan, Deepesh via
>> lists.openembedded.org wrote:
>>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>>
>>> As per NVD, this CVE only affects users crate
>>> https://nvd.nist.gov/vuln/detail/CVE-2025-5791
>>>
>>> The CVE-2025-5791 affects the users crate, which is not used
>>> in Poky build. Instead, we rely on the sysinfo crate, which
>>> provides similar functionality. As confirmed in Red Hat Bugzilla
>>> https://bugzilla.redhat.com/show_bug.cgi?id=3D2370001#c0
>>>
>>> The upstream Rust also does not depend on the vulnerable crate
>>> instead they also dependent on sysinfo crate. Therefore,
>>> this CVE is not applicable to our poky sources.
>>>
>>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.c=
om>
>>> ---
>>>   meta/recipes-devtools/rust/rust-source.inc | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipe=
s-
>> devtools/rust/rust-source.inc
>>> index ed15d9c763..7e100b73d9 100644
>>> --- a/meta/recipes-devtools/rust/rust-source.inc
>>> +++ b/meta/recipes-devtools/rust/rust-source.inc
>>> @@ -20,3 +20,4 @@ UPSTREAM_CHECK_REGEX =3D "rustc-
>> (?P<pver>\d+(\.\d+)+)-src"
>>>   CVE_STATUS[CVE-2024-24576] =3D "not-applicable-platform: Issue only=
 applies
>> on Windows"
>>>   CVE_STATUS[CVE-2024-43402] =3D "not-applicable-platform: Issue only=
 applies
>> on Windows"
>>> +CVE_STATUS[CVE-2025-5791]=C2=A0 =3D "not-applicable: Issue affects o=
nly users
>> crate (We are not using users crate instead we use sysinfo crate)"
>>
>> This threw a lot of warnings on the autobuilder, e.g.:
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/209=
8
> Correct would probably be "cpe-incorrect" for this case.
> However since cpes for this CVE do not include rust, this would also be=
 wrong.
> https://github.com/CVEProject/cvelistV5/blob/main/cves/2025/5xxx/CVE-20=
25-5791.json
> So setting CVE_STATUS for this CVE does not make sense.
>
> Peter
Sure Peter, thanks for the feedback . Will ignore this CVE.

Regards,
Deepesh
>> Cheers,
>>
>> Richard

