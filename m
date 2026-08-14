Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00074C5CFCF
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 05:18:45 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6891.1786684720015305589
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 22:18:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Tt/jBHLD;
 spf=pass (domain: est.tech, ip: 52.101.83.51, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q/Hb4V/2RBbte+sd0kmxy6wLUV7jF/pfoUvb4oFGvAyYGcTOZET8QgM/IYVng3GZeRvz8qpxmYfQndbbVxQ2tVyw4pamVgO+spK8NEGyQ0KYuEcpJur3eerwf8I+AbxJVNvwJM4qzgtAJMk6X6100dv7LeCBJMcgxBxFyKyddorZR9qmhfMcV+b+zq3xMV0svvweyHFYMTBnMc9W4RhaguRHlx//3nsTsOwznUZLTv2/bep6JZNtyfOvdSY2lIkN0o3B5mlVGSIuPV13kgs02ZQDXJToNiJQ+oJ0T9ApSF++1u0QOA4fFqkD2/qOdvEAjdAcjGEcNrZLpkyBUIu82w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4kUzgUEDxKMzXz32gHtThnYiomXB/HHNABOdJyAPHg4=;
 b=Eoq6AbCMxIs4C/pb56d4ly3QM6/dmSpdbGofBsEf7EDIIMa3ZL7DxhZSPy3uWk+bAisrzkXWbTt0BtPc2SF39953MfT0YRr/YGNXweSN2BUvVfWS1sChWkxsgYkSWgNmJI4y49XGmipbJpSWaSVEM0JNkYQtNBY0rpyWdnyBpsrVimDwxsAnDHmt47KTRy8DktkqzWsEvuF4erDuegbbYB+XO945MftUhgwBPXV27J3EJB3YdyB/EWDGwAaFhgiVQ9zb8HSBO1aoI40uJstLzuzdKbTD9j60KaFKeMpkm/3udYo7NCzAAzPrN9/XJayEXBw81N4VrQ1+sJPpdGQ3sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4kUzgUEDxKMzXz32gHtThnYiomXB/HHNABOdJyAPHg4=;
 b=Tt/jBHLD2eDknjQkWojptwzb5f98a/yKBgvUyM3qqDQG8DSgRY+INrXwVCEIFdLq7k1tr5i9Rrb9p5fuLeL4SlTt0zOjhZ8z5/bYb7ENtyywc5B9WbCij14Wppco4l8k+GpWS4lJFHHWRNk6bD25TdmmkTTA1xoFmOHiowcDGMV2plse1rE/Zl+0Bn1LFDXv65laKoScgeZy5hd0o6WQ4ghO8tI90CWVVirA/E86f0Y4uMkgdJFYM6U5cpkYxus3HOn06I7aI9G4s+MXgJ2R/QAyNcFWBSTZq6wtnz4GTfV4eX3frekLKxWu8gGpwiQOhmuT4LntltbTOV+gRWM9jA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GVXP189MB3385.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2ad::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.3; Fri, 14 Aug
 2026 05:18:38 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.004; Fri, 14 Aug 2026
 05:18:38 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 2/7] python3: backport OpenSSL 4.0 support from upstream
