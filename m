Return-Path: <jpewhacker@gmail.com>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id 949CC7DE4A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 16:16:52 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id 203so1974830oid.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 09:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9gYVCqadHr5YuhqvdKtiFrsOFumnaCAB7qSIpnDPQ0Y=;
	b=BHB7hxPPmvqNwZUlBSoBj/aPL7wsOLJ+rAJ5mlwZYk+E1OA7EQrwg342JiAlLi0mpW
	QB+Bbt1kfADQ36VPv6L0hgwMwgeWTDL0wzSD4KrsD61VWXQPhTqOn0fjrTSOtuOBtV70
	eV7AAxYFrpYn3ylQmj4hChQYDLjnC0JAqsF7i35r3vlVBHp86zzIbpPiMPYdzolhJyUB
	OirpSj4UmP1cacXW7jr9aRcDIkkFKmY3z6AKpozgSf6FP9thsJFx1slmtxXJErCCjjBI
	MD1Pus8yrp0jN24aFkpYd8hZwx3/mVvYEiy82pZBInO3F62yvhxsD0i3CkQHrggpcCli
	NkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9gYVCqadHr5YuhqvdKtiFrsOFumnaCAB7qSIpnDPQ0Y=;
	b=StJj5pt51wXCxkDecnf3bVGvBLIt2sXHbG+3G7ceD+196MHFjLPNAbsudLbShFfkQq
	rXZWdR3l/GmCCxDZ9sL9EGyuuMlAt1rQKpZNHxOyrweQONdBamR8us3Gb9oKJJQAvW2v
	YSuNSSh00YnGrrWBT5VfZI1nTqKXRvqqrR0KRazqEFtvcSatoZ5h0Od2QJb7gAts0wQy
	OVO9Zj64n+nfCw9xJfEvo3t0fHi3Y1SftM2vQjH8RalgRlrEEXW08lJ6FmZL0aQTWEM3
	ZMvvMSbnzitNV0w+7kwrqj92HGJU/MybgaKXPGtRv+zM29A/fdgipv2mR18RVUqLmlDU
	oeQQ==
X-Gm-Message-State: APjAAAXgso5B5HvjG5EVRZntb7sLQpdD03eqAhTQqW+hXt2qGWkMXrU0
	pOoyJSqhaKiCc/cVj0jhAOG4iGHSpDs=
X-Google-Smtp-Source: APXvYqzzbpLLlx2rN1Hx4hkf1GnjrWPuLIE2LQSyw0wQLgI4g+spBUN/sxtBP0ifGOUA41GMx8+/qg==
X-Received: by 2002:a05:6808:10f:: with SMTP id
	b15mr2665241oie.119.1557332212867; 
	Wed, 08 May 2019 09:16:52 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	o66sm7240869oig.11.2019.05.08.09.16.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 08 May 2019 09:16:52 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2019 11:16:23 -0500
Message-Id: <20190508161623.27592-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190504031752.20918-1-JPEWhacker@gmail.com>
References: <20190504031752.20918-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v2] resulttool: Add option to dump all ptest logs
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
X-List-Received-Date: Wed, 08 May 2019 16:16:52 -0000
Content-Transfer-Encoding: 8bit

Adds an option to dump all the ptest logs to individual files in a
specified directory. If multiple test runs are present, the
'--prepend-run' argument will create separate directories for each test
run under the target directory and put the logs there to prevent each
test run from clobbering the others.

[YOCTO #13331]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 scripts/lib/resulttool/log.py         | 54 +++++++++++++++++++--------
 scripts/lib/resulttool/resultutils.py | 16 ++++++++
 2 files changed, 54 insertions(+), 16 deletions(-)

diff --git a/scripts/lib/resulttool/log.py b/scripts/lib/resulttool/log.py
index 5584f2d0a99..49816357cda 100644
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
index 8d17c7cd658..07dab4cbd31 100644
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
2.20.1


