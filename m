Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1U52xD-0001HF-GB
	for Openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 00:38:38 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1BNMWqI015399
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2013 15:22:32 -0800 (PST)
Received: from ord-lpggp2.wrs.com (128.224.65.244) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Mon, 11 Feb 2013 15:22:32 -0800
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Mon, 11 Feb 2013 17:22:29 -0600
Message-ID: <1360624949-43859-4-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1360624949-43859-1-git-send-email-jason.wessel@windriver.com>
References: <1360624949-43859-1-git-send-email-jason.wessel@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 3/3] relocate_sdk.py: allow relocate_sdk.py to work with python 2.4.x
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

Avoid the chicken / egg problem of an SDK that provides a working
python but requires that version of python to extract itself.  The
RHEL 5.x systems and some other enterprise Linux systems ship with
python 2.4.x as the default python.  We need to at least be able to
extract work executables even if we never use the the host provided
python again.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 scripts/relocate_sdk.py |   26 +++++++++++++-------------
 1 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
index 6f3530d..b7e579d 100755
--- a/scripts/relocate_sdk.py
+++ b/scripts/relocate_sdk.py
@@ -55,22 +55,22 @@ def parse_elf_header():
 
     if arch == 32:
         # 32bit
-        hdr_struct = struct.Struct("<HHILLLIHHHHHH")
+        hdr_fmt = "<HHILLLIHHHHHH"
         hdr_size = 52
     else:
         # 64bit
-        hdr_struct = struct.Struct("<HHIQQQIHHHHHH")
+        hdr_fmt = "<HHIQQQIHHHHHH"
         hdr_size = 64
 
     e_type, e_machine, e_version, e_entry, e_phoff, e_shoff, e_flags,\
     e_ehsize, e_phentsize, e_phnum, e_shentsize, e_shnum, e_shstrndx =\
-        hdr_struct.unpack(elf_header[16:hdr_size])
+        struct.unpack(hdr_fmt, elf_header[16:hdr_size])
 
 def change_interpreter(elf_file_name):
     if arch == 32:
-        ph_struct = struct.Struct("<IIIIIIII")
+        ph_fmt = "<IIIIIIII"
     else:
-        ph_struct = struct.Struct("<IIQQQQQQ")
+        ph_fmt = "<IIQQQQQQ"
 
     """ look for PT_INTERP section """
     for i in range(0,e_phnum):
@@ -79,11 +79,11 @@ def change_interpreter(elf_file_name):
         if arch == 32:
             # 32bit
             p_type, p_offset, p_vaddr, p_paddr, p_filesz,\
-                p_memsz, p_flags, p_align = ph_struct.unpack(ph_hdr)
+                p_memsz, p_flags, p_align = struct.unpack(ph_fmt, ph_hdr)
         else:
             # 64bit
             p_type, p_flags, p_offset, p_vaddr, p_paddr, \
-            p_filesz, p_memsz, p_align = ph_struct.unpack(ph_hdr)
+            p_filesz, p_memsz, p_align = struct.unpack(ph_fmt, ph_hdr)
 
         """ change interpreter """
         if p_type == 3:
@@ -104,9 +104,9 @@ def change_interpreter(elf_file_name):
 
 def change_dl_sysdirs():
     if arch == 32:
-        sh_struct = struct.Struct("<IIIIIIIIII")
+        sh_fmt = "<IIIIIIIIII"
     else:
-        sh_struct = struct.Struct("<IIQQQQIIQQ")
+        sh_fmt = "<IIQQQQIIQQ"
 
     """ read section string table """
     f.seek(e_shoff + e_shstrndx * e_shentsize)
@@ -127,7 +127,7 @@ def change_dl_sysdirs():
         sh_hdr = f.read(e_shentsize)
 
         sh_name, sh_type, sh_flags, sh_addr, sh_offset, sh_size, sh_link,\
-            sh_info, sh_addralign, sh_entsize = sh_struct.unpack(sh_hdr)
+            sh_info, sh_addralign, sh_entsize = struct.unpack(sh_fmt, sh_hdr)
 
         name = sh_strtab[sh_name:sh_strtab.find("\0", sh_name)]
 
@@ -181,7 +181,7 @@ def change_dl_sysdirs():
 
 # MAIN
 if len(sys.argv) < 4:
-    exit(-1)
+    sys.exit(-1)
 
 new_prefix = sys.argv[1]
 new_dl_path = sys.argv[2]
@@ -196,14 +196,14 @@ for e in executables_list:
 
     try:
         f = open(e, "r+b")
-    except IOError as ioex:
+    except IOError, ioex:
         if ioex.errno == errno.ETXTBSY:
             print("Could not open %s. File used by another process.\nPlease "\
                   "make sure you exit all processes that might use any SDK "\
                   "binaries." % e)
         else:
             print("Could not open %s: %s(%d)" % (e, ioex.strerror, ioex.errno))
-        exit(-1)
+        sys.exit(-1)
 
     arch = get_arch()
     if arch:
-- 
1.7.1



