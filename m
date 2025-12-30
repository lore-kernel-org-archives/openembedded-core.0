Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759A1EE0201
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 14:16:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64807.1767104203427280625
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 06:16:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=n6mhphiX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=54595b53fe=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUDJVkR4014942
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 06:16:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=JJrNqodWE9dyJ+OIo4LC/HoBNcwN316le+KBjoZwfrE=; b=
	n6mhphiXiauKsLo4LrxqXCAgdYEfxW8UghJ3Qawsj0VFiMFnSpGgBHmd4A7R/+As
	1ugcpXrZjeHs1MezQb9ZF1/6qLlvV6JdXiRnHaLpAAbEnYtxBUUKwtMNvcK/HI5y
	BXrLpv+lobyHkA662/vzfjBJR34+vRFZpwAcZaS/kOKPuZDghluRpURYhRDUw8Ag
	z7QkVJL/QkxCmvqP9j4sk2OO5+VPxnr+xuAU6wlV6jD8B9KiiAcbeH7hkIZNvvN4
	BDKnwukwGNWRIrjrSO9HwNPi1IsMw6eU3C9TTtG3waLkkD/rFb4ZzGR9EXWuMqIh
	0Sz7YkWIH8HLe0dLhWnTgg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010009.outbound.protection.outlook.com [52.101.193.9])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4babm22rm2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Dec 2025 06:16:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6n7gHKaFOZ52O5kHBQ7vZax/i7sUzZWGVFVlWEMx29KOb/WMTwep8aneFJWg7KZi2YslpWHYPx1PYd1KLfbQLl0V3c2xwO37sEuRFXkYCsy/gh04bKj0FA87cQoaLcYVTRESYN6OnXRsEYB00WpQYqg7X4IwPDR+OJzQUbfwMyEMC8mb5riIz6Bb16SYKkJMpXOpo1TedWnGxu4Tshz2v7pap+9OlFqvQ52Fn0RMYv24kHW07Jf4dkqf/bsg8ksy1rK+bSG7krw1eNYMm6C+o+f3T4U3MjxjBJaUBDNSVFBxU280Adf0cl6jLKB7Sfs0XlwSCMBe5y8IgXdqXgdLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJrNqodWE9dyJ+OIo4LC/HoBNcwN316le+KBjoZwfrE=;
 b=unRfWpZopdcA1pnFqw68KQxE0yHhNC7GEu8Hbqr0eBsH7oqmt9IrzSE2o848irwZ5uOEKq+CZQzUXiAS9cLNxVsKnIzSCl7eShREHfT9Cd+4Z+Tgle7aLL8iFtip9Kn9HJWtu6rPot3MqluSziyMEPCTYoM8TweYj2ac5TpVzldiJiwXcTGpIncE+2qe9zFZ+Hw41EN5cM3csK6APCa4MONXsjAgNqcKua5b+o7bnqk2jqb4OoUMo7HX4vmpJrCmIL8fk5yuQJg/dtJokY/vN4km6vRta69BYnLYc0nUn703GNmYON2dtWdbA5maqXpEZh6W0p8AIOLawln9VjrbKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by SA1PR11MB8859.namprd11.prod.outlook.com (2603:10b6:806:469::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Tue, 30 Dec
 2025 14:16:40 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a%6]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 14:16:40 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v2 12/15] kernel.bbclass: Export artifacts needed for out-of-tree Rust compilation
