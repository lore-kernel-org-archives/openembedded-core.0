Return-Path: <Radu.Patriu@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 638EB6FA3E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 14:38:43 +0000 (UTC)
Received: from rapa-2.enea.se (192.168.14.124) by SESTOEX03.enea.se
	(172.21.1.38) with Microsoft SMTP Server (TLS) id 14.3.158.1;
	Wed, 26 Mar 2014 15:38:40 +0100
From: Radu Patriu <radu.patriu@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Mar 2014 16:38:18 +0200
Message-ID: <1395844698-26999-1-git-send-email-radu.patriu@enea.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [192.168.14.124]
Subject: [PATCH] autoconf: new autotest/testsuite option to enable automake test result format
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
X-List-Received-Date: Wed, 26 Mar 2014 14:38:46 -0000
Content-Type: text/plain

lib/autotest/general.m4: added "--am-fmt | -A" command line parameter
for testsuite script to enable "RESULT: testname" output format; to be
used by yocto ptest packages directly or with autoconf TESTSUITEFLAGS.

Signed-off-by: Radu Patriu <radu.patriu@enea.com>
---
 .../autoconf/autotest-automake-result-format.patch |  136 ++++++++++++++++++++
 meta/recipes-devtools/autoconf/autoconf_2.69.bb    |    1 +
 2 files changed, 137 insertions(+)
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/autotest-automake-result-format.patch

