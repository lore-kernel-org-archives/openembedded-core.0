Return-Path: <amanda.r.brindle@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 10F6875083
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 21:13:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Apr 2018 14:13:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,412,1517904000"; d="scan'208";a="48340431"
Received: from aurora.jf.intel.com ([10.7.198.68])
	by orsmga002.jf.intel.com with ESMTP; 05 Apr 2018 14:13:01 -0700
From: Amanda Brindle <amanda.r.brindle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Apr 2018 14:12:57 -0700
Message-Id: <d2e6bc492fe2e1c045a1a91926a82de8bc0fb616.1522962189.git.amanda.r.brindle@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1522962189.git.amanda.r.brindle@intel.com>
References: <cover.1522962189.git.amanda.r.brindle@intel.com>
Cc: alexander.kanavin@intel.com
Subject: [pyro 1/1] package.bbclass: replace rpm/debugedit with dwarfsrcfiles
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
X-List-Received-Date: Thu, 05 Apr 2018 21:13:03 -0000

From: Alexander Kanavin <alexander.kanavin@linux.intel.com>

Debugedit provided by rpm 4.14 is rewriting binaries in-place, and was
found to produce broken output at least for grub:
http://lists.openembedded.org/pipermail/openembedded-core/2017-November/143989.html

A replacement utility was suggested via private mail:
https://lists.fedorahosted.org/archives/list/elfutils-devel@lists.fedorahosted.org/message/VZP4G5N2ELYZEDAB3QYLXYHDGX4WMCUF/

(From OE-Core rev: f2e6e1d3bfd4c92ef0f5ed4721fd9050c59dafca)

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0d5475a3b28d9e2c9273967a03726bb6c427bd11)
---
 meta/classes/package.bbclass                       |  29 ++++--
 .../dwarfsrcfiles/dwarfsrcfiles.bb                 |  22 ++++
 .../dwarfsrcfiles/files/dwarfsrcfiles.c            | 111 +++++++++++++++++++++
 3 files changed, 156 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb
 create mode 100644 meta/recipes-devtools/dwarfsrcfiles/files/dwarfsrcfiles.c

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index a03c05b..69c470c 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -52,7 +52,8 @@ LOCALE_SECTION ?= ''
 ALL_MULTILIB_PACKAGE_ARCHS = "${@all_multilib_tune_values(d, 'PACKAGE_ARCHS')}"
 
 # rpm is used for the per-file dependency identification
-PACKAGE_DEPENDS += "rpm-native"
+# dwarfsrcfiles is used to determine the list of debug source files
+PACKAGE_DEPENDS += "rpm-native dwarfsrcfiles-native"
 
 
 # If your postinstall can execute at rootfs creation time rather than on
@@ -334,6 +335,16 @@ def checkbuildpath(file, d):
 
     return False
 
+def parse_debugsources_from_dwarfsrcfiles_output(dwarfsrcfiles_output):
+    debugfiles = {}
+
+    for line in dwarfsrcfiles_output.splitlines():
+        if line.startswith("\t"):
+            debugfiles[os.path.normpath(line.split()[0])] = ""
+
+    return debugfiles.keys()
+
+
 def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):
     # Function to split a single file into two components, one is the stripped
     # target system binary, the other contains any debugging information. The
@@ -345,7 +356,6 @@ def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):
 
     dvar = d.getVar('PKGD')
     objcopy = d.getVar("OBJCOPY")
-    debugedit = d.expand("${STAGING_LIBDIR_NATIVE}/rpm/debugedit")
 
     # We ignore kernel modules, we don't generate debug info files.
     if file.find("/lib/modules/") != -1 and file.endswith(".ko"):
@@ -359,10 +369,18 @@ def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):
 
     # We need to extract the debug src information here...
     if debugsrcdir:
-        cmd = "'%s' -i -l '%s' '%s'" % (debugedit, sourcefile, file)
+        cmd = "'dwarfsrcfiles' '%s'" % (file)
         (retval, output) = oe.utils.getstatusoutput(cmd)
