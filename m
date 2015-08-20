Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 104CA76A99
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 11:57:00 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 20 Aug 2015 04:57:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,714,1432623600"; d="scan'208";a="772376009"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 20 Aug 2015 04:57:00 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id B0AA36A4005
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 04:56:11 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 14:56:28 +0300
Message-Id: <b2bba443ce63c3f7d2e70342df21f2883099119e.1440071413.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440071413.git.ed.bartosh@linux.intel.com>
References: <cover.1440071413.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440071413.git.ed.bartosh@linux.intel.com>
References: <cover.1440071413.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 15/17] image.py: set bitbake variable ROOTFS_SIZE
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
X-List-Received-Date: Thu, 20 Aug 2015 11:57:00 -0000

This variable is going to be used by wic to set partition
size. Setting it in image.py makes it possible for wic to
use it without calculating it again.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oe/image.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
index a7fdefa..7f82748 100644
--- a/meta/lib/oe/image.py
+++ b/meta/lib/oe/image.py
@@ -262,14 +262,16 @@ class Image(ImageDepGraph):
     def _write_script(self, type, cmds):
         tempdir = self.d.getVar('T', True)
         script_name = os.path.join(tempdir, "create_image." + type)
+        rootfs_size = self._get_rootfs_size()
 
         self.d.setVar('img_creation_func', '\n'.join(cmds))
         self.d.setVarFlag('img_creation_func', 'func', 1)
         self.d.setVarFlag('img_creation_func', 'fakeroot', 1)
+        self.d.setVar('ROOTFS_SIZE', str(rootfs_size))
 
         with open(script_name, "w+") as script:
             script.write("%s" % bb.build.shell_trap_code())
-            script.write("export ROOTFS_SIZE=%d\n" % self._get_rootfs_size())
+            script.write("export ROOTFS_SIZE=%d\n" % rootfs_size)
             bb.data.emit_func('img_creation_func', script, self.d)
             script.write("img_creation_func\n")
 
-- 
2.1.4


