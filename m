Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B85C02198
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 15:01:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.21390.1739890908029823648
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 07:01:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=41443d2353=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51IDwcEO011399
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 15:01:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44thw9353n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 15:01:46 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51IF1krQ008972;
	Tue, 18 Feb 2025 15:01:46 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44thw9353m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 15:01:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9swincVqUgfeuw3HxBxCpdPlxHz6fzjh1AVOvz4gVH/4SnhurqjE3hVtp2UzrcbULCRi1hmKPTvJM/lesZ59XmvYh3SUGss1L6X4Hz/pbWW6dnmxPp/QUmIgUjQmj681EKteGuu4EdSAgBKREoI8AsYCtlAb2AR35p8s9TWpcRVzB+SQ6tLPBm5ddXZhi9aU/yKzhR1k6qN3rsHaTFeDeiwTO19+1CbpY+uKqr+JmxUHCezfcYkywUFWrHaFo/mMZu9tCoUPYKwAzhz2F1x38muaD+kMZyS7V/vMrJbvPCmKKEXL/yEpFIxF01MnpSi0oox0k4kql/ErgXkcUhKRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhsLR10lU3jOZUER1KvPvkdst8g+IetlM1N8YnmGm64=;
 b=BJHgDrO/+q44zpgiFsYKOM+exUL7+h78HNtHoBHVsySyFiGrwDiSKxpDbR0ugfA1xOWmSTbsY9p2LpJCAzuRr7zK4AW8xYb38NAsc6EG+KRVWnfzXFVDEvhXzyuOHEpQZdRU7f3QwOzLWVQ5W/F3GqOYB64ktFtJ6mFdduHF9NdBCPrPdhfII8l5IlDrJiKpGnWoTkftysx1bnopWBHF/B/RIDpVPzTYc+jBLSY8sqNJlwQagu06n8LGFRrekhzTQu9F9Wjg0w3x1HTbGLQQEqlgekGXgvQmnIoAFLw+M+3fpYfIT01cwHxC4ICWn9JMsXwuK91MfVyemQitT00H4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by IA1PR11MB8149.namprd11.prod.outlook.com (2603:10b6:208:447::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 15:01:43 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%6]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 15:01:42 +0000
Message-ID: <8feca45e-7639-461e-8cf6-2d23f41e70fd@windriver.com>
Date: Tue, 18 Feb 2025 20:31:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/3] rust: Upgrade 1.81.0->1.82.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
        Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20250218133352.2360384-1-Deepesh.Varatharajan@windriver.com>
 <CANNYZj_BrGJn5nkQd5CuBwwd3Hga531f6XLdc4esO8=GQemtAQ@mail.gmail.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <CANNYZj_BrGJn5nkQd5CuBwwd3Hga531f6XLdc4esO8=GQemtAQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR11CA0034.namprd11.prod.outlook.com
 (2603:10b6:5:190::47) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|IA1PR11MB8149:EE_
