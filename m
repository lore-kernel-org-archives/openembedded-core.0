Return-Path: <leonid.iziumtsev@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F0C2C53200
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 09:36:20 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7715.1785317771564763035
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 02:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=kaYCsdRr;
 spf=pass (domain: est.tech, ip: 52.101.69.47, mailfrom: leonid.iziumtsev@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NXEDpD+s6ig2lnzbcQWCD0Zah523/29JS4/caaSKAHE42vQLzkqm1L31Q9M1QoTqLMPKzC2K+8RXZuV7CqXQjSt+b7ZAPaWiQdC49iWpgjutdbCa0NNF9aKkEInEJTllpbEzNh3qAK4ug0ewMV+xeKyFuoKOzlC7JN+qCFsRNIWk807ltJEi5nP6u+caglX3TGQnaADfKp70Z4TAxNBJ+lGrq4gY5fLub7AplDLA3lyirsLgft1p/ddOCP9wKtjeNZnmiFWf6wBpHyNNPNJ/9NosEQUOxiuTy6v2uF/QCr+94hdIAEIupc96L7FeIUVqRv1iKvhkhMgPRYvN/9vBBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbNOK+bRDgKLZLfpt6HilVq72bxrkqSqKkT+tTovW5A=;
 b=CRbptwLAx3HxDoxmPuLEwfyIjYKnhNDx1tzFNHmpbHrgMYmJ1cOuPctL4OZORGX56dAjqPHn/4WVd8hCOlQp2cJlO2O+f8qvuBTUz4eb3WousGClntS23FPa3OI7uWd5rS3z9zhz3p8yGvKXb4jQbRlBF1gjPmw+2H+GGltUESoghu1WllgtHpEgF6a41XfRCfk4s73Tj6ZXLf8QGXuHQZz+wWlZa2gLuI/fNa0g3QNt4f423e/Z6i+oXi1sy6cUhWMND7WDIgFJcAtbAMDMagjHOTNBaKhHzQQoUm6NPqkf2R/fmRzv5O8iwaIh6SL44QTNoNJtyQK53K34catIZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XbNOK+bRDgKLZLfpt6HilVq72bxrkqSqKkT+tTovW5A=;
 b=kaYCsdRrvRaZ46fkjZSaZVXoqCSaQyWNVAnJpsTi4DHPDR9yAcrq0zE86czNWRXES+KsS28jitEiYME5Beg/1NinBdXAGI96Qv521CNrd57qeCqh1Dtj5gPrKck5d4/MHZAVNhZWImPGXbmOtjGgDt5jY3HuQvMi1jEvXsiaohg4GsPaK3+4izA3g/DTqAdNI7V2XC1LC9Vjrkdgz6bvROcRfWvOfBX/mrTEfk8MRxV7Erh0ULpqHdRm0c23HtmyIXGkGKdBXRPGJRx2MD+RePDdCPLFRV4wQVHrZsRVMzXqusIff+be7Anw27UY3Z5POnUm0LwERyqUCWTnj7XvVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:2ff::18)
 by PA3P189MB3367.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4b7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 09:36:07 +0000
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f]) by AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f%4]) with mapi id 15.21.0292.005; Wed, 29 Jul 2026
 09:36:07 +0000