Date: Fri, 14 Aug 2026 07:18:24 +0200
Message-ID: <20260814051829.35088-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0251.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::23) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GVXP189MB3385:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a1f2237-9c58-4201-795b-08def9c37f45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|1800799024|10070799003|366016|22082099003|12006099003|18002099003|11063799006|3023799007|56012099006|13003099007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	fgkj5xokDEcsO+QJZU1LUrhV8h1hs6A8KPJUU3Qrfi56dKhwSLhUQtPBjTY07GhpQAoun8tEDphxa9p7ZXN2rL3MSr7j4CbYReojibuVUV02Lq5S2xsvcibMFEiRYN9fl+U3RnVzqTjRN/CGrF1ITF7vqT8+J0YcFdvU+V4dUIwfx8JJ/fisD1eHSZkSxJYmI2zAgDW68PjPfZrOlx/On9jmNCOletz3sVazwAQBtl7pTcDcluWF5IrpA0bKcNFRmtxc5YGFwWMjhFT+MM/45P3owxuYRVjr8bzyc7PlqMZHriv3phb7PUz1UBC9c6arXngJ9SL3QVibZE2axa7Qr6QDkbl5xLqhsjD7ILbdQkE6ylgxLk0pOs+Dam09baNVHtIbVGMLZ8cLccS3v4eppeRYStsdyVofqgkfKfbIDBbJh1U5shOPUKyCeUd4IVnIIKltABSPgrd61ZXDkcupEx+9hdUmpx0Hxz6gHcCMUCneSeFRBlqNZCMMe7ZAC0c8WyER5zw9W3YOCpHdsgLYz6isj/4TJLCZ4IuaDxd2xOEMAtMn78tTJ8FIcM+bGY72FvXMLZgYcqMxsynSeUv7IOX/RMBGdcMaShQlqwfrGasRxmIN16TH3uZ2skzXN4/Bt0LKF6XecxhWumdo230nvLX5Qi9tvTg1ii+ZNaYrQTs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(10070799003)(366016)(22082099003)(12006099003)(18002099003)(11063799006)(3023799007)(56012099006)(13003099007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?n4BrHVrVJ2xX5n+3yto7U+PjLSUijUqjlQ2gPpKLKVGK2YAsDDs1IsTDWgQ1?=
 =?us-ascii?Q?CzMGXJIF6+1zuDHVsUbgxtSB4IRVYUBgFrjmDtcbbmUhSUTQVUjxKbbxtjWy?=
 =?us-ascii?Q?4Txr+WgE+PkM7XWZtvoY/DNRscMKhvLiTnvxEaqYw3ZPBZMaILCP7hauPyzA?=
 =?us-ascii?Q?N9jzCX4c9Mx2iNY0jaMnbLQlGaXFkoLK9XcBbSlLgkaOTt17TDE0hEVm7i58?=
 =?us-ascii?Q?syhcjxepu1oHUr7kMu0+XUyLxq/F1oIw+iVPmyBkl+FogPtTRQaoDmyl8rhN?=
 =?us-ascii?Q?4fEGRTJqRd/zB3qKdygzzPwAFKgOB+R7lnWekqRzhxRZGXonk6fuSfra5IRu?=
 =?us-ascii?Q?TcEmRcBK/7P61GXMTaXwqeB63hwTH71SWQv1wkQi7AfItQsbeyLa7DagbkG8?=
 =?us-ascii?Q?1xrlI16okFUlAhZDB+pOI6My+bQcZcWTgjoKx1tzd2uRXGh0xWF2U8ancorb?=
 =?us-ascii?Q?dwC7MBxkrx8mSZLRmmJbFe9/qKF6N456Cz5h+6nZ1eWU77RivVNh2orTyAcs?=
 =?us-ascii?Q?joMQoDTZbU7GrCOULs2/jdx/XyiE63KVNY2wUQuRrJ7pHML0bEkKbJ2LKLPc?=
 =?us-ascii?Q?+JfGESc7o3ZrFUjcmjrspCMq1F37B35+BApikasZ+mixK0iHzsfrtZpSY6fE?=
 =?us-ascii?Q?VZotDOvkxrKTtvhwpPOPQZuNMgO5SqNZf1S57p2pW43pK4oeaWjI3xabGRqf?=
 =?us-ascii?Q?BUBqiVSSRSdR58/0BITUH0CiwmLEKKrCbie0bThdX2fhXyfi/Np6gZQgmFBh?=
 =?us-ascii?Q?Or25FOc8cNSd3YbTp7Eg4uPK7A0JAFv2z9QJJPBij5IJiev3CElwaSekB1qi?=
 =?us-ascii?Q?AyKrBIwUvDVnuhX72DoFcbvNwXm6SmnvkCt0DvvaDXVby/QTnIMYqWcxPLGe?=
 =?us-ascii?Q?Z98tWIF60u45yXs0Dmcw7tW8Co0o+HZ2IeRfRJ3f2KrhR+Xkfq4yMF4jJYrx?=
 =?us-ascii?Q?tuSp063vptrYSGGzfMno9zZm+i7Oa9eELlHC+VBS+RXONAIE0vGSxuuGGu2f?=
 =?us-ascii?Q?ErJXstjdM0H8MkbefGSyiHfPDsLp5xW4JokfyRsbNn1hbPWXx/AVb0DwPYMX?=
 =?us-ascii?Q?qNBg32sVPDjrIwckIvzFKZpVQjotX3ie7Eec7RT6rDT4WCCZ/j7bljTxPeRp?=
 =?us-ascii?Q?quuFBoWR0byTnloBdAtSFN9jzMUENd93lJOQqM5b2rTiHVfqTi/r/4D6A6vM?=
 =?us-ascii?Q?FThL2DRDhcLJmHsnJSVdhbUogcvz99znTco+z/4WyK/c87i9AE+fhepWqK7P?=
 =?us-ascii?Q?egsxTv4qYGvA30rDJwJTwVK5gFzqfQufpS3gM3L+HR1raqMhcRQTLlISlH8Z?=
 =?us-ascii?Q?EhP9WHXWbZnuN6wFxwR4BFXTxBjUIUnL3gaoAoK5rzpFS7gLupd2AogL3knX?=
 =?us-ascii?Q?hT64tn4n+woSFjun8Y+Z5eNdAVkl6FGje/tZr3Fhtx6KcwyyolHN+i9pQ/IO?=
 =?us-ascii?Q?FvfFD2lg4CDpkLBjfKpu/LzMI6BZcvPP59munTYN3vp3tmcritDzn+RC3rvz?=
 =?us-ascii?Q?Ft29xJNUmKz1vuPipDDZwSY9WqHlYk7j8CVd6mBRNWN74PgD+SjbYqB0Ynw9?=
 =?us-ascii?Q?ZU8gSg3NXNdR5jfZFFpIZRNnYnjzfkbF4Ft+qqJzbM2mXUvKCjA8V3fXpzVM?=
 =?us-ascii?Q?pJXpXbPKjgF6GFtqNNmnaXQ3UIfHKglhPIj6ua3KtAjEI0e1tTgAmGWbaO+K?=
 =?us-ascii?Q?vZstmahDCzFwqREpz+f9NI7DFLUxPRbhDXePj6Kv4fXeIIr3kaskAuBW7jwB?=
 =?us-ascii?Q?9QckzSvs2pu9S7ANsQoMrRHbI2SMNJD/hxKuZoe9VvPgYEC20DQmqh44quCz?=
X-MS-Exchange-AntiSpam-MessageData-1: dXIFouselxHR3pJPZyqfxsaHkiTWljyX15E=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a1f2237-9c58-4201-795b-08def9c37f45
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 05:18:38.3333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BWLKFqd/kd7jTo+ZdymCUQEFO+BWasik0YRe1/2SO4efL5uLPjgNNiVcP0/JZ+leAaX7HvM40i6WjWQ4y09sv/1mduv7pIYZYKv0pZKMEv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB3385
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 05:18:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243398

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
index 1eef256a83..c4f3385e07 100644
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

