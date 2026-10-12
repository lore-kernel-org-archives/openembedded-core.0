Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC654CA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 10:34:47 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10411.1791801280972509898
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 03:34:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Dg8ufREC;
 spf=pass (domain: est.tech, ip: 40.107.159.38, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jOAsODyxOuU/Ztx9GIFTpI5BVq6l/Dd2qwZAg+QCPiBYJ9s1vnvUQivCJI+G35GeBuVWV95FaucBuSz8jaGDH0sZoIe26wcgK3T0trTblRZKuZnseszx+L9pvaXR97+uRpa/A0q4tzZewmxZSzIeoH7XcO3c6NmJRsslq2RL65JMSxoK8D9h84uBkHlDLnhMNZBYMVVhd58NLJDXEp6Uq10a2EW7Wukdeffum3/pCS0eOYEOI1zhYEa8DqLpX0BepJ7ZeGTY8+b6koJxKpx5tNbc3kXdU8AqopZZI3Vr7aKtsb48xHhqSD5vKGjwEuQAXRBuoGUY8sIsZCYDSlmi1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekSIdVBnxx0z/lZUA5/kO05fzdqBq+y5KRUxoMDxEYk=;
 b=PZsPnPwOp5IFskyczl11MMgq8RZPQedi/HTQ9+q5EBQsDQtCgds4CHvpkcYc03khazFM00p+YoYAO45O5Vmx9ETLKXcp9P656G4q7rYGxSDyUOABnBvQxx9A+Apu4j2c/DCVgtjz70Sy7Vu9X/0FT+7Q+su6p8T2i7jaFcOaqc6EavCgj2F7b1ID9GkqjeSL5R5P8k1t5JDjqFZivIXtOiDQpWWk6OtXA5SymL+L1CXnxpwUNdSzryl5+svQSBUkNl+FfliRJRr4Nyasx4dmGsMNwSqYQOXCukh1VU67fzsqaFUnUuwcnE6eCZuZzHvuxz5LDPb4kzR3CAsldRRCcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekSIdVBnxx0z/lZUA5/kO05fzdqBq+y5KRUxoMDxEYk=;
 b=Dg8ufRECvRCb5K08fBsHjgkH7kEgvMhxfeBG9Q41A8tIN8GPmio1yT4V3VxaXRf2+vEuFTtHOhpYGrWceWK5sL9KhGYnrl8aQshy/D7WVItYZbzQHqp1egeevFxpggSLbtgQfqpqfgCPiwJJoR+gj+uHl5K5QJH7AitjcBEtWRDyObZ8t8b0n/vqc8A2SSmmUdoVcvHfLHXYwfDOMPrHrRWfxU/GMv7YsUIT4wjrLZehR0ZG44Qttirwl/9N5EaNm8u36FocW2GEeyJo/owB776f/e3b76liLpoyvuoTq1A07iKd/5JPG3sSkoTrJGPXDgMEw3XI1T/npMcK3JSFuQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PRAP189MB1898.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:291::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.18; Mon, 12 Oct
 2026 10:34:35 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 10:34:35 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] python3: upgrade 3.14.7 -> 3.15.0
Date: Mon, 12 Oct 2026 12:34:26 +0200
Message-ID: <20261012103426.3090-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012103426.3090-1-jaipaul.cheernam@est.tech>
References: <20261012103426.3090-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0174.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::17) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PRAP189MB1898:EE_
X-MS-Office365-Filtering-Correlation-Id: 38c76641-d5f0-47f1-5ee8-08df284c68cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|6133799003|261009223327099003|25016099003|12006099003|29003799003|22082099003|18002099003|10067099003|3023799007|261009223027099003|261009220027099003|261009221727099003|261009221227099003|56012099006|11063799006|260925021911599003|260925022911599003|260925021311599003;
X-Microsoft-Antispam-Message-Info: 
	joS76uj6l9t0GrfXOZ1AVWsLV60kSzEtPsbDbnn/nXV4IgVZYFJss03fE4klLGwIKaqCjmJBe7/+7D48FuoJxGw0B92yAJ8xcFocb3LWLrHS1GZxD83G5jR77TGXqkKnpK//Wwx2dXP3kKfLoBuLx8voHu06/K2qjd9FXopun9ZFKv0JyrTW2Vp4YMvUSjhY2E0OYgHCDfVpa/R2DkcnSElpvTDLGmaY91IWeY0X/EH+NzEraWNxyEghxRzSS/31JVKONa42twN+qsQOA/Pai/yPSFkidhFiZBLvPyG23lSIx3G/6VpJWXpA2Se8Rw1B6lQzHhtRLjCDp3pFVo2dFnAxThklWnnvUgmQ6Gz/lT75QzKJJ+d9fh+YwQg79MrX4EBIpbtPKC2nf0R0XrVYr/QqBHUlJwBene062gwKa7kuWo8uplQLBFXL17haTEpXYMi7eBqFoxTex1PTyCIQ/trZ8TVnkWHLfHknA0CErCYv6KJerUirXQo6LLuPSLf8r/DO9YJCSM21terr5gPZLXW2+WQVRnFp/l9qHS18ylpBpR3D0VS+q9lxa9bKBJXy08e2fuacSN0B680FvqWTEfrMrGvXSTE5pFWbZfaGQub86VXjfwc9qCFgwDaGPYMdt5VoDQDIFmwEWLfWKHZMxcPyhc1jwnY7/FU06TwGJ7E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(261009223327099003)(25016099003)(12006099003)(29003799003)(22082099003)(18002099003)(10067099003)(3023799007)(261009223027099003)(261009220027099003)(261009221727099003)(261009221227099003)(56012099006)(11063799006)(260925021911599003)(260925022911599003)(260925021311599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?o+/QJc4OmxFXPwOsee7WfDgIfjvbb3FkZMoZ538wHlqsyoPWxKc0TU3VEoiH?=
 =?us-ascii?Q?WBJJ7JdgqMl+7eTKTPD31eRYj25TS9x/DQtx0IsddhQoOVpbccZCJ/+e5wYC?=
 =?us-ascii?Q?6aws0bm86Zp1emYNur3EOF0OUUXw1Tv8Q4n1lMt2foj7PHZjVj6X/D5EZSBm?=
 =?us-ascii?Q?tvhBjYsZQaouULNqy+SZv5VlDg63sgZwPj262ga5KryWlCSLSQCOA8WjyWQU?=
 =?us-ascii?Q?9qCXkFL2Gw4CnnISF/ooHvHT0NZYe9oOepTlnUlkgkk8ygvU/Bq1kIiyxZfi?=
 =?us-ascii?Q?ZjrWiB5z86Wtu2g7HOrJJrXawqeQcfT2E5745vX4H2HvSSQwp6ICEhP1t2ud?=
 =?us-ascii?Q?SdEA3edLJZCgr1hqAxvtpiYirYr1OMro0MoFn3IR0vB5RkGTBI9cyZxrDncE?=
 =?us-ascii?Q?hW91I8OL1N3nUnb93Ui1z1MTWrpM5lfZdyFX13/VBQLDHcxm+p9xuPXg1IUN?=
 =?us-ascii?Q?8Wq9mz6JwoTS0Af62jlEkbiYQqcYW5/5eu14bzMOda6LWdProIMiVJZOwuWm?=
 =?us-ascii?Q?UBcUKGwErR6KdvmaCFpWrOkwqexoxbERCCawceEnji2iGsPgzAthuYUboL9U?=
 =?us-ascii?Q?OPlnEdq8r5JkO04uNYbn2NRLTSn+K2A8Nyw5GRMAbA1GLd6w1AbubCsHcDLG?=
 =?us-ascii?Q?etXf3zmYy5xW82sHpfQNrpfJFaclVVjBISFW2jPWzym8fSWZTqpZebVAlraa?=
 =?us-ascii?Q?ZGARoFzRQKprzXYIFvBdBlnc34oREYYQFXHNtWz9eroQDF3to+bg1OzXLn07?=
 =?us-ascii?Q?nAxJXkLbXIZQ5BYVXYMEjPLz3hq45cVJnCz9X8D3Rz5qR5SBimMAQlskoOAF?=
 =?us-ascii?Q?e9lrOjQxM/WzeOoGdRjgwlsSuIEM4aflIKxU1bOIdMcBhKRGRLDIUs7aGxng?=
 =?us-ascii?Q?KmjnovtHL437ieUnf6qWEW9HpS0zWuRa7fZDvGHAR7BCdSniAwavFMlrPVV/?=
 =?us-ascii?Q?GkVuwNwGZE8ukPzdTk0GmlnZNyIT8E0PfQjWGT+9tBsbYjrW6lqyH2qKMjax?=
 =?us-ascii?Q?xDCq9mwhW/PCnIVa8bm6JnJ2CfJFl4iVabam/gZLHnEUEewwUR3KTN8+0h/K?=
 =?us-ascii?Q?BsjeBu/r1GRj+vZgqLTGCNcFwt56DgbPoyajtpCrAM8IdGHShXlgG+PGo/Wt?=
 =?us-ascii?Q?ygfOLxCa/+wenU+7aI+VcuHQrItz3LZq70wm7Ul6wKzwo/ZysEe3qmx7MiPN?=
 =?us-ascii?Q?qze4Hjx/BLmhoSKWFIE30nAcu9+TwP8LmVesyPApbQAGmlZJdWgXOH/+Ex92?=
 =?us-ascii?Q?Hl73YZldmXckMapawvG66m6cLPfEhvR7tY1fJ6ZpBZ6tPFgJQvHXPCOo61KH?=
 =?us-ascii?Q?2oFeQC1k2um1ht1q/3IlcmD2vIYFSy7FAX+MDuAqsDcYAwimAPkGDBCZAj58?=
 =?us-ascii?Q?tioI0kwZXi4Y52oyGiQ9EqBbl3enAj6ogWgCswTFqQDDTs1wfvUh9fQn3G8s?=
 =?us-ascii?Q?nVkiwH307s/H865+AeKRdxNawMsfGmGsXnGABmch+UWIwc3yvMD5uudFXUas?=
 =?us-ascii?Q?3XrM6wleztTCRPtmhkv6ZV19jQylDcEbvKZtN1xjSQ+RLBvUt3etDkk6u+CZ?=
 =?us-ascii?Q?f7YfzwF84zMk1Ug++WAx4wgvMZa//mSDJVRZ1OzBEUnp0cbPSco1zkl+dQwF?=
 =?us-ascii?Q?ORGXC47xyopbbH7JfXbY5EQNhnDfA/SCXb/xZaKdcquIggOBPcHKRq7s19gc?=
 =?us-ascii?Q?Fw8iBJF132W6y22b2LdpmqexmR4UQQL2jNIdmgwXJTHV1wqDuYhaT4anME8k?=
 =?us-ascii?Q?HDOrmXTjEg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c76641-d5f0-47f1-5ee8-08df284c68cd
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 10:34:35.2635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AU6P3CldkcSUzGMlQQNuGoHIXhoOAAbsiKzIAFJc1PY3RhlHG6C/etrp7vwdv1YUnsobL3NWwdxPsTb5L2ykEtba54xnboCTewwYTFP7cBE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP189MB1898
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 10:34:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247627

