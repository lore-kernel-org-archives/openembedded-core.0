Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A4E2106FD81
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 15:59:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19254.1773417592573870168
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 08:59:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=r7mtJfdW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75322bb784=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5e2cF084004
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 08:59:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=I4dg2qeMzBOLoduvxX3HFeL7LAvcrCIb+/4qzapBiq4=; b=
	r7mtJfdW8Mu42+wJS8Q6mWTjCSeYcBlRADkJ9SZsYThzQPkMOpBhno5a201NyYpw
	y2Rcw2fZE6h8TfrnYEXjkqiPlRCa7ycuwMWSpHcEEBZwhW/V3UyYV5RTRhXVXNHm
	+goNJlyuP6i59usgyhMmiKfwTZCp1NdwBJDgwnv4lGW0Pqxx9smBvM0ccMHobtfM
	Dtq84/pKMOMnoUjI4NuuYckSuw0ZjQJ22NmjTemxiSOouSNh0PSJrMKR2WgWXt7z
	5ctwMR/nfVFL25mOMQglo1bziZV2ijVFKrALKtMVMnLMNTWAwQoieZpEt1b2WWJ/
	FbdFEDvu+hHLlkyNfnRbjQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012047.outbound.protection.outlook.com [52.101.43.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh6taaa7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 08:59:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AfG0DSdIOYTZFWmYg+6ZywPVHSBCB8hBaAwG2GP60mfN8RslsJdZ/Eam3vHlExOONlTy9xbCH7NjbjWqITAIuDaTKiTOEImds5XxYyV852Ft3zmJYkcYNOTEEBCarAtosXvgontYfWTyDMg7ORvJ9GPLyfoltm89lkTlazamkQEq9CtYcwn3oMgBbGVaGYHvZUMVczsRiZqqq4uzBKKuWOvnYMpWSSx0XQY2sgKvuB73uGMJMerF8vD5G7SquA8z8ExsDXtCVleUhxea2lxEDUD3JqERaLCWi3+CcSu4tc7x0GWyc5rE/9g69ik4KiXT+Q+83TMZAcBP+jDemL2sLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4dg2qeMzBOLoduvxX3HFeL7LAvcrCIb+/4qzapBiq4=;
 b=PDWgRrMM3dqAyy1Y60tTdI9SPc5yUZ3wVgh64KQoPKn95GBbufFJCIyxVH9i9BJz+b9NcWHlWEpkYSDxSR4QBAbEoOuU+12bo0n7gRa4j/R1hi3EYtpFIpgtXXbhjRfu5mOBeNOZFhXx3zKS8qcRSiq5RUjM3B+zEC3ebPsk4XDGV165DlvYMm1bAj6OikhBA1t80Omg4yB+REEnYKLpFHVDQLDxO8QmO8i5fcbV2oeSXzLWL2Qx11lhbpciUAasLfERY6mkvPyDvcNqolyB7r5HbtanfcH5ZEqx8pZId0RdBPR26ODMo7srmGwSFSm2gJNuuPWNeevcMjWlfz4rmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH8PR11MB8062.namprd11.prod.outlook.com (2603:10b6:510:251::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Fri, 13 Mar
 2026 15:59:50 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9723.006; Fri, 13 Mar 2026
 15:59:50 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, richard.purdie@linuxfoundation.org,
        bruce.ashfield@gmail.com
Subject: [PATCH v9 02/14] linux-yocto: conditionally add clang/rust/bindgen-cli-native to DEPENDS
Date: Fri, 13 Mar 2026 08:59:08 -0700
Message-ID: <20260313155920.2347101-3-Harish.Sadineni@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: c3a03217-af67-4c5b-96ee-08de81198e97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	ZviYQTX3Z2LoOl2gczNaW4P1hcLRE4Z7/zaa3BJwez4XZWlzvvo4eTAJtNwZDqYEAdrD45r7zZD7CBvk+2sRyxyLDG3XB0INuSbJoOQ8Y67LcDAKUwhTn5ptubjTurPEUv7IIaghSf3UaIDgUsKOoje5hzJ2KXSH5M1Novle6zHipW8aKBKKLk1OB9EMxATI7B4r6dAwqYbDT+aESFZysqTxuAl7Uk4pa6Giv1i5GqkANdnwS1v2cddSdQK1M5MX6mEh49yEdterHtWo4NMXzKx5RTPif+mPVCsUcUk0A+IYWbiGLwsjiH6/zi/PskuXDCYCe/Ufx9X5LBObmnrLctOiwnnfg4V3ZZ7aQ9h1vXqSEyhvwoJeDmxoMEMgX8KIxecGuf5AvC8Fkqd8pa67ytfQsA5VN6WAV2a9lr7NK78JlhutlbjviXjtDlwvDk3B/N1MOIM8GJPOPsUdbXBcXA9RkvQfucyMx3M3XI0ws8Z759laZmzjWApUG1K2r5cMUj0xnkavu1SLAS/V79L3JrW9D/kMPxAOdsV2NbWMkgicMkSZaLEZHjXPgy864bEdo2dxFi6pBnuIKp9MFU6upHkQvL38lHkEQoYpd9hsqRHD6q4LYjtxuwlVC/pMXy4fvpnFiNsnukk9745RdjrecFfbbyOS1ul3Z/5BcIxkUdqHqDzAR0DkhPNnbvE1VQ3bVEvnTJXRhAf2Nlig0+jvBb2/omYERRrA2mpDIuUYXPE1DDPMtyKpGHsON/8EKQCkSWyO2nCgz8o1TiIIjHohqEs1AjKlIirKMwjdKC0kR9U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VOmT0NICVhbBcKWDTnfiULFcaaRa3fUtCnfZSyoXwvwXfIRvrVB8odsI0uQ4?=
 =?us-ascii?Q?O6KxHj1+YXG2KVTkjIfeSu7ydwDrLBoNUjiy/N9SPUqLW5WGhldM4o9r1bha?=
 =?us-ascii?Q?x0sbKrOViB9gYK4/4Io9N9X7ArNYuDzRsiLAEf1AnBpWnNFXv02f/OJ2bFEw?=
 =?us-ascii?Q?33z2mK1cKYnsBwCmkkDbOCa54jRvT27K32sFe3uyIa31ffCm/e8E9Oxg6oey?=
 =?us-ascii?Q?Wf46VdEoW6a7K+SPd6bYt+Tt16wdTxrq4Pv531CMzDZJ0Mes/ykiaCgKrKN2?=
 =?us-ascii?Q?ttOfE3fRpGh2ZkRHIzHZg0S3W0TUlhFedk7lv+7qPWfprWwAxVGh2w4LTEzI?=
 =?us-ascii?Q?vlIVq3EWou8GBMm1JYMfyxPOhjxMS3e13g2kEK10RRrZxa1BJN7EsP2jdYe1?=
 =?us-ascii?Q?id/v+w/79tyraNB07lJEHEG5zRo2EvWKFmbjw5cb9tyGLN2th8Rgx0VGMSR8?=
 =?us-ascii?Q?7y4Xn+I9l/ZDWQi+TmTc04F9gefVTj2znsL3jnECesr7/31Fy69LUqSZRlyU?=
 =?us-ascii?Q?0AkUx9KSu9TEOfNPsS0vitDJ7lnJiGc70PEnKrE3RK758vbtWy3Nu/nWG7IY?=
 =?us-ascii?Q?+4Gwom+2xMTo6DQrQWYyNkKScUXdTo6MaUR+jg2aSCUV3jbSXYNg/Q3RrWTG?=
 =?us-ascii?Q?aDFGJWX4ztPQE6lVf55wNy8ftbraMae3DE1MRCIQl54uytmI9gpGV0ETCZdJ?=
 =?us-ascii?Q?LhfyBBHs/pjxHD/jqYaEK7ToqKTfW5leTaeW5KdrRIh/lSMXHmv3+Dg9bMlq?=
 =?us-ascii?Q?aB7zzEBsCsEqH46q8EvPk5ytMoezCJNs/KKuxkH0nE0QIhw3V98JCHg+W48n?=
 =?us-ascii?Q?PMXJK5PC3t1A9wlRqnS70Jb5n1d3oi0hCrIfJLG1SK1IT2r/U+Jgn3Zo3JXN?=
 =?us-ascii?Q?lAZvKg9Gnxwl7tqZTAcxNr3Cx17lJ5/W7T81eRuTYHDZz0ZM9alaHEvVX9k1?=
 =?us-ascii?Q?ergXaMmjuE7p9vTK5BSzjgqOV2vKoxBlMXu73BX+IroDDpT4a2s5jw2oWQVW?=
 =?us-ascii?Q?yFurC/q7c3cPordlncztD/SEBMViMsNQM1lCi4wzGOiLdN8WbRJivUdEzvUk?=
 =?us-ascii?Q?pVWfBKIMeqZqelWxijOYyRjskplUuDTTDu6grigyqU0FvPlA82i4ci0fzFUk?=
 =?us-ascii?Q?E2X+qTKh3mMysUzb9l9GmaOfNsWdXW85CNKNHfVW1nBPxCMtEa2Wg+rBZeBc?=
 =?us-ascii?Q?qEPbeHPQkL1fHO8Mo8NRIfmw/TjP9Hj3DSl+AQQ76mnRguKvSkhO4Qgc0G5Q?=
 =?us-ascii?Q?uS3EohRPka+ZXs0Lmdm5N1+fkfHuNdBblY1UznNknpSi1Op2ZpYty2G4vRVa?=
 =?us-ascii?Q?IE2pRuDYj1tk0JxPYPZDZbUo6Rk8ZfrtnyqY4xZR7BEz/0dPgi8fcMIpCa0k?=
 =?us-ascii?Q?sK0CrYQAFCCa2s1ScB3TU3GjGeuwxfErEGEofG0MIgOoqgUs4U/rsA7HxjTt?=
 =?us-ascii?Q?Mjrulostd/cNHIPgEGyTaZ2Bg3Xaj/Gaby4HECaeMiaKPunlBj77xmETA4uz?=
 =?us-ascii?Q?bMLgQi+Ny6Cq5NTiIkM4FwKJVU8qL3iUz+0pD9P6u+90vWaoaKRUV9burnFA?=
 =?us-ascii?Q?GrpH/G9HK4WnV+85svEUZEZiCZoYE90IJrEoX3StnpPylRWHZ+tb49Y7Rgph?=
 =?us-ascii?Q?Nyh5M7aQJM+xS3hEH3cnoeZ4p/ICOHXk6tyv9c9x30FIqVXsYpwyVJmYtwyM?=
 =?us-ascii?Q?kxkBWU4xF6aZwrk+KRBG18N9lzHvY4YIkbM4WLhmB19x0VpJ0Kum0CdY8ERX?=
 =?us-ascii?Q?FpQk7a7Tz+i86vNteQi0PyLuOZCDaFQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	fLYfM/buEhlYVDpSDejkmh6DdJrcOpQLwcKe1xsnWNreBuJhPPbKDO/Be8V7oRhrCaLFQTpi57KQs42nVprBCTwNR/VFkaeZeBdDgq5MkXy3QUaP7ur1NQcmCOg2v6ukvB/as2qLVx/GYqPMIb04tU9xhAJubrVs3n+w3EJgUIYeOMCMagVbNz4VnVpWyAXSL7ztgWicf44PITC8x9mEhufHT1pJKCIG7RxAAW+LABbRkCR5OAgCBKnRCT2yxd+u/buvWABoYbQoZ8GdxEzJuYiDa6EbFk47UK3ZMeNZGRTbxiXtwIVTwFaSAPYmX44yG/sVGDRgNcseVZw2u4AE2Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a03217-af67-4c5b-96ee-08de81198e97
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 15:59:50.1054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GgVjP7xDtp12SZ/kKVZwmcNAR2olMS5dJ/WEx/2tduCKAULBlXHPrcSbTgnWXR78T1LA0Zpmr6M7MHt/NKjcukdg5O6hivOJqM1/vYfJ8sA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8062
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: vVnNOqt2xGatrqEURQ2XDgIcXYtaF85T
X-Authority-Analysis: v=2.4 cv=Cf8FJbrl c=1 sm=1 tr=0 ts=69b43478 cx=c_pps
 a=P3qATxxxYOxA1bnNUqDMzg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=Rfw2oJpr3f21ZIbSA5sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: G5hd4dpxaQM-TfBmrDWtqkjJlYl2qGmB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyNyBTYWx0ZWRfX1lNfHttgi9uL
 HFjDjOS5BT6UiYvbhdLCfY3GUDZoSGWpikiAK4Fy66PdyPb9KZDXOe+51BHHNSCI4M8uftxDkKe
 CbCQc81s/8IcrQxbc8F2r3bGICyUYhZvnQk9kR1a51iTLUwHQ6LlR5IajqjxLMKmquRiUZ8/W4a
 i0nUpM0LXevnGlBCWc0CVABavmejNoZqvaXtT0caNf2Nv+V3/EJ3JQu1qmAY2fyrfqCMUC4wyp4
 YdlU6pc7gyKqCxxkCjzBTRhgRCTOXk08bXeXJ9QWhiGePadBf8e5CIbjg8a5OAZTdz/6fJ4AoT3
 pAXRfzvuvq7gzWwIkeE6aj0NtEQLTPG8Z8u01DoQIStm/jHO9mtVYG2imLoCoQ6n/FgBxuqbr2b
 VtmNCSxN7aERal4LMbEfPaKkJSr1XOVsXEqwKJqMziydz4UH3c2rgVlTMvYJQnGi8yVGMv6zHzF
 DQ8e3d6LBDM7ktwx2wA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 15:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233049

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Conditionally add 'clang-native', 'rust-native' and 'bindgen-cli-native' to 'DEPENDS'
when Kernel Rust Support is enabled.

These tools are required for building Rust-enabled kernels and for
generating Rust FFI bindings via bindgen during the kernel build.

This ensures the additional dependencies are only pulled in when
Rust support is explicitly enabled, avoiding unnecessary native
dependencies for non-Rust kernel builds.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 4e230d405a..f47873348a 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -81,6 +81,8 @@ KERNEL_DEBUG ?= ""
 DEPENDS += '${@bb.utils.contains_any("ARCH", [ "x86", "arm64", "powerpc" ], "elfutils-native", "", d)}'
 DEPENDS += "openssl-native util-linux-native"
 DEPENDS += "gmp-native libmpc-native"
+RUST_KERNEL_DEPENDS ?= "${@bb.utils.contains('KERNEL_FEATURES', 'rust', 'clang-native rust-native bindgen-cli-native', '', d)}"
+DEPENDS += "${RUST_KERNEL_DEPENDS}"
 
 # Some options depend on CONFIG_PAHOLE_VERSION, so need to make pahole-native available before do_kernel_configme
 do_kernel_configme[depends] += '${@bb.utils.contains("KERNEL_DEBUG", "True", "pahole-native:do_populate_sysroot", "", d)}'
-- 
2.49.0


