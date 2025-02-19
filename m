Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 665D7C021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 15:23:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.24800.1739978602150958527
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 07:23:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=41459c3b11=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JBOtLV026912
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 15:23:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00kh6rm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 15:23:21 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51JFNKCi024685;
	Wed, 19 Feb 2025 15:23:20 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00kh6rk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 15:23:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHb1Td9Q3I7HDFrnLnNn+Nu3jUBc6jS/SQCxMaMCWPpYacKpDQf5i6FktHZjtaoLY35OEBPBPDO8V0J4M3++D9Q6G9/oGvDgLQbiXaVXV2R5/V6PiXalLUqBuq31SoIY8J77zrHR2n6nmv5UHgqFkJfsuCqXt8WLP2fe3Be4wGCdlNCn8qNcj9svr1Udd+a+3nRvmmNwsPg4oyd+EFZCnbWJanT5tZsZrLv5vnZ4KHBir8JsJeEMddDMWi0zQIqhgSiVGr0bAY3gbDe9LuBOi1B9rrgnAF/9ZgQ/I6U8BDsp9EtfvbDfYK1jtbC6nJ4rfYDKnZAJwU6D1cSU78sQpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TXvbc1NaK4inolx2Ek82+Uw8Sr+OdBTT3o0OPQ9G29I=;
 b=WXaPpLnsLdB4ZdoGRzMBQkayyCWrcsrLh0emOPRaIabcFcVX9o4X8+xexwqccgAiwvcODb+26tdYNT1UDo41Hs8lRdoiwrMTzpSxTUDKmtYHTmYdImfvPzaU4rq8ubgRITKLFXnVOvqfJ0XsEN4TRxbLLmRMJ9MfE6AJo7ripco0p4Lqa5hq155yVhC2ERkQKN+ikfEdCur12oEX7tsKaEmnrVaMXcJR1yY5S3bQjMbOXMnYU3cKAHRM1GaJGbM+UHNTpPsMq4xkfQsuEuMbIRPLxsrlP8ED1UF5BMNYIPQOfnj9t7d8vEhDs/iaVprCbTgW/T51xe4SRzE/RGr0bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by IA1PR11MB6323.namprd11.prod.outlook.com (2603:10b6:208:389::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 15:23:11 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%6]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 15:23:11 +0000
Message-ID: <22c03520-88f0-4204-9a43-bc773762de1e@windriver.com>
Date: Wed, 19 Feb 2025 20:53:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 3/3] rust: Oe-selftest changes for rust v1.82.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20250218133352.2360384-1-Deepesh.Varatharajan@windriver.com>
 <20250218133352.2360384-3-Deepesh.Varatharajan@windriver.com>
 <98f01e8c3ca6b887c1731b561cadf4591f47b5fe.camel@linuxfoundation.org>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <98f01e8c3ca6b887c1731b561cadf4591f47b5fe.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BYAPR01CA0027.prod.exchangelabs.com (2603:10b6:a02:80::40)
 To SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|IA1PR11MB6323:EE_
