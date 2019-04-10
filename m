Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5A35A7D8FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:12:21 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id w1so2916412wrp.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=n0iOU5syaMqXsoMNcOb8qwyggdPCnkuK2rsEuD2LQ6Q=;
	b=fNXtJf+FjW8b3vV6ZOxjKppsgjiXmXybKPlKOwoZmYnnHIDATt2AaU+ZPAT0mCJEho
	0Jo61QuByDeILPxLtl9rRXfYiw7YbrThzBStkdZbdn+lUWQh0nsDAklw3rVzug+E9pqH
	+sOB440J3znpWpM2g0y68XVFvxay+hHb2lRYUZWhcyznt7Zz5zp3i+/JHiU/S6K0RfJQ
	frmRE9I5NUXfNrG2FwPQ6WahxwzHlmsHzXLrWudMLeUeRBl0rX5WPHXk4GvXHcMm4EdT
	1MmkqHL0e5nreWTUTEni0wvo5IItN4Pirb7C0sccI/YrpSI386ZL77nvQO7ndFXPYZj7
	0Xrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=n0iOU5syaMqXsoMNcOb8qwyggdPCnkuK2rsEuD2LQ6Q=;
	b=nS+FBm0AiserPsrgRHi6hnvmnYCRi5Xw0Ungp2VQ4+9cuuuAmaaTUdxywLF58K6nKM
	+gu5tsGWxVTTGfZ1joQXRexzqRIH6+T9kSqnofK3RlzD+7n/t2bQRYV1D1P+0qg9kej7
	vOX1B7KlMZ91QaPcQy0307odeu3FjjPrk7gPUByFCc6AhuIRU0JkvLsHeBwIXrr0bh+i
	Ho69YRW+bU+MrXsznz/K/P2bMB8+wQ34zu6ezicsgK7WX+yzuxBPsPeccOXvAmndnvHr
	xvx4TgfppCrpGEKG3Xrt1BMZR1N6x5fCODSKfRUJToWq/UzKxCDH7PhqrIZ6XRpVa/T9
	Bh9A==
X-Gm-Message-State: APjAAAV30IskzWZE/9Cgvk6auYyiVO42qZz6EePRK9hdxycMMzGm84lA
	/DJyh0jB0HT9l5T5dGt3ZqOHaFRddoM=
X-Google-Smtp-Source: APXvYqxPacOEWcb3vCSdMIjDHJuuVTVVgsIjUoxSuBnGLgVwr257mssjFdrNf+lKKM/noyFUkXhE6w==
X-Received: by 2002:adf:d081:: with SMTP id y1mr28139243wrh.283.1554901941853; 
	Wed, 10 Apr 2019 06:12:21 -0700 (PDT)
Received: from localhost.localdomain ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id x14sm3032399wmj.3.2019.04.10.06.12.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Apr 2019 06:12:21 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2019 18:41:34 +0530
Message-Id: <08c5471c5abd95616af8df862e96072d022a6f42.1554901639.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1554901639.git.akuster808@gmail.com>
References: <cover.1554901639.git.akuster808@gmail.com>
Subject: [PATCH 15/33] resulttool: Allow extraction of ptest data
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
X-List-Received-Date: Wed, 10 Apr 2019 13:12:21 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Rather than simply discarding the ptest data, change the code to discard
it when writing out the new testresult files, or optionally either preserve
it, or write it as seperate discrete logs.

This means the autobuilder should start writing out individual ptest log
files as well as allowing ueers to extract these manually.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/resulttool/resultutils.py | 39 ++++++++++++++++++++++++++++-------
 scripts/lib/resulttool/store.py       |  2 +-
 2 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index 153f2b8..ad40ac8 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -15,6 +15,7 @@
 import os
 import json
 import scriptpath
+import copy
 scriptpath.add_oe_lib_path()
 
 flatten_map = {
@@ -60,12 +61,6 @@ def append_resultsdata(results, f, configmap=store_map):
         testpath = "/".join(data[res]["configuration"].get(i) for i in configmap[testtype])
         if testpath not in results:
             results[testpath] = {}
-        if 'ptestresult.rawlogs' in data[res]['result']:
-            del data[res]['result']['ptestresult.rawlogs']
-        if 'ptestresult.sections' in data[res]['result']:
-            for i in data[res]['result']['ptestresult.sections']:
-                if 'log' in data[res]['result']['ptestresult.sections'][i]:
-                    del data[res]['result']['ptestresult.sections'][i]['log']
         results[testpath][res] = data[res]
 
 #
@@ -93,15 +88,43 @@ def filter_resultsdata(results, resultid):
                  newresults[r][i] = results[r][i]
     return newresults
 
-def save_resultsdata(results, destdir, fn="testresults.json"):
+def strip_ptestresults(results):
+    newresults = copy.deepcopy(results)
+    #for a in newresults2:
+    #  newresults = newresults2[a]
+    for res in newresults:
+        if 'result' not in newresults[res]:
+            continue
+        if 'ptestresult.rawlogs' in newresults[res]['result']:
+            del newresults[res]['result']['ptestresult.rawlogs']
+        if 'ptestresult.sections' in newresults[res]['result']:
+            for i in newresults[res]['result']['ptestresult.sections']:
+                if 'log' in newresults[res]['result']['ptestresult.sections'][i]:
+                    del newresults[res]['result']['ptestresult.sections'][i]['log']
+    return newresults
+
+def save_resultsdata(results, destdir, fn="testresults.json", ptestjson=False, ptestlogs=False):
     for res in results:
         if res:
             dst = destdir + "/" + res + "/" + fn
         else:
             dst = destdir + "/" + fn
         os.makedirs(os.path.dirname(dst), exist_ok=True)
+        resultsout = results[res]
+        if not ptestjson:
+            resultsout = strip_ptestresults(results[res])
         with open(dst, 'w') as f:
-            f.write(json.dumps(results[res], sort_keys=True, indent=4))
+            f.write(json.dumps(resultsout, sort_keys=True, indent=4))
+        for res2 in results[res]:
+            if ptestlogs and 'result' in results[res][res2]:
+                if 'ptestresult.rawlogs' in results[res][res2]['result']:
+                    with open(dst.replace(fn, "ptest-raw.log"), "w+") as f:
+                        f.write(results[res][res2]['result']['ptestresult.rawlogs']['log'])
+                if 'ptestresult.sections' in results[res][res2]['result']:
+                    for i in results[res][res2]['result']['ptestresult.sections']:
+                        if 'log' in results[res][res2]['result']['ptestresult.sections'][i]:
+                            with open(dst.replace(fn, "ptest-%s.log" % i), "w+") as f:
+                                f.write(results[res][res2]['result']['ptestresult.sections'][i]['log'])
 
 def git_get_result(repo, tags):
     git_objs = []
diff --git a/scripts/lib/resulttool/store.py b/scripts/lib/resulttool/store.py
index 3a81933..e4a0807 100644
--- a/scripts/lib/resulttool/store.py
+++ b/scripts/lib/resulttool/store.py
@@ -68,7 +68,7 @@ def store(args, logger):
             results = revisions[r]
             keywords = {'commit': r[0], 'branch': r[1], "commit_count": r[2]}
             subprocess.check_call(["find", tempdir, "!", "-path", "./.git/*", "-delete"])
-            resultutils.save_resultsdata(results, tempdir)
+            resultutils.save_resultsdata(results, tempdir, ptestlogs=True)
 
             logger.info('Storing test result into git repository %s' % args.git_dir)
 
-- 
2.7.4


