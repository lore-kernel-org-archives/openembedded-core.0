X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Anuj Mittal" <anuj.mittal@intel.com>
Subject: [honister][PATCH 20/37] lttng-tools: replace ad hoc ptest fixup with upstream fixes
Date: Tue, 26 Oct 2021 23:57:51 +0800
Message-Id: <e9613ecfcec8b606b05407b6199806df7ac18e9b.1635257336.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1635257336.git.anuj.mittal@intel.com>
References: <cover.1635257336.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 87fd3080c86f6987e4403a2cb8263564f6e1ac4f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...race-condition-in-test_event_tracker.patch | 221 ++++++++++++++++++
 ...more-before-analysing-traces-or-star.patch |  88 -------
 ...condition-in-test_ns_contexts_change.patch |  46 ++++
 .../lttng/lttng-tools_2.13.0.bb               |   3 +-
 4 files changed, 269 insertions(+), 89 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-Fix-Tests-race-condition-in-test_event_tracker.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-tests-wait-some-more-before-analysing-traces-or-star.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0002-Fix-Tests-race-condition-in-test_ns_contexts_change.patch

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-Tests-race-condition-in-test_event_tracker.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-Tests-race-condition-in-test_event_tracker.patch
new file mode 100644
index 0000000000..10020e1ecf
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-Tests-race-condition-in-test_event_tracker.patch
@@ -0,0 +1,221 @@
+From d3392e4850532c02e53e3c3ff1cc27df7e51c941 Mon Sep 17 00:00:00 2001
+From: Francis Deslauriers <francis.deslauriers@efficios.com>
+Date: Tue, 7 Sep 2021 17:10:31 -0400
+Subject: [PATCH 1/2] Fix: Tests: race condition in test_event_tracker
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Background
+==========
+The `test_event_tracker` file contains test cases when the event
+generating app in executed in two distinct steps. Those two steps are
+preparation and execution.
+  1. the preparation is the launching the app in the background, and
+  2. the execution is actually generating the event that should or
+     should not be traced depending on the test case.
+
+This is useful to test the tracker feature since we want to ensure that
+already running apps are notified properly when changing their tracking
+status.
+
+Issue
+=====
+The `test_event_vpid_track_untrack` test case suffers from a race
+condition that is easy to reproduce on Yocto.
+
+The issue is that sometimes events are end up the trace when none is
+expected.
+
+This is due to the absence of synchronization point at the launch of the
+app which leads to the app being scheduled in-between the track-untrack
+calls leading to events being recorded to the trace.
+
+It's easy to reproduce this issue on my machine by adding a `sleep 5`
+between the track and untrack calls and setting the `NR_USEC_WAIT`
+variable to 1.
+
+Fix
+===
+Using the testapp `--sync-before-last-event-touch` flag to make the app
+create a file when all but the last event are executed. We then have the
+app wait until we create a file (`--sync-before-last-event`) to generate
+that last event. This way, we are sure no event will be generated when
+running the track and untrack commands.
+
+Notes
+=====
+- This issue affects other test cases in this file.
+- This commit fixes a typo in the test header.
+- This commit adds `diag` calls to help tracking to what test the output
+  relates to when reading the log.
+
+Signed-off-by: Francis Deslauriers <francis.deslauriers@efficios.com>
+Signed-off-by: Jérémie Galarneau <jeremie.galarneau@efficios.com>
+Change-Id: Ia2b68128dc9a805526f9748f31ec2c2d95566f31
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ .../tools/tracker/test_event_tracker          | 56 ++++++++++++++-----
+ 1 file changed, 42 insertions(+), 14 deletions(-)
+
+diff --git a/tests/regression/tools/tracker/test_event_tracker b/tests/regression/tools/tracker/test_event_tracker
+index feb3787..cc0f698 100755
+--- a/tests/regression/tools/tracker/test_event_tracker
++++ b/tests/regression/tools/tracker/test_event_tracker
+@@ -5,7 +5,7 @@
+ #
+ # SPDX-License-Identifier: GPL-2.0-only
+ 
+-TEST_DESC="LTTng - Event traker test"
++TEST_DESC="LTTng - Event tracker test"
+ 
+ CURDIR=$(dirname "$0")/
+ TESTDIR="$CURDIR/../../.."
+@@ -15,7 +15,7 @@ TESTAPP_KERNEL_NAME="gen-kernel-test-events"
+ TESTAPP_BIN="$TESTAPP_PATH/$TESTAPP_NAME/$TESTAPP_NAME"
+ TESTAPP_KERNEL_BIN="$TESTAPP_PATH/$TESTAPP_KERNEL_NAME/$TESTAPP_KERNEL_NAME"
+ SESSION_NAME="tracker"
+-NR_ITER=100
++NR_ITER=1
+ NUM_GLOBAL_TESTS=2
+ NUM_UST_TESTS=283
+ NUM_KERNEL_TESTS=462
+@@ -30,27 +30,41 @@ SCRIPT_GROUPNAME="$(id -gn)"
+ 
+ CHILD_PID=-1
+ WAIT_PATH=
+-AFTER_FIRST_PATH=
+-BEFORE_LAST_PATH=
++TOUCH_BEFORE_LAST_PATH=
++SYNC_BEFORE_LAST_PATH=
+ 
+ source $TESTDIR/utils/utils.sh
+ 
++# Launch the testapp and execute it up until right before the last event. It is
++# useful to do it in two seperate steps in order to test tracking and
++# untracking on an active app.
+ function prepare_ust_app
+ {
+-	AFTER_FIRST_PATH=$(mktemp --tmpdir -u tmp.${FUNCNAME[0]}_sync_after_first.XXXXXX)
+-	BEFORE_LAST_PATH=$(mktemp --tmpdir -u tmp.${FUNCNAME[0]}_sync_before_last.XXXXXX)
++	TOUCH_BEFORE_LAST_PATH=$(mktemp --tmpdir -u tmp.${FUNCNAME[0]}_touch_before_last.XXXXXX)
++	SYNC_BEFORE_LAST_PATH=$(mktemp --tmpdir -u tmp.${FUNCNAME[0]}_sync_before_last.XXXXXX)
++
++	$TESTAPP_BIN -i $NR_ITER -w $NR_USEC_WAIT \
++		--sync-before-last-event-touch "$TOUCH_BEFORE_LAST_PATH" \
++		--sync-before-last-event "$SYNC_BEFORE_LAST_PATH" &
+ 
+-	$TESTAPP_BIN -i $NR_ITER -w $NR_USEC_WAIT -a "$AFTER_FIRST_PATH" -b "$BEFORE_LAST_PATH" &
+ 	CHILD_PID=$!
++
++	# Wait for the app to execute all the way to right before the last
++	# event.
++	while [ ! -f "${TOUCH_BEFORE_LAST_PATH}" ]; do
++		sleep 0.5
++	done
+ }
+ 
++# Generate the last event.
+ function trace_ust_app
+ {
+-	touch "$BEFORE_LAST_PATH"
+-	wait
++	# Ask the test app to generate the last event.
++	touch "$SYNC_BEFORE_LAST_PATH"
++	wait "$CHILD_PID"
+ 	ok $? "Traced application stopped."
+-	rm "$BEFORE_LAST_PATH"
+-	rm "$AFTER_FIRST_PATH"
++	rm "$SYNC_BEFORE_LAST_PATH"
++	rm "$TOUCH_BEFORE_LAST_PATH"
+ }
+ 
+ function prepare_kernel_app
+@@ -64,7 +78,7 @@ function prepare_kernel_app
+ function trace_kernel_app
+ {
+ 	touch "$WAIT_PATH"
+-	wait
++	wait "$CHILD_PID"
+ 	ok $? "Traced application stopped."
+ 	rm "$WAIT_PATH"
+ }
+@@ -78,6 +92,8 @@ function test_event_tracker()
+ 	local tracker="$4"
+ 	local channel=''
+ 
++	diag "${FUNCNAME[0]} $*"
++
+ 	trace_path=$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_path.XXXXXX)
+ 
+ 	create_lttng_session_ok $SESSION_NAME "$trace_path"
+@@ -117,6 +133,8 @@ function test_event_vpid_tracker()
+ 	local wildcard="$3"
+ 	local channel=''
+ 
++	diag "${FUNCNAME[0]} $*"
++
+ 	trace_path=$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_path.XXXXXX)
+ 
+ 	create_lttng_session_ok $SESSION_NAME "$trace_path"
+@@ -160,6 +178,8 @@ function test_event_pid_tracker()
+ 	local wildcard="$3"
+ 	local channel=''
+ 
++	diag "${FUNCNAME[0]} $*"
++
+ 	trace_path=$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_path.XXXXXX)
+ 
+ 	create_lttng_session_ok $SESSION_NAME "$trace_path"
+@@ -203,6 +223,8 @@ function test_event_tracker_fail()
+ 	local wildcard="$2"
+ 	local tracker="$3"
+ 
++	diag "${FUNCNAME[0]} $*"
++
+ 	trace_path=$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_path.XXXXXX)
+ 
+ 	create_lttng_session_ok $SESSION_NAME "$trace_path"
+@@ -222,6 +244,8 @@ function test_event_track_untrack()
+ 	local tracker="$4"
+ 	local channel=''
+ 
++	diag "${FUNCNAME[0]} $*"
++
+ 	trace_path=$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_path.XXXXXX)
+ 
+ 	create_lttng_session_ok $SESSION_NAME "$trace_path"
+@@ -262,6 +286,8 @@ function test_event_vpid_track_untrack()
+ 	local wildcard="$3"
+ 	local channel=''
+ 
++	diag "${FUNCNAME[0]} $*"
++
+ 	trace_path=$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_path.XXXXXX)
+ 
+ 	create_lttng_session_ok $SESSION_NAME "$trace_path"
+@@ -302,6 +328,8 @@ function test_event_pid_track_untrack()
+ 	local wildcard="$3"
+ 	local channel=''
+ 
++	diag "${FUNCNAME[0]} $*"
++
+ 	trace_path=$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_path.XXXXXX)
+ 
+ 	create_lttng_session_ok $SESSION_NAME "$trace_path"
+@@ -336,9 +364,9 @@ function test_event_pid_track_untrack()
+ 
+ function test_event_ust_vpid_untrack_snapshot()
+ {
+-	local trace_path=$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_path.XXXXXX)
++	diag "${FUNCNAME[0]} $*"
+ 
+-	diag "Test_event_ust_vpid_untrack_snapshot"
++	local trace_path=$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_path.XXXXXX)
+ 
+ 	create_lttng_session_ok $SESSION_NAME "$trace_path" "--snapshot"
+ 
+-- 
+2.20.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-wait-some-more-before-analysing-traces-or-star.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-wait-some-more-before-analysing-traces-or-star.patch
deleted file mode 100644
index c4cac9cc58..0000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-wait-some-more-before-analysing-traces-or-star.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From 8d9daede0882d239b0a47b0f7a6db68ba4934a7d Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Sat, 4 Sep 2021 13:57:39 +0200
-Subject: [PATCH] tests: wait some more before analysing traces or starting
- tracing
-
-Otherwise, there are sporadic race failures where lttng tracing
-is stopped before all expected events are collected or is started too soon, e.g.:
-
-PASS: tools/tracker/test_event_tracker 205 - Traced application stopped.
-PASS: tools/tracker/test_event_tracker 206 - Stop lttng tracing for session
-PASS: tools/tracker/test_event_tracker 207 - Destroy session tracker
-FAIL: tools/tracker/test_event_tracker 208 - Validate empty trace
-
-PASS: ust/namespaces/test_ns_contexts_change 42 - Stop lttng tracing for session mnt_ns
-PASS: ust/namespaces/test_ns_contexts_change 43 - Destroy session mnt_ns
-PASS: ust/namespaces/test_ns_contexts_change 44 - Wait after kill session daemon
-PASS: ust/namespaces/test_ns_contexts_change 45 - Validate trace for event mnt_ns = 4026531840, 1000 events
-PASS: ust/namespaces/test_ns_contexts_change 46 - Read a total of 1000 events, expected 1000
-PASS: ust/namespaces/test_ns_contexts_change 47 - Validate trace for event mnt_ns = 4026532303, 233 events
-FAIL: ust/namespaces/test_ns_contexts_change 48 - Read a total of 233 events, expected 1000
-
-This is a hack; issue should be fixed upstream with explicit syncs.
-It has been reported here: https://bugs.lttng.org/issues/1217
-
-Upstream-Status: Inappropriate [needs a real fix]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- tests/regression/tools/tracker/test_event_tracker       | 8 ++++++++
- tests/regression/ust/namespaces/test_ns_contexts_change | 2 ++
- 2 files changed, 10 insertions(+)
-
-diff --git a/tests/regression/tools/tracker/test_event_tracker b/tests/regression/tools/tracker/test_event_tracker
-index feb3787..a0f2257 100755
---- a/tests/regression/tools/tracker/test_event_tracker
-+++ b/tests/regression/tools/tracker/test_event_tracker
-@@ -130,6 +130,8 @@ function test_event_vpid_tracker()
- 
- 	prepare_"$domain"_app
- 
-+sleep 5
-+
- 	start_lttng_tracing_ok
- 
- 	if [ "$expect_event" -eq 1 ]; then
-@@ -173,6 +175,8 @@ function test_event_pid_tracker()
- 
- 	prepare_"$domain"_app
- 
-+sleep 5
-+
- 	start_lttng_tracing_ok
- 
- 	if [ "$expect_event" -eq 1 ]; then
-@@ -275,6 +279,8 @@ function test_event_vpid_track_untrack()
- 
- 	prepare_"$domain"_app
- 
-+sleep 5
-+
- 	start_lttng_tracing_ok
- 
- 	lttng_track_"$domain"_ok "--vpid ${CHILD_PID}"
-@@ -315,6 +321,8 @@ function test_event_pid_track_untrack()
- 
- 	prepare_"$domain"_app
- 
-+sleep 5
-+
- 	start_lttng_tracing_ok
- 
- 	lttng_track_"$domain"_ok "--pid ${CHILD_PID}"
-diff --git a/tests/regression/ust/namespaces/test_ns_contexts_change b/tests/regression/ust/namespaces/test_ns_contexts_change
-index c0af15e..b111bfe 100755
---- a/tests/regression/ust/namespaces/test_ns_contexts_change
-+++ b/tests/regression/ust/namespaces/test_ns_contexts_change
-@@ -79,6 +79,8 @@ function test_ns()
- 
- 	touch "$file_sync_before_last"
- 
-+sleep 5
-+
- 	# stop and destroy
- 	stop_lttng_tracing_ok "$session_name"
- 	destroy_lttng_session_ok "$session_name"
--- 
-2.20.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-tools/0002-Fix-Tests-race-condition-in-test_ns_contexts_change.patch b/meta/recipes-kernel/lttng/lttng-tools/0002-Fix-Tests-race-condition-in-test_ns_contexts_change.patch
new file mode 100644
index 0000000000..a8d983105a
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/0002-Fix-Tests-race-condition-in-test_ns_contexts_change.patch
@@ -0,0 +1,46 @@
+From d284752e616dfc4c9288be3bb21c04ea78cdd967 Mon Sep 17 00:00:00 2001
+From: Francis Deslauriers <francis.deslauriers@efficios.com>
+Date: Wed, 8 Sep 2021 10:16:23 -0400
+Subject: [PATCH 2/2] Fix: Tests: race condition in test_ns_contexts_change
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Issue
+=====
+The test script doesn't wait for the test application to complete before
+stopping the tracing session. The race is that depending on the
+scheduling the application is not always done generating events when the
+session is stopped.
+
+Fix
+===
+Make the test script wait for the termination of the test app before
+stopping the session.
+
+Signed-off-by: Francis Deslauriers <francis.deslauriers@efficios.com>
+Signed-off-by: Jérémie Galarneau <jeremie.galarneau@efficios.com>
+Change-Id: I29d9b41d2a2ed60a6c42020509c2067442ae332c
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ tests/regression/ust/namespaces/test_ns_contexts_change | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/tests/regression/ust/namespaces/test_ns_contexts_change b/tests/regression/ust/namespaces/test_ns_contexts_change
+index c0af15e..8a4b62c 100755
+--- a/tests/regression/ust/namespaces/test_ns_contexts_change
++++ b/tests/regression/ust/namespaces/test_ns_contexts_change
+@@ -79,6 +79,9 @@ function test_ns()
+ 
+ 	touch "$file_sync_before_last"
+ 
++	# Wait for the test app to generate all expected events and exit.
++	wait $app_pid
++
+ 	# stop and destroy
+ 	stop_lttng_tracing_ok "$session_name"
+ 	destroy_lttng_session_ok "$session_name"
+-- 
+2.20.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.0.bb
index 47cab42fcf..1491aff618 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.0.bb
@@ -37,7 +37,8 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://lttng-sessiond.service \
            file://determinism.patch \
            file://0001-src-common-correct-header-location.patch \
-           file://0001-tests-wait-some-more-before-analysing-traces-or-star.patch \
+           file://0001-Fix-Tests-race-condition-in-test_event_tracker.patch \
+           file://0002-Fix-Tests-race-condition-in-test_ns_contexts_change.patch \
            "
 
 SRC_URI[sha256sum] = "8dc894f9a7a840e943c1c344345c75f001a9529daa9157f1a0e6175c081c29e6"
-- 
2.31.1

