Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A67A1CCA476
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 14:47:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10835.1760107673320124135
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 07:47:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=a9YSruF/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2378ef0ff0=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59ADkV3e2822192
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 14:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=ymii4Hkc8
	CDyhw8DUCjc3k0uQmhZWS3bACKOzeHP+Gw=; b=a9YSruF/CSKM5tfIsMviQ9I2z
	JZaGcPQNdpiyAcmrii6bkXOep8OADHM2i2FS0WvXOaG0jbRpISbXxFOR6ohHmrLK
	yrLdBCz8j49f7ZUSRcDx3JIQt+NV+9kwHyCPyYMHAOwbTcaxWn10CHfCZXcc19Ah
	PJBYZSX322op244TN0UCDOYDlOOrum9Wy+HJbgf2aqAI77lQarIccENusiRvRV8u
	S3BO5NhWthfgb4r2lm9HfK6IVdm32HWaBITZ375RQobGaA4SMh0SCFaZAY1tl0Yj
	yZUqqGLHH6HgZeitYfAYLuM6OnGwnmfMEdxZr7tt7kTZH8NS/r83YuaN59OjQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010064.outbound.protection.outlook.com [52.101.56.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49nx37t8rg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 14:47:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJUUmIq+qLGmQJmqGBOiynZsLvvEmCz51jF6LebLTKF2pj8GbMZEdvQ9u35x7YwNA1Eb5UShg3BIjw8901JSnsJYQxTofm1XA8y3UrVcGux6XibMCGp/WgyeTUK5YnP0sqNuIcRCTVR7kM9vZlSoPEpYhmnJsou79KS4Y+4qpJEEJJjI7kDSH1Y1l+3WXTxhX6lexnhDJcmA5axEoeUjVMA82dvn6yZcLs7HmQvpE6hDDy+RLfu7azgcpgc/FH7hVmApeZeXlPACqK5NpaBiJeJPiirSb8L/jnrduNhoa7CqgFsg45H/TwZI3q3LmAWqKq/x7Z36ulqn/g7QPqzDQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymii4Hkc8CDyhw8DUCjc3k0uQmhZWS3bACKOzeHP+Gw=;
 b=v1GUnGwqUi7xu6rNheSS6f76BjcHDVR0LeLlQrvIL4gJIMVn4kUzAnZ4j/YbxFUG4iidvhItLK8OPeITFtOSzcaCVR5J1ebJAYKvv28iSbfBxDs0TblskEoCTBchNjFLACxPnvJNM/cenFUy+TrTFOsfD1T9DnIrGSRCCRz8ZddrNkYaU97oGj6tzoezcDgD0tyVGorBLl0O298I++KPXkkcyT0ndEbboXVTh1WwqDQ8bkLIudch9USzuHMfxRjB0xVK7qY1jloExr63rvpHZ9MJ18rZcWE3eQtoTRsF5JgfbpAc0uKMa9jLJ4FJKbKyrt++C8wpa1a4qZ5WktwmEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by BL1PR11MB5317.namprd11.prod.outlook.com (2603:10b6:208:309::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 14:47:49 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9182.017; Fri, 10 Oct 2025
 14:47:49 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH V4 1/2] rust: Use llvm instead of rust-llvm
Date: Fri, 10 Oct 2025 07:47:32 -0700
Message-ID: <20251010144735.862149-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::10) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|BL1PR11MB5317:EE_
X-MS-Office365-Filtering-Correlation-Id: 55221948-a77d-48b6-8ef1-08de080bfbcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BrI6u2U7UangNV9YYeaXL6E6ahZnd6U0Zjdb2P469LGk0o8SE163Iiwm2CTU?=
 =?us-ascii?Q?M/JszN/e/eTvb2p1gcMY3rfR4keswJw2qz4o8KJ3cIuOeyCu7mmzaa+G/C9c?=
 =?us-ascii?Q?WuzkWqucZqQWPIx9BAncd4dyZVdTyQrDELy/n5/heT2Qm2NyFCv5m59E3U/I?=
 =?us-ascii?Q?57YivVOVJ1Iw/ghvxrPb8DxpDv8Kjfqtbv3P+cx/xn+QgCTPy+AnHKukC6qx?=
 =?us-ascii?Q?E+93icMoKG567lE96cOFnAzov/bNAW3ZvCDwPBOIn0kFZPdgxLPOQKdF5OFa?=
 =?us-ascii?Q?mVsuGqsmORQalX+eK+QL5ho4QIx7SKVWGIMBTGVO/4putPpD9P86MabG7K6A?=
 =?us-ascii?Q?zi33s6gyU2pIOEWBm8uYxqN9QPnDgQA/J7zUaaX6ThLi/hfuAqydtgNVXLUi?=
 =?us-ascii?Q?lc2bfEng/vyTs+mu4uQRdFyMoXLFcVxELnuDRhhRxzSyccc4+H/NJzi/h7wk?=
 =?us-ascii?Q?9fHJZW+09gFTwgAtdKN/Jrdgzdj/wvObdKeTDf7zR0sPSoQc4MbSGjcI0ciC?=
 =?us-ascii?Q?aw/uzlGDw2b6VzoihFNR1QZ8G4gHnQ9xOtk39z/HqhQjTSsNUD+06ip0Fw6B?=
 =?us-ascii?Q?4Ev7vhPkvdeAxC3uEAHgDJYu9+JphxMSKGKLBIQvg4cLsmT46izvhkwcCZgW?=
 =?us-ascii?Q?Htu64EO5sUCIhIibfroNqB91Rwwzceyn/uH7tRFfgcvLisEerMxwSNtPk33Y?=
 =?us-ascii?Q?tSmfCahLCiPHfbh2vCjgkhKKYRxNLAwhsLhn7YgMSxfsepsEoxnCR1ZHyGqE?=
 =?us-ascii?Q?GqiorPfG57HA+ETUCqE7sCI9g6kLjdfkImZ7C3cIAYbyMuIFxf7xOomvLx74?=
 =?us-ascii?Q?VDBnFgjJXvws/5OjjKZKfQwfE/zwt93G/v+mOZLn1qqb9VBo8iq8v6XxtC5/?=
 =?us-ascii?Q?7K1wzC5tTWukTo6ov3AQkRrTAkXQ+m99LuU9JmqgnSfAY+LC4MCcMINmGlQt?=
 =?us-ascii?Q?zMFKmlXA8aLUUbrClSfBi1qvrhzs/VpRry0huTHqMWAN7mOTZ5FBGrKu6xe7?=
 =?us-ascii?Q?MzyausJLeexn9i48DEd78bXCtcGG0yqBx+qN4LteVAs7/EYdxbFs2puGLjU5?=
 =?us-ascii?Q?RsuoAr1bpJZP3igoO3/TcDu1/cnIKDxksTEDrd1p/fthwUVeOULNohIrRtEY?=
 =?us-ascii?Q?LNpP/6iVp0mV0kO5AfG6/wycEhyHjHCaVHNnzaayqaDnSk0DTy93pl2fcDs+?=
 =?us-ascii?Q?HfJrvVZrPVfza5hS8ve0RHm2mL5mRf9Po0nV/vRmF5cEWnXRWgV789z1g3Ox?=
 =?us-ascii?Q?NTeDZom2+8AbyubhORRTtpqNzJ7ntvGkxOEDFgh/iMHt8HfYS/vwug2Olk2i?=
 =?us-ascii?Q?qaOiaYsBATsz/WTeztKyf7yCaxJxvWgjsl/u6PAQ3oMX9W0/TKp5N0ms2vnA?=
 =?us-ascii?Q?ELjwqn6FFY0mqJ2w4uF5/iYRSr20YvQCxC5edE/6ajmDrY10avCiqyiww8/4?=
 =?us-ascii?Q?fnDPLmLClYahaGdFC+wYVY3+cVhTmqnH+bKBPgO1ua6fMaNC/1Qc/g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?U7foaVPT5f41F3kgIqYq0vBTpWTuv0bU5mIhoQaiDa1YbIEWEd7XW/Fwj8oZ?=
 =?us-ascii?Q?TP6Aq4fenrqmMoY1OEsJpYiBVK4f/HRjmVHp+axAPoNjPLmWLHO0x/6UIYhZ?=
 =?us-ascii?Q?LXpxedBRV4IMvInY6hUFawk+ivUBddowqMt8/MokWrUWRe8xxiXV3vJzKS6S?=
 =?us-ascii?Q?+/Oj8CAHDv1jX7odzLQ6orBpUQUXQsCfHW9xekLeBnSV2++ZZvrB9qaFtKZ1?=
 =?us-ascii?Q?AkSS1JKteWC+rIZwI8oncpr7/yVwxe4ZvJHy28TF5ElukCsCEstsoCafXcan?=
 =?us-ascii?Q?6o8uORej260l9R7cWBeo3CjfwznFx+VU2E5Z7PivXwzGynQxCsqMH0gkqVM3?=
 =?us-ascii?Q?1b9n4OYqfVMMMEFTwEY2kun91Erk5hSozmDNZFjh6yumK7jBLNkFj3cIMuie?=
 =?us-ascii?Q?9fXYypwkzPb2uDnzXstBzn500AVTEMrj9UHyQ1EJffZvEXDhmiRnDNyh1T4T?=
 =?us-ascii?Q?zXNBp4ZFfABzImHLqAfuUDfIU4dj9jwWGOi+lVWAOgqtHq6+owGqH8SKXdfq?=
 =?us-ascii?Q?RLtTeMO/tBFaL92Yz0NzrZwt6nAnqR4k+mmTKLsmIR/xQMGszYPA882hJtsm?=
 =?us-ascii?Q?1Y10FuiyYOOkvxINhItZP6Dh52q/qG9dLY6kyD+jDmIKwJOwgj03VW7NzQBc?=
 =?us-ascii?Q?gAMJYcNwC4y+JFrz5aLC/RthpK+4gl2WhKlGuZ3816KvdW9qJtFLLY+L6/1K?=
 =?us-ascii?Q?yMmrCua9bxQaWc9Ta8A0LnOTrmBdwDdMZ6+7LjMlrkGPKfn0xPNvQc8Vh6vP?=
 =?us-ascii?Q?T1z8ufC3PgFLLUtKDAdQS9rRV46cboDRfMolrUrXkinea/np4JV/2yd37bWH?=
 =?us-ascii?Q?5GO+qhAclXCqTUnqhEk/gXlQYHNXg2P0c6YLkzgGNMeMcErCUW/c8CUwIEU2?=
 =?us-ascii?Q?z14SWIKaDKgvoZKB0qRmuAAxyceyhetz8B0wzfKDySmTx1Ma/K2zNq/0rzJz?=
 =?us-ascii?Q?4YlvO84VRbHS8gpmxfwaITnGcF+LMQQIOg7xQ2Mb6zyIA5e9lcCdq8zAvUKN?=
 =?us-ascii?Q?8Rgztgmb1YG7iuqXDKFDE8W/M2VgRpWQxzd7C3ey4GygEEPyyXVs9nwX0Bxa?=
 =?us-ascii?Q?tVyeg1/vNWYWSzTjmDvbfDFYP6g1qZoerWkR133PAHo82pWbmyOcgo2eTDeZ?=
 =?us-ascii?Q?7d2t2tv6sKgUzsADBH0o+L1BBuIz0GMi7vKLp3jpUoMtBhSkJpEXg11HxSTX?=
 =?us-ascii?Q?/wmwMjC1ZOA9Zpvmd7EaP+QsvUcgPRFb53h5yH5lAYV3Kr8kLipVmNDGhZ9D?=
 =?us-ascii?Q?D+phjkiNcuJ8h+ZcdSVJTo30U0KIgt+slSxJu2d5PrYgxKsYnLUKFdhubzvb?=
 =?us-ascii?Q?eSqOmGVW7ZNqFir3gBcn4OrN810Pb24/6pk9k79WPLjwVkjCfPhsulFW4QyF?=
 =?us-ascii?Q?CEbKX1tEnxzhG0JP9x2UQDPxevXdwAgEuIjRL1JjlkmzJI8dH9RRMYSIi5Pk?=
 =?us-ascii?Q?Q8+F8Z/p53WOP0Mgi5O1cqtDMnlgpc0TAIljNjsks6oE/Cnd1K5poAxOhMV0?=
 =?us-ascii?Q?GYDEfCzJXO6MxE39jfd3gwPnpSovPMK2icuXQkoPgv2EO39GDgY0mpHVD+SR?=
 =?us-ascii?Q?ZuW+q59R5LOKlFiTgvbLJ6tr6FTgADqRLrR22ijpx9TGTzARZN6a925EnkPm?=
 =?us-ascii?Q?e0bwgFn1eDstOjSxQXv4G+0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55221948-a77d-48b6-8ef1-08de080bfbcf
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 14:47:49.6340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S4JT9DA8cfrbWdMZDXQAKI7I3RjhpEOwoLvm3rGAR6+IyqMSkM6iprqZiil3fwa6Dfiu6aFaRsXntyK6wwz6Ix81Nxj11W9J2vUIFytpdHQlZq7La6u7mmKcM7GNeuwS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5317
X-Authority-Analysis: v=2.4 cv=M9tA6iws c=1 sm=1 tr=0 ts=68e91c98 cx=c_pps
 a=tGbvjRCxuxMasaU8K2d5rg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=ei4SEBeUAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=otyb4wlk5IuCq7cbqQYA:9 a=Hqou25T6mLgA:10
 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: JGxxTE5twfQYCjAST8J0cOEbBSVeaJ7i
