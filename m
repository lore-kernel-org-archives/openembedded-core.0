Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ACBFC021B3
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 04:32:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.82423.1740371518137711923
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Feb 2025 20:31:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=415024d1b4=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51O4VRj8014755
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Feb 2025 04:31:57 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44y5j89tha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Feb 2025 04:31:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uxFucLyETY/NmS6D6shhc21Hzlz3w34FWRtRB1p0BJqXY2mvQVJS4To+49rbpqRCP76INpUgQeRhNyNoSW5rrmos2t97hrJVlXsBuz1LE1oVd890NJgXUtBbVtfhUyPnOIxWnIcAQBh9j/REM23JGnpNmRqFnf1MhV/pnI4sTDHcfCwaNxYLNNktPUdPLYy9H6O/WN3XFP3zf5IAQr9kyc8CqTTSCj8mlOANDbr/pAbTufA46FrMjk+50uGo8L7mrju2JE2HxQQ9JV0xlQ/77/TdoK+axl/7ayWcRshr3kAMf1BUyy/D8SBxBQ572Mt0tdJfkySIJ7RgiOOn7UkIkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+HgDBpKEyaFUbUE11hMEOTvAPuUaMHxOUlxnL6w2RRc=;
 b=wDY2L7PknC0AHzNKorQi3VC9K2gDyk/4LmMvbMKiUsgufCENWkfsbw35xyG+nkQX3td0TiabLvkmOd9+hp4zfmNw8hXjQKBK6FMlVOFsIpZwU2MvOR6bHvLlhmSegaQmyYdoGdycfsaOmy7PamfOhYm8RlIuTDjV3JZmfmSeK2snm7Bql7cdzWKOJ3JpXY4+6V72YQBwIs4e0l8xPRdcNU4SyFjKP9BOYaF0THApHGKW2NPJQfWRQ2EPsDHzPb8ymqk6TAbQCrfuLRjtkivVZTQ/UhHkLO1/QoQhsL9R34KAM6h8qIExJpJjjXPUHbTzXjKzF8hzWWEvj7o17A8K4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by SA0PR11MB4574.namprd11.prod.outlook.com (2603:10b6:806:71::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Mon, 24 Feb
 2025 04:31:53 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%7]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 04:31:53 +0000
Message-ID: <c72dffa4-c5f5-47e6-9014-9f5c183611a7@windriver.com>
Date: Mon, 24 Feb 2025 12:31:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V3 2/3] gpgme: upgrade 1.24.1 -> 1.24.2
To: hongxu.jia@eng.windriver.com, openembedded-core@lists.openembedded.org
References: <1824EF6EE08FBAA1.4193@lists.openembedded.org>
 <1824F12E1A69E324.4193@lists.openembedded.org>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <1824F12E1A69E324.4193@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|SA0PR11MB4574:EE_
