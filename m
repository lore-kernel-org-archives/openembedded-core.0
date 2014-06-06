Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 21E386FC05
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 16:02:13 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Jun 2014 08:56:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,990,1392192000"; d="scan'208";a="552916273"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 06 Jun 2014 09:02:08 -0700
Received: from localhost.localdomain (unknown [10.237.112.162])
	by linux.intel.com (Postfix) with ESMTP id B315D6A408D;
	Fri,  6 Jun 2014 09:01:40 -0700 (PDT)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jun 2014 21:06:15 +0300
Message-Id: <1402077980-9548-2-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1402077980-9548-1-git-send-email-corneliux.stoicescu@intel.com>
References: <1402077980-9548-1-git-send-email-corneliux.stoicescu@intel.com>
Subject: [PATCH 1/6] targetcontrol.py: make possible dynamical determination of rootfs type
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
X-List-Received-Date: Fri, 06 Jun 2014 16:02:17 -0000

YB: #6375

Added a new method get_image_fstype() that autodetermines what fstype to use for the rootfs file.
This method uses a new list variable 'supported_image_fstypes' that contains image fstypes supported by the target controller.

This method is also a classmethod which means outside scripts can get the image fstype.

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 meta/lib/oeqa/targetcontrol.py | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index ff1bb89..d4aaf3c 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -44,6 +44,8 @@ class BaseTarget(object):
 
     __metaclass__ = ABCMeta
 
+    supported_image_fstypes = []
+
     def __init__(self, d):
         self.connection = None
         self.ip = None
@@ -70,6 +72,16 @@ class BaseTarget(object):
     def stop(self):
         pass
 
+    @classmethod
+    def get_image_fstype(self, d, image_fstypes=None):
+	if not image_fstypes:
+	    image_fstypes = d.getVar('IMAGE_FSTYPES', True).split(' ')
+	possible_image_fstypes = [fstype for fstype in self.supported_image_fstypes if fstype in image_fstypes]
+	if possible_image_fstypes:
+	    return possible_image_fstypes[0]
+	else:
+	    bb.fatal("no possible image_fstype could not be determined. IMAGE_FSTYPES=\"%s\" and supported_image_fstypes=\"%s\": " % (', '.join(map(str, image_fstypes)), ', '.join(map(str, self.supported_image_fstypes))))
+
     def restart(self, params=None):
         self.stop()
         self.start(params)
@@ -87,13 +99,16 @@ class BaseTarget(object):
 
 class QemuTarget(BaseTarget):
 
+    supported_image_fstypes = ['ext3']
+
     def __init__(self, d):
 
         super(QemuTarget, self).__init__(d)
 
+        self.image_fstype = self.get_image_fstype(d)
         self.qemulog = os.path.join(self.testdir, "qemu_boot_log.%s" % self.datetime)
-        self.origrootfs = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True),  d.getVar("IMAGE_LINK_NAME", True) + '.ext3')
-        self.rootfs = os.path.join(self.testdir, d.getVar("IMAGE_LINK_NAME", True) + '-testimage.ext3')
+        self.origrootfs = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True),  d.getVar("IMAGE_LINK_NAME", True) + '.' + self.image_fstype)
+        self.rootfs = os.path.join(self.testdir, d.getVar("IMAGE_LINK_NAME", True) + '-testimage.' + self.image_fstype)
 
         self.runner = QemuRunner(machine=d.getVar("MACHINE", True),
                         rootfs=self.rootfs,
-- 
1.8.3.2


