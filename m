Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2451DC5AD4C
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:39:43 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web10.621.1700498382567376455
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:39:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eGCqP148;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.174, mailfrom: steve@sakoman.com)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3580b94ac2eso17309665ab.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 08:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700498381; x=1701103181; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RA5ha+QCL2KVAmoiqS92uNYbUAPRtjl1Au6aYRyHHYk=;
        b=eGCqP148nfWi20b7NWF7gBDIa9KuQKbz8iycBvpt3Q+8kCFWlfBAydrZCe4oTUd3KD
         MWT41n3lsC3xzhGb2rt1ZS7AdteP86cw0KGIJkeVwEo8egKzj1xKHQqLeSfzNjeU+7pM
         H8O4PdWnl7q4bhnEA5TIj0SyCKcu8yd3lIwE41fl6cQRoPR3vnIUlmODdk1eJUEo80mk
         2m6uLaqor67ndpglsLo28W3ffhzwgfwprPIkcSu3z0cR5UnsNZGhTXrpL6zxj7oSx4se
         k/NC3WCjBkOemewM1PGbFwg4iX8H8EHmPQxeRAUfftxUfHiEZMRBjkuybPlhETUBtfD6
         XMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700498381; x=1701103181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RA5ha+QCL2KVAmoiqS92uNYbUAPRtjl1Au6aYRyHHYk=;
        b=A93KFAglUF4RznYCllEzBsXmeED7w0zZXh3uF3d34X0t1YJyBd/WPWhubdq8KvrKjq
         5uSYKSAbqnpY8SbeW+Svt1HeKoZUScL1CKAHm31EpVVLu1vdl70rIvS+vSKoxLlGivSi
         GESG0AC2DfjHUOtjazKP9fBpLBDkbLX7r8BiQr2y2xwy/EpUzKPhTb4Kc6J/UwuG8Il7
         0i4L2wRXUk7LQ0ibFR1emJsteMBpYW4Hr8vVBAeNtxXqguxhBVtpHeZF3JF2F+xn48pp
         nrhx/oXIK21RQ45mIEu20+7II1akKbZAdbQQbHC4qrvcPgNc6LkqlLbqX3NEkiBrKFlQ
         YrgA==
X-Gm-Message-State: AOJu0YyUev9gUAwbi/KzvIX5y7rvK0FmJ0Gm5xphW71TLYOS+DKhDmmM
	uigoi+2TBpWxSB5Zbhct+0TWP5o/qUn+pY4E0unpZg==
X-Google-Smtp-Source: AGHT+IGTdt4vzR/ZqSZXD/C04qPR3ZYdcrs9dVvKCd2ZbIhwbhvG8ClfYI5D2hDTYWEMColqivqSWg==
X-Received: by 2002:a05:6e02:348c:b0:34f:c7f7:18b with SMTP id bp12-20020a056e02348c00b0034fc7f7018bmr13094079ilb.2.1700498381532;
        Mon, 20 Nov 2023 08:39:41 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id o23-20020a634e57000000b005c215baacc1sm4899279pgl.70.2023.11.20.08.39.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:39:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 24/33] patchtest/selftest: add XSKIP, update test files
Date: Mon, 20 Nov 2023 06:38:38 -1000
Message-Id: <3941cb809f16ef0c11ef4a4321125a8f11020561.1700496737.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700496737.git.steve@sakoman.com>
References: <cover.1700496737.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:39:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190913

From: Trevor Gamblin <tgamblin@baylibre.com>

Since we are skipping the merge test, two of the selftests now report
SKIP instead of XPASS/XFAIL as expected. Adjust the two files to have
the right endings for XSKIP, and add the category so that it can be used
for more extensive testing in the future.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3331f53c0be2575784a042bb2401eeba4f2a5a3e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index 006d1badf8..6fad50ce61 100755
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
2.34.1