From: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
Subject: [OE-core][wrynose][PATCH] python3: fix CVE-2026-4360
Date: Wed, 29 Jul 2026 11:35:55 +0200
Message-ID: <20260729093555.426053-1-leonid.iziumtsev@est.tech>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO0P265CA0013.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::8) To AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:2ff::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P189MB1731:EE_|PA3P189MB3367:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a73f83e-5988-4925-a904-08deed54d0ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|10070799003|376014|366016|3023799007|6133799003|11063799006|12006099003|10067099003|56012099006|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	wcxg0ooQWapVxKT5koHJHGG7DYTpTx+6oSPnKvvdyn7sj37dmltpF3j+/rUYrS8wFoqLaYc7ElZ3c6soQ/pgLeZpxxX/9IZ7pfklOo3nbNvSYlMemIXixbIS7xu8GXKqsMLldgIn3otMSdvdUaZqVxlAmoTpGdxz7a93sOSt3eWoLZFf2yjDTsmBiZWWf70mo5C83CVv6l6ZTLGzaQ+75RXVUjDEQRiqcWlrBlCrN9sTbpp4gstbbzVBZvwrdLFUpTru3BuYChRksmZ22psop2lMsSZxUujIXEEC6bGqi0HY0Pcz3H554o/a2N5b+ojQvBILpY56eHVGTzQsphTlK77DffBj7bO0QhTO61FalXJpT3sCfkwMmPrCBwUByIs6QmGNRvbxfDnY4xpPDJHCLW4oEvysa0ZXHolP+i6x9xrxrEr0whlvp6HhpTVCaOrE6aGU7K/UEM0Zq9w9W1Lbn5vtmmpubsGlXzFRbTSYJMyrpQoc+bng9nEMgl3v9tp1BtZ1CzINF5pGKXWYyYu/VFbvvTVQ5Aov3DOrtRd+oK7pt8wDmwg7BG7MINTxNdCXNZwdK0YIsI5uq87/t43Heryr63KlN7PaVRJa7BeJ8l+Zds89kPhRAGBq4d1FyMmizZ6KyGRaLo+ZUcYQ6CsperfPd1IznSX7Wnknltj9Blo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P189MB1731.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(10070799003)(376014)(366016)(3023799007)(6133799003)(11063799006)(12006099003)(10067099003)(56012099006)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sp/0EwzW6C0mXXaoDI4t2duA6nAQ1r1wheFxk1YXG9Dk9zmrLwpFqk5C7W+X?=
 =?us-ascii?Q?n4ugikNNQGoniFf40jJTUYgMcteaOVfDt1SH6Z44ZBkRpImFMxRz+yeEol/z?=
 =?us-ascii?Q?ksItLpJCjfqsoiJwqDYaz2i4A8h4F3WBBdFd8BOsd/0DOxjrHmxONmF+Rrq7?=
 =?us-ascii?Q?6JlYVBqcG8/kT1FDB4urcOmXRitq2D+ScDqzUgN9Fl4bYlR+cNY9UkDKas15?=
 =?us-ascii?Q?1oxl2zRuE+b9SeImz2VljqIkrq5w2KxUqbRekJtW/r+FilgbOC3J/iOE4eQG?=
 =?us-ascii?Q?bP56HOuEIQBAngGuM/KoH8pcyIOeRhdvdkCJIIJQWw7KhBwlQN4dP5Xd1ZoU?=
 =?us-ascii?Q?AElSZ1NCi2psF/Kl1rkSnoYFc4Ebwr6kOGS8oSvcdtYX36Pn0mPIv3R5AIxU?=
 =?us-ascii?Q?ZbvC4Pisz9pMCSkas7tABt/nDQtCKSTxF2UEamfC6jAcO2FvqE++SJAAXrd3?=
 =?us-ascii?Q?hF4cF8/C9n0UdiXl/rd9wEQ1bAZQjbySwlJ5md/GSd20EaqKhUcg8/8y7Cic?=
 =?us-ascii?Q?SbAcib/iBk9j2oNhhK15arVZGNtyWMsSIKqjGmS5uI5Wv+sKkO7lhq3Cm9YN?=
 =?us-ascii?Q?QE1bjg3nxhmvaloGtj3lcmDoPgabLurjMeB318ZP9zMOjcZShEn5je9YDeNp?=
 =?us-ascii?Q?IqMyrs7hB0Pq/kHA4Ya13E7++GcMMH+9QbJnb7/Ip6CdmTOfKL9rUYhJL26S?=
 =?us-ascii?Q?wzdMNuOgN6uDAy6W4dvvzSDJ4J/lzZRsEEkedRzgkx2XlM/dg2plw3XioR/K?=
 =?us-ascii?Q?tgkvGFK9PYosBxHBuFJ4rh0p4c7LODZFTbDAxVF74QUsZzEqN2qoWW+m+lWI?=
 =?us-ascii?Q?2jD3fnBTh9JenNOo4HwVuD+Mt1DK/aJEFiv1aqS4UcZP2qx978hc4Hw0Z+1Q?=
 =?us-ascii?Q?I9Dod8uFW7/z4k0EM/5rvc9D8d/7oQiDxE9FIBswWbtVcM38ARLX2id69vby?=
 =?us-ascii?Q?muZOQRsJzWHEd+k4u+1H+ZbuafqwS5qjRCn0d05gZGcZ5yjPYg4SLwSIpwVh?=
 =?us-ascii?Q?4Vt+yX1ZLitKVd/ut9KpsNbSHaUrQKYnbwoql/Z67u4Qomq2mkxCD3rJ1kg5?=
 =?us-ascii?Q?iv7EYTaR+h7dJHi57ktrDpXUM+sMF9GqUIk7t8ahTYLBy2923trS6Z3BUCP/?=
 =?us-ascii?Q?YNvvo1HGFcn3RrPUebICp8adprOZPNmUvbMZjJcSqf76lx0IAVqy2cZgH6Ig?=
 =?us-ascii?Q?eh1rJ0wKwr5nM2wrfARdkHS9BFifGmp+cpFIcpL/j8Sbw06uhfmboj7dorYe?=
 =?us-ascii?Q?qhR7rLT3m/EiYnyQAdmQfZNe/62Gt9mYN/7qN0I1Q0XbeRnnMlnOLxM9Jk/N?=
 =?us-ascii?Q?W6Ep5H/Xd0R7E+pQR0Rr64Fbjj9pnTK6LiYB95WYDJtmuRGZSHMGc1BlRccs?=
 =?us-ascii?Q?VaPqRNPyLZYYvngGThbKd/SYDw/iRkW7pxhiA5svoynhJz8yu9U1LSippTnF?=
 =?us-ascii?Q?EeBOFIH8CTeg6wJIjBET8yQ/Gmlu7ZmXd32N6VGlywb0szMpl5FM0rLIcx9I?=
 =?us-ascii?Q?+QdQPnxYv9yYDycXyN5k3PDS4ijV9J2amJ6EJmXib97yAUNH9I8s4EbAAz0S?=
 =?us-ascii?Q?Iohn02anh+jOIF6ms7dIWJjyCTpv1XRGadS+QRQtbcKRwaYWyx1gSsrPAhf4?=
 =?us-ascii?Q?uZz1ITeqGMay2645X+vi2cy+OKTnccXDd8UMHZjP/m/wBnRsfueMAuYNJpml?=
 =?us-ascii?Q?eiS7pbJmCXp7wxciJ/SrcUMn4Cwr0hhXDFRZ2UkgMwLe4PLg7V7B3nBUY5bc?=
 =?us-ascii?Q?m1pufUIFrkuenulbOMhhCrNMPs8HQd6HH6yTIAgEz2XovS0dazxqHdwgXW7j?=
