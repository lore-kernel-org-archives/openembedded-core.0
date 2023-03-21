Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2CF7C761A6
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 12:38:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11717.1679402283700708916
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 05:38:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57A94C14;
	Tue, 21 Mar 2023 05:38:47 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8A4143F71E;
	Tue, 21 Mar 2023 05:38:02 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH v2 17/17] python3-jsonpointer: rewrite testing
Date: Tue, 21 Mar 2023 12:37:45 +0000
Message-Id: <20230321123745.1248462-17-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230321123745.1248462-1-ross.burton@arm.com>
References: <20230321123745.1248462-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 12:38:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178870

The tests installed by jsonpointer use unittest not pytest, so update
the dependencies.

Use the unittest runner in python3-unittest-automake-output to get the
correct output.

Apply a patch so the test suite doesn't run twice.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../0001-Clean-up-test-runner.patch           | 62 +++++++++++++++++++
 .../python/python3-jsonpointer/run-ptest      |  2 +-
 .../python/python3-jsonpointer_2.3.bb         |  6 +-
 3 files changed, 68 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-jsonpointer/0001=
-Clean-up-test-runner.patch

diff --git a/meta/recipes-devtools/python/python3-jsonpointer/0001-Clean-=
up-test-runner.patch b/meta/recipes-devtools/python/python3-jsonpointer/0=
001-Clean-up-test-runner.patch
new file mode 100644
index 00000000000..4121834dbfb
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-jsonpointer/0001-Clean-up-test=
-runner.patch
@@ -0,0 +1,62 @@
+From 04a864f33848da6af1dea906ba4922770022ef66 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Thu, 16 Mar 2023 14:21:32 +0000
+Subject: [PATCH] Clean up test runner
+
+Test code doesn't need to manually construct a TestSuite and a
+TextTestRunner, the unittest module has a discovery function that does
+all this for you.
+
+Delete all of the manual logic from tests.py, replace it with the two
+lines to bring in the doctest unit tests, and update the makefile to
+run the unittest discovery.
+
+Upstream-Status: Submitted [https://github.com/stefankoegl/python-json-p=
ointer/pull/54]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ makefile |  2 +-
+ tests.py | 24 ++++--------------------
+ 2 files changed, 5 insertions(+), 21 deletions(-)
+
+diff --git a/tests.py b/tests.py
+index 9252369..6b4b8cc 100755
+--- a/tests.py
++++ b/tests.py
+@@ -7,6 +7,7 @@ import doctest
+ import unittest
+ import sys
+ import copy
++import jsonpointer
+ from jsonpointer import resolve_pointer, EndOfList, JsonPointerExceptio=
n, \
+          JsonPointer, set_pointer
+=20
+@@ -410,23 +411,6 @@ class AltTypesTests(unittest.TestCase):
+         self.assertRaises(JsonPointerException, resolve_pointer, doc, '=
/root/1/2/3/4')
+=20
+=20
+-
+-suite =3D unittest.TestSuite()
+-suite.addTest(unittest.makeSuite(SpecificationTests))
+-suite.addTest(unittest.makeSuite(ComparisonTests))
+-suite.addTest(unittest.makeSuite(WrongInputTests))
+-suite.addTest(unittest.makeSuite(ToLastTests))
+-suite.addTest(unittest.makeSuite(SetTests))
+-suite.addTest(unittest.makeSuite(AltTypesTests))
+-
+-modules =3D ['jsonpointer']
+-
+-for module in modules:
+-    m =3D __import__(module, fromlist=3D[module])
+-    suite.addTest(doctest.DocTestSuite(m))
+-
+-runner =3D unittest.TextTestRunner(verbosity=3D1)
+-result =3D runner.run(suite)
+-
+-if not result.wasSuccessful():
+-    sys.exit(1)
++def load_tests(loader, tests, ignore):
++    tests.addTests(doctest.DocTestSuite(jsonpointer))
++    return tests
+--=20
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-jsonpointer/run-ptest b=
/meta/recipes-devtools/python/python3-jsonpointer/run-ptest
index 51e609f4bad..7ebd69231f2 100644
--- a/meta/recipes-devtools/python/python3-jsonpointer/run-ptest
+++ b/meta/recipes-devtools/python/python3-jsonpointer/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
=20
-python3 tests.py
+python3 -mputao.unittest tests.py
diff --git a/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb b/me=
ta/recipes-devtools/python/python3-jsonpointer_2.3.bb
index 16d5cab4cfb..0ec4de055c5 100644
--- a/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb
+++ b/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D32b15c843b=
7a329130f4e266a281ebb3"
=20
 inherit pypi ptest setuptools3
=20
+SRC_URI +=3D "file://0001-Clean-up-test-runner.patch"
+
 SRC_URI[sha256sum] =3D "97cba51526c829282218feb99dab1b1e6bdf8efd1c43dc9d=
57be093c0d69c99a"
=20
 RDEPENDS:${PN} +=3D " \
@@ -18,7 +20,9 @@ SRC_URI +=3D " \
 "
=20
 RDEPENDS:${PN}-ptest +=3D " \
-	${PYTHON_PN}-pytest \
+	${PYTHON_PN}-doctest \
+	${PYTHON_PN}-unittest \
+	${PYTHON_PN}-unittest-automake-output \
 "
=20
 do_install_ptest() {
--=20
2.34.1


