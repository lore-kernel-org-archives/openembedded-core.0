Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5AA2D78D9B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 07:09:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6V79oFH024280
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 00:09:50 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Tue, 31 Jul 2018 00:09:49 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 31 Jul 2018 15:13:43 +0800
Message-ID: <83ced70e88d13af3c01051ffb85fd2c16f7433e5.1533021154.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1533021154.git.Qi.Chen@windriver.com>
References: <cover.1533021154.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] systemd.py: increase default bus timeout
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
X-List-Received-Date: Tue, 31 Jul 2018 07:09:49 -0000
Content-Type: text/plain

Use SYSTEMD_BUS_TIMEOUT to set default timeout to 240s to avoid
timeout problem on slow qemu machines.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/runtime/cases/systemd.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/runtime/cases/systemd.py
index db69384..460b8fc 100644
--- a/meta/lib/oeqa/runtime/cases/systemd.py
+++ b/meta/lib/oeqa/runtime/cases/systemd.py
@@ -11,11 +11,11 @@ from oeqa.core.decorator.data import skipIfNotFeature
 class SystemdTest(OERuntimeTestCase):
 
     def systemctl(self, action='', target='', expected=0, verbose=False):
-        command = 'systemctl %s %s' % (action, target)
+        command = 'SYSTEMD_BUS_TIMEOUT=240s systemctl %s %s' % (action, target)
         status, output = self.target.run(command)
         message = '\n'.join([command, output])
         if status != expected and verbose:
-            cmd = 'systemctl status --full %s' % target
+            cmd = 'SYSTEMD_BUS_TIMEOUT=240s systemctl status --full %s' % target
             message += self.target.run(cmd)[1]
         self.assertEqual(status, expected, message)
         return output
@@ -63,7 +63,7 @@ class SystemdBasicTests(SystemdTest):
         """
         endtime = time.time() + (60 * 2)
         while True:
-            status, output = self.target.run('systemctl --state=activating')
+            status, output = self.target.run('SYSTEMD_BUS_TIMEOUT=240s systemctl --state=activating')
             if "0 loaded units listed" in output:
                 return (True, '')
             if time.time() >= endtime:
-- 
1.9.1


