Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 3931F6AC7B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Oct 2014 01:43:35 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1; Wed, 8 Oct 2014
	03:43:30 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4200)	id BE52F288D4E;
	Wed,  8 Oct 2014 03:43:30 +0200 (CEST)
From: Tudor Florea <tudor.florea@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Oct 2014 03:43:27 +0200
Message-ID: <1412732607-17350-1-git-send-email-tudor.florea@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: tudor.florea@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH] valgrind: Enforce 30 seconds limit for each test
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
X-List-Received-Date: Wed, 08 Oct 2014 01:43:40 -0000
Content-Type: text/plain

Signed-off-by: Tudor Florea <tudor.florea@enea.com>
---
 .../valgrind/valgrind/add-ptest.patch              | 68 +++++++++++++++++-----
 1 file changed, 53 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind/add-ptest.patch b/meta/recipes-devtools/valgrind/valgrind/add-ptest.patch
index fdc9cc0..225f843 100644
--- a/meta/recipes-devtools/valgrind/valgrind/add-ptest.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/add-ptest.patch
@@ -1,6 +1,6 @@
 Modify vg_test wrapper to support PTEST formats
 
-This commit changes the valgrind regression test script vg_regtest to
+Change the valgrind regression test script vg_regtest to
 support the yocto ptest stdout reporting format.  The commit adds
 '--yocto-ptest' as an optional argument to vg_regtest, which alters
 the output to use the ptest infrastructure reporting format:
@@ -8,12 +8,16 @@ the output to use the ptest infrastructure reporting format:
 instead of valgrind's internal test reporting format.  Without the added
 option, --yocto-ptest, the valgrind regression test output is unchanged.
 
+Enforce 30 seconds limit for the test.
+This resume execution of the remaining tests when valgrind hangs.
+
 Upstream-Status: Pending
 
 Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
+Signed-off-by: Tudor Florea <tudor.florea@enea.com>
 
 diff --git a/tests/vg_regtest.in b/tests/vg_regtest.in
-index 224385f..dbbd23d 100755
+index 224385f..3e0383b 100755
 --- a/tests/vg_regtest.in
 +++ b/tests/vg_regtest.in
 @@ -39,11 +39,11 @@
@@ -55,7 +59,41 @@ index 224385f..dbbd23d 100755
              } else {
                  die $usage;
              }
-@@ -394,19 +397,21 @@ sub do_diffs($$$$)
+@@ -340,13 +343,28 @@ sub read_vgtest_file($)
+ #----------------------------------------------------------------------------
+ # Since most of the program time is spent in system() calls, need this to
+ # propagate a Ctrl-C enabling us to quit.
+-sub mysystem($) 
++# Enforce 30 seconds limit for the test.
++# This resume execution of the remaining tests if valgrind hangs.
++sub mysystem($)
+ {
+-    my $exit_code = system($_[0]);
+-    ($exit_code == 2) and exit 1;      # 2 is SIGINT
+-    return $exit_code;
++    my $exit_code=0;
++    eval {
++        local $SIG{'ALRM'} = sub { die "timed out\n" };
++        alarm(30);
++        $exit_code = system($_[0]);
++        alarm (0);
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
+ }
+-
+ # if $keepunfiltered, copies $1 to $1.unfiltered.out
+ # renames $0 tp $1
+ sub filtered_rename($$) 
+@@ -394,19 +412,21 @@ sub do_diffs($$$$)
                  # A match;  remove .out and any previously created .diff files.
                  unlink("$name.$mid.out");
                  unlink(<$name.$mid.diff*>);
@@ -79,7 +117,7 @@ index 224385f..dbbd23d 100755
      $vgtest =~ /^(.*)\.vgtest/;
      my $name = $1;
      my $fullname = "$dir/$name"; 
-@@ -425,7 +430,11 @@ sub do_one_test($$)
+@@ -425,7 +445,11 @@ sub do_one_test($$)
          } elsif (256 == $prereq_res) {
              # Nb: weird Perl-ism -- exit code of '1' is seen by Perl as 256...
              # Prereq failed, skip.
@@ -92,7 +130,7 @@ index 224385f..dbbd23d 100755
              return;
          } else {
              # Bad prereq; abort.
-@@ -438,7 +447,7 @@ sub do_one_test($$)
+@@ -438,7 +462,7 @@ sub do_one_test($$)
      if (defined $progB) {
          # If there is a progB, let's start it in background:
          printf("%-16s valgrind $extraopts $vgopts $prog $args (progB: $progB $argsB)\n",
@@ -101,7 +139,7 @@ index 224385f..dbbd23d 100755
          # progB.done used to detect child has finished. See below.
          # Note: redirection of stdout and stderr is before $progB to allow argsB
          # to e.g. redirect stdoutB to stderrB
-@@ -452,7 +461,8 @@ sub do_one_test($$)
+@@ -452,7 +476,8 @@ sub do_one_test($$)
                       . "touch progB.done)  &");
          }
      } else {
@@ -111,7 +149,7 @@ index 224385f..dbbd23d 100755
      }
   
      # Pass the appropriate --tool option for the directory (can be overridden
