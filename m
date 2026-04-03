Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B384E7E373
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 11:09:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9301.1775214542168529699
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 04:09:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dIJNC/lo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8553bf50dc=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6335kqq32115520
	for <openembedded-core@lists.openembedded.org>; Fri, 3 Apr 2026 04:09:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Z22x7ZJst25H5yA4Nbmr7Ks66VqykvTwLa4Soa21BtM=; b=dIJNC/loFHiK
	lWZaW5uYw6Tq9+YCgv+gnx2d8+fQx9lKZDzFAqoVJSsHoIxCSMOKFhIKQuD1wnc7
	qATwg8eAjHGHK66VKxvz7FX7wXHBieoD9Yw/qymwxKUFIHBFHqaItKFQtli8bHkk
	ZVbAe//li6TPXha6XLRK58JpK+TD9uUY/AITv7wBb4H1+KiJKRWgWxqSh4Q8YXJQ
	XsFeZfaV5k4cR6QYfNCsNmOJFMRVUugEw4IQVJwVRUYe64Qe1znf0NOoMbKj+5au
	xfZ2rcnFma3Q2+1vGcVmmfYumaoe21UIYnSd3zpqB9mh7X4ZCtYHTfHCUwWpYK5d
	mDEfiYCqBw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010015.outbound.protection.outlook.com [52.101.56.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d6a8vh1n9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 03 Apr 2026 04:09:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yd7V4Tk4y+w9ErGxl2OZ2yjQPcXucjOY+fUZiX0wYLV/TQm7H1TcFdDmCsS4yiKqlNN+JHei2yg5qdaoufRKQ3mmvOtcBJ7L9JY3hfMNHSQzF0F1szwiS1V3q/lmkGp8u4XkOfOEBfH7eiBugx9dt/FKP1fEwRMUOYBxQQ8JVGcS1gR2xeLxieBS40QbkqPy12P6HuBeztV+H/+9F59tRg5UDa3CJ4YzebHpcicFOU6+V3FdZTl4NehQhtQoQdrS1HvYI79j6rVgzGjf/9w+Ey78y0lVTLLsgb/gdLp/z81Y9rLmIlZ6g3zO8BCPPVTj8NTnwREdswQKdf8UN4moQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z22x7ZJst25H5yA4Nbmr7Ks66VqykvTwLa4Soa21BtM=;
 b=lfOiA4ygoyfPTNC4tP7g098ZTLBiANMxdTqQ0wnrtStI2TCZTIcfZM/kQz0CtzJpokPyjNiwqGh7Z5p1Z8CSzrKMvs66C0wbMzFOB8M1ema1Qp1glufhEjF0WB+CNYjUVbvwYyqm9pi1CxrkoDh2xq8y9DuQNmnlc8+iDEppgZjvrwOejDoklEC1cN3c5BLcszZhhmnuUnARc2p2FMr2hVkOvKaBo3Idj67d8WoRNwNv4jOFXQPQCWPqPNo2Hy+5nqdgQnhIy41EXPttZ8XpNIAuoMdTi1W4n+4xsF9+MXmsgfDy8UhA1lv/e2opOp3GU+0kKxpksfeZ4+DJvpgCnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Fri, 3 Apr
 2026 11:08:58 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9769.017; Fri, 3 Apr 2026
 11:08:58 +0000
Message-ID: <635073bd-cd01-4935-97e4-ba33f46886e9@windriver.com>
Date: Fri, 3 Apr 2026 19:08:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][master][PATCH v2] groff: upgrade 1.23.0 -> 1.24.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20260309150842.3379241-1-peng.zhang1.cn@windriver.com>
 <DGZQ4TTU05M0.3UH0ADSIVMSTT@bootlin.com>
 <6745abda-97f9-4963-b671-6c2722bbae0b@windriver.com>
 <DH01LLZRABRA.3OPRM8CVO91E2@bootlin.com>
