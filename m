Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9315CD4F39
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 19:42:27 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19910.1778787740533896909
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 12:42:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20251104.gappssmtp.com header.s=20251104 header.b=SQw92gSS;
 spf=pass (domain: baylibre.com, ip: 209.85.219.50, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8b59772d441so84212526d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 12:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778787738; x=1779392538; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQ6YgJq7Am3LGMdC6qXsgssZftIPZAAczC59p8UQ8Wk=;
        b=SQw92gSSZ6SHODdHgtyoTyRqTHm1u91er5E+JvFaz0OeuHTDaJtTOEmBbi1UYne42D
         JqP7dIxsMFFNb4x5sdSTp4uWT0gmW41R/YePJ5beXFgfPsmR7yfl7rao/AWubHwgxCGH
         83oxdns8kWW+Sd3UiMsFNozqH++68XB0tq/SnXrF8OPhkyg/xqkC6sSSIphHjw+uNMfw
         b9z3MaeGvVyHekv2dSCMOFgHpUWVH+GVPg0kNz9/u02NTccl4TpVNouOQ8I2A6tyvy07
         HIV7cR3YPTMMvyQtfSLkWcyO1MUhaWkO3BD44g6S+p20pAiztR/VtKKxBX1vTh3wYX+N
         7AWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778787738; x=1779392538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xQ6YgJq7Am3LGMdC6qXsgssZftIPZAAczC59p8UQ8Wk=;
        b=FwLAvD45RjayMkZg3CiiDQuop+2ljxipIy/z1+ychF638c956VY5bm1Ht2Y8s1kSun
         6vwxRB8ETm+Le9xe/jnm+nffXGxo7FmelwB7ItftukpENKrsftkcAKverDZpaMvuzwq8
         +Tm+9dv1XWqLIaFGkd816KVFb41FnD9P6mM4UNS3FByg9os0Z1h/aJ7AfVaiKR3Aa81C
         vvee+OfJEj9YTPYIdDdo3/jjytBGezyxUl0RHhl5zRCz92plToi2V3JbgNGu1ipDSTha
         0G3EugyJNcBD53UmjgaM9rEGRAZoZxuyviO1ClF4bZbGs4Qduf2Od3EEYk3ZLDtNipUG
         pX2Q==
X-Gm-Message-State: AOJu0Yz09A8c1DtZl8yBAwz/iXwvjTLNVaRHHX6i86JQ0gjkp4U+3Vw5
	3k+T9sOwDWJGQqcESnYkwQUdJy+eAuRgcl1ERwMgSpoax/NgSactPD8xSk8TRQs1gLPf7bi/SCj
	4I1//hAk=
X-Gm-Gg: Acq92OGFY0rbkS6b3byzd+Fw+zsJYzAVhggVWwM+58c9Q4hQbytsCBwbrsqk1CBWnFT
	itN1LU7dxuAi2Jyc64JBlRkxGM8XT3eG/7uJ8vcd3D9bh7+E2RAi/dmluq21H9D81iAqMgPN4r+
	eVJ9GH0rldUexy6eehvZ7r177Kyfeg4dQIjS7ZsZ3zJ6jHVt4c751M7Zi+rVKYVN1EpbfuBKrqh
	al4QlcDne0XYmrdPvwYhqF48a4Or/zlTjk9eo/O9rEBVU/6qGfX4LvfQUdnwsTAO1dfc86jvthb
	Ou9+9IL8u9rkdxCeXBjFRORGwQIrVaIF6EevDZWnHT4COnXPe/KVvAjHyn0P039CXPuDN82A0Pc
	BfASSOy+aqh/KQzA/T3eszaV08S69N40AzdgF/FcJfZynxRt7XwBBS00OlVNesNFE6IKdxnTGdN
	1RJdDayntlx6G3nAQArTeF+1vh+Q==
X-Received: by 2002:a05:6214:55c6:b0:8ca:e41:ab8 with SMTP id 6a1803df08f44-8ca0f63466bmr15865286d6.7.1778787738527;
        Thu, 14 May 2026 12:42:18 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:537:a9f7:1a84:f246])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c90bb82a92sm31452886d6.36.2026.05.14.12.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 12:42:17 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [OE-core][PATCH 04/11] patchtest: correctly abort --directory test
Date: Thu, 14 May 2026 15:42:00 -0400
Message-ID: <20260514194207.1958325-5-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260514194207.1958325-1-tgamblin@baylibre.com>
References: <20260514194207.1958325-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 19:42:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237051