diff --git a/meta/recipes-devtools/autoconf/autoconf/autotest-automake-result-format.patch b/meta/recipes-devtools/autoconf/autoconf/autotest-automake-result-format.patch
new file mode 100644
index 0000000..b5e8174
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/autotest-automake-result-format.patch
@@ -0,0 +1,136 @@
+From a7e722f974e2529d3e564d8d94c86cc8bdbc40e7 Mon Sep 17 00:00:00 2001
+From: Radu Patriu <radu.patriu@enea.com>
+Date: Mon, 24 Mar 2014 16:33:19 +0200
+Subject: [PATCH] autotest: new testsuite option to enable automake test
+ result format
+
+* lib/autotest/general.m4: added "--am-fmt | -A" command line
+parameter for testsuite script to enable "RESULT: testname" output;
+will be used by yocto ptest packages.
+
+Upstream-Status: Pending
+
+Signed-off-by: Radu Patriu <radu.patriu@enea.com>
+---
+ lib/autotest/general.m4 |   39 +++++++++++++++++++++++++++++----------
+ 1 file changed, 29 insertions(+), 10 deletions(-)
+
+diff --git a/lib/autotest/general.m4 b/lib/autotest/general.m4
+index 60c0352..c1f5a9b 100644
+--- a/lib/autotest/general.m4
++++ b/lib/autotest/general.m4
+@@ -412,6 +412,9 @@ at_recheck=
+ # Whether a write failure occurred
+ at_write_fail=0
+ 
++# Automake result format "result: testname"
++at_am_fmt=false
++
+ # The directory we run the suite in.  Default to . if no -C option.
+ at_dir=`pwd`
+ # An absolute reference to this testsuite script.
+@@ -530,6 +533,10 @@ do
+ 	at_check_filter_trace=at_fn_filter_trace
+ 	;;
+ 
++    --am-fmt | -A )
++	at_am_fmt=:
++	;;
++
+     [[0-9] | [0-9][0-9] | [0-9][0-9][0-9] | [0-9][0-9][0-9][0-9]])
+ 	at_fn_validate_ranges at_option
+ 	AS_VAR_APPEND([at_groups], ["$at_option$as_nl"])
+@@ -718,10 +725,10 @@ m4_divert_push([HELP_MODES])dnl
+ cat <<_ATEOF || at_write_fail=1
+ 
+ Operation modes:
+-  -h, --help     print the help message, then exit
+-  -V, --version  print version number, then exit
+-  -c, --clean    remove all the files this test suite might create and exit
+-  -l, --list     describes all the tests, or the selected TESTS
++  -h, --help      print the help message, then exit
++  -V, --version   print version number, then exit
++  -c, --clean     remove all the files this test suite might create and exit
++  -l, --list      describes all the tests, or the selected TESTS
+ _ATEOF
+ m4_divert_pop([HELP_MODES])dnl
+ m4_wrap([m4_divert_push([HELP_TUNING_BEGIN])dnl
+@@ -747,6 +754,7 @@ Execution tuning:
+   -d, --debug    inhibit clean up and top-level logging
+ [                 default for debugging scripts]
+   -x, --trace    enable tests shell tracing
++  -A, --am-fmt   automake result format "result: testname"
+ _ATEOF
+ m4_divert_pop([HELP_TUNING_BEGIN])])dnl
+ m4_divert_push([HELP_END])dnl
+@@ -1162,7 +1170,9 @@ at_fn_group_banner ()
+     [*])          at_desc_line="$[1]: "  ;;
+   esac
+   AS_VAR_APPEND([at_desc_line], ["$[3]$[4]"])
+-  $at_quiet AS_ECHO_N(["$at_desc_line"])
++  if ! $at_am_fmt; then
++    $at_quiet AS_ECHO_N(["$at_desc_line"])
++  fi
+   echo "#                             -*- compilation -*-" >> "$at_group_log"
+ }
+ 
+@@ -1188,42 +1198,51 @@ _ATEOF
+   case $at_xfail:$at_status in
+     yes:0)
+ 	at_msg="UNEXPECTED PASS"
++	at_am_msg="XPASS"
+ 	at_res=xpass
+ 	at_errexit=$at_errexit_p
+ 	at_color=$at_red
+ 	;;
+     no:0)
+ 	at_msg="ok"
++	at_am_msg="PASS"
+ 	at_res=pass
+ 	at_errexit=false
+ 	at_color=$at_grn
+ 	;;
+     *:77)
+ 	at_msg='skipped ('`cat "$at_check_line_file"`')'
++	at_am_msg="SKIP"
+ 	at_res=skip
+ 	at_errexit=false
+ 	at_color=$at_blu
+ 	;;
+     no:* | *:99)
+ 	at_msg='FAILED ('`cat "$at_check_line_file"`')'
++	at_am_msg="FAIL"
+ 	at_res=fail
+ 	at_errexit=$at_errexit_p
+ 	at_color=$at_red
+ 	;;
+     yes:*)
+ 	at_msg='expected failure ('`cat "$at_check_line_file"`')'
++	at_am_msg="XFAIL"
+ 	at_res=xfail
+ 	at_errexit=false
+ 	at_color=$at_lgn
+ 	;;
+   esac
+   echo "$at_res" > "$at_job_dir/$at_res"
+-  # In parallel mode, output the summary line only afterwards.
+-  if test $at_jobs -ne 1 && test -n "$at_verbose"; then
+-    AS_ECHO(["$at_desc_line $at_color$at_msg$at_std"])
++  if $at_am_fmt; then
++      AS_ECHO(["$at_am_msg: $at_desc"])
+   else
+-    # Make sure there is a separator even with long titles.
+-    AS_ECHO([" $at_color$at_msg$at_std"])
++    # In parallel mode, output the summary line only afterwards.
++    if test $at_jobs -ne 1 && test -n "$at_verbose"; then
++      AS_ECHO(["$at_desc_line $at_color$at_msg$at_std"])
++    else
++      # Make sure there is a separator even with long titles.
++      AS_ECHO([" $at_color$at_msg$at_std"])
++    fi
+   fi
+   at_log_msg="$at_group. $at_desc ($at_setup_line): $at_msg"
+   case $at_status in
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.69.bb b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
index b67155b..a2ecd94 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.69.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
@@ -16,6 +16,7 @@ SRC_URI += "file://autoreconf-include.patch \
             file://config_site.patch \
             file://remove-usr-local-lib-from-m4.patch \
             file://preferbash.patch \
+            file://autotest-automake-result-format.patch \
            "
 
 SRC_URI[md5sum] = "82d05e03b93e45f5a39b828dc9c6c29b"
-- 
1.7.9.5


