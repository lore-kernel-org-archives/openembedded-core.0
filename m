Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35290C5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 14:14:55 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43549.1786112087657996731
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 07:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=zh1ELHk9;
 spf=pass (domain: est.tech, ip: 40.107.159.57, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bQheyzQJo9b/sALMRrrmGuL8Y0Rh9uZBIhK/LX8fPUGiUV3GqfCettZPXDYiLB1rjfn2lYGDEkCcpjJU0/2sZsHjxaMVIX2CaIA+4VMvV6zJcgnpSKjKmbWVGxxcbEecYaORzM03E0dMBzXCn03J+qhpNeYJ+UF1f6nIVm6VjF7PlJRY5K838yqWMQFK5pvExtTKvIVsfay5sXTTRm+R/+gz8CwE60I4je2kwslYUnDB8Ajcy7XWFzyxkVC8pRbasROWpNPthbzj5gieUNHo4qsAkBXAtaRfKFn904+1trSo5jokB+DBf7rVwq8zyKJ2G3mSCDZK/829h8BfvFAh2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+t2C7FeAlBQ4nZTRDsaayDGqZQztJE7hx9mWfzknnY=;
 b=tJoGqBgwF3kHczDf1fr7FQCzS2Mr/G/Yo/Wi0ps5A0ygsv16OqSzQ+eJ/qRyVvrjdO+Q0if5K9evSS/RtAae3C7SjTa/Ju13j/ciswsKPo6qkjkse7BdpROeBmT4v/4ucN4IWWQXARRye+xUcgy/jpmGgDfpPtEbRJ1RtHSyDgnuQfR5/ePIdL/3ixSASGMleHg5cH8FsOT9uZELKfwRSs+U7vVVylYM79i9+580rS6P3pQ24XXdiRvxCBnXosObl4B17qC0gHs19E/DQzw7RJaskVyoZh1LI3eRyXuKdIzmdRK+xUk6i6ooOiqX12ME3DvmM6Ou5imYaqGEATSyqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+t2C7FeAlBQ4nZTRDsaayDGqZQztJE7hx9mWfzknnY=;
 b=zh1ELHk9suEOQNuhYxiGUmNfmi7aBkfx6RgI9CwZJ5Ahlvxnsk1TnplnZxqNn5eWdGblP1ra+jg6N/PMvocBgrfZ2v3SlQw7Kx99rA+XxVHGvpm8iBeZa7jXCaXLG+dlTgHEyMciaeBMVZNSuzjrBcVBr9wno55WV5AiJmwutlIh47cnKTyX6p+aHFM8lVvZeGXrt8ptulPmERuZMMn3b9K8P+CJMz1AR64HhctfTmLvOqZXLai0G/7Hk2BK8PUmI0r6zzsldlZk08R1+9kg3vubaAbRTJf/0HHVDRrKiTc4/vyF6yXEh4gS0BjmSHAEaxCWqR4fO2Ji61WwtM/djQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GVXP189MB3445.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2aa::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.5; Fri, 7 Aug 2026
 14:14:40 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.013; Fri, 7 Aug 2026
 14:14:40 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH] python3-hypothesis: upgrade 6.155.7 -> 6.165.2
