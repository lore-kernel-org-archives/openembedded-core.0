Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.71])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14290.1795701412551658694
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 05:56:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=VaXquDoL;
 spf=pass (domain: est.tech, ip: 52.101.69.71, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdoGnhfqRGkSsez/c6njP8dCl4OqlM2ZQv73nBnB5oQT/PoWH/uWqzSJzY/8U2fhSYu91RXwBeeiygw0DmpiNTzkUgNvAZGdzavDgtl3urw40VBy/0/a0rmoFJXRp1+1OC9SCUjTZs+FePa3VqdTuCVzYyam1nKL9RApIket6NoYk7otouE5WUJFi/C5mIzM77cJfArAO0hIh5QyhMJTcO8YPpTGwOGFgKzEfd+xS43bAsbeX8PQYsfRKhSzcBZiqbDuRnhd7kElyho1ybInnWnrj/fPtalC8M/ABljTK5geiug1yr0LowCRFsz0v3t8ttZ6zV/WTTEyrzZTdjti2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Du7NJb73XIzYgt6vAmkIiZxDxol7Piw2P0HkyLcjJ8=;
 b=PcTII6D6ltGhSzm/XiTI7qANhYjJYWmnlMvBbgtXPQWz/wCcvKgnkt+1Y2+6oE34oDLVU1fT0m0lJQ9IiQtE13Yk9Eogm0/dWbAdqPs3JruTlGTfUXka0l72n7BW8def31Dc6uqFRjbWRMbvCYqp5ANBzbucpe/tMyyMz0EqMP+gkrfLQ4KkuxdJrM9R2duqPVlte2+cmGpMwPkNeJLvsUXufkGtBORXRe+VYa8mBftyl6MT32hcpBhMahhR1gmgYmDLA1JYAVOPqTxC+VEjxeHNtRl0OrObSCvEzIA/bsqDcvdOOcCuefrzMXbCg8j4tf3j5Y+b0BighmSrvhK+nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Du7NJb73XIzYgt6vAmkIiZxDxol7Piw2P0HkyLcjJ8=;
 b=VaXquDoLUsZQTgDF25BdZCeJVg3idlKDNAx43QbKK5nWq3YiaeMFNtdAYWwX9laE8guMjoj9paibp5zBW5PmE13ewbb1h4EOUX675PZQib5AlypCvWYbMTtFtncKTwrxtHJAagoZ7hVeWkbRfsiZ9U/V1pO8m3CVlaHkM8hh0ojoU992E5WH9mTyC1yRatRfXZLmM2KM9d7GEulXeqvY1i07yJ+8xXFrs5l2UMJ2zXBtSO8GKB2N/B824v4hvrkk0oLB2wfQa6BiyImSJqXdVCVsa5CSUMlz+T4SVDYNSXNQp1B0d+dn+5/0L2A1jePGCD+WE8nfI4ZG2oihQFbVQg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM7P189MB1107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 13:56:50 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 13:56:50 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] meson: keep can_use_env when merging EnvironmentVariables
