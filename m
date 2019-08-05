Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1CA3F7E71C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 09:38:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x759cJbJ007748
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Aug 2019 02:38:19 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 5 Aug 2019 02:38:18 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Aug 2019 02:38:18 -0700
Message-ID: <20190805093818.61993-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] python3: fix the test_locale output format
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Aug 2019 09:38:19 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Before this patch:
 # python3 -m test -v test_locale
 [snip]
 test_getsetlocale_issue1813 (test.test_locale.TestMiscellaneous) ... testing with ('tr_TR', 'ISO8859-9') ok
 [snip]

 After this patch:
 # python3 -m test -v test_locale
 [snip]
 test_getsetlocale_issue1813 (test.test_locale.TestMiscellaneous) ... testing with ('tr_TR', 'ISO8859-9')... ok
 [snip]

Make the test ended with "... ok" is common in python
unittest world, we should make it keep consistent
with other test cases in case it may be ignored to
record in the report if we use the common filter
"... ok".

[YOCTO #13298]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...le.py-correct-the-test-output-format.patch | 46 +++++++++++++++++++
 meta/recipes-devtools/python/python3_3.7.4.bb |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch

diff --git a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
new file mode 100644
index 0000000000..35b7e0c480
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
@@ -0,0 +1,46 @@
+From b94995e0c694ec9561efec0d1a59b323340e6105 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Mon, 5 Aug 2019 15:57:39 +0800
+Subject: [PATCH] test_locale.py: correct the test output format
+
+Before this patch:
+ # python3 -m test -v test_locale
+ [snip]
+ test_getsetlocale_issue1813 (test.test_locale.TestMiscellaneous) ... testing with ('tr_TR', 'ISO8859-9') ok
+ [snip]
+
+ After this patch:
+ # python3 -m test -v test_locale
+ [snip]
+ test_getsetlocale_issue1813 (test.test_locale.TestMiscellaneous) ... testing with ('tr_TR', 'ISO8859-9')... ok
+ [snip]
+
+ Make the test ended with "... ok" is common in python
+ unittest world, we should make it keep consistent
+ with other test cases in case it may be ignored to
+ record in the report if we use the common filter
+ "... ok".
+
+Upstream-Status: Submitted [https://github.com/python/cpython/pull/15132]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ Lib/test/test_locale.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Lib/test/test_locale.py b/Lib/test/test_locale.py
+index e2c2178..558d63c 100644
+--- a/Lib/test/test_locale.py
++++ b/Lib/test/test_locale.py
+@@ -527,7 +527,7 @@ class TestMiscellaneous(unittest.TestCase):
+             self.skipTest('test needs Turkish locale')
+         loc = locale.getlocale(locale.LC_CTYPE)
+         if verbose:
+-            print('testing with %a' % (loc,), end=' ', flush=True)
++            print('testing with %a...' % (loc,), end=' ', flush=True)
+         locale.setlocale(locale.LC_CTYPE, loc)
+         self.assertEqual(loc, locale.getlocale(locale.LC_CTYPE))
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/python/python3_3.7.4.bb b/meta/recipes-devtools/python/python3_3.7.4.bb
index 59d7024988..80c9b2919e 100644
--- a/meta/recipes-devtools/python/python3_3.7.4.bb
+++ b/meta/recipes-devtools/python/python3_3.7.4.bb
@@ -27,6 +27,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 	   file://crosspythonpath.patch \
            file://reformat_sysconfig.py \
            file://0001-Use-FLAG_REF-always-for-interned-strings.patch \
+           file://0001-test_locale.py-correct-the-test-output-format.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.21.0


