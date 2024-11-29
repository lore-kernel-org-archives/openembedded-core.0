Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D4BDD6EBEC
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 08:08:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.111213.1732867722638464022
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Nov 2024 00:08:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=20636204d6=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AT5CSpb014117
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 00:08:42 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 436719sty4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 00:08:41 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AT88f7p016066
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 00:08:41 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 436719sty2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 00:08:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mvzhJ7tgCZ+0dPqfWSUqOhTzQVJOPyYnSM+6MpTiRWs9OW/T45DUQHn6xzO62MyvJkGDcDEpObNq7IR+T7kTimg7C4+C1vNybTY65ZtxEilIGMnAJtHgZFi/nbj304DEkuIJ+ODuphB2IIDB1/UbKraaOpxHfjPTr4hllpk6vb5JrnUP+u+5l5dUxyhdEgYPE2e8+/nws564WCKhfhqyg9p4zNkkBGCR0vdb+Ta8oIAG5986Dab0FwWVi01U6NEZ38rgquofAGxsIXY6W3Y6KWA8GgBc6f2P+c+tK1NS3SVkPiwXJbVnLNZrG07+b1KOJFYpE9sG5UH8skgSqpWsmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twe2sL09bOQ653klXworHXtOhPVwizbDqI6QNRc7SUU=;
 b=W2/o2UYffm3tGo5eq+mBS+Yp0FGdtRVTRV2Jrhk3GjuWXfeQIOr4T/VdPhtaCBpRSrzlUC6Tv/poWiQvlQL6YY2TlqEu1eN23B4mGBx0Y2t92DUURMB5O6dD6m9urm0FEcY8xP9aesUWFNXxD4fEkJJjN9l1zAP/ClwE4lBKcfNijzN8Scmm4ncmu/8GkIkmjbQIO/qzpx/0kyFFDH8pjkSYqTiOwAn8pmS6eXeZ/lNIdf2GnEqpXde6fiW5E2a3hUAjQnHCE1FZpvTDZfL1QcmP0XMEo4+GwCVigd1LVISG3rLegX8dV2MVAzLTmX3RlcEQgiLx8cNk9ZZB0WsuVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 by IA1PR11MB8150.namprd11.prod.outlook.com (2603:10b6:208:44c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Fri, 29 Nov
 2024 08:08:38 +0000
Received: from LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39]) by LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39%4]) with mapi id 15.20.8207.010; Fri, 29 Nov 2024
 08:08:38 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org,
        richard.purdie@linuxfoundation.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [PATCH V3 1/2] rust-cross-canadian: Fix environment setup script conflicts for multilibs
