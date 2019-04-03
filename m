Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 11B7C7D34C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 14:40:46 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id r4so21710065wrq.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2019 07:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=XtiZW+KxJu29MPHi/QLRIxFdHvF/v6cShDrzZ2GkbVU=;
	b=RMxQ+e4ADCdtR6cE6FzD+i4J7EmsL0c9stD2/Hj06mjAOsAG6MBgCpEpPGlfsEyhzV
	WBVC6U1j/bFzit6i/aqEddDRE1x8RQ44UF9/2w+6H/aEuuKS50iHnXSMlqz22qZzNghR
	FAJi2yQGsCXHAtVvw962xhVzNCPRUlJcuEcPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XtiZW+KxJu29MPHi/QLRIxFdHvF/v6cShDrzZ2GkbVU=;
	b=g9efpxJprLlXpgetJeg0L+TUKzvYILA6wGfFfWiT3G/+zUxnaCYUUd61R86KghLzi3
	pS2z8dmt+LNAjXwQMdERAKgVmCXBcbDCI/OhSbsG1l7XtNMeku0f8mFtmYB2PxluFNoL
	XLqHvX+nCLoIgv2/s6QjQ/tVNBvqzcUuY7hneBpkTvz+gufQJQa1byLNoRbPf1S9NlA0
	grUYb3mauM37jJCn2M9jq0LLLs7dfkOzyiXDwNAcs+luWxIs9aQ9KsAXkPsmkLUs0w5I
	GbWKhkwD6kFo0279uGxuH+2Y+VVCZympaxnr/fvRc9QRkaC7HlUq9qa1YKuuki+XlgIr
	SKDA==
X-Gm-Message-State: APjAAAVmEHIbJg+D7Bsz1B0KhKM5KH9zZZ+9A+zmjzl51bfUjDS1Tr39
	gXI0mZmamr5OSccl3wIflWpQHSRWeasrww==
X-Google-Smtp-Source: APXvYqw+3ckmoU6GYSfNtWby0AMwTDjXbq+dDx1iPFelI/GnTNPIEyyHfOZg+x0pyc4quJ9L+nSXRw==
X-Received: by 2002:a5d:54c4:: with SMTP id x4mr48184497wrv.296.1554302447388; 
	Wed, 03 Apr 2019 07:40:47 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r9sm17216873wmh.38.2019.04.03.07.40.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Apr 2019 07:40:45 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2019 15:40:43 +0100
Message-Id: <20190403144043.4566-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190403144043.4566-1-richard.purdie@linuxfoundation.org>
References: <20190403144043.4566-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] resulttool: Allow extraction of ptest data
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
X-List-Received-Date: Wed, 03 Apr 2019 14:40:47 -0000
Content-Transfer-Encoding: 8bit

Rather than simply discarding the ptest data, change the code to discard
it when writing out the new testresult files, or optionally either preserve
it, or write it as seperate discrete logs.

This means the autobuilder should start writing out individual ptest log
files as well as allowing ueers to extract these manually.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/resulttool/resultutils.py | 39 +++++++++++++++++++++------
 scripts/lib/resulttool/store.py       |  2 +-
 2 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index 153f2b8e107..ad40ac8499d 100644
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
index 3a81933242b..e4a08075287 100644
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
2.20.1


