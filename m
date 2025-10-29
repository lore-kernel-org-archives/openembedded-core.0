Return-Path: <maganuru.jayasurya@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B377DCCF9EB
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 10:11:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3333.1761732673544091141
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 03:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IY52mMnV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=33970d012c=maganuru.jayasurya@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T9K26L1795345
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 03:11:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=dkxfqHVp5
	38UDPp2DuxSqjwD8YA4Ac1YcH0gE/A0f5I=; b=IY52mMnVz/du0Hzf+vqclI4zK
	FZgr1GE6TaPW/PvH58rXgRQRCKCxlPbz7iUMXjPPBUkyVGOY50A07djbVJ3i3IMQ
	p0kkJv/kQ2A3ccsl/2vXoZBPM2b7/H2wbujVN7qHTcCUMWk33LYwLckLLZE7Gekn
	33mjbvDcroE4raEJWcyzfg/M0MJ8kbFbxyPCGxXfmysk5hC/fZWNesqV6abExw59
	EfjB7U1gmibgma2lfJA8OiIz1mLg+tWA8cVrv0lCvuVJEekXjzvtdg9SLTOYBgAy
	8YIxSKftukXv6ktWDYZKtByr/34Lri644HsVTEkEZodRuOHOefSfr3CtAdAgA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012039.outbound.protection.outlook.com [52.101.43.39])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a34890q6s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 03:11:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xu6IY4qzZm022GbnjiG8jgZKX8WVAN6x6SLDiqss0g6KM+h6SlaxT3cdYG9Fn+NsYX8wJmOUM6jG452Dq7hmTVRe4sJgAjeSQs7jaYvEK5GdaCS7rjf1qjNjEQZE58ABqHhr/srWkNamU/TaOI4deYLhv3h0/2KjSoqRCG0IeetWOxMOoFo9S6nHb9NB0RzxV63d48IEmQYT/4LFNbgJbsX5l2DVvm2bR0vSFOALCPZUyu1w9kLWvGwRBFm9oBiMljpQDLmA61WjtBbQ+KJmT9QW4TWfbd/ozgeqEMx0gqrcEVL/mB02FKKRZMCHOmovRKajgVuqHbcNA9FZpAFBeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkxfqHVp538UDPp2DuxSqjwD8YA4Ac1YcH0gE/A0f5I=;
 b=Ap99vwys7Gnb3QdVde8vo27SyOfE/ROvtrOXgv6IXOkSLn7edFh4bZ1+ikIIsD7ylwMfH3oEtJtCIuleGkH1I6p7T5zWLb9HpxJIPxJsj5E9lwEKKbk3gk2snROeBWYpJ2GF9Nh78DEW9m2HoWUy5JS6Rb+9qpzkYHcDfpYS/MuMM4xOelKsv0sVcL8xuO5+0UyNGfg/oB+jnFg5wlgnh8Bg0T67BZEAtQA/C4ffTgvwDMfl+gNC8tKyso4jKHEMeaQ7J1vtjOBwsbvOu5xnO5F6oX2mBktHuzH90KMrhAl9R+zx2b4lIpwDz0KEpfhdSH7SyDdbpIbM/d/rw/kGZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB7753.namprd11.prod.outlook.com (2603:10b6:208:421::19)
 by MN2PR11MB4630.namprd11.prod.outlook.com (2603:10b6:208:24e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Wed, 29 Oct
 2025 10:11:11 +0000
Received: from IA1PR11MB7753.namprd11.prod.outlook.com
 ([fe80::82c8:53e:89e4:43e8]) by IA1PR11MB7753.namprd11.prod.outlook.com
 ([fe80::82c8:53e:89e4:43e8%6]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 10:11:11 +0000
From: Maganuru.Jayasurya@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, sunilkumar.dora@windriver.com
Subject: [PATCH v2] populate_sdk_ext: include image SPDX tasks in locked signatures
Date: Wed, 29 Oct 2025 03:10:55 -0700
Message-ID: <20251029101055.433186-1-Maganuru.Jayasurya@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0136.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::21) To IA1PR11MB7753.namprd11.prod.outlook.com
 (2603:10b6:208:421::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7753:EE_|MN2PR11MB4630:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f66d342-56b2-4d2c-fdec-08de16d37c11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FY+Yk1bWRplEU3ui40SAdQ2tiopPgEGXYpTkWkmtle3UOrq3SgjVmB4+W6Fi?=
 =?us-ascii?Q?8XS1n21o6j1aDUf4K4e9Xi8s1RjWYaGCUUX8rs+bDh3M6VE75XsrsdSAnIzU?=
 =?us-ascii?Q?pdlgdPNXv+a4HWTtq2pFHQHNXbNu/BTxESHo34tuMpln+IdTttHt1125OHNv?=
 =?us-ascii?Q?pgo1IOodT9jLBZ2HsVlrdKVRjI0HxKQpSel3d8PHOsgK6HgOHMgCAuiahOKT?=
 =?us-ascii?Q?osEM6iH99gNNZcBKRMKwS7bkdm9YcTXfUk4DAKq63nlkEojl3FnJ5pdnp3bF?=
 =?us-ascii?Q?8r2CpCZDu1p82z+C9mx7BdVgF0EJ6kvkyz2QI3XK4Iq9Ip8RfhuYF4H3k43S?=
 =?us-ascii?Q?qgJS6EI8Mp5OHWx0ydj+736qw8nFCh+aktEwf5q0t4bTJKG6NZi1P/i7oOdr?=
 =?us-ascii?Q?B891WowdvAfrNT0uqOmKufPCBNC1ZAxToDmOlBK6i0YRTunU+EoIYsQqgDK2?=
 =?us-ascii?Q?bZGxj8dlUXZfvHf26hynxRey9mEjSO5ggOWSgqEtj0goyfLY8sj0epTMok3r?=
 =?us-ascii?Q?RqYNVu+YQklXlXxSvugj9VkApxAc0umEq4iVz7Teu5SoOWIgc0RFIGobnpl9?=
 =?us-ascii?Q?JUWEl5m0ujv3s8NIz+k+0ByfBunplpCa8Z+2sK07UPDSJc9a2wjaCGmAlCQt?=
 =?us-ascii?Q?d29gCewo9wZ0DDW8CifRevJSSjWlZuewL4p3/4sWl5R0xuo+kBRcG5wNyneu?=
 =?us-ascii?Q?Qncju+lL1jLCfau7oxdsSFKJzGCUXnIIC1G3stKfkmv3xKy0RR+8jK3nWIC9?=
 =?us-ascii?Q?75SwqSabgtrmFNzWyyQvj1o7/1rpZwCPvmbfhSEKH7QWh8kp/DvNKhpiETvo?=
 =?us-ascii?Q?ue7wMGfkeyTITEaFUR0ZsnRst6WEw7eEwYDNDbDafMmF+XaKzb2Fh/qMD7Wv?=
 =?us-ascii?Q?FyR4bExN7QPgwmGNHF3n7MZcmDJ+uYuAXPHncw+/nP67dpMYYqZzk8DDT0qY?=
 =?us-ascii?Q?o9Rslklv+dCnzNctF4ZoWbKBMAjpLyOVLYDz7xpgO+Or20QqH18f+OxGpb4o?=
 =?us-ascii?Q?pEuFTbploD90f4R62cGXDkEjBLjk4269vUVFSv7pzB1tHwptcojwum5kIpnA?=
 =?us-ascii?Q?JyS7FtGrpeDguUtwbQZDgmq0IpGdeqAYZdOXJanDqifHzZvwbnjdUz25yUtw?=
 =?us-ascii?Q?fmSkuAPK3ZBcHkJERfY+OefXtUEBdywJWPwU8HywOjtehHzJvjU08CaAzva8?=
 =?us-ascii?Q?YGAA6lec0dhhPs8vDnFLraUgtSO4UbxQL/Ol3I4PSPs1Eqz2AT7pl8Pcj9wV?=
 =?us-ascii?Q?U7aYSD9zHmwmKP0k99boh0hgHCGCbi22QgdLmVqE1t56VGal/xAr9QGu4B9r?=
 =?us-ascii?Q?DyyxaC9QLCApDd+DYjmiNxvoG4vWbpWYRGeRb86Fdgk80hrwmFMg0AUT+Ki2?=
 =?us-ascii?Q?BrzEX/VFBpbaHFqrATDl63cZ45g7Aw+o1wR0OAU3PVYuj2vGszC8qwPDMVKG?=
 =?us-ascii?Q?mSVJDAvTqIBAsImsQgXebKmoHJ82MAF9tYFBSHoguAnDgaL1RVku0flRQO3r?=
 =?us-ascii?Q?TJDOP1rrInDLEXXbj59ksT1eT4BUGBpEe2OZ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7753.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZTYc4fTtjY2n0LbIgSh2MNjQ7qa+/VUVLO1fpos2LjVydAhenLb5KnLUw25Q?=
 =?us-ascii?Q?WhjzPVHzf+M3bLcnKDPS1HV3HC4oUyAWeT75kP9/7QxMse2x8b3JzgO1+kyj?=
 =?us-ascii?Q?V31J+Vw38azuhH8uVFbE4MoKuCxsd28LZRrc3LnVlltS4pbOmjDy7GwX7z1+?=
 =?us-ascii?Q?HzrDfA8Fzv4s99VD5luspybBhV7B1qkWFVsveap/AIt/irVHFObexEVQO2A5?=
 =?us-ascii?Q?/Wg1HJdPGoBBNzxJwo/VaJjtQhmRuSYX0T4jIA1/JGJEd1i3YkTWpB3JpES2?=
 =?us-ascii?Q?6jILOhVYRjwGCjZo6XsxnU65aKNQb6FR3re43bOOdpsa91horL2eZHGOA4WD?=
 =?us-ascii?Q?4V66oziT+BkZoygXzyjJt4zWrcz4h1qq72s98PaDYD0Eocls7pNzj7oaDvG+?=
 =?us-ascii?Q?lncMfNogwBAGa4G0+52dqazUjUmvOAPZ8S40Jd71MdVbgQCKPa9ckxGztxB3?=
 =?us-ascii?Q?NI052S9RG9kTLVgTD4B+nbDbIm0trqUBbyEaaC2/TB6ZMdCUmJisPDEGRudY?=
 =?us-ascii?Q?3m+QKmRP6FtJ8yq2ELxP1F8GcdJRk14P5S/YNBkXjUvzUKanSyKCXsG1kllR?=
 =?us-ascii?Q?NtHFr6Fmf8miivfB4CEceA+nBkssFP3ixvRsP5O+E7FBF7qjuZc+TqObvOz+?=
 =?us-ascii?Q?6tkL8QYr1wszO3BTPHjgxfd92Upi++AnV9MovH9LxGME2NElIz6OcIAIH0Kx?=
 =?us-ascii?Q?0yxdElrqMwtDTQ1RhgotGa7sg8kPyzpZFsoAUDWWJGbkozgviklkth+pI0JE?=
 =?us-ascii?Q?HDEfv6anDQUbVl7OCdOkl5ng9pnsKezNcSLY+odR/Gf0PsIEZgbyEUA9CdGh?=
 =?us-ascii?Q?kZk/jse2KbD5ec1IxWbk2PIU2mDhKHUnKcM+wm8gMWx4OnXx81TOIoTv0Nb4?=
 =?us-ascii?Q?jkTeSk2cd3ILOSy02Pn4/vpmy3Xe9gt9Un3o4YYD3AI78TVjuvhOX9JGvVOq?=
 =?us-ascii?Q?CSjHqOjOJuJ4Fz1we241i2xJ2tb5XYZHW7FPcQEkZ7VdrMuDD0e3YphvCXvK?=
 =?us-ascii?Q?WiLuXykjCyjBLFeCLSxF558t4sfFpfNh6BEuvBjvi8dkzlUgb3XyVEMdFjlO?=
 =?us-ascii?Q?gIpCUIdee4rwEnfYRsFz7NelbqRYFT13FB9lyEFyVIXMQELoW6+fD4phtF8+?=
 =?us-ascii?Q?gSBuBdzXetfxFzEND0OHMr6l45ANyBKcuplqwoUlmigL4ZQqOeOCYvFrvVy8?=
 =?us-ascii?Q?xaoSXRIPoVHzQpXsTZMx44xHlihq14a6JhvKbwZhNSSv4T8ZBEFH6vUQb6vz?=
 =?us-ascii?Q?uuwX4//P8hO2bm0ctMAcyvbQYjXr0LQG9fkXbxavPtOKr8GLuV0y6hzk8C29?=
 =?us-ascii?Q?gtk88s5+Em+FY+fDzSx9lNwn1EHFQBAz+pN+5TZHT7UoZNhcxwIHibFNyrTr?=
 =?us-ascii?Q?cA80Hddo9bcEpYg2+OoVjNmt11NE8ZibzigirlgpO0FrqA3pgei/u+AvoHD9?=
 =?us-ascii?Q?T2MpxtTNih050c8nlaZJlo2y65AH2e7Py8qFOEvvqn6cQ1+LIBT/d5eOsHsz?=
 =?us-ascii?Q?dtpbCBNuuWwav3ntoR8IVvJFt/pet0mN5t6vJrRmuJJF4Livyyeu3DSvsA+j?=
 =?us-ascii?Q?/gWSB0LozpQ+GGEjO2U4ik5bZNpUVP+oXeVhfwQkpgXlGSfwNRZbB9vpgUfO?=
 =?us-ascii?Q?h6lexAW2hKKLDXzEakMj1B8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f66d342-56b2-4d2c-fdec-08de16d37c11
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 10:11:10.9881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FUvM3vXI6PHa1ZA4/aFpMQ2BXO6o1ujrdnwlRcNshBFtxFYa56xtkYgxZPEM1mHayhyO6pFrS1arh0DGCK6fCdq7K5bVukAD9Blsb4mNZ8fgB2VAy0hG2VyPYB6ewbHz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4630
X-Proofpoint-GUID: PX5oIdhM24m-Pya6NeO6HiGKX9XQXqFn
X-Proofpoint-ORIG-GUID: PX5oIdhM24m-Pya6NeO6HiGKX9XQXqFn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA3NiBTYWx0ZWRfX2ap9XotCydgB
 0vrczUwJEdsKh9oL+tiMUpzSufgc4PXZHP170ibCZ6JtH2s0+p7nz909YqPwdW3M6qNQQXBO/5P
 JhmlsBs9Q/VnKJ6H4GsoqxYOkEvnREjA9I2O3BHwksuTDnOajtX6EIoWfzpp4oyrqU7sJDrwGTZ
 AHrpvHM+MV4mbA7JluTR2g0DVBlwB01TpQhrzIcqodlpQKrn1766c5D1V/+ww4EWuNZ9I3quYuo
 VrThxn3UGsJ24YZgXn/pPPcjh2SXipNOr2sdTh5G4RVWhX7c4OkstghEeYQ23XTOvz/Tlw5gTJq
 ffbpsL5PQeTPtcRIZ4Hgpv9+raP4ZD6UIHWMBv1ZU+M+NmpOUt4X6/nD2mtSzGC9iw2nJP9ZIbP
 4BigLr70Y8Zf87xdHFwgybEOlfFQXQ==
X-Authority-Analysis: v=2.4 cv=HNvO14tv c=1 sm=1 tr=0 ts=6901e841 cx=c_pps
 a=1lugHNwfFMYeWqdp2xp0VQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=oB0nuitKh9x076E_bAoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 10:11:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225440

From: Jayasurya Maganuru <Maganuru.Jayasurya@windriver.com>

Fixes [YOCTO #15726]
Fixes [YOCTO #15853]

After the switch to SPDX 3.0, eSDK installation can fail with errors like:

  gcc-source-1*:do_fetch attempted to execute unexpectedly
  This is usually due to missing setscene tasks.

This is caused by image-related SPDX tasks, such as do_create_image_sbom_spdx,
being excluded from the locked signatures. Without these, the corresponding
sstate-cache artifacts are missing during eSDK installation.

Previously (under SPDX 2.2), these image SPDX/SBOM tasks were not
dependencies of do_populate_sdk_ext task, so their sstate artifacts
 were not required at install time.

Fix:
- Added `do_create_image_sbom_spdx` as a task dependency before `do_sdk_depends`
  to ensure SPDX/SBOM data generation is integrated in the eSDK build flow.
- Adjusted `prepare_locked_cache()` to retain SDK_TARGETS (and their multilib
  variants) in the locked signatures file, ensuring image SPDX/SBOM tasks are
  preserved and not excluded during locked-sigs filtering.

With this fix, eSDK installs work without unexpected task runs, even
for custom distros or "tar" images.

Signed-off-by: Jayasurya Maganuru <Maganuru.Jayasurya@windriver.com>
---
v2: Moved addition of do_create_image_sbom_spdx from populate_sdk_ext.bbclass to create-spdx-sdk-3.0.bbclass

 meta/classes-recipe/create-spdx-sdk-3.0.bbclass | 1 +
 meta/classes-recipe/populate_sdk_ext.bbclass    | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/meta/classes-recipe/create-spdx-sdk-3.0.bbclass b/meta/classes-recipe/create-spdx-sdk-3.0.bbclass
index e5f220cdfa..4fb6b1283e 100644
--- a/meta/classes-recipe/create-spdx-sdk-3.0.bbclass
+++ b/meta/classes-recipe/create-spdx-sdk-3.0.bbclass
@@ -18,6 +18,7 @@ do_populate_sdk_ext[postfuncs] += "sdk_ext_create_sbom"
 do_populate_sdk_ext[file-checksums] += "${SPDX3_DEP_FILES}"
 POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk-ext = " sdk_ext_host_create_spdx"
 POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk-ext = " sdk_ext_target_create_spdx"
+addtask do_create_image_sbom_spdx before do_sdk_depends
 
 python sdk_host_create_spdx() {
     from pathlib import Path
diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index 2859320ddf..2838ca1a03 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -460,6 +460,15 @@ def prepare_locked_cache(d, baseoutpath, derivative, conf_initpath):
 
     # Filter the locked signatures file to just the sstate tasks we are interested in
     excluded_targets = get_sdk_install_targets(d, images_only=True)
+    sdk_targets = d.getVar('SDK_TARGETS')
+    ext_sdk_target_set = set(multilib_pkg_extend(d, sdk_targets).split())
+    excluded_set = set(excluded_targets.split())
+
+    # Ensure SDK_TARGETS and their image SPDX/SBOM tasks are included in the locked signatures,
+    # as they are required during eSDK installation.
+    filtered_excluded_set = excluded_set - ext_sdk_target_set
+    excluded_targets = ' '.join(filtered_excluded_set)
+
     sigfile = d.getVar('WORKDIR') + '/locked-sigs.inc'
     lockedsigs_pruned = baseoutpath + '/conf/locked-sigs.inc'
     #nativesdk-only sigfile to merge into locked-sigs.inc
-- 
2.49.0


