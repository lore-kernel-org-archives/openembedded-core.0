Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91F65EB64DD
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 10:04:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13427.1688551462194898027
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 03:04:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C554F16F2;
	Wed,  5 Jul 2023 03:05:03 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 00A853F762;
	Wed,  5 Jul 2023 03:04:20 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] python3-jsonpointer: upgrade to 2.4
Date: Wed,  5 Jul 2023 11:04:18 +0100
Message-Id: <20230705100419.3696292-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 10:04:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183881

From: Ross Burton <ross.burton@arm.com>

Drop the merged patch.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../0001-Clean-up-test-runner.patch           | 62 -------------------
 ...nter_2.3.bb =3D> python3-jsonpointer_2.4.bb} |  4 +-
 2 files changed, 1 insertion(+), 65 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-jsonpointer/0001=
-Clean-up-test-runner.patch
 rename meta/recipes-devtools/python/{python3-jsonpointer_2.3.bb =3D> pyt=
hon3-jsonpointer_2.4.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-jsonpointer/0001-Clean-=
up-test-runner.patch b/meta/recipes-devtools/python/python3-jsonpointer/0=
001-Clean-up-test-runner.patch
deleted file mode 100644
index 4121834dbfb..00000000000
--- a/meta/recipes-devtools/python/python3-jsonpointer/0001-Clean-up-test=
-runner.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 04a864f33848da6af1dea906ba4922770022ef66 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Thu, 16 Mar 2023 14:21:32 +0000
-Subject: [PATCH] Clean up test runner
-
-Test code doesn't need to manually construct a TestSuite and a
-TextTestRunner, the unittest module has a discovery function that does
-all this for you.
-
-Delete all of the manual logic from tests.py, replace it with the two
-lines to bring in the doctest unit tests, and update the makefile to
-run the unittest discovery.
-
-Upstream-Status: Submitted [https://github.com/stefankoegl/python-json-p=
ointer/pull/54]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- makefile |  2 +-
- tests.py | 24 ++++--------------------
- 2 files changed, 5 insertions(+), 21 deletions(-)
-
-diff --git a/tests.py b/tests.py
-index 9252369..6b4b8cc 100755
---- a/tests.py
-+++ b/tests.py
-@@ -7,6 +7,7 @@ import doctest
- import unittest
- import sys
- import copy
-+import jsonpointer
- from jsonpointer import resolve_pointer, EndOfList, JsonPointerExceptio=
n, \
-          JsonPointer, set_pointer
-=20
-@@ -410,23 +411,6 @@ class AltTypesTests(unittest.TestCase):
-         self.assertRaises(JsonPointerException, resolve_pointer, doc, '=
/root/1/2/3/4')
-=20
-=20
--
--suite =3D unittest.TestSuite()
--suite.addTest(unittest.makeSuite(SpecificationTests))
--suite.addTest(unittest.makeSuite(ComparisonTests))
--suite.addTest(unittest.makeSuite(WrongInputTests))
--suite.addTest(unittest.makeSuite(ToLastTests))
--suite.addTest(unittest.makeSuite(SetTests))
--suite.addTest(unittest.makeSuite(AltTypesTests))
--
--modules =3D ['jsonpointer']
--
--for module in modules:
--    m =3D __import__(module, fromlist=3D[module])
--    suite.addTest(doctest.DocTestSuite(m))
--
--runner =3D unittest.TextTestRunner(verbosity=3D1)
--result =3D runner.run(suite)
--
--if not result.wasSuccessful():
--    sys.exit(1)
-+def load_tests(loader, tests, ignore):
-+    tests.addTests(doctest.DocTestSuite(jsonpointer))
-+    return tests
---=20
-2.34.1
-
diff --git a/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb b/me=
ta/recipes-devtools/python/python3-jsonpointer_2.4.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-jsonpointer_2.3.bb
rename to meta/recipes-devtools/python/python3-jsonpointer_2.4.bb
index 0ec4de055c5..d7a1fea70ae 100644
--- a/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb
+++ b/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb
@@ -5,9 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D32b15c843b=
7a329130f4e266a281ebb3"
=20
 inherit pypi ptest setuptools3
=20
-SRC_URI +=3D "file://0001-Clean-up-test-runner.patch"
-
-SRC_URI[sha256sum] =3D "97cba51526c829282218feb99dab1b1e6bdf8efd1c43dc9d=
57be093c0d69c99a"
+SRC_URI[sha256sum] =3D "585cee82b70211fa9e6043b7bb89db6e1aa49524340dde8a=
d6b63206ea689d88"
=20
 RDEPENDS:${PN} +=3D " \
     ${PYTHON_PN}-json \
--=20
2.34.1


