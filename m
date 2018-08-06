Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2487778998
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 03:13:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w763DJKU002571
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 5 Aug 2018 20:13:19 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Sun, 5 Aug 2018 20:13:18 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Aug 2018 11:17:25 +0800
Message-ID: <287197fe9ca8831c865c976f43f879e34c25ad48.1533524621.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1533524621.git.Qi.Chen@windriver.com>
References: <cover.1533524621.git.Qi.Chen@windriver.com>
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
X-List-Received-Date: Mon, 06 Aug 2018 03:13:18 -0000
Content-Type: text/plain

When using syslog-ng as the syslog provider, oe_syslog test case fails
because it cannot find the syslog daemon. This is because it greps for
'syslogd' but syslog-ng's daemon is 'syslog-ng'. So fix it to check both
'syslogd' and 'syslog-ng'.

Also, when the test case fails, what I get is:
| AssertionError: 1 != 0 : No syslogd process; ps output:
<empty here>

This does not help user. The output is actually from the 'PS | GREP' command.
And when the 'PS | GREP' command fails, the output is always empty. So also fix
this problem. After the change, it looks like:
| AssertionError: False is not true : No syslog daemon process; ps output:
|   PID USER       VSZ STAT COMMAND
|     1 root     16476 S    {systemd} /sbin/init
|     2 root         0 SW   [kthreadd]
|     3 root         0 IW   [kworker/0:0]
...

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/runtime/cases/oe_syslog.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/oe_syslog.py b/meta/lib/oeqa/runtime/cases/oe_syslog.py
index 935f10f..a92a1f2 100644
--- a/meta/lib/oeqa/runtime/cases/oe_syslog.py
+++ b/meta/lib/oeqa/runtime/cases/oe_syslog.py
@@ -10,10 +10,12 @@ class SyslogTest(OERuntimeTestCase):
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(["busybox-syslog", "sysklogd", "rsyslog", "syslog-ng"])
     def test_syslog_running(self):
-        cmd = '%s  | grep -i [s]yslogd' % self.tc.target_cmds['ps']
-        status, output = self.target.run(cmd)
-        msg = "No syslogd process; ps output: %s" % output
+        status, output = self.target.run(self.tc.target_cmds['ps'])
+        msg = "Failed to execute %s" % self.tc.target_cmds['ps']
         self.assertEqual(status, 0, msg=msg)
+        msg = "No syslog daemon process; %s output:\n%s" % (self.tc.target_cmds['ps'], output)
+        hasdaemon = "syslogd" in output or "syslog-ng" in output
+        self.assertTrue(hasdaemon, msg=msg)
 
 class SyslogTestConfig(OERuntimeTestCase):
 
-- 
1.9.1


