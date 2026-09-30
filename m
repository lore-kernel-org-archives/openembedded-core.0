Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98738CA5FBB
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 07:06:59 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7801.1790752017903511484
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 00:06:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=gU+lTzpW;
 spf=pass (domain: est.tech, ip: 52.101.70.7, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kL5tsv3MgA7BrRXk28NQT8l3KE+gxT302LAuX+HQo6RY1J7fVndYnr6ABAWbDpl3YK7XUZGjCTF5EMhxrT0/4yxR1O2sgO2kgldjDjDoAcYE2s/Ucqf7iRkRwE+m/9I1XkqOrzsrlTT4d9RwuOneevAJWhU+suIiSfYYSVX9D0TszjP+owQTWJQuzrABIil/2YwFOV4qFa+N7dqwiSV1VdwhXQ7kV0RlyUIZ+1Cu2xPcRDCqgFDlFxxYB6Kz4oZN33EAoe4ONfuPxSWjs24i/rMqbTg/cb7ckImnt0GqkpICJOU6ssI+M0Y+5Vd8xogut96VCiB8hr5j3LIwqppQIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=orKguPjkt7k3IzlVSTCwt1cF3VSvsQqexDEiPf1wuRk=;
 b=dITMq3MyNuKf3h3cRZXR9bjddF62ClMaCu1ja/nUobVTvedmDuPdikjhv+zQVlvkJ40P2uMP6VhsbVDO4/PSPbmqpOYAv49wCc+7VefAksrLiWGJ5Q8JfAvhN7AczTqkJ0/L7iUH6CmP+MgrBXGKS/+r58Vppxd/Xp/YPuXXNSfs/9XRt8DdYTzvcKEg/xNGe9+gagNJnoY1ZX1O/6KUY7Q7ckARqjkltYvorJOlngoRkWuSp8nkZFL+WjPwnwNDN27GbPcaW+3hjQIjXEHn+0ZKAaX2Hi/rKtTZ5LfldS64TxLabATPWWiyNvED25jWQaLx9gvE49NCD6uVG1xsUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=orKguPjkt7k3IzlVSTCwt1cF3VSvsQqexDEiPf1wuRk=;
 b=gU+lTzpWW8QXFqfX6a3bdFzpD1HKFdTTFjde72IZemmEovdMZWeMYrDbw0pHjcq9aZFAswZtbhpWN+nvVezj0J/EPiwYU6pwxALZU1170wDI5IQ+FbWfKJVNSPZMeJLsl4cHiXCR4dUda4IPjwDOpg+PJ2HqbLOsK+174Z0ZomPF0O8bcYTy/74uRJH//z/tmw6JPMg1a8zXriLgmeLlXKedpUb8khKC+2wUvx2qLrXR8F6xTJAnDHWduUp+vTzqURtHOLoLWJopNI1Lvz2RwU20XylNXXI1vbZSnNDIyQp+xUrZsIxPylAvkC+MRp4RotSsqs7ADltanIg6LE+iiQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VE1P189MB1053.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:162::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 07:06:52 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 07:06:52 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bindgen-cli: Upgrade 0.72.1 -> 0.73.2
Date: Wed, 30 Sep 2026 09:06:49 +0200
Message-ID: <20260930070649.95234-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR06CA0015.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::20) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VE1P189MB1053:EE_
X-MS-Office365-Filtering-Correlation-Id: 24f72a00-a84a-4158-8786-08df1ec1673b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|6133799003|3023799007|10067099003|260925022911599003|260925021911599003|260925021311599003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	qPEykqg7yT2C4dUS2KD3Ua+1q3rEXZvCRc/wZfVJh4d0rd/opzzqYTCLO31zOGDZJY4gOJZQ2/emfmNDOhRi4LlZJkdPKHqFiAgutBkhYFHiUcJesRa0pzWBVaciP9eVbzwqOqXtDDwTvVsVLh0Q5MAtTOQuFdRGyvEvBiq1qj6GawBw5yuWDaEujR/C1E1VZjbcXxIqI/3l0BUsq/lGheVqs79GJhaPW5tDr37T2jr+nviNS5sIq4XXozKGkW/TTRUbylRROzDvCBkwhxPZS2ICTowLyQB0kli4FQVsI6DbvP8S6/0WKIAf9n+YLFm8eUOC4HxNGOYhVVLViSQ/COm3PGs9zQ5xAvGr6nzi/B9quBlvwi/STbGjrlFAsw6ylCa37EeoBWQdJcL7DLPEBJTVkg53XhSTzKu6k/Z9oshpe6nAm1n5PoQm2WRUhPW5T8sszdJ7DpJ1t9JqHQOM6UB+gctFVqKA5NeSdvkqFPZCMJbDYs/cHBAif/UsHKtnFZi+sQWKX+rfX4IhOLlK4TramN5lEIHuqcLn/jI6Pw34WDgoJQ0ck9UIM2gbUPuXW/xsH8HrNMWTfGVlJl5jyj1estoT8mlhRNsAU3Q81V3Bbyrv/mkKCOEDzpssTvn4MFwlGA6gMWM+U/iugDBn/6L6zGiszVGh3AjfBJ/xdBc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(3023799007)(10067099003)(260925022911599003)(260925021911599003)(260925021311599003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IQcfueVw56T7wWZ3Qfbb6VakbAmdzeuEExUhs+rYvdyOoVCSpM1kHM9tyz7O?=
 =?us-ascii?Q?1yD7LQbxXS025IwB0uho6143qvk2DFGlh8FP2011WnzdJgyG+01UDfGRvOw6?=
 =?us-ascii?Q?PVGRs3CiZ1NaPY+v7odFfj+Oex06+Np+ZvkYeif+5xzUTcfE71psMGkqCjCb?=
 =?us-ascii?Q?LZpwbJY8Zsbe+0qW/c8LsSkGZMoiiuumaeaiLv4OGCQSv9AOl3ujXUa7xghU?=
 =?us-ascii?Q?pGR6uLSQazyRi9rH27JfbxTB0sRs/Q6NmhNx8bhgdVT+/bm6vXvsi/unbV/J?=
 =?us-ascii?Q?ZKiIzS+cdvN9H8fH04wylH7kPvs9BBu70r374zp2FKwdFe7LYt/qIbdrjvTl?=
 =?us-ascii?Q?pkH2AETuTMls7ugbqnF1ROvC7uI6CNaTTl/yltJd/vMQGUJRPxLU7+vea7CG?=
 =?us-ascii?Q?e/RtrAHEkwcOrgD0UXGch0uRL9i/bc44Z43CmeBLJJK4U1Jj+0ev8geiAb2R?=
 =?us-ascii?Q?WVy2LzGSxD/fYYJv5nG0uRFztyf+e8aq923N3NNwCd4Rn3uIk8r0DWdkBUCC?=
 =?us-ascii?Q?Ob0qdG4ClDwvB09MXlqiRf1t43EpICs9PW/74uHeQ23GLhBIFz03xFdJTQxD?=
 =?us-ascii?Q?k1JHGbEg6k98KkL2xZ6UwLrfArWKmzOe67lUfFSRQqyBGNmXvpZbfZlcOdLv?=
 =?us-ascii?Q?wCcoBqhdfoRN+2SIj4uad5PBo5Vh5xJK09ZA+U1OlSAgYrPCzhkhU2QYPgl/?=
 =?us-ascii?Q?xsd9skytkEOzut9W5yKONu4CaBQiHQXJWXItWitjgpzU3ittSZsCzFjJcQ/W?=
 =?us-ascii?Q?B9FUB3Dhwr/4eVx3F7gkbVadECkUOMIUPYOJZsjk5Ig/ShQH9TA/N6/br4/v?=
 =?us-ascii?Q?Xsutg7zynmSWcQbp0MOiltGT5t8/zw9CCIjvxehsCR6wkcoD137YyHuvhwqI?=
 =?us-ascii?Q?x/zkKhwwRUOkTIKbFsb7rLkgfGgqo5h/ObmdMCPmiXfIkCzluKt1sCVnOmcV?=
 =?us-ascii?Q?FtrHSgU0tuoP8Q8OxJRxLHEiz4YzKypIsVjbnuwPkgzbeyO1UoXFzVi7RW7L?=
 =?us-ascii?Q?y8ohVcy3NYKMCHs6QCCwinANqaRnQzTjgf9eNoLMWKss9pISj525AstzO5Je?=
 =?us-ascii?Q?WTNDPixKwW9MT8QayCEboBw9t5+oi7XpYnu80JadTOVoYC/hEClmd/vn/4/C?=
 =?us-ascii?Q?hAAZd68yJX5m+qImyevSMJ34eGuq7GkUwdalT80vuYa1ltgJ1UZxaspcfV7S?=
 =?us-ascii?Q?t4Jlgc8fjH1TR/kt+HjMDkExg8NpulpFUWLAsznuaTaqpVarBPJSbeVHYy5s?=
 =?us-ascii?Q?hiT2eZiCG2SSC+u2o9VbyD2NrF4fHKPcvYYCdha89gV1WXBnUc/fZMFvV2Iu?=
 =?us-ascii?Q?pope5Z2vDIftra6a5mbRBo4GZSxCLkFf/0a/5kLmyjF88gfG41fIsHrx3iyT?=
 =?us-ascii?Q?tPw1fVnurWZQLFgWLgd6lIT/1EeSvwqfPWAmNoHyFvs0AoCbaT5NwYgzSbjX?=
 =?us-ascii?Q?yiHLDdYNnXQALawj8dB75aojAdnT1cskKeYTzRguCiesoq//mi60h6sJqh/W?=
 =?us-ascii?Q?OU5/FlMQbLdfeD8BoSMf0c73DhUtsEGgIu3KFqCor0GkRlKfXzcvTiB1LSGq?=
 =?us-ascii?Q?D8W9XtSYejf+21GT2LyCPS+P7OYU5BkFOzIO/vc9T3FILTXkid6gxqo5KfWW?=
 =?us-ascii?Q?47U0mU2cabZUz0eRD2BDXDMERzD5Eq+PNeal32WRa2FSdFx0HvVLzSAOcLWt?=
 =?us-ascii?Q?POyuxfmydvDSEU8tykc+DwEmmDrgjJtAIfCaXmHga+U4FXUSKI49lc5j6bxV?=
 =?us-ascii?Q?nkhZ6stZVw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f72a00-a84a-4158-8786-08df1ec1673b
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 07:06:52.1121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fKdEukGMuzYnpGXkk7dNVi/eJ7BaGcfrm7Mw2gghYwxnoCfUQG21Goah1twh+gxR82iRO8+K2nmgVjn7eakkkvpK9GgxvSgPMjgV1jmv5Nc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P189MB1053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 07:06:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246920

CompareLog: https://github.com/rust-lang/rust-bindgen/compare/v0.72.1...v0.=
73.2

ChangeLog: https://github.com/rust-lang/rust-bindgen/blob/v0.73.2/CHANGELOG=
.md

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../bindgen-cli/bindgen-cli-crates.inc        | 278 ++++++++----------
 ...en-cli_0.72.1.bb =3D> bindgen-cli_0.73.2.bb} |   2 +-
 2 files changed, 121 insertions(+), 159 deletions(-)
 rename meta/recipes-devtools/bindgen-cli/{bindgen-cli_0.72.1.bb =3D> bindg=
en-cli_0.73.2.bb} (96%)

