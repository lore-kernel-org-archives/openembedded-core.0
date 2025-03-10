Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A49C282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 18:30:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.45935.1741631451014438503
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 11:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=516461449a=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52ABhIFS003585
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 18:30:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458b412h21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 18:30:49 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52AIUnGr032102;
	Mon, 10 Mar 2025 18:30:49 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458b412h20-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 18:30:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RyQlbrwi5y6N6of3T5PnZpxmynNtW+lkrt/seYOAPcIxOOuFEIfupnVLYoRt9bL6GgMCVjUvs2bQIz+Kvk4NppWK6BvJo9q7F2ZKsJyQ9Xcrn4M/x3VyKcEpBw0jkJidpCjVBsMMpSDnxncHK/LvLajXQKzEy3oKC3Lb6K1MTvhaSHpJYV4CKD3y7R60fa5rtU7ACEZkt5ymSO0zMBUD5IitAbIGXUBS0SwcJy4bUJ4gOIR2NZkKeF5txeJuzC2AzFmxdet8fFTkUar15jNr5W+l/ciDshEPYc6dts9Tz7cbBYH8ohhmN5awJQ1UYs6Zf+ecXR+CeUNeRy72p/jhWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqlgXhSnv6Vvm11kS5RbXfGXtFLbVPfEI+Zfu4MG5rA=;
 b=QE4hAwYSHrJapkS+HbX6nYDY8c2YcQmii+MBOzYsQb+zT6jRST8pqbgb/ceT1++vF7flm28YsCjGJCmnnrbtlrGZcvDWUitL8lLkiwjuREMhr8KZBYtxg8pJ3OMhKikJpWn7tw4wO1bbUN75sHKeiGjbmdTcN4wajKOLAVkm6vFlp8qDDCmUoTaBBY14NLOqXJxpgqPfqif1+F60I+6PSFtGRN34wEpP11g5mXzw9aHKosKwJTIYMZ8VGDEJ1Lf2tJJ0UNYnnyyFp4JD7Up21VY07FJTDMWOG2QnxXcymGflddRyqM6WRJ/qeCzbKvtFkO3xyDvvxNEDN+LfWJfm0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by PH7PR11MB7719.namprd11.prod.outlook.com (2603:10b6:510:2b4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 18:30:46 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8511.026; Mon, 10 Mar 2025
 18:30:46 +0000
Content-Type: multipart/alternative;
 boundary="------------jpnz3FJ6lABPyVbg0FJUKk0w"
Message-ID: <1184b11b-e681-4e5c-9d1d-b0c361c18b30@windriver.com>
Date: Mon, 10 Mar 2025 14:30:42 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] minizip: Add new recipe
To: ross.burton@arm.com,
        "mingli.yu@eng.windriver.com" <mingli.yu@eng.windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250307075100.645020-1-mingli.yu@eng.windriver.com>
 <919CBDF5-C00B-47CD-93EA-0A7BFB4B6028@arm.com>
 <fdcdab78-ab77-41f8-bc9a-b9acee540e7c@windriver.com>
 <9A947B7E-8A39-4937-8DAB-A28EED019B8C@arm.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <9A947B7E-8A39-4937-8DAB-A28EED019B8C@arm.com>