X-MS-Office365-Filtering-Correlation-Id: 475a1564-8a44-490f-79c6-08dd502d277c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N2FDY3IzemZuMnRQMHl1eHk1NEJldGZnN2UrN25odDBLek9HTnRBWUNFQXJn?=
 =?utf-8?B?Qnc2QkkyaERmazMrYXN3aVZiU0huQm05elNmd3Y0WERWZ3BTYnBrb0lESUFt?=
 =?utf-8?B?cWt1Nll6c0RUbzgwNjhkRVlsWTV1Zzc0VE85eHNuVGFhamhybmRRMXBtbEZp?=
 =?utf-8?B?SDFhZ0p6dmNyQnphN1Foc2xCMmloOUd5aXVSNHZqYWNtWUlJakJUbVNyYXhv?=
 =?utf-8?B?UDJxdThiazJncExreGlpUnREaDJQNFpFTWxPVlU3a2Q4MlV3SmFiVU1keUxS?=
 =?utf-8?B?YjVyQUtjdkVzTE9nc2tpRFRtdnMzTWxRbFlMSUpONS9KaDlYVzFyeWdCWHZO?=
 =?utf-8?B?dEZZaE9xVHk0dGlIbitjY0Q3ckFRdHVlNnVSc1Z5cTdrblZINUJ0c3BVZ2RV?=
 =?utf-8?B?d1EreXJwQTZBTHpSYXhoVm5ZSjV0bVB4T2hZcUZkWVEzY3IxYVJYUUNUYkc3?=
 =?utf-8?B?Yzd5MHRmaE40L3o0c1M2ZEdHeExQQUVEQiswOWx0VHVxOEMvcXZCclJlRFhl?=
 =?utf-8?B?VzR0SXpMb01PNW03ejQ5WHpHWS85bDhQaWducE9KdWJQYzFuWlhvVHIxQi9E?=
 =?utf-8?B?cW40MzdNSklPNzVJNXJXU1ZQcTBuSkRIUUtDWlQ5REZtSnhyakY1dGdhem9a?=
 =?utf-8?B?YVNtVzl0em9qeWRXK1lSWVZvdW1EcVp6dTVIYnFxOHFZMEVaaWV0ZlQ2L0JV?=
 =?utf-8?B?c1NmbFJqc3B1V1M4aG9pdDlnS2czQ1crZXFhM0ZONkZseEFXMytRVVBmL1lC?=
 =?utf-8?B?M1Z2VURFdkk2R3U1WGl0M0k1bDV0TDlWMGIzUENsa2JsZ1dLeFpLRU9FMU5w?=
 =?utf-8?B?R05zWDBNb1U2UGhEcW44WkxDd0Zua2VZcE5ZWVNCRWNpWmZvcEpMZ0FmN2pX?=
 =?utf-8?B?YVBDcU1NdjZKdmRuditVZ2xZNG1RNVFRbVJkTnFmc0FtSmcwTXc4a3hDeVhT?=
 =?utf-8?B?Y3laUXhVYmR2V3lVSGNRQkM4czllWmFRdTlJK0dla2ZDc2huRk4ycHJvS2I5?=
 =?utf-8?B?UzJkcEtTbUpBN0EvejM1Sm9PbXFiK0orOFBOMElrYUk4ZUFlQkdSeGlwMmJ0?=
 =?utf-8?B?NW9jQk1BeFd0QUN0elljZTIwb3lZcFNuTEFBTFVnbDAzeWN2RFlUNzM3WVVi?=
 =?utf-8?B?RTdYWnpncU1tQXlwUTZKeU9RNUd0a1ZKVklkTUFiRlVVQ0p0NXJONnBnYm5h?=
 =?utf-8?B?Zm1vTUJiRmErT05TTWtnbHRSdU1MYStENDVsUnQvakNUL0FVK0xrUzFnZmRW?=
 =?utf-8?B?anR3Q0hvQmFJUVRSS1Q3cEFXanJKdUVpTlhicnM3Z2VXazZtdzJKREVqZEVv?=
 =?utf-8?B?MDNMZHBieGYvL0tFd0ZNM1Vmcytna3hpamJScEc2Z1pWQW9JUEhBMTZnUXpJ?=
 =?utf-8?B?YzJMUGtLS25mdDZMQVZNUXpXK0tCNU1vWjZlYnR5TnNZeWV5djhMaHFySVlU?=
 =?utf-8?B?Nzl3UFY1UFY2bDBJVU5TeGFYM1VUbkNkVGE0WEp6UVBKbXdncWJMc2hJRGFj?=
 =?utf-8?B?Umt6ZlRlMVlLelpFdEYyQlA4Y253SVJpbVdXZyttakU2UEIyUGlKdUNZandv?=
 =?utf-8?B?UENadjVYRWhBNUhoeFlCc3YxTXJobkhuSE4vQ0UzdmVycFN1Q1VXbnl4ajBl?=
 =?utf-8?B?VmdrY3BZYlhrNmRCRzRvcDVRZXZlZ2kzTmRrcVJGbDF1WDBZaksyT0xFUWR1?=
 =?utf-8?B?a3UwS3BMRWcxTHN2SExTc0h3SG9vNFpQbFFQdjBBa2lYZkFYdXhiamU0eVpi?=
 =?utf-8?B?cC9kb2lwbVk0OVlxaFRhQXJid21FZzVwK1BVR1g4TXZoeWRxVXJPUktBc2V3?=
 =?utf-8?B?cTBZVnZGdEJIUk5tVnF1UT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VVZycmE3emRydUM0VXVPNlRkSytXcGljRGhlcXhEOGREOGtLWWV6LzlMREIy?=
 =?utf-8?B?MUpoaUorenJZZCs0aDl1ZkNUaWFZbDZPLzBIZnYxZ3NUVkV6MVhOUjlzOEQ4?=
 =?utf-8?B?R0djSmgxL1JBV0sralVrcHVOemJjOFhhSkVhZjN5S0hHeHRFSlloUmRSSm1m?=
 =?utf-8?B?eExNRzlMVWtLc2hVazFCaDJoWW5wc2p2YmVrOXBjOHNSdGg2TzNBL0hhRG9u?=
 =?utf-8?B?ZTgrRWNwK3JBUks2OU02SXFuUXRJWjhtSEt3ck8zUDBnRXljN3BZWSs4SHps?=
 =?utf-8?B?RENFVnhzQy8rU2tIeFpCd1d1MXV0Vy95b0NrWnFRdXM0NDVHNUI1dVdSYlFR?=
 =?utf-8?B?aWtteWlwL2VuMXREWmJ4NVl2cXRkYlUrVThKR2pZdnpqN0MvK0dJd0R2NEp1?=
 =?utf-8?B?TDZINkxlbjBaczhFZHl4ZkVYTGVoa2V1RnRlVTVHUlgralE2VStVNTU0cXhR?=
 =?utf-8?B?TjY1RzZFSHZJNlZNL1N4K0UvMEg2ZHh3M3V2UjRBY2ppaFo4a0I4WnJNWHNY?=
 =?utf-8?B?OWRKemZZb1ByMjB1Q0pnQVFzOE53aDUrRDVEUUhEV3BjMGM0RE95T3ZQb0Vy?=
 =?utf-8?B?ZWhLc2NCLzk5TzRrdHZTbmtoczQ4cWxnR3NJWkp3OG9XdHpaN2dGZFQyWW1E?=
 =?utf-8?B?ak9kQzkrQ241NkJKTjM4SzhuQlZhRjRIY25CaitVVnRQU0plNFp4WWRVQnlj?=
 =?utf-8?B?QlQvanZvVFpDMWtodTlBN3FNUjhOYWtUVDZtTXhEMUZNLzVDVUJWdVphN0ty?=
 =?utf-8?B?a09GU1htVHQ3dmdXZW1kNllRRjhLTlVPMlMzRktEZ2g4cGVZaEZSV2tncVBT?=
 =?utf-8?B?WVJVTkprZktPM3JMTEszRi95UVJyUHlzcytDOXVJUEU1M3hCMjZlV2ZVRTJY?=
 =?utf-8?B?U0lyUU1wL0s5eG1KRE1wVS9kY2Z2cHJrcGdCZ21ySHVGSFl4WFpaNVBhVkVC?=
 =?utf-8?B?ZVNaT3hGWnV3azl1eHJBTlVPNTYxNGI2VTV2VzJWTXlCRmtjQ1d0R0NsWldj?=
 =?utf-8?B?VnI2ZmRtcnE1UUl2cWZhMWplWHB2ZlRNQ0hrenl1TzlQTWRuN3Erb2hTTWY2?=
 =?utf-8?B?Mk9oRHZxRCsvTy9hNFFPWkFzUFBUVklKcXprSWI5eVRFMTZEY2xEL3N0Tyth?=
 =?utf-8?B?cEtOT0JRTE9EY3dGbDcwb0J1eVZjNWlWdVNoODNLN0NBMnVnOWNFM05GWHFQ?=
 =?utf-8?B?Nm8xMHYxVjBIUHhRMHhHYUN6Mm83K1BjRGpFSThtNDV0RERnaEJ6OHBnVFNh?=
 =?utf-8?B?VzFGcFBzZE9qS2psUnlyN1JhZzFkMFg0SkR1a2psSFJmOFdTeHAxM3ZDMXh2?=
 =?utf-8?B?R2Q0SHkxY2g3NVF0UjZOZE1qaE5zMDFveXJaR01OVW5vNDhWWGZSN21jMzRn?=
 =?utf-8?B?Kzc4N0VhZUFaZjN0YzhyOGgvcmVYSEtYelZsUWNVTU5lZm42TWttYjNjSkNQ?=
 =?utf-8?B?MXNrTlMwM25vUC9TMndqZnM3V0llSEJpbVhXYkR4RUZvaDVJR0dpRm5XSHFH?=
 =?utf-8?B?M0hpU2FvUStmaHR4bXFSTnIzRHdCYmdYM3FXZnJBK0F2VkJTeko4WC9zZzdz?=
 =?utf-8?B?U0tlOG1iSGdUQUNqbjgxTnBHVE5QUFBYS0tRbkljT2pJalQ0ZWg1WkRpbHFn?=
 =?utf-8?B?MEJEZVpGdUlBempOV0RTZDNzTWYybzNxdTB1YUZyRDIybnpOMHQrZ0NYTTNS?=
 =?utf-8?B?TncwQ0hmK3lpZE1kSWMvRUlCZjUzOE44T0JCL2lRd3QyNDdWS3p1UWJwdUww?=
 =?utf-8?B?ampvTXVoUU9VaW45OHBYb2lqb2MxRm84N0VLV3kvVGpPSkJQcVhRK3hFeGE1?=
 =?utf-8?B?TFJMUVJDdUxKaW5memhHMUl1TGFHK3Q5WjBqZjBWN2g0eHNkVXU1V01YRjR5?=
 =?utf-8?B?c0dwVWdOY1MzYzZxYlYzWXYxK3A3ZGVIc25HcHpqdUN1aHRJNTZPc00ySzla?=
 =?utf-8?B?T0N2eGE4YW9FK1F2OUkzQy8yS0trR1JvOG5VWnBocXlyayttZGFIanNQbUFs?=
 =?utf-8?B?LzFxZWxQV0tKSjFwSHpteEdaUW1TU2pqODVHck85N09CY2Job0tubGZVYjh5?=
 =?utf-8?B?b1UzREtwS1gyYStHR0h2ck5jMHc1OW1ZdHZNR0padTV6WmdjSFBjRzVZNlhO?=
 =?utf-8?B?cW4za0Q3WHdkUTVPUVR4bkQ2aC9aMXB4RnZ4bFRqQXdFenROemxRMUdMQ0dj?=
 =?utf-8?Q?oKb8vBr4qKPZBXqbhLA04zc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 475a1564-8a44-490f-79c6-08dd502d277c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 15:01:42.4383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0r8iKFt4jTLwp3+15dbZMItLIwSHpX7XAKkB3mO9tU+7pFEOp0E3ai4UyfbaIQ3C5yii8pbUIWOcW5l2qe1rc4b/xG45KlrnNFGRO3MNLkv32Lx+J3+xqF4FVPmfttCN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8149
