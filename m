Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E99A3C44501
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 18:58:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15758.1783537076773516356
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 11:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FmncdAen;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1649b348d9=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668GIA59313644
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Jul 2026 11:57:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=FfoQAW2YD
	jbL1zZd/2hhbXkYdC+NHgP68UVf+ObhCcI=; b=FmncdAenCBbc0JF6RvV0TaMiu
	k9LeGvm81K57Jr9egeDN2va1zKyv/SgLbAaJhtdoGkHo7+BmGqSzkWirEzk/U7eV
	WZiVrTbvMEkXQGbbN5RMQCWwoobjRmbdS5/ZkIVo9exQdw2lF55733eeTrAnXRcG
	aCFusxJ4/3FnK1ApADVnrabNtRAHvB5rl7clLPxntKt/bsx+N408J66RtqXgyB0/
	Lw64CoSTCj3aXFau59hs9twQBo5C4k5mkgTf5Er2qoNyinLDUzi3YQrUNA5ZqMnS
	zWtoqYvAlQLzsPcjUnzqiiJqI49RANLbHDe/ynwkYFgaGQNAzGPo1dD72ZUyQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012035.outbound.protection.outlook.com [40.107.209.35])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f71pe6hj3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 11:57:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qh6S9OW5e/PGz1bgln1s5CF3kLjm60L9yAv5Yw4XxRL0DU5JExm6ra+TcT07wh966j9NoG+T37q7iGyUwwl2drRPrLIGEA1TyNKwj5vFbhSvhwldArIOsXK3uTl9IioqXgR78wyMTAd+wipYPCERHO57SavSfBj5O4F5fit2iZSjn8i3iL8OuiPqJ4A0LjilocHZeUG8SBotFLZJDRs1TKxVj2lPz7IXDGdRGitoJf3jkN5P1zTXckjBZXxmBhbTbg4IZ7A3ppmq6TZkDX91WscdbhtRObz/Wa0qXURypzTD69Ibc6O3VwIpDTAkaFXQayGdlUgN9Y4EpChJ274l0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfoQAW2YDjbL1zZd/2hhbXkYdC+NHgP68UVf+ObhCcI=;
 b=GwOhgkpNSjPj+qKll3SCcetTf/rccIRHxgnkuJkclm4+xqykzeqjP0IoHVR+sVPudoQQa6ZDjLwQN39apffJxpLDIEXER+SfAHlCN956mdnWZ9+8AWTjElPIbHLQuD2tj7G0ORxhvgdqJ99AGSeIZiSUfgZIZHqodEINMb7bUiWqJdkOAR3KdeWIx/kTcpq98o7wjfaigxMqiYtl2qKd7wgt7PE35HB/1vqeXUJeij7dusjX58vkZZBig9RClY5XqAtWpBCnyAD0FUEK8MdDX69sSbMuwUn+YzCOFh0oLjqOhld8KahREeFqxieAjBiABJBLx8uagT5l/R72icnQLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH7PR11MB6697.namprd11.prod.outlook.com (2603:10b6:510:1ab::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 18:57:51 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0181.014; Wed, 8 Jul 2026
 18:57:51 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        raj.khem@gmail.com
Subject: [PATCH v3 0/4] Add Clang toolchain support for kernel builds
Date: Wed,  8 Jul 2026 11:57:20 -0700
Message-ID: <20260708185724.2183159-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LV3P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:234::23) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH7PR11MB6697:EE_
X-MS-Office365-Filtering-Correlation-Id: 676779c1-f8eb-48ad-134f-08dedd22cf6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|376014|366016|18002099003|11063799006|3023799007|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	9keWZmHv9kv9ufdkgzE1C2uzoi3nmZI5QLBayQGE/yKaF68OaTa0IdJJs8YoaU072krTjQWpWoHi7uaq8jVQ0lvLLhhocewS0nFyo8iesHaeA/vYWqI+eqdWa9HRyVBUK1j2o4bSnwvWA2Zy+UlD+odBgG7hOdVgt7q6LfawPc6Pr2MqojkF1ByiJ0nxAu7m+H7w4eanHf9QYJ74go92w3JEuGBgf7+cB/GiUCGklG6l+d3NCfwcvamgFWhBQOBvmEFaSR3v9zhHECg9CkS24JyzM79kA+qewSLk4xbxr1cSrf0rZF4hsLGr1/cjwIAFxh/VG9eu/kdNGNad5iqxSJzDV0PjFyjC2eBdCbPuSBqDBuliVG3tCQBk7pJnLPZaAuYGFj+BhJT4mhcTNPgRjJARXcEH6ZV+Il92K7gXw61c6y1+va6XZF4fV+hanQJR+pTfE9RzdoE1j6/8YXQRpQJfvZwcI/1HDMLsnIBJwMfb3ItmikLUdiC1TIq9nmBqHCBHrbmbaEqbm5CPZMGjSDEbtzHDOQfRqbWy3LdTeQKaVlKhHIjyFzLwiaPtTXjjx0J3uIBhkSIDlsmHWEK17H38029u0CTz8H2cA90PDbLElaDlTkG7ZtMIcDflldZPRvU4/Rg417nY9jLL/TyYKrpdaAozDeySJ6K3LRSnRCsuukpkR3DZbSQ1NnCxDdaFlmnWaTn41D2odaDnYnYJso7eF7D8lAwjyJ7QI6+iuKY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(376014)(366016)(18002099003)(11063799006)(3023799007)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pXOPr2a6XZwKYkzQGHbFc0I4WzfALLJY1BqmZi2NinIrTLIcFCJTGph2SOkn?=
 =?us-ascii?Q?12TPhGlIbrHOkeY7lLDgmAt8yx2MSood55Syh8Mxz+Jj7DW7YrkZjFGgD5be?=
 =?us-ascii?Q?2vnBuXGgSDvwFesqnG9kQ0bX4xFOIy6GlyP8xWydFthX+U3yBjoxpRLe32sz?=
 =?us-ascii?Q?U7muhVaEb/nB7WsPSJY3ui2R6WwbCD5RU/zb7zMDrT4iUk8gsebkTM2m8KnB?=
 =?us-ascii?Q?S/+ghnitNOreX8EIWgKVcV8cX2PBOYbJjuPe58R0o0VwpcbSZkPOczEwMI3Q?=
 =?us-ascii?Q?/Cv41egzmI7LLFREUCfD7fmh7Qwl3CA6sNueesdJlOb4urwmbC9BIvpvVio/?=
 =?us-ascii?Q?DIa5TKw3pjQ/Bar5Y5y3iJ7YPfHhNCCcx9cuOr8GVbyBXRgnPy0dNZSBjBCf?=
 =?us-ascii?Q?Fs8SOJs7TGjmFSwuBzY8E+uQfn1gwC9jB7mzlvpB05tRFfu1w7GMemq9GxOG?=
 =?us-ascii?Q?oS2WVpZb/4dKBVEZ0q96cvXN8oEN6nTI16asYa1z3AgMANampkAbMnvymEv7?=
 =?us-ascii?Q?Lqe7EQk9Tz4kCShpI+MpiUBqQD2iJl/Z9vp5XSwbkL8Ir8AcDPU1FM+2yTYG?=
 =?us-ascii?Q?tFhDlcTqAKX11d7KIGBNBWEmEImjnhjKmk6q9qgDxcTBbv6A5GZjxulkJ49u?=
 =?us-ascii?Q?Rjn2bIJqlomliTEEGmXpYZSFxRBCg4jaQ05rxxO0lGuLwdfI9hyu/x8byNmv?=
 =?us-ascii?Q?IJMZFHurY3DEAEKDUHzsyjGm9SVQE8mweqp+cBNBB1BQtQ9iSw1T/34hWrUp?=
 =?us-ascii?Q?TtYSMz5hqMe/HyJcDA6stecybDIFqxh+E1Q/y6QsCjKFH8/PZLVspBYIiyYk?=
 =?us-ascii?Q?QbRY/eW9H3ePejeS8826uFhwgmvo3+MT4JeNLuFjoaSusBN5E1fYFJb4XbTZ?=
 =?us-ascii?Q?VBdRodt2nRK2UiMZ/rF6jas16C2ZM6ZP0n7Cluauesxl3F/4IBEP55Oky4cA?=
 =?us-ascii?Q?yLZYlzjIPEb/N4Ez19t4GSEOJBYkQRUlAJZpxin0jy6xWh7psqQ8RuYwnykw?=
 =?us-ascii?Q?o9ehD2PC7LXEn7GNFhY+tMUP8QViUHNsvAoi/yXazstD8+TrFVkqfzjSwFRd?=
 =?us-ascii?Q?ZsThlnVxZA3LGW6P0R/5YQfUIyydsoF7TimTTkzw0XezqYtwKaqWxdVvsLFt?=
 =?us-ascii?Q?ptaiRA9DGQJfX1IYvcgslraig1LwdqiHu1/ubEeZxRlqbQQx8f8p/dJAh+f6?=
 =?us-ascii?Q?MPfUQ1wpwG25pw0vxtdC0M/KCq48Fo84ipkJQOw75cvI+ZuUMUu6BUK4bLdc?=
 =?us-ascii?Q?arZQ7H8iBe6uMNpI5i7bYQZsTKtW/EgBIsUqU7+K0jWhGmZsm16xeCncaYpd?=
 =?us-ascii?Q?PiuEBdJ42uWz1WH4pDqsVjw6/MfSdwM2Pr8GTTH7xROpQiaIzd6YXa4vvs1s?=
 =?us-ascii?Q?oofJdbRhfzeXTFhyompZmd3jqya6uLzcgy8p46fsV6JejQpCGQrmvIanx6Db?=
 =?us-ascii?Q?ZpNdJJCyxLPY9eDOdFke7RaBkvKzQ2W1jRy7u0Gyr52d3FopQ8lTVRNFZkXM?=
 =?us-ascii?Q?WRtMoyj1aNo/1DnW3a4CPWoklxKo4l0xUfwxA5cqUxuS/BnQf7JqUawM5X+N?=
 =?us-ascii?Q?ZuiAczvw8PFrXR7CiGwJRyO4qMrR+veqig+LDZXyBKwTlNGGFewW9b+oS0wp?=
 =?us-ascii?Q?IUdT8b/m1GI0CW/S39+BMB5+ieBkgidN9SbqxUryFqfJ8wKNSoVqR6cvtZaD?=
 =?us-ascii?Q?9rNSDZgzMpJqtlCJLaM+WooQwLOZjiOJfRjkNvpYMxg6E1AIU1k/GVTEh7WO?=
 =?us-ascii?Q?Wg0hv+eMaVzJHVYsmeqS/yHRNkoFgOg=3D?=
