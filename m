Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E95CC6B3A
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 16:17:10 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1031.1792081029646016734
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 09:17:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=cFbmV0FI;
 spf=pass (domain: est.tech, ip: 52.101.69.32, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ap34a+Vmu71Bc8HRw7knMAr1zfitbavpuU7jGYy3NgHp1QjsaK+j/WCe2TPpE9EQLTv9JI0pN/q+2BSCgcLqW7VHYhBhR3G0L0aXgErszc4eY/JwlELlt/IDbe873KnqKxAJaJisUBu7Q2GqN920W+bq3a370qudA4fAeBPRlk6MumnKXD5Dr7QVL2vSG/HucHMgqYQiWuNMrL0Bi8VIO/8dlrRMv/UMZusOBvRlArGKu7bNJ9H606T54XKjk4dMnRKMDvc8nGshEFiUEN1xZlXAWr7xf1xr3dnrmpHr5aIZUv2eWGOOVqVglJzzlZUxRpeN2NjqzyBOAi8III6HZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XO0/kwJraEd0PkLL5u4RuC2k7Nn8Elz+pXWE+aS8+Lo=;
 b=UiVkXVUrEKqhBXeZE39dEf+Yl77DpzK/D7gx8956y462B62etU+wHJ6U9nti1mzRqrKO1fZVYt0s5kqpK4DDcjgNR9AdQpN3oOwUmwXFRATTFd7MtpeQoP8tGC9f+hAaOp9NCNsYoVUZ4MLuG1eZAqJ5LD2YhIAylDUV8vNQJYwW2GkdGVDIMF4BICQbFx39u5It9RryqlUGNW88n17t4cN6KiRGbbK081OBP+7FJc3YNRaXgW/RzeL+DWo2mOus6fJHeBYUjla3EtvgcZEwZWd4KhtTwLUWskaPWhDyL4mjtTANl0jtuUD5s4sGJD3ZJ56woeYdzm11yeYVi7svSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XO0/kwJraEd0PkLL5u4RuC2k7Nn8Elz+pXWE+aS8+Lo=;
 b=cFbmV0FIyiXq4anO6hgqE8osPbLssHYY7txNkvpyWMOFNesKSqmu5PdUVfJ1g7vQVH/dXw8b/LJGPa+DYiYPm5AsJIIDYlPuWD3qrQnYY0A6UHVAXl+CQf2kYJH7b9ECONNxX2xECLXMuwr5SDP6w6Q9ipOwXU73PNFLmFejMULoxHHJ0GwQKcFybuPjxjmN0XnTcY3RDrVOY5rqphxVx1+gZI6IBuHrLS3DEn4rkDjWfOw4h7Z3kBQxcu+F5/xIydQwFowLC4isJTSNCvj9Y7CUExL6sGa0tvbioPXumW5mQLM5bejpyfRM6hNAS1FKLoaGo6XBb0AgrmKlZIRHHg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU2P189MB2585.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:49a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 16:17:05 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 16:17:05 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3] python3-more-itertools: upgrade 10.8.0 -> 11.1.0
