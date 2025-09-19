Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEEC5CAC5A5
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 08:39:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11520.1758271177402465779
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 01:39:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=135749f1e5=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58J5P25S1134002
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 08:39:36 GMT
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 498vmrga9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 08:39:36 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 19 Sep 2025 01:39:34 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 19 Sep 2025 01:39:33 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] valgrind: Enable ptest support
Date: Fri, 19 Sep 2025 16:39:33 +0800
Message-ID: <20250919083933.926173-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=ZP7XmW7b c=1 sm=1 tr=0 ts=68cd16c8 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8 a=CCpqsmhAAAAA:8 a=3fyaaF4VAAAA:8
 a=t7CeM3EgAAAA:8 a=VancAJYyivCwDq9zXGEA:9 a=4yBKJ6aONPQB__BE:21
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDA3OCBTYWx0ZWRfX+d2ZXgtrga/b
 EzoRJjkW497foTRxSVDGkZYjk6kcslEXUAfYebCCu6jgb66fR24u8ovqnubgwAUSpFLJUanuj1r
 akkA3o3buat3kYlRf59b2b/hsYXiaSUcQ+ya1cmsO8VFDgI7Q/lZYYPuF0kf7ryKvOc1ECEGhld
 /VcPWXHs8KJtrf9KnRw4Db2HX6sI2OQex3ZR3I4hPdO6+t4jY16xfnj8L7hnx7RQnn8P5qpdSfO
 j6lZytrpBhNa/GgAArmcrRMrdAmzec5vkUugbQkJZQoSSzXKIQWf3kozq4IPHHQxKYHcc1fTvtB
 yQs7R7IDgOW2j8Dy0f41h7WUAkEAB9KETFC+ImpbqkyvuZwW6w90CD5Ugcg4vg=
X-Proofpoint-GUID: Q3tgIuyw9nNR00RIC7-KcihgO6hfxgcF
X-Proofpoint-ORIG-GUID: Q3tgIuyw9nNR00RIC7-KcihgO6hfxgcF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 08:39:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223731

From: Mingli Yu <mingli.yu@windriver.com>

Below is the test result on qemux86-64 with glibc. And have tested against
qemux86-64 and qemuarm64 with glibc.
 # ./run-ptest
 [snip]
 PASS: gdbserver_tests/hgtls
 PASS: gdbserver_tests/mcblocklistsearch
 PASS: gdbserver_tests/mcbreak
 PASS: gdbserver_tests/mcclean_after_fork
 [snip]
 PASS: exp-bbv/tests/amd64-linux/clone_test
 PASS: exp-bbv/tests/amd64-linux/complex_rep
 PASS: exp-bbv/tests/amd64-linux/fldcw_check
 PASS: exp-bbv/tests/amd64-linux/ll
 PASS: exp-bbv/tests/amd64-linux/million
 PASS: exp-bbv/tests/amd64-linux/rep_prefix
  === Test Summary ===
 TOTAL: 808
 PASSED: 782
 FAILED: 0
 SKIPPED: 26