ReleaseNotes: https://docs.python.org/3/whatsnew/changelog.html#python-3-15=
-0-final

- Drop patches which are part of upstream release
  - 0001-gh-146207-Add-support-for-OpenSSL-4.0.0.patch
  - 0002-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.patch
  - 0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_got_eof.patch
  - valid-dists.patch
- Add mpdecimal dependency and --with-system-libmpdec configure option
- Bump PYTHON_BASEVERSION to 3.15 in python3-dir.bbclass
- Update python3-manifest
- Refresh existing patches

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes since v1:
 - Update python3-manifest

 meta/classes-recipe/python3-dir.bbclass       |   2 +-
 ...shebang-overflow-on-python-config.py.patch |   2 +-
 ...e-stdin-I-O-errors-same-way-as-maste.patch |   2 +-
 ...-use-prefix-value-from-build-configu.patch |   2 +-
 ...-qemu-wrapper-when-gathering-profile.patch |   2 +-
 ...est_sysconfig-for-posix_user-purelib.patch |   2 +-
 ...146207-Add-support-for-OpenSSL-4.0.0.patch | 257 ------------------
 .../0001-prefer-valid-entrypoints.patch       |   2 +-
 ...g.py-use-platlibdir-also-for-purelib.patch |   2 +-
 ...le.py-correct-the-test-output-format.patch |   2 +-
 ...Update-_ssl._SSLSocket-for-OpenSSL-4.patch | 234 ----------------
 ...utdown-test-in-test_ssl.test_got_eof.patch |  41 ---
 .../python/python3/makerace.patch             |   2 +-
 .../python/python3/python3-manifest.json      | 199 +++++---------
 .../python/python3/valid-dists.patch          | 164 -----------
 .../{python3_3.14.7.bb =3D> python3_3.15.0.bb}  |  11 +-
 16 files changed, 87 insertions(+), 839 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-gh-146207-Add=
-support-for-OpenSSL-4.0.0.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0002-gh-148292-Upd=
ate-_ssl._SSLSocket-for-OpenSSL-4.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0003-gh-148292-Rem=
ove-shutdown-test-in-test_ssl.test_got_eof.patch
 delete mode 100644 meta/recipes-devtools/python/python3/valid-dists.patch
 rename meta/recipes-devtools/python/{python3_3.14.7.bb =3D> python3_3.15.0=
.bb} (98%)

diff --git a/meta/classes-recipe/python3-dir.bbclass b/meta/classes-recipe/=
python3-dir.bbclass
index 3eb0dea9b2..b26621f365 100644
--- a/meta/classes-recipe/python3-dir.bbclass
+++ b/meta/classes-recipe/python3-dir.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
=20
-PYTHON_BASEVERSION =3D "3.14"
+PYTHON_BASEVERSION =3D "3.15"
 PYTHON_ABI =3D ""
 PYTHON_DIR =3D "python${PYTHON_BASEVERSION}"
 PYTHON_PN =3D "python3"
diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overfl=
ow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Av=
oid-shebang-overflow-on-python-config.py.patch
index 7a60538364..47ac29f209 100644
--- a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-p=
ython-config.py.patch
+++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-p=
ython-config.py.patch
@@ -1,4 +1,4 @@
-From 3f2df0e1fce8c7425998dade00d084f1b101a982 Mon Sep 17 00:00:00 2001
+From b19edb306e2c035536a904c82c2fb4b18f529cf2 Mon Sep 17 00:00:00 2001
 From: Paulo Neves <ptsneves@gmail.com>
 Date: Tue, 7 Jun 2022 16:16:41 +0200
 Subject: [PATCH] Avoid shebang overflow on python-config.py
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-st=
din-I-O-errors-same-way-as-maste.patch b/meta/recipes-devtools/python/pytho=
n3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
index 532adfe69a..cc2fdf4bb8 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O=
-errors-same-way-as-maste.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O=
-errors-same-way-as-maste.patch
@@ -1,4 +1,4 @@
-From 9cd44429215352eb2753e0fd8e25fef24f714006 Mon Sep 17 00:00:00 2001
+From cb744d2ccf74d5ef21fa496a418d2963df28a38f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 16 Sep 2021 16:35:37 +0200
 Subject: [PATCH] Lib/pty.py: handle stdin I/O errors same way as master I/=
O
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use=
-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/pytho=
n3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index 60391e726b..0fce0fc027 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix=
-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix=
-value-from-build-configu.patch
@@ -1,4 +1,4 @@
-From b5aad6a9b6c5add7a85861aed8aa030c1ad3d52f Mon Sep 17 00:00:00 2001
+From 5bd6a3c5f957cacdf51e07ae94c74fbf6e7f0f28 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 17 Nov 2023 14:26:32 +0100
 Subject: [PATCH] Lib/sysconfig.py: use prefix value from build configurati=
on
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qem=
u-wrapper-when-gathering-profile.patch b/meta/recipes-devtools/python/pytho=
n3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
index c7f14cad1e..d83d00e0cf 100644
--- a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapp=
er-when-gathering-profile.patch
+++ b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapp=
er-when-gathering-profile.patch
@@ -1,4 +1,4 @@
-From d6f77e3a934616d1f6c083b7144c50a32e08b70a Mon Sep 17 00:00:00 2001
+From 64a42f1a618be7af4e5d31ffbeeb4169bad865a9 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 30 Jan 2019 12:41:04 +0100
 Subject: [PATCH] Makefile.pre: use qemu wrapper when gathering profile dat=
a
diff --git a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfi=
g-for-posix_user-purelib.patch b/meta/recipes-devtools/python/python3/0001-=
Update-test_sysconfig-for-posix_user-purelib.patch
index 5509b7475a..95d7e4bd07 100644
--- a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-p=
osix_user-purelib.patch
+++ b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-p=
osix_user-purelib.patch
@@ -1,4 +1,4 @@
-From c608cb4b3c8c31f1aa25ad1264ff58733fb99769 Mon Sep 17 00:00:00 2001
+From 2cca08e2cb4be0a725c4c9ea76234bfea5a8534c Mon Sep 17 00:00:00 2001
 From: Wentao Zhang <wentao.zhang@windriver.com>
 Date: Mon, 20 Mar 2023 13:39:52 +0800
 Subject: [PATCH] Update test_sysconfig for posix_user purelib
