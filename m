Return-Path: <naftaly.ralamboarivony@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B263D116F1
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 16:32:01 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25753.1764606714262111206
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Dec 2025 08:31:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xoD48Pfm;
 spf=pass (domain: smile.fr, ip: 209.85.208.45, mailfrom: naftaly.ralamboarivony@smile.fr)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-640860f97b5so6875576a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 08:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1764606712; x=1765211512; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twKBVRHbffrPEQrPPJr1jRsb7pPLZYA9hoYZqN9VNvg=;
        b=xoD48PfmoTzxymrza8r+IIvDs0U81bm406HBNM5vKOUxiw9O7rOnljWLUTkss861kb
         zTaFDQnLsoqCOKz7zMINJFnd445hIH74WTh84trD9WufPsGvUYpC5AqXd1FZ0jznJc9X
         lXfPgIBkyTvbqGZ+lx9ZLBUlatJnKueaMyIAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764606712; x=1765211512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=twKBVRHbffrPEQrPPJr1jRsb7pPLZYA9hoYZqN9VNvg=;
        b=t2WDkVbq90CZZ5AeL5ksMvh+bpVusKC6sUpWDguQmBBG56UuUyXEXBHvM7RyMqp1Cc
         MMC3GUmol4xFaxMRlMGelDU6+C4LePI7Hi7s+/cZnNSdoWChY192JuFoGnoJ1LEMOW9g
         7UZQSigwut9YgvAonDl2o46h2U5HifdbFoCFC19SB9aGoudkMGOhqejki/iDxJ5C+WZ3
         evEDwxyyoH7cDPeBqxqBTN4mLu1PZcv3Sd4orYX+fJmPrLWI3Wh3CRx1SfRsTfUdSlZY
         yR8xBhdYe4G3wWHh5ZpQQ4T8saLn5ONBYxBp5/PfL0qlMIdHf5CF9BmkSczua2a7c8Ay
         r3lA==
X-Gm-Message-State: AOJu0YzAQpudfQqTsmZdUfL+bAi2yBPzOg/v+VZKBSMMTe5RD92tijlA
	OZgd8WbW1wazh/RtTH3yrU+7CvW1g8jBLmueBQcppRTBTmgkoMp5G68ba/MFAFGqTIZXPbLyNvD
	2W1Jr
X-Gm-Gg: ASbGncuqkZY/dOvfRYzAttxKnc5IttM/JeM28BycCrSFEpK7sHyqLg94K3G/6c77z4G
	QjAVvxDye5aGTObn2zR3bf52vYbArPlvax59PZHzDaith70cHiPeOr6Nr2Z2ACg4LaboWX/q9Lf
	vaWyA3xAnA+/bRM5599nvnULbACRD7QXhlkd+csyVrzodo9n9f6Iy4EVO2C4F1jwuuYTfGxw/XB
	BZ+LFBm6QZ481KTZFhqWnOeR2oBoRILHK56IstKVE+DYs4lGtj//gS6BW0TgT25wylTLlmlYbGZ
	kVG4fq5fUa7qYeWQzfY+ats/VC4HntYOUrnAilJHZHvCyOxx8xiC//IM9NyCw5W1kgQXSOicV4J
	AvYpkSqzg0wCF6QYwE/hrRABIb6f/zEcSN6Wi0QEpacSMmFSdOFnvtUMj/pWljgFMj6EoKNdwDb
	JEser5csFVC+D2FRA8FCCfSQCq0RZpYt+MuDs9b4WzgnOur0Z++32j9JvbLcGiEk5qNzdQNfQxR
	DIi5dDpyMxyvKdO7YdpTqo=
X-Google-Smtp-Source: AGHT+IHYdit8WtQ4nINlMdRpmBNFBz8PNCQBV8buTl10cVImrJkjtIUPKRyY3/ZK07smfh3DAUGt4g==
X-Received: by 2002:a05:6402:42c4:b0:647:8538:fd15 with SMTP id 4fb4d7f45d1cf-64785390039mr18603a12.8.1764606712401;
        Mon, 01 Dec 2025 08:31:52 -0800 (PST)
Received: from P-ASN-DERVAUX.. (2a02-8434-8fe1-4f01-3d1a-8466-8f7c-672d.rev.sfr.net. [2a02:8434:8fe1:4f01:3d1a:8466:8f7c:672d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a90d45sm12980290a12.8.2025.12.01.08.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 08:31:52 -0800 (PST)
From: naftaly.ralamboarivony@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
Subject: [PATCH v2 3/6] patchtest/selftest: refactor patch retrieval and result analysis
Date: Mon,  1 Dec 2025 17:30:57 +0100
Message-Id: <20251201163100.143476-3-naftaly.ralamboarivony@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251201163100.143476-1-naftaly.ralamboarivony@smile.fr>
References: <20251201163100.143476-1-naftaly.ralamboarivony@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 16:32:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227131

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