diff --git a/meta/recipes-devtools/bindgen-cli/bindgen-cli-crates.inc b/met=
a/recipes-devtools/bindgen-cli/bindgen-cli-crates.inc
index 084e26df321..e979725e3bc 100644
--- a/meta/recipes-devtools/bindgen-cli/bindgen-cli-crates.inc
+++ b/meta/recipes-devtools/bindgen-cli/bindgen-cli-crates.inc
@@ -2,185 +2,147 @@
=20
 # from Cargo.lock
 SRC_URI +=3D " \
-    crate://crates.io/aho-corasick/1.1.3 \
-    crate://crates.io/annotate-snippets/0.11.4 \
-    crate://crates.io/anstyle/1.0.10 \
-    crate://crates.io/autocfg/1.4.0 \
-    crate://crates.io/bitflags/1.3.2 \
-    crate://crates.io/bitflags/2.2.1 \
+    crate://crates.io/aho-corasick/1.1.5 \
+    crate://crates.io/annotate-snippets/0.11.5 \
+    crate://crates.io/anstream/0.6.21 \
+    crate://crates.io/anstyle/1.0.14 \
+    crate://crates.io/anstyle-parse/0.2.7 \
+    crate://crates.io/anstyle-query/1.1.5 \
+    crate://crates.io/anstyle-wincon/3.0.11 \
+    crate://crates.io/bitflags/2.13.1 \
     crate://crates.io/block/0.1.6 \
-    crate://crates.io/cc/1.2.2 \
+    crate://crates.io/cc/1.4.5 \
     crate://crates.io/cexpr/0.6.0 \
-    crate://crates.io/cfg-if/1.0.0 \
-    crate://crates.io/clang-sys/1.8.1 \
-    crate://crates.io/clap/4.1.4 \
-    crate://crates.io/clap_complete/4.2.0 \
-    crate://crates.io/clap_derive/4.1.0 \
-    crate://crates.io/clap_lex/0.3.1 \
-    crate://crates.io/either/1.13.0 \
+    crate://crates.io/cfg-if/1.0.4 \
+    crate://crates.io/clang-sys/1.9.1 \
+    crate://crates.io/clap/4.4.18 \
+    crate://crates.io/clap_builder/4.4.18 \
+    crate://crates.io/clap_complete/4.4.10 \
+    crate://crates.io/clap_derive/4.4.7 \
+    crate://crates.io/clap_lex/0.6.0 \
+    crate://crates.io/colorchoice/1.0.5 \
     crate://crates.io/env_logger/0.8.4 \
-    crate://crates.io/env_logger/0.10.0 \
-    crate://crates.io/errno/0.3.10 \
-    crate://crates.io/fastrand/1.9.0 \
-    crate://crates.io/getrandom/0.2.15 \
-    crate://crates.io/glob/0.3.1 \
+    crate://crates.io/env_logger/0.10.2 \
+    crate://crates.io/errno/0.3.14 \
+    crate://crates.io/fastrand/2.5.0 \
+    crate://crates.io/find-msvc-tools/0.1.12 \
+    crate://crates.io/getrandom/0.2.17 \
+    crate://crates.io/getrandom/0.3.4 \
+    crate://crates.io/glob/0.3.4 \
     crate://crates.io/heck/0.4.1 \
-    crate://crates.io/hermit-abi/0.3.9 \
-    crate://crates.io/hermit-abi/0.4.0 \
-    crate://crates.io/humantime/2.1.0 \
-    crate://crates.io/instant/0.1.12 \
-    crate://crates.io/io-lifetimes/1.0.11 \
-    crate://crates.io/is-terminal/0.4.13 \
-    crate://crates.io/itertools/0.13.0 \
-    crate://crates.io/libc/0.2.167 \
-    crate://crates.io/libloading/0.8.6 \
-    crate://crates.io/linux-raw-sys/0.3.8 \
-    crate://crates.io/log/0.4.22 \
+    crate://crates.io/hermit-abi/0.5.3 \
+    crate://crates.io/humantime/2.4.0 \
+    crate://crates.io/is-terminal/0.4.17 \
+    crate://crates.io/is_terminal_polyfill/1.70.2 \
+    crate://crates.io/libc/0.2.189 \
+    crate://crates.io/libloading/0.8.9 \
+    crate://crates.io/linux-raw-sys/0.12.1 \
+    crate://crates.io/log/0.4.34 \
     crate://crates.io/malloc_buf/0.0.6 \
-    crate://crates.io/memchr/2.7.4 \
+    crate://crates.io/memchr/2.8.3 \
     crate://crates.io/minimal-lexical/0.2.1 \
     crate://crates.io/nom/7.1.3 \
     crate://crates.io/objc/0.2.7 \
-    crate://crates.io/once_cell/1.20.2 \
-    crate://crates.io/os_str_bytes/6.4.1 \
-    crate://crates.io/owo-colors/4.1.0 \
-    crate://crates.io/prettyplease/0.2.25 \
-    crate://crates.io/proc-macro-error/1.0.4 \
-    crate://crates.io/proc-macro-error-attr/1.0.4 \
-    crate://crates.io/proc-macro2/1.0.92 \
+    crate://crates.io/once_cell/1.21.4 \
+    crate://crates.io/once_cell_polyfill/1.70.2 \
+    crate://crates.io/owo-colors/4.2.3 \
+    crate://crates.io/prettyplease/0.2.37 \
+    crate://crates.io/proc-macro2/1.0.107 \
     crate://crates.io/quickcheck/1.0.3 \
-    crate://crates.io/quote/1.0.37 \
-    crate://crates.io/rand/0.8.5 \
+    crate://crates.io/quote/1.0.47 \
+    crate://crates.io/r-efi/5.3.0 \
+    crate://crates.io/rand/0.8.8 \
     crate://crates.io/rand_core/0.6.4 \
-    crate://crates.io/redox_syscall/0.3.5 \
-    crate://crates.io/regex/1.11.1 \
-    crate://crates.io/regex-automata/0.4.9 \
-    crate://crates.io/regex-syntax/0.8.5 \
-    crate://crates.io/rustc-hash/2.1.0 \
-    crate://crates.io/rustix/0.37.27 \
-    crate://crates.io/shlex/1.3.0 \
-    crate://crates.io/similar/2.6.0 \
+    crate://crates.io/regex/1.13.1 \
+    crate://crates.io/regex-automata/0.4.18 \
+    crate://crates.io/regex-syntax/0.8.11 \
+    crate://crates.io/rustc-hash/2.1.1 \
+    crate://crates.io/rustix/1.1.4 \
+    crate://crates.io/shlex/2.0.1 \
+    crate://crates.io/similar/2.7.0 \
     crate://crates.io/strsim/0.10.0 \
-    crate://crates.io/syn/1.0.109 \
-    crate://crates.io/syn/2.0.90 \
-    crate://crates.io/tempfile/3.6.0 \
-    crate://crates.io/termcolor/1.2.0 \
-    crate://crates.io/unicode-ident/1.0.14 \
-    crate://crates.io/unicode-width/0.1.14 \
-    crate://crates.io/version_check/0.9.4 \
-    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
-    crate://crates.io/winapi/0.3.9 \
-    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
-    crate://crates.io/winapi-util/0.1.5 \
-    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
-    crate://crates.io/windows-sys/0.48.0 \
-    crate://crates.io/windows-sys/0.52.0 \
-    crate://crates.io/windows-targets/0.48.5 \
-    crate://crates.io/windows-targets/0.52.6 \
-    crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
-    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
-    crate://crates.io/windows_aarch64_msvc/0.48.5 \
-    crate://crates.io/windows_aarch64_msvc/0.52.6 \
-    crate://crates.io/windows_i686_gnu/0.48.5 \
-    crate://crates.io/windows_i686_gnu/0.52.6 \
-    crate://crates.io/windows_i686_gnullvm/0.52.6 \
-    crate://crates.io/windows_i686_msvc/0.48.5 \
-    crate://crates.io/windows_i686_msvc/0.52.6 \
-    crate://crates.io/windows_x86_64_gnu/0.48.5 \
-    crate://crates.io/windows_x86_64_gnu/0.52.6 \
-    crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
-    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
-    crate://crates.io/windows_x86_64_msvc/0.48.5 \
-    crate://crates.io/windows_x86_64_msvc/0.52.6 \
+    crate://crates.io/syn/2.0.119 \
+    crate://crates.io/tempfile/3.27.0 \
+    crate://crates.io/termcolor/1.4.1 \
+    crate://crates.io/unicode-ident/1.0.24 \
+    crate://crates.io/unicode-width/0.2.2 \
+    crate://crates.io/utf8parse/0.2.2 \
+    crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
+    crate://crates.io/wasip2/1.0.4+wasi-0.2.12 \
+    crate://crates.io/winapi-util/0.1.11 \
+    crate://crates.io/windows-link/0.2.1 \
+    crate://crates.io/windows-sys/0.61.2 \
+    crate://crates.io/wit-bindgen/0.57.1 \
 "
