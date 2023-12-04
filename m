Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3806BC10F07
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 15:26:22 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.72247.1701703577193655725
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 07:26:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=e2ZQvUdC;
 spf=pass (domain: baylibre.com, ip: 209.85.221.49, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-33318b866a0so4319575f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 07:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701703575; x=1702308375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlVjAap+6hOS2ho6xLXi3UStgBEJ6flR0B+aNPpJvRs=;
        b=e2ZQvUdCjeVP2XGVdNRBg0mUzYfN+EWGMrwSUTcyPuW4fOIFXN+KT1DM7/Y0QIQgV1
         iKoteq3hjfGNmTVNl+r3VNIXhvV0mVJyb29EKudpkt136fjGizLCTNDAFGhCad/6o/SY
         uDFeS2S7Kc173jdmoTQSmyGwYsYJO9q8FXfRvxpHRDOxlrsJdQ39jaeByYxhXYX0WMjf
         h3hTVTYGsoIGZKwfUuvEFiLuBrGX7EjV/N87+XlJ5L2zSOhWgLMaoWsxbs1unw0qQHys
         g/54iSumGBPADfgthTbT1NHKyqVxj5H6fhAxOH8XW8N8xnGQrtkbQDtGu2uRia5M5vQi
         XC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701703575; x=1702308375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZlVjAap+6hOS2ho6xLXi3UStgBEJ6flR0B+aNPpJvRs=;
        b=TLi/Z4nh8rViVK0FdyhcmQnaeb/+nTa6qiZShEF2bGTC/6OzkyvwFDpfmEBHRG6o8d
         Mc2tPJGG4w4cPW1QSwzBmHOAaxEmeqlzJT660dT071kPT2L25/Eb0FLpcUTm0UDtlTC7
         v9C6piEB68NzR4euJ/FYgONd1CAgXunpSO4X3OJ+vqSblXAWcaQ13Oae2snB/a23U6QI
         B/rQG9UwdqtDIh+zeWb0C1V2MaIKCZigmJfm83/HEVMtVBGLK9bDe29gqfcOwik1VsT/
         L5IJ9ZzsnPXMcsYRvjfes7qw+cBNqSG0LPusiybuHYoe6wMDiY/IdIOlRR8yfoLaqd4I
         GsfQ==
X-Gm-Message-State: AOJu0YyonHS14llWXjPTupW9go7mMi4M3LGZwe7B8E1SqXteyJi7pVnv
	a8lQ0s+ZpXXs69IPNGy/fA8k8ZCpev6vuHu0tlqOxw==
X-Google-Smtp-Source: AGHT+IGGyciketWDgBYQsU9HLC8fNbS5BA74TLd6+IZ6BjQDblOESDeGtMcJVe+h4NyUh1ZjE1ycjg==
X-Received: by 2002:a5d:46cc:0:b0:333:17d2:454a with SMTP id g12-20020a5d46cc000000b0033317d2454amr3226850wrs.4.1701703575025;
        Mon, 04 Dec 2023 07:26:15 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id w7-20020a5d6087000000b0033340937da6sm5257341wrt.95.2023.12.04.07.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 07:26:14 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v2 5/9] recipetool: appendsrcfile(s): use params instead of extraline
Date: Mon,  4 Dec 2023 16:25:59 +0100
Message-ID: <20231204152603.831495-6-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204152603.831495-1-jstephan@baylibre.com>
References: <20231204152603.831495-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 15:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191748

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
 meta/lib/oeqa/selftest/cases/recipetool.py | 21 +++++++++++--------
 scripts/lib/recipetool/append.py           | 24 ++++++++--------------
 2 files changed, 22 insertions(+), 23 deletions(-)

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
index 09e314481f1..7e56290a0ab 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -300,6 +300,8 @@ def appendfile(args):
                 if st.st_mode & stat.S_IXUSR:
                     perms = '0755'
             install = {args.newfile: (args.targetpath, perms)}
+        if sourcepath:
+            sourcepath = os.path.basename(sourcepath)
         oe.recipeutils.bbappend_recipe(rd, args.destlayer, {args.newfile: (None, sourcepath)}, install, wildcardver=args.wildcard_version, machine=args.machine)
         tinfoil.modified_files()
         return 0
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
-        copyfiles[newfile] = (None, srcfile)
+            params.append({})
+
+        copyfiles[newfile] = (None, os.path.basename(srcfile))
 
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