X-MS-Office365-Filtering-Correlation-Id: 97e79f35-9167-44cf-f2c8-08dd548c2a28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?b3VUN1lrYTdpZ1lQYkV5RnM4bHZubWMrRnpUYXpDczdZM2xOaCtveG9YVjJt?=
 =?utf-8?B?dW93TCtvK0VVUGpyZUVkQmtuUlBHTHdXYThoVW1JNEdRVmJCcTJqMTdzQ3Jz?=
 =?utf-8?B?RlpmM25RS2JNdzR5YmhKNUtJUUY0cE82TS80UlRaN01TMDdhN0xvbHRiVmpR?=
 =?utf-8?B?bUM0Q0hiUnB2MHlZNVZEL0szdlgvbTY0ZEdzbkgxNnFaTEpNSFJjUHREZW9H?=
 =?utf-8?B?eUcrd0FwZktUaEp0bTNMZms2TitFVEZKaUxGTmtraFlpaWdUM3pFTE1iekpa?=
 =?utf-8?B?Uk5ycENybkZhR3E3c0xMMzJBOFJoWUV4L0lvMlkybFpPM2p1RE9JdGZpVERw?=
 =?utf-8?B?Y0U5bXViUmFjQTgxNm1zT3ozL29hWDY1YnBoRE0zanpNSFNFeUVjQ0RBbDZq?=
 =?utf-8?B?TDZZdXMzcE9WN0d6a3g4WFM1MmFhWm9MdHdjVWxVY0JBOXZsVHI4WlMwS3My?=
 =?utf-8?B?ekV5OWNCSW5xcWlLaThnZ2hjWEpabGZEQTA4Tkt6RWpoSkRDbXlPUFJuTlls?=
 =?utf-8?B?QlVhUGtXdnNJaGthQ2ZkSTBDaE1MTk9OcGxJbnZxRVBRSTh0bTBrVFRRQjF3?=
 =?utf-8?B?SThvVVRaTjl1OGhVQldLWnIxeElXRlhESjNxall0SHV5aDJrOXNLOVZJR3dw?=
 =?utf-8?B?c1N3aFFwTGNDd3hqWWxkK2tSeG9lV1lRZ0lxdGdBb2sxM0RSY0tJbzY1Z2t5?=
 =?utf-8?B?Z21Kd1BHTllWd0tDZTB4bGZ0dlRObkdkQkszN2hIN3FOZHI0dFU3OWc1TDRZ?=
 =?utf-8?B?UzFOa2N4NkRONUtqeEdBSTVXVXJ6S2NaYjRqcnZLcVdtREFOeTRNU2N3eXVR?=
 =?utf-8?B?V0hQT1YxRENpRGp2ajYzbWlWRWF2SU4rQ0tiNUhXT2xTeEZIUEgrVjcvYTQw?=
 =?utf-8?B?NzlONnpJNEdCeEhwUGt0TG94S2pjWXJUV0NPMFk0cFpQZXNzZjErbkJVczF4?=
 =?utf-8?B?Nk9qd05VLzhEYXp2czZwTmx1SXl5RkhpR0hydy82ZzlNenpCSyswQ2cwbko0?=
 =?utf-8?B?S0FQN3duT25VUldPdFdnQnFmTGhXTlM1ZTZtU0J1b2R4MEtybjM2a2ZWUFpi?=
 =?utf-8?B?a29Bcmd5cDBiQktsWi92YkFmY3JvQVljbU93dWZrck9jdlB3Y1ViQ0J3SjFv?=
 =?utf-8?B?Q0Z4amFSZmRQOHJ1YUoxWFE1V2x3RU1DbVhCUUxwYjBXenN0ZFBIV1BRZjRT?=
 =?utf-8?B?M1lmMEIrS093MmM3cTd3REtJc3RVcXllMkNFa1NtbUxNZUdWcW9TTk5RYkFI?=
 =?utf-8?B?L0FndUN5cDJMZ2hQWFo3LytJdkhDcmFXTFdXazlVQk93NkdzbGJnRXV2RXlS?=
 =?utf-8?B?WFBzNGsyUng0S2cyeCtjNzRZdVRaQUw4MGtGMTJMd05lVSt5YU5qR0hueGRM?=
 =?utf-8?B?QjlXUlcvNVhMK2YxN0Z1cXdqSFg0T0hmODdJRHV5dUZrSVlPdlhWM3BkdGFB?=
 =?utf-8?B?SUpDaUZGVmRmdEpLSVFBYmxBbXNSb2VMTktHeTdEQ0o4eW5pNkNHczJkd0xT?=
 =?utf-8?B?Q1g3eGh0aVRTUVliR3c3MUVyODRtWndTQVl4RnpJeEl5UGdrYkdhWUJKN0o5?=
 =?utf-8?B?bHRNQzJId2FBajJoWjNKVGJVdm9BTjczV1Q0VzJYclgzaC9uakovRG80K3d5?=
 =?utf-8?B?K21JMDBIZHQ0eEZXY0dzRFZmQzJTR25hcHB3cTNVRVVnS0R1VW5zVFZMaW5N?=
 =?utf-8?B?SkVPVDNXSUprMWlnN0hqSWM1ckw4SnlNbko3WTF1WTVGbzRVVXA2blBkQ2Zx?=
 =?utf-8?B?elQ1YVN0aVZPZERGWXNnZkQwcTBEaklFdlhyd0hTYmhuTmtFQk1ueUZIVEpF?=
 =?utf-8?B?bDNxMXJVd0RHM2dDcnZ5QT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K2RLeUcyWGZBL0gyamVRTy8xbEQ3OFloeDBGN0Vjam45VmI2b003cHBMK2lG?=
 =?utf-8?B?NUVQcU1SUi9mczAyOERPOWhxN05SWDNtTlJTNnNDR1lIeGtWb3paUVc2ZElH?=
 =?utf-8?B?L0NQV29KOWtXdVQ0eGFDQUNpckRYaUxIcEZCc1VjOEdtcTBtdjFuT2czV1RN?=
 =?utf-8?B?eFR2dHZxL1duWUI0RWliNzVyRWxpNTg5bjN3K1hIYmZNekZVWEZVOTNLNTlF?=
 =?utf-8?B?d0NQT3p0d1hTWmVJZTYzK0VvbHhKalNYTG5WVU5UWDZGS28vYjJxQkpDS2ln?=
 =?utf-8?B?Vm8yZjVNVHArK1VyUGl4TXdna1hUUVk3K3hUbSs2OThSbWRFV3NISmdzYkJG?=
 =?utf-8?B?eUh4Y05YN2FWM3d4Zy9nTmt2dGlvVW55VFhnS1FSd0RXcnVIVmlUN1N2RzZQ?=
 =?utf-8?B?NWdvVVJBQTNENzR2a0ZtS3g1RTBRVjQvWjZXZHJCcVZPaytJL0hSdk1JQW9Z?=
 =?utf-8?B?dytONDJGQmtTL2FqUHlURjZrT0lXU1VoTG4vZkNITzVCK2NxZHBOTXZrMkZ0?=
 =?utf-8?B?aFdPZ3FIN2w0VHB5YUhEVmgyYy9oTk0ra0M3cWJEeFdFTldsU1htazRWcUc4?=
 =?utf-8?B?OWlWVnIvYTJyS2tVL1p6MUtiMlFieUt5U2hUNVkxMHZGY2NBVVlDdnB4dkpU?=
 =?utf-8?B?VENPdzR3N3FqZjQvN1paUU1FNGIvOVgyaG1telVXL2JIRTlmcWxRTzlvOUZK?=
 =?utf-8?B?M01kMHkrd1JoQXRBKzlFYlRHdUE3VjNIMW55cm5iRXRwcGNSU0N4Ry8yMERo?=
 =?utf-8?B?MzQzc0p3NjdZOFgyaGJiK3NkVytTT3FzZFdKZm9uekp2U1luanE2eWhYNkhi?=
 =?utf-8?B?ZU9hdjB3ZndENStvaSs3WjZxWFJMOGp1b0tyTmJ2MVVJRlVwM3l0SUVhMXdM?=
 =?utf-8?B?ZHY3OHNENHVlVytuQnF5V005TVcxR01JNlhscHhuaExkRHRXNmhXdXBnTVhY?=
 =?utf-8?B?cDduckFNVzlxQldYK0ZMSDliWmFnL3BJYlM3bnZNb2JhWUY4MWZvVjhVZ1p4?=
 =?utf-8?B?Wk9KS1U2Mi8yeTg1QTU5UkwrbWF1UjFJc3ArLzNQVzluU00zM2IxaXRuS0NT?=
 =?utf-8?B?cHdDNVFhMjBWSTZ3RzIrQXNTSWlrNnZiRTRMZGNWVkJoYy9jTmxmbVA0UjBw?=
 =?utf-8?B?c1JzMVV4VWR0dUVZUkg1NXhMWmFla203eGdCQ1RQT28yMlRnWG4yaTBVT1BQ?=
 =?utf-8?B?VzNJUy82OEpHRm9ZZXlOTUlReGJ6d05PbG15T0pSazVqVkxMaVVWcEkrT2JQ?=
 =?utf-8?B?Nnc4bytKeFpPeWdZZzA0MStidWpIL0dyZTNZc1AwV2k0QWt5YTlHU1Qrd21G?=
 =?utf-8?B?cFFMdk1PQzdFYnhUdmlaczhkSGRnWGJ0eEh0MTRjRDIwVkR1cXFvOGtvcVB1?=
 =?utf-8?B?RXV0WGdtMitpQXpVWGh1YTViUnh5NExvVjRtUXJUY25EeXFhblU0R1ZtemJR?=
 =?utf-8?B?ME1xS0JXMjV4bGZzbnBzU0c1cHhlYXdYejhZVnBSUzJIRmQ5eUJ6YStrZElV?=
 =?utf-8?B?dWhiRGdDanlRQlVxWndSVWt2eGVPamhxd0lsQlVWemhtVHN0bHZpVVdQeXha?=
 =?utf-8?B?d1gwaXJmZlAvOW01VzFwcnJDNWZJZ2tyZG9HOUJDZFlsRUt1Szk1eWhJQjRu?=
 =?utf-8?B?RFJ6dnJWc0c4WElvYUxyejdzTWJLQmhIQzNQS2R5S2VKZ2xENU9wSEVBcDlO?=
 =?utf-8?B?V3hPUnRTVExhUXgrQk9vQVJSTCtTTVBSZ0Ewd29tTnhXRjEvdkY3YU5zSDdU?=
 =?utf-8?B?MGVlcnJMelNkclVnQ2N0RGxMTVNOSXk4MVFReVZRV3R5WjFlUXJMMC9vd1ox?=
 =?utf-8?B?UUNzOVFlL0h3QkMvd04rcDdXOGsyZFN2N05ZcVdqbHNkdGl0VVR3VTRBNUZU?=
 =?utf-8?B?eTRGb3hqK1M4akxvcU9XYXA2VXVubUpzaE96eXJxY08zWDdVOFdrTlhMdmRB?=
 =?utf-8?B?ckpvL1FhcTVEZmdlZzQzUG4weDRFbGpqMXU4OXVvUkI4eXY5Y2VOTEhZUUxI?=
 =?utf-8?B?VmtIRUh4SWdOVmtqL043YjVJUitYWDhDOTdKY1VnOVpoUk5GK0RUMFdPYkRW?=
 =?utf-8?B?cnlyQ1RCOFpSUy94SXF1TlRFd0VFQjIwUkdXcU4zNzZYWUFZaTNxcmY4L2p0?=
 =?utf-8?B?R2NJTWxoQTNaQlJpdHRrZythSFR0NSs1azFEejBOWnJwOEhtVExNbVZDRVdZ?=
 =?utf-8?B?bWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97e79f35-9167-44cf-f2c8-08dd548c2a28
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 04:31:53.8847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8J2kYrewoEdjOW2EnsJSrwBe74EMw2aOD1pU9Psk969+H5AcvMK79DJMSFb6vu99G/gOLkv2kMOaaRqCJ8Bsk9+/mzmBnjvH9CgVAYOTL+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4574
X-Proofpoint-ORIG-GUID: jcX4LO4Bs7PPvgJHIN1cHpAHnbFnZTGl
X-Proofpoint-GUID: jcX4LO4Bs7PPvgJHIN1cHpAHnbFnZTGl
X-Authority-Analysis: v=2.4 cv=U+ZoDfru c=1 sm=1 tr=0 ts=67bbf63d cx=c_pps a=ybfeQeV9t1qutTZukg5VSg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=GwUem0DFAAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=x3a21CTjUQ7RHfMS9WsA:9 a=Ohuo-sdro4PwUcRb:21 a=QEXdDO2ut3YA:10 a=r0dl5i_q2XGqDZkti5dn:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502240030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Feb 2025 04:32:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211836

