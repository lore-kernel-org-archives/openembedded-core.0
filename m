Return-Path: <dave.lerner@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A8B476EDBC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2014 15:28:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1FFSKnP025323
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 15 Feb 2014 07:28:20 -0800 (PST)
Received: from ord-dlerner-l8.dgvlm.wrs.com (128.224.65.202) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sat, 15 Feb 2014 07:28:20 -0800
From: Dave Lerner <dave.lerner@windriver.com>
To: <sgw@linux.intel.com>
Date: Sat, 15 Feb 2014 09:27:31 -0600
Message-ID: <1392478051-10530-2-git-send-email-dave.lerner@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1392478051-10530-1-git-send-email-dave.lerner@windriver.com>
References: <1392478051-10530-1-git-send-email-dave.lerner@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/1] valgrind: integration of regression tests to ptest
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
X-List-Received-Date: Sat, 15 Feb 2014 15:28:23 -0000
Content-Type: text/plain

Modifies valgrind's regression test framework to be compatible
with the yocto PTEST framework as follows:
 * existing recipe valgrind*bb adds new methods: do_compile_ptest and
   do_install_ptest.
 * new file run-ptest adds the wrapper interface to the valgrind
   regression test script vg_regtest.
 * existing valgrind regression test script 'vg_regtest' changes
   to report the status of the valgrind component tests in the
   format that PTEST expects, instead of the valgrind formats, but only
   when vg_regtest is invoked with an optional --yocto-ptest argument
 * four new patches disable building tests that don't compile with
   the yocto compiler and default options. See the patches for details.

Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
---
 .../valgrind/valgrind/add-ptest.patch              |  205 ++++++++++++++++++++
 .../valgrind/valgrind/force-nostabs.patch          |   42 ++++
 .../valgrind/remove-arm-variant-specific.patch     |   67 +++++++
 .../valgrind/remove-ppc-tests-failing-build.patch  |   75 +++++++
 meta/recipes-devtools/valgrind/valgrind/run-ptest  |   11 ++
 meta/recipes-devtools/valgrind/valgrind_3.9.0.bb   |   56 +++++-
 6 files changed, 455 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/add-ptest.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/force-nostabs.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/remove-arm-variant-specific.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/remove-ppc-tests-failing-build.patch
 create mode 100755 meta/recipes-devtools/valgrind/valgrind/run-ptest