X-Authority-Analysis: v=2.4 cv=CZzy5Krl c=1 sm=1 tr=0 ts=67b4a0da cx=c_pps a=19NZlzvm9lyiwlsJLkNFGw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10
 a=ei4SEBeUAAAA:8 a=Q4-j1AaZAAAA:8 a=qhxIPH8sN_DzcxWlB0oA:9 a=QEXdDO2ut3YA:10 a=jKzLeVjVkCkA:10 a=8zIOOLb7Ym0NljyPXbuS:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: G9d3ETeeIMOtPiphWjK4GBt_BsFHqL9N
X-Proofpoint-ORIG-GUID: M0rbupLQpSmOupXPm7lpK4kQSWkUYh1A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_07,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502180111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 15:01:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211627


On 18-02-2025 19:14, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Tue, 18 Feb 2025 at 14:34, Varatharajan, Deepesh via
> lists.openembedded.org
> <deepesh.varatharajan=windriver.com@lists.openembedded.org> wrote:
>> Rust stable version updated to 1.82.0.
>> https://blog.rust-lang.org/2024/10/17/Rust-1.82.0.html
> Thanks. While it's good to have working recipes for each major rust
> release, we're kind of falling behind upstream. Should we just jump
> directly to latest rust?
>
>> --- a/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate-hashmap.patch
>> +++ b/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate-hashmap.patch
>> @@ -1,4 +1,4 @@
>> -rust: reproducibility issue fix with v1.81
>> +rust: reproducibility issue fix with v1.82
>>
>>   A few crates are using the updated version of the 'cc' crate and this is causing the generated object file names containing a unique hashmap id.
>>   By the following changes same hash values will be genarted even for diffrent build paths.
>> @@ -65,6 +65,92 @@ index fe919a5239..2b1f442019 100644
>>                })?
>>                .to_string_lossy();
>>
>> ++        // Function to find the position of the first occurrence of the target substring
>> ++        fn find_target_position(s: &str, targets: &[&str]) -> Option<usize> {
>> ++            let mut pos = None;
>> ++            for target in targets {
>> ++                if let Some(index) = s.rfind(target) {
>> ++                    //If a target is found and pos is None, set it
>> ++                        if pos.is_none() || index < pos.unwrap() {
>> ++                            pos = Some(index);
>> ++                        }
>> ++                }
>> ++            }
>> ++            pos
>> ++        }
>> ++
>> ++        let filtered_dirname = if let Some(pos) = find_target_position(&dirname, &target_substring) {
>> ++            dirname[pos..].to_string()  //Keep everything from the target substring onwards
>> ++        }  else {
>> ++            dirname.to_string()  //If target substring is not found, keep the original dirname
>> ++        };
>> +         // Hash the dirname. This should prevent conflicts if we have multiple
>> +         // object files with the same filename in different subfolders.
>> +         let mut hasher = hash_map::DefaultHasher::new();
>> +-        hasher.write(dirname.to_string().as_bytes());
>> ++        hasher.write(filtered_dirname.as_bytes());
>> +         let obj = dst
>> +             .join(format!("{:016x}-{}", hasher.finish(), basename))
>> +             .with_extension("o");
> repro-issue-fix-with-cc-crate-hashmap.patch header/commit message
> should be updated to explain what this new code (added to the patch)
> is for. There's presumably a problem with dirnames, what the code is
> doing to address it?
>
> Alex

Hi Alex,

There are few new CC crate versions, so the patch is adapted for newer 
versions.

Previously, the hashes were generated for the absolute paths, which 
causes different hashes to generate and so the reproducible builds are 
failed.
With this patch the hashes were generated for relative build paths, 
which makes the unique hashes to generate.

Regards,
Deepesh


