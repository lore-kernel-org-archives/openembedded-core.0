Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 60C7A785AF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 16:58:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP; 09 Nov 2017 08:58:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,370,1505804400"; 
   d="scan'208";a="3077232"
Received: from scetola-mac01.jf.intel.com ([10.54.74.124])
	by orsmga001.jf.intel.com with ESMTP; 09 Nov 2017 08:58:47 -0800
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Nov 2017 08:58:29 -0800
Message-Id: <20171109165829.41508-5-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171109165829.41508-1-stephano.cetola@linux.intel.com>
References: <20171109165829.41508-1-stephano.cetola@linux.intel.com>
MIME-Version: 1.0
Subject: [rocko][PATCH 4/4] sshcontrol.py: in copy_to() always use scp
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
X-List-Received-Date: Thu, 09 Nov 2017 16:58:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Erik Botö <erik.boto@pelagicore.com>

The current implementation is broken when the localpath is a link.
Then only a symlink would be created on the target, instead of copying
the actual file.

[YOCTO #11524]

Signed-off-by: Erik Botö <erik.boto@pelagicore.com>
Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
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
2.14.2


