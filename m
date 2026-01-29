Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2FC8D6B09B
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 16:39:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19181.1769704775454217932
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 08:39:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=o8vYRLKm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=64894db884=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T7U8k92877601
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 16:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=A8Y1i14fvK0MGH8e/cV/+n2WYjheAEwIUwrWHozNaqg=; b=
	o8vYRLKmyiQ5RbGaXAjNNs0xbMJjSGjpqaIwKatv1OjiWw9RmTJmt9mVplsG40C9
	BgdGJ06SUzx+FA3WBg2EQM8cDOs9n4sKn+9nm3FCoSzRxlAcg59206s2p/o1OKtd
	lI/n9EATCKqG/OfGfwoN1wJT19jXvYRdd7SZF53BsMXGDtAMHedpFSzg+VcfdLGS
	T+i5yGUE7ua0V0ZmmQUX22qNOpQEDpXuJ/SY/wpK8K6mgfId4ftzBesu8i0qCgDp
	Cn/NQGqeQhTGU6v2V6W4Z1NTq/SIKlVKmSUGsgE3UNesDX6Pd0jt2swPWMHQzsLD
	HKYj8utR9c3TaxQ2Ab77qg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010028.outbound.protection.outlook.com [52.101.46.28])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bywwjgsvt-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Jan 2026 16:39:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zLApVnU/RvXx9qOQT+6mr1ixiKe7vKe1W/r2QoFvf07kikJzc1tA4qob/8JytY7GcPQ9ou6mfpYiPTT77NC/e5LetbLylNHiIHuEZPbIF2KQvowBIq16C23QkXy5dcwDeDllfH9DCq4ncMATalJdScpkOu6ajJckmcI+n7H4maxegqqUuA0kmTCbk5DDN5zQi4otnJVflFpXX/2ThSTPvVkJbrbNOsZvhOtKpKnIE9E66oUtVrDpGk2DylJQmtibMTISXZVNrgxXpRWfyLuMdd4Y5+VX0k1bdMT5EPgrKWbQxUiNli1orurN2Vcahz3plp0aZ5LOhTQuUYNa2xNZ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A8Y1i14fvK0MGH8e/cV/+n2WYjheAEwIUwrWHozNaqg=;
 b=EZOrTXyYEooudH3epiMPU/AEuw90XfNCyvtM071A+Fhdn0VD6EQ7RIrcKRwxOF0DWfcc+NkcDHA8tIYy/Ba3xiGwBiAb93nHlHMui3u3fOX6GiFHL1PqhqYa1zE3nOoPh7ewhv2EMojh7UrtVjkMlX7EKQr7WkGTpqvGosp0fwyT2oVMkeuDCEGjrA4Mo2wHrx8pNxQkKcF2tLXTOyF7A7efd7go60t2UHGeK6y7J3d8281j2+n2+6XAe4lSx5bc1AP/YCx7ZCAIAJD9+LQq0zijUa8DOoupks9VbPmQB+gppxFfPtT0EpHQ2voXnzzu3A5li+E9/QVS6RNjIBDCUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MW4PR11MB5869.namprd11.prod.outlook.com (2603:10b6:303:168::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 16:39:28 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 16:39:28 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        alistair.francis@wdc.com, bruce.ashfield@gmail.com,
        yoann.congal@smile.fr, elmehdi.younes@smile.fr,
        richard.purdie@linuxfoundation.org
Subject: [PATCH v5 02/15] rust: install Rust library sources for 'make rustavailable' support
Date: Thu, 29 Jan 2026 08:38:57 -0800
Message-ID: <20260129163910.2612040-3-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
References: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0100.namprd05.prod.outlook.com
 (2603:10b6:a03:334::15) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MW4PR11MB5869:EE_
X-MS-Office365-Filtering-Correlation-Id: 27d7554b-f8d4-49a0-6e2f-08de5f54f8a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sxjwNyoTS6VyLLEjyxPNlzf3mf1cx4J5cupOYBIQNNAIOLyj261j4wKGK3Jt?=
 =?us-ascii?Q?Tj81arpgfIsvEYgeb8043rrsM3XAFBcV34rXwco0Wt6imCEVgBOJJl/2M7YE?=
 =?us-ascii?Q?S9CEXxjcXfd8xJwQ/5ytA4A9pLSorAPN+m/rdWoYi8ABcMk+i8f2O7Ra6GiS?=
 =?us-ascii?Q?Pbwdk6YgXC6NtIkn0pJoBT2MyK4NfGHQEmAOKvn1riTmbP1VlyIdFYmu2gxG?=
 =?us-ascii?Q?qHzlWQEHfMczUTVjBh72IkyppWsIqJ9Hdq5Cn77o6uMDZhxBMFPW5UEqydvM?=
 =?us-ascii?Q?Yto/R5ia7XLH0IrtIRvM2kJmS2otni/SA/boudVtwqsHGitH8NPS5cV0YnJy?=
 =?us-ascii?Q?iCQjFrVfG9gXBP0DeWOoDI/X3fKGO3TCWbK+woYBMV4o8X7Soc52Wu/J/jiE?=
 =?us-ascii?Q?/LYPr4l/hcttVWS/1RnOkEIdHs3qwfFAqJMDLoMha1eAhxgTT80mRyapdUdA?=
 =?us-ascii?Q?LVSCtWrnuYaMumXkEpWjKGd5y6YqW4anPE1qqFW4MJJ66Y4za06ECJQkLm5+?=
 =?us-ascii?Q?oo/NBYsbz2X/VYO45MwndZOBkTPWTZi73l9xDw+ZWECTKHuonrVbQXuMi7aa?=
 =?us-ascii?Q?FXI+H/fROyqIA5odCsCw6+B+Lhs80G/KmkqyfH2K2kdlhdygzBrjMTuWdk2P?=
 =?us-ascii?Q?QO5CALy5S10Qr0090r5xxRfkwalOv3pWibjsCTvTWOScX/RltY9CgRRI/1Rm?=
 =?us-ascii?Q?IHK5o4mOsUroY2uqm2gi0jVuXIjnsYBGb2hlK4Wo3/KPgAYYr/1ABqNpb2HP?=
 =?us-ascii?Q?OMELl4PPTaW2MfclBl8SCdcGHYrCorbLkZZQmlwmxB3a1YKvD5zgXCi0ujE6?=
 =?us-ascii?Q?i7Zu6AJ3JUULNvVlXf97SeP2Ke+wY3zpIDXj4nA+97sF1JKZsbiAVNV7VEqc?=
 =?us-ascii?Q?3AE4vwZFKTttQfQsi8K7pChVzG8li9Znes42QcsuTTruo63Qj/wJ0BhYNqpD?=
 =?us-ascii?Q?oWcblX0mUSqMkTD0FvArVlW1eMQhcbeJjpZqcYxZWyp1bsD2OqZadGRu7h42?=
 =?us-ascii?Q?tDgwEqZVFLhdc/5wp6GZSv0W5V3TX1CvD6inmJxLde6INiDHJUS729pc1XHY?=
 =?us-ascii?Q?nVhjizC16JYuz6QGfl/rOtEBcBC7XrrlIQn4rDP6/AwGeUzGfJI2upjlNKWr?=
 =?us-ascii?Q?HXBGcfwIJlqCcdbZbfFqG1d3tN9busIFaEPDUZCpt2BL2VD3CYb3pvVDn3zP?=
 =?us-ascii?Q?P2u0D3TEvWUIlkc32h6bItLS/2agWg1KPKLO3Yq8qjMb2u29/0YmmqYnUx84?=
 =?us-ascii?Q?8PomAuu57xAF7msCp4Yd0PlQN7GL+swwGoEBuPOzooTnDhRE5flbzZG50JRN?=
 =?us-ascii?Q?ra7f1lXlbz4QUsZXi3EW+iTJm7R50D8bttPCbCOWNmUuiu/FugnOZGGjXYbs?=
 =?us-ascii?Q?pU9X1Cgw2PObrRk/mS9a9yopDt6KDRxoRaS0UgD15CgAslFiyTQMKb5atbhK?=
 =?us-ascii?Q?HpR5UE5WP7FltmRn41HtSNQQXXnR2S189j8D1NNFUcB6im4VKHfteiCiSPNf?=
 =?us-ascii?Q?smoy5f0898XhJwQK0xu8a8mBZ4SjdsJPbcCfbjg7husW1eYDwL8cuKFaEp6j?=
 =?us-ascii?Q?Dlews23fAPhCFSpdwSYJJ+KMAH2hk9WunPG4m3cgLfKpzPW4/x+GxQcwJXCX?=
 =?us-ascii?Q?OZIS4Xv4R4020qBB69so8/g=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Y835dHSu3Gvt1Xwgj9NonfZ7q5STdL4FmnaAMk1id0jENA5WIogGc/VHEL30?=
 =?us-ascii?Q?WnUrB0GmPymrPj3YQ9nyShMIGe//jOuRwPVxYpEd8f4QmmBUrmm8AUp7LH7g?=
 =?us-ascii?Q?ieIhl1paN+XVFqKkutlV+imoYNcnda3TUUBeqfRdTGDFLk9e6B/6HMLHGKWn?=
 =?us-ascii?Q?2maZ0f1IEjXelV8BvxbIuT5RD3y9TB4Au64UfCQnOtiIvH1Yn6zozZwDxg+k?=
 =?us-ascii?Q?UEkzkGT4kC0Zx4P0HRHmhQNeQA6VeLD3lm1OO5h2OFmTvaP6B/oGcOdjDKtE?=
 =?us-ascii?Q?PUvcZk1ukDk2Q6rByFJ2OWO3l0RWvL52WJ07DEhYCjioJXK9A//dQHMMnOUW?=
 =?us-ascii?Q?6Px8YsUBozeOb+tClvhG4aFVaewYVUoyQLxRu68avRwTrO6swezHQQaXMUz/?=
 =?us-ascii?Q?cjktVQGAXNUpYBKWIfy09ocOU1CKXNIJtShyvLQd+TCB0+duDl6bRzaP342w?=
 =?us-ascii?Q?CwdAhknkk+vuqMWhkkJpdC7pDsM4ttcAFwAH+DvF2VlZvLmxQAAWsUn7n0D/?=
 =?us-ascii?Q?NG1QsmNC7RCno/Ilb+9nLAT/4+KZ0yfTG8IwFElg+WZzmLskJ1XAGPdvv+FN?=
 =?us-ascii?Q?Xs8I5kaMgGUHYQWvdS2DDG27zKdGzmD/oIJHq7rm9VpagleFdW9UyiEzYI/c?=
 =?us-ascii?Q?vzsGTqmTcyw5ZcNpGb8XpZrmqtMC9hTOHHxKRhOE9VV1c1MEoOhfKI8tf66N?=
 =?us-ascii?Q?7GZVHdlHO+nc4zv/CFFA7JC8L+ths5cjPLG26NCiGee68CeGw1JO0xIKp59j?=
 =?us-ascii?Q?ohuLt/4Jzh4++KfEnx1I+TszFHSW/d0zrusyQln4qJWli8PyoMxVbrEkP2uF?=
 =?us-ascii?Q?Lf5bWrI0GjAlAteHyxh2NBsaEF1K0e1dz/zM7/w7VfIHACElstqUZAC1bub+?=
 =?us-ascii?Q?Pv/QS2YLuw7htQrxFNEkeE+UoFAMLravkU7oaPBWiPCY0eouq9E9bT13Fe9e?=
 =?us-ascii?Q?RyTruY2PEZEvQ1OdL+uE7auseU0AlhcinbMiIVcpUgPVyza6gw7gmM1bUxMN?=
 =?us-ascii?Q?EBNFI+Ovm1Em8tHjFULU0J8G/rZpqYqO3ICywMjYuc+s6TN/sCmxZ2bWMIYs?=
 =?us-ascii?Q?h9SdAU9TG9IiN0PMCuBLAln5Ksit1QZSiu7HuL4KB5zS4Kw6SM0lJBFZnNop?=
 =?us-ascii?Q?nzLojLK4vVWD7mGThd1uRPqbLHBq2tFcDwPvf5kSU2Cfm2xK6Ow1ZA6vjM4M?=
 =?us-ascii?Q?QZMjqhw5WoNkCRBB8lmvwYOJPVq1gyHdLt3zVk6EXXYCtbCjwDOplnmB06hG?=
 =?us-ascii?Q?8C4/1w/Xnt682e3h1qB2U9TBGBwb4VTIVVQNFGx5tEy9W16/dPs+rDLeopDh?=
 =?us-ascii?Q?ktofcaVO72Q3HG+hcdJeLWbJAyq98GvxTTUfGJqUXHLQZsJlsI8Wvoki+RBl?=
 =?us-ascii?Q?vzhxrmIrNo2hkh66a4OcttXv7htJcPuz8wq3tVrkRoR2Ms5eF199QBd+pbl/?=
 =?us-ascii?Q?C1vZzVXpZfSc9VjB2T4l9d40e1kwct5LWQNuLcOpUn1wZ9oB/vDuVp9vq3DJ?=
 =?us-ascii?Q?XoA5UYhE25vyA9LhAhAscnc6vfo6pWmgGHvfNW5mWPyBhG78t1HYLYsn/zVy?=
 =?us-ascii?Q?hX9LMPHzarETs4NKvWeTifZD9EG7VNWzS0yc5ByD4OKy/aIaaerckAnN6/56?=
 =?us-ascii?Q?p31lLqoiUNvvTLuCmbHiI55sUeNwB/LswyBqv+/QriTxhXxweFN5Llow/8U+?=
 =?us-ascii?Q?odWQHRXjJWk52fScAcF6Gni0lQoRuC209FD7y6UOIeeKVdluB3hc2jMdTDpn?=
 =?us-ascii?Q?Ak8ska1m6djve3I0OsRspsXin6sHWS8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d7554b-f8d4-49a0-6e2f-08de5f54f8a0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 16:39:28.7367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iF4kMoxncjY7/hfuXkBBH8WozKgoAePb3F5gU5nlEaX0vbhSnqnyqaLix3KZoNvzfv8Q+njjVrnsKaaM3Nkmi15/oSV496DrV/ibcUTdfuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5869
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDExNSBTYWx0ZWRfXwvvCnD9uFb4l
 Ad3TDAjXGi7I7WBY877fkuH4SQ2qxREcX+8yHih3PCI5EN42liEvRV2iQL6TxucWvhgSwXyigXO
 154oXE9HodV+mI+AIzskng+1RkGMIQOFG1rVCer0dJiw/aocfxIQ/u4kGAWc4dlJrN45iHxUQhl
 2jD4YlaaL7KwrsHMaEha/BOgo/ixyn81U2v8yvud60GhFW2NNkVNM3I4UITSkCq+N1LnvcvyRyV
 +GxZDVLYJNR/yHmDW3re2D+kIkP9cGyn65cV08stwcZeTrmFW/NSaOsNkmzu51ZAo39VpmRv07F
 PHf7XgaU47RPxbQmg2T3lOQBlHOQ2uTRQ8EFnl3pDbXlsIi/UFlZD67pVSMLa1GaQyfJ/5SA136
 1ycLjqQgQ5D6WbLEeOb2ZdbhjLIUoF6v3AxJKs0wReGHY8c1y1rr2Qh9lzQAc0W25obAaXcouYG
 L8RSMbgzPKSFsfsAcNA==
X-Authority-Analysis: v=2.4 cv=I7hohdgg c=1 sm=1 tr=0 ts=697b8d46 cx=c_pps
 a=5NePcLBJi4TpPzNSyn8y/w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=nzq_CVlEzhOWP2AoRwgA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: NJ7lIEB7skIC_A994tb8gGT5dPaC3Ney
X-Proofpoint-ORIG-GUID: 4444VOncx_yROONHA5Nzg2gNTNf3Yw1a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 16:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230144

From: Harish Sadineni <Harish.Sadineni@windriver.com>

The `make rustavailable` process (1) expects the Rust standard library source files (e.g., `lib.rs`)
to be present in the `library/` directory under `rustlib/src/rust/`.

This patch ensures the required sources are available by:
- Installing the `library/` directory (of size ~50MB) into `${D}${libdir}/rustlib/src/rust` for
  making them available during `make rustavailable` for native, target & sdk.
- packaging `${libdir}/rustlib/src/rust` sepearately with `${PN}-src-lib`.

1) See the kernel tree for Documentation/rust/quick-start.rst in the section: Requirements: Building

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/rust/quick-start.rst#n145

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.92.0.bb | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust_1.92.0.bb b/meta/recipes-devtools/rust/rust_1.92.0.bb
index a25f65f674..0e9d21ff21 100644
--- a/meta/recipes-devtools/rust/rust_1.92.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.92.0.bb
@@ -264,10 +264,11 @@ do_test_compile () {
 
 ALLOW_EMPTY:${PN} = "1"
 
-PACKAGES =+ "${PN}-rustdoc ${PN}-tools-clippy ${PN}-tools-rustfmt"
+PACKAGES =+ "${PN}-rustdoc ${PN}-tools-clippy ${PN}-tools-rustfmt ${PN}-src-lib"
 FILES:${PN}-rustdoc = "${bindir}/rustdoc"
 FILES:${PN}-tools-clippy = "${bindir}/cargo-clippy ${bindir}/clippy-driver"
 FILES:${PN}-tools-rustfmt = "${bindir}/rustfmt"
+FILES:${PN}-src-lib = "${libdir}/rustlib/src/rust"
 
 RDEPENDS:${PN}-rustdoc = "${PN}"
 RDEPENDS:${PN}-tools-clippy = "${PN}"
@@ -284,6 +285,12 @@ rust_do_install() {
     rust_runx install
 }
 
+rust_do_install:append:class-native() {
+    install -d ${D}${libdir}/rustlib/src/rust
+    cp -r ${S}/library ${D}${libdir}/rustlib/src/rust
+    find ${D}${libdir}/rustlib/src/rust/ -name "*.sh" -type f -delete
+}
+
 rust_do_install:class-nativesdk() {
     export PSEUDO_UNLOAD=1
     rust_runx install
@@ -314,6 +321,11 @@ rust_do_install:class-nativesdk() {
 	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER="\$OECORE_NATIVE_SYSROOT/lib/${SDKLOADER}"
 	export CC_$RUST_HOST_CC="${CCACHE}${HOST_PREFIX}gcc"
 	EOF
+
+    install -d ${D}${libdir}/rustlib/src/rust
+    cp -r ${S}/library ${D}${libdir}/rustlib/src/rust
+    find ${D}${libdir}/rustlib/src/rust/ -name "*.sh" -type f -delete
+
 }
 
 FILES:${PN} += "${base_prefix}/environment-setup.d"
@@ -334,6 +346,11 @@ rust_do_install:class-target() {
 
     install -d ${D}${libdir}/rustlib/${RUST_HOST_SYS}
     install -m 0644 ${WORKDIR}/rust-targets/${RUST_HOST_SYS}.json ${D}${libdir}/rustlib/${RUST_HOST_SYS}/target.json
+    install -d ${D}${libdir}/rustlib/src/rust
+    cp -r ${S}/library ${D}${libdir}/rustlib/src/rust
+    find ${D}${libdir}/rustlib/src/rust -name "*.sh" -type f -delete
+    install -m 0644 ${WORKDIR}/rust-targets/${RUST_HOST_SYS}.json ${D}${libdir}/rustlib/${RUST_HOST_SYS}/${RUST_HOST_SYS}.json
+
 
     chown root:root ${D}/ -R
     rm ${D}${libdir}/rustlib/uninstall.sh
-- 
2.49.0


