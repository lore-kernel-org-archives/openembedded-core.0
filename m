Return-Path: <daniel.dragomir@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12034D6D226
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 13:48:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42292.1766065730213591836
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 05:48:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ktERvY8F;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4447d4812b=daniel.dragomir@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIDRx251442848
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 13:48:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=CBlIhlZT7Sro6PPVH/+E+EQQiz8+RgFjYUANTEjFJJ8=; b=
	ktERvY8FY4Fdr9GF5XYgUNfycSoUQ0c/gWOa9jsZaWiMjScaVWx6QhN462uafKYN
	6K26z5rwLeTbz3uZltZs2/v1A5TwuapR2Z53JLMyUIZmRekPVqyjj+TpWFHeBZdH
	Z7kW78kbFTUTAGTgA1MetIzWlJzv///48ZVjysDgkQy2lJEclHN4/7hId/qNTF98
	yrSd1BYV7hQ8ixX0uiYQOCMzL8PlxT7OpWcj1Ko8DzZaqXLjH9s/hoUAsIaKQ5qj
	qR6Q4dvdlX9NH4edTu2D/+PlMGMwmJ3ZsMd5o0ef05V+IIB5HtNfEflP9J5cr4BS
	y9ooi8/IGo3kdQaKcc7SbQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010000.outbound.protection.outlook.com [52.101.46.0])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k0bt1d7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 13:48:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qFxxzU+fXN4i2CyqDTRI6sJIws0423pqdqHioN8jD0o+eJENdwvOdwPLcVreuQkVeEwzChOvm5XogyD0cvyneWztXNJbGEAD8ocNs/D5FB0ti1NAyAduDXHFcU0xrYBuUXpq5t5LuLMBvNCZl22ewmMf6FCBxjZq/DjVEDbExXQLHqgElLsi0ksR4u+AbLN+AGzohGxwC3HTpHNx6vOWxcQOal+fGCkUNI6/lBUuroZbb6kCXNvvzx/VUL6dp6cFRCezB3VrOdxHDWE/ZTwbUTfAEAEk8kRDHRwNcYseJr66t+jLS9Et0GBQIoE3btUoueVUolec5SuLKq//pm7jYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBlIhlZT7Sro6PPVH/+E+EQQiz8+RgFjYUANTEjFJJ8=;
 b=WqaE4aWwlH21hflcPfL/RYgtVzvY7MgzHtY65R5OdAd21v4uXGXxdZUG5vNPMLl9wB3dLgVFLhcIpXJslpM6adqzxBZm8G0wtUTp9fjAsFkBDV6gAxZuGHsA8xwbIfr9qVyegCZ1ufoFUE8dwwE4YwwHMYM0yLKukFG9yq8mQlYlHb2P76PxhEBmEIVxtPXrOQ+q0aeFxl60K/y0FspjVfcUJQoklD2G0ny8HjPSes+XR/I/R6eyscyY2AHp4xaU/E4VoDyt8XTcLe4rMXFdAKDFWOW6mcE/U7RBNyzVbqsO1bfuryC54EqkAPagRebnTALMpdx6+FkqRE/D8VYsDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH8PR11MB7968.namprd11.prod.outlook.com (2603:10b6:510:25f::14)
 by SA1PR11MB5948.namprd11.prod.outlook.com (2603:10b6:806:23c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 13:48:46 +0000
Received: from PH8PR11MB7968.namprd11.prod.outlook.com
 ([fe80::bd3a:5dfd:4a5b:223f]) by PH8PR11MB7968.namprd11.prod.outlook.com
 ([fe80::bd3a:5dfd:4a5b:223f%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 13:48:45 +0000
Message-ID: <bce56a9a-88a2-4642-a42a-9ece138fb8ea@windriver.com>
Date: Thu, 18 Dec 2025 15:48:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] wic/engine: warn about old host debugfs for
 standalone directory copy
To: Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org
References: <20251218101524.703244-1-daniel.dragomir@windriver.com>
 <494e78c31feaaec6cf5c4c96ad3cbf45ac19dd5d.camel@pbarker.dev>
 <a77d83f822d4431d08307570482ebd024bcc5238.camel@pbarker.dev>
Content-Language: en-US
From: Daniel Dragomir <daniel.dragomir@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Ross Burton <Ross.Burton@arm.com>
In-Reply-To: <a77d83f822d4431d08307570482ebd024bcc5238.camel@pbarker.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P191CA0014.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::14) To PH8PR11MB7968.namprd11.prod.outlook.com
 (2603:10b6:510:25f::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB7968:EE_|SA1PR11MB5948:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e91658c-b29f-4d3f-15de-08de3e3c2988
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U3FySWp0M2VnZExadklJd2FkVmRxaGJIeUIrRjF1cmtIWGFSSWhKcTFSaWFk?=
 =?utf-8?B?ODdrZWtlTGcxZUp4d1dmVStSeHBicHlVano1STVnbEU2N211Mi8vQXNEc3VS?=
 =?utf-8?B?OTdtRTZPRHhBOHdxd2JFNEZUWGxxbFVwSHREV2hkbUppNE93YnJtZE5JUkUz?=
 =?utf-8?B?Qy9pMkhCbGxVV1RlTlJacldUdXB1di9WUHdHNnBiZUdYbEt2SnEzMC9LUlNu?=
 =?utf-8?B?YkpHRXM4dkMxcFBVOFI5ZS9GVkxLMnJ0R2VjSHdnRVFBSWYwY29Va3k4RXBH?=
 =?utf-8?B?ZGkycDVFZWFBdDBkay9UL0ZQN3hhYURQY1dJaXY0dFlOSnBON0Y5VUIyYlpl?=
 =?utf-8?B?SkVWSlRsQ0l6N09ndjB5aE1NRnFKTDhaTDBzQVRqRTR3cmpybmVwZ0IybEpL?=
 =?utf-8?B?WkhkTWczcnJtZjRvZU5KVzJZVVpYNGpPTEVRWCs4d3ZzcVhuRDJzN3VRRTl2?=
 =?utf-8?B?OHdWemVLZWxYRXlwVUkza3RSWWliU1hETDZPQUdjbzVQcXJLMlQ3OXk1a3Uv?=
 =?utf-8?B?SnRUQUdmSXJHblVtVmFzMjNqQXFsMjdVMkdJQzhjYWIvWkhMWG5CK2d6blpv?=
 =?utf-8?B?aWtQa1pNR0Q0Vk1JTERRRGdOV0RhNlZVVDVXdTh1MEY2RHdQZm05eUltYjVC?=
 =?utf-8?B?NHZ2VVF0dzZ0QUhOajE0c2dRNnJaMDJkYlNUWWdPQ3djUjgzbS84SlovclN1?=
 =?utf-8?B?Z0dQRVA2Sk5ualpGRkNYaFVuUjlVZXEzY2cvMmU2MnJOaDhnT2p1NUVBV0ds?=
 =?utf-8?B?eDZ4Z0NlbGg3S2Y3My95VHIwQXY5VENsa0x6cklRL3V6a0VDbERMeUxkZmhs?=
 =?utf-8?B?cXgzN21nNG5YcTA2NXNNaFVuM2tVRlFBeU1rVkRJRlZMK2NhczA1YklwV2Ra?=
 =?utf-8?B?R3BPbUUrZEY4c3NMMVFsS2Q3TW1JZjlXZlJkbU1BQTJqdW44OGExU0REbm11?=
 =?utf-8?B?TWZ6enA2N2xXVWlwR0VkSG02TUR0VjVlVThvS3crelZDaXhkb2crNWVZZFZD?=
 =?utf-8?B?Nm5kM2prajYyM0xwQXZsUVVDb3NhcnVlUW5hY0FYWUNwSmVTRGhwUzFNVXdT?=
 =?utf-8?B?SVI5T25lRlk2SnB0cS9lSUd3Wjh6U3ZGeXRQREdTRDlvZWpjZ3BnY283K2xj?=
 =?utf-8?B?MnJQeUlZSC9BYm1sOFVlaE00OVNjdlgzSnc0RXVDbHdnQnpaWm0xRmV5MFl5?=
 =?utf-8?B?c29Td1RXeUJoczI1ZUFuQTlFem5JN2VOL3N6and2UTRlRFF4aU50SE9KSndr?=
 =?utf-8?B?eHRZeDNkaXBMNUtiQjU0TmsrWnppRWl5QlRYL2l5Rm1hS0UvaEg3MlRzbFBJ?=
 =?utf-8?B?dWRmaDFzbkFkcjJjcVBNSmR2OElUNDhPWGh6ajRjNWFodVg2WlRvU0tpL1BZ?=
 =?utf-8?B?dEMrQXJYUy9JNVl0RWpQMmk4WlppY2JzRldhNGZ1VEpJR1huanhBYXMwT0wz?=
 =?utf-8?B?RTd2SkFwUS9oSGJLbDBic2pIc2N4NGdIL3VIWVN4RWs5YUZSWEU2b1l2T3Fj?=
 =?utf-8?B?YnkwMWVDeGlldFlEWnhHcm5SS1N6WXpOV1l5YWs0U0hZQWVRUmZrZWZWelZY?=
 =?utf-8?B?bWtOYXJIc2tnRGdkQ0cxSFBzTWlhNG8zOUJtanhvQVY1NTlnSDdsZ1YreTBP?=
 =?utf-8?B?L2pmeGNONkI5WWJ2clNKNUFmZjlFWWJiN3hJU09kMStLSTdocDM4WnE5a2FO?=
 =?utf-8?B?WUM5ZGhxdmVUZ3J5VGVXT1Z5ZGZDNCtBaU9pRHc1clVKQ0Z4WWMzdHB5MEZx?=
 =?utf-8?B?UGhZbGVnUzVmWGNXdWJtTytNT2h1cGRObXpQMEwyRnBDOFhqUThDRmZ6YkZR?=
 =?utf-8?B?M0hJeklCSXIxS0RsT2w0YWFMdW4rZkFmc0E2cGtoOUltV2hoaFdJZVE3Zm9v?=
 =?utf-8?B?VHlNUTdUVDR3Z3JCSlFZOWdYV0xiU0V3UXFIRFJQN0pGckE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB7968.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Yi9SSy9CdzBEcmhiZ0trRUFpV0hRQWpxNldQZDFaMklXSU8wNkorUnh1ZGJN?=
 =?utf-8?B?dnBvVGVHSUpTOFgrTGkrRE8vc3BWbjBrdUprbkxHOXBCTmFxOW8zb2gvbWUy?=
 =?utf-8?B?V2JPcU5qNkMzZW94cUtNRDF5c0ZjOTl6Y0hjZ0F6cll2eW1yZk1iT215MFRJ?=
 =?utf-8?B?R0pzcFRMblg2NnI0TEZEVDRva3h3WFJuSE83RzhPSThCWUJkanBRcEpqalZL?=
 =?utf-8?B?cUxidnArd2FMMnI5WGlydTlDRWU1ZXdvMS84c3lqQmRkU1FKeXFBUG93TDRL?=
 =?utf-8?B?dU85UkQyT0luRzJaQnhpVkxzZGI0TVlpa0xOQVhLVXpMMCtlRU1xdGM5WG1w?=
 =?utf-8?B?Z2g1TDV2Z0dZN2lsSFUwNXI1bXZpNFluS002Yk05eFh6V1EwY2lhbFdiblZK?=
 =?utf-8?B?V0pQS0JjeHZRU2dVdTVqa21YNUI0WkNHT1NxU214RHZMd1J5VVkzeVpBYVdB?=
 =?utf-8?B?U2Y5Tjd4aGZraHhlK290UnJHWVhKMnNkMDNPSFhhNHAraDJERE00M2I5akUy?=
 =?utf-8?B?OWIwek9hTExXNHJWRDRLYjlDYmZGcEVMcnRUQThDRERNR3NXaE9vNllmYkFn?=
 =?utf-8?B?aE9odXUzZ1gzZWtvbkcxZGFPUEZUQ1JuekJtdGl0SVVxcFdGV0tGL1pRVHJL?=
 =?utf-8?B?aTZ6emJCekRNNG80ZTJXY0pJZXVsWmQ2MnZIaG9tQ2tjQkFzWTRHMXhzenNv?=
 =?utf-8?B?OWZXSVR0ZGcrbkduYTV6UEM0cHJWbGVPR1VVeE9yWjBIRkt2WWl6S2draDd1?=
 =?utf-8?B?MjZ4N2pWSTd0VFVoSGxzTXRCOXJxdHhHTDJuSjNxYTlzTnZWTFVub0ZOaGRz?=
 =?utf-8?B?ejBLaGFQT3JrOHR2cm1UeUZYZ0x2TlV1SUc3ei85NTBVajA0d1ZRTy8zS1Y5?=
 =?utf-8?B?WGkzeXpHdnNtVjJQVkxQVmgvME9WTlJvTngvVXRjbThtOVFGdVFxV3ZhYlNE?=
 =?utf-8?B?bG5wdFpBTTJQbGpobFlkYy91cm1YWWRaTFg0MUFIWkVYbkt1bHUrc1FEbUZa?=
 =?utf-8?B?YTNGN1p2VkFFaWh4WEFhVEg3dm9oOUkvMDBibE1JdzRrLzV3Mk5RaitkSm1s?=
 =?utf-8?B?b2ZUZ1RTWVhLSG1NbmpyTlRDRE8xekF2OXdBaGd3KzNjOVdra3BxN1lQdlRw?=
 =?utf-8?B?UG56VkZLVElodlE0WFF5Vk1ucUkzUzl4TXB3Qmc2L25QclJMNDZBWkFMZTJW?=
 =?utf-8?B?YVJTR3RlU3lrWDBSUTh3T3BMdGJmVWRhZFMyclRTeCt6UnJlWS9BQ2VIaHlZ?=
 =?utf-8?B?eEl6MGtvcXlpYXhpdXBrNVFPRXNra0dVWW9iZVhWTXRMU3hFK05ETFNuQ0gv?=
 =?utf-8?B?OWJKeEJScW45RVZBT2RQYWlrWFZGZFQxSU03TWh5TUh0NENiUXcxakwxZ0Jt?=
 =?utf-8?B?bzF3U2Qrby8vUWZyQW5NWjJaSHlLeSsyS25xSHhCY2F3Z00yUGxXcXRRRWJw?=
 =?utf-8?B?bm5vNkFvRFE0L2w3TTAvOTFiL1Z2d0xSUXZxN2NNQ3VVSFNiRk9yOG0yRXJ3?=
 =?utf-8?B?NGVOelVKK05WYTZGeFJZN3RQd2cxRGkyRFpzRDFrOEVRQU9IZnZsTlZaS2Jy?=
 =?utf-8?B?UjNGZ3k0dE8vNFF4ZzlXeURnRDg3TEpFcmN3Zkp5VjNNTW5PaEljMi9QdCtU?=
 =?utf-8?B?cjNmR2x5a01XSmN1MTFjd2VzYzVBb0VMRk8zRGRlQXVCZnlYSHMwbk1Vdkov?=
 =?utf-8?B?MnhXV1hWVkhpNUdNbklPTDdUOFEvWFpkSU8xaU03N29QdHhLRVZaVHI5V3Nh?=
 =?utf-8?B?b3RURlZrNDUzWTJXMk1TSkt3OWZ2OHBpS2hGbjFybDMreVBta1VLRzVITVp6?=
 =?utf-8?B?bnI4N21FU256MGx3bTVZSkJWTDFhRlJWRUM1SUZMQWlDTXBwMXUzdnNLOVg4?=
 =?utf-8?B?cTNmOXNKQUtUQWdCalZHYmhSdzhNdXJ2Q0U2cEJzb0ljRXVXVFhsOVNIV213?=
 =?utf-8?B?L2dlRzY0MUM2bkdmdGhwTnRnRzh2UHJyRzdCVUZHNmR4K1RIUkN6Qi81SS9m?=
 =?utf-8?B?MXNwZGlMMHhTc0pqOEMydzlURXNzb2tIL0t1SUVZekRtY25tWkxYbm1JOWJ3?=
 =?utf-8?B?TFRZS3ZKeUk2TkdxZmdvOUVCS0F0YXlXek9hNjgrTFFadXBYbGVXeDVOQTh5?=
 =?utf-8?B?dE4yaXh2MlN6aVFLVDZBTFErZjZSN0I0N20ybkJDYkxHbEU4WTlpRXQyRjRJ?=
 =?utf-8?B?OFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e91658c-b29f-4d3f-15de-08de3e3c2988
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB7968.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 13:48:45.2025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TtXIMB2eprGhkavhCR75V0Fh44aqFEi/ECQ1fGjBiobaxR//9EJ+sOdye8HGj8RWxFj+MNx/rMaG9vaMs3HdBaXfrt5ADe7bt0xZG4gSz7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5948
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDExNCBTYWx0ZWRfXw4iNYTIqiJGP
 jc5qPLj03P6aLvceDRenlOTrSfKugV7PF2WqMd0T/Q7Nz9qwKcA993RSzjyZISoyCLXvRMhGuXk
 qRLHYpguE2mWQEaUkEreoBsvOfrO0FPl2sJbtAmSElXKAlYNBCQACO5EykiGfO+UklbEfp28kwx
 f0c1PvHQVukSHHwAi+N901qHfbdRQQT34BUYZNwaiEr22p0tmwBIZEpB2e8zKTuQE3JT7RrOMBs
 KM1QyuYlAPo+904J1cQORo4MN0/jJoSzn9Ghgc5zokfgGswUZdV4ODW1LsCHSqWzvdljyoETvNa
 mfFLmxyRw6u7amj4HVWUz3UiMqIRPq6fWL/nyyPVEVYwHVNJoF+RZQHZNtaL4jqOEvdwvpVff5/
 DWvGi7xOqc6fG7Ag3Q8QRw3HDQNemw==
X-Proofpoint-ORIG-GUID: kVGfO7JUsMzLUc1W5eSIL2LVlL-coNRY
X-Proofpoint-GUID: WZVAqjhaXRDCd1KrIDRmAWL1USgfL6vc
X-Authority-Analysis: v=2.4 cv=C+HkCAP+ c=1 sm=1 tr=0 ts=69440641 cx=c_pps
 a=fUX3CcU6CI0WA5Nw0mDYKQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=uAvxFoSUNWadQLjfS3kA:9
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512180114
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 13:48:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228125



On 12/18/25 13:46, Paul Barker wrote:
> On Thu, 2025-12-18 at 11:34 +0000, Paul Barker wrote:
>> On Thu, 2025-12-18 at 12:15 +0200, Dragomir, Daniel via
>> lists.openembedded.org wrote:
>>> When wic is used in standalone mode, it relies on host tools such as
>>> debugfs. For directory host->image copies into ext* partitions, wic
>>> uses scripted debugfs "-f" input with multiple mkdir/write commands.
>>>
>>> Older host debugfs versions (< 1.47) may behave unreliably in this
>>> mode and can silently miss files. This does not affect builds using
>>> debugfs from OE where the version is known to be sufficiently new.
>>>
>>> Add a debugfs version check and emit a warning when an older host
>>> debugfs is detected. The warning is shown once per run and does not
>>> alter execution.
>>
>> If the risk here is silently missing files, resulting in a corrupted
>> rootfs or worse, I think this should be a hard error.
>>
>> Consider the case where someone relies on a device having a firewall
>> enabled, but /etc/nftables.conf is silently missed during construction
>> of the rootfs ext4 image. That could result in all ports being open.

This failure can only occur when copying directories into an already
created WIC image with an ext* partition. It does not affect image or
rootfs construction.

My understanding is that `wic cp` is a post-creation image manipulation
tool and is not used during rootfs generation or WIC image creation.
It is intended solely for modifying an existing WIC image without
mounting it.

>>
>> On the kirkstone branch we have e2fsprogs 1.46.5, does the same debugfs
>> issue apply there or has it been patched?

I built a kirkstone SDK and tested this again: debugfs 1.46.5 works 
fine, and all ~1500 files were copied successfully. This issue appears 
to affect only version 1.45.

I can send a v2 of the patch to adjust the minimum required version.

> 
> Also, do you have any links to upstream bug reports or the commit(s)
> that fixed this? I can't find anything relevant in the recent e2fsprogs
> release notes.

No, I have not investigated so far why older versions of scripted 
debugfs (-f) fail to copy complex directory structures.

Adding a warning was discussed in this thread for a patch I sent to fix
copying directories into a WIC image with an ext* partition. I also 
explained how I discovered this behavior on different servers while 
testing the fix.

I only tested standalone usage of wic, using host tools from e2fsprogs.

https://lists.openembedded.org/g/openembedded-core/topic/115585333#msg228042

Regards,
Daniel

> 
> Best regards,
> 

