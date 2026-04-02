Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B91E5D39407
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 09:40:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11826.1775122815854897245
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 02:40:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nUbUWNYn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=855281fcfd=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6325PZLf1049874
	for <openembedded-core@lists.openembedded.org>; Thu, 2 Apr 2026 09:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=fEJm0fsfmGFLRBwcd8Plcet9w7qQv5k/Zekgpme7cWg=; b=nUbUWNYnRC2l
	gU1cwTfrC1d+8ftU68lCLM7072CejhIucQRqaYbcCG64w0AB2qkpQvKY73g73XO4
	8Kt4s1WMnXUQBVdTP5dEhpaOnNMu5UnIdRbAvaa510S5YNNc99EmmmoXgcomHFgw
	zMZnwym9Q/iftznErEmFOGcdARnLK+91Gp5qaiZ70ftG8/8cyO4UfL05mb0PrxXq
	jUVW2e2EtNsvhe4c9YOQ/MUFtw5DN6SALpD1PS3LgltOs3fACfsU/05iea+TL8Bd
	A1izW1g84IxqQt3UMu+vIpLPUmevi8Mqdlb5fJX2pHi3dMkG8PId6wuaNlZxiNtT
	AO1WJj3bOw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010058.outbound.protection.outlook.com [52.101.201.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d65y4fm58-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 09:40:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HNUQ284yAm/KNl2EJXERlWbcnWG3fxMq24I8D4MqxVrZIKZWoRdXlD48UWyF0QNHiJ02Ngueg/YLB0capnX1cUPNdOAY6XZAWGmz1cW4Hc9BJYFX09okuLvbVeb1rXXANOgbauRoVa8exWNe20228Yt+qTL+dFm/KJREqWccNBiVRrA6CbErX7FgD2Y5cpaYvyA096Kw4oq6+bese4BHW8jHTD7OuknRHY7vY/wGNU1yO9cNJ1jXlqnEYbum24HrkWo3P4HOjUo+YRj8AueDuYgGCnHO8PrQPovdInP02nuuazOkE0dsb9U5BhaxlBDHX2wAhu5s341uT4N/sElt3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEJm0fsfmGFLRBwcd8Plcet9w7qQv5k/Zekgpme7cWg=;
 b=es2HVkI/CkRXKH9VUr2Hwz9RJ+dW9z+eBmJQ521AmMgHoGAys5XF/OkOEMfexIYEG8fgprg1F2QC1UW+3n398Mz06IQNVXcPPUUn7ZpjBL/JE3MPx1HkwZHxEdJTeYRHpiUsyZp1jvz25gtQD7eLZev4y4xBbnKBedrqQ5LF6Gh4rdtfxTe2XAE2pNEJxV+FiIvYkRaZi4h7APqCTN2iL429dL2U5pGcBIzZutmZPjgzE7w1oZbUoyeWWw3Z7ZmTaKWe1OlRaTbSS+vy7yem8Qg5EtB3YnSgtEpxK6ayHqIn9BQleMs9bfYWksFfMYf8Wsj+sby40ism8WWI3gVAhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 SJ2PR11MB7520.namprd11.prod.outlook.com (2603:10b6:a03:4c2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Thu, 2 Apr
 2026 09:40:11 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 09:40:11 +0000
Message-ID: <8a56aa27-06fa-45c8-888d-6fe2e73bd530@windriver.com>
Date: Thu, 2 Apr 2026 15:10:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][master][PATCH] binutils: mark CVE-2025-69650 and
 CVE-2025-69651 as disputed
To: openembedded-core@lists.openembedded.org
References: <20260402091620.341851-1-adarsh.jagadish.kamini@est.tech>
Content-Language: en-US
From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
In-Reply-To: <20260402091620.341851-1-adarsh.jagadish.kamini@est.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::17) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|SJ2PR11MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: 940d6cec-ca24-4235-cd65-08de909bd5a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|4022899009|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	5vr9dwvFb+vjEai/5pLYtg6Xp0AnbU64cWln/3yW3X+mXc0WIvqLLa5UdvlWwr1Qfd7p0SpzD8ihr0zPv4kD64UaYs/08oW9JR9goB5daqybsSMFoaCRWY5FcJEk40UQfacPq+Dc2MOZ2WU7Y83w8NJl+GyCKYn+AQcrdj3NHIp2xL6UnyTnPzg9N6/3Qu4z/OMxdynkzZ2ECi8wrTsvV27uBPlZVai0EVQLj0y+teOZ4+XrmweQSfIL/k+vshJDWfty71f92kccIZZUnYkYHUda+J01uNl980gJ6IIQhDiYgqBWvOvMrgaryVOjvz8hgtjbw9MpJKk18wjqXeSn7wMu0m6o3F68VEN8Vq0ZSt/gEKttIGA7HKqcSOeq8ZMDWYdSoz9UYi27koJ5CMVGCkHWDHFxA1mvqkIO8fnfyZosEPEFJffmxU/L+iZg8o93zLN2DkZe/vpTCBEmjeKcctVlBuRqMDmjWEK8ZArjNdwoGB6987wBqnXau8xkihmafPaUCfyfbN5qt3qO3ILuiT4jO9XwkwTg2XGQbhMDaEHd0POWlmWX9qg4T4TdwwrMPB0Yr2wQUNrClMsFQr+nJlEj2SbiJVzmLjO2Imr4yZ55Q4gV9Wi+jw38OIHSda10xYmo3QSJeoPBwTOd0fgCx8eNj71/xgperP99vvPxnmkUo/ANNAW/DI3SRirpBwId
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZkMwS0hiN3pwMVcxNDUwYXMzK2pjS1VMOGNtcVhETjh5dmNtWDErZUU1aHAv?=
 =?utf-8?B?K1dQWEgxOGFoRWJiMXNQVnZPNVMvQU9oWndNVXBndS9aOWlYZmd1dXBzUVI0?=
 =?utf-8?B?NGwyd3ZuSlRrcHltRFc3K05TYlZrdWxacVlHOUM5enRSN0dBeitZeXNjVXk2?=
 =?utf-8?B?S1E1NGIrZ1RFZFZCYVJRbC9PWDRaeGllMEkyZnpMV3BHRWJ5MmFWbkgwanZx?=
 =?utf-8?B?Mys5UjlRZ25VSGpxWWF1VnQrSHZsZWU0cTJOY1ZMTk9KOStvdklVdVVaYWF5?=
 =?utf-8?B?TW1BOE1ZeUZheXhTcUt1aVZ2TCtBQ0RncU5pd251NzVxdDJjU1R4amo3RWdS?=
 =?utf-8?B?dDcxNUg4dWxLVy9KeWV6NEJ5N0pOTm1ZZTk3Qnh6TGZTZVNZUnFQcVpCNmFq?=
 =?utf-8?B?cXB5UEFsR1Y0dmp5RVhaQ3BHbnh1T3lveG9YUEVjczNmWXliSFRmbWk0OURD?=
 =?utf-8?B?SzRWZStJeXFkY1AwQUZOT3RhQlVkUWFDUTNmWnV4d1NUNnJnZHBDbjh1OG16?=
 =?utf-8?B?UXVtcWh1cko0RDNrZW9iMTl4ZVRlcVZaeDc4MHJwK01jUzIrcENIRWRjM2Jj?=
 =?utf-8?B?NVdNMGFQdmlVZ2VCK3FQenZWUWMwdm1QOEwveFIwQ0EwV0c5UStDc2xQR1FE?=
 =?utf-8?B?Ykc0K3BZMytWbU91ZVY5L0FjWlFKWjU2STVRNmNOUmJrcGxoaDd5dmxOeXh0?=
 =?utf-8?B?Q3VEK2dyZEMwdGxxUW94WGFSNGxxeE9tSFh4R2h1QTRQL1hOSncvSXVYenky?=
 =?utf-8?B?K2loMWxFSVZkalgxQTVWaC85UzZ5aEI5MUx4MENCTHlTNmhaa2VEaVJITG5i?=
 =?utf-8?B?cWxiS0tuQ0oySUJjcWc0dWFLQVQ5U0dhUmxNYm9ZeHZPa05mWE5lZ1hiUGd4?=
 =?utf-8?B?ZmpPQUJ1SkZEdTZwd1dCRXR0SlJyWkk3RUg5VkFhT21pNlozL0ZiblpVekVi?=
 =?utf-8?B?V3JZV2RPVDgvODQyUW44TW1QQldWaDFIV0Zxc3czYVJVRlhMOWkrVkZVQ0sz?=
 =?utf-8?B?VWlRNFRPa2YrVGVwNnZYejhTNnFzc1RjeldzVW1wWXliVUppWHJVZ0RpMTlF?=
 =?utf-8?B?Yk1VY08xa21LOStGVE9uU2w5b3cyeFVMcWZ0S3lVVTFKRHJrSjZScUJlU1U3?=
 =?utf-8?B?YzhoOGU5OHBuUkRmTVhZVm1Vb1d6VmhyMUJsRXozeUhnZWp3eUxacmpLTk1y?=
 =?utf-8?B?di9UMGw1ZVErSVVsdTJ2aHBoRHpzT2VleTROWjllUUZ5bStrV2tNdHpXR2pM?=
 =?utf-8?B?V29RL2RXUVZZclhyakJOOTVUZkp6Y2w1ZVpoWWFNN2JWcHE4NndycUFzUXJB?=
 =?utf-8?B?YWZXcW9VeUJyU1NER1ArZTl6T013NlVyOVJSWUZUTG1vdkpNTU5zbEVZMm0v?=
 =?utf-8?B?M0xrTWdwemhiSWpuUEtOTjhOdGltYmM0ZUxUd2NSVWVGWGx3RVJqVFQrdWgz?=
 =?utf-8?B?Qm5RL2wxaGQ0ZDJnTGx6QVZhTEYxQ0tCZGxNeFBtOElSMkVKSnk5Vms3ZVJq?=
 =?utf-8?B?aVJkRU9iTUF3cm9vK1UrM01oNCtLalJhL0IzUXRtV3hJVTlQTFVHMXUwN2lw?=
 =?utf-8?B?bXlRaERMTzJMRHJJOXJrY1E2OWczWXlWQkw4a2VGUEdsUHlRTWtMbkFKRVdu?=
 =?utf-8?B?SzdRRjk0TlVVUC93MWg4cTd0NDVxL244a0xXT09YZ1Y4bGlBVzh0dUlDVkdU?=
 =?utf-8?B?T1B0bnN5VU1vejIvSXBKOVJ6ZEJLaUN0MmkxMVpnMEdwMDdPNGUxdExtd09h?=
 =?utf-8?B?NG02RmRYYlJrNy8wUEVqekYyNHZBZ3ZzNjlYYnQ0ZUZmVnNVWTB0NkFXL2w4?=
 =?utf-8?B?VTJkdXlrNVJQVC8wK3VoL2R6Rzc5UUh5MHY4eGZTYldPRmFJd2ZIQ3YyVU04?=
 =?utf-8?B?U25ERXBtbjNKdkliMXRjaWNTY0RUeTZrbEFmdWdjT1Q0enMrNzlFUnlSRXo4?=
 =?utf-8?B?YjVSV2RiUjUyMFpzUnBaSnVSeGc0OWpaVlNXUTlaVFQya3pmR0NpTWJodXpL?=
 =?utf-8?B?N1IrNWE0cGVKQ3V2b0ZJKzFudDlxbWxsYTl3L1djUDNEZXNjQVRxRDFjVTF1?=
 =?utf-8?B?ZXRDOSs0K241cG53VGN4eHpMOW1IbjdGQys4QVZLZklURmRYOUk1blpoNys4?=
 =?utf-8?B?bllUbTJmc3g5WXZJb1hMQmVYRmdsckZsOWcxUkhtSUYwVElHQW0vaXk4Sksx?=
 =?utf-8?B?S1BzTlBWck1jYUN5YXVybzQxOVpNZkRXcmJRTDU3VjdSZGRJRThwWnkzTzJC?=
 =?utf-8?B?NEJnK1pXU245MkpObVQ1aUd1N3A3aXp1byswZTBmbkJxUVIwL1ZPc1JTeWhY?=
 =?utf-8?B?T3JCVWFyemRtVVpwN0hnMzBWWG9vVG9OZUl4NTQzRTEzMVRJMUVPZ3g1T3Rm?=
 =?utf-8?Q?PK7nE0g06WSv2nSE=3D?=
