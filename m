Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 5D56A6FFD7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2016 12:52:44 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 16 Sep 2016 05:52:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,344,1470726000"; d="scan'208";a="1031537838"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.30.107])
	by orsmga001.jf.intel.com with ESMTP; 16 Sep 2016 05:52:44 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Sep 2016 13:52:28 +0100
Message-Id: <d46e15ada3b7e6fcc7b63a97121cc768767f8460.1474030160.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1474030160.git.joshua.g.lock@intel.com>
References: <cover.1474030160.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1474030160.git.joshua.g.lock@intel.com>
References: <cover.1474030160.git.joshua.g.lock@intel.com>
Subject: [PATCH 1/6] runqemu: add guidance to resolve issues with missing files
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
X-List-Received-Date: Fri, 16 Sep 2016 12:52:44 -0000

When a required binary cannot be found print some guidance pointing
to using a sourced OE build environment or a qemuboot.conf file,
based on a similar message from the previous shell-based runqemu.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 scripts/runqemu | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index b6bc0ba..c71a47c 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -28,6 +28,16 @@ import shutil
 import glob
 import configparser
 
+class OEPathError(Exception):
+    """Custom Exception to give better guidance on missing binaries"""
+    def __init__(self, message):
+        self.message = "In order for this script to dynamically infer paths\n \
+kernels or filesystem images, you either need bitbake in your PATH\n \
+or to source oe-init-build-env before running this script.\n\n \
+Dynamic path inference can be avoided by passing a *.qemuboot.conf to\n \
+runqemu, i.e. `runqemu /path/to/my-image-name.qemuboot.conf`\n\n %s" % message
+
+
 def create_logger():
     logger = logging.getLogger('runqemu')
     logger.setLevel(logging.INFO)
@@ -537,7 +547,7 @@ class BaseConfig(object):
             elif os.getenv('DEPLOY_DIR_IMAGE'):
                 deploy_dir_image = os.getenv('DEPLOY_DIR_IMAGE')
             else:
-                raise Exception("DEPLOY_DIR_IMAGE is NULL!")
+                raise OEPathError("DEPLOY_DIR_IMAGE is NULL!")
 
             if self.rootfs and not os.path.exists(self.rootfs):
                 # Lazy rootfs
@@ -691,7 +701,7 @@ class BaseConfig(object):
         lockdir = "/tmp/qemu-tap-locks"
 
         if not (self.qemuifup and self.qemuifdown and ip):
-            raise Exception("runqemu-ifup, runqemu-ifdown or ip not found")
+            raise OEPathError("runqemu-ifup, runqemu-ifdown or ip not found")
 
         if not os.path.exists(lockdir):
             # There might be a race issue when multi runqemu processess are
@@ -808,7 +818,7 @@ class BaseConfig(object):
 
         qemu_bin = '%s/%s' % (self.get('STAGING_BINDIR_NATIVE'), qemu_system)
         if not os.access(qemu_bin, os.X_OK):
-            raise Exception("No QEMU binary '%s' could be found" % qemu_bin)
+            raise OEPathError("No QEMU binary '%s' could be found" % qemu_bin)
 
         check_libgl(qemu_bin)
 
@@ -923,6 +933,9 @@ def main():
 if __name__ == "__main__":
     try:
         ret = main()
+    except OEPathError as err:
+        ret = 1
+        logger.error(err.message)
     except Exception as esc:
         ret = 1
         import traceback
-- 
2.7.4


