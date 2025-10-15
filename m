Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F655CCD18E
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 11:24:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13613.1760527479179110552
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 04:24:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=lrUp5jsE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2383958093=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59F5tqeb1949600
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 11:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=o3KYv3suj5OpHyOyq7U2XQB4bX7hL1MMQW9Tu3jQHWo=; b=
	lrUp5jsE4wZZ+X7Tp21N0uFnmGWpk3sjGYjtWwwCdJSeAO/sfjVpYSF7s0ZV1sIZ
	kUmGkl1wYCy/Fg0DyGiDfp1j7zlMdOIyM/0flz5ujCk8n9RaNWbmfFmALSgXb8fO
	jssXsbNh6u5uq6d+Qjs3u65l1NY1aenO/U7oRTqOAohR+ZPQGpqJQCG9KqGBDQU6
	B+bkdWSd1xQfQ3HAp8IpTTzfWVQuEX9+pJZ7Gw7HNjWbfeGREoMAJGLan8mdgJY+
	6czFFkclQTMKPP19sR5ZW1GV783bV3Fqyk/0IuEQRaoRVF1JegfZgDHGEJ4YxZnw
	+MJD+B+O1i3gL4ib3EoC+Q==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011053.outbound.protection.outlook.com [52.101.52.53])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qcewmwc6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 15 Oct 2025 11:24:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aRHNMyPbTnnubmaxzxUA4R+5Hjso1JsRPF4LorQ9j4AGNnXB26Wnxflk/RyrvYSNK/c5vMzmz88+3xuJncPdwmMDNxvioSX9SFPaAcKkLZjpQ4Xx+eq1ek79ycbMBlkyiMj372R/NrzFVB1zxDQGjGdRNu4wQEoewPFrXFAdKMQs0QIxg/qLXxykWtaw+it5IjAtLo9rDWuQ4P6fhulkwWLDhMVeGWggDkhHHyuYchecmg7ahHEDnsndjnycW0suNf3rEIQJvB79hPLqTxFxaLQvY5otg7BaWwwi3Twz5lOIziPeGfgSlcOySW6sIrSbha4w2j1ftbvyyfqxpb/QHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3KYv3suj5OpHyOyq7U2XQB4bX7hL1MMQW9Tu3jQHWo=;
 b=VCdFUzOBF1hosHABiyhpBHxuC7RXq8rj+Kb0KQRPxYemnEhNGa7Vp496H/6EOmiRmL0KZtT1RxJgAOeG9IbYPYpzbb0BsWXKyATaQ/CbdXTV00rTexZ5w9CVkNgaFx4dgTz7vrxeQUYrEpu70pIG+FcuWEn8q0nhFCWgkZgVYgaIVJ/Dz0JaRPqj4OJOOA24B054l8Q83/gLc9M8gkybk8aagSmbETiZWL6ckufa+emzCB/jjouTzfmr3qSb1yvvsIl+85nBuMJEo7Gm32E9RwE5vz7OHhC508eh4NRnptotjfwNp0S50F2TpoHSOdToLMyHewNTBFWBSn8ScBOx8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Wed, 15 Oct
 2025 11:24:30 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 11:24:30 +0000
Message-ID: <338e8ae0-5917-4eb1-90ac-1e3a521d71b8@windriver.com>
Date: Wed, 15 Oct 2025 16:54:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH V2] glibc: stable 2.39 branch updates
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
References: <20251013094915.2816229-1-Deepesh.Varatharajan@windriver.com>
 <CAMKF1spmqS0=i-8OaLn4Uh3DDwh49gCJ5sUActA_60Q3KMbozg@mail.gmail.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <CAMKF1spmqS0=i-8OaLn4Uh3DDwh49gCJ5sUActA_60Q3KMbozg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BYAPR06CA0006.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::19) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|CO1PR11MB4979:EE_
