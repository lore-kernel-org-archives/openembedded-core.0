Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F137D6ACC4
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 12:41:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.71036.1732711276464921067
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 04:41:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=106132e37a=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AR7rkAl027871
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 12:41:15 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2045.outbound.protection.outlook.com [104.47.74.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 433491cjdw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 12:41:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DAT/GtLoGGz5ZjX+ee2c2hif+Yj/Vsx2NB4kIseXhH2h0CmshvSu96a3Ks0kCT0a9cOU2OtgA2m98ZCPWDooxm5Ao4P4y3TLP8lrcsps0p/aBgcL71L6hkAwZHS75YXXsU+FV+sRxkWFrkXe/2mrwMkkK76OaKt0dU38NGoqznhsxD4Lg8j2pxY1nIRSjJbvDDEbKkLpSWYyfgtmrb/4uYNzwN/GeKql7VGTrLxySAXGB9Rv7zZxDd/c9cjMdMbKdoB3yAv+sxMnm/R27sDpkLZiqf+1XP3aOwqcq0xTGgYKv4eBG71EalYyjsM5j+iV3sNM63HDPqNbMUOH9wH2gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcnaEdN1MwEDa/7VJHc8TOMogW/9cifeEOAKiGmKFXQ=;
 b=BqhQvmi2nI2UWF2Vx95uviNyC52AeIp2Oep8pZX0STB7vBWbB1fTO2Z40I162D+LXL1bu1uZQBky9SGCxktKzTkKUjvxZqaOzOQt6yp2Dgwa0j8hUhXIneUV5cddif8vkZHxYz8qg3ZSbFdzP7W/Rv2z63RFBfqJ3/IP+FWsp2mHy7MybX0DYjqC5i62G8Os7FaxVgvfZmGS3nALqVPxEc2vaN14FVazhCdJqLl4oL3UNlCUiuVGYmylcz4S4LcFAi+eECs03FurvVYuK7mvX1n4gIG6H3qKVUqUcyPhPAyd7/AwM3hu1T4oaFY4fqTZqtCmXkLAMSbdl/h4ZT6v1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 by CY8PR11MB7873.namprd11.prod.outlook.com (2603:10b6:930:79::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Wed, 27 Nov
 2024 12:41:13 +0000
Received: from LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39]) by LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39%4]) with mapi id 15.20.8207.010; Wed, 27 Nov 2024
 12:41:13 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [PATCH 2/2] rust-cross-canadian: Fix environment setup script conflicts for multilibs
