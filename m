Return-Path: <benhur.tessele@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE0F2CA5FD4
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 12:57:09 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10612.1790859426344980316
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 05:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=MtgVNwpJ;
 spf=pass (domain: est.tech, ip: 40.107.162.67, mailfrom: benhur.tessele@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m5N0/tthNUKCZ4j1cELFQXLXIEplJHzjbuihNpQLHdXPruWr/gfiNaeYahH9vck5wwlxP0kW45qZ+YS6kScEK1rSosr4/q7Ybs65ZM+Vvc8i71IsIJSuLKYZ4f4yhJF22U0n3sg+MjyTWJrkIjFWChuzSjoA6TgWeGu0SYYfBeyH/yv39YaA203Uc2jUlgJ0sBVELuNCwmBZnRNAj18pqo2KL/1xoTjWHzqxncIQMuHy45YOnC1Jl2lrl6bZlQjjGhqq9zKZxjgdIQf43BmpMsWqdMLX+fZZIyt0/m26BLOgxjgV2X7jz6FbqEZy2w46tRwdy+WZ6QQnZJQ18kKPHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NW2n4gSplBmceDlWDQRXb9YHUUaJLfhRzGaq7hzM3uY=;
 b=Bo3ZmkckNgArUPB36LV6Ptn411H50ffpEPmU9CwzWQdk9itA9XleqW7MW/QyitMgNK+sPnwDG/QxKf9CNdR0eQNwXa8mxbeZXzs5Hewoa6Ropo39eCeF14n/RDmAx3SDj9civxqB4VJ9OvIXXZjKYyhAlT7aC1VW1RJJ7F5kHFP20eG7DA81UKSgRNKgWXwcLhMjhKiBTm/XT08CmiAb8wnbozY5v9rRYql1ZtvxRrZPONJjFSoTnkSzxnrFzFGP0hG3UkHqRIGRpukC6OW5XvVr/HggCJ1ap1NhHZMUbpQxCMuy4qqcbjIUQHhv1sY7GRnyEaOkGqPSeJbkebCMxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NW2n4gSplBmceDlWDQRXb9YHUUaJLfhRzGaq7hzM3uY=;
 b=MtgVNwpJfcRzvM6XqBdxNaIyOasYMEeaiNd6ajkD/3CYf/iypjnFPQDJX80sqyXvoG4T4JY3Q8qebbCMtANTXXYP5kLL7sASG/M24GnNihbi6ivZxlR7I1gElvJVMVv42v33WAkr1Rz3nykhCI0xFYvgTrozW87X90+tLNzEg3EvfMDhPF+4lygFtZIDp3W1tgCJA71Ctici6EhZtCT3rGq9TwbNuDDWAyxNWSvHaBltlIPhVqMVudo4lxswBuuJVAtlJWLi8ot2TKnlnu2lsLook5QFcUlJKQZ7mmyao+LHvgLGSF+TGNzbMpmb//DNJysMHVWqQG8PpwC0VUeIQw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PAWP189MB2572.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:35a::16)
 by GV4P189MB3559.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2bb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 12:57:04 +0000
Received: from PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
 ([fe80::5da2:7509:7be5:d74f]) by PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
 ([fe80::5da2:7509:7be5:d74f%6]) with mapi id 15.21.0472.016; Thu, 1 Oct 2026
 12:57:04 +0000
From: Benhur Tessele <benhur.tessele@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Randy MacLeod <Randy.MacLeod@windriver.com>,
	Benhur Tessele <benhur.tessele@est.tech>
Subject: [PATCH 1/2] rust: package rust-analyzer as rust-tools-analyzer
Date: Thu,  1 Oct 2026 14:56:29 +0200
Message-ID: <20261001125630.760962-2-benhur.tessele@est.tech>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001125630.760962-1-benhur.tessele@est.tech>
References: <20261001125630.760962-1-benhur.tessele@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BE1P281CA0230.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8c::15) To PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:35a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAWP189MB2572:EE_|GV4P189MB3559:EE_
X-MS-Office365-Filtering-Correlation-Id: e91bb956-d0de-4025-b02c-08df1fbb7e35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|56012099006|6133799003|11063799006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	5o7oGAv+j9TuhQ07pEpnDfzxGnfZdfaIbSpALVK+jT2kIvBH0uqcrsS6O5n/saw59CaRxWDzVJr9HQR+UvDvVfoJOMItZb28t4Y2nlkPdw4yXu3u0qGXZvgSuU6JKTKBdYBbRJTqkkOSdvjBBrML3En2zbBR7ERRYOAIkwn79DN53GYWWbv+EEKr+1qL226lrbQp+ZAS7BhbuA+cWbfOVJSG/JoDUJqcFiJ/fH6aYkUeC5p9+NAYDLHPnqch4uila134R2RAmQSjlBN7lLJxp7gP4I4k0TJsczBQPLS1ShrKqo5PokvpFG7VlVsM+HeshRTB80TR0uoW1sCcMoL5Q/wzdeYvifQWuNFoE2reP2qbmy3jA2ryvCWvPvm2YLhgKNkBsmkpUHvhy6yrY9WVHuztIFf1WnkLmnry3khhOtkaebE+KIytqts2y1dTiSCjObKuIRyLeDPO0K7PNE1WzBxwn7aiUO0wNw0746S6DU9C5At6bT3qA7Ps5ZK2cvyKq7xuTccegvRqptNhmoqpjnpLAFsE9gI/axJ7+2m+HkbmePoDzPZzifRg0RJKytnErNVLgYldwUuQaFKzqEJKxwKLbLNWaOG7K3h74GS/HApoYH8yExKssF5rAOKJX17pIprK7q+8VlesQwSLV/KRg0lWfr2vFx/JT+3b25lGxNI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWP189MB2572.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(6133799003)(11063799006)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UeKAJNdJhgone1WWEAWwXH2wE0J+f9FrhuvVxbLfh2umYGNmQvNlJtWa50NN?=
 =?us-ascii?Q?f2ab8Z/EF36wMGs7pjmK4iaY1BLAByoOvK+/JHTKVFpJkok8+hBrm57xJWio?=
 =?us-ascii?Q?2Hpplj2Y7nGA2DSbJsdJ28aOdPu11Zq3dQ4hRNvjp1YH+SwynkCHciZSi+ji?=
 =?us-ascii?Q?3uku071DiwKKKCr78Pf4ZcnHEsFy+Cujcm8Fj3af1GJncmmmpI3VPDAAVAlN?=
 =?us-ascii?Q?yxTsAV2zC+8IRUhFFjthgP6IMDLOSRN5rAyRnFMOdCV6x11+veJGKSX6BTfS?=
 =?us-ascii?Q?vueUNlKdZ+EdVU4SQMh8VgGjHKD+D8LO0g/IZAcgCytApQKBV8NgJo4N1h4S?=
 =?us-ascii?Q?Jb9W/fgGIpioDcp6H7cntii5F7x9UKQTtztVP/2eElClYCS+ILM33P1jXN/O?=
 =?us-ascii?Q?jH5cKIvrkbISXx5onV/UYQJXqAJU++a0nXPQNnRLDYBysEm2DwZxgxufH8dI?=
 =?us-ascii?Q?dLXPah18yGNz8NjGVnPGtlEd56zv5Ko1CndgQE5TodPqVU2ZOiRzaey+0x+y?=
 =?us-ascii?Q?5a67QR7PgxuZ+bZW2XfiUagiVV55SlqanQfhtlcCMlJxgJWOJXEt5isFROjD?=
 =?us-ascii?Q?InNo84rneyegSvD8d01vYYDox8s709TE6YqwRkh1D1sguMZkZc/36JP/wZ21?=
 =?us-ascii?Q?qgf18GSlMrFYollFP0L1kk/CiMui2SsjbMPgjjuzER0zlMaBWo7jWkmPdh3q?=
 =?us-ascii?Q?kpQdWVfSKtWe6VOyyNONm4Fuz9dmaWb+YxyOoXDWNqW0t+Gr/Dn7FkndcB+X?=
 =?us-ascii?Q?c7cc2VDAodcfggysGG4xtQn2cl6GVi5eKxby1vJH5ZlzhLK9DLZESX3t1TZX?=
 =?us-ascii?Q?YCYleim20+PZVWygCTWVQradom8EKNKrBtD1c6wYGZTIWwS0MG5+yw7Q0Rl5?=
 =?us-ascii?Q?e7rKdG27FRG3bcDHnkMMBOuecPsqs7mCa/CjZBCivmfyR7N+2O778dOVDapU?=
 =?us-ascii?Q?/qEMXRjoQhZLmW3+6OwL4mjemFPzCwDAJUkwRymmc8w8KkMIG26LW1BaMh0H?=
 =?us-ascii?Q?UfBjl+XtX4+crSMZxsmC4L7O7KdCMt7aatbcP9rv4vgGo8q4kB8Gi0ZpVPe0?=
 =?us-ascii?Q?5OTwrP07fFHyETv3viCTCkMevv8+276oEv00BK83hJDg+Prs7RZAht2zY1QC?=
 =?us-ascii?Q?La5Rtxr6wGcCNRYnnTP+qU8AgMQBX6ypnzU+wbHQ22LSLyaYboXkh5Q38NBp?=
 =?us-ascii?Q?brVyLFF+hqcLCbGNbbXtRuOqAwX0BALwDItMZ34Kvh6LZM6mjwHCQhlHzWPL?=
 =?us-ascii?Q?Rl2SpJWjWTzVh4eOqO+7dDnKRjIGJiHn0kfSSchbr1+N1z9RGbSGJP9+bVM6?=
 =?us-ascii?Q?TgevvZfdLVm3auxEUQY16/lPQb9bmAnw/SlXaDsIRpRUKUwjJMndBsLILv6o?=
 =?us-ascii?Q?G854p1WEs4CzKEuBLqJXbl74qL9cuQiHB6BJ7M8VNTQx4+6qhiey9ejlQULj?=
 =?us-ascii?Q?RyOxMWMsgzmc8U54n+B97dVTC+S6Mu+eGp7dHagXb47MIXNKDsdPDpzSNylG?=
 =?us-ascii?Q?TC0rUtH9eF+T62CDrE4CXPIu/5IDXXu+AZoE/CgM9v4dro5RG/HBarWIcf1z?=
 =?us-ascii?Q?32gsjaIA4LS2QjyZt4Sk7ExHgluuG+zP5QKuu6G9GiH0v5XheKqPGuuomNB4?=
 =?us-ascii?Q?MGReISxKnAGQH5F8QUTBrAaYgXAvjIUfIcxmiVML7kr62DY61xMrqMSMSOiy?=
 =?us-ascii?Q?lBoZ/QIox3sqewNDMGuQ9n3tCed49Od3/JSGS2SIyoaigpic/3faGJwPlxO4?=
 =?us-ascii?Q?v3FsHrubOQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e91bb956-d0de-4025-b02c-08df1fbb7e35
