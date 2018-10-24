Return-Path: <okaya@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 82A6678E4C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2018 16:02:08 +0000 (UTC)
Received: from
	sinanubuntu1604.mkjiurmyylmellclgttazegk5f.bx.internal.cloudapp.net
	(unknown [13.68.205.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 46309205F4;
	Wed, 24 Oct 2018 16:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1540396929;
	bh=16KlTglIH86LiVHrgdrX8GiVvyyfEPpJoTTeLYKsZVw=;
	h=From:To:Cc:Subject:Date:From;
	b=e7pJPyCc4sXRQCs3W4DRURv8fc3V799oB5eSEdnvHSmOz3tnBP2wT82AlpG1xfAUP
	yIPUbwQIMKewZz9x7zjzUQXEc0jj6Od3xGG7FRBfG0C0lo8CvBG9+FPbMvJGxoUQRi
	fZYtAzVHFfXiYAJPUL4H13fTPWCN3I0QXOR8Lpbw=
From: Sinan Kaya <okaya@kernel.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Oct 2018 16:02:06 +0000
Message-Id: <20181024160207.13429-1-okaya@kernel.org>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [sumo] [PATCH v1] python: CVE-2018-1061
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
X-List-Received-Date: Wed, 24 Oct 2018 16:02:08 -0000
Content-Transfer-Encoding: 8bit

* CVE-2018-1060
Prevent low-grade poplib REDOS:
The regex to test a mail server's timestamp is susceptible to
catastrophic backtracking on long evil responses from the server.

Happily, the maximum length of malicious inputs is 2K thanks
to a limit introduced in the fix for CVE-2013-1752.

* CVE-2018-1061
Prevent difflib REDOS
The default regex for IS_LINE_JUNK is susceptible to
catastrophic backtracking.
This is a potential DOS vector.
Replace it with an equivalent non-vulnerable regex.

Affects = 2.7

CVE: CVE-2018-1060
CVE: CVE-2018-1061
Ref: https://access.redhat.com/security/cve/cve-2018-1060
Ref: https://access.redhat.com/security/cve/cve-2018-1061
Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 .../python/python/CVE-2018-1061.patch         | 162 ++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.14.bb |   1 +
 2 files changed, 163 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/CVE-2018-1061.patch

diff --git a/meta/recipes-devtools/python/python/CVE-2018-1061.patch b/meta/recipes-devtools/python/python/CVE-2018-1061.patch
new file mode 100644
index 0000000000..d16b8e9185
--- /dev/null
+++ b/meta/recipes-devtools/python/python/CVE-2018-1061.patch
@@ -0,0 +1,162 @@
+From ee518362805f7f30d4fb11e784ada1e8f4167af9 Mon Sep 17 00:00:00 2001
+From: Benjamin Peterson <benjamin@python.org>
+Date: Sat, 3 Mar 2018 22:18:17 -0800
+Subject: [PATCH] [2.7] bpo-32981: Fix catastrophic backtracking vulns
+ (GH-5955)
+
+* Prevent low-grade poplib REDOS (CVE-2018-1060)
+
+The regex to test a mail server's timestamp is susceptible to
+catastrophic backtracking on long evil responses from the server.
+
+Happily, the maximum length of malicious inputs is 2K thanks
+to a limit introduced in the fix for CVE-2013-1752.
+
+A 2KB evil response from the mail server would result in small slowdowns
+(milliseconds vs. microseconds) accumulated over many apop calls.
+This is a potential DOS vector via accumulated slowdowns.
+
+Replace it with a similar non-vulnerable regex.
+
+The new regex is RFC compliant.
+The old regex was non-compliant in edge cases.
+
+* Prevent difflib REDOS (CVE-2018-1061)
+
+The default regex for IS_LINE_JUNK is susceptible to
+catastrophic backtracking.
+This is a potential DOS vector.
+
+Replace it with an equivalent non-vulnerable regex.
+
+Also introduce unit and REDOS tests for difflib.
+
+Co-authored-by: Tim Peters <tim.peters@gmail.com>
+Co-authored-by: Christian Heimes <christian@python.org>.
+(cherry picked from commit 0e6c8ee2358a2e23117501826c008842acb835ac)
+Signed-off-by: Sinan Kaya <okaya@kernel.org>
+CVE: CVE-2018-1061
+Upstream-Status: Backport [https://github.com/python/cpython/commit/e052d40cea15f582b50947f7d906b39744dc62a2]
+Signed-off-by: Sinan Kaya <okaya@kernel.org>
+---
+ Lib/difflib.py                                |  2 +-
+ Lib/poplib.py                                 |  2 +-
+ Lib/test/test_difflib.py                      | 22 ++++++++++++++++++-
+ Lib/test/test_poplib.py                       | 10 +++++++++
+ Misc/ACKS                                     |  2 ++
+ .../2018-03-02-10-24-52.bpo-32981.O_qDyj.rst  |  4 ++++
+ 6 files changed, 39 insertions(+), 3 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2018-03-02-10-24-52.bpo-32981.O_qDyj.rst
+
+diff --git a/Lib/difflib.py b/Lib/difflib.py
+index 1c6fbdbedc..788a92df3f 100644
+--- a/Lib/difflib.py
++++ b/Lib/difflib.py
+@@ -1103,7 +1103,7 @@ class Differ:
+ 
+ import re
+ 
+-def IS_LINE_JUNK(line, pat=re.compile(r"\s*#?\s*$").match):
++def IS_LINE_JUNK(line, pat=re.compile(r"\s*(?:#\s*)?$").match):
+     r"""
+     Return 1 for ignorable line: iff `line` is blank or contains a single '#'.
+ 
+diff --git a/Lib/poplib.py b/Lib/poplib.py
+index b91e5f72d2..a238510b38 100644
+--- a/Lib/poplib.py
++++ b/Lib/poplib.py
+@@ -274,7 +274,7 @@ class POP3:
+         return self._shortcmd('RPOP %s' % user)
+ 
+ 
+-    timestamp = re.compile(r'\+OK.*(<[^>]+>)')
++    timestamp = re.compile(br'\+OK.[^<]*(<.*>)')
+ 
+     def apop(self, user, secret):
+         """Authorisation
+diff --git a/Lib/test/test_difflib.py b/Lib/test/test_difflib.py
+index 35f2c36ca7..d8277b79b8 100644
+--- a/Lib/test/test_difflib.py
++++ b/Lib/test/test_difflib.py
+@@ -269,13 +269,33 @@ class TestOutputFormat(unittest.TestCase):
+         self.assertEqual(fmt(3,6), '4,6')
+         self.assertEqual(fmt(0,0), '0')
+ 
++class TestJunkAPIs(unittest.TestCase):
++    def test_is_line_junk_true(self):
++        for line in ['#', '  ', ' #', '# ', ' # ', '']:
++            self.assertTrue(difflib.IS_LINE_JUNK(line), repr(line))
++
++    def test_is_line_junk_false(self):
++        for line in ['##', ' ##', '## ', 'abc ', 'abc #', 'Mr. Moose is up!']:
++            self.assertFalse(difflib.IS_LINE_JUNK(line), repr(line))
++
++    def test_is_line_junk_REDOS(self):
++        evil_input = ('\t' * 1000000) + '##'
++        self.assertFalse(difflib.IS_LINE_JUNK(evil_input))
++
++    def test_is_character_junk_true(self):
++        for char in [' ', '\t']:
++            self.assertTrue(difflib.IS_CHARACTER_JUNK(char), repr(char))
++
++    def test_is_character_junk_false(self):
++        for char in ['a', '#', '\n', '\f', '\r', '\v']:
++            self.assertFalse(difflib.IS_CHARACTER_JUNK(char), repr(char))
+ 
+ def test_main():
+     difflib.HtmlDiff._default_prefix = 0
+     Doctests = doctest.DocTestSuite(difflib)
+     run_unittest(
+         TestWithAscii, TestAutojunk, TestSFpatches, TestSFbugs,
+-        TestOutputFormat, Doctests)
++        TestOutputFormat, TestJunkAPIs)
+ 
+ if __name__ == '__main__':
+     test_main()
+diff --git a/Lib/test/test_poplib.py b/Lib/test/test_poplib.py
+index 23d688724b..d2143759ba 100644
+--- a/Lib/test/test_poplib.py
++++ b/Lib/test/test_poplib.py
+@@ -211,6 +211,16 @@ class TestPOP3Class(TestCase):
+     def test_rpop(self):
+         self.assertOK(self.client.rpop('foo'))
+ 
++    def test_apop_REDOS(self):
++        # Replace welcome with very long evil welcome.
++        # NB The upper bound on welcome length is currently 2048.
++        # At this length, evil input makes each apop call take
++        # on the order of milliseconds instead of microseconds.
++        evil_welcome = b'+OK' + (b'<' * 1000000)
++        with test_support.swap_attr(self.client, 'welcome', evil_welcome):
++            # The evil welcome is invalid, so apop should throw.
++            self.assertRaises(poplib.error_proto, self.client.apop, 'a', 'kb')
++
+     def test_top(self):
+         expected =  ('+OK 116 bytes',
+                      ['From: postmaster@python.org', 'Content-Type: text/plain',
+diff --git a/Misc/ACKS b/Misc/ACKS
+index 229a874ffc..ef3c08557f 100644
+--- a/Misc/ACKS
++++ b/Misc/ACKS
+@@ -316,6 +316,8 @@ Kushal Das
+ Jonathan Dasteel
+ Pierre-Yves David
+ A. Jesse Jiryu Davis
++Jamie (James C.) Davis
++Ratnadeep Debnath
+ Merlijn van Deen
+ John DeGood
+ Ned Deily
+diff --git a/Misc/NEWS.d/next/Security/2018-03-02-10-24-52.bpo-32981.O_qDyj.rst b/Misc/NEWS.d/next/Security/2018-03-02-10-24-52.bpo-32981.O_qDyj.rst
+new file mode 100644
+index 0000000000..9ebabb44f9
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2018-03-02-10-24-52.bpo-32981.O_qDyj.rst
+@@ -0,0 +1,4 @@
++Regexes in difflib and poplib were vulnerable to catastrophic backtracking.
++These regexes formed potential DOS vectors (REDOS). They have been
++refactored. This resolves CVE-2018-1060 and CVE-2018-1061.
++Patch by Jamie Davis.
+-- 
+2.19.0
+
diff --git a/meta/recipes-devtools/python/python_2.7.14.bb b/meta/recipes-devtools/python/python_2.7.14.bb
index b923b9237b..6986b484bd 100644
--- a/meta/recipes-devtools/python/python_2.7.14.bb
+++ b/meta/recipes-devtools/python/python_2.7.14.bb
@@ -31,6 +31,7 @@ SRC_URI += "\
   file://pass-missing-libraries-to-Extension-for-mul.patch \
   file://support_SOURCE_DATE_EPOCH_in_py_compile_2.7.patch \
   file://fix-gc-alignment.patch \
+  file://CVE-2018-1061.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
2.19.0