From: Peng Zhang <peng.zhang1.cn@windriver.com>
Content-Language: en-US
In-Reply-To: <DH01LLZRABRA.3OPRM8CVO91E2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SE2P216CA0117.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c9::6) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|CH3PR11MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: 88705724-b030-4293-a7f8-08de91716754
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|13003099007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	++9rSj9XhwykIrjw4o9dUCjN0Lt5xx56ZAY4r5eDXqqe/a8R7XrRJssoE/Z7VsXoEulQQSHvL7Q5UAmZ1pql8vlOMxykBzDjcXD+aSn+vij5qBG3Qj2qBmE8xXpTXUHLNrZ40rf2+zCpLJpyYIPAYTPazTkPhkheWucQDPBLu1Kdl/0CYnOLPtnwjGIrM3EzUJhXtOHCFBqpCdo2Mjr4rGAhHSleAG943DkmGxnw86JHbeeDLT3KOunJRwotVo9HIoLwUFoJ4PJVXcZX1ODA+yEdVyk3MpSU/fgNKq7ZRgD6ajWUdhe9cEPVzC/RXD1BytdaEH0ASgXaacPwRJLEGYUShU0Ms/eEYols79uXAfraFH/8YdVkJaJ6OW9G/3gntpEMrBsCZAgjeuIMg+8DpoCTJ6CK0ylXIsNGXbjDzOFfWB1rCsR/DYy5LIJUaFaNsk9VWWJ3jfJmdkahmN9qfDISbQXUp6M5ZdUanFjZjhLPXWy2kyn8I102DyMfsV/VaakZlmm2wEj8a4ph6xhs5GbhiygpuKIxupqjO76LSk65/UIqm1oHUAlHFZ/jj7ZPsD+xx4GGNoLsU26gThYf8CmdHWxFG2bU9OB5Ruto2Bvb8rGt3896JWtl+fpQ8LA9IYsWPCYprifY4QX91hOg/sX29VZMBsYLddJL2NQGF/Cyg/zn8sZEcN93yUBPSABq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S0lDWWNZR3pTNy9OZGpuNkNXdXV3ZFpEQVZHTzU3YXFFekE4Nzg5SzNubExp?=
 =?utf-8?B?aGE0aDhHR0hWMTlUWURPWEtEVkRKdnRFTU94bGlxdVFwZjZabWdHMlFoS0Vt?=
 =?utf-8?B?UWFLR0lCME56QWtxZmVNM3B4SkNUZ3VPMmRpMjQzTzZ4Y1hFdjVGeWU5c0RV?=
 =?utf-8?B?SlIvMVpvc1drN3hDdU5yUzd2L0xVWHVYekpNM0E4M0dwWVdyUWdMWGJHanlT?=
 =?utf-8?B?QWEwL1FqbmxVTUdFYkIvNW81SW12VjBwUmVuQ1pRZG5VeGVwWjNGZDMvaDY2?=
 =?utf-8?B?K21zc3ZSVTIwNmt3QlhlY01aaTNjV2U0Tlp4MXNUaHFXMzJqbzh4K0pTZHJh?=
 =?utf-8?B?S1Mzb3g5SUkwNFVncENNRVpqRFNjenRaNlZYWERRR09DdW8zOUtka1RxY2ls?=
 =?utf-8?B?QVFLcU5wSkVQaEljc1VXdUlIYURoMGlITUtiaGFxb3F0OWZJbDhyVlBJTzBa?=
 =?utf-8?B?MG5HelR2bTA1OXA2MXUrYmR4RVBHaXR2WFZGQVJzU2MrOXR3SjgzRDBuUUx6?=
 =?utf-8?B?eGY4bFJYcnNpVldmMG5mVkE2U0Z2L21FTm1PVUZMdU8xVUtnYjRsenV2ZnU0?=
 =?utf-8?B?dmJWd1JOYTI3R0ViaitZUDZ3TTlkdDBwYzllbFlxTXpMZTZOUVh3aHRhUjk2?=
 =?utf-8?B?NFEvWXRZc2xVTlJaVEl0NHV5SkUzNURwbmRsUnFoKzlaWFE4MEljL1YvanVx?=
 =?utf-8?B?em1tbWZtZzZheDlGSUt2VDJJTW9uWC9yNDdwOGNCdzJZckVwbVZ1VXVjY1pK?=
 =?utf-8?B?WnZSS1I5cmJrWDdXdkhLRTNWRWxyRnpRN0JhcUxRTzBZTG9tUDFYbzNJN0hl?=
 =?utf-8?B?ejIra0pDVkhNZzlWajc5UzBFTjRTUWswZTRQUWw0SzVEeVRpRXNxSmZTcXFx?=
 =?utf-8?B?WnBGV0h6Z0pzRC96R3o3cytoN0xEYkpEbHRyN1pwNGJma2x1SnZ3cCtycDBi?=
 =?utf-8?B?bzJ0amxlTnFRY2hOSTkzU2VjbzFCa0I5RzUrcWVmTitNdE1wcEpyZmdBVHAz?=
 =?utf-8?B?Z3EzMjFuR3pPT1VxdzV4MktsWURsZW5xaXhQTzRDbWxHSytiQ0FUdDFGNGl2?=
 =?utf-8?B?bUduNmdEUU95ei9iWXJwSDN3S0NLQmJYSDh3dXlRL0xDQ2lLa2F1SzBNUTk2?=
 =?utf-8?B?WHNRK1FFaGR0eUlKRXlBTDFqb29zWXpMNWtrS294Tm1VWUxRRnIxMWoyUFdp?=
 =?utf-8?B?cWxhMm9IUVcrbmszbS8zenVTMlpQaGd3T0N4Z3M5Y2JNL3o1d0VmbGtsRU1Q?=
 =?utf-8?B?c3AxMDZ4eW1rT3ZXVjRQZ1lHZlFxUFUySE5XZmpCM1hRR0tRb0tidHVqOUdy?=
 =?utf-8?B?emNobithWTZJYTlqM2V3eW5KWUhSNWxnZVBVK1RyN2Q0RXlRU3gzWlYwK2RU?=
 =?utf-8?B?MnowSnc5U053a2psOUxGNWh5UHo2a1NMdGpvenEzb2NCT1hkU0NJUnQ4ZlE5?=
 =?utf-8?B?QWlReGt4Qjhpc0ZUODJNZ2xmbFVTS21ickEzcDM2SHJVeHk5ck9ld1VkVDF5?=
 =?utf-8?B?YzRlVUdwSDh5dXk4N0xWVHdlbXdvNzVNMWg0WGtIQ2MxdzU1UkdsL1h3K1Rp?=
 =?utf-8?B?YVJIdkRKZmkxVmRDS2lHQm03eHBJVXlpdUI2Ym5oc2hIcWtBRE9udGdvVmU5?=
 =?utf-8?B?UXN5eXFmcE9vVmhJZkN6Nm1MS0JkK0YvMUdpeHJ6aHFSM252V3grV1YxRGNI?=
 =?utf-8?B?a2FsNy94MkcrK0RieTZvN1E2WVd2U2FNYktHcFV6N3VJWWVpWTk0ck9Fek1m?=
 =?utf-8?B?ajMxTksyekhCM2NadjFIanhLaTJiYSt3dlBnR0g5SllDd28rL2wrQzVScy9j?=
 =?utf-8?B?ODc2QjM1V2lNek1wV3gvWmcrL0FOR2RsYXlhalFpdTAvdEhkWWo3MEJvZkNS?=
 =?utf-8?B?aUJXWmNaa2h0NWhVckpnRnhHT3E2TnRrSURrV1Z3SHlFd0dwRDN3VUlvYXFN?=
 =?utf-8?B?MCtRRnpMWmE1MTc5WmxCN2dTUFVZQVdZdFpBa285bTBNKzBDWlhFQmE5ZllU?=
 =?utf-8?B?Z2JZTHVKMStFUC9zZ1pJRUhiS2N6Qzk3RTBGU25YT2EzVXJaMWZXMlFzUER1?=
 =?utf-8?B?M3poc0FKSy9zNW5McEtZTm83TTBYRHBZdllGbVFXQkFOeGdmbENJZWNmY3J0?=
 =?utf-8?B?SWMzNHdNditFbmNRbWY3UDlXMmRERXh0VHdJd2wzWFhiZStCNXNwbmpQSmx2?=
 =?utf-8?B?QUFIb0ZoV1pjdDUrSVZJd0VpcVFhMnFIcjcyOGl6WFVwYTR0R01iK1RZSGNw?=
 =?utf-8?B?YWwzcG0yR2lCN01VaEtWazQ1ZzdTL2hEVm84WStCM3JtWWdYUTBudDZnQjl0?=
 =?utf-8?B?MGpUWU9EK01TQnFMTndPQnRJZ1c4MForVTgvQU90Smt1TXZjYnZ6d0VidFBa?=
 =?utf-8?Q?+BMrBoT4yVSJ4oqc=3D?=
