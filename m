Return-Path: <joraj@efficios.com>
X-Greylist: delayed 558 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 03 Sep 2019 21:02:54 UTC
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id 34B6E7F2AF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 21:02:54 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id A962E2B54D2;
	Tue,  3 Sep 2019 16:53:37 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id lHbnm71kf2pL; Tue,  3 Sep 2019 16:53:36 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 690782B54CB;
	Tue,  3 Sep 2019 16:53:36 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 690782B54CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1567544016;
	bh=bfX8/yqva5b0T0NXUn0eYLBGDrdJULEFIt5pvXKoqyw=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=eUoCjT5rY25qabTN/2QAYRqfxjCw70vvp+rHHu+lw1lACBssWhZe8BgM2rLmY289m
	YK3RDjYPDZyXGyZpg63xhWaa9qhr+r1JtFRpx6ui0ziZY5fbrQJmObZN8DG+GnkhW3
	MMjPxENncDMHsUTRt4WzmIZJr4cuhwjs5MN1ssTFBQgX8wesbBQPN3lwO9LDouMb/k
	6EAlzfML7ImLCkPozgmQZC9R4peBCbdhPKgtFtQ0ebulCLHxaN97Ji9kt//DfnCQuL
	zcsM4sIcCJpKtkMVkbhm9E4t2AJ3Qdjxz2LkecW38a8cMkX6hvem13TeaGATWzo0X2
	G8x/GwJ+Bp/oA==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id 6Y9cDxIP8ACJ; Tue,  3 Sep 2019 16:53:36 -0400 (EDT)
Received: from mail02.efficios.com (mail02.efficios.com [167.114.142.138])
	by mail.efficios.com (Postfix) with ESMTP id 4483C2B54C1;
	Tue,  3 Sep 2019 16:53:36 -0400 (EDT)
Date: Tue, 3 Sep 2019 16:53:36 -0400 (EDT)
From: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
To: zhe he <zhe.he@windriver.com>
Message-ID: <1774382209.769.1567544016190.JavaMail.zimbra@efficios.com>
In-Reply-To: <1567480164-343138-1-git-send-email-zhe.he@windriver.com>
References: <1567480164-343138-1-git-send-email-zhe.he@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [167.114.142.138]
X-Mailer: Zimbra 8.8.15_GA_3829 (ZimbraWebClient - GC76 (Linux)/8.8.15_GA_3829)
Thread-Topic: lttng: babeltrace: Fix negative clock offset
Thread-Index: 1qgg+E2TnQi/vk9vknAe64wqiftvug==
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lttng: babeltrace: Fix negative clock offset
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
X-List-Received-Date: Tue, 03 Sep 2019 21:02:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

This patch breaks the API of stable-1.5. It is clearly mentioned in the commit message:

 It introduces API-breaking changes in the C and Python APIs, since we
 need to be able to return negative time values, which were previously
 used as errors (-1ULL).

You can have it in your layer but it should never be upstreamed to yocto/oe in any case for the stable 1.5 branch of babeltrace.

The change you are referencing (61cf588beae752e5ddfc60b6b5310f769ac9e852) is queued to be in Babeltrace 2.0.0.

Richard: as part of the lttng/babeltrace team I advice against using this patch in OE.

Cheers

----- Original Message -----
> From: "zhe he" <zhe.he@windriver.com>
> To: "openembedded-core" <openembedded-core@lists.openembedded.org>
> Sent: Monday, September 2, 2019 11:09:24 PM
> Subject: [OE-core] [PATCH] lttng: babeltrace: Fix negative clock offset

