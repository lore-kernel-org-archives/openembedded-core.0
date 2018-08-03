Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3656574598
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 08:23:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w738N6sE006034
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Aug 2018 01:23:06 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Fri, 3 Aug 2018 01:23:06 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Aug 2018 16:27:05 +0800
Message-ID: <23da175826ae4960e8690951576b356dd16fe338.1533284788.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1533284788.git.Qi.Chen@windriver.com>
References: <cover.1533284788.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] oe_syslog.py: fix for syslog-ng
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
X-List-Received-Date: Fri, 03 Aug 2018 08:23:06 -0000
Content-Type: text/plain

When using syslog-ng as the syslog provider, oe_syslog test case fails
because it cannot find the syslog daemon. This is because it greps for
'syslogd' but syslog-ng's daemon is 'syslog-ng'. So fix the grep command
to also consider syslog-ng.

Also, when the test case fails, what I get is:
| AssertionError: 1 != 0 : No syslogd process; ps output:
<empty here>

This does not help user. The output is actually from the 'PS | GREP' command.
And when the 'PS | GREP' command fails, the output is always empty. So also
fix it to actually output the ps information. After the change, it looks like:
| AssertionError: 1 != 0 : No syslogd process; ps -ef output:
| UID        PID  PPID  C STIME TTY          TIME CMD
| root         1     0 28 07:35 ?        00:00:19 /sbin/init
| root         2     0  0 07:35 ?        00:00:00 [kthreadd]
| root         3     2  0 07:35 ?        00:00:00 [kworker/0:0]
...

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/runtime/cases/oe_syslog.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/oe_syslog.py b/meta/lib/oeqa/runtime/cases/oe_syslog.py
index 935f10f..23abae3 100644
--- a/meta/lib/oeqa/runtime/cases/oe_syslog.py
+++ b/meta/lib/oeqa/runtime/cases/oe_syslog.py
@@ -10,9 +10,10 @@ class SyslogTest(OERuntimeTestCase):
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(["busybox-syslog", "sysklogd", "rsyslog", "syslog-ng"])
     def test_syslog_running(self):
-        cmd = '%s  | grep -i [s]yslogd' % self.tc.target_cmds['ps']
-        status, output = self.target.run(cmd)
-        msg = "No syslogd process; ps output: %s" % output
+        cmd = '%s  | grep -iE "[s]yslogd|[s]yslog-ng"' % self.tc.target_cmds['ps']
+        status, _ = self.target.run(cmd)
+        _, output = self.target.run(self.tc.target_cmds['ps'])
+        msg = "No syslogd process; %s output:\n%s" % (self.tc.target_cmds['ps'], output)
         self.assertEqual(status, 0, msg=msg)
 
 class SyslogTestConfig(OERuntimeTestCase):
-- 
1.9.1


