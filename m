Return-Path: <okaya@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 20EC0746E8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 00:39:16 +0000 (UTC)
Received: from
	sinanubuntu1604.mkjiurmyylmellclgttazegk5f.bx.internal.cloudapp.net
	(unknown [13.68.168.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 5269F20877;
	Fri,  5 Oct 2018 00:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1538699957;
	bh=ORCJ+qs+55MmwV9+4GGZyLj2jFRoWkTvkYmkJbROhtE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O9oCFW6y20IgJ6cwM/fRul2DQmb1jxS8b+4cdrb94YYIfpQsz6z8QN4qsnFbAZij6
	B32xP4egayWhdTcYgTmWLgU/21Efx/f8vGtXRVp+bISAv8/AVTnCQDg/kkjgcoZFmu
	IRoVbq+W4DRPZbbIttF8uyvKUJyURR/TrGJblaSU=
From: Sinan Kaya <okaya@kernel.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Oct 2018 00:39:08 +0000
Message-Id: <20181005003908.6888-2-okaya@kernel.org>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181005003908.6888-1-okaya@kernel.org>
References: <20181005003908.6888-1-okaya@kernel.org>
MIME-Version: 1.0
Subject: [sumo] [PATCH v1 2/2] python3: CVE-2018-1061
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
X-List-Received-Date: Fri, 05 Oct 2018 00:39:16 -0000
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

Affects < 3.5.6rc1

CVE: CVE-2018-1060
CVE: CVE-2018-1061
Ref: https://access.redhat.com/security/cve/cve-2018-1060
Ref: https://access.redhat.com/security/cve/cve-2018-1061

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 .../python/python3/CVE-2018-1061.patch        | 165 ++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.5.bb |   1 +
 2 files changed, 166 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2018-1061.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2018-1061.patch b/meta/recipes-devtools/python/python3/CVE-2018-1061.patch
new file mode 100644
index 0000000000..6373be389a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2018-1061.patch
@@ -0,0 +1,165 @@
+From 6d7ef39198856395edd62ef143bfcfaaf2ed6e25 Mon Sep 17 00:00:00 2001
+From: Ned Deily <nad@python.org>
+Date: Sun, 11 Mar 2018 14:29:05 -0400
+Subject: [PATCH] [3.5] bpo-32981: Fix catastrophic backtracking vulns
+ (GH-5955) (#6034)
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
+CVE: CVE-2018-1061
+CVE: CVE-2018-1060
+Upstream-Status: Backport [https://github.com/python/cpython/commit/937ac1fe069a4dc8471dff205f553d82e724015b]
+Signed-off-by: Sinan Kaya <okaya@kernel.org>
+---
+ Lib/difflib.py                                |  2 +-
+ Lib/poplib.py                                 |  2 +-
+ Lib/test/test_difflib.py                      | 22 ++++++++++++++++++-
+ Lib/test/test_poplib.py                       | 12 +++++++++-
+ Misc/ACKS                                     |  1 +
+ .../2018-03-02-10-24-52.bpo-32981.O_qDyj.rst  |  4 ++++
+ 6 files changed, 39 insertions(+), 4 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2018-03-02-10-24-52.bpo-32981.O_qDyj.rst
+
+diff --git a/Lib/difflib.py b/Lib/difflib.py
+index 076bbac01d..b4ec335056 100644
+--- a/Lib/difflib.py
++++ b/Lib/difflib.py
+@@ -1083,7 +1083,7 @@ class Differ:
+ 
+ import re
+ 
+-def IS_LINE_JUNK(line, pat=re.compile(r"\s*#?\s*$").match):
++def IS_LINE_JUNK(line, pat=re.compile(r"\s*(?:#\s*)?$").match):
+     r"""
+     Return 1 for ignorable line: iff `line` is blank or contains a single '#'.
+ 
+diff --git a/Lib/poplib.py b/Lib/poplib.py
+index 516b6f060d..2437ea0e27 100644
+--- a/Lib/poplib.py
++++ b/Lib/poplib.py
+@@ -308,7 +308,7 @@ class POP3:
+         return self._shortcmd('RPOP %s' % user)
+ 
+ 
+-    timestamp = re.compile(br'\+OK.*(<[^>]+>)')
++    timestamp = re.compile(br'\+OK.[^<]*(<.*>)')
+ 
+     def apop(self, user, password):
+         """Authorisation
+diff --git a/Lib/test/test_difflib.py b/Lib/test/test_difflib.py
+index ab9debf8e2..b6c8a7dd5b 100644
+--- a/Lib/test/test_difflib.py
++++ b/Lib/test/test_difflib.py
+@@ -466,13 +466,33 @@ class TestBytes(unittest.TestCase):
+             list(generator(*args))
+         self.assertEqual(msg, str(ctx.exception))
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
+-        TestOutputFormat, TestBytes, Doctests)
++        TestOutputFormat, TestBytes, TestJunkAPIs, Doctests)
+ 
+ if __name__ == '__main__':
+     test_main()
+diff --git a/Lib/test/test_poplib.py b/Lib/test/test_poplib.py
+index bceeb93ad1..799e403652 100644
+--- a/Lib/test/test_poplib.py
++++ b/Lib/test/test_poplib.py
+@@ -300,9 +300,19 @@ class TestPOP3Class(TestCase):
+     def test_rpop(self):
+         self.assertOK(self.client.rpop('foo'))
+ 
+-    def test_apop(self):
++    def test_apop_normal(self):
+         self.assertOK(self.client.apop('foo', 'dummypassword'))
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
+         expected =  (b'+OK 116 bytes',
+                      [b'From: postmaster@python.org', b'Content-Type: text/plain',
+diff --git a/Misc/ACKS b/Misc/ACKS
+index 1a35aad66c..72c5d740bd 100644
+--- a/Misc/ACKS
++++ b/Misc/ACKS
+@@ -341,6 +341,7 @@ Kushal Das
+ Jonathan Dasteel
+ Pierre-Yves David
+ A. Jesse Jiryu Davis
++Jamie (James C.) Davis
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
diff --git a/meta/recipes-devtools/python/python3_3.5.5.bb b/meta/recipes-devtools/python/python3_3.5.5.bb
index 4dae4fa4c6..c28be32925 100644
--- a/meta/recipes-devtools/python/python3_3.5.5.bb
+++ b/meta/recipes-devtools/python/python3_3.5.5.bb
@@ -37,6 +37,7 @@ SRC_URI += "\
             file://configure.ac-fix-LIBPL.patch \
             file://0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch \
             file://pass-missing-libraries-to-Extension-for-mul.patch \
+            file://CVE-2018-1061.patch \
            "
 SRC_URI[md5sum] = "f3763edf9824d5d3a15f5f646083b6e0"
 SRC_URI[sha256sum] = "063d2c3b0402d6191b90731e0f735c64830e7522348aeb7ed382a83165d45009"
-- 
2.19.0