Date: Fri,  7 Aug 2026 16:14:35 +0200
Message-ID: <20260807141435.5448-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0392.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::19) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GVXP189MB3445:EE_
X-MS-Office365-Filtering-Correlation-Id: a17c2532-5a9a-4e1d-4cdf-08def48e38b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|6133799003|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	lydpmhZG08L2fZa+wW8mliMKrMgDSSBQTNmCrGIs7BGdIZ77UHlUw3c5baQJYRMSjN4cIIvmHmxtZbTwL8XcQw+BvL5wvMJYxPTPyealLWzEtXsmbKPg6GO3+GpmYNk28XQmRqXyRjwtD2ibFnIpbMfck/ye4r3DWKqrNmbmH10R/8W97UsRf1Xcep0rsDjpoO7kzRg3dbz0RgiWVta2eUppN8mu/PKqR+3Kp4kvheAofF4rZmWv6wwmpeke17jHlR9ksiXHvoCfdgRDnbyPoG7VQG53VdSAIN0MFJH94ucvnSBTGfYHYnIp+a0YxUbbqvH3FYA5fpp1E78eNOxQKbDyboUR/m/KRA+cLeyRI5k220wR0f+/SUgdr1Hcqtn74pK/Tc8t+jBnTsp4HtDpqT07SMgxsIV0+/rGxRzockw6bAx6xOwFKE/K6zkppMTJfnkP3ETGpien1klX19SIGDdSASmQjmC26eX16FzXmyNocrAsI1XwmdFEFbBTvmwz5WuPT9I/suIrwGCYupcHkPxrB42thFmF2Ig1GonkCAWqkgKbGn4MuKSFR5zKJHb/JttovHGtGFPup644oWrNV+23zfJGgwblaqjp+Ik3J1Zz5wCQr7MQ7xp8F/8sH/p4tcG6/66ii9grtyxbVJtRF5pVFzLE/7zds2J3Momp2y4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4rgpk7DCZq6FtchRLktZOpOpezUzuHXzwhBeaC7FccwtmBWel4Mx399Jfwo6?=
 =?us-ascii?Q?ykHQFu4seXVQDzHGbI/rNLwNDJlF8Whx8QaNB0qH1FfVf35U5osTMT7W0YYx?=
 =?us-ascii?Q?FEoeI3JOOVp44Ufonsv7BD/iDY3wmw+QIQ5IOD1FKctN5WaXwj1/kCeK1fRz?=
 =?us-ascii?Q?0pNL6h/CthxlVLuyJ9TOmvCDo1ZPbzdRUBOQ+IjsBxb+yZLdN1tTsqNFXZKW?=
 =?us-ascii?Q?OKQD6+L4FWAbZ3QUomrWf4qjK1gJDfUUuk7nH6KkNH98fLOyMIhgbF3YMHDA?=
 =?us-ascii?Q?ThWvsYSVlT+FFpsjpUEHfWnXttjCaiXcckR12U7nZc5vr2RHnwDsLwRaNS22?=
 =?us-ascii?Q?w8YGvbmOxg9IyaOCQESs71sBndbu3YhXasROccFlh8F7AaxTRkUXsdThoEDe?=
 =?us-ascii?Q?xiD4oCym9918JJkQNFmYdlfIeMIpNbHLA/gBwm1N/Gt2grqUiQ5+ugfgfy4j?=
 =?us-ascii?Q?npesAyCdgthIENE5+bO0IgfIRWUJI3tb7OVDqjsAW+ni3RZPQdHtfKp0Ir18?=
 =?us-ascii?Q?DoEEo3PAX+EV4tyaXSdonN0BYW7eTIpSun2EW6dZDvGdkiEYC/0cBjHtPKfR?=
 =?us-ascii?Q?JAcERif/T3jcBbjMIpkx2SsFn+S/xgxSF0tu1pHVbys6y6Aor3VvMW+R92Qy?=
 =?us-ascii?Q?M7TlUwW4LXac/J59zat08R/l2G5iZ23fkuPligHr9wbLk6KCGLM5Snifi2kQ?=
 =?us-ascii?Q?TAGWKnIHlS3i5Q5FTc7I1dDKidhRTdkE7NnAph3bZgiV9DAvU1BkIbmYwaxq?=
 =?us-ascii?Q?ObQ/B3XSCFGwD4YPggNSPCR6vDLGZR2s3Kr1C1iG0A+zdo8aive4K49mv8Kw?=
 =?us-ascii?Q?VsJhk2LQWtHFD8BwH1kpbQsI+ZWQ1eeVAMyfhqLTv/5aEWQtmvwfLOOqTEUY?=
 =?us-ascii?Q?x1OoK1fFH6HOcm8r3Sxk9GnIby69RG817NZD0lKTzTqBGZUmBQ0mFDcgPio9?=
 =?us-ascii?Q?/XStY94k5519S1jKF3+6GYU3Jev9C35e4Go1NrZrY9l85Ra4wMH3SMtig0Rr?=
 =?us-ascii?Q?WQ3wP7dY8Oc4iDYLpNEJZtT6mtm0eq6HRPkDvEX4mwxzO6w3JLxNenaPOeCH?=
 =?us-ascii?Q?YAc763rJIJoWOa7Q45FuyXTuB7BaXYY8gdWYjzW5Myu965N19rS2CWV2N8qz?=
 =?us-ascii?Q?wduSonIhgm8Advd0fkdv/IazAb3PvYAoeBaIFT+o+dcInC3VKAbcZTz4a1ts?=
 =?us-ascii?Q?OPd3iEyVk9RPxgv36zY15UjDLjRsH3BYBLjeWhDC51NX7S+zGXwRoKtpW+ep?=
 =?us-ascii?Q?uty5jN51PUHv/WGi3fV8vun2mCvhqblAKcinMff7R7RKluI4iN42Xbl1bfS8?=
 =?us-ascii?Q?eHASPIxX5CzteeFOLqN+RIkx9HVaa3eYHOU5cHKAEIZLw2g+GK44koyZvlK3?=
 =?us-ascii?Q?XfVi0kdDTswiH3ANyDWMS8o6oZVmRosTs9ck6pQ/zFrziU9aQ3HhupgOaQE8?=
 =?us-ascii?Q?ALCfytY0miDs5fuoFvLCWAQrZ5lER7ipi/ibnbcMT+O//ZnUiqq1S/6243CY?=
 =?us-ascii?Q?TZyqavfvjn2nz0LV2jl781rXLW4k6QZfAPjfhROJOWpxbO3Y/M/26roo/Wc1?=
 =?us-ascii?Q?9BqTMNWULO4QNQPQuhpOuzq6+eNOXpnDHAIs4diJcnqmZJLBrjALjGpo6Mka?=
 =?us-ascii?Q?IGOLsFACJpOQoSGQMalsDLZFz1+FUHJDuArVNxr7RM3GSYCZJJ0lpvskUwTR?=
 =?us-ascii?Q?msmwOUcn8Ju2VRKP8Oi3TqlWy4RQ2nWyfkf075TxX7WOOKOXi5ehCDeN3z9X?=
 =?us-ascii?Q?Sbr/un8zAw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a17c2532-5a9a-4e1d-4cdf-08def48e38b9
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 14:14:40.8523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9yHLW+Z9GNnwCtVFkxVHjXS2bnU8CNDtKbBlL8A1aOO6RyHtjIDRt5KIwVBAhHV86CgGFInfedJaltBQFqbCCNZPgUQzvXaRmc/99KF/Q3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB3445
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 14:14:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243013