diff --git a/meta/recipes-devtools/python/python3/0001-gh-146207-Add-suppor=
t-for-OpenSSL-4.0.0.patch b/meta/recipes-devtools/python/python3/0001-gh-14=
6207-Add-support-for-OpenSSL-4.0.0.patch
deleted file mode 100644
index bef6044358..0000000000
--- a/meta/recipes-devtools/python/python3/0001-gh-146207-Add-support-for-O=
penSSL-4.0.0.patch
+++ /dev/null
@@ -1,257 +0,0 @@
-From 3364e7e62fa24d0e19133fb0f90b1c24ef1110c5 Mon Sep 17 00:00:00 2001
-From: Victor Stinner <vstinner@python.org>
-Date: Wed, 25 Mar 2026 07:44:47 +0100
-Subject: [PATCH] gh-146207: Add support for OpenSSL 4.0.0 alpha1 (#146217)
-
-OpenSSL 4.0.0 alpha1 removed these functions:
-
-* SSLv3_method()
-* TLSv1_method()
-* TLSv1_1_method()
-* TLSv1_2_method()
-
-Other changes:
-
-* Update test_openssl_version().
-* Update multissltests.py for OpenSSL 4.
-* Add const qualifier to fix compiler warnings.
-
-Co-authored-by: B=C3=A9n=C3=A9dikt Tran <10796600+picnixz@users.noreply.gi=
thub.com>
-Signed-off-by: Victor Stinner <vstinner@python.org>
-
-Upstream-Status: Backport [https://github.com/python/cpython/commit/3364e7=
e62fa24d0e19133fb0f90b1c24ef1110c5]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- Lib/test/test_ssl.py       | 52 ++++++++++++++++++++------------------
- Modules/_ssl.c             | 27 ++++++++++++++++----
- Modules/_ssl/cert.c        |  3 ++-
- Tools/ssl/multissltests.py |  7 ++++-
- 4 files changed, 58 insertions(+), 31 deletions(-)
-
-diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
-index dc795c6bd8a..61355927296 100644
---- a/Lib/test/test_ssl.py
-+++ b/Lib/test/test_ssl.py
-@@ -395,7 +395,7 @@ def test_constants(self):
-         ssl.OP_NO_COMPRESSION
-         self.assertEqual(ssl.HAS_SNI, True)
-         self.assertEqual(ssl.HAS_ECDH, True)
--        self.assertEqual(ssl.HAS_TLSv1_2, True)
-+        self.assertIsInstance(ssl.HAS_TLSv1_2, bool)
-         self.assertEqual(ssl.HAS_TLSv1_3, True)
-         ssl.OP_NO_SSLv2
-         ssl.OP_NO_SSLv3
-@@ -586,11 +586,11 @@ def test_openssl_version(self):
-         # Some sanity checks follow
-         # >=3D 1.1.1
-         self.assertGreaterEqual(n, 0x10101000)
--        # < 4.0
--        self.assertLess(n, 0x40000000)
-+        # < 5.0
-+        self.assertLess(n, 0x50000000)
-         major, minor, fix, patch, status =3D t
-         self.assertGreaterEqual(major, 1)
--        self.assertLess(major, 4)
-+        self.assertLess(major, 5)
-         self.assertGreaterEqual(minor, 0)
-         self.assertLess(minor, 256)
-         self.assertGreaterEqual(fix, 0)
-@@ -656,12 +656,14 @@ def test_openssl111_deprecations(self):
-             ssl.OP_NO_TLSv1_2,
-             ssl.OP_NO_TLSv1_3
-         ]
--        protocols =3D [
--            ssl.PROTOCOL_TLSv1,
--            ssl.PROTOCOL_TLSv1_1,
--            ssl.PROTOCOL_TLSv1_2,
--            ssl.PROTOCOL_TLS
--        ]
-+        protocols =3D []
-+        if hasattr(ssl, 'PROTOCOL_TLSv1'):
-+            protocols.append(ssl.PROTOCOL_TLSv1)
-+        if hasattr(ssl, 'PROTOCOL_TLSv1_1'):
-+            protocols.append(ssl.PROTOCOL_TLSv1_1)
-+        if hasattr(ssl, 'PROTOCOL_TLSv1_2'):
-+            protocols.append(ssl.PROTOCOL_TLSv1_2)
-+        protocols.append(ssl.PROTOCOL_TLS)
-         versions =3D [
-             ssl.TLSVersion.SSLv3,
-             ssl.TLSVersion.TLSv1,
-@@ -1205,6 +1207,7 @@ def test_min_max_version(self):
-                 ssl.TLSVersion.TLSv1,
-                 ssl.TLSVersion.TLSv1_1,
-                 ssl.TLSVersion.TLSv1_2,
-+                ssl.TLSVersion.TLSv1_3,
-                 ssl.TLSVersion.SSLv3,
-             }
-         )
-@@ -1218,7 +1221,7 @@ def test_min_max_version(self):
-         with self.assertRaises(ValueError):
-             ctx.minimum_version =3D 42
-=20
--        if has_tls_protocol(ssl.PROTOCOL_TLSv1_1):
-+        if has_tls_protocol('PROTOCOL_TLSv1_1'):
-             ctx =3D ssl.SSLContext(ssl.PROTOCOL_TLSv1_1)
-=20
-             self.assertIn(
-@@ -1675,23 +1678,24 @@ def test__create_stdlib_context(self):
-         self.assertFalse(ctx.check_hostname)
-         self._assert_context_options(ctx)
-=20
--        if has_tls_protocol(ssl.PROTOCOL_TLSv1):
-+        if has_tls_protocol('PROTOCOL_TLSv1'):
-             with warnings_helper.check_warnings():
-                 ctx =3D ssl._create_stdlib_context(ssl.PROTOCOL_TLSv1)
-             self.assertEqual(ctx.protocol, ssl.PROTOCOL_TLSv1)
-             self.assertEqual(ctx.verify_mode, ssl.CERT_NONE)
-             self._assert_context_options(ctx)
-=20
--        with warnings_helper.check_warnings():
--            ctx =3D ssl._create_stdlib_context(
--                ssl.PROTOCOL_TLSv1_2,
--                cert_reqs=3Dssl.CERT_REQUIRED,
--                check_hostname=3DTrue
--            )
--        self.assertEqual(ctx.protocol, ssl.PROTOCOL_TLSv1_2)
--        self.assertEqual(ctx.verify_mode, ssl.CERT_REQUIRED)
--        self.assertTrue(ctx.check_hostname)
--        self._assert_context_options(ctx)
-+        if has_tls_protocol('PROTOCOL_TLSv1_2'):
-+            with warnings_helper.check_warnings():
-+                ctx =3D ssl._create_stdlib_context(
-+                    ssl.PROTOCOL_TLSv1_2,
-+                    cert_reqs=3Dssl.CERT_REQUIRED,
-+                    check_hostname=3DTrue
-+                )
-+            self.assertEqual(ctx.protocol, ssl.PROTOCOL_TLSv1_2)
-+            self.assertEqual(ctx.verify_mode, ssl.CERT_REQUIRED)
-+            self.assertTrue(ctx.check_hostname)
-+            self._assert_context_options(ctx)
-=20
-         ctx =3D ssl._create_stdlib_context(purpose=3Dssl.Purpose.CLIENT_A=
UTH)
-         self.assertEqual(ctx.protocol, ssl.PROTOCOL_TLS_SERVER)
-@@ -3654,10 +3658,10 @@ def test_protocol_tlsv1_2(self):
-                            client_options=3Dssl.OP_NO_TLSv1_2)
-=20
-         try_protocol_combo(ssl.PROTOCOL_TLS, ssl.PROTOCOL_TLSv1_2, 'TLSv1=
.2')
--        if has_tls_protocol(ssl.PROTOCOL_TLSv1):
-+        if has_tls_protocol('PROTOCOL_TLSv1'):
-             try_protocol_combo(ssl.PROTOCOL_TLSv1_2, ssl.PROTOCOL_TLSv1, =
False)
-             try_protocol_combo(ssl.PROTOCOL_TLSv1, ssl.PROTOCOL_TLSv1_2, =
False)
--        if has_tls_protocol(ssl.PROTOCOL_TLSv1_1):
-+        if has_tls_protocol('PROTOCOL_TLSv1_1'):
-             try_protocol_combo(ssl.PROTOCOL_TLSv1_2, ssl.PROTOCOL_TLSv1_1=
, False)
-             try_protocol_combo(ssl.PROTOCOL_TLSv1_1, ssl.PROTOCOL_TLSv1_2=
, False)
-=20
-diff --git a/Modules/_ssl.c b/Modules/_ssl.c
-index b45295b4c0c..6f75af86113 100644
---- a/Modules/_ssl.c
-+++ b/Modules/_ssl.c
-@@ -164,6 +164,17 @@ static void _PySSLFixErrno(void) {
- #error Unsupported OpenSSL version
- #endif
-=20
-+#if (OPENSSL_VERSION_NUMBER >=3D 0x40000000L)
-+#  define OPENSSL_NO_SSL3
-+#  define OPENSSL_NO_TLS1
-+#  define OPENSSL_NO_TLS1_1
-+#  define OPENSSL_NO_TLS1_2
-+#  define OPENSSL_NO_SSL3_METHOD
-+#  define OPENSSL_NO_TLS1_METHOD
-+#  define OPENSSL_NO_TLS1_1_METHOD
-+#  define OPENSSL_NO_TLS1_2_METHOD
-+#endif
-+
- /* OpenSSL API 1.1.0+ does not include version methods */
- #ifndef OPENSSL_NO_SSL3_METHOD
- extern const SSL_METHOD *SSLv3_method(void);
-@@ -1151,7 +1162,7 @@ _asn1obj2py(_sslmodulestate *state, const ASN1_OBJEC=
T *name, int no_name)
-=20
- static PyObject *
- _create_tuple_for_attribute(_sslmodulestate *state,
--                            ASN1_OBJECT *name, ASN1_STRING *value)
-+                            const ASN1_OBJECT *name, const ASN1_STRING *v=
alue)
- {
-     Py_ssize_t buflen;
-     PyObject *pyattr;
-@@ -1180,16 +1191,16 @@ _create_tuple_for_attribute(_sslmodulestate *state=
,
- }
-=20
- static PyObject *
--_create_tuple_for_X509_NAME (_sslmodulestate *state, X509_NAME *xname)
-+_create_tuple_for_X509_NAME(_sslmodulestate *state, const X509_NAME *xnam=
e)
- {
-     PyObject *dn =3D NULL;    /* tuple which represents the "distinguishe=
d name" */
-     PyObject *rdn =3D NULL;   /* tuple to hold a "relative distinguished =
name" */
-     PyObject *rdnt;
-     PyObject *attr =3D NULL;   /* tuple to hold an attribute */
-     int entry_count =3D X509_NAME_entry_count(xname);
--    X509_NAME_ENTRY *entry;
--    ASN1_OBJECT *name;
--    ASN1_STRING *value;
-+    const X509_NAME_ENTRY *entry;
-+    const ASN1_OBJECT *name;
-+    const ASN1_STRING *value;
-     int index_counter;
-     int rdn_level =3D -1;
-     int retcode;
-@@ -6967,9 +6978,15 @@ sslmodule_init_constants(PyObject *m)
-     ADD_INT_CONST("PROTOCOL_TLS", PY_SSL_VERSION_TLS);
-     ADD_INT_CONST("PROTOCOL_TLS_CLIENT", PY_SSL_VERSION_TLS_CLIENT);
-     ADD_INT_CONST("PROTOCOL_TLS_SERVER", PY_SSL_VERSION_TLS_SERVER);
-+#ifndef OPENSSL_NO_TLS1
-     ADD_INT_CONST("PROTOCOL_TLSv1", PY_SSL_VERSION_TLS1);
-+#endif
-+#ifndef OPENSSL_NO_TLS1_1
-     ADD_INT_CONST("PROTOCOL_TLSv1_1", PY_SSL_VERSION_TLS1_1);
-+#endif
-+#ifndef OPENSSL_NO_TLS1_2
-     ADD_INT_CONST("PROTOCOL_TLSv1_2", PY_SSL_VERSION_TLS1_2);
-+#endif
-=20
- #define ADD_OPTION(NAME, VALUE) if (sslmodule_add_option(m, NAME, (VALUE)=
) < 0) return -1
-=20
-diff --git a/Modules/_ssl/cert.c b/Modules/_ssl/cert.c
-index f2e7be89668..061b0fb3171 100644
---- a/Modules/_ssl/cert.c
-+++ b/Modules/_ssl/cert.c
-@@ -128,7 +128,8 @@ _ssl_Certificate_get_info_impl(PySSLCertificate *self)
- }
-=20
- static PyObject*
--_x509name_print(_sslmodulestate *state, X509_NAME *name, int indent, unsi=
gned long flags)
-+_x509name_print(_sslmodulestate *state, const X509_NAME *name,
-+                int indent, unsigned long flags)
- {
-     PyObject *res;
-     BIO *biobuf;
-diff --git a/Tools/ssl/multissltests.py b/Tools/ssl/multissltests.py
-index 3b4507c6771..48207e5330f 100755
---- a/Tools/ssl/multissltests.py
-+++ b/Tools/ssl/multissltests.py
-@@ -429,9 +429,11 @@ def _post_install(self):
-     def _post_install(self):
-         if self.version.startswith("3."):
-             self._post_install_3xx()
-+        elif self.version.startswith("4."):
-+            self._post_install_4xx()
-=20
-     def _build_src(self, config_args=3D()):
--        if self.version.startswith("3."):
-+        if self.version.startswith(("3.", "4.")):
-             config_args +=3D ("enable-fips",)
-         super()._build_src(config_args)
-=20
-@@ -447,6 +449,9 @@ def _post_install_3xx(self):
-             lib64 =3D self.lib_dir + "64"
-             os.symlink(lib64, self.lib_dir)
-=20
-+    def _post_install_4xx(self):
-+        self._post_install_3xx()
-+
-     @property
-     def short_version(self):
-         """Short version for OpenSSL download URL"""
---=20
-2.25.1
-
diff --git a/meta/recipes-devtools/python/python3/0001-prefer-valid-entrypo=
ints.patch b/meta/recipes-devtools/python/python3/0001-prefer-valid-entrypo=
ints.patch
index ae3698fac4..030f82f99b 100644
--- a/meta/recipes-devtools/python/python3/0001-prefer-valid-entrypoints.pa=
tch
+++ b/meta/recipes-devtools/python/python3/0001-prefer-valid-entrypoints.pa=
tch
@@ -1,4 +1,4 @@
-From 8d7fcf04c6513841c7985e64b746b1ef5de0c426 Mon Sep 17 00:00:00 2001
+From 8889d373f2218253555d69b9ad022f52bc4ad78d Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 17 Apr 2026 16:53:42 +0100
 Subject: [PATCH] prefer valid entrypoints
diff --git a/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-pla=
tlibdir-also-for-purelib.patch b/meta/recipes-devtools/python/python3/0001-=
sysconfig.py-use-platlibdir-also-for-purelib.patch
index 7807827d9a..3ac97d348b 100644
--- a/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir=
-also-for-purelib.patch
+++ b/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir=
-also-for-purelib.patch
@@ -1,4 +1,4 @@
-From c10d1b295a9fb93836830cce441da3f22e5c7cd7 Mon Sep 17 00:00:00 2001
+From 31ca770452781c56c19b98e584db3bc964116b44 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 12 Sep 2021 21:44:36 +0200
 Subject: [PATCH] sysconfig.py: use platlibdir also for purelib
diff --git a/meta/recipes-devtools/python/python3/0001-test_locale.py-corre=
ct-the-test-output-format.patch b/meta/recipes-devtools/python/python3/0001=
-test_locale.py-correct-the-test-output-format.patch
index a60d082e2f..8e72a374d9 100644
--- a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-=
test-output-format.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-=
test-output-format.patch
@@ -1,4 +1,4 @@
-From f0ac5b479b99bfb7f5e937a941b31a596f4caafc Mon Sep 17 00:00:00 2001
+From a712d1ebb55ac8e5801a5c2179945ce26638a548 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Mon, 5 Aug 2019 15:57:39 +0800
 Subject: [PATCH] test_locale.py: correct the test output format
diff --git a/meta/recipes-devtools/python/python3/0002-gh-148292-Update-_ss=
l._SSLSocket-for-OpenSSL-4.patch b/meta/recipes-devtools/python/python3/000=
2-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.patch
deleted file mode 100644
index 587f141dd4..0000000000
--- a/meta/recipes-devtools/python/python3/0002-gh-148292-Update-_ssl._SSLS=
ocket-for-OpenSSL-4.patch
+++ /dev/null
@@ -1,234 +0,0 @@
-From 3c2a3014af7d73cc34f2498f60fdf863d9bc7c6c Mon Sep 17 00:00:00 2001
-From: Victor Stinner <vstinner@python.org>
-Date: Mon, 4 May 2026 13:52:57 +0200
-Subject: [PATCH] gh-148292: Update _ssl._SSLSocket for OpenSSL 4 (#149102)
-
-The _SSLSocket object now remembers if it gets an EOF error. In this
-case, read(), sendfile(), write() and do_handshake method calls fail
-with SSLEOFError without calling the underlying OpenSSL function.
-
-Co-authored-by: Gregory P. Smith <greg@krypto.org>
-(cherry picked from commit 7b7fa3f9bf3d7cdf3eb669d02b386e05b39c402a)
-
-Upstream-Status: Backport [https://github.com/python/cpython/commit/3c2a30=
14af7d]
-
-Note: This is from the unmerged CPython PR #149783 which backports
-OpenSSL 4.0 support to the 3.14 branch. Upstream deferred merging
-until after Python 3.15.1 is released.
-
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- Lib/test/test_ssl.py                          | 82 +++++++++++++++++++
- ...-04-28-17-47-55.gh-issue-148292.oIq3ml.rst |  7 ++
- Modules/_ssl.c                                | 42 ++++++++++
- 3 files changed, 131 insertions(+)
- create mode 100644 Misc/NEWS.d/next/Library/2026-04-28-17-47-55.gh-issue-=
148292.oIq3ml.rst
-
-diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
-index 965dbc36f096499..03d9e3f9e5e96b5 100644
---- a/Lib/test/test_ssl.py
-+++ b/Lib/test/test_ssl.py
-@@ -2711,6 +2711,36 @@ def close(self):
-     def stop(self):
-         self.active =3D False
-=20
-+class TestEOFServer(threading.Thread):
-+    def __init__(self):
-+        super().__init__()
-+        self.listening =3D threading.Event()
-+        self.address =3D None
-+
-+    def run(self):
-+        context =3D ssl.create_default_context(ssl.Purpose.CLIENT_AUTH)
-+        context.load_cert_chain(CERTFILE)
-+        server_sock =3D socket.socket(socket.AF_INET, socket.SOCK_STREAM)
-+        with server_sock:
-+            server_sock.settimeout(support.SHORT_TIMEOUT)
-+            server_sock.bind((HOST, 0))
-+            server_sock.listen(5)
-+
-+            self.address =3D server_sock.getsockname()
-+            self.listening.set()
-+
-+            sock, addr =3D server_sock.accept()
-+            sslconn =3D context.wrap_socket(sock, server_side=3DTrue)
-+            with sslconn:
-+                request =3D b''
-+                while chunk :=3D sslconn.recv(1024):
-+                    request +=3D chunk
-+                    if b'\n' in chunk:
-+                        break
-+
-+                sslconn.sendall(b'server\n')
-+                sslconn.shutdown(socket.SHUT_WR)
-+
- class AsyncoreEchoServer(threading.Thread):
-=20
-     # this one's based on asyncore.dispatcher
-@@ -4747,6 +4777,58 @@ def background(sock):
-                     if cm.exc_value is not None:
-                         raise cm.exc_value
-=20
-+    def test_got_eof(self):
-+        # gh-148292: Test that _ssl._SSLSocket behaves the same on all Op=
enSSL
-+        # versions on calling methods after EOF (after the first SSLEOFEr=
ror).
-+
-+        server =3D TestEOFServer()
-+        server.start()
-+        if not server.listening.wait(support.SHORT_TIMEOUT):
-+            raise RuntimeError("server took too long")
-+        self.addCleanup(server.join)
-+
-+        context =3D ssl.create_default_context(cafile=3DCERTFILE)
-+        sock =3D socket.socket(socket.AF_INET, socket.SOCK_STREAM)
-+        sock.settimeout(support.SHORT_TIMEOUT)
-+        sock.connect(server.address)
-+        sslsock =3D context.wrap_socket(sock, server_hostname=3D'localhos=
t')
-+        with sslsock:
-+            sslsock.sendall(b'client\n')
-+            # test the _ssl._SSLSocket object, not ssl.SSLSocket
-+            sslobj =3D sslsock._sslobj
-+
-+            data =3D sslobj.read(1024)
-+            self.assertEqual(data, b'server\n')
-+
-+            # The second read gets EOF error and sets got_eof_error to 1
-+            with self.assertRaises(ssl.SSLEOFError):
-+                sslobj.read(1024)
-+
-+            # Following read(), sendfile(), write() and do_handshake() ca=
lls
-+            # must raise SSLEOFError
-+            with self.assertRaises(ssl.SSLEOFError):
-+                # The _SSLSocket remembers the previous EOF error
-+                # and raises again SSLEOFError
-+                sslobj.read(1024)
-+            if hasattr(sslobj, 'sendfile'):
-+                with open(__file__, "rb") as fp:
-+                    with self.assertRaises(ssl.SSLEOFError):
-+                        sslobj.sendfile(fp.fileno(), 0, 1)
-+            with self.assertRaises(ssl.SSLEOFError):
-+                sslobj.write(b'client2\n')
-+            with self.assertRaises(ssl.SSLEOFError):
-+                sslsock.do_handshake()
-+
-+            self.assertEqual(sslsock.pending(), 0)
-+            try:
-+                sslsock.shutdown(socket.SHUT_WR)
-+            except OSError as exc:
-+                self.assertEqual(exc.errno, errno.ENOTCONN)
-+            else:
-+                # On Windows and on OpenSSL 1.1.1, shutdown() doesn't
-+                # raise an error
-+                pass
-+
-=20
- @unittest.skipUnless(has_tls_version('TLSv1_3') and ssl.HAS_PHA,
-                      "Test needs TLS 1.3 PHA")
-diff --git a/Misc/NEWS.d/next/Library/2026-04-28-17-47-55.gh-issue-148292.=
oIq3ml.rst b/Misc/NEWS.d/next/Library/2026-04-28-17-47-55.gh-issue-148292.o=
Iq3ml.rst
-new file mode 100644
-index 000000000000000..e1f308df5a678e6
---- /dev/null
-+++ b/Misc/NEWS.d/next/Library/2026-04-28-17-47-55.gh-issue-148292.oIq3ml.=
rst
-@@ -0,0 +1,7 @@
-+:mod:`ssl`: Update :class:`ssl.SSLSocket` and :class:`ssl.SSLObject` for
-+OpenSSL 4. The classes now remember if they get a :exc:`ssl.SSLEOFError`.=
 In this
-+case, following :meth:`~ssl.SSLSocket.read`, :meth:`!sendfile`,
-+:meth:`~ssl.SSLSocket.write`, and :meth:`~ssl.SSLSocket.do_handshake` cal=
ls
-+raise :exc:`ssl.SSLEOFError` without calling the underlying OpenSSL funct=
ion.
-+Thanks to that, :class:`ssl.SSLSocket` behaves the same on all OpenSSL ve=
rsions
-+on EOF.  Patch by Victor Stinner.
-diff --git a/Modules/_ssl.c b/Modules/_ssl.c
-index 1603d0ffd559559..376df32b7cb4bd6 100644
---- a/Modules/_ssl.c
-+++ b/Modules/_ssl.c
-@@ -352,6 +352,16 @@ typedef struct {
-      * and shutdown methods check for chained exceptions.
-      */
-     PyObject *exc;
-+    // gh-148292: If non-zero, read(), sendfile(), write() and do_handsha=
ke()
-+    // methods raise SSLEOFError without calling the underlying OpenSSL
-+    // function. Set to 1 on PY_SSL_ERROR_EOF error.
-+    //
-+    // On OpenSSL 4, if SSL_read_ex() fails with
-+    // SSL_R_UNEXPECTED_EOF_WHILE_READING, the following SSL_read_ex() ca=
ll
-+    // fails with a generic protocol error (ERR_peek_last_error() returns=
 0).
-+    // Use got_eof_error to have the same behavior on OpenSSL 4 and newer=
 and
-+    // on OpenSSL 3 and older.
-+    int got_eof_error;
- } PySSLSocket;
-=20
- #define PySSLSocket_CAST(op)    ((PySSLSocket *)(op))
-@@ -499,6 +509,10 @@ fill_and_set_sslerror(_sslmodulestate *state,
-     PyObject *init_value, *msg, *key;
-     PyUnicodeWriter *writer =3D NULL;
-=20
-+    if (ssl_errno =3D=3D PY_SSL_ERROR_EOF && sslsock !=3D NULL) {
-+        sslsock->got_eof_error =3D 1;
-+    }
-+
-     if (errcode !=3D 0) {
-         int lib, reason;
-=20
-@@ -654,6 +668,18 @@ PySSL_ChainExceptions(PySSLSocket *sslsock) {
-     return -1;
- }
-=20
-+
-+static void
-+set_eof_error(PySSLSocket *sslsock)
-+{
-+    _sslmodulestate *state =3D get_state_sock(sslsock);
-+    fill_and_set_sslerror(state, sslsock, state->PySSLEOFErrorObject,
-+                          PY_SSL_ERROR_EOF,
-+                          "EOF occurred in violation of protocol",
-+                          __LINE__, 0);
-+}
-+
-+
- static PyObject *
- PySSL_SetError(PySSLSocket *sslsock, const char *filename, int lineno)
- {
-@@ -901,6 +927,7 @@ newPySSLSocket(PySSLContext *sslctx, PySocketSockObjec=
t *sock,
-     self->server_hostname =3D NULL;
-     self->err =3D err;
-     self->exc =3D NULL;
-+    self->got_eof_error =3D 0;
-=20
-     /* Make sure the SSL error state is initialized */
-     ERR_clear_error();
-@@ -1041,6 +1068,11 @@ _ssl__SSLSocket_do_handshake_impl(PySSLSocket *self=
)
-         BIO_set_nbio(SSL_get_wbio(self->ssl), nonblocking);
-     }
-=20
-+    if (self->got_eof_error) {
-+        set_eof_error(self);
-+        goto error;
-+    }
-+
-     timeout =3D GET_SOCKET_TIMEOUT(sock);
-     has_timeout =3D (timeout > 0);
-     if (has_timeout) {
-@@ -2504,6 +2536,11 @@ _ssl__SSLSocket_write_impl(PySSLSocket *self, Py_bu=
ffer *b)
-         BIO_set_nbio(SSL_get_wbio(self->ssl), nonblocking);
-     }
-=20
-+    if (self->got_eof_error) {
-+        set_eof_error(self);
-+        goto error;
-+    }
-+
-     timeout =3D GET_SOCKET_TIMEOUT(sock);
-     has_timeout =3D (timeout > 0);
-     if (has_timeout) {
-@@ -2644,6 +2681,11 @@ _ssl__SSLSocket_read_impl(PySSLSocket *self, Py_ssi=
ze_t len,
-         Py_INCREF(sock);
-     }
-=20
-+    if (self->got_eof_error) {
-+        set_eof_error(self);
-+        goto error;
-+    }
-+
-     if (!group_right_1) {
-         dest =3D PyBytes_FromStringAndSize(NULL, len);
-         if (dest =3D=3D NULL)
diff --git a/meta/recipes-devtools/python/python3/0003-gh-148292-Remove-shu=
tdown-test-in-test_ssl.test_got_eof.patch b/meta/recipes-devtools/python/py=
thon3/0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_got_eof.patch
deleted file mode 100644
index af067f549c..0000000000
--- a/meta/recipes-devtools/python/python3/0003-gh-148292-Remove-shutdown-t=
est-in-test_ssl.test_got_eof.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 81911909bc439d6de8ce6a173b0691b3c58e9e1a Mon Sep 17 00:00:00 2001
-From: Victor Stinner <vstinner@python.org>
-Date: Mon, 4 May 2026 16:20:25 +0200
-Subject: [PATCH] gh-148292: Remove shutdown() test in test_ssl.test_got_eo=
f()
- (#149366)
-
-The shutdown() behavior depends too much on the operating system and
-it's unrelated to the got_eof_error change.
-
-(cherry picked from commit 1e21cf6fee3830012e458c0fe5dbc6fcd45ace92)
-
-Upstream-Status: Backport [https://github.com/python/cpython/commit/819119=
09bc43]
-
-Note: This is from the unmerged CPython PR #149783 which backports
-OpenSSL 4.0 support to the 3.14 branch. Upstream deferred merging
-until after Python 3.15.1 is released.
-
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- Lib/test/test_ssl.py | 8 --------
- 1 file changed, 8 deletions(-)
-
-diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
-index 03d9e3f9e5e96b5..6445f122b4272be 100644
---- a/Lib/test/test_ssl.py
-+++ b/Lib/test/test_ssl.py
-@@ -4820,14 +4820,6 @@ def test_got_eof(self):
-                 sslsock.do_handshake()
-=20
-             self.assertEqual(sslsock.pending(), 0)
--            try:
--                sslsock.shutdown(socket.SHUT_WR)
--            except OSError as exc:
--                self.assertEqual(exc.errno, errno.ENOTCONN)
--            else:
--                # On Windows and on OpenSSL 1.1.1, shutdown() doesn't
--                # raise an error
--                pass
-=20
-=20
- @unittest.skipUnless(has_tls_version('TLSv1_3') and ssl.HAS_PHA,
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/rec=
ipes-devtools/python/python3/makerace.patch
index 248a521118..c6c01332ce 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -1,4 +1,4 @@
-From b41557f570ff4451c477669d6ca5bfacabe21c66 Mon Sep 17 00:00:00 2001
+From 7b796f0e8953a9c9e9402c8c60eccc19a33874a9 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 13 Jul 2021 23:19:29 +0100
 Subject: [PATCH] python3: Fix make race
diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/m=
eta/recipes-devtools/python/python3/python3-manifest.json
index 008d41e565..928c0df9ad 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -117,7 +117,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/asyncio",
             "${libdir}/python${PYTHON_MAJMIN}/concurrent",
             "${libdir}/python${PYTHON_MAJMIN}/concurrent/futures",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_asyncio.*.so"
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_remote_debuggin=
g.*.so"
         ],
         "cached": []
     },
@@ -129,9 +129,7 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/wave.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/wave.*.pyc"
-        ]
+        "cached": []
     },
     "codecs": {
         "summary": "Python codec",
@@ -153,11 +151,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/filecmp.py",
             "${libdir}/python${PYTHON_MAJMIN}/py_compile.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/compileall.*.pyc=
",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/filecmp.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/py_compile.*.pyc=
"
-        ]
+        "cached": []
     },
     "compression": {
         "summary": "Python high-level compression support",
@@ -165,20 +159,16 @@
             "core"
         ],
         "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/compression/",
             "${libdir}/python${PYTHON_MAJMIN}/gzip.py",
             "${libdir}/python${PYTHON_MAJMIN}/tarfile.py",
-            "${libdir}/python${PYTHON_MAJMIN}/zipfile/",
-            "${libdir}/python${PYTHON_MAJMIN}/compression/",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_zstd.*.so"
+            "${libdir}/python${PYTHON_MAJMIN}/zipfile/"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/gzip.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tarfile.*.pyc"
-        ]
+        "cached": []
     },
     "core": {
         "summary": "Python interpreter and core modules",
-        "rdepends": ["compression"],
+        "rdepends": [],
         "files": [
             "${bindir}/python${PYTHON_MAJMIN}",
             "${bindir}/python${PYTHON_MAJMIN}.real",
@@ -195,6 +185,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/_colorize.py",
             "${libdir}/python${PYTHON_MAJMIN}/_compression.py",
             "${libdir}/python${PYTHON_MAJMIN}/_markupbase.py",
+            "${libdir}/python${PYTHON_MAJMIN}/_missing_stdlib_info.py",
             "${libdir}/python${PYTHON_MAJMIN}/_opcode_metadata.py",
             "${libdir}/python${PYTHON_MAJMIN}/_py_warnings.py",
             "${libdir}/python${PYTHON_MAJMIN}/_pyrepl",
@@ -213,6 +204,11 @@
             "${libdir}/python${PYTHON_MAJMIN}/codeop.py",
             "${libdir}/python${PYTHON_MAJMIN}/collections",
             "${libdir}/python${PYTHON_MAJMIN}/collections/abc.py",
+            "${libdir}/python${PYTHON_MAJMIN}/compression",
+            "${libdir}/python${PYTHON_MAJMIN}/compression/_common",
+            "${libdir}/python${PYTHON_MAJMIN}/compression/_common/_streams=
.py",
+            "${libdir}/python${PYTHON_MAJMIN}/compression/zstd",
+            "${libdir}/python${PYTHON_MAJMIN}/compression/zstd/_zstdfile.p=
y",
             "${libdir}/python${PYTHON_MAJMIN}/configparser.py",
             "${libdir}/python${PYTHON_MAJMIN}/contextlib.py",
             "${libdir}/python${PYTHON_MAJMIN}/copy.py",
@@ -252,11 +248,14 @@
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_bz2.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_csv.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_heapq.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_interpreters.*.=
so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_lzma.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_math_integer.*.=
so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_opcode.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_posixsubprocess=
.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_struct.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_typing.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_zstd.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/array.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/binascii.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/fcntl.*.so",
@@ -282,6 +281,8 @@
             "${libdir}/python${PYTHON_MAJMIN}/pathlib.py",
             "${libdir}/python${PYTHON_MAJMIN}/pathlib/_abc.py",
             "${libdir}/python${PYTHON_MAJMIN}/pathlib/_local.py",
+            "${libdir}/python${PYTHON_MAJMIN}/pathlib/_os.py",
+            "${libdir}/python${PYTHON_MAJMIN}/pathlib/types.py",
             "${libdir}/python${PYTHON_MAJMIN}/pkgutil.py",
             "${libdir}/python${PYTHON_MAJMIN}/platform.py",
             "${libdir}/python${PYTHON_MAJMIN}/posixpath.py",
@@ -442,13 +443,12 @@
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha2.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha3.*.so"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/hashlib.*.pyc"
-        ]
+        "cached": []
     },
     "ctypes": {
         "summary": "Python C types support",
         "rdepends": [
+            "compression",
             "core",
             "io",
             "math"
@@ -480,14 +480,9 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/_strptime.py",
             "${libdir}/python${PYTHON_MAJMIN}/calendar.py",
-            "${libdir}/python${PYTHON_MAJMIN}/datetime.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_datetime.*.so"
+            "${libdir}/python${PYTHON_MAJMIN}/datetime.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_strptime.*.pyc"=
,
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/calendar.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/datetime.*.pyc"
-        ]
+        "cached": []
     },
     "db": {
         "summary": "Python file-based database support",
@@ -503,7 +498,15 @@
     "debugger": {
         "summary": "Python debugger",
         "rdepends": [
+            "asyncio",
+            "compression",
             "core",
+            "io",
+            "json",
+            "logging",
+            "math",
+            "netclient",
+            "numbers",
             "pprint",
             "shell",
             "stringold"
@@ -512,10 +515,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/bdb.py",
             "${libdir}/python${PYTHON_MAJMIN}/pdb.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bdb.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pdb.*.pyc"
-        ]
+        "cached": []
     },
     "dev": {
         "cached": [],
@@ -545,16 +545,22 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/difflib.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/difflib.*.pyc"
-        ]
+        "cached": []
     },
     "doctest": {
         "summary": "Python framework for running examples in docstrings",
         "rdepends": [
+            "asyncio",
+            "compression",
             "core",
             "debugger",
             "difflib",
+            "io",
+            "json",
+            "logging",
+            "math",
+            "netclient",
+            "numbers",
             "pprint",
             "shell",
             "stringold",
@@ -563,9 +569,7 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/doctest.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/doctest.*.pyc"
-        ]
+        "cached": []
     },
     "email": {
         "summary": "Python email support",
@@ -582,9 +586,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/email",
             "${libdir}/python${PYTHON_MAJMIN}/imaplib.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/imaplib.*.pyc"
-        ]
+        "cached": []
     },
     "ensurepip": {
         "summary": "Support for bootstrapping the pip installer",
@@ -601,9 +603,7 @@
         "rdepends": [
             "core"
         ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/fcntl.*.so"
-        ],
+        "files": [],
         "cached": []
     },
     "gdbm": {
@@ -645,13 +645,12 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/colorsys.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/colorsys.*.pyc"
-        ]
+        "cached": []
     },
     "io": {
         "summary": "Python low-level I/O",
         "rdepends": [
+            "compression",
             "core",
             "math",
             "netclient"
@@ -665,12 +664,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/ssl.py",
             "${libdir}/python${PYTHON_MAJMIN}/tempfile.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_pyio.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/socket.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ssl.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tempfile.*.pyc"
-        ]
+        "cached": []
     },
     "json": {
         "summary": "Python JSON support",
@@ -713,9 +707,7 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/mailbox.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/mailbox.*.pyc"
-        ]
+        "cached": []
     },
     "math": {
         "summary": "Python math support",
@@ -727,9 +719,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/cmath.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/random.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/random.*.pyc"
-        ]
+        "cached": []
     },
     "mime": {
         "summary": "Python MIME handling APIs",
@@ -739,9 +729,7 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/quopri.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/quopri.*.pyc"
-        ]
+        "cached": []
     },
     "mmap": {
         "summary": "Python memory-mapped file support",
@@ -816,10 +804,12 @@
     "multiprocessing": {
         "summary": "Python multiprocessing support",
         "rdepends": [
+            "compression",
             "core",
             "crypt",
             "ctypes",
             "io",
+            "json",
             "math",
             "mmap",
             "netclient",
@@ -851,6 +841,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/hmac.py",
             "${libdir}/python${PYTHON_MAJMIN}/http",
             "${libdir}/python${PYTHON_MAJMIN}/http/__pycache__",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_hmac.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_uuid.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/mimetypes.py",
             "${libdir}/python${PYTHON_MAJMIN}/poplib.py",
@@ -859,16 +850,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/urllib",
             "${libdir}/python${PYTHON_MAJMIN}/uuid.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/base64.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ftplib.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/hmac.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/mimetypes.*.pyc"=
,
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/poplib.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/secrets.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/smtplib.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/uuid.*.pyc"
-        ]
+        "cached": []
     },
     "netserver": {
         "summary": "Python Internet Protocol servers",
@@ -879,9 +861,7 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/socketserver.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/socketserver.*.p=
yc"
-        ]
+        "cached": []
     },
     "numbers": {
         "summary": "Python number APIs",
@@ -893,17 +873,10 @@
             "${libdir}/python${PYTHON_MAJMIN}/contextvars.py",
             "${libdir}/python${PYTHON_MAJMIN}/decimal.py",
             "${libdir}/python${PYTHON_MAJMIN}/fractions.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_contextvars.*.s=
o",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_decimal.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/numbers.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_pydecimal.*.pyc=
",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/contextvars.*.py=
c",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/decimal.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/fractions.*.pyc"=
,
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/numbers.*.pyc"
-        ]
+        "cached": []
     },
     "pickle": {
         "summary": "Python serialisation/persistence support",
@@ -917,12 +890,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/pickletools.py",
             "${libdir}/python${PYTHON_MAJMIN}/shelve.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_compat_pickle.*=
.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pickle.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pickletools.*.py=
c",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/shelve.*.pyc"
-        ]
+        "cached": []
     },
     "pkgutil": {
         "summary": "Python package extension utility support",
@@ -942,9 +910,7 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/plistlib.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/plistlib.*.pyc"
-        ]
+        "cached": []
     },
     "pprint": {
         "summary": "Python pretty-print support",
@@ -954,9 +920,7 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/pprint.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pprint.*.pyc"
-        ]
+        "cached": []
     },
     "profile": {
         "summary": "Python basic performance profiling support",
@@ -967,13 +931,11 @@
             "${libdir}/python${PYTHON_MAJMIN}/cProfile.py",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_lsprof.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/profile.py",
+            "${libdir}/python${PYTHON_MAJMIN}/profiling",
+            "${libdir}/python${PYTHON_MAJMIN}/profiling/tracing",
             "${libdir}/python${PYTHON_MAJMIN}/pstats.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cProfile.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/profile.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pstats.*.pyc"
-        ]
+        "cached": []
     },
     "pydoc": {
         "summary": "Python interactive help support",
@@ -985,9 +947,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/pydoc.py",
             "${libdir}/python${PYTHON_MAJMIN}/pydoc_data"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pydoc.*.pyc"
-        ]
+        "cached": []
     },
     "resource": {
         "summary": "Python resource control interface",
@@ -1002,17 +962,13 @@
     "shell": {
         "summary": "Python shell-like functionality",
         "rdepends": [
-            "core",
-            "stringold"
+            "core"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/cmd.py",
             "${libdir}/python${PYTHON_MAJMIN}/shlex.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cmd.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/shlex.*.pyc"
-        ]
+        "cached": []
     },
     "sqlite3": {
         "summary": "Python Sqlite3 database support",
@@ -1037,9 +993,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_statistics.*.so=
",
             "${libdir}/python${PYTHON_MAJMIN}/statistics.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/statistics.*.pyc=
"
-        ]
+        "cached": []
     },
     "stringold": {
         "summary": "Common string operations",
@@ -1072,10 +1026,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/pty.py",
             "${libdir}/python${PYTHON_MAJMIN}/tty.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pty.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tty.*.pyc"
-        ]
+        "cached": []
     },
     "threading": {
         "summary": "Python threading & synchronization support",
@@ -1087,10 +1038,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_queue.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/queue.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_threading_local=
.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/queue.*.pyc"
-        ]
+        "cached": []
     },
     "tkinter": {
         "summary": "Python Tcl/Tk bindings",
@@ -1141,15 +1089,15 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/getpass.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/getpass.*.pyc"
-        ]
+        "cached": []
     },
     "venv": {
         "summary": "Provides support for creating lightweight virtual envi=
ronments with their own site directories, optionally isolated from system s=
ite directories.",
         "rdepends": [
+            "compression",
             "core",
             "logging",
+            "shell",
             "stringold"
         ],
         "files": [
@@ -1200,11 +1148,10 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/zipapp.py"
+            "${libdir}/python${PYTHON_MAJMIN}/zipapp.py",
+            "${libdir}/python${PYTHON_MAJMIN}/zipfile"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/zipapp.*.pyc"
-        ]
+        "cached": []
     },
     "zoneinfo": {
         "summary": "IANA time zone support",
diff --git a/meta/recipes-devtools/python/python3/valid-dists.patch b/meta/=
recipes-devtools/python/python3/valid-dists.patch
deleted file mode 100644
index 7fe18254e5..0000000000
--- a/meta/recipes-devtools/python/python3/valid-dists.patch
+++ /dev/null
@@ -1,164 +0,0 @@
-From 66874ce1a9f21b4b00dc85919734d58e6243ca29 Mon Sep 17 00:00:00 2001
-From: "Jason R. Coombs" <jaraco@jaraco.com>
-Date: Tue, 23 Jul 2024 08:36:16 -0400
-Subject: [PATCH] Prioritize valid dists to invalid dists when retrieving b=
y
- name.
-
-Closes python/importlib_metadata#489
-
-Upstream-Status: Backport [https://github.com/python/importlib_metadata/co=
mmit/a65c29adc027b3615154cab73aaedd58a6aa23da]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- Lib/importlib/metadata/__init__.py   | 14 +++-
- Lib/importlib/metadata/_itertools.py | 98 ++++++++++++++++++++++++++++
- 2 files changed, 110 insertions(+), 2 deletions(-)
-
-diff --git a/Lib/importlib/metadata/__init__.py b/Lib/importlib/metadata/_=
_init__.py
-index 8ce62dd..085378c 100644
---- a/Lib/importlib/metadata/__init__.py
-+++ b/Lib/importlib/metadata/__init__.py
-@@ -21,7 +21,7 @@ import collections
- from . import _meta
- from ._collections import FreezableDefaultDict, Pair
- from ._functools import method_cache, pass_none
--from ._itertools import always_iterable, unique_everseen
-+from ._itertools import always_iterable, bucket, unique_everseen
- from ._meta import PackageMetadata, SimplePath
-=20
- from contextlib import suppress
-@@ -404,7 +404,7 @@ class Distribution(DeprecatedNonAbstract):
-         if not name:
-             raise ValueError("A distribution name is required.")
-         try:
--            return next(iter(cls.discover(name=3Dname)))
-+            return next(iter(cls._prefer_valid(cls.discover(name=3Dname))=
))
-         except StopIteration:
-             raise PackageNotFoundError(name)
-=20
-@@ -428,6 +428,16 @@ class Distribution(DeprecatedNonAbstract):
-             resolver(context) for resolver in cls._discover_resolvers()
-         )
-=20
-+    @staticmethod
-+    def _prefer_valid(dists: Iterable[Distribution]) -> Iterable[Distribu=
tion]:
-+        """
-+        Prefer (move to the front) distributions that have metadata.
-+
-+        Ref python/importlib_resources#489.
-+        """
-+        buckets =3D bucket(dists, lambda dist: bool(dist.metadata))
-+        return itertools.chain(buckets[True], buckets[False])
-+
-     @staticmethod
-     def at(path: str | os.PathLike[str]) -> Distribution:
-         """Return a Distribution for the indicated metadata path.
-diff --git a/Lib/importlib/metadata/_itertools.py b/Lib/importlib/metadata=
/_itertools.py
-index d4ca9b9..79d3719 100644
---- a/Lib/importlib/metadata/_itertools.py
-+++ b/Lib/importlib/metadata/_itertools.py
-@@ -1,3 +1,4 @@
-+from collections import defaultdict, deque
- from itertools import filterfalse
-=20
-=20
-@@ -71,3 +72,100 @@ def always_iterable(obj, base_type=3D(str, bytes)):
-         return iter(obj)
-     except TypeError:
-         return iter((obj,))
-+
-+
-+# Copied from more_itertools 10.3
-+class bucket:
-+    """Wrap *iterable* and return an object that buckets the iterable int=
o
-+    child iterables based on a *key* function.
-+
-+        >>> iterable =3D ['a1', 'b1', 'c1', 'a2', 'b2', 'c2', 'b3']
-+        >>> s =3D bucket(iterable, key=3Dlambda x: x[0])  # Bucket by 1st=
 character
