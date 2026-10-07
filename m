Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A35FCA5FF1
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 05:58:35 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2034.1791352706928220788
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 22:58:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Dq9GTCq3;
 spf=pass (domain: est.tech, ip: 52.101.83.50, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ecc724ZAfaS7gkPtNcO5YRG6eyDfmyvvYSwY5wO7L8eYZL8oXJ5Ocp/Xgoqy15otuLJvhYl5ZQqBlw7u7QJcqUC5T3EomtSrgRTWedHpKpOZCaotJ+CPWCXA6Eb6ZEUatJ2Q9Dyqsma7J0HprLYQLHV7APkHqS5Ca/otj60xUzlXJDrK4oxK0rjNjCpLTTkH8+knnCDyF0ns9hy4UYNlxmm0baIgy74PKgcxag8l3IabqVp71fcbXhP26Sa3ykQWg6CdL5oo42GfK6XZAEEcBtmCy7De2GLpPjOWoc9y3NO02Yusa5eEuTRvKwnRqMOw5EEEpG91Xw+VsvQXt4jSrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KX2mVlA1XDne6w0KooigfwSKqSq+hYrz96AVYy5AmBs=;
 b=c02SwymUTw9TACUvXRTWacYI1WEN6B7UmPPBN9Nf1DngnGH1VEPJzHNw9WAcakghYSMkHBWGKnPawcQOldgruROLJ/GjEe6uEPzUMbqNDX79dpNRG/HAubo0PccPtyzjZnxO2r7zvcBEctUiLNjm/QIW2i+Cj46fd5cG/N0c3vpFDpyNQDaWryOhpvc4Ie+Wix1kKUptCKqnphg9D5KUXY7A9QRlTlXlukIjkVAhgXYgZkXIlbJiDKnTFdqWOeFXMNE/o5qg5P/NZn1PksvzLBg/EpLRSJdBblwnuvc0Q1qrLACgHdQLWS9XSEiEB96BnGx5nHYkXd6gJLbwJ5M8bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KX2mVlA1XDne6w0KooigfwSKqSq+hYrz96AVYy5AmBs=;
 b=Dq9GTCq3Q9ooBp43+kBtIdvqc6UorGJD8LMJUd72DYcAci2JMFwOozRFnkksKoBet/6Y2yL8Q0HNaCSntL3hsE99917qe//tpeXm+08Gy6WOJ5MxObB/znteBG8Hh/Q/VrJZ7u2pf+Vjpa/umpYGJcNWnVfZ6mNm8jX3hsFG2/+7ZWXg/N+Nlo6HBj/2+81vdbIbnL1VnDMtXOSEE0XdayHx9MMEvL0WyBok5diYUPpBH/zBLoJydE8veg/ZcIw+8lNoYCNlWZTbZS9bgqLQ9fQ43LjXnt3neXhSzQkkauo9eEKvCfXNSc0eouzBQ7jnbzBa7m3XSh2ERSudSlRSAA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM8P189MB1316.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:246::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Wed, 7 Oct
 2026 05:58:29 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.010; Wed, 7 Oct 2026
 05:58:29 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] python3-rpds-py: upgrade 2026.6.3 -> 2026.9.1
