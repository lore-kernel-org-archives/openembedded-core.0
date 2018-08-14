Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id CA3E579029
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 17:32:09 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id o18-v6so13060642wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 10:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=9xvCACVfnkHzaDQSIEUQ6IwRDScipM/WhF3XoYrX9h4=;
	b=MtzlmhZVwtkF55UCSYACmCHwCx3NfNkpMK2MtmLQVc7B0qbSUhDfoRLzAOYKsWlsXP
	sMFl5cjtHZAzDoOEX40I1jXPrZuy7Pxx7l4VBNyzS+cXu1Bym1YDScS8MdXJMeUIZorN
	7ueLX4nsJE49YZUwR+JdVta9bV2A3LoGcrKlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=9xvCACVfnkHzaDQSIEUQ6IwRDScipM/WhF3XoYrX9h4=;
	b=OeoBftSd/hYBif9f1aLjfPR1mfCTbw7DvKXFv73DHvsuj76A/SF2uBv/UOWeNQ6cBG
	uJVzHnAhygRxdvXubV5GYHIYqqrIoeMPh8EiW+udkoybSbovtZ0srtf8Dk1J9EeLBKqx
	y/rb10WflEjXmXazImUS5gyX3j5yrTlO1nFGXktwAgO+s8jWm5VYqr4yNVWUYrD0a9z1
	QgrfACs4XOqy6WYDcRWjDWgkA2WzZceidFwTtrYsFmKoKdH8LG5XohC317T0uFzDUCYW
	yngPRT+uJHMxfxzhAORr296uMoz/UjmHL+e+d3BtRhnfV1LPLPx2by2VzZC1cv6dDmiq
	4UYg==
X-Gm-Message-State: AOUpUlFYtnHbPEG+0TCPultIQCuD2YjzYBY2yVs/Jc23JeN86/6G+btz
	/BP74lf87VVtvv98PGaswz75CMTmbI4=
X-Google-Smtp-Source: AA+uWPzsVWr9F3AGSSsVHM3QaWbH6QvqKz4UXwec8Q+L0+O2oBGxOUa10jkzFRoADRvlYGlkyatMJw==
X-Received: by 2002:a1c:3b05:: with SMTP id
	i5-v6mr12122400wma.57.1534267930145; 
	Tue, 14 Aug 2018 10:32:10 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t70-v6sm14519462wmt.30.2018.08.14.10.32.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Aug 2018 10:32:09 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2018 18:32:01 +0100
Message-Id: <20180814173201.6723-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180814173201.6723-1-richard.purdie@linuxfoundation.org>
References: <20180814173201.6723-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 6/6] selftest/package: Improve test to cover sparseness and hardlinking from sstate
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
X-List-Received-Date: Tue, 14 Aug 2018 17:32:10 -0000

The sparseness test was sometimes working and sometimes failing depending
on whether sstate was valid. This adds an explict test of sstate
to the test for both hardlinking and sparseness. Tweak the test name to
cover the fact its tests sparseness too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/package.py | 27 ++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selftest/cases/package.py
index 4ff9b08c96a..ee6430a1845 100644
--- a/meta/lib/oeqa/selftest/cases/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -89,17 +89,26 @@ class VersionOrdering(OESelftestTestCase):
 class PackageTests(OESelftestTestCase):
     # Verify that a recipe which sets up hardlink files has those preserved into split packages
     # Also test file sparseness is preserved
-    def test_preserve_hardlinks(self):
-        result = bitbake("selftest-hardlink -c package")
+    def test_preserve_sparse_hardlinks(self):
+        bitbake("selftest-hardlink -c package")
 
         dest = get_bb_var('PKGDEST', 'selftest-hardlink')
         bindir = get_bb_var('bindir', 'selftest-hardlink')
 
-        # Recipe creates 4 hardlinked files, there is a copy in package/ and a copy in packages-split/
-        # so expect 8 in total.
-        self.assertEqual(os.stat(dest + "/selftest-hardlink" + bindir + "/hello").st_nlink, 8)
+        def checkfiles():
+            # Recipe creates 4 hardlinked files, there is a copy in package/ and a copy in packages-split/
+            # so expect 8 in total.
+            self.assertEqual(os.stat(dest + "/selftest-hardlink" + bindir + "/hello").st_nlink, 8)
 
-        # Test a sparse file remains sparse
-        sparsestat = os.stat(dest + "/selftest-hardlink" + bindir + "/sparsetest")
-        self.assertEqual(sparsestat.st_blocks, 0)
-        self.assertEqual(sparsestat.st_size, 1048576)
+            # Test a sparse file remains sparse
+            sparsestat = os.stat(dest + "/selftest-hardlink" + bindir + "/sparsetest")
+            self.assertEqual(sparsestat.st_blocks, 0)
+            self.assertEqual(sparsestat.st_size, 1048576)
+
+        checkfiles()
+
+        # Clean and reinstall so its now definitely from sstate, then retest.
+        bitbake("selftest-hardlink -c clean")
+        bitbake("selftest-hardlink -c package")
+
+        checkfiles()
-- 
2.17.1