X-Proofpoint-GUID: JGxxTE5twfQYCjAST8J0cOEbBSVeaJ7i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEwMDA4NSBTYWx0ZWRfXwHsPAkgGc5lf
 5gqNL7gW2uRy0suJD4wNErar5yrgrlYpgGNH1gFF6toQk32zj4MYSwamB62ST10ozKQ3OJzjqCW
 y66kuDNQLLOAMK3G3h7DziXOu7lK3FEmaIU5yYoAGZnT/hNlt3LdYIf5xqDvgXzC7764pubUdaf
 EtbFstJRqXeNCL37qjpfPLb+1pOf8i2kznrKlLgSCCxG4GKrbl/lq9TfFtHLKFrO3Dwi1F+ZHCX
 7AQPT0E+8Q3OLYeJrccHzZdsUhj8MPaXSDFeuC9d8tTk1Ug9sp6Ph7lEXHi002bO1M3dhIdk4sS
 5Lb5jFklhGCKwbYoOLOEOa+GVyEkHdHLf3qkYafxZssALo/FGXFdIFJUbPiKoaSdxm2IxglMFGy
 LXJSWs3GWjwG4TbFVw2+EC/B4qU0vQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 bulkscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510100085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 14:47:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224687

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Updated the Rust build to depend on llvm instead.

