Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05C55EFCE2A
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 17:44:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24437.1772646249586053010
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 09:44:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ouFTLS8u;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7523672f62=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624Ce2Od2794028
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Mar 2026 17:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=WI9UTs2v7VO8J9ewnMcuHlCd3Ax6HB673Dn5gF3elXM=; b=
	ouFTLS8uM15K/jxsbTQmXg0hu5x4kfrhH5E6BYpNsE0uaUgdQ6li5Sq47lU0iNwK
	4d3NiCWAJ965UwbBt1ZZaFwlG0jJEvA7k56g7h60Kd/y+gzZdHSPmSkuDmQjKzPa
	ZZAdni9Zlbe8oGR+sOBMqN1ai/5/R0T1N3qFywLINo+h6hOJj5H9PmnPey56yJVY
	vypEX71C9pXsYDu2DR0dhaenCEVFXySvtvpALxpyq3H0rg2Lfy1DL3has7or/DxT
	oNf+bh9haFHWWb3xpj+9WXTvr34otEr1iJ5bjdjMD7YT4AdzQ0t574IFYSBzV2cG
	wq5WdNChr0MzK0v3IaOl8Q==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010055.outbound.protection.outlook.com [52.101.46.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvnj14-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 17:44:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HxFi+/cmZKMdpqhTH8Zo/LXwQfVFiYgpa0x+HrT/SCCm6h3z5MPAvNE883a00ztl7EzZKQmjSLKPgzJYbZDvueijKusSaEV8DdbJbj6DIj94tuTxvc3EvkJRaUdqUGqc4PIvy6ot0HJ8CimxHjlFNTIudTcXqgdTWnCqE0J3JqvDkG4STEP4Fw3Ev05TIJuXIOx0jCNApJgXitLcqTuEohTfoD6P7SDC/668JQMFPV0cIB/Q82QIHP5i9n57sb7oX+1P3umsQiyf66Rxwim1XCljV41KxGCMJkm6CGIl6EHzsofIfC1HCq6IgnnXRz2G20bc1BxEfbk5p4l3oOqAaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WI9UTs2v7VO8J9ewnMcuHlCd3Ax6HB673Dn5gF3elXM=;
 b=oyQP18IBYRSaPfV6SrZlU6pYN0lLYIm3iy0x0sav7jNJGvWFdLArWhyY0dQMVdphF6LusXrQC/hB1xOgzhj+b4y5YI9TNj0WHhP+lUOG2QKDOIwxHKwssCFK59oFgS2jvKbvoMWyM0jdImAUFp1DPXCofRRytoda5Z3UIh0IgglxFHUulF26high7/bzniSeijosFxRtM0XxgfAfuHEJNCgGOh+yqYHp0Cw0bVgxru0paATD+0wk95A3GXj88WzRiq0poKr7dKfR9NnR0QQ/dyg+woy5y0xarwFwkpUQ1HCkoA6foQv/wSIdTsQ6geL5SgWRWPKvmSSErxkvyvYj5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SA1PR11MB8326.namprd11.prod.outlook.com (2603:10b6:806:379::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Wed, 4 Mar
 2026 17:44:05 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 17:44:03 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        paul@pbarker.dev, yoann.congal@smile.fr
Subject: [PATCH v7 02/14] rust: install Rust library sources for 'make rustavailable' support
Date: Wed,  4 Mar 2026 09:43:12 -0800
Message-ID: <20260304174324.1186644-3-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
References: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0158.namprd05.prod.outlook.com
 (2603:10b6:a03:339::13) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SA1PR11MB8326:EE_
X-MS-Office365-Filtering-Correlation-Id: 43754aa9-c858-458c-51c7-08de7a15a053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	8ETFyh7PdLMqvF4G6sN9sKVgNQauWFnEIgSfePDT2ndrclt+CHItWCoULkucaD6/OFuJlHMROQyaVubO1AuMeWx3rYq3xeXLhgca08IJuioTrUaE7OK7EXigRCYyG5aXa2ne2U+pB9fe7+14j7BTGWVS4h0qyhTcpD7fukLY7UvpeDhQLVh1PnLkpMa/trSyELiT1RfQRCom10IE0dY3Rq1Yi97C8U3b+IA3dOVHeO5Wls4oUxcI3H9PpcKx2UzJdhAp7trSm401UBAxXuXL4Kx0nUINpyQTfis+luGtePwg3d1ODyvGjqfq/XaYdtaBPUBjXezyW7sTFUtBtzToiqXaLiwUTlv98M86cUiEm0fYpTl/tXUFXCdM1OlJ8XE/A4jRGQrBDhNmnCf2Gu68NPfQL5Ztdh69e1uqhkVa3XzsY2IKoeGRmfG3G09HadzcQIDQucNSVYH0LwYTdz1HqXBklITIFYM6I2djAEiddzSti9t/edLmeIADvVbRL+tZI7odTnNhfaHJjfV0wvOBjutL47DeJkIBQ2REn1YwTOML3AxgKt7CMbFlyPr765hG0Qrzec3lD2b/6WnYsP3Fu8H8w5rrFz4Vy1tX1UN8j6sLSGW//4qzXjOh13XZzixzbKu2/YGhqTle1OhoIrSUPRJ7LKNPJMxbuZgexrcH6d46McrJidDWUTz0yvLbw4nkeji9St/vDQPw1ZPYnBKvVMc59STkVXXRPQKLsqfOE50=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Pu7AU3YaliBbdYDlvqx1/BzV1r/iZMU9xw1ocXu9+6NXKfk3kdudnfwThFA+?=
 =?us-ascii?Q?uTrV+SBgxxGXYM8bxlAZyfjaRXstk9pvZMvovnVa9VRSl2nkfJ0uzpBBPiX7?=
 =?us-ascii?Q?h2dsravLgVvKOVQI90qJTcTKOvM3JXIxeHSwOJ87MXQIe9bS2cyhv0Lnbk6R?=
 =?us-ascii?Q?iI9WCVe3AdCPN1getIiaA2sKsl0P6TzGuH6QS2A/zOYj+ysm0RuSlTXTwWZ1?=
 =?us-ascii?Q?wQX4zKU8GqEBagVigYms5uILCMM6mhkaZ1NcwH+mLIFsA6gGl1N0oXsyBgef?=
 =?us-ascii?Q?atyJ5/o1sCWNdlI+OLoAhUXmyb4g59CdrYaeXIEjDjDKdMzuLfYrLV2qcXxF?=
 =?us-ascii?Q?X0kzgbrXFTxsPZvGbgSbvQY1KyqGnikLZDktoHv0bf/DCCNCuCZivn1t0Svj?=
 =?us-ascii?Q?nVRLWpFSFT5WL6HpmiZQZwapZyP5fTf2/xPVW/GkBD9RtNT6+JEtdxcGfV6E?=
 =?us-ascii?Q?B/s5Cq5b7TX0/8pYsm0RXLJ50GmrijYs0+3tkQBcEAET1oJqbg4aOsXNnJIv?=
 =?us-ascii?Q?KeVC9MMGu9zzRZmjLdT8g9w0Py3Q9bfUkq0okTXMzyb+UApVl86Zv1z/qzFK?=
 =?us-ascii?Q?F5olvjcEg/e7M4SW15kTDGuKNQuZq4VflTVzIGP0unVZrQpMtAxTB/3TYxqS?=
 =?us-ascii?Q?WqLaK4Ju3Z3U4ghJmQerp5cIwZPHcXWNcSuUUiHstoLeBeElFfLnHkESeOak?=
 =?us-ascii?Q?hs3kZm0Z/kyor8rq/jABx8gI4BMcPBDLseGUbCzfwsEr6F7Jf09jpVzke9VY?=
 =?us-ascii?Q?YT9lntIX6BLvPyVLeQnNrO/VuZsQFr7tLNISPKnvsDMHQaubPQ9EykKwVOJA?=
 =?us-ascii?Q?erY1tx2WvBhEtZO2AdrTGFGid5x/dM+dM6AX1pmkFJeqswqH8cQYEN7Ms0Wy?=
 =?us-ascii?Q?9lJidciM2yVD4zD8nbnmC9rvd1HjcdlYjEumNPaDBs2wk26/l+UFcg1S+hew?=
 =?us-ascii?Q?LovIUF7FlY+bDVCNggUu0J9NfYk3TfYYZGMGvCHq9a25zpyfkI+33Lsf8BaB?=
 =?us-ascii?Q?D5Y0vIDZBdqwOcsDXdeEr6gk3eYjxu4Z5Q9OWpoRFmh6yNuvfVS0vNf+Gt1v?=
 =?us-ascii?Q?NBR5BnZ/FdoLATi5REXaqGHjgh0nJMJl81hQvqXzBdAMbFV3ImW+fgCFSk+Q?=
 =?us-ascii?Q?xp5T//8qv8hTgpvE5qrGOWsYMYypVS5dYFc5SGBLKj9jpbjsK0x+1nIxTgH3?=
 =?us-ascii?Q?5r6JSeOCMT+D2YF1z9diZvJLr6fZZRG28dG4TDnLXfU6xObweoU76O4wtG/5?=
 =?us-ascii?Q?9xTHPNclz/inESqSKWRAER21VQ6JRhbJwAJIX59TsGDbdjEH2gtZRSS9kdmo?=
 =?us-ascii?Q?SNArunOHEnKCkYXYX4yC8A2BDydgSN6K/nXFxtsNJ05bXibgyBEj22f+nBjE?=
 =?us-ascii?Q?k5MntKcA7WKM8a009hutY1QUp8GdwnyNLj1Ue11v8ThpvS6nuGWsshZXDPYw?=
 =?us-ascii?Q?o/Nax5UYomrPvaMF8CeA9JUdWENE4vXEikdeVJ8T05KvRvExjaR82NQ0/uD1?=
 =?us-ascii?Q?KhMQYEQH3DZemhcO3Ode3VpikoI5DWZgdXia2IzxSriSNt9K6vegI92Cvneo?=
 =?us-ascii?Q?TbAydtd70oslw0OzLAJ0yrSrGSHGzlCTMrcgjgepudGjXxFt6VYbWMzX7Lc6?=
 =?us-ascii?Q?9iuqL4J4zcKiZ7B0P0gX7EyinMof0aaWyZ7M1NOYNgk5+wugo9j+iluh3g1x?=
 =?us-ascii?Q?ASnfl47hdtysSPWosDzSO7NgS7Eg7YvXoLe+OTv8bnl3Nhkdvj3BLDtgd8K6?=
 =?us-ascii?Q?5FcKXV3jsslSvnpYhATzhU79pAq6ank=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43754aa9-c858-458c-51c7-08de7a15a053
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 17:44:03.6868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UKbZ2skPfz6BSMjLfgM3PsBAop5/ApnBiWp8T1Hvbd9voXeZMyH3hkBZRB0OWt1LNSNZEGofx5z8YeVuXq2N/bhXDyvZFZfAZuLYJUwhBsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8326
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: I2Chgjw76NAdkS_3SaAPesXEGijSwZed
X-Proofpoint-ORIG-GUID: VkYrFTFR8KJ0xcAAJ6KjeMkE4DPHdRut
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NCBTYWx0ZWRfX13KEyXTJ+W8C
 ZOd3830B7C2y2jggu8Q22Zi9R7gaZfOIY9fG5savoKu9AZ5gJJ9LiOClYWsDBSwmavya5ULf74d
 15yJxQTCYAqnmI/GpnPtUn2YH5y+qAYzbhDcrVQeMxmeIEEoj+odum6hW6AYU0r0fXIsWt2Y/AP
 dStpucnW7g3My74GW0lp52lUJs3PRaPsJERhrvaeEEHxu93qV7NrqGXUKl3DIpU4GRTGG2VR9Ms
 ymNjFk4UvvfZKJBzOikU/uwqw4saAhqouBwUgP4Ru0A8CxGuJJ2mN4F76gq1qHnTKR3zIWjrc4z
 lHVJbdq6ft9bWcmvT+yITJVokYO0mmDB5ASV17Z/8oDqV6FHiqb44Qg0dHqCAIUDuhxQOmY+s68
 f0e/8ZWJnPexQUmOYo+oyu8F1DPDeCwla0YUcaKDlqiLCi5BtAd7Tzcm+Cm5VyWrWMG3aZIdGI5
 QY80Cn/c2ZLj/lIOWnA==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69a86f68 cx=c_pps
 a=gGLfFga2G+uCUFnDxO+Iyw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=VwQbUJbxAAAA:8
 a=t7CeM3EgAAAA:8 a=nzq_CVlEzhOWP2AoRwgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040144
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 17:44:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232418

From: Harish Sadineni <Harish.Sadineni@windriver.com>

The `make rustavailable` process (1) expects the Rust standard library source files (e.g., `lib.rs`)
to be present in the `library/` directory under `rustlib/src/rust/`.

This patch ensures the required sources are available by:
- Installing the `library/` directory (of size ~50MB) into `${D}${libdir}/rustlib/src/rust` for
  making them available during `make rustavailable` for native, target & sdk.
- packaging `${libdir}/rustlib/src/rust` sepearately with `${PN}-src-lib`.

1) See the kernel tree for Documentation/rust/quick-start.rst in the section: Requirements: Building

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/rust/quick-start.rst#n145

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.93.0.bb | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust_1.93.0.bb b/meta/recipes-devtools/rust/rust_1.93.0.bb
index 2be0bd8d89..faafc63c96 100644
--- a/meta/recipes-devtools/rust/rust_1.93.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.93.0.bb
@@ -266,10 +266,11 @@ do_test_compile () {
 
 ALLOW_EMPTY:${PN} = "1"
 
-PACKAGES =+ "${PN}-rustdoc ${PN}-tools-clippy ${PN}-tools-rustfmt"
+PACKAGES =+ "${PN}-rustdoc ${PN}-tools-clippy ${PN}-tools-rustfmt ${PN}-src-lib"
 FILES:${PN}-rustdoc = "${bindir}/rustdoc"
 FILES:${PN}-tools-clippy = "${bindir}/cargo-clippy ${bindir}/clippy-driver"
 FILES:${PN}-tools-rustfmt = "${bindir}/rustfmt"
+FILES:${PN}-src-lib = "${libdir}/rustlib/src/rust"
 
 RDEPENDS:${PN}-rustdoc = "${PN}"
 RDEPENDS:${PN}-tools-clippy = "${PN}"
@@ -286,6 +287,12 @@ rust_do_install() {
     rust_runx install
 }
 
+rust_do_install:append:class-native() {
+    install -d ${D}${libdir}/rustlib/src/rust
+    cp -r ${S}/library ${D}${libdir}/rustlib/src/rust
+    find ${D}${libdir}/rustlib/src/rust/ -name "*.sh" -type f -delete
+}
+
 rust_do_install:class-nativesdk() {
     export PSEUDO_UNLOAD=1
     rust_runx install
@@ -316,6 +323,11 @@ rust_do_install:class-nativesdk() {
 	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER="\$OECORE_NATIVE_SYSROOT/lib/${SDKLOADER}"
 	export CC_$RUST_HOST_CC="${CCACHE}${HOST_PREFIX}gcc"
 	EOF
+
+    install -d ${D}${libdir}/rustlib/src/rust
+    cp -r ${S}/library ${D}${libdir}/rustlib/src/rust
+    find ${D}${libdir}/rustlib/src/rust/ -name "*.sh" -type f -delete
+
 }
 
 FILES:${PN} += "${base_prefix}/environment-setup.d"
@@ -336,6 +348,11 @@ rust_do_install:class-target() {
 
     install -d ${D}${libdir}/rustlib/${RUST_HOST_SYS}
     install -m 0644 ${WORKDIR}/rust-targets/${RUST_HOST_SYS}.json ${D}${libdir}/rustlib/${RUST_HOST_SYS}/target.json
+    install -d ${D}${libdir}/rustlib/src/rust
+    cp -r ${S}/library ${D}${libdir}/rustlib/src/rust
+    find ${D}${libdir}/rustlib/src/rust -name "*.sh" -type f -delete
+    install -m 0644 ${WORKDIR}/rust-targets/${RUST_HOST_SYS}.json ${D}${libdir}/rustlib/${RUST_HOST_SYS}/${RUST_HOST_SYS}.json
+
 
     chown root:root ${D}/ -R
     rm ${D}${libdir}/rustlib/uninstall.sh
-- 
2.49.0


