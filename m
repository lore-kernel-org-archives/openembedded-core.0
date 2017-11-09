Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 431A56078E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 11:55:55 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vA9BtqgM007424
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 9 Nov 2017 11:55:53 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1eClR2-00030W-Fm; Thu, 09 Nov 2017 11:55:52 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Nov 2017 11:55:45 +0000
Message-Id: <1510228551-11516-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 1/7] qemurunner: Ensure logging handler is removed
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
X-List-Received-Date: Thu, 09 Nov 2017 11:55:55 -0000

If we don't remove the handler we end up with duplicate log messages
which is undesireable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 72f05d5..aa2600b 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -58,7 +58,8 @@ class QemuRunner:
         self.host_dumper = HostDumper(dump_host_cmds, dump_dir)
 
         self.logger = logging.getLogger("BitBake.QemuRunner")
-        self.logger.addHandler(logging.StreamHandler(sys.stdout))
+        self.handler = logging.StreamHandler(sys.stdout)
+        self.logger.addHandler(self.handler)
 
     def create_socket(self):
         try:
@@ -370,6 +371,7 @@ class QemuRunner:
         self.ip = None
         if os.path.exists(self.qemu_pidfile):
             os.remove(self.qemu_pidfile)
+        self.logger.removeHandler(self.handler)
 
     def stop_qemu_system(self):
         if self.qemupid:
-- 
2.7.4