X-ClientProxiedBy: SJ0PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::33) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|PH7PR11MB7719:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d819c95-dca8-44a4-b9be-08dd6001ac3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|366016|1800799024|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ck1TN2dHNE5kcGM0WHZPclBpbTQ3Q2twL0h5dE5iUVgzQkprdk8xSnVTNGxx?=
 =?utf-8?B?UTREb1g4eDFMaVhLRUYvQVkvN0NqUitrRC8zczh2VncyQmVzMW1TK0hLZGx4?=
 =?utf-8?B?emNyN0VQcFEyRXh6VlI0cjdCZkFEbTlacVZtbWMyeHd5WFk0YWI1c0p0Sko2?=
 =?utf-8?B?bnBHNGhRUmdYbGp0NjF0NWZITjViNkFxa2dJcm5IWUwrVlFyNmZVNGZHT3Vm?=
 =?utf-8?B?eG9LMzBBbERlQWJMWmlYY1FZTkVFb2hRdzdkV2Q5VWpEVUNKVUlTanRzTCt0?=
 =?utf-8?B?WjZzVlFKU3NVZGluVzNkTkRoWVVYaFNGbENGL0Z2cFVtWlh3U21MeEZVU0FK?=
 =?utf-8?B?U0YwREN4WUd6eFFISSsrQ0s4K1YrTWlGeXc0UmVNNTdOeDlBbkZPbGVrV3g4?=
 =?utf-8?B?Z2lRQU1HSWc3bitNMFJTQzBLRzNpM3BmaXVBM0JPU05URjF0T3ZPUy83cDFm?=
 =?utf-8?B?MDlrNU5WL0NGUUJJeUpqM1RucURnaUlXclUxUU55WTNtR3RPRFMyWkFkUW9B?=
 =?utf-8?B?Z2FQWUU2STRwWEgxWmRvZnBCU092VkUyNytGSEZ0M0FLTU9rMEMyRnp5ckxt?=
 =?utf-8?B?VHZuYXFlb2tTUnpySmlVLzFoSjk5VjREVGlrZEVXS3R2RklFdmoxdWlDZFZx?=
 =?utf-8?B?eHNyVW1zQjFDS1ZadWxNNjRvOUtsM1pjZURVKzhKS3VBWFNrMGRJTWFVaU50?=
 =?utf-8?B?T1lDbUxUbHBRalMwNHlpdmNwS054NFRZNEk5QzdEYVhWMUpyeDRoUkwzSm5U?=
 =?utf-8?B?N1pJekRreUZoQkxXZkhIK1RQRWdxUVRVbmVzU1gvVDlWdEZYREVkdFo3YURQ?=
 =?utf-8?B?aWUzcUdGaGVwU3JLTHZuV1BnZDhsampxNWFvblJLYmQ3bHNYSDlLRUE5K0I1?=
 =?utf-8?B?TTh3eGJnN3dXZGhEcjY5NjZyQ2o1U3lTbEwzUkx4c2x4TnlJMVN0cysvMkVy?=
 =?utf-8?B?VEN1TGk3bXVOS1lkODJFWkxVQXI0N1h1Smt2Wnk1N1NXcS9ORDU5VGV1MURO?=
 =?utf-8?B?dExmK0hSVDhRWVJzQTZPUU1vYmkxVzgxaVMvVGdrR2IwdWxBYk05ZWZqRXIx?=
 =?utf-8?B?bHZPeWNoazM1UEVuNWRkaCtHNWxGYWh1MmlIcHpBYUlESklqeDIvcDVtL1ZI?=
 =?utf-8?B?d2FQbmJvR0t1aUw1cllhdi9uRzdLTmcxOWdGSVhWZCs5dm94SjdtbXZIRHhF?=
 =?utf-8?B?aGtVSmdsRDFaR3pQbzBpTHk4aWtCeW9hbHE3UU5NekZhK3VPY05XTUJtWlpi?=
 =?utf-8?B?NE9mem5HWGwwd2drUFdwSDZjUVllOUhldmNMTmpvS3VUa0dzMUN1UmtFYVVX?=
 =?utf-8?B?Nk5BUU9hWHZzL0R1dzhkRGM4REFYclJ0RVF0c2p5dk03UEZJWFl0bUpxNkQ3?=
 =?utf-8?B?dWJKdFBNSTZnZFBERFNJYzZUNllqUEFMZHNTL2svOWVGTER4MWswNzk1RGdo?=
 =?utf-8?B?ZDU2R09pWFd2QW9BZ1VWaG82dGlKaWxYSTBlbWJKb0szT3REK2hreVJmLzhE?=
 =?utf-8?B?cnpma3Z0VjRRalQwbElRRzA1cGc0a2RFcmtPYnc5S3hGV3RDNTc3NGsza0ln?=
 =?utf-8?B?RG1UNnNJaDBaVDNPK1BOWTcrWmpJZFFIZDRnemIxbmFwVTJnN21Vd2s3NGhL?=
 =?utf-8?B?TUxYeU5aMVl2aG03R25CSzY3WVFjZW02ZEE0YU9XZFZBNmQ0MDFURTZKU3k2?=
 =?utf-8?B?Q0ZTdURCT1VHVVVZNDhMQTlUaDRGVkJZQ2hjOWxMY1JuT3FlcG9SQThBRkda?=
 =?utf-8?B?cTV1Q2pPZm9XOFdTT1VYL1lkR04yUWliazBlQlVUSm1aZkZqc0g2Y2tzc1oz?=
 =?utf-8?B?SkRqSUdnYzY5TWxLNjJmUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cHBwYlVsSk9YamRkd2ZZRWVTZkswOGo4SlVKNUc2N0tvWHRjNTZ2eXBsdDRW?=
 =?utf-8?B?Rkc4VjNyUHErSFhwOVNVemMreit1WU9sek1CSEloM1NSZXEwUTlxY2MvcktB?=
 =?utf-8?B?L0VjM0F4Tm9QTW1MKzJKNE04dm5FcGx5T0RvSk0rQlFPbldrdWdPT2JJemZ6?=
 =?utf-8?B?MzYxY2JLRHVZdWJRVzY1NWwzZDN4NHFKbm43V3V2QndDQ3d5R0IxR2VBU0Jy?=
 =?utf-8?B?aXZLK1o1aU5hMERsM040QUpOZU15NGtHS2o0U2xFVWszR3RqMHRwUC9xZUVl?=
 =?utf-8?B?ZGlYQjUxYTE2ayt2eHhkblhjdlhjQUJCbGtwMjdCSmdzQmVxdmRtOXpWUktC?=
 =?utf-8?B?blBTazdHT21iYVhPTXNITy8rTGRRUkM1djc3VlQrVENmekhsd3dBWGZ3OGlW?=
 =?utf-8?B?R2FSbEJlUlhyWkZydVg4RnRNQ1V1Q3FweDNsdjFIRXEvS1N4cFRUSGQ2SzNR?=
 =?utf-8?B?NVRYbGdiZ3g4WklHc2FNbGxjNk5SaTRSSHk2czlmTVpiT1dpOS9POE5GWENR?=
 =?utf-8?B?NE1BM3VNM21wRjZrMHRTczlkaXZjb0dUL0tHRlNzUktSSlNMNnhEZlN0TUln?=
 =?utf-8?B?cGYzazFkbEdzVlRMb0c0aUw4eXErUjkveHFxYk4zOUo4dFlaTzVSOEg1eWJV?=
 =?utf-8?B?emQrNlBNaEJRbEJXV3RaeUhjVnlUc0IwZExlN29CenQ5bHNZN2g1UHh1dUky?=
 =?utf-8?B?dCs1L3RQUE1XNGxnWk1JbWhRRFZlVW11ZVhka1JWc0ZiMmkvVnpGRWFOU2gr?=
 =?utf-8?B?VkgzQ3Ewc3hHYWlmbjFOM1h3QVlLUk1MUCtzZ3dhekpEbmJyZEx3OTlsK1lo?=
 =?utf-8?B?WEJWZ0Z2NzVCeENzc1dWcDRoN201VFExbTJ2dHVSNmZIVlE0WVhod09NZUhp?=
 =?utf-8?B?THJNN2VGeFFRbnIwejJHZUNidFFTRWtJUHZoN0hpcGUydHcwNndiK0dUcHRa?=
 =?utf-8?B?c2pmWW1QWTFoRkhDM1Q3Q3c0L1QzWDlobE96SndZRldvOFJjVlZ2REcvUy9J?=
 =?utf-8?B?RU16ZmF5N0MwYk1YcGtMWkZZOG9sdXUxMk5FNnpQRGVtK2xNbnBZcVQwK0Zl?=
 =?utf-8?B?UEpMNTZXd0U5OXV1TVdLWVNmdlZQTmdxVWpQMWhGUlBkTVpWL2Qya3Foa0xW?=
 =?utf-8?B?WW01OWZHaEozVnVJMEhnTkZLOFJGb2hOZVAwMHVWWnJrVmViNWRkZmd5RU4w?=
 =?utf-8?B?VHFqVjRGL242ZGxYblVhbDdQQmN2Vm8wZVpHNTkxT0VaSzhmVXJoeStJS1Nn?=
 =?utf-8?B?M0VjSTN0UUgxek1yTC93cjNraERqREtJemxnUklXNk9EYUFQRVhKTnVJMmNW?=
 =?utf-8?B?Q29tVy9HYm5HNTFudmVhcDVMQXdyYTNOd0NTTjlNTWlHeGxESTBzMFhhV01p?=
 =?utf-8?B?UGJTeEJ3cDlaeGFGZTlDR2ZKN1ZDZUpyYThCcVFKRy9rL1dSZ2ZEZ0NPOHpz?=
 =?utf-8?B?QWFkVkluaW9ROG0yU3A0RHMyejZvamZQbGMzTTR3R3lYcnpLY3A0ME8xc1BF?=
 =?utf-8?B?Z3FYbDlYenh1dUtQOFdLSjhrd2JWYkpmaC93eUU1cFNnVU5vQzIxbWhiMGdw?=
 =?utf-8?B?K0hEVzVxWlJCZFFOWE03emk5VnJKbWxsSXFOR0diL1FiNU84cXlyc3VIZSti?=
 =?utf-8?B?cXBqN2xOdW9iM2J0MDY0Q1Jxb3FqZCtEQnVEQzlubTZmaC9UelhGZytNUWMz?=
 =?utf-8?B?UVRwWkpmalhqRHZMWDJEYUdVWXBSVW15Ty82Rk8wYlQyTlY4MmlrT2ZJbUdv?=
 =?utf-8?B?aFVuejVabitYdWNXNUMzL2Rxd3RCTk5mZjJBazlwZ05MbENJbGJYdEpuQXE1?=
 =?utf-8?B?UUtESGlpTlNUdm5CZ2xJY0lodmhGeWR3MXorbXVmdU15SDF2VnhhOEdnM2cr?=
 =?utf-8?B?ZUpYcnVCOG43NlZyYUxqblVuYXQ3NlRvZkNqKy84Ty9MWU5sMGpYbDZiN2U2?=
 =?utf-8?B?dzNiVW9wOUN5TGlramdMK0Zzd3ZMdUdWanEwaFN4MU5mZDNNNFZaSFY0anhP?=
 =?utf-8?B?NHY0a3p6MkM0WCs5em95U2lZUXZIWjJBL0NoT01hY3ByQ0RyMjU1L0t3akhx?=
 =?utf-8?B?cVBSamhkNEVXbWE4Z2dyTzZYSU9rb1NoTDJ0ckpOMm5US0pGMEZtVittSjh0?=
 =?utf-8?B?T2psbWV5YnROS28wUnd6cy9IWnNZTnpGZFBpd3VNbU1DUHB2Mk9NUE1sNjY4?=
 =?utf-8?B?Qmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d819c95-dca8-44a4-b9be-08dd6001ac3c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 18:30:45.9697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mpjJab/w6Q3GfkWjCxBOR/tQz+iniOS5blGKBkzka0MvE3507Jaj5tmGrs2kQAw3yoSukp2EhmBjHCdmTI+L62w0FVsxJN3HEKws8ITx1qk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7719
