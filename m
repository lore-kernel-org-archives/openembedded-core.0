Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.48460.1612244058134667125
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 21:34:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: gNzlvw2z/AIjW87mKOJrRx8G7fWPE7Kqc8DZJA99X5KTiSKWgvLDD2qyEES2+4bxfq0xESDZQf
 ckWe+BBO0KCw==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="180876881"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="180876881"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:20 -0800
IronPort-SDR: 59jlPmQHjcaIHh2cQBgBVLkvvKTawyF+DkIyrHAPGPsbnc3cTDznQxelw5S7iK885TVh0MmTKa
 99FhqWItkybg==
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="370360894"
Received: from ajayap1x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.184.137])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:20 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 06/25] oeqa/selftest/cases/tinfoil.py: increase timeout 10->60s test_wait_event
Date: Tue,  2 Feb 2021 13:33:49 +0800
Message-Id: <c925b83cbd31345f788515ca8b642b14e5e11898.1612243805.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612243805.git.anuj.mittal@intel.com>
References: <cover.1612243805.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yi Fan Yu <yifan.yu@windriver.com>

The test would timeout on autobuilders. This patch increases the
timeout to 60s

The test will now also exit as soon as we receive the 2 expected events
Expected runtime is around 1s if successful

Bug 14158

(From OE-Core rev: be02aa9283f805de718badd5ea12c4968da8774f)

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1d803b70e599521ad0c743f49007e6fc5c055d1c)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/selftest/cases/tinfoil.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/tinfoil.py b/meta/lib/oeqa/selftest/cases/tinfoil.py
index 206168ed00..a51c6048d3 100644
--- a/meta/lib/oeqa/selftest/cases/tinfoil.py
+++ b/meta/lib/oeqa/selftest/cases/tinfoil.py
@@ -100,9 +100,11 @@ class TinfoilTests(OESelftestTestCase):
             eventreceived = False
             commandcomplete = False
             start = time.time()
-            # Wait for 10s in total so we'd detect spurious heartbeat events for example
+            # Wait for maximum 60s in total so we'd detect spurious heartbeat events for example
             # The test is IO load sensitive too
-            while time.time() - start < 10:
+            while (not (eventreceived == True and commandcomplete == True) 
+                    and (time.time() - start < 60)):
+                # if we received both events (on let's say a good day), we are done  
                 event = tinfoil.wait_event(1)
                 if event:
                     if isinstance(event, bb.command.CommandCompleted):
-- 
2.29.2

