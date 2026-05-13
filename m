Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 019FDCD4F21
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 18:38:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4415.1778697501066295566
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 11:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=SjARqZhR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=959367b50e=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DHwkpr2097779
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 11:38:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=3JwDxlTCN0AZ/EYFZMsMsM
	zXOr2lCnlVfBzNjWYOANU=; b=SjARqZhROF9j/9zAdzg/KZxH7a0jt6Np4DQ9kI
	Z0RpnwFrP031wRBvGhny1w7m21t+HVwDU5OGgEh8ckFhmr3QFJIkzB2ikEqD/PMT
	wOUpvuKL19gduayNHghJlEcoM7c2pZ6F1BoWx0Ei6NqZJ8hXfDl5sDJAM6QsDmxv
	7BkdTPnZ6OhaPguY9My/UXW2PAYrBh4mCbQKzviJ4yVFvdjGQuJsbjnXRRjsWbDd
	nNaFe4m29GNLVhr7kTfJ69P0TS474Q1eGiY8yYNXlKx1xf2Tn3/HdY9xWgcauCyI
	0BBNOeyEsCNF1JAdB4TkLQ4cX7bQZ8UVE8rovtsOp+JPP1sw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013045.outbound.protection.outlook.com [40.107.201.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e4g7g95x7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 13 May 2026 11:38:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F18xTZV88nj7TuSaWHVsFKtx+d1N9cPKQ+sGkQKhbVwqY++e6rvgiG7uLFVSj0Y4qCIk7tC/OXnPNjDX0Iyt1Ff4RdYMNADk6eEhLim3UyGKYiKpBy2w+R2SDyPacQmfQiuemdv2n38+9oU1FpPr32Q/2qdlOBng0bSDPB9HWk1H5JtOCDqwC5dkhGeJeMES+NRN5MIsrfH+VYIbYBg86eWKDa7FLLIbgayKX70fPiCPLnq7cvWW9QD9FzkF01IfzDQBpijcYXCqa8nxwLvX/hEb6eZ2W4stRDsx8NHzv2dLeAv5EWw41nONLUEDuXMy7eUrD9hEE/uRq/tQREAk5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JwDxlTCN0AZ/EYFZMsMsMzXOr2lCnlVfBzNjWYOANU=;
 b=AGuZX7x41/tlZ96O8jGglL3EpgNkPKCgP1awPJiEnC9w88lbjSSCA5M78Dir8TLrOWJiGUmKTh7Tj1VfDbYC4G+huftLyAFVYQQ2T5U+Jr7gZ6tBE7VdBj3HNiNB1jv2qVbbJKk2DaFuTeMMLccxbcACof6fZLlvhdBOjpWTc9kp5w9Q2WPl5P5s+eHo+BdSa0HOK3Mr/eKnwNR/P1rYz0FJO7CT7HqWmshaUNi7LZavplQeNt9O6waLtfNyb8lTpfPGdXXYpR+FjresPBMi7RdfHEcQD1zuLwdOrftgXp7Lbfay4ybK71z+XZmp7IPbK5KtaKFp3+xAomKKxWNHrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by BY1PR11MB8079.namprd11.prod.outlook.com (2603:10b6:a03:52e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 18:38:15 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%4]) with mapi id 15.20.9891.021; Wed, 13 May 2026
 18:38:15 +0000
Content-Type: multipart/alternative;
 boundary="------------molafOuImQsHO0QLGjBCZY3T"
Message-ID: <57ede2f9-f67b-4ad2-8b80-5f0b1b73f0be@windriver.com>
Date: Wed, 13 May 2026 14:38:09 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: Upgrade 1.94.1 -> 1.95.0
To: Deepesh.Varatharajan@windriver.com,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com,
        Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20260513084823.2871606-1-Deepesh.Varatharajan@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20260513084823.2871606-1-Deepesh.Varatharajan@windriver.com>
