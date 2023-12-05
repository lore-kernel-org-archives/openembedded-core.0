Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F8AC10F05
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 14:56:51 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.102649.1701788210245441974
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 06:56:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=skUnNV+d;
 spf=pass (domain: baylibre.com, ip: 209.85.128.42, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40b399a6529so42491385e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 06:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701788208; x=1702393008; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmVI/2gYBIerRxaLZ8/yoIeLVOQwnF80cKFsru12uu8=;
        b=skUnNV+d3PekuO5A7975dtIjObXoZhahmu7LhbC2jHxnQDtSQlxdCMmxYwp3UMh420
         hD35O/XDPa1TsBdQV4xcv2ZwI3L/JW2Re60D0fRl9bojJPa3gd9YUdiiUx1PRH7OG2dA
         0I4X2AxCdOqmcsHVQmmSBOUeTnn232kknucM/ko9MLzEJ8hyfF/TSDrygTiLUN6QeOoG
         ymwKxxS9fQqui40s72I0eIATrbb2FEbXFkMZa3kMMGljp46M0fV0VioG/UMpWxnpKM6X
         N0ve5b4+ZZize9W1fo6ObJy/+QGGg8DWdT9IEl+RdbMwmt9nc/1EDw81ESbWN57YYCOH
         qAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701788208; x=1702393008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PmVI/2gYBIerRxaLZ8/yoIeLVOQwnF80cKFsru12uu8=;
        b=ZoaoN2s2UJ/b/P8Tca36FcEO4bKtQC34BS2DtP3mJcmQ+BmD98+vmnwylII64UWpat
         cC1l5GwzHMfiyuBtE7/UEzRtXJgYSQNa8k+ToTf/qsrJCw0zIAXvG6r+0/6m+QBia31M
         flc4+mmqR33aRaWLE+h50wPgKrF8w9GNSeXl2qIPspQ2nGm2GvheTSud149r8kcBvdvA
         LX9Wu0QYF9XM4DGIEwzxc6e7d/FFflk0uhVuwyeM+Yjx/Na4o9uWtY9hXqlKd6hckdto
         0+5zmlNJJ3OhmDGjHYqs0Hibq3W05OHqbISbj/0lO0Nc9NNBMiILDIC0OpJufkcx9HiC
         hVsQ==
X-Gm-Message-State: AOJu0Yxz+haBPHPZY23gBUtGSucg9WRHaHR7szjlcS/0KAGmzsXlapLW
	r0w1Ozdm3MJQkdnZyQbq/rtefcS3woClyWJEzVEvUQ==
X-Google-Smtp-Source: AGHT+IFJSBYuWrKgA4alJU6e6u3U4tR6EP1EXrMy6i6yZTCdwg8oNTOWJj3/1YHm2+328Hj3lzvkQw==
X-Received: by 2002:a05:600c:2259:b0:40b:5e56:7b39 with SMTP id a25-20020a05600c225900b0040b5e567b39mr604320wmm.130.1701788207870;
        Tue, 05 Dec 2023 06:56:47 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id cp6-20020a056000400600b003334520e49bsm6750082wrb.53.2023.12.05.06.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 06:56:47 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v3 06/10] recipetool: appendsrcfile(s): use params instead of extraline
Date: Tue,  5 Dec 2023 15:56:32 +0100
Message-ID: <20231205145636.960819-7-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231205145636.960819-1-jstephan@baylibre.com>
References: <20231205145636.960819-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 14:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191835

appendsrc function relies on oe.recipeutils.bbappend_recipe to
copy files and add the corresponding entries in SRC_URI.

Currently, appendsrc function build itself the new SRC_URI entry to add the
correct subdir param, and gives it using the extralines parameter.
This has 2 drawbacks:
- oe.recipeutils.bbappend_recipe can already do this if we specify the
  correct params, so we have duplicate code
- the duplicated code is not fully functional: for example, it doesn't
  take into account the -m/--machine parameter

So fix this by not using extralines but give correctly formatted params.

Also remove the check for already existing entries as
oe.recipeutils.bbappend_recipe already implement it

The new bbappend file now have the SRC_URI entry after the
FILESEXTRAPATHS so fix the selftest.

Update test_recipetool_appendsrcfile_existing_in_src_uri_diff_params
test because recipetool appendsrcfiles used to not add new src_uri entry
if the entry already exist even with different parameters while
oe.recipeutils.bbappend_recipe adds it if parameters are different (and
remove the old entry)

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 21 ++++++++++-------
 scripts/lib/recipetool/append.py           | 26 +++++++++-------------
 2 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 55cbba9ca74..21cb350e8a6 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -1054,9 +1054,9 @@ class RecipetoolAppendsrcBase(RecipetoolBase):
         for uri in src_uri:
             p = urllib.parse.urlparse(uri)
             if p.scheme == 'file':
-                return p.netloc + p.path
+                return p.netloc + p.path, uri
 
-    def _test_appendsrcfile(self, testrecipe, filename=None, destdir=None, has_src_uri=True, srcdir=None, newfile=None, options=''):
+    def _test_appendsrcfile(self, testrecipe, filename=None, destdir=None, has_src_uri=True, srcdir=None, newfile=None, remove=None, options=''):
         if newfile is None:
             newfile = self.testfile
 
