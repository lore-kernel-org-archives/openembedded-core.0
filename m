Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 026947D200
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 07:19:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6C7IuNQ027224
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 00:19:07 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Fri, 12 Jul 2019 00:18:46 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Jul 2019 15:31:13 +0800
Message-ID: <91a0ced348fd2a0f619494079545d570d4d68e61.1562916644.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1562916644.git.Qi.Chen@windriver.com>
References: <cover.1562916644.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] qemurunner.py: fix race condition at qemu startup
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
X-List-Received-Date: Fri, 12 Jul 2019 07:19:16 -0000
Content-Type: text/plain

When handling pid file, qemu would first create the file, stat it,
lock it and then write actually contents to it.

So it's possbile that when reading the pid file, the content is empty.

[YOCTO #13390]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index c16227f..68684ae 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -425,13 +425,20 @@ class QemuRunner:
         if not self.runqemu or self.runqemu.poll() is not None:
             return False
         if os.path.isfile(self.qemu_pidfile):
-            f = open(self.qemu_pidfile, 'r')
-            qemu_pid = f.read()
-            f.close()
-            qemupid = int(qemu_pid)
-            if os.path.exists("/proc/" + str(qemupid)):
-                self.qemupid = qemupid
-                return True
+            # when handling pidfile, qemu creates the file, stat it, lock it and then write to it
+            # so it's possible that the file has been created but the content is empty
+            pidfile_timeout = time.time() + 3
+            while time.time() < pidfile_timeout:
+                with open(self.qemu_pidfile, 'r') as f:
+                    qemu_pid = f.read().strip()
+                # file created but not yet written contents
+                if not qemu_pid:
+                    time.sleep(0.5)
+                    continue
+                else:
+                    if os.path.exists("/proc/" + qemu_pid):
+                        self.qemupid = int(qemu_pid)
+                        return True
         return False
 
     def run_serial(self, command, raw=False, timeout=60):
-- 
1.9.1