X-Authority-Analysis: v=2.4 cv=JYNGrVKV c=1 sm=1 tr=0 ts=67cf2fd9 cx=c_pps a=6L7f6dt9FWfToKUQdDsCmg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=WNDY76dxAAAA:8 a=1pLMaboaAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=KTdZ8aUT3yf3-JB8JLgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=7CQSdrXTAAAA:8 a=LVVdaqqDU9W9cF4QaU8A:9 a=hYO-RHtqq3nBydMG:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=HFDSX3BADwN2sFIQuyTb:22
 a=2aaH65VIsbpPzA9iZWfO:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: yZcTBPAA6-A9Ywo17cKVvYPlfm-ZYVol
X-Proofpoint-GUID: diDOMYGsN_y260KAexDoxlTxS14U8-AL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_06,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=724 mlxscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503100143
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 18:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212535

--------------jpnz3FJ6lABPyVbg0FJUKk0w
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52ABhIFS003585

On 2025-03-10 8:51 a.m., Ross Burton via lists.openembedded.org wrote:
> On 10 Mar 2025, at 02:50, Yu, Mingli via lists.openembedded.org<mingli.=
yu=3Deng.windriver.com@lists.openembedded.org> wrote:
>> Hi Ross,
>>
>> On 3/7/25 18:24, Ross Burton wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
>>> On 7 Mar 2025, at 07:51, Yu, Mingli via lists.openembedded.org<mingli=
.yu=3Deng.windriver.com@lists.openembedded.org> wrote:
>>>> From: Mingli Yu<mingli.yu@windriver.com>
>>>>
>>>> minizip [1] uses zlib [2] to support compressed archives.
>>>>
>>>> minizip is not part of zlib, but is included in the zlib
>>>> distribution [1] as a third-party contribution in the contrib
>>>> directory.
>>> The minizip which has "All files under this contrib directory are UNS=
UPPORTED. They were
>>> provided by users of zlib and were not tested by the authors of zlib.=
=E2=80=9D in the README?
>>> Why would we need this at all, and why would it be in core?
>> If it's not appropriate to send this patch to core, I will resend to o=
ther layer.
> It=E2=80=99s almost definitely not appropriate for core, but why would =
you need a recipe for it at all?


