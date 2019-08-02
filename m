Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2F4B07E950
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 02:44:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x722iBKX020014
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Aug 2019 19:44:21 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Thu, 1 Aug 2019 19:44:00 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Aug 2019 10:43:59 +0800
Message-ID: <1564713839-408050-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] runqemu: fix get portlock fail for multi users
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
X-List-Received-Date: Fri, 02 Aug 2019 02:44:30 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

when runqemu with slirp option on same host with different
users, it will report PermissionError: [Errno 13] Permission
denied: '/tmp/qemu-port-locks/2222.lock'
and during handle this exception, another exception happened since
key not exist. Fix by check if key exist first

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 scripts/runqemu | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 6fae3d8..9d6a2e8 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -235,7 +235,7 @@ class BaseConfig(object):
         else:
             return False
 
-    def acquire_portlock(self, lockfile, error=True):
+    def acquire_portlock(self, lockfile):
         logger.debug("Acquiring lockfile %s..." % lockfile)
         try:
             portlock_descriptor = open(lockfile, 'w')
@@ -243,11 +243,8 @@ class BaseConfig(object):
             fcntl.flock(self.portlocks[lockfile], fcntl.LOCK_EX|fcntl.LOCK_NB)
         except Exception as e:
             msg = "Acquiring lockfile %s failed: %s" % (lockfile, e)
-            if error:
-                logger.error(msg)
-            else:
-                logger.info(msg)
-            if self.portlocks[lockfile]:
+            logger.info(msg)
+            if lockfile in self.portlocks.keys() and self.portlocks[lockfile]:
                 self.portlocks[lockfile].close()
                 del self.portlocks[lockfile]
             return False
-- 
2.7.4


