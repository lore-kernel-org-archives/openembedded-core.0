Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 85E6B7D29F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2019 02:57:38 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id i21so2948647iol.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2019 19:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=bsfoF3UFPO/kBZxK/VBSoChRpZWkPjCJDH7vbNNY4+g=;
	b=O2L1RX2Tx3U3iPUwwS554mZEUPW0LQwXgGFHb76GkrXuyjUPGHjH1cXX9+ZvvqlkSX
	gFKwj55MbuBIFrbesIy1VMzNuRKuhCtxE29XL1udYxyPtOCzsZ0liTaCy64kLzEm9JKz
	5ErUIshcO6CfBc8qzrA5nfUG/5MeoCfaIlop3g0FMAAMtPXNlig+MrA4bXnCs3rUlSPd
	Fr50o4SkKRBxifJiSaJcURUHWSotQwGkH0BB3SFiJW79edSq6BzBmZp8pwdDbuhbbizI
	eClmsTQVYriwimAEtLYoN9Mrq4lg9nQaxDFXDHQQC+csRZ1v/pX/Edh2S2UC3jstYUnI
	XFfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bsfoF3UFPO/kBZxK/VBSoChRpZWkPjCJDH7vbNNY4+g=;
	b=nBKOndV8RCCTlQYVhMP9b3Gh6ckFLjygcKh2CNUdUgBum9p/aHEwRi6dGw9+am+zwI
	NBeZCWhRMhsAcXSAn6kqpCraOwJ2WPMSVBFBGRC1mvXEFR40IvlUpdInVfCMhyQzthlD
	IkC2CUHMNGmfmVQZ9Ucb0ur8Vq/IySZeDyDbOisQ6xrRM30vA4KzVMCrwmyCnCRLY9bK
	z4cWE/Yl+i6RM2s7c1nm8zvR1b6BlzxKmQ+L4LvyUA8RvfwNVdsFulpjPondSRVVo/A9
	1kuJPkkxPYPVbV43atqewppGSF8Qvf49TT611Wt0Tiq4uQN+XBnlHrgrK4XTRWRTNRq/
	b/sg==
X-Gm-Message-State: APjAAAUMjTjcfA/IG8/68IswUVVWbbyOGzH39Bvcw4wwtoYlLXAg8ISV
	3RJDGFATzDv3g/Y+bWmv/Z7Wri27ifA=
X-Google-Smtp-Source: APXvYqy4aCJsG5LaumxzAkRe7AoBynFuMXU5do1jsGh22xVTNqItHbSFJgCxrvbIuaLjwiVgTCENOw==
X-Received: by 2002:a5d:8f82:: with SMTP id l2mr1281063iol.110.1555642659256; 
	Thu, 18 Apr 2019 19:57:39 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	137sm1796885ita.22.2019.04.18.19.57.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 18 Apr 2019 19:57:38 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Apr 2019 21:57:17 -0500
Message-Id: <20190419025718.15348-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190419025718.15348-1-JPEWhacker@gmail.com>
References: <20190419025718.15348-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] resulttool: Load results from URL
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
X-List-Received-Date: Fri, 19 Apr 2019 02:57:38 -0000
Content-Transfer-Encoding: 8bit

Adds support for resulttool to load JSON files directly from a http://
or https:// URL

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 scripts/lib/resulttool/merge.py       |  8 ++++----
 scripts/lib/resulttool/regression.py  |  4 ++--
 scripts/lib/resulttool/report.py      |  2 +-
 scripts/lib/resulttool/resultutils.py | 23 +++++++++++++++++++----
 scripts/lib/resulttool/store.py       |  4 ++--
 5 files changed, 28 insertions(+), 13 deletions(-)

diff --git a/scripts/lib/resulttool/merge.py b/scripts/lib/resulttool/merge.py
index 3e4b7a38ad1..7159463f6ed 100644
--- a/scripts/lib/resulttool/merge.py
+++ b/scripts/lib/resulttool/merge.py
@@ -17,7 +17,7 @@ import json
 import resulttool.resultutils as resultutils
 
 def merge(args, logger):
-    if os.path.isdir(args.target_results):
+    if resultutils.is_url(args.target_results) or os.path.isdir(args.target_results):
         results = resultutils.load_resultsdata(args.target_results, configmap=resultutils.store_map)
         resultutils.append_resultsdata(results, args.base_results, configmap=resultutils.store_map)
         resultutils.save_resultsdata(results, args.target_results)
@@ -31,12 +31,12 @@ def merge(args, logger):
 
 def register_commands(subparsers):
     """Register subcommands from this plugin"""
-    parser_build = subparsers.add_parser('merge', help='merge test result files/directories',
-                                         description='merge the results from multiple files/directories into the target file or directory',
+    parser_build = subparsers.add_parser('merge', help='merge test result files/directories/URLs',
+                                         description='merge the results from multiple files/directories/URLs into the target file or directory',
                                          group='setup')
     parser_build.set_defaults(func=merge)
     parser_build.add_argument('base_results',
-                              help='the results file/directory to import')
+                              help='the results file/directory/URL to import')
     parser_build.add_argument('target_results',
                               help='the target file or directory to merge the base_results with')
 
