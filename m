Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8164C87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 08:48:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.30678.1753865326450128044
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 01:48:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0306c9daa3=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56U4FsRf1989443
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 01:48:46 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2073.outbound.protection.outlook.com [40.107.243.73])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 484ta1unhd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 01:48:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vB/v1VA1AVoSMqm+mgVV2iKNPmoUGJGuFDkR55zjmv3OKvkhALA32/U+TcRxtlNBKCk0B0PpoB3KUCJ92ADqs1LAYKJAVCt58pvXdpIcxEXCvWKXQljO04KlHY8J7HK2YK/XUIx+tHZtP+hXcTcwcIWy0WzcAZ6YioYe0p8e5oc4Md7FzgN33ffZ/lFIVh47CEbrSXq9NEXRM7XfgEMoEnVivHtOuf56HoRrcSiKvWJhdYIj0AoyDZQLnbX1nG6ahQqMWOA5M15E71htj/rFBGmrfc3utrhxJGWnW2Bbe4JdPCjIA/TL6P6HvpGFTZsbEx0eq8WxxCc8yAr23iSdFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dpr7o+CZg1xZSWhIy7ufv40gB4ZBIAo+jnplGjKkEL8=;
 b=JTe8OWi7nMa26Jped9z+ynLWRgC7+zcOxvaP42aV45le6GRagK2LBgcilVX2CK3mV28Vkd9gZ3dFKRGVAwfhQfD6zQfeU59KoArOtFIol7cK09Ell0EfFPY0YVPkGKS0NMwBfJgV3/j+WXWPvqOUWjlXChHhcqw3oKHeenBvmo1bn2k1zZFvyT+BYzG8GRYb9RoVBi+48RSZJM0XOim0rqYzj5aGgUgydeK5LKDFc/gtI9sgxJRFvi48P7KHrBXTSqljwa4JFMCj63Hh4B21G1LA2hIJiip1yPoikkbmMUaxinuGT7kjD8GArf12pJ4ItEIh/O3X9iscU4VOoRYTGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CH0PR11MB8190.namprd11.prod.outlook.com (2603:10b6:610:188::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Wed, 30 Jul
 2025 08:48:44 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.8964.026; Wed, 30 Jul 2025
 08:48:44 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH v2 3/4] rust-cross-canadian: Add target-specific environment setup support
Date: Wed, 30 Jul 2025 01:48:17 -0700
Message-ID: <20250730084818.27093-3-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250730084818.27093-1-Harish.Sadineni@windriver.com>
References: <20250730084818.27093-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0022.prod.exchangelabs.com (2603:10b6:a02:80::35)
 To PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CH0PR11MB8190:EE_
