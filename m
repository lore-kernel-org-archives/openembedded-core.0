Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/2] lttng-tools: Upgrade 2.13.1 -> 2.13.2
Date: Sun, 19 Dec 2021 23:26:26 +0000
Message-Id: <20211219232626.940899-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20211219232626.940899-1-richard.purdie@linuxfoundation.org>
References: <20211219232626.940899-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

Drop backported patches.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...1-src-common-correct-header-location.patch |  41 ----
 ...0ba19aec78f36e301494a03f5678fcb6fbb4.patch | 218 ------------------
 ...46a03fbf31c19b85ec367dc2c3db56e6dbf7.patch | 113 ---------
 ...-tools_2.13.1.bb => lttng-tools_2.13.2.bb} |   5 +-
 4 files changed, 1 insertion(+), 376 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-src-common-correct-header-location.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/87250ba19aec78f36e301494a03f5678fcb6fbb4.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/8f0646a03fbf31c19b85ec367dc2c3db56e6dbf7.patch
 rename meta/recipes-kernel/lttng/{lttng-tools_2.13.1.bb => lttng-tools_2.13.2.bb} (96%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-src-common-correct-header-location.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-src-common-correct-header-location.patch
deleted file mode 100644
index 24fcce41cb0..00000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-src-common-correct-header-location.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 790ef313364d1f1efb6f283705bb324eea2979ba Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Sun, 5 Sep 2021 10:13:08 +0200
-Subject: [PATCH] src/common: correct header location
-
-sys/unistd.h is not guaranteed to exist, and does not with
-e.g. musl C library.
-
-Upstream-Status: Backport [http://git.lttng.org/?p=lttng-tools.git;a=commitdiff;h=8f14767d33f786d895e50633fb46b880249b6c54]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/common/kernel-probe.c    | 2 +-
- src/common/userspace-probe.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/common/kernel-probe.c b/src/common/kernel-probe.c
-index 2beb53f..44100bc 100644
---- a/src/common/kernel-probe.c
-+++ b/src/common/kernel-probe.c
-@@ -20,7 +20,7 @@
- #include <lttng/kernel-probe.h>
- #include <sys/stat.h>
- #include <sys/types.h>
--#include <sys/unistd.h>
-+#include <unistd.h>
- 
- static
- int lttng_kernel_probe_location_address_serialize(
-diff --git a/src/common/userspace-probe.c b/src/common/userspace-probe.c
-index 67b0ee6..66afc6f 100644
---- a/src/common/userspace-probe.c
-+++ b/src/common/userspace-probe.c
-@@ -20,7 +20,7 @@
- #include <lttng/userspace-probe-internal.h>
- #include <sys/stat.h>
- #include <sys/types.h>
--#include <sys/unistd.h>
-+#include <unistd.h>
- 
- static
- int lttng_userspace_probe_location_function_set_binary_fd_handle(
diff --git a/meta/recipes-kernel/lttng/lttng-tools/87250ba19aec78f36e301494a03f5678fcb6fbb4.patch b/meta/recipes-kernel/lttng/lttng-tools/87250ba19aec78f36e301494a03f5678fcb6fbb4.patch
deleted file mode 100644
index f4db4f86fed..00000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/87250ba19aec78f36e301494a03f5678fcb6fbb4.patch
+++ /dev/null
@@ -1,218 +0,0 @@
-Upstream-Status: Backport
-
-From 87250ba19aec78f36e301494a03f5678fcb6fbb4 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=A9r=C3=A9mie=20Galarneau?=
- <jeremie.galarneau@efficios.com>
-Date: Mon, 1 Nov 2021 15:43:55 -0400
-Subject: [PATCH] Fix: relayd: live: mishandled initial null trace chunk
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Observed issue
-==============
-
-As reported in #1323 (https://bugs.lttng.org/issues/1323), crashes of
-the relay daemon are observed when running the user space clear tests.
-
-The crash occurs with the following stack trace:
-  #0  0x000055fbb861d6ae in urcu_ref_get_unless_zero (ref=0x28) at /usr/local/include/urcu/ref.h:85
-  #1  lttng_trace_chunk_get (chunk=0x0) at trace-chunk.c:1836
-  #2  0x000055fbb86051e2 in make_viewer_streams (relay_session=relay_session@entry=0x7f6ea002d540, viewer_session=<optimized out>, seek_t=seek_t@entry=LTTNG_VIEWER_SEEK_BEGINNING, nb_total=nb_total@entry=0x7f6ea9607b00, nb_unsent=nb_unsent@entry=0x7f6ea9607aec, nb_created=nb_created@entry=0x7f6ea9607ae8, closed=<optimized out>) at live.c:405
-  #3  0x000055fbb86061d9 in viewer_get_new_streams (conn=0x7f6e94000fc0) at live.c:1155
-  #4  process_control (conn=0x7f6e94000fc0, recv_hdr=0x7f6ea9607af0) at live.c:2353
-  #5  thread_worker (data=<optimized out>) at live.c:2515
-  #6  0x00007f6eae86a609 in start_thread () from /lib/x86_64-linux-gnu/libpthread.so.0
-  #7  0x00007f6eae78f293 in clone () from /lib/x86_64-linux-gnu/libc.so.6
-
-The race window during which this occurs seems very small as it can take
-hours to reproduce this crash. However, a minimal reproducer could be
-identified, as stated in the bug report.
-
-Essentially, the same crash can be reproduced by attaching a live viewer
-to a session that has seen events being produced, been stopped and been
-cleared.
-
-Cause
-=====
-
-The crash occurs as an attempt is made to take a reference to a viewer
-session’s trace chunk as viewer streams are created. The crux of the
-problem is that the code doesn’t expect a viewer session’s trace chunk
-to be NULL.
-
-The viewer session’s current trace chunk is initially set, when a viewer
-attaches to the viewer session, to a copy the corresponding
-relay_session’s current trace chunk.
-
-A live session always attempts to "catch-up" to the newest available
-trace chunk. This means that when a viewer reaches the end of a trace
-chunk, the viewer session may not transition to the "next" one: it jumps
-to the most recent trace chunk available (the one being produced by the
-relay_session). Hence, if the producer performs multiple rotations
-before a viewer completes the consumption of a trace chunk, it will skip
-over those "intermediary" trace chunks.
-
-A viewer session updates its current trace chunk when:
-  1) new viewer streams are created,
-  2) a new index is requested,
-  3) metadata is requested.
-
-Hence, as a general principle, the viewer session will reference the
-most recent trace chunk available _even if its streams do not point to
-it_. It indicates which trace chunk viewer streams should transition to
-when the end of their current trace chunk is reached.
-
-The live code properly handles transitions to a null chunk. This can be
-verified by attaching a viewer to a live session, stopping the session,
-clearing it (thus entering a null trace chunk), and resuming tracing.
-
-The only issue is that the case where the first trace chunk of a viewer
-session is "null" (no active trace chunk) is mishandled in two places:
-  1) in make_viewer_streams(), where the crash is observed,
-  2) in viewer_get_metadata().
-
-Solution
-========
-
-In make_viewer_streams(), it is assumed that a viewer session will have
-a non-null trace chunk whenever a rotation is not ongoing. This is
-reflected by the fact that a reference is always acquired on the viewer
-session’s trace chunk.
-
-That code is one of the three places that can cause a viewer session’s
-trace chunk to be updated. We still want to update the viewer session to
-the most recently seen trace chunk (null, in this case). However, there
-is no reference to acquire and the trace chunk to use for the creation
-of the viewer stream is NULL. This is properly handled by
-viewer_stream_create().
-
-The second site to change is viewer_get_metadata() which doesn’t handle
-a viewer metadata stream not having an active trace chunk at all.
-Thankfully, the protocol allows us to express this condition by
-returning the LTTNG_VIEWER_NO_NEW_METADATA status code when a viewer
-metadata stream doesn’t have an open file and doesn’t have a current
-trace chunk.
-
-Surprisingly, this bug didn’t trigger in the case where a transition to
-a null chunk occurred _after_ attaching to a viewer session.
-
-This is because viewers will typically ask for metadata as a result of an
-LTTNG_VIEWER_FLAG_NEW_METADATA reply to the GET_NEXT_INDEX command. When
-a session is stopped and all data was consumed, this command returns
-that no new data is available, causing the viewers to wait and ask again
-later.
-
-However, when attaching, babeltrace2 (at least, and probably babeltrace 1.x)
-always asks for an initial segment of metadata before asking for an
-index.
-
-Known drawbacks
-===============
-
-None.
-
-Fixes: #1323
-
-Signed-off-by: Jérémie Galarneau <jeremie.galarneau@efficios.com>
-Change-Id: I516fca60755e6897f6b7170c12d706ef57ad61a5
----
- src/bin/lttng-relayd/live.c   | 47 ++++++++++++++++++++++++-----------
- src/bin/lttng-relayd/stream.h |  5 ++++
- 2 files changed, 38 insertions(+), 14 deletions(-)
-
-Index: lttng-tools-2.13.1/src/bin/lttng-relayd/live.c
-===================================================================
---- lttng-tools-2.13.1.orig/src/bin/lttng-relayd/live.c
-+++ lttng-tools-2.13.1/src/bin/lttng-relayd/live.c
-@@ -384,8 +384,6 @@ static int make_viewer_streams(struct re
- 						goto error_unlock;
- 					}
- 				} else {
--					bool reference_acquired;
--
- 					/*
- 					 * Transition the viewer session into the newest trace chunk available.
- 					 */
-@@ -402,11 +400,26 @@ static int make_viewer_streams(struct re
- 						}
- 					}
- 
--					reference_acquired = lttng_trace_chunk_get(
--							viewer_session->current_trace_chunk);
--					assert(reference_acquired);
--					viewer_stream_trace_chunk =
--							viewer_session->current_trace_chunk;
-+					if (relay_stream->trace_chunk) {
-+						/*
-+						 * If the corresponding relay
-+						 * stream's trace chunk is set,
-+						 * the viewer stream will be
-+						 * created under it.
-+						 *
-+						 * Note that a relay stream can
-+						 * have a NULL output trace
-+						 * chunk (for instance, after a
-+						 * clear against a stopped
-+						 * session).
-+						 */
-+						const bool reference_acquired = lttng_trace_chunk_get(
-+								viewer_session->current_trace_chunk);
-+
-+						assert(reference_acquired);
-+						viewer_stream_trace_chunk =
-+								viewer_session->current_trace_chunk;
-+					}
- 				}
- 
- 				viewer_stream = viewer_stream_create(
-@@ -2016,8 +2029,9 @@ int viewer_get_metadata(struct relay_con
- 		}
- 	}
- 
--	if (conn->viewer_session->current_trace_chunk !=
--			vstream->stream_file.trace_chunk) {
-+	if (conn->viewer_session->current_trace_chunk &&
-+			conn->viewer_session->current_trace_chunk !=
-+					vstream->stream_file.trace_chunk) {
- 		bool acquired_reference;
- 
- 		DBG("Viewer session and viewer stream chunk differ: "
-@@ -2034,11 +2048,16 @@ int viewer_get_metadata(struct relay_con
- 
- 	len = vstream->stream->metadata_received - vstream->metadata_sent;
- 
--	/*
--	 * Either this is the first time the metadata file is read, or a
--	 * rotation of the corresponding relay stream has occurred.
--	 */
--	if (!vstream->stream_file.handle && len > 0) {
-+	if (!vstream->stream_file.trace_chunk) {
-+		reply.status = htobe32(LTTNG_VIEWER_NO_NEW_METADATA);
-+		len = 0;
-+		goto send_reply;
-+	} else if (vstream->stream_file.trace_chunk &&
-+			!vstream->stream_file.handle && len > 0) {
-+		/*
-+		 * Either this is the first time the metadata file is read, or a
-+		 * rotation of the corresponding relay stream has occurred.
-+		 */
- 		struct fs_handle *fs_handle;
- 		char file_path[LTTNG_PATH_MAX];
- 		enum lttng_trace_chunk_status status;
-Index: lttng-tools-2.13.1/src/bin/lttng-relayd/stream.h
-===================================================================
---- lttng-tools-2.13.1.orig/src/bin/lttng-relayd/stream.h
-+++ lttng-tools-2.13.1/src/bin/lttng-relayd/stream.h
-@@ -174,6 +174,11 @@ struct relay_stream {
- 	/*
- 	 * The trace chunk to which the file currently being produced (if any)
- 	 * belongs.
-+	 *
-+	 * Note that a relay stream can have no output trace chunk. For
-+	 * instance, after a session stop followed by a session clear,
-+	 * streams will not have an output trace chunk until the session
-+	 * is resumed.
- 	 */
- 	struct lttng_trace_chunk *trace_chunk;
- 	LTTNG_OPTIONAL(struct relay_stream_rotation) ongoing_rotation;
diff --git a/meta/recipes-kernel/lttng/lttng-tools/8f0646a03fbf31c19b85ec367dc2c3db56e6dbf7.patch b/meta/recipes-kernel/lttng/lttng-tools/8f0646a03fbf31c19b85ec367dc2c3db56e6dbf7.patch
deleted file mode 100644
index db2fca03fe1..00000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/8f0646a03fbf31c19b85ec367dc2c3db56e6dbf7.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-Upstream-Status: Backport
-
-From 8f0646a03fbf31c19b85ec367dc2c3db56e6dbf7 Mon Sep 17 00:00:00 2001
-From: Francis Deslauriers <francis.deslauriers@efficios.com>
-Date: Mon, 25 Oct 2021 11:32:24 -0400
-Subject: [PATCH] Typo: occurences -> occurrences
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Signed-off-by: Francis Deslauriers <francis.deslauriers@efficios.com>
-Signed-off-by: Jérémie Galarneau <jeremie.galarneau@efficios.com>
-Change-Id: I719e26febd639f3b047b6aa6361fc6734088e871
----
- configure.ac                                             | 2 +-
- src/bin/lttng-relayd/live.c                              | 2 +-
- src/bin/lttng-sessiond/event-notifier-error-accounting.c | 2 +-
- src/bin/lttng-sessiond/ust-app.c                         | 2 +-
- tests/utils/utils.sh                                     | 8 ++++----
- 5 files changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 12cc7a17e..27148c105 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -253,7 +253,7 @@ AS_IF([test "x$libtool_fixup" = "xyes"],
- 	    [
- 	    libtool_m4="$srcdir/m4/libtool.m4"
- 	    libtool_flag_pattern=".*link_all_deplibs\s*,\s*\$1\s*)"
--	    AC_MSG_CHECKING([for occurence(s) of link_all_deplibs = no in $libtool_m4])
-+	    AC_MSG_CHECKING([for occurrence(s) of link_all_deplibs = no in $libtool_m4])
- 	    libtool_flag_pattern_count=$($GREP -c "$libtool_flag_pattern\s*=\s*no" $libtool_m4)
- 	    AS_IF([test $libtool_flag_pattern_count -ne 0],
- 	    [
-diff --git a/src/bin/lttng-relayd/live.c b/src/bin/lttng-relayd/live.c
-index 13078026b..42b0d947e 100644
---- a/src/bin/lttng-relayd/live.c
-+++ b/src/bin/lttng-relayd/live.c
-@@ -2036,7 +2036,7 @@ int viewer_get_metadata(struct relay_connection *conn)
- 
- 	/*
- 	 * Either this is the first time the metadata file is read, or a
--	 * rotation of the corresponding relay stream has occured.
-+	 * rotation of the corresponding relay stream has occurred.
- 	 */
- 	if (!vstream->stream_file.handle && len > 0) {
- 		struct fs_handle *fs_handle;
-diff --git a/src/bin/lttng-sessiond/event-notifier-error-accounting.c b/src/bin/lttng-sessiond/event-notifier-error-accounting.c
-index d3e3692f5..1488d801c 100644
---- a/src/bin/lttng-sessiond/event-notifier-error-accounting.c
-+++ b/src/bin/lttng-sessiond/event-notifier-error-accounting.c
-@@ -488,7 +488,7 @@ struct ust_error_accounting_entry *ust_error_accounting_entry_create(
- 	lttng_ust_ctl_destroy_counter(daemon_counter);
- error_create_daemon_counter:
- error_shm_alloc:
--	/* Error occured before per-cpu SHMs were handed-off to ustctl. */
-+	/* Error occurred before per-cpu SHMs were handed-off to ustctl. */
- 	if (cpu_counter_fds) {
- 		for (i = 0; i < entry->nr_counter_cpu_fds; i++) {
- 			if (cpu_counter_fds[i] < 0) {
-diff --git a/src/bin/lttng-sessiond/ust-app.c b/src/bin/lttng-sessiond/ust-app.c
-index b18988560..28c63e70c 100644
---- a/src/bin/lttng-sessiond/ust-app.c
-+++ b/src/bin/lttng-sessiond/ust-app.c
-@@ -1342,7 +1342,7 @@ static struct ust_app_event_notifier_rule *alloc_ust_app_event_notifier_rule(
- 	case LTTNG_EVENT_RULE_GENERATE_EXCLUSIONS_STATUS_NONE:
- 		break;
- 	default:
--		/* Error occured. */
-+		/* Error occurred. */
- 		ERR("Failed to generate exclusions from trigger while allocating an event notifier rule");
- 		goto error_put_trigger;
- 	}
-diff --git a/tests/utils/utils.sh b/tests/utils/utils.sh
-index e463e4fe3..42d99444f 100644
---- a/tests/utils/utils.sh
-+++ b/tests/utils/utils.sh
-@@ -1921,7 +1921,7 @@ function validate_trace
- 			pass "Validate trace for event $i, $traced events"
- 		else
- 			fail "Validate trace for event $i"
--			diag "Found $traced occurences of $i"
-+			diag "Found $traced occurrences of $i"
- 		fi
- 	done
- 	ret=$?
-@@ -1949,7 +1949,7 @@ function validate_trace_count
- 			pass "Validate trace for event $i, $traced events"
- 		else
- 			fail "Validate trace for event $i"
--			diag "Found $traced occurences of $i"
-+			diag "Found $traced occurrences of $i"
- 		fi
- 		cnt=$(($cnt + $traced))
- 	done
-@@ -1979,7 +1979,7 @@ function validate_trace_count_range_incl_min_excl_max
- 			pass "Validate trace for event $i, $traced events"
- 		else
- 			fail "Validate trace for event $i"
--			diag "Found $traced occurences of $i"
-+			diag "Found $traced occurrences of $i"
- 		fi
- 		cnt=$(($cnt + $traced))
- 	done
-@@ -2013,7 +2013,7 @@ function validate_trace_exp()
- 		pass "Validate trace for expression '${event_exp}', $traced events"
- 	else
- 		fail "Validate trace for expression '${event_exp}'"
--		diag "Found $traced occurences of '${event_exp}'"
-+		diag "Found $traced occurrences of '${event_exp}'"
- 	fi
- 	ret=$?
- 	return $ret
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.1.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.2.bb
similarity index 96%
rename from meta/recipes-kernel/lttng/lttng-tools_2.13.1.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.13.2.bb
index 7ae02d92d2d..d6ce2c7e32e 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.2.bb
@@ -36,13 +36,10 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://run-ptest \
            file://lttng-sessiond.service \
            file://determinism.patch \
-           file://0001-src-common-correct-header-location.patch \
-           file://8f0646a03fbf31c19b85ec367dc2c3db56e6dbf7.patch \
-           file://87250ba19aec78f36e301494a03f5678fcb6fbb4.patch \
            file://disable-tests.patch \
            "
 
-SRC_URI[sha256sum] = "cfe6df7da831fc07fd07ce46b442c2ec1074c167af73f3a1b1d2fba0c453c8b5"
+SRC_URI[sha256sum] = "ced2ba00020da77fd17ac92b5a53825502409a07e3aeca28f9515d4a844fd7bd"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
-- 
2.32.0

