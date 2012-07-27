Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SuinP-0002OP-7p
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 13:33:27 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Jul 2012 04:21:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="198893975"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by fmsmga002.fm.intel.com with ESMTP; 27 Jul 2012 04:21:54 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2012 14:21:44 +0300
Message-Id: <370f089c241234b0455729c8c4129c7e35ef0989.1343387245.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <144e38e3c5156ec33b2fa3da4de9adc17c04770e.1343387245.git.laurentiu.palcu@intel.com>
References: <144e38e3c5156ec33b2fa3da4de9adc17c04770e.1343387245.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1343387245.git.laurentiu.palcu@intel.com>
References: <cover.1343387245.git.laurentiu.palcu@intel.com>
Subject: [PATCH 3/6] scripts: add script for relocating the SDK
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jul 2012 11:33:27 -0000

This script will be embedded in the SDK tarball and will be called by
the SDK installer. It replaces the interpreter path in all binaries and
it also changes the ld.so.cache and SYSDIRS in dynamic loader.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 scripts/relocate_sdk.py |  200 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 200 insertions(+)
 create mode 100755 scripts/relocate_sdk.py

diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
new file mode 100755
index 0000000..0668600
--- /dev/null
+++ b/scripts/relocate_sdk.py
@@ -0,0 +1,200 @@
+#!/usr/bin/env python
+#
+# Copyright (c) 2012 Intel Corporation
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
+# See the GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+#
+# DESCRIPTION
+# This script is called by the SDK installer script. It replaces the dynamic
+# loader path in all binaries and also fixes the SYSDIR paths/lengths and the
+# location of ld.so.cache in the dynamic loader binary
+#
+# AUTHORS
+# Laurentiu Palcu <laurentiu.palcu@intel.com>
+#
+
+import struct
+import sys
+import stat
+import os
+import re
+
+old_prefix = re.compile("\/opt\/poky")
+
+def get_arch():
+    f.seek(0)
+    e_ident =f.read(16)
+    ei_mag0,ei_mag1_3,ei_class = struct.unpack("<B3sB11x", e_ident)
+
+    if (ei_mag0 != 0x7f and ei_mag1_3 != "ELF") or ei_class == 0:
+        return 0
+
+    if ei_class == 1:
+        return 32
+    elif ei_class == 2:
+        return 64
+
+def parse_elf_header():
+    global e_type, e_machine, e_version, e_entry, e_phoff, e_shoff, e_flags,\
+           e_ehsize, e_phentsize, e_phnum, e_shentsize, e_shnum, e_shstrndx
+
+    f.seek(0)
+    elf_header = f.read(64)
+
+    if arch == 32:
+        # 32bit
+        hdr_struct = struct.Struct("<HHILLLIHHHHHH")
+        hdr_size = 52
+    else:
+        # 64bit
+        hdr_struct = struct.Struct("<HHIQQQIHHHHHH")
+        hdr_size = 64
+
+    e_type, e_machine, e_version, e_entry, e_phoff, e_shoff, e_flags,\
+    e_ehsize, e_phentsize, e_phnum, e_shentsize, e_shnum, e_shstrndx =\
+        hdr_struct.unpack(elf_header[16:hdr_size])
+
+def change_interpreter():
+    if arch == 32:
+        ph_struct = struct.Struct("<IIIIIIII")
+    else:
+        ph_struct = struct.Struct("<IIQQQQQQ")
+
+    """ look for PT_INTERP section """
+    for i in range(0,e_phnum):
+        f.seek(e_phoff + i * e_phentsize)
+        ph_hdr = f.read(e_phentsize)
+        if arch == 32:
+            # 32bit
+            p_type, p_offset, p_vaddr, p_paddr, p_filesz,\
+                p_memsz, p_flags, p_align = ph_struct.unpack(ph_hdr)
+        else:
+            # 64bit
+            p_type, p_flags, p_offset, p_vaddr, p_paddr, \
+            p_filesz, p_memsz, p_align = ph_struct.unpack(ph_hdr)
+
+        """ change interpreter """
+        if p_type == 3:
+            # PT_INTERP section
+            f.seek(p_offset)
+            dl_path = new_dl_path + "\0" * (e_phentsize - len(new_dl_path))
+            f.write(new_dl_path)
+            break
+
+def change_dl_sysdirs():
+    if arch == 32:
+        sh_struct = struct.Struct("<IIIIIIIIII")
+    else:
+        sh_struct = struct.Struct("<IIQQQQIIQQ")
+
+    """ read section string table """
+    f.seek(e_shoff + e_shstrndx * e_shentsize)
+    sh_hdr = f.read(e_shentsize)
+    if arch == 32:
+        sh_offset, sh_size = struct.unpack("<16xII16x", sh_hdr)
+    else:
+        sh_offset, sh_size = struct.unpack("<24xQQ24x", sh_hdr)
+
+    f.seek(sh_offset)
+    sh_strtab = f.read(sh_size)
+
+    sysdirs = sysdirs_len = ""
+
+    """ change ld.so.cache path and default libs path for dynamic loader """
+    for i in range(0,e_shnum):
+        f.seek(e_shoff + i * e_shentsize)
+        sh_hdr = f.read(e_shentsize)
+
+        sh_name, sh_type, sh_flags, sh_addr, sh_offset, sh_size, sh_link,\
+            sh_info, sh_addralign, sh_entsize = sh_struct.unpack(sh_hdr)
+
+        name = sh_strtab[sh_name:sh_strtab.find("\0", sh_name)]
+
+        """ look only into SHT_PROGBITS sections """
+        if sh_type == 1:
+            f.seek(sh_offset)
+            """ default library paths cannot be changed on the fly because  """
+            """ the string lengths have to be changed too.                  """
+            if name == ".sysdirs":
+                sysdirs = f.read(sh_size)
+                sysdirs_off = sh_offset
+                sysdirs_sect_size = sh_size
+            elif name == ".sysdirslen":
+                sysdirslen = f.read(sh_size)
+                sysdirslen_off = sh_offset
+            elif name == ".ldsocache":
+                ldsocache_path = f.read(sh_size)
+                new_ldsocache_path = old_prefix.sub(new_prefix, ldsocache_path)
+                # pad with zeros
+                new_ldsocache_path += "\0" * (sh_size - len(new_ldsocache_path))
+                # write it back
+                f.seek(sh_offset)
+                f.write(new_ldsocache_path)
+
+    if sysdirs != "" and sysdirslen != "":
+        paths = sysdirs.split("\0")
+        sysdirs = ""
+        sysdirslen = ""
+        for path in paths:
+            """ exit the loop when we encounter first empty string """
+            if path == "":
+                break
+
+            new_path = old_prefix.sub(new_prefix, path)
+            sysdirs += new_path + "\0"
+
+            if arch == 32:
+                sysdirslen += struct.pack("<L", len(new_path))
+            else:
+                sysdirslen += struct.pack("<Q", len(new_path))
+
+        """ pad with zeros """
+        sysdirs += "\0" * (sysdirs_sect_size - len(sysdirs))
+
+        """ write the sections back """
+        f.seek(sysdirs_off)
+        f.write(sysdirs)
+        f.seek(sysdirslen_off)
+        f.write(sysdirslen)
+
+
+# MAIN
+if len(sys.argv) < 4:
+    exit(1)
+
+new_prefix = sys.argv[1]
+new_dl_path = sys.argv[2]
+executables_list = sys.argv[3:]
+
+for e in executables_list:
+    perms = os.stat(e)[stat.ST_MODE]
+    if os.access(e, os.W_OK|os.R_OK):
+        perms = None
+    else:
+        os.chmod(e, perms|stat.S_IRWXU)
+
+    f = open(e, "r+b")
+
+    arch = get_arch()
+    if arch:
+        parse_elf_header()
+        change_interpreter()
+        change_dl_sysdirs()
+
+    """ change permissions back """
+    if perms:
+        os.chmod(e, perms)
+
+    f.close()
+
-- 
1.7.9.5



