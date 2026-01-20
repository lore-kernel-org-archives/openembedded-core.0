Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50350CA5FD1
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 17:54:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12555.1768931661080021590
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 09:54:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=khWq+qBl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=548098e00b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K61G4P3729735
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 09:54:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=aTPzpAtD8gMN5c1P/7/eHtwOEvJOM1wZwCoygOkWTZ0=; b=
	khWq+qBlwtyP8kK6Wx7wlvBYU0kTISHcSIuvXOLy7qvwlfvQ7faimmzsPWkSTltv
	yhr/W6HhGGv4h3LtUE5Van2EQ5dYvm+5Wjooc4Py8NLBIbXL9qrHQFeA/sDm2CtG
	RJKdEnvBonQqnpLXm9+IpDLHVxLqjeXMSOp5W4u1rRZmnt9eya162PToY0k81QoH
	NduwLSJ4o2BitnIzLHYxAJ/MgnCipWwpA67Jxtjg5zLzzFoJ7fySRwt5N0UKzuAD
	5dzwbvRQCSSDEwUsac+/3wuNpIpksCyg448fGTan5TX/CTt0UTSFfdm4Uy/nG7A5
	WW0OpATtj6OcDhnWOOKacw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012057.outbound.protection.outlook.com [52.101.43.57])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bratgu242-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 09:54:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rZbqKOpNgPHHBs46N3OJeZIeByJ4Q9yu3oWR/JRagxnLsjiwPAFl6zDD9GmbS8GKJtq/k2xgRoztibVoxMM/n0GPLZLqptrSa3Ip9qBAFrPmiYHbPvKmM11FF59hyA/ogCAVJd0vXaKv7sv5Du6Vh2c4VWjMMf5DAW1Or1YOPJ2wkBDbmM8aOkTJkPEWM5AeJl4M8abF/wm3u7NlFbcBZWD5/GdckDa9YYKM6u15OIfSu7jJvxlhp7kJnCb7+2NV4YncYqLxW3vJvsOpou+D36Mwpe2302IyrDR6Bjy+Dl49V7xHGfvfki76snIx6CahwXyLl7+2JcDFjNXFXdGCFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTPzpAtD8gMN5c1P/7/eHtwOEvJOM1wZwCoygOkWTZ0=;
 b=jfsPyiViYQJGK3yk2DFkDxVvOykj5ZrCw5Nvr643WIJw5EyTKcdy9pl5RIzXSlATtRKnOZKD7ETQDyJgegoW018CDhh3CSLnWYwgVb7/mzxgs95LnmKZKiYO++OdoDEyikRAGG1Wu9mloPYup0y+GRn17Qb9mQe6rUYA3MrR8kOdY7YSDOjT6xOXZKu4D+MuxYhnr45mPnT1IXon1/EDbPB45yE3+bq9oxzuZBEHJ6TbI9od82/4G8/vc4DuTddSHjGhE+xA+rh/g8ZGH7NkPmDDXQLADEZxMY+ARgJ2Si6Yp68EiHTdv4tUMZUJLeXrk7brQnB8ccMMYp9rIn4APg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by BL1PR11MB6027.namprd11.prod.outlook.com (2603:10b6:208:392::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 17:54:18 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 17:54:18 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alistair.francis@wdc.com,
        Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        richard.purdie@linuxfoundation.org, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v3 06/16] kernel-yocto: Fix for buildpaths errors when rust is enabled for kernel
