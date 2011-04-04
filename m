Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Q6pQF-00080h-N8
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Apr 2011 21:26:50 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 04 Apr 2011 12:24:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,299,1299484800"; d="scan'208";a="623424152"
Received: from nbuild1.sc.intel.com (HELO localhost) ([172.25.110.36])
	by orsmga002.jf.intel.com with ESMTP; 04 Apr 2011 12:24:40 -0700
Message-Id: <b8ccdd03f8431e32fea8249ecdf68e2866a4a068.1301921659.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1301921659.git.nitin.a.kamble@intel.com>
References: <cover.1301921659.git.nitin.a.kamble@intel.com>
Old-Date: Tue, 29 Mar 2011 12:55:18 -0700
Date: Mon, 04 Apr 2011  5:56:21 -0700
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 3/3] ldconfig-native-2.12.1: newer recipe with eglibc sources
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
X-List-Received-Date: Mon, 04 Apr 2011 19:26:50 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This fixes [YOCTO #780]

Handle the input/output data with different endian-ness correctly
Also fix the definition of LD_SO for cross environment

And remove the older 2.5 version of ldconfig-native recipe

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../ldconfig-native-2.12.1}/32and64bit.patch       |   94 +++--
 .../eglibc/ldconfig-native-2.12.1/README           |    8 +
 .../endian-ness_handling.patch                     |  451 ++++++++++++++++++++
 .../eglibc/ldconfig-native-2.12.1/flag_fix.patch   |   22 +
 .../ldconfig-native-2.12.1.tar.bz2                 |  Bin 0 -> 21491 bytes
 .../ldconfig-native-2.12.1}/ldconfig.patch         |  125 +++---
 .../ldconfig_aux-cache_path_fix.patch              |   34 ++
 meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb |   27 ++
 .../ldconfig-native-2.5.tar.bz2                    |  Bin 19454 -> 0 bytes
 meta/recipes-core/glibc/ldconfig-native_2.5.bb     |   24 -
 10 files changed, 672 insertions(+), 113 deletions(-)
 rename meta/recipes-core/{glibc/ldconfig-native-2.5 => eglibc/ldconfig-native-2.12.1}/32and64bit.patch (78%)
 create mode 100644 meta/recipes-core/eglibc/ldconfig-native-2.12.1/README
 create mode 100644 meta/recipes-core/eglibc/ldconfig-native-2.12.1/endian-ness_handling.patch
 create mode 100644 meta/recipes-core/eglibc/ldconfig-native-2.12.1/flag_fix.patch
 create mode 100644 meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig-native-2.12.1.tar.bz2
 rename meta/recipes-core/{glibc/ldconfig-native-2.5 => eglibc/ldconfig-native-2.12.1}/ldconfig.patch (84%)
 create mode 100644 meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig_aux-cache_path_fix.patch
 create mode 100644 meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
 delete mode 100644 meta/recipes-core/glibc/ldconfig-native-2.5/ldconfig-native-2.5.tar.bz2
 delete mode 100644 meta/recipes-core/glibc/ldconfig-native_2.5.bb

diff --git a/meta/recipes-core/glibc/ldconfig-native-2.5/32and64bit.patch b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/32and64bit.patch
similarity index 78%
rename from meta/recipes-core/glibc/ldconfig-native-2.5/32and64bit.patch
rename to meta/recipes-core/eglibc/ldconfig-native-2.12.1/32and64bit.patch
index 4f8d3a3..8069c89 100644
--- a/meta/recipes-core/glibc/ldconfig-native-2.5/32and64bit.patch
+++ b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/32and64bit.patch
@@ -1,8 +1,8 @@
-Index: ldconfig-native-2.5/readelflib.c
+Index: ldconfig-native-2.12.1/readelflib.c
 ===================================================================
---- ldconfig-native-2.5.orig/readelflib.c	2009-05-19 09:40:17.000000000 +0100
-+++ ldconfig-native-2.5/readelflib.c	2009-05-19 09:56:18.000000000 +0100
-@@ -40,38 +40,190 @@
+--- ldconfig-native-2.12.1.orig/readelflib.c
++++ ldconfig-native-2.12.1/readelflib.c
+@@ -40,39 +40,212 @@ do								\
  
  /* Returns 0 if everything is ok, != 0 in case of error.  */
  int
@@ -33,7 +33,8 @@ Index: ldconfig-native-2.5/readelflib.c
  
 -  if (elf_header->e_ident [EI_CLASS] != ElfW (CLASS))
 +  if (elf_header->e_type != ET_DYN)
-+    {
+     {
+-      if (opt_verbose)
 +      error (0, 0, _("%s is not a shared object file (Type: %d).\n"), file_name,
 +	     elf_header->e_type);
 +      return 1;
@@ -53,8 +54,7 @@ Index: ldconfig-native-2.5/readelflib.c
 +  program_interpreter = NULL;
 +  for (i = 0, segment = elf_pheader;
 +       i < elf_header->e_phnum; i++, segment++)
-     {
--      if (opt_verbose)
++    {
 +      check_ptr (segment);
 +
 +      switch (segment->p_type)
@@ -93,25 +93,45 @@ Index: ldconfig-native-2.5/readelflib.c
 +	  break;
 +
 +	case PT_NOTE:
-+	  if (!*osversion && segment->p_filesz == 32 && segment->p_align >= 4)
++	  if (!*osversion && segment->p_filesz >= 32 && segment->p_align >= 4)
 +	    {
 +	      Elf32_Word *abi_note = (Elf32_Word *) (file_contents
 +						     + segment->p_offset);
-+	      if (abi_note [0] == 4 && abi_note [1] == 16 && abi_note [2] == 1
-+		  && memcmp (abi_note + 3, "GNU", 4) == 0)
-+		*osversion = (abi_note [4] << 24) |
-+			     ((abi_note [5] & 0xff) << 16) |
-+			     ((abi_note [6] & 0xff) << 8) |
-+			     (abi_note [7] & 0xff);
++	      Elf32_Addr size = segment->p_filesz;
++
++	      while (abi_note [0] != 4 || abi_note [1] != 16
++		     || abi_note [2] != 1
++		     || memcmp (abi_note + 3, "GNU", 4) != 0)
++		{
++#define ROUND(len) (((len) + sizeof (Elf32_Word)) - 1) & -sizeof (Elf32_Word)))
++		  Elf32_Addr) note_size = 3 * sizeof (Elf32_Word))
++					 + ROUND (abi_note[0])
++					 + ROUND (abi_note[1]);
++
++		  if (size - 32 < note_size || note_size == 0)
++		    {
++		      size = 0;
++		      break;
++		    }
++		  size -= note_size;
++		  abi_note = (void *) abi_note + note_size;
++		}
++
++	      if (size == 0)
++		break;
++
++	      *osversion = (abi_note [4] << 24) |
++			   ((abi_note [5] & 0xff) << 16) |
++			   ((abi_note [6] & 0xff) << 8) |
++			   (abi_note [7] & 0xff);
 +	    }
 +	  break;
 +
 +	default:
 +	  break;
- 	}
--      return 1;
++	}
 +
