Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 77892737F4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 09:24:31 +0000 (UTC)
Received: by igblo3 with SMTP id lo3so59878268igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Apr 2015 02:24:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2zsvdw6JxUftM6FuTsVpxDaNzFqm3BhLXOJ27k+DzPk=;
	b=N3vlOaSQFXzhPSiTZtGl9hlENptgq9mO5wUAvJ1FINsJUPP1mdXkXEBkIg/l3mu3V0
	eEmL2bz3Zez/CnMO0ytoq1pSsPBve9u4TZTJEbAX5HLQW78rvmIbk7jpb43oBG9ddHFo
	8pUW8cKikLea3P0XtTSrKtPtau8yQnf9+6MYi4qSVVZgUZ4b4xbQRXExn3ZtBuioPapq
	ukvHZCJPWY3wn23jUaTqiqcWrOx3sjH46cwFGuQhwNqW72ycMPiYLqmXVhcqFk+tfcJ2
	8PQkWQg9a5RssB2T6AgeNIS+C88urbQen2qGroVwEgBJQ+9g8qjuue+DAK2vkTFFFVUB
	6d2w==
X-Gm-Message-State: ALoCoQk59Lhdu0B7E6Lf3lmw6lR7jQnPt+KjxMAnWmWJ7C17l9C6Yt0UhHWmn2/u9roGyZH0885R
X-Received: by 10.50.62.148 with SMTP id y20mr5387570igr.17.1428571472613;
	Thu, 09 Apr 2015 02:24:32 -0700 (PDT)
Received: from syncev.vlan14.01.org (p5DE8CDA6.dip0.t-ipconnect.de.
	[93.232.205.166])
	by mx.google.com with ESMTPSA id s5sm3251036igh.6.2015.04.09.02.24.29
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Apr 2015 02:24:31 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Apr 2015 02:24:22 -0700
Message-Id: <a7349833ae2b74d2bb145dcd0fef8c95db1ae8e7.1428571193.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1428571193.git.patrick.ohly@intel.com>
References: <cover.1428571193.git.patrick.ohly@intel.com>
Subject: [PATCH 1/3] oeqa/oetest.py: use bb logging
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
X-List-Received-Date: Thu, 09 Apr 2015 09:24:31 -0000

Plain print has two drawbacks:
- the output is handled by different processes, causing the message
  about found tests to appear randomly after the result of the initial
  tests
- the output is not part of the bitbake console output

Affects image testing with testimage.bbclass.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/lib/oeqa/oetest.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 0b7e7dc..a3c5c1d 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -11,6 +11,7 @@ import os, re, mmap
 import unittest
 import inspect
 import subprocess
+import bb
 from oeqa.utils.decorators import LogResults
 
 def loadTests(tc, type="runtime"):
@@ -33,8 +34,8 @@ def loadTests(tc, type="runtime"):
 def runTests(tc, type="runtime"):
 
     suite = loadTests(tc, type)
-    print("Test modules  %s" % tc.testslist)
-    print("Found %s tests" % suite.countTestCases())
+    bb.note("Test modules  %s" % tc.testslist)
+    bb.note("Found %s tests" % suite.countTestCases())
     runner = unittest.TextTestRunner(verbosity=2)
     result = runner.run(suite)
 
-- 
1.8.4.5