-        if retval:
-            bb.fatal("debugedit failed with exit code %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
+        # 255 means a specific file wasn't fully parsed to get the debug file list, which is not a fatal failure
+        if retval != 0 and retval != 255:
+            bb.fatal("dwarfsrcfiles failed with exit code %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
+
+        debugsources = parse_debugsources_from_dwarfsrcfiles_output(output)
+        # filenames are null-separated - this is an artefact of the previous use
+        # of rpm's debugedit, which was writing them out that way, and the code elsewhere
+        # is still assuming that.
+        debuglistoutput = '\0'.join(debugsources) + '\0'
+        open(sourcefile, 'a').write(debuglistoutput)
 
     bb.utils.mkdirhier(os.path.dirname(debugfile))
 
@@ -393,7 +411,6 @@ def copydebugsources(debugsrcdir, d):
         dvar = d.getVar('PKGD')
         strip = d.getVar("STRIP")
         objcopy = d.getVar("OBJCOPY")
-        debugedit = d.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debugedit")
         workdir = d.getVar("WORKDIR")
         workparentdir = os.path.dirname(os.path.dirname(workdir))
         workbasedir = os.path.basename(os.path.dirname(workdir)) + "/" + os.path.basename(workdir)
diff --git a/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb b/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb
new file mode 100644
index 0000000..c59a006
--- /dev/null
+++ b/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb
@@ -0,0 +1,22 @@
+SUMMARY = "A small utility for printing debig source file locations embedded in binaries"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://../dwarfsrcfiles.c;md5=31483894e453a77acbb67847565f1b5c;beginline=1;endline=8"
+
+SRC_URI = "file://dwarfsrcfiles.c"
+BBCLASSEXTEND = "native"
+DEPENDS = "elfutils"
+DEPENDS_append_libc-musl = " argp-standalone"
+
+do_compile () {
+	${CC} ${CFLAGS} ${LDFLAGS} -o dwarfsrcfiles ../dwarfsrcfiles.c -lelf -ldw
+}
+
+do_compile_libc-musl () {
+	${CC} ${CFLAGS} ${LDFLAGS} -o dwarfsrcfiles ../dwarfsrcfiles.c -lelf -ldw -largp 
+}
+
+do_install () {
+	install -d ${D}${bindir}
+	install -t ${D}${bindir} dwarfsrcfiles
+}
+
diff --git a/meta/recipes-devtools/dwarfsrcfiles/files/dwarfsrcfiles.c b/meta/recipes-devtools/dwarfsrcfiles/files/dwarfsrcfiles.c
new file mode 100644
index 0000000..af7af52
--- /dev/null
+++ b/meta/recipes-devtools/dwarfsrcfiles/files/dwarfsrcfiles.c
@@ -0,0 +1,111 @@
+// dwarfsrcfiles.c - Get source files associated with the dwarf in a elf file.
+// gcc -Wall -g -O2 -lelf -ldw -o dwarfsrcfiles dwarfsrcfiles.c 
+//
+// Copyright (C) 2011, Mark Wielaard <mjw@redhat.com>
+//
+// This file is free software.  You can redistribute it and/or modify
+// it under the terms of the GNU General Public License (GPL); either
+// version 2, or (at your option) any later version.
+
+#include <argp.h>
+#include <stdio.h>
+
+#include <dwarf.h>
+#include <elfutils/libdw.h>
+#include <elfutils/libdwfl.h>
+
+static int
+process_cu (Dwarf_Die *cu_die)
+{
+  Dwarf_Attribute attr;
+  const char *name;
+  const char *dir = NULL;
+  
+  Dwarf_Files *files;
+  size_t n;
+  int i;
+  
+  if (dwarf_tag (cu_die) != DW_TAG_compile_unit)
+    {
+      fprintf (stderr, "DIE isn't a compile unit");
+      return -1;
+    }
+  
+  if (dwarf_attr (cu_die, DW_AT_name, &attr) == NULL)
+    {
+      fprintf(stderr, "CU doesn't have a DW_AT_name");
+      return -1;
+    }
+  
+  name = dwarf_formstring (&attr);
+  if (name == NULL)
+    {
+      fprintf(stderr, "Couldn't get DW_AT_name as string, %s",
+	     dwarf_errmsg (-1));
+      return -1;
+    }
+  
+  if (dwarf_attr (cu_die, DW_AT_comp_dir, &attr) != NULL)
+    {
+      dir = dwarf_formstring (&attr);
+      if (dir == NULL)
+	{
+	  fprintf(stderr, "Couldn't get DW_AT_comp_die as string, %s",
+		 dwarf_errmsg (-1));
+	  return -1;
+	}
+    }
+  
+  if (dir == NULL)
+    printf ("%s\n", name);
+  else
+    printf ("%s/%s\n", dir, name);
+  
+  if (dwarf_getsrcfiles (cu_die, &files, &n) != 0)
+    {
+      fprintf(stderr, "Couldn't get CU file table, %s",
+	     dwarf_errmsg (-1));
+      return -1;
+    }
+  
+  for (i = 1; i < n; i++)
+    {
+      const char *file = dwarf_filesrc (files, i, NULL, NULL);
+      if (dir != NULL && file[0] != '/')
+	printf ("\t%s/%s\n", dir, file);
+      else
+	printf ("\t%s\n", file);
+    }
+  
+  return 0;
+}
+
+int
+main (int argc, char **argv)
+{
+  char* args[3];
+  int res = 0;
+  Dwfl *dwfl;
+  Dwarf_Addr bias;
+  
+  if (argc != 2)
+    fprintf(stderr, "Usage %s <file>", argv[0]);
+  
+  // Pretend "dwarfsrcfiles -e <file>" was given, so we can use standard
+  // dwfl argp parser to open the file for us and get our Dwfl. Useful
+  // in case argument is an ET_REL file (like kernel modules). libdwfl
+  // will fix up relocations for us.
+  args[0] = argv[0];
+  args[1] = "-e";
+  args[2] = argv[1];
+  
+  argp_parse (dwfl_standard_argp (), 3, args, 0, NULL, &dwfl);
+  
+  Dwarf_Die *cu = NULL;
+  while ((cu = dwfl_nextcu (dwfl, cu, &bias)) != NULL)
+    res |= process_cu (cu);
+  
+  dwfl_end (dwfl);
+
+  return res;
+}
-- 
2.7.4


