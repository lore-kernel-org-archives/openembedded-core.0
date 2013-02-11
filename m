Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1U52xC-0001HD-V6
	for Openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 00:38:38 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1BNMVSO015396
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2013 15:22:31 -0800 (PST)
Received: from ord-lpggp2.wrs.com (128.224.65.244) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Mon, 11 Feb 2013 15:22:31 -0800
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Mon, 11 Feb 2013 17:22:27 -0600
Message-ID: <1360624949-43859-2-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1360624949-43859-1-git-send-email-jason.wessel@windriver.com>
References: <1360624949-43859-1-git-send-email-jason.wessel@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 1/3] relocate_sdk.py: Fix corruption of sdk binaries
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
X-List-Received-Date: Mon, 11 Feb 2013 23:38:46 -0000
Content-Type: text/plain

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
---
 scripts/relocate_sdk.py |   15 ++++++++++++---
 1 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
index 74bb7a5..6f3530d 100755
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
-            dl_path = new_dl_path + "\0" * (p_filesz - len(new_dl_path))
+            dl_path = new_dl_path + "\0"
+            # External SDKs with mixed pre-compiled binaries should not get
+            # relocated so look for some variant of /lib
+            fname = f.read(11)
+            if fname.startswith("/lib/") or fname.startswith("/lib64/") or fname.startswith("/lib32/") or fname.startswith("/usr/lib32/") or fname.startswith("/usr/lib32/") or fname.startswith("/usr/lib64/"):
+                break
+            if (len(dl_path) >= p_memsz):
+                print "ERROR: could not relocate %s, interp size = %i and %i is needed." % (elf_file_name, p_memsz, len(dl_path))
+                break
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
1.7.1