Date: Thu, 15 Oct 2026 18:17:02 +0200
Message-ID: <20261015161702.75858-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261007055820.59633-5-jaipaul.cheernam@est.tech>
References: <20261007055820.59633-5-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P194CA0009.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:10:553::8) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU2P189MB2585:EE_
X-MS-Office365-Filtering-Correlation-Id: d7e385b5-93d4-4d50-c4e9-08df2ad7c0aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|6133799003|22082099003|260925021311599003|260925021911599003|260925022911599003|10067099003|18002099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	Exfn7CYBKpWOAGNoF2e17mG7I2EgCy49YHu0UBob/CY6HdcbtwZjYGnqvwvnLBhdZM9Sv1hWqrL3Osgw6sWzW6+yday4dMVWl2DR+vcHMHZItioWFJjHQ2YAE8TmDBNJ2Vok1KLghAj6AENd7nh6An/zxPLyUNcDhyivT2KiRkC894YJhDn+msZEGSNiSYiEclruaxq3Fi/DiEUUN5gl2qFBsRs2dvEXUfBRkHPQO9O9bZxFpZbF4G/pXwc8lrXUZJM+AyEvYboRfSHBd3CDS0Td8dJp9AUOFTQokzA5VVKVuyjaBUwTbqvH8dfxUVrUYfhC7CRrSMyfHdNCR2fncUGWojycobfUoXVOc3SxnJEH+ej2WvVIy5k7kPi9H6ypTp1JIWaGerYUDSmh92OWhNzAE5L+YHdNN4DGYg1zgqNPb81lXJ9Nxu9Jd5I4A9g/YJFknP8MeG0V51LqrsFiZnV6p1INPGAdJKNFIoFbBaRmZeK0JqUcNfb2NXNl92toJ9EGXHfOpspXqxTdoCJvPvdCQQIS47+BMyuPVE+Ac3IOk5ea+yOKXCGcynybbGM5zvRc7JvkbVOhC8c4uxkD34QHsgYr0NR2SdVdC0yIZOg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(6133799003)(22082099003)(260925021311599003)(260925021911599003)(260925022911599003)(10067099003)(18002099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?N/OysWWXCh7CwKP9M39+5XvtXa5DUln3Z/eADzgl+eCCO3BACANdijLfXn3c?=
 =?us-ascii?Q?ZOhJaXO2jQBq6p1I/V4NqIqCDgmMwkQY+vdgMCPag6Ri5BDDLaEJHUp/Rpui?=
 =?us-ascii?Q?0+wCref76YrVo89WjLvaKDk6AGAztniI6S1Np1Pj6Dy7E67Yx+cHH669UUm1?=
 =?us-ascii?Q?YRYZJGhrSeKnMidGZZKzQVO0ZdnJ5C2ycS8ftF1Mx9aWO1mYBxtnz2eVmvVU?=
 =?us-ascii?Q?WUgeFo+b0Yv12iwC/JcMM/2uvIjhvy9gowYEw4d/phJQtk5CmL3PtFDCU3Nz?=
 =?us-ascii?Q?fF8xgzyVn67irXfqCImGTmnQrHf8bEhUjKAI1fMDBfqrt6gg968ayN588fyZ?=
 =?us-ascii?Q?B0hmOGe2oFuO6URHtp27TDCjmxVU4bbiJzIzXfQOhAmKb5GAvEe76k1OVI0a?=
 =?us-ascii?Q?vaa4BDc16QB8q3qnQGWpc04r3LorCpmkrJeLI4FIYI3EwyWp2KkY8VQqcFR4?=
 =?us-ascii?Q?6q93ZDh+ybkCKSp6vVjmgYuQBDHnU+ItTRd8pYjPuEZF5Zh2hVOINmX6WcO9?=
 =?us-ascii?Q?iC9ZJgE5ZZJJb6rtCN6vB5InfpYONiXkZpVBVyMvgc9k601NqQYMrYg1VIO7?=
 =?us-ascii?Q?oA//t4lxSp0tICEZXmAWJA7EbQQ+PILqvPwFSkiMUT00SRBbWgxq5pTJ0Fmh?=
 =?us-ascii?Q?+bQrVzpkbxeuis1twL44QmeG37Apy5f+0EAP+/EnoBMB7cWDWQFR15JX++6L?=
 =?us-ascii?Q?rJEvFYAeSVnV3kIpE0jhf9G2aVrTZtDcpsY1Alr0FiVoS5fGWLCyI8gQlia2?=
 =?us-ascii?Q?K7PVzuhmh0qfXQHaUgtBKwinWALwqr0sDEUDOT2Ze1hm2piEc4tCktj9HSBK?=
 =?us-ascii?Q?3gR9DvfPu2Eb168ymfdnQOmPoFI6bcIzFDo/V5jYrH8JlN4utImUEar5V2j1?=
 =?us-ascii?Q?qXCMcNRfaxug0htDanItxeNgJ7VfSQ7h0NAxNiENL5tc5/LZkAa6Tp+V0B3+?=
 =?us-ascii?Q?OT4mLamWkUMz0Doq2+mTAjQdWxjTj1xxFV7s9vViwLQq8kbAMWM7HHwmLcyk?=
 =?us-ascii?Q?zMmQPAin5cUqrtfH8KT2oA9NTLt1erq9pQLb85QLH8z3CbY9J12BQf1bIiVO?=
 =?us-ascii?Q?q5xhyXe1EFl47DyAdT+ssuXO3s3Ux2NvXguEcUKFXdeRcSTRFFbqnjOpIOIu?=
 =?us-ascii?Q?TkElNgprZewbIFbon5hQcQHVSBdFcxqHjwMoY5dBYwEY2+9ofQwnM5C8Q3vH?=
 =?us-ascii?Q?K+e1owhK3vQWusz/hEmfetNKgYe9qF6h0j01VsbSTQC6Fl5Pfh0SDuXqDqMx?=
 =?us-ascii?Q?vLNvTcc6o1Bpuf0nEcOg/EFv0/r4tM6twy7imIeNyjZVPGMrxGB+nibY/JH6?=
 =?us-ascii?Q?1r2RygAy00sbyxw+Q2DWbPrkA6TUu3YE6DY/79/gj4W6OzwqmV+uFzrw41G5?=
 =?us-ascii?Q?QHlyDS2/qVUBMPfWvT1amUZGyV+0KmLBNdVSeW2rnHpvxL7y/eKXn9I2n+SA?=
 =?us-ascii?Q?b8L/6UBPbvphcYjCmBz4va5v6FtSAnN5Ke0l7jhb29nc7QNpZG4/3q1Cruj8?=
 =?us-ascii?Q?tVBXYHUhn7iYC0zOBTDJPpr66UEP+hrfkA994WTfd4lsVhqrWf1AerXAG7l2?=
 =?us-ascii?Q?fMRUImqcOhFjPohHgHHjFtpqVAUz3pswr4C9qY9Qb9klnwfVgNs/CeRgiZns?=
 =?us-ascii?Q?S6f60vCDtSDMK2MXQTmqDDOFv1A5CrbIuH/EWJx4qTZ3efIr/dN9xAFuoUru?=
 =?us-ascii?Q?/jKj5YUXiecmz0bffntnWqG00uPAAhADzzoWMLZcRFQihBr3omvfpEtJJClS?=
 =?us-ascii?Q?YQ6AEbOuf6/FgpGacSZjYilNLRB4rZ8=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e385b5-93d4-4d50-c4e9-08df2ad7c0aa
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 16:17:05.0654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xNuzNUiYTcURROAaoAnpl8AFcm7x7IpuMfD4zhU+1/zp8SVUYZqb61C0EkvaZoFOcefmjCAL1G/vikQ2GljarKYXkmA6m1ovrJnJFqYVkB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2P189MB2585
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 16:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247890

changeLog: https://more-itertools.readthedocs.io/en/stable/versions.html#id=
1

- deselects TestConcurrentTee.test_concurrent_consumers

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes since v2:
  - As agreed in review meeting, disable the test
Changes since v1:
   - TestConcurrentTee.test_concurrent_consumers test is test spins up 100 =
threads,
     each fully consuming an independent tee of a 100,000-element iterator,=
 with locking/synchronization between them.
     This values are hard coded, so either test case needs to deselect or t=
imeout needs to increase.
     So, I choose to increase timeout for riscv64/riscv32 rather than desle=
ct.=20
 .../recipes-devtools/python/python3-more-itertools/run-ptest | 5 +++++
 ...-itertools_10.8.0.bb =3D> python3-more-itertools_11.1.0.bb} | 4 +++-
 2 files changed, 8 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-more-itertools/run=