=20
-SRC_URI[aho-corasick-1.1.3.sha256sum] =3D "8e60d3430d3a69478ad0993f19238d2=
df97c507009a52b3c10addcd7f6bcb916"
-SRC_URI[annotate-snippets-0.11.4.sha256sum] =3D "24e35ed54e5ea7997c14ed4c7=
0ba043478db1112e98263b3b035907aa197d991"
-SRC_URI[anstyle-1.0.10.sha256sum] =3D "55cc3b69f167a1ef2e161439aa98aed94e6=
028e5f9a59be9a6ffb47aef1651f9"
-SRC_URI[autocfg-1.4.0.sha256sum] =3D "ace50bade8e6234aa140d9a2f552bbee1db4=
d353f69b8217bc503490fc1a9f26"
-SRC_URI[bitflags-1.3.2.sha256sum] =3D "bef38d45163c2f1dde094a7dfd33ccf595c=
92905c8f8f4fdc18d06fb1037718a"
-SRC_URI[bitflags-2.2.1.sha256sum] =3D "24a6904aef64d73cf10ab17ebace7befb91=
8b82164785cb89907993be7f83813"
+SRC_URI[aho-corasick-1.1.5.sha256sum] =3D "c982642fa9e8606056828ee9a850573=
7230110bb1099153c79efe865c59d12ba"
+SRC_URI[annotate-snippets-0.11.5.sha256sum] =3D "710e8eae58854cdc1790fcb56=
cca04d712a17be849eeb81da2a724bf4bae2bc4"
+SRC_URI[anstream-0.6.21.sha256sum] =3D "43d5b281e737544384e969a5ccad3f1cdd=
24b48086a0fc1b2a5262a26b8f4f4a"
+SRC_URI[anstyle-1.0.14.sha256sum] =3D "940b3a0ca603d1eade50a4846a2afffd5ef=
57a9feac2c0e2ec2e14f9ead76000"
+SRC_URI[anstyle-parse-0.2.7.sha256sum] =3D "4e7644824f0aa2c7b9384579234ef1=
0eb7efb6a0deb83f9630a49594dd9c15c2"
+SRC_URI[anstyle-query-1.1.5.sha256sum] =3D "40c48f72fd53cd289104fc64099abc=
a73db4166ad86ea0b4341abe65af83dadc"
+SRC_URI[anstyle-wincon-3.0.11.sha256sum] =3D "291e6a250ff86cd4a820112fb889=
8808a366d8f9f58ce16d1f538353ad55747d"
+SRC_URI[bitflags-2.13.1.sha256sum] =3D "b588b76d00fde79687d7646a9b5bdf3cc0=
f655e0bbd080335a95d7e96f3587da"
 SRC_URI[block-0.1.6.sha256sum] =3D "0d8c1fef690941d3e7788d328517591fecc684=
