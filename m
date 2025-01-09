Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF839E77197
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 09:37:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.43937.1736415429725846559
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jan 2025 01:37:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=31047a590b=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5097a8hY025170
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Jan 2025 09:37:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fnkhjvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 09 Jan 2025 09:37:08 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5099b8RM006531;
	Thu, 9 Jan 2025 09:37:08 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fnkhjvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 09:37:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jOQKqd+C+/gB9LRFDY+cWVidcGnn0hBG7WgOj0Rl5AdJuAqTANaZ3B4C/Dh40iN/IxzDmRhnjmz2ykrGqPDPG+EqkD9IIiFGJq+OhVfbZ4VqSI9aWOmzHhjCZXphvjOGvO3Y0ob8TcI+wl3nfJznMwxV+RBnG4UQe0Qvl+T7kXPt7eFhd2LqC039lhh0YTEUbokWskDsWGT+MfRWR5IEGFU+ofbtrtF0fGWenKlYdQv4cbJ01+u+jL++LOB06lOrU8dhjIUe5BW7Y8zmzrNS0coLLkNLBtxYXfDfRt8DJoTaDLwBY6axzjlp2qcsNlnvyZXLXS12w8FCe0OWOxWomA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCLg6juPd2pDAV9ZBKX7n/miyTLyeGaPEF/NN7DcqOI=;
 b=lpTPrwuUBOw5xIVBZwEuMOCP9EvyZVJNpfzwSbLvhngNm7u+PF/K9LpLBsgfbIuV5123vuX51vgt92C+4Td55njAovQ1irtuGKqpFQQ9RY3Um+d9x/jrFqXwotwOxtFe9DVXEJAkPgprITV17koBwIKgFqsYeswFc67WikVQLoJimrJOHhlhfUIOh/hXULmEpOKVey4oV67MXPHN5wuo/giC8eBtCQDTLWnasxdm7E7lHI20Blej2s+nkI+j/NwFRYhJoWsUBAK6DICFoI9VOIb8IAldNtNjt3cbiVET/AoCr8zNTF5X6+QmUomCcDZ6p1joWmMMHSMWgHFJGx6pMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SA0PR11MB4559.namprd11.prod.outlook.com (2603:10b6:806:9a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Thu, 9 Jan
 2025 09:37:05 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%4]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 09:37:05 +0000
