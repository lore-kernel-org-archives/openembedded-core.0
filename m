Return-Path: <leonid.iziumtsev@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51CDEC53200
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 10:14:32 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.2])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8187.1785320063365099841
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 03:14:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=EDKV6GF5;
 spf=pass (domain: est.tech, ip: 40.107.130.2, mailfrom: leonid.iziumtsev@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QqYdDfcMWRGVfGidV4J9rVnnEQTucbtOQnJN8dema7jE0XM7U1wq0voDHXLJKnEBlcgor3V/5odvtyf7MT2BZWruAKYZ7BfVEH6zf7Tdywoq8JLZ6AiE38z2OzklfeeROywKJZqFjtSvH7iBwKP1ykjISK0R3+s16AHaWqSwuDmYrHv23dI4VU+5HDsy4k8yh5DuwhCAEPJPxQY8RFKHrBZ2FMFjUE4u75VZm7xiDYTvkt7Brkv9Ma8cnj+nNcA0R4Pcm/3s5wArHQUx1QI5J815PhWtihAlCnQAKkIP3CWyPBvgp1SqEEPUnvzsjXZWi4G+/kqAOjsyrR7HLMB1dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XH7W3QE8ncPClAZznGbVYagmxHUBMmFl7ra9wWT/stQ=;
 b=Ra0gUYSZQALGC5aBqXl2ajuBYL+ntJHiwBuM+IgYkeBwwbzHxhHsjwQIMYbj2iKldiIkoor9vXO5Zs9JGDc8E3r7lzfuZ0T4ZivmuVzFLobBqAQ0PWgSBYyWq3UQtvBEvDdBaSYSkxCvddkRFIUiZuDxWBXOrlgc1ztQi2ZKJ0KLR9+6OrHwcAhyuRu0i8rBe4eqN0gnfT++4rVxqApLDmqMmTiwxFuy5LJssBt938xAqbJiNjDjB+N5ic0YEFq2o1sRgb+6mvCctSSiLX/iUhhxsGiPfUzKFmMEE0lC2sjpPojxOQnVNe5cBLucAHZQE18pw/SHm5BEwH78pywp8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XH7W3QE8ncPClAZznGbVYagmxHUBMmFl7ra9wWT/stQ=;
 b=EDKV6GF5D6kALfGniLXvkf2yh1lOLkpGutA6rs3Z6IFHnU8dHpJjIa8/CYIJ1rncpgDlZXpm+Mp11ExQPiASpV8+rrxvg2EbBwyzCUr4S05AtOacWPYoV4NC3pUptEp/Q6LrhKLIqmVghM+Dlp/pZ6Uokgv65Wjp9DXMylwb7grEdJFYN4/N43p9jkB+YWn7f71muA/1trgkG4PVPgh6ySQzL7mVYaZKRWWwCji1h6Auch+Xkc20e0hnLRr6karGEeA5/6vz6LtLanUNDoqvTh4Y0bAfYZX3Q6kRuQegzP032+gLWK7qU6qkDqZvjmxqbhR/45NesPYZ3nD6fLLHJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:2ff::18)
 by PR3P189MB1113.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:48::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.7; Wed, 29 Jul
 2026 10:14:05 +0000
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f]) by AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f%4]) with mapi id 15.21.0292.005; Wed, 29 Jul 2026
 10:14:05 +0000
