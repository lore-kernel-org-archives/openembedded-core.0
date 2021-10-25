X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Date: Mon, 25 Oct 2021 20:28:25 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
Subject: Re: [OE-core] [PATCH] lttng-tools: upgrade 2.13.0 -> 2.13.1
Message-ID: <YXb3SXeWBzWvk7sY@piout.net>
References: <1635172017-18309-1-git-send-email-wangmy@fujitsu.com>
 <1635172017-18309-5-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1635172017-18309-5-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-id: <openembedded-core.lists.openembedded.org>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org

Hello,

I did fix it up but as this is the second time this is happening, I want
to let you know that git am fails while applying this patch:

error: cannot convert from y to UTF-8
fatal: could not parse patch

Indeed, the declared charset is y which isn't a thing. I think that what
happens is that you get to the following prompt:

The following files are 8bit, but do not declare a Content-Transfer-Encodin=
g.
something.patch
Which 8bit encoding should I declare [UTF-8]?

At that point, you probably pressed y but you should simply press enter.


On 25/10/2021 22:26:56+0800, wangmy wrote:
> 2021-10-18 lttng-tools 2.13.1 (National Chocolate Cupcake Day)
>  Fix: ust: app stuck on recv message during UST comm timeout scenario
>  Fix: ust: UST communication can return -EAGAIN
>  Fix: ust: segfault on lttng start on filter bytecode copy
>  Fix: sessiond: previously created channel cannot be enabled
>  Build fix: Missing message in LTTNG_DEPRECATED invocation
>  Fix: notification-thread: handling event from a removed tracer event src
>  include: add missing "extern"
>  include: remove spurious spaces in condition/session-rotation.h
>  tests: fix header of regression/ust/getcpu-override/run-getcpu-override
>  fix: wrong define used for GCC version check
>  Fix: userspace-probe: unreported error on string copy error
>  Fix: userspace-probe: truncating binary path for SDT
>  Fix: lttng: add-trigger: don't provide a default event rule type
>  Fix: statements with side-effects in assert statements
>  Fix: lttng_trace_archive_location_serialize is called on freed memory
>  Fix: sessiond: ust session is inactive during ust_app_global_update
>  Fix: common: error query for trigger action protocol error
>  Fix: common: un-hide two rate policy functions
>  Fix: include: remove unneeded declaration of lttng_session_descriptor_ge=
t_session_name
>  Fix: Tests: race condition in test_ns_contexts_change
>  Fix: Tests: race condition in test_event_tracker
>  Fix: man: lttng-rotate: trace file count/size limitation does not apply
>  Fix: runas: less-than-zero comparison of an unsigned value
>  Fix: runas: supplementary groups are ignored on lttng save
>  Docs: lttng-event-rule(7): --exclude does not exist, use --exclude-name
>  sessiond: logging typo: {triger, triggger} -> trigger
>  Fix: lttng: free sessions in cmd_destroy
>  Fix: lttng: free domains and channels in get_session_stats_str
>=20
> 0001-Fix-Tests-race-condition-in-test_event_tracker.patch
> 0002-Fix-Tests-race-condition-in-test_ns_contexts_change.patch
> are removed since they're included in 2.13.1
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...race-condition-in-test_event_tracker.patch | 221 ------------------
>  ...condition-in-test_ns_contexts_change.patch |  46 ----
>  ...-tools_2.13.0.bb =3D> lttng-tools_2.13.1.bb} |   4 +-
>  3 files changed, 1 insertion(+), 270 deletions(-)
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-Fix-Tests-=
race-condition-in-test_event_tracker.patch
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0002-Fix-Tests-=
race-condition-in-test_ns_contexts_change.patch
>  rename meta/recipes-kernel/lttng/{lttng-tools_2.13.0.bb =3D> lttng-tools=
_2.13.1.bb} (97%)
>=20
> diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-Tests-race-co=
ndition-in-test_event_tracker.patch b/meta/recipes-kernel/lttng/lttng-tools=
/0001-Fix-Tests-race-condition-in-test_event_tracker.patch
> deleted file mode 100644
> index 10020e1ecf..0000000000
> --- a/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-Tests-race-condition=
-in-test_event_tracker.patch
> +++ /dev/null
> @@ -1,221 +0,0 @@
> -From d3392e4850532c02e53e3c3ff1cc27df7e51c941 Mon Sep 17 00:00:00 2001
> -From: Francis Deslauriers <francis.deslauriers@efficios.com>
> -Date: Tue, 7 Sep 2021 17:10:31 -0400
> -Subject: [PATCH 1/2] Fix: Tests: race condition in test_event_tracker
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Background
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -The `test_event_tracker` file contains test cases when the event
> -generating app in executed in two distinct steps. Those two steps are
> -preparation and execution.
> -  1. the preparation is the launching the app in the background, and
> -  2. the execution is actually generating the event that should or
> -     should not be traced depending on the test case.
> -
> -This is useful to test the tracker feature since we want to ensure that
> -already running apps are notified properly when changing their tracking
> -status.
> -
> -Issue
> -=3D=3D=3D=3D=3D
> -The `test_event_vpid_track_untrack` test case suffers from a race
> -condition that is easy to reproduce on Yocto.
> -
> -The issue is that sometimes events are end up the trace when none is
> -expected.
> -
> -This is due to the absence of synchronization point at the launch of the
> -app which leads to the app being scheduled in-between the track-untrack
> -calls leading to events being recorded to the trace.
> -
> -It's easy to reproduce this issue on my machine by adding a `sleep 5`
> -between the track and untrack calls and setting the `NR_USEC_WAIT`
> -variable to 1.
> -
> -Fix
> -=3D=3D=3D
> -Using the testapp `--sync-before-last-event-touch` flag to make the app
> -create a file when all but the last event are executed. We then have the
> -app wait until we create a file (`--sync-before-last-event`) to generate
> -that last event. This way, we are sure no event will be generated when
> -running the track and untrack commands.
> -
> -Notes
> -=3D=3D=3D=3D=3D
> -- This issue affects other test cases in this file.
> -- This commit fixes a typo in the test header.
> -- This commit adds `diag` calls to help tracking to what test the output
> -  relates to when reading the log.
> -
> -Signed-off-by: Francis Deslauriers <francis.deslauriers@efficios.com>
> -Signed-off-by: J=E9r=E9mie Galarneau <jeremie.galarneau@efficios.com>
> -Change-Id: Ia2b68128dc9a805526f9748f31ec2c2d95566f31
> -Upstream-Status: Backport
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - .../tools/tracker/test_event_tracker          | 56 ++++++++++++++-----
> - 1 file changed, 42 insertions(+), 14 deletions(-)
> -
> -diff --git a/tests/regression/tools/tracker/test_event_tracker b/tests/r=
egression/tools/tracker/test_event_tracker
> -index feb3787..cc0f698 100755
> ---- a/tests/regression/tools/tracker/test_event_tracker
> -+++ b/tests/regression/tools/tracker/test_event_tracker
> -@@ -5,7 +5,7 @@
> - #
> - # SPDX-License-Identifier: GPL-2.0-only
> -
> --TEST_DESC=3D"LTTng - Event traker test"
> -+TEST_DESC=3D"LTTng - Event tracker test"
> -
> - CURDIR=3D$(dirname "$0")/
> - TESTDIR=3D"$CURDIR/../../.."
> -@@ -15,7 +15,7 @@ TESTAPP_KERNEL_NAME=3D"gen-kernel-test-events"
> - TESTAPP_BIN=3D"$TESTAPP_PATH/$TESTAPP_NAME/$TESTAPP_NAME"
> - TESTAPP_KERNEL_BIN=3D"$TESTAPP_PATH/$TESTAPP_KERNEL_NAME/$TESTAPP_KERNE=
L_NAME"
> - SESSION_NAME=3D"tracker"
> --NR_ITER=3D100
> -+NR_ITER=3D1
> - NUM_GLOBAL_TESTS=3D2
> - NUM_UST_TESTS=3D283
> - NUM_KERNEL_TESTS=3D462
> -@@ -30,27 +30,41 @@ SCRIPT_GROUPNAME=3D"$(id -gn)"
> -
> - CHILD_PID=3D-1
> - WAIT_PATH=3D
> --AFTER_FIRST_PATH=3D
> --BEFORE_LAST_PATH=3D
> -+TOUCH_BEFORE_LAST_PATH=3D
> -+SYNC_BEFORE_LAST_PATH=3D
> -
> - source $TESTDIR/utils/utils.sh
> -
> -+# Launch the testapp and execute it up until right before the last even=
t. It is
> -+# useful to do it in two seperate steps in order to test tracking and
> -+# untracking on an active app.
> - function prepare_ust_app
> - {
> --	AFTER_FIRST_PATH=3D$(mktemp --tmpdir -u tmp.${FUNCNAME[0]}_sync_after_=
first.XXXXXX)
> --	BEFORE_LAST_PATH=3D$(mktemp --tmpdir -u tmp.${FUNCNAME[0]}_sync_before=
_last.XXXXXX)
> -+	TOUCH_BEFORE_LAST_PATH=3D$(mktemp --tmpdir -u tmp.${FUNCNAME[0]}_touch=
_before_last.XXXXXX)
> -+	SYNC_BEFORE_LAST_PATH=3D$(mktemp --tmpdir -u tmp.${FUNCNAME[0]}_sync_b=
efore_last.XXXXXX)
> -+
> -+	$TESTAPP_BIN -i $NR_ITER -w $NR_USEC_WAIT \
> -+		--sync-before-last-event-touch "$TOUCH_BEFORE_LAST_PATH" \
> -+		--sync-before-last-event "$SYNC_BEFORE_LAST_PATH" &
> -
> --	$TESTAPP_BIN -i $NR_ITER -w $NR_USEC_WAIT -a "$AFTER_FIRST_PATH" -b "$=
BEFORE_LAST_PATH" &
> - 	CHILD_PID=3D$!
> -+
> -+	# Wait for the app to execute all the way to right before the last
> -+	# event.
> -+	while [ ! -f "${TOUCH_BEFORE_LAST_PATH}" ]; do
> -+		sleep 0.5
> -+	done
> - }
> -
> -+# Generate the last event.
> - function trace_ust_app
> - {
> --	touch "$BEFORE_LAST_PATH"
> --	wait
> -+	# Ask the test app to generate the last event.
> -+	touch "$SYNC_BEFORE_LAST_PATH"
> -+	wait "$CHILD_PID"
> - 	ok $? "Traced application stopped."
> --	rm "$BEFORE_LAST_PATH"
> --	rm "$AFTER_FIRST_PATH"
> -+	rm "$SYNC_BEFORE_LAST_PATH"
> -+	rm "$TOUCH_BEFORE_LAST_PATH"
> - }
> -
> - function prepare_kernel_app
> -@@ -64,7 +78,7 @@ function prepare_kernel_app
> - function trace_kernel_app
> - {
> - 	touch "$WAIT_PATH"
> --	wait
> -+	wait "$CHILD_PID"
> - 	ok $? "Traced application stopped."
> - 	rm "$WAIT_PATH"
> - }
> -@@ -78,6 +92,8 @@ function test_event_tracker()
> - 	local tracker=3D"$4"
> - 	local channel=3D''
> -
> -+	diag "${FUNCNAME[0]} $*"
> -+
> - 	trace_path=3D$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_path.XXXXXX)
> -
> - 	create_lttng_session_ok $SESSION_NAME "$trace_path"
> -@@ -117,6 +133,8 @@ function test_event_vpid_tracker()
> - 	local wildcard=3D"$3"
> - 	local channel=3D''
> -
> -+	diag "${FUNCNAME[0]} $*"
> -+
> - 	trace_path=3D$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_path.XXXXXX)
> -
> - 	create_lttng_session_ok $SESSION_NAME "$trace_path"
> -@@ -160,6 +178,8 @@ function test_event_pid_tracker()
> - 	local wildcard=3D"$3"
> - 	local channel=3D''
> -
> -+	diag "${FUNCNAME[0]} $*"
> -+
> - 	trace_path=3D$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_path.XXXXXX)
> -
> - 	create_lttng_session_ok $SESSION_NAME "$trace_path"
> -@@ -203,6 +223,8 @@ function test_event_tracker_fail()
> - 	local wildcard=3D"$2"
> - 	local tracker=3D"$3"
> -
> -+	diag "${FUNCNAME[0]} $*"
> -+
> - 	trace_path=3D$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_path.XXXXXX)
> -
> - 	create_lttng_session_ok $SESSION_NAME "$trace_path"
> -@@ -222,6 +244,8 @@ function test_event_track_untrack()
> - 	local tracker=3D"$4"
> - 	local channel=3D''
> -
> -+	diag "${FUNCNAME[0]} $*"
> -+
> - 	trace_path=3D$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_path.XXXXXX)
> -
> - 	create_lttng_session_ok $SESSION_NAME "$trace_path"
> -@@ -262,6 +286,8 @@ function test_event_vpid_track_untrack()
> - 	local wildcard=3D"$3"
> - 	local channel=3D''
> -
> -+	diag "${FUNCNAME[0]} $*"
> -+
> - 	trace_path=3D$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_path.XXXXXX)
> -
> - 	create_lttng_session_ok $SESSION_NAME "$trace_path"
> -@@ -302,6 +328,8 @@ function test_event_pid_track_untrack()
> - 	local wildcard=3D"$3"
> - 	local channel=3D''
> -
> -+	diag "${FUNCNAME[0]} $*"
> -+
> - 	trace_path=3D$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_path.XXXXXX)
> -
> - 	create_lttng_session_ok $SESSION_NAME "$trace_path"
> -@@ -336,9 +364,9 @@ function test_event_pid_track_untrack()
> -
> - function test_event_ust_vpid_untrack_snapshot()
> - {
> --	local trace_path=3D$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_path.=
XXXXXX)
> -+	diag "${FUNCNAME[0]} $*"
> -
> --	diag "Test_event_ust_vpid_untrack_snapshot"
> -+	local trace_path=3D$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_path.=
XXXXXX)
> -
> - 	create_lttng_session_ok $SESSION_NAME "$trace_path" "--snapshot"
> -
> ---
> -2.20.1
> -
> diff --git a/meta/recipes-kernel/lttng/lttng-tools/0002-Fix-Tests-race-co=
ndition-in-test_ns_contexts_change.patch b/meta/recipes-kernel/lttng/lttng-=
tools/0002-Fix-Tests-race-condition-in-test_ns_contexts_change.patch
> deleted file mode 100644
> index a8d983105a..0000000000
> --- a/meta/recipes-kernel/lttng/lttng-tools/0002-Fix-Tests-race-condition=
-in-test_ns_contexts_change.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From d284752e616dfc4c9288be3bb21c04ea78cdd967 Mon Sep 17 00:00:00 2001
> -From: Francis Deslauriers <francis.deslauriers@efficios.com>
> -Date: Wed, 8 Sep 2021 10:16:23 -0400
> -Subject: [PATCH 2/2] Fix: Tests: race condition in test_ns_contexts_chan=
ge
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Issue
> -=3D=3D=3D=3D=3D
> -The test script doesn't wait for the test application to complete before
> -stopping the tracing session. The race is that depending on the
> -scheduling the application is not always done generating events when the
> -session is stopped.
> -
> -Fix
> -=3D=3D=3D
> -Make the test script wait for the termination of the test app before
> -stopping the session.
> -
> -Signed-off-by: Francis Deslauriers <francis.deslauriers@efficios.com>
> -Signed-off-by: J=E9r=E9mie Galarneau <jeremie.galarneau@efficios.com>
> -Change-Id: I29d9b41d2a2ed60a6c42020509c2067442ae332c
> -Upstream-Status: Backport
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - tests/regression/ust/namespaces/test_ns_contexts_change | 3 +++
> - 1 file changed, 3 insertions(+)
> -
> -diff --git a/tests/regression/ust/namespaces/test_ns_contexts_change b/t=
ests/regression/ust/namespaces/test_ns_contexts_change
> -index c0af15e..8a4b62c 100755
> ---- a/tests/regression/ust/namespaces/test_ns_contexts_change
> -+++ b/tests/regression/ust/namespaces/test_ns_contexts_change
> -@@ -79,6 +79,9 @@ function test_ns()
> -
> - 	touch "$file_sync_before_last"
> -
> -+	# Wait for the test app to generate all expected events and exit.
> -+	wait $app_pid
> -+
> - 	# stop and destroy
> - 	stop_lttng_tracing_ok "$session_name"
> - 	destroy_lttng_session_ok "$session_name"
> ---
> -2.20.1
> -
> diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.0.bb b/meta/recip=
es-kernel/lttng/lttng-tools_2.13.1.bb
> similarity index 97%
> rename from meta/recipes-kernel/lttng/lttng-tools_2.13.0.bb
> rename to meta/recipes-kernel/lttng/lttng-tools_2.13.1.bb
> index 1491aff618..063d8e8c2d 100644
> --- a/meta/recipes-kernel/lttng/lttng-tools_2.13.0.bb
> +++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.1.bb
> @@ -37,11 +37,9 @@ SRC_URI =3D "https://lttng.org/files/lttng-tools/lttng=
-tools-${PV}.tar.bz2 \
>             file://lttng-sessiond.service \
>             file://determinism.patch \
>             file://0001-src-common-correct-header-location.patch \
> -           file://0001-Fix-Tests-race-condition-in-test_event_tracker.pa=
tch \
> -           file://0002-Fix-Tests-race-condition-in-test_ns_contexts_chan=
ge.patch \
>             "
>=20
> -SRC_URI[sha256sum] =3D "8dc894f9a7a840e943c1c344345c75f001a9529daa9157f1=
a0e6175c081c29e6"
> +SRC_URI[sha256sum] =3D "cfe6df7da831fc07fd07ce46b442c2ec1074c167af73f3a1=
b1d2fba0c453c8b5"
>=20
>  inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
>=20
> --
> 2.25.1
>=20

>=20
>=20
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