Ping

//Hongxu

On 2/17/25 16:22, hongxu via lists.openembedded.org wrote:
> Noteworthy changes in version 1.24.2 (2025-02-10)
> -------------------------------------------------
>
>    Take care: This version is from a legacy branch of gpgme created
>    just before we split out the C++, Qt, and Python bindings to
>    separate repositories and bumped the version number up to 2.0.
>
>   * Fix regression for RSA in gpgme_pubkey_algo_string.  [T7508]
>
>   * Prevent failing tests after 2027-05-15.  [T7471]
>
>   [c=C44/A33/R2 cpp=C27/A21/R2 qt=C21/A6/R2]
>
>   Release-info: https://dev.gnupg.org/T7524
>
> See NEWS in https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-1.24.2.tar.bz2 for details
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   ...vert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch | 2 +-
>   .../gpgme/0001-autogen.sh-remove-unknown-in-version.patch   | 2 +-
>   meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch       | 6 +++---
>   .../0001-posix-io.c-Use-off_t-instead-of-off64_t.patch      | 2 +-
>   .../gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch  | 2 +-
>   ...gme-lang-python-gpg-error-config-should-not-be-use.patch | 4 ++--
>   .../gpgme/gpgme/0003-Correctly-install-python-modules.patch | 4 ++--
>   ...gme-config-skip-all-lib-or-usr-lib-directories-in-.patch | 2 +-
>   .../gpgme/gpgme/0006-fix-build-path-issue.patch             | 4 ++--
>   .../gpgme/{gpgme_1.24.1.bb => gpgme_1.24.2.bb}              | 2 +-
>   10 files changed, 15 insertions(+), 15 deletions(-)
>   rename meta/recipes-support/gpgme/{gpgme_1.24.1.bb => gpgme_1.24.2.bb} (97%)
>
> diff --git a/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch b/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
> index e6e86dfd77..2a906a6c73 100644
> --- a/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
> +++ b/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
> @@ -1,4 +1,4 @@
> -From b12b01239909b6fb41adc64d3c0ed32795554369 Mon Sep 17 00:00:00 2001
> +From 95d0bae453b2b5a7d25b92d99565d27407fffa1b Mon Sep 17 00:00:00 2001
>   From: Hongxu Jia <hongxu.jia@windriver.com>
>   Date: Fri, 10 May 2019 14:18:04 +0800
>   Subject: [PATCH] Revert "build: Make gpgme.m4 use gpgrt-config with *.pc."
> diff --git a/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch b/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
> index af97f11430..890909dd5e 100644
> --- a/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
> +++ b/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
> @@ -1,4 +1,4 @@
> -From 1d0fa519ef017aef4821af49c59bad119e7f0d66 Mon Sep 17 00:00:00 2001
> +From 0bb7fddb6a768bbc46695de4c6e0256a3580ccbb Mon Sep 17 00:00:00 2001
>   From: Hongxu Jia <hongxu.jia@windriver.com>
>   Date: Tue, 26 Nov 2024 23:23:42 -0800
>   Subject: [PATCH] autogen.sh: remove '-unknown' in version
> diff --git a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
> index 59f98103d4..9d0b4b282b 100644
> --- a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
> +++ b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
> @@ -1,4 +1,4 @@
> -From 108461f6c50b57ba73970dc977e7d4e9a02624df Mon Sep 17 00:00:00 2001
> +From 447fd26a43f40ccb071cd19198ee43fdfce87e3a Mon Sep 17 00:00:00 2001
>   From: Hongxu Jia <hongxu.jia@windriver.com>
>   Date: Tue, 26 Nov 2024 23:04:52 -0800
>   Subject: [PATCH] pkgconfig
> @@ -27,10 +27,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>    create mode 100644 src/gpgme-pthread.pc.in
>   
>   diff --git a/configure.ac b/configure.ac
> -index fe02bdf..6f33020 100644
> +index c34f700..4eddc3d 100644
>   --- a/configure.ac
>   +++ b/configure.ac
> -@@ -1179,6 +1179,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
> +@@ -1176,6 +1176,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
>                    src/gpgme-glib.pc
>                    src/gpgme.h)
>    AC_CONFIG_FILES(src/gpgme-config, chmod +x src/gpgme-config)
> diff --git a/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch b/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch
> index 9845b02969..932fb9c962 100644
> --- a/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch
> +++ b/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch
> @@ -1,4 +1,4 @@
> -From 13b955f66615caf34d19e86d97bcfe841d60d58c Mon Sep 17 00:00:00 2001
> +From 417036051c84b02fe43f162ee378278a44636451 Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Thu, 15 Dec 2022 08:44:13 -0800
>   Subject: [PATCH] posix-io.c: Use off_t instead of off64_t
> diff --git a/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch b/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
> index f174e24ebc..ed2edabd63 100644
> --- a/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
> +++ b/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
> @@ -1,4 +1,4 @@
> -From 2592a1d97c66f8bff4bae095b14cb774de3e80c9 Mon Sep 17 00:00:00 2001
> +From aaed03b76505b1feaeeb5a4a3c6bdcc7dd089f01 Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Thu, 15 Jul 2021 12:33:13 -0700
>   Subject: [PATCH] use closefrom() on linux and glibc 2.34+
> diff --git a/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch b/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch
> index 373660be94..3a1837e857 100644
> --- a/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch
> +++ b/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch
> @@ -1,4 +1,4 @@
> -From a956d17d2aa7fea53bab97715a8f98858e9b4a5c Mon Sep 17 00:00:00 2001
> +From 145adf290571b7dd47b7fca57b11349af0b94e74 Mon Sep 17 00:00:00 2001
>   From: Hongxu Jia <hongxu.jia@windriver.com>
>   Date: Fri, 10 May 2019 14:30:36 +0800
>   Subject: [PATCH] gpgme/lang/python: gpg-error-config should not be used
> @@ -19,7 +19,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>    1 file changed, 1 insertion(+), 2 deletions(-)
>   
>   diff --git a/lang/python/setup.py.in b/lang/python/setup.py.in
> -index d6f537e..695c02e 100755
> +index 1ddfbe7..d2fa4f0 100755
>   --- a/lang/python/setup.py.in
>   +++ b/lang/python/setup.py.in
>   @@ -173,9 +173,8 @@ class BuildExtFirstHack(build):
> diff --git a/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch b/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch
> index 004e587518..7b2831ba4f 100644
> --- a/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch
> +++ b/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch
> @@ -1,4 +1,4 @@
> -From 548d84c703a747c41a02e1d0ff6ad4c193a34a5c Mon Sep 17 00:00:00 2001
> +From d8e884d1fa8c35ce68e94a0668548580cf5ba2d3 Mon Sep 17 00:00:00 2001
>   From: Hongxu Jia <hongxu.jia@windriver.com>
>   Date: Tue, 30 Jan 2018 15:28:49 +0800
>   Subject: [PATCH] Correctly install python modules
> @@ -17,7 +17,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>    1 file changed, 1 insertion(+)
>   
>   diff --git a/lang/python/Makefile.am b/lang/python/Makefile.am
> -index a6fd639..136e979 100644
> +index 1aa330f..d1d5c63 100644
>   --- a/lang/python/Makefile.am
>   +++ b/lang/python/Makefile.am
>   @@ -97,6 +97,7 @@ install-exec-local:
> diff --git a/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch b/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
> index 120cb64b98..c021e48be9 100644
> --- a/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
> +++ b/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
> @@ -1,4 +1,4 @@
> -From 59b2e28b34f332d12935af41dbe3140f5842e8d1 Mon Sep 17 00:00:00 2001
> +From 9ea685f1b898ee703b85b705c35b9cbd77cca17f Mon Sep 17 00:00:00 2001
>   From: Alexander Kanavin <alex.kanavin@gmail.com>
>   Date: Thu, 13 Apr 2017 16:40:27 +0300
>   Subject: [PATCH] gpgme-config: skip all /lib* or /usr/lib* directories in
> diff --git a/meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch b/meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch
> index 00449e3259..d64168b4fd 100644
> --- a/meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch
> +++ b/meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch
> @@ -1,4 +1,4 @@
> -From 89a53d8d025fef4626006219f0f686982e215d97 Mon Sep 17 00:00:00 2001
> +From f9f82874048c5eec08e815ff871462184b6d7d6a Mon Sep 17 00:00:00 2001
>   From: Hongxu Jia <hongxu.jia@windriver.com>
>   Date: Wed, 31 Jan 2018 11:01:09 +0800
>   Subject: [PATCH] fix build path issue
> @@ -17,7 +17,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>    1 file changed, 3 insertions(+), 2 deletions(-)
>   
>   diff --git a/lang/python/Makefile.am b/lang/python/Makefile.am
> -index 136e979..1495982 100644
> +index d1d5c63..148e1b9 100644
>   --- a/lang/python/Makefile.am
>   +++ b/lang/python/Makefile.am
>   @@ -96,8 +96,9 @@ install-exec-local:
> diff --git a/meta/recipes-support/gpgme/gpgme_1.24.1.bb b/meta/recipes-support/gpgme/gpgme_1.24.2.bb
> similarity index 97%
> rename from meta/recipes-support/gpgme/gpgme_1.24.1.bb
> rename to meta/recipes-support/gpgme/gpgme_1.24.2.bb
> index 86ba08c464..bc661429e7 100644
> --- a/meta/recipes-support/gpgme/gpgme_1.24.1.bb
> +++ b/meta/recipes-support/gpgme/gpgme_1.24.2.bb
> @@ -29,7 +29,7 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
>              file://0001-autogen.sh-remove-unknown-in-version.patch \
>              "
>   
> -SRC_URI[sha256sum] = "ea05d0258e71061d61716584ec34cef59330a91340571edc46b78374973ba85f"
> +SRC_URI[sha256sum] = "e11b1a0e361777e9e55f48a03d89096e2abf08c63d84b7017cfe1dce06639581"
>   
>   PYTHON_DEPS = "${@bb.utils.contains('LANGUAGES', 'python', 'swig-native', '', d)}"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211529): https://lists.openembedded.org/g/openembedded-core/message/211529
> Mute This Topic: https://lists.openembedded.org/mt/111228276/3617049
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [hongxu.jia@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