From: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
Subject: [OE-core][PATCH] python3: fix CVE-2026-4360
Date: Wed, 29 Jul 2026 12:12:57 +0200
Message-ID: <20260729101257.429392-1-leonid.iziumtsev@est.tech>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0484.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::9) To AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:2ff::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P189MB1731:EE_|PR3P189MB1113:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f012a6d-0d67-4e88-87a6-08deed5a1f05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10070799003|56012099006|12006099003|11063799006|10067099003|6133799003|18002099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	lJHlFFwH+0XcC9PnOf7z1pM2PzWS3CXRgl8nww1sU+3PRyTwgJ5bOK0ZcUherHOkm2aHrLOqUw6/7/52kYA8o5ETsygnCjMO0tnBvCr8ucTirbIkDcHbtTllCYD8ozRj5j1ISyvnDSQBL2/Ozv+MW1GXVJLTwuxGvty8SQvVVbsubH/rc3R0CXDMxKOfMy2aHCWCSwGgWIQDKdoFNoVNfvRFePpkOsiLdIKeH5wX4NlIeqTz3Wj0z3paTUgA81vv9AoyvmUIQclu0USCaltf3JS61l8heO2RmbM1iMtl6jxQYpBakZa8hKzHaAmI6uhW/P06uK6CYJdINksYuXXdzuDJCXGVgxATaND6vi0Jhh2TSH91aLyypSOwcDgU9FATt3kHcCcRnF2trFKnj1AGjTC7mn1N2VNSQfwSxvNNRpJ/WIXlopfnvN5h9rMqHL3J1RGbTwRln7v6qjGyCl7Hrj0zMw/YoG7RiHDItv299BjeRGq+3q6ZBN2SRCJufhv+fJ9DcSztKAuqwBfpHIu3Afxld4lmQ3AN1JQRxYZTNzwxOY00MVUsdc8ktP35mIIP71EdH5hW5dTvB5q/bwmRhKem1n+JK+Lc6Rl84rO+BltrvyM9nac2fexrZT8J4LzdJxDkQ7toiso+EHxl8R7HjK3zalzQ2zrFTd7ebeDVuBw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P189MB1731.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10070799003)(56012099006)(12006099003)(11063799006)(10067099003)(6133799003)(18002099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VLe2cldrDlYrOBBVuYoiFFFoMu4XV3BihMo4s0U4KN0LQJCVqBJ0nq7QaNFx?=
 =?us-ascii?Q?uHXlBul/N98hf/5+XnKjjdxsgKZHGB+lvDRYYSGMTSZwUp8VZpi1HNJLKuD/?=
 =?us-ascii?Q?vyeRCcSuzSLavvpbRVKKgorV+Z0eBSntRE/JKthxC3LAz3p/OvJrzzhqXtHw?=
 =?us-ascii?Q?HEnCjdqwTsPcZ68fP/Aoq9xUBK/qI8hLeyoGhzQggHz7fzh0rxxIPCzULA8t?=
 =?us-ascii?Q?Fm80eFZ7yRt7YheztVwXAjhnlUmF5FDatp8CXrrDey5RNPMKaGqXj4BtLU9H?=
 =?us-ascii?Q?j+6itP+wRjpScv9Dzj2hW9CnqKh+ZcVpExb1YnqOWVmlwjNotYEwy8nynmw1?=
 =?us-ascii?Q?zo+2dcfRtp+wBDyJyreFemASuTIUhMPM2a1ulCYSCH9bmxzYJpY4UJQU0dZj?=
 =?us-ascii?Q?ha8SLkL+cCovSoKTeN4TKqZH4vhGB52Cr8pA3O/j0Iu6udD7bBV1bEqEL8WQ?=
 =?us-ascii?Q?Kj8PgticQrHuTCNKTiEQ7NHULQ4DtjzTR3yB92j7wjlo/5LJS7EtX1LjdtZC?=
 =?us-ascii?Q?uJcaqsDDuDfvQKURdO/Zcd5Uj1232Y24soBHcXaasHOt+IHyfCtavG4j54In?=
 =?us-ascii?Q?1Xm9RxFv5/cZqR0hXZddoQRxaggMKtbzW4D+JKtx/QoRorasls8aAU1Mi84g?=
 =?us-ascii?Q?p+JTsDJ5JtnXMqckH0zATX3dhaCVdEUqcjVXiMOMDkVlCwUlOg6OR8BXIC/E?=
 =?us-ascii?Q?vwNGaNU0WMLbNcbUSstE3ebkBRLgVskyIfw/vL90XJ/FN0tbD0I84ZeS6YcY?=
 =?us-ascii?Q?CGdWpbvvYo4ViiZofjnyyXAOO3D8tfgh89WIRktPFNrY1RXABck9yUS7SsIH?=
 =?us-ascii?Q?pX44LLGZc7rDlNKGGpyd98kwXf8fuinWQILC3Iu0kvycT7MaJz73l0dGukiO?=
 =?us-ascii?Q?7BHcCxUedLJMMmfly2qO0vMDkLuZ2/atxbT/5S1hmT5B6g7QjwpY4eWkAhcv?=
 =?us-ascii?Q?KIieZwZQluhbBRx7G/zMNKjyVEU/F/Xc44H511mfOpdhGeMPgdt4vu88Olyz?=
 =?us-ascii?Q?2GOIXiTzO0SYs4K/M9yDXnUUf1f9F+E/fKgtiPucpaD/RJWqHl0DP40sajii?=
 =?us-ascii?Q?88oSklP7xtIQHSLJMcW+4WRGNoFO3QMxVvZMFlSX14JkRUA16dIDA6wv1llC?=
 =?us-ascii?Q?JmwiYQWGHb+nj9uVzxVAvCP9omlovOe/Xz6DoSE760zsT3pIWZBQBKnIDyie?=
 =?us-ascii?Q?CzzzAIS/6i2yF/fJBqI4jOW9F+2FmjrGV+K9xlA5iwWmbviatgs9fixxDUpj?=
 =?us-ascii?Q?9rz5zKZwnzoXz6n0LK4pk2S64CJ6MM3N398f5LyC6+Pk/zo39+cBKwiSbJxA?=
 =?us-ascii?Q?NEuMsfrE7vwU7bvyH4zxUw2bAW0bG1WkRkMfnz/JN/21y5EcpMQXbvoIi8Ow?=
 =?us-ascii?Q?yZ+s8ETk0R5fHpQP98cff6vwC0lTjhZJxEei0x5ttP4g3JzArxmxdn5CpOd/?=
 =?us-ascii?Q?IqqnBKX1amAHawiouWIll8FJR0SqFp1eQn3mKocxzMvZO6hWLUpeC6qQ472k?=
 =?us-ascii?Q?RVF1nIzQi1NrmYYQZ2NB3+i2eg6+EsZBcWBVmW9X1jwZ5i9swfwCzpXZL7BD?=
 =?us-ascii?Q?/PQ8Auhs7PntWS3ucbSuWzE6do2mlRA3VeUWWlSaUaQ2A4qvbuN4NPtyR0BN?=
 =?us-ascii?Q?g9Lbg7nIF120zCTFFq1KGnCox6t6UJCriBJtoipH0MktN7UkLmlxuc1PJCzS?=
 =?us-ascii?Q?NIX2xCfNUcVMvEGwRXGXmU1XuQymwT35N4Lpf9I2JX3LbxoBMcSYSRQiN1Xd?=
 =?us-ascii?Q?te25O82JfvZAkkPSWLjilzLZFV6AIpKSpPn2N/I5Nc40Uf6lcMHcmZdZcbVG?=
X-MS-Exchange-AntiSpam-MessageData-1: 68USfR03Ssq0OIm8q1ge5uer+j0UY1FR3gA=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f012a6d-0d67-4e88-87a6-08deed5a1f05
X-MS-Exchange-CrossTenant-AuthSource: AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 10:14:05.8134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2vsX9eU0efiW5d0tgwSTKgVCa2iBeOsqEQ/A7g20wZGQIwIwyKy6HjkSBTCbeEAarkOFIEmSjX93pc65JzoNIlwVUCc08CyumciX2jE5fZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB1113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 10:14:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242268

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
index a45a456133..77333ce3e2 100644
--- a/meta/recipes-devtools/python/python3_3.14.6.bb
+++ b/meta/recipes-devtools/python/python3_3.14.6.bb
@@ -24,6 +24,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pytho=
n-${PV}.tar.xz \
            file://0001-prefer-valid-entrypoints.patch \
            file://CVE-2026-11940.patch \
            file://CVE-2026-11972.patch \
+           file://CVE-2026-4360.patch \
            "
 SRC_URI:append:class-native =3D " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-config=
u.patch \

