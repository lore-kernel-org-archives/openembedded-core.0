Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8FECA78657
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 08:31:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7G8VZxF008779
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 16 Aug 2017 01:31:35 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 16 Aug 2017 01:31:34 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 16 Aug 2017 04:31:18 -0400
Message-ID: <55252682d9869b8bf26c7d96af06e8559b7d7df7.1502869419.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1502869419.git.hongxu.jia@windriver.com>
References: <cover.1502869419.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/8] elfutils: 0.168 -> 0.170
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
X-List-Received-Date: Wed, 16 Aug 2017 08:31:34 -0000
Content-Type: text/plain

The 0.170 Fixed CVE issues
- CVE-2017-7608
- CVE-2017-7612
- CVE-2017-7611
- CVE-2017-7610
- CVE-2016-10255
- CVE-2017-7613
- CVE-2017-7609
- CVE-2016-10254
- CVE-2017-7607

Rebase patches to 0.170
- dso-link-change.patch -> 0001
- Fix_elf_cvt_gunhash.patch -> 0002
- fixheadercheck.patch -> 0003
- 0001-remove-the-unneed-checking.patch -> 0004
- 0001-fix-a-stack-usage-warning.patch -> 0005
- aarch64_uio.patch -> 0006
- shadow.patch -> 0007
- 0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch -> 0008
- debian/mips_backend.diff -> debian/mips_backend.patch

Drop obsolete patches
- 0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch
  Upstream fixed it
  https://sourceware.org/git/?p=elfutils.git;a=commit;h=7114c513fbebcca8b76796b7f64b57447ba383e1

- Fix_one_GCC7_warning.patch
  It is a backported patch
  https://sourceware.org/git/?p=elfutils.git;a=commit;h=93c51144c3f664d4e9709da75a1d0fa00ea0fe95

- Drop debian patches, they modify test case.
  debian/testsuite-ignore-elflint.diff
  debian/kfreebsd_path.patch
  debian/hurd_path.patch
  debian/ignore_strmerge.diff

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...m-Silence-Werror-maybe-uninitialized-fals.patch |  35 -----
 .../elfutils-0.168/Fix_one_GCC7_warning.patch      |  44 ------
 .../elfutils/elfutils-0.168/debian/hurd_path.patch |  17 ---
 .../elfutils-0.168/debian/ignore_strmerge.diff     |  14 --
 .../elfutils-0.168/debian/kfreebsd_path.patch      |  20 ---
 .../debian/testsuite-ignore-elflint.diff           |  42 ------
 .../elfutils/elfutils-0.168/shadow.patch           |  23 ---
 .../elfutils/elfutils/dso-link-change.patch        |  32 ----
 .../{elfutils_0.168.bb => elfutils_0.170.bb}       |  32 ++--
 .../elfutils/files/0001-dso-link-change.patch      |  52 +++++++
 ...elf_cvt_gunhash-if-dest-and-src-are-same.patch} |  15 +-
 .../0003-fixheadercheck.patch}                     |  23 ++-
 .../0004-Disable-the-test-to-convert-euc-jp.patch} |  10 +-
 .../0005-fix-a-stack-usage-warning.patch}          |  15 +-
 .../0006-Fix-build-on-aarch64-musl.patch}          |  38 +++--
 ...-path-where-we-have-str-as-uninitialized-.patch |  45 ++++++
 ...e-alternatives-for-glibc-assumptions-hel.patch} | 168 +++++++++------------
 ...ferences-between-mips-machine-identifiers.patch |   0
 ...-support-for-mips64-abis-in-mips_retval.c.patch |   0
 .../0003-Add-mips-n64-relocation-format-hack.patch |   0
 .../debian/arm_backend.diff                        |   0
 .../debian}/fallthrough.patch                      |   0
 .../debian/hppa_backend.diff                       |   0
 .../debian/mips_backend.patch}                     | 115 ++++++++------
 .../debian/mips_readelf_w.patch                    |   0
 25 files changed, 335 insertions(+), 405 deletions(-)
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.168/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.168/Fix_one_GCC7_warning.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.168/debian/hurd_path.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.168/debian/ignore_strmerge.diff
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.168/debian/kfreebsd_path.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.168/debian/testsuite-ignore-elflint.diff
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.168/shadow.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils/dso-link-change.patch
 rename meta/recipes-devtools/elfutils/{elfutils_0.168.bb => elfutils_0.170.bb} (71%)
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
 rename meta/recipes-devtools/elfutils/{elfutils/Fix_elf_cvt_gunhash.patch => files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch} (72%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168/fixheadercheck.patch => files/0003-fixheadercheck.patch} (69%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168/0001-remove-the-unneed-checking.patch => files/0004-Disable-the-test-to-convert-euc-jp.patch} (76%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168/0001-fix-a-stack-usage-warning.patch => files/0005-fix-a-stack-usage-warning.patch} (72%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168/aarch64_uio.patch => files/0006-Fix-build-on-aarch64-musl.patch} (51%)
 create mode 100644 meta/recipes-devtools/elfutils/files/0007-Fix-control-path-where-we-have-str-as-uninitialized-.patch
 rename meta/recipes-devtools/elfutils/{elfutils-0.168/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch => files/0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch} (89%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168 => files}/debian/0001-Ignore-differences-between-mips-machine-identifiers.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168 => files}/debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168 => files}/debian/0003-Add-mips-n64-relocation-format-hack.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168 => files}/debian/arm_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168 => files/debian}/fallthrough.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168 => files}/debian/hppa_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168/debian/mips_backend.diff => files/debian/mips_backend.patch} (92%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168 => files}/debian/mips_readelf_w.patch (100%)

diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch b/meta/recipes-devtools/elfutils/elfutils-0.168/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch
deleted file mode 100644
index 3754c1c..0000000
--- a/meta/recipes-devtools/elfutils/elfutils-0.168/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 668accf322fd7185e273bfd50b84320e71d9de5a Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Fri, 10 Apr 2015 00:29:18 +0200
-Subject: [PATCH] elf_getarsym: Silence -Werror=maybe-uninitialized false
- positive
-
-Upstream-Status: Pending
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- libelf/elf_getarsym.c | 9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/libelf/elf_getarsym.c b/libelf/elf_getarsym.c
-index d0bb28a..08954d2 100644
---- a/libelf/elf_getarsym.c
-+++ b/libelf/elf_getarsym.c
-@@ -165,8 +165,13 @@ elf_getarsym (elf, ptr)
-       int w = index64_p ? 8 : 4;
- 
-       /* We have an archive.  The first word in there is the number of
--	 entries in the table.  */
--      uint64_t n;
-+	 entries in the table.
-+	 Set to SIZE_MAX just to silence -Werror=maybe-uninitialized
-+	 elf_getarsym.c:290:9: error: 'n' may be used uninitialized in this function
-+	 The read_number_entries function doesn't initialize n only when returning
-+	 -1 which in turn ensures to jump over usage of this uninitialized variable.
-+	 */
-+      uint64_t n = SIZE_MAX;
-       size_t off = elf->start_offset + SARMAG + sizeof (struct ar_hdr);
-       if (read_number_entries (&n, elf, &off, index64_p) < 0)
- 	{
--- 
-2.3.5
-
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/Fix_one_GCC7_warning.patch b/meta/recipes-devtools/elfutils/elfutils-0.168/Fix_one_GCC7_warning.patch
deleted file mode 100644
index d88f4eb..0000000
--- a/meta/recipes-devtools/elfutils/elfutils-0.168/Fix_one_GCC7_warning.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 93c51144c3f664d4e9709da75a1d0fa00ea0fe95 Mon Sep 17 00:00:00 2001
-From: Mark Wielaard <mark@klomp.org>
-Date: Sun, 12 Feb 2017 21:51:34 +0100
-Subject: [PATCH] libasm: Fix one GCC7 -Wformat-truncation=2 warning.
-
-Make sure that if we have really lots of labels the tempsym doesn't get
-truncated because it is too small to hold the whole name.
-
-This doesn't enable -Wformat-truncation=2 or fix other "issues" pointed
-out by enabling this warning because there are currently some issues
-with it. https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79448
-
-Signed-off-by: Mark Wielaard <mark@klomp.org>
-
-Upstream-Status: Backport (https://sourceware.org/git/?p=elfutils.git;a=commit;h=93c51144c3f664d4e9709da75a1d0fa00ea0fe95)
-Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
-
----
- libasm/ChangeLog    | 6 +++++-
- libasm/asm_newsym.c | 6 ++++--
- 2 files changed, 9 insertions(+), 3 deletions(-)
-
-Index: elfutils-0.168/libasm/asm_newsym.c
-===================================================================
---- elfutils-0.168.orig/libasm/asm_newsym.c
-+++ elfutils-0.168/libasm/asm_newsym.c
-@@ -1,5 +1,5 @@
- /* Define new symbol for current position in given section.
--   Copyright (C) 2002, 2005, 2016 Red Hat, Inc.
-+   Copyright (C) 2002, 2005, 2016, 2017 Red Hat, Inc.
-    This file is part of elfutils.
-    Written by Ulrich Drepper <drepper@redhat.com>, 2002.
- 
-@@ -44,7 +44,9 @@ AsmSym_t *
- asm_newsym (AsmScn_t *asmscn, const char *name, GElf_Xword size,
- 	    int type, int binding)
- {
--#define TEMPSYMLEN 10
-+/* We don't really expect labels with many digits, but in theory it could
-+   be 10 digits (plus ".L" and a zero terminator).  */
-+#define TEMPSYMLEN 13
-   char tempsym[TEMPSYMLEN];
-   AsmSym_t *result;
- 
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/debian/hurd_path.patch b/meta/recipes-devtools/elfutils/elfutils-0.168/debian/hurd_path.patch
deleted file mode 100644
index a4d568b..0000000
--- a/meta/recipes-devtools/elfutils/elfutils-0.168/debian/hurd_path.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Backport [from debian]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
-Index: elfutils-0.165/tests/run-native-test.sh
-===================================================================
---- elfutils-0.165.orig/tests/run-native-test.sh
-+++ elfutils-0.165/tests/run-native-test.sh
-@@ -83,6 +83,9 @@ native_test()
- # "cannot attach to process: Function not implemented".
- [ "$(uname)" = "GNU/kFreeBSD" ] && exit 77
- 
-+# hurd's /proc/$PID/maps does not give paths yet.
-+[ "$(uname)" = "GNU" ] && exit 77
-+
- native_test ${abs_builddir}/allregs
- native_test ${abs_builddir}/funcretval
- 
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/debian/ignore_strmerge.diff b/meta/recipes-devtools/elfutils/elfutils-0.168/debian/ignore_strmerge.diff
deleted file mode 100644
index 3570dec..0000000
--- a/meta/recipes-devtools/elfutils/elfutils-0.168/debian/ignore_strmerge.diff
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Backport [from debian]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
---- elfutils-0.165.orig/tests/run-strip-strmerge.sh
-+++ elfutils-0.165/tests/run-strip-strmerge.sh
-@@ -30,7 +30,7 @@ remerged=remerged.elf
- tempfiles $merged $stripped $debugfile $remerged
- 
- echo elflint $input
--testrun ${abs_top_builddir}/src/elflint --gnu $input
-+testrun_on_self_skip ${abs_top_builddir}/src/elflint --gnu $input
- echo elfstrmerge
- testrun ${abs_top_builddir}/tests/elfstrmerge -o $merged $input
- echo elflint $merged
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/debian/kfreebsd_path.patch b/meta/recipes-devtools/elfutils/elfutils-0.168/debian/kfreebsd_path.patch
deleted file mode 100644
index 49085d1..0000000
--- a/meta/recipes-devtools/elfutils/elfutils-0.168/debian/kfreebsd_path.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Upstream-Status: Backport [from debian]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
-Index: b/tests/run-native-test.sh
-===================================================================
---- a/tests/run-native-test.sh
-+++ b/tests/run-native-test.sh
-@@ -77,6 +77,12 @@ native_test()
-   test $native -eq 0 || testrun "$@" -p $native > /dev/null
- }
- 
-+# On the Debian buildds, GNU/kFreeBSD linprocfs /proc/$PID/maps does
-+# not give absolute paths due to sbuild's bind mounts (bug #570805)
-+# therefore the next two test programs are expected to fail with
-+# "cannot attach to process: Function not implemented".
-+[ "$(uname)" = "GNU/kFreeBSD" ] && exit 77
-+
- native_test ${abs_builddir}/allregs
- native_test ${abs_builddir}/funcretval
- 
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/debian/testsuite-ignore-elflint.diff b/meta/recipes-devtools/elfutils/elfutils-0.168/debian/testsuite-ignore-elflint.diff
deleted file mode 100644
index 3df3576..0000000
--- a/meta/recipes-devtools/elfutils/elfutils-0.168/debian/testsuite-ignore-elflint.diff
+++ /dev/null
@@ -1,42 +0,0 @@
-On many architectures this test fails because binaries/libs produced by
-binutils don't pass elflint. However elfutils shouldn't FTBFS because of this.
-
-So we run the tests on all archs to see what breaks, but if it breaks we ignore
-the result (exitcode 77 means: this test was skipped).
-
-Upstream-Status: Backport [from debian]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
-Index: b/tests/run-elflint-self.sh
-===================================================================
---- a/tests/run-elflint-self.sh
-+++ b/tests/run-elflint-self.sh
-@@ -18,4 +18,4 @@
- 
- . $srcdir/test-subr.sh
- 
--testrun_on_self ${abs_top_builddir}/src/elflint --quiet --gnu-ld
-+testrun_on_self_skip ${abs_top_builddir}/src/elflint --quiet --gnu-ld
-Index: b/tests/test-subr.sh
-===================================================================
---- a/tests/test-subr.sh
-+++ b/tests/test-subr.sh
-@@ -152,3 +152,18 @@ testrun_on_self_quiet()
-   # Only exit if something failed
-   if test $exit_status != 0; then exit $exit_status; fi
- }
-+
-+# Same as testrun_on_self(), but skip on failure.
-+testrun_on_self_skip()
-+{
-+  exit_status=0
-+
-+  for file in $self_test_files; do
-+      testrun $* $file \
-+	  || { echo "*** failure in $* $file"; exit_status=77; }
-+  done
-+
-+  # Only exit if something failed
-+  if test $exit_status != 0; then exit $exit_status; fi
-+}
-+
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/shadow.patch b/meta/recipes-devtools/elfutils/elfutils-0.168/shadow.patch
deleted file mode 100644
index d31961f..0000000
--- a/meta/recipes-devtools/elfutils/elfutils-0.168/shadow.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Fix control path where we have str as uninitialized string
-
-| /home/ubuntu/work/oe/openembedded-core/build/tmp-musl/work/i586-oe-linux-musl/elfutils/0.164-r0/elfutils-0.164/libcpu/i386_disasm.c: In function 'i386_disasm':
-| /home/ubuntu/work/oe/openembedded-core/build/tmp-musl/work/i586-oe-linux-musl/elfutils/0.164-r0/elfutils-0.164/libcpu/i386_disasm.c:310:5: error: 'str' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-|      memcpy (buf + bufcnt, _str, _len);           \
-|      ^
-| /home/ubuntu/work/oe/openembedded-core/build/tmp-musl/work/i586-oe-linux-musl/elfutils/0.164-r0/elfutils-0.164/libcpu/i386_disasm.c:709:17: note: 'str' was declared here
-|      const char *str;
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-Index: elfutils-0.164/libcpu/i386_disasm.c
-===================================================================
---- elfutils-0.164.orig/libcpu/i386_disasm.c
-+++ elfutils-0.164/libcpu/i386_disasm.c
-@@ -821,6 +821,7 @@ i386_disasm (const uint8_t **startp, con
- 			    }
- 
- 			default:
-+			  str = "";
- 			  assert (! "INVALID not handled");
- 			}
- 		    }
diff --git a/meta/recipes-devtools/elfutils/elfutils/dso-link-change.patch b/meta/recipes-devtools/elfutils/elfutils/dso-link-change.patch
deleted file mode 100644
index d0cd3ed..0000000
--- a/meta/recipes-devtools/elfutils/elfutils/dso-link-change.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Upstream-Status: Pending
-
-# This patch makes the link to the dependencies of libdw explicit, as recent
-# ld no longer implicitly links them. See
-# http://lists.fedoraproject.org/pipermail/devel/2010-March/133601.html as
-# a similar example of the error message you can encounter without this patch,
-# and https://fedoraproject.org/wiki/UnderstandingDSOLinkChange and
-# https://fedoraproject.org/wiki/Features/ChangeInImplicitDSOLinking for more
-# details.
-
---- elfutils-0.148.orig/src/Makefile.am
-+++ elfutils-0.148/src/Makefile.am
-@@ -86,7 +86,7 @@ libdw = ../libdw/libdw.a $(zip_LIBS) $(l
- libelf = ../libelf/libelf.a
- else
- libasm = ../libasm/libasm.so
--libdw = ../libdw/libdw.so
-+libdw = ../libdw/libdw.so $(zip_LIBS) $(libelf) $(libebl) -ldl
- libelf = ../libelf/libelf.so
- endif
- libebl = ../libebl/libebl.a
---- elfutils-0.148.orig/tests/Makefile.am
-+++ elfutils-0.148/tests/Makefile.am
-@@ -172,7 +172,7 @@ libdw = ../libdw/libdw.a $(zip_LIBS) $(l
- libelf = ../libelf/libelf.a
- libasm = ../libasm/libasm.a
- else
--libdw = ../libdw/libdw.so
-+libdw = ../libdw/libdw.so $(zip_LIBS) $(libelf) $(libebl) -ldl
- libelf = ../libelf/libelf.so
- libasm = ../libasm/libasm.so
- endif
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.168.bb b/meta/recipes-devtools/elfutils/elfutils_0.170.bb
similarity index 71%
rename from meta/recipes-devtools/elfutils/elfutils_0.168.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.170.bb
index 0717616..8a339e4 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.168.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.170.bb
@@ -6,39 +6,33 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "libtool bzip2 zlib virtual/libintl"
 DEPENDS_append_libc-musl = " argp-standalone fts "
 SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2"
-SRC_URI[md5sum] = "52adfa40758d0d39e5d5c57689bf38d6"
-SRC_URI[sha256sum] = "b88d07893ba1373c7dd69a7855974706d05377766568a7d9002706d5de72c276"
+SRC_URI[md5sum] = "03599aee98c9b726c7a732a2dd0245d5"
+SRC_URI[sha256sum] = "1f844775576b79bdc9f9c717a50058d08620323c1e935458223a12f249c9e066"
 
 SRC_URI += "\
-        file://dso-link-change.patch \
-        file://Fix_elf_cvt_gunhash.patch \
-        file://fixheadercheck.patch \
-        file://0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch \
-        file://0001-remove-the-unneed-checking.patch \
-        file://0001-fix-a-stack-usage-warning.patch \
-        file://aarch64_uio.patch \
-        file://Fix_one_GCC7_warning.patch \
-        file://shadow.patch \
+        file://0001-dso-link-change.patch \
+        file://0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch \
+        file://0003-fixheadercheck.patch \
+        file://0004-Disable-the-test-to-convert-euc-jp.patch \
+        file://0005-fix-a-stack-usage-warning.patch \
+        file://0006-Fix-build-on-aarch64-musl.patch \
+        file://0007-Fix-control-path-where-we-have-str-as-uninitialized-.patch \
 "
+SRC_URI_append_libc-musl = " file://0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch"
 
-# pick the patch from debian
+# Pick patches from debian
 # http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.168-0.2.debian.tar.xz
 SRC_URI += "\
         file://debian/hppa_backend.diff \
         file://debian/arm_backend.diff \
-        file://debian/mips_backend.diff \
-        file://debian/testsuite-ignore-elflint.diff \
+        file://debian/mips_backend.patch \
         file://debian/mips_readelf_w.patch \
-        file://debian/kfreebsd_path.patch \
         file://debian/0001-Ignore-differences-between-mips-machine-identifiers.patch \
         file://debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch \
         file://debian/0003-Add-mips-n64-relocation-format-hack.patch \
-        file://debian/hurd_path.patch \
-        file://debian/ignore_strmerge.diff \
 "
 # Fix the patches from Debian with GCC7
-SRC_URI += "file://fallthrough.patch"
-SRC_URI_append_libc-musl = " file://0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch "
+SRC_URI += "file://debian/fallthrough.patch"
 
 # The buildsystem wants to generate 2 .h files from source using a binary it just built,
 # which can not pass the cross compiling, so let's work around it by adding 2 .h files
diff --git a/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch b/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
new file mode 100644
index 0000000..28c57f2
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
@@ -0,0 +1,52 @@
+From 0a69a26c9f7487daca900db87cd1195857a4603f Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 15 Aug 2017 17:10:57 +0800
+Subject: [PATCH 1/7] dso link change
+
+Upstream-Status: Pending
+
+This patch makes the link to the dependencies of libdw explicit, as
+recent ld no longer implicitly links them. See
+http://lists.fedoraproject.org/pipermail/devel/2010-March/133601.html
+as a similar example of the error message you can encounter without this
+patch, and https://fedoraproject.org/wiki/UnderstandingDSOLinkChange and
+https://fedoraproject.org/wiki/Features/ChangeInImplicitDSOLinking for
+more details.
+
+Rebase to 0.170
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/Makefile.am   | 2 +-
+ tests/Makefile.am | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 2b1c0dc..9305b84 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -44,7 +44,7 @@ libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) $(libebl) -ldl
+ libelf = ../libelf/libelf.a -lz
+ else
+ libasm = ../libasm/libasm.so
+-libdw = ../libdw/libdw.so
++libdw = ../libdw/libdw.so $(zip_LIBS) $(libelf) $(libebl) -ldl
+ libelf = ../libelf/libelf.so
+ endif
+ libebl = ../libebl/libebl.a
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 3735084..528615d 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -400,7 +400,7 @@ libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) $(libebl) -ldl
+ libelf = ../libelf/libelf.a -lz
+ libasm = ../libasm/libasm.a
+ else
+-libdw = ../libdw/libdw.so
++libdw = ../libdw/libdw.so $(zip_LIBS) $(libelf) $(libebl) -ldl
+ libelf = ../libelf/libelf.so
+ libasm = ../libasm/libasm.so
+ endif
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-devtools/elfutils/elfutils/Fix_elf_cvt_gunhash.patch b/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
similarity index 72%
rename from meta/recipes-devtools/elfutils/elfutils/Fix_elf_cvt_gunhash.patch
rename to meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
index f861e89..2f718eb 100644
--- a/meta/recipes-devtools/elfutils/elfutils/Fix_elf_cvt_gunhash.patch
+++ b/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
@@ -1,4 +1,7 @@
-Fix elf_cvt_gunhash if dest and src are same.
+From e98670f7c7b4c73fb65534949716fd8d043960d5 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 15 Aug 2017 17:13:59 +0800
+Subject: [PATCH 2/7] Fix elf_cvt_gunhash if dest and src are same.
 
 Upstream-Status: Pending
 
