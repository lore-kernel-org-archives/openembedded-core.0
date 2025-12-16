Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C337D5B87C
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 07:48:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16993.1765871331402360643
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 23:48:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=a1FPVN3b;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=444573d0be=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG6AUVk2994968
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 23:48:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=R1K6wfJSu
	Tg6tPPfdokfafdbA1fjQnV8RZWYmMUpe84=; b=a1FPVN3bAiTU5aGY104838ZB9
	MhnOn3SgDDcwASQHUjiwEgGqM9Y/0OE0HENK84y4QIiyI3gzQhe0prtje3C9OWSV
	tx/0Bdqo196FJqjr4neylgfqLS10DIch/VoBJyaOW+ywVuWV8zWF+OyK3pBHoGf+
	e9Z2kNr8Ar9uj38C6iSeEeinhNt3BCEdgUcvKgr+AZz5n8oiMS+XPv1oHmFI+vem
	hw7uSoG5Zbq38we2dnhPELdbxGW5lygyseIOXriZ7dyqm2baqvE4LJqc0G6VNh63
	CgYzt8LM+bfm7cx7stIen7CE2hDxCzUVi7XvANZcgKTJcXNYTPAS0kVrT4VxQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011001.outbound.protection.outlook.com [40.107.208.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b18hmtcqm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 23:48:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZEDapGT4N+n0I0wRg/LKRPMPXOL5eHZM06jO+NpFj/Uf5WfzQ56OWUoJO+8iLnnBH5U7h+Qh77XepMknQRyjnnfQVugRuJ7ojof90rzOI0hMWmRK5bsUr7OwkvxkzbJAhWdJXdMmSQxdrZ7IO1KK9SxN2S9HIYynGx+u8FmkD0PVSkRyTDsJPM/YoCnvYNaKNf/pFDype4/E9jEgyu3+KRy41SHQbKuht9zBXj6dVmUGl9gGEN4ZDfxc0vKuQ+zx3X5XlWjLXLR5BBAmY5VmTa9J1GCmGSZV7QEd2OUE77MSl93nvcpizDPyc1ps21oV0TmYXHiOAYZlX10gGHT50g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1K6wfJSuTg6tPPfdokfafdbA1fjQnV8RZWYmMUpe84=;
 b=rOhmuXXaYIj9KTnRRC5WX3P+CF+3jXN3XfDmUQf5E79GoAZRDVQu6v1iBcIaBFWC1xBWcO6LEBDRgRvhfGvBV4sW3TJ1C/3rHef65m631qiwLecIIT6UDm4FToczFdchwi531e/Zuko2goBVjSD4+IRKpU5hWKiScDQ82jUwXJwsYqciAfiLhZKc39fb9d/974uDydkU0RiPndth1ncPcfvU6pld2c41s4zF1RvcY0r98Qw60waE8H0FnK8fc8Dhidtz1WinoavIHhiML0MQeHJm+zQe+c6o9t8aJrldGsTJ+nlMaEHaiiNPMSn+OKas20ntqew0snMSAiTKO9jlPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by PH7PR11MB6054.namprd11.prod.outlook.com (2603:10b6:510:1d2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Tue, 16 Dec
 2025 07:48:48 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9434.001; Tue, 16 Dec 2025
 07:48:48 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sunilkumar.Dora@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [whinlatter][PATCH] Since x86 .eh_frame section may reference _GLOBAL_OFFSET_TABLE_, keep _GLOBAL_OFFSET_TABLE_ if there is dynamic section and the output .eh_frame section is non-empty.
Date: Mon, 15 Dec 2025 23:48:35 -0800
Message-ID: <20251216074835.1317924-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0269.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::34) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|PH7PR11MB6054:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b313317-7a12-4ca3-b588-08de3c778c11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VavPf1gEZXC1PVrnBp2Ere/OJyubP6/ZHm4NN6iJ7L7Z9dpaECubiZUTvVQs?=
 =?us-ascii?Q?A66/fi+YMcqIzC15gca1ifLDTAlksODKAcRHTr39bHo8Lm2c3hHAvBKHeHeP?=
 =?us-ascii?Q?8YAucLOmmgK9GEAv8X7Eqv8JRqIrvoHz5Fr0LY22nSxQw9p3E0w5/pn188U3?=
 =?us-ascii?Q?uVlNSyw1gDOKN7OO/3gjp/15aS6fgHtpNWVnzBUnC5HiInE6N0O8pPwOxMzw?=
 =?us-ascii?Q?qjOFEUjWbOvF6ZsVdePW8NtbfuwBWn+6Ny3T2ET+iVokbn5eQWmou0oVwDR6?=
 =?us-ascii?Q?Vor70c8p33JK8PYQwbWh0dtBSm/MDspEc4WveQzZW/72i1ThvIAqyzBX3fJB?=
 =?us-ascii?Q?NqxTyZWFhR36ZsRm7pyBOiuWQ6XtU53RowIHmLnQJq1CWoie1m/mAS6ISSVL?=
 =?us-ascii?Q?jBmzj1n9tg5CfMXY2MPK7HDTGLyVugroPUQAQ+HdNi9m/woTGQInXX5VZGr8?=
 =?us-ascii?Q?EouXtsCRHhoZcn9NQi/zkZP9CqHZqhXcBW762YY0XrCbbmmK+ky6ehdJiAiQ?=
 =?us-ascii?Q?0H1ILeyIZtl7j2uHQyPvQqr51LtmpdnovquTTcjDqyZW8We3MvR9uVly8taR?=
 =?us-ascii?Q?rOGTIRNMX6eiW3nMCcuCFjGI8Ot87UCpws3nFqLVmR9UED/K1UjDxdJ3jd3V?=
 =?us-ascii?Q?p6wXJpMqvGDWCgmnXki7HZo9IyvCgjS69LC9tKz2aFotHTvYHNGoNjWZRLYj?=
 =?us-ascii?Q?QCLLTN0TQGHSycJ6iXqiSWAcyOvo3m/BAf/RbIbCWvsX2PAKEPMbvD1lZfAA?=
 =?us-ascii?Q?MFBR4xEDGBDpNcwudfKm3Zte4U7gkxfNyBVxbsf+NxL8ClEVoBP4L5nxH2+N?=
 =?us-ascii?Q?Mms8pgF8hpnbl+a/qTHE+Lco/2w5uCs+Xk6Jy44fWBTIRdQthJ0a823YNcPW?=
 =?us-ascii?Q?NQ9myEZGPOwNx5bRrAw96ERxkX9UyQLnjlyoT2LKaOLZrCDB2kzNvQDCpF3C?=
 =?us-ascii?Q?ydr/DBFgEeV+KT5U4TNp3c4Bbds4xqXeNCCtwHVGjTL6O7telfCqwF+J5EHb?=
 =?us-ascii?Q?cw2WhcpbQg+u9SWhLnk1RBxDI09ErVdjfW9k6GJTsgQzp5fzokqs9iamsBCL?=
 =?us-ascii?Q?HE+hVhikuOO+BVOENDmT64iUZJ/IHXrQiBJ+Wf032qj3qR/OfSuDxzThzK6l?=
 =?us-ascii?Q?GEA1KJ3I911W3E76Quh46eIm3bGqX3vbmbPiBr1aVPrt04NTNenZsvOFxMpE?=
 =?us-ascii?Q?t8ubMtO8KAzUEaYxQWhKGvxn6bzwK8LmPLOWLcJMjyARvm6Ll4OhOUmNvrAc?=
 =?us-ascii?Q?lQBeq+pwIM8K8yJ++uqdJNf9k0QGOkQhtHDTSluR5IbBDAvl+WAgmqNSW7j8?=
 =?us-ascii?Q?xWYjayy4yodXyNSU4bU6lWV8OBSPWK4Hig1ibfigmi759kLw7zYlu6hD+hWJ?=
 =?us-ascii?Q?0Y+o4o32iBEp9XvMJcYdcD138vv5/4++WCqGkeE59CcAOTooKz+Exi14gaCA?=
 =?us-ascii?Q?OLThN89NaGSkOKtGn+c/fAo7sR+KLk/zRNQyggTVfdKln2WCfZfpXw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gio6pdZLc68+NyhFEK9dJkDynT6JBW/yVSOTruxEWCBuCJ6K5VCfdnIw7pqF?=
 =?us-ascii?Q?BzkbQWPuSIX5U/qWp2qZkC6Uv+zSo+i1tSmAs2TjdbefpWnSQ2AAl6aBaeEm?=
 =?us-ascii?Q?InVbS63St1XZMqDpW4wgfa0BOT1xOJ8CiLCUwHdojBYJ4CQ/Mlu9JAfR7Aog?=
 =?us-ascii?Q?9U3JiiUaegpS2Q9jW8WSqQ+G3o7hJLRDrpR5vAvKcrvIIcIBsmoGj6FvRxoL?=
 =?us-ascii?Q?Yw7kMiGxLgql16wB4BDAbOjYsun7i7+YPYveI70ReHyqIh1vA4yclW3OHcJS?=
 =?us-ascii?Q?TEEGy7jNycOCOg3qhXp9trb8m48dB8ef7RBAzYnTO+H+Iim/gu6QEffL2IFG?=
 =?us-ascii?Q?t5AbbvmK3Lihx6jbRMydoBvaTOeuxDPMoX7xaCIewpuvGPFt1sxkB8XAQ6C4?=
 =?us-ascii?Q?07uCmApUxudqejDG29As+nPzi4oz6w3CVCAFOG28VfaEXYaWDeLt5HmSaJCW?=
 =?us-ascii?Q?RRqUGzhwEKdwuxLaj2a14LNo254VMgKk0r1A7jh1Mw+SsU5kssDHasUArrTa?=
 =?us-ascii?Q?YfrXbksy5lUIGL8OIsr+8iUE9WsR9eLtNk3U4JXdbQIiacrvG/OPDVwTOeGb?=
 =?us-ascii?Q?gtHeNx41CHqw7h0u/YzibXwr0HIYcCpDraJnT5txIqYkxAOtuGlB6eFf57s9?=
 =?us-ascii?Q?P4aBCQFrcW9qvC/IR0y/aaNrDmTqqiCOb9h9yYn0SpXL9AcVsrQv0o2I+9m+?=
 =?us-ascii?Q?MuPp9zL59kn7GKH4zKn/IrqniYifNowGpKnYggJCM/QDYqEEVaydbOeqLASE?=
 =?us-ascii?Q?wQ3xa74+x1uh9i4/dNXc5z0sFrJFeJXOW//H+/7MQOLJ/HESAclWJukPFrjh?=
 =?us-ascii?Q?azbS23ykkol3r720Gzmcz0x2ZD5BKiirR+KZWQy3LbAK7Ga86uwq7NwbPFPv?=
 =?us-ascii?Q?7DlxeLYM7RE5k/MmIRu40eRwIKEoV2Dfwg9t1gYbaavJsNSx7sY4Y1LU4zGc?=
 =?us-ascii?Q?fH+9MJn9cB9cPRABDwiJgMNMuabBsaN95OmnyrmxdpelC5PVtP6bdGTfGphP?=
 =?us-ascii?Q?dOYOscmzlgdtCIVbZmCqKnKmfOFVTJZxmG8Vo1CURvi1Muc1vAY2aWq6a1Bz?=
 =?us-ascii?Q?q9XAkYJsWAXhsAGkH5Vz6Lqn64abF1zUvDbnpIoPgChGPJL5cH7iOhB9FLxS?=
 =?us-ascii?Q?SvckdP5ObBDgr8wDT71d+9OSkYZzKzBRrO/Bp9m+e3T1jGDNOTQn++dyuyMi?=
 =?us-ascii?Q?ZlXVHpOCFKKuBpGeKfQI8TwOYiSQQEUbUdq5DEB9gFMwBDu1xEB9MEnoMo4h?=
 =?us-ascii?Q?z5MVEGQVYmShlfCqgszliJVNj/aiW6jv4hleXuFPg7PS5TUQLPva6nqTOuAW?=
 =?us-ascii?Q?M8vUyRh4be4OluK+z7R7dwgJwEmm8oO/05edS551lrBZlUt3m1zZ2LoPn188?=
 =?us-ascii?Q?YNb16/m9t2WDgCwpUw2PnHjkhYJIf87F+/ntjFSWkPXS6poAbgu8vDj9EqsJ?=
 =?us-ascii?Q?91Qhe8ZzeV1osn3FrliHEWoBaawFa+w6niF+mJdPhmSTldtZ9H9ncFHa0rrR?=
 =?us-ascii?Q?UdeyCKyt9gCYzJJHS/8EP47t9gcqUzGLiGIeCvr0pYcHn5dWFzcnQI8bVGXG?=
 =?us-ascii?Q?vYBiHjlkIpIaOoPIMjHSQuZMOL9vhH1+x+zv6wyVCeCn30BPZiJDwduMXPmB?=
 =?us-ascii?Q?9rkjSPv+Thqfc7Rj+1qoMQc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b313317-7a12-4ca3-b588-08de3c778c11
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 07:48:48.3558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZfCnf5+DzB5JHLPCqvQcL4NH8f4WcOKeiLhxiVoGVkCpjtvyjyZZuSzyi+EqqDSeKccRKBSTwevgjijBtf8oBmBTcdP4GYx4ALv0/jHC1R3MecXX4a/XfKNbuFXg7x3S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6054
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA2NCBTYWx0ZWRfX2QBGjNpft//b
 yxAUWyN5D+o33rYzKJMcHFwBVr/hYD7m06khYObY8wcuTAMYgXMB9DMh02Hu3rlO6NfUDHY1NVj
 0EEoWLVyvEBNjjnyEgXgQOhKaov1X7EjY7E29RDwf+CtG64Cgq3MqFl1T8u2pRZO85HXUn8nSN/
 r8vN74pk0iwQsBHofJk4nHFDA/Z3ae3R/YtgGEh3SI0bHivTLIj0EAa1l6xBdiZ3L+tlLZ1LsQZ
 3AaOymxX7vg0Z6m1luvsxB2bMYduH+LQanoM1Th13JPdIs2UIK87PuEXYpU9Puw8blkQwrH6fnU
 CdV6SRxDspyAZAtNQdzyqy7hZ5970Vur/6mHvLtbUPPP0mTsQF5YmpnCJsx29HuUXcE2dD6/dbA
 m4EovvFHi/+QMgPhRDYvNsECTB/qow==
X-Proofpoint-GUID: 81T26MShv3GHsV55ScnZ-57A_rLOkEGf
X-Proofpoint-ORIG-GUID: 81T26MShv3GHsV55ScnZ-57A_rLOkEGf
X-Authority-Analysis: v=2.4 cv=XMY9iAhE c=1 sm=1 tr=0 ts=69410ee2 cx=c_pps
 a=+gGuMjfID3j0L7k8h/8w9A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=d8HPVgtQaXFDFom2_1MA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 07:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227759

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Backport a patch from upstream to fix CVE-2025-11494
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=b6ac5a8a5b82f0ae6a4642c8d7149b325f4cc60a]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../binutils/binutils-2.45.inc                |  1 +
 .../binutils/0018-CVE-2025-11494.patch        | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0018-CVE-2025-11494.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index 288475ac39..58964a6cfb 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -43,4 +43,5 @@ SRC_URI = "\
      file://CVE-2025-11412.patch \
      file://CVE-2025-11413.patch \
      file://CVE-2025-11495.patch \
+     file://0018-CVE-2025-11494.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-11494.patch b/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-11494.patch
new file mode 100644
index 0000000000..dc4b413658
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-11494.patch
@@ -0,0 +1,43 @@
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Tue, 30 Sep 2025 08:13:56 +0800
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=b6ac5a8a5b82f0ae6a4642c8d7149b325f4cc60a]
+CVE: CVE-2025-11494
+
+Since x86 .eh_frame section may reference _GLOBAL_OFFSET_TABLE_, keep
+_GLOBAL_OFFSET_TABLE_ if there is dynamic section and the output
+.eh_frame section is non-empty.
+
+	PR ld/33499
+	* elfxx-x86.c (_bfd_x86_elf_late_size_sections): Keep
+	_GLOBAL_OFFSET_TABLE_ if there is dynamic section and the
+	output .eh_frame section is non-empty.
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
+index c054f7cd..ddc15945 100644
+--- a/bfd/elfxx-x86.c
++++ b/bfd/elfxx-x86.c
+@@ -2447,6 +2447,8 @@ _bfd_x86_elf_late_size_sections (bfd *output_bfd,
+ 
+   if (htab->elf.sgotplt)
+     {
++      asection *eh_frame;
++
+       /* Don't allocate .got.plt section if there are no GOT nor PLT
+ 	 entries and there is no reference to _GLOBAL_OFFSET_TABLE_.  */
+       if ((htab->elf.hgot == NULL
+@@ -2459,7 +2461,11 @@ _bfd_x86_elf_late_size_sections (bfd *output_bfd,
+ 	  && (htab->elf.iplt == NULL
+ 	      || htab->elf.iplt->size == 0)
+ 	  && (htab->elf.igotplt == NULL
+-	      || htab->elf.igotplt->size == 0))
++             || htab->elf.igotplt->size == 0)
++         && (!htab->elf.dynamic_sections_created
++             || (eh_frame = bfd_get_section_by_name (output_bfd,
++                                                     ".eh_frame")) == NULL
++             || eh_frame->rawsize == 0))
+ 	{
+ 	  htab->elf.sgotplt->size = 0;
+ 	  /* Solaris requires to keep _GLOBAL_OFFSET_TABLE_ even if it
-- 
2.49.0


