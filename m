Received: from david.siemens.de (david.siemens.de [192.35.17.14])
 by mx.groups.io with SMTP id smtpd.web12.2191.1592847211824440281
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 10:33:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.14, mailfrom: andrej.valek@siemens.com)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 05MHXUSw023744
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 19:33:30 +0200
Received: from dev.vm6.ccp.siemens.com ([167.87.72.36])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id 05MHXT1f032562;
	Mon, 22 Jun 2020 19:33:29 +0200
Received: from mail2.siemens.de (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 391D098021E;
	Mon, 22 Jun 2020 19:33:29 +0200 (CEST)
From: "Andrej Valek" <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrej Valek <andrej.valek@siemens.com>,
        Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 1/1] oeqa/runtime/cases/ptest: Make output content path absolute
Date: Mon, 22 Jun 2020 19:33:07 +0200
Message-Id: <20200622173307.29538-2-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200622173307.29538-1-andrej.valek@siemens.com>
References: <20200622173307.29538-1-andrej.valek@siemens.com>

The output content is created in current directory, because json content
has no defined absolute path to WORKDIR as in bitbake.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/lib/oeqa/runtime/cases/ptest.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index 1b1474adcf..919901d465 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -42,6 +42,10 @@ class PtestRunnerTest(OERuntimeTestCase):
         # testdata.json is generated.
         if not test_log_dir:
             test_log_dir = os.path.join(self.td.get('WORKDIR', ''), 'testimage')
+        # Make the test output path absolute, otherwise the output content will be
+        # is created relative to current directory
+        if not os.path.isabs(test_log_dir):
+            test_log_dir = os.path.join(self.td.get('TOPDIR', ''), test_log_dir)
         # Don't use self.td.get('DATETIME'), it's from testdata.json, not
         # up-to-date, and may cause "File exists" when re-reun.
         timestamp = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
-- 
2.11.0

