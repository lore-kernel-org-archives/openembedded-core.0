Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A1E7C5DF82
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 18:10:38 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.25])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.165.1787249429774855731
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 11:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=nVp0aFV4;
 spf=pass (domain: est.tech, ip: 40.107.159.25, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=clXDZpX4DgncBlxEf8OgB9j8otbzcKSyYFtMMV2oNrXfTUX+3WwrA/0lht0nzpv5y+mJ+0Pf1oQmzJqGTHq9CylS4Bo8icjY39af8hMRhjJuvp88cs9hC/QSLsD32uyaSyKsaWxyIy0vs0UGVxXG8HaHeslunVEa6yAy98y1n2ZPQ8FFa1zHADEiPhrFpml+OJkMOPKKRq9nYSljfWLCQnrRLIiqJf7HQQSSRC7OTW4uB+4lMHMdSuG/UaQmx5Kv2eM4kWTHgAlO+ApRa83tHSdqQyJNS+xZ4ClSHfGKaalXWLKncF7vEM4RRXMA7aG6oPdpfM2OOO1NDyC9gkoStA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qpHYV8LMAixTf+bQhNGEcC8tGMvZSUqFZU7fquoUUbU=;
 b=R98FEt3kZczY4t1F6WoUyBZL9IRH75x7yO0VJQvAW0AUMHMduQ54lXkTU99kOpLYkgFonCVSVqIFkNAhr9Qg6IScsC5cyCbUIt1V5NQNznq2Ea5tdl0NKHSwC0SAIg3C1w8bIGFKonyeqclRxyCngd65HB2erP96ejl3QukfkkVbIKEIG3qqpNBmKNcV1SR0GIVjnV2Zb7hbt8TUQW2O0/peiSpBjPxpczX07jRz6ISSIMR1X6sifEWuqUJ2HpnRAPfANN+aR/zl+Cz2fZrKRajw9yxb1H2n835v0KoFXXAPvHaYwNw0zNTvR76fTaL0HWHiTWX0LDoiJuxPMwiDeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpHYV8LMAixTf+bQhNGEcC8tGMvZSUqFZU7fquoUUbU=;
 b=nVp0aFV4X9TTtG4ZVSM0WvZiQ7NtJ5zawyleAL7tC38yD/jVCOwVpFo8ouCmUf4cwjiy1PixecgO2LsI3bS/n3qADm3HT2hiK7JMCX/XKn0Ki2gu1yE5hfzFHppSZoQLwvSMZ0MzWBNH5IMOYTT0mKGDTuYW+45xb6Yrdz29N4wvaRqTGe+oJvyF+WBx68vnJT3cDqgzSbI1FYEvb4RiCKKAkqDwXPOXyaHZTvvG7Mei+yrGXMQ4Ch+A7QR/j/NdXvWEL8RbQ/cZ9I2S4pHO3XBiTqOHQhSbQMI+aP+wt3ZrgRl6qOvpJJwNK/q4Gv8UzGF8osXySGD58tvR/IO4uA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV1P189MB2954.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:263::18)
 by PA1P189MB2702.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:452::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 18:10:29 +0000
Received: from GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
 ([fe80::a7e4:7d5b:ab4a:4b96]) by GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
 ([fe80::a7e4:7d5b:ab4a:4b96%4]) with mapi id 15.21.0360.003; Thu, 20 Aug 2026
 18:10:29 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [RFC v2 2/6] python3: backport OpenSSL 4.0 support from upstream
Date: Thu, 20 Aug 2026 20:10:18 +0200
Message-ID: <20260820181022.44434-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260820181022.44434-1-jaipaul.cheernam@est.tech>
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
 <20260820181022.44434-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0206.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::21) To GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:263::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1P189MB2954:EE_|PA1P189MB2702:EE_