X-MS-Office365-Filtering-Correlation-Id: 160de338-b825-4df9-8c55-08dd50f95276
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NFNXVUl3dUJaL2FvUlNaVEhuUnBoakprQ3FTaWZXZUtDbGVaT1BJSStOb0cy?=
 =?utf-8?B?M1JaOUxGQkVNVm5Ra1YvYlZkMGgzamdROXNvQS9jVnJKTXZqN3dnOU1waFBw?=
 =?utf-8?B?ZmJLeEUyM0pEMEQ0NWJqY2hIUlM4cGxmSHMrVDVYYTJOa25Wd2dDWjBlV2NE?=
 =?utf-8?B?L1pEczcrT0p6RFBpQXNDV1hvdjFMZGhlaVZQODRZdUxOakJNZjE5RnlwaWVx?=
 =?utf-8?B?SXFQcHR4dU1Ma0wvS3NQSmJUbjZYTjl0bFZ1cGhrdEFid2h2aFRiWXZ1RThq?=
 =?utf-8?B?VXpFNFFnaWYzTWxpWTdTNXpDcG1PeFhpbTJIZEN2QjVmbXVKOS95ejdKaEV2?=
 =?utf-8?B?enpPd3dVQlByM1VtTG1URVY2Y3lJcHJoUXN3T01iQ2c4dStKTENQbEY2VzJZ?=
 =?utf-8?B?TUJITTY2bGhBaUtrRlBFNXYvam9LMkFqNWRYcFRLdGhRSjBJMVI2ZFlBM2Ex?=
 =?utf-8?B?S1NBL3dKUlBXSVZBMkpsdm1CbEg3S09ZMmpWVXVPbVNVT1lwWkhlQUxlYVRE?=
 =?utf-8?B?YXZWbkl3YnRIYlBMYjUxRGdWRXFibFJQU3NpaE1aYlpwcXpwUU5zNXRUK0oz?=
 =?utf-8?B?akVTdW5MUHRyZWM3NTVrd1ZaaloyVnBuQ1U5RHBndGM0QjZpejFSZjFoZzBN?=
 =?utf-8?B?L3Z5MjRSQkdZMzkrVGlNaWdtN3VLdXNCNDI0THI4UVdkQVRrSVhyU01LNm8y?=
 =?utf-8?B?cjlFZ2l5NjRvVEZpalB2WXY4UU1JYWhrZ2sybXhOSWdtaU9vOFhDWG5mM1hC?=
 =?utf-8?B?VTF1Y1dkdzFwdWNFSktDNGNHVFZNQW13MGswZXBoSDIvTDc2RzZtcmxJanlF?=
 =?utf-8?B?bkpYMHlEeFpaUjZETWE4Zkt5TVMzSS9MQXczaXZjaWZ2TlR1OGtPWkNRZ0ZF?=
 =?utf-8?B?OGYvV3J4ekRHcjd0U3FRclpUdndZN3BWMUdWcTkzd2VJOXNrdHNjU3FsQ0lM?=
 =?utf-8?B?ZEFVbUtCNEhPMlYwRHZCZllNaHl3U09oODErZXltakYxQ2lRT0RsNXcreFl1?=
 =?utf-8?B?N0VTUGowa1lPZlJqcm1nNnNLRTlBazFRNVoxU245c1NBU1E2VTNwWGw3VmVn?=
 =?utf-8?B?TnQ1NTY1SEpXTFBxTCsreFp4U1A3V0FpemZTUzlFZUJxeTBJKy9lRXBESlVB?=
 =?utf-8?B?VjVSSzB6cDJxbDhGL2dobklJazFRcFNUNGxhS3FlbG9TZDNEamVYSHNBK1NG?=
 =?utf-8?B?cGpBdWNtWFhnOHdxTmh4U1R2bFJLUVgxdW9MemxFNWF4TjlHSG9uUkpoOWVP?=
 =?utf-8?B?SjQvNml5dVUveDkwcFJyakRKeEVYaHpOYWtIVmtpT2JCamFadWIvUnlCRU9i?=
 =?utf-8?B?WGMxM1Y1QXEvM1RoL2ZPUUZ5bTkyT2xhVGEyMkdQTFQzajVTZVpEbG5rQ1N6?=
 =?utf-8?B?MUVoU3E2cDl2bHdxT2xvQUZaUmN4V0cwK0V0MHZPY2NFY24wWjRwK0F2NytK?=
 =?utf-8?B?MGVFQUo5Nk5uRFVqaTc5UmJOSlhBZVZhbnJndVdTeFljeEx2cVNwNVdJaTRF?=
 =?utf-8?B?MjRwcThLVnkya09kNit3dHd5ejlQcFpOUmZlckhnY1gyYktRTjBBUzFxdmwz?=
 =?utf-8?B?MDRhaGFyckNGbUZpaDl1RGYzaUk0R29YcURzdkdvTkowUzhkVjlYSEtqUXNq?=
 =?utf-8?B?OTc5Z1Z6OVpJbUJRaEdGbStpKzRzNDlDa1hSMlplQXhYYVBrMVN2eXh3bllB?=
 =?utf-8?B?dWY4TElYZEtNSHFtOTdVUFdWOHdYT0g1Z3RYZEFZaGFWcHVMeHFCb1JhUmpD?=
 =?utf-8?B?UTQzUG1NLzh6SFRmY1g0bTQ5NndWYllBK0k2TmNJZ2RGSzBHY0c5MnN0MGJ2?=
 =?utf-8?B?eUY5U2N6M1JFVm91YUdwUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U2lIUHNSazRUQkd5SmdxWFhTWis1Yzl1WHNzYzZrVjJuWU1GWUVWY2F6Vlg1?=
 =?utf-8?B?amxnS1lrK2k0bVNDL1FNSzFpdXhPSnl3NWd0VDBVcVZ2SHREU2dHTFpqK0tK?=
 =?utf-8?B?TVBGU054aDd0bDJMbU0vZG84KzR2VEpGcityWHZYaTBLZ0pNQkx1dTdyTFk4?=
 =?utf-8?B?VTZWeUovQTd4YXYrNDUzdDlJNkd3UVIxWDV1ZlpuQ1NOVkNla0JEL05paXNi?=
 =?utf-8?B?aTRKRUhMNkVmbEMvSTNnZkd5dzBtMzF0enJMTDY2QzZTcEdNaytFQWZIQkVQ?=
 =?utf-8?B?azEzZmd3eHNpYVl0UkRrVStmMFdQbHU1MnpBZ2IyZWk4T1BuMTlqbUc4VmVr?=
 =?utf-8?B?M0xtOWl2dXVwOCtGVmk4RDE5THV2a3Y1SUtPMHdza29QaWJWdHMwVksrNDBz?=
 =?utf-8?B?UzNnOVVxL09ONDA5d0JMaGFuWHRpeUJGY0dtUkdPNkpiOEhJc0wrWnBCTXph?=
 =?utf-8?B?N1F0VEM4ZlRMYXhUZnlBVDJFcHF6YzN4SHZNM2FCM05VWGdySEpOeXREVHQ2?=
 =?utf-8?B?U0dYY1Q3MjdLMHIxdWcweVBTbU1DZ1Z6Q05WckMvdGw1ZDdvb1VTQWZ0WjBz?=
 =?utf-8?B?ZHhjdGxMM2lPeEJmMzEvcVdPY2hkSy9ZcHl6UW96dGpaU0Q5Mk9ZcHpwU2xk?=
 =?utf-8?B?Y1RvNkR6U3NpTXk1YWYwMVk1dWpaUDhkU1dRRmg1YTk3aEJRNUc3WldxVWdh?=
 =?utf-8?B?Q010VE1zWDlJUzZaaXBrTHMrMGNUYnVEcW1scGtJaklnOGpmMWdySkQ4cWpF?=
 =?utf-8?B?SDg2RjROYVdPbU93VURuOHU1N1ZXaTE4eDltNFZUMkdIM2hvRjUrUFpMSTRB?=
 =?utf-8?B?YUpNNENBQ1lrMXQwVHVLQkVXQ05VcGN4ZHF2a1BBOENOcGlMVncrZ3RWZEI5?=
 =?utf-8?B?MzdPbU5UYm9RVForTk9rRGlEa05wVFJEYnYydVd0MStGRWRzZ2JPOWxEK0Vn?=
 =?utf-8?B?MzhYU29CY3MzOVZaUnFuZ3lybkRWcHJtQ1hBZW4rVHdocUN1cVlDc2owM0xl?=
 =?utf-8?B?L2Y3MDNvcHlQTGFmRzJKaXZMWStjZnZjU0xVbHRtVDZZdXVVOTE3UUtRVTBX?=
 =?utf-8?B?YkNBdTJtekkxUmw3SlY0VHA2QkNJUEhQTWJoUDVxaUpvZm51dTU5YTlONEcw?=
 =?utf-8?B?OVNjbEJHR08vZFZFdW94WVRCd3h0RmNPMTU4SGZpbm9lUTNqclczZVpqcWZu?=
 =?utf-8?B?ZzJnVFJOb1paYmxib1F2K0VsNmdPcUNkT2NXb3lFRGczc0F5eU9iTWV3NXQ4?=
 =?utf-8?B?OHJTQkhLa25UZWo4aFhubEZkbmJpZ1liOEoycHpaOEFpMnlHbXhjaXZ2QU1I?=
 =?utf-8?B?cmpLREUrQmx3cnNpV1hrQ2hPZTMwQ1RaRE9BUCtiMGQ1YnNxeTNiVHF2cnRT?=
 =?utf-8?B?dysvQWZVc0ZxbTRiT2EyNG0xTEVmdkduOHUxVHRzRCtjU0dMTGNmWUxWVkNy?=
 =?utf-8?B?V0cwV3AzQjVPK28rMy9jNXNwWm1mRTRuYy8rRGdWNXFIUWlKYW4vczJVdW9l?=
 =?utf-8?B?SnNPQmNxTDltN2dhbldUVUthOEhXYVdkRGJLQkhLblRvWmpoWGpGeHZkVFg0?=
 =?utf-8?B?bmxjUnRGRm1sZncwZURkdXZtSmdWS000cE0zTnlpMHNCclFud1paVkxwRzB5?=
 =?utf-8?B?N3lXN1N6UUw3U2c0cW9KWXRYUHJqTmJSTTl4RVZXajlsNFB2K2owYUowOWFw?=
 =?utf-8?B?eXN2ZHEweDNRQzNUT2JUOVdPdnZkWUNrWGI0WCt4K08rdGFkVjJxZ1FBTy9M?=
 =?utf-8?B?aFlnN1hMazJMZklIMG1ONGlpZ3ZSUEhHdUhTeGJ4TzZOdU5jVHltVUhPWHRm?=
 =?utf-8?B?K29VaEgvVEJtZWVUZUVweGl1VmN1UjRnWFFlalNzRjRrcHppUElmK0NnRzhV?=
 =?utf-8?B?UEhucjBuaGlGT1FVQVFONEhtQ1VIcERqL2ZSZytDN0Q5VzBqKy94WnRqc0Uy?=
 =?utf-8?B?MzFRNUUwNURPRmQwUFpqdS9QUjJqelJSRTlndVhRR3RUL3lhYy8vTVIvSU4z?=
 =?utf-8?B?Qm1aL25GMWJFckwvRlNRMjBUVXhPSmVFMGo0ODZrQm5RN2doMmFxS1lzeGt4?=
 =?utf-8?B?MC94Qyt2WnRZbzV5UTBYazZ1TXphYU1UbzRqcXZBYTBmZFYwNjlMRkdGR3hI?=
 =?utf-8?B?d0VvaU0vQzFYZU1xazNYR1JpenlPRE5qeFhrZWI4STBnK0dqUDBnZXNtUGFJ?=
 =?utf-8?Q?xV/nisOltyBnF5KCHykp59Q=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 160de338-b825-4df9-8c55-08dd50f95276
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 15:23:11.7943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ar96vgNBSwO/LoLcpb7Vy9ew20NSv0ga5zAtbW7IAzv0aJtB2mNw3XnqLpDV2GFIOhEciTcfOQ68jdQUwoeUiRjuG3AtvPyXwI4r9MiSUo2dqBntfyCDZIheyyBg3sgA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6323
X-Proofpoint-GUID: pUGe6lJive6hqEN9IrkLETMtxwTajuDX
X-Proofpoint-ORIG-GUID: OFz1bdHio0K3wz5U00mDZylYNGtl7h0t
X-Authority-Analysis: v=2.4 cv=BvtnwZX5 c=1 sm=1 tr=0 ts=67b5f769 cx=c_pps a=UtaLnOzkojfj4BVWksq/2g==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=-L8meh041w5VG7IZapAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_06,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502190121
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 51JBOtLV026912
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 15:23:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211716


On 19-02-2025 20:18, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Tue, 2025-02-18 at 05:33 -0800, Varatharajan, Deepesh via lists.open=
embedded.org wrote:
>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>
>> A few tests are getting failed with x86 arch.The unsupported/failing t=
ests
>> are added to the exclude list and ignore the failing unit tests.
>>
>> Upstream-Status: Pending
>>
>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.co=
m>
>> ---
>>   meta/lib/oeqa/selftest/cases/rust.py          |=C2=A0 1 +
>>   .../rust/files/rust-oe-selftest.patch         | 48 +++++++++++++++++=
++
>>   2 files changed, 49 insertions(+)
> We did see a single test failure in rust testing on the autobuilder:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/28/builds/1014
>
> Cheers,
>
> Richard
I've sent a V2 with necessary changes.

Regards,
Deepesh