X-ClientProxiedBy: FR3P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::14) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|BY1PR11MB8079:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f4804e5-3e74-48a5-a1d8-08deb11ecb5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|8096899003|13003099007|18002099003|56012099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info: 
	lwL+aiK6IEnQbUvO6UL2jbGENGTo9R9WpFVuQHEg8E9pKAr1I183lQP7LBtqsHdYnspKZ2Iy1rXUjxAzhbsnj4zAR13I7z3qU+7ODlKGyei79gfaIpmOhbsffK4iMWXA7YHrpeD5UZ89xfjuxJWMeeNdmMkM+aCxwaWFifddi+inZ4NS8T/TdT6dCrkNJ8B9k9Ewpaa/cq70SMpfKbVkgfM+8OJehXsVNsuCBpjYw26hyxFF9p7MCXyUJbrr7WD4SqESllMi/LiQytI5Q0epiHZF68GNDb7V6/jOWHWWWOa5oLo4SDBEs7hi9h3DIkec8//BiaV6R8g4NtkqQwqCLxwx1K5ITDJ7YUdnyCP//yM6RqAv1k4ypAKCUrGd3F6Wi6IzT0XsMCv8kk6FFP+sVhbI7Ez8A8VATwLXBKXBwt+L1pg3rRLWbKm4ylY3eVkagOFLstIv/kwyBZjSj3T9wGBRIMWy9rsX/OB/+tX6+jY+6WjP+PkNtWmt7XDbzzGgEwH1cfs5AKb/nnprkzjzC/gmU6o8nju40rf6diqPmsQT/+XM0ahux27LdH/MsKnCePJIy/iIRwuKD6/Cm6JGyhd/QUG0qTP0m6lkAujXMumc74aRyCKiZqGtYSQuc+xp
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(13003099007)(18002099003)(56012099003)(22082099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dVIxQ3FmckxpbzRQOG1sRFdPWm40NWhuU09xMUR2R0R3OXlMWjZPMXNlL0g1?=
 =?utf-8?B?UGMrVXRKWXA0WE9IbnlYMHhkU0cvcURGNU5tanJob1ZsUzdJL2l2c2E5bW5l?=
 =?utf-8?B?RVM4L0hvUHVPMmxOZTR3VDFPZGJ6Q3pvMmVCSEQ3WG5zZ0xHWllxYjVVTXBw?=
 =?utf-8?B?dTl4ZHZuM3hQZE5kMzZNTkszYjVXamRsWGNOaUtRbDRncTVsT2hteGU4OHlB?=
 =?utf-8?B?Tk5YalJsRzNCamNTYWh2bXlOY1kwR0tlNTFETnYrQy92Mm44NEQ1ZGhQSUp2?=
 =?utf-8?B?R1N3bEdoQ0p2dFNFeHdGYUxOR3I4dTh1cXZBWEVjeHd1WEdyV3VrV01MbTE1?=
 =?utf-8?B?MzdwMm8zNTQ2VllYQkRZclV3NlFFcm83WTY5VmVPaE9qNXEyOE51emkwY0Rw?=
 =?utf-8?B?ZHBiZXV4MEM4WkNiazFjMXRrYy8zRVZkMlNYNXBxV0p0N3VTbHhIc0Y0d0F3?=
 =?utf-8?B?VDl2QWlIMlZsREtRM2l1bThxT1k0NXJ2U3ZPTEp0QThzdFZlVVoyYjlvOWFh?=
 =?utf-8?B?a2lpUzBwVG00VmU5bDRYREtXWmhUR2NMVWs1SVE4bWRUNnp2VlNmR282c0ZY?=
 =?utf-8?B?WDVuWDluYVU2VXhud3JjUmJ1UUQvMStoTTloOEluZFlJWWpoYzdHSjJCTTJW?=
 =?utf-8?B?MjFnUkZKSEt2d0FzWmgzbWdwTFdYRFZNanhXdXdUblp1Q0kvdlRSaXAzRzNj?=
 =?utf-8?B?dUJJREFpMFZ6N2tzUWtnQzloYmFDdktIRG9uL0d5QVlZeE4vTG00b1RmRkU3?=
 =?utf-8?B?VUxTWU5uYXRGVGJMa1BvczBnNE5zdkxNZjZINkRTWDlQR0lkUVNqVEo1c1J4?=
 =?utf-8?B?OGlLZlJTSDJzQ2piZjJpOXlEbEQwdkNBSFJDRVlraFdaZG9yRkVmTDg2K2lr?=
 =?utf-8?B?SVE4THN1TmNjbGdhY0UvU0NCTXhiSVRCQ3Izekd4Y0FnQlYyWUhWOEhJT2Uw?=
 =?utf-8?B?SXZLT0paL3Y5aldzVnl0d1luYjVJRFpnQng0VWNib3pSVjAxU1l1RDQvWFB4?=
 =?utf-8?B?Y1dEOVJkbXM1SFlNTHl3cjFCODJyRGEydnBHa1FiTlBNWnJIYUNrdForTW0r?=
 =?utf-8?B?L3htQW8rNEExZ1RQVHV4dW1FZ1Z3MUJ6cmIrQ1JSeXBYVlloY2lYa20xVG5E?=
 =?utf-8?B?V2MxYkVpME9vR0VvOWtoVHV6bFlrYlJvQWdZMVpLWnlFRTlFN2VzZ29HY2U1?=
 =?utf-8?B?RDYydCswd2IyQldYdVlJZmNaZkIvdUlnMGNXOVdGQlZEOUhmRE9tUTBmZGM2?=
 =?utf-8?B?T3pqOHU4NElNV2RBbUxMMDUvNlZrZnhpN3kxL1BQUkxxUzFYVXoxeFlydVM3?=
 =?utf-8?B?NXQ2TDVyL2crSVdkM3ZTbEJVY1ZQNHhWZkZuY2VzYWVJbG9pS04yVkhtdkdu?=
 =?utf-8?B?V0pobzhodW5LakhxTldGL3o0bFhMVU1ncCtxR3NhYi9Ba3JZUVdBajFGdHIr?=
 =?utf-8?B?WklSOUVaY1RST0wvc1UwSFMwclY2bEpjbEg1bW1HRzUrSWMya0RSRU9mTU05?=
 =?utf-8?B?N2I5dGw2cFNLOFFWM1lvQXhwRlprSUZUeExGWm1sM0U2Q0FyK0hLQnFmMSs2?=
 =?utf-8?B?M0ErWkFKUlV1b3UzZVN3Z3QweVB6L1NWVEg0VUU4T3F2bU1TQUhTcFIzTWFs?=
 =?utf-8?B?Q2RNb3NJSGZxTzJuY3FsNjdua3BmYmhVTkpDSXJRVzB4QVJ3R0F3cnR4MGQ5?=
 =?utf-8?B?eXk4cFBoUkJRSWJQQkp2Z05WVlB2cUlaQlkybXoyS2xMZmdZNVJ5VVdPR3Zv?=
 =?utf-8?B?Y1ZNVlRuekltOHNHejlJMWl6ZlhOUGRzUDBPRDRsSngwRC9nR1JxKzNQYWN0?=
 =?utf-8?B?NkhLTkFET0lQZUxVcXNDYXlBMGF6TGFBeXZyRkxZQTVtNk44cmI2MGEzLy9Z?=
 =?utf-8?B?U3k5cFp1NTllbnp4ais5dEZXUnNTV3M4bmNEclZ5eXlDMkNKMlF0ckFYcFdk?=
 =?utf-8?B?MjdjRDFMWEh3c3JGZDNCNGZEUVdBNkxMNW1CZVpEdEx1WE5rbUhsY3VJWWs0?=
 =?utf-8?B?LzFrUVZHSW53cjBsVWJ0OWQ2aThkbVhBZmRZZzU5cEhzWVFtVVBYRm9qNUZG?=
 =?utf-8?B?VDhjM1k2OVVxcVptWmczRmVGemhRMnE1Ykxjd0ZuWlcrRUN6MU04WHRNQURT?=
 =?utf-8?B?bFNCUzJ3bTlCTGVmYytkS1ZUaDNKYUVVV1R2NFpZRzBGaGgwSGZ4Mmk0MDlw?=
 =?utf-8?B?TXZBUTA3UkdOUktncXlsL3hzKzkzSjRpODBNUkRrZmpMdUUySTBFU3E5ZnhF?=
 =?utf-8?B?ZlR4VFY1WVpTMDBxeno2TEExTCtpbkNrWE1PS1RPRGN4NHRuQThidnlEWGFV?=
 =?utf-8?B?Vnl6N1VKM1FKbnlOdG5Ha251S3FMeXZUU3RKdGkyK21MZ1ZsY1MxRG1sYnp2?=
 =?utf-8?Q?I565oKS9DOz3N/cw=3D?=
X-Exchange-RoutingPolicyChecked: 
	jc1Oz7Qpuy5EnZqFnvvgmpUQH2TkS1S7x0/Rc+czLZqN0hpZkgu9DmGSbFCxQHMrZ389LMMo0lPNjtU/TswRyIOkWxbtzZnjKtybZRZOiDfF+bhp8xBkGPpQ4W5zHgpPHiSgK/reCLuioBRNCRxZMSntaW0QWviN9Sq3ms/Im0Uc3yL8ok2HsONpvTKOIcZJwHyodChPS2MFO+J4Xn1uQtnmE4B3aazlYMqNa1K4PaCVolAoLzo9P2QIYPGXSehjRhT0r+wdDBYOS6O/yQnS6Joh2hoFDZvVJ7CwGk2DyJ+YzJTZHRqZnPyAIZHZsTugSI+/LZz0v2kT2FUGSBoD4g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f4804e5-3e74-48a5-a1d8-08deb11ecb5d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 18:38:15.3686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n7Exl9Gos1XtylCUWTU1kEAtOfMwUJMPZev9W1yV/+DQvTckAx7/9I+D980gd5CgYgCMxnB32kePIOlU4bOW8HN0L0AHx0KlfZA4iwcUZ10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8079
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NCBTYWx0ZWRfX/8rkjiPwbX/J
 Nds51ipuK0nFZ+3qitfBqak2gUj9aBOxzhtJAM6NhVT4uMN77qu3+eIpN3WT0Lsz6s4I9SddFBM
 nBi3MKsEWDeKzZKs1bsmL8FHdGOOBvhDzOvXknejwkcRBWQmPHBC+g4oB3o646/sWrkctI7uySc
 sck/zUIuXGJmKR6Wv2ODntHqwgT0Pc3it7fIyMBIkB3TmYskraNQeFG1IAwXHsSj6a8YNro897d
 kPxrQkaar6Q+h29tYx5kBoCoWrQ2FGcUU2aGMtir5NHDIVVnNzOVjJfkwQPp+je0tj75eH76hEg
 9sOlQAJpf619x378ZfaADiLNKP6NcdXQGhp3SBvqWmAnr3rp0iIaNhT1MwCkLvjrB6rJueRT2VB
 4xI36or7TYWlXNNP/a0v7mLhysxql0MkOwJSuaec6o3ARZNK8CVz2DFUxL1cO31NoBaDzRP1Utp
 cEu9an8pA/2RuPUDGkQ==
X-Proofpoint-ORIG-GUID: MLUeH_gxv2fAdOB2oByKn7eln901b6_K
X-Proofpoint-GUID: CQEYIBQvgDQy7V_dtaDaNKAJdFIsgQPY
X-Authority-Analysis: v=2.4 cv=Q7jiJY2a c=1 sm=1 tr=0 ts=6a04c51c cx=c_pps
 a=IhFJ2QRitvxj7yHj5jvJkw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=j57RdskLAAAA:20
 a=ei4SEBeUAAAA:8 a=NEAV23lmAAAA:8 a=9VGNSM-4AAAA:8 a=t7CeM3EgAAAA:8
 a=84Eu3agLxowMKgEFgRQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rf6Woqn4NWIIvKTc3UEA:9 a=S_2UvHVDyHdCK-9q:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=8zIOOLb7Ym0NljyPXbuS:22 a=wOXjnWV-IV9o3JbbGgx_:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130184
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 18:38:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237001

--------------molafOuImQsHO0QLGjBCZY3T
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64DHwkpr2097779


Hi Deepesh,

On 2026-05-13 04:48, Deepesh.Varatharajan@windriver.com wrote:
> From: Deepesh Varatharajan<Deepesh.Varatharajan@windriver.com>
>
> Rust Changes:
> https://github.com/rust-lang/rust/releases/tag/1.95.0
>
> Cargo Changes:
> https://doc.rust-lang.org/nightly/cargo/CHANGELOG.html#cargo-195-2026-0=
4-16
>
> Drop merged patches:
> 0001-Adjust-loongarch-assembly-test.patch
> 0001-Fix-flaky-assertions-in-oneshot-tests.patch
> 0001-Update-amdgpu-data-layout.patch
>
> Updated patches:
> 0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch
> rust-oe-selftest.patch
>
> New patch:
> 0002-Fix-rust-build-failure-with-unstable-options.patch
> https://github.com/rust-lang/rust/issues/155963

Overall, I think we should merge this to just keep pace with Rust release=
s
as Richard was saying. The next scheduled release is:
1.96.0 <https://releases.rs/docs/1.96.0> (28 May, 2026, 15 days left)=20
https://releases.rs/

Your patch clearly works but I wonder if it would be better to just rever=
t
the upstream commit (s) that forced us to use: -Zunstable-option

I found this commit but maybe there are more that are required.

=E2=9D=AF git log -1 6c4c4384e8f6
commit 6c4c4384e8f66476214d56b82313c39472c8215e
Author: David Wood <david@davidtw.co>
Date:=C2=A0 =C2=A0Fri Dec 19 06:37:22 2025

 =C2=A0 =C2=A0 destabilise target-spec-json


Think about my comment, and please reply here and if you like, send a v2
with an updated commit log explaining why you did a patch rather than a=20
revert.


>
> Selftest Changes:
> Skip two failing tests
> src/librustdoc
> src/tools/rustdoc
> https://github.com/rust-lang/rust/pull/153409
>
> Excluded tests:
> +--------+----------+---------+
> | Before  |  After  | Skipped |
> +---------+---------+---------+
> |   37    |   39    |   +2    |
> +--------+----------+---------+
>
> Test results:
>
> rust v1.95.0
> +-------------+---------+---------+
> | Machine     | Passed  | Skipped |
> +-------------+---------+---------+
> | qemux86-64  |  22187  |   689   |
> | qemux86     |  21929  |   947   |
> | qemuarm64   |  21994  |   882   |
> | qemuarm     |  21910  |   966   |
> | qemuriscv64 |  21955  |   921   |
> +-------------+---------+---------+
>
> Test results difference (1.95.0 - 1.94.1):
>
> +-------------+--------+---------+
> | Machine     | Passed | Skipped |
> +-------------+--------+---------+
> | qemux86-64  |  +276  |   +29   |
> | qemux86     |  +271  |   +34   |
> | qemuarm64   |  +271  |   +34   |
> | qemuarm     |  +271  |   +34   |
> | qemuriscv64 |  +270  |   +35   |
> +-------------+--------+---------+

More tests passing is good but skipping more tests isn't good.
For now, it's okay but we'll have to work on reducing the skipped tests.

../Randy


>
> Signed-off-by: Deepesh Varatharajan<Deepesh.Varatharajan@windriver.com>
> ---
>   meta/conf/distro/include/tcmode-default.inc   |   2 +-
>   meta/lib/oeqa/selftest/cases/rust.py          |   2 +-
>   .../rust/{cargo_1.94.1.bb =3D> cargo_1.95.0.bb} |   0
>   .../0001-Adjust-loongarch-assembly-test.patch |  66 -----------
>   ...ix-flaky-assertions-in-oneshot-tests.patch |  72 ------------
>   .../0001-Update-amdgpu-data-layout.patch      |  44 --------
>   ...teps-tool.rs-switch-off-lto-for-rust.patch |   4 +-
>   ...-build-failure-with-unstable-options.patch |  57 ++++++++++
>   .../rust/files/rust-oe-selftest.patch         |  20 +++-
>   ...ibstd-rs_1.94.1.bb =3D> libstd-rs_1.95.0.bb} |   0
>   ....94.1.bb =3D> rust-cross-canadian_1.95.0.bb} |   0
>   meta/recipes-devtools/rust/rust-snapshot.inc  | 104 +++++++++--------=
-
>   meta/recipes-devtools/rust/rust-source.inc    |   6 +-
>   .../rust/{rust_1.94.1.bb =3D> rust_1.95.0.bb}   |   0
>   14 files changed, 129 insertions(+), 248 deletions(-)
>   rename meta/recipes-devtools/rust/{cargo_1.94.1.bb =3D> cargo_1.95.0.=
bb} (100%)
>   delete mode 100644 meta/recipes-devtools/rust/files/0001-Adjust-loong=
arch-assembly-test.patch
>   delete mode 100644 meta/recipes-devtools/rust/files/0001-Fix-flaky-as=
sertions-in-oneshot-tests.patch
>   delete mode 100644 meta/recipes-devtools/rust/files/0001-Update-amdgp=
u-data-layout.patch
>   create mode 100644 meta/recipes-devtools/rust/files/0002-Fix-rust-bui=
ld-failure-with-unstable-options.patch
>   rename meta/recipes-devtools/rust/{libstd-rs_1.94.1.bb =3D> libstd-rs=
_1.95.0.bb} (100%)
>   rename meta/recipes-devtools/rust/{rust-cross-canadian_1.94.1.bb =3D>=
 rust-cross-canadian_1.95.0.bb} (100%)