c084084702d6ff1641e993699a"
-SRC_URI[cc-1.2.2.sha256sum] =3D "f34d93e62b03caf570cccc334cbc6c2fceca82f39=
211051345108adcba3eebdc"
+SRC_URI[cc-1.4.5.sha256sum] =3D "005ec2760ca554fae18df7a11195552ec576cd665=
632a881bc011d5bb2fd4d80"
 SRC_URI[cexpr-0.6.0.sha256sum] =3D "6fac387a98bb7c37292057cffc56d62ecb6299=
00026402633ae9160df93a8766"
-SRC_URI[cfg-if-1.0.0.sha256sum] =3D "baf1de4339761588bc0619e3cbc0120ee582e=
bb74b53b4efbf79117bd2da40fd"
-SRC_URI[clang-sys-1.8.1.sha256sum] =3D "0b023947811758c97c59bf9d1c188fd619=
ad4718dcaa767947df1cadb14f39f4"
-SRC_URI[clap-4.1.4.sha256sum] =3D "f13b9c79b5d1dd500d20ef541215a6423c75829=
ef43117e1b4d17fd8af0b5d76"
-SRC_URI[clap_complete-4.2.0.sha256sum] =3D "01c22dcfb410883764b29953103d9e=
f7bb8fe21b3fa1158bc99986c2067294bd"
-SRC_URI[clap_derive-4.1.0.sha256sum] =3D "684a277d672e91966334af371f1a7b58=
33f9aa00b07c84e92fbce95e00208ce8"
-SRC_URI[clap_lex-0.3.1.sha256sum] =3D "783fe232adfca04f90f56201b26d79682d4=
cd2625e0bc7290b95123afe558ade"
-SRC_URI[either-1.13.0.sha256sum] =3D "60b1af1c220855b6ceac025d3f6ecdd2b7c4=
894bfe9cd9bda4fbb4bc7c0d4cf0"
+SRC_URI[cfg-if-1.0.4.sha256sum] =3D "9330f8b2ff13f34540b44e946ef3511182572=
7b38d33286ef986142615121801"
+SRC_URI[clang-sys-1.9.1.sha256sum] =3D "157a8ba7b480713b56f4c09fd13fc3e0a2=
2a5dfab8097ba61cbc5feef950788a"
+SRC_URI[clap-4.4.18.sha256sum] =3D "1e578d6ec4194633722ccf9544794b71b1385c=
3c027efe0c55db226fc880865c"
+SRC_URI[clap_builder-4.4.18.sha256sum] =3D "4df4df40ec50c46000231c91496827=
8b1eb05098cf8f1b3a518a95030e71d1c7"
+SRC_URI[clap_complete-4.4.10.sha256sum] =3D "abb745187d7f4d76267b37485a65e=
0149edd0e91a4cfcdd3f27524ad86cee9f3"
+SRC_URI[clap_derive-4.4.7.sha256sum] =3D "cf9804afaaf59a91e75b022a30fb7229=
a7901f60c755489cc61c9b423b836442"
+SRC_URI[clap_lex-0.6.0.sha256sum] =3D "702fc72eb24e5a1e48ce58027a675bc24ed=
d52096d5397d4aea7c6dd9eca0bd1"
+SRC_URI[colorchoice-1.0.5.sha256sum] =3D "1d07550c9036bf2ae0c684c4297d503f=
838287c83c53686d05370d0e139ae570"
 SRC_URI[env_logger-0.8.4.sha256sum] =3D "a19187fea3ac7e84da7dacf48de0c45d6=
