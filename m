Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E52DF62132
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 08:45:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2O8j6WR007073
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 01:45:06 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 24 Mar 2017 01:45:05 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Mar 2017 01:45:00 -0700
Message-ID: <dda2150fb3a0d37c50155fe5aa5729777c22dfc2.1490343063.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1490343063.git.liezhi.yang@windriver.com>
References: <cover.1490343063.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] qemurunner.py: fix handling of runqemuparams
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
X-List-Received-Date: Fri, 24 Mar 2017 08:45:06 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The launch() doesn't need runqemuparams, we need handle it in start().

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 76c570e..abdbd14 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -118,7 +118,7 @@ class QemuRunner:
             os.environ["DEPLOY_DIR_IMAGE"] = self.deploy_dir_image
 
         if not launch_cmd:
-            launch_cmd = 'runqemu snapshot'
+            launch_cmd = 'runqemu snapshot %s' % runqemuparams
             if self.use_kvm:
                 logger.info('Using kvm for runqemu')
                 launch_cmd += ' kvm'
@@ -128,9 +128,9 @@ class QemuRunner:
                 launch_cmd += ' nographic'
             launch_cmd += ' %s %s' % (self.machine, self.rootfs)
 
-        return self.launch(launch_cmd, qemuparams=qemuparams, get_ip=get_ip, extra_bootparams=extra_bootparams, runqemuparams=runqemuparams)
+        return self.launch(launch_cmd, qemuparams=qemuparams, get_ip=get_ip, extra_bootparams=extra_bootparams)
 
-    def launch(self, launch_cmd, get_ip = True, qemuparams = None, extra_bootparams = None, runqemuparams=''):
+    def launch(self, launch_cmd, get_ip = True, qemuparams = None, extra_bootparams = None):
         try:
             threadsock, threadport = self.create_socket()
             self.server_socket, self.serverport = self.create_socket()
-- 
2.9.0


