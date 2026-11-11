Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12617.1794411912371519792
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 07:45:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=TKd0DY9k;
 spf=pass (domain: est.tech, ip: 52.101.65.65, mailfrom: benhur.tessele@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Brir0qMSoCAEW953tNoGij+aomWxNXBeJorhwOyHWkbVJDLu446hm8xQNpwgNXWB+5qA3e089Zja0Y71qGSfqLIOl+bSIOx5KN600Whq4J6eV4hk4s8UoCJw2ICjZwC1R6SZPMVQ3jpSjYnqHBmLTjuFj2aZp0q2MtllZDPss/5pBTBl06JhCWr9xPGIZeFw9Je/QdBz2QaL96sNbYYNwza4KkBoAUVdSi3WZqB/9NHCS0ZOqI/F4DxpKWjF9dxVmGROYDQsGxTQygQgk4jhZs5O3yuGYmJ80JS+N722Ne82poWhHSlCZBZAH0jtYzwM94Kv9Xt23hURmRuG4PNQjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q39KOP7fv020y5wn7dWCHwJcDaqjWPO9OwtbNvJONEk=;
 b=cQP3uywzQ2V3eUAliT5MG4qLraKVALlZcX1VNi3KzLbsPdfBj77mD8afwOROPmtdO36fZkM4wo1znjn+ZkDR/xvULtHinUM//HcTiyY4YIeVY+A8TIUu2RkXKPASugdlvQCJGGsDtOSZdqm5L5zeOGSMgECQ8MbUvjB02J6H8BUOCXNhHgHxJTzEWvpLtAz91qFd6FqrgYcHfcdw2x1pPATsPvo6M5YSxffIB9DX9dbwf0sgwamfRZ10LtH4m3xfdrAUfqO7i3XzrO011hya+pqP3m9ufGwKVNn+Iomra6GCriokYvnv4puhaI8uaPGbiPwNucc+phblTk5oBJ4SBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q39KOP7fv020y5wn7dWCHwJcDaqjWPO9OwtbNvJONEk=;
 b=TKd0DY9kd6/M7kjAnUeEvxUq0aWIfbFEbPRIcEKMU/LNEV2NlObKz0BYZWHeaMyCA1e5hTdj6rMhGpfy5F1DfrHzSC7DuS4DSLLi5eOSabm4ye0VycT/M1TdNi3Byvr6XI2qhRSp0npwy07OgVE0RKtbA5pWmqyLXIjfQzRu4o+3Rwl9W/scqlfS4TiTPs2BCPjcnUh3UbhxiTcjBa3CrtF0JDhkeL3GRlFStJbu/qpLp6pEH/wFiplt+/FcanHJVhws0tnsevdaxvt1KiJ9FIltbwNkq/zNYCvBCuLeKOGp/8reSH9E7m3tY1A28/wZIixIcG2LIN5NWqGi5BFIfQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU0P189MB2250.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3e2::15)
 by VI0P189MB3115.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2cd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 15:45:07 +0000