3c6a76f9490dae389aead16c243fce3"
-SRC_URI[env_logger-0.10.0.sha256sum] =3D "85cdab6a89accf66733ad5a1693a4dcc=
ed6aeff64602b634530dd73c1f3ee9f0"
-SRC_URI[errno-0.3.10.sha256sum] =3D "33d852cb9b869c2a9b3df2f71a3074817f01e=
1844f839a144f5fcef059a4eb5d"
-SRC_URI[fastrand-1.9.0.sha256sum] =3D "e51093e27b0797c359783294ca4f0a911c2=
70184cb10f85783b118614a1501be"
-SRC_URI[getrandom-0.2.15.sha256sum] =3D "c4567c8db10ae91089c99af84c68c38da=
3ec2f087c3f82960bcdbf3656b6f4d7"
-SRC_URI[glob-0.3.1.sha256sum] =3D "d2fabcfbdc87f4758337ca535fb41a6d701b656=
93ce38287d856d1674551ec9b"
+SRC_URI[env_logger-0.10.2.sha256sum] =3D "4cd405aab171cb85d6735e5c8d9db038=
c17d3ca007a4d2c25f337935c3d90580"
+SRC_URI[errno-0.3.14.sha256sum] =3D "39cab71617ae0d63f51a36d69f866391735b5=
1691dbda63cf6f96d042b63efeb"
+SRC_URI[fastrand-2.5.0.sha256sum] =3D "da7c62ceae207dd37ea5b845da6a0696c79=
9f85e97da1ab5b7910be3c1c80223"
+SRC_URI[find-msvc-tools-0.1.12.sha256sum] =3D "3e0f1c7c3a72c66fd80abe96517=
5f7523475c0489a87d3ff9d6e8c87d87a9d2d"
+SRC_URI[getrandom-0.2.17.sha256sum] =3D "ff2abc00be7fca6ebc474524697ae276a=
d847ad0a6b3faa4bcb027e9a4614ad0"
+SRC_URI[getrandom-0.3.4.sha256sum] =3D "899def5c37c4fd7b2664648c28120ecec1=
38e4d395b459e5ca34f9cce2dd77fd"
+SRC_URI[glob-0.3.4.sha256sum] =3D "e4eba85ea1d0a966a983acd07deee566e67395d=
2d96b6fb39e62b5a833f1eb0b"
 SRC_URI[heck-0.4.1.sha256sum] =3D "95505c38b4572b2d910cecb0281560f54b440a1=