diff --git a/meta/recipes-devtools/valgrind/valgrind/add-ptest.patch b/meta/recipes-devtools/valgrind/valgrind/add-ptest.patch
new file mode 100644
index 0000000..fdc9cc0
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/add-ptest.patch
@@ -0,0 +1,205 @@
+Modify vg_test wrapper to support PTEST formats
+
+This commit changes the valgrind regression test script vg_regtest to
+support the yocto ptest stdout reporting format.  The commit adds
+'--yocto-ptest' as an optional argument to vg_regtest, which alters
+the output to use the ptest infrastructure reporting format:
+    "[PASS|SKIP|FAIL]: testname"
+instead of valgrind's internal test reporting format.  Without the added
+option, --yocto-ptest, the valgrind regression test output is unchanged.
+
+Upstream-Status: Pending
+
+Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
+
+diff --git a/tests/vg_regtest.in b/tests/vg_regtest.in
+index 224385f..dbbd23d 100755
+--- a/tests/vg_regtest.in
++++ b/tests/vg_regtest.in
+@@ -39,11 +39,11 @@
+ #               --valgrind.)
+ #   --keep-unfiltered: keep a copy of the unfiltered output/error output
+ #     of each test by adding an extension .unfiltered.out
+-#
+ #   --outer-valgrind: run this valgrind under the given outer valgrind.
+ #     This valgrind must be configured with --enable-inner.
+ #   --outer-tool: tool to use by the outer valgrind (default memcheck).
+ #   --outer-args: use this as outer tool args.
++#   --yocto-ptest: output in yocto ptest format
+ #
+ # The easiest way is to run all tests in valgrind/ with (assuming you installed
+ # in $PREFIX):
+@@ -126,7 +126,7 @@ use strict;
+ my $usage="\n"
+      . "Usage:\n"
+      . "   vg_regtest [--all, --valgrind, --valgrind-lib, --keep-unfiltered\n"
+-     . "                 --outer-valgrind, --outer-tool, --outer-args]\n"
++     . "                 --outer-valgrind, --outer-tool, --outer-args, --yocto-ptest]\n"
+      . "   Use EXTRA_REGTEST_OPTS to supply extra args for all tests\n"
+      . "\n";
+ 
+@@ -170,6 +170,7 @@ my $outer_args;
+ 
+ my $valgrind_lib = "$tests_dir/.in_place";
+ my $keepunfiltered = 0;
++my $yoctoptest = 0;
+ 
+ # default filter is the one named "filter_stderr" in the test's directory
+ my $default_stderr_filter = "filter_stderr";
+@@ -226,6 +227,8 @@ sub process_command_line()
+                 $valgrind_lib = $1;
+             } elsif ($arg =~ /^--keep-unfiltered$/) {
+                 $keepunfiltered = 1;
++            } elsif ($arg =~ /^--yocto-ptest$/) {
++                $yoctoptest = 1;
+             } else {
+                 die $usage;
+             }
+@@ -394,19 +397,21 @@ sub do_diffs($$$$)
+                 # A match;  remove .out and any previously created .diff files.
+                 unlink("$name.$mid.out");
+                 unlink(<$name.$mid.diff*>);
+-                return;
++                return 0;
+             }
+         }
+     }
+     # If we reach here, none of the .exp files matched.
+-    print "*** $name failed ($mid) ***\n";
++    print "*** $name failed ($mid) ***\n" if ($yoctoptest == 0) ;
+     push(@failures, sprintf("%-40s ($mid)", "$fullname"));
+     $num_failures{$mid}++;
++    return 1;
+ }
+ 
+ sub do_one_test($$) 
+ {
+     my ($dir, $vgtest) = @_;
++    my $diffStatus = 0;
+     $vgtest =~ /^(.*)\.vgtest/;
+     my $name = $1;
+     my $fullname = "$dir/$name"; 
+@@ -425,7 +430,11 @@ sub do_one_test($$)
+         } elsif (256 == $prereq_res) {
+             # Nb: weird Perl-ism -- exit code of '1' is seen by Perl as 256...
+             # Prereq failed, skip.
+-            printf("%-16s (skipping, prereq failed: $prereq)\n", "$name:");
++            if ($yoctoptest == 0) {
++                printf("%-16s (skipping, prereq failed: $prereq)\n", "$name:");
++            } else {
++                printf("SKIP: $fullname\n");
++            }
+             return;
+         } else {
+             # Bad prereq; abort.
+@@ -438,7 +447,7 @@ sub do_one_test($$)
+     if (defined $progB) {
+         # If there is a progB, let's start it in background:
+         printf("%-16s valgrind $extraopts $vgopts $prog $args (progB: $progB $argsB)\n",
+-               "$name:");
++               "$name:") if ($yoctoptest == 0);
+         # progB.done used to detect child has finished. See below.
+         # Note: redirection of stdout and stderr is before $progB to allow argsB
+         # to e.g. redirect stdoutB to stderrB
+@@ -452,7 +461,8 @@ sub do_one_test($$)
+                      . "touch progB.done)  &");
+         }
+     } else {
+-        printf("%-16s valgrind $extraopts $vgopts $prog $args\n", "$name:");
++        printf("%-16s valgrind $extraopts $vgopts $prog $args\n", "$name:")
++            if ($yoctoptest == 0);
+     }
+  
+     # Pass the appropriate --tool option for the directory (can be overridden
+@@ -487,7 +497,7 @@ sub do_one_test($$)
+     # Find all the .stdout.exp files.  If none, use /dev/null.
+     my @stdout_exps = <$name.stdout.exp*>;
+     @stdout_exps = ( "/dev/null" ) if (0 == scalar @stdout_exps);
+-    do_diffs($fullname, $name, "stdout", \@stdout_exps); 
++    $diffStatus |= do_diffs($fullname, $name, "stdout", \@stdout_exps);
+ 
+     # Filter stderr
+     $stderr_filter_args = $name if (! defined $stderr_filter_args);
+@@ -496,7 +506,7 @@ sub do_one_test($$)
+     # Find all the .stderr.exp files.  At least one must exist.
+     my @stderr_exps = <$name.stderr.exp*>;
+     (0 != scalar @stderr_exps) or die "Could not find `$name.stderr.exp*'\n";
+-    do_diffs($fullname, $name, "stderr", \@stderr_exps); 
++    $diffStatus |= do_diffs($fullname, $name, "stderr", \@stderr_exps);
+ 
+     if (defined $progB) {
+         # wait for the child to be finished
+@@ -520,7 +530,7 @@ sub do_one_test($$)
+         # Find all the .stdoutB.exp files.  If none, use /dev/null.
+         my @stdoutB_exps = <$name.stdoutB.exp*>;
+         @stdoutB_exps = ( "/dev/null" ) if (0 == scalar @stdoutB_exps);
+-        do_diffs($fullname, $name, "stdoutB", \@stdoutB_exps); 
++        $diffStatus |= do_diffs($fullname, $name, "stdoutB", \@stdoutB_exps);
+         
+         # Filter stderr
+         $stderrB_filter_args = $name if (! defined $stderrB_filter_args);
+@@ -529,7 +539,7 @@ sub do_one_test($$)
+         # Find all the .stderrB.exp files.  At least one must exist.
+         my @stderrB_exps = <$name.stderrB.exp*>;
+         (0 != scalar @stderrB_exps) or die "Could not find `$name.stderrB.exp*'\n";
+-        do_diffs($fullname, $name, "stderrB", \@stderrB_exps); 
++        $diffStatus |= do_diffs($fullname, $name, "stderrB", \@stderrB_exps);
+     }
+ 
+     # Maybe do post-test check
+@@ -541,7 +551,7 @@ sub do_one_test($$)
+ 	    # Find all the .post.exp files.  If none, use /dev/null.
+ 	    my @post_exps = <$name.post.exp*>;
+ 	    @post_exps = ( "/dev/null" ) if (0 == scalar @post_exps);
+-	    do_diffs($fullname, $name, "post", \@post_exps);
++	    $diffStatus |= do_diffs($fullname, $name, "post", \@post_exps);
+ 	}
+     }
+  
+@@ -550,6 +560,13 @@ sub do_one_test($$)
+             print("(cleanup operation failed: $cleanup)\n");
+     }
+ 
++    if ($yoctoptest == 1) {
++        if ($diffStatus == 0) {
++            print("PASS: $fullname\n");
++        } else {
++            print("FAIL: $fullname\n");
++        }
++    }
+     $num_tests_done++;
+ }
+ 
+@@ -589,7 +606,7 @@ sub test_one_dir($$)
+     my $found_tests = (0 != (grep { $_ =~ /\.vgtest$/ } @fs));
+ 
+     if ($found_tests) {
+-        print "-- Running  tests in $full_dir $dashes\n";
++        print "-- Running  tests in $full_dir $dashes\n" if ($yoctoptest == 0);
+     }
+     foreach my $f (@fs) {
+         if (-d $f) {
+@@ -599,7 +616,7 @@ sub test_one_dir($$)
+         }
+     }
+     if ($found_tests) {
+-        print "-- Finished tests in $full_dir $dashes\n";
++        print "-- Finished tests in $full_dir $dashes\n" if ($yoctoptest == 0);
+     }
+ 
+     chdir("..");
+@@ -625,10 +642,12 @@ sub summarise_results
+            $num_failures{"stdout"},   plural($num_failures{"stdout"}),
+            $num_failures{"stderrB"},  plural($num_failures{"stderrB"}),
+            $num_failures{"stdoutB"},  plural($num_failures{"stdoutB"}),
+-           $num_failures{"post"},     plural($num_failures{"post"}));
++           $num_failures{"post"},     plural($num_failures{"post"}))
++               if ($yoctoptest == 0);
+ 
+     foreach my $failure (@failures) {
+-        print "$failure\n";
++        print "$failure\n"
++           if ($yoctoptest == 0);
+     }
+     print "\n";
+ }
diff --git a/meta/recipes-devtools/valgrind/valgrind/force-nostabs.patch b/meta/recipes-devtools/valgrind/valgrind/force-nostabs.patch
new file mode 100644
index 0000000..b644348
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/force-nostabs.patch
@@ -0,0 +1,42 @@
+Suppress building ptest apps with the -gstabs option
+
+Force the configure tests for -gstabs compiler support to fail so that
+the regression tests don't try to build with the -gstabs option.
+Otherwise, the valgrind build when ptest is enabled fails with the
+error:
+    Stabs debuginfo not supported:
+    ../package/usr/lib/valgrind/ptest/memcheck/tests/deep_templates
+    ERROR: Function failed: split_and_strip_files
+
+Upstream-status: Inappropriate [gstabs support is appropriate upstream,
+        but not for this distro]
+
+Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
+
+diff --git a/configure.ac b/configure.ac
+index 755dfb9..cc8b5e1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1743,22 +1743,7 @@ AM_CONDITIONAL(DWARF4, test x$ac_have_dwarf4 = xyes)
+ CFLAGS=$safe_CFLAGS
+ 
+ 
+-# does this compiler support -gstabs ?
+-
+-AC_MSG_CHECKING([if gcc accepts -gstabs])
+-
+-safe_CFLAGS=$CFLAGS
+-CFLAGS="-gstabs"
+-AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[
+-  return 0;
+-]])], [
+-ac_have_gstabs=yes
+-AC_MSG_RESULT([yes])
+-], [
+ ac_have_gstabs=no
+-AC_MSG_RESULT([no])
+-])
+-CFLAGS=$safe_CFLAGS
+ AM_CONDITIONAL([HAVE_GSTABS], [test x$ac_have_gstabs = xyes])
+ 
+ 
diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-arm-variant-specific.patch b/meta/recipes-devtools/valgrind/valgrind/remove-arm-variant-specific.patch
new file mode 100644
index 0000000..46dea60
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-arm-variant-specific.patch
@@ -0,0 +1,67 @@
+Remove tests that require thumb compiler flags
+
+Default compiler options for arm machines are incompatible with the
+'-mthumb' compiler option imposed by the intdiv and lrt test
+applications, so those two are removed from the ptest build.
+
+Upstream-Status: Pending
+
+Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
+
+diff --git a/none/tests/arm/Makefile.am b/none/tests/arm/Makefile.am
+index 2a19f5b..ccdeb77 100644
+--- a/none/tests/arm/Makefile.am
++++ b/none/tests/arm/Makefile.am
+@@ -16,15 +16,16 @@ EXTRA_DIST = \
+ 		vcvt_fixed_float_VFP.vgtest \
+ 	vfp.stdout.exp vfp.stderr.exp vfp.vgtest
+ 
++# For yocto:
++#  Only include tests that don't require Thumb.
++#  Only use CFLAGS passed in by the build system.
++# Some tests may fail, but all tests must compile.
+ check_PROGRAMS = \
+ 	allexec \
+-	intdiv \
+-	ldrt \
+ 	ldrt_arm \
+ 	neon128 \
+ 	neon64 \
+ 	v6intARM \
+-	v6intThumb \
+ 	v6media \
+ 	vcvt_fixed_float_VFP \
+ 	vfp
+@@ -34,32 +35,3 @@ AM_CXXFLAGS  += @FLAG_M32@
+ AM_CCASFLAGS += @FLAG_M32@
+ 
+ allexec_CFLAGS		= $(AM_CFLAGS) @FLAG_W_NO_NONNULL@
+-
+-# These two are specific to their ARM/Thumb respectively and so we
+-# hardwire -marm/-mthumb.  neon64 and neon128 are compilable on both,
+-# however, ask for them to be compiled on thumb, as that looks
+-# like that's going to be the more common use case.  They also
+-# need special helping w.r.t -mfpu and -mfloat-abi, though.
+-# Also force -O0 since -O takes hundreds of MB of memory 
+-# for v6intThumb.c.
+-v6intARM_CFLAGS   = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 -marm
+-v6intThumb_CFLAGS = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 -mthumb
+-
+-v6media_CFLAGS    = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 -mthumb
+-
+-vfp_CFLAGS        = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 \
+-			-mfpu=neon \
+-			-mthumb
+-
+-
+-neon128_CFLAGS    = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 \
+-			-mfpu=neon \
+-			-mthumb
+-
+-neon64_CFLAGS     = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 \
+-			-mfpu=neon \
+-			-mthumb
+-
+-intdiv_CFLAGS	  = $(AM_CFLAGS) -g -mcpu=cortex-a15 -mthumb
+-ldrt_CFLAGS	  = $(AM_CFLAGS) -g -mcpu=cortex-a8 -mthumb
+-ldrt_arm_CFLAGS	  = $(AM_CFLAGS) -g -mcpu=cortex-a8 -marm
diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-ppc-tests-failing-build.patch b/meta/recipes-devtools/valgrind/valgrind/remove-ppc-tests-failing-build.patch
new file mode 100644
index 0000000..2a14e18
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-ppc-tests-failing-build.patch
@@ -0,0 +1,75 @@
+Remove test apps not building with ppc and PTEST
+
+For mpc8316-rdb in none/tests/ppc32, the oe compiler options are
+inconsistent with the imposed test compiler options generating errors
+as follows:
+test_isa_2_07_part1
+test_isa_2_07_part2
+test_tm
+test_touch_tm
+    : unrecognized command line option '-mhtm'
+
+jm-insns
+testVMX
+    : AltiVec not supported in this target
+
+For the following tests, their inline assembler is inconsistent with
+the ppce300c3 variant:
+round.c:393
+power5+_round.c:98
+    : impossible constraint in 'asm'
+
+For the following tests, with both mpc8316-rdb and with qemuppc bsp,
+the inline assember is inconsistent with the oe compiler machine
+tuning:
+In memcheck/tests/ppc32
+ power_ISA2_05.c:56
+In none/tests/ppc32
+ test_dfp1.c:85
+ test_dfp2.c:160
+ test_dfp3.c:157
+ test_dfp4.c:73
+ test_dfp5.c:73
+    : impossible constraint in 'asm'
+
+Upstream-Status: Pending
+
+Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
+
+diff --git a/memcheck/tests/ppc32/Makefile.am b/memcheck/tests/ppc32/Makefile.am
+index bd70eea..1436e8e 100644
+--- a/memcheck/tests/ppc32/Makefile.am
++++ b/memcheck/tests/ppc32/Makefile.am
+@@ -7,8 +7,7 @@ EXTRA_DIST = $(noinst_SCRIPTS) \
+ 	power_ISA2_05.stderr.exp power_ISA2_05.stdout.exp power_ISA2_05.vgtest \
+ 	power_ISA2_05.stdout.exp_Without_FPPO
+ 
+-check_PROGRAMS = \
+-	power_ISA2_05
++check_PROGRAMS = 
+ 
+ power_ISA2_05_CFLAGS = $(AM_CFLAGS) $(WERROR) -Winline -Wall -Wshadow -g \
+ 		-I$(top_srcdir)/include @FLAG_M32@
+diff --git a/none/tests/ppc32/Makefile.am b/none/tests/ppc32/Makefile.am
+index 4f581b6..91ce7e7 100644
+--- a/none/tests/ppc32/Makefile.am
++++ b/none/tests/ppc32/Makefile.am
+@@ -50,16 +50,8 @@ check_PROGRAMS = \
+ 	allexec \
+ 	bug129390-ppc32 \
+ 	bug139050-ppc32 \
+-	ldstrev lsw jm-insns mftocrf mcrfs round test_fx test_gx \
+-	testVMX twi tw xlc_dbl_u32 power5+_round power6_bcmp \
+-	test_isa_2_06_part1 \
+-	test_isa_2_06_part2 \
+-	test_isa_2_06_part3 \
+-	test_dfp1 test_dfp2 test_dfp3 test_dfp4 test_dfp5 \
+-	test_isa_2_07_part1 \
+-	test_isa_2_07_part2 \
+-	test_tm \
+-	test_touch_tm
++	ldstrev lsw mftocrf mcrfs test_fx test_gx \
++	twi tw xlc_dbl_u32 power6_bcmp 
+ 
+ AM_CFLAGS    += @FLAG_M32@
+ AM_CXXFLAGS  += @FLAG_M32@
diff --git a/meta/recipes-devtools/valgrind/valgrind/run-ptest b/meta/recipes-devtools/valgrind/valgrind/run-ptest
new file mode 100755
index 0000000..7d0584a
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/run-ptest
@@ -0,0 +1,11 @@
+#!/bin/bash
+# run-ptest - 'ptest' test infrastructure shell script that
+#   wraps the valgrind regression script vg_regtest. 
+#   Must be run in the /usr/lib/valgrind/ptest directory. 
+#
+# Dave Lerner <dave.lerner@windriver.com>
+###############################################################
+VALGRINDLIB=@libdir@/valgrind
+tests/vg_regtest --all \
+    --valgrind=/usr/bin/valgrind --valgrind-lib=$VALGRINDLIB \
+	--yocto-ptest
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
index e1fb568..f0cda47 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
@@ -15,6 +15,11 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://fixed-perl-path.patch \
            file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch \
            file://sepbuildfix.patch \
