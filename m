Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07E6FC83F27
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 07:59:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7186.1753171146372417793
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 00:59:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9298434120=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56M4OXg83385850
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 00:59:06 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 481vqv0frk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 00:59:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FCkwRhXKdOVYby2HaaJLn1j8dp9qpYrUjQXPT6jQuz7w0ke6yTjdWXhEYOhdeaDUrDgIAYQypaPpBM+7MXQn3pL+/1T9vsypx0mjpPQNdgxCGPrOoYi9FW+iW0tbJNgo+ZQVlu2TRxqsYqIqfHuxATTpDqamMYZ4IfpYjMOb5OKmEMQsmfIA59HerXEfE8YQvU/+GuEuwZ9WrdxQjvT375Rt53AMB9zvIDDC/Ig9+HOB2vMf7RDbpck8oK4RTy7jHpkYxz9i14CqcWOf29qzMXGc4IcX106/I06aAbY6PmKy0d1jln0tAtK7Z+xUL9qHIrwKBV1EY9mswHpQm5yYuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IbXZo+nSG+aJ74y60ChMHm+FYw72i8nyPNzVgT06ypU=;
 b=G4FtU6fme9uguVyAJs3ieZaWtM9lUeOJqyI2oipIbIjjIMbmuRUoQvppzN1qu6rVyhqF9wR5pB/ihTnWnAesdsvmUBonGvd92zGTEtJVLDcEBwVLcDnYC7V19l+ILKAISftOAC0Zv9/P1I1Qlkj4Q0+Q8E1U49hui3QC4Z8/AWl1ocdbpdJFpH4iCfMkT4HH8FtM8KJAJtUvUw5vpapHQsSyog/zo5UcdmYF45k7B6YoQQDpFaESwzS1O+F1Rhfi/aIFOIKhKFl/OZeT0agQLyw279z4JwMosA3IQXMrchNdGYJQuETLsyY8uBL9uRn9QrnRLxvHAOIi4QWEfkT5+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ5PPFD56C4208E.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::858) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Tue, 22 Jul
 2025 07:59:04 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.8922.037; Tue, 22 Jul 2025
 07:59:04 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH 3/3] rust-cross-canadian: Add target-specific environment setup support