It was a customer request. I should have asked why, as you are now so
we'll do that and we'll get back to you.


Note that minizip is used in meta-qt6:
https://code.qt.io/cgit/yocto/meta-qt6.git/commit/?id=3D9c2b02aab650137fd=
8c0febaecbc6d593ffb3d02

 =C2=A0=C2=A0=C2=A0 WebEngine needs minizip which is part of zlib.Till no=
w it always built
 =C2=A0=C2=A0=C2=A0 bundled zip as minizip recipe does not exist in poky =
and moreover this
 =C2=A0=C2=A0=C2=A0 was never a configurable feature as it was not in PAC=
KAGECONFIG.

 =C2=A0=C2=A0=C2=A0 A change in https://codereview.qt-project.org/c/qt/qt=
webengine/+/384262
 =C2=A0=C2=A0=C2=A0 enables compilation of bundled minizip against system=
 zlib (by using
 =C2=A0=C2=A0=C2=A0 shim headers) however it is not advisable as those tw=
o version of zip
 =C2=A0=C2=A0=C2=A0 might be different and minizip is project wise a part=
 of zlib.

 =C2=A0=C2=A0=C2=A0 Therefore introduce cheap rip off of zlib recipe, how=
ever
 =C2=A0=C2=A0=C2=A0 building minizip from same source tree.