*Summary of discussion with the rust upstream about using latest LLVM instead of Rust maintained LLVM fork.
https://internals.rust-lang.org/t/can-we-use-proper-clang-instead-of-llvm-fork-what-rust-uses/23489

*Upstream LLVM is generally compatible:
- Rust does support building with upstream (vanilla) LLVM, especially the latest
major release and the one or two preceding ones.
https://rustc-dev-guide.rust-lang.org/backend/updating-llvm.html#updating-llvm

*Impact on Yocto Rust upgrades:
- Rust upgrades shall always check for updates on rust forked llvm and backport
the relevant patches to llvm.

*Regarding the rust forked llvm local patches:
- There are no local patches on rust forked llvm other than the backported fixes
from llvm master.

*We are copying the natively built `llvm-config` binary into the target sysroot and running
it. However, this `llvm-config` has compile time dependencies on various other arch's LLVM
libraries because native-llvm is built for all oe-core supported targets.

Attempting to work around this by symlinking the missing libraries from the native sysroot
into the target sysroot leads to mixed architectures in the final `.rlib`. Specifically,
the object files extracted from those symlinked libraries within `librustc_llvm-<hash>.rlib`
are built for the host, while others are correctly built for the target This results in linker
failures due to file format not recognized.

To resolve this, we now build llvm-target also for all oe-core supported architectures in
addition to the native-llvm build. This ensures that `llvm-config` and all associated
libraries are built for the correct target, eliminating cross-architecture contamination
and linker issues.

