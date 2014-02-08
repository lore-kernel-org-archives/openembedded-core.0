Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 444FB6E36A
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Feb 2014 20:57:01 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s18KuuwG020772 for <openembedded-core@lists.openembedded.org>;
	Sat, 8 Feb 2014 20:56:56 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id MDxkVwWFWE5n
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Feb 2014 20:56:56 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s18KupAc020769
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 8 Feb 2014 20:56:52 GMT
Message-ID: <1391893006.32614.61.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 08 Feb 2014 20:56:46 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] binutils: Add backports to resolve systemd (from git) breakage
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
X-List-Received-Date: Sat, 08 Feb 2014 20:57:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Backport the patches for PR2404 and PR16476 from binutils to
resolve failures when compiling systemd from git.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/binutils/binutils-2.24.inc b/meta/recipes-devtools/binutils/binutils-2.24.inc
index 86ff999..42d4ede 100644
--- a/meta/recipes-devtools/binutils/binutils-2.24.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.24.inc
@@ -26,6 +26,8 @@ SRC_URI = "\
      file://mips64-default-ld-emulation.patch \
      file://binutils-xlp-support.patch \
      file://fix-pr15815.patch \
+     file://fix-pr2404.patch \
+     file://fix-pr16476.patch \
      "
 
 SRC_URI[md5sum] = "e0f71a7b2ddab0f8612336ac81d9636b"