That isn't a very satisfying explanation of why the WebEngine prefers=20
minizip to zlib...


Stay tuned,

../Randy




>
> Ross
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212515):https://lists.openembedded.org/g/openembedd=
ed-core/message/212515
> Mute This Topic:https://lists.openembedded.org/mt/111564172/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------jpnz3FJ6lABPyVbg0FJUKk0w
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52ABhIFS003585

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2025-03-10 8:51 a.m., Ross Burton
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:9A947B7E-8A39-4937-8DAB-A28EED0=
19B8C@arm.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">On 10 Mar 2025, at 02:50, Yu=
, Mingli via lists.openembedded.org <a class=3D"moz-txt-link-rfc2396E" hr=
ef=3D"mailto:mingli.yu=3Deng.windriver.com@lists.openembedded.org">&lt;mi=
ngli.yu=3Deng.windriver.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">Hi Ross,

On 3/7/25 18:24, Ross Burton wrote:
</pre>
        <blockquote type=3D"cite">
          <pre wrap=3D"" class=3D"moz-quote-pre">CAUTION: This email come=
s from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
On 7 Mar 2025, at 07:51, Yu, Mingli via lists.openembedded.org <a class=3D=
"moz-txt-link-rfc2396E" href=3D"mailto:mingli.yu=3Deng.windriver.com@list=
s.openembedded.org">&lt;mingli.yu=3Deng.windriver.com@lists.openembedded.=
org&gt;</a> wrote:
</pre>
          <blockquote type=3D"cite">
            <pre wrap=3D"" class=3D"moz-quote-pre">From: Mingli Yu <a cla=