Date: Tue, 22 Jul 2025 00:58:39 -0700
Message-ID: <20250722075840.664002-3-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250722075840.664002-1-Harish.Sadineni@windriver.com>
References: <20250722075840.664002-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0026.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::39) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ5PPFD56C4208E:EE_
X-MS-Office365-Filtering-Correlation-Id: ed48b523-f581-4652-ed94-08ddc8f59edc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kj1VL8tgrXEOLowkoZSxy919bP8j6ktwwQmX7+LrRRklVhh2X0MBB4QY6rQD?=
 =?us-ascii?Q?j2AzwS4uTXVNxl7NQYLpdE9UrfUh7iJU01/isDOO3riHlR2pYpOWF1Zf+mlE?=
 =?us-ascii?Q?5P/jXoWbhccpfLcdUhbp36s0ZHEuuc9ZrCUb5VbL/QuliOMxfHiozfL6VFiK?=
 =?us-ascii?Q?hFhcdEfupbLNIz9IDGOlxoyd/RWXOIflCWLaeeWvGiVqUAKmd3jep+yDmeny?=
 =?us-ascii?Q?Qiis3M1mx4KgbezRLswKFY1a/tnyrl3DMxT6pFZWHV1CWbxQKtL+4+PSj9uj?=
 =?us-ascii?Q?E+bqhKniKOL9Cy5RAGFe2HnIsz0UTdk9LgaajLIagX9nKFahK/iYcgcb7aUk?=
 =?us-ascii?Q?k8ElxPp8/sNstzwRB3sX0llSK5fCuyYtoU1x7qfyPjDFuZfjhWVintX9XDe4?=
 =?us-ascii?Q?4pzoCNq4pEqZl+bJsLJyeLyb6zEtZITgbrPsDtVtrRpMrlR0g19AzBOhcHLr?=
 =?us-ascii?Q?qjJxLG2ZR9NwulnhHcIHE2+naAho80Dn0XO7pkhxMayAZJXZjYpr/5XQaGX/?=
 =?us-ascii?Q?EQ4l+2IRiipNWwk0sZgm+08Lusj+0bDYkiVKTD9kG8ebMsJzVOJBMaWhY8nM?=
 =?us-ascii?Q?QmW9G7LKySFWfb9R28YmtXZ8cnuyHOscBDCIf8j3SAZaT21j0DHb9/iyCt3P?=
 =?us-ascii?Q?x8ZucSv3jR0B43wn+20KipbmuXXBl1eAJ7DS1meC3H54l3PFbbecn084TCqh?=
 =?us-ascii?Q?LMJiE+W6w1DRuqfzegXhIbcBGdPnLdKSpb9znp5PlgFjCLe8CT1OPwFBMdBd?=
 =?us-ascii?Q?muGH8bexLsoGXvXj6HlU/fA+GANvlnwIWVNPKJCdWU+2WGWx/nqScvzBkPTk?=
 =?us-ascii?Q?ey12q45GHKnB/QvvIzN9/JC4Vm+kqXf5fH5XB8GmyPE4JNutiN07sdV82xdM?=
 =?us-ascii?Q?WVTaWMcSeXQBOB3EZ2jgHu3akjU+JqkFir6dXysrQF98StTBkU6+QycybhYu?=
 =?us-ascii?Q?YsnqdyvhTeSb+naFiWlh6smE4VAOH5OGkJBLyZaa/C5HEEsj++nWijeiwcfu?=
 =?us-ascii?Q?vTK5aoODJOZMiudYY+76Rq+d84VIXLry2VPaSYojaWmYE95WEReH/5qfSUSg?=
 =?us-ascii?Q?tlKvcshRg5Mm7e3YBUdmOkLWZ1YWcrZ5rpYeLMkPXTN7C1iTrL0i8LGPuyvs?=
 =?us-ascii?Q?TX9Pm20gVkJbgHzyaDmYanAmyxouHoAmFzK6DkoO+8f76oE8Fy20ThagneRt?=
 =?us-ascii?Q?oBxPIjGk3hwfUmXMUbOS6RK0UWqAgL3NiUiHUtTAtn3IA3GWGmApskReZchi?=
 =?us-ascii?Q?VTj16reMWVq2zEK7C9iOqfsQy2tZpcRQNulpI1w1MwDkqbCnj1LO9r90hE7d?=
 =?us-ascii?Q?1H7925p+RUIIr2tK15KAse0tqwA2mm/P6RvNMNBq0pJnhLBde5Ne9v/qJcZ5?=
 =?us-ascii?Q?F3PFZLxqWXdDF0WQyuSGAqLWH7X00Iyba5cEBq7MnISwAENcd4UONOQ6Thuu?=
 =?us-ascii?Q?7uOwwH7pbgwhX+2wDavkT6w9G7Io3zE43+L4yGzL/ZIHwOCwwRatKg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UR+2uuW7yMUHAuftRd3rXP7Vlgr95Is60bO91vQeRTxj4ApOeoX1ScgCPYrx?=
 =?us-ascii?Q?rJyhf5aI71ujAaRiPrN0LrbvjFjLpxBreTffavldH12EmegnU2RRXxIBwXOs?=
 =?us-ascii?Q?hGHpZUgWSFOPAmp9607LvuTmr6yi5gDfMq0aNR1k/vXczCkVL3wijT+pxn1G?=
 =?us-ascii?Q?nySOUTp1cJ+gwaKef5x/bJwamj3occOMkPo29iMbuksTF/ftOHnmKUO2QymS?=
 =?us-ascii?Q?NfvRQcGCp4ry6tEvgFjPkLv/l15pi/Sjkxa6+Y0uj84VB+NFPkPAxNPbklYb?=
 =?us-ascii?Q?hLn3ImWtPLRiUyvIpNbFM2u1c0K2i7JPU2p+gf0FCoLXTeh6BMvevBSGUITN?=
 =?us-ascii?Q?KdF2P8wAU1+pfCN3C2MfaXVBY9WL2ZH2k0SLuu6LbrFRQWeLtDUhyqx+gMJf?=
 =?us-ascii?Q?X6DHsc75nRk05CDZf/yd8Wi1J3qK3zJ6n40imSX139V1E4cSHXzX/Vyv6V6A?=
 =?us-ascii?Q?bGR0RJyU+viWvMxkXdFBf2RbSiHAdxNT9wPgELcdk14WsNXljbCh5G5t7LBo?=
 =?us-ascii?Q?4wKN4lEBORnXQsozAjUjTgk8fUvsN1LRY/oF0h9Rtmf+2Q6ZrxTOYpfsYjec?=
 =?us-ascii?Q?jNqQgf7cSpL14Gw2LJu2CSFO8PLDLlDAZSTN+WsSoOQse5fmWzx208K+uCm9?=
 =?us-ascii?Q?2rEC+/qZ4n5G/gZjDpy9XmD0h6z01XaPWLHfSKajfJxAK4xh+LKgltndE/UJ?=
 =?us-ascii?Q?zDf/5/wnxccXFPy+Qca70MmGCkzHEbi2WeS7DtcCX/w9dx+woXao+1ywJ0b8?=
 =?us-ascii?Q?WSXE2p6jhwCggh/XRJ59itmoAAFPHZU7AFja1idxkWSjfWkM4pcUoV7+HOdq?=
 =?us-ascii?Q?kP8KvWqmV6+ma06osngGGd0RPHLtHSuAyTinbrIRtwCVZQ/ZGfoLxkvKdyt5?=
 =?us-ascii?Q?K49gHLH1sE9Pz/hB9IFy1P9eaSt20CiCjbOPequYJmwZUilEIJU8kDLsNgXn?=
 =?us-ascii?Q?bWMg49FNW6hMeAItUc5vz0FZMCqfv3HC9J72mQqwYbEFmDClHCCJLKCbzaqY?=
 =?us-ascii?Q?gx6rO3bCRhFguNpzFKMEkXoEPnIm0N4xkhTZ77DETjsJ3vMysV/i8i/ZctNK?=
 =?us-ascii?Q?8ieH4T2RVt21wqvZLCRCf5/8KjIZX0kTPU7fYpJgRwqEjjpvfEJ1f/PkUt27?=
 =?us-ascii?Q?DNTwJuzFvkhESVrW0uKN/awT8bCeECrDVc7NaNQ6Nf5G1u9RhvfxDqw8bCtI?=
 =?us-ascii?Q?UO5k/ZfzdBfuJlyvuTgmKY/ts1RYRt/vkRAptGG+9lkaVHvxoLXnv0b5XING?=
 =?us-ascii?Q?ETJM8dAPNSo2mXlgTYzBHwUxPKyzJHwIyvP6m89tPvimifPPCimMANjU1FTY?=
 =?us-ascii?Q?TW5ihxV4hT50XwIG+tMg4Fn/gTnf4tuiUSZnHhCdzUGqtq/WzvyCu3zLwJ8n?=
 =?us-ascii?Q?qoel3T4gCUSEnHWCrBgzJvYMfdqJHwvtXJTyyZN2+SClLvEcEmN4uRM8cmUS?=
 =?us-ascii?Q?eDrxTdeVR0HCsQQW1F7yG1ElMQhCUhtapyFARwxUTP4hd4Pkmvh7whypY0+v?=
 =?us-ascii?Q?2/TrkgUelP6h+ipCa/7WYDeIZkeca2bTGoDOaNPnJ00AE8zDJQZb/cat0aQF?=
 =?us-ascii?Q?9auJh1TkiH3PlSb0G4SvFcnisbVtpCwo4m148n9PzJj6fa6Cd1X6OXW8ah+V?=
 =?us-ascii?Q?KQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed48b523-f581-4652-ed94-08ddc8f59edc
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 07:59:04.2062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: evaKGOLuSWiBaEhe8kF8tF/PQ14w41nB4EzIV+UZ2u5L7EhRCKPhk3qCWAzU4HSSWjiUSyTrgz+v76GxpJoNaF/sebSMb6r3/EXxTwSezAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFD56C4208E
X-Proofpoint-ORIG-GUID: 53UjykW7lRSyVBqcUl1Im2BVytsidWWj
X-Authority-Analysis: v=2.4 cv=coubk04i c=1 sm=1 tr=0 ts=687f44ca cx=c_pps
 a=FPEtuPkCzHsnJ8XfbyoA9g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=t7CeM3EgAAAA:8 a=d0bnlDB7liAsWXr5pGsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 53UjykW7lRSyVBqcUl1Im2BVytsidWWj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA2NCBTYWx0ZWRfX/e08pgVhkoPM
 Ub3dvRPT4oJe1TyFe1Eh0gZjsnERgzmT5mO5V4liWwgHeha0Wa4z76gJDzADz8UGztsqIJQ1uJ6
 DSmZjC210jbYicmyOsrGEcBGdFUmVAruHlD9Y+I6htxVr0my6bby9EnFcahqiJ7toMaG9sMIk/a
 TRbb2D2Z4KbGrTMcPNCq2qhz5nIJRnQVkU9InTdw8+BEaJgwR6qs+Mgu96VndDUjgigQ6bWvkFg
 ZVv/GnKwoNY35Nks3N6MvQFq52QVGDU+lclLZhHjieOLJ9tzFzzLWP+Ing345Kwygg6PxKGFRCz
 I2LxyWg4ZdIA5TxYHF849TV/sDf8CJ/Uv21rfx4BK7xnWO+7AM2UkIvviSRy+qX/PrWDEnHEY3b
 ZHU+4JY5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507210183
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 07:59:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220724