Received: from DU0P189MB2250.EURP189.PROD.OUTLOOK.COM
 ([fe80::9be2:1092:4622:e248]) by DU0P189MB2250.EURP189.PROD.OUTLOOK.COM
 ([fe80::9be2:1092:4622:e248%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 15:45:07 +0000
From: Benhur Tessele <benhur.tessele@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Randy MacLeod <Randy.MacLeod@windriver.com>,
	Paul Barker <paul@pbarker.dev>,
	Benhur Tessele <benhur.tessele@est.tech>
Subject: [PATCH v3] rust: add rust-analyzer to the SDK behind a PACKAGECONFIG
Date: Wed, 11 Nov 2026 16:44:42 +0100
Message-ID: <20261111154442.241009-1-benhur.tessele@est.tech>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261006111230.1478039-1-benhur.tessele@est.tech>
References: <20261006111230.1478039-1-benhur.tessele@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0104.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::8) To DU0P189MB2250.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:3e2::15)
Return-Path: benhur.tessele@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0P189MB2250:EE_|VI0P189MB3115:EE_
X-MS-Office365-Filtering-Correlation-Id: 099470cd-b2a3-44b3-ab91-08df400ac2b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|22082099003|18002099003|6133799003|3023799007|5023799004|11063799006|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261026121527099003|56012099006|261022075727099003|261021123027099003|261102123227099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: Rpq8Dw2W8YEXCoOKZjt7i5aoy1nt/BHX4g2x1FoZTU52DfwaBi7PimPaX9f4mkQDDZPdIGE/1wOI601SpGUSPxDSbHjL0uCfn8DEYcx9+BIKWorRuJtIdF4k+fGOLSFXZN3kou+56oOk0uilhhcQkqzzj6NE0jWp+Sala0Ij+yQC7ppYJrIMnBHnh0V3j8v7tN9GGzQ9bEj+73jhSJ/Y29HxhdGL3nxmZhavLsylBIuqK+IhnJRnt0XSyzDwQst6maeu4n6mfhdOAfZXaZw87LE+Rn+o0R1YEQWhgUdXVPdeH9WUogPuhKrfccJ5DlzFL3vKo4ZoAHj1fHhzrc1+HZp+6mxbayl6QojalPhaEnxCMzGKcZce2k5MKxhYYa6YaXCfdOAV01fLC8SopvAcimj+zRCPN0kgQLnzdi2rJMJhmpLrfYiys+6WuKgL9x6/srjGpQ5HgDoAZPKO4KzmMN8uHvrJpdRWVN4j2UxXzXhzNt/+GVDiEP7paCBFD7sJdgaBOo0GLHSM+6isHOPS8AzUlCnZ+52mzR/faGGFaLJeDnY9Y1+ajpJ/PZjeol2gw7UlaTc+yglbfFJdJ9qPqA38mhjj/T9PN59rBQ3iVQXUJAAS1VA30q+tIibigEPCLSAPXpR4RWmVTltSFtD5p90J4kGMBHjDx5c3ecgndfU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0P189MB2250.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(6133799003)(3023799007)(5023799004)(11063799006)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261026121527099003)(56012099006)(261022075727099003)(261021123027099003)(261102123227099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B7NuBRdZ6ASctJWIWnJy2JnzPuoRTDZACOwqbz1/hUJEPmQKyyYIg7hNENZI?=
 =?us-ascii?Q?+CATagOtL6RNBAVuAefoU2HxqC98cxnEsvqWgDcvD8z9n9WmHfuYIJv57A+u?=
 =?us-ascii?Q?AZGFJvoyLiuGpW+2FvMYhkSes5X/4S54gBBsgT02OjeOohetMPIf1kDRVzfI?=
 =?us-ascii?Q?uRq9zJFGNMkMQGj3hMAk/mPiFO2GKWedXs8MVUYyReD8qcGEFL9mWO/zoupL?=
 =?us-ascii?Q?bnWq+so1meGvVVFPbLM/LQA0pcNmwIDkqqwXA1u3FZNg1XEfJYZ1e3XlRtSb?=
 =?us-ascii?Q?GoJeDNzLJ+TqyEcq8q43WmI3KeTOuEvLfJV+Qz70ElqjobeVw3tv4BXNXBWH?=
 =?us-ascii?Q?6rlUXPtiwt8eS3xMbW0jgj8e+zJAZSxv1ZZZ/0GPb6ea2zOH3U8pTFpFPn+b?=
 =?us-ascii?Q?PGGUGlb/CA73X2vefU3W2UGxToQe+UxvrtjIoi8bSUmQuVN2NikBUZqu6vAP?=
 =?us-ascii?Q?GzT/bQO8QHx9BldIVUn/z0CNvHH33449LxTVf0cGZHYAN4sktS+1/7kHu72+?=
 =?us-ascii?Q?pUFI/2DS3/Mo7eyJP7kkCHOLZbID3YY2al0nPuKr61TyCOptCgi9xJELP7dA?=
 =?us-ascii?Q?ReSwPNrA5pn0+D5GqAu0BDLaDaxLJ/lPWI2wqMv4Pf2wkVf0RpbgEXlitzsJ?=
 =?us-ascii?Q?DukDI62u/IiKU3H/wPYqFtOVrczXUDBhSBYHkqHElT6qIX0f6zyvtuoLGYJJ?=
 =?us-ascii?Q?xri6WzYCPOPBUXChcu40Eo7FLM0FIGM3LSpbLdz9qfWCCcrx13iwice1UtUh?=
 =?us-ascii?Q?Hryt3BnbRScbf/5YkKnzqVUON5HjXG8BiHiTme+WKgaAEUfNVc3vIZY00js8?=
 =?us-ascii?Q?pJPA0Zm3xENrHnlHRRphqx03CpVw6e6QE0zo1hz+GoervXgca8nEfZAhseD5?=
 =?us-ascii?Q?492tuo07EVWKFqoIttz4PIy7tHeF3rNbTg+b3PU7gsw10UuzDXeZyJLOGsHB?=
 =?us-ascii?Q?HBMvOn6JCsVSauYXOXgj/+WTPJaxwockzVXLeMuqLzdf7x4Z00AsOTHlnAkf?=
 =?us-ascii?Q?jHxIELxxEs1uAD+mHyKaryISy6GdCd3nB0znwcyWST5XL/spc2ZHRQgxfUXG?=
 =?us-ascii?Q?ZPP0KvccYtZmFqa/Rch3vYkUgyJHFU8yhQfR28w/WxaKKTUPF/Ah8lKO4nI2?=
 =?us-ascii?Q?QpYjYgPWxI1k2/VoHk5DCFwqexwsnW5Orjw6Lne+xJ0KTWc6ug3cPKRMXLXB?=
 =?us-ascii?Q?DLbpcD+oNDPzEDv8lAKe8GL3rA1+oAvK0HnnWCoG7GNFEVfCFFax1KltWJ/m?=
 =?us-ascii?Q?dpsv2g4UIEk2RRuoMTtTuy0/VrnXh5u2sGyREBSReRuAi1AzfBMQ88fuYvB8?=
 =?us-ascii?Q?gK3THWqXhn6N4owfWHuUUlNzWnRJ488osZVnsJaydfxeDwZWuuusFFAx6+34?=
 =?us-ascii?Q?0mnwzWanp/XNP5cBUQFAaHv7bGiqARbVqKR1+j6ShBUuLJCbS6iKl8Ax2S7t?=
 =?us-ascii?Q?R/lPLXE6J8RmrLQ2KfuSAZlYOxBnkp3zo1TROhtX1J3ig9m7j/yWL7RYr89R?=
 =?us-ascii?Q?CTylZkK22DqCUO7Sh6oPI4POhR0yOEJ3svBoP6UBLUfRulRHLkLxQLYNOxeo?=
 =?us-ascii?Q?mYqJVFF2vMO0gN5uQGsI+MAYhMNBq3tezm6rQu7xcwfJv47sKjdy1dN1atkF?=
 =?us-ascii?Q?Lu3Ibf+OIsm+pD3N9Xd8/+4lKkRZRUpvF3W4gdu8LOGcCORrqQydNIxTzLLq?=
 =?us-ascii?Q?UkRdd8cdEZEzKWJrjODNFKS1sdf5PeuR5XykmSFgW9FARXuNZ/KkI+rqVhYd?=
 =?us-ascii?Q?2LCruwElbw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 099470cd-b2a3-44b3-ab91-08df400ac2b8
X-MS-Exchange-CrossTenant-AuthSource: DU0P189MB2250.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 15:45:07.2036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EPy7LJXvWvpQ4ChX9tM9o0RvrZquOgY5GZMCbWYPyINIRGMUUEd2m7YPpahd0+xrN95AZhM1a4NZ4fhxxuoMVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 15:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250038
Content-Type: text/plain; charset="utf-8"

Add a rust-analyzer PACKAGECONFIG option which, when enabled, installs
it for the nativesdk variant and packages it as rust-tools-analyzer. The
option is disabled by default.

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

rust-analyzer is only installed for nativesdk, as a language server is
used on the SDK host rather than on a target device.

To get it into an SDK:

  SDK_FEATURES:append =3D " rust"
  PACKAGECONFIG:append:pn-nativesdk-rust =3D " rust-analyzer"
  TOOLCHAIN_HOST_TASK:append =3D " nativesdk-rust-tools-analyzer"

Tested by building an SDK with the option enabled and confirming
rust-analyzer resolves the standard library and expands proc-macros, and
by building with the option disabled to confirm the default configuration
is unaffected.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Benhur Tessele <benhur.tessele@est.tech>
---
changes in v3:
 - Put rust-analyzer behind a PACKAGECONFIG option, disabled by default,
   so the default configuration is unchanged.
 - Dropped the packagegroup-rust-cross-canadian patch: with the option
   disabled by default the package does not exist, so it cannot be an
   unconditional SDK dependency. Enabling is opt-in instead.

changes in v2:
 - Installed rust-analyzer for nativesdk only; dropped the target install.
---
 meta/recipes-devtools/rust/rust_1.99.1.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust_1.99.1.bb b/meta/recipes-devto=
ols/rust/rust_1.99.1.bb
index 7da662c453..d0943b1941 100644
--- a/meta/recipes-devtools/rust/rust_1.99.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.99.1.bb
@@ -24,6 +24,8 @@ RDEPENDS:${PN}:append:class-target =3D " gcc g++ binutils=
"
=20
 PACKAGECONFIG ??=3D "llvm-shared"
 PACKAGECONFIG[llvm-shared] =3D ",,,"
+# Only used by the nativesdk variant; rust-analyzer runs on the SDK host
+PACKAGECONFIG[rust-analyzer] =3D ",,,"
=20
 S =3D "${RUSTSRC}"
 # Separate build directory from the shared source tree so that multiple
@@ -260,17 +262,21 @@ do_test_compile () {
 ALLOW_EMPTY:${PN} =3D "1"
=20
 PACKAGES =3D+ "${PN}-rustdoc ${PN}-tools-clippy ${PN}-tools-rustfmt ${PN}-=
src-lib"
+PACKAGES:prepend:class-nativesdk =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'rust-analyzer', '${PN}-tools-analyzer ', '', d)}"
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
@@ -292,6 +298,10 @@ rust_do_install:class-nativesdk() {
     rust_runx install
     rust_runx install clippy
     rust_runx install rustfmt
+    if ${@bb.utils.contains('PACKAGECONFIG', 'rust-analyzer', 'true', 'fal=
se', d)}; then
+        rust_runx install rust-analyzer
+        rust_runx build rust-analyzer-proc-macro-srv
+    fi
     unset PSEUDO_UNLOAD
=20
     install -d ${D}${bindir}
@@ -300,6 +310,14 @@ rust_do_install:class-nativesdk() {
         patchelf --set-rpath "\$ORIGIN/../lib" ${D}${bindir}/$i
     done
=20
+    if ${@bb.utils.contains('PACKAGECONFIG', 'rust-analyzer', 'true', 'fal=
se', d)}; then
+        install -d ${D}${libexecdir}
+        cp rust-build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/rele=
ase/rust-analyzer ${D}${bindir}
+        patchelf --set-rpath "\$ORIGIN/../lib" ${D}${bindir}/rust-analyzer
+        cp rust-build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/rele=
ase/rust-analyzer-proc-macro-srv ${D}${libexecdir}
+        patchelf --set-rpath "\$ORIGIN/../lib" ${D}${libexecdir}/rust-anal=
yzer-proc-macro-srv
+    fi
+
     chown root:root ${D}/ -R
     rm ${D}${libdir}/rustlib/uninstall.sh
     rm ${D}${libdir}/rustlib/install.log
