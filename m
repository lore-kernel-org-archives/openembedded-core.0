Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 550AF749F3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 07:09:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6V79kQY024273
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 00:09:46 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Tue, 31 Jul 2018 00:09:45 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 31 Jul 2018 15:13:40 +0800
Message-ID: <f837e687a80b28aa9b9f770b68bce2e74623cf58.1533021154.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1533021154.git.Qi.Chen@windriver.com>
References: <cover.1533021154.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] oe_syslog.py: fix settings in OEHasPackage decorator
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
X-List-Received-Date: Tue, 31 Jul 2018 07:09:45 -0000
Content-Type: text/plain

1. For test_syslog_running, we should not restrict it to run for
   only busybox-syslog and sysklogd. So extend it to all syslog
   providers in oe-core and meta-openembedded.

2. For test_syslog_startup_config, fix to make it depend on the
   existence of busybox-syslog. The previous condition "!sysklogd
   && busybox" is incorrect, because busybox may be compiled without
   syslog support, and sysklogd and busybox-syslog conflict with
   each other.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/runtime/cases/oe_syslog.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/oe_syslog.py b/meta/lib/oeqa/runtime/cases/oe_syslog.py
index 005b697..935f10f 100644
--- a/meta/lib/oeqa/runtime/cases/oe_syslog.py
+++ b/meta/lib/oeqa/runtime/cases/oe_syslog.py
@@ -8,7 +8,7 @@ class SyslogTest(OERuntimeTestCase):
 
     @OETestID(201)
     @OETestDepends(['ssh.SSHTest.test_ssh'])
-    @OEHasPackage(["busybox-syslog", "sysklogd"])
+    @OEHasPackage(["busybox-syslog", "sysklogd", "rsyslog", "syslog-ng"])
     def test_syslog_running(self):
         cmd = '%s  | grep -i [s]yslogd' % self.tc.target_cmds['ps']
         status, output = self.target.run(cmd)
@@ -45,7 +45,7 @@ class SyslogTestConfig(OERuntimeTestCase):
 
     @OETestID(202)
     @OETestDepends(['oe_syslog.SyslogTestConfig.test_syslog_logger'])
-    @OEHasPackage(["!sysklogd", "busybox"])
+    @OEHasPackage(["busybox-syslog"])
     @skipIfDataVar('VIRTUAL-RUNTIME_init_manager', 'systemd',
                    'Not appropiate for systemd image')
     def test_syslog_startup_config(self):
-- 
1.9.1


