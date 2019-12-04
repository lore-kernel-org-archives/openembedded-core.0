Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 22FB97CDC0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 13:32:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2019 05:32:04 -0800
X-IronPort-AV: E=Sophos;i="5.69,277,1571727600"; d="scan'208";a="205389413"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.164.178])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2019 05:32:03 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2019 21:31:43 +0800
Message-Id: <4490da5e44b098cffc1a7cfaf08016d7cab45c1f.1575465665.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1575465665.git.anuj.mittal@intel.com>
References: <cover.1575465665.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [zeus][PATCH 02/10] gdb: Fix CVE-2019-1010180
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
X-List-Received-Date: Wed, 04 Dec 2019 13:32:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

From: Vinay Kumar <vinay.m.engg@gmail.com>

Source: git://sourceware.org/git/binutils-gdb.git
Tracking -- https://sourceware.org/bugzilla/show_bug.cgi?id=23657

Backported upstream commit 950b74950f6020eda38647f22e9077ac7f68ca49 to gdb-8.3.1 sources.

Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=950b74950f6020eda38647f22e9077ac7f68ca49]

(From OE-Core rev: 82a227e54e704ef9237c1613b9d3350fa26fe9dd)

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/gdb/gdb-8.3.1.inc       |   1 +
 .../gdb/gdb/CVE-2019-1010180.patch            | 132 ++++++++++++++++++
 2 files changed, 133 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/CVE-2019-1010180.patch

diff --git a/meta/recipes-devtools/gdb/gdb-8.3.1.inc b/meta/recipes-devtools/gdb/gdb-8.3.1.inc
index 39f1c48cc7..aec913f3ce 100644
--- a/meta/recipes-devtools/gdb/gdb-8.3.1.inc
+++ b/meta/recipes-devtools/gdb/gdb-8.3.1.inc
@@ -16,6 +16,7 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0009-Change-order-of-CFLAGS.patch \
            file://0010-resolve-restrict-keyword-conflict.patch \
            file://0011-Fix-invalid-sigprocmask-call.patch \
+           file://CVE-2019-1010180.patch \
            "
 SRC_URI[md5sum] = "73b6a5d8141672c62bf851cd34c4aa83"
 SRC_URI[sha256sum] = "1e55b4d7cdca7b34be12f4ceae651623aa73b2fd640152313f9f66a7149757c4"
