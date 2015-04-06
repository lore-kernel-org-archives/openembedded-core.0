Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D29F072A2D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 17:43:40 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 06 Apr 2015 10:43:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,532,1422950400"; d="scan'208";a="551679967"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 06 Apr 2015 10:43:41 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 0057F6A408F;
	Mon,  6 Apr 2015 10:43:18 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Apr 2015 20:43:35 +0300
Message-Id: <1428342215-7850-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <CAP9ODKprO_BWYjr4x0w2PXELXrZa6Y4C2=XgKMWXE+ppULZXTQ@mail.gmail.com>
References: <CAP9ODKprO_BWYjr4x0w2PXELXrZa6Y4C2=XgKMWXE+ppULZXTQ@mail.gmail.com>
Subject: [wic][PATCH] wic: use native parted
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
X-List-Received-Date: Mon, 06 Apr 2015 17:43:41 -0000

Used exec_native_cmd instead of find_binary_path to run parted.
Got rid of find_binary_path as it's not used anywhere else.

There are several tools wic is trying to find not only in sysroot,
but also in host root. Parted is a special as on some distros it's
installed in /usr/sbin, which is not in the user's PATH. This makes
wic to fail with error "External command 'parted' not found, exiting."

[YOCTO #7122]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/imager/direct.py       |  2 +-
 scripts/lib/wic/utils/fs_related.py    | 18 ------------------
 scripts/lib/wic/utils/partitionedfs.py | 11 ++++++-----
 3 files changed, 7 insertions(+), 24 deletions(-)

diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index d368401..c3d0563 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -242,7 +242,7 @@ class DirectImageCreator(BaseImageCreator):
         """
         parts = self._get_parts()
 
-        self.__image = Image()
+        self.__image = Image(self.native_sysroot)
 
         for p in parts:
             # as a convenience, set source to the boot partition source
diff --git a/scripts/lib/wic/utils/fs_related.py b/scripts/lib/wic/utils/fs_related.py
index ea9f85c..033acc9 100644
--- a/scripts/lib/wic/utils/fs_related.py
+++ b/scripts/lib/wic/utils/fs_related.py
@@ -31,24 +31,6 @@ from wic.utils import runner
 from wic.utils.errors import *
 from wic.utils.oe.misc import *
 
-def find_binary_path(binary):
-    if os.environ.has_key("PATH"):
-        paths = os.environ["PATH"].split(":")
-    else:
-        paths = []
-        if os.environ.has_key("HOME"):
-            paths += [os.environ["HOME"] + "/bin"]
-        paths += ["/usr/local/sbin", "/usr/local/bin", "/usr/sbin", "/usr/bin", "/sbin", "/bin"]
-
-    for path in paths:
-        bin_path = "%s/%s" % (path, binary)
-        if os.path.exists(bin_path):
-            return bin_path
-
-    print "External command '%s' not found, exiting." % binary
-    print "  (Please install '%s' on your host system)" % binary
-    sys.exit(1)
-
 def makedirs(dirname):
     """A version of os.makedirs() that doesn't throw an
     exception if the leaf directory already exists.
diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index 162f8e1..1c10cb5 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -42,13 +42,13 @@ class Image:
     An Image is a container for a set of DiskImages and associated
     partitions.
     """
-    def __init__(self):
+    def __init__(self, native_sysroot=None):
         self.disks = {}
         self.partitions = []
-        self.parted = find_binary_path("parted")
         # Size of a sector used in calculations
         self.sector_size = SECTOR_SIZE
         self._partitions_layed_out = False
+        self.native_sysroot = native_sysroot
 
     def __add_disk(self, disk_name):
         """ Add a disk 'disk_name' to the internal list of disks. Note,
@@ -227,11 +227,12 @@ class Image:
     def __run_parted(self, args):
         """ Run parted with arguments specified in the 'args' list. """
 
-        args.insert(0, self.parted)
+        args.insert(0, "parted")
+        args = ' '.join(args)
         msger.debug(args)
 
-        rc, out = runner.runtool(args, catch = 3)
-        out = out.strip()
+        rc, out = exec_native_cmd(args, self.native_sysroot)
+
         if out:
             msger.debug('"parted" output: %s' % out)
 
-- 
2.1.4