>   rename meta/recipes-devtools/rust/{rust_1.94.1.bb =3D> rust_1.95.0.bb=
} (100%)
 >< snip >< snip ><


--=20
# Randy MacLeod
# Wind River Linux

--------------molafOuImQsHO0QLGjBCZY3T
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64DHwkpr2097779

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <head>

   =20
  </head>
  <body>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">Hi Deepesh,</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 2026-05-13 04:48,
      <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:Deepesh.Varath=
arajan@windriver.com">Deepesh.Varatharajan@windriver.com</a> wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20260513084823.2871606-1-Deepes=
h.Varatharajan@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">From: Deepesh Varatharajan <=
a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Deepesh.Varatharajan@win=
driver.com">&lt;Deepesh.Varatharajan@windriver.com&gt;</a>

Rust Changes:
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-lang/r=
ust/releases/tag/1.95.0">https://github.com/rust-lang/rust/releases/tag/1=
.95.0</a>

Cargo Changes:
<a class=3D"moz-txt-link-freetext" href=3D"https://doc.rust-lang.org/nigh=
tly/cargo/CHANGELOG.html#cargo-195-2026-04-16">https://doc.rust-lang.org/=
nightly/cargo/CHANGELOG.html#cargo-195-2026-04-16</a>

Drop merged patches:
0001-Adjust-loongarch-assembly-test.patch
0001-Fix-flaky-assertions-in-oneshot-tests.patch
0001-Update-amdgpu-data-layout.patch

