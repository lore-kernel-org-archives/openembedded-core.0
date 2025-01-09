Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0171CE77197
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 10:03:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.44694.1736417000613019816
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jan 2025 02:03:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=31047a590b=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50976ZdU001459
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Jan 2025 02:03:20 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fkp9mck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 09 Jan 2025 02:03:19 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 509A3JU0032533;
	Thu, 9 Jan 2025 02:03:19 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2046.outbound.protection.outlook.com [104.47.58.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fkp9mcj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 02:03:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gm0bZhdecF26Y0brjp5PHtqonVXFIHRb5LQ+h/MCMZzRp8//Wbk+C48yM9gwPYadxeKoJaRXdHLDHsQeEWmDCpG3P/tzS1WoKh1dx2kPXXy6jZf3c/7R+n4KyhxAnpP/gxVKpD7oSAgYFZ4RdL0v7Xdu4htkU6qaw9BldM9D/66MQcZgi3esWMExIeQSpLLaAdjMAfn+xdMkwnzSqTDy09ErC+t4XUgP1r1T7vYHdZ6Jm8m6SocpBZHXod1AVlVzw67tV7eIPRJJ879CbiXJsu8uU20MYheS0l//b70diJKPHgKdG3f2urZrS48pmWEMc0zy+8ex+7WeHv/FZVKl9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THSbgSfFKHX1OTjbqreTmXAl5abAMpHmK/n3OWOO6kQ=;
 b=ZCuYtPAkvQTWEw5OTBN9aoP55mhr6gaXlPH1ffZzMO93jGKo96qIL400cXXyTEKWqhNsa33/4MBSbX3EacFNdOtdWBwl6HJeUSZ/NLNLRfop08PRNKzejIYsQaZ4WTqfPv2rni/4jw+/yShCRBEBRo5+xF5wgBFn6zeQNuerJ20BzsyUO1WtAvNFpZx68mvUkqQgT6DeYe4y3kp2VXGdr+4GPnWKcw+mQsRpZJLa6ESzrLQuIhYUOecFWi0PmA6lQxT+9T7QdplW7i/zcG8ldctjuw/tInihITnn5b6OrbqJTNak1s1IA6mYWuDzn5H8xnNLmoj/2DGAAv0Ta321Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by PH0PR11MB4839.namprd11.prod.outlook.com (2603:10b6:510:42::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 10:03:16 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%4]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 10:03:16 +0000
Message-ID: <71c9264a-9e26-437b-84f6-16a969f7148f@windriver.com>
Date: Thu, 9 Jan 2025 15:33:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V2 3/3] rust: Upgrade 1.80.1->1.81.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250109092521.3921275-3-Deepesh.Varatharajan@windriver.com>
 <8177.1736415085999013174@lists.openembedded.org>
 <CANNYZj_8fHbcgoSsF18Ax5cvZmYsctEgc_2EkFAv1aJq=AF9ew@mail.gmail.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <CANNYZj_8fHbcgoSsF18Ax5cvZmYsctEgc_2EkFAv1aJq=AF9ew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0035.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::48) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|PH0PR11MB4839:EE_