@@ -6,6 +9,13 @@ The 'dest' and 'src' can be same, we need to save the value of src32[2]
 before swaping it.
 
 Signed-off-by: Baoshan Pang <BaoShan.Pang@windriver.com>
+
+Rebase to 0.170
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ libelf/gnuhash_xlate.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
 diff --git a/libelf/gnuhash_xlate.h b/libelf/gnuhash_xlate.h
 index 6faf113..04d9ca1 100644
 --- a/libelf/gnuhash_xlate.h
@@ -27,3 +37,6 @@ index 6faf113..04d9ca1 100644
  
    /* Now the 64 bit words.  */
    Elf64_Xword *dest64 = (Elf64_Xword *) &dest32[4];
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/fixheadercheck.patch b/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
similarity index 69%
rename from meta/recipes-devtools/elfutils/elfutils-0.168/fixheadercheck.patch
rename to meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
index 5de3b24..7c49fce 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.168/fixheadercheck.patch
+++ b/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
@@ -1,13 +1,27 @@
-For some binaries we can get a invalid section alignment, for example if 
-sh_align = 1 and sh_addralign is 0. In the case of a zero size section like 
-".note.GNU-stack", this is irrelavent as far as I can tell and we shouldn't
+From 565d5935abf5b58773f9c8385c00189221980d98 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 15 Aug 2017 17:17:20 +0800
+Subject: [PATCH 3/7] fixheadercheck
+
+For some binaries we can get a invalid section alignment, for example if
+sh_align = 1 and sh_addralign is 0. In the case of a zero size section
+like
+".note.GNU-stack", this is irrelavent as far as I can tell and we
+shouldn't
 error in this case.
 
 RP 2014/6/11
 
 Upstream-Status: Pending
 
+Rebase to 0.170
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ libelf/elf32_updatenull.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
 diff --git a/libelf/elf32_updatenull.c b/libelf/elf32_updatenull.c
