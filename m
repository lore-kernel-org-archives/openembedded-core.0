Return-Path: <Kris.Gavvala@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 151A2CD4F26
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 20:19:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50956.1781900336236120418
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 13:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=N6l7bWyK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0630b3b404=kris.gavvala@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JIVoem3108608
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 20:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=crFgc2Os7EMbIzq6lx6O156SN8J0T+LNCFCAoP/xDzc=; b=N6l7bWyK70sR
	7R2nsFCk6TZWChR+R8JKsYyyeV/ZeAk1a7SIL2X8sEXnZRxjuZmenbwC9zjDDF5n
	/zytELie+8CBWqaG4Z/RrRsxgzGy6sj3y0UjDP3eYoSYdhHPZInuErr59dZ3C4sN
	IvH026pjNsZVihxxDpokRQXfh/0APcDGjwsjxJG7M2jUbmv4nMgi3BDYDu6ys85x
	UE0dVHKmiOE57kKbPGT0YdhXkNPVIbc3wnXDJeds7xNSIrkYINm4+Qw4b6Pw9h+e
	0RqcOQ2/x17xJX/EyTj6QVEpp18ib76fHlxxqGmmgnOh6dEV25XHYP35ELw6uLVx
	iis52flQGQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013069.outbound.protection.outlook.com [40.93.196.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4euefc4w0m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Jun 2026 20:18:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uspSAQYYXnxz7jHmoQn72Vd5ApZDVyrlQNZo7mDturlUfxktBYhAPKSSvjj22swiLKwDMN1UFJldyg2XW1aEpwB4JApTshKRPOk8AqUMBbL6m/emOfnBnMSShpx28o8LdJW35cFumYOIcnfRV9L063hmlUZHqV2PAEQ9Qk3lGskT56XG8fa48H4t4TuST7ALlyOfRYNnh+dp1DTqD1ky2lNrtysbdvULViZPb+PiY6H+nObWHY8+D2Dc3csvsN6EmeAMfi2qBhpmnjkejoohBj3XYM6uvxE2oeEqrs1MH1Fn7Ad2nUnicrRz4im7ivRUNrw0H/pkjGjENv3qIACOMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crFgc2Os7EMbIzq6lx6O156SN8J0T+LNCFCAoP/xDzc=;
 b=KHWAO9n6hXWmCaFucX64D3JpU4iQqR4HTIYHuhNMvhNl9cpavxG0UhpJ9qZsxgqn0iJoWCYr+ZM+PK2cfnBSA956DwOkmToFQpSqvyuXJE8NqJT2NYGbueXfiVFEVWmBcWGtKgVoYn09BKomvdZB/nCu6NfUuB02q8zOcOXq/GdWGLJdHh7HQ1fAp1hKuqoypFfkd/3I0OSDp9FqWISBP6K6Ob9ihe00wvfkNvvo8HJlskQ6qWtCxmv+4J9M5R4qSxHS007nbFrWXG90eEhL9O48a4yQl02Z+LOkThzQ0YCjLwDKTpPu2AHYalJ0acOmK23XTdGMvfGZO8WAMpn51A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) by
 DS0PR11MB7506.namprd11.prod.outlook.com (2603:10b6:8:151::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.14; Fri, 19 Jun 2026 20:18:52 +0000
Received: from DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1]) by DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1%5]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 20:18:52 +0000
Message-ID: <14d9640f-e97a-4266-a7fe-d02cef6b743e@windriver.com>
Date: Fri, 19 Jun 2026 15:18:46 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] python3: Skip test_tracemalloc_track_race for
 glibc and musl
To: Yoann Congal <yoann.congal@smile.fr>,
        openembedded-core@lists.openembedded.org
References: <20260619195405.4021971-1-kris.gavvala@windriver.com>
 <DJDAOX536L0X.1J4TFH02UP4YL@smile.fr>
