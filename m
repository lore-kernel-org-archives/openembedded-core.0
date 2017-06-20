Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8AF1878094
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 23:11:42 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jun 2017 16:11:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,366,1493708400"; d="scan'208";a="1184998607"
Received: from unknown (HELO localhost.localdomain) ([10.252.131.195])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jun 2017 16:11:33 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Jun 2017 16:10:26 -0700
Message-Id: <20170620231029.90760-2-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <20170620231029.90760-1-stephano.cetola@linux.intel.com>
References: <20170620231029.90760-1-stephano.cetola@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH v4 1/4] sshcontrol.py: in copy_to() always use scp
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
X-List-Received-Date: Tue, 20 Jun 2017 23:11:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Erik Botö <erik.boto@pelagicore.com>

The current implementation is broken when the localpath is a link.
Then only a symlink would be created on the target, instead of copying
the actual file.

[YOCTO #11524]

Signed-off-by: Erik Botö <erik.boto@pelagicore.com>
---
 meta/lib/oeqa/utils/sshcontrol.py | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
index 05d6502550..d292893c08 100644
--- a/meta/lib/oeqa/utils/sshcontrol.py
+++ b/meta/lib/oeqa/utils/sshcontrol.py
@@ -150,12 +150,9 @@ class SSHControl(object):
 
     def copy_to(self, localpath, remotepath):
         if os.path.islink(localpath):
-            link = os.readlink(localpath)
-            dst_dir, dst_base = os.path.split(remotepath)
-            return self.run("cd %s; ln -s %s %s" % (dst_dir, link, dst_base))
-        else:
-            command = self.scp + [localpath, '%s@%s:%s' % (self.user, self.ip, remotepath)]
-            return self._internal_run(command, ignore_status=False)
+            localpath = os.path.dirname(localpath) + "/" + os.readlink(localpath)
+        command = self.scp + [localpath, '%s@%s:%s' % (self.user, self.ip, remotepath)]
+        return self._internal_run(command, ignore_status=False)
 
     def copy_from(self, remotepath, localpath):
         command = self.scp + ['%s@%s:%s' % (self.user, self.ip, remotepath), localpath]
-- 
2.13.1