Updated patches:
0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch
rust-oe-selftest.patch

New patch:
0002-Fix-rust-build-failure-with-unstable-options.patch
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-lang/r=
ust/issues/155963">https://github.com/rust-lang/rust/issues/155963</a></p=
re>
    </blockquote>
    <p>Overall, I think we should merge this to just keep pace with Rust
      releases<br>
      as Richard was saying. The next scheduled release is:<br>
      &nbsp; &nbsp;<a href=3D"https://releases.rs/docs/1.96.0">1.96.0</a>=
 (28 May,
      2026, 15 days left)&nbsp; <a class=3D"moz-txt-link-freetext" href=3D=
"https://releases.rs/">https://releases.rs/</a><br>
      <br>
      Your patch clearly works but I wonder if it would be better to
      just revert<br>
      the upstream commit (s) that forced us to use: -Zunstable-option<br=
>
      <br>
      I found this commit but maybe there are more that are required.<br>
      <br>
      =E2=9D=AF git log -1 6c4c4384e8f6<br>
      commit 6c4c4384e8f66476214d56b82313c39472c8215e<br>
      Author: David Wood <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:david@davidtw.co">&lt;david@davidtw.co&gt;</a><br>
      Date:&nbsp; &nbsp;Fri Dec 19 06:37:22 2025<br>
      <br>
      &nbsp; &nbsp; destabilise target-spec-json</p>
    <p><br>
      Think about my comment, and please reply here and if you like,
      send a v2<br>
      with an updated commit log explaining why you did a patch rather
      than a revert.<br>
      <br>
      <br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20260513084823.2871606-1-Deepes=
