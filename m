Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E76C531C7
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 08:38:39 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19049.1784795914033422205
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 01:38:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=GWk4PoWM;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9430; q=dns/txt;
  s=iport01; t=1784795914; x=1786005514;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1bFQOonJLCT5Dv/Sypyf1ePC6HCcWKPLOFOhn5DRHjQ=;
  b=GWk4PoWMK7DsJpitN7z3HNN+VPv1g8xyk/ygK9d+9XJa5/DJVU+IAWXy
   qVZmFaQE46qxwDPSKN93KSxYAIgopu8F1/fHTa7Sg8rgnVcLK63c5zH5b
   JTWSLD6bhVDiSa13caymNBQK9CpIbOvuza8URtM71cln/2v5gXpD/7jIG
   37W2nmy71V9uPu1jqCv9rQMvXQk0QvghF2RR+XoZTF12zTmJ7w874fCpq
   VLhoTZrOfmD7XeeqeR6Ln+LDp7KlwsyoixZOqFdzdsXh0o0qFKboZ377F
   ZRvpKfHizLRxqj6hcCykOEIroyoUYSQNp0ptXP3jF0UPpY182ybpS11j9
   g==;
X-CSE-ConnectionGUID: 5AZiUknMTz6vaDMCzv5Esw==
X-CSE-MsgGUID: iHrTtL0rSE6m6lgViNff6g==
X-IPAS-Result: =?us-ascii?q?A0BIAgCb0mFq/5L/Ja1aHgEBCxIMggULgld0XkNJhFeRc?=
 =?us-ascii?q?4EWnQiBfg8BAQEPRA0EAQGEP0aNXAImNAkOAQIEAwIDAQEBAQEBAQEBAQELA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDYZaAQIBJgQLARgBLSwDAQIDAiYCLSMhgwIBgnQDE?=
 =?us-ascii?q?cFBen8zgQGDKAE/AkNQ2y4BCxQBBYEFLoU/gx0BhQJcGAGEfCcbG4FygRWCc?=
 =?us-ascii?q?3aBBYFcAQGBJ4QUgmoEgiJ6EoFakFRIgQIcA1ksAVUTDQoLBwWBZgM1EioVb?=
 =?us-ascii?q?jIdgSM+FzRYGwcFgR2BLoEChFwjHwM5f4EwdUp3LWkBEheBJoIUgToCgR0DC?=
 =?us-ascii?q?xgNSBEsNxQZBD0BbgeNcCOCNAdgFBoBCiF/gSBboweCIaEPCiiDdYwhj0KFe?=
 =?us-ascii?q?BozhVulEQuYfY4KllCEaYFoPIFHCwdwFYMiCUoZD444g2uBf1fLQicyAgkyA?=
 =?us-ascii?q?QEHAgcBDAEDC4FokACBfgEB?=
IronPort-Data: A9a23:lvyxBa7JN/RN4W5gE8RdlQxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 mYfWj3Xa6nbMWLyc4hwYdnl801Su5fczdQwTAo4/iozZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2Qqaj1OsPrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eYKQq+9t0B0Ry5
 6IGIRwoRQKd2s+t3+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGcGFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkERUrsUIMpWcOOAinrydzRZuVu9rqss6G+Vxwt0uFToGIeMJobQFJgOxi50o
 ErH337FHjVCLueylz/b9n2Sh8nBk330Ddd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBVCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:qkrXBa2flq9K8NVTo6VYUwqjBJAkLtp133Aq2lEZdPWaSKOlfq
 eV7ZAmPH7P+VMssR4b+OxoVJPsfZq+z+8W3WBuB9eftWDd0QPCRr2KhrGN/9SPIUHDH8dmpM
 BdmtBFeb7NJGk/q9rm6w+lFNtl6tyG/Ke0wdr69R5WPGdXg2UK1XYANu5deXcGPTV7OQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AVqpzH2rn+U59qemUe7a/7dbmUZ0MQHzgz3H1H13?=
 =?us-ascii?q?mF29FbZaHVwK947wxxg=3D=3D?=
X-Talos-MUID: 9a23:wwR6swvRfvfM0E+avs2nhRF4CNtMu76VJR4Iz5EJhciiOyIuNGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,180,1779148800"; 
   d="scan'208";a="514229530"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Jul 2026 08:38:32 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id B369118000200;
	Thu, 23 Jul 2026 08:38:32 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 354CCCAB20D; Thu, 23 Jul 2026 01:38:32 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH] python3-setuptools: Fix CVE-2026-59890
Date: Thu, 23 Jul 2026 01:38:28 -0700
Message-Id: <20260723083828.1254655-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 08:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241790

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/pypa/setuptools/commit/dd9f436a36486b4cb8a4c70a2321548b0be09b8f
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-59890

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-setuptools/CVE-2026-59890.patch   | 194 ++++++++++++++++++
 .../python/python3-setuptools_82.0.1.bb       |   3 +-
 2 files changed, 196 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/CVE-2026-59890.patch