diff --git a/scripts/lib/resulttool/regression.py b/scripts/lib/resulttool/regression.py
index bdf531dedf1..aecb9da9ce5 100644
--- a/scripts/lib/resulttool/regression.py
+++ b/scripts/lib/resulttool/regression.py
@@ -161,9 +161,9 @@ def register_commands(subparsers):
                                          group='analysis')
     parser_build.set_defaults(func=regression)
     parser_build.add_argument('base_result',
-                              help='base result file/directory for the comparison')
+                              help='base result file/directory/URL for the comparison')
     parser_build.add_argument('target_result',
-                              help='target result file/directory to compare with')
+                              help='target result file/directory/URL to compare with')
     parser_build.add_argument('-b', '--base-result-id', default='',
                               help='(optional) filter the base results to this result ID')
     parser_build.add_argument('-t', '--target-result-id', default='',
diff --git a/scripts/lib/resulttool/report.py b/scripts/lib/resulttool/report.py
index 90086209e35..8ae42728e45 100644
--- a/scripts/lib/resulttool/report.py
+++ b/scripts/lib/resulttool/report.py
@@ -143,7 +143,7 @@ def register_commands(subparsers):
                                          group='analysis')
     parser_build.set_defaults(func=report)
     parser_build.add_argument('source_dir',
-                              help='source file/directory that contain the test result files to summarise')
+                              help='source file/directory/URL that contain the test result files to summarise')
     parser_build.add_argument('--branch', '-B', default='master', help="Branch to find commit in")
     parser_build.add_argument('--commit', help="Revision to report")
     parser_build.add_argument('-t', '--tag', default='',
diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index ad40ac8499d..aab312dd172 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -16,6 +16,8 @@ import os
 import json
 import scriptpath
 import copy
+import urllib
+import posixpath
 scriptpath.add_oe_lib_path()
 
 flatten_map = {
@@ -40,20 +42,33 @@ store_map = {
     "manual": ['TEST_TYPE', 'TEST_MODULE', 'MACHINE', 'IMAGE_BASENAME']
 }
 
+def is_url(p):
+    """
+    Helper for determining if the given path is a URL
+    """
+    return p.startswith('http://') or p.startswith('https://')
+
 #
 # Load the json file and append the results data into the provided results dict
 #
 def append_resultsdata(results, f, configmap=store_map):
     if type(f) is str:
-        with open(f, "r") as filedata:
-            data = json.load(filedata)
+        if is_url(f):
+            with urllib.request.urlopen(f) as response:
+                data = json.loads(response.read().decode('utf-8'))
+            url = urllib.parse.urlparse(f)
+            testseries = posixpath.basename(posixpath.dirname(url.path))
+        else:
+            with open(f, "r") as filedata:
+                data = json.load(filedata)
+            testseries = os.path.basename(os.path.dirname(f))
     else:
         data = f
     for res in data:
         if "configuration" not in data[res] or "result" not in data[res]:
             raise ValueError("Test results data without configuration or result section?")
         if "TESTSERIES" not in data[res]["configuration"]:
-            data[res]["configuration"]["TESTSERIES"] = os.path.basename(os.path.dirname(f))
+            data[res]["configuration"]["TESTSERIES"] = testseries
         testtype = data[res]["configuration"].get("TEST_TYPE")
         if testtype not in configmap:
             raise ValueError("Unknown test type %s" % testtype)
@@ -69,7 +84,7 @@ def append_resultsdata(results, f, configmap=store_map):
 #
 def load_resultsdata(source, configmap=store_map):
     results = {}
-    if os.path.isfile(source):
+    if is_url(source) or os.path.isfile(source):
         append_resultsdata(results, source, configmap)
         return results
     for root, dirs, files in os.walk(source):
diff --git a/scripts/lib/resulttool/store.py b/scripts/lib/resulttool/store.py
index e4a08075287..acdfbd94fdf 100644
--- a/scripts/lib/resulttool/store.py
+++ b/scripts/lib/resulttool/store.py
@@ -29,7 +29,7 @@ def store(args, logger):
     try:
         results = {}
         logger.info('Reading files from %s' % args.source)
-        if os.path.isfile(args.source):
+        if resultutils.is_url(args.source) or os.path.isfile(args.source):
             resultutils.append_resultsdata(results, args.source)
         else:
             for root, dirs,  files in os.walk(args.source):
@@ -92,7 +92,7 @@ def register_commands(subparsers):
                                          group='setup')
     parser_build.set_defaults(func=store)
     parser_build.add_argument('source',
-                              help='source file or directory that contain the test result files to be stored')
+                              help='source file/directory/URL that contain the test result files to be stored')
     parser_build.add_argument('git_dir',
                               help='the location of the git repository to store the results in')
     parser_build.add_argument('-a', '--all', action='store_true',
-- 
2.20.1


