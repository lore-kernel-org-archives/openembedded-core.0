Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A44C53219
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:30 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43759.1785192987153679687
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JYlBLbaZ;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-495635a85d2so26735415e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785192985; x=1785797785; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oQP9kmGZtDRiGDCuhv1OONPJlazP83lTcDijGwNtdhs=;
        b=JYlBLbaZo5ayI4knIGxYfa2NEn4LbULZySfZ7AouBt1yBif1CxyNiEjMc/QS3fq5W8
         GVvJeUqEuh6wZqfmem+XBY1poei3vYPNf/4/WA38HN4uNmSh7Emr0DS9wpQkaf3+OQny
         9ufgWaONzZG9uCAy4yb9olegH3bFTZbXWniZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785192985; x=1785797785;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oQP9kmGZtDRiGDCuhv1OONPJlazP83lTcDijGwNtdhs=;
        b=a6HkEMOXFT+RhOcrSQUOa9sRK2W+SujXJali1PjPdxDkpmWX8XQ7hHD5QdJe/V2FCH
         xrGjM5kSkPQp+9HagLwAYf/z3rAvClS6kxZZVUDfWzLV+oyraVuhzLEE93uol9phNaN1
         HLuEujFxVTmPu0nPUoMOc59Qqe7OuhZTP7YqfvAYlLJwXHEN273KFXjoFtw40epEgMmP
         LFUQCS/QaPbcz2Jt1F4m6zD/je/Jh3HwSSM87royfrBSkaWgmTCrJmHJWgrtdoGqd/OX
         d0NBhyNI1nGVJinX3xlXmSyxIxjih1VP94mfVDKO9zP49deRx5VC9B0r3SPK3VKI17uU
         +XCg==
X-Gm-Message-State: AOJu0YygZ6LIfKsAUxKENM5ebKzv3fBFiVKpvqrF2G0391cjr+CZjJsz
	1HpfZKOR5765bGJ0hrnA63jHlBHbBxGfBPoGL/aDjKsV8e1IXib7ZMhD42U5H2dgvrv2bb1Nv9d
	PLZ7mWtY=
X-Gm-Gg: AR+sD12Wy1XSIZyPmJqMlnA83dq02AbSNEOLiR4TpYcL4AuzWMKridEph2zUtyacADd
	bdvt1idObKeKoqrRNrQJCtBqvT/RCdRl0SNJjiqxl4LUzh3jYFwvqNG4CPHrs5A5ZrMXVJOeWrO
	4HFgAx85q1N7pYaiYuyZoIczPqkUQTfIBWJsBIL+jyS6iEYs7gAWhX5oPqOhWJy70z/d5cyJDNi
	8u99LevABWHzdg3szd5rFY2f8WRiV/4cXHbB4m+ir7QofKy26cCj0L81aXSUqWOXWfs1kvl9xWf
	DaJgNXlbXP5YtgyIZUW/KBXvGwodZrOHmPULi+BvSvXFNYZaFAvLxMW0Nd63P6kvqhSduV7DFwL
	CbcRxSN/rycqkgCwgKVMH99uLHLdswYkppWkWWGsq3fW506ijactI6BLrqRcqcCZF7rr9d3rB2v
	hZ6Fi8nyyQpxJ54Y3idpt0lasnnr1juRthDMtcWs6drNOxkxQpSziyenCtpSo9q1kOgNqjOU7dK
	2yxCw==
X-Received: by 2002:a05:600c:35d5:b0:496:bbce:fc with SMTP id 5b1f17b1804b1-496c4f8ddb8mr9811265e9.12.1785192985306;
        Mon, 27 Jul 2026 15:56:25 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45de1a3sm31513055e9.11.2026.07.27.15.56.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:56:24 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 17/36] python3-setuptools: Fix CVE-2026-59890
Date: Tue, 28 Jul 2026 00:55:31 +0200
Message-ID: <0d900632d3c064a9c0c61cfeb5c1d003b4eb81e4.1785190123.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785190123.git.yoann.congal@smile.fr>
References: <cover.1785190123.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242134

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/pypa/setuptools/commit/dd9f436a36486b4cb8a4c70a2321548b0be09b8f
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-59890

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python3-setuptools/CVE-2026-59890.patch   | 194 ++++++++++++++++++
 .../python/python3-setuptools_82.0.1.bb       |   3 +-
 2 files changed, 196 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/CVE-2026-59890.patch

diff --git a/meta/recipes-devtools/python/python3-setuptools/CVE-2026-59890.patch b/meta/recipes-devtools/python/python3-setuptools/CVE-2026-59890.patch
new file mode 100644
index 00000000000..7a6c86b40a4
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
index c413578faf5..36cfd91e94a 100644
--- a/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb
@@ -9,7 +9,8 @@ inherit pypi python_setuptools_build_meta
 CVE_PRODUCT = "python3-setuptools python:setuptools"
 
 SRC_URI += " \
-            file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
+            file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch \
+            file://CVE-2026-59890.patch"
 
 SRC_URI[sha256sum] = "7d872682c5d01cfde07da7bccc7b65469d3dca203318515ada1de5eda35efbf9"
 