From: Harish Sadineni <Harish.Sadineni@windriver.com>

YOCTO [#15061]
This change introduces support for target-specific environment setup scripts
by placing Rust-related environment initialization files into a separate
`${TARGET_SYS}_environment-setup.d` directory.

Changes include:
- `rust-cross-canadian.inc`: Adjust installation of Rust and Cargo setup scripts to use
  the target-specific environment setup directory `${TARGET_SYS}_environment-setup.d`.
- Ensure `CARGO_HOME` is target-specific to avoid conflicts when using multilib.
- Updated `FILES` path accordingly to ensure correct packaging.
- To resolve the following error when running cargo build for a lib32 target when multilib enabled,
  the RustFlags should include:
  "-L\$OECORE_TARGET_SYSROOT/usr/lib/rustlib/${RUST_TARGET_SYS}/lib".

error[E0463]: can't find crate for `std`
  |
  = note: the `i686-pokymllib32-linux-gnu` target may not be installed
  = help: consider downloading the target with `rustup target add i686-pokymllib32-linux-gnu`

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/rust/rust-cross-canadian.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index fcfd178f34..b07a6f8972 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -51,22 +51,22 @@ do_install () {
     chmod +x "$outfile"
     create_sdk_wrapper "${SYS_BINDIR}/target-rust-ccld-wrapper" "CC"
 
-    ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
+    ENV_SETUP_DIR=${D}${base_prefix}/${TARGET_SYS}_environment-setup.d
     mkdir "${ENV_SETUP_DIR}"
     RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/${RUST_TARGET_SYS}_rust.sh"
 
     RUST_TARGET_TRIPLE=`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
 
     cat <<- EOF > "${RUST_ENV_SETUP_SH}"
-	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT"
+	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT -L \$OECORE_TARGET_SYSROOT/usr/lib/rustlib/${RUST_TARGET_SYS}/lib"
 	export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
 	EOF
 
     chown -R root.root ${D}
 
-    CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo.sh"
+    CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/${RUST_TARGET_SYS}_cargo.sh"
     cat <<- EOF > "${CARGO_ENV_SETUP_SH}"
-	export CARGO_HOME="\$OECORE_TARGET_SYSROOT/home/cargo"
+	export CARGO_HOME="\$OECORE_TARGET_SYSROOT/home/cargo/${RUST_TARGET_SYS}"
 	mkdir -p "\$CARGO_HOME"
         # Init the default target once, it might be otherwise user modified.
 	if [ ! -f "\$CARGO_HOME/config" ]; then
@@ -80,5 +80,5 @@ do_install () {
 	EOF
 }
 
-FILES:${PN} += "${base_prefix}/environment-setup.d"
+FILES:${PN} += "${base_prefix}/${TARGET_SYS}_environment-setup.d"
 
-- 
2.49.0