X-Exchange-RoutingPolicyChecked: 
	KX9t88fkB5fC4d1LIimhmHpaEt9MOPGDqy0WaDuwaz5zAuper+FjK8kDLdkz/cz7JTbZ1dlftbiyh/rxgUc4ETZLQM5S7TO4ayE5/4VuV/5Xk5iAnl0A+oXGTcut4OAilUO+mpAxWb3ozraV65tIp3MxpxTfzCgmRekD82DsFqMaBhsZn1O98588nEhp0/QH4n06s4Tlai52ugzZ1s8uPiY+lw1vQx0v81RVMfqwodSWv4rdGUZUnR5TkoF59ogYRsrXaJOIfM/q1z0DnMeTozRmvtBuK/zfZi2/ZmHeAfBLGXnJhlHAsUGuBNsMNnnyulbRzYvz47DCtw+Xl1Ifcw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 940d6cec-ca24-4235-cd65-08de909bd5a2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 09:40:11.5131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FznberROby15NGe2wCWHqM+m/tqF93QUudYWItmfEaUa6jFv/GACoaDLFJjXRjXRTjlE9NobaY4cCEV4oXZKLc/Fs7ZFu1PBA4GcenzTNp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7520
X-Authority-Analysis: v=2.4 cv=QaZrf8bv c=1 sm=1 tr=0 ts=69ce397e cx=c_pps
 a=jKN40M1qUjEArv1iOeQWeA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=8r2qhXULAAAA:8 a=Q4-j1AaZAAAA:8 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8
 a=DvnF2HaG-zSj6Wklj3EA:9 a=QEXdDO2ut3YA:10 a=8gvLZcY7Nlvl4CGD_6nf:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4NiBTYWx0ZWRfX5SzW7stKug5V
 du98rBWmxvKLPEnsMZSL3nUiXv8B9p5ynEAlDw8q2du3tz0ebitTibN+aCR+2Kcwm2Tog28n0XQ
 AG0czcwZbFlqrbPRR7hMbPdmQFwsl5MSs0SdZtnNJ5+NOWQJOf8OYE5/GMOb+bWgdVa390yOjrM
 +O8qsTuPNfhYqOLspzyWY1dGu8ouAimebzVm/7AdINb4SFfIMy9weBcoY94WNDdUxvEz4kyxBRJ
 XqfmYkZsv/rEO8mEl+MFPHO+JTdpW0XTPGLVpxYHrzml80P6ty4+oLKqccPQmXqvYFLCVtN1ruM
 NY9wuVkcfPxbHURI0QOWnjxgcyVzdvKzreJj7tBZiA8bws9elBURzRlKcd4ZZGjmb+oUh76JMIp
 j56CMF3xBfowyttj9NnXPSKKiuewQysQiw8rikySB7S2QNo2Fv79J8yONiT7YlJyRJtdStUi0b+
 7Inlt3RcdKIyxEFVNgQ==
