Received: from mail.cybernetics.com (mail.cybernetics.com [173.71.130.66])
 by mx.groups.io with SMTP id smtpd.web09.1267.1627392966857945701
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 06:36:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cybernetics.com header.s=mail header.b=DE3dMNZs;
 spf=pass (domain: cybernetics.com, ip: 173.71.130.66, mailfrom: btv1==842db41608d==tonyb@cybernetics.com)
X-ASG-Debug-ID: 1627392965-0fb3b001bf175b0001-7zcVdP
Received: from cybernetics.com ([10.10.4.126]) by mail.cybernetics.com with ESMTP id YjnnUl9Z93w7SkQ9; Tue, 27 Jul 2021 09:36:05 -0400 (EDT)
X-Barracuda-Envelope-From: tonyb@cybernetics.com
X-Barracuda-RBL-Trusted-Forwarder: 10.10.4.126
X-ASG-Whitelist: Client
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cybernetics.com; s=mail;
	bh=CIYo0iG8OY33rGrWAhVHNJ0Tx+zojFXXp//FHjEnfo4=;
	h=Content-Language:Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
	Message-ID:Subject:From:Cc:To; b=DE3dMNZs3739LOjr144K9bnxA/7nAs6Fxf29QzZ6gEDG
	Zydm7DS4hT493FbXzwSwZ8OFdpNXsqlvsCpSTDfD42z1RgnRbYQJrYEEbfWdTJXeTss3PEfqDsYK0
	5mS37O10DHPtPP1KSUE10sitDhdUuSNHqSbVYHzaYtLHAtrJaI=
Received: from [10.157.2.224] (HELO [192.168.200.1])
  by cybernetics.com (CommuniGate Pro SMTP 6.2.14)
  with ESMTPS id 10999388; Tue, 27 Jul 2021 09:36:05 -0400
To: openembedded-core@lists.openembedded.org
X-Barracuda-RBL-Trusted-Forwarder: 10.157.2.224
Cc: randy.macleod@windriver.com
From: "Tony Battersby" <tonyb@cybernetics.com>
Subject: [master][PATCH 2/4] gcc: Backport patch to make LTO builds more reproducible
Message-ID: <8230a75c-1d38-e82c-2ed6-1386e2d2bb4f@cybernetics.com>
X-ASG-Orig-Subj: [master][PATCH 2/4] gcc: Backport patch to make LTO builds more
 reproducible
Date: Tue, 27 Jul 2021 09:36:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[10.10.4.126]
X-Barracuda-Start-Time: 1627392965
X-Barracuda-URL: https://10.10.4.122:443/cgi-mod/mark.cgi
X-Barracuda-BRTS-Status: 1
X-Virus-Scanned: by bsmtpd at cybernetics.com
X-Barracuda-Scan-Msg-Size: 5206
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Backport ustream gcc patch that enables -fdebug-prefix-map to cover
additional cases with LTO enabled to make LTO builds more reproducible.