X-Exchange-RoutingPolicyChecked: 
	qs5nEFherHYO3Ze6WM8AD3afp0YLWQ1tOH30uFeuYJME5IJGLJxEi42Od4cZjW+Bb6gYTsfQai1Rer+ShWlC0HIbHk3jpI6dnhJPpzRomsxUe7rWcD1WS7p2BFrZei9Om+BKE9LD5FaMiZZlO42DIzksUrh6sxdxNPKp48M67JDV1eKnmMzMoN/lKKnKfWM+u7WvM99lwEOFBkZG567QRS9Zrq07amzWS89E5hn2fFGKzoO1bDkwz7jhoSivlbOfOB4eX82IMpHl+lCv7mT4HjbPdQHT6Wf26XUu8R8bq/B0sWqD3mxZwWtrVIZM2Iwm5Nv1URTYGLDcOdQplB+uqQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 676779c1-f8eb-48ad-134f-08dedd22cf6a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 18:57:51.3597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mwGfZz1yctGfSe/tgc0J4lcD15BLVHiNbbwqOxyt2KPWfSDk/iVOHaL0yLFlC8NKz0wcU6SyeN/QNlIiaNRB0WwsUThhK2PJkL2mpOhN+6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6697
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: av5aQBokGvOVSpZ-wyJJ9coEPnhsDalz
X-Proofpoint-ORIG-GUID: GLpMpV6D64qxPQA94NVN-u2izLQ-jUe3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE4NSBTYWx0ZWRfX3MDXJ0PMa79L
 cH6AzkXwNcaOzqid4xS8bKQiFMO52kYGy6yUDKWUei/1ubWszG0lJCCTrjHatTYDXpqNhmyUGnk
 rP9qpqC7tiFHFBKJQ+Uq+gDWkPIKOAu11E2ZUMb2Gzqh92ydqtw4m3nfVaWndGouUQjkZMWnTaf
 uP2Do8RdYrJA6TOqU713h41gUh/2Gsfx+Ud1ymkZGrnJE4VKD+EfpkJkNUsPEJMiwhpyLL2O71Y
 NFK4pn+++vR7XD76DBJcpJJjeaaucwnPB+v0UuiMq3HOo13/65x/D4S6KN/xA43f12fF748vEPR
 zAGZ/W7tumSyWQJ46tW0iCy4HSWXlhPQ3PZXgfnFs8FhGM9zTfINjiF+XFCrpEB+7m32yPMOD0u
 4dCHuPxrSApK9XnvbnDzurFqA1cG0HHXS0zUMa/LYMQg+Lgyd8hQ/3wTsfKr/fHDdJTQRDGxf+8
 S6hfdEmlqVLayH4v1Nw==
