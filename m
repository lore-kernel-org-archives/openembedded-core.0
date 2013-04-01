Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1UMpOv-0005KX-00
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Apr 2013 02:48:37 +0200
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MKL007JPNZ2EF12@vms173011.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 01 Apr 2013 18:30:39 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 76A6920033; Mon,
	01 Apr 2013 19:30:38 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 01 Apr 2013 19:30:33 -0400
Message-id: <1364859034-14438-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCH 1/2][for-danny] relocate_sdk.py: Fix corruption of sdk binaries
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Apr 2013 00:48:37 -0000

From: Jason Wessel <jason.wessel@windriver.com>

There are two cases of corruption that the relocate_sdk.py was not correctly
dealing with.

1) SDK Extras should be left alone
   Extra external binaries included in an SDK that were linked against the
   host's version of /usr/lib/ld-so.so should not get a relocation applied.
   In the case that was discovered these were LSB compliant binaries that
   already worked on many hosts.

2) If the interp section is too small generate an error
   In the case of the qemu user code, it was using its own .ld file
   to link the executables which overrides the default in the nativesdk
   binutils.  This generated host executables which had a interp section
   that was too small to relocate.

   Now the relocate_sdk.py will print an error and continue on such that
   the error can be fixed by a developer without having to do the
   difficult task of debugging why it is crashing or not loading correctly.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/relocate_sdk.py | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
index 74bb7a5..45d2c24 100755
--- a/scripts/relocate_sdk.py
+++ b/scripts/relocate_sdk.py
@@ -66,7 +66,7 @@ def parse_elf_header():
     e_ehsize, e_phentsize, e_phnum, e_shentsize, e_shnum, e_shstrndx =\
         hdr_struct.unpack(elf_header[16:hdr_size])
 
-def change_interpreter():
+def change_interpreter(elf_file_name):
     if arch == 32:
         ph_struct = struct.Struct("<IIIIIIII")
     else:
@@ -89,7 +89,16 @@ def change_interpreter():
         if p_type == 3:
             # PT_INTERP section
             f.seek(p_offset)
+            # External SDKs with mixed pre-compiled binaries should not get
+            # relocated so look for some variant of /lib
+            fname = f.read(11)
+            if fname.startswith("/lib/") or fname.startswith("/lib64/") or fname.startswith("/lib32/") or fname.startswith("/usr/lib32/") or fname.startswith("/usr/lib32/") or fname.startswith("/usr/lib64/"):
+                break
+            if (len(new_dl_path) >= p_filesz):
+                print "ERROR: could not relocate %s, interp size = %i and %i is needed." % (elf_file_name, p_memsz, len(new_dl_path) + 1)
+                break
             dl_path = new_dl_path + "\0" * (p_filesz - len(new_dl_path))
+            f.seek(p_offset)
             f.write(dl_path)
             break
 
@@ -199,7 +208,7 @@ for e in executables_list:
     arch = get_arch()
     if arch:
         parse_elf_header()
-        change_interpreter()
+        change_interpreter(e)
         change_dl_sysdirs()
 
     """ change permissions back """
-- 
1.8.1.5