Since version 6.156.0, upstream migrated the build system from setuptools
to maturin, introducing a Rust extension via PyO3.

Switch to python_maturin class and add crates.inc for Rust dependencies.

Release info:
https://hypothesis.readthedocs.io/en/latest/changelog.html#v6-165-2

Compare log: https://github.com/HypothesisWorks/hypothesis/compare/v6.155.7=
...v6.165.2

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../python/python3-hypothesis-crates.inc      | 60 +++++++++++++++++++
 ...155.7.bb =3D> python3-hypothesis_6.165.2.bb} |  8 ++-
 2 files changed, 66 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-hypothesis-crates.=
inc
 rename meta/recipes-devtools/python/{python3-hypothesis_6.155.7.bb =3D> py=
thon3-hypothesis_6.165.2.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis-crates.inc b/m=
eta/recipes-devtools/python/python3-hypothesis-crates.inc
new file mode 100644
index 0000000000..efce454843
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-hypothesis-crates.inc
@@ -0,0 +1,60 @@
+# Autogenerated with 'bitbake -c update_crates python3-hypothesis'
+
+# from rust/Cargo.lock
+SRC_URI +=3D " \
+    crate://crates.io/cfg-if/1.0.4 \
+    crate://crates.io/crunchy/0.2.4 \
+    crate://crates.io/getrandom/0.3.4 \
+    crate://crates.io/half/2.7.1 \
+    crate://crates.io/heck/0.5.0 \
+    crate://crates.io/libc/0.2.186 \
+    crate://crates.io/once_cell/1.21.4 \
+    crate://crates.io/portable-atomic/1.13.1 \
+    crate://crates.io/ppv-lite86/0.2.21 \
+    crate://crates.io/proc-macro2/1.0.106 \
+    crate://crates.io/pyo3/0.29.0 \
+    crate://crates.io/pyo3-build-config/0.29.0 \
+    crate://crates.io/pyo3-ffi/0.29.0 \
+    crate://crates.io/pyo3-macros/0.29.0 \
+    crate://crates.io/pyo3-macros-backend/0.29.0 \
+    crate://crates.io/quote/1.0.46 \
+    crate://crates.io/r-efi/5.3.0 \
+    crate://crates.io/rand/0.9.4 \
+    crate://crates.io/rand_chacha/0.9.0 \
+    crate://crates.io/rand_core/0.9.5 \
+    crate://crates.io/syn/2.0.118 \
+    crate://crates.io/target-lexicon/0.13.5 \
+    crate://crates.io/unicode-ident/1.0.24 \
+    crate://crates.io/wasip2/1.0.4+wasi-0.2.12 \
+    crate://crates.io/wit-bindgen/0.57.1 \
+    crate://crates.io/zerocopy/0.8.53 \
+    crate://crates.io/zerocopy-derive/0.8.53 \
+"
+
+SRC_URI[cfg-if-1.0.4.sha256sum] =3D "9330f8b2ff13f34540b44e946ef3511182572=
7b38d33286ef986142615121801"
+SRC_URI[crunchy-0.2.4.sha256sum] =3D "460fbee9c2c2f33933d720630a6a0bac33ba=
7053db5344fac858d4b8952d77d5"
+SRC_URI[getrandom-0.3.4.sha256sum] =3D "899def5c37c4fd7b2664648c28120ecec1=
38e4d395b459e5ca34f9cce2dd77fd"
+SRC_URI[half-2.7.1.sha256sum] =3D "6ea2d84b969582b4b1864a92dc5d27cd2b77b62=
2a8d79306834f1be5ba20d84b"
+SRC_URI[heck-0.5.0.sha256sum] =3D "2304e00983f87ffb38b55b444b5e3b60a884b5d=
30c0fca7d82fe33449bbe55ea"
+SRC_URI[libc-0.2.186.sha256sum] =3D "68ab91017fe16c622486840e4c83c9a37afef=
f978bd239b5293d61ece587de66"
+SRC_URI[once_cell-1.21.4.sha256sum] =3D "9f7c3e4beb33f85d45ae3e3a179218570=
6c8e16d043238c593331cc7cd313b50"
+SRC_URI[portable-atomic-1.13.1.sha256sum] =3D "c33a9471896f1c69cecef8d20cb=
e2f7accd12527ce60845ff44c153bb2a21b49"
+SRC_URI[ppv-lite86-0.2.21.sha256sum] =3D "85eae3c4ed2f50dcfe72643da4befc30=
deadb458a9b590d720cde2f2b1e97da9"
+SRC_URI[proc-macro2-1.0.106.sha256sum] =3D "8fd00f0bb2e90d81d1044c2b32617f=
68fcb9fa3bb7640c23e9c748e53fb30934"
+SRC_URI[pyo3-0.29.0.sha256sum] =3D "cd274650b21d4bfc26a0a47587962c1edb425f=
69287324355cd040c3ea66071c"
+SRC_URI[pyo3-build-config-0.29.0.sha256sum] =3D "c5e2a7d2f0d013342f295c048=
ad19237add5154a55b1c5a254c0ec93d4109078"
+SRC_URI[pyo3-ffi-0.29.0.sha256sum] =3D "ca85c467da1bbc8d866eea5deff9cf29ea=
5f7785054a17da36e65bda9c05845b"
+SRC_URI[pyo3-macros-0.29.0.sha256sum] =3D "9ac53762fd065daa3194dd09337a38b=
d793a188100fd1a9304c4ab312d901771"
+SRC_URI[pyo3-macros-backend-0.29.0.sha256sum] =3D "4ca3a1557399783172dc5bf=
39cfca835157732532cba56b71d2292161e53b362"
+SRC_URI[quote-1.0.46.sha256sum] =3D "dfbc457d0c7a0759a614551b11a6409e5951f=
6c7537be1f1b7682b9ae9230368"
+SRC_URI[r-efi-5.3.0.sha256sum] =3D "69cdb34c158ceb288df11e18b4bd39de994f66=
57d83847bdffdbd7f346754b0f"
+SRC_URI[rand-0.9.4.sha256sum] =3D "44c5af06bb1b7d3216d91932aed5265164bf384=
dc89cd6ba05cf59a35f5f76ea"
+SRC_URI[rand_chacha-0.9.0.sha256sum] =3D "d3022b5f1df60f26e1ffddd6c66e8aa1=
5de382ae63b3a0c1bfc0e4d3e3f325cb"
+SRC_URI[rand_core-0.9.5.sha256sum] =3D "76afc826de14238e6e8c374ddcc1fa19e3=
74fd8dd986b0d2af0d02377261d83c"
+SRC_URI[syn-2.0.118.sha256sum] =3D "1b9ae57f904213ebb649ce6895b8a66c66f020=
3b9319718f69a5612a065b1422"
+SRC_URI[target-lexicon-0.13.5.sha256sum] =3D "adb6935a6f5c20170eeceb1a3835=
a49e12e19d792f6dd344ccc76a985ca5a6ca"
+SRC_URI[unicode-ident-1.0.24.sha256sum] =3D "e6e4313cd5fcd3dad5cafa179702e=
2b244f760991f45397d14d4ebf38247da75"
+SRC_URI[wasip2-1.0.4+wasi-0.2.12.sha256sum] =3D "b67efb37e106e55ce722a510d=
6b5f9c17f083e5fc79afc2badeb12cc313d9487"
+SRC_URI[wit-bindgen-0.57.1.sha256sum] =3D "1ebf944e87a7c253233ad6766e082e3=
cd714b5d03812acc24c318f549614536e"
+SRC_URI[zerocopy-0.8.53.sha256sum] =3D "75726053136156d419e285b9b7eddaaea9=
e3fea6ce32eed44a89901f0bd98de1"
+SRC_URI[zerocopy-derive-0.8.53.sha256sum] =3D "4714fd92cf900833d49538023a9=
b3915155210801d1c1169eba513b2addefd71"
diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.155.7.bb b/m=
eta/recipes-devtools/python/python3-hypothesis_6.165.2.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-hypothesis_6.155.7.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.165.2.bb
index 70ae7877a1..0776519a10 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.155.7.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.165.2.bb
@@ -6,14 +6,18 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D4ee62c16eb=
d0f4f99d906f36b7de8c3c"
 PYPI_PACKAGE =3D "hypothesis"
 PTEST_PYTEST_DIR ?=3D "examples"
=20
-inherit pypi python_setuptools_build_meta ptest-python-pytest
+require ${BPN}-crates.inc
+
+inherit pypi cargo-update-recipe-crates python_maturin ptest-python-pytest
+
+CARGO_SRC_DIR =3D "rust"
=20
 SRC_URI +=3D " \
     file://test_binary_search.py \
     file://test_rle.py \
     "
=20
-SRC_URI[sha256sum] =3D "d8d6091753d0669db3c90c5e5b346cb37c72f3dd9378c8413a=
cb1fd5da63f7ea"
+SRC_URI[sha256sum] =3D "680a1adf523ac792b46064f425b112ce6c08a7a8f50e65d08e=
029de6aa11df95"
=20
 RDEPENDS:${PN} +=3D " \
     python3-attrs \