diff --git a/meta/recipes-devtools/binutils/binutils/fix-pr16476.patch b/meta/recipes-devtools/binutils/binutils/fix-pr16476.patch
new file mode 100644
index 0000000..65d62bc
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/fix-pr16476.patch
@@ -0,0 +1,220 @@
+From: H.J. Lu <hjl.tools@gmail.com>
+Date: Tue, 21 Jan 2014 23:42:43 +0000 (-0800)
+Subject: Check incompatible existing default symbol definition
+X-Git-Tag: hjl/linux/release/2.24.51.0.3~1^2~8^2~16
+X-Git-Url: https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff_plain;h=4584ec12076e088cf36965b88ef8710ca85491f9
+
+Check incompatible existing default symbol definition
+
+After resolving a versioned reference, foo@VER1, to a default versioned
+definition, foo@@VER1, from a shared object, we also merge it with
+the existing regular default symbol definition, foo.  When foo is IFUNC
+and foo@@VER1 aren't, we will merge 2 incompatible definitions.  This
+patch avoids merging foo@@VER1 definition with foo definition if
+one is IFUNC and the other isn't.
+
+Upstream-Status: Backport
+---
+
+#diff --git a/bfd/ChangeLog b/bfd/ChangeLog
+#index 5923bc3..c70a7db 100644
+#--- a/bfd/ChangeLog
+#+++ b/bfd/ChangeLog
+#@@ -1,5 +1,13 @@
+# 2014-01-21  H.J. Lu  <hongjiu.lu@intel.com>
+# 
+#+	PR ld/16467
+#+	* elflink.c (_bfd_elf_merge_symbol): When types of the existing
+#+	regular default symbol definition and the versioned dynamic
+#+	symbol definition mismatch, skip the default symbol definition
+#+	if one of them is IFUNC.
+#+
+#+2014-01-21  H.J. Lu  <hongjiu.lu@intel.com>
+#+
+# 	PR ld/2404
+# 	* elflink.c (_bfd_elf_merge_symbol): Don't check info->shared,
+# 	info->export_dynamic nor h->ref_dynamic for type mismatch when
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index d0006da..792e14e 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -1092,11 +1092,14 @@ _bfd_elf_merge_symbol (bfd *abfd,
+       && newdyn
+       && newdef
+       && !olddyn
+-      && (olddef || h->root.type == bfd_link_hash_common)
+-      && ELF_ST_TYPE (sym->st_info) != h->type
+-      && ELF_ST_TYPE (sym->st_info) != STT_NOTYPE
+-      && h->type != STT_NOTYPE
+-      && !(newfunc && oldfunc))
++      && (((olddef || h->root.type == bfd_link_hash_common)
++	   && ELF_ST_TYPE (sym->st_info) != h->type
++	   && ELF_ST_TYPE (sym->st_info) != STT_NOTYPE
++	   && h->type != STT_NOTYPE
++	   && !(newfunc && oldfunc))
++	  || (olddef
++	      && ((h->type == STT_GNU_IFUNC)
++		  != (ELF_ST_TYPE (sym->st_info) == STT_GNU_IFUNC)))))
+     {
+       *skip = TRUE;
+       return TRUE;
+#diff --git a/ld/testsuite/ChangeLog b/ld/testsuite/ChangeLog
+#index ac65a3a..a092428 100644
+#--- a/ld/testsuite/ChangeLog
+#+++ b/ld/testsuite/ChangeLog
+#@@ -1,5 +1,19 @@
+# 2014-01-21  H.J. Lu  <hongjiu.lu@intel.com>
+# 
+#+	PR ld/16467
+#+	* ld-ifunc/dummy.c: New file.
+#+	* ld-ifunc/pr16467.out: Likewise.
+##+	* ld-ifunc/pr16467a.c: Likewise.
+#+	* ld-ifunc/pr16467a.map: Likewise.
+#+	* ld-ifunc/pr16467b.c: Likewise.
+#+	* ld-ifunc/pr16467b.map: Likewise.
+#+	* ld-ifunc/pr16467c.c: Likewise.
+#+
+#+	* ld-ifunc/ifunc.exp (run_cc_link_tests): New.
+#+	(run_ld_link_exec_tests): Run pr16467.
+#+
+#+2014-01-21  H.J. Lu  <hongjiu.lu@intel.com>
+#+
+# 	PR ld/2404
+# 	* ld-elf/shared.exp: Add a PIE test for PR ld/2404.
+# 
+diff --git a/ld/testsuite/ld-ifunc/dummy.c b/ld/testsuite/ld-ifunc/dummy.c
+new file mode 100644
+index 0000000..5c03287
+--- /dev/null
++++ b/ld/testsuite/ld-ifunc/dummy.c
+@@ -0,0 +1 @@
++/* An empty file.  */
+diff --git a/ld/testsuite/ld-ifunc/ifunc.exp b/ld/testsuite/ld-ifunc/ifunc.exp
+index fb106c6..d7ff445 100644
+--- a/ld/testsuite/ld-ifunc/ifunc.exp
++++ b/ld/testsuite/ld-ifunc/ifunc.exp
+@@ -349,6 +349,42 @@ if { $verbose < 1 } {
+     remote_file host delete "tmpdir/static_nonifunc_prog"
+ }
+ 
++run_cc_link_tests [list \
++    [list \
++	"Build libpr16467a.so" \
++	"-shared -Wl,--version-script=pr16467a.map" \
++	"-fPIC" \
++	{ pr16467a.c } \
++	{} \
++	"libpr16467a.so" \
++    ] \
++    [list \
++	"Build libpr16467b.a" \
++	"" \
++	"-fPIC" \
++	{ pr16467b.c } \
++	{} \
++	"libpr16467b.a" \
++    ] \
++    [list \
++	"Build libpr16467b.so" \
++	"-shared tmpdir/pr16467b.o tmpdir/libpr16467a.so \
++	 -Wl,--version-script=pr16467b.map" \
++	"-fPIC" \
++	{ dummy.c } \
++	{} \
++	"libpr16467b.so" \
++    ] \
++    [list \
++	"Build libpr16467c.a" \
++	"" \
++	"" \
++	{ pr16467c.c } \
++	{} \
++	"libpr16467c.a" \
++    ] \
++]
++
+ run_ld_link_exec_tests [] [list \
+     [list \
+ 	"Common symbol override ifunc test 1a" \
+@@ -368,6 +404,15 @@ run_ld_link_exec_tests [] [list \
+ 	"ifunc-common-1.out" \
+ 	"-g" \
+     ] \
++    [list \
++	"Run pr16467" \
++	"tmpdir/pr16467c.o tmpdir/libpr16467b.so tmpdir/libpr16467a.so" \
++	"" \
++	{ dummy.c } \
++	"pr16467" \
++	"pr16467.out" \
++	"" \
++    ] \
+ ]
+ 
+ set test_list [lsort [glob -nocomplain $srcdir/$subdir/*.d]]
+diff --git a/ld/testsuite/ld-ifunc/pr16467.out b/ld/testsuite/ld-ifunc/pr16467.out
+new file mode 100644
+index 0000000..d86bac9
+--- /dev/null
++++ b/ld/testsuite/ld-ifunc/pr16467.out
+@@ -0,0 +1 @@
++OK
+diff --git a/ld/testsuite/ld-ifunc/pr16467a.c b/ld/testsuite/ld-ifunc/pr16467a.c
+new file mode 100644
+index 0000000..ae3f084
+--- /dev/null
++++ b/ld/testsuite/ld-ifunc/pr16467a.c
+@@ -0,0 +1,5 @@
++const char * 
++sd_get_seats(void)
++{
++  return "OK";
++}
+diff --git a/ld/testsuite/ld-ifunc/pr16467a.map b/ld/testsuite/ld-ifunc/pr16467a.map
+new file mode 100644
+index 0000000..d677f37
+--- /dev/null
++++ b/ld/testsuite/ld-ifunc/pr16467a.map
+@@ -0,0 +1,4 @@
++LIBSYSTEMD_209 {
++global:
++        sd_get_seats;
++};
+diff --git a/ld/testsuite/ld-ifunc/pr16467b.c b/ld/testsuite/ld-ifunc/pr16467b.c
+new file mode 100644
+index 0000000..264f6cf
+--- /dev/null
++++ b/ld/testsuite/ld-ifunc/pr16467b.c
+@@ -0,0 +1,7 @@
++void new_sd_get_seats(void);
++__asm__(".symver new_sd_get_seats,sd_get_seats@LIBSYSTEMD_209");
++void (*resolve_sd_get_seats(void)) (void) __asm__ ("sd_get_seats");
++void (*resolve_sd_get_seats(void)) (void) {
++        return new_sd_get_seats;
++}
++__asm__(".type sd_get_seats, %gnu_indirect_function");
+diff --git a/ld/testsuite/ld-ifunc/pr16467b.map b/ld/testsuite/ld-ifunc/pr16467b.map
+new file mode 100644
+index 0000000..1f263de
+--- /dev/null
++++ b/ld/testsuite/ld-ifunc/pr16467b.map
+@@ -0,0 +1,4 @@
++LIBSYSTEMD_208 {
++global:
++        sd_get_seats;
++};
+diff --git a/ld/testsuite/ld-ifunc/pr16467c.c b/ld/testsuite/ld-ifunc/pr16467c.c
+new file mode 100644
+index 0000000..e2a901c
+--- /dev/null
++++ b/ld/testsuite/ld-ifunc/pr16467c.c
+@@ -0,0 +1,9 @@
++#include <stdio.h>
++const char* sd_get_seats(void);
++
++int
++main (int argc, char **argv)
++{
++  printf("%s\n", sd_get_seats());
++  return 0;
++}
diff --git a/meta/recipes-devtools/binutils/binutils/fix-pr2404.patch b/meta/recipes-devtools/binutils/binutils/fix-pr2404.patch
new file mode 100644
index 0000000..41f3504
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/fix-pr2404.patch
@@ -0,0 +1,76 @@
+From: H.J. Lu <hjl.tools@gmail.com>
+Date: Tue, 21 Jan 2014 13:33:48 +0000 (-0800)
+Subject: Don't check shared/export_dynamic/ref_dynamic for type mismatch
+X-Git-Tag: hjl/linux/release/2.24.51.0.3~1^2~8^2~22
+X-Git-Url: https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff_plain;h=22ef172a21663abb477d72284b4d59c8eabcbb82
+
+Don't check shared/export_dynamic/ref_dynamic for type mismatch
+
+There is nothing linker can do when a type mismatched default definition
+are made dynamic by info->shared, info->export_dynamic or h->ref_dynamic.
+But we do want to avoid exporting it when building PIE.  Let's remove
+those checks.
+
+bfd/
+
+	PR ld/2404
+	* elflink.c (_bfd_elf_merge_symbol): Don't check info->shared,
+	info->export_dynamic, nor !h->ref_dynamic for type mismatch when
+	adding the default version.
+
+ld/testsuite/
+
+	PR ld/2404
+	* ld-elf/shared.exp: Add a PIE test for PR ld/2404.
+
+Upstream-Status: Backport
+---
+
+Index: binutils-2.24/bfd/elflink.c
+===================================================================
+--- binutils-2.24.orig/bfd/elflink.c	2014-02-08 13:20:08.628378267 +0000
++++ binutils-2.24/bfd/elflink.c	2014-02-08 13:20:08.624378267 +0000
+@@ -1090,9 +1090,6 @@
+      the type of existing regular definition mismatch.  We only do it
+      if the existing regular definition won't be dynamic.  */
+   if (pold_alignment == NULL
+-      && !info->shared
+-      && !info->export_dynamic
+-      && !h->ref_dynamic
+       && newdyn
+       && newdef
+       && !olddyn
+Index: binutils-2.24/ld/testsuite/ld-elf/shared.exp
+===================================================================
+--- binutils-2.24.orig/ld/testsuite/ld-elf/shared.exp	2014-02-08 13:20:08.628378267 +0000
++++ binutils-2.24/ld/testsuite/ld-elf/shared.exp	2014-02-08 13:20:08.624378267 +0000
+@@ -432,3 +432,29 @@
+ 
+ run_cc_link_tests $build_cxx_tests
+ run_ld_link_exec_tests [] $run_cxx_tests
++
++if { [istarget *-*-linux*]
++     || [istarget *-*-nacl*]
++     || [istarget *-*-gnu*] } {
++    run_cc_link_tests [list \
++	[list \
++	    "Build libpr2404b.a with PIE" \
++	    "" \
++	    "-fPIE" \
++	    { pr2404b.c } \
++	    {} \
++	    "libpr2404b.a" \
++	] \
++    ]
++    run_ld_link_exec_tests [] [list \
++	[list \
++	    "Run pr2404 with PIE" \
++	    "-pie tmpdir/pr2404b.o tmpdir/libpr2404a.so" \
++	    "" \
++	    { dummy.c } \
++	    "pr2404pie" \
++	    "pr2404.out" \
++	    "-fPIE" \
++	] \
++    ]
++}