9336cbbcb27bf6ce6adc6f5a8"
-SRC_URI[hermit-abi-0.3.9.sha256sum] =3D "d231dfb89cfffdbc30e7fc41579ed6066=
ad03abda9e567ccafae602b97ec5024"
-SRC_URI[hermit-abi-0.4.0.sha256sum] =3D "fbf6a919d6cf397374f7dfeeea91d974c=
7c0a7221d0d0f4f20d859d329e53fcc"
-SRC_URI[humantime-2.1.0.sha256sum] =3D "9a3a5bfb195931eeb336b2a7b4d761daec=
841b97f947d34394601737a7bba5e4"
-SRC_URI[instant-0.1.12.sha256sum] =3D "7a5bbe824c507c5da5956355e86a746d82e=
0e1464f65d862cc5e71da70e94b2c"
-SRC_URI[io-lifetimes-1.0.11.sha256sum] =3D "eae7b9aee968036d54dce06cebaefd=
919e4472e753296daccd6d344e3e2df0c2"
-SRC_URI[is-terminal-0.4.13.sha256sum] =3D "261f68e344040fbd0edea105bef17c6=
6edf46f984ddb1115b775ce31be948f4b"
-SRC_URI[itertools-0.13.0.sha256sum] =3D "413ee7dfc52ee1a4949ceeb7dbc8a33f2=
d6c088194d9f922fb8318faf1f01186"
-SRC_URI[libc-0.2.167.sha256sum] =3D "09d6582e104315a817dff97f75133544b2e09=
4ee22447d2acf4a74e189ba06fc"
-SRC_URI[libloading-0.8.6.sha256sum] =3D "fc2f4eb4bc735547cfed7c0a4922cbd04=
a4655978c09b54f1f7b228750664c34"
-SRC_URI[linux-raw-sys-0.3.8.sha256sum] =3D "ef53942eb7bf7ff43a617b3e2c1c4a=
5ecf5944a7c1bc12d7ee39bbb15e5c1519"
-SRC_URI[log-0.4.22.sha256sum] =3D "a7a70ba024b9dc04c27ea2f0c0548feb474ec5c=
54bba33a7f72f873a39d07b24"
+SRC_URI[hermit-abi-0.5.3.sha256sum] =3D "e17592d60ebacc7d5e169f4663c5f84f9=
161cc90328abcfe8456f41e4dfcb284"
+SRC_URI[humantime-2.4.0.sha256sum] =3D "15cdd26707701c53297e2fa6afb323d55f=
bc1d0810c3aec078ae3ef0424c3c15"
+SRC_URI[is-terminal-0.4.17.sha256sum] =3D "3640c1c38b8e4e43584d8df18be5fc6=
b0aa314ce6ebf51b53313d4306cca8e46"
+SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] =3D "a6cb138bb79a146c1bd460=
005623e142ef0181e3d0219cb493e02f7d08a35695"
+SRC_URI[libc-0.2.189.sha256sum] =3D "3eaf3ede3fee6db1a4c2ee091bf8a8b4dccdc=
6d17f656fb07896ee72867612f2"
+SRC_URI[libloading-0.8.9.sha256sum] =3D "d7c4b02199fee7c5d21a5ae7d8cfa79a6=
ef5bb2fc834d6e9058e89c825efdc55"
+SRC_URI[linux-raw-sys-0.12.1.sha256sum] =3D "32a66949e030da00e8c7d4434b251=
670a91556f4144941d37452769c25d58a53"
+SRC_URI[log-0.4.34.sha256sum] =3D "f9f8bd3e56ce4dfc153cf470fffbfa98c762095=
8b312ca5c3a4b8d5181fd13c6"
 SRC_URI[malloc_buf-0.0.6.sha256sum] =3D "62bb907fe88d54d8d9ce32a3cceab4218=
ed2f6b7d35617cafe9adf84e43919cb"
-SRC_URI[memchr-2.7.4.sha256sum] =3D "78ca9ab1a0babb1e7d5695e3530886289c18c=
f2f87ec19a575a0abdce112e3a3"
+SRC_URI[memchr-2.8.3.sha256sum] =3D "cf8baf1c55e62ffcace7a9f06f4bd9cd3f0c4=
beb022d3b367256b91b87513d98"
 SRC_URI[minimal-lexical-0.2.1.sha256sum] =3D "68354c5c6bd36d73ff3feceb05ef=
a59b6acb7626617f4962be322a825e61f79a"
 SRC_URI[nom-7.1.3.sha256sum] =3D "d273983c5a657a70a3e8f2a01329822f3b8c8172=
b73826411a55751e404a0a4a"
 SRC_URI[objc-0.2.7.sha256sum] =3D "915b1b472bc21c53464d6c8461c9d3af805ba1e=
f837e1cac254428f4a77177b1"
-SRC_URI[once_cell-1.20.2.sha256sum] =3D "1261fe7e33c73b354eab43b1273a57c8f=
967d0391e80353e51f764ac02cf6775"
-SRC_URI[os_str_bytes-6.4.1.sha256sum] =3D "9b7820b9daea5457c9f21c69448905d=
723fbd21136ccf521748f23fd49e723ee"
-SRC_URI[owo-colors-4.1.0.sha256sum] =3D "fb37767f6569cd834a413442455e0f066=
d0d522de8630436e2a1761d9726ba56"
-SRC_URI[prettyplease-0.2.25.sha256sum] =3D "64d1ec885c64d0457d564db4ec299b=
2dae3f9c02808b8ad9c3a089c591b18033"
-SRC_URI[proc-macro-error-1.0.4.sha256sum] =3D "da25490ff9892aab3fcf7c36f08=
cfb902dd3e71ca0f9f9517bea02a73a5ce38c"
-SRC_URI[proc-macro-error-attr-1.0.4.sha256sum] =3D "a1be40180e52ecc98ad80b=
184934baf3d0d29f979574e439af5a55274b35f869"
-SRC_URI[proc-macro2-1.0.92.sha256sum] =3D "37d3544b3f2748c54e147655edb5025=
752e2303145b5aefb3c3ea2c78b973bb0"
+SRC_URI[once_cell-1.21.4.sha256sum] =3D "9f7c3e4beb33f85d45ae3e3a179218570=
6c8e16d043238c593331cc7cd313b50"
+SRC_URI[once_cell_polyfill-1.70.2.sha256sum] =3D "384b8ab6d37215f3c5301a95=
a4accb5d64aa607f1fcb26a11b5303878451b4fe"
+SRC_URI[owo-colors-4.2.3.sha256sum] =3D "9c6901729fa79e91a0913333229e9ca5d=
c725089d1c363b2f4b4760709dc4a52"
+SRC_URI[prettyplease-0.2.37.sha256sum] =3D "479ca8adacdd7ce8f1fb39ce9ecccb=
fe93a3f1344b3d0d97f20bc0196208f62b"
+SRC_URI[proc-macro2-1.0.107.sha256sum] =3D "985e7ec9bb745e6ce6535b544d84d6=
cd6f7ad8bd711c398938ae983b91a766d9"
 SRC_URI[quickcheck-1.0.3.sha256sum] =3D "588f6378e4dd99458b60ec275b4477add=