+index d83c0b3..a51bf70 100644
 --- a/libelf/elf32_updatenull.c
 +++ b/libelf/elf32_updatenull.c
 @@ -339,8 +339,8 @@ __elfw2(LIBELFBITS,updatenull_wrlock) (Elf *elf, int *change_bop, size_t shnum)
@@ -21,3 +35,6 @@ diff --git a/libelf/elf32_updatenull.c b/libelf/elf32_updatenull.c
  		    {
  		      __libelf_seterrno (ELF_E_INVALID_ALIGN);
  		      return -1;
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/0001-remove-the-unneed-checking.patch b/meta/recipes-devtools/elfutils/files/0004-Disable-the-test-to-convert-euc-jp.patch
similarity index 76%
rename from meta/recipes-devtools/elfutils/elfutils-0.168/0001-remove-the-unneed-checking.patch
rename to meta/recipes-devtools/elfutils/files/0004-Disable-the-test-to-convert-euc-jp.patch
index 5be92d7..d893ad6 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.168/0001-remove-the-unneed-checking.patch
+++ b/meta/recipes-devtools/elfutils/files/0004-Disable-the-test-to-convert-euc-jp.patch
@@ -1,4 +1,7 @@
-Disable the test to convert euc-jp
+From bb7ed11950101798aae82f7fda8b3dcb05f755c5 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 15 Aug 2017 17:24:06 +0800
+Subject: [PATCH 4/7] Disable the test to convert euc-jp
 
 Remove the test "Test against HP-UX 11.11 bug:
 No converter from EUC-JP to UTF-8 is provided"
@@ -9,6 +12,9 @@ iconv support and will cause guild-native building fail.
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
+
+Rebase to 0.170
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  m4/iconv.m4 | 2 ++
  1 file changed, 2 insertions(+)
@@ -34,5 +40,5 @@ index a503646..299f1eb 100644
  }]])],
          [am_cv_func_iconv_works=yes],
 -- 
-2.0.1
+1.8.3.1
 
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/0001-fix-a-stack-usage-warning.patch b/meta/recipes-devtools/elfutils/files/0005-fix-a-stack-usage-warning.patch
similarity index 72%
rename from meta/recipes-devtools/elfutils/elfutils-0.168/0001-fix-a-stack-usage-warning.patch
rename to meta/recipes-devtools/elfutils/files/0005-fix-a-stack-usage-warning.patch
index 6923bf7..22a01cf 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.168/0001-fix-a-stack-usage-warning.patch
+++ b/meta/recipes-devtools/elfutils/files/0005-fix-a-stack-usage-warning.patch
@@ -1,17 +1,24 @@
-[PATCH] fix a stack-usage warning
+From dd6dbf6af396519380f48c0ef1ce6cf4dd77f6d7 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 15 Aug 2017 17:25:16 +0800
+Subject: [PATCH 5/7] fix a stack-usage warning
 
 Upstream-Status: Pending
 
