Return-Path: <naftaly.ralamboarivony@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C421D116F5
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 16:32:01 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25970.1764606711000905757
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Dec 2025 08:31:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zAr3YlX+;
 spf=pass (domain: smile.fr, ip: 209.85.208.52, mailfrom: naftaly.ralamboarivony@smile.fr)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6408f9cb1dcso6685133a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 08:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1764606709; x=1765211509; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKnez7GlkVraC4ABlrfa6SvP4abbv+FEIadWzy/e1Fs=;
        b=zAr3YlX+5hCG0nNrBK3nXEwQw/TpDx+M3L7+amWS482iWSkynUMoBb0LS0CTF8r0Tz
         FrOSmCq5WtnvnApKDDSjNoh7/FzOOrSKuQaXDpYEgNKx0S1XCSXKX1GLjrzN26vDMHCJ
         l+6kCVezSnNRthSSzOa/oDHwnNuts1UWKoeC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764606709; x=1765211509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qKnez7GlkVraC4ABlrfa6SvP4abbv+FEIadWzy/e1Fs=;
        b=qtMaOFDttr21c3o2ghpbWxMJkIUTnqQj9amWGmogWFmG2+iDI2VBmEWmc1IEfW9F0S
         rSNDvj7LW5PPRW9pNbco0Z5UyHEk++O07fgpfKpfZJ5li+gZ62/C2jaTXK7QObwwgt+E
         ucdKalJYQgTyfDy0ycmpevQfjXX0Zdk8/8BlFcbyxJFX5iKqC5bXBN0mWLwSf+Vs5cMD
         /TH+tVwmK+dY50ElM8TKPRs7znn3G8Y/MtvbTeUxHgyNFU+CzqLX287JSMkXjX1y6lCk
         bLKWQXb5Doxo+BrnDyphUm+Y1X4u47isIf1TXaN3MsvCqPdZVeMEN3tTuPcY0rh6XvU1
         B+LQ==
X-Gm-Message-State: AOJu0YzNtkVKMsfBX8B6T1CvKyzaTzCz7ChJVryJVGSwwu6FgRP0110H
	3rHjZkBJdMDb7zUkj68n0AQ+RF3bdLE5KhBXfnvgeG26e+C2FUfKoluQpskr1NY56uUV4xfiVV2
	YKjCa
X-Gm-Gg: ASbGncv9GTwiZuvxPjk7eyf+EqZgL5OydzDZCKnY/iokPkynSY/shIb53U352tEqfxg
	RR4lWKYdonYqr6bg19eoA4H6YFDRedyMGCGpDvNNLaiGyjTvwx1DaaGmYidjR5pOol/3igvg8jz
	J8BwWsFuBG8z7T92SOTcEpGBBU2WVhrnQ20jiex0kozjaGZIYWWLCA2+flTp/ctg9ToBo4pC/fI
	AMix+EEBDszoDz+GZxRF2ulBuPZmZUe1/qqgswHgZjiy2E7AfeXXPaqI3ojFeZgO6R+dlxelnZl
	XXlV4C6wbmetbaXdbpy3XR3w4vzAIRC/i3Oov/+mVcQ5b9kTfEEUymOrk+XCASQMiiA9BBOP7Qu
	o9R7zpGU3MU6isZA0ES//kmEKMzB8V9z/D6OlbEWaGyDBJmwjPn0+2+BqV5iAGaNJVwOhQzk0G2
	6ixr6Ge/y3ZhLJxIas7HhZwPVR2V810Z94Qjv646dwQ8x/QUvE2uxsKI5snFNSngepRI554oXFK
	3axEczEC4P/oaK6dA1dStI=
X-Google-Smtp-Source: AGHT+IHNrkh2Y+iuYK45w7ZqrVsqj+nEVQefBLfc5MOyn0g3i8Xa4T9PNUXDAYWgJq0lQGYZcTjzAg==
X-Received: by 2002:a05:6402:d0d:b0:640:f481:988 with SMTP id 4fb4d7f45d1cf-645eb296a59mr22952441a12.19.1764606709063;
        Mon, 01 Dec 2025 08:31:49 -0800 (PST)
Received: from P-ASN-DERVAUX.. (2a02-8434-8fe1-4f01-3d1a-8466-8f7c-672d.rev.sfr.net. [2a02:8434:8fe1:4f01:3d1a:8466:8f7c:672d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a90d45sm12980290a12.8.2025.12.01.08.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 08:31:48 -0800 (PST)
From: naftaly.ralamboarivony@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
Subject: [PATCH v2 2/6] patchtest/selftest: convert separate count variables into a results dictionary
Date: Mon,  1 Dec 2025 17:30:56 +0100
Message-Id: <20251201163100.143476-2-naftaly.ralamboarivony@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251201163100.143476-1-naftaly.ralamboarivony@smile.fr>
References: <20251201163100.143476-1-naftaly.ralamboarivony@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 16:32:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227130

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

