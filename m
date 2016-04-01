Return-Path: <william.c.randle@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4A0E0760AD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 16:49:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 Apr 2016 09:49:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,427,1455004800"; d="scan'208";a="923530828"
Received: from wcrandle-mobl1.amr.corp.intel.com ([10.254.35.3])
	by orsmga001.jf.intel.com with ESMTP; 01 Apr 2016 09:49:16 -0700
From: Bill Randle <william.c.randle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Apr 2016 09:49:12 -0700
Message-Id: <1459529352-18287-1-git-send-email-william.c.randle@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCHv2] insane.bbclass: avoid false positives on library location
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
X-List-Received-Date: Fri, 01 Apr 2016 16:49:16 -0000

package_qa_check_libdir() reports that the file libsoletta.so.0.0.1-gdb.py
in /usr/share/gdb/auto-load is in the wrong location. Before generating
a warning for files in non-standard locations, check that the file is an
actual elf file (and hence a real library file).

[YOCTO #9215]

Signed-off-by: Bill Randle <william.c.randle@intel.com>
---
 meta/classes/insane.bbclass | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 7ac945d..c57b217 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -318,6 +318,9 @@ def package_qa_check_libdir(d):
 
     messages = []
 
+    # The re's are purposely fuzzy, as some there are some .so.x.y.z files
+    # that don't follow the standard naming convention. It checks later
+    # that they are actual ELF files
     lib_re = re.compile("^/lib.+\.so(\..+)?$")
     exec_re = re.compile("^%s.*/lib.+\.so(\..+)?$" % exec_prefix)
 
@@ -342,10 +345,22 @@ def package_qa_check_libdir(d):
                 rel_path = os.sep + rel_path
                 if lib_re.match(rel_path):
                     if base_libdir not in rel_path:
-                        messages.append("%s: found library in wrong location: %s" % (package, rel_path))
+                        # make sure it's an actual ELF file
+                        elf = oe.qa.ELFFile(full_path)
+                        try:
+                            elf.open()
+                            messages.append("%s: found library in wrong location: %s" % (package, rel_path))
+                        except (oe.qa.NotELFFileError):
+                            pass
                 if exec_re.match(rel_path):
                     if libdir not in rel_path and libexecdir not in rel_path:
-                        messages.append("%s: found library in wrong location: %s" % (package, rel_path))
+                        # make sure it's an actual ELF file
+                        elf = oe.qa.ELFFile(full_path)
+                        try:
+                            elf.open()
+                            messages.append("%s: found library in wrong location: %s" % (package, rel_path))
+                        except (oe.qa.NotELFFileError):
+                            pass
 
     if messages:
         package_qa_handle_error("libdir", "\n".join(messages), d)
-- 
2.5.0


