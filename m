Return-Path: <benhur.tessele@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EFD8CA5FED
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 11:12:56 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43187.1791285174141141395
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 04:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=VEztmTd7;
 spf=pass (domain: est.tech, ip: 52.101.69.27, mailfrom: benhur.tessele@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nO1CR7FxrCCUSWNaMkf4e19HusyGqoMuaatIQIOCEhvOydJq5epwr1zwDtAjySYOSd7FmQRPAqLRnwu5+FXW0/8VX+gHQDn6QQwcCVXJATfhoEV3Z+7LiNSTkczBw3li3EOhlY+Ch4Oe93avpC0HrctHQENXdLK/bD97A95VHCSFV9/efijRIYHx95woWrlxyhl9OPik2pHLuDmTqDoire8d67xJhbBuj3D/86CmUO7LvEBRK/eS9yCn6pxwutGViKG/FhiPxx++++OVWPCI45Dl7o4nCg2crbqI+TexJBBGDop8zxN7X7t+mN9X9YTS5y72y5dIzJgR3Y/uhxyLMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYJ9gM48MG8/LD6Ug3wtLgGDRR8+c5N/hXlU6Csj/Rk=;
 b=r+sR46r38o+HYwnPEBcr8iPjknHJ8lmW21lb/DNcCKIowG8hHvSaMYighMe8uiwejW7tzu1eKsdlJGAQqpEIS/+weYXX9GZ6I/WCjEAlw8dnxYE3E7QG/4BzxkkeXuDXZtgPpl2ufAdQ33r1r9VFrS11pORSPxDt+ZIRjGmGD8t4AJhPS4g90Pxrib1njubOFAdfyx6t/osG8Y1lc+yvJdb9EFlVmoovlDFgd7A4TNP6259IvsVYHbx7LSfJ00Z3OBSk7S4IXqL4hYs+aagbFggRw6FbqwzKkMTDi9nM+Y5cTBR2COsqkCUifc0qQ9WHMVg11y2QC2Oxm5HoJCj2KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYJ9gM48MG8/LD6Ug3wtLgGDRR8+c5N/hXlU6Csj/Rk=;
 b=VEztmTd78JM0dLqfg/Ntb53Sk1zWOGrq+OegmW53E2ev/YiAUGwGZKcA8/KC10nhNVf83sTS9CvafMM2q+PlAUJTqpX2WBdA1nglw7y76tBVOPUAYn71+IdINzTV3VEF1/rRNZztjELf/chd8ud3fTnq6/9pb6ws7UFOqg7MFhFtgJ1Crtt1tElWeOVJLb//aGdN0yi1E5xOrRM09qwDKWjCRBxhDjWYm1F054m/calp/u9TsVdujcum4p/lFrBXhEUdb9Io029IdBCsHoYlf0fx+4tUGPK48y8kUWRPVz//UHHzpcUY336hpVniZT/LMRxmlb9h6y9/XHBuB4uAeA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PAWP189MB2572.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:35a::16)
 by GV2P189MB2212.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:a8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 11:12:50 +0000
Received: from PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
 ([fe80::5da2:7509:7be5:d74f]) by PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
 ([fe80::5da2:7509:7be5:d74f%6]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 11:12:50 +0000
From: Benhur Tessele <benhur.tessele@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Randy MacLeod <Randy.MacLeod@windriver.com>,
	paul@pbarker.dev,
	mathieu.dubois-briand@bootlin.com,
	Benhur Tessele <benhur.tessele@est.tech>
Subject: [PATCH v2 1/2] rust: package rust-analyzer for the SDK
Date: Tue,  6 Oct 2026 13:12:29 +0200
Message-ID: <20261006111230.1478039-2-benhur.tessele@est.tech>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006111230.1478039-1-benhur.tessele@est.tech>
References: <20261006111230.1478039-1-benhur.tessele@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P190CA0006.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:10:550::18) To PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:35a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAWP189MB2572:EE_|GV2P189MB2212:EE_
X-MS-Office365-Filtering-Correlation-Id: a719677b-8fa2-4cdd-c671-08df239ac22b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|5023799004|11063799006|6133799003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	S/ACHNR++GOWZfommFWRlDqhSCChj5foAImKE5zuae1VEwFsR/JGalROLDm5rwwayH+1ulKELC9iIhwdiWur7WUu1KW5szn3dJnyGGabFVZxelaMAYtqEJ/FEsaOTVeF10W7jNzkc8gw1lrW7ua5KRtpBmXuWerh7Aib5FNWdabzgDylkDa1LccIncUkhuD96pXrXnGNJogB0tYaaMBZW68e0JzoTnKboJrmteqYdJWMTeYzFaR60zeyQqvSZfM1GBOWD1C4JNWRKZPecbnEbA4sVxpmpfDnVa6z4GMQRIIiquN0EjhxOI++QFrngxPOf15vKN3EqsFC+XCE7lqX5zs8mzlM5KxOtevk/fupA6ztCDMO08NQGEbARup8HBdVhwbUKiSaKp4g4yyZ6WeK4FkVmaf2FAYmnA108+xQn7XaCLhUkNYFXZlxSmAcWZyCqva6MkQs3jBNK2uJWwgLCx+XQmhgozNAsrLmMpx2ytHs7BVGpg0+vmNk6CA0VTu/l9By84/ntwPyxZwi9vvGTLgXo4zSvTplnA8z6tJUnudJju7BRdHodjD6jsfjiOdtOCqkHqYKjoA8GAdaEXJmmYHGU6m2M0huzICuO9KL4/cP5J0AmJS2QjRusOchix+XsDYACOfxRbxQoNQoRFwam7HA2yXhQA7IDC3WvvkleN0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWP189MB2572.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(5023799004)(11063799006)(6133799003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EfiyBsnOXm+1sygXOWZ7QUjJ/qV3armCWnzmN5xWomuXrzznxCQbnOZn5Nm2?=
 =?us-ascii?Q?jL/4f8nWWt7yto2CANI3QjnxdDBes1YJJF1UiDahLgzuUzVIX7uRQlfG0bBS?=
 =?us-ascii?Q?9RXwrLL9+T9/Rv8t82YOi0N8nH6JYsA2gmCDUIxi9S8p6kCd+ptq4VVJeiKl?=
 =?us-ascii?Q?h/cijxALrrWhhCw2daS0IokRpCpOZRhqQMELYGroDXR+u9I/lf1oU9dPUx6R?=
 =?us-ascii?Q?x0GpaOisH6iS0ojjmRPe8OxGYIs6GmFdrXgKt+cN/Ri9kVXutEUEMQS8Xn9b?=
 =?us-ascii?Q?z6erOQH0ND9c021i1WOKUAAbUrDEwosHCQ2TTZcLPIoGytSAHSJ0YH3tC89b?=
 =?us-ascii?Q?x6hRmlNWKi4gytn95fNMBDsZrjVhWwmNL1RVe1dE4hDgiCcgssk1dfHE6q3O?=
 =?us-ascii?Q?82PpcRxKaU1WrWGiAyhWl/PQq4iDKeqTs+2VqrD6s6qRL9TRRhdpzv7dSxxT?=
 =?us-ascii?Q?0FfWQok5ueADAEYzMX9T0GG5FS0ujb4GqLGIkIKNKKW2b5NNN4f5tQs7tN1a?=
 =?us-ascii?Q?0kz2G0GjxGFX/tOxpQLCGUv4fz41yhh+yzxEG/SBTtr7NLYbTV1Lhhz5//CM?=
 =?us-ascii?Q?DlRUUNNTOuKJHD0e8D4vSFDXJFvnS9FcJuDDGFJ/QxmzhkRSGP13+UXmNiEm?=
 =?us-ascii?Q?LDNLHA5toPI426ti2pRsIb+pUw8JpyNgjm4+dC7YqqN82UjJLddQ8xZtyvGD?=
 =?us-ascii?Q?SOIpNEIGvw1bsCBOmX3BEo+yE1lOOoF5C/zq60R5ZSqj/fdMHuf5Xr8wMjfU?=
 =?us-ascii?Q?sqN6vZDmSA67ij6dSgj8RuisZE9s9GzDXUI4vmDrMFkVKQBlBbMQYjWon1ju?=
 =?us-ascii?Q?kp+efKZLvX1fphXPQSTVG45YxxMu2nkK8WGNQCYfhoaHJe407eWXk/kIQllP?=
 =?us-ascii?Q?dr/Bif34Vpy+3XPPYnbHwRCVM5CPeuU/8Qz+FZP8ndrwK1RZrtH4aTGYLY2y?=
 =?us-ascii?Q?A8/NC1b8sDuwiuyA46Wp7EX13OY7/zoxw36eGggCikGjApLeRiPHru5bJ/vt?=
 =?us-ascii?Q?pF6y1RQMjNCGyhFUOnGWfQ72thx0an/uA8PiOEWl/TN02pc8QuEz+Bleswgp?=
 =?us-ascii?Q?PDobR9dThCnz3H3Dniid/AcKxwznKK5jTtCmoT8jQpGVFavf9rRfphALyXvl?=
 =?us-ascii?Q?k6SQsJiZEZJf8azGXJwkLLs8DTVqAH6thBzfqXfbBYljCjEoXDXH32c2+gop?=
 =?us-ascii?Q?41jMZ4ZyMKiT3QxFEu3kQCMTkrf2aODQiyWv+fR16jL8FOvlGphnXdOzOHuu?=
 =?us-ascii?Q?VBHPzvg3W351dWK04nJWrk5EdbPOzgdsQy0z5WLOKE/P6hKiGU9Nl4R0GeSV?=
 =?us-ascii?Q?5U6JrWpWrSnPGV7+GrEiSwLYZtzGH1ALtGisoEz7tiW3vv8g3FllKL0ing+x?=
 =?us-ascii?Q?0JkOtUppgNiHBuNIBEewNn/MxtQ7ny8yDqMz5LdEyMkHIqRkZknqebXKJHaN?=
 =?us-ascii?Q?pvj+jlrX85Iccl3lFDG2TgvrPixRqCrmjkY7E/mJic7XL/+kIyylSMD5ttoT?=
 =?us-ascii?Q?ck6Wiq5IPc2IrLt0VaoyfzkqTtDrOUDA6SpThrLuE6tmzQI8WrcCxRFlsCwX?=
 =?us-ascii?Q?rmayIHSwbpmOr06dpqK9ZWPVmdBK+ih+058ruiF0ayTL12gn/WAwDKtvfImq?=
 =?us-ascii?Q?UXm1X+aRPSAWmnVu/uovzSgRhxTU48qonp3JCvrT1WOPuKLmYSxSgSz8bTFl?=
 =?us-ascii?Q?I2PWibsyd9kLCWBAc10aWnTVPcTF80ix/5cj0sRaxV878cJtMXuoERVNEFzk?=
 =?us-ascii?Q?Vn0EPYUWJg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a719677b-8fa2-4cdd-c671-08df239ac22b
X-MS-Exchange-CrossTenant-AuthSource: PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 11:12:50.1233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iKYrKkXzH4dJ8QW4n5DC3Kyd3VtRy3UeECQpb9vJZipTPH9r842K4khBf56k3CB3Hua2Kzq/ucx4clrRU29gzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB2212
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 11:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247283

rust-analyzer is built alongside the other Rust tools (clippy, rustfmt)
but was not installed or packaged. Install it for the nativesdk variant
and add a rust-tools-analyzer package so it is available in the Rust SDK.

Two additional pieces are required for the tool to be usable:

 - The proc-macro server, rust-analyzer-proc-macro-srv, which
   rust-analyzer looks up under <sysroot>/libexec. Install it into
   ${libexecdir}; without it, analysis of any crate using a derive or
   attribute macro fails with "cannot find proc-macro server in sysroot".

 - The standard library sources, which rust-analyzer analyses from source
   rather than from the compiled rlibs. Add an RDEPENDS on ${PN}-src-lib
   so that core/std items resolve.

Both binaries link against librustc_driver from the main package, so the
package also RDEPENDS on ${PN}.

rust-analyzer is deliberately not built for the target: it adds build
time, is unlikely to be a use case on a target device, and fails to build
on NEON arm32 tunes (beaglebone-alt, qemuarm-alt) because it pulls its own
simd-adler32 that uses the unstable feature in 1.98
"stdarch_arm_neon_intrinsics".

Signed-off-by: Benhur Tessele <benhur.tessele@est.tech>
---
 meta/recipes-devtools/rust/rust_1.98.1.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust_1.98.1.bb b/meta/recipes-devto=
ols/rust/rust_1.98.1.bb
index 1f4ce5ebdb..f9d68ea986 100644
--- a/meta/recipes-devtools/rust/rust_1.98.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.98.1.bb
@@ -262,17 +262,21 @@ do_test_compile () {
 ALLOW_EMPTY:${PN} =3D "1"
=20
 PACKAGES =3D+ "${PN}-rustdoc ${PN}-tools-clippy ${PN}-tools-rustfmt ${PN}-=
src-lib"
+PACKAGES:prepend:class-nativesdk =3D "${PN}-tools-analyzer "
 FILES:${PN}-rustdoc =3D "${bindir}/rustdoc"
 FILES:${PN}-tools-clippy =3D "${bindir}/cargo-clippy ${bindir}/clippy-driv=
er"
 FILES:${PN}-tools-rustfmt =3D "${bindir}/rustfmt"
+FILES:${PN}-tools-analyzer =3D "${bindir}/rust-analyzer ${libexecdir}/rust=
-analyzer-proc-macro-srv"
 FILES:${PN}-src-lib =3D "${libdir}/rustlib/src/rust"
=20
 RDEPENDS:${PN}-rustdoc =3D "${PN}"
 RDEPENDS:${PN}-tools-clippy =3D "${PN}"
 RDEPENDS:${PN}-tools-rustfmt =3D "${PN}"
+RDEPENDS:${PN}-tools-analyzer =3D "${PN} ${PN}-src-lib"
=20
 SUMMARY:${PN}-tools-clippy =3D "A collection of lints to catch common mist=
akes and improve your Rust code"
 SUMMARY:${PN}-tools-rustfmt =3D "A tool for formatting Rust code according=
 to style guidelines"
+SUMMARY:${PN}-tools-analyzer =3D "A language server providing IDE features=
 for Rust"
=20
 do_install () {
     rust_do_install
@@ -294,14 +298,19 @@ rust_do_install:class-nativesdk() {
     rust_runx install
     rust_runx install clippy
     rust_runx install rustfmt
+    rust_runx install rust-analyzer
     unset PSEUDO_UNLOAD
=20
     install -d ${D}${bindir}
-    for i in cargo-clippy clippy-driver rustfmt; do
+    for i in cargo-clippy clippy-driver rustfmt rust-analyzer; do
         cp rust-build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/rele=
ase/$i ${D}${bindir}
         patchelf --set-rpath "\$ORIGIN/../lib" ${D}${bindir}/$i
     done
=20
+    install -d ${D}${libexecdir}
+    cp rust-build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/release/=
rust-analyzer-proc-macro-srv ${D}${libexecdir}
+    patchelf --set-rpath "\$ORIGIN/../lib" ${D}${libexecdir}/rust-analyzer=
-proc-macro-srv
+
     chown root:root ${D}/ -R
     rm ${D}${libdir}/rustlib/uninstall.sh
     rm ${D}${libdir}/rustlib/install.log
--=20
2.43.0