41ce4fa9f64dcba6f15adccb19b50d6"
-SRC_URI[quote-1.0.37.sha256sum] =3D "b5b9d34b8991d19d98081b46eacdd8eb58c6f=
2b201139f7c5f643cc155a633af"
-SRC_URI[rand-0.8.5.sha256sum] =3D "34af8d1a0e25924bc5b7c43c079c942339d8f0a=
8b57c39049bef581b46327404"
+SRC_URI[quote-1.0.47.sha256sum] =3D "1fbf4db142a473a8d80c26bbf18454ed458bf=
8d26c8219c331daecfdbd079001"
+SRC_URI[r-efi-5.3.0.sha256sum] =3D "69cdb34c158ceb288df11e18b4bd39de994f66=
57d83847bdffdbd7f346754b0f"
+SRC_URI[rand-0.8.8.sha256sum] =3D "e058c7de0b26af77780c769414d6257830bb240=
f3c38477dbc2c16e5f54d6d4c"
 SRC_URI[rand_core-0.6.4.sha256sum] =3D "ec0be4795e2f6a28069bec0b5ff3e2ac9b=
afc99e6a9a7dc3547996c5c816922c"
-SRC_URI[redox_syscall-0.3.5.sha256sum] =3D "567664f262709473930a4bf9e51bf2=
ebf3348f2e748ccc50dea20646858f8f29"
-SRC_URI[regex-1.11.1.sha256sum] =3D "b544ef1b4eac5dc2db33ea63606ae9ffcfac2=
6c1416a2806ae0bf5f56b201191"
-SRC_URI[regex-automata-0.4.9.sha256sum] =3D "809e8dc61f6de73b46c85f4c96486=
310fe304c434cfa43669d7b40f711150908"
-SRC_URI[regex-syntax-0.8.5.sha256sum] =3D "2b15c43186be67a4fd63bee50d0303a=
fffcef381492ebe2c5d87f324e1b8815c"
-SRC_URI[rustc-hash-2.1.0.sha256sum] =3D "c7fb8039b3032c191086b10f11f319a6e=
99e1e82889c5cc6046f515c9db1d497"
-SRC_URI[rustix-0.37.27.sha256sum] =3D "fea8ca367a3a01fe35e6943c400addf443c=
0f57670e6ec51196f71a4b8762dd2"
-SRC_URI[shlex-1.3.0.sha256sum] =3D "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3=
524c3cb8fb653a3023f6323e64"
-SRC_URI[similar-2.6.0.sha256sum] =3D "1de1d4f81173b03af4c0cbed3c898f6bff5b=
870e4a7f5d6f4057d62a7a4b686e"
+SRC_URI[regex-1.13.1.sha256sum] =3D "f020237b6c8eed93db2e2cb53c00c60a8e1bc=
73da7d073199a1180401450218d"
+SRC_URI[regex-automata-0.4.18.sha256sum] =3D "ad8553b9b26413251cbf30e62059=
5c7a41b3887f03da04579c0e6b0d6a06b4b2"
+SRC_URI[regex-syntax-0.8.11.sha256sum] =3D "d6f6ff9a378485b298a5286656da66=
5ba74413d36db0979633275d2e708145d4"
+SRC_URI[rustc-hash-2.1.1.sha256sum] =3D "357703d41365b4b27c590e3ed91eabb1b=
663f07c4c084095e60cbed4362dff0d"
+SRC_URI[rustix-1.1.4.sha256sum] =3D "b6fe4565b9518b83ef4f91bb47ce29620ca82=
8bd32cb7e408f0062e9930ba190"
+SRC_URI[shlex-2.0.1.sha256sum] =3D "f8fadd59c855ef2080decdef8ff161eb6661b8=
6933c9d82e5ba29dc602a55aba"
+SRC_URI[similar-2.7.0.sha256sum] =3D "bbbb5d9659141646ae647b42fe094daf6c61=
92d1620870b449d9557f748b2daa"
 SRC_URI[strsim-0.10.0.sha256sum] =3D "73473c0e59e6d5812c5dfe2a064a6444949f=
