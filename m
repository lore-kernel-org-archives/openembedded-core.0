Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02DEDC41513
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 09:10:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.46953.1719997809871610024
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 02:10:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7914ccc5d5=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4636PNUW018097
	for <openembedded-core@lists.openembedded.org>; Wed, 3 Jul 2024 02:10:09 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4033em2wpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 02:10:08 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4639A8Yd021621;
	Wed, 3 Jul 2024 02:10:08 -0700
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4033em2wpm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jul 2024 02:10:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqz9L4qXJP1Qd4XY7/b+VccFGBsrAtYVK81u2sQpZm5+NU6xljkqOsEo0+2aM8btM6pHjRLjeSYXboFpTSssjTQ5MCOkJ+Bztn1P3i0MVXR25/OhY3SDOVi/RqbMRJx6ie1oB95mWEPTq0N2prHFaso5RhI1utVjEKW3rT60oEatxrG/Xsf/2W4coEIYICi/lHQzR1COcQf68vd9aio9dSDB3WGU8mQiaY9zmTwu0jWcZkG/bwiEkxPw1nNV/yskBAoNS4JFnI/GuPGsV32ZxK92tP9kPmY55HE3tUlWjTaOeVa2g4m97BrAXtAMGojqhco6LdD9bNG+RzhE3QwqYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IlWp8RSzTI6t+5WCdJSYlROzqHc30R99gc0REZve4l8=;
 b=Zsz1jiDyij/Wjrx57d/sjmGQuLj2+lvsVy30A464Ibfpf+ku2XRQAxjv/3TOm6x9hK0qP7QjeWjCeaIej4dIjINg9Jak7DwtpwS9Zp3oAFtlzGuYdIMzr9jTZurKxA4a2ZhFSSvMGKUuxrbgyVMKg0sMbI4nU6b+KBDHswlQHWCcQQW8lAjovMBfS06U9vs8/2gaEYXwJO2ox/0X3VrnIQlyrl9ykbgi6iE8S54eZ9RdPPYbqARuq7Dkj2HDlNsgz1rKRRK9BGQ3Ie6YTEYI/SZi9PNX++xVvKTWIcXJ59PnXcp8R0K/RGOW9pOpUqeJShpT8v1lkbZ8dUs6ZLSkQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BN9PR11MB5273.namprd11.prod.outlook.com (2603:10b6:408:132::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Wed, 3 Jul
 2024 09:10:03 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%7]) with mapi id 15.20.7719.029; Wed, 3 Jul 2024
 09:10:03 +0000
Message-ID: <f05f0749-f99e-16b5-f497-becd828beb3c@windriver.com>
Date: Wed, 3 Jul 2024 17:09:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core][scarthgap][PATCH] OpenSSL: Security fix for
 CVE-2024-5535
Content-Language: en-US
To: sdoshi@mvista.com, openembedded-core@lists.openembedded.org
References: <20240702171144.92657-1-sdoshi@mvista.com>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20240702171144.92657-1-sdoshi@mvista.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::20) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|BN9PR11MB5273:EE_
X-MS-Office365-Filtering-Correlation-Id: bd556f9a-e1b2-4d95-3535-08dc9b3fec28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OXh5cmFoR2hvZ0hWbTVaRElqOFp1Skh3R01IR09xV2g2SmFRRHEyR2NnOC92?=
 =?utf-8?B?N1RFTzI2dDVrbHdpajluN1AyY0k0ZnRNejY2K01wMmVmRDhEYzA0V2pKTjBN?=
 =?utf-8?B?dS8xM2pUREpBdXZxajlqOE94ZG1PQmRoc3U4SkVxbmlCZUcybCszR2hNSFRX?=
 =?utf-8?B?VXJxTWEvUy8xUm1WYlN0TjJpbStadDB2Si9peVh6ZDJUM0xxQWxmUkhnVXFX?=
 =?utf-8?B?WTVaWFFyVWVqa1ZLOTdMcFVJbm1QeUY5bEtjcmF3djFUUzJQTDhNaTJaRWtS?=
 =?utf-8?B?SVNHRFp2blNsU3dFZFJ1S2VPalk0d2NjRTgwdmRYMXRaZUlLTXBJL0ZpVHNJ?=
 =?utf-8?B?bmYvaEhuLzNTdEwxMWN4Z2ZjbERwNWVQT1AxU09qd0k1Y21oRTdmQ1FTUjdH?=
 =?utf-8?B?MGQwa29RRFVGVUhZTWJxaHpla0hhVVRxemd1TzlUM3ZHQTd4T2NBZm0ydjVh?=
 =?utf-8?B?WE9oZHA1ZW8zNkNPNkVFbXdXVTZ4cG1yWUZQR2FYa2V5VW55bVRHQzRYd3BR?=
 =?utf-8?B?NThJUDVkWFNXVk8xaGlIQ1VMZFFqejUwM0hOYU4rQmx2Qm9sSTdWcGpoWDJX?=
 =?utf-8?B?c2JLSG5RZndocVhnUzFobDE2SUR5a3d2bmpiK0EyQ09IdjVqSG9qOEc3Tjhl?=
 =?utf-8?B?ZHdjQmtQaVl0WDg0Znd1NS9FZGRycVIwaTJuUDQ4b1Nob0hZOE9rZkxacFNL?=
 =?utf-8?B?SWZMdWVkaUsxenRJT21SbzdJY2VBYUhHOUY5aTdQUjJzUHpyMmFtb1VVWUZ1?=
 =?utf-8?B?L2hnM3Voa1lYajdXT0h1UmlCYVhYNWFaZTJoNWhMb2VEYnl5VGtJbDhXSlBa?=
 =?utf-8?B?RjdTdEM2a3ZZODVDc2pBQWo0MVk5MUVKeWxTVlZRUjBSMHFtWUxqZTFCQjdE?=
 =?utf-8?B?Zy9YaWMwbXBmQWtZQlNROU1OY1lGNzBINHJDWnVTYzJRU0UvSnozUHRpajVw?=
 =?utf-8?B?SFVacmthbFFQZDRNOFBFZ254NFlzdWVHWmYyb2FXSGtjS1BBWWFiRnl5NU9j?=
 =?utf-8?B?SUkrdHU1aE5EdTZQeEJ5TFRLWElYK3dSbkJ6OFpjdmNRUXN0N0JBaUsxc3di?=
 =?utf-8?B?cTBiY2p3Z1g4T1VNWTNmL21BMnNrT3Z0Q1FaamVLeEFkWkwvMSsrMWcxalNp?=
 =?utf-8?B?N3UyUUEvd2dGMjRaNlFMSG16UStXUlU2NlNhYWZUV1oxTlpBKzZNbkFWaFFR?=
 =?utf-8?B?SmcxamhQdTVUbkNMVHFrbSs1czFkakJINDZlclBpM2NOejV6ZWI1bGlET2hZ?=
 =?utf-8?B?SHJZenQ5YW5QeXVhUjJ2Qi84bFI1R1dnYTkyM2hWWXBXSGFoYmZrS0xmZ1Rm?=
 =?utf-8?B?NVNvc1kwK1RUOEdXTkFUOTlkdWlsbDRvdWJUa0loK2VrSytaSFZWalI4ZS8y?=
 =?utf-8?B?Y0N2NUxXYmg1OGx6S1l2a2ZDL2lyeTFYaFJIOUlieE51NEpZNEFERUh1YnZp?=
 =?utf-8?B?YzFJMUVCSHFMUGtKaHVNSFpoR1pGdVhXNW9mOWVWVElUZDdaYWFiOHdVZUlC?=
 =?utf-8?B?bkhwSkJMSDFFT3ZxeE13emkwVGNWNHRsT1craDFtMzdlRnVrSXk0YmIvWTFQ?=
 =?utf-8?B?YmJIK1k1dCs4Y0wvVk5HeGdEQ1FzdksrSVRETko5K2kxQWhZVXd1S0RtcGNX?=
 =?utf-8?B?aVZ0M3Y1SytLZHNUemQ2SGM5TmFjeksrUGVHNHh5enkySnB0T0dzNFA3TW5o?=
 =?utf-8?B?c3pSSUhXNUg0THFiand5TkdVU2llYURZN0ZTVGtqb0lBRGNNbkNqOE5MQmJS?=
 =?utf-8?Q?ku6lEB7byL7wpX1kTo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MmVDRlM2c01IbXBqdm5qaTB2cWNHbG1qYkkwcmF1OWliN1l1NUpMbXlVbXJU?=
 =?utf-8?B?SFdBMmZtSVB5emsxOENRMjdqRUxHZGRhMlp3aTFySEw3MkhIdlhnblpTbzVT?=
 =?utf-8?B?TjRYeitZRGY3VGdtdDdFdmxFWFRKU2FpQXB2aFNPdWFVOWQxT3hQSlpYQ096?=
 =?utf-8?B?cXVYMW1DVElUVWNSZTVjOUhCSVE2TUJxYkZlZFZMWHFXdWE5R0FuYVJkNWFB?=
 =?utf-8?B?MHZCS2M4Rjd5WS8zSjV1bFQzY0FEenhDeFZNN0Z1OE9yZHJ1dTdBUW1QUkZi?=
 =?utf-8?B?amV5bXRDZjV6V1VwdStpT3VvR3gyejZ1NnptN2NmOFV5MFVWalp4TzZCLzRs?=
 =?utf-8?B?QWtvbUdEZ25rSzBMZENhblZZTllEYzJJZ2dCWmpIdE5RaDVXV2hTSXl2WXgr?=
 =?utf-8?B?eEFZK0VWYjJDYnlramc3VDdpNjIvMjhwaytnQXBMekN4UzNGeU5zeS9TR3Ro?=
 =?utf-8?B?UHlHL2E2TldLZ2RRRDlqcytUT251SFJnWVNwdlBKVUdWTUEvdjl3bHVBTThu?=
 =?utf-8?B?eEt2dm1QWXBBdHZia293WHlOSTEycXZnUEpyTTJtanhuMlpXYzhMMU4rYW9F?=
 =?utf-8?B?ODFMbzFEWFhnRGJ1akQ1OXVpOFB3aSt0Zi84S2dwM3RyUW1naWFWcW5LNWlU?=
 =?utf-8?B?Y1kwK2R3S25sQ3lZZ0RVdlVnREEwSmxzV1U5VVp1MFdjeldKMzJxN3p4Z05F?=
 =?utf-8?B?VktBbUY1WU55OUJhSWpUcDlrUzFoM0NRVUV5WDZGcG9SbXdCbUp5bjZXVGNP?=
 =?utf-8?B?aUlqMm9pSDF6N0cwTE5lWHFSRnRiUmQyc0ltbDFIVFk0RjVHVUtVWkFta1BC?=
 =?utf-8?B?L3dkckpHUW1XK00rVytlN1hvcXA5UXJtTWV6ZytYYWFRbXlURmhMTlIrNUJt?=
 =?utf-8?B?eFpKUzI3ZmFvQnhzTXRHTDNxYjZRdFQ4YWVWLzEyTEIzM2xUM2I2SDNIcmFS?=
 =?utf-8?B?VDdPK1Z5T0lKKzUzRG9YOUlvU1dkRldMLzB3SmxmUDZTdVArOXhUODJsdG83?=
 =?utf-8?B?UVVFVVZHNGxrRmJuT0FuR3c1RkNuTW5LR0xYYlMzMUFYNWZRWENYODJUWHpY?=
 =?utf-8?B?d0FRRnY1cWJJOUh3b0ZoWHFyK0tnT0hSUU1HWG93aUNONG9OemlzRjVnMDRH?=
 =?utf-8?B?OUYvb0VHb2NHMlVCUlNtbkFPU0dueU5pRlZ4WUdidXV0K05zbER1ZzdSRDBP?=
 =?utf-8?B?dnVtSEJCbGthajdUWTl6MmlzREZBZXhGemd5SzJ4RytUcjhXUnlIUDJidXoz?=
 =?utf-8?B?VzN2c3k1SlBhNEVtWUV0REZScG11VXdBYXc5a1FMb1NMdW0yTzMvWE1ETDMr?=
 =?utf-8?B?ODcyNHpoaXdqT2ZXMjlqZmxxamtvOW5JdlJRc3RtSWxYbUxYRGxSa1ROS0Vy?=
 =?utf-8?B?cEd3eUxFRkMvZWVqekxxYStOYzU1enlIZ2hoalJDVFlEd2FjampXN1FnbmVS?=
 =?utf-8?B?UEkwVkdSaU1DZ1lHNkwwQXRIdTFqeU9MK2ZoeTdYc2lDMXFpOTlvUHhLMGhj?=
 =?utf-8?B?SGtQWStHMERKN0ErclUwWUYxamR5SjVVb2VhR3doUTRndmxuUkJ6ZEpGc0Fv?=
 =?utf-8?B?MVo2bVZ1a0RaRUoyZXlqQy9JaG9uOS9ZNkFROXZJd3F1TmZLOG9oL3ZRMHBn?=
 =?utf-8?B?NitRSHpaNEZuUWQxd0Y5c1pBU0kxNThaUEZLQXZWV3JiRENwcnVNY08rOVdp?=
 =?utf-8?B?N1NEWUVnd3BpMVk1MWI3dTdKUzZhVUROUm5vSUtWcVR6MFRHRmp0enpiWkFX?=
 =?utf-8?B?ajIyL2haM09aYlJlQnVnR2lQeFFTbnIrQmhNNm9GQnpYaWN4SXlnNzYzbFdX?=
 =?utf-8?B?TlNVMFBrajZHOCtQSHk1OVRRU0xJTjV0MUpaZ0NRUVZaM3BiV1RGQ0thVDJL?=
 =?utf-8?B?eU05L0VRaHVnSzgrcmR5VTZYWWpTSzRwRlRqaVNkK1YvTThYYVhUV2s4MUNL?=
 =?utf-8?B?WU5ML2hJTlFEeWVWd21iemVLajZreGVHVkxrK3J0SkkxK21tdTg2VlBFcFNU?=
 =?utf-8?B?cVMxcDI2dC9ZUEdwS0owVmxES3FVZEFZbnkvY012am5pWWo0TGhPMWlyc3gz?=
 =?utf-8?B?SGVGdzBMeGI5NmVYUVp3WkRpTis1cnBLOGtHYmJLcStwU3kwbnYwYWxrNFRH?=
 =?utf-8?Q?XWjWGU1AOEKsO4+6BD2syDYCm?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd556f9a-e1b2-4d95-3535-08dc9b3fec28
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 09:10:03.1605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TD+HZxqNqfS2Hmk6f4L9Qc9vXBxCPCIFHtWrFc3Ej0Oe8FA6+czqMb7tjB3t5GFPajeLLgWYME1ySSkfPmTYMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5273
X-Proofpoint-GUID: fl3Sp8LqKJvVpeBVaGE6K7iO7hBtsssV
X-Proofpoint-ORIG-GUID: 4vwDALL-VBBsIHX4Eky-btYvR-qWl8XP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_05,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 clxscore=1011 spamscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407030067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 09:10:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201461

