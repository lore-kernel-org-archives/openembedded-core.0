Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54DBBCAC5BB
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 05:52:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2559.1760075530619319704
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 22:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kI2jPM32;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=237871debd=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59A5bshF2002452
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Oct 2025 22:52:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=urkib3lIio2UV1efVNMV9D
	cYml1U/7cSSLzQtVQXs0U=; b=kI2jPM32lneFmPA8wlYJD/TkE0nTaxkC2yojnn
	kXNGxxZcKgtZqUBNUn8CWYJj+9xpb27QflR8DoPGYfN9AfdLalXNFVLoHjUIRtEI
	S+ld1DFnXhH1tyTh3hr//nv+nNu1WqSxsvZU/GnYsVoD3TZdZM20MyhLdAS/4YI1
	ObNa8OJsuT5pun0IZUdFtGRNvtg1G75uqBfoqDttrQlcZ+eLyOCkxlh6q1wRAaan
	aJOP66L95U2hzT6dgpvDPlXdVpfmsarhNjRN9dF1HhwLi45hMLkwRVWG+8LQ7mvZ
	Gqzn2xVwW6sHJB2rzQ2Q1RIQYCMAFHs32b1Tp9yMqOzNVk7A==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013053.outbound.protection.outlook.com [40.93.196.53])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49nx2x1r22-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 22:52:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SL9K59CrtTS7CF4kxSPRysqmsdIbX/X93f/ip8gXA5vELzr7IuQaRmDzWiU6+LOZohoSwMu3R6dM/5FUMD8IgsFQuiUamMHTd2GNspu5wVvjW6FfwxWY2U0kHLBnqBhjQE21UVUw31c6wlBxGJTIIBHg1gFeBcQxI/KeDuDfNPqdlRNlsf34DWhDKjnQCIy54B06fljQmOJNm4eHTLawM5Rwax6M70le5PRJsDjOiYuuO4aQSo+OaP9Z9lIFKd+L3oyedRXQKHECjzJNnOOCTKPbeFpQ+9lLxXpbYlTT7hCHaIkd8V2TQ9QZNaM68hWHL7xoMbPSiIAAB+s0xIaJzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=urkib3lIio2UV1efVNMV9DcYml1U/7cSSLzQtVQXs0U=;
 b=ieG+AUI3nA+MFcNPmU4b7vtdJt2X3xZ2RNe8jqcgW9IHEe48qQQpSJTqiGGQ3eYpF9tTepUUtDzKiB7bBrMxqG2ZMzdK7PqVMjclrbMQXqMBtpPLQ8R9ijmFhMbUpEhaDGEfhbRQXmCxo99ft/COtlUFSudM3uJ+xKWm2J1q2yGYbd61ICOAmyRj3WBOul4e5f8jphEwhLEWUKYykpfdX+/7vrQiYR+cTQKC9sDkaHzAmbTg1VEdLmDAdEBX5TCS83FTeHQukE2eEh9Rr74eDxfOGxFPoGF66VKcP9vENktL3JUbTmsYGzhwZJo+HC5J5kSCHmR69/SJekgQQxdrnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by PH7PR11MB6403.namprd11.prod.outlook.com (2603:10b6:510:1f9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 05:52:06 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%4]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 05:52:06 +0000
Content-Type: multipart/alternative;
 boundary="------------Iu1OK98tojN87i13wPhNPjS1"
Message-ID: <566d1cf5-7390-4817-aa19-edb28cca82f4@windriver.com>
Date: Fri, 10 Oct 2025 13:52:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] xcb-util-errors: fix racing on out of source
 tree build
To: ross.burton@arm.com,
        "hongxu.jia@eng.windriver.com" <hongxu.jia@eng.windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250925075646.1146511-1-hongxu.jia@windriver.com>
 <A5A09505-7119-485C-A0C6-C88DE980263C@arm.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <A5A09505-7119-485C-A0C6-C88DE980263C@arm.com>