> From: He Zhe <zhe.he@windriver.com>
> 
> Backport a patch to fix negative clock offset with the following errors, when
> when using lttng to view traces.
> [error] ctf_clock_declaration_visit: unexpected unary expression for clock
> offset
> [error] ctf_visitor_construct_metadata: clock declaration error
> [error] Error in CTF metadata constructor -22
> 
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
> meta/recipes-kernel/lttng/babeltrace_1.5.7.bb      |   4 +-
> ...andle-negative-time-and-offset-from-Epoch.patch | 853 +++++++++++++++++++++
> 2 files changed, 856 insertions(+), 1 deletion(-)
> create mode 100644
> meta/recipes-kernel/lttng/files/0001-Handle-negative-time-and-offset-from-Epoch.patch
> 
> diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.7.bb
> b/meta/recipes-kernel/lttng/babeltrace_1.5.7.bb
> index 05ef6d0..4b9343d 100644
> --- a/meta/recipes-kernel/lttng/babeltrace_1.5.7.bb
> +++ b/meta/recipes-kernel/lttng/babeltrace_1.5.7.bb
> @@ -7,7 +7,9 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=76ba15dd76a248e1dd526bca0e2125fa"
> 
> DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
> 
> -SRC_URI =
> "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-1.5"
> +SRC_URI =
> "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-1.5 \
> +           file://0001-Handle-negative-time-and-offset-from-Epoch.patch \
> +          "
> SRCREV = "d4014aeef4b89a4aaab1af42d7b0d143d62da0ff"
> UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)$"
> 
> diff --git
> a/meta/recipes-kernel/lttng/files/0001-Handle-negative-time-and-offset-from-Epoch.patch
> b/meta/recipes-kernel/lttng/files/0001-Handle-negative-time-and-offset-from-Epoch.patch
> new file mode 100644
> index 0000000..f93fea7
> --- /dev/null
> +++
> b/meta/recipes-kernel/lttng/files/0001-Handle-negative-time-and-offset-from-Epoch.patch
> @@ -0,0 +1,853 @@
> +From d6480f9dc6a6f6536da6c3df59006ba67ef0f622 Mon Sep 17 00:00:00 2001
> +From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> +Date: Wed, 14 Aug 2019 13:24:31 +0800
> +Subject: [PATCH] Handle negative time and offset from Epoch
> +
> +Handle cases where a trace have a negative offset from Epoch.
> +If Epoch is arbitrary (e.g. embedded system starting at 0, without any
> +network access), the "0" can be used as correlation point between
> +various components, and some components could start before the
> +correlation point. Therefore, especially in traces where the time is
> +meant to be shown in nanoseconds or cycles from the correlation point,
> +it also makes sense to have a negative time value.
> +
> +It introduces API-breaking changes in the C and Python APIs, since we
> +need to be able to return negative time values, which were previously
> +used as errors (-1ULL).
> +
> +The --offset and --offset-ns command line parameters can now take
> +negative offset (seconds and nanoseconds) values too.
> +
> +The [sec.ns] format is used as fallback so we don't attempt to pass
> +a negative time value to POSIX time-formatting APIs.
> +
> +This also fixes an inaccurate return value in an error path of
> +bt_ctf_event_populate_event_header().
> +
> +Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers at efficios.com>
> +
> +Upstream-Status: Backport[61cf588beae752e5ddfc60b6b5310f769ac9e852]
> +
> +Signed-off-by: He Zhe <zhe.he@windriver.com>
> +---
> + converter/babeltrace.c                             |   4 +-
> + formats/ctf-text/ctf-text.c                        |   2 +-
> + formats/ctf/ctf.c                                  | 115 +++++++++++++++------
> + formats/ctf/events-private.h                       |  11 +-
> + formats/ctf/events.c                               |  11 +-
> + .../ctf/metadata/ctf-visitor-generate-io-struct.c  |   2 +-
> + include/babeltrace/babeltrace-internal.h           |   8 +-
> + include/babeltrace/clock-internal.h                |   2 +-
> + include/babeltrace/ctf-ir/clock-internal.h         |   2 +-
> + include/babeltrace/ctf/events.h                    |   8 +-
> + include/babeltrace/ctf/types.h                     |   6 +-
> + include/babeltrace/format.h                        |  10 +-
> + include/babeltrace/trace-handle-internal.h         |   8 +-
> + include/babeltrace/trace-handle.h                  |  25 +++--
> + lib/context.c                                      |  44 +++++---
> + lib/trace-handle.c                                 |  40 +++----
> + tests/lib/test_ctf_writer.c                        |   6 +-
> + tests/lib/test_seek.c                              |  26 ++---
> + 18 files changed, 209 insertions(+), 121 deletions(-)
> +
> +diff --git a/converter/babeltrace.c b/converter/babeltrace.c
> +index ef783ed..2ac1617 100644
> +--- a/converter/babeltrace.c
> ++++ b/converter/babeltrace.c
> +@@ -375,7 +375,7 @@ static int parse_options(int argc, char **argv)
> + 				goto end;
> + 			}
> + 			errno = 0;
> +-			opt_clock_offset = strtoull(str, &endptr, 0);
> ++			opt_clock_offset = strtoll(str, &endptr, 0);
> + 			if (*endptr != '\0' || str == endptr || errno != 0) {
> + 				fprintf(stderr, "[error] Incorrect --clock-offset argument: %s\n", str);
> + 				ret = -EINVAL;
> +@@ -400,7 +400,7 @@ static int parse_options(int argc, char **argv)
> + 				goto end;
> + 			}
> + 			errno = 0;
> +-			opt_clock_offset_ns = strtoull(str, &endptr, 0);
> ++			opt_clock_offset_ns = strtoll(str, &endptr, 0);
> + 			if (*endptr != '\0' || str == endptr || errno != 0) {
> + 				fprintf(stderr, "[error] Incorrect --clock-offset-ns argument: %s\n",
> str);
> + 				ret = -EINVAL;
> +diff --git a/formats/ctf-text/ctf-text.c b/formats/ctf-text/ctf-text.c
> +index 16f156d..e001a54 100644
> +--- a/formats/ctf-text/ctf-text.c
> ++++ b/formats/ctf-text/ctf-text.c
> +@@ -43,7 +43,7 @@
> + #include <unistd.h>
> + #include <stdlib.h>
> +
> +-#define NSEC_PER_SEC 1000000000ULL
> ++#define NSEC_PER_SEC 1000000000LL
> +
> + int opt_all_field_names,
> + 	opt_scope_field_names,
> +diff --git a/formats/ctf/ctf.c b/formats/ctf/ctf.c
> +index 980ebc9..f2d4c64 100644
> +--- a/formats/ctf/ctf.c
> ++++ b/formats/ctf/ctf.c
> +@@ -70,7 +70,7 @@
> +  */
> + #define WRITE_PACKET_LEN	(getpagesize() * 8 * CHAR_BIT)
> +
> +-#define NSEC_PER_SEC 1000000000ULL
> ++#define NSEC_PER_SEC 1000000000LL
> +
> + #define INDEX_PATH "./index/%s.idx"
> +
> +@@ -79,8 +79,8 @@ int opt_clock_cycles,
> + 	opt_clock_date,
> + 	opt_clock_gmt;
> +
> +-uint64_t opt_clock_offset;
> +-uint64_t opt_clock_offset_ns;
> ++int64_t opt_clock_offset;
> ++int64_t opt_clock_offset_ns;
> +
> + extern int yydebug;
> + char *opt_debug_info_dir;
> +@@ -114,11 +114,13 @@ void ctf_set_handle(struct bt_trace_descriptor
> *descriptor,
> + static
> + int ctf_close_trace(struct bt_trace_descriptor *descriptor);
> + static
> +-uint64_t ctf_timestamp_begin(struct bt_trace_descriptor *descriptor,
> +-		struct bt_trace_handle *handle, enum bt_clock_type type);
> ++int ctf_timestamp_begin(struct bt_trace_descriptor *descriptor,
> ++               struct bt_trace_handle *handle, enum bt_clock_type type,
> ++               int64_t *timestamp);
> + static
> +-uint64_t ctf_timestamp_end(struct bt_trace_descriptor *descriptor,
> +-		struct bt_trace_handle *handle, enum bt_clock_type type);
> ++int ctf_timestamp_end(struct bt_trace_descriptor *descriptor,
> ++               struct bt_trace_handle *handle, enum bt_clock_type type,
> ++               int64_t *timestamp);
> + static
> + int ctf_convert_index_timestamp(struct bt_trace_descriptor *tdp);
> +
> +@@ -167,17 +169,20 @@ void bt_ctf_hook(void)
> + }
> +
> + static
> +-uint64_t ctf_timestamp_begin(struct bt_trace_descriptor *descriptor,
> +-		struct bt_trace_handle *handle, enum bt_clock_type type)
> ++int ctf_timestamp_begin(struct bt_trace_descriptor *descriptor,
> ++               struct bt_trace_handle *handle, enum bt_clock_type type,
> ++               int64_t *timestamp)
> + {
> + 	struct ctf_trace *tin;
> +-	uint64_t begin = ULLONG_MAX;
> +-	int i, j;
> ++        int64_t begin = LLONG_MAX;
> ++        int i, j, ret;
> +
> + 	tin = container_of(descriptor, struct ctf_trace, parent);
> +
> +-	if (!tin)
> ++        if (!tin || !timestamp) {
> ++                ret = -EINVAL;
> + 		goto error;
> ++	}
> +
> + 	/* for each stream_class */
> + 	for (i = 0; i < tin->streams->len; i++) {
> +@@ -198,8 +203,10 @@ uint64_t ctf_timestamp_begin(struct bt_trace_descriptor
> *descriptor,
> + 					parent);
> + 			stream_pos = &cfs->pos;
> +
> +-			if (!stream_pos->packet_index)
> ++                        if (!stream_pos->packet_index) {
> ++                                ret = -EINVAL;
> + 				goto error;
> ++			}
> +
> + 			if (stream_pos->packet_index->len <= 0)
> + 				continue;
> +@@ -214,29 +221,38 @@ uint64_t ctf_timestamp_begin(struct bt_trace_descriptor
> *descriptor,
> + 				if (index->ts_cycles.timestamp_begin < begin)
> + 					begin = index->ts_cycles.timestamp_begin;
> + 			} else {
> ++				ret = -EINVAL;
> + 				goto error;
> + 			}
> + 		}
> + 	}
> +
> +-	return begin;
> ++        if (begin == LLONG_MAX) {
> ++                ret = -ENOENT;
> ++                goto error;
> ++        }
> ++        *timestamp = begin;
> ++        return 0;
> +
> + error:
> +-	return -1ULL;
> ++	return ret;
> + }
> +
> + static
> +-uint64_t ctf_timestamp_end(struct bt_trace_descriptor *descriptor,
> +-		struct bt_trace_handle *handle, enum bt_clock_type type)
> ++int ctf_timestamp_end(struct bt_trace_descriptor *descriptor,
> ++               struct bt_trace_handle *handle, enum bt_clock_type type,
> ++               int64_t *timestamp)
> + {
> + 	struct ctf_trace *tin;
> +-	uint64_t end = 0;
> +-	int i, j;
> ++        int64_t end = LLONG_MIN;
> ++        int i, j, ret;
> +
> + 	tin = container_of(descriptor, struct ctf_trace, parent);
> +
> +-	if (!tin)
> ++        if (!tin || !timestamp) {
> ++                ret = -EINVAL;
> + 		goto error;
> ++	}
> +
> + 	/* for each stream_class */
> + 	for (i = 0; i < tin->streams->len; i++) {
> +@@ -257,8 +273,10 @@ uint64_t ctf_timestamp_end(struct bt_trace_descriptor
> *descriptor,
> + 					parent);
> + 			stream_pos = &cfs->pos;
> +
> +-			if (!stream_pos->packet_index)
> ++                        if (!stream_pos->packet_index) {
> ++                                ret = -EINVAL;
> + 				goto error;
> ++			}
> +
> + 			if (stream_pos->packet_index->len <= 0)
> + 				continue;
> +@@ -273,15 +291,21 @@ uint64_t ctf_timestamp_end(struct bt_trace_descriptor
> *descriptor,
> + 				if (index->ts_cycles.timestamp_end > end)
> + 					end = index->ts_cycles.timestamp_end;
> + 			} else {
> ++				ret = -EINVAL;
> + 				goto error;
> + 			}
> + 		}
> + 	}
> +
> +-	return end;
> ++        if (end == LLONG_MIN) {
> ++                ret = -ENOENT;
> ++                goto error;
> ++        }
> ++        *timestamp = end;
> ++        return 0;
> +
> + error:
> +-	return -1ULL;
> ++	return ret;
> + }
> +
> + /*
> +@@ -328,7 +352,9 @@ void ctf_print_timestamp_real(FILE *fp,
> + 			struct ctf_stream_definition *stream,
> + 			uint64_t timestamp)
> + {
> +-	uint64_t ts_sec = 0, ts_nsec;
> ++        int64_t ts_sec = 0, ts_nsec;
> ++        uint64_t ts_sec_abs, ts_nsec_abs;
> ++        bool is_negative;
> +
> + 	ts_nsec = timestamp;
> +
> +@@ -341,9 +367,40 @@ void ctf_print_timestamp_real(FILE *fp,
> + 	ts_sec += ts_nsec / NSEC_PER_SEC;
> + 	ts_nsec = ts_nsec % NSEC_PER_SEC;
> +
> ++        if (ts_sec >= 0 && ts_nsec >= 0) {
> ++                is_negative = false;
> ++                ts_sec_abs = ts_sec;
> ++                ts_nsec_abs = ts_nsec;
> ++        } else if (ts_sec > 0 && ts_nsec < 0) {
> ++                is_negative = false;
> ++                ts_sec_abs = ts_sec - 1;
> ++                ts_nsec_abs = NSEC_PER_SEC + ts_nsec;
> ++        } else if (ts_sec == 0 && ts_nsec < 0) {
> ++                is_negative = true;
> ++                ts_sec_abs = ts_sec;
> ++                ts_nsec_abs = -ts_nsec;
> ++        } else if (ts_sec < 0 && ts_nsec > 0) {
> ++                is_negative = true;
> ++                ts_sec_abs = -(ts_sec + 1);
> ++                ts_nsec_abs = NSEC_PER_SEC - ts_nsec;
> ++        } else if (ts_sec < 0 && ts_nsec == 0) {
> ++                is_negative = true;
> ++                ts_sec_abs = -ts_sec;
> ++                ts_nsec_abs = ts_nsec;
> ++        } else {        /* (ts_sec < 0 && ts_nsec < 0) */
> ++                is_negative = true;
> ++                ts_sec_abs = -ts_sec;
> ++                ts_nsec_abs = -ts_nsec;
> ++        }
> ++
> + 	if (!opt_clock_seconds) {
> + 		struct tm tm;
> +-		time_t time_s = (time_t) ts_sec;
> ++                time_t time_s = (time_t) ts_sec_abs;
> ++
> ++                if (is_negative) {
> ++                        fprintf(stderr, "[warning] Fallback to [sec.ns] for
> printing negative time value. Use --clock-seconds.\n");
> ++                        goto seconds;
> ++                }
> +
> + 		if (!opt_clock_gmt) {
> + 			struct tm *res;
> +@@ -377,12 +434,12 @@ void ctf_print_timestamp_real(FILE *fp,
> + 		}
> + 		/* Print time in HH:MM:SS.ns */
> + 		fprintf(fp, "%02d:%02d:%02d.%09" PRIu64,
> +-			tm.tm_hour, tm.tm_min, tm.tm_sec, ts_nsec);
> ++			tm.tm_hour, tm.tm_min, tm.tm_sec, ts_nsec_abs);
> + 		goto end;
> + 	}
> + seconds:
> +-	fprintf(fp, "%3" PRIu64 ".%09" PRIu64,
> +-		ts_sec, ts_nsec);
> ++        fprintf(fp, "%s%" PRId64 ".%09" PRIu64,
> ++                is_negative ? "-" : "", ts_sec_abs, ts_nsec_abs);
> +
> + end:
> + 	return;
> +@@ -401,7 +458,7 @@ void ctf_print_timestamp_cycles(FILE *fp,
> +
> + void ctf_print_timestamp(FILE *fp,
> + 		struct ctf_stream_definition *stream,
> +-		uint64_t timestamp)
> ++		int64_t timestamp)
> + {
> + 	if (opt_clock_cycles) {
> + 		ctf_print_timestamp_cycles(fp, stream, timestamp);
> +diff --git a/formats/ctf/events-private.h b/formats/ctf/events-private.h
> +index 9bea75d..8acdcfa 100644
> +--- a/formats/ctf/events-private.h
> ++++ b/formats/ctf/events-private.h
> +@@ -35,20 +35,19 @@
> + #include <babeltrace/clock-internal.h>
> +
> + static inline
> +-uint64_t ctf_get_real_timestamp(struct ctf_stream_definition *stream,
> +-			uint64_t timestamp)
> ++int64_t ctf_get_real_timestamp(struct ctf_stream_definition *stream,
> ++                       uint64_t ts_cycles)
> + {
> +-	uint64_t ts_nsec;
> ++	int64_t ts_nsec;
> + 	struct ctf_trace *trace = stream->stream_class->trace;
> + 	struct trace_collection *tc = trace->parent.collection;
> +-	uint64_t tc_offset;
> ++	int64_t tc_offset;
> +
> + 	if (tc->clock_use_offset_avg)
> + 		tc_offset = tc->single_clock_offset_avg;
> + 	else
> + 		tc_offset = clock_offset_ns(trace->parent.single_clock);
> +-
> +-	ts_nsec = clock_cycles_to_ns(stream->current_clock, timestamp);
> ++	ts_nsec = clock_cycles_to_ns(stream->current_clock, ts_cycles);
> + 	ts_nsec += tc_offset;	/* Add offset */
> + 	return ts_nsec;
> + }
> +diff --git a/formats/ctf/events.c b/formats/ctf/events.c
> +index bd195b9..010b937 100644
> +--- a/formats/ctf/events.c
> ++++ b/formats/ctf/events.c
> +@@ -315,18 +315,19 @@ int bt_ctf_event_get_handle_id(const struct bt_ctf_event
> *ctf_event)
> + 	return ret;
> + }
> +
> +-uint64_t bt_ctf_get_timestamp(const struct bt_ctf_event *ctf_event)
> ++int bt_ctf_get_timestamp(const struct bt_ctf_event *ctf_event, int64_t
> *timestamp)
> + {
> + 	const struct ctf_event_definition *event;
> +
> +-	if (!ctf_event)
> +-		return -1ULL;
> ++        if (!ctf_event || !timestamp)
> ++                return -1;
> +
> + 	event = ctf_event->parent;
> + 	if (event && event->stream->has_timestamp)
> +-		return event->stream->real_timestamp;
> ++		*timestamp = event->stream->real_timestamp;
> + 	else
> +-		return -1ULL;
> ++		return -1;
> ++	return 0;
> + }
> +
> + uint64_t bt_ctf_get_cycles(const struct bt_ctf_event *ctf_event)
> +diff --git a/formats/ctf/metadata/ctf-visitor-generate-io-struct.c
> b/formats/ctf/metadata/ctf-visitor-generate-io-struct.c
> +index 8d348d6..036bb26 100644
> +--- a/formats/ctf/metadata/ctf-visitor-generate-io-struct.c
> ++++ b/formats/ctf/metadata/ctf-visitor-generate-io-struct.c
> +@@ -217,9 +217,9 @@ int get_unary_signed(struct bt_list_head *head, int64_t
> *value)
> + 	struct ctf_node *node;
> + 	int i = 0;
> +
> ++
> + 	bt_list_for_each_entry(node, head, siblings) {
> + 		if (node->type != NODE_UNARY_EXPRESSION
> +-				|| node->u.unary_expression.type != UNARY_UNSIGNED_CONSTANT
> + 				|| (node->u.unary_expression.type != UNARY_UNSIGNED_CONSTANT &&
> node->u.unary_expression.type != UNARY_SIGNED_CONSTANT)
> + 				|| node->u.unary_expression.link != UNARY_LINK_UNKNOWN
> + 				|| i != 0)
> +diff --git a/include/babeltrace/babeltrace-internal.h
> b/include/babeltrace/babeltrace-internal.h
> +index 6f8e200..3e137e4 100644
> +--- a/include/babeltrace/babeltrace-internal.h
> ++++ b/include/babeltrace/babeltrace-internal.h
> +@@ -178,8 +178,8 @@ struct trace_collection {
> + 	GPtrArray *array;	/* struct bt_trace_descriptor */
> + 	GHashTable *clocks;	/* struct ctf_clock */
> +
> +-	uint64_t single_clock_offset_avg;
> +-	uint64_t offset_first;
> ++	int64_t single_clock_offset_avg;
> ++	int64_t offset_first;
> + 	int64_t delta_offset_first_sum;
> + 	int offset_nr;
> + 	int clock_use_offset_avg;
> +@@ -208,8 +208,8 @@ extern int opt_all_field_names,
> + 	opt_clock_force_correlate,
> + 	opt_debug_info_full_path;
> +
> +-extern uint64_t opt_clock_offset;
> +-extern uint64_t opt_clock_offset_ns;
> ++extern int64_t opt_clock_offset;
> ++extern int64_t opt_clock_offset_ns;
> + extern int babeltrace_ctf_console_output;
> + extern char *opt_debug_info_dir;
> + extern char *opt_debug_info_target_prefix;
> +diff --git a/include/babeltrace/clock-internal.h
> b/include/babeltrace/clock-internal.h
> +index cd6bdba..86954b7 100644
> +--- a/include/babeltrace/clock-internal.h
> ++++ b/include/babeltrace/clock-internal.h
> +@@ -49,7 +49,7 @@ uint64_t clock_cycles_to_ns(struct ctf_clock *clock, uint64_t
> cycles)
> +  * mantissa.
> +  */
> + static inline
> +-uint64_t clock_offset_ns(struct ctf_clock *clock)
> ++int64_t clock_offset_ns(struct ctf_clock *clock)
> + {
> + 	return clock->offset_s * 1000000000ULL
> + 			+ clock_cycles_to_ns(clock, clock->offset);
> +diff --git a/include/babeltrace/ctf-ir/clock-internal.h
> b/include/babeltrace/ctf-ir/clock-internal.h
> +index 7567770..f1e896b 100644
> +--- a/include/babeltrace/ctf-ir/clock-internal.h
> ++++ b/include/babeltrace/ctf-ir/clock-internal.h
> +@@ -42,7 +42,7 @@ struct bt_ctf_clock {
> + 	uint64_t precision;
> + 	int64_t offset_s;	/* Offset in seconds */
> + 	int64_t offset;		/* Offset in ticks */
> +-	uint64_t value;		/* Current clock value */
> ++	int64_t value;		/* Current clock value */
> + 	uuid_t uuid;
> + 	int uuid_set;
> + 	int absolute;
> +diff --git a/include/babeltrace/ctf/events.h b/include/babeltrace/ctf/events.h
> +index c81d885..15830a3 100644
> +--- a/include/babeltrace/ctf/events.h
> ++++ b/include/babeltrace/ctf/events.h
> +@@ -109,10 +109,12 @@ const char *bt_ctf_event_name(const struct bt_ctf_event
> *event);
> + uint64_t bt_ctf_get_cycles(const struct bt_ctf_event *event);
> +
> + /*
> +- * bt_ctf_get_timestamp: returns the timestamp of the event offsetted
> +- * with the system clock source (in ns) or -1ULL on error
> ++ * bt_ctf_get_timestamp: get the timestamp of the event offsetted
> ++ * with the system clock source (in ns) in *timestamp.
> ++ *
> ++ * Return 0 on success, or -1ULL on error.
> +  */
> +-uint64_t bt_ctf_get_timestamp(const struct bt_ctf_event *event);
> ++int bt_ctf_get_timestamp(const struct bt_ctf_event *event, int64_t
> *timestamp);
> +
> + /*
> +  * bt_ctf_get_field_list: obtain the list of fields for compound type
> +diff --git a/include/babeltrace/ctf/types.h b/include/babeltrace/ctf/types.h
> +index 0bc003c..4b626b3 100644
> +--- a/include/babeltrace/ctf/types.h
> ++++ b/include/babeltrace/ctf/types.h
> +@@ -46,8 +46,8 @@
> + struct bt_stream_callbacks;
> +
> + struct packet_index_time {
> +-	uint64_t timestamp_begin;
> +-	uint64_t timestamp_end;
> ++	int64_t timestamp_begin;
> ++	int64_t timestamp_end;
> + };
> +
> + struct packet_index {
> +@@ -253,7 +253,7 @@ int ctf_pos_get_event(struct ctf_stream_pos *pos)
> + }
> +
> + void ctf_print_timestamp(FILE *fp, struct ctf_stream_definition *stream,
> +-			uint64_t timestamp);
> ++			int64_t timestamp);
> + int ctf_append_trace_metadata(struct bt_trace_descriptor *tdp,
> + 			FILE *metadata_fp);
> + void ctf_print_discarded_lost(FILE *fp, struct ctf_stream_definition *stream);
> +diff --git a/include/babeltrace/format.h b/include/babeltrace/format.h
> +index dea8e0e..bf33a23 100644
> +--- a/include/babeltrace/format.h
> ++++ b/include/babeltrace/format.h
> +@@ -73,10 +73,12 @@ struct bt_format {
> + 			struct bt_context *ctx);
> + 	void (*set_handle)(struct bt_trace_descriptor *descriptor,
> + 			struct bt_trace_handle *handle);
> +-	uint64_t (*timestamp_begin)(struct bt_trace_descriptor *descriptor,
> +-			struct bt_trace_handle *handle, enum bt_clock_type type);
> +-	uint64_t (*timestamp_end)(struct bt_trace_descriptor *descriptor,
> +-			struct bt_trace_handle *handle, enum bt_clock_type type);
> ++        int (*timestamp_begin)(struct bt_trace_descriptor *descriptor,
> ++                        struct bt_trace_handle *handle, enum bt_clock_type
> type,
> ++                        int64_t *timestamp);
> ++        int (*timestamp_end)(struct bt_trace_descriptor *descriptor,
> ++                        struct bt_trace_handle *handle, enum bt_clock_type
> type,
> ++                        int64_t *timestamp);
> + 	int (*convert_index_timestamp)(struct bt_trace_descriptor *descriptor);
> + };
> +
> +diff --git a/include/babeltrace/trace-handle-internal.h
> b/include/babeltrace/trace-handle-internal.h
> +index 5e9c1c6..924c730 100644
> +--- a/include/babeltrace/trace-handle-internal.h
> ++++ b/include/babeltrace/trace-handle-internal.h
> +@@ -46,10 +46,10 @@ struct bt_trace_handle {
> + 	struct bt_trace_descriptor *td;
> + 	struct bt_format *format;
> + 	char path[PATH_MAX];
> +-	uint64_t real_timestamp_begin;
> +-	uint64_t real_timestamp_end;
> +-	uint64_t cycles_timestamp_begin;
> +-	uint64_t cycles_timestamp_end;
> ++	int64_t real_timestamp_begin;
> ++	int64_t real_timestamp_end;
> ++	int64_t cycles_timestamp_begin;
> ++	int64_t cycles_timestamp_end;
> + };
> +
> + /*
> +diff --git a/include/babeltrace/trace-handle.h
> b/include/babeltrace/trace-handle.h
> +index 96e4a81..f6d7af8 100644
> +--- a/include/babeltrace/trace-handle.h
> ++++ b/include/babeltrace/trace-handle.h
> +@@ -53,20 +53,25 @@ struct bt_ctf_event;
> + const char *bt_trace_handle_get_path(struct bt_context *ctx, int handle_id);
> +
> + /*
> +- * bt_trace_handle_get_timestamp_begin : returns the creation time (in
> +- * nanoseconds or cycles depending on type) of the buffers of a trace
> +- * or -1ULL on error.
> ++ * bt_trace_handle_get_timestamp_begin : get the creation time (in
> ++ * nanoseconds or cycles depending on type) of the buffers of a trace.
> ++ *
> ++ * Returns 0 on success, -1 on error.
> +  */
> +-uint64_t bt_trace_handle_get_timestamp_begin(struct bt_context *ctx,
> +-		int handle_id, enum bt_clock_type type);
> ++int bt_trace_handle_get_timestamp_begin(struct bt_context *ctx,
> ++                int handle_id, enum bt_clock_type type,
> ++                int64_t *timestamp);
> +
> + /*
> +- * bt_trace_handle_get_timestamp_end : returns the destruction timestamp
> +- * (in nanoseconds or cycles depending on type) of the buffers of a trace
> +- * or -1ULL on error.
> ++ * bt_trace_handle_get_timestamp_end : get the destruction time
> ++ * (in nanoseconds or cycles depending on type) of the buffers of a
> ++ * trace.
> ++ *
> ++ * Returns 0 on success, -1 on error.
> +  */
> +-uint64_t bt_trace_handle_get_timestamp_end(struct bt_context *ctx,
> +-		int handle_id, enum bt_clock_type type);
> ++int bt_trace_handle_get_timestamp_end(struct bt_context *ctx,
> ++               int handle_id, enum bt_clock_type type,
> ++               int64_t *timestamp);
> +
> + /*
> +  * bt_ctf_event_get_handle_id : get the handle id associated with an event
> +diff --git a/lib/context.c b/lib/context.c
> +index 87901b3..34a1bc8 100644
> +--- a/lib/context.c
> ++++ b/lib/context.c
> +@@ -139,18 +139,38 @@ int bt_context_add_trace(struct bt_context *ctx, const
> char *path,
> + 			goto error_collection_del;
> + 	}
> +
> +-	if (fmt->timestamp_begin)
> +-		handle->real_timestamp_begin = fmt->timestamp_begin(td,
> +-				handle, BT_CLOCK_REAL);
> +-	if (fmt->timestamp_end)
> +-		handle->real_timestamp_end = fmt->timestamp_end(td, handle,
> +-				BT_CLOCK_REAL);
> +-	if (fmt->timestamp_begin)
> +-		handle->cycles_timestamp_begin = fmt->timestamp_begin(td,
> +-				handle, BT_CLOCK_CYCLES);
> +-	if (fmt->timestamp_end)
> +-		handle->cycles_timestamp_end = fmt->timestamp_end(td, handle,
> +-				BT_CLOCK_CYCLES);
> ++        if (fmt->timestamp_begin) {
> ++                ret = fmt->timestamp_begin(td, handle, BT_CLOCK_REAL,
> ++                                &handle->real_timestamp_begin);
> ++                if (ret < 0 && ret != -ENOENT) {
> ++                        ret = -1;
> ++                        goto error_collection_del;
> ++                }
> ++        }
> ++        if (fmt->timestamp_end) {
> ++                ret = fmt->timestamp_end(td, handle, BT_CLOCK_REAL,
> ++                                &handle->real_timestamp_end);
> ++                if (ret < 0 && ret != -ENOENT) {
> ++                        ret = -1;
> ++                        goto error_collection_del;
> ++                }
> ++        }
> ++        if (fmt->timestamp_begin) {
> ++                ret = fmt->timestamp_begin(td, handle, BT_CLOCK_CYCLES,
> ++                                &handle->cycles_timestamp_begin);
> ++                if (ret < 0 && ret != -ENOENT) {
> ++                        ret = -1;
> ++                        goto error_collection_del;
> ++                }
> ++        }
> ++        if (fmt->timestamp_end) {
> ++                ret = fmt->timestamp_end(td, handle, BT_CLOCK_CYCLES,
> ++                                &handle->cycles_timestamp_end);
> ++                if (ret < 0 && ret != -ENOENT) {
> ++                        ret = -1;
> ++                        goto error_collection_del;
> ++                }
> ++        }
> +
> + 	/* Add new handle to container */
> + 	g_hash_table_insert(ctx->trace_handles,
> +diff --git a/lib/trace-handle.c b/lib/trace-handle.c
> +index d5b906a..0fa7494 100644
> +--- a/lib/trace-handle.c
> ++++ b/lib/trace-handle.c
> +@@ -66,54 +66,56 @@ const char *bt_trace_handle_get_path(struct bt_context
> *ctx, int handle_id)
> + 	return handle->path;
> + }
> +
> +-uint64_t bt_trace_handle_get_timestamp_begin(struct bt_context *ctx,
> +-		int handle_id, enum bt_clock_type type)
> ++int bt_trace_handle_get_timestamp_begin(struct bt_context *ctx,
> ++               int handle_id, enum bt_clock_type type,
> ++               int64_t *timestamp)
> + {
> + 	struct bt_trace_handle *handle;
> +-	uint64_t ret;
> +-
> +-	if (!ctx)
> +-		return -1ULL;
> ++	int ret = 0;
> ++
> ++        if (!ctx || !timestamp)
> ++                return -1;
> +
> + 	handle = g_hash_table_lookup(ctx->trace_handles,
> + 			(gpointer) (unsigned long) handle_id);
> + 	if (!handle) {
> +-		ret = -1ULL;
> ++		ret = -1;
> + 		goto end;
> + 	}
> + 	if (type == BT_CLOCK_REAL) {
> +-		ret = handle->real_timestamp_begin;
> ++		*timestamp = handle->real_timestamp_begin;
> + 	} else if (type == BT_CLOCK_CYCLES) {
> +-		ret = handle->cycles_timestamp_begin;
> ++		*timestamp = handle->cycles_timestamp_begin;
> + 	} else {
> +-		ret = -1ULL;
> ++		ret = -1;
> + 	}
> +
> + end:
> + 	return ret;
> + }
> +
> +-uint64_t bt_trace_handle_get_timestamp_end(struct bt_context *ctx,
> +-		int handle_id, enum bt_clock_type type)
> ++int bt_trace_handle_get_timestamp_end(struct bt_context *ctx,
> ++               int handle_id, enum bt_clock_type type,
> ++               int64_t *timestamp)
> + {
> + 	struct bt_trace_handle *handle;
> +-	uint64_t ret;
> ++	int ret = 0;
> +
> +-	if (!ctx)
> +-		return -1ULL;
> ++        if (!ctx || !timestamp)
> ++                return -1;
> +
> + 	handle = g_hash_table_lookup(ctx->trace_handles,
> + 			(gpointer) (unsigned long) handle_id);
> + 	if (!handle) {
> +-		ret = -1ULL;
> ++		ret = -1;
> + 		goto end;
> + 	}
> + 	if (type == BT_CLOCK_REAL) {
> +-		ret = handle->real_timestamp_end;
> ++		*timestamp = handle->real_timestamp_end;
> + 	} else if (type == BT_CLOCK_CYCLES) {
> +-		ret = handle->cycles_timestamp_end;
> ++		*timestamp = handle->cycles_timestamp_end;
> + 	} else {
> +-		ret = -1ULL;
> ++		ret = -1;
> + 	}
> +
> + end:
> +diff --git a/tests/lib/test_ctf_writer.c b/tests/lib/test_ctf_writer.c
> +index 53613c9..29d76df 100644
> +--- a/tests/lib/test_ctf_writer.c
> ++++ b/tests/lib/test_ctf_writer.c
> +@@ -45,7 +45,7 @@
> + #define SEQUENCE_TEST_LENGTH 10
> + #define PACKET_RESIZE_TEST_LENGTH 100000
> +
> +-static uint64_t current_time;
> ++static int64_t current_time;
> +
> + void validate_metadata(char *parser_path, char *metadata_path)
> + {
> +@@ -695,8 +695,8 @@ int main(int argc, char **argv)
> + 	const char *clock_name = "test_clock";
> + 	const char *clock_description = "This is a test clock";
> + 	const uint64_t frequency = 1000000000;
> +-	const uint64_t offset_s = 1351530929945824323;
> +-	const uint64_t offset = 1234567;
> ++	const int64_t offset_s = 1351530929945824323;
> ++	const int64_t offset = 1234567;
> + 	const uint64_t precision = 10;
> + 	char *metadata_string;
> + 	struct bt_ctf_writer *writer;
> +diff --git a/tests/lib/test_seek.c b/tests/lib/test_seek.c
> +index 3c78e8a..81a72a2 100644
> +--- a/tests/lib/test_seek.c
> ++++ b/tests/lib/test_seek.c
> +@@ -33,7 +33,7 @@
> + #include <tap/tap.h>
> + #include "common.h"
> +
> +-#define NR_TESTS	29
> ++#define NR_TESTS	36
> +
> + void run_seek_begin(char *path, uint64_t expected_begin)
> + {
> +@@ -42,8 +42,8 @@ void run_seek_begin(char *path, uint64_t expected_begin)
> + 	struct bt_ctf_event *event;
> + 	struct bt_iter_pos newpos;
> + 	int ret;
> +-	uint64_t timestamp_begin;
> +-	uint64_t timestamp_seek_begin;
> ++	int64_t timestamp_begin;
> ++	int64_t timestamp_seek_begin;
> + 	unsigned int nr_seek_begin_test;
> +
> + 	nr_seek_begin_test = 5;
> +@@ -67,7 +67,7 @@ void run_seek_begin(char *path, uint64_t expected_begin)
> + 	ok(event, "Event valid");
> +
> + 	/* Validate that the first timestamp is right */
> +-	timestamp_begin = bt_ctf_get_timestamp(event);
> ++	ok1(bt_ctf_get_timestamp(event, &timestamp_begin) == 0);
> +
> + 	ok1(timestamp_begin == expected_begin);
> +
> +@@ -81,7 +81,7 @@ void run_seek_begin(char *path, uint64_t expected_begin)
> +
> + 	ok(event, "Event valid");
> +
> +-	timestamp_seek_begin = bt_ctf_get_timestamp(event);
> ++	ok1(bt_ctf_get_timestamp(event, &timestamp_seek_begin) == 0);
> +
> + 	ok1(timestamp_begin == timestamp_seek_begin);
> +
> +@@ -96,7 +96,7 @@ void run_seek_last(char *path, uint64_t expected_last)
> + 	struct bt_ctf_event *event;
> + 	struct bt_iter_pos newpos;
> + 	int ret;
> +-	uint64_t timestamp_last;
> ++	int64_t timestamp_last;
> + 	unsigned int nr_seek_last_tests;
> +
> + 	nr_seek_last_tests = 6;
> +@@ -129,7 +129,7 @@ void run_seek_last(char *path, uint64_t expected_last)
> +
> + 	ok(event, "Event valid at last position");
> +
> +-	timestamp_last = bt_ctf_get_timestamp(event);
> ++	ok1(bt_ctf_get_timestamp(event, &timestamp_last) == 0);
> +
> + 	ok1(timestamp_last == expected_last);
> +
> +@@ -152,7 +152,7 @@ void run_seek_time_at_last(char *path, uint64_t
> expected_last)
> + 	struct bt_ctf_event *event;
> + 	struct bt_iter_pos newpos;
> + 	int ret;
> +-	uint64_t timestamp_last;
> ++	int64_t timestamp_last;
> + 	unsigned int nr_seek_time_at_last_tests;
> +
> + 	nr_seek_time_at_last_tests = 6;
> +@@ -188,7 +188,7 @@ void run_seek_time_at_last(char *path, uint64_t
> expected_last)
> +
> + 	ok(event, "Event valid at last position");
> +
> +-	timestamp_last = bt_ctf_get_timestamp(event);
> ++	ok1(bt_ctf_get_timestamp(event, &timestamp_last) == 0);
> +
> + 	ok1(timestamp_last == expected_last);
> +
> +@@ -213,7 +213,7 @@ void run_seek_cycles(char *path,
> + 	struct bt_ctf_event *event;
> + 	struct bt_iter_pos newpos;
> + 	int ret;
> +-	uint64_t timestamp;
> ++	int64_t timestamp;
> +
> + 	unsigned int nr_seek_cycles_tests;
> +
> +@@ -247,7 +247,7 @@ void run_seek_cycles(char *path,
> +
> + 	ok(event, "Event valid at last position");
> +
> +-	timestamp = bt_ctf_get_timestamp(event);
> ++	ok1(bt_ctf_get_timestamp(event, &timestamp) == 0);
> +
> + 	ok1(timestamp == expected_last);
> +
> +@@ -270,7 +270,7 @@ void run_seek_cycles(char *path,
> +
> + 	ok(event, "Event valid at first position");
> +
> +-	timestamp = bt_ctf_get_timestamp(event);
> ++	ok1(bt_ctf_get_timestamp(event, &timestamp) == 0);
> +
> + 	ok1(timestamp == expected_begin);
> +
> +@@ -284,7 +284,7 @@ void run_seek_cycles(char *path,
> +
> + 	ok(event, "Event valid at last position");
> +
> +-	timestamp = bt_ctf_get_timestamp(event);
> ++	ok1(bt_ctf_get_timestamp(event, &timestamp) == 0);
> +
> + 	ok1(timestamp == expected_last);
> +
> +--
> +2.7.4
> +
> --
> 2.7.4
> 
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