diff --git a/meta/recipes-devtools/gdb/gdb/CVE-2019-1010180.patch b/meta/recipes-devtools/gdb/gdb/CVE-2019-1010180.patch
new file mode 100644
index 0000000000..46b2b3a713
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/CVE-2019-1010180.patch
@@ -0,0 +1,132 @@
+From 950b74950f6020eda38647f22e9077ac7f68ca49 Mon Sep 17 00:00:00 2001
+From: Keith Seitz <keiths@redhat.com>
+Date: Wed, 16 Oct 2019 11:33:59 -0700
+Subject: [PATCH] DWARF reader: Reject sections with invalid sizes
+
+This is another fuzzer bug, gdb/23567.  This time, the fuzzer has
+specifically altered the size of .debug_str:
+
+$ eu-readelf -S objdump
+Section Headers:
+[Nr] Name                 Type         Addr             Off      Size     ES Flags Lk Inf Al
+[31] .debug_str           PROGBITS     0000000000000000 0057116d ffffffffffffffff  1 MS     0   0  1
+
+When this file is loaded into GDB, the DWARF reader crashes attempting
+to access the string table (or it may just store a bunch of nonsense):
+
+[gdb-8.3-6-fc30]
+$ gdb -nx -q objdump
+BFD: warning: /path/to/objdump has a corrupt section with a size (ffffffffffffffff) larger than the file size
+Reading symbols from /path/to/objdump...
+Segmentation fault (core dumped)
+
+Nick has already committed a BFD patch to issue the warning seen above.
+
+[gdb master 6acc1a0b]
+$ gdb -BFD: warning: /path/to/objdump has a corrupt section with a size (ffffffffffffffff) larger than the file size
+Reading symbols from /path/to/objdump...
+(gdb) inf func
+All defined functions:
+
+File ./../include/dwarf2.def:
+186:	const
+
+              8 *>(.:
+                     ;'@�B);
+747:	const
+
+              8 *�(.:
+                     ;'@�B);
+701:	const
+
+              8 *�D �
+                     (.:
+                        ;'@�B);
+71:	const
+
+              8 *(.:
+                    ;'@�B);
+/* and more gibberish  */
+
+Consider read_indirect_string_at_offset_from:
+
+static const char *
+read_indirect_string_at_offset_from (struct objfile *objfile,
+                                     bfd *abfd, LONGEST str_offset,
+                                     struct dwarf2_section_info *sect,
+                                     const char *form_name,
+                                     const char *sect_name)
+{
+  dwarf2_read_section (objfile, sect);
+  if (sect->buffer == NULL)
+    error (_("%s used without %s section [in module %s]"),
+           form_name, sect_name, bfd_get_filename (abfd));
+  if (str_offset >= sect->size)
+    error (_("%s pointing outside of %s section [in module %s]"),
+           form_name, sect_name, bfd_get_filename (abfd));
+  gdb_assert (HOST_CHAR_BIT == 8);
+  if (sect->buffer[str_offset] == '\0')
+    return NULL;
+  return (const char *) (sect->buffer + str_offset);
+}
+
+With sect_size being ginormous, the code attempts to access
+sect->buffer[GINORMOUS], and depending on the layout of memory,
+GDB either stores a bunch of gibberish strings or crashes.
+
+This is an attempt to mitigate this by implementing a similar approach
+used by BFD. In our case, we simply reject the section with the invalid
+length:
+
+$ ./gdb -nx -q objdump
+BFD: warning: /path/to/objdump has a corrupt section with a size (ffffffffffffffff) larger than the file size
+Reading symbols from /path/to/objdump...
+
+warning: Discarding section .debug_str which has a section size (ffffffffffffffff) larger than the file size [in module /path/to/objdump]
+DW_FORM_strp used without .debug_str section [in module /path/to/objdump]
+(No debugging symbols found in /path/to/objdump)
+(gdb)
+
+Unfortunately, I have not found a way to regression test this, since it
+requires poking ELF section headers.
+
+gdb/ChangeLog:
+2019-10-16  Keith Seitz  <keiths@redhat.com>
+
+	PR gdb/23567
+	* dwarf2read.c (dwarf2_per_objfile::locate_sections): Discard
+	sections whose size is greater than the file size.
+
+Change-Id: I896ac3b4eb2207c54e8e05c16beab3051d9b4b2f
+
+CVE: CVE-2019-1010180
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=950b74950f6020eda38647f22e9077ac7f68ca49]
+[Removed Changelog entry]
+Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
+---
+ gdb/dwarf2read.c | 9 +++++++++
+ 2 files changed, 15 insertions(+)
+
+diff --git a/gdb/dwarf2read.c b/gdb/dwarf2read.c
+index 0443b55..a78f818 100644
+--- a/gdb/dwarf2read.c
++++ b/gdb/dwarf2read.c
+@@ -2338,6 +2338,15 @@ dwarf2_per_objfile::locate_sections (bfd *abfd, asection *sectp,
+   if ((aflag & SEC_HAS_CONTENTS) == 0)
+     {
+     }
++  else if (elf_section_data (sectp)->this_hdr.sh_size
++	   > bfd_get_file_size (abfd))
++    {
++      bfd_size_type size = elf_section_data (sectp)->this_hdr.sh_size;
++      warning (_("Discarding section %s which has a section size (%s"
++		 ") larger than the file size [in module %s]"),
++	       bfd_section_name (abfd, sectp), phex_nz (size, sizeof (size)),
++	       bfd_get_filename (abfd));
++    }
+   else if (section_is_p (sectp->name, &names.info))
+     {
+       this->info.s.section = sectp;
+-- 
+2.7.4
+
-- 
2.21.0