X-MS-Office365-Filtering-Correlation-Id: 963f1bed-1e8b-41f2-7d5c-08defee6514b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|10070799003|23010399003|1800799024|376014|10067099003|56012099006|6133799003|12006099003|3023799007|11063799006|22082099003|18002099003|13003099007|4143699003;
X-Microsoft-Antispam-Message-Info: 
	S4cDRudVTYc4/er/P44m6eslwBj2EZYWjIn7WBajomFkmunRn1pyhNEuhC5UXhYjSZcM3RkvRMfJRDSVdwPx6p6S0QNuRXWoqEdPBVlN4rY+FCrDZNvMi2t+c/hpttxWeW1PxDvMZVvZY2wuVhKHYddYOrMKxXUM2h0Xy1AiJcupsIZMBbt2vRXrqr8G3wuu6imoXmVjOqBacVUtpLVIiAU8F460Mf2WWwyHLawXAcN1ctk+DS9RLdrsJL/AlUxcRlFSsbvvPz5yMuT/Vm155FSBIt4WJUOeEEtwIYaXMK1wCfULFTa7CTOG4xlRdB6wqMgzcpj+RVhI0J/6fY6eW14qrriv34OVn0gUajDBcfKFO3m0PFkJz2PeSV9IHbLLNQmjjm1XDf9GujXOU2BcnxCWneFCfoZNYz1k5XmQh31eAmhQdSbpsX+i1IrLt/jxjmj7K6EdUfuEog0ric5OTUeBDZmkNpm+E5zJmw4dvZZtvq5zVJOm3IQesOZUNApG4x8UkpSBbv+jtXM/gYmLymtZ16W7C9/7cFDq5+B9JH1A+gcL5iR20JkVYCtbLnF4HbN6o4LdvRABZYjKNg20uosoFKqLRYAtdyvRMxWGfr0f7rFeDDvynoxJi9Dt+IyO1wXnPfIsElgyXsE4MSF7hnGgqEfBVrVm/jBWKp6AJ4Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1P189MB2954.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(6133799003)(12006099003)(3023799007)(11063799006)(22082099003)(18002099003)(13003099007)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vpL64y9/kXSzBrGI/UOvz1O/+hqMWYwGkTKRw27kWuze29QMjfre+jGn1Szb?=
 =?us-ascii?Q?fVfP18bfeL6SY6dw3jywlUFls5ZKjLYuziWoQEyHNmtFpfJZmgOzJvod4oP4?=
 =?us-ascii?Q?1y1i7XgQPBCVm1orBmENumFW1nWYBGPHyUwt3L2SMB4aSLnVUwVgRhL/5Z3K?=
 =?us-ascii?Q?Pof8EyIOixIIlxsMM4pwSoXT2t5ywDfufaouwfXd+2/hM6fSCKVS5Rt49G8z?=
 =?us-ascii?Q?8iE8/FYINpUYJPWfSBU6+PFJplHNxBDgAvOVRSXWxL3mp09EzMSB2+L7Qg17?=
 =?us-ascii?Q?UXYmlMXZlAGculuWxrTxeggK7zE5SyqEHGi8sSf1lqyd7r5qF/s8u/dlMJ1C?=
 =?us-ascii?Q?VsHtpfNgzkbiF/ImJyyHXKrgx7n5V0BJEaKhSwCyS7GJGAOuCWSmnZTgB39z?=
 =?us-ascii?Q?QNJ3hUaIzwtFTJn8ldr7wBMA6fdcwkiWUAOOaOtkebeiwNCqI+QVwSTKHzVu?=
 =?us-ascii?Q?wyNrgyq434LPLrzAoA9/RMlvXVNt37egelxG7SAN/lT8Ca7HO0oHXJaJ51Qj?=
 =?us-ascii?Q?o9ByJAqVZdCtb0hOsjI3WDtLMKao6G7WFigxngFrsx50eTvC9Z7qN2LMsbe8?=
 =?us-ascii?Q?B3q0SmQdddrkSm2FlWDWyVaGAy6EMkpFfssBSt7hsHoS0bQW8ji9dc2vqdUV?=
 =?us-ascii?Q?okPO7Nc+55FviiWGQfVBxQeD79paHFds/VXdeQg2GHHF+0Y3QiECoAYg7467?=
 =?us-ascii?Q?0fkEZPAWqE1F/Sb8x+xZ91GxCL88GFSz1Vl9U9zU6lf5eYxYaJ/Mx74j5b6P?=
 =?us-ascii?Q?ymEz8s2A5YsgewzPigVAZLkrvqmsw6ztHc3b4nrGECFA8X6tFSMHXtJyMOSp?=
 =?us-ascii?Q?dNufvWaT8wUJNdbelmIp0ZuYVQ8xhxJwyMQV5Qt0ej62bxhtrNQsb6x2w9u2?=
 =?us-ascii?Q?4WJ3B46KLFe7kKkRThZLCfVHaSckUvbBKcHQXWEWySaZzBNRoxA5lBpyIdQ5?=
 =?us-ascii?Q?o8KLnhvmBQn3lJTKW2KO0dV5wMoh6NNVPSPUYYErNJBOSrMP9NzqAlc0i7H5?=
 =?us-ascii?Q?F6IEDZrJYzpm/VuF0eahQlD7ArLEgn9bGf9GmjVIWyTtGjG1kaVFWuyfMHKR?=
 =?us-ascii?Q?PtlFVVqd9ayf5ymfwuC60uEicCyWR92/SCHswemB8CivWIRwCof+Acxwtxkw?=
 =?us-ascii?Q?1078QDGSXxH+cWhNZz5XOatJdpl0vMJXJn18QGIyjejG52UxYBchPSAItlDH?=
 =?us-ascii?Q?h5acgboZ+SKm9bIRxZ6X8YizuccE+quTVBt8Ne9aeNXhue/8nPl9vVIfvgOG?=
 =?us-ascii?Q?reb8UnqkCLILMKBVcsMD8xneY3/AUID2bKTWskK4OxphpgE7m+MQgpgelgoD?=
 =?us-ascii?Q?qjrCHIL5hCiBr+4/CKCR3dE7jpM5396HyN2fvAr1zHiv4ufnCQZ5CN45jV+6?=
 =?us-ascii?Q?lgzDdp54c9mWctEtHfybibC2xvh8fhKbcYe2plD4ItSDgH4MKIOVZgmQpPt1?=
 =?us-ascii?Q?hrPLVWvywNfgjDW9N98Y0inApKy3OR7drPoTftiyT5SuT+WZCx/GDgu1JQet?=
 =?us-ascii?Q?EWVQUM7fINBtbtAj+w+KX95uBArXYR8PGy8QvqmwGydxM6Sx/znE3Z+hsmFX?=
 =?us-ascii?Q?YC4c8ftSLXffLWnTMEEoZE/46OxxfJNyP+EoL3dGdm5UOM+VcNBeNNWHqj9o?=
 =?us-ascii?Q?HH2cF9+m6LH/PhuAjcZVsEz2zr6/jujBiplyvdXUshpxj4/duy3Nq0SRG87X?=
 =?us-ascii?Q?22jhFrID9ZxOsRHOCgFfmrsrRcJlv/ulT2sXXZzafDlnjxrDLLNVJbAlor1U?=
 =?us-ascii?Q?ldxJ86orVjZ0Ug41OmXFb1xjySR67FouUAj3a2LYyKF6lufKSH3mtGmaJq1a?=