X-MS-Office365-Filtering-Correlation-Id: 7deeecf0-3756-4f79-e51c-08dd3094d620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|4022899009|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?T1NPcUpsQlNyVHV2VWZESVJxbHp4M1B3emRIS2V4OFNKVG1yWGxrSHhYbU94?=
 =?utf-8?B?UlRnbTlWOGJEQVEwTnZaOE9mek0yRkp3OXg3K2lSOW1oN1ZITHkyVzRLSlIz?=
 =?utf-8?B?K002MnF2Znh3eVhpYjcvRUFEbE93TnhBZTlyVjVRZDVJTVZPMERUYTVuYXNu?=
 =?utf-8?B?VzZXclVTbHQ0RUIxOTZ5aXh0c21HS1JIeU1BRENtUEwrR0pBaGxsak5pMXJZ?=
 =?utf-8?B?Q3JPREwxckxIZjdIUDZwOWJoWEoza09VdUpHejBtMktBZmxncVN5M2lnNEsx?=
 =?utf-8?B?Sm0zUnh4Uzg1UnBYZjYyNUI3K3pWczRUQTUxNWluaWJIOGtxSmV2L2NibzBZ?=
 =?utf-8?B?Yk5lQzR6cnBobmJ3cURYaWU1bVB0M0FHZXJCbjNJNXd0ZEo0eGYzeGwxRzZF?=
 =?utf-8?B?QTFpZmlqUE95VENBdkQxNncwcXNyUUtKM2Z4SHoxU1ZtVkUyZS8vbVZmNWcx?=
 =?utf-8?B?Zm9yWGViN1NuTTN6blpFRjB2emsyMnNILzVXSzNneWxtak03a3hwb0FEdXhX?=
 =?utf-8?B?blQzNGluTk5qTUZEN0hsSFRsUGU5bGthMldjMi81QUlYTE1SK3hhYlducW5l?=
 =?utf-8?B?MUp1aENXMWxqRkhYbGVqVytDeDUybzJYeElTeUtod1pRRTdCVjBHZmZGcWN5?=
 =?utf-8?B?VjVLS29TeEhTbHpJd1FFQVNwY0VCVi9pMTJlcTh2dDdWMURyZUloVlFnSExN?=
 =?utf-8?B?MWljRUR5VmhjSUpLUm5Yc1JLUERuVk12KzQ0c1BFZUlPVXVmOUQyUWFidGJ5?=
 =?utf-8?B?N0ZCK0hGSS83Tm9ibGlpNm5sNFNjTy92OGFSSlRvcXRzMlBPMFJxZmthZjhJ?=
 =?utf-8?B?Szd2bHBzZGJRNm5OTTQ2L05Oc3BSelJEZVNja0Q2TGtDQ1JyN3oxNjVjc25Q?=
 =?utf-8?B?WmJLL0hVRlU3bXR6M0c4K2krd3pEejlCT2puS2o0ODVHTnovY2xmOS9laENm?=
 =?utf-8?B?UitoSEF5Zlp3S1RQc2xma0lRVkpRNGJLUFZKcm03TUNqNHg4TzE5V2tVQkRC?=
 =?utf-8?B?TytZVmhIRDBVbEFQQWdPdDNsei93c1d4cnp0MjVIZGIvVlVtbXlPeG0xWEtx?=
 =?utf-8?B?aE8vSjdiekRYTCtrb0dBY1p5MHUrTVgyRjdHLzhSQWZPaGxjbkkreG1LbXFY?=
 =?utf-8?B?djhJNkN5Y1FwQmVUMUU5UVdQRzVnQmNjQVZ1NDRGU3FIVWJiSFNnNk5ja1pK?=
 =?utf-8?B?VDhQV2ZiSUFoMWlGTTk1Z1g3WlZneWszWXpkakhqYk9TVHZhWlRQd0hqQ1lv?=
 =?utf-8?B?QXdxNlBSd1d6Yk5kVU5jNk82SzNBOHBwNlYyajVyMHg0UjV6OFhWS3laTHFp?=
 =?utf-8?B?TE5nQURzdm5YUVdPSmZmV2grR3duRmVUUVAxa1hJMW9hL2pmM3BPeUNmSFJo?=
 =?utf-8?B?KzhlMFFBUktuYzlUTUNycHdFSC82aC9aOG16ZWdYS2dra0NkYVNadEdWOGZ1?=
 =?utf-8?B?QUZSbDBSK1ZTRnZpVTJFU3ozTkpvaG5LNy9KWElYTWlNdjhrT3lnUDNjc1B3?=
 =?utf-8?B?L1hhUVB4NlY4NS9hUHQ0Q25RdUpSMGxTSmVPZXVxVmF6QXJxRDBzb1BJWXhu?=
 =?utf-8?B?M3lKdU8xUXdkQU44NFFUcnZBbzBwNmtmOVNLeXZWNHFoTmU2cmJEdnBXWmVk?=
 =?utf-8?B?dlhzRjlTYkxPbzR4UFlLQ3NWeVFVdEVwcjFYNkNXVGtPREVQOFIrQUFJUHJY?=
 =?utf-8?B?ajhValN1WnNPTFJ6V2Z5c2tqR3c1YVByODRUTnYvODlZQlhnTVRrZ2VQeUpu?=
 =?utf-8?B?NVBubXBEbVE0SHhWM05LUDdXWlRjVUttWElUODlsR0VKWlVtbHBqdEdYZ2Ny?=
 =?utf-8?B?MVFKRHhJd2cvQzdJZWo3dz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SkUyM2VVaTIrc3h2eG5tMEFFMDJuQnF3amNZUGkyaUpyMDhoZnFqWWVXTjRT?=
 =?utf-8?B?UUhPb1F2S1ZtKzl4RUxOQ3dlOUpaRlR3ZENlT0ticmlmaVdzNlJWeXJzK3hR?=
 =?utf-8?B?OVQrRForSkhRRHRKQTUvejBLZGhONlFjYnZDL2Q3b2FOSzJSdmtwcTdLREVY?=
 =?utf-8?B?MFdoRTZwanZ4N2h5T1NIVmhNTzRCaDQ1UFk5MjFiOXVTazZ1T1RWNUtJOUNF?=
 =?utf-8?B?UHRyQVNHemZFYUZ5dkZzQldWZUdja3FtUTZxaGNCWUFScjZtS1ErbDZvR3pD?=
 =?utf-8?B?R2VzZHZieUczc0J3SlI3cnpreDRXYmd4b3gvUjZIYzhRQXNRMW9qeFpncmxI?=
 =?utf-8?B?RE5Ha1QrSWNvcURiU0JZMEdvcURBbUw4emt3aXdwZ2hZREFUajZnSjZJc2ZF?=
 =?utf-8?B?cmZyUy92Vk5nNVFWd1VCUUQ5L0RGTzdRbGJ0T015VHZBa0lleDZTZXJ4Y0pk?=
 =?utf-8?B?TUFNRnRmZUJkdlRvS0VrOXhHaTE4S05tRkVlWjhNQWMwUmtXdU5WSDE3ZzRG?=
 =?utf-8?B?TFRBTVBLQ0lrQ20vN05tY0hJRnNlMitIVUZIZng4MEY2RFlUNWphUExuL3FG?=
 =?utf-8?B?KzhoQmJxbm9qcVdUY3J6VlF6VEVSRzR4NSsxbUNRL3RTYjFhcG1YeFhIOGVz?=
 =?utf-8?B?VjZKQjZIMmF3ZU9FcHZIRE40NUdJSjdxeTB6ZlkzNVVmVExKTjlNZlgvMXpm?=
 =?utf-8?B?bWpyeXdkMVNDY3hHVzJlTWFRU0RTYmlCZWtpNHFvQ0hyOW5GSjM1UWUzczBz?=
 =?utf-8?B?Qko4ak5JY0RVSExQR092dG9DQ3habGxRVG5pZSt3b0FMNlZ1dklwdzNSVVlQ?=
 =?utf-8?B?VEFEeFFCbnlxUXlRUExiSG1lZGVmaUlvT0hLeXJUU0NXQjk4ekJBNzF6WEpE?=
 =?utf-8?B?SDhDWlI4bDIwc1lMUTZ1YkU3WURGTjhMUWdUTklJeUl3TE45UWFGMmJmd1o5?=
 =?utf-8?B?RHdtUXhRMUI4b2dQMjh2OWpXQktLUm0ySmd5d3Uzd015ZG9yUm42YjdlMXdp?=
 =?utf-8?B?QXB4cXBBVHFrL0p6ZlRObGF2NFV4NklpUHlPLzgwSmk0NmVjNnFhSHFtcG9k?=
 =?utf-8?B?SEV1cGtWLzhMZzB0U0dGa0RySURYaTZFMDFEMzFQQmxPMFdrZVh6VlcwTzFa?=
 =?utf-8?B?cE41RGg5RFE1elRPemdNYjZPbzVYN0xlb2Rlc2ZxVlVNQ0Q2dmY1Z0RSejlB?=
 =?utf-8?B?b3ovMENXdzViZnBESFBWSEkxaWJ4dUxSWUJCT3d4bG9ETEFtR2hLQTlaYm5p?=
 =?utf-8?B?SVd2TC9xeXl0RGJXVHJBWC91SHN5cGJVMzVSYmpEUVlaNzd3bU9tU2VzVE4x?=
 =?utf-8?B?QWJLYTBpbDgrU01qRmVoalVieEo3VjNEZ2ZES1VZNFhqZm5ndEF5SVR6RXZs?=
 =?utf-8?B?VHdMdzEzV3Y3Mk9Sc1JVUFhmVGRyLytaNlQ3NzVweGFDN2hMY3BuMEt3MnRL?=
 =?utf-8?B?bGljSFUyKy8wb0QxODZmMUd5OGVTZ3NjS3VSb3NwZnJVQm14MFVoSzFOQkhT?=
 =?utf-8?B?ajBnUXFlYStHcjk1VERDRnZWaEgvQndmOGtqemJzOTF6K3NYMEFMamFEMEh4?=
 =?utf-8?B?R09lc3hPOG94cTNyelhzU3J6WHFJekZtdG5xUXhWdVJNWDd4aytLVlQ0R1lB?=
 =?utf-8?B?aFQ1RDRSVjFMK0VDUEp0b0Q0YzZ2RktZcnUvcXMyOThkTXM2eUV0THBpalBJ?=
 =?utf-8?B?cUtZM0Y4L2E5UW94ckNZdllVYVRRMHpuUGM5em1pU1EzaEt0R0JQWkpwTjVj?=
 =?utf-8?B?c2FyeW9HckhGOFc4YmxVLzlWdldkQ21VcW4zZSswQzRBU2FGSmVCS3BhdGN0?=
 =?utf-8?B?ai9xcVJaUVZzUHNCTHUvSEcyaUlHNGJqaVFHTU8yZWJDZnR0eGhXaEIwNmVN?=
 =?utf-8?B?SXBxbFlzKzYwUkthZEl0UVZEVE1kZi9ScWpvakpCeTdSUFR6bGRPMEV3Y0lK?=
 =?utf-8?B?SVo2RW9MSng3YXRMcS9JdjlicVBRNzQxdi95SlRRTkF3UDA2WmZjU1Y5SlZI?=
 =?utf-8?B?WE5FOFFCZ0ZGWk0ySVh6c3BIU3FucmhZdDhHd0gxWXpuWEcwM255ZmduVysw?=
 =?utf-8?B?cSt2Wlo2VWZoODRkVTI5bm44WE4wU0dnZnNGZVdZQzNrc0YzcjYrSis0endI?=
 =?utf-8?B?Sk1XMmdoT2dRQUNUU0ZEY0NUejYrRUd3NTMwdVV4QnhkaktXZUNMVXV5VEpW?=
 =?utf-8?Q?iMwkRNDSKdIJ9F9PGIBXN6o=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7deeecf0-3756-4f79-e51c-08dd3094d620
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 10:03:16.3093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zB9+UOjVOCb8eeQZQbuhcVLdFzxf5apOCiq+iT4KTts4CGVIu/jT70J8xeAu9LtriAQu1/0Vhpj/1LhRfn4T7MLucAFLMxCumybMFO1Ig9SKwRagccjFPpNXVMQYyoje
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4839
X-Authority-Analysis: v=2.4 cv=XZxzzJ55 c=1 sm=1 tr=0 ts=677f9ee7 cx=c_pps a=ur2hu7Zt/Tb0cWAHmjvzJg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10
 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=TypThvUF0ZUEeB69d_UA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: Jnvb_rk1N-AJkTY7945Vbh_7AWbjePBR
