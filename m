Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.48])
 by mx.groups.io with SMTP id smtpd.web10.746.1613681249833870350
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 12:47:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=QmdelWs4;
 spf=pass (domain: windriver.com, ip: 40.107.92.48, mailfrom: stefan.ghinea@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=coap4k+i5DdFmJk0t0NOYZmTvCiJuzceT/Ylb58S9CUX1hTf1AtcQOPy+Q4G78tPtARu2UzbiGF2Vg+h6Vn4YvYiawEcTHhbHaK7HwbnkuYLaZhI3qf8UOCbW1RrvohaGry4gYjDwoxY+pEIWpe/STIyLX3Kf9NXLvQCfGc5/cB0b6Fz36hzESwD96wedpYZGef2au3iYGl/bOE1K5Ap1r/DBwTaqDnnSe14nyStUtRzN8FWUaummBhIYbqPoFVdBa3V4OlvrKQ5LMXiIzN2nnFTfuxi0uoOwVM39SiT2y8+gWWrCKz7aWB3ipzF7kS50GaU6xLtRxMlpEAZPuXPAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOdxCkvfil5+5O1fP8M5xhY9EHBST7Pc1kGuZ7n+4fs=;
 b=SdMEJUEgnEo8xVMLr7gt1v6+KnViiZXCge+NufSU5NyP5/pA424QY+C2npDq1DJTmTu4KF3SwTmuFFFqsGkymePPRXyhHTEFSZvNLapMZ6FYDrfP0z4l6ErFhUibcEhZD1dllEnilhSYYxZA1A/yhH4nnDkxgnHUmXyqs0/+ibMIGpvZ15cFbKb6V+LkmmTuQX94neQ1dIOfcVH7HWdKEYj7quAUX93w5O9V/+hseupTJlIc6lqQMH7+03n36Jwf/EjFA/8hZos0rqcowFOl3ZhCWiLpn2Dyfb2iNfPSLgThHRWifnYo2IYdX3m3gK4QYzHMpnWpFj6YzfbaHMz+tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOdxCkvfil5+5O1fP8M5xhY9EHBST7Pc1kGuZ7n+4fs=;
 b=QmdelWs48ny2Y/AG/UYGS/rtVQv+htZGHyK5jpEDlcMKuZsQ6gxquZMQHSCjIVvagZASKpO+4hZPpg3DkQJNOb19BjacEVpkvDG4dSXNVwfAOWxc5U0oaIYrAXnWGAa7tYmcqnDJ2rfhjgJYNdHik2/NKACLAUr2wHSYSbLAS50=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22)
 by SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Thu, 18 Feb
 2021 20:47:27 +0000
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::31f5:2e4:c15a:6df0]) by SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::31f5:2e4:c15a:6df0%6]) with mapi id 15.20.3868.027; Thu, 18 Feb 2021
 20:47:27 +0000
From: "Stefan Ghinea" <stefan.ghinea@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] [OE-core] [meta-openembedded] python3-django: fix CVE-2021-3281
Date: Thu, 18 Feb 2021 22:47:13 +0200
Message-Id: <20210218204713.6070-1-stefan.ghinea@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [89.137.231.29]
X-ClientProxiedBy: VI1PR0901CA0107.eurprd09.prod.outlook.com
 (2603:10a6:800:7e::33) To SJ0PR11MB4989.namprd11.prod.outlook.com
 (2603:10b6:a03:2d9::22)