X-MS-Exchange-CrossTenant-AuthSource: PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 12:57:04.7851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C2wLdHJT42cvEscht/fzDKzp36HjA7tn3L/JqhzisWyQzQxr6lcEEzHjPxO9SiPFkuVxtAh4mt5pq9/lT5vwcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3559
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 12:57:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247033

rust-analyzer is built alongside the other Rust tools (clippy, rustfmt)
but was not installed or packaged. Add a rust-tools-analyzer package and
install it for both the target and nativesdk variants.

Two additional pieces are required for rust-analyzer to be usable:

 - The proc-macro server, rust-analyzer-proc-macro-srv, which
   rust-analyzer looks up under <sysroot>/libexec. Install it into
   ${libexecdir}; without it, analysis of any crate using a derive or
   attribute macro fails with "cannot find proc-macro server in sysroot".

 - The standard library sources, which rust-analyzer analyses from source
   rather than from the compiled rlibs. Add an RDEPENDS on ${PN}-src-lib
   so that core/std items such as println! and derive resolve instead of
   being reported as unresolved macros.

Both binaries link against librustc_driver from the main package, so the
package also RDEPENDS on ${PN}.

Signed-off-by: Benhur Tessele <benhur.tessele@est.tech>
---
 meta/recipes-devtools/rust/rust_1.98.1.bb | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust_1.98.1.bb b/meta/recipes-devto=