X-Exchange-RoutingPolicyChecked: 
	WUQIPsBmcG9hIBW46InW7hxhh05584yh25N4d1cmobEHbKix1wJausVQ2XIvgr6r4pHIOJ8lIFx6BuiIzdUz9zy9OFVTnHsb7kDIhFWvUx5muiFUPQTySmJ6HzPvu8IqIGMLYB12I6ZxEOnYvhtMsnpTFFZPL+xbY5G6R6Wo6bf2XSiYX0kfYMGTlg81ifXVnX0Cd+xULUHyW3lf2nG6QDN7pXqHIZxCpdQffqqfG4WWGo2wzXQp6N7UMAxVbnC3+tMZPrEd75EkCPplm+SS03ziPoNqkezfBDDt0o+Sz38BA0hhIdvH/ydnFTUWlz02Peb3ZUJMTOV2GR2TuML7Ew==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88705724-b030-4293-a7f8-08de91716754
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 11:08:58.7892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WK0Vjx5zG3kejlXEp6TRHZDe4sE9DL7G0OgAnK6M6puOT9gsVMCZuoG6HkCNcXua5AMdgfdyGFgQWyQZXly9NhWoo+uLyDUnX17BE9SbaME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8414
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: cJ76RhILYtdWs9W57__z5LmotrWSVokO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA5OSBTYWx0ZWRfX6KiRyfiRVPOg
 +9hTNw/ScWZ3uqVE6ParskWldKbf6/xCrLRBCcdufYuiV8newDTEUGF0wA3w4cnkE5mfeaD8yQ6
 X1GV/vSH18AGgZ2Tly0w3IMawlYNOcoiGPQOGVeRivbah6vLiyV97nUwqruKV1SeHMSs4/BG5g3
 l4sBl4UEdbEq8Q5kGOYqjdCURk6muB7hgloVqQBC2eeDtHMCH2kV3g6e/pKmzb3CHUHGR0vuQIR
 3Rij+xIHu/WTIjiuxPMW6Vqxnc1/0PU4cdPT6tKreklH+hdL9/36cPA88XvXnsA2p5c08dO+N6V
 FzZbdCHKA7zPhoC7foqpcJ4sSgsxom//bft0CeqhGFi5SSl97SnDitQXO8UcwiGTtqYsLiAQVf/
 ZgWNDkf1McWe7rhtk9VEv5onlyPz9ERSX6vKRcu6xhRMptBir7PTxGeDfF5kjwe9EZHPzRwGfUb
 VOfpqrx/QAK6TSOn5nA==
