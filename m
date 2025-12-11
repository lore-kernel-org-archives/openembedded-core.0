Return-Path: <naftaly.ralamboarivony@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8129BD41D54
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 15:06:53 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11400.1765465612505832462
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 07:06:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NBoew8LX;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: naftaly.ralamboarivony@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso2877525e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 07:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1765465611; x=1766070411; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKnez7GlkVraC4ABlrfa6SvP4abbv+FEIadWzy/e1Fs=;
        b=NBoew8LXg0AN9CsLlTPn1WJQvdFoWafnNnl71V70DBI9LunEwsKxU07vnehJ+33NCE
         eOf9aItm/2PP14HeaY2VFZVL/jht4r+GHZPjfmNaRVNsFQSlhqMECH4emI0RMn8dxfHh
         Jqqwn2R5Y7cUNSbe0Q+/rFZfeZbsmrQqFpPDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765465611; x=1766070411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qKnez7GlkVraC4ABlrfa6SvP4abbv+FEIadWzy/e1Fs=;
        b=MNaYd6UZbQGU1PivRCcbYoe1WQrG3iJb/0kVSjyftqihvLNlOtNOCl9aHHpKJjYCIy
         /E2zpEzWDp75WhotvJPYqz4+56lFAp1mdB8h6ildTmuLTeUxIOooM8mML2YKqsOmiREW
         szfsZMZyIkN3OYM2DPoEwle2p7Pbu7XYpZ3i766lTGK1P2SjSUYieZNlMNIZRpQSfhUP
         tjuaTRkmmpZ1vKRX07qQl1xZcIco23h40VrDjr3wZ5tnCrTpF75nIOOCXo+lOH38SudY
         pOeKfbxWA+5TDZyCFjt8DkgncmNl2OqwltyJepSeur1vbKdWXFBIoODytk4/DbZgoypw
         qOIQ==
X-Gm-Message-State: AOJu0YzNYY17DC2XxoLhx6nr/ljygNZL75pxgVo1MIbDfMFsE1bjKn50
	HtgKiLnMRsenX6UNDTvXoi8HhPea+lyHGhMze5t0wFyOczUuRqIz0qHfEC+6GWVjHMc8CdlUe6K
	PhJvn
X-Gm-Gg: AY/fxX7PplaAzjLRAXiiyEH15gSijtp0CIYUNmjq20Govt5sRcmkba4Zfjnt/n9MQnY
	iexWNTheYvPLFpjfA8v7D/40VcLSW0DpBVnQsFuDV8lCIm6yMc18NG/aZaRJ6+BNUt6BBocyK2f
	E56RDvu7oqWUqST6hekq2bq3WuJs56I1wacklCtafQhFYpZoxoLzjFmREBMhBVAk7K26csK+Mbw
	CzaUs5wjQDgxzqdVZjxgJRiHKXdRa2BB/4LwAiJU2MUWEdnmV6Hs+boqfGEHaiL4xKp0pmRjY96
	HGmgy7BXepvY/3WV64aUgNVaJb8y+9jsM2RPDSAW1SKzXx/i/3F3+NX7sUH3RthzdyxaE+7Hb8A
	NW/1zmfi47P2byhqL1Tsh2jFiPx41DycrUZFUL4NrgA7vH7t5xgyUTjgg0asnnzAcA/NmdOhhx6
	vKf2ZdjFr3avauwor/2tE+e6YRaDsaEFP4b9eB9DwAUaZAV+Zj6N4s4geRyYVf+vQCqva58fzMd
	TEuLewScSafGRt+D1rpAQ==
X-Google-Smtp-Source: AGHT+IGHrtJxzvsOzyDgsJuFP5+51mZg8UoWd3jhT9HEV1lb5FbBa2HdrOqHE59WO+2jS/HElahrsg==
X-Received: by 2002:a05:6000:2f84:b0:42b:3366:6330 with SMTP id ffacd0b85a97d-42fa3b0cecfmr7231708f8f.57.1765465610540;
        Thu, 11 Dec 2025 07:06:50 -0800 (PST)