[YOCTO #14481]

Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
---
 meta/recipes-devtools/gcc/gcc-11.1.inc        |  1 +
 ...prefix-maps-before-checksumming-DIEs.patch | 95 +++++++++++++++++++
 2 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0041-apply-debug-prefix-maps-before-checksumming-DIEs.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.1.inc b/meta/recipes-devtools/gcc/gcc-11.1.inc
index c21242af58..167fddb65a 100644
--- a/meta/recipes-devtools/gcc/gcc-11.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.1.inc
@@ -72,6 +72,7 @@ SRC_URI = "\
            file://0038-arc-Update-64bit-move-split-patterns.patch \
            file://0039-arc-Fix-u-maddhisi-patterns.patch \
            file://0040-arc-Update-doloop_end-patterns.patch \
+           file://0041-apply-debug-prefix-maps-before-checksumming-DIEs.patch \
 "
 SRC_URI[sha256sum] = "4c4a6fb8a8396059241c2e674b85b351c26a5d678274007f076957afa1cc9ddf"
 SRC_URI[backports.sha256sum] = "69274bebd6c069a13443d4af61070e854740a639ec4d66eedf3e80070363587b"
diff --git a/meta/recipes-devtools/gcc/gcc/0041-apply-debug-prefix-maps-before-checksumming-DIEs.patch b/meta/recipes-devtools/gcc/gcc/0041-apply-debug-prefix-maps-before-checksumming-DIEs.patch
new file mode 100644
index 0000000000..c8dcd74b9d
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0041-apply-debug-prefix-maps-before-checksumming-DIEs.patch
@@ -0,0 +1,95 @@
+From 7cc2df084b7977653a9b59cbc34a9ad500ae619c Mon Sep 17 00:00:00 2001
+From: Richard Biener <rguenther@suse.de>
+Date: Tue, 20 Jul 2021 11:00:33 +0200
+Subject: [PATCH] debug/101473 - apply debug prefix maps before checksumming DIEs
+
+The following makes sure to apply the debug prefix maps to filenames
+before checksumming DIEs to create the global symbol for the CU DIE
+used by LTO to link the late debug to the early debug.  This avoids
+binary differences (in said symbol) when compiling with toolchains
+installed under a different path and that compensated with appropriate
+-fdebug-prefix-map options.
+
+The easiest and most scalable way is to record both the unmapped
+and the remapped filename in the dwarf_file_data so the remapping
+process takes place at a single point and only once (otherwise it
+creates GC garbage at each point doing that).
+
+2021-07-20  Richard Biener  <rguenther@suse.de>
+
+	PR debug/101473
+	* dwarf2out.h (dwarf_file_data): Add key member.
+	* dwarf2out.c (dwarf_file_hasher::equal): Compare key.
+	(dwarf_file_hasher::hash): Hash key.
+	(lookup_filename): Remap the filename and store it in the
+	filename member of dwarf_file_data when creating a new
+	dwarf_file_data.
+	(file_name_acquire): Do not remap the filename again.
+	(maybe_emit_file): Likewise.
+
+[YOCTO #14481]
+
+Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=7cc2df084b7977653a9b59cbc34a9ad500ae619c]
+
+The upstream patch was modified to compensate for the definition of
+"struct dwarf_file_data" being in dwarf2out.c rather than dwarf2out.h in
+this version of gcc.
+
+Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
+---
+diff -urpN a/gcc/dwarf2out.c b/gcc/dwarf2out.c
+--- a/gcc/dwarf2out.c	2021-04-27 06:00:13.000000000 -0400
++++ b/gcc/dwarf2out.c	2021-07-23 16:40:06.141886167 -0400
+@@ -1283,6 +1283,7 @@ dwarf2out_switch_text_section (void)
+ 
+ /* Data about a single source file.  */
+ struct GTY((for_user)) dwarf_file_data {
++  const char * key;
+   const char * filename;
+   int emitted_number;
+ };
+@@ -12334,7 +12335,7 @@ file_name_acquire (dwarf_file_data **slo
+ 
+   fi = fnad->files + fnad->used_files++;
+ 
+-  f = remap_debug_filename (d->filename);
++  f = d->filename;
+ 
+   /* Skip all leading "./".  */
+   while (f[0] == '.' && IS_DIR_SEPARATOR (f[1]))
+@@ -27231,13 +27232,13 @@ dwarf2out_ignore_block (const_tree block
+ bool
+ dwarf_file_hasher::equal (dwarf_file_data *p1, const char *p2)
+ {
+-  return filename_cmp (p1->filename, p2) == 0;
++  return filename_cmp (p1->key, p2) == 0;
+ }
+ 
+ hashval_t
+ dwarf_file_hasher::hash (dwarf_file_data *p)
+ {
+-  return htab_hash_string (p->filename);
++  return htab_hash_string (p->key);
+ }
+ 
+ /* Lookup FILE_NAME (in the list of filenames that we know about here in
+@@ -27267,7 +27268,8 @@ lookup_filename (const char *file_name)
+     return *slot;
+ 
+   created = ggc_alloc<dwarf_file_data> ();
+-  created->filename = file_name;
++  created->key = file_name;
++  created->filename = remap_debug_filename (file_name);
+   created->emitted_number = 0;
+   *slot = created;
+   return created;
+@@ -27293,8 +27295,7 @@ maybe_emit_file (struct dwarf_file_data
+       if (output_asm_line_debug_info ())
+ 	{
+ 	  fprintf (asm_out_file, "\t.file %u ", fd->emitted_number);
+-	  output_quoted_string (asm_out_file,
+-				remap_debug_filename (fd->filename));
++	  output_quoted_string (asm_out_file, fd->filename);
+ 	  fputc ('\n', asm_out_file);
+ 	}
+     }
-- 
2.25.1

