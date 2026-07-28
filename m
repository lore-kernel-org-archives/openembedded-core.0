Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 942CAC54F9B
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 22:22:16 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2806.1785277331411626286
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 15:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0ThiMbRc;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4954aff6088so2856325e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 15:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785277330; x=1785882130; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fzAjLuH7Xl2HED2kj20v/zQCTIKEOJa5Cb0kE+8MTqk=;
        b=0ThiMbRcZW7pGuqZ1S336hk9wlK9ASNkWh1TMThHbB/47ty8KoPaEqefpSc5PHWcEI
         kqwBDt5pAZAelQ3UctEetEJvae0jzk1IumjpTu6D/Qa21lAoOY3jh5mMm+4vfCntC/tU
         +SxkBaKbhCVsDq3GVqFz/qPzQc1MHptnmvY7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785277330; x=1785882130;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fzAjLuH7Xl2HED2kj20v/zQCTIKEOJa5Cb0kE+8MTqk=;
        b=ZzywlFdo1+z7guTitSSUO4IVT9ObMvtap2yqp3UPHanT13rgYEm7tWqYazsMyotCDC
         uU3teFu9aWcE9OjMiq18YAcA6Hfqjoz9RY3QCZSfOWi17CRH53+KBpN4Nm94WJTqmU1s
         tiRcrHCVajGEgbx8xw5E0h7ALUzyAcFG9aM7qPeX6zNQcFTffIH4B4c8+3c8W4StD6UH
         QWbBAAfTkThm/2TmjRQOWwj4uuf/LXyHT7WH0H/ye4OPwrMsjmBTQTxlMvtmsTb7uSFb
         1p77QUljxWUf74HXczeelGiKVBHIdSM2wfThUtv/ysvjKFnq4gdhh7pKbB8n245UbWpo
         VkSg==
X-Gm-Message-State: AOJu0Yx+6C+adot+iwS83xEUJG6e9xhM3u3khDphINfiFl3MorbHqa1E
	5AWNp4lwS3Rm6KhdJx3Wy3IiZVNTxcy1Q/Ue85L6tm4PB1Y2C5EXhpxrIolYHQbb+9TMzYwv77U
	TrDV0jpg=
X-Gm-Gg: AR+sD109HPMa4dpjICWaQr+xZySw9ech+DMTvkvpURBp9XFNnheZ8h5khu2Bz+VC9kV
	lw+U2Fu3VDlnCLuaSlAxXqO+w1iFaEKkMhdOhZqWoiQE5krBquKX0LoorbndVPq3i9JaxsUH1zL
	WVQf39OZ1Ti0I7j731OXXCT7K+IknI8Nu3KrMsa6ovPeeRjdscTndzIKFcZLnYLNglirXZLfJ0J
	pkQFJ3hQzO+ukhwA7LUXRK4ob9plXap2fMiuI3HMvX1K7ltC3UpXjydLv5kjXFFlPcNiaSnRSO2
	wMbdlPqhV/tUVpMTsZq0dSUEy8NOCviLog/5cxZc4kIoLDla+n+bdspHfD3LE3hKe3DQw8lwSqQ
	RTL84bqCDBS+BOpDRrmuJUUrFdChh1ybLbiphNCP73HtGaGl2BoF8GLmXjuO8y4kBnRaULkZFNP
	H4yVFW7Jmr0usIUYLeJBgUYeQEK4rmhv+XpFa53bJB20r6dI2ah7U0lAKARjiFv1qsyUQkb90wb
	RhmlMX2K5Rf6ZOglnxGNB9HW6XjJrhnk0RucXA+gc/vgcafpKeM7ji6WJexLnts
X-Received: by 2002:a05:600c:a00b:b0:495:515a:dad9 with SMTP id 5b1f17b1804b1-496c65a14b2mr47396765e9.37.1785277329512;
        Tue, 28 Jul 2026 15:22:09 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd6da4asm7669405e9.1.2026.07.28.15.22.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:22:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/19] python3-setuptools: Fix CVE-2026-59890
Date: Wed, 29 Jul 2026 00:21:45 +0200
Message-ID: <0c89d54002ed0411ea34a926ccb80c4b6e4d858c.1785277157.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785277157.git.yoann.congal@smile.fr>
References: <cover.1785277157.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 22:22:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242213

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/pypa/setuptools/commit/dd9f436a36486b4cb8a4c70a2321548b0be09b8f
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-59890

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python3-setuptools/CVE-2026-59890.patch   | 194 ++++++++++++++++++
 .../python/python3-setuptools_69.1.1.bb       |   1 +
 2 files changed, 195 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/CVE-2026-59890.patch

diff --git a/meta/recipes-devtools/python/python3-setuptools/CVE-2026-59890.patch b/meta/recipes-devtools/python/python3-setuptools/CVE-2026-59890.patch
new file mode 100644
index 00000000000..69f9bcf0d60
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools/CVE-2026-59890.patch
@@ -0,0 +1,194 @@
+From d54dff79a9568c25551092711c7ebc28422006a4 Mon Sep 17 00:00:00 2001
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
+index 62d2feea9..e858708ee 100644
+--- a/setuptools/command/egg_info.py
++++ b/setuptools/command/egg_info.py
+@@ -34,6 +34,27 @@ from ..warnings import SetuptoolsDeprecationWarning
+ PY_MAJOR = '{}.{}'.format(*sys.version_info)
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
+@@ -43,6 +64,11 @@ def translate_pattern(glob):  # noqa: C901  # is too complex (14)  # FIXME
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
+@@ -114,7 +140,7 @@ def translate_pattern(glob):  # noqa: C901  # is too complex (14)  # FIXME
+             pat += sep
+ 
+     pat += r'\Z'
+-    return re.compile(pat, flags=re.MULTILINE | re.DOTALL)
++    return _NormalizedMatcher(re.compile(pat, flags=re.MULTILINE | re.DOTALL))
+ 
+ 
+ class InfoCommon:
+diff --git a/setuptools/tests/test_manifest.py b/setuptools/tests/test_manifest.py
+index fbd21b197..1a7441fc3 100644
+--- a/setuptools/tests/test_manifest.py
++++ b/setuptools/tests/test_manifest.py
+@@ -10,6 +10,7 @@ import io
+ import logging
+ from distutils import log
+ from distutils.errors import DistutilsTemplateError
++import unicodedata
+ 
+ from setuptools.command.egg_info import FileList, egg_info, translate_pattern
+ from setuptools.dist import Distribution
+@@ -158,6 +159,21 @@ def test_translated_pattern_mismatch(pattern_mismatch):
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
+index d43dcc11f..311d4075a 100644
+--- a/setuptools/unicode_utils.py
++++ b/setuptools/unicode_utils.py
+@@ -15,6 +15,20 @@ def decompose(path):
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
+2.44.4
diff --git a/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb b/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb
index 00f83056dbf..9e7893f225f 100644
--- a/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb
@@ -15,6 +15,7 @@ SRC_URI += " \
             file://CVE-2024-6345.patch \
             file://CVE-2025-47273-pre1.patch \
             file://CVE-2025-47273.patch \
+            file://CVE-2026-59890.patch \
 "
 
 SRC_URI[sha256sum] = "5c0806c7d9af348e6dd3777b4f4dbb42c7ad85b190104837488eab9a7c945cf8"

