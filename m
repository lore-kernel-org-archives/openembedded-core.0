Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D8ACC71133
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 09:44:25 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.83227.1749548663682913478
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 02:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ss5tzZAq;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a4f78ebec8so3115272f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 02:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749548662; x=1750153462; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=svCmTV6Zfc+C9+1o/+6GHior6vbJhGQ09NfzJYGeAbs=;
        b=Ss5tzZAq7r2ilfyK4f6ZbvRYsNQ9FDWPyH0vbkz77xgjnVL8/4fZSP57S9uSy/DIs1
         U3QmkZ5eVXpZOSrrlf9odVwhl5u7HOfjnZyb07vfo9PoLR3mnWc9vPgA8LMrbRenuBXf
         WdTuDbjLYVRCmTzqe+dvQMIVsDidfMapATQUwFGKQ/ZVst6/svdgcKYfuI2dMTob8seE
         YKD9vbMID94gy0j5ddNaDWCarlJP0RMrVvpALWALejdZ13JDGu6yvIU5SiS1BWErYo8A
         TEpqLrXNCwxdJUii0pwhzhushTN6ZmNB1poLBBp070fmsPAq776WU1Q282PTzoROk4PA
         6F5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548662; x=1750153462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=svCmTV6Zfc+C9+1o/+6GHior6vbJhGQ09NfzJYGeAbs=;
        b=g8Hi1EmqWiHC1eKfNOP3tOdikal75Y7RBkw1hTK08mX4VEHDb89P9/XY0aXPofT0Zz
         qblI38bQkWVur3Yi2MuYY4zQqddfEv5Qe5HikX9B1DbXGRy81VHNIIRwtQTJYbHkdj+R
         CAzzmYzck3CclF8b1904CQYZjN+QMi5bHq6vIjs95ggkQIZev+QMBk8yV2H0U+mHEcAu
         0xWHTo/B6+DNKfmueTUqkS68lYPhSYPqUsqd0mqkH664joLUbbdprgsly3XpvnZHu8ks
         G9ak/g+L9iJfJV1Cax570w763geYPSdwqITnRd74IYqp3aFX6xHIzmFPGbKVf3dnOYwj
         yW6A==
X-Gm-Message-State: AOJu0Yydb7mSn0fPCRFBdnRTPr2WY8uUaWujyA3wbtj9AUcMYbDtJBRi
	yv2ahKL/+lA00uYH7WPTNCA89VVjBVN65zoGnYLqCSmEOllkhBTWzu+E/81BxQ==
X-Gm-Gg: ASbGncuxCLNDS5vxC/t6Loef7K94woexYy9KUgxuqZYDE6aqPzjCRmuviOF3zHD6fSI
	3HXrADAo86uhKJniNB/LEotg6DZZ3Vg2LUadkmGZYwIc8/+kej333QU2Wthhm/FmbesTdfgKWZY
	2W0rc9c/0pOsLSC2LKRNZnXWmIeqg2lp+NG4YYXjKwpBrn7pO+SFfy/ywujfStW71J/0qB1Pnds
	pbnEXZ81Nl9fA3ro9HIlnzVEnUPMK5seqh1bPdlgKgDOvKnCGWZdTW4Brwvo8p/djDgaVbKukeO
	p3YaeC+Vu6m6nQXoTPYYk9c6JGPmRsglMOHWOrn1WyNWah/37jcHQdUI8XzmZ74wxTIN7s/kGwb
	aTTDcm0fjYA6+58SlcPLIZ4w=
X-Google-Smtp-Source: AGHT+IHolpua5Y6f2Y85EzfK2MzF3Ab0id+6ffL/Y+3fdSNRdSOCNxbXjpxnHXS7mhU7zhg4RgI6zw==
X-Received: by 2002:a05:6000:381:b0:3a4:d6ed:8df7 with SMTP id ffacd0b85a97d-3a531cf55d5mr14633104f8f.59.1749548661635;
        Tue, 10 Jun 2025 02:44:21 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4521375bca3sm136569125e9.39.2025.06.10.02.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:44:21 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 7/9] recipetool/devtool: calculate source paths relative to UNPACKDIR
Date: Tue, 10 Jun 2025 11:43:58 +0200
Message-Id: <20250610094400.1653931-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250610094400.1653931-1-alex.kanavin@gmail.com>
References: <20250610094400.1653931-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:44:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218332

From: Alexander Kanavin <alex@linutronix.de>

Now that recipes default to S in UNPACKDIR, recipetool and devtool should
do the same.

There was some discussion about changing devtool to simply setting
UNPACKDIR via bbappend to a workspace and running unpack task directly;
currently it has a bunch of convoluted path calculations, substitutions,
moving source trees around and and special casing (devtool-source.bbclass
in particular is an unpleasant hack).

