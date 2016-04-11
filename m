Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 64E22731DA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 07:29:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3B7TUR4020269
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 00:29:30 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 11 Apr 2016 00:29:29 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Apr 2016 00:29:17 -0700
Message-ID: <5711ebbaef165f0ec2715e3eba9683878226efb3.1460359568.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
In-Reply-To: <cover.1460359568.git.liezhi.yang@windriver.com>
References: <cover.1460359568.git.liezhi.yang@windriver.com>
Subject: [PATCH 14/14] lttng-tools: fix regression tests hang
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
X-List-Received-Date: Mon, 11 Apr 2016 07:29:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Awais Belal <awais_belal@mentor.com>

Some of the lttng fast_regression ptests have race
conditions which end up in a deadlock so the test
case never returns and the only way around is to
kill the process.
This is fixed by picking up relevant patches from
lttng-tools mainstream that fix up the behavior
of these tests.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../lttng/lttng-tools/Fix-regression-tests.patch   | 480 +++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb     |   1 +
 2 files changed, 481 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/Fix-regression-tests.patch

diff --git a/meta/recipes-kernel/lttng/lttng-tools/Fix-regression-tests.patch b/meta/recipes-kernel/lttng/lttng-tools/Fix-regression-tests.patch
new file mode 100644
index 0000000..42f2074
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/Fix-regression-tests.patch
@@ -0,0 +1,480 @@
+From 971c0ba5c008735b3c5013ca6e0e2e96ab63db90 Mon Sep 17 00:00:00 2001
+From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Date: Thu, 24 Sep 2015 12:23:58 -0400
+Subject: [PATCH] Fix: regression tests
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fix racy session/relayd wait-after-kill scheme.
+Fix racy live test where application may not have generated events yet
+when we attach to the live trace.
+
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Signed-off-by: Jérémie Galarneau <jeremie.galarneau@efficios.com>
+
+Conflicts:
+	tests/utils/utils.sh
+
+Upstream-Status: Backport
+---
+ tests/regression/tools/health/test_health.sh       |   4 +-
+ tests/regression/tools/live/test_kernel            |  47 +---------
+ tests/regression/tools/live/test_ust               |  60 ++++--------
+ .../regression/tools/live/test_ust_tracefile_count |  60 ++++--------
+ tests/regression/tools/save-load/test_load         |   6 +-
+ tests/utils/utils.sh                               | 103 ++++++++++++++++-----
+ 6 files changed, 120 insertions(+), 160 deletions(-)
+
+diff --git a/tests/regression/tools/health/test_health.sh b/tests/regression/tools/health/test_health.sh
+index 6ae8885..ddc104c 100644
+--- a/tests/regression/tools/health/test_health.sh
++++ b/tests/regression/tools/health/test_health.sh
+@@ -146,7 +146,9 @@ function test_health
+ 	fi
+ 
+ 	if [ ${test_relayd} -eq 1 ]; then
+-		stop_lttng_relayd_nocheck
++		# We may fail to stop relayd here, and this is OK, since
++		# it may have been killed volountarily by testpoint.
++		stop_lttng_relayd_notap
+ 	fi
+ 	stop_lttng_sessiond
+ 
+diff --git a/tests/regression/tools/live/test_kernel b/tests/regression/tools/live/test_kernel
+index 4b958df..0e542da 100755
+--- a/tests/regression/tools/live/test_kernel
++++ b/tests/regression/tools/live/test_kernel
+@@ -62,22 +62,8 @@ else
+ 	exit 0
+ fi
+ 
+-if [ -z $(pidof lt-$SESSIOND_BIN) ]; then
+-	$DIR/../src/bin/lttng-sessiond/$SESSIOND_BIN --background --quiet --consumerd32-path="$DIR/../src/bin/lttng-consumerd/lttng-consumerd" --consumerd64-path="$DIR/../src/bin/lttng-consumerd/lttng-consumerd"
+-	if [ $? -eq 1 ]; then
+-		echo "Fail to start lttng-sessiond"
+-		exit 1
+-	fi
+-fi
+-
+-opt="--background -o $TRACE_PATH"
+-if [ -z $(pidof lt-$RELAYD_BIN) ]; then
+-	$DIR/../src/bin/lttng-relayd/$RELAYD_BIN $opt >/dev/null 2>&1
+-	if [ $? -eq 1 ]; then
+-		echo "Fail to start lttng-relayd (opt: $opt)"
+-		return 1
+-	fi
+-fi
++start_lttng_sessiond_notap
++start_lttng_relayd_notap "-o $TRACE_PATH"
+ 
+ setup_live_tracing
+ 
+@@ -86,30 +72,5 @@ $TESTDIR/regression/tools/live/live_test
+ 
+ clean_live_tracing
+ 
+-# Kill the relayd
+-PID_RELAYD=`pidof lt-$RELAYD_BIN`
+-kill $PID_RELAYD
+-if [ $? -eq 1 ]; then
+-	echo "Kill lttng-relayd (pid: $PID_RELAYD)"
+-	exit 1
+-else
+-	out=1
+-	while [ -n "$out" ]; do
+-		out=$(pidof lt-$RELAYD_BIN)
+-		sleep 0.5
+-	done
+-fi
+-
+-# Kill the sessiond
+-PID_SESSIOND=`pidof lt-$SESSIOND_BIN`
+-kill $PID_SESSIOND
+-if [ $? -eq 1 ]; then
+-	echo "Kill sessiond daemon"
+-	exit 1
+-else
+-	out=1
+-	while [ -n "$out" ]; do
+-		out=$(pidof lt-$SESSIOND_BIN)
+-		sleep 0.5
+-	done
+-fi
++stop_lttng_relayd_notap
++stop_lttng_sessiond_notap
+diff --git a/tests/regression/tools/live/test_ust b/tests/regression/tools/live/test_ust
+index ae69195..0b96858 100755
+--- a/tests/regression/tools/live/test_ust
++++ b/tests/regression/tools/live/test_ust
+@@ -59,57 +59,29 @@ function clean_live_tracing()
+ 	rm -rf $TRACE_PATH
+ }
+ 
+-if [ -z $(pidof lt-$SESSIOND_BIN) ]; then
+-	$DIR/../src/bin/lttng-sessiond/$SESSIOND_BIN --background --quiet --consumerd32-path="$DIR/../src/bin/lttng-consumerd/lttng-consumerd" --consumerd64-path="$DIR/../src/bin/lttng-consumerd/lttng-consumerd"
+-	if [ $? -eq 1 ]; then
+-		echo "Fail to start lttng-sessiond"
+-		exit 1
+-	fi
+-fi
+-
+-opt="-o $TRACE_PATH --background"
+-if [ -z $(pidof lt-$RELAYD_BIN) ]; then
+-	$DIR/../src/bin/lttng-relayd/$RELAYD_BIN $opt >/dev/null 2>&1
+-	if [ $? -eq 1 ]; then
+-		echo "Fail to start lttng-relayd (opt: $opt)"
+-		return 1
+-	fi
+-fi
++file_sync_after_first=$(mktemp -u)
++
++start_lttng_sessiond_notap
++start_lttng_relayd_notap "-o $TRACE_PATH"
+ 
+ setup_live_tracing
+ 
+ # Run app in background
+-$TESTAPP_BIN $NR_ITER $NR_USEC_WAIT >/dev/null 2>&1
++$TESTAPP_BIN $NR_ITER $NR_USEC_WAIT ${file_sync_after_first} >/dev/null 2>&1
++
++while [ ! -f "${file_sync_after_first}" ]; do
++	sleep 0.5
++done
+ 
+ # Start the live test
+ $TESTDIR/regression/tools/live/live_test
+ 
++# Wait for the applications started in background
++wait
++
+ clean_live_tracing
+ 
+-# Kill the relayd
+-PID_RELAYD=`pidof lt-$RELAYD_BIN`
+-kill $PID_RELAYD
+-if [ $? -eq 1 ]; then
+-	echo "Kill lttng-relayd (pid: $PID_RELAYD)"
+-	exit 1
+-else
+-	out=1
+-	while [ -n "$out" ]; do
+-		out=$(pidof lt-$RELAYD_BIN)
+-		sleep 0.5
+-	done
+-fi
+-
+-# Kill the sessiond
+-PID_SESSIOND=`pidof lt-$SESSIOND_BIN`
+-kill $PID_SESSIOND
+-if [ $? -eq 1 ]; then
+-	echo "Kill sessiond daemon"
+-	exit 1
+-else
+-	out=1
+-	while [ -n "$out" ]; do
+-		out=$(pidof lt-$SESSIOND_BIN)
+-		sleep 0.5
+-	done
+-fi
++rm -f ${file_sync_after_first}
++
++stop_lttng_relayd_notap
++stop_lttng_sessiond_notap
+diff --git a/tests/regression/tools/live/test_ust_tracefile_count b/tests/regression/tools/live/test_ust_tracefile_count
+index 68e3722..54d6a52 100755
+--- a/tests/regression/tools/live/test_ust_tracefile_count
++++ b/tests/regression/tools/live/test_ust_tracefile_count
+@@ -60,57 +60,29 @@ function clean_live_tracing()
+ 	rm -rf $TRACE_PATH
+ }
+ 
+-if [ -z $(pidof lt-$SESSIOND_BIN) ]; then
+-	$DIR/../src/bin/lttng-sessiond/$SESSIOND_BIN --background --quiet --consumerd32-path="$DIR/../src/bin/lttng-consumerd/lttng-consumerd" --consumerd64-path="$DIR/../src/bin/lttng-consumerd/lttng-consumerd"
+-	if [ $? -eq 1 ]; then
+-		echo "Fail to start lttng-sessiond"
+-		exit 1
+-	fi
+-fi
+-
+-opt="-o $TRACE_PATH --background"
+-if [ -z $(pidof lt-$RELAYD_BIN) ]; then
+-	$DIR/../src/bin/lttng-relayd/$RELAYD_BIN $opt >/dev/null 2>&1
+-	if [ $? -eq 1 ]; then
+-		echo "Fail to start lttng-relayd (opt: $opt)"
+-		return 1
+-	fi
+-fi
++file_sync_after_first=$(mktemp -u)
++
++start_lttng_sessiond_notap
++start_lttng_relayd_notap "-o $TRACE_PATH"
+ 
+ setup_live_tracing
+ 
+ # Run app in background
+-$TESTAPP_BIN $NR_ITER $NR_USEC_WAIT >/dev/null 2>&1
++$TESTAPP_BIN $NR_ITER $NR_USEC_WAIT ${file_sync_after_first} >/dev/null 2>&1
++
++while [ ! -f "${file_sync_after_first}" ]; do
++	sleep 0.5
++done
+ 
+ # Start the live test
+ $TESTDIR/regression/tools/live/live_test
+ 
++# Wait for the applications started in background
++wait
++
+ clean_live_tracing
+ 
+-# Kill the relayd
+-PID_RELAYD=`pidof lt-$RELAYD_BIN`
+-kill $PID_RELAYD
+-if [ $? -eq 1 ]; then
+-	echo "Kill lttng-relayd (pid: $PID_RELAYD)"
+-	exit 1
+-else
+-	out=1
+-	while [ -n "$out" ]; do
+-		out=$(pidof lt-$RELAYD_BIN)
+-		sleep 0.5
+-	done
+-fi
+-
+-# Kill the sessiond
+-PID_SESSIOND=`pidof lt-$SESSIOND_BIN`
+-kill $PID_SESSIOND
+-if [ $? -eq 1 ]; then
+-	echo "Kill sessiond daemon"
+-	exit 1
+-else
+-	out=1
+-	while [ -n "$out" ]; do
+-		out=$(pidof lt-$SESSIOND_BIN)
+-		sleep 0.5
+-	done
+-fi
++rm -f ${file_sync_after_first}
++
++stop_lttng_relayd_notap
++stop_lttng_sessiond_notap
+diff --git a/tests/regression/tools/save-load/test_load b/tests/regression/tools/save-load/test_load
+index 6b892cf..fc07924 100755
+--- a/tests/regression/tools/save-load/test_load
++++ b/tests/regression/tools/save-load/test_load
+@@ -29,7 +29,7 @@ EVENT_NAME="tp:tptest"
+ 
+ DIR=$(readlink -f $TESTDIR)
+ 
+-NUM_TESTS=21
++NUM_TESTS=23
+ 
+ source $TESTDIR/utils/utils.sh
+ 
+@@ -92,7 +92,7 @@ function test_complex_load()
+ 	fi
+ 	destroy_lttng_session $sess
+ 
+-	stop_lttng_relayd_nocheck
++	stop_lttng_relayd
+ }
+ 
+ function test_all_load()
+@@ -108,7 +108,7 @@ function test_all_load()
+ 	destroy_lttng_session $SESSION_NAME
+ 	destroy_lttng_session "$SESSION_NAME-complex"
+ 
+-	stop_lttng_relayd_nocheck
++	stop_lttng_relayd
+ }
+ 
+ function test_overwrite()
+diff --git a/tests/utils/utils.sh b/tests/utils/utils.sh
+index 2510da5..1d19e64 100644
+--- a/tests/utils/utils.sh
++++ b/tests/utils/utils.sh
+@@ -233,9 +233,10 @@ function lttng_disable_kernel_channel_fail()
+ 	lttng_disable_kernel_channel 1 ${*}
+ }
+ 
+-function start_lttng_relayd
++function start_lttng_relayd_opt()
+ {
+-	local opt=$1
++	local withtap=$1
++	local opt=$2
+ 
+ 	DIR=$(readlink -f $TESTDIR)
+ 
+@@ -243,52 +244,77 @@ function start_lttng_relayd
+ 		$DIR/../src/bin/lttng-relayd/$RELAYD_BIN -b $opt >$OUTPUT_DEST
+ 		#$DIR/../src/bin/lttng-relayd/$RELAYD_BIN $opt -vvv >>/tmp/relayd.log 2>&1 &
+ 		if [ $? -eq 1 ]; then
+-			fail "Start lttng-relayd (opt: $opt)"
++			if [ $withtap -eq "1" ]; then
++				fail "Start lttng-relayd (opt: $opt)"
++			fi
+ 			return 1
+ 		else
+-			pass "Start lttng-relayd (opt: $opt)"
++			if [ $withtap -eq "1" ]; then
++				pass "Start lttng-relayd (opt: $opt)"
++			fi
+ 		fi
+ 	else
+ 		pass "Start lttng-relayd (opt: $opt)"
+ 	fi
+ }
+ 
+-function stop_lttng_relayd_nocheck
++function start_lttng_relayd()
+ {
++	start_lttng_relayd_opt 1 "$@"
++}
++
++function start_lttng_relayd_notap()
++{
++	start_lttng_relayd_opt 0 "$@"
++}
++
++function stop_lttng_relayd_opt()
++{
++	local withtap=$1
++
+ 	PID_RELAYD=`pidof lt-$RELAYD_BIN`
+ 
+-	diag "Killing lttng-relayd (pid: $PID_RELAYD)"
++	if [ $withtap -eq "1" ]; then
++		diag "Killing lttng-relayd (pid: $PID_RELAYD)"
++	fi
+ 	kill $PID_RELAYD >$OUTPUT_DEST
+ 	retval=$?
+ 
+-	if [ $retval -eq 1 ]; then
++	if [ $? -eq 1 ]; then
++		if [ $withtap -eq "1" ]; then
++			fail "Kill relay daemon"
++		fi
++		return 1
++	else
+ 		out=1
+ 		while [ -n "$out" ]; do
+ 			out=$(pidof lt-$RELAYD_BIN)
+ 			sleep 0.5
+ 		done
++		if [ $withtap -eq "1" ]; then
++			pass "Kill relay daemon"
++		fi
+ 	fi
+ 	return $retval
+ }
+ 
+-function stop_lttng_relayd
++function stop_lttng_relayd()
+ {
+-	stop_lttng_relayd_nocheck
++	stop_lttng_relayd_opt 1 "$@"
++}
+ 
+-	if [ $? -eq 1 ]; then
+-		fail "Killed lttng-relayd (pid: $PID_RELAYD)"
+-		return 1
+-	else
+-		pass "Killed lttng-relayd (pid: $PID_RELAYD)"
+-		return 0
+-	fi
++function stop_lttng_relayd_notap()
++{
++	stop_lttng_relayd_opt 0 "$@"
+ }
+ 
+-#First argument: load path for automatic loading
+-function start_lttng_sessiond()
++#First arg: show tap output
++#Second argument: load path for automatic loading
++function start_lttng_sessiond_opt()
+ {
++	local withtap=$1
++	local load_path=$2
+ 
+-	local load_path="$1"
+ 	if [ -n $TEST_NO_SESSIOND ] && [ "$TEST_NO_SESSIOND" == "1" ]; then
+ 		# Env variable requested no session daemon
+ 		return
+@@ -306,19 +332,33 @@ function start_lttng_sessiond()
+ 
+ 	if [ -z $(pidof lt-$SESSIOND_BIN) ]; then
+ 		# Have a load path ?
+-		if [ -n "$1" ]; then
++		if [ -n "$load_path" ]; then
+ 			$DIR/../src/bin/lttng-sessiond/$SESSIOND_BIN --load "$1" --background --consumerd32-path="$DIR/../src/bin/lttng-consumerd/lttng-consumerd" --consumerd64-path="$DIR/../src/bin/lttng-consumerd/lttng-consumerd"
+ 		else
+ 			$DIR/../src/bin/lttng-sessiond/$SESSIOND_BIN --background --consumerd32-path="$DIR/../src/bin/lttng-consumerd/lttng-consumerd" --consumerd64-path="$DIR/../src/bin/lttng-consumerd/lttng-consumerd"
+ 		fi
+ 		#$DIR/../src/bin/lttng-sessiond/$SESSIOND_BIN --background --consumerd32-path="$DIR/../src/bin/lttng-consumerd/lttng-consumerd" --consumerd64-path="$DIR/../src/bin/lttng-consumerd/lttng-consumerd" --verbose-consumer >>/tmp/sessiond.log 2>&1
+ 		status=$?
+-		ok $status "Start session daemon"
++		if [ $withtap -eq "1" ]; then
++			ok $status "Start session daemon"
++		fi
+ 	fi
+ }
+ 
+-function stop_lttng_sessiond ()
++function start_lttng_sessiond()
++{
++	start_lttng_sessiond_opt 1 "$@"
++}
++
++function start_lttng_sessiond_notap()
+ {
++	start_lttng_sessiond_opt 0 "$@"
++}
++
++function stop_lttng_sessiond_opt()
++{
++	local withtap=$1
++
+ 	if [ -n $TEST_NO_SESSIOND ] && [ "$TEST_NO_SESSIOND" == "1" ]; then
+ 		# Env variable requested no session daemon
+ 		return
+@@ -329,8 +369,9 @@ function stop_lttng_sessiond ()
+ 	kill $PID_SESSIOND >$OUTPUT_DEST
+ 
+ 	if [ $? -eq 1 ]; then
+-		fail "Kill sessions daemon"
+-		return 1
++		if [ $withtap -eq "1" ]; then
++			fail "Kill sessions daemon"
++		fi
+ 	else
+ 		out=1
+ 		while [ -n "$out" ]; do
+@@ -342,10 +383,22 @@ function stop_lttng_sessiond ()
+ 			out=$(pidof $CONSUMERD_BIN)
+ 			sleep 0.5
+ 		done
+-		pass "Kill session daemon"
++		if [ $withtap -eq "1" ]; then
++			pass "Kill session daemon"
++		fi
+ 	fi
+ }
+ 
++function stop_lttng_sessiond()
++{
++	stop_lttng_sessiond_opt 1 "$@"
++}
++
++function stop_lttng_sessiond_notap()
++{
++	stop_lttng_sessiond_opt 0 "$@"
++}
++
+ function list_lttng_with_opts ()
+ {
+ 	local opts=$1
+-- 
+1.9.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
index 909acc3..175c889 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
@@ -29,6 +29,7 @@ SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.6 \
            file://run-ptest \
            file://lttng-tools-Fix-live-timer-calculation-error.patch \
            file://0001-Fix-sessiond-disable-match-app-event-by-name.patch \
+           file://Fix-regression-tests.patch \
 	  "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


