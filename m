Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C80C021B8
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 10:34:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.19145.1741084457256888868
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 02:34:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=515852bd04=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5246hDlc006161
	for <openembedded-core@lists.openembedded.org>; Tue, 4 Mar 2025 02:34:16 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2046.outbound.protection.outlook.com [104.47.58.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4542mqk3xs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 02:34:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AWjMfSU8TuJSXs4kdZPqvquv4a7paMrJ9w47kNTNU9uewfvKEpMNoBxc8Bk6O5Rag7X4kcAHSnJzx/baNt4K2L+sIv+16wh/ZWj0g+xFtPJtGt32OVOVQkTPOdEeTg+oUi6s2lL2RM+2KY5M7dHLAhd3wCQr+IAVIGtHRdnrYYQoGz9nofYyurtypikIYPDtMT8sJH8pQ82swBGWcszUvZtH9qY/a597wq7zssKjZo2U5o5UYv7t9+HZUzl7pGPke7dsKAUxmzGVhcwSMVF2/46mon/TU7/6vs70r7DWqsVqTlYkmktD8wybk6aFfFL3oNZnYrZ6qvd3D7l+zISY/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NugyjyDbc8PgfYCvtuMaEZWP3Nk3T6s2M9cB47CuHQU=;
 b=nd3ocyZLA80oQgXbfy7lEdSjuHXR3rm3DKgARZNwXCfpCdKVaMnWidVH3/wXXE3200saONOv8F6jiqJt46OyXeeGrMAzRESG8NBhz3b4d7pmki1nvTp5sj1mEEb2yXcWbV3uynnrS9CZg68g4IbSoGuv4x30qX+sJ2fWmEWif4gFCficBz1SRN+tDti4kqWZIpFDibFxol7X05w+9JjyViLPAwBubbsPgWXS2PJe/RlANP5qUbuJJmIe3SyOdoZdLV6SYYDsExYQRkrD1O0Y9HYflzvRgIHfncE4bp1eWN0a2hUjE4m3Nt4gLKLgJv0pA9D22vj11MQssVbjyfP6kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SA1PR11MB6870.namprd11.prod.outlook.com (2603:10b6:806:2b4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.26; Tue, 4 Mar
 2025 10:34:13 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%6]) with mapi id 15.20.8489.028; Tue, 4 Mar 2025
 10:34:13 +0000
Message-ID: <4ab6c642-5574-4243-89a1-a4c06997cfb3@windriver.com>
Date: Tue, 4 Mar 2025 16:04:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/3] rust: Fix build break because of download-ci-llvm
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20250303153458.2879205-1-Deepesh.Varatharajan@windriver.com>
 <20250303153458.2879205-2-Deepesh.Varatharajan@windriver.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <20250303153458.2879205-2-Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::9) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SA1PR11MB6870:EE_