Date: Wed, 27 Nov 2024 04:40:52 -0800
Message-ID: <20241127124052.968438-2-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241127124052.968438-1-Deepthi.Hemraj@windriver.com>
References: <20241127124052.968438-1-Deepthi.Hemraj@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0021.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::34) To LV3PR11MB8602.namprd11.prod.outlook.com
 (2603:10b6:408:1b3::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8602:EE_|CY8PR11MB7873:EE_
X-MS-Office365-Filtering-Correlation-Id: 965950e8-d977-4735-493f-08dd0ee0c6f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZWRAo4kTUg25yFaX2+J+a4mUlEEoEgP2ae3Vw2eaDLicKHXRxdWyb7SOxxjc?=
 =?us-ascii?Q?auG+BnsaunVFoUtnu0mQIRsMV24lB82PUTFvfWOKE2llD3n9Jl4O15axYrX+?=
 =?us-ascii?Q?2GrhYe3au2FE/EQ4AlEvZlomwVDo7qJTM0YSw/Su9dDizZ4ysMBFwtLrvD/7?=
 =?us-ascii?Q?cWypBevVl7SJ5j8Qkq5InbiQVT4lGIEcxToLO+6SaVC0nhLbYBmMQdXVDP0p?=
 =?us-ascii?Q?q/Mh2od0gLGC3m0D9BGZG4LYMH2MyX1EHgjmxeucR6MkbFe93f/KjHaE7gvZ?=
 =?us-ascii?Q?00RFWzYmaQPi3+ky5A2VK0OS27gKhhFB2ee276ohwQw7bwXAuPHeN0FvsvXV?=
 =?us-ascii?Q?n51WfLLPNDPYQaRNKKVqyD6zXFgbZq0JqmATxTBcg2P5fnEQ+PB4idts/fnI?=
 =?us-ascii?Q?kxNTbF3qAZt8Ce51MaOW6S/9S5XcAT+prycgwNdlODMh+67candyuXDq855C?=
 =?us-ascii?Q?Yxeb/nstGN/DEMwRuK9ROEcWoMmt71FKgepdATB5Ejc5L0nGK1zIAqT7if7u?=
 =?us-ascii?Q?svCorMZmQCu/j9b24mfRl3ErHVMNuVwm1b8gPDBQYaTWvI9RtuU5YBA0Zy2B?=
 =?us-ascii?Q?wS5+eM/bKai3rPnegRlZDedA6EF92VZ4CsN67ihJ018pRJLf0xoQbtBqoGxJ?=
 =?us-ascii?Q?NlA52JTWk28BzofKmc+cElOqe1UKDwefpAEgnJkwbgoIHDziUh3OKdWeX9+1?=
 =?us-ascii?Q?bFrsKUA4ncm46nk6RFQN56xrDsmHo6hBi2CHtHuS2hBWqdsXZVfrdfV0xLN4?=
 =?us-ascii?Q?7YlANaofPitNZnnC2hoh8oEXdwrStdoy74H3B+AM89k24kxRI3Ml6soYacUX?=
 =?us-ascii?Q?qDbi9O6vhMaZffxuHnPkEx40yLM2KB8SpiPddvg3Pg4unKD/KgjOqDax8nA2?=
 =?us-ascii?Q?+N7dmG9vROd+ZmwShABZsGOZnw0CZS/v022tPm2i2jwP7LRH2fAqCx/qib8s?=
 =?us-ascii?Q?FdTnktEOviR5i4CHgF1WsBwdrv8EWltCpXPZ9zKhvlVTCZ5/zT3TmGlSmCG+?=
 =?us-ascii?Q?RvBtm7iHyJs0/h6LloejUJ50fOgVQpClZFWxpyclNVEfn0TFrgpX96p9E429?=
 =?us-ascii?Q?SN0DjtWyhJy59aTq++ma3d/NjHQIqPRVVlyuD2FwqK5BOsVVYWblfHI3H4oc?=
 =?us-ascii?Q?dR0U/rEwPpzIdat71Wlti5CuZeRgrIdUqCU1TkMOuUnM6jthzte0PXPfT5kP?=
 =?us-ascii?Q?yLPYTKhm+NAmzemoixINzrNpb4bp9KDKFBkOaU/xCU+eFY/nzP73VzCfFulx?=
 =?us-ascii?Q?1ScXQnwsGbdjjrv6wteHpOMPFnLQtTzOccoFitmae9H0lVn9WCmvKbaGX4PT?=
 =?us-ascii?Q?QAC1skah7aZvDh/MIRGoa6EL297nz0MV1lzOipBpPZarSq5aK01i6X5rNuu2?=
 =?us-ascii?Q?WdzEj4jLr6pqFmNZrOAVwTS6kCvsvPo+b6dz7JXs7HpOwGEhKg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Bq8ERiX0/O4CK3uSQAGTnhe990+ZY4OaLtWoD1S5y+zW+m1TN2wMFzVxjs2c?=
 =?us-ascii?Q?qIQtxOhYqJfNdeg2pP5Gkfl2pAIY8LfVBR3q/j8BLGiYPYF2Scw37Uq5hRFz?=
 =?us-ascii?Q?pmDxKa4SLWif0mE1fgG09tSCwZNzrQWwHONGJPcgGLZy7idAI1hEpb8+M1Hp?=
 =?us-ascii?Q?L9cPBZBTWcyldcN/9JpCn/a1FUB4P/L7b6brRyfmIjKUuSLNJmhOMVhW/MoN?=
 =?us-ascii?Q?eKq3GeoE2wE+QFtLwsQf1UNdytYbzjC7v36zfisGS+mGTbQJ26DBz0mPFvnG?=
 =?us-ascii?Q?utvcqrer1R+aAgpdBKLb3TiQIpJOjYBSXD9qtcC3JD54AWtlI//jf8047P79?=
 =?us-ascii?Q?PlJVPpUUqyH8a82nIaFu7e5t/bb/6AVdRK9ljHbLdwNwrs3jH66oC6MW4+vT?=
 =?us-ascii?Q?1TUXCygZdGq3OGFqVhWGzVIooBthPrwELa2XSE/9LzqJ3BxmyiY65//91J2K?=
 =?us-ascii?Q?pg2oaQjXZDskjkVpTBSMvK+7e1n+zFAnUYsNy3kWv+Cm4DlNvHx9U6tFiewX?=
 =?us-ascii?Q?kQO9rvpRlQNrHQfyMp9HMRtRO77DdRd9a0yfrs5qEwlQwj0PJPl03sDsr+jm?=
 =?us-ascii?Q?0y+APp6p4fv7vLhB2LiDvmuSzeQ9d+5E+qK5WCF9Qovd3cGAY3OD47ro8Crs?=
 =?us-ascii?Q?DfxU9GexL22phtkT3G6jbv79cZK1rh1we8xyoF+jO3cQBciokl7M0VB5xWmW?=
 =?us-ascii?Q?6S9sAMmpYmUMwi91ojjnUnSt0iknQQcjqNVc1uwCJ0NS5avUOVEqHjXKLlEg?=
 =?us-ascii?Q?30y1w6SaGj9LciNbBoLyk/8Ova62MQxmqARRTvUEOzCmf2PCOedZD1Js+Dkv?=
 =?us-ascii?Q?pDHBHyzgQU5C2JOzrkj8QQCrOar/j4NrJJZMMYtEZDzhAtS/QkCWLoRqR7ja?=
 =?us-ascii?Q?VDbKkw7Fkcx1zD2Z0bRou8DF8uI5DElU7+gd8badOH5kqLOIV6zJ5W+H+nyN?=
 =?us-ascii?Q?uPp39ZQiXwyYLxkTyud/D+rrYft+IHgiYpFZLpZxlYIGX4xo38+Eh+erb79Z?=
 =?us-ascii?Q?sJET4rZ2ce35ejs141qhcSzfA/Y2WwBEXPn2RiB3eIOtKIf4zZF9UpajorMm?=
 =?us-ascii?Q?fXr9tl6zNPdF0uXSUkPdzog6yrYudBhrPVAfgG3a7i/2cazLOHy3hPWejaKI?=
 =?us-ascii?Q?whsJ49Npp6dsZOBakeL3uW0IzJ/9UP95VEShqF8X693GdQqVwXJrocpIbIMR?=
 =?us-ascii?Q?SI62xRPVXj7cn4lGL1SkiZjJ2tx7DyWiCdcCgwkAAgNmPy4cuY+fp5Y278zD?=
 =?us-ascii?Q?1NHZ+3Voc0062dFxWJ3rBalU0jS4GzaIgu9bbBPeT6bzGIf5lfJmsPMswNlF?=
 =?us-ascii?Q?MAEJBOyVUdoWctz6Mjm2QRaw1OcaXyAscydqR861HXUTVGra6dV+YdHhcrMi?=
 =?us-ascii?Q?XdI1u+N14dwLjOgwhJqtlbRL/O2LmYuJN0qeh87yF4+cYPOt94NSrNFvU60R?=
 =?us-ascii?Q?s7PQedg5S9xyEOOPV5rii4mkA46sFAkHQdGHpXePUm3bTMm/vov6AMjEBjeH?=
 =?us-ascii?Q?Qln2B4NE3fs5cFLUa/VTeNo+GU2aFVU8X44FxuNquG+4y50Hnhgu0NCbwFQ/?=
 =?us-ascii?Q?Ip8a5SjvJkSjg/sryxiV9B7VU+eDhUVYEc//KqPGyGEMFfuP/yz2M8RxR7jT?=
 =?us-ascii?Q?Dw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 965950e8-d977-4735-493f-08dd0ee0c6f2
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 12:41:13.1074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OdCs0rriuLxIpM03Xv/wNVopoOgyGm9J0sffKf6BiFwO2qORTX+HENO3s3Y0LOL7HvDBX2+Ppd9HhfCY5QICt91wfD5tM0ZatDrO5PRgR7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7873
X-Authority-Analysis: v=2.4 cv=W4ZqVgWk c=1 sm=1 tr=0 ts=6747136b cx=c_pps a=GbYsmhbcUJoGoLxTsnc7yA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=v6gg5HFEU58PeVxLRGMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: yWJ76NnLXVa_5sxep_snKnqEbvhQBzeg
X-Proofpoint-ORIG-GUID: yWJ76NnLXVa_5sxep_snKnqEbvhQBzeg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-27_04,2024-11-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 adultscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 phishscore=0 spamscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411270102
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 12:41:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207927

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

YOCTO [#15061]
Rust multilib sdks broken because of the conflicts between attempted
installs of rust-cross-canadian for multilibs

Multilibs trying to install cargo.sh and rust.sh in the same path
which resulted in the issue

The target dependent variables are retained on the rust-cross-canadian and
others are moved to the nativesdk-cargo recipe.
By appending ${RUST_TARGET_SYS} to environment script filenames,
conflicts between architectures are resolved.

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-devtools/rust/rust-cross-canadian.inc |  6 ++----
 meta/recipes-devtools/rust/rust_1.80.1.bb          | 13 +++++++++++++
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index 5de22ad2b0..6c27382b1a 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -54,18 +54,16 @@ do_install () {
 
     ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
     mkdir "${ENV_SETUP_DIR}"
-    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
+    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/${RUST_TARGET_SYS}_rust.sh"
 
     RUST_TARGET_TRIPLE=`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
     SDKLOADER=${@bb.utils.contains('SDK_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'i686', 'ld-linux.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'aarch64', 'ld-linux-aarch64.so.1', '', d)}${@bb.utils.contains('SDK_ARCH', 'ppc64le', 'ld64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'riscv64', 'ld-linux-riscv64-lp64d.so.1', '', d)}
 
     cat <<- EOF > "${RUST_ENV_SETUP_SH}"
 	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT"
-	export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
 	export CARGO_HOME="\$OECORE_TARGET_SYSROOT/home/cargo"
 	mkdir -p "\$CARGO_HOME"
-        # Init the default target once, it might be otherwise user modified.
-	if [ ! -f "\$CARGO_HOME/config" ]; then
+	if ! grep -q '^\[target.${RUST_TARGET_SYS}]' "\$CARGO_HOME/config"; the
 		touch "\$CARGO_HOME/config"
 		echo 'target = "'${RUST_TARGET_SYS}'"' >> "\$CARGO_HOME/config"
 		echo '# TARGET_SYS' >> "\$CARGO_HOME/config"
diff --git a/meta/recipes-devtools/rust/rust_1.80.1.bb b/meta/recipes-devtools/rust/rust_1.80.1.bb
index eae1f28bb8..544f2ac8a0 100644
--- a/meta/recipes-devtools/rust/rust_1.80.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.80.1.bb
@@ -271,8 +271,21 @@ rust_do_install:class-nativesdk() {
     rm ${D}${libdir}/rustlib/uninstall.sh
     rm ${D}${libdir}/rustlib/install.log
     rm ${D}${libdir}/rustlib/manifest*
+
+    ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
+    mkdir "${ENV_SETUP_DIR}"
+    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
+
+    cat <<- EOF > "${RUST_ENV_SETUP_SH}"
+	export RUST_TARGET_PATH="\$RUST_TARGET_PATH:\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
+	EOF
+
+    chown -R root.root ${D}
+
 }
 
+FILES:${PN} += "${base_prefix}/environment-setup.d"
+
 EXTRA_TOOLS ?= "cargo-clippy clippy-driver rustfmt"
 rust_do_install:class-target() {
     export PSEUDO_UNLOAD=1
-- 
2.43.0