h.Varatharajan@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

Selftest Changes:
Skip two failing tests
src/librustdoc
src/tools/rustdoc
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-lang/r=
ust/pull/153409">https://github.com/rust-lang/rust/pull/153409</a>

Excluded tests:
+--------+----------+---------+
| Before  |  After  | Skipped |
+---------+---------+---------+
|   37    |   39    |   +2    |
+--------+----------+---------+

Test results:

rust v1.95.0
+-------------+---------+---------+
| Machine     | Passed  | Skipped |
+-------------+---------+---------+
| qemux86-64  |  22187  |   689   |
| qemux86     |  21929  |   947   |
| qemuarm64   |  21994  |   882   |
| qemuarm     |  21910  |   966   |
| qemuriscv64 |  21955  |   921   |
+-------------+---------+---------+

Test results difference (1.95.0 - 1.94.1):

+-------------+--------+---------+
| Machine     | Passed | Skipped |
+-------------+--------+---------+
| qemux86-64  |  +276  |   +29   |
| qemux86     |  +271  |   +34   |
| qemuarm64   |  +271  |   +34   |
| qemuarm     |  +271  |   +34   |
| qemuriscv64 |  +270  |   +35   |
+-------------+--------+---------+</pre>
    </blockquote>
    <p>More tests passing is good but skipping more tests isn't good.<br>
      For now, it's okay but we'll have to work on reducing the skipped
      tests.</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20260513084823.2871606-1-Deepes=