Date: Tue, 30 Dec 2025 06:15:37 -0800
Message-ID: <20251230141540.1974380-13-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251230141540.1974380-1-Harish.Sadineni@windriver.com>
References: <20251230141540.1974380-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::9) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5651:EE_|SA1PR11MB8859:EE_
X-MS-Office365-Filtering-Correlation-Id: 030109aa-514d-428a-a7a1-08de47ae0d42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Q536MtF1hAnDGWaengNVPc+Ot5Yv35zE8QOiWD7v6M3e0YrX8g8WgPwGSGZY?=
 =?us-ascii?Q?qIp6lR3b0zWoGk9wIm3GvYgRbhyhI4+n3YYsEJas4gtwUebPw00dax310O91?=
 =?us-ascii?Q?ykhjs3KtqRgcxzkBuBpB/DFMSDtRXKbTOQVRtlIPJP2fUXFydwE/tl3Rf10F?=
 =?us-ascii?Q?0I73oXWrgSZCAqmKMYMbk8xhg0swX/XKnpvnlfInDhQy9lK7WzWbIPdZMeTO?=
 =?us-ascii?Q?+DUzI/7idqgE1p7EUAVIEowAbd8WYFj6cscFG8N3ZMPjd7qYgNfPATFn2hpN?=
 =?us-ascii?Q?rPFSSV1AAkblwBqexd3r2bdS9DyS2L88wc3loc8rGD2qcum1ABoQXY0uu1MT?=
 =?us-ascii?Q?4zqVMFSigpbfeE1L7YoDluxZ4THV6FMU0kAwx+KkD8v9S1HzUMS+fD041POH?=
 =?us-ascii?Q?mJQ+C38H2WeGKkz7FJgG8pgLmwu6uqL5Qb8XC150Ja2b44Tu+R/wOEam88yK?=
 =?us-ascii?Q?RdtcU23GAhveeDTIkPZvFXvsDhXitSFt738bpxUq2CfWEz2xqz8kY23vL/Wm?=
 =?us-ascii?Q?pZAUuXlvXCgTTwtBthZmnzsFV5cOoT6C9iaho3xIL+dI4eeBx60gjauxT3Yr?=
 =?us-ascii?Q?XwWepki4ItnFeogb3k7FLK6drk9qQbHLxG3uSxcffUY1CBPfWv/+rSTcZkJ1?=
 =?us-ascii?Q?BuRPpl5mYFFgKC8qkNVhIM0UW7+kmolUQK/VwiE8l5IRtwDSh0NLowmjzIC4?=
 =?us-ascii?Q?A20/oOJPy/g0OrLhabcAnHA2IKnCWFlVcB4fj/OKBF9o3E6FSsYfBlh9y0tF?=
 =?us-ascii?Q?H98FGPl+hiSDYSwHTd2HkU1Dgr0biN/LL3r3/wFHoPQIp0n2nUA7L7ZaO5oK?=
 =?us-ascii?Q?BBpVsA/PzZQ4JtlJ8Xh5bT5ac2COQ6z6f20YVedrSPlGAqu5LAhXul/i3hxp?=
 =?us-ascii?Q?8QozME3OJ3noF7FfbbVQuqwZQEqbFob0sF0ELB46elts/KLQiLKw/w4BXh26?=
 =?us-ascii?Q?kLFE2V+fbKN8Sdz8+P9B8GCsw2VgVgOdLsEMvIB1nA/LnX79Qzj6T7yVT4a5?=
 =?us-ascii?Q?QzHqjDkxqGVHXCen0/0R3eHOVTWJLnO/f+0hDanKSX46KGeJEphXpmoWwx71?=
 =?us-ascii?Q?5p/fv+EB828lta2DE6HW2ahu8i/uMFE0HXiqRmqhhWGQEuXOX2l121RO3KaG?=
 =?us-ascii?Q?x/uCv6WO0/sxnbCh3NHd/RyoC9Q37WVpPYb19L/paU7GQPYteeK1T9urAyqv?=
 =?us-ascii?Q?u0ZUeZcmizQZZuT6eVbzLRU/r0Tlc/+1BdVytV+tI+2HD+L6SY2Usz1yvVW/?=
 =?us-ascii?Q?KI5d3NVXZ75LTmzCH7pOm7sSkT0cggQz+k1XbFBv6sSrjHPRidItK5PkcVFI?=
 =?us-ascii?Q?ko5DaTWE09RZqMA54ux7fFBPxFPC6dc58/3M3M2vVeMc+86xqdJ1FALOqMdx?=
 =?us-ascii?Q?5gp8CljNPxhCuThYkgixm8KdxkG6FRQo2FqftEssRIaVGW7n/M/uMVjTsc0Y?=
 =?us-ascii?Q?DJnQ0Bx+MZAq+X2/2h82SsadJ86EYyxmHj3kW9g7e5aJrI16J6MCGBCE/ir8?=
 =?us-ascii?Q?DI0RqctdxKbuoW5LffkoBpLG3zxc1uyJDP//?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nu0Xyrjha3od0iRcn4TEaRyhKiPp9kfK8l2P7NsqHyPJ1NCpyG9gKBPyhHGt?=
 =?us-ascii?Q?36mvU0swGwQVO6TNhDfPZOyHQa4n1VvqODMLwnBaBnx/5CPe1ckx8Q1eHZ+k?=
 =?us-ascii?Q?BTcvEULAE5ml6kQM+fYIakz/PMIR0EeI269nje0ZIDFPznipJb5AK/fNLznm?=
 =?us-ascii?Q?d9zYt63meSndU7JYSSIAlVi1Z+hV0GwrsMYRVP0TLJxVz3sTChjL6PmlZXPz?=
 =?us-ascii?Q?I/fMsB5LDLhZ8/oe0E0k3tB9pGEda7frrxu/Wx/damVyRbEW9eOazVviZGmG?=
 =?us-ascii?Q?cR6IkZ41UhcgyZMy6np81amyRHDGRAR9+TN9FRU7SIthu+t9y9GKLPIaILoY?=
 =?us-ascii?Q?hSCq2UbLoEcHLtRv4wqaFeNSJN9cvhTENUexobx5tZ9w5dCpDw2U7jG+fdSu?=
 =?us-ascii?Q?SZTXAlAbOw3q/lgruq76Zw3bBwrEF2qWWYJCNwKWdRmXShsecFBSs+ymls9f?=
 =?us-ascii?Q?/DTLogvMK3h2Ka7LJ42zdr1P+PMcH24rgJiKBjeVPiTl9NbscEnIZIJ+dGo4?=
 =?us-ascii?Q?uv3PTEa5wY+RjB2ORcaDQfjSQWysX/PZ98k3CAVkS5Q+92FJPvNcMkDgyP29?=
 =?us-ascii?Q?Vrm+4zWgsYINc8F23Mj+rVTP6a5XdJmC9z9J5vjKO6kZEXV8/HfdvTs5aYFV?=
 =?us-ascii?Q?X3MkGjibo63RSKx7uGJ//zAwvshYmYP+ZATldI7uIVHdnI14QLvV6MlDt+wS?=
 =?us-ascii?Q?5zleGUOB5DZkanJ/R19I8rkV6yduT+4kGU1qoZveAsi25apsGXquje1Ij+o/?=
 =?us-ascii?Q?SC1YoHwrXFw4MhI/ow3ud35QEvL7VDjgLbPBv5j4ugL8BbNfuUrPhclDzkG1?=
 =?us-ascii?Q?FVk/3qIJfgPHkPc7pes/B1UwpuoNDFzpWeEJZkNpFrzrX68JV4ihooeZusX/?=
 =?us-ascii?Q?HKGv/CZEvKaYgiKimhMZccSOnaJ/yVF9torqK0lRjYR/QZ75068qrVC9imy2?=
 =?us-ascii?Q?JjU50DfH3y7g04++MOxgBHTAL6zz6xa699ZbrdqJo/qVrGvq+fDyRZD/pJQ8?=
 =?us-ascii?Q?+J68CXGuAA6Pe4WkzIDu9G+irD+uyCqrmhJA2i+BzS68KQ2h6oyB661CiBk2?=
 =?us-ascii?Q?9KPDS+rn59XgHL9i9xJLEQ9/2+nPGMIz17rETQ2AOkcARZTKmz3ktC4OeSLp?=
 =?us-ascii?Q?76eKYuCcXfo2wYt5X2R8BvNA8VguzBczwLq9cTGEAfdubq907Y7nyTdE+QRv?=
 =?us-ascii?Q?TJjPEv8THdpj761OtVV8ohFDpPkQvOd/UNM+K0MEQpm4KaTNCT3jIoiMbH4e?=
 =?us-ascii?Q?PKNwS9kMkx3ddW3Q4yFD70Q+IVxOpJ4fs2QX5CdM3RE+4V9gZw1TyhNRDI1F?=
 =?us-ascii?Q?BvjjdXVG7T59XIlEXk012Ea/w3JQa7lloq8Xs6IEMQ4GuooSrBqswhPO7O0D?=
 =?us-ascii?Q?NHb1sIJclKZDMLwsDZZ115U5JB6+Ls2ZpPwhTSehCcPxZBNSIF8+3VUC6NWM?=
 =?us-ascii?Q?kv8nIBncvXc7pmFmXAfJJ3Zmv3eZuxesPWhBA1zHKAGjKllSeTMuRg2eRE+y?=
 =?us-ascii?Q?RzmIVAtNHbppFqAfN2tptw4bDrEhJQDUsIWMCOEAssqMJvPWSYhtxR9I0lRq?=
 =?us-ascii?Q?M68DCplB06u4lvdYj45nyuO7kH2jaaqo9c2bMXKilNdYZQ1lfSmhtQQqq+qc?=
 =?us-ascii?Q?R/M86H5LcA8rAi5uaxGhcGBT71OCy9wT1I7G32epH1vjbJQkXJHT7DnUU0py?=
 =?us-ascii?Q?SLEtf1UqX2IjEeeZ7lZfkF5djHWLwQaDv2FdPmh2i270IBYMZ4AHs0d1haC/?=
 =?us-ascii?Q?QZmG2Z+EKXMUNwET4qJqUy8m3axog1Y=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 030109aa-514d-428a-a7a1-08de47ae0d42
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 14:16:40.6771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F0ALJIZNhBU1cojk9+sUDm6L0W3z0mAFtQVTqafyM6L+Z95UFaott0eGrWd/TTpH3M/AI4ATQjpS5nGzSq9UCQYhlpNLfnFjrlRbBTh1tNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8859
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: ELCnogtNYjx2QTkTWCOX29ubgAqOH7wl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEyOCBTYWx0ZWRfX6YGvtU8h+0eo
 Bli6w5G49Qi0uBZwBJTgiEmYPJmYq3jeRAW1tWNGUsaB5c5/D0g5gpC7bxswCI/V6+86Q+VdDQQ
 WWF6yUCF4TbwjtORo3elgV9uli5AgZoKZgQhMiwK8G5lvDtNzHx9+FW/lBsop3Ezfr/Kc3/YsqL
 ABsDEFOeQppcJgc6JQW+qmQBacY/ra9VSyzV3vrM/uVnb4QModnLeAgiQCCPeSi8YijUSGi1gCV
 4Ru0tjR/eOpJWuYEhPvK3lSZNwFEqfLg6qItduibkZ1pgOuA7/fHDNHMxc4YNWsadbKuiv7+uP1
 3Hlu8sH/n7H8Bwu24NCgG5l6CXe0W7zIi39/bcTYgoT/0G5O1pLK2pKgf2M6bfyBIo1wEgIcD0W
 kTwecrC0OaPHprWm0z+LbYeZQDAsyiaisZAtThGDusb6YbII1ZL9gNm74TBdf0bL6fc4+CdJy5Q
 i2JVxRCtmj63iF9W0Xg==