diff --git a/meta/recipes-devtools/python/python3-setuptools/CVE-2026-59890.patch b/meta/recipes-devtools/python/python3-setuptools/CVE-2026-59890.patch
new file mode 100644
index 0000000000..7a6c86b40a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools/CVE-2026-59890.patch
@@ -0,0 +1,194 @@
+From 22e38898b6cec34f7e816c2664016e95afb024ad Mon Sep 17 00:00:00 2001
+From: "Jason R. Coombs" <jaraco@jaraco.com>
+Date: Sat, 27 Jun 2026 10:46:34 -0400
+Subject: [PATCH] Normalize Unicode form when matching MANIFEST.in patterns
+
+FileList matched MANIFEST.in patterns against on-disk names byte-for-byte
+with no Unicode normalization. On macOS APFS/HFS+, a file stored NFD and a
+pattern authored NFC denote the same file but differ byte-for-byte, so an
+exclude/global-exclude/recursive-exclude/prune rule could silently fail to
+drop a non-ASCII-named file, publishing it in the sdist despite the rule.
+
+Normalize both the pattern and the candidate path to NFC before matching,
+via a new unicode_utils.normalize() helper and a _NormalizedMatcher wrapper
+around the compiled pattern in translate_pattern.
+
+Fixes GHSA-h35f-9h28-mq5c.
+
+CVE: CVE-2026-59890
+Upstream-Status: Backport [https://github.com/pypa/setuptools/commit/dd9f436a36486b4cb8a4c70a2321548b0be09b8f]
+
+Co-Authored-By: Claude Opus 4.8 <noreply@anthropic.com>
+(cherry picked from commit dd9f436a36486b4cb8a4c70a2321548b0be09b8f)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ newsfragments/+ghsa-h35f-9h28-mq5c.bugfix.rst |  7 +++
+ setuptools/command/egg_info.py                | 28 +++++++++++-
+ setuptools/tests/test_manifest.py             | 45 +++++++++++++++++++
+ setuptools/unicode_utils.py                   | 14 ++++++
+ 4 files changed, 93 insertions(+), 1 deletion(-)
+ create mode 100644 newsfragments/+ghsa-h35f-9h28-mq5c.bugfix.rst
+
+diff --git a/newsfragments/+ghsa-h35f-9h28-mq5c.bugfix.rst b/newsfragments/+ghsa-h35f-9h28-mq5c.bugfix.rst
+new file mode 100644
+index 000000000..42d6c4cfe
+--- /dev/null
++++ b/newsfragments/+ghsa-h35f-9h28-mq5c.bugfix.rst
+@@ -0,0 +1,7 @@
++``MANIFEST.in`` matching (via ``FileList``) is now insensitive to Unicode
++normalization form. A pattern authored in one form (e.g. NFC, as typically
++saved by editors) now matches a file whose name is stored on disk in another
++(e.g. NFD, as produced by macOS APFS/HFS+). Previously an ``exclude``,
++``global-exclude``, ``recursive-exclude``, or ``prune`` rule could silently
++fail to drop a non-ASCII-named file from the source distribution, publishing
++it despite the exclusion -- see GHSA-h35f-9h28-mq5c.
+diff --git a/setuptools/command/egg_info.py b/setuptools/command/egg_info.py
+index a5b593270..138e29ee6 100644
+--- a/setuptools/command/egg_info.py
++++ b/setuptools/command/egg_info.py
+@@ -37,6 +37,27 @@ from distutils.util import convert_path
+ PY_MAJOR = f'{sys.version_info.major}.{sys.version_info.minor}'
+ 
+ 
++class _NormalizedMatcher:
++    """
++    Wrap a compiled pattern so that matching is insensitive to Unicode
++    normalization form.
++
++    File names walked from disk (NFD on macOS APFS/HFS+) and patterns from
++    ``MANIFEST.in`` (typically NFC) can denote the same file while differing
++    byte-for-byte. Normalizing both sides before matching keeps an exclusion
++    (or inclusion) from silently failing. See GHSA-h35f-9h28-mq5c.
++    """
++
++    def __init__(self, pattern: re.Pattern) -> None:
++        self._pattern = pattern
++
++    def match(self, path):
++        return self._pattern.match(unicode_utils.normalize(path))
++
++    def search(self, path):
++        return self._pattern.search(unicode_utils.normalize(path))
++
++
+ def translate_pattern(glob):  # noqa: C901  # is too complex (14)  # FIXME
+     """
+     Translate a file path glob like '*.txt' in to a regular expression.
+@@ -46,6 +67,11 @@ def translate_pattern(glob):  # noqa: C901  # is too complex (14)  # FIXME
+     """
+     pat = ''
+ 
++    # Normalize the pattern so it matches paths regardless of the Unicode
++    # normalization form used on disk (GHSA-h35f-9h28-mq5c). Candidate paths
++    # are normalized to the same form by ``_NormalizedMatcher``.
++    glob = unicode_utils.normalize(glob)
++
+     # This will split on '/' within [character classes]. This is deliberate.
+     chunks = glob.split(os.path.sep)
+ 
+@@ -117,7 +143,7 @@ def translate_pattern(glob):  # noqa: C901  # is too complex (14)  # FIXME
+             pat += sep
+ 
+     pat += r'\Z'
+-    return re.compile(pat, flags=re.MULTILINE | re.DOTALL)
++    return _NormalizedMatcher(re.compile(pat, flags=re.MULTILINE | re.DOTALL))
+ 
+ 
+ class InfoCommon:
+diff --git a/setuptools/tests/test_manifest.py b/setuptools/tests/test_manifest.py
+index 903a528db..10bd41b88 100644
+--- a/setuptools/tests/test_manifest.py
++++ b/setuptools/tests/test_manifest.py
+@@ -10,6 +10,7 @@ import os
+ import shutil
+ import sys
+ import tempfile
++import unicodedata
+ 
+ import pytest
+ 
+@@ -157,6 +158,21 @@ def test_translated_pattern_mismatch(pattern_mismatch):
+     assert not translate_pattern(pattern).match(target)
+ 
+ 
++def test_translate_pattern_unicode_normalization():
++    """
++    Matching is insensitive to Unicode normalization form: a pattern authored
++    in one form matches a path stored on disk in another (and vice versa), so
++    that an exclusion cannot be bypassed by an NFC/NFD mismatch.
++
++    Regression test for GHSA-h35f-9h28-mq5c.
++    """
++    nfc = unicodedata.normalize('NFC', 'café.txt')  # 'café.txt' composed
++    nfd = unicodedata.normalize('NFD', 'café.txt')  # 'café.txt' decomposed
++    assert nfc != nfd  # the two byte forms genuinely differ
++    assert translate_pattern(nfc).match(nfd)
++    assert translate_pattern(nfd).match(nfc)
++
++
+ class TempDirTestCase:
+     def setup_method(self, method):
+         self.temp_dir = tempfile.mkdtemp()
+@@ -331,6 +347,35 @@ class TestManifestTest(TempDirTestCase):
+         files = default_files | set([ml('app/a.txt'), ml('app/b.txt'), ml('app/c.rst')])
+         assert files == self.get_files()
+ 
++    def test_global_exclude_unicode_normalization(self):
++        """
++        A ``global-exclude`` authored NFC must drop a file whose on-disk name
++        is NFD: on macOS APFS/HFS+ the two are the same file, and even on
++        case/normalization-exact filesystems the decomposed name can be
++        committed and reach the build. Otherwise the file is published in the
++        sdist despite the exclusion.
++
++        Regression test for GHSA-h35f-9h28-mq5c.
++        """
++        nfc_name = unicodedata.normalize('NFC', 'café.txt')
++        nfd_name = unicodedata.normalize('NFD', 'café.txt')
++        assert nfc_name != nfd_name
++        # write the file under its decomposed (NFD) name ...
++        touch(os.path.join(self.temp_dir, 'app', nfd_name))
++        # ... and exclude it with the composed (NFC) form.
++        self.make_manifest(
++            f"""
++            global-include *.txt
++            global-exclude {nfc_name}
++            """
++        )
++        leaked = {
++            f
++            for f in self.get_files()
++            if unicodedata.normalize('NFC', os.path.basename(f)) == nfc_name
++        }
++        assert not leaked, f"excluded file leaked into manifest: {leaked}"
++
+ 
+ class TestFileListTest(TempDirTestCase):
+     """
+diff --git a/setuptools/unicode_utils.py b/setuptools/unicode_utils.py
+index f502f5b08..dbce03e1d 100644
+--- a/setuptools/unicode_utils.py
++++ b/setuptools/unicode_utils.py
+@@ -19,6 +19,20 @@ def decompose(path):
+     return path
+ 
+ 
++def normalize(text):
++    """
++    Return *text* in a canonical Unicode form (NFC) so that names which are
++    visually identical but encoded differently compare equal.
++
++    macOS APFS/HFS+ store file names in decomposed form (NFD), while patterns
++    in ``MANIFEST.in`` are typically authored composed (NFC). The two denote
++    the same file but differ byte-for-byte, so matching them directly lets an
++    exclusion silently fail. Normalizing both the walked path and the pattern
++    to a single form before matching avoids that (GHSA-h35f-9h28-mq5c).
++    """
++    return unicodedata.normalize('NFC', text) if isinstance(text, str) else text
++
++
+ def filesys_decode(path):
+     """
+     Ensure that the given path is decoded,
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb b/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb
index c413578faf..36cfd91e94 100644
--- a/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb
@@ -9,7 +9,8 @@ inherit pypi python_setuptools_build_meta
 CVE_PRODUCT = "python3-setuptools python:setuptools"
 
 SRC_URI += " \
-            file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
+            file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch \
+            file://CVE-2026-59890.patch"
 
 SRC_URI[sha256sum] = "7d872682c5d01cfde07da7bccc7b65469d3dca203318515ada1de5eda35efbf9"
 
-- 
2.35.6


