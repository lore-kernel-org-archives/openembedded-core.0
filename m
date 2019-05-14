Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3EE807DEDA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 04:54:16 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id y2so2970458pfg.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 21:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=FBLa1VbeufI2YxzeIULHyPEM5JySjbbD+m+mKhphbk8=;
	b=W/WgCrBUxN8WFfrdQaINsnz7rE9NU3cx2sbOTU+sVazn4dDudF8GnsD/Pg7yvEQ7yq
	qsiWI0dNAtCbr5R1NDVqwWRpDdlwrfnwUOwFycOCXQho2r7EaOFMiFEOZc3OUBXLGVeV
	qmu4wBJVNIKX3uCBAYBBhrUJek1Z4DUNZZ4eRI2XKimtdMRS+uKXDco/nlyqbcY9tDFF
	iJPH0o81TAYwGIagHeBgoxTZ9zxs/qqQ20io+zpxAXaatL+mtG6FUmH5YVALNAGCakQz
	j5T63Bu5uA4KCezPATVc1MvOG1i8sNA+Gz5an34Oo309bZ7hHZGqKob/ZmY9hSibeeSL
	F7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=FBLa1VbeufI2YxzeIULHyPEM5JySjbbD+m+mKhphbk8=;
	b=sdNOi7gPtxKkkHD1HIYKgx8QyksjL3aPxX+2byRK1uZgLMer0mCuHvMU49RIL77gKy
	m6PQNfDThsA1JC3+R+26Wa8NsZiYZGjmpaziH5Kh1kNcQQ+0Qb+V255XtXjMG29lLVIN
	ylHiKQJHxbAtwrIe6y3mfl8vjMRWMDq05ZXHS5Hq1/58ctjhnmbeOlkx4CALCvlL8FV8
	eTE77/BY/eAK570sIJEMquRUuv02Tx5NkaxErHeDZNkat9r6jhj8MLnfoiv/l8pJJ/gw
	phkpjHFp/bywSqiPu2eRG3AGL3uPZP736kFqHXNVXMhdyBgMsQUfszuZLoGlG4LVIW5Y
	Vw0Q==
X-Gm-Message-State: APjAAAXeGcidPE0/7roAfOH02Chx/taRvsMxXqwj5d5HZdjRNNcNkJoL
	t0FZXrd6FcXEHF2GWPtBE+3itdyR
X-Google-Smtp-Source: APXvYqwD73YFawXSl4Sh6YFZrdWTrZnMy/hsi2BFPUN5FjbDbXjvkYy0ejZJsVMvzHCLkI479ZdNPA==
X-Received: by 2002:a63:1344:: with SMTP id 4mr35592296pgt.448.1557809657175; 
	Mon, 13 May 2019 21:54:17 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:d909:eb3d:d2ab:fd1d])
	by smtp.gmail.com with ESMTPSA id
	q75sm5698451pfa.175.2019.05.13.21.54.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 May 2019 21:54:16 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2019 21:53:51 -0700
Message-Id: <bb5a0fedda2817b9d71186a90a1f77bff3cbecaf.1557809500.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1557809500.git.akuster808@gmail.com>
References: <cover.1557809500.git.akuster808@gmail.com>
Subject: [PATCH 09/23] resulttool: Add option to dump all ptest logs
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
X-List-Received-Date: Tue, 14 May 2019 04:54:16 -0000

From: Joshua Watt <jpewhacker@gmail.com>

Adds an option to dump all the ptest logs to individual files in a
specified directory. If multiple test runs are present, the
'--prepend-run' argument will create separate directories for each test
run under the target directory and put the logs there to prevent each
test run from clobbering the others.

[YOCTO #13331]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/resulttool/log.py         | 54 ++++++++++++++++++++++++-----------
 scripts/lib/resulttool/resultutils.py | 16 +++++++++++
 2 files changed, 54 insertions(+), 16 deletions(-)

diff --git a/scripts/lib/resulttool/log.py b/scripts/lib/resulttool/log.py
index 5584f2d..4981635 100644
--- a/scripts/lib/resulttool/log.py
+++ b/scripts/lib/resulttool/log.py
@@ -11,6 +11,7 @@
 # FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
 # more details.
 #
+import os
 import resulttool.resultutils as resultutils
 
 def show_ptest(result, ptest, logger):
@@ -24,22 +25,38 @@ def show_ptest(result, ptest, logger):
 
 def log(args, logger):
     results = resultutils.load_resultsdata(args.source)
-    for path in results:
-        for res in results[path]:
-            if 'result' not in results[path][res]:
-                continue
-            r = results[path][res]['result']
-
-            if args.raw:
-                if 'ptestresult.rawlogs' in r:
-                    print(r['ptestresult.rawlogs']['log'])
-                else:
-                    print('Raw logs not found')
-                    return 1
-
-            for ptest in args.ptest:
-                if not show_ptest(r, ptest, logger):
-                    return 1
+
+    ptest_count = sum(1 for _, _, _, r in resultutils.test_run_results(results) if 'ptestresult.sections' in r)
+    if ptest_count > 1 and not args.prepend_run:
+        print("%i ptest sections found. '--prepend-run' is required" % ptest_count)
+        return 1
+
+    for _, run_name, _, r in resultutils.test_run_results(results):
+        if args.dump_ptest:
+            if 'ptestresult.sections' in r:
+                for name, ptest in r['ptestresult.sections'].items():
+                    if 'log' in ptest:
+                        dest_dir = args.dump_ptest
+                        if args.prepend_run:
+                            dest_dir = os.path.join(dest_dir, run_name)
+
+                        os.makedirs(dest_dir, exist_ok=True)
+
+                        dest = os.path.join(dest_dir, '%s.log' % name)
+                        print(dest)
+                        with open(dest, 'w') as f:
+                            f.write(ptest['log'])
+
+        if args.raw:
+            if 'ptestresult.rawlogs' in r:
+                print(r['ptestresult.rawlogs']['log'])
+            else:
+                print('Raw logs not found')
+                return 1
+
+        for ptest in args.ptest:
+            if not show_ptest(r, ptest, logger):
+                return 1
 
 def register_commands(subparsers):
     """Register subcommands from this plugin"""
@@ -51,6 +68,11 @@ def register_commands(subparsers):
             help='the results file/directory/URL to import')
     parser.add_argument('--ptest', action='append', default=[],
             help='show logs for a ptest')
+    parser.add_argument('--dump-ptest', metavar='DIR',
+            help='Dump all ptest log files to the specified directory.')
+    parser.add_argument('--prepend-run', action='store_true',
+            help='''Dump ptest results to a subdirectory named after the test run when using --dump-ptest.
+                    Required if more than one test run is present in the result file''')
     parser.add_argument('--raw', action='store_true',
             help='show raw logs')
 
diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index 8d17c7c..07dab4c 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -167,3 +167,19 @@ def git_get_result(repo, tags):
         append_resultsdata(results, obj)
 
     return results
+
+def test_run_results(results):
+    """
+    Convenient generator function that iterates over all test runs that have a
+    result section.
+
+    Generates a tuple of:
+        (result json file path, test run name, test run (dict), test run "results" (dict))
+    for each test run that has a "result" section
+    """
+    for path in results:
+        for run_name, test_run in results[path].items():
+            if not 'result' in test_run:
+                continue
+            yield path, run_name, test_run, test_run['result']
+
-- 
2.7.4


