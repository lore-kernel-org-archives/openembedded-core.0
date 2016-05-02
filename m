Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2EDAA731A8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 19:31:02 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 02 May 2016 12:31:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,568,1455004800"; d="scan'208";a="971017872"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by fmsmga002.fm.intel.com with ESMTP; 02 May 2016 12:31:03 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 May 2016 11:27:10 +0000
Message-Id: <f9b227a491fa86e74f5f84df68fd7181b1f9bd37.1462188303.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
MIME-Version: 1.0
In-Reply-To: <cover.1462188303.git.mariano.lopez@linux.intel.com>
References: <cover.1462188303.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] sshcontrol.py: Add methods to copy dirs and delete files
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
X-List-Received-Date: Mon, 02 May 2016 19:31:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This patch add new methods to SSHControl class. These methods
include:
    - Copy a dir to DUT
    - Delete a file in the DUT
    - Delete a directory in the DUT (if empty)
    - Delete a directory structure in the DUT

[YOCTO #9565]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/utils/sshcontrol.py | 83 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
index 1658744..15618cc 100644
--- a/meta/lib/oeqa/utils/sshcontrol.py
+++ b/meta/lib/oeqa/utils/sshcontrol.py
@@ -151,3 +151,86 @@ class SSHControl(object):
     def copy_from(self, remotepath, localpath):
         command = self.scp + ['%s@%s:%s' % (self.user, self.ip, remotepath), localpath]
         return self._internal_run(command, ignore_status=False)
+
+    def copy_dir_to(self, localpath, remotepath):
+        """
+        Copy recursively localpath directory to remotepath in target.
+        """
+
+        for root, dirs, files in os.walk(localpath):
+            # Create directories in the target as needed
+            for d in dirs:
+                tmp_dir = os.path.join(root, d).replace(localpath, "")
+                new_dir = os.path.join(remotepath, tmp_dir.lstrip("/"))
+                cmd = "mkdir -p %s" % new_dir
+                self.run(cmd)
+
+            # Copy files into the target
+            for f in files:
+                tmp_file = os.path.join(root, f).replace(localpath, "")
+                dst_file = os.path.join(remotepath, tmp_file.lstrip("/"))
+                src_file = os.path.join(root, f)
+                self.copy_to(src_file, dst_file)
+
+
+    def delete_files(self, remotepath, files):
+        """
+        Delete files in target's remote path.
+        """
+
+        cmd = "rm"
+        if not isinstance(files, list):
+            files = [files]
+
+        for f in files:
+            cmd = "%s %s" % (cmd, os.path.join(remotepath, f))
+
+        self.run(cmd)
+
+
+    def delete_dir(self, remotepath):
+        """
+        Delete remotepath directory in target.
+        """
+
+        cmd = "rmdir %s" % remotepath
+        self.run(cmd)
+
+
+    def delete_dir_structure(self, localpath, remotepath):
+        """
+        Delete recursively localpath structure directory in target's remotepath.
+
+        This function is very usefult to delete a package that is installed in
+        the DUT and the host running the test has such package extracted in tmp
+        directory.
+
+        Example:
+            pwd: /home/user/tmp
+            tree:   .
+                    └── work
+                        ├── dir1
+                        │   └── file1
+                        └── dir2
+
+            localpath = "/home/user/tmp" and remotepath = "/home/user"
+
+            With the above variables this function will try to delete the
+            directory in the DUT in this order:
+                /home/user/work/dir1/file1
+                /home/user/work/dir1        (if dir is empty)
+                /home/user/work/dir2        (if dir is empty)
+                /home/user/work             (if dir is empty)
+        """
+
+        for root, dirs, files in os.walk(localpath, topdown=False):
+            # Delete files first
+            tmpdir = os.path.join(root).replace(localpath, "")
+            remotedir = os.path.join(remotepath, tmpdir.lstrip("/"))
+            self.delete_files(remotedir, files)
+
+            # Remove dirs if empty
+            for d in dirs:
+                tmpdir = os.path.join(root, d).replace(localpath, "")
+                remotedir = os.path.join(remotepath, tmpdir.lstrip("/"))
+                self.delete_dir(remotepath)
-- 
2.6.6


