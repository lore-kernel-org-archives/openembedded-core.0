Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A822AC02187
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 13:49:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.49150.1737035332294092865
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jan 2025 05:48:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=311185faaa=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GCwQGE011003
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 13:48:51 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2043.outbound.protection.outlook.com [104.47.51.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 446wf7ga9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 13:48:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nWvbn79tyGiwbLQRczgsZ3QGteLV3NtP5/0VcUD38+f0rHqKiASugpmiNcSkk4zGTKufPwdDJLmjEnR6ADmoLT5K9S8RnuzyYZKIIW0TX6V9vVzaiwfQbWFeL3k8qe0nlNVvl6F6OkapxXftSj8yayeOpJkKb9LR15Xmdktnpwww2AkApGq3CCbelGIp9hLNSg63zjYnl/3U1m1iAg5cOAitAiA2OaHifsULnSv5hL5QvH4QaodoD6pYVfVuct1RTTDgwwzy51qgAw84TwFCtWs0madr6s9SFaIu9k0A1fE6W/o0ooLUctuD6tLdsIxDPsBC4PWzeL4ugdRmC6dmJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MRPlC5uWbKpR+oemhpgfcMktHbmno2acxa6zK1TfRfs=;
 b=HMEHm/cdn0D7RCxoF+kKvBNygi0AJo4pDbK53Y7sZ3202HM5CEvBj9RLccJvlQT/DpJdRvIiM1moo7xRlnVU3yVXY4X0tpaBI0jfhGFrinM7TFcFrwrx0a+wtqQKH6JSRTHdSRv/svDWNN1NiNAXJ19ojMpDwKxUfrxjRJoE/Qqaz/ilkkFcN4rlJmfdTyQeMgV6sH49Iy/oH+F17xRxtKCRfGFfG1saC3FRgLLcloWMWXgyg9p7rUfNeQgM7ipRUaFrOSjGGZ0iGwAM4nhnm8Q2JBVLLr7LSLCF8Z959I97N0+qr1oEgCKd3F+euJnOoOP9hsIJjVyJAXT3iNPbIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CY8PR11MB7292.namprd11.prod.outlook.com (2603:10b6:930:9c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 13:48:47 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%4]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 13:48:47 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com
Subject: [PATCH V2 1/2] rust: fix for rust multilib sdk configuration
Date: Thu, 16 Jan 2025 05:48:31 -0800
Message-ID: <20250116134833.1838212-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0036.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::49) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CY8PR11MB7292:EE_
X-MS-Office365-Filtering-Correlation-Id: 829fb3f2-51ba-47d8-7234-08dd3634802e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?c72piVKojUx7933FEQ+1ZQOL8eiRdG7EUeHG2Y6E/MeUzILNOsFcXXjNM3Bi?=
 =?us-ascii?Q?E6gIb47hJVhoJk1xltA/zzmfjdeVHec4xl3S29SwqY2UNfjguePh4SaGVvXS?=
 =?us-ascii?Q?TXJ9b6V3pwGroDBl3fydglPX6o8S0ZnOQLNZJ3gYB7jvpSyebliFVvddx/Rk?=
 =?us-ascii?Q?B4euPPGDUfNYT+0kjsJ/4Pr8VPny4HGagEeKtC88OCv/ZwAQIsUfXRAfOc33?=
 =?us-ascii?Q?jn5TDGocDcDhql78R/KVswDNhD9pXCyZTL84CFMnNAgrJ6umD/HytLS1idxy?=
 =?us-ascii?Q?rAQi6IxVppw1JGMRFUtRLdrM0ZeWiLnyyWgBXXOVJK5vOlcZQjQTAn2d+Jqb?=
 =?us-ascii?Q?sEuG2P7hxK+0tQ0UQ/qY/pldN5v/yFYJ5UBaiszTzcQ7uqFarVfO84BLgBXd?=
 =?us-ascii?Q?iGqw0EaFYb27WzuWvidtkDomZwNA2fvRiYsqJ3ZmWZtVKmitlAFWzM4Ciy15?=
 =?us-ascii?Q?u0xU82evwLtHvAblu2z9US6TVLGKloNTyFX4PWYto6W9Ui5f//5mrAFtUn9B?=
 =?us-ascii?Q?+PoWjry0YGAYB7vZ3AdYvnWCVmEWNyzjXNbtAF7+GUrpOjYL0LDRHPNNvcyt?=
 =?us-ascii?Q?dKHjIT6xxbhkxd94IALPB4KoL9WwfnQokWhE4mQMPLcGYZ1hr20AoAuqwaRN?=
 =?us-ascii?Q?FV315VCQEgZXwQV8aNPaAboBL6HJrSGvQKKI9WXuIOcWJDYSASaR2nCDqSt1?=
 =?us-ascii?Q?NO5qauFPsuPZ8Xut6kZ7m9W1aGHHYcjIgxSbxta5qLAKzTACU+N/lwiSTKcJ?=
 =?us-ascii?Q?IVBUjMiJRwzupmNMXDod1C6BVgRifzmCnzguHDB7t+Uv6UUR9SU7ljRVKaYm?=
 =?us-ascii?Q?LWJsm+5AYFapU9smR+FSi+xChz0rRv8UNcX5hHrsxEmVbwvho1LK4xXtsFg0?=
 =?us-ascii?Q?y7i0MmBqo4EPC2YLz1iF0ZiWoXOe89Ol2qiUdh9cSL8Z/iQN62vmFsSJfeuB?=
 =?us-ascii?Q?JDcykkCTfLXxkhIOuNgJNYHMXXzujtV/CKxXgnm8nSPTidEanl6G3WU1lIwv?=
 =?us-ascii?Q?zLqwPqYO5wexzaCWNMTg9BPdJ5yHUIT9vSV/R6oIYkmy7TUVRmxzzvk2CTNH?=
 =?us-ascii?Q?bbdARxq8Wz2tO6Xol2HLhIfu9L+MvDnygOhEy7DstD2nZofMbxrmvri69fdF?=
 =?us-ascii?Q?ASR/KFak4qt5Aj8d/97zpooX98z2s8Y3GookzX0QYrrnZCQ/51AM16xJtCe0?=
 =?us-ascii?Q?vmJX2ePVZTgUpeefG5bp6HOWPvvTpIvSXRFPfC1cRjmtc1ry6JP/yLZBByMB?=
 =?us-ascii?Q?HeLUsFigziSF+C3n4kbpLUabB03uEPLvWh6otpXSd3Jyz9DYSNwgQ5AtoKMv?=
 =?us-ascii?Q?u+uiDHh8pNJsiKLLk/1nusHL47v7R2ElRzLODE0BaW5Qn0Tvv260kgMNIOem?=
 =?us-ascii?Q?lYleYnYybE+QXKW4FeaSaPegBGldNYmvsSmmBcX8xIlDEmEH2A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?giJS+oYOek6q6yTHUXxrtM1q562PdaCbl5hx7x7UBb60GIJ9TjyTWCx0dtHg?=
 =?us-ascii?Q?Nyl6IJmiC9U3nLQABUQyUOD4NGcRpw7EZrBaOcDm6Z77oOND2WXy6iVrgSV7?=
 =?us-ascii?Q?ztaOMDpb1dn4NZ/pV88A7TWxOUGqmU3pjPCxO3Y4XHBXQPrVnScdSS1+6Fox?=
 =?us-ascii?Q?P00K6pK/lXATfdMd+6YWdx7PJY5GWi5WKm3FrHj8xsA1r/EcQo8Ryyi2KdZO?=
 =?us-ascii?Q?xX3vSKO6GEixQI9rQXgj7KDE3YdCrae52e1zXYO1PF1AIIwkujltAaOJ9PPT?=
 =?us-ascii?Q?0kRlFiCfjnDUm0R7XU/Zx7ZQcJ1EvGillzwDB63/1hi8D0K2YJUVGHWqCZ5t?=
 =?us-ascii?Q?V1NYOmcyAVRtTm/YE1NHmJ9JA94RTLFVAPUxMP3f4sQp7Y9vYTMYPQJtFxXu?=
 =?us-ascii?Q?be7KdXfN6M97ls6lCgI9sVEJoO+97/yhqI8dnJKndQ9wltM6t+nB+yhS4MhA?=
 =?us-ascii?Q?VS6CVebghfcFIogG4CDkk2xF/mOrY3QqyLtwrcFVfXSGZQiGpdw9TpEmwzhb?=
 =?us-ascii?Q?V4cI4ioU3wTlSiNORXbIr3CynZ86Dm5FBVuS2umOVbR0u5GCRa1KsO+82cXG?=
 =?us-ascii?Q?Sgg4UVmaCd2qGZ4EYb8FrJP4R5/us06zILJImf9YDE85OtW7suIMteFYtxxg?=
 =?us-ascii?Q?z1Hw1acZR21ngXaw44zkBkUzrWIE+nKDGKYzT50z0Gti6EV8V+5Bcys15kwT?=
 =?us-ascii?Q?7Row8thPX6oZtbxe/cvSE+EN7h//O3oCuJc7CQVnfEriHKB2AkJXT7I7OnFo?=
 =?us-ascii?Q?SjxQnOkYiKQxuxPk/YlOwJS0DbbdtqK6KIWjgRF40hLtW/OZfwJgILCFAKvw?=
 =?us-ascii?Q?sqVTJOvdroEqq8UbUFxvKZWIQFzF8zFR3xM2UqOy0KbOqjhlNtBZrXPP1gUq?=
 =?us-ascii?Q?cwH5wxowcLwRdjTLYCv++SXaverHHWx3xOWb5oO5PWXTuqfLbLqd+kedpl/g?=
 =?us-ascii?Q?QPa2+RE3zsTXwsT2LYowhAv/kg5JwYRKpYjuPbOkSs/5VKweT/9GcvjIT3pd?=
 =?us-ascii?Q?FWJjttnp8tm7nN65U5KaHmDx46howGBZBFlR5O5wRH/iVQeq3te8xC5SY3Vz?=
 =?us-ascii?Q?hdXEE1CZjS36cpSYqfXWLY2CojsmncWr8DjHUkO0qgra8FfJt4/ExVx/P5Uz?=
 =?us-ascii?Q?B3MrIBZfmxgR68YcVxZ18UU2NB7De/ofEAGH2GdIz/GZnHOW11P7XlzMDlIU?=
 =?us-ascii?Q?P0jyVg5kkhsAheljB23XZi+pLENXaYTFkiJn6jzYipZ70kL/oZ7DE2pS9UWS?=
 =?us-ascii?Q?xLQi20ggCJSvtgGKzYLsdvob40aQBPzu6SkHbgqsARNf+RMc3jFr2Bce/qks?=
 =?us-ascii?Q?xQRIt3sorXW2lxxWSHcQxCke2UAayn/lpDvZ4T5+B4yhxOjIHV3xYK5rB9wl?=
 =?us-ascii?Q?LAnA93Dlphs3j+46AWAyLEG93q60k0ad0sFWnkBe4zcGd08E7ip8B/bG3Z09?=
 =?us-ascii?Q?Fhbm0oFtG9z/WXCq9dgT/s46IUwnXMoTnM4lVorf6ny1kG966/vMWt3tGsK9?=
 =?us-ascii?Q?8t35xyS3evkyytrQVJwxIuCTXuJw5AgBE4ybSqJW2ZKXQcuOMaSwYXXtbnkr?=
 =?us-ascii?Q?W49+4rPyhGXPEWPhuMG8keMq3IDEAWWjRacVlvO0dubcPibaLXpQ+jyZiig6?=
 =?us-ascii?Q?PcqdMiW/j7genHz6GM2jabc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 829fb3f2-51ba-47d8-7234-08dd3634802e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 13:48:47.4303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vpu9DA6eGKIgadogOuxVHMNLwJs8IFNN2uCkxsPkxNLI7Q/p7eRZwS+b1sYLYiGlDT18I4Rrzxf73eaRvkklbu7w2hwVkqb/O1ekbFfHJM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7292