-not use a variable to as a array size, otherwise the warning to error that
+not use a variable to as a array size, otherwise the warning to error
+that
 stack usage might be unbounded [-Werror=stack-usage=] will happen
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
+
+Rebase to 0.170
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  backends/ppc_initreg.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/backends/ppc_initreg.c b/backends/ppc_initreg.c
-index 64f5379..52dde3e 100644
+index 69d623b..de41dec 100644
 --- a/backends/ppc_initreg.c
 +++ b/backends/ppc_initreg.c
 @@ -93,7 +93,7 @@ ppc_set_initial_registers_tid (pid_t tid __attribute__ ((unused)),
@@ -24,5 +31,5 @@ index 64f5379..52dde3e 100644
      dwarf_regs[gpr] = user_regs.r.gpr[gpr];
    if (! setfunc (0, gprs, dwarf_regs, arg))
 -- 
-1.9.1
+1.8.3.1
 
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/aarch64_uio.patch b/meta/recipes-devtools/elfutils/files/0006-Fix-build-on-aarch64-musl.patch
similarity index 51%
rename from meta/recipes-devtools/elfutils/elfutils-0.168/aarch64_uio.patch
rename to meta/recipes-devtools/elfutils/files/0006-Fix-build-on-aarch64-musl.patch
index 38dc57b..5f29a03 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.168/aarch64_uio.patch
+++ b/meta/recipes-devtools/elfutils/files/0006-Fix-build-on-aarch64-musl.patch
@@ -1,4 +1,7 @@
-Fix build on aarch64/musl
+From e57ad47fc8549353ca80c23b9b4f38f31fde13e5 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 15 Aug 2017 17:27:30 +0800
+Subject: [PATCH 6/7] Fix build on aarch64/musl
 
 Errors
 
@@ -10,20 +13,28 @@ error: redefinition
         ^
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Index: elfutils-0.163/backends/aarch64_initreg.c
-===================================================================
---- elfutils-0.163.orig/backends/aarch64_initreg.c
-+++ elfutils-0.163/backends/aarch64_initreg.c
+
+Rebase to 0.170
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ backends/aarch64_initreg.c | 4 ++--
+ backends/arm_initreg.c     | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/backends/aarch64_initreg.c b/backends/aarch64_initreg.c
+index daf6f37..6445276 100644
+--- a/backends/aarch64_initreg.c
++++ b/backends/aarch64_initreg.c
 @@ -33,7 +33,7 @@
  #include "system.h"
  #include <assert.h>
- #ifdef __aarch64__
+ #if defined(__aarch64__) && defined(__linux__)
 -# include <linux/uio.h>
 +# include <sys/uio.h>
  # include <sys/user.h>
  # include <sys/ptrace.h>
  /* Deal with old glibc defining user_pt_regs instead of user_regs_struct.  */
-@@ -82,7 +82,7 @@ aarch64_set_initial_registers_tid (pid_t
+@@ -82,7 +82,7 @@ aarch64_set_initial_registers_tid (pid_t tid __attribute__ ((unused)),
  
    Dwarf_Word dwarf_fregs[32];
    for (int r = 0; r < 32; r++)
@@ -32,11 +43,11 @@ Index: elfutils-0.163/backends/aarch64_initreg.c
  
    if (! setfunc (64, 32, dwarf_fregs, arg))
      return false;
-Index: elfutils-0.163/backends/arm_initreg.c
-===================================================================
---- elfutils-0.163.orig/backends/arm_initreg.c
-+++ elfutils-0.163/backends/arm_initreg.c
-@@ -37,7 +37,7 @@
+diff --git a/backends/arm_initreg.c b/backends/arm_initreg.c
+index efcabaf..062bb9e 100644
+--- a/backends/arm_initreg.c
++++ b/backends/arm_initreg.c
+@@ -38,7 +38,7 @@
  #endif
  
  #ifdef __aarch64__
@@ -45,3 +56,6 @@ Index: elfutils-0.163/backends/arm_initreg.c
  # include <sys/user.h>
  # include <sys/ptrace.h>
  /* Deal with old glibc defining user_pt_regs instead of user_regs_struct.  */
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-devtools/elfutils/files/0007-Fix-control-path-where-we-have-str-as-uninitialized-.patch b/meta/recipes-devtools/elfutils/files/0007-Fix-control-path-where-we-have-str-as-uninitialized-.patch
new file mode 100644
index 0000000..2247704
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/0007-Fix-control-path-where-we-have-str-as-uninitialized-.patch
@@ -0,0 +1,45 @@
+From 1e91c1d4e37c05cf95058b4b3c3f352d72886f58 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 15 Aug 2017 17:31:38 +0800
+Subject: [PATCH 7/7] Fix control path where we have str as uninitialized
+ string
+
+|
+/home/ubuntu/work/oe/openembedded-core/build/tmp-musl/work/i586-oe-linux-musl/elfutils/0.164-r0/elfutils-0.164/libcpu/i386_disasm.c:
+In function 'i386_disasm':
+|
+/home/ubuntu/work/oe/openembedded-core/build/tmp-musl/work/i586-oe-linux-musl/elfutils/0.164-r0/elfutils-0.164/libcpu/i386_disasm.c:310:5:
+error: 'str' may be used uninitialized in this function
+[-Werror=maybe-uninitialized]
+|      memcpy (buf + bufcnt, _str, _len);           \
+|      ^
+|
+/home/ubuntu/work/oe/openembedded-core/build/tmp-musl/work/i586-oe-linux-musl/elfutils/0.164-r0/elfutils-0.164/libcpu/i386_disasm.c:709:17:
+note: 'str' was declared here
+|      const char *str;
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Rebase to 0.170
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ libcpu/i386_disasm.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libcpu/i386_disasm.c b/libcpu/i386_disasm.c
+index 831afbe..60fd6d4 100644
+--- a/libcpu/i386_disasm.c
++++ b/libcpu/i386_disasm.c
+@@ -821,6 +821,7 @@ i386_disasm (Ebl *ebl __attribute__((unused)),
+ 			    }
+ 			  /* Fallthrough */
+ 			default:
++			  str = "";
+ 			  assert (! "INVALID not handled");
+ 			}
+ 		    }
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch b/meta/recipes-devtools/elfutils/files/0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch
similarity index 89%
rename from meta/recipes-devtools/elfutils/elfutils-0.168/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch
rename to meta/recipes-devtools/elfutils/files/0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch
index 020ffa1..8864d44 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.168/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch
+++ b/meta/recipes-devtools/elfutils/files/0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch
@@ -1,18 +1,18 @@
-From 054fedda5ab9b84160d40d90cb967f2f5822b889 Mon Sep 17 00:00:00 2001
+From 010b0c57e748440eb1ceb3d977875f2488d2b4ce Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 31 Dec 2015 06:35:34 +0000
+Date: Wed, 16 Aug 2017 10:06:26 +0800
 Subject: [PATCH] build: Provide alternatives for glibc assumptions helps
  compiling it on musl
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Rebase to 0.68
+Rebase to 0.170
+
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  Makefile.am                      |  2 +-
  lib/color.c                      |  3 ++-
- lib/crc32_file.c                 |  1 +
  lib/fixedsizehash.h              |  1 -
  lib/system.h                     | 10 ++++++++++
  lib/xmalloc.c                    |  2 +-
@@ -21,13 +21,13 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  libcpu/i386_gendis.c             |  2 +-
  libcpu/i386_lex.c                |  2 +-
  libcpu/i386_parse.c              |  2 +-
- libdw/Makefile.am                |  4 +++-
+ libdw/Makefile.am                |  3 ++-
  libdw/libdw_alloc.c              |  2 +-
  libdwfl/dwfl_build_id_find_elf.c |  3 ++-
  libdwfl/dwfl_error.c             |  4 +++-
  libdwfl/dwfl_module_getdwarf.c   |  1 +
  libdwfl/find-debuginfo.c         |  2 +-
- libdwfl/libdwfl_crc32_file.c     | 10 ++++++++++
+ libdwfl/libdwfl_crc32_file.c     |  9 +++++++++
  libdwfl/linux-kernel-modules.c   |  1 +
  libebl/eblopenbackend.c          |  2 +-
  libelf/elf.h                     |  8 ++++++--
@@ -80,7 +80,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  tests/sectiondump.c              |  2 +-
  tests/varlocs.c                  |  2 +-
  tests/vdsosyms.c                 |  2 +-
- 70 files changed, 98 insertions(+), 64 deletions(-)
+ 69 files changed, 95 insertions(+), 64 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
 index 2ff444e..41f77df 100644
@@ -96,10 +96,10 @@ index 2ff444e..41f77df 100644
  EXTRA_DIST = elfutils.spec GPG-KEY NOTES CONTRIBUTING \
  	     COPYING COPYING-GPLV2 COPYING-LGPLV3
 diff --git a/lib/color.c b/lib/color.c
-index fde2d9d..73292ac 100644
+index f62389d..a2a84b4 100644
 --- a/lib/color.c
 +++ b/lib/color.c
-@@ -32,12 +32,13 @@
+@@ -32,13 +32,14 @@
  #endif
  
  #include <argp.h>
@@ -110,22 +110,11 @@ index fde2d9d..73292ac 100644
  #include <string.h>
  #include <unistd.h>
  #include "libeu.h"
+ #include "color.h"
 +#include "system.h"
  
- 
  /* Prototype for option handler.  */
-diff --git a/lib/crc32_file.c b/lib/crc32_file.c
-index a8434d4..57e4298 100644
---- a/lib/crc32_file.c
-+++ b/lib/crc32_file.c
-@@ -35,6 +35,7 @@
- #include <unistd.h>
- #include <sys/stat.h>
- #include <sys/mman.h>
-+#include "system.h"
- 
- int
- crc32_file (int fd, uint32_t *resp)
+ static error_t parse_opt (int key, char *arg, struct argp_state *state);
 diff --git a/lib/fixedsizehash.h b/lib/fixedsizehash.h
 index dac2a5f..43016fc 100644
 --- a/lib/fixedsizehash.h
@@ -139,10 +128,10 @@ index dac2a5f..43016fc 100644
  #include <system.h>
  
 diff --git a/lib/system.h b/lib/system.h
-index ccd99d6..0e93e60 100644
+index 9203335..1a60131 100644
 --- a/lib/system.h
 +++ b/lib/system.h
-@@ -55,6 +55,16 @@
+@@ -50,6 +50,16 @@
  #else
  # error "Unknown byte order"
  #endif
@@ -173,7 +162,7 @@ index 0cde384..217b054 100644
  #include <stddef.h>
  #include <stdlib.h>
 diff --git a/libasm/asm_end.c b/libasm/asm_end.c
-index 191a535..bf5ab06 100644
+index ced24f5..4ad918c 100644
 --- a/libasm/asm_end.c
 +++ b/libasm/asm_end.c
 @@ -32,7 +32,7 @@
@@ -212,10 +201,10 @@ index aae5eae..6d76016 100644
  #include <stdio.h>
  #include <stdlib.h>
 diff --git a/libcpu/i386_lex.c b/libcpu/i386_lex.c
-index b670608..b842c25 100644
+index ba5f4aa..b1e4191 100644
 --- a/libcpu/i386_lex.c
 +++ b/libcpu/i386_lex.c
-@@ -592,7 +592,7 @@ char *i386_text;
+@@ -577,7 +577,7 @@ char *i386_text;
  #endif
  
  #include <ctype.h>
@@ -225,7 +214,7 @@ index b670608..b842c25 100644
  
  #include <libeu.h>
 diff --git a/libcpu/i386_parse.c b/libcpu/i386_parse.c
-index 724addf..5b67802 100644
+index ef1ac35..48f2e64 100644
 --- a/libcpu/i386_parse.c
 +++ b/libcpu/i386_parse.c
 @@ -107,7 +107,7 @@
@@ -238,27 +227,19 @@ index 724addf..5b67802 100644
  #include <libintl.h>
  #include <math.h>
 diff --git a/libdw/Makefile.am b/libdw/Makefile.am
-index 082d96c..51cbea0 100644
+index ff8c291..89e792a 100644
 --- a/libdw/Makefile.am
 +++ b/libdw/Makefile.am
-@@ -102,6 +102,8 @@ endif
- libdw_pic_a_SOURCES =
- am_libdw_pic_a_OBJECTS = $(libdw_a_SOURCES:.c=.os)
- 
+@@ -105,7 +105,8 @@ am_libdw_pic_a_OBJECTS = $(libdw_a_SOURCES:.c=.os)
+ libdw_so_LIBS = libdw_pic.a ../libdwelf/libdwelf_pic.a \
+ 	  ../libdwfl/libdwfl_pic.a ../libebl/libebl.a
+ libdw_so_DEPS = ../lib/libeu.a ../libelf/libelf.so
+-libdw_so_LDLIBS = $(libdw_so_DEPS) -ldl -lz $(argp_LDADD) $(zip_LIBS)
 +fts_LDADD = -lfts
-+
++libdw_so_LDLIBS = $(libdw_so_DEPS) -ldl -lz $(argp_LDADD) $(zip_LIBS) $(fts_LDADD)
  libdw_so_SOURCES =
- libdw.so$(EXEEXT): $(srcdir)/libdw.map libdw_pic.a ../libdwelf/libdwelf_pic.a \
- 	  ../libdwfl/libdwfl_pic.a ../libebl/libebl.a \
-@@ -112,7 +114,7 @@ libdw.so$(EXEEXT): $(srcdir)/libdw.map libdw_pic.a ../libdwelf/libdwelf_pic.a \
- 		-Wl,--enable-new-dtags,-rpath,$(pkglibdir) \
- 		-Wl,--version-script,$<,--no-undefined \
- 		-Wl,--whole-archive $(filter-out $<,$^) -Wl,--no-whole-archive\
--		-ldl -lz $(argp_LDADD) $(zip_LIBS)
-+		-ldl -lz $(argp_LDADD) $(zip_LIBS) $(fts_LDADD)
- 	@$(textrel_check)
- 	$(AM_V_at)ln -fs $@ $@.$(VERSION)
- 
+ libdw.so$(EXEEXT): $(srcdir)/libdw.map $(libdw_so_LIBS) $(libdw_so_DEPS)
+ # The rpath is necessary for libebl because its $ORIGIN use will
 diff --git a/libdw/libdw_alloc.c b/libdw/libdw_alloc.c
 index 28a8cf6..29aeb3f 100644
 --- a/libdw/libdw_alloc.c
@@ -273,18 +254,18 @@ index 28a8cf6..29aeb3f 100644
  #include <stdlib.h>
  #include "libdwP.h"
 diff --git a/libdwfl/dwfl_build_id_find_elf.c b/libdwfl/dwfl_build_id_find_elf.c
-index 903e193..b00d10c 100644
+index ee0c164..b06ab59 100644
 --- a/libdwfl/dwfl_build_id_find_elf.c
 +++ b/libdwfl/dwfl_build_id_find_elf.c
-@@ -27,6 +27,7 @@
-    not, see <http://www.gnu.org/licenses/>.  */
+@@ -31,6 +31,7 @@
+ #endif
  
  #include "libdwflP.h"
 +#include "system.h"
  #include <inttypes.h>
  #include <fcntl.h>
  #include <unistd.h>
-@@ -94,7 +95,7 @@ __libdwfl_open_by_build_id (Dwfl_Module *mod, bool debug, char **file_name,
+@@ -99,7 +100,7 @@ __libdwfl_open_by_build_id (Dwfl_Module *mod, bool debug, char **file_name,
  	{
  	  if (*file_name != NULL)
  	    free (*file_name);
@@ -316,22 +297,22 @@ index 7bcf61c..c345797 100644
        return elf_errmsg (error & 0xffff);
      case OTHER_ERROR (LIBDW):
 diff --git a/libdwfl/dwfl_module_getdwarf.c b/libdwfl/dwfl_module_getdwarf.c
-index 0e8810b..82ad665 100644
+index 9775ace..511c4a6 100644
 --- a/libdwfl/dwfl_module_getdwarf.c
 +++ b/libdwfl/dwfl_module_getdwarf.c
-@@ -31,6 +31,7 @@
+@@ -35,6 +35,7 @@
  #include <fcntl.h>
  #include <string.h>
  #include <unistd.h>
 +#include "system.h"
  #include "../libdw/libdwP.h"	/* DWARF_E_* values are here.  */
  #include "../libelf/libelfP.h"
- 
+ #include "system.h"
 diff --git a/libdwfl/find-debuginfo.c b/libdwfl/find-debuginfo.c
-index 80515db..80b0148 100644
+index 6d5a42a..9267788 100644
 --- a/libdwfl/find-debuginfo.c
 +++ b/libdwfl/find-debuginfo.c
-@@ -385,7 +385,7 @@ dwfl_standard_find_debuginfo (Dwfl_Module *mod,
+@@ -389,7 +389,7 @@ dwfl_standard_find_debuginfo (Dwfl_Module *mod,
        /* If FILE_NAME is a symlink, the debug file might be associated
  	 with the symlink target name instead.  */
  
@@ -341,32 +322,31 @@ index 80515db..80b0148 100644
  	fd = find_debuginfo_in_path (mod, canon,
  				     debuglink_file, debuglink_crc,
 diff --git a/libdwfl/libdwfl_crc32_file.c b/libdwfl/libdwfl_crc32_file.c
-index 6b6b7d3..debc4a4 100644
+index f849128..6f0aca1 100644
 --- a/libdwfl/libdwfl_crc32_file.c
 +++ b/libdwfl/libdwfl_crc32_file.c
-@@ -31,6 +31,16 @@
+@@ -29,6 +29,15 @@
+ # include <config.h>
+ #endif
  
- #define crc32_file attribute_hidden __libdwfl_crc32_file
- #define crc32 __libdwfl_crc32
-+
 +#ifndef TEMP_FAILURE_RETRY
 +#define TEMP_FAILURE_RETRY(expression) \
-+  (__extension__							      \
-+    ({ long int __result;						      \
-+       do __result = (long int) (expression);				      \
-+       while (__result == -1L && errno == EINTR);			      \
++  (__extension__                                                             \
++    ({ long int __result;                                                    \
++       do __result = (long int) (expression);                                \
++       while (__result == -1L && errno == EINTR);                            \
 +       __result; }))
 +#endif
 +
- #define LIB_SYSTEM_H	1
+ #define crc32_file attribute_hidden __libdwfl_crc32_file
+ #define crc32 __libdwfl_crc32
  #include <libdwflP.h>
- #include "../lib/crc32_file.c"
 diff --git a/libdwfl/linux-kernel-modules.c b/libdwfl/linux-kernel-modules.c
-index 9cd8ea9..4dbf4c5 100644
+index 9d0fef2..9fc09b8 100644
 --- a/libdwfl/linux-kernel-modules.c
 +++ b/libdwfl/linux-kernel-modules.c
-@@ -36,6 +36,7 @@
- #include <config.h>
+@@ -40,6 +40,7 @@
+ #include <system.h>
  
  #include "libdwflP.h"
 +#include "system.h"
@@ -374,7 +354,7 @@ index 9cd8ea9..4dbf4c5 100644
  #include <errno.h>
  #include <stdio.h>
 diff --git a/libebl/eblopenbackend.c b/libebl/eblopenbackend.c
-index 34d439a..56d2345 100644
+index 5371396..2e66dfd 100644
 --- a/libebl/eblopenbackend.c
 +++ b/libebl/eblopenbackend.c
 @@ -32,7 +32,7 @@
@@ -387,7 +367,7 @@ index 34d439a..56d2345 100644
  #include <dwarf.h>
  #include <stdlib.h>
 diff --git a/libelf/elf.h b/libelf/elf.h
-index 74654d6..81eee8b 100644
+index 5cf2b93..990b3af 100644
 --- a/libelf/elf.h
 +++ b/libelf/elf.h
 @@ -21,7 +21,9 @@
@@ -401,7 +381,7 @@ index 74654d6..81eee8b 100644
  
  /* Standard ELF types.  */
  
-@@ -3704,6 +3706,8 @@ enum
+@@ -3705,6 +3707,8 @@ enum
  #define R_BPF_NONE		0	/* No reloc */
  #define R_BPF_MAP_FD		1	/* Map fd to pointer */
  
@@ -412,7 +392,7 @@ index 74654d6..81eee8b 100644
  
  #endif	/* elf.h */
 diff --git a/libelf/libelf.h b/libelf/libelf.h
-index c0d6389..38a68fd 100644
+index 547c0f5..dd78799 100644
 --- a/libelf/libelf.h
 +++ b/libelf/libelf.h
 @@ -29,6 +29,7 @@
@@ -424,10 +404,10 @@ index c0d6389..38a68fd 100644
  #include <sys/types.h>
  
 diff --git a/libelf/libelfP.h b/libelf/libelfP.h
-index 4459982..1296f20 100644
+index 7ee6625..5840899 100644
 --- a/libelf/libelfP.h
 +++ b/libelf/libelfP.h
-@@ -36,6 +36,7 @@
+@@ -32,6 +32,7 @@
  
  #include <ar.h>
  #include <gelf.h>
@@ -436,7 +416,7 @@ index 4459982..1296f20 100644
  #include <errno.h>
  #include <stdbool.h>
 diff --git a/src/addr2line.c b/src/addr2line.c
-index 0222088..cd6a9a6 100644
+index ba414a7..04b7116 100644
 --- a/src/addr2line.c
 +++ b/src/addr2line.c
 @@ -23,7 +23,7 @@
@@ -449,7 +429,7 @@ index 0222088..cd6a9a6 100644
  #include <inttypes.h>
  #include <libdwfl.h>
 diff --git a/src/ar.c b/src/ar.c
-index f2f322b..6e70031 100644
+index ec32cee..4efd729 100644
 --- a/src/ar.c
 +++ b/src/ar.c
 @@ -22,7 +22,7 @@
@@ -488,7 +468,7 @@ index 553fc57..46443d0 100644
  #include <limits.h>
  #include <string.h>
 diff --git a/src/elfcmp.c b/src/elfcmp.c
-index 401ab31..873d253 100644
+index 5046420..cff183f 100644
 --- a/src/elfcmp.c
 +++ b/src/elfcmp.c
 @@ -23,7 +23,7 @@
@@ -501,7 +481,7 @@ index 401ab31..873d253 100644
  #include <locale.h>
  #include <libintl.h>
 diff --git a/src/elflint.c b/src/elflint.c
-index 7d3f227..074d21c 100644
+index 51e53c2..da0b0dc 100644
 --- a/src/elflint.c
 +++ b/src/elflint.c
 @@ -24,7 +24,7 @@
@@ -514,7 +494,7 @@ index 7d3f227..074d21c 100644
  #include <gelf.h>
  #include <inttypes.h>
 diff --git a/src/findtextrel.c b/src/findtextrel.c
-index dc41502..325888c 100644
+index 8f1e239..71463af 100644
 --- a/src/findtextrel.c
 +++ b/src/findtextrel.c
 @@ -23,7 +23,7 @@
@@ -527,7 +507,7 @@ index dc41502..325888c 100644
  #include <gelf.h>
  #include <libdw.h>
 diff --git a/src/nm.c b/src/nm.c
-index c54e96f..9e031d9 100644
+index 969c6d3..3113c04 100644
 --- a/src/nm.c
 +++ b/src/nm.c
 @@ -26,7 +26,7 @@
@@ -540,7 +520,7 @@ index c54e96f..9e031d9 100644
  #include <gelf.h>
  #include <inttypes.h>
 diff --git a/src/objdump.c b/src/objdump.c
-index fff4b81..4b1f966 100644
+index 860cfac..61e67bf 100644
 --- a/src/objdump.c
 +++ b/src/objdump.c
 @@ -21,7 +21,7 @@
@@ -553,7 +533,7 @@ index fff4b81..4b1f966 100644
  #include <inttypes.h>
  #include <libintl.h>
 diff --git a/src/ranlib.c b/src/ranlib.c
-index 41a3bcf..0c7da2c 100644
+index cc0ee23..ae851e4 100644
 --- a/src/ranlib.c
 +++ b/src/ranlib.c
 @@ -24,7 +24,7 @@
@@ -566,7 +546,7 @@ index 41a3bcf..0c7da2c 100644
  #include <gelf.h>
  #include <libintl.h>
 diff --git a/src/readelf.c b/src/readelf.c
-index d18a4b7..a6cfb35 100644
+index 346eccd..c831aa8 100644
 --- a/src/readelf.c
 +++ b/src/readelf.c
 @@ -25,7 +25,7 @@
@@ -579,7 +559,7 @@ index d18a4b7..a6cfb35 100644
  #include <gelf.h>
  #include <inttypes.h>
 diff --git a/src/size.c b/src/size.c
-index de0d791..4639d42 100644
+index ad8dbcb..fd83be0 100644
 --- a/src/size.c
 +++ b/src/size.c
 @@ -21,7 +21,7 @@
@@ -592,7 +572,7 @@ index de0d791..4639d42 100644
  #include <gelf.h>
  #include <inttypes.h>
 diff --git a/src/stack.c b/src/stack.c
-index a5a7beb..4c075bc 100644
+index 6f2ff69..6da0243 100644
 --- a/src/stack.c
 +++ b/src/stack.c
 @@ -18,7 +18,7 @@
@@ -605,7 +585,7 @@ index a5a7beb..4c075bc 100644
  #include <inttypes.h>
  #include <stdio.h>
 diff --git a/src/strings.c b/src/strings.c
-index 49aab8b..09d5b1c 100644
+index d214356..76cb26b 100644
 --- a/src/strings.c
 +++ b/src/strings.c
 @@ -25,7 +25,7 @@
@@ -618,7 +598,7 @@ index 49aab8b..09d5b1c 100644
  #include <gelf.h>
  #include <inttypes.h>
 diff --git a/src/strip.c b/src/strip.c
-index a875ddf..fd76f7f 100644
+index c7830ec..0d7f148 100644
 --- a/src/strip.c
 +++ b/src/strip.c
 @@ -24,7 +24,7 @@
@@ -628,10 +608,10 @@ index a875ddf..fd76f7f 100644
 -#include <error.h>
 +#include <err.h>
  #include <fcntl.h>
+ #include <fnmatch.h>
  #include <gelf.h>
- #include <libelf.h>
 diff --git a/src/unstrip.c b/src/unstrip.c
-index d838ae9..0108272 100644
+index 5074909..3d4f952 100644
 --- a/src/unstrip.c
 +++ b/src/unstrip.c
 @@ -31,7 +31,7 @@
@@ -670,7 +650,7 @@ index 286f7e3..c9de089 100644
  #include <argp.h>
  #include <assert.h>
 diff --git a/tests/backtrace-data.c b/tests/backtrace-data.c
-index b7158da..354fa6a 100644
+index a387d8f..955c27d 100644
 --- a/tests/backtrace-data.c
 +++ b/tests/backtrace-data.c
 @@ -27,7 +27,7 @@
@@ -683,7 +663,7 @@ index b7158da..354fa6a 100644
  #include <dwarf.h>
  #if defined(__x86_64__) && defined(__linux__)
 diff --git a/tests/backtrace-dwarf.c b/tests/backtrace-dwarf.c
-index a644c8a..b8cbe27 100644
+index 2dc8a9a..24ca7fb 100644
 --- a/tests/backtrace-dwarf.c
 +++ b/tests/backtrace-dwarf.c
 @@ -22,7 +22,7 @@
@@ -693,10 +673,10 @@ index a644c8a..b8cbe27 100644
 -#include <error.h>
 +#include <err.h>
  #include <unistd.h>
- #include <sys/ptrace.h>
  #include <sys/types.h>
+ #include <sys/wait.h>
 diff --git a/tests/backtrace.c b/tests/backtrace.c
-index 1ff6353..47e3f7b 100644
+index 21abe8a..d733248 100644
 --- a/tests/backtrace.c
 +++ b/tests/backtrace.c
 @@ -24,7 +24,7 @@
@@ -1047,5 +1027,5 @@ index b876c10..afb2823 100644
  #include <stdio.h>
  #include <string.h>
 -- 
-2.8.1
+1.8.3.1
 
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/debian/0001-Ignore-differences-between-mips-machine-identifiers.patch b/meta/recipes-devtools/elfutils/files/debian/0001-Ignore-differences-between-mips-machine-identifiers.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.168/debian/0001-Ignore-differences-between-mips-machine-identifiers.patch
rename to meta/recipes-devtools/elfutils/files/debian/0001-Ignore-differences-between-mips-machine-identifiers.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch b/meta/recipes-devtools/elfutils/files/debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.168/debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch
rename to meta/recipes-devtools/elfutils/files/debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/debian/0003-Add-mips-n64-relocation-format-hack.patch b/meta/recipes-devtools/elfutils/files/debian/0003-Add-mips-n64-relocation-format-hack.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.168/debian/0003-Add-mips-n64-relocation-format-hack.patch
rename to meta/recipes-devtools/elfutils/files/debian/0003-Add-mips-n64-relocation-format-hack.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/debian/arm_backend.diff b/meta/recipes-devtools/elfutils/files/debian/arm_backend.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.168/debian/arm_backend.diff
rename to meta/recipes-devtools/elfutils/files/debian/arm_backend.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/fallthrough.patch b/meta/recipes-devtools/elfutils/files/debian/fallthrough.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.168/fallthrough.patch
rename to meta/recipes-devtools/elfutils/files/debian/fallthrough.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/debian/hppa_backend.diff b/meta/recipes-devtools/elfutils/files/debian/hppa_backend.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.168/debian/hppa_backend.diff
rename to meta/recipes-devtools/elfutils/files/debian/hppa_backend.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/debian/mips_backend.diff b/meta/recipes-devtools/elfutils/files/debian/mips_backend.patch
similarity index 92%
rename from meta/recipes-devtools/elfutils/elfutils-0.168/debian/mips_backend.diff
rename to meta/recipes-devtools/elfutils/files/debian/mips_backend.patch
index a5e76dd..2e0e54b 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.168/debian/mips_backend.diff
+++ b/meta/recipes-devtools/elfutils/files/debian/mips_backend.patch
@@ -1,8 +1,60 @@
+From 46d0d0ca718093486eeeedf1b44134e9e29b56f7 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 16 Aug 2017 09:18:59 +0800
+Subject: [PATCH] mips backends
+
 Upstream-Status: Backport [from debian]
+
+Rebase to 0.170
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ backends/Makefile.am    |   8 +-
+ backends/mips_init.c    |  59 +++++++++
+ backends/mips_regs.c    | 104 ++++++++++++++++
+ backends/mips_reloc.def |  79 ++++++++++++
+ backends/mips_retval.c  | 321 ++++++++++++++++++++++++++++++++++++++++++++++++
+ backends/mips_symbol.c  |  52 ++++++++
+ libebl/eblopenbackend.c |   2 +
+ 7 files changed, 623 insertions(+), 2 deletions(-)
+ create mode 100644 backends/mips_init.c
+ create mode 100644 backends/mips_regs.c
+ create mode 100644 backends/mips_reloc.def
+ create mode 100644 backends/mips_retval.c
+ create mode 100644 backends/mips_symbol.c
 
-Index: b/backends/mips_init.c
-===================================================================
+diff --git a/backends/Makefile.am b/backends/Makefile.am
+index 7f1f5d4..91baf6e 100644
+--- a/backends/Makefile.am
++++ b/backends/Makefile.am
+@@ -33,12 +33,12 @@ AM_CPPFLAGS += -I$(top_srcdir)/libebl -I$(top_srcdir)/libasm \
+ 
+ 
+ modules = i386 sh x86_64 ia64 alpha arm aarch64 sparc ppc ppc64 s390 \
+-	  tilegx m68k bpf parisc
++	  tilegx m68k bpf parisc mips
+ libebl_pic = libebl_i386_pic.a libebl_sh_pic.a libebl_x86_64_pic.a    \
+ 	     libebl_ia64_pic.a libebl_alpha_pic.a libebl_arm_pic.a    \
+ 	     libebl_aarch64_pic.a libebl_sparc_pic.a libebl_ppc_pic.a \
+ 	     libebl_ppc64_pic.a libebl_s390_pic.a libebl_tilegx_pic.a \
+-	     libebl_m68k_pic.a libebl_bpf_pic.a libebl_parisc_pic.a
++	     libebl_m68k_pic.a libebl_bpf_pic.a libebl_parisc_pic.a libebl_mips_pic.a
+ noinst_LIBRARIES = $(libebl_pic)
+ noinst_DATA = $(libebl_pic:_pic.a=.so)
+ 
+@@ -128,6 +128,10 @@ parisc_SRCS = parisc_init.c parisc_symbol.c parisc_regs.c parisc_retval.c
+ libebl_parisc_pic_a_SOURCES = $(parisc_SRCS)
+ am_libebl_parisc_pic_a_OBJECTS = $(parisc_SRCS:.c=.os)
+ 
++mips_SRCS = mips_init.c mips_symbol.c mips_regs.c mips_retval.c
++libebl_mips_pic_a_SOURCES = $(mips_SRCS)
++am_libebl_mips_pic_a_OBJECTS = $(mips_SRCS:.c=.os)
++
+ libebl_%.so libebl_%.map: libebl_%_pic.a $(libelf) $(libdw) $(libeu)
+ 	@rm -f $(@:.so=.map)
+ 	$(AM_V_at)echo 'ELFUTILS_$(PACKAGE_VERSION) { global: $*_init; local: *; };' \
+diff --git a/backends/mips_init.c b/backends/mips_init.c
+new file mode 100644
+index 0000000..975c04e
 --- /dev/null
 +++ b/backends/mips_init.c
 @@ -0,0 +1,59 @@
@@ -65,8 +117,9 @@ Index: b/backends/mips_init.c
 +
 +  return MODVERSION;
 +}
-Index: b/backends/mips_regs.c
-===================================================================
+diff --git a/backends/mips_regs.c b/backends/mips_regs.c
+new file mode 100644
+index 0000000..44f86cb
 --- /dev/null
 +++ b/backends/mips_regs.c
 @@ -0,0 +1,104 @@
@@ -174,8 +227,9 @@ Index: b/backends/mips_regs.c
 +  name[namelen++] = '\0';
 +  return namelen;
 +}
-Index: b/backends/mips_reloc.def
-===================================================================
+diff --git a/backends/mips_reloc.def b/backends/mips_reloc.def
+new file mode 100644
+index 0000000..4579970
 --- /dev/null
 +++ b/backends/mips_reloc.def
 @@ -0,0 +1,79 @@
@@ -258,8 +312,9 @@ Index: b/backends/mips_reloc.def
 +
 +#define NO_COPY_RELOC 1
 +#define NO_RELATIVE_RELOC 1
-Index: b/backends/mips_retval.c
-===================================================================
+diff --git a/backends/mips_retval.c b/backends/mips_retval.c
+new file mode 100644
+index 0000000..656cd1f
 --- /dev/null
 +++ b/backends/mips_retval.c
 @@ -0,0 +1,321 @@
@@ -584,8 +639,9 @@ Index: b/backends/mips_retval.c
 +     DWARF and might be valid.  */
 +  return -2;
 +}
-Index: b/backends/mips_symbol.c
-===================================================================
+diff --git a/backends/mips_symbol.c b/backends/mips_symbol.c
+new file mode 100644
+index 0000000..ba465fe
 --- /dev/null
 +++ b/backends/mips_symbol.c
 @@ -0,0 +1,52 @@
@@ -641,11 +697,11 @@ Index: b/backends/mips_symbol.c
 +      return ELF_T_NUM;
 +    }
 +}
-Index: b/libebl/eblopenbackend.c
-===================================================================
+diff --git a/libebl/eblopenbackend.c b/libebl/eblopenbackend.c
+index 1f81477..5371396 100644
 --- a/libebl/eblopenbackend.c
 +++ b/libebl/eblopenbackend.c
-@@ -71,6 +71,8 @@ static const struct
+@@ -72,6 +72,8 @@ static const struct
    { "sparc", "elf_sparc", "sparc", 5, EM_SPARC, 0, 0 },
    { "sparc", "elf_sparcv8plus", "sparc", 5, EM_SPARC32PLUS, 0, 0 },
    { "s390", "ebl_s390", "s390", 4, EM_S390, 0, 0 },
@@ -654,33 +710,6 @@ Index: b/libebl/eblopenbackend.c
  
    { "m32", "elf_m32", "m32", 3, EM_M32, 0, 0 },
    { "m68k", "elf_m68k", "m68k", 4, EM_68K, ELFCLASS32, ELFDATA2MSB },
-Index: b/backends/Makefile.am
-===================================================================
---- a/backends/Makefile.am
-+++ b/backends/Makefile.am
-@@ -33,12 +33,12 @@ AM_CPPFLAGS += -I$(top_srcdir)/libebl -I
- 
- 
- modules = i386 sh x86_64 ia64 alpha arm aarch64 sparc ppc ppc64 s390 \
--	  tilegx m68k bpf parisc
-+	  tilegx m68k bpf parisc mips
- libebl_pic = libebl_i386_pic.a libebl_sh_pic.a libebl_x86_64_pic.a    \
- 	     libebl_ia64_pic.a libebl_alpha_pic.a libebl_arm_pic.a    \
- 	     libebl_aarch64_pic.a libebl_sparc_pic.a libebl_ppc_pic.a \
- 	     libebl_ppc64_pic.a libebl_s390_pic.a libebl_tilegx_pic.a \
--	     libebl_m68k_pic.a libebl_bpf_pic.a libebl_parisc_pic.a
-+	     libebl_m68k_pic.a libebl_bpf_pic.a libebl_parisc_pic.a libebl_mips_pic.a
- noinst_LIBRARIES = $(libebl_pic)
- noinst_DATA = $(libebl_pic:_pic.a=.so)
- 
-@@ -132,6 +132,10 @@ parisc_SRCS = parisc_init.c parisc_symbo
- libebl_parisc_pic_a_SOURCES = $(parisc_SRCS)
- am_libebl_parisc_pic_a_OBJECTS = $(parisc_SRCS:.c=.os)
- 
-+mips_SRCS = mips_init.c mips_symbol.c mips_regs.c mips_retval.c
-+libebl_mips_pic_a_SOURCES = $(mips_SRCS)
-+am_libebl_mips_pic_a_OBJECTS = $(mips_SRCS:.c=.os)
-+
- libebl_%.so libebl_%.map: libebl_%_pic.a $(libelf) $(libdw)
- 	@rm -f $(@:.so=.map)
- 	$(AM_V_at)echo 'ELFUTILS_$(PACKAGE_VERSION) { global: $*_init; local: *; };' \
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/debian/mips_readelf_w.patch b/meta/recipes-devtools/elfutils/files/debian/mips_readelf_w.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.168/debian/mips_readelf_w.patch
rename to meta/recipes-devtools/elfutils/files/debian/mips_readelf_w.patch
-- 
2.8.1