*We now add these flags "-Clink-arg=-lz -Clink-arg=-lzstd" because of this following
diff otherwise we will get errors during link time.

Setup in rust-llvm
-DLLVM_ENABLE_ZLIB=OFF \
-DLLVM_ENABLE_ZSTD=OFF \
-DLLVM_ENABLE_FFI=OFF \

Setup in llvm
-DLLVM_ENABLE_FFI=ON \

*When multilibs enabled:

llvm-config expects static libraries to be located in the lib directory rather than
lib64. However, since we are copying the natively built llvm-config to target sysroot
and running it and llvm-config doesn't know anything about lib64 existence. To accommodate
this without breaking multilib behavior, we are creating a symlink from 'lib' to 'lib64'
directory.

Previously, when we depended on rust-llvm, this worked because we specified:
-DCMAKE_INSTALL_PREFIX:PATH=${libdir}/llvm-rust

With this setup, llvm-config was installed inside ${libdir}/llvm-rust, which included
its own bin and lib directories. Thus, llvm-config located in bin would correctly find
the libraries in the adjacent lib directory.

Even when multilib was enabled or not, llvm-config would still look for libraries under
lib in this structure, so everything functioned as expected.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/clang/llvm_git.bb   |  2 +-
 meta/recipes-devtools/rust/rust_1.90.0.bb | 17 +++++++++++++----
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/clang/llvm_git.bb b/meta/recipes-devtools/clang/llvm_git.bb
index d2b060ff88..2f47af8d7a 100644
--- a/meta/recipes-devtools/clang/llvm_git.bb
+++ b/meta/recipes-devtools/clang/llvm_git.bb
@@ -27,7 +27,6 @@ OECMAKE_SOURCEPATH = "${S}/llvm"
 # https://github.com/llvm/llvm-project/blob/main/llvm/CMakeLists.txt
 LLVM_TARGETS_GPU ?= "${@bb.utils.contains_any('DISTRO_FEATURES', 'opencl opengl vulkan', 'AMDGPU;NVPTX;SPIRV', '', d)}"
 LLVM_TARGETS_TO_BUILD ?= "AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;LoongArch;${LLVM_TARGETS_GPU}"