Currently, patchtest run with --directory responds to a CTRL+C press by
aborting only the current patch being tested, and moves onto the next.
Instead, this key press should stop the test entirely. Remove usage of
the unittest.installHandler() function (which intercepts the signal) and
handle it ourselves. Also make sure that the branch is properly reset
with git am --abort afterwards, and that the return code is properly set
in the sigint handler function.

AI-Generated: Uses Claude Code

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/patchtest_parser.py    |   2 +-
 meta/lib/patchtest/repo.py                |   4 +
 meta/lib/patchtest/tests/base.py          | 113 +++++++++-------------
 meta/lib/patchtest/tests/test_metadata.py |  86 ++++++++--------
 scripts/patchtest                         |  31 +++++-
 5 files changed, 119 insertions(+), 117 deletions(-)

diff --git a/meta/lib/patchtest/patchtest_parser.py b/meta/lib/patchtest/patchtest_parser.py
index 2a11cb76c2..69bcb4b8e5 100644
--- a/meta/lib/patchtest/patchtest_parser.py
+++ b/meta/lib/patchtest/patchtest_parser.py
@@ -37,7 +37,7 @@ class PatchtestParser(object):
                             help='The patch to be tested')
 
         target_patch_group.add_argument('--directory', metavar='DIRECTORY', dest='patch_path',
-                            help='The directory containing patches to be tested')
+                            help='The directory containing patches to be tested. CTRL+C aborts the entire directory test.')
 
         parser.add_argument('--repodir', metavar='REPO',
                             default=default_repodir,
diff --git a/meta/lib/patchtest/repo.py b/meta/lib/patchtest/repo.py
index 29ce9062a4..cb68b32cdf 100644
--- a/meta/lib/patchtest/repo.py
+++ b/meta/lib/patchtest/repo.py
@@ -129,6 +129,10 @@ class PatchTestRepo(object):
             self._patchmerged = True
 
     def clean(self):
+        try:
+            self.repo.git.execute(['git', 'am', '--abort'])
+        except git.exc.GitCommandError:
+            pass
         self.repo.git.execute(['git', 'checkout', self.current_branch if self.current_branch else self.current_commit])
         self.repo.git.execute(['git', 'branch', '-D', self._workingbranch])
         self._patchmerged = False
diff --git a/meta/lib/patchtest/tests/base.py b/meta/lib/patchtest/tests/base.py
index 8263932dda..a7f5e79a54 100644
--- a/meta/lib/patchtest/tests/base.py
+++ b/meta/lib/patchtest/tests/base.py
@@ -133,18 +133,17 @@ class Metadata(Base):
     def setUpClassLocal(cls):
         cls.tinfoil = cls.setup_tinfoil()
 
-        # get info about added/modified/remove recipes
+        # get info about added/modified/removed recipes (as absolute paths)
         cls.added, cls.modified, cls.removed = cls.get_metadata_stats(cls.patchset)
 
     @classmethod
     def tearDownClassLocal(cls):
-        cls.tinfoil.shutdown()
+        if cls.tinfoil:
+            cls.tinfoil.shutdown()
 
     @classmethod
     def setup_tinfoil(cls, config_only=False):
-        """Initialize tinfoil api from bitbake"""
-
-        # import relevant libraries
+        """Initialize tinfoil api from bitbake, or return None if unavailable."""
         try:
             scripts_path = os.path.join(PatchtestParser.repodir, "scripts", "lib")
             if scripts_path not in sys.path:
@@ -153,21 +152,20 @@ class Metadata(Base):
             scriptpath.add_bitbake_lib_path()
             import bb.tinfoil
         except ImportError:
-            raise PatchtestOEError('Could not import tinfoil module')
+            logger.warn('patchtest: bitbake not available, metadata checks will use fallback parser')
+            return None
 
         orig_cwd = os.path.abspath(os.curdir)
-
-        # Load tinfoil
         tinfoil = None
         try:
             builddir = os.environ.get('BUILDDIR')
             if not builddir:
                 logger.warn('Bitbake environment not loaded?')
-                return tinfoil
+                return None
             os.chdir(builddir)
             tinfoil = bb.tinfoil.Tinfoil()
             tinfoil.prepare(config_only=config_only)
-        except bb.tinfoil.TinfoilUIException as te:
+        except bb.tinfoil.TinfoilUIException:
             if tinfoil:
                 tinfoil.shutdown()
             raise PatchtestOEError('Could not prepare properly tinfoil (TinfoilUIException)')
@@ -180,69 +178,48 @@ class Metadata(Base):
 
         return tinfoil
 
+    @staticmethod
+    def _find_pn(data, path):
+        """Find the PN from tinfoil recipe cache data for a given file path."""
+        pn = None
+        pn_native = None
+        for _path, _pn in data:
+            if path in _path:
+                if 'native' in _pn:
+                    pn_native = _pn
+                else:
+                    pn = _pn
+                    break
+        else:
+            if pn_native:
+                return pn_native
+            path_basename = path.split('_')[0]
+            for _path, _pn in data:
+                _path_basename = _path.split('_')[0]
+                if path_basename == _path_basename:
+                    pn = _pn
+        return pn
+
     @classmethod
-    def get_metadata_stats(cls, patchset):
-        """Get lists of added, modified and removed metadata files"""
+    def _getvar(cls, path, varname):
+        """Return a recipe variable value via tinfoil if available, else the fallback parser."""
+        if cls.tinfoil:
+            data = list(cls.tinfoil.cooker.recipecaches[''].pkg_fn.items())
+            pn = cls._find_pn(data, path)
+            rd = cls.tinfoil.parse_recipe(pn)
+            return rd.getVar(varname)
 
-        def find_pn(data, path):
-            """Find the PN from data"""
-            pn = None
-            pn_native = None
-            for _path, _pn in data:
-                if path in _path:
-                    if 'native' in _pn:
-                        # store the native PN but look for the non-native one first
-                        pn_native = _pn
-                    else:
-                        pn = _pn
-                        break
-            else:
-                # sent the native PN if found previously
-                if pn_native:
-                    return pn_native
-
-                # on renames (usually upgrades), we need to check (FILE) base names
-                # because the unidiff library does not provided the new filename, just the modified one
-                # and tinfoil datastore, once the patch is merged, will contain the new filename
-                path_basename = path.split('_')[0]
-                for _path, _pn in data:
-                    _path_basename = _path.split('_')[0]
-                    if path_basename == _path_basename:
-                        pn = _pn
-            return pn
-
-        if not cls.tinfoil:
-            cls.tinfoil = cls.setup_tinfoil()
-
-        added_paths, modified_paths, removed_paths = [], [], []
+    @classmethod
+    def get_metadata_stats(cls, patchset):
+        """Return lists of absolute paths for added, modified and removed recipe files."""
         added, modified, removed = [], [], []
-
-        # get metadata filename additions, modification and removals
         for patch in patchset:
             if patch.path.endswith('.bb') or patch.path.endswith('.bbappend') or patch.path.endswith('.inc'):
+                abspath = os.path.join(os.path.abspath(PatchtestParser.repodir), patch.path)
                 if patch.is_added_file:
-                    added_paths.append(
-                        os.path.join(
-                            os.path.abspath(PatchtestParser.repodir), patch.path
-                        )
-                    )
+                    added.append(abspath)
                 elif patch.is_modified_file:
-                    modified_paths.append(
-                        os.path.join(
-                            os.path.abspath(PatchtestParser.repodir), patch.path
-                        )
-                    )
+                    modified.append(abspath)
                 elif patch.is_removed_file:
-                    removed_paths.append(
-                        os.path.join(
-                            os.path.abspath(PatchtestParser.repodir), patch.path
-                        )
-                    )
-
-        data = cls.tinfoil.cooker.recipecaches[''].pkg_fn.items()
-
-        added = [find_pn(data,path) for path in added_paths]
-        modified = [find_pn(data,path) for path in modified_paths]
-        removed = [find_pn(data,path) for path in removed_paths]
-
-        return [a for a in added if a], [m for m in modified if m], [r for r in removed if r]
+                    removed.append(abspath)
+        return added, modified, removed
diff --git a/meta/lib/patchtest/tests/test_metadata.py b/meta/lib/patchtest/tests/test_metadata.py
index 442e80973d..8c77921af5 100644
--- a/meta/lib/patchtest/tests/test_metadata.py
+++ b/meta/lib/patchtest/tests/test_metadata.py
@@ -19,34 +19,32 @@ class TestMetadata(base.Metadata):
         if not self.added:
             self.skip('No added recipes, skipping test')
 
-        # TODO: this is a workaround so we can parse the recipe not
-        # containing the LICENSE var: add some default license instead
-        # of INVALID into auto.conf, then remove this line at the end
-        auto_conf = os.path.join(os.environ.get('BUILDDIR'), 'conf', 'auto.conf')
-        open_flag = 'w'
-        if os.path.exists(auto_conf):
-            open_flag = 'a'
-        with open(auto_conf, open_flag) as fd:
-            for pn in self.added:
-                fd.write('LICENSE ??= "%s"\n' % patchtest_patterns.invalid_license)
+        if self.tinfoil:
+            # workaround: set a default license so tinfoil can parse recipes
+            # that don't have LICENSE set yet
+            auto_conf = os.path.join(os.environ.get('BUILDDIR'), 'conf', 'auto.conf')
+            open_flag = 'w'
+            if os.path.exists(auto_conf):
+                open_flag = 'a'
+            with open(auto_conf, open_flag) as fd:
+                for path in self.added:
+                    fd.write('LICENSE ??= "%s"\n' % patchtest_patterns.invalid_license)
 
         no_license = False
-        for pn in self.added:
-            rd = self.tinfoil.parse_recipe(pn)
-            license = rd.getVar(patchtest_patterns.metadata_lic)
-            if license == patchtest_patterns.invalid_license:
+        for path in self.added:
+            license = self._getvar(path, patchtest_patterns.metadata_lic)
+            if not license or license == patchtest_patterns.invalid_license:
                 no_license = True
                 break
 
-        # remove auto.conf line or the file itself
-        if open_flag == 'w':
-            os.remove(auto_conf)
-        else:
-            fd = open(auto_conf, 'r')
-            lines = fd.readlines()
-            fd.close()
-            with open(auto_conf, 'w') as fd:
-                fd.write(''.join(lines[:-1]))
+        if self.tinfoil:
+            if open_flag == 'w':
+                os.remove(auto_conf)
+            else:
+                with open(auto_conf, 'r') as fd:
+                    lines = fd.readlines()
+                with open(auto_conf, 'w') as fd:
+                    fd.write(''.join(lines[:-1]))
 
         if no_license:
             self.fail('Recipe does not have the LICENSE field set.')
@@ -55,14 +53,13 @@ class TestMetadata(base.Metadata):
         if not self.added:
             self.skip('No added recipes, skipping test')
 
-        for pn in self.added:
-            rd = self.tinfoil.parse_recipe(pn)
-            pathname = rd.getVar('FILE')
+        for path in self.added:
+            pathname = self._getvar(path, 'FILE') or path
             # we are not interested in images
             if '/images/' in pathname:
                 continue
-            lic_files_chksum = rd.getVar(patchtest_patterns.metadata_chksum)
-            if rd.getVar(patchtest_patterns.license_var) == patchtest_patterns.closed:
+            lic_files_chksum = self._getvar(path, patchtest_patterns.metadata_chksum)
+            if self._getvar(path, patchtest_patterns.license_var) == patchtest_patterns.closed:
                 continue
             if not lic_files_chksum:
                 self.fail(
@@ -108,13 +105,13 @@ class TestMetadata(base.Metadata):
                         )
 
     def _collect_src_uri(self, key_prefix):
-        for pn in self.modified:
-            if 'core-image' in pn:
+        for path in self.modified:
+            if 'core-image' in os.path.basename(path):
                 continue
-            rd = self.tinfoil.parse_recipe(pn)
+            src_uri = self._getvar(path, patchtest_patterns.metadata_src_uri)
             PatchTestDataStore[
-                "%s-%s-%s" % (key_prefix, patchtest_patterns.metadata_src_uri, pn)
-            ] = rd.getVar(patchtest_patterns.metadata_src_uri)
+                "%s-%s-%s" % (key_prefix, patchtest_patterns.metadata_src_uri, path)
+            ] = src_uri or ''
 
     def pretest_src_uri_left_files(self):
         if not PatchtestParser.repo.canbemerged():