Message-ID: <c47c5960-60b6-4365-a8ef-310423d6773a@windriver.com>
Date: Thu, 9 Jan 2025 15:06:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 3/3] rust: Upgrade 1.80.1->1.81.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
        Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20241227065337.1257972-1-Deepesh.Varatharajan@windriver.com>
 <20241227065337.1257972-3-Deepesh.Varatharajan@windriver.com>
 <CANNYZj9tGwHLjJio-LJU9G-DKkQufewk_W35EJsMbnUYgPScSg@mail.gmail.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <CANNYZj9tGwHLjJio-LJU9G-DKkQufewk_W35EJsMbnUYgPScSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0214.namprd03.prod.outlook.com
 (2603:10b6:303:b9::9) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SA0PR11MB4559:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a65b2a7-25b7-4ffd-11c3-08dd30912e09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WWtna0l0cmpJUm81eUlhM3JQSjFwenlLa3phdDJNVGFIeERwN3VPaVpoVHlE?=
 =?utf-8?B?N2tjU2hHb2w3S21uSjhtUURnY3cvNXIyVkZoQUVPb2xFS0NjR2craDd3TnA2?=
 =?utf-8?B?T2cyNTRUWlpWWlNIdW04bjNmSUFVcVhxMHhqd3kyRjJSTmM5RHpXTS9ZRGc3?=
 =?utf-8?B?a280UEVyNXJSYlQyVWM5WlZzUWd4STBHVG9RamxwZ3hIc1plRWNtSm96MzVt?=
 =?utf-8?B?YWV4MGNvc29rZFNLdkJrNU5yeSt3Um40ZUY3TGtMMitTaXNGYWJrRDkvMzJt?=
 =?utf-8?B?QVBiRXVSdG9RNWFyK2RPb2RNT0J3ZVh5bUg4VWNrMVJWTE9BVzg5dmVJaHN1?=
 =?utf-8?B?dmlWTVpUZVlkUUM1aEpyNmJyTkdoQno0TEdTaHUzZ29pdG1vRkl1UDF5R1RR?=
 =?utf-8?B?TUpTeUZmaXlQVFlRNFllbTJTcFNQQVdpWjFscXdleFByTXZJY0RZamFybFJI?=
 =?utf-8?B?cnVNRjVlZytvNGx1RER6NWpmRWdsSDRhbStaK1ZyWlRWZXNPN2VhV1pxOVVH?=
 =?utf-8?B?VEhRUWdkaVlWeEVIdUh0NVNwdTE2c1NEMkF0OUJHTUU4aDVRSHBWTEQyTjRU?=
 =?utf-8?B?cW1DZXJOQldlVWNSd2J0QTVzYmVYSTNKSVUvRVdXemV5SWcxMDdlekRwc3Vj?=
 =?utf-8?B?Z3pkTGpBRGlaYzNjQ1V3UC9DVjdBcm43aVFnNEdDMDlFM2k0OVpTMFM2eWpt?=
 =?utf-8?B?ZEd6VGNDTzVGMmlwUHVHUWVnTzFqMlQxa0NnLzNGdVM4azJtTFNVaHpGcGJR?=
 =?utf-8?B?TGp0MGNYNU5ITGF3cUtZajNaV2pSeTAzMjRXWTFGZVUwUDNrR3BQT0RFYXQv?=
 =?utf-8?B?MmpYb1h1bXltVVpyOXM1LzFQQ2l5aStlbDcyeTYvOGt5OS9weUZzTmM0TmR5?=
 =?utf-8?B?VGU2V0g2YTJya1luQk53QTk4MFlmUkQ1STREMEs1MVBYNEU1cXg3dGFEVVk1?=
 =?utf-8?B?Qk9OdzdUSzBLZ0NGblphYVZvVkxETndQNkhEeTlXWmFvTVVaT2FrYTFDVWhz?=
 =?utf-8?B?MStCTzBoczY1MnBVRFNpUENRMHFBMHAzdzUzN205RHlDY3hieUpBM2FJZkdT?=
 =?utf-8?B?cE9ueFRjaVhqcjU5TFliME92dFJNQ29aMXdWK1NlMm9qdjl6T1dZYzJENlpD?=
 =?utf-8?B?c3IveXJ2YVVERWFNUE44U0dmd3N2OFBNUnFVSEdvVlp2Q2RmanpXQUR1K1lE?=
 =?utf-8?B?Z2tCRWJRalNzTGZKMkkxZ1ZVTkJ2TGNWUHhFbzF2YnNMMTVWa29nVnlyU2NZ?=
 =?utf-8?B?QkEwcUhwNmorVkdOQ3htejNNQ0FZL3JuUm9rZ3pyQWYzbHlFTlhZckYyRUJG?=
 =?utf-8?B?VncxZFJSTUZhRHFWN2tlYWp0WkJiUHdFZkJ1SHkvekNpMllLTnF2RzdrUTkr?=
 =?utf-8?B?U1F2MTVHWGhha0R0N2hkQkxKT3lESzFUKzRXQ25TOXIxbVd0NVAwMURBNEpN?=
 =?utf-8?B?czJxSy80aUZ5TVJtZ0k5Q1NpR1Q0U2ZVOTFmejNPbjFBTG1xdEQrRytROGxT?=
 =?utf-8?B?M1JNZTJCNldiQVEvelZTSEhuVzEySHVIU2FTZ1BveWNzMm85Uzh3cloxMGlC?=
 =?utf-8?B?M1psMnd3VWNxeUlGZ1RHUW5qbEYxeDUwV1F6cTYwK1NsN0lFODNHT2E0SmM2?=
 =?utf-8?B?bGV1RzdURmpCblZSZnVhQk43bWtKV0JTQ0lNallZVnp5bGFVUjBHZkdGWmNl?=
 =?utf-8?B?OTZ5dW45ZkVLN3VETW1jV21UM1J6VDQwRzh3WlFkZVpvcEd5L0JwYTdRUVBr?=
 =?utf-8?B?OTNDbjFRSWt1UzJXeDFuejBGTVJEcmY0S21qN0YxcEVYem1WbGhxbTlLLzFG?=
 =?utf-8?B?bHcrWUQ0Vm0zSmdkK01Xdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dGlxMC9BNkd1Q3lqMjFycVhtU1prbUR6VnFKaDU3UGxZY3dOdm1uUHFENkZF?=
 =?utf-8?B?UUF3WTVQbVo2enlwck9ERStGRnZPR21CMWx1dENIYUNnTkFzcitUaUtRcjJO?=
 =?utf-8?B?b0d4TDhKR0FNWTBNanBiNUFraGxqS1AzMTZETCtCblR1aTRaM0RZVjg2WE1M?=
 =?utf-8?B?V3VpOTRlUlFvTmk2TXhPYlh5MnQ5UXVlOC84R29oZ0JqYjhmL2pNN2ZKbGda?=
 =?utf-8?B?WHRESkR4eUY4b2hVSUd3S215QmhTdCtWQm9sV0tqK2F4SnArOVQrM0Y3b2RK?=
 =?utf-8?B?Q2JSVjBUWlA4NEJTSGFoa2cvQnNabnl6U2RpVVd3MnpiMkh6LzQxRmhUU0pt?=
 =?utf-8?B?ejJnTmllUVF4VkcwSVpoOFZzZWhtR013cERpazNybkU3OWV0anc2Z2UvYlJ4?=
 =?utf-8?B?c1ZiRllTUTMxUWxkV0paUGUxRHlFZEZOS050MHE0SlVxRGNoYWI4emtGSERF?=
 =?utf-8?B?TXpHZG8zbmtnVzY4NCthSnh0Z2NrSzg5c3RRakYwZ2Zlc1ZrY1BRbVUzajFk?=
 =?utf-8?B?dVZrUmJXL09MUWcyVng0aGVUS3dwaUNvTmd0SnVOTisyRURwY2lTWFpJbEtN?=
 =?utf-8?B?TDJWL3RVYnNMTzU2Si9wQXN2b21jVmZnQnlJaXFEVS94YVdlWVJrenk5MmFW?=
 =?utf-8?B?VGZKZCtyMk5qKy9PdnJnak55Mi9YbHNKVjBtM0k2cUxXUWkzS0tqYWVXRFI3?=
 =?utf-8?B?Yi90Vkc4a3N1dFppMEhyL3JRR2FDNHNnRXRuTHlCeEZSVkJYMStLMWh0Ujgy?=
 =?utf-8?B?SHhxeUdIM09MdzJuL3Z3Y09GUGZZL1lBU1hFOFVyeDEyTmd4ekhQR3V5Yit0?=
 =?utf-8?B?M0YyL2tpNEZmZmRyUU9Xc2o0VzRBd3VVZUxkQ3R2TEwwQVhpeGRiZDZuemc2?=
 =?utf-8?B?SzlUbkxNMzBTV0xhajk0VTVHTmdHT3BDQWRZanhOVTZGQ0hSenUyOFRCK1dJ?=
 =?utf-8?B?c1A2bWlKek9WN0NISHFOL3ZhYXRnSlJqM3MvWmpuNXp4Y2h2Q25laGJpSlZF?=
 =?utf-8?B?V25rZ1lzbm9nNVVKY1lrSnZBK0E1UWlxR0xNY3JzeFpZRi8wS1JBU1M1OEky?=
 =?utf-8?B?bE5ZcEhRMGQ3L0JPWUV1ekxtZmZXQXUvZjBsMDVyRjN2UVc4bGUwRVh1RXdZ?=
 =?utf-8?B?MG83NGZjV3RlWVZVMWtQc3NlL1k1aGRFNlFqLzdEald4dWplUENScVhncGxP?=
 =?utf-8?B?b0xZVWNCeExCd3RZNFdwaHZmQlRsa2tXMy9FL01yZFFFVEVSL1JwcVRaQWh4?=
 =?utf-8?B?N0FYWGtKbDNWYXJVbmdIQzZ0S1hwRDR2R2F4M2wyQ2xyYkUxQStSNG5DWXNY?=
 =?utf-8?B?ZGQ0Rm5TOERWd0xCOGdSTStOVVVCV3o2SlpLMjJKQXFSSnJHS1Z5N1dnZmw2?=
 =?utf-8?B?Um1mbVZjN3lMcUIyZjEwZXNQTFFEdHYxQTBPRk1wUTFWYjVEbTBiSXFQb3Mz?=
 =?utf-8?B?MVpJYmozVDR1UGk2U3ZCYXhTODVhZHdneGk1eFhnd2tDdFVxdW4xTnV0YkpZ?=
 =?utf-8?B?d2wySlpiYUlweHpnM2NZQ1k2MU9zSDlZREVENTlBNTZEcEtzdHBWRlJ3ZWIx?=
 =?utf-8?B?VXI2aGUwR0JsVDNNaiswQnB5SlkyRERaRXBIeEZqQ05LR3RvTFJEcGtUZzlh?=
 =?utf-8?B?OGFPU21mTlZrNHVTOUQyOTcwZnorbnBLMFFLU2tZblRiRGFQYndqTHNrcGJq?=
 =?utf-8?B?SkthSFZSMkFSUTkxb2JqeDhmcUszMGtkQVM4NGtBcXViTEZtY0hEQWJMdk9l?=
 =?utf-8?B?MFYyWVcvUzBpbVRSam45VUJBSWduMklhdEpQYnVWYUpSZ3pWTTRNZU50eHow?=
 =?utf-8?B?Z0VVSVFoWThmV1RIUU9aM2JxWEk2Z2wvODdIUTJQV2ZKQ0NKeFB6bk82WU1M?=
 =?utf-8?B?aytSRnFsMExzYWtlQnEwZnMxNFpsMW1Od2txVitPWlRnTUREUVJ0OU5tTnR4?=
 =?utf-8?B?aGlJcTd6K1E1Y3pFbHVBenkrSXFiMldsby8xNmlqWXlmMksyZTZ4MnQ4ZVcy?=
 =?utf-8?B?eUdZbEZlVTVpVnFFeUFyTWFWSENKemVtamorUnBPc1ZHdGR5dGhmdWVROHJk?=
 =?utf-8?B?cFFvMVpabVFiQmhuSVcwYndtTDkwcy92Zk94ZUxtYWRReTRXMW1KYnJLT204?=
 =?utf-8?B?N0IxTXhwZ2t0UU13bnBac3cyeWN1TEtQWTdOenRBNFJyU0gzcEF5NmVmYTl1?=
 =?utf-8?Q?ySdUei2r+oVm+eQuPR6Bgug=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a65b2a7-25b7-4ffd-11c3-08dd30912e09
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 09:37:05.8146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sx9WC8AGww67XQgdVVUqNl/78U+i2eB6ur0EScGrXgSae4i60q63EaAUHHfwP6a0JHJH6LDP5Z3tQC6atz5JYuI9M+7D1fEukMDNlh2K6Q+v18zcBUuzVa8fZlIaxRL4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4559
X-Proofpoint-GUID: vdXPqwuFX8rncJtrgLnb7NV4IACvvYd3
X-Authority-Analysis: v=2.4 cv=bJjsIO+Z c=1 sm=1 tr=0 ts=677f98c4 cx=c_pps a=TJva2t+EO/r6NhP7QVz7tA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10
 a=ei4SEBeUAAAA:8 a=Q4-j1AaZAAAA:8 a=qhxIPH8sN_DzcxWlB0oA:9 a=QEXdDO2ut3YA:10 a=On0Qz11iJF4A:10 a=8zIOOLb7Ym0NljyPXbuS:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: l4Pg1bEnS2VfBVmRyw896EcWN8PbEMMx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-09_03,2025-01-09_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501090077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jan 2025 09:37:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209621