X-MS-Exchange-AntiSpam-MessageData-1: bxAdfPzibbOiFYmtaJZ+r7uJy19MOtzFPpg=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a73f83e-5988-4925-a904-08deed54d0ec
X-MS-Exchange-CrossTenant-AuthSource: AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 09:36:07.2926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Fi8aRnhOZ7tVikwjM1JyBLUPd8/tR1+sbp1dS47SB0RMUaW2e9KmNYOnyKKPiv3s9ZzYya91GDEmjbTczRM5Ed/tqahc4EP2S443aAtp4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P189MB3367
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 09:36:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242265

Backport patch to fix CVE-2026-4360.

Reference:
  https://nvd.nist.gov/vuln/detail/CVE-2026-4360

Upstream fix:
  https://github.com/python/cpython/commit/5e0ef3f1afe892e4f64eb83368db57ac=
4c40cba0

Signed-off-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
---
 .../python/python3/CVE-2026-4360.patch        | 148 ++++++++++++++++++
 .../recipes-devtools/python/python3_3.14.6.bb |   1 +
 2 files changed, 149 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-4360.patc=
h

diff --git a/meta/recipes-devtools/python/python3/CVE-2026-4360.patch b/met=
a/recipes-devtools/python/python3/CVE-2026-4360.patch
new file mode 100644
index 0000000000..d381508959
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-4360.patch
@@ -0,0 +1,148 @@
+From 66c8bc346c0c614edc05535145c0424a14fba213 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Mon, 29 Jun 2026 21:11:22 +0200
+Subject: [PATCH] gh-151987: Pass filter_function to `TarFile._extract_one(=
)`
+ during `.extract()` (GH-151988) (#152609)
+
+(cherry picked from commit 7ccdbaba2c54250a70d7f25632152df7655a5e0a)
+
+Co-authored-by: Petr Viktorin <encukou@gmail.com>
+Co-authored-by: Seth Michael Larson <seth@python.org>
+
+CVE: CVE-2026-4360
+Upstream-Status: Backport [https://github.com/python/cpython/commit/5e0ef3=
f1afe892e4f64eb83368db57ac4c40cba0]
+
+Signed-off-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
+---
+ Lib/tarfile.py                                |  3 +-
+ Lib/test/test_tarfile.py                      | 92 +++++++++++++++++++
+ ...-06-23-14-19-30.gh-issue-151987.8mNIMf.rst |  2 +
+ 3 files changed, 96 insertions(+), 1 deletion(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2026-06-23-14-19-30.gh-issue=
-151987.8mNIMf.rst
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index e6734db..2c46179 100644
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -2510,7 +2510,8 @@ class TarFile(object):
+         tarinfo, unfiltered =3D self._get_extract_tarinfo(
+             member, filter_function, path)
+         if tarinfo is not None:
+-            self._extract_one(tarinfo, path, set_attrs, numeric_owner)
++            self._extract_one(tarinfo, path, set_attrs, numeric_owner,
++                              filter_function=3Dfilter_function)
+=20
+     def _get_extract_tarinfo(self, member, filter_function, path):
+         """Get (filtered, unfiltered) TarInfos from *member*
+diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
+index d974c7d..9a15585 100644
+--- a/Lib/test/test_tarfile.py
++++ b/Lib/test/test_tarfile.py
+@@ -4399,6 +4399,98 @@ class TestExtractionFilters(unittest.TestCase):
+                     st_mode =3D cc.outerdir.stat().st_mode
+                     self.assertNotEqual(st_mode & 0o777, 0o777)
+=20
++    @symlink_test
++    @unittest.skipUnless(hasattr(os, 'chown'), "missing os.chown")
++    @unittest.skipUnless(hasattr(os, 'lchown'), "missing os.lchown")
++    @unittest.skipUnless(hasattr(os, 'geteuid'), "missing os.geteuid")
++    @support.subTests('link_type', (tarfile.SYMTYPE, tarfile.LNKTYPE))
++    def test_chown_links_on_extract(self, link_type):
++        with ArchiveMaker() as arc:
++            arc.add("test.txt",
++                    uid=3D1337, gid=3D1337, uname=3D"", gname=3D"", mode=
=3D'-rwxr-xr-x')
++            arc.add("link",
++                    type=3Dlink_type,
++                    linkname=3D'test.txt',
++                    uid=3D1337, gid=3D1337, uname=3D"", gname=3D"", mode=
=3D'-rwxr-xr-x')
++
++        with (
++            os_helper.temp_dir() as tmpdir,
++            arc.open() as tar,
++            unittest.mock.patch("os.chown") as mock_chown,
++            unittest.mock.patch("os.lchown") as mock_lchown,
++            unittest.mock.patch("os.geteuid") as mock_geteuid,
++        ):
++            # Set UID to 0 so chown() is attempted.
++            mock_geteuid.return_value =3D 0
++            tar.extract("link", path=3Dtmpdir, filter=3D'data')
++            extract_path =3D os.path.join(tmpdir, "link")
++
++            if link_type =3D=3D tarfile.SYMTYPE:
++                mock_chown.assert_not_called()
++                mock_lchown.assert_called_once_with(extract_path, -1, -1)
++            else:
++                mock_chown.assert_has_calls([
++                    unittest.mock.call(extract_path, -1, -1),
++                    unittest.mock.call(extract_path, -1, -1)
++                ])
++                mock_lchown.assert_not_called()
++
++    @symlink_test
++    @unittest.skipUnless(hasattr(os, 'chown'), "missing os.chown")
++    @unittest.skipUnless(hasattr(os, 'lchown'), "missing os.lchown")
++    @unittest.skipUnless(hasattr(os, 'geteuid'), "missing os.geteuid")
++    @support.subTests('link_type', (tarfile.SYMTYPE, tarfile.LNKTYPE))
++    def test_chown_links_on_extractall(self, link_type):
++        with ArchiveMaker() as arc:
++            arc.add("test.txt",
++                    uid=3D1337, gid=3D1337, uname=3D"", gname=3D"", mode=
=3D'-rwxr-xr-x')
++            arc.add("link",
++                    type=3Dlink_type,
++                    linkname=3D'test.txt',
++                    uid=3D1337, gid=3D1337, uname=3D"", gname=3D"", mode=
=3D'-rwxr-xr-x')
++
++        with (
++            os_helper.temp_dir() as tmpdir,
++            arc.open() as tar,
++            unittest.mock.patch("os.chown") as mock_chown,
++            unittest.mock.patch("os.lchown") as mock_lchown,
++            unittest.mock.patch("os.geteuid") as mock_geteuid,
++        ):
++            # Set UID to 0 so chown() is attempted.
++            mock_geteuid.return_value =3D 0
++            tar.extractall(path=3Dtmpdir, filter=3D'data')
++            extract_link_path =3D os.path.join(tmpdir, "link")
++            extract_file_path =3D os.path.join(tmpdir, "test.txt")
++
++            if link_type =3D=3D tarfile.SYMTYPE:
++                mock_chown.assert_called_once_with(extract_file_path, -1,=
 -1)
++                mock_lchown.assert_called_once_with(extract_link_path, -1=
, -1)
++            else:
++                mock_chown.assert_has_calls([
++                    unittest.mock.call(extract_file_path, -1, -1),
++                    unittest.mock.call(extract_link_path, -1, -1)
++                ])
++                mock_lchown.assert_not_called()
++
++    def test_extract_filters_target(self):
++        # Test that when extract() falls back to extracting (rather than
++        # linking) a hardlink target, it filters the target.
++        with ArchiveMaker() as arc:
++            arc.add("target")
++            arc.add("link", hardlink_to=3D"target")
++        def testing_filter(member, path):
++            if member.name =3D=3D 'target':
++                # target: set read-only
++                return member.replace(mode=3Dstat.S_IRUSR)
++            # link: don't overwrite the mode
++            return member.replace(mode=3DNone)
++        tempdir =3D pathlib.Path(TEMPDIR) / 'extract'
++        with os_helper.temp_dir(tempdir), arc.open() as tar:
++            tar.extract("link", path=3Dtempdir, filter=3Dtesting_filter)
++            path =3D tempdir / 'link'
++            if os_helper.can_chmod():
++                self.assertFalse(path.stat().st_mode & stat.S_IWUSR)
++
+     def test_link_fallback_normalizes(self):
+         # Make sure hardlink fallbacks work for non-normalized paths for =
all
+         # filters
+diff --git a/Misc/NEWS.d/next/Security/2026-06-23-14-19-30.gh-issue-151987=
.8mNIMf.rst b/Misc/NEWS.d/next/Security/2026-06-23-14-19-30.gh-issue-151987=
.8mNIMf.rst
+new file mode 100644
+index 0000000..9eea7b3
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2026-06-23-14-19-30.gh-issue-151987.8mNIMf=
.rst
+@@ -0,0 +1,2 @@
++The :meth:`tarfile.TarFile.extract` method now applies the given filter w=
hen
++it extracts a link target from the archive as a fallback.
diff --git a/meta/recipes-devtools/python/python3_3.14.6.bb b/meta/recipes-=
devtools/python/python3_3.14.6.bb
index 0a9e82d445..c821c2eb1b 100644
--- a/meta/recipes-devtools/python/python3_3.14.6.bb
+++ b/meta/recipes-devtools/python/python3_3.14.6.bb
@@ -37,6 +37,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pytho=
n-${PV}.tar.xz \
            file://0001-prefer-valid-entrypoints.patch \
            file://CVE-2026-11940.patch \
            file://CVE-2026-11972.patch \
+           file://CVE-2026-4360.patch \
            "
 SRC_URI:append:class-native =3D " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-config=
u.patch \