089e20eec9a2e5506596494e4623"
-SRC_URI[syn-1.0.109.sha256sum] =3D "72b64191b275b66ffe2469e8af2c1cfe3bafa6=
7b529ead792a6d0160888b4237"
-SRC_URI[syn-2.0.90.sha256sum] =3D "919d3b74a5dd0ccd15aeb8f93e7006bd9e14c29=
5087c9896a110f490752bcf31"
-SRC_URI[tempfile-3.6.0.sha256sum] =3D "31c0432476357e58790aaa47a8efb0c5138=
f137343f3b5f23bd36a27e3b0a6d6"
-SRC_URI[termcolor-1.2.0.sha256sum] =3D "be55cf8942feac5c765c2c993422806843=
c9a9a45d4d5c407ad6dd2ea95eb9b6"
-SRC_URI[unicode-ident-1.0.14.sha256sum] =3D "adb9e6ca4f869e1180728b7950e35=
922a7fc6397f7b641499e8f3ef06e50dc83"
-SRC_URI[unicode-width-0.1.14.sha256sum] =3D "7dd6e30e90baa6f72411720665d41=
d89b9a3d039dc45b8faea1ddd07f617f6af"
-SRC_URI[version_check-0.9.4.sha256sum] =3D "49874b5167b65d7193b8aba1567f5c=
7d93d001cafc34600cee003eda787e483f"
-SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] =3D "9c8d87e72b64a3b=
4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
-SRC_URI[winapi-0.3.9.sha256sum] =3D "5c839a674fcd7a98952e593242ea400abe939=
92746761e38641405d28b00f419"
-SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] =3D "ac3b87c63620426dd=
9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
-SRC_URI[winapi-util-0.1.5.sha256sum] =3D "70ec6ce85bb158151cae5e5c87f95a8e=
97d2c0c4b001223f33a334e3ce5de178"
-SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] =3D "712e227841d057c=
1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
-SRC_URI[windows-sys-0.48.0.sha256sum] =3D "677d2418bec65e3338edb076e806bc1=
ec15693c5d0104683f2efe857f61056a9"
-SRC_URI[windows-sys-0.52.0.sha256sum] =3D "282be5f36a8ce781fad8c8ae18fa3f9=
beff57ec1b52cb3de0789201425d9a33d"
-SRC_URI[windows-targets-0.48.5.sha256sum] =3D "9a2fa6e2155d7247be68c096456=
083145c183cbbbc2764150dda45a87197940c"
-SRC_URI[windows-targets-0.52.6.sha256sum] =3D "9b724f72796e036ab90c1021d47=
80d4d3d648aca59e491e6b98e725b84e99973"
-SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] =3D "2b38e32f0abccf9987a=
4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
-SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] =3D "32a4622180e7a0ec044=
bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
-SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] =3D "dc35310971f3b2dbbf3f06=
90a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
-SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] =3D "09ec2a7bb152e2252b53fa=
7803150007879548bc709c039df7627cabbd05d469"
-SRC_URI[windows_i686_gnu-0.48.5.sha256sum] =3D "a75915e7def60c94dcef72200b=
9a8e58e5091744960da64ec734a6c6e9b3743e"
-SRC_URI[windows_i686_gnu-0.52.6.sha256sum] =3D "8e9b5ad5ab802e97eb8e295ac6=
720e509ee4c243f69d781394014ebfe8bbfa0b"
-SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] =3D "0eee52d38c090b3caa76c5=
63b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
-SRC_URI[windows_i686_msvc-0.48.5.sha256sum] =3D "8f55c233f70c4b27f66c52358=
0f78f1004e8b5a8b659e05a4eb49d4166cca406"
-SRC_URI[windows_i686_msvc-0.52.6.sha256sum] =3D "240948bc05c5e7c6dabba28bf=
89d89ffce3e303022809e73deaefe4f6ec56c66"
-SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] =3D "53d40abd2583d23e4718fddf=
1ebec84dbff8381c07cae67ff7768bbf19c6718e"
-SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] =3D "147a5c80aabfbf0c7d901cb5=
895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
-SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] =3D "0b7b52767868a23d5bab=
768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
-SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] =3D "24d5b23dc41741267968=
1396f2b49f3de8c1473deb516bd34410872eff51ed0d"
-SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] =3D "ed94fce61571a4006852b73=
89a063ab983c02eb1bb37b47f8272ce92d06d9538"
-SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] =3D "589f6da84c646204747d127=
0a2a5661ea66ed1cced2631d546fdfb155959f9ec"
+SRC_URI[syn-2.0.119.sha256sum] =3D "872831b642d1a07999a962a351ed35b955ea2c=
fc8f3862091e2a240a84f17297"
+SRC_URI[tempfile-3.27.0.sha256sum] =3D "32497e9a4c7b38532efcdebeef879707aa=
9f794296a4f0244f6f69e9bc8574bd"
+SRC_URI[termcolor-1.4.1.sha256sum] =3D "06794f8f6c5c898b3275aebefa6b8a1cb2=
4cd2c6c79397ab15774837a0bc5755"
+SRC_URI[unicode-ident-1.0.24.sha256sum] =3D "e6e4313cd5fcd3dad5cafa179702e=
2b244f760991f45397d14d4ebf38247da75"
+SRC_URI[unicode-width-0.2.2.sha256sum] =3D "b4ac048d71ede7ee76d585517add45=
da530660ef4390e49b098733c6e897f254"
+SRC_URI[utf8parse-0.2.2.sha256sum] =3D "06abde3611657adf66d383f00b093d7fae=
cc7fa57071cce2578660c9f1010821"
+SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] =3D "ccf3ec651a847eb=
01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
+SRC_URI[wasip2-1.0.4+wasi-0.2.12.sha256sum] =3D "b67efb37e106e55ce722a510d=
6b5f9c17f083e5fc79afc2badeb12cc313d9487"
+SRC_URI[winapi-util-0.1.11.sha256sum] =3D "c2a7b1c03c876122aa43f3020e6c3c3=
ee5c05081c9a00739faf7503aeba10d22"
+SRC_URI[windows-link-0.2.1.sha256sum] =3D "f0805222e57f7521d6a62e36fa9163b=
c891acd422f971defe97d64e70d0a4fe5"
+SRC_URI[windows-sys-0.61.2.sha256sum] =3D "ae137229bcbd6cdf0f7b80a31df6176=
6145077ddf49416a728b02cb3921ff3fc"
+SRC_URI[wit-bindgen-0.57.1.sha256sum] =3D "1ebf944e87a7c253233ad6766e082e3=
cd714b5d03812acc24c318f549614536e"
diff --git a/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb b/meta=
/recipes-devtools/bindgen-cli/bindgen-cli_0.73.2.bb
similarity index 96%
rename from meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
rename to meta/recipes-devtools/bindgen-cli/bindgen-cli_0.73.2.bb
index 2ef797c1566..ad74e99bef8 100644
--- a/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
+++ b/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.73.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0b9a98cb3dcdefcc=
eb145324693fda9b"
 inherit rust cargo cargo-update-recipe-crates
=20
 SRC_URI +=3D "git://github.com/rust-lang/rust-bindgen.git;protocol=3Dhttps=
;nobranch=3D1;tag=3Dv${PV}"
-SRCREV =3D "d874de8d646d9b8a3e7ba2db2bcd52f2fba8f1f5"
+SRCREV =3D "73c69d681eec90b84ffba4f993b5fb2f19580781"
=20
 require ${BPN}-crates.inc
=20

