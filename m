Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29938CCD1BE
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 11:27:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.17687.1761218835578506084
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 04:27:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hwb7MjW7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=23915c5530=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59N5KhsR459318
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 11:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=JmVo1nGxzT1BxzTJMMPj2F5PYs8FCrm5AO4NlsMnynY=; b=
	hwb7MjW7jRSE3SgfGn86wKHdC4cWPAb/32CkHKmYk4Mpa2Gv/dPB4FkcXGNapLYX
	CiNbzUhvG+L5QEZ2C+17/VNVpLkc7jXyHr6AQqNu2iwxWvrimQzepHVZ8xD/f7f9
	gZ2GlO0MQST/tsZNj8VpR0AH6tjWGapbCprKr+uNLT9X8N0gs4KUGwRCbkUfGdca
	KkRlNlIu347/rxleMCWuf3MMViKziRB6BWn2sh76Ajh2smvess5fPx+3DfRrBLhb
	ynxITaFaznqI3w5k303UvLC9bKFRjy1qcLil52idUHG3amfyK2cbif4rUGp8ALUq
	HedIaan4MB/nOyXreAN4VQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012027.outbound.protection.outlook.com [52.101.48.27])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49y8atgj6r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 11:27:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DmpNdv5ijQpTm0K91xbUOx2MJkX4FwVsabZcgLqK6FsDMIqrskS2LoF6x7yM1RoAoIOcAtvw4AWTu8VwpYVhhFrVrUJrIPREEt8DUQrSUmuMdFvTqJANNCOli07a8wUdxgHi1XTthBKRJMgfVH1QbRW/Nd3f8870jGDdyyZ+gVyHEqRRrnbFAeM8tbLX1vON2MuOXree/msMuA3LOPqdtZUe5ufmz+WmLvbyub7mPAko4s52pH+AkQYyW4U9wLDC1Vl9W7WDA/C2Xof9bxOL+Z9C/E3t5ZZXfa6aNe1CLQPXbAGJ/JD+cU3o1J2Q7kpPXMZG56jwF6BL5nk8vEXMLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JmVo1nGxzT1BxzTJMMPj2F5PYs8FCrm5AO4NlsMnynY=;
 b=ta5tAs89cP+fXW1XgIrjtL0tB8fa7ZiYr+G3VrcQtsx5o3TuyfSAuLdxVVKSr/zKuDOVmfw6PDAqFUKuYOfngalYGqyYYeC5Sk281o9Del7a/LPr3RH6+GN2TBDZGulqPtNmzfEvddNktFVA+aS70WjIuOM1Hg9zcUILv/wLI9vZzf08/jeu2D5mFW/EDrs3TismaEuu5/JbI6ShC1OnRMtj5UGv497hzzAHl31VbuKQ4PXBiwrR9QiBLY0m0327IvijzuZesV5I/VeZXzG5rLQURgJLB05mosPN3lxf3C3d7Ualb7g0VfvXLImIMP7R6iUVLc88noHa2pYIKjNvVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ5PPF8B3F23403.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::842) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 11:27:12 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 11:27:12 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [RFC PATCH 6/7] linux-yocto: enable Rust support in kernel configuration
