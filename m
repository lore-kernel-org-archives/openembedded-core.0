Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78125C98310
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 19:58:44 +0000 (UTC)
Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3029.1790190268925546766
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 12:04:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=NVmikPiI;
 spf=pass (domain: baylibre.com, ip: 74.125.227.43, mailfrom: tgamblin@baylibre.com)
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-7856441f7d8so726240137.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 12:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790190268; x=1790795068; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kvegQdOSotauanZ6ZVKTFC0hhoNKqEJIQOlMCUPeK1Q=;
        b=NVmikPiI2n0QjV2dczgahQ5J94O2nbfZOTAW5/E6g7okaMDQVMJVECuyC1TiNX7cuC
         kAHPRqjblpG3qm75vL7O8qSrV5VH6mYvT46euSv4uBr3MXTvkQ96rAlQrz1GMmelkzgx
         yFjLn6FBHyigiYfKvI68c9dS3CGu5pVUPI5CBAA58cWCYeODtXvEN57YW2/sPlvGW7yt
         NGP+tU9tRBjzDDE2Zq8xOcbN4fu50vmy4knvMxS2mr6/ZU9+nwjNEn9cJ/+NUaIh7Vw3
         sWXZgKHchcgY6qIYKhnRT3+iIdfZ1KgwB093v/KDQN8Ix0s3l1g+99oOdBM5deF3kOdH
         mZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790190268; x=1790795068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kvegQdOSotauanZ6ZVKTFC0hhoNKqEJIQOlMCUPeK1Q=;
        b=IVfHRFDli2nMQufYNsOvHo5d+EwaxpwNUxqI6/YDuOMhcX5Q3DzSAp72PnjihoNoIZ
         fGvUI5CKXs55LkveMLIFASB7rnwFCSe2d+1j6nMZ/diCpF/tonUZ2kR0O73Ap1z+zlWn
         CcGKT8Dk95NYOuRTyEBB5yO/e8MMvYbHIKB+kNCNWNm/HhB0nf+haif0SzbDf2Z3YR9i
         Wn7axUfN0FJ9uwChzvgLCR7wXCOY/5UXBqXAhD/yVnvO7RUJR03FuY5V2NEtVEqrpjSz
         ddeFjvh3Pw9xYsV3ptJbt7haekdse9kLXB3hFWLTYHGza0nP4bWo48lJHK71wzpT/+I5
         M0jQ==
X-Gm-Message-State: AFuF++ksZie+gxBclyYx7kxoYrqVsaSNTgCGYCxjlZB2gPMuLK3ywXfZ
	taqUHDDxhga7yns8Hy0jFbf8V4qMhmhPhY+u09WGtvQO4d9LvP+4FqE/XG12WL6w6TjNJYOnJw6
	BHm1g
X-Gm-Gg: AYBFou3ey+j/Hc+a+uX1R2eX6AW/qJBNyf60+t99wn1skGC5K7nGb/0/sF3wyk6jh2i
	kxQuEDyx9y2DDfrkLybyeiqeTdz1A1SdY0IzzDXGwcUDVk3RxdpjycNCcivOEoTFO4WlP4b8zxL
	QhY/AhC8iTiFfDz2ZKREHG/zOEStRH0/gVnNCdOTM2WTuCwsEwgaFLHjQRUl2em4BOfNu7FqMw4
	/FPzOYWQPe58/pPnnwHVt9dRKkS2lTNEGAkeOEzmKzWYkkYNaNh5kqdc0m96qeDPBpLfF8Auakr
	YZI+qmE0+hxJBKfRBEDHcmW2mTW85KhwOQxXBBhrkeSmlSoOPAyXtr97muh+Ee7MvEu3xWr3xJu
	oxPdUgrxm6DMHLHVDOV94Q2VNhjQnb3mUJRn19KXWLcKNl0pF+ubPPn7p8wdTsIj6y2M+G4MLrL
	4I4eLeEqi+QlPt8NeYt9P6iYj8ZHTcz7B+SVfy3dmsIIEV3SujFnq29Dw72nmTjpYXCG5BMUPH7
	AK3Z2eWPMSqgR43CX7KCeam8eJR0V+HiKADKQQo3eeF
X-Received: by 2002:a05:6102:3fa8:b0:7a1:f7e2:aae7 with SMTP id ada2fe7eead31-7af1edef629mr119869137.25.1790190267630;
        Wed, 23 Sep 2026 12:04:27 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf566d033sm4537581137.5.2026.09.23.12.04.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:04:26 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 02/13] selftest: resulttooltests.py: add basic durations test
Date: Wed, 23 Sep 2026 15:04:08 -0400
Message-ID: <20260923190419.353493-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923190419.353493-1-tgamblin@baylibre.com>
References: <20260923190419.353493-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 19:58:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246542

Add imports for the resulttools durations.py module, then add a basic
test for checking that testcase names and durations are properly
extracted.

AI-Generated: Uses Claude Sonnet 5

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../oeqa/selftest/cases/resulttooltests.py    | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/resulttooltests.py b/meta/lib/oeqa/selftest/cases/resulttooltests.py
index b03a880b2b..a380d08156 100644
--- a/meta/lib/oeqa/selftest/cases/resulttooltests.py
+++ b/meta/lib/oeqa/selftest/cases/resulttooltests.py
@@ -11,6 +11,7 @@ lib_path = basepath + '/scripts/lib'
 sys.path = sys.path + [lib_path]
 from resulttool.report import ResultsTextReport
 from resulttool import regression as regression
+from resulttool import durations as durations
 from resulttool import resultutils as resultutils
 from oeqa.selftest.case import OESelftestTestCase
 
@@ -18,6 +19,8 @@ from resulttool.junit import junit_tree, PtestSummary
 import xml.etree.ElementTree as ET
 import logging
 import json
+import tempfile
+from types import SimpleNamespace
 
 
 class ResultToolTests(OESelftestTestCase):
@@ -669,3 +672,28 @@ class ResultToolTests(OESelftestTestCase):
         # Package testsuite should not exist (no ptestresult.sections)
         package_suite = testsuites_node.find(".//testsuite[@name='Package Tests']")
         self.assertIsNone(package_suite)
+
+    def test_durations_get_durations_extracts_testcase_and_suite_durations(self):
+        results_data = {'result1': {'configuration': {"TEST_TYPE": "runtime",
+                                                       "TESTSERIES": "series1",
+                                                       "IMAGE_BASENAME": "image",
+                                                       "IMAGE_PKGTYPE": "ipk",
+                                                       "DISTRO": "mydistro",
+                                                       "MACHINE": "qemux86"},
+                                    'result': {
+                                        'test.Foo.test_bar': {'status': 'PASSED', 'duration': 12.345},
+                                        'test.Foo.test_no_duration': {'status': 'PASSED'},
+                                        'ptestresult.sections': {
+                                            'bash': {'duration': '5', 'log': 'xxx'},
+                                            # a timed-out suite has " T" appended to its duration
+                                            'timedout': {'duration': '30 T'},
+                                        },
+                                    }}}
+        results = {}
+        resultutils.append_resultsdata(results, results_data)
+        flattened = durations.get_durations(results)
+        path = 'runtime/mydistro/qemux86/image'
+        self.assertEqual(flattened[path]['test.Foo.test_bar'], 12.345)
+        self.assertNotIn('test.Foo.test_no_duration', flattened[path])
+        self.assertEqual(flattened[path]['ptestresult.sections.bash'], 5.0)
+        self.assertEqual(flattened[path]['ptestresult.sections.timedout'], 30.0)
-- 
2.55.0