Reference: https://git.openembedded.org/openembedded-core/commit/?id=8fc31fb235af12530475ec5055f6c00ccfafadfa

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../distro/include/ptest-packagelists.inc     |   1 +
 ...est-wrapper-to-support-PTEST-formats.patch | 212 ++++++++++++++++++
 .../valgrind/valgrind/remove-for-aarch64      |  37 +++
 .../valgrind/valgrind/remove-for-all          |  58 +++++
 .../valgrind/valgrind/run-ptest               |  14 +-
 .../valgrind/valgrind_3.25.1.bb               | 133 ++++++++++-
 6 files changed, 447 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Modify-vg_test-wrapper-to-support-PTEST-formats.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/remove-for-all

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index e6e725bd251..dbc1a2f71ac 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -131,6 +131,7 @@ PTESTS_SLOW = "\
     tcl \
     tcl8 \
     util-linux \
+    valgrind \
 "
 
 # python3 ptests hang on qemuriscv64
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Modify-vg_test-wrapper-to-support-PTEST-formats.patch b/meta/recipes-devtools/valgrind/valgrind/0001-Modify-vg_test-wrapper-to-support-PTEST-formats.patch
new file mode 100644
index 00000000000..87e098f2b8c
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-Modify-vg_test-wrapper-to-support-PTEST-formats.patch
@@ -0,0 +1,212 @@
+From 35d1259139e468d3801f9dcf94b9660a5b511c8b Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Mon, 15 Sep 2025 17:21:44 +0800
+Subject: [PATCH] Modify vg_test wrapper to support PTEST formats
+
+Change the valgrind regression test script vg_regtest to
+support the yocto ptest stdout reporting format.  The commit adds
+'--yocto-ptest' as an optional argument to vg_regtest, which alters
+the output to use the ptest infrastructure reporting format:
+    "[PASS|SKIP|FAIL]: testname"
+instead of valgrind's internal test reporting format.  Without the added
+option, --yocto-ptest, the valgrind regression test output is unchanged.
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ tests/vg_regtest.in | 66 ++++++++++++++++++++++++++++++++++-----------
+ 1 file changed, 51 insertions(+), 15 deletions(-)
+
+diff --git a/tests/vg_regtest.in b/tests/vg_regtest.in
+index 49e1114..f4b52d8 100755
+--- a/tests/vg_regtest.in
++++ b/tests/vg_regtest.in
+@@ -47,6 +47,7 @@
+ #   --loop-till-fail: loops on the test(s) till one fail, then exit
+ #              This is useful to obtain detailed trace or --keep-unfiltered
+ #              output of a non deterministic test failure
++#   --yocto-ptest: output in yocto ptest format
+ #
+ # The easiest way is to run all tests in valgrind/ with (assuming you installed
+ # in $PREFIX):
+@@ -140,7 +141,7 @@ my $usage="\n"
+      . "Usage:\n"
+      . "   vg_regtest [--all, --valgrind, --valgrind-lib, --keep-unfiltered\n"
+      . "                 --outer-valgrind, --outer-tool, --outer-args\n"
+-     . "                 --loop-till-fail]\n"
++     . "                 --loop-till-fail, --yocto-ptest]\n"
+      . "   Use EXTRA_REGTEST_OPTS to supply extra args for all tests\n"
+      . "\n";
+ 
+@@ -189,6 +190,7 @@ my $run_outer_args = "";
+ my $valgrind_lib = "$tests_dir/.in_place";
+ my $keepunfiltered = 0;
+ my $looptillfail = 0;
++my $yoctoptest = 0;
+ 
+ # default filter is the one named "filter_stderr" in the test's directory
+ my $default_stderr_filter = "filter_stderr";
+@@ -252,6 +254,8 @@ sub process_command_line()
+                 $keepunfiltered = 1;
+             } elsif ($arg =~ /^--loop-till-fail$/) {
+                 $looptillfail = 1;
++            } elsif ($arg =~ /^--yocto-ptest$/) {
++                $yoctoptest = 1;
+             } else {
+                 die $usage;
+             }
+@@ -383,13 +387,30 @@ sub read_vgtest_file($)
+ #----------------------------------------------------------------------------
+ # Since most of the program time is spent in system() calls, need this to
+ # propagate a Ctrl-C enabling us to quit.
++# Enforce 90 seconds limit for the test.
++# This resume execution of the remaining tests if valgrind hangs.
+ sub mysystem($@)
+ {
+     my $tslog = shift(@_);
+     print $tslog scalar localtime, " executing @_\n";
+-    my $exit_code = system(@_);
+-    print $tslog scalar localtime, " rc $exit_code\n";
+-    ($exit_code == 2) and exit 1;      # 2 is SIGINT
++    my $exit_code=0;
++    eval {
++        local $SIG{'ALRM'} = sub { die "timed out\n" };
++        alarm(90);
++        $exit_code = system(@_);
++        alarm (0);
++        print $tslog scalar localtime, " rc $exit_code\n";
++        ($exit_code == 2) and die "SIGINT\n";   # 2 is SIGINT
++    };
++    if ($@) {
++        if ($@ eq "timed out\n") {
++            print "timed out\n";
++            return 1;
++        }
++        if ($@ eq "SIGINT\n") {
++            exit 1;
++        }
++    }
+     return $exit_code;
+ }
+ 
+@@ -444,24 +465,25 @@ sub do_diffs($$$$$)
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
+     if ($looptillfail == 1) {
+        print "Failure encountered, stopping to loop\n";
+        exit 1
+     }
+-    return "FAIL";
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
+@@ -485,7 +507,11 @@ sub do_one_test($$)
+         } elsif (256 == $prereq_res) {
+             # Nb: weird Perl-ism -- exit code of '1' is seen by Perl as 256...
+             # Prereq failed, skip.
+-            printf("%-16s (skipping, prereq failed: $prereq)\n", "$name:");
++            if ($yoctoptest == 0) {
++                printf("%-16s (skipping, prereq failed: $prereq)\n", "$name:");
++            } else {
++                printf("SKIP: $fullname\n");
++            }
+             print VGTESTLOG scalar localtime, " skipping, prereq failed\n";
+             close(VGTESTLOG);
+             return "SKIP";
+@@ -505,7 +531,7 @@ sub do_one_test($$)
+         }
+         # If there is a progB, let's start it in background:
+         printf("%-16s valgrind $extraopts $vgopts $prog $args (progB: $progB $argsB)\n",
+-               "$name:");
++               "$name:") if ($yoctoptest == 0);
+         # progB.done used to detect child has finished. See below.
+         # Note: redirection of stdout and stderr is before $progB to allow argsB
+         # to e.g. redirect stdoutB to stderrB
+@@ -521,7 +547,8 @@ sub do_one_test($$)
+                      . "touch progB.done)  &");
+         }
+     } else {
+-        printf("%-16s valgrind $extraopts $vgopts $prog $args\n", "$name:");
++        printf("%-16s valgrind $extraopts $vgopts $prog $args\n", "$name:")
++            if ($yoctoptest == 0);
+     }
+ 
+     # Collect environment variables, if any.
+@@ -654,7 +681,7 @@ sub do_one_test($$)
+ 	    # Find all the .post.exp files.  If none, use /dev/null.
+ 	    my @post_exps = <$name.post.exp*>;
+ 	    @post_exps = ( "/dev/null" ) if (0 == scalar @post_exps);
+-	    do_diffs($fullname, $name, "post", *VGTESTLOG, \@post_exps);
++	    $diffrc = do_diffs($fullname, $name, "post", *VGTESTLOG, \@post_exps);
+ 	}
+     }
+ 
+@@ -663,6 +690,13 @@ sub do_one_test($$)
+             print("(cleanup operation failed: $cleanup)\n");
+     }
+ 
++    if ($yoctoptest == 1) {
++        if ($diffrc == 0) {
++            print("PASS: $fullname\n");
++        } else {
++            print("FAIL: $fullname\n");
++        }
++    }
+     close(VGTESTLOG);
+     $num_tests_done++;
+     return $rc;
+@@ -707,7 +741,7 @@ sub test_one_dir($$)
+ 
+     my $tests_start_time = time;
+     if ($found_tests) {
+-        print "-- Running  tests in $full_dir $dashes\n";
++        print "-- Running  tests in $full_dir $dashes\n" if ($yoctoptest == 0);
+     }
+     foreach my $f (@fs) {
+         if (-d $f) {
+@@ -740,7 +774,7 @@ sub test_one_dir($$)
+         my $end_time = "(in $tests_cost_time sec)";
+         my $end_dashes = "-" x (50 - (length $full_dir)
+                                    - (length $end_time) - 1);
+-        print "-- Finished tests in $full_dir $end_time $end_dashes\n";
++        print "-- Finished tests in $full_dir $dashes\n" if ($yoctoptest == 0);
+     }
+ 
+     print TSLOG scalar localtime, " leaving $full_dir\n";
+@@ -767,10 +801,12 @@ sub summarise_results
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
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
new file mode 100644
index 00000000000..3ecbd86e50f
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
@@ -0,0 +1,37 @@
+gdbserver_tests/hgtls
+helgrind/tests/hg05_race2
+helgrind/tests/tc20_verifywrap
+memcheck/tests/dw4
+memcheck/tests/varinfo1
+memcheck/tests/varinfo2
+memcheck/tests/varinfo3
+memcheck/tests/varinfo4
+memcheck/tests/varinfo6
+memcheck/tests/varinforestrict
+memcheck/tests/atomic_incs
+memcheck/tests/bug464969_d_demangle
+memcheck/tests/cxx17_aligned_new
+memcheck/tests/demangle
+memcheck/tests/fwrite
+memcheck/tests/linux/sys-copy_file_range
+memcheck/tests/linux/sys-preadv_pwritev
+memcheck/tests/long_namespace_xml
+memcheck/tests/mismatches
+memcheck/tests/mismatches_xml
+memcheck/tests/new_aligned_delete_default
+memcheck/tests/new_delete_mismatch_size
+memcheck/tests/new_nothrow
+memcheck/tests/realloc_size_zero_mismatch
+memcheck/tests/sized_aligned_new_delete_args
+memcheck/tests/sized_aligned_new_delete_misaligned1
+memcheck/tests/sized_aligned_new_delete_misaligned1_xml
+memcheck/tests/sized_aligned_new_delete_misaligned2
+memcheck/tests/sized_aligned_new_delete_misaligned2_xml
+memcheck/tests/sized_aligned_new_delete_misaligned3
+memcheck/tests/sized_aligned_new_delete_misaligned3_xml
+memcheck/tests/sized_delete
+memcheck/tests/sendmsg
+memcheck/tests/writev1
+none/tests/bigcode
+none/tests/track_new
+none/tests/use_after_close
diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-all b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
new file mode 100644
index 00000000000..de1108dd9a8
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
@@ -0,0 +1,58 @@
+cachegrind/tests/wrap5
+drd/tests/boost_thread
+none/tests/amd64/fb_test_amd64
+none/tests/tls
+gdbserver_tests/hginfo
+gdbserver_tests/mcinvokeRU
+memcheck/tests/badfree3
+memcheck/tests/bug445235_ada_demangle
+memcheck/tests/descr_belowsp
+memcheck/tests/linux/dlclose_leak-no-keep
+memcheck/tests/linux/dlclose_leak
+memcheck/tests/linux/timerfd-syscall
+memcheck/tests/linux/with-space
+memcheck/tests/gone_abrt_xml
+memcheck/tests/origin6-fp
+memcheck/tests/supp_unknown
+memcheck/tests/varinfo5
+memcheck/tests/wrap1
+memcheck/tests/wrap2
+memcheck/tests/wrap3
+memcheck/tests/wrap4
+memcheck/tests/wrap5
+memcheck/tests/wrap6
+memcheck/tests/wrap7
+memcheck/tests/wrap8
+helgrind/tests/tc19_shadowmem
+helgrind/tests/tc22_exit_w_lock
+helgrind/tests/tls_threads
+helgrind/tests/pth_mempcpy_false_races
+drd/tests/annotate_barrier_xml
+drd/tests/annotate_sem
+drd/tests/bar_bad
+drd/tests/bar_bad_xml
+drd/tests/fork-parallel
+drd/tests/fork-serial
+drd/tests/pth_barrier_thr_cr
+drd/tests/std_thread2
+drd/tests/threaded-fork-vcs
+drd/tests/threaded-fork
+drd/tests/thread_name_xml
+massif/tests/deep-D
+massif/tests/bug469146
+massif/tests/new-cpp
+massif/tests/overloaded-new
+none/tests/double_close_range_xml
+none/tests/fdleak_cmsg
+none/tests/fdleak_cmsg_xml
+none/tests/fdleak_creat_xml
+none/tests/fdleak_dup2_xml
+none/tests/fdleak_dup_xml
+none/tests/fdleak_fcntl_xml
+none/tests/fdleak_ipv4_xml
+none/tests/fdleak_open_xml
+none/tests/fdleak_pipe_xml
+none/tests/fdleak_socketpair_xml
+none/tests/file_dclose_xml
+none/tests/map_unmap
+none/tests/socket_close_xml
diff --git a/meta/recipes-devtools/valgrind/valgrind/run-ptest b/meta/recipes-devtools/valgrind/valgrind/run-ptest
index 15cf03f9d2c..517df68a5e7 100755
--- a/meta/recipes-devtools/valgrind/valgrind/run-ptest
+++ b/meta/recipes-devtools/valgrind/valgrind/run-ptest
@@ -34,10 +34,10 @@ fi
 
 echo "Run non-deterministic tests using taskset to limit them to a single core."
 for i in `cat taskset_nondeterministic_tests`; do
-   # The remove-for-aarch64 and taskset_nondeterministic_tests may overlap so 
+   # The remove-for-aarch64 and taskset_nondeterministic_tests may overlap so
    # check if a file exist.
    if test -f "${i}.vgtest"; then
-      taskset 0x00000001 perl tests/vg_regtest --valgrind=${VALGRIND_BIN} --valgrind-lib=${VALGRIND_LIBEXECDIR} --yocto-ptest $i 2>&1|tee -a ${LOG}
+      taskset 0x00000001 perl tests/vg_regtest --valgrind=${VALGRIND_BIN} --valgrind-lib=${VALGRIND_LIBEXECDIR} --yocto-ptest $i 2>&1 | tee -a ${LOG}
       mv $i.vgtest $i.IGNORE
    fi
 done
@@ -47,12 +47,12 @@ cd ${VALGRIND_LIB}/ptest && ./tests/vg_regtest \
     --valgrind-lib=${VALGRIND_LIBEXECDIR} \
     --yocto-ptest \
     gdbserver_tests ${TOOLS} ${EXP_TOOLS} \
-    2>&1|tee -a ${LOG}  
+    2>&1 | tee -a ${LOG}
 
 cd ${VALGRIND_LIB}/ptest && \
     ./tests/post_regtest_checks $(pwd) \
     gdbserver_tests ${TOOLS} ${EXP_TOOLS} \
-    2>&1|tee -a ${LOG}
+    2>&1 | tee -a ${LOG}
 
 echo "Restore non-deterministic tests"
 for i in `cat taskset_nondeterministic_tests`; do
@@ -83,9 +83,9 @@ for test in $failed_tests; do
     done
 done
 
-passed=`grep PASS: ${LOG}|wc -l`
-failed=`grep FAIL: ${LOG}|wc -l`
-skipped=`grep SKIP: ${LOG}|wc -l`
+passed=`grep PASS: ${LOG} | wc -l`
+failed=`grep FAIL: ${LOG} | wc -l`
+skipped=`grep SKIP: ${LOG} | wc -l`
 all=$((passed + failed + skipped))
 
 ( echo "=== Test Summary ==="
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.25.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.25.1.bb
index a8b0be5767e..073138af72c 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.25.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.25.1.bb
@@ -9,7 +9,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.DOCS;md5=24ea4c7092233849b4394699333b5c56"
 
 SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
+           file://run-ptest \
            file://fixed-perl-path.patch \
+           file://remove-for-aarch64 \
+           file://remove-for-all \
+           file://taskset_nondeterministic_tests \
            file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch \
            file://use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch \
            file://avoid-neon-for-targets-which-don-t-support-it.patch \
@@ -26,6 +30,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-docs-Disable-manual-validation.patch \
            file://0001-tests-arm-Use-O-instead-of-O0.patch \
            file://0001-Use-portable-syntax-for-pushsection-directive-in-inl.patch \
+           file://0001-Modify-vg_test-wrapper-to-support-PTEST-formats.patch \
            "
 SRC_URI[sha256sum] = "61deb8d0727b45c268efdc1b3b6c9e679cd97cbf5ee4b28d1dead7c8b7a271af"
 UPSTREAM_CHECK_REGEX = "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
@@ -51,7 +56,7 @@ COMPATIBLE_HOST:linux-gnun32 = 'null'
 # Disable for powerpc64 with musl
 COMPATIBLE_HOST:libc-musl:powerpc64 = 'null'
 
-inherit autotools-brokensep multilib_header
+inherit autotools-brokensep multilib_header ptest
 
 EXTRA_OECONF = "--enable-tls --without-mpicc"
 EXTRA_OECONF += "${@['--enable-only32bit','--enable-only64bit'][d.getVar('SITEINFO_BITS') != '32']}"
@@ -83,6 +88,7 @@ RDEPENDS:${PN}-callgrind = "${PN} perl"
 
 do_configure:prepend () {
     rm -rf ${S}/config.h
+    sed -i -e 's:$(abs_top_builddir):$(pkglibdir)/ptest:g' ${S}/none/tests/Makefile.am
 }
 
 do_install:append () {
@@ -101,12 +107,137 @@ VALGRINDARCH:powerpc = "ppc"
 VALGRINDARCH:powerpc64 = "ppc64"
 VALGRINDARCH:powerpc64le = "ppc64le"
 
+do_compile_ptest() {
+    oe_runmake check
+}
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
+        subdirs=" \
+	   .in_place \
+	   cachegrind/tests \
+	   callgrind/tests \
+	   dhat/tests \
+	   drd/tests \
+	   gdbserver_tests \
+	   helgrind/tests \
+	   lackey/tests \
+	   massif/tests \
+	   memcheck/tests \
+	   none/tests \
+	   tests \
+	   exp-bbv/tests \
+	"
+        # Get the vg test scripts, filters, and expected files
+        for dir in $subdirs ; do
+            find $dir | cpio -pvdu ${D}${PTEST_PATH}
+        done
+        cd $saved_dir
+    done
+
+    # The scripts reference config.h so add it to the top ptest dir.
+    cp ${B}/config.h ${D}${PTEST_PATH}
+    install -D ${UNPACKDIR}/remove-for-aarch64 ${D}${PTEST_PATH}
+    install -D ${UNPACKDIR}/remove-for-all ${D}${PTEST_PATH}
+    install -D ${UNPACKDIR}/taskset_nondeterministic_tests ${D}${PTEST_PATH}
+
+    # Add an executable need by none/tests/bigcode
+    mkdir ${D}${PTEST_PATH}/perf
+    cp ${B}/perf/bigcode ${D}${PTEST_PATH}/perf
+
+    # Add an executable needed by memcheck/tests/vcpu_bz2
+    cp ${B}/perf/bz2 ${D}${PTEST_PATH}/perf
+
+    # Make the ptest dir look like the top level valgrind src dir
+    # This is checked by the gdbserver_tests/make_local_links script
+    mkdir ${D}${PTEST_PATH}/coregrind
+    cp ${B}/coregrind/vgdb ${D}${PTEST_PATH}/coregrind
+
+    # Add an executable needed by massif tests
+    cp ${B}/massif/ms_print ${D}${PTEST_PATH}/massif/ms_print
+
+    find ${D}${PTEST_PATH} \
+        \( \
+	   -name "Makefile*" \
+        -o -name "*.o" \
+	\) \
+        -exec rm {} \;
+
+    sed -i s:\.\./\.\./callgrind/callgrind_annotate:${bindir}/callgrind_annotate: ${D}${PTEST_PATH}/callgrind/tests/ann1.vgtest
+    sed -i s:\.\./\.\./callgrind/callgrind_annotate:${bindir}/callgrind_annotate: ${D}${PTEST_PATH}/callgrind/tests/ann2.vgtest
+
+    # point the expanded @abs_top_builddir@ of the host to PTEST_PATH
+    sed -i s:${S}:${PTEST_PATH}:g \
+        ${D}${PTEST_PATH}/memcheck/tests/linux/debuginfod-check.vgtest
+
+    # handle multilib
+    sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
+    sed -i s:@libexecdir@:${libexecdir}:g ${D}${PTEST_PATH}/run-ptest
+    sed -i s:@bindir@:${bindir}:g ${D}${PTEST_PATH}/run-ptest
+
+    # enable cachegrind ptests
+    ln -s ${bindir}/cg_annotate ${D}/${PTEST_PATH}/cachegrind/cg_annotate
+    ln -s ${bindir}/cg_diff ${D}/${PTEST_PATH}/cachegrind/cg_diff
+    ln -s ${bindir}/cg_merge ${D}/${PTEST_PATH}/cachegrind/cg_merge
+
+    # This test fails on the host as well, using both 3.15 and git master (as of Jan 24 2020)
+    # https://bugs.kde.org/show_bug.cgi?id=402833
+    rm ${D}${PTEST_PATH}/memcheck/tests/overlap.vgtest
+
+    # This is known failure see https://bugs.kde.org/show_bug.cgi?id=435732
+    rm ${D}${PTEST_PATH}/memcheck/tests/leak_cpp_interior.vgtest
+
+    # https://bugs.kde.org/show_bug.cgi?id=445743
+    rm ${D}${PTEST_PATH}/drd/tests/pth_mutex_signal
+
+    # As the binary isn't stripped or debug-splitted, the source file isn't fetched
+    # via dwarfsrcfiles either, so it needs to be installed manually.
+    mkdir -p ${D}${TARGET_DBGSRC_DIR}/none/tests/
+    install ${S}/none/tests/tls.c ${D}${TARGET_DBGSRC_DIR}/none/tests/
+}
+
 INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${libexecdir}/valgrind/vgpreload_memcheck-${VALGRINDARCH}-linux.so"
 
 # valgrind needs debug information for ld.so at runtime in order to
 # redirect functions like strlen.
 RRECOMMENDS:${PN} += "${TCLIBC}-dbg"
 
+RDEPENDS:${PN}-ptest += " bash coreutils curl file \
+   gdb \
+   ${TCLIBC}-src gcc-runtime-dbg \
+   libgomp \
+   perl \
+   perl-module-file-basename perl-module-file-glob perl-module-getopt-long \
+   perl-module-overloading perl-module-cwd perl-module-ipc-open3 \
+   perl-module-carp perl-module-symbol \
+   procps \
+   python3-compile \
+   sed \
+   util-linux-taskset \
+   ${PN}-dbg ${PN}-src \
+   ${PN}-cachegrind ${PN}-massif ${PN}-callgrind \
+"
+
+RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-utils glibc-gconv-utf-32"
+
+RDEPENDS:${PN}-ptest:append:libc-musl = " musl-utils"
+
+# One of the tests contains a bogus interpreter path on purpose.
+# Skip file dependency check
+SKIP_FILEDEPS:${PN}-ptest = '1'
+INSANE_SKIP:${PN}-ptest = "debug-deps"
+
 # Valgrind needs intrinsics which are not provided by clang
 # m_signals.c:2213:7: error: __builtin_longjmp is not supported for the current target
 # 2213 |       VG_MINIMAL_LONGJMP(tst->sched_jmpbuf);
-- 
2.34.1