Date: Thu, 23 Oct 2025 04:25:46 -0700
Message-ID: <20251023112547.4044904-7-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251023112547.4044904-1-Harish.Sadineni@windriver.com>
References: <20251023112547.4044904-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0091.namprd03.prod.outlook.com
 (2603:10b6:a03:333::6) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ5PPF8B3F23403:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e413925-8e3d-4551-21e6-08de12271c7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?C+gZlYOP6nJlJbMY4iyF3MFXGEg9SBmc0/vnFXZZSQVUwuEjhESUOkuRbuKj?=
 =?us-ascii?Q?P2214iy12+lE2q20uioWPs2dFcucOPkafWnMyV50NQk6bMAs7xzXX4xLQAkA?=
 =?us-ascii?Q?kSjVY60BfT24zrEjsSQ4vG8Kfwkb74UvKcVvGIWzdzasI1yHDJ467vfIMP6t?=
 =?us-ascii?Q?73WbCEVzN9/OdpVyPBASME1ULVDkMAPorRfaJYv2MQd3/jIuXFr4vaR1/LjL?=
 =?us-ascii?Q?ZwC9j3pdhWWEjpkD5oGjGPN5+Sa7+D3tHGWBihRiraRNjFSExEO4RcQgo6Sb?=
 =?us-ascii?Q?NoASUZAYxndL1AatDa/VPmb573A7/nuBSlkgqToxPdmwA7nnuwsEc+ttz9d4?=
 =?us-ascii?Q?kafInnnuAsAtQZrprfIGcoRxyUFyoDtGzbMfv2oAVxzP76AzqQP+UcYcq9Yu?=
 =?us-ascii?Q?8GLsviLNKTK174GMiFqt+z0yak7BdVg4UAnuLUUCsWF/hNca+q/SQ/Bz8HWY?=
 =?us-ascii?Q?zVOab0GRUOEq2VVL+XcZr5JZR5GPI4fgnQzFr5GN88105N0T1N3a4RI0zHa2?=
 =?us-ascii?Q?Ts30k4KkLYHUq2JwlB+cXqU0AfChTl0iGzRIuVV8lyTvxZ+2nTA7LXAiIbRT?=
 =?us-ascii?Q?lu3kJmIiwNca1EKW5XVlhHoLgSuoWJQFTG4r+6ZDsya5geCNEYGElsW94nMp?=
 =?us-ascii?Q?YzJ/r+stQKFf5a6qEEOOGIc/mYTJrdV6tBoLcSIh+mw914mcj0uD22hteGLJ?=
 =?us-ascii?Q?aTqha7DYkXhngETQu/g7owjRNtjM/2r3uQwbU4sxGdFkZo4CPLCgEw6E0XUw?=
 =?us-ascii?Q?zCDv/UKAjsllxGaQRlKtvyfM7TW8a/cNw5EdrWwKhcAdQuxCsWneNUwfmG7b?=
 =?us-ascii?Q?F57+msW/oS4SKvx/Q3HidkFhcyCV/VgKL1G18iZxqPnezZcA364HHlsoEGPq?=
 =?us-ascii?Q?BiM/hfX/tQS9c3yrRGr0JT+gUKtCxkQwC5HNAgUZVNiYivZDGpRBtFW39ObL?=
 =?us-ascii?Q?AlW/Dk0agdl6QBfNTq2jpmsNlv3sysX6clYRYBczraiQZmMYFYUk5GGjUD+k?=
 =?us-ascii?Q?6bzCZ79n5P+6Ytlsg0AvXcfrEI49vxRtdlIweUOSvc1VV4OXv3u3KGPQc3lj?=
 =?us-ascii?Q?dmfCs/9kJzz1IdKeqGfoxy5XIvOgPEAGBLc+2H+NYD1WU42H8Y7ircuK3bld?=
 =?us-ascii?Q?0OQZoxGRTXO9uQT8QGDNxcunB1OY3nfAK3Nh4wInRNFORfj5CaJPZcCKYoiF?=
 =?us-ascii?Q?v1aUqYM0yyx5G6zN/5nyKDbHWvXenFHQGLgM36ETSptFJ810nDg2j3jCZDLX?=
 =?us-ascii?Q?/w3di6REO4ZgFt37J4RtxfmeSQ9qPruOMIjcLd1QNl/67aQNcbw4zHUqnXfR?=
 =?us-ascii?Q?XZcP+nzWg2QFtBOrV1cXGv3ao4NMEkwcIJPr4rSj4xns+XLagLQxuu3uJr9E?=
 =?us-ascii?Q?7c1EP1EBtlON7YeLn1J70r0R0GgAmPBHNgkC9PJX0zIzdGXep62Ts0A0jzGb?=
 =?us-ascii?Q?DVvfwo2E2mNfCwAL31gwO7alT5eXXZ6FRQ2omWUHtZihrOh1B26r6/vOpgaA?=
 =?us-ascii?Q?twi8ATfVSklnKRo9p/m0MZUn/Nc85HliafcT?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WcgPHAL7WQ7B5TqexeHhDS0Z55N6pn+fXhcV0bfegdER5pfVy7sZe2F5cTpL?=
 =?us-ascii?Q?MB8/fhgBeCxWCUcJ0cmOa99HXG1UJ1MVTTSx79et5KYqDroZXDT0/N0E+DTQ?=
 =?us-ascii?Q?aYABtTR0/grhZ4MctIMjul0jgvcF5OA8ZcshXAJJFi6zaq+V70uqxc0P9KB3?=
 =?us-ascii?Q?qh1nsr7wbj2hA5rTlNKxHuePd0ABHbq3bS7a2SiKE/wXzDsqoYrtF4IcYBSl?=
 =?us-ascii?Q?2Fkdq/4TVKMukLffJgMdM0PpleSReerFuEeg1iL3mds8pLFYOo6tZGfr5V28?=
 =?us-ascii?Q?Jx1Eawq4Jxrt03ANhlTiTujznBOKuOr9uMsNUcwrXa4G4lggpXdVMmP3kQPf?=
 =?us-ascii?Q?EUOcqi1oemwZa8eUNxvp9ClCYVmvmk/RNT/KfJpSqlUMBPSB6B0Pkmfp9Z/d?=
 =?us-ascii?Q?fbpXygMgPt/AMLB1a7TR4QFru1HpTYvgjnuPpeFnwcXqxGhELiWPKF51FoVq?=
 =?us-ascii?Q?b6jyyeFU4xkrcLBcqXqt7p4XZy0DWcdN1+x6+gYz2yioZnPOFmqPLSOalU34?=
 =?us-ascii?Q?SlYdj/ttuqGy/EQHbvbc+td98UXZ1zv78xcBBRl+HkkwgKxNhUubcDSzjh1C?=
 =?us-ascii?Q?c84FSMSjBiAd4baaZaqDE81S7F7XfPx1acjV3cJty3zwHdDviU/F33Utr2YC?=
 =?us-ascii?Q?XGHxcPlOPoURmNmBFGGmd5pB1TtbYfErcQLAyCQHraY3E8SeZYA9yqg1jpg9?=
 =?us-ascii?Q?lu6/Xyjb0G3dY07Ch1yuuNN8XS7bb4xmjrFR/6DXnyKc4FKVOzgNKbcX1Gcu?=
 =?us-ascii?Q?J0tnHMgv7Vdase/KDPyDkc2lazYsJVn5isbrWtMCt3mL0skSgd2UJup6xxhH?=
 =?us-ascii?Q?0OxErv9F6K9xIlL7xU2MXRII7CEh93Iu07HxU+QQ3i7iEWKKUH9D+avIq/eo?=
 =?us-ascii?Q?r4ql+fxRvPPNt59vp4CsZQ5Ig18TxPbgmmnApPenmDbQKVQhDi4U5eY94djJ?=
 =?us-ascii?Q?cHtGEMLal0y1eeCyLwKUh8iHPmbkyLhY0qRio/fMm3knl1qXmwvji14KQJrY?=
 =?us-ascii?Q?DWuUoQCz07VApgRYezlv3mFLbn27XwNu9vJOd/noTvEktJWsC7P587aOJnp1?=
 =?us-ascii?Q?QyibHoOpqCWPf+IlKp2AuIQoKsTTEYrYBuiZ/SM8RAm4hLRUyA/37kFisOVt?=
 =?us-ascii?Q?BbKuXNbcReZ2tz0VK4nKyE3DqDZW9JWC9I/lszkn1sJq/zwnEjBBY7PstxxK?=
 =?us-ascii?Q?WyhuCOK1Q5mpRYUSchqduDZ4Q/V+f4n4k8/zwuwgmTUUSGT6cYPIub6MVTSU?=
 =?us-ascii?Q?VFdCnW7HCGXkZyWJNsWnJDO+mGMUNuHJnJ4daRTbL5EHaMHhCADu+bqSHc/h?=
 =?us-ascii?Q?1um3gNafbhwlWkN/SjmJ5qkxgEcTWRv1nluVnx+gr30E5AvlxyF8q46V/Yfx?=
 =?us-ascii?Q?Zyiz0bmML0zJAocAJOYC8CaqAnKuknxExH/aViGGN6jd5J+dETEulveRfTyG?=
 =?us-ascii?Q?ajKWGOwcLGzgcJYV1yk1eC8cBOTV5UPyqtosDJ7L9vxd50gsshrDlimvIPCk?=
 =?us-ascii?Q?jrkXrdRMiP+IJN5xJyH1R4Cq747UgWHTZ7UhVus/6YxuYJv6rPa6FpwpS/uT?=
 =?us-ascii?Q?NOAT6zR+zxqsgiY5PkoE1LPHyqt8Ki/ylul9Ep+aUValBTXw4ic1cum4QSbU?=
 =?us-ascii?Q?sQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e413925-8e3d-4551-21e6-08de12271c7a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 11:27:12.4725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D6jBoD/PODohdqqh4LF1EKkiiPjboxKMKUys+xCFK2S4u8owGwk4ihhdZoVmUd+BcMGjRTc3o3e+fwvLu52Smw0Usy1ma3NwUVONqhy8YxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8B3F23403
