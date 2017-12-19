Return-Path: <california.l.sullivan@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 1F81178679
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 22:58:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Dec 2017 14:58:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,428,1508828400"; d="scan'208";a="17433549"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga001.jf.intel.com with ESMTP; 19 Dec 2017 14:58:36 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Dec 2017 14:58:14 -0800
Message-Id: <20171219225831.22587-2-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171219225831.22587-1-california.l.sullivan@intel.com>
References: <20171219225831.22587-1-california.l.sullivan@intel.com>
Subject: [PATCH RFC 01/18] fs-uuid.bbclass: rewrite get_fs_uuid function
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
X-List-Received-Date: Tue, 19 Dec 2017 22:58:38 -0000

I couldn't find anywhere it was being used, and in trying to use it it
just spit out an error.

It now generates a random UUID and puts it in the deploy dir for
consumption.

Also use DISK_SIGNATURE_UUID for the replacement function, since that
is user-overridable.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/classes/fs-uuid.bbclass | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/meta/classes/fs-uuid.bbclass b/meta/classes/fs-uuid.bbclass
index 9b53dfba7ab..5a96054294e 100644
--- a/meta/classes/fs-uuid.bbclass
+++ b/meta/classes/fs-uuid.bbclass
@@ -1,16 +1,26 @@
+inherit deploy
+
 # Extract UUID from ${ROOTFS}, which must have been built
 # by the time that this function gets called. Only works
 # on ext file systems and depends on tune2fs.
 def get_rootfs_uuid(d):
-    import subprocess
-    rootfs = d.getVar('ROOTFS')
-    output = subprocess.check_output(['tune2fs', '-l', rootfs])
-    for line in output.split('\n'):
-        if line.startswith('Filesystem UUID:'):
-            uuid = line.split()[-1]
-            bb.note('UUID of %s: %s' % (rootfs, uuid))
-            return uuid
-    bb.fatal('Could not determine filesystem UUID of %s' % rootfs)
+    import os
+    import uuid
+    deploydir = d.getVar('DEPLOY_DIR_IMAGE')
+    bootfs_uuid_file = deploydir + "/bootfs-uuid"
+    uuid_str = "deadbeef-dead-beef-dead-beefdeadbeef"
+    if d.getVar('BUILD_REPRODUCIBLE_BINARIES', True) != "1":
+        if os.path.exists(bootfs_uuid_file):
+            with open(bootfs_uuid_file, "r+") as file:
+                uuid_str = file.read()
+        else:
+            # deploydir might not exist yet...creating it here could be bad?
+            if not os.path.exists(deploydir):
+                os.makedirs(deploydir)
+            uuid_str = str(uuid.uuid4())
+            with open(bootfs_uuid_file, "w") as file:
+                file.write(uuid_str)
+    return uuid_str
 
 # Replace the special <<uuid-of-rootfs>> inside a string (like the
 # root= APPEND string in a syslinux.cfg or systemd-boot entry) with the
@@ -19,6 +29,8 @@ def get_rootfs_uuid(d):
 def replace_rootfs_uuid(d, string):
     UUID_PLACEHOLDER = '<<uuid-of-rootfs>>'
     if UUID_PLACEHOLDER in string:
-        uuid = get_rootfs_uuid(d)
+        uuid = d.getVar('DISK_SIGNATURE_UUID', True)
         string = string.replace(UUID_PLACEHOLDER, uuid)
     return string
+
+DISK_SIGNATURE_UUID ?= "${@get_rootfs_uuid(d)}"
-- 
2.14.3