X-MS-Office365-Filtering-Correlation-Id: 188e361b-9bec-4ec8-d7aa-08ddcf45e420
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ElV99NxZTaDZ3ZrbkiTlrItr6Rs7ZxqwyTytFRE2TID4i1mvD4VnXk3nvQOM?=
 =?us-ascii?Q?ZphpuTaub0mhcd+zJe8HlnDJW/svauhtfCUjzsSyUq0QTnFdyXMpbpRimaCA?=
 =?us-ascii?Q?34pVsNkNkqewKckl0W+E6s0RUDVdlau3XH+O9bm3q/WmOeeYIlkopRhbJgpw?=
 =?us-ascii?Q?zHNrmIHG1+S+TEroL061glCHasiyPt4399K0POoj9RfD31Dj+/ruP65G9zc7?=
 =?us-ascii?Q?yxaf2yudHGFfpeAgChBVB9zvmevHXYbGMveSvrB6YZ9HiTX2fmnS64wr5doM?=
 =?us-ascii?Q?RCbkZUWefUWirqAdeapiVlgkMb5PyNpXsnv+exM/0e5g2twZPtPJ93onHFFF?=
 =?us-ascii?Q?X53UaeI5T3dZfpoMACyYiBGnMolB5wyrDIQ6hupHg+3fFxYdyC547Hbs1N3/?=
 =?us-ascii?Q?6ryu6iUxuIlTfroq+IZDevMRyqmrkYaMkXsUtIJfgl3p/20LkRo7tu4cnA27?=
 =?us-ascii?Q?EvpTJvAN9+Y4/b69Zw6YO8zhrm4G0532HSHLFFFKQHczGswVrOqqJfig96Vg?=
 =?us-ascii?Q?v22tSlRnvhyCdf+GtdTLX3MSWHP3I1ZTsutOcecJd6onjA6x1y1y5zEg+9RF?=
 =?us-ascii?Q?Smlh5hGgeVPm/xpLOVeb2HgSCiGpXFX+CAvjh4mz4nE4mMNhRcr1hbipCl9R?=
 =?us-ascii?Q?2ogqmsOl4A3QQ3C5UbWBXPtmAeOXnN2LOKrhaq+t09IcRMX111aHLZthdzJM?=
 =?us-ascii?Q?rJ8E3Azwzvkczbg0CBW3n0xaEEL8jr/z0J5sZx9RdaIxpc0b/2VkAATshbIz?=
 =?us-ascii?Q?l0VwvPuP+/1NHuYHtZuWCEVyrzgdOtGLfWX0/Mqfgmo+kyfWdVUZ4z6y3D1Q?=
 =?us-ascii?Q?YcaJDc34wSJ3aTG72b+QiBpJjgmF3olWCw27Z3SsbrookK8wo8p5Jfu0ZrdH?=
 =?us-ascii?Q?vMuj1jlkfgy53SWCArUFqVEY+kuNJZZO4rHtSryF5RoF1j2yo46HIN2U4CMg?=
 =?us-ascii?Q?xaCupMG3CNQoZo53YyndfQTHwNuSq5LT4FUL5kQUaugvAfR+C4lJ4z2U1l6j?=
 =?us-ascii?Q?Z2vVsc0e4Y3KMVdtjpxWqKzC2csOfUwoe7HtDrC+sVAiR9zKxvzvyAy5UcMF?=
 =?us-ascii?Q?TgFtcLGDXFX202BvGeT/jV3SYPvMboYohb1ht4pECGFzlS2R3MkNrRAh46m4?=
 =?us-ascii?Q?moGMlK569ycNV3Z7e+Aw5drKQV0I23X8luwP6q9TN/aeg9MSyq6HKUjgASa0?=
 =?us-ascii?Q?S2Lr0B9aJ+UVLSqBmXN6SNN3N1L4w69h1EQmMVaxB7A25qri6BAgL+W9MOJ5?=
 =?us-ascii?Q?5xaTK5S/dboht8AnREPtnNYzKcDDK4j4Qpy6COYlqDBuuSW8qVYlZ4OYyMyo?=
 =?us-ascii?Q?8tle0BKLyVuywzvjottSI7YRV6a3cfSY+MSiY1aZFHiybnV/qilWpSmkDuop?=
 =?us-ascii?Q?20zS+iI241kFD+JSAYSzMDRQ2DZuAa5GWKSca0Wx0ZPF7ZkY5QYSsnocIa5Q?=
 =?us-ascii?Q?ZsWfx+WKwD8j5WXjIvxoaL6QrVmeTrrAI6JlJmrnIfTLyBgOofHbLQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?p6t1R86p2SCBvRKcJ6WZmYMsuyi1MSMCrfYDHMZ0o14hIwhIF7nmMI/tZLRX?=
 =?us-ascii?Q?6WGd0F9/kz9oZlrzi50avI3fjk5VMS2q4E3qp+Bu1F8iGP2LgRP9tQ/2NzHN?=
 =?us-ascii?Q?H4AL0OPTr/wbNvcZRjefRuCwYajVJaLXvPrq6RvGIum6npiYaSG9Wh54w0wK?=
 =?us-ascii?Q?6ZAiSmEInyFbol3qjRtVGekRSe+f5i7JtGuKlS53kc22N3eh95f5tR48ekbe?=
 =?us-ascii?Q?dKFj3zkfjyYFqkBZx9JYDKhXyF2nvLSuLiH30ORqxc9RQT+Kt0YoSF9Iebr9?=
 =?us-ascii?Q?sB/wdBwNprFtXYPWJi1/oZbvU6nf2rT2DhW5xUMKHdobpKs7CSnEJmb6AnZQ?=
 =?us-ascii?Q?NL+YaSPiI+OTPTGLkeFh+/22Pgh8q4q84RvU3bYdpFHI+YAdEOxScaEGBff7?=
 =?us-ascii?Q?wcePvnjsw63HIWCVQ+kqnEB4aYIbxMGHiPnOYZNMSCC6KrJlsuyFyUcUcFkV?=
 =?us-ascii?Q?L0SQoP4xJ6Wm5MaE+ZaA9/6mIpoA0qfL6DoUTUP+nH3BSwn55JZhdabAloEC?=
 =?us-ascii?Q?Olf9dq0WDJ9XbghonDdan+lPKH2E8FLXmUFFRjLSj10zbtjuju8sx0Vh725/?=
 =?us-ascii?Q?/sFsu8e5/YyYDhi2L2PJTwhd2HVJ1OX8pvYUkA7wSO4yqTWjlJ9YojMsBeYu?=
 =?us-ascii?Q?mGED6WD1D3I5AG3VT41cg5jfdBYIAi+6mPU5QlwcQV2utnH9Sfjait72QFDd?=
 =?us-ascii?Q?nUMIHlhzr9YoU4nqudKNKUX66Yr/vFA8JhpnZDpLbFAS8ngGKqlyG7xvnWHn?=
 =?us-ascii?Q?upWHR6pJ5t/lRGFq3gjlDfjPLuaXNYN3f29haHudSmIzZxUHzAcqwnI2It6r?=
 =?us-ascii?Q?FiE4vGeRvRFC5Umh/YgkRDab6xs4ViWRCnL6+hvke2wWRuSnDtU3YV6+HTmm?=
 =?us-ascii?Q?hIWNs99N5OUY1ZJrDotJo/1AD7EkrUnVDynSiWXLNDzMMbGYuqymyGN1bulD?=
 =?us-ascii?Q?uyhX4QxwD9e7yC+1GBzVLfssosRMxrb36fRlPW3xOlic4Qv6d/YcJlWlQj4l?=
 =?us-ascii?Q?n+U1GYHPJuCKMQMl/zQTw6lMsEmr6SstHDaPxo7wlK4cPu336fE0Ke2UQFwo?=
 =?us-ascii?Q?fjCd40rfinjSNEDSIu95sGhTw3qTYN34b758KlSGMoiFxXnhq43vmI2wbqkx?=
 =?us-ascii?Q?96FPaBKpwgEOlPC13bZECCeOzoiG7dDgF5LZnyCgQXy5C2mEzqELodm8UFFG?=
 =?us-ascii?Q?H6TBD4CxR2GNBHhTwFNGlt7S1Hff43OKaNbhJ8/bDAkcPQI5UqYYsdWRQxRO?=
 =?us-ascii?Q?/RV/W2XrTR4Tjs4+p0sRBIbRXzp8NppcPKtKhznPJSxXTK2vCgr5nbq/0f5D?=
 =?us-ascii?Q?sAQr2OlXRocu5vz32pfu1g9rkXw1HI/IuqrvqCfS6DETRZwvbEekdGNnaN9u?=
 =?us-ascii?Q?V49a4jtsKHTYERBzb98zozU1HhBYR6vduYtcGC5/UzHLjPnCa5Va9T+EDUrm?=
 =?us-ascii?Q?T7qpQTRDGAZD7CmzJDwxMCbUbi70WybnYAwBkyB0ISXKAfZXU13V1LAW+sKf?=
 =?us-ascii?Q?i3BVTVYzHDq/mREC7ZNLg820xi2Y62hm0jXe7WKmSNVCHNr2yfHfqSS14vWT?=
 =?us-ascii?Q?aRQjh0K/swE0KGgpYq3BpYhWBha/vhpt8jSSsA+XKNoW9vYXsPWrYjV7hc49?=
 =?us-ascii?Q?tQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 188e361b-9bec-4ec8-d7aa-08ddcf45e420
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 08:48:44.4561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hRORyIY3h52iTWGB0MAsxo1ZGKMhUdBmz/Bi9wkP8CtFpWnIdC4ZPWi4fDEZyAjYDmYNCiCE4rzHnRdE7NCLB0b2HUjGC862l42CFpQ0DzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8190
X-Proofpoint-ORIG-GUID: w36h2ZxowAxkzkJG52LJaBhrGTTtUgPi
X-Proofpoint-GUID: w36h2ZxowAxkzkJG52LJaBhrGTTtUgPi
X-Authority-Analysis: v=2.4 cv=OYOYDgTY c=1 sm=1 tr=0 ts=6889dc6d cx=c_pps
 a=vlhznxrQyYnnkedgukXR6g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=t7CeM3EgAAAA:8 a=d0bnlDB7liAsWXr5pGsA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA2MSBTYWx0ZWRfX+DqJGmyYTbV+
 w5DZ5VkGt9kIJTAKV2xAcvMMkbu+IsdN4EYOgaYsDXI+4S0IQPx2wkxfyC942E0p+7gaJTy6c3d
 v9IDMC97robA/a85VF/tL2rHUNRx0jyK//VfcveOhCzIhHlucmah9HJ/SBdUd76P0wc6ynjG6Hd
 LfG7brrtJuJ/kVsxN7I+o2QSprflVvlr9VvRLZirDyrSDPIIQ62iiQ6EUvrBgqSaAj1QHgxOtMT
 XyBKo6KRlxe8bvzd5wJBkxFbhcyj52AM1M/XCKMfepxQSb2PXs7SjNCTGWQ0uSlrTCS4eVYo18h
 BUfKC3XQJlEXnOUfMZxoq6HPoFWZ0hosgO/gtIZ7xXen6Co2Imo92mr1J6vAZ3ffv4ETBpvcnC0
 q9YypppD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_03,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507260059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 08:48:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221111

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
 meta/recipes-devtools/rust/rust-cross-canadian.inc | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index fcfd178f34..ba11cab524 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -51,22 +51,23 @@ do_install () {
     chmod +x "$outfile"
     create_sdk_wrapper "${SYS_BINDIR}/target-rust-ccld-wrapper" "CC"
 
-    ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
+    ENV_SETUP_DIR=${D}${base_prefix}/${TARGET_SYS}_environment-setup.d
     mkdir "${ENV_SETUP_DIR}"
     RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/${RUST_TARGET_SYS}_rust.sh"
 
     RUST_TARGET_TRIPLE=`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
 
     cat <<- EOF > "${RUST_ENV_SETUP_SH}"
-	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT"
+        LIB_PATH="\$OECORE_TARGET_SYSROOT/usr/lib/rustlib/${RUST_TARGET_SYS}/lib"
+	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT -L \$LIB_PATH"
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
@@ -80,5 +81,5 @@ do_install () {
 	EOF
 }
 
-FILES:${PN} += "${base_prefix}/environment-setup.d"
+FILES:${PN} += "${base_prefix}/${TARGET_SYS}_environment-setup.d"
 
-- 
2.49.0


