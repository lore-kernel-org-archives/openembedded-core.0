Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 879F6C5DF8C
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 17:52:09 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.1])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1192.1787421126431531265
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2026 10:52:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Zcr/Z+CS;
 spf=pass (domain: est.tech, ip: 52.101.84.1, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PyoGzAxk85Ii8GqprTHFw3PWZGZF0s2B5iXJGLq4d1N6MHjY/aX28ztD7fduo175Lktj8FO2zGKs/GY3hbhwzrnSI3XduKaN5rXSR4DHu2y+gPlHa0/ZMvHkR1GksOBYxCwIhxHsVjp3kvCxBzajqUyTQ8ovo6RR7DKYqgLjNz6u3J/sg6hcyr05LOz5MERz/MwEOs6RzEe4JIvlEta4mkKhEE7bGioBBFXHzlp/LJ6RDvSijpKj3grbeUnHnE0iEZle5doP0OuSB4T20EauJa+ysIqMrgW0nuQWJ/ZhcfwTTM9A+JjZxbjtiwfNtHuKtow3hpF70XGrR68cKiUsFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8obRpt5bZC0XGtiklXI2aRsfhAiDJp+JXpX2O9ZL50=;
 b=vRmVVByAYeaDMNxYqPyibJwb9iXXTzhijgTQij4T/2Mm3oplisU4TElxFB3OTC8m8nzrNjG1TER6S58M+OZ9Afj3cP9fOt+ph/fR/u75ymadAr8bY0mXzNz5iwlBvehmyA7tuvOGc2FxZwbiBxeT6wyU9wYHwTgD5fVp9UHqWb0V3hUb/s8xja8IWojKC+kPOMc6hlGWjcV7YWllGr/Lg7JuRtDMIanPmI72gDpXVjXVkNAP8QNaC1/p5jD/mmRmiQfsAfsu+ALGslaE38pYO/FccZdOXbMJ5C448TmQ2vWlYfVAWWOjxSbvj7Ykkkz2PE0JDg10rTQ29Rtdv9bb3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8obRpt5bZC0XGtiklXI2aRsfhAiDJp+JXpX2O9ZL50=;
 b=Zcr/Z+CSDOTrk4oOdAWh44a0ZXXIvZ9Aq4CUhjxwcNEm2SfeQcbPVnL5H5GlfLcjPHhU2GnRxyOCsE1CDSrcxFo6CWaGl9Y3Mp1xNuHzLyPIaJKv4us7Nsa0zHWY7D41HeeXf83g7cy9fAkHwJ8KYz9RfBg75H2kJlkaUxBh6c3h6E/MRac5feLU1IMEK6eHvK898lAbsoj0LHtZA7/OkTCeLbG/Nip9R1hpIJy38ItVmkqhFvt9Arqm4ExPDaoSSU0zPsboqa9UkYnKwUZ9wgGG4EgBP4Bmi1COXrzQFQAKzhCi4Uy/wReA4ocubv87x1/xzwgPpYQcQelVBnPg5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM0P189MB0641.EURP189.PROD.OUTLOOK.COM (2603:10a6:208:1a2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.5; Sat, 22 Aug
 2026 17:52:04 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.003; Sat, 22 Aug 2026
 17:52:04 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [RFC v4 2/6] python3: backport OpenSSL 4.0 support from upstream
Date: Sat, 22 Aug 2026 19:51:56 +0200
Message-ID: <20260822175200.57534-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260822175200.57534-1-jaipaul.cheernam@est.tech>
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
 <20260822175200.57534-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0217.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::6) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM0P189MB0641:EE_
X-MS-Office365-Filtering-Correlation-Id: d64b71c6-bac0-4ac2-cc5b-08df0076133b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|23010399003|1800799024|376014|366016|13003099007|6133799003|3023799007|56012099006|10067099003|11063799006|4143699003|12006099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	saxgXzXFp7yuJor6We+zfxOAYJwurTofZnlBeFWxCcP+bNRkDv0Jz6kV58NBo7iE8n6XcHy0NGfOxaLF/orR25TYQyNQtWRZ8XDPKRDn3U3naFfrd2fKv8h22XQBpBNLRPF37W+mX/259wI6FKooYlvdbyzguE39NPqXSVEsV3o5U9GF3MDbZQNovu+Q+kSqQ9wls8O0V4Sz6VB4YWyDdes6a8Oh0mPFUXtd7ruMm0E/E+eS+OLAspdU/CqoGIa/nTki8oqBUposSwGF1Hq/9JeACTGxz2+kErx/yFgRqEMLjzYjDS8GjpJE+74ehixXCjrGUHBmCsnCJboD4WkdJFwjuQf4iYKejCvXixWVZB6+mMDyx2//ZrGHpjjp9vCf2QN87JR93aHfR7vqettjFThcNu+KpKenbdVcGOHC+NSQ7avDNwLREmKuPfvPwMTp1ddGQkbWRTkJh07d/gblXiYyeq2BC81HQ1CFr9eKn9YIQh+l/bZOFYGT+7X8LBlD9epy/jpolWu6ouujLnOtDzazpydBnRxziLnql+SBkX5X+K8s2k1RmesQzRDf5fohtaCAvFq2ZeLVtUAw1LUWpMZ5miGWiyDgIfe1PuxkaHY2E/eXHdyiC2a7Dh7h0XB8vXWnrdfg9ylQgi4uy25OcF7MBJOF+stQoGEY7Y01he0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(1800799024)(376014)(366016)(13003099007)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(4143699003)(12006099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?e9dmrnYW3C9U4kb8TGhM1qBt+0uWk3I2Zh/C9YPfGC9cbmx1K4F82t2TsMzA?=
 =?us-ascii?Q?XqJ6UYGYIZ4BBTRwwNTiMHB7fgP72I3SDonsvh1WA6S2qHSv0MSTB4xJyYgH?=
 =?us-ascii?Q?fm4YReiT91NnZtdyHBKyksnnEmmrTs/eey4Atno56vf56LTN3bZ/mAKg1nr1?=
 =?us-ascii?Q?1Z0H9JaZmF8gjMu9e52yGE8gLYxR/wPjk3mxARB65cGrj6WHawYMY0ztdsnU?=
 =?us-ascii?Q?8qj4ObUyKO+Y14VZTxWXio7ecsZ6POIyPppLmbRdj3TqHAtoc4DR9Vx6gSb0?=
 =?us-ascii?Q?Oon/G3fdvgzplSWw5vLPd9tAGmmdhXhEf7FlNwu6XZr6sCIVHn289wND2rW4?=
 =?us-ascii?Q?z1VXZEC3++1mh+2CTrELOgyDZMqcIUMXVm7DD1+1TKbiG853Y23+1IwHdVnU?=
 =?us-ascii?Q?JwcOX98+nOQTJ1f1cdj1TavG2xepNAV3yBo+oUFFhSq59eBnxouKSPyK7ow/?=
 =?us-ascii?Q?hU2+uX/YY4drSK1Tovr67peGlGz9FaAGyH00uiBavit9dFlU3HbTv7ZoGpyt?=
 =?us-ascii?Q?Iq8Gla4l5GvAtJQrhlsF/78QmCzl4nqFvopCxBu+90c2prZZK/OWDozUK64Y?=
 =?us-ascii?Q?NXRfqVVhQdDZWdkiA340RnVmuu93aymaZNKnno/n0ks/h2CStLt8qrjY8gVJ?=
 =?us-ascii?Q?rPKQpnytHn6lj9fp7Ui3zi2gJMR/eCjvmXVrVnGJds0qlzYAESW7G1DKElRs?=
 =?us-ascii?Q?GoREGCRvkPJVZKdokl5NVx2tH2AARaXtHGaRIRN7csBAFvPQGMCG5rAWMjHq?=
 =?us-ascii?Q?RS+WRJ8cWeoD8Cx1KWmIV62rE78sZdnXFSDHiwW/f1Gr84GF652xzE9uYLKi?=
 =?us-ascii?Q?VGaD0FgCW8abZfdKVtbjouGL2ouZlrMTImzYE+iGbfjdOs8aWyp6XvXzui43?=
 =?us-ascii?Q?NB4Y40n5EEcrVkr/2LdQ21uh8ZTV4ZTX1jJ6i4CuigqJgmmXRR9tHZpionye?=
 =?us-ascii?Q?yZSTb0DNs0q6Ce/Vs/UfZb7tvBwrWZQtLvYEMCQusV7M0pnL2ijTWoinUBoB?=
 =?us-ascii?Q?q9e6pyk+p31cxAP2XVdqQ1YzlZDZkf+q7G59c5tMjQE/1L2hCHsS2CSzfkWe?=
 =?us-ascii?Q?c/hA/tIIzkCnvU6P6AeSaOJ3SoxjeBIrLULFt7LLiFoObh1dSBX+OG6acvoK?=
 =?us-ascii?Q?JYv8gVYpgSRnd4S1axVTt/TuT5+LUytAXOGzeGrPJ2culkwOIBsvpaFEdLhC?=
 =?us-ascii?Q?ACFbyIBsTu7G27z0KIujCYn+ibwi8TYwr9KgOKaS03MTos/6YGGuHDemCuCd?=
 =?us-ascii?Q?p41dh40ouAT05EmL/XuZiDOKk19OqvrRcOhlGWjIK6Gdr+/kI9SAUV9sU9fQ?=
 =?us-ascii?Q?dg54a5sh9oD4XdzsYVD5/LxiiumVtU9qPSdC54zGV/VpcTbFKW1TwKjcLulz?=
 =?us-ascii?Q?w188Vve6jxxywSMW+fZkmOHynQXmFosWz/FEgBXDmq23doCZamLdH1mIxwMh?=
 =?us-ascii?Q?38UNwBGJqFBBuS5hmi8Ce4031AEb9c58/Z4XUyN8frZPvUijeOiEyjOcOBGu?=
 =?us-ascii?Q?p0TQ3SNR5vQ7tMuxI8GXd1DD9wZMGlhTwa+dYDLBwF1hjbcsIfhSxMjsi8bf?=
 =?us-ascii?Q?S8VEbpWeqtAdls2t0zn3nmidt31OfF0HyCdlEO+c93yLgXzKCnSjxe1HRSHv?=
 =?us-ascii?Q?+P5A/MWzTAU3TBy87TKV+9Rk1996gSA9khz/JUNUraxWxcye1WRqDqVIuGUl?=
 =?us-ascii?Q?XwVrHVkaPc+p8sh7FAxpmUw0TEpOHasx92LCQWIrWxoicZDtAMhIGoqLqWgN?=
 =?us-ascii?Q?Fc/O/X71PgjS8IHI8At702p74U6J6DKPIgDtj5rrZZbZY+Gm6gMviQoELSn8?=
X-MS-Exchange-AntiSpam-MessageData-1: uDDIiSKzplwpY2OmIo7Ay7ZSt6dvcIhoqLw=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d64b71c6-bac0-4ac2-cc5b-08df0076133b
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 17:52:03.9801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bEhBqDFd/mNVw1gnjLJJzmS1I09PjLyGIEt695Ff0SjcQTscjVdJdzZvNVsIYbSIVuKNScWM6f551RNnoXurs8UDLPhx8aIbC4+E4BxVRvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P189MB0641
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 17:52:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243994

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
 ...Update-_ssl._SSLSocket-for-OpenSSL-4.patch | 234 ++++++++++++++++
 ...utdown-test-in-test_ssl.test_got_eof.patch |  41 +++
 .../recipes-devtools/python/python3_3.14.7.bb |   3 +
 4 files changed, 535 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-gh-146207-Add=
-support-for-OpenSSL-4.0.0.patch
 create mode 100644 meta/recipes-devtools/python/python3/0002-gh-148292-Upd=
ate-_ssl._SSLSocket-for-OpenSSL-4.patch
 create mode 100644 meta/recipes-devtools/python/python3/0003-gh-148292-Rem=
ove-shutdown-test-in-test_ssl.test_got_eof.patch

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
diff --git a/meta/recipes-devtools/python/python3/0002-gh-148292-Update-_ss=
l._SSLSocket-for-OpenSSL-4.patch b/meta/recipes-devtools/python/python3/000=
2-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.patch
new file mode 100644
index 0000000000..587f141dd4
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0002-gh-148292-Update-_ssl._SSLS=
ocket-for-OpenSSL-4.patch
@@ -0,0 +1,234 @@
+From 3c2a3014af7d73cc34f2498f60fdf863d9bc7c6c Mon Sep 17 00:00:00 2001
+From: Victor Stinner <vstinner@python.org>
+Date: Mon, 4 May 2026 13:52:57 +0200
+Subject: [PATCH] gh-148292: Update _ssl._SSLSocket for OpenSSL 4 (#149102)
+
+The _SSLSocket object now remembers if it gets an EOF error. In this
+case, read(), sendfile(), write() and do_handshake method calls fail
+with SSLEOFError without calling the underlying OpenSSL function.
+
+Co-authored-by: Gregory P. Smith <greg@krypto.org>
+(cherry picked from commit 7b7fa3f9bf3d7cdf3eb669d02b386e05b39c402a)
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/3c2a30=
14af7d]
+
+Note: This is from the unmerged CPython PR #149783 which backports
+OpenSSL 4.0 support to the 3.14 branch. Upstream deferred merging
+until after Python 3.15.1 is released.
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ Lib/test/test_ssl.py                          | 82 +++++++++++++++++++
+ ...-04-28-17-47-55.gh-issue-148292.oIq3ml.rst |  7 ++
+ Modules/_ssl.c                                | 42 ++++++++++
+ 3 files changed, 131 insertions(+)
+ create mode 100644 Misc/NEWS.d/next/Library/2026-04-28-17-47-55.gh-issue-=
148292.oIq3ml.rst
+
+diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
+index 965dbc36f096499..03d9e3f9e5e96b5 100644
+--- a/Lib/test/test_ssl.py
++++ b/Lib/test/test_ssl.py
+@@ -2711,6 +2711,36 @@ def close(self):
+     def stop(self):
+         self.active =3D False
+=20
++class TestEOFServer(threading.Thread):
++    def __init__(self):
++        super().__init__()
++        self.listening =3D threading.Event()
++        self.address =3D None
++
++    def run(self):
++        context =3D ssl.create_default_context(ssl.Purpose.CLIENT_AUTH)
++        context.load_cert_chain(CERTFILE)
++        server_sock =3D socket.socket(socket.AF_INET, socket.SOCK_STREAM)
++        with server_sock:
++            server_sock.settimeout(support.SHORT_TIMEOUT)
++            server_sock.bind((HOST, 0))
++            server_sock.listen(5)
++
++            self.address =3D server_sock.getsockname()
++            self.listening.set()
++
++            sock, addr =3D server_sock.accept()
++            sslconn =3D context.wrap_socket(sock, server_side=3DTrue)
++            with sslconn:
++                request =3D b''
++                while chunk :=3D sslconn.recv(1024):
++                    request +=3D chunk
++                    if b'\n' in chunk:
++                        break
++
++                sslconn.sendall(b'server\n')
++                sslconn.shutdown(socket.SHUT_WR)
++
+ class AsyncoreEchoServer(threading.Thread):
+=20
+     # this one's based on asyncore.dispatcher
+@@ -4747,6 +4777,58 @@ def background(sock):
+                     if cm.exc_value is not None:
+                         raise cm.exc_value
+=20
++    def test_got_eof(self):
++        # gh-148292: Test that _ssl._SSLSocket behaves the same on all Op=
enSSL
++        # versions on calling methods after EOF (after the first SSLEOFEr=
ror).
++
++        server =3D TestEOFServer()
++        server.start()
++        if not server.listening.wait(support.SHORT_TIMEOUT):
++            raise RuntimeError("server took too long")
++        self.addCleanup(server.join)
++
++        context =3D ssl.create_default_context(cafile=3DCERTFILE)
++        sock =3D socket.socket(socket.AF_INET, socket.SOCK_STREAM)
++        sock.settimeout(support.SHORT_TIMEOUT)
++        sock.connect(server.address)
++        sslsock =3D context.wrap_socket(sock, server_hostname=3D'localhos=
t')
++        with sslsock:
++            sslsock.sendall(b'client\n')
++            # test the _ssl._SSLSocket object, not ssl.SSLSocket
++            sslobj =3D sslsock._sslobj
++
++            data =3D sslobj.read(1024)
++            self.assertEqual(data, b'server\n')
++
++            # The second read gets EOF error and sets got_eof_error to 1
++            with self.assertRaises(ssl.SSLEOFError):
++                sslobj.read(1024)
++
++            # Following read(), sendfile(), write() and do_handshake() ca=
lls
++            # must raise SSLEOFError
++            with self.assertRaises(ssl.SSLEOFError):
++                # The _SSLSocket remembers the previous EOF error
++                # and raises again SSLEOFError
++                sslobj.read(1024)
++            if hasattr(sslobj, 'sendfile'):
++                with open(__file__, "rb") as fp:
++                    with self.assertRaises(ssl.SSLEOFError):
++                        sslobj.sendfile(fp.fileno(), 0, 1)
++            with self.assertRaises(ssl.SSLEOFError):
++                sslobj.write(b'client2\n')
++            with self.assertRaises(ssl.SSLEOFError):
++                sslsock.do_handshake()
++
++            self.assertEqual(sslsock.pending(), 0)
++            try:
++                sslsock.shutdown(socket.SHUT_WR)
++            except OSError as exc:
++                self.assertEqual(exc.errno, errno.ENOTCONN)
++            else:
++                # On Windows and on OpenSSL 1.1.1, shutdown() doesn't
++                # raise an error
++                pass
++
+=20
+ @unittest.skipUnless(has_tls_version('TLSv1_3') and ssl.HAS_PHA,
+                      "Test needs TLS 1.3 PHA")
+diff --git a/Misc/NEWS.d/next/Library/2026-04-28-17-47-55.gh-issue-148292.=
oIq3ml.rst b/Misc/NEWS.d/next/Library/2026-04-28-17-47-55.gh-issue-148292.o=
Iq3ml.rst
+new file mode 100644
+index 000000000000000..e1f308df5a678e6
+--- /dev/null
++++ b/Misc/NEWS.d/next/Library/2026-04-28-17-47-55.gh-issue-148292.oIq3ml.=
rst
+@@ -0,0 +1,7 @@
++:mod:`ssl`: Update :class:`ssl.SSLSocket` and :class:`ssl.SSLObject` for
++OpenSSL 4. The classes now remember if they get a :exc:`ssl.SSLEOFError`.=
 In this
++case, following :meth:`~ssl.SSLSocket.read`, :meth:`!sendfile`,
++:meth:`~ssl.SSLSocket.write`, and :meth:`~ssl.SSLSocket.do_handshake` cal=
ls
++raise :exc:`ssl.SSLEOFError` without calling the underlying OpenSSL funct=
ion.
++Thanks to that, :class:`ssl.SSLSocket` behaves the same on all OpenSSL ve=
rsions
++on EOF.  Patch by Victor Stinner.
+diff --git a/Modules/_ssl.c b/Modules/_ssl.c
+index 1603d0ffd559559..376df32b7cb4bd6 100644
+--- a/Modules/_ssl.c
++++ b/Modules/_ssl.c
+@@ -352,6 +352,16 @@ typedef struct {
+      * and shutdown methods check for chained exceptions.
+      */
+     PyObject *exc;
++    // gh-148292: If non-zero, read(), sendfile(), write() and do_handsha=
ke()
++    // methods raise SSLEOFError without calling the underlying OpenSSL
++    // function. Set to 1 on PY_SSL_ERROR_EOF error.
++    //
++    // On OpenSSL 4, if SSL_read_ex() fails with
++    // SSL_R_UNEXPECTED_EOF_WHILE_READING, the following SSL_read_ex() ca=
ll
++    // fails with a generic protocol error (ERR_peek_last_error() returns=
 0).
++    // Use got_eof_error to have the same behavior on OpenSSL 4 and newer=
 and
++    // on OpenSSL 3 and older.
++    int got_eof_error;
+ } PySSLSocket;
+=20
+ #define PySSLSocket_CAST(op)    ((PySSLSocket *)(op))
+@@ -499,6 +509,10 @@ fill_and_set_sslerror(_sslmodulestate *state,
+     PyObject *init_value, *msg, *key;
+     PyUnicodeWriter *writer =3D NULL;
+=20
++    if (ssl_errno =3D=3D PY_SSL_ERROR_EOF && sslsock !=3D NULL) {
++        sslsock->got_eof_error =3D 1;
++    }
++
+     if (errcode !=3D 0) {
+         int lib, reason;
+=20
+@@ -654,6 +668,18 @@ PySSL_ChainExceptions(PySSLSocket *sslsock) {
+     return -1;
+ }
+=20
++
++static void
++set_eof_error(PySSLSocket *sslsock)
++{
++    _sslmodulestate *state =3D get_state_sock(sslsock);
++    fill_and_set_sslerror(state, sslsock, state->PySSLEOFErrorObject,
++                          PY_SSL_ERROR_EOF,
++                          "EOF occurred in violation of protocol",
++                          __LINE__, 0);
++}
++
++
+ static PyObject *
+ PySSL_SetError(PySSLSocket *sslsock, const char *filename, int lineno)
+ {
+@@ -901,6 +927,7 @@ newPySSLSocket(PySSLContext *sslctx, PySocketSockObjec=
t *sock,
+     self->server_hostname =3D NULL;
+     self->err =3D err;
+     self->exc =3D NULL;
++    self->got_eof_error =3D 0;
+=20
+     /* Make sure the SSL error state is initialized */
+     ERR_clear_error();
+@@ -1041,6 +1068,11 @@ _ssl__SSLSocket_do_handshake_impl(PySSLSocket *self=
)
+         BIO_set_nbio(SSL_get_wbio(self->ssl), nonblocking);
+     }
+=20
++    if (self->got_eof_error) {
++        set_eof_error(self);
++        goto error;
++    }
++
+     timeout =3D GET_SOCKET_TIMEOUT(sock);
+     has_timeout =3D (timeout > 0);
+     if (has_timeout) {
+@@ -2504,6 +2536,11 @@ _ssl__SSLSocket_write_impl(PySSLSocket *self, Py_bu=
ffer *b)
+         BIO_set_nbio(SSL_get_wbio(self->ssl), nonblocking);
+     }
+=20
++    if (self->got_eof_error) {
++        set_eof_error(self);
++        goto error;
++    }
++
+     timeout =3D GET_SOCKET_TIMEOUT(sock);
+     has_timeout =3D (timeout > 0);
+     if (has_timeout) {
+@@ -2644,6 +2681,11 @@ _ssl__SSLSocket_read_impl(PySSLSocket *self, Py_ssi=
ze_t len,
+         Py_INCREF(sock);
+     }
+=20
++    if (self->got_eof_error) {
++        set_eof_error(self);
++        goto error;
++    }
++
+     if (!group_right_1) {
+         dest =3D PyBytes_FromStringAndSize(NULL, len);
+         if (dest =3D=3D NULL)
diff --git a/meta/recipes-devtools/python/python3/0003-gh-148292-Remove-shu=
tdown-test-in-test_ssl.test_got_eof.patch b/meta/recipes-devtools/python/py=
thon3/0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_got_eof.patch
new file mode 100644
index 0000000000..af067f549c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0003-gh-148292-Remove-shutdown-t=
est-in-test_ssl.test_got_eof.patch
@@ -0,0 +1,41 @@
+From 81911909bc439d6de8ce6a173b0691b3c58e9e1a Mon Sep 17 00:00:00 2001
+From: Victor Stinner <vstinner@python.org>
+Date: Mon, 4 May 2026 16:20:25 +0200
+Subject: [PATCH] gh-148292: Remove shutdown() test in test_ssl.test_got_eo=
f()
+ (#149366)
+
+The shutdown() behavior depends too much on the operating system and
+it's unrelated to the got_eof_error change.
+
+(cherry picked from commit 1e21cf6fee3830012e458c0fe5dbc6fcd45ace92)
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/819119=
09bc43]
+
+Note: This is from the unmerged CPython PR #149783 which backports
+OpenSSL 4.0 support to the 3.14 branch. Upstream deferred merging
+until after Python 3.15.1 is released.
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ Lib/test/test_ssl.py | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
+index 03d9e3f9e5e96b5..6445f122b4272be 100644
+--- a/Lib/test/test_ssl.py
++++ b/Lib/test/test_ssl.py
+@@ -4820,14 +4820,6 @@ def test_got_eof(self):
+                 sslsock.do_handshake()
+=20
+             self.assertEqual(sslsock.pending(), 0)
+-            try:
+-                sslsock.shutdown(socket.SHUT_WR)
+-            except OSError as exc:
+-                self.assertEqual(exc.errno, errno.ENOTCONN)
+-            else:
+-                # On Windows and on OpenSSL 1.1.1, shutdown() doesn't
+-                # raise an error
+-                pass
+=20
+=20
+ @unittest.skipUnless(has_tls_version('TLSv1_3') and ssl.HAS_PHA,
diff --git a/meta/recipes-devtools/python/python3_3.14.7.bb b/meta/recipes-=
devtools/python/python3_3.14.7.bb
index 568e632278..18373e5b5e 100644
--- a/meta/recipes-devtools/python/python3_3.14.7.bb
+++ b/meta/recipes-devtools/python/python3_3.14.7.bb
@@ -22,6 +22,9 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pytho=
n-${PV}.tar.xz \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
            file://0001-Update-test_sysconfig-for-posix_user-purelib.patch =
\
            file://0001-prefer-valid-entrypoints.patch \
+           file://0001-gh-146207-Add-support-for-OpenSSL-4.0.0.patch \
+           file://0002-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.patc=
h \
+           file://0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_got=
_eof.patch \
            "
 SRC_URI:append:class-native =3D " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-config=
u.patch \