X-Authority-Analysis: v=2.4 cv=N9ck1m9B c=1 sm=1 tr=0 ts=68fa1112 cx=c_pps
 a=ijphbjn0GKEIB6My7LrvAw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=wP6bpXLl58u4eWvnxQcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDEwMyBTYWx0ZWRfXyHQpPMYGivjr
 qAe/qlycTK76gbOTAuxIobcVVYPKM7wI20o3qApl1XtArRVOnPl7XEJKDNwE6K3DtK6DE3yxISD
 ktBZWNOLSwW5v6STHnflrl3ThAMZEqamUl2HmFyN/LdTcpahO2lDJywN7p0tmbhINJnt7rEXBAc
 uWlpTbcWVDwG8usMKBJHqZ1h+liBfhdpHET+Lo5yzhwOfVLElKPDMFCsZ6fgxBMaXeGmPWXbhyn
 ItmEoNWlJNR819GwavdhNRPOp3vFlgDSOgdmo518THK1QuB0omceR+yw2EqwWOjXURl8rMhWd00
 AGYMLMIpiWCVGeBrwSyCzw71jYOZPnH+TtQLrZ/k1OjQ5M/JQX3AJtgGxh1SjCOJw8cSySIFxMf
 y9l5NyfUUJYmp53I8/1iVIZRCbGsdA==
