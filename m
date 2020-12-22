Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web09.10442.1608636314594545415
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 03:25:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=IDKL4St+;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.215.179, mailfrom: mshah@mvista.com)
Received: by mail-pg1-f179.google.com with SMTP id n25so2672303pgb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Dec 2020 03:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=4O/PKdFi8XhB2wdd9YLYmanw7TGR9s9+36Mieo/EG5E=;
        b=IDKL4St+fZyjnYUTpvSaW6uHVf2L47mCjKXAwPnWr9HrvHP8ZeoEpFXdCU3hgJsuka
         q3jGN0a+u46ENd2LN1N9d9tU05lQlUjboS0rTcQQBl6FE8ApldCdpmAkhApB1HafYktz
         5MGT2d2wF213vcf/UK9FdkuHKO+VC7oGfJob+YprJZwaL9aatoqNi/sJB2+FEoEpvh/z
         4kAu+ea1ej/1GAbyxPk1t/sS8NOL1uTgV/GcXkodD7AlCx72Kpm8mkXGBJVlaPMh88rv
         uVfikW5Z3t9NJBsKSyUvr2nX1yySA2D8ugo3s3SwGgPg5EzleSp7ouWJQDWE3rDYu/2z
         it0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=4O/PKdFi8XhB2wdd9YLYmanw7TGR9s9+36Mieo/EG5E=;
        b=ivQWPMYhoaO2PgaC1tUz2yjAnUYjaobcMtvXW2d4a7CyQTMgj8UProAXkJ1lr6e6d1
         L3hG99LdH1UMLlyR5mGa3qpJC2bnc/kaHd1HU+r8TwHFkSgibHpVFUDEdk98vBZqSwcM
         e4Gnp60w9ta3jyRLOOZSimbh5b3kB2D8nZYFBApbx3GePWYRHlOgjt8UD378GKzH1Whl
         6DTnJNqILYSsxaD476SXa8sdtohToCyor5Gf0UdwIn/DhF8z+4FwZQmT0eAzfmPiOXg/
         BQlQhiCOtLS4F6GW2EfA401UTJpJhF2JKA30VJs0AzIBt3YB4HvIBWPK47WBz567Cnw+
         hdEg==
X-Gm-Message-State: AOAM533doEsE02aEch/BDJk9cqqn5p+4vqOQa2R/bd6KvanFilbZG6sJ
	Y5CoM5f4zqh0FBgUirmY4jceGHwhY7NWyQ==
X-Google-Smtp-Source: ABdhPJzOOg9tTs1M6rKqmCF4FMOmt8veAXIAC/ghsbfo13kwYb+uLA+/EMzeGU/2DaNtVqy9Dky3nA==
X-Received: by 2002:a63:3111:: with SMTP id x17mr19272443pgx.329.1608636313815;
        Tue, 22 Dec 2020 03:25:13 -0800 (PST)
Return-Path: <mshah@mvista.com>
Received: from dell-latitude.mvista.com ([103.102.57.97])
        by smtp.gmail.com with ESMTPSA id 5sm19661878pff.125.2020.12.22.03.25.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Dec 2020 03:25:13 -0800 (PST)
From: "Milan Shah" <mshah@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Milan Shah <mshah@mvista.com>
Subject: [meta-oe][PATCH] oe-pkgdata-util: Added a test to verify oe-pkgdata-util without parameters
Date: Tue, 22 Dec 2020 16:54:45 +0530
Message-Id: <1608636285-20638-1-git-send-email-mshah@mvista.com>
X-Mailer: git-send-email 2.7.4

A test is implemented on poky/meta/lib/oeqa/selftest/pkgdata.py to test
the scenario when oe-pkgdata-util is executed without parameters and
help is displayed.

See [YOCTO #10726] for detailed bug information.

Upstream-Status: Submitted

Signed-off-by: Milan Shah <mshah@mvista.com>
---
 meta/lib/oeqa/selftest/cases/pkgdata.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/pkgdata.py b/meta/lib/oeqa/selftest/cases/pkgdata.py
index 833a180..d3a5519 100644
--- a/meta/lib/oeqa/selftest/cases/pkgdata.py
+++ b/meta/lib/oeqa/selftest/cases/pkgdata.py
@@ -218,3 +218,9 @@ class OePkgdataUtilTests(OESelftestTestCase):
     def test_specify_pkgdatadir(self):
         result = runCmd('oe-pkgdata-util -p %s lookup-pkg zlib' % get_bb_var('PKGDATA_DIR'))
         self.assertEqual(result.output, 'libz1')
+
+    def test_no_param(self):
+        result = runCmd('oe-pkgdata-util', ignore_status=True)
+        self.assertEqual(result.status, 2, "Status different than 2. output: %s" % result.output)
+        self.assertIn('oe-pkgdata-util: error: the following arguments are required: <subcommand>', result.output)
+        self.assertIn('usage: oe-pkgdata-util [-h] [-d] [-p PKGDATA_DIR] <subcommand>', result.output)
-- 
2.7.4

