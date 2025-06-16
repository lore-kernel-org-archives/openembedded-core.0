Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F64C7115E
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 09:50:14 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.26737.1750067410499245936
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 02:50:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JihLZ0Z+;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-450ce671a08so26782065e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 02:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750067409; x=1750672209; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=svCmTV6Zfc+C9+1o/+6GHior6vbJhGQ09NfzJYGeAbs=;
        b=JihLZ0Z+w6gIpQOXFu4XWvXcZvYZzmT9KWyZPHALok2kms0JfwSQookQoG8GryrOpr
         dHu89BFn5VNBB4kfXSjlOZAh4XfhlOoBVwUcmo5slMWofGqKsgCUNFgwjWVB46K9Fiue
         /FE19ME5tc8sx6cRKn2ZJTPMhpylFMiASxggNSH0U0qPhg8waW/Zco658pYJYybpWPWy
         oU9mn+G50ANo0v95xJgJEpBvrZ8irSuJZiSb2xxJcdgSBREn70e/ms387YKgGGNHj3yh
         znCTB3YdJhcOb/d2FE6gpKIZ1kfX3RDH2BCIOQ1R80q9JSGdhJpFNLpYK91rScCNifNR
         9OOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750067409; x=1750672209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=svCmTV6Zfc+C9+1o/+6GHior6vbJhGQ09NfzJYGeAbs=;
        b=LIyaRPQtCPORAvsYWgBCE2DQBvgJI5FiKG7pOe53B+KdSGp5DrSJzDEHb1g4Yz+Svd
         PavDnBopICCkm78yPInwB4OHFG/dxCyDPX1xSY2slmJ9/JmzlQFZulr95aAphfrplSlF
         loEbKGy3/uuDAppPxhqFRiJi7wjkwxiqcuWsMa92L9kZKvaAYiJrAtE7TSUBRh9FmA67
         V0NOWigk6UnBTqrIU99UBJkf+7ViZnQgM9jFw0dpKfGalA0aJOnBp8imj03DUNNZWK6K
         9/xFVuHPV73HU6c1rvltyb3xUtlsjOi33Iz//Qbr1Qaqxvnm1vfiIlePgKX3vOHaCgAk
         4fYA==
X-Gm-Message-State: AOJu0YyThQ0dH5XJAZng3k8lhKRJzs9/LE94kBtW17ttki10IIgzWoWE
	LTiDUF9cSNWmiDF3XvbfEPsrLuZiOUaDroR00viNJD19kyCjXNzbfcT4SEPHTA==
X-Gm-Gg: ASbGncvtUgR+abMexERm60ti80sJ4i0kiRwokkam5ogUQEVyFQ3WH4LWIizhW4tagmM
	csfrgxaVry9tXyROoTQvQwb5ekRG6sFWjA4JGupP8Bhwz4C5nmcoy4MAsnHb+EOlRNjF6quIRAI
	BLJ0xco95dutlEpLfx4u6znH/W8SISqP84pH2gkT6OeuiATPld4MfhPY71OIS9vS+htz/uZ8H0e
	giqPKrNR86BqgtgrMAjbN1xs5NGuz20c+T1bgXrxNxnv+sG4e5BxkorJq+W4LJ5yOAMjDtEoUvi
	M/TrU1LCsoC/wkhEtugAgqcZQuwCq9btLZplC8n+DBVKfx6pnPo5EyR3wSUUy8MPC7eGkf2w5xA
	ZZNZGERRSEd8z4g1ym3q+QBU=
X-Google-Smtp-Source: AGHT+IHjNMb4P17epri/OClZnx98Awuc50/9MFhN5cfOecT0XuRjAYZThhfFVDAixmO14FZk83GVKg==
X-Received: by 2002:a05:600c:a03:b0:43d:17f1:2640 with SMTP id 5b1f17b1804b1-4533cb5368amr70562125e9.26.1750067408605;
        Mon, 16 Jun 2025 02:50:08 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4533fa7a9a8sm72811805e9.23.2025.06.16.02.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:50:08 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/10] recipetool/devtool: calculate source paths relative to UNPACKDIR
Date: Mon, 16 Jun 2025 11:49:57 +0200
Message-Id: <20250616095000.2918921-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250616095000.2918921-1-alex.kanavin@gmail.com>
References: <20250616095000.2918921-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:50:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218805

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


