Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D2DAC44503
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 15:19:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10912.1783523951049728315
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 08:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=RJK+wwq9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1649b348d9=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3h2D4061336
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Jul 2026 08:19:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=mUbqRZAeKCBBZWQdrN18NFmxILvPgu7bjVvZmvL7Bug=; b=
	RJK+wwq9Iy8u+oTn4YCtLteyCTJR6bamjDlD0mb0hY7EjaHyFTDOmCOyWueDlqq7
	I6E3yeQUOeG6s1oN8ydfZi/BF+VdxbL3OKIkWtQwOHqQ2clWFawnTygAPb8m/kas
	cmfEGgO9t2dxUKF2OTJR6BXcYRMWvNNhS7j7LswwwTphfKF7XCGzahtzzAmeT2cc
	55ZbMbYaYkC+/4h+UZlwEeRpQcdQmjQRZ2X8cMW5wO8Wm/wou/xSvtKFSmiTdvon
	tHfB1dkN/qvCfpcULIHz48e5rMHlvBp7NoNjxRjAJI+dfjTm+1cHeCELhjKBTS5m
	4NXvBEeiAGyHc8hqST1wXA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011033.outbound.protection.outlook.com [40.93.194.33])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f71pe64ua-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 08:19:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zJUJ5qWLFCx1vItrt6O6ynAtNSmvb9P4cZW16EQ52sB4xTocIFHXIJxzwsMOUvbe51RL0Bpiop0KXK4aWQ71dv9E8djwY+1g3tlLG3B14aE8jCk/uPJKJoYWZEXCEeqGBjcg20c3i0kIId18Ffa7mloTvIisXE+HlL1C8oNUAfaSoAKYJ/0diuf8OirUDgVwCyQVDA5fdMEWYUyH1r/Lgs1Wtulgsc4qu+gNrxUeQyf5HDDIx2lD1HhbDkDSra08q6TvBD5y0Bm1YtWYNpi2hj+HG38SkyxZMP5tNSQJoKqyLuCztw+zawZ+X5wwJdcxm27Ku/DZ9j+InbEqE0QPiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUbqRZAeKCBBZWQdrN18NFmxILvPgu7bjVvZmvL7Bug=;
 b=vQ3fUPGF4tLFyiNNpm/lSVb1Y0R4CczM1QIO53TqFNmls5sd4LDIKRJW3YOdEmppEGPbL4SzcZQhxDMgY69PH2M0M1LUmYYXLvbmPLjevVDj80NJx8YBn6UZd8KPDBeOUyYu4rFfFj7N3g3ZHnEDyEosgX/b16TBbpnxBhU38MhgBr01c8Nt4VHrusyt3YclL6FJAzKtxyKrvUdDF8Noe2idjvb6Yf5RBPC92hnH2aU1qnTMXxyNk1VNm0P3SCxuecKn3R4b8heVlr51yNWcuovgqECuSWKKTZz9tkTERo/zwBnH9n2w9FZ8XCIA+otSD3TTo1vlpAiYuxIEsDXT4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by LVUPR11MB9810.namprd11.prod.outlook.com (2603:10b6:408:39d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 15:19:08 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0181.014; Wed, 8 Jul 2026
 15:19:08 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        raj.khem@gmail.com, tgamblin@baylibre.com
Subject: [PATCH v3 2/4] kernel-yocto-rust: use clang toolchain for riscv64 when Rust is enabled
Date: Wed,  8 Jul 2026 08:18:14 -0700
Message-ID: <20260708151816.2115030-3-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260708151816.2115030-1-Harish.Sadineni@windriver.com>
References: <20260708151816.2115030-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0076.namprd05.prod.outlook.com
 (2603:10b6:a03:332::21) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|LVUPR11MB9810:EE_
X-MS-Office365-Filtering-Correlation-Id: c98c1c71-68d2-4b88-093a-08dedd044194
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|52116014|1800799024|38350700014|13003099007|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	dw5BVaoQIrVOkDqRUBIlOmNWFH4RHFO9+milK6nXUzpv+7QoP2uwJ8mBtIhHkX9LOwxw2H1t/73ew9c1eZ2xB2cbPhmIatgc2ZZF+RzI8kTFmtGruN2nyJY/+7ihStFvuWRwnUQnVKERkAoAqI48W2HtNo1ymG6DswgjeymA6uZO/ZB+DM2ugS7HURrO3EmEo+1pKtRjIBKwefZYD60/eLm0AToFVUkz1Lp4kgiMYaYhSxQ3jfC44LyQYpco5ZdOtFu4KnidxTTaBYzBSKelgLjt5qSbQuE2UButvCIg78AxJLA8+mE5a3+f9jEr2ttojQ4kIOByYixEzZkTRZ7QL5u4BFsHyv6doy4LoCMF49/pNRjds9J8wh0oMH8+lNU9ag60F2DBMeEP5MZRM6KTyF9T9CdVd3d/TNTDS/SXtx3/VqDoOx7h/MgDClwh+tZuUTwX6P5Ij4mVrJO47yXZh2Jk59xB2kJvMBfs3TJqUas/wu4IM11a2/NTK7qTLb7Rsg7PVXzTYMnTk4riS5zGgFMfz3kcJ3tBo7sBOzjoiYVKuFCHoZ2fZLdHCbOb+PVYfh1jr86zv5Cn5FRORsPJW9VubFjy0iKZeQ+X87YnH8nbLjgBhhNUNFPHS71jL/S+Xzcf9I1g8gNRdBijNjvLlyiiWAWjyLBZ2w03Ipe6GMzAeAuUTDROOAxLvCIHcnR3cSoAlGT+Kro/mpiucc2Osf3/TX7YLmOTODTUiuyIbfY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(52116014)(1800799024)(38350700014)(13003099007)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OqOKTxWxKcESk0reKOotlZR8rO8nN9lRtQDat3S1HX6ArIhf2QpWjUdq0Bh+?=
 =?us-ascii?Q?zrxZf6saXczhokaifgneXjYIRWztZ1eKlpZ5kTD/hX4ekFagx8bNk4oNgpL/?=
 =?us-ascii?Q?vT/hEAflplHmAzKGPgBCwA9dCzZIXQWsK2YlrczM02dalom1bJxCoSvbIqgh?=
 =?us-ascii?Q?RK9sYKYnlIBarbGvU6g1KQTmmVtl2QMSnKQspgGzjD6E/xZW80NhP1mi0yWm?=
 =?us-ascii?Q?IPfW8DVh7ahDiCP0WurzgHqxGCS8Bf3uYdh52CFGAvZ854I8X/gvGRfmZdG2?=
 =?us-ascii?Q?g2tXnKQvkV0m6NgNF4KUt70zVyEOg760x0wB0zXBQO4a+Xi3ppOSICIyJ/5R?=
 =?us-ascii?Q?MoMND55n9e8Y65Sir2glL4kTIBUJaQBS9J32A4LjgXFv2nTTokdX86Pcb0Sz?=
 =?us-ascii?Q?rovqMYMOtKU4b9f0IXZnftqR+cvUB/7xa+dgIIfNiHC7OrD3u0Q5Yhe7oRWC?=
 =?us-ascii?Q?Pz2YA5NtvAU/2jliR4P3CCIbhUwqNqrOiQXVEmrR9vD8+u/0eJrMGC+JodkG?=
 =?us-ascii?Q?RLvhSVxSvpDD26lXJyKikNzOCkP/YeR/ZdAKOgnQ5WHr54u6qzLptykZu8Kh?=
 =?us-ascii?Q?xjOWU+S7ts+pTetdElwiwhwQ0+AVbzdZpSW370C5Nf/hTMPevEE0f+oalgzN?=
 =?us-ascii?Q?rMm7TSKmCSYaQDkVrK1Q/aOdBb5G7Z29jKgUlKk6d7NtcxqW4TVkC7oV4fj8?=
 =?us-ascii?Q?aZTPcb+e8nhMakhGboL7vjuc6uvkxfv7l3nkNTNvACsuupD4UOffne0lYcMt?=
 =?us-ascii?Q?DfbTq84aISl9lv9sxlHWbSdCRODAmPdl4wJktbGhuvOnv68Db5Dpuxgr4QZS?=
 =?us-ascii?Q?kxnK6tsLnti5CnlhxjXtI51Al5uCC3K+gs/8I1CFlVRYuZEIU/lMGpRFy7tu?=
 =?us-ascii?Q?yhsICnAfHKC0/r6llT6VJGyNbxBhIvRUEyyF+vnM6PBoAoL8HC8aPj9B486B?=
 =?us-ascii?Q?q7+EWLct2hTl/OYL7TJwd+n11iAPT2JRE5rzWLah520IyWPO3Xtm8NMZAxeV?=
 =?us-ascii?Q?CrjtFJRNuKGWU+lN4vK8QSDUftqTZM2j6tpn0UultFkLkfmPov/F39lpZpAx?=
 =?us-ascii?Q?sWnTDadCk779WzrgaAFVg0IVVeSxPf/FtVH7N0aRYw9N3DYpFzG2kpZEDrQ4?=
 =?us-ascii?Q?jkVJKAa/S/QLoYYLrb2XOETGt/P1eYLv5lg4DVpRTPsqZ9XKjDbgTN9Yrz4o?=
 =?us-ascii?Q?HxkM3Vkyv05FV6wv1fjJr2oxFnRRbxePZ3f3PVVa57HOraQVoOJWtfi7gDRG?=
 =?us-ascii?Q?c6B+XA8O0E1JKfDYXuWO3mXbMWp4EsjfeMkrU2G+Ad2epCIbYPbdqaPhbmWd?=
 =?us-ascii?Q?HJ9UbXAhCP97ZQZQs+a6k5XvGWugaoejHsyrMscoNToECb82SjI8qiGqFeQt?=
 =?us-ascii?Q?qTrofeS3P+SJOq918Ie4SspN0WyP9tTVNpUvt9ZGEZcezJf/RMz1EFn+ysTH?=
 =?us-ascii?Q?aN9t7gbZSWv9ggz7gNe9LpZfh/Q/LwN4ytDGXnhXESDa/KxAsCctMm9vh08w?=
 =?us-ascii?Q?5RCUOsTF+GEOQ6OJ91dJlaJ8fKJ8dfCxA6YXl4C4G4vN6PWu9J4mO47aBERI?=
 =?us-ascii?Q?p3G2XkBcVDh8Zgs38sZIAGY43eLcdJ4yCXTJMtX7WXWMeRi+mJA6Bh11KlY0?=
 =?us-ascii?Q?4ulH2VdmzlhKEq2d1etOrXg+WP5cBIGseAKVxEiUYx10jDGGnhNuGEbVRXGj?=
 =?us-ascii?Q?qi1xujzS+Gm0rWi606/CcnXKAmEQ4iuJRYj/NgYXdetn9ryLZ9bf5UL0xm1B?=
 =?us-ascii?Q?bjwlhiVZfayaL6JlJ1vh65Ce4w83TdU=3D?=
X-Exchange-RoutingPolicyChecked: 
	skUIqjM5eJItTPWlCHVnH+GZJDrWq1l0KLjdqcI6bELTxKrQYXGtW57DdlA+J9o10twzhhDlaLOuYg9JWQyDWoKdl0VK6krwS+RVS2n/665Jp480oOFYSQ/tN+W18yMJD599TVJUmWshjQ6x3YOBaEn124LxeSO/bYgeVmESymRY2CBpzmZP3QgyYAWMWmbKNKwmoUnCyMISKYC/E20OH6LfJy7ViTwgbRQK1nf7BFvwHnHIw61Ew/RF9GetBv+MGZqn1XAr8E/QTthQbSNML+9I545N+GOZvlQuxWIvx4aauyrrKnJoYTPwL6V1Vh+K/6iMuYpwOp3Gwp0dEDCepw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c98c1c71-68d2-4b88-093a-08dedd044194
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 15:19:08.4435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 26b6cIQNtf+SaJkbJxBXj6dkiNS4BkNDU17VHSynqzsOT7RmgmpZElQh+VBLPrnkRpbENLnG0liJKCj6If4R/QJTLvnDuxypdiMJrj7B5so=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9810
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: TehBJPkITEfIsHKu42gbGK2j2pCISobZ
X-Proofpoint-ORIG-GUID: i9xH4Ys9dqsWpRKsvRR3qQGVZwJs-s0h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1MCBTYWx0ZWRfX0Rgc4L4mWFnQ
 EL2ZBpj0/gaI9sJgkNuFworlaT498qZlDThTgrW9OuN/tQzeu2/Ep+Rgil2juQhnFfLeCb14PrE
 qNU+CcrgkZDefeW1kNwSWwbXZle7q9lGIsBpzwDd4vMhkQVcnF7USCe/fK9dIZQDu8C62qBiCPU
 TXDLQfojOvyA7W0V3b46zAELG7gmVBx6qOpnSgyoUMNw7ENmh4wKe9qvQ7luFEuYa7ijDhRpTPp
 MdGU0+HiLcaH+xBNifqta2yP4Z931VsMyRWKAEbUn43Wc1T6VuyxABJrX6f7WjBrDavLVT7Yru6
 UJ40l8H79CpTFymUjjubeYlkVrjXzeYwHKMWnplRaINLlWF2mQiY9kW5t3HyOzuGHe6WkzuyXXT
 qALCRSBASgHwPyQvtQQ0R25CXBNgvxPUNhVyraplaIEvrx7mYLEsK9LfTzaoWoJOvVG3zYAOV6C
 Qzn6wYbzS6SocBbvE9A==
X-Authority-Analysis: v=2.4 cv=VN/tWdPX c=1 sm=1 tr=0 ts=6a4e6a6e cx=c_pps
 a=Ik8WVU4vKgjy7N2tmpohTQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=VwQbUJbxAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=8GuF4qZaY04rh7fV96kA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1MCBTYWx0ZWRfX+iECFnF2lQUB
 u9QOlhY+dR6WbD54TPZDhOYyVDoMigl52rIuVTwd0tIlECoCiJWHuE0nButXIPW/uUfqc1imrsF
 1b3IiYOy6foapEOlqRPD2a5bokjGhCcgWdRGsfYBw0R8Kmjpd1Bi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 15:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240493

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Enable LLVM/Clang toolchain for riscv64 kernel builds when Rust support
is enabled, as Rust is only supported with LLVM toolchains for this
architecture.

This aligns with upstream kernel Rust architecture requirements as
documented in:
https://docs.kernel.org/rust/arch-support.html

Acked-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 4e230d405a..5d047b5f01 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -91,3 +91,7 @@ do_devshell:prepend() {
     d.setVar("HOSTPKG_CONFIG", "pkg-config-native")
     d.appendVar("OE_TERMINAL_EXPORTS", " HOSTPKG_CONFIG")
 }
+
+# For riscv64, Rust support in kernel only works with LLVM/Clang only.
+# https://docs.kernel.org/rust/arch-support.html
+TOOLCHAIN:riscv64 = "${@bb.utils.contains('KERNEL_FEATURES', 'rust', 'clang', 'gcc', d)}"
-- 
2.49.0


