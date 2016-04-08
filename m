Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 2A3457680A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Apr 2016 06:47:26 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-03.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1aoQCU-0007GZ-Go from Awais_Belal@mentor.com ;
	Thu, 07 Apr 2016 23:47:27 -0700
Received: from EU-MBX-03.mgc.mentorg.com ([169.254.2.95]) by
	SVR-IES-FEM-03.mgc.mentorg.com ([137.202.0.108]) with mapi id
	14.03.0224.002; Fri, 8 Apr 2016 07:47:25 +0100
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: "liezhi.yang@windriver.com" <liezhi.yang@windriver.com>
Thread-Topic: [OE-core] [jethro][PATCH] lttng-tools: fix regression tests hang
Thread-Index: AQHRimlrDuBdqLsfg0yBL9bpXkRsy59/sBdI
Date: Fri, 8 Apr 2016 06:47:24 +0000
Message-ID: <2021B186DC632746BD5A3CE32F12BD28011FBAB165@EU-MBX-03.mgc.mentorg.com>
References: <1459331281-11610-1-git-send-email-awais_belal@mentor.com>
In-Reply-To: <1459331281-11610-1-git-send-email-awais_belal@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [jethro][PATCH] lttng-tools: fix regression tests hang
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
X-List-Received-Date: Fri, 08 Apr 2016 06:47:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

This is another one.=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-b=
ounces@lists.openembedded.org] on behalf of Belal, Awais=0A=
Sent: Wednesday, March 30, 2016 2:48 PM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Subject: [OE-core] [jethro][PATCH] lttng-tools: fix regression tests hang=
=0A=
=0A=
Some of the lttng fast_regression ptests have race=0A=
conditions which end up in a deadlock so the test=0A=
case never returns and the only way around is to=0A=
kill the process.=0A=
This is fixed by picking up relevant patches from=0A=
lttng-tools mainstream that fix up the behavior=0A=
of these tests.=0A=
=0A=
Signed-off-by: Awais Belal <awais_belal@mentor.com>=0A=
---=0A=
 .../lttng/lttng-tools/Fix-regression-tests.patch   | 480 +++++++++++++++++=