h.Varatharajan@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

Signed-off-by: Deepesh Varatharajan <a class=3D"moz-txt-link-rfc2396E" hr=
ef=3D"mailto:Deepesh.Varatharajan@windriver.com">&lt;Deepesh.Varatharajan=
@windriver.com&gt;</a>
---
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 meta/lib/oeqa/selftest/cases/rust.py          |   2 +-
 .../rust/{cargo_1.94.1.bb =3D&gt; cargo_1.95.0.bb} |   0
 .../0001-Adjust-loongarch-assembly-test.patch |  66 -----------
 ...ix-flaky-assertions-in-oneshot-tests.patch |  72 ------------
 .../0001-Update-amdgpu-data-layout.patch      |  44 --------
 ...teps-tool.rs-switch-off-lto-for-rust.patch |   4 +-
 ...-build-failure-with-unstable-options.patch |  57 ++++++++++
 .../rust/files/rust-oe-selftest.patch         |  20 +++-
 ...ibstd-rs_1.94.1.bb =3D&gt; libstd-rs_1.95.0.bb} |   0
 ....94.1.bb =3D&gt; rust-cross-canadian_1.95.0.bb} |   0
 meta/recipes-devtools/rust/rust-snapshot.inc  | 104 +++++++++---------
 meta/recipes-devtools/rust/rust-source.inc    |   6 +-
 .../rust/{rust_1.94.1.bb =3D&gt; rust_1.95.0.bb}   |   0
 14 files changed, 129 insertions(+), 248 deletions(-)
 rename meta/recipes-devtools/rust/{cargo_1.94.1.bb =3D&gt; cargo_1.95.0.=
bb} (100%)
 delete mode 100644 meta/recipes-devtools/rust/files/0001-Adjust-loongarc=
h-assembly-test.patch
 delete mode 100644 meta/recipes-devtools/rust/files/0001-Fix-flaky-asser=
tions-in-oneshot-tests.patch
 delete mode 100644 meta/recipes-devtools/rust/files/0001-Update-amdgpu-d=
ata-layout.patch
 create mode 100644 meta/recipes-devtools/rust/files/0002-Fix-rust-build-=
failure-with-unstable-options.patch
 rename meta/recipes-devtools/rust/{libstd-rs_1.94.1.bb =3D&gt; libstd-rs=
_1.95.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.94.1.bb =3D&gt;=
 rust-cross-canadian_1.95.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.94.1.bb =3D&gt; rust_1.95.0.bb=
} (100%)
</pre>
    </blockquote>
    &gt;&lt; snip &gt;&lt; snip &gt;&lt;
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------molafOuImQsHO0QLGjBCZY3T--