X-Proofpoint-GUID: mMJyvAwcZlagfWEgTVBuBgvm7mLbtdpb
X-Authority-Analysis: v=2.4 cv=bN0b4f+Z c=1 sm=1 tr=0 ts=6953deca cx=c_pps
 a=/dw4gKU6pt/qT5+OabM4uA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=AXdspKuNlVAGVjIo0CMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 14:16:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228678

From: Yoann Congal <yoann.congal@smile.fr>

Publish artifacts from kernel compilation to allow out-of-tree Rust
compilation:
* scripts/target.json: target definition: architecture, ABI, compiler
  options, ...
* rust/: the crates compiled by the kernel available to
  out-of-tree-modules

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel.bbclass | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 30a10b0801..dfb8604a68 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -632,6 +632,24 @@ do_shared_workdir () {
 		cp -r scripts/gcc-plugins ${kerneldir}/scripts
 	fi
 
+	if ${@bb.utils.contains("DISTRO_FEATURES", "rust-kernel", "true", "false", d)}; then
+		# Copy target.json file needed for out-of-tree rust modules
+		if [ -e scripts/target.json ]; then
+			bbnote "Copying scripts/target.json"
+			mkdir -p ${kerneldir}/scripts
+			cp scripts/target.json ${kerneldir}/scripts
+		else
+			bbwarn "scripts/target.json not found in compiled kernel. Out-of-tree rust modules will fail to build."
+		fi
+
+		# Copy rust/ needed by out-of-tree module (firstly for the core rust crate)
+		if [ -e rust/ ]; then
+			bbnote "Copying rust/"
+			cp -r rust ${kerneldir}/
+		else
+			bbwarn "rust/ not found in compiled kernel. Out-of-tree rust modules will fail to build."
+		fi
+	fi
 }
 
 # We don't need to stage anything, not the modules/firmware since those would clash with linux-firmware
-- 
2.49.0


