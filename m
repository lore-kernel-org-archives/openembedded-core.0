Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A39C36BC15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2019 05:43:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x1D5hhLX021127
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Feb 2019 21:43:43 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.435.0; Tue, 12 Feb 2019 21:43:30 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Wed, 13 Feb 2019 13:43:28 +0800
Message-ID: <1550036608-438891-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] logrotate.py: restore /etc/logrotate.d/wtmp
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
X-List-Received-Date: Wed, 13 Feb 2019 05:43:47 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

During the test logrotate.LogrotateTest.test_1_logrotate_setup,
there is below logic:
 # mkdir $HOME/logrotate_dir
 # sed -i "s#wtmp {#wtmp {\n    olddir $HOME/logrotate_dir#" /etc/logrotate.d/wtmp

After all logrotate.LogrotateTest finished, only cleanup
$HOME/logrotate_dir as below, but don't restore
the config file /etc/logrotate.d/wtmp.
[snip]
def tearDownClass(cls):
    cls.tc.target.run('rm -rf $HOME/logrotate_dir')
[snip]

That's to say, there is one additional line added
to /etc/logrotate.d/wtmp and will make the logrotate
service start failed when run systemd.SystemdBasicTests.test_systemd_failed

Take an example as below when run test as root:
 # cat /etc/logrotate.d/wtmp
 # no packages own wtmp -- we'll rotate it here
 /var/log/wtmp {
    olddir /root/logrotate_dir
    missingok
    monthly
    create 0664 root utmp
    minsize 1M
    rotate 1
 }

 # ls /root/logrotate_dir
 ls: cannot access '/root/logrotate_dir': No such file or directory

 # systemctl start logrotate
 Job for logrotate.service failed because the control process exited with error code.
 See "systemctl status logrotate.service" and "journalctl -xe" for details.

 # systemctl status logrotate
  logrotate.service - Rotate log files
   Loaded: loaded (/lib/systemd/system/logrotate.service; static; vendor preset>
   Active: failed (Result: exit-code) since Wed 2019-02-13 03:35:19 UTC; 7s ago
     Docs: man:logrotate(8)
           man:logrotate.conf(5)
   Process: 540 ExecStart=/usr/sbin/logrotate /etc/logrotate.conf (code=exited, status=1/FAILURE)
   Main PID: 540 (code=exited, status=1/FAILURE)

  Feb 13 03:35:18 qemumips systemd[1]: Starting Rotate log files...
  Feb 13 03:35:19 qemumips logrotate[540]: error: wtmp:9 error verifying olddir path /root/logrotate_dir: No such file or directory
  Feb 13 03:35:19 qemumips logrotate[540]: error: found error in file wtmp, skipping
  Feb 13 03:35:19 qemumips systemd[1]: logrotate.service: Main process exited, code=exited, status=1/FAILURE
  Feb 13 03:35:19 qemumips systemd[1]: logrotate.service: Failed with result 'exit-code'.
  Feb 13 03:35:19 qemumips systemd[1]: Failed to start Rotate log files.

Add the logic to restore /etc/logrotate.d/wtmp to
make the cleanup complete to fix the above issue.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/lib/oeqa/runtime/cases/logrotate.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/logrotate.py b/meta/lib/oeqa/runtime/cases/logrotate.py
index db6e695..d266644 100644
--- a/meta/lib/oeqa/runtime/cases/logrotate.py
+++ b/meta/lib/oeqa/runtime/cases/logrotate.py
@@ -9,8 +9,12 @@ from oeqa.runtime.decorator.package import OEHasPackage
 class LogrotateTest(OERuntimeTestCase):
 
     @classmethod
+    def setUpClass(cls):
+        cls.tc.target.run('cp /etc/logrotate.d/wtmp $HOME/wtmp.oeqabak')
+
+    @classmethod
     def tearDownClass(cls):
-        cls.tc.target.run('rm -rf $HOME/logrotate_dir')
+        cls.tc.target.run('mv -f $HOME/wtmp.oeqabak /etc/logrotate.d/wtmp && rm -rf $HOME/logrotate_dir')
 
     @OETestID(1544)
     @OETestDepends(['ssh.SSHTest.test_ssh'])
-- 
2.7.4