X-Proofpoint-GUID: x1oMmaJn-11QLQG7-SSuMddtGnfjTXWf
X-Proofpoint-ORIG-GUID: x1oMmaJn-11QLQG7-SSuMddtGnfjTXWf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 09:40:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234511

Hi Adarsh,

Could you please also send this for kirkstone? The same patch is 
required there as well.

On 02-04-2026 02:46 pm, Adarsh Jagadish Kamini via 
lists.openembedded.org wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> Both CVEs are disputed by third parties. The observed behavior
> (double free / invalid pointer free in readelf) only occurred in
> pre-release code and did not affect any tagged version [1][2].
>
> CVE_STATUS[CVE-2025-69650] = "disputed: observed behavior only in pre-release code, does not affect any tagged version"
> CVE_STATUS[CVE-2025-69651] = "disputed: observed behavior only in pre-release code, does not affect any tagged version"
>
> [1] https://www.cve.org/CVERecord?id=CVE-2025-69650
> [2] https://www.cve.org/CVERecord?id=CVE-2025-69651
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---
>   meta/recipes-devtools/binutils/binutils-2.46.inc | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.46.inc b/meta/recipes-devtools/binutils/binutils-2.46.inc
> index ff10050dd9..cd2867c421 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.46.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.46.inc
> @@ -18,6 +18,9 @@ SRCBRANCH ?= "binutils-2_46-branch"
>
>   UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
>
> +CVE_STATUS[CVE-2025-69650] = "disputed: observed behavior only in pre-release code, does not affect any tagged version"
> +CVE_STATUS[CVE-2025-69651] = "disputed: observed behavior only in pre-release code, does not affect any tagged version"
> +
>   SRCREV ?= "49d4d3fafa4ec4ff5a3460d91d5b1ed5286487db"
>   BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
>   SRC_URI = "\
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#234509): https://lists.openembedded.org/g/openembedded-core/message/234509
> Mute This Topic: https://lists.openembedded.org/mt/118630447/10244482
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Hemanth.KumarMD@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
-- 
Regards,
Hemanth Kumar M D


