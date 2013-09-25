Return-Path: <laurentiu.palcu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 86A696CA88
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 09:32:46 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 25 Sep 2013 02:32:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,977,1371106800"; d="scan'208";a="299122962"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 25 Sep 2013 02:32:37 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Sep 2013 12:32:33 +0300
Message-Id: <16bbed145ac2cffbf9e88a587a670383ebb18c74.1380101457.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1380101457.git.laurentiu.palcu@intel.com>
References: <cover.1380101457.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1380101457.git.laurentiu.palcu@intel.com>
References: <cover.1380101457.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/1] relocate_sdk.py: make it work also with python 3
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
X-List-Received-Date: Wed, 25 Sep 2013 09:32:48 -0000

Strings in Python 3, by default, are assumed to contain unicode
characters. In previous versions of python (<3), unicode strings are
explicitly declared with u"abc". If not, than they're automatically
converted to bytes. This doesn't happen anymore in Python 3.

Since we're dealing with binary files, opened in byte mode, make sure
that we explicitly convert all strings to bytes to make both python 2
and 3 happy.

Other changes:
 * add a safety check to make sure relocation did not change the file
   size;
 * a couple of cosmetic changes (wrap long lines so that we don't have
   to scroll to reach the end of them);

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 scripts/relocate_sdk.py |   54 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 19 deletions(-)

diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
index 1d7bbb3..fe6e4e0 100755
--- a/scripts/relocate_sdk.py
+++ b/scripts/relocate_sdk.py
@@ -31,7 +31,7 @@ import os
 import re
 import errno
 
-old_prefix = re.compile("##DEFAULT_INSTALL_DIR##")
+old_prefix = re.compile(b"##DEFAULT_INSTALL_DIR##")
 
 def get_arch():
     f.seek(0)
@@ -92,12 +92,15 @@ def change_interpreter(elf_file_name):
             # External SDKs with mixed pre-compiled binaries should not get
             # relocated so look for some variant of /lib
             fname = f.read(11)
-            if fname.startswith("/lib/") or fname.startswith("/lib64/") or fname.startswith("/lib32/") or fname.startswith("/usr/lib32/") or fname.startswith("/usr/lib32/") or fname.startswith("/usr/lib64/"):
+            if fname.startswith(b"/lib/") or fname.startswith(b"/lib64/") or \
+               fname.startswith(b"/lib32/") or fname.startswith(b"/usr/lib32/") or \
+               fname.startswith(b"/usr/lib32/") or fname.startswith(b"/usr/lib64/"):
                 break
             if (len(new_dl_path) >= p_filesz):
-                print "ERROR: could not relocate %s, interp size = %i and %i is needed." % (elf_file_name, p_memsz, len(new_dl_path) + 1)
+                print("ERROR: could not relocate %s, interp size = %i and %i is needed." \
+                    % (elf_file_name, p_memsz, len(new_dl_path) + 1))
                 break
-            dl_path = new_dl_path + "\0" * (p_filesz - len(new_dl_path))
+            dl_path = new_dl_path + b"\0" * (p_filesz - len(new_dl_path))
             f.seek(p_offset)
             f.write(dl_path)
             break
@@ -129,40 +132,40 @@ def change_dl_sysdirs():
         sh_name, sh_type, sh_flags, sh_addr, sh_offset, sh_size, sh_link,\
             sh_info, sh_addralign, sh_entsize = struct.unpack(sh_fmt, sh_hdr)
 
-        name = sh_strtab[sh_name:sh_strtab.find("\0", sh_name)]
+        name = sh_strtab[sh_name:sh_strtab.find(b"\0", sh_name)]
 
         """ look only into SHT_PROGBITS sections """
         if sh_type == 1:
             f.seek(sh_offset)
             """ default library paths cannot be changed on the fly because  """
             """ the string lengths have to be changed too.                  """
-            if name == ".sysdirs":
+            if name == b".sysdirs":
                 sysdirs = f.read(sh_size)
                 sysdirs_off = sh_offset
                 sysdirs_sect_size = sh_size
-            elif name == ".sysdirslen":
+            elif name == b".sysdirslen":
                 sysdirslen = f.read(sh_size)
                 sysdirslen_off = sh_offset
-            elif name == ".ldsocache":
+            elif name == b".ldsocache":
                 ldsocache_path = f.read(sh_size)
                 new_ldsocache_path = old_prefix.sub(new_prefix, ldsocache_path)
                 # pad with zeros
-                new_ldsocache_path += "\0" * (sh_size - len(new_ldsocache_path))
+                new_ldsocache_path += b"\0" * (sh_size - len(new_ldsocache_path))
                 # write it back
                 f.seek(sh_offset)
                 f.write(new_ldsocache_path)
 
     if sysdirs != "" and sysdirslen != "":
-        paths = sysdirs.split("\0")
-        sysdirs = ""
-        sysdirslen = ""
+        paths = sysdirs.split(b"\0")
+        sysdirs = b""
+        sysdirslen = b""
         for path in paths:
             """ exit the loop when we encounter first empty string """
-            if path == "":
+            if path == b"":
                 break
 
             new_path = old_prefix.sub(new_prefix, path)
-            sysdirs += new_path + "\0"
+            sysdirs += new_path + b"\0"
 
             if arch == 32:
                 sysdirslen += struct.pack("<L", len(new_path))
@@ -170,7 +173,7 @@ def change_dl_sysdirs():
                 sysdirslen += struct.pack("<Q", len(new_path))
 
         """ pad with zeros """
-        sysdirs += "\0" * (sysdirs_sect_size - len(sysdirs))
+        sysdirs += b"\0" * (sysdirs_sect_size - len(sysdirs))
 
         """ write the sections back """
         f.seek(sysdirs_off)
@@ -178,13 +181,19 @@ def change_dl_sysdirs():
         f.seek(sysdirslen_off)
         f.write(sysdirslen)
 
-
 # MAIN
 if len(sys.argv) < 4:
     sys.exit(-1)
 
-new_prefix = sys.argv[1]
-new_dl_path = sys.argv[2]
+# In python > 3, strings may also contain Unicode characters. So, convert
+# them to bytes
+if sys.version_info < (3,):
+    new_prefix = sys.argv[1]
+    new_dl_path = sys.argv[2]
+else:
+    new_prefix = sys.argv[1].encode()
+    new_dl_path = sys.argv[2].encode()
+
 executables_list = sys.argv[3:]
 
 for e in executables_list:
@@ -196,7 +205,7 @@ for e in executables_list:
 
     try:
         f = open(e, "r+b")
-    except IOError, ioex:
+    except IOError as ioex:
         if ioex.errno == errno.ETXTBSY:
             print("Could not open %s. File used by another process.\nPlease "\
                   "make sure you exit all processes that might use any SDK "\
@@ -205,6 +214,9 @@ for e in executables_list:
             print("Could not open %s: %s(%d)" % (e, ioex.strerror, ioex.errno))
         sys.exit(-1)
 
+    # Save old size and do a size check at the end. Just a safety measure.
+    old_size = os.path.getsize(e)
+
     arch = get_arch()
     if arch:
         parse_elf_header()
@@ -217,3 +229,7 @@ for e in executables_list:
 
     f.close()
 
+    if old_size != os.path.getsize(e):
+        print("New file size for %s is different. Looks like a relocation error!", e)
+        sys.exit(-1)
+
-- 
1.7.9.5