-LLVM_TARGETS_TO_BUILD:class-target ?= "${@get_clang_host_arch(bb, d)};BPF;${LLVM_TARGETS_GPU}"
 
 LLVM_EXPERIMENTAL_TARGETS_TO_BUILD ?= ""
 
@@ -37,6 +36,7 @@ HF[vardepvalue] = "${HF}"
 
 EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=MinSizeRel \
                   -DLLVM_ENABLE_BINDINGS=OFF \
+                  -DLLVM_INSTALL_UTILS=ON \
                   -DLLVM_ENABLE_FFI=ON \
                   -DLLVM_ENABLE_RTTI=ON \
                   -DLLVM_TARGETS_TO_BUILD='${LLVM_TARGETS_TO_BUILD}' \
diff --git a/meta/recipes-devtools/rust/rust_1.90.0.bb b/meta/recipes-devtools/rust/rust_1.90.0.bb
index 5d804c7398..0f154c981e 100644
--- a/meta/recipes-devtools/rust/rust_1.90.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.90.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=11a3899825f4376896e438c8c753f8dc"
 inherit rust
 inherit cargo_common
 
-DEPENDS += "rust-llvm"
+DEPENDS += "llvm"
 # native rust uses cargo/rustc from binary snapshots to bootstrap
 # but everything else should use our native builds
 DEPENDS:append:class-target = " cargo-native rust-native"
@@ -28,8 +28,8 @@ PV .= "${@bb.utils.contains('RUST_CHANNEL', 'stable', '', '-${RUST_CHANNEL}', d)
 
 export FORCE_CRATE_HASH = "${BB_TASKHASH}"
 
-RUST_ALTERNATE_EXE_PATH ?= "${STAGING_LIBDIR}/llvm-rust/bin/llvm-config"
-RUST_ALTERNATE_EXE_PATH_NATIVE = "${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-config"
+RUST_ALTERNATE_EXE_PATH ?= "${STAGING_BINDIR}/llvm-config"
+RUST_ALTERNATE_EXE_PATH_NATIVE = "${STAGING_BINDIR_NATIVE}/llvm-config"
 
 # We don't want to use bitbakes vendoring because the rust sources do their
 # own vendoring.
@@ -199,7 +199,7 @@ rust_runx () {
     unset CXXFLAGS
     unset CPPFLAGS
 
-    export RUSTFLAGS="${RUST_DEBUG_REMAP}"
+    export RUSTFLAGS="${RUST_DEBUG_REMAP} -Clink-arg=-lz -Clink-arg=-lzstd"
 
     # Copy the natively built llvm-config into the target so we can run it. Horrible,
     # but works!
@@ -213,6 +213,15 @@ rust_runx () {
         fi
     fi
 
+    # llvm-config expects static libraries to be in the 'lib' directory rather than 'lib64' when
+    # multilibs enabled. Since we are copying the natively built llvm-config into the target sysroot
+    # and executing it there, it will default to searching in 'lib', as it is unaware of the 'lib64'
+    # directory. To ensure llvm-config can locate the necessary libraries, create a symlink from 'lib'
+    # to 'lib64'.
+    if [ -d "${STAGING_DIR_TARGET}/usr/lib64" ] && [ ! -e "${STAGING_DIR_TARGET}/usr/lib" ]; then
+        ln -s lib64 "${STAGING_DIR_TARGET}/usr/lib"
+    fi
+
     oe_cargo_fix_env
 
     python3 src/bootstrap/bootstrap.py ${@oe.utils.parallel_make_argument(d, '-j %d')} "$@" --verbose
-- 
2.49.0