X-ClientProxiedBy: TY4P286CA0007.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::16) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|PH7PR11MB6403:EE_
X-MS-Office365-Filtering-Correlation-Id: 63d2131d-cd59-4a1c-9011-08de07c12516
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|4022899009|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WnNrZTA2bGlpVHJVdmxZSEhqcDE4Y1VSL25VcVZLWXlwMXVkNzdQNEx0YjNo?=
 =?utf-8?B?c04rMlljVW0reVp5YlRFdGNKMjNDdFo2QU8xajBLdjhybWhuVFNBVVJYV0tl?=
 =?utf-8?B?MStGWEVoL3hoYU5YaGxqZVRtNWNjaFFCMnd3NitaZFNwL1lZbFQrOTQySmdW?=
 =?utf-8?B?Uk5tdytRc0srY3ExODl6UzIzYkVwOGc1NXdjQzVabUFERzcvcnoxeWlKYW5L?=
 =?utf-8?B?VGlmSWxMbDg0SDdCV201Vi96R25ORnpxUnRPZkNlK1Yyd25vbDlQK2JlanN3?=
 =?utf-8?B?MkFteGlTeWt6UGV5WUcxTlFqalRUYTBZYlkrbkd3S3FQYzZNTmhBTUYvU3Uy?=
 =?utf-8?B?L05pYXR0dG5NUHhPWngwSFUxNm16WXRaM3NmYzF4QmFRdjZETUluYjNxMklj?=
 =?utf-8?B?dWxNNjkwSUU3UmlNUDhZY0x1MFNBaTBiRXFjVnp3c3NTbzJtcHMzbkk4ME5n?=
 =?utf-8?B?ZzZZZHpZSkdpTTRmV3YwZGR5SDRFcGlCeXgzMUdHaldPVFluN3JTZlhHRy9N?=
 =?utf-8?B?RkdDcmViZkRaT1hMS3JzSUxDbTdoT0tHakVEalpkZHc0MEVVQUVGZjZMckVn?=
 =?utf-8?B?YWwwUUpzQWtON2p5WkNjend5amNUTEJCaEh0RnJ6TXU0UG4zbDRZUjVOUEt1?=
 =?utf-8?B?QXkyZUZtaTBhbmtyTGFobWpvZy9UTC9DWiszRmF4Wm1POVJicHd0S3AzQ1RL?=
 =?utf-8?B?eEc4UVEyZ0NwUG9PTS91ZEs3Ykp5dE45citPK1Rxc2ZYWXlpKzBsM0JkdHAv?=
 =?utf-8?B?Tjh5MHdWK3NHcUVoMEZzMkhxbzkzSzZWSUt6cmFUNW1pZ1BlZjJNQVIyNHY0?=
 =?utf-8?B?eW9DbzE1QWYvMXFUcUQ3YU5kTGkyMUZsbmRwcitmNzdLTGtnVjlucVVxS0hO?=
 =?utf-8?B?SnFQeDQyMlJPWC9SM2VmSjltZU9RcWJCVU5GL2xpM3JTZ0QweUFDVzJ5Zml5?=
 =?utf-8?B?RkdVaGpPNkEzcURjYy9yQ0ZVNk43dHVOWmxzWW9KaTltSHAzTU16NmJodnhM?=
 =?utf-8?B?VFZ4ZmZLMmo0WUk4YVI1Z3hxbWhvcEpiVFk2eEo2ZG8zVVM5OVZjSUtLUVYw?=
 =?utf-8?B?azVHdGY1bDYzWTRWUGpuTzdFQXFOSTlGQ2orSnMyWnJDR0J0K09TRkpLSmN1?=
 =?utf-8?B?ZWFQb1ZzQWUvU0VaSUxNSTAxMm8xSDNOOG1CTms5YU50UUEydHFzYmZJZE5G?=
 =?utf-8?B?RzUrZnFMTGhxKzYvU2NORzl6QzE3ZER3UnpHTlRPNTJEaVdnK01Xc0x0ZkNH?=
 =?utf-8?B?by9vWkdhVkt3QkV1eFB1VnQybDVFS3E4ZDRkTHNjOFpRTjFKaGowMENvNFhM?=
 =?utf-8?B?clBHQ2xRREVDamJTbXFSV0xHS3hVemFQYlJWUWdnbVk2SThVM2tpTnRhRDZi?=
 =?utf-8?B?cWhTc3RLLzdqMk1EVTlGdHJMRnlzRWF5QmRZNlgyU1h6Z1doMHFuZzRYL0cz?=
 =?utf-8?B?dE94NGNqZ2xreE1FT0hJbHNodVBObkk1VlZDUlpuM29JczZCc0xDdkhNaHhQ?=
 =?utf-8?B?eExnVTY2MDU0Qmh4UEpHZ2xPS09VbUV3NUJoK0hzQ1cycnhMMnF0bDZLS3ho?=
 =?utf-8?B?cmcwVFY4Y1BVeHcrT1RKV0tPNFl4UzQ3UjVlbUlQZDBjZ1ZMaURhMEtXT1o1?=
 =?utf-8?B?U0VjMGtyQWpUcUhSRDk0c2doamNNU3Z1Vy9OcGhzQVlpZklTSUJWK0NuN0Yy?=
 =?utf-8?B?dURIMzlCVGt3TlhDR1NZaFkraCtlQitGVDBEK1JuNnRYc01HemM4bUYwZEtu?=
 =?utf-8?B?MDBpRFFEWnRPMXkyRk5ab2M3V1Q1dzRmVzJza2JxcDRLS0w5QXlVNFVPQXNz?=
 =?utf-8?B?OGFMRTNBNEIrUHBtYkFNOS85Q3kwd1ZseTYxTmd1YTErRkNhaGowOWRTTUNN?=
 =?utf-8?B?S3VRak5PZzZ6RkJob2JMck1oL3RWZno1QUxleGVoSkVHYUE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OUlIcjNoK0srQlZQQm9EVWp0YkFyVjVybkdjTTlnMVMyVWNxalVONWxEOEVZ?=
 =?utf-8?B?QitpNythNWFvK29vU2cyVHhGaDBIZFJIRFdqak5qTTF5SkZ5LzYrTTZxeUFC?=
 =?utf-8?B?NEVrY2ZmYitoOG4vODMvTmRFWFJlNFgyekNZSU8rN3lyblFQbnpPbk5kNVU2?=
 =?utf-8?B?RzlQRFlpK25RWWJJUkpFa2FvWEt4SWpoQ0QvclVMODF4Q1lVTU9sMTd0WGE3?=
 =?utf-8?B?MnovenNic1ZEYnVSc29ONUxrQ1RycEJzMG4vem00RmpuQVVwd1F4Lzd2ajFB?=
 =?utf-8?B?WEpMZHlsd0VYMWF6Nzh5eVVIVGZBTFJiOHgwMVVwc3FlVGVPM3RwUFJtUFh4?=
 =?utf-8?B?Tmt5K0Q5VHhDUEpDVVNZUWlmY2F3UTBqUVRaZFVJSjJoT3daUWdUdkNJRlZD?=
 =?utf-8?B?ODJzSnQxZnhYTWlIOGF1Y1B3Yy9aRnlSUHRjc1lDU25XTUoyMVhLL3JNYzZz?=
 =?utf-8?B?ZzVNVHltRkJmY1NBNjQ0SzdjZE9RZnNDWm9mWDhQdlZ5UnJzYk4wcFJoaTQ2?=
 =?utf-8?B?eFlXYmNCRTIyUUUvZVpUTUliWjlMQjhQUTFiK3pQR3RwemQyNUlYOFNramlH?=
 =?utf-8?B?V3A0WldlV1Y0bVlMb1FsMVI2ZVQ0MXBka0dwamYzOUVNT2hyd214QysvT0Ry?=
 =?utf-8?B?TUIxdytWRHNKbCs1QmZXL0tyaTVTdGlwL1RBT2w2Q1o5bVR4cGhmWHFQaHZK?=
 =?utf-8?B?MTV4b2JFeVZpQWxpYlQ5azJCMU1rSHg5VzEyVjdycnU5Q215SVBhdzE0MUtF?=
 =?utf-8?B?ZS9kcXRGQXpNREx5UmZtL2RiM1hHdlZBMjZKdjJzd0dzMWlGbDVlQXlvWW5D?=
 =?utf-8?B?MXg1VDlYaTUrVy9pNSszenBjbUY2MTFzZjBNVDRHS3UwczJhNVlzMHhWMzJD?=
 =?utf-8?B?RHdvNXQxelhiM05TZVo3MG1CcG5YeGFCc0c2TDNWRVpqaGpXbm55OHp6cDho?=
 =?utf-8?B?ZGYra21VMGlSMVQrV1l4ekFHN2QycmZwMncrcG8rQUYycmRWS05MYnBFKytT?=
 =?utf-8?B?MmZ4MWFwNEc5d2o5MjRodTdNZndaa3hqUWROTlpWZmFXc0Vsb1Q2NHVYYncr?=
 =?utf-8?B?b3J4Q3h4YWtKNGZHTnV4V0tJQThoVWFrNDVHVWhySk1lYkl4YXN6VVBSWFhY?=
 =?utf-8?B?dTgzaE9VNEx3UngrT2E1bEJjN0praHhkMS8zUUM0VDc2anV5Mk1CSmQ0Mys0?=
 =?utf-8?B?RUJwVkhKeFkzSWNVYitvUExoSzgvMUpHUzU1NGVQTFU0STBQZGZ0ZVR0RE9L?=
 =?utf-8?B?M3FMOTlGOG53WDdQSEtXT0lmZUx5bEdJTXljamp2OEZCODk4MnpZR2lUQ2ph?=
 =?utf-8?B?dU02dWlTL3BWMjNGQm0vSUwwejBlZ3NKRHduTnd0L29mRHg5NVRQU2hid2ZR?=
 =?utf-8?B?K3luRmZlQUdiYTlWd1BhQnMvL1RRbXp6a1RNdFNBRElwc1RvQksyNEpyajl3?=
 =?utf-8?B?Q0RwUmc2Rmw2MU1sS3A4T3BxcklYdEpnTW1xRC9XMWtON1Z0VzI3eFE2T3ow?=
 =?utf-8?B?b0J0aEg0LzhkVFo5WkJPTGE0WXpVcytIVndtSjNLNVlkNGMwdExJNEVCZThG?=
 =?utf-8?B?bmo1QTA0eWFNUEMrSXRoY3p6WFMwSWRLRktHY1RnOUJySkwzYWYzdlh6akxr?=
 =?utf-8?B?b3RWRjdadlI1Wm1wTWRHWGl6ckdCNG8wV3lFRjMrSHJ4ckZxbVp1eTByR0d4?=
 =?utf-8?B?LzhneDFiKy9FV2RzWTgzTHlFTmRadW80K0dLMWc5N25PNXlvalpvREpqSXhB?=
 =?utf-8?B?M0tLLyt5dncvQXRpODMrSUxUbkJ0Q3RIdEoxWmNBQXRkeEtZVXJzMnVpY0Fo?=
 =?utf-8?B?QmN0ZzlSeHNDSktGcFRkUDNRc0lmRWs0dW9Rc2ZlLzZ5NDhmQUUydzNmZWJu?=
 =?utf-8?B?TEtJZ2Y3dlRLQXlwZ0w1ODRGVVdaZWNjbUxZb01XbExzU3ZmcjNRcUxySU1o?=
 =?utf-8?B?WUV4alNxNFd6M2dnWWc5M3BhVWxRVjdYOXNHa1I2VmEyWFl3bHowSlhqZC9U?=
 =?utf-8?B?YjF6MldXZ3pSeHNDWVJjMnRDTzZ1OFFPWkRZSExjY3RHWGdwQXRkQWtjUXlq?=
 =?utf-8?B?a1A3Y0QxT2lsdFVJRlgva0Q1WHlJRkIxbkhoeDZSUHFNZm4rM2dZWHpNaHVk?=
 =?utf-8?B?RExYZzhjb2JmYm9qYk1GUVNhbkNlMTZ5Ti9SSkJZS2RSQWVHYjhkaTJFRzl0?=
 =?utf-8?B?dEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63d2131d-cd59-4a1c-9011-08de07c12516
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 05:52:06.7368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WbnwjC+pSZqtDrAKjbXVCj7ujYWxnIZ8edOyQy2sdUD+2ci9PhX84sQkGyF6uQsRubeWE3WQOdBtgLyxTkvsQQxDAo8mK5qsBKMmPSPc77k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6403
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: oorI-zoWc_i7lVYIDZHeAnJRrfLiiMTY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEwMDAzMSBTYWx0ZWRfX+XI0i2pk1PK/
 /3NMzsDzQsvW3z9CXg/sund2okiGX4vk+n3IVgmsbmgl0F6Ay5//8t/z4FuYoTkXS3nX6sWBHOs
 pOPENXUk/8QwYAqseYYMjjTM7Ho270arTeHyPbY/lvrkueZz2iHjwLL4/nkTas+Qu1uOf/7dF9P
 l7525/aHgviHfE3s+YpCNNJ2qy7juuXazFGFavxRQjE7nAugQz7jGQPm/G0axYB3VP9xj5jT6fR
 jJ+fcfHZbqI58rLUkEUgQd1w4cLMZam33Q76ML4rfkFd69Moj0c8lsDexEgpwbPX484kRDCd8xq
 jmdZbatP5Ng6hcGjlYUg5wKxTK6gz9UwR+hWY8BtJqXSWr9vJczgb1NUh/mn8uZnpxDkEwM12fo
 zDXh4KfzhShs94aoM1U9sfFt7RY5QA==