This should definitely be done; but right now we can simply tweak existing
code which at least doesn't make it worse.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/devtool-source.bbclass        |  4 ++--
 meta/lib/oeqa/selftest/cases/devtool.py    | 18 +++++++++---------
 meta/lib/oeqa/selftest/cases/recipetool.py | 12 ++++++------
 scripts/lib/devtool/ide_sdk.py             |  2 +-
 scripts/lib/devtool/standard.py            | 12 ++++++------
 scripts/lib/devtool/upgrade.py             |  2 +-
 scripts/lib/recipetool/append.py           |  8 ++++----
 scripts/lib/recipetool/create.py           |  4 ++--
 8 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/meta/classes/devtool-source.bbclass b/meta/classes/devtool-source.bbclass
index 9762003ba75..2e0070486b4 100644
--- a/meta/classes/devtool-source.bbclass
+++ b/meta/classes/devtool-source.bbclass
@@ -92,9 +92,9 @@ python devtool_post_unpack() {
             for fname in local_files:
                 f.write('%s\n' % fname)
 
-    if os.path.dirname(srcsubdir) != workdir:
+    if srcsubdir.startswith(unpackdir) and os.path.dirname(srcsubdir) != unpackdir:
         # Handle if S is set to a subdirectory of the source
-        srcsubdir = os.path.join(workdir, os.path.relpath(srcsubdir, workdir).split(os.sep)[0])
+        srcsubdir = os.path.normpath(os.path.join(unpackdir, os.path.relpath(srcsubdir, unpackdir).split(os.sep)[0]))
 
     scriptutils.git_convert_standalone_clone(srcsubdir)
 
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index f30dba5a469..74a7727cc00 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -565,7 +565,7 @@ class DevtoolAddTests(DevtoolBase):
         recipefile = get_bb_var('FILE', testrecipe)
         self.assertIn('%s_%s.bb' % (testrecipe, testver), recipefile, 'Recipe file incorrectly named')
         checkvars = {}
-        checkvars['S'] = '${WORKDIR}/MarkupSafe-${PV}'
+        checkvars['S'] = '${UNPACKDIR}/MarkupSafe-${PV}'
         checkvars['SRC_URI'] = url.replace(testver, '${PV}')
         self._test_recipe_contents(recipefile, checkvars, [])
         # Try with version specified
@@ -582,7 +582,7 @@ class DevtoolAddTests(DevtoolBase):
         recipefile = get_bb_var('FILE', testrecipe)
         self.assertIn('%s_%s.bb' % (testrecipe, fakever), recipefile, 'Recipe file incorrectly named')
         checkvars = {}
-        checkvars['S'] = '${WORKDIR}/MarkupSafe-%s' % testver
+        checkvars['S'] = '${UNPACKDIR}/MarkupSafe-%s' % testver
         checkvars['SRC_URI'] = url
         self._test_recipe_contents(recipefile, checkvars, [])
 
@@ -1627,12 +1627,12 @@ class DevtoolUpdateTests(DevtoolBase):
         # Check preconditions
         testrecipe = 'dos2unix'
         self.append_config('ERROR_QA:remove:pn-dos2unix = "patch-status"\n')
-        bb_vars = get_bb_vars(['SRC_URI', 'S', 'WORKDIR', 'FILE', 'BB_GIT_DEFAULT_DESTSUFFIX'], testrecipe)
+        bb_vars = get_bb_vars(['SRC_URI', 'S', 'UNPACKDIR', 'FILE', 'BB_GIT_DEFAULT_DESTSUFFIX'], testrecipe)
         self.assertIn('git://', bb_vars['SRC_URI'], 'This test expects the %s recipe to be a git recipe' % testrecipe)
-        workdir_git = '%s/%s/' % (bb_vars['WORKDIR'], bb_vars['BB_GIT_DEFAULT_DESTSUFFIX'])
-        if not bb_vars['S'].startswith(workdir_git):
+        unpackdir_git = '%s/%s/' % (bb_vars['UNPACKDIR'], bb_vars['BB_GIT_DEFAULT_DESTSUFFIX'])
+        if not bb_vars['S'].startswith(unpackdir_git):
             self.fail('This test expects the %s recipe to be building from a subdirectory of the git repo' % testrecipe)
-        subdir = bb_vars['S'].split(workdir_git, 1)[1]
+        subdir = bb_vars['S'].split(unpackdir_git, 1)[1]
         # Clean up anything in the workdir/sysroot/sstate cache
         bitbake('%s -c cleansstate' % testrecipe)
         # Try modifying a recipe
@@ -2414,7 +2414,7 @@ class DevtoolUpgradeTests(DevtoolBase):
         newsrctree = os.path.join(self.workspacedir, 'sources', newrecipename)
         self.assertExists(newsrctree, 'Source directory not renamed')
         checkvars = {}
-        checkvars['S'] = '${WORKDIR}/%s-%s' % (recipename, recipever)
+        checkvars['S'] = '${UNPACKDIR}/%s-%s' % (recipename, recipever)
         checkvars['SRC_URI'] = url
         self._test_recipe_contents(newrecipefile, checkvars, [])
         # Try again - change just name this time
@@ -2426,7 +2426,7 @@ class DevtoolUpgradeTests(DevtoolBase):
         self.assertNotExists(os.path.join(self.workspacedir, 'recipes', recipename), 'Old recipe directory still exists')
         self.assertExists(os.path.join(self.workspacedir, 'sources', newrecipename), 'Source directory not renamed')
         checkvars = {}
-        checkvars['S'] = '${WORKDIR}/%s-${PV}' % recipename
+        checkvars['S'] = '${UNPACKDIR}/%s-${PV}' % recipename
         checkvars['SRC_URI'] = url.replace(recipever, '${PV}')
         self._test_recipe_contents(newrecipefile, checkvars, [])
         # Try again - change just version this time
@@ -2437,7 +2437,7 @@ class DevtoolUpgradeTests(DevtoolBase):
         self.assertExists(newrecipefile, 'Recipe file not renamed')
         self.assertExists(os.path.join(self.workspacedir, 'sources', recipename), 'Source directory no longer exists')
         checkvars = {}
-        checkvars['S'] = '${WORKDIR}/${BPN}-%s' % recipever
+        checkvars['S'] = '${UNPACKDIR}/${BPN}-%s' % recipever
         checkvars['SRC_URI'] = url
         self._test_recipe_contents(newrecipefile, checkvars, [])
 
diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 8cd639bd45b..2a91f6c7ae4 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -1144,10 +1144,10 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
 
     def test_recipetool_appendsrcfile_srcdir_basic(self):
         testrecipe = 'bash'
-        bb_vars = get_bb_vars(['S', 'WORKDIR'], testrecipe)
+        bb_vars = get_bb_vars(['S', 'UNPACKDIR'], testrecipe)
         srcdir = bb_vars['S']
-        workdir = bb_vars['WORKDIR']
-        subdir = os.path.relpath(srcdir, workdir)
+        unpackdir = bb_vars['UNPACKDIR']
+        subdir = os.path.relpath(srcdir, unpackdir)
         self._test_appendsrcfile(testrecipe, 'a-file', srcdir=subdir)
 
     def test_recipetool_appendsrcfile_existing_in_src_uri(self):
@@ -1196,10 +1196,10 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
     def test_recipetool_appendsrcfile_replace_file_srcdir(self):
         testrecipe = 'bash'
         filepath = 'Makefile.in'
-        bb_vars = get_bb_vars(['S', 'WORKDIR'], testrecipe)
+        bb_vars = get_bb_vars(['S', 'UNPACKDIR'], testrecipe)
         srcdir = bb_vars['S']
-        workdir = bb_vars['WORKDIR']
-        subdir = os.path.relpath(srcdir, workdir)
+        unpackdir = bb_vars['UNPACKDIR']
+        subdir = os.path.relpath(srcdir, unpackdir)
 
         self._test_appendsrcfile(testrecipe, filepath, srcdir=subdir)
         bitbake('%s:do_unpack' % testrecipe)
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index f8cf65f4a84..931408fa74e 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -334,7 +334,7 @@ class RecipeModified:
         self.srctree = workspace[workspacepn]['srctree']
         # Need to grab this here in case the source is within a subdirectory
         self.real_srctree = get_real_srctree(
-            self.srctree, recipe_d.getVar('S'), recipe_d.getVar('WORKDIR'))
+            self.srctree, recipe_d.getVar('S'), recipe_d.getVar('UNPACKDIR'))
         self.bbappend = workspace[workspacepn]['bbappend']
 
         self.ide_sdk_dir = os.path.join(
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index cdfdba43eef..1fd5947c411 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -625,7 +625,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
                 srcsubdir = f.read()
         except FileNotFoundError as e:
             raise DevtoolError('Something went wrong with source extraction - the devtool-source class was not active or did not function correctly:\n%s' % str(e))
-        srcsubdir_rel = os.path.relpath(srcsubdir, os.path.join(tempdir, 'workdir'))
+        srcsubdir_rel = os.path.relpath(srcsubdir, os.path.join(tempdir, 'workdir', os.path.relpath(d.getVar('UNPACKDIR'), d.getVar('WORKDIR'))))
 
         # Check if work-shared is empty, if yes
         # find source and copy to work-shared
@@ -742,13 +742,13 @@ def get_staging_kbranch(srcdir):
         staging_kbranch = "".join(branch.split('\n')[0])
     return staging_kbranch
 
-def get_real_srctree(srctree, s, workdir):
+def get_real_srctree(srctree, s, unpackdir):
     # Check that recipe isn't using a shared workdir
     s = os.path.abspath(s)
-    workdir = os.path.abspath(workdir)
-    if s.startswith(workdir) and s != workdir and os.path.dirname(s) != workdir:
+    unpackdir = os.path.abspath(unpackdir)
+    if s.startswith(unpackdir) and s != unpackdir and os.path.dirname(s) != unpackdir:
         # Handle if S is set to a subdirectory of the source
-        srcsubdir = os.path.relpath(s, workdir).split(os.sep, 1)[1]
+        srcsubdir = os.path.relpath(s, unpackdir).split(os.sep, 1)[1]
         srctree = os.path.join(srctree, srcsubdir)
     return srctree
 
@@ -907,7 +907,7 @@ def modify(args, config, basepath, workspace):
 
         # Need to grab this here in case the source is within a subdirectory
         srctreebase = srctree
-        srctree = get_real_srctree(srctree, rd.getVar('S'), rd.getVar('WORKDIR'))
+        srctree = get_real_srctree(srctree, rd.getVar('S'), rd.getVar('UNPACKDIR'))
 
         bb.utils.mkdirhier(os.path.dirname(appendfile))
         with open(appendfile, 'w') as f:
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 0dace1fb240..d9aca6e2dbd 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -571,7 +571,7 @@ def upgrade(args, config, basepath, workspace):
         else:
             srctree = standard.get_default_srctree(config, pn)
 
-        srctree_s = standard.get_real_srctree(srctree, rd.getVar('S'), rd.getVar('WORKDIR'))
+        srctree_s = standard.get_real_srctree(srctree, rd.getVar('S'), rd.getVar('UNPACKDIR'))
 
         # try to automatically discover latest version and revision if not provided on command line
         if not args.version and not args.srcrev:
diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index c18926e56c6..041d79f1623 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -317,7 +317,7 @@ def appendsrc(args, files, rd, extralines=None):
     import oe.recipeutils
 
     srcdir = rd.getVar('S')
-    workdir = rd.getVar('WORKDIR')
+    unpackdir = rd.getVar('UNPACKDIR')
 
     import bb.fetch
     simplified = {}
@@ -336,10 +336,10 @@ def appendsrc(args, files, rd, extralines=None):
         src_destdir = os.path.dirname(srcfile)
         if not args.use_workdir:
             if rd.getVar('S') == rd.getVar('STAGING_KERNEL_DIR'):
-                srcdir = os.path.join(workdir, rd.getVar('BB_GIT_DEFAULT_DESTSUFFIX'))
+                srcdir = os.path.join(unpackdir, rd.getVar('BB_GIT_DEFAULT_DESTSUFFIX'))
                 if not bb.data.inherits_class('kernel-yocto', rd):
-                    logger.warning('S == STAGING_KERNEL_DIR and non-kernel-yocto, unable to determine path to srcdir, defaulting to ${WORKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}')
-            src_destdir = os.path.join(os.path.relpath(srcdir, workdir), src_destdir)
+                    logger.warning('S == STAGING_KERNEL_DIR and non-kernel-yocto, unable to determine path to srcdir, defaulting to ${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}')
+            src_destdir = os.path.join(os.path.relpath(srcdir, unpackdir), src_destdir)
         src_destdir = os.path.normpath(src_destdir)
 
         if src_destdir and src_destdir != '.':
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 0fd4953f752..f6a38e4a3f0 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -734,7 +734,7 @@ def create_recipe(args):
     if srcsubdir and not args.binary:
         # (for binary packages we explicitly specify subdir= when fetching to
         # match the default value of S, so we don't need to set it in that case)
-        lines_before.append('S = "${WORKDIR}/%s"' % srcsubdir)
+        lines_before.append('S = "${UNPACKDIR}/%s"' % srcsubdir)
         lines_before.append('')
 
     if pkgarch:
@@ -838,7 +838,7 @@ def create_recipe(args):
                 line = line.replace(realpv, '${PV}')
             if pn:
                 line = line.replace(pn, '${BPN}')
-            if line == 'S = "${WORKDIR}/${BPN}-${PV}"' or 'tmp-recipetool-' in line:
+            if line == 'S = "${UNPACKDIR}/${BPN}-${PV}"' or 'tmp-recipetool-' in line:
                 skipblank = True
                 continue
         elif line.startswith('SRC_URI = '):
-- 
2.39.5


