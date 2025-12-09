Return-Path: <naftaly.ralamboarivony@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D541D1CDC6
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 10:55:51 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5196.1765277742184866839
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 02:55:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=x6HVr2wB;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: naftaly.ralamboarivony@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso63253085e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 02:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1765277740; x=1765882540; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twKBVRHbffrPEQrPPJr1jRsb7pPLZYA9hoYZqN9VNvg=;
        b=x6HVr2wBwnvS+FZ/BeEbs99d8ZP4I9ICIXgGMhmDAnf/X2OVKJ9RlwFqqARqZLc5cN
         9mDqCk8ksv5GN9QVgnMJLNUKxRDzz76bq0Wqf1s3lWApJ8bbapBS3iUFVXYW0J072w1q
         vk7JaapsLup5zoP4c1Xmsjv9viYmydo+ehAbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765277740; x=1765882540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=twKBVRHbffrPEQrPPJr1jRsb7pPLZYA9hoYZqN9VNvg=;
        b=DY3684FTImlon44nXAWssFyH/SqhWV/bXk9XTL2x14Q/2shq7WrcxM0fOgB8wvz49Q
         JiFi9vK2I+aBU5XPYV3O1v9em1ZyftCONZpMtStzrihcxiJb6gy9cJqXmMgeG66DVWlR
         fHzMZ9yJcWF1L4xD0nycyuHZpfKUNBh9h8q8qInhj3cCnyfABKm4lGWXS2eMrErJlkSm
         HS+Nm/5arnaKrwkFVrzqsqFPo+G+pV8wBIfN0J6nkNicMSVMUogKgCQdkLWYTn4HeIEL
         +6Tk+vDcTvsfRmQKWzi6qBtCWcUcHc/brrK00OXdqXrEf2yML51hLGMxFp7S2nOdPev5
         RxfA==
X-Gm-Message-State: AOJu0YzEURfX7undSyXUSmoKkBKYnDpQpJs74uKbzYKM6AbCYXkqYUQU
	QGF1k83c74sZgUoRN0Grx3zPRDuOXTIc6ieizSSaIVPhSXtq3NSzc+oOvGJLE/KlCycwYp7dE07
	5oHZ2
X-Gm-Gg: ASbGncsDqS5Axi6IOqf3feKxwVdnSgugyeo3OIL3GlrclbpFq1CdRq6o2VIpLizFRsp
	bjXXzrbskcJqrVwhxYMcqnLg7/YX3kouzDZ23VNZFN7Gnx7iQMEjt9C7oEZXS49187lakRbY5hX
	cJnsSvl6gEr56BUGTFxalluRsjl9aWjNo7j8fH+vD98VU8yL8pwSZ9YyBtpW9OdG54/tyHTyT13
	/3PRvPvS0RKGC0QuLMTP7oxnrrb4cvPGSBFPxQa1sNvjUwSS6Z/JRfitV0la40tMyHCuECUdmBg
	UH3VXTMHb9l5XbrKNU/+t4TxvmMgma9tNEi/5PVdzgnPypr6KDBnqp50krivPQgQ1Z6+5F0aV6I
	8HMOu+0WSAbg7KftTi1eBttXTKIJxYdR984uneEy2KDbgYagihfLJuAoyqJWBvv3U39z1pCOffc
	OLXg6qMLDgXxkPUtZxNLzuPtAkz3v00+Pu4EmnVyj89ya6yDqzuRM1NDMz4EIcl87u2ARLV4Mk9
	AyvRWRBkRjwBdRYC1wb5/g=
X-Google-Smtp-Source: AGHT+IEIdaWaAiS2w8PuLwzaqvB+oHVd41DwKoy+OnEVq5YatbqZm5p1PFytOo+ZPg1v+HyhUA6D4Q==
X-Received: by 2002:a05:600c:3013:b0:479:3a86:dc1b with SMTP id 5b1f17b1804b1-4793a86dca1mr60024135e9.37.1765277740329;
        Tue, 09 Dec 2025 02:55:40 -0800 (PST)