+           file://force-nostabs.patch \
+           file://remove-arm-variant-specific.patch \
+           file://remove-ppc-tests-failing-build.patch \
+           file://add-ptest.patch \
+           file://run-ptest \
           "
 
 SRC_URI[md5sum] = "0947de8112f946b9ce64764af7be6df2"
@@ -23,7 +28,7 @@ SRC_URI[sha256sum] = "e6af71a06bc2534541b07743e1d58dc3caf744f38205ca3e5b5a0bdf37
 COMPATIBLE_HOST = '(i.86|x86_64|powerpc|powerpc64).*-linux'
 COMPATIBLE_HOST_armv7a = 'arm.*-linux'
 
-inherit autotools
+inherit autotools ptest
 
 EXTRA_OECONF = "--enable-tls --without-mpicc"
 EXTRA_OECONF_armv7a = "--enable-tls -host=armv7-none-linux-gnueabi --without-mpicc"
@@ -41,3 +46,52 @@ FILES_${PN}-dbg += "${libdir}/${PN}/*/.debug/*"
 # valgrind needs debug information for ld.so at runtime in order to
 # redirect functions like strlen.
 RRECOMMENDS_${PN} += "${TCLIBC}-dbg"
+
+RDEPENDS_${PN}-ptest += " sed perl eglibc-utils"
+
+do_compile_ptest() {
+    oe_runmake check
+}
+
+
+do_install_ptest() {
+    chmod +x ${B}/tests/vg_regtest
+
+    # The test application binaries are not automatically installed.
+    # Grab them from the build directory.
+    #
+    # The regression tests require scripts and data files that are not
+    # copied to the build directory.  They must be copied from the
+    # source directory. 
+    saved_dir=$PWD
+    for parent_dir in ${S} ${B} ; do
+        cd $parent_dir
+
+        # exclude shell or the package won't install
+        rm -rf none/tests/shell* 2>/dev/null
+
+        subdirs="tests cachegrind/tests callgrind/tests drd/tests helgrind/tests massif/tests memcheck/tests none/tests"
+
+        # Get the vg test scripts, filters, and expected files
+        for dir in $subdirs ; do
+            find $dir | cpio -pvdu ${D}${PTEST_PATH}
+        done
+        cd $saved_dir
+    done
+
+    # clean out build artifacts before building the rpm
+    find ${D}${PTEST_PATH} \
+         \( -name "Makefile*" \
+        -o -name "*.o" \
+        -o -name "*.c" \
+        -o -name "*.S" \
+        -o -name "*.h" \) \
+        -exec rm {} \;
+
+    # needed by massif tests
+    cp ${B}/massif/ms_print ${D}${PTEST_PATH}/massif/ms_print
+
+    # handle multilib
+    sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
+}
+
-- 
1.7.9.5