++++=0A=
 meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb     |   1 +=0A=
 2 files changed, 481 insertions(+)=0A=
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/Fix-regression-te=
sts.patch=0A=
=0A=
diff --git a/meta/recipes-kernel/lttng/lttng-tools/Fix-regression-tests.pat=
ch b/meta/recipes-kernel/lttng/lttng-tools/Fix-regression-tests.patch=0A=
new file mode 100644=0A=
index 0000000..42f2074=0A=
--- /dev/null=0A=
+++ b/meta/recipes-kernel/lttng/lttng-tools/Fix-regression-tests.patch=0A=
@@ -0,0 +1,480 @@=0A=
+From 971c0ba5c008735b3c5013ca6e0e2e96ab63db90 Mon Sep 17 00:00:00 2001=0A=
+From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>=0A=
+Date: Thu, 24 Sep 2015 12:23:58 -0400=0A=
+Subject: [PATCH] Fix: regression tests=0A=
+MIME-Version: 1.0=0A=
+Content-Type: text/plain; charset=3DUTF-8=0A=
+Content-Transfer-Encoding: 8bit=0A=
+=0A=
+Fix racy session/relayd wait-after-kill scheme.=0A=
+Fix racy live test where application may not have generated events yet=0A=
+when we attach to the live trace.=0A=
+=0A=
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>=0A=
+Signed-off-by: J=E9r=E9mie Galarneau <jeremie.galarneau@efficios.com>=0A=
+=0A=
+Conflicts:=0A=
+       tests/utils/utils.sh=0A=
+=0A=
+Upstream-Status: Backport=0A=
+---=0A=
+ tests/regression/tools/health/test_health.sh       |   4 +-=0A=
+ tests/regression/tools/live/test_kernel            |  47 +---------=0A=
+ tests/regression/tools/live/test_ust               |  60 ++++--------=0A=
+ .../regression/tools/live/test_ust_tracefile_count |  60 ++++--------=0A=
+ tests/regression/tools/save-load/test_load         |   6 +-=0A=
+ tests/utils/utils.sh                               | 103 ++++++++++++++++=
-----=0A=
+ 6 files changed, 120 insertions(+), 160 deletions(-)=0A=
+=0A=
+diff --git a/tests/regression/tools/health/test_health.sh b/tests/regressi=
on/tools/health/test_health.sh=0A=
+index 6ae8885..ddc104c 100644=0A=
+--- a/tests/regression/tools/health/test_health.sh=0A=
++++ b/tests/regression/tools/health/test_health.sh=0A=
+@@ -146,7 +146,9 @@ function test_health=0A=
+       fi=0A=
+=0A=
+       if [ ${test_relayd} -eq 1 ]; then=0A=
+-              stop_lttng_relayd_nocheck=0A=
++              # We may fail to stop relayd here, and this is OK, since=0A=
++              # it may have been killed volountarily by testpoint.=0A=
++              stop_lttng_relayd_notap=0A=
+       fi=0A=
+       stop_lttng_sessiond=0A=
+=0A=
+diff --git a/tests/regression/tools/live/test_kernel b/tests/regression/to=
ols/live/test_kernel=0A=
+index 4b958df..0e542da 100755=0A=
+--- a/tests/regression/tools/live/test_kernel=0A=
++++ b/tests/regression/tools/live/test_kernel=0A=
+@@ -62,22 +62,8 @@ else=0A=
+       exit 0=0A=
+ fi=0A=
+=0A=
+-if [ -z $(pidof lt-$SESSIOND_BIN) ]; then=0A=
+-      $DIR/../src/bin/lttng-sessiond/$SESSIOND_BIN --background --quiet -=
-consumerd32-path=3D"$DIR/../src/bin/lttng-consumerd/lttng-consumerd" --con=
sumerd64-path=3D"$DIR/../src/bin/lttng-consumerd/lttng-consumerd"=0A=
+-      if [ $? -eq 1 ]; then=0A=
+-              echo "Fail to start lttng-sessiond"=0A=
+-              exit 1=0A=
+-      fi=0A=
+-fi=0A=
+-=0A=
+-opt=3D"--background -o $TRACE_PATH"=0A=
+-if [ -z $(pidof lt-$RELAYD_BIN) ]; then=0A=
+-      $DIR/../src/bin/lttng-relayd/$RELAYD_BIN $opt >/dev/null 2>&1=0A=
+-      if [ $? -eq 1 ]; then=0A=
+-              echo "Fail to start lttng-relayd (opt: $opt)"=0A=
+-              return 1=0A=
+-      fi=0A=
+-fi=0A=
++start_lttng_sessiond_notap=0A=
++start_lttng_relayd_notap "-o $TRACE_PATH"=0A=
+=0A=
+ setup_live_tracing=0A=
+=0A=
+@@ -86,30 +72,5 @@ $TESTDIR/regression/tools/live/live_test=0A=
+=0A=
+ clean_live_tracing=0A=
+=0A=
+-# Kill the relayd=0A=
+-PID_RELAYD=3D`pidof lt-$RELAYD_BIN`=0A=
+-kill $PID_RELAYD=0A=
+-if [ $? -eq 1 ]; then=0A=
+-      echo "Kill lttng-relayd (pid: $PID_RELAYD)"=0A=
+-      exit 1=0A=
+-else=0A=
+-      out=3D1=0A=
+-      while [ -n "$out" ]; do=0A=
+-              out=3D$(pidof lt-$RELAYD_BIN)=0A=
+-              sleep 0.5=0A=
+-      done=0A=
+-fi=0A=
+-=0A=
+-# Kill the sessiond=0A=
+-PID_SESSIOND=3D`pidof lt-$SESSIOND_BIN`=0A=
+-kill $PID_SESSIOND=0A=
+-if [ $? -eq 1 ]; then=0A=
+-      echo "Kill sessiond daemon"=0A=
+-      exit 1=0A=
+-else=0A=
+-      out=3D1=0A=
+-      while [ -n "$out" ]; do=0A=
+-              out=3D$(pidof lt-$SESSIOND_BIN)=0A=
+-              sleep 0.5=0A=
+-      done=0A=
+-fi=0A=
++stop_lttng_relayd_notap=0A=
++stop_lttng_sessiond_notap=0A=
+diff --git a/tests/regression/tools/live/test_ust b/tests/regression/tools=
/live/test_ust=0A=
+index ae69195..0b96858 100755=0A=
+--- a/tests/regression/tools/live/test_ust=0A=
++++ b/tests/regression/tools/live/test_ust=0A=
+@@ -59,57 +59,29 @@ function clean_live_tracing()=0A=
+       rm -rf $TRACE_PATH=0A=
+ }=0A=
+=0A=
+-if [ -z $(pidof lt-$SESSIOND_BIN) ]; then=0A=
+-      $DIR/../src/bin/lttng-sessiond/$SESSIOND_BIN --background --quiet -=
-consumerd32-path=3D"$DIR/../src/bin/lttng-consumerd/lttng-consumerd" --con=
sumerd64-path=3D"$DIR/../src/bin/lttng-consumerd/lttng-consumerd"=0A=
+-      if [ $? -eq 1 ]; then=0A=
+-              echo "Fail to start lttng-sessiond"=0A=
+-              exit 1=0A=
+-      fi=0A=
+-fi=0A=
+-=0A=
+-opt=3D"-o $TRACE_PATH --background"=0A=
+-if [ -z $(pidof lt-$RELAYD_BIN) ]; then=0A=
+-      $DIR/../src/bin/lttng-relayd/$RELAYD_BIN $opt >/dev/null 2>&1=0A=
+-      if [ $? -eq 1 ]; then=0A=
+-              echo "Fail to start lttng-relayd (opt: $opt)"=0A=
+-              return 1=0A=
+-      fi=0A=
+-fi=0A=
++file_sync_after_first=3D$(mktemp -u)=0A=
++=0A=
++start_lttng_sessiond_notap=0A=
++start_lttng_relayd_notap "-o $TRACE_PATH"=0A=
+=0A=
+ setup_live_tracing=0A=
+=0A=
+ # Run app in background=0A=
+-$TESTAPP_BIN $NR_ITER $NR_USEC_WAIT >/dev/null 2>&1=0A=
++$TESTAPP_BIN $NR_ITER $NR_USEC_WAIT ${file_sync_after_first} >/dev/null 2=
>&1=0A=
++=0A=
++while [ ! -f "${file_sync_after_first}" ]; do=0A=
++      sleep 0.5=0A=
++done=0A=
+=0A=
+ # Start the live test=0A=
+ $TESTDIR/regression/tools/live/live_test=0A=
+=0A=
++# Wait for the applications started in background=0A=
++wait=0A=
++=0A=
+ clean_live_tracing=0A=
+=0A=
+-# Kill the relayd=0A=
+-PID_RELAYD=3D`pidof lt-$RELAYD_BIN`=0A=
+-kill $PID_RELAYD=0A=
+-if [ $? -eq 1 ]; then=0A=
+-      echo "Kill lttng-relayd (pid: $PID_RELAYD)"=0A=
+-      exit 1=0A=
+-else=0A=
+-      out=3D1=0A=
+-      while [ -n "$out" ]; do=0A=
+-              out=3D$(pidof lt-$RELAYD_BIN)=0A=
+-              sleep 0.5=0A=
+-      done=0A=
+-fi=0A=
+-=0A=
+-# Kill the sessiond=0A=
+-PID_SESSIOND=3D`pidof lt-$SESSIOND_BIN`=0A=
+-kill $PID_SESSIOND=0A=
+-if [ $? -eq 1 ]; then=0A=
+-      echo "Kill sessiond daemon"=0A=
+-      exit 1=0A=
+-else=0A=
+-      out=3D1=0A=
+-      while [ -n "$out" ]; do=0A=
+-              out=3D$(pidof lt-$SESSIOND_BIN)=0A=
+-              sleep 0.5=0A=
+-      done=0A=
+-fi=0A=
++rm -f ${file_sync_after_first}=0A=
++=0A=
++stop_lttng_relayd_notap=0A=
++stop_lttng_sessiond_notap=0A=
+diff --git a/tests/regression/tools/live/test_ust_tracefile_count b/tests/=
regression/tools/live/test_ust_tracefile_count=0A=
+index 68e3722..54d6a52 100755=0A=
+--- a/tests/regression/tools/live/test_ust_tracefile_count=0A=
++++ b/tests/regression/tools/live/test_ust_tracefile_count=0A=
+@@ -60,57 +60,29 @@ function clean_live_tracing()=0A=
+       rm -rf $TRACE_PATH=0A=
+ }=0A=
+=0A=
+-if [ -z $(pidof lt-$SESSIOND_BIN) ]; then=0A=
+-      $DIR/../src/bin/lttng-sessiond/$SESSIOND_BIN --background --quiet -=
-consumerd32-path=3D"$DIR/../src/bin/lttng-consumerd/lttng-consumerd" --con=
sumerd64-path=3D"$DIR/../src/bin/lttng-consumerd/lttng-consumerd"=0A=
+-      if [ $? -eq 1 ]; then=0A=
+-              echo "Fail to start lttng-sessiond"=0A=
+-              exit 1=0A=
+-      fi=0A=
+-fi=0A=
+-=0A=
+-opt=3D"-o $TRACE_PATH --background"=0A=
+-if [ -z $(pidof lt-$RELAYD_BIN) ]; then=0A=
+-      $DIR/../src/bin/lttng-relayd/$RELAYD_BIN $opt >/dev/null 2>&1=0A=
+-      if [ $? -eq 1 ]; then=0A=
+-              echo "Fail to start lttng-relayd (opt: $opt)"=0A=
+-              return 1=0A=
+-      fi=0A=
+-fi=0A=
++file_sync_after_first=3D$(mktemp -u)=0A=
++=0A=
++start_lttng_sessiond_notap=0A=
++start_lttng_relayd_notap "-o $TRACE_PATH"=0A=
+=0A=
+ setup_live_tracing=0A=
+=0A=
+ # Run app in background=0A=
+-$TESTAPP_BIN $NR_ITER $NR_USEC_WAIT >/dev/null 2>&1=0A=
++$TESTAPP_BIN $NR_ITER $NR_USEC_WAIT ${file_sync_after_first} >/dev/null 2=
>&1=0A=
++=0A=
++while [ ! -f "${file_sync_after_first}" ]; do=0A=
++      sleep 0.5=0A=
++done=0A=
+=0A=
+ # Start the live test=0A=
+ $TESTDIR/regression/tools/live/live_test=0A=
+=0A=
++# Wait for the applications started in background=0A=
++wait=0A=
++=0A=
+ clean_live_tracing=0A=
+=0A=
+-# Kill the relayd=0A=
+-PID_RELAYD=3D`pidof lt-$RELAYD_BIN`=0A=
+-kill $PID_RELAYD=0A=
+-if [ $? -eq 1 ]; then=0A=
+-      echo "Kill lttng-relayd (pid: $PID_RELAYD)"=0A=
+-      exit 1=0A=
+-else=0A=
+-      out=3D1=0A=
+-      while [ -n "$out" ]; do=0A=
+-              out=3D$(pidof lt-$RELAYD_BIN)=0A=
+-              sleep 0.5=0A=
+-      done=0A=
+-fi=0A=
+-=0A=
+-# Kill the sessiond=0A=
+-PID_SESSIOND=3D`pidof lt-$SESSIOND_BIN`=0A=
+-kill $PID_SESSIOND=0A=
+-if [ $? -eq 1 ]; then=0A=
+-      echo "Kill sessiond daemon"=0A=
+-      exit 1=0A=
+-else=0A=
+-      out=3D1=0A=
+-      while [ -n "$out" ]; do=0A=
+-              out=3D$(pidof lt-$SESSIOND_BIN)=0A=
+-              sleep 0.5=0A=
+-      done=0A=
+-fi=0A=
++rm -f ${file_sync_after_first}=0A=
++=0A=
++stop_lttng_relayd_notap=0A=
++stop_lttng_sessiond_notap=0A=
+diff --git a/tests/regression/tools/save-load/test_load b/tests/regression=
/tools/save-load/test_load=0A=
+index 6b892cf..fc07924 100755=0A=
+--- a/tests/regression/tools/save-load/test_load=0A=
++++ b/tests/regression/tools/save-load/test_load=0A=
+@@ -29,7 +29,7 @@ EVENT_NAME=3D"tp:tptest"=0A=
+=0A=
+ DIR=3D$(readlink -f $TESTDIR)=0A=
+=0A=
+-NUM_TESTS=3D21=0A=
++NUM_TESTS=3D23=0A=
+=0A=
+ source $TESTDIR/utils/utils.sh=0A=
+=0A=
+@@ -92,7 +92,7 @@ function test_complex_load()=0A=
+       fi=0A=
+       destroy_lttng_session $sess=0A=
+=0A=
+-      stop_lttng_relayd_nocheck=0A=
++      stop_lttng_relayd=0A=
+ }=0A=
+=0A=
+ function test_all_load()=0A=
+@@ -108,7 +108,7 @@ function test_all_load()=0A=
+       destroy_lttng_session $SESSION_NAME=0A=
+       destroy_lttng_session "$SESSION_NAME-complex"=0A=
+=0A=
+-      stop_lttng_relayd_nocheck=0A=
++      stop_lttng_relayd=0A=
+ }=0A=
+=0A=
+ function test_overwrite()=0A=
+diff --git a/tests/utils/utils.sh b/tests/utils/utils.sh=0A=
+index 2510da5..1d19e64 100644=0A=
+--- a/tests/utils/utils.sh=0A=
++++ b/tests/utils/utils.sh=0A=
+@@ -233,9 +233,10 @@ function lttng_disable_kernel_channel_fail()=0A=
+       lttng_disable_kernel_channel 1 ${*}=0A=
+ }=0A=
+=0A=
+-function start_lttng_relayd=0A=
++function start_lttng_relayd_opt()=0A=
+ {=0A=
+-      local opt=3D$1=0A=
++      local withtap=3D$1=0A=
++      local opt=3D$2=0A=
+=0A=
+       DIR=3D$(readlink -f $TESTDIR)=0A=
+=0A=
+@@ -243,52 +244,77 @@ function start_lttng_relayd=0A=
+               $DIR/../src/bin/lttng-relayd/$RELAYD_BIN -b $opt >$OUTPUT_D=
EST=0A=
+               #$DIR/../src/bin/lttng-relayd/$RELAYD_BIN $opt -vvv >>/tmp/=
relayd.log 2>&1 &=0A=
+               if [ $? -eq 1 ]; then=0A=
+-                      fail "Start lttng-relayd (opt: $opt)"=0A=
++                      if [ $withtap -eq "1" ]; then=0A=
++                              fail "Start lttng-relayd (opt: $opt)"=0A=
++                      fi=0A=
+                       return 1=0A=
+               else=0A=
+-                      pass "Start lttng-relayd (opt: $opt)"=0A=
++                      if [ $withtap -eq "1" ]; then=0A=
++                              pass "Start lttng-relayd (opt: $opt)"=0A=
++                      fi=0A=
+               fi=0A=
+       else=0A=
+               pass "Start lttng-relayd (opt: $opt)"=0A=
+       fi=0A=
+ }=0A=
+=0A=
+-function stop_lttng_relayd_nocheck=0A=
++function start_lttng_relayd()=0A=
+ {=0A=
++      start_lttng_relayd_opt 1 "$@"=0A=
++}=0A=
++=0A=
++function start_lttng_relayd_notap()=0A=
++{=0A=
++      start_lttng_relayd_opt 0 "$@"=0A=
++}=0A=
++=0A=
++function stop_lttng_relayd_opt()=0A=
++{=0A=
++      local withtap=3D$1=0A=
++=0A=
+       PID_RELAYD=3D`pidof lt-$RELAYD_BIN`=0A=
+=0A=
+-      diag "Killing lttng-relayd (pid: $PID_RELAYD)"=0A=
++      if [ $withtap -eq "1" ]; then=0A=
++              diag "Killing lttng-relayd (pid: $PID_RELAYD)"=0A=
++      fi=0A=
+       kill $PID_RELAYD >$OUTPUT_DEST=0A=
+       retval=3D$?=0A=
+=0A=
+-      if [ $retval -eq 1 ]; then=0A=
++      if [ $? -eq 1 ]; then=0A=
++              if [ $withtap -eq "1" ]; then=0A=
++                      fail "Kill relay daemon"=0A=
++              fi=0A=
++              return 1=0A=
++      else=0A=
+               out=3D1=0A=
+               while [ -n "$out" ]; do=0A=
+                       out=3D$(pidof lt-$RELAYD_BIN)=0A=
+                       sleep 0.5=0A=
+               done=0A=
++              if [ $withtap -eq "1" ]; then=0A=
++                      pass "Kill relay daemon"=0A=
++              fi=0A=
+       fi=0A=
+       return $retval=0A=
+ }=0A=
+=0A=
+-function stop_lttng_relayd=0A=
++function stop_lttng_relayd()=0A=
+ {=0A=
+-      stop_lttng_relayd_nocheck=0A=
++      stop_lttng_relayd_opt 1 "$@"=0A=
++}=0A=
+=0A=
+-      if [ $? -eq 1 ]; then=0A=
+-              fail "Killed lttng-relayd (pid: $PID_RELAYD)"=0A=
+-              return 1=0A=
+-      else=0A=
+-              pass "Killed lttng-relayd (pid: $PID_RELAYD)"=0A=
+-              return 0=0A=
+-      fi=0A=
++function stop_lttng_relayd_notap()=0A=
++{=0A=
++      stop_lttng_relayd_opt 0 "$@"=0A=
+ }=0A=
+=0A=
+-#First argument: load path for automatic loading=0A=
+-function start_lttng_sessiond()=0A=
++#First arg: show tap output=0A=
++#Second argument: load path for automatic loading=0A=
++function start_lttng_sessiond_opt()=0A=
+ {=0A=
++      local withtap=3D$1=0A=
++      local load_path=3D$2=0A=
+=0A=
+-      local load_path=3D"$1"=0A=
+       if [ -n $TEST_NO_SESSIOND ] && [ "$TEST_NO_SESSIOND" =3D=3D "1" ]; =
then=0A=
+               # Env variable requested no session daemon=0A=
+               return=0A=
+@@ -306,19 +332,33 @@ function start_lttng_sessiond()=0A=
+=0A=
+       if [ -z $(pidof lt-$SESSIOND_BIN) ]; then=0A=
+               # Have a load path ?=0A=
+-              if [ -n "$1" ]; then=0A=
++              if [ -n "$load_path" ]; then=0A=
+                       $DIR/../src/bin/lttng-sessiond/$SESSIOND_BIN --load=
 "$1" --background --consumerd32-path=3D"$DIR/../src/bin/lttng-consumerd/lt=
tng-consumerd" --consumerd64-path=3D"$DIR/../src/bin/lttng-consumerd/lttng-=
consumerd"=0A=
+               else=0A=
+                       $DIR/../src/bin/lttng-sessiond/$SESSIOND_BIN --back=
ground --consumerd32-path=3D"$DIR/../src/bin/lttng-consumerd/lttng-consumer=
d" --consumerd64-path=3D"$DIR/../src/bin/lttng-consumerd/lttng-consumerd"=
=0A=
+               fi=0A=
+               #$DIR/../src/bin/lttng-sessiond/$SESSIOND_BIN --background =
--consumerd32-path=3D"$DIR/../src/bin/lttng-consumerd/lttng-consumerd" --co=
nsumerd64-path=3D"$DIR/../src/bin/lttng-consumerd/lttng-consumerd" --verbos=
e-consumer >>/tmp/sessiond.log 2>&1=0A=
+               status=3D$?=0A=
+-              ok $status "Start session daemon"=0A=
++              if [ $withtap -eq "1" ]; then=0A=
++                      ok $status "Start session daemon"=0A=
++              fi=0A=
+       fi=0A=
+ }=0A=
+=0A=
+-function stop_lttng_sessiond ()=0A=
++function start_lttng_sessiond()=0A=
++{=0A=
++      start_lttng_sessiond_opt 1 "$@"=0A=
++}=0A=
++=0A=
++function start_lttng_sessiond_notap()=0A=
+ {=0A=
++      start_lttng_sessiond_opt 0 "$@"=0A=
++}=0A=
++=0A=
++function stop_lttng_sessiond_opt()=0A=
++{=0A=
++      local withtap=3D$1=0A=
++=0A=
+       if [ -n $TEST_NO_SESSIOND ] && [ "$TEST_NO_SESSIOND" =3D=3D "1" ]; =
then=0A=
+               # Env variable requested no session daemon=0A=
+               return=0A=
+@@ -329,8 +369,9 @@ function stop_lttng_sessiond ()=0A=
+       kill $PID_SESSIOND >$OUTPUT_DEST=0A=
+=0A=
+       if [ $? -eq 1 ]; then=0A=
+-              fail "Kill sessions daemon"=0A=
+-              return 1=0A=
++              if [ $withtap -eq "1" ]; then=0A=
++                      fail "Kill sessions daemon"=0A=
++              fi=0A=
+       else=0A=
+               out=3D1=0A=
+               while [ -n "$out" ]; do=0A=
+@@ -342,10 +383,22 @@ function stop_lttng_sessiond ()=0A=
+                       out=3D$(pidof $CONSUMERD_BIN)=0A=
+                       sleep 0.5=0A=
+               done=0A=
+-              pass "Kill session daemon"=0A=
++              if [ $withtap -eq "1" ]; then=0A=
++                      pass "Kill session daemon"=0A=
++              fi=0A=
+       fi=0A=
+ }=0A=
+=0A=
++function stop_lttng_sessiond()=0A=
++{=0A=
++      stop_lttng_sessiond_opt 1 "$@"=0A=
++}=0A=
++=0A=
++function stop_lttng_sessiond_notap()=0A=
++{=0A=
++      stop_lttng_sessiond_opt 0 "$@"=0A=
++}=0A=
++=0A=
+ function list_lttng_with_opts ()=0A=
+ {=0A=
+       local opts=3D$1=0A=
+--=0A=
+1.9.1=0A=
+=0A=
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb b/meta/recipes-=
kernel/lttng/lttng-tools_2.6.0.bb=0A=
index 909acc3..175c889 100644=0A=
--- a/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb=0A=
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb=0A=
@@ -29,6 +29,7 @@ SRC_URI =3D "git://git.lttng.org/lttng-tools.git;branch=
=3Dstable-2.6 \=0A=
            file://run-ptest \=0A=
            file://lttng-tools-Fix-live-timer-calculation-error.patch \=0A=
            file://0001-Fix-sessiond-disable-match-app-event-by-name.patch =
\=0A=
+           file://Fix-regression-tests.patch \=0A=
          "=0A=
=0A=
 S =3D "${WORKDIR}/git"=0A=
--=0A=
1.9.1=0A=
=0A=
--=0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=

