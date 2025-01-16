Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1379CC02180
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 11:39:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.46357.1737027544083043993
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jan 2025 03:39:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=311185faaa=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50G8SG47021560
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 03:39:03 -0800
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443s1pn5f2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 03:39:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KTNu47WFuM8eowvH2OsT1tVy/iUXddRHBf0um2gLQIuT7SGZ5NradSPXl7ZUD68+VOp/v0QGxcrXBu+adH1IZG4bqQ5c0NV1Tcj4DdOQX8Ly7aAUmVoYplBJKk4m+ioR1OeHZMfqFli+QOGgQt3nQJbC6UXckhAr7NiyDC8c5EHkcI0S/SNpOUGPM26exaMKfTq6xF65ycqJtDkVLbqntbaR93L7gnSmgueDZO5q9ewFn7qHoVJyt4LGOmJ7eMuhnp8veMPIsoLyK7PSXIrgwxqcY94vMoE2y6E8XjG9J8ggq4hTtJ6crIdRmx4oCaLLbnXJRmV8takiEGxON0oUeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URcGGwcQ4kXTiywzaDtA/trYxnbhFtGnsrqzaUMtzbE=;
 b=GG333vYdmawCo6C8YYOqlwNsv5RqFbhidSSeDTzLADb6Xq74OQhbXV2SN+UfWCtZcW6oSC+xTzeyhoBK2maMe8VKdMiffP94Fv7kuEhvJgU1SiFVcjIIkfi1+BD6VEebEWhuFj7GYGE0qc9jkTtA71EU9TxOl0UsvYJuI2lhtS9V+8zj5ZA6wPSMu7UWuchwCk/lRcgJhgNtOipx4Rfh/SG0QAnl7EkaSYwyhGramstaS37BwDwqXkd5sAx/S+GZqvxIefaZH89wJRMhjhf2bs9IBltUX4LQTcXG8fS2vE6a8daKS9x6m1EaBY3j0222QS/oj4NiZhaAgrRHCE/A0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CYXPR11MB8711.namprd11.prod.outlook.com (2603:10b6:930:d7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 11:39:00 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%4]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 11:39:00 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com