X-Proofpoint-ORIG-GUID: _1LQR9x74X3mlKKvJOGOyHeKGmqsSiOL
X-Authority-Analysis: v=2.4 cv=N78k1m9B c=1 sm=1 tr=0 ts=68e89f09 cx=c_pps
 a=5zjvB78PlnLPEzvzEo0MXg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=e5mUnYsNAAAA:8 a=Q4-j1AaZAAAA:8
 a=aR16PxjQAAAA:8 a=t7CeM3EgAAAA:8 a=dWv9BQ01k2WeKlqPNRsA:9 a=QEXdDO2ut3YA:10
 a=7CQSdrXTAAAA:8 a=wvPkM9v7g1_ikmSEda4A:9 a=j1INbqIs9e7Q1NG1:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=Vxmtnl_E_bksehYqCbjh:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=zbFvvTOBjyH4ze5LlUjX:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510100031
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 05:52:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224663

--------------Iu1OK98tojN87i13wPhNPjS1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/30/25 00:41, Ross Burton via lists.openembedded.org wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On 25 Sep 2025, at 08:56, hongxu via lists.openembedded.org<hongxu.jia=eng.windriver.com@lists.openembedded.org>  wrote:
>> +Upstream-Status: Submitted [xorg-devel@lists.x.org]
> Patches should be submitted to GitLab I believe:
>
> https://gitlab.freedesktop.org/xorg/lib/libxcb-errors

