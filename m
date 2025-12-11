Return-Path: <naftaly.ralamboarivony@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88844D41D4C
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 15:06:53 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11401.1765465612897899458
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 07:06:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lslvLYWi;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: naftaly.ralamboarivony@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-429ce7e79f8so157019f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 07:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1765465611; x=1766070411; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twKBVRHbffrPEQrPPJr1jRsb7pPLZYA9hoYZqN9VNvg=;
        b=lslvLYWiaN1x+knf1u6Ebt4JMFTfn1twb/zU1/srf5AKThg0LBNFfDCVVfSzCHSNhe
         aU3rMVQPYDUFbPjX18mfJBjSCxJlk7+qHNfrPatxIJxzkUvW2n5QzJSvB4ayoIph755R
         lFjeNEGr5YRbIPn9G6iofSNG3LoCqOP+pL3K8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765465611; x=1766070411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=twKBVRHbffrPEQrPPJr1jRsb7pPLZYA9hoYZqN9VNvg=;
        b=etyXA9nKCWF5kNHqFHzKA9okFDW3MRuwKgfLgBHKxMWvu/ftKLXDAbJVrA1SYVHbZg
         yPbu3inSVkXWlQsnSX0qerCv9yBv7/uU/nVhqZB7y9i/QWaCtiZkwDEVHBF41JLx2eMg
         2gsNGTS1rZ2z8+yVIbBet5YEYRYujO2g+cWHCXI9/WUq1fNOIDsvCYsdoz+EgkFI1Kc6
         ZWQPp0UEZSdomZMsOLJIfQR7cfFOg8lcEVN9kwLyvvfK3slZQcYHf1MV6upvnEZ4c8iR
         fPN/Ld8i45e3a7Ak/pPIr5J+aoJ5XjLBYbCeLENULo3uJYLZePUerKd94iR0aLgD5Ypu
         cyIg==
X-Gm-Message-State: AOJu0Yz9SYACWerWx6rp7ytQOC2oF1l22XS3gUiY2pV0Zk2vpcP2ih4A
	oKiZr3mhlwEr+K7KW6zdx+iY6tCFVexx7SJbKAzYANy/UYD63u/0a3FjNFRr378zey/UuHzwCue
	MqBtb
X-Gm-Gg: AY/fxX45+Yi4wwncHzaEAB7YcNtMMbjI2bQlJRPxYonSlgHIjvpFCv2tunLHXTbe+s7
	3y5j+LcwL/mXVl0/42hdGQIcrUbsK+xZARDTnV/TMBqbjvntJe8uH23b1PxVwfKg5PfYixroBum
	F1tg45aJ2qSdNTrmnkl/QdKL6tDOjKkA1QfKOEaPIuBvsrN1wR52P9EPntNy06gvdTI0LAzomMp
	RuyX9kpTxLnbb7Ujp0H9I0UmS75rWyBSIwVp0XpYaFyXIxrV56GgJX/igJPpxUOFfhzvKh0I31D
	OHBY7ItyhsqFudplTODRpMxBWt9tAyWgKGxlMc/4nB/ZiFKp2ISoRan9ITWMoMUR0IWywvOUsNt
	qp6WRbvm/tOpDPjl2Zg9NrMA+Cgv9FlGXtLvzgTVoFBIguXnfweh580hw9cFlfNcGf/I/OaB7CC
	13SNiS8FrPfPUa0xE/CblcHoZ3JD+3nN4wM3S5Dgs+Jf3Um4H90O6UHTMACzBxoXge4w8bNadcQ
	J14wConfBsqEW9KeK//GA==
X-Google-Smtp-Source: AGHT+IG2n63FxNi5p/6EgGtMW2Njl9fmLMQPGWm+XRPkTaZ6aXT4I6zs+9TjCzHgGTnyH1WwJ7lTPQ==
X-Received: by 2002:a05:6000:612:b0:425:73c9:7159 with SMTP id ffacd0b85a97d-42fa3afe908mr6858989f8f.33.1765465611003;
        Thu, 11 Dec 2025 07:06:51 -0800 (PST)
Received: from P-ASN-DERVAUX.. (2a02-8434-8fe1-4f01-5250-bba4-03e6-c67a.rev.sfr.net. [2a02:8434:8fe1:4f01:5250:bba4:3e6:c67a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8a70379sm6504043f8f.11.2025.12.11.07.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 07:06:50 -0800 (PST)
From: naftaly.ralamboarivony@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
Subject: [OE-core][PATCH v4 3/6] patchtest/selftest: refactor patch retrieval and result analysis
Date: Thu, 11 Dec 2025 16:06:43 +0100
Message-Id: <20251211150646.2647853-3-naftaly.ralamboarivony@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251211150646.2647853-1-naftaly.ralamboarivony@smile.fr>
References: <20251211150646.2647853-1-naftaly.ralamboarivony@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 15:06:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227541

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

