Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.28788.1628804806874146333
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Aug 2021 14:46:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 1D9FF240006;
	Thu, 12 Aug 2021 21:46:44 +0000 (UTC)
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] oeqa/runtime/cases: make date.DateTest.test_date more reliable
Date: Thu, 12 Aug 2021 23:46:38 +0200
Message-Id: <20210812214638.1005248-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test uses the broken out time and can only handle about 59s of delay,
use a UNIX timestamp to allow for up to a 300s delay.

[YOCTO #14463]

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 meta/lib/oeqa/runtime/cases/date.py | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/date.py b/meta/lib/oeqa/runtime/cases/date.py
index e14322911d6b..bd6537400e28 100644
--- a/meta/lib/oeqa/runtime/cases/date.py
+++ b/meta/lib/oeqa/runtime/cases/date.py
@@ -28,14 +28,13 @@ class DateTest(OERuntimeTestCase):
         self.assertEqual(status, 0, msg=msg)
         oldDate = output
 
-        sampleDate = '"2016-08-09 10:00:00"'
-        (status, output) = self.target.run("date -s %s" % sampleDate)
+        sampleTimestamp = 1488800000
+        (status, output) = self.target.run("date -s @%d" % sampleTimestamp)
         self.assertEqual(status, 0, msg='Date set failed, output: %s' % output)
 
-        (status, output) = self.target.run("date -R")
-        p = re.match('Tue, 09 Aug 2016 10:00:.. \+0000', output)
+        (status, output) = self.target.run('date +"%s"')
         msg = 'The date was not set correctly, output: %s' % output
-        self.assertTrue(p, msg=msg)
+        self.assertTrue(int(output) - sampleTimestamp < 300, msg=msg)
 
         (status, output) = self.target.run('date -s "%s"' % oldDate)
         msg = 'Failed to reset date, output: %s' % output
-- 
2.31.1