@@ -130,12 +127,12 @@ class TestMetadata(base.Metadata):
             self.skip('No modified recipes, skipping test')
         self._collect_src_uri(self.shortid())
 
-        for pn in self.modified:
+        for path in self.modified:
             pretest_src_uri = PatchTestDataStore[
-                "pre%s-%s-%s" % (self.shortid(), patchtest_patterns.metadata_src_uri, pn)
+                "pre%s-%s-%s" % (self.shortid(), patchtest_patterns.metadata_src_uri, path)
             ].split()
             test_src_uri = PatchTestDataStore[
-                "%s-%s-%s" % (self.shortid(), patchtest_patterns.metadata_src_uri, pn)
+                "%s-%s-%s" % (self.shortid(), patchtest_patterns.metadata_src_uri, path)
             ].split()
 
             pretest_files = set([os.path.basename(patch.split(';')[0]) for patch in pretest_src_uri if patch.startswith('file://')])
@@ -154,7 +151,7 @@ class TestMetadata(base.Metadata):
                 filesremoved_from_usr_uri = pretest_files - test_files
 
                 # finally, get those patches removed at SRC_URI and not removed from the patchset
-                # TODO: we are not taking into account  renames, so test may raise false positives
+                # TODO: we are not taking into account renames, so test may raise false positives
                 not_removed = filesremoved_from_usr_uri - filesremoved_from_patchset
                 if not_removed:
                     self.fail('Patches not removed from tree. Remove them and amend the submitted mbox',
@@ -164,15 +161,15 @@ class TestMetadata(base.Metadata):
         if not self.added:
             self.skip('No added recipes, skipping test')
 
-        for pn in self.added:
+        for path in self.added:
+            pn = os.path.basename(path).split('_')[0]
             # we are not interested in images
             if 'core-image' in pn:
                 continue
-            rd = self.tinfoil.parse_recipe(pn)
-            summary = rd.getVar(patchtest_patterns.metadata_summary)
+            summary = self._getvar(path, patchtest_patterns.metadata_summary)
 
             # "${PN} version ${PN}-${PR}" is the default, so fail if default
-            if summary.startswith("%s version" % pn):
+            if not summary or summary.startswith("%s version" % pn):
                 self.fail(
                     "%s is missing in newly added recipe" % patchtest_patterns.metadata_summary
                 )
@@ -186,12 +183,11 @@ class TestMetadata(base.Metadata):
             or PatchtestParser.repo.patch.branch == "dunfell"
         ):
             self.skip("No modified recipes or older target branch, skipping test")