X-MS-Exchange-AntiSpam-MessageData-1: NT/M4Q7cvo+F0TmaBpa5UezWmh8+RoAX3z0=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 963f1bed-1e8b-41f2-7d5c-08defee6514b
X-MS-Exchange-CrossTenant-AuthSource: GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 18:10:29.4368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t1JQ/brsSg2uerHepbtnJWAMhdUiAc+2i6CgTHvabO+ZdRpZEBpfIH5h9tXjlKTTt6WNaRvEwb+sVCkAy0YXK5UNzlOll77n8+d+4IRaVQw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB2702
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 18:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243876

Backport CPython commit 3364e7e62fa24d0e19133fb0f90b1c24ef1110c5:

    gh-146207: Add support for OpenSSL 4.0.0 alpha1 (#146217)

    OpenSSL 4.0.0 alpha1 removed these functions:

    * SSLv3_method()
    * TLSv1_method()
    * TLSv1_1_method()
    * TLSv1_2_method()

    Other changes:

    * Update test_openssl_version().
    * Update multissltests.py for OpenSSL 4.
    * Add const qualifier to fix compiler warnings.

    Co-authored-by: B=C3=A9n=C3=A9dikt Tran <10796600+picnixz@users.noreply=
.github.com>

Upstream-Status: Backport [https://github.com/python/cpython/commit/3364e7e=
62fa24d0e19133fb0f90b1c24ef1110c5]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...146207-Add-support-for-OpenSSL-4.0.0.patch | 257 ++++++++++++++++++
 .../recipes-devtools/python/python3_3.14.7.bb |   1 +
 2 files changed, 258 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-gh-146207-Add=
-support-for-OpenSSL-4.0.0.patch

diff --git a/meta/recipes-devtools/python/python3/0001-gh-146207-Add-suppor=
t-for-OpenSSL-4.0.0.patch b/meta/recipes-devtools/python/python3/0001-gh-14=
6207-Add-support-for-OpenSSL-4.0.0.patch
new file mode 100644
index 0000000000..bef6044358
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-gh-146207-Add-support-for-O=
penSSL-4.0.0.patch
@@ -0,0 +1,257 @@
+From 3364e7e62fa24d0e19133fb0f90b1c24ef1110c5 Mon Sep 17 00:00:00 2001
+From: Victor Stinner <vstinner@python.org>
+Date: Wed, 25 Mar 2026 07:44:47 +0100
+Subject: [PATCH] gh-146207: Add support for OpenSSL 4.0.0 alpha1 (#146217)
+
+OpenSSL 4.0.0 alpha1 removed these functions:
+
+* SSLv3_method()
+* TLSv1_method()
+* TLSv1_1_method()
+* TLSv1_2_method()
+
+Other changes:
+
+* Update test_openssl_version().
+* Update multissltests.py for OpenSSL 4.
+* Add const qualifier to fix compiler warnings.
+
+Co-authored-by: B=C3=A9n=C3=A9dikt Tran <10796600+picnixz@users.noreply.gi=
thub.com>
+Signed-off-by: Victor Stinner <vstinner@python.org>
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/3364e7=
e62fa24d0e19133fb0f90b1c24ef1110c5]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ Lib/test/test_ssl.py       | 52 ++++++++++++++++++++------------------
+ Modules/_ssl.c             | 27 ++++++++++++++++----
+ Modules/_ssl/cert.c        |  3 ++-
+ Tools/ssl/multissltests.py |  7 ++++-
+ 4 files changed, 58 insertions(+), 31 deletions(-)
+
+diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
+index dc795c6bd8a..61355927296 100644
+--- a/Lib/test/test_ssl.py
++++ b/Lib/test/test_ssl.py
+@@ -395,7 +395,7 @@ def test_constants(self):
+         ssl.OP_NO_COMPRESSION
+         self.assertEqual(ssl.HAS_SNI, True)
+         self.assertEqual(ssl.HAS_ECDH, True)
+-        self.assertEqual(ssl.HAS_TLSv1_2, True)
++        self.assertIsInstance(ssl.HAS_TLSv1_2, bool)
+         self.assertEqual(ssl.HAS_TLSv1_3, True)
+         ssl.OP_NO_SSLv2
+         ssl.OP_NO_SSLv3
+@@ -586,11 +586,11 @@ def test_openssl_version(self):
+         # Some sanity checks follow
+         # >=3D 1.1.1
+         self.assertGreaterEqual(n, 0x10101000)
+-        # < 4.0
+-        self.assertLess(n, 0x40000000)
++        # < 5.0
++        self.assertLess(n, 0x50000000)
+         major, minor, fix, patch, status =3D t
+         self.assertGreaterEqual(major, 1)
+-        self.assertLess(major, 4)
++        self.assertLess(major, 5)
+         self.assertGreaterEqual(minor, 0)
+         self.assertLess(minor, 256)
+         self.assertGreaterEqual(fix, 0)
+@@ -656,12 +656,14 @@ def test_openssl111_deprecations(self):
+             ssl.OP_NO_TLSv1_2,
+             ssl.OP_NO_TLSv1_3
+         ]
+-        protocols =3D [
+-            ssl.PROTOCOL_TLSv1,
+-            ssl.PROTOCOL_TLSv1_1,
+-            ssl.PROTOCOL_TLSv1_2,
+-            ssl.PROTOCOL_TLS
+-        ]
++        protocols =3D []
++        if hasattr(ssl, 'PROTOCOL_TLSv1'):
++            protocols.append(ssl.PROTOCOL_TLSv1)
++        if hasattr(ssl, 'PROTOCOL_TLSv1_1'):
++            protocols.append(ssl.PROTOCOL_TLSv1_1)
++        if hasattr(ssl, 'PROTOCOL_TLSv1_2'):
++            protocols.append(ssl.PROTOCOL_TLSv1_2)
++        protocols.append(ssl.PROTOCOL_TLS)
+         versions =3D [
+             ssl.TLSVersion.SSLv3,
+             ssl.TLSVersion.TLSv1,
+@@ -1205,6 +1207,7 @@ def test_min_max_version(self):
+                 ssl.TLSVersion.TLSv1,
+                 ssl.TLSVersion.TLSv1_1,
+                 ssl.TLSVersion.TLSv1_2,
++                ssl.TLSVersion.TLSv1_3,
+                 ssl.TLSVersion.SSLv3,
+             }
+         )
+@@ -1218,7 +1221,7 @@ def test_min_max_version(self):
+         with self.assertRaises(ValueError):
+             ctx.minimum_version =3D 42
+=20
+-        if has_tls_protocol(ssl.PROTOCOL_TLSv1_1):
++        if has_tls_protocol('PROTOCOL_TLSv1_1'):
+             ctx =3D ssl.SSLContext(ssl.PROTOCOL_TLSv1_1)
+=20
+             self.assertIn(
+@@ -1675,23 +1678,24 @@ def test__create_stdlib_context(self):
+         self.assertFalse(ctx.check_hostname)
+         self._assert_context_options(ctx)
+=20
+-        if has_tls_protocol(ssl.PROTOCOL_TLSv1):
++        if has_tls_protocol('PROTOCOL_TLSv1'):
+             with warnings_helper.check_warnings():
+                 ctx =3D ssl._create_stdlib_context(ssl.PROTOCOL_TLSv1)
+             self.assertEqual(ctx.protocol, ssl.PROTOCOL_TLSv1)
+             self.assertEqual(ctx.verify_mode, ssl.CERT_NONE)
+             self._assert_context_options(ctx)
+=20
+-        with warnings_helper.check_warnings():
+-            ctx =3D ssl._create_stdlib_context(
+-                ssl.PROTOCOL_TLSv1_2,
+-                cert_reqs=3Dssl.CERT_REQUIRED,
+-                check_hostname=3DTrue
+-            )
+-        self.assertEqual(ctx.protocol, ssl.PROTOCOL_TLSv1_2)
+-        self.assertEqual(ctx.verify_mode, ssl.CERT_REQUIRED)
+-        self.assertTrue(ctx.check_hostname)
+-        self._assert_context_options(ctx)
++        if has_tls_protocol('PROTOCOL_TLSv1_2'):
++            with warnings_helper.check_warnings():
++                ctx =3D ssl._create_stdlib_context(
++                    ssl.PROTOCOL_TLSv1_2,
++                    cert_reqs=3Dssl.CERT_REQUIRED,
++                    check_hostname=3DTrue
++                )
++            self.assertEqual(ctx.protocol, ssl.PROTOCOL_TLSv1_2)
++            self.assertEqual(ctx.verify_mode, ssl.CERT_REQUIRED)
++            self.assertTrue(ctx.check_hostname)
++            self._assert_context_options(ctx)
+=20
+         ctx =3D ssl._create_stdlib_context(purpose=3Dssl.Purpose.CLIENT_A=
UTH)
+         self.assertEqual(ctx.protocol, ssl.PROTOCOL_TLS_SERVER)
+@@ -3654,10 +3658,10 @@ def test_protocol_tlsv1_2(self):
+                            client_options=3Dssl.OP_NO_TLSv1_2)
+=20
+         try_protocol_combo(ssl.PROTOCOL_TLS, ssl.PROTOCOL_TLSv1_2, 'TLSv1=
.2')
+-        if has_tls_protocol(ssl.PROTOCOL_TLSv1):
++        if has_tls_protocol('PROTOCOL_TLSv1'):
+             try_protocol_combo(ssl.PROTOCOL_TLSv1_2, ssl.PROTOCOL_TLSv1, =
False)
+             try_protocol_combo(ssl.PROTOCOL_TLSv1, ssl.PROTOCOL_TLSv1_2, =
False)
+-        if has_tls_protocol(ssl.PROTOCOL_TLSv1_1):
++        if has_tls_protocol('PROTOCOL_TLSv1_1'):
+             try_protocol_combo(ssl.PROTOCOL_TLSv1_2, ssl.PROTOCOL_TLSv1_1=
, False)
+             try_protocol_combo(ssl.PROTOCOL_TLSv1_1, ssl.PROTOCOL_TLSv1_2=
, False)
+=20
+diff --git a/Modules/_ssl.c b/Modules/_ssl.c
+index b45295b4c0c..6f75af86113 100644
+--- a/Modules/_ssl.c
++++ b/Modules/_ssl.c
+@@ -164,6 +164,17 @@ static void _PySSLFixErrno(void) {
+ #error Unsupported OpenSSL version
+ #endif
+=20
++#if (OPENSSL_VERSION_NUMBER >=3D 0x40000000L)
++#  define OPENSSL_NO_SSL3
++#  define OPENSSL_NO_TLS1
++#  define OPENSSL_NO_TLS1_1
++#  define OPENSSL_NO_TLS1_2
++#  define OPENSSL_NO_SSL3_METHOD
++#  define OPENSSL_NO_TLS1_METHOD
++#  define OPENSSL_NO_TLS1_1_METHOD
++#  define OPENSSL_NO_TLS1_2_METHOD
++#endif
++
+ /* OpenSSL API 1.1.0+ does not include version methods */
+ #ifndef OPENSSL_NO_SSL3_METHOD
+ extern const SSL_METHOD *SSLv3_method(void);
+@@ -1151,7 +1162,7 @@ _asn1obj2py(_sslmodulestate *state, const ASN1_OBJEC=
T *name, int no_name)
+=20
+ static PyObject *
+ _create_tuple_for_attribute(_sslmodulestate *state,
+-                            ASN1_OBJECT *name, ASN1_STRING *value)
++                            const ASN1_OBJECT *name, const ASN1_STRING *v=
alue)
+ {
+     Py_ssize_t buflen;
+     PyObject *pyattr;
+@@ -1180,16 +1191,16 @@ _create_tuple_for_attribute(_sslmodulestate *state=
,
+ }
+=20
+ static PyObject *
+-_create_tuple_for_X509_NAME (_sslmodulestate *state, X509_NAME *xname)
++_create_tuple_for_X509_NAME(_sslmodulestate *state, const X509_NAME *xnam=
e)
+ {
+     PyObject *dn =3D NULL;    /* tuple which represents the "distinguishe=
d name" */
+     PyObject *rdn =3D NULL;   /* tuple to hold a "relative distinguished =
name" */
+     PyObject *rdnt;
+     PyObject *attr =3D NULL;   /* tuple to hold an attribute */
+     int entry_count =3D X509_NAME_entry_count(xname);
+-    X509_NAME_ENTRY *entry;
+-    ASN1_OBJECT *name;
+-    ASN1_STRING *value;
++    const X509_NAME_ENTRY *entry;
++    const ASN1_OBJECT *name;
++    const ASN1_STRING *value;
+     int index_counter;
+     int rdn_level =3D -1;
+     int retcode;
+@@ -6967,9 +6978,15 @@ sslmodule_init_constants(PyObject *m)
+     ADD_INT_CONST("PROTOCOL_TLS", PY_SSL_VERSION_TLS);
+     ADD_INT_CONST("PROTOCOL_TLS_CLIENT", PY_SSL_VERSION_TLS_CLIENT);
+     ADD_INT_CONST("PROTOCOL_TLS_SERVER", PY_SSL_VERSION_TLS_SERVER);
++#ifndef OPENSSL_NO_TLS1
+     ADD_INT_CONST("PROTOCOL_TLSv1", PY_SSL_VERSION_TLS1);
++#endif
++#ifndef OPENSSL_NO_TLS1_1
+     ADD_INT_CONST("PROTOCOL_TLSv1_1", PY_SSL_VERSION_TLS1_1);
++#endif
++#ifndef OPENSSL_NO_TLS1_2
+     ADD_INT_CONST("PROTOCOL_TLSv1_2", PY_SSL_VERSION_TLS1_2);
++#endif
+=20
+ #define ADD_OPTION(NAME, VALUE) if (sslmodule_add_option(m, NAME, (VALUE)=
) < 0) return -1
+=20
+diff --git a/Modules/_ssl/cert.c b/Modules/_ssl/cert.c
+index f2e7be89668..061b0fb3171 100644
+--- a/Modules/_ssl/cert.c
++++ b/Modules/_ssl/cert.c
+@@ -128,7 +128,8 @@ _ssl_Certificate_get_info_impl(PySSLCertificate *self)
+ }
+=20
+ static PyObject*
+-_x509name_print(_sslmodulestate *state, X509_NAME *name, int indent, unsi=
gned long flags)
++_x509name_print(_sslmodulestate *state, const X509_NAME *name,
++                int indent, unsigned long flags)
+ {
+     PyObject *res;
+     BIO *biobuf;
+diff --git a/Tools/ssl/multissltests.py b/Tools/ssl/multissltests.py
+index 3b4507c6771..48207e5330f 100755
+--- a/Tools/ssl/multissltests.py
++++ b/Tools/ssl/multissltests.py
+@@ -429,9 +429,11 @@ def _post_install(self):
+     def _post_install(self):
+         if self.version.startswith("3."):
+             self._post_install_3xx()
++        elif self.version.startswith("4."):
++            self._post_install_4xx()
+=20
+     def _build_src(self, config_args=3D()):
+-        if self.version.startswith("3."):
++        if self.version.startswith(("3.", "4.")):
+             config_args +=3D ("enable-fips",)
+         super()._build_src(config_args)
+=20
+@@ -447,6 +449,9 @@ def _post_install_3xx(self):
+             lib64 =3D self.lib_dir + "64"
+             os.symlink(lib64, self.lib_dir)
+=20
++    def _post_install_4xx(self):
++        self._post_install_3xx()
++
+     @property
+     def short_version(self):
+         """Short version for OpenSSL download URL"""
+--=20
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3_3.14.7.bb b/meta/recipes-=
devtools/python/python3_3.14.7.bb
index 53a9ca59b5..18afbc3d2e 100644
--- a/meta/recipes-devtools/python/python3_3.14.7.bb
+++ b/meta/recipes-devtools/python/python3_3.14.7.bb
@@ -22,6 +22,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pytho=
n-${PV}.tar.xz \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
            file://0001-Update-test_sysconfig-for-posix_user-purelib.patch =
\
            file://0001-prefer-valid-entrypoints.patch \
+           file://0001-gh-146207-Add-support-for-OpenSSL-4.0.0.patch \
            "
 SRC_URI:append:class-native =3D " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-config=
u.patch \