ss=3D"moz-txt-link-rfc2396E" href=3D"mailto:mingli.yu@windriver.com">&lt;=
mingli.yu@windriver.com&gt;</a>

minizip [1] uses zlib [2] to support compressed archives.

minizip is not part of zlib, but is included in the zlib
distribution [1] as a third-party contribution in the contrib
directory.
</pre>
          </blockquote>
          <pre wrap=3D"" class=3D"moz-quote-pre">The minizip which has &q=
uot;All files under this contrib directory are UNSUPPORTED. They were
provided by users of zlib and were not tested by the authors of zlib.=E2=80=
=9D in the README?
Why would we need this at all, and why would it be in core?
</pre>
        </blockquote>
        <pre wrap=3D"" class=3D"moz-quote-pre">If it's not appropriate to=
 send this patch to core, I will resend to other layer.
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">It=E2=80=99s almost definite=
ly not appropriate for core, but why would you need a recipe for it at al=
l?</pre>
    </blockquote>
    <p><br>
    </p>
    <p>It was a customer request. I should have asked why, as you are
      now so <br>
      we'll do that and we'll get back to you.</p>
    <p><br>
    </p>
    <p>Note that minizip is used in meta-qt6:<br>
<a class=3D"moz-txt-link-freetext" href=3D"https://code.qt.io/cgit/yocto/=
meta-qt6.git/commit/?id=3D9c2b02aab650137fd8c0febaecbc6d593ffb3d02">https=
://code.qt.io/cgit/yocto/meta-qt6.git/commit/?id=3D9c2b02aab650137fd8c0fe=
baecbc6d593ffb3d02</a></p>
    <p>&nbsp;&nbsp;&nbsp; WebEngine needs minizip which is part of zlib.T=
ill now it
      always built<br>
      &nbsp;&nbsp;&nbsp; bundled zip as minizip recipe does not exist in =
poky and
      moreover this<br>
      &nbsp;&nbsp;&nbsp; was never a configurable feature as it was not i=
n
      PACKAGECONFIG.<br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; A change in
      <a class=3D"moz-txt-link-freetext" href=3D"https://codereview.qt-pr=
oject.org/c/qt/qtwebengine/+/384262">https://codereview.qt-project.org/c/=
qt/qtwebengine/+/384262</a><br>
      &nbsp;&nbsp;&nbsp; enables compilation of bundled minizip against s=
ystem zlib (by
      using<br>
      &nbsp;&nbsp;&nbsp; shim headers) however it is not advisable as tho=
se two version
      of zip<br>
      &nbsp;&nbsp;&nbsp; might be different and minizip is project wise a=
 part of zlib.<br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; Therefore introduce cheap rip off of zlib recipe=
, however<br>
      &nbsp;&nbsp;&nbsp; building minizip from same source tree.<br>
    </p>
    <p><br>
    </p>
    <p>That isn't a very satisfying explanation of why the WebEngine
      prefers minizip to zlib...<br>
    </p>
    <p><br>
      Stay tuned,<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:9A947B7E-8A39-4937-8DAB-A28EED0=
19B8C@arm.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

Ross</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#212515): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/212515">https:/=
/lists.openembedded.org/g/openembedded-core/message/212515</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/111564172/3616765">https://lists.openembedded.org/mt=
/111564172/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------jpnz3FJ6lABPyVbg0FJUKk0w--