X-MS-Office365-Filtering-Correlation-Id: 51b79981-e044-4665-35f0-08de0bdd687a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R0VVSVRVdjhHblM4QkMzUmxRZWFldzJzTGhwdks4S001UTJCMFBLaXJPcFR2?=
 =?utf-8?B?Z1lkazRPT2dDbm1JbmhMZXRQckgyYVB0UTNHa3E2MWV1RlBaMUZncWdHMDBO?=
 =?utf-8?B?NEIyUk5LMCtSQ3UyVTNiYmtjTXZkQ05ZYnZiNUM3K1ByUk9mbVk5dEp6OUZo?=
 =?utf-8?B?dkdTY081aWpjWVgzQTEwZjdnTE9EaHZzL08wVGY3RXFJVnVZV1FLYzMxa3F0?=
 =?utf-8?B?N0lTYWd3ZHNtVldtUW5HKzdjSUkxWFlQai9COExBdHRJWE1sVHB5RkZObnlJ?=
 =?utf-8?B?VFpXMnpISzJIM2hGYldCNzdSUDh5N09DT1BXTktsUmhyU0N5SFVwWVlmMUor?=
 =?utf-8?B?eGJtbFA2UnVTQ2xLQW5KaDI1UVJ2eEl2dmlXd0tldlIxMXFYNzJ4THo3a3Ry?=
 =?utf-8?B?ZnFyN1Q3c0VZVzF4Y2lISFBZaHRtSnBsWmtNV1NVa2FlQkEwcSt6MG5ZZVpW?=
 =?utf-8?B?R2NSUjJmTHhGbWJaMnFoc2k5WXdPaFRja0dqQmV6VUFXNFVIR1FVbVBOS25u?=
 =?utf-8?B?MjdWbk15N0F1RytZMzJ5dkc1LzJsMllRVGlTS1MvZEpzTW81d096QVhLNjV1?=
 =?utf-8?B?ZVd5d1NNbENydHh6d3AxTlBHYlVCTnJHdWt6Z2FCUGp5NXd2djRyOEo1c3hp?=
 =?utf-8?B?ZTI4K2dkOTIwTVJrUkR6RGdkQmlVa05PWUp4YlNGZ2J3ZjhwTGlTZVZmWDRX?=
 =?utf-8?B?QlNGdGJmQ1BXLzdNQ0Fwc1pXRmFjNmRONzRCaVpRYTZFa3lzYUNNaWo3MmxC?=
 =?utf-8?B?akc3TUozQ25WZFFHQVFqeTB2UGwyZjZZMm5oSnhqOEp1aDlaLzlGQWxjQW9O?=
 =?utf-8?B?NVRFaTJmVHZQZmRJYWN6MW84OTNoTEVtbFN1TEhFWFN4Y3ZPbml1QWRxbXZN?=
 =?utf-8?B?cndmMllrSXBvdFlBWWwxdktZM2NaWFVmNTdvRzUvbytYZkJSZnFyTzRoMTlo?=
 =?utf-8?B?UWlxR1VFWTZjalVHVXpmUk0rcjBEK1I4cGVkbFgxQVRQa01QbVBxVEhwRGt0?=
 =?utf-8?B?UU90OGt4OVlxSlpQQlUraUxaZTd6Mk16RHVVa2l0akpHb21hb2JNYUx3R2xi?=
 =?utf-8?B?Ums2eG9UL09TNmtpbi96TFRwTnNZd25BZTJHNGFwQWtWc3daRm9OdWIyNlRR?=
 =?utf-8?B?QXlEcUFNQ0dFaEhMZG9CU1NXWVNIZTFmWitqMkFvcHlDSG9PeElHWU5mUWRM?=
 =?utf-8?B?N3dtb1pDUDl0OCtiRGRrU3prNmQ2MEt4cUVlRm01bXpEa2JHV3NZbCszODhF?=
 =?utf-8?B?MmNSbi9QU0QraENoVUFIMUZwdmh0OUNHa0dBZFozSVlVUHY2QVNTQk8vbnBk?=
 =?utf-8?B?U09vc0hCTW5kc3ZlcS9xTUtCNUxuVTN5QWU4c2oxU09lU3dlbGZlZmU3Ly9G?=
 =?utf-8?B?YWxHSDVtVnFQbmwyZEpvb2pzYVZETDB2QXk0UTlVaEd2TVBkbG9lRFROMmxH?=
 =?utf-8?B?ZmlDWm9FSFFyUjZPUmZNOE1nbFFMRVMrME5sZ1ZjbEVYUTM3UERrUzRoRTFO?=
 =?utf-8?B?S0hwOEhoa1pRYmhtTmtVeEEyN2JVMndZSTZFNk9nTWkzclpUVW5uYzlBaTdn?=
 =?utf-8?B?RHQrNEU0Tm5xZmFLYnY4UmZVeEtvUHYzb1FIb3NNb21hbDBjU2hyamMyQU1E?=
 =?utf-8?B?MXdoV1IwWSt4ak0xdExxZFRONDFEdzFFQWc3Nldzb2trMUhTLytEeEtiZ0VH?=
 =?utf-8?B?Q3AyK2xEckJ6TzI3SEx2Y25XUnJvbVRUbXQ2SExXTVhTRzVVVERtSVNoWS9l?=
 =?utf-8?B?RGI0MkJQdVBSTFQ2c1NDeHRiT0VOVDlJYjc5bWVBT3NWS3RIY0NIZU1OcGRY?=
 =?utf-8?B?eURmMjVyN2tTYzk2ZVVQVjZOZHVTODR4ekh3L2s3bVVEMm9jNjVpbmFOTjZs?=
 =?utf-8?B?cHpQUDBTZDdja2tYQWw0aDgxdFBCZ2twMlZTdDhIZG44VlE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RGZaZFpqdm90RkxURUY4R09CRGZWbXdSQzF4T3I5bHloRE9ZTlJMVm9NNHVj?=
 =?utf-8?B?UGNNaTNWcjQweVhvZ2UzcGRkU1pYQjRXMmFjR2pUL3lNakZPTU1lODNRcHFr?=
 =?utf-8?B?dHFTcmFYYzlRSzJEcXhwL0NZZ3Bhb2M0TFFjd1E5S0VyM3orMVBGU21TRHFq?=
 =?utf-8?B?SmFKY00yZkZWZWVyTG5JaUxpYTRWQjNyUDRnMjVRaTdVNnpPNW1uRVIxZ0h1?=
 =?utf-8?B?SVFXTnByMFgwZHNzdDV0U2FMcUlialk0YkFaeXE3THBiVUc1ZHhuWnhNNFVZ?=
 =?utf-8?B?dkVuSHQ4R3REeE1OazRpb2xnSlIvaDBRU0JKWGVVRC9idng3YVVzNnFaeXVk?=
 =?utf-8?B?aDFUMmRJZ0NXYXBmbmpXNHQxcEhUR3NqSmhVWVRxL2hQTnBocVRCU3lPZ0VN?=
 =?utf-8?B?MDNLK3h4WUUxUlBxMVhXVksydGFVdFhYNGxDRU13ZTFwMUx3RlgvUFBYUGFl?=
 =?utf-8?B?bDhoRTRSNXF3V1I5NkhPNTB5QW9KWml1akNnNVhLdzVBNW1KbmxNZGNqb1Fl?=
 =?utf-8?B?ZVdhM2pHbVB4N1NlTEtUTEJVWXgvbDEzNHFGRHBHRXB5eldjZUNmUGdjVmxI?=
 =?utf-8?B?c2JkTUt5d0JzbVlnYmtUdU1nR21nWmlSc3pYQ21XQjNkUlM5VlFvQ1IyM0hG?=
 =?utf-8?B?Y2xBUnZlWHE5NWhlSkVOQm1VdkNsYkhDTzdQL1hMa0hHMkpvNlRhcnVYOTky?=
 =?utf-8?B?aHJOYkMxcTZHTlQ3dUhkaWcySzB3ZHBmclRmdE9YQXMyS0Y1QkVtZXRtdXBX?=
 =?utf-8?B?aTdBaVM4SzRVZEZGaHNrRm1STnVJb04wUkdGTmpLeFV2a3RxK2lMemp0ZGxP?=
 =?utf-8?B?Q2lFLzZFMERpb3oyU2lFV2VrUDIraFhGZjI1QUhFVkdvRkJsV0FMMjhoNjB4?=
 =?utf-8?B?dE9YQzAyaFNFWCt0cFR5STBuTDFYL01NTWZxaWt5YTc2M0haUmdEeXBLN1ND?=
 =?utf-8?B?VDRlbnRTaGJyRHUwUHdTRms1aW5RSENKMUR1Qkpkc3RjOE9Ybm5MMFJvRDlV?=
 =?utf-8?B?YUEvN0tRdE45ZEZ2UWZheXlPS000SW0ybHU4UTVXWkE3MHk1ZUU3THF5UitZ?=
 =?utf-8?B?Y29nZzQyV0ZxU3VPNy9UWUNWdHdKeUtlZEd0MGpYNnB4MkJGdFF6SXZlOUlN?=
 =?utf-8?B?aC9RdjR4U04wTlRmZk5LL1BOTW1ybkduMDFrcWNxcmphQXFrY0VQTTJwclJQ?=
 =?utf-8?B?djgyTWNIUGNqWnBxcEliM3RiTnd2ZzR2M0FXMldRdmx3ZFp6UG1jQ0ZXUnFX?=
 =?utf-8?B?SFdQVDg5Tm1hRDdCRzFINDRxQ3JEQ0ZmVWhxT1Zzdng1TTloeVVPZUtxNFZp?=
 =?utf-8?B?d1FydEV1Y3UrUmh6ZUljK3N2aUp3V0d0YlBnTlBTTERDdUJ2K1lJaThKNDNH?=
 =?utf-8?B?eUl6NDZIVlBERXAvT2FYRlFJSHl2d2hjQmJsTUFBcjZWZDdCU29Tb1dxc2tr?=
 =?utf-8?B?WHN2a2pWZzM1TlRmQ2IyN0Rud0thV28xN2w5djRhQ1FJVmJmdHQ2dWErK1JY?=
 =?utf-8?B?MlRObndMcE1MSDJnN1FZT2g4WXkycyt4U2NxSzYyZnI5TGZIcjlHUkFZcS93?=
 =?utf-8?B?a3lveVlEbkMxanFzVHdsMm00UkI1U3M4SlMwdXJMRjNQZGs3QjQ2akpnRmpl?=
 =?utf-8?B?KzdaLzhxOE5sZXlldHc3RTZ1WHBhU1YwR1hXbmV0T0Y4Q1JzaGtteUdjVUh3?=
 =?utf-8?B?eEd6R2R4RnJvRHVBVDR6ZTNmckJTbFV6bURhRFVPZEhGSS93TzJxaFpHczA3?=
 =?utf-8?B?MFNuaWZTT1ZNZy9neVpwQVVHQzE2S3FDMUxwdVlHaDd3Q1pjYS9USWVJNW5P?=
 =?utf-8?B?cGRrY0U4QVIvREw2bTdsankxNFgrSGNob1MwYnlVYjFWb2hrbXA1YVpTVW1T?=
 =?utf-8?B?bkROVXlOOEhZb2RTejNvV011c3RMNmxuemNqU1d0L2t4bndrS2RYd0tSQTJ6?=
 =?utf-8?B?WXlPcVcvSlF3enVIU2V2ZVVNa1hzekV3TFdWSHhjeG9JaU5wL2RDZFdaZXF1?=
 =?utf-8?B?NVA2SkswMWUyUkdCNnBBT29zeFd0ckYyQTlXR3I0UVFLVVVyY0NabTZkNWw2?=
 =?utf-8?B?ZXV5cUxBbkQyc1E3RjJFWHFaUXpJck9rcWdkaVdqa2p5VVV4UU5wZW5WUVBL?=
 =?utf-8?B?ditVVjBKTG1mTlF3eVhPemV1MGxuZXRtcnNIMXlUMEtzejVQM0pNb1U3QjBO?=
 =?utf-8?Q?1lNqgD00sxSmY2wIKHVYSro=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51b79981-e044-4665-35f0-08de0bdd687a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 11:24:30.4296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2yJfjvIQc28wPQmRdQg7lg22YWM5ZBCr2eevb6fiQQtW0yE2+rNziFA544ieKxKBpz3ViL6MKx/7aZgGoOuRZBYIJaSh9cJCSEh6MW/ET/9rHnD6CmlvXsMtw1tP/WId
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4979
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 7n7IcOYmZ-WEF8N-T4URATRtjD-F1imb
X-Proofpoint-ORIG-GUID: IcdNguCPFqOyHXKCnEdoKxT5n3qRjXUk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE1MDA4OCBTYWx0ZWRfX8YewF8Krvngf
 DYqQbz4T+zadTaW9bkUxkcD6a5v1OYfWUIxsEjnN1bjqYghVwN1K/HwpbeIk/QKITz39KCaYtN+
 JZdctbExbwO/TFk0UaO6lXoNocD879xLUJ2cxjxGKziA2J0IcR3J6upNwUhTwEEx2nctv4Jlh8Y
 1+bwxI1zp7Uc4BYEZh8IW1NYJGIRbZkt4DfZu0RpPuh5wdIhpCHxSj3ZsUCOUbYC+6D6Bfo4TIc
 j/xZE/ZmFY/kJWGkSnsaN/LzcW4nX9zsIo1ofAqkhmubD/emROIGp2+vOxY0GQs7at8OXO6MtOU
 pW9u6mhmw8J+HlZz2uCb6BlMEiONaMbNiK0d3DnllElVWAGjXpJ90+bbBJ5WYI5BD18nSIB/cJl
 yB/a9wphOCPhWnD5BbWpnse0vFz91g==