Content-Language: en-US
From: Kris Gavvala <kris.gavvala@windriver.com>
In-Reply-To: <DJDAOX536L0X.1J4TFH02UP4YL@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::7) To DS7PR11MB7783.namprd11.prod.outlook.com
 (2603:10b6:8:e1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7783:EE_|DS0PR11MB7506:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ca41a74-482c-45ef-93c4-08dece3ffb3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|52116014|366016|12006099003|38350700014|18002099003|3023799007|11063799006|4143699003|22082099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	F0yG6b45zlqmmQsXcfOvsxpzSrYfmbhgJmyHb4gNvGDdJWNjKQzDs8jUDZlD6wVBoGxSMLpDcAOTTNxh0s36LWBwigS43ny4KmCQermYuQ+zFAUAVq+HgtWwRDCxKvEHLhA8J9fg5yfpI6BKaXmmoKnQob9tKFQtLbMTLgg5VZMCK4Rh25it/Wky6GdrcezVOeLFkF3rHoDnZyaKhLBcbu/EAnRUR3Isx5DGwimdV+dyBJtmaQ9Y6JEBxopncP8gkHsr1PQf0LvJhTb3zU2+x4ISZTT5JIl2KIaq98VWDCmZX3kfaCVpK6K4rbTvQ0+1dGIrL7Su3EPR+ooGMnjN72Z7+OIga3NtCI7bf8n5/22n88K6v1kRb1VvnzFx2iTmTWU6R05TXHzJYnV4sb/z0qwsVmKnkhz88VuX8/4Fg7kz2stnTvL5xKrUXzJrh6AGPOXcDWa9+C5S+XH2T6dtniiouKT82bh9o8evabY2tmrfc0z/0M6EN3LBpskNyOJGzsINb8vYne2hBpNWNNERESjnddrhUjv6JXNbafW1YCsupbWNlMq1aMy7YiGbopVbLDuIny6J4dfMTnGdRyUaiiTAhHUwXu0Uq5EIKyzF1yVueW1g9JxL02LIHvT7B/RMr3YASler3mNDm8gy3+9oX1jgP43U10K6lootVoCc3wMvw8sF0wcKo+dcQpiT+iQT+Qv6ODJwt8W5PUE75X2OS7Adl2n3R83N6tu39rvZTsE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB7783.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(52116014)(366016)(12006099003)(38350700014)(18002099003)(3023799007)(11063799006)(4143699003)(22082099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QVBkL1YvL01pU0RaZ21JWDA4ZURkOFExSnBiRFgyS0JBcUlINnVwSjVhcGdJ?=
 =?utf-8?B?NVVhVTlNTG80OVdxZkwzVWZHdmdYRHdGd09oOGFsMlpERkZGektRNjNrSlRG?=
 =?utf-8?B?U0tGbmxTaTZ4MGtLYUtqWTAvS3RtbEU4NkUzMk9ybXBFOXhYWjk0TEdvMlJZ?=
 =?utf-8?B?dXNXZmpXVEQ2SEZMaS9DQkJtMWFuY3ZXNlBDQUUvbjhYb2JUMFBsQjdVQm9G?=
 =?utf-8?B?RXVYNURQaW1YNkFuZk5lQm9EL2hxNkFUTTNwVHY0WFRGVnNzcGVkMUhRa0ND?=
 =?utf-8?B?T2pEbzBrTU1CaUxhc0hOK25kM1c4S0dNODM3aUNOQ05sNEtHajdRcDFrUTBx?=
 =?utf-8?B?K3dsREJSRzF5K2JvT3gyZjJNa3FZNEFuVFRzUHVCbzM3Ry9IUFdaU1VoTS9G?=
 =?utf-8?B?a2VzQXlpRjR1d0lWK3VnTEhVQVNEbkdtNGNJbFh2ait2bXdPVjFNQUpYS2lv?=
 =?utf-8?B?Qk90QzFkT1AwMzN0SWhTRmhNcjZtWm00MFM1M3kzcGYwT2JYUXhOVHNneVk0?=
 =?utf-8?B?Mk1ZM0cwOWtxTGFTdU05YmZmZTM2SU1ZWkpZSE90VzAvMzN5UngyWjRRUVIy?=
 =?utf-8?B?cmZzV0Z1TXhDN3NuSS9wR0dkOW1IOEo3ZXZpUG1ISGwwVjY1Z3oxajYrbXNv?=
 =?utf-8?B?QnhjTTlTM011RG1xNDJEUDNBOStRRVl1ZHNiWFNScllTWjl1T1ZqSEY2KzRG?=
 =?utf-8?B?ZjJtNTQ0dWdMY0h0UjNHRVpTeFFPREl3ejQraUZxZEVnSU9zRW9FUWhDQTRT?=
 =?utf-8?B?ODFzajFranBhdWJRTlMvNEI1VTdleW0wRGtOWW9IcDJaQ2cvcTFBRTZCU0tC?=
 =?utf-8?B?V0E1VW9KeFlJODVnblNvMHVaa2V3VnR3bFAvckcxUFJNdm1ENExyUTcwZG4z?=
 =?utf-8?B?N1V6eWJzSllIRlZEbnpVck5oWGZqZzZTYjhBN254YjB0b1N5OGdISmFhQXRt?=
 =?utf-8?B?OUE5blY3N1RYZnByeGFQNlVRUnlCa29QMUI3dytrc2FxT0NHeFppUlpZWXJM?=
 =?utf-8?B?RFdJek9yRGxlTzdUMjEwVVE1bWswRVhha1huYlg3OUt4d2tBNEljY2Mvcnlr?=
 =?utf-8?B?RjlqRWM0R25rUWFhVEVmbHdvdVVnTS95ZThvaktVc0RWKzNCb2toWHJlMzl0?=
 =?utf-8?B?aEN1ckpPY1YxSHUrRWtCLzAwY0dOZlVmRlVjVVZPdFJBei82dmU4dFFSb0Zi?=
 =?utf-8?B?QnpmK2oxK3R2dUVPQjhsN0FvdFM2dlkvS21PM1gzRWRYdmZnZEFYN29scks2?=
 =?utf-8?B?Y2Jnc3cwekcxN3RnOW1RaGlYTWFXcHdDTjQ0KzExcGN4WEg3OUFKcUhXb3JC?=
 =?utf-8?B?b09saW5LcHprUSt1OTJKZGpWRTRGMnV0SzFYbWlHQXhrZzBzY1NsMWNobWhv?=
 =?utf-8?B?YmhTZTVZdHQ2YjRYeHRZTGRxT3MzNmptVkw1ME1hMXB6MWFEVnZrK0loZGdh?=
 =?utf-8?B?WUNNOXQ5cUJmUWcrRlBTOEVmblhPTWlOKzV6UVJjYUJRZWd5SVFQR2VReHpK?=
 =?utf-8?B?TUpNdnNzMUppRzNpMVBTcjlicTh6UmFaajZERFkwOENQY1NXd2dmb2NFY1FF?=
 =?utf-8?B?bzA4dHFSQ0lNaUNDcDRLTmN6WnFTUmpiVE5Pci81dy9UcXVCcW9WMkNIejAx?=
 =?utf-8?B?SW55cVk2QUZxSlZRejVldThEYW9QSkxGazRVaXhNbjRuVkZGbUM1SU1adU1X?=
 =?utf-8?B?aWV3VUJYNXR3M05vZmRRZ25sRFIwM1ZZQ05td1NqR0VJSWRMRDd1WVNlWkhC?=
 =?utf-8?B?NHF6MnlhUkdpRUY5elgvbldQb2djMDhCZWRSdmxZQ2xsQWFPaVdIc3ZmNTVQ?=
 =?utf-8?B?Zm9IaTk1TGN0eVREVDR5K0NSdjgrQTdsZVo5VUVxaSthVDhLaFZYYXljalA1?=
 =?utf-8?B?cUsrRWg1eUJiRFlXSnRVbTBON1ZVOXRiRjcvc1dnWDRidHhmdG5zNGVkeUNV?=
 =?utf-8?B?dXd4MHZqRjJ1OGRiNnhhY0RqMVY3eFhwWTg4ZjVuU0RKckpQUElkcFdxblNl?=
 =?utf-8?B?VDJhUkpBb2wzSWpvYjRSZ3V5enpxdExkd0tMMDBLb2puVldoQVI4ZTh2MVRj?=
 =?utf-8?B?WXpCaTd4TEljd25DeWpIRFYzbVB5RWNoR0tCMmc2SVdWUU1pRm90a3NiNFVI?=
 =?utf-8?B?Um5aUHdLa0xjUnFzRmpmdFJTdnZDN2J1ZUFFak9UZUxtNVNBSVV4ZlJxdTBB?=
 =?utf-8?B?ZTd5YVhYS3RLL1pRVzRoVWx5d3VkTm1IR2hjbFJ4QTl2VVVTZnB1c0FSWnFn?=
 =?utf-8?B?OHFmWGJENDZBa3l2dnpyOHp1U1R5ZWtVSTQyWjgzUWg2L2k5NndSR3kvN3pa?=
 =?utf-8?B?Q05uMkVLRTlEVysrUStRMW1Ib1YrdDNuQUlGUXBpcnJkYkp2WFlmQ0dXakxD?=
 =?utf-8?Q?W19qc0EojqjQYXwQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	DXSF94f89EgSMGWMhHN/zbkmMobfCYNqst7vAwVx+G+TgUlHg9l6jPlkjoaU+qvGS4CEdLzjWkQFg484IbpAfe3VlgTGeLfLTe3SB/4bEUV+SzTRYym+E4Hs6OSgxvGXKkzdrG56MwwHHeNb+xn9QAWSdxHzmwRiLGho9+gkYwMn4JRvE1Dc7jyTGB9E8xjUiKBbVTALYM2XavaPlzqU2Y6pQM3QsXmmjbiBs6yNjbd9fLidgkM0OczMZ7Y4+tosmIPN55ERQgakhaTqnWzu9fiN/TGJGX9G7UMpfFHFCCqmQjXxOcxJ7SejiYtBsxgz748YD1tCkTp7uJxUHgBJjw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ca41a74-482c-45ef-93c4-08dece3ffb3f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 20:18:52.7444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: boIVd0rTYGBsvTgpKRYdURzPD++SF23Mfo0aqr+2umhsQ8r9eilC0qyRA5zVOPn1rbCrRXYy0xtr6ChtAILw3SrEQ7usdBI4m9zGghJJcdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7506
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE5NCBTYWx0ZWRfX2EzlbSjIX2wx
 zhtst+GWEY8maN539tjiYjIZaQxII1ggF6ZQ1bYawvDoA4tgHiYhAXZt7QY7DoePCpb5w4k3ZzU
 LLWtXbHFYZq8/xPZPDQUYEMnzNLp2sn+/rEj4xOiPkssPIJng7uw
X-Proofpoint-GUID: dzGWi4uzkJCrYcLpVZzW_neWDW8Dgt7f
X-Proofpoint-ORIG-GUID: 1M2Q0ENZoNVCHX8oXAmvgBAnl7_Rhnnj
X-Authority-Analysis: v=2.4 cv=ObGoyBTY c=1 sm=1 tr=0 ts=6a35a42e cx=c_pps
 a=M0SbpEVZuc+hi5PQWquR3w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=8AHkEIZyAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=N9NhvBBuK_dzq63nhV0A:9
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE5NCBTYWx0ZWRfXxA1RPeE8O8GY
 mf3cuTzrnmOPNPo1d0EzptoeR1tH2et9ZOjvjAxRwP7ArZgZ8aHC/YHFVEcBaO4P3paZiIBQXNE
 Dd7C2+pzKADV+c4wJ7TiMU6s+lPBq+iya85pboiqq50s3LB3aTxg/Ljq9W5CRx1wUA3ucH0u2BF
 cJ+6c/3o0A9fwJz8TiQOBDCXrm+UrvFH6Imr9jiPyAR8eUu7w57F/w0LvBWQwTT/uMPLF8R+4Ri
 pMXVTOegbgiPLZnjooCnih57/UtrGHOjoBMflWVswIidifbVrMhgA4G7xieABOMacduqYEOuS7l
 S99+/O4creTMqAaDeghj5DWfFWxrcNeMg/9JcJfoa2ZwFSub4O4ngGzDJrbMcw8uGnYUnkM/Qtk
 U05AJJZF6EuAgPkDmsTM38jU5YVIt4ovid2EJXSamh+b1YrZai+t9ZGqxI2+z8Ew+uMtjbOp5nx
 1mMJxxdPtsVNP9jqwhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190194
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 20:19:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239194

Okay I will do that.

Thanks,

Kris Gavvala

On 6/19/26 3:06 PM, Yoann Congal wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Fri Jun 19, 2026 at 9:54 PM CEST, Kris via lists.openembedded.org Gavvala wrote:
>> Skip test_tracemalloc_track_race when running with glibc or musl to avoid ptest
>> failures for now.
>>
>> [YOCTO #16182]
>>
>> Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
>> ---
> Hello,
>
> Given the python3 version, that looks like a scarthgap targeted patch.
> If so, you need to add "[scarthgap]" in the subject when sending.
> README.OE-Core.md has instructions on how to do that using
> git-send-email.
>
> That said, this fix need to be sent to master first then to wrynose and
> scarthgap to be accepted.
>
> Can you send a fix to master first (maybe using SKIPPED_TESTS) and then
> send a backport to wrynose/scarthgap?
>
> Thanks!
>
>>   ...malloc_track_race-for-glibc-and-musl.patch | 44 +++++++++++++++++++
>>   .../python/python3_3.13.12.bb                 |  1 +
>>   2 files changed, 45 insertions(+)
>>   create mode 100644 meta/recipes-devtools/python/python3/0001-Skip-test_tracemalloc_track_race-for-glibc-and-musl.patch
>>
>> diff --git a/meta/recipes-devtools/python/python3/0001-Skip-test_tracemalloc_track_race-for-glibc-and-musl.patch b/meta/recipes-devtools/python/python3/0001-Skip-test_tracemalloc_track_race-for-glibc-and-musl.patch
>> new file mode 100644
>> index 0000000000..093de45995
>> --- /dev/null
>> +++ b/meta/recipes-devtools/python/python3/0001-Skip-test_tracemalloc_track_race-for-glibc-and-musl.patch
>> @@ -0,0 +1,44 @@
>> +From b0fcd618c8387387d38dd0b4494bb8d94b49b849 Mon Sep 17 00:00:00 2001
>> +From: Kris Gavvala <kris.gavvala@windriver.com>
>> +Date: Fri, 19 Jun 2026 10:44:22 -0700
>> +Subject: [PATCH] Skip test_tracemalloc_track_race for glibc and musl
>> +
>> +test_tracemalloc_track_race crashes with a SIGSEGV
>> +when running python3 ptests on qemuarm64.
>> +
>> +Skip the test when running with glibc or musl to avoid ptest
>> +failures for now.
>> +
>> +Upstream-Status: Inappropriate [OE-specific]
>> +
>> +[YOCTO: #16182]
>> +
>> +Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
>> +---
>> + Lib/test/test_tracemalloc.py | 3 +++
>> + 1 file changed, 3 insertions(+)
>> +
>> +diff --git a/Lib/test/test_tracemalloc.py b/Lib/test/test_tracemalloc.py
>> +index 0220a83..b2159f9 100644
>> +--- a/Lib/test/test_tracemalloc.py
>> ++++ b/Lib/test/test_tracemalloc.py
>> +@@ -1,6 +1,7 @@
>> + import contextlib
>> + import os
>> + import sys
>> ++import platform
>> + import textwrap
>> + import tracemalloc
>> + import unittest
>> +@@ -1111,6 +1112,8 @@ class TestCAPI(unittest.TestCase):
>> +             self.untrack()
>> +
>> +     @unittest.skipIf(_testcapi is None, 'need _testcapi')
>> ++    @unittest.skipIf(platform.libc_ver()[0] == 'glibc', "Skip test for glibc")
>> ++    @unittest.skipIf(platform.libc_ver()[0] == 'musl', "Skip test for musl")
>> +     @threading_helper.requires_working_threading()
>> +     # gh-128679: Test crash on a debug build (especially on FreeBSD).
>> +     @unittest.skipIf(support.Py_DEBUG, 'need release build')
>> +--
>> +2.49.0
>> +
>> diff --git a/meta/recipes-devtools/python/python3_3.13.12.bb b/meta/recipes-devtools/python/python3_3.13.12.bb
>> index 854d834135..0176abb849 100644
>> --- a/meta/recipes-devtools/python/python3_3.13.12.bb
>> +++ b/meta/recipes-devtools/python/python3_3.13.12.bb
>> @@ -32,6 +32,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>>              file://0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch \
>>              file://0001-Skip-flaky-test_default_timeout-tests.patch \
>>              file://0001-gh-128377-Skip-test_cmd_line.test_non_interactive_ou.patch \
>> +           file://0001-Skip-test_tracemalloc_track_race-for-glibc-and-musl.patch \
>>              "
>>   SRC_URI:append:class-native = " \
>>              file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
>
> --
> Yoann Congal
> Smile ECS
>