Received: from P-ASN-DERVAUX.. (2a02-8434-8fe1-4f01-5250-bba4-03e6-c67a.rev.sfr.net. [2a02:8434:8fe1:4f01:5250:bba4:3e6:c67a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8a70379sm6504043f8f.11.2025.12.11.07.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 07:06:50 -0800 (PST)
From: naftaly.ralamboarivony@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
Subject: [OE-core][PATCH v4 2/6] patchtest/selftest: convert separate count variables into a results dictionary
Date: Thu, 11 Dec 2025 16:06:42 +0100
Message-Id: <20251211150646.2647853-2-naftaly.ralamboarivony@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251211150646.2647853-1-naftaly.ralamboarivony@smile.fr>
References: <20251211150646.2647853-1-naftaly.ralamboarivony@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 15:06:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227540

From: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>

Change the variables used to count test results:
- passcount
- failcount
- skipcount
- xpasscount
- xfailcount
- xskipcount
- errorcount

into a single dictionary named counts, in order to make it easier
to pass these values to a result analysis and display function
(print_results).

Signed-off-by: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
---
 meta/lib/patchtest/selftest/selftest | 52 +++++++++++++++-------------
 1 file changed, 27 insertions(+), 25 deletions(-)

diff --git a/meta/lib/patchtest/selftest/selftest b/meta/lib/patchtest/selftest/selftest
index 3cf1c361f7..c2f274b15b 100755
--- a/meta/lib/patchtest/selftest/selftest
+++ b/meta/lib/patchtest/selftest/selftest
@@ -18,19 +18,19 @@ parentdir  = os.path.dirname(topdir)
 # path to the repo root
 repodir = os.path.dirname(os.path.dirname(parentdir))
 
-def print_results(passcount, failcount, skipcount, xpasscount, xfailcount, xskipcount, errorcount):
-    total = passcount + skipcount + failcount + xpasscount + xfailcount + xskipcount + errorcount
+def print_results(counts):
+    total = sum(counts.values())
     print("============================================================================")
     print("Testsuite summary for %s" % os.path.basename(topdir))
     print("============================================================================")
-    print("# TOTAL: %s" % str(total))
-    print("# XPASS: %s" % str(xpasscount))
-    print("# XFAIL: %s" % str(xfailcount))
-    print("# XSKIP: %s" % str(xskipcount))
-    print("# PASS: %s" % str(passcount))
-    print("# FAIL: %s" % str(failcount))
-    print("# SKIP: %s" % str(skipcount))
-    print("# ERROR: %s" % str(errorcount))
+    print("# TOTAL: " + str(total))
+    print("# XPASS: " + str(counts["xpass"]))
+    print("# XFAIL: " + str(counts["xfail"]))
+    print("# XSKIP: " + str(counts["xskip"]))
+    print("# PASS: " + str(counts["pass"]))
+    print("# FAIL: " + str(counts["fail"]))
+    print("# SKIP: " + str(counts["skip"]))
+    print("# ERROR: " + str(counts["error"]))
     print("============================================================================")
 
 # Once the tests are in oe-core, we can remove the testdir param and use os.path.dirname to get relative paths
@@ -44,13 +44,15 @@ def test(root, patch):
     return results
 
 if __name__ == '__main__':
-    passcount = 0
-    failcount = 0
-    skipcount = 0
-    xpasscount = 0
-    xfailcount = 0
-    xskipcount = 0
-    errorcount = 0
+    counts = {
+        "pass": 0,
+        "fail": 0,
+        "skip": 0,
+        "xpass": 0,
+        "xfail": 0,
+        "xskip": 0,
+        "error": 0,
+    }
 
     results = None
         
@@ -68,27 +70,27 @@ if __name__ == '__main__':
                     result, _ = resultline.split(':', 1)
 
                     if expected_result.upper() == "FAIL" and result.upper() == "FAIL":
-                        xfailcount = xfailcount + 1
+                        counts["xfail"] = counts["xfail"] + 1
                         print("XFAIL: %s (file: %s)" % (testid.strip("."), os.path.basename(patch)))
                     elif expected_result.upper() == "PASS" and result.upper() == "PASS":
-                        xpasscount = xpasscount + 1
+                        counts["xpass"] = counts["xpass"] + 1
                         print("XPASS: %s (file: %s)" % (testid.strip("."), os.path.basename(patch)))
                     elif expected_result.upper() == "SKIP" and result.upper() == "SKIP":
-                        xskipcount = xskipcount + 1
+                        counts["xskip"] = counts["xskip"] + 1
                         print("XSKIP: %s (file: %s)" % (testid.strip("."), os.path.basename(patch)))
                     else:
                         print("%s: %s (%s)" % (result.upper(), testid.strip("."), os.path.basename(patch)))
                         if result.upper() == "PASS":
-                            passcount = passcount + 1
+                            counts["pass"] = counts["pass"] + 1
                         elif result.upper() == "FAIL":
-                            failcount = failcount + 1
+                            counts["fail"] = counts["fail"] + 1
                         elif result.upper() == "SKIP":
-                            skipcount = skipcount + 1
+                            counts["skip"] = counts["skip"] + 1
                         else:
                             print("Bad result on test %s against %s" % (testid.strip("."), os.path.basename(patch)))
-                            errorcount = errorcount + 1
+                            counts["error"] = counts["error"] + 1
                     break
             else:
                 print ("No test for=%s" % patch)
 
-    print_results(passcount, failcount, skipcount, xpasscount, xfailcount, xskipcount, errorcount)
+    print_results(counts)

