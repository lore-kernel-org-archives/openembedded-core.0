Return-Path: <anuj.mittal@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5DABE7F97E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Nov 2019 14:54:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Nov 2019 06:54:39 -0800
X-IronPort-AV: E=Sophos;i="5.68,289,1569308400"; d="scan'208";a="197423072"
Received: from wkwak-mobl1.gar.corp.intel.com (HELO
	anmitta2-mobl1.gar.corp.intel.com) ([10.252.8.93])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Nov 2019 06:54:37 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Nov 2019 22:54:11 +0800
Message-Id: <20191110145416.5171-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191110145416.5171-1-anuj.mittal@intel.com>
References: <20191110145416.5171-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] python3: Upgrade 3.7.4 -> 3.7.5
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
X-List-Received-Date: Sun, 10 Nov 2019 14:54:38 -0000
Content-Transfer-Encoding: 8bit

From: Adrian Bunk <bunk@stusta.de>

Backported patch removed.

3.7.5 also includes the fix for CVE-2019-16935.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...lib-as-location-for-site-packages-an.patch |   2 +-
 ...nt-parse-domains-containing-GH-13079.patch | 132 ------------------
 ...asename-to-replace-CC-for-checking-c.patch |   2 +-
 .../{python3_3.7.4.bb => python3_3.7.5.bb}    |   5 +-
 4 files changed, 4 insertions(+), 137 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-bpo-34155-Dont-parse-domains-containing-GH-13079.patch
 rename meta/recipes-devtools/python/{python3_3.7.4.bb => python3_3.7.5.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch b/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch
index 661f52d01f..ea75262c4f 100644
--- a/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch
+++ b/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch
@@ -70,7 +70,7 @@ index 6e81b2f..671a20e 100644
  
  Programs/python.o: $(srcdir)/Programs/python.c
 @@ -856,7 +857,7 @@ regen-opcode:
- Python/compile.o Python/symtable.o Python/ast_unparse.o Python/ast.o: $(srcdir)/Include/graminit.h $(srcdir)/Include/Python-ast.h
+ Python/compile.o Python/symtable.o Python/ast_unparse.o Python/ast.o Python/future.o Parser/parsetok.o: $(srcdir)/Include/graminit.h $(srcdir)/Include/Python-ast.h
  
  Python/getplatform.o: $(srcdir)/Python/getplatform.c
 -		$(CC) -c $(PY_CORE_CFLAGS) -DPLATFORM='"$(MACHDEP)"' -o $@ $(srcdir)/Python/getplatform.c
diff --git a/meta/recipes-devtools/python/python3/0001-bpo-34155-Dont-parse-domains-containing-GH-13079.patch b/meta/recipes-devtools/python/python3/0001-bpo-34155-Dont-parse-domains-containing-GH-13079.patch
deleted file mode 100644
index 319e7ed07e..0000000000
--- a/meta/recipes-devtools/python/python3/0001-bpo-34155-Dont-parse-domains-containing-GH-13079.patch
+++ /dev/null
@@ -1,132 +0,0 @@
-From 90d56127ae15b1e452755e62c77dc475dedf7161 Mon Sep 17 00:00:00 2001
-From: jpic <jpic@users.noreply.github.com>
-Date: Wed, 17 Jul 2019 23:54:25 +0200
-Subject: [PATCH] bpo-34155: Dont parse domains containing @ (GH-13079)
-
-Before:
-
-        >>> email.message_from_string('From: a@malicious.org@important.com', policy=email.policy.default)['from'].addresses
-        (Address(display_name='', username='a', domain='malicious.org'),)
-
-        >>> parseaddr('a@malicious.org@important.com')
-        ('', 'a@malicious.org')
-
-    After:
-
-        >>> email.message_from_string('From: a@malicious.org@important.com', policy=email.policy.default)['from'].addresses
-        (Address(display_name='', username='', domain=''),)
-
-        >>> parseaddr('a@malicious.org@important.com')
-        ('', 'a@')
-
-https://bugs.python.org/issue34155
-
-Upstream-Status: Backport [https://github.com/python/cpython/commit/8cb65d1381b027f0b09ee36bfed7f35bb4dec9a9]
-
-CVE: CVE-2019-16056
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- Lib/email/_header_value_parser.py                  |  2 ++
- Lib/email/_parseaddr.py                            | 11 ++++++++++-
- Lib/test/test_email/test__header_value_parser.py   | 10 ++++++++++
- Lib/test/test_email/test_email.py                  | 14 ++++++++++++++
- .../2019-05-04-13-33-37.bpo-34155.MJll68.rst       |  1 +
- 5 files changed, 37 insertions(+), 1 deletion(-)
- create mode 100644 Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-34155.MJll68.rst
-
-diff --git a/Lib/email/_header_value_parser.py b/Lib/email/_header_value_parser.py
-index fc00b4a098..bbc026ec71 100644
---- a/Lib/email/_header_value_parser.py
-+++ b/Lib/email/_header_value_parser.py
-@@ -1582,6 +1582,8 @@ def get_domain(value):
-         token, value = get_dot_atom(value)
-     except errors.HeaderParseError:
-         token, value = get_atom(value)
-+    if value and value[0] == '@':
-+        raise errors.HeaderParseError('Invalid Domain')
-     if leader is not None:
-         token[:0] = [leader]
-     domain.append(token)
-diff --git a/Lib/email/_parseaddr.py b/Lib/email/_parseaddr.py
-index cdfa3729ad..41ff6f8c00 100644
---- a/Lib/email/_parseaddr.py
-+++ b/Lib/email/_parseaddr.py
-@@ -379,7 +379,12 @@ class AddrlistClass:
-         aslist.append('@')
-         self.pos += 1
-         self.gotonext()
--        return EMPTYSTRING.join(aslist) + self.getdomain()
-+        domain = self.getdomain()
-+        if not domain:
-+            # Invalid domain, return an empty address instead of returning a
-+            # local part to denote failed parsing.
-+            return EMPTYSTRING
-+        return EMPTYSTRING.join(aslist) + domain
- 
-     def getdomain(self):
-         """Get the complete domain name from an address."""
-@@ -394,6 +399,10 @@ class AddrlistClass:
-             elif self.field[self.pos] == '.':
-                 self.pos += 1
-                 sdlist.append('.')
-+            elif self.field[self.pos] == '@':
-+                # bpo-34155: Don't parse domains with two `@` like
-+                # `a@malicious.org@important.com`.
-+                return EMPTYSTRING
-             elif self.field[self.pos] in self.atomends:
-                 break
-             else:
-diff --git a/Lib/test/test_email/test__header_value_parser.py b/Lib/test/test_email/test__header_value_parser.py
-index 693487bc96..7dc4de1b7b 100644
---- a/Lib/test/test_email/test__header_value_parser.py
-+++ b/Lib/test/test_email/test__header_value_parser.py
-@@ -1438,6 +1438,16 @@ class TestParser(TestParserMixin, TestEmailBase):
-         self.assertEqual(addr_spec.domain, 'example.com')
-         self.assertEqual(addr_spec.addr_spec, 'star.a.star@example.com')
- 
-+    def test_get_addr_spec_multiple_domains(self):
-+        with self.assertRaises(errors.HeaderParseError):
-+            parser.get_addr_spec('star@a.star@example.com')
-+
-+        with self.assertRaises(errors.HeaderParseError):
-+            parser.get_addr_spec('star@a@example.com')
-+
-+        with self.assertRaises(errors.HeaderParseError):
-+            parser.get_addr_spec('star@172.17.0.1@example.com')
-+
-     # get_obs_route
- 
-     def test_get_obs_route_simple(self):
-diff --git a/Lib/test/test_email/test_email.py b/Lib/test/test_email/test_email.py
-index c29cc56203..aa775881c5 100644
---- a/Lib/test/test_email/test_email.py
-+++ b/Lib/test/test_email/test_email.py
-@@ -3041,6 +3041,20 @@ class TestMiscellaneous(TestEmailBase):
-         self.assertEqual(utils.parseaddr('<>'), ('', ''))
-         self.assertEqual(utils.formataddr(utils.parseaddr('<>')), '')
- 
-+    def test_parseaddr_multiple_domains(self):
-+        self.assertEqual(
-+            utils.parseaddr('a@b@c'),
-+            ('', '')
-+        )
-+        self.assertEqual(
-+            utils.parseaddr('a@b.c@c'),
-+            ('', '')
-+        )
-+        self.assertEqual(
-+            utils.parseaddr('a@172.17.0.1@c'),
-+            ('', '')
-+        )
-+
-     def test_noquote_dump(self):
-         self.assertEqual(
-             utils.formataddr(('A Silly Person', 'person@dom.ain')),
-diff --git a/Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-34155.MJll68.rst b/Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-34155.MJll68.rst
-new file mode 100644
-index 0000000000..50292e29ed
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-34155.MJll68.rst
-@@ -0,0 +1 @@
-+Fix parsing of invalid email addresses with more than one ``@`` (e.g. a@b@c.com.) to not return the part before 2nd ``@`` as valid email address. Patch by maxking & jpic.
diff --git a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
index 5735954628..a0ea897f4e 100644
--- a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
+++ b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
@@ -63,7 +63,7 @@ index a7de901..4a3681f 100644
 +  case $cc_basename in
      *clang*)
        AC_SUBST(LLVM_AR)
-       AC_PATH_TARGET_TOOL(LLVM_AR, llvm-ar, '', ${llvm_path})
+       AC_PATH_TOOL(LLVM_AR, llvm-ar, '', ${llvm_path})
 @@ -1426,7 +1427,7 @@ then
    fi
  fi
diff --git a/meta/recipes-devtools/python/python3_3.7.4.bb b/meta/recipes-devtools/python/python3_3.7.5.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.7.4.bb
rename to meta/recipes-devtools/python/python3_3.7.5.bb
index 42818bfff2..137b540dba 100644
--- a/meta/recipes-devtools/python/python3_3.7.4.bb
+++ b/meta/recipes-devtools/python/python3_3.7.5.bb
@@ -28,7 +28,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://reformat_sysconfig.py \
            file://0001-Use-FLAG_REF-always-for-interned-strings.patch \
            file://0001-test_locale.py-correct-the-test-output-format.patch \
-           file://0001-bpo-34155-Dont-parse-domains-containing-GH-13079.patch \
            "
 
 SRC_URI_append_class-native = " \
@@ -39,8 +38,8 @@ SRC_URI_append_class-nativesdk = " \
            file://0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch \
            "
 
-SRC_URI[md5sum] = "d33e4aae66097051c2eca45ee3604803"
-SRC_URI[sha256sum] = "fb799134b868199930b75f26678f18932214042639cd52b16da7fd134cd9b13f"
+SRC_URI[md5sum] = "08ed8030b1183107c48f2092e79a87e2"
+SRC_URI[sha256sum] = "e85a76ea9f3d6c485ec1780fca4e500725a4a7bbc63c78ebc44170de9b619d94"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.21.0