X-Authority-Analysis: v=2.4 cv=VN/tWdPX c=1 sm=1 tr=0 ts=6a4e9db3 cx=c_pps
 a=4lv8HNOczMnyBuWqIb70LQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=VwQbUJbxAAAA:8
 a=t7CeM3EgAAAA:8 a=fCfAUIor7MFZMhRFDUsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE4NSBTYWx0ZWRfX9dhcneWca1OG
 si3Zca/KRM+aOZO3Zu+kHgaqc+jvANHp/ivvG1igQqvoa7MaaNmrAPYZrggO0cb9SrmHwluLICL
 DX7/3LcG/IvSylIa1dFuxqqVJE7B9WhDxLieQZAl4Em0hWqOfn+e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080185
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 18:58:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240510

From: Harish Sadineni <Harish.Sadineni@windriver.com>

v2 -> v3:
- Guard against TOOLCHAIN being unset: use d.getVar('TOOLCHAIN') or ''
  instead of d.getVar('TOOLCHAIN') directly (suggested by Bruce Ashfield).

v1 -> v2:
- TOOLCHAIN:riscv64 now explicitly falls back to "gcc" instead of ""
  when rust is not in KERNEL_FEATURES, avoiding an empty TOOLCHAIN value.

This series adds LLVM/Clang toolchain support for kernel builds, defaulting to GCC
but enabling Clang automatically for riscv64 when Rust is enabled.