I do not have permission (no new accounts) to submit a pull request, the 
message from https://gitlab.freedesktop.org/xorg/lib/libxcb-errors

...

Due to an influx of spam, we have had to impose restrictions on new 
accounts. Please see this wiki page 
<https://gitlab.freedesktop.org/freedesktop/freedesktop/-/wikis/home> 
for instructions on how to get full permissions. Sorry for the 
inconvenience.

...

>
>> +inherit python3native
> There is no need for this, we have a perfectly good python running bitbake.

The python to run bitbake is depends on the host, it is better to use 
python3-native to build recipe to avoid host contamination?

//Hongxu

>
> Ross
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224155):https://lists.openembedded.org/g/openembedded-core/message/224155
> Mute This Topic:https://lists.openembedded.org/mt/115426771/3617049
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [hongxu.jia@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

--------------Iu1OK98tojN87i13wPhNPjS1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 9/30/25 00:41, Ross Burton via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:A5A09505-7119-485C-A0C6-C88DE980263C@arm.com">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On 25 Sep 2025, at 08:56, hongxu via lists.openembedded.org <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia=eng.windriver.com@lists.openembedded.org">&lt;hongxu.jia=eng.windriver.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+Upstream-Status: Submitted [<a class="moz-txt-link-abbreviated" href="mailto:xorg-devel@lists.x.org">xorg-devel@lists.x.org</a>]
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Patches should be submitted to GitLab I believe:

<a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/xorg/lib/libxcb-errors">https://gitlab.freedesktop.org/xorg/lib/libxcb-errors</a></pre>
    </blockquote>
    <p>I do not have permission (no new accounts) to submit a pull
      request, the message from
      <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/xorg/lib/libxcb-errors">https://gitlab.freedesktop.org/xorg/lib/libxcb-errors</a><br>
    </p>
    <p>...</p>
    <p>Due to an influx of spam, we have had to impose restrictions on
      new accounts. Please see <a href="https://gitlab.freedesktop.org/freedesktop/freedesktop/-/wikis/home">this
        wiki page</a> for instructions on how to get full permissions.
      Sorry for the inconvenience.</p>
    <p>...<br>
    </p>
    <blockquote type="cite" cite="mid:A5A09505-7119-485C-A0C6-C88DE980263C@arm.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+inherit python3native
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
There is no need for this, we have a perfectly good python running bitbake.</pre>
    </blockquote>
    <p>The python to run bitbake is depends on the host, it is better to
      use python3-native to build recipe to avoid host contamination?<br>
    </p>
    <p>//Hongxu<br>
    </p>
    <blockquote type="cite" cite="mid:A5A09505-7119-485C-A0C6-C88DE980263C@arm.com">
      <pre class="moz-quote-pre" wrap="">

Ross

</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#224155): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/224155">https://lists.openembedded.org/g/openembedded-core/message/224155</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/115426771/3617049">https://lists.openembedded.org/mt/115426771/3617049</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:hongxu.jia@eng.windriver.com">hongxu.jia@eng.windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------Iu1OK98tojN87i13wPhNPjS1--