Received: from P-ASN-DERVAUX.. (2a02-8434-8fe1-4f01-fc4a-65a9-382e-6f5d.rev.sfr.net. [2a02:8434:8fe1:4f01:fc4a:65a9:382e:6f5d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d2e7435sm17412895e9.0.2025.12.09.02.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 02:55:40 -0800 (PST)
From: naftaly.ralamboarivony@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
Subject: [OE-core][PATCH v3 3/6] patchtest/selftest: refactor patch retrieval and result analysis
Date: Tue,  9 Dec 2025 11:55:10 +0100
Message-Id: <20251209105513.273859-3-naftaly.ralamboarivony@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251209105513.273859-1-naftaly.ralamboarivony@smile.fr>
References: <20251209105513.273859-1-naftaly.ralamboarivony@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 10:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227427

From: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>

Move the code responsible for collecting patches into a new get_patches()
function. It returns a list of dictionaries containing:
- test ID
- patch name
- expected result
- root path

Refactor result analysis code into an analyze_result() function that updates the
counts dictionary.

These two refactorings will make it easier to add a new test in detached HEAD
mode.

Signed-off-by: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
---
 meta/lib/patchtest/selftest/selftest | 94 +++++++++++++++++-----------
 1 file changed, 56 insertions(+), 38 deletions(-)

diff --git a/meta/lib/patchtest/selftest/selftest b/meta/lib/patchtest/selftest/selftest
index c2f274b15b..a1be478e1a 100755
--- a/meta/lib/patchtest/selftest/selftest
+++ b/meta/lib/patchtest/selftest/selftest
@@ -33,6 +33,58 @@ def print_results(counts):
     print("# ERROR: " + str(counts["error"]))
     print("============================================================================")
 
+def get_patches(patchesdir):
+    """
+    Return a list of dict mapping test IDs to patch filenames and expected results.
+    """
+    patch_list = []
+    for root, dirs, patches in os.walk(patchesdir):
+        for patch in patches:
+            part = patch.split('.')
+            klass, testname, expected_result = part[0], part[1], part[-1]
+            testid = f".{klass}.{testname}"
+            patch_list.append({
+                "testid": testid,
+                "patch": patch,
+                "expected": expected_result,
+                "root" : root,
+            })
+    return patch_list
+
+def analyze_result(results, patch, counts):
+    testid   = patch["testid"]
+    expected_result = str(patch["expected"])
+    for resultline in results.splitlines():
+        if testid in resultline:
+            result, _ = resultline.split(':', 1)
+
+            if expected_result.upper() == "FAIL" and result.upper() == "FAIL":
+                    counts["xfail"] = counts["xfail"] + 1
+                    print("XFAIL: %s (file: %s)" % (testid.strip("."), os.path.basename(patch["patch"])))
+            elif expected_result.upper() == "PASS" and result.upper() == "PASS":
+                    counts["xpass"] = counts["xpass"] + 1
+                    print("XPASS: %s (file: %s)" % (testid.strip("."), os.path.basename(patch["patch"])))
+            elif expected_result.upper() == "SKIP" and result.upper() == "SKIP":
+                    counts["xskip"] = counts["xskip"] + 1
+                    print("XSKIP: %s (file: %s)" % (testid.strip("."), os.path.basename(patch["patch"])))
+            else:
+                print("%s: %s (%s)" % (result.upper(), testid.strip("."),os.path.basename(patch["patch"])))
+                if result.upper() == "PASS":
+                    counts["pass"] = counts["pass"] + 1
+                elif result.upper() == "FAIL":
+                    counts["fail"] = counts["fail"] + 1
+                elif result.upper() == "SKIP":
+                    counts["skip"] = counts["skip"] + 1
+                else:
+                     print("Bad result on test %s against %s" % (testid.strip("."),os.path.basename(patch["patch"])))
+                     counts["error"] = counts["error"] + 1
+            break
+    else:
+        print ("No test for=%s" % patch["patch"])
+
+    return counts
+
+
 # Once the tests are in oe-core, we can remove the testdir param and use os.path.dirname to get relative paths
 def test(root, patch):
     res = True
@@ -55,42 +107,8 @@ if __name__ == '__main__':
     }
 
     results = None
-        
-    for root, dirs, patches in os.walk(patchesdir):
-        for patch in patches:
-            results = test(root, patch)
-
-            a = patch.split('.')
-            klass, testname = a[0], a[1]
-            expected_result = a[-1]
-            testid          = ".%s.%s" % (klass,testname)
-
-            for resultline in results.splitlines():
-                if testid in resultline:
-                    result, _ = resultline.split(':', 1)
-
-                    if expected_result.upper() == "FAIL" and result.upper() == "FAIL":
-                        counts["xfail"] = counts["xfail"] + 1
-                        print("XFAIL: %s (file: %s)" % (testid.strip("."), os.path.basename(patch)))
-                    elif expected_result.upper() == "PASS" and result.upper() == "PASS":
-                        counts["xpass"] = counts["xpass"] + 1
-                        print("XPASS: %s (file: %s)" % (testid.strip("."), os.path.basename(patch)))
-                    elif expected_result.upper() == "SKIP" and result.upper() == "SKIP":
-                        counts["xskip"] = counts["xskip"] + 1
-                        print("XSKIP: %s (file: %s)" % (testid.strip("."), os.path.basename(patch)))
-                    else:
-                        print("%s: %s (%s)" % (result.upper(), testid.strip("."), os.path.basename(patch)))
-                        if result.upper() == "PASS":
-                            counts["pass"] = counts["pass"] + 1
-                        elif result.upper() == "FAIL":
-                            counts["fail"] = counts["fail"] + 1
-                        elif result.upper() == "SKIP":
-                            counts["skip"] = counts["skip"] + 1
-                        else:
-                            print("Bad result on test %s against %s" % (testid.strip("."), os.path.basename(patch)))
-                            counts["error"] = counts["error"] + 1
-                    break
-            else:
-                print ("No test for=%s" % patch)
-
+    patches = get_patches(patchesdir)
+    for patch_info in patches:
+        results = test(patch_info["root"], patch_info["patch"])
+        counts = analyze_result(results, patch_info, counts)
     print_results(counts)