X-MS-Office365-Filtering-Correlation-Id: 26157692-4f34-401d-aa28-08dd5b081b1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c010NEw3VDh3cnpPYkR6OGlHbjN6eUpOZmUvOHVqUzRCUTBUbG1XRktjRlY3?=
 =?utf-8?B?RDlCMmpKYXNNOEVYNVgzNmxwbTZhT2JLYTVreHJUVm95TzREMEVSTE5KbkQv?=
 =?utf-8?B?VlVIcURiczlZb2k1WUNScFh0NXJCdEl4VFZvSFBHaGdTaHpQWGtVKzBzTC9t?=
 =?utf-8?B?dUN4UFZBVXlaOXAzdVYwSGdVc2N6UlpsbnlDdVhsQ2pteDBpZEc2WFpKRFM3?=
 =?utf-8?B?QXhSaUEzZjdqLzZZbk9RYlY2RlZxYXVYa20xYzZ4bVJwLy9oUCs4K3BGbk9K?=
 =?utf-8?B?MHU5eFlBODE4ZzNhYzMxQzVvVmJUNWxadiszWkJGUzJueDJvKzkxS2VDMElj?=
 =?utf-8?B?ejJDMVRDT3V5cVpKSG9iNEdUMjZ6S0I4REhvNVVHZnB2WHpSQlk3TWlpY0Y2?=
 =?utf-8?B?bUFWN1Zpb1lxU0U2ZmY5TnJ1K3JCeDYyMlNKeEIvYVErZ2lLV2xzaElGVDJi?=
 =?utf-8?B?M01qeHRVWDN4b1VDQWIzZFFRVDRPNWVXMk56d1dreVFlUnVRck1heFQvZ1Mw?=
 =?utf-8?B?aHpFZUJTeFlybjcyUE5RTWJrYUVxeFNLdFRBV3FZVjdoSDd1c3BGUXU5WEJW?=
 =?utf-8?B?Nkg1N1VPMzZzMjNlZC9pbXVUNkQ5L2NkRHp1Q0RuMUZRTTQvcEExT0M2QU11?=
 =?utf-8?B?elYvM2IrbDdxb2FCTWcwVGxpaGxJVHRKVTFHUVcxTnJudFBqbnFJUVRyRVJw?=
 =?utf-8?B?KzBOaGU2eWdPaTAyS2JnK25YVkFOODdXR1V3YlllaFh1bGJwdWFQa2VlaHBX?=
 =?utf-8?B?Z0FjenRjN0JCM1l2Ylc5RWg3R1Vic3VoMjBWMnFwMTRGSjMxVEZMK0xmYzBN?=
 =?utf-8?B?Q0pHKytPQ0c1Rmc4Z2hiNGZrQUEwT0JPeWdpMkIrbXZxdjFmL0ZMVjR2bGow?=
 =?utf-8?B?bEhQelN1OS85ZXRiNzdhVUxLWnkxZzVydWZ0RnVnK2ZEc2EvN2tacjQza3do?=
 =?utf-8?B?ZTVIazFQd2xETTdFY2kwV0hodEtKK0h0YnFaSFJlNXZTdEhoTVRsRHFZeU9v?=
 =?utf-8?B?cWZyN3JTY2NBaEllSml4OFBkTFRwcXVCdlNyT0ZQK2JlYjRFaFY1a1k0Y2ZQ?=
 =?utf-8?B?dWhvYjZjYTRDSlRkdERKWEU1Y3lGNGF0aGVyM1VpbEw0dUUzNHhxdHBUTC8y?=
 =?utf-8?B?MGdLOWg0enI4NFJaU0tmTkpzcTQxWGpRMjBXU1RiSE5ZbVhRZmR1NzRrenRy?=
 =?utf-8?B?K2QycEdWM0tKZVhxS0VZc3Z4eGxXdkxwQXdJOTlGQzdya2xHT3Z2NnkzVXZV?=
 =?utf-8?B?K2lhVmJiMUJ5UGhYTVQxcnhTMXlSRUZKMHNZTHVOSCtHM29BYldTbmJIbU1i?=
 =?utf-8?B?aTF2d0hXQTZLQ0swenBid0xuUHRaNDl0MmRwUmFicmxwcy84eFBCMEN6Skxp?=
 =?utf-8?B?SGlQdzZ2TnZyN2N4Z09QS1pkYWJLdVFzeW9iOEtia1A4T1o1dWI4d2Fna1VR?=
 =?utf-8?B?amxqVW1aWjFQb0JDNjNhbW5aNjZHRGdsREhQUlFXWEk0ZjVteEY3Rkcvc2Yv?=
 =?utf-8?B?eWlNWWFQeWlJVzJGMVc5RUhhdWQ3TXQ5Q0IvdEs4OXVhbVNFcURrc2wwUUdj?=
 =?utf-8?B?eEhlMWJPZ0dUTW1QN050dGNTUVF5RCtPTE9oRzdhKzNFVDB3NXhpdVpHVE9L?=
 =?utf-8?B?dnlwcUZQeHdvSGhYZlhlaXkyVWNBYnM4UWg0OGlEcTdEaDhuUlpkdEdkQWh3?=
 =?utf-8?B?TWNCd2hKK0NEd1NXbVdmNkI3NUNLVDczcmJuYU1YWXFpOUozZTZRY3ZMTjBz?=
 =?utf-8?B?NmZVaGtWMy92T2FtSXl3a3FiSSs0WDVoSlhsMlE4clVhMWZ2YVJsRmViSGZ0?=
 =?utf-8?B?WFd4TjhqZytIekxCbVA2d3pySHdyaEZER3BFWVlXQzMwem5PaDRIQ2tleVEr?=
 =?utf-8?Q?ZMr5pfSCSOoyU?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TDJ0M2xvVnN5RFlQMDJzQnQzMWZGN0xsbHN3Y3pMdk9kNGk1aUpVaHcwWWFJ?=
 =?utf-8?B?Tjc3bGlZMmZkWnhzOVBnbWVFSGFRbmtFTFA4NTk4Y1VyV043aXRXcWdhL2pk?=
 =?utf-8?B?bDlqR2JmN0g4RFBhMFlpcnMxa3FYeTJpaEJESitLQkdScElHREVySXYrWlFx?=
 =?utf-8?B?eWo5d1A3MjdLQk9jVkRENDFyYUI2dGtOZGZZaDk3ZzkyZzE5aVFvcHBXQWNN?=
 =?utf-8?B?UCtFYVRDdmtzczRDRkVWMXowb2J2STVHY0lGOFB6aVQreVg5d1RKdUpuZ2VD?=
 =?utf-8?B?SFY4c0diV1VSbnQ0YkQxZVRJRlU3d3ZKakJuL2VLY3JzTXhUUDV1MGVjMkZm?=
 =?utf-8?B?bEJESTZFN3VkTU96dkc4MmpYb2UyTHVYRWkrakVQK1JxVEF4WnZmMU1ORWkv?=
 =?utf-8?B?ZUxQbDZnem1zVXFXSCtkSm5tdTNBUVgzaUdrUG5rZTlmMHdQbURyM1NQWkRL?=
 =?utf-8?B?cTJmY2dvTlpBUmpBNURRTDF0S1R3aWJkc1d5NkdRa05EblFJSFlaOVZ1ampK?=
 =?utf-8?B?MC9OYnFQcnpnTXgrMUhPYitkcG8yZnNJMDlOTWg3Tk5tejFSQmlUakRRV2J0?=
 =?utf-8?B?VUQ4UmMxbG1sWUxEK2JValFGWC8zYnMwMjh5bk1qZEN6alBjZEUwOG9GWjZq?=
 =?utf-8?B?akVmc2NHQTJSMWl6cUVGbzBmQWpseHBIcUMzM2EvaUg3RGNXcGc0U0RySjA5?=
 =?utf-8?B?US8za0I3UFFRWE5maGJoQWtlbjM5TDFsSDhIQytSVTQ4cXZOdVBWbGVPQ1ZH?=
 =?utf-8?B?Y0dhWkVWSDVDS0hRdmJjYTVtUVBleVl2RmlhWmg2UGFWZUV5Tk90RHZ4Z0lD?=
 =?utf-8?B?ckdON1JnMDd2YWx6WjhXQ1pJK0tLZVhiakJta1A4cHJUYUhhUkxpeDBNNkR1?=
 =?utf-8?B?eFpuSWJEVVpFTTh0c2FMWEV5VHl4eVpVNXRsQUpHdzVtTDV0UUtIOWpBWElL?=
 =?utf-8?B?TFo5YjlkQ3B4RTlPYXF6eDkxbjMzdDZHUzl2U0dXMU9BNE1UdG5zcUJ0SGJ0?=
 =?utf-8?B?Z2xUVUVPb0YvMlpPc1REd2N5VHYwbmdQUnIzbFRZL3FVamNQM3VWWlJuRXNQ?=
 =?utf-8?B?MUlNdUQydWg0Sm1OLzhqY3NPYndYK09ubXN5ZUNWaE1SSDNDbVRpUWVKb21N?=
 =?utf-8?B?UHBTVXFhVWtkNE5WOGg1UGo0cGZ2b1JNY2dNSmt4dG55UnpDOFVzL0wwTVJh?=
 =?utf-8?B?NmdJS2U2NllpUzYzd0dKWXlvTzBLeFZoVnRvVXRMNUZRVjNsN2VJZEo1NVRF?=
 =?utf-8?B?Y0xORnJBNnF3QWFacTc1R0dCOG9PT2s5M1hseTkrWlBueEs2aXFicHRmcW50?=
 =?utf-8?B?QkRpTmE3OEdJSytFdlRzNFBpdG91bUozSU5VbDJFRmVnWnFjbDdpVWJjakFR?=
 =?utf-8?B?Q1dVa25ZMUJBaTdKOE5yK1BobWxqR1g2djhuK2o2LzN2MUR0K09jK0UxaXRr?=
 =?utf-8?B?cHFybnB1ckt4ckRPOHkzSWUyYWJQSWE0R1JtMC9WNkhVb29PeGNsVWhpUXJL?=
 =?utf-8?B?QjAzVTBMVkkyLzlmSW5xcm5peTBBbERFWGVrOEtaWXdIQTBXeFJGN1BBSm91?=
 =?utf-8?B?citTbE5ad2tLSFdJdlBTVGtXa2JOZHU3S0tCdDI2enhtbjVEeDNvOTNOUTds?=
 =?utf-8?B?eEJwMnRJTDcxajBZWFlFSHBGaVhJdkNJaVhtVjVic3grRzBMbjF1OWNJMmF4?=
 =?utf-8?B?Y3lvQ0hIYzlib0cvL1Y0TVJpdmVidjJZRnNPMVBkQ01UaExZd2ovY3Jac2tC?=
 =?utf-8?B?WHY4ek5OZ0RqQjZ1MDE1dGdlUVgxN09wdkdPY1dCY09UZ015SFJqcVNCZTI2?=
 =?utf-8?B?cDFYM2xhUjAvUWpmTDV3R2E0VWFCekxiZXNhcnJ2YUVmQXRNSncyRzlnUGpO?=
 =?utf-8?B?Zzc0WURhWUVWWFJROGYyY09yUzJBSWJKWlIzcTkzMTFUck5UU2FqUGl4Z0lw?=
 =?utf-8?B?L1lFdHBTNjFMRzB6RU5ObVFRU1RLWHhNQ3o3eENtVHVDQ3RUZkpqSmxUdGJV?=
 =?utf-8?B?Ykg1UWtVNSthc0VpYkc1UThIS2srVWJ0TFdFc3EzTXd1K1dROWNFMmlwYUdX?=
 =?utf-8?B?THpvVzNTTHVYZjdmWDZUUmN3Y25ocnFvNWVjVm84S3lOMFVGa0U0aHpocCsv?=
 =?utf-8?B?bHRsNk5DNHM1UDhyVnhFeFVrU29WVkR4L0pWTllmME1ONXN4M1lSVW91MkJ3?=
 =?utf-8?Q?c2EKbMON1g0R5x0S7wdowKQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26157692-4f34-401d-aa28-08dd5b081b1e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 10:34:13.2782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4R/EoFptZQifWlnRx0kQ7WGiG3yTVDnyZTiMXmtZq+F1bovJvKAzj9l1/s9JZnuSHaTssSbdUl0qrUnooUz5bUP0Z6clBUWTE4dK2SYgBuoQt+p6NoxCuuybOVb59paU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6870