-ptest
 rename meta/recipes-devtools/python/{python3-more-itertools_10.8.0.bb =3D>=
 python3-more-itertools_11.1.0.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-more-itertools/run-ptest =
b/meta/recipes-devtools/python/python3-more-itertools/run-ptest
new file mode 100644
index 0000000000..b03a09d746
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-more-itertools/run-ptest
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+# test_concurrent_consumers is a 100-thread stress test that times out und=
er
+# qemu TCG emulation (~1700s on riscv), skip it
+pytest --automake -k 'not test_concurrent_consumers'
diff --git a/meta/recipes-devtools/python/python3-more-itertools_10.8.0.bb =
b/meta/recipes-devtools/python/python3-more-itertools_11.1.0.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-more-itertools_10.8.0.bb
rename to meta/recipes-devtools/python/python3-more-itertools_11.1.0.bb
index 053197ea5c..a291074daf 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_10.8.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_11.1.0.bb
@@ -3,7 +3,9 @@ HOMEPAGE =3D "https://github.com/erikrose/more-itertools"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3396ea30f9d21389d7857719816f83b=
5"
=20
-SRC_URI[sha256sum] =3D "f638ddf8a1a0d134181275fb5d58b086ead7c6a72429ad725c=
67503f13ba30bd"
+SRC_URI[sha256sum] =3D "48e8f4d9e7e5878571ecf6f2b4e57634f93cd474cc8cfbd237=
6f2d11b396e30d"
+
+SRC_URI +=3D "file://run-ptest"
=20
 inherit pypi python_flit_core ptest-python-pytest
=20

