Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 85A566C23C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 07:58:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x037wiwe011853
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Jan 2019 23:58:44 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Wed, 2 Jan 2019 23:58:44 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 Jan 2019 16:16:32 +0800
Message-ID: <ca03a4591117aea193d7cbb9cee11ef7cd92a503.1546503176.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1546503176.git.liezhi.yang@windriver.com>
References: <cover.1546503176.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] oeqa/utils/qemurunner: set timeout to 60s for run_serial
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
X-List-Received-Date: Thu, 03 Jan 2019 07:58:45 -0000
Content-Type: text/plain

The 5s timeout for non-kvm is too short, especially when the load is high,
which leads to unexpected errors, so set timeout to 60s by default.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/targetcontrol.py        | 2 +-
 meta/lib/oeqa/utils/qemurunner.py     | 2 +-
 meta/lib/oeqa/utils/qemutinyrunner.py | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 59a9c35..02ea1c0 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -196,7 +196,7 @@ class QemuTarget(BaseTarget):
         else:
             raise bb.build.FuncFailed("%s - FAILED to re-start qemu - check the task log and the boot log" % self.pn)
 
-    def run_serial(self, command, timeout=5):
+    def run_serial(self, command, timeout=60):
         return self.runner.run_serial(command, timeout=timeout)
 
 
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index cce95e1..7ef506b 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -430,7 +430,7 @@ class QemuRunner:
                 return True
         return False
 
-    def run_serial(self, command, raw=False, timeout=5):
+    def run_serial(self, command, raw=False, timeout=60):
         # We assume target system have echo to get command status
         if not raw:
             command = "%s; echo $?\n" % command
diff --git a/meta/lib/oeqa/utils/qemutinyrunner.py b/meta/lib/oeqa/utils/qemutinyrunner.py
index 63b5d16..5aa99d0 100644
--- a/meta/lib/oeqa/utils/qemutinyrunner.py
+++ b/meta/lib/oeqa/utils/qemutinyrunner.py
@@ -108,7 +108,7 @@ class QemuTinyRunner(QemuRunner):
 
         return self.is_alive()
 
-    def run_serial(self, command, timeout=5):
+    def run_serial(self, command, timeout=60):
         self.server_socket.sendall(command+'\n')
         data = ''
         status = 0
-- 
2.7.4


