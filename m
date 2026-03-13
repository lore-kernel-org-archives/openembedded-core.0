Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0EDE107BCC1
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 16:00:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19284.1773417602828726876
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 09:00:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mrcz1s/4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75322bb784=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DBDHfe2348574
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 16:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Hb7lHlGP4f3mcIXIROCB9xTQdgloaKgD1LkP/o4e9/U=; b=
	mrcz1s/4I0Nf8gG3UPnIQAIWMvsYs66oe1eaJWDSZNvbjZNAV4/OUAyVpwDT+l2G
	d8Ou0ikWRlouajHjW8hV4TQnSUMVO/KUCzw4N93aQ7Dj18gUU8mWFB47gXwq3Iob
	OnBKiwhT47UaDURpwzoUhsGywnthlRB6MLiRMMkGwWbP6gpMkNMJ7skLy/LYEnTd
	c4cZz3SwssQpikoVx4dlkpxPpxB40z7c5AZFsz90oQOZBZm8PG1hSQtJg2sZ1dKd
	nk6DmYfgyfIw5t9zl6yDQ/lySVBIYfq8AiPbv+lbiCJzfsXFRPUEt2HXM3tl9Qa3
	CiwPdmBy8qIBZ9APbcC4Ag==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012054.outbound.protection.outlook.com [52.101.43.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh78jbc1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 16:00:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IK9ohhZCDNk6R3M/g470y9VPzSx6rzDZzce4a01ud7Oh0EqByRY9Wi/pqVVhzuBNxHaOsZC3oBC8RSKfHM8ppeV1zAAS6793J0ovNErUxbihvRIs16IdgdESz9oN8h040/A177NdHcafNIaR/ym9HKKF3XxzqRD1MtKy570IXYWncVfSi3ZB9DzW2zhMDqeigvOoZJ1312AQAkLyPkLsF37FnR8qGiNNQ4rnwkRWiMQMBlUfs2LImYeirL3RXNnz4WZ/iScLsfpmuRN0rA29owsgMV/6VxDKiibl6mtuML63+7mIcThTCPX91u25S6kMnOIQqo7RT0NOpxZQcF8DGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hb7lHlGP4f3mcIXIROCB9xTQdgloaKgD1LkP/o4e9/U=;
 b=MlVTYtVT5FW6sq4ISWFa+vvsTrwdMwi6o0otW1eIkV0Yb9J90Ed9rN1U5uZ+3yUat/5mMellmJaHR7ZCsO/IsxVE8et8R7eX4gjahm7Hv6SXDJntl5Q2tUmU8zYcI7GZk7JdKtPTtbfuwMk/FevfFfreMFhgmZmVfCmIwGoTBjF6dAq4Scy2fpSiXS6C+nlbWhfsryQifgVN7OMrL45sAHRGob0wLvhnRD1bd/rwoxbo/emjRJRI5GcUkMjFL3gJBx2mcA58DyDt6OKRk2ouLy3OoBz0z+IXRLd+8GkDnDyp/OiQRzSPg6ue3KBdI49cxJS2A4WiFm42HEoxTfIRHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH8PR11MB8062.namprd11.prod.outlook.com (2603:10b6:510:251::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Fri, 13 Mar
 2026 15:59:58 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9723.006; Fri, 13 Mar 2026
 15:59:58 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, richard.purdie@linuxfoundation.org,
        bruce.ashfield@gmail.com
Subject: [PATCH v9 07/14] kernel: Disable ccache when kernel rust support is enabled
Date: Fri, 13 Mar 2026 08:59:13 -0700
Message-ID: <20260313155920.2347101-8-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260313155920.2347101-1-Harish.Sadineni@windriver.com>
References: <20260313155920.2347101-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0046.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::21) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH8PR11MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: 04637db2-1ddf-43d8-baf4-08de811993bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|13003099007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	NbxyKwV+39B8QMBh/LVIQqFLLs/6Q1y7exANFCXAo5FHWhMICn9Qph9dMJB/WF7RD8YfJsjfWzkw5u8hEcWLzsEqL/zVjh9vikAE2gGms35nrdp/HII4CRHEdVmALI+cnhl0nfjOAsJMzE5U9ZeqmYCKp8vGfqLwruSopBqGyK/icyG89BcdfwN/D/6IEjuhBrOayjN0dIFpJcELCt8K/tBus18AvriO+PVk1Hiz63MZvdnR9UQ9CXCWL6sJCRfZVR6AdhHeJwP4m7qmVSX/4ZV3EBOWwBwFsK79GTD5tEtY37Jk3JNWLdBD5CXAgAukQphvMBPSaBFpqOPyMprhpU8mhou7dF0uihCcr2omVaYR56sVblikb0gi5qoN0J0GHlBBervoskxIpihAqYF9lWot4n0w2b2OTQtkDm+hfKA9qPOHX/Lyu9/9gRNRL7fAGVNxAarNaK38CcWWcYR0+lVjqXWrA4Q4Qm7dxM3g15AQ8zcznE9KlK3562JpVbCdd4bnBScP33p+WHOVyQ4xx/I/CEagzK3QKX3V5E9C6a/5hVQeMQLvkqy8VnoyaTV6rI0fIt8Eon64eUG3s3ye/xgLahKyyZQ9rKewwdnQxlwr8h5vLw7qU2Fj7RT7B5PplgTT/M5ntxDPihL9cIUCJ4NChDBaM48hgZDYu1Os5H2f4eoZdf3xxCl+3/mnXiZOcwQTo78FVDP6j457+C64WoXRqbKGWr8Qkpc5RkxbmWF1pSsqNZG4ZZJFNOpwVeNw
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(13003099007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xrOBMCQ/PGAd7XOVHnf73YK9QI/3dJY+1LT1y6g7Luy+4q7uai61vr05xf+m?=
 =?us-ascii?Q?Qg1wNPnMCMuvRHmOllpAYZGY4gj5xmFFXveb1AM0g6NNEZi/s6LoDM16M4Uc?=
 =?us-ascii?Q?7x6J0DRp63IqJwJMyCTX/UPS6C8boivUeemVdZp5sLywOyha33k82RMFjph1?=
 =?us-ascii?Q?fHEc3NegiCudM0xH57AqsD4Yr1mx0JSU4cImxUUzTO6YnJriGABOvJ4jmPH9?=
 =?us-ascii?Q?X932wuBVgWgHzFmfNbZxA4net8oCWi5EEp4dt95+RnApYKAUCbDS0OgFwWIv?=
 =?us-ascii?Q?OtriJtwf33Fx3GYIovxm0ZcYZVYd0LXldYgLcVpiJoFoGxjtC3+VN1knpmIs?=
 =?us-ascii?Q?0griuiWwBiO63Lh0qRN1wzrRup8yGlfefdoNx7ikDcbgp1xmlmiNmlXZf8gJ?=
 =?us-ascii?Q?e+SoeNE5io0iA+l588Vo3/rwlyFkAsEsjCkFaXqxunh5fnWDxq6WHvkTVsEj?=
 =?us-ascii?Q?JLHrO3ZmgoAinM5yfpad5Hgh6JMEwy1CKSMlXGNbsMYkSdeTu0wYQqqkv6xc?=
 =?us-ascii?Q?gvWZAoKhmudQ5PCjgfTfnxXLeWvKX36ZRwV9iVPkWYmVWcg7d61dD/YxpLzn?=
 =?us-ascii?Q?rQ7KdadE/843h4wV3DLnYrEJYweGCefxTQyBaOxf3DxO1jvXQr50+KjBHLdk?=
 =?us-ascii?Q?+/xs3tx0yCVfbLXZq6549OZvvelBAsDu0BU3g60j/JVJJSbW/+bZ4bGps0K0?=
 =?us-ascii?Q?XKAzTpQ0LcwAiJzUvyfHZf1pZmA7OrHsJgwoSTompm0u/cRrLEOT8HTFknND?=
 =?us-ascii?Q?/IwSHSvJyHp+PWWKRQuSM+Dhru2a2yTsuakJa473bFlg1+wcbiIaPQzFj+MD?=
 =?us-ascii?Q?U3Vz/lHnBcrmD1XL3fO/+yNh327G0CUOpZUrXCaG3rn5d1RNdf4cnzLI6S7l?=
 =?us-ascii?Q?02FM21fz4aNtMLUANsJkGHYzt7eX1yNb7jf3vsmb5gLJ6cSADi6eYIzXu0r0?=
 =?us-ascii?Q?9IcGV66MhcMizffBfWSHKHdOgmrd21gCflaoxcUDlkGI6Mhd9oO1wb03dW3H?=
 =?us-ascii?Q?5k0ucsZqGLN1+abtWtU85MZ6WgosEOEKPY+B38C4MLA9Wf0ocd14UII90LYl?=
 =?us-ascii?Q?Qi1T2VexBjSQK//LfTUxFZTRxaGFPeb4ffyg1p1Z/U6gVDnoO9xPQpJ8Itdi?=
 =?us-ascii?Q?uKZvaJezbR/J3t5PwTOT/Z35W2JBQYuWkLsUXqO88h9NJIKCAUPTiyCTkvlk?=
 =?us-ascii?Q?8lzLySaUw9YrA48jAi839R1e6h3TxAeFPsUoIRjEZGTjiunw5iB85wKXJnzE?=
 =?us-ascii?Q?BN+1mcM3NmMPKb+7iRQ44Vpr9mDPFZKrC224cpj1FJ5oJJm+mV6S2i4uW4J3?=
 =?us-ascii?Q?y6mCDHi2qwRDnt4Lqs/beGTJpjXHt2hLkp5Q4qKXZ4ooM5w1KbR+edPtqFEX?=
 =?us-ascii?Q?rtYgEEbzGYzfy7tnXQU/CtKrd+o1K0RYXB2jDcuq7p+JYnRW5GAStEATv0c9?=
 =?us-ascii?Q?EY0iGgQ4c7qNB5jURps8//NsmbuCsizKUBqTLA4mq19z6sCSDFEuVu3k+92T?=
 =?us-ascii?Q?l4CLzDuD/zCr5ltH+aREtMGRrRylKRf5DgrFeEhA6CwcTKpvQHQc/OiSniZS?=
 =?us-ascii?Q?dUnaBPeW72s4/K9I9V7qYv5YYsnuHlHwjKPP/eMyZ+IS2ANw9DLbrvhf9kNY?=
 =?us-ascii?Q?sngxsGQCWRb91HrdJegjtNKDj0V7tGayZgc0UhP8nZUu8jvO0SxqRvpWEHRK?=
 =?us-ascii?Q?feLDkfpmB19uO05HEALDRbw8vUPVOcjQ39FqYj7KOxsvmpzVX3VJ8OmKmrgR?=
 =?us-ascii?Q?XODI89hGnTfh0XVVje9rZ9kYJPCPr48=3D?=
X-Exchange-RoutingPolicyChecked: 
	F+z/ElQLWmf1vGuRpJRzjzktRjD5fnouVjCzqNz4UDlGShhA2OsVxa2UsswV3g7jUsXPm3ImjKDm4KpzkBcbrIOUfBz7OE0H9X10WFYMlmTi/Y5WLFcLyIFRVG8/e8ucNa8rUWZNc/RuByTUNMqqtdVZEVriRq2hW+3bqwtF/+u9EVE9irqeWQ3Gh/DSGqSG2EpPeOb48StFLAgSnrrvUdVAP0XNhIvaQYJc/YsHuIEqwbbE9x3txHD+GOpKFIzdNr8rEDrzl+R9ChClMk6jkhr6zdQEPeFJzwd8EPalFNsoDfPFjCFCTVNpyunJrb04nW78xLAaiQtIiY0q40nMWA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04637db2-1ddf-43d8-baf4-08de811993bb
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 15:59:58.6865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zBV9etUN5865k32HqrZB1X9VYnUlnfXIo6E56oraTmHQwjB2q4L82OxrVoTk/p6o4/f/gID91TK+KgK+uGMW8g7M6HoDNRODmQObo5Suqig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8062
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=ALvEU0hV c=1 sm=1 tr=0 ts=69b43481 cx=c_pps
 a=8Mab7lbrFfecTh0PXXvUKw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=Q4-j1AaZAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=iUso3aUBSlOXKDWHM7YA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyNyBTYWx0ZWRfXwJn3w0+0nilT
 SUaOZHFgaFDuYzNkqjP0Dn/Lm/ZzhUuEMqmD5wZtomKi0zpQvE/Oym75DlfdynJRaIH7vwo0dRA
 /hUc7jOrJFf6tY/WjwyAR8yi5pdX8CUAg7dnTa0Qn4bThPnZdqfNU6vK0JmIedHrc3nxxVliovT
 INW0cIh5jPkyPvxQ1dHMZkpK0XmgwhhkqfWky7VVw/SHTBIWAucLhbVnhqHfuFKMVR21nuFiFdU
 rXU5Am8B+E67alw1ncygf45xCSo7j9zW8TidnVfFmla5uVi3h+mfIC6jVVRRyaYZhKQ24fFYbvb
 t+8Db0TE/6ppKgzUKZQE+lb5D98pjhvecB5EXrybh5XuN8g5ApajeYhU1WTBedMCO5Ek+k5cTq9
 7+XcPYYyfY743Hl5Cgh7Xn31dRdwGVOKGWlgmjdzRZQYWCVwW6WQ+4UodnvlcyV7m7BPwxC33Vc
 QrTj8tH+w3/ethue5Mg==
X-Proofpoint-ORIG-GUID: N680K90RJfSovJZ--CUEv9nJhfCPjdpK
X-Proofpoint-GUID: JkHWLju1_gJgvFpdsT9Z8DRSrzVNttoR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603130127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 16:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233055

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Currently, a ccache enabled build fails with:
  |   HOSTRUSTC scripts/generate_rust_target
  |   HOSTCC  scripts/kallsyms
  |   HOSTCC  scripts/sorttable
  |   HOSTCC  scripts/asn1_compiler
  |   TOUCH   include/generated/gcc-plugins.h
  |   DESCEND objtool
  | error: multiple input filenames provided (first two filenames are gcc and
.../tmp/work-shared/qemux86-64/kernel-source/scripts/generate_rust_target.rs)

Linux rust build infrastructure does not currently support ccache (Opened bug[0]).

Quick summary: There are 2 issues: $HOSTCC is not escaped and rustc
expect a path (and not a command)

Disable ccache if KERNEL_RUST_SUPPORT is 'True' for kernel and kernel module builds, including
auxiliary tooling such as make-mod-scripts.

More details in: https://lists.openembedded.org/g/openembedded-core/message/229336

[0]: https://github.com/Rust-for-Linux/linux/issues/1224

Co-developed-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Cc: Alban MOIZAN <alban.moizan@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto-rust.bbclass              | 7 +++++++
 .../make-mod-scripts/make-mod-scripts_1.0.bb               | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto-rust.bbclass b/meta/classes-recipe/kernel-yocto-rust.bbclass
index fd9ee91c79..608ccc4609 100644
--- a/meta/classes-recipe/kernel-yocto-rust.bbclass
+++ b/meta/classes-recipe/kernel-yocto-rust.bbclass
@@ -16,3 +16,10 @@ do_kernel_configme[depends] += "${RUST_KERNEL_TASK_DEPENDS}"
 do_kernel_configme:append () {
         oe_runmake -C ${S} O=${B} rustavailable
 }
+
+# Linux rust build infrastructure does not currently support ccache
+# see https://github.com/Rust-for-Linux/linux/issues/1224
+# Quick summary: There are 2 issues: $HOSTCC is not escaped and rustc expect a path (and not a command)
+# More details in: https://lists.openembedded.org/g/openembedded-core/message/229336
+# Disable ccache for kernel build if kernel rust support is enabled to workaround this.
+CCACHE_DISABLE ?= "1"
diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 874e16e642..5fbc5c2154 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -36,3 +36,10 @@ do_configure() {
 		-C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} $t
 	done
 }
+
+# Linux rust build infrastructure does not currently support ccache
+# see https://github.com/Rust-for-Linux/linux/issues/1224
+# Quick summary: There are 2 issues: $HOSTCC is not escaped and rustc expect a path (and not a command)
+# More details in: https://lists.openembedded.org/g/openembedded-core/message/229336
+# Disable ccache for kernel build if kernel rust support is enabled to workaround this
+CCACHE_DISABLE ?= "{@bb.utils.contains('KERNEL_FEATURES', 'rust', "1", "0", d)}"
-- 
2.49.0