-     }
++    }
 +  if (loadaddr == (Elf32_Addr) -1)
 +    {
 +      /* Very strange. */
@@ -136,9 +156,10 @@ Index: ldconfig-native-2.5/readelflib.c
 +	  dynamic_strings = (char *) (file_contents + dyn_entry->d_un.d_val - loadaddr);
 +	  check_ptr (dynamic_strings);
 +	  break;
-+	}
-+    }
-+
+ 	}
+-      return 1;
+     }
+ 
 +  if (dynamic_strings == NULL)
 +    return 1;
 +
@@ -205,10 +226,11 @@ Index: ldconfig-native-2.5/readelflib.c
 +
 +  elf_header = (Elf64_Ehdr *) file_contents;
 +  *osversion = 0;
- 
++
    if (elf_header->e_type != ET_DYN)
      {
-@@ -81,7 +233,7 @@
+       error (0, 0, _("%s is not a shared object file (Type: %d).\n"), file_name,
+@@ -81,7 +254,7 @@ process_elf_file (const char *file_name,
      }
  
    /* Get information from elf program header.  */
@@ -217,7 +239,7 @@ Index: ldconfig-native-2.5/readelflib.c
    check_ptr (elf_pheader);
  
    /* The library is an elf library, now search for soname and
-@@ -100,7 +252,7 @@
+@@ -100,7 +273,7 @@ process_elf_file (const char *file_name,
        switch (segment->p_type)
  	{
  	case PT_LOAD:
@@ -226,16 +248,28 @@ Index: ldconfig-native-2.5/readelflib.c
  	    loadaddr = segment->p_vaddr - segment->p_offset;
  	  break;
  
-@@ -129,7 +281,7 @@
+@@ -129,16 +302,16 @@ process_elf_file (const char *file_name,
  	case PT_NOTE:
- 	  if (!*osversion && segment->p_filesz == 32 && segment->p_align >= 4)
+ 	  if (!*osversion && segment->p_filesz >= 32 && segment->p_align >= 4)
  	    {
 -	      ElfW(Word) *abi_note = (ElfW(Word) *) (file_contents
 +	      Elf64_Word *abi_note = (Elf64_Word *) (file_contents
  						     + segment->p_offset);
- 	      if (abi_note [0] == 4 && abi_note [1] == 16 && abi_note [2] == 1
- 		  && memcmp (abi_note + 3, "GNU", 4) == 0)
-@@ -145,7 +297,7 @@
+-	      ElfW(Addr) size = segment->p_filesz;
++	      Elf64_Addr size = segment->p_filesz;
+ 
+ 	      while (abi_note [0] != 4 || abi_note [1] != 16
+ 		     || abi_note [2] != 1
+ 		     || memcmp (abi_note + 3, "GNU", 4) != 0)
+ 		{
+-#define ROUND(len) (((len) + sizeof (ElfW(Word)) - 1) & -sizeof (ElfW(Word)))
+-		  ElfW(Addr) note_size = 3 * sizeof (ElfW(Word))
++#define ROUND(len) (((len) + sizeof (Elf64_Word) - 1) & -sizeof (Elf64_Word))
++		  Elf64_Addr note_size = 3 * sizeof (Elf64_Word)
+ 					 + ROUND (abi_note[0])
+ 					 + ROUND (abi_note[1]);
+ 
+@@ -166,7 +339,7 @@ process_elf_file (const char *file_name,
  	}
  
      }
@@ -244,7 +278,7 @@ Index: ldconfig-native-2.5/readelflib.c
      {
        /* Very strange. */
        loadaddr = 0;
-@@ -155,7 +307,7 @@
+@@ -176,7 +349,7 @@ process_elf_file (const char *file_name,
    if (dynamic_size == 0)
      return 1;
  
@@ -253,7 +287,7 @@ Index: ldconfig-native-2.5/readelflib.c
    check_ptr (dynamic_segment);
  
    /* Find the string table.  */
-@@ -218,3 +370,33 @@
+@@ -233,3 +406,33 @@ process_elf_file (const char *file_name,
  
    return 0;
  }
diff --git a/meta/recipes-core/eglibc/ldconfig-native-2.12.1/README b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/README
new file mode 100644
index 0000000..43fb983
--- /dev/null
+++ b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/README
@@ -0,0 +1,8 @@
+The files are pulled verbatim from glibc 2.5 and then patched to allow
+standalone compilation of ldconfig.
+
+Richard Purdie
+OpenedHand Ltd.
+
+Upgraded the ldconfig recipe to eglibc 2.12.1
+Nitin A Kamble <nitin.a.kamble@intel.com> 2011/03/29
diff --git a/meta/recipes-core/eglibc/ldconfig-native-2.12.1/endian-ness_handling.patch b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/endian-ness_handling.patch
new file mode 100644
index 0000000..77ba03c
--- /dev/null
+++ b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/endian-ness_handling.patch
@@ -0,0 +1,451 @@
+Do data input/output handling according to endien-ness of the library file.
+
+2011/04/04
+Richard Purdie <richard.purdie@linuxfoundation.org>
+Nitin Kamble <nitin.a.kamble@intel.com>
+
+Index: ldconfig-native-2.12.1/readelflib.c
+===================================================================
+--- ldconfig-native-2.12.1.orig/readelflib.c
++++ ldconfig-native-2.12.1/readelflib.c
+@@ -38,6 +38,28 @@ do								\
+   }								\
+  while (0);
+ 
++int be;
++static uint16_t read16(uint16_t x, int be)
++{
++  if (be)
++        return be16toh(x);
++  return le16toh(x);
++}
++
++static uint32_t read32(uint32_t x, int be)
++{
++  if (be)
++        return be32toh(x);
++  return le32toh(x);
++}
++
++static uint64_t read64(uint64_t x, int be)
++{
++  if (be)
++        return be64toh(x);
++  return le64toh(x);
++}
++
+ /* Returns 0 if everything is ok, != 0 in case of error.  */
+ int
+ process_elf_file32 (const char *file_name, const char *lib, int *flag,
+@@ -59,15 +81,17 @@ process_elf_file32 (const char *file_nam
+   elf_header = (Elf32_Ehdr *) file_contents;
+   *osversion = 0;
+ 
+-  if (elf_header->e_type != ET_DYN)
++  be = (elf_header->e_ident[EI_DATA] == ELFDATA2MSB);
++
++  if (read16(elf_header->e_type, be) != ET_DYN)
+     {
+       error (0, 0, _("%s is not a shared object file (Type: %d).\n"), file_name,
+-	     elf_header->e_type);
++	     read16(elf_header->e_type, be));
+       return 1;
+     }
+ 
+   /* Get information from elf program header.  */
+-  elf_pheader = (Elf32_Phdr *) (elf_header->e_phoff + file_contents);
++  elf_pheader = (Elf32_Phdr *) (read32(elf_header->e_phoff, be) + file_contents);
+   check_ptr (elf_pheader);
+ 
+   /* The library is an elf library, now search for soname and
+@@ -79,27 +103,27 @@ process_elf_file32 (const char *file_nam
+   dynamic_size = 0;
+   program_interpreter = NULL;
+   for (i = 0, segment = elf_pheader;
+-       i < elf_header->e_phnum; i++, segment++)
++       i < read16(elf_header->e_phnum, be); i++, segment++)
+     {
+       check_ptr (segment);
+ 
+-      switch (segment->p_type)
++      switch (read32(segment->p_type, be))
+ 	{
+ 	case PT_LOAD:
+ 	  if (loadaddr == (Elf32_Addr) -1)
+-	    loadaddr = segment->p_vaddr - segment->p_offset;
++	    loadaddr = read32(segment->p_vaddr, be) - read32(segment->p_offset, be);
+ 	  break;
+ 
+ 	case PT_DYNAMIC:
+ 	  if (dynamic_addr)
+ 	    error (0, 0, _("more than one dynamic segment\n"));
+ 
+-	  dynamic_addr = segment->p_offset;
+-	  dynamic_size = segment->p_filesz;
++	  dynamic_addr = read32(segment->p_offset, be);
++	  dynamic_size = read32(segment->p_filesz, be);
+ 	  break;
+ 
+ 	case PT_INTERP:
+-	  program_interpreter = (char *) (file_contents + segment->p_offset);
++	  program_interpreter = (char *) (file_contents + read32(segment->p_offset, be));
+ 	  check_ptr (program_interpreter);
+ 
+ 	  /* Check if this is enough to classify the binary.  */
+@@ -113,20 +137,20 @@ process_elf_file32 (const char *file_nam
+ 	  break;
+ 
+ 	case PT_NOTE:
+-	  if (!*osversion && segment->p_filesz >= 32 && segment->p_align >= 4)
++	  if (!*osversion && read32(segment->p_filesz, be) >= 32 && segment->p_align >= 4)
+ 	    {
+ 	      Elf32_Word *abi_note = (Elf32_Word *) (file_contents
+-						     + segment->p_offset);
+-	      Elf32_Addr size = segment->p_filesz;
++						     + read32(segment->p_offset, be));
++	      Elf32_Addr size = read32(segment->p_filesz, be);
+ 
+-	      while (abi_note [0] != 4 || abi_note [1] != 16
+-		     || abi_note [2] != 1
++	      while (read32(abi_note [0], be) != 4 || read32(abi_note [1], be) != 16
++		     || read32(abi_note [2], be) != 1
+ 		     || memcmp (abi_note + 3, "GNU", 4) != 0)
+ 		{
+-#define ROUND(len) (((len) + sizeof (Elf32_Word)) - 1) & -sizeof (Elf32_Word)))
+-		  Elf32_Addr) note_size = 3 * sizeof (Elf32_Word))
+-					 + ROUND (abi_note[0])
+-					 + ROUND (abi_note[1]);
++#define ROUND(len) (((len) + sizeof (Elf32_Word) - 1) & -sizeof (Elf32_Word))
++		  Elf32_Addr note_size = 3 * sizeof (Elf32_Word)
++					 + ROUND (read32(abi_note[0], be))
++					 + ROUND (read32(abi_note[1], be));
+ 
+ 		  if (size - 32 < note_size || note_size == 0)
+ 		    {
+@@ -140,10 +164,10 @@ process_elf_file32 (const char *file_nam
+ 	      if (size == 0)
+ 		break;
+ 
+-	      *osversion = (abi_note [4] << 24) |
+-			   ((abi_note [5] & 0xff) << 16) |
+-			   ((abi_note [6] & 0xff) << 8) |
+-			   (abi_note [7] & 0xff);
++	      *osversion = (read32(abi_note [4], be) << 24) |
++			   ((read32(abi_note [5], be) & 0xff) << 16) |
++			   ((read32(abi_note [6], be) & 0xff) << 8) |
++			   (read32(abi_note [7], be) & 0xff);
+ 	    }
+ 	  break;
+ 
+@@ -167,13 +191,13 @@ process_elf_file32 (const char *file_nam
+ 
+   /* Find the string table.  */
+   dynamic_strings = NULL;
+-  for (dyn_entry = dynamic_segment; dyn_entry->d_tag != DT_NULL;
++  for (dyn_entry = dynamic_segment; read32(dyn_entry->d_tag, be) != DT_NULL;
+        ++dyn_entry)
+     {
+       check_ptr (dyn_entry);
+-      if (dyn_entry->d_tag == DT_STRTAB)
++      if (read32(dyn_entry->d_tag, be) == DT_STRTAB)
+ 	{
+-	  dynamic_strings = (char *) (file_contents + dyn_entry->d_un.d_val - loadaddr);
++	  dynamic_strings = (char *) (file_contents + read32(dyn_entry->d_un.d_val, be) - loadaddr);
+ 	  check_ptr (dynamic_strings);
+ 	  break;
+ 	}
+@@ -183,15 +207,15 @@ process_elf_file32 (const char *file_nam
+     return 1;
+ 
+   /* Now read the DT_NEEDED and DT_SONAME entries.  */
+-  for (dyn_entry = dynamic_segment; dyn_entry->d_tag != DT_NULL;
++  for (dyn_entry = dynamic_segment; read32(dyn_entry->d_tag, be) != DT_NULL;
+        ++dyn_entry)
+     {
+-      if (dyn_entry->d_tag == DT_NEEDED || dyn_entry->d_tag == DT_SONAME)
++      if (read32(dyn_entry->d_tag, be) == DT_NEEDED || read32(dyn_entry->d_tag, be) == DT_SONAME)
+ 	{
+-	  char *name = dynamic_strings + dyn_entry->d_un.d_val;
++	  char *name = dynamic_strings + read32(dyn_entry->d_un.d_val, be);
+ 	  check_ptr (name);
+ 
+-	  if (dyn_entry->d_tag == DT_NEEDED)
++	  if (read32(dyn_entry->d_tag, be) == DT_NEEDED)
+ 	    {
+ 
+ 	      if (*flag == FLAG_ELF)
+@@ -208,7 +232,7 @@ process_elf_file32 (const char *file_nam
+ 		}
+ 	    }
+ 
+-	  else if (dyn_entry->d_tag == DT_SONAME)
++	  else if (read32(dyn_entry->d_tag, be) == DT_SONAME)
+ 	    *soname = xstrdup (name);
+ 
+ 	  /* Do we have everything we need?  */
+@@ -246,15 +270,17 @@ process_elf_file64 (const char *file_nam
+   elf_header = (Elf64_Ehdr *) file_contents;
+   *osversion = 0;
+ 
+-  if (elf_header->e_type != ET_DYN)
++  be = (elf_header->e_ident[EI_DATA] == ELFDATA2MSB);
++
++  if (read16(elf_header->e_type, be) != ET_DYN)
+     {
+       error (0, 0, _("%s is not a shared object file (Type: %d).\n"), file_name,
+-	     elf_header->e_type);
++	     read16(elf_header->e_type, be));
+       return 1;
+     }
+ 
+   /* Get information from elf program header.  */
+-  elf_pheader = (Elf64_Phdr *) (elf_header->e_phoff + file_contents);
++  elf_pheader = (Elf64_Phdr *) (read64(elf_header->e_phoff, be) + file_contents);
+   check_ptr (elf_pheader);
+ 
+   /* The library is an elf library, now search for soname and
+@@ -266,27 +292,27 @@ process_elf_file64 (const char *file_nam
+   dynamic_size = 0;
+   program_interpreter = NULL;
+   for (i = 0, segment = elf_pheader;
+-       i < elf_header->e_phnum; i++, segment++)
++       i < read16(elf_header->e_phnum, be); i++, segment++)
+     {
+       check_ptr (segment);
+ 
+-      switch (segment->p_type)
++      switch (read32(segment->p_type, be))
+ 	{
+ 	case PT_LOAD:
+ 	  if (loadaddr == (Elf64_Addr) -1)
+-	    loadaddr = segment->p_vaddr - segment->p_offset;
++	    loadaddr = read64(segment->p_vaddr, be) - read64(segment->p_offset, be);
+ 	  break;
+ 
+ 	case PT_DYNAMIC:
+ 	  if (dynamic_addr)
+ 	    error (0, 0, _("more than one dynamic segment\n"));
+ 
+-	  dynamic_addr = segment->p_offset;
+-	  dynamic_size = segment->p_filesz;
++	  dynamic_addr = read64(segment->p_offset, be);
++	  dynamic_size = read32(segment->p_filesz, be);
+ 	  break;
+ 
+ 	case PT_INTERP:
+-	  program_interpreter = (char *) (file_contents + segment->p_offset);
++	  program_interpreter = (char *) (file_contents + read64(segment->p_offset, be));
+ 	  check_ptr (program_interpreter);
+ 
+ 	  /* Check if this is enough to classify the binary.  */
+@@ -300,20 +326,21 @@ process_elf_file64 (const char *file_nam
+ 	  break;
+ 
+ 	case PT_NOTE:
+-	  if (!*osversion && segment->p_filesz >= 32 && segment->p_align >= 4)
++	  if (!*osversion && read32(segment->p_filesz, be) >= 32 && read32(segment->p_align, be) >= 4)
+ 	    {
+ 	      Elf64_Word *abi_note = (Elf64_Word *) (file_contents
+-						     + segment->p_offset);
+-	      Elf64_Addr size = segment->p_filesz;
++						     + read64(segment->p_offset, be));
++	      Elf64_Addr size = read32(segment->p_filesz, be);
+ 
+-	      while (abi_note [0] != 4 || abi_note [1] != 16
+-		     || abi_note [2] != 1
++	      while (read32(abi_note [0], be) != 4 || read32(abi_note [1], be) != 16
++		     || read32(abi_note [2], be) != 1
+ 		     || memcmp (abi_note + 3, "GNU", 4) != 0)
+ 		{
++#undef ROUND
+ #define ROUND(len) (((len) + sizeof (Elf64_Word) - 1) & -sizeof (Elf64_Word))
+ 		  Elf64_Addr note_size = 3 * sizeof (Elf64_Word)
+-					 + ROUND (abi_note[0])
+-					 + ROUND (abi_note[1]);
++					 + ROUND (read32(abi_note[0], be))
++					 + ROUND (read32(abi_note[1], be));
+ 
+ 		  if (size - 32 < note_size || note_size == 0)
+ 		    {
+@@ -327,10 +354,10 @@ process_elf_file64 (const char *file_nam
+ 	      if (size == 0)
+ 		break;
+ 
+-	      *osversion = (abi_note [4] << 24) |
+-			   ((abi_note [5] & 0xff) << 16) |
+-			   ((abi_note [6] & 0xff) << 8) |
+-			   (abi_note [7] & 0xff);
++	      *osversion = (read32(abi_note [4], be) << 24) |
++			   ((read32(abi_note [5], be) & 0xff) << 16) |
++			   ((read32(abi_note [6], be) & 0xff) << 8) |
++			   (read32(abi_note [7], be) & 0xff);
+ 	    }
+ 	  break;
+ 
+@@ -354,13 +381,13 @@ process_elf_file64 (const char *file_nam
+ 
+   /* Find the string table.  */
+   dynamic_strings = NULL;
+-  for (dyn_entry = dynamic_segment; dyn_entry->d_tag != DT_NULL;
++  for (dyn_entry = dynamic_segment; read64(dyn_entry->d_tag, be) != DT_NULL;
+        ++dyn_entry)
+     {
+       check_ptr (dyn_entry);
+-      if (dyn_entry->d_tag == DT_STRTAB)
++      if (read64(dyn_entry->d_tag, be) == DT_STRTAB)
+ 	{
+-	  dynamic_strings = (char *) (file_contents + dyn_entry->d_un.d_val - loadaddr);
++	  dynamic_strings = (char *) (file_contents + read64(dyn_entry->d_un.d_val, be) - loadaddr);
+ 	  check_ptr (dynamic_strings);
+ 	  break;
+ 	}
+@@ -370,15 +397,15 @@ process_elf_file64 (const char *file_nam
+     return 1;
+ 
+   /* Now read the DT_NEEDED and DT_SONAME entries.  */
+-  for (dyn_entry = dynamic_segment; dyn_entry->d_tag != DT_NULL;
++  for (dyn_entry = dynamic_segment; read64(dyn_entry->d_tag, be) != DT_NULL;
+        ++dyn_entry)
+     {
+-      if (dyn_entry->d_tag == DT_NEEDED || dyn_entry->d_tag == DT_SONAME)
++      if (read64(dyn_entry->d_tag, be) == DT_NEEDED || read64(dyn_entry->d_tag, be) == DT_SONAME)
+ 	{
+-	  char *name = dynamic_strings + dyn_entry->d_un.d_val;
++	  char *name = dynamic_strings + read64(dyn_entry->d_un.d_val, be);
+ 	  check_ptr (name);
+ 
+-	  if (dyn_entry->d_tag == DT_NEEDED)
++	  if (read64(dyn_entry->d_tag, be) == DT_NEEDED)
+ 	    {
+ 
+ 	      if (*flag == FLAG_ELF)
+@@ -395,7 +422,7 @@ process_elf_file64 (const char *file_nam
+ 		}
+ 	    }
+ 
+-	  else if (dyn_entry->d_tag == DT_SONAME)
++	  else if (read64(dyn_entry->d_tag, be) == DT_SONAME)
+ 	    *soname = xstrdup (name);
+ 
+ 	  /* Do we have everything we need?  */
+Index: ldconfig-native-2.12.1/readlib.c
+===================================================================
+--- ldconfig-native-2.12.1.orig/readlib.c
++++ ldconfig-native-2.12.1/readlib.c
+@@ -169,7 +169,8 @@ process_file (const char *real_file_name
+       ret = 1;
+     }
+   /* Libraries have to be shared object files.  */
+-  else if (elf_header->e_type != ET_DYN)
++  else if ((elf_header->e_ident[EI_DATA] == ELFDATA2MSB && be16toh(elf_header->e_type) != ET_DYN) ||
++      (elf_header->e_ident[EI_DATA] == ELFDATA2LSB && le16toh(elf_header->e_type) != ET_DYN))
+     ret = 1;
+   else if (process_elf_file (file_name, lib, flag, osversion, soname,
+ 			     file_contents, statbuf.st_size))
+Index: ldconfig-native-2.12.1/cache.c
+===================================================================
+--- ldconfig-native-2.12.1.orig/cache.c
++++ ldconfig-native-2.12.1/cache.c
+@@ -39,6 +39,29 @@
+ # define N_(msgid)  msgid
+ #define _(msg) msg
+ 
++extern int be;
++
++static uint16_t write16(uint16_t x, int be)
++{
++  if (be)
++        return htobe16(x);
++  return htole16(x);
++}
++
++static uint32_t write32(uint32_t x, int be)
++{
++  if (be)
++        return htobe32(x);
++  return htole32(x);
++}
++
++static uint64_t write64(uint64_t x, int be)
++{
++  if (be)
++        return htobe64(x);
++  return htole64(x);
++}
++
+ struct cache_entry
+ {
+   char *lib;			/* Library name.  */
+@@ -279,7 +302,12 @@ save_cache (const char *cache_name)
+   /* Number of normal cache entries.  */
+   int cache_entry_old_count = 0;
+ 
+-  for (entry = entries; entry != NULL; entry = entry->next)
++    if (be)
++      printf("saving cache in big endian encoding\n");
++    else
++      printf("saving cache in little endian encoding\n");
++
++    for (entry = entries; entry != NULL; entry = entry->next)
+     {
+       /* Account the final NULs.  */
+       total_strlen += strlen (entry->lib) + strlen (entry->path) + 2;
+@@ -310,7 +338,7 @@ save_cache (const char *cache_name)
+       memset (file_entries, '\0', sizeof (struct cache_file));
+       memcpy (file_entries->magic, CACHEMAGIC, sizeof CACHEMAGIC - 1);
+ 
+-      file_entries->nlibs = cache_entry_old_count;
++      file_entries->nlibs = write32(cache_entry_old_count, be);
+     }
+ 
+   struct cache_file_new *file_entries_new = NULL;
+@@ -330,8 +358,8 @@ save_cache (const char *cache_name)
+       memcpy (file_entries_new->version, CACHE_VERSION,
+ 	      sizeof CACHE_VERSION - 1);
+ 
+-      file_entries_new->nlibs = cache_entry_count;
+-      file_entries_new->len_strings = total_strlen;
++      file_entries_new->nlibs = write32(cache_entry_count, be);
++      file_entries_new->len_strings = write32(total_strlen, be);
+     }
+ 
+   /* Pad for alignment of cache_file_new.  */
+@@ -358,9 +386,9 @@ save_cache (const char *cache_name)
+       /* First the library.  */
+       if (opt_format != 2 && entry->hwcap == 0)
+ 	{
+-	  file_entries->libs[idx_old].flags = entry->flags;
++	  file_entries->libs[idx_old].flags = write32(entry->flags, be);
+ 	  /* XXX: Actually we can optimize here and remove duplicates.  */
+-	  file_entries->libs[idx_old].key = str_offset + pad;
++	  file_entries->libs[idx_old].key = write32(str_offset + pad, be);
+ 	}
+       if (opt_format != 0)
+ 	{
+@@ -368,10 +396,10 @@ save_cache (const char *cache_name)
+ 	     not doing so makes the code easier, the string table
+ 	     always begins at the beginning of the the new cache
+ 	     struct.  */
+-	  file_entries_new->libs[idx_new].flags = entry->flags;
+-	  file_entries_new->libs[idx_new].osversion = entry->osversion;
+-	  file_entries_new->libs[idx_new].hwcap = entry->hwcap;
+-	  file_entries_new->libs[idx_new].key = str_offset;
++	  file_entries_new->libs[idx_new].flags = write32(entry->flags, be);
++	  file_entries_new->libs[idx_new].osversion = write32(entry->osversion, be);
++	  file_entries_new->libs[idx_new].hwcap = write64(entry->hwcap, be);
++	  file_entries_new->libs[idx_new].key = write32(str_offset, be);
+ 	}
+ 
+       size_t len = strlen (entry->lib) + 1;
+@@ -379,9 +407,9 @@ save_cache (const char *cache_name)
+       str_offset += len;
+       /* Then the path.  */
+       if (opt_format != 2 && entry->hwcap == 0)
+-	file_entries->libs[idx_old].value = str_offset + pad;
++	file_entries->libs[idx_old].value = write32(str_offset + pad, be);
+       if (opt_format != 0)
+-	file_entries_new->libs[idx_new].value = str_offset;
++	file_entries_new->libs[idx_new].value = write32(str_offset, be);
+       len = strlen (entry->path) + 1;
+       str = mempcpy (str, entry->path, len);
+       str_offset += len;
diff --git a/meta/recipes-core/eglibc/ldconfig-native-2.12.1/flag_fix.patch b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/flag_fix.patch
new file mode 100644
index 0000000..b148553
--- /dev/null
+++ b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/flag_fix.patch
@@ -0,0 +1,22 @@
+The native version of ldconfig was using native definition of LD_SO (i.e. 
+ld-linux-x86-64.so.2 ) which is not correct for doing the cross ldconfig.
+This was causing libc.so on the target marked as ELF lib rather than 
+FLAG_ELF_LIBC6 in the ld.so.cache.
+
+Nitin A Kamble <nitin.a.kamble@intel.com> 2011/04/4
+
+Index: ldconfig-native-2.12.1/readlib.c
+===================================================================
+--- ldconfig-native-2.12.1.orig/readlib.c
++++ ldconfig-native-2.12.1/readlib.c
+@@ -51,6 +51,10 @@ struct known_names
+   int flag;
+ };
+ 
++/* don't use host's definition of LD_SO */
++#undef LD_SO 
++#define LD_SO "ld.so.1"
++
+ static struct known_names interpreters[] =
+ {
+   { "/lib/" LD_SO, FLAG_ELF_LIBC6 },
diff --git a/meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig-native-2.12.1.tar.bz2 b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig-native-2.12.1.tar.bz2
new file mode 100644
index 0000000000000000000000000000000000000000..dc1e79888e9bf28226cf18513ebd4478ec90175f
GIT binary patch
literal 21491
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%0DHdO4>d<dmgwq7hnwA~>6vabfI8
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

literal 0
HcmV?d00001

diff --git a/meta/recipes-core/glibc/ldconfig-native-2.5/ldconfig.patch b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig.patch
similarity index 84%
rename from meta/recipes-core/glibc/ldconfig-native-2.5/ldconfig.patch
rename to meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig.patch
index d143a07..52ab64c 100644
--- a/meta/recipes-core/glibc/ldconfig-native-2.5/ldconfig.patch
+++ b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig.patch
@@ -8,11 +8,11 @@
  xstrdup.c      |   11 --
  7 files changed, 45 insertions(+), 256 deletions(-)
 
-Index: 1/cache.c
+Index: ldconfig-native-2.12.1/cache.c
 ===================================================================
---- 1.orig/cache.c	2007-11-23 17:05:44.000000000 +0000
-+++ 1/cache.c	2007-11-23 17:05:56.000000000 +0000
-@@ -15,6 +15,9 @@
+--- ldconfig-native-2.12.1.orig/cache.c
++++ ldconfig-native-2.12.1/cache.c
+@@ -16,6 +16,9 @@
     along with this program; if not, write to the Free Software Foundation,
     Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  */
  
@@ -22,7 +22,7 @@ Index: 1/cache.c
  #include <errno.h>
  #include <error.h>
  #include <dirent.h>
-@@ -29,8 +32,10 @@
+@@ -31,8 +34,10 @@
  #include <sys/stat.h>
  #include <sys/types.h>
  
@@ -35,20 +35,11 @@ Index: 1/cache.c
  
  struct cache_entry
  {
-@@ -230,8 +235,6 @@ init_cache (void)
-   entries = NULL;
- }
- 
--
--
- static
- int compare (const struct cache_entry *e1, const struct cache_entry *e2)
- {
-Index: 1/chroot_canon.c
+Index: ldconfig-native-2.12.1/chroot_canon.c
 ===================================================================
---- 1.orig/chroot_canon.c	2007-11-23 17:05:44.000000000 +0000
-+++ 1/chroot_canon.c	2007-11-23 17:05:56.000000000 +0000
-@@ -16,6 +16,9 @@
+--- ldconfig-native-2.12.1.orig/chroot_canon.c
++++ ldconfig-native-2.12.1/chroot_canon.c
+@@ -17,6 +17,9 @@
     along with this program; if not, write to the Free Software Foundation,
     Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  */
  
@@ -58,7 +49,7 @@ Index: 1/chroot_canon.c
  #include <stdlib.h>
  #include <string.h>
  #include <unistd.h>
-@@ -26,7 +29,9 @@
+@@ -27,7 +30,9 @@
  #include <stddef.h>
  #include <stdint.h>
  
@@ -69,11 +60,11 @@ Index: 1/chroot_canon.c
  
  #ifndef PATH_MAX
  #define PATH_MAX 1024
-Index: 1/dl-cache.c
+Index: ldconfig-native-2.12.1/dl-cache.c
 ===================================================================
---- 1.orig/dl-cache.c	2007-11-23 17:05:44.000000000 +0000
-+++ 1/dl-cache.c	2007-11-23 17:05:56.000000000 +0000
-@@ -19,12 +19,12 @@
+--- ldconfig-native-2.12.1.orig/dl-cache.c
++++ ldconfig-native-2.12.1/dl-cache.c
+@@ -20,12 +20,12 @@
  
  #include <assert.h>
  #include <unistd.h>
@@ -88,7 +79,7 @@ Index: 1/dl-cache.c
  
  #ifndef _DL_PLATFORMS_COUNT
  # define _DL_PLATFORMS_COUNT 0
-@@ -38,103 +38,7 @@ static size_t cachesize;
+@@ -39,103 +39,7 @@ static size_t cachesize;
  /* 1 if cache_data + PTR points into the cache.  */
  #define _dl_cache_verify_ptr(ptr) (ptr < cache_data_size)
  
@@ -192,13 +183,15 @@ Index: 1/dl-cache.c
  _dl_cache_libcmp (const char *p1, const char *p2)
  {
    while (*p1 != '\0')
-@@ -173,139 +77,4 @@ _dl_cache_libcmp (const char *p1, const 
+@@ -172,139 +76,3 @@ _dl_cache_libcmp (const char *p1, const 
+     }
+   return *p1 - *p2;
  }
- 
- 
+-
+-
 -/* Look up NAME in ld.so.cache and return the file name stored there,
 -   or null if none is found.  */
- 
+-
 -const char *
 -internal_function
 -_dl_load_cache_lookup (const char *name)
@@ -210,7 +203,7 @@ Index: 1/dl-cache.c
 -  const char *best;
 -
 -  /* Print a message if the loading of libs is traced.  */
--  if (__builtin_expect (GLRO(dl_debug_mask) & DL_DEBUG_LIBS, 0))
+-  if (__builtin_expect (GLRO_dl_debug_mask & DL_DEBUG_LIBS, 0))
 -    _dl_debug_printf (" search cache=%s\n", LD_SO_CACHE);
 -
 -  if (cache == NULL)
@@ -278,21 +271,19 @@ Index: 1/dl-cache.c
 -      if (platform != (uint64_t) -1)
 -	platform = 1ULL << platform;
 -
+-#define _DL_HWCAP_TLS_MASK (1LL << 63)
+-      uint64_t hwcap_exclude = ~((GLRO(dl_hwcap) & GLRO(dl_hwcap_mask))
+-				 | _DL_HWCAP_PLATFORM | _DL_HWCAP_TLS_MASK);
+-
 -      /* Only accept hwcap if it's for the right platform.  */
--#ifdef USE_TLS
--# define _DL_HWCAP_TLS_MASK (1LL << 63)
--#else
--# define _DL_HWCAP_TLS_MASK 0
--#endif
 -#define HWCAP_CHECK \
+-      if (lib->hwcap & hwcap_exclude)					      \
+-	continue;							      \
 -      if (GLRO(dl_osversion) && lib->osversion > GLRO(dl_osversion))	      \
 -	continue;							      \
 -      if (_DL_PLATFORMS_COUNT						      \
 -	  && (lib->hwcap & _DL_HWCAP_PLATFORM) != 0			      \
 -	  && (lib->hwcap & _DL_HWCAP_PLATFORM) != platform)		      \
--	continue;							      \
--      if (lib->hwcap							      \
--	  & ~(GLRO(dl_hwcap) | _DL_HWCAP_PLATFORM | _DL_HWCAP_TLS_MASK))      \
 -	continue
 -      SEARCH_CACHE (cache_new);
 -    }
@@ -310,7 +301,7 @@ Index: 1/dl-cache.c
 -    }
 -
 -  /* Print our result if wanted.  */
--  if (__builtin_expect (GLRO(dl_debug_mask) & DL_DEBUG_LIBS, 0)
+-  if (__builtin_expect (GLRO_dl_debug_mask & DL_DEBUG_LIBS, 0)
 -      && best != NULL)
 -    _dl_debug_printf ("  trying file=%s\n", best);
 -
@@ -332,10 +323,10 @@ Index: 1/dl-cache.c
 -    }
 -}
 -#endif
-Index: 1/dl-cache.h
+Index: ldconfig-native-2.12.1/dl-cache.h
 ===================================================================
---- 1.orig/dl-cache.h	2007-11-23 17:05:44.000000000 +0000
-+++ 1/dl-cache.h	2007-11-23 17:05:56.000000000 +0000
+--- ldconfig-native-2.12.1.orig/dl-cache.h
++++ ldconfig-native-2.12.1/dl-cache.h
 @@ -101,5 +101,4 @@ struct cache_file_new
  (((addr) + __alignof__ (struct cache_file_new) -1)	\
   & (~(__alignof__ (struct cache_file_new) - 1)))
@@ -343,11 +334,11 @@ Index: 1/dl-cache.h
 -extern int _dl_cache_libcmp (const char *p1, const char *p2)
 -     internal_function;
 +extern int _dl_cache_libcmp (const char *p1, const char *p2);
-Index: 1/ldconfig.c
+Index: ldconfig-native-2.12.1/ldconfig.c
 ===================================================================
---- 1.orig/ldconfig.c	2007-11-23 17:05:44.000000000 +0000
-+++ 1/ldconfig.c	2007-11-23 17:05:56.000000000 +0000
-@@ -15,6 +15,9 @@
+--- ldconfig-native-2.12.1.orig/ldconfig.c
++++ ldconfig-native-2.12.1/ldconfig.c
+@@ -16,6 +16,9 @@
     along with this program; if not, write to the Free Software Foundation,
     Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  */
  
@@ -357,7 +348,7 @@ Index: 1/ldconfig.c
  #define PROCINFO_CLASS static
  #include <alloca.h>
  #include <argp.h>
-@@ -37,10 +40,20 @@
+@@ -39,10 +42,20 @@
  #include <glob.h>
  #include <libgen.h>
  
@@ -381,7 +372,7 @@ Index: 1/ldconfig.c
  
  #ifdef _DL_FIRST_PLATFORM
  # define _DL_FIRST_EXTRA (_DL_FIRST_PLATFORM + _DL_PLATFORMS_COUNT)
-@@ -53,7 +66,7 @@
+@@ -55,7 +68,7 @@
  #endif
  
  /* Get libc version number.  */
@@ -390,7 +381,7 @@ Index: 1/ldconfig.c
  
  #define PACKAGE _libc_intl_domainname
  
-@@ -143,8 +156,8 @@ static const struct argp_option options[
+@@ -152,8 +165,8 @@ static const struct argp_option options[
    { NULL, 0, NULL, 0, NULL, 0 }
  };
  
@@ -401,20 +392,36 @@ Index: 1/ldconfig.c
  
  /* Short description of program.  */
  static const char doc[] = N_("Configure Dynamic Linker Run Time Bindings.");
-@@ -281,7 +294,7 @@ parse_opt (int key, char *arg, struct ar
+@@ -291,6 +304,7 @@ parse_opt (int key, char *arg, struct ar
+   return 0;
+ }
+ 
++#define REPORT_BUGS_TO "mailing list : poky@yoctoproject.org"
+ /* Print bug-reporting information in the help message.  */
+ static char *
+ more_help (int key, const char *text, void *input)
+@@ -315,7 +329,7 @@ For bug reporting instructions, please s
  static void
  print_version (FILE *stream, struct argp_state *state)
  {
--  fprintf (stream, "ldconfig (GNU %s) %s\n", PACKAGE, VERSION);
+-  fprintf (stream, "ldconfig %s%s\n", PKGVERSION, VERSION);
 +  fprintf (stream, "ldconfig (Hacked Poky Version)\n");
    fprintf (stream, gettext ("\
  Copyright (C) %s Free Software Foundation, Inc.\n\
  This is free software; see the source for copying conditions.  There is NO\n\
-Index: 1/readlib.c
+@@ -1233,6 +1247,7 @@ set_hwcap (void)
+     hwcap_mask = strtoul (mask, NULL, 0);
+ }
+ 
++const char _libc_intl_domainname[] = "libc";
+ 
+ int
+ main (int argc, char **argv)
+Index: ldconfig-native-2.12.1/readlib.c
 ===================================================================
---- 1.orig/readlib.c	2007-11-23 17:05:44.000000000 +0000
-+++ 1/readlib.c	2007-11-23 17:05:56.000000000 +0000
-@@ -21,6 +21,9 @@
+--- ldconfig-native-2.12.1.orig/readlib.c
++++ ldconfig-native-2.12.1/readlib.c
+@@ -22,6 +22,9 @@
     development version.  Besides the simplification, it has also been
     modified to read some other file formats.  */
  
@@ -424,7 +431,7 @@ Index: 1/readlib.c
  #include <a.out.h>
  #include <elf.h>
  #include <error.h>
-@@ -34,7 +37,9 @@
+@@ -35,7 +38,9 @@
  #include <sys/stat.h>
  #include <gnu/lib-names.h>
  
@@ -435,11 +442,11 @@ Index: 1/readlib.c
  
  #define Elf32_CLASS ELFCLASS32
  #define Elf64_CLASS ELFCLASS64
-Index: 1/xstrdup.c
+Index: ldconfig-native-2.12.1/xstrdup.c
 ===================================================================
---- 1.orig/xstrdup.c	2007-11-23 17:05:44.000000000 +0000
-+++ 1/xstrdup.c	2007-11-23 17:05:56.000000000 +0000
-@@ -15,15 +15,10 @@
+--- ldconfig-native-2.12.1.orig/xstrdup.c
++++ ldconfig-native-2.12.1/xstrdup.c
+@@ -16,15 +16,10 @@
     along with this program; if not, write to the Free Software Foundation,
     Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  */
  
diff --git a/meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig_aux-cache_path_fix.patch b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig_aux-cache_path_fix.patch
new file mode 100644
index 0000000..0312ca8
--- /dev/null
+++ b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig_aux-cache_path_fix.patch
@@ -0,0 +1,34 @@
+Coming from this bug: http://sourceware.org/bugzilla/show_bug.cgi?id=11149
+
+Nitin A Kamble <nitin.a.kamble@intel.com>2011/03/29
+
+--- ldconfig-native-2.12.1.orig/ldconfig.c	
++++ ldconfig-native-2.12.1/ldconfig.c	
+@@ -1359,14 +1359,9 @@ main (int argc, char **argv)
+ 
+   const char *aux_cache_file = _PATH_LDCONFIG_AUX_CACHE;
+   if (opt_chroot)
+-    {
+-      aux_cache_file = chroot_canon (opt_chroot, aux_cache_file);
+-      if (aux_cache_file == NULL)
+-	error (EXIT_FAILURE, errno, _("Can't open cache file %s\n"),
+-	       _PATH_LDCONFIG_AUX_CACHE);
+-    }
++    aux_cache_file = chroot_canon (opt_chroot, aux_cache_file);
+ 
+-  if (! opt_ignore_aux_cache)
++  if (! opt_ignore_aux_cache && aux_cache_file)
+     load_aux_cache (aux_cache_file);
+   else
+     init_aux_cache ();
+@@ -1376,7 +1371,8 @@ main (int argc, char **argv)
+   if (opt_build_cache)
+     {
+       save_cache (cache_file);
+-      save_aux_cache (aux_cache_file);
++      if (aux_cache_file)
++        save_aux_cache (aux_cache_file);
+     }
+ 
+   return 0;
+
diff --git a/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb b/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
new file mode 100644
index 0000000..bacf9f8
--- /dev/null
+++ b/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "A standalone native ldconfig build"
+
+LICENSE = "GPLv2.1"
+
+LIC_FILES_CHKSUM = "file://${S}/ldconfig.c;endline=17;md5=1d15f20937c055cb5de2329a4c054399"
+
+SRC_URI = "file://ldconfig-native-2.12.1.tar.bz2 \
+           file://ldconfig.patch \
+           file://ldconfig_aux-cache_path_fix.patch \
+           file://32and64bit.patch \
+           file://endian-ness_handling.patch \
+           file://flag_fix.patch "
+
+PR = "r0"
+
+inherit native
+
+S = "${WORKDIR}/${PN}-${PV}"
+
+do_compile () {
+	$CC ldconfig.c -std=gnu99 chroot_canon.c xmalloc.c xstrdup.c cache.c readlib.c  -I. dl-cache.c -o ldconfig
+}
+
+do_install () {
+	install -d ${D}/${bindir}/
+	install ldconfig ${D}/${bindir}/
+}
diff --git a/meta/recipes-core/glibc/ldconfig-native-2.5/ldconfig-native-2.5.tar.bz2 b/meta/recipes-core/glibc/ldconfig-native-2.5/ldconfig-native-2.5.tar.bz2
deleted file mode 100644
index 693b35ced2a8ce9965f5a984bb919289848349f4..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 19454
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
VJ$+V_L>K?X+>uTcBolJ33V=^cIWqtN

diff --git a/meta/recipes-core/glibc/ldconfig-native_2.5.bb b/meta/recipes-core/glibc/ldconfig-native_2.5.bb
deleted file mode 100644
index 39c8ce3..0000000
--- a/meta/recipes-core/glibc/ldconfig-native_2.5.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION = "A standalone native ldconfig build"
-
-LICENSE = "GPLv2"
-
-LIC_FILES_CHKSUM = "file://${S}/ldconfig.c;endline=16;md5=8b3df71ec5b0feeeeab79025096aa92c"
-
-SRC_URI = "file://ldconfig-native-2.5.tar.bz2 \
-           file://ldconfig.patch;patch=1 \
-           file://32and64bit.patch;patch=1"
-
-PR = "r1"
-
-inherit native
-
-S = "${WORKDIR}/${PN}-${PV}"
-
-do_compile () {
-	$CC ldconfig.c -std=gnu99 chroot_canon.c xmalloc.c xstrdup.c cache.c readlib.c  -I. dl-cache.c -o ldconfig
-}
-
-do_install () {
-	install -d ${D}/${bindir}/
-	install ldconfig ${D}/${bindir}/
-}
-- 
1.7.2.2