On 28-12-2024 00:23, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Fri, 27 Dec 2024 at 07:54, Varatharajan, Deepesh via
> lists.openembedded.org
> <deepesh.varatharajan=windriver.com@lists.openembedded.org> wrote:
>> https://blog.rust-lang.org/2024/09/05/Rust-1.81.0.html
>>
>> Dropped:
>> 0001-cargo-do-not-write-host-information-into-compilation.patch
>> hardcodepaths.patch
> You need to explain why the patches have been dropped, as they're both
> marked 'Inappropriate'.
>
> Have the issues been fixed upstream? How and where? Can you include
> the pointers to the fixes?
V2 has been sent with the required info
https://lists.openembedded.org/g/openembedded-core/topic/patch_v2_3_3_rust_upgrade/110513059
>
>> +diff --git a/vendor/cc-1.0.99/src/command_helpers.rs b/vendor/cc-1.0.99/src/command_helpers.rs
>> +index fe919a5239..2b1f442019 100644
>> +--- a/vendor/cc-1.0.99/src/command_helpers.rs
>> ++++ b/vendor/cc-1.0.99/src/command_helpers.rs
>> +@@ -257,6 +257,7 @@ fn wait_on_child(
>> + /// and store them in the output Object.
>> + pub(crate) fn objects_from_files(files: &[Arc<Path>], dst: &Path) -> Result<Vec<Object>, Error> {
>> +     let mut objects = Vec::with_capacity(files.len());
>> ++    let target_substring = ["rustc"];
>> +     for file in files {
>> +         let basename = file
>> +             .file_name()
>> +@@ -277,10 +278,29 @@ pub(crate) fn objects_from_files(files: &[Arc<Path>], dst: &Path) -> Result<Vec<
>> +             })?
>> +             .to_string_lossy();
>> +
>> ++        // Function to find the position of the first occurrence of the target substring
>> ++        fn find_target_position(s: &str, targets: &[&str]) -> Option<usize> {
>> ++            let mut pos = None;
>> ++            for target in targets {
>> ++                if let Some(index) = s.rfind(target) {
>> ++                    //If a target is found and pos is None, set it
>> ++                        if pos.is_none() || index < pos.unwrap() {
>> ++                            pos = Some(index);
>> ++                        }
>> ++                }
>> ++            }
>> ++            pos
>> ++        }
>> ++
>> ++        let filtered_dirname = if let Some(pos) = find_target_position(&dirname, &target_substring) {
>> ++            dirname[pos..].to_string()  //Keep everything from the target substring onwards
>> ++        }  else {
>> ++            dirname.to_string()  //If target substring is not found, keep the original dirname
>> ++        };
>> +         // Hash the dirname. This should prevent conflicts if we have multiple
>> +         // object files with the same filename in different subfolders.
>> +         let mut hasher = hash_map::DefaultHasher::new();
>> +-        hasher.write(dirname.to_string().as_bytes());
>> ++        hasher.write(filtered_dirname.as_bytes());
>> +         let obj = dst
>> +             .join(format!("{:016x}-{}", hasher.finish(), basename))
>> +             .with_extension("o");
> Similarly, why this patch has this new addition? Is there an upstream
> discussion related to it somewhere, or is it just multiple versions of
> the same crate all needing the same fix?
>
> Alex

