Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F49C0032E
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 16:41:40 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.178438.1698252095999469991
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Oct 2023 09:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=AwcqF6yg;
 spf=pass (domain: baylibre.com, ip: 209.85.219.47, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-66d998b5f3cso34601416d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 09:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698252095; x=1698856895; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rQiSU5zOQzB2TAnsf4KtKY8kV26WpDHwtr3YfsqQ3N4=;
        b=AwcqF6ygi+qMYrkSlEEtR64aen8Ymdq6o4zp93B9t4lUJqVW03rBpLgGpfhvIe3pXK
         RIaDg9nK5bUZnBt9VPiE6DYIXaqwrBGZH3ihIN2sPIzzpPLmINay5o+3BpGXcPD+DsV+
         vl2SZIqN9xxRwfO+YiYQhwaHHLuUlsmrWREO53ulBmvUbZObkWaQVbGW2RkoBfNDSKiq
         SmagSJIOXIfqbDt5A2KZ4CwTKYPugQdInISk0/gnlLukJyOI6hLuYNaWQP3vt9dLDx4w
         87gpT3IP5vWjTsXetRZZ6iBDI2uVZ/8v44FdD7iBTY6jndWtIO8of0KAj80Slwj8LvZo
         mNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698252095; x=1698856895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rQiSU5zOQzB2TAnsf4KtKY8kV26WpDHwtr3YfsqQ3N4=;
        b=pTWumuX070S35niwoFgMud9bIbakHcvdpfO0psLtSS1koP0OVI6RrqJ/4NQyofsFCO
         SNxosELNbb88ZxADSeXFrBzuS2o6Tx90bK7BfCj5ex3uAa5BYLmS7ffwPsdtDG1fiD0O
         lecXDAWakVPVV9VmZdkryHGvk3eWJV4kKmPWoxd6Ts4Pn+ctPlMF7K7z349A2WChGnQy
         k/QoySfRJtMP3hyU6wtiqwrIY27356vrcu2DxaJmxs2lihqTPASgqsl9M8V5E2MVFpSt
         uttTb5VKSK/r+QrM2x2Ej2wQZw0D7GJkvyYgYxi7ttm2YwLRvdwJR+26HgKyhbJPsvql
         dKPg==
X-Gm-Message-State: AOJu0YyqIh0+6F7Byg36wYLIZC9lshHGdLA0/0lXv5suHjQRwHCB1qnP
	HQ+57MCMn1MtxwBQPvojSYlW/AcJYuD7477qZpLXpw==
X-Google-Smtp-Source: AGHT+IHIAhGC66jOlVvH5JW/l53V/zGAik+vhjf1GA1dTRT782B3pWPr30xhQUWl9omQjDrGfX0ywQ==
X-Received: by 2002:a05:6214:d06:b0:66d:9d5c:9a97 with SMTP id 6-20020a0562140d0600b0066d9d5c9a97mr15756014qvh.1.1698252094870;
        Wed, 25 Oct 2023 09:41:34 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id dh14-20020ad458ce000000b0066d1348bdddsm4532382qvb.44.2023.10.25.09.41.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 09:41:34 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] patchtest/selftest: add XSKIP, update test files
Date: Wed, 25 Oct 2023 12:41:33 -0400
Message-ID: <20231025164133.96030-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 16:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189692

Since we are skipping the merge test, two of the selftests now report
SKIP instead of XPASS/XFAIL as expected. Adjust the two files to have
the right endings for XSKIP, and add the category so that it can be used
for more extensive testing in the future.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...ad.pass => Merge.test_series_merge_on_head.1.skip} |  0
 ...ad.fail => Merge.test_series_merge_on_head.2.skip} |  0
 meta/lib/patchtest/selftest/selftest                  | 11 ++++++++---
 3 files changed, 8 insertions(+), 3 deletions(-)
 rename meta/lib/patchtest/selftest/files/{Merge.test_series_merge_on_head.pass => Merge.test_series_merge_on_head.1.skip} (100%)
 rename meta/lib/patchtest/selftest/files/{Merge.test_series_merge_on_head.fail => Merge.test_series_merge_on_head.2.skip} (100%)

diff --git a/meta/lib/patchtest/selftest/files/Merge.test_series_merge_on_head.pass b/meta/lib/patchtest/selftest/files/Merge.test_series_merge_on_head.1.skip
similarity index 100%
rename from meta/lib/patchtest/selftest/files/Merge.test_series_merge_on_head.pass
rename to meta/lib/patchtest/selftest/files/Merge.test_series_merge_on_head.1.skip
diff --git a/meta/lib/patchtest/selftest/files/Merge.test_series_merge_on_head.fail b/meta/lib/patchtest/selftest/files/Merge.test_series_merge_on_head.2.skip
similarity index 100%
rename from meta/lib/patchtest/selftest/files/Merge.test_series_merge_on_head.fail
rename to meta/lib/patchtest/selftest/files/Merge.test_series_merge_on_head.2.skip
diff --git a/meta/lib/patchtest/selftest/selftest b/meta/lib/patchtest/selftest/selftest
index 006d1badf83..6fad50ce616 100755
--- a/meta/lib/patchtest/selftest/selftest
+++ b/meta/lib/patchtest/selftest/selftest
@@ -18,14 +18,15 @@ parentdir  = os.path.dirname(topdir)
 # path to the repo root
 repodir = os.path.dirname(os.path.dirname(parentdir))
 
-def print_results(passcount, skipcount, failcount, xpasscount, xfailcount, errorcount):
-    total = passcount + skipcount + failcount + xpasscount + xfailcount + errorcount
+def print_results(passcount, failcount, skipcount, xpasscount, xfailcount, xskipcount, errorcount):
+    total = passcount + skipcount + failcount + xpasscount + xfailcount + xskipcount + errorcount
     print("============================================================================")
     print("Testsuite summary for %s" % os.path.basename(topdir))
     print("============================================================================")
     print("# TOTAL: %s" % str(total))
     print("# XPASS: %s" % str(xpasscount))
     print("# XFAIL: %s" % str(xfailcount))
+    print("# XSKIP: %s" % str(xskipcount))
     print("# PASS: %s" % str(passcount))
     print("# FAIL: %s" % str(failcount))
     print("# SKIP: %s" % str(skipcount))
@@ -48,6 +49,7 @@ if __name__ == '__main__':
     skipcount = 0
     xpasscount = 0
     xfailcount = 0
+    xskipcount = 0
     errorcount = 0
 
     results = None
@@ -71,6 +73,9 @@ if __name__ == '__main__':
                     elif expected_result.upper() == "PASS" and result.upper() == "PASS":
                         xpasscount = xpasscount + 1
                         print("XPASS: %s (file: %s)" % (testid.strip("."), os.path.basename(patch)))
+                    elif expected_result.upper() == "SKIP" and result.upper() == "SKIP":
+                        xskipcount = xskipcount + 1
+                        print("XSKIP: %s (file: %s)" % (testid.strip("."), os.path.basename(patch)))
                     else:
                         print("%s: %s (%s)" % (result.upper(), testid.strip("."), os.path.basename(patch)))
                         if result.upper() == "PASS":
@@ -86,4 +91,4 @@ if __name__ == '__main__':
             else:
                 print ("No test for=%s" % patch)
 
-    print_results(passcount, skipcount, failcount, xpasscount, xfailcount, errorcount)
+    print_results(passcount, failcount, skipcount, xpasscount, xfailcount, xskipcount, errorcount)
-- 
2.41.0