The https://github.com/openssl/openssl/pull/24717 has 16 commits. You're 
backporting the first 10. Are the remaining 6 needed?

Regards,
Qi

On 7/3/24 01:11, Siddharth Doshi via lists.openembedded.org wrote:
> From: Siddharth Doshi <sdoshi@mvista.com>
>
> Upstream-Status: Backport from [https://github.com/openssl/openssl/commit/99fb785a5f85315b95288921a321a935ea29a51e]
>
> CVE's Fixed:
> CVE-2024-5535 openssl: SSL_select_next_proto buffer overread
>
> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> ---
>   .../openssl/openssl/CVE-2024-5535_1.patch     |  113 ++
>   .../openssl/openssl/CVE-2024-5535_10.patch    |  203 +++
>   .../openssl/openssl/CVE-2024-5535_2.patch     |   43 +
>   .../openssl/openssl/CVE-2024-5535_3.patch     |   38 +
>   .../openssl/openssl/CVE-2024-5535_4.patch     |   82 ++
>   .../openssl/openssl/CVE-2024-5535_5.patch     |  176 +++
>   .../openssl/openssl/CVE-2024-5535_6.patch     | 1173 +++++++++++++++++
>   .../openssl/openssl/CVE-2024-5535_7.patch     |   43 +
>   .../openssl/openssl/CVE-2024-5535_8.patch     |   66 +
>   .../openssl/openssl/CVE-2024-5535_9.patch     |  271 ++++
>   .../openssl/openssl_3.2.2.bb                  |   10 +
>   11 files changed, 2218 insertions(+)
>   create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_1.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_10.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_2.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_3.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_4.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_5.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_6.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_7.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_8.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_9.patch
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_1.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_1.patch
> new file mode 100644
> index 0000000000..d5c178eeab
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_1.patch
> @@ -0,0 +1,113 @@
> +From b63b4db52e10677db4ab46b608aabd55a44668aa Mon Sep 17 00:00:00 2001
> +From: Matt Caswell <matt@openssl.org>
> +Date: Fri, 31 May 2024 11:14:33 +0100
> +Subject: [PATCH 01/10] Fix SSL_select_next_proto
> +
> +Ensure that the provided client list is non-NULL and starts with a valid
> +entry. When called from the ALPN callback the client list should already
> +have been validated by OpenSSL so this should not cause a problem. When
> +called from the NPN callback the client list is locally configured and
> +will not have already been validated. Therefore SSL_select_next_proto
> +should not assume that it is correctly formatted.
> +
> +We implement stricter checking of the client protocol list. We also do the
> +same for the server list while we are about it.
> +
> +CVE-2024-5535
> +
> +Reviewed-by: Neil Horman <nhorman@openssl.org>
> +Reviewed-by: Tomas Mraz <tomas@openssl.org>
> +(Merged from https://github.com/openssl/openssl/pull/24717)
> +
> +Upstream-Status: Backport from [https://github.com/openssl/openssl/commit/99fb785a5f85315b95288921a321a935ea29a51e]
> +CVE: CVE-2024-5535
> +Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> +---
> + ssl/ssl_lib.c | 63 ++++++++++++++++++++++++++++++++-------------------
> + 1 file changed, 40 insertions(+), 23 deletions(-)
> +
> +diff --git a/ssl/ssl_lib.c b/ssl/ssl_lib.c
> +index 016135f..cf52b31 100644
> +--- a/ssl/ssl_lib.c
> ++++ b/ssl/ssl_lib.c
> +@@ -3518,37 +3518,54 @@ int SSL_select_next_proto(unsigned char **out, unsigned char *outlen,
> +                           unsigned int server_len,
> +                           const unsigned char *client, unsigned int client_len)
> + {
> +-    unsigned int i, j;
> +-    const unsigned char *result;
> +-    int status = OPENSSL_NPN_UNSUPPORTED;
> ++    PACKET cpkt, csubpkt, spkt, ssubpkt;
> ++
> ++    if (!PACKET_buf_init(&cpkt, client, client_len)
> ++            || !PACKET_get_length_prefixed_1(&cpkt, &csubpkt)
> ++            || PACKET_remaining(&csubpkt) == 0) {
> ++        *out = NULL;
> ++        *outlen = 0;
> ++        return OPENSSL_NPN_NO_OVERLAP;
> ++    }
> ++
> ++    /*
> ++     * Set the default opportunistic protocol. Will be overwritten if we find
> ++     * a match.
> ++     */
> ++    *out = (unsigned char *)PACKET_data(&csubpkt);
> ++    *outlen = (unsigned char)PACKET_remaining(&csubpkt);
> +
> +     /*
> +      * For each protocol in server preference order, see if we support it.
> +      */
> +-    for (i = 0; i < server_len;) {
> +-        for (j = 0; j < client_len;) {
> +-            if (server[i] == client[j] &&
> +-                memcmp(&server[i + 1], &client[j + 1], server[i]) == 0) {
> +-                /* We found a match */
> +-                result = &server[i];
> +-                status = OPENSSL_NPN_NEGOTIATED;
> +-                goto found;
> ++    if (PACKET_buf_init(&spkt, server, server_len)) {
> ++        while (PACKET_get_length_prefixed_1(&spkt, &ssubpkt)) {
> ++            if (PACKET_remaining(&ssubpkt) == 0)
> ++                continue; /* Invalid - ignore it */
> ++            if (PACKET_buf_init(&cpkt, client, client_len)) {
> ++                while (PACKET_get_length_prefixed_1(&cpkt, &csubpkt)) {
> ++                    if (PACKET_equal(&csubpkt, PACKET_data(&ssubpkt),
> ++                                     PACKET_remaining(&ssubpkt))) {
> ++                        /* We found a match */
> ++                        *out = (unsigned char *)PACKET_data(&ssubpkt);
> ++                        *outlen = (unsigned char)PACKET_remaining(&ssubpkt);
> ++                        return OPENSSL_NPN_NEGOTIATED;
> ++                    }
> ++                }
> ++                /* Ignore spurious trailing bytes in the client list */
> ++            } else {
> ++                /* This should never happen */
> ++                return OPENSSL_NPN_NO_OVERLAP;
> +             }
> +-            j += client[j];
> +-            j++;
> +         }
> +-        i += server[i];
> +-        i++;
> ++        /* Ignore spurious trailing bytes in the server list */
> +     }
> +
> +-    /* There's no overlap between our protocols and the server's list. */
> +-    result = client;
> +-    status = OPENSSL_NPN_NO_OVERLAP;
> +-
> +- found:
> +-    *out = (unsigned char *)result + 1;
> +-    *outlen = result[0];
> +-    return status;
> ++    /*
> ++     * There's no overlap between our protocols and the server's list. We use
> ++     * the default opportunistic protocol selected earlier
> ++     */
> ++    return OPENSSL_NPN_NO_OVERLAP;
> + }
> +
> + #ifndef OPENSSL_NO_NEXTPROTONEG
> +--
> +2.44.0
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_10.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_10.patch
> new file mode 100644
> index 0000000000..7cc36f20ab
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_10.patch
> @@ -0,0 +1,203 @@
> +From 61cad53901703944d22f1cd6a1b57460f2270599 Mon Sep 17 00:00:00 2001
> +From: Matt Caswell <matt@openssl.org>
> +Date: Fri, 21 Jun 2024 14:29:26 +0100
> +Subject: [PATCH 10/10] Add a test for an empty NextProto message
> +
> +It is valid according to the spec for a NextProto message to have no
> +protocols listed in it. The OpenSSL implementation however does not allow
> +us to create such a message. In order to check that we work as expected
> +when communicating with a client that does generate such messages we have
> +to use a TLSProxy test.
> +
> +Follow on from CVE-2024-5535
> +
> +Reviewed-by: Neil Horman <nhorman@openssl.org>
> +Reviewed-by: Tomas Mraz <tomas@openssl.org>
> +(Merged from https://github.com/openssl/openssl/pull/24717)
> +
> +Upstream-Status: Backport from [https://github.com/openssl/openssl/commit/301b870546d1c7b2d8f0d66e04a2596142f0399f]
> +CVE: CVE-2024-5535
> +Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> +---
> + test/recipes/70-test_npn.t      | 73 +++++++++++++++++++++++++++++++++
> + util/perl/TLSProxy/Message.pm   |  9 ++++
> + util/perl/TLSProxy/NextProto.pm | 54 ++++++++++++++++++++++++
> + util/perl/TLSProxy/Proxy.pm     |  1 +
> + 4 files changed, 137 insertions(+)
> + create mode 100644 test/recipes/70-test_npn.t
> + create mode 100644 util/perl/TLSProxy/NextProto.pm
> +
> +diff --git a/test/recipes/70-test_npn.t b/test/recipes/70-test_npn.t
> +new file mode 100644
> +index 0000000..f82e71a
> +--- /dev/null
> ++++ b/test/recipes/70-test_npn.t
> +@@ -0,0 +1,73 @@
> ++#! /usr/bin/env perl
> ++# Copyright 2024 The OpenSSL Project Authors. All Rights Reserved.
> ++#
> ++# Licensed under the Apache License 2.0 (the "License").  You may not use
> ++# this file except in compliance with the License.  You can obtain a copy
> ++# in the file LICENSE in the source distribution or at
> ++# https://www.openssl.org/source/license.html
> ++
> ++use strict;
> ++use OpenSSL::Test qw/:DEFAULT cmdstr srctop_file/;
> ++use OpenSSL::Test::Utils;
> ++
> ++use TLSProxy::Proxy;
> ++
> ++my $test_name = "test_npn";
> ++setup($test_name);
> ++
> ++plan skip_all => "TLSProxy isn't usable on $^O"
> ++    if $^O =~ /^(VMS)$/;
> ++
> ++plan skip_all => "$test_name needs the dynamic engine feature enabled"
> ++    if disabled("engine") || disabled("dynamic-engine");
> ++
> ++plan skip_all => "$test_name needs the sock feature enabled"
> ++    if disabled("sock");
> ++
> ++plan skip_all => "$test_name needs NPN enabled"
> ++    if disabled("nextprotoneg");
> ++
> ++plan skip_all => "$test_name needs TLSv1.2 enabled"
> ++    if disabled("tls1_2");
> ++
> ++my $proxy = TLSProxy::Proxy->new(
> ++    undef,
> ++    cmdstr(app(["openssl"]), display => 1),
> ++    srctop_file("apps", "server.pem"),
> ++    (!$ENV{HARNESS_ACTIVE} || $ENV{HARNESS_VERBOSE})
> ++);
> ++
> ++$proxy->start() or plan skip_all => "Unable to start up Proxy for tests";
> ++plan tests => 1;
> ++
> ++my $npnseen = 0;
> ++
> ++# Test 1: Check sending an empty NextProto message from the client works. This is
> ++#         valid as per the spec, but OpenSSL does not allow you to send it.
> ++#         Therefore we must be prepared to receive such a message but we cannot
> ++#         generate it except via TLSProxy
> ++$proxy->clear();
> ++$proxy->filter(\&npn_filter);
> ++$proxy->clientflags("-nextprotoneg foo -no_tls1_3");
> ++$proxy->serverflags("-nextprotoneg foo");
> ++$proxy->start();
> ++ok($npnseen && TLSProxy::Message->success(), "Empty NPN message");
> ++
> ++sub npn_filter
> ++{
> ++    my $proxy = shift;
> ++    my $message;
> ++
> ++    # The NextProto message always appears in flight 2
> ++    return if $proxy->flight != 2;
> ++
> ++    foreach my $message (@{$proxy->message_list}) {
> ++        if ($message->mt == TLSProxy::Message::MT_NEXT_PROTO) {
> ++            # Our TLSproxy NextProto message support doesn't support parsing of
> ++            # the message. If we repack it just creates an empty NextProto
> ++            # message - which is exactly the scenario we want to test here.
> ++            $message->repack();
> ++            $npnseen = 1;
> ++        }
> ++    }
> ++}
> +diff --git a/util/perl/TLSProxy/Message.pm b/util/perl/TLSProxy/Message.pm
> +index ce22187..fb41b2f 100644
> +--- a/util/perl/TLSProxy/Message.pm
> ++++ b/util/perl/TLSProxy/Message.pm
> +@@ -384,6 +384,15 @@ sub create_message
> +             [@message_frag_lens]
> +         );
> +         $message->parse();
> ++    }  elsif ($mt == MT_NEXT_PROTO) {
> ++        $message = TLSProxy::NextProto->new(
> ++            $server,
> ++            $data,
> ++            [@message_rec_list],
> ++            $startoffset,
> ++            [@message_frag_lens]
> ++        );
> ++        $message->parse();
> +     } else {
> +         #Unknown message type
> +         $message = TLSProxy::Message->new(
> +diff --git a/util/perl/TLSProxy/NextProto.pm b/util/perl/TLSProxy/NextProto.pm
> +new file mode 100644
> +index 0000000..0e18347
> +--- /dev/null
> ++++ b/util/perl/TLSProxy/NextProto.pm
> +@@ -0,0 +1,54 @@
> ++# Copyright 2024 The OpenSSL Project Authors. All Rights Reserved.
> ++#
> ++# Licensed under the Apache License 2.0 (the "License").  You may not use
> ++# this file except in compliance with the License.  You can obtain a copy
> ++# in the file LICENSE in the source distribution or at
> ++# https://www.openssl.org/source/license.html
> ++
> ++use strict;
> ++
> ++package TLSProxy::NextProto;
> ++
> ++use vars '@ISA';
> ++push @ISA, 'TLSProxy::Message';
> ++
> ++sub new
> ++{
> ++    my $class = shift;
> ++    my ($server,
> ++        $data,
> ++        $records,
> ++        $startoffset,
> ++        $message_frag_lens) = @_;
> ++
> ++    my $self = $class->SUPER::new(
> ++        $server,
> ++        TLSProxy::Message::MT_NEXT_PROTO,
> ++        $data,
> ++        $records,
> ++        $startoffset,
> ++        $message_frag_lens);
> ++
> ++    return $self;
> ++}
> ++
> ++sub parse
> ++{
> ++    # We don't support parsing at the moment
> ++}
> ++
> ++# This is supposed to reconstruct the on-the-wire message data following changes.
> ++# For now though since we don't support parsing we just create an empty NextProto
> ++# message - this capability is used in test_npn
> ++sub set_message_contents
> ++{
> ++    my $self = shift;
> ++    my $data;
> ++
> ++    $data = pack("C32", 0x00, 0x1e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> ++                 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> ++                 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> ++                 0x00, 0x00, 0x00);
> ++    $self->data($data);
> ++}
> ++1;
> +diff --git a/util/perl/TLSProxy/Proxy.pm b/util/perl/TLSProxy/Proxy.pm
> +index 3de10ec..b707722 100644
> +--- a/util/perl/TLSProxy/Proxy.pm
> ++++ b/util/perl/TLSProxy/Proxy.pm
> +@@ -23,6 +23,7 @@ use TLSProxy::CertificateRequest;
> + use TLSProxy::CertificateVerify;
> + use TLSProxy::ServerKeyExchange;
> + use TLSProxy::NewSessionTicket;
> ++use TLSProxy::NextProto;
> +
> + my $have_IPv6;
> + my $IP_factory;
> +--
> +2.44.0
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_2.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_2.patch
> new file mode 100644
> index 0000000000..768304f00b
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_2.patch
> @@ -0,0 +1,43 @@
> +From 6de1d37cd129b0af5b4a247c76f97b98e70b108b Mon Sep 17 00:00:00 2001
> +From: Matt Caswell <matt@openssl.org>
> +Date: Fri, 31 May 2024 11:18:27 +0100
> +Subject: [PATCH 02/10] More correctly handle a selected_len of 0 when
> + processing NPN
> +
> +In the case where the NPN callback returns with SSL_TLEXT_ERR_OK, but
> +the selected_len is 0 we should fail. Previously this would fail with an
> +internal_error alert because calling OPENSSL_malloc(selected_len) will
> +return NULL when selected_len is 0. We make this error detection more
> +explicit and return a handshake failure alert.
> +
> +Follow on from CVE-2024-5535
> +
> +Reviewed-by: Neil Horman <nhorman@openssl.org>
> +Reviewed-by: Tomas Mraz <tomas@openssl.org>
> +(Merged from https://github.com/openssl/openssl/pull/24717)
> +
> +Upstream-Status: Backport from [https://github.com/openssl/openssl/commit/015255851371757d54c2560643eb3b3a88123cf1]
> +CVE: CVE-2024-5535
> +Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> +---
> + ssl/statem/extensions_clnt.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/ssl/statem/extensions_clnt.c b/ssl/statem/extensions_clnt.c
> +index 381a6c9..1ab3c13 100644
> +--- a/ssl/statem/extensions_clnt.c
> ++++ b/ssl/statem/extensions_clnt.c
> +@@ -1560,8 +1560,8 @@ int tls_parse_stoc_npn(SSL_CONNECTION *s, PACKET *pkt, unsigned int context,
> +     if (sctx->ext.npn_select_cb(SSL_CONNECTION_GET_SSL(s),
> +                                 &selected, &selected_len,
> +                                 PACKET_data(pkt), PACKET_remaining(pkt),
> +-                                sctx->ext.npn_select_cb_arg) !=
> +-             SSL_TLSEXT_ERR_OK) {
> ++                                sctx->ext.npn_select_cb_arg) != SSL_TLSEXT_ERR_OK
> ++            || selected_len == 0) {
> +         SSLfatal(s, SSL_AD_HANDSHAKE_FAILURE, SSL_R_BAD_EXTENSION);
> +         return 0;
> +     }
> +--
> +2.44.0
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_3.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_3.patch
> new file mode 100644
> index 0000000000..d6d4d869be
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_3.patch
> @@ -0,0 +1,38 @@
> +From 4f9334a33da89949f97927c8fe7df1003c42cda4 Mon Sep 17 00:00:00 2001
> +From: Matt Caswell <matt@openssl.org>
> +Date: Fri, 31 May 2024 11:22:13 +0100
> +Subject: [PATCH 03/10] Use correctly formatted ALPN data in tserver
> +
> +The QUIC test server was using incorrectly formatted ALPN data. With the
> +previous implementation of SSL_select_next_proto this went unnoticed. With
> +the new stricter implemenation it was failing.
> +
> +Follow on from CVE-2024-5535
> +
> +Reviewed-by: Neil Horman <nhorman@openssl.org>
> +Reviewed-by: Tomas Mraz <tomas@openssl.org>
> +(Merged from https://github.com/openssl/openssl/pull/24717)
> +
> +Upstream-Status: Backport from [https://github.com/openssl/openssl/commit/6cc511826f09e513b4ec066d9b95acaf4f86d991]
> +CVE: CVE-2024-5535
> +Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> +---
> + ssl/quic/quic_tserver.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/ssl/quic/quic_tserver.c b/ssl/quic/quic_tserver.c
> +index 86187d0..15694e7 100644
> +--- a/ssl/quic/quic_tserver.c
> ++++ b/ssl/quic/quic_tserver.c
> +@@ -58,7 +58,7 @@ static int alpn_select_cb(SSL *ssl, const unsigned char **out,
> +
> +     if (srv->args.alpn == NULL) {
> +         alpn = alpndeflt;
> +-        alpnlen = sizeof(alpn);
> ++        alpnlen = sizeof(alpndeflt);
> +     } else {
> +         alpn = srv->args.alpn;
> +         alpnlen = srv->args.alpnlen;
> +--
> +2.44.0
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_4.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_4.patch
> new file mode 100644
> index 0000000000..03fc1168f9
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_4.patch
> @@ -0,0 +1,82 @@
> +From 5145a1f50e44c9f86127a76f01519a9f25157290 Mon Sep 17 00:00:00 2001
> +From: Matt Caswell <matt@openssl.org>
> +Date: Fri, 31 May 2024 11:46:38 +0100
> +Subject: [PATCH 04/10] Clarify the SSL_select_next_proto() documentation
> +
> +We clarify the input preconditions and the expected behaviour in the event
> +of no overlap.
> +
> +Follow on from CVE-2024-5535
> +
> +Reviewed-by: Neil Horman <nhorman@openssl.org>
> +Reviewed-by: Tomas Mraz <tomas@openssl.org>
> +(Merged from https://github.com/openssl/openssl/pull/24717)
> +
> +Upstream-Status: Backport from [https://github.com/openssl/openssl/commit/8e81c57adbbf703dfb63955f65599765fdacc741]
> +CVE: CVE-2024-5535
> +Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> +---
> + doc/man3/SSL_CTX_set_alpn_select_cb.pod | 26 +++++++++++++++++--------
> + 1 file changed, 18 insertions(+), 8 deletions(-)
> +
> +diff --git a/doc/man3/SSL_CTX_set_alpn_select_cb.pod b/doc/man3/SSL_CTX_set_alpn_select_cb.pod
> +index 05fee2f..79e1a25 100644
> +--- a/doc/man3/SSL_CTX_set_alpn_select_cb.pod
> ++++ b/doc/man3/SSL_CTX_set_alpn_select_cb.pod
> +@@ -52,7 +52,8 @@ SSL_select_next_proto, SSL_get0_alpn_selected, SSL_get0_next_proto_negotiated
> + SSL_CTX_set_alpn_protos() and SSL_set_alpn_protos() are used by the client to
> + set the list of protocols available to be negotiated. The B<protos> must be in
> + protocol-list format, described below. The length of B<protos> is specified in
> +-B<protos_len>.
> ++B<protos_len>. Setting B<protos_len> to 0 clears any existing list of ALPN
> ++protocols and no ALPN extension will be sent to the server.
> +
> + SSL_CTX_set_alpn_select_cb() sets the application callback B<cb> used by a
> + server to select which protocol to use for the incoming connection. When B<cb>
> +@@ -73,9 +74,16 @@ B<server_len> and B<client>, B<client_len> must be in the protocol-list format
> + described below. The first item in the B<server>, B<server_len> list that
> + matches an item in the B<client>, B<client_len> list is selected, and returned
> + in B<out>, B<outlen>. The B<out> value will point into either B<server> or
> +-B<client>, so it should be copied immediately. If no match is found, the first
> +-item in B<client>, B<client_len> is returned in B<out>, B<outlen>. This
> +-function can also be used in the NPN callback.
> ++B<client>, so it should be copied immediately. The client list must include at
> ++least one valid (nonempty) protocol entry in the list.
> ++
> ++The SSL_select_next_proto() helper function can be useful from either the ALPN
> ++callback or the NPN callback (described below). If no match is found, the first
> ++item in B<client>, B<client_len> is returned in B<out>, B<outlen> and
> ++B<OPENSSL_NPN_NO_OVERLAP> is returned. This can be useful when implementating
> ++the NPN callback. In the ALPN case, the value returned in B<out> and B<outlen>
> ++must be ignored if B<OPENSSL_NPN_NO_OVERLAP> has been returned from
> ++SSL_select_next_proto().
> +
> + SSL_CTX_set_next_proto_select_cb() sets a callback B<cb> that is called when a
> + client needs to select a protocol from the server's provided list, and a
> +@@ -85,9 +93,10 @@ must be set to point to the selected protocol (which may be within B<in>).
> + The length of the protocol name must be written into B<outlen>. The
> + server's advertised protocols are provided in B<in> and B<inlen>. The
> + callback can assume that B<in> is syntactically valid. The client must
> +-select a protocol. It is fatal to the connection if this callback returns
> +-a value other than B<SSL_TLSEXT_ERR_OK>. The B<arg> parameter is the pointer
> +-set via SSL_CTX_set_next_proto_select_cb().
> ++select a protocol (although it may be an empty, zero length protocol). It is
> ++fatal to the connection if this callback returns a value other than
> ++B<SSL_TLSEXT_ERR_OK> or if the zero length protocol is selected. The B<arg>
> ++parameter is the pointer set via SSL_CTX_set_next_proto_select_cb().
> +
> + SSL_CTX_set_next_protos_advertised_cb() sets a callback B<cb> that is called
> + when a TLS server needs a list of supported protocols for Next Protocol
> +@@ -154,7 +163,8 @@ A match was found and is returned in B<out>, B<outlen>.
> + =item OPENSSL_NPN_NO_OVERLAP
> +
> + No match was found. The first item in B<client>, B<client_len> is returned in
> +-B<out>, B<outlen>.
> ++B<out>, B<outlen> (or B<NULL> and 0 in the case where the first entry in
> ++B<client> is invalid).
> +
> + =back
> +
> +--
> +2.44.0
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_5.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_5.patch
> new file mode 100644
> index 0000000000..e439d9b59a
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_5.patch
> @@ -0,0 +1,176 @@
> +From 01d44bc7f50670002cad495654fd99a6371d7662 Mon Sep 17 00:00:00 2001
> +From: Matt Caswell <matt@openssl.org>
> +Date: Fri, 31 May 2024 16:35:16 +0100
> +Subject: [PATCH 05/10] Add a test for SSL_select_next_proto
> +
> +Follow on from CVE-2024-5535
> +
> +Reviewed-by: Neil Horman <nhorman@openssl.org>
> +Reviewed-by: Tomas Mraz <tomas@openssl.org>
> +(Merged from https://github.com/openssl/openssl/pull/24717)
> +
> +Upstream-Status: Backport from [https://github.com/openssl/openssl/commit/add5c52a25c549cec4a730cdf96e2252f0a1862d]
> +CVE: CVE-2024-5535
> +Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> +---
> + test/sslapitest.c | 137 ++++++++++++++++++++++++++++++++++++++++++++++
> + 1 file changed, 137 insertions(+)
> +
> +diff --git a/test/sslapitest.c b/test/sslapitest.c
> +index ce16332..15cb906 100644
> +--- a/test/sslapitest.c
> ++++ b/test/sslapitest.c
> +@@ -11741,6 +11741,142 @@ static int test_multi_resume(int idx)
> +     return testresult;
> + }
> +
> ++static struct next_proto_st {
> ++    int serverlen;
> ++    unsigned char server[40];
> ++    int clientlen;
> ++    unsigned char client[40];
> ++    int expected_ret;
> ++    size_t selectedlen;
> ++    unsigned char selected[40];
> ++} next_proto_tests[] = {
> ++    {
> ++        4, { 3, 'a', 'b', 'c' },
> ++        4, { 3, 'a', 'b', 'c' },
> ++        OPENSSL_NPN_NEGOTIATED,
> ++        3, { 'a', 'b', 'c' }
> ++    },
> ++    {
> ++        7, { 3, 'a', 'b', 'c', 2, 'a', 'b' },
> ++        4, { 3, 'a', 'b', 'c' },
> ++        OPENSSL_NPN_NEGOTIATED,
> ++        3, { 'a', 'b', 'c' }
> ++    },
> ++    {
> ++        7, { 2, 'a', 'b', 3, 'a', 'b', 'c', },
> ++        4, { 3, 'a', 'b', 'c' },
> ++        OPENSSL_NPN_NEGOTIATED,
> ++        3, { 'a', 'b', 'c' }
> ++    },
> ++    {
> ++        4, { 3, 'a', 'b', 'c' },
> ++        7, { 3, 'a', 'b', 'c', 2, 'a', 'b', },
> ++        OPENSSL_NPN_NEGOTIATED,
> ++        3, { 'a', 'b', 'c' }
> ++    },
> ++    {
> ++        4, { 3, 'a', 'b', 'c' },
> ++        7, { 2, 'a', 'b', 3, 'a', 'b', 'c'},
> ++        OPENSSL_NPN_NEGOTIATED,
> ++        3, { 'a', 'b', 'c' }
> ++    },
> ++    {
> ++        7, { 2, 'b', 'c', 3, 'a', 'b', 'c' },
> ++        7, { 2, 'a', 'b', 3, 'a', 'b', 'c'},
> ++        OPENSSL_NPN_NEGOTIATED,
> ++        3, { 'a', 'b', 'c' }
> ++    },
> ++    {
> ++        10, { 2, 'b', 'c', 3, 'a', 'b', 'c', 2, 'a', 'b' },
> ++        7, { 2, 'a', 'b', 3, 'a', 'b', 'c'},
> ++        OPENSSL_NPN_NEGOTIATED,
> ++        3, { 'a', 'b', 'c' }
> ++    },
> ++    {
> ++        4, { 3, 'b', 'c', 'd' },
> ++        4, { 3, 'a', 'b', 'c' },
> ++        OPENSSL_NPN_NO_OVERLAP,
> ++        3, { 'a', 'b', 'c' }
> ++    },
> ++    {
> ++        0, { 0 },
> ++        4, { 3, 'a', 'b', 'c' },
> ++        OPENSSL_NPN_NO_OVERLAP,
> ++        3, { 'a', 'b', 'c' }
> ++    },
> ++    {
> ++        -1, { 0 },
> ++        4, { 3, 'a', 'b', 'c' },
> ++        OPENSSL_NPN_NO_OVERLAP,
> ++        3, { 'a', 'b', 'c' }
> ++    },
> ++    {
> ++        4, { 3, 'a', 'b', 'c' },
> ++        0, { 0 },
> ++        OPENSSL_NPN_NO_OVERLAP,
> ++        0, { 0 }
> ++    },
> ++    {
> ++        4, { 3, 'a', 'b', 'c' },
> ++        -1, { 0 },
> ++        OPENSSL_NPN_NO_OVERLAP,
> ++        0, { 0 }
> ++    },
> ++    {
> ++        3, { 3, 'a', 'b', 'c' },
> ++        4, { 3, 'a', 'b', 'c' },
> ++        OPENSSL_NPN_NO_OVERLAP,
> ++        3, { 'a', 'b', 'c' }
> ++    },
> ++    {
> ++        4, { 3, 'a', 'b', 'c' },
> ++        3, { 3, 'a', 'b', 'c' },
> ++        OPENSSL_NPN_NO_OVERLAP,
> ++        0, { 0 }
> ++    }
> ++};
> ++
> ++static int test_select_next_proto(int idx)
> ++{
> ++    struct next_proto_st *np = &next_proto_tests[idx];
> ++    int ret = 0;
> ++    unsigned char *out, *client, *server;
> ++    unsigned char outlen;
> ++    unsigned int clientlen, serverlen;
> ++
> ++    if (np->clientlen == -1) {
> ++        client = NULL;
> ++        clientlen = 0;
> ++    } else {
> ++        client = np->client;
> ++        clientlen = (unsigned int)np->clientlen;
> ++    }
> ++    if (np->serverlen == -1) {
> ++        server = NULL;
> ++        serverlen = 0;
> ++    } else {
> ++        server = np->server;
> ++        serverlen = (unsigned int)np->serverlen;
> ++    }
> ++
> ++    if (!TEST_int_eq(SSL_select_next_proto(&out, &outlen, server, serverlen,
> ++                                           client, clientlen),
> ++                     np->expected_ret))
> ++        goto err;
> ++
> ++    if (np->selectedlen == 0) {
> ++        if (!TEST_ptr_null(out) || !TEST_uchar_eq(outlen, 0))
> ++            goto err;
> ++    } else {
> ++        if (!TEST_mem_eq(out, outlen, np->selected, np->selectedlen))
> ++            goto err;
> ++    }
> ++
> ++    ret = 1;
> ++ err:
> ++    return ret;
> ++}
> ++
> + OPT_TEST_DECLARE_USAGE("certfile privkeyfile srpvfile tmpfile provider config dhfile\n")
> +
> + int setup_tests(void)
> +@@ -12053,6 +12189,7 @@ int setup_tests(void)
> +     ADD_ALL_TESTS(test_handshake_retry, 16);
> +     ADD_TEST(test_data_retry);
> +     ADD_ALL_TESTS(test_multi_resume, 5);
> ++    ADD_ALL_TESTS(test_select_next_proto, OSSL_NELEM(next_proto_tests));
> +     return 1;
> +
> +  err:
> +--
> +2.44.0
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_6.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_6.patch
> new file mode 100644
> index 0000000000..df24702fa6
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_6.patch
> @@ -0,0 +1,1173 @@
> +From e344d0b5860560ffa59415ea4028ba7760b2a773 Mon Sep 17 00:00:00 2001
> +From: Matt Caswell <matt@openssl.org>
> +Date: Tue, 4 Jun 2024 15:47:32 +0100
> +Subject: [PATCH 06/10] Allow an empty NPN/ALPN protocol list in the tests
> +
> +Allow ourselves to configure an empty NPN/ALPN protocol list and test what
> +happens if we do.
> +
> +Follow on from CVE-2024-5535
> +
> +Reviewed-by: Neil Horman <nhorman@openssl.org>
> +Reviewed-by: Tomas Mraz <tomas@openssl.org>
> +(Merged from https://github.com/openssl/openssl/pull/24717)
> +
> +Upstream-Status: Backport from [https://github.com/openssl/openssl/commit/7ea1f6a85b299b976cb3f756b2a7f0153f31b2b6]
> +CVE: CVE-2024-5535
> +Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> +---
> + test/helpers/handshake.c      |   6 +
> + test/ssl-tests/08-npn.cnf     | 553 +++++++++++++++++++---------------
> + test/ssl-tests/08-npn.cnf.in  |  35 +++
> + test/ssl-tests/09-alpn.cnf    |  66 +++-
> + test/ssl-tests/09-alpn.cnf.in |  33 ++
> + 5 files changed, 449 insertions(+), 244 deletions(-)
> +
> +diff --git a/test/helpers/handshake.c b/test/helpers/handshake.c
> +index ae2ad59..b66b2f5 100644
> +--- a/test/helpers/handshake.c
> ++++ b/test/helpers/handshake.c
> +@@ -444,6 +444,12 @@ static int parse_protos(const char *protos, unsigned char **out, size_t *outlen)
> +
> +     len = strlen(protos);
> +
> ++    if (len == 0) {
> ++        *out = NULL;
> ++        *outlen = 0;
> ++        return 1;
> ++    }
> ++
> +     /* Should never have reuse. */
> +     if (!TEST_ptr_null(*out)
> +             /* Test values are small, so we omit length limit checks. */
> +diff --git a/test/ssl-tests/08-npn.cnf b/test/ssl-tests/08-npn.cnf
> +index f38b3f6..1931d02 100644
> +--- a/test/ssl-tests/08-npn.cnf
> ++++ b/test/ssl-tests/08-npn.cnf
> +@@ -1,6 +1,6 @@
> + # Generated with generate_ssl_tests.pl
> +
> +-num_tests = 20
> ++num_tests = 22
> +
> + test-0 = 0-npn-simple
> + test-1 = 1-npn-client-finds-match
> +@@ -8,20 +8,22 @@ test-2 = 2-npn-client-honours-server-pref
> + test-3 = 3-npn-client-first-pref-on-mismatch
> + test-4 = 4-npn-no-server-support
> + test-5 = 5-npn-no-client-support
> +-test-6 = 6-npn-with-sni-no-context-switch
> +-test-7 = 7-npn-with-sni-context-switch
> +-test-8 = 8-npn-selected-sni-server-supports-npn
> +-test-9 = 9-npn-selected-sni-server-does-not-support-npn
> +-test-10 = 10-alpn-preferred-over-npn
> +-test-11 = 11-sni-npn-preferred-over-alpn
> +-test-12 = 12-npn-simple-resumption
> +-test-13 = 13-npn-server-switch-resumption
> +-test-14 = 14-npn-client-switch-resumption
> +-test-15 = 15-npn-client-first-pref-on-mismatch-resumption
> +-test-16 = 16-npn-no-server-support-resumption
> +-test-17 = 17-npn-no-client-support-resumption
> +-test-18 = 18-alpn-preferred-over-npn-resumption
> +-test-19 = 19-npn-used-if-alpn-not-supported-resumption
> ++test-6 = 6-npn-empty-client-list
> ++test-7 = 7-npn-empty-server-list
> ++test-8 = 8-npn-with-sni-no-context-switch
> ++test-9 = 9-npn-with-sni-context-switch
> ++test-10 = 10-npn-selected-sni-server-supports-npn
> ++test-11 = 11-npn-selected-sni-server-does-not-support-npn
> ++test-12 = 12-alpn-preferred-over-npn
> ++test-13 = 13-sni-npn-preferred-over-alpn
> ++test-14 = 14-npn-simple-resumption
> ++test-15 = 15-npn-server-switch-resumption
> ++test-16 = 16-npn-client-switch-resumption
> ++test-17 = 17-npn-client-first-pref-on-mismatch-resumption
> ++test-18 = 18-npn-no-server-support-resumption
> ++test-19 = 19-npn-no-client-support-resumption
> ++test-20 = 20-alpn-preferred-over-npn-resumption
> ++test-21 = 21-npn-used-if-alpn-not-supported-resumption
> + # ===========================================================
> +
> + [0-npn-simple]
> +@@ -206,253 +208,318 @@ NPNProtocols = foo
> +
> + # ===========================================================
> +
> +-[6-npn-with-sni-no-context-switch]
> +-ssl_conf = 6-npn-with-sni-no-context-switch-ssl
> ++[6-npn-empty-client-list]
> ++ssl_conf = 6-npn-empty-client-list-ssl
> +
> +-[6-npn-with-sni-no-context-switch-ssl]
> +-server = 6-npn-with-sni-no-context-switch-server
> +-client = 6-npn-with-sni-no-context-switch-client
> +-server2 = 6-npn-with-sni-no-context-switch-server2
> ++[6-npn-empty-client-list-ssl]
> ++server = 6-npn-empty-client-list-server
> ++client = 6-npn-empty-client-list-client
> +
> +-[6-npn-with-sni-no-context-switch-server]
> ++[6-npn-empty-client-list-server]
> + Certificate = ${ENV::TEST_CERTS_DIR}/servercert.pem
> + CipherString = DEFAULT
> + PrivateKey = ${ENV::TEST_CERTS_DIR}/serverkey.pem
> +
> +-[6-npn-with-sni-no-context-switch-server2]
> ++[6-npn-empty-client-list-client]
> ++CipherString = DEFAULT
> ++MaxProtocol = TLSv1.2
> ++VerifyCAFile = ${ENV::TEST_CERTS_DIR}/rootcert.pem
> ++VerifyMode = Peer
> ++
> ++[test-6]
> ++ExpectedClientAlert = HandshakeFailure
> ++ExpectedResult = ClientFail
> ++server = 6-npn-empty-client-list-server-extra
> ++client = 6-npn-empty-client-list-client-extra
> ++
> ++[6-npn-empty-client-list-server-extra]
> ++NPNProtocols = foo
> ++
> ++[6-npn-empty-client-list-client-extra]
> ++NPNProtocols =
> ++
> ++
> ++# ===========================================================
> ++
> ++[7-npn-empty-server-list]
> ++ssl_conf = 7-npn-empty-server-list-ssl
> ++
> ++[7-npn-empty-server-list-ssl]
> ++server = 7-npn-empty-server-list-server
> ++client = 7-npn-empty-server-list-client
> ++
> ++[7-npn-empty-server-list-server]
> + Certificate = ${ENV::TEST_CERTS_DIR}/servercert.pem
> + CipherString = DEFAULT
> + PrivateKey = ${ENV::TEST_CERTS_DIR}/serverkey.pem
> +
> +-[6-npn-with-sni-no-context-switch-client]
> ++[7-npn-empty-server-list-client]
> + CipherString = DEFAULT
> + MaxProtocol = TLSv1.2
> + VerifyCAFile = ${ENV::TEST_CERTS_DIR}/rootcert.pem
> + VerifyMode = Peer
> +
> +-[test-6]
> ++[test-7]
> ++ExpectedNPNProtocol = foo
> ++server = 7-npn-empty-server-list-server-extra
> ++client = 7-npn-empty-server-list-client-extra
> ++
> ++[7-npn-empty-server-list-server-extra]
> ++NPNProtocols =
> ++
> ++[7-npn-empty-server-list-client-extra]
> ++NPNProtocols = foo
> ++
> ++
> ++# ===========================================================
> ++
> ++[8-npn-with-sni-no-context-switch]
> ++ssl_conf = 8-npn-with-sni-no-context-switch-ssl
> ++
> ++[8-npn-with-sni-no-context-switch-ssl]
> ++server = 8-npn-with-sni-no-context-switch-server
> ++client = 8-npn-with-sni-no-context-switch-client
> ++server2 = 8-npn-with-sni-no-context-switch-server2
> ++
> ++[8-npn-with-sni-no-context-switch-server]
> ++Certificate = ${ENV::TEST_CERTS_DIR}/servercert.pem
> ++CipherString = DEFAULT
> ++PrivateKey = ${ENV::TEST_CERTS_DIR}/serverkey.pem
> ++
> ++[8-npn-with-sni-no-context-switch-server2]
> ++Certificate = ${ENV::TEST_CERTS_DIR}/servercert.pem
> ++CipherString = DEFAULT
> ++PrivateKey = ${ENV::TEST_CERTS_DIR}/serverkey.pem
> ++
> ++[8-npn-with-sni-no-context-switch-client]
> ++CipherString = DEFAULT
> ++MaxProtocol = TLSv1.2
> ++VerifyCAFile = ${ENV::TEST_CERTS_DIR}/rootcert.pem
> ++VerifyMode = Peer
> ++
> ++[test-8]
> + ExpectedNPNProtocol = foo
> + ExpectedServerName = server1
> +-server = 6-npn-with-sni-no-context-switch-server-extra
> +-server2 = 6-npn-with-sni-no-context-switch-server2-extra
> +-client = 6-npn-with-sni-no-context-switch-client-extra
> ++server = 8-npn-with-sni-no-context-switch-server-extra
> ++server2 = 8-npn-with-sni-no-context-switch-server2-extra
> ++client = 8-npn-with-sni-no-context-switch-client-extra
> +
> +-[6-npn-with-sni-no-context-switch-server-extra]
> ++[8-npn-with-sni-no-context-switch-server-extra]
> + NPNProtocols = foo
> + ServerNameCallback = IgnoreMismatch
> +
> +-[6-npn-with-sni-no-context-switch-server2-extra]
> ++[8-npn-with-sni-no-context-switch-server2-extra]
> + NPNProtocols = bar
> +
> +-[6-npn-with-sni-no-context-switch-client-extra]
> ++[8-npn-with-sni-no-context-switch-client-extra]
> + NPNProtocols = foo,bar
> + ServerName = server1
> +
> +
> + # ===========================================================
> +
> +-[7-npn-with-sni-context-switch]
> +-ssl_conf = 7-npn-with-sni-context-switch-ssl
> ++[9-npn-with-sni-context-switch]
> ++ssl_conf = 9-npn-with-sni-context-switch-ssl
> +
> +-[7-npn-with-sni-context-switch-ssl]
> +-server = 7-npn-with-sni-context-switch-server
> +-client = 7-npn-with-sni-context-switch-client
> +-server2 = 7-npn-with-sni-context-switch-server2
> ++[9-npn-with-sni-context-switch-ssl]
> ++server = 9-npn-with-sni-context-switch-server
> ++client = 9-npn-with-sni-context-switch-client
> ++server2 = 9-npn-with-sni-context-switch-server2
> +
> +-[7-npn-with-sni-context-switch-server]
> ++[9-npn-with-sni-context-switch-server]
> + Certificate = ${ENV::TEST_CERTS_DIR}/servercert.pem
> + CipherString = DEFAULT
> + PrivateKey = ${ENV::TEST_CERTS_DIR}/serverkey.pem
> +
> +-[7-npn-with-sni-context-switch-server2]
> ++[9-npn-with-sni-context-switch-server2]
> + Certificate = ${ENV::TEST_CERTS_DIR}/servercert.pem
> + CipherString = DEFAULT
> + PrivateKey = ${ENV::TEST_CERTS_DIR}/serverkey.pem
> +
> +-[7-npn-with-sni-context-switch-client]
> ++[9-npn-with-sni-context-switch-client]
> + CipherString = DEFAULT
> + MaxProtocol = TLSv1.2
> + VerifyCAFile = ${ENV::TEST_CERTS_DIR}/rootcert.pem
> + VerifyMode = Peer
> +
> +-[test-7]
> ++[test-9]
> + ExpectedNPNProtocol = bar
> + ExpectedServerName = server2
> +-server = 7-npn-with-sni-context-switch-server-extra
> +-server2 = 7-npn-with-sni-context-switch-server2-extra
> +-client = 7-npn-with-sni-context-switch-client-extra
> ++server = 9-npn-with-sni-context-switch-server-extra
> ++server2 = 9-npn-with-sni-context-switch-server2-extra
> ++client = 9-npn-with-sni-context-switch-client-extra
> +
> +-[7-npn-with-sni-context-switch-server-extra]
> ++[9-npn-with-sni-context-switch-server-extra]
> + NPNProtocols = foo
> + ServerNameCallback = IgnoreMismatch
> +
> +-[7-npn-with-sni-context-switch-server2-extra]
> ++[9-npn-with-sni-context-switch-server2-extra]
> + NPNProtocols = bar
> +
> +-[7-npn-with-sni-context-switch-client-extra]
> ++[9-npn-with-sni-context-switch-client-extra]
> + NPNProtocols = foo,bar
> + ServerName = server2
> +
> +
> + # ===========================================================
> +
> +-[8-npn-selected-sni-server-supports-npn]
> +-ssl_conf = 8-npn-selected-sni-server-supports-npn-ssl
> ++[10-npn-selected-sni-server-supports-npn]
> ++ssl_conf = 10-npn-selected-sni-server-supports-npn-ssl
> +
> +-[8-npn-selected-sni-server-supports-npn-ssl]
> +-server = 8-npn-selected-sni-server-supports-npn-server
> +-client = 8-npn-selected-sni-server-supports-npn-client
> +-server2 = 8-npn-selected-sni-server-supports-npn-server2
> ++[10-npn-selected-sni-server-supports-npn-ssl]
> ++server = 10-npn-selected-sni-server-supports-npn-server
> ++client = 10-npn-selected-sni-server-supports-npn-client
> ++server2 = 10-npn-selected-sni-server-supports-npn-server2
> +
> +-[8-npn-selected-sni-server-supports-npn-server]
> ++[10-npn-selected-sni-server-supports-npn-server]
> + Certificate = ${ENV::TEST_CERTS_DIR}/servercert.pem
> + CipherString = DEFAULT
> + PrivateKey = ${ENV::TEST_CERTS_DIR}/serverkey.pem
> +
> +-[8-npn-selected-sni-server-supports-npn-server2]
> ++[10-npn-selected-sni-server-supports-npn-server2]
> + Certificate = ${ENV::TEST_CERTS_DIR}/servercert.pem
> + CipherString = DEFAULT
> + PrivateKey = ${ENV::TEST_CERTS_DIR}/serverkey.pem
> +
> +-[8-npn-selected-sni-server-supports-npn-client]
> ++[10-npn-selected-sni-server-supports-npn-client]
> + CipherString = DEFAULT
> + MaxProtocol = TLSv1.2
> + VerifyCAFile = ${ENV::TEST_CERTS_DIR}/rootcert.pem
> + VerifyMode = Peer
> +
> +-[test-8]
> ++[test-10]
> + ExpectedNPNProtocol = bar
> + ExpectedServerName = server2
> +-server = 8-npn-selected-sni-server-supports-npn-server-extra
> +-server2 = 8-npn-selected-sni-server-supports-npn-server2-extra
> +-client = 8-npn-selected-sni-server-supports-npn-client-extra
> ++server = 10-npn-selected-sni-server-supports-npn-server-extra
> ++server2 = 10-npn-selected-sni-server-supports-npn-server2-extra
> ++client = 10-npn-selected-sni-server-supports-npn-client-extra
> +
> +-[8-npn-selected-sni-server-supports-npn-server-extra]
> ++[10-npn-selected-sni-server-supports-npn-server-extra]
> + ServerNameCallback = IgnoreMismatch
> +
> +-[8-npn-selected-sni-server-supports-npn-server2-extra]
> ++[10-npn-selected-sni-server-supports-npn-server2-extra]
> + NPNProtocols = bar
> +
> +-[8-npn-selected-sni-server-supports-npn-client-extra]
> ++[10-npn-selected-sni-server-supports-npn-client-extra]
> + NPNProtocols = foo,bar
> + ServerName = server2
> +
> +
> + # ===========================================================
> +
> +-[9-npn-selected-sni-server-does-not-support-npn]
> +-ssl_conf = 9-npn-selected-sni-server-does-not-support-npn-ssl
> ++[11-npn-selected-sni-server-does-not-support-npn]
> ++ssl_conf = 11-npn-selected-sni-server-does-not-support-npn-ssl
> +
> +-[9-npn-selected-sni-server-does-not-support-npn-ssl]
> +-server = 9-npn-selected-sni-server-does-not-support-npn-server
> +-client = 9-npn-selected-sni-server-does-not-support-npn-client
> +-server2 = 9-npn-selected-sni-server-does-not-support-npn-server2
> ++[11-npn-selected-sni-server-does-not-support-npn-ssl]
> ++server = 11-npn-selected-sni-server-does-not-support-npn-server
> ++client = 11-npn-selected-sni-server-does-not-support-npn-client
> ++server2 = 11-npn-selected-sni-server-does-not-support-npn-server2
> +
> +-[9-npn-selected-sni-server-does-not-support-npn-server]
> ++[11-npn-selected-sni-server-does-not-support-npn-server]
> + Certificate = ${ENV::TEST_CERTS_DIR}/servercert.pem
> + CipherString = DEFAULT
> + PrivateKey = ${ENV::TEST_CERTS_DIR}/serverkey.pem
> +
> +-[9-npn-selected-sni-server-does-not-support-npn-server2]
> ++[11-npn-selected-sni-server-does-not-support-npn-server2]
> + Certificate = ${ENV::TEST_CERTS_DIR}/servercert.pem
> + CipherString = DEFAULT
> + PrivateKey = ${ENV::TEST_CERTS_DIR}/serverkey.pem
> +
> +-[9-npn-selected-sni-server-does-not-support-npn-client]
> ++[11-npn-selected-sni-server-does-not-support-npn-client]
> + CipherString = DEFAULT
> + MaxProtocol = TLSv1.2
> + VerifyCAFile = ${ENV::TEST_CERTS_DIR}/rootcert.pem
> + VerifyMode = Peer
> +
> +-[test-9]
> ++[test-11]
> + ExpectedServerName = server2
> +-server = 9-npn-selected-sni-server-does-not-support-npn-server-extra
> +-client = 9-npn-selected-sni-server-does-not-support-npn-client-extra
> ++server = 11-npn-selected-sni-server-does-not-support-npn-server-extra
> ++client = 11-npn-selected-sni-server-does-not-support-npn-client-extra
> +
> +-[9-npn-selected-sni-server-does-not-support-npn-server-extra]
> ++[11-npn-selected-sni-server-does-not-support-npn-server-extra]
> + NPNProtocols = bar
> + ServerNameCallback = IgnoreMismatch
> +
> +-[9-npn-selected-sni-server-does-not-support-npn-client-extra]
> ++[11-npn-selected-sni-server-does-not-support-npn-client-extra]
> + NPNProtocols = foo,bar
> + ServerName = server2
> +
> +
> + # ===========================================================
> +
> +-[10-alpn-preferred-over-npn]
> +-ssl_conf = 10-alpn-preferred-over-npn-ssl
> ++[12-alpn-preferred-over-npn]
> ++ssl_conf = 12-alpn-preferred-over-npn-ssl
> +
> +-[10-alpn-preferred-over-npn-ssl]
> +-server = 10-alpn-preferred-over-npn-server
> +-client = 10-alpn-preferred-over-npn-client
> ++[12-alpn-preferred-over-npn-ssl]
> ++server = 12-alpn-preferred-over-npn-server
> ++client = 12-alpn-preferred-over-npn-client
> +
> +-[10-alpn-preferred-over-npn-server]
> ++[12-alpn-preferred-over-npn-server]
> + Certificate = ${ENV::TEST_CERTS_DIR}/servercert.pem
> + CipherString = DEFAULT
> + PrivateKey = ${ENV::TEST_CERTS_DIR}/serverkey.pem
> +
> +-[10-alpn-preferred-over-npn-client]
> ++[12-alpn-preferred-over-npn-client]
> + CipherString = DEFAULT
> + MaxProtocol = TLSv1.2
> + VerifyCAFile = ${ENV::TEST_CERTS_DIR}/rootcert.pem
> + VerifyMode = Peer
> +
> +-[test-10]
> ++[test-12]
> + ExpectedALPNProtocol = foo
> +-server = 10-alpn-preferred-over-npn-server-extra
> +-client = 10-alpn-preferred-over-npn-client-extra
> ++server = 12-alpn-preferred-over-npn-server-extra
> ++client = 12-alpn-preferred-over-npn-client-extra
> +
> +-[10-alpn-preferred-over-npn-server-extra]
> ++[12-alpn-preferred-over-npn-server-extra]
> + ALPNProtocols = foo
> + NPNProtocols = bar
> +
> +-[10-alpn-preferred-over-npn-client-extra]
> ++[12-alpn-preferred-over-npn-client-extra]
> + ALPNProtocols = foo
> + NPNProtocols = bar
> +
> +
> + # ===========================================================
> +
> +-[11-sni-npn-preferred-over-alpn]
> +-ssl_conf = 11-sni-npn-preferred-over-alpn-ssl
> ++[13-sni-npn-preferred-over-alpn]
> ++ssl_conf = 13-sni-npn-preferred-over-alpn-ssl
> +
> +-[11-sni-npn-preferred-over-alpn-ssl]
> +-server = 11-sni-npn-preferred-over-alpn-server
> +-client = 11-sni-npn-preferred-over-alpn-client
> +-server2 = 11-sni-npn-preferred-over-alpn-server2
> ++[13-sni-npn-preferred-over-alpn-ssl]
> ++server = 13-sni-npn-preferred-over-alpn-server
> ++client = 13-sni-npn-preferred-over-alpn-client
> ++server2 = 13-sni-npn-preferred-over-alpn-server2
> +
> +-[11-sni-npn-preferred-over-alpn-server]
> ++[13-sni-npn-preferred-over-alpn-server]
> + Certificate = ${ENV::TEST_CERTS_DIR}/servercert.pem
> + CipherString = DEFAULT
> + PrivateKey = ${ENV::TEST_CERTS_DIR}/serverkey.pem
> +
> +-[11-sni-npn-preferred-over-alpn-server2]
> ++[13-sni-npn-preferred-over-alpn-server2]
> + Certificate = ${ENV::TEST_CERTS_DIR}/servercert.pem
> + CipherString = DEFAULT
> + PrivateKey = ${ENV::TEST_CERTS_DIR}/serverkey.pem
> +
> +-[11-sni-npn-preferred-over-alpn-client]
> ++[13-sni-npn-preferred-over-alpn-client]
> + CipherString = DEFAULT
> + MaxProtocol = TLSv1.2
> + VerifyCAFile = ${ENV::TEST_CERTS_DIR}/rootcert.pem
> + VerifyMode = Peer
> +
> +-[test-11]
> ++[test-13]
> + ExpectedNPNProtocol = bar
> + ExpectedServerName = server2
> +-server = 11-sni-npn-preferred-over-alpn-server-extra
> +-server2 = 11-sni-npn-preferred-over-alpn-server2-extra
> +-client = 11-sni-npn-preferred-over-alpn-client-extra
> ++server = 13-sni-npn-preferred-over-alpn-server-extra
> ++server2 = 13-sni-npn-preferred-over-alpn-server2-extra
> ++client = 13-sni-npn-preferred-over-alpn-client-extra
> +
> +-[11-sni-npn-preferred-over-alpn-server-extra]
> ++[13-sni-npn-preferred-over-alpn-server-extra]
> + ALPNProtocols = foo
> + ServerNameCallback = IgnoreMismatch
> +
> +-[11-sni-npn-preferred-over-alpn-server2-extra]
> ++[13-sni-npn-preferred-over-alpn-server2-extra]
> + NPNProtocols = bar
> +
> +-[11-sni-npn-preferred-over-alpn-client-extra]
> ++[13-sni-npn-preferred-over-alpn-client-extra]
> + ALPNProtocols = foo
> + NPNProtocols = bar
> + ServerName = server2
> +@@ -460,356 +527,356 @@ ServerName = server2
> +
> + # ===========================================================
> +
> +-[12-npn-simple-resumption]
> +-ssl_conf = 12-npn-simple-resumption-ssl
> ++[14-npn-simple-resumption]
> ++ssl_conf = 14-npn-simple-resumption-ssl
> +
> +-[12-npn-simple-resumption-ssl]
> +-server = 12-npn-simple-resumption-server
> +-client = 12-npn-simple-resumption-client
> +-resume-server = 12-npn-simple-resumption-server
> +-resume-client = 12-npn-simple-resumption-client
> ++[14-npn-simple-resumption-ssl]
> ++server = 14-npn-simple-resumption-server
> ++client = 14-npn-simple-resumption-client
> ++resume-server = 14-npn-simple-resumption-server
> ++resume-client = 14-npn-simple-resumption-client
> +
> +-[12-npn-simple-resumption-server]
> ++[14-npn-simple-resumption-server]
> + Certificate = ${ENV::TEST_CERTS_DIR}/servercert.pem
> + CipherString = DEFAULT
> + PrivateKey = ${ENV::TEST_CERTS_DIR}/serverkey.pem
> +
> +-[12-npn-simple-resumption-client]
> ++[14-npn-simple-resumption-client]
> + CipherString = DEFAULT
> + MaxProtocol = TLSv1.2
> + VerifyCAFile = ${ENV::TEST_CERTS_DIR}/rootcert.pem
> + VerifyMode = Peer
> +
> +-[test-12]
> ++[test-14]
> + ExpectedNPNProtocol = foo
> + HandshakeMode = Resume
> + ResumptionExpected = Yes
> +-server = 12-npn-simple-resumption-server-extra
> +-resume-server = 12-npn-simple-resumption-server-extra
> +-client = 12-npn-simple-resumption-client-extra
> +-resume-client = 12-npn-simple-resumption-client-extra
> ++server = 14-npn-simple-resumption-server-extra
> ++resume-server = 14-npn-simple-resumption-server-extra
> ++client = 14-npn-simple-resumption-client-extra
> ++resume-client = 14-npn-simple-resumption-client-extra
> +
> +-[12-npn-simple-resumption-server-extra]
> ++[14-npn-simple-resumption-server-extra]
> + NPNProtocols = foo
> +
> +-[12-npn-simple-resumption-client-extra]
> ++[14-npn-simple-resumption-client-extra]
> + NPNProtocols = foo
> +
> +
> + # ===========================================================
> +
> +-[13-npn-server-switch-resumption]
> +-ssl_conf = 13-npn-server-switch-resumption-ssl
> ++[15-npn-server-switch-resumption]
> ++ssl_conf = 15-npn-server-switch-resumption-ssl
> +
> +-[13-npn-server-switch-resumption-ssl]
> +-server = 13-npn-server-switch-resumption-server
> +-client = 13-npn-server-switch-resumption-client
> +-resume-server = 13-npn-server-switch-resumption-resume-server
> +-resume-client = 13-npn-server-switch-resumption-client
> ++[15-npn-server-switch-resumption-ssl]
> ++server = 15-npn-server-switch-resumption-server
> ++client = 15-npn-server-switch-resumption-client
> ++resume-server = 15-npn-server-switch-resumption-resume-server
> ++resume-client = 15-npn-server-switch-resumption-client
> +
> +-[13-npn-server-switch-resumption-server]
> ++[15-npn-server-switch-resumption-server]
> + Certificate = ${ENV::TEST_CERTS_DIR}/servercert.pem
> + CipherString = DEFAULT
> + PrivateKey = ${ENV::TEST_CERTS_DIR}/serverkey.pem
> +
> +-[13-npn-server-switch-resumption-resume-server]
> ++[15-npn-server-switch-resumption-resume-server]
> + Certificate = ${ENV::TEST_CERTS_DIR}/servercert.pem
> + CipherString = DEFAULT
> + PrivateKey = ${ENV::TEST_CERTS_DIR}/serverkey.pem
> +
> +-[13-npn-server-switch-resumption-client]
> ++[15-npn-server-switch-resumption-client]
> + CipherString = DEFAULT
> + MaxProtocol = TLSv1.2
> + VerifyCAFile = ${ENV::TEST_CERTS_DIR}/rootcert.pem
> + VerifyMode = Peer
> +
> +-[test-13]
> ++[test-15]
> + ExpectedNPNProtocol = baz
> + HandshakeMode = Resume
> + ResumptionExpected = Yes
> +-server = 13-npn-server-switch-resumption-server-extra
> +-resume-server = 13-npn-server-switch-resumption-resume-server-extra
> +-client = 13-npn-server-switch-resumption-client-extra
> +-resume-client = 13-npn-server-switch-resumption-client-extra
> ++server = 15-npn-server-switch-resumption-server-extra
> ++resume-server = 15-npn-server-switch-resumption-resume-server-extra
> ++client = 15-npn-server-switch-resumption-client-extra
> ++resume-client = 15-npn-server-switch-resumption-client-extra
> +
> +-[13-npn-server-switch-resumption-server-extra]
> ++[15-npn-server-switch-resumption-server-extra]
> + NPNProtocols = bar,foo
> +
> +-[13-npn-server-switch-resumption-resume-server-extra]
> ++[15-npn-server-switch-resumption-resume-server-extra]
> + NPNProtocols = baz,foo
> +
> +-[13-npn-server-switch-resumption-client-extra]
> ++[15-npn-server-switch-resumption-client-extra]
> + NPNProtocols = foo,bar,baz
> +
> +
> + # ===========================================================
> +
> +-[14-npn-client-switch-resumption]
> +-ssl_conf = 14-npn-client-switch-resumption-ssl
> ++[16-npn-client-switch-resumption]
> ++ssl_conf = 16-npn-client-switch-resumption-ssl
> +
> +-[14-npn-client-switch-resumption-ssl]
> +-server = 14-npn-client-switch-resumption-server
> +-client = 14-npn-client-switch-resumption-client
> +-resume-server = 14-npn-client-switch-resumption-server
> +-resume-client = 14-npn-client-switch-resumption-resume-client
> ++[16-npn-client-switch-resumption-ssl]
> ++server = 16-npn-client-switch-resumption-server
> ++client = 16-npn-client-switch-resumption-client
> ++resume-server = 16-npn-client-switch-resumption-server
> ++resume-client = 16-npn-client-switch-resumption-resume-client
> +
> +-[14-npn-client-switch-resumption-server]
> ++[16-npn-client-switch-resumption-server]
> + Certificate = ${ENV::TEST_CERTS_DIR}/servercert.pem
> + CipherString = DEFAULT
> + PrivateKey = ${ENV::TEST_CERTS_DIR}/serverkey.pem
> +
> +-[14-npn-client-switch-resumption-client]
> ++[16-npn-client-switch-resumption-client]
> + CipherString = DEFAULT
> + MaxProtocol = TLSv1.2
> + VerifyCAFile = ${ENV::TEST_CERTS_DIR}/rootcert.pem
> + VerifyMode = Peer
> +
> +-[14-npn-client-switch-resumption-resume-client]
> ++[16-npn-client-switch-resumption-resume-client]
> + CipherString = DEFAULT
> + MaxProtocol = TLSv1.2
> + VerifyCAFile = ${ENV::TEST_CERTS_DIR}/rootcert.pem
> + VerifyMode = Peer
> +
> +-[test-14]
> ++[test-16]
> + ExpectedNPNProtocol = bar
> + HandshakeMode = Resume
> + ResumptionExpected = Yes
> +-server = 14-npn-client-switch-resumption-server-extra
> +-resume-server = 14-npn-client-switch-resumption-server-extra
> +-client = 14-npn-client-switch-resumption-client-extra
> +-resume-client = 14-npn-client-switch-resumption-resume-client-extra
> ++server = 16-npn-client-switch-resumption-server-extra
> ++resume-server = 16-npn-client-switch-resumption-server-extra
> ++client = 16-npn-client-switch-resumption-client-extra
> ++resume-client = 16-npn-client-switch-resumption-resume-client-extra
> +
> +-[14-npn-client-switch-resumption-server-extra]
> ++[16-npn-client-switch-resumption-server-extra]
> + NPNProtocols = foo,bar,baz
> +
> +-[14-npn-client-switch-resumption-client-extra]
> ++[16-npn-client-switch-resumption-client-extra]
> + NPNProtocols = foo,baz
> +
> +-[14-npn-client-switch-resumption-resume-client-extra]
> ++[16-npn-client-switch-resumption-resume-client-extra]
> + NPNProtocols = bar,baz
> +
> +
> + # ===========================================================
> +
> +-[15-npn-client-first-pref-on-mismatch-resumption]
> +-ssl_conf = 15-npn-client-first-pref-on-mismatch-resumption-ssl
> ++[17-npn-client-first-pref-on-mismatch-resumption]
> ++ssl_conf = 17-npn-client-first-pref-on-mismatch-resumption-ssl
> +
> +-[15-npn-client-first-pref-on-mismatch-resumption-ssl]
> +-server = 15-npn-client-first-pref-on-mismatch-resumption-server
> +-client = 15-npn-client-first-pref-on-mismatch-resumption-client
> +-resume-server = 15-npn-client-first-pref-on-mismatch-resumption-resume-server
> +-resume-client = 15-npn-client-first-pref-on-mismatch-resumption-client
> ++[17-npn-client-first-pref-on-mismatch-resumption-ssl]
> ++server = 17-npn-client-first-pref-on-mismatch-resumption-server
> ++client = 17-npn-client-first-pref-on-mismatch-resumption-client
> ++resume-server = 17-npn-client-first-pref-on-mismatch-resumption-resume-server
> ++resume-client = 17-npn-client-first-pref-on-mismatch-resumption-client
> +
> +-[15-npn-client-first-pref-on-mismatch-resumption-server]
> ++[17-npn-client-first-pref-on-mismatch-resumption-server]
> + Certificate = ${ENV::TEST_CERTS_DIR}/servercert.pem
> + CipherString = DEFAULT
> + PrivateKey = ${ENV::TEST_CERTS_DIR}/serverkey.pem
> +
> +-[15-npn-client-first-pref-on-mismatch-resumption-resume-server]
> ++[17-npn-client-first-pref-on-mismatch-resumption-resume-server]
> + Certificate = ${ENV::TEST_CERTS_DIR}/servercert.pem
> + CipherString = DEFAULT
> + PrivateKey = ${ENV::TEST_CERTS_DIR}/serverkey.pem
> +
> +-[15-npn-client-first-pref-on-mismatch-resumption-client]
> ++[17-npn-client-first-pref-on-mismatch-resumption-client]
> + CipherString = DEFAULT
> + MaxProtocol = TLSv1.2
> + VerifyCAFile = ${ENV::TEST_CERTS_DIR}/rootcert.pem
> + VerifyMode = Peer
> +
> +-[test-15]
> ++[test-17]
> + ExpectedNPNProtocol = foo
> + HandshakeMode = Resume
> + ResumptionExpected = Yes
> +-server = 15-npn-client-first-pref-on-mismatch-resumption-server-extra
> +-resume-server = 15-npn-client-first-pref-on-mismatch-resumption-resume-server-extra
> +-client = 15-npn-client-first-pref-on-mismatch-resumption-client-extra
> +-resume-client = 15-npn-client-first-pref-on-mismatch-resumption-client-extra
> ++server = 17-npn-client-first-pref-on-mismatch-resumption-server-extra
> ++resume-server = 17-npn-client-first-pref-on-mismatch-resumption-resume-server-extra
> ++client = 17-npn-client-first-pref-on-mismatch-resumption-client-extra
> ++resume-client = 17-npn-client-first-pref-on-mismatch-resumption-client-extra
> +
> +-[15-npn-client-first-pref-on-mismatch-resumption-server-extra]
> ++[17-npn-client-first-pref-on-mismatch-resumption-server-extra]
> + NPNProtocols = bar
> +
> +-[15-npn-client-first-pref-on-mismatch-resumption-resume-server-extra]
> ++[17-npn-client-first-pref-on-mismatch-resumption-resume-server-extra]
> + NPNProtocols = baz
> +
> +-[15-npn-client-first-pref-on-mismatch-resumption-client-extra]
> ++[17-npn-client-first-pref-on-mismatch-resumption-client-extra]
> + NPNProtocols = foo,bar
> +
> +
> + # ===========================================================
> +
> +-[16-npn-no-server-support-resumption]
> +-ssl_conf = 16-npn-no-server-support-resumption-ssl
> ++[18-npn-no-server-support-resumption]
> ++ssl_conf = 18-npn-no-server-support-resumption-ssl
> +
> +-[16-npn-no-server-support-resumption-ssl]
> +-server = 16-npn-no-server-support-resumption-server
> +-client = 16-npn-no-server-support-resumption-client
> +-resume-server = 16-npn-no-server-support-resumption-resume-server
> +-resume-client = 16-npn-no-server-support-resumption-client
> ++[18-npn-no-server-support-resumption-ssl]
> ++server = 18-npn-no-server-support-resumption-server
> ++client = 18-npn-no-server-support-resumption-client
> ++resume-server = 18-npn-no-server-support-resumption-resume-server
> ++resume-client = 18-npn-no-server-support-resumption-client
> +
> +-[16-npn-no-server-support-resumption-server]
> ++[18-npn-no-server-support-resumption-server]
> + Certificate = ${ENV::TEST_CERTS_DIR}/servercert.pem
> + CipherString = DEFAULT
> + PrivateKey = ${ENV::TEST_CERTS_DIR}/serverkey.pem
> +
> +-[16-npn-no-server-support-resumption-resume-server]
> ++[18-npn-no-server-support-resumption-resume-server]
> + Certificate = ${ENV::TEST_CERTS_DIR}/servercert.pem
> + CipherString = DEFAULT
> + PrivateKey = ${ENV::TEST_CERTS_DIR}/serverkey.pem
> +
> +-[16-npn-no-server-support-resumption-client]
> ++[18-npn-no-server-support-resumption-client]
> + CipherString = DEFAULT
> + MaxProtocol = TLSv1.2
> + VerifyCAFile = ${ENV::TEST_CERTS_DIR}/rootcert.pem
> + VerifyMode = Peer
> +
> +-[test-16]
> ++[test-18]
> + HandshakeMode = Resume
> + ResumptionExpected = Yes
> +-server = 16-npn-no-server-support-resumption-server-extra
> +-client = 16-npn-no-server-support-resumption-client-extra
> +-resume-client = 16-npn-no-server-support-resumption-client-extra
> ++server = 18-npn-no-server-support-resumption-server-extra
> ++client = 18-npn-no-server-support-resumption-client-extra
> ++resume-client = 18-npn-no-server-support-resumption-client-extra
> +
> +-[16-npn-no-server-support-resumption-server-extra]
> ++[18-npn-no-server-support-resumption-server-extra]
> + NPNProtocols = foo
> +
> +-[16-npn-no-server-support-resumption-client-extra]
> ++[18-npn-no-server-support-resumption-client-extra]
> + NPNProtocols = foo
> +
> +
> + # ===========================================================
> +
> +-[17-npn-no-client-support-resumption]
> +-ssl_conf = 17-npn-no-client-support-resumption-ssl
> ++[19-npn-no-client-support-resumption]
> ++ssl_conf = 19-npn-no-client-support-resumption-ssl
> +
> +-[17-npn-no-client-support-resumption-ssl]
> +-server = 17-npn-no-client-support-resumption-server
> +-client = 17-npn-no-client-support-resumption-client
> +-resume-server = 17-npn-no-client-support-resumption-server
> +-resume-client = 17-npn-no-client-support-resumption-resume-client
> ++[19-npn-no-client-support-resumption-ssl]
> ++server = 19-npn-no-client-support-resumption-server
> ++client = 19-npn-no-client-support-resumption-client
> ++resume-server = 19-npn-no-client-support-resumption-server
> ++resume-client = 19-npn-no-client-support-resumption-resume-client
> +
> +-[17-npn-no-client-support-resumption-server]
> ++[19-npn-no-client-support-resumption-server]
> + Certificate = ${ENV::TEST_CERTS_DIR}/servercert.pem
> + CipherString = DEFAULT
> + PrivateKey = ${ENV::TEST_CERTS_DIR}/serverkey.pem
> +
> +-[17-npn-no-client-support-resumption-client]
> ++[19-npn-no-client-support-resumption-client]
> + CipherString = DEFAULT
> + MaxProtocol = TLSv1.2
> + VerifyCAFile = ${ENV::TEST_CERTS_DIR}/rootcert.pem
> + VerifyMode = Peer
> +
> +-[17-npn-no-client-support-resumption-resume-client]
> ++[19-npn-no-client-support-resumption-resume-client]
> + CipherString = DEFAULT
> + MaxProtocol = TLSv1.2
> + VerifyCAFile = ${ENV::TEST_CERTS_DIR}/rootcert.pem
> + VerifyMode = Peer
> +
> +-[test-17]
> ++[test-19]
> + HandshakeMode = Resume
> + ResumptionExpected = Yes
> +-server = 17-npn-no-client-support-resumption-server-extra
> +-resume-server = 17-npn-no-client-support-resumption-server-extra
> +-client = 17-npn-no-client-support-resumption-client-extra
> ++server = 19-npn-no-client-support-resumption-server-extra
> ++resume-server = 19-npn-no-client-support-resumption-server-extra
> ++client = 19-npn-no-client-support-resumption-client-extra
> +
> +-[17-npn-no-client-support-resumption-server-extra]
> ++[19-npn-no-client-support-resumption-server-extra]
> + NPNProtocols = foo
> +
> +-[17-npn-no-client-support-resumption-client-extra]
> ++[19-npn-no-client-support-resumption-client-extra]
> + NPNProtocols = foo
> +
> +
> + # ===========================================================
> +
> +-[18-alpn-preferred-over-npn-resumption]
> +-ssl_conf = 18-alpn-preferred-over-npn-resumption-ssl
> ++[20-alpn-preferred-over-npn-resumption]
> ++ssl_conf = 20-alpn-preferred-over-npn-resumption-ssl
> +
> +-[18-alpn-preferred-over-npn-resumption-ssl]
> +-server = 18-alpn-preferred-over-npn-resumption-server
> +-client = 18-alpn-preferred-over-npn-resumption-client
> +-resume-server = 18-alpn-preferred-over-npn-resumption-resume-server
> +-resume-client = 18-alpn-preferred-over-npn-resumption-client
> ++[20-alpn-preferred-over-npn-resumption-ssl]
> ++server = 20-alpn-preferred-over-npn-resumption-server
> ++client = 20-alpn-preferred-over-npn-resumption-client
> ++resume-server = 20-alpn-preferred-over-npn-resumption-resume-server
> ++resume-client = 20-alpn-preferred-over-npn-resumption-client
> +
> +-[18-alpn-preferred-over-npn-resumption-server]
> ++[20-alpn-preferred-over-npn-resumption-server]
> + Certificate = ${ENV::TEST_CERTS_DIR}/servercert.pem
> + CipherString = DEFAULT
> + PrivateKey = ${ENV::TEST_CERTS_DIR}/serverkey.pem
> +
> +-[18-alpn-preferred-over-npn-resumption-resume-server]
> ++[20-alpn-preferred-over-npn-resumption-resume-server]
> + Certificate = ${ENV::TEST_CERTS_DIR}/servercert.pem
> + CipherString = DEFAULT
> + PrivateKey = ${ENV::TEST_CERTS_DIR}/serverkey.pem
> +
> +-[18-alpn-preferred-over-npn-resumption-client]
> ++[20-alpn-preferred-over-npn-resumption-client]
> + CipherString = DEFAULT
> + MaxProtocol = TLSv1.2
> + VerifyCAFile = ${ENV::TEST_CERTS_DIR}/rootcert.pem
> + VerifyMode = Peer
> +
> +-[test-18]
> ++[test-20]
> + ExpectedALPNProtocol = foo
> + HandshakeMode = Resume
> + ResumptionExpected = Yes
> +-server = 18-alpn-preferred-over-npn-resumption-server-extra
> +-resume-server = 18-alpn-preferred-over-npn-resumption-resume-server-extra
> +-client = 18-alpn-preferred-over-npn-resumption-client-extra
> +-resume-client = 18-alpn-preferred-over-npn-resumption-client-extra
> ++server = 20-alpn-preferred-over-npn-resumption-server-extra
> ++resume-server = 20-alpn-preferred-over-npn-resumption-resume-server-extra
> ++client = 20-alpn-preferred-over-npn-resumption-client-extra
> ++resume-client = 20-alpn-preferred-over-npn-resumption-client-extra
> +
> +-[18-alpn-preferred-over-npn-resumption-server-extra]
> ++[20-alpn-preferred-over-npn-resumption-server-extra]
> + NPNProtocols = bar
> +
> +-[18-alpn-preferred-over-npn-resumption-resume-server-extra]
> ++[20-alpn-preferred-over-npn-resumption-resume-server-extra]
> + ALPNProtocols = foo
> + NPNProtocols = baz
> +
> +-[18-alpn-preferred-over-npn-resumption-client-extra]
> ++[20-alpn-preferred-over-npn-resumption-client-extra]
> + ALPNProtocols = foo
> + NPNProtocols = bar,baz
> +
> +
> + # ===========================================================
> +
> +-[19-npn-used-if-alpn-not-supported-resumption]
> +-ssl_conf = 19-npn-used-if-alpn-not-supported-resumption-ssl
> ++[21-npn-used-if-alpn-not-supported-resumption]
> ++ssl_conf = 21-npn-used-if-alpn-not-supported-resumption-ssl
> +
> +-[19-npn-used-if-alpn-not-supported-resumption-ssl]
> +-server = 19-npn-used-if-alpn-not-supported-resumption-server
> +-client = 19-npn-used-if-alpn-not-supported-resumption-client
> +-resume-server = 19-npn-used-if-alpn-not-supported-resumption-resume-server
> +-resume-client = 19-npn-used-if-alpn-not-supported-resumption-client
> ++[21-npn-used-if-alpn-not-supported-resumption-ssl]
> ++server = 21-npn-used-if-alpn-not-supported-resumption-server
> ++client = 21-npn-used-if-alpn-not-supported-resumption-client
> ++resume-server = 21-npn-used-if-alpn-not-supported-resumption-resume-server
> ++resume-client = 21-npn-used-if-alpn-not-supported-resumption-client
> +
> +-[19-npn-used-if-alpn-not-supported-resumption-server]
> ++[21-npn-used-if-alpn-not-supported-resumption-server]
> + Certificate = ${ENV::TEST_CERTS_DIR}/servercert.pem
> + CipherString = DEFAULT
> + PrivateKey = ${ENV::TEST_CERTS_DIR}/serverkey.pem
> +
> +-[19-npn-used-if-alpn-not-supported-resumption-resume-server]
> ++[21-npn-used-if-alpn-not-supported-resumption-resume-server]
> + Certificate = ${ENV::TEST_CERTS_DIR}/servercert.pem
> + CipherString = DEFAULT
> + PrivateKey = ${ENV::TEST_CERTS_DIR}/serverkey.pem
> +
> +-[19-npn-used-if-alpn-not-supported-resumption-client]
> ++[21-npn-used-if-alpn-not-supported-resumption-client]
> + CipherString = DEFAULT
> + MaxProtocol = TLSv1.2
> + VerifyCAFile = ${ENV::TEST_CERTS_DIR}/rootcert.pem
> + VerifyMode = Peer
> +
> +-[test-19]
> ++[test-21]
> + ExpectedNPNProtocol = baz
> + HandshakeMode = Resume
> + ResumptionExpected = Yes
> +-server = 19-npn-used-if-alpn-not-supported-resumption-server-extra
> +-resume-server = 19-npn-used-if-alpn-not-supported-resumption-resume-server-extra
> +-client = 19-npn-used-if-alpn-not-supported-resumption-client-extra
> +-resume-client = 19-npn-used-if-alpn-not-supported-resumption-client-extra
> ++server = 21-npn-used-if-alpn-not-supported-resumption-server-extra
> ++resume-server = 21-npn-used-if-alpn-not-supported-resumption-resume-server-extra
> ++client = 21-npn-used-if-alpn-not-supported-resumption-client-extra
> ++resume-client = 21-npn-used-if-alpn-not-supported-resumption-client-extra
> +
> +-[19-npn-used-if-alpn-not-supported-resumption-server-extra]
> ++[21-npn-used-if-alpn-not-supported-resumption-server-extra]
> + ALPNProtocols = foo
> + NPNProtocols = bar
> +
> +-[19-npn-used-if-alpn-not-supported-resumption-resume-server-extra]
> ++[21-npn-used-if-alpn-not-supported-resumption-resume-server-extra]
> + NPNProtocols = baz
> +
> +-[19-npn-used-if-alpn-not-supported-resumption-client-extra]
> ++[21-npn-used-if-alpn-not-supported-resumption-client-extra]
> + ALPNProtocols = foo
> + NPNProtocols = bar,baz
> +
> +diff --git a/test/ssl-tests/08-npn.cnf.in b/test/ssl-tests/08-npn.cnf.in
> +index 30783e4..1dc2704 100644
> +--- a/test/ssl-tests/08-npn.cnf.in
> ++++ b/test/ssl-tests/08-npn.cnf.in
> +@@ -110,6 +110,41 @@ our @tests = (
> +             "ExpectedNPNProtocol" => undef,
> +         },
> +     },
> ++    {
> ++        name => "npn-empty-client-list",
> ++        server => {
> ++            extra => {
> ++                "NPNProtocols" => "foo",
> ++            },
> ++        },
> ++        client => {
> ++            extra => {
> ++                "NPNProtocols" => "",
> ++            },
> ++            "MaxProtocol" => "TLSv1.2"
> ++        },
> ++        test => {
> ++            "ExpectedResult" => "ClientFail",
> ++            "ExpectedClientAlert" => "HandshakeFailure"
> ++        },
> ++    },
> ++    {
> ++        name => "npn-empty-server-list",
> ++        server => {
> ++            extra => {
> ++                "NPNProtocols" => "",
> ++            },
> ++        },
> ++        client => {
> ++            extra => {
> ++                "NPNProtocols" => "foo",
> ++            },
> ++            "MaxProtocol" => "TLSv1.2"
> ++        },
> ++        test => {
> ++            "ExpectedNPNProtocol" => "foo"
> ++        },
> ++    },
> +     {
> +         name => "npn-with-sni-no-context-switch",
> +         server => {
> +diff --git a/test/ssl-tests/09-alpn.cnf b/test/ssl-tests/09-alpn.cnf
> +index e7e6cb9..dd66873 100644
> +--- a/test/ssl-tests/09-alpn.cnf
> ++++ b/test/ssl-tests/09-alpn.cnf
> +@@ -1,6 +1,6 @@
> + # Generated with generate_ssl_tests.pl
> +
> +-num_tests = 16
> ++num_tests = 18
> +
> + test-0 = 0-alpn-simple
> + test-1 = 1-alpn-server-finds-match
> +@@ -18,6 +18,8 @@ test-12 = 12-alpn-client-switch-resumption
> + test-13 = 13-alpn-alert-on-mismatch-resumption
> + test-14 = 14-alpn-no-server-support-resumption
> + test-15 = 15-alpn-no-client-support-resumption
> ++test-16 = 16-alpn-empty-client-list
> ++test-17 = 17-alpn-empty-server-list
> + # ===========================================================
> +
> + [0-alpn-simple]
> +@@ -617,3 +619,65 @@ ALPNProtocols = foo
> + ALPNProtocols = foo
> +
> +
> ++# ===========================================================
> ++
> ++[16-alpn-empty-client-list]
> ++ssl_conf = 16-alpn-empty-client-list-ssl
> ++
> ++[16-alpn-empty-client-list-ssl]
> ++server = 16-alpn-empty-client-list-server
> ++client = 16-alpn-empty-client-list-client
> ++
> ++[16-alpn-empty-client-list-server]
> ++Certificate = ${ENV::TEST_CERTS_DIR}/servercert.pem
> ++CipherString = DEFAULT
> ++PrivateKey = ${ENV::TEST_CERTS_DIR}/serverkey.pem
> ++
> ++[16-alpn-empty-client-list-client]
> ++CipherString = DEFAULT
> ++VerifyCAFile = ${ENV::TEST_CERTS_DIR}/rootcert.pem
> ++VerifyMode = Peer
> ++
> ++[test-16]
> ++server = 16-alpn-empty-client-list-server-extra
> ++client = 16-alpn-empty-client-list-client-extra
> ++
> ++[16-alpn-empty-client-list-server-extra]
> ++ALPNProtocols = foo
> ++
> ++[16-alpn-empty-client-list-client-extra]
> ++ALPNProtocols =
> ++
> ++
> ++# ===========================================================
> ++
> ++[17-alpn-empty-server-list]
> ++ssl_conf = 17-alpn-empty-server-list-ssl
> ++
> ++[17-alpn-empty-server-list-ssl]
> ++server = 17-alpn-empty-server-list-server
> ++client = 17-alpn-empty-server-list-client
> ++
> ++[17-alpn-empty-server-list-server]
> ++Certificate = ${ENV::TEST_CERTS_DIR}/servercert.pem
> ++CipherString = DEFAULT
> ++PrivateKey = ${ENV::TEST_CERTS_DIR}/serverkey.pem
> ++
> ++[17-alpn-empty-server-list-client]
> ++CipherString = DEFAULT
> ++VerifyCAFile = ${ENV::TEST_CERTS_DIR}/rootcert.pem
> ++VerifyMode = Peer
> ++
> ++[test-17]
> ++ExpectedResult = ServerFail
> ++ExpectedServerAlert = NoApplicationProtocol
> ++server = 17-alpn-empty-server-list-server-extra
> ++client = 17-alpn-empty-server-list-client-extra
> ++
> ++[17-alpn-empty-server-list-server-extra]
> ++ALPNProtocols =
> ++
> ++[17-alpn-empty-server-list-client-extra]
> ++ALPNProtocols = foo
> ++
> ++
> +diff --git a/test/ssl-tests/09-alpn.cnf.in b/test/ssl-tests/09-alpn.cnf.in
> +index 8133075..322b709 100644
> +--- a/test/ssl-tests/09-alpn.cnf.in
> ++++ b/test/ssl-tests/09-alpn.cnf.in
> +@@ -322,4 +322,37 @@ our @tests = (
> +             "ExpectedALPNProtocol" => undef,
> +         },
> +     },
> ++    {
> ++        name => "alpn-empty-client-list",
> ++        server => {
> ++            extra => {
> ++                "ALPNProtocols" => "foo",
> ++            },
> ++        },
> ++        client => {
> ++            extra => {
> ++                "ALPNProtocols" => "",
> ++            },
> ++        },
> ++        test => {
> ++            "ExpectedALPNProtocol" => undef,
> ++        },
> ++    },
> ++    {
> ++        name => "alpn-empty-server-list",
> ++        server => {
> ++            extra => {
> ++                "ALPNProtocols" => "",
> ++            },
> ++        },
> ++        client => {
> ++            extra => {
> ++                "ALPNProtocols" => "foo",
> ++            },
> ++        },
> ++        test => {
> ++            "ExpectedResult" => "ServerFail",
> ++            "ExpectedServerAlert" => "NoApplicationProtocol",
> ++        },
> ++    },
> + );
> +--
> +2.44.0
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_7.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_7.patch
> new file mode 100644
> index 0000000000..7319d27bb8
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_7.patch
> @@ -0,0 +1,43 @@
> +From 86351b8dd4c499de7a0c02313ee54966e978150f Mon Sep 17 00:00:00 2001
> +From: Matt Caswell <matt@openssl.org>
> +Date: Fri, 21 Jun 2024 10:41:55 +0100
> +Subject: [PATCH 07/10] Correct return values for
> + tls_construct_stoc_next_proto_neg
> +
> +Return EXT_RETURN_NOT_SENT in the event that we don't send the extension,
> +rather than EXT_RETURN_SENT. This actually makes no difference at all to
> +the current control flow since this return value is ignored in this case
> +anyway. But lets make it correct anyway.
> +
> +Follow on from CVE-2024-5535
> +
> +Reviewed-by: Neil Horman <nhorman@openssl.org>
> +Reviewed-by: Tomas Mraz <tomas@openssl.org>
> +(Merged from https://github.com/openssl/openssl/pull/24717)
> +
> +Upstream-Status: Backport from [https://github.com/openssl/openssl/commit/53f5677f358c4a4f69830d944ea40e71950673b8]
> +CVE: CVE-2024-5535
> +Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> +---
> + ssl/statem/extensions_srvr.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/ssl/statem/extensions_srvr.c b/ssl/statem/extensions_srvr.c
> +index 64ccb3e..b821c7c 100644
> +--- a/ssl/statem/extensions_srvr.c
> ++++ b/ssl/statem/extensions_srvr.c
> +@@ -1496,9 +1496,10 @@ EXT_RETURN tls_construct_stoc_next_proto_neg(SSL_CONNECTION *s, WPACKET *pkt,
> +             return EXT_RETURN_FAIL;
> +         }
> +         s->s3.npn_seen = 1;
> ++        return EXT_RETURN_SENT;
> +     }
> +
> +-    return EXT_RETURN_SENT;
> ++    return EXT_RETURN_NOT_SENT;
> + }
> + #endif
> +
> +--
> +2.44.0
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_8.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_8.patch
> new file mode 100644
> index 0000000000..f64938a5ca
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_8.patch
> @@ -0,0 +1,66 @@
> +From 29f860914824cde6b0aea6ad818b93132930137f Mon Sep 17 00:00:00 2001
> +From: Matt Caswell <matt@openssl.org>
> +Date: Fri, 21 Jun 2024 11:51:54 +0100
> +Subject: [PATCH 08/10] Add ALPN validation in the client
> +
> +The ALPN protocol selected by the server must be one that we originally
> +advertised. We should verify that it is.
> +
> +Follow on from CVE-2024-5535
> +
> +Reviewed-by: Neil Horman <nhorman@openssl.org>
> +Reviewed-by: Tomas Mraz <tomas@openssl.org>
> +(Merged from https://github.com/openssl/openssl/pull/24717)
> +
> +Upstream-Status: Backport from [https://github.com/openssl/openssl/commit/195e15421df113d7283aab2ccff8b8fb06df5465]
> +CVE: CVE-2024-5535
> +Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> +---
> + ssl/statem/extensions_clnt.c | 24 ++++++++++++++++++++++++
> + 1 file changed, 24 insertions(+)
> +
> +diff --git a/ssl/statem/extensions_clnt.c b/ssl/statem/extensions_clnt.c
> +index 1ab3c13..ff9c009 100644
> +--- a/ssl/statem/extensions_clnt.c
> ++++ b/ssl/statem/extensions_clnt.c
> +@@ -1590,6 +1590,8 @@ int tls_parse_stoc_alpn(SSL_CONNECTION *s, PACKET *pkt, unsigned int context,
> +                         X509 *x, size_t chainidx)
> + {
> +     size_t len;
> ++    PACKET confpkt, protpkt;
> ++    int valid = 0;
> +
> +     /* We must have requested it. */
> +     if (!s->s3.alpn_sent) {
> +@@ -1608,6 +1610,28 @@ int tls_parse_stoc_alpn(SSL_CONNECTION *s, PACKET *pkt, unsigned int context,
> +         SSLfatal(s, SSL_AD_DECODE_ERROR, SSL_R_BAD_EXTENSION);
> +         return 0;
> +     }
> ++
> ++    /* It must be a protocol that we sent */
> ++    if (!PACKET_buf_init(&confpkt, s->ext.alpn, s->ext.alpn_len)) {
> ++        SSLfatal(s, SSL_AD_INTERNAL_ERROR, ERR_R_INTERNAL_ERROR);
> ++        return 0;
> ++    }
> ++    while (PACKET_get_length_prefixed_1(&confpkt, &protpkt)) {
> ++        if (PACKET_remaining(&protpkt) != len)
> ++            continue;
> ++        if (memcmp(PACKET_data(pkt), PACKET_data(&protpkt), len) == 0) {
> ++            /* Valid protocol found */
> ++            valid = 1;
> ++            break;
> ++        }
> ++    }
> ++
> ++    if (!valid) {
> ++        /* The protocol sent from the server does not match one we advertised */
> ++        SSLfatal(s, SSL_AD_DECODE_ERROR, SSL_R_BAD_EXTENSION);
> ++        return 0;
> ++    }
> ++
> +     OPENSSL_free(s->s3.alpn_selected);
> +     s->s3.alpn_selected = OPENSSL_malloc(len);
> +     if (s->s3.alpn_selected == NULL) {
> +--
> +2.44.0
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_9.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_9.patch
> new file mode 100644
> index 0000000000..fb1cef5067
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_9.patch
> @@ -0,0 +1,271 @@
> +From 6a5484b0d3fcf9a868c7e3e5b62e5eedc90b6080 Mon Sep 17 00:00:00 2001
> +From: Matt Caswell <matt@openssl.org>
> +Date: Fri, 21 Jun 2024 10:09:41 +0100
> +Subject: [PATCH 09/10] Add explicit testing of ALN and NPN in sslapitest
> +
> +We already had some tests elsewhere - but this extends that testing with
> +additional tests.
> +
> +Follow on from CVE-2024-5535
> +
> +Reviewed-by: Neil Horman <nhorman@openssl.org>
> +Reviewed-by: Tomas Mraz <tomas@openssl.org>
> +(Merged from https://github.com/openssl/openssl/pull/24717)
> +
> +Upstream-Status: Backport from [https://github.com/openssl/openssl/commit/7c95191434415d1c9b7fe9b130df13cce630b6b5]
> +CVE: CVE-2024-5535
> +Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> +---
> + test/sslapitest.c | 229 ++++++++++++++++++++++++++++++++++++++++++++++
> + 1 file changed, 229 insertions(+)
> +
> +diff --git a/test/sslapitest.c b/test/sslapitest.c
> +index 15cb906..7a55a2b 100644
> +--- a/test/sslapitest.c
> ++++ b/test/sslapitest.c
> +@@ -11877,6 +11877,231 @@ static int test_select_next_proto(int idx)
> +     return ret;
> + }
> +
> ++static const unsigned char fooprot[] = {3, 'f', 'o', 'o' };
> ++static const unsigned char barprot[] = {3, 'b', 'a', 'r' };
> ++
> ++#if !defined(OPENSSL_NO_TLS1_2) && !defined(OPENSSL_NO_NEXTPROTONEG)
> ++static int npn_advert_cb(SSL *ssl, const unsigned char **out,
> ++                         unsigned int *outlen, void *arg)
> ++{
> ++    int *idx = (int *)arg;
> ++
> ++    switch (*idx) {
> ++    default:
> ++    case 0:
> ++        *out = fooprot;
> ++        *outlen = sizeof(fooprot);
> ++        return SSL_TLSEXT_ERR_OK;
> ++
> ++    case 1:
> ++        *outlen = 0;
> ++        return SSL_TLSEXT_ERR_OK;
> ++
> ++    case 2:
> ++        return SSL_TLSEXT_ERR_NOACK;
> ++    }
> ++}
> ++
> ++static int npn_select_cb(SSL *s, unsigned char **out, unsigned char *outlen,
> ++                         const unsigned char *in, unsigned int inlen, void *arg)
> ++{
> ++    int *idx = (int *)arg;
> ++
> ++    switch (*idx) {
> ++    case 0:
> ++    case 1:
> ++        *out = (unsigned char *)(fooprot + 1);
> ++        *outlen = *fooprot;
> ++        return SSL_TLSEXT_ERR_OK;
> ++
> ++    case 3:
> ++        *out = (unsigned char *)(barprot + 1);
> ++        *outlen = *barprot;
> ++        return SSL_TLSEXT_ERR_OK;
> ++
> ++    case 4:
> ++        *outlen = 0;
> ++        return SSL_TLSEXT_ERR_OK;
> ++
> ++    default:
> ++    case 2:
> ++        return SSL_TLSEXT_ERR_ALERT_FATAL;
> ++    }
> ++}
> ++
> ++/*
> ++ * Test the NPN callbacks
> ++ * Test 0: advert = foo, select = foo
> ++ * Test 1: advert = <empty>, select = foo
> ++ * Test 2: no advert
> ++ * Test 3: advert = foo, select = bar
> ++ * Test 4: advert = foo, select = <empty> (should fail)
> ++ */
> ++static int test_npn(int idx)
> ++{
> ++    SSL_CTX *sctx = NULL, *cctx = NULL;
> ++    SSL *serverssl = NULL, *clientssl = NULL;
> ++    int testresult = 0;
> ++
> ++    if (!TEST_true(create_ssl_ctx_pair(libctx, TLS_server_method(),
> ++                                       TLS_client_method(), 0, TLS1_2_VERSION,
> ++                                       &sctx, &cctx, cert, privkey)))
> ++        goto end;
> ++
> ++    SSL_CTX_set_next_protos_advertised_cb(sctx, npn_advert_cb, &idx);
> ++    SSL_CTX_set_next_proto_select_cb(cctx, npn_select_cb, &idx);
> ++
> ++    if (!TEST_true(create_ssl_objects(sctx, cctx, &serverssl, &clientssl, NULL,
> ++                                      NULL)))
> ++        goto end;
> ++
> ++    if (idx == 4) {
> ++        /* We don't allow empty selection of NPN, so this should fail */
> ++        if (!TEST_false(create_ssl_connection(serverssl, clientssl,
> ++                                              SSL_ERROR_NONE)))
> ++            goto end;
> ++    } else {
> ++        const unsigned char *prot;
> ++        unsigned int protlen;
> ++
> ++        if (!TEST_true(create_ssl_connection(serverssl, clientssl,
> ++                                             SSL_ERROR_NONE)))
> ++            goto end;
> ++
> ++        SSL_get0_next_proto_negotiated(serverssl, &prot, &protlen);
> ++        switch (idx) {
> ++        case 0:
> ++        case 1:
> ++            if (!TEST_mem_eq(prot, protlen, fooprot + 1, *fooprot))
> ++                goto end;
> ++            break;
> ++        case 2:
> ++            if (!TEST_uint_eq(protlen, 0))
> ++                goto end;
> ++            break;
> ++        case 3:
> ++            if (!TEST_mem_eq(prot, protlen, barprot + 1, *barprot))
> ++                goto end;
> ++            break;
> ++        default:
> ++            TEST_error("Should not get here");
> ++            goto end;
> ++        }
> ++    }
> ++
> ++    testresult = 1;
> ++ end:
> ++    SSL_free(serverssl);
> ++    SSL_free(clientssl);
> ++    SSL_CTX_free(sctx);
> ++    SSL_CTX_free(cctx);
> ++
> ++    return testresult;
> ++}
> ++#endif /* !defined(OPENSSL_NO_TLS1_2) && !defined(OPENSSL_NO_NEXTPROTONEG) */
> ++
> ++static int alpn_select_cb2(SSL *ssl, const unsigned char **out,
> ++                           unsigned char *outlen, const unsigned char *in,
> ++                           unsigned int inlen, void *arg)
> ++{
> ++    int *idx = (int *)arg;
> ++
> ++    switch (*idx) {
> ++    case 0:
> ++        *out = (unsigned char *)(fooprot + 1);
> ++        *outlen = *fooprot;
> ++        return SSL_TLSEXT_ERR_OK;
> ++
> ++    case 2:
> ++        *out = (unsigned char *)(barprot + 1);
> ++        *outlen = *barprot;
> ++        return SSL_TLSEXT_ERR_OK;
> ++
> ++    case 3:
> ++        *outlen = 0;
> ++        return SSL_TLSEXT_ERR_OK;
> ++
> ++    default:
> ++    case 1:
> ++        return SSL_TLSEXT_ERR_ALERT_FATAL;
> ++    }
> ++    return 0;
> ++}
> ++
> ++/*
> ++ * Test the ALPN callbacks
> ++ * Test 0: client = foo, select = foo
> ++ * Test 1: client = <empty>, select = none
> ++ * Test 2: client = foo, select = bar (should fail)
> ++ * Test 3: client = foo, select = <empty> (should fail)
> ++ */
> ++static int test_alpn(int idx)
> ++{
> ++    SSL_CTX *sctx = NULL, *cctx = NULL;
> ++    SSL *serverssl = NULL, *clientssl = NULL;
> ++    int testresult = 0;
> ++    const unsigned char *prots = fooprot;
> ++    unsigned int protslen = sizeof(fooprot);
> ++
> ++    if (!TEST_true(create_ssl_ctx_pair(libctx, TLS_server_method(),
> ++                                       TLS_client_method(), 0, 0,
> ++                                       &sctx, &cctx, cert, privkey)))
> ++        goto end;
> ++
> ++    SSL_CTX_set_alpn_select_cb(sctx, alpn_select_cb2, &idx);
> ++
> ++    if (!TEST_true(create_ssl_objects(sctx, cctx, &serverssl, &clientssl, NULL,
> ++                                      NULL)))
> ++        goto end;
> ++
> ++    if (idx == 1) {
> ++        prots = NULL;
> ++        protslen = 0;
> ++    }
> ++
> ++    /* SSL_set_alpn_protos returns 0 for success! */
> ++    if (!TEST_false(SSL_set_alpn_protos(clientssl, prots, protslen)))
> ++        goto end;
> ++
> ++    if (idx == 2 || idx == 3) {
> ++        /* We don't allow empty selection of NPN, so this should fail */
> ++        if (!TEST_false(create_ssl_connection(serverssl, clientssl,
> ++                                              SSL_ERROR_NONE)))
> ++            goto end;
> ++    } else {
> ++        const unsigned char *prot;
> ++        unsigned int protlen;
> ++
> ++        if (!TEST_true(create_ssl_connection(serverssl, clientssl,
> ++                                             SSL_ERROR_NONE)))
> ++            goto end;
> ++
> ++        SSL_get0_alpn_selected(clientssl, &prot, &protlen);
> ++        switch (idx) {
> ++        case 0:
> ++            if (!TEST_mem_eq(prot, protlen, fooprot + 1, *fooprot))
> ++                goto end;
> ++            break;
> ++        case 1:
> ++            if (!TEST_uint_eq(protlen, 0))
> ++                goto end;
> ++            break;
> ++        default:
> ++            TEST_error("Should not get here");
> ++            goto end;
> ++        }
> ++    }
> ++
> ++    testresult = 1;
> ++ end:
> ++    SSL_free(serverssl);
> ++    SSL_free(clientssl);
> ++    SSL_CTX_free(sctx);
> ++    SSL_CTX_free(cctx);
> ++
> ++    return testresult;
> ++}
> ++
> + OPT_TEST_DECLARE_USAGE("certfile privkeyfile srpvfile tmpfile provider config dhfile\n")
> +
> + int setup_tests(void)
> +@@ -12190,6 +12415,10 @@ int setup_tests(void)
> +     ADD_TEST(test_data_retry);
> +     ADD_ALL_TESTS(test_multi_resume, 5);
> +     ADD_ALL_TESTS(test_select_next_proto, OSSL_NELEM(next_proto_tests));
> ++#if !defined(OPENSSL_NO_TLS1_2) && !defined(OPENSSL_NO_NEXTPROTONEG)
> ++    ADD_ALL_TESTS(test_npn, 5);
> ++#endif
> ++    ADD_ALL_TESTS(test_alpn, 4);
> +     return 1;
> +
> +  err:
> +--
> +2.44.0
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.2.bb b/meta/recipes-connectivity/openssl/openssl_3.2.2.bb
> index 1c92707144..3242dd69c6 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.2.2.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.2.2.bb
> @@ -12,6 +12,16 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
>              file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
>              file://0001-Configure-do-not-tweak-mips-cflags.patch \
>              file://0001-Added-handshake-history-reporting-when-test-fails.patch \
> +           file://CVE-2024-5535_1.patch \
> +           file://CVE-2024-5535_2.patch \
> +           file://CVE-2024-5535_3.patch \
> +           file://CVE-2024-5535_4.patch \
> +           file://CVE-2024-5535_5.patch \
> +           file://CVE-2024-5535_6.patch \
> +           file://CVE-2024-5535_7.patch \
> +           file://CVE-2024-5535_8.patch \
> +           file://CVE-2024-5535_9.patch \
> +           file://CVE-2024-5535_10.patch \
>              "
>   
>   SRC_URI:append:class-nativesdk = " \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201439): https://lists.openembedded.org/g/openembedded-core/message/201439
> Mute This Topic: https://lists.openembedded.org/mt/107004007/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