X-Proofpoint-GUID: H5mpBOXv7WHtZMIbS9gOCW5C-55uCLKl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-09_04,2025-01-09_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 adultscore=0 mlxlogscore=772 spamscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501090081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jan 2025 10:03:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209624


On 09-01-2025 15:09, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> The patchset looks good, thank you. Will you continue with updating
> towards 1.82 and 1.83?
>
> Alex
Sure Alex, I already started working on it.

Deepesh
>
>
> On Thu, 9 Jan 2025 at 10:31, Varatharajan, Deepesh via
> lists.openembedded.org
> <deepesh.varatharajan=windriver.com@lists.openembedded.org> wrote:
>> Tested for rust_1.81 update:
>>
>> bitbake rust
>> bitbake cargo
>> bitbake nativesdk-rust
>> bitbake core-image-minimal
>> bitbake core-image-sato -c do_populate_sdk
>> bitbake core-image-sato -c testsdk
>> bitbake world
>> oe-selftest -r rust
>> oe-sefltest -r reproducible
>>
>> oe-selftest results for all archs as below:
>> Target         pass       skipped
>> x86_64       18646         418
>> x86            18468         596
>> ARM64      18496         568
>> ARM          18451         613
>> ppc            18418         646
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#209619): https://lists.openembedded.org/g/openembedded-core/message/209619
>> Mute This Topic: https://lists.openembedded.org/mt/110513059/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