-@@ -487,7 +497,7 @@ sub do_one_test($$)
+@@ -487,7 +512,7 @@ sub do_one_test($$)
      # Find all the .stdout.exp files.  If none, use /dev/null.
      my @stdout_exps = <$name.stdout.exp*>;
      @stdout_exps = ( "/dev/null" ) if (0 == scalar @stdout_exps);
@@ -120,7 +158,7 @@ index 224385f..dbbd23d 100755
  
      # Filter stderr
      $stderr_filter_args = $name if (! defined $stderr_filter_args);
-@@ -496,7 +506,7 @@ sub do_one_test($$)
+@@ -496,7 +521,7 @@ sub do_one_test($$)
      # Find all the .stderr.exp files.  At least one must exist.
      my @stderr_exps = <$name.stderr.exp*>;
      (0 != scalar @stderr_exps) or die "Could not find `$name.stderr.exp*'\n";
@@ -129,7 +167,7 @@ index 224385f..dbbd23d 100755
  
      if (defined $progB) {
          # wait for the child to be finished
-@@ -520,7 +530,7 @@ sub do_one_test($$)
+@@ -520,7 +545,7 @@ sub do_one_test($$)
          # Find all the .stdoutB.exp files.  If none, use /dev/null.
          my @stdoutB_exps = <$name.stdoutB.exp*>;
          @stdoutB_exps = ( "/dev/null" ) if (0 == scalar @stdoutB_exps);
@@ -138,7 +176,7 @@ index 224385f..dbbd23d 100755
          
          # Filter stderr
          $stderrB_filter_args = $name if (! defined $stderrB_filter_args);
-@@ -529,7 +539,7 @@ sub do_one_test($$)
+@@ -529,7 +554,7 @@ sub do_one_test($$)
          # Find all the .stderrB.exp files.  At least one must exist.
          my @stderrB_exps = <$name.stderrB.exp*>;
          (0 != scalar @stderrB_exps) or die "Could not find `$name.stderrB.exp*'\n";
@@ -147,7 +185,7 @@ index 224385f..dbbd23d 100755
      }
  
      # Maybe do post-test check
-@@ -541,7 +551,7 @@ sub do_one_test($$)
+@@ -541,7 +566,7 @@ sub do_one_test($$)
  	    # Find all the .post.exp files.  If none, use /dev/null.
  	    my @post_exps = <$name.post.exp*>;
  	    @post_exps = ( "/dev/null" ) if (0 == scalar @post_exps);
@@ -156,7 +194,7 @@ index 224385f..dbbd23d 100755
  	}
      }
   
-@@ -550,6 +560,13 @@ sub do_one_test($$)
+@@ -550,6 +575,13 @@ sub do_one_test($$)
              print("(cleanup operation failed: $cleanup)\n");
      }
  
@@ -170,7 +208,7 @@ index 224385f..dbbd23d 100755
      $num_tests_done++;
  }
  
-@@ -589,7 +606,7 @@ sub test_one_dir($$)
+@@ -589,7 +621,7 @@ sub test_one_dir($$)
      my $found_tests = (0 != (grep { $_ =~ /\.vgtest$/ } @fs));
  
      if ($found_tests) {
@@ -179,7 +217,7 @@ index 224385f..dbbd23d 100755
      }
      foreach my $f (@fs) {
          if (-d $f) {
-@@ -599,7 +616,7 @@ sub test_one_dir($$)
+@@ -599,7 +631,7 @@ sub test_one_dir($$)
          }
      }
      if ($found_tests) {
@@ -188,7 +226,7 @@ index 224385f..dbbd23d 100755
      }
  
      chdir("..");
-@@ -625,10 +642,12 @@ sub summarise_results
+@@ -625,10 +657,12 @@ sub summarise_results
             $num_failures{"stdout"},   plural($num_failures{"stdout"}),
             $num_failures{"stderrB"},  plural($num_failures{"stderrB"}),
             $num_failures{"stdoutB"},  plural($num_failures{"stdoutB"}),
-- 
1.9.1


