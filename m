Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B88D3E768
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 18:20:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2888.1765390847469165825
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 10:20:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=agWjmJ+2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=44393876b5=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA6UpOk1972191
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 10:20:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=ekRk0oILZjNx5XO0kcEsZb
	1HS0T/F2ACSEDjD37Edfo=; b=agWjmJ+24QhmnZnlcbLR8YU7jzj+4xuRdDvZai
	BQMMxIDUkB7RKEOhU4XWiJ8DjU69cQR68MLq7tM9KUC8MSwixsKz8drgUcReH+L4
	Ba+G1O171CI3HT08kfeh0v11+fBcnhEHF8cQeb7dHDHY5bPvFMpiDWr7WMWs2+PI
	9gEzBr32MuVS1pt/bbvF4EhEcI92m3Qyx0vZsv4qxwN390t18EyVqyHmKdHpOSM0
	3uTq1sik552FBAnDfzVZmSaSPWE4+xl+S2/a79n/k6wfOhjKLr3oeS6W71w8h+GA
	h68O91H5pmwrl3xRLH5Iap2DawQVV/UZpqPYHhyV1R1iUh5w==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010020.outbound.protection.outlook.com [52.101.201.20])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ay022s1y5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 10:20:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QgHhBT/uol4yjVXJNuvPPbjCPIH0SCpJbCdQVr3jJATasE8xK9IXEFqffqVDZicUUKIBcnPfLTpSN7nIsdWN7IMg67aiDb9inBi7S0KNhLOMsd8X5cCTZiJD3r52pTMZL3+2vIMJ13XYPwtMju6yG/U3A3shvZ7HNle4xcs4yQLUO0RXiXbJpSTnhB1kSWDOJSz8RIsOQhpuOxf7V83Bn91KkRP6cJ+GhX0p/kWboo1LwWlI2bqO9tiNqYd6u5LTEVwD8kfJITzctlFypidjSWQ4Klpi65EZLGiWfvIndBFoYfa6fIHLYNZbbSgh0+yCyFwAO1LO7lThATGJT7nqZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekRk0oILZjNx5XO0kcEsZb1HS0T/F2ACSEDjD37Edfo=;
 b=sbhOzYZFwPAZDhHuMIfn+WiYLvEMY20z57/Fkyq2Al86uAi/eMtYSOZliNfzA8x1+Nw5XvwxpVXgcGdtGqLQRxW5CpmS7yMaym3wXND2YJHDouniVrolWdHsDYfDdsSc/kLYtNmqcUCCnihEeQfmRqVLhZZGVtq5Nb5OSBX1xG0aI8Sg8wrHaYj7YpuFExzSpbcR5Tc3dCYg62lEv9W3EmIkr8u/6ZuC+OYTRK4co6RF5iooEZs48i3RfV3CrwbbUi3BUAfT1XgWhYV9nr+r+rmgPYAyaxYLLKvNWOfkqpjCIwiuSHQp3ywv9HADHnmUc8ZN7Cn6SE27mojAfQlTXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8505.namprd11.prod.outlook.com (2603:10b6:408:1b7::21)
 by DM4PR11MB6432.namprd11.prod.outlook.com (2603:10b6:8:ba::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.14; Wed, 10 Dec 2025 18:20:44 +0000
Received: from LV3PR11MB8505.namprd11.prod.outlook.com
 ([fe80::e59d:2e70:4371:48cf]) by LV3PR11MB8505.namprd11.prod.outlook.com
 ([fe80::e59d:2e70:4371:48cf%6]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 18:20:44 +0000
Content-Type: multipart/alternative;
 boundary="------------f0QBDrYl701FdrarPFcUA1Pv"
Message-ID: <c1d25645-bafb-4d28-b1f2-31931288133c@windriver.com>
Date: Wed, 10 Dec 2025 13:20:38 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] rust: remove passing tests from excluded and ignored
 list.
To: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, sunilkumar.dora@windriver.com
References: <20251210101803.1120711-1-Yash.Shinde@windriver.com>
 <20251210101803.1120711-4-Yash.Shinde@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20251210101803.1120711-4-Yash.Shinde@windriver.com>
X-ClientProxiedBy: ZR0P278CA0090.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::23) To LV3PR11MB8505.namprd11.prod.outlook.com
 (2603:10b6:408:1b7::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8505:EE_|DM4PR11MB6432:EE_
X-MS-Office365-Filtering-Correlation-Id: 3925c0b9-74af-45ca-a86a-08de3818d545
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eHJkN1graytDYU5GaGoxMUxVUkQyNjdpS3BJOXJieXdpL0NkRVQ2VEVQRG5h?=
 =?utf-8?B?WGtXVUduYWhlZThpYTJScnpkS3hTUVlvb1Rhek9JT2hnZDBjSFFXT1RWMzhJ?=
 =?utf-8?B?ZFlKSG0zOVpmUi9BWW1Mc2JGYW51NWI0NXhmM2dDT1lMK1VmZm81QlU0SzRL?=
 =?utf-8?B?U3RCeFNuSGt1VC9iYlB6QXVvaVdsMU0vMjlBeGIyN1BBVEJCMmI4dkc3RkRW?=
 =?utf-8?B?SnYwRGtSdXNlY2QxV3V4VE1YeDM3dEJLOVJwTEtlS2Z0UWNpV3pJenB6SEtp?=
 =?utf-8?B?cWFyWU53RnlaMkwzVEJNTzB4ZGRSek9HME9JTnBjQWJYR1RrSVVacjVsT3VR?=
 =?utf-8?B?ZzBnMG43dW4vUEFoQkt5TWZOcW5KN1hiM2RUUzFOVkJXQzdkZjNoZXY3UVhu?=
 =?utf-8?B?eDg5VzNPOUo1VmhKeGJmb2k3d2c0Kyt1VmJEVnV6bnFIQkxuRDFZc0ZTSDd6?=
 =?utf-8?B?YXRsT1BxUnNVaFRkaTZVamdGdHJITVJqc0FjK2t0K3pmMVlvSGQvZHMrQ2pC?=
 =?utf-8?B?M09ZQXYwdUtmMGdWL0FmOGhGbVVrbmd2WnVVWVgvNGFvS3BxYldVdW1CbTh2?=
 =?utf-8?B?dEgvTUFjeFVwNlltOElnMDQ3SmphK2g1Y2JoVndEbGtwa0dpdE1nbmZoS3lm?=
 =?utf-8?B?ektuNW9iaW8rSnJ1aUNuTlB0WXpYaXhZZzZFMTVzQzN2TkJzSFBrZzRsTnho?=
 =?utf-8?B?TFRUVk5OVEdQcUh1eUtCYkRmOWhmakJGNVpoelNFSU5ibVBISnN3V3RFUFdX?=
 =?utf-8?B?ME96VVBCUkJpU1dGblEyRkVmK0ZtcVVtb1AwSlh2bWwvb2JrUUdkWHY5WGVH?=
 =?utf-8?B?TDR4L3J6cjFQSWdudUJJeUVUVFZYbEt2RlF5SHFDSVIxTkx1TXppdldBK3d1?=
 =?utf-8?B?dzNzYWVYaWhpc0JnaTg2MzAwM093dWMzbkdpZlY3eEJNL1pXb3pyazZuRnha?=
 =?utf-8?B?Y01ieEhWNHdUb1RGY1dUT0lqZDd1b1NVN0ZhOWtrRHBrU3N0cHNmdm1yRGVK?=
 =?utf-8?B?bmJ0NkVIQlRORHRTcFlKYjQyUFEzN01nYjZnZ2toMkVUVkxUVDZYcjdudTNS?=
 =?utf-8?B?bys4b0NDTTBXanR1L3ptTS9Sb3N0MjFVRFA4ZGVsbFplNHMxQ0tSc1Y0dzBU?=
 =?utf-8?B?Qk56endPUWk3aUJrSnR1K0FYRVllVUhCMzhncEpGWDIva2UzMndUWitEV2lm?=
 =?utf-8?B?YlpIaGVMdnlSVUZiaFlxRHdrUmp1RjM0Z09KUnhNRno5VWVzcW13TmRiT1JM?=
 =?utf-8?B?LzNaelBEZ3NJT1Jia2M5bmt0eTV2WGdJRkxxdXRDYzlxYVVlbVJkVzd6Tnpm?=
 =?utf-8?B?ZER3NGV4RzF1dVoxc3hZU1drYXFnWXdjaTZPNHo1UDF2bzU3UUtPM1RhTVVk?=
 =?utf-8?B?d0dOYlRxRUhWclBSWmcwa3VpNnE4aWV6Y1lON3loaU0vTFUyVHNMeUFwci9W?=
 =?utf-8?B?ZHZkOXNLdFd1dEV0Ync4VTJ4RDR4bDVhRld2ZDVBY29hbmh3ZjY0aFlpaDJI?=
 =?utf-8?B?ZXUrMHZEakdIYWIzRHZmaGlOVlBoTkFFVW5yZVVMdmd6M0pDNE40QmtTcFp0?=
 =?utf-8?B?Z1JJMnlzLzJmdGFYdEhLSm8rT0dtVFI1ZlN0YS80aS9mNHQ1bWhqM1Yydzc0?=
 =?utf-8?B?MnR0djNOcnFKNTNRajU0b0wvVndYVWtFVStKaXFnYWxOM0tWaU1JZnJLWGRm?=
 =?utf-8?B?TkNvbU9pSjR5NnFoS244V29ncXZ6OFJKMElTSjFMRWppVjdoaVVyalVoM3Jt?=
 =?utf-8?B?UnAyMU9sK0V1SUtYVDNQTXpDWnV2U1MvNzFxSHUxSVdVYm52UWxZcVpxZjdD?=
 =?utf-8?B?a0lPK0JoQUIyckZ6Ui9FaFgvazlRZWNZZWIxNlVzNzNQZkpNYjVKQ29Fczgv?=
 =?utf-8?B?V01oeTkvM1k3MEs5RThjeDFhZXdPeklxVllUZmg4bituL2JXSC90dGVzVG5E?=
 =?utf-8?B?REdFUmoyUm5pSytXd1FDOHN4Zm45aDdNS0E2Y1FTaFN4RTg4eW5XMTRYaG0y?=
 =?utf-8?B?QXpKK3ZlSWtBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8505.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Sk1LTHZqOUJMSXlmYklIOXU3cGJEdGVKaExZRXhDUWNpdDArbXFsQ0JNTVVn?=
 =?utf-8?B?YW5vZ000ZndQNmNiRlFIVmNWcUJ6cVd0dVZ6V2tnN01wbWQ4VTVSL0FmOGZH?=
 =?utf-8?B?UlFRbXRlZ0hpcWZNM2cxeTFCTzR1eWVLcDNSNHBDeUNYeDZnVFE3STJ2alh6?=
 =?utf-8?B?Q3RIZWtGTmZVazJ6dzR2RjNVQ0VKWmJ1UDdCaWFtY2t6NkFXQWs5RE4wR3Va?=
 =?utf-8?B?cnVJZU9ObTZ1U200K0I4VXlwY0FSaU1EYkE1ZndKVDBXUVN1YW9IR2JGRXhX?=
 =?utf-8?B?M2ZYL0dtQ2gwb2pWWDc1UU1mUGhzaGFuSTdIUC9FUVRwcG0zODRlMXcrQ0t5?=
 =?utf-8?B?M204dGorOVNzOFU0bWgwbW5pWGZLUnB5M0owTm5yUDZZcGpwZGhvVW1zTDBW?=
 =?utf-8?B?MjR4ckR4SmovdnVDVUhqd2FVZHFSV2cwVVUxblFINTZLY2R6YVV4a0xnQ0NU?=
 =?utf-8?B?dHJ3MHpZd0JZOFB6T1ZrRGh2Y2QydFB5cElBSnRIOWt6S1gwdGRZQWtNcTc4?=
 =?utf-8?B?dTZNR2JlVjg2dVRPQkNjcVRwd2hWdFNabG5Pejc0Q093Z0Y3V0JiMU5CUzlO?=
 =?utf-8?B?WkdmeEpTTVg1SUM2U1pyNlV5SnJPdnMrUlFsQlR1RDZMd1FpSXFwKzZPcm1D?=
 =?utf-8?B?dlk4cG5mbWhCY3JNMFhjMTNWelprc2dweG9NeW5tcWMyalE1TC9CTDgzdDdM?=
 =?utf-8?B?ZzFGcmh0VHFBQzY2ZFBQeDNuVmpwYm1hTnZCdk9XNDBOQW9taGY5b1ZrQmgv?=
 =?utf-8?B?aklmcUhTd01yS1REelRlZzVkN2FXanpZbFZWV1czUFp1OVRBc1hQV0hQMW9o?=
 =?utf-8?B?MVZHZXNPbmdRbmlzVy9uM3R1MDZqWnRNV1ZPN2pZZStFN05QOGVJaFR5MENh?=
 =?utf-8?B?aW4ycTBZajRCS29mTnJhY0VrOThMSVZ6bVJ5NlFERTRjODZDU3BRTmVzamMr?=
 =?utf-8?B?YkpFaXkrSjdQS2FweFJEM05hSTdlNnRNblVyc1MxQ3pRTitjbVNtd0RXeXY1?=
 =?utf-8?B?dDA4VDhQeWhGSEFiN0ROd0JObmtLTEV6NjNyR0drR0ZVK1Nlb3V3dXd4R1k0?=
 =?utf-8?B?TnJkOFRSVXRxTG5HbFRWREI2UTh4Ukw4cW50UXQwcHlKQmlFa09XR1g1eHFP?=
 =?utf-8?B?enZtRXMzdGdEcnZzUGlwL1crYWw1RjZ5THVKOU1ieTQvLzRyZFhFR3k4M2w5?=
 =?utf-8?B?b0U4OXV0YjdTby9jQzAweHM4MXJwMFYwN2NLL09BOGIxOTNicVhqQkpKQmhS?=
 =?utf-8?B?cFkxQmxYVUt0U09GSWw4eEFmN1J6aldaWGFrbm9iUjJ6MDlDc05iN25hNDRL?=
 =?utf-8?B?aXh4TTdpcjZrZ1N3aWhON0sxUnV5Y0FLc24yQmRPbFY0N0VDanFUVDhLczAx?=
 =?utf-8?B?Y0lKNGdlMFQ1MVIyaG93bkJHRmFoKzh3aTNZV2lOSEdEdVBkaHA2QVpweFdN?=
 =?utf-8?B?WHozdzBRcU1sMkVWVVZDSEdKam9abkdTb0hxVmZrWlVGTHNaTkR3YlNWd1po?=
 =?utf-8?B?T01RTkdsNXppS3VOWkdwRllobUNsR1J4L0JPWlViSjZ0aXh3eENMQjRPSWtK?=
 =?utf-8?B?VEozY3FYbUtFd3pMZXBhVVV0clppVG1Eek1YZ1JzbUhkQk02bXN0dWxqUlQw?=
 =?utf-8?B?cUF1b0tZVE4wTVNaNUp4dFVoUWFRSzVjZmFKckRZSzEremxhN0d6djFPYnBV?=
 =?utf-8?B?emJHeC9RdEZFaDRjQWRtVXJRbWU0V2hwb0dna1FGaEFkUWhUd3d2SURoNDBT?=
 =?utf-8?B?TWRSNHg5UFpyVHdHQlNXanRrSjhaMUxrZlNLUTNrYW5LcGJKaVVuVlJIYUx2?=
 =?utf-8?B?Z1V0OGl2Q2grQ2hZVVBZdWl5L3NYYTdMVENVeERIOGx3TDJSd1FJSm9kNTRy?=
 =?utf-8?B?T2FoNXRPVDJ5cXgvVzl2NjcvU2t2TWNBUzF3NHRwd1Jlc2FnQlJiOEVveDdT?=
 =?utf-8?B?KzBFSFBxN3BlUkowWDVtQWVpZXh5RWVJUlpGWmdYT3JTWHhMOVFSZ3U1MEFD?=
 =?utf-8?B?bnU2QzUzLy8zdHh0Z29lc08wbEE5UVk5NkJ6MVdyeGY1NnFZUGJtNjVHYmhP?=
 =?utf-8?B?SzZvY01nM05mVlg1M0Y3SU5QblV6c2c1emhUQlRrYjJrcHBsTHlFRVp5aGJr?=
 =?utf-8?B?UnhIWDdOUDNpbFl4REswV1dON0czdGlOTjhSeHRVMW1XZEZjd1l1VEVGZVpP?=
 =?utf-8?B?eHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3925c0b9-74af-45ca-a86a-08de3818d545
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8505.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 18:20:44.3580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9L0zU20BZS+iELTYsT1Gmd0CcQ2pa/X0wtvreulHDZKsxINpaCwlWnfbHXnQV9sm7v1NAeipCvpHlojFxPDHAvOEiuJe04EeKCft4R5YA08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6432
X-Authority-Analysis: v=2.4 cv=bf1mkePB c=1 sm=1 tr=0 ts=6939b9fe cx=c_pps
 a=RzNzSA3Xhmsnv5027CV2rw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=WE-EI0cuEu0MRN69p4AA:9 a=QEXdDO2ut3YA:10
 a=Fi9ycsKON-C4BOGCTiEA:9 a=xLD8JcTOyxqBDF6g:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: aNtWjTe2dDwaV7RDlbm9ApVpOlcr6fto
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE0OSBTYWx0ZWRfXzRi3BIhzpI9r
 R483c3vF2Gz/C0wejJ7weuiIz+pW9awSpyWIDkvzpopVc8zjmeuOFSAsj2GubIMeA1uZluh1p9L
 fXOnZMUfHk1IFdZY25leF/rcu7ahb2aSdR36wUml8/pSgSwCaCHe+t6y8XbaR6cD0QvSgLyJ399
 FUHoZeWgM3HjQAb9KJ7lB1pbfuLk7xkQ3ZzsYnF7NBBJ6/V99tgZCbP0mydiRgA5w9ePRLbdGvx
 MsL+9tZUVoAQr/dymEPVmNxXY3uswrkLeXtm6mq/0D59fU8K7ANKOS1ZHwpUNlxlVoNZAMsRwXC
 8c2GhZ9LGXuKtrlIgcsVkWyE6ve0ns0JeZn6H7DKl6PuWXRapkzUjWqwOfBfVCK39OlxUd+5GAw
 tgfIjhB0QV9GM4pM3XZ9rLopM8TDLg==
X-Proofpoint-GUID: aNtWjTe2dDwaV7RDlbm9ApVpOlcr6fto
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_02,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512100149
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 18:20:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227495

--------------f0QBDrYl701FdrarPFcUA1Pv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-12-10 5:18 a.m., Yash.Shinde@windriver.com wrote:
> From: Yash Shinde<Yash.Shinde@windriver.com>
>
> Remove the ignore tags for passing riscv64 tests and
> drop obsolete "tests/codegen-llvm/issues/issue-122805.rs"
Can you add the upstream commit id/shortlog that removed the test?
The issue is still open it seems:
https://github.com/llvm/llvm-project/issues/122805

so you should explain that as well.


../Randy
> from exclude test list.
>
> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
> ---
>   meta/lib/oeqa/selftest/cases/rust.py          |   1 -
>   .../rust/files/rust-oe-selftest.patch         | 100 ------------------
>   2 files changed, 101 deletions(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
> index ebc9204420..3a41391101 100644
> --- a/meta/lib/oeqa/selftest/cases/rust.py
> +++ b/meta/lib/oeqa/selftest/cases/rust.py
> @@ -80,7 +80,6 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
>                               'src/tools/tidy',
>                               'tests/assembly-llvm/asm/aarch64-outline-atomics.rs',
>                               'tests/assembly-llvm/c-variadic-arm.rs',
> -                            'tests/codegen-llvm/issues/issue-122805.rs',
>                               'tests/codegen-llvm/thread-local.rs',
>                               'tests/mir-opt/',
>                               'tests/run-make',
> diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
> index 7d26d75820..b39b326455 100644
> --- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
> +++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
> @@ -202,106 +202,6 @@ index a05f274136..0e69b4cb98 100644
>    fn sparse_inserts() {
>        let cache: VecCache<u32, u8, u32> = VecCache::default();
>        let end = if cfg!(target_pointer_width = "64") && cfg!(target_os = "linux") {
> -diff --git a/tests/assembly-llvm/dwarf-mixed-versions-lto.rs b/tests/assembly-llvm/dwarf-mixed-versions-lto.rs
> -index 828328df843..30753c56c76 100644
> ---- a/tests/assembly-llvm/dwarf-mixed-versions-lto.rs
> -+++ b/tests/assembly-llvm/dwarf-mixed-versions-lto.rs
> -@@ -8,6 +8,7 @@
> - //@ compile-flags: -C lto -g -Cdwarf-version=5
> - //@ assembly-output: emit-asm
> - //@ no-prefer-dynamic
> -+//@ ignore-riscv64
> -
> - extern crate dwarf_mixed_versions_lto_aux;
> -
> -diff --git a/tests/codegen-llvm/const-vector.rs b/tests/codegen-llvm/const-vector.rs
> -index f4307492341..617e31140e9 100644
> ---- a/tests/codegen-llvm/const-vector.rs
> -+++ b/tests/codegen-llvm/const-vector.rs
> -@@ -3,6 +3,7 @@
> - //@ [OPT0_S390X] only-s390x
> - //@ [OPT0] compile-flags: -C no-prepopulate-passes -Copt-level=0
> - //@ [OPT0_S390X] compile-flags: -C no-prepopulate-passes -Copt-level=0 -C target-cpu=z13
> -+//@ ignore-riscv64
> -
> - // This test checks that constants of SIMD type are passed as immediate vectors.
> - // We ensure that both vector representations (struct with fields and struct wrapping array) work.
> -diff --git a/tests/codegen-llvm/enum/enum-aggregate.rs b/tests/codegen-llvm/enum/enum-aggregate.rs
> -index 0161e5f3fa1..773a06fabb4 100644
> ---- a/tests/codegen-llvm/enum/enum-aggregate.rs
> -+++ b/tests/codegen-llvm/enum/enum-aggregate.rs
> -@@ -1,6 +1,7 @@
> - //@ compile-flags: -Copt-level=0 -Cno-prepopulate-passes
> - //@ min-llvm-version: 19
> - //@ only-64bit
> -+//@ ignore-riscv64
> -
> - #![crate_type = "lib"]
> -
> -diff --git a/tests/codegen-llvm/enum/enum-match.rs b/tests/codegen-llvm/enum/enum-match.rs
> -index 57db44ec74e..1e2507f7c90 100644
> ---- a/tests/codegen-llvm/enum/enum-match.rs
> -+++ b/tests/codegen-llvm/enum/enum-match.rs
> -@@ -1,5 +1,6 @@
> - //@ compile-flags: -Copt-level=1
> - //@ only-64bit
> -+//@ ignore-riscv64
> -
> - #![crate_type = "lib"]
> - #![feature(core_intrinsics)]
> -diff --git a/tests/codegen-llvm/enum/enum-transparent-extract.rs b/tests/codegen-llvm/enum/enum-transparent-extract.rs
> -index c5efb8d472b..e79b8916fc1 100644
> ---- a/tests/codegen-llvm/enum/enum-transparent-extract.rs
> -+++ b/tests/codegen-llvm/enum/enum-transparent-extract.rs
> -@@ -1,5 +1,6 @@
> - //@ compile-flags: -Copt-level=0
> - //@ only-64bit
> -+//@ ignore-riscv64
> -
> - #![crate_type = "lib"]
> -
> -diff --git a/tests/codegen-llvm/repeat-operand-zero-len.rs b/tests/codegen-llvm/repeat-operand-zero-len.rs
> -index b4cec42a07c..d450fead9a4 100644
> ---- a/tests/codegen-llvm/repeat-operand-zero-len.rs
> -+++ b/tests/codegen-llvm/repeat-operand-zero-len.rs
> -@@ -1,4 +1,5 @@
> - //@ compile-flags: -Copt-level=1 -Cno-prepopulate-passes
> -+//@ ignore-riscv64
> -
> - // This test is here to hit the `Rvalue::Repeat` case in `codegen_rvalue_operand`.
> - // It only applies when the resulting array is a ZST, so the test is written in
> -diff --git a/tests/codegen-llvm/simd/extract-insert-dyn.rs b/tests/codegen-llvm/simd/extract-insert-dyn.rs
> -index 729f0145314..2b1d1beb86a 100644
> ---- a/tests/codegen-llvm/simd/extract-insert-dyn.rs
> -+++ b/tests/codegen-llvm/simd/extract-insert-dyn.rs
> -@@ -1,4 +1,5 @@
> - //@compile-flags: -C opt-level=3 -C no-prepopulate-passes
> -+//@ ignore-riscv64
> -
> - #![feature(
> -     core_intrinsics,
> -diff --git a/tests/codegen-llvm/transmute-scalar.rs b/tests/codegen-llvm/transmute-scalar.rs
> -index ce1b0558b2e..e8fda2cd566 100644
> ---- a/tests/codegen-llvm/transmute-scalar.rs
> -+++ b/tests/codegen-llvm/transmute-scalar.rs
> -@@ -1,6 +1,7 @@
> - //@ add-core-stubs
> - //@ compile-flags: -C opt-level=0 -C no-prepopulate-passes --target=x86_64-unknown-linux-gnu
> - //@ needs-llvm-components: x86
> -+//@ ignore-riscv64
> -
> - #![crate_type = "lib"]
> - #![feature(no_core, repr_simd)]
> -diff --git a/tests/codegen-llvm/uninhabited-transparent-return-abi.rs b/tests/codegen-llvm/uninhabited-transparent-return-abi.rs
> -index face1577c3f..09e0846bad0 100644
> ---- a/tests/codegen-llvm/uninhabited-transparent-return-abi.rs
> -+++ b/tests/codegen-llvm/uninhabited-transparent-return-abi.rs
> -@@ -1,4 +1,5 @@
> - //@ compile-flags: -Copt-level=3
> -+//@ ignore-riscv64
> -
> - // Seehttps://github.com/rust-lang/rust/issues/135802
> -
>   diff --git a/tests/ui/abi/rust-cold-works-with-rustic-args.rs b/tests/ui/abi/rust-cold-works-with-rustic-args.rs
>   index 551485469d3..575db924968 100644
>   --- a/tests/ui/abi/rust-cold-works-with-rustic-args.rs


-- 
# Randy MacLeod
# Wind River Linux

--------------f0QBDrYl701FdrarPFcUA1Pv
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-12-10 5:18 a.m.,
      <a class="moz-txt-link-abbreviated" href="mailto:Yash.Shinde@windriver.com">Yash.Shinde@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251210101803.1120711-4-Yash.Shinde@windriver.com">
      <pre wrap="" class="moz-quote-pre">From: Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>

Remove the ignore tags for passing riscv64 tests and
drop obsolete &quot;tests/codegen-llvm/issues/issue-122805.rs&quot;</pre>
    </blockquote>
    Can you add the upstream commit id/shortlog that removed the test?<br>
    The issue is still open it seems:<br>
    &nbsp;&nbsp; <a class="moz-txt-link-freetext" href="https://github.com/llvm/llvm-project/issues/122805">https://github.com/llvm/llvm-project/issues/122805</a><br>
    <p>so you should explain that as well.</p>
    <p><br>
    </p>
    ../Randy<br>
    <blockquote type="cite" cite="mid:20251210101803.1120711-4-Yash.Shinde@windriver.com">
      <pre wrap="" class="moz-quote-pre">
from exclude test list.

Signed-off-by: Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
---
 meta/lib/oeqa/selftest/cases/rust.py          |   1 -
 .../rust/files/rust-oe-selftest.patch         | 100 ------------------
 2 files changed, 101 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index ebc9204420..3a41391101 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -80,7 +80,6 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
                             'src/tools/tidy',
                             'tests/assembly-llvm/asm/aarch64-outline-atomics.rs',
                             'tests/assembly-llvm/c-variadic-arm.rs',
-                            'tests/codegen-llvm/issues/issue-122805.rs',
                             'tests/codegen-llvm/thread-local.rs',
                             'tests/mir-opt/',
                             'tests/run-make',
diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
index 7d26d75820..b39b326455 100644
--- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
+++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
@@ -202,106 +202,6 @@ index a05f274136..0e69b4cb98 100644
  fn sparse_inserts() {
      let cache: VecCache&lt;u32, u8, u32&gt; = VecCache::default();
      let end = if cfg!(target_pointer_width = &quot;64&quot;) &amp;&amp; cfg!(target_os = &quot;linux&quot;) {
-diff --git a/tests/assembly-llvm/dwarf-mixed-versions-lto.rs b/tests/assembly-llvm/dwarf-mixed-versions-lto.rs
-index 828328df843..30753c56c76 100644
---- a/tests/assembly-llvm/dwarf-mixed-versions-lto.rs
-+++ b/tests/assembly-llvm/dwarf-mixed-versions-lto.rs
-@@ -8,6 +8,7 @@
- //@ compile-flags: -C lto -g -Cdwarf-version=5
- //@ assembly-output: emit-asm
- //@ no-prefer-dynamic
-+//@ ignore-riscv64
- 
- extern crate dwarf_mixed_versions_lto_aux;
- 
-diff --git a/tests/codegen-llvm/const-vector.rs b/tests/codegen-llvm/const-vector.rs
-index f4307492341..617e31140e9 100644
---- a/tests/codegen-llvm/const-vector.rs
-+++ b/tests/codegen-llvm/const-vector.rs
-@@ -3,6 +3,7 @@
- //@ [OPT0_S390X] only-s390x
- //@ [OPT0] compile-flags: -C no-prepopulate-passes -Copt-level=0
- //@ [OPT0_S390X] compile-flags: -C no-prepopulate-passes -Copt-level=0 -C target-cpu=z13
-+//@ ignore-riscv64
- 
- // This test checks that constants of SIMD type are passed as immediate vectors.
- // We ensure that both vector representations (struct with fields and struct wrapping array) work.
-diff --git a/tests/codegen-llvm/enum/enum-aggregate.rs b/tests/codegen-llvm/enum/enum-aggregate.rs
-index 0161e5f3fa1..773a06fabb4 100644
---- a/tests/codegen-llvm/enum/enum-aggregate.rs
-+++ b/tests/codegen-llvm/enum/enum-aggregate.rs
-@@ -1,6 +1,7 @@
- //@ compile-flags: -Copt-level=0 -Cno-prepopulate-passes
- //@ min-llvm-version: 19
- //@ only-64bit
-+//@ ignore-riscv64
- 
- #![crate_type = &quot;lib&quot;]
- 
-diff --git a/tests/codegen-llvm/enum/enum-match.rs b/tests/codegen-llvm/enum/enum-match.rs
-index 57db44ec74e..1e2507f7c90 100644
---- a/tests/codegen-llvm/enum/enum-match.rs
-+++ b/tests/codegen-llvm/enum/enum-match.rs
-@@ -1,5 +1,6 @@
- //@ compile-flags: -Copt-level=1
- //@ only-64bit
-+//@ ignore-riscv64
- 
- #![crate_type = &quot;lib&quot;]
- #![feature(core_intrinsics)]
-diff --git a/tests/codegen-llvm/enum/enum-transparent-extract.rs b/tests/codegen-llvm/enum/enum-transparent-extract.rs
-index c5efb8d472b..e79b8916fc1 100644
---- a/tests/codegen-llvm/enum/enum-transparent-extract.rs
-+++ b/tests/codegen-llvm/enum/enum-transparent-extract.rs
-@@ -1,5 +1,6 @@
- //@ compile-flags: -Copt-level=0
- //@ only-64bit
-+//@ ignore-riscv64
- 
- #![crate_type = &quot;lib&quot;]
- 
-diff --git a/tests/codegen-llvm/repeat-operand-zero-len.rs b/tests/codegen-llvm/repeat-operand-zero-len.rs
-index b4cec42a07c..d450fead9a4 100644
---- a/tests/codegen-llvm/repeat-operand-zero-len.rs
-+++ b/tests/codegen-llvm/repeat-operand-zero-len.rs
-@@ -1,4 +1,5 @@
- //@ compile-flags: -Copt-level=1 -Cno-prepopulate-passes
-+//@ ignore-riscv64
- 
- // This test is here to hit the `Rvalue::Repeat` case in `codegen_rvalue_operand`.
- // It only applies when the resulting array is a ZST, so the test is written in
-diff --git a/tests/codegen-llvm/simd/extract-insert-dyn.rs b/tests/codegen-llvm/simd/extract-insert-dyn.rs
-index 729f0145314..2b1d1beb86a 100644
---- a/tests/codegen-llvm/simd/extract-insert-dyn.rs
-+++ b/tests/codegen-llvm/simd/extract-insert-dyn.rs
-@@ -1,4 +1,5 @@
- //@compile-flags: -C opt-level=3 -C no-prepopulate-passes
-+//@ ignore-riscv64
- 
- #![feature(
-     core_intrinsics,
-diff --git a/tests/codegen-llvm/transmute-scalar.rs b/tests/codegen-llvm/transmute-scalar.rs
-index ce1b0558b2e..e8fda2cd566 100644
---- a/tests/codegen-llvm/transmute-scalar.rs
-+++ b/tests/codegen-llvm/transmute-scalar.rs
-@@ -1,6 +1,7 @@
- //@ add-core-stubs
- //@ compile-flags: -C opt-level=0 -C no-prepopulate-passes --target=x86_64-unknown-linux-gnu
- //@ needs-llvm-components: x86
-+//@ ignore-riscv64
- 
- #![crate_type = &quot;lib&quot;]
- #![feature(no_core, repr_simd)]
-diff --git a/tests/codegen-llvm/uninhabited-transparent-return-abi.rs b/tests/codegen-llvm/uninhabited-transparent-return-abi.rs
-index face1577c3f..09e0846bad0 100644
---- a/tests/codegen-llvm/uninhabited-transparent-return-abi.rs
-+++ b/tests/codegen-llvm/uninhabited-transparent-return-abi.rs
-@@ -1,4 +1,5 @@
- //@ compile-flags: -Copt-level=3
-+//@ ignore-riscv64
- 
- // See <a class="moz-txt-link-freetext" href="https://github.com/rust-lang/rust/issues/135802">https://github.com/rust-lang/rust/issues/135802</a>
- 
 diff --git a/tests/ui/abi/rust-cold-works-with-rustic-args.rs b/tests/ui/abi/rust-cold-works-with-rustic-args.rs
 index 551485469d3..575db924968 100644
 --- a/tests/ui/abi/rust-cold-works-with-rustic-args.rs
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------f0QBDrYl701FdrarPFcUA1Pv--