Date: Wed,  7 Oct 2026 07:58:20 +0200
Message-ID: <20261007055820.59633-6-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261007055820.59633-1-jaipaul.cheernam@est.tech>
References: <20261007055820.59633-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZP191CA0002.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f9::12) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM8P189MB1316:EE_
X-MS-Office365-Filtering-Correlation-Id: 93c78936-ecd7-44d3-8341-08df24380303
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|56012099006|11063799006|260925022911599003|260925021911599003|260925021311599003|18002099003|10067099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	QoGHkNLt8nx0sthDPKzTr+AwchMn0P9LF8B2OhZxV43mv1ird4GmDfpbJ0TApGYMxA96s27lPu1LrgINPRi92Pdp8h8UxuyCzCcERoEZyUzWydQ5dLBCMFQOJJI0Ye4NhwaZ+y/mAZlkxv2BMbi6ndOKv+Vf9hPHpom02ciP3VM7nm8isnnTSzBNeGS5JyVCmUwlJw+ciMB4yE9CoIbZEny+yqqWG13+nuqBE+3rEIft698ojI9tUDr8C8S2JrYm4HJNmgMtYBEAfRB74DFmao3uiQz7WILlQcAjxeLdzHv0a32Pte1aI6/EbH+zpsgund1KYyFeRpUBKsW4lUbIZzEUH3QmrfLEbwAPTQld1k2CKe8QPauxsszqKSoqmcHeJ3u2c33tTIBXv/z0g+eld8g0V4uyv8ELwSuHXSRToFOQIm9LbViDkqNLTO+1Fw8hF0waEXMATRcplYgb6S+8gWzNCmyVPtp1CJ/Z+poduX96cbMbgnQrYphpSAQrwKaeGa0IrA/TRYzXVRZoK7I8pTB1YjfaS7dC1nFpiqrscLF1skbVtVMuV3tZonx6ecKFZ8aI8OQ8k673DjGwIIXJbzBetvUc1m9dNbv5LCQRDiY3bWfQQSW8dV07tAShXjFd
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(56012099006)(11063799006)(260925022911599003)(260925021911599003)(260925021311599003)(18002099003)(10067099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Yp7hVVY1suHGx+kgD41fFnyXf6q5SyDdiPAFOObLlpZG2DjFUKte/beawsG0?=
 =?us-ascii?Q?4bRuNMBeRVeFGCL1s8ITCMmzDZ8xlfmVoDGTi9FPwXSS3+N5g6R8E+IBSAxy?=
 =?us-ascii?Q?XlHhRy4tahWTRBwk9JFYH69emnQ1UKdEsvXdyx7TPlcQzryiAiOvFQ2r4/iw?=
 =?us-ascii?Q?nu2szRiud2Vf7Vwe0y562WdmGTbO1nDKtLTFznCZJ6QbKpJOOrMKfn+Yt/9q?=
 =?us-ascii?Q?UL2iBT6RB1jpR++AOvxybLI5T9VE93fH053pcuKMYaKDa0EOhAFOc1D6CX3/?=
 =?us-ascii?Q?dQQbhGbZgZxIeDlXV/9PiiX+5Nx3upg/QpYSPfcTT54qxN0RMOcf//mJkeb+?=
 =?us-ascii?Q?MhDZazSbSeU5fm0B9PjonBFZcsrYL3kaJ1y4R3o0Eq3TmjptFYqblEh9eMXr?=
 =?us-ascii?Q?sGTNKEk8t9ZAMHxBm3Ji035VIiZget5vgMP3L3vvvWf8YrOHilwHsB9L5cWX?=
 =?us-ascii?Q?MnAbC2k5e5QSMcXB5+HbCn2v8fL42vM0OzKMDEez6qfVLNu6Ue10+/J/ckE1?=
 =?us-ascii?Q?/k9N9JHE8T+kAhcDuE+d/FfiWiF6YprM0WA9Utsjb3VEZkY0vPyvW6/JYSYY?=
 =?us-ascii?Q?Jpj1CfdZ77MCMNn1K6qv0eXs1ijbECmj1rMuMfXoLd+bCdjnO5cLNxtBe1x4?=
 =?us-ascii?Q?JZMmK9zsM9wMsChi4NILH7g3OhQGQHk/NHFydHVAkGsrcuQ2UD+ZD7kZ78pV?=
 =?us-ascii?Q?a9kWCv4wVZq5O/5XD+IPJOJB1MkJxagy0DFEW7klNOOsK2GB1YnnHYA1CdO1?=
 =?us-ascii?Q?zLnEshHNjUbr/8EdtJaR6EU5/XxSjTC0eZlSUP5FtodWgV1pXMtBzQ7sMFiD?=
 =?us-ascii?Q?B96cu6dPED67QBYM+5E3fTFcJzGX6NSNflUk/pcwGUz+MIV/ruXvpL0bSPIe?=
 =?us-ascii?Q?MHTM0galNhPZScCiSEVpOOkJpLNV2InvKzdLzOEJK495RyNtIiLYCsRSO+7D?=
 =?us-ascii?Q?ImVzJZeO5OoOPDWGp3VaGmGVfsub9tjLSdIgoz6LLat1ZiHLu+TX+kAZdAcS?=
 =?us-ascii?Q?tpbQwqwYc5b5GvS6nVroD2dK+5J0YLtipod9z3hoyzAUAarP5nV+BcsnYiEg?=
 =?us-ascii?Q?d5wNrAZRnH9hFuqYD9loFfHr5ogd8rgzLr9mSwXiPnegkgvZe5rtGve32EM2?=
 =?us-ascii?Q?0vakehg0ITBO8vJ+lIbp3ebqOJzVCVOmfWJwlNZUXl7ayGH/C33LP1xtiq36?=
 =?us-ascii?Q?kiTJEqXuVaoSVXaZLw1W0QznOZ6KnJb63UFKiuyNnHT/VhsohgIiFPGYfoUH?=
 =?us-ascii?Q?rTP9GsDBgVT0kcgZoty/7ZaLxSVmBDsJuHHgsRBOqjMYZN8n0qlLjHtQpWGq?=
 =?us-ascii?Q?sm/zX9opnXlyHDaAMqgRkBMS1/RH1BDSxP5AuC6zl/ZI1waoD373xmoKJ8sq?=
 =?us-ascii?Q?NJm/Z6LzmJEq60Atv6qhJz8GC8reU6tbqDB8/ppdWFESbjAIkIAXav71NfpE?=
 =?us-ascii?Q?JFCX43U5RtV4xEP+Scx6o9NiH4OC4H/vj7Jh/2w4YCQPS3z0BuQiMvMmgNBe?=
 =?us-ascii?Q?XENxMHF85m7BrrLdw5+re9rVd0A9HNblS90IQgZegz1fAozWTvniufyi+jJG?=
 =?us-ascii?Q?+1Y0bKeJ57fzzUunn/NroUskDeaxz29xnPjQ1wpP5b2waWjg+6E5Z/J/9vD/?=
 =?us-ascii?Q?4IOEWnPJ/Oe01vnD2i22E6RiUVtj/hVIcOwY/d7KuJOIM8t8lmwz8KBAz2zU?=
 =?us-ascii?Q?fhA/NdpeX6dOOnPruS0gN4pYuROvaSwYmqoSTkg9sFCm9YbqiXPqotrE7ohM?=
 =?us-ascii?Q?VpFunn/x0xY9B5CcWGY9ZhXeKWYSn8Y=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 93c78936-ecd7-44d3-8341-08df24380303
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 05:58:29.8246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bOExmZerqaYNsYPAex/ypZerhROPYIg3hwaAsZhstmgnOelzb60kO/gc4lZf0kAy3qTBAZhXifs+Os3uosFDQa5yk5v73jeXbUFwn4Fcnvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P189MB1316
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 05:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247374

Compare-Log: https://github.com/crate-py/rpds/compare/v2026.6.3...v2026.9.1

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../python/python3-rpds-py-crates.inc         | 28 +++++++++----------
 ...026.6.3.bb =3D> python3-rpds-py_2026.9.1.bb} |  2 +-
 2 files changed, 15 insertions(+), 15 deletions(-)
 rename meta/recipes-devtools/python/{python3-rpds-py_2026.6.3.bb =3D> pyth=
on3-rpds-py_2026.9.1.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-rpds-py-crates.inc b/meta=
/recipes-devtools/python/python3-rpds-py-crates.inc
index 16091415ef..a5ec5a993a 100644
--- a/meta/recipes-devtools/python/python3-rpds-py-crates.inc
+++ b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
@@ -2,41 +2,41 @@
=20
 # from Cargo.lock
 SRC_URI +=3D " \
-    crate://crates.io/archery/1.2.2 \
+    crate://crates.io/archery/1.2.3 \
     crate://crates.io/heck/0.5.0 \
     crate://crates.io/libc/0.2.177 \
     crate://crates.io/once_cell/1.21.3 \
     crate://crates.io/portable-atomic/1.11.1 \
     crate://crates.io/proc-macro2/1.0.103 \
-    crate://crates.io/pyo3/0.29.0 \
-    crate://crates.io/pyo3-build-config/0.29.0 \
-    crate://crates.io/pyo3-ffi/0.29.0 \
-    crate://crates.io/pyo3-macros/0.29.0 \
-    crate://crates.io/pyo3-macros-backend/0.29.0 \
+    crate://crates.io/pyo3/0.29.3 \
+    crate://crates.io/pyo3-build-config/0.29.3 \
+    crate://crates.io/pyo3-ffi/0.29.3 \
+    crate://crates.io/pyo3-macros/0.29.3 \
+    crate://crates.io/pyo3-macros-backend/0.29.3 \
     crate://crates.io/quote/1.0.42 \
     crate://crates.io/rpds/1.2.1 \
     crate://crates.io/smallvec/1.15.1 \
     crate://crates.io/syn/2.0.111 \
     crate://crates.io/target-lexicon/0.13.3 \
-    crate://crates.io/triomphe/0.1.15 \
+    crate://crates.io/triomphe/0.1.16 \
     crate://crates.io/unicode-ident/1.0.22 \
 "
=20
-SRC_URI[archery-1.2.2.sha256sum] =3D "70e0a5f99dfebb87bb342d0f53bb92c81842=
e100bbb915223e38349580e5441d"
+SRC_URI[archery-1.2.3.sha256sum] =3D "33ca55ee147b1926dbea904f50fe4902494e=
97bc742205abbbf10c709e43815f"
 SRC_URI[heck-0.5.0.sha256sum] =3D "2304e00983f87ffb38b55b444b5e3b60a884b5d=
30c0fca7d82fe33449bbe55ea"
 SRC_URI[libc-0.2.177.sha256sum] =3D "2874a2af47a2325c2001a6e6fad9b16a53b80=
2102b528163885171cf92b15976"
 SRC_URI[once_cell-1.21.3.sha256sum] =3D "42f5e15c9953c5e4ccceeb2e7382a7164=
82c34515315f7b03532b8b4e8393d2d"
 SRC_URI[portable-atomic-1.11.1.sha256sum] =3D "f84267b20a16ea918e43c6a8843=
3c2d54fa145c92a811b5b047ccbe153674483"
 SRC_URI[proc-macro2-1.0.103.sha256sum] =3D "5ee95bc4ef87b8d5ba32e8b7714ccc=
834865276eab0aed5c9958d00ec45f49e8"
-SRC_URI[pyo3-0.29.0.sha256sum] =3D "cd274650b21d4bfc26a0a47587962c1edb425f=
69287324355cd040c3ea66071c"
-SRC_URI[pyo3-build-config-0.29.0.sha256sum] =3D "c5e2a7d2f0d013342f295c048=
ad19237add5154a55b1c5a254c0ec93d4109078"
-SRC_URI[pyo3-ffi-0.29.0.sha256sum] =3D "ca85c467da1bbc8d866eea5deff9cf29ea=
5f7785054a17da36e65bda9c05845b"
-SRC_URI[pyo3-macros-0.29.0.sha256sum] =3D "9ac53762fd065daa3194dd09337a38b=
d793a188100fd1a9304c4ab312d901771"
-SRC_URI[pyo3-macros-backend-0.29.0.sha256sum] =3D "4ca3a1557399783172dc5bf=
39cfca835157732532cba56b71d2292161e53b362"
+SRC_URI[pyo3-0.29.3.sha256sum] =3D "700d18fa267b73b9b521fd7e13580e2f446916=
f176cacee1ab63fcc8191f1655"
+SRC_URI[pyo3-build-config-0.29.3.sha256sum] =3D "7b3fc0c4d08f6bb10e71fe39d=
fb9e2f59c6eb6854e22ec8092f50c69a4499adb"
+SRC_URI[pyo3-ffi-0.29.3.sha256sum] =3D "dfc0b8e19df29aad7086cf977bb0c2a2f1=
43e30567eb113e9cf72b62ca698330"
+SRC_URI[pyo3-macros-0.29.3.sha256sum] =3D "6100e8a4b5eba53afaa5ed078364851=
a0b2499c553a44c31026b929049b49dc6"
+SRC_URI[pyo3-macros-backend-0.29.3.sha256sum] =3D "6143877a16e82b5a727b712=
7ff4cd86858a24a28d745d72f43e6f227c7b1bdb3"
 SRC_URI[quote-1.0.42.sha256sum] =3D "a338cc41d27e6cc6dce6cefc13a0729dfbb81=
c262b1f519331575dd80ef3067f"
 SRC_URI[rpds-1.2.1.sha256sum] =3D "e025feb26210bc196b908e72deb063b1b400075=
4304341cbc168a1e72c857ebc"
 SRC_URI[smallvec-1.15.1.sha256sum] =3D "67b1b7a3b5fe4f1376887184045fcf45c6=
9e92af734b7aaddc05fb777b6fbd03"
 SRC_URI[syn-2.0.111.sha256sum] =3D "390cc9a294ab71bdb1aa2e99d13be9c753cd2d=
7bd6560c77118597410c4d2e87"
 SRC_URI[target-lexicon-0.13.3.sha256sum] =3D "df7f62577c25e07834649fc3b39f=
afdc597c0a3527dc1c60129201ccfcbaa50c"
-SRC_URI[triomphe-0.1.15.sha256sum] =3D "dd69c5aa8f924c7519d6372789a74eac5b=
94fb0f8fcf0d4a97eb0bfc3e785f39"
+SRC_URI[triomphe-0.1.16.sha256sum] =3D "b40688ea6389c8171614b25491f71d4a27=
946e0c7ce2da1c6de27e25abf1a0ae"
 SRC_URI[unicode-ident-1.0.22.sha256sum] =3D "9312f7c4f6ff9069b165498234ce8=
be658059c6728633667c526e27dc2cf1df5"
diff --git a/meta/recipes-devtools/python/python3-rpds-py_2026.6.3.bb b/met=
a/recipes-devtools/python/python3-rpds-py_2026.9.1.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-rpds-py_2026.6.3.bb
rename to meta/recipes-devtools/python/python3-rpds-py_2026.9.1.bb
index 68d13ccb96..d896e28042 100644
--- a/meta/recipes-devtools/python/python3-rpds-py_2026.6.3.bb
+++ b/meta/recipes-devtools/python/python3-rpds-py_2026.9.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE =3D "https://pypi.org/project/rpds-py/"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7767fa537c4596c54141f32882c4a98=
4"
=20
-SRC_URI[sha256sum] =3D "1cebd1337c242e4ec2293e541f712b2da849b29f48f0c29368=
4b71c0632625d4"
+SRC_URI[sha256sum] =3D "4793ef7f78268b124b73fa933440f01d258bbae01de9fa53e9=
080c9ab0425a12"
=20
 require ${BPN}-crates.inc
=20