X-Authority-Analysis: v=2.4 cv=M+xA6iws c=1 sm=1 tr=0 ts=68ef8475 cx=c_pps
 a=H9d2Io+6O/etw3jU54J+0Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8
 a=pGLkceISAAAA:8 a=ER3wDUCBGtniaWTmJ9AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510150088
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 59F5tqeb1949600
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 11:24:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224891


On 13-10-2025 23:46, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Mon, Oct 13, 2025 at 2:49=E2=80=AFAM Varatharajan, Deepesh via
> lists.openembedded.org
> <deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>
>> git log --oneline b027d5b145f1b2908f370bdb96dfe40180d0fcb6..58cbbd43fe=
82910cf8ae9008351b0b0665104500
>>
>> 58cbbd43fe (HEAD -> release/2.39/master, origin/release/2.39/master) x=
86: Detect Intel Nova Lake Processor
>> 835b1e3379 x86: Detect Intel Wildcat Lake Processor
>> 765534258e nss: Group merge does not react to ERANGE during merge (bug=
 33361)
>> 7ce7b4b2f4 Rename new tst-sem17 test to tst-sem18
>> a6ac06abeb Avoid uninitialized result in sem_open when file does not e=
xist
>> ff6ce67220 elf: handle addition overflow in _dl_find_object_update_1 [=
BZ #32245]
>> fffc2df8a3 Optimize __libc_tsd_* thread variable access
>> 83340b35cc i386: Add GLIBC_ABI_GNU_TLS version [BZ #33221]
>> 5541edb1bd i386: Also add GLIBC_ABI_GNU2_TLS version [BZ #33129]
>> 1f17635507 debug: Fix tst-longjmp_chk3 build failure on Hurd
>> 3b6c8ea878 debug: Wire up tst-longjmp_chk3
>> 89596f46e3 i386: Update ___tls_get_addr to preserve vector registers
>> 4c2509882f elf: Preserve _rtld_global layout for the release branch
>> cf0e7d512d elf: Compile _dl_debug_state separately (bug 33224)
>> 5cd1f4b1a1 elf: Restore support for _r_debug interpositions and copy r=
elocations
>> 97017da5ef elf: Introduce _dl_debug_change_state
>> 5601ad79b7 elf: Introduce separate _r_debug_array variable
>> 24c94ea84e elf: Test dlopen (NULL, RTLD_LAZY) from an ELF constructor
>> 79d84b5da5 elf: Fix handling of symbol versions which hash to zero (bu=
g 29190)
>> 5f5c411132 elf: Second ld.so relocation only if libc.so has been loade=
d
>> 4c9b1877fd elf: Reorder audit events in dlcose to match _dl_fini (bug =
32066)
>> f407a14ff7 elf: Call la_objclose for proxy link maps in _dl_fini (bug =
32065)
>> e27601b385 elf: Signal la_objopen for the proxy link map in dlmopen (b=
ug 31985)
>> fef226255d elf: Add the endswith function to <endswith.h>
>> d21a217fa0 elf: Update DSO list, write audit log to elf/tst-audit23.ou=
t
>> 4f145bb35d elf: Switch to main malloc after final ld.so self-relocatio=
n
>> 65d86471ce elf: Introduce _dl_relocate_object_no_relro
>> 5434cc2c41 elf: Do not define consider_profiling, consider_symbind as =
macros
>> b2d8c6cbe7 elf: rtld_multiple_ref is always true
>> 2b89de7c91 Revert "elf: Run constructors on cyclic recursive dlopen (b=
ug 31986)"
>> 46e3ecad27 elf: Fix map_complete Systemtap probe in dl_open_worker
>> 5f225025db elf: Signal RT_CONSISTENT after relocation processing in dl=
open (bug 31986)
>> d6cc325fcf elf: Signal LA_ACT_CONSISTENT to auditors after RT_CONSISTE=
NT switch
>> 6917fde6f9 elf: Run constructors on cyclic recursive dlopen (bug 31986=
)
>> 9fa7cc6a0b ldconfig: Move endswithn into a new header file
>> 269e89bd8d x86-64: Add GLIBC_ABI_DT_X86_64_PLT [BZ #33212]
>> 62ff85fd09 x86-64: Add GLIBC_ABI_GNU2_TLS version [BZ #33129]
>> f0e8d04eef libio: Test for fdopen memory leak without SEEK_END support=
 (bug 31840)
>> 42a8cb7560 Remove memory leak in fdopen (bug 31840)
>> d1c1f78e9e math: Remove no-mathvec flag
>> 20d2d69a2f Use TLS initial-exec model for __libc_tsd_CTYPE_* thread va=
riables [BZ #33234]
>> c11950503f ctype: Fallback initialization of TLS using relocations (bu=
g 19341, bug 32483)
>> 25c537c3b3 Use proper extern declaration for _nl_C_LC_CTYPE_{class,tou=
pper,tolower}
>> fbdf9680cc Remove <libc-tsd.h>
>> fca5937510 ctype: Reformat Makefile.
>> 49f0e73fa3 elf: Handle ld.so with LOAD segment gaps in _dl_find_object=
 (bug 31943)
>> 64488b4b31 elf: Extract rtld_setup_phdr function from dl_main
>> 9833fcf7ce elf: Do not add a copy of _dl_find_object to libc.so
>> fbade65338 arm: Use _dl_find_object on __gnu_Unwind_Find_exidx (BZ 314=
05)
>> 392e6cf1e8 AArch64: Improve codegen in SVE log1p
>> 3a78a276a3 AArch64: Optimize inverse trig functions
>> b6ea8902a7 AArch64: Avoid memset ifunc in cpu-features.c [BZ #33112]
>>
>> Testing Results:
>>              Before     After    Diff
>> PASS         5080      5099      +19
>> XPASS        4         4          0
>> FAIL         119       120       +1
>> XFAIL        16        16         0
>> UNSUPPORTED  154       154        0
>>
>> Testcases changes
>>
>> testcase-name                                                before   =
        after
>>
>> debug/tst-longjmp_chk3(new)                                    -      =
         PASS
>> elf/check-dt-x86-64-plt(new)                                   -      =
         PASS
>> elf/check-gnu2-tls(new)                                        -      =
         PASS
>> lf/tst-dlmopen4-nonpic(new)                                    -      =
         PASS
>> elf/tst-dlmopen4-pic(new)                                      -      =
         PASS
>> elf/tst-dlopen-auditdup(new)                                   -      =
         PASS
>> elf/tst-dlopen-constructor-null(new)                           -      =
         PASS
>> elf/tst-link-map-contiguous-ldso(new)                          -      =
         PASS
>> elf/tst-link-map-contiguous-libc(new)                          -      =
         PASS
>> elf/tst-nolink-libc-1(new)                                     -      =
         PASS
>> elf/tst-nolink-libc-2(new)                                     -      =
         PASS
>> elf/tst-rtld-no-malloc(new)                                    -      =
         PASS
>> elf/tst-rtld-no-malloc-audit(new)                              -      =
         PASS
>> elf/tst-rtld-no-malloc-preload(new)                            -      =
         PASS
>> elf/tst-tls23(new)                                             -      =
         PASS
>> elf/tst-version-hash-zero(new)                                 -      =
         PASS
>> libio/tst-fdopen-seek-failure(new)                             -      =
         PASS
>> libio/tst-fdopen-seek-failure-mem(new)                         -      =
         PASS
>> nptl/tst-sem18(new)                                            -      =
         PASS
>> ctype/tst-ctype-tls-dlmopen(new)                               -      =
         FAIL
>> ctype/tst-ctype-tls-dlopen-static(new)                         -      =
         FAIL
> Are these two test failures intermittent ?
These two test case failures are from new testcases and these failure=20
occur only within the Poky environment.
They are consistently failing across the poky-master and all other Poky=20
branches with the error seen below:

error: xdlmopen.c:28: error: dlmopen:=20
/usr/lib/glibc-tests/ptest/tests/glibc-ptest/ctype/tst-ctype-tls-mod.so:=20
cannot open shared object file: No such file or directory
error: xdlfcn.c:29: error: dlopen:=20
/usr/lib/glibc-tests/ptest/tests/glibc-ptest/ctype/tst-ctype-tls-mod.so:=20
cannot open shared object file: No such file or directory

We suspect that the failures may be related to the following local patch=20
in Poky:
https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/gli=
bc/glibc/0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch?=
h=3Dmaster

We have already begun analyzing this patch, which was originally=20
introduced to address a specific
reproducibility issue. As part of the investigation, we need to verify=20
whether the patch is still necessary.

Our approach is to remove the patch from poky-master and evaluate its=20
impact on reproducibility.
If everything works correctly without the patch, we plan to remove it=20
from master and backport the
change to other branches. This should resolve the current test failures.

For now, these two test failures are expected here.

Regards,
Deepesh
>
>> stdio-common/tst-scanf-bz27650                                FAIL    =
         PASS
>> elf/ifuncmain8                                                PASS    =
          -
>>
>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.co=
m>
>> ---
>>   meta/recipes-core/glibc/glibc-version.inc | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-=
core/glibc/glibc-version.inc
>> index 89e532fd67..2ca1571158 100644
>> --- a/meta/recipes-core/glibc/glibc-version.inc
>> +++ b/meta/recipes-core/glibc/glibc-version.inc
>> @@ -1,7 +1,7 @@
>>   SRCBRANCH ?=3D "release/2.39/master"
>>   PV =3D "2.39+git"
>> -SRCREV_glibc ?=3D "b027d5b145f1b2908f370bdb96dfe40180d0fcb6"
>> -SRCREV_localedef ?=3D "fab74f31b3811df543e24b6de47efdf45b538abc"
>> +SRCREV_glibc ?=3D "58cbbd43fe82910cf8ae9008351b0b0665104500"
>> +SRCREV_localedef ?=3D "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
>>
>>   GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dht=
tps"
>>
>> --
>> 2.49.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#224769): https://lists.openembedded.org/g/openembe=
dded-core/message/224769
>> Mute This Topic: https://lists.openembedded.org/mt/115731631/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