Date: Thu, 26 Nov 2026 14:56:44 +0100
Message-ID: <20261126135646.90796-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261126135646.90796-1-jaipaul.cheernam@est.tech>
References: <20261126135646.90796-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0320.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::13) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM7P189MB1107:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fd04a60-5b65-4c33-7764-08df4bc51e45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10067099003|11063799006|260925021911599003|260925022911599003|260925021311599003|56012099006|261021121427099003|261026140227099003|261026121527099003|261022105027099003|261009223027099003|261028144727099003|261102123227099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: yVjIP90n4gladT/Sy5bzKTYHHbK/OG8I1xj9vW0uWYhdp0/AT15F8QGb4AtzxpJgdDxMs5n+iN56/hyjYQbT7eq5Kf9vniRoxAJ8nkV3ssj6y5Pnh3hYjmoo02KfBKqQ6aOEIAq83Az/xCPmShdtFL3NnPJmxwa9pGv0rCd/pU9Zq130Sn61jlXmETB6h1k88bFQDBGh+WikVMzXzpW/QwOj/1KM5UZJZrS8Ons4oMq5xUmpsQgDupKnE/5ems5yCmkRkVF8oAV314zF451spZM8oOBLDlmRW99FUPDPuDpc22VnG35KtZMaesVAoXsr3AAaCEXJC8q94SXO/xjY4/Rd0vfw6XrR/MD1v0T1NA1m6DNt/NxwyG+jL/BPiBezYtsjpjyrjlROT42mII4aL0KlMJ4yl8jpFFgpotWa+6nyACiyEs5w+hq22F1etI31SIyqZWnTOBUn2a4IkwQhthpB+NDq1NQSQUnJg5bu/CEhq4xOORRE3rqNsfFYsTw7FlM4IhhzOkwZTNMJk9oa+CXh3vfL8jSgkDoxxhByS3uZxY2yRbj1B8i3BaBjDbOSJPJqPO3+7bkg72bkt3RRSwIxU0yoGDDMADFvQi4qJHWUUiuZZSlvhZFS9QgHKw/n8i8mKY5/96Wqf58epNCifsVNDukfhJsYWlxq1L8VabI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(11063799006)(260925021911599003)(260925022911599003)(260925021311599003)(56012099006)(261021121427099003)(261026140227099003)(261026121527099003)(261022105027099003)(261009223027099003)(261028144727099003)(261102123227099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RhuaBufvX0wXhvri5Il3hAlBQWmGn+HXdmDm0LCagoAe0BPl1HkwXnRleE6o?=
 =?us-ascii?Q?cUkNxkDqxQEBrB89e5vE76JjT7GRR105AZ7KRXi7v1jozZFMCT893kEvTOD2?=
 =?us-ascii?Q?6sd8DgIlDz9RFJC7emdVG+G9kl4SGUkQXA56TjoxHKjFHApF01e8B42HeO0g?=
 =?us-ascii?Q?iVSwPWJ3sPMlqO21GFyt51khhEGPrp+BM9AIl/dL19MfRUwmu2KlD6to3GOX?=
 =?us-ascii?Q?uvV88eqicVCqIEAqvktRoKUL+lXP6xwHVNg21o+rvZELAxnRcbYDYRJTq7e6?=
 =?us-ascii?Q?Tjn5jTv/MEhMmNjPOQSlsNgt+DQqzJgDUV9mBXL3JZEjBF5+5/awSoDW/mW6?=
 =?us-ascii?Q?C85nt0cQJuchZbfrZrC5+U8uyoGSIK+zxIqSKRc8dnslg/g0nYW0J2L4dg1U?=
 =?us-ascii?Q?j6d29pEvTSgwIf6m5aCYrWU1VSbS87GGf2Sxql1SfXOG4EQE3IfKmRdQ9vyV?=
 =?us-ascii?Q?P2z0tkl3dqgio5gFqp+VD+PP5kTwQy9UMtl57MKd4/WFSCzQTdLffGsmIdVu?=
 =?us-ascii?Q?U7uYuIEUiNz7/UOiYSgRpGj4xm3ulB0e8xGCYBWo6X+B+ncWW1qGKmi3q0gv?=
 =?us-ascii?Q?uv9BD32u9WoRl8pXxBM8+JaruYZyFC/tfureRLrRW9nTFCac4WmYjk/PEO2H?=
 =?us-ascii?Q?Q+LSx7ZnmlWV4LIMLnTJ/Hk9vSqvUUmMeNv/OhRL4icn4yVXcFrwinlNIqvQ?=
 =?us-ascii?Q?byvX/M5FiCUen5V1H6tBfKp8aRDpDsc8ouSRS2zab3XWz4pYqkr+Mpw3ImFA?=
 =?us-ascii?Q?zeu21Gfw0AilsRbcn0iWk11PLBJrGkOWTR8WpoFTEv/EI9UkAW0HdNVwzEls?=
 =?us-ascii?Q?qTrZttxU9slQ0DPSlYCQrieZnpGPuqhmGpW0jLAJ8OLcv+g7QzJ74HPDle5Q?=
 =?us-ascii?Q?3F4p6dTGzuFE5q9wZhGhunL93DNrN6uLcw36SzONTXNZmEcN7JNBzJJisbIh?=
 =?us-ascii?Q?/GQPU9Td/lV5GjlpAEKRVbyDuyt8ffQrSiDPmPlR77YvLyIGfDB+M/lEFH7a?=
 =?us-ascii?Q?s00kYRin/9LFDdP6Kgi7xt00rMZilYZoCHxwDfcZCdAxgZt3kWhw2AI67AHb?=
 =?us-ascii?Q?kwUdweCq74jCW+zk26ubdbH8KrjEHgMF1FcIlQJeTeR371GhvwVZyoYX2EwE?=
 =?us-ascii?Q?gtX6NCqzZtyFuxrw9oXaXXxpWIqQVBk6hPkXkrqbCVy7Y0l/1B9MelKC+xLa?=
 =?us-ascii?Q?bHM0EnZfO+RaFVlO3KREqVA4qZ/nUSjOC+t5tCiKYiFe6PSMXUon9NPm9hiz?=
 =?us-ascii?Q?orvpNAHb0BqVQ16xgEGlLsCb3Cl178XSFkA7oUu1bceE4vjkqV9IbTNi12Dz?=
 =?us-ascii?Q?KYz5RemZbSXxxVTCLiQpDbMcS9FX0wagDCkInVspZYyCOgunHwaHuQBDKv4Q?=
 =?us-ascii?Q?N0zlcfCAomo39orCOrG1Hdl0eHq3Zkcwf6uq48MdPxXvYJn8ocF9uPtIUdfl?=
 =?us-ascii?Q?seYdgl/dRBoj79b9NynEx/KOG5Nl7LrhvPdM2pKJ4Hcz3NiMRC/JTN0YLsNA?=
 =?us-ascii?Q?l6bIMjToXBTIqnXVfxR2lr7Gjw+IF3ORor08QMRdSPMTKdhojtKSwONosMLP?=
 =?us-ascii?Q?JO7PzW7kXBc2nqVPohBG9yXDbiOM7bGM2C7RqZ5kVxCM1NYIWzGRTIiwrB7Y?=
 =?us-ascii?Q?aNZH+jKl0PaCkQNNM6+qkiMYMkk5cmH47b0VBwnGAIOnQGlqv84aGC4JWzky?=
 =?us-ascii?Q?aeAmzIBUNq2P78LQGrkUd50McKnPDYT61U8Ix9k60R0QmLORVHPc1izlMA/R?=
 =?us-ascii?Q?eLYp9m699Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd04a60-5b65-4c33-7764-08df4bc51e45
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 13:56:49.9698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wu/7LxZodvm/VX/P3fyzB+aEI8Qgc2UldTdSxo+rnn8rGesw1RzlZQ02aNbZLOLzCG2wBd3J1vD5P1KKRbDhfYqaL2weva3soMNlnXpTyHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB1107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 13:57:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251304
Content-Type: text/plain; charset="utf-8"

merge() dropped can_use_env, so prepend()/append() in
gnome.generate_gir() overwrote the variable instead of extending it.
This breaks glib 2.90.1, whose g-ir-scanner loses the caller's LD_LIBRARY_P=
ATH.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...se_env-when-merging-EnvironmentVaria.patch | 36 +++++++++++++++++++
 meta/recipes-devtools/meson/meson_1.12.1.bb   |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/meson/meson/0003-utils-keep-can_u=
se_env-when-merging-EnvironmentVaria.patch

diff --git a/meta/recipes-devtools/meson/meson/0003-utils-keep-can_use_env-=
when-merging-EnvironmentVaria.patch b/meta/recipes-devtools/meson/meson/000=
3-utils-keep-can_use_env-when-merging-EnvironmentVaria.patch
new file mode 100644
index 0000000000..62df13652e
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0003-utils-keep-can_use_env-when-me=
rging-EnvironmentVaria.patch
@@ -0,0 +1,36 @@
+From c6199341bcd47239d56df5df05971ba237d39d90 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Wed, 25 Nov 2026 18:43:12 +0000
+Subject: [PATCH] utils: keep can_use_env when merging EnvironmentVariables
+
+merge() didn't carry over can_use_env, so an env using append() or
+prepend() lost the existing value when merged, e.g. in
+gnome.generate_gir().
+
+Fixes #16382
+
+Backport Notes: The unit test added to unittests/internaltests.py upstream
+is dropped, as it does not apply to 1.12.1 and the unit tests are not run
+as part of the meson recipe.
+
+Upstream-Status: Submitted [https://github.com/mesonbuild/meson/pull/16383=
]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ mesonbuild/utils/core.py | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/mesonbuild/utils/core.py b/mesonbuild/utils/core.py
+index 3b212e2d1..90a85c779 100644
+--- a/mesonbuild/utils/core.py
++++ b/mesonbuild/utils/core.py
+@@ -95,6 +95,10 @@ class EnvironmentVariables(HoldableObject):
+         return self.varnames
+=20
+     def merge(self, other: EnvironmentVariables) -> None:
++        # append() and prepend() depend on the value inherited at runtime=
, so
++        # the merged object can't use the env shortcut either.
++        if not other.can_use_env:
++            self.can_use_env =3D False
+         for method, name, values, separator in other.envvars:
+             self.varnames.add(name)
+             self.envvars.append((method, name, values, separator))
diff --git a/meta/recipes-devtools/meson/meson_1.12.1.bb b/meta/recipes-dev=
tools/meson/meson_1.12.1.bb
index e8c1b3d7e0..74a32252ea 100644
--- a/meta/recipes-devtools/meson/meson_1.12.1.bb
+++ b/meta/recipes-devtools/meson/meson_1.12.1.bb
@@ -13,6 +13,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/meson-${PV=
}.tar.gz \
            file://meson-wrapper \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
+           file://0003-utils-keep-can_use_env-when-merging-EnvironmentVari=
a.patch \
            "
 SRC_URI[sha256sum] =3D "ab0a6ca09f8ef70c564c8241fb5a23957886a0b53fb58412b5=
e07eaf07dba743"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)$"