Date: Tue, 20 Jan 2026 09:52:36 -0800
Message-ID: <20260120175246.2052341-7-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260120175246.2052341-1-Harish.Sadineni@windriver.com>
References: <20260120175246.2052341-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0289.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::24) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|BL1PR11MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e0f4d16-c3fd-4b05-e3a8-08de584cef0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|19052099003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NgtMljnLFUfJ5148DA516/Oo/MpNC5sLhwbCFR3ZF9h4uTgCGFfmfAAPdJ9v?=
 =?us-ascii?Q?1qkMuX3TSyxahksz0vC/y1YiKaXuOnhxY/CgOXVdmPKNLLvN2B55LIAMl/QB?=
 =?us-ascii?Q?o0EDbcohYJXldg2bLvl/ZV1ds1GBLcaMbK8aAnms/Js1qfcmNaZbJPGjX3cN?=
 =?us-ascii?Q?yoZDzG+DyvzfuA3904PxbBAWglCh4spte5Svr0eYXedpS7oy2/me2A1D1Kfk?=
 =?us-ascii?Q?aJKAwZwNz+fAl1oWi24Ul+fBXWOT2y7n3AQUsD9p3egp1bro9eMEgaH9+u0q?=
 =?us-ascii?Q?RtWpjmg/g52ioziRPQQ6dj46HTmwnWs/Dbc5EccRL7Px22lNMmLb0zx2FJOJ?=
 =?us-ascii?Q?ybLCRRXWZ2rtE4OZZesjR/3SRA+5ZbcUA8j7QGx24UyrsPFXVJBA/dAOC/dh?=
 =?us-ascii?Q?AJ8rFs5Sr8L5WKX+xACxHumu9w/rD/1mEaMNcceGluWgBlmAZrlvB/3Kttp8?=
 =?us-ascii?Q?AVt8Lc9D6I7iwFs1lV3N1vNHej6mFxsbldayeA7nnAeKAjf+QZpGm2Y4DZiD?=
 =?us-ascii?Q?Jkl7AmWlSq5fVvaC2tT8Zi0Qjhwc+k+87ncsqbbWQZ3Crux+93Qqi+4wl541?=
 =?us-ascii?Q?SoIFQyu4YXlnUPhLTX1hRMvnXHyQ+m4+hnXYjNLPG/7D+rkUg/ygLccj4FsK?=
 =?us-ascii?Q?84wcmCJIM0WD9JwUT7EjizoONauLqgz14mpTesr3lHvM7WeAuy8NKZY5LGrF?=
 =?us-ascii?Q?amZ1BgFAsMpuq55yznAa8SmGjVRAbtdArZt9On4wSXMzOxxye/XFyIeTOlIy?=
 =?us-ascii?Q?EC01++/U4oWch6/vtf8XOsrt06rSGLLTY2j1pOkAoSU2dRrfdYme32Oik5Bl?=
 =?us-ascii?Q?usCvqYHCMoHlNTn9Pfku+IciZ0LucPJUFHhTXWjLIzmUd5lWs3x56M8dCyG8?=
 =?us-ascii?Q?23TUhoJJIaEgzgm6hlA844GVFAdLI1qgOYgQo6uT7oqsAygV5Cd0CSXYlSjx?=
 =?us-ascii?Q?+VkceIjW7+zptUEpDl2QzthJL6tPCqwmVYJigHT/Z2//38hzERTVfde90KSV?=
 =?us-ascii?Q?ZXtMKewEX7jwaeKEwQKIhTiP+FuXf6wkij7cXL3qYjvIWtRVa/EpnpeOhaC8?=
 =?us-ascii?Q?+q6bBfwuRNvagfMCyPNMuaEA0KLP8Z0O68+0RgQq3EQqPSsns0CNFU+krMxu?=
 =?us-ascii?Q?CzdUfLBco7QDlaVW0LRIwaeNo1AsCeaXqX1lduEQtqX7p94lFDc7cY+xCU0h?=
 =?us-ascii?Q?lHHpHlej14vAoHFE74Eej8S4JZrGePS23OLTxyBGzc+60kcSZJU731k0EiEh?=
 =?us-ascii?Q?4bb5BKYjTKBRMdTREEz2Q2GlGRmJZuab3MwhGVCpi/ZwF/Y9gmd1IilVla2G?=
 =?us-ascii?Q?RJ5bJSBsULNP7w/M0Lc6B87fs8RLp6g8iYflDdBdfQtuhWlDAu4c91MO47Nr?=
 =?us-ascii?Q?O+CvDcaTyaPQWoj/zhjwIa2hn4KW+al9R8mZPcu7XDBLcQ05NUXqEFRjsN+E?=
 =?us-ascii?Q?d3e5iqTU15SZhQnBZjEXRuaDT3VoQgby4BfwHctOqUjD/qbq/rZ6C08k/3oV?=
 =?us-ascii?Q?ImuflMSw+vZK1sfiMqXFFgGGwzEJwsEbcW6f29YUg8rHZew9S+M/GqGg+QXq?=
 =?us-ascii?Q?wszndsrLmV0sDJOJBJhMMFQnMSbIRKDGIbebkI94A8iXc+HLSashQwU+qR4y?=
 =?us-ascii?Q?5B37Z6iqzoXGf/eUm8bZSto=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(19052099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?t2FvM6WRrI5MP/cG0oZrCec7mjlU1MmdBR6ImBaL6vVOmVQ627m/nK6NM7a7?=
 =?us-ascii?Q?IksVqmC3Lm262K8BgvCLAM90k6sDiVsitbM+TVyNQyvfwuzbK6ePCc1cwAJO?=
 =?us-ascii?Q?ixJ+dDFKOVre+Eo2gWuR4AOr+8OrCbNwBOEtdqUksJpyBt1lfzpi0kMXlBm8?=
 =?us-ascii?Q?gtlAuQi7jF3TzMeuyh0ofQhy/sm9kseRA6NreA6O+lc8B5x4FjDyhwDGdAyr?=
 =?us-ascii?Q?Tt2zMCXrlFHCynT+lLzHIoJvTFLPxXOBBwCQARgzgcD3j5fgbks8gv5IIA/0?=
 =?us-ascii?Q?RIzPV7p4R+E48DFQ4brtvSSsLZ1IFCgHETcDmWDhZD8ogl5IHSdnzpbL+M2I?=
 =?us-ascii?Q?QsUoS9WiGvfcpgZ8YWWyYVp/V0ZPY0Obz4oeQCbW02Ntwt6k7u2zFzffYx6O?=
 =?us-ascii?Q?VcOqnZCxlmzoCurhkDUqm0D6W4Uyggtp06wavCNbThl3EAAGJ8s+fd5DGH6J?=
 =?us-ascii?Q?KWPCVH28/7nMDLasarPwnAiTWv3TvlVe606Uclmv0rq+Pey9R1a9GBkjTipX?=
 =?us-ascii?Q?4LtbMuonIgeCvKbC2u1yEuY1nXYBFI6gQdj+4h6FYBQkooToKMccEdflSZ5F?=
 =?us-ascii?Q?23Bf+rMiUybqOxeuGYQwc9I+YBb5RfkSKOraJfic1PHHPGuNkXYWjl+aWLBl?=
 =?us-ascii?Q?8fgKt55OEGptRqwZgmXyPKIBaKvd9IxEp9x9EoJCRtyKKg3yo7rN4dLOfByY?=
 =?us-ascii?Q?kagzPqfw+0CsMrqFuzfbPFsQsaRscoly5SVxebopm/4fO19KPFl0YJxKJnKL?=
 =?us-ascii?Q?6RUy9T1fbGm5wM6OhphGAkX5upjt6u1lIR+YXq/PGCiuprc94Wcbi5NQJNhU?=
 =?us-ascii?Q?Dl/isBsjBygj022Fhykqluq27yloDFrmmVSvHqFZIHydUhVppplcuBTyMcsD?=
 =?us-ascii?Q?yfHcfe7ZYo6+gLLiXtJPzGec2T5m5WPn8zDji9RqCO9yTdPu0gAfyqgEodHV?=
 =?us-ascii?Q?H+Kmue7QDWBq4cKRCq9THbvKSrLeVVPiYoDtskju2ff7jM+QoejzXTolnDZq?=
 =?us-ascii?Q?mxzrkdlT0dBMN4maZEap1Ma8ZbYwxaZWRhtmfplpkNtr3cGvEwF0eiyScptF?=
 =?us-ascii?Q?alBZpCxNatPJlno43iJJeUDYOHpnqiffwLcJcb1Xrgm+4+vQwjuINAm8uR4J?=
 =?us-ascii?Q?CpGAwPwCn3Kn68To2NZ9AUgTiifIhw/7H3TtibEOJqpk9xhv9iyglQWIKqWC?=
 =?us-ascii?Q?h6vY4gcRpD6Db6dRapKx+GLksNWHPCggQhhhfNihmeZ3v86wewoLGf5o3JuM?=
 =?us-ascii?Q?x/ZyiiyRm7eGGoZtzklQmrbNnqsNGP3iFcZVSQl6M5Oi4qv5sUXY3gv1aTR+?=
 =?us-ascii?Q?yzo8Et1+4INzU+dDkLBTD3U5jC3nDv0R7/KKMSp28DZqBneeBuRJhILqXmiY?=
 =?us-ascii?Q?vmk76b7tFlq3EDJPJMSFrdVmG4rFZXy2uh+UoimXzLnvUOJLNYVvcO3nfuVb?=
 =?us-ascii?Q?WF+sfpkseF5HbdEN1PcGDSOcZxZ56fO7+tlgYlZyil3KfdYzhbTb2uRYSz6H?=
 =?us-ascii?Q?yx79cTquz59/5pI2+3XaRtOtu1QhnET6BDMfWreimGy7GAYaCxSxNV26bOLE?=
 =?us-ascii?Q?+IqBUgwacO/QQKw61CaJnb0g+G0OtuhD8dUIwpdxKLRkubt3wrE40K0ZjwoM?=
 =?us-ascii?Q?5fl7GPemZkScO3JgouIDDoGQ2BzTGiBG61OnJlhreaQgCI/4nQVLA1oRPyev?=
 =?us-ascii?Q?hfntNV5e4753e5J/EPKqMc14C3ftfEh9XXGW2+l1RwK+SBE4eUDVOiVOtv1i?=
 =?us-ascii?Q?tkA0mbhZWR0sL4AHg3zKe5Ajj0WTcHo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e0f4d16-c3fd-4b05-e3a8-08de584cef0b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 17:54:18.5539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0S5l7r7SVrQTekoY3KcijYToeu8eGWPbRb0bQt6nHr21GO3Y5ncvEWQqBdPnpi5OVkRha87hso+5gJZQYtqrLseh1RcX0bYjYZ01XiRdCiM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6027
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: i1Ds0zT_jYgVL_B1fQawKcq2Up1Z-I7O
X-Proofpoint-ORIG-GUID: wXdHwQx1eNrCzzjCQ2Q6Ip5bYst5M-ZO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE0OSBTYWx0ZWRfX93S7N8pTTg+D
 XaySMajC1+XzUsbCRSHHmKVICewrKik8aDt1u37W2nbebLge94kSbTsuvq6f8Xbd6ZmTAsEjjk4
 Wf4ckcnUMijJbppEtJhS4NHPWj44+uLqJvXpz9YtW0mqow3xbQfmxrip8iQiH13xs0GvgqFx1cN
 yhK9HT/xd1wkwI9GKQAbenxamaABRfPSQSkEu1tSDV4B187XzvQWKt0A0uZb44pXc1p2WJIVu1G
 1Wewscogr5y7rEUxSa/J6psida893PWHZs/4yKmReP5aMA6dckcwDjAxrmQPDK1mCWfKYXqkUMZ
 4EAjKSsmReChNwhAf8Sl+ex4wa0BTXSCWYYRZkyrd9X1AmfCSPwOjRH9tz/G0p+WbFlU4FM7Bzc
 7GOue5tTJ3YdKozBO4NDeYevbuKNTX48HS6XiCfBphnY4SzMgJAH02rLf+RyOxciMIDo/cgpD3x
 EKnEFdVBdliuoO/7nBA==
X-Authority-Analysis: v=2.4 cv=DY4aa/tW c=1 sm=1 tr=0 ts=696fc14c cx=c_pps
 a=Y/Y9x3HtMOqQL+YbCjVQEg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=hOBxLMctpgrGYW2eJecA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200149
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 17:54:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229753

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fixes for buildpaths errors after enabling rust for linux-kernel

Co-authored-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index 4323c4c80a..cd5daaf33b 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -4,6 +4,8 @@
 # SPDX-License-Identifier: MIT
 #
 
+INHERIT:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' rust-common', '', d)}"
+
 # remove tasks that modify the source tree in case externalsrc is inherited
 SRCTREECOVEREDTASKS += "do_validate_branches do_kernel_configcheck do_kernel_checkout do_fetch do_unpack do_patch"
 PATCH_GIT_USER_EMAIL ?= "kernel-yocto@oe"
@@ -27,6 +29,11 @@ KMETA_AUDIT ?= "yes"
 KMETA_AUDIT_WERROR ?= ""
 KMETA_CONFIG_FEATURES ?= ""
 
+RUST_DEBUG_REMAP = "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', '--remap-path-prefix=${WORKDIR}=${TARGET_DBGSRC_DIR} \
+                      --remap-path-prefix=${TMPDIR}/work-shared=${TARGET_DBGSRC_DIR}', '',d)}"
+KRUSTFLAGS:append = " ${RUST_DEBUG_REMAP}"
+EXTRA_OEMAKE:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' KRUSTFLAGS="${KRUSTFLAGS}"', '',d)}"
+
 # returns local (absolute) path names for all valid patches in the
 # src_uri
 def find_patches(d,subdir):
-- 
2.49.0