X-Proofpoint-ORIG-GUID: zvnxWonbLNCMisZD3pYOkJoXrN25p3A0
X-Authority-Analysis: v=2.4 cv=ZKHaWH7b c=1 sm=1 tr=0 ts=69cf9fcd cx=c_pps
 a=TcXP/BJ3gOSVg56PH7Z4Eg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=mDV3o1hIAAAA:8 a=iGHA9ds3AAAA:8 a=1NWNoF9oAAAA:8 a=P-IC7800AAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=jrbCnipxWn1Ruay6kHkA:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=97APRTa-CG6DvPMFVxHL:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 11:09:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234580


On 3/11/26 23:02, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Wed Mar 11, 2026 at 2:57 PM CET, Zhang Peng wrote:
>> On 3/11/26 14:03, Mathieu Dubois-Briand wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>>>
>>> On Mon Mar 9, 2026 at 4:08 PM CET, Peng (Paul) (CN) via lists.openembedded.org Zhang wrote:
>>>> From: Zhang Peng <peng.zhang1.cn@windriver.com>
>>>>
>>>> Upgrade to latest revision of 1.24.0.
>>>> - Drop patches included in this release.
>>>> - Add patch to fix test-groff not found in cross-compilation.
>>>> - Add patch to use SOURCE_DATE_EPOCH in gropdf for reproducible PDF generation.
>>>> - COPYING, LICENSES: Refresh GPLv3 text.
>>>>
>>>> Release Note:[https://lists.gnu.org/r/groff/2026-02/msg00149.html]
>>>>
>>>> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
>>> Hi,
>>>
>>> Thanks for the new version. It looks a bit better, reproducibility test
>>> passed at least once, but we still have failures in some builds. It
>>> seems to be a similar one:
>>>
>>> AssertionError: The following deb packages are different and not in exclusion list:
>>> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/deb/./x86-64-v3/groff-doc_1.24.0-r0_amd64.deb
>>> The following rpm packages are different and not in exclusion list:
>>> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/rpm/./x86_64_v3/groff-doc-1.24.0-r0.x86_64_v3.rpm
>>>
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3554
>>>
>>> Diffoscope output:
>>> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260310-jxtz43x1/packages/diff-html/
>> HI, Mathieu
>>
>> It's very strange - I cannot reproduce this issue on my local Ubuntu
>> 22.04 system. From the Yocto autobuilder system logs, I can't find any
>> useful hints to analyze the failure.
>> My suspicion is related to the host environment. The autobuilder uses
>> Fedora 40 while I'm testing on Ubuntu, but I don't think this difference
>> should cause the failure.
>> Any help or insights on this would be greatly appreciated.
>>
> Hi Peng,
>
> So on the autobuilder we are testing with multiple distributions. This
> reproducibility issue did happen with multiple workers, with different
> distributions.
>
> One first note about the reproducibility test. As you might have seen,
> we are comparing the output of two builds:
> - The first build, left side of diffoscope, is made using the
>    sstate-cache, so the document might have been built on any worker.
> - The second build, right side of diffoscope is made without the
>    sstate-cache: the pdf have been generated on the worker used for the
>    build.
>
> We had 3 test failures so far:
> - One on fedora 40:
>    https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3554
> - One on alma 8:
>    https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3553
> - One on debian 12:
>    https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3556
>
> One interesting thing is, the output of both alma 8 and debian 12 looks
> the same, if we compare the right side of the diffoscope output.
>
> So, depending on something, probably the distribution, we have at least
> 3 different outputs:
> - A first version (A), generated on an unknown distribution has reached the
>    sstate-cache: this is the one we see on the diffoscope output on
>    each builds.
> - A second version (B), generated on Fedora 40 worker. Output differs
>    with A on the ipk generation.
> - A third version (C), generated either on alma 8 or Debian 12. Output
>    differs with A on the deb generation.
>
> So one idea might be to try to build the package in two different
> dockers, one Fedora 40, one Debian 12. If you are a bit lucky, you might
> get some different output.

thanks very much for your informaion.

V3 send

> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