ols/rust/rust_1.98.1.bb
index 1f4ce5ebdb..d446c60651 100644
--- a/meta/recipes-devtools/rust/rust_1.98.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.98.1.bb
@@ -261,18 +261,21 @@ do_test_compile () {
=20
 ALLOW_EMPTY:${PN} =3D "1"
=20
-PACKAGES =3D+ "${PN}-rustdoc ${PN}-tools-clippy ${PN}-tools-rustfmt ${PN}-=
src-lib"
+PACKAGES =3D+ "${PN}-rustdoc ${PN}-tools-clippy ${PN}-tools-rustfmt ${PN}-=
tools-analyzer ${PN}-src-lib"
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
@@ -294,14 +297,19 @@ rust_do_install:class-nativesdk() {
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
@@ -329,12 +337,13 @@ rust_do_install:class-nativesdk() {
=20
 FILES:${PN} +=3D "${base_prefix}/environment-setup.d"
=20
-EXTRA_TOOLS ?=3D "cargo-clippy clippy-driver rustfmt"
+EXTRA_TOOLS ?=3D "cargo-clippy clippy-driver rustfmt rust-analyzer"
 rust_do_install:class-target() {
     export PSEUDO_UNLOAD=3D1
     rust_runx install
     rust_runx install clippy
     rust_runx install rustfmt
+    rust_runx install rust-analyzer
     unset PSEUDO_UNLOAD
=20
     install -d ${D}${bindir}
@@ -343,6 +352,10 @@ rust_do_install:class-target() {
         patchelf --set-rpath "\$ORIGIN/../lib" ${D}${bindir}/$i
     done
=20
+    install -d ${D}${libexecdir}
+    cp rust-build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/release/=
rust-analyzer-proc-macro-srv ${D}${libexecdir}
+    patchelf --set-rpath "\$ORIGIN/../lib" ${D}${libexecdir}/rust-analyzer=
-proc-macro-srv
+
     install -d ${D}${libdir}/rustlib/${RUST_HOST_SYS}
     install -m 0644 ${WORKDIR}/rust-targets/${RUST_HOST_SYS}.json ${D}${li=
bdir}/rustlib/${RUST_HOST_SYS}/target.json
     install -d ${D}${libdir}/rustlib/src/rust
--=20
2.43.0