-+        >>> sorted(list(s))  # Get the keys
-+        ['a', 'b', 'c']
-+        >>> a_iterable =3D s['a']
-+        >>> next(a_iterable)
-+        'a1'
-+        >>> next(a_iterable)
-+        'a2'
-+        >>> list(s['b'])
-+        ['b1', 'b2', 'b3']
-+
-+    The original iterable will be advanced and its items will be cached u=
ntil
-+    they are used by the child iterables. This may require significant st=
orage.
-+
-+    By default, attempting to select a bucket to which no items belong  w=
ill
-+    exhaust the iterable and cache all values.
-+    If you specify a *validator* function, selected buckets will instead =
be
-+    checked against it.
-+
-+        >>> from itertools import count
-+        >>> it =3D count(1, 2)  # Infinite sequence of odd numbers
-+        >>> key =3D lambda x: x % 10  # Bucket by last digit
-+        >>> validator =3D lambda x: x in {1, 3, 5, 7, 9}  # Odd digits on=
ly
-+        >>> s =3D bucket(it, key=3Dkey, validator=3Dvalidator)
-+        >>> 2 in s
-+        False
-+        >>> list(s[2])
-+        []
-+
-+    """
-+
-+    def __init__(self, iterable, key, validator=3DNone):
-+        self._it =3D iter(iterable)
-+        self._key =3D key
-+        self._cache =3D defaultdict(deque)
-+        self._validator =3D validator or (lambda x: True)
-+
-+    def __contains__(self, value):
-+        if not self._validator(value):
-+            return False
-+
-+        try:
-+            item =3D next(self[value])
-+        except StopIteration:
-+            return False
-+        else:
-+            self._cache[value].appendleft(item)
-+
-+        return True
-+
-+    def _get_values(self, value):
-+        """
-+        Helper to yield items from the parent iterator that match *value*=
.
-+        Items that don't match are stored in the local cache as they
-+        are encountered.
-+        """
-+        while True:
-+            # If we've cached some items that match the target value, emi=
t
-+            # the first one and evict it from the cache.
-+            if self._cache[value]:
-+                yield self._cache[value].popleft()
-+            # Otherwise we need to advance the parent iterator to search =
for
-+            # a matching item, caching the rest.
-+            else:
-+                while True:
-+                    try:
-+                        item =3D next(self._it)
-+                    except StopIteration:
-+                        return
-+                    item_value =3D self._key(item)
-+                    if item_value =3D=3D value:
-+                        yield item
-+                        break
-+                    elif self._validator(item_value):
-+                        self._cache[item_value].append(item)
-+
-+    def __iter__(self):
-+        for item in self._it:
-+            item_value =3D self._key(item)
-+            if self._validator(item_value):
-+                self._cache[item_value].append(item)
-+
-+        yield from self._cache.keys()
-+
-+    def __getitem__(self, value):
-+        if not self._validator(value):
-+            return iter(())
-+
-+        return self._get_values(value)
diff --git a/meta/recipes-devtools/python/python3_3.14.7.bb b/meta/recipes-=
devtools/python/python3_3.15.0.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.14.7.bb
rename to meta/recipes-devtools/python/python3_3.15.0.bb
index f917edebd8..71a2973e20 100644
--- a/meta/recipes-devtools/python/python3_3.14.7.bb
+++ b/meta/recipes-devtools/python/python3_3.15.0.bb
@@ -18,19 +18,15 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.xz \
            file://makerace.patch \
            file://0001-sysconfig.py-use-platlibdir-also-for-purelib.patch =
\
            file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-mast=
e.patch \
-           file://valid-dists.patch \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
            file://0001-Update-test_sysconfig-for-posix_user-purelib.patch =
\
            file://0001-prefer-valid-entrypoints.patch \
-           file://0001-gh-146207-Add-support-for-OpenSSL-4.0.0.patch \
-           file://0002-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.patc=
h \
-           file://0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_got=
_eof.patch \
            "
 SRC_URI:append:class-native =3D " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-config=
u.patch \
            "
=20
-SRC_URI[sha256sum] =3D "3b48dac8fb59f62eaa67ac83c1eb12bda1b7a08406dd286e25=
2c11a66be27f81"
+SRC_URI[sha256sum] =3D "ba4bed1ba346b916890b76d9e320451420aa69f6408997d33c=
66482eeae3d575"
=20
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
@@ -41,7 +37,7 @@ inherit upstream-stable-release-point
=20
 CVE_PRODUCT =3D "python:python python_software_foundation:python cpython"
=20
-PYTHON_MAJMIN =3D "3.14"
+PYTHON_MAJMIN =3D "3.15"
=20
 S =3D "${UNPACKDIR}/Python-${PV}"
=20
@@ -61,6 +57,7 @@ DEPENDS =3D "\
     bzip2-replacement-native \
     expat \
     libffi \
+    mpdecimal \
     ncurses \
     openssl \
     sqlite3 \
@@ -75,7 +72,7 @@ DEPENDS =3D "\
 DEPENDS:append:class-target =3D " python3-native"
 DEPENDS:append:class-nativesdk =3D " python3-native"
=20
-EXTRA_OECONF =3D " --without-ensurepip --enable-shared --with-platlibdir=
=3D${baselib} --with-system-expat"
+EXTRA_OECONF =3D " --without-ensurepip --enable-shared --with-platlibdir=
=3D${baselib} --with-system-expat --with-system-libmpdec"
 EXTRA_OECONF:append:class-native =3D " --bindir=3D${bindir}/${PN}"
 EXTRA_OECONF:append:class-target =3D " --with-build-python=3Dnativepython3=
 PLATFORM_TRIPLET=3D${HOST_ARCH}-${HOST_OS}"
 EXTRA_OECONF:append:class-nativesdk =3D " --with-build-python=3Dnativepyth=
on3"

