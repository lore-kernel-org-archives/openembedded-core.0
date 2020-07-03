Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.4712.1593755440155433982
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2020 22:50:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 0635oc3i007583
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 2 Jul 2020 22:50:39 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 2 Jul 2020 22:50:37 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <trevor.gamblin@windriver.com>
Subject: [PATCH] logrotate.py: fix testimage occasionally failure
Date: Fri, 3 Jul 2020 13:47:59 +0800
Message-ID: <20200703054759.1165899-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

testcase test_systemd_failed occasionally failed with below error:
Failed to start Rotate log files.
logrotate.service: Failed with result 'exit-code'.
logrotate.service: Main process exited, code=exited, status=1/FAILURE
error: stat of /var/log/logrotate_test failed: No such file or directory
error: logrotate_test:1 lines must begin with a keyword or a filename (possibly in double quotes)

above failure caused since testcase test_logrotate_wtmp
add /etc/logrotate.d/logrotate_test, which need /var/log/logrotate_test,
but there is no such file. so when logrotate.service is triggerd
by logrotate.timer after testcase test_logrotate_wtmp is runned,
the testcase test_systemd_failed will fail.

these 3 lines are useless, so remove them to fix above problem.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/lib/oeqa/runtime/cases/logrotate.py | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/logrotate.py b/meta/lib/oeqa/runtime/cases/logrotate.py
index 3938e91993..a4efcd07c0 100644
--- a/meta/lib/oeqa/runtime/cases/logrotate.py
+++ b/meta/lib/oeqa/runtime/cases/logrotate.py
@@ -37,10 +37,6 @@ class LogrotateTest(OERuntimeTestCase):
         msg = ('Could not write to /tmp/logrotate-test.conf')
         self.assertEqual(status, 0, msg = msg)
         
-        status, output = self.target.run('echo "/var/log/logrotate_test {\\n missingok \\n monthly \\n rotate 1" > /etc/logrotate.d/logrotate_test')
-        msg = ('Could not write to /etc/logrotate.d/logrotate_test')
-        self.assertEqual(status, 0, msg = msg)
-        
         # If logrotate fails to rotate the log, view the verbose output of logrotate to see what prevented it
         _, logrotate_output = self.target.run('logrotate -vf /tmp/logrotate-test.conf')
         status, _ = self.target.run('find $HOME/logrotate_dir -type f | grep wtmp.1')
-- 
2.17.1