Date: Fri, 29 Nov 2024 00:08:19 -0800
Message-ID: <20241129080820.330411-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0014.namprd07.prod.outlook.com
 (2603:10b6:a03:505::7) To LV3PR11MB8602.namprd11.prod.outlook.com
 (2603:10b6:408:1b3::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8602:EE_|IA1PR11MB8150:EE_
X-MS-Office365-Filtering-Correlation-Id: 21847112-0d76-4bf7-0df7-08dd104d07ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mqZWAAb+C5gR05LD1ZY2id6yR/9PnmChEa1Z+a/vhm+shPyNC2CtDdwaSzeT?=
 =?us-ascii?Q?uJHtwSGLEaiqrMfTm48vGoTSqbv/7idXkJ8bhCfJd4ZW/V9Ir04EZvZs+w+l?=
 =?us-ascii?Q?FntIsabEs3MZt18IqIcHTK2KLpk0kAsQO0+MIyDGO7a5ZUCHCMWEB1Z+09eR?=
 =?us-ascii?Q?EM8qKTgp7C/lTxk+NFguIc57ryi6XG3EgQwTrGxI8CaAdYK6qCeHr4oimNs3?=
 =?us-ascii?Q?ecS3Ykk51NEXkvWjVH+vQAzJ29qLSNcZzuVOmEV/pO2c7k34dE2MLBJqNB+B?=
 =?us-ascii?Q?SzBzLxZDOTPPi6vNQfbhlY3GWiZubF71BH+o55WBYTxixPvhnWeRODvuLONV?=
 =?us-ascii?Q?y80g5A7AG8oZemFUg6WZhp+fVbkpCvKgWl6w1BSMBkrFKysKDIpeawsLoBSe?=
 =?us-ascii?Q?XpLzsBaAqSrVACcZV0gkq/M8XJkJ435Vg8VWHLbvNuE5xNTbJ82DTJnj4p7Y?=
 =?us-ascii?Q?KQrc6Bki6WpuzSkkAlToaiMLenj8rIg/ZanU6XoS1WfHfUXXYfJ9QxKG+4j3?=
 =?us-ascii?Q?I9DbG2awQi9p1P/Jcf8WswFkVIWoj8y6lviuJKrgUp6ejn98554/q14fvPBV?=
 =?us-ascii?Q?RhFB4dW6fTneUcTjOpTgj5bE8yvWcAOFY/wkwOFULRn6Lsqq8PSAdOnnq9lU?=
 =?us-ascii?Q?9fy0bJuseQwD0qIZndQ+6rcV8PMZfB5cYFALG7eKfSbVYMBfvWKHVTBE5ZZl?=
 =?us-ascii?Q?9eKC+LioEPSASEqz75w6isjpiASqbG9zZXsEGk3hhTxiMAbCKtbp9MV49d3s?=
 =?us-ascii?Q?T+bcFTcZhAEqPIHS7ph0pLlqxh1MY9acDryBeP4mI8ZM38B8fefloPP3meVu?=
 =?us-ascii?Q?+Wb0JDz2BFkiqhX9OhHhiVLqN4YnIty8qbsUE60drYeu2ZfL6Sk5tgw84Wxs?=
 =?us-ascii?Q?eIcj0+m+zUqkpPd35gMoeTI5kYsbrG9R6ldoEIGCtxayk7JEFL+N/nUH6wcH?=
 =?us-ascii?Q?GI0/KSbC+Y97coavpRhsLhnd5oBnRRi2+X4Y7CfxwHY+hM6dRwo8j1T6Ai/t?=
 =?us-ascii?Q?b7TOI8FRv6m35Anb+oMYcMCb05jexQTNgdOCj6QbnOYD1576aRbFVsH6TJaK?=
 =?us-ascii?Q?85Y/zsL8BPOg1lkFoFTybyExMYO2UpcltNsBBcxtOgsZUj+lUiT+crQ2qdyh?=
 =?us-ascii?Q?q5vJKkpR6XNeAIF9YsRxfPBW1VRl8H3dzK5mAS4vkxDxRILAkYTd6H3643Hd?=
 =?us-ascii?Q?51jyM+plqxFaTg1e1lT2+RCDKp2WP3LMzCx8RZ6r9S0SrRIeYNrKXT6zGFjx?=
 =?us-ascii?Q?/hz9GYIsnzTasWntwRRQGbv5yV/T2ZMGiRD7V4VO0mwuC3LMi2Ebjv9vHTgw?=
 =?us-ascii?Q?JxfC+NMQ+PtnhPbhdtCQC6r4+HLXM94bwbketmdnzjKzbuIHv49OhT7RvKho?=
 =?us-ascii?Q?An9T4k0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aWPwf1vTcDzxUUzvxFSVeNMWWvEuN/F8pZl3mywNvSqcNNU4AaIjdgKGSDo0?=
 =?us-ascii?Q?QN7+ZESroUGFvFD63qpYs5TOpw3oHVBy/d0jkA3NC1PpQt4O4VQPWrcEYOdI?=
 =?us-ascii?Q?Lx7LqoNjTjA91sagpCIN1W+McmeMJ3vy+31jA0bCJwXhBSDsXCaypqrEqgNy?=
 =?us-ascii?Q?l3iyxae9JVL+fEIfrUpmItzxDVtkBeeaEs+r3Z71KkOOtuOOKccDqKkchmyq?=
 =?us-ascii?Q?fZmAenfVfL7C4AHIUvoe2cXb6vOghQk6BFTzSZzFfKCflT4qSFh5oR+LWU1n?=
 =?us-ascii?Q?LQKRQytYItZamHw0ZAw9jAYx7CsaxEO+LS+zEexSYwJB4Qv1oFlFSLSsDRwf?=
 =?us-ascii?Q?QoKmKg9UUyZEq/Dp1DJULyi20bAYGT+TvanK53j05RXPxT+FF+Se3+ssVyty?=
 =?us-ascii?Q?ezFbWypp1RWuGL6zdaU6SFmuetaUQz182bKnBwyihaaRacleMC+Q5qJ60ZWP?=
 =?us-ascii?Q?5xlXafFsu1N9Hh/TtnyQmcF6T90W30gtc/GMGbeEqzGHa7hEjNCxFvlZjikF?=
 =?us-ascii?Q?tC2QiI/BzypxkmMBHMPD+m4qxyWDXb1ZIpGNfIwsMS02IgpZX2HsDIIRtfjz?=
 =?us-ascii?Q?r1Pfs28h9XMWRaAJg2KsX4sXMiP2oeLx3S96IUdg7Aqz8pYupAjiwJLX0nCu?=
 =?us-ascii?Q?NJ02A3AKq4w7hDVu1GtiJea2Sd/hpayxqoqRoDMyi26gsPQlnigq8IRpjVaz?=
 =?us-ascii?Q?QaiOcGFCGKhkS+i3UScwRgq5Ia9YknfpXvBU6FS0bRFErwv3MmzZimFbDvpw?=
 =?us-ascii?Q?hgnMobmBgMcE8Z9ju4gEUTBlC+3QtHdsZlYng8pS7+abiJ9pRmHUX6GONccj?=
 =?us-ascii?Q?0wpCo13Vub21ph2MogRsPnHDMi6DumFC9KJTGV6oRKwK4SUW/SnZ4e/SIB3W?=
 =?us-ascii?Q?pdypIEmAO5wdaHWYK7V0jetPr/PWXpzsQuxTBXUy0KfG1QTdQcnkjAG9ESVF?=
 =?us-ascii?Q?AX7nFkm7mXb2dvKv2L7YAOW9u2xkBKM/O715672uvK3gFhNanuZ7LUC9qscA?=
 =?us-ascii?Q?DGIeyydJNdWt52BQyRO7cYHwYAcQ0HiQyXE/LCeBz/FT/YI2YxK/dLoUTgtY?=
 =?us-ascii?Q?hfm40dKbLAt7X+cyw/fXjmhFgN64rKfzvF0aHiKfGWO7+9VMT1FCMFbJzKEs?=
 =?us-ascii?Q?PrHIQcXcsQwk4tAX4RPlOQftnr09Ap7lnuSgfdbhOjUKzQCMCV0Hodq9T56h?=
 =?us-ascii?Q?FEvfXRrO54Go3WvviRq6nxFIFdoYysIPC9zjMCSnnWjOQ3QHewKm7g50g8XN?=
 =?us-ascii?Q?RHBIdc7SJqps2kzosE1CIWCuk6KpfW4Ra+wym2WQdtoYNUYAn8aC3qz/Egqb?=
 =?us-ascii?Q?BxeduVsw0H/21PTk+svX+v4h5H5t1xDWsSIya7Int06vrLkfH2Cbj08TO3aA?=
 =?us-ascii?Q?WvfN0/ejjCIOMnNWatjPSYp/LfR6XhBlsi5ghAC2jmfVo20R0khSdg9DsI/V?=
 =?us-ascii?Q?GvPMBVmGmhdaS1VL26xyzfZ3TMP9nhXvtXGF1DJixpXVyv0rX4iR2UfGcQd5?=
 =?us-ascii?Q?q2z+rlbcdCXfnvS9W5hmwMVsRPHtJBKdGckjGOYLVQRNL1r1Bn2grC2exmSr?=
 =?us-ascii?Q?sH68YvSpku5zyxi3RBkdpSChy4dObeb1kFoMLP9O11JnMN2Uz2OnawGMYS3k?=
 =?us-ascii?Q?aw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21847112-0d76-4bf7-0df7-08dd104d07ba
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 08:08:38.5513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gHaOwBifTEumKejLyJ4vZHjgvqZ/5UoMRsEO2u8GR07RkpH9RcCNMjScfuEWxDmplcjpICW/RFhe+BS/qW5Jt2hIHlgtVMY3DC2+TbYKQHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8150
X-Proofpoint-ORIG-GUID: vSI7gEimc7zNjNGZdbs61zh6uPNTg6HE
X-Proofpoint-GUID: q_0Xnei4y8nB8TNROfqMfd5Or6Zvkfhi
X-Authority-Analysis: v=2.4 cv=Z/8WHGRA c=1 sm=1 tr=0 ts=67497689 cx=c_pps a=mXs27GP3B2XOU+bPH1EGlQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=7mOBRU54AAAA:8 a=t7CeM3EgAAAA:8 a=wnQMr7rs1oaJLksxR58A:9 a=wa9RWnbW_A1YIeRBVszw:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-29_06,2024-11-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 mlxscore=0 priorityscore=1501 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2411290065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 08:08:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208005

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

YOCTO [#15061]
The target independent variables like CARGO_HTTP_MULTIPLEXING and
CARGO_HTTP_CAINFO should be handled by the nativesdk-cargo recipe,
rather than being managed within rust-cross-canadian.

The build section of the Cargo configuration file is also
target-independent and hence moved to nativesdk-cargo.

The nativesdk-cargo recipe can then gather these entries from the individual
target-specific files to generate the final cargo_home/config file.
Target-specific configurations are specific to the rust-cross-canadian
variant and should remain there.

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-devtools/rust/cargo_1.80.1.bb    | 25 +++++++++++++++++++
 .../rust/rust-cross-canadian.inc              | 16 ++----------
 2 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-devtools/rust/cargo_1.80.1.bb b/meta/recipes-devtools/rust/cargo_1.80.1.bb
index 123032cdf7..623cda0471 100644
--- a/meta/recipes-devtools/rust/cargo_1.80.1.bb
+++ b/meta/recipes-devtools/rust/cargo_1.80.1.bb
@@ -50,8 +50,33 @@ do_install:append:class-nativesdk() {
 	# sets to libdir but not base_libdir leading to symbol mismatches depending on the
 	# host OS. Fully set LD_LIBRARY_PATH to contain both to avoid this.
 	create_wrapper ${D}/${bindir}/cargo LD_LIBRARY_PATH=${libdir}:${base_libdir}
+
+    ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
+    mkdir "${ENV_SETUP_DIR}"
+    CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo.sh"
+
+    RUST_HOST_TRIPLE=`echo ${RUST_HOST_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
+
+    cat <<- EOF > "${CARGO_ENV_SETUP_SH}"
+	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER="\$OECORE_NATIVE_SYSROOT/lib/${SDKLOADER}"
+	export CARGO_HOME="\$OECORE_TARGET_SYSROOT/home/cargo"
+	mkdir -p "\$CARGO_HOME"
+	if [ ! -f "\$CARGO_HOME/config" ]; then
+		touch "\$CARGO_HOME/config"
+		echo "[build]" >> "\$CARGO_HOME/config"
+		echo 'linker = "target-rust-ccld"' >> "\$CARGO_HOME/config"
+    fi
+
+	# Keep the below off as long as HTTP/2 is disabled.
+	export CARGO_HTTP_MULTIPLEXING=false
+
+	export CARGO_HTTP_CAINFO="\$OECORE_NATIVE_SYSROOT/etc/ssl/certs/ca-certificates.crt"
+	EOF
+
 }
 
+FILES:${PN} += "${base_prefix}/environment-setup.d"
+
 # Disabled due to incompatibility with libgit2 0.28.x (https://github.com/rust-lang/git2-rs/issues/458, https://bugs.gentoo.org/707746#c1)
 # as shipped by Yocto Dunfell.
 # According to https://github.com/rust-lang/git2-rs/issues/458#issuecomment-522567539, there are no compatibility guarantees between
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index c34b839d15..b2a212df40 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -57,36 +57,24 @@ do_install () {
     RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
 
     RUST_TARGET_TRIPLE=`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
-    RUST_HOST_TRIPLE=`echo ${RUST_HOST_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
     SDKLOADER=${@bb.utils.contains('SDK_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'i686', 'ld-linux.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'aarch64', 'ld-linux-aarch64.so.1', '', d)}${@bb.utils.contains('SDK_ARCH', 'ppc64le', 'ld64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'riscv64', 'ld-linux-riscv64-lp64d.so.1', '', d)}
 
     cat <<- EOF > "${RUST_ENV_SETUP_SH}"
 	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT"
-	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER="\$OECORE_NATIVE_SYSROOT/lib/${SDKLOADER}"
 	export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
-	EOF
-
-    chown -R root.root ${D}
-
-    CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo.sh"
-    cat <<- EOF > "${CARGO_ENV_SETUP_SH}"
 	export CARGO_HOME="\$OECORE_TARGET_SYSROOT/home/cargo"
 	mkdir -p "\$CARGO_HOME"
         # Init the default target once, it might be otherwise user modified.
 	if [ ! -f "\$CARGO_HOME/config" ]; then
 		touch "\$CARGO_HOME/config"
-		echo "[build]" >> "\$CARGO_HOME/config"
 		echo 'target = "'${RUST_TARGET_SYS}'"' >> "\$CARGO_HOME/config"
 		echo '# TARGET_SYS' >> "\$CARGO_HOME/config"
 		echo '[target.'${RUST_TARGET_SYS}']' >> "\$CARGO_HOME/config"
-		echo 'linker = "target-rust-ccld"' >> "\$CARGO_HOME/config"
     fi
 
-	# Keep the below off as long as HTTP/2 is disabled.
-	export CARGO_HTTP_MULTIPLEXING=false
-
-	export CARGO_HTTP_CAINFO="\$OECORE_NATIVE_SYSROOT/etc/ssl/certs/ca-certificates.crt"
 	EOF
+
+    chown -R root.root ${D}
 }
 
 FILES:${PN} += "${base_prefix}/environment-setup.d"
-- 
2.43.0