Return-Path: stefan.ghinea@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (89.137.231.29) by VI1PR0901CA0107.eurprd09.prod.outlook.com (2603:10a6:800:7e::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 20:47:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7aa3c64-4df5-4c99-ba18-08d8d44e66bd
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4989:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4989912BE535735900629498F2859@SJ0PR11MB4989.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:115;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VzvECqIvvzSQep9wdNOYYHIi73ISS3iPCfv481YC5er40B9/IJUFkbVEFooRb9xUIt8BlEKDCI4XnFReYE9nySLMc0iahpLj+Z767UZZaVTZERED1RlqUDYUMt+C7dbOypSQbAfyaqLF7iYoYVtguqrhF6nRKNSCMjxDx95iTmVH7ce7uqjWxMxVTKJ/I6vvXw7SVlkBao1fNUJ5/5FaX3vKg13sRGBECbWVxwiC/s/GkmgBRZp3S2iVxvmhmiQaCY2wYIc94UJtGXmVGqQW2MODhsQi/ZV9uA1MMzwSSynFZAHZufHcu8e5UuG4cZUV1Fh6FqgYrKM9XTki8LIOSHaIYAED2Eg0OXwGAEoY9/HNeoxKvsd6ieqFG9HX8YFQbFB4jHy8bCiNNiEz7hcuU9xQIrbDsh3NPSeYXp9XM3U0LHhIsxCpaaiXajer4AtbVMs41JSjcGqmvp/JxL1RjHPEvhRZYBR8eIPixx4V0oEbTBB+h4Y5m8XxnVlV2It4ozv6HmjpWNURlMwdjz3DH1H4cWdjYas/boY4DFPVTy8qNgyNQpD58v+4nrhoUQ6rYBBcZ9XgRGj0Xgoh2ibSJ0Pru95Zb/T84aJOX1L/+G009KN+FZDqK/8CacBEqELhF/GQ3PV984C5Yu60IN5iT2sZWHQgQ/LGWxbc8Bf1M7dimcDiW3w2fCuZIn0CAcSc
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4989.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(39850400004)(346002)(366004)(6486002)(44832011)(8676002)(86362001)(966005)(316002)(69590400012)(6512007)(83080400002)(6506007)(83380400001)(956004)(2616005)(478600001)(186003)(26005)(16526019)(52116002)(66476007)(66946007)(30864003)(66556008)(2906002)(8936002)(6666004)(1076003)(5660300002)(6916009)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?Mi1KiQf8y3G8ijTNFGrcoWOceZdajCvFBSd37g3KdPcyeQ1zTYgBsPJRc1ze?=
 =?us-ascii?Q?dAYRSpXH1d9kRtJpsCAlSq1Zf5FgMWcOChzZqGVh4Gs4BWqjTBIetPRTC2xM?=
 =?us-ascii?Q?Pnu4H99KLC7PkLFjUUUmgH91fMhPPOBkoOpR/XCbT7KXyeORh2kUc163wJ64?=
 =?us-ascii?Q?Pb4o1X2S/mywnV5fVL3c7T0ucqNbLmFYD2EKvsDe/oTt9zRz32PLsqYngxiH?=
 =?us-ascii?Q?pngAP6yDj12Nmdb/Z5LU9HGG9070l8yVL0EgMA7xe4t9a2/TcHQcX56iUlSG?=
 =?us-ascii?Q?p4oyp+UFtFAyiRYX2Ns6TY2n/kM7kq78wA3kigVDIqcxw6MaS2mfHfUWmD3d?=
 =?us-ascii?Q?MZTZzmwF6/Vx4CvYBl0pLvKcazN6wwv8DS4DiANKFxYuF6v9U+10fr99ds+u?=
 =?us-ascii?Q?u6wY/BmcGHckg2UiDTjxuGmXAI6P2zvX2pwsu6+zkVp4ndpdBC1X9mmgJr8k?=
 =?us-ascii?Q?oSQMAZienJWvqB/bzFBtzgdvTcDLb9IFD7+u3kovbhVemeMT5TIOshGtFU+s?=
 =?us-ascii?Q?s1M5F4OrHLula9NF7GRLlwyuNNSkcJPfIWhEMb/M15oZzDUZJOsUZ2LMC4Eb?=
 =?us-ascii?Q?SQwj1eqULHOz1VWQG6qcrwLPQfvTfNjp8yoMwZPCAMUUzpgsdaVALVIvW+cx?=
 =?us-ascii?Q?TakXkExkisXhgDkibkmsS9k+ai2YWZKlOCS1S/Dim1TycqLG8DLV6Uwy/Eke?=
 =?us-ascii?Q?o4KvH5EsHoMXUafRscbCRdxxPsvP50hsDn4aOCckcPcs/kdlNGGl9ciDDndj?=
 =?us-ascii?Q?lkcuTQURjHLh5b1am+YGcl9N/NMw5BBM+rBuIjPd1WfZ2bDzFM4HQXq0ue/v?=
 =?us-ascii?Q?KhRx2t4cwjiPH/+6FUBTCWIA8FlEF9DOGMXjhqiewMswwRKVLWTFHRdBstWU?=
 =?us-ascii?Q?DgVwSFiR/o7MGnySxytcGa6eE79+LBZttghk4zYKflWeBP3pq7Z+S14fakMM?=
 =?us-ascii?Q?mZZgunImnU3RJ3N2oLhMpwOhxFkzWEqSsvI4t7+dXuIl57/sCA1tObbYZyC/?=
 =?us-ascii?Q?4F/y7gOZZy0mTTdZ0J99YPf0WNym0s96qCmgvDTyYT1DNCAuUIuvMMDHe9x8?=
 =?us-ascii?Q?6HkcrjhsJuJenpxdMMVqb8ezunrUDK+6ENeDw++5/r7sOMQaSr84hHtsUNLY?=
 =?us-ascii?Q?e/yLdFwEqpszb7z/7zdrz5Cw9Tm0izUns7S/+RhrwEGhfM9XUwUz8elmK4Zk?=
 =?us-ascii?Q?a1DLebsMQuv6QVvDVWRNUiKsw7Wa5jMx7yq1/z0fq9T9nx6h0DDhSQUB1uGf?=
 =?us-ascii?Q?8TZciOakuGNE0iiQfqEPx2Q9/9RnCUf3dcdRM20E3D3Iq2RCGb5+l3ZlzIZ7?=
 =?us-ascii?Q?6DaFTR6qNmkbiYuj9udW2VOg?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7aa3c64-4df5-4c99-ba18-08d8d44e66bd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4989.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 20:47:27.1691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: loroF8WbO28NrTYdCyO4GCxx2vpRH67w6osWriXvkRbZrCXc/tmp5wRDZHmGl96dghkY5x+b7USNvnUR7ynerwMNe/Xt7CQoVufKupKStYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4989
Content-Type: text/plain

In Django 2.2 before 2.2.18, 3.0 before 3.0.12, and 3.1 before 3.1.6, the
django.utils.archive.extract method (used by startapp --template and
startproject --template) allows directory traversal via an archive with
absolute paths or relative paths with dot segments.

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-3281

Upstream patches:
https://github.com/django/django/commit/21e7622dec1f8612c85c2fc37fe8efbfd3311e37
https://github.com/django/django/commit/02e6592835b4559909aa3aaaf67988fef435f624

Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
---
 .../python3-django-2.2.16/CVE-2021-3281.patch | 138 ++++++++++++++++++
 .../python3-django-3.1.1/CVE-2021-3281.patch  | 135 +++++++++++++++++
 .../python/python3-django_2.2.16.bb           |   2 +
 .../python/python3-django_3.1.1.bb            |   3 +
 4 files changed, 278 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-2.2.16/CVE-2021-3281.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-3.1.1/CVE-2021-3281.patch

diff --git a/meta-python/recipes-devtools/python/python3-django-2.2.16/CVE-2021-3281.patch b/meta-python/recipes-devtools/python/python3-django-2.2.16/CVE-2021-3281.patch
new file mode 100644
index 000000000..36591ce6f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-2.2.16/CVE-2021-3281.patch
@@ -0,0 +1,138 @@
+From 21e7622dec1f8612c85c2fc37fe8efbfd3311e37 Mon Sep 17 00:00:00 2001
+From: Mariusz Felisiak <felisiak.mariusz@gmail.com>
+Date: Fri, 22 Jan 2021 12:23:18 +0100
+Subject: [PATCH] Fixed CVE-2021-3281 -- Fixed potential directory-traversal
+ via archive.extract().
+
+Thanks Florian Apolloner, Shai Berger, and Simon Charette for reviews.
+
+Thanks Wang Baohua for the report.
+
+Backport of 05413afa8c18cdb978fcdf470e09f7a12b234a23 from master.
+
+Upstream-Status: Backport
+CVE: CVE-2021-3281
+
+Reference to upstream patch:
+[https://github.com/django/django/commit/21e7622dec1f8612c85c2fc37fe8efbfd3311e37]
+
+[SG: Adapted stable/2.2.x patch for 2.2.16]
+Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
+---
+ django/utils/archive.py           | 17 ++++++++++++++---
+ docs/releases/2.2.16.txt          | 10 ++++++++++
+ tests/utils_tests/test_archive.py | 21 +++++++++++++++++++++
+ 3 files changed, 45 insertions(+), 3 deletions(-)
+
+diff --git a/django/utils/archive.py b/django/utils/archive.py
+index 5b9998f..f2f153a 100644
+--- a/django/utils/archive.py
++++ b/django/utils/archive.py
+@@ -27,6 +27,8 @@ import stat
+ import tarfile
+ import zipfile
+ 
++from django.core.exceptions import SuspiciousOperation
++
+ 
+ class ArchiveException(Exception):
+     """
+@@ -133,6 +135,13 @@ class BaseArchive:
+                 return False
+         return True
+ 
++    def target_filename(self, to_path, name):
++        target_path = os.path.abspath(to_path)
++        filename = os.path.abspath(os.path.join(target_path, name))
++        if not filename.startswith(target_path):
++            raise SuspiciousOperation("Archive contains invalid path: '%s'" % name)
++        return filename
++
+     def extract(self):
+         raise NotImplementedError('subclasses of BaseArchive must provide an extract() method')
+ 
+@@ -155,7 +164,7 @@ class TarArchive(BaseArchive):
+             name = member.name
+             if leading:
+                 name = self.split_leading_dir(name)[1]
+-            filename = os.path.join(to_path, name)
++            filename = self.target_filename(to_path, name)
+             if member.isdir():
+                 if filename and not os.path.exists(filename):
+                     os.makedirs(filename)
+@@ -198,11 +207,13 @@ class ZipArchive(BaseArchive):
+             info = self._archive.getinfo(name)
+             if leading:
+                 name = self.split_leading_dir(name)[1]
+-            filename = os.path.join(to_path, name)
++            if not name:
++                continue
++            filename = self.target_filename(to_path, name)
+             dirname = os.path.dirname(filename)
+             if dirname and not os.path.exists(dirname):
+                 os.makedirs(dirname)
+-            if filename.endswith(('/', '\\')):
++            if name.endswith(('/', '\\')):
+                 # A directory
+                 if not os.path.exists(filename):
+                     os.makedirs(filename)
+diff --git a/docs/releases/2.2.16.txt b/docs/releases/2.2.16.txt
+index 31231fb..94682a1 100644
+--- a/docs/releases/2.2.16.txt
++++ b/docs/releases/2.2.16.txt
+@@ -4,6 +4,16 @@ Django 2.2.16 release notes
+ 
+ *September 1, 2020*
+ 
++Backported from Django 2.2.18 a fix for a security issue.
++
++CVE-2021-3281: Potential directory-traversal via ``archive.extract()``
++======================================================================
++
++The ``django.utils.archive.extract()`` function, used by
++:option:`startapp --template` and :option:`startproject --template`, allowed
++directory-traversal via an archive with absolute paths or relative paths with
++dot segments.
++
+ Django 2.2.16 fixes two security issues and two data loss bugs in 2.2.15.
+ 
+ CVE-2020-24583: Incorrect permissions on intermediate-level directories on Python 3.7+
+diff --git a/tests/utils_tests/test_archive.py b/tests/utils_tests/test_archive.py
+index d58d211..ed7908d 100644
+--- a/tests/utils_tests/test_archive.py
++++ b/tests/utils_tests/test_archive.py
+@@ -5,6 +5,8 @@ import sys
+ import tempfile
+ import unittest
+ 
++from django.core.exceptions import SuspiciousOperation
++from django.test import SimpleTestCase
+ from django.utils.archive import Archive, extract
+ 
+ TEST_DIR = os.path.join(os.path.dirname(__file__), 'archives')
+@@ -87,3 +89,22 @@ class TestGzipTar(ArchiveTester, unittest.TestCase):
+ 
+ class TestBzip2Tar(ArchiveTester, unittest.TestCase):
+     archive = 'foobar.tar.bz2'
++
++
++class TestArchiveInvalid(SimpleTestCase):
++    def test_extract_function_traversal(self):
++        archives_dir = os.path.join(os.path.dirname(__file__), 'traversal_archives')
++        tests = [
++            ('traversal.tar', '..'),
++            ('traversal_absolute.tar', '/tmp/evil.py'),
++        ]
++        if sys.platform == 'win32':
++            tests += [
++                ('traversal_disk_win.tar', 'd:evil.py'),
++                ('traversal_disk_win.zip', 'd:evil.py'),
++            ]
++        msg = "Archive contains invalid path: '%s'"
++        for entry, invalid_path in tests:
++            with self.subTest(entry), tempfile.TemporaryDirectory() as tmpdir:
++                with self.assertRaisesMessage(SuspiciousOperation, msg % invalid_path):
++                    extract(os.path.join(archives_dir, entry), tmpdir)
+-- 
+2.17.1
+
diff --git a/meta-python/recipes-devtools/python/python3-django-3.1.1/CVE-2021-3281.patch b/meta-python/recipes-devtools/python/python3-django-3.1.1/CVE-2021-3281.patch
new file mode 100644
index 000000000..08b87a45a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-3.1.1/CVE-2021-3281.patch
@@ -0,0 +1,135 @@
+From 02e6592835b4559909aa3aaaf67988fef435f624 Mon Sep 17 00:00:00 2001
+From: Mariusz Felisiak <felisiak.mariusz@gmail.com>
+Date: Fri, 22 Jan 2021 12:23:18 +0100
+Subject: [PATCH] Fixed CVE-2021-3281 -- Fixed potential directory-traversal
+ via archive.extract().
+
+Thanks Florian Apolloner, Shai Berger, and Simon Charette for reviews.
+
+Thanks Wang Baohua for the report.
+
+Backport of 05413afa8c18cdb978fcdf470e09f7a12b234a23 from master.
+
+Upstream-Status: Backport
+CVE: CVE-2021-3281
+
+Reference to upstream patch:
+[https://github.com/django/django/commit/02e6592835b4559909aa3aaaf67988fef435f624]
+
+[SG: Adapted stable/3.1.x patch for 3.1.1]
+Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
+---
+ django/utils/archive.py           | 17 ++++++++++++++---
+ docs/releases/3.1.1.txt           | 10 ++++++++++
+ tests/utils_tests/test_archive.py | 21 +++++++++++++++++++++
+ 3 files changed, 45 insertions(+), 3 deletions(-)
+
+diff --git a/django/utils/archive.py b/django/utils/archive.py
+index 235809f..d5a0cf0 100644
+--- a/django/utils/archive.py
++++ b/django/utils/archive.py
+@@ -27,6 +27,8 @@ import stat
+ import tarfile
+ import zipfile
+ 
++from django.core.exceptions import SuspiciousOperation
++
+ 
+ class ArchiveException(Exception):
+     """
+@@ -133,6 +135,13 @@ class BaseArchive:
+                 return False
+         return True
+ 
++    def target_filename(self, to_path, name):
++        target_path = os.path.abspath(to_path)
++        filename = os.path.abspath(os.path.join(target_path, name))
++        if not filename.startswith(target_path):
++            raise SuspiciousOperation("Archive contains invalid path: '%s'" % name)
++        return filename
++
+     def extract(self):
+         raise NotImplementedError('subclasses of BaseArchive must provide an extract() method')
+ 
+@@ -155,7 +164,7 @@ class TarArchive(BaseArchive):
+             name = member.name
+             if leading:
+                 name = self.split_leading_dir(name)[1]
+-            filename = os.path.join(to_path, name)
++            filename = self.target_filename(to_path, name)
+             if member.isdir():
+                 if filename:
+                     os.makedirs(filename, exist_ok=True)
+@@ -198,8 +207,10 @@ class ZipArchive(BaseArchive):
+             info = self._archive.getinfo(name)
+             if leading:
+                 name = self.split_leading_dir(name)[1]
+-            filename = os.path.join(to_path, name)
+-            if filename.endswith(('/', '\\')):
++            if not name:
++                continue
++            filename = self.target_filename(to_path, name)
++            if name.endswith(('/', '\\')):
+                 # A directory
+                 os.makedirs(filename, exist_ok=True)
+             else:
+diff --git a/docs/releases/3.1.1.txt b/docs/releases/3.1.1.txt
+index 0a702e9..ed23464 100644
+--- a/docs/releases/3.1.1.txt
++++ b/docs/releases/3.1.1.txt
+@@ -4,6 +4,16 @@ Django 3.1.1 release notes
+ 
+ *September 1, 2020*
+ 
++Backported from Django 3.1.6 a fix for a security issue.
++
++CVE-2021-3281: Potential directory-traversal via ``archive.extract()``
++======================================================================
++
++The ``django.utils.archive.extract()`` function, used by
++:option:`startapp --template` and :option:`startproject --template`, allowed
++directory-traversal via an archive with absolute paths or relative paths with
++dot segments.
++
+ Django 3.1.1 fixes two security issues and several bugs in 3.1.
+ 
+ CVE-2020-24583: Incorrect permissions on intermediate-level directories on Python 3.7+
+diff --git a/tests/utils_tests/test_archive.py b/tests/utils_tests/test_archive.py
+index dc7c4b4..8fdf3ec 100644
+--- a/tests/utils_tests/test_archive.py
++++ b/tests/utils_tests/test_archive.py
+@@ -4,6 +4,8 @@ import sys
+ import tempfile
+ import unittest
+ 
++from django.core.exceptions import SuspiciousOperation
++from django.test import SimpleTestCase
+ from django.utils import archive
+ 
+ 
+@@ -45,3 +47,22 @@ class TestArchive(unittest.TestCase):
+                 # A file is readable even if permission data is missing.
+                 filepath = os.path.join(tmpdir, 'no_permissions')
+                 self.assertEqual(os.stat(filepath).st_mode & mask, 0o666 & ~umask)
++
++
++class TestArchiveInvalid(SimpleTestCase):
++    def test_extract_function_traversal(self):
++        archives_dir = os.path.join(os.path.dirname(__file__), 'traversal_archives')
++        tests = [
++            ('traversal.tar', '..'),
++            ('traversal_absolute.tar', '/tmp/evil.py'),
++        ]
++        if sys.platform == 'win32':
++            tests += [
++                ('traversal_disk_win.tar', 'd:evil.py'),
++                ('traversal_disk_win.zip', 'd:evil.py'),
++            ]
++        msg = "Archive contains invalid path: '%s'"
++        for entry, invalid_path in tests:
++            with self.subTest(entry), tempfile.TemporaryDirectory() as tmpdir:
++                with self.assertRaisesMessage(SuspiciousOperation, msg % invalid_path):
++                    archive.extract(os.path.join(archives_dir, entry), tmpdir)
+-- 
+2.17.1
+
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.16.bb b/meta-python/recipes-devtools/python/python3-django_2.2.16.bb
index 0715abbd4..2ad14f83e 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.16.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.16.bb
@@ -7,3 +7,5 @@ SRC_URI[sha256sum] = "62cf45e5ee425c52e411c0742e641a6588b7e8af0d2c274a27940931b2
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-sqlparse \
 "
+SRC_URI += "file://CVE-2021-3281.patch \
+"
diff --git a/meta-python/recipes-devtools/python/python3-django_3.1.1.bb b/meta-python/recipes-devtools/python/python3-django_3.1.1.bb
index ed6513d0c..bd7261355 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.1.1.bb
@@ -8,6 +8,9 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-sqlparse \
 "
 
+SRC_URI += "file://CVE-2021-3281.patch \
+"
+
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 3.x branch, 
 # PREFERRED_VERSION_python3-django = "3.1.1" can be added to local.conf
-- 
2.17.1