-        for pn in self.modified:
+        for path in self.modified:
             # we are not interested in images
-            if 'core-image' in pn:
+            if 'core-image' in os.path.basename(path):
                 continue
-            rd = self.tinfoil.parse_recipe(pn)
-            cve_check_ignore = rd.getVar(patchtest_patterns.cve_check_ignore_var)
+            cve_check_ignore = self._getvar(path, patchtest_patterns.cve_check_ignore_var)
 
             if cve_check_ignore is not None:
                 self.fail(
diff --git a/scripts/patchtest b/scripts/patchtest
index e8ace03905..435610b54f 100755
--- a/scripts/patchtest
+++ b/scripts/patchtest
@@ -12,6 +12,7 @@
 import json
 import logging
 import os
+import signal
 import subprocess
 import sys
 import traceback
@@ -133,8 +134,6 @@ def _runner(resultklass, prefix=None):
 
 def run(patch, logfile=None):
     """ Load, setup and run pre and post-merge tests """
-    unittest.installHandler()
-
     premerge_result = _runner(make_result_class(patch, False, logfile), 'pretest')
     postmerge_result = _runner(make_result_class(patch, True, logfile), 'test')
 
@@ -183,10 +182,26 @@ def main():
     else:
         patch_list = [patch_path]
 
+    interrupted = False
+    previous_sigint = signal.getsignal(signal.SIGINT)
+
+    def _sigint_handler(signum, frame):
+        nonlocal interrupted
+        interrupted = True
+        # Restore previous handler so a second CTRL+C exits immediately
+        signal.signal(signal.SIGINT, previous_sigint)
+        signal.default_int_handler(signum, frame)
+
+    signal.signal(signal.SIGINT, _sigint_handler)
+
     ret = 0
     for patch in patch_list:
+        if interrupted:
+            break
+
         if os.path.getsize(patch) == 0:
             logger.error('patchtest: patch is empty')
+            signal.signal(signal.SIGINT, previous_sigint)
             return 1
 
         logger.info('Testing patch %s' % patch)
@@ -197,8 +212,18 @@ def main():
             with open(log_path, "a") as f:
                 f.write("Patchtest results for patch '%s':\n\n" % patch)
 
-        ret = run(patch, log_path)
+        try:
+            result = run(patch, log_path)
+            ret = ret or result
+        except KeyboardInterrupt:
+            interrupted = True
+
+        if interrupted:
+            logger.error('\npatchtest: interrupted')
+            signal.signal(signal.SIGINT, previous_sigint)
+            return 1
 
+    signal.signal(signal.SIGINT, previous_sigint)
     return ret
 
 if __name__ == '__main__':
-- 
2.54.0