-Convert existing GCC tool definitions (KERNEL_CC, KERNEL_LD, KERNEL_AR, etc.)
 to use the :toolchain-gcc override, so they only apply when TOOLCHAIN = "gcc"
 the existing default behavior is preserved as a no-op.
-Introduce parallel :toolchain-clang definitions using clang, ld.lld, llvm-ar, llvm-objcopy,
 and llvm-strip, making it possible to build the kernel with the LLVM/Clang toolchain.
-Automatically select the Clang toolchain for riscv64 kernel builds when Rust support is enabled,
 since upstream kernel Rust support on riscv64 requires LLVM/clang (per https://docs.kernel.org/rust/arch-support.html).
 GCC remains the default everywhere else, including riscv64 without Rust.
-Add lld-native to DEPENDS, since the lld linker is required when building the kernel with Clang.
-Fix a config-check failure under Clang: do_kernel_configcheck was erroring out with
 kconfiglib.KconfigError: ... Sorry, this assembler is not supported (from scripts/Kconfig.include).
 Resolved by setting CLANG_FLAGS = "-fintegrated-as" whenever TOOLCHAIN contains "clang"
 this flag is picked up by the kernel build system during config checks so the assembler test passes.

Harish Sadineni (4):
  kernel-arch: Add clang toolchain support
  kernel-yocto-rust: use clang toolchain for riscv64 when Rust is
    enabled
  kernel-yocto-rust: Add lld-native to DEPENDS
  kernel-yocto: Set CLANG_FLAGS for kernel config checks when using
    clang

 meta/classes-recipe/kernel-arch.bbclass       | 21 ++++++++++++++-----
 meta/classes-recipe/kernel-yocto-rust.bbclass |  3 +++
 meta/classes-recipe/kernel-yocto.bbclass      |  3 +++
 meta/recipes-kernel/linux/linux-yocto.inc     |  4 ++++
 4 files changed, 26 insertions(+), 5 deletions(-)

-- 
2.49.0