X-Proofpoint-ORIG-GUID: RmQrEtjAVNZFsbGPipPGoYShaF0t7P22
X-Proofpoint-GUID: RmQrEtjAVNZFsbGPipPGoYShaF0t7P22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 phishscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510230103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 11:27:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225242

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Add initial support for building the Linux kernel with Rust enabled:

- Introduce `rust.cfg` to set Rust-related kernel config options, including:
  - `CONFIG_RUST`, `CONFIG_HAVE_RUST`, and `CONFIG_RUST_IS_AVAILABLE`
  - Rust sample modules and developer checks (overflow/debug assertions)
  - Disable BTF and module versioning for compatibility

- Add `rust.scc` to include `rust.cfg` via `kconf` in the kernel feature stack

- Update `linux-yocto_${PV}.bb` to:
  - Append `rust.scc` to `SRC_URI` and `KERNEL_FEATURES`
  - Suppress `buildpaths` QA warning due to Rust path inclusion during builds

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/files/rust.cfg      | 20 +++++++++++++++++++
 meta/recipes-kernel/linux/files/rust.scc      |  1 +
 meta/recipes-kernel/linux/linux-yocto_6.16.bb |  4 ++++
 3 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/files/rust.cfg
 create mode 100644 meta/recipes-kernel/linux/files/rust.scc

diff --git a/meta/recipes-kernel/linux/files/rust.cfg b/meta/recipes-kernel/linux/files/rust.cfg
new file mode 100644
index 0000000000..293438e8e0
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/rust.cfg
@@ -0,0 +1,20 @@
+CONFIG_RUST=y
+CONFIG_SAMPLES_RUST=y
+CONFIG_SAMPLE_RUST_MINIMAL=y
+CONFIG_SAMPLE_RUST_PRINT=y
+CONFIG_SAMPLE_RUST_HOSTPROGS=y
+CONFIG_RUST_DEBUG_ASSERTIONS=y
+CONFIG_RUST_OVERFLOW_CHECKS=y
+CONFIG_RUST_BUILD_ASSERT_ALLOW=y
+# Disable module versioning
+CONFIG_MODVERSIONS=n
+
+# Disable BTF debug info
+CONFIG_DEBUG_INFO_BTF=n
+
+# Rust availability
+CONFIG_RUST_IS_AVAILABLE=y
+
+# Indicate Rust support present
+CONFIG_HAVE_RUST=y
+
diff --git a/meta/recipes-kernel/linux/files/rust.scc b/meta/recipes-kernel/linux/files/rust.scc
new file mode 100644
index 0000000000..4686d9ce5e
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/rust.scc
@@ -0,0 +1 @@
+kconf hardware rust.cfg
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
index 2188c7fed2..fda964e78d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
@@ -77,3 +77,7 @@ KERNEL_FEATURES:append:powerpc64le = " arch/powerpc/powerpc-debug.scc"
 # Check again during next major version upgrade
 KERNEL_FEATURES:remove:riscv32 = "features/debug/debug-kernel.scc"
 INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
+INSANE_SKIP:kernel-vmlinux = "buildpaths"
+INSANE_SKIP:kernel-dbg = "buildpaths"
+SRC_URI += "file://rust.scc"
+KERNEL_FEATURES += "rust.scc"
-- 
2.49.0


