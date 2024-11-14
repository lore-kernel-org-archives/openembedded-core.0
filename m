Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 738B1D65C70
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 11:03:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.34836.1731582179250210940
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Nov 2024 03:02:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1048f74af6=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE6o0gK030582
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 03:02:59 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2049.outbound.protection.outlook.com [104.47.55.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42uwppbpr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 03:02:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M1WzDYYPE+M6WNZoY93PPu/itteYBFw0c3aBQx6y2GORk+GiCVxoCbQeD8zFkOGxUGWSEMnUUDREN3zxg2d2o76ZyhtD886s9P/q20PxfZABjYSQhHiHlrhP51uX0zHooBa70q5bFEaOUKuw7zHHqaVnUMJwhtFoMtFUuH3R4/THpE6iWrQjItiozr8n+ARQv5OCySdM90giMBXKn+3v3IQiyP2dXfCfaGBEtAZ2FCm3FqehHiUWaI12/DpPYI7vbN3dRe+8mM/Et1y1jfMimdVWWObtohniv4LdoRYR0YaaxOrEHyeC9+GUe4w2BIGkGF3KXDcEZlqEwtG+lbTvig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lYoN+nZ5FOnUEkCdA5p0loB/HFGMpYQKTyQMXSZZkSg=;
 b=B8HWw3NNd5OmNvg9mOJV7lBx0phjJI3V2BecNi8OpU9D+cD34Dm6YLzMmW3/D2QCWPKwgGIKbrtFM7j0rOs4MlUyhsO7jjGQ3AFS8gtbZUh12ial0Xy8w9aigSmKGptVwtZOkZzhN/oGip69u2YayyHHyOfbzsuxsE42g45Lwk4TJMqY/Co8QnCj9N7wIuXp5XXlvvvv+2CxQYufRbEJz9mHc8yOvP0/0XL/WzL2G7n+jIIImWct0X823LWaZdZ0R2b6zK0tAvYyjWc0MeFyAm5hd0c0og3MBBRt/4nOyNajRjK4f9YKGPT+WKZ/Yn3UWkDT5D0mnEMkiHTjo77kBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by PH8PR11MB7144.namprd11.prod.outlook.com (2603:10b6:510:22c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 11:02:55 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%3]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 11:02:55 +0000
Message-ID: <cbc0bcd9-ef88-4fa8-9595-e69d8a794c47@windriver.com>
Date: Thu, 14 Nov 2024 16:32:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cargo: Increase RUST_MIN_STACK size to avoid SIGSEGV in
 DEBUG builds only.
To: Randy MacLeod <randy.macleod@windriver.com>,
        openembedded-core@lists.openembedded.org
Cc: Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20241030111601.284064-1-Yash.Shinde@windriver.com>
 <90fa600f-7b0a-4dc6-a58a-90997995ce86@windriver.com>
 <7a5cd559-7db3-461d-bef6-10e4545e1b8a@windriver.com>
 <35d5f2ec-4281-4be1-8040-829dbbdc0d58@windriver.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <35d5f2ec-4281-4be1-8040-829dbbdc0d58@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0PR03CA0118.namprd03.prod.outlook.com
 (2603:10b6:a03:333::33) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|PH8PR11MB7144:EE_
X-MS-Office365-Filtering-Correlation-Id: eefff789-1390-4a08-bff6-08dd049be409
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ck1ib1hXN3pqNUw0OFVYTUlCSCtYcE5qRUhWUDY3VWtxRXpUbUE0M2xpbVFB?=
 =?utf-8?B?WlJOaWxsYmhoWklzNG9DOFdhSVNiUDVsYmdxOUVqMVJlUlRvTHV4ekdlMVlC?=
 =?utf-8?B?NDgrUXV1SmIxTFZaQWUwc2FuZW5xaGM5ZXpTS1ZVTzJOU0FGWGJYL1hLRTJL?=
 =?utf-8?B?cmhlMVhFaVdhRlJqSnVBTjJTaFdxQU0vNS9iWXozMlhoZHJ0NGFqYUp0Tnpo?=
 =?utf-8?B?aU1KdHNUbzBmSVlpSWg3c25aeVkya2hhbUh4Z3hDR3hHUzIvV0g4aE9PY1dT?=
 =?utf-8?B?UnRyNitZMUZsMFFkVHdTZW5NQXRxYXdpL1ptTFRuTUJ2RkoxYmxqUHYzTkRB?=
 =?utf-8?B?VTRwZkNpN1hFTlk2NkFhbEhrMGpmTFJJM1g2R200cW15aERPeldub05vRDlz?=
 =?utf-8?B?enFsVVRRQVdRQzNkaUlzd0g5QjQwU2tRZHhoYStIeGFUWlVHU3I4MmU5Ymxm?=
 =?utf-8?B?VTFlNHpMTjYwcFZlS1R2eGF4cHB4bHNPWkgrWlZVeFdUL3hwc1Rvd0tOd2lD?=
 =?utf-8?B?dEt6K3l0a2lrOHkxZTRibmZjdTdjT0NBalpBaHVyNkllZVVDc20xQXRENkFm?=
 =?utf-8?B?Z3pPT3hERm8veU11aW91Tk5ic0hLMk5PblJpSGZNcWxsSXluaGwvV0oyV1R5?=
 =?utf-8?B?MlpUMDAzU2EvNVZScDJQNXRsSDhnUEU0c1B0SzdYS0tIVkpYOEp3WS9ObXRh?=
 =?utf-8?B?UGdjaDVZTURWYm1aeTFERDMwbGtZRFhhTGlGc1YvOU5QNHRCb3lzeHNHR0Fl?=
 =?utf-8?B?QmVNOFBDMnZHQjNENFRQREl0Y0p4V21Oa2tPRE5GS3VKYkt4MXNoNm9wL0RJ?=
 =?utf-8?B?aW0zK2xyN3JBYlpKdlAyaDUyVVFvQzQxOTZxUk5rWXlnVXBUdjlMaW5rODJM?=
 =?utf-8?B?NisrZTZOUkJhQ3JJQWlWcTQxZmhab3pwcE56bDRsektuTFNCUEM2VGR3dkpK?=
 =?utf-8?B?b0lXRW9nN0N3RXU5U2JVRVZPMVJSd2EwMldCWktJeHBDd3FyRmN5S1F0UFlq?=
 =?utf-8?B?bTkwa28wOVFBZFhoWXpmR3hiSEQvYzlVK1dRZk5WTXpjVGVQN3RLZm50c2hZ?=
 =?utf-8?B?VTdwZlBaZy80RkltTUw4TEZ0SGtRM3B5cXBBSFZyL2JpcTR4bmpOaGdvaFFJ?=
 =?utf-8?B?c09BRWNMSE1nVElxWmVKSndBRjI2WVBwTUhXSWJqNklESEtLZHNhKzYycytn?=
 =?utf-8?B?YjZrTTNyQmZ4aFk1UFBWOFBxR3JEczUvQ2NydFBaeENSWWJpT0xWS3hGY0xI?=
 =?utf-8?B?NDNRVWpPR2NBQVI3b1hBRWtrc3FtUCtBZll5STdZdE9xbzU4aUJjcktxK1Nz?=
 =?utf-8?B?WExidTIrVnJXbHJNTnRUMXEvdWx2ZW90YzlvaVUvZjFRTzNHSnMyM0QvT3Bh?=
 =?utf-8?B?QmRTSzJhNGJheGpWRTVtQzFvMHpGNkd6THlWZUhDYktqblFLNmpoYmsxdmlv?=
 =?utf-8?B?bmlxQW5RTnhxWW5zVGdST2hFc2dMUVFFTUNMbU5uNlovdkczbllxWDJyTlpo?=
 =?utf-8?B?YkxCNjRHZ1R0dW1YSzVweXVsVWFTQlkxZ1E5cXlzaGxQVjNqQW5MZXIwc0lJ?=
 =?utf-8?B?aG9JbXpSYXp5ZWNqVldNOFNkSURaMCtnZEVRSmhLbzdPaEJML0VyQXNaNU9R?=
 =?utf-8?B?ZGxxQ1ZuNUw1MlVNSWJleGF4Sk04SEQrdHp0NmM5Rk5qdW9WcERSNWFiZlJu?=
 =?utf-8?B?eWlQY3NicUx5TFVvektnZW5ITmlNeUxkRTVxOXp5aUdlcDB5Q3pESTR1eE5n?=
 =?utf-8?Q?I5JFUytp36uZNJgKmfsZxj3NxtO4jEhAXJ2kt/k?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZHlmMGNPQTNBSktudHZ1RDB1T2M0TlJLWVdpVnFGRjR3cWhPSHpzM3Z1cTEw?=
 =?utf-8?B?YU9ITXBTb2szeUdvRFlMWURralVTSkxVMzdUWjMwS3BhVis2S01RT3JiVGtT?=
 =?utf-8?B?Y2pvWWxLbzVPak41WUh3bnNJMktPM0IyeGFSeEVwM3Njb3FCVVplMEF4dW5W?=
 =?utf-8?B?NG9DRnlFSmoyeXJBa0NoLyszUWdYUFNQUTYvZ1hkTHZONitBc2tvZy9FK2lG?=
 =?utf-8?B?RVlYRlNnUitHblpwUTg1REliaWpNbVg3Mm9yRzM5d0NONVJNelZPUVUwVkg0?=
 =?utf-8?B?WW9tQkcrMVd5TTdKc2tDRGtvbnM4ZHlCd1JJZkU3MkhBNGxjVnBrUm04cFpv?=
 =?utf-8?B?ZW5sK1FVUkxteFJGS3MzQm04VmRvSVVSQmkxTVRDQWVzQWc1UFkzU0dtVFNE?=
 =?utf-8?B?NmxmK2hUNjdxM0xmRmtnUGh1emhId2h1MnFKL0VvRTQvN0t2eW9PMkdIZEJs?=
 =?utf-8?B?WkxCcjFLaDEveHh1NU10K08yWTVueCtXL3NJalJORG4zeFhkdlhuOG0zRU9s?=
 =?utf-8?B?enJqaFE0QWNYRGZZWGxZZFBkYzFvcE1TRWVKdndSMmFLSmhuWXNMdElwaGc0?=
 =?utf-8?B?Z1A3SHVyR1R5b21MWjNpZjZMTHJHMnFaVmxjNFRSVkRhUXJEdGQ4RjVrUmJj?=
 =?utf-8?B?bWdMKzJ3Vk52WVNqRmNBL3pHdFRyTlhmWG95Ykk4aDJOTjJyRGZBdjhxTGRy?=
 =?utf-8?B?aC9LRW5NM0ZrQlprN3NtVXN2Vk1GRXZ5WTNvQW56TFV5cHdXKzJKc3hhMmZa?=
 =?utf-8?B?VFdMNlhYRWRzd0xkcE1BMk02aWJSQTJhV1hiSG5STGJHRW1OR3NxZHNwb2w1?=
 =?utf-8?B?Njd1bDZpSEJGUGQ4RmpZZ1pWU0RJaSsrYVFNc25WSytrTVN3MXJTVTdKSVpz?=
 =?utf-8?B?QmpYNTFFV3dBZzFOdzhmYWQyUXowRXJlcWgvemhqbGo3dWpxRWdKNi9aTnVa?=
 =?utf-8?B?T3BOTHc5emNOOC9LWHQzSndlUHE4REVvNVRURnBqUXp0YVlwalF5NFd6YjRu?=
 =?utf-8?B?OFlaNE5CKzFENHk5SlJBSXJPbkNxbS9meHNKTlQ5L2k5YmQzVmFWTVA4Smh0?=
 =?utf-8?B?N1NPbWE0akF5Nm80ZjdRMDZlTEgvNU9oZHNmMTdRZ1o3L3lEUlcreEpBRzZS?=
 =?utf-8?B?S0JpWXNZWU1CUnA2aHNCeWJUL0FDU1BBbUkxUFdyelArdkxEU1JpTmVvK0hx?=
 =?utf-8?B?ZC95a0N4RSs1TVNRUzRidHJSWFVmWHJhZS9ka3pwRm5WUHZ4L0ZRdGdOT2Jj?=
 =?utf-8?B?clMvL1Zyby9yVlNMNXpnODVlNDl3VkFoVi9nTmU2TzdEL1MvRloyYzlYZk96?=
 =?utf-8?B?c0s1eHFqazFBbXk5ektneldIQS9xcSt2cXg5TVd4MFZyVUJOT0FCREhoNzd3?=
 =?utf-8?B?Q2h2dklZSU9iM0NvRVRsSzUrS0VNS1JJKzA1UEdXRkcrbDA4YmY0Zm9LbjNF?=
 =?utf-8?B?ZDFMVHlOcE5IUUllUkMxc3RaTmhudkFRYzZrenNXNmRsdEVqVnM4VFVXT2RZ?=
 =?utf-8?B?dWVWRnJhZUd5QmVSY2RBLzF3UitHOHZhdWJJQng2TzFlSjZkTWlVMEVXOGU1?=
 =?utf-8?B?cmNiSUlTZy9xM2pwVThzZTk4cThQbEp0RUkvRzdjdXRKZTlaejcwWm5SakY5?=
 =?utf-8?B?VEpMbVJ6VFhxUml6NTl5SlJKSVRDYU4vRDZ0SzdyN0dSM3M2d1c4Mk96eU0w?=
 =?utf-8?B?dVVJUnlzaXRtdVREbEpab1Y2VC9GSXQ5RDd4dFEyRzVuOGxUaGI0WU9mcGlS?=
 =?utf-8?B?MGt3czhKS1VRM1plS2hNZUlxeERlSVFmQW8yLzNtdk9qUGo1SmIzNzY1eW5n?=
 =?utf-8?B?TWJPT29qQ1B0dEUveFdrenJ6Nm83TEVwM09UakhEOGxCRHMxTlBSWGdFOTdo?=
 =?utf-8?B?UVdLSVFCaWlQTW9kOXhLaWlSUUgzQTA3a0ZOMWdNRzAyN3VtY3Yrb09qRmFy?=
 =?utf-8?B?YVBodzNveDFtK1ovVkQ2M1UxdzMwckh2bW5zaDZ1Q09sNkY4R2IrakE4ajFQ?=
 =?utf-8?B?MXZOak5NUkZtQ2RaczBSdzdrdEo1WlRzT1VCMzZCajY2ZThkM0k2N0NSeXRy?=
 =?utf-8?B?YnlsN3Zrb2tTeXZibzFHcW8xUjliN1VaQ1pMZVhPcnJKUHRuaC9PQ0NnY3I0?=
 =?utf-8?B?U2hDUmxnT0N0SG9uODJSR0kva1dYYUZnWmlPQnN2bU1WQ0VqL0FGRnhZZ3g3?=
 =?utf-8?B?K0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eefff789-1390-4a08-bff6-08dd049be409
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 11:02:55.1091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6CCKB7G9uDp3q4FqqoDBE/KDwC++1nxuC3ZJ1jhDtqtKSQ0KXBX+4ixzT/GSEM8OQ0pFujU6tpLaYxOi1trfhIgUzpE4eE1TmQj1Ryh/25E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7144
X-Proofpoint-ORIG-GUID: pqOKwRbSGdHZkVu5UHteHuGRpNYnxhoL
X-Proofpoint-GUID: pqOKwRbSGdHZkVu5UHteHuGRpNYnxhoL
X-Authority-Analysis: v=2.4 cv=J4f47xnS c=1 sm=1 tr=0 ts=6735d8e2 cx=c_pps a=OxY2RB2sa7x8oI2LU21LDQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10
 a=NEAV23lmAAAA:8 a=sEdBFs-bs_4iHOBWBUkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_03,2024-11-13_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 bulkscore=0 clxscore=1015 mlxscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411140086
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4AE6o0gK030582
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 11:03:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207147


On 31-10-2024 19:32, Randy MacLeod wrote:
>
> We discussed this issue and agreed that since it doesn't affect YP AB=20
> since there are no DEBUG builds done there
> and more importantly since it's really a work-around rather than a=20
> fix, we'll continue to work with upstream p384
> crate owners to resolve the issue. Forcing users to change the stack=20
> size, even for debug builds, is not a good policy
> and hopefully some of the code-generation tools that are inputs to=20
> p384 can be adjusted to reduce stack usage.
>
> ../Randy
>
This issue is now fixed by removing unused mut variables in p384 crate=20
and thus reducing the codegen.
(https://github.com/RustCrypto/elliptic-curves/commit/7652c5842cde60acc1e=
739ebbba34614cb158f8b)

The current stable version of the RustCrypto=C2=A0 p384 crate is v0.13.0,=
=20
which is also the default version for building with Rust.
But, the fix has been merged into the pre-release versions=20
"p384/v0.14.0-pre.2" and "p384/v0.14.0-pre.1." of p384 crate.

I have opened a discussion thread in p384 crate:=20
https://github.com/RustCrypto/elliptic-curves/discussions/1102
to ask the crate developers either to update p384 crate into new version=20
with the fix, or backport it to "v.0.13.0".

We can wait for upstream unless someone wants to merge a patch for=20
master now.
Let me know your thoughts on this.

Regards,
Yash