X-Proofpoint-ORIG-GUID: 9mRqa7nqACVG2IR2kpzOetNAbhCQX7Xd
X-Authority-Analysis: v=2.4 cv=X8moKHTe c=1 sm=1 tr=0 ts=67890e43 cx=c_pps a=BUR/PSeFfUFfX8a0VQYRdg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=7mOBRU54AAAA:8 a=t7CeM3EgAAAA:8 a=14GNO-NBWczvVMVQjpsA:9 a=wa9RWnbW_A1YIeRBVszw:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 9mRqa7nqACVG2IR2kpzOetNAbhCQX7Xd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_05,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 malwarescore=0 impostorscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501160104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 13:49:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209947

From: Harish Sadineni <Harish.Sadineni@windriver.com>

YOCTO [#15061]
The rust sdk installs both 'rust.sh' and 'cargo.sh' for lib32 and lib64 in the same location.
This causes below error while installing the lib32 & lib64 binaries:

Error: Transaction test error:
  file /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/environment-setup.d/cargo.sh
conflicts between attempted installs of rust-cross-canadian-arm-1.67.1-r0.x86_64_nativesdk and
 rust-cross-canadian-aarch64-1.67.1-r0.x86_64_nativesdk
  file /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/environment-setup.d/rust.sh
conflicts between attempted installs of rust-cross-canadian-arm-1.67.1-r0.x86_64_nativesdk and
rust-cross-canadian-aarch64-1.67.1-r0.x86_64_nativesdk
ERROR: Task (virtual:multilib:lib32:/media/build/poky/meta/recipes-sato/images/core-image-sato.bb:do_populate_sdk)
failed with exit code '1'

The change includes:
- Prepending '${RUST_TARGET_SYS}' to 'rust.sh' to differentiate between target systems.
- Moving the non-target-specific environment variables to 'nativesdk-cargo' and 'nativesdk-rust',
instead of being managed by the cross-canadian recipe.
- Removed the redundant cargo config file from the 'rust-cross-canadian.inc' file.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/rust/cargo_1.81.0.bb    | 15 +++++++++++
 .../rust/rust-cross-canadian.inc              | 27 ++-----------------
 meta/recipes-devtools/rust/rust_1.81.0.bb     | 13 +++++++++
 3 files changed, 30 insertions(+), 25 deletions(-)

diff --git a/meta/recipes-devtools/rust/cargo_1.81.0.bb b/meta/recipes-devtools/rust/cargo_1.81.0.bb
index 123032cdf7..d05b076d30 100644
--- a/meta/recipes-devtools/rust/cargo_1.81.0.bb
+++ b/meta/recipes-devtools/rust/cargo_1.81.0.bb
@@ -50,8 +50,23 @@ do_install:append:class-nativesdk() {
 	# sets to libdir but not base_libdir leading to symbol mismatches depending on the
 	# host OS. Fully set LD_LIBRARY_PATH to contain both to avoid this.
 	create_wrapper ${D}/${bindir}/cargo LD_LIBRARY_PATH=${libdir}:${base_libdir}
+
+        ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
+        mkdir "${ENV_SETUP_DIR}"
+        CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo.sh"
+
+        cat <<- EOF > "${CARGO_ENV_SETUP_SH}"
+	# Keep the below off as long as HTTP/2 is disabled.
+	export CARGO_HTTP_MULTIPLEXING=false
+
+	export CARGO_HTTP_CAINFO="\$OECORE_NATIVE_SYSROOT/etc/ssl/certs/ca-certificates.crt"
+	EOF
+
+        chown -R root.root ${D}
 }
 
+FILES:${PN} += "${base_prefix}/environment-setup.d"
+
 # Disabled due to incompatibility with libgit2 0.28.x (https://github.com/rust-lang/git2-rs/issues/458, https://bugs.gentoo.org/707746#c1)
 # as shipped by Yocto Dunfell.
 # According to https://github.com/rust-lang/git2-rs/issues/458#issuecomment-522567539, there are no compatibility guarantees between
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index c34b839d15..e4457d0539 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -54,39 +54,16 @@ do_install () {
 
     ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
     mkdir "${ENV_SETUP_DIR}"
-    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
+    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/${RUST_TARGET_SYS}_rust.sh"
 
     RUST_TARGET_TRIPLE=`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
-    RUST_HOST_TRIPLE=`echo ${RUST_HOST_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
-    SDKLOADER=${@bb.utils.contains('SDK_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'i686', 'ld-linux.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'aarch64', 'ld-linux-aarch64.so.1', '', d)}${@bb.utils.contains('SDK_ARCH', 'ppc64le', 'ld64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'riscv64', 'ld-linux-riscv64-lp64d.so.1', '', d)}
 
     cat <<- EOF > "${RUST_ENV_SETUP_SH}"
 	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT"
-	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER="\$OECORE_NATIVE_SYSROOT/lib/${SDKLOADER}"
-	export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
+	export RUST_TARGET_PATH="\$RUST_TARGET_PATH:\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
 	EOF
 
     chown -R root.root ${D}
-
-    CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo.sh"
-    cat <<- EOF > "${CARGO_ENV_SETUP_SH}"
-	export CARGO_HOME="\$OECORE_TARGET_SYSROOT/home/cargo"
-	mkdir -p "\$CARGO_HOME"
-        # Init the default target once, it might be otherwise user modified.
-	if [ ! -f "\$CARGO_HOME/config" ]; then
-		touch "\$CARGO_HOME/config"
-		echo "[build]" >> "\$CARGO_HOME/config"
-		echo 'target = "'${RUST_TARGET_SYS}'"' >> "\$CARGO_HOME/config"
-		echo '# TARGET_SYS' >> "\$CARGO_HOME/config"
-		echo '[target.'${RUST_TARGET_SYS}']' >> "\$CARGO_HOME/config"
-		echo 'linker = "target-rust-ccld"' >> "\$CARGO_HOME/config"
-    fi
-
-	# Keep the below off as long as HTTP/2 is disabled.
-	export CARGO_HTTP_MULTIPLEXING=false
-
-	export CARGO_HTTP_CAINFO="\$OECORE_NATIVE_SYSROOT/etc/ssl/certs/ca-certificates.crt"
-	EOF
 }
 
 FILES:${PN} += "${base_prefix}/environment-setup.d"
diff --git a/meta/recipes-devtools/rust/rust_1.81.0.bb b/meta/recipes-devtools/rust/rust_1.81.0.bb
index b583508456..24a0319dbe 100644
--- a/meta/recipes-devtools/rust/rust_1.81.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.81.0.bb
@@ -272,8 +272,21 @@ rust_do_install:class-nativesdk() {
     rm ${D}${libdir}/rustlib/install.log
     rm ${D}${libdir}/rustlib/manifest*
     rm ${D}${libdir}/rustlib/${RUST_HOST_SYS}/lib/libstd*.so
+
+    ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
+    mkdir "${ENV_SETUP_DIR}"
+    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
+    RUST_HOST_TRIPLE=`echo ${RUST_HOST_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
+    SDKLOADER=${@bb.utils.contains('SDK_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'i686', 'ld-linux.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'aarch64', 'ld-linux-aarch64.so.1', '', d)}${@bb.utils.contains('SDK_ARCH', 'ppc64le', 'ld64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'riscv64', 'ld-linux-riscv64-lp64d.so.1', '', d)}
+
+    cat <<- EOF > "${RUST_ENV_SETUP_SH}"
+	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER="\$OECORE_NATIVE_SYSROOT/lib/${SDKLOADER}"
+	EOF
+    chown -R root.root ${D}
 }
 
+FILES:${PN} += "${base_prefix}/environment-setup.d"
+
 EXTRA_TOOLS ?= "cargo-clippy clippy-driver rustfmt"
 rust_do_install:class-target() {
     export PSEUDO_UNLOAD=1
-- 
2.43.0