@@ -1083,12 +1083,18 @@ class RecipetoolAppendsrcBase(RecipetoolBase):
 
         expectedlines = ['FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"\n',
                          '\n']
+
+        if remove:
+            for entry in remove:
+                expectedlines.extend(['SRC_URI:remove = "%s"\n' % entry,
+                                       '\n'])
+
         if has_src_uri:
             uri = 'file://%s' % filename
             if expected_subdir:
                 uri += ';subdir=%s' % expected_subdir
-            expectedlines[0:0] = ['SRC_URI += "%s"\n' % uri,
-                                  '\n']
+            expectedlines.extend(['SRC_URI += "%s"\n' % uri,
+                                  '\n'])
 
         return self._try_recipetool_appendsrcfile(testrecipe, newfile, destpath, options, expectedlines, [filename])
 
@@ -1143,18 +1149,17 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
 
     def test_recipetool_appendsrcfile_existing_in_src_uri(self):
         testrecipe = 'base-files'
-        filepath = self._get_first_file_uri(testrecipe)
+        filepath,_  = self._get_first_file_uri(testrecipe)
         self.assertTrue(filepath, 'Unable to test, no file:// uri found in SRC_URI for %s' % testrecipe)
         self._test_appendsrcfile(testrecipe, filepath, has_src_uri=False)
 
     def test_recipetool_appendsrcfile_existing_in_src_uri_diff_params(self):
         testrecipe = 'base-files'
         subdir = 'tmp'
-        filepath = self._get_first_file_uri(testrecipe)
+        filepath, srcuri_entry = self._get_first_file_uri(testrecipe)
         self.assertTrue(filepath, 'Unable to test, no file:// uri found in SRC_URI for %s' % testrecipe)
 
-        output = self._test_appendsrcfile(testrecipe, filepath, subdir, has_src_uri=False)
-        self.assertTrue(any('with different parameters' in l for l in output))
+        self._test_appendsrcfile(testrecipe, filepath, subdir, remove=[srcuri_entry])
 
     def test_recipetool_appendsrcfile_replace_file_srcdir(self):
         testrecipe = 'bash'
diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index 58512e9e4b4..fc3cc4a0b7f 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -300,7 +300,9 @@ def appendfile(args):
                 if st.st_mode & stat.S_IXUSR:
                     perms = '0755'
             install = {args.newfile: (args.targetpath, perms)}
-        oe.recipeutils.bbappend_recipe(rd, args.destlayer, {args.newfile: {'path' : sourcepath}}, install, wildcardver=args.wildcard_version, machine=args.machine)
+        if sourcepath:
+            sourcepath = os.path.basename(sourcepath)
+        oe.recipeutils.bbappend_recipe(rd, args.destlayer, {args.newfile: {'newname' : sourcepath}}, install, wildcardver=args.wildcard_version, machine=args.machine)
         tinfoil.modified_files()
         return 0
     else:
@@ -329,6 +331,7 @@ def appendsrc(args, files, rd, extralines=None):
 
     copyfiles = {}
     extralines = extralines or []
+    params = []
     for newfile, srcfile in files.items():
         src_destdir = os.path.dirname(srcfile)
         if not args.use_workdir:
@@ -339,22 +342,12 @@ def appendsrc(args, files, rd, extralines=None):
             src_destdir = os.path.join(os.path.relpath(srcdir, workdir), src_destdir)
         src_destdir = os.path.normpath(src_destdir)
 
-        source_uri = 'file://{0}'.format(os.path.basename(srcfile))
         if src_destdir and src_destdir != '.':
-            source_uri += ';subdir={0}'.format(src_destdir)
-
-        simple = bb.fetch.URI(source_uri)
-        simple.params = {}
-        simple_str = str(simple)
-        if simple_str in simplified:
-            existing = simplified[simple_str]
-            if source_uri != existing:
-                logger.warning('{0!r} is already in SRC_URI, with different parameters: {1!r}, not adding'.format(source_uri, existing))
-            else:
-                logger.warning('{0!r} is already in SRC_URI, not adding'.format(source_uri))
+            params.append({'subdir': src_destdir})
         else:
-            extralines.append('SRC_URI += {0}'.format(source_uri))
-        copyfiles[newfile] = {'path' : srcfile}
+            params.append({})
+
+        copyfiles[newfile] = {'newname' : os.path.basename(srcfile)}
 
     dry_run_output = None
     dry_run_outdir = None
@@ -363,7 +356,8 @@ def appendsrc(args, files, rd, extralines=None):
         dry_run_output = tempfile.TemporaryDirectory(prefix='devtool')
         dry_run_outdir = dry_run_output.name
 
-    appendfile, _ = oe.recipeutils.bbappend_recipe(rd, args.destlayer, copyfiles, None, wildcardver=args.wildcard_version, machine=args.machine, extralines=extralines, redirect_output=dry_run_outdir)
+    appendfile, _ = oe.recipeutils.bbappend_recipe(rd, args.destlayer, copyfiles, None, wildcardver=args.wildcard_version, machine=args.machine, extralines=extralines, params=params,
+                                                   redirect_output=dry_run_outdir)
     if args.dry_run:
         output = ''
         appendfilename = os.path.basename(appendfile)
-- 
2.42.0