Subject: [PATCH 1/2] rust: fix for rust multilib sdk configuration
Date: Thu, 16 Jan 2025 03:38:42 -0800
Message-ID: <20250116113843.1817918-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0210.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::35) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CYXPR11MB8711:EE_
X-MS-Office365-Filtering-Correlation-Id: f5eb65b6-335e-4709-53b5-08dd36225ebf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OVNzb0PaWj9DCcNLRhGcepnSCsDYQJ7Z5bBmoIN8++6dBPtOC9eTO8LR63fC?=
 =?us-ascii?Q?+CsvZo5c2nQh3M58z5MkOpETQMvguw00NZRE3TxM+9knlgLJ5//qdDmqDKlq?=
 =?us-ascii?Q?cDZ7kSouaCSQiJFdpF0gGxfGNM5IiWLG8owS9kxQv+6HpetnfhW6e3STc0YL?=
 =?us-ascii?Q?3A7sOnSWDRaxk3UdxM/ICA9dguoX1gBV/UWjLUSlpFDmsLcenJnEY6GFms53?=
 =?us-ascii?Q?1rGvve6DFjt3XCYeoeLtHZBXlZdrfytF2arAzhNptC8iL1YJKgdnUwiO2Z0Q?=
 =?us-ascii?Q?W8i+EFdz76WDIUS5XNBDRMTrrMGLuuWnYo3hAarTVQNXiaYO3oMKYjfazWeB?=
 =?us-ascii?Q?BGK+5sjw6Co/aalGfJwUCOmpReCEoGgB92LRArohvvF7aXOrLoxDEd3E7mTI?=
 =?us-ascii?Q?aiTGJ4HRpuVtFsTeLCJulNnBENmWS2iOPkwEGb/yUwZ/XwfmTrrTNEDvu6jg?=
 =?us-ascii?Q?8XYqE64jLIZdW5+4tpr5gUwsHAXE2gqlESsmpudTCDUueSjmzc20oXAs4pY4?=
 =?us-ascii?Q?2/+PXBLQPP3QtfEnudZIc2QBpDiK/Gw9DWLGTghBXDIzoS95IX9DTa8kacTc?=
 =?us-ascii?Q?lupV/JcBxrFDM5RCbeocojiETyNjSWg20pFQVLgrWod2lzOJaxWdh47NwwLR?=
 =?us-ascii?Q?cYOtfQwXcR5fMMpAtiyXXEHdHSKiqtxX5DgGhcy6YQqK+n29atmMY7rX+pzI?=
 =?us-ascii?Q?8N/gxmxqd2c4YFzyDYzUODtIAMWGubDeJfCn2TewXriPDsAbFXzPdpsgW68L?=
 =?us-ascii?Q?7B2d88qyuHZioLGJQtGOf6c+V8rNCPNm86ncWLns4Pek4sV+bEEGnSuB90yF?=
 =?us-ascii?Q?R9yP9qcJ30/wz32AjhQOY+qIO6U6jMXY3yBtWB55PQd7woR6Rz3Kd0RjpYsc?=
 =?us-ascii?Q?Kh88FFrreYNTusj99hCEBY0BFilAzuL3OO6QRgGLcAKhUjmAIuMRwH/TtGGn?=
 =?us-ascii?Q?5hetrkbe5RkcS2oNzECL/s9wBUChAq3tkrmAYMOYc+iJqLgrqOkmTBQnDPFU?=
 =?us-ascii?Q?ckVxiBKn1U4Yj1pGc/pREH8+HH4IzVYbCVql5EiOX6OeRXddqwjEMm8jnfDw?=
 =?us-ascii?Q?8xSWgWEvO1p9vNlNgPpa19+tVxVPy2o3iw/W/R2y3p7EZeDD2wIuAfTgDrUB?=
 =?us-ascii?Q?vkO8VeeBKIZGEQaA16jqfd9l7k+QGnXS3IcnZ0PkOqhfoID+H9jwbC0NmEPn?=
 =?us-ascii?Q?3x+OUeliD+8keMcpve1pe5wxEpg9RPj1ELNttVNUDFlED9tNMk/biJpC2BnJ?=
 =?us-ascii?Q?cUqfwtozXD/81h6lfRbyKEX/U0NStmYz+u0//WbSHz/Kfycy8HY5sdbD3CG9?=
 =?us-ascii?Q?x9Q/f8znE0IO6bZJIzm0ensm0oRBeV8slYW9Fc54ydQ4IFhXxo76U193dn6F?=
 =?us-ascii?Q?XLOweZ+O88JLFA9oJhcngJCs/HyIvOh+YfYbiJCvaYY5N49E3w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?64snXX0hAB4nsvMTrktBmiEI8bz83fQ3f0I8qI1KTu1LYbKCgivVRccc4Sfh?=
 =?us-ascii?Q?n/6rN9Hu/Ezjmra0NnEJRew+gVtUB+itaDmc4LUZTqba2BujWrtgY5on2vYX?=
 =?us-ascii?Q?zsZ+rd0PIqb/hLZw6thR3D6SXhLihR57a7EP4M8ndwJhLTvfcmBHn+v0Zra6?=
 =?us-ascii?Q?dfxTn3Ip3uJmNdmPugtOigY1/VyVoMq2459o1DwpiUjWFo1CXLm2lSoi3ASm?=
 =?us-ascii?Q?9//FvaMyVS13tix74JoTynX4wUFUdnEtU/D1PkFPAqHGM6+/ll6hnzCAxGPo?=
 =?us-ascii?Q?/EecklMc77QXw6obmxnnQfYfBy528c1KkQ8aMRQCBYp6CpNPso85uKhxm6EY?=
 =?us-ascii?Q?q29+FAsVg0BLVf7tRCu7RgaIusjcsed1EWwJgQy+cbvSMMy6+ObaS3fTHB+2?=
 =?us-ascii?Q?huw1COfG2QxjbbU8Rh17s9icIQtg2eF58mAJu7SNK2JemIKo2alHCQAtH0M/?=
 =?us-ascii?Q?uA4GAmjMuSsbDUz3UayDYUDUbdEnRplfuAtg3Tu0Hg0Sm1XD9NU6dupEwgVb?=
 =?us-ascii?Q?EQJF1bvbxDGx4ztWcdBRtno8vCbg56f50H0z5Ey+I4WDha0rp3uTQeOsMHjp?=
 =?us-ascii?Q?caNjo0CCHv7WrkFUz+Dj1WTZjbx7OECLtseBN06X1Zq5jgf8nJvmKI85wGbI?=
 =?us-ascii?Q?SUnQN1ND2nV3BNe9omKPn0BR23LrdJF/Eim2NJOyvmX9Opea8uIMQg9oSQ0Q?=
 =?us-ascii?Q?tiIfHBOY5KXRgP8uDAlCw5xfR8E0Mfr4qul9esnPBm8S3zw0/6lMb1RAAP0r?=
 =?us-ascii?Q?3e6nFbB6VFU5d3FgxxG6hJLiiqjH4rtYPSjnUmhpMsdo18guR8rE1CgFBKZO?=
 =?us-ascii?Q?+gvTp5GLs/YK/RFbTIb+LALMlAe6b11eihlj3mODwaDhZe1uWfh5pGZSHD/r?=
 =?us-ascii?Q?guPgoSJbYOAa2k58G1F6oj0keFGan+YpS40V5FeSm0m2RcBdmEK5wpO0WVcR?=
 =?us-ascii?Q?51sQ+y/qCkIRlQsnhicQGfmXMbJuOo4N7UMLYnkSHH7qOL5LCPXV3HjxhoZa?=
 =?us-ascii?Q?hYK8TFDLXBR9b7sAJgkZZGfSW03VkJDe+oZwC9B3dOjvJAjswz+OMji0MX41?=
 =?us-ascii?Q?XF4nomw5abXhO4AvleRcQUNONVvepf+WxkMY+hS45sLo3woAjIgoST5iUd27?=
 =?us-ascii?Q?usj8szPskBYuDnZ/2WXCKvvcUxp8ZtOxGVF3LLq9jldm9mFdlL8V7IozfxCO?=
 =?us-ascii?Q?m4f7yXtOEJN70dl1RehXqZU96AxcPUJDpqXHoVrTMZVGtAaLXNvZ9Jq8MLyI?=
 =?us-ascii?Q?+v/icpUW8CPcc5SxVBIOGZYL05wYSSu/rNz7NmF7/ouPvtZ15289DoHPN5m+?=
 =?us-ascii?Q?ROGKuYA73k/JnifvPE3P3avEcAV07HPlvog4hD3ZyqFPPTSSJ32PdwCldZUS?=
 =?us-ascii?Q?NeGib8KzF6uI+Y6Cqqppzge0jKx3x5WLOZY8+zx/lj48kVkDgA/uWUQXx9tZ?=
 =?us-ascii?Q?/HrAbFg78tFaEe0SEgdo97u4bUgDMzFKjj7L6YTkboPLK4RrBCSbTw6u4nQ/?=
 =?us-ascii?Q?lLlxLMeO3AM5yKwxKNZOIU8WXM/VMkfj3GaPggfs5ImCqFNVzLYJSro3xg59?=
 =?us-ascii?Q?etcs35XkjLN47oaKr5/TuGffVSOCnaKnOvjXI3GHhzUcDxEawuWoEx9tW/yh?=
 =?us-ascii?Q?bw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5eb65b6-335e-4709-53b5-08dd36225ebf
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 11:39:00.4017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U+qLbq+F59h2pGHIvwsuDqE5Yfz0mjkTW3Yg9y68V0qd8Xf7KJ1q736Twr60ar9h+lQxcvPxOaS+99XQ2nZYLfeAL8OWgdwmJ3PhJu6TVbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8711
X-Authority-Analysis: v=2.4 cv=DdLtqutW c=1 sm=1 tr=0 ts=6788efd7 cx=c_pps a=kSx+wkOqrR7DBdLtetN7AQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=7mOBRU54AAAA:8 a=t7CeM3EgAAAA:8 a=14GNO-NBWczvVMVQjpsA:9 a=wa9RWnbW_A1YIeRBVszw:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: nCFIq3yMMVcxyl4hssmTECL7duKLr0Yf
X-Proofpoint-ORIG-GUID: nCFIq3yMMVcxyl4hssmTECL7duKLr0Yf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_05,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501160087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 11:39:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209942

From: Harish Sadineni <Harish.Sadineni@windriver.com>

YOCTO [#15061]
The rust sdk installs both 'rust.sh' and 'cargo.sh' for lib32 and lib64 in the same location. This causes below error while installing the lib32 & lib64 binaries:

Error: Transaction test error:
  file /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/environment-setup.d/cargo.sh conflicts between attempted installs of rust-cross-canadian-arm-1.67.1-r0.x86_64_nativesdk and rust-cross-canadian-aarch64-1.67.1-r0.x86_64_nativesdk
  file /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/environment-setup.d/rust.sh conflicts between attempted installs of rust-cross-canadian-arm-1.67.1-r0.x86_64_nativesdk and rust-cross-canadian-aarch64-1.67.1-r0.x86_64_nativesdk
ERROR: Task (virtual:multilib:lib32:/media/build/poky/meta/recipes-sato/images/core-image-sato.bb:do_populate_sdk) failed with exit code '1'

The change includes:
- Prepending '${RUST_TARGET_SYS}' to 'rust.sh' to differentiate between target systems.
- Moving the non-target-specific environment variables to 'nativesdk-cargo' and 'nativesdk-rust', instead of being managed by the cross-canadian recipe.
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