X-Authority-Analysis: v=2.4 cv=F6qtdrhN c=1 sm=1 tr=0 ts=67c6d728 cx=c_pps a=ur2hu7Zt/Tb0cWAHmjvzJg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=PVDZiZbVpKx_aSryWykA:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: sF0xhC5duZ35WvPHuMMevxfAlxAar1US
X-Proofpoint-GUID: sF0xhC5duZ35WvPHuMMevxfAlxAar1US
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_04,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=987
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503040089
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 10:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212260


On 03-03-2025 21:04, Deepesh.Varatharajan@windriver.com wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> -----------------------------------------------------------------------
> | thread 'main' panicked at src/core/config/config.rs:2047:13:
> | setting build-target.llvm-config is incompatible with download-ci-llvm.
> -----------------------------------------------------------------------
>
> Disable the automatic download of pre-built LLVM binaries, ensuring
> compatibility with local LLVM builds and preventing conflicts with other
> configuration settings.
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>   meta/recipes-devtools/rust/rust_1.83.0.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/rust/rust_1.83.0.bb b/meta/recipes-devtools/rust/rust_1.83.0.bb
> index 2bf87ba27e..ffbac267b6 100644
> --- a/meta/recipes-devtools/rust/rust_1.83.0.bb
> +++ b/meta/recipes-devtools/rust/rust_1.83.0.bb
> @@ -129,6 +129,7 @@ python do_configure() {
>       # [llvm]
>       config.add_section("llvm")
>       config.set("llvm", "static-libstdcpp", e(False))
> +    config.set("llvm", "download-ci-llvm", e(False))
>       if "llvm" in (d.getVar('TC_CXX_RUNTIME') or ""):
>           config.set("llvm", "use-libcxx", e(True))
>   
Hi All,

Previously, download-ci-llvm was set to false. However, with the 
following commit:
https://github.com/rust-lang/rust/commit/7d579046c80d3de3143dcb8b2db5640f95b5383c 
, which has been present from rust_1.83,
it was changed to true. As a result, after updating to rust_1.83, we 
encountered the following error during the build:

--------------------------------------------------------------------------------------------------------------------
| thread 'main' panicked at src/core/config/config.rs:2047:13:
| setting build-target.llvm-config is incompatible with download-ci-llvm.
| note: run with `RUST_BACKTRACE=1` environment variable to display a 
backtrace
--------------------------------------------------------------------------------------------------------------------

To resolve this issue, we are setting download-ci-llvm back to false.

If no other issues seen in the AB , we will send a V3 with an 
explanatory commit message.


Regards,
Deepesh


